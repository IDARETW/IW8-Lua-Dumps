DebugPrint("Running main.lua")

function OpenTitleScreen()
	if Engine.CGABICJHAI() then
		if DCache.DFCGEDHBEC() then
			local var_1_0 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("LUA_MENU/DCACHE_CLEAR_REQUEST"),
				yesAction = function()
					DCache.CAJICHGHDG(1)
					Engine.BHIJFFCAEB(Engine.CBBHFCGDIC("@LUA_MENU/DCACHE_RESTART"))
				end,
				noAction = function()
					DCache.BJEGJFBIBI()
					Engine.BHIJFFCAEB(Engine.CBBHFCGDIC("@LUA_MENU/DCACHE_RESTART"))
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", false, nil, false, var_1_0, nil, false, true)
		else
			Engine.CDGCBCBAJ("Opening PC Main Menu", 0)

			if Dvar.IBEGCHEFE("LSTQOKLTRN") then
				LUI.FlowManager.RequestRestoreMenu("MainMenuOffline", nil, nil)
			else
				LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, nil)
			end
		end
	else
		LUI.FlowManager.RequestRestoreMenu("MainLockoutMenu", nil, nil)
	end
end

function PrepareForceOpenHighlightPanel()
	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") and Engine.CFJEBEJCFC() and Engine.JCFIBGGJB() then
		Dvar.DHEGHJJJHI("NROLSNKS", true)
	end
end

function OpenInitialMenu()
	if Engine.CGABICJHAI() then
		Dvar.DHEGHJJJHI("LSOLROSLNT", false)

		if Engine.DDJFBBJAIG() then
			Dvar.DHEGHJJJHI("RMMMKOSTS", true)
			MAIN_MENU.RegisterTitleUpdateAvailableEventHandler()
		else
			Dvar.DHEGHJJJHI("RMMMKOSTS", false)
		end
	end

	if IsMlgGameBattlesMatch() then
		local var_5_0 = Engine.IJEBHJIJF()

		if not CONDITIONS.IsUserSignedInDemonware(var_5_0) then
			MLG.DEHBFHFDFJ("0")
			Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
		end
	end

	local var_5_1 = Engine.BCDJIEIDID()
	local var_5_2 = Engine.CHACGEJGIH()
	local var_5_3 = not Engine.EAAHGICFBD() and not Engine.CAADCDEEIA()

	if Dvar.IBEGCHEFE("Kleenex") then
		LUI.FlowManager.RequestRestoreMenu("LevelSelectMenu", nil, nil)
	elseif Engine.DDJFBBJAIG() and var_5_3 then
		Dvar.DHEGHJJJHI("RMMMKOSTS", false)

		if not var_5_1 or Engine.ECAJCAJJGF() or CONDITIONS.IsLazeOrOutrun() or not var_5_2 then
			if Engine.EAGHDEHDGB() then
				LUI.FlowManager.RequestRestoreMenu("splash_screens", nil, nil)
			else
				OpenTitleScreen()
			end
		else
			if Engine.CBFHIIHAGH() then
				Engine.CDGCBCBAJ("Opening PC Main Menu", 0)
			end

			local var_5_4 = Engine.IJEBHJIJF()

			LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, var_5_4)
		end
	elseif Engine.DDJFBBJAIG() and Engine.EAAHGICFBD() then
		local var_5_5 = Engine.IJEBHJIJF()

		if Tournament.BEAIBEGFFB() then
			LUI.FlowManager.RequestRestoreMenu(TOURNAMENT.GetMenuName("arena"), nil, var_5_5)
		elseif IsMlgGameBattlesMatch() then
			Engine.DAGFFDGFII("xstopparty", var_5_5)
			LUI.FlowManager.RequestRestoreMenu("GameBattlesMatchLobby", nil, var_5_5)
		elseif IsPublicMatch() and Engine.DAFGFCFHJI() then
			if Engine.HEEFCICJE() then
				LUI.FlowManager.RequestRestoreMenu("BRPublicLobby", nil, var_5_5)
			elseif Engine.EAIICIFIFA() then
				LUI.FlowManager.RequestRestoreMenu("CPPublicMatchMenu", nil, var_5_5)
			else
				LUI.FlowManager.RequestRestoreMenu("MPPublicLobby", nil, var_5_5)
			end
		elseif IsPrivateMatch() then
			if Engine.EAIICIFIFA() then
				LUI.FlowManager.RequestRestoreMenu("CPPrivateMatchLobby", nil, var_5_5)
			elseif Dvar.IBEGCHEFE("LNSMSSTTSK") == true then
				local var_5_6 = CONDITIONS.IsMagmaGameMode() and "TrialsBR" or "TrialsMP"

				LUI.FlowManager.RequestRestoreMenu(var_5_6, nil, var_5_5)
				Dvar.DHEGHJJJHI("LNSMSSTTSK", false)
			elseif Dvar.IBEGCHEFE("TKRPRPOSQ") == true then
				local var_5_7 = CONDITIONS.IsMagmaGameMode() and "TrialEventBR" or "TrialEventMP"

				Dvar.DHEGHJJJHI("TKRPRPOSQ", false)
				LUI.FlowManager.RequestRestoreMenu(var_5_7, nil, var_5_5)
			elseif Dvar.IBEGCHEFE("LNQLRSNMQS") then
				if CONDITIONS.IsMagmaGameMode() then
					local var_5_8 = Dvar.CFHDGABACF("NLOQPLMLKR")
					local var_5_9 = Dvar.IBEGCHEFE("RMTPOKQP")

					if var_5_8 == MP.WarzonePracticePopupStatus.GO_TO_WARZONE_LOBBY or var_5_8 == MP.WarzonePracticePopupStatus.GO_TO_BLOODMONEY_LOBBY then
						local var_5_10 = PlaylistUtils.FindBRPostTutorialPlaylist(var_5_5, var_5_8)

						if var_5_10 then
							if var_5_8 == MP.WarzonePracticePopupStatus.GO_TO_WARZONE_LOBBY then
								if Playlist.CDBBECIGIG(var_5_10.categoryIndex, var_5_10.playlistIndex) then
									LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, var_5_5, false)
								else
									LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, var_5_5, false, {
										tutorialType = Lobby.BRTutorialLobbyType.TUTORIAL,
										needContinue = var_5_9
									}, true)
								end
							elseif Playlist.CDBBECIGIG(var_5_10.categoryIndex, var_5_10.playlistIndex) then
								LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, var_5_5, false)
							else
								LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, var_5_5, false, {
									tutorialType = Lobby.BRTutorialLobbyType.TUTORIAL,
									needContinue = var_5_9
								}, true)
							end
						else
							LUI.FlowManager.RequestRestoreMenu("BRMainMenu", nil, var_5_5)
							LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, var_5_5, false, {
								tutorialType = Lobby.BRTutorialLobbyType.TUTORIAL,
								needContinue = var_5_9
							}, true)
						end
					else
						LUI.FlowManager.RequestRestoreMenu("BRMainMenu", nil, var_5_5)

						if var_5_8 == MP.WarzonePracticePopupStatus.GO_TO_PRACTICE_LOBBY and CONDITIONS.IsBRPracticeModeAvailable() then
							LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, var_5_5, false, {
								tutorialType = Lobby.BRTutorialLobbyType.PRACTICE,
								needContinue = var_5_9
							}, true)
						elseif var_5_8 == MP.WarzonePracticePopupStatus.GO_TO_BLOODMONEY_TUTORIAL_LOBBY and CONDITIONS.IsBMTutorialMapAvailable() then
							LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, var_5_5, false, {
								tutorialType = Lobby.BRTutorialLobbyType.BLOODMONEY,
								needContinue = var_5_9
							}, true)
						else
							LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, var_5_5, false, {
								tutorialType = Lobby.BRTutorialLobbyType.TUTORIAL,
								needContinue = var_5_9
							}, true)
						end
					end

					Dvar.DHEGHJJJHI("RMTPOKQP", false)
					Dvar.DFIJDJFIFD("NLOQPLMLKR", 0)
				end
			elseif CONDITIONS.IsMagmaGameMode() then
				if Dvar.IBEGCHEFE("LMQKOTKSSS") then
					Lobby.LeaveCustomGameLobby()
					Dvar.DFIJDJFIFD("NLOQPLMLKR", MP.WarzonePracticePopupStatus.FORCE_BR_MAIN_MENU_FROM_WZ_PRIVATE)
					LUI.FlowManager.RequestRestoreMenu("BRMainMenu", nil, var_5_5)
				else
					local var_5_11 = Dvar.IBEGCHEFE("LOQQOSNQKN")
					local var_5_12 = Dvar.CFHDGABACF("NLOQPLMLKR") == MP.WarzonePracticePopupStatus.RESTORE_BR_MAIN_MENU_FROM_WZ_PRIVATE

					if not var_5_11 or var_5_12 then
						Dvar.DFIJDJFIFD("NLOQPLMLKR", 0)
						LUI.FlowManager.RequestRestoreMenu("BRMainMenu", nil, var_5_5)
					else
						LUI.FlowManager.RequestRestoreMenu("WarzonePrivateMatchLobby", nil, var_5_5)
					end
				end
			else
				LUI.FlowManager.RequestRestoreMenu("PrivateMatchLobby", nil, var_5_5)
			end
		elseif IsSystemLink() then
			if Engine.HDDHJIBDH() then
				LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, var_5_5)
			elseif Engine.DAFGFCFHJI() then
				if Engine.EAIICIFIFA() then
					LUI.FlowManager.RequestRestoreMenu("CPSystemLinkLobby", nil, var_5_5)
				else
					LUI.FlowManager.RequestRestoreMenu("MPSystemLinkLobby", nil, var_5_5)
				end
			elseif Engine.EAIICIFIFA() then
				LUI.FlowManager.RequestRestoreMenu("CPSystemLinkMenu", nil, var_5_5)
			else
				LUI.FlowManager.RequestRestoreMenu("MPSystemLinkMenu", nil, var_5_5)
			end
		elseif IsOnlineMatch() then
			if Engine.EAIICIFIFA() then
				LUI.FlowManager.RequestRestoreMenu("CPMainMenu", nil, var_5_5)
			elseif CONDITIONS.IsMagmaGameMode() or Dvar.IBEGCHEFE("ui_wz_mode") then
				Dvar.DHEGHJJJHI("ui_wz_mode", false)
				LUI.FlowManager.RequestRestoreMenu("BRMainMenu", nil, var_5_5)
				PrepareForceOpenHighlightPanel()
			else
				LUI.FlowManager.RequestRestoreMenu("MPMainMenu", nil, var_5_5)
			end
		else
			OpenTitleScreen()
		end
	elseif Engine.DDJFBBJAIG() and Engine.CAADCDEEIA() then
		if not Engine.HDDHJIBDH() then
			local var_5_13 = Engine.IJEBHJIJF()

			if Engine.HABIAFADE() then
				LUI.FlowManager.RequestRestoreMenu("CampaignMenu", nil, var_5_13)
			else
				LUI.FlowManager.RequestRestoreMenu("CampaignMenuOffline", nil, var_5_13)
			end
		end
	elseif Engine.CAADCDEEIA() and not Engine.DDJFBBJAIG() and Dvar.IBEGCHEFE("NLONRMOLKS") then
		local var_5_14 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestRestoreMenu("pre_game", nil, var_5_14, nil, nil, true)
	end
end

function Main()
	if Engine.DDJFBBJAIG() then
		InitFrontEndDataSources()
		PersistentBackground.SetToDefault()
	end

	math.randomseed(Engine.BFBIDEGDFB())

	local var_6_0 = Engine.DGEFGAJIB()

	CoD.UpdateGameMode(var_6_0, CoD.PlayMode.None)
	THEMES.UpdateTheme({
		currentGameMode = var_6_0,
		isMainMenu = var_6_0 == 0
	})
	OpenInitialMenu()
end
