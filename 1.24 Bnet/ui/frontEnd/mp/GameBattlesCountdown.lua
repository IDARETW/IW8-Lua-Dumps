module(..., package.seeall)

local var_0_0 = "%02d"
local var_0_1 = 100
local var_0_2 = 3600
local var_0_3 = 24 * var_0_2

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = math.floor(arg_1_1 / var_0_3 % 30)
	local var_1_1 = math.floor(arg_1_1 / var_0_2 % 24)
	local var_1_2 = math.floor(arg_1_1 / 60 % 60)
	local var_1_3 = arg_1_1 % 60

	arg_1_0.Days.Value:setText(string.format(var_0_0, var_1_0), 0)
	arg_1_0.Hours.Value:setText(string.format(var_0_0, var_1_1), 0)
	arg_1_0.Mins.Value:setText(string.format(var_0_0, var_1_2), 0)
	arg_1_0.Secs.Value:setText(string.format(var_0_0, var_1_3), 0)
end

local function var_0_5(arg_2_0, arg_2_1)
	local var_2_0 = MLG.GetGameBattleIntermissionTimeLeft()

	if var_2_0 ~= nil then
		return math.ceil(var_2_0 / 1000) - arg_2_1
	end

	return Engine.CCEJJCCDEG(arg_2_0)
end

local function var_0_6(arg_3_0)
	return function()
		local var_4_0 = var_0_5(Engine.BAHGDJFBEF(arg_3_0.targetEpochDate, GAMEBATTLES.GetNoshowTime()), 0)

		var_0_4(arg_3_0, var_4_0)

		if var_4_0 <= 0 then
			arg_3_0:dispatchEventToRoot({
				dispatchChildren = true,
				name = "no_show_countdown_stop",
				immediate = not Lobby.DFFFFJHCEH()
			})
			arg_3_0:StopCountdown()
		else
			arg_3_0.CountdownTween = arg_3_0:Wait(var_0_1)
			arg_3_0.CountdownTween.onComplete = arg_3_0:UpdateNoShowCountdown()
		end
	end
end

local function var_0_7(arg_5_0)
	arg_5_0:StopCountdown()
	ACTIONS.AnimateSequence(arg_5_0, "StartNoShowCountdown")
	ACTIONS.AnimateSequence(arg_5_0, "NoShowCountdown")
	var_0_6(arg_5_0)()

	arg_5_0.CountdownTweenRunning = true
end

local function var_0_8(arg_6_0)
	return function()
		local var_7_0 = var_0_5(arg_6_0.targetEpochDate, GAMEBATTLES.GetNoshowTime())

		var_0_4(arg_6_0, var_7_0)

		if var_7_0 <= 0 then
			arg_6_0:StartNoShowCountdown()
		else
			arg_6_0.CountdownTween = arg_6_0:Wait(var_0_1)
			arg_6_0.CountdownTween.onComplete = arg_6_0:UpdateMatchCountdown()
		end
	end
end

local function var_0_9(arg_8_0, arg_8_1)
	arg_8_0.targetEpochDate = arg_8_1

	arg_8_0:StopCountdown()
	var_0_8(arg_8_0)()

	arg_8_0.CountdownTweenRunning = true
end

local function var_0_10(arg_9_0)
	return function()
		local var_10_0 = var_0_5(arg_9_0.intermissionEndTime, 0)

		var_0_4(arg_9_0, var_10_0)

		if var_10_0 <= 0 then
			arg_9_0:dispatchEventToRoot({
				dispatchChildren = true,
				name = "no_show_countdown_stop",
				immediate = not Lobby.DFFFFJHCEH()
			})
			arg_9_0:StopCountdown()
		else
			arg_9_0.CountdownTween = arg_9_0:Wait(var_0_1)
			arg_9_0.CountdownTween.onComplete = arg_9_0:UpdateIntermissionCountdown()
		end
	end
end

local function var_0_11(arg_11_0, arg_11_1)
	ACTIONS.AnimateSequence(arg_11_0, "StartNoShowCountdown")
	ACTIONS.AnimateSequence(arg_11_0, "NoShowCountdown")

	if arg_11_1 and MLG.GetGameBattleIntermissionTimeLeft() == nil then
		Lobby.EBBJJFGGIH(true)
		MLG.StartGameBattleIntermission(GAMEBATTLES.GetIntermissionTime())
	end

	arg_11_0.intermissionEndTime = Engine.BAHGDJFBEF(Engine.DCJHCAFIIA(), GAMEBATTLES.GetIntermissionTime())

	var_0_10(arg_11_0)()

	arg_11_0.CountdownTweenRunning = true
end

local function var_0_12(arg_12_0)
	if arg_12_0.targetEpochDate then
		if arg_12_0.CountdownTweenRunning then
			function arg_12_0.CountdownTween.onComplete()
				return
			end
		end

		arg_12_0.CountdownTweenRunning = false
	end
end

local function var_0_13(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.targetEpochDate = nil
	arg_14_0.intermissionEndTime = nil
	arg_14_0.StartCountdownToTargetEpochDate = var_0_9
	arg_14_0.StartNoShowCountdown = var_0_7
	arg_14_0.StopCountdown = var_0_12
	arg_14_0.UpdateMatchCountdown = var_0_8
	arg_14_0.UpdateNoShowCountdown = var_0_6
	arg_14_0.StartIntermissionCountdown = var_0_11
	arg_14_0.UpdateIntermissionCountdown = var_0_10
end

function GameBattlesCountdown(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 60 * _1080p)

	var_15_0.id = "GameBattlesCountdown"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("GameBattlesCountdownElement", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "Secs"

	var_15_4.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SECONDS_SHORT"), 0)
	var_15_4.Value:setText("05", 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 240, _1080p * 320, 0, _1080p * 60)
	var_15_0:addElement(var_15_4)

	var_15_0.Secs = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("GameBattlesCountdownElement", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "Mins"

	var_15_6.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MINUTES_SHORT"), 0)
	var_15_6.Value:setText("44", 0)
	var_15_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160, _1080p * 240, 0, _1080p * 60)
	var_15_0:addElement(var_15_6)

	var_15_0.Mins = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("GameBattlesCountdownElement", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "Hours"

	var_15_8.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/HOURS_SHORT"), 0)
	var_15_8.Value:setText("07", 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 160, 0, _1080p * 60)
	var_15_0:addElement(var_15_8)

	var_15_0.Hours = var_15_8

	local var_15_9
	local var_15_10 = MenuBuilder.BuildRegisteredType("GameBattlesCountdownElement", {
		controllerIndex = var_15_1
	})

	var_15_10.id = "Days"

	var_15_10.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/DAYS_SHORT"), 0)
	var_15_10.Value:setText("28", 0)
	var_15_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 80, 0, _1080p * 60)
	var_15_0:addElement(var_15_10)

	var_15_0.Days = var_15_10

	local function var_15_11()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_11

	local var_15_12 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_15_0.Secs.BackgroundHighlight
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.inactive,
			easing = LUI.EASING.inQuadratic,
			child = var_15_0.Secs.BackgroundHighlight
		},
		{
			value = 16777215,
			duration = 500,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outQuadratic,
			child = var_15_0.Secs.BackgroundHighlight
		}
	}

	var_15_4:RegisterAnimationSequence("NoShowCountdown", var_15_12)

	local var_15_13 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_15_0.Mins.BackgroundHighlight
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.inactive,
			easing = LUI.EASING.inQuadratic,
			child = var_15_0.Mins.BackgroundHighlight
		},
		{
			value = 16777215,
			duration = 500,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outQuadratic,
			child = var_15_0.Mins.BackgroundHighlight
		}
	}

	var_15_6:RegisterAnimationSequence("NoShowCountdown", var_15_13)

	local function var_15_14()
		var_15_4:AnimateLoop("NoShowCountdown")
		var_15_6:AnimateLoop("NoShowCountdown")
	end

	var_15_0._sequences.NoShowCountdown = var_15_14

	local var_15_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 240
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 80
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_4:RegisterAnimationSequence("StartNoShowCountdown", var_15_15)

	local var_15_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 80
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_6:RegisterAnimationSequence("StartNoShowCountdown", var_15_16)

	local var_15_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("StartNoShowCountdown", var_15_17)

	local var_15_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("StartNoShowCountdown", var_15_18)

	local function var_15_19()
		var_15_4:AnimateSequence("StartNoShowCountdown")
		var_15_6:AnimateSequence("StartNoShowCountdown")
		var_15_8:AnimateSequence("StartNoShowCountdown")
		var_15_10:AnimateSequence("StartNoShowCountdown")
	end

	var_15_0._sequences.StartNoShowCountdown = var_15_19

	var_0_13(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("GameBattlesCountdown", GameBattlesCountdown)
LockTable(_M)
