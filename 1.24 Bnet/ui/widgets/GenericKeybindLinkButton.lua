module(..., package.seeall)

function GenericKeybindLinkButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 54 * _1080p, 0, 54 * _1080p)

	var_1_0.id = "GenericKeybindLinkButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "GenericInnerButtonBackground"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.GenericInnerButtonBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Icon"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:setImage(RegisterMaterial("icon_link"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16)
	var_1_0:addElement(var_1_6)

	var_1_0.Icon = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_8)

	local function var_1_9()
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_link")
		}
	}

	var_1_6:RegisterAnimationSequence("LinkKeybind", var_1_10)

	local function var_1_11()
		var_1_6:AnimateSequence("LinkKeybind")
	end

	var_1_0._sequences.LinkKeybind = var_1_11

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_link_broken")
		}
	}

	var_1_6:RegisterAnimationSequence("UnlinkKeybind", var_1_12)

	local function var_1_13()
		var_1_6:AnimateSequence("UnlinkKeybind")
	end

	var_1_0._sequences.UnlinkKeybind = var_1_13

	local var_1_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("GainFocus", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_6:RegisterAnimationSequence("GainFocus", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("GainFocus")
		var_1_6:AnimateSequence("GainFocus")
	end

	var_1_0._sequences.GainFocus = var_1_16

	local var_1_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("LoseFocus", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("LoseFocus")
	end

	var_1_0._sequences.LoseFocus = var_1_18

	local var_1_19 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_19)

	local function var_1_20()
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_20

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_1_6:RegisterAnimationSequence("Binding", var_1_21)

	local function var_1_22()
		var_1_6:AnimateSequence("Binding")
	end

	var_1_0._sequences.Binding = var_1_22

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_6:RegisterAnimationSequence("Active", var_1_23)

	local function var_1_24()
		var_1_6:AnimateSequence("Active")
	end

	var_1_0._sequences.Active = var_1_24

	var_1_0:addEventHandler("gain_focus", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequenceByElement(var_1_0, {
			elementPath = "self.GenericInnerButtonBackground",
			sequenceName = "GainFocus",
			elementName = "GenericInnerButtonBackground"
		})
		ACTIONS.AnimateSequence(var_1_0, "GainFocus")
	end)
	var_1_0:addEventHandler("lose_focus", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequenceByElement(var_1_0, {
			elementPath = "self.GenericInnerButtonBackground",
			sequenceName = "LoseFocus",
			elementName = "GenericInnerButtonBackground"
		})
		ACTIONS.AnimateSequence(var_1_0, "LoseFocus")
	end)
	var_1_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericKeybindLinkButton", GenericKeybindLinkButton)
LockTable(_M)
