module(..., package.seeall)

function RadialCustomizationItemPreview(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "RadialCustomizationItemPreview"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "GradientBacker"

	var_1_4:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_1_4:SetAlpha(0.2, 0)
	var_1_4:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50)
	var_1_0:addElement(var_1_4)

	var_1_0.GradientBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Image"

	var_1_6:setImage(RegisterMaterial("icon_gesture_placeholder"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 44, _1080p * -44, _1080p * 44)
	var_1_0:addElement(var_1_6)

	var_1_0.Image = var_1_6

	local var_1_7 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_7)

	local function var_1_8()
		var_1_6:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_8

	local var_1_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_9)

	local function var_1_10()
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_10

	local var_1_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_11)

	local function var_1_12()
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_12

	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_6:RegisterAnimationSequence("Disable", var_1_13)

	local function var_1_14()
		var_1_6:AnimateSequence("Disable")
	end

	var_1_0._sequences.Disable = var_1_14

	local var_1_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("Enable", var_1_15)

	local function var_1_16()
		var_1_6:AnimateSequence("Enable")
	end

	var_1_0._sequences.Enable = var_1_16

	local var_1_17 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Locked", var_1_17)

	local function var_1_18()
		var_1_6:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_18

	local var_1_19 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("Unlocked", var_1_19)

	local function var_1_20()
		var_1_6:AnimateSequence("Unlocked")
	end

	var_1_0._sequences.Unlocked = var_1_20

	var_1_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disable")
	end)
	var_1_0:addEventHandler("enable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Enable")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("RadialCustomizationItemPreview", RadialCustomizationItemPreview)
LockTable(_M)
