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
	local var_4_1 = PROGRESSION.IsElderRank(var_4_0)
	local var_4_2 = AAR.GetUnlockIDTableAtRank(arg_4_1, var_4_0, var_4_1)

	while var_4_0 > 0 and var_4_2[1] == nil do
		var_4_0 = var_4_0 - 1
		var_4_2 = AAR.GetUnlockIDTableAtRank(arg_4_1, var_4_0, var_4_1)
	end

	return var_4_2[1]
end

local function var_0_2(arg_5_0, arg_5_1)
	local var_5_0 = PROGRESSION.GetPlayerLifeTimeMaxRank()
	local var_5_1 = PROGRESSION.GetCurrentSeasonProgressionFile()
	local var_5_2 = var_5_0 - PROGRESSION.GetMaxRank()
	local var_5_3 = tonumber(StringTable.DIFCHIGDFB(var_5_1, CSV.elderProgressionTable.cols.rank, var_5_2, CSV.elderProgressionTable.cols.lootID))

	while var_5_3 == nil and var_5_2 > 0 do
		var_5_2 = var_5_2 - 1
		var_5_3 = tonumber(StringTable.DIFCHIGDFB(var_5_1, CSV.elderProgressionTable.cols.rank, var_5_2, CSV.elderProgressionTable.cols.lootID))
	end

	local var_5_4 = tonumber(StringTable.DIFCHIGDFB(var_5_1, CSV.elderProgressionTable.cols.rank, var_5_2 - 1, CSV.elderProgressionTable.cols.lootID))

	while var_5_4 == nil and var_5_2 > 0 do
		var_5_2 = var_5_2 - 1
		var_5_4 = tonumber(StringTable.DIFCHIGDFB(var_5_1, CSV.elderProgressionTable.cols.rank, var_5_2, CSV.elderProgressionTable.cols.lootID))
	end

	local var_5_5 = tonumber(StringTable.DIFCHIGDFB(var_5_1, CSV.elderProgressionTable.cols.rank, var_5_2 - 1, CSV.elderProgressionTable.cols.lootID))

	while var_5_5 == nil and var_5_2 > 0 do
		var_5_2 = var_5_2 - 1
		var_5_5 = tonumber(StringTable.DIFCHIGDFB(var_5_1, CSV.elderProgressionTable.cols.rank, var_5_2, CSV.elderProgressionTable.cols.lootID))
	end

	return {
		var_5_3,
		var_5_4,
		var_5_5
	}
end

function PostLoadFunc(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.AARProgression)
	assert(arg_6_0.AARUnlocks)
	assert(arg_6_0.AARNextUnlocks)

	arg_6_0._summaryWidgets = {
		arg_6_0.AARUnlocks,
		arg_6_0.AARNextUnlocks
	}

	ACTIONS.AnimateSequence(arg_6_0, "ShowRewards")

	local var_6_0 = true

	if CONDITIONS.AreKeysEnabled() then
		var_6_0 = false

		arg_6_0.AARRewards:InitKeyReward(arg_6_1, arg_6_2.matchDataPackage)
	end

	if CONDITIONS.IsBattlePassEnabled() and arg_6_0.BattlePassTierPanel then
		var_6_0 = false

		arg_6_0.BattlePassTierPanel:InitTierProgression(arg_6_1, arg_6_2.matchDataPackage.startTierXP, arg_6_2.matchDataPackage.currentTierXP)
	end

	local var_6_1 = AAR.GetNewUnlocksTable(arg_6_0, arg_6_1, arg_6_2.matchDataPackage.unlocks)
	local var_6_2 = AAR.GetNextRankUnlockID(arg_6_1)

	if #var_6_1 > 0 then
		arg_6_0.AARUnlocks:InitUnlock(arg_6_1, var_6_1, true)
		arg_6_0.AARNextUnlocks:InitUnlock(arg_6_1, unlockID, var_6_2)
		arg_6_0.AARUnlocks:PlayIntro(#var_6_1)
		ACTIONS.AnimateSequence(arg_6_0, var_6_0 and "IntroNewUnlockCenter" or "IntroNewUnlock")
	elseif PROGRESSION.IsPlayerLifeTimeRankMax(arg_6_1) then
		ACTIONS.AnimateSequence(arg_6_0, var_6_0 and "IntroRankMaxCenter" or "IntroRankMax")
	else
		local var_6_3

		if PROGRESSION.GetPlayerRank(arg_6_1) > 0 then
			local var_6_4 = var_0_1(arg_6_0, arg_6_1)

			arg_6_0.AARUnlocks:InitUnlock(arg_6_1, {
				{
					ID = var_6_4
				}
			}, false)
		else
			local var_6_5 = true

			arg_6_0.AARUnlocks:InitUnlock(arg_6_1, {}, false, var_6_5)
		end

		arg_6_0.AARNextUnlocks:InitUnlock(arg_6_1, unlockID, var_6_2)
		ACTIONS.AnimateSequence(arg_6_0, var_6_0 and "IntroNoUnlockCenter" or "IntroNoUnlock")
	end

	arg_6_0.AARProgression:InitProgression(arg_6_1, arg_6_2.matchDataPackage)
end

function AARSummary(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "AARSummary"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("AARStats", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "AARStats"

	var_7_4:SetAlpha(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1274, _1080p * 1824, _1080p * 200, _1080p * 560)
	var_7_0:addElement(var_7_4)

	var_7_0.AARStats = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("AARNextUnlocks", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "AARNextUnlocks"

	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 685, _1080p * 1235, _1080p * 598, _1080p * 958)
	var_7_0:addElement(var_7_6)

	var_7_0.AARNextUnlocks = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("AARUnlocks", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "AARUnlocks"

	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 646, _1080p * 598, _1080p * 958)
	var_7_0:addElement(var_7_8)

	var_7_0.AARUnlocks = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("AARProgression", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "AARProgression"

	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1235, _1080p * 200, _1080p * 560)
	var_7_0:addElement(var_7_10)

	var_7_0.AARProgression = var_7_10

	local var_7_11

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		var_7_11 = MenuBuilder.BuildRegisteredType("AARRewards", {
			controllerIndex = var_7_1
		})
		var_7_11.id = "AARRewards"

		var_7_11:SetAlpha(0, 0)
		var_7_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1274, _1080p * 1824, _1080p * 200, _1080p * 958)
		var_7_0:addElement(var_7_11)

		var_7_0.AARRewards = var_7_11
	end

	local var_7_12
	local var_7_13 = LUI.UIText.new()

	var_7_13.id = "MaxRankLabel"

	var_7_13:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_13:SetAlpha(0, 0)
	var_7_13:setText(Engine.CBBHFCGDIC("LUA_MENU/ALL_UNLOCKED"), 0)
	var_7_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_13:SetAlignment(LUI.Alignment.Center)
	var_7_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 794, _1080p * 721, _1080p * 800)
	var_7_0:addElement(var_7_13)

	var_7_0.MaxRankLabel = var_7_13

	local var_7_14

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		var_7_14 = MenuBuilder.BuildRegisteredType("BattlePassTierPanel", {
			controllerIndex = var_7_1
		})
		var_7_14.id = "BattlePassTierPanel"

		var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1244, _1080p * 1824, _1080p * 200, _1080p * 957)
		var_7_0:addElement(var_7_14)

		var_7_0.BattlePassTierPanel = var_7_14
	end

	local function var_7_15()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_15

	local var_7_16
	local var_7_17 = {
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

	var_7_6:RegisterAnimationSequence("IntroNoUnlock", var_7_17)

	local var_7_18 = {
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

	var_7_8:RegisterAnimationSequence("IntroNoUnlock", var_7_18)

	local var_7_19 = {
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

	var_7_10:RegisterAnimationSequence("IntroNoUnlock", var_7_19)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_20 = {
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

		var_7_11:RegisterAnimationSequence("IntroNoUnlock", var_7_20)
	end

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		local var_7_21 = {
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

		var_7_14:RegisterAnimationSequence("IntroNoUnlock", var_7_21)
	end

	local function var_7_22()
		var_7_6:AnimateSequence("IntroNoUnlock")
		var_7_8:AnimateSequence("IntroNoUnlock")
		var_7_10:AnimateSequence("IntroNoUnlock")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("IntroNoUnlock")
		end

		if CONDITIONS.IsBattlePassEnabled(var_7_0) then
			var_7_14:AnimateSequence("IntroNoUnlock")
		end
	end

	var_7_0._sequences.IntroNoUnlock = var_7_22

	local var_7_23
	local var_7_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ShowRewards", var_7_24)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_25 = {
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

		var_7_11:RegisterAnimationSequence("ShowRewards", var_7_25)
	end

	local function var_7_26()
		var_7_4:AnimateSequence("ShowRewards")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("ShowRewards")
		end
	end

	var_7_0._sequences.ShowRewards = var_7_26

	local var_7_27
	local var_7_28 = {
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

	var_7_4:RegisterAnimationSequence("ShowStats", var_7_28)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_11:RegisterAnimationSequence("ShowStats", var_7_29)
	end

	local function var_7_30()
		var_7_4:AnimateSequence("ShowStats")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("ShowStats")
		end
	end

	var_7_0._sequences.ShowStats = var_7_30

	local var_7_31
	local var_7_32 = {
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

	var_7_6:RegisterAnimationSequence("IntroNewUnlock", var_7_32)

	local var_7_33 = {
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

	var_7_8:RegisterAnimationSequence("IntroNewUnlock", var_7_33)

	local var_7_34 = {
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

	var_7_10:RegisterAnimationSequence("IntroNewUnlock", var_7_34)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_35 = {
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

		var_7_11:RegisterAnimationSequence("IntroNewUnlock", var_7_35)
	end

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		local var_7_36 = {
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

		var_7_14:RegisterAnimationSequence("IntroNewUnlock", var_7_36)
	end

	local function var_7_37()
		var_7_6:AnimateSequence("IntroNewUnlock")
		var_7_8:AnimateSequence("IntroNewUnlock")
		var_7_10:AnimateSequence("IntroNewUnlock")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("IntroNewUnlock")
		end

		if CONDITIONS.IsBattlePassEnabled(var_7_0) then
			var_7_14:AnimateSequence("IntroNewUnlock")
		end
	end

	var_7_0._sequences.IntroNewUnlock = var_7_37

	local var_7_38
	local var_7_39 = {
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

	var_7_6:RegisterAnimationSequence("IntroRankMax", var_7_39)

	local var_7_40 = {
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

	var_7_8:RegisterAnimationSequence("IntroRankMax", var_7_40)

	local var_7_41 = {
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

	var_7_10:RegisterAnimationSequence("IntroRankMax", var_7_41)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_42 = {
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

		var_7_11:RegisterAnimationSequence("IntroRankMax", var_7_42)
	end

	local var_7_43 = {
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

	var_7_13:RegisterAnimationSequence("IntroRankMax", var_7_43)

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		local var_7_44 = {
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

		var_7_14:RegisterAnimationSequence("IntroRankMax", var_7_44)
	end

	local function var_7_45()
		var_7_6:AnimateSequence("IntroRankMax")
		var_7_8:AnimateSequence("IntroRankMax")
		var_7_10:AnimateSequence("IntroRankMax")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("IntroRankMax")
		end

		var_7_13:AnimateSequence("IntroRankMax")

		if CONDITIONS.IsBattlePassEnabled(var_7_0) then
			var_7_14:AnimateSequence("IntroRankMax")
		end
	end

	var_7_0._sequences.IntroRankMax = var_7_45

	local var_7_46
	local var_7_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_47)

	local var_7_48 = {
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

	var_7_6:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_48)

	local var_7_49 = {
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

	var_7_8:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_49)

	local var_7_50 = {
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

	var_7_10:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_50)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_51 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_11:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_51)
	end

	local var_7_52 = {
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

	var_7_13:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_52)

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		local var_7_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_14:RegisterAnimationSequence("IntroNewUnlockCenter", var_7_53)
	end

	local function var_7_54()
		var_7_4:AnimateSequence("IntroNewUnlockCenter")
		var_7_6:AnimateSequence("IntroNewUnlockCenter")
		var_7_8:AnimateSequence("IntroNewUnlockCenter")
		var_7_10:AnimateSequence("IntroNewUnlockCenter")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("IntroNewUnlockCenter")
		end

		var_7_13:AnimateSequence("IntroNewUnlockCenter")

		if CONDITIONS.IsBattlePassEnabled(var_7_0) then
			var_7_14:AnimateSequence("IntroNewUnlockCenter")
		end
	end

	var_7_0._sequences.IntroNewUnlockCenter = var_7_54

	local var_7_55
	local var_7_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_56)

	local var_7_57 = {
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

	var_7_6:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_57)

	local var_7_58 = {
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

	var_7_8:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_58)

	local var_7_59 = {
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

	var_7_10:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_59)

	if CONDITIONS.AreKeysEnabled(var_7_0) then
		local var_7_60 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_11:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_60)
	end

	local var_7_61 = {
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

	var_7_13:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_61)

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		local var_7_62 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_14:RegisterAnimationSequence("IntroNoUnlockCenter", var_7_62)
	end

	local function var_7_63()
		var_7_4:AnimateSequence("IntroNoUnlockCenter")
		var_7_6:AnimateSequence("IntroNoUnlockCenter")
		var_7_8:AnimateSequence("IntroNoUnlockCenter")
		var_7_10:AnimateSequence("IntroNoUnlockCenter")

		if CONDITIONS.AreKeysEnabled(var_7_0) then
			var_7_11:AnimateSequence("IntroNoUnlockCenter")
		end

		var_7_13:AnimateSequence("IntroNoUnlockCenter")

		if CONDITIONS.IsBattlePassEnabled(var_7_0) then
			var_7_14:AnimateSequence("IntroNoUnlockCenter")
		end
	end

	var_7_0._sequences.IntroNoUnlockCenter = var_7_63

	local var_7_64
	local var_7_65 = {
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

	var_7_6:RegisterAnimationSequence("IntroRankMaxCenter", var_7_65)

	local var_7_66 = {
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

	var_7_8:RegisterAnimationSequence("IntroRankMaxCenter", var_7_66)

	local var_7_67 = {
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

	var_7_10:RegisterAnimationSequence("IntroRankMaxCenter", var_7_67)

	local var_7_68 = {
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

	var_7_13:RegisterAnimationSequence("IntroRankMaxCenter", var_7_68)

	if CONDITIONS.IsBattlePassEnabled(var_7_0) then
		local var_7_69 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_14:RegisterAnimationSequence("IntroRankMaxCenter", var_7_69)
	end

	local function var_7_70()
		var_7_6:AnimateSequence("IntroRankMaxCenter")
		var_7_8:AnimateSequence("IntroRankMaxCenter")
		var_7_10:AnimateSequence("IntroRankMaxCenter")
		var_7_13:AnimateSequence("IntroRankMaxCenter")

		if CONDITIONS.IsBattlePassEnabled(var_7_0) then
			var_7_14:AnimateSequence("IntroRankMaxCenter")
		end
	end

	var_7_0._sequences.IntroRankMaxCenter = var_7_70

	PostLoadFunc(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("AARSummary", AARSummary)
LockTable(_M)
