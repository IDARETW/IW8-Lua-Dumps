module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._watchRef = arg_1_2.watchRef
	arg_1_0._petType = WATCH.GetPetWatchType(arg_1_2.watchRef)

	arg_1_0.Background:setImageFiltering(1)
	arg_1_0.Main:setImageFiltering(1)
	arg_1_0.Hungry:setImageFiltering(1)
	arg_1_0.Sad:setImageFiltering(1)
	arg_1_0.Unruly:setImageFiltering(1)
	arg_1_0.Bored:setImageFiltering(1)

	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common)

	if arg_1_0._petType == "pet_turbo" then
		arg_1_0.playerData = var_1_0.petWatchDataTurbo
	else
		arg_1_0.playerData = var_1_0.petWatchDataTurboAlt
	end

	if not LOOT.IsUnlocked(arg_1_1, LOOT.itemTypes.WATCH, arg_1_0._watchRef) then
		ACTIONS.AnimateSequence(arg_1_0, "IdleEgg")

		return
	end

	local function var_1_1(arg_2_0)
		arg_2_0.phaseHistoryArray = {}

		for iter_2_0 = 1, 14 do
			local var_2_0 = BitwiseOperators.band(arg_2_0.pet.phaseHistory, BitwiseOperators.lshift(1, iter_2_0)) == BitwiseOperators.lshift(1, iter_2_0)

			arg_2_0.phaseHistoryArray[iter_2_0] = var_2_0
		end

		for iter_2_1 = 1, 3 do
			arg_2_0.phaseHistoryArray[iter_2_1] = true
		end

		for iter_2_2 = 12, 14 do
			arg_2_0.phaseHistoryArray[iter_2_2] = true
		end
	end

	local function var_1_2(arg_3_0, arg_3_1)
		if GameX.IsRankedMatch() then
			Engine.EBHIFJCGBH("petwatch_turbo_grow", arg_3_1)

			local var_3_0 = {
				controllerIndex = arg_1_1
			}

			var_3_0.header = "SPLASHES/PET_SPLASH_UNLOCK"
			var_3_0.body = "SPLASHES/PET_SPLASH_DESC"
			var_3_0.splashId = arg_3_1
			var_3_0.displayLocation = "petCharm"

			arg_3_0:dispatchEventToRoot({
				name = "add_message_splash_manager",
				immediate = true,
				options = var_3_0
			})
		end
	end

	local function var_1_3(arg_4_0, arg_4_1, arg_4_2)
		arg_4_0.phaseHistoryArray[arg_4_1] = true
		arg_4_0.pet.phaseHistory = BitwiseOperators.bor(arg_4_0.pet.phaseHistory, BitwiseOperators.lshift(1, arg_4_1))

		arg_4_0.playerData.objectiveScoreCharge:set(arg_4_0.pet.phaseHistory)

		arg_4_0.pet.grownThisGame = true

		var_1_2(arg_4_0, arg_4_2)
	end

	local function var_1_4(arg_5_0)
		local var_5_0 = 1
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in next, arg_5_0.phaseHistoryArray do
			if iter_5_1 == false then
				var_5_1[var_5_0] = iter_5_0
				var_5_0 = var_5_0 + 1
			end
		end

		if var_5_0 == 1 then
			return -1
		end

		return var_5_1[math.random(1, var_5_0 - 1)]
	end

	local function var_1_5(arg_6_0)
		return arg_6_0.phaseHistoryArray[4] and arg_6_0.phaseHistoryArray[5]
	end

	arg_1_0.petConsts = {}

	local var_1_6 = StringTable.BFHCAIIDA(CSV.petWatchTurboTable.file)

	for iter_1_0 = 0, var_1_6 - 1 do
		local var_1_7 = StringTable.CBGJCDIHCE(CSV.petWatchTurboTable.file, iter_1_0, CSV.petWatchTurboTable.cols.ref)
		local var_1_8 = StringTable.CBGJCDIHCE(CSV.petWatchTurboTable.file, iter_1_0, CSV.petWatchTurboTable.cols.phaseNum)
		local var_1_9 = StringTable.CBGJCDIHCE(CSV.petWatchTurboTable.file, iter_1_0, CSV.petWatchTurboTable.cols.phaseTime)
		local var_1_10 = StringTable.CBGJCDIHCE(CSV.petWatchTurboTable.file, iter_1_0, CSV.petWatchTurboTable.cols.bonusTimeMax)
		local var_1_11 = StringTable.CBGJCDIHCE(CSV.petWatchTurboTable.file, iter_1_0, CSV.petWatchTurboTable.cols.gameType)
		local var_1_12 = math.floor(tonumber(var_1_8))

		arg_1_0.petConsts[var_1_12] = {}
		arg_1_0.petConsts[var_1_12].phaseTime = math.floor(tonumber(var_1_9) * 60)
		arg_1_0.petConsts[var_1_12].bonusTimeMax = math.floor(tonumber(var_1_10) * 60)
		arg_1_0.petConsts[var_1_12].gameType = var_1_11
	end

	local function var_1_13(arg_7_0)
		local var_7_0 = false

		if CONDITIONS.InGame() then
			var_7_0 = VISIBILITY_CONDITIONS.InLocationSelector.conditionFunc(arg_1_1)
		end

		return not Engine.DDJFBBJAIG() and CONDITIONS.InKillCam(arg_7_0) and not var_7_0
	end

	local function var_1_14(arg_8_0, arg_8_1, arg_8_2)
		if var_1_13(arg_8_0) then
			return
		end

		if arg_8_2 < 2 or arg_8_2 > 14 then
			arg_8_0.pet.twoVsTwoWins = false
			arg_8_0.pet.allKillstreaksUnlocked = 0
			arg_8_0.pet.phaseHistory = 0
			arg_8_0.pet.killsCharge = 0
			arg_8_0.pet.lastKillsScore = 0

			arg_8_0.playerData.objectiveScoreCharge:set(0)
		end

		arg_8_0.playerData.lastUpdateTime:set(arg_8_1)
		arg_8_0.playerData.growthTime:set(0)
		arg_8_0.playerData.phase:set(arg_8_2)
		arg_8_0.playerData.charged:set(0)
		arg_8_0.playerData.bonusTime:set(0)
		arg_8_0.playerData.damage:set(0)
		arg_8_0.playerData.orcaPoints:set(0)
		arg_8_0.playerData.apachePoints:set(0)
		arg_8_0.playerData.dragonPoints:set(0)
		arg_8_0.playerData.killstreakCharge:set(0)
		arg_8_0.playerData.winGamesCharge:set(0)
		arg_8_0.playerData.killsCharge:set(0)
		arg_8_0.playerData.topKillstreakCharge:set(0)
		arg_8_0.playerData.nukeCharge:set(0)
		arg_8_0.playerData.winGamesTop3:set(0)
		arg_8_0.playerData.plantsCharge:set(0)
		arg_8_0.playerData.executionsCharge:set(0)

		arg_8_0.pet.hackSysTime = false
		arg_8_0.pet.phaseNumber = arg_8_2
		arg_8_0.pet.healthTier = 2
		arg_8_0.pet.petDamage = 0
		arg_8_0.pet.dragonPts = 0
		arg_8_0.pet.vampirePts = 0
		arg_8_0.pet.unicornPts = 0
		arg_8_0.pet.killstreakCharge = 0
		arg_8_0.pet.killsCharge = 0
		arg_8_0.pet.throwingKnifeScore = 0
		arg_8_0.pet.killstreakCharge = 0
		arg_8_0.pet.topKillstreakCharge = 0
		arg_8_0.pet.juggEarned = 0
		arg_8_0.pet.carPuncher = false
		arg_8_0.pet.nukeEarned = false
		arg_8_0.pet.vehicleKills = 0
		arg_8_0.pet.brWinTop3 = false
		arg_8_0.pet.teaBags = 0
		arg_8_0.pet.executionsCharge = 0

		if not arg_8_0.pet.lastExecutionScore then
			arg_8_0.pet.lastExecutionScore = 0
		end

		if not arg_8_0.pet.lastThrowingKnifeScore then
			arg_8_0.pet.lastThrowingKnifeScore = 0
		end

		if not arg_8_0.pet.lastVehicleKillsScore then
			arg_8_0.pet.lastVehicleKillsScore = 0
		end

		if not arg_8_0.pet.lastKillstreakScore then
			arg_8_0.pet.lastKillstreakScore = 0
		end

		if not arg_8_0.pet.lastObjectivesScore then
			arg_8_0.pet.lastObjectivesScore = 0
		end

		if not arg_8_0.pet.lastKillsScore then
			arg_8_0.pet.lastKillsScore = 0
		end

		arg_8_0.pet.bonusTime = 0
		arg_8_0.pet.growthTime = 0
		arg_8_0.pet.frontEndTeenPick = 0

		var_1_1(arg_8_0)
	end

	local function var_1_15(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = ""

		if arg_9_1 == 15 and arg_9_0.state > 0 and arg_9_0.state < 15 then
			ACTIONS.AnimateSequence(arg_9_0, "AdultToDead")

			var_9_0 = "watch_pet_trans_adult_dead"
			arg_9_0.state = arg_9_1
		elseif arg_9_2 then
			if arg_9_1 == 2 then
				ACTIONS.AnimateSequence(arg_9_0, "EggToBaby")

				var_9_0 = "watch_pet_trans_egg_baby"
			elseif arg_9_1 == 3 then
				ACTIONS.AnimateSequence(arg_9_0, "BabyToChild")

				var_9_0 = "watch_pet_trans_baby_child"
			elseif arg_9_1 == 4 then
				ACTIONS.AnimateSequence(arg_9_0, "ChildToTeenA")

				var_9_0 = "watch_pet_trans_child_teen"
			elseif arg_9_1 == 5 then
				ACTIONS.AnimateSequence(arg_9_0, "ChildToTeenB")

				var_9_0 = "watch_pet_trans_teen_adult"
			elseif arg_9_1 == 15 then
				ACTIONS.AnimateSequence(arg_9_0, "AdultToDead")

				var_9_0 = "watch_pet_trans_adult_dead"
			elseif arg_9_1 > 5 and arg_9_1 < 12 then
				ACTIONS.AnimateSequence(arg_9_0, "TeenAToAdult")

				var_9_0 = "watch_pet_trans_adult_be_adult_ae"
			elseif arg_9_1 > 11 and arg_9_1 < 15 then
				ACTIONS.AnimateSequence(arg_9_0, "TeenAToAdult")

				var_9_0 = "watch_pet_trans_adult_ae" or var_9_0
			end

			arg_9_0.state = arg_9_1
		else
			arg_9_0.state = arg_9_1

			if arg_9_0.state == 0 or arg_9_0.state == 1 then
				ACTIONS.AnimateSequence(arg_9_0, "IdleEgg")
			elseif arg_9_0.state == 2 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "BabyIdle")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "BabyIdleHappy")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "BabyIdleSad")
				end
			elseif arg_9_0.state == 3 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "ChildIdle")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "ChildIdleHappy")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "ChildIdleSad")
				end
			elseif arg_9_0.state == 4 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "TeenAIdle")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "TeenAIdleHappy")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "TeenAIdleSad")
				end
			elseif arg_9_0.state == 5 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "TeenBIdle")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "TeenBIdleHappy")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "TeenBIdleSad")
				end
			elseif arg_9_0.state == 6 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleRiley")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyRiley")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadRiley")
				end
			elseif arg_9_0.state == 7 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleBat")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyBat")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadBat")
				end
			elseif arg_9_0.state == 8 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdlePanda")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyPanda")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadPanda")
				end
			elseif arg_9_0.state == 9 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleBabyDragon")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyBabyDragon")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadBabyDragon")
				end
			elseif arg_9_0.state == 10 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdlePony")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyPony")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadPony")
				end
			elseif arg_9_0.state == 11 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleGhost")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyGhost")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadGhost")
				end
			elseif arg_9_0.state == 12 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleVampire")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyVampire")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadVampire")
				end
			elseif arg_9_0.state == 13 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleUnicorn")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyUnicorn")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadUnicorn")
				end
			elseif arg_9_0.state == 14 then
				if arg_9_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleDragon")
				elseif arg_9_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleHappyDragon")
				elseif arg_9_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_9_0, "AdultIdleSadDragon")
				end
			elseif arg_9_1 == 15 then
				ACTIONS.AnimateSequence(arg_9_0, "DeadIdle")
			end
		end

		if var_9_0 ~= "" then
			arg_9_0.growthAudioTimer:Wait(1000, true).onComplete = function()
				Engine.BJDBIAGIDA(var_9_0)
			end
		end
	end

	local function var_1_16(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		local var_11_0 = false

		if arg_11_1 < 0 then
			var_11_0 = true
			arg_11_1 = arg_11_1 * -1
		end

		local var_11_1 = arg_11_0.state

		if arg_11_0.state == nil then
			arg_11_0.state = arg_11_1
		end

		if arg_11_0.quality == nil then
			arg_11_0.quality = 2
		end

		if arg_11_2 ~= nil then
			arg_11_0.quality = arg_11_2
		end

		if Engine.DDJFBBJAIG() then
			var_1_15(arg_11_0, var_11_1, false)
		end

		if arg_11_3 then
			var_1_15(arg_11_0, arg_11_1, var_11_0)
		else
			arg_11_0:Wait(1500).onComplete = function()
				var_1_15(arg_11_0, arg_11_1, var_11_0)
			end
		end
	end

	local function var_1_17(arg_13_0, arg_13_1)
		if arg_13_0.pet.phaseNumber == nil or arg_13_0.pet.phaseNumber == 0 then
			return
		end

		arg_13_0.Unruly:SetAlpha(0, 0)
		arg_13_0.Sad:SetAlpha(0, 0)
		arg_13_0.Hungry:SetAlpha(0, 0)
		arg_13_0.Bored:SetAlpha(0, 0)

		if arg_13_1 >= 0.4 then
			arg_13_0.Unruly:SetAlpha(1, 0)
		end

		if arg_13_1 >= 0.6 then
			arg_13_0.Sad:SetAlpha(1, 0)
		end

		if arg_13_1 >= 0.8 then
			arg_13_0.Hungry:SetAlpha(1, 0)
		end

		if arg_13_1 > 0.0001 then
			arg_13_0.Bored:SetAlpha(1, 0)
		end
	end

	local function var_1_18(arg_14_0, arg_14_1)
		return
	end

	local function var_1_19(arg_15_0)
		local var_15_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_action")

		if var_15_0 == nil then
			return
		end

		if var_15_0 > 0 then
			var_1_18(arg_15_0, var_15_0)
		elseif var_15_0 < 0 then
			local var_15_1 = Engine.DEIDGHDBHD()

			if var_15_0 == -59 then
				local var_15_2 = 3600
				local var_15_3 = var_15_1 - 8 * var_15_2

				arg_15_0.pet.hackSysTime = true

				PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.lastUpdateTime:set(var_15_3)

				return
			end

			if var_15_1 ~= nil then
				var_1_14(arg_15_0, var_15_1, var_15_0 * -1)
				var_1_16(arg_15_0, var_15_0 * -1, 1, true)

				arg_15_0.pet.lastExecutionScore = 0
				arg_15_0.pet.lastThrowingKnifeScore = 0
				arg_15_0.pet.lastVehicleKillsScore = 0
				arg_15_0.pet.lastKillstreakScore = 0
				arg_15_0.pet.lastObjectivesScore = 0
				arg_15_0.pet.lastKillsScore = 0
			end
		end
	end

	local function var_1_20(arg_16_0)
		local var_16_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state")

		arg_16_0.quality = 1

		if var_16_0 / 100000 >= 1 then
			local var_16_1 = math.floor(var_16_0 / 100000)

			if var_16_1 < 4 then
				arg_16_0.quality = 1
			elseif var_16_1 < 7 then
				arg_16_0.quality = 2
			else
				arg_16_0.quality = 3
			end

			var_16_0 = var_16_0 - var_16_1 * 100000
		end

		if var_1_13(arg_16_0) or arg_16_0.pet.backFromKillcam then
			if arg_16_0.pet.backFromKillcam then
				arg_16_0.pet.backFromKillcam = false
				var_16_0 = arg_16_0.pet.originalPhase
			else
				arg_16_0.pet.backFromKillcam = true
				arg_16_0.pet.originalPhase = arg_16_0.pet.phaseNumber
			end

			var_1_15(arg_16_0, var_16_0, false)
		end
	end

	local function var_1_21(arg_17_0)
		if arg_17_0.pet.phaseNumber == nil or arg_17_0.pet.phaseNumber == 0 then
			arg_17_0.pet.phaseNumber = 1

			var_1_16(arg_17_0, 1, 1, true)
		end
	end

	local function var_1_22(arg_18_0)
		if arg_18_0.pet.diedThisGame then
			var_1_16(arg_18_0, 15, false, true)
		end
	end

	local function var_1_23(arg_19_0)
		return arg_19_0.pet
	end

	local function var_1_24(arg_20_0, arg_20_1)
		arg_20_0.pet = arg_20_1
		arg_20_0.pet.backFromKillcam = false

		var_1_21(arg_20_0)
		var_1_22(arg_20_0)
	end

	local function var_1_25(arg_21_0)
		if arg_21_0.petConsts[arg_21_0.pet.phaseNumber].phaseTime < arg_21_0.pet.growthTime - arg_21_0.pet.bonusTime * 60 then
			DebugPrint("TURBO PET WATCH - DEAD!!!!!!!!!! ")
			var_1_16(arg_21_0, 15, false)
			arg_21_0.playerData.phase:set(15)

			arg_21_0.pet.phaseNumber = 15

			arg_21_0.playerData.growthTime:set(0)

			arg_21_0.pet.growthTime = 0

			arg_21_0.playerData.bonusTime:set(0)

			arg_21_0.pet.bonusTime = 0

			local var_21_0 = Engine.DEIDGHDBHD()

			arg_21_0.playerData.lastUpdateTime:set(var_21_0)

			arg_21_0.pet.lastUpdateTime = var_21_0
			arg_21_0.pet.diedThisGame = true

			return true
		end

		return false
	end

	local function var_1_26(arg_22_0, arg_22_1, arg_22_2)
		arg_22_0.rewardSplashTimer:Wait(4000, true).onComplete = function()
			local var_23_0 = {
				controllerIndex = arg_22_1
			}

			var_23_0.header = "SPLASHES/TOMO_CHALLENGE"
			var_23_0.param = "Challenge"
			var_23_0.splashId = arg_22_2
			var_23_0.displayLocation = "petCharm"

			arg_22_0:dispatchEventToRoot({
				name = "add_message_splash_manager",
				immediate = true,
				options = var_23_0
			})
		end
	end

	local function var_1_27(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_2 < 12 then
			var_1_3(arg_24_0, arg_24_2, arg_24_1)
		end

		var_1_16(arg_24_0, arg_24_2 * -1, 1, false)

		local var_24_0 = Engine.DEIDGHDBHD()

		var_1_14(arg_24_0, var_24_0, arg_24_2)
		arg_24_0.playerData.phase:set(arg_24_2)

		arg_24_0.pet.phaseNumber = arg_24_2

		if arg_24_1 < 14 then
			var_1_26(arg_24_0, arg_1_1, arg_24_2)
		end

		var_1_17(arg_24_0, 0)
		Engine.EBHIFJCGBH("petwatch_turbo_state", arg_24_2)
	end

	local function var_1_28(arg_25_0)
		local var_25_0 = var_1_4(arg_25_0)

		if var_25_0 < 0 then
			local var_25_1 = arg_25_0.pet.phaseNumber

			if arg_25_0.pet.phaseNumber < 12 then
				var_1_27(arg_25_0, arg_25_0.pet.phaseNumber, 12)
			elseif arg_25_0.pet.phaseNumber == 12 then
				var_1_27(arg_25_0, arg_25_0.pet.phaseNumber, 13)
			elseif arg_25_0.pet.phaseNumber == 13 then
				var_1_27(arg_25_0, arg_25_0.pet.phaseNumber, 14)
			elseif arg_25_0.pet.phaseNumber == 14 then
				var_1_27(arg_25_0, arg_25_0.pet.phaseNumber, 1)
			end

			var_1_2(arg_25_0, var_25_1)

			return
		end

		var_1_26(arg_25_0, arg_1_1, var_25_0)
		var_1_3(arg_25_0, var_25_0, arg_25_0.pet.phaseNumber)
		var_1_16(arg_25_0, var_25_0 * -1, 1, false)

		local var_25_2 = Engine.DEIDGHDBHD()

		var_1_14(arg_25_0, var_25_2, var_25_0)
		arg_25_0.playerData.phase:set(var_25_0)

		arg_25_0.pet.phaseNumber = var_25_0

		var_1_17(arg_25_0, 0)
	end

	local function var_1_29(arg_26_0)
		arg_26_0.finalHeartBeatTimer = LUI.UIElement.new()

		arg_26_0:addElement(arg_26_0.finalHeartBeatTimer)

		local var_26_0

		local function var_26_1(arg_27_0)
			DebugPrint("TURBO PET WATCH - YOU WON THE WHOLE GAME GG ")

			arg_27_0.heartBeatTimer:Wait(1000, true).onComplete = function()
				var_26_1(arg_27_0)
			end
		end

		var_26_1(arg_26_0)
	end

	local function var_1_30(arg_29_0)
		if Engine.DEIDGHDBHD() == nil or Engine.EAIICIFIFA() or var_1_13(arg_29_0) then
			return
		end

		if arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "kills_egg" then
			if arg_29_0.pet.killsCharge >= 3 then
				var_1_27(arg_29_0, 1, 2)
			else
				var_1_17(arg_29_0, arg_29_0.pet.killsCharge / 3)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "kills_baby" then
			if arg_29_0.pet.killsCharge >= 10 then
				var_1_27(arg_29_0, 2, 3)
			else
				var_1_17(arg_29_0, arg_29_0.pet.killsCharge / 10)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "kills_adult" then
			if arg_29_0.pet.killsCharge >= 20 then
				var_1_28(arg_29_0)
			else
				var_1_17(arg_29_0, arg_29_0.pet.killsCharge / 20)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "killstreaks" then
			if arg_29_0.pet.killstreakCharge > 4 or arg_29_0.pet.allKillstreaksUnlocked > 0 then
				local var_29_0 = 4 + math.random(0, 1)

				arg_29_0.playerData.frontEndTeenPick:set(var_29_0)
				var_1_27(arg_29_0, 3, var_29_0)
			else
				var_1_17(arg_29_0, arg_29_0.pet.killstreakCharge / 5)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "twos" then
			if arg_29_0.pet.twoVsTwoWins == true then
				if not var_1_5(arg_29_0) then
					local var_29_1 = 4

					if arg_29_0.pet.phaseNumber == 4 then
						var_29_1 = 5
					end

					var_1_27(arg_29_0, 4, var_29_1)
				else
					var_1_28(arg_29_0)
				end
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "teabags" then
			if arg_29_0.pet.teaBags > 6 then
				if not var_1_5(arg_29_0) then
					local var_29_2 = 4

					if arg_29_0.pet.phaseNumber == 4 then
						var_29_2 = 5
					end

					var_1_27(arg_29_0, 5, var_29_2)
				else
					var_1_28(arg_29_0)
				end
			else
				var_1_17(arg_29_0, arg_29_0.pet.teaBags / 6)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "knife_kills" then
			if arg_29_0.pet.throwingKnifeScore >= 5 then
				var_1_28(arg_29_0)
			else
				var_1_17(arg_29_0, arg_29_0.pet.throwingKnifeScore / 5)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "jugg" then
			if arg_29_0.pet.juggEarned >= 1 then
				var_1_28(arg_29_0)
			else
				var_1_17(arg_29_0, arg_29_0.pet.killstreakCharge / 3)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "execution" then
			if arg_29_0.pet.executionsCharge >= 3 then
				var_1_28(arg_29_0)
			else
				var_1_17(arg_29_0, arg_29_0.pet.executionsCharge / 3)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "vehicle_kills" then
			if arg_29_0.pet.vehicleKills >= 5 then
				var_1_28(arg_29_0)
			else
				var_1_17(arg_29_0, arg_29_0.pet.vehicleKills / 5)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "car_puncher" then
			if arg_29_0.pet.carPuncher == true then
				var_1_28(arg_29_0)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "br_placement" then
			if arg_29_0.pet.brWinTop3 == true then
				var_1_27(arg_29_0, 13, 14)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "plunder" then
			if arg_29_0.pet.plunderHold == true then
				var_1_27(arg_29_0, arg_29_0.pet.phaseNumber, 13)
			end
		elseif arg_29_0.petConsts[arg_29_0.pet.phaseNumber].gameType == "nuke" and arg_29_0.pet.nukeEarned == true then
			var_1_29(arg_29_0)
		end
	end

	local function var_1_31(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_2 then
			if arg_30_0.pet.phaseNumber == 2 then
				Engine.BJDBIAGIDA("watch_pet_sad_baby")
			elseif arg_30_0.pet.phaseNumber == 3 then
				Engine.BJDBIAGIDA("watch_pet_sad_child")
			elseif arg_30_0.pet.phaseNumber == 4 then
				Engine.BJDBIAGIDA("watch_pet_sad_teen_a")
			elseif arg_30_0.pet.phaseNumber == 5 then
				Engine.BJDBIAGIDA("watch_pet_sad_teen_b")
			elseif arg_30_0.pet.phaseNumber < 12 then
				Engine.BJDBIAGIDA("watch_pet_sad_adult_ae")
			else
				Engine.BJDBIAGIDA("watch_pet_sad_adult_be")
			end
		elseif arg_30_0.pet.phaseNumber == 2 then
			Engine.BJDBIAGIDA("watch_pet_happy_baby")
		elseif arg_30_0.pet.phaseNumber == 3 then
			Engine.BJDBIAGIDA("watch_pet_happy_child")
		elseif arg_30_0.pet.phaseNumber == 4 then
			Engine.BJDBIAGIDA("watch_pet_happy_teen_a")
		elseif arg_30_0.pet.phaseNumber == 5 then
			Engine.BJDBIAGIDA("watch_pet_happy_teen_b")
		elseif arg_30_0.pet.phaseNumber < 12 then
			Engine.BJDBIAGIDA("watch_pet_happy_adult_be")
		else
			Engine.BJDBIAGIDA("watch_pet_happy_adult_ae")
		end

		if arg_30_0.state == 2 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "BabyIdle")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "BabyIdleHappy")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "BabyIdleSad")
			end
		elseif arg_30_0.state == 3 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "ChildIdle")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "ChildIdleHappy")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "ChildIdleSad")
			end
		elseif arg_30_0.state == 4 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "TeenAIdle")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "TeenAIdleHappy")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "TeenAIdleSad")
			end
		elseif arg_30_0.state == 5 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "TeenBIdle")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "TeenBIdleHappy")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "TeenBIdleSad")
			end
		elseif arg_30_0.state == 6 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleRiley")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyRiley")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadRiley")
			end
		elseif arg_30_0.state == 7 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleBat")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyBat")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadBat")
			end
		elseif arg_30_0.state == 8 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdlePanda")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyPanda")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadPanda")
			end
		elseif arg_30_0.state == 9 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleBabyDragon")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyBabyDragon")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadBabyDragon")
			end
		elseif arg_30_0.state == 10 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdlePony")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyPony")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadPony")
			end
		elseif arg_30_0.state == 11 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleGhost")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyGhost")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadGhost")
			end
		elseif arg_30_0.state == 12 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleVampire")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyVampire")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadVampire")
			end
		elseif arg_30_0.state == 13 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleUnicorn")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyUnicorn")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadUnicorn")
			end
		elseif arg_30_0.state == 14 then
			if arg_30_1 == 2 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleDragon")
			elseif arg_30_1 == 1 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleHappyDragon")
			elseif arg_30_1 == 3 then
				ACTIONS.AnimateSequence(arg_30_0, "AdultIdleSadDragon")
			end
		end
	end

	local function var_1_32(arg_31_0)
		local var_31_0 = arg_31_0.petConsts[arg_31_0.pet.phaseNumber].phaseTime
		local var_31_1 = (arg_31_0.pet.growthTime - arg_31_0.pet.bonusTime * 60) / var_31_0

		arg_31_0.BarFill:SetLeftAnchor(1 - var_31_1)

		local var_31_2 = arg_31_0.pet.healthTier
		local var_31_3 = math.floor(var_31_1 / 0.34)

		if var_31_3 < var_31_2 then
			var_1_31(arg_31_0, var_31_3, true)
		elseif var_31_2 < var_31_3 then
			var_1_31(arg_31_0, var_31_3, false)
		end

		arg_31_0.pet.healthTier = var_31_3
	end

	local function var_1_33(arg_32_0, arg_32_1)
		if var_1_13(arg_32_0) or arg_32_0.pet.phaseNumber == 15 then
			return
		end

		if arg_32_1 > 90000 then
			local var_32_0 = arg_32_1 - 90000

			if arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "vehicle_kills" and arg_32_0.pet.lastVehicleKillsScore ~= var_32_0 then
				arg_32_0.pet.vehicleKills = arg_32_0.pet.vehicleKills + var_32_0 - arg_32_0.pet.lastVehicleKillsScore
				arg_32_0.pet.lastVehicleKillsScore = var_32_0

				arg_32_0.playerData.winGamesTop3:set(arg_32_0.pet.vehicleKills)
			end
		elseif arg_32_1 > 80000 then
			if arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "knife_kills" then
				local var_32_1 = arg_32_1 - 80000

				if arg_32_0.pet.lastThrowingKnifeScore ~= var_32_1 then
					arg_32_0.pet.throwingKnifeScore = arg_32_0.pet.throwingKnifeScore + var_32_1 - arg_32_0.pet.lastThrowingKnifeScore
					arg_32_0.pet.lastThrowingKnifeScore = var_32_1
				end
			end
		elseif arg_32_1 > 70000 then
			if arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "execution" then
				local var_32_2 = arg_32_1 - 70000

				arg_32_0.pet.executionsCharge = arg_32_0.pet.executionsCharge + var_32_2 - arg_32_0.pet.lastExecutionScore
				arg_32_0.pet.lastExecutionScore = var_32_2

				arg_32_0.playerData.executionsCharge:set(arg_32_0.pet.executionsCharge)
			end
		elseif arg_32_1 > 60000 then
			local var_32_3 = arg_32_1 - 60000

			arg_32_0.pet.killsCharge = arg_32_0.pet.killsCharge + var_32_3 - arg_32_0.pet.lastKillsScore
			arg_32_0.pet.bonusTime = arg_32_0.pet.bonusTime + var_32_3 - arg_32_0.pet.lastKillsScore

			if arg_32_0.pet.bonusTime > arg_32_0.petConsts[arg_32_0.pet.phaseNumber].bonusTimeMax then
				arg_32_0.pet.bonusTime = arg_32_0.petConsts[arg_32_0.pet.phaseNumber].bonusTimeMax
			end

			var_1_32(arg_32_0)

			arg_32_0.pet.lastKillsScore = var_32_3

			arg_32_0.playerData.killsCharge:set(arg_32_0.pet.killsCharge)
		elseif arg_32_1 > 50000 then
			local var_32_4 = arg_32_1 - 50000
			local var_32_5 = math.floor(var_32_4 / 100)
			local var_32_6 = var_32_4 - var_32_5 * 100

			if var_32_5 == 1 and arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "nuke" then
				var_1_17(arg_32_0, var_32_6 / 10)
			elseif var_32_5 == 2 and arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "twos" then
				var_1_17(arg_32_0, var_32_6 / 10)
			elseif var_32_5 == 3 and arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "car_puncher" then
				var_1_17(arg_32_0, var_32_6 / 10)
			elseif var_32_5 == 4 and arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "plunder" then
				var_1_17(arg_32_0, var_32_6 / 10)
			elseif var_32_5 == 5 and arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "br_placement" then
				var_1_17(arg_32_0, var_32_6 / 10)
			end
		elseif arg_32_1 == 40000 then
			if arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "plunder" then
				arg_32_0.pet.plunderHold = true
			end
		elseif arg_32_1 > 40000 then
			if arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "teabags" then
				local var_32_7 = arg_32_1 - 40000

				arg_32_0.pet.teaBags = arg_32_0.pet.teaBags + var_32_7

				arg_32_0.playerData.plantsCharge:set(arg_32_0.pet.teaBags)
			end
		elseif arg_32_1 > 30000 then
			if arg_32_0.petConsts[arg_32_0.pet.phaseNumber].gameType == "killstreaks" then
				local var_32_8 = arg_32_1 - 30000

				if arg_32_0.pet.lastKillstreakScore ~= var_32_8 then
					arg_32_0.pet.killstreakCharge = arg_32_0.pet.killstreakCharge + var_32_8 - arg_32_0.pet.lastKillstreakScore
					arg_32_0.pet.lastKillstreakScore = var_32_8
				end

				arg_32_0.playerData.killstreakCharge:set(arg_32_0.pet.killstreakCharge)
			end
		elseif arg_32_1 > 20001 then
			-- block empty
		elseif arg_32_1 == 20001 then
			-- block empty
		elseif arg_32_1 == 20000 then
			arg_32_0.pet.allKillstreaksUnlocked = 1
		elseif arg_32_1 > 10000 then
			local var_32_9 = arg_32_1 - 10000

			if var_32_9 > 100 then
				var_32_9 = var_32_9 - 100
				arg_32_0.pet.nukeEarned = true
			end

			arg_32_0.pet.juggEarned = arg_32_0.pet.juggEarned + var_32_9

			arg_32_0.playerData.nukeCharge:set(arg_32_0.pet.juggEarned)
		elseif arg_32_1 == 10000 then
			arg_32_0.pet.carPuncher = true
		end
	end

	local function var_1_34(arg_33_0, arg_33_1)
		if arg_33_1 == 2 then
			if not var_1_5(arg_33_0) then
				local var_33_0 = 4

				if arg_33_0.pet.phaseNumber == 4 then
					var_33_0 = 5
				end

				var_1_27(arg_33_0, 4, var_33_0)

				arg_33_0.pet.twoVsTwoWins = false
			else
				var_1_28(arg_33_0)
			end
		elseif arg_33_1 == 3 then
			if not var_1_5(arg_33_0) then
				local var_33_1 = 4

				if arg_33_0.pet.phaseNumber == 4 then
					var_33_1 = 5
				end

				var_1_27(arg_33_0, 5, var_33_1)

				arg_33_0.pet.twoVsTwoWins = false
			else
				var_1_28(arg_33_0)
			end
		elseif arg_33_1 == 4 then
			if arg_33_0.pet.phaseNumber < 5 then
				var_1_27(arg_33_0, arg_33_0.pet.phaseNumber, arg_33_0.pet.phaseNumber + 1)
			else
				var_1_28(arg_33_0)
			end
		end
	end

	if arg_1_0.petConsts == nil or arg_1_0.playerData == nil then
		return
	end

	arg_1_0.pet = {}
	arg_1_0.pet.phaseNumber = arg_1_0.playerData.phase:get()
	arg_1_0.pet.grownThisGame = false
	arg_1_0.pet.diedThisGame = false

	if arg_1_0.pet.phaseNumber == 0 then
		local var_1_35 = Engine.DEIDGHDBHD()

		var_1_14(arg_1_0, var_1_35, 1)
	end

	arg_1_0.pet.petDamage = arg_1_0.playerData.damage:get()
	arg_1_0.pet.growthTime = arg_1_0.playerData.growthTime:get()
	arg_1_0.pet.bonusTime = arg_1_0.playerData.bonusTime:get()

	if arg_1_0.petConsts and arg_1_0.petConsts[arg_1_0.pet.phaseNumber] then
		local var_1_36 = arg_1_0.petConsts[arg_1_0.pet.phaseNumber].phaseTime
		local var_1_37 = (arg_1_0.pet.growthTime - arg_1_0.pet.bonusTime) / var_1_36

		arg_1_0.pet.healthTier = math.floor(var_1_37 / 0.34)
	end

	arg_1_0.pet.lastUpdateTime = arg_1_0.playerData.lastUpdateTime:get()
	arg_1_0.pet.frontEndTeenPick = arg_1_0.playerData.frontEndTeenPick:get()
	arg_1_0.pet.dragonPts = arg_1_0.playerData.dragonPoints:get()
	arg_1_0.pet.vampirePts = arg_1_0.playerData.apachePoints:get()
	arg_1_0.pet.unicornPts = arg_1_0.playerData.orcaPoints:get()
	arg_1_0.pet.phaseHistory = arg_1_0.playerData.objectiveScoreCharge:get()
	arg_1_0.pet.killsCharge = arg_1_0.playerData.killsCharge:get()
	arg_1_0.pet.bonusTime = arg_1_0.playerData.bonusTime:get()
	arg_1_0.pet.throwingKnifeScore = arg_1_0.playerData.winGamesCharge:get()
	arg_1_0.pet.killstreakCharge = arg_1_0.playerData.killstreakCharge:get()
	arg_1_0.pet.topKillstreakCharge = arg_1_0.playerData.topKillstreakCharge:get()
	arg_1_0.pet.juggEarned = arg_1_0.playerData.nukeCharge:get()
	arg_1_0.pet.nukeEarned = arg_1_0.pet.juggEarned >= 100

	if arg_1_0.pet.juggEarned > 100 then
		arg_1_0.pet.juggEarned = arg_1_0.pet.juggEarned - 100
	end

	arg_1_0.pet.vehicleKills = arg_1_0.playerData.winGamesTop3:get()
	arg_1_0.pet.brWinTop3 = arg_1_0.pet.vehicleKills >= 100

	if arg_1_0.pet.vehicleKills > 100 then
		arg_1_0.pet.vehicleKills = arg_1_0.pet.vehicleKills - 100
	end

	arg_1_0.pet.teaBags = arg_1_0.playerData.plantsCharge:get()
	arg_1_0.pet.twoVsTwoWins = arg_1_0.pet.teaBags >= 100

	if arg_1_0.pet.teaBags > 100 then
		arg_1_0.pet.teaBags = arg_1_0.pet.teaBags - 100
	end

	arg_1_0.pet.carPuncher = false
	arg_1_0.pet.executionsCharge = arg_1_0.playerData.executionsCharge:get()
	arg_1_0.pet.lastKillstreakScore = 0
	arg_1_0.pet.lastObjectivesScore = 0
	arg_1_0.pet.lastKillsScore = 0
	arg_1_0.pet.lastExecutionScore = 0
	arg_1_0.pet.allKillstreaksUnlocked = 0
	arg_1_0.pet.lastThrowingKnifeScore = 0
	arg_1_0.pet.lastVehicleKillsScore = 0
	arg_1_0.state = arg_1_0.pet.phaseNumber

	var_1_17(arg_1_0, 0)
	var_1_21(arg_1_0)
	var_1_1(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "IdleEgg")

	if not Engine.DDJFBBJAIG() and arg_1_0.state == 15 and not var_1_13(arg_1_0) and not arg_1_0.pet.diedThisGame then
		local var_1_38 = Engine.DEIDGHDBHD()

		var_1_14(arg_1_0, var_1_38, 1)
		var_1_16(arg_1_0, 1, nil, true)
	else
		var_1_16(arg_1_0, arg_1_0.state, nil, true)
	end

	arg_1_0.DestructTurbo = var_1_23
	arg_1_0.ReconstructTurbo = var_1_24
	arg_1_0.ConstructTurbo = var_1_22

	if Engine.DDJFBBJAIG() then
		return
	end

	if var_1_13(arg_1_0) then
		return
	end

	Engine.EBHIFJCGBH("petwatch_turbo_state", arg_1_0.state)

	arg_1_0.secondaryTimer = LUI.UIElement.new()

	arg_1_0:addElement(arg_1_0.secondaryTimer)

	arg_1_0.heartBeatTimer = LUI.UIElement.new()

	arg_1_0:addElement(arg_1_0.heartBeatTimer)

	arg_1_0.growthAudioTimer = LUI.UIElement.new()

	arg_1_0:addElement(arg_1_0.growthAudioTimer)

	arg_1_0.rewardSplashTimer = LUI.UIElement.new()

	arg_1_0:addElement(arg_1_0.rewardSplashTimer)

	local function var_1_39(arg_34_0)
		if Engine.EAIICIFIFA() then
			return
		end

		if Game.BFEEGCHICA(arg_1_1, "ui_prematch_period") > 0 then
			return
		end

		DebugPrint("TURBO PET WATCH - LUBDUB ")

		if arg_34_0.pet.grownThisGame == false then
			arg_34_0.pet.growthTime = arg_34_0.pet.growthTime + 1
		end

		arg_34_0.playerData.growthTime:set(arg_34_0.pet.growthTime + arg_34_0.pet.bonusTime)

		if var_1_25(arg_34_0) then
			return
		end

		var_1_32(arg_34_0)
		var_1_30(arg_34_0)
	end

	local var_1_40

	local function var_1_41(arg_35_0)
		var_1_39(arg_35_0)

		arg_35_0.heartBeatTimer:Wait(1000, true).onComplete = function()
			var_1_41(arg_35_0)
		end
	end

	var_1_41(arg_1_0)

	if Engine.EAAHGICFBD() then
		local function var_1_42()
			if DataSources.inGame.MP.roundEnd.roundEndReason:GetValue(arg_1_1) ~= nil then
				var_1_39(arg_1_0)

				arg_1_0.pet.lastKillsScore = 0
			end
		end

		local var_1_43 = DataSources.inGame.MP.roundEnd.roundEndReason

		arg_1_0:SubscribeToModel(var_1_43:GetModel(arg_1_1), var_1_42)
	end

	local var_1_44 = DataSources.inGame.MP.match.team

	arg_1_0:SubscribeToModel(var_1_44:GetModel(arg_1_1), function(arg_38_0)
		if arg_1_0.pet then
			arg_1_0.pet.backFromKillcam = false
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_0", function(arg_39_0)
		local var_39_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_0")

		var_1_33(arg_39_0, var_39_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_1", function(arg_40_0)
		local var_40_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_1")

		var_1_33(arg_40_0, var_40_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_2", function(arg_41_0)
		local var_41_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_2")

		var_1_33(arg_41_0, var_41_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_3", function(arg_42_0)
		local var_42_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_3")

		var_1_33(arg_42_0, var_42_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_4", function(arg_43_0)
		local var_43_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_4")

		var_1_33(arg_43_0, var_43_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_smart_watch_interact", function(arg_44_0)
		local var_44_0 = Game.BFEEGCHICA(arg_1_1, "ui_smart_watch_interact")

		if var_44_0 > 1 then
			var_1_34(arg_44_0, var_44_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_state", function(arg_45_0)
		if petState ~= 0 then
			var_1_20(arg_45_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_action", function(arg_46_0)
		var_1_19(arg_46_0)
	end)
end

function onDead(arg_47_0)
	local var_47_0 = arg_47_0:getParent()

	ACTIONS.AnimateSequence(var_47_0, "DeadIdle")
end

function onEggToBaby(arg_48_0)
	local var_48_0 = arg_48_0:getParent()

	ACTIONS.AnimateSequence(var_48_0, "BabyIdleHappy")
end

function onBabyToChild(arg_49_0)
	local var_49_0 = arg_49_0:getParent()

	ACTIONS.AnimateSequence(var_49_0, "ChildIdleHappy")
end

function onChildToTeenA(arg_50_0)
	local var_50_0 = arg_50_0:getParent()

	ACTIONS.AnimateSequence(var_50_0, "TeenAIdleHappy")
end

function onChildToTeenB(arg_51_0)
	local var_51_0 = arg_51_0:getParent()

	ACTIONS.AnimateSequence(var_51_0, "TeenBIdleHappy")
end

function onTeenAToAdult(arg_52_0)
	local var_52_0 = arg_52_0:getParent()

	if var_52_0.state == 6 then
		if var_52_0.quality == 2 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleRiley")
		elseif var_52_0.quality == 1 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleHappyRiley")
		elseif var_52_0.quality == 3 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleSadRiley")
		end
	elseif var_52_0.state == 7 then
		if var_52_0.quality == 2 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleBat")
		elseif var_52_0.quality == 1 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleHappyBat")
		elseif var_52_0.quality == 3 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleSadBat")
		end
	elseif var_52_0.state == 8 then
		if var_52_0.quality == 2 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdlePanda")
		elseif var_52_0.quality == 1 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleHappyPanda")
		elseif var_52_0.quality == 3 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleSadPanda")
		end
	elseif var_52_0.state == 9 then
		ACTIONS.AnimateSequence(var_52_0, "AdultIdleBabyDragon")
	elseif var_52_0.state == 10 then
		ACTIONS.AnimateSequence(var_52_0, "AdultIdlePony")
	elseif var_52_0.state == 11 then
		ACTIONS.AnimateSequence(var_52_0, "AdultIdleGhost")
	elseif var_52_0.state == 12 then
		if var_52_0.quality == 2 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleVampire")
		elseif var_52_0.quality == 1 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleHappyVampire")
		elseif var_52_0.quality == 3 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleSadVampire")
		end
	elseif var_52_0.state == 13 then
		if var_52_0.quality == 2 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleUnicorn")
		elseif var_52_0.quality == 1 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleHappyUnicorn")
		elseif var_52_0.quality == 3 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleSadUnicorn")
		end
	elseif var_52_0.state == 14 then
		if var_52_0.quality == 2 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleDragon")
		elseif var_52_0.quality == 1 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleHappyDragon")
		elseif var_52_0.quality == 3 then
			ACTIONS.AnimateSequence(var_52_0, "AdultIdleSadDragon")
		end
	end
end

function onTeenBToAdult(arg_53_0)
	local var_53_0 = arg_53_0:getParent()

	if var_53_0.state == 9 then
		if var_53_0.quality == 2 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleBabyDragon")
		elseif var_53_0.quality == 1 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleHappyBabyDragon")
		elseif var_53_0.quality == 3 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleSadBabyDragon")
		end
	elseif var_53_0.state == 10 then
		if var_53_0.quality == 2 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdlePony")
		elseif var_53_0.quality == 1 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleHappyPony")
		elseif var_53_0.quality == 3 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleSadPony")
		end
	elseif var_53_0.state == 11 then
		if var_53_0.quality == 2 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleGhost")
		elseif var_53_0.quality == 1 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleHappyGhost")
		elseif var_53_0.quality == 3 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleSadGhost")
		end
	elseif var_53_0.state == 6 then
		ACTIONS.AnimateSequence(var_53_0, "AdultIdleRiley")
	elseif var_53_0.state == 7 then
		ACTIONS.AnimateSequence(var_53_0, "AdultIdleBat")
	elseif var_53_0.state == 8 then
		ACTIONS.AnimateSequence(var_53_0, "AdultIdlePanda")
	elseif var_53_0.state == 12 then
		if var_53_0.quality == 2 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleVampire")
		elseif var_53_0.quality == 1 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleHappyVampire")
		elseif var_53_0.quality == 3 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleSadVampire")
		end
	elseif var_53_0.state == 13 then
		if var_53_0.quality == 2 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleUnicorn")
		elseif var_53_0.quality == 1 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleHappyUnicorn")
		elseif var_53_0.quality == 3 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleSadUnicorn")
		end
	elseif var_53_0.state == 14 then
		if var_53_0.quality == 2 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleDragon")
		elseif var_53_0.quality == 1 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleHappyDragon")
		elseif var_53_0.quality == 3 then
			ACTIONS.AnimateSequence(var_53_0, "AdultIdleSadDragon")
		end
	end
end

function WatchPetTurbo(arg_54_0, arg_54_1)
	local var_54_0 = LUI.UIElement.new()

	var_54_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_54_0.id = "WatchPetTurbo"
	var_54_0._animationSets = var_54_0._animationSets or {}
	var_54_0._sequences = var_54_0._sequences or {}

	local var_54_1 = arg_54_1 and arg_54_1.controllerIndex

	if not var_54_1 and not Engine.DDJFBBJAIG() then
		var_54_1 = var_54_0:getRootController()
	end

	assert(var_54_1)

	local var_54_2 = var_54_0
	local var_54_3
	local var_54_4 = LUI.UIImage.new()

	var_54_4.id = "Background"

	var_54_4:setImage(RegisterMaterial("watch_pet_turbo_bg_01"), 0)
	var_54_0:addElement(var_54_4)

	var_54_0.Background = var_54_4

	local var_54_5
	local var_54_6 = LUI.UIImage.new()

	var_54_6.id = "BarFill"

	var_54_6:SetRGBFromInt(0, 0)
	var_54_6:SetAnchorsAndPosition(1, 0, 1, 0, 0, 0, _1080p * -27, _1080p * -3)
	var_54_0:addElement(var_54_6)

	var_54_0.BarFill = var_54_6

	local var_54_7
	local var_54_8 = LUI.UIImage.new()

	var_54_8.id = "Main"

	var_54_8:setImage(RegisterMaterial("watch_pet_turbo_idle_egg_01"), 0)
	var_54_0:addElement(var_54_8)

	var_54_0.Main = var_54_8

	local var_54_9
	local var_54_10 = LUI.UIImage.new()

	var_54_10.id = "Bored"

	var_54_10:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_54_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 385, _1080p * 481)
	var_54_0:addElement(var_54_10)

	var_54_0.Bored = var_54_10

	local var_54_11
	local var_54_12 = LUI.UIImage.new()

	var_54_12.id = "Unruly"

	var_54_12:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_54_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 305, _1080p * 401)
	var_54_0:addElement(var_54_12)

	var_54_0.Unruly = var_54_12

	local var_54_13
	local var_54_14 = LUI.UIImage.new()

	var_54_14.id = "Sad"

	var_54_14:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_54_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 228, _1080p * 324)
	var_54_0:addElement(var_54_14)

	var_54_0.Sad = var_54_14

	local var_54_15
	local var_54_16 = LUI.UIImage.new()

	var_54_16.id = "Hungry"

	var_54_16:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_54_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 151, _1080p * 247)
	var_54_0:addElement(var_54_16)

	var_54_0.Hungry = var_54_16

	local function var_54_17()
		return
	end

	var_54_0._sequences.DefaultSequence = var_54_17

	local var_54_18
	local var_54_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_egg_01")
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_egg_02")
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_egg_01")
		}
	}

	var_54_8:RegisterAnimationSequence("IdleEgg", var_54_19)

	local function var_54_20()
		var_54_8:AnimateLoop("IdleEgg")
	end

	var_54_0._sequences.IdleEgg = var_54_20

	local var_54_21
	local var_54_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		}
	}

	var_54_8:RegisterAnimationSequence("BabyIdle", var_54_22)

	local function var_54_23()
		var_54_8:AnimateLoop("BabyIdle")
	end

	var_54_0._sequences.BabyIdle = var_54_23

	local var_54_24
	local var_54_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		}
	}

	var_54_8:RegisterAnimationSequence("ChildIdle", var_54_25)

	local function var_54_26()
		var_54_8:AnimateLoop("ChildIdle")
	end

	var_54_0._sequences.ChildIdle = var_54_26

	local var_54_27
	local var_54_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		}
	}

	var_54_8:RegisterAnimationSequence("TeenAIdle", var_54_28)

	local function var_54_29()
		var_54_8:AnimateLoop("TeenAIdle")
	end

	var_54_0._sequences.TeenAIdle = var_54_29

	local var_54_30
	local var_54_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		}
	}

	var_54_8:RegisterAnimationSequence("TeenBIdle", var_54_31)

	local function var_54_32()
		var_54_8:AnimateLoop("TeenBIdle")
	end

	var_54_0._sequences.TeenBIdle = var_54_32

	local var_54_33
	local var_54_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleRiley", var_54_34)

	local function var_54_35()
		var_54_8:AnimateLoop("AdultIdleRiley")
	end

	var_54_0._sequences.AdultIdleRiley = var_54_35

	local var_54_36
	local var_54_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		}
	}

	var_54_8:RegisterAnimationSequence("BabyIdleHappy", var_54_37)

	local function var_54_38()
		var_54_8:AnimateLoop("BabyIdleHappy")
	end

	var_54_0._sequences.BabyIdleHappy = var_54_38

	local var_54_39
	local var_54_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		}
	}

	var_54_8:RegisterAnimationSequence("ChildIdleHappy", var_54_40)

	local function var_54_41()
		var_54_8:AnimateLoop("ChildIdleHappy")
	end

	var_54_0._sequences.ChildIdleHappy = var_54_41

	local var_54_42
	local var_54_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		}
	}

	var_54_8:RegisterAnimationSequence("TeenAIdleHappy", var_54_43)

	local function var_54_44()
		var_54_8:AnimateLoop("TeenAIdleHappy")
	end

	var_54_0._sequences.TeenAIdleHappy = var_54_44

	local var_54_45
	local var_54_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		}
	}

	var_54_8:RegisterAnimationSequence("TeenBIdleHappy", var_54_46)

	local function var_54_47()
		var_54_8:AnimateLoop("TeenBIdleHappy")
	end

	var_54_0._sequences.TeenBIdleHappy = var_54_47

	local var_54_48
	local var_54_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyRiley", var_54_49)

	local function var_54_50()
		var_54_8:AnimateLoop("AdultIdleHappyRiley")
	end

	var_54_0._sequences.AdultIdleHappyRiley = var_54_50

	local var_54_51
	local var_54_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		}
	}

	var_54_8:RegisterAnimationSequence("BabyIdleSad", var_54_52)

	local function var_54_53()
		var_54_8:AnimateLoop("BabyIdleSad")
	end

	var_54_0._sequences.BabyIdleSad = var_54_53

	local var_54_54
	local var_54_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		}
	}

	var_54_8:RegisterAnimationSequence("ChildIdleSad", var_54_55)

	local function var_54_56()
		var_54_8:AnimateLoop("ChildIdleSad")
	end

	var_54_0._sequences.ChildIdleSad = var_54_56

	local var_54_57
	local var_54_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		}
	}

	var_54_8:RegisterAnimationSequence("TeenAIdleSad", var_54_58)

	local function var_54_59()
		var_54_8:AnimateLoop("TeenAIdleSad")
	end

	var_54_0._sequences.TeenAIdleSad = var_54_59

	local var_54_60
	local var_54_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		}
	}

	var_54_8:RegisterAnimationSequence("TeenBIdleSad", var_54_61)

	local function var_54_62()
		var_54_8:AnimateLoop("TeenBIdleSad")
	end

	var_54_0._sequences.TeenBIdleSad = var_54_62

	local var_54_63
	local var_54_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadRiley", var_54_64)

	local function var_54_65()
		var_54_8:AnimateLoop("AdultIdleSadRiley")
	end

	var_54_0._sequences.AdultIdleSadRiley = var_54_65

	local var_54_66
	local var_54_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadDragon", var_54_67)

	local function var_54_68()
		var_54_8:AnimateLoop("AdultIdleSadDragon")
	end

	var_54_0._sequences.AdultIdleSadDragon = var_54_68

	local var_54_69
	local var_54_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_08"),
			onComplete = onEggToBaby
		}
	}

	var_54_8:RegisterAnimationSequence("EggToBaby", var_54_70)

	local function var_54_71()
		var_54_8:AnimateSequence("EggToBaby")
	end

	var_54_0._sequences.EggToBaby = var_54_71

	local var_54_72
	local var_54_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_05"),
			onComplete = onBabyToChild
		}
	}

	var_54_8:RegisterAnimationSequence("BabyToChild", var_54_73)

	local function var_54_74()
		var_54_8:AnimateSequence("BabyToChild")
	end

	var_54_0._sequences.BabyToChild = var_54_74

	local var_54_75
	local var_54_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_09"),
			onComplete = onChildToTeenA
		}
	}

	var_54_8:RegisterAnimationSequence("ChildToTeenA", var_54_76)

	local function var_54_77()
		var_54_8:AnimateSequence("ChildToTeenA")
	end

	var_54_0._sequences.ChildToTeenA = var_54_77

	local var_54_78
	local var_54_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_09"),
			onComplete = onChildToTeenB
		}
	}

	var_54_8:RegisterAnimationSequence("ChildToTeenB", var_54_79)

	local function var_54_80()
		var_54_8:AnimateSequence("ChildToTeenB")
	end

	var_54_0._sequences.ChildToTeenB = var_54_80

	local var_54_81
	local var_54_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_14"),
			onComplete = onTeenAToAdult
		}
	}

	var_54_8:RegisterAnimationSequence("TeenAToAdult", var_54_82)

	local function var_54_83()
		var_54_8:AnimateSequence("TeenAToAdult")
	end

	var_54_0._sequences.TeenAToAdult = var_54_83

	local var_54_84
	local var_54_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_13"),
			onComplete = onTeenBToAdult
		}
	}

	var_54_8:RegisterAnimationSequence("TeenBToAdult", var_54_85)

	local function var_54_86()
		var_54_8:AnimateSequence("TeenBToAdult")
	end

	var_54_0._sequences.TeenBToAdult = var_54_86

	local var_54_87
	local var_54_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_14")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_15")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_16"),
			onComplete = onDead
		}
	}

	var_54_8:RegisterAnimationSequence("AdultToDead", var_54_88)

	local function var_54_89()
		var_54_8:AnimateSequence("AdultToDead")
	end

	var_54_0._sequences.AdultToDead = var_54_89

	local var_54_90
	local var_54_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_01")
		}
	}

	var_54_8:RegisterAnimationSequence("DeadIdle", var_54_91)

	local function var_54_92()
		var_54_8:AnimateLoop("DeadIdle")
	end

	var_54_0._sequences.DeadIdle = var_54_92

	local var_54_93
	local var_54_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdlePanda", var_54_94)

	local function var_54_95()
		var_54_8:AnimateLoop("AdultIdlePanda")
	end

	var_54_0._sequences.AdultIdlePanda = var_54_95

	local var_54_96
	local var_54_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleGhost", var_54_97)

	local function var_54_98()
		var_54_8:AnimateLoop("AdultIdleGhost")
	end

	var_54_0._sequences.AdultIdleGhost = var_54_98

	local var_54_99
	local var_54_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdlePony", var_54_100)

	local function var_54_101()
		var_54_8:AnimateLoop("AdultIdlePony")
	end

	var_54_0._sequences.AdultIdlePony = var_54_101

	local var_54_102
	local var_54_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleUnicorn", var_54_103)

	local function var_54_104()
		var_54_8:AnimateLoop("AdultIdleUnicorn")
	end

	var_54_0._sequences.AdultIdleUnicorn = var_54_104

	local var_54_105
	local var_54_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleVampire", var_54_106)

	local function var_54_107()
		var_54_8:AnimateLoop("AdultIdleVampire")
	end

	var_54_0._sequences.AdultIdleVampire = var_54_107

	local var_54_108
	local var_54_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleBabyDragon", var_54_109)

	local function var_54_110()
		var_54_8:AnimateLoop("AdultIdleBabyDragon")
	end

	var_54_0._sequences.AdultIdleBabyDragon = var_54_110

	local var_54_111
	local var_54_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleBat", var_54_112)

	local function var_54_113()
		var_54_8:AnimateLoop("AdultIdleBat")
	end

	var_54_0._sequences.AdultIdleBat = var_54_113

	local var_54_114
	local var_54_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_04")
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleDragon", var_54_115)

	local function var_54_116()
		var_54_8:AnimateLoop("AdultIdleDragon")
	end

	var_54_0._sequences.AdultIdleDragon = var_54_116

	local var_54_117
	local var_54_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyBabyDragon", var_54_118)

	local function var_54_119()
		var_54_8:AnimateLoop("AdultIdleHappyBabyDragon")
	end

	var_54_0._sequences.AdultIdleHappyBabyDragon = var_54_119

	local var_54_120
	local var_54_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyBat", var_54_121)

	local function var_54_122()
		var_54_8:AnimateLoop("AdultIdleHappyBat")
	end

	var_54_0._sequences.AdultIdleHappyBat = var_54_122

	local var_54_123
	local var_54_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyDragon", var_54_124)

	local function var_54_125()
		var_54_8:AnimateLoop("AdultIdleHappyDragon")
	end

	var_54_0._sequences.AdultIdleHappyDragon = var_54_125

	local var_54_126
	local var_54_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyGhost", var_54_127)

	local function var_54_128()
		var_54_8:AnimateLoop("AdultIdleHappyGhost")
	end

	var_54_0._sequences.AdultIdleHappyGhost = var_54_128

	local var_54_129
	local var_54_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyPanda", var_54_130)

	local function var_54_131()
		var_54_8:AnimateLoop("AdultIdleHappyPanda")
	end

	var_54_0._sequences.AdultIdleHappyPanda = var_54_131

	local var_54_132
	local var_54_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyPony", var_54_133)

	local function var_54_134()
		var_54_8:AnimateLoop("AdultIdleHappyPony")
	end

	var_54_0._sequences.AdultIdleHappyPony = var_54_134

	local var_54_135
	local var_54_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyUnicorn", var_54_136)

	local function var_54_137()
		var_54_8:AnimateLoop("AdultIdleHappyUnicorn")
	end

	var_54_0._sequences.AdultIdleHappyUnicorn = var_54_137

	local var_54_138
	local var_54_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleHappyVampire", var_54_139)

	local function var_54_140()
		var_54_8:AnimateLoop("AdultIdleHappyVampire")
	end

	var_54_0._sequences.AdultIdleHappyVampire = var_54_140

	local var_54_141
	local var_54_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadBabyDragon", var_54_142)

	local function var_54_143()
		var_54_8:AnimateLoop("AdultIdleSadBabyDragon")
	end

	var_54_0._sequences.AdultIdleSadBabyDragon = var_54_143

	local var_54_144
	local var_54_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadBat", var_54_145)

	local function var_54_146()
		var_54_8:AnimateLoop("AdultIdleSadBat")
	end

	var_54_0._sequences.AdultIdleSadBat = var_54_146

	local var_54_147
	local var_54_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadGhost", var_54_148)

	local function var_54_149()
		var_54_8:AnimateLoop("AdultIdleSadGhost")
	end

	var_54_0._sequences.AdultIdleSadGhost = var_54_149

	local var_54_150
	local var_54_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadPanda", var_54_151)

	local function var_54_152()
		var_54_8:AnimateLoop("AdultIdleSadPanda")
	end

	var_54_0._sequences.AdultIdleSadPanda = var_54_152

	local var_54_153
	local var_54_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadPony", var_54_154)

	local function var_54_155()
		var_54_8:AnimateLoop("AdultIdleSadPony")
	end

	var_54_0._sequences.AdultIdleSadPony = var_54_155

	local var_54_156
	local var_54_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadUnicorn", var_54_157)

	local function var_54_158()
		var_54_8:AnimateLoop("AdultIdleSadUnicorn")
	end

	var_54_0._sequences.AdultIdleSadUnicorn = var_54_158

	local var_54_159
	local var_54_160 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		}
	}

	var_54_8:RegisterAnimationSequence("AdultIdleSadVampire", var_54_160)

	local function var_54_161()
		var_54_8:AnimateLoop("AdultIdleSadVampire")
	end

	var_54_0._sequences.AdultIdleSadVampire = var_54_161

	PostLoadFunc(var_54_0, var_54_1, arg_54_1)

	return var_54_0
end

MenuBuilder.registerType("WatchPetTurbo", WatchPetTurbo)
LockTable(_M)
