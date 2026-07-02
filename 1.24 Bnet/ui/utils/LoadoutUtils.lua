Cac = Cac or {}
LOADOUT = LOADOUT or {}
Cac.MaxStatValue = 100
Cac.BaseLootID = 0
Cac.LowestQuality = 0
Cac.HighestQuality = 4
Cac.BaseVariantID = -1
Cac.NumWeaponSetups = 2
Cac.NumEquipmentSetups = 2
Cac.NumAttachments = Engine.CAADCDEEIA() and 3 or 6
Cac.NumLoadoutPerks = 3
Cac.NumLoadoutExtraPerks = 3
Cac.NumExtraPerks = 3
Cac.NumEquipSlots = 2
Cac.NumOffhandEquipSlots = 2
LOADOUT.DefaultClassCount = 5
Cac.LoadoutDraftPhaseChangeTimer = 11
Cac.spLockStates = {
	SCANNED = "scanned",
	UNLOCKED = "unlocked",
	LOCKED = "locked"
}
Cac.PerkTypes = {
	SPECIAL_THREE = 6,
	PASSIVE = 3,
	SPECIAL_ONE = 4,
	CORE = 1,
	SPECIAL_TWO = 5,
	ACTIVE = 2,
	NONE = 0
}

function Cac.GetPick10UnlockRank(arg_1_0)
	return StringTable.DIFCHIGDFB(CSV.pick10UnlockTable.file, CSV.pick10UnlockTable.cols.ref, arg_1_0, CSV.pick10UnlockTable.cols.unlockRank)
end

function Cac.GetPick10ItemName(arg_2_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.pick10Slots.file, CSV.pick10Slots.cols.ref, arg_2_0, CSV.pick10Slots.cols.locRef))
end

function Cac.GetPick10ItemImage(arg_3_0)
	return StringTable.DIFCHIGDFB(CSV.pick10Slots.file, CSV.pick10Slots.cols.ref, arg_3_0, CSV.pick10Slots.cols.image)
end

function Cac.GetPick10ItemDesc(arg_4_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.pick10Slots.file, CSV.pick10Slots.cols.ref, arg_4_0, CSV.pick10Slots.cols.desc))
end

function Cac.UpdateNewItemNotification(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	return
end

function LOADOUT.GetLoadoutStatsGroup()
	if CONDITIONS.AreRestrictionsActive(Engine.IJEBHJIJF()) or CONDITIONS.IsInGameBattlesMatch() then
		return CoD.StatsGroup.PrivateLoadouts
	end

	if CONDITIONS.IsThirdGameMode(self) then
		if IsSystemLink() then
			return CoD.StatsGroup.PrivateLoadouts
		else
			return CoD.StatsGroup.RankedLoadouts
		end
	elseif CONDITIONS.IsPublicMatch() then
		return CoD.StatsGroup.RankedLoadouts
	else
		return CoD.StatsGroup.PrivateLoadouts
	end
end

function Cac.ClearNewItemNotification(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	return
end

function Cac.IsUnlockedEsports(arg_8_0)
	return not CONDITIONS.IsDraftEnabled() or arg_8_0
end

function Cac.SetupLoadoutDraftTimerRefresh(arg_9_0)
	assert(arg_9_0.Seconds)

	local var_9_0

	local function var_9_1()
		arg_9_0:Wait(100).onComplete = function()
			return var_9_1()
		end

		local var_10_0 = LoadoutDrafting.CGCGHIJDFF()

		if var_10_0 > 10 and arg_9_0.lastAnimPlayed ~= "Reset" then
			arg_9_0.lastAnimPlayed = "Reset"

			ACTIONS.AnimateSequence(arg_9_0, "Reset")
		end

		DataSources.frontEnd.MP.cwl.drafting.countdownTime:SetValue(controllerIndex, var_10_0)

		if var_10_0 <= 10 and arg_9_0.oldTimeRemaining ~= var_10_0 then
			arg_9_0.oldTimeRemaining = var_10_0

			Engine.GDEGAIEID(var_10_0)

			if var_10_0 <= 10 and var_10_0 > 5 and arg_9_0.lastAnimPlayed ~= "TenSecondsRemaining" then
				arg_9_0.lastAnimPlayed = "TenSecondsRemaining"

				ACTIONS.AnimateSequence(arg_9_0, "TenSecondsRemaining")
			end

			if var_10_0 <= 5 and arg_9_0.lastAnimPlayed ~= "FiveSecondsRemaining" then
				arg_9_0.lastAnimPlayed = "FiveSecondsRemaining"

				ACTIONS.AnimateSequence(arg_9_0, "FiveSecondsRemaining")
			end
		end
	end

	var_9_1()
end

function Cac.ClearLoadoutDraftTimerRefreshIfNeeded()
	local var_12_0 = Engine.DBFFAEEFGJ()

	if not Engine.DDJFBBJAIG() or not CONDITIONS.IsDraftEnabled() then
		if var_12_0.MPDraftModeTimer then
			var_12_0.MPDraftModeTimer:closeTree()

			var_12_0.MPDraftModeTimer = nil
		end

		return true
	end

	return false
end

function Cac.AdjustPreDraftCountdownPopup(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	if arg_13_3 < arg_13_2 then
		DataSources.frontEnd.MP.cwl.drafting.countdownTime:SetValue(arg_13_1, arg_13_3)

		if not arg_13_0.prePhaseCountdownOpen then
			arg_13_0.prePhaseCountdownOpen = true

			local var_13_0 = {
				draftPhaseText = arg_13_4,
				baseCountdownTime = arg_13_3,
				controllerIndex = arg_13_1
			}

			LUI.FlowManager.RequestPopupMenu(arg_13_0, "PreDraftCountdownPopup", true, arg_13_1, false, var_13_0)
		end
	else
		if arg_13_0.prePhaseCountdownOpen then
			arg_13_0.prePhaseCountdownOpen = nil

			LUI.FlowManager.RequestLeaveMenuByName("PreDraftCountdownPopup")
		end

		DataSources.frontEnd.MP.cwl.drafting.countdownTime:SetValue(arg_13_1, arg_13_2)
	end
end

function Cac.LoadoutDraftStartMatch(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if not arg_14_0.startingMatch then
		arg_14_0.startingMatch = true

		if MLG.BIHFEHBCFB(arg_14_1) ~= GAMEBATTLES.INVALID_MATCH_ID then
			Lobby.EAHFJBBBBD(PartyUIRoot.GAME_BATTLES_MATCH)
		end

		if IsSystemLink() then
			Lobby.DCJFBFGGHG(arg_14_1, true)
			LUI.UIRoot.BlockButtonInput(arg_14_2, false, "MenuTransition")
		else
			LUI.UIRoot.BlockButtonInput(arg_14_2, false, "TransitionToGame")
			Engine.EBIDFIDHIE("xpartygo 1")

			if arg_14_3 then
				CODCASTER.SetCODCastingEnabled(MP_COMMON.IsMatchRulesCODCastingEnabled(true))
			end
		end
	end
end

LOADOUT.DEFAULT_CP_LOADOUT = 0
LOADOUT.DEFAULT_LOADOUT_INDEX_START = 100

function LOADOUT.LookupDefaultClassItem(arg_15_0, arg_15_1, arg_15_2)
	return StringTable.DIFCHIGDFB(CSV.defaultClassTable:GetFile(arg_15_0), CSV.defaultClassTable.cols.itemRef, arg_15_2, CSV.defaultClassTable.cols.class1 + arg_15_1)
end

function LOADOUT.GetDefaultLoadouts(arg_16_0)
	local var_16_0 = {}

	for iter_16_0 = 0, LOADOUT.DefaultClassCount - 1 do
		local var_16_1 = {
			weapons = {}
		}

		for iter_16_1 = 0, 1 do
			local var_16_2 = iter_16_1 == WEAPON.PrimarySlot and "Primary" or "Secondary"
			local var_16_3 = {
				ref = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadout" .. var_16_2),
				camo = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadout" .. var_16_2 .. "Camo"),
				reticle = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadout" .. var_16_2 .. "Reticle"),
				attachments = {}
			}

			for iter_16_2 = 0, 5 do
				table.insert(var_16_3.attachments, LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadout" .. var_16_2 .. "Attachment" .. iter_16_2 + 1))
			end

			table.insert(var_16_1.weapons, var_16_3)
		end

		var_16_1.role = "none"
		var_16_1.munitions = "none"
		var_16_1.lethal = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutEquipment" .. "Primary")
		var_16_1.tactical = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutEquipment" .. "Secondary")
		var_16_1.perks = {}

		for iter_16_3 = 1, Cac.NumLoadoutPerks do
			local var_16_4 = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutPerk" .. iter_16_3)

			table.insert(var_16_1.perks, var_16_4)
		end

		if LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutSpecialist") == "TRUE" then
			var_16_1.extraPerks = {}

			for iter_16_4 = 1, Cac.NumLoadoutExtraPerks do
				local var_16_5 = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutExtraPerk" .. iter_16_4)

				table.insert(var_16_1.extraPerks, var_16_5)
			end
		end

		var_16_1.name = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutName")
		var_16_1.role = LOADOUT.LookupDefaultClassItem(arg_16_0, iter_16_0, "loadoutRole")

		table.insert(var_16_0, var_16_1)
	end

	return var_16_0
end

function LOADOUT.GetDefaultLoadoutWeaponTables(arg_17_0)
	local var_17_0 = LOADOUT.GetDefaultLoadouts(arg_17_0)
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		for iter_17_2, iter_17_3 in ipairs(iter_17_1.weapons) do
			local var_17_2 = LUI.ShallowCopy(iter_17_3)

			var_17_2.weapon = iter_17_3.ref
			var_17_2.ref = nil
			var_17_2.attachments = {}

			for iter_17_4, iter_17_5 in ipairs(iter_17_3.attachments) do
				table.insert(var_17_2.attachments, {
					ref = iter_17_5,
					variantID = ATTACHMENT.baseVariant
				})
			end

			table.insert(var_17_1, var_17_2)
		end
	end

	return var_17_1
end

function LOADOUT.GetLoadoutUpgradePerks(arg_18_0)
	if not Engine.DDJFBBJAIG() then
		local var_18_0 = ""
		local var_18_1 = ""
		local var_18_2 = ""
		local var_18_3, var_18_4 = LOADOUT.GetFavoriteLoadoutIndex(arg_18_0)

		if var_18_3 then
			if not var_18_4 then
				var_18_0 = LOADOUT.GetLoadoutSelectedPerk(arg_18_0, var_18_3, 0):get()
				var_18_1 = LOADOUT.GetLoadoutSelectedPerk(arg_18_0, var_18_3, 1):get()
				var_18_2 = LOADOUT.GetLoadoutSelectedPerk(arg_18_0, var_18_3, 2):get()
			else
				local var_18_5 = LOADOUT.GetDefaultLoadouts(arg_18_0)

				var_18_0 = var_18_5[var_18_3].perks[1]
				var_18_1 = var_18_5[var_18_3].perks[2]
				var_18_2 = var_18_5[var_18_3].perks[3]
			end
		end

		return var_18_1, var_18_2, var_18_0
	end
end

function LOADOUT.GetLoadoutPlayerData(arg_19_0, arg_19_1)
	return PlayerData.BFFBGAJGD(arg_19_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_19_1]
end

function LOADOUT.GetFavoriteLoadoutWeapons(arg_20_0)
	local var_20_0 = LOADOUT.GetFavoriteLoadoutIndex(arg_20_0)
	local var_20_1 = PlayerData.BFFBGAJGD(arg_20_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_20_0]
	local var_20_2 = var_20_1.weaponSetups[0]
	local var_20_3 = var_20_2.weapon:get()
	local var_20_4 = var_20_1.weaponSetups[1]
	local var_20_5 = var_20_4.weapon:get()
	local var_20_6 = WEAPON.GetWeaponModelNameFromPlayerData(var_20_3, var_20_2, {
		includeStickers = true,
		includeAttachments = true,
		useOperatorOverride = true,
		includeCamos = true,
		controllerIndex = arg_20_0
	})
	local var_20_7 = WEAPON.GetWeaponModelNameFromPlayerData(var_20_5, var_20_4, {
		includeStickers = true,
		includeAttachments = true,
		useOperatorOverride = true,
		includeCamos = true,
		controllerIndex = arg_20_0
	})

	return {
		primaryWeaponModel = var_20_6,
		secondaryWeaponModel = var_20_7,
		primaryWeaponRef = var_20_3,
		secondaryWeaponRef = var_20_5
	}
end

function LOADOUT.GetFavoriteLoadoutIndex(arg_21_0)
	local var_21_0 = PlayerData.BFFBGAJGD(arg_21_0, LOADOUT.GetLoadoutStatsGroup()).customizationFavorites.favoriteLoadoutIndex:get() or 0
	local var_21_1 = var_21_0 >= LOADOUT.DEFAULT_LOADOUT_INDEX_START

	if var_21_1 then
		var_21_0 = var_21_0 - LOADOUT.DEFAULT_LOADOUT_INDEX_START + 1
	end

	if var_21_0 < 0 then
		var_21_0 = 0
	end

	return var_21_0, var_21_1
end

function LOADOUT.SetFavoriteLoadout(arg_22_0, arg_22_1, arg_22_2)
	if IsOnlineMatch() then
		local var_22_0 = LOADOUT.GetLoadoutPlayerData(arg_22_1, arg_22_2)
		local var_22_1 = var_22_0.weaponSetups[0]
		local var_22_2 = var_22_1.weapon:get()
		local var_22_3 = LOOT.GetBaseWeaponItemID(var_22_2)
		local var_22_4 = WEAPON.GetWeaponModelNameFromPlayerData(var_22_2, var_22_1, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_22_1
		})

		FrontEndScene.RequestWeaponWorldModels({
			var_22_4
		})
		PlayerData.BFFBGAJGD(arg_22_1, LOADOUT.GetLoadoutStatsGroup()).customizationFavorites.favoriteLoadoutIndex:set(arg_22_2)

		if Engine.BICHEEFHEC(arg_22_1) then
			Engine.JICJIBH(arg_22_1, arg_22_2)
		end

		arg_22_0:dispatchEventToRoot({
			name = "refresh_loadouts"
		})

		local var_22_5 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/FAVORITE_LOADOUT_SELECTED"),
			description = var_22_0.name:get(),
			controllerIndex = arg_22_1,
			type = LUI.ToastManager.NotificationType.LoadoutOptions
		}

		arg_22_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_22_5
		})
	end
end

function LOADOUT.GetLoadoutSelectedPerk(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = PlayerData.BFFBGAJGD(arg_23_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	local var_23_1

	if arg_23_3 then
		var_23_1 = var_23_0.loadouts[arg_23_1].extraPerks[arg_23_2]
	else
		var_23_1 = var_23_0.loadouts[arg_23_1].loadoutPerks[arg_23_2]
	end

	return var_23_1
end

function LOADOUT.SetLoadoutSelectedPerk(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	local var_24_0 = PlayerData.BFFBGAJGD(arg_24_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	local var_24_1

	if arg_24_4 then
		var_24_1 = var_24_0.loadouts[arg_24_1].extraPerks[arg_24_2]
	else
		var_24_1 = var_24_0.loadouts[arg_24_1].loadoutPerks[arg_24_2]
	end

	var_24_1:set(arg_24_3)
end

function LOADOUT.SetLoadoutUsingSpecialist(arg_25_0, arg_25_1, arg_25_2)
	PlayerData.BFFBGAJGD(arg_25_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_25_1].usingSpecialist:set(arg_25_2)
end

function LOADOUT.GetLoadoutUsingSpecialist(arg_26_0, arg_26_1)
	return PlayerData.BFFBGAJGD(arg_26_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_26_1].usingSpecialist:get()
end

function LOADOUT.GetPerkDataByField(arg_27_0, arg_27_1)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_27_0, arg_27_1)
end

function LOADOUT.IsSpecialPerk(arg_28_0)
	return arg_28_0 == Cac.PerkTypes.SPECIAL_ONE or arg_28_0 == Cac.PerkTypes.SPECIAL_TWO or arg_28_0 == Cac.PerkTypes.SPECIAL_THREE
end

function LOADOUT.CopyAndReplaceLoadout(arg_29_0, arg_29_1, arg_29_2)
	arg_29_2.overkill:set(arg_29_1.overkill:get())
	arg_29_2.usingSpecialist:set(arg_29_1.usingSpecialist:get())
	arg_29_2.name:set(arg_29_1.name:get())

	for iter_29_0, iter_29_1 in ddlpairs(arg_29_2.weaponSetups) do
		local var_29_0 = arg_29_1.weaponSetups[iter_29_0]

		iter_29_1.camo:set(var_29_0.camo:get())
		iter_29_1.reticle:set(var_29_0.reticle:get())
		iter_29_1.weapon:set(var_29_0.weapon:get())
		iter_29_1.lootItemID:set(var_29_0.lootItemID:get())
		iter_29_1.variantID:set(var_29_0.variantID:get())
		iter_29_1.paintJobID:set(var_29_0.paintJobID:get())
		iter_29_1.blueprintName:set(var_29_0.blueprintName:get())
		iter_29_1.cosmeticAttachment:set(var_29_0.cosmeticAttachment:get())

		for iter_29_2, iter_29_3 in ddlpairs(iter_29_1.attachmentSetup) do
			local var_29_1 = var_29_0.attachmentSetup[iter_29_2]

			iter_29_3.attachment:set(var_29_1.attachment:get())
			iter_29_3.variantID:set(var_29_1.variantID:get())
		end

		for iter_29_4, iter_29_5 in ddlpairs(iter_29_1.sticker) do
			iter_29_5:set(var_29_0.sticker[iter_29_4]:get())
		end
	end

	for iter_29_6, iter_29_7 in ddlpairs(arg_29_2.equipmentSetups) do
		local var_29_2 = arg_29_1.equipmentSetups[iter_29_6]

		iter_29_7.equipment:set(var_29_2.equipment:get())
		iter_29_7.extraCharge:set(var_29_2.extraCharge:get())
	end

	for iter_29_8, iter_29_9 in ddlpairs(arg_29_2.loadoutPerks) do
		iter_29_9:set(arg_29_1.loadoutPerks[iter_29_8]:get())
	end

	for iter_29_10, iter_29_11 in ddlpairs(arg_29_2.extraPerks) do
		iter_29_11:set(arg_29_1.extraPerks[iter_29_10]:get())
	end

	local var_29_3 = {
		iconScale = -0.3,
		displayTime = 3000,
		icon = "cac_equip_fill",
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_COPIED"),
		description = arg_29_1.name:get(),
		controllerIndex = controllerIndex,
		type = LUI.ToastManager.NotificationType.LoadoutOptions
	}

	arg_29_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_29_3
	})
end

function LOADOUT.OpenLoadoutCopyPopup(arg_30_0, arg_30_1)
	local var_30_0 = {
		flyInLeftNarrow = true,
		disableQuickAccessShortcuts = true,
		controllerIndex = arg_30_0,
		loadoutIndex = arg_30_1
	}

	LUI.FlowManager.RequestPopupMenu(nil, "LoadoutCopy", true, arg_30_0, false, var_30_0)
end

function LOADOUT.RenameLoadout(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = Engine.CBBHFCGDIC("MENU/RENAME")
	local var_31_1 = arg_31_2.name:get()
	local var_31_2 = 20
	local var_31_3 = true
	local var_31_4 = CONDITIONS.IsUserSignedInDemonware(arg_31_1) or Engine.DAIACGBAGD(arg_31_1) ~= CoD.StatsSource.OFFLINE
	local var_31_5 = false
	local var_31_6 = CoD.KeyboardInputTypes.Normal

	OSK.CBJGJDGFC(arg_31_1, var_31_0, var_31_1, var_31_2, var_31_3, var_31_4, var_31_5, function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_1 ~= nil and arg_32_1 ~= "" then
			arg_31_2.name:set(arg_32_1)
			arg_31_0:dispatchEventToRoot({
				name = "refresh_loadouts"
			})

			local var_32_0 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_RENAMED"),
				description = arg_31_2.name:get(),
				controllerIndex = arg_32_0,
				type = LUI.ToastManager.NotificationType.LoadoutOptions
			}

			arg_31_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_32_0
			})
		end
	end, var_31_6)
end

function LOADOUT.RequestWatchAndWeaponModels(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = {}

	if arg_33_2 then
		for iter_33_0 = 1, #arg_33_2 do
			local var_33_1 = WATCH.GetFullModelName(arg_33_2[iter_33_0])

			table.insert(var_33_0, var_33_1)
		end
	else
		local var_33_2 = WATCH.GetEquippedWatch(arg_33_0)
		local var_33_3 = WATCH.GetFullModelName(var_33_2)

		table.insert(var_33_0, var_33_3)
	end

	local var_33_4 = PlayerData.BFFBGAJGD(arg_33_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_33_1]

	for iter_33_1 = 0, 1 do
		local var_33_5 = var_33_4.weaponSetups[iter_33_1]
		local var_33_6 = WEAPON.GetWeaponModelNameFromPlayerData(var_33_5.weapon:get(), var_33_5, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_33_0
		})

		table.insert(var_33_0, var_33_6)
	end

	FrontEndScene.RequestWeaponViewModels(var_33_0, arg_33_0)
end

LOADOUT.MATCHRULES = {}

function LOADOUT.MATCHRULES.LoadoutHasRestrictedItem(arg_34_0)
	local var_34_0 = arg_34_0.weaponSetups[0]
	local var_34_1 = var_34_0.weapon:get()

	if MatchRules.CADFFHGJAE(var_34_1) then
		return true
	end

	for iter_34_0, iter_34_1 in ddlpairs(var_34_0.attachmentSetup) do
		local var_34_2 = iter_34_1.attachment:get()

		if MatchRules.EBCADBGDHB(var_34_2, var_34_1) then
			return true
		end
	end

	local var_34_3 = arg_34_0.weaponSetups[1]
	local var_34_4 = var_34_3.weapon:get()

	if MatchRules.CADFFHGJAE(var_34_4) then
		return true
	end

	for iter_34_2, iter_34_3 in ddlpairs(var_34_3.attachmentSetup) do
		local var_34_5 = iter_34_3.attachment:get()

		if MatchRules.EBCADBGDHB(var_34_5, var_34_4) then
			return true
		end
	end

	for iter_34_4, iter_34_5 in ddlpairs(arg_34_0.equipmentSetups) do
		if MatchRules.BAJDCAAGCG(iter_34_5.equipment:get()) then
			return true
		end
	end

	for iter_34_6, iter_34_7 in ddlpairs(arg_34_0.loadoutPerks) do
		if MatchRules.CJBJJHJCI(iter_34_7:get()) then
			return true
		end
	end

	for iter_34_8, iter_34_9 in ddlpairs(arg_34_0.extraPerks) do
		if MatchRules.CJBJJHJCI(iter_34_9:get()) then
			return true
		end
	end

	return false
end

function LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in ddlpairs(arg_35_0) do
		local var_35_0 = iter_35_1.attachment:get()

		if MatchRules.EBCADBGDHB(var_35_0, arg_35_1) then
			return true
		end
	end

	return false
end

function LOADOUT.MATCHRULES.IsThereARestrictedFieldUpgrade(arg_36_0)
	local var_36_0 = PlayerData.BFFBGAJGD(arg_36_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.fieldUpgrades

	for iter_36_0, iter_36_1 in ddlpairs(var_36_0) do
		if MatchRules.DFIIFBCIH(iter_36_1:get()) then
			return true
		end
	end

	return false
end

function LOADOUT.MATCHRULES.IsThereARestrictedKillstreak(arg_37_0)
	local var_37_0 = PlayerData.BFFBGAJGD(arg_37_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.killstreakSetups

	for iter_37_0, iter_37_1 in ddlpairs(var_37_0) do
		if MatchRules.DAAABIJDJI(iter_37_1.killstreak:get()) then
			return true
		end
	end

	return false
end

function LOADOUT.MATCHRULES.AreAllKillstreakRestricted(arg_38_0)
	local var_38_0 = PlayerData.BFFBGAJGD(arg_38_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.killstreakSetups

	for iter_38_0, iter_38_1 in ddlpairs(var_38_0) do
		if not MatchRules.DAAABIJDJI(iter_38_1.killstreak:get()) then
			return false
		end
	end

	return true
end

function LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_39_0)
	local var_39_0 = PlayerData.BFFBGAJGD(arg_39_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	for iter_39_0, iter_39_1 in ddlpairs(var_39_0) do
		if LOADOUT.MATCHRULES.LoadoutHasRestrictedItem(iter_39_1) then
			return true
		end
	end

	return false
end

function LOADOUT.MATCHRULES.ShouldShowLoadoutRestrictedPopup(arg_40_0)
	local var_40_0 = Lobby.GetLocalClientTeam(arg_40_0)

	return MLG.IsCDLActive(arg_40_0) and not Dvar.IBEGCHEFE("RQKRQLQPK") and LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_40_0) and var_40_0 ~= Teams.spectator and var_40_0 ~= Teams.follower
end
