module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4,
		arg_1_0.Digit5,
		arg_1_0.Digit6,
		arg_1_0.Digit7
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("retroT9")
	end

	local var_1_1
	local var_1_2 = 0

	local function var_1_3(arg_2_0)
		ACTIONS.AnimateSequence(arg_1_0, arg_2_0)

		var_1_1 = arg_2_0
	end

	local function var_1_4()
		if var_1_1 == "Offline" then
			return
		end

		local var_3_0 = tostring(var_1_2)
		local var_3_1 = {}

		for iter_3_0 = 1, #var_1_0 do
			local var_3_2 = tonumber(string.sub(var_3_0, iter_3_0, iter_3_0))

			if var_3_2 then
				table.insert(var_3_1, var_3_2)
			else
				table.insert(var_3_1, 1, 0)
			end
		end

		for iter_3_1 = 1, #var_1_0 do
			var_1_0[iter_3_1]:SetCounterDigit(var_3_1[iter_3_1], iter_3_1, #var_3_1)
		end
	end

	if Engine.DDJFBBJAIG() then
		var_1_3("Show")
		var_1_4()
	elseif Engine.EAIICIFIFA() then
		var_1_3("Offline")
	else
		local var_1_5 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id")
		local var_1_6 = DataSources.inGame.currentPlayerStateClientNum
		local var_1_7 = DataSources.inGame.player.spawnNotify

		local function var_1_8()
			if CONDITIONS.IsSpectating(arg_1_1) or CONDITIONS.InKillCam(arg_1_1) or CONDITIONS.IsSplitscreen(arg_1_0) then
				var_1_3("Offline")
			else
				var_1_3("Show")
			end
		end

		var_1_8()
		arg_1_0:SubscribeToModel(var_1_5:GetModel(arg_1_1), var_1_8)
		arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), var_1_8)
		arg_1_0:SubscribeToModel(var_1_7:GetModel(arg_1_1), var_1_8)

		local function var_1_9()
			var_1_2 = Game.CJGJICCGAJ()
		end

		local var_1_10

		local function var_1_11()
			var_1_9()

			if var_1_2 then
				var_1_4()
			elseif not arg_1_0.wait then
				arg_1_0.wait = arg_1_0:Wait(500)

				function arg_1_0.wait.onComplete()
					var_1_11()
				end
			end
		end

		local var_1_12 = DataSources.inGame.MP.match.teamScoreFriendly

		arg_1_0:SubscribeToModel(var_1_12:GetModel(arg_1_1), var_1_11)

		local var_1_13 = DataSources.inGame.MP.match.teamScoreEnemy

		arg_1_0:SubscribeToModel(var_1_13:GetModel(arg_1_1), var_1_11)

		local var_1_14 = DataSources.inGame.HUD.pointsPopupNotify

		arg_1_0:SubscribeToModel(var_1_14:GetModel(arg_1_1), var_1_11)

		local var_1_15 = LUI.DataSourceFromOmnvar.new("ui_life_kill_count")

		arg_1_0:SubscribeToModel(var_1_15:GetModel(arg_1_1), var_1_11)
		var_1_4()
	end
end

function WatchKillTrackerT9(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_8_0.id = "WatchKillTrackerT9"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIText.new()

	var_8_4.id = "OfflineMessage"

	var_8_4:SetRGBFromInt(15361389, 0)
	var_8_4:SetAlpha(0, 0)
	var_8_4:SetScale(0.5, 0)
	var_8_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE")), 0)
	var_8_4:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_8_4:SetAlignment(LUI.Alignment.Center)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 154, _1080p * 414, _1080p * 238, _1080p * 274)
	var_8_0:addElement(var_8_4)

	var_8_0.OfflineMessage = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Digit4"

	var_8_6:SetRGBFromInt(15361389, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 394, _1080p * 478, _1080p * 202, _1080p * 310)
	var_8_0:addElement(var_8_6)

	var_8_0.Digit4 = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Digit3"

	var_8_8:SetRGBFromInt(15361389, 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 292, _1080p * 376, _1080p * 202, _1080p * 310)
	var_8_0:addElement(var_8_8)

	var_8_0.Digit3 = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "Digit2"

	var_8_10:SetRGBFromInt(15361389, 0)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 276, _1080p * 202, _1080p * 310)
	var_8_0:addElement(var_8_10)

	var_8_0.Digit2 = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "Digit1"

	var_8_12:SetRGBFromInt(15361389, 0)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 174, _1080p * 202, _1080p * 310)
	var_8_0:addElement(var_8_12)

	var_8_0.Digit1 = var_8_12

	local function var_8_13()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_8_4:RegisterAnimationSequence("Offline", var_8_15)

	local var_8_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Offline", var_8_16)

	local var_8_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Offline", var_8_17)

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Offline", var_8_18)

	local var_8_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Offline", var_8_19)

	local function var_8_20()
		var_8_4:AnimateSequence("Offline")
		var_8_6:AnimateSequence("Offline")
		var_8_8:AnimateSequence("Offline")
		var_8_10:AnimateSequence("Offline")
		var_8_12:AnimateSequence("Offline")
	end

	var_8_0._sequences.Offline = var_8_20

	local var_8_21
	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Show", var_8_22)

	local var_8_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Show", var_8_23)

	local var_8_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Show", var_8_24)

	local var_8_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Show", var_8_25)

	local var_8_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Show", var_8_26)

	local function var_8_27()
		var_8_4:AnimateSequence("Show")
		var_8_6:AnimateSequence("Show")
		var_8_8:AnimateSequence("Show")
		var_8_10:AnimateSequence("Show")
		var_8_12:AnimateSequence("Show")
	end

	var_8_0._sequences.Show = var_8_27

	var_0_0(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "Rotate")

	return var_8_0
end

MenuBuilder.registerType("WatchKillTrackerT9", WatchKillTrackerT9)
LockTable(_M)
