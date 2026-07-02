PlaylistUtils = PlaylistUtils or {}
PlaylistUtils.USE_FILTERED_PLAYLIST_ID = 200
PlaylistUtils.MAX_FEATURED_GAMEMODE_BUTTONS = 5
PlaylistUtils.MAX_PROMOTED_GAMEMODE_BUTTONS = 5
PlaylistUtils.ButtonType = {
	PROMOTED = 1,
	FEATURED = 0
}
PlaylistUtils.PlaylistLockState = {
	LOCKED_NO_FILTERS_SET = 6,
	LOCKED_MAXPARTY = 3,
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

function PlaylistUtils.GetCategoryAndPlaylistIndex(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0:GetDataSourceAtIndex(arg_1_1)

	if var_1_0 then
		local var_1_1 = var_1_0.categoryIndex:GetValue(controllerIndex)
		local var_1_2 = var_1_0.playlistIndex:GetValue(controllerIndex)

		return var_1_1, var_1_2
	end
end

function PlaylistUtils.ValidateSelection(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = 0
	local var_2_2 = {}
	local var_2_3 = {}
	local var_2_4 = {}
	local var_2_5 = false
	local var_2_6 = Dvar.CFHDGABACF("MTTRPNMPRP")
	local var_2_7 = arg_2_0.playlists
	local var_2_8 = arg_2_0.playlists:GetCountValue(arg_2_1)

	for iter_2_0 = 0, var_2_8 do
		local var_2_9, var_2_10 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_2_7, iter_2_0)

		if var_2_9 and var_2_10 then
			local var_2_11, var_2_12 = Playlist.CGJBAEBBG(var_2_9, var_2_10)

			if var_2_12 then
				local var_2_13 = Playlist.DCFCIFABGH(var_2_9, var_2_10)
				local var_2_14 = var_2_13 == Lobby.PlaylistLockState.UNLOCKED
				local var_2_15 = var_2_7:GetDataSourceAtIndex(iter_2_0)
				local var_2_16 = var_2_15.maxPlayerSize:GetValue(arg_2_1)

				if var_2_6 <= var_2_16 then
					var_2_5 = true
				end

				if not var_2_14 and var_2_13 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					table.insert(var_2_0, var_2_15)
				end

				if Playlist.DEJGAECIBG(var_2_10, var_2_9) then
					table.insert(var_2_3, var_2_15)
				end

				if var_2_16 > Lobby.MaxPlayerCountForSplitscreen then
					table.insert(var_2_2, var_2_15)
				end

				var_2_1 = var_2_1 + 1
			end
		end
	end

	var_2_4.numFiltered = var_2_1
	var_2_4.invalidPlaylists = var_2_0
	var_2_4.requiresCrossplay = var_2_5
	var_2_4.maxPlayerPlaylists = var_2_2
	var_2_4.nonF2PPlaylists = var_2_3

	return var_2_4
end

function PlaylistUtils.GetPublicPlaylistDatasources()
	local var_3_0 = "frontEnd.playlists.category"

	WipeGlobalModelsAtPath(var_3_0)
	Lobby.DFJICHHJFI(var_3_0)

	local var_3_1 = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".count")
	local var_3_2 = LUI.DataSourceFromList.new(var_3_1)

	function var_3_2.MakeDataSourceAtIndex(arg_4_0, arg_4_1)
		local var_4_0 = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".index." .. arg_4_1)
		local var_4_1 = var_3_0 .. "." .. arg_4_1 .. ".playlist"
		local var_4_2 = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".count")
		local var_4_3 = LUI.DataSourceFromList.new(var_4_2)

		function var_4_3.MakeDataSourceAtIndex(arg_5_0, arg_5_1)
			return {
				name = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".name." .. arg_5_1),
				disabled = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".disabled." .. arg_5_1),
				hasDLC = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".hasDLC." .. arg_5_1),
				image = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".image." .. arg_5_1),
				smallImage = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".smallImage." .. arg_5_1),
				desc = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".desc." .. arg_5_1),
				categoryIndex = var_4_0,
				playlistIndex = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".index." .. arg_5_1),
				minPlayerSize = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".minPlayerSize." .. arg_5_1),
				maxPlayerSize = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".maxPlayerSize." .. arg_5_1),
				minPartySize = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".minPartySize." .. arg_5_1),
				maxPartySize = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".maxPartySize." .. arg_5_1),
				timeLimit = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".timeLimit." .. arg_5_1),
				scoreLimit = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".scoreLimit." .. arg_5_1),
				numRounds = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".numRounds." .. arg_5_1),
				isNew = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".isNew." .. arg_5_1),
				xpScale = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".xpScale." .. arg_5_1),
				weaponXpScale = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".weaponXpScale." .. arg_5_1),
				battlePassXpScale = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".battlePassXpScale." .. arg_5_1),
				isLimitedTime = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".isLimitedTime." .. arg_5_1),
				ID = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".ID." .. arg_5_1)
			}
		end

		return {
			name = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".name." .. arg_4_1),
			disabled = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".disabled." .. arg_4_1),
			type = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".type." .. arg_4_1),
			desc = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".desc." .. arg_4_1),
			image = LUI.DataSourceInGlobalModel.new(var_3_0 .. ".image." .. arg_4_1),
			index = var_4_0,
			playlists = var_4_3
		}
	end

	return var_3_2
end

function PlaylistUtils.AtLeastOneGameModeFiltered(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.playlists
	local var_6_1 = var_6_0:GetCountValue(arg_6_1)

	for iter_6_0 = 0, var_6_1 do
		local var_6_2, var_6_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_6_0, iter_6_0)

		if var_6_2 and var_6_3 then
			local var_6_4, var_6_5 = Playlist.CGJBAEBBG(var_6_2, var_6_3)

			if var_6_5 then
				return true
			end
		end
	end

	return false
end

function PlaylistUtils.SelectAll(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_0.playlists
	local var_7_1 = var_7_0:GetCountValue(arg_7_1)

	for iter_7_0 = 0, var_7_1 do
		local var_7_2, var_7_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_7_0, iter_7_0)

		if var_7_2 and var_7_3 then
			local var_7_4, var_7_5 = Playlist.CGJBAEBBG(var_7_2, var_7_3)
			local var_7_6 = Playlist.DCFCIFABGH(var_7_2, var_7_3) == Lobby.PlaylistLockState.UNLOCKED

			if var_7_5 and not arg_7_2 or not var_7_5 and arg_7_2 and (var_7_6 or arg_7_3) then
				Playlist.CBHGDIGEI(var_7_2, var_7_3)
			end
		end
	end
end

function PlaylistUtils.CheckIfAllFiltered(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.playlists
	local var_8_1 = var_8_0:GetCountValue(arg_8_1)

	for iter_8_0 = 0, var_8_1 do
		local var_8_2, var_8_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_8_0, iter_8_0)

		if var_8_2 and var_8_3 then
			local var_8_4 = Playlist.DCFCIFABGH(var_8_2, var_8_3) == Lobby.PlaylistLockState.UNLOCKED
			local var_8_5, var_8_6 = Playlist.CGJBAEBBG(var_8_2, var_8_3)

			if var_8_4 and not var_8_6 then
				return false
			end
		end
	end

	return true
end

function PlaylistUtils.CheckIfAllLocked(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.playlists
	local var_9_1 = var_9_0:GetCountValue(arg_9_1)

	for iter_9_0 = 0, var_9_1 do
		local var_9_2, var_9_3 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_9_0, iter_9_0)

		if var_9_2 and var_9_3 and Playlist.DCFCIFABGH(var_9_2, var_9_3) == Lobby.PlaylistLockState.UNLOCKED then
			return false
		end
	end

	return true
end

function PlaylistUtils.GetMaxPlayersAllowedInParty(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.playlists
	local var_10_1 = var_10_0:GetCountValue(arg_10_1)
	local var_10_2 = -1

	for iter_10_0 = 0, var_10_1 do
		local var_10_3, var_10_4 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_10_0, iter_10_0)

		if var_10_3 and var_10_4 then
			local var_10_5 = var_10_0:GetDataSourceAtIndex(iter_10_0)
			local var_10_6, var_10_7 = Playlist.CGJBAEBBG(var_10_3, var_10_4)

			if var_10_7 then
				local var_10_8 = var_10_5.maxPartySize:GetValue(arg_10_1)

				if var_10_2 < 0 or var_10_8 < var_10_2 then
					var_10_2 = var_10_8
				end
			end
		end
	end

	return var_10_2
end

function PlaylistUtils.DoesPlaylistSupportSplitScreen(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.categoryIndex:GetValue(arg_11_1)
	local var_11_1 = arg_11_0.playlistIndex:GetValue(arg_11_1)
	local var_11_2 = true

	if var_11_0 and var_11_1 then
		var_11_2 = Playlist.FDGFJJGG(var_11_1, var_11_0)
	end

	if Dvar.IBEGCHEFE("NLMOPNQOTT") then
		local var_11_3

		if arg_11_0.maxPlayerSize then
			var_11_3 = arg_11_0.maxPlayerSize:GetValue(arg_11_1) <= Lobby.MaxPlayerCountForSplitscreen
		end

		var_11_2 = var_11_2 or var_11_3
	end

	return not var_11_2
end

function PlaylistUtils.DoesCategorySupportSplitScreen(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.playlists
	local var_12_1 = var_12_0:GetCountValue(arg_12_1)

	for iter_12_0 = 0, var_12_1 - 1 do
		local var_12_2 = var_12_0:GetDataSourceAtIndex(iter_12_0)

		if not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_12_2, arg_12_1) then
			return false
		end
	end

	return true
end

function PlaylistUtils.DoesCategoryContainXPBoost(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.playlists
	local var_13_1 = var_13_0:GetCountValue(arg_13_1)
	local var_13_2 = {
		[LOOT.doubleXpTypes.XP] = false,
		[LOOT.doubleXpTypes.WEAPON] = false,
		[LOOT.doubleXpTypes.BATTLE_PASS] = false
	}

	for iter_13_0 = 0, var_13_1 - 1 do
		local var_13_3 = var_13_0:GetDataSourceAtIndex(iter_13_0)
		local var_13_4 = var_13_3.xpScale:GetValue(arg_13_1)
		local var_13_5 = var_13_3.weaponXpScale:GetValue(arg_13_1)
		local var_13_6 = var_13_3.battlePassXpScale:GetValue(arg_13_1)

		if var_13_4 and var_13_4 > 1 then
			var_13_2[LOOT.doubleXpTypes.XP] = true
		end

		if var_13_5 and var_13_5 > 1 then
			var_13_2[LOOT.doubleXpTypes.WEAPON] = true
		end

		if var_13_6 and var_13_6 > 1 then
			var_13_2[LOOT.doubleXpTypes.BATTLE_PASS] = true
		end
	end

	return var_13_2
end

function PlaylistUtils.GetFilteredGameModeIcons(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = arg_14_1.playlists
	local var_14_2 = var_14_1:GetCountValue(arg_14_0)

	for iter_14_0 = 0, var_14_2 do
		local var_14_3, var_14_4 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_14_1, iter_14_0)

		if var_14_3 and var_14_4 then
			local var_14_5, var_14_6 = Playlist.CGJBAEBBG(var_14_3, var_14_4)

			if var_14_6 then
				local var_14_7 = var_14_1:GetDataSourceAtIndex(iter_14_0)

				table.insert(var_14_0, var_14_7.image:GetValue(arg_14_0))
			end
		end
	end

	return var_14_0
end

function PlaylistUtils.ContainsNewPlaylist(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.playlists:GetCountValue(arg_15_0) - 1

	for iter_15_0 = 0, var_15_0 do
		local var_15_1 = arg_15_1.playlists:GetDataSourceAtIndex(iter_15_0).isNew:GetValue(arg_15_0)

		if var_15_1 and var_15_1 == 1 then
			return true
		end
	end

	return false
end

function PlaylistUtils.InitializePlaylistButton(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0:SetDataSource(arg_16_1, arg_16_2)
	arg_16_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
	arg_16_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)

	local var_16_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	arg_16_0:SetButtonDisabled(var_16_0)

	if arg_16_0.OnDataSourceAssigned then
		arg_16_0:OnDataSourceAssigned()
	end
end

function PlaylistUtils.FindBRPostTutorialPlaylist(arg_17_0, arg_17_1)
	local var_17_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_17_1 = var_17_0:GetCountValue(arg_17_0) - 1

	for iter_17_0 = 0, var_17_1 do
		local var_17_2 = var_17_0:GetDataSourceAtIndex(iter_17_0).playlists
		local var_17_3 = var_17_2:GetCountValue(arg_17_0)

		for iter_17_1 = 0, var_17_3 do
			local var_17_4, var_17_5 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_17_2, iter_17_1)

			if var_17_4 and var_17_5 then
				if arg_17_1 == MP.WarzonePracticePopupStatus.GO_TO_WARZONE_LOBBY and Playlist.CFADJIBBED(var_17_5, var_17_4) then
					return {
						categoryIndex = var_17_4,
						playlistIndex = var_17_5
					}
				elseif arg_17_1 == MP.WarzonePracticePopupStatus.GO_TO_BLOODMONEY_LOBBY and Playlist.CBCDIIAFAA(var_17_5, var_17_4) then
					return {
						categoryIndex = var_17_4,
						playlistIndex = var_17_5
					}
				end
			end
		end
	end

	return nil
end

function PlaylistUtils.DoesPlaylistContainGameType(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1.categoryIndex:GetValue(arg_18_0)
	local var_18_1 = arg_18_1.playlistIndex:GetValue(arg_18_0)
	local var_18_2 = Playlist.EAAGDGCFFC(var_18_0, var_18_1)

	for iter_18_0 = 1, #var_18_2 do
		if var_18_2[iter_18_0] == arg_18_2 then
			return true
		end
	end

	return false
end

function PlaylistUtils.DoesPlaylistIDContainGameType(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = PlaylistUtils.FindPlaylistDataSourceFromID(arg_19_0, arg_19_1)

	if var_19_0 then
		return PlaylistUtils.DoesPlaylistContainGameType(arg_19_0, var_19_0, arg_19_2)
	end

	return false
end

function PlaylistUtils.GetCategoryGameTypes(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.playlists
	local var_20_1 = var_20_0:GetCountValue(arg_20_0)
	local var_20_2 = {}

	for iter_20_0 = 1, var_20_1 do
		local var_20_3 = var_20_0:GetDataSourceAtIndex(iter_20_0 - 1)

		if var_20_3 then
			local var_20_4 = var_20_3.categoryIndex:GetValue(arg_20_0)
			local var_20_5 = var_20_3.playlistIndex:GetValue(arg_20_0)
			local var_20_6 = Playlist.EAAGDGCFFC(var_20_4, var_20_5)

			for iter_20_1 = 1, #var_20_6 do
				var_20_2[var_20_6[iter_20_1]] = true
			end
		end
	end

	return var_20_2
end

function PlaylistUtils.FindPlaylistDataSourceFromID(arg_21_0, arg_21_1)
	local var_21_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_21_1 = var_21_0:GetCountValue(arg_21_0) - 1

	for iter_21_0 = 0, var_21_1 do
		local var_21_2 = var_21_0:GetDataSourceAtIndex(iter_21_0).playlists
		local var_21_3 = var_21_2:GetCountValue(arg_21_0)

		for iter_21_1 = 1, var_21_3 do
			local var_21_4 = var_21_2:GetDataSourceAtIndex(iter_21_1 - 1)

			if var_21_4.ID:GetValue(arg_21_0) == arg_21_1 then
				return var_21_4
			end
		end
	end

	return nil
end

function PlaylistUtils.SetupFeaturedButtons(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_2.playlists
	local var_22_1 = var_22_0:GetCountValue(arg_22_1)
	local var_22_2 = math.min(var_22_1, PlaylistUtils.MAX_FEATURED_GAMEMODE_BUTTONS)

	for iter_22_0 = 1, var_22_2 do
		local var_22_3 = var_22_0:GetDataSourceAtIndex(iter_22_0 - 1)

		if var_22_3 then
			local var_22_4

			if CONDITIONS.IsMagmaGameMode() then
				var_22_4 = MenuBuilder.BuildRegisteredType("BRFeatureButton", {
					controllerIndex = arg_22_1
				})

				var_22_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 130)

				var_22_4.id = "FeaturedButton" .. iter_22_0
			else
				var_22_4 = MenuBuilder.BuildRegisteredType("PlaylistFeaturedButton", {
					controllerIndex = arg_22_1
				})

				var_22_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 50)

				var_22_4.id = "FeaturedButton" .. iter_22_0
			end

			if arg_22_0.QuickPlayButtonContainer then
				var_22_4.navigation = {}
				var_22_4.navigation.right = arg_22_0.QuickPlayButtonContainer.QuickPlayFilterButton
			end

			PlaylistUtils.InitializePlaylistButton(var_22_4, var_22_3, arg_22_1)

			local var_22_5 = var_22_3.playlistIndex:GetValue(arg_22_1)
			local var_22_6 = arg_22_2.index:GetValue(arg_22_1)

			if var_22_6 ~= nil and var_22_5 ~= nil then
				local var_22_7 = var_22_3.isNew:GetValue(arg_22_1) == 1

				var_22_4:SetNew(var_22_7)
				var_22_4:UpdateBreadcrumb()

				local var_22_8 = Playlist.DIFGFDHIF(var_22_6, var_22_5)

				if var_22_8 and #var_22_8 > 0 and var_22_4.Background and var_22_4.Background.BackgroundImage then
					var_22_4.Background.BackgroundImage:setImage(RegisterMaterial(var_22_8))
				end
			end

			arg_22_0:InsertIntoButtonList(var_22_4, arg_22_0.featuredButtonWidgets, PlaylistUtils.ButtonType.FEATURED)
		end
	end

	local var_22_9 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	for iter_22_1 = 1, #arg_22_0.featuredButtonWidgets do
		arg_22_0.featuredButtonWidgets[iter_22_1]:SetButtonDisabled(var_22_9)

		if not CONDITIONS.IsMagmaGameMode(arg_22_0) then
			arg_22_0:AddButtonTooltipData(arg_22_1, arg_22_0.featuredButtonWidgets[iter_22_1], var_22_9)
		end
	end
end

function PlaylistUtils.SetupPromotedButtons(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = math.min(#arg_23_2, PlaylistUtils.MAX_PROMOTED_GAMEMODE_BUTTONS)

	for iter_23_0 = 1, var_23_0 do
		local var_23_1 = arg_23_2[iter_23_0]
		local var_23_2

		if CONDITIONS.IsMagmaGameMode() then
			var_23_2 = MenuBuilder.BuildRegisteredType("BRPromotedButton", {
				controllerIndex = arg_23_1
			})

			var_23_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 130)
		else
			var_23_2 = MenuBuilder.BuildRegisteredType("PlaylistPromotedButton", {
				controllerIndex = arg_23_1
			})

			var_23_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 50)
		end

		var_23_2.id = "PromotedButton" .. iter_23_0

		if arg_23_0.QuickPlayButtonContainer then
			var_23_2.navigation = {}
			var_23_2.navigation.right = arg_23_0.QuickPlayButtonContainer.QuickPlayFilterButton
		end

		PlaylistUtils.InitializePlaylistButton(var_23_2, var_23_1, arg_23_1)
		arg_23_0:InsertIntoButtonList(var_23_2, arg_23_0.promotedButtonWidgets, PlaylistUtils.ButtonType.PROMOTED)

		local var_23_3 = var_23_1.playlists
		local var_23_4 = var_23_3:GetCountValue(arg_23_1)

		for iter_23_1 = 1, var_23_4 do
			local var_23_5 = var_23_3:GetDataSourceAtIndex(iter_23_1 - 1)

			if var_23_5 then
				local var_23_6 = var_23_5.playlistIndex:GetValue(arg_23_1)

				if var_23_1.index:GetValue(arg_23_1) ~= nil and var_23_6 ~= nil then
					local var_23_7 = var_23_5.isNew:GetValue(arg_23_1) == 1

					var_23_2:SetNew(var_23_7)
					var_23_2:UpdateBreadcrumb()

					if var_23_7 then
						break
					end
				end
			end
		end
	end

	local var_23_8 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	for iter_23_2 = 1, #arg_23_0.promotedButtonWidgets do
		arg_23_0.promotedButtonWidgets[iter_23_2]:SetButtonDisabled(var_23_8)

		if not CONDITIONS.IsMagmaGameMode(arg_23_0) then
			arg_23_0:AddButtonTooltipData(arg_23_1, arg_23_0.featuredButtonWidgets[iter_23_2], var_23_8)
		end
	end
end

function PlaylistUtils.UpdateDisabledStateOnButtons(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	for iter_24_0 = 1, #arg_24_2 do
		local var_24_1 = arg_24_2[iter_24_0]

		if var_24_0 then
			var_24_1:SetButtonDisabled(var_24_0)
			var_24_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
			arg_24_1:AddButtonTooltipData(arg_24_0, var_24_1, var_24_0)
		elseif Lobby.IsSplitScreenEnabled() then
			local var_24_2 = var_24_1:GetDataSource()
			local var_24_3 = false

			if var_24_2 then
				if var_24_2.playlists then
					var_24_3 = PlaylistUtils.DoesCategorySupportSplitScreen(var_24_2, arg_24_0)
				else
					var_24_3 = PlaylistUtils.DoesPlaylistSupportSplitScreen(var_24_2, arg_24_0)
				end
			end

			if not var_24_3 then
				var_24_1:SetButtonDisabled(true)
				var_24_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MODE_DOESNOT_SUPPORT_SPLITSCREEN", Engine.JCBDICCAH(var_24_1:GetDataSource().name:GetValue(arg_24_0))))
				arg_24_1:AddButtonTooltipData(arg_24_0, var_24_1, true)
			else
				var_24_1:SetButtonDisabled(false)
				arg_24_1:AddButtonTooltipData(arg_24_0, var_24_1, var_24_0)
			end
		else
			var_24_1:SetButtonDisabled(false)
			arg_24_1:AddButtonTooltipData(arg_24_0, var_24_1, var_24_0)
		end
	end
end

function PlaylistUtils.DebugDumpPlaylists(arg_25_0)
	DebugPrint("Playlists")

	local var_25_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_25_1 = var_25_0:GetCountValue(arg_25_0) - 1

	for iter_25_0 = 0, var_25_1 do
		local var_25_2 = var_25_0:GetDataSourceAtIndex(iter_25_0)
		local var_25_3 = var_25_2.playlists
		local var_25_4 = var_25_3:GetCountValue(arg_25_0)

		DebugPrint("Category: " .. var_25_2.name:GetValue(arg_25_0))

		for iter_25_1 = 1, var_25_4 do
			local var_25_5 = var_25_3:GetDataSourceAtIndex(iter_25_1 - 1)

			DebugPrint("Playlist Name: " .. var_25_5.name:GetValue(arg_25_0))
			DebugPrint("Playlist Indx: " .. var_25_5.playlistIndex:GetValue(arg_25_0))
			DebugPrint("Playlist Ctgy: " .. var_25_5.categoryIndex:GetValue(arg_25_0))
			DebugPrint("")
		end
	end
end

function PlaylistUtils.GetPlaylistConditions(arg_26_0, arg_26_1)
	local var_26_0 = {
		isCrossPlayRequired = arg_26_1.minPlayerSize:GetValue(arg_26_0) >= Dvar.CFHDGABACF("MTTRPNMPRP"),
		showSplitScreenWarning = arg_26_1.maxPlayerSize:GetValue(arg_26_0) > Lobby.MaxPlayerCountForSplitscreen and Lobby.IsSplitScreenEnabled()
	}
	local var_26_1 = arg_26_1.maxPartySize:GetValue(arg_26_0)
	local var_26_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count"):GetValue(arg_26_0) or 1

	var_26_0.activePartyMemberCount = var_26_2
	var_26_0.showTooManyPeopleInPartyWarning = var_26_1 < var_26_2
	var_26_0.showXPModifier = arg_26_1.xpScale:GetValue(arg_26_0) > 1 and true or false

	return var_26_0
end

function PlaylistUtils.GetCurrentFilterDetails(arg_27_0, arg_27_1)
	local var_27_0 = ""
	local var_27_1 = ""
	local var_27_2 = arg_27_0.playlists
	local var_27_3 = var_27_2:GetCountValue(arg_27_1)

	for iter_27_0 = 0, var_27_3 do
		local var_27_4, var_27_5 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_27_2, iter_27_0)

		if var_27_4 and var_27_5 then
			local var_27_6 = var_27_2:GetDataSourceAtIndex(var_27_5)
			local var_27_7 = var_27_6.name:GetValue(arg_27_1)
			local var_27_8 = var_27_6.ID:GetValue(arg_27_1)
			local var_27_9 = " | " .. tostring(var_27_8) .. " " .. "( " .. var_27_7 .. " )"
			local var_27_10, var_27_11 = Playlist.CGJBAEBBG(var_27_4, var_27_5)

			if var_27_11 then
				var_27_0 = var_27_0 .. var_27_9
			else
				var_27_1 = var_27_1 .. var_27_9
			end
		end
	end

	return var_27_0, var_27_1
end

local function var_0_0(arg_28_0, arg_28_1)
	assert(arg_28_1.dataSource)

	local var_28_0 = PlaylistUtils.GetMaxPlayersAllowedInParty(arg_28_1.dataSource, arg_28_1.controllerIndex)
	local var_28_1 = (LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count"):GetValue(arg_28_1.controllerIndex) or 0) - var_28_0

	arg_28_1.title = arg_28_1.title or Engine.CBBHFCGDIC("LUA_MENU_MP/QUICKPLAY_LOCKED")
	arg_28_1.message = arg_28_1.message or Engine.CBBHFCGDIC("LUA_MENU_MP/ALL_PLAYLIST_LOCKED", var_28_1)
	arg_28_1.buttons = arg_28_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_28_2 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_28_1)

	var_28_2.id = "PlaylistMatchmakingFilterLockedPopup"

	return var_28_2
end

MenuBuilder.registerType("PlaylistMatchmakingFilterLockedPopup", var_0_0)
