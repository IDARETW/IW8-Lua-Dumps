module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = 1
	local var_1_1

	local function var_1_2()
		arg_1_0:Wait(100).onComplete = function()
			if var_1_0 <= #arg_1_0._summaryWidgets then
				ACTIONS.AnimateSequence(arg_1_0._summaryWidgets[var_1_0], "Intro")

				var_1_0 = var_1_0 + 1

				var_1_2()
			end
		end
	end

	var_1_2()
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = PROGRESSION.GetPlayerRank(arg_4_1)
	local var_4_1 = PROGRESSION.GetPlayerIsInSeasonalProgression(arg_4_1)

	if var_4_1 then
		return nil
	end

	local var_4_2 = AAR.GetUnlockIDTableAtRank(arg_4_1, var_4_0, var_4_1)

	while var_4_0 > 0 and var_4_2[1] == nil do
		var_4_0 = var_4_0 - 1
		var_4_2 = AAR.GetUnlockIDTableAtRank(arg_4_1, var_4_0, var_4_1)
	end

	return var_4_2[1]
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.AARProgression)
	assert(arg_5_0.AARUnlocks)
	assert(arg_5_0.AARNextUnlocks)

	arg_5_0._summaryWidgets = {
		arg_5_0.AARUnlocks,
		arg_5_0.AARNextUnlocks
	}

	ACTIONS.AnimateSequence(arg_5_0, "ShowRewards")

	local var_5_0 = true

	if CONDITIONS.AreKeysEnabled() then
		var_5_0 = false

		arg_5_0.AARRewards:InitKeyReward(arg_5_1, arg_5_2.matchDataPackage)
	end

	if CONDITIONS.IsBattlePassEnabled() and arg_5_0.BattlePassTierPanel then
		var_5_0 = false

		arg_5_0.BattlePassTierPanel:InitTierProgression(arg_5_1, arg_5_2.matchDataPackage.startTierXP, arg_5_2.matchDataPackage.currentTierXP)
	end

	local var_5_1 = AAR.GetNewUnlocksTable(arg_5_0, arg_5_1, arg_5_2.matchDataPackage.unlocks)
	local var_5_2 = AAR.GetNextRankUnlockID(arg_5_1)

	if #var_5_1 > 0 then
		arg_5_0.AARUnlocks:InitUnlock(arg_5_1, var_5_1, true)
		arg_5_0.AARNextUnlocks:InitUnlock(arg_5_1, unlockID, var_5_2)
		ACTIONS.AnimateSequence(arg_5_0, var_5_0 and "IntroNewUnlockCenter" or "IntroNewUnlock")
		ACTIONS.AnimateSequence(arg_5_0.AARUnlocks, "UnlockedNewItems")
	elseif PROGRESSION.GetPlayerAtMaxRank(arg_5_1) then
		ACTIONS.AnimateSequence(arg_5_0, var_5_0 and "IntroRankMaxCenter" or "IntroRankMax")
	else
		local var_5_3

		if PROGRESSION.GetPlayerRank(arg_5_1) > 0 then
			local var_5_4 = var_0_1(arg_5_0, arg_5_1)
			local var_5_5 = not var_5_4 and true or false
			local var_5_6 = var_5_5 and {} or {
				{
					ID = var_5_4
				}
			}

			arg_5_0.AARUnlocks:InitUnlock(arg_5_1, var_5_6, false, var_5_5)
		else
			local var_5_7 = true

			arg_5_0.AARUnlocks:InitUnlock(arg_5_1, {}, false, var_5_7)
		end

		arg_5_0.AARNextUnlocks:InitUnlock(arg_5_1, unlockID, var_5_2)
		ACTIONS.AnimateSequence(arg_5_0, var_5_0 and "IntroNoUnlockCenter" or "IntroNoUnlock")
	end

	arg_5_0.AARProgression:InitProgression(arg_5_1, arg_5_2.matchDataPackage)
end

function AARSummary(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "AARSummary"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("AARStats", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "AARStats"

	var_6_4:SetAlpha(0, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1274, _1080p * 1824, _1080p * 200, _1080p * 560)
	var_6_0:addElement(var_6_4)

	var_6_0.AARStats = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("AARNextUnlocks", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "AARNextUnlocks"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 685, _1080p * 1235, _1080p * 598, _1080p * 958)
	var_6_0:addElement(var_6_6)

	var_6_0.AARNextUnlocks = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("AARUnlocks", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "AARUnlocks"

	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 646, _1080p * 598, _1080p * 958)
	var_6_0:addElement(var_6_8)

	var_6_0.AARUnlocks = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("AARProgression", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "AARProgression"

	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1235, _1080p * 200, _1080p * 560)
	var_6_0:addElement(var_6_10)

	var_6_0.AARProgression = var_6_10

	local var_6_11

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		var_6_11 = MenuBuilder.BuildRegisteredType("AARRewards", {
			controllerIndex = var_6_1
		})
		var_6_11.id = "AARRewards"

		var_6_11:SetAlpha(0, 0)
		var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1274, _1080p * 1824, _1080p * 200, _1080p * 958)
		var_6_0:addElement(var_6_11)

		var_6_0.AARRewards = var_6_11
	end

	local var_6_12
	local var_6_13 = LUI.UIText.new()

	var_6_13.id = "MaxRankLabel"

	var_6_13:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_13:SetAlpha(0, 0)
	var_6_13:setText(Engine.CBBHFCGDIC("LUA_MENU/ALL_UNLOCKED"), 0)
	var_6_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_13:SetAlignment(LUI.Alignment.Center)
	var_6_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 794, _1080p * 721, _1080p * 800)
	var_6_0:addElement(var_6_13)

	var_6_0.MaxRankLabel = var_6_13

	local var_6_14

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		var_6_14 = MenuBuilder.BuildRegisteredType("BattlePassTierPanel", {
			controllerIndex = var_6_1
		})
		var_6_14.id = "BattlePassTierPanel"

		var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1244, _1080p * 1824, _1080p * 200, _1080p * 957)
		var_6_0:addElement(var_6_14)

		var_6_0.BattlePassTierPanel = var_6_14
	end

	local function var_6_15()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 858
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1408
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 686
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1236
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_6:RegisterAnimationSequence("IntroNoUnlock", var_6_17)

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 254
		},
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 646
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("IntroNoUnlock", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1374
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1236
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_10:RegisterAnimationSequence("IntroNoUnlock", var_6_19)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1428
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1978
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1274
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inQuadratic
			}
		}

		var_6_11:RegisterAnimationSequence("IntroNoUnlock", var_6_20)
	end

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		local var_6_21 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1393
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1972
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1245
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_6_14:RegisterAnimationSequence("IntroNoUnlock", var_6_21)
	end

	local function var_6_22()
		var_6_6:AnimateSequence("IntroNoUnlock")
		var_6_8:AnimateSequence("IntroNoUnlock")
		var_6_10:AnimateSequence("IntroNoUnlock")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("IntroNoUnlock")
		end

		if CONDITIONS.IsBattlePassEnabled(var_6_0) then
			var_6_14:AnimateSequence("IntroNoUnlock")
		end
	end

	var_6_0._sequences.IntroNoUnlock = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ShowRewards", var_6_24)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_25 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1430
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1980
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1274
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_11:RegisterAnimationSequence("ShowRewards", var_6_25)
	end

	local function var_6_26()
		var_6_4:AnimateSequence("ShowRewards")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("ShowRewards")
		end
	end

	var_6_0._sequences.ShowRewards = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1430
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1980
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1274
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		}
	}

	var_6_4:RegisterAnimationSequence("ShowStats", var_6_28)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_11:RegisterAnimationSequence("ShowStats", var_6_29)
	end

	local function var_6_30()
		var_6_4:AnimateSequence("ShowStats")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("ShowStats")
		end
	end

	var_6_0._sequences.ShowStats = var_6_30

	local var_6_31
	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 978
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1528
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 685
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1235
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		}
	}

	var_6_6:RegisterAnimationSequence("IntroNewUnlock", var_6_32)

	local var_6_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1376
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 238
		},
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1235
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("IntroNewUnlock", var_6_33)

	local var_6_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1358
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1235
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_10:RegisterAnimationSequence("IntroNewUnlock", var_6_34)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1412
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1962
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 200
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 958
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1274
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 200
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 958
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inQuadratic
			}
		}

		var_6_11:RegisterAnimationSequence("IntroNewUnlock", var_6_35)
	end

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		local var_6_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1393
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1972
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1245
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_6_14:RegisterAnimationSequence("IntroNewUnlock", var_6_36)
	end

	local function var_6_37()
		var_6_6:AnimateSequence("IntroNewUnlock")
		var_6_8:AnimateSequence("IntroNewUnlock")
		var_6_10:AnimateSequence("IntroNewUnlock")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("IntroNewUnlock")
		end

		if CONDITIONS.IsBattlePassEnabled(var_6_0) then
			var_6_14:AnimateSequence("IntroNewUnlock")
		end
	end

	var_6_0._sequences.IntroNewUnlock = var_6_37

	local var_6_38
	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 247
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1385
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1227
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuartic
		}
	}

	var_6_6:RegisterAnimationSequence("IntroRankMax", var_6_39)

	local var_6_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1385
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 247
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("IntroRankMax", var_6_40)

	local var_6_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1367
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1227
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_10:RegisterAnimationSequence("IntroRankMax", var_6_41)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_42 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1708
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 2258
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 200
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 958
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1549
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 2099
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 200
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 958
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inQuadratic
			}
		}

		var_6_11:RegisterAnimationSequence("IntroRankMax", var_6_42)
	end

	local var_6_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 484
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 725
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 804
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 304
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 725
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 960
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 804
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_13:RegisterAnimationSequence("IntroRankMax", var_6_43)

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		local var_6_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1385
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1973
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1236
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_6_14:RegisterAnimationSequence("IntroRankMax", var_6_44)
	end

	local function var_6_45()
		var_6_6:AnimateSequence("IntroRankMax")
		var_6_8:AnimateSequence("IntroRankMax")
		var_6_10:AnimateSequence("IntroRankMax")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("IntroRankMax")
		end

		var_6_13:AnimateSequence("IntroRankMax")

		if CONDITIONS.IsBattlePassEnabled(var_6_0) then
			var_6_14:AnimateSequence("IntroRankMax")
		end
	end

	var_6_0._sequences.IntroRankMax = var_6_45

	local var_6_46
	local var_6_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_47)

	local var_6_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1080
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1630
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 960
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1510
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_6:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_48)

	local var_6_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1630
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 371
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1510
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_49)

	local var_6_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1630
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 371
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1510
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_10:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_50)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_51 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_11:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_51)
	end

	local var_6_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 525
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1189
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1069
		}
	}

	var_6_13:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_52)

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		local var_6_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("IntroNewUnlockCenter", var_6_53)
	end

	local function var_6_54()
		var_6_4:AnimateSequence("IntroNewUnlockCenter")
		var_6_6:AnimateSequence("IntroNewUnlockCenter")
		var_6_8:AnimateSequence("IntroNewUnlockCenter")
		var_6_10:AnimateSequence("IntroNewUnlockCenter")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("IntroNewUnlockCenter")
		end

		var_6_13:AnimateSequence("IntroNewUnlockCenter")

		if CONDITIONS.IsBattlePassEnabled(var_6_0) then
			var_6_14:AnimateSequence("IntroNewUnlockCenter")
		end
	end

	var_6_0._sequences.IntroNewUnlockCenter = var_6_54

	local var_6_55
	local var_6_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_56)

	local var_6_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1663
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 980
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1530
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_6:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_57)

	local var_6_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 523
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1073
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 390
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 940
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_58)

	local var_6_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 523
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1663
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 390
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1530
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_10:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_59)

	if CONDITIONS.AreKeysEnabled(var_6_0) then
		local var_6_60 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_11:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_60)
	end

	local var_6_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 557
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1221
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 424
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1088
		}
	}

	var_6_13:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_61)

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		local var_6_62 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("IntroNoUnlockCenter", var_6_62)
	end

	local function var_6_63()
		var_6_4:AnimateSequence("IntroNoUnlockCenter")
		var_6_6:AnimateSequence("IntroNoUnlockCenter")
		var_6_8:AnimateSequence("IntroNoUnlockCenter")
		var_6_10:AnimateSequence("IntroNoUnlockCenter")

		if CONDITIONS.AreKeysEnabled(var_6_0) then
			var_6_11:AnimateSequence("IntroNoUnlockCenter")
		end

		var_6_13:AnimateSequence("IntroNoUnlockCenter")

		if CONDITIONS.IsBattlePassEnabled(var_6_0) then
			var_6_14:AnimateSequence("IntroNoUnlockCenter")
		end
	end

	var_6_0._sequences.IntroNoUnlockCenter = var_6_63

	local var_6_64
	local var_6_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 638
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1776
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 424
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1555
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuartic
		}
	}

	var_6_6:RegisterAnimationSequence("IntroRankMaxCenter", var_6_65)

	local var_6_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1776
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 958
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 638
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("IntroRankMaxCenter", var_6_66)

	local var_6_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 618
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1758
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1555
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 424
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_10:RegisterAnimationSequence("IntroRankMaxCenter", var_6_67)

	local var_6_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 876
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 725
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 804
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 632
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 725
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1288
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 804
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_6_13:RegisterAnimationSequence("IntroRankMaxCenter", var_6_68)

	if CONDITIONS.IsBattlePassEnabled(var_6_0) then
		local var_6_69 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("IntroRankMaxCenter", var_6_69)
	end

	local function var_6_70()
		var_6_6:AnimateSequence("IntroRankMaxCenter")
		var_6_8:AnimateSequence("IntroRankMaxCenter")
		var_6_10:AnimateSequence("IntroRankMaxCenter")
		var_6_13:AnimateSequence("IntroRankMaxCenter")

		if CONDITIONS.IsBattlePassEnabled(var_6_0) then
			var_6_14:AnimateSequence("IntroRankMaxCenter")
		end
	end

	var_6_0._sequences.IntroRankMaxCenter = var_6_70

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("AARSummary", AARSummary)
LockTable(_M)
