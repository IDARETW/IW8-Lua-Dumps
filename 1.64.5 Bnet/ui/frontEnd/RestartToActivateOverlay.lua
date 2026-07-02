module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isRestartRequiredToActivate or false then
		ACTIONS.AnimateSequence(arg_1_0, "Enable")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Disable")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateOverlay = var_0_0
end

function RestartToActivateOverlay(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 68 * _1080p)

	var_3_0.id = "RestartToActivateOverlay"
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

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.65, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Label"

	var_3_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/RESTART_TO_ACTIVATE"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetUseEllipses(ELLIPSES.enabled)
	var_3_6:SetStartupDelay(1000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(150)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(1000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 24, _1080p * -24)
	var_3_0:addElement(var_3_6)

	var_3_0.Label = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Enable", var_3_9)

	local var_3_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Enable", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("Enable")
		var_3_6:AnimateSequence("Enable")
	end

	var_3_0._sequences.Enable = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Disable", var_3_13)

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Disable", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("Disable")
		var_3_6:AnimateSequence("Disable")
	end

	var_3_0._sequences.Disable = var_3_15

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RestartToActivateOverlay", RestartToActivateOverlay)
LockTable(_M)
