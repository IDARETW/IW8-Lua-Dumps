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
	LegacyNowAvailableAndInstalled = 11,
	CortezNowAvailable = 7,
	StyxReleaseCountdown = 8,
	LegacyNowAvailableAndNotInstalled = 10,
	HideCortezRetail = 12,
	CortezReleaseCountdown = 6,
	BetaSonyPreOrderExclusiveActive = 2,
	BetaAllActive = 5,
	StyxNowAvailable = 9,
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
	CW = "cw"
}
MAIN_MENU.DLogModeIDs = {
	Zombies = "zm",
	MP = "mp",
	Campaign = "campaign",
	Vanguard = "vg",
	League = "mp-league",
	Warzone = "wz",
	Coop = "co-op"
}
MAIN_MENU.NGBladeStateDvar = "MSTOMTMNSL"
MAIN_MENU.PSVaultOwnershipFixKillswitchDvar = "lui_ps_vault_ownership_fix_killswitch_enabled"
MAIN_MENU.CWExpandedRatio = 0.91481
MAIN_MENU.SHGExpandedRatio = 0.7925925925925926
MAIN_MENU.TwoBladeExpandedRatio = 1.1111111111111112

function MAIN_MENU.GetNGBladeState()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar)
end

function MAIN_MENU.IsNGBladeActive()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) ~= MAIN_MENU.NGBladeStates.Inactive
end

function MAIN_MENU.IsNGActiveBetaRestricted()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.BetaSonyExclusiveActive and CONDITIONS.IsSony()
end

function MAIN_MENU.IsNGActiveBetaSonyPrePurchase()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.BetaSonyPreOrderExclusiveActive
end

function MAIN_MENU.IsNGActiveBetaSonyOpen()
	local var_5_0 = Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar)

	return var_5_0 == MAIN_MENU.NGBladeStates.BetaSonyOpenActive or var_5_0 == MAIN_MENU.NGBladeStates.BetaSonyOpenWithPcXboxPrepurchaseActive
end

function MAIN_MENU.IsNGActiveBetaSonyOpenAndPcXboxPrepurchase()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.BetaSonyOpenWithPcXboxPrepurchaseActive
end

function MAIN_MENU.IsNGActiveBetaOpenToAll()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.BetaAllActive
end

function MAIN_MENU.IsNGActiveBeta()
	local var_8_0 = Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar)

	return var_8_0 >= MAIN_MENU.NGBladeStates.BetaSonyPreOrderExclusiveActive and var_8_0 <= MAIN_MENU.NGBladeStates.BetaAllActive
end

function MAIN_MENU.IsPreOrderAvailable()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.NoBetaPreorderOnly
end

function MAIN_MENU.IsCortezReleaseCountdown()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.CortezReleaseCountdown
end

function MAIN_MENU.IsCortezNowAvailable()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.CortezNowAvailable
end

function MAIN_MENU.IsStyxReleaseCountdown()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.StyxReleaseCountdown
end

function MAIN_MENU.IsStyxNowAvailable()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.StyxNowAvailable
end

function MAIN_MENU.IsLegacyNowAvailable()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.LegacyNowAvailableAndNotInstalled or Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.LegacyNowAvailableAndInstalled
end

function MAIN_MENU.IsLegacyNotInstalled()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.LegacyNowAvailableAndNotInstalled
end

function MAIN_MENU.IsCortezRetailHidden()
	return Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) == MAIN_MENU.NGBladeStates.HideCortezRetail
end

function MAIN_MENU.IsCortezProductOwned(arg_17_0)
	local var_17_0, var_17_1, var_17_2 = MAIN_MENU.GetCortezProductOwned(arg_17_0, true)
	local var_17_3 = var_17_0.owned or var_17_1.owned

	return STORE.IsCortezOwned(arg_17_0) or var_17_3
end

function MAIN_MENU.GetCortezProductOwned(arg_18_0, arg_18_1)
	if arg_18_1 then
		InGameStore.FetchCatalog(arg_18_0, true, true)
	end

	local var_18_0 = CONDITIONS.IsPC() and STORE.CortezStandardID or STORE.CortezAltID
	local var_18_1 = InGameStore.GetProduct(arg_18_0, var_18_0)
	local var_18_2 = InGameStore.GetProduct(arg_18_0, STORE.CortezVaultID)
	local var_18_3 = InGameStore.GetProduct(arg_18_0, STORE.CortezUpgradeToUltimateID)
	local var_18_4 = false

	if var_18_1 then
		var_18_1.owned = var_18_1.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if var_18_2 then
		var_18_2.owned = var_18_2.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if var_18_3 then
		var_18_3.owned = var_18_3.status ~= InGameStoreProductStatus.NOT_OWNED or false
	end

	if not var_18_3 and var_18_2 and var_18_1 then
		return var_18_1, var_18_2, var_18_4
	elseif var_18_3 and not var_18_2 and var_18_1 then
		var_18_4 = true

		return var_18_1, var_18_3, var_18_4
	end

	if not Dvar.IBEGCHEFE(MAIN_MENU.PSVaultOwnershipFixKillswitchDvar) and CONDITIONS.IsSony() then
		var_18_1 = var_18_1 or {
			owned = CONDITIONS.IsCZStandardOrCrossGenOwned(arg_18_0)
		}
		var_18_2 = var_18_2 or {
			owned = CONDITIONS.IsCZVaultOwned(arg_18_0)
		}

		if var_18_1.owned == true and var_18_2.owned == false then
			var_18_4 = true
		end

		return var_18_1, var_18_2, var_18_4
	end

	if var_18_1 and var_18_3 and var_18_2 then
		DebugPrint("MAIN_MENU.GetCortezProductOwned: Standard / Crossgen, Vault, and Upgrade products all exist, this shouldn't happen")
	end

	if not var_18_1 then
		var_18_1 = {}
		var_18_1.owned = false

		DebugPrint("MAIN_MENU.GetCortezProductOwned: Standard / Crossgen product is missing, assuming no ownership")
	end

	local var_18_5

	if var_18_2 and var_18_2.owned then
		var_18_5 = var_18_2
	elseif var_18_3 and var_18_3.owned then
		var_18_5 = var_18_3
	elseif var_18_3 then
		var_18_5 = var_18_3
	elseif var_18_2 then
		var_18_5 = var_18_2
	else
		var_18_5 = {}
		var_18_5.owned = false

		DebugPrint("MAIN_MENU.GetCortezProductOwned: Vault + Upgrade products missing, assuming no ownership")
	end

	if var_18_1.owned == true and var_18_5.owned == false then
		var_18_4 = true
	end

	return var_18_1, var_18_5, var_18_4
end

function MAIN_MENU.IsNGActiveAndPlayable(arg_19_0)
	local var_19_0 = MAIN_MENU.IsNGBladeActive()
	local var_19_1, var_19_2, var_19_3 = MAIN_MENU.GetCortezProductOwned(arg_19_0, true)
	local var_19_4 = var_19_1.owned or var_19_2.owned
	local var_19_5 = STORE.IsCortezOwned(arg_19_0) or var_19_4
	local var_19_6 = CONDITIONS.IsSony()
	local var_19_7 = MAIN_MENU.IsNGActiveBetaSonyPrePurchase() and var_19_5 and var_19_6
	local var_19_8 = MAIN_MENU.IsNGActiveBetaSonyOpen() and var_19_6
	local var_19_9 = var_19_8 or MAIN_MENU.IsNGActiveBetaSonyOpenAndPcXboxPrepurchase() and var_19_5
	local var_19_10 = MAIN_MENU.IsNGActiveBetaOpenToAll()
	local var_19_11 = MAIN_MENU.IsCortezReleaseCountdown() and var_19_5

	return var_19_0 and (var_19_7 or var_19_8 or var_19_9 or var_19_10 or var_19_11)
end

function MAIN_MENU.CanShowTwoBladeHQ()
	return MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.CortezNowAvailable
end

function MAIN_MENU.CanShowTwoBladeWZ(arg_21_0)
	return MAIN_MENU.CanShowTwoBladeHQ() and not Engine.CFHBIHABCB(arg_21_0)
end

function MAIN_MENU.CanShowTwoBladeMW(arg_22_0)
	return MAIN_MENU.CanShowTwoBladeHQ() and Engine.CFHBIHABCB(arg_22_0)
end

local var_0_0 = {
	CW_CP = Dvar.CFHDGABACF("party_limit_cross_launch_cp") or 1,
	CW_MP = Dvar.CFHDGABACF("party_limit_cross_launch_mp") or 6,
	CW_ZM = Dvar.CFHDGABACF("party_limit_cross_launch_zm") or 4
}

local function var_0_1(arg_23_0)
	local var_23_0 = {
		title = ToUpperCase(Engine.CBBHFCGDIC(arg_23_0.titleLoc)),
		message = Engine.CBBHFCGDIC(arg_23_0.descLoc),
		buttons = {
			{
				label = Engine.CBBHFCGDIC(arg_23_0.buttonLableLoc),
				action = function()
					if arg_23_0.buttonAction then
						arg_23_0.buttonAction()
					end
				end
			}
		}
	}

	LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, arg_23_0.controllerIndex, false, var_23_0, nil, true, true)
end

local function var_0_2()
	return MAIN_MENU.IsStyxNowAvailable() or MAIN_MENU.IsLegacyNotInstalled()
end

local function var_0_3(arg_26_0)
	if MAIN_MENU.IsStyxReleaseCountdown() or MAIN_MENU.IsStyxNowAvailable() then
		local var_26_0 = {}

		var_26_0.titleLoc = "LUA_MENU_WZ345/WZONE_UNDER_MAINTENANCE_POPUP_TITLE"
		var_26_0.descLoc = "LUA_MENU_WZ345/WZONE_UNDER_MAINTENANCE_POPUP_DESC"
		var_26_0.buttonLableLoc = "LUA_MENU/CANCEL"
		var_26_0.controllerIndex = arg_26_0

		var_0_1(var_26_0)
	elseif MAIN_MENU.IsLegacyNotInstalled() then
		local var_26_1 = {}

		var_26_1.titleLoc = "LUA_MENU_WZ345/WZ_LEGACY_INSTALL_POPUP_TITLE"
		var_26_1.descLoc = "LUA_MENU_WZ345/WZ_LEGACY_INSTALL_POPUP_DESC"
		var_26_1.buttonLableLoc = "LUA_MENU/CONTINUE_CAPS"
		var_26_1.controllerIndex = arg_26_0

		function var_26_1.buttonAction()
			Dvar.DFIJDJFIFD(MAIN_MENU.NGBladeStateDvar, MAIN_MENU.NGBladeStates.LegacyNowAvailableAndInstalled)
		end

		var_0_1(var_26_1)
	end
end

local function var_0_4(arg_28_0, arg_28_1, arg_28_2)
	assert(arg_28_1 and arg_28_2)
	DebugPrint("BladeActionDlog: game - " .. tostring(arg_28_1) .. " | mode - " .. tostring(arg_28_2))
	Engine.CEJJDJJHIJ(arg_28_0, "dlog_event_menu_blade_choice", {
		game = arg_28_1,
		mode = arg_28_2
	})
end

local function var_0_5(arg_29_0, arg_29_1)
	if CONDITIONS.IsBattleNetModifyInstallEnabled() then
		LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_29_1, false)
	elseif not CONDITIONS.IsLaunchChunk() then
		local var_29_0 = LUI.FlowManager.GetScopedData(arg_29_0)

		if var_29_0 and var_29_0.currentSelectedMenuType then
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_29_1, false, {
				gameMode = var_29_0.currentSelectedMenuType
			})
		end
	end
end

local function var_0_6(arg_30_0, arg_30_1)
	local var_30_0 = LUI.ShallowCopy(arg_30_0)

	for iter_30_0, iter_30_1 in pairs(arg_30_1) do
		var_30_0[iter_30_0] = iter_30_1
	end

	return var_30_0
end

local function var_0_7(arg_31_0, arg_31_1)
	local var_31_0

	if not arg_31_1 then
		var_31_0 = Friends.FBFFEFEGB(arg_31_0, 0, 0, 0, false, false)
	else
		var_31_0 = arg_31_1
	end

	return var_31_0
end

local function var_0_8(arg_32_0)
	local var_32_0 = Engine.DBEGJIECGB(arg_32_0)
	local var_32_1 = arg_32_0 == MAIN_MENU.GameModeEnumValues.SP

	return var_32_0 and (not var_32_1 or not Engine.FABABBDBA())
end

local function var_0_9(arg_33_0)
	return function()
		local var_34_0 = {
			[MAIN_MENU.GameModeEnumValues.SP] = "LUA_MENU/INSTALL_CAMPAIGN",
			[MAIN_MENU.GameModeEnumValues.MP] = "LUA_MENU/INSTALL_MULTIPLAYER",
			[MAIN_MENU.GameModeEnumValues.CP] = "LUA_MENU/INSTALL_COOP"
		}
		local var_34_1 = {
			[MAIN_MENU.GameModeEnumValues.SP] = "LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN",
			[MAIN_MENU.GameModeEnumValues.MP] = "LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER",
			[MAIN_MENU.GameModeEnumValues.CP] = "LUA_MENU/REBOOT_TO_PLAY_COOP"
		}
		local var_34_2 = {
			[ContentProgressState.NOT_INSTALLED] = {
				suspended = false,
				details = "LUA_MENU/MISSING_DATA_PACK",
				state = ContentProgressState.NOT_INSTALLED,
				status = var_34_0[arg_33_0]
			},
			[ContentProgressState.SUSPENDED] = {
				suspended = true,
				details = "LUA_MENU/INSTALLATION_SUSPENDED",
				state = ContentProgressState.SUSPENDED,
				status = var_34_0[arg_33_0]
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
				details = var_34_1[arg_33_0]
			}
		}
		local var_34_3 = ContentProgressState.NOT_INSTALLED

		if Engine.CIEGIACHAE() then
			local var_34_4, var_34_5 = Engine.ECHHDAIBD(arg_33_0)

			var_34_3 = var_34_4

			if var_34_5 then
				var_34_2[var_34_4].progress = var_34_5
			end
		else
			var_34_3 = Engine.DBEGJIECGB(arg_33_0) and ContentProgressState.INSTALLED or ContentProgressState.NOT_INSTALLED
		end

		return var_34_2[var_34_3]
	end
end

function MAIN_MENU.InstallAction(arg_35_0, arg_35_1, arg_35_2)
	if Engine.CIEGIACHAE() then
		if Engine.ECHHDAIBD(arg_35_2) == ContentProgressState.INSTALLED then
			LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_35_1, false, nil)
		else
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_35_1, false)
		end
	elseif Engine.BAHIIBFDDG() then
		LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_35_1, false)
	elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("LQQNTKTLQK") then
		LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_35_1, false)
	end
end

local function var_0_10(arg_36_0)
	if arg_36_0 and LUI.FlowManager.IsInStack("MainMenu") then
		local var_36_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if var_36_0 then
			local var_36_1 = var_36_0.openMPMenuData

			var_36_1.menu:OpenMPMainMenu(var_36_1.controllerIndex, {
				activeTabIndex = 0
			})

			var_36_0.openMPMenuData = nil
		end
	end
end

local function var_0_11(arg_37_0)
	if arg_37_0 and LUI.FlowManager.IsInStack("MainMenu") then
		local var_37_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if var_37_0 then
			local var_37_1 = var_37_0.openCPMenuData

			var_37_1.menu:AttemptOpenCoopMenu(var_37_1.controllerIndex, {
				activeTabIndex = 0
			})

			var_37_0.openCPMenuData = nil
		end
	end
end

local function var_0_12(arg_38_0, arg_38_1)
	if Lobby.IsNotAloneInPrivateParty() then
		if Engine.JACCCCEDI() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_38_0, false, {
				premium = true,
				invalidPlaylists = {},
				leavePartyAction = arg_38_1
			})

			return false
		elseif not Engine.HBIAGEFCC() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_38_0, false, {
				subscription = true,
				invalidPlaylists = {},
				leavePartyAction = arg_38_1
			})

			return false
		end
	end

	return true
end

local function var_0_13(arg_39_0, arg_39_1, arg_39_2)
	return function(arg_40_0, arg_40_1)
		if Engine.ECHHDAIBD(arg_39_2) == ContentProgressState.INSTALLED then
			if arg_39_2 == MAIN_MENU.GameModeEnumValues.SP then
				var_0_4(arg_40_1, MAIN_MENU.DLogBladeIDs.MW, MAIN_MENU.DLogModeIDs.Campaign)
				arg_40_0:AttemptOpenCampaignMenu(arg_40_1)
			elseif arg_39_2 == MAIN_MENU.GameModeEnumValues.MP then
				if LUI.FlowManager.IsInStack("MainMenu") then
					local var_40_0 = LUI.FlowManager.GetScopedData("MainMenu")

					if var_40_0 then
						var_40_0.openMPMenuData = {
							menu = arg_40_0,
							controllerIndex = arg_40_1,
							gameMode = arg_39_2
						}
					end
				end

				if var_0_12(arg_40_1, var_0_10) == false then
					return
				end

				var_0_4(arg_40_1, MAIN_MENU.DLogBladeIDs.MW, MAIN_MENU.DLogModeIDs.MP)
				var_0_10(true)
			elseif arg_39_2 == MAIN_MENU.GameModeEnumValues.CP then
				if LUI.FlowManager.IsInStack("MainMenu") then
					local var_40_1 = LUI.FlowManager.GetScopedData("MainMenu")

					if var_40_1 then
						var_40_1.openCPMenuData = {
							menu = arg_40_0,
							controllerIndex = arg_40_1,
							gameMode = arg_39_2
						}
					end
				end

				if var_0_12(arg_40_1, var_0_11) == false then
					return
				end

				var_0_4(arg_40_1, MAIN_MENU.DLogBladeIDs.MW, MAIN_MENU.DLogModeIDs.Coop)
				var_0_11(true)
			end
		else
			MAIN_MENU.InstallAction(arg_40_0, arg_40_1, arg_39_2)
		end
	end
end

local function var_0_14(arg_41_0, arg_41_1)
	return function(arg_42_0)
		if CONDITIONS.InPrivatePartyAndNotHost() then
			return {
				isBlocked = true,
				text = Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			}
		elseif arg_42_0 > arg_41_0 then
			return {
				isBlocked = true,
				text = Engine.CBBHFCGDIC("LUA_MENU/PARTY_LIMIT_EXCEEDED", arg_41_0)
			}
		end

		return {
			isBlocked = false
		}
	end
end

function MAIN_MENU.IsUpgradeToUltimateAvailable(arg_43_0)
	local var_43_0, var_43_1, var_43_2 = MAIN_MENU.GetCortezProductOwned(arg_43_0, true)

	return var_43_2
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
					local var_44_0, var_44_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP)

					if var_44_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
					elseif var_44_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_44_1
						}
					elseif var_44_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_44_1
						}
					elseif var_44_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
				end
			end
		end,
		installingAction = function(arg_45_0, arg_45_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_45_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_45_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_45_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_45_1, false)
			end
		end,
		installingPrompt = function(arg_46_0)
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
		isBlocked = function(arg_47_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCampaignAllowed(arg_47_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
				return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
			end
		end,
		blockedAction = function(arg_48_0, arg_48_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_48_1)
			end
		end,
		blockedPrompt = function(arg_49_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_50_0)
			if Engine.BECCFCBIAA("isSPNew", arg_50_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_51_0, arg_51_1)
			arg_51_0:AttemptOpenCampaignMenu(arg_51_1)
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
					local var_52_0, var_52_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP)

					if var_52_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
					elseif var_52_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_52_1
						}
					elseif var_52_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_52_1
						}
					elseif var_52_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
				end
			end
		end,
		installingAction = function(arg_53_0, arg_53_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_53_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_53_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_53_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_53_1, false)
			end
		end,
		installingPrompt = function(arg_54_0)
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
		isBlocked = function(arg_55_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsMultiplayerAllowed(arg_55_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_56_0, arg_56_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_56_1)

				return true
			end
		end,
		blockedPrompt = function(arg_57_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_58_0)
			if Engine.BECCFCBIAA("isMPNew", arg_58_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_59_0, arg_59_1)
			arg_59_0:OpenMPMainMenu(arg_59_1, {
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
		getButtonOverAnimation = function(arg_60_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_61_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			else
				return false
			end
		end,
		buildCondition = function(arg_62_0)
			return CONDITIONS.CanDisplayNGBlade()
		end,
		action = function(arg_63_0, arg_63_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_63_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_64_0, arg_64_1)
					if arg_64_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_63_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_63_1)
			else
				Engine.EHEGFJJFB()
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_66_0, arg_66_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_66_1, false)
			else
				var_0_5(arg_66_0, arg_66_1)
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
				local var_69_0 = tonumber(Engine.DCJHCAFIIA())
				local var_69_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_69_0 and var_69_0 > 0 and var_69_1 and var_69_1 > 0 then
					if var_69_1 <= var_69_0 then
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
			return
		end,
		installingAction = function(arg_71_0, arg_71_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_71_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_71_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_71_1, false)
			end
		end,
		installingPrompt = function(arg_72_0)
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
		isBlocked = function(arg_73_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_74_0, arg_74_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_74_1) then
				local var_74_0 = {
					controllerIndex = arg_74_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_74_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_74_1, false, var_74_0)

				return true
			end
		end,
		isNew = function(arg_76_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_76_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_77_0, arg_77_1)
			Lobby.AttemptOpenBRMenu(arg_77_1, {})
		end,
		secondaryPrompt = function(arg_78_0)
			if Engine.CJJAFGIFAC(arg_78_0) then
				if CONDITIONS.IsConsoleGame() then
					return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
				end
			end
		end,
		secondaryAction = function(arg_79_0, arg_79_1)
			if Engine.CJJAFGIFAC(arg_79_1) then
				if CONDITIONS.IsConsoleGame() then
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_79_1, false)
				else
					var_0_5(arg_79_0, arg_79_1)
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
					local var_81_0, var_81_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

					if var_81_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
					elseif var_81_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_81_1
						}
					elseif var_81_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_81_1
						}
					elseif var_81_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_COOP"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
				end
			end
		end,
		installingAction = function(arg_82_0, arg_82_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_82_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_82_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_82_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_82_1, false)
			end
		end,
		installingPrompt = function(arg_83_0)
			if Engine.CIEGIACHAE() then
				local var_83_0 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

				if var_83_0 == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				elseif var_83_0 == ContentProgressState.NO_IN_QUEUE then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART_INSTALL")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_84_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCoopAllowed(arg_84_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_85_0, arg_85_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_85_1)

				return true
			end
		end,
		blockedPrompt = function(arg_86_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_87_0)
			if Engine.BECCFCBIAA("isCPNew", arg_87_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_88_0, arg_88_1)
			arg_88_0:AttemptOpenCoopMenu(arg_88_1)
		end
	},
	[MAIN_MENU.BladeKeys.STORE] = {
		verticalButtonOffset = 0,
		gainFocusLeftSFX = "ui_blade_left_store",
		gainFocusRightSFX = "ui_blade_right_store",
		name = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"),
		videoName = function(arg_89_0)
			if not BATTLEPASS.IsOwned(arg_89_0) then
				return "main_menu_blade_battlepass"
			else
				return "main_menu_blade_store"
			end
		end,
		isBlocked = function(arg_90_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end
		end,
		buildCondition = function()
			return CONDITIONS.IsStoreAllowed()
		end,
		action = function(arg_92_0, arg_92_1)
			Lobby.AttemptOpenBRMenu(arg_92_1, {
				useStandaloneStore = true,
				activeTabIndex = TAB.GetIndex(TAB.MP.STORE)
			})
		end,
		showStoreOverlay = function(arg_93_0)
			return Dvar.IBEGCHEFE("MLNLKSKNQN") and not BATTLEPASS.IsOwned(arg_93_0)
		end
	},
	[MAIN_MENU.BladeKeys.LP] = {
		description = "This is a debug option, not intended for ship...",
		gainFocusLeftSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_local",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_PLAY_CAPS"),
		isBlocked = function(arg_94_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_95_0)
			return CONDITIONS.IsDevelopmentBuildLocalPlayAllowed()
		end,
		action = function(arg_96_0, arg_96_1)
			arg_96_0:OpenLocalPlayOptionsPopup()
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
		action = function(arg_99_0, arg_99_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_99_1, false, nil)
		end,
		tertiaryAction = function(arg_100_0, arg_100_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_100_1, true)
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
		videoName = function(arg_103_0)
			if not BATTLEPASS.IsOwned(arg_103_0) then
				return "main_menu_warzone_blade_battlepass"
			else
				return "main_menu_warzone_blade_store"
			end
		end,
		imageName = function(arg_104_0)
			if not BATTLEPASS.IsOwned(arg_104_0) then
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
		getButtonOverAnimation = function(arg_107_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_108_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			else
				return false
			end
		end,
		buildCondition = function(arg_109_0)
			local var_109_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			if var_109_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_109_1 = CONDITIONS.CanDisplayNGBlade()
				local var_109_2 = CONDITIONS.IsT9PremiumPlayer(arg_109_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_109_1 and not var_109_2
			end

			return var_109_0 == MAIN_MENU.NGBladeVisibility.ForceUpsell
		end,
		action = function(arg_110_0, arg_110_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_110_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_111_0, arg_111_1)
					if arg_111_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_110_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_110_1)
			elseif CONDITIONS.IsCrossLaunchDeepLinkEnabled() then
				local var_110_0 = {
					bypassDuplicateMenuCheck = true,
					overrideMenu = "SmallButtonDefault"
				}

				LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_110_1, true, var_110_0)
			elseif Dvar.IBEGCHEFE("QNNTLMRRM") then
				LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_110_1, false, {
					isZeus = true
				})
			else
				Engine.EHEGFJJFB()
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE_ACTION"),
		friendsCountUpdate = function(arg_112_0, arg_112_1)
			return var_0_7(arg_112_0, arg_112_1).onlineNextTitleCount
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
		getButtonOverAnimation = function(arg_115_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_116_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			else
				return false
			end
		end,
		buildCondition = function(arg_117_0)
			local var_117_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			if var_117_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_117_1 = CONDITIONS.CanDisplayNGBlade()
				local var_117_2 = CONDITIONS.IsT9PremiumPlayer(arg_117_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_117_1 and var_117_2
			end

			return var_117_0 == MAIN_MENU.NGBladeVisibility.ForcePlay
		end,
		action = function(arg_118_0, arg_118_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_118_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_119_0, arg_119_1)
					if arg_119_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_118_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_118_1)
			elseif CONDITIONS.IsCrossLaunchDeepLinkEnabled() then
				local var_118_0 = {
					bypassDuplicateMenuCheck = true,
					overrideMenu = "SmallButtonDefault"
				}

				LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_118_1, true, var_118_0)
			elseif Dvar.IBEGCHEFE("QNNTLMRRM") then
				LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_118_1, false, {
					isZeus = true
				})
			else
				Engine.EHEGFJJFB()
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_121_0, arg_121_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_121_1, false)
			else
				var_0_5(arg_121_0, arg_121_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_122_0, arg_122_1)
			return var_0_7(arg_122_0, arg_122_1).onlineNextTitleCount
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
				local var_124_0 = tonumber(Engine.DCJHCAFIIA())
				local var_124_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_124_0 and var_124_0 > 0 and var_124_1 and var_124_1 > 0 then
					if var_124_1 <= var_124_0 then
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
			return
		end,
		installingAction = function(arg_126_0, arg_126_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_126_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_126_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_126_1, false)
			end
		end,
		installingPrompt = function(arg_127_0)
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
		isBlocked = function(arg_128_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_129_0, arg_129_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_129_1) then
				local var_129_0 = {
					controllerIndex = arg_129_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_129_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_129_1, false, var_129_0)

				return true
			end
		end,
		isNew = function(arg_131_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_131_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_132_0, arg_132_1)
			Lobby.AttemptOpenBRMenu(arg_132_1, {})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_134_0, arg_134_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_134_1, false)
			else
				var_0_5(arg_134_0, arg_134_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_136_0, arg_136_1)
			return var_0_7(arg_136_0, arg_136_1).onlineWarzoneCount
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
		action = function(arg_139_0, arg_139_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_139_1, false, nil)
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_140_0, arg_140_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_140_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_142_0)
			return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_142_0)
		end,
		friendsCountUpdate = function(arg_143_0, arg_143_1)
			return var_0_7(arg_143_0, arg_143_1).onlineMWCount
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
		isBlocked = function(arg_146_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_147_0)
			return Engine.CFHBIHABCB(arg_147_0)
		end,
		action = function(arg_148_0, arg_148_1)
			local var_148_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_148_1, true, var_148_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_150_0, arg_150_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_150_1, false)
			else
				var_0_5(arg_150_0, arg_150_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_151_0, arg_151_1)
			return var_0_7(arg_151_0, arg_151_1).onlineMWCount
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
		getButtonOverAnimation = function(arg_154_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_155_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_156_0)
			local var_156_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_156_0 >= MAIN_MENU.NGBladeVisibility.First and var_156_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.BuyCW is invalid")

			if var_156_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_156_1 = CONDITIONS.CanDisplayNGBlade()
				local var_156_2 = CONDITIONS.IsT9PremiumPlayer(arg_156_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_156_1 and not var_156_2
			end

			return var_156_0 == MAIN_MENU.NGBladeVisibility.ForceUpsell
		end,
		action = function(arg_157_0, arg_157_1)
			MenuUtils.GoToStoreUpsellPopup(arg_157_0, arg_157_1, false, LUI.DEEP_LINK_GAME.COLD_WAR)
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_159_0, arg_159_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_159_0, arg_159_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE_ACTION"),
		friendsCountUpdate = function(arg_160_0)
			return var_0_7(arg_160_0).onlineNextTitleCount
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
				isButtonBlocked = function(arg_165_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_166_0, arg_166_1)
					var_0_4(arg_166_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.Campaign)

					local var_166_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

					CrossLaunchUtils.CrossLaunchWithDeepLink(arg_166_0, arg_166_1, {
						_deepLinkGame = LUI.DEEP_LINK_GAME.COLD_WAR,
						_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.CP,
						_shouldUseBreakupPartyPopup = var_166_0
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
				buttonAction = function(arg_169_0, arg_169_1)
					var_0_4(arg_169_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.MP)
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
				buttonAction = function(arg_172_0, arg_172_1)
					var_0_4(arg_172_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.League)
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
				isButtonBlocked = function(arg_175_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_176_0, arg_176_1)
					var_0_4(arg_176_1, MAIN_MENU.DLogBladeIDs.CW, MAIN_MENU.DLogModeIDs.Zombies)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ZM, LUI.DEEP_LINK_GAME.COLD_WAR)
				end
			}
		},
		getButtonOverAnimation = function(arg_177_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_178_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_179_0)
			local var_179_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_179_0 >= MAIN_MENU.NGBladeVisibility.First and var_179_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.CW is invalid")

			if var_179_0 == MAIN_MENU.NGBladeVisibility.Standard then
				local var_179_1 = CONDITIONS.CanDisplayNGBlade()
				local var_179_2 = CONDITIONS.IsT9PremiumPlayer(arg_179_0) or CONDITIONS.IsInKoreanIGRPaidSession()

				return var_179_1 and var_179_2
			end

			return var_179_0 == MAIN_MENU.NGBladeVisibility.ForcePlay
		end,
		action = function(arg_180_0, arg_180_1)
			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_180_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_181_0, arg_181_1)
					if arg_181_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_180_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_180_1)
			elseif CONDITIONS.IsCrossLaunchDeepLinkEnabled() then
				local var_180_0 = {
					bypassDuplicateMenuCheck = true,
					overrideMenu = "SmallButtonDefault"
				}

				LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_180_1, true, var_180_0)
			else
				Engine.EHEGFJJFB()
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_183_0, arg_183_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_183_1, false)
			else
				var_0_5(arg_183_0, arg_183_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_184_0)
			return var_0_7(arg_184_0).onlineNextTitleCount
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
				local var_186_0 = tonumber(Engine.DCJHCAFIIA())
				local var_186_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_186_0 and var_186_0 > 0 and var_186_1 and var_186_1 > 0 then
					if var_186_1 <= var_186_0 then
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
			return
		end,
		installingAction = function(arg_189_0, arg_189_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_189_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_189_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_189_1, false)
			end
		end,
		installingPrompt = function(arg_190_0)
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
		isBlocked = function(arg_191_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_192_0, arg_192_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_192_1) then
				local var_192_0 = {
					controllerIndex = arg_192_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_192_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_192_1, false, var_192_0)

				return true
			end
		end,
		isNew = function(arg_194_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_194_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_195_0, arg_195_1)
			var_0_4(arg_195_1, MAIN_MENU.DLogBladeIDs.WZ, MAIN_MENU.DLogModeIDs.Warzone)

			local var_195_0 = Onboarding.ReverseNukeVideo.WasCompleted(self, arg_195_1)

			if Dvar.IBEGCHEFE("lui_should_show_reverse_nuke") and not var_195_0 then
				local function var_195_1(arg_196_0)
					return function()
						Onboarding.ReverseNukeVideo.MarkCompleted(self, arg_196_0)

						if prev_r_preloadShadersFrontendAllow ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", prev_r_preloadShadersFrontendAllow)
						end

						Lobby.AttemptOpenBRMenu(arg_196_0, {})
					end
				end

				local var_195_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				DebugPrint("DEBUG REVERSE NUKE VIDEO: Opening reverse nuke video")

				local var_195_3 = {
					unskippable = false,
					disableQuickAccess = true,
					video = "mp_light_island",
					skipImmediate = false,
					isEncrypted = true,
					skipVideoOnPartyJoin = false,
					onVideoFinished = var_195_1(arg_195_1)
				}

				LUI.FlowManager.RequestPopupMenu(self, "CinematicFullscreen", true, arg_195_1, false, var_195_3)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
			else
				Lobby.AttemptOpenBRMenu(arg_195_1, {})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_199_0, arg_199_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_199_1, false)
			else
				var_0_5(arg_199_0, arg_199_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_201_0)
			return var_0_7(arg_201_0).onlineWarzoneCount
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
		getButtonOverAnimation = function(arg_202_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_203_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_204_0)
			return not CONDITIONS.IsVGPremiumPlayer(arg_204_0)
		end,
		action = function(arg_205_0, arg_205_1)
			if CONDITIONS.IsVaguardTrialEnabled() then
				local var_205_0 = "CROSS_LAUNCH"
				local var_205_1 = "STORE_DOWNLOAD"

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_205_0, arg_205_1, {
					_fromPlaylistEventButton = true,
					_useUpsellPopupIfNotOwned = true
				})
				METRICS.TrialDownloadInitiatedDLogEvent(self, {
					controllerIndex = arg_205_1,
					downloadAction = CONDITIONS.IsOwnerOfCurrentUpsellTitle(arg_205_1) and var_205_0 or var_205_1
				})
			else
				LUI.FlowManager.RequestPopupMenu(self, "VGPreOrderPopup", true, arg_205_1, false, {})
			end
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_207_0, arg_207_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_207_0, arg_207_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		friendsCountUpdate = function(arg_208_0)
			return var_0_7(arg_208_0).onlineVGCount
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
		getButtonOverAnimation = function(arg_209_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_210_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_211_0)
			return CONDITIONS.IsVGPremiumPlayer(arg_211_0)
		end,
		action = function(arg_212_0, arg_212_1)
			CrossLaunchUtils.CrossLaunchWithDeepLink(arg_212_0, arg_212_1, {
				_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
				_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
				_shouldUseBreakupPartyPopup = shouldUseBreakupPartyPopup
			})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_214_0, arg_214_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_214_1, false)
			else
				var_0_5(arg_214_0, arg_214_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_215_0)
			return var_0_7(arg_215_0).onlineVGCount
		end,
		buttonListData = {
			{
				backgroundImageName = "main_background_vg_sp",
				videoName = "main_menu_blade_vg_sp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
				isButtonBlocked = function(arg_216_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_217_0, arg_217_1)
					var_0_4(arg_217_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Campaign)

					local var_217_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

					CrossLaunchUtils.CrossLaunchWithDeepLink(arg_217_0, arg_217_1, {
						_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
						_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.SP,
						_shouldUseBreakupPartyPopup = var_217_0
					})
				end
			},
			{
				backgroundImageName = "main_background_vg_mp",
				videoName = "main_menu_blade_vg_mp",
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
				buttonAction = function(arg_218_0, arg_218_1)
					var_0_4(arg_218_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.MP)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.MP, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_background_vg_lp",
				videoName = "main_menu_blade_vg_lp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA_VG"),
				buttonAction = function(arg_219_0, arg_219_1)
					var_0_4(arg_219_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.League)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ARENA, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_background_vg_zm",
				videoName = "main_menu_blade_vg_zm",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
				isButtonBlocked = function(arg_220_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_221_0, arg_221_1)
					var_0_4(arg_221_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Zombies)
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
		action = function(arg_224_0, arg_224_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_224_1, false, nil)
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_225_0, arg_225_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_225_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_227_0)
			return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_227_0)
		end,
		friendsCountUpdate = function(arg_228_0)
			return var_0_7(arg_228_0).onlineMWCount
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
				isButtonBlocked = function(arg_234_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCampaignAllowed(arg_234_0) then
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
				isButtonBlocked = function(arg_238_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsMultiplayerAllowed(arg_238_0) then
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
				isButtonBlocked = function(arg_242_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCoopAllowed(arg_242_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			}
		},
		isBlocked = function(arg_243_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_244_0)
			return Engine.CFHBIHABCB(arg_244_0)
		end,
		action = function(arg_245_0, arg_245_1)
			local var_245_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_245_1, true, var_245_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_247_0, arg_247_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_247_1, false)
			else
				var_0_5(arg_247_0, arg_247_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_248_0)
			return var_0_7(arg_248_0).onlineMWCount
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
		getButtonOverAnimation = function(arg_252_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_253_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_254_0)
			local var_254_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_254_0 >= MAIN_MENU.NGBladeVisibility.First and var_254_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.BuyNG is invalid")

			if var_254_0 == MAIN_MENU.NGBladeVisibility.Standard then
				return CONDITIONS.CanDisplayNGBlade() and not MAIN_MENU.IsNGActiveAndPlayable(arg_254_0)
			end

			return var_254_0 == MAIN_MENU.NGBladeVisibility.ForceUpsell
		end,
		action = function(arg_255_0, arg_255_1)
			LUI.FlowManager.RequestPopupMenu(self, "CortezPreOrderPopup", true, arg_255_1, false, {
				cortezEntryPointMenu = STORE.CortezEntryPointMenu.MainMenuBlades
			})
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_257_0, arg_257_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_257_0, arg_257_1)
			end
		end,
		actionName = function(arg_258_0)
			if Engine.CGABICJHAI() then
				return Engine.CBBHFCGDIC("MENU/PRE_PURCHASE")
			else
				return Engine.CBBHFCGDIC("MENU/PREORDER_TITLE")
			end
		end,
		preOrderLabelText = function(arg_259_0)
			if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
				if Engine.CGABICJHAI() then
					return Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ335/PRE_PURCHASE_NOW"))
				else
					return Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER"))
				end
			end
		end,
		friendsCountUpdate = function(arg_260_0)
			return var_0_7(arg_260_0).onlineHQCount
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
		getButtonOverAnimation = function(arg_264_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_265_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_266_0)
			local var_266_0 = Dvar.CFHDGABACF("ui_ng_blade_vis_override") or 0

			assert(var_266_0 >= MAIN_MENU.NGBladeVisibility.First and var_266_0 <= MAIN_MENU.NGBladeVisibility.Last, "ui_ng_blade_vis_override for MAIN_MENU.BladeKeys.NG is invalid")

			if var_266_0 == MAIN_MENU.NGBladeVisibility.Standard then
				return CONDITIONS.CanDisplayNGBlade() and MAIN_MENU.IsNGActiveAndPlayable(arg_266_0)
			end

			return var_266_0 == MAIN_MENU.NGBladeVisibility.ForcePlay
		end,
		action = function(arg_267_0, arg_267_1)
			if MAIN_MENU.IsNGActiveBeta() then
				var_0_4(arg_267_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.MP)
				Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)

				local var_267_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_267_0, arg_267_1, {
					_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
					_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.MP,
					_shouldUseBreakupPartyPopup = var_267_0
				})
			elseif STORE.IsCortezOwned(arg_267_1) and (MAIN_MENU.IsCortezReleaseCountdown() or MAIN_MENU.IsCortezNowAvailable()) then
				var_0_4(arg_267_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.Campaign)
				Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)

				local var_267_1 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_267_0, arg_267_1, {
					_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
					_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.CP,
					_shouldUseBreakupPartyPopup = var_267_1
				})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_269_0, arg_269_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_269_1, false)
			else
				var_0_5(arg_269_0, arg_269_1)
			end
		end,
		actionName = function()
			return Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW_CAPS")
		end,
		friendsCountUpdate = function(arg_271_0)
			return var_0_7(arg_271_0).onlineHQCount
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
				local var_273_0 = tonumber(Engine.DCJHCAFIIA())
				local var_273_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_273_0 and var_273_0 > 0 and var_273_1 and var_273_1 > 0 then
					if var_273_1 <= var_273_0 then
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
			return
		end,
		installingAction = function(arg_276_0, arg_276_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_276_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_276_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_276_1, false)
			end
		end,
		installingPrompt = function(arg_277_0)
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
		isBlocked = function(arg_278_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_279_0, arg_279_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_279_1) then
				local var_279_0 = {
					controllerIndex = arg_279_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_279_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_279_1, false, var_279_0)

				return true
			end
		end,
		isNew = function(arg_281_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_281_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_282_0, arg_282_1)
			var_0_4(arg_282_1, MAIN_MENU.DLogBladeIDs.WZ, MAIN_MENU.DLogModeIDs.Warzone)

			local var_282_0 = Onboarding.ReverseNukeVideo.WasCompleted(self, arg_282_1)

			if Dvar.IBEGCHEFE("lui_should_show_reverse_nuke") and not var_282_0 then
				local function var_282_1(arg_283_0)
					return function()
						Onboarding.ReverseNukeVideo.MarkCompleted(self, arg_283_0)

						if prev_r_preloadShadersFrontendAllow ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", prev_r_preloadShadersFrontendAllow)
						end

						Lobby.AttemptOpenBRMenu(arg_283_0, {})
					end
				end

				local var_282_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				DebugPrint("DEBUG REVERSE NUKE VIDEO: Opening reverse nuke video")

				local var_282_3 = {
					unskippable = false,
					disableQuickAccess = true,
					video = "mp_light_island",
					skipImmediate = false,
					isEncrypted = true,
					skipVideoOnPartyJoin = false,
					onVideoFinished = var_282_1(arg_282_1)
				}

				LUI.FlowManager.RequestPopupMenu(self, "CinematicFullscreen", true, arg_282_1, false, var_282_3)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
			else
				Lobby.AttemptOpenBRMenu(arg_282_1, {})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_286_0, arg_286_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_286_1, false)
			else
				var_0_5(arg_286_0, arg_286_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_288_0)
			return var_0_7(arg_288_0).onlineWarzoneCount
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
		getButtonOverAnimation = function(arg_289_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_290_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_291_0)
			return not Engine.CFHBIHABCB(arg_291_0) and not CONDITIONS.IsVGPremiumPlayer(arg_291_0)
		end,
		action = function(arg_292_0, arg_292_1)
			if CONDITIONS.IsVaguardTrialEnabled() then
				local var_292_0 = "CROSS_LAUNCH"
				local var_292_1 = "STORE_DOWNLOAD"

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_292_0, arg_292_1, {
					_fromPlaylistEventButton = true,
					_useUpsellPopupIfNotOwned = true
				})
				METRICS.TrialDownloadInitiatedDLogEvent(self, {
					controllerIndex = arg_292_1,
					downloadAction = CONDITIONS.IsOwnerOfCurrentUpsellTitle(arg_292_1) and var_292_0 or var_292_1
				})
			else
				LUI.FlowManager.RequestPopupMenu(self, "VGPreOrderPopup", true, arg_292_1, false, {})
			end
		end,
		secondaryPrompt = function()
			if not CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_294_0, arg_294_1)
			if not CONDITIONS.IsConsoleGame() then
				var_0_5(arg_294_0, arg_294_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		friendsCountUpdate = function(arg_295_0)
			return var_0_7(arg_295_0).onlineVGCount
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
		getButtonOverAnimation = function(arg_296_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_297_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_298_0)
			return false
		end,
		action = function(arg_299_0, arg_299_1)
			CrossLaunchUtils.CrossLaunchWithDeepLink(arg_299_0, arg_299_1, {
				_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
				_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
				_shouldUseBreakupPartyPopup = shouldUseBreakupPartyPopup
			})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_301_0, arg_301_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_301_1, false)
			else
				var_0_5(arg_301_0, arg_301_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_302_0)
			return var_0_7(arg_302_0).onlineVGCount
		end,
		buttonListData = {
			{
				backgroundImageName = "main_menu_3blade_vg_cp_bg",
				videoName = "main_menu_3blade_vg_cp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
				isButtonBlocked = function(arg_303_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_304_0, arg_304_1)
					var_0_4(arg_304_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Campaign)

					local var_304_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

					CrossLaunchUtils.CrossLaunchWithDeepLink(arg_304_0, arg_304_1, {
						_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD,
						_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.SP,
						_shouldUseBreakupPartyPopup = var_304_0
					})
				end
			},
			{
				backgroundImageName = "main_menu_3blade_vg_mp_bg",
				videoName = "main_menu_3blade_vg_mp",
				isDefaultButton = true,
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
				buttonAction = function(arg_305_0, arg_305_1)
					var_0_4(arg_305_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.MP)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.MP, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_menu_3blade_vg_lp_bg",
				videoName = "main_menu_3blade_vg_lp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA_VG"),
				buttonAction = function(arg_306_0, arg_306_1)
					var_0_4(arg_306_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.League)
					CrossLaunchUtils.HostCrossLaunchInitiate(LUI.DEEP_LINK_GAME_MODE.ARENA, LUI.DEEP_LINK_GAME.VANGUARD)
				end
			},
			{
				backgroundImageName = "main_menu_3blade_vg_zm_bg",
				videoName = "main_menu_3blade_vg_zm",
				name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
				isButtonBlocked = function(arg_307_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					end
				end,
				buttonAction = function(arg_308_0, arg_308_1)
					var_0_4(arg_308_1, MAIN_MENU.DLogBladeIDs.VG, MAIN_MENU.DLogModeIDs.Zombies)
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
		action = function(arg_312_0, arg_312_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_312_1, false, nil)
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_ACTION"),
		tertiaryAction = function(arg_313_0, arg_313_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_313_1, true)
			end
		end,
		tertiaryPrompt = function()
			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("LUA_MENU/PLAY_BOOT_CAMP")
			end
		end,
		buildCondition = function(arg_315_0)
			return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_315_0) and CONDITIONS.IsVGPremiumPlayer(arg_315_0)
		end,
		friendsCountUpdate = function(arg_316_0)
			return var_0_7(arg_316_0).onlineMWCount
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
				isButtonBlocked = function(arg_323_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCampaignAllowed(arg_323_0) then
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
				isButtonBlocked = function(arg_327_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsMultiplayerAllowed(arg_327_0) then
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
				isButtonBlocked = function(arg_331_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCoopAllowed(arg_331_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			}
		},
		isBlocked = function(arg_332_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_333_0)
			return Engine.CFHBIHABCB(arg_333_0)
		end,
		action = function(arg_334_0, arg_334_1)
			local var_334_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_334_1, true, var_334_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_336_0, arg_336_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_336_1, false)
			else
				var_0_5(arg_336_0, arg_336_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_337_0)
			return var_0_7(arg_337_0).onlineMWCount
		end
	}
}
MAIN_MENU.BladeDataEmbedButtonsForHQ = {
	[MAIN_MENU.BladeKeys.BuyHQ] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_cortez",
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
		expandedRatio = MAIN_MENU.TwoBladeExpandedRatio,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_341_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_342_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		isNew = function(arg_343_0)
			if Dvar.IBEGCHEFE("RTKSTRTR") then
				return ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW"))
			end
		end,
		buildCondition = function(arg_344_0)
			return MAIN_MENU.CanShowTwoBladeHQ() and not MAIN_MENU.IsCortezProductOwned(arg_344_0)
		end,
		action = function(arg_345_0, arg_345_1)
			LUI.FlowManager.RequestPopupMenu(self, "CortezPreOrderPopup", true, arg_345_1, false, {
				cortezEntryPointMenu = STORE.CortezEntryPointMenu.MainMenuBlades
			})
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_347_0, arg_347_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_347_1, false)
			else
				var_0_5(arg_347_0, arg_347_1)
			end
		end,
		actionName = function()
			return Engine.CBBHFCGDIC("LUA_MENU_WZ355/PURCHASE")
		end,
		friendsCountUpdate = function(arg_349_0)
			return var_0_7(arg_349_0).onlineHQCount
		end
	},
	[MAIN_MENU.BladeKeys.HQ] = {
		verticalButtonOffset = 125,
		titleLogo = "logo_cod_cortez",
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
		expandedRatio = MAIN_MENU.TwoBladeExpandedRatio,
		liveEventLocation = CRM.locations.CW_LIVE_EVENT,
		getButtonOverAnimation = function(arg_353_0)
			return IsLanguageEnglish() and "ButtonOverEnglish" or "ButtonOver"
		end,
		isBlocked = function(arg_354_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		isNew = function(arg_355_0)
			if Dvar.IBEGCHEFE("RTKSTRTR") then
				return ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW"))
			end
		end,
		buildCondition = function(arg_356_0)
			return MAIN_MENU.CanShowTwoBladeHQ() and MAIN_MENU.IsCortezProductOwned(arg_356_0)
		end,
		action = function(arg_357_0, arg_357_1)
			if MAIN_MENU.IsCortezNowAvailable() or MAIN_MENU.IsStyxReleaseCountdown() or MAIN_MENU.IsLegacyNowAvailable() then
				var_0_4(arg_357_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.Campaign)
				Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)

				local var_357_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_357_0, arg_357_1, {
					_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
					_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
					_shouldUseBreakupPartyPopup = var_357_0
				})
			elseif MAIN_MENU.IsStyxNowAvailable() then
				var_0_4(arg_357_1, MAIN_MENU.DLogBladeIDs.HQ, MAIN_MENU.DLogModeIDs.Campaign)
				Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.WZ2)

				local var_357_1 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

				CrossLaunchUtils.CrossLaunchWithDeepLink(arg_357_0, arg_357_1, {
					_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
					_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.NONE,
					_shouldUseBreakupPartyPopup = var_357_1
				})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_359_0, arg_359_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_359_1, false)
			else
				var_0_5(arg_359_0, arg_359_1)
			end
		end,
		actionName = function()
			return Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW_CAPS")
		end,
		friendsCountUpdate = function(arg_361_0)
			return var_0_7(arg_361_0).onlineHQCount
		end
	},
	[MAIN_MENU.BladeKeys.BR] = {
		verticalButtonOffset = 0,
		titleLogo = "mm_blade_br_wz_s5_logo",
		imageName = "blank",
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
			if MAIN_MENU.IsLegacyNowAvailable() then
				return Engine.CBBHFCGDIC("LUA_MENU_WZ345/LEGACY_DESC")
			end
		end,
		videoName = function()
			if not CONDITIONS.IsMagmaEnabled() then
				local var_364_0 = tonumber(Engine.DCJHCAFIIA())
				local var_364_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_364_0 and var_364_0 > 0 and var_364_1 and var_364_1 > 0 then
					if var_364_1 <= var_364_0 then
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
		expandedRatio = MAIN_MENU.TwoBladeExpandedRatio,
		liveEventLocation = CRM.locations.WZ_LIVE_EVENT,
		isInstalling = function()
			return
		end,
		installingAction = function(arg_367_0, arg_367_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_367_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_367_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_367_1, false)
			end
		end,
		installingPrompt = function(arg_368_0)
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
		isBlocked = function(arg_369_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_370_0, arg_370_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_370_1) then
				local var_370_0 = {
					controllerIndex = arg_370_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_370_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_370_1, false, var_370_0)

				return true
			end
		end,
		isNew = function(arg_372_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_372_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		buildCondition = function(arg_373_0)
			return MAIN_MENU.CanShowTwoBladeWZ(arg_373_0) and not Engine.CFHBIHABCB(arg_373_0)
		end,
		action = function(arg_374_0, arg_374_1)
			if var_0_2() then
				var_0_3(arg_374_1)

				return
			end

			var_0_4(arg_374_1, MAIN_MENU.DLogBladeIDs.WZ, MAIN_MENU.DLogModeIDs.Warzone)

			local var_374_0 = Onboarding.ReverseNukeVideo.WasCompleted(self, arg_374_1)

			if Dvar.IBEGCHEFE("lui_should_show_reverse_nuke") and not var_374_0 then
				local function var_374_1(arg_375_0)
					return function()
						Onboarding.ReverseNukeVideo.MarkCompleted(self, arg_375_0)

						if prev_r_preloadShadersFrontendAllow ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", prev_r_preloadShadersFrontendAllow)
						end

						Lobby.AttemptOpenBRMenu(arg_375_0, {})
					end
				end

				local var_374_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				DebugPrint("DEBUG REVERSE NUKE VIDEO: Opening reverse nuke video")

				local var_374_3 = {
					unskippable = false,
					disableQuickAccess = true,
					video = "mp_light_island",
					skipImmediate = false,
					isEncrypted = true,
					skipVideoOnPartyJoin = false,
					onVideoFinished = var_374_1(arg_374_1)
				}

				LUI.FlowManager.RequestPopupMenu(self, "CinematicFullscreen", true, arg_374_1, false, var_374_3)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
			else
				Lobby.AttemptOpenBRMenu(arg_374_1, {})
			end
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_378_0, arg_378_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_378_1, false)
			else
				var_0_5(arg_378_0, arg_378_1)
			end
		end,
		actionName = function()
			if MAIN_MENU.IsCortezNowAvailable() or MAIN_MENU.IsLegacyNowAvailable() then
				return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"))
			elseif MAIN_MENU.IsStyxNowAvailable() then
				return ToUpperCase(Engine.CBBHFCGDIC("MENU/UNAVAILABLE"))
			end
		end,
		classified = function()
			return not CONDITIONS.IsMagmaEnabled()
		end,
		friendsCountUpdate = function(arg_381_0)
			if MAIN_MENU.IsStyxReleaseCountdown() or MAIN_MENU.IsStyxNowAvailable() then
				return -1
			end

			return var_0_7(arg_381_0).onlineWarzoneCount
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
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.SP) and not Engine.FABABBDBA()
				end,
				isButtonBlocked = function(arg_388_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCampaignAllowed(arg_388_0) then
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
				isButtonBlocked = function(arg_392_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsMultiplayerAllowed(arg_392_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
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
				isButtonBlocked = function(arg_396_0)
					if Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
						return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
					elseif not CONDITIONS.IsCoopAllowed(arg_396_0) then
						return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			},
			{
				name = function()
					if not CONDITIONS.IsMagmaEnabled() then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED"))
					else
						return Engine.CBBHFCGDIC("MP_BR_FRONTEND/TITLE_CAPS")
					end
				end,
				videoName = function()
					if not CONDITIONS.IsMagmaEnabled() then
						local var_398_0 = tonumber(Engine.DCJHCAFIIA())
						local var_398_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

						if var_398_0 and var_398_0 > 0 and var_398_1 and var_398_1 > 0 then
							if var_398_1 <= var_398_0 then
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
				installData = var_0_9(MAIN_MENU.GameModeEnumValues.BR),
				buttonAction = function(arg_400_0, arg_400_1)
					if var_0_2() then
						var_0_3(arg_400_1)

						return
					end

					var_0_4(arg_400_1, MAIN_MENU.DLogBladeIDs.WZ, MAIN_MENU.DLogModeIDs.Warzone)

					local var_400_0 = Onboarding.ReverseNukeVideo.WasCompleted(self, arg_400_1)

					if Dvar.IBEGCHEFE("lui_should_show_reverse_nuke") and not var_400_0 then
						local function var_400_1(arg_401_0)
							return function()
								Onboarding.ReverseNukeVideo.MarkCompleted(self, arg_401_0)

								if prev_r_preloadShadersFrontendAllow ~= nil then
									Dvar.DHEGHJJJHI("NRSSTQQSKK", prev_r_preloadShadersFrontendAllow)
								end

								Lobby.AttemptOpenBRMenu(arg_401_0, {})
							end
						end

						local var_400_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

						DebugPrint("DEBUG REVERSE NUKE VIDEO: Opening reverse nuke video")

						local var_400_3 = {
							unskippable = false,
							disableQuickAccess = true,
							video = "mp_light_island",
							skipImmediate = false,
							isEncrypted = true,
							skipVideoOnPartyJoin = false,
							onVideoFinished = var_400_1(arg_400_1)
						}

						LUI.FlowManager.RequestPopupMenu(self, "CinematicFullscreen", true, arg_400_1, false, var_400_3)
						Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
					else
						Lobby.AttemptOpenBRMenu(arg_400_1, {})
					end
				end,
				shouldInstall = function()
					return not Engine.DBEGJIECGB(MAIN_MENU.GameModeEnumValues.BR)
				end,
				isButtonBlocked = function(arg_404_0)
					if not CONDITIONS.IsMagmaEnabled() then
						return true
					elseif Engine.FABABBDBA() then
						return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
					elseif CONDITIONS.InPrivatePartyAndNotHost() then
						return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
					end
				end
			}
		},
		isBlocked = function(arg_405_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			end

			return false
		end,
		buildCondition = function(arg_406_0)
			return MAIN_MENU.CanShowTwoBladeMW(arg_406_0) and Engine.CFHBIHABCB(arg_406_0)
		end,
		action = function(arg_407_0, arg_407_1)
			local var_407_0 = {
				bypassDuplicateMenuCheck = true,
				overrideMenu = "MW"
			}

			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_407_1, true, var_407_0)
		end,
		secondaryPrompt = function()
			if CONDITIONS.IsConsoleGame() then
				return Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			end
		end,
		secondaryAction = function(arg_409_0, arg_409_1)
			if CONDITIONS.IsConsoleGame() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_409_1, false)
			else
				var_0_5(arg_409_0, arg_409_1)
			end
		end,
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PLAY_ACTION"),
		friendsCountUpdate = function(arg_410_0)
			return var_0_7(arg_410_0).onlineMWCount
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
		isBlocked = function(arg_412_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_413_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_414_0, arg_414_1)
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
		isBlocked = function(arg_416_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_417_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_418_0, arg_418_1)
			local function var_418_0()
				if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() then
					Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_418_1)
					Engine.DAGFFDGFII("xstartprivateparty")
				end

				Engine.EHEGFJJFB(LUI.DEEP_LINK_GAME_MODE.CP)
			end

			local var_418_1 = true

			if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty() then
				LUI.FlowManager.RequestPopupMenu(self, "ConfirmShouldBreakupPrivateParty", true, arg_418_1, false, {
					yesAction = var_418_0
				})

				var_418_1 = false
			end

			if var_418_1 then
				var_418_0()
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
		isBlocked = function(arg_421_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_422_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_423_0, arg_423_1)
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
		isBlocked = function(arg_425_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_426_0)
			return CONDITIONS.IsCrossLaunchDeepLinkEnabled()
		end,
		action = function(arg_427_0, arg_427_1)
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
					local var_428_0, var_428_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP)

					if var_428_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
					elseif var_428_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_428_1
						}
					elseif var_428_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_428_1
						}
					elseif var_428_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
				end
			end
		end,
		installingAction = function(arg_429_0, arg_429_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_429_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_429_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_429_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_429_1, false)
			end
		end,
		installingPrompt = function(arg_430_0)
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
		isBlocked = function(arg_431_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCampaignAllowed(arg_431_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
				return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
			end
		end,
		blockedAction = function(arg_432_0, arg_432_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_432_1)
			end
		end,
		blockedPrompt = function(arg_433_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_434_0)
			if Engine.BECCFCBIAA("isSPNew", arg_434_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_435_0, arg_435_1)
			arg_435_0:AttemptOpenCampaignMenu(arg_435_1)
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
					local var_436_0, var_436_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP)

					if var_436_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
					elseif var_436_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_436_1
						}
					elseif var_436_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_436_1
						}
					elseif var_436_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
				end
			end
		end,
		installingAction = function(arg_437_0, arg_437_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_437_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_437_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_437_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_437_1, false)
			end
		end,
		installingPrompt = function(arg_438_0)
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
		isBlocked = function(arg_439_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsMultiplayerAllowed(arg_439_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_440_0, arg_440_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_440_1)

				return true
			end
		end,
		blockedPrompt = function(arg_441_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_442_0)
			if Engine.BECCFCBIAA("isMPNew", arg_442_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_443_0, arg_443_1)
			arg_443_0:OpenMPMainMenu(arg_443_1, {
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
					local var_444_0, var_444_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

					if var_444_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
					elseif var_444_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_444_1
						}
					elseif var_444_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_444_1
						}
					elseif var_444_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_COOP"))
					end
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
				end
			end
		end,
		installingAction = function(arg_445_0, arg_445_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_445_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_445_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_445_1, false)
			elseif CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_445_1, false)
			end
		end,
		installingPrompt = function(arg_446_0)
			if Engine.CIEGIACHAE() then
				local var_446_0 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

				if var_446_0 == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				elseif var_446_0 == ContentProgressState.NO_IN_QUEUE then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART_INSTALL")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_447_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCoopAllowed(arg_447_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_448_0, arg_448_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_448_1)

				return true
			end
		end,
		blockedPrompt = function(arg_449_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_450_0)
			if Engine.BECCFCBIAA("isCPNew", arg_450_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_451_0, arg_451_1)
			arg_451_0:AttemptOpenCoopMenu(arg_451_1)
		end
	},
	[MAIN_MENU.BladeKeys.LP] = {
		description = "This is a debug option, not intended for ship...",
		gainFocusLeftSFX = "ui_blade_right_local",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_local",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_PLAY_CAPS"),
		isBlocked = function(arg_452_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_453_0)
			return CONDITIONS.IsDevelopmentBuildLocalPlayAllowed()
		end,
		action = function(arg_454_0, arg_454_1)
			arg_454_0:OpenLocalPlayOptionsPopup()
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
		isBlocked = function(arg_455_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_455_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end

			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("MENU/LOCKED")
			end
		end,
		blockedAction = function(arg_456_0, arg_456_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_456_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_456_1, false, nil)
			end

			if CONDITIONS.IsLaunchChunk() then
				return
			end
		end,
		blockedPrompt = function(arg_457_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_457_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_458_0, arg_458_1)
			arg_458_0:AttemptOpenCampaign(arg_458_1)
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
		isBlocked = function(arg_459_0)
			if not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_459_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end
		end,
		blockedAction = function(arg_460_0, arg_460_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_460_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_460_1, false, nil)
			end
		end,
		blockedPrompt = function(arg_461_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_461_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_462_0, arg_462_1)
			arg_462_0:AttemptOpenLocalPlay(arg_462_1)
		end
	},
	[MAIN_MENU.BladeKeys.CP] = {
		gainFocusLeftSFX = "ui_blade_left_coop",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_coop",
		videoName = "main_menu_blade_cp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_DESC"),
		isBlocked = function(arg_463_0)
			if not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_463_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end

			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("MENU/LOCKED")
			end
		end,
		blockedAction = function(arg_464_0, arg_464_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_464_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_464_1, false, nil)
			end

			if CONDITIONS.IsLaunchChunk() then
				return
			end
		end,
		blockedPrompt = function(arg_465_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_465_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_466_0, arg_466_1)
			arg_466_0:AttemptOpenCoop(arg_466_1)
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
	[MAIN_MENU.BladeKeys.BR] = var_0_6(MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BR], {
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

function MAIN_MENU.TitleUpdateAvailablePopup(arg_470_0, arg_470_1)
	local var_470_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/TITLE_UPDATE_AVAILABLE"),
		button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		confirmation_action = function()
			Engine.DJEDDFJEIG()
		end
	}
	local var_470_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_470_0)

	var_470_1.id = "TitleUpdateAvailablePopup"

	return var_470_1
end

MenuBuilder.registerType("TitleUpdateAvailablePopup", MAIN_MENU.TitleUpdateAvailablePopup)

function MAIN_MENU.TryShowTitleUpdateAvailablePopup()
	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("MOLLKMKKNP") and Dvar.IBEGCHEFE("RMMMKOSTS") and not Dvar.IBEGCHEFE("LSOLROSLNT") then
		if Dvar.IBEGCHEFE("LPKOMPKSPL") then
			local var_472_0 = Engine.IJEBHJIJF()

			Engine.DAGFFDGFII("xstopprivateparty 0 1", var_472_0)

			if not LUI.FlowManager.IsMenuOnTop("MainMenu") then
				LUI.FlowManager.RequestRestoreMenu("MainMenu", true, var_472_0)
			end
		end

		LUI.FlowManager.RequestPopupMenu(nil, "TitleUpdateAvailablePopup", false, nil, false, nil)
		Dvar.DHEGHJJJHI("LSOLROSLNT", true)

		return true
	end

	return false
end

function MAIN_MENU.RegisterTitleUpdateAvailableEventHandler()
	local var_473_0 = Engine.DBFFAEEFGJ()

	assert(var_473_0)
	var_473_0:registerEventHandler("title_update_available", MAIN_MENU.TryShowTitleUpdateAvailablePopup)
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
