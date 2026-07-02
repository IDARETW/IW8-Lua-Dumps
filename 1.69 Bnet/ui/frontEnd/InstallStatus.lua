module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.isEnabled = true

	WZWIP.AnimateThemeElement(arg_1_0, "Enable")
end

local function var_0_1(arg_2_0)
	arg_2_0.isEnabled = false

	ACTIONS.AnimateSequence(arg_2_0, "Disable")
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.state == ContentProgressState.HAS_PROGRESS and arg_3_1.progress
	local var_3_1

	if var_3_0 then
		var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/PERCENTAGE_OF_COMPLETION", math.floor(arg_3_1.progress * 100))
	else
		var_3_1 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(arg_3_1.details))
	end

	arg_3_0.Details:setText(var_3_1)
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 and arg_4_1.state == ContentProgressState.INSTALLED

	if arg_4_1 and not var_4_0 and not arg_4_0.isEnabled then
		var_0_0(arg_4_0)
	elseif (not arg_4_1 or var_4_0) and arg_4_0.isEnabled then
		var_0_1(arg_4_0)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.installData = arg_5_1

	if arg_5_1 then
		arg_5_0.Status:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_5_1.status)))
		var_0_2(arg_5_0, arg_5_1)
	end

	if arg_5_2 then
		var_0_3(arg_5_0, arg_5_1)
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Refresh = var_0_4
	arg_6_0.Enable = var_0_0
	arg_6_0.Disable = var_0_1

	arg_6_0:addEventHandler("lose_focus", function(arg_7_0, arg_7_1)
		var_0_1(arg_6_0)
	end)
	var_0_1(arg_6_0)

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_6_0, "JP")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end
end

function InstallStatus(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 125 * _1080p)

	var_8_0.id = "InstallStatus"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_8_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 26, _1080p * -4)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "DividerTop"

	var_8_6:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 158, _1080p * -158, _1080p * 22, _1080p * 23)
	var_8_0:addElement(var_8_6)

	var_8_0.DividerTop = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "DividerBottom"

	var_8_8:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_8_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 158, _1080p * -158, _1080p * -1, 0)
	var_8_0:addElement(var_8_8)

	var_8_0.DividerBottom = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Details"

	var_8_10:SetRGBFromTable(SWATCHES.HUD.Countdown, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Center)
	var_8_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 83, _1080p * 111)
	var_8_0:addElement(var_8_10)

	var_8_0.Details = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "Status"

	var_8_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 38, _1080p * 74)
	var_8_0:addElement(var_8_12)

	var_8_0.Status = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "Spinner"

	var_8_14:setImage(RegisterMaterial("spinner_loading"), 0)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, 0, _1080p * 10)
	var_8_0:addElement(var_8_14)

	var_8_0.Spinner = var_8_14

	local function var_8_15()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Disable", var_8_17)

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Disable", var_8_18)

	local var_8_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Disable", var_8_19)

	local var_8_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Disable", var_8_20)

	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Disable", var_8_21)

	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Disable", var_8_22)

	local function var_8_23()
		var_8_4:AnimateSequence("Disable")
		var_8_6:AnimateSequence("Disable")
		var_8_8:AnimateSequence("Disable")
		var_8_10:AnimateSequence("Disable")
		var_8_12:AnimateSequence("Disable")
		var_8_14:AnimateSequence("Disable")
	end

	var_8_0._sequences.Disable = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Enable", var_8_25)

	local var_8_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Enable", var_8_26)

	local var_8_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Enable", var_8_27)

	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Enable", var_8_28)

	local var_8_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Enable", var_8_29)

	local function var_8_30()
		var_8_6:AnimateSequence("Enable")
		var_8_8:AnimateSequence("Enable")
		var_8_10:AnimateSequence("Enable")
		var_8_12:AnimateSequence("Enable")
		var_8_14:AnimateSequence("Enable")
	end

	var_8_0._sequences.Enable = var_8_30

	local var_8_31
	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipSetup", var_8_32)

	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipSetup", var_8_33)

	local var_8_34 = {
		{
			value = 15262009,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 106
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipSetup", var_8_34)

	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipSetup", var_8_35)

	local function var_8_36()
		var_8_6:AnimateSequence("WZWipSetup")
		var_8_8:AnimateSequence("WZWipSetup")
		var_8_10:AnimateSequence("WZWipSetup")
		var_8_12:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("WZWipEnable", var_8_38)

	local var_8_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipEnable", var_8_39)

	local var_8_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipEnable", var_8_40)

	local var_8_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipEnable", var_8_41)

	local var_8_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipEnable", var_8_42)

	local var_8_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipEnable", var_8_43)

	local function var_8_44()
		var_8_4:AnimateSequence("WZWipEnable")
		var_8_6:AnimateSequence("WZWipEnable")
		var_8_8:AnimateSequence("WZWipEnable")
		var_8_10:AnimateSequence("WZWipEnable")
		var_8_12:AnimateSequence("WZWipEnable")
		var_8_14:AnimateSequence("WZWipEnable")
	end

	var_8_0._sequences.WZWipEnable = var_8_44

	local var_8_45
	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 103
		}
	}

	var_8_10:RegisterAnimationSequence("JP", var_8_46)

	local var_8_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 74
		}
	}

	var_8_12:RegisterAnimationSequence("JP", var_8_47)

	local function var_8_48()
		var_8_10:AnimateSequence("JP")
		var_8_12:AnimateSequence("JP")
	end

	var_8_0._sequences.JP = var_8_48

	var_0_5(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("InstallStatus", InstallStatus)
LockTable(_M)
