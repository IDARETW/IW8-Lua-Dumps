module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.DigitOnes,
		arg_1_0.DigitTens,
		arg_1_0.DigitTenths,
		arg_1_0.DigitHundredths
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("retroT9")
	end

	local var_1_1
	local var_1_2 = 0
	local var_1_3 = 0
	local var_1_4 = 0

	local function var_1_5(arg_2_0)
		ACTIONS.AnimateSequence(arg_1_0, arg_2_0)

		var_1_1 = arg_2_0
	end

	local function var_1_6()
		if var_1_1 == "Offline" then
			return
		end

		local var_3_0 = var_1_4

		if var_1_3 <= 0 then
			var_1_3 = 1
		end

		var_1_4 = LUI.Round(var_1_2 / var_1_3, 2)

		if var_1_4 >= 100 then
			var_1_4 = 99.99
		end

		if tonumber(var_3_0) and var_3_0 > 0 then
			if var_3_0 < var_1_4 then
				ACTIONS.AnimateSequence(arg_1_0, "Increase")
			elseif var_3_0 > var_1_4 then
				ACTIONS.AnimateSequence(arg_1_0, "Decrease")
			end
		end

		local var_3_1 = tostring(var_1_4)
		local var_3_2 = {}
		local var_3_3 = {}
		local var_3_4 = false

		for iter_3_0 = 1, #var_3_1 do
			local var_3_5 = string.sub(tostring(var_3_1), iter_3_0, iter_3_0)

			if tonumber(var_3_5) then
				if var_3_4 then
					table.insert(var_3_3, var_3_5)
				else
					table.insert(var_3_2, var_3_5)
				end
			else
				var_3_4 = true
			end
		end

		arg_1_0.DigitOnes:SetCounterDigit(var_3_2[1], 1)
		arg_1_0.DigitTens:SetCounterDigit(var_3_2[2], 2)
		arg_1_0.DigitTenths:SetCounterDigit(var_3_3[1], 3)
		arg_1_0.DigitHundredths:SetCounterDigit(var_3_3[2], 4)
	end

	if Engine.DDJFBBJAIG() then
		var_1_5("Show")
		var_1_6()
	elseif Engine.EAIICIFIFA() then
		var_1_5("Offline")
	else
		local var_1_7 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id")
		local var_1_8 = DataSources.inGame.currentPlayerStateClientNum
		local var_1_9 = DataSources.inGame.player.spawnNotify

		local function var_1_10()
			if CONDITIONS.IsSpectating(arg_1_1) or CONDITIONS.InKillCam(arg_1_1) or CONDITIONS.IsSplitscreen(arg_1_0) then
				var_1_5("Offline")
			else
				var_1_5("Show")
			end
		end

		var_1_10()
		arg_1_0:SubscribeToModel(var_1_7:GetModel(arg_1_1), var_1_10)
		arg_1_0:SubscribeToModel(var_1_8:GetModel(arg_1_1), var_1_10)
		arg_1_0:SubscribeToModel(var_1_9:GetModel(arg_1_1), var_1_10)

		local function var_1_11()
			var_1_3 = Game.BCGGJBIEEH()
			var_1_2 = Game.CJGJICCGAJ()
		end

		local var_1_12

		local function var_1_13()
			var_1_11()

			if var_1_3 and var_1_2 then
				var_1_6()
			elseif not arg_1_0.wait then
				arg_1_0.wait = arg_1_0:Wait(500)

				function arg_1_0.wait.onComplete()
					var_1_13()
				end
			end
		end

		local var_1_14 = DataSources.inGame.MP.match.teamScoreFriendly

		arg_1_0:SubscribeToModel(var_1_14:GetModel(arg_1_1), var_1_13)

		local var_1_15 = DataSources.inGame.MP.match.teamScoreEnemy

		arg_1_0:SubscribeToModel(var_1_15:GetModel(arg_1_1), var_1_13)

		local var_1_16 = DataSources.inGame.HUD.pointsPopupNotify

		arg_1_0:SubscribeToModel(var_1_16:GetModel(arg_1_1), var_1_13)

		local var_1_17 = LUI.DataSourceFromOmnvar.new("ui_life_kill_count")

		arg_1_0:SubscribeToModel(var_1_17:GetModel(arg_1_1), var_1_13)
		var_1_6()
	end
end

function WatchRatioT9(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_8_0.id = "WatchRatioT9"
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

	var_8_4:SetRGBFromInt(16775536, 0)
	var_8_4:SetAlpha(0, 0)
	var_8_4:SetScale(0.5, 0)
	var_8_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE")), 0)
	var_8_4:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_8_4:SetAlignment(LUI.Alignment.Center)
	var_8_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 416, _1080p * 324, _1080p * 360)
	var_8_0:addElement(var_8_4)

	var_8_0.OfflineMessage = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "DigitHundredths"

	var_8_6:SetRGBFromInt(16775536, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 312, _1080p * 400, _1080p * 284, _1080p * 400)
	var_8_0:addElement(var_8_6)

	var_8_0.DigitHundredths = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "DigitTenths"

	var_8_8:SetRGBFromInt(16775536, 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 224, _1080p * 312, _1080p * 284, _1080p * 400)
	var_8_0:addElement(var_8_8)

	var_8_0.DigitTenths = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Dot"

	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 204, _1080p * 220, _1080p * 378, _1080p * 394)
	var_8_0:addElement(var_8_10)

	var_8_0.Dot = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "DigitOnes"

	var_8_12:SetRGBFromInt(16775536, 0)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112, _1080p * 200, _1080p * 284, _1080p * 400)
	var_8_0:addElement(var_8_12)

	var_8_0.DigitOnes = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "DigitTens"

	var_8_14:SetRGBFromInt(16775536, 0)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 112, _1080p * 284, _1080p * 400)
	var_8_0:addElement(var_8_14)

	var_8_0.DigitTens = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIImage.new()

	var_8_16.id = "Dash"

	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 420, _1080p * 468, _1080p * 338, _1080p * 346)
	var_8_0:addElement(var_8_16)

	var_8_0.Dash = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIImage.new()

	var_8_18.id = "UpArrow"

	var_8_18:setImage(RegisterMaterial("icon_arrow_up"), 0)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 412, _1080p * 476, _1080p * 288, _1080p * 320)
	var_8_0:addElement(var_8_18)

	var_8_0.UpArrow = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "DownArrow"

	var_8_20:SetZRotation(180, 0)
	var_8_20:setImage(RegisterMaterial("icon_arrow_up"), 0)
	var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 412, _1080p * 476, _1080p * 364, _1080p * 396)
	var_8_0:addElement(var_8_20)

	var_8_0.DownArrow = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Offline", var_8_23)

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Offline", var_8_24)

	local var_8_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Offline", var_8_25)

	local var_8_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Offline", var_8_26)

	local var_8_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Offline", var_8_27)

	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Offline", var_8_28)

	local var_8_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Offline", var_8_29)

	local var_8_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("Offline", var_8_30)

	local var_8_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Offline", var_8_31)

	local function var_8_32()
		var_8_4:AnimateSequence("Offline")
		var_8_6:AnimateSequence("Offline")
		var_8_8:AnimateSequence("Offline")
		var_8_10:AnimateSequence("Offline")
		var_8_12:AnimateSequence("Offline")
		var_8_14:AnimateSequence("Offline")
		var_8_16:AnimateSequence("Offline")
		var_8_18:AnimateSequence("Offline")
		var_8_20:AnimateSequence("Offline")
	end

	var_8_0._sequences.Offline = var_8_32

	local var_8_33
	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Show", var_8_34)

	local var_8_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Show", var_8_35)

	local var_8_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Show", var_8_36)

	local var_8_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Show", var_8_37)

	local var_8_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Show", var_8_38)

	local var_8_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Show", var_8_39)

	local var_8_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Show", var_8_40)

	local var_8_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("Show", var_8_41)

	local var_8_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Show", var_8_42)

	local function var_8_43()
		var_8_4:AnimateSequence("Show")
		var_8_6:AnimateSequence("Show")
		var_8_8:AnimateSequence("Show")
		var_8_10:AnimateSequence("Show")
		var_8_12:AnimateSequence("Show")
		var_8_14:AnimateSequence("Show")
		var_8_16:AnimateSequence("Show")
		var_8_18:AnimateSequence("Show")
		var_8_20:AnimateSequence("Show")
	end

	var_8_0._sequences.Show = var_8_43

	local var_8_44
	local var_8_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 3800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Increase", var_8_45)

	local var_8_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("Increase", var_8_46)

	local var_8_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Increase", var_8_47)

	local function var_8_48()
		var_8_16:AnimateSequence("Increase")
		var_8_18:AnimateSequence("Increase")
		var_8_20:AnimateSequence("Increase")
	end

	var_8_0._sequences.Increase = var_8_48

	local var_8_49
	local var_8_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 3800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Decrease", var_8_50)

	local var_8_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("Decrease", var_8_51)

	local var_8_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Decrease", var_8_52)

	local function var_8_53()
		var_8_16:AnimateSequence("Decrease")
		var_8_18:AnimateSequence("Decrease")
		var_8_20:AnimateSequence("Decrease")
	end

	var_8_0._sequences.Decrease = var_8_53

	var_0_0(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "Rotate")

	return var_8_0
end

MenuBuilder.registerType("WatchRatioT9", WatchRatioT9)
LockTable(_M)
