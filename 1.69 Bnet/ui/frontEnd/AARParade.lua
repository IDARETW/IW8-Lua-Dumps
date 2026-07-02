module(..., package.seeall)

local var_0_0 = 1000
local var_0_1 = 500
local var_0_2 = 1000
local var_0_3 = 2500
local var_0_4 = 3000
local var_0_5 = 3500
local var_0_6 = 3000
local var_0_7 = {
	eFull = 0,
	eHalf = 1,
	eZero = 2
}

local function var_0_8(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
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

local function var_0_9(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
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
			var_0_8(arg_4_0, arg_4_1, false, 200)
			var_0_9(arg_4_0, arg_4_1, false, 200)

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
				var_0_8(arg_6_0, arg_6_1, false, 200)
				var_0_9(arg_6_0, arg_6_1, false, 200)

				return true
			end

			return false
		end
	},
	[AAR.ParadeState.DAILY_CHALLENGE_UNLOCKS] = {
		EnterConditionFunction = function(arg_7_0, arg_7_1)
			DebugPrint("$$$ Daily Challenge Unlocks")

			return #arg_7_0.dailyChallenges > 0
		end,
		ExitFunction = function(arg_8_0, arg_8_1)
			return arg_8_0.dailyChallengeUnlocksFinished
		end
	},
	[AAR.ParadeState.BATTLE_PASS_XP] = {
		EnterConditionFunction = function(arg_9_0, arg_9_1)
			DebugPrint("$$$ Battle Pass state")

			return CONDITIONS.IsBattlePassEnabled() and arg_9_0.currentTierXP > arg_9_0.startTierXP
		end,
		ExitFunction = function(arg_10_0, arg_10_1)
			return arg_10_0.battlePassXPFinished
		end
	},
	[AAR.ParadeState.WEAPON_UNLOCKS] = {
		EnterConditionFunction = function(arg_11_0, arg_11_1)
			DebugPrint("$$$ Weapon lock")

			return #arg_11_0.weaponUnlocks > 0
		end,
		ExitFunction = function(arg_12_0, arg_12_1)
			return arg_12_0.weaponUnlocksDisplayFinished
		end
	},
	[AAR.ParadeState.WEAPON_CAMO_UNLOCKS] = {
		EnterConditionFunction = function(arg_13_0, arg_13_1)
			DebugPrint("$$$ Weapon camo lock")

			return #arg_13_0.camoUnlocks > 0
		end,
		ExitFunction = function(arg_14_0, arg_14_1)
			return arg_14_0.camoUnlocksDisplayFinished
		end
	},
	[AAR.ParadeState.KEY_REWARD] = {
		EnterConditionFunction = function(arg_15_0, arg_15_1)
			return CONDITIONS.AreKeysEnabled() and arg_15_0.gainedKeysCurrency >= AAR.KEY_UNIT_CURRENCY
		end,
		ExitFunction = function(arg_16_0, arg_16_1)
			return arg_16_0.keyRewardDisplayFinished
		end
	},
	[AAR.ParadeState.COMMENDATIONS] = {
		EnterConditionFunction = function(arg_17_0, arg_17_1)
			return AAR.IsCommendtionEnabled() and arg_17_0.accoladesPackage and #arg_17_0.accoladesPackage > 0 and not CONDITIONS.IsTrialGameType()
		end,
		ExitFunction = function(arg_18_0, arg_18_1)
			return arg_18_0.commendationFinished
		end
	}
}

local function var_0_10(arg_19_0, arg_19_1)
	DebugPrint("$$$ Update AAR Parade State")

	local var_19_0 = ParadeStateFlowTable[arg_19_0._currentStateIndex]

	if var_19_0.ExitFunction(arg_19_0, arg_19_1) then
		local var_19_1

		while var_19_1 == nil or not var_19_1.EnterConditionFunction(arg_19_0, arg_19_1) do
			arg_19_0._currentStateIndex = arg_19_0._currentStateIndex + 1

			if arg_19_0._currentStateIndex > #ParadeStateFlowTable then
				DebugPrint("$$$ Exit AAR parade now")
				ParadeStateFlowTable.ExitFunction(arg_19_0, arg_19_1)

				return
			else
				var_19_1 = ParadeStateFlowTable[arg_19_0._currentStateIndex]
			end
		end

		arg_19_0:Wait(var_0_1).onComplete = function()
			var_19_1.DisplayFunction(arg_19_0, arg_19_1)
		end
	else
		var_19_0.DisplayFunction(arg_19_0, arg_19_1)
	end
end

local function var_0_11(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5)
	if arg_21_0.elderProgressBarProgress == nil then
		arg_21_0.elderProgressBarProgress = 0
	end

	arg_21_2 = LUI.clamp(arg_21_2, 0, 1)

	local var_21_0 = (arg_21_2 - arg_21_0.elderProgressBarProgress) * 1000

	if arg_21_5 then
		var_21_0 = 0
	end

	arg_21_0.ElderProgressBar:SetProgress(arg_21_2, var_21_0, arg_21_3, arg_21_4)

	arg_21_0.elderProgressBarProgress = arg_21_2

	if var_21_0 > 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressCircle)

		arg_21_0:Wait(var_21_0).onComplete = function()
			Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressCircleStop)
		end
	end

	return var_21_0
end

local function var_0_12(arg_23_0, arg_23_1, arg_23_2)
	assert(arg_23_0.XPType)

	local var_23_0 = _1080p * 80

	arg_23_0.XPType:setText(arg_23_1)
	arg_23_0.XPType:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)

	if arg_23_2 then
		arg_23_0.XPType:SetRGBFromTable(COLORS.red, 0)
	end
end

local function var_0_13(arg_24_0, arg_24_1)
	var_0_9(arg_24_0, arg_24_1, false, 100)
	var_0_8(arg_24_0, arg_24_1, false, 100)

	arg_24_0.isUsingElderProgressBar = true

	arg_24_0.AARRankUpContainer:SetAlpha(1)
	arg_24_0.XPValue:SetAlpha(0, 100)
	arg_24_0.EarnRateBuff:SetAlpha(0, 100)
	arg_24_0.XPType:SetAlpha(0)
	arg_24_0.XPType:SetAlpha(1, 100)
	var_0_12(arg_24_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/RANK_UP")))

	arg_24_0.currentRank = arg_24_0.preSeasonRank - 1
	arg_24_0._currentPrestige = arg_24_0._prePrestigeLevel

	arg_24_0.AARRankUpContainer:PlayAARElderRankIntroSequence(arg_24_1, arg_24_0._currentPrestige)
end

local function var_0_14(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.currentRank + 1

	if arg_25_0._currentPrestige < arg_25_0._finalPrestigeLevel and PROGRESSION.GetCanPrestigeLevelUpForSeasonalRank(var_25_0) then
		arg_25_0._currentPrestige = arg_25_0._currentPrestige + 1
	end

	local var_25_1 = PROGRESSION.GetPlayerProgressionData({
		_rankNumOverride = var_25_0,
		_prestigeLevel = arg_25_0._currentPrestige,
		_rankTypeOverride = arg_25_0.isUsingElderProgressBar and PROGRESSION.RANK_TYPES.SEASONAL or PROGRESSION.RANK_TYPES.MILITARY
	})
	local var_25_2 = {
		rankDisplay = var_25_1._rankDisplay,
		rankIcon = var_25_1._rankIcon,
		prestigeMasterColor = var_25_1._prestigeMasterColor
	}

	arg_25_0.currentRank = var_25_0
	arg_25_0.earnedTypeXP = arg_25_0.earnedTypeXP - arg_25_2

	if arg_25_0.isUsingElderProgressBar then
		var_0_11(arg_25_0, arg_25_1, 0, nil, true, false)
		var_0_9(arg_25_0, arg_25_1, false, 100)
	else
		arg_25_0.AARProgressBar:InitProgressBar(arg_25_1, 0)
	end

	arg_25_0.AARRankUpContainer:SetAlpha(1)

	local var_25_3 = AAR.GetRankupUnlockPackage(arg_25_1, arg_25_0.currentRank, arg_25_0.isUsingElderProgressBar)

	arg_25_0.AARRankUpContainer:SetupAARUnlocksList(arg_25_1, var_25_3)
	arg_25_0.XPValue:SetAlpha(0, 100)
	arg_25_0.EarnRateBuff:SetAlpha(0, 100)
	arg_25_0.XPType:SetAlpha(0)
	arg_25_0.XPType:SetAlpha(1, 100)

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_25_0) then
		arg_25_0.AARIGRXPBonusTip:SetAlpha(0, 100)
	end

	var_0_12(arg_25_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/RANK_UP")))
	ACTIONS.AnimateSequence(arg_25_0, "RankUp")

	if #var_25_3 > 0 then
		arg_25_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/UNLOCKS")))
	else
		arg_25_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESS")))
	end

	arg_25_0.AARRankUpContainer:PlayAARRankUpSequence(arg_25_1, var_25_2, true)
end

local function var_0_15(arg_26_0, arg_26_1)
	local var_26_0 = PROGRESSION.GetPlayerProgressionData({
		_rankNumOverride = arg_26_0.currentRank,
		_prestigeLevel = arg_26_0._currentPrestige,
		_rankTypeOverride = arg_26_0.isUsingElderProgressBar and PROGRESSION.RANK_TYPES.SEASONAL or PROGRESSION.RANK_TYPES.MILITARY
	})
	local var_26_1 = {
		rankDisplay = var_26_0._rankDisplay,
		rankIcon = var_26_0._rankIcon,
		prestigeMasterColor = var_26_0._prestigeMasterColor
	}
	local var_26_2 = arg_26_0.currentRank
	local var_26_3 = arg_26_0.currentRank + 1

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_26_0) then
		arg_26_0.AARIGRXPBonusTip:SetAlpha(0, 0)
	end

	if arg_26_0.isRankXPMax then
		var_0_12(arg_26_0, ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK")))
	end

	if arg_26_0.isElder then
		arg_26_0.AARRankUpContainer:SetAlpha(1, 300)
		arg_26_0.AARRankUpContainer.RankUpItem.RankIcon:SetAlpha(0)
		arg_26_0.AARRankUpContainer.RankUpItem.RankValue:SetAlpha(1, 300)
		arg_26_0.AARRankUpContainer.RankUpItem.RankValue:setText(var_26_1.rankDisplay)

		if var_26_1.prestigeMasterColor ~= PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR then
			arg_26_0.AARRankUpContainer.RankUpItem.RankValue:SetRGBFromTable(var_26_1.prestigeMasterColor)
		end

		var_0_9(arg_26_0, arg_26_1, true, 100)
	else
		arg_26_0.ElderRankIcon:SetAlpha(0)
		arg_26_0.AARRankUpContainer:SetAlpha(1, 300)
		arg_26_0.AARRankUpContainer:PlayAARRankUpSequence(arg_26_1, var_26_1, false)
		arg_26_0.AARProgressBar:InitProgressBarRank(arg_26_1, var_26_2, var_26_3)
	end

	arg_26_0.ProgressText:setText("")

	arg_26_0:Wait(var_0_5).onComplete = function()
		arg_26_0.progressDisplayFinished = true

		var_0_10(arg_26_0, arg_26_1)
	end
end

local function var_0_16(arg_28_0, arg_28_1)
	if arg_28_0.currentXP >= PROGRESSION.GetSeasonMaxRankXP() then
		var_0_12(arg_28_0, ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK")))
		var_0_11(arg_28_0, arg_28_1, 1, nil, true)

		local var_28_0 = PROGRESSION.GetPlayerProgressionData({
			_rankNumOverride = arg_28_0.currentRank,
			_prestigeLevel = arg_28_0._currentPrestige,
			_rankTypeOverride = arg_28_0.isUsingElderProgressBar and PROGRESSION.RANK_TYPES.SEASONAL or PROGRESSION.RANK_TYPES.MILITARY
		})

		arg_28_0.AARRankUpContainer:SetAlpha(1, 300)
		arg_28_0.AARRankUpContainer.RankUpItem.RankIcon:SetAlpha(0)
		arg_28_0.AARRankUpContainer.RankUpItem.RankValue:SetAlpha(1, 300)
		arg_28_0.AARRankUpContainer.RankUpItem.RankValue:setText(var_28_0._rankDisplay)

		local var_28_1 = var_0_3

		arg_28_0:Wait(var_28_1).onComplete = function()
			arg_28_0.progressDisplayFinished = true
			arg_28_0.forceQuit = true

			arg_28_0.SpecialLabel:SetAlpha(0, 100)
			var_0_10(arg_28_0, arg_28_1)
		end

		return true
	end

	return false
end

local function var_0_17(arg_30_0, arg_30_1)
	arg_30_0._currentWeaponIndex = arg_30_0._currentWeaponIndex + 1

	if arg_30_0._currentWeaponIndex <= #arg_30_0.weaponUnlocks then
		local var_30_0 = arg_30_0.weaponUnlocks[arg_30_0._currentWeaponIndex].weaponRef
		local var_30_1 = LOOT.GetItemProgressionImage(LOOT.itemTypes.WEAPON, var_30_0)
		local var_30_2 = WEAPON.GetName(var_30_0)

		arg_30_0.WeaponIcon:setImage(RegisterMaterial(var_30_1))

		local var_30_3 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, var_30_0)
		local var_30_4 = LOOT.IsUnlockedWithID(arg_30_1, var_30_3)
		local var_30_5 = PROGRESSION.GetUnlockRank(var_30_3)
		local var_30_6 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = var_30_5
		})

		if var_30_4 ~= nil then
			if not var_30_4 then
				arg_30_0.MessageLabel:SetAlpha(1)

				local var_30_7 = WEAPON.GetChallengeUnlockRow(var_30_3)

				if var_30_7 and var_30_7 >= 0 then
					arg_30_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/ATTACHMENT_UNLOCK_INFO_CHALLENGE", var_30_2))
				else
					arg_30_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/ATTACHMENT_UNLOCK_INFO", var_30_2, var_30_6._rankDisplay))
				end
			else
				arg_30_0.MessageLabel:SetAlpha(0)
			end
		else
			arg_30_0.MessageLabel:SetAlpha(0)
		end

		var_0_12(arg_30_0, ToUpperCase(var_30_2))

		local var_30_8 = arg_30_0.weaponUnlocks[arg_30_0._currentWeaponIndex].attachmentsData

		table.sort(var_30_8, function(arg_31_0, arg_31_1)
			return arg_31_0.unlockWeaponLevel < arg_31_1.unlockWeaponLevel
		end)

		arg_30_0._currentUnlockCount = math.min(#var_30_8, #arg_30_0._newAttachmentWidgets)

		for iter_30_0 = 1, arg_30_0._currentUnlockCount do
			local var_30_9 = arg_30_0._newAttachmentWidgets[iter_30_0]
			local var_30_10 = var_30_8[iter_30_0]

			if not var_30_10 then
				break
			end

			local var_30_11 = ATTACHMENT.GetCategoryByLootID(var_30_10.lootID, var_30_0)
			local var_30_12 = ATTACHMENT.GetAttachmentCategoryName(var_30_11)

			var_30_9:SetupAttachmentInfo(var_30_10.icon, var_30_10.name, Engine.CBBHFCGDIC(var_30_12), Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_30_10.unlockWeaponLevel))
		end

		arg_30_0.Cinematic:SetAlpha(0.75)
		Engine.DFCGFCGBFD("mp_aar_weaponUnlock_0" .. (arg_30_0._currentWeaponIndex % 2 == 0 and "1" or "2"))
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.attachmentUnlock)
		ACTIONS.AnimateSequence(arg_30_0, "UnlocksFadeIn" .. arg_30_0._currentUnlockCount)

		if arg_30_0._isWeaponDoubleXP then
			ACTIONS.AnimateSequence(arg_30_0, "FlashWeaponDoubleXPIcon")
		end

		arg_30_0:Wait(var_0_3, true).onComplete = function()
			Engine.EBCGADABJ()
			arg_30_0:DisplayAARParadeUnlocksInTurn(arg_30_1)
		end
	else
		ACTIONS.AnimateSequence(arg_30_0, "UnlocksFadeOut" .. arg_30_0._currentUnlockCount)

		arg_30_0:Wait(var_0_1, true).onComplete = function()
			if arg_30_0._isWeaponDoubleXP then
				ACTIONS.AnimateSequence(arg_30_0, "XPIconFadeout")
			end

			arg_30_0.weaponUnlocksDisplayFinished = true

			arg_30_0.AARRankUpContainer.Cinematic:SetAlpha(0)
			arg_30_0.Cinematic:SetAlpha(0)
			Engine.EBCGADABJ()
			var_0_10(arg_30_0, arg_30_1)
		end
	end
end

local function var_0_18(arg_34_0, arg_34_1)
	if arg_34_0.isUsingElderProgressBar then
		var_0_9(arg_34_0, arg_34_1, false)
	else
		var_0_8(arg_34_0, arg_34_1, false)
	end

	arg_34_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/WEAPON_UNLOCKS")))

	arg_34_0._currentWeaponIndex = 0

	var_0_17(arg_34_0, arg_34_1)
end

local function var_0_19(arg_35_0, arg_35_1)
	arg_35_0._currentCamoIndex = arg_35_0._currentCamoIndex + 1

	if arg_35_0._currentCamoIndex <= #arg_35_0.camoUnlocks then
		local var_35_0 = arg_35_0.camoUnlocks[arg_35_0._currentCamoIndex].weaponRef
		local var_35_1 = LOOT.GetItemProgressionImage(LOOT.itemTypes.WEAPON, var_35_0)
		local var_35_2 = WEAPON.GetName(var_35_0)

		arg_35_0.WeaponIcon:setImage(RegisterMaterial(var_35_1))
		var_0_12(arg_35_0, ToUpperCase(var_35_2))

		local var_35_3 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, var_35_0)
		local var_35_4 = LOOT.IsUnlockedWithID(arg_35_1, var_35_3)
		local var_35_5 = PROGRESSION.GetUnlockRank(var_35_3)
		local var_35_6 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = var_35_5
		})

		if var_35_4 ~= nil then
			if not var_35_4 then
				arg_35_0.MessageLabel:SetAlpha(1)

				local var_35_7 = WEAPON.GetChallengeUnlockRow(var_35_3)

				if var_35_7 and var_35_7 >= 0 then
					arg_35_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/CAMO_UNLOCK_INFO_CHALLENGE", var_35_2))
				else
					arg_35_0.MessageLabel:setText(Engine.CBBHFCGDIC("AAR/CAMO_UNLOCK_INFO", var_35_2, var_35_6._rankDisplay))
				end
			else
				arg_35_0.MessageLabel:SetAlpha(0)
			end
		else
			arg_35_0.MessageLabel:SetAlpha(0)
		end

		local var_35_8 = arg_35_0.camoUnlocks[arg_35_0._currentCamoIndex].camoData

		arg_35_0._currentUnlockCount = math.min(#var_35_8, #arg_35_0._newAttachmentWidgets)

		for iter_35_0 = 1, arg_35_0._currentUnlockCount do
			local var_35_9 = arg_35_0._newAttachmentWidgets[iter_35_0]
			local var_35_10 = var_35_8[iter_35_0]

			if not var_35_10 then
				break
			end

			var_35_9:SetupAttachmentCamoInfo(var_35_10.icon, var_35_10.name)
		end

		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.camoUnlock)
		ACTIONS.AnimateSequence(arg_35_0, "UnlocksFadeIn" .. arg_35_0._currentUnlockCount)

		if arg_35_0._isWeaponDoubleXP then
			ACTIONS.AnimateSequence(arg_35_0, "FlashWeaponDoubleXPIcon")
		end

		arg_35_0:Wait(var_0_3, true).onComplete = function()
			arg_35_0:DisplayAARParadeCamoUnlocksInTurn(arg_35_1)
		end
	else
		ACTIONS.AnimateSequence(arg_35_0, "UnlocksFadeOut" .. arg_35_0._currentUnlockCount)

		if arg_35_0._isWeaponDoubleXP then
			ACTIONS.AnimateSequence(arg_35_0, "XPIconFadeout")
		end

		arg_35_0:Wait(var_0_1, true).onComplete = function()
			arg_35_0.camoUnlocksDisplayFinished = true

			arg_35_0.AARRankUpContainer.Cinematic:SetAlpha(0)
			Engine.EBCGADABJ()
			var_0_10(arg_35_0, arg_35_1)
		end
	end
end

local function var_0_20(arg_38_0, arg_38_1)
	if arg_38_0.isUsingElderProgressBar then
		var_0_9(arg_38_0, arg_38_1, false)
	else
		var_0_8(arg_38_0, arg_38_1, false)
	end

	arg_38_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/CAMO_UNLOCK")))

	arg_38_0._currentCamoIndex = 0

	var_0_19(arg_38_0, arg_38_1)
end

local function var_0_21(arg_39_0)
	if not selfkeyRewardDisplayFinished then
		if not arg_39_0._keyRewardSoundID or not Engine.CHFEJIG(arg_39_0._keyRewardSoundID) then
			arg_39_0._keyRewardSoundID = Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.keysCounterTick)
		end

		arg_39_0:Wait(20).onComplete = function()
			arg_39_0:KeyRewardStateUpdate()
		end
	elseif arg_39_0._keyRewardSoundID and Engine.CHFEJIG(arg_39_0._keyRewardSoundID) then
		Engine.EAGBECEBGA(arg_39_0._keyRewardSoundID)
	end
end

local function var_0_22(arg_41_0, arg_41_1)
	if arg_41_0.isUsingElderProgressBar then
		var_0_9(arg_41_0, arg_41_1, false)
	else
		var_0_8(arg_41_0, arg_41_1, false)
	end

	local var_41_0 = arg_41_0.gainedKeysCurrency / AAR.KEY_UNIT_CURRENCY
	local var_41_1 = string.format("%d", var_41_0)

	arg_41_0.KeyRewardValue:setText(Engine.CBBHFCGDIC("MENU/PLUS", var_41_1))
	var_0_12(arg_41_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/KEYS_AWARDED")))
	ACTIONS.AnimateSequence(arg_41_0, "KeyReward")
	arg_41_0:KeyRewardStateUpdate()

	arg_41_0:Wait(1000).onComplete = function()
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.keysBanked)

		arg_41_0.keyRewardDisplayFinished = true

		var_0_10(arg_41_0, arg_41_1)
	end
end

local function var_0_23(arg_43_0, arg_43_1)
	var_0_12(arg_43_0, "")
	arg_43_0.MessageLabel:SetAlpha(0)

	if arg_43_0.isUsingElderProgressBar then
		var_0_9(arg_43_0, arg_43_1, false)
	else
		var_0_8(arg_43_0, arg_43_1, false)
	end

	arg_43_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/TOP_COMMENDATIONS")))
	arg_43_0.AARParadeCommendations:SetupCommendations(arg_43_0.accoladesPackage)
	arg_43_0.AARParadeCommendations:SetAlpha(1, 100)

	arg_43_0:Wait(var_0_6).onComplete = function()
		arg_43_0.AARParadeCommendations:SetAlpha(0, 100)

		arg_43_0.commendationFinished = true

		var_0_10(arg_43_0, arg_43_1)
	end
end

local function var_0_24(arg_45_0, arg_45_1)
	if arg_45_0.isUsingElderProgressBar then
		var_0_9(arg_45_0, arg_45_1, false, 0)
	else
		var_0_8(arg_45_0, arg_45_1, false, 0)
	end

	arg_45_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/UNLOCKS")))
	var_0_12(arg_45_0, ToUpperCase(Engine.CBBHFCGDIC("AAR/DAILY_CHALLENGES_COMPLETED")))
	arg_45_0.AARDailyChallenges:SetAlpha(1, 100)
	arg_45_0.EarnRateBuff:SetAlpha(1, 100)
	arg_45_0.AARDailyChallenges:SetupAARDailyChallengesRewardsList(arg_45_1, arg_45_0.dailyChallenges)

	arg_45_0:Wait(var_0_4).onComplete = function()
		local var_46_0 = 100

		arg_45_0.AARDailyChallenges:SetAlpha(0, var_46_0)
		arg_45_0.EarnRateBuff:SetAlpha(0, var_46_0)

		arg_45_0.dailyChallengeUnlocksFinished = true

		var_0_10(arg_45_0, arg_45_1)
	end
end

local function var_0_25(arg_47_0, arg_47_1)
	var_0_12(arg_47_0, "")

	if arg_47_0.isUsingElderProgressBar then
		var_0_9(arg_47_0, arg_47_1, false, 0)
	else
		var_0_8(arg_47_0, arg_47_1, false, 0)
	end

	local var_47_0 = {
		displayBattlePassInAAR = true,
		battlePassData = {
			startTierXP = arg_47_0.startTierXP,
			currentTierXP = arg_47_0.currentTierXP,
			battlepassTimeXP = arg_47_0.battlepassTimeXP,
			battlepassChallengeXP = arg_47_0.battlepassChallengeXP,
			startTier = BATTLEPASS.GetTierByXP(arg_47_1, arg_47_0.startTierXP),
			currentTier = BATTLEPASS.GetTierByXP(arg_47_1, arg_47_0.currentTierXP),
			isDoubleXPActive = LOOT.IsDoubleBattlePassXPActive()
		}
	}

	LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_47_1, true, var_47_0, true)
end

local function var_0_26(arg_48_0, arg_48_1)
	arg_48_0.ProgressText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESS")))

	local var_48_0 = PROGRESSION.GetPlayerProgressionData({
		_rankNumOverride = arg_48_0.currentRank,
		_prestigeLevel = arg_48_0._currentPrestige,
		_rankTypeOverride = arg_48_0.isUsingElderProgressBar and PROGRESSION.RANK_TYPES.SEASONAL or PROGRESSION.RANK_TYPES.MILITARY
	})
	local var_48_1 = var_48_0._isUsingSeasonalRank and arg_48_0.currentRank == var_48_0._rankMax
	local var_48_2 = var_48_0._minXPForCurrentRank
	local var_48_3 = var_48_0._maxXPForCurrentRank
	local var_48_4 = arg_48_0.earnedTypeXP
	local var_48_5
	local var_48_6 = arg_48_0.currentXP + var_48_4
	local var_48_7 = var_48_3 <= var_48_6

	if var_48_7 then
		local var_48_8 = not var_48_0._isUsingSeasonalRank and arg_48_0.currentRank == var_48_0._rankMax

		var_48_5 = arg_48_0.isElderFirstTime and var_48_8
		var_48_4 = var_48_3 - arg_48_0.currentXP
		var_48_6 = var_48_3
	end

	if var_48_5 then
		var_48_6 = arg_48_0.finalXP
	elseif arg_48_0.isElder and arg_48_0.isUsingElderProgressBar then
		if var_48_6 > arg_48_0.finalSeasonXP then
			var_48_4 = arg_48_0.finalSeasonXP - arg_48_0.currentXP
			var_48_6 = arg_48_0.finalSeasonXP
		end
	elseif var_48_6 > arg_48_0.finalXP then
		var_48_4 = arg_48_0.finalXP - arg_48_0.currentXP
		var_48_6 = arg_48_0.finalXP
	end

	local var_48_9 = (var_48_6 - var_48_2) / (var_48_3 - var_48_2)
	local var_48_10 = arg_48_0.matchInfoPackage[arg_48_0.currentDisplayType].value
	local var_48_11 = "------------- AAR Parade Progress Bar Fill Data Info:" .. " \n currentXP " .. tostring(arg_48_0.currentXP) .. " \n earnedTypeXP " .. tostring(var_48_4) .. " \n finalSeasonXP " .. tostring(arg_48_0.finalSeasonXP) .. " \n rankXPPercentage " .. tostring(var_48_9) .. " \n finalXP " .. tostring(arg_48_0.finalXP) .. " \n nextXP " .. tostring(var_48_6) .. " \n rankMinXP " .. tostring(var_48_2) .. " \n rankMaxXP " .. tostring(var_48_3)

	DebugPrint(var_48_11)

	if var_0_16(arg_48_0, arg_48_1) then
		return
	end

	local var_48_12 = arg_48_0.currentRank
	local var_48_13 = arg_48_0.currentRank + 1
	local var_48_14 = {
		type = arg_48_0.currentDisplayType,
		fillRate = var_48_9,
		earnedXP = var_48_10,
		curRank = var_48_12,
		nextRank = var_48_13,
		hideIndicator = var_48_7
	}
	local var_48_15 = 1

	if arg_48_0.isUsingElderProgressBar then
		local var_48_16 = var_48_0._rankIcon

		if var_48_16 and #var_48_16 > 0 then
			arg_48_0.ElderRankIcon:setImage(RegisterMaterial(var_48_16))
		end

		arg_48_0.ElderRankName:setText(var_48_0._rankName)
		arg_48_0.ElderRankValue:setText(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_48_0._rankDisplay))

		if var_48_0._prestigeMasterColor ~= PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR then
			arg_48_0.ElderRankValue:SetRGBFromTable(var_48_0._prestigeMasterColor)
		end

		var_0_9(arg_48_0, arg_48_1, true, 100)

		var_48_15 = var_0_11(arg_48_0, arg_48_1, var_48_9, nil, true)
	else
		var_48_15 = arg_48_0.AARProgressBar:UpdateFill(arg_48_1, var_48_14)
	end

	if var_48_4 > 0 then
		arg_48_0.XPValue:SetAlpha(1, 100)
		arg_48_0.EarnRateBuff:SetAlpha(1, 100)
		arg_48_0.XPValue:setText(0)
		arg_48_0.XPValue:setupTextValueIntTween(0, var_48_4, var_48_15, LUI.EASING.inOutSine, Engine.CBBHFCGDIC("AAR/PLUS_XP"))
		ACTIONS.AnimateSequence(arg_48_0, "FlashXPHighlight")

		if CONDITIONS.IsInKoreanIGRPaidSession(arg_48_0) then
			arg_48_0.AARIGRXPBonusTip:SetAlpha(1, 100)
		end

		if arg_48_0._displayDoubleXP then
			if arg_48_0._isDoubleXP then
				arg_48_0.XPIcon:setImage(RegisterMaterial("icon_double_xp"))
				arg_48_0.XPIconShadow:setImage(RegisterMaterial("aar_doubleXP_pixels"))
			end

			if arg_48_0.isUsingElderProgressBar then
				ACTIONS.AnimateSequence(arg_48_0, "FlashDoubleXPIconElder")
			else
				ACTIONS.AnimateSequence(arg_48_0, "FlashDoubleXPIcon")
			end
		end
	end

	local var_48_17 = var_48_15 + var_0_1

	if var_48_4 == 0 then
		var_48_17 = 1
	else
		var_0_12(arg_48_0, ToUpperCase(arg_48_0.matchInfoPackage[arg_48_0.currentDisplayType].name), arg_48_0.matchInfoPackage[arg_48_0.currentDisplayType].isAntiAddiction)
	end

	arg_48_0:Wait(var_48_17).onComplete = function()
		arg_48_0.XPIcon:SetAlpha(0, 100)

		arg_48_0.currentXP = arg_48_0.currentXP + var_48_4

		if var_48_7 then
			if var_48_5 then
				arg_48_0._elderRankIntroSavedData = {
					earnedTypeXP = var_48_4
				}
				arg_48_0.currentXP = 0

				var_0_13(arg_48_0, arg_48_1)
			elseif not var_48_1 then
				var_0_14(arg_48_0, arg_48_1, var_48_4)
			else
				var_0_10(arg_48_0, arg_48_1)
			end
		else
			if arg_48_0.currentDisplayType < AAR.MAX_XP_TYPE_DISPLAY_NUM then
				arg_48_0.currentDisplayType = arg_48_0.currentDisplayType + 1
				arg_48_0.earnedTypeXP = arg_48_0.matchInfoPackage[arg_48_0.currentDisplayType].value

				if arg_48_0.currentDisplayType == AAR.ProgressTypes.MATCH_XP_DOUBLE then
					arg_48_0._displayDoubleXP = true
				else
					arg_48_0._displayDoubleXP = false
				end
			else
				arg_48_0.xpDisplayFinished = true
			end

			var_0_10(arg_48_0, arg_48_1)
		end
	end
end

local function var_0_27(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0.matchDataPackage
	local var_50_1 = ToUpperCase(Engine.CBBHFCGDIC("AAR/MATCH_XP"))
	local var_50_2 = ToUpperCase(Engine.CBBHFCGDIC("AAR/DOUBLE_MATCH_XP"))
	local var_50_3 = ToUpperCase(Engine.CBBHFCGDIC("AAR/CONTRACT_BONUS"))
	local var_50_4 = ToUpperCase(Engine.CBBHFCGDIC("AAR/PLUNDER_BONUS"))
	local var_50_5 = ToUpperCase(Engine.CBBHFCGDIC("AAR/CHALLENGE_BONUS"))
	local var_50_6 = ToUpperCase(Engine.CBBHFCGDIC("AAR/MISSION_BONUS"))
	local var_50_7 = false

	if Engine.ECAJCAJJGF() then
		local var_50_8 = Engine.DFAJCBFIAB()

		if var_50_8 == var_0_7.eHalf or var_50_8 == var_0_7.eZero then
			var_50_7 = true
			var_50_1 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_MATCH_XP_" .. tostring(var_50_8)))
			var_50_2 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_DOUBLE_MATCH_XP_" .. tostring(var_50_8)))
			var_50_3 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_CONTRACT_BONUS_" .. tostring(var_50_8)))
			var_50_4 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_PLUNDER_BONUS_" .. tostring(var_50_8)))
			var_50_5 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_CHALLENGE_BONUS_" .. tostring(var_50_8)))
			var_50_6 = ToUpperCase(Engine.CBBHFCGDIC("AAR/WEGAME_MISSION_BONUS_" .. tostring(var_50_8)))
		end
	end

	local var_50_9 = AAR.GetChallengesPackage(arg_50_1, var_50_0.challenges)
	local var_50_10 = CONDITIONS.IsMagmaGameMode() and Challenge.Type.BR_DAILY or Challenge.Type.DAILY

	if CONDITIONS.IsThirdGameMode() then
		var_50_10 = Challenge.Type.CP_DAILY
	end

	arg_50_0.dailyChallenges = {}

	for iter_50_0 = 1, #var_50_9 do
		if var_50_9[iter_50_0].type == var_50_10 then
			table.insert(arg_50_0.dailyChallenges, var_50_9[iter_50_0])
		end
	end

	arg_50_0.matchInfoPackage = {
		[AAR.ProgressTypes.MATCH_XP] = {
			value = arg_50_0._isDoubleXP and var_50_0.matchXP / 2 or var_50_0.matchXP,
			name = var_50_1,
			isAntiAddiction = var_50_7
		},
		[AAR.ProgressTypes.MATCH_XP_DOUBLE] = {
			value = arg_50_0._isDoubleXP and var_50_0.matchXP / 2 or 0,
			name = var_50_2,
			isAntiAddiction = var_50_7
		},
		[AAR.ProgressTypes.CONTRACT_BONUS] = {
			value = var_50_0.contractBonus,
			name = var_50_3,
			isAntiAddiction = var_50_7
		},
		[AAR.ProgressTypes.PLUNDER_BONUS] = {
			value = var_50_0.plunderBonus,
			name = var_50_4,
			isAntiAddiction = var_50_7
		},
		[AAR.ProgressTypes.CHALLENGE_BONUS] = {
			value = var_50_0.challengeBonus,
			name = var_50_5,
			isAntiAddiction = var_50_7
		},
		[AAR.ProgressTypes.MISSION_BONUS] = {
			value = var_50_0.missionXP,
			name = var_50_6,
			isAntiAddiction = var_50_7
		}
	}
	arg_50_0.gainedKeysCurrency = var_50_0.currentKeys - var_50_0.startKeys
	arg_50_0.preRank = var_50_0.preRank
	arg_50_0.finalRank = var_50_0.curRank
	arg_50_0.preSeasonRank = var_50_0.preSeasonRank
	arg_50_0.finalSeasonRank = var_50_0.curSeasonRank
	arg_50_0._prePrestigeLevel = var_50_0.startPrestige
	arg_50_0._finalPrestigeLevel = var_50_0.prestige
	arg_50_0._currentPrestige = arg_50_0._prePrestigeLevel
	arg_50_0.earnedTotalXP = var_50_0.earnedXP
	arg_50_0.earnedSeasonXP = var_50_0.earnedSeasonXP
	arg_50_0.finalXP = var_50_0.currentXP
	arg_50_0.finalSeasonXP = var_50_0.currentSeasonXP
	arg_50_0.isElder = var_50_0.isElder
	arg_50_0.isElderFirstTime = var_50_0.isElderFirstTime
	arg_50_0.isGainingElderXP = var_50_0.isGainingElderXP
	arg_50_0.isRankXPMax = PROGRESSION.GetPlayerAtMaxRank(arg_50_1)
	arg_50_0.startTierXP = var_50_0.startTierXP
	arg_50_0.currentTierXP = var_50_0.currentTierXP
	arg_50_0.battlepassTimeXP = var_50_0.battlepassTimeXP
	arg_50_0.battlepassChallengeXP = var_50_0.battlepassChallengeXP
	arg_50_0.isUsingElderProgressBar = false

	if arg_50_0.isElder and not arg_50_0.isElderFirstTime then
		arg_50_0.isUsingElderProgressBar = true
	end

	local var_50_11 = 0

	if arg_50_0.isGainingElderXP then
		local var_50_12 = PROGRESSION.GetSeasonRankMinXP(arg_50_0.preSeasonRank)
		local var_50_13 = PROGRESSION.GetSeasonRankMaxXP(arg_50_0.preSeasonRank)

		var_50_11 = (arg_50_0.finalSeasonXP - arg_50_0.earnedSeasonXP - var_50_12) / (var_50_13 - var_50_12)
		arg_50_0.currentRank = arg_50_0.preSeasonRank
		arg_50_0.currentXP = arg_50_0.finalSeasonXP - arg_50_0.earnedSeasonXP
	else
		local var_50_14 = PROGRESSION.GetMilitaryRankMinXP(arg_50_0.preRank)
		local var_50_15 = PROGRESSION.GetMilitaryRankMaxXP(arg_50_0.preRank)

		var_50_11 = (arg_50_0.finalXP - arg_50_0.earnedTotalXP - var_50_14) / (var_50_15 - var_50_14)
		arg_50_0.currentRank = arg_50_0.preRank
		arg_50_0.currentXP = arg_50_0.finalXP - arg_50_0.earnedTotalXP
	end

	if not arg_50_0._isFromBattlepassAAR then
		if arg_50_0.isUsingElderProgressBar then
			var_0_11(arg_50_0, arg_50_1, var_50_11, nil, true, true)
			ACTIONS.AnimateSequence(arg_50_0, "DisplayElderRank")

			local var_50_16 = PROGRESSION.GetPlayerProgressionData({
				_rankNumOverride = arg_50_0.currentRank,
				_prestigeLevel = arg_50_0._currentPrestige,
				_rankTypeOverride = PROGRESSION.RANK_TYPES.SEASONAL
			})
			local var_50_17 = var_50_16._rankIcon

			if var_50_17 and #var_50_17 > 0 then
				arg_50_0.ElderRankIcon:setImage(RegisterMaterial(var_50_17))
			end

			arg_50_0.ElderRankName:setText(var_50_16._rankName)
			arg_50_0.ElderRankValue:setText(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_50_16._rankDisplay))

			if var_50_16._prestigeMasterColor ~= PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR then
				arg_50_0.ElderRankValue:SetRGBFromTable(var_50_16._prestigeMasterColor)
			end
		else
			arg_50_0.AARProgressBar:InitProgressBar(arg_50_1, var_50_11)
			ACTIONS.AnimateSequence(arg_50_0, "DisplayRegularRank")

			local var_50_18 = arg_50_0.currentRank + 1

			arg_50_0.AARProgressBar:InitProgressBarRank(arg_50_1, arg_50_0.currentRank, var_50_18)
		end
	end

	arg_50_0.AARRankUpContainer:SetAlpha(0)

	arg_50_0.currentDisplayType = AAR.ProgressTypes.MATCH_XP
	arg_50_0.earnedTypeXP = arg_50_0.matchInfoPackage[arg_50_0.currentDisplayType].value
	arg_50_0.startCommonCrate = var_50_0.startCommonCrate
	arg_50_0.currentCommonCrate = var_50_0.currentCommonCrate

	local var_50_19 = arg_50_0._isFromBattlepassAAR and 100 or var_0_0

	arg_50_0:Wait(var_50_19).onComplete = function()
		arg_50_0._currentStateIndex = 1

		if arg_50_0._isFromBattlepassAAR then
			var_0_8(arg_50_0, arg_50_1, false, 0)
			var_0_9(arg_50_0, arg_50_1, false, 0)

			arg_50_0._currentStateIndex = AAR.ParadeState.WEAPON_UNLOCKS
		end

		local var_51_0 = ParadeStateFlowTable[arg_50_0._currentStateIndex]

		while not var_51_0.EnterConditionFunction(arg_50_0, arg_50_1) do
			arg_50_0._currentStateIndex = arg_50_0._currentStateIndex + 1

			if arg_50_0._currentStateIndex > #ParadeStateFlowTable then
				ParadeStateFlowTable.ExitFunction(arg_50_0, arg_50_1)

				return
			else
				var_51_0 = ParadeStateFlowTable[arg_50_0._currentStateIndex]
			end
		end

		arg_50_0.SpecialLabel:SetDecodeParams(0, 0, 0)
		var_51_0.DisplayFunction(arg_50_0, arg_50_1)
	end
end

local function var_0_28(arg_52_0, arg_52_1)
	ACTIONS.AnimateSequence(arg_52_0, "Outro")
	AAR.CheckAndShowBattlePassPurchasePopup(arg_52_1)

	arg_52_0:Wait(var_0_1).onComplete = function()
		arg_52_0:dispatchEventToCurrentMenu({
			name = AAR.PARADE_DONE
		})
		ACTIONS.AdvancePostGame(arg_52_0)
	end
end

function PostLoadFunc(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_0:getFirstChild()

	while var_54_0 do
		var_54_0 = var_54_0:getNextSibling(), var_54_0:SetIgnoreTweenLateness(false)
	end

	arg_54_0._newAttachmentWidgets = {
		arg_54_0.NewAttachment1,
		arg_54_0.NewAttachment2,
		arg_54_0.NewAttachment3
	}
	arg_54_0._isDoubleXP = LOOT.IsDoubleXPActiveByType(arg_54_1, LOOT.doubleXPType.ANY)
	arg_54_0._isWeaponDoubleXP = LOOT.IsDoubleWeaponXPActiveByType(arg_54_1, LOOT.doubleXPType.ANY)
	arg_54_0._isFromBattlepassAAR = arg_54_2.fromBattlepassAAR
	arg_54_0.weaponUnlocks = arg_54_2.gunsmithDataPackage
	arg_54_0.camoUnlocks = AAR.GetGunsmithCamoUnlockPackage(arg_54_1, arg_54_2.matchDataPackage.unlocks)
	arg_54_0.matchDataPackage = arg_54_2.matchDataPackage
	arg_54_0.accoladesPackage = AAR.GetAccoladesPackage(arg_54_1)
	arg_54_0.KeyRewardStateUpdate = var_0_21
	arg_54_0.DisplayAARParadeUnlocksInTurn = var_0_17
	arg_54_0.DisplayAARParadeCamoUnlocksInTurn = var_0_19

	local var_54_1 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = false,
		controllerIndex = arg_54_1
	})

	arg_54_0:addElement(var_54_1)

	ParadeStateFlowTable[AAR.ParadeState.XP_NONE].DisplayFunction = var_0_15
	ParadeStateFlowTable[AAR.ParadeState.XP].DisplayFunction = var_0_26
	ParadeStateFlowTable[AAR.ParadeState.DAILY_CHALLENGE_UNLOCKS].DisplayFunction = var_0_24
	ParadeStateFlowTable[AAR.ParadeState.BATTLE_PASS_XP].DisplayFunction = var_0_25
	ParadeStateFlowTable[AAR.ParadeState.WEAPON_UNLOCKS].DisplayFunction = var_0_18
	ParadeStateFlowTable[AAR.ParadeState.WEAPON_CAMO_UNLOCKS].DisplayFunction = var_0_20
	ParadeStateFlowTable[AAR.ParadeState.KEY_REWARD].DisplayFunction = var_0_22
	ParadeStateFlowTable[AAR.ParadeState.COMMENDATIONS].DisplayFunction = var_0_23
	ParadeStateFlowTable.ExitFunction = var_0_28

	var_0_27(arg_54_0, arg_54_1)
	arg_54_0:registerEventHandler(AAR.PARADE_PROGRESS_DONE, function(arg_55_0, arg_55_1)
		var_0_10(arg_54_0, arg_54_1)
	end)
	arg_54_0:registerEventHandler(AAR.PARADE_BATTLE_PASS_DONE, function(arg_56_0, arg_56_1)
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressCircleStop)

		arg_54_0.battlePassXPFinished = true

		var_0_10(arg_54_0, arg_54_1)
	end)
	arg_54_0:registerEventHandler(AAR.PARADE_ELDER_RANK_INTRO_DONE, function(arg_57_0, arg_57_1)
		if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_54_1) then
			ACTIONS.AnimateSequence(arg_57_0, "ElderRankLayout")
			var_0_14(arg_57_0, arg_54_1, arg_57_0._elderRankIntroSavedData.earnedTypeXP)
		else
			arg_57_0.xpDisplayFinished = true

			var_0_10(arg_57_0, arg_54_1)
		end
	end)

	local var_54_2 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
	local var_54_3 = PlayercardUtils.GetFrontendDataSources(var_54_2, arg_54_1)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		arg_54_0.SmallPlayerCard:SetDataSource(var_54_3, arg_54_1)
	else
		arg_54_0.WZSmallPlayerCard:SetDataSource(var_54_3, arg_54_1)
	end

	arg_54_0.Mask:SetAlpha(1)
	arg_54_0.ElderProgressBar:SetMask(arg_54_0.Mask)
	ACTIONS.ScaleFullscreen(arg_54_0.Overlay)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_54_0, "AR")
	end
end

function AARParade(arg_58_0, arg_58_1)
	local var_58_0 = LUI.UIElement.new()

	var_58_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_58_0.id = "AARParade"
	var_58_0._animationSets = var_58_0._animationSets or {}
	var_58_0._sequences = var_58_0._sequences or {}

	local var_58_1 = arg_58_1 and arg_58_1.controllerIndex

	if not var_58_1 and not Engine.DDJFBBJAIG() then
		var_58_1 = var_58_0:getRootController()
	end

	assert(var_58_1)

	local var_58_2 = var_58_0
	local var_58_3
	local var_58_4 = MenuBuilder.BuildRegisteredType("BannerGradient", {
		controllerIndex = var_58_1
	})

	var_58_4.id = "XPHighlightBanner"

	var_58_4:SetAlpha(0, 0)
	var_58_4:SetPixelGridEnabled(true)
	var_58_4:SetPixelGridContrast(0.5, 0)
	var_58_4:SetPixelGridBlockWidth(2, 0)
	var_58_4:SetPixelGridBlockHeight(2, 0)
	var_58_4:SetPixelGridGutterWidth(1, 0)
	var_58_4:SetPixelGridGutterHeight(1, 0)
	var_58_4.BGAdd:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_58_4.BGMult:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_58_4.BGMult:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_58_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -900, _1080p * 904, _1080p * -16, _1080p * 56)
	var_58_0:addElement(var_58_4)

	var_58_0.XPHighlightBanner = var_58_4

	local var_58_5

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		var_58_5 = MenuBuilder.BuildRegisteredType("AARIGRXPBonusTip", {
			controllerIndex = var_58_1
		})
		var_58_5.id = "AARIGRXPBonusTip"

		var_58_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1360, _1080p * 543, _1080p * 743)
		var_58_0:addElement(var_58_5)

		var_58_0.AARIGRXPBonusTip = var_58_5
	end

	local var_58_6
	local var_58_7 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_58_1
	})

	var_58_7.id = "EarnRateBuff"

	var_58_7:SetAlpha(0, 0)
	var_58_7.EarnRate:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_58_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 859, _1080p * 1059, _1080p * 855, _1080p * 887)
	var_58_0:addElement(var_58_7)

	var_58_0.EarnRateBuff = var_58_7

	local var_58_8
	local var_58_9 = LUI.UIStyledText.new()

	var_58_9.id = "XPValue"

	var_58_9:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_58_9:setText("", 0)
	var_58_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_58_9:SetWordWrap(false)
	var_58_9:SetAlignment(LUI.Alignment.Right)
	var_58_9:SetVerticalAlignment(LUI.Alignment.Center)
	var_58_9:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_58_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -280, _1080p * 120, _1080p * 524, _1080p * 594)
	var_58_0:addElement(var_58_9)

	var_58_0.XPValue = var_58_9

	local var_58_10
	local var_58_11 = MenuBuilder.BuildRegisteredType("AARProgressBar", {
		controllerIndex = var_58_1
	})

	var_58_11.id = "AARProgressBar"

	var_58_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -750, _1080p * 750, _1080p * -346, _1080p * -246)
	var_58_0:addElement(var_58_11)

	var_58_0.AARProgressBar = var_58_11

	local var_58_12
	local var_58_13 = MenuBuilder.BuildRegisteredType("AARRankUpContainer", {
		controllerIndex = var_58_1
	})

	var_58_13.id = "AARRankUpContainer"

	var_58_13:SetAlpha(0, 0)
	var_58_13:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_58_0:addElement(var_58_13)

	var_58_0.AARRankUpContainer = var_58_13

	local var_58_14
	local var_58_15 = LUI.UIStyledText.new()

	var_58_15.id = "XPType"

	var_58_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_58_15:setText("", 0)
	var_58_15:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_58_15:SetWordWrap(false)
	var_58_15:SetAlignment(LUI.Alignment.Center)
	var_58_15:SetDecodeLetterLength(20)
	var_58_15:SetDecodeMaxRandChars(6)
	var_58_15:SetDecodeUpdatesPerLetter(4)
	var_58_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 200, _1080p * 260)
	var_58_0:addElement(var_58_15)

	var_58_0.XPType = var_58_15

	local var_58_16
	local var_58_17 = LUI.UIStyledText.new()

	var_58_17.id = "SpecialLabel"

	var_58_17:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_58_17:SetAlpha(0, 0)
	var_58_17:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK"), 0)
	var_58_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_58_17:SetAlignment(LUI.Alignment.Center)
	var_58_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 342, _1080p * 1582, _1080p * 405, _1080p * 525)
	var_58_0:addElement(var_58_17)

	var_58_0.SpecialLabel = var_58_17

	local var_58_18
	local var_58_19 = LUI.UIText.new()

	var_58_19.id = "ElderRankValue"

	var_58_19:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_58_19:SetAlpha(0, 0)
	var_58_19:setText("", 0)
	var_58_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_58_19:SetWordWrap(false)
	var_58_19:SetAlignment(LUI.Alignment.Center)
	var_58_19:SetVerticalAlignment(LUI.Alignment.Center)
	var_58_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 782, _1080p * 1138, _1080p * 693, _1080p * 711)
	var_58_0:addElement(var_58_19)

	var_58_0.ElderRankValue = var_58_19

	local var_58_20
	local var_58_21 = LUI.UIText.new()

	var_58_21.id = "ElderRankName"

	var_58_21:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_58_21:SetAlpha(0, 0)
	var_58_21:setText(ToUpperCase(""), 0)
	var_58_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_58_21:SetWordWrap(false)
	var_58_21:SetAlignment(LUI.Alignment.Center)
	var_58_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 804, _1080p * 1116, _1080p * 669, _1080p * 693)
	var_58_0:addElement(var_58_21)

	var_58_0.ElderRankName = var_58_21

	local var_58_22
	local var_58_23 = LUI.UIImage.new()

	var_58_23.id = "ElderRankIcon"

	var_58_23:SetAlpha(0, 0)
	var_58_23:SetScale(-0.2, 0)
	var_58_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 833, _1080p * 1087, _1080p * 413, _1080p * 669)
	var_58_0:addElement(var_58_23)

	var_58_0.ElderRankIcon = var_58_23

	local var_58_24
	local var_58_25 = {
		Progress_segmentMaterial = "progress_circle_segment_big",
		controllerIndex = var_58_1
	}
	local var_58_26 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", var_58_25)

	var_58_26.id = "ElderProgressBar"

	var_58_26:SetAlpha(0, 0)
	var_58_26.Backer:setImage(RegisterMaterial("progress_circle_big"), 0)
	var_58_26.Progress:setImage(RegisterMaterial("progress_circle_segment_big"), 0)
	var_58_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1200, _1080p * 352, _1080p * 832)
	var_58_0:addElement(var_58_26)

	var_58_0.ElderProgressBar = var_58_26

	local var_58_27
	local var_58_28 = LUI.UIStyledText.new()

	var_58_28.id = "ProgressText"

	var_58_28:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_58_28:setText("", 0)
	var_58_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_58_28:SetWordWrap(false)
	var_58_28:SetAlignment(LUI.Alignment.Center)
	var_58_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 570, _1080p * 1354, _1080p * 130, _1080p * 200)
	var_58_0:addElement(var_58_28)

	var_58_0.ProgressText = var_58_28

	local var_58_29
	local var_58_30 = LUI.UIImage.new()

	var_58_30.id = "Mask"

	var_58_30:SetAlpha(0, 0)
	var_58_30:SetScale(0, 0)
	var_58_30:setImage(RegisterMaterial("minimap_circle_mask"), 0)
	var_58_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 719, _1080p * 1199, _1080p * 316, _1080p * 796)
	var_58_0:addElement(var_58_30)

	var_58_0.Mask = var_58_30

	local var_58_31
	local var_58_32 = LUI.UIImage.new()

	var_58_32.id = "Overlay"

	var_58_32:SetRGBFromInt(0, 0)
	var_58_32:SetAlpha(0, 0)
	var_58_0:addElement(var_58_32)

	var_58_0.Overlay = var_58_32

	local var_58_33

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_58_34 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
			controllerIndex = var_58_1
		})

		var_58_34.id = "SmallPlayerCard"

		var_58_34.GradientBacker:SetAlpha(0, 0)
		var_58_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 1222, _1080p * 855, _1080p * 979)
		var_58_0:addElement(var_58_34)

		var_58_0.SmallPlayerCard = var_58_34
	end

	local var_58_35

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_58_36 = MenuBuilder.BuildRegisteredType("WZSmallPlayerCard", {
			controllerIndex = var_58_1
		})

		var_58_36.id = "WZSmallPlayerCard"

		var_58_36.GradientBacker:SetAlpha(0, 0)
		var_58_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 1222, _1080p * 855, _1080p * 979)
		var_58_0:addElement(var_58_36)

		var_58_0.WZSmallPlayerCard = var_58_36
	end

	local var_58_37
	local var_58_38 = LUI.UIStyledText.new()

	var_58_38.id = "DoubleXPLabel"

	var_58_38:SetAlpha(0, 0)
	var_58_38:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DOUBLE_XP_ACTIVE"), 0)
	var_58_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_58_38:SetAlignment(LUI.Alignment.Left)
	var_58_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 782, _1080p * 1278, _1080p * 278, _1080p * 318)
	var_58_0:addElement(var_58_38)

	var_58_0.DoubleXPLabel = var_58_38

	local var_58_39
	local var_58_40 = LUI.UIStyledText.new()

	var_58_40.id = "KeyRewardValue"

	var_58_40:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_58_40:SetAlpha(0, 0)
	var_58_40:setText("", 0)
	var_58_40:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_58_40:SetAlignment(LUI.Alignment.Center)
	var_58_40:SetVerticalAlignment(LUI.Alignment.Center)
	var_58_40:SetShadowRGBFromTable(SWATCHES.AAR.Highlight, 0)
	var_58_40:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -201, _1080p * 199, _1080p * 562, _1080p * 632)
	var_58_0:addElement(var_58_40)

	var_58_0.KeyRewardValue = var_58_40

	local var_58_41
	local var_58_42 = LUI.UIImage.new()

	var_58_42.id = "KeyRewardIcon"

	var_58_42:SetAlpha(0, 0)
	var_58_42:setImage(RegisterMaterial("icon_currency_keypoints"), 0)
	var_58_42:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 306, _1080p * 562)
	var_58_0:addElement(var_58_42)

	var_58_0.KeyRewardIcon = var_58_42

	local var_58_43
	local var_58_44 = LUI.UIImage.new()

	var_58_44.id = "XPIconShadow"

	var_58_44:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_58_44:SetAlpha(0, 0)
	var_58_44:SetScale(1, 0)
	var_58_44:SetPixelGridEnabled(true)
	var_58_44:SetPixelGridContrast(0.5, 0)
	var_58_44:SetPixelGridBlockWidth(2, 0)
	var_58_44:SetPixelGridBlockHeight(2, 0)
	var_58_44:SetPixelGridGutterWidth(1, 0)
	var_58_44:SetPixelGridGutterHeight(1, 0)
	var_58_44:setImage(RegisterMaterial("aar_doubleXP_pixels"), 0)
	var_58_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 870, _1080p * 1054, _1080p * 342, _1080p * 526)
	var_58_0:addElement(var_58_44)

	var_58_0.XPIconShadow = var_58_44

	local var_58_45
	local var_58_46 = LUI.UIImage.new()

	var_58_46.id = "XPIcon"

	var_58_46:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_58_46:SetAlpha(0, 0)
	var_58_46:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_58_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 898, _1080p * 1026, _1080p * 370, _1080p * 498)
	var_58_0:addElement(var_58_46)

	var_58_0.XPIcon = var_58_46

	local var_58_47
	local var_58_48 = LUI.UIImage.new()

	var_58_48.id = "WeaponIcon"

	var_58_48:SetAlpha(0, 0)
	var_58_48:setImage(RegisterMaterial("icon_currency_keypoints"), 0)
	var_58_48:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 248, _1080p * 504)
	var_58_0:addElement(var_58_48)

	var_58_0.WeaponIcon = var_58_48

	local var_58_49
	local var_58_50 = MenuBuilder.BuildRegisteredType("AARParadeAttachment", {
		controllerIndex = var_58_1
	})

	var_58_50.id = "NewAttachment1"

	var_58_50:SetAlpha(0, 0)
	var_58_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 302, _1080p * 702, _1080p * 541, _1080p * 765)
	var_58_0:addElement(var_58_50)

	var_58_0.NewAttachment1 = var_58_50

	local var_58_51
	local var_58_52 = MenuBuilder.BuildRegisteredType("AARParadeAttachment", {
		controllerIndex = var_58_1
	})

	var_58_52.id = "NewAttachment2"

	var_58_52:SetAlpha(0, 0)
	var_58_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 782, _1080p * 1182, _1080p * 541, _1080p * 765)
	var_58_0:addElement(var_58_52)

	var_58_0.NewAttachment2 = var_58_52

	local var_58_53
	local var_58_54 = MenuBuilder.BuildRegisteredType("AARParadeAttachment", {
		controllerIndex = var_58_1
	})

	var_58_54.id = "NewAttachment3"

	var_58_54:SetAlpha(0, 0)
	var_58_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1262, _1080p * 1662, _1080p * 541, _1080p * 765)
	var_58_0:addElement(var_58_54)

	var_58_0.NewAttachment3 = var_58_54

	local var_58_55
	local var_58_56 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_58_1
	})

	var_58_56.id = "Cinematic"

	var_58_56:SetAlpha(0, 0)
	var_58_56:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_58_0:addElement(var_58_56)

	var_58_0.Cinematic = var_58_56

	local var_58_57
	local var_58_58 = LUI.UIText.new()

	var_58_58.id = "MaxRankLabel"

	var_58_58:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_58_58:SetAlpha(0, 0)
	var_58_58:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK"), 0)
	var_58_58:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_58_58:SetAlignment(LUI.Alignment.Left)
	var_58_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 848, _1080p * 1070, _1080p * 789, _1080p * 849)
	var_58_0:addElement(var_58_58)

	var_58_0.MaxRankLabel = var_58_58

	local var_58_59
	local var_58_60 = LUI.UIText.new()

	var_58_60.id = "MessageLabel"

	var_58_60:SetAlpha(0, 0)
	var_58_60:setText("", 0)
	var_58_60:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_58_60:SetAlignment(LUI.Alignment.Center)
	var_58_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 645, _1080p * 1319, _1080p * 504, _1080p * 522)
	var_58_0:addElement(var_58_60)

	var_58_0.MessageLabel = var_58_60

	local var_58_61
	local var_58_62 = MenuBuilder.BuildRegisteredType("AARParadeCommendations", {
		controllerIndex = var_58_1
	})

	var_58_62.id = "AARParadeCommendations"

	var_58_62:SetAlpha(0, 0)
	var_58_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1922, 0, _1080p * 1080)
	var_58_0:addElement(var_58_62)

	var_58_0.AARParadeCommendations = var_58_62

	local var_58_63
	local var_58_64 = MenuBuilder.BuildRegisteredType("AARDailyChallenges", {
		controllerIndex = var_58_1
	})

	var_58_64.id = "AARDailyChallenges"

	var_58_64:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_58_0:addElement(var_58_64)

	var_58_0.AARDailyChallenges = var_58_64

	local function var_58_65()
		return
	end

	var_58_0._sequences.DefaultSequence = var_58_65

	local var_58_66
	local var_58_67 = {
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

	var_58_32:RegisterAnimationSequence("Outro", var_58_67)

	local function var_58_68()
		var_58_32:AnimateSequence("Outro")
	end

	var_58_0._sequences.Outro = var_58_68

	local var_58_69
	local var_58_70 = {
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

	var_58_32:RegisterAnimationSequence("Intro", var_58_70)

	local function var_58_71()
		var_58_32:AnimateSequence("Intro")
	end

	var_58_0._sequences.Intro = var_58_71

	local var_58_72
	local var_58_73 = {
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

	var_58_4:RegisterAnimationSequence("FlashXPHighlight", var_58_73)

	local function var_58_74()
		var_58_4:AnimateSequence("FlashXPHighlight")
	end

	var_58_0._sequences.FlashXPHighlight = var_58_74

	local var_58_75
	local var_58_76 = {
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

	var_58_4:RegisterAnimationSequence("DisplayRegularRank", var_58_76)

	local var_58_77 = {
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

	var_58_9:RegisterAnimationSequence("DisplayRegularRank", var_58_77)

	local var_58_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_11:RegisterAnimationSequence("DisplayRegularRank", var_58_78)

	local var_58_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_19:RegisterAnimationSequence("DisplayRegularRank", var_58_79)

	local var_58_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_21:RegisterAnimationSequence("DisplayRegularRank", var_58_80)

	local var_58_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_23:RegisterAnimationSequence("DisplayRegularRank", var_58_81)

	local var_58_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_26:RegisterAnimationSequence("DisplayRegularRank", var_58_82)

	local var_58_83 = {
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

	var_58_44:RegisterAnimationSequence("DisplayRegularRank", var_58_83)

	local var_58_84 = {
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

	var_58_46:RegisterAnimationSequence("DisplayRegularRank", var_58_84)

	local function var_58_85()
		var_58_4:AnimateSequence("DisplayRegularRank")
		var_58_9:AnimateSequence("DisplayRegularRank")
		var_58_11:AnimateSequence("DisplayRegularRank")
		var_58_19:AnimateSequence("DisplayRegularRank")
		var_58_21:AnimateSequence("DisplayRegularRank")
		var_58_23:AnimateSequence("DisplayRegularRank")
		var_58_26:AnimateSequence("DisplayRegularRank")
		var_58_44:AnimateSequence("DisplayRegularRank")
		var_58_46:AnimateSequence("DisplayRegularRank")
	end

	var_58_0._sequences.DisplayRegularRank = var_58_85

	local var_58_86
	local var_58_87 = {
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

	var_58_4:RegisterAnimationSequence("DisplayElderRank", var_58_87)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_58_88 = {
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

		var_58_5:RegisterAnimationSequence("DisplayElderRank", var_58_88)
	end

	local var_58_89 = {
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

	var_58_9:RegisterAnimationSequence("DisplayElderRank", var_58_89)

	local var_58_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_11:RegisterAnimationSequence("DisplayElderRank", var_58_90)

	local var_58_91 = {
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

	var_58_19:RegisterAnimationSequence("DisplayElderRank", var_58_91)

	local var_58_92 = {
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

	var_58_21:RegisterAnimationSequence("DisplayElderRank", var_58_92)

	local var_58_93 = {
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

	var_58_23:RegisterAnimationSequence("DisplayElderRank", var_58_93)

	local var_58_94 = {
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

	var_58_26:RegisterAnimationSequence("DisplayElderRank", var_58_94)

	local var_58_95 = {
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

	var_58_30:RegisterAnimationSequence("DisplayElderRank", var_58_95)

	local var_58_96 = {
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

	var_58_44:RegisterAnimationSequence("DisplayElderRank", var_58_96)

	local var_58_97 = {
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

	var_58_46:RegisterAnimationSequence("DisplayElderRank", var_58_97)

	local function var_58_98()
		var_58_4:AnimateSequence("DisplayElderRank")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_58_5:AnimateSequence("DisplayElderRank")
		end

		var_58_9:AnimateSequence("DisplayElderRank")
		var_58_11:AnimateSequence("DisplayElderRank")
		var_58_19:AnimateSequence("DisplayElderRank")
		var_58_21:AnimateSequence("DisplayElderRank")
		var_58_23:AnimateSequence("DisplayElderRank")
		var_58_26:AnimateSequence("DisplayElderRank")
		var_58_30:AnimateSequence("DisplayElderRank")
		var_58_44:AnimateSequence("DisplayElderRank")
		var_58_46:AnimateSequence("DisplayElderRank")
	end

	var_58_0._sequences.DisplayElderRank = var_58_98

	local var_58_99
	local var_58_100 = {
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

	var_58_40:RegisterAnimationSequence("KeyReward", var_58_100)

	local var_58_101 = {
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

	var_58_42:RegisterAnimationSequence("KeyReward", var_58_101)

	local function var_58_102()
		var_58_40:AnimateSequence("KeyReward")
		var_58_42:AnimateSequence("KeyReward")
	end

	var_58_0._sequences.KeyReward = var_58_102

	local var_58_103
	local var_58_104 = {
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

	var_58_48:RegisterAnimationSequence("UnlocksFadeIn3", var_58_104)

	local var_58_105 = {
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

	var_58_50:RegisterAnimationSequence("UnlocksFadeIn3", var_58_105)

	local var_58_106 = {
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

	var_58_52:RegisterAnimationSequence("UnlocksFadeIn3", var_58_106)

	local var_58_107 = {
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

	var_58_54:RegisterAnimationSequence("UnlocksFadeIn3", var_58_107)

	local function var_58_108()
		var_58_48:AnimateSequence("UnlocksFadeIn3")
		var_58_50:AnimateSequence("UnlocksFadeIn3")
		var_58_52:AnimateSequence("UnlocksFadeIn3")
		var_58_54:AnimateSequence("UnlocksFadeIn3")
	end

	var_58_0._sequences.UnlocksFadeIn3 = var_58_108

	local var_58_109
	local var_58_110 = {
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

	var_58_48:RegisterAnimationSequence("UnlocksFadeIn2", var_58_110)

	local var_58_111 = {
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

	var_58_50:RegisterAnimationSequence("UnlocksFadeIn2", var_58_111)

	local var_58_112 = {
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

	var_58_52:RegisterAnimationSequence("UnlocksFadeIn2", var_58_112)

	local var_58_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_54:RegisterAnimationSequence("UnlocksFadeIn2", var_58_113)

	local function var_58_114()
		var_58_48:AnimateSequence("UnlocksFadeIn2")
		var_58_50:AnimateSequence("UnlocksFadeIn2")
		var_58_52:AnimateSequence("UnlocksFadeIn2")
		var_58_54:AnimateSequence("UnlocksFadeIn2")
	end

	var_58_0._sequences.UnlocksFadeIn2 = var_58_114

	local var_58_115
	local var_58_116 = {
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

	var_58_48:RegisterAnimationSequence("UnlocksFadeIn1", var_58_116)

	local var_58_117 = {
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

	var_58_50:RegisterAnimationSequence("UnlocksFadeIn1", var_58_117)

	local var_58_118 = {
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

	var_58_52:RegisterAnimationSequence("UnlocksFadeIn1", var_58_118)

	local var_58_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_54:RegisterAnimationSequence("UnlocksFadeIn1", var_58_119)

	local function var_58_120()
		var_58_48:AnimateSequence("UnlocksFadeIn1")
		var_58_50:AnimateSequence("UnlocksFadeIn1")
		var_58_52:AnimateSequence("UnlocksFadeIn1")
		var_58_54:AnimateSequence("UnlocksFadeIn1")
	end

	var_58_0._sequences.UnlocksFadeIn1 = var_58_120

	local var_58_121
	local var_58_122 = {
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

	var_58_48:RegisterAnimationSequence("UnlocksFadeOut3", var_58_122)

	local var_58_123 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_50:RegisterAnimationSequence("UnlocksFadeOut3", var_58_123)

	local var_58_124 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_52:RegisterAnimationSequence("UnlocksFadeOut3", var_58_124)

	local var_58_125 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_54:RegisterAnimationSequence("UnlocksFadeOut3", var_58_125)

	local function var_58_126()
		var_58_48:AnimateSequence("UnlocksFadeOut3")
		var_58_50:AnimateSequence("UnlocksFadeOut3")
		var_58_52:AnimateSequence("UnlocksFadeOut3")
		var_58_54:AnimateSequence("UnlocksFadeOut3")
	end

	var_58_0._sequences.UnlocksFadeOut3 = var_58_126

	local var_58_127
	local var_58_128 = {
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

	var_58_48:RegisterAnimationSequence("UnlocksFadeOut2", var_58_128)

	local var_58_129 = {
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

	var_58_50:RegisterAnimationSequence("UnlocksFadeOut2", var_58_129)

	local var_58_130 = {
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

	var_58_52:RegisterAnimationSequence("UnlocksFadeOut2", var_58_130)

	local var_58_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_54:RegisterAnimationSequence("UnlocksFadeOut2", var_58_131)

	local function var_58_132()
		var_58_48:AnimateSequence("UnlocksFadeOut2")
		var_58_50:AnimateSequence("UnlocksFadeOut2")
		var_58_52:AnimateSequence("UnlocksFadeOut2")
		var_58_54:AnimateSequence("UnlocksFadeOut2")
	end

	var_58_0._sequences.UnlocksFadeOut2 = var_58_132

	local var_58_133
	local var_58_134 = {
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

	var_58_48:RegisterAnimationSequence("UnlocksFadeOut1", var_58_134)

	local var_58_135 = {
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

	var_58_50:RegisterAnimationSequence("UnlocksFadeOut1", var_58_135)

	local var_58_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_52:RegisterAnimationSequence("UnlocksFadeOut1", var_58_136)

	local var_58_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_54:RegisterAnimationSequence("UnlocksFadeOut1", var_58_137)

	local function var_58_138()
		var_58_48:AnimateSequence("UnlocksFadeOut1")
		var_58_50:AnimateSequence("UnlocksFadeOut1")
		var_58_52:AnimateSequence("UnlocksFadeOut1")
		var_58_54:AnimateSequence("UnlocksFadeOut1")
	end

	var_58_0._sequences.UnlocksFadeOut1 = var_58_138

	local var_58_139
	local var_58_140 = {
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

	var_58_32:RegisterAnimationSequence("RankUp", var_58_140)

	local function var_58_141()
		var_58_32:AnimateSequence("RankUp")
	end

	var_58_0._sequences.RankUp = var_58_141

	local var_58_142
	local var_58_143 = {
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

	var_58_44:RegisterAnimationSequence("FlashDoubleXPIcon", var_58_143)

	local var_58_144 = {
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

	var_58_46:RegisterAnimationSequence("FlashDoubleXPIcon", var_58_144)

	local function var_58_145()
		var_58_44:AnimateSequence("FlashDoubleXPIcon")
		var_58_46:AnimateSequence("FlashDoubleXPIcon")
	end

	var_58_0._sequences.FlashDoubleXPIcon = var_58_145

	local var_58_146
	local var_58_147 = {
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

	var_58_4:RegisterAnimationSequence("ElderRankLayout", var_58_147)

	local var_58_148 = {
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

	var_58_9:RegisterAnimationSequence("ElderRankLayout", var_58_148)

	local var_58_149 = {
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

	var_58_19:RegisterAnimationSequence("ElderRankLayout", var_58_149)

	local var_58_150 = {
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

	var_58_21:RegisterAnimationSequence("ElderRankLayout", var_58_150)

	local var_58_151 = {
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

	var_58_23:RegisterAnimationSequence("ElderRankLayout", var_58_151)

	local var_58_152 = {
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

	var_58_26:RegisterAnimationSequence("ElderRankLayout", var_58_152)

	local var_58_153 = {
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

	var_58_30:RegisterAnimationSequence("ElderRankLayout", var_58_153)

	local var_58_154 = {
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

	var_58_44:RegisterAnimationSequence("ElderRankLayout", var_58_154)

	local var_58_155 = {
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

	var_58_46:RegisterAnimationSequence("ElderRankLayout", var_58_155)

	local function var_58_156()
		var_58_4:AnimateSequence("ElderRankLayout")
		var_58_9:AnimateSequence("ElderRankLayout")
		var_58_19:AnimateSequence("ElderRankLayout")
		var_58_21:AnimateSequence("ElderRankLayout")
		var_58_23:AnimateSequence("ElderRankLayout")
		var_58_26:AnimateSequence("ElderRankLayout")
		var_58_30:AnimateSequence("ElderRankLayout")
		var_58_44:AnimateSequence("ElderRankLayout")
		var_58_46:AnimateSequence("ElderRankLayout")
	end

	var_58_0._sequences.ElderRankLayout = var_58_156

	local var_58_157
	local var_58_158 = {
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

	var_58_46:RegisterAnimationSequence("FlashDoubleXPIconElder", var_58_158)

	local function var_58_159()
		var_58_46:AnimateSequence("FlashDoubleXPIconElder")
	end

	var_58_0._sequences.FlashDoubleXPIconElder = var_58_159

	local var_58_160
	local var_58_161 = {
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

	var_58_44:RegisterAnimationSequence("FlashWeaponDoubleXPIcon", var_58_161)

	local var_58_162 = {
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

	var_58_46:RegisterAnimationSequence("FlashWeaponDoubleXPIcon", var_58_162)

	local function var_58_163()
		var_58_44:AnimateSequence("FlashWeaponDoubleXPIcon")
		var_58_46:AnimateSequence("FlashWeaponDoubleXPIcon")
	end

	var_58_0._sequences.FlashWeaponDoubleXPIcon = var_58_163

	local var_58_164
	local var_58_165 = {
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

	var_58_46:RegisterAnimationSequence("XPIconFadeout", var_58_165)

	local function var_58_166()
		var_58_46:AnimateSequence("XPIconFadeout")
	end

	var_58_0._sequences.XPIconFadeout = var_58_166

	local var_58_167
	local var_58_168 = {
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

	var_58_60:RegisterAnimationSequence("AR", var_58_168)

	local function var_58_169()
		var_58_60:AnimateSequence("AR")
	end

	var_58_0._sequences.AR = var_58_169

	PostLoadFunc(var_58_0, var_58_1, arg_58_1)
	ACTIONS.AnimateSequence(var_58_0, "Intro")

	return var_58_0
end

MenuBuilder.registerType("AARParade", AARParade)
LockTable(_M)
