module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._publicPlaylistsDataSource = arg_1_1
end

local function var_0_1(arg_2_0)
	return arg_2_0._publicPlaylistsDataSource
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._featuredPlaylistDataSource = arg_3_1
end

local function var_0_3(arg_4_0)
	return arg_4_0._featuredPlaylistDataSource
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_5_1 = false
	local var_5_2 = var_5_0:GetCountValue(arg_5_1) - 1

	for iter_5_0 = 0, var_5_2 do
		local var_5_3 = var_5_0:GetDataSourceAtIndex(iter_5_0)
		local var_5_4 = var_5_3.index:GetValue(arg_5_1)

		if Playlist.DDIDBIIJIF(var_5_4) then
			arg_5_0:SetFeaturedPlaylistsDataSource(var_5_3)
		else
			arg_5_0:SetPublicPlaylistsDataSource(var_5_3)
		end

		if not var_5_1 then
			local var_5_5 = var_5_3.playlists:GetCountValue(arg_5_1) - 1

			for iter_5_1 = 0, var_5_5 do
				if var_5_3.playlists:GetDataSourceAtIndex(iter_5_1).isNew:GetValue(arg_5_1) == 1 then
					var_5_1 = true

					break
				end
			end
		end
	end

	arg_5_0:SetupPublicMatchButton(arg_5_1, var_5_1)
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:SetDataSource(arg_6_1, arg_6_2)
	arg_6_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
	arg_6_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)

	local var_6_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	arg_6_0:SetButtonDisabled(var_6_0)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = #arg_7_2

	if var_7_0 > 0 then
		arg_7_1:addElementAfter(arg_7_2[var_7_0])
	elseif arg_7_0.SurvivalButton then
		arg_7_1:addElementAfter(arg_7_0.SurvivalButton)
	elseif arg_7_0.PublicMatch then
		arg_7_1:addElementAfter(arg_7_0.PublicMatch)
	end

	table.insert(arg_7_2, arg_7_1)
end

local function var_0_7(arg_8_0, arg_8_1)
	local var_8_0 = var_0_3(arg_8_0)
	local var_8_1 = var_8_0 and var_8_0.playlists
	local var_8_2 = var_8_1 and var_8_1:GetCountValue(arg_8_1) or 0
	local var_8_3 = math.min(var_8_2, PlaylistUtils.MAX_FEATURED_GAMEMODE_BUTTONS)

	for iter_8_0 = 1, var_8_3 do
		local var_8_4 = var_8_1:GetDataSourceAtIndex(iter_8_0 - 1)

		if var_8_4 then
			local var_8_5 = MenuBuilder.BuildRegisteredType("PlaylistFeaturedButton", {
				controllerIndex = arg_8_1
			})

			var_8_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 50)
			var_0_5(var_8_5, var_8_4, arg_8_1)

			local var_8_6 = var_8_4.playlistIndex:GetValue(arg_8_1)
			local var_8_7 = var_8_0.index:GetValue(arg_8_1)

			if var_8_7 ~= nil and var_8_6 ~= nil then
				local var_8_8 = Playlist.DCFCIFABGH(var_8_7, var_8_6) == Lobby.PlaylistLockState.UNLOCKED
				local var_8_9 = var_8_4.isNew:GetValue(arg_8_1)

				var_8_9 = var_8_9 == nil and 0 or var_8_9

				var_8_5:SetNew(var_8_9 > 0)
				var_8_5:UpdateBreadcrumb({
					isButtonFocused = false,
					isButtonEnabled = var_8_8
				})
			end

			arg_8_0.FeaturedButton = var_8_5

			var_0_6(arg_8_0, var_8_5, arg_8_0._featuredButtonWidgets, PlaylistUtils.ButtonType.FEATURED)
		end
	end
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.PublicMatch then
		arg_9_0.PublicMatch:UpdateNewItemNotification(arg_9_2 and 1 or 0)
	end
end

local function var_0_9(arg_10_0, arg_10_1)
	local var_10_0 = 0

	for iter_10_0 = 0, StringTable.BFHCAIIDA(CSV.cpIntel.file) - 1 do
		local var_10_1 = CSV.ReadRow(CSV.cpIntel, iter_10_0)

		var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, CoD.StatsGroup.Coop).cpIntelNew[var_10_1.index]:get()

		if var_10_0 == 1 then
			break
		end
	end

	arg_10_0.IntelButton:UpdateNewItemNotification(var_10_0)
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_2.PlayMenuButton then
		arg_11_2 = arg_11_2.PlayMenuButton
	end

	if arg_11_2.Description then
		if arg_11_3 == true then
			local var_11_0 = arg_11_2.Description:getText() .. "\n\n^3" .. arg_11_2.DisabledText:getText() .. "^7"

			arg_11_2:AddTooltipData(arg_11_1, {
				tooltipDescription = var_11_0
			})
		else
			arg_11_2:AddTooltipData(arg_11_1, {
				tooltipDescription = arg_11_2.Description:getText()
			})
		end
	end
end

local function var_0_11(arg_12_0, arg_12_1)
	local var_12_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	if arg_12_0.IntelButton then
		var_0_10(arg_12_0, arg_12_1, arg_12_0.IntelButton, false)
	end

	if arg_12_0.PublicMatch then
		var_0_10(arg_12_0, arg_12_1, arg_12_0.PublicMatch, var_12_0)
	end

	if arg_12_0.SurvivalButton then
		var_0_10(arg_12_0, arg_12_1, arg_12_0.SurvivalButton, var_12_0)
	end

	if arg_12_0.PrivateMatchButton then
		var_0_10(arg_12_0, arg_12_1, arg_12_0.PrivateMatchButton, var_12_0)
	end

	if arg_12_0.CinematicsButton then
		var_0_10(arg_12_0, arg_12_1, arg_12_0.CinematicsButton, false)
	end

	if arg_12_0.FeaturedButton then
		var_0_10(arg_12_0, arg_12_1, arg_12_0.FeaturedButton, var_12_0)
	end
end

local function var_0_12(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_0.PublicMatch)

	arg_13_0.SetPublicPlaylistsDataSource = var_0_0
	arg_13_0.GetPublicPlaylistsDataSource = var_0_1
	arg_13_0.SetFeaturedPlaylistsDataSource = var_0_2
	arg_13_0.GetFeaturedPlaylistsDataSource = var_0_3
	arg_13_0.SetupPublicMatchButton = var_0_8
	arg_13_0.SetupFeaturedButtons = var_0_7
	arg_13_0._featuredButtonWidgets = {}

	var_0_4(arg_13_0, arg_13_1)
	var_0_7(arg_13_0, arg_13_1)

	if arg_13_0.IntelButton then
		var_0_9(arg_13_0, arg_13_1)
	end

	local function var_13_0()
		local var_14_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		arg_13_0.PublicMatch:SetButtonDisabled(var_14_0)

		local var_14_1 = Engine.CIIBCJJCIB()
		local var_14_2 = Dvar.IBEGCHEFE("NLQPKTLNNT")

		if arg_13_0.SurvivalButton then
			if var_14_1 and not var_14_2 then
				arg_13_0.SurvivalButton:SetButtonDisabled(true)
				arg_13_0.SurvivalButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/MODE_DISABLED_CROSSPLAY"))
				arg_13_0.SurvivalButton.DisabledText:SetAnimMoveTime(8000)
			else
				arg_13_0.SurvivalButton:SetButtonDisabled(var_14_0)
				arg_13_0.SurvivalButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
				arg_13_0.SurvivalButton.DisabledText:SetAnimMoveTime(2000)
			end
		end

		if arg_13_0.PrivateMatchButton then
			arg_13_0.PrivateMatchButton:SetButtonDisabled(var_14_0)
			arg_13_0.PrivateMatchButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
		end

		for iter_14_0 = 1, #arg_13_0._featuredButtonWidgets do
			arg_13_0._featuredButtonWidgets[iter_14_0]:SetButtonDisabled(var_14_0)
		end

		var_0_11(arg_13_0, arg_13_1)
	end

	local var_13_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_13_2 = DataSources.frontEnd.lobby.memberCount

	arg_13_0:SubscribeToModel(var_13_1:GetModel(arg_13_1), var_13_0)
	arg_13_0:SubscribeToModel(var_13_2:GetModel(arg_13_1), var_13_0)
	arg_13_0:addEventHandler("update_publisher_variables", var_13_0)

	if CONDITIONS.IsSurvivalModeAllowed(arg_13_0) then
		local function var_13_3(arg_15_0)
			local var_15_0 = Dvar.IBEGCHEFE("NLQPKTLNNT")
			local var_15_1 = Engine.CIIBCJJCIB()

			if arg_15_0._partyHasCrossPlayPlayer ~= var_15_1 then
				arg_15_0._partyHasCrossPlayPlayer = var_15_1

				var_13_0()
			elseif arg_15_0._allowCrossPlayPlayersInSurvival ~= var_15_0 then
				arg_15_0._allowCrossPlayPlayersInSurvival = var_15_0

				var_13_0()
			end
		end

		local var_13_4 = LUI.UITimer.new({
			interval = 500,
			event = "check_party"
		})

		var_13_4.id = "checkPartyTimer"

		arg_13_0:addElement(var_13_4)
		arg_13_0:registerEventHandler("check_party", function(arg_16_0, arg_16_1)
			var_13_3(arg_13_0)
		end)
	end

	if arg_13_0.SurvivalButton then
		arg_13_0.SurvivalButton:addEventHandler("button_action", function(arg_17_0, arg_17_1)
			local var_17_0 = Engine.CIIBCJJCIB()
			local var_17_1 = Dvar.IBEGCHEFE("NLQPKTLNNT") or not var_17_0
			local var_17_2 = CoD.CheckForMissingSurvivalDataPacks()

			if var_17_2 ~= nil then
				LUI.FlowManager.RequestPopupMenu(arg_13_0, "PopupOK", true, arg_13_1, false, {
					title = Engine.CBBHFCGDIC("MENU/ERROR"),
					message = var_17_2
				})
			elseif Lobby.BGIADHIHAG() and var_17_1 then
				local var_17_3 = Dvar.CFHDGABACF("NNKSOPNQPS")

				if var_17_3 ~= nil then
					local function var_17_4()
						if Playlist.CEBBBFJJEB(var_17_3) then
							Engine.DAGFFDGFII("uploadstats", arg_17_1.controller)
							LUI.FlowManager.RequestAddMenu("CPPublicMatchMenu", false, arg_13_1, false, {
								openFromPlaylist = true
							})
						end
					end

					Lobby.TryNavigateToLobby(var_17_4)
				end
			end
		end)
	end

	if arg_13_0.PrivateMatchButton then
		arg_13_0.PrivateMatchButton:addEventHandler("button_action", function(arg_19_0, arg_19_1)
			if Lobby.IsSplitScreenEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_13_1, false, {
					isSplitScreenWarning = true,
					controllerIndex = arg_13_1,
					text = Engine.CBBHFCGDIC("LUA_MENU_CP/SURVIVAL_PRIVATE_MATCH")
				})
			else
				local var_19_0 = MenuBuilder.BuildRegisteredType("PrivateMatchPopup", arg_13_2)

				if CONDITIONS.IsLocalPlayAllowed(arg_13_0) then
					LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_13_1, false, {
						disableQuickAccessShortcuts = false,
						widget = var_19_0
					})
				else
					local function var_19_1()
						Lobby.OpenPrivateMatchLobby({
							controller = arg_13_1
						})
					end

					Lobby.TryNavigateToLobby(var_19_1)
				end
			end
		end)
	end

	arg_13_0.PublicMatch:addEventHandler("button_action", function(arg_21_0, arg_21_1)
		if Lobby.IsSplitScreenEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_13_1, false, {
				isSplitScreenWarning = true,
				controllerIndex = arg_13_1,
				text = Engine.CBBHFCGDIC("LUA_MENU/PUBLIC_MATCH")
			})
		else
			Engine.EBIDFIDHIE("set LSTLQTSSRM 0")
			CP.RunDefaultConfig(arg_21_1.controller)
			LUI.FlowManager.RequestAddMenu("CPPlaylistMenu", false, arg_21_1.controller, false, {
				controllerIndex = arg_13_1,
				publicPlaylistDataSource = var_0_1(arg_13_0)
			})
		end
	end)

	if arg_13_0.IntelButton then
		arg_13_0.IntelButton:addEventHandler("button_action", function(arg_22_0, arg_22_1)
			LUI.FlowManager.RequestAddMenu("CPIntel", false, arg_22_1.controller, false, {}, true)
		end)
	end

	if arg_13_0.CinematicsButton then
		arg_13_0.CinematicsButton:addEventHandler("button_action", function(arg_23_0, arg_23_1)
			LUI.FlowManager.RequestAddMenu("CPCinematicSelect", false, arg_23_1.controller, false, {}, true)
		end)
	end

	var_0_11(arg_13_0, arg_13_1)
end

function CPMainMenuButtons(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIVerticalList.new()

	var_24_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 757 * _1080p)

	var_24_0.id = "CPMainMenuButtons"

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)

	local var_24_2 = var_24_0

	var_24_0:SetSpacing(14 * _1080p)

	local var_24_3
	local var_24_4 = MenuBuilder.BuildRegisteredType("FeaturedAccordionButton", {
		controllerIndex = var_24_1
	})

	var_24_4.id = "PublicMatch"

	var_24_4.Background.BackgroundImage:setImage(RegisterMaterial("button_TDM"), 0)
	var_24_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/SPECIAL_OPERATIONS")), 0)
	var_24_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/SPECIAL_OPERATIONS_DESC"), 0)
	var_24_4.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_24_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_24_0:addElement(var_24_4)

	var_24_0.PublicMatch = var_24_4

	local var_24_5

	if CONDITIONS.IsSurvivalModeAllowed(var_24_0) then
		local var_24_6 = MenuBuilder.BuildRegisteredType("FeaturedAccordionButton", {
			controllerIndex = var_24_1
		})

		var_24_6.id = "SurvivalButton"

		var_24_6.Background.BackgroundImage:setImage(RegisterMaterial("button_ffa"), 0)
		var_24_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/WAVE_SURVIVAL")), 0)
		var_24_6.Description:setText(Engine.CBBHFCGDIC("PLAYLIST/SURVIVAL_DESC"), 0)
		var_24_6.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
		var_24_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 64, _1080p * 114)
		var_24_0:addElement(var_24_6)

		var_24_0.SurvivalButton = var_24_6
	end

	local var_24_7

	if CONDITIONS.IsMPPrivateMatchEnabled(var_24_0) then
		local var_24_8 = MenuBuilder.BuildRegisteredType("FeaturedAccordionButton", {
			controllerIndex = var_24_1
		})

		var_24_8.id = "PrivateMatchButton"

		var_24_8.Background.BackgroundImage:setImage(RegisterMaterial("button_private"), 0)
		var_24_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRIVATE_MATCH")), 0)
		var_24_8.Description:setText(Engine.CBBHFCGDIC("PLATFORM/PRIVATE_MATCH_CP_DESC"), 0)
		var_24_8.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
		var_24_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 128, _1080p * 178)
		var_24_0:addElement(var_24_8)

		var_24_0.PrivateMatchButton = var_24_8
	end

	local var_24_9
	local var_24_10 = MenuBuilder.BuildRegisteredType("PlaylistButtonSlim", {
		controllerIndex = var_24_1
	})

	var_24_10.id = "IntelButton"
	var_24_10.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_DESC")

	var_24_10.Text:SetLeft(_1080p * 20, 0)
	var_24_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INTEL")), 0)
	var_24_10.Text:SetAlignment(LUI.Alignment.Left)
	var_24_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 192, _1080p * 242)
	var_24_0:addElement(var_24_10)

	var_24_0.IntelButton = var_24_10

	local var_24_11
	local var_24_12 = MenuBuilder.BuildRegisteredType("PlaylistButtonSlim", {
		controllerIndex = var_24_1
	})

	var_24_12.id = "CinematicsButton"
	var_24_12.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU_CP/CINEMATICS_DESC")

	var_24_12.Text:SetLeft(_1080p * 20, 0)
	var_24_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/CINEMATICS")), 0)
	var_24_12.Text:SetAlignment(LUI.Alignment.Left)
	var_24_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 256, _1080p * 306)
	var_24_0:addElement(var_24_12)

	var_24_0.CinematicsButton = var_24_12

	var_0_12(var_24_0, var_24_1, arg_24_1)

	return var_24_0
end

MenuBuilder.registerType("CPMainMenuButtons", CPMainMenuButtons)
LockTable(_M)
