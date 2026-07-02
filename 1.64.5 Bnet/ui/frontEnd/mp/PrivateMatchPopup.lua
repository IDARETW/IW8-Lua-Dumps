module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.Buttons)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/PRIVATE_MATCH"))

	if arg_1_0.Buttons.CustomOnlineButton then
		arg_1_0.Buttons.CustomOnlineButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
			local function var_2_0()
				Lobby.OpenPrivateMatchLobby({
					controller = arg_1_1
				})
			end

			if Engine.JACCCCEDI() then
				LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_1_1, false, {
					premium = true,
					invalidPlaylists = {},
					leavePartyAction = var_2_0
				})
			else
				Lobby.TryNavigateToLobby(var_2_0)
			end
		end)
	end

	if arg_1_0.Buttons.LocalPlayButton then
		arg_1_0.Buttons.LocalPlayButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			local var_4_0 = true

			if Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
				local var_4_1 = Engine.JEDFGECDJ() > 1
				local var_4_2 = Lobby.IsNotAloneInPrivateParty()

				if var_4_1 and var_4_2 then
					var_4_0 = false

					LUI.FlowManager.RequestPopupMenu(arg_1_0, "ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning", true, arg_4_1.controller, false, {
						yesAction = function()
							local var_5_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_1_1, false)

							if var_5_0 >= 0 then
								Lobby.OpenSystemLinkMenu(var_5_0)
							end
						end
					})
				elseif var_4_2 then
					var_4_0 = false

					LUI.FlowManager.RequestPopupMenu(arg_1_0, "ConfirmShouldBreakupPrivateParty", true, arg_4_1.controller, false, {
						yesAction = function()
							local var_6_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_1_1, false)

							if var_6_0 >= 0 then
								Lobby.OpenSystemLinkMenu(var_6_0)
							end
						end
					})
				elseif var_4_1 then
					var_4_0 = false

					LUI.FlowManager.RequestPopupMenu(arg_1_0, "ConfirmShouldRemoveSplitscreenPlayerWarning", true, arg_4_1.controller, false, {
						yesAction = function()
							local var_7_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_1_1, false)

							if var_7_0 >= 0 then
								Lobby.OpenSystemLinkMenu(var_7_0)
							end
						end
					})
				end
			end

			if var_4_0 then
				Lobby.OpenSystemLinkMenu(arg_1_1)
			end
		end)
	end

	if arg_1_0.Buttons.TrialsButton then
		arg_1_0.Buttons.TrialsButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
		arg_1_0.Buttons.TrialsButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)
		arg_1_0.Buttons.TrialsButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			TRIALS.OpenTrialsMenu(arg_1_0, arg_8_1.controller)
		end)
	end

	if arg_1_0.Buttons.GameBattlesButton then
		arg_1_0.Buttons.GameBattlesButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			local function var_9_0(arg_10_0)
				local function var_10_0()
					Lobby.OpenGameBattlesLobby(arg_10_0)
				end

				Lobby.TryNavigateToLobby(var_10_0)
			end

			if Lobby.IsNotAloneInPrivateParty() or Lobby.IsSplitScreenEnabled() then
				LUI.FlowManager.RequestPopupMenu(arg_1_0, "ConfirmShouldBreakupPrivateParty", true, arg_1_1, false, {
					yesAction = function()
						local var_12_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_1_1, false)

						Engine.DAGFFDGFII("xstoplobbybackout")

						if var_12_0 >= 0 then
							var_9_0(var_12_0)
						end
					end
				})
			else
				var_9_0(arg_1_1)
			end
		end)
	end

	if arg_1_0.Buttons.TournamentButton then
		arg_1_0.Buttons.TournamentButton:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			local function var_13_0()
				LUI.FlowManager.RequestAddMenu("PrivateTournamentLobby", false, arg_13_1.controller, false)
			end

			Lobby.TryNavigateToLobby(var_13_0)
		end)
	end
end

function PrivateMatchPopup(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalNavigator.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "PrivateMatchPopup"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "MenuTitle"

	var_15_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/PRIVATE_MATCH"), 0)
	var_15_4.Line:SetLeft(0, 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_15_0:addElement(var_15_4)

	var_15_0.MenuTitle = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("PrivateMatchPopupButtons", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "Buttons"

	var_15_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 525, _1080p * 157, _1080p * 557)
	var_15_0:addElement(var_15_6)

	var_15_0.Buttons = var_15_6

	var_0_0(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("PrivateMatchPopup", PrivateMatchPopup)
LockTable(_M)
