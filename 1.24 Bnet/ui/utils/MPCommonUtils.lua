MP_COMMON = MP_COMMON or {}
MP_COMMON.postShipFlags = {
	forcedWZControllerLayoutReset = 1,
	overkillSwap = 0
}

function MP_COMMON.SetupOnline()
	Dvar.DHEGHJJJHI("LTSNLQNRKO", true)

	if Dvar.IBEGCHEFE("LOMTKQTRTM") then
		Dvar.DHEGHJJJHI("LOMTKQTRTM", false)
		Engine.EBIDFIDHIE("set remove_mlg_rules 1")
	end
end

function MP_COMMON.SetupParty()
	local var_2_0 = Engine.IJEBHJIJF()

	if not Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstartprivateparty", var_2_0)
	end
end

function MP_COMMON.StopGameLobbyAndWakePrivateParty()
	local var_3_0 = Engine.IJEBHJIJF()

	Engine.DAGFFDGFII("xstopparty", var_3_0)
end

function MP_COMMON.SetupPrivateMatch()
	if not Engine.DAFGFCFHJI() then
		Engine.DAGFFDGFII("xstartprivatematch")
	end
end

function MP_COMMON.SetupStreaming(arg_5_0, arg_5_1)
	Streaming.BDDBGGIC(true)
	arg_5_0:addElement(MP.GetGameModeMaterialStreamer())
	arg_5_0:addElement(Lobby.GetMPMapMaterialStreamer())
	arg_5_0:addElement(Lobby.GetMPMapPreloadStreamer(arg_5_1))

	local var_5_0 = LOADOUT.GetFavoriteLoadoutIndex(arg_5_1)

	MP_COMMON.LoadStreamingModels(arg_5_1, var_5_0)
end

function MP_COMMON.LoadStreamingModels(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = PlayerData.BFFBGAJGD(arg_6_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	if not arg_6_2 then
		local var_6_1 = {}

		for iter_6_0 = 0, 1 do
			local var_6_2 = var_6_0[arg_6_1].weaponSetups[iter_6_0]
			local var_6_3 = WEAPON.GetWeaponModelNameFromPlayerData(var_6_2.weapon:get(), var_6_2, {
				includeCamos = true,
				includeAttachments = true,
				includeStickers = true,
				controllerIndex = arg_6_0
			})

			if var_6_3 and #var_6_3 > 0 then
				table.insert(var_6_1, var_6_3)
			end
		end

		local var_6_4 = WATCH.GetEquippedWatch(arg_6_0)
		local var_6_5 = WATCH.GetFullModelName(var_6_4)

		if var_6_5 and #var_6_5 > 0 then
			table.insert(var_6_1, var_6_5)
		end

		if #var_6_1 > 0 then
			FrontEndScene.RequestWeaponViewModels(var_6_1, arg_6_0)
		end
	end

	local var_6_6 = {}
	local var_6_7 = {}

	for iter_6_1 = 0, 1 do
		local var_6_8, var_6_9 = OPERATOR.GetEquippedOperatorSkin(arg_6_0, iter_6_1)

		if var_6_8 and var_6_8 ~= "" then
			table.insert(var_6_6, var_6_8)
		end

		if var_6_9 and var_6_9 ~= "" then
			table.insert(var_6_7, var_6_9)
		end
	end

	if #var_6_6 > 0 and #var_6_7 > 0 then
		FrontEndScene.RequestBodyModels(var_6_6)
		FrontEndScene.RequestHeadModels(var_6_7)
	end
end

function MP_COMMON.TriggerLeaveMainGamemodeMenu(arg_7_0, arg_7_1)
	local var_7_0 = true

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.BGIADHIHAG() then
		var_7_0 = false
	end

	if Lobby.IsNotAloneInPrivateParty() and var_7_0 then
		if Engine.BAHIIBFDDG() then
			local var_7_1 = {
				rateLimitIntervalMS = 5000,
				rateLimitAttempts = 3,
				menu = arg_7_0
			}

			LUI.FlowManager.RequestPopupMenu(arg_7_0, "RateLimitedLeaveCommonMPMainMenuPopup", true, arg_7_1.controller, false, var_7_1)
		else
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "LeaveCommonMPMainMenuPopup", true, arg_7_1.controller, false, {
				menu = arg_7_0
			})
		end
	else
		Lobby.LeaveCommonMPMainMenu(arg_7_0, arg_7_1.controller)
	end

	return true
end

function MP_COMMON.RefreshDataForFirstController()
	if Engine.JEDFGECDJ() > 0 then
		local var_8_0 = Engine.IJEBHJIJF()

		if var_8_0 and Engine.CDCCDDJAJJ(var_8_0) then
			Engine.BJGGCHBAGJ()
		end
	end
end

function MP_COMMON.IsMatchRulesCODCastingEnabled(arg_9_0)
	local var_9_0 = true

	if MatchRules.EAIEFBHGJ() then
		var_9_0 = MatchRules.BIJEDCBCBH("commonOption", "codcasterEnabled")
	end

	local var_9_1 = false

	if arg_9_0 then
		var_9_1 = Engine.JEDFGECDJ() > 1
	end

	return var_9_0 and not var_9_1
end

function MP_COMMON.IsMatchRulesTeamAssignmentEnabled()
	if MatchRules.EAIEFBHGJ() then
		return MatchRules.BIJEDCBCBH("commonOption", "teamAssignmentAllowed")
	end

	return true
end

function MP_COMMON.ValidatePlayerData(arg_11_0, arg_11_1)
	PERK.ValidatePlayerData(arg_11_0, arg_11_1)
	MP_COMMON.ResetWZControllerLayout(arg_11_0, arg_11_1)
end

function MP_COMMON.ResetWZControllerLayout(arg_12_0, arg_12_1)
	local var_12_0 = PlayerData.BFFBGAJGD(arg_12_0, CoD.StatsGroup.NonGame, CoD.PlayMode.Core, arg_12_1)
	local var_12_1 = MP_COMMON.postShipFlags.forcedWZControllerLayoutReset

	if var_12_0.postShipFlags[var_12_1]:get() < 1 then
		local var_12_2 = Engine.BECCFCBIAA("gpadBRButtonsConfig", arg_12_0)

		if var_12_2 == "buttons_br_ping_lb" or var_12_2 == "buttons_br_ping_lb_alt" then
			local var_12_3 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_12_0)

			Engine.CBCIHEGADA(var_12_3, arg_12_0, true)
		end

		var_12_0.postShipFlags[var_12_1]:set(1)
	end
end
