MAIN_MENU = MAIN_MENU or {}
MAIN_MENU.BladeKeys = {
	HQ = 4,
	BR = 7,
	MP = 13,
	BuyMW = 10,
	BuyHQ = 3,
	SP = 12,
	CW = 9,
	BuyVG = 5,
	CW_CP = 18,
	CW_MP = 19,
	CW_ZM = 20,
	CP = 14,
	BuyNG = 1,
	VG = 6,
	BuyCW = 8,
	CW_Arena = 17,
	MW = 11,
	NG = 2,
	STORE = 15,
	LP = 16
}
MAIN_MENU.BladeKeysOrderOverrideCortez = {
	{
		keyOverride = 8,
		key = MAIN_MENU.BladeKeys.BuyVG
	},
	{
		keyOverride = 9,
		key = MAIN_MENU.BladeKeys.VG
	}
}
MAIN_MENU.BladeType = {
	Accordion = 2,
	Shutter = 1,
	AccordionRefresh = 3
}
MAIN_MENU.BladeStates = {
	Neutral = 4,
	Installing = 1,
	New = 3,
	Blocked = 2
}
MAIN_MENU.NGBladeStates = {
	StyxNowAvailable = 9,
	CortezNowAvailable = 7,
	StyxReleaseCountdown = 8,
	LegacyNowAvailable = 10,
	HideCortezRetail = 11,
	CortezReleaseCountdown = 6,
	BetaSonyPreOrderExclusiveActive = 2,
	BetaAllActive = 5,
	BetaSonyOpenWithPcXboxPrepurchaseActive = 4,
	Inactive = 0,
	NoBetaPreorderOnly = 1,
	BetaSonyOpenActive = 3
}
MAIN_MENU.NGGameRevealType = {
	CortezFreeTrial = 1,
	WZ2 = 2,
	Cortez = 0
}
MAIN_MENU.LayoutWidths = {
	Kronos = 1520,
	MagmaOffline = 1920,
	Magma = 1920,
	KronosOffline = 1200
}
MAIN_MENU.GameModeEnumValues = {
	BR = 4,
	SP = CoD.PlayMode.SP,
	MP = CoD.PlayMode.Core,
	CP = CoD.PlayMode.Aliens
}
MAIN_MENU.NGBladeVisibility = {
	Last = 2,
	ForceUpsell = 1,
	ForcePlay = 2,
	Standard = 0,
	First = 0
}
MAIN_MENU.DLogBladeIDs = {
	MW = "mw",
	VG = "vg",
	WZ = "wz",
	HQ = "hg",
	MWII = "mwii",
	WZ2 = "wz2",
	CW = "cw"
}
MAIN_MENU.DLogModeIDs = {
	Campaign = "campaign",
	MP = "mp",
	Warzone2 = "wz2",
	Coop = "co-op",
	Zombies = "zm",
	Vanguard = "vg",
	League = "mp-league",
	Warzone = "wz",
	Cortez = "ct"
}
MAIN_MENU.NGBladeStateDvar = CONDITIONS.IsLaze() and "STLONTKTK" or "MSTOMTMNSL"
MAIN_MENU.PSVaultOwnershipFixKillswitchDvar = "lui_ps_vault_ownership_fix_killswitch_enabled"
MAIN_MENU.CWExpandedRatio = 0.91481
MAIN_MENU.SHGExpandedRatio = 0.7925925925925926
MAIN_MENU.TwoBladeExpandedRatio = 1.1111111111111112

function MAIN_MENU.ShouldShowModifyInstall()
	return not CONDITIONS.IsLazeOrOutrun()
end

function MAIN_MENU.GetNGBladeState()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar)
end

function MAIN_MENU.IsNGBladeActive()
	return MAIN_MENU.GetNGBladeState() ~= MAIN_MENU.NGBladeStates.Inactive
end

function MAIN_MENU.IsNGActiveBetaRestricted()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.BetaSonyExclusiveActive and CONDITIONS.IsSony()
end

function MAIN_MENU.IsNGActiveBetaSonyPrePurchase()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.BetaSonyPreOrderExclusiveActive
end

function MAIN_MENU.IsNGActiveBetaSonyOpen()
	local var_6_0 = MAIN_MENU.GetNGBladeState()

	return var_6_0 == MAIN_MENU.NGBladeStates.BetaSonyOpenActive or var_6_0 == MAIN_MENU.NGBladeStates.BetaSonyOpenWithPcXboxPrepurchaseActive
end

function MAIN_MENU.IsNGActiveBetaSonyOpenAndPcXboxPrepurchase()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.BetaSonyOpenWithPcXboxPrepurchaseActive
end

function MAIN_MENU.IsNGActiveBetaOpenToAll()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.BetaAllActive
end

function MAIN_MENU.IsNGActiveBeta()
	local var_9_0 = MAIN_MENU.GetNGBladeState()

	return var_9_0 >= MAIN_MENU.NGBladeStates.BetaSonyPreOrderExclusiveActive and var_9_0 <= MAIN_MENU.NGBladeStates.BetaAllActive
end

function MAIN_MENU.IsPreOrderAvailable()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.NoBetaPreorderOnly
end

function MAIN_MENU.IsCortezReleaseCountdown()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.CortezReleaseCountdown
end

function MAIN_MENU.IsCortezNowAvailable()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.CortezNowAvailable
end

function MAIN_MENU.IsStyxReleaseCountdown()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.StyxReleaseCountdown
end

function MAIN_MENU.IsStyxNowAvailable()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.StyxNowAvailable
end

function MAIN_MENU.IsLegacyNowAvailable()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.LegacyNowAvailable
end

function MAIN_MENU.IsLegacyInstalled()
	local var_16_0, var_16_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR)

	return var_16_0 == ContentProgressState.INSTALLED
end

function MAIN_MENU.IsCortezRetailHidden()
	return MAIN_MENU.GetNGBladeState() == MAIN_MENU.NGBladeStates.HideCortezRetail
end

function MAIN_MENU.IsCortezProductOwned(arg_18_0)
	local var_18_0, var_18_1, var_18_2, var_18_3 = MAIN_MENU.GetCortezProductOwned(arg_18_0, true)
	local var_18_4 = false

	if Dvar.IBEGCHEFE("MOPMNNNSNN") then
		var_18_4 = var_18_0.owned or var_18_1.owned or var_18_3.owned
	else
		var_18_4 = var_18_0.owned or var_18_1.owned
	end

	return STORE.IsCortezOwned(arg_18_0) or var_18_4
end

function MAIN_MENU.IsMWIIPremiumPlayer(arg_19_0)
	local var_19_0, var_19_1, var_19_2, var_19_3 = MAIN_MENU.GetCortezProductOwned(arg_19_0, true)

	return var_19_0.owned or var_19_1.owned
end

function MAIN_MENU.GetCortezProductOwned(arg_20_0, arg_20_1)
	if arg_20_1 then
		InGameStore.FetchCatalog(arg_20_0, true, true)
	end

	local var_20_0 = CONDITIONS.IsPC() and STORE.CortezStandardID or STORE.CortezAltID
	local var_20_1 = InGameStore.GetProduct(arg_20_0, var_20_0)
	local var_20_2 = InGameStore.GetProduct(arg_20_0, STORE.CortezVaultID)
	local var_20_3 = InGameStore.GetProduct(arg_20_0, STORE.CortezUpgradeToUltimateID)
	local var_20_4 = InGameStore.GetProduct(arg_20_0, STORE.CortezWarzone2ID)
	local var_20_5 = false

	if var_20_1 then
		var_20_1.owned = var_20_1.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if var_20_2 then
		var_20_2.owned = var_20_2.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if var_20_3 then
		var_20_3.owned = var_20_3.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if var_20_4 then
		var_20_4.owned = var_20_4.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if not var_20_3 and var_20_2 and var_20_1 and var_20_4 then
		return var_20_1, var_20_2, var_20_5, var_20_4
	elseif var_20_3 and not var_20_2 and var_20_1 and var_20_4 then
		var_20_5 = true

		return var_20_1, var_20_3, var_20_5, var_20_4
	end

	if not Dvar.IBEGCHEFE(MAIN_MENU.PSVaultOwnershipFixKillswitchDvar) and CONDITIONS.IsSony() then
		var_20_1 = var_20_1 or {
			owned = CONDITIONS.IsCZStandardOrCrossGenOwned(arg_20_0)
		}
		var_20_2 = var_20_2 or {
			owned = CONDITIONS.IsCZVaultOwned(arg_20_0)
		}

		if var_20_1.owned == true and var_20_2.owned == false then
			var_20_5 = true
		end

		if not var_20_4 then
			var_20_4 = {}
			var_20_4.owned = false
		end

		return var_20_1, var_20_2, var_20_5, var_20_4
	end

	if var_20_1 and var_20_3 and var_20_2 and var_20_4 then
		DebugPrint("MAIN_MENU.GetCortezProductOwned: Standard / Crossgen, Vault, Upgrade, and Warzone 2 products all exist, this shouldn't happen")
	end

	if not var_20_1 then
		var_20_1 = {}
		var_20_1.owned = false

		DebugPrint("MAIN_MENU.GetCortezProductOwned: Standard / Crossgen product is missing, assuming no ownership")
	end

	if not var_20_4 then
		var_20_4 = {}
		var_20_4.owned = false

		DebugPrint("MAIN_MENU.GetCortezProductOwned: Warzone 2 product is missing, assuming no ownership")
	end

	local var_20_6

	if var_20_2 and var_20_2.owned then
		var_20_6 = var_20_2
	elseif var_20_3 and var_20_3.owned then
		var_20_6 = var_20_3
	elseif var_20_3 then
		var_20_6 = var_20_3
	elseif var_20_2 then
		var_20_6 = var_20_2
	else
		var_20_6 = {}
		var_20_6.owned = false

		DebugPrint("MAIN_MENU.GetCortezProductOwned: Vault + Upgrade products missing, assuming no ownership")
	end

	if var_20_1.owned == true and var_20_6.owned == false then
		var_20_5 = true
	end

	return var_20_1, var_20_6, var_20_5, var_20_4
end

function MAIN_MENU.IsNGActiveAndPlayable(arg_21_0)
	local var_21_0 = MAIN_MENU.IsNGBladeActive()
	local var_21_1, var_21_2, var_21_3, var_21_4 = MAIN_MENU.GetCortezProductOwned(arg_21_0, true)
	local var_21_5 = var_21_1.owned or var_21_2.owned
	local var_21_6 = STORE.IsCortezOwned(arg_21_0) or var_21_5
	local var_21_7 = CONDITIONS.IsSony()
	local var_21_8 = MAIN_MENU.IsNGActiveBetaSonyPrePurchase() and var_21_6 and var_21_7
	local var_21_9 = MAIN_MENU.IsNGActiveBetaSonyOpen() and var_21_7
	local var_21_10 = var_21_9 or MAIN_MENU.IsNGActiveBetaSonyOpenAndPcXboxPrepurchase() and var_21_6
	local var_21_11 = MAIN_MENU.IsNGActiveBetaOpenToAll()
	local var_21_12 = MAIN_MENU.IsCortezReleaseCountdown() and var_21_6

	return var_21_0 and (var_21_8 or var_21_9 or var_21_10 or var_21_11 or var_21_12)
end

function MAIN_MENU.IsUbiConnectSingleBladeFrontend()
	return Engine.CHBHFFFIGH() and Dvar.IBEGCHEFE("NQRNTOOMST")
end

function MAIN_MENU.CanShowTwoBladeHQ()
	return MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.CortezNowAvailable and not MAIN_MENU.IsUbiConnectSingleBladeFrontend()
end

function MAIN_MENU.CanShowTwoBladeWZ(arg_24_0)
	return false
end

function MAIN_MENU.CanShowTwoBladeMW(arg_25_0)
	return true
end

function MAIN_MENU.CheckPlatformForFirstPartyAction(arg_26_0, arg_26_1)
	if CONDITIONS.IsPC() then
		if Dvar.IBEGCHEFE("LKSNPRSNMR") then
			InGameStore.SelectProduct(arg_26_1, STORE.CortezStandardID, InGameStorePurchaseType.BROWSE)
		else
			MAIN_MENU.CrosslaunchIntoHQ(arg_26_0, arg_26_1)
		end
	else
		InGameStore.SelectProduct(arg_26_1, STORE.CortezWarzone2ID, InGameStorePurchaseType.BROWSE)
	end
end

function MAIN_MENU.HandleUserCortezFlow(arg_27_0, arg_27_1)
	if Dvar.IBEGCHEFE("MOPMNNNSNN") then
		if MAIN_MENU.IsCortezProductOwned(arg_27_1) then
			MAIN_MENU.CrosslaunchIntoHQ(arg_27_0, arg_27_1)
		else
			MAIN_MENU.CheckPlatformForFirstPartyAction(arg_27_0, arg_27_1)
		end
	else
		MAIN_MENU.CrosslaunchIntoHQ(arg_27_0, arg_27_1)
	end
end

local var_0_0 = {
	CW_CP = Dvar.CFHDGABACF("party_limit_cross_launch_cp") or 1,
	CW_MP = Dvar.CFHDGABACF("party_limit_cross_launch_mp") or 6,
	CW_ZM = Dvar.CFHDGABACF("party_limit_cross_launch_zm") or 4
}

local function var_0_1(arg_28_0)
	local var_28_0 = {
		title = ToUpperCase(Engine.CBBHFCGDIC(arg_28_0.titleLoc)),
		message = Engine.CBBHFCGDIC(arg_28_0.descLoc),
		buttons = {
			{
				label = Engine.CBBHFCGDIC(arg_28_0.buttonLableLoc),
				action = function()
					if arg_28_0.buttonAction then
						arg_28_0.buttonAction()
					end
				end
			}
		}
	}

	LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, arg_28_0.controllerIndex, false, var_28_0, nil, true, true)
end

local function var_0_2()
	return MAIN_MENU.IsStyxNowAvailable() or MAIN_MENU.IsLegacyNowAvailable() and MAIN_MENU.IsLegacyInstalled() == false
end

local function var_0_3(arg_31_0)
	if MAIN_MENU.IsStyxNowAvailable() then
		local var_31_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU_WZ345/WZONE_UNDER_MAINTENANCE_EXTRA_MESSAGE"),
			controllerIndex = arg_31_0,
			buttons = {
				{
					label = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ345/PLAY_STYX")),
					action = function(arg_32_0, arg_32_1)
						MAIN_MENU.HandleUserCortezFlow(arg_32_0, arg_32_1)
					end
				},
				{
					label = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/CANCEL")),
					action = function()
						return
					end
				}
			}
		}

		LUI.FlowManager.RequestPopupMenu(nil, "MaintenancePopup", true, var_31_0.controllerIndex, false, var_31_0, nil, true, true)
	elseif MAIN_MENU.IsLegacyInstalled() == false then
		local var_31_1 = {
			title = Engine.CBBHFCGDIC("LUA_MENU_WZ345/WZONE_UNDER_MAINTENANCE_EXTRA_MESSAGE"),
			superHeaderText = Engine.CBBHFCGDIC("LUA_MENU_WZ345/INSTALL_WARZONE_CALDERA"),
			superDescText = Engine.CBBHFCGDIC("LUA_MENU_WZ345/INSTALL_REQUIRED_WZ"),
			controllerIndex = arg_31_0
		}

		var_31_1.anim = "ThreeTitles"
		var_31_1.buttons = {
			{
				label = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ345/PLAY_STYX")),
				action = function(arg_34_0, arg_34_1)
					MAIN_MENU.HandleUserCortezFlow(arg_34_0, arg_34_1)
				end
			},
			{
				label = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ345/DOWNLOAD_WZ")),
				action = function()
					MAIN_MENU.InstallAction(arg_31_0, MAIN_MENU.GameModeEnumValues.BR)
				end
			}
		}

		LUI.FlowManager.RequestPopupMenu(nil, "MaintenancePopup", true, var_31_1.controllerIndex, false, var_31_1, nil, true, true)
	end
end

local function var_0_4(arg_36_0, arg_36_1, arg_36_2)
	assert(arg_36_1 and arg_36_2)
	DebugPrint("BladeActionDlog: game - " .. tostring(arg_36_1) .. " | mode - " .. tostring(arg_36_2))
	Engine.CEJJDJJHIJ(arg_36_0, "dlog_event_menu_blade_choice", {
		game = arg_36_1,
		mode = arg_36_2
	})
end

function MAIN_MENU.CrosslaunchIntoHQ(arg_37_0, arg_37_1)
	if MAIN_MENU.IsMWIIPremiumPlayer(arg_37_1) then
		Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)
	else
		Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.WZ2)
	end

	var_0_4(arg_37_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.Campaign)

	local var_37_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

	CrossLaunchUtils.CrossLaunchWithDeepLink(arg_37_0, arg_37_1, {
		_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
		_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
		_shouldUseBreakupPartyPopup = var_37_0
	})
end

local function var_0_5(arg_38_0, arg_38_1)
	if CONDITIONS.IsBattleNetModifyInstallEnabled() then
		LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_38_1, false)
	elseif not CONDITIONS.IsLaunchChunk() then
		local var_38_0 = LUI.FlowManager.GetScopedData(arg_38_0)

		if var_38_0 and var_38_0.currentSelectedMenuType then
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_38_1, false, {
				gameMode = var_38_0.currentSelectedMenuType
			})
		end
	end
end

local function var_0_6(arg_39_0, arg_39_1)
	local var_39_0 = LUI.ShallowCopy(arg_39_0)

	for iter_39_0, iter_39_1 in pairs(arg_39_1) do
		var_39_0[iter_39_0] = iter_39_1
	end

	return var_39_0
end

local function var_0_7(arg_40_0, arg_40_1)
	local var_40_0

	if not arg_40_1 then
		var_40_0 = Friends.FBFFEFEGB(arg_40_0, 0, 0, 0, false, false)
	else
		var_40_0 = arg_40_1
	end

	return var_40_0
end

local function var_0_8(arg_41_0)
	local var_41_0 = Engine.DBEGJIECGB(arg_41_0)
	local var_41_1 = arg_41_0 == MAIN_MENU.GameModeEnumValues.SP

	return var_41_0 and (not var_41_1 or not Engine.FABABBDBA())
end

local function var_0_9(arg_42_0)
	return function()
		local var_43_0 = {
			[MAIN_MENU.GameModeEnumValues.SP] = "LUA_MENU/INSTALL_CAMPAIGN",
			[MAIN_MENU.GameModeEnumValues.MP] = "LUA_MENU/INSTALL_MULTIPLAYER",
			[MAIN_MENU.GameModeEnumValues.CP] = "LUA_MENU/INSTALL_COOP",
			[MAIN_MENU.GameModeEnumValues.BR] = "LUA_MENU/INSTALL_BR"
		}
		local var_43_1 = {
			[MAIN_MENU.GameModeEnumValues.SP] = "LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN",
			[MAIN_MENU.GameModeEnumValues.MP] = "LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER",
			[MAIN_MENU.GameModeEnumValues.CP] = "LUA_MENU/REBOOT_TO_PLAY_COOP",
			[MAIN_MENU.GameModeEnumValues.BR] = "LUA_MENU/REBOOT_TO_PLAY_WARZONE"
		}
		local var_43_2 = {
			[ContentProgressState.NOT_INSTALLED] = {
				suspended = false,
				details = "LUA_MENU/MISSING_DATA_PACK",
				state = ContentProgressState.NOT_INSTALLED,
				status = var_43_0[arg_42_0]
			},
			[ContentProgressState.SUSPENDED] = {
				suspended = true,
				details = "LUA_MENU/INSTALLATION_SUSPENDED",
				state = ContentProgressState.SUSPENDED,
				status = var_43_0[arg_42_0]
			},
			[ContentProgressState.HAS_PROGRESS] = {
				status = "LUA_MENU/INSTALLING_CONTENT",
				suspended = false,
				details = "LUA_MENU/INSTALLING_CONTENT",
				state = ContentProgressState.HAS_PROGRESS
			},
			[ContentProgressState.INSTALLED] = {
				status = "LUA_MENU/INSTALL_COMPLETE",
				suspended = false,
				state = ContentProgressState.INSTALLED,
				details = var_43_1[arg_42_0]
			}
		}
		local var_43_3 = ContentProgressState.NOT_INSTALLED

		if Engine.CIEGIACHAE() then
			local var_43_4, var_43_5 = Engine.ECHHDAIBD(arg_42_0)

			var_43_3 = var_43_4

			if var_43_5 then
				var_43_2[var_43_4].progress = var_43_5
			end
		else
			var_43_3 = Engine.DBEGJIECGB(arg_42_0) and ContentProgressState.INSTALLED or ContentProgressState.NOT_INSTALLED
		end

		return var_43_2[var_43_3]
	end
end

function MAIN_MENU.InstallAction(arg_44_0, arg_44_1)
	if Engine.CIEGIACHAE() then
		if Engine.ECHHDAIBD(arg_44_1) == ContentProgressState.INSTALLED then
			LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_44_0, false, nil)
		else
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_44_0, false)
		end
	elseif Engine.BAHIIBFDDG() then
		LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_44_0, false)
	elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("LQQNTKTLQK") then
		LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_44_0, false)
	end
end

local function var_0_10(arg_45_0)
	if arg_45_0 and LUI.FlowManager.IsInStack("MainMenu") then
		local var_45_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if var_45_0 then
			local var_45_1 = var_45_0.openMPMenuData

			var_45_1.menu:OpenMPMainMenu(var_45_1.controllerIndex, {
				activeTabIndex = 0
			})

			var_45_0.openMPMenuData = nil
		end
	end
end

local function var_0_11(arg_46_0)
	if arg_46_0 and LUI.FlowManager.IsInStack("MainMenu") then
		local var_46_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if var_46_0 then
			local var_46_1 = var_46_0.openCPMenuData

			var_46_1.menu:AttemptOpenCoopMenu(var_46_1.controllerIndex, {
				activeTabIndex = 0
			})

			var_46_0.openCPMenuData = nil
		end
	end
end

local function var_0_12(arg_47_0, arg_47_1)
	if Lobby.IsNotAloneInPrivateParty() then
		if Engine.JACCCCEDI() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_47_0, false, {
				premium = true,
				invalidPlaylists = {},
				leavePartyAction = arg_47_1
			})

			return false
		elseif not Engine.HBIAGEFCC() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_47_0, false, {
				subscription = true,
				invalidPlaylists = {},
				leavePartyAction = arg_47_1
			})

			return false
		end
	end

	return true
end

local function var_0_13(arg_48_0, arg_48_1, arg_48_2)
	return function(arg_49_0, arg_49_1)
		if CONDITIONS.IsLaze() and arg_48_2 == MAIN_MENU.GameModeEnumValues.BR then
			arg_48_2 = MAIN_MENU.GameModeEnumValues.MP
		end

		if Engine.ECHHDAIBD(arg_48_2) == ContentProgressState.INSTALLED then
			if arg_48_2 == MAIN_MENU.GameModeEnumValues.SP then
				var_0_4(arg_49_1, MAIN_MENU.DLogBladeIDs.MW, MAIN_MENU.DLogModeIDs.Campaign)
				arg_49_0:AttemptOpenCampaignMenu(arg_49_1)
			elseif arg_48_2 == MAIN_MENU.GameModeEnumValues.MP then
				if LUI.FlowManager.IsInStack("MainMenu") then
					local var_49_0 = LUI.FlowManager.GetScopedData("MainMenu")

					if var_49_0 then
						var_49_0.openMPMenuData = {
							menu = arg_49_0,
							controllerIndex = arg_49_1,
							gameMode = arg_48_2
						}
					end
				end

				if var_0_12(arg_49_1, var_0_10) == false then
					return
				end

				var_0_4(arg_49_1, MAIN_MENU.DLogBladeIDs.MW, MAIN_MENU.DLogModeIDs.MP)
				var_0_10(true)
			elseif arg_48_2 == MAIN_MENU.GameModeEnumValues.CP then
				if LUI.FlowManager.IsInStack("MainMenu") then
					local var_49_1 = LUI.FlowManager.GetScopedData("MainMenu")

					if var_49_1 then
						var_49_1.openCPMenuData = {
							menu = arg_49_0,
							controllerIndex = arg_49_1,
							gameMode = arg_48_2
						}
					end
				end

				if var_0_12(arg_49_1, var_0_11) == false then
					return
				end

				var_0_4(arg_49_1, MAIN_MENU.DLogBladeIDs.MW, MAIN_MENU.DLogModeIDs.Coop)
				var_0_11(true)
			end
		else
			MAIN_MENU.InstallAction(arg_49_1, arg_48_2)
		end
	end
end

local function var_0_14(arg_50_0, arg_50_1)
	return function(arg_51_0)
		if CONDITIONS.InPrivatePartyAndNotHost() then
			return {
				isBlocked = true,
				text = Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			}
		elseif arg_51_0 > arg_50_0 then
			return {
				isBlocked = true,
				text = Engine.CBBHFCGDIC("LUA_MENU/PARTY_LIMIT_EXCEEDED", arg_50_0)
			}
		end

		return {
			isBlocked = false
		}
	end
end

function MAIN_MENU.IsUpgradeToUltimateAvailable(arg_52_0)
	local var_52_0, var_52_1, var_52_2, var_52_3 = MAIN_MENU.GetCortezProductOwned(arg_52_0, true)

	return var_52_2
end

MAIN_MENU.BladeData = {
	[MAIN_MENU.BladeKeys.SP] = {
		gainFocusLeftSFX = "ui_blade_left_campaign",
		gainFocusRightSFX = "ui_blade_right_campaign",
		verticalButtonOffset = 0,
		videoName = "main_menu_blade_sp",
		name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
		description = Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_DESC"),
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.SP) and not Engine.FABABBDBA() then
				if Engine.CIEGIACHAE() then
					local var_53_0, var_53_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP)

					if var_53_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
					elseif var_53_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_53_1
						}
					elseif var_53_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_53_1
						}
					elseif var_53_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
				end
			end
		end,
		installingAction = function(arg_54_0, arg_54_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_54_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_54_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_54_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_54_1, false)
			end
		end,
		installingPrompt = function(arg_55_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_56_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCampaignAllowed(arg_56_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
				return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
			end
		end,
		blockedAction = function(arg_57_0, arg_57_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_57_1)
			end
		end,
		blockedPrompt = function(arg_58_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_59_0)
			if Engine.BECCFCBIAA("isSPNew", arg_59_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_60_0, arg_60_1)
			arg_60_0:AttemptOpenCampaignMenu(arg_60_1)
		end
	},
	[MAIN_MENU.BladeKeys.MP] = {
		gainFocusLeftSFX = "ui_blade_left_multiplayer",
		gainFocusRightSFX = "ui_blade_right_multiplayer",
		verticalButtonOffset = -125,
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"),
		description = Engine.CBBHFCGDIC("MENU_SP/DESC_MULTIPLAYER"),
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.MP) then
				if Engine.CIEGIACHAE() then
					local var_61_0, var_61_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP)

					if var_61_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
					elseif var_61_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_61_1
						}
					elseif var_61_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_61_1
						}
					elseif var_61_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
				end
			end
		end,
		installingAction = function(arg_62_0, arg_62_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_62_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_62_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_62_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_62_1, false)
			end
		end,
		installingPrompt = function(arg_63_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_64_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsMultiplayerAllowed(arg_64_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_65_0, arg_65_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_65_1)

				return true
			end
		end,
		blockedPrompt = function(arg_66_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_67_0)
			if Engine.BECCFCBIAA("isMPNew", arg_67_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_68_0, arg_68_1)
			arg_68_0:OpenMPMainMenu(arg_68_1, {
				activeTabIndex = 0
			})
		end
	},
	[MAIN_MENU.BladeKeys.CW] = {
		gainFocusLeftSFX = "ui_blade_left_bo",
		videoName = "main_menu_blade_ng",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_bo",
		smallButtonAnimation = "SmallButtonDefault",
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/NG_DESC"),
		getButtonOverAnimation = function(arg_69_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_70_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			else
				return false
			end
		end,
		buildCondition = function(arg_71_0)
			return CONDITIONS.CanDisplayNGBlade()
		end,
		action = function(arg_72_0, arg_72_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_72_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_73_0, arg_73_1)
					if arg_73_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_72_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_72_1)
			else
				Engine.EHEGFJJFB()
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_75_0, arg_75_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_75_1, false)
			else
				var_0_5(arg_75_0, arg_75_1)
			end
		end
	},
	[MAIN_MENU.BladeKeys.BR] = {
		verticalButtonOffset = 0,
		isWZBlade = true,
		gainFocusLeftSFX = "ui_blade_left_wz",
		gainFocusRightSFX = "ui_blade_right_wz",
		name = function()
			if not CONDITIONS.IsMagmaEnabled() then
				return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED"))
			else
				return Engine.CBBHFCGDIC("MP_BR_FRONTEND/TITLE_CAPS")
			end
		end,
		description = function()
			if not CONDITIONS.IsMagmaEnabled() then
				return ""
			else
				return Engine.CBBHFCGDIC("MP_BR_FRONTEND/DESC_BR")
			end
		end,
		videoName = function()
			if not CONDITIONS.IsMagmaEnabled() then
				local var_78_0 = tonumber(Engine.DCJHCAFIIA())
				local var_78_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_78_0 and var_78_0 > 0 and var_78_1 and var_78_1 > 0 then
					if var_78_1 <= var_78_0 then
						return "main_menu_blade_classified"
					else
						return "main_menu_blade_classified"
					end
				else
					return "main_menu_blade_classified_scrambled"
				end
			else
				return "main_menu_blade_br"
			end
		end,
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.BR) and not Engine.FABABBDBA() then
				if Engine.CIEGIACHAE() then
					local var_79_0, var_79_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR)

					if var_79_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
					elseif var_79_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_79_1
						}
					elseif var_79_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_79_1
						}
					elseif var_79_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_WARZONE"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
				end
			end
		end,
		installingAction = function(arg_80_0, arg_80_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_80_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_80_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_80_1, false)
			end
		end,
		installingPrompt = function(arg_81_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_82_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_83_0, arg_83_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_83_1) then
				local var_83_0 = {
					controllerIndex = arg_83_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_83_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_83_1, false, var_83_0)

				return true
			end
		end,
		isNew = function(arg_85_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_85_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_86_0, arg_86_1)
			Lobby.AttemptOpenBRMenu(arg_86_1, {})
		end,
		secondaryPrompt = function(arg_87_0)
			if Engine.CJJAFGIFAC(arg_87_0) then
				if CONDITIONS.IsConsoleGame() then
					return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
				elseif MAIN_MENU.ShouldShowModifyInstall() then
					return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
				end
			end
		end,
		secondaryAction = function(arg_88_0, arg_88_1)
			if Engine.CJJAFGIFAC(arg_88_1) then
				if CONDITIONS.IsConsoleGame() then
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_88_1, false)
				else
					var_0_5(arg_88_0, arg_88_1)
				end
			end
		end,
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end
	},
	[MAIN_MENU.BladeKeys.CP] = {
		gainFocusLeftSFX = "ui_blade_left_coop",
		gainFocusRightSFX = "ui_blade_right_coop",
		verticalButtonOffset = 125,
		videoName = "main_menu_blade_cp",
		name = Engine.CBBHFCGDIC("LUA_MENU/COOP_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/COOP_DESC"),
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.CP) then
				if Engine.CIEGIACHAE() then
					local var_90_0, var_90_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

					if var_90_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
					elseif var_90_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_90_1
						}
					elseif var_90_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_90_1
						}
					elseif var_90_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_COOP"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
				end
			end
		end,
		installingAction = function(arg_91_0, arg_91_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_91_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_91_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_91_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_91_1, false)
			end
		end,
		installingPrompt = function(arg_92_0)
			if Engine.CIEGIACHAE() then
				local var_92_0 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

				if var_92_0 == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				elseif var_92_0 == ContentProgressState.NO_IN_QUEUE then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART_INSTALL")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_93_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCoopAllowed(arg_93_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_94_0, arg_94_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_94_1)

				return true
			end
		end,
		blockedPrompt = function(arg_95_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_96_0)
			if Engine.BECCFCBIAA("isCPNew", arg_96_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_97_0, arg_97_1)
			arg_97_0:AttemptOpenCoopMenu(arg_97_1)
		end
	},
	[MAIN_MENU.BladeKeys.STORE] = {
		verticalButtonOffset = 0,
		gainFocusLeftSFX = "ui_blade_left_store",
		gainFocusRightSFX = "ui_blade_right_store",
		name = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"),
		videoName = function(arg_98_0)
			if not BATTLEPASS.IsOwned(arg_98_0) then
				return "main_menu_blade_battlepass"
			else
				return "main_menu_blade_store"
			end
		end,
		isBlocked = function(arg_99_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end
		end,
		buildCondition = function()
			return CONDITIONS.IsStoreAllowed()
		end,
		action = function(arg_101_0, arg_101_1)
			Lobby.AttemptOpenBRMenu(arg_101_1, {
				useStandaloneStore = true,
				activeTabIndex = TAB.GetIndex(TAB.MP.STORE)
			})
		end,
		showStoreOverlay = function(arg_102_0)
			return Dvar.IBEGCHEFE("MLNLKSKNQN") and not BATTLEPASS.IsOwned(arg_102_0)
		end
	},
	[MAIN_MENU.BladeKeys.LP] = {
		description = "This is a debug option, not intended for ship...",
		gainFocusLeftSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_local",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_PLAY_CAPS"),
		isBlocked = function(arg_103_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_104_0)
			return CONDITIONS.IsDevelopmentBuildLocalPlayAllowed()
		end,
		action = function(arg_105_0, arg_105_1)
			arg_105_0:OpenLocalPlayOptionsPopup()
		end
	}
}
MAIN_MENU.BladeDataMagma = {
	[MAIN_MENU.BladeKeys.BuyMW] = {
		gainFocusLeftSFX = "ui_blade_left_campaign",
		imageName = "mm_blade_buy_mw_warzone",
		gainFocusRightSFX = "ui_blade_right_campaign",
		videoName = "main_menu_warzone_blade_buy_mw",
		showUpsellOverlay = true,
		name = Engine.CBBHFCGDIC("MENU/BUY_MW"),
		description = Engine.CBBHFCGDIC("LUA_MENU/MAGMA_UPSELL_TAGLINE"),
		isOnSale = function()
			return Dvar.IBEGCHEFE("MQRQOLKOTK")
		end,
		isBlocked = function()
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end
		end,
		action = function(arg_108_0, arg_108_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_108_1, false, nil)
		end,
		tertiaryAction = function(arg_109_0, arg_109_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_109_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function()
			return Dvar.IBEGCHEFE("SSRQTKMLQ")
		end
	},
	[MAIN_MENU.BladeKeys.CW] = var_0_6(MAIN_MENU.BladeData[MAIN_MENU.BladeKeys.CW], {
		showNGOverlay = true,
		videoName = "main_menu_warzone_blade_ng",
		isNew = false,
		imageName = "mm_blade_ng_warzone",
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/NG_DESC")
	}),
	[MAIN_MENU.BladeKeys.BR] = var_0_6(MAIN_MENU.BladeData[MAIN_MENU.BladeKeys.BR], {
		videoName = "main_menu_warzone_blade_br",
		isNew = false,
		imageName = "mm_blade_br_warzone",
		name = Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"),
		description = Engine.CBBHFCGDIC("MP_BR_FRONTEND/DESC_BR")
	}),
	[MAIN_MENU.BladeKeys.STORE] = var_0_6(MAIN_MENU.BladeData[MAIN_MENU.BladeKeys.STORE], {
		name = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC"),
		videoName = function(arg_112_0)
			if not BATTLEPASS.IsOwned(arg_112_0) then
				return "main_menu_warzone_blade_battlepass"
			else
				return "main_menu_warzone_blade_store"
			end
		end,
		imageName = function(arg_113_0)
			if not BATTLEPASS.IsOwned(arg_113_0) then
				return "mm_blade_battlepass_warzone"
			else
				return "mm_blade_store_warzone"
			end
		end
	})
}
MAIN_MENU.BladeDataRefresh = {
	[MAIN_MENU.BladeKeys.BuyVG] = {
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_bo",
		titleLogo = "logo_cod_store",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeVanguard",
		smallButtonAnimation = "SmallButtonDefault",
		isNGBlade = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_multiplayer" or "main_menu_blade_ch2_cw_upsell"
		end,
		backgroundImageName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_background_cw_multiplayer_ch3" or "main_background_cw_upsell"
		end,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_116_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_117_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			else
				return false
			end
		end,
		buildCondition = function(arg_118_0)
			local var_118_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			if var_118_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_118_1 = CONDITIONS.CanDisplayNGBlade()
				local var_118_2 = CONDITIONS.IsT9PremiumPlayer(arg_118_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_118_1 and not var_118_2
			end

			return var_118_0 == MAIN_MENU.NGBladeVisibility.ForceUpsell
		end,
		action = function(arg_119_0, arg_119_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_119_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_120_0, arg_120_1)
					if arg_120_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_119_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_119_1)
			elseif CONDITIONS.IsCrossLaunchDeepLinkEnabled() then
				local var_119_0 = {
					bypassDuplicateMenuCheck = true,
					overrideMenu = "SmallButtonDefault"
				}

				LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_119_1, true, var_119_0)
			elseif Dvar.IBEGCHEFE("QNNTLMRRM") then
				LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_119_1, false, {
					isZeus = true
				})
			else
				Engine.EHEGFJJFB()
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE_ACTION"),
		friendsCountUpdate = function(arg_121_0, arg_121_1)
			return var_0_7(arg_121_0, arg_121_1).onlineNextTitleCount
		end
	},
	[MAIN_MENU.BladeKeys.VG] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_store",
		smallButtonAnimation = "SmallButtonDefault",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeColdWar",
		gainFocusRightSFX = "ui_blade_right_bo",
		isNGBlade = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_campaign" or "main_menu_blade_ch2_cw"
		end,
		backgroundImageName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_background_cw_campaign_ch3" or "main_background_cw"
		end,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_124_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_125_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			else
				return false
			end
		end,
		buildCondition = function(arg_126_0)
			local var_126_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			if var_126_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_126_1 = CONDITIONS.CanDisplayNGBlade()
				local var_126_2 = CONDITIONS.IsT9PremiumPlayer(arg_126_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_126_1 and var_126_2
			end

			return var_126_0 == MAIN_MENU.NGBladeVisibility.ForcePlay
		end,
		action = function(arg_127_0, arg_127_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_127_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_128_0, arg_128_1)
					if arg_128_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_127_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_127_1)
			elseif CONDITIONS.IsCrossLaunchDeepLinkEnabled() then
				local var_127_0 = {
					bypassDuplicateMenuCheck = true,
					overrideMenu = "SmallButtonDefault"
				}

				LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_127_1, true, var_127_0)
			elseif Dvar.IBEGCHEFE("QNNTLMRRM") then
				LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_127_1, false, {
					isZeus = true
				})
			else
				Engine.EHEGFJJFB()
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_130_0, arg_130_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_130_1, false)
			else
				var_0_5(arg_130_0, arg_130_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_131_0, arg_131_1)
			return var_0_7(arg_131_0, arg_131_1).onlineNextTitleCount
		end
	},
	[MAIN_MENU.BladeKeys.BR] = {
		titleLogo = "logo_cod_wz",
		imageName = "blank",
		isWZBlade = true,
		gainFocusLeftSFX = "ui_blade_left_wz",
		gainFocusRightSFX = "ui_blade_right_wz",
		verticalButtonOffset = 0,
		name = function()
			if not CONDITIONS.IsMagmaEnabled() then
				return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED"))
			else
				return Engine.CBBHFCGDIC("MP_BR_FRONTEND/TITLE_CAPS")
			end
		end,
		videoName = function()
			if not CONDITIONS.IsMagmaEnabled() then
				local var_133_0 = tonumber(Engine.DCJHCAFIIA())
				local var_133_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_133_0 and var_133_0 > 0 and var_133_1 and var_133_1 > 0 then
					if var_133_1 <= var_133_0 then
						return "main_menu_blade_classified"
					else
						return "main_menu_blade_classified"
					end
				else
					return "main_menu_blade_classified_scrambled"
				end
			else
				return Dvar.DHEEJCCJBH("NKNPQRNMST")
			end
		end,
		backgroundImageName = Dvar.DHEEJCCJBH("SSLLKNRPS"),
		liveEventLocation = CRM.locations.WZ_LIVE_EVENT,
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.BR) and not Engine.FABABBDBA() then
				if Engine.CIEGIACHAE() then
					local var_134_0, var_134_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR)

					if var_134_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
					elseif var_134_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_134_1
						}
					elseif var_134_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_134_1
						}
					elseif var_134_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_WARZONE"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
				end
			end
		end,
		installingAction = function(arg_135_0, arg_135_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_135_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_135_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_135_1, false)
			end
		end,
		installingPrompt = function(arg_136_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_137_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_138_0, arg_138_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_138_1) then
				local var_138_0 = {
					controllerIndex = arg_138_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_138_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_138_1, false, var_138_0)

				return true
			end
		end,
		isNew = function(arg_140_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_140_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_141_0, arg_141_1)
			Lobby.AttemptOpenBRMenu(arg_141_1, {})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_143_0, arg_143_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_143_1, false)
			else
				var_0_5(arg_143_0, arg_143_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_145_0, arg_145_1)
			return var_0_7(arg_145_0, arg_145_1).onlineWarzoneCount
		end
	},
	[MAIN_MENU.BladeKeys.BuyMW] = {
		videoName = "main_menu_blade_ch2_mw_upsell",
		bladeThemeAnim = "SetThemeMW",
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		backgroundImageName = "main_background_mw_upsell",
		gainFocusLeftSFX = "ui_blade_left_campaign",
		gainFocusRightSFX = "ui_blade_right_campaign",
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		name = Engine.CBBHFCGDIC("MENU/BUY_MW"),
		isOnSale = function()
			return Dvar.IBEGCHEFE("MQRQOLKOTK")
		end,
		isBlocked = function()
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end
		end,
		action = function(arg_148_0, arg_148_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_148_1, false, nil)
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_149_0, arg_149_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_149_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_151_0)
			return not Engine.CFHBIHABCB(arg_151_0)
		end,
		friendsCountUpdate = function(arg_152_0, arg_152_1)
			return var_0_7(arg_152_0, arg_152_1).onlineMWCount
		end
	},
	[MAIN_MENU.BladeKeys.MW] = {
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_right_local",
		bladeThemeAnim = "SetThemeMW",
		gainFocusRightSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		name = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_mw_campaign" or "main_menu_blade_ch2_mw"
		end,
		backgroundImageName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_background_mw_campaign_ch3" or "main_background_mw"
		end,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		isBlocked = function(arg_155_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_156_0)
			return Engine.CFHBIHABCB(arg_156_0)
		end,
		action = function(arg_157_0, arg_157_1)
			local var_157_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_157_1, true, var_157_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_159_0, arg_159_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_159_1, false)
			else
				var_0_5(arg_159_0, arg_159_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_160_0, arg_160_1)
			return var_0_7(arg_160_0, arg_160_1).onlineMWCount
		end
	}
}
MAIN_MENU.BladeDataEmbedButtons = {
	[MAIN_MENU.BladeKeys.BuyCW] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_store",
		smallButtonAnimation = "SmallButtonDefault",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeColdWar",
		gainFocusRightSFX = "ui_blade_right_bo",
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		videoName = function()
			if CONDITIONS.IsT9ZombieFreeTrialEnabled() then
				return "main_menu_blade_ch2_cw_zm_free_trial"
			elseif CONDITIONS.IsVanguardRevealed() then
				return "main_menu_blade_ch3_cw_multiplayer"
			else
				return "main_menu_blade_ch2_cw_upsell"
			end
		end,
		backgroundImageName = function()
			if CONDITIONS.IsT9ZombieFreeTrialEnabled() then
				return "main_background_cw_zombies_free_trial"
			elseif CONDITIONS.IsVanguardRevealed() then
				return "main_background_cw_multiplayer_ch3"
			else
				return "main_background_cw_upsell"
			end
		end,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_163_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_164_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_165_0)
			local var_165_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_165_0 >= MAIN_MENU.NGBladeVisibility.First and var_165_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.BuyCW is invalid")

			if var_165_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_165_1 = CONDITIONS.CanDisplayNGBlade()
				local var_165_2 = CONDITIONS.IsT9PremiumPlayer(arg_165_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_165_1 and not var_165_2
			end

			return var_165_0 == MAIN_MENU.NGBladeVisibility.ForceUpsell
		end,
		action = function(arg_166_0, arg_166_1)
			MenuUtils.GoToStoreUpsellPopup(arg_166_0, arg_166_1, false, LUI.DEEP_LINK_GAME.COLD_WAR)
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() and MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_168_0, arg_168_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_168_0, arg_168_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE_ACTION"),
		friendsCountUpdate = function(arg_169_0)
			return var_0_7(arg_169_0).onlineNextTitleCount
		end
	},
	[MAIN_MENU.BladeKeys.CW] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_store",
		smallButtonAnimation = "SmallButtonDefault",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeColdWar",
		gainFocusRightSFX = "ui_blade_right_bo",
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_campaign" or "main_menu_blade_ch2_cw_cp"
		end,
		backgroundImageName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_background_cw_campaign_ch3" or "main_background_cw"
		end,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		buttonListData = {
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_campaign" or "main_menu_blade_ch2_cw_cp"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_cw_campaign_ch3" or "main_background_cw_campaign"
				end,
				isButtonBlocked = function(arg_174_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_175_0, arg_175_1)
					var_0_4(arg_175_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.Campaign)

					local var_175_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

					CrossLaunchUtils.CrossLaunchWithDeepLink(arg_175_0, arg_175_1, {
						_deepLinkGame = LUI.DEEP_LINK_GAME.COLD_WAR,
						_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.CP,
						_shouldUseBreakupPartyPopup = var_175_0
					})
				end
			},
			{
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_multiplayer" or "main_menu_blade_ch2_cw_mp"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_cw_multiplayer_ch3" or "main_background_cw_multiplayer"
				end,
				buttonAction = function(arg_178_0, arg_178_1)
					var_0_4(arg_178_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.MP)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.MP, LUI.DEEP_LINK_GAME.COLD_WAR)
				end
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_leagueplay" or "main_menu_blade_ch2_cw_ar"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_cw_leagueplay_ch3" or "main_background_cw_arena"
				end,
				buttonAction = function(arg_181_0, arg_181_1)
					var_0_4(arg_181_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.League)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ARENA, LUI.DEEP_LINK_GAME.COLD_WAR)
				end
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_zombies" or "main_menu_blade_ch2_cw_zm"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_cw_zombies_ch3" or "main_background_cw_zombies"
				end,
				isButtonBlocked = function(arg_184_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_185_0, arg_185_1)
					var_0_4(arg_185_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.Zombies)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ZM, LUI.DEEP_LINK_GAME.COLD_WAR)
				end
			}
		},
		getButtonOverAnimation = function(arg_186_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_187_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_188_0)
			local var_188_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_188_0 >= MAIN_MENU.NGBladeVisibility.First and var_188_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.CW is invalid")

			if var_188_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_188_1 = CONDITIONS.CanDisplayNGBlade()
				local var_188_2 = CONDITIONS.IsT9PremiumPlayer(arg_188_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_188_1 and var_188_2
			end

			return var_188_0 == MAIN_MENU.NGBladeVisibility.ForcePlay
		end,
		action = function(arg_189_0, arg_189_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_189_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_190_0, arg_190_1)
					if arg_190_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_189_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_189_1)
			elseif CONDITIONS.IsCrossLaunchDeepLinkEnabled() then
				local var_189_0 = {
					bypassDuplicateMenuCheck = true,
					overrideMenu = "SmallButtonDefault"
				}

				LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_189_1, true, var_189_0)
			else
				Engine.EHEGFJJFB()
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_192_0, arg_192_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_192_1, false)
			else
				var_0_5(arg_192_0, arg_192_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_193_0)
			return var_0_7(arg_193_0).onlineNextTitleCount
		end
	},
	[MAIN_MENU.BladeKeys.BR] = {
		titleLogo = "mm_blade_br_wz_s5_logo",
		imageName = "blank",
		isWZBlade = true,
		gainFocusLeftSFX = "ui_blade_left_wz",
		gainFocusRightSFX = "ui_blade_right_wz",
		verticalButtonOffset = 0,
		name = function()
			if not CONDITIONS.IsMagmaEnabled() then
				return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED"))
			else
				return Engine.CBBHFCGDIC("MP_BR_FRONTEND/TITLE_CAPS")
			end
		end,
		videoName = function()
			if not CONDITIONS.IsMagmaEnabled() then
				local var_195_0 = tonumber(Engine.DCJHCAFIIA())
				local var_195_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_195_0 and var_195_0 > 0 and var_195_1 and var_195_1 > 0 then
					if var_195_1 <= var_195_0 then
						return "main_menu_blade_classified"
					else
						return "main_menu_blade_classified"
					end
				else
					return "main_menu_blade_classified_scrambled"
				end
			else
				return Dvar.DHEEJCCJBH("NKNPQRNMST")
			end
		end,
		backgroundImageName = function()
			return Dvar.DHEEJCCJBH("SSLLKNRPS")
		end,
		liveEventLocation = CRM.locations.WZ_LIVE_EVENT,
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.BR) and not Engine.FABABBDBA() then
				if Engine.CIEGIACHAE() then
					local var_197_0, var_197_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR)

					if var_197_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
					elseif var_197_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_197_1
						}
					elseif var_197_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_197_1
						}
					elseif var_197_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_WARZONE"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
				end
			end
		end,
		installingAction = function(arg_198_0, arg_198_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_198_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_198_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_198_1, false)
			end
		end,
		installingPrompt = function(arg_199_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_200_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_201_0, arg_201_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_201_1) then
				local var_201_0 = {
					controllerIndex = arg_201_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_201_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_201_1, false, var_201_0)

				return true
			end
		end,
		isNew = function(arg_203_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_203_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_204_0, arg_204_1)
			var_0_4(arg_204_1, MAIN_MENU.DLogBladeIDs.WZ, MAIN_MENU.DLogModeIDs.Warzone)

			local var_204_0 = Onboarding.ReverseNukeVideo.WasCompleted(self, arg_204_1)

			if Dvar.IBEGCHEFE("lui_should_show_reverse_nuke") and not var_204_0 then
				local function var_204_1(arg_205_0)
					return function()
						Onboarding.ReverseNukeVideo.MarkCompleted(self, arg_205_0)

						if prev_r_preloadShadersFrontendAllow ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", prev_r_preloadShadersFrontendAllow)
						end

						Lobby.AttemptOpenBRMenu(arg_205_0, {})
					end
				end

				local var_204_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				DebugPrint("DEBUG REVERSE NUKE VIDEO: Opening reverse nuke video")

				local var_204_3 = {
					unskippable = false,
					disableQuickAccess = true,
					video = "mp_light_island",
					skipImmediate = false,
					isEncrypted = true,
					skipVideoOnPartyJoin = false,
					onVideoFinished = var_204_1(arg_204_1)
				}

				LUI.FlowManager.RequestPopupMenu(self, "CinematicFullscreen", true, arg_204_1, false, var_204_3)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
			else
				Lobby.AttemptOpenBRMenu(arg_204_1, {})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_208_0, arg_208_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_208_1, false)
			else
				var_0_5(arg_208_0, arg_208_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_210_0)
			return var_0_7(arg_210_0).onlineWarzoneCount
		end
	},
	[MAIN_MENU.BladeKeys.BuyVG] = {
		verticalButtonOffset = 0,
		titleLogo = "logo_cod_vg",
		smallButtonAnimation = "SmallButtonDefault",
		imageName = "blank",
		backgroundImageName = "main_background_vg_upsell",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeVanguard",
		gainFocusRightSFX = "ui_blade_right_bo",
		isNGBlade = true,
		videoName = "main_menu_blade_vg_upsell",
		name = Engine.CBBHFCGDIC("LUA_MENU/VG_CAPS"),
		liveEventLocation = CRM.locations.NG_LIVE_EVENT,
		getButtonOverAnimation = function(arg_211_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_212_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_213_0)
			return not CONDITIONS.IsVGPremiumPlayer(arg_213_0)
		end,
		action = function(arg_214_0, arg_214_1)
			if CONDITIONS.IsVaguardTrialEnabled() then
				local var_214_0 = "CROSS_LAUNCH"
				local var_214_1 = "STORE_DOWNLOAD"

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_214_0, arg_214_1, {
					_fromPlaylistEventButton = true,
					_useUpsellPopupIfNotOwned = true
				})
				METRICS.TrialDownloadInitiatedDLogEvent(self, {
					controllerIndex = arg_214_1,
					downloadAction = CONDITIONS.IsOwnerOfCurrentUpsellTitle(arg_214_1) and var_214_0 or var_214_1
				})
			else
				LUI.FlowManager.RequestPopupMenu(self, "VGPreOrderPopup", true, arg_214_1, false, {})
			end
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() and MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_216_0, arg_216_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_216_0, arg_216_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		friendsCountUpdate = function(arg_217_0)
			return var_0_7(arg_217_0).onlineVGCount
		end
	},
	[MAIN_MENU.BladeKeys.VG] = {
		verticalButtonOffset = 0,
		titleLogo = "logo_cod_vg",
		smallButtonAnimation = "SmallButtonDefault",
		imageName = "blank",
		backgroundImageName = "main_background_vg_sp",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeVanguard",
		gainFocusRightSFX = "ui_blade_right_bo",
		isNGBlade = true,
		videoName = "main_menu_blade_vg_sp",
		name = Engine.CBBHFCGDIC("LUA_MENU/VG_CAPS"),
		liveEventLocation = CRM.locations.NG_LIVE_EVENT,
		getButtonOverAnimation = function(arg_218_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_219_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_220_0)
			return CONDITIONS.IsVGPremiumPlayer(arg_220_0)
		end,
		action = function(arg_221_0, arg_221_1)
			CrossLaunchUtils.CrossLaunchWithDeepLink(arg_221_0, arg_221_1, {
				_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
				_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
				_shouldUseBreakupPartyPopup = shouldUseBreakupPartyPopup
			})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_223_0, arg_223_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_223_1, false)
			else
				var_0_5(arg_223_0, arg_223_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_224_0)
			return var_0_7(arg_224_0).onlineVGCount
		end,
		buttonListData = {
			{
				backgroundImageName = "main_background_vg_sp",
				videoName = "main_menu_blade_vg_sp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
				isButtonBlocked = function(arg_225_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_226_0, arg_226_1)
					var_0_4(arg_226_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Campaign)

					local var_226_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

					CrossLaunchUtils.CrossLaunchWithDeepLink(arg_226_0, arg_226_1, {
						_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
						_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.SP,
						_shouldUseBreakupPartyPopup = var_226_0
					})
				end
			},
			{
				backgroundImageName = "main_background_vg_mp",
				videoName = "main_menu_blade_vg_mp",
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
				buttonAction = function(arg_227_0, arg_227_1)
					var_0_4(arg_227_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.MP)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.MP, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_background_vg_lp",
				videoName = "main_menu_blade_vg_lp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA_VG"),
				buttonAction = function(arg_228_0, arg_228_1)
					var_0_4(arg_228_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.League)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ARENA, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_background_vg_zm",
				videoName = "main_menu_blade_vg_zm",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
				isButtonBlocked = function(arg_229_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_230_0, arg_230_1)
					var_0_4(arg_230_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Zombies)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.CP, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			}
		}
	},
	[MAIN_MENU.BladeKeys.BuyMW] = {
		videoName = "main_menu_blade_ch2_mw_upsell",
		bladeThemeAnim = "SetThemeMW",
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		backgroundImageName = "main_background_mw_upsell",
		gainFocusLeftSFX = "ui_blade_left_campaign",
		gainFocusRightSFX = "ui_blade_right_campaign",
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		name = Engine.CBBHFCGDIC("MENU/BUY_MW"),
		isOnSale = function()
			return Dvar.IBEGCHEFE("MQRQOLKOTK")
		end,
		isBlocked = function()
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		action = function(arg_233_0, arg_233_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_233_1, false, nil)
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_234_0, arg_234_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_234_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_236_0)
			return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_236_0)
		end,
		friendsCountUpdate = function(arg_237_0)
			return var_0_7(arg_237_0).onlineMWCount
		end
	},
	[MAIN_MENU.BladeKeys.MW] = {
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_right_local",
		bladeThemeAnim = "SetThemeMW",
		gainFocusRightSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		name = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_mw_campaign" or "main_menu_blade_ch2_mw"
		end,
		backgroundImageName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_background_mw_campaign_ch3" or "main_background_mw"
		end,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		buttonListData = {
			{
				name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_mw_campaign" or "main_menu_blade_ch2_mw_sp"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_mw_campaign_ch3" or "main_background_mw_campaign"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.SP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.SP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.SP) and not Engine.FABABBDBA()
				end,
				isButtonBlocked = function(arg_243_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCampaignAllowed(arg_243_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
						return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
					end
				end
			},
			{
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_mw_multiplayer" or "main_menu_blade_ch2_mw_mp"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_mw_multiplayer_ch3" or "main_background_mw_multiplayer"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.MP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.MP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.MP)
				end,
				isButtonBlocked = function(arg_247_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsMultiplayerAllowed(arg_247_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/COOP_CAPS"),
				videoName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_mw_specops" or "main_menu_blade_ch2_mw_cp"
				end,
				backgroundImageName = function()
					return CONDITIONS.IsVanguardRevealed() and "main_background_mw_specops_ch3" or "main_background_mw_specops"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.CP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.CP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.CP)
				end,
				isButtonBlocked = function(arg_251_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCoopAllowed(arg_251_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			}
		},
		isBlocked = function(arg_252_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_253_0)
			return Engine.CFHBIHABCB(arg_253_0)
		end,
		action = function(arg_254_0, arg_254_1)
			local var_254_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_254_1, true, var_254_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_256_0, arg_256_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_256_1, false)
			else
				var_0_5(arg_256_0, arg_256_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_257_0)
			return var_0_7(arg_257_0).onlineMWCount
		end
	}
}
MAIN_MENU.BladeDataEmbedButtonsForCortez = {
	[MAIN_MENU.BladeKeys.BuyNG] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_cortez",
		imageName = "blank",
		smallButtonAnimation = "SmallButtonDefault",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeCortez",
		gainFocusRightSFX = "ui_blade_right_bo",
		name = Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_CAPS"),
		videoName = function()
			return "main_menu_3blade_cortez_upsell"
		end,
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("MRRKLMNTLM")
		end,
		backgroundImageName = function()
			return "main_menu_3blade_cortez_upsell_bg"
		end,
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_261_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_262_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_263_0)
			local var_263_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_263_0 >= MAIN_MENU.NGBladeVisibility.First and var_263_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.BuyNG is invalid")

			if var_263_0 == MAIN_MENU.NGBladeVisibility.Standard then
				return CONDITIONS.CanDisplayNGBlade() and not MAIN_MENU.IsNGActiveAndPlayable(arg_263_0)
			end

			return var_263_0 == MAIN_MENU.NGBladeVisibility.ForceUpsell
		end,
		action = function(arg_264_0, arg_264_1)
			LUI.FlowManager.RequestPopupMenu(self, "CortezPreOrderPopup", true, arg_264_1, false, {
				cortezEntryPointMenu = STORE.CortezEntryPointMenu.MainMenuBlades
			})
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() and MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_266_0, arg_266_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_266_0, arg_266_1)
			end
		end,
		actionName = function(arg_267_0)
			if Engine.CGABICJHAI() then
				return Engine.CBBHFCGDIC("MENU/PRE_PURCHASE")
			else
				return Engine.CBBHFCGDIC("MENU/PREORDER_TITLE")
			end
		end,
		preOrderLabelText = function(arg_268_0)
			if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
				if Engine.CGABICJHAI() then
					return Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ335/PRE_PURCHASE_NOW"))
				else
					return Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER"))
				end
			end
		end,
		friendsCountUpdate = function(arg_269_0)
			return var_0_7(arg_269_0).onlineHQCount
		end
	},
	[MAIN_MENU.BladeKeys.NG] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_cortez",
		imageName = "blank",
		smallButtonAnimation = "SmallButtonDefault",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeCortez",
		gainFocusRightSFX = "ui_blade_right_bo",
		name = Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_CAPS"),
		videoName = function()
			return "main_menu_3blade_cortez_upsell"
		end,
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("MRRKLMNTLM")
		end,
		backgroundImageName = function()
			return "main_menu_3blade_cortez_upsell_bg"
		end,
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_273_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_274_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_275_0)
			local var_275_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_275_0 >= MAIN_MENU.NGBladeVisibility.First and var_275_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.NG is invalid")

			if var_275_0 == MAIN_MENU.NGBladeVisibility.Standard then
				return CONDITIONS.CanDisplayNGBlade() and MAIN_MENU.IsNGActiveAndPlayable(arg_275_0)
			end

			return var_275_0 == MAIN_MENU.NGBladeVisibility.ForcePlay
		end,
		action = function(arg_276_0, arg_276_1)
			if MAIN_MENU.IsNGActiveBeta() then
				var_0_4(arg_276_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.MP)
				Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)

				local var_276_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_276_0, arg_276_1, {
					_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
					_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.MP,
					_shouldUseBreakupPartyPopup = var_276_0
				})
			elseif STORE.IsCortezOwned(arg_276_1) and (MAIN_MENU.IsCortezReleaseCountdown() or MAIN_MENU.IsCortezNowAvailable()) then
				var_0_4(arg_276_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.Campaign)
				Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)

				local var_276_1 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_276_0, arg_276_1, {
					_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
					_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.CP,
					_shouldUseBreakupPartyPopup = var_276_1
				})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_278_0, arg_278_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_278_1, false)
			else
				var_0_5(arg_278_0, arg_278_1)
			end
		end,
		actionName = function()
			return Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW_CAPS")
		end,
		friendsCountUpdate = function(arg_280_0)
			return var_0_7(arg_280_0).onlineHQCount
		end
	},
	[MAIN_MENU.BladeKeys.BR] = {
		titleLogo = "mm_blade_br_wz_s5_logo",
		imageName = "blank",
		isWZBlade = true,
		gainFocusLeftSFX = "ui_blade_left_wz",
		gainFocusRightSFX = "ui_blade_right_wz",
		verticalButtonOffset = 0,
		name = function()
			if not CONDITIONS.IsMagmaEnabled() then
				return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED"))
			else
				return Engine.CBBHFCGDIC("MP_BR_FRONTEND/TITLE_CAPS")
			end
		end,
		videoName = function()
			if not CONDITIONS.IsMagmaEnabled() then
				local var_282_0 = tonumber(Engine.DCJHCAFIIA())
				local var_282_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_282_0 and var_282_0 > 0 and var_282_1 and var_282_1 > 0 then
					if var_282_1 <= var_282_0 then
						return "main_menu_blade_classified"
					else
						return "main_menu_blade_classified"
					end
				else
					return "main_menu_blade_classified_scrambled"
				end
			else
				return Dvar.DHEEJCCJBH("NKNPQRNMST")
			end
		end,
		backgroundImageName = function()
			return Dvar.DHEEJCCJBH("SSLLKNRPS")
		end,
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.WZ_LIVE_EVENT,
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.BR) and not Engine.FABABBDBA() then
				if Engine.CIEGIACHAE() then
					local var_284_0, var_284_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR)

					if var_284_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
					elseif var_284_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_284_1
						}
					elseif var_284_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_284_1
						}
					elseif var_284_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_WARZONE"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_WARZONE"))
				end
			end
		end,
		installingAction = function(arg_285_0, arg_285_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_285_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_285_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_285_1, false)
			end
		end,
		installingPrompt = function(arg_286_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_287_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_288_0, arg_288_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_288_1) then
				local var_288_0 = {
					controllerIndex = arg_288_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_288_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_288_1, false, var_288_0)

				return true
			end
		end,
		isNew = function(arg_290_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_290_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_291_0, arg_291_1)
			var_0_4(arg_291_1, MAIN_MENU.DLogBladeIDs.WZ, MAIN_MENU.DLogModeIDs.Warzone)

			local var_291_0 = Onboarding.ReverseNukeVideo.WasCompleted(self, arg_291_1)

			if Dvar.IBEGCHEFE("lui_should_show_reverse_nuke") and not var_291_0 then
				local function var_291_1(arg_292_0)
					return function()
						Onboarding.ReverseNukeVideo.MarkCompleted(self, arg_292_0)

						if prev_r_preloadShadersFrontendAllow ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", prev_r_preloadShadersFrontendAllow)
						end

						Lobby.AttemptOpenBRMenu(arg_292_0, {})
					end
				end

				local var_291_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				DebugPrint("DEBUG REVERSE NUKE VIDEO: Opening reverse nuke video")

				local var_291_3 = {
					unskippable = false,
					disableQuickAccess = true,
					video = "mp_light_island",
					skipImmediate = false,
					isEncrypted = true,
					skipVideoOnPartyJoin = false,
					onVideoFinished = var_291_1(arg_291_1)
				}

				LUI.FlowManager.RequestPopupMenu(self, "CinematicFullscreen", true, arg_291_1, false, var_291_3)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
			else
				Lobby.AttemptOpenBRMenu(arg_291_1, {})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_295_0, arg_295_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_295_1, false)
			else
				var_0_5(arg_295_0, arg_295_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_297_0)
			return var_0_7(arg_297_0).onlineWarzoneCount
		end
	},
	[MAIN_MENU.BladeKeys.BuyVG] = {
		verticalButtonOffset = 0,
		titleLogo = "logo_cod_vg",
		imageName = "blank",
		smallButtonAnimation = "SmallButtonDefault",
		backgroundImageName = "main_menu_3blade_vg_upsell_bg",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeVanguard",
		gainFocusRightSFX = "ui_blade_right_bo",
		isNGBlade = true,
		videoName = "main_menu_3blade_vg_upsell",
		name = Engine.CBBHFCGDIC("LUA_MENU/VG_CAPS"),
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.NG_LIVE_EVENT,
		getButtonOverAnimation = function(arg_298_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_299_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_300_0)
			return not Engine.CFHBIHABCB(arg_300_0) and not CONDITIONS.IsVGPremiumPlayer(arg_300_0)
		end,
		action = function(arg_301_0, arg_301_1)
			if CONDITIONS.IsVaguardTrialEnabled() then
				local var_301_0 = "CROSS_LAUNCH"
				local var_301_1 = "STORE_DOWNLOAD"

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_301_0, arg_301_1, {
					_fromPlaylistEventButton = true,
					_useUpsellPopupIfNotOwned = true
				})
				METRICS.TrialDownloadInitiatedDLogEvent(self, {
					controllerIndex = arg_301_1,
					downloadAction = CONDITIONS.IsOwnerOfCurrentUpsellTitle(arg_301_1) and var_301_0 or var_301_1
				})
			else
				LUI.FlowManager.RequestPopupMenu(self, "VGPreOrderPopup", true, arg_301_1, false, {})
			end
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() and MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_303_0, arg_303_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_303_0, arg_303_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		friendsCountUpdate = function(arg_304_0)
			return var_0_7(arg_304_0).onlineVGCount
		end
	},
	[MAIN_MENU.BladeKeys.VG] = {
		verticalButtonOffset = 0,
		titleLogo = "logo_cod_vg",
		bladeThemeAnim = "SetThemeVanguard",
		imageName = "blank",
		smallButtonAnimation = "SmallButtonDefault",
		backgroundImageName = "main_menu_3blade_vg_mp_bg",
		gainFocusLeftSFX = "ui_blade_left_bo",
		gainFocusRightSFX = "ui_blade_right_bo",
		isNGBlade = true,
		videoName = "main_menu_3blade_vg_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/VG_CAPS"),
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.NG_LIVE_EVENT,
		getButtonOverAnimation = function(arg_305_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_306_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_307_0)
			return false
		end,
		action = function(arg_308_0, arg_308_1)
			CrossLaunchUtils.CrossLaunchWithDeepLink(arg_308_0, arg_308_1, {
				_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
				_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
				_shouldUseBreakupPartyPopup = shouldUseBreakupPartyPopup
			})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_310_0, arg_310_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_310_1, false)
			else
				var_0_5(arg_310_0, arg_310_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_311_0)
			return var_0_7(arg_311_0).onlineVGCount
		end,
		buttonListData = {
			{
				backgroundImageName = "main_menu_3blade_vg_cp_bg",
				videoName = "main_menu_3blade_vg_cp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
				isButtonBlocked = function(arg_312_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_313_0, arg_313_1)
					var_0_4(arg_313_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Campaign)

					local var_313_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

					CrossLaunchUtils.CrossLaunchWithDeepLink(arg_313_0, arg_313_1, {
						_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
						_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.SP,
						_shouldUseBreakupPartyPopup = var_313_0
					})
				end
			},
			{
				backgroundImageName = "main_menu_3blade_vg_mp_bg",
				videoName = "main_menu_3blade_vg_mp",
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
				buttonAction = function(arg_314_0, arg_314_1)
					var_0_4(arg_314_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.MP)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.MP, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_menu_3blade_vg_lp_bg",
				videoName = "main_menu_3blade_vg_lp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA_VG"),
				buttonAction = function(arg_315_0, arg_315_1)
					var_0_4(arg_315_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.League)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ARENA, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_menu_3blade_vg_zm_bg",
				videoName = "main_menu_3blade_vg_zm",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
				isButtonBlocked = function(arg_316_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_317_0, arg_317_1)
					var_0_4(arg_317_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Zombies)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.CP, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			}
		}
	},
	[MAIN_MENU.BladeKeys.BuyMW] = {
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		backgroundImageName = "main_menu_3blade_mw_upsell_bg",
		gainFocusLeftSFX = "ui_blade_left_campaign",
		bladeThemeAnim = "SetThemeMW",
		gainFocusRightSFX = "ui_blade_right_campaign",
		videoName = "main_menu_3blade_mw_upsell",
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("ui_is_mw_blade_video_encrypted")
		end,
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		name = Engine.CBBHFCGDIC("MENU/BUY_MW"),
		isOnSale = function()
			return Dvar.IBEGCHEFE("MQRQOLKOTK")
		end,
		isBlocked = function()
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		action = function(arg_321_0, arg_321_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_321_1, false, nil)
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_322_0, arg_322_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_322_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_324_0)
			return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_324_0) and CONDITIONS.IsVGPremiumPlayer(arg_324_0)
		end,
		friendsCountUpdate = function(arg_325_0)
			return var_0_7(arg_325_0).onlineMWCount
		end
	},
	[MAIN_MENU.BladeKeys.MW] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		gainFocusLeftSFX = "ui_blade_right_local",
		bladeThemeAnim = "SetThemeMW",
		gainFocusRightSFX = "ui_blade_right_local",
		name = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW"),
		videoName = function()
			return "main_menu_3blade_mw_sp"
		end,
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("ui_is_mw_blade_video_encrypted")
		end,
		backgroundImageName = function()
			return "main_menu_3blade_mw_upsell_bg"
		end,
		expandedRatio = MAIN_MENU.SHGExpandedRatio,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		buttonListData = {
			{
				name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
				videoName = function()
					return "main_menu_3blade_mw_cp"
				end,
				backgroundImageName = function()
					return "main_menu_3blade_mw_cp_bg"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.SP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.SP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.SP) and not Engine.FABABBDBA()
				end,
				isButtonBlocked = function(arg_332_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCampaignAllowed(arg_332_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
						return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
					end
				end
			},
			{
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"),
				videoName = function()
					return "main_menu_3blade_mw_mp"
				end,
				backgroundImageName = function()
					return "main_menu_3blade_mw_mp_bg"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.MP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.MP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.MP)
				end,
				isButtonBlocked = function(arg_336_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsMultiplayerAllowed(arg_336_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/COOP_CAPS"),
				videoName = function()
					return "main_menu_3blade_mw_sp"
				end,
				backgroundImageName = function()
					return "main_menu_3blade_mw_sp_bg"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.CP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.CP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.CP)
				end,
				isButtonBlocked = function(arg_340_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCoopAllowed(arg_340_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			}
		},
		isBlocked = function(arg_341_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_342_0)
			return Engine.CFHBIHABCB(arg_342_0)
		end,
		action = function(arg_343_0, arg_343_1)
			local var_343_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_343_1, true, var_343_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_345_0, arg_345_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_345_1, false)
			else
				var_0_5(arg_345_0, arg_345_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_346_0)
			return var_0_7(arg_346_0).onlineMWCount
		end
	}
}
MAIN_MENU.BladeDataEmbedButtonsForHQ = {
	[MAIN_MENU.BladeKeys.BuyHQ] = {
		verticalButtonOffset = 125,
		imageName = "blank",
		smallButtonAnimation = "SmallButtonDefault",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeCortez",
		gainFocusRightSFX = "ui_blade_right_bo",
		name = Engine.CBBHFCGDIC("LUA_MENU_WZ345/HQ_NAME"),
		videoName = function()
			return "main_menu_2blade_cortez"
		end,
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("MRRKLMNTLM")
		end,
		backgroundImageName = function()
			return "main_menu_2blade_cortez_mp"
		end,
		titleLogo = function()
			if MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
				return "logo_cod_mw2_wz2"
			else
				return "logo_cod_cortez"
			end
		end,
		expandedRatio = MAIN_MENU.TwoBladeExpandedRatio,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_351_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_352_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		isNew = function(arg_353_0)
			if Dvar.IBEGCHEFE("RTKSTRTR") then
				return ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW"))
			end
		end,
		buildCondition = function(arg_354_0)
			if MAIN_MENU.CanShowTwoBladeHQ() and (MAIN_MENU.GetNGBladeState() < MAIN_MENU.NGBladeStates.StyxNowAvailable or Dvar.IBEGCHEFE("MOPMNNNSNN")) then
				return not MAIN_MENU.IsCortezProductOwned(arg_354_0)
			end

			return false
		end,
		action = function(arg_355_0, arg_355_1)
			if MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
				MAIN_MENU.CheckPlatformForFirstPartyAction(arg_355_0, arg_355_1)
			else
				LUI.FlowManager.RequestPopupMenu(self, "CortezPreOrderPopup", true, arg_355_1, false, {
					cortezEntryPointMenu = STORE.CortezEntryPointMenu.MainMenuBlades
				})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_357_0, arg_357_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_357_1, false)
			else
				var_0_5(arg_357_0, arg_357_1)
			end
		end,
		actionName = function()
			if MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW_CAPS")
			else
				return Engine.CBBHFCGDIC("LUA_MENU_WZ355/PURCHASE")
			end
		end,
		friendsCountUpdate = function(arg_359_0)
			return var_0_7(arg_359_0).onlineHQCount
		end
	},
	[MAIN_MENU.BladeKeys.HQ] = {
		verticalButtonOffset = 125,
		imageName = "blank",
		smallButtonAnimation = "SmallButtonDefault",
		gainFocusLeftSFX = "ui_blade_left_bo",
		bladeThemeAnim = "SetThemeCortez",
		gainFocusRightSFX = "ui_blade_right_bo",
		name = Engine.CBBHFCGDIC("LUA_MENU_WZ345/HQ_NAME"),
		videoName = function()
			return "main_menu_2blade_cortez"
		end,
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("MRRKLMNTLM")
		end,
		backgroundImageName = function()
			return "main_menu_2blade_cortez_mp"
		end,
		titleLogo = function()
			if MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
				return "logo_cod_mw2_wz2"
			else
				return "logo_cod_cortez"
			end
		end,
		expandedRatio = MAIN_MENU.TwoBladeExpandedRatio,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_364_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_365_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		isNew = function(arg_366_0)
			if Dvar.IBEGCHEFE("RTKSTRTR") then
				return ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW"))
			end
		end,
		buildCondition = function(arg_367_0)
			if MAIN_MENU.CanShowTwoBladeHQ() then
				if MAIN_MENU.GetNGBladeState() < MAIN_MENU.NGBladeStates.StyxNowAvailable or Dvar.IBEGCHEFE("MOPMNNNSNN") then
					return MAIN_MENU.IsCortezProductOwned(arg_367_0)
				else
					return true
				end
			end

			return false
		end,
		action = function(arg_368_0, arg_368_1)
			if Engine.CHBHFFFIGH() then
				local var_368_0 = Dvar.DHEEJCCJBH("LMQTTPSQTS")

				if var_368_0 and var_368_0 ~= "" then
					Engine.BHECIAHGC(arg_368_1, WebBrowserType.FULLSCREEN, var_368_0)
				end
			else
				MAIN_MENU.CrosslaunchIntoHQ(arg_368_0, arg_368_1)
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_370_0, arg_370_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_370_1, false)
			else
				var_0_5(arg_370_0, arg_370_1)
			end
		end,
		actionName = function()
			return Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW_CAPS")
		end,
		friendsCountUpdate = function(arg_372_0)
			return var_0_7(arg_372_0).onlineHQCount
		end
	},
	[MAIN_MENU.BladeKeys.BuyMW] = {
		videoName = "main_menu_blade_ch2_mw_upsell",
		bladeThemeAnim = "SetThemeMW",
		titleLogo = "logo_cod_mw",
		imageName = "blank",
		backgroundImageName = "main_background_mw_upsell",
		gainFocusLeftSFX = "ui_blade_left_campaign",
		gainFocusRightSFX = "ui_blade_right_campaign",
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		name = Engine.CBBHFCGDIC("MENU/BUY_MW"),
		isOnSale = function()
			return Dvar.IBEGCHEFE("MQRQOLKOTK")
		end,
		isBlocked = function()
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end
		end,
		action = function(arg_375_0, arg_375_1)
			if Engine.EAABDHIDFJ() then
				local var_375_0 = Dvar.DHEEJCCJBH("LKNOLMOQLR")

				if var_375_0 and var_375_0 ~= "" then
					Commerce.DAGIHHFJIJ(arg_375_1, var_375_0)
					Engine.DJEDDFJEIG()
				end
			else
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_375_1, false, nil)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_376_0, arg_376_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_376_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_378_0)
			return not Engine.CFHBIHABCB(arg_378_0)
		end,
		friendsCountUpdate = function(arg_379_0, arg_379_1)
			return var_0_7(arg_379_0, arg_379_1).onlineMWCount
		end
	},
	[MAIN_MENU.BladeKeys.MW] = {
		titleLogo = "logo_cod_mw",
		baseVideoHeight = 2160,
		imageName = "blank",
		baseVideoWidth = 2400,
		gainFocusLeftSFX = "ui_blade_right_local",
		bladeThemeAnim = "SetThemeMW",
		gainFocusRightSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		name = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW"),
		videoName = function()
			return "main_menu_3blade_mw_sp"
		end,
		isVideoEncrypted = function()
			return Dvar.IBEGCHEFE("ui_is_mw_blade_video_encrypted")
		end,
		backgroundImageName = function()
			return "main_menu_3blade_mw_upsell_bg"
		end,
		expandedRatio = MAIN_MENU.TwoBladeExpandedRatio,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		buttonListData = {
			{
				name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
				videoName = function()
					return "main_menu_2blade_mw_campaign"
				end,
				backgroundImageName = function()
					return "main_background_mw_campaign"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.SP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.SP),
				videoVerticalOffset = function()
					if not MAIN_MENU.CanShowTwoBladeHQ() then
						return -400
					else
						return nil
					end
				end,
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.SP) and not Engine.FABABBDBA()
				end,
				isButtonBlocked = function(arg_387_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCampaignAllowed(arg_387_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
						return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
					end
				end
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"),
				videoName = function()
					return "main_menu_2blade_mw_multiplayer"
				end,
				backgroundImageName = function()
					return "main_background_mw_multiplayer"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.MP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.MP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.MP)
				end,
				isButtonBlocked = function(arg_391_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsMultiplayerAllowed(arg_391_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end,
				isDefaultButton = MAIN_MENU.CanShowTwoBladeHQ()
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/COOP_CAPS"),
				videoName = function()
					return "main_menu_2blade_mw_specops"
				end,
				backgroundImageName = function()
					return "main_background_mw_specops"
				end,
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.CP),
				buttonAction = var_0_13(menu, controllerIndex, MAIN_MENU.GameModeEnumValues.CP),
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.CP)
				end,
				isButtonBlocked = function(arg_395_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCoopAllowed(arg_395_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			}
		},
		isBlocked = function(arg_396_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_397_0)
			return MAIN_MENU.CanShowTwoBladeMW(arg_397_0) and Engine.CFHBIHABCB(arg_397_0)
		end,
		action = function(arg_398_0, arg_398_1)
			local var_398_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_398_1, true, var_398_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			elseif MAIN_MENU.ShouldShowModifyInstall() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_400_0, arg_400_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_400_1, false)
			else
				var_0_5(arg_400_0, arg_400_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_401_0)
			return var_0_7(arg_401_0).onlineMWCount
		end,
		expandedRatio = function()
			if not MAIN_MENU.CanShowTwoBladeHQ() then
				return 1.7777777777777777
			else
				return MAIN_MENU.TwoBladeExpandedRatio
			end
		end,
		keepAspect = function()
			if not MAIN_MENU.CanShowTwoBladeHQ() then
				return true
			else
				return false
			end
		end,
		playByDefault = function()
			return not MAIN_MENU.CanShowTwoBladeHQ()
		end
	}
}
MAIN_MENU.BladeDataCW = {
	[MAIN_MENU.BladeKeys.CW_Arena] = {
		verticalButtonOffset = 0,
		gainFocusLeftSFX = "ui_blade_right_local",
		gainFocusRightSFX = "ui_blade_right_local",
		name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_leagueplay" or "main_menu_blade_ch2_cw_upsell"
		end,
		isBlocked = function(arg_406_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_407_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_408_0, arg_408_1)
			Engine.EHEGFJJFB(LUI.DEEP_LINK_GAME_MODE.ARENA)
		end
	},
	[MAIN_MENU.BladeKeys.CW_CP] = {
		verticalButtonOffset = -125,
		gainFocusLeftSFX = "ui_blade_right_local",
		gainFocusRightSFX = "ui_blade_right_local",
		name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_campaign" or "main_menu_blade_ch2_cw_cp"
		end,
		isBlocked = function(arg_410_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_411_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_412_0, arg_412_1)
			local function var_412_0()
				if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() then
					Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_412_1)
					Engine.DAGFFDGFII("xstartprivateparty")
				end

				Engine.EHEGFJJFB(LUI.DEEP_LINK_GAME_MODE.CP)
			end

			local var_412_1 = true

			if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty() then
				LUI.FlowManager.RequestPopupMenu(self, "ConfirmShouldBreakupPrivateParty", true, arg_412_1, false, {
					yesAction = var_412_0
				})

				var_412_1 = false
			end

			if var_412_1 then
				var_412_0()
			end
		end
	},
	[MAIN_MENU.BladeKeys.CW_MP] = {
		verticalButtonOffset = 0,
		gainFocusLeftSFX = "ui_blade_right_local",
		isDefaultButton = true,
		gainFocusRightSFX = "ui_blade_right_local",
		name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_multiplayer" or "main_menu_blade_ch2_cw_mp"
		end,
		isBlocked = function(arg_415_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_416_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_417_0, arg_417_1)
			Engine.EHEGFJJFB(LUI.DEEP_LINK_GAME_MODE.MP)
		end
	},
	[MAIN_MENU.BladeKeys.CW_ZM] = {
		verticalButtonOffset = -125,
		gainFocusLeftSFX = "ui_blade_right_local",
		gainFocusRightSFX = "ui_blade_right_local",
		name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
		videoName = function()
			return CONDITIONS.IsVanguardRevealed() and "main_menu_blade_ch3_cw_zombies" or "main_menu_blade_ch2_cw_zm"
		end,
		isBlocked = function(arg_419_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_420_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_421_0, arg_421_1)
			Engine.EHEGFJJFB(LUI.DEEP_LINK_GAME_MODE.ZM)
		end
	}
}
MAIN_MENU.BladeDataMWCore = {
	[MAIN_MENU.BladeKeys.SP] = {
		gainFocusLeftSFX = "ui_blade_left_campaign",
		gainFocusRightSFX = "ui_blade_right_campaign",
		verticalButtonOffset = 0,
		videoName = "main_menu_blade_sp",
		name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
		description = Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_DESC"),
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.SP) and not Engine.FABABBDBA() then
				if Engine.CIEGIACHAE() then
					local var_422_0, var_422_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP)

					if var_422_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
					elseif var_422_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_422_1
						}
					elseif var_422_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_422_1
						}
					elseif var_422_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
				end
			end
		end,
		installingAction = function(arg_423_0, arg_423_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_423_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_423_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_423_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_423_1, false)
			end
		end,
		installingPrompt = function(arg_424_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_425_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCampaignAllowed(arg_425_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
				return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
			end
		end,
		blockedAction = function(arg_426_0, arg_426_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_426_1)
			end
		end,
		blockedPrompt = function(arg_427_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_428_0)
			if Engine.BECCFCBIAA("isSPNew", arg_428_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_429_0, arg_429_1)
			arg_429_0:AttemptOpenCampaignMenu(arg_429_1)
		end
	},
	[MAIN_MENU.BladeKeys.MP] = {
		gainFocusLeftSFX = "ui_blade_left_multiplayer",
		gainFocusRightSFX = "ui_blade_right_multiplayer",
		verticalButtonOffset = -125,
		isDefaultButton = true,
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"),
		description = Engine.CBBHFCGDIC("MENU_SP/DESC_MULTIPLAYER"),
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.MP) then
				if Engine.CIEGIACHAE() then
					local var_430_0, var_430_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP)

					if var_430_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
					elseif var_430_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_430_1
						}
					elseif var_430_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_430_1
						}
					elseif var_430_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
				end
			end
		end,
		installingAction = function(arg_431_0, arg_431_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_431_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_431_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_431_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_431_1, false)
			end
		end,
		installingPrompt = function(arg_432_0)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_433_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsMultiplayerAllowed(arg_433_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_434_0, arg_434_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_434_1)

				return true
			end
		end,
		blockedPrompt = function(arg_435_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_436_0)
			if Engine.BECCFCBIAA("isMPNew", arg_436_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_437_0, arg_437_1)
			arg_437_0:OpenMPMainMenu(arg_437_1, {
				activeTabIndex = 0
			})
		end
	},
	[MAIN_MENU.BladeKeys.CP] = {
		gainFocusLeftSFX = "ui_blade_left_coop",
		gainFocusRightSFX = "ui_blade_right_coop",
		verticalButtonOffset = 125,
		videoName = "main_menu_blade_cp",
		name = Engine.CBBHFCGDIC("LUA_MENU/COOP_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/COOP_DESC"),
		isInstalling = function()
			if not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.CP) then
				if Engine.CIEGIACHAE() then
					local var_438_0, var_438_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

					if var_438_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
					elseif var_438_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_438_1
						}
					elseif var_438_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_438_1
						}
					elseif var_438_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_COOP"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
				end
			end
		end,
		installingAction = function(arg_439_0, arg_439_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_439_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_439_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_439_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_439_1, false)
			end
		end,
		installingPrompt = function(arg_440_0)
			if Engine.CIEGIACHAE() then
				local var_440_0 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

				if var_440_0 == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				elseif var_440_0 == ContentProgressState.NO_IN_QUEUE then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART_INSTALL")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_441_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCoopAllowed(arg_441_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_442_0, arg_442_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_442_1)

				return true
			end
		end,
		blockedPrompt = function(arg_443_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_444_0)
			if Engine.BECCFCBIAA("isCPNew", arg_444_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_445_0, arg_445_1)
			arg_445_0:AttemptOpenCoopMenu(arg_445_1)
		end
	},
	[MAIN_MENU.BladeKeys.LP] = {
		description = "This is a debug option, not intended for ship...",
		gainFocusLeftSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_local",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_PLAY_CAPS"),
		isBlocked = function(arg_446_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_447_0)
			return CONDITIONS.IsDevelopmentBuildLocalPlayAllowed()
		end,
		action = function(arg_448_0, arg_448_1)
			arg_448_0:OpenLocalPlayOptionsPopup()
		end
	}
}
MAIN_MENU.OfflineBladeData = {
	[MAIN_MENU.BladeKeys.SP] = {
		gainFocusLeftSFX = "ui_blade_left_campaign",
		verticalButtonOffset = 0,
		gainFocusRightSFX = "ui_blade_right_campaign",
		videoName = "main_menu_blade_sp",
		name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
		description = Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_DESC"),
		isBlocked = function(arg_449_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_449_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end

			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("MENU/LOCKED")
			end
		end,
		blockedAction = function(arg_450_0, arg_450_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_450_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_450_1, false, nil)
			end

			if CONDITIONS.IsLaunchChunk() then
				return
			end
		end,
		blockedPrompt = function(arg_451_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_451_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_452_0, arg_452_1)
			arg_452_0:AttemptOpenCampaign(arg_452_1)
		end
	},
	[MAIN_MENU.BladeKeys.MP] = {
		gainFocusLeftSFX = "ui_blade_left_multiplayer",
		verticalButtonOffset = -125,
		gainFocusRightSFX = "ui_blade_right_multiplayer",
		isDefaultButton = true,
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_MULTIPLAYER_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_MULTIPLAYER_DESC"),
		isBlocked = function(arg_453_0)
			if not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_453_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end
		end,
		blockedAction = function(arg_454_0, arg_454_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_454_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_454_1, false, nil)
			end
		end,
		blockedPrompt = function(arg_455_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_455_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_456_0, arg_456_1)
			arg_456_0:AttemptOpenLocalPlay(arg_456_1)
		end
	},
	[MAIN_MENU.BladeKeys.CP] = {
		gainFocusLeftSFX = "ui_blade_left_coop",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_coop",
		videoName = "main_menu_blade_cp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_DESC"),
		isBlocked = function(arg_457_0)
			if not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_457_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end

			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("MENU/LOCKED")
			end
		end,
		blockedAction = function(arg_458_0, arg_458_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_458_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_458_1, false, nil)
			end

			if CONDITIONS.IsLaunchChunk() then
				return
			end
		end,
		blockedPrompt = function(arg_459_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_459_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_460_0, arg_460_1)
			arg_460_0:AttemptOpenCoop(arg_460_1)
		end
	}
}
MAIN_MENU.OfflineBladeDataMagma = {
	[MAIN_MENU.BladeKeys.BuyMW] = var_0_6(MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BuyMW], {
		isBlocked = CONDITIONS.IsLaunchChunk() and Engine.CBBHFCGDIC("MENU/UNAVAILABLE") or Engine.CBBHFCGDIC("PLATFORM/PLAY_ONLINE"),
		blockedPrompt = function()
			return Dvar.IBEGCHEFE("MNTMKQRSTQ") and "" or nil
		end
	}),
	[MAIN_MENU.BladeKeys.STORE] = var_0_6(MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.STORE], {
		isBlocked = CONDITIONS.IsLaunchChunk() and Engine.CBBHFCGDIC("MENU/UNAVAILABLE") or Engine.CBBHFCGDIC("PLATFORM/PLAY_ONLINE"),
		blockedPrompt = function()
			return Dvar.IBEGCHEFE("MNTMKQRSTQ") and "" or nil
		end
	})
}

function MAIN_MENU.TitleUpdateAvailablePopup(arg_463_0, arg_463_1)
	local var_463_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/TITLE_UPDATE_AVAILABLE"),
		button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		confirmation_action = function()
			Engine.DJEDDFJEIG()
		end
	}
	local var_463_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_463_0)

	var_463_1.id = "TitleUpdateAvailablePopup"

	return var_463_1
end

MenuBuilder.registerType("TitleUpdateAvailablePopup", MAIN_MENU.TitleUpdateAvailablePopup)

function MAIN_MENU.TryShowTitleUpdateAvailablePopup()
	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("MOLLKMKKNP") and Dvar.IBEGCHEFE("RMMMKOSTS") and not Dvar.IBEGCHEFE("LSOLROSLNT") then
		if Dvar.IBEGCHEFE("LPKOMPKSPL") then
			local var_465_0 = Engine.IJEBHJIJF()

			Engine.DAGFFDGFII("xstopprivateparty 0 1", var_465_0)

			if not LUI.FlowManager.IsMenuOnTop("MainMenu") then
				LUI.FlowManager.RequestRestoreMenu("MainMenu", true, var_465_0)
			end
		end

		LUI.FlowManager.RequestPopupMenu(nil, "TitleUpdateAvailablePopup", false, nil, false, nil)
		Dvar.DHEGHJJJHI("LSOLROSLNT", true)

		return true
	end

	return false
end

function MAIN_MENU.RegisterTitleUpdateAvailableEventHandler()
	local var_466_0 = Engine.DBFFAEEFGJ()

	assert(var_466_0)
	var_466_0:registerEventHandler("title_update_available", MAIN_MENU.TryShowTitleUpdateAvailablePopup)
end

function MAIN_MENU.CleanMagmaBladeNames()
	if not Dvar.IBEGCHEFE("blm_messaging") then
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BuyMW].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BuyMW].description = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BR].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BR].description = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.CW].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.CW].description = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.STORE].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.STORE].description = nil
	end
end
