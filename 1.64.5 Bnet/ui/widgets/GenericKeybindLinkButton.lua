module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_1_0, "GainFocus")
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_1_0, "LoseFocus")
	end)
	arg_1_0:addEventHandler("button_active", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_1_0, "Active")
	end)
	arg_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_1_0, "GainFocus")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_up_active", function(arg_8_0, arg_8_1)
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonUp")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericKeybindLinkButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 54 * _1080p, 0, 54 * _1080p)

	var_9_0.id = "GenericKeybindLinkButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "GenericInnerButtonBackground"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.GenericInnerButtonBackground = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "Icon"

	var_9_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_6:setImage(RegisterMaterial("icon_link"), 0)
	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16)
	var_9_0:addElement(var_9_6)

	var_9_0.Icon = var_9_6

	local function var_9_7()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_7

	local var_9_8
	local var_9_9 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_6:RegisterAnimationSequence("ButtonOver", var_9_9)

	local function var_9_10()
		var_9_6:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_10

	local var_9_11
	local var_9_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_link")
		}
	}

	var_9_6:RegisterAnimationSequence("LinkKeybind", var_9_12)

	local function var_9_13()
		var_9_6:AnimateSequence("LinkKeybind")
	end

	var_9_0._sequences.LinkKeybind = var_9_13

	local var_9_14
	local var_9_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_link_broken")
		}
	}

	var_9_6:RegisterAnimationSequence("UnlinkKeybind", var_9_15)

	local function var_9_16()
		var_9_6:AnimateSequence("UnlinkKeybind")
	end

	var_9_0._sequences.UnlinkKeybind = var_9_16

	local var_9_17
	local var_9_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("GainFocus", var_9_18)

	local var_9_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_6:RegisterAnimationSequence("GainFocus", var_9_19)

	local function var_9_20()
		var_9_4:AnimateSequence("GainFocus")
		var_9_6:AnimateSequence("GainFocus")
	end

	var_9_0._sequences.GainFocus = var_9_20

	local var_9_21
	local var_9_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("LoseFocus", var_9_22)

	local function var_9_23()
		var_9_4:AnimateSequence("LoseFocus")
	end

	var_9_0._sequences.LoseFocus = var_9_23

	local var_9_24
	local var_9_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_6:RegisterAnimationSequence("ButtonUp", var_9_25)

	local function var_9_26()
		var_9_6:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_26

	local var_9_27
	local var_9_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_9_6:RegisterAnimationSequence("Binding", var_9_28)

	local function var_9_29()
		var_9_6:AnimateSequence("Binding")
	end

	var_9_0._sequences.Binding = var_9_29

	local var_9_30
	local var_9_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_6:RegisterAnimationSequence("Active", var_9_31)

	local function var_9_32()
		var_9_6:AnimateSequence("Active")
	end

	var_9_0._sequences.Active = var_9_32

	local var_9_33
	local var_9_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("WZWipSetup", var_9_34)

	local function var_9_35()
		var_9_6:AnimateSequence("WZWipSetup")
	end

	var_9_0._sequences.WZWipSetup = var_9_35

	local var_9_36
	local var_9_37 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("WZWipButtonOver", var_9_37)

	local function var_9_38()
		var_9_6:AnimateSequence("WZWipButtonOver")
	end

	var_9_0._sequences.WZWipButtonOver = var_9_38

	local var_9_39
	local var_9_40 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("WZWipButtonUp", var_9_40)

	local function var_9_41()
		var_9_6:AnimateSequence("WZWipButtonUp")
	end

	var_9_0._sequences.WZWipButtonUp = var_9_41

	local var_9_42
	local var_9_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("WZWipGainFocus", var_9_43)

	local function var_9_44()
		var_9_6:AnimateSequence("WZWipGainFocus")
	end

	var_9_0._sequences.WZWipGainFocus = var_9_44

	local var_9_45
	local var_9_46 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("WZWipLoseFocus", var_9_46)

	local function var_9_47()
		var_9_6:AnimateSequence("WZWipLoseFocus")
	end

	var_9_0._sequences.WZWipLoseFocus = var_9_47

	local var_9_48
	local var_9_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("WZWipActive", var_9_49)

	local function var_9_50()
		var_9_6:AnimateSequence("WZWipActive")
	end

	var_9_0._sequences.WZWipActive = var_9_50

	var_0_0(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("GenericKeybindLinkButton", GenericKeybindLinkButton)
LockTable(_M)
