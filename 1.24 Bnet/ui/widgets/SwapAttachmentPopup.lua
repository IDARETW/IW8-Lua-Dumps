module(..., package.seeall)

local var_0_0 = 99 * _1080p

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.weaponPlayerData)
	assert(arg_1_2.attachToReplaceWith)
	assert(arg_1_0.SwapAttachButtons)
	assert(arg_1_0.Instructions)
	assert(arg_1_0.ChosenAttachment.Image)
	assert(arg_1_0.ChosenAttachment.Category)
	assert(arg_1_0.ChosenAttachment.Name)
	ACTIONS.AnimateSequence(arg_1_0.WeaponAttributes, "Gunsmith")

	local var_1_0 = arg_1_2.weaponPlayerData.weapon:get()
	local var_1_1 = ATTACHMENT.GetRef(arg_1_2.attachToReplaceWith, var_1_0)
	local var_1_2 = ATTACHMENT.GetName(var_1_1)
	local var_1_3 = ATTACHMENT.GetCategory(var_1_1)
	local var_1_4 = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(var_1_3))
	local var_1_5 = WEAPON.GenerateWeaponTable(arg_1_2.weaponPlayerData)

	arg_1_0.Instructions:setText(Engine.CBBHFCGDIC("CAS/ATTACHMENT_SWAP_INSTRUCTIONS", ToUpperCase(ATTACHMENT.GetName(var_1_1))))
	arg_1_0.ChosenAttachment.Image:setImage(RegisterMaterial(ATTACHMENT.GetImage(var_1_1)))
	ACTIONS.AnimateSequence(arg_1_0.ChosenAttachment, "Swap")
	arg_1_0.ChosenCategory:setText(var_1_4)
	arg_1_0.ChosenName:setText(ToUpperCase(var_1_2))

	local var_1_6 = ATTACHMENT.GetModifierInfo(var_1_1)

	arg_1_0.ModifiersList:SetupMods(var_1_6)

	local var_1_7 = LAYOUT.GetElementWidth(arg_1_0.ChosenAttachment)
	local var_1_8 = {}

	for iter_1_0, iter_1_1 in ddlpairs(arg_1_2.weaponPlayerData.attachmentSetup) do
		local var_1_9 = iter_1_1.attachment:get()

		if var_1_9 ~= ATTACHMENT.none then
			table.insert(var_1_8, var_1_9)
		end
	end

	arg_1_0.SwapAttachButtons:SetNumChildren(0)
	arg_1_0.SwapAttachButtons:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.SwapAttachButtons:GetContentIndex(arg_2_1, arg_2_2)

		arg_2_0:Setup(var_1_8[var_2_0 + 1], var_1_0)
	end)
	arg_1_0.SwapAttachButtons:SetNumChildren(#var_1_8)
	arg_1_0.SwapAttachButtons:RefreshContent()
	arg_1_0:registerEventHandler("equip_attachment", function(arg_3_0, arg_3_1)
		local var_3_0

		for iter_3_0, iter_3_1 in ddlpairs(arg_1_2.weaponPlayerData.attachmentSetup) do
			if iter_3_1.attachment:get() == arg_3_1.ref then
				var_3_0 = iter_3_0 + 1

				break
			end
		end

		assert(var_3_0)
		DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_3_0, arg_1_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)

		local var_3_1 = var_1_5.attachments[var_3_0] and var_1_5.attachments[var_3_0].ref
		local var_3_2 = var_1_5.attachments[var_3_0] and var_1_5.attachments[var_3_0].variantID

		table.insert(arg_1_2.menusToLeave, arg_3_0.id)
		GUNSMITH.EquipAttachment(arg_3_0, arg_1_1, arg_1_2.attachToReplaceWith, arg_1_2.weaponPlayerData, {
			menusToLeave = arg_1_2.menusToLeave,
			attachSlot = var_3_0,
			isNewAttachment = arg_1_2.attachToReplaceWith ~= var_3_1,
			variantID = arg_1_2.variantID,
			lootID = arg_1_2.lootID,
			isNewVariantID = arg_1_2.variantID ~= var_3_2 or ATTACHMENT.GetBaseRef(arg_1_2.attachToReplaceWith) ~= ATTACHMENT.GetBaseRef(var_3_1)
		})

		if CONDITIONS.IsWaveGameType() then
			Engine.BJDBIAGIDA("ui_select_purchase_confirm")
			CP.CurrencySubtract(arg_1_1, arg_1_2.survivalCost)
			Engine.EBHIFJCGBH("attachment_purchased", arg_1_2.survivalCost)
		end

		DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_3_0, arg_1_1, DYN_ATTACHMENT.StreamedImageAction.ADD)

		return true
	end)
	arg_1_0:registerEventHandler("preview_attachment", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_1_0.SwapAttachButtons:GetFocusPositionIndex()
		local var_4_1 = 512 * _1080p + var_4_0 * (var_0_0 + var_1_7)
		local var_4_2 = var_4_1 + var_1_7

		if CONDITIONS.IsSplitscreen(arg_1_0) and CONDITIONS.InGame(arg_1_0) then
			arg_1_0.ChosenAttachment:SetAnchorsAndPosition(0, 1, 0, 1, var_4_1, var_4_2, _1080p * 300, _1080p * 400)
		else
			arg_1_0.ChosenAttachment:SetAnchorsAndPosition(0, 1, 0, 1, var_4_1, var_4_2, _1080p * 516, _1080p * 616)
		end

		local var_4_3 = LUI.DeepCopy(var_1_5)
		local var_4_4 = var_4_3.attachments
		local var_4_5 = arg_4_1.ref

		for iter_4_0, iter_4_1 in ipairs(var_4_4) do
			if iter_4_1.ref == var_4_5 then
				iter_4_1.ref = var_1_1
			end
		end

		var_4_3.attachments = var_4_4

		arg_1_0.WeaponAttributes:Setup(var_4_3)
	end)

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.Darkener)

	if CONDITIONS.IsSplitscreen(arg_1_0) and CONDITIONS.InGame(arg_1_0) then
		ACTIONS.AnimateSequence(arg_1_0, "Splitscreen")
	end
end

function SwapAttachmentPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "SwapAttachmentPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.8, 0)
	var_5_4:SetScale(1, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 147, _1080p * 933)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "DoubleNotchedBacker"

	var_5_8:SetAlpha(0.5, 0)
	var_5_8.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -449, _1080p * 449, _1080p * 640, _1080p * 904)
	var_5_0:addElement(var_5_8)

	var_5_0.DoubleNotchedBacker = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "SwapAttachment"

	var_5_10:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_5_10:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/SWAP_ATTACHMENT")), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -467, _1080p * 467, _1080p * 163, _1080p * 223)
	var_5_0:addElement(var_5_10)

	var_5_0.SwapAttachment = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "ButtonHelperBar"

	var_5_12.Background:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 933, _1080p * 993)
	var_5_0:addElement(var_5_12)

	var_5_0.ButtonHelperBar = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "Instructions"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("CAS/CHOOSE_SWAP"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -449, _1080p * 449, _1080p * 237, _1080p * 257)
	var_5_0:addElement(var_5_14)

	var_5_0.Instructions = var_5_14

	local var_5_15
	local var_5_16 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SwapAttachButton", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 99,
		spacingY = _1080p * 99,
		columnWidth = _1080p * 100,
		rowHeight = _1080p * 100,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_17 = LUI.UIGrid.new(var_5_16)

	var_5_17.id = "SwapAttachButtons"

	var_5_17:setUseStencil(false)
	var_5_17:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 524, _1080p * -524, _1080p * 301, _1080p * 465)
	var_5_0:addElement(var_5_17)

	var_5_0.SwapAttachButtons = var_5_17

	local var_5_18
	local var_5_19 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_5_1
	})

	var_5_19.id = "WeaponAttributes"

	var_5_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -432, _1080p * -20, _1080p * 719, _1080p * 879)
	var_5_0:addElement(var_5_19)

	var_5_0.WeaponAttributes = var_5_19

	local var_5_20
	local var_5_21 = MenuBuilder.BuildRegisteredType("SwapAttachButton", {
		controllerIndex = var_5_1
	})

	var_5_21.id = "ChosenAttachment"

	var_5_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 512, _1080p * 612, _1080p * 516, _1080p * 616)
	var_5_0:addElement(var_5_21)

	var_5_0.ChosenAttachment = var_5_21

	local var_5_22
	local var_5_23 = LUI.UIStyledText.new()

	var_5_23.id = "ChosenName"

	var_5_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_23:setText("", 0)
	var_5_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_23:SetAlignment(LUI.Alignment.Left)
	var_5_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -404, _1080p * -4, _1080p * 682, _1080p * 712)
	var_5_0:addElement(var_5_23)

	var_5_0.ChosenName = var_5_23

	local var_5_24
	local var_5_25 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModList", {
		controllerIndex = var_5_1
	})

	var_5_25.id = "ModifiersList"

	var_5_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 48, _1080p * 404, _1080p * 649, _1080p * 896)
	var_5_0:addElement(var_5_25)

	var_5_0.ModifiersList = var_5_25

	local var_5_26
	local var_5_27 = LUI.UIStyledText.new()

	var_5_27.id = "ChosenCategory"

	var_5_27:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_27:setText("", 0)
	var_5_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_27:SetAlignment(LUI.Alignment.Left)
	var_5_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -404, _1080p * -4, _1080p * 662, _1080p * 686)
	var_5_0:addElement(var_5_27)

	var_5_0.ChosenCategory = var_5_27

	local function var_5_28()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_28

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 900
		}
	}

	var_5_19:RegisterAnimationSequence("JP", var_5_29)

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 686
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 716
		}
	}

	var_5_23:RegisterAnimationSequence("JP", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 657
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 681
		}
	}

	var_5_27:RegisterAnimationSequence("JP", var_5_31)

	local function var_5_32()
		var_5_19:AnimateSequence("JP")
		var_5_23:AnimateSequence("JP")
		var_5_27:AnimateSequence("JP")
	end

	var_5_0._sequences.JP = var_5_32

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 610
		}
	}

	var_5_6:RegisterAnimationSequence("Splitscreen", var_5_33)

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 408
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 603
		}
	}

	var_5_8:RegisterAnimationSequence("Splitscreen", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1060
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1060
		}
	}

	var_5_10:RegisterAnimationSequence("Splitscreen", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 602
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 662
		}
	}

	var_5_12:RegisterAnimationSequence("Splitscreen", var_5_36)

	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		}
	}

	var_5_14:RegisterAnimationSequence("Splitscreen", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -523
		}
	}

	var_5_17:RegisterAnimationSequence("Splitscreen", var_5_38)

	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 453
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 610
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -445
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -33
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_19:RegisterAnimationSequence("Splitscreen", var_5_39)

	local var_5_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 524
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 624
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_5_21:RegisterAnimationSequence("Splitscreen", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 469
		}
	}

	var_5_23:RegisterAnimationSequence("Splitscreen", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 616
		},
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_25:RegisterAnimationSequence("Splitscreen", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 415
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_5_27:RegisterAnimationSequence("Splitscreen", var_5_43)

	local function var_5_44()
		var_5_6:AnimateSequence("Splitscreen")
		var_5_8:AnimateSequence("Splitscreen")
		var_5_10:AnimateSequence("Splitscreen")
		var_5_12:AnimateSequence("Splitscreen")
		var_5_14:AnimateSequence("Splitscreen")
		var_5_17:AnimateSequence("Splitscreen")
		var_5_19:AnimateSequence("Splitscreen")
		var_5_21:AnimateSequence("Splitscreen")
		var_5_23:AnimateSequence("Splitscreen")
		var_5_25:AnimateSequence("Splitscreen")
		var_5_27:AnimateSequence("Splitscreen")
	end

	var_5_0._sequences.Splitscreen = var_5_44

	function var_5_0.addButtonHelperFunction(arg_11_0, arg_11_1)
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
		})
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = -2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_45 = LUI.UIBindButton.new()

	var_5_45.id = "selfBindButton"

	var_5_0:addElement(var_5_45)

	var_5_0.bindButton = var_5_45

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SwapAttachmentPopup", SwapAttachmentPopup)
LockTable(_M)
