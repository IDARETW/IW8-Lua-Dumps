module(..., package.seeall)

local var_0_0 = 2
local var_0_1 = -2
local var_0_2 = 0

local function var_0_3(arg_1_0, arg_1_1)
	arg_1_0.WeaponRotator = MenuBuilder.BuildRegisteredType("WeaponRotator", {
		controllerIndex = arg_1_1,
		weaponIndex = FrontEndScene.ClientWeapons.Preview,
		weaponModelName = arg_1_0.weaponModelName,
		weaponModel = arg_1_0.weaponModel
	})

	arg_1_0.WeaponRotator:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	arg_1_0.WeaponRotator.id = "WeaponRotator"

	arg_1_0:addElement(arg_1_0.WeaponRotator)
end

local function var_0_4(arg_2_0, arg_2_1)
	assert(arg_2_0.ItemType)
	assert(arg_2_0.ItemQuality)

	if arg_2_1.itemRef and (arg_2_1.storePreviewItemType == LOOT.itemTypes.WATCH or arg_2_1.storePreviewItemType == LOOT.itemTypes.CHARM) then
		local var_2_0 = ToUpperCase("STORE_FLAVOR/" .. arg_2_1.itemRef .. "_FLAVOR")
		local var_2_1 = Engine.CBBHFCGDIC(var_2_0)

		if var_2_1 ~= var_2_0 then
			arg_2_0.FlavorText:setText(var_2_1)
		end
	end

	ACTIONS.AnimateSequence(arg_2_0, "FromStore")

	local var_2_2 = arg_2_1.storePreviewItemType
	local var_2_3 = var_2_2 == LOOT.itemTypes.WEAPON and arg_2_1.weaponTable.lootID or LOOT.GetItemID(var_2_2, arg_2_1.itemRef)
	local var_2_4 = LOOT.GetItemClassName(var_2_2, arg_2_1.itemRef)

	if var_2_4 and #var_2_4 > 0 then
		arg_2_0.ItemType:setText(var_2_4)
	end

	local var_2_5 = LOOT.GetItemQuality(var_2_2, arg_2_1.itemRef, var_2_3)

	arg_2_0.ItemQuality:UpdateQualityText(var_2_5)
	Engine.EBHIFJCGBH("set_ui_rarity_image", var_2_5 and var_2_5 + 1 or 0)

	arg_2_0._isWeaponCosmetic = var_2_2 == LOOT.itemTypes.CHARM or var_2_2 == LOOT.itemTypes.STICKER

	if isWeaponCosmetic then
		ACTIONS.AnimateSequence(arg_2_0, "ControlsHidden")
	end

	arg_2_0:addEventHandler("menu_create", function(arg_3_0, arg_3_1)
		if arg_2_1.titleOverride and #arg_2_1.titleOverride > 0 then
			arg_2_0.MenuTitle:SetAlpha(1)
			arg_2_0.MenuTitle:SetTitle(arg_2_1.titleOverride)
		end

		if Loot.DEBEIFJEEG(arg_2_0._controllerIndex, var_2_3) > 0 then
			local var_3_0 = LAYOUT.GetTextWidth(arg_2_0.MenuTitle.MenuTitle)
			local var_3_1 = LAYOUT.GetElementWidth(arg_2_0.CheckboxFrame)
			local var_3_2 = 100 * _1080p
			local var_3_3 = 16 * _1080p
			local var_3_4 = {
				arg_2_0.Checkbox,
				arg_2_0.CheckboxFrame
			}

			for iter_3_0 = 1, #var_3_4 do
				var_3_4[iter_3_0]:SetLeft(var_3_0 + var_3_2 + var_3_3)
				var_3_4[iter_3_0]:SetRight(var_3_0 + var_3_2 + var_3_3 + var_3_1)
				var_3_4[iter_3_0]:SetAlpha(1)
			end
		end
	end)
end

local function var_0_5(arg_4_0, arg_4_1)
	local var_4_0

	if arg_4_1.storePreviewItemType == LOOT.itemTypes.CHARM then
		var_4_0 = GUNSMITH.GetAttachmentCategoryScene(arg_4_0.weaponRef, arg_4_1.weaponTable.variantID, ATTACHMENT.charmCategory)
	elseif arg_4_1.storePreviewItemType == LOOT.itemTypes.STICKER then
		var_4_0 = GUNSMITH.GetAttachmentCategoryScene(arg_4_0.weaponRef, arg_4_1.weaponTable.variantID, ATTACHMENT.stickerCategory)
	end

	if var_4_0 then
		Engine.DHFCHIIJCA(var_4_0)
	end
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:addEventHandler("menu_close", function()
		if arg_5_0.WeaponRotator and arg_5_0._isWeapon then
			arg_5_0.WeaponRotator:ResetRotation()
		end

		Engine.EBHIFJCGBH("set_ui_rarity_image", 0)
	end)

	arg_5_0.bindButton = LUI.UIBindButton.new()
	arg_5_0.bindButton.id = "selfBindButton"

	arg_5_0:addElement(arg_5_0.bindButton)
	arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_5_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_5_0._previewSceneForWeaponCosmetic then
			ACTIONS.LeaveMenu(arg_5_0)
		else
			arg_5_0._previewSceneForWeaponCosmetic = false

			Engine.BJDBIAGIDA(SOUND_SETS.default.back)
			arg_5_0.PreviewControlsLegend:SetAlpha(0)
			var_0_5(arg_5_0, arg_5_2)
			arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				priority = 10,
				helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
			})
			arg_5_0.WeaponRotator:ResetRotation()
			arg_5_0.WeaponRotator:closeTree()

			arg_5_0.WeaponRotator = nil
		end
	end)

	if arg_5_2.weaponTable and not arg_5_0._isWatch and not arg_5_0._isWeaponCosmetic and Engine.DDJFBBJAIG() and GUNSMITH.IsAnyWeaponAvailableCategoryPreviewData(arg_5_0.weaponRef) then
		arg_5_2.weaponRef = arg_5_0.weaponRef

		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("WEAPON/ENTER_PREVIEW_MODE")
		})
		arg_5_0.bindButton:addEventHandler("button_right_stick", function(arg_8_0, arg_8_1)
			LUI.FlowManager.RequestAddMenu("WeaponPreviewFilm", true, arg_5_1, false, arg_5_2, true)

			if arg_8_1.qualifier == "keyboard" or arg_8_1.qualifier == "gamepad" then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		end)
	end

	if arg_5_0._isWeaponCosmetic and Engine.DDJFBBJAIG() then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
		})
		arg_5_0.bindButton:addEventHandler("button_right_stick", function(arg_9_0, arg_9_1)
			if not arg_5_0._previewSceneForWeaponCosmetic then
				arg_5_0.PreviewControlsLegend:SetAlpha(1)
				Engine.BJDBIAGIDA(SOUND_SETS.default.action)
				WEAPON.SetPreviewSceneForWeapon(arg_5_0.weaponRef)
				var_0_3(arg_5_0, arg_5_1)
				arg_5_0.HelperBar.ButtonHelperText:PopButtonPrompt({
					side = "left",
					button_ref = "button_r3"
				})

				arg_5_0._previewSceneForWeaponCosmetic = true
			end
		end)
	end

	if arg_5_2.isBattlePass then
		BATTLEPASS.AddPurchasePrompt(arg_5_0, arg_5_1)
	end

	local var_5_0 = arg_5_2.bundleData

	if arg_5_2.isStorePreview and arg_5_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_5_0.isBundlePurchased then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE")
		})
		arg_5_0.bindButton:addEventHandler("button_alt1", function(arg_10_0, arg_10_1)
			STORE.OpenQuickPurchasePopupInPreview(var_5_0)
		end)
	end
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._controllerIndex = arg_11_1

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	if not Engine.DDJFBBJAIG() then
		return
	end

	local var_11_0 = CSV.weaponOffsets.previewFile

	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	if arg_11_2.isStorePreview then
		if arg_11_2.storePreviewItemType == LOOT.itemTypes.CHARM or arg_11_2.storePreviewItemType == LOOT.itemTypes.STICKER then
			var_11_0 = CSV.weaponOffsets.attachmentFile
		end

		var_0_4(arg_11_0, arg_11_2)
	end

	if arg_11_2.isStorePreview and arg_11_2.storePreviewItemType == LOOT.itemTypes.STICKER then
		arg_11_0.weaponModel = WEAPON.GetWeaponModel(arg_11_1, FrontEndScene.ClientWeapons.Preview, var_11_0, {
			xOffset = var_0_0,
			yOffset = var_0_1,
			zOffset = var_0_2
		})
	else
		arg_11_0.weaponModel = WEAPON.GetWeaponModel(arg_11_1, FrontEndScene.ClientWeapons.Preview, var_11_0)
	end

	arg_11_0:addElement(arg_11_0.weaponModel)

	if arg_11_2.weaponTable then
		arg_11_0.PreviewControlsLegend:SetupLegend(arg_11_0, LOOT.itemTypes.WEAPON)

		if arg_11_0._isWeaponCosmetic then
			arg_11_0.PreviewControlsLegend:SetAlpha(0)
		end

		local function var_11_1(arg_12_0, arg_12_1, arg_12_2)
			return function()
				local function var_13_0()
					ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, true)
					ACTIONS.AnimateSequence(arg_12_0, "FadeIn")
				end

				ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)
				WEAPON.SetModelIfLoaded(arg_12_1, arg_12_0.weaponModel, arg_12_0.weaponModelName, {
					forceOffsetsAndRotations = true,
					callbackFunc = var_13_0
				})
			end
		end

		arg_11_0._isWeapon = true
		arg_11_0.weaponRef = arg_11_2.weaponTable.weapon
		arg_11_0.weaponModelName = WEAPON.GetWeaponModelName(arg_11_0.weaponRef, arg_11_2.weaponTable, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_11_1
		})

		FrontEndScene.RequestWeaponViewModels({
			arg_11_0.weaponModelName
		}, arg_11_1)
		WEAPON.SetPreviewSceneForWeapon(arg_11_0.weaponRef)
		MenuUtils.SetupSceneChangeCallback(arg_11_0, var_11_1(arg_11_0, arg_11_1, arg_11_2))
	elseif arg_11_2.watchRef then
		arg_11_0.PreviewControlsLegend:SetupLegend(arg_11_0, LOOT.itemTypes.WATCH)

		local function var_11_2(arg_15_0, arg_15_1, arg_15_2)
			return function()
				local function var_16_0()
					ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, true)
					ClientWeapon.CFJGGIAEJF(FrontEndScene.ClientWeapons.Preview, true)
					ACTIONS.AnimateSequence(arg_15_0, "FadeIn")
				end

				ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)
				WEAPON.SetModelIfLoaded(arg_15_1, arg_15_0.weaponModel, arg_15_0.weaponModelName, {
					callbackFunc = var_16_0
				})
			end
		end

		arg_11_0._isWatch = true
		arg_11_0.weaponModelName = WATCH.GetFullModelName(arg_11_2.watchRef)

		FrontEndScene.RequestWeaponViewModels({
			arg_11_0.weaponModelName
		}, arg_11_1)
		WATCH.CreateWidgetForWatch(arg_11_0, arg_11_1, arg_11_2.watchRef)
		Engine.DHFCHIIJCA("loadout_showcase_preview_watch")
		MenuUtils.SetupSceneChangeCallback(arg_11_0, var_11_2(arg_11_0, arg_11_1, arg_11_2))
	else
		Engine.DHFCHIIJCA("loadout_showcase_preview")
	end

	if arg_11_2.isStorePreview then
		var_0_5(arg_11_0, arg_11_2)

		if arg_11_2.storePreviewItemType ~= LOOT.itemTypes.CHARM and arg_11_2.storePreviewItemType ~= LOOT.itemTypes.STICKER then
			var_0_3(arg_11_0, arg_11_1)
		end
	else
		var_0_3(arg_11_0, arg_11_1)
	end

	var_0_6(arg_11_0, arg_11_1, arg_11_2)
	ACTIONS.ScaleFullscreen(arg_11_0.BG)
	LAYOUT.AddAspectRatioFadeFrame(arg_11_0, arg_11_1)
	ACTIONS.ScaleFullscreen(arg_11_0.Vignette)

	if arg_11_2.timerValue then
		arg_11_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_11_2.timerValue, true, true)
	else
		arg_11_0.LimitedTimeItem:SetAlpha(0)
	end
end

function WeaponPreview(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "WeaponPreview"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "BG"

	var_18_4:SetRGBFromInt(0, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.BG = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "Vignette"

	var_18_6:SetAlpha(0, 0)
	var_18_6:SetXRotation(180, 0)
	var_18_6:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 2423, 0, _1080p * -1257)
	var_18_0:addElement(var_18_6)

	var_18_0.Vignette = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("PreviewControlsLegend", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "PreviewControlsLegend"

	var_18_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 456, _1080p * 154, _1080p * 435)
	var_18_0:addElement(var_18_8)

	var_18_0.PreviewControlsLegend = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "ItemQuality"

	var_18_10:SetAlpha(0, 0)
	var_18_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1824, _1080p * -1664, _1080p * 146, _1080p * 178)
	var_18_0:addElement(var_18_10)

	var_18_0.ItemQuality = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIText.new()

	var_18_12.id = "ItemType"

	var_18_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_18_12:SetAlpha(0, 0)
	var_18_12:setText("", 0)
	var_18_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_12:SetAlignment(LUI.Alignment.Left)
	var_18_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 108, _1080p * 138)
	var_18_0:addElement(var_18_12)

	var_18_0.ItemType = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "MenuTitle"

	var_18_14:SetAlpha(0, 0)
	var_18_14.MenuTitle:setText("", 0)
	var_18_14.Line:SetLeft(0, 0)
	var_18_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_14)

	var_18_0.MenuTitle = var_18_14

	local var_18_15
	local var_18_16 = LUI.UIStyledText.new()

	var_18_16.id = "FlavorText"

	var_18_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_16:SetAlpha(0, 0)
	var_18_16:setText("", 0)
	var_18_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_18_16:SetAlignment(LUI.Alignment.Left)
	var_18_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_18_16:SetStartupDelay(2000)
	var_18_16:SetLineHoldTime(400)
	var_18_16:SetAnimMoveTime(2000)
	var_18_16:SetAnimMoveSpeed(150)
	var_18_16:SetEndDelay(2000)
	var_18_16:SetCrossfadeTime(250)
	var_18_16:SetFadeInTime(300)
	var_18_16:SetFadeOutTime(300)
	var_18_16:SetMaxVisibleLines(2)
	var_18_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 520, _1080p * 185, _1080p * 207)
	var_18_0:addElement(var_18_16)

	var_18_0.FlavorText = var_18_16

	local var_18_17
	local var_18_18 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_18_1
	})

	var_18_18.id = "LimitedTimeItem"

	var_18_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 396, _1080p * -460, _1080p * -430)
	var_18_0:addElement(var_18_18)

	var_18_0.LimitedTimeItem = var_18_18

	local var_18_19
	local var_18_20 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_18_21 = LUI.UIBorder.new(var_18_20)

	var_18_21.id = "CheckboxFrame"

	var_18_21:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_18_21:SetAlpha(0, 0)
	var_18_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_18_0:addElement(var_18_21)

	var_18_0.CheckboxFrame = var_18_21

	local var_18_22
	local var_18_23 = LUI.UIImage.new()

	var_18_23.id = "Checkbox"

	var_18_23:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_18_23:SetAlpha(0, 0)
	var_18_23:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_18_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_18_0:addElement(var_18_23)

	var_18_0.Checkbox = var_18_23

	local function var_18_24()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_24

	local var_18_25
	local var_18_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("ControlsHidden", var_18_26)

	local function var_18_27()
		var_18_8:AnimateSequence("ControlsHidden")
	end

	var_18_0._sequences.ControlsHidden = var_18_27

	local var_18_28
	local var_18_29 = {
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_4:RegisterAnimationSequence("FadeIn", var_18_29)

	local function var_18_30()
		var_18_4:AnimateSequence("FadeIn")
	end

	var_18_0._sequences.FadeIn = var_18_30

	local var_18_31
	local var_18_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("FromStore", var_18_32)

	local var_18_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 531
		}
	}

	var_18_8:RegisterAnimationSequence("FromStore", var_18_33)

	local var_18_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 766
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 798
		}
	}

	var_18_10:RegisterAnimationSequence("FromStore", var_18_34)

	local var_18_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 728
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 758
		}
	}

	var_18_12:RegisterAnimationSequence("FromStore", var_18_35)

	local var_18_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 620
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 720
		}
	}

	var_18_14:RegisterAnimationSequence("FromStore", var_18_36)

	local var_18_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 841
		}
	}

	var_18_16:RegisterAnimationSequence("FromStore", var_18_37)

	local function var_18_38()
		var_18_6:AnimateSequence("FromStore")
		var_18_8:AnimateSequence("FromStore")
		var_18_10:AnimateSequence("FromStore")
		var_18_12:AnimateSequence("FromStore")
		var_18_14:AnimateSequence("FromStore")
		var_18_16:AnimateSequence("FromStore")
	end

	var_18_0._sequences.FromStore = var_18_38

	var_0_7(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("WeaponPreview", WeaponPreview)
LockTable(_M)
