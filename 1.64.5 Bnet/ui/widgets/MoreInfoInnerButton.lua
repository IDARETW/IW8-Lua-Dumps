module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function MoreInfoInnerButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 54 * _1080p, 0, 54 * _1080p)

	var_2_0.id = "MoreInfoInnerButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "GenericInnerButtonBackground"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.GenericInnerButtonBackground = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Icon"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_6:setImage(RegisterMaterial("icon_open_new_window_thin"), 0)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16)
	var_2_0:addElement(var_2_6)

	var_2_0.Icon = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_9)

	local function var_2_10()
		var_2_6:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_10

	local var_2_11
	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_link")
		}
	}

	var_2_6:RegisterAnimationSequence("LinkKeybind", var_2_12)

	local function var_2_13()
		var_2_6:AnimateSequence("LinkKeybind")
	end

	var_2_0._sequences.LinkKeybind = var_2_13

	local var_2_14
	local var_2_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_link_broken")
		}
	}

	var_2_6:RegisterAnimationSequence("UnlinkKeybind", var_2_15)

	local function var_2_16()
		var_2_6:AnimateSequence("UnlinkKeybind")
	end

	var_2_0._sequences.UnlinkKeybind = var_2_16

	local var_2_17
	local var_2_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("GainFocus", var_2_18)

	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_6:RegisterAnimationSequence("GainFocus", var_2_19)

	local function var_2_20()
		var_2_4:AnimateSequence("GainFocus")
		var_2_6:AnimateSequence("GainFocus")
	end

	var_2_0._sequences.GainFocus = var_2_20

	local var_2_21
	local var_2_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("LoseFocus", var_2_22)

	local function var_2_23()
		var_2_4:AnimateSequence("LoseFocus")
	end

	var_2_0._sequences.LoseFocus = var_2_23

	local var_2_24
	local var_2_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_25)

	local function var_2_26()
		var_2_6:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_26

	local var_2_27
	local var_2_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_2_6:RegisterAnimationSequence("Binding", var_2_28)

	local function var_2_29()
		var_2_6:AnimateSequence("Binding")
	end

	var_2_0._sequences.Binding = var_2_29

	local var_2_30
	local var_2_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_6:RegisterAnimationSequence("Active", var_2_31)

	local function var_2_32()
		var_2_6:AnimateSequence("Active")
	end

	var_2_0._sequences.Active = var_2_32

	local var_2_33
	local var_2_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipSetup", var_2_34)

	local function var_2_35()
		var_2_6:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_35

	local var_2_36
	local var_2_37 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipActive", var_2_37)

	local function var_2_38()
		var_2_6:AnimateSequence("WZWipActive")
	end

	var_2_0._sequences.WZWipActive = var_2_38

	local var_2_39
	local var_2_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipBinding", var_2_40)

	local function var_2_41()
		var_2_6:AnimateSequence("WZWipBinding")
	end

	var_2_0._sequences.WZWipBinding = var_2_41

	local var_2_42
	local var_2_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipButtonOver", var_2_43)

	local function var_2_44()
		var_2_6:AnimateSequence("WZWipButtonOver")
	end

	var_2_0._sequences.WZWipButtonOver = var_2_44

	local var_2_45
	local var_2_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipButtonUp", var_2_46)

	local function var_2_47()
		var_2_6:AnimateSequence("WZWipButtonUp")
	end

	var_2_0._sequences.WZWipButtonUp = var_2_47

	local var_2_48
	local var_2_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipGainFocus", var_2_49)

	local var_2_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipGainFocus", var_2_50)

	local function var_2_51()
		var_2_4:AnimateSequence("WZWipGainFocus")
		var_2_6:AnimateSequence("WZWipGainFocus")
	end

	var_2_0._sequences.WZWipGainFocus = var_2_51

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("MoreInfoInnerButton", MoreInfoInnerButton)
LockTable(_M)
