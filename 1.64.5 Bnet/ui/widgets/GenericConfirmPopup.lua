module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.title)
	assert(arg_1_2.message)
	assert(arg_1_2.buttons)
	arg_1_0.Title:setText(ToUpperCase(arg_1_2.title))
	arg_1_0.Message:setText(arg_1_2.message)

	if arg_1_2.extraMessage then
		arg_1_0.ExtraMessage:setText(arg_1_2.extraMessage)
	end

	if arg_1_2.itemImage then
		local var_1_0 = RegisterMaterial(arg_1_2.itemImage)
		local var_1_1 = Engine.DFEIGFBEH(var_1_0)

		arg_1_0.Image:setImage(var_1_0)

		if var_1_1 > 1 then
			ACTIONS.AnimateSequence(arg_1_0, "MWLogoProportions")
		end

		if arg_1_2.imageTitle then
			arg_1_0.ImageTitle:setText(arg_1_2.imageTitle)
		end

		if arg_1_2.clearImageTint then
			arg_1_0.Image:SetRGBFromTable({
				g = 0.5,
				b = 0.5,
				r = 0.5
			})
			arg_1_0.Image:SetAlpha(1, 0)
		end
	end

	arg_1_0.ButtonGrid:SetNumChildren(#arg_1_2.buttons)
	arg_1_0.ButtonGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_2 + 1
		local var_2_1 = arg_1_2.buttons[var_2_0]

		arg_2_0:SetText(var_2_1.label)
		arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			var_2_1.action(arg_3_0, arg_3_1.controller)
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
		end)
	end)

	if arg_1_2.resizeForOverflow then
		local var_1_2 = LAYOUT.GetElementHeight(arg_1_0.Message)
		local var_1_3 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.Message, arg_1_0.Message:getText()) - var_1_2

		if var_1_3 > 0 then
			local var_1_4, var_1_5, var_1_6, var_1_7 = arg_1_0.GenericPopupWindow:getLocalRect()

			arg_1_0.GenericPopupWindow:SetBottom(var_1_7 + var_1_3, 0)

			local var_1_8, var_1_9, var_1_10, var_1_11 = arg_1_0.ButtonGrid:getLocalRect()

			arg_1_0.ButtonGrid:SetTop(var_1_9 + var_1_3, 0)
			arg_1_0.ButtonGrid:SetBottom(var_1_11 + var_1_3, 0)

			local var_1_12, var_1_13, var_1_14, var_1_15 = arg_1_0.ButtonHelperBar:getLocalRect()

			arg_1_0.ButtonHelperBar:SetTop(var_1_13 + var_1_3, 0)
			arg_1_0.ButtonHelperBar:SetBottom(var_1_15 + var_1_3, 0)
		end
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function GenericConfirmPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "GenericConfirmPopup"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.97, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * -184, _1080p * 184)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText(ToUpperCase(""), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_8:SetStartupDelay(1000)
	var_4_8:SetLineHoldTime(400)
	var_4_8:SetAnimMoveTime(1500)
	var_4_8:SetAnimMoveSpeed(1500)
	var_4_8:SetEndDelay(1000)
	var_4_8:SetCrossfadeTime(400)
	var_4_8:SetFadeInTime(300)
	var_4_8:SetFadeOutTime(300)
	var_4_8:SetMaxVisibleLines(1)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 805, _1080p * -153, _1080p * -93)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Image"

	var_4_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_10:SetAlpha(0.6, 0)
	var_4_10:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -726, _1080p * -462, _1080p * -132, _1080p * 132)
	var_4_0:addElement(var_4_10)

	var_4_0.Image = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "Message"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 805, _1080p * -88, _1080p * -66)
	var_4_0:addElement(var_4_12)

	var_4_0.Message = var_4_12

	local var_4_13
	local var_4_14 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom
	}
	local var_4_15 = LUI.UIGrid.new(var_4_14)

	var_4_15.id = "ButtonGrid"

	var_4_15:setUseStencil(true)
	var_4_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 118, _1080p * -16, _1080p * 154)
	var_4_0:addElement(var_4_15)

	var_4_0.ButtonGrid = var_4_15

	local var_4_16
	local var_4_17 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_17.id = "ButtonHelperBar"

	var_4_17.Background:SetAlpha(0, 0)
	var_4_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 184, _1080p * 244)
	var_4_0:addElement(var_4_17)

	var_4_0.ButtonHelperBar = var_4_17

	local var_4_18
	local var_4_19 = LUI.UIStyledText.new()

	var_4_19.id = "ExtraMessage"

	var_4_19:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_19:setText("", 0)
	var_4_19:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_4_19:SetAlignment(LUI.Alignment.Left)
	var_4_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * 779, _1080p * -60, _1080p * -38)
	var_4_0:addElement(var_4_19)

	var_4_0.ExtraMessage = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIStyledText.new()

	var_4_21.id = "ImageTitle"

	var_4_21:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_21:setText("", 0)
	var_4_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_21:SetAlignment(LUI.Alignment.Center)
	var_4_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -726, _1080p * -462, _1080p * 672, _1080p * 702)
	var_4_0:addElement(var_4_21)

	var_4_0.ImageTitle = var_4_21

	local function var_4_22()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -58
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_24)

	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		}
	}

	var_4_19:RegisterAnimationSequence("AR", var_4_25)

	local function var_4_26()
		var_4_12:AnimateSequence("AR")
		var_4_19:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_26

	local var_4_27
	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -862
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -153
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_4_10:RegisterAnimationSequence("MWLogoProportions", var_4_28)

	local function var_4_29()
		var_4_10:AnimateSequence("MWLogoProportions")
	end

	var_4_0._sequences.MWLogoProportions = var_4_29

	local var_4_30
	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_31)

	local function var_4_32()
		var_4_8:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_32

	function var_4_0.addButtonHelperFunction(arg_11_0, arg_11_1)
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_33 = LUI.UIBindButton.new()

	var_4_33.id = "selfBindButton"

	var_4_0:addElement(var_4_33)

	var_4_0.bindButton = var_4_33

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericConfirmPopup", GenericConfirmPopup)
LockTable(_M)
