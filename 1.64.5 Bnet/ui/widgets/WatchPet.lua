module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._watchRef = arg_1_2.watchRef
	arg_1_0._petType = WATCH.GetPetWatchType(arg_1_2.watchRef)

	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common)

	if arg_1_0._petType == "pet_black" then
		arg_1_0.playerData = var_1_0.petWatchDataBlack
	else
		arg_1_0.playerData = var_1_0.petWatchData
	end

	local function var_1_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
		if arg_2_1 then
			arg_2_0.Bored:SetAlpha(1)
		else
			arg_2_0.Bored:SetAlpha(0)
		end

		if arg_2_2 then
			arg_2_0.Hungry:SetAlpha(1)
		else
			arg_2_0.Hungry:SetAlpha(0)
		end

		if arg_2_4 then
			arg_2_0.Unruly:SetAlpha(1)
		else
			arg_2_0.Unruly:SetAlpha(0)
		end

		if arg_2_3 then
			arg_2_0.Sad:SetAlpha(1)
		else
			arg_2_0.Sad:SetAlpha(0)
		end
	end

	if not LOOT.IsUnlocked(arg_1_1, LOOT.itemTypes.WATCH, arg_1_0._watchRef) then
		ACTIONS.AnimateSequence(arg_1_0, "IdleEgg")
		var_1_1(arg_1_0, false, false, false, false)

		return
	end

	arg_1_0.secondaryTimer = LUI.UIElement.new()

	arg_1_0:addElement(arg_1_0.secondaryTimer)

	arg_1_0.petConsts = {}

	local var_1_2 = StringTable.BFHCAIIDA(CSV.petWatchTable.file)

	for iter_1_0 = 0, var_1_2 - 1 do
		local var_1_3 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.ref)
		local var_1_4 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.phaseNum)
		local var_1_5 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.phaseTime)
		local var_1_6 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.bonusTimeMax)
		local var_1_7 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.boredomRate)
		local var_1_8 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.dirtyRate)
		local var_1_9 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.unrulyRate)
		local var_1_10 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.hungryRate)
		local var_1_11 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.boredStart)
		local var_1_12 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.dirtyStart)
		local var_1_13 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.unrulyStart)
		local var_1_14 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.hungryStart)
		local var_1_15 = StringTable.CBGJCDIHCE(CSV.petWatchTable.file, iter_1_0, CSV.petWatchTable.cols.bonusType)
		local var_1_16 = math.floor(tonumber(var_1_4))

		arg_1_0.petConsts[var_1_16] = {}
		arg_1_0.petConsts[var_1_16].phaseTime = math.floor(tonumber(var_1_5))
		arg_1_0.petConsts[var_1_16].bonusTimeMax = math.floor(tonumber(var_1_6))
		arg_1_0.petConsts[var_1_16].boredomRate = math.floor(tonumber(var_1_7))
		arg_1_0.petConsts[var_1_16].dirtyRate = math.floor(tonumber(var_1_8))
		arg_1_0.petConsts[var_1_16].unrulyRate = math.floor(tonumber(var_1_9))
		arg_1_0.petConsts[var_1_16].hungryRate = math.floor(tonumber(var_1_10))
		arg_1_0.petConsts[var_1_16].boredStart = math.floor(tonumber(var_1_11))
		arg_1_0.petConsts[var_1_16].dirtyStart = math.floor(tonumber(var_1_12))
		arg_1_0.petConsts[var_1_16].unrulyStart = math.floor(tonumber(var_1_13))
		arg_1_0.petConsts[var_1_16].hungryStart = math.floor(tonumber(var_1_14))
		arg_1_0.petConsts[var_1_16].bonusType = var_1_15
	end

	local function var_1_17(arg_3_0)
		local var_3_0 = false

		if CONDITIONS.InGame() then
			var_3_0 = VISIBILITY_CONDITIONS.InLocationSelector.conditionFunc(arg_1_1)
		end

		return not Engine.DDJFBBJAIG() and CONDITIONS.InKillCam(arg_3_0) and not var_3_0
	end

	local function var_1_18(arg_4_0, arg_4_1, arg_4_2)
		if var_1_17(arg_4_0) then
			return
		end

		arg_4_0.playerData.lastUpdateTime:set(arg_4_1)
		arg_4_0.playerData.growthTime:set(0)
		arg_4_0.playerData.phase:set(arg_4_2)
		arg_4_0.playerData.boredDmg:set(arg_4_0.petConsts[arg_4_2].boredStart)
		arg_4_0.playerData.dirtyDmg:set(arg_4_0.petConsts[arg_4_2].dirtyStart)
		arg_4_0.playerData.unrulyDmg:set(arg_4_0.petConsts[arg_4_2].unrulyStart)
		arg_4_0.playerData.hungryDmg:set(arg_4_0.petConsts[arg_4_2].hungryStart)
		arg_4_0.playerData.charged:set(0)
		arg_4_0.playerData.bonusTime:set(0)
		arg_4_0.playerData.damage:set(0)
		arg_4_0.playerData.orcaPoints:set(0)
		arg_4_0.playerData.apachePoints:set(0)
		arg_4_0.playerData.dragonPoints:set(0)
		arg_4_0.playerData.killstreakCharge:set(0)
		arg_4_0.playerData.winGamesCharge:set(0)
		arg_4_0.playerData.objectiveScoreCharge:set(0)
		arg_4_0.playerData.killsCharge:set(0)
		arg_4_0.playerData.topKillstreakCharge:set(0)
		arg_4_0.playerData.nukeCharge:set(0)
		arg_4_0.playerData.winGamesTop3:set(0)
		arg_4_0.playerData.plantsCharge:set(0)
		arg_4_0.playerData.executionsCharge:set(0)

		arg_4_0.pet.hackSysTime = false
		arg_4_0.pet.phaseNumber = arg_4_2
		arg_4_0.pet.boredHealth = arg_4_0.petConsts[arg_4_2].boredStart
		arg_4_0.pet.dirtyHealth = arg_4_0.petConsts[arg_4_2].dirtyStart
		arg_4_0.pet.unrulyHealth = arg_4_0.petConsts[arg_4_2].unrulyStart
		arg_4_0.pet.hungryHealth = arg_4_0.petConsts[arg_4_2].hungryStart
		arg_4_0.pet.lastHungryScore = 0
		arg_4_0.pet.lastBoredScore = 0
		arg_4_0.pet.lastDirtyScore = 0
		arg_4_0.pet.lastUnrulyScore = 0
		arg_4_0.pet.lastKillstreakScore = 0
		arg_4_0.pet.lastWinScore = 0
		arg_4_0.pet.lastObjectivesScore = 0
		arg_4_0.pet.lastKillsScore = 0
		arg_4_0.pet.hungryGrowthSink = 0
		arg_4_0.pet.boredGrowthSink = 0
		arg_4_0.pet.dirtyGrowthSink = 0
		arg_4_0.pet.unrulyGrowthSink = 0
		arg_4_0.pet.petDamage = 0
		arg_4_0.pet.bonusTime = 0
		arg_4_0.pet.growthTime = 0
		arg_4_0.pet.frontEndTeenPick = 0
		arg_4_0.pet.dragonPts = 0
		arg_4_0.pet.vampirePts = 0
		arg_4_0.pet.unicornPts = 0

		local var_4_0 = arg_4_0.pet.boredHealth < 0
		local var_4_1 = arg_4_0.pet.hungryHealth < 0
		local var_4_2 = arg_4_0.pet.dirtyHealth < 0
		local var_4_3 = arg_4_0.pet.unrulyHealth < 0

		var_1_1(arg_4_0, var_4_0, var_4_1, var_4_2, var_4_3)
	end

	local function var_1_19(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_1 == 15 and arg_5_0.state > 0 and arg_5_0.state < 15 then
			ACTIONS.AnimateSequence(arg_5_0, "AdultToDead")
			Engine.BJDBIAGIDA("watch_pet_trans_adult_dead")

			arg_5_0.state = arg_5_1
		elseif arg_5_2 then
			if arg_5_1 == 2 then
				ACTIONS.AnimateSequence(arg_5_0, "EggToBaby")
				Engine.BJDBIAGIDA("watch_pet_trans_egg_baby")
			elseif arg_5_1 == 3 then
				ACTIONS.AnimateSequence(arg_5_0, "BabyToChild")
				Engine.BJDBIAGIDA("watch_pet_trans_baby_child")
			elseif arg_5_1 == 4 then
				ACTIONS.AnimateSequence(arg_5_0, "ChildToTeenA")
				Engine.BJDBIAGIDA("watch_pet_trans_child_teen")
			elseif arg_5_1 == 5 then
				ACTIONS.AnimateSequence(arg_5_0, "ChildToTeenB")
				Engine.BJDBIAGIDA("watch_pet_trans_child_teen")
			elseif arg_5_1 == 15 then
				ACTIONS.AnimateSequence(arg_5_0, "AdultToDead")
				Engine.BJDBIAGIDA("watch_pet_trans_adult_dead")
			elseif arg_5_1 > 5 then
				ACTIONS.AnimateSequence(arg_5_0, "TeenAToAdult")
				Engine.BJDBIAGIDA("watch_pet_trans_adult_be_adult_ae")
			end

			arg_5_0.state = arg_5_1
		else
			arg_5_0.state = arg_5_1

			if arg_5_0.state == 0 or arg_5_0.state == 1 then
				ACTIONS.AnimateSequence(arg_5_0, "IdleEgg")
			elseif arg_5_0.state == 2 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "BabyIdle")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "BabyIdleHappy")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "BabyIdleSad")
				end
			elseif arg_5_0.state == 3 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "ChildIdle")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "ChildIdleHappy")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "ChildIdleSad")
				end
			elseif arg_5_0.state == 4 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "TeenAIdle")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "TeenAIdleHappy")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "TeenAIdleSad")
				end
			elseif arg_5_0.state == 5 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "TeenBIdle")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "TeenBIdleHappy")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "TeenBIdleSad")
				end
			elseif arg_5_0.state == 6 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleRiley")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyRiley")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadRiley")
				end
			elseif arg_5_0.state == 7 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleBat")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyBat")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadBat")
				end
			elseif arg_5_0.state == 8 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdlePanda")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyPanda")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadPanda")
				end
			elseif arg_5_0.state == 9 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleBabyDragon")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyBabyDragon")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadBabyDragon")
				end
			elseif arg_5_0.state == 10 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdlePony")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyPony")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadPony")
				end
			elseif arg_5_0.state == 11 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleGhost")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyGhost")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadGhost")
				end
			elseif arg_5_0.state == 12 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleUnicorn")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyUnicorn")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadUnicorn")
				end
			elseif arg_5_0.state == 13 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleVampire")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyVampire")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadVampire")
				end
			elseif arg_5_0.state == 14 then
				if arg_5_0.quality == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleDragon")
				elseif arg_5_0.quality == 1 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleHappyDragon")
				elseif arg_5_0.quality == 3 then
					ACTIONS.AnimateSequence(arg_5_0, "AdultIdleSadDragon")
				end
			elseif arg_5_1 == 15 then
				ACTIONS.AnimateSequence(arg_5_0, "DeadIdle")
			end
		end
	end

	local function var_1_20(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		local var_6_0 = false

		if arg_6_1 < 0 then
			var_6_0 = true
			arg_6_1 = arg_6_1 * -1
		end

		local var_6_1 = arg_6_0.state

		if arg_6_0.state == nil then
			arg_6_0.state = arg_6_1
		end

		if arg_6_0.quality == nil then
			arg_6_0.quality = 2
		end

		if arg_6_2 ~= nil then
			arg_6_0.quality = arg_6_2
		end

		if Engine.DDJFBBJAIG() then
			var_1_19(arg_6_0, var_6_1, false)
		end

		if arg_6_3 then
			var_1_19(arg_6_0, arg_6_1, var_6_0)
		else
			arg_6_0:Wait(1500).onComplete = function()
				var_1_19(arg_6_0, arg_6_1, var_6_0)
			end
		end
	end

	local function var_1_21(arg_8_0, arg_8_1, arg_8_2)
		if var_1_17() then
			return
		end

		if not arg_8_2 and not arg_8_1 and (Engine.DDJFBBJAIG() or Engine.EAIICIFIFA()) then
			arg_8_0.pet.boredHealth = arg_8_0.playerData.boredDmg:get()
			arg_8_0.pet.dirtyHealth = arg_8_0.playerData.dirtyDmg:get()
			arg_8_0.pet.unrulyHealth = arg_8_0.playerData.unrulyDmg:get()
			arg_8_0.pet.hungryHealth = arg_8_0.playerData.hungryDmg:get()
		elseif not arg_8_2 and not arg_8_1 then
			local var_8_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_dirty")
			local var_8_1 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_unruly")
			local var_8_2 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_hungry")
			local var_8_3 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_bored")

			if arg_8_0.pet.lastUnrulyScore ~= var_8_1 then
				arg_8_0.pet.unrulyHealth = math.max(-240, math.min(240, arg_8_0.pet.unrulyHealth + (var_8_1 - arg_8_0.pet.lastUnrulyScore) - arg_8_0.pet.unrulyGrowthSink))
				arg_8_0.pet.unrulyGrowthSink = 0
				arg_8_0.pet.lastUnrulyScore = var_8_1
			end

			if arg_8_0.pet.lastDirtyScore ~= var_8_0 then
				arg_8_0.pet.dirtyHealth = math.max(-240, math.min(240, arg_8_0.pet.dirtyHealth + (var_8_0 - arg_8_0.pet.lastDirtyScore) - arg_8_0.pet.dirtyGrowthSink))
				arg_8_0.pet.dirtyGrowthSink = 0
				arg_8_0.pet.lastDirtyScore = var_8_0
			end

			if arg_8_0.pet.lastBoredScore ~= var_8_3 then
				arg_8_0.pet.boredHealth = math.max(-240, math.min(240, arg_8_0.pet.boredHealth + (var_8_3 - arg_8_0.pet.lastBoredScore) - arg_8_0.pet.boredGrowthSink))
				arg_8_0.pet.boredGrowthSink = 0
				arg_8_0.pet.lastBoredScore = var_8_3
			end

			if arg_8_0.pet.lastHungryScore ~= var_8_2 then
				arg_8_0.pet.hungryHealth = math.max(-240, math.min(240, arg_8_0.pet.hungryHealth + (var_8_2 - arg_8_0.pet.lastHungryScore) - arg_8_0.pet.hungryGrowthSink))
				arg_8_0.pet.hungryGrowthSink = 0
				arg_8_0.pet.lastHungryScore = var_8_2
			end

			if not var_1_17(arg_8_0) then
				arg_8_0.playerData.boredDmg:set(arg_8_0.pet.boredHealth)
				arg_8_0.playerData.dirtyDmg:set(arg_8_0.pet.dirtyHealth)
				arg_8_0.playerData.unrulyDmg:set(arg_8_0.pet.unrulyHealth)
				arg_8_0.playerData.hungryDmg:set(arg_8_0.pet.hungryHealth)
			end
		end

		local var_8_4 = arg_8_0.pet.boredHealth < 0
		local var_8_5 = arg_8_0.pet.hungryHealth < 0
		local var_8_6 = arg_8_0.pet.dirtyHealth < 0
		local var_8_7 = arg_8_0.pet.unrulyHealth < 0

		var_1_1(arg_8_0, var_8_4, var_8_5, var_8_6, var_8_7)

		if arg_8_0.bored == nil then
			arg_8_0.bored = false
		end

		if arg_8_0.dirty == nil then
			arg_8_0.dirty = false
		end

		if arg_8_0.unruly == nil then
			arg_8_0.unruly = false
		end

		if arg_8_0.hungry == nil then
			arg_8_0.hungry = false
		end

		local var_8_8 = false
		local var_8_9 = false

		if arg_8_0.pet.hungryHealth < 0 then
			var_8_9 = var_8_9 or arg_8_0.hungry == false
			arg_8_0.hungry = true
		else
			var_8_8 = var_8_8 or arg_8_0.hungry == true
			arg_8_0.hungry = false
		end

		if arg_8_0.pet.unrulyHealth < 0 then
			var_8_9 = var_8_9 or arg_8_0.unruly == false
			arg_8_0.unruly = true
		else
			var_8_8 = var_8_8 or arg_8_0.unruly == true
			arg_8_0.unruly = false
		end

		if arg_8_0.pet.dirtyHealth < 0 then
			var_8_9 = var_8_9 or arg_8_0.dirty == false
			arg_8_0.dirty = true
		else
			var_8_8 = var_8_8 or arg_8_0.dirty == true
			arg_8_0.dirty = false
		end

		if arg_8_0.pet.boredHealth < 0 then
			var_8_9 = var_8_9 or arg_8_0.bored == false
			arg_8_0.bored = true
		else
			var_8_8 = var_8_8 or arg_8_0.bored == true
			arg_8_0.bored = false
		end

		arg_8_0.secondaryTimer:Wait(1000, true).onComplete = function()
			if var_8_9 then
				if arg_8_0.pet.phaseNumber == 2 then
					Engine.BJDBIAGIDA("watch_pet_sad_baby")
				elseif arg_8_0.pet.phaseNumber == 3 then
					Engine.BJDBIAGIDA("watch_pet_sad_child")
				elseif arg_8_0.pet.phaseNumber == 4 then
					Engine.BJDBIAGIDA("watch_pet_sad_teen_a")
				elseif arg_8_0.pet.phaseNumber == 5 then
					Engine.BJDBIAGIDA("watch_pet_sad_teen_b")
				else
					Engine.BJDBIAGIDA("watch_pet_sad_adult_ae")
				end
			elseif var_8_8 then
				if arg_8_0.pet.phaseNumber == 2 then
					Engine.BJDBIAGIDA("watch_pet_happy_baby")
				elseif arg_8_0.pet.phaseNumber == 3 then
					Engine.BJDBIAGIDA("watch_pet_happy_child")
				elseif arg_8_0.pet.phaseNumber == 4 then
					Engine.BJDBIAGIDA("watch_pet_happy_teen_a")
				elseif arg_8_0.pet.phaseNumber == 5 then
					Engine.BJDBIAGIDA("watch_pet_happy_teen_b")
				else
					Engine.BJDBIAGIDA("watch_pet_happy_adult_be")
				end
			end
		end
	end

	local function var_1_22(arg_10_0)
		local var_10_0 = 0

		if arg_10_0.pet.phaseNumber == nil or arg_10_0.pet.phaseNumber == 0 then
			return
		end

		if arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "capture" then
			var_10_0 = arg_10_0.pet.objectiveScoreCharge * 0.5
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "streak" then
			var_10_0 = arg_10_0.pet.killstreakCharge * 20
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "win" then
			var_10_0 = arg_10_0.pet.winGamesCharge * 120
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "plant" then
			var_10_0 = arg_10_0.pet.plantsCharge * 240
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "top_3" then
			var_10_0 = arg_10_0.pet.winGamesTop3 * 120
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "executions" then
			if arg_10_0.pet.executionsCharge > 0 then
				var_10_0 = 240
			end
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "streak_top" then
			if arg_10_0.pet.topKillstreakCharge > 0 then
				var_10_0 = 240
			end
		elseif arg_10_0.petConsts[arg_10_0.pet.phaseNumber].bonusType == "nuke" and arg_10_0.pet.nukeCharge > 0 then
			var_10_0 = 240
		end

		local var_10_1 = var_10_0 / 240

		arg_10_0.BarFill:SetLeftAnchor(var_10_1)
	end

	local function var_1_23(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = math.floor(arg_11_0.pet.petDamage / 334)
		local var_11_1 = Engine.DEIDGHDBHD()

		if var_11_1 == nil or Engine.EAIICIFIFA() or var_1_17(arg_11_0) then
			var_1_20(arg_11_0, arg_11_0.pet.phaseNumber, var_11_0 + 1, true)
			var_1_21(arg_11_0, false, arg_11_2)

			return
		end

		if arg_11_1 == 0 and (arg_11_0.pet.phaseNumber == 0 or arg_11_0.pet.lastUpdateTime == 0) then
			var_1_18(arg_11_0, var_11_1, 1)

			return
		end

		if Engine.DDJFBBJAIG() and arg_11_0.pet.phaseNumber == 1 then
			var_1_20(arg_11_0, arg_11_0.pet.phaseNumber, 1, true)
			var_1_21(arg_11_0, true, arg_11_2)

			return
		end

		local var_11_2 = 3600
		local var_11_3 = 24 * var_11_2
		local var_11_4 = math.floor(var_11_1 % var_11_3) / math.floor(var_11_2)
		local var_11_5 = arg_11_0.pet.phaseNumber
		local var_11_6 = var_11_1 - arg_11_0.pet.lastUpdateTime
		local var_11_7 = arg_11_1 + math.floor(var_11_6 / var_11_2)
		local var_11_8 = arg_11_0.petConsts[arg_11_0.pet.phaseNumber].phaseTime
		local var_11_9 = var_11_7 + arg_11_0.pet.bonusTime + arg_11_0.pet.growthTime

		if var_11_9 < var_11_8 and (var_11_1 < arg_11_0.pet.lastUpdateTime or var_11_7 == 0 or arg_11_0.pet.phaseNumber == 0) then
			var_1_20(arg_11_0, arg_11_0.pet.phaseNumber, var_11_0 + 1, true)
			var_1_21(arg_11_0, nil, arg_11_2)

			return
		end

		if arg_11_0.pet.phaseNumber == 15 then
			if var_11_8 <= var_11_9 then
				var_1_18(arg_11_0, var_11_1, 1)
				var_1_20(arg_11_0, arg_11_0.pet.phaseNumber, 1, false)
				var_1_21(arg_11_0, nil, arg_11_2)
			end

			arg_11_0.pet.growthTime = var_11_9

			arg_11_0.playerData.growthTime:set(var_11_9)

			return
		end

		if var_11_7 > 0 then
			local var_11_10 = var_11_7 * arg_11_0.petConsts[arg_11_0.pet.phaseNumber].boredomRate
			local var_11_11 = var_11_7 * arg_11_0.petConsts[arg_11_0.pet.phaseNumber].dirtyRate
			local var_11_12 = var_11_7 * arg_11_0.petConsts[arg_11_0.pet.phaseNumber].unrulyRate
			local var_11_13 = var_11_7 * arg_11_0.petConsts[arg_11_0.pet.phaseNumber].hungryRate
			local var_11_14 = 0
			local var_11_15 = 0
			local var_11_16 = 0
			local var_11_17 = 0

			if arg_11_0.pet.boredHealth < 0 then
				var_11_14 = var_11_10
			elseif var_11_10 > arg_11_0.pet.boredHealth then
				var_11_14 = var_11_10 - arg_11_0.pet.boredHealth
			end

			if arg_11_0.pet.dirtyHealth < 0 then
				var_11_15 = var_11_11
			elseif var_11_11 > arg_11_0.pet.dirtyHealth then
				var_11_15 = var_11_11 - arg_11_0.pet.dirtyHealth
			end

			if arg_11_0.pet.unrulyHealth < 0 then
				var_11_16 = var_11_12
			elseif var_11_12 > arg_11_0.pet.unrulyHealth then
				var_11_16 = var_11_12 - arg_11_0.pet.unrulyHealth
			end

			if arg_11_0.pet.hungryHealth < 0 then
				var_11_17 = var_11_13
			elseif var_11_13 > arg_11_0.pet.hungryHealth then
				var_11_17 = var_11_13 - arg_11_0.pet.hungryHealth
			end

			arg_11_0.pet.boredHealth = arg_11_0.pet.boredHealth - var_11_10
			arg_11_0.pet.dirtyHealth = arg_11_0.pet.dirtyHealth - var_11_11
			arg_11_0.pet.unrulyHealth = arg_11_0.pet.unrulyHealth - var_11_12
			arg_11_0.pet.hungryHealth = arg_11_0.pet.hungryHealth - var_11_13

			arg_11_0.playerData.boredDmg:set(arg_11_0.pet.boredHealth)
			arg_11_0.playerData.dirtyDmg:set(arg_11_0.pet.dirtyHealth)
			arg_11_0.playerData.unrulyDmg:set(arg_11_0.pet.unrulyHealth)
			arg_11_0.playerData.hungryDmg:set(arg_11_0.pet.hungryHealth)

			local var_11_18 = {
				var_11_14,
				var_11_15,
				var_11_16,
				var_11_17
			}

			table.sort(var_11_18, function(arg_12_0, arg_12_1)
				return arg_12_1 < arg_12_0
			end)

			local var_11_19 = math.max(var_11_18[4], 0)
			local var_11_20 = math.max(var_11_18[3], 0)
			local var_11_21 = math.max(var_11_18[2], 0)
			local var_11_22 = math.max(var_11_18[1], 0)
			local var_11_23 = var_11_19 * 30 / 10 + var_11_20 * 14 / 10 + var_11_21 * 8 / 10 + var_11_22 * 31 / 10

			arg_11_0.pet.petDamage = arg_11_0.pet.petDamage + var_11_23

			arg_11_0.playerData.damage:set(arg_11_0.pet.petDamage)

			if arg_11_0.pet.petDamage >= 1000 then
				var_1_20(arg_11_0, 15, false)
				arg_11_0.playerData.phase:set(15)

				arg_11_0.pet.phaseNumber = 15

				arg_11_0.playerData.growthTime:set(0)

				arg_11_0.pet.growthTime = 0

				arg_11_0.playerData.lastUpdateTime:set(var_11_1)

				arg_11_0.pet.lastUpdateTime = var_11_1

				arg_11_0.playerData.reproductionStreak:set(0)

				return
			end
		end

		local var_11_24 = math.floor(arg_11_0.pet.petDamage / 334)

		if var_11_8 <= var_11_9 then
			if arg_11_0.pet.phaseNumber == 1 then
				arg_11_0.pet.phaseNumber = 2
			elseif arg_11_0.pet.phaseNumber == 2 then
				arg_11_0.pet.phaseNumber = 3
			elseif arg_11_0.pet.phaseNumber == 3 then
				if arg_11_0.pet.frontEndTeenPick == 0 then
					arg_11_0.pet.phaseNumber = 4

					local var_11_25 = math.random(0, 1)

					arg_11_0.pet.phaseNumber = arg_11_0.pet.phaseNumber + var_11_25

					arg_11_0.playerData.frontEndTeenPick:set(var_11_25 + 1)
				elseif arg_11_0.pet.frontEndTeenPick == 1 then
					arg_11_0.pet.phaseNumber = 4
				elseif arg_11_0.pet.frontEndTeenPick == 2 then
					arg_11_0.pet.phaseNumber = 5
				end
			elseif arg_11_0.pet.phaseNumber == 4 then
				if var_11_24 == 2 then
					arg_11_0.pet.phaseNumber = 7
				elseif var_11_24 == 1 then
					arg_11_0.pet.phaseNumber = 8
				elseif var_11_24 == 0 then
					arg_11_0.pet.phaseNumber = 6
				end
			elseif arg_11_0.pet.phaseNumber == 5 then
				if var_11_24 == 2 then
					arg_11_0.pet.phaseNumber = 11
				elseif var_11_24 == 1 then
					arg_11_0.pet.phaseNumber = 10
				elseif var_11_24 == 0 then
					arg_11_0.pet.phaseNumber = 9
				end
			elseif arg_11_0.pet.phaseNumber == 6 then
				if arg_11_0.pet.dragonPts >= 1 then
					arg_11_0.pet.phaseNumber = 14
				else
					arg_11_0.playerData.reproductionStreak:set(arg_11_0.pet.reproductionStreak + 1)

					arg_11_0.pet.phaseNumber = 0
				end
			elseif arg_11_0.pet.phaseNumber == 7 then
				if arg_11_0.pet.vampirePts >= 10 then
					arg_11_0.pet.phaseNumber = 13
				else
					arg_11_0.playerData.reproductionStreak:set(arg_11_0.pet.reproductionStreak + 1)

					arg_11_0.pet.phaseNumber = 0
				end
			elseif arg_11_0.pet.phaseNumber == 9 then
				if arg_11_0.pet.dragonPts >= 1 then
					arg_11_0.pet.phaseNumber = 14
				else
					arg_11_0.playerData.reproductionStreak:set(arg_11_0.pet.reproductionStreak + 1)

					arg_11_0.pet.phaseNumber = 0
				end
			elseif arg_11_0.pet.phaseNumber == 10 then
				if arg_11_0.pet.unicornPts >= 10 then
					arg_11_0.pet.phaseNumber = 12
				else
					arg_11_0.playerData.reproductionStreak:set(arg_11_0.pet.reproductionStreak + 1)

					arg_11_0.pet.phaseNumber = 0
				end
			elseif arg_11_0.pet.phaseNumber < 15 then
				arg_11_0.playerData.reproductionStreak:set(arg_11_0.pet.reproductionStreak + 1)

				arg_11_0.pet.phaseNumber = 0
			end
		end

		if arg_11_0.pet.phaseNumber == 0 then
			var_1_18(arg_11_0, var_11_1, 1)
		end

		local var_11_26 = arg_11_0.pet.phaseNumber ~= var_11_5

		if var_11_26 or var_11_7 > 0 then
			if arg_11_0.pet.hackSysTime == nil or arg_11_0.pet.hackSysTime ~= true then
				arg_11_0.playerData.lastUpdateTime:set(var_11_1)
			end

			arg_11_0.pet.lastUpdateTime = var_11_1

			if var_11_26 then
				var_1_20(arg_11_0, var_11_5, var_11_24 + 1, true)
				var_1_20(arg_11_0, arg_11_0.pet.phaseNumber * -1, var_11_24 + 1, false)

				var_11_9 = 0

				if Engine.DDJFBBJAIG() then
					arg_11_0.pet.dirtyGrowthSink = 0
					arg_11_0.pet.unrulyGrowthSink = 0
					arg_11_0.pet.hungryGrowthSink = 0
					arg_11_0.pet.boredGrowthSink = 0
				else
					arg_11_0.pet.dirtyGrowthSink = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_dirty")
					arg_11_0.pet.unrulyGrowthSink = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_unruly")
					arg_11_0.pet.hungryGrowthSink = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_hungry")
					arg_11_0.pet.boredGrowthSink = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_bored")
				end

				arg_11_0.pet.boredHealth = arg_11_0.petConsts[arg_11_0.pet.phaseNumber].boredStart
				arg_11_0.pet.dirtyHealth = arg_11_0.petConsts[arg_11_0.pet.phaseNumber].dirtyStart
				arg_11_0.pet.unrulyHealth = arg_11_0.petConsts[arg_11_0.pet.phaseNumber].unrulyStart
				arg_11_0.pet.hungryHealth = arg_11_0.petConsts[arg_11_0.pet.phaseNumber].hungryStart
				arg_11_0.pet.bonusTime = 0

				arg_11_0.playerData.bonusTime:set(0)
				arg_11_0.playerData.boredDmg:set(arg_11_0.petConsts[arg_11_0.pet.phaseNumber].boredStart)
				arg_11_0.playerData.dirtyDmg:set(arg_11_0.petConsts[arg_11_0.pet.phaseNumber].dirtyStart)
				arg_11_0.playerData.unrulyDmg:set(arg_11_0.petConsts[arg_11_0.pet.phaseNumber].unrulyStart)
				arg_11_0.playerData.hungryDmg:set(arg_11_0.petConsts[arg_11_0.pet.phaseNumber].hungryStart)

				if arg_11_0.pet.phaseNumber < 2 or arg_11_0.pet.phaseNumber > 6 then
					arg_11_0.pet.petDamage = 0

					arg_11_0.playerData.damage:set(0)
				end
			else
				var_1_20(arg_11_0, arg_11_0.pet.phaseNumber, var_11_24 + 1, true)
			end

			arg_11_0.playerData.phase:set(arg_11_0.pet.phaseNumber)
			arg_11_0.playerData.growthTime:set(var_11_9)

			arg_11_0.pet.growthTime = var_11_9
		end

		var_1_21(arg_11_0, nil, arg_11_2)
	end

	local function var_1_24(arg_13_0, arg_13_1)
		var_1_23(arg_13_0, arg_13_1, false)
	end

	local function var_1_25(arg_14_0)
		local var_14_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_action")

		if var_14_0 == nil then
			return
		end

		if var_14_0 > 0 then
			var_1_24(arg_14_0, var_14_0)
		elseif var_14_0 < 0 then
			local var_14_1 = Engine.DEIDGHDBHD()

			if var_14_0 == -59 then
				local var_14_2 = 3600
				local var_14_3 = var_14_1 - 8 * var_14_2

				arg_14_0.pet.hackSysTime = true

				PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.lastUpdateTime:set(var_14_3)

				return
			end

			if var_14_1 ~= nil then
				var_1_18(arg_14_0, var_14_1, var_14_0 * -1)
				var_1_20(arg_14_0, var_14_0 * -1, 1, true)
			end
		end
	end

	local function var_1_26(arg_15_0, arg_15_1)
		if var_1_17(arg_15_0) then
			return
		end

		if arg_15_1 > 90000 then
			local var_15_0 = arg_15_1 - 90000

			arg_15_0.pet.winGamesTop3 = arg_15_0.pet.winGamesTop3 + var_15_0
		elseif arg_15_1 > 80000 then
			local var_15_1 = arg_15_1 - 80000

			if arg_15_0.pet.lastWinScore ~= var_15_1 then
				arg_15_0.pet.winGamesCharge = arg_15_0.pet.winGamesCharge + var_15_1 - arg_15_0.pet.lastWinScore
				arg_15_0.pet.lastWinScore = var_15_1
			end
		elseif arg_15_1 > 70000 then
			if arg_15_0.pet.phaseNumber == 12 or arg_15_0.pet.phaseNumber == 10 then
				local var_15_2 = arg_15_1 - 70000

				arg_15_0.pet.executionsCharge = arg_15_0.pet.executionsCharge + var_15_2

				PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.executionsCharge:set(arg_15_0.pet.executionsCharge)
			end
		elseif arg_15_1 > 60000 then
			local var_15_3 = arg_15_1 - 60000

			if arg_15_0.pet.lastKillsScore ~= var_15_3 then
				arg_15_0.pet.killsCharge = arg_15_0.pet.killsCharge + var_15_3 - arg_15_0.pet.lastKillsScore
				arg_15_0.pet.lastKillsScore = var_15_3
			end

			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.killsCharge:set(arg_15_0.pet.killsCharge)
		elseif arg_15_1 > 50000 then
			local var_15_4 = arg_15_1 - 50000

			if arg_15_0.pet.lastObjectivesScore ~= var_15_4 then
				arg_15_0.pet.objectiveScoreCharge = arg_15_0.pet.objectiveScoreCharge + var_15_4 - arg_15_0.pet.lastObjectivesScore
				arg_15_0.pet.lastObjectivesScore = var_15_4
			end

			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.objectiveScoreCharge:set(arg_15_0.pet.objectiveScoreCharge)
		elseif arg_15_1 > 40000 then
			local var_15_5 = arg_15_1 - 40000

			arg_15_0.pet.plantsCharge = arg_15_0.pet.plantsCharge + var_15_5

			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.plantsCharge:set(arg_15_0.pet.plantsCharge)
		elseif arg_15_1 > 30000 then
			local var_15_6 = arg_15_1 - 30000

			if arg_15_0.pet.lastKillstreakScore ~= var_15_6 then
				arg_15_0.pet.killstreakCharge = arg_15_0.pet.killstreakCharge + var_15_6 - arg_15_0.pet.lastKillstreakScore
				arg_15_0.pet.lastKillstreakScore = var_15_6
			end

			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.killstreakCharge:set(arg_15_0.pet.killstreakCharge)
		elseif arg_15_1 > 20000 then
			if arg_15_0.pet.phaseNumber == 7 or arg_15_0.pet.phaseNumber == 13 then
				local var_15_7 = arg_15_1 - 20000

				arg_15_0.pet.topKillstreakCharge = arg_15_0.pet.topKillstreakCharge + var_15_7

				PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.topKillstreakCharge:set(arg_15_0.pet.topKillstreakCharge)
			end
		elseif arg_15_1 > 10000 and (arg_15_0.pet.phaseNumber == 14 or arg_15_0.pet.phaseNumber == 9 or arg_15_0.pet.phaseNumber == 6) then
			local var_15_8 = arg_15_1 - 10000

			arg_15_0.pet.nukeCharge = arg_15_0.pet.nukeCharge + var_15_8

			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.nukeCharge:set(arg_15_0.pet.nukeCharge)
		end

		var_1_22(arg_15_0)
	end

	local function var_1_27(arg_16_0)
		if var_1_17(arg_16_0) then
			return
		end

		local var_16_0 = arg_16_0.petConsts[arg_16_0.pet.phaseNumber].bonusTimeMax
		local var_16_1 = arg_16_0.petConsts[arg_16_0.pet.phaseNumber].bonusType
		local var_16_2 = 0
		local var_16_3 = false

		if arg_16_0.pet.phaseNumber == 10 and arg_16_0.pet.executionsCharge > 0 then
			arg_16_0.pet.unicornPts = arg_16_0.pet.unicornPts + arg_16_0.pet.executionsCharge
			arg_16_0.pet.executionsCharge = 0

			arg_16_0.playerData.executionsCharge:set(0)
			arg_16_0.playerData.orcaPoints:set(arg_16_0.pet.unicornPts)

			var_16_3 = true
		elseif (arg_16_0.pet.phaseNumber == 6 or arg_16_0.pet.phaseNumber == 9) and arg_16_0.pet.nukeCharge > 0 then
			arg_16_0.pet.dragonPts = arg_16_0.pet.dragonPts + 1
			arg_16_0.pet.nukeCharge = 0

			arg_16_0.playerData.nukeCharge:set(0)
			arg_16_0.playerData.dragonPoints:set(arg_16_0.pet.dragonPts)

			var_16_3 = true
		elseif arg_16_0.pet.phaseNumber == 7 and arg_16_0.pet.topKillstreakCharge > 0 then
			arg_16_0.pet.vampirePts = arg_16_0.pet.vampirePts + arg_16_0.pet.topKillstreakCharge
			arg_16_0.pet.topKillstreakCharge = 0

			arg_16_0.playerData.topKillstreakCharge:set(0)
			arg_16_0.playerData.apachePoints:set(arg_16_0.pet.vampirePts)

			var_16_3 = true
		end

		if var_16_3 == true then
			arg_16_0:Wait(1200).onComplete = function()
				Engine.BJDBIAGIDA("watch_pet_trans_adult_be_adult_ae")

				arg_16_0:Wait(1200).onComplete = function()
					Engine.BJDBIAGIDA("watch_pet_happy_adult_be")

					arg_16_0:Wait(1200).onComplete = function()
						Engine.BJDBIAGIDA("watch_pet_happy_adult_be")

						arg_16_0:Wait(1200).onComplete = function()
							Engine.BJDBIAGIDA("watch_pet_happy_adult_be")
						end
					end
				end
			end
		end

		if var_16_1 == "capture" then
			var_16_2 = arg_16_0.pet.objectiveScoreCharge * 0.5
			arg_16_0.pet.objectiveScoreCharge = 0

			arg_16_0.playerData.objectiveScoreCharge:set(0)
		elseif var_16_1 == "streak" then
			var_16_2 = arg_16_0.pet.killstreakCharge * 20
			arg_16_0.pet.killstreakCharge = 0

			arg_16_0.playerData.killstreakCharge:set(0)
		elseif var_16_1 == "win" then
			var_16_2 = arg_16_0.pet.winGamesCharge * 120
			arg_16_0.pet.winGamesCharge = 0

			arg_16_0.playerData.winGamesCharge:set(0)
		elseif var_16_1 == "plant" then
			var_16_2 = arg_16_0.pet.plantsCharge * 240
			arg_16_0.pet.plantsCharge = 0

			arg_16_0.playerData.plantsCharge:set(0)
		elseif var_16_1 == "top_3" then
			var_16_2 = arg_16_0.pet.winGamesTop3 * 120
			arg_16_0.pet.winGamesTop3 = 0

			arg_16_0.playerData.winGamesTop3:set(0)
		elseif var_16_1 == "executions" then
			if arg_16_0.pet.executionsCharge > 0 then
				var_16_2 = 240
				arg_16_0.pet.executionsCharge = 0

				arg_16_0.playerData.executionsCharge:set(0)
			end
		elseif var_16_1 == "streak_top" then
			if arg_16_0.pet.topKillstreakCharge > 0 then
				var_16_2 = 240
				arg_16_0.pet.topKillstreakCharge = 0

				arg_16_0.playerData.topKillstreakCharge:set(0)
			end
		elseif var_16_1 == "nuke" and arg_16_0.pet.nukeCharge > 0 then
			var_16_2 = 240
			arg_16_0.pet.nukeCharge = 0

			arg_16_0.playerData.nukeCharge:set(0)
		end

		arg_16_0.BarFill:SetLeftAnchor(0)

		if var_16_2 > 0 then
			Engine.BJDBIAGIDA("watch_pet_time_reduced")
		end

		local var_16_4 = arg_16_0.pet.bonusTime

		arg_16_0.pet.bonusTime = arg_16_0.pet.bonusTime + var_16_2 / 240
		arg_16_0.pet.bonusTime = math.min(var_16_0, arg_16_0.pet.bonusTime)

		if var_16_4 ~= arg_16_0.pet.bonusTime then
			arg_16_0.playerData.bonusTime:set(math.ceil(arg_16_0.pet.bonusTime))
		end

		var_1_23(arg_16_0, 0, false)
	end

	local function var_1_28(arg_21_0)
		local var_21_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state")

		arg_21_0.quality = 1

		if var_21_0 / 100000 >= 1 then
			local var_21_1 = math.floor(var_21_0 / 100000)

			if var_21_1 < 4 then
				arg_21_0.quality = 1
			elseif var_21_1 < 7 then
				arg_21_0.quality = 2
			else
				arg_21_0.quality = 3
			end

			var_21_0 = var_21_0 - var_21_1 * 100000
		end

		local var_21_2 = false
		local var_21_3 = false
		local var_21_4 = false
		local var_21_5 = false

		if var_21_0 / 10000 >= 1 then
			var_21_0 = var_21_0 - 10000
			var_21_2 = true
		end

		if var_21_0 / 1000 >= 1 then
			var_21_0 = var_21_0 - 1000
			var_21_4 = true
		end

		if var_21_0 / 100 >= 1 then
			var_21_0 = var_21_0 - 100
			var_21_3 = true
		end

		if var_21_0 / 20 >= 1 then
			var_21_0 = var_21_0 - 20
			var_21_5 = true
		end

		if var_1_17(arg_21_0) or arg_21_0.pet.backFromKillcam then
			var_1_1(arg_21_0, var_21_5, var_21_2, var_21_3, var_21_4)

			if arg_21_0.pet.backFromKillcam then
				arg_21_0.pet.backFromKillcam = false
				var_21_0 = arg_21_0.pet.originalPhase
			else
				arg_21_0.pet.backFromKillcam = true
				arg_21_0.pet.originalPhase = arg_21_0.pet.phaseNumber
			end

			var_1_19(arg_21_0, var_21_0, false)
			var_1_21(arg_21_0)
		end
	end

	local function var_1_29(arg_22_0)
		arg_22_0.pet.reproductionStreak = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchData.reproductionStreak:get()

		if arg_22_0.pet.phaseNumber == nil or arg_22_0.pet.phaseNumber == 0 then
			arg_22_0.pet.phaseNumber = 1

			var_1_20(arg_22_0, 1, 1, true)
			var_1_21(arg_22_0, true)
		end

		var_1_22(arg_22_0)
	end

	local function var_1_30(arg_23_0)
		var_1_23(arg_23_0, 0, true)
	end

	local function var_1_31(arg_24_0)
		return arg_24_0.pet
	end

	local function var_1_32(arg_25_0, arg_25_1)
		arg_25_0.pet = arg_25_1
		arg_25_0.pet.backFromKillcam = false

		var_1_29(arg_25_0)
		var_1_30(arg_25_0)
	end

	arg_1_0.pet = {}
	arg_1_0.pet.phaseNumber = arg_1_0.playerData.phase:get()
	arg_1_0.pet.boredHealth = arg_1_0.playerData.boredDmg:get()
	arg_1_0.pet.dirtyHealth = arg_1_0.playerData.dirtyDmg:get()
	arg_1_0.pet.unrulyHealth = arg_1_0.playerData.unrulyDmg:get()
	arg_1_0.pet.hungryHealth = arg_1_0.playerData.hungryDmg:get()
	arg_1_0.pet.petDamage = arg_1_0.playerData.damage:get()
	arg_1_0.pet.lastUpdateTime = arg_1_0.playerData.lastUpdateTime:get()
	arg_1_0.pet.bonusTime = arg_1_0.playerData.bonusTime:get()
	arg_1_0.pet.growthTime = arg_1_0.playerData.growthTime:get()
	arg_1_0.pet.frontEndTeenPick = arg_1_0.playerData.frontEndTeenPick:get()
	arg_1_0.pet.dragonPts = arg_1_0.playerData.dragonPoints:get()
	arg_1_0.pet.vampirePts = arg_1_0.playerData.apachePoints:get()
	arg_1_0.pet.unicornPts = arg_1_0.playerData.orcaPoints:get()
	arg_1_0.pet.objectiveScoreCharge = arg_1_0.playerData.objectiveScoreCharge:get()
	arg_1_0.pet.killsCharge = arg_1_0.playerData.killsCharge:get()
	arg_1_0.pet.winGamesCharge = arg_1_0.playerData.winGamesCharge:get()
	arg_1_0.pet.killstreakCharge = arg_1_0.playerData.killstreakCharge:get()
	arg_1_0.pet.topKillstreakCharge = arg_1_0.playerData.topKillstreakCharge:get()
	arg_1_0.pet.nukeCharge = arg_1_0.playerData.nukeCharge:get()
	arg_1_0.pet.winGamesTop3 = arg_1_0.playerData.winGamesTop3:get()
	arg_1_0.pet.plantsCharge = arg_1_0.playerData.plantsCharge:get()
	arg_1_0.pet.executionsCharge = arg_1_0.playerData.executionsCharge:get()
	arg_1_0.pet.hungryGrowthSink = 0
	arg_1_0.pet.boredGrowthSink = 0
	arg_1_0.pet.dirtyGrowthSink = 0
	arg_1_0.pet.unrulyGrowthSink = 0
	arg_1_0.pet.lastHungryScore = 0
	arg_1_0.pet.lastBoredScore = 0
	arg_1_0.pet.lastDirtyScore = 0
	arg_1_0.pet.lastUnrulyScore = 0
	arg_1_0.pet.lastKillstreakScore = 0
	arg_1_0.pet.lastWinScore = 0
	arg_1_0.pet.lastObjectivesScore = 0
	arg_1_0.pet.lastKillsScore = 0

	var_1_29(arg_1_0)

	arg_1_0.state = 0

	ACTIONS.AnimateSequence(arg_1_0, "IdleEgg")

	arg_1_0.Destruct = var_1_31
	arg_1_0.Reconstruct = var_1_32
	arg_1_0.Construct = var_1_30

	if Engine.DDJFBBJAIG() then
		var_1_23(arg_1_0, 0, false)
		var_1_21(arg_1_0)

		return
	end

	local var_1_33 = DataSources.inGame.MP.match.team

	arg_1_0:SubscribeToModel(var_1_33:GetModel(arg_1_1), function(arg_26_0)
		if arg_1_0.pet then
			arg_1_0.pet.backFromKillcam = false
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_health_dirty", function(arg_27_0)
		if Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_dirty") ~= 0 then
			var_1_21(arg_27_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_health_unruly", function(arg_28_0)
		if Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_unruly") ~= 0 then
			var_1_21(arg_28_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_health_hungry", function(arg_29_0)
		if Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_hungry") ~= 0 then
			var_1_21(arg_29_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_health_bored", function(arg_30_0)
		if Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_health_bored") ~= 0 then
			var_1_21(arg_30_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_0", function(arg_31_0)
		local var_31_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_0")

		var_1_26(arg_31_0, var_31_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_1", function(arg_32_0)
		local var_32_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_1")

		var_1_26(arg_32_0, var_32_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_2", function(arg_33_0)
		local var_33_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_2")

		var_1_26(arg_33_0, var_33_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_3", function(arg_34_0)
		local var_34_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_3")

		var_1_26(arg_34_0, var_34_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_4", function(arg_35_0)
		local var_35_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_4")

		var_1_26(arg_35_0, var_35_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_smart_watch_interact", function(arg_36_0)
		var_1_27(arg_36_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_state", function(arg_37_0)
		if Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state") ~= 0 then
			var_1_28(arg_37_0)
		end
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_action", function(arg_38_0)
		var_1_25(arg_38_0)
	end)
end

function onDead(arg_39_0)
	local var_39_0 = arg_39_0:getParent()

	ACTIONS.AnimateSequence(var_39_0, "DeadIdle")
end

function onEggToBaby(arg_40_0)
	local var_40_0 = arg_40_0:getParent()

	ACTIONS.AnimateSequence(var_40_0, "BabyIdleHappy")
end

function onBabyToChild(arg_41_0)
	local var_41_0 = arg_41_0:getParent()

	ACTIONS.AnimateSequence(var_41_0, "ChildIdleHappy")
end

function onChildToTeenA(arg_42_0)
	local var_42_0 = arg_42_0:getParent()

	ACTIONS.AnimateSequence(var_42_0, "TeenAIdleHappy")
end

function onChildToTeenB(arg_43_0)
	local var_43_0 = arg_43_0:getParent()

	ACTIONS.AnimateSequence(var_43_0, "TeenBIdleHappy")
end

function onTeenAToAdult(arg_44_0)
	local var_44_0 = arg_44_0:getParent()

	if var_44_0.state == 6 then
		if var_44_0.quality == 2 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleRiley")
		elseif var_44_0.quality == 1 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleHappyRiley")
		elseif var_44_0.quality == 3 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleSadRiley")
		end
	elseif var_44_0.state == 7 then
		if var_44_0.quality == 2 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleBat")
		elseif var_44_0.quality == 1 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleHappyBat")
		elseif var_44_0.quality == 3 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleSadBat")
		end
	elseif var_44_0.state == 8 then
		if var_44_0.quality == 2 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdlePanda")
		elseif var_44_0.quality == 1 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleHappyPanda")
		elseif var_44_0.quality == 3 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleSadPanda")
		end
	elseif var_44_0.state == 9 then
		ACTIONS.AnimateSequence(var_44_0, "AdultIdleBabyDragon")
	elseif var_44_0.state == 10 then
		ACTIONS.AnimateSequence(var_44_0, "AdultIdlePony")
	elseif var_44_0.state == 11 then
		ACTIONS.AnimateSequence(var_44_0, "AdultIdleGhost")
	elseif var_44_0.state == 12 then
		if var_44_0.quality == 2 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleUnicorn")
		elseif var_44_0.quality == 1 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleHappyUnicorn")
		elseif var_44_0.quality == 3 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleSadUnicorn")
		end
	elseif var_44_0.state == 13 then
		if var_44_0.quality == 2 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleVampire")
		elseif var_44_0.quality == 1 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleHappyVampire")
		elseif var_44_0.quality == 3 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleSadVampire")
		end
	elseif var_44_0.state == 14 then
		if var_44_0.quality == 2 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleDragon")
		elseif var_44_0.quality == 1 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleHappyDragon")
		elseif var_44_0.quality == 3 then
			ACTIONS.AnimateSequence(var_44_0, "AdultIdleSadDragon")
		end
	end
end

function onTeenBToAdult(arg_45_0)
	local var_45_0 = arg_45_0:getParent()

	if var_45_0.state == 9 then
		if var_45_0.quality == 2 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleBabyDragon")
		elseif var_45_0.quality == 1 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleHappyBabyDragon")
		elseif var_45_0.quality == 3 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleSadBabyDragon")
		end
	elseif var_45_0.state == 10 then
		if var_45_0.quality == 2 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdlePony")
		elseif var_45_0.quality == 1 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleHappyPony")
		elseif var_45_0.quality == 3 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleSadPony")
		end
	elseif var_45_0.state == 11 then
		if var_45_0.quality == 2 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleGhost")
		elseif var_45_0.quality == 1 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleHappyGhost")
		elseif var_45_0.quality == 3 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleSadGhost")
		end
	elseif var_45_0.state == 6 then
		ACTIONS.AnimateSequence(var_45_0, "AdultIdleRiley")
	elseif var_45_0.state == 7 then
		ACTIONS.AnimateSequence(var_45_0, "AdultIdleBat")
	elseif var_45_0.state == 8 then
		ACTIONS.AnimateSequence(var_45_0, "AdultIdlePanda")
	elseif var_45_0.state == 12 then
		if var_45_0.quality == 2 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleUnicorn")
		elseif var_45_0.quality == 1 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleHappyUnicorn")
		elseif var_45_0.quality == 3 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleSadUnicorn")
		end
	elseif var_45_0.state == 13 then
		if var_45_0.quality == 2 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleVampire")
		elseif var_45_0.quality == 1 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleHappyVampire")
		elseif var_45_0.quality == 3 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleSadVampire")
		end
	elseif var_45_0.state == 14 then
		if var_45_0.quality == 2 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleDragon")
		elseif var_45_0.quality == 1 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleHappyDragon")
		elseif var_45_0.quality == 3 then
			ACTIONS.AnimateSequence(var_45_0, "AdultIdleSadDragon")
		end
	end
end

function WatchPet(arg_46_0, arg_46_1)
	local var_46_0 = LUI.UIElement.new()

	var_46_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_46_0.id = "WatchPet"
	var_46_0._animationSets = var_46_0._animationSets or {}
	var_46_0._sequences = var_46_0._sequences or {}

	local var_46_1 = arg_46_1 and arg_46_1.controllerIndex

	if not var_46_1 and not Engine.DDJFBBJAIG() then
		var_46_1 = var_46_0:getRootController()
	end

	assert(var_46_1)

	local var_46_2 = var_46_0
	local var_46_3
	local var_46_4 = LUI.UIImage.new()

	var_46_4.id = "Background"

	var_46_4:SetRGBFromInt(10407836, 0)
	var_46_4:SetAlpha(0, 0)
	var_46_0:addElement(var_46_4)

	var_46_0.Background = var_46_4

	local var_46_5
	local var_46_6 = LUI.UIImage.new()

	var_46_6.id = "BarFill"

	var_46_6:SetRGBFromInt(0, 0)
	var_46_6:SetAnchorsAndPosition(1, 0, 1, 0, 0, 0, _1080p * -27, _1080p * -3)
	var_46_0:addElement(var_46_6)

	var_46_0.BarFill = var_46_6

	local var_46_7
	local var_46_8 = LUI.UIImage.new()

	var_46_8.id = "Main"

	var_46_8:SetRGBFromInt(0, 0)
	var_46_8:setImage(RegisterMaterial("watch_pet_idle_egg_01"), 0)
	var_46_0:addElement(var_46_8)

	var_46_0.Main = var_46_8

	local var_46_9
	local var_46_10 = LUI.UIImage.new()

	var_46_10.id = "Bored"

	var_46_10:SetRGBFromInt(0, 0)
	var_46_10:setImage(RegisterMaterial("watch_pet_emoji_sleepy"), 0)
	var_46_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 503, _1080p * 381, _1080p * 473)
	var_46_0:addElement(var_46_10)

	var_46_0.Bored = var_46_10

	local var_46_11
	local var_46_12 = LUI.UIImage.new()

	var_46_12.id = "Unruly"

	var_46_12:SetRGBFromInt(0, 0)
	var_46_12:setImage(RegisterMaterial("watch_pet_emoji_unruly"), 0)
	var_46_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 503, _1080p * 289, _1080p * 381)
	var_46_0:addElement(var_46_12)

	var_46_0.Unruly = var_46_12

	local var_46_13
	local var_46_14 = LUI.UIImage.new()

	var_46_14.id = "Sad"

	var_46_14:SetRGBFromInt(0, 0)
	var_46_14:setImage(RegisterMaterial("watch_pet_emoji_dirty"), 0)
	var_46_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 503, _1080p * 197, _1080p * 289)
	var_46_0:addElement(var_46_14)

	var_46_0.Sad = var_46_14

	local var_46_15
	local var_46_16 = LUI.UIImage.new()

	var_46_16.id = "Hungry"

	var_46_16:SetRGBFromInt(0, 0)
	var_46_16:setImage(RegisterMaterial("watch_pet_emoji_hungry"), 0)
	var_46_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 503, _1080p * 105, _1080p * 197)
	var_46_0:addElement(var_46_16)

	var_46_0.Hungry = var_46_16

	local function var_46_17()
		return
	end

	var_46_0._sequences.DefaultSequence = var_46_17

	local var_46_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_egg_01")
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_egg_02")
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_egg_01")
		}
	}

	var_46_8:RegisterAnimationSequence("IdleEgg", var_46_18)

	local function var_46_19()
		var_46_8:AnimateLoop("IdleEgg")
	end

	var_46_0._sequences.IdleEgg = var_46_19

	local var_46_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_01")
		}
	}

	var_46_8:RegisterAnimationSequence("BabyIdle", var_46_20)

	local function var_46_21()
		var_46_8:AnimateLoop("BabyIdle")
	end

	var_46_0._sequences.BabyIdle = var_46_21

	local var_46_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_01")
		}
	}

	var_46_8:RegisterAnimationSequence("ChildIdle", var_46_22)

	local function var_46_23()
		var_46_8:AnimateLoop("ChildIdle")
	end

	var_46_0._sequences.ChildIdle = var_46_23

	local var_46_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_01")
		}
	}

	var_46_8:RegisterAnimationSequence("TeenAIdle", var_46_24)

	local function var_46_25()
		var_46_8:AnimateLoop("TeenAIdle")
	end

	var_46_0._sequences.TeenAIdle = var_46_25

	local var_46_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_01")
		}
	}

	var_46_8:RegisterAnimationSequence("TeenBIdle", var_46_26)

	local function var_46_27()
		var_46_8:AnimateLoop("TeenBIdle")
	end

	var_46_0._sequences.TeenBIdle = var_46_27

	local var_46_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_01")
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
			value = RegisterMaterial("watch_pet_idle_riley_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleRiley", var_46_28)

	local function var_46_29()
		var_46_8:AnimateLoop("AdultIdleRiley")
	end

	var_46_0._sequences.AdultIdleRiley = var_46_29

	local var_46_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_01")
		}
	}

	var_46_8:RegisterAnimationSequence("BabyIdleHappy", var_46_30)

	local function var_46_31()
		var_46_8:AnimateLoop("BabyIdleHappy")
	end

	var_46_0._sequences.BabyIdleHappy = var_46_31

	local var_46_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_01")
		}
	}

	var_46_8:RegisterAnimationSequence("ChildIdleHappy", var_46_32)

	local function var_46_33()
		var_46_8:AnimateLoop("ChildIdleHappy")
	end

	var_46_0._sequences.ChildIdleHappy = var_46_33

	local var_46_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_01")
		}
	}

	var_46_8:RegisterAnimationSequence("TeenAIdleHappy", var_46_34)

	local function var_46_35()
		var_46_8:AnimateLoop("TeenAIdleHappy")
	end

	var_46_0._sequences.TeenAIdleHappy = var_46_35

	local var_46_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_01")
		}
	}

	var_46_8:RegisterAnimationSequence("TeenBIdleHappy", var_46_36)

	local function var_46_37()
		var_46_8:AnimateLoop("TeenBIdleHappy")
	end

	var_46_0._sequences.TeenBIdleHappy = var_46_37

	local var_46_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_riley_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyRiley", var_46_38)

	local function var_46_39()
		var_46_8:AnimateLoop("AdultIdleHappyRiley")
	end

	var_46_0._sequences.AdultIdleHappyRiley = var_46_39

	local var_46_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_01")
		}
	}

	var_46_8:RegisterAnimationSequence("BabyIdleSad", var_46_40)

	local function var_46_41()
		var_46_8:AnimateLoop("BabyIdleSad")
	end

	var_46_0._sequences.BabyIdleSad = var_46_41

	local var_46_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_child_01")
		}
	}

	var_46_8:RegisterAnimationSequence("ChildIdleSad", var_46_42)

	local function var_46_43()
		var_46_8:AnimateLoop("ChildIdleSad")
	end

	var_46_0._sequences.ChildIdleSad = var_46_43

	local var_46_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_a_01")
		}
	}

	var_46_8:RegisterAnimationSequence("TeenAIdleSad", var_46_44)

	local function var_46_45()
		var_46_8:AnimateLoop("TeenAIdleSad")
	end

	var_46_0._sequences.TeenAIdleSad = var_46_45

	local var_46_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_teen_b_01")
		}
	}

	var_46_8:RegisterAnimationSequence("TeenBIdleSad", var_46_46)

	local function var_46_47()
		var_46_8:AnimateLoop("TeenBIdleSad")
	end

	var_46_0._sequences.TeenBIdleSad = var_46_47

	local var_46_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_riley_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_riley_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadRiley", var_46_48)

	local function var_46_49()
		var_46_8:AnimateLoop("AdultIdleSadRiley")
	end

	var_46_0._sequences.AdultIdleSadRiley = var_46_49

	local var_46_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadDragon", var_46_50)

	local function var_46_51()
		var_46_8:AnimateLoop("AdultIdleSadDragon")
	end

	var_46_0._sequences.AdultIdleSadDragon = var_46_51

	local var_46_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_egg_baby_08"),
			onComplete = onEggToBaby
		}
	}

	var_46_8:RegisterAnimationSequence("EggToBaby", var_46_52)

	local function var_46_53()
		var_46_8:AnimateSequence("EggToBaby")
	end

	var_46_0._sequences.EggToBaby = var_46_53

	local var_46_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_baby_child_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_baby_child_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_baby_child_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_baby_child_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_baby_child_05"),
			onComplete = onBabyToChild
		}
	}

	var_46_8:RegisterAnimationSequence("BabyToChild", var_46_54)

	local function var_46_55()
		var_46_8:AnimateSequence("BabyToChild")
	end

	var_46_0._sequences.BabyToChild = var_46_55

	local var_46_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_09"),
			onComplete = onChildToTeenA
		}
	}

	var_46_8:RegisterAnimationSequence("ChildToTeenA", var_46_56)

	local function var_46_57()
		var_46_8:AnimateSequence("ChildToTeenA")
	end

	var_46_0._sequences.ChildToTeenA = var_46_57

	local var_46_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_child_teen_09"),
			onComplete = onChildToTeenB
		}
	}

	var_46_8:RegisterAnimationSequence("ChildToTeenB", var_46_58)

	local function var_46_59()
		var_46_8:AnimateSequence("ChildToTeenB")
	end

	var_46_0._sequences.ChildToTeenB = var_46_59

	local var_46_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_13"),
			onComplete = onTeenAToAdult
		}
	}

	var_46_8:RegisterAnimationSequence("TeenAToAdult", var_46_60)

	local function var_46_61()
		var_46_8:AnimateSequence("TeenAToAdult")
	end

	var_46_0._sequences.TeenAToAdult = var_46_61

	local var_46_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_teen_adult_13"),
			onComplete = onTeenBToAdult
		}
	}

	var_46_8:RegisterAnimationSequence("TeenBToAdult", var_46_62)

	local function var_46_63()
		var_46_8:AnimateSequence("TeenBToAdult")
	end

	var_46_0._sequences.TeenBToAdult = var_46_63

	local var_46_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_14")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_15")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_transform_adult_dead_16"),
			onComplete = onDead
		}
	}

	var_46_8:RegisterAnimationSequence("AdultToDead", var_46_64)

	local function var_46_65()
		var_46_8:AnimateSequence("AdultToDead")
	end

	var_46_0._sequences.AdultToDead = var_46_65

	local var_46_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dead_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dead_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dead_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dead_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dead_01")
		}
	}

	var_46_8:RegisterAnimationSequence("DeadIdle", var_46_66)

	local function var_46_67()
		var_46_8:AnimateLoop("DeadIdle")
	end

	var_46_0._sequences.DeadIdle = var_46_67

	local var_46_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdlePanda", var_46_68)

	local function var_46_69()
		var_46_8:AnimateLoop("AdultIdlePanda")
	end

	var_46_0._sequences.AdultIdlePanda = var_46_69

	local var_46_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_4:RegisterAnimationSequence("AdultIdleGhost", var_46_70)

	local var_46_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleGhost", var_46_71)

	local function var_46_72()
		var_46_4:AnimateLoop("AdultIdleGhost")
		var_46_8:AnimateLoop("AdultIdleGhost")
	end

	var_46_0._sequences.AdultIdleGhost = var_46_72

	local var_46_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdlePony", var_46_73)

	local function var_46_74()
		var_46_8:AnimateLoop("AdultIdlePony")
	end

	var_46_0._sequences.AdultIdlePony = var_46_74

	local var_46_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleUnicorn", var_46_75)

	local function var_46_76()
		var_46_8:AnimateLoop("AdultIdleUnicorn")
	end

	var_46_0._sequences.AdultIdleUnicorn = var_46_76

	local var_46_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleVampire", var_46_77)

	local function var_46_78()
		var_46_8:AnimateLoop("AdultIdleVampire")
	end

	var_46_0._sequences.AdultIdleVampire = var_46_78

	local var_46_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleBabyDragon", var_46_79)

	local function var_46_80()
		var_46_8:AnimateLoop("AdultIdleBabyDragon")
	end

	var_46_0._sequences.AdultIdleBabyDragon = var_46_80

	local var_46_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleBat", var_46_81)

	local function var_46_82()
		var_46_8:AnimateLoop("AdultIdleBat")
	end

	var_46_0._sequences.AdultIdleBat = var_46_82

	local var_46_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_05")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_06")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_07")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_08")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleDragon", var_46_83)

	local function var_46_84()
		var_46_8:AnimateLoop("AdultIdleDragon")
	end

	var_46_0._sequences.AdultIdleDragon = var_46_84

	local var_46_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_baby_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyBabyDragon", var_46_85)

	local function var_46_86()
		var_46_8:AnimateLoop("AdultIdleHappyBabyDragon")
	end

	var_46_0._sequences.AdultIdleHappyBabyDragon = var_46_86

	local var_46_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_bat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyBat", var_46_87)

	local function var_46_88()
		var_46_8:AnimateLoop("AdultIdleHappyBat")
	end

	var_46_0._sequences.AdultIdleHappyBat = var_46_88

	local var_46_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_dragon_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyDragon", var_46_89)

	local function var_46_90()
		var_46_8:AnimateLoop("AdultIdleHappyDragon")
	end

	var_46_0._sequences.AdultIdleHappyDragon = var_46_90

	local var_46_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_ghost_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyGhost", var_46_91)

	local function var_46_92()
		var_46_8:AnimateLoop("AdultIdleHappyGhost")
	end

	var_46_0._sequences.AdultIdleHappyGhost = var_46_92

	local var_46_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_panda_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyPanda", var_46_93)

	local function var_46_94()
		var_46_8:AnimateLoop("AdultIdleHappyPanda")
	end

	var_46_0._sequences.AdultIdleHappyPanda = var_46_94

	local var_46_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_pony_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyPony", var_46_95)

	local function var_46_96()
		var_46_8:AnimateLoop("AdultIdleHappyPony")
	end

	var_46_0._sequences.AdultIdleHappyPony = var_46_96

	local var_46_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_unicorn_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyUnicorn", var_46_97)

	local function var_46_98()
		var_46_8:AnimateLoop("AdultIdleHappyUnicorn")
	end

	var_46_0._sequences.AdultIdleHappyUnicorn = var_46_98

	local var_46_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_happy_vampire_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleHappyVampire", var_46_99)

	local function var_46_100()
		var_46_8:AnimateLoop("AdultIdleHappyVampire")
	end

	var_46_0._sequences.AdultIdleHappyVampire = var_46_100

	local var_46_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_baby_dragon_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_baby_dragon_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadBabyDragon", var_46_101)

	local function var_46_102()
		var_46_8:AnimateLoop("AdultIdleSadBabyDragon")
	end

	var_46_0._sequences.AdultIdleSadBabyDragon = var_46_102

	local var_46_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_bat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_bat_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadBat", var_46_103)

	local function var_46_104()
		var_46_8:AnimateLoop("AdultIdleSadBat")
	end

	var_46_0._sequences.AdultIdleSadBat = var_46_104

	local var_46_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_ghost_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_ghost_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadGhost", var_46_105)

	local function var_46_106()
		var_46_8:AnimateLoop("AdultIdleSadGhost")
	end

	var_46_0._sequences.AdultIdleSadGhost = var_46_106

	local var_46_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_panda_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_panda_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadPanda", var_46_107)

	local function var_46_108()
		var_46_8:AnimateLoop("AdultIdleSadPanda")
	end

	var_46_0._sequences.AdultIdleSadPanda = var_46_108

	local var_46_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_pony_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_pony_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadPony", var_46_109)

	local function var_46_110()
		var_46_8:AnimateLoop("AdultIdleSadPony")
	end

	var_46_0._sequences.AdultIdleSadPony = var_46_110

	local var_46_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_unicorn_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_unicorn_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadUnicorn", var_46_111)

	local function var_46_112()
		var_46_8:AnimateLoop("AdultIdleSadUnicorn")
	end

	var_46_0._sequences.AdultIdleSadUnicorn = var_46_112

	local var_46_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_sad_vampire_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_idle_vampire_01")
		}
	}

	var_46_8:RegisterAnimationSequence("AdultIdleSadVampire", var_46_113)

	local function var_46_114()
		var_46_8:AnimateLoop("AdultIdleSadVampire")
	end

	var_46_0._sequences.AdultIdleSadVampire = var_46_114

	PostLoadFunc(var_46_0, var_46_1, arg_46_1)

	return var_46_0
end

MenuBuilder.registerType("WatchPet", WatchPet)
LockTable(_M)
