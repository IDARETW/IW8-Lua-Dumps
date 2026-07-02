module(..., package.seeall)

function MissionInfoMiniTab(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 30 * _1080p, 0, 120 * _1080p)

	var_1_0.id = "MissionInfoMiniTab"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "BlurBackground"

	var_1_4:SetBlurStrength(2.75, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BlurBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Top"

	var_1_6:SetRGBFromTable(SWATCHES.MissionSelectButton.tabBackgroundFocus, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_1_0:addElement(var_1_6)

	var_1_0.Top = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "NumText"

	var_1_8:setText("3", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_1_0:addElement(var_1_8)

	var_1_0.NumText = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -12, _1080p * 12, 0, _1080p * 24)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Gradient"

	var_1_12:SetRGBFromInt(0, 0)
	var_1_12:SetAlpha(0.4, 0)
	var_1_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_0:addElement(var_1_12)

	var_1_0.Gradient = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_14)

	local var_1_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Locked", var_1_15)

	local function var_1_16()
		var_1_8:AnimateSequence("Locked")
		var_1_10:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_16

	local var_1_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Unlocked", var_1_17)

	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Unlocked", var_1_18)

	local function var_1_19()
		var_1_8:AnimateSequence("Unlocked")
		var_1_10:AnimateSequence("Unlocked")
	end

	var_1_0._sequences.Unlocked = var_1_19

	var_1_4:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_4:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
	end)
	var_1_4:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_4:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("MissionInfoMiniTab", MissionInfoMiniTab)
LockTable(_M)
