module(..., package.seeall)

local var_0_0 = 1000
local var_0_1 = 500
local var_0_2 = 1000
local var_0_3 = 2500
local var_0_4 = 3500
local var_0_5 = 2000
local var_0_6 = {
	eFull = 0,
	eHalf = 1,
	eZero = 2
}

local function var_0_7(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_0.AARRankUpContainer)
	assert(arg_1_0.AARProgressBar)
	assert(arg_1_0.XPValue)
	arg_1_0.AARRankUpContainer:SetAlpha(arg_1_2 and 1 or 0, arg_1_3 or 0)
	arg_1_0.AARProgressBar:SetAlpha(arg_1_2 and 1 or 0, arg_1_3 or 0)
	arg_1_0.XPValue:SetAlpha(arg_1_2 and 1 or 0, arg_1_3 or 0)
	arg_1_0.EarnRateBuff:SetAlpha(arg_1_2 and 1 or 0, arg_1_3 or 0)

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_1_0) then
		assert(arg_1_0.AARIGRXPBonusTip)
		arg_1_0.AARIGRXPBonusTip:SetAlpha(arg_1_2 and 1 or 0, arg_1_3 or 0)
	end
end

local function var_0_8(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_0.ElderProgressBar)
	assert(arg_2_0.ElderRankIcon)
	assert(arg_2_0.ElderRankName)
	assert(arg_2_0.ElderRankValue)
	arg_2_0.ElderProgressBar:SetAlpha(arg_2_2 and 1 or 0, arg_2_3 or 0)
	arg_2_0.ElderRankIcon:SetAlpha(arg_2_2 and 1 or 0, arg_2_3 or 0)
	arg_2_0.ElderRankName:SetAlpha(arg_2_2 and 1 or 0, arg_2_3 or 0)
	arg_2_0.ElderRankValue:SetAlpha(arg_2_2 and 1 or 0, arg_2_3 or 0)
end

ParadeStateFlowTable = {
	[AAR.ParadeState.XP_NONE] = {
		EnterConditionFunction = function(arg_3_0, arg_3_1)
			local var_3_0 = AAR.GetDebugMatchInfoPackageString(arg_3_1)

			DebugPrint("$$$ AAR None State: " .. var_3_0)

			return arg_3_0.earnedTotalXP == 0 and arg_3_0.earnedSeasonXP == 0
		end,
		ExitFunction = function(arg_4_0, arg_4_1)
			var_0_7(arg_4_0, arg_4_1, false, 200)
			var_0_8(arg_4_0, arg_4_1, false, 200)

			return arg_4_0.progressDisplayFinished
		end
	},
	[AAR.ParadeState.XP] = {
		EnterConditionFunction = function(arg_5_0, arg_5_1)
			DebugPrint("$$$ XP state")

			return arg_5_0.earnedTotalXP > 0 or arg_5_0.earnedSeasonXP > 0
		end,
		ExitFunction = function(arg_6_0, arg_6_1)
			local var_6_0

			if arg_6_0.isElder then
				var_6_0 = arg_6_0.currentXP == arg_6_0.finalSeasonXP
			else
				var_6_0 = arg_6_0.currentXP == arg_6_0.finalXP
			end

			if arg_6_0.forceQuit or var_6_0 or arg_6_0.xpDisplayFinished then
				var_0_7(arg_6_0, arg_6_1, false, 200)
				var_0_8(arg_6_0, arg_6_1, false, 200)

				return true
			end

			return false
		end
	},
	[AAR.ParadeState.BATTLE_PASS_XP] = {
		EnterConditionFunction = function(arg_7_0, arg_7_1)
			DebugPrint("$$$ Battle Pass state")

			return CONDITIONS.IsBattlePassEnabled() and arg_7_0.currentTierXP > arg_7_0.startTierXP
		end,
		ExitFunction = function(arg_8_0, arg_8_1)
			return arg_8_0.battlePassXPFinished
		end
	},
	[AAR.ParadeState.WEAPON_UNLOCKS] = {
		EnterConditionFunction = function(arg_9_0, arg_9_1)
			DebugPrint("$$$ Weapon lock")

			return #arg_9_0.weaponUnlocks > 0
		end,
		ExitFunction = function(arg_10_0, arg_10_1)
			return arg_10_0.weaponUnlocksDisplayFinished
		end
	},
	[AAR.ParadeState.WEAPON_CAMO_UNLOCKS] = {
		EnterConditionFunction = function(arg_11_0, arg_11_1)
			DebugPrint("$$$ Weapon camo lock")

			return #arg_11_0.camoUnlocks > 0
		end,
		ExitFunction = function(arg_12_0, arg_12_1)
			return arg_12_0.camoUnlocksDisplayFinished
		end
	},
	[AAR.ParadeState.KEY_REWARD] = {
		EnterConditionFunction = function(arg_13_0, arg_13_1)
			return CONDITIONS.AreKeysEnabled() and arg_13_0.gainedKeysCurrency >= AAR.KEY_UNIT_CURRENCY
		end,
		ExitFunction = function(arg_14_0, arg_14_1)
			return arg_14_0.keyRewardDisplayFinished
		end
	},
	[AAR.ParadeState.COMMENDATIONS] = {
		EnterConditionFunction = function(arg_15_0, arg_15_1)
			return AAR.IsCommendtionEnabled() and arg_15_0.accoladesPackage and #arg_15_0.accoladesPackage > 0 and not CONDITIONS.IsTrialGameType()
		end,
		ExitFunction = function(arg_16_0, arg_16_1)
			return arg_16_0.commendationFinished
		end
	}
}

local function var_0_9(arg_17_0, arg_17_1)
	DebugPrint("$$$ Update AAR Parade State")

	local var_17_0 = ParadeStateFlowTable[arg_17_0._currentStateIndex]

	if var_17_0.ExitFunction(arg_17_0, arg_17_1) then
		local var_17_1

		while var_17_1 == nil or not var_17_1.EnterConditionFunction(arg_17_0, arg_17_1) do
			arg_17_0._currentStateIndex = arg_17_0._currentStateIndex + 1

			if arg_17_0._currentStateIndex > #ParadeStateFlowTable then
				DebugPrint("$$$ Exit AAR parade now")
				ParadeStateFlowTable.ExitFunction(arg_17_0, arg_17_1)

				return
			else
				var_17_1 = ParadeStateFlowTable[arg_17_0._currentStateIndex]
			end
		end

		arg_17_0:Wait(var_0_1).onComplete = function()
			var_17_1.DisplayFunction(arg_17_0, arg_17_1)
		end
	else
		var_17_0.DisplayFunction(arg_17_0, arg_17_1)
	end
end

local function var_0_10(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	if arg_19_0.elderProgressBarProgress == nil then
		arg_19_0.elderProgressBarProgress = 0
	end

	arg_19_2 = LUI.clamp(arg_19_2, 0, 1)

	local var_19_0 = (arg_19_2 - arg_19_0.elderProgressBarProgress) * 1000

	if arg_19_5 then
		var_19_0 = 0
	end

	arg_19_0.ElderProgressBar:SetProgress(arg_19_2, var_19_0, arg_19_3, arg_19_4)

	arg_19_0.elderProgressBarProgress = arg_19_2

	if var_19_0 > 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressCircle)

		arg_19_0:Wait(var_19_0).onComplete = function()
			Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressCircleStop)
		end
	end

	return var_19_0
end

local function var_0_11(arg_21_0, arg_21_1, arg_21_2)
	assert(arg_21_0.XPType)

	local var_21_0 = _1080p * 80

	arg_21_0.XPType:setText(arg_21_1)
	arg_21_0.XPType:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)

	if arg_21_2 then
		arg_21_0.XPType:SetRGBFromTable(COLORS.red, 0)
	end
end

local function var_0_12(arg_22_0, arg_22_1)
	var_0_8(arg_22_0, arg_22_1, false, 100)
	var_0_7(arg_22_0, arg_22_1, false, 100)

	arg_22_0.isUsingElderProgressBar = true

	arg_22_0.AARRankUpContainer:SetAlpha(1)
	arg_22_0.XPValue:SetAlpha(0, 100)
	arg_22_0.EarnRateBuff:SetAlpha(0, 100)
	arg_22_0.XPType:SetAlpha(0)
	arg_22_0.XPType:SetAlpha(1, 100)
	var_0_11(arg_22_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/RANK_UP")))
	arg_22_0.AARRankUpContainer:PlayAARElderRankIntroSequence(arg_22_1, rankUpPackage)
end

local function var_0_13(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {
		rankDisplay = PROGRESSION.GetRankDisplay(arg_23_0.currentRank + 1),
		rankIcon = PROGRESSION.GetRankBigIcon(arg_23_0.currentRank + 1)
	}

	arg_23_0.currentRank = arg_23_0.currentRank + 1
	arg_23_0.earnedTypeXP = arg_23_0.earnedTypeXP - arg_23_2

	if arg_23_0.isUsingElderProgressBar then
		var_0_10(arg_23_0, arg_23_1, 0, nil, true, false)
		var_0_8(arg_23_0, arg_23_1, false, 100)
	else
		arg_23_0.AARProgressBar:InitProgressBar(arg_23_1, 0)
	end

	arg_23_0.AARRankUpContainer:SetAlpha(1)

	local var_23_1 = AAR.GetRankupUnlockPackage(arg_23_1, arg_23_0.currentRank)

	arg_23_0.AARRankUpContainer:SetupAARUnlocksData(arg_23_1, var_23_1)
	arg_23_0.XPValue:SetAlpha(0, 100)
	arg_23_0.EarnRateBuff:SetAlpha(0, 100)
	arg_23_0.XPType:SetAlpha(0)
	arg_23_0.XPType:SetAlpha(1, 100)

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_23_0) then
		arg_23_0.AARIGRXPBonusTip:SetAlpha(0, 100)
	end

	var_0_11(arg_23_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/RANK_UP")))
	ACTIONS.AnimateSequence(arg_23_0, "RankUp")

	if #var_23_1 > 0 then
		arg_23_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/UNLOCKS")))
	else
		arg_23_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESS")))
	end

	arg_23_0.AARRankUpContainer:PlayAARRankUpSequence(arg_23_1, var_23_0, true)
end

local function var_0_14(arg_24_0, arg_24_1)
	local var_24_0 = {
		rankDisplay = PROGRESSION.GetRankDisplay(arg_24_0.currentRank),
		rankIcon = PROGRESSION.GetRankBigIcon(arg_24_0.currentRank)
	}
	local var_24_1 = arg_24_0.currentRank
	local var_24_2 = arg_24_0.currentRank + 1

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_24_0) then
		arg_24_0.AARIGRXPBonusTip:SetAlpha(0, 0)
	end

	if arg_24_0.isRankXPMax then
		var_0_11(arg_24_0, ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK")))
	end

	if arg_24_0.isElder then
		arg_24_0.AARRankUpContainer:SetAlpha(1, 300)
		arg_24_0.AARRankUpContainer.RankUpItem.RankIcon:SetAlpha(0)
		arg_24_0.AARRankUpContainer.RankUpItem.RankValue:SetAlpha(1, 300)
		arg_24_0.AARRankUpContainer.RankUpItem.RankValue:setText(var_24_0.rankDisplay)
		var_0_8(arg_24_0, arg_24_1, true, 100)
	else
		arg_24_0.ElderRankIcon:SetAlpha(0)
		arg_24_0.AARRankUpContainer:SetAlpha(1, 300)
		arg_24_0.AARRankUpContainer:PlayAARRankUpSequence(arg_24_1, var_24_0, false)
		arg_24_0.AARProgressBar:InitProgressBarRank(arg_24_1, var_24_1, var_24_2)
	end

	arg_24_0.ProgressText:setText("")

	arg_24_0:Wait(var_0_4).onComplete = function()
		arg_24_0.progressDisplayFinished = true

		var_0_9(arg_24_0, arg_24_1)
	end
end

local function var_0_15(arg_26_0, arg_26_1)
	if arg_26_0.currentXP >= PROGRESSION.GetPlayerLifeTimeMaxXP() then
		var_0_11(arg_26_0, ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK")))
		var_0_10(arg_26_0, arg_26_1, 1, nil, true)

		local var_26_0 = PROGRESSION.GetRankDisplay(arg_26_0.currentRank)

		arg_26_0.AARRankUpContainer:SetAlpha(1, 300)
		arg_26_0.AARRankUpContainer.RankUpItem.RankIcon:SetAlpha(0)
		arg_26_0.AARRankUpContainer.RankUpItem.RankValue:SetAlpha(1, 300)
		arg_26_0.AARRankUpContainer.RankUpItem.RankValue:setText(var_26_0)

		local var_26_1 = var_0_3

		arg_26_0:Wait(var_26_1).onComplete = function()
			arg_26_0.progressDisplayFinished = true
			arg_26_0.forceQuit = true

			arg_26_0.SpecialLabel:SetAlpha(0, 100)
			var_0_9(arg_26_0, arg_26_1)
		end

		return true
	end

	return false
end

local function var_0_16(arg_28_0, arg_28_1)
	arg_28_0._currentWeaponIndex = arg_28_0._currentWeaponIndex + 1

	if arg_28_0._currentWeaponIndex <= #arg_28_0.weaponUnlocks then
		local var_28_0 = arg_28_0.weaponUnlocks[arg_28_0._currentWeaponIndex].weaponRef
		local var_28_1 = LOOT.GetItemProgressionImage(LOOT.itemTypes.WEAPON, var_28_0)
		local var_28_2 = WEAPON.GetName(var_28_0)

		arg_28_0.WeaponIcon:setImage(RegisterMaterial(var_28_1))

		local var_28_3 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, var_28_0)
		local var_28_4 = LOOT.IsUnlockedWithID(arg_28_1, var_28_3)
		local var_28_5 = PROGRESSION.GetUnlockRank(var_28_3)
		local var_28_6 = PROGRESSION.GetRankDisplay(var_28_5)

		if var_28_4 ~= nil then
			if not var_28_4 then
				arg_28_0.MessageLabel:SetAlpha(1)

				local var_28_7 = WEAPON.GetChallengeUnlockRow(var_28_3)

				if var_28_7 and var_28_7 >= 0 then
					arg_28_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/ATTACHMENT_UNLOCK_INFO_CHALLENGE", var_28_2))
				else
					arg_28_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/ATTACHMENT_UNLOCK_INFO", var_28_2, var_28_6))
				end
			else
				arg_28_0.MessageLabel:SetAlpha(0)
			end
		else
			arg_28_0.MessageLabel:SetAlpha(0)
		end

		var_0_11(arg_28_0, ToUpperCase(var_28_2))

		local var_28_8 = arg_28_0.weaponUnlocks[arg_28_0._currentWeaponIndex].attachmentsData

		table.sort(var_28_8, function(arg_29_0, arg_29_1)
			return arg_29_0.unlockWeaponLevel < arg_29_1.unlockWeaponLevel
		end)

		arg_28_0._currentUnlockCount = math.min(#var_28_8, #arg_28_0._newAttachmentWidgets)

		for iter_28_0 = 1, arg_28_0._currentUnlockCount do
			local var_28_9 = arg_28_0._newAttachmentWidgets[iter_28_0]
			local var_28_10 = var_28_8[iter_28_0]

			if not var_28_10 then
				break
			end

			local var_28_11 = ATTACHMENT.GetCategoryByLootID(var_28_10.lootID, var_28_0)
			local var_28_12 = ATTACHMENT.GetAttachmentCategoryName(var_28_11)

			var_28_9:SetupAttachmentInfo(var_28_10.icon, var_28_10.name, Engine.CBBHFCGDIC(var_28_12), Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_28_10.unlockWeaponLevel))
		end

		arg_28_0.Cinematic:SetAlpha(0.75)
		Engine.DFCGFCGBFD("mp_aar_weaponUnlock_0" .. (arg_28_0._currentWeaponIndex % 2 == 0 and "1" or "2"))
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.attachmentUnlock)
		ACTIONS.AnimateSequence(arg_28_0, "UnlocksFadeIn" .. arg_28_0._currentUnlockCount)

		if arg_28_0._isWeaponDoubleXP then
			ACTIONS.AnimateSequence(arg_28_0, "FlashWeaponDoubleXPIcon")
		end

		arg_28_0:Wait(var_0_3, true).onComplete = function()
			Engine.EBCGADABJ()
			arg_28_0:DisplayAARParadeUnlocksInTurn(arg_28_1)
		end
	else
		ACTIONS.AnimateSequence(arg_28_0, "UnlocksFadeOut" .. arg_28_0._currentUnlockCount)

		arg_28_0:Wait(var_0_1, true).onComplete = function()
			if arg_28_0._isWeaponDoubleXP then
				ACTIONS.AnimateSequence(arg_28_0, "XPIconFadeout")
			end

			arg_28_0.weaponUnlocksDisplayFinished = true

			arg_28_0.AARRankUpContainer.Cinematic:SetAlpha(0)
			arg_28_0.Cinematic:SetAlpha(0)
			Engine.EBCGADABJ()
			var_0_9(arg_28_0, arg_28_1)
		end
	end
end

local function var_0_17(arg_32_0, arg_32_1)
	if arg_32_0.isUsingElderProgressBar then
		var_0_8(arg_32_0, arg_32_1, false)
	else
		var_0_7(arg_32_0, arg_32_1, false)
	end

	arg_32_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/WEAPON_UNLOCKS")))

	arg_32_0._currentWeaponIndex = 0

	var_0_16(arg_32_0, arg_32_1)
end

local function var_0_18(arg_33_0, arg_33_1)
	arg_33_0._currentCamoIndex = arg_33_0._currentCamoIndex + 1

	if arg_33_0._currentCamoIndex <= #arg_33_0.camoUnlocks then
		local var_33_0 = arg_33_0.camoUnlocks[arg_33_0._currentCamoIndex].weaponRef
		local var_33_1 = LOOT.GetItemProgressionImage(LOOT.itemTypes.WEAPON, var_33_0)
		local var_33_2 = WEAPON.GetName(var_33_0)

		arg_33_0.WeaponIcon:setImage(RegisterMaterial(var_33_1))
		var_0_11(arg_33_0, ToUpperCase(var_33_2))

		local var_33_3 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, var_33_0)
		local var_33_4 = LOOT.IsUnlockedWithID(arg_33_1, var_33_3)
		local var_33_5 = PROGRESSION.GetUnlockRank(var_33_3)
		local var_33_6 = PROGRESSION.GetRankDisplay(var_33_5)

		if var_33_4 ~= nil then
			if not var_33_4 then
				arg_33_0.MessageLabel:SetAlpha(1)

				local var_33_7 = WEAPON.GetChallengeUnlockRow(var_33_3)

				if var_33_7 and var_33_7 >= 0 then
					arg_33_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/CAMO_UNLOCK_INFO_CHALLENGE", var_33_2))
				else
					arg_33_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/CAMO_UNLOCK_INFO", var_33_2, var_33_6))
				end
			else
				arg_33_0.MessageLabel:SetAlpha(0)
			end
		else
			arg_33_0.MessageLabel:SetAlpha(0)
		end

		local var_33_8 = arg_33_0.camoUnlocks[arg_33_0._currentCamoIndex].camoData

		arg_33_0._currentUnlockCount = math.min(#var_33_8, #arg_33_0._newAttachmentWidgets)

		for iter_33_0 = 1, arg_33_0._currentUnlockCount do
			local var_33_9 = arg_33_0._newAttachmentWidgets[iter_33_0]
			local var_33_10 = var_33_8[iter_33_0]

			if not var_33_10 then
				break
			end

			var_33_9:SetupAttachmentCamoInfo(var_33_10.icon, var_33_10.name)
		end

		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.camoUnlock)
		ACTIONS.AnimateSequence(arg_33_0, "UnlocksFadeIn" .. arg_33_0._currentUnlockCount)

		if arg_33_0._isWeaponDoubleXP then
			ACTIONS.AnimateSequence(arg_33_0, "FlashWeaponDoubleXPIcon")
		end

		arg_33_0:Wait(var_0_3, true).onComplete = function()
			arg_33_0:DisplayAARParadeCamoUnlocksInTurn(arg_33_1)
		end
	else
		ACTIONS.AnimateSequence(arg_33_0, "UnlocksFadeOut" .. arg_33_0._currentUnlockCount)

		if arg_33_0._isWeaponDoubleXP then
			ACTIONS.AnimateSequence(arg_33_0, "XPIconFadeout")
		end

		arg_33_0:Wait(var_0_1, true).onComplete = function()
			arg_33_0.camoUnlocksDisplayFinished = true

			arg_33_0.AARRankUpContainer.Cinematic:SetAlpha(0)
			Engine.EBCGADABJ()
			var_0_9(arg_33_0, arg_33_1)
		end
	end
end

local function var_0_19(arg_36_0, arg_36_1)
	if arg_36_0.isUsingElderProgressBar then
		var_0_8(arg_36_0, arg_36_1, false)
	else
		var_0_7(arg_36_0, arg_36_1, false)
	end

	arg_36_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/CAMO_UNLOCK")))

	arg_36_0._currentCamoIndex = 0

	var_0_18(arg_36_0, arg_36_1)
end

local function var_0_20(arg_37_0)
	if not selfkeyRewardDisplayFinished then
		if not arg_37_0._keyRewardSoundID or not Engine.CHFEJIG(arg_37_0._keyRewardSoundID) then
			arg_37_0._keyRewardSoundID = Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.keysCounterTick)
		end

		arg_37_0:Wait(20).onComplete = function()
			arg_37_0:KeyRewardStateUpdate()
		end
	elseif arg_37_0._keyRewardSoundID and Engine.CHFEJIG(arg_37_0._keyRewardSoundID) then
		Engine.EAGBECEBGA(arg_37_0._keyRewardSoundID)
	end
end

local function var_0_21(arg_39_0, arg_39_1)
	if arg_39_0.isUsingElderProgressBar then
		var_0_8(arg_39_0, arg_39_1, false)
	else
		var_0_7(arg_39_0, arg_39_1, false)
	end

	local var_39_0 = arg_39_0.gainedKeysCurrency / AAR.KEY_UNIT_CURRENCY
	local var_39_1 = string.format("%d", var_39_0)

	arg_39_0.KeyRewardValue:setText(Engine.CBBHFCGDIC("MENU/PLUS", var_39_1))
	var_0_11(arg_39_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/KEYS_AWARDED")))
	ACTIONS.AnimateSequence(arg_39_0, "KeyReward")
	arg_39_0:KeyRewardStateUpdate()

	arg_39_0:Wait(1000).onComplete = function()
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.keysBanked)

		arg_39_0.keyRewardDisplayFinished = true

		var_0_9(arg_39_0, arg_39_1)
	end
end

local function var_0_22(arg_41_0, arg_41_1)
	var_0_11(arg_41_0, "")
	arg_41_0.MessageLabel:SetAlpha(0)

	if arg_41_0.isUsingElderProgressBar then
		var_0_8(arg_41_0, arg_41_1, false)
	else
		var_0_7(arg_41_0, arg_41_1, false)
	end

	arg_41_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/TOP_COMMENDATIONS")))
	arg_41_0.AARParadeCommendations:SetupCommendations(arg_41_0.accoladesPackage)
	arg_41_0.AARParadeCommendations:SetAlpha(1, 100)

	arg_41_0:Wait(var_0_5).onComplete = function()
		arg_41_0.AARParadeCommendations:SetAlpha(0, 100)

		arg_41_0.commendationFinished = true

		var_0_9(arg_41_0, arg_41_1)
	end
end

local function var_0_23(arg_43_0, arg_43_1)
	var_0_11(arg_43_0, "")

	if arg_43_0.isUsingElderProgressBar then
		var_0_8(arg_43_0, arg_43_1, false, 0)
	else
		var_0_7(arg_43_0, arg_43_1, false, 0)
	end

	local var_43_0 = {
		displayBattlePassInAAR = true,
		battlePassData = {
			startTierXP = arg_43_0.startTierXP,
			currentTierXP = arg_43_0.currentTierXP,
			battlepassTimeXP = arg_43_0.battlepassTimeXP,
			battlepassChallengeXP = arg_43_0.battlepassChallengeXP,
			startTier = BATTLEPASS.GetTierByXP(arg_43_1, arg_43_0.startTierXP),
			currentTier = BATTLEPASS.GetTierByXP(arg_43_1, arg_43_0.currentTierXP),
			isDoubleXPActive = LOOT.IsDoubleBattlePassXPActive()
		}
	}

	LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_43_1, true, var_43_0, true)
end

local function var_0_24(arg_44_0, arg_44_1)
	arg_44_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESS")))

	local var_44_0 = arg_44_0.currentRank == PROGRESSION.GetPlayerLifeTimeMaxRank()
	local var_44_1 = PROGRESSION.GetRankMinXP(arg_44_0.currentRank)
	local var_44_2 = PROGRESSION.GetRankMaxXP(arg_44_0.currentRank)
	local var_44_3 = arg_44_0.earnedTypeXP
	local var_44_4
	local var_44_5 = arg_44_0.currentXP + var_44_3
	local var_44_6 = var_44_2 <= var_44_5

	if var_44_6 then
		var_44_4 = arg_44_0.currentRank == PROGRESSION.GetMaxRank()
		var_44_3 = var_44_2 - arg_44_0.currentXP
		var_44_5 = var_44_2
	end

	if var_44_4 then
		var_44_5 = arg_44_0.finalXP
	elseif arg_44_0.isElder and arg_44_0.isUsingElderProgressBar then
		if var_44_5 > arg_44_0.finalSeasonXP then
			var_44_3 = arg_44_0.finalSeasonXP - arg_44_0.currentXP
			var_44_5 = arg_44_0.finalSeasonXP
		end
	elseif var_44_5 > arg_44_0.finalXP then
		var_44_3 = arg_44_0.finalXP - arg_44_0.currentXP
		var_44_5 = arg_44_0.finalXP
	end

	local var_44_7 = (var_44_5 - var_44_1) / (var_44_2 - var_44_1)
	local var_44_8 = arg_44_0.matchInfoPackage[arg_44_0.currentDisplayType].value
	local var_44_9 = "------------- AAR Parade Progress Bar Fill Data Info:" .. " \n currentXP " .. tostring(arg_44_0.currentXP) .. " \n earnedTypeXP " .. tostring(var_44_3) .. " \n finalSeasonXP " .. tostring(arg_44_0.finalSeasonXP) .. " \n rankXPPercentage " .. tostring(var_44_7) .. " \n finalXP " .. tostring(arg_44_0.finalXP) .. " \n nextXP " .. tostring(var_44_5) .. " \n rankMinXP " .. tostring(var_44_1) .. " \n rankMaxXP " .. tostring(var_44_2)

	DebugPrint(var_44_9)

	if var_0_15(arg_44_0, arg_44_1) then
		return
	end

	local var_44_10 = arg_44_0.currentRank
	local var_44_11 = arg_44_0.currentRank + 1
	local var_44_12 = {
		type = arg_44_0.currentDisplayType,
		fillRate = var_44_7,
		earnedXP = var_44_8,
		curRank = var_44_10,
		nextRank = var_44_11,
		hideIndicator = var_44_6
	}
	local var_44_13 = 1

	if arg_44_0.isUsingElderProgressBar then
		local var_44_14 = PROGRESSION.GetRankDisplay(arg_44_0.currentRank)
		local var_44_15 = PROGRESSION.GetRankBigIcon(arg_44_0.currentRank)
		local var_44_16 = PROGRESSION.GetRankName(arg_44_0.currentRank)

		arg_44_0.ElderRankName:setText(var_44_16)
		arg_44_0.ElderRankValue:setText(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_44_14))

		if var_44_15 and #var_44_15 > 0 then
			arg_44_0.ElderRankIcon:setImage(RegisterMaterial(var_44_15))
		end

		var_0_8(arg_44_0, arg_44_1, true, 100)

		var_44_13 = var_0_10(arg_44_0, arg_44_1, var_44_7, nil, true)
	else
		var_44_13 = arg_44_0.AARProgressBar:UpdateFill(arg_44_1, var_44_12)
	end

	if var_44_3 > 0 then
		arg_44_0.XPValue:SetAlpha(1, 100)
		arg_44_0.EarnRateBuff:SetAlpha(1, 100)
		arg_44_0.XPValue:setText(0)
		arg_44_0.XPValue:setupTextValueIntTween(0, var_44_3, var_44_13, LUI.EASING.inOutSine, Engine.CBBHFCGDIC("AAR/PLUS_XP"))
		ACTIONS.AnimateSequence(arg_44_0, "FlashXPHighlight")

		if CONDITIONS.IsInKoreanIGRPaidSession(arg_44_0) then
			arg_44_0.AARIGRXPBonusTip:SetAlpha(1, 100)
		end

		if arg_44_0._displayDoubleXP then
			if FRIENDS.IsHappyHourActive(arg_44_1) then
				arg_44_0.XPIcon:setImage(RegisterMaterial("icon_regiments_happyhour"))
				arg_44_0.XPIconShadow:setImage(RegisterMaterial("aar_happyhour_pixels"))
			elseif arg_44_0._isDoubleXP then
				arg_44_0.XPIcon:setImage(RegisterMaterial("icon_double_xp"))
				arg_44_0.XPIconShadow:setImage(RegisterMaterial("aar_doubleXP_pixels"))
			end

			if arg_44_0.isUsingElderProgressBar then
				ACTIONS.AnimateSequence(arg_44_0, "FlashDoubleXPIconElder")
			else
				ACTIONS.AnimateSequence(arg_44_0, "FlashDoubleXPIcon")
			end
		end
	end

	local var_44_17 = var_44_13 + var_0_1

	if var_44_3 == 0 then
		var_44_17 = 1
	else
		var_0_11(arg_44_0, ToUpperCase(arg_44_0.matchInfoPackage[arg_44_0.currentDisplayType].name), arg_44_0.matchInfoPackage[arg_44_0.currentDisplayType].isAntiAddiction)
	end

	arg_44_0:Wait(var_44_17).onComplete = function()
		arg_44_0.XPIcon:SetAlpha(0, 100)

		arg_44_0.currentXP = arg_44_0.currentXP + var_44_3

		if var_44_6 then
			if var_44_4 then
				arg_44_0._elderRankIntroSavedData = {
					earnedTypeXP = var_44_3
				}
				arg_44_0.currentXP = 0

				var_0_12(arg_44_0, arg_44_1)
			elseif not var_44_0 then
				var_0_13(arg_44_0, arg_44_1, var_44_3)
			else
				var_0_9(arg_44_0, arg_44_1)
			end
		else
			if arg_44_0.currentDisplayType < AAR.MAX_XP_TYPE_DISPLAY_NUM then
				arg_44_0.currentDisplayType = arg_44_0.currentDisplayType + 1
				arg_44_0.earnedTypeXP = arg_44_0.matchInfoPackage[arg_44_0.currentDisplayType].value

				if arg_44_0.currentDisplayType == AAR.ProgressTypes.MATCH_XP_DOUBLE then
					arg_44_0._displayDoubleXP = true
				else
					arg_44_0._displayDoubleXP = false
				end
			else
				arg_44_0.xpDisplayFinished = true
			end

			var_0_9(arg_44_0, arg_44_1)
		end
	end
end

local function var_0_25(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0.matchDataPackage
	local var_46_1 = ToUpperCase(Engine.CBBHFCGDIC("AAR/MATCH_XP"))
	local var_46_2 = ToUpperCase(Engine.CBBHFCGDIC("AAR/DOUBLE_MATCH_XP"))
	local var_46_3 = ToUpperCase(Engine.CBBHFCGDIC("AAR/CONTRACT_BONUS"))
	local var_46_4 = ToUpperCase(Engine.CBBHFCGDIC("AAR/PLUNDER_BONUS"))
	local var_46_5 = ToUpperCase(Engine.CBBHFCGDIC("AAR/CHALLENGE_BONUS"))
	local var_46_6 = ToUpperCase(Engine.CBBHFCGDIC("AAR/MISSION_BONUS"))
	local var_46_7 = false

	if Engine.ECAJCAJJGF() then
		local var_46_8 = Engine.DFAJCBFIAB()

		if var_46_8 == var_0_6.eHalf or var_46_8 == var_0_6.eZero then
			var_46_7 = true
			var_46_1 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_MATCH_XP_" .. tostring(var_46_8)))
			var_46_2 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_DOUBLE_MATCH_XP_" .. tostring(var_46_8)))
			var_46_3 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_CONTRACT_BONUS_" .. tostring(var_46_8)))
			var_46_4 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_PLUNDER_BONUS_" .. tostring(var_46_8)))
			var_46_5 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_CHALLENGE_BONUS_" .. tostring(var_46_8)))
			var_46_6 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_MISSION_BONUS_" .. tostring(var_46_8)))
		end
	end

	arg_46_0.matchInfoPackage = {
		[AAR.ProgressTypes.MATCH_XP] = {
			value = (arg_46_0._isDoubleXP or FRIENDS.IsHappyHourActive(arg_46_1)) and var_46_0.matchXP / 2 or var_46_0.matchXP,
			name = var_46_1,
			isAntiAddiction = var_46_7
		},
		[AAR.ProgressTypes.MATCH_XP_DOUBLE] = {
			value = (arg_46_0._isDoubleXP or FRIENDS.IsHappyHourActive(arg_46_1)) and var_46_0.matchXP / 2 or 0,
			name = var_46_2,
			isAntiAddiction = var_46_7
		},
		[AAR.ProgressTypes.CONTRACT_BONUS] = {
			value = var_46_0.contractBonus,
			name = var_46_3,
			isAntiAddiction = var_46_7
		},
		[AAR.ProgressTypes.PLUNDER_BONUS] = {
			value = var_46_0.plunderBonus,
			name = var_46_4,
			isAntiAddiction = var_46_7
		},
		[AAR.ProgressTypes.CHALLENGE_BONUS] = {
			value = var_46_0.challengeBonus,
			name = var_46_5,
			isAntiAddiction = var_46_7
		},
		[AAR.ProgressTypes.MISSION_BONUS] = {
			value = var_46_0.missionXP,
			name = var_46_6,
			isAntiAddiction = var_46_7
		}
	}
	arg_46_0.gainedKeysCurrency = var_46_0.currentKeys - var_46_0.startKeys
	arg_46_0.preRank = var_46_0.preRank
	arg_46_0.finalRank = var_46_0.curRank
	arg_46_0.preSeasonRank = var_46_0.preSeasonRank
	arg_46_0.finalSeasonRank = var_46_0.curSeasonRank
	arg_46_0.earnedTotalXP = var_46_0.earnedXP
	arg_46_0.earnedSeasonXP = var_46_0.earnedSeasonXP
	arg_46_0.finalXP = var_46_0.currentXP
	arg_46_0.finalSeasonXP = var_46_0.currentSeasonXP
	arg_46_0.isElder = var_46_0.isElder
	arg_46_0.isElderFirstTime = var_46_0.isElderFirstTime
	arg_46_0.isGainingElderXP = var_46_0.isGainingElderXP
	arg_46_0.isRankXPMax = PROGRESSION.IsPlayerLifeTimeXPMax(arg_46_1)
	arg_46_0.startTierXP = var_46_0.startTierXP
	arg_46_0.currentTierXP = var_46_0.currentTierXP
	arg_46_0.battlepassTimeXP = var_46_0.battlepassTimeXP
	arg_46_0.battlepassChallengeXP = var_46_0.battlepassChallengeXP
	arg_46_0.isUsingElderProgressBar = false

	if arg_46_0.isElder and not arg_46_0.isElderFirstTime then
		arg_46_0.isUsingElderProgressBar = true
	end

	local var_46_9 = 0

	if arg_46_0.isGainingElderXP then
		local var_46_10 = PROGRESSION.GetRankMinXP(PROGRESSION.ElderRankToLifeTimeRank(arg_46_0.preSeasonRank))
		local var_46_11 = PROGRESSION.GetRankMaxXP(PROGRESSION.ElderRankToLifeTimeRank(arg_46_0.preSeasonRank))

		var_46_9 = (arg_46_0.finalSeasonXP - arg_46_0.earnedSeasonXP - var_46_10) / (var_46_11 - var_46_10)
		arg_46_0.currentRank = PROGRESSION.ElderRankToLifeTimeRank(arg_46_0.preSeasonRank)
		arg_46_0.currentXP = arg_46_0.finalSeasonXP - arg_46_0.earnedSeasonXP
	else
		local var_46_12 = PROGRESSION.GetRankMinXP(arg_46_0.preRank)
		local var_46_13 = PROGRESSION.GetRankMaxXP(arg_46_0.preRank)

		var_46_9 = (arg_46_0.finalXP - arg_46_0.earnedTotalXP - var_46_12) / (var_46_13 - var_46_12)
		arg_46_0.currentRank = arg_46_0.preRank
		arg_46_0.currentXP = arg_46_0.finalXP - arg_46_0.earnedTotalXP
	end

	if not arg_46_0._isFromBattlepassAAR then
		if arg_46_0.isUsingElderProgressBar then
			var_0_10(arg_46_0, arg_46_1, var_46_9, nil, true, true)
			ACTIONS.AnimateSequence(arg_46_0, "DisplayElderRank")

			local var_46_14 = PROGRESSION.GetRankDisplay(arg_46_0.currentRank)
			local var_46_15 = PROGRESSION.GetRankBigIcon(arg_46_0.currentRank)
			local var_46_16 = PROGRESSION.GetRankName(arg_46_0.currentRank)

			arg_46_0.ElderRankName:setText(var_46_16)
			arg_46_0.ElderRankValue:setText(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_46_14))

			if var_46_15 and #var_46_15 > 0 then
				arg_46_0.ElderRankIcon:setImage(RegisterMaterial(var_46_15))
			end
		else
			arg_46_0.AARProgressBar:InitProgressBar(arg_46_1, var_46_9)
			ACTIONS.AnimateSequence(arg_46_0, "DisplayRegularRank")

			local var_46_17 = arg_46_0.currentRank + 1

			arg_46_0.AARProgressBar:InitProgressBarRank(arg_46_1, arg_46_0.currentRank, var_46_17)
		end
	end

	arg_46_0.AARRankUpContainer:SetAlpha(0)

	arg_46_0.currentDisplayType = AAR.ProgressTypes.MATCH_XP
	arg_46_0.earnedTypeXP = arg_46_0.matchInfoPackage[arg_46_0.currentDisplayType].value
	arg_46_0.startCommonCrate = var_46_0.startCommonCrate
	arg_46_0.currentCommonCrate = var_46_0.currentCommonCrate

	local var_46_18 = arg_46_0._isFromBattlepassAAR and 100 or var_0_0

	arg_46_0:Wait(var_46_18).onComplete = function()
		arg_46_0._currentStateIndex = 1

		if arg_46_0._isFromBattlepassAAR then
			var_0_7(arg_46_0, arg_46_1, false, 0)
			var_0_8(arg_46_0, arg_46_1, false, 0)

			arg_46_0._currentStateIndex = AAR.ParadeState.WEAPON_UNLOCKS
		end

		local var_47_0 = ParadeStateFlowTable[arg_46_0._currentStateIndex]

		while not var_47_0.EnterConditionFunction(arg_46_0, arg_46_1) do
			arg_46_0._currentStateIndex = arg_46_0._currentStateIndex + 1

			if arg_46_0._currentStateIndex > #ParadeStateFlowTable then
				ParadeStateFlowTable.ExitFunction(arg_46_0, arg_46_1)

				return
			else
				var_47_0 = ParadeStateFlowTable[arg_46_0._currentStateIndex]
			end
		end

		arg_46_0.SpecialLabel:SetDecodeParams(0, 0, 0)
		var_47_0.DisplayFunction(arg_46_0, arg_46_1)
	end
end

local function var_0_26(arg_48_0, arg_48_1)
	ACTIONS.AnimateSequence(arg_48_0, "Outro")
	AAR.CheckAndShowBattlePassPurchasePopup(arg_48_1)

	arg_48_0:Wait(var_0_1).onComplete = function()
		arg_48_0:dispatchEventToCurrentMenu({
			name = AAR.PARADE_DONE
		})
		ACTIONS.AdvancePostGame(arg_48_0)
	end
end

function PostLoadFunc(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_0:getFirstChild()

	while var_50_0 do
		var_50_0 = var_50_0:getNextSibling(), var_50_0:SetIgnoreTweenLateness(false)
	end

	arg_50_0._newAttachmentWidgets = {
		arg_50_0.NewAttachment1,
		arg_50_0.NewAttachment2,
		arg_50_0.NewAttachment3
	}
	arg_50_0._isDoubleXP = LOOT.IsDoubleXPActiveByType(arg_50_1, LOOT.doubleXPType.ANY)
	arg_50_0._isWeaponDoubleXP = LOOT.IsDoubleWeaponXPActiveByType(arg_50_1, LOOT.doubleXPType.ANY)
	arg_50_0._isFromBattlepassAAR = arg_50_2.fromBattlepassAAR
	arg_50_0.weaponUnlocks = arg_50_2.gunsmithDataPackage
	arg_50_0.camoUnlocks = AAR.GetGunsmithCamoUnlockPackage(arg_50_1, arg_50_2.matchDataPackage.unlocks)
	arg_50_0.matchDataPackage = arg_50_2.matchDataPackage
	arg_50_0.accoladesPackage = AAR.GetAccoladesPackage(arg_50_1)
	arg_50_0.KeyRewardStateUpdate = var_0_20
	arg_50_0.DisplayAARParadeUnlocksInTurn = var_0_16
	arg_50_0.DisplayAARParadeCamoUnlocksInTurn = var_0_18

	local var_50_1 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = false,
		controllerIndex = arg_50_1
	})

	arg_50_0:addElement(var_50_1)

	ParadeStateFlowTable[AAR.ParadeState.XP_NONE].DisplayFunction = var_0_14
	ParadeStateFlowTable[AAR.ParadeState.XP].DisplayFunction = var_0_24
	ParadeStateFlowTable[AAR.ParadeState.BATTLE_PASS_XP].DisplayFunction = var_0_23
	ParadeStateFlowTable[AAR.ParadeState.WEAPON_UNLOCKS].DisplayFunction = var_0_17
	ParadeStateFlowTable[AAR.ParadeState.WEAPON_CAMO_UNLOCKS].DisplayFunction = var_0_19
	ParadeStateFlowTable[AAR.ParadeState.KEY_REWARD].DisplayFunction = var_0_21
	ParadeStateFlowTable[AAR.ParadeState.COMMENDATIONS].DisplayFunction = var_0_22
	ParadeStateFlowTable.ExitFunction = var_0_26

	var_0_25(arg_50_0, arg_50_1)
	arg_50_0:registerEventHandler(AAR.PARADE_PROGRESS_DONE, function(arg_51_0, arg_51_1)
		var_0_9(arg_50_0, arg_50_1)
	end)
	arg_50_0:registerEventHandler(AAR.PARADE_BATTLE_PASS_DONE, function(arg_52_0, arg_52_1)
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressCircleStop)

		arg_50_0.battlePassXPFinished = true

		var_0_9(arg_50_0, arg_50_1)
	end)
	arg_50_0:registerEventHandler(AAR.PARADE_ELDER_RANK_INTRO_DONE, function(arg_53_0, arg_53_1)
		if PROGRESSION.IsGettingElderXP(arg_50_1) then
			ACTIONS.AnimateSequence(arg_53_0, "ElderRankLayout")
			var_0_13(arg_53_0, arg_50_1, arg_53_0._elderRankIntroSavedData.earnedTypeXP)
		else
			arg_53_0.xpDisplayFinished = true

			var_0_9(arg_53_0, arg_50_1)
		end
	end)

	local var_50_2 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
	local var_50_3 = PlayercardUtils.GetFrontendDataSources(var_50_2, arg_50_1)

	arg_50_0.SmallPlayerCard:SetDataSource(var_50_3, arg_50_1)
	arg_50_0.Mask:SetAlpha(1)
	arg_50_0.ElderProgressBar:SetMask(arg_50_0.Mask)
	ACTIONS.ScaleFullscreen(arg_50_0.Overlay)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_50_0, "AR")
	end
end

function AARParade(arg_54_0, arg_54_1)
	local var_54_0 = LUI.UIElement.new()

	var_54_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_54_0.id = "AARParade"
	var_54_0._animationSets = var_54_0._animationSets or {}
	var_54_0._sequences = var_54_0._sequences or {}

	local var_54_1 = arg_54_1 and arg_54_1.controllerIndex

	if not var_54_1 and not Engine.DDJFBBJAIG() then
		var_54_1 = var_54_0:getRootController()
	end

	assert(var_54_1)

	local var_54_2 = var_54_0
	local var_54_3
	local var_54_4 = MenuBuilder.BuildRegisteredType("BannerGradient", {
		controllerIndex = var_54_1
	})

	var_54_4.id = "XPHighlightBanner"

	var_54_4:SetAlpha(0, 0)
	var_54_4:SetPixelGridEnabled(true)
	var_54_4:SetPixelGridContrast(0.5, 0)
	var_54_4:SetPixelGridBlockWidth(2, 0)
	var_54_4:SetPixelGridBlockHeight(2, 0)
	var_54_4:SetPixelGridGutterWidth(1, 0)
	var_54_4:SetPixelGridGutterHeight(1, 0)
	var_54_4.BGAdd:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_54_4.BGMult:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_54_4.BGMult:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_54_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -900, _1080p * 904, _1080p * -16, _1080p * 56)
	var_54_0:addElement(var_54_4)

	var_54_0.XPHighlightBanner = var_54_4

	local var_54_5

	if CONDITIONS.IsInKoreanIGRPaidSession(var_54_0) then
		var_54_5 = MenuBuilder.BuildRegisteredType("AARIGRXPBonusTip", {
			controllerIndex = var_54_1
		})
		var_54_5.id = "AARIGRXPBonusTip"

		var_54_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1360, _1080p * 543, _1080p * 743)
		var_54_0:addElement(var_54_5)

		var_54_0.AARIGRXPBonusTip = var_54_5
	end

	local var_54_6
	local var_54_7 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_54_1
	})

	var_54_7.id = "EarnRateBuff"

	var_54_7:SetAlpha(0, 0)
	var_54_7.EarnRate:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_54_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 859, _1080p * 1059, _1080p * 855, _1080p * 887)
	var_54_0:addElement(var_54_7)

	var_54_0.EarnRateBuff = var_54_7

	local var_54_8
	local var_54_9 = LUI.UIStyledText.new()

	var_54_9.id = "XPValue"

	var_54_9:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_54_9:setText("", 0)
	var_54_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_54_9:SetWordWrap(false)
	var_54_9:SetAlignment(LUI.Alignment.Right)
	var_54_9:SetVerticalAlignment(LUI.Alignment.Center)
	var_54_9:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_54_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -280, _1080p * 120, _1080p * 524, _1080p * 594)
	var_54_0:addElement(var_54_9)

	var_54_0.XPValue = var_54_9

	local var_54_10
	local var_54_11 = MenuBuilder.BuildRegisteredType("AARProgressBar", {
		controllerIndex = var_54_1
	})

	var_54_11.id = "AARProgressBar"

	var_54_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -750, _1080p * 750, _1080p * -346, _1080p * -246)
	var_54_0:addElement(var_54_11)

	var_54_0.AARProgressBar = var_54_11

	local var_54_12
	local var_54_13 = MenuBuilder.BuildRegisteredType("AARRankUpContainer", {
		controllerIndex = var_54_1
	})

	var_54_13.id = "AARRankUpContainer"

	var_54_13:SetAlpha(0, 0)
	var_54_13:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_54_0:addElement(var_54_13)

	var_54_0.AARRankUpContainer = var_54_13

	local var_54_14
	local var_54_15 = LUI.UIStyledText.new()

	var_54_15.id = "XPType"

	var_54_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_54_15:setText("", 0)
	var_54_15:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_54_15:SetWordWrap(false)
	var_54_15:SetAlignment(LUI.Alignment.Center)
	var_54_15:SetDecodeLetterLength(20)
	var_54_15:SetDecodeMaxRandChars(6)
	var_54_15:SetDecodeUpdatesPerLetter(4)
	var_54_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 200, _1080p * 260)
	var_54_0:addElement(var_54_15)

	var_54_0.XPType = var_54_15

	local var_54_16
	local var_54_17 = LUI.UIStyledText.new()

	var_54_17.id = "SpecialLabel"

	var_54_17:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_54_17:SetAlpha(0, 0)
	var_54_17:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK"), 0)
	var_54_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_54_17:SetAlignment(LUI.Alignment.Center)
	var_54_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 342, _1080p * 1582, _1080p * 405, _1080p * 525)
	var_54_0:addElement(var_54_17)

	var_54_0.SpecialLabel = var_54_17

	local var_54_18
	local var_54_19 = LUI.UIText.new()

	var_54_19.id = "ElderRankValue"

	var_54_19:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_54_19:SetAlpha(0, 0)
	var_54_19:setText("", 0)
	var_54_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_54_19:SetWordWrap(false)
	var_54_19:SetAlignment(LUI.Alignment.Center)
	var_54_19:SetVerticalAlignment(LUI.Alignment.Center)
	var_54_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 782, _1080p * 1138, _1080p * 693, _1080p * 711)
	var_54_0:addElement(var_54_19)

	var_54_0.ElderRankValue = var_54_19

	local var_54_20
	local var_54_21 = LUI.UIText.new()

	var_54_21.id = "ElderRankName"

	var_54_21:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_54_21:SetAlpha(0, 0)
	var_54_21:setText(ToUpperCase(""), 0)
	var_54_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_54_21:SetWordWrap(false)
	var_54_21:SetAlignment(LUI.Alignment.Center)
	var_54_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 804, _1080p * 1116, _1080p * 669, _1080p * 693)
	var_54_0:addElement(var_54_21)

	var_54_0.ElderRankName = var_54_21

	local var_54_22
	local var_54_23 = LUI.UIImage.new()

	var_54_23.id = "ElderRankIcon"

	var_54_23:SetAlpha(0, 0)
	var_54_23:SetScale(-0.2, 0)
	var_54_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 833, _1080p * 1087, _1080p * 413, _1080p * 669)
	var_54_0:addElement(var_54_23)

	var_54_0.ElderRankIcon = var_54_23

	local var_54_24
	local var_54_25 = {
		Progress_segmentMaterial = "progress_circle_segment_big",
		controllerIndex = var_54_1
	}
	local var_54_26 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", var_54_25)

	var_54_26.id = "ElderProgressBar"

	var_54_26:SetAlpha(0, 0)
	var_54_26.Backer:setImage(RegisterMaterial("progress_circle_big"), 0)
	var_54_26.Progress:setImage(RegisterMaterial("progress_circle_segment_big"), 0)
	var_54_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1200, _1080p * 352, _1080p * 832)
	var_54_0:addElement(var_54_26)

	var_54_0.ElderProgressBar = var_54_26

	local var_54_27
	local var_54_28 = LUI.UIStyledText.new()

	var_54_28.id = "ProgressText"

	var_54_28:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_54_28:setText("", 0)
	var_54_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_54_28:SetWordWrap(false)
	var_54_28:SetAlignment(LUI.Alignment.Center)
	var_54_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 570, _1080p * 1354, _1080p * 130, _1080p * 200)
	var_54_0:addElement(var_54_28)

	var_54_0.ProgressText = var_54_28

	local var_54_29
	local var_54_30 = LUI.UIImage.new()

	var_54_30.id = "Mask"

	var_54_30:SetAlpha(0, 0)
	var_54_30:SetScale(0, 0)
	var_54_30:setImage(RegisterMaterial("minimap_circle_mask"), 0)
	var_54_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 719, _1080p * 1199, _1080p * 316, _1080p * 796)
	var_54_0:addElement(var_54_30)

	var_54_0.Mask = var_54_30

	local var_54_31
	local var_54_32 = LUI.UIImage.new()

	var_54_32.id = "Overlay"

	var_54_32:SetRGBFromInt(0, 0)
	var_54_32:SetAlpha(0, 0)
	var_54_0:addElement(var_54_32)

	var_54_0.Overlay = var_54_32

	local var_54_33
	local var_54_34 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
		controllerIndex = var_54_1
	})

	var_54_34.id = "SmallPlayerCard"

	var_54_34.GradientBacker:SetAlpha(0, 0)
	var_54_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 1222, _1080p * 855, _1080p * 979)
	var_54_0:addElement(var_54_34)

	var_54_0.SmallPlayerCard = var_54_34

	local var_54_35
	local var_54_36 = LUI.UIStyledText.new()

	var_54_36.id = "DoubleXPLabel"

	var_54_36:SetAlpha(0, 0)
	var_54_36:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DOUBLE_XP_ACTIVE"), 0)
	var_54_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_54_36:SetAlignment(LUI.Alignment.Left)
	var_54_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 782, _1080p * 1278, _1080p * 278, _1080p * 318)
	var_54_0:addElement(var_54_36)

	var_54_0.DoubleXPLabel = var_54_36

	local var_54_37
	local var_54_38 = LUI.UIStyledText.new()

	var_54_38.id = "KeyRewardValue"

	var_54_38:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_54_38:SetAlpha(0, 0)
	var_54_38:setText("", 0)
	var_54_38:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_54_38:SetAlignment(LUI.Alignment.Center)
	var_54_38:SetVerticalAlignment(LUI.Alignment.Center)
	var_54_38:SetShadowRGBFromTable(SWATCHES.AAR.Highlight, 0)
	var_54_38:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -201, _1080p * 199, _1080p * 562, _1080p * 632)
	var_54_0:addElement(var_54_38)

	var_54_0.KeyRewardValue = var_54_38

	local var_54_39
	local var_54_40 = LUI.UIImage.new()

	var_54_40.id = "KeyRewardIcon"

	var_54_40:SetAlpha(0, 0)
	var_54_40:setImage(RegisterMaterial("icon_currency_keypoints"), 0)
	var_54_40:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 306, _1080p * 562)
	var_54_0:addElement(var_54_40)

	var_54_0.KeyRewardIcon = var_54_40

	local var_54_41
	local var_54_42 = LUI.UIImage.new()

	var_54_42.id = "XPIconShadow"

	var_54_42:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_54_42:SetAlpha(0, 0)
	var_54_42:SetScale(1, 0)
	var_54_42:SetPixelGridEnabled(true)
	var_54_42:SetPixelGridContrast(0.5, 0)
	var_54_42:SetPixelGridBlockWidth(2, 0)
	var_54_42:SetPixelGridBlockHeight(2, 0)
	var_54_42:SetPixelGridGutterWidth(1, 0)
	var_54_42:SetPixelGridGutterHeight(1, 0)
	var_54_42:setImage(RegisterMaterial("aar_doubleXP_pixels"), 0)
	var_54_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 870, _1080p * 1054, _1080p * 342, _1080p * 526)
	var_54_0:addElement(var_54_42)

	var_54_0.XPIconShadow = var_54_42

	local var_54_43
	local var_54_44 = LUI.UIImage.new()

	var_54_44.id = "XPIcon"

	var_54_44:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_54_44:SetAlpha(0, 0)
	var_54_44:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_54_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 898, _1080p * 1026, _1080p * 370, _1080p * 498)
	var_54_0:addElement(var_54_44)

	var_54_0.XPIcon = var_54_44

	local var_54_45
	local var_54_46 = LUI.UIImage.new()

	var_54_46.id = "WeaponIcon"

	var_54_46:SetAlpha(0, 0)
	var_54_46:setImage(RegisterMaterial("icon_currency_keypoints"), 0)
	var_54_46:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 248, _1080p * 504)
	var_54_0:addElement(var_54_46)

	var_54_0.WeaponIcon = var_54_46

	local var_54_47
	local var_54_48 = MenuBuilder.BuildRegisteredType("AARParadeAttachment", {
		controllerIndex = var_54_1
	})

	var_54_48.id = "NewAttachment1"

	var_54_48:SetAlpha(0, 0)
	var_54_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 302, _1080p * 702, _1080p * 541, _1080p * 765)
	var_54_0:addElement(var_54_48)

	var_54_0.NewAttachment1 = var_54_48

	local var_54_49
	local var_54_50 = MenuBuilder.BuildRegisteredType("AARParadeAttachment", {
		controllerIndex = var_54_1
	})

	var_54_50.id = "NewAttachment2"

	var_54_50:SetAlpha(0, 0)
	var_54_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 782, _1080p * 1182, _1080p * 541, _1080p * 765)
	var_54_0:addElement(var_54_50)

	var_54_0.NewAttachment2 = var_54_50

	local var_54_51
	local var_54_52 = MenuBuilder.BuildRegisteredType("AARParadeAttachment", {
		controllerIndex = var_54_1
	})

	var_54_52.id = "NewAttachment3"

	var_54_52:SetAlpha(0, 0)
	var_54_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1262, _1080p * 1662, _1080p * 541, _1080p * 765)
	var_54_0:addElement(var_54_52)

	var_54_0.NewAttachment3 = var_54_52

	local var_54_53
	local var_54_54 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_54_1
	})

	var_54_54.id = "Cinematic"

	var_54_54:SetAlpha(0, 0)
	var_54_54:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_54_0:addElement(var_54_54)

	var_54_0.Cinematic = var_54_54

	local var_54_55
	local var_54_56 = LUI.UIText.new()

	var_54_56.id = "MaxRankLabel"

	var_54_56:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_54_56:SetAlpha(0, 0)
	var_54_56:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK"), 0)
	var_54_56:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_54_56:SetAlignment(LUI.Alignment.Left)
	var_54_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 848, _1080p * 1070, _1080p * 789, _1080p * 849)
	var_54_0:addElement(var_54_56)

	var_54_0.MaxRankLabel = var_54_56

	local var_54_57
	local var_54_58 = LUI.UIText.new()

	var_54_58.id = "MessageLabel"

	var_54_58:SetAlpha(0, 0)
	var_54_58:setText("", 0)
	var_54_58:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_54_58:SetAlignment(LUI.Alignment.Center)
	var_54_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 645, _1080p * 1319, _1080p * 504, _1080p * 522)
	var_54_0:addElement(var_54_58)

	var_54_0.MessageLabel = var_54_58

	local var_54_59
	local var_54_60 = MenuBuilder.BuildRegisteredType("AARParadeCommendations", {
		controllerIndex = var_54_1
	})

	var_54_60.id = "AARParadeCommendations"

	var_54_60:SetAlpha(0, 0)
	var_54_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1922, 0, _1080p * 1080)
	var_54_0:addElement(var_54_60)

	var_54_0.AARParadeCommendations = var_54_60

	local function var_54_61()
		return
	end

	var_54_0._sequences.DefaultSequence = var_54_61

	local var_54_62
	local var_54_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_32:RegisterAnimationSequence("Outro", var_54_63)

	local function var_54_64()
		var_54_32:AnimateSequence("Outro")
	end

	var_54_0._sequences.Outro = var_54_64

	local var_54_65
	local var_54_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_32:RegisterAnimationSequence("Intro", var_54_66)

	local function var_54_67()
		var_54_32:AnimateSequence("Intro")
	end

	var_54_0._sequences.Intro = var_54_67

	local var_54_68
	local var_54_69 = {
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			value = 0.25,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 310,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1000,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 310,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1000,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 280,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_54_4:RegisterAnimationSequence("FlashXPHighlight", var_54_69)

	local function var_54_70()
		var_54_4:AnimateSequence("FlashXPHighlight")
	end

	var_54_0._sequences.FlashXPHighlight = var_54_70

	local var_54_71
	local var_54_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_54_4:RegisterAnimationSequence("DisplayRegularRank", var_54_72)

	local var_54_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 524
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 594
		}
	}

	var_54_9:RegisterAnimationSequence("DisplayRegularRank", var_54_73)

	local var_54_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_11:RegisterAnimationSequence("DisplayRegularRank", var_54_74)

	local var_54_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_19:RegisterAnimationSequence("DisplayRegularRank", var_54_75)

	local var_54_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_21:RegisterAnimationSequence("DisplayRegularRank", var_54_76)

	local var_54_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_23:RegisterAnimationSequence("DisplayRegularRank", var_54_77)

	local var_54_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_26:RegisterAnimationSequence("DisplayRegularRank", var_54_78)

	local var_54_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 526
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 342
		}
	}

	var_54_42:RegisterAnimationSequence("DisplayRegularRank", var_54_79)

	local var_54_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 370
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 498
		}
	}

	var_54_44:RegisterAnimationSequence("DisplayRegularRank", var_54_80)

	local function var_54_81()
		var_54_4:AnimateSequence("DisplayRegularRank")
		var_54_9:AnimateSequence("DisplayRegularRank")
		var_54_11:AnimateSequence("DisplayRegularRank")
		var_54_19:AnimateSequence("DisplayRegularRank")
		var_54_21:AnimateSequence("DisplayRegularRank")
		var_54_23:AnimateSequence("DisplayRegularRank")
		var_54_26:AnimateSequence("DisplayRegularRank")
		var_54_42:AnimateSequence("DisplayRegularRank")
		var_54_44:AnimateSequence("DisplayRegularRank")
	end

	var_54_0._sequences.DisplayRegularRank = var_54_81

	local var_54_82
	local var_54_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -903
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 901
		}
	}

	var_54_4:RegisterAnimationSequence("DisplayElderRank", var_54_83)

	if CONDITIONS.IsInKoreanIGRPaidSession(var_54_0) then
		local var_54_84 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 653
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 853
			}
		}

		var_54_5:RegisterAnimationSequence("DisplayElderRank", var_54_84)
	end

	local var_54_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 602
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 653
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -306
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_54_9:RegisterAnimationSequence("DisplayElderRank", var_54_85)

	local var_54_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_11:RegisterAnimationSequence("DisplayElderRank", var_54_86)

	local var_54_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 784
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 531
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 549
		}
	}

	var_54_19:RegisterAnimationSequence("DisplayElderRank", var_54_87)

	local var_54_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 806
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 507
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 531
		}
	}

	var_54_21:RegisterAnimationSequence("DisplayElderRank", var_54_88)

	local var_54_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 532
		}
	}

	var_54_23:RegisterAnimationSequence("DisplayElderRank", var_54_89)

	local var_54_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 760
		}
	}

	var_54_26:RegisterAnimationSequence("DisplayElderRank", var_54_90)

	local var_54_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 760
		}
	}

	var_54_30:RegisterAnimationSequence("DisplayElderRank", var_54_91)

	local var_54_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -421
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -237
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1104
		}
	}

	var_54_42:RegisterAnimationSequence("DisplayElderRank", var_54_92)

	local var_54_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 568
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 696
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1035
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1163
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1034
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1162
		}
	}

	var_54_44:RegisterAnimationSequence("DisplayElderRank", var_54_93)

	local function var_54_94()
		var_54_4:AnimateSequence("DisplayElderRank")

		if CONDITIONS.IsInKoreanIGRPaidSession(var_54_0) then
			var_54_5:AnimateSequence("DisplayElderRank")
		end

		var_54_9:AnimateSequence("DisplayElderRank")
		var_54_11:AnimateSequence("DisplayElderRank")
		var_54_19:AnimateSequence("DisplayElderRank")
		var_54_21:AnimateSequence("DisplayElderRank")
		var_54_23:AnimateSequence("DisplayElderRank")
		var_54_26:AnimateSequence("DisplayElderRank")
		var_54_30:AnimateSequence("DisplayElderRank")
		var_54_42:AnimateSequence("DisplayElderRank")
		var_54_44:AnimateSequence("DisplayElderRank")
	end

	var_54_0._sequences.DisplayElderRank = var_54_94

	local var_54_95
	local var_54_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_38:RegisterAnimationSequence("KeyReward", var_54_96)

	local var_54_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_40:RegisterAnimationSequence("KeyReward", var_54_97)

	local function var_54_98()
		var_54_38:AnimateSequence("KeyReward")
		var_54_40:AnimateSequence("KeyReward")
	end

	var_54_0._sequences.KeyReward = var_54_98

	local var_54_99
	local var_54_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_46:RegisterAnimationSequence("UnlocksFadeIn3", var_54_100)

	local var_54_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 502
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 502
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 302
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 702
		},
		{
			value = 1,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_48:RegisterAnimationSequence("UnlocksFadeIn3", var_54_101)

	local var_54_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 982
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 982
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 782
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1182
		},
		{
			value = 1,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_50:RegisterAnimationSequence("UnlocksFadeIn3", var_54_102)

	local var_54_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1462
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1462
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1662
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1262
		},
		{
			value = 1,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_52:RegisterAnimationSequence("UnlocksFadeIn3", var_54_103)

	local function var_54_104()
		var_54_46:AnimateSequence("UnlocksFadeIn3")
		var_54_48:AnimateSequence("UnlocksFadeIn3")
		var_54_50:AnimateSequence("UnlocksFadeIn3")
		var_54_52:AnimateSequence("UnlocksFadeIn3")
	end

	var_54_0._sequences.UnlocksFadeIn3 = var_54_104

	local var_54_105
	local var_54_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_46:RegisterAnimationSequence("UnlocksFadeIn2", var_54_106)

	local var_54_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 680
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 680
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 480
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 880
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 480
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 880
		}
	}

	var_54_48:RegisterAnimationSequence("UnlocksFadeIn2", var_54_107)

	local var_54_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1262
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1262
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1062
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1462
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1062
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1462
		}
	}

	var_54_50:RegisterAnimationSequence("UnlocksFadeIn2", var_54_108)

	local var_54_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_52:RegisterAnimationSequence("UnlocksFadeIn2", var_54_109)

	local function var_54_110()
		var_54_46:AnimateSequence("UnlocksFadeIn2")
		var_54_48:AnimateSequence("UnlocksFadeIn2")
		var_54_50:AnimateSequence("UnlocksFadeIn2")
		var_54_52:AnimateSequence("UnlocksFadeIn2")
	end

	var_54_0._sequences.UnlocksFadeIn2 = var_54_110

	local var_54_111
	local var_54_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_46:RegisterAnimationSequence("UnlocksFadeIn1", var_54_112)

	local var_54_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 958
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 960
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1159
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 759
		},
		{
			value = 1,
			duration = 510,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_48:RegisterAnimationSequence("UnlocksFadeIn1", var_54_113)

	local var_54_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 782
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1182
		}
	}

	var_54_50:RegisterAnimationSequence("UnlocksFadeIn1", var_54_114)

	local var_54_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_52:RegisterAnimationSequence("UnlocksFadeIn1", var_54_115)

	local function var_54_116()
		var_54_46:AnimateSequence("UnlocksFadeIn1")
		var_54_48:AnimateSequence("UnlocksFadeIn1")
		var_54_50:AnimateSequence("UnlocksFadeIn1")
		var_54_52:AnimateSequence("UnlocksFadeIn1")
	end

	var_54_0._sequences.UnlocksFadeIn1 = var_54_116

	local var_54_117
	local var_54_118 = {
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

	var_54_46:RegisterAnimationSequence("UnlocksFadeOut3", var_54_118)

	local var_54_119 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_48:RegisterAnimationSequence("UnlocksFadeOut3", var_54_119)

	local var_54_120 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_50:RegisterAnimationSequence("UnlocksFadeOut3", var_54_120)

	local var_54_121 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_52:RegisterAnimationSequence("UnlocksFadeOut3", var_54_121)

	local function var_54_122()
		var_54_46:AnimateSequence("UnlocksFadeOut3")
		var_54_48:AnimateSequence("UnlocksFadeOut3")
		var_54_50:AnimateSequence("UnlocksFadeOut3")
		var_54_52:AnimateSequence("UnlocksFadeOut3")
	end

	var_54_0._sequences.UnlocksFadeOut3 = var_54_122

	local var_54_123
	local var_54_124 = {
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

	var_54_46:RegisterAnimationSequence("UnlocksFadeOut2", var_54_124)

	local var_54_125 = {
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

	var_54_48:RegisterAnimationSequence("UnlocksFadeOut2", var_54_125)

	local var_54_126 = {
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

	var_54_50:RegisterAnimationSequence("UnlocksFadeOut2", var_54_126)

	local var_54_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_52:RegisterAnimationSequence("UnlocksFadeOut2", var_54_127)

	local function var_54_128()
		var_54_46:AnimateSequence("UnlocksFadeOut2")
		var_54_48:AnimateSequence("UnlocksFadeOut2")
		var_54_50:AnimateSequence("UnlocksFadeOut2")
		var_54_52:AnimateSequence("UnlocksFadeOut2")
	end

	var_54_0._sequences.UnlocksFadeOut2 = var_54_128

	local var_54_129
	local var_54_130 = {
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

	var_54_46:RegisterAnimationSequence("UnlocksFadeOut1", var_54_130)

	local var_54_131 = {
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

	var_54_48:RegisterAnimationSequence("UnlocksFadeOut1", var_54_131)

	local var_54_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_50:RegisterAnimationSequence("UnlocksFadeOut1", var_54_132)

	local var_54_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_52:RegisterAnimationSequence("UnlocksFadeOut1", var_54_133)

	local function var_54_134()
		var_54_46:AnimateSequence("UnlocksFadeOut1")
		var_54_48:AnimateSequence("UnlocksFadeOut1")
		var_54_50:AnimateSequence("UnlocksFadeOut1")
		var_54_52:AnimateSequence("UnlocksFadeOut1")
	end

	var_54_0._sequences.UnlocksFadeOut1 = var_54_134

	local var_54_135
	local var_54_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 450,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 450,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_top_to_bottom")
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_top_to_bottom")
		},
		{
			value = 0,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_32:RegisterAnimationSequence("RankUp", var_54_136)

	local function var_54_137()
		var_54_32:AnimateSequence("RankUp")
	end

	var_54_0._sequences.RankUp = var_54_137

	local var_54_138
	local var_54_139 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1.25,
			duration = 50,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_42:RegisterAnimationSequence("FlashDoubleXPIcon", var_54_139)

	local var_54_140 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_44:RegisterAnimationSequence("FlashDoubleXPIcon", var_54_140)

	local function var_54_141()
		var_54_42:AnimateSequence("FlashDoubleXPIcon")
		var_54_44:AnimateSequence("FlashDoubleXPIcon")
	end

	var_54_0._sequences.FlashDoubleXPIcon = var_54_141

	local var_54_142
	local var_54_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -903
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 901
		}
	}

	var_54_4:RegisterAnimationSequence("ElderRankLayout", var_54_143)

	local var_54_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 603
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 653
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 96
		}
	}

	var_54_9:RegisterAnimationSequence("ElderRankLayout", var_54_144)

	local var_54_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 784
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 531
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 549
		}
	}

	var_54_19:RegisterAnimationSequence("ElderRankLayout", var_54_145)

	local var_54_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 806
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 507
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 531
		}
	}

	var_54_21:RegisterAnimationSequence("ElderRankLayout", var_54_146)

	local var_54_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 532
		}
	}

	var_54_23:RegisterAnimationSequence("ElderRankLayout", var_54_147)

	local var_54_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 760
		}
	}

	var_54_26:RegisterAnimationSequence("ElderRankLayout", var_54_148)

	local var_54_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 760
		}
	}

	var_54_30:RegisterAnimationSequence("ElderRankLayout", var_54_149)

	local var_54_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 874
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1058
		}
	}

	var_54_42:RegisterAnimationSequence("ElderRankLayout", var_54_150)

	local var_54_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 568
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 696
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1056
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1184
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1036
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1164
		}
	}

	var_54_44:RegisterAnimationSequence("ElderRankLayout", var_54_151)

	local function var_54_152()
		var_54_4:AnimateSequence("ElderRankLayout")
		var_54_9:AnimateSequence("ElderRankLayout")
		var_54_19:AnimateSequence("ElderRankLayout")
		var_54_21:AnimateSequence("ElderRankLayout")
		var_54_23:AnimateSequence("ElderRankLayout")
		var_54_26:AnimateSequence("ElderRankLayout")
		var_54_30:AnimateSequence("ElderRankLayout")
		var_54_42:AnimateSequence("ElderRankLayout")
		var_54_44:AnimateSequence("ElderRankLayout")
	end

	var_54_0._sequences.ElderRankLayout = var_54_152

	local var_54_153
	local var_54_154 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_44:RegisterAnimationSequence("FlashDoubleXPIconElder", var_54_154)

	local function var_54_155()
		var_54_44:AnimateSequence("FlashDoubleXPIconElder")
	end

	var_54_0._sequences.FlashDoubleXPIconElder = var_54_155

	local var_54_156
	local var_54_157 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 458
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1372
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1.25,
			duration = 50,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_42:RegisterAnimationSequence("FlashWeaponDoubleXPIcon", var_54_157)

	local var_54_158 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 430
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_double_weapon_xp")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1344
		},
		{
			value = -0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_54_44:RegisterAnimationSequence("FlashWeaponDoubleXPIcon", var_54_158)

	local function var_54_159()
		var_54_42:AnimateSequence("FlashWeaponDoubleXPIcon")
		var_54_44:AnimateSequence("FlashWeaponDoubleXPIcon")
	end

	var_54_0._sequences.FlashWeaponDoubleXPIcon = var_54_159

	local var_54_160
	local var_54_161 = {
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

	var_54_44:RegisterAnimationSequence("XPIconFadeout", var_54_161)

	local function var_54_162()
		var_54_44:AnimateSequence("XPIconFadeout")
	end

	var_54_0._sequences.XPIconFadeout = var_54_162

	local var_54_163
	local var_54_164 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 498
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 528
		}
	}

	var_54_58:RegisterAnimationSequence("AR", var_54_164)

	local function var_54_165()
		var_54_58:AnimateSequence("AR")
	end

	var_54_0._sequences.AR = var_54_165

	PostLoadFunc(var_54_0, var_54_1, arg_54_1)
	ACTIONS.AnimateSequence(var_54_0, "Intro")

	return var_54_0
end

MenuBuilder.registerType("AARParade", AARParade)
LockTable(_M)
