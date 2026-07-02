module(..., package.seeall)

local var_0_0 = {
	LOOP = "seasonal_event_overlay_loop",
	ACTION = "seasonal_event_overlay_action"
}
local var_0_1 = {
	ACTION_SFX = "seasonal_event_overlay_action",
	LOOP_SFX = ""
}
local var_0_2 = {
	FADE_OUT_BACKGROUND = "FadeOutBackground",
	FADE_OUT_BUTTON_PROMPT = "FadeOutHoldButton",
	FADE_OUT_BUTTON = "FadeOutButton"
}
local var_0_3 = {
	UNWRAP = "SEASONAL_EVENT/UNWRAP"
}
local var_0_4 = {
	PRESS_DURATION = 1,
	FILL_COMPLETE_DELAY = 500,
	HOLD_DURATION = 1000,
	TIMER_INTERVAL = 500
}

local function var_0_5(arg_1_0)
	return var_0_3.UNWRAP
end

local function var_0_6(arg_2_0)
	return var_0_4.HOLD_DURATION
end

local function var_0_7(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2 then
		Engine.BIFAAAECJJ(arg_3_1, arg_3_3)
	else
		Engine.DFCGFCGBFD(arg_3_1, arg_3_3)
	end

	arg_3_0._startFlag = true
end

local function var_0_8(arg_4_0)
	var_0_7(arg_4_0, var_0_0.LOOP, false, VideoPlaybackFlags.LOOP)

	if #var_0_1.LOOP_SFX > 0 then
		Engine.BBEEIGHJBA(var_0_1.LOOP_SFX)
	end
end

local function var_0_9(arg_5_0)
	local var_5_0 = VideoPlaybackFlags.UNUSED

	var_0_7(arg_5_0, var_0_0.ACTION, false, var_5_0)

	if #var_0_1.ACTION_SFX > 0 then
		Engine.BJDBIAGIDA(var_0_1.ACTION_SFX)
	end
end

local function var_0_10(arg_6_0)
	local var_6_0 = SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData()

	if var_6_0 then
		var_6_0.MarkCompleted(arg_6_0, arg_6_0._controllerIndex)
	end
end

local function var_0_11(arg_7_0)
	arg_7_0._startFlag = false

	if Engine.IGAJBFHE() then
		Engine.EBCGADABJ()
		Engine.CGDBJBGBHI(1, 0.5)
	end

	var_0_10(arg_7_0)
end

local function var_0_12(arg_8_0)
	var_0_9(arg_8_0)

	local var_8_0 = arg_8_0._isGamepadInput and var_0_2.FADE_OUT_BUTTON_PROMPT or var_0_2.FADE_OUT_BUTTON

	ACTIONS.AnimateSequence(arg_8_0, var_8_0)
	ACTIONS.AnimateSequence(arg_8_0, var_0_2.FADE_OUT_BACKGROUND)
	arg_8_0.SetupCheckBinkFinishedTimer(arg_8_0)
end

local function var_0_13(arg_9_0, arg_9_1)
	local var_9_0 = LUI.IsLastInputGamepad(arg_9_0._controllerIndex)

	arg_9_0._isGamepadInput = var_9_0

	arg_9_0.Button:SetAlpha(var_9_0 and 0 or 1)
	arg_9_0.HoldButtonPrompt:SetAlpha(var_9_0 and 1 or 0)
end

local function var_0_14(arg_10_0)
	local var_10_0 = {
		isCentered = true,
		buttonRef = "button_primary",
		clickKBM = false,
		requireFocus = false,
		isBackgroundEnabled = true,
		buttons = {
			primary = true
		},
		label = var_0_5(arg_10_0),
		duration = var_0_6(arg_10_0),
		onFillCompleteDelay = var_0_4.FILL_COMPLETE_DELAY,
		progressColor = SWATCHES.WZGlobalSwatches.WZHighlight
	}

	arg_10_0.HoldButtonPrompt:SetupPrompt(var_10_0)
end

local function var_0_15(arg_11_0)
	local var_11_0 = LUI.UITimer.new({
		interval = var_0_4.TIMER_INTERVAL,
		event = {
			name = "check_bink_finished"
		}
	})

	var_11_0.id = "CheckBinkFinishedTimer"

	arg_11_0:addElement(var_11_0)

	arg_11_0.CheckBinkFinishedTimer = var_11_0

	arg_11_0.CheckBinkFinishedTimer:addEventHandler("check_bink_finished", function()
		if arg_11_0._startFlag and Engine.BCJJBCDGAC() then
			ACTIONS.LeaveMenu(arg_11_0)
		end
	end)
end

local function var_0_16(arg_13_0)
	arg_13_0:registerAndCallEventHandler("update_input_type", var_0_13, {
		controllerIndex = arg_13_0._controllerIndex
	})
	arg_13_0.HoldButtonPrompt:addEventHandler("button_hold_complete", function(arg_14_0, arg_14_1)
		if arg_13_0._isGamepadInput then
			var_0_12(arg_13_0)
		end
	end)
	arg_13_0.Button:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		if not arg_13_0._isGamepadInput then
			var_0_12(arg_13_0)
		end
	end)
	arg_13_0:addEventHandler("menu_close", function(arg_16_0, arg_16_1)
		var_0_11(arg_13_0)
	end)
	arg_13_0:addEventHandler("menu_close_all", function(arg_17_0, arg_17_1)
		var_0_11(arg_13_0)
	end)
end

local function var_0_17(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0._controllerIndex = arg_18_1
	arg_18_0._startFlag = false
	arg_18_0.SetupCheckBinkFinishedTimer = var_0_15

	var_0_14(arg_18_0)
	var_0_16(arg_18_0)
	var_0_8(arg_18_0)
end

function SeasonalEventMenuOverlay(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "SeasonalEventMenuOverlay"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Background"

	var_19_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Background = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "Cinematic"

	var_19_0:addElement(var_19_6)

	var_19_0.Cinematic = var_19_6

	local var_19_7
	local var_19_8 = MenuBuilder.BuildRegisteredType("GenericHoldButtonPrompt", {
		controllerIndex = var_19_1
	})

	var_19_8.id = "HoldButtonPrompt"

	var_19_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -152, _1080p * 152, _1080p * -289, _1080p * -245)
	var_19_0:addElement(var_19_8)

	var_19_0.HoldButtonPrompt = var_19_8

	local var_19_9
	local var_19_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_19_1
	})

	var_19_10.id = "Button"

	var_19_10.Text:SetLeft(_1080p * 20, 0)
	var_19_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/UNWRAP")), 0)
	var_19_10.Text:SetAlignment(LUI.Alignment.Center)
	var_19_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -152, _1080p * 152, _1080p * -289, _1080p * -245)
	var_19_0:addElement(var_19_10)

	var_19_0.Button = var_19_10

	local var_19_11
	local var_19_12 = LUI.UIImage.new()

	var_19_12.id = "VignetteRight"

	var_19_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_12:setImage(RegisterMaterial("gradient_curve"), 0)
	var_19_12:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 44, _1080p * -424, 0, 0)
	var_19_0:addElement(var_19_12)

	var_19_0.VignetteRight = var_19_12

	local var_19_13
	local var_19_14 = LUI.UIImage.new()

	var_19_14.id = "VignetteLeft"

	var_19_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_14:SetYRotation(180, 0)
	var_19_14:setImage(RegisterMaterial("gradient_curve"), 0)
	var_19_14:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 440, _1080p * -28, 0, 0)
	var_19_0:addElement(var_19_14)

	var_19_0.VignetteLeft = var_19_14

	local var_19_15
	local var_19_16 = LUI.UIImage.new()

	var_19_16.id = "LeftBlocker"

	var_19_16:SetRGBFromInt(0, 0)
	var_19_16:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -307, 0, 0, 0)
	var_19_0:addElement(var_19_16)

	var_19_0.LeftBlocker = var_19_16

	local var_19_17
	local var_19_18 = LUI.UIImage.new()

	var_19_18.id = "RightBlocker"

	var_19_18:SetRGBFromInt(0, 0)
	var_19_18:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * 307, 0, 0)
	var_19_0:addElement(var_19_18)

	var_19_0.RightBlocker = var_19_18

	local function var_19_19()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_19

	local var_19_20
	local var_19_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_19_8:RegisterAnimationSequence("FadeOutHoldButton", var_19_21)

	local function var_19_22()
		var_19_8:AnimateSequence("FadeOutHoldButton")
	end

	var_19_0._sequences.FadeOutHoldButton = var_19_22

	local var_19_23
	local var_19_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("FadeOutBackground", var_19_24)

	local function var_19_25()
		var_19_4:AnimateSequence("FadeOutBackground")
	end

	var_19_0._sequences.FadeOutBackground = var_19_25

	local var_19_26
	local var_19_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("FadeOutButton", var_19_27)

	local function var_19_28()
		var_19_10:AnimateSequence("FadeOutButton")
	end

	var_19_0._sequences.FadeOutButton = var_19_28

	var_0_17(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("SeasonalEventMenuOverlay", SeasonalEventMenuOverlay)
LockTable(_M)
