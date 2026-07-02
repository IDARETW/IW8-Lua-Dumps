WZ_MAIN_MENU = WZ_MAIN_MENU or {}
WZ_MAIN_MENU.BladeKeys = {
	MW = 3,
	VG = 4,
	WZ = 2,
	BO = 1
}

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1 = Engine.ECHHDAIBD(arg_1_1)

	if var_1_0 == ContentProgressState.INSTALLED then
		LUI.FlowManager.RequestAddMenu(arg_1_0, true, arg_1_2, false, nil, false)
	else
		LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_1_2, false)
	end
end

local function var_0_1(arg_2_0)
	return (Friends.FBFFEFEGB(arg_2_0, 0, 0, 0, false, false))
end

local function var_0_2()
	local var_3_0 = {}

	if Dvar.IBEGCHEFE("NKSSSTTRPN") then
		local var_3_1 = {
			videoName = "main_menu_blade_ch2_cw_upsell",
			name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
			action = function(arg_4_0, arg_4_1)
				arg_4_0:registerEventHandler("preorder_entitlement_check_complete", function(arg_5_0, arg_5_1)
					if arg_5_1.value then
						Engine.EHEGFJJFB()
					else
						LUI.FlowManager.RequestPopupMenu(self, "StoreGameUpsellPopup", true, arg_4_1, false, {
							isZeus = true
						})
					end
				end)
				Engine.CHFIIBJFGE(arg_4_1)
			end
		}

		table.insert(var_3_0, var_3_1)
	elseif Dvar.IBEGCHEFE("wz_blade_cross_launching_deep_link_enabled") then
		local var_3_2 = {
			videoName = "main_menu_blade_ch2_cw_upsell",
			name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA"),
			action = function(arg_6_0, arg_6_1)
				LUI.FlowManager.RequestPopupMenu(nil, "party_crosslaunching_deeplink", false, arg_6_1, false, {
					gameMode = LUI.DEEP_LINK_GAME_MODE.ARENA
				})
			end
		}

		table.insert(var_3_0, var_3_2)

		local var_3_3 = {
			videoName = "main_menu_blade_ch2_cw_cp",
			name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_CP"),
			action = function(arg_7_0, arg_7_1)
				LUI.FlowManager.RequestPopupMenu(nil, "party_crosslaunching_deeplink", false, arg_7_1, false, {
					gameMode = LUI.DEEP_LINK_GAME_MODE.CP
				})
			end
		}

		table.insert(var_3_0, var_3_3)

		local var_3_4 = {
			videoName = "main_menu_blade_ch2_cw_mp",
			name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_MP"),
			action = function(arg_8_0, arg_8_1)
				LUI.FlowManager.RequestPopupMenu(nil, "party_crosslaunching_deeplink", false, arg_8_1, false, {
					gameMode = LUI.DEEP_LINK_GAME_MODE.MP
				})
			end
		}

		table.insert(var_3_0, var_3_4)

		local var_3_5 = {
			videoName = "main_menu_blade_ch2_cw_zm",
			name = Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"),
			action = function(arg_9_0, arg_9_1)
				LUI.FlowManager.RequestPopupMenu(nil, "party_crosslaunching_deeplink", false, arg_9_1, false, {
					gameMode = LUI.DEEP_LINK_GAME_MODE.ZM
				})
			end
		}

		table.insert(var_3_0, var_3_5)
	else
		local var_3_6 = {
			videoName = "main_menu_blade_ch2_cw_upsell",
			name = Engine.CBBHFCGDIC("LUA_MENU/NG_CAPS"),
			action = function(arg_10_0, arg_10_1)
				LUI.FlowManager.RequestPopupMenu(nil, "party_crosslaunching", false, arg_10_1, false, {})
			end
		}

		table.insert(var_3_0, var_3_6)
	end

	return var_3_0
end

WZ_MAIN_MENU.BladeData = {
	[WZ_MAIN_MENU.BladeKeys.BO] = {
		name = "WIP - BO",
		imageName = "logo_cod_store",
		unFocusedAnim = "UnFocused",
		focusedAnim = "Focused",
		id = "WZ_MAIN_MENU.BladeKeys.BO",
		bladeKey = WZ_MAIN_MENU.BladeKeys.BO,
		liveEventLocation = CRM.locations.NG_LIVE_EVENT,
		getFriendsCount = function(arg_11_0, arg_11_1)
			return var_0_1(arg_11_1).onlineNextTitleCount
		end,
		buttonsData = var_0_2()
	},
	[WZ_MAIN_MENU.BladeKeys.WZ] = {
		name = "WIP - WZ",
		imageName = "logo_cod_wz",
		unFocusedAnim = "UnFocused",
		focusedAnim = "Focused",
		id = "WZ_MAIN_MENU.BladeKeys.WZ",
		bladeKey = WZ_MAIN_MENU.BladeKeys.WZ,
		liveEventLocation = CRM.locations.WZ_LIVE_EVENT,
		getFriendsCount = function(arg_12_0, arg_12_1)
			return var_0_1(arg_12_1).onlineWarzoneCount
		end,
		buttonsData = {
			{
				videoName = "main_menu_blade_ch2_wz",
				name = Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"),
				action = function(arg_13_0, arg_13_1)
					Lobby.AttemptOpenBRMenu(arg_13_1, {})
				end
			}
		}
	},
	[WZ_MAIN_MENU.BladeKeys.MW] = {
		name = "WIP - MW",
		imageName = "logo_cod_mw",
		unFocusedAnim = "UnFocused",
		focusedAnim = "Focused",
		id = "WZ_MAIN_MENU.BladeKeys.MW",
		bladeKey = WZ_MAIN_MENU.BladeKeys.MW,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		getFriendsCount = function(arg_14_0, arg_14_1)
			return var_0_1(arg_14_1).onlineMWCount
		end,
		buttonsData = {
			{
				videoName = "main_menu_blade_ch2_mw_sp",
				name = Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"),
				action = function(arg_15_0, arg_15_1)
					var_0_0("CampaignMenu", MAIN_MENU.GameModeEnumValues.SP, arg_15_1)
				end
			},
			{
				videoName = "main_menu_blade_ch2_mw_mp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_MULTIPLAYER_CAPS"),
				action = function(arg_16_0, arg_16_1)
					var_0_0("MPMainMenu", MAIN_MENU.GameModeEnumValues.MP, arg_16_1)
				end
			},
			{
				videoName = "main_menu_blade_ch2_mw_cp",
				name = Engine.CBBHFCGDIC("LUA_MENU/LOCAL_COOP_CAPS"),
				action = function(arg_17_0, arg_17_1)
					var_0_0("CPMainMenu", MAIN_MENU.GameModeEnumValues.CP, arg_17_1)
				end
			}
		}
	}
}
WZ_MAIN_MENU.BladeDataMagma = {
	[WZ_MAIN_MENU.BladeKeys.BO] = {
		name = "WIP - BO",
		imageName = "logo_cod_store",
		unFocusedAnim = "UnFocused",
		focusedAnim = "Focused",
		id = "WZ_MAIN_MENU.BladeKeys.BO",
		bladeKey = WZ_MAIN_MENU.BladeKeys.BO,
		liveEventLocation = CRM.locations.NG_LIVE_EVENT,
		getFriendsCount = function(arg_18_0, arg_18_1)
			return var_0_1(arg_18_1).onlineNextTitleCount
		end,
		buttonsData = var_0_2()
	},
	[WZ_MAIN_MENU.BladeKeys.WZ] = {
		name = "WIP - WZ",
		imageName = "logo_cod_wz",
		unFocusedAnim = "UnFocused",
		focusedAnim = "Focused",
		id = "WZ_MAIN_MENU.BladeKeys.WZ",
		bladeKey = WZ_MAIN_MENU.BladeKeys.WZ,
		liveEventLocation = CRM.locations.WZ_LIVE_EVENT,
		getFriendsCount = function(arg_19_0, arg_19_1)
			return var_0_1(arg_19_1).onlineWarzoneCount
		end,
		buttonsData = {
			{
				videoName = "main_menu_blade_ch2_wz",
				name = Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"),
				action = function(arg_20_0, arg_20_1)
					Lobby.AttemptOpenBRMenu(arg_20_1, {})
				end
			}
		}
	},
	[WZ_MAIN_MENU.BladeKeys.MW] = {
		name = "WIP - MW",
		imageName = "logo_cod_mw",
		unFocusedAnim = "UnFocusedUnowned",
		focusedAnim = "FocusedUnowned",
		id = "WZ_MAIN_MENU.BladeKeys.MW",
		bladeKey = WZ_MAIN_MENU.BladeKeys.MW,
		liveEventLocation = CRM.locations.MW_LIVE_EVENT,
		getFriendsCount = function(arg_21_0, arg_21_1)
			return var_0_1(arg_21_1).onlineMWCount
		end,
		buttonsData = {
			{
				buttonOverAnimOverride = "ButtonPurchase",
				videoName = "main_menu_blade_ch2_mw_upsell",
				name = Engine.CBBHFCGDIC("MENU/BUY_MW"),
				action = function(arg_22_0, arg_22_1)
					LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_22_1, false, nil)
				end
			}
		}
	}
}
