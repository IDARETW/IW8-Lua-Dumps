module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.header)
	assert(arg_1_2.message)
	assert(arg_1_2.YesAction)
	arg_1_0.Header:setText(arg_1_2.header)
	arg_1_0.Message:setText(arg_1_2.message)
	arg_1_0.OKButton:registerEventHandler("button_action", function(arg_2_0, arg_2_1)
		arg_1_2.YesAction()
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function GameUninstallPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0.id = "GameUninstallPopup"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GenericPopupWindow"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -150, _1080p * 206)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Header"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(150)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -323, _1080p * 790, _1080p * -104, _1080p * -54)
	var_3_0:addElement(var_3_8)

	var_3_0.Header = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Message"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -323, _1080p * 787, _1080p * -36, _1080p * -13)
	var_3_0:addElement(var_3_10)

	var_3_0.Message = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Image"

	var_3_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_12:SetAlpha(0.6, 0)
	var_3_12:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -757, _1080p * -431, _1080p * -135, _1080p * 191)
	var_3_0:addElement(var_3_12)

	var_3_0.Image = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "ButtonHelperBar"

	var_3_14.Background:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -854, _1080p * 854, _1080p * 750, _1080p * 810)
	var_3_0:addElement(var_3_14)

	var_3_0.ButtonHelperBar = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "OKButton"

	var_3_16.Text:SetLeft(_1080p * 20, 0)
	var_3_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"), 0)
	var_3_16.Text:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 637, _1080p * 1237, _1080p * 616, _1080p * 654)
	var_3_0:addElement(var_3_16)

	var_3_0.OKButton = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "CancelButton"

	var_3_18.Text:SetLeft(_1080p * 20, 0)
	var_3_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_3_18.Text:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 637, _1080p * 1237, _1080p * 663, _1080p * 701)
	var_3_0:addElement(var_3_18)

	var_3_0.CancelButton = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 663
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 701
		}
	}

	var_3_16:RegisterAnimationSequence("ConfirmOnly", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ConfirmOnly", var_3_22)

	local function var_3_23()
		var_3_16:AnimateSequence("ConfirmOnly")
		var_3_18:AnimateSequence("ConfirmOnly")
	end

	var_3_0._sequences.ConfirmOnly = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 790
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 790
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_26)

	local function var_3_27()
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 790
		}
	}

	var_3_8:RegisterAnimationSequence("JP", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 790
		}
	}

	var_3_10:RegisterAnimationSequence("JP", var_3_30)

	local function var_3_31()
		var_3_8:AnimateSequence("JP")
		var_3_10:AnimateSequence("JP")
	end

	var_3_0._sequences.JP = var_3_31

	var_3_18:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)

	function var_3_0.addButtonHelperFunction(arg_9_0, arg_9_1)
		arg_9_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_9_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_32 = LUI.UIBindButton.new()

	var_3_32.id = "selfBindButton"

	var_3_0:addElement(var_3_32)

	var_3_0.bindButton = var_3_32

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameUninstallPopup", GameUninstallPopup)
LockTable(_M)
