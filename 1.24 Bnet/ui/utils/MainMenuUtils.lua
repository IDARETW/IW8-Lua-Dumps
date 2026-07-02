MAIN_MENU = MAIN_MENU or {}
MAIN_MENU.BladeKeys = {
	MP = 3,
	BR = 4,
	CP = 5,
	SP = 2,
	BuyMW = 1,
	STORE = 6,
	LP = 7,
	NG = 8
}
MAIN_MENU.BladeType = {
	Accordion = 2,
	Shutter = 1
}
MAIN_MENU.BladeStates = {
	Neutral = 4,
	Installing = 1,
	New = 3,
	Blocked = 2
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

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.ShallowCopy(arg_1_0)

	for iter_1_0, iter_1_1 in pairs(arg_1_1) do
		var_1_0[iter_1_0] = iter_1_1
	end

	return var_1_0
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
					local var_2_0, var_2_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP)

					if var_2_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
					elseif var_2_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_2_1
						}
					elseif var_2_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_2_1
						}
					elseif var_2_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_CAMPAIGN"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_CAMPAIGN"))
				end
			end
		end,
		installingAction = function(arg_3_0, arg_3_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.SP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_3_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_3_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_3_1, false)
			end
		end,
		installingPrompt = function(arg_4_0)
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
		isBlocked = function(arg_5_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCampaignAllowed(arg_5_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) then
				return Engine.CBBHFCGDIC("MENU_SP/IGR_UNAVAILABLE")
			end
		end,
		blockedAction = function(arg_6_0, arg_6_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_6_1)
			end
		end,
		blockedPrompt = function(arg_7_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_8_0)
			if Engine.BECCFCBIAA("isSPNew", arg_8_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_9_0, arg_9_1)
			arg_9_0:AttemptOpenCampaignMenu(arg_9_1)
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
					local var_10_0, var_10_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP)

					if var_10_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
					elseif var_10_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_10_1
						}
					elseif var_10_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_10_1
						}
					elseif var_10_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_MULTIPLAYER"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_MULTIPLAYER"))
				end
			end
		end,
		installingAction = function(arg_11_0, arg_11_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.MP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_11_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_11_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_11_1, false)
			end
		end,
		installingPrompt = function(arg_12_0)
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
		isBlocked = function(arg_13_0)
			if Engine.FABABBDBA() and not Engine.DIEEIEFCFF() then
				return Engine.CBBHFCGDIC("LUA_MENU/BLOCKED_UNDER_18_NOT_IN_IGR")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsMultiplayerAllowed(arg_13_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_14_0, arg_14_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_14_1)

				return true
			end
		end,
		blockedPrompt = function(arg_15_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_16_0)
			if Engine.BECCFCBIAA("isMPNew", arg_16_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_17_0, arg_17_1)
			arg_17_0:OpenMPMainMenu(arg_17_1, {
				activeTabIndex = 0
			})
		end
	},
	[MAIN_MENU.BladeKeys.BR] = {
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
		description = function()
			if not CONDITIONS.IsMagmaEnabled() then
				return ""
			else
				return Engine.CBBHFCGDIC("MP_BR_FRONTEND/DESC_BR")
			end
		end,
		videoName = function()
			if not CONDITIONS.IsMagmaEnabled() then
				local var_20_0 = tonumber(Engine.DCJHCAFIIA())
				local var_20_1 = Dvar.CFHDGABACF("MNNTMPMOLK")

				if var_20_0 and var_20_0 > 0 and var_20_1 and var_20_1 > 0 then
					if var_20_1 <= var_20_0 then
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
		installingAction = function(arg_22_0, arg_22_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.BR) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_22_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_22_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_22_1, false)
			end
		end,
		installingPrompt = function(arg_23_0)
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
		isBlocked = function(arg_24_0)
			if not CONDITIONS.IsMagmaEnabled() then
				return true
			elseif Engine.FABABBDBA() and not Engine.GEHBEDCEC() then
				return Engine.CBBHFCGDIC("LUA_MENU/BLOCKED_UNDER_18_NOT_IN_IGR")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_24_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/ENABLE_CROSSPLAY")
			end
		end,
		blockedAction = function(arg_25_0, arg_25_1)
			if not CONDITIONS.IsMagmaEnabled() then
				return
			elseif not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_25_1) then
				local var_25_0 = {
					controllerIndex = arg_25_1,
					onAccept = function()
						Lobby.AttemptOpenBRMenu(arg_25_1, {})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_25_1, false, var_25_0)

				return true
			end
		end,
		blockedPrompt = function(arg_27_0)
			if not Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_27_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/ENABLE_CROSSPLAY")
			end
		end,
		isNew = function(arg_28_0)
			if Engine.BECCFCBIAA("isBRnotNew", arg_28_0) == 0 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_29_0, arg_29_1)
			Lobby.AttemptOpenBRMenu(arg_29_1, {})
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
					local var_31_0, var_31_1 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

					if var_31_0 == ContentProgressState.NOT_INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
					elseif var_31_0 == ContentProgressState.SUSPENDED then
						return {
							suspended = true,
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_SUSPENDED")),
							progress = var_31_1
						}
					elseif var_31_0 == ContentProgressState.HAS_PROGRESS then
						return {
							label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALLING")),
							progress = var_31_1
						}
					elseif var_31_0 == ContentProgressState.INSTALLED then
						return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REBOOT_TO_PLAY_COOP"))
					end
				elseif Engine.BAHIIBFDDG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLEASE_INSTALL_COOP"))
				end
			end
		end,
		installingAction = function(arg_32_0, arg_32_1)
			if Engine.CIEGIACHAE() then
				if Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP) == ContentProgressState.INSTALLED then
					LUI.FlowManager.RequestPopupMenu(nil, "reboot_popup", true, arg_32_1, false, nil)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_32_1, false)
				end
			elseif Engine.BAHIIBFDDG() then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_32_1, false)
			end
		end,
		installingPrompt = function(arg_33_0)
			if Engine.CIEGIACHAE() then
				local var_33_0 = Engine.ECHHDAIBD(MAIN_MENU.GameModeEnumValues.CP)

				if var_33_0 == ContentProgressState.INSTALLED then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
				elseif var_33_0 == ContentProgressState.NO_IN_QUEUE then
					return Engine.CBBHFCGDIC("LUA_MENU/RESTART_INSTALL")
				else
					return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
				end
			elseif Engine.BAHIIBFDDG() then
				return Engine.CBBHFCGDIC("LUA_MENU/START_INSTALL")
			end
		end,
		isBlocked = function(arg_34_0)
			if Engine.FABABBDBA() and not Engine.DIEEIEFCFF() then
				return Engine.CBBHFCGDIC("LUA_MENU/BLOCKED_UNDER_18_NOT_IN_IGR")
			elseif Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART_REQUIRED")
			elseif not CONDITIONS.IsCoopAllowed(arg_34_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			elseif CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		blockedAction = function(arg_35_0, arg_35_1)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(self, "restart_popmenu", false, arg_35_1)

				return true
			end
		end,
		blockedPrompt = function(arg_36_0)
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				return Engine.CBBHFCGDIC("LUA_MENU/RESTART")
			end
		end,
		isNew = function(arg_37_0)
			if Engine.BECCFCBIAA("isCPNew", arg_37_0) == 1 then
				if Engine.HDGDBCJFG() then
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INSTALL_COMPLETE"))
				else
					return ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_NOW"))
				end
			end
		end,
		action = function(arg_38_0, arg_38_1)
			arg_38_0:AttemptOpenCoopMenu(arg_38_1)
		end
	},
	[MAIN_MENU.BladeKeys.STORE] = {
		verticalButtonOffset = 0,
		gainFocusLeftSFX = "ui_blade_left_store",
		gainFocusRightSFX = "ui_blade_right_store",
		name = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"),
		videoName = function(arg_39_0)
			if not BATTLEPASS.IsOwned(arg_39_0) then
				return "main_menu_blade_battlepass"
			else
				return "main_menu_blade_store"
			end
		end,
		isBlocked = function(arg_40_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			elseif Engine.FABABBDBA() and not Engine.GEHBEDCEC() then
				return Engine.CBBHFCGDIC("LUA_MENU/BLOCKED_UNDER_18_NOT_IN_IGR")
			end
		end,
		buildCondition = function()
			return CONDITIONS.IsStoreAllowed()
		end,
		action = function(arg_42_0, arg_42_1)
			Lobby.AttemptOpenBRMenu(arg_42_1, {
				useStandaloneStore = true,
				activeTabIndex = TAB.GetIndex(TAB.MP.STORE)
			})
		end
	},
	[MAIN_MENU.BladeKeys.NG] = {
		gainFocusLeftSFX = "ui_blade_left_multiplayer",
		verticalButtonOffset = -125,
		gainFocusRightSFX = "ui_blade_right_multiplayer",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/NG_DESC"),
		isBlocked = function(arg_43_0)
			return false
		end,
		buildCondition = function(arg_44_0)
			return Dvar.IBEGCHEFE("NQPKQNMQSR")
		end,
		action = function(arg_45_0, arg_45_1)
			return
		end
	},
	[MAIN_MENU.BladeKeys.LP] = {
		description = "This is a debug option, not intended for ship...",
		gainFocusLeftSFX = "ui_blade_left_multiplayer",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_multiplayer",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_PLAY_CAPS"),
		isBlocked = function(arg_46_0)
			if CONDITIONS.InPrivatePartyAndNotHost() then
				return Engine.CBBHFCGDIC("LUA_MENU/NOT_PARTY_LEADER")
			end
		end,
		buildCondition = function(arg_47_0)
			return CONDITIONS.IsDevelopmentBuildLocalPlayAllowed()
		end,
		action = function(arg_48_0, arg_48_1)
			arg_48_0:OpenLocalPlayOptionsPopup()
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
			elseif Engine.FABABBDBA() and not Engine.GEHBEDCEC() then
				return Engine.CBBHFCGDIC("LUA_MENU/BLOCKED_UNDER_18_NOT_IN_IGR")
			end
		end,
		action = function(arg_51_0, arg_51_1)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_51_1, false, nil)
		end,
		secondaryAction = function(arg_52_0, arg_52_1)
			LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_52_1, false, {
				unskippable = false,
				video = "main_menu_warzone_mw_story_trailer",
				widescreen = true
			})
		end,
		secondaryPrompt = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TRAILERS"),
		tertiaryAction = function(arg_53_0, arg_53_1)
			if CONDITIONS.IsLaunchChunk() then
				Lobby.OpenSystemLinkMenu(arg_53_1, true)
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
	[MAIN_MENU.BladeKeys.BR] = var_0_0(MAIN_MENU.BladeData[MAIN_MENU.BladeKeys.BR], {
		videoName = "main_menu_warzone_blade_br",
		isNew = false,
		imageName = "mm_blade_br_warzone",
		name = Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"),
		description = Engine.CBBHFCGDIC("MP_BR_FRONTEND/DESC_BR")
	}),
	[MAIN_MENU.BladeKeys.STORE] = var_0_0(MAIN_MENU.BladeData[MAIN_MENU.BladeKeys.STORE], {
		name = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC"),
		videoName = function(arg_56_0)
			if not BATTLEPASS.IsOwned(arg_56_0) then
				return "main_menu_warzone_blade_battlepass"
			else
				return "main_menu_warzone_blade_store"
			end
		end,
		imageName = function(arg_57_0)
			if not BATTLEPASS.IsOwned(arg_57_0) then
				return "mm_blade_battlepass_warzone"
			else
				return "mm_blade_store_warzone"
			end
		end
	}),
	[MAIN_MENU.BladeKeys.NG] = var_0_0(MAIN_MENU.BladeData[MAIN_MENU.BladeKeys.NG], {
		videoName = "main_menu_warzone_blade_br",
		isNew = false,
		imageName = "mm_blade_br_warzone",
		name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/NG_DESC")
	})
}
MAIN_MENU.OfflineBladeData = {
	[MAIN_MENU.BladeKeys.SP] = {
		gainFocusLeftSFX = "ui_blade_left_campaign",
		verticalButtonOffset = 0,
		gainFocusRightSFX = "ui_blade_right_campaign",
		videoName = "main_menu_blade_sp",
		name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
		description = Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_DESC"),
		isBlocked = function(arg_58_0)
			if Engine.FABABBDBA() then
				return Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_BLOCKED_UNDER_18")
			elseif not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_58_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end

			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("MENU/LOCKED")
			end
		end,
		blockedAction = function(arg_59_0, arg_59_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_59_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_59_1, false, nil)
			end

			if CONDITIONS.IsLaunchChunk() then
				return
			end
		end,
		blockedPrompt = function(arg_60_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_60_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_61_0, arg_61_1)
			arg_61_0:AttemptOpenCampaign(arg_61_1)
		end
	},
	[MAIN_MENU.BladeKeys.MP] = {
		gainFocusLeftSFX = "ui_blade_left_multiplayer",
		verticalButtonOffset = -125,
		gainFocusRightSFX = "ui_blade_right_multiplayer",
		videoName = "main_menu_blade_mp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_MULTIPLAYER_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_MULTIPLAYER_DESC"),
		isBlocked = function(arg_62_0)
			if not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_62_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end
		end,
		blockedAction = function(arg_63_0, arg_63_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_63_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_63_1, false, nil)
			end
		end,
		blockedPrompt = function(arg_64_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_64_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_65_0, arg_65_1)
			arg_65_0:AttemptOpenLocalPlay(arg_65_1)
		end
	},
	[MAIN_MENU.BladeKeys.CP] = {
		gainFocusLeftSFX = "ui_blade_left_coop",
		verticalButtonOffset = 125,
		gainFocusRightSFX = "ui_blade_right_coop",
		videoName = "main_menu_blade_cp",
		name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_DESC"),
		isBlocked = function(arg_66_0)
			if not CONDITIONS.IsLaunchChunk() and not Engine.CFHBIHABCB(arg_66_0) then
				return Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_LOCKED_BLADE")
			end

			if CONDITIONS.IsLaunchChunk() then
				return Engine.CBBHFCGDIC("MENU/LOCKED")
			end
		end,
		blockedAction = function(arg_67_0, arg_67_1)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_67_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_67_1, false, nil)
			end

			if CONDITIONS.IsLaunchChunk() then
				return
			end
		end,
		blockedPrompt = function(arg_68_0)
			if CONDITIONS.ShouldDisplayUpsellPopup(arg_68_0) then
				return Engine.CBBHFCGDIC("MENU/BUY_MW")
			end
		end,
		action = function(arg_69_0, arg_69_1)
			arg_69_0:AttemptOpenCoop(arg_69_1)
		end
	}
}
MAIN_MENU.OfflineBladeDataMagma = {
	[MAIN_MENU.BladeKeys.BuyMW] = var_0_0(MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BuyMW], {
		isBlocked = CONDITIONS.IsLaunchChunk() and Engine.CBBHFCGDIC("MENU/UNAVAILABLE") or Engine.CBBHFCGDIC("PLATFORM/PLAY_ONLINE"),
		blockedPrompt = function()
			return Dvar.IBEGCHEFE("MNTMKQRSTQ") and "" or nil
		end
	}),
	[MAIN_MENU.BladeKeys.BR] = var_0_0(MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BR], {
		isBlocked = CONDITIONS.IsLaunchChunk() and Engine.CBBHFCGDIC("MENU/UNAVAILABLE") or Engine.CBBHFCGDIC("PLATFORM/PLAY_ONLINE"),
		blockedPrompt = function()
			return Dvar.IBEGCHEFE("MNTMKQRSTQ") and "" or nil
		end
	}),
	[MAIN_MENU.BladeKeys.STORE] = var_0_0(MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.STORE], {
		isBlocked = CONDITIONS.IsLaunchChunk() and Engine.CBBHFCGDIC("MENU/UNAVAILABLE") or Engine.CBBHFCGDIC("PLATFORM/PLAY_ONLINE"),
		blockedPrompt = function()
			return Dvar.IBEGCHEFE("MNTMKQRSTQ") and "" or nil
		end
	})
}

function MAIN_MENU.TitleUpdateAvailablePopup(arg_73_0, arg_73_1)
	local var_73_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/TITLE_UPDATE_AVAILABLE"),
		button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		confirmation_action = function()
			Engine.DJEDDFJEIG()
		end
	}
	local var_73_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_73_0)

	var_73_1.id = "TitleUpdateAvailablePopup"

	return var_73_1
end

MenuBuilder.registerType("TitleUpdateAvailablePopup", MAIN_MENU.TitleUpdateAvailablePopup)

function MAIN_MENU.TryShowTitleUpdateAvailablePopup()
	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("MOLLKMKKNP") and Dvar.IBEGCHEFE("RMMMKOSTS") and not Dvar.IBEGCHEFE("LSOLROSLNT") then
		if Dvar.IBEGCHEFE("LPKOMPKSPL") then
			local var_75_0 = Engine.IJEBHJIJF()

			Engine.DAGFFDGFII("xstopprivateparty 0 1", var_75_0)

			if not LUI.FlowManager.IsMenuOnTop("MainMenu") then
				LUI.FlowManager.RequestRestoreMenu("MainMenu", true, var_75_0)
			end
		end

		LUI.FlowManager.RequestPopupMenu(nil, "TitleUpdateAvailablePopup", false, nil, false, nil)
		Dvar.DHEGHJJJHI("LSOLROSLNT", true)

		return true
	end

	return false
end

function MAIN_MENU.RegisterTitleUpdateAvailableEventHandler()
	local var_76_0 = Engine.DBFFAEEFGJ()

	assert(var_76_0)
	var_76_0:registerEventHandler("title_update_available", MAIN_MENU.TryShowTitleUpdateAvailablePopup)
end

local function var_0_1(arg_77_0, arg_77_1)
	local var_77_0 = 0
	local var_77_1

	for iter_77_0 = 1, #arg_77_0 do
		if Engine.BAJHDFAJJF(arg_77_0[iter_77_0].index) == false then
			var_77_0 = var_77_0 + 1
			var_77_1 = arg_77_0[iter_77_0].missingMessage
		end
	end

	if var_77_0 > 1 then
		var_77_1 = arg_77_1
	end

	return var_77_1
end

function MAIN_MENU.CheckForMissingMPDataPacks()
	return var_0_1(CoD.MP_PACKS, Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP"))
end

function MAIN_MENU.CheckForMissingSPDataPacks()
	return var_0_1(CoD.SP_PACKS, Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_SP"))
end

function MAIN_MENU.CheckForMissingCPDataPacks()
	return var_0_1(CoD.CP_PACKS, Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP"))
end

function MAIN_MENU.CleanMagmaBladeNames()
	if not Dvar.IBEGCHEFE("blm_messaging") then
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BuyMW].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BuyMW].description = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BR].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.BR].description = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.NG].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.NG].description = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.STORE].name = nil
		MAIN_MENU.BladeDataMagma[MAIN_MENU.BladeKeys.STORE].description = nil
	end
end
