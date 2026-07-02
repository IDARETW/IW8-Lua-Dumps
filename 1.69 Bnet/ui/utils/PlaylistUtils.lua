PlaylistUtils = PlaylistUtils or {}
PlaylistUtils.USE_FILTERED_PLAYLIST_ID = 200
PlaylistUtils.MAX_FEATURED_GAMEMODE_BUTTONS = 5
PlaylistUtils.MAX_PROMOTED_GAMEMODE_BUTTONS = 5
PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION = 150
PlaylistUtils.BUTTON_EXPAND_BOTTOM_SIZE = 135
PlaylistUtils.BUTTON_COLLAPSE_BOTTOM_SIZE = 90
PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH = 792
PlaylistUtils.ButtonType = {
	PROMOTED = 1,
	FEATURED = 0
}
PlaylistUtils.PlaylistLockState = {
	LOCKED_EARLY_ACCESS = 7,
	LOCKED_MAXPARTY = 3,
	LOCKED_NO_FILTERS_SET = 6,
	LOCKED_FORCE_LOCKED = 8,
	LOCKED_MINPARTY = 4,
	DEDI_REQUIRED = 5,
	UNLOCKED = 0,
	LOCKED_DLC_PARTY = 2,
	LOCKED_DLC_LOCAL = 1
}
PlaylistUtils.CategoryClass = {
	ALL = 2,
	NONE = 1,
	ALIENS = 8,
	CORE = 4,
	MAGMA = 16,
	ERROR = 0
}
PlaylistUtils.GameTypes = {
	TDMGameType = "tdm",
	GunfightGameType = "arena"
}
PlaylistUtils.RestrictionTypes = {
	VG_OWNERSHIP = 2,
	OFF = 0,
	EARLY_ACCESS_VG_OWNERSHIP = 1
}
PlaylistUtils.DEFAULT_RESTRICTION_ENABLED_ANIM = "ModPlaylistRestrictionEnabled"
PlaylistUtils.DEFAULT_RESTRICTION_DISABLED_ANIM = "ModPlaylistRestrictionDisabled"
PlaylistUtils.DEFAULT_RESTRICTION_HIDE_ANIM = "ModPlaylistRestrictionOff"
PlaylistUtils.RestrictionTypeData = {
	[PlaylistUtils.RestrictionTypes.EARLY_ACCESS_VG_OWNERSHIP] = {
		exclusiveAccessRestrictedPopupDesc = "LUA_MENU_MP/EXCLUSIVE_ACCESS_VG_DESC",
		exclusiveAccessWarningPopupTitle = "LUA_MENU_MP/PARTY_WARNING",
		partyRemovedPopupDesc = "LUA_MENU_MP/VG_PLAYLIST_REMOVED_DESC",
		isLobbyPartyKickingActive = true,
		exclusiveAccessWarningPopupDesc = "LUA_MENU_MP/VG_PLAYLIST_DESC",
		hasPremiumTitleOwnershipRestriction = true
	},
	[PlaylistUtils.RestrictionTypes.VG_OWNERSHIP] = {
		onlyUsesRestrictionVisuals = true,
		hasPremiumTitleOwnershipRestriction = true
	}
}

function PlaylistUtils.GetCategoryAndPlaylistIndex(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0:GetDataSourceAtIndex(arg_1_1)

	if var_1_0 then
		local var_1_1 = var_1_0.categoryIndex:GetValue(controllerIndex)
		local var_1_2 = var_1_0.playlistIndex:GetValue(controllerIndex)

		return var_1_1, var_1_2
	end
end

function PlaylistUtils.GetRestrictedPlaylistIds()
	local var_2_0 = MP.ParseCommaStringDvar("LTLRNLNQTS")

	if not var_2_0 or #var_2_0 <= 0 then
		return nil
	end

	return var_2_0
end

function PlaylistUtils.BuildPlaylistEventButton(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_2, "You must provide configuration options to build an event button. Options are an event reference ID, datatabe (csv) reference, and the end date/time of the event (milliseconds).")
	assert(arg_3_2.eventRefIdDvarName and type(arg_3_2.eventRefIdDvarName) == "string", "PlaylistUtils.BuildPlaylistEventButton - Invalid eventRefId!")
	assert(arg_3_2.eventDataSource and type(arg_3_2.eventDataSource) == "table" and assert(arg_3_2.eventDataSource.file) and assert(arg_3_2.eventDataSource.cols), "PlaylistUtils.BuildPlaylistEventButton - Invalid datasource reference. Must be a table created in CSVUtils.")
	assert(arg_3_2.eventAccessPeriodDvarName and type(arg_3_2.eventAccessPeriodDvarName) == "string", "You must provide an end date (milliseconds).")

	local var_3_0 = {}
	local var_3_1 = arg_3_2.customListItemRender and arg_3_2.customListItemRender or "PlaylistFeaturedEventButton"
	local var_3_2 = Dvar.CFHDGABACF(arg_3_2.eventRefIdDvarName)
	local var_3_3 = Dvar.CFHDGABACF(arg_3_2.eventAccessPeriodDvarName)

	if not var_3_2 or var_3_2 == 0 then
		return nil
	end

	if not arg_3_2.ignoreCountdownTimer then
		if not var_3_3 then
			return nil
		else
			local var_3_4 = tonumber(var_3_3)

			if not var_3_4 or var_3_4 <= 0 then
				return nil
			end
		end
	end

	local var_3_5 = 1

	for iter_3_0, iter_3_1 in pairs(arg_3_2.eventDataSource.cols) do
		var_3_0[iter_3_0] = StringTable.CBGJCDIHCE(arg_3_2.eventDataSource.file, var_3_5, iter_3_1)

		if not var_3_0[iter_3_0] or var_3_0[iter_3_0] == "" then
			return nil
		end
	end

	var_3_0.accessPeriod = var_3_3
	var_3_0.ignoreCountdownTimer = arg_3_2.ignoreCountdownTimer

	local var_3_6 = MenuBuilder.BuildRegisteredType(var_3_1, {
		controllerIndex = arg_3_1,
		eventData = var_3_0
	})

	var_3_6.id = arg_3_2.customButtonID and arg_3_2.customButtonID or "PlayListEventButton"

	if arg_3_2.eventButtonAction then
		var_3_6:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			arg_3_2.eventButtonAction(arg_4_0, arg_3_1)

			return true
		end)
	end

	if arg_3_2.elementToAddBefore then
		var_3_6:addElementBefore(arg_3_2.elementToAddBefore)
	else
		var_3_6:setPriority(-20)
		arg_3_0:addElement(var_3_6)
	end

	if Lobby.lfpPlaylistBtnCount then
		Lobby.lfpPlaylistBtnCount = Lobby.lfpPlaylistBtnCount + 1
	end

	return var_3_6
end

function PlaylistUtils.ValidateSelection(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = 0
	local var_5_2 = {}
	local var_5_3 = {}
	local var_5_4 = {}
	local var_5_5 = false
	local var_5_6 = Dvar.CFHDGABACF("MTTRPNMPRP")
	local var_5_7 = arg_5_0.playlists
	local var_5_8 = arg_5_0.playlists:GetCountValue(arg_5_1)

	for iter_5_0 = 0, var_5_8 do
		local var_5_9, var_5_10 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_5_7, iter_5_0)

		if var_5_9 and var_5_10 then
			local var_5_11, var_5_12 = Playlist.CGJBAEBBG(var_5_9, var_5_10)

			if var_5_12 then
				local var_5_13 = Playlist.DCFCIFABGH(var_5_9, var_5_10)
				local var_5_14 = var_5_13 == Lobby.PlaylistLockState.UNLOCKED
				local var_5_15 = var_5_7:GetDataSourceAtIndex(iter_5_0)
				local var_5_16 = var_5_15.maxPlayerSize:GetValue(arg_5_1)

				if var_5_6 <= var_5_16 then
					var_5_5 = true
				end

				if not var_5_14 and var_5_13 == Lobby.PlaylistLockState.LOCKED_FORCE_LOCKED then
					table.insert(var_5_0, var_5_15)
				elseif not var_5_14 and var_5_13 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					table.insert(var_5_0, var_5_15)
				end

				if Playlist.DEJGAECIBG(var_5_10, var_5_9) then
					table.insert(var_5_3, var_5_15)
				end

				if var_5_16 > Lobby.MaxPlayerCountForSplitscreen then
					table.insert(var_5_2, var_5_15)
				end

				var_5_1 = var_5_1 + 1
			end
		end
	end

	var_5_4.numFiltered = var_5_1
	var_5_4.invalidPlaylists = var_5_0
	var_5_4.requiresCrossplay = var_5_5
	var_5_4.maxPlayerPlaylists = var_5_2
	var_5_4.nonF2PPlaylists = var_5_3

	return var_5_4
end

function PlaylistUtils.GetPublicPlaylistDatasources()
	local var_6_0 = "frontEnd.playlists.category"

	WipeGlobalModelsAtPath(var_6_0)
	Lobby.DFJICHHJFI(var_6_0)

	local var_6_1 = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".count")
	local var_6_2 = LUI.DataSourceFromList.new(var_6_1)

	function var_6_2.MakeDataSourceAtIndex(arg_7_0, arg_7_1)
		local var_7_0 = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".index." .. arg_7_1)
		local var_7_1 = var_6_0 .. "." .. arg_7_1 .. ".playlist"
		local var_7_2 = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".count")
		local var_7_3 = LUI.DataSourceFromList.new(var_7_2)

		function var_7_3.MakeDataSourceAtIndex(arg_8_0, arg_8_1)
			local var_8_0 = var_7_1 .. "." .. arg_8_1 .. ".enabledRuleSet"
			local var_8_1 = LUI.DataSourceInGlobalModel.new(var_8_0 .. ".count")
			local var_8_2 = LUI.DataSourceFromList.new(var_8_1)

			function var_8_2.MakeDataSourceAtIndex(arg_9_0, arg_9_1)
				return {
					name = LUI.DataSourceInGlobalModel.new(var_8_0 .. ".name." .. arg_9_1)
				}
			end

			return {
				name = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".name." .. arg_8_1),
				disabled = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".disabled." .. arg_8_1),
				hasDLC = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".hasDLC." .. arg_8_1),
				image = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".image." .. arg_8_1),
				smallImage = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".smallImage." .. arg_8_1),
				desc = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".desc." .. arg_8_1),
				categoryIndex = var_7_0,
				playlistIndex = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".index." .. arg_8_1),
				minPlayerSize = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".minPlayerSize." .. arg_8_1),
				maxPlayerSize = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".maxPlayerSize." .. arg_8_1),
				minPartySize = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".minPartySize." .. arg_8_1),
				maxPartySize = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".maxPartySize." .. arg_8_1),
				timeLimit = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".timeLimit." .. arg_8_1),
				scoreLimit = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".scoreLimit." .. arg_8_1),
				numRounds = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".numRounds." .. arg_8_1),
				isNew = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".isNew." .. arg_8_1),
				xpScale = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".xpScale." .. arg_8_1),
				weaponXpScale = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".weaponXpScale." .. arg_8_1),
				battlePassXpScale = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".battlePassXpScale." .. arg_8_1),
				operatorXpScale = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".operatorXpScale." .. arg_8_1),
				isLimitedTime = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".isLimitedTime." .. arg_8_1),
				isEarlyAccess = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".isEarlyAccess." .. arg_8_1),
				isForceLocked = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".isForceLocked." .. arg_8_1),
				isSpecial = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".isSpecial." .. arg_8_1),
				ID = LUI.DataSourceInGlobalModel.new(var_7_1 .. ".ID." .. arg_8_1),
				enabledRuleSets = var_8_2
			}
		end

		return {
			name = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".name." .. arg_7_1),
			disabled = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".disabled." .. arg_7_1),
			type = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".type." .. arg_7_1),
			desc = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".desc." .. arg_7_1),
			image = LUI.DataSourceInGlobalModel.new(var_6_0 .. ".image." .. arg_7_1),
			index = var_7_0,
			playlists = var_7_3
		}
	end

	return var_6_2
end

function PlaylistUtils.IsRuleSetEnabled(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = PlaylistUtils.FindPlaylistDataSourceFromID(arg_10_0, arg_10_1)
	local var_10_1 = var_10_0.enabledRuleSets:GetCountValue(arg_10_0)

	if var_10_1 then
		for iter_10_0 = 0, var_10_1 - 1 do
			if var_10_0.enabledRuleSets:GetDataSourceAtIndex(iter_10_0).name:GetValue(arg_10_0) == arg_10_2 then
				return true
			end
		end
	end

	return false
end

function PlaylistUtils.DoesPlaylistRequireSquadFill(arg_11_0, arg_11_1)
	local var_11_0 = {
		MP.GameMode.TruckWarGameType,
		MP.GameMode.BRX2GameType,
		MP.GameMode.IncursionGameType
	}

	return PlaylistUtils.DoesPlaylistContainGameTypeInList(arg_11_0, arg_11_1, var_11_0)
end

function PlaylistUtils.DoesPlaylistRequireScareWarning(arg_12_0, arg_12_1)
	local var_12_0 = {
		MP.GameMode.BRGhostGameType
	}

	return PlaylistUtils.DoesPlaylistContainGameTypeInList(arg_12_0, arg_12_1, var_12_0)
end

local function var_0_0(arg_13_0)
	local var_13_0 = Dvar.IBEGCHEFE("dev_force_restricted_playlist_own_status")

	if var_13_0 ~= nil then
		return var_13_0
	end

	if Engine.GEHBEDCEC() == true then
		return true
	end

	local var_13_1 = {
		33924432,
		33925432,
		33926432,
		33926433,
		33926434,
		33926435
	}

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if Loot.DEBEIFJEEG(arg_13_0, iter_13_1) > 0 then
			return true
		end
	end

	return false
end

function PlaylistUtils.IsPlaylistBtnRestrictedForUser(arg_14_0, arg_14_1)
	local var_14_0 = false

	if PlaylistUtils.DoesPlaylistRequireRestrictionWarning(arg_14_0, arg_14_1) then
		local var_14_1 = PlaylistUtils.GetActivePlaylistRestrictionTypeData()

		if var_14_1.hasPremiumTitleOwnershipRestriction and not var_14_1.onlyUsesRestrictionVisuals then
			var_14_0 = not ((Lobby.BGIADHIHAG() or not Lobby.GFFECBCCF()) and var_0_0(arg_14_0))
		end
	end

	return var_14_0
end

function PlaylistUtils.IsPlaylistIdRestricted(arg_15_0)
	if not arg_15_0 or type(arg_15_0) ~= "number" then
		LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), "IsPlaylistIdRestricted() -> invalid playlistId value of " .. tostring(arg_15_0))
	end

	local var_15_0 = PlaylistUtils.GetRestrictedPlaylistIds()

	if var_15_0 then
		for iter_15_0, iter_15_1 in pairs(var_15_0) do
			if arg_15_0 == tonumber(iter_15_1) then
				return true
			end
		end
	end

	return false
end

function PlaylistUtils.GetActivePlaylistRestrictionTypeData()
	local var_16_0 = Dvar.CFHDGABACF("NMOQRNSLTM")
	local var_16_1 = PlaylistUtils.RestrictionTypeData[var_16_0]

	if not var_16_1 then
		LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), "restrictionData is not yet defined in PlaylistUtils.RestrictionTypeData for playlist restriction type " .. tostring(var_16_0))
	end

	return var_16_1
end

function PlaylistUtils.IsLobbyRestrictedForUser(arg_17_0)
	local var_17_0 = CONDITIONS.AreWZPlaylistRestrictionsEnabled() and PlaylistUtils.IsPlaylistIdRestricted(Dvar.CFHDGABACF("NLTOPSKPQM"))

	DebugPrint("PlaylistRestriction: CONDITIONS.AreWZPlaylistRestrictionsEnabled() " .. tostring(CONDITIONS.AreWZPlaylistRestrictionsEnabled()))
	DebugPrint("PlaylistRestriction: PlaylistUtils.IsPlaylistIdRestricted( Dvar.CFHDGABACF( playlistID ) ) " .. tostring(PlaylistUtils.IsPlaylistIdRestricted(Dvar.CFHDGABACF("NLTOPSKPQM"))))

	if var_17_0 then
		local var_17_1 = PlaylistUtils.GetActivePlaylistRestrictionTypeData()

		DebugPrint("PlaylistRestriction: restrictionData.isLobbyPartyKickingActive " .. tostring(var_17_1.isLobbyPartyKickingActive))
		DebugPrint("PlaylistRestriction: restrictionData.hasPremiumTitleOwnershipRestriction " .. tostring(var_17_1.hasPremiumTitleOwnershipRestriction))
		DebugPrint("PlaylistRestriction: restrictionData.onlyUsesRestrictionVisuals " .. tostring(var_17_1.onlyUsesRestrictionVisuals))

		if var_17_1.isLobbyPartyKickingActive and var_17_1.hasPremiumTitleOwnershipRestriction and not var_17_1.onlyUsesRestrictionVisuals then
			DebugPrint("PlaylistRestriction: IsPremiumTitleLootEntitlementIdOwned( controllerIndex ) " .. tostring(var_0_0(arg_17_0)))

			return not var_0_0(arg_17_0)
		end
	end

	return false
end

function PlaylistUtils.UpdatePlaylistRestrictionVisualsViaDataSource(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_0 or not arg_18_1 or not arg_18_2 then
		LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), "One or more params passed to UpdatePlaylistRestrictionVisualsViaDataSource is nil, but expected to never be")

		return false
	end

	if not CONDITIONS.AreWZPlaylistRestrictionsEnabled() then
		ACTIONS.AnimateSequence(arg_18_0, arg_18_0._storedPlaylistRestrictionHideAnim or PlaylistUtils.DEFAULT_RESTRICTION_HIDE_ANIM)

		return false
	end

	local var_18_0 = PlaylistUtils.GetActivePlaylistRestrictionTypeData()
	local var_18_1

	if arg_18_2.categoryDataSource then
		var_18_1 = PlaylistUtils.DoesPlaylistCategoryHaveRestrictions(arg_18_1, arg_18_2.categoryDataSource)
	elseif arg_18_2.playlistDataSource then
		var_18_1 = PlaylistUtils.DoesPlaylistRequireRestrictionWarning(arg_18_1, arg_18_2.playlistDataSource)
	end

	arg_18_0._storedPlaylistRestrictionHideAnim = var_18_0.hideAnimOverride or PlaylistUtils.DEFAULT_RESTRICTION_HIDE_ANIM

	if var_18_1 and var_18_0.hasPremiumTitleOwnershipRestriction then
		if var_0_0(arg_18_1) then
			ACTIONS.AnimateSequence(arg_18_0, var_18_0.enabledAnimOverride or PlaylistUtils.DEFAULT_RESTRICTION_ENABLED_ANIM)
		else
			ACTIONS.AnimateSequence(arg_18_0, var_18_0.disabledAnimOverride or PlaylistUtils.DEFAULT_RESTRICTION_DISABLED_ANIM)
		end
	else
		ACTIONS.AnimateSequence(arg_18_0, arg_18_0._storedPlaylistRestrictionHideAnim)
	end
end

function PlaylistUtils.DoesPlaylistCategoryHaveRestrictions(arg_19_0, arg_19_1)
	if not CONDITIONS.AreWZPlaylistRestrictionsEnabled() then
		return false
	end

	local var_19_0 = arg_19_1.playlists
	local var_19_1 = var_19_0:GetCountValue(arg_19_0)

	for iter_19_0 = 0, var_19_1 - 1 do
		local var_19_2 = var_19_0:GetDataSourceAtIndex(iter_19_0)

		if PlaylistUtils.DoesPlaylistRequireRestrictionWarning(arg_19_0, var_19_2) then
			return true
		end
	end

	return false
end

function PlaylistUtils.DoesPlaylistRequireRestrictionWarning(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1 and arg_20_1.ID

	if not CONDITIONS.AreWZPlaylistRestrictionsEnabled() or not var_20_0 then
		return false
	end

	local var_20_1 = arg_20_1.ID:GetValue(arg_20_0)

	return PlaylistUtils.IsPlaylistIdRestricted(var_20_1)
end

function PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if PlaylistUtils.DoesPlaylistRequireRestrictionWarning(arg_21_1, arg_21_2) then
		if PlaylistUtils.IsPlaylistBtnRestrictedForUser(arg_21_1, arg_21_2) then
			local function var_21_0()
				LUI.FlowManager.RequestPopupMenu(self, "VGPreOrderPopup", true, arg_21_1, false, {})
			end

			LUI.FlowManager.RequestPopupMenu(nil, "PlaylistRestrictionPopupExclusiveAccessRestricted", true, arg_21_1, false, {
				onAccept = var_21_0,
				controllerIndex = arg_21_1
			})

			return true
		elseif PlaylistUtils.GetActivePlaylistRestrictionTypeData().isLobbyPartyKickingActive and (LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count"):GetValue(arg_21_1) or 1) > 1 then
			LUI.FlowManager.RequestPopupMenu(nil, "PlaylistRestrictionPopupExclusiveAccessWarning", true, arg_21_1, false, {
				onAccept = arg_21_3,
				controllerIndex = arg_21_1
			})

			return true
		end
	end

	return false
end

function PlaylistUtils.AtLeastOneGameModeFiltered(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.playlists
	local var_23_1 = var_23_0:GetCountValue(arg_23_1)

	for iter_23_0 = 0, var_23_1 do
		local var_23_2, var_23_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_23_0, iter_23_0)

		if var_23_2 and var_23_3 then
			local var_23_4, var_23_5 = Playlist.CGJBAEBBG(var_23_2, var_23_3)

			if var_23_5 then
				return true
			end
		end
	end

	return false
end

function PlaylistUtils.SelectAll(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = arg_24_0.playlists
	local var_24_1 = var_24_0:GetCountValue(arg_24_1)

	for iter_24_0 = 0, var_24_1 do
		local var_24_2, var_24_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_24_0, iter_24_0)

		if var_24_2 and var_24_3 then
			local var_24_4, var_24_5 = Playlist.CGJBAEBBG(var_24_2, var_24_3)
			local var_24_6 = Playlist.DCFCIFABGH(var_24_2, var_24_3) == Lobby.PlaylistLockState.UNLOCKED

			if var_24_5 and not arg_24_2 or not var_24_5 and arg_24_2 and (var_24_6 or arg_24_3) then
				Playlist.CBHGDIGEI(var_24_2, var_24_3)
			end
		end
	end
end

function PlaylistUtils.CheckIfAllFiltered(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.playlists
	local var_25_1 = var_25_0:GetCountValue(arg_25_1)

	for iter_25_0 = 0, var_25_1 do
		local var_25_2, var_25_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_25_0, iter_25_0)

		if var_25_2 and var_25_3 then
			local var_25_4 = Playlist.DCFCIFABGH(var_25_2, var_25_3) == Lobby.PlaylistLockState.UNLOCKED
			local var_25_5, var_25_6 = Playlist.CGJBAEBBG(var_25_2, var_25_3)

			if var_25_4 and not var_25_6 then
				return false
			end
		end
	end

	return true
end

function PlaylistUtils.CheckIfAllLocked(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.playlists
	local var_26_1 = var_26_0:GetCountValue(arg_26_1)

	for iter_26_0 = 0, var_26_1 do
		local var_26_2, var_26_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_26_0, iter_26_0)

		if var_26_2 and var_26_3 and Playlist.DCFCIFABGH(var_26_2, var_26_3) == Lobby.PlaylistLockState.UNLOCKED then
			return false
		end
	end

	return true
end

function PlaylistUtils.GetMaxPlayersAllowedInParty(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.playlists
	local var_27_1 = var_27_0:GetCountValue(arg_27_1)
	local var_27_2 = -1

	for iter_27_0 = 0, var_27_1 do
		local var_27_3, var_27_4 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_27_0, iter_27_0)

		if var_27_3 and var_27_4 then
			local var_27_5 = var_27_0:GetDataSourceAtIndex(iter_27_0)
			local var_27_6, var_27_7 = Playlist.CGJBAEBBG(var_27_3, var_27_4)

			if var_27_7 then
				local var_27_8 = var_27_5.maxPartySize:GetValue(arg_27_1)

				if var_27_2 < 0 or var_27_8 < var_27_2 then
					var_27_2 = var_27_8
				end
			end
		end
	end

	return var_27_2
end

function PlaylistUtils.DoesPlaylistSupportSplitScreen(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.categoryIndex:GetValue(arg_28_1)
	local var_28_1 = arg_28_0.playlistIndex:GetValue(arg_28_1)
	local var_28_2 = true

	if var_28_0 and var_28_1 then
		var_28_2 = Playlist.FDGFJJGG(var_28_1, var_28_0)
	end

	if Dvar.IBEGCHEFE("NLMOPNQOTT") then
		local var_28_3

		if arg_28_0.maxPlayerSize then
			var_28_3 = arg_28_0.maxPlayerSize:GetValue(arg_28_1) <= Lobby.MaxPlayerCountForSplitscreen
		end

		var_28_2 = var_28_2 or var_28_3
	end

	return not var_28_2
end

function PlaylistUtils.DoesCategorySupportSplitScreen(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.playlists
	local var_29_1 = var_29_0:GetCountValue(arg_29_1)

	for iter_29_0 = 0, var_29_1 - 1 do
		local var_29_2 = var_29_0:GetDataSourceAtIndex(iter_29_0)

		if not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_29_2, arg_29_1) then
			return false
		end
	end

	return true
end

function PlaylistUtils.DoesCategoryContainXPBoost(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.playlists
	local var_30_1 = var_30_0:GetCountValue(arg_30_1)
	local var_30_2 = {
		[LOOT.doubleXpTypes.XP] = false,
		[LOOT.doubleXpTypes.WEAPON] = false,
		[LOOT.doubleXpTypes.BATTLE_PASS] = false,
		[LOOT.doubleXpTypes.OPERATOR] = false
	}

	for iter_30_0 = 0, var_30_1 - 1 do
		local var_30_3 = var_30_0:GetDataSourceAtIndex(iter_30_0)
		local var_30_4 = var_30_3.xpScale:GetValue(arg_30_1)
		local var_30_5 = var_30_3.weaponXpScale:GetValue(arg_30_1)
		local var_30_6 = var_30_3.battlePassXpScale:GetValue(arg_30_1)
		local var_30_7 = var_30_3.operatorXpScale:GetValue(arg_30_1)

		if var_30_4 and var_30_4 > 1 then
			var_30_2[LOOT.doubleXpTypes.XP] = true
		end

		if var_30_5 and var_30_5 > 1 then
			var_30_2[LOOT.doubleXpTypes.WEAPON] = true
		end

		if var_30_6 and var_30_6 > 1 then
			var_30_2[LOOT.doubleXpTypes.BATTLE_PASS] = true
		end

		if var_30_7 and var_30_7 > 1 then
			var_30_2[LOOT.doubleXpTypes.OPERATOR] = true
		end
	end

	return var_30_2
end

function PlaylistUtils.GetFilteredGameModeIcons(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = arg_31_1.playlists
	local var_31_2 = var_31_1:GetCountValue(arg_31_0)

	for iter_31_0 = 0, var_31_2 do
		local var_31_3, var_31_4 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_31_1, iter_31_0)

		if var_31_3 and var_31_4 then
			local var_31_5, var_31_6 = Playlist.CGJBAEBBG(var_31_3, var_31_4)

			if var_31_6 then
				local var_31_7 = var_31_1:GetDataSourceAtIndex(iter_31_0)

				table.insert(var_31_0, var_31_7.image:GetValue(arg_31_0))
			end
		end
	end

	return var_31_0
end

function PlaylistUtils.ContainsNewPlaylist(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1.playlists:GetCountValue(arg_32_0) - 1

	for iter_32_0 = 0, var_32_0 do
		local var_32_1 = arg_32_1.playlists:GetDataSourceAtIndex(iter_32_0).isNew:GetValue(arg_32_0)

		if var_32_1 and var_32_1 == 1 then
			return true
		end
	end

	return false
end

function PlaylistUtils.isEarlyAccessLocked(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = false

	if arg_33_1 and arg_33_1.isEarlyAccess and arg_33_1.isEarlyAccess:GetValue(arg_33_2) then
		local var_33_1 = MiscChallenges.CJJHIEDGGG(arg_33_2, "ch_br_geiger_contract")
		local var_33_2 = false

		if var_33_1 and var_33_1.Challenges and var_33_1.Challenges.Progress then
			var_33_2 = var_33_1.Challenges.Progress >= 1
		end

		if not var_33_2 then
			var_33_0 = true
		end
	end

	return var_33_0
end

function PlaylistUtils.InitializePlaylistButton(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0:SetDataSource(arg_34_1, arg_34_2)
	arg_34_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
	arg_34_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)

	local var_34_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()
	local var_34_1 = arg_34_1 and arg_34_1.isForceLocked and arg_34_1.isForceLocked:GetValue(arg_34_2)
	local var_34_2 = PlaylistUtils.isEarlyAccessLocked(arg_34_0, arg_34_1, arg_34_2)
	local var_34_3 = var_34_0 or var_34_1 or var_34_2

	arg_34_0:SetButtonDisabled(var_34_3)

	if arg_34_0.OnDataSourceAssigned then
		arg_34_0:OnDataSourceAssigned()
	end
end

function PlaylistUtils.FindBRPostTutorialPlaylist(arg_35_0, arg_35_1)
	local var_35_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_35_1 = var_35_0:GetCountValue(arg_35_0) - 1

	for iter_35_0 = 0, var_35_1 do
		local var_35_2 = var_35_0:GetDataSourceAtIndex(iter_35_0).playlists
		local var_35_3 = var_35_2:GetCountValue(arg_35_0)

		for iter_35_1 = 0, var_35_3 do
			local var_35_4, var_35_5 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_35_2, iter_35_1)

			if var_35_4 and var_35_5 then
				if arg_35_1 == MP.WarzonePracticePopupStatus.GO_TO_WARZONE_LOBBY and Playlist.CFADJIBBED(var_35_5, var_35_4) then
					return {
						categoryIndex = var_35_4,
						playlistIndex = var_35_5
					}
				elseif arg_35_1 == MP.WarzonePracticePopupStatus.GO_TO_BLOODMONEY_LOBBY and Playlist.CBCDIIAFAA(var_35_5, var_35_4) then
					return {
						categoryIndex = var_35_4,
						playlistIndex = var_35_5
					}
				end
			end
		end
	end

	return nil
end

function PlaylistUtils.DoesPlaylistContainGameTypeInList(arg_36_0, arg_36_1, arg_36_2)
	for iter_36_0, iter_36_1 in ipairs(arg_36_2) do
		if PlaylistUtils.DoesPlaylistContainGameType(arg_36_0, arg_36_1, iter_36_1) then
			return true
		end
	end

	return false
end

function PlaylistUtils.DoesPlaylistContainGameType(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_1.categoryIndex:GetValue(arg_37_0)
	local var_37_1 = arg_37_1.playlistIndex:GetValue(arg_37_0)
	local var_37_2 = Playlist.EAAGDGCFFC(var_37_0, var_37_1)

	for iter_37_0 = 1, #var_37_2 do
		if var_37_2[iter_37_0] == arg_37_2 then
			return true
		end
	end

	return false
end

function PlaylistUtils.DoesPlaylistIDContainGameTypeInList(arg_38_0, arg_38_1, arg_38_2)
	for iter_38_0, iter_38_1 in ipairs(arg_38_2) do
		if PlaylistUtils.DoesPlaylistIDContainGameType(arg_38_0, arg_38_1, iter_38_1) then
			return true
		end
	end

	return false
end

function PlaylistUtils.DoesPlaylistIDContainGameType(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = PlaylistUtils.FindPlaylistDataSourceFromID(arg_39_0, arg_39_1)

	if var_39_0 then
		return PlaylistUtils.DoesPlaylistContainGameType(arg_39_0, var_39_0, arg_39_2)
	end

	return false
end

function PlaylistUtils.GetCategoryGameTypes(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1.playlists
	local var_40_1 = var_40_0:GetCountValue(arg_40_0)
	local var_40_2 = {}

	for iter_40_0 = 1, var_40_1 do
		local var_40_3 = var_40_0:GetDataSourceAtIndex(iter_40_0 - 1)

		if var_40_3 then
			local var_40_4 = var_40_3.categoryIndex:GetValue(arg_40_0)
			local var_40_5 = var_40_3.playlistIndex:GetValue(arg_40_0)
			local var_40_6 = Playlist.EAAGDGCFFC(var_40_4, var_40_5)

			for iter_40_1 = 1, #var_40_6 do
				var_40_2[var_40_6[iter_40_1]] = true
			end
		end
	end

	return var_40_2
end

function PlaylistUtils.FindPlaylistDataSourceFromID(arg_41_0, arg_41_1)
	local var_41_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_41_1 = var_41_0:GetCountValue(arg_41_0) - 1

	for iter_41_0 = 0, var_41_1 do
		local var_41_2 = var_41_0:GetDataSourceAtIndex(iter_41_0).playlists
		local var_41_3 = var_41_2:GetCountValue(arg_41_0)

		for iter_41_1 = 1, var_41_3 do
			local var_41_4 = var_41_2:GetDataSourceAtIndex(iter_41_1 - 1)

			if var_41_4.ID:GetValue(arg_41_0) == arg_41_1 then
				return var_41_4
			end
		end
	end

	return nil
end

function PlaylistUtils.SetupFeaturedButtons(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = arg_42_2.playlists
	local var_42_1 = var_42_0:GetCountValue(arg_42_1)
	local var_42_2 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()
	local var_42_3 = math.min(var_42_1, PlaylistUtils.MAX_FEATURED_GAMEMODE_BUTTONS)

	for iter_42_0 = 1, var_42_3 do
		local var_42_4 = var_42_0:GetDataSourceAtIndex(iter_42_0 - 1)

		if var_42_4 then
			local var_42_5

			if CONDITIONS.IsMagmaGameMode() then
				var_42_5 = MenuBuilder.BuildRegisteredType("BRFeatureButton", {
					controllerIndex = arg_42_1,
					index = iter_42_0,
					alternateBkgMask = CONDITIONS.IsVanguardRevealed()
				})

				var_42_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * PlaylistUtils.BUTTON_COLLAPSE_BOTTOM_SIZE)

				var_42_5.id = arg_42_3 and arg_42_3.id and arg_42_3.id or "FeaturedButton" .. iter_42_0
			else
				var_42_5 = MenuBuilder.BuildRegisteredType("PlaylistFeaturedButton", {
					controllerIndex = arg_42_1
				})

				var_42_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 50)

				var_42_5.id = "FeaturedButton" .. iter_42_0
			end

			if arg_42_0.QuickPlayButtonContainer then
				var_42_5.navigation = {}
				var_42_5.navigation.right = arg_42_0.QuickPlayButtonContainer.QuickPlayFilterButton
			end

			PlaylistUtils.InitializePlaylistButton(var_42_5, var_42_4, arg_42_1)

			local var_42_6 = var_42_4.playlistIndex:GetValue(arg_42_1)
			local var_42_7 = arg_42_2.index:GetValue(arg_42_1)

			if var_42_7 ~= nil and var_42_6 ~= nil then
				local var_42_8 = var_42_4.isNew:GetValue(arg_42_1) == 1

				var_42_5:SetNew(var_42_8)
				var_42_5:UpdateBreadcrumb()

				var_42_5.isEarlyAccess = var_42_4.isEarlyAccess:GetValue(arg_42_1) == 1

				PlaylistUtils.UpdateBackgroundImage(var_42_5.Background, arg_42_1, Playlist.DIFGFDHIF(var_42_7, var_42_6))
			end

			local var_42_9 = PlaylistUtils.isEarlyAccessLocked(button, var_42_4, arg_42_1)
			local var_42_10 = var_42_4.isForceLocked and var_42_4.isForceLocked:GetValue(arg_42_1)

			var_42_5._isForceLocked = var_42_10

			local var_42_11 = var_42_2 or var_42_10 or var_42_9

			var_42_5:SetButtonDisabled(var_42_11)

			if not CONDITIONS.IsMagmaGameMode(arg_42_0) then
				arg_42_0:AddButtonTooltipData(arg_42_1, var_42_5, var_42_2)
			end

			arg_42_0:InsertIntoButtonList(var_42_5, arg_42_0.featuredButtonWidgets, PlaylistUtils.ButtonType.FEATURED)
		end
	end
end

function PlaylistUtils.SetupPromotedButtons(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = math.min(#arg_43_2, PlaylistUtils.MAX_PROMOTED_GAMEMODE_BUTTONS)

	for iter_43_0 = 1, var_43_0 do
		local var_43_1 = arg_43_2[iter_43_0]
		local var_43_2

		if CONDITIONS.IsMagmaGameMode() then
			var_43_2 = MenuBuilder.BuildRegisteredType("BRPromotedButton", {
				controllerIndex = arg_43_1
			})

			var_43_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 130)
		else
			var_43_2 = MenuBuilder.BuildRegisteredType("PlaylistPromotedButton", {
				controllerIndex = arg_43_1
			})

			var_43_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 50)
		end

		var_43_2.id = arg_43_3 and arg_43_3.id and arg_43_3.id or "PromotedButton" .. iter_43_0

		if arg_43_0.QuickPlayButtonContainer then
			var_43_2.navigation = {}
			var_43_2.navigation.right = arg_43_0.QuickPlayButtonContainer.QuickPlayFilterButton
		end

		PlaylistUtils.InitializePlaylistButton(var_43_2, var_43_1, arg_43_1)
		arg_43_0:InsertIntoButtonList(var_43_2, arg_43_0.promotedButtonWidgets, PlaylistUtils.ButtonType.PROMOTED)

		local var_43_3 = var_43_1.playlists
		local var_43_4 = var_43_3:GetCountValue(arg_43_1)

		for iter_43_1 = 1, var_43_4 do
			local var_43_5 = var_43_3:GetDataSourceAtIndex(iter_43_1 - 1)

			if var_43_5 then
				local var_43_6 = var_43_5.playlistIndex:GetValue(arg_43_1)

				if var_43_1.index:GetValue(arg_43_1) ~= nil and var_43_6 ~= nil then
					local var_43_7 = var_43_5.isNew:GetValue(arg_43_1) == 1

					var_43_2:SetNew(var_43_7)
					var_43_2:UpdateBreadcrumb()

					if var_43_7 then
						break
					end
				end
			end
		end
	end

	local var_43_8 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	for iter_43_2 = 1, #arg_43_0.promotedButtonWidgets do
		arg_43_0.promotedButtonWidgets[iter_43_2]:SetButtonDisabled(var_43_8)

		if not CONDITIONS.IsMagmaGameMode(arg_43_0) then
			arg_43_0:AddButtonTooltipData(arg_43_1, arg_43_0.promotedButtonWidgets[iter_43_2], var_43_8)
		end
	end
end

function PlaylistUtils.AddDisableOtherButtonFocusOnButtons(arg_44_0)
	local function var_44_0(arg_45_0)
		for iter_45_0, iter_45_1 in ipairs(arg_44_0.brGameModePlayButtonWidgets) do
			if iter_45_1.id ~= arg_45_0.id and iter_45_1.OnButtonLoseFocus then
				iter_45_1:OnButtonLoseFocus()
			end
		end

		for iter_45_2, iter_45_3 in ipairs(arg_44_0.featuredButtonWidgets) do
			if iter_45_3.id ~= arg_45_0.id and iter_45_3.OnButtonLoseFocus then
				iter_45_3:OnButtonLoseFocus()
			end
		end

		for iter_45_4, iter_45_5 in ipairs(arg_44_0.promotedButtonWidgets) do
			if iter_45_5.id ~= arg_45_0.id and iter_45_5.OnButtonLoseFocus then
				iter_45_5:OnButtonLoseFocus()
			end
		end
	end

	local function var_44_1(arg_46_0)
		arg_46_0:addEventHandler("button_over", function(arg_47_0, arg_47_1)
			var_44_0(arg_46_0)
		end)
	end

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.brGameModePlayButtonWidgets) do
		var_44_1(iter_44_1)
	end

	for iter_44_2, iter_44_3 in ipairs(arg_44_0.featuredButtonWidgets) do
		var_44_1(iter_44_3)
	end

	for iter_44_4, iter_44_5 in ipairs(arg_44_0.promotedButtonWidgets) do
		var_44_1(iter_44_5)
	end
end

function PlaylistUtils.UpdateDisabledStateOnButtons(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	for iter_48_0 = 1, #arg_48_2 do
		local var_48_1 = arg_48_2[iter_48_0]
		local var_48_2 = var_48_1:GetDataSource()
		local var_48_3 = var_48_1.isEarlyAccess
		local var_48_4 = var_48_2 and PlaylistUtils.isEarlyAccessLocked(var_48_1, var_48_2, arg_48_0) or false
		local var_48_5 = var_48_2 and var_48_2.isForceLocked and var_48_2.isForceLocked:GetValue(arg_48_0)

		if var_48_5 then
			var_48_1:SetButtonDisabled(var_48_5)
			var_48_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_PLAYLIST_LOCKED"))
			arg_48_1:AddButtonTooltipData(arg_48_0, var_48_1, var_48_5)
		elseif var_48_0 then
			var_48_1:SetButtonDisabled(var_48_0)
			var_48_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
			arg_48_1:AddButtonTooltipData(arg_48_0, var_48_1, var_48_0)
		elseif var_48_4 then
			var_48_1:SetButtonDisabled(var_48_4)
			var_48_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/REBIRTH_EARLY_ACCESS_LOCKED"))
			var_48_1.Background.BackgroundImage:setImage(RegisterMaterial("button_rebirth_inactive"))
			arg_48_1:AddButtonTooltipData(arg_48_0, var_48_1, var_48_4)
		elseif Lobby.IsSplitScreenEnabled() then
			local var_48_6 = false

			if var_48_2 then
				if var_48_2.playlists then
					var_48_6 = PlaylistUtils.DoesCategorySupportSplitScreen(var_48_2, arg_48_0)
				else
					var_48_6 = PlaylistUtils.DoesPlaylistSupportSplitScreen(var_48_2, arg_48_0)
				end
			end

			if not var_48_6 then
				var_48_1:SetButtonDisabled(true)

				if var_48_2 then
					var_48_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MODE_DOESNOT_SUPPORT_SPLITSCREEN", Engine.JCBDICCAH(var_48_1:GetDataSource().name:GetValue(arg_48_0))))
				end

				arg_48_1:AddButtonTooltipData(arg_48_0, var_48_1, true)
			else
				var_48_1:SetButtonDisabled(false)
			end
		else
			var_48_1:SetButtonDisabled(false)
		end
	end
end

function PlaylistUtils.UpdateBackgroundImage(arg_49_0, arg_49_1, arg_49_2)
	if arg_49_0 and arg_49_2 and #arg_49_2 > 0 and not (function(arg_50_0, arg_50_1)
		local var_50_0 = StringTable.BJJBBCJGEJ(CSV.playlistSpriteButtonData.file, CSV.playlistSpriteButtonData.cols.image, arg_50_1)
		local var_50_1 = tonumber(var_50_0)

		if not var_50_1 or var_50_1 < 0 then
			return false
		end

		local var_50_2 = CSV.ReadRow(CSV.playlistSpriteButtonData, var_50_1)
		local var_50_3 = {
			image = var_50_2.image,
			rows = tonumber(var_50_2.rows),
			columns = tonumber(var_50_2.columns),
			playbackRate = tonumber(var_50_2.playbackRate),
			stopFrame = tonumber(var_50_2.stopFrame),
			looping = tonumber(var_50_2.loop) == 1
		}

		arg_49_0:SetBackgroundAsSprite(var_50_3)

		return true
	end)(arg_49_1, arg_49_2) then
		arg_49_0.BackgroundImage:setImage(RegisterMaterial(arg_49_2))
	end
end

function PlaylistUtils.DebugDumpPlaylists(arg_51_0)
	DebugPrint("Playlists")

	local var_51_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_51_1 = var_51_0:GetCountValue(arg_51_0) - 1

	for iter_51_0 = 0, var_51_1 do
		local var_51_2 = var_51_0:GetDataSourceAtIndex(iter_51_0)
		local var_51_3 = var_51_2.playlists
		local var_51_4 = var_51_3:GetCountValue(arg_51_0)

		DebugPrint("Category: " .. var_51_2.name:GetValue(arg_51_0))

		for iter_51_1 = 1, var_51_4 do
			local var_51_5 = var_51_3:GetDataSourceAtIndex(iter_51_1 - 1)

			DebugPrint("Playlist Name: " .. var_51_5.name:GetValue(arg_51_0))
			DebugPrint("Playlist Indx: " .. var_51_5.playlistIndex:GetValue(arg_51_0))
			DebugPrint("Playlist Ctgy: " .. var_51_5.categoryIndex:GetValue(arg_51_0))
			DebugPrint("")
		end
	end
end

function PlaylistUtils.GetPlaylistConditions(arg_52_0, arg_52_1)
	local var_52_0 = {
		isCrossPlayRequired = arg_52_1.minPlayerSize:GetValue(arg_52_0) >= Dvar.CFHDGABACF("MTTRPNMPRP"),
		showSplitScreenWarning = arg_52_1.maxPlayerSize:GetValue(arg_52_0) > Lobby.MaxPlayerCountForSplitscreen and Lobby.IsSplitScreenEnabled()
	}
	local var_52_1 = arg_52_1.maxPartySize:GetValue(arg_52_0)
	local var_52_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count"):GetValue(arg_52_0) or 1

	var_52_0.activePartyMemberCount = var_52_2
	var_52_0.showTooManyPeopleInPartyWarning = var_52_1 < var_52_2
	var_52_0.showXPModifier = arg_52_1.xpScale:GetValue(arg_52_0) > 1 and true or false
	var_52_0.showSquadFillRequired = PlaylistUtils.DoesPlaylistRequireSquadFill(arg_52_0, arg_52_1)

	return var_52_0
end

function PlaylistUtils.GetCurrentFilterDetails(arg_53_0, arg_53_1)
	local var_53_0 = ""
	local var_53_1 = ""
	local var_53_2 = arg_53_0.playlists
	local var_53_3 = var_53_2:GetCountValue(arg_53_1)

	for iter_53_0 = 0, var_53_3 do
		local var_53_4, var_53_5 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_53_2, iter_53_0)

		if var_53_4 and var_53_5 then
			local var_53_6 = var_53_2:GetDataSourceAtIndex(var_53_5)
			local var_53_7 = var_53_6.name:GetValue(arg_53_1)
			local var_53_8 = var_53_6.ID:GetValue(arg_53_1)
			local var_53_9 = " | " .. tostring(var_53_8) .. " " .. "( " .. var_53_7 .. " )"
			local var_53_10, var_53_11 = Playlist.CGJBAEBBG(var_53_4, var_53_5)

			if var_53_11 then
				var_53_0 = var_53_0 .. var_53_9
			else
				var_53_1 = var_53_1 .. var_53_9
			end
		end
	end

	return var_53_0, var_53_1
end

local function var_0_1(arg_54_0, arg_54_1)
	assert(arg_54_1.dataSource)

	local var_54_0 = PlaylistUtils.GetMaxPlayersAllowedInParty(arg_54_1.dataSource, arg_54_1.controllerIndex)
	local var_54_1 = (LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count"):GetValue(arg_54_1.controllerIndex) or 0) - var_54_0

	arg_54_1.title = arg_54_1.title or Engine.CBBHFCGDIC("LUA_MENU_MP/QUICKPLAY_LOCKED")
	arg_54_1.message = arg_54_1.message or Engine.CBBHFCGDIC("LUA_MENU_MP/ALL_PLAYLIST_LOCKED", var_54_1)
	arg_54_1.buttons = arg_54_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_54_2 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_54_1)

	var_54_2.id = "PlaylistMatchmakingFilterLockedPopup"

	return var_54_2
end

MenuBuilder.registerType("PlaylistMatchmakingFilterLockedPopup", var_0_1)

local function var_0_2(arg_55_0, arg_55_1)
	assert(arg_55_1.onAccept)

	arg_55_1.title = Engine.CBBHFCGDIC("LUA_MENU_MP/SCARE_WARNING_TITLE")
	arg_55_1.message = Engine.CBBHFCGDIC("LUA_MENU_MP/SCARE_WARNING_DESC")
	arg_55_1.imageOverride = "ui_shared_transparent"
	arg_55_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("MENU/OK"),
			action = arg_55_1.onAccept
		},
		{
			label = Engine.CBBHFCGDIC("MENU/CANCEL")
		}
	}

	local var_55_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_55_1)

	var_55_0.id = "PlaylistScareWarningPopup"

	return var_55_0
end

MenuBuilder.registerType("PlaylistScareWarningPopup", var_0_2)

local function var_0_3(arg_56_0, arg_56_1)
	assert(arg_56_1.onAccept)

	local var_56_0 = PlaylistUtils.GetActivePlaylistRestrictionTypeData()

	arg_56_1.title = Engine.CBBHFCGDIC(var_56_0.exclusiveAccessRestrictedPopupTitle or "LUA_MENU_MP/EXCLUSIVE_ACCESS")
	arg_56_1.message = Engine.CBBHFCGDIC(var_56_0.exclusiveAccessRestrictedPopupDesc or "LUA_MENU_MP/EXCLUSIVE_ACCESS_VG_DESC")
	arg_56_1.width = 550
	arg_56_1.yesAction = arg_56_1.onAccept
	arg_56_1.yesLabel = Engine.CBBHFCGDIC(var_56_0.exclusiveAccessRestrictedPopupConfirmBtnText or "LUA_MENU/VIEW_STORE")
	arg_56_1.noLabel = Engine.CBBHFCGDIC(var_56_0.exclusiveAccessRestrictedPopupCancelBtnText or "MENU/CANCEL")

	local var_56_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", arg_56_1)

	var_56_1.id = "PlaylistRestrictionPopupExclusiveAccessRestricted"

	return var_56_1
end

MenuBuilder.registerType("PlaylistRestrictionPopupExclusiveAccessRestricted", var_0_3)

local function var_0_4(arg_57_0, arg_57_1)
	assert(arg_57_1.onAccept)

	local var_57_0 = PlaylistUtils.GetActivePlaylistRestrictionTypeData()

	arg_57_1.title = Engine.CBBHFCGDIC(var_57_0.exclusiveAccessWarningPopupTitle or "LUA_MENU_MP/EXCLUSIVE_ACCESS")
	arg_57_1.message = Engine.CBBHFCGDIC(var_57_0.exclusiveAccessWarningPopupDesc or "MENU/DISBANDPARTYENTERDLCMODEPARTYHOST")
	arg_57_1.yesAction = arg_57_1.onAccept
	arg_57_1.yesLabel = Engine.CBBHFCGDIC(var_57_0.exclusiveAccessWarningPopupConfirmBtnText or "MENU/OK")
	arg_57_1.noLabel = Engine.CBBHFCGDIC(var_57_0.exclusiveAccessWarningPopupCancelBtnText or "MENU/CANCEL")

	local var_57_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", arg_57_1)

	var_57_1.id = "PlaylistRestrictionPopupExclusiveAccessWarning"

	return var_57_1
end

MenuBuilder.registerType("PlaylistRestrictionPopupExclusiveAccessWarning", var_0_4)

local function var_0_5(arg_58_0, arg_58_1)
	local var_58_0 = PlaylistUtils.GetActivePlaylistRestrictionTypeData()

	arg_58_1.title = Engine.CBBHFCGDIC(var_58_0.partyRemovedPopupTitle or "LUA_MENU_MP/PARTY_WARNING")
	arg_58_1.message = Engine.CBBHFCGDIC(var_58_0.partyRemovedPopupDesc or "LUA_MENU_MP/PLAYLIST_RESTRICTION_REMOVED_FROM_PARTY")
	arg_58_1.label = Engine.CBBHFCGDIC(var_58_0.partyRemovedPopupBtnText or "MENU/OK")

	local var_58_1 = MenuBuilder.BuildRegisteredType("PopupOK", arg_58_1)

	var_58_1.id = "PlaylistRestrictionPopupRemovedFromParty"

	return var_58_1
end

MenuBuilder.registerType("PlaylistRestrictionPopupRemovedFromParty", var_0_5)
