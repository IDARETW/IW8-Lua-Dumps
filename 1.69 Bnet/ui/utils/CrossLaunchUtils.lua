CrossLaunchUtils = CrossLaunchUtils or {}
CrossLaunchUtils.CrossLaunchPlatformOptions = {
	PS5 = "ps5",
	PS4 = "ps4"
}
CrossLaunchUtils.CrossLaunchPlatformOptionsLabels = {
	PS4 = Engine.CBBHFCGDIC("LUA_MENU_EAGLE/CROSSLAUNCH_PLATFORM_SELECTION_PS4"),
	PS5 = Engine.CBBHFCGDIC("LUA_MENU_EAGLE/CROSSLAUNCH_PLATFORM_SELECTION_PS5")
}
CrossLaunchUtils.HQCrosslaunchTitles = {
	WZ2 = 2,
	CORTEZ = 1,
	INVALID = 0
}

function CrossLaunchUtils.CrossLaunchWithDeepLink(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0, "MenuUtils.CrossLaunchWithDeepLink() -> Error: element expected to be non-nil")
	assert(arg_1_1, "MenuUtils.CrossLaunchWithDeepLink() -> Error: controllerIndex expected to be non-nil")
	assert(arg_1_2, "MenuUtils.CrossLaunchWithDeepLink() -> Error: options expected to be non-nil")

	if arg_1_2._useUpsellPopupIfNotOwned and not CONDITIONS.IsOwnerOfCurrentUpsellTitle(arg_1_1) then
		MenuUtils.GoToStoreUpsellPopup(arg_1_0, arg_1_1, arg_1_2._fromPlaylistEventButton, arg_1_2._deepLinkGame, arg_1_2._isVanguardTrialEvent)

		return
	end

	local var_1_0 = arg_1_2._deepLinkGame or LUI.DEEP_LINK_GAME.COLD_WAR
	local var_1_1 = arg_1_2._deepLinkGameMode or LUI.DEEP_LINK_GAME_MODE.NONE

	if arg_1_2._shouldUseBreakupPartyPopup then
		LUI.FlowManager.RequestPopupMenu(arg_1_0, "ConfirmShouldBreakupPrivateParty", true, arg_1_1, false, {
			yesAction = function()
				CrossLaunchUtils.LeaveParty()
				CrossLaunchUtils.HostCrossLaunchInitiate(var_1_1, var_1_0)
			end
		})
	else
		CrossLaunchUtils.HostCrossLaunchInitiate(var_1_1, var_1_0)
	end
end

function CrossLaunchUtils.GetPartyCrosslaunchDestination()
	return Engine.DBJJEJEAIA()
end

function CrossLaunchUtils.HostCrossLaunchInitiate(arg_4_0, arg_4_1)
	DebugPrint("---CROSSLAUNCH--- I am the host and initiated crosslaunch to gameID: " .. arg_4_1 .. " with gameMode: " .. arg_4_0)
	Engine.EHEGFJJFB(arg_4_0, arg_4_1)
end

function CrossLaunchUtils.HostCrossLaunchExecute(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	DebugPrint("---CROSSLAUNCH--- I am the host and am now executing the crosslaunch to gameID: " .. arg_5_3 .. " with gameMode: " .. arg_5_2)
	Engine.BBIHEECBJE(arg_5_1, arg_5_2, arg_5_3)
end

function CrossLaunchUtils.PartyCrossLaunchExecute(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	DebugPrint("---CROSSLAUNCH--- I am not a host and executing crosslaunch to gameID: " .. arg_6_3 .. " with gameMode: " .. arg_6_2)
	Engine.CIHEHBHFI(arg_6_1, arg_6_2, arg_6_3)
end

function CrossLaunchUtils.PartyCrossLaunchTimeRemaining()
	return Engine.BIJEJHACBE()
end

function CrossLaunchUtils.PartyCrosslaunchConfirm()
	Engine.EADFFJDEJI()
end

function CrossLaunchUtils.PartyCrosslaunchDecline(arg_9_0, arg_9_1)
	LUI.FlowManager.RequestLeaveMenu(arg_9_0, nil)
	CrossLaunchUtils.LeaveParty()
end

function CrossLaunchUtils.PartyCrosslaunchCancel(arg_10_0, arg_10_1)
	DebugPrint("---CROSSLAUNCH--- Cancelled crosslaunch")
	LUI.FlowManager.RequestLeaveMenu(arg_10_0, nil)
	Engine.DHBEJIBCA()

	if not Lobby.AreWePrivatePartyHost() then
		CrossLaunchUtils.LeaveParty()
	end
end

function CrossLaunchUtils.HostCrossLaunchOnComplete(arg_11_0, arg_11_1)
	if arg_11_0.isPresenceJoin then
		Friends.GAIIBGBDJ(arg_11_1, Friends.CAIJHBHGGC(arg_11_0.XUID))
	else
		Friends.DHHHEBCAD(arg_11_1, Friends.CAIJHBHGGC(arg_11_0.XUID))
	end

	LUI.FlowManager.RequestLeaveMenu(arg_11_0)
end

function CrossLaunchUtils.GetCountdownPopupMessage(arg_12_0, arg_12_1)
	local var_12_0 = ""

	if arg_12_0 ~= nil and arg_12_0 == LUI.DEEP_LINK_GAME.VANGUARD then
		if arg_12_1 then
			var_12_0 = Engine.CBBHFCGDIC("@MPUI/PARTY_CROSSLAUNCH_VANGUARD_SHOULD_FOLLOW")
		else
			var_12_0 = Engine.CBBHFCGDIC("MPUI/HOST_CROSS_LAUNCH_VG")
		end
	elseif arg_12_0 ~= nil and arg_12_0 == LUI.DEEP_LINK_GAME.HQ then
		local var_12_1 = Dvar.CFHDGABACF("NLTLMQTLK")

		if var_12_1 == CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ then
			if arg_12_1 then
				var_12_0 = Engine.CBBHFCGDIC("@MPUI/PARTY_CROSSLAUNCH_CORTEZ_SHOULD_FOLLOW")
			else
				var_12_0 = Engine.CBBHFCGDIC("MPUI/HOST_CROSS_LAUNCH_CORTEZ")
			end
		elseif var_12_1 == CrossLaunchUtils.HQCrosslaunchTitles.WZ2 then
			if arg_12_1 then
				var_12_0 = Engine.CBBHFCGDIC("@MPUI/PARTY_CROSSLAUNCH_WZ2_SHOULD_FOLLOW")
			elseif CONDITIONS.IsPCMSStore() then
				var_12_0 = Engine.CBBHFCGDIC("MSSTORE_PLATFORM/HOST_CROSS_LAUNCH_COD")
			else
				var_12_0 = Engine.CBBHFCGDIC("MPUI/HOST_CROSS_LAUNCH_WZ2")
			end
		end
	elseif arg_12_1 then
		var_12_0 = Engine.CBBHFCGDIC("@MPUI/PARTYCROSSLAUNCHBLOPS5SHOULDFOLLOW")
	else
		var_12_0 = Engine.CBBHFCGDIC("MPUI/HOST_CROSS_LAUNCH_BO5")
	end

	return var_12_0
end

function CrossLaunchUtils.LeaveParty()
	DebugPrint("---CROSSLAUNCH--- Leaving the party")
	Engine.DAGFFDGFII("xstopprivateparty 0 1", Engine.IJEBHJIJF())
	Engine.DAGFFDGFII("xstartprivateparty")
end

function CrossLaunchUtils.GetPartyMessageForHostCrosslaunchNoFollow(arg_14_0, arg_14_1)
	local var_14_0 = "Host has Crosslaunched into a different Call of Duty Title"

	if arg_14_0 == LUI.DEEP_LINK_GAME.COLD_WAR then
		var_14_0 = "Host has Crosslaunched into Call of Duty: Cold War"
	elseif arg_14_0 == LUI.DEEP_LINK_GAME.VANGUARD then
		var_14_0 = "Host has Crosslaunched into Call of Duty: Vanguard"
	else
		return var_14_0
	end

	if arg_14_1 == LUI.DEEP_LINK_GAME_MODE.ARENA then
		var_14_0 = var_14_0 .. " into Arena"
	elseif arg_14_1 == LUI.DEEP_LINK_GAME_MODE.CP then
		if arg_14_0 == LUI.DEEP_LINK_GAME.VANGUARD then
			var_14_0 = var_14_0 .. " into Zombies"
		else
			var_14_0 = var_14_0 .. " into Campaign"
		end
	elseif arg_14_1 == LUI.DEEP_LINK_GAME_MODE.MP then
		var_14_0 = var_14_0 .. " into Multiplayer"
	elseif arg_14_1 == LUI.DEEP_LINK_GAME_MODE.SP then
		var_14_0 = var_14_0 .. " into Campaign"
	elseif arg_14_1 == LUI.DEEP_LINK_GAME_MODE.ZM then
		var_14_0 = var_14_0 .. " into Zombies"
	end

	return var_14_0
end
