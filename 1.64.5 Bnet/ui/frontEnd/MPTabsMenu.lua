module(..., package.seeall)

local var_0_0 = {
	NonWeaponTypes = {
		LOOT.itemTypes.STREAK,
		LOOT.itemTypes.WATCH,
		LOOT.itemTypes.SUPER,
		LOOT.itemTypes.VEHICLE_CAMO,
		LOOT.itemTypes.VEHICLE_HORN,
		LOOT.itemTypes.VEHICLE_TRACK
	},
	OperatorTypes = {
		LOOT.itemTypes.OPERATOR,
		LOOT.itemTypes.OPERATOR_SKIN,
		LOOT.itemTypes.OPERATOR_TAUNT,
		LOOT.itemTypes.OPERATOR_EXECUTION
	},
	BarracksTypes = {
		LOOT.itemTypes.PLAYERCARD,
		LOOT.itemTypes.EMBLEM,
		LOOT.itemTypes.SPRAYS,
		LOOT.itemTypes.GESTURES,
		LOOT.itemTypes.FRAME,
		LOOT.itemTypes.TITLE
	}
}

local function var_0_1(arg_1_0)
	return arg_1_0 == "MPOperatorMenu" or CONDITIONS.IsWZWipOperatorFlowEnabled() and arg_1_0 == "WZOperatorSelect"
end

local function var_0_2(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0, arg_3_1)
		local var_3_0 = false

		for iter_3_0, iter_3_1 in pairs(arg_3_1) do
			if LOOT.IsCategoryNew(arg_3_0, iter_3_1) then
				var_3_0 = true

				break
			end
		end

		return var_3_0
	end

	local function var_2_1(arg_4_0, arg_4_1)
		local var_4_0 = arg_2_0:GetTabIndexByWidgetName(arg_4_0)
		local var_4_1 = var_4_0 and arg_2_0.Tabs:GetTabAtIndex(var_4_0)

		if var_4_1 and var_4_1.SetBreadcrumb then
			var_4_1:SetBreadcrumb(arg_4_1)
		end
	end

	local var_2_2 = var_2_0(arg_2_1, var_0_0.NonWeaponTypes)
	local var_2_3 = PROGRESSION.AreCustomLoadoutsUnlocked(arg_2_1) and LOOT.LoadoutHasNewLoot(arg_2_1)
	local var_2_4 = #WEAPON.GetNewWeaponIDs(arg_2_1, {
		getBaseWeapon = false
	}) > 0

	arg_2_0.isWeaponTabNew = var_2_2 or var_2_3 or var_2_4
	arg_2_0.isOperatorTypeNew = var_2_0(arg_2_1, var_0_0.OperatorTypes)
	arg_2_0.isBarracksNew = var_2_0(arg_2_1, var_0_0.BarracksTypes)
	arg_2_0.isBattlePassNew = BATTLEPASS.HasNewItems(arg_2_1)
	arg_2_0.storeHasNewItem, arg_2_0._storeHasFreeItem, arg_2_0.limitedTimeItem = STORE.HasNewAndFreeAndLimitedTimeItems(arg_2_1)
	arg_2_0.storeSaleTimer = STORE.GetSaleTimer(arg_2_1)

	var_2_1("MPWeaponMenu", arg_2_0.isWeaponTabNew)

	local var_2_5 = CONDITIONS.IsWZWipOperatorFlowEnabled() and "WZOperatorSelect" or "MPOperatorMenu"

	var_2_1(var_2_5, arg_2_0.isOperatorTypeNew)
	var_2_1("MPBarracksMenu", arg_2_0.isBarracksNew)
	var_2_1("BattlePassMenu", arg_2_0.isBattlePassNew)

	local var_2_6 = arg_2_0:GetTabIndexByWidgetName("MPStoreMenu")
	local var_2_7 = var_2_6 and arg_2_0.Tabs:GetTabAtIndex(var_2_6)

	if var_2_7 and var_2_7.SetBreadcrumb then
		var_2_7:SetBreadcrumb(arg_2_0.storeHasNewItem)

		if CONDITIONS.IsCortezPreOrderBannerActive() and (STORE.IsCortezOwned(arg_2_1) == false or STORE.IsCortezUpgradeToUltimateExistentAndNotOwned(arg_2_1)) then
			var_2_7:SetCortezBanner(arg_2_0)
		elseif STORE.IsVanguardAvailable(arg_2_1) and not STORE.IsVanguardOwned(arg_2_1) and CONDITIONS.IsVanguardPreOrderBannerActive() then
			var_2_7:SetVGBanner(arg_2_0)
		elseif CONDITIONS.IsBattlePassTopperActive() and not BATTLEPASS.IsOwned(arg_2_1) then
			var_2_7:SetBundleTopperBanner(arg_2_0)
		elseif arg_2_0._storeHasFreeItem then
			var_2_7:SetFreeBanner(arg_2_0._storeHasFreeItem)
		elseif arg_2_0.storeSaleTimer and #arg_2_0.storeSaleTimer > 0 and tonumber(arg_2_0.storeSaleTimer) > Engine.DEIDGHDBHD() and STORE.GetHighestDiscountPercentage(arg_2_1) > 0 then
			var_2_7:SetSaleBanner()
		elseif arg_2_0.limitedTimeItem then
			var_2_7:SetLimitedTimeBanner(arg_2_0.limitedTimeItem)
		elseif Dvar.IBEGCHEFE("LMMPLKNTMP") and CONDITIONS.IsCortezPremiumPlayer(arg_2_1) == false and STORE.IsCortezOwned(arg_2_1) == false then
			if #STORE.GetCortezCategoryData(arg_2_1) > 0 then
				var_2_7:SetCortezBanner(arg_2_0)
			end
		elseif CONDITIONS.IsStoreRefreshTimerEnabled() then
			var_2_7:SetStoreTabRefreshTimer(arg_2_0)
		elseif Dvar.IBEGCHEFE("TNMTRNOQT") and CONDITIONS.IsT9PremiumPlayer(arg_2_1) == false and STORE.IsZeusOwned(arg_2_1) == false and #STORE.GetZeusCategoryData(arg_2_1) > 0 then
			var_2_7:SetZeusBanner(arg_2_0)
		end
	end

	local var_2_8 = arg_2_0:GetTabIndexByWidgetName("BattlePassMenu")
	local var_2_9 = var_2_8 and arg_2_0.Tabs:GetTabAtIndex(var_2_8)

	if var_2_9 then
		local var_2_10 = BATTLEPASS.IsOwned(arg_2_1)

		if BATTLEPASS.IsTierSkipGiftActive(arg_2_1) and not var_2_10 then
			local var_2_11 = tonumber(BATTLEPASS.GetTierSkipGiftTimer())

			var_2_9:SetPromoBanner(var_2_11, false)
		elseif CONDITIONS.IsTierSaleEnabled() and var_2_10 then
			local var_2_12 = Dvar.DHEEJCCJBH("MQTOPKPMRS")

			if var_2_12 and var_2_12 ~= "" then
				var_2_9:SetPromoBanner(var_2_12, true)
			end
		elseif Dvar.IBEGCHEFE("LNQTKTLKOS") then
			var_2_9:SetVGBanner(arg_2_0)
		else
			var_2_9:SetSeasonBanner()
		end
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	local var_5_0 = Lobby.BCBBBABFFB()

	if var_5_0 == CoD.PartyPrivacySetting.CLOSED then
		arg_5_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_CLOSED"))
	elseif var_5_0 == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		arg_5_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS"))
	elseif var_5_0 == CoD.PartyPrivacySetting.INVITE_ONLY then
		arg_5_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_INVITE_ONLY"))
	else
		arg_5_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_PUBLIC"))
	end
end

local function var_0_4(arg_6_0, arg_6_1)
	if arg_6_1 ~= nil then
		arg_6_0._backButtonHandlerSet = true

		if not arg_6_0.bindButton then
			arg_6_0.bindButton = LUI.UIBindButton.new()
			arg_6_0.bindButton.id = "selfBindButton"

			arg_6_0:addElement(arg_6_0.bindButton)
		end

		arg_6_0.bindButton:registerEventHandler("button_secondary", function(arg_7_0, arg_7_1)
			local var_7_0 = arg_6_0.activeTabWidget
			local var_7_1 = true

			if var_7_0 and var_7_0.BackButtonOverride then
				var_7_1 = var_7_0.BackButtonOverride(arg_7_0, arg_7_1)
			end

			if var_7_1 then
				arg_6_1(arg_7_0, arg_7_1)
			end
		end)
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	return arg_8_1 == "MPWeaponMenu" or var_0_1(arg_8_1) or arg_8_1 == "MPBarracksMenu"
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1 and arg_9_2 then
		arg_9_0.PlayerText:setText(Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_9_2)))

		local var_9_0 = 6 * _1080p
		local var_9_1 = LAYOUT.GetTextWidth(arg_9_0.PlayerText) + var_9_0
		local var_9_2 = arg_9_0.PlayerText:GetCurrentAnchorsAndPositions()

		arg_9_0.PlayerTextBacker:SetLeft(var_9_2.right - var_9_1)
		arg_9_0.PlayerTextTexture:SetLeft(var_9_2.right - var_9_1)
		ACTIONS.AnimateSequence(arg_9_0, "PlayerTextOn")
	else
		ACTIONS.AnimateSequence(arg_9_0, "PlayerTextOff")
	end
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local function var_10_0(arg_11_0)
		if arg_11_0 == "SeasonalEventMenu" then
			arg_10_0._challengesPromptInWidget = false

			return true
		elseif arg_10_0._challengesPromptInWidget then
			arg_10_0:RemoveButtonPrompt({
				button_ref = "button_alt1",
				helper_text = "",
				container = arg_10_0._challengesPrompt
			})

			arg_10_0._challengesPromptInWidget = false

			return true
		end
	end

	if arg_10_1 == "MPPlayMenu" or arg_10_1 == "BRPlayMenu" or arg_10_1 == "CPPlayMenu" or arg_10_1 == "MPMainMenu" then
		local var_10_1 = arg_10_0.activeTabWidget
		local var_10_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count"):GetValue(arg_10_3)

		arg_10_0._challengesPrompt = nil

		if var_10_1.Challenges then
			arg_10_0._challengesPrompt = var_10_1.Challenges:GetPromptContainer()
		end

		if var_10_2 and var_10_2 > 1 then
			var_10_0(arg_10_1)
			arg_10_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT")
			})

			if Engine.IDHBHGDFE() then
				arg_10_0.bindButton:addEventHandler("button_left_trigger", function(arg_12_0, arg_12_1)
					if LUI.IsLastInputKeyboardMouse(arg_12_1.controller) then
						LUI.FlowManager.RequestPopupMenu(arg_10_0, "LeavePrivatePartyConfirmPopup", true, arg_12_1.controller, false, {
							moveUI = false,
							menu = arg_10_0
						})
					end
				end)
				arg_10_0:AddButtonPrompt({
					kbm_only = true,
					priority = 4,
					side = "left",
					button_ref = "button_left_trigger",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_PARTY")
				})
			end
		elseif arg_10_0._challengesPrompt then
			arg_10_0:AddButtonPrompt({
				replaceTop = true,
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT"),
				container = arg_10_0._challengesPrompt
			})

			arg_10_0._challengesPromptInWidget = true
		end

		arg_10_0._xpNotificationPrompt = (CONDITIONS.IsMagmaGameMode() and var_10_1.WZDoubleXPNotifications or var_10_1.DoubleXPNotifications):GetPromptContainer()

		arg_10_0:AddButtonPrompt({
			replaceTop = true,
			button_ref = "button_l3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TOKENS"),
			container = arg_10_0._xpNotificationPrompt,
			containerAlignment = LUI.Alignment.Right
		})

		if var_10_1.UpdateChallengesVisibility then
			var_10_1:UpdateChallengesVisibility(var_10_2 <= 1, arg_10_2)
		end

		if var_10_1.UpdateSquadButtonLockStatus then
			var_10_1:UpdateSquadButtonLockStatus(arg_10_3)
		end

		arg_10_0.bindButton:registerEventHandler("button_alt1", function(arg_13_0, arg_13_1)
			if not Engine.DBAEJAHFGJ(arg_13_1.controller) then
				if CONDITIONS.IsChallengeTabEnabled() then
					Challenge.FocusTab(arg_13_0, arg_13_1)
				else
					LUI.FlowManager.RequestAddMenu("BarracksChallenges", true, arg_13_1.controller, false, {}, true)
				end
			else
				LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_13_1.controller, false)
			end
		end)
		Lobby.DisplayNvidiaHighlightsButton(arg_10_0, "MW_Highlights")

		if CONDITIONS.IsVanguardOwnershipDisplayEnabled() and var_10_1.XPBoost ~= nil then
			arg_10_0._xpBoostNotificationPrompt = var_10_1.XPBoost:GetPromptContainer()

			arg_10_0:AddButtonPrompt({
				replaceTop = true,
				button_ref = "button_r3",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_STORE"),
				container = arg_10_0._xpBoostNotificationPrompt
			})
		end
	elseif arg_10_1 ~= "LobbyFlowWidget" then
		if not var_10_0(arg_10_1) then
			arg_10_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				helper_text = ""
			})
		end

		if arg_10_0._xpNotificationPrompt and not var_0_1(arg_10_1) then
			arg_10_0:RemoveButtonPrompt({
				button_ref = "button_l3",
				helper_text = "",
				container = arg_10_0._xpNotificationPrompt,
				containerAlignment = LUI.Alignment.Right
			})

			arg_10_0._xpNotificationPrompt = nil
		end

		if arg_10_0._xpBoostNotificationPrompt then
			arg_10_0:RemoveButtonPrompt({
				button_ref = "button_r3",
				helper_text = "",
				container = arg_10_0._xpBoostNotificationPrompt
			})

			arg_10_0._xpBoostNotificationPrompt = nil
		end

		arg_10_0.bindButton:registerEventHandler("button_alt1", nil)
	end

	if (arg_10_1 == "MPStoreMenu" or arg_10_1 == "BattlePassMenu") and Dvar.IBEGCHEFE("OLNMSNSTKS") then
		arg_10_0:AddButtonPrompt({
			side = "left",
			button_ref = "button_l3",
			priority = 4,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPORT_A_CREATOR")
		})

		if arg_10_1 == "MPStoreMenu" and CONDITIONS.IsMagmaGameMode() then
			arg_10_0:AddButtonPrompt({
				side = "left",
				priority = 4,
				replaceTop = true,
				button_ref = "button_left_trigger",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/BUNDLE_LOCKER")
			})
		end
	elseif arg_10_1 ~= "BRPlayMenu" and arg_10_1 ~= "MPPlayMenu" and not var_0_1(arg_10_1) then
		arg_10_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_l3",
			helper_text = ""
		})
	end

	local var_10_3 = arg_10_1 == "BattlePassMenu"
	local var_10_4 = CONDITIONS.IsGiftingEnabled() and arg_10_1 == "BattlePassMenu" and BATTLEPASS.IsOwned(arg_10_3)

	if var_10_3 then
		arg_10_0:AddButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 5,
			helper_text = Engine.CBBHFCGDIC("BATTLEPASS/MORE_INFO")
		})

		if var_10_4 then
			arg_10_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_alt2",
				priority = 6,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_BATTLEPASS")
			})
		end
	elseif arg_10_1 ~= "SeasonalEventMenu" and not var_0_1(arg_10_1) and not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		arg_10_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			helper_text = ""
		})
	end

	local var_10_5 = arg_10_0.Tabs:GetCurrentTab().index + 1

	LOOT.UpdateClearBreadcrumbButtonHelpers(arg_10_0, arg_10_0._tabsData[var_10_5])

	if arg_10_1 == "LobbyFlowWidget" or arg_10_1 == "CPPlayMenu" or arg_10_1 == "CPPublicLobbyPlayMenu" then
		local var_10_6 = arg_10_0.activeTabWidget

		arg_10_0._xpNotificationPrompt = (CONDITIONS.IsMagmaGameMode() and var_10_6.WZDoubleXPNotifications and var_10_6.WZDoubleXPNotifications or var_10_6.DoubleXPNotifications):GetPromptContainer()

		arg_10_0:AddButtonPrompt({
			button_ref = "button_l3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TOKENS"),
			container = arg_10_0._xpNotificationPrompt,
			containerAlignment = LUI.Alignment.Right
		})
		arg_10_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			helper_text = ""
		})

		if Lobby.GetCurrentNumLobbyMembers(arg_10_3) > 1 and Lobby.BBDICGHE() then
			arg_10_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
			})

			arg_10_0._allPlayersMuted = false

			arg_10_0.bindButton:addEventHandler("button_right_stick", function(arg_14_0, arg_14_1)
				arg_10_0._allPlayersMuted = not arg_10_0._allPlayersMuted

				local var_14_0 = arg_10_0._allPlayersMuted and "LUA_MENU/UNMUTE_ALL" or "LUA_MENU/MUTE_ALL"

				arg_10_0:AddButtonPrompt({
					side = "left",
					priority = 3,
					replaceTop = true,
					button_ref = "button_r3",
					helper_text = Engine.CBBHFCGDIC(var_14_0)
				})
				arg_10_0:dispatchEventToAllChildren({
					name = "lobby_mute_event",
					controllerIndex = arg_10_3
				})
				Lobby.BFGAACEHBH(arg_14_1.controller, arg_10_0._allPlayersMuted)

				return true
			end)
		else
			arg_10_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				helper_text = ""
			})
		end
	end

	if arg_10_1 == "MPStoreMenu" and arg_10_0._xpNotificationPrompt then
		arg_10_0:RemoveButtonPrompt({
			button_ref = "button_l3",
			helper_text = "",
			container = arg_10_0._xpNotificationPrompt
		})

		arg_10_0._xpNotificationPrompt = nil
	end
end

local function var_0_8(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.Tabs:HideTabs()

	if Engine.CFHBIHABCB(arg_15_1) then
		arg_15_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	else
		arg_15_0.MenuTitle:SetWarzoneTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	end

	if arg_15_0.PartyWidget then
		arg_15_0.PartyWidget:closeTree()

		arg_15_0.PartyWidget = nil
	end
end

local function var_0_9(arg_16_0, arg_16_1)
	return arg_16_0._tabIndexMap[arg_16_1]
end

local function var_0_10(arg_17_0)
	return arg_17_0 == "LobbyFlowWidget" or arg_17_0 == "CPPlayMenu" or arg_17_0 == "CPPublicLobbyPlayMenu" or arg_17_0 == "MPPlayMenu" or arg_17_0 == "BRPlayMenu"
end

local function var_0_11(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = LUI.FlowManager.GetScopedData(arg_18_0)
	local var_18_1 = arg_18_2 and arg_18_2.firstTabWidget
	local var_18_2

	if var_18_1 == nil then
		if CONDITIONS.IsMagmaGameMode() then
			var_18_1 = "BRPlayMenu"
		elseif CONDITIONS.IsCoreMultiplayer() then
			var_18_1 = "MPPlayMenu"
		elseif CONDITIONS.IsThirdGameMode() then
			var_18_1 = "CPPlayMenu"
		end
	end

	arg_18_0._isMenuInitialized = false

	local var_18_3 = {}
	local var_18_4 = {}

	var_18_3[#var_18_3 + 1] = {
		isPlayTab = true,
		canClearNewIndicators = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PLAY"),
		menuName = var_18_1
	}
	var_18_4[var_18_1] = #var_18_3

	if var_18_1 == "TournamentLobbyFlow" then
		arg_18_0.MenuTitle:SetAlpha(0)
	end

	if CONDITIONS.IsSeasonalEventTabActive() and SEASONAL_EVENT.GetCurrentSeasonalEventTabName() ~= nil then
		var_18_3[#var_18_3 + 1] = {
			isEventTab = true,
			canClearNewIndicators = true,
			menuName = "SeasonalEventMenu",
			name = Engine.CBBHFCGDIC(SEASONAL_EVENT.GetCurrentSeasonalEventTabName())
		}
		var_18_4.SeasonalEventMenu = #var_18_3
	end

	var_18_3[#var_18_3 + 1] = {
		isWeaponsTab = true,
		menuName = "MPWeaponMenu",
		hasRestrictionIcon = true,
		canClearNewIndicators = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/WEAPONS"),
		disabled = not Dvar.IBEGCHEFE("LORQPPPMT")
	}
	var_18_4.MPWeaponMenu = #var_18_3

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_18_3[#var_18_3 + 1] = {
			menuName = "WZOperatorSelect",
			isWZOperatorTab = true,
			canClearNewIndicators = true,
			isOperatorTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/OPERATORS"),
			disabled = not Dvar.IBEGCHEFE("LSPTSOQPPT")
		}
		var_18_4.WZOperatorSelect = #var_18_3
	else
		var_18_3[#var_18_3 + 1] = {
			menuName = "MPOperatorMenu",
			canClearNewIndicators = true,
			isOperatorTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/OPERATORS"),
			disabled = not Dvar.IBEGCHEFE("LSPTSOQPPT")
		}
		var_18_4.MPOperatorMenu = #var_18_3
	end

	if CONDITIONS.IsChallengeTabEnabled() then
		var_18_3[#var_18_3 + 1] = {
			menuName = "ChallengeMenu",
			canClearNewIndicators = false,
			name = Engine.CBBHFCGDIC("MENU/CHALLENGES")
		}
		var_18_4.ChallengeMenu = #var_18_3
	end

	if not CONDITIONS.IsWeGameGovBanned() then
		var_18_3[#var_18_3 + 1] = {
			isBarracksTab = true,
			canClearNewIndicators = true,
			menuName = "MPBarracksMenu",
			name = Engine.CBBHFCGDIC("LUA_MENU/BARRACKS"),
			disabled = not Dvar.IBEGCHEFE("NPKSLQQPMP")
		}
		var_18_4.MPBarracksMenu = #var_18_3
	end

	if CONDITIONS.IsBattlePassEnabled() then
		var_18_3[#var_18_3 + 1] = {
			isStoreTab = true,
			menuName = "BattlePassMenu",
			canClearNewIndicators = false,
			isBattlePassTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS")
		}
		var_18_4.BattlePassMenu = #var_18_3
		var_18_2 = #var_18_3
	end

	if CONDITIONS.IsStoreAllowed() then
		var_18_3[#var_18_3 + 1] = {
			isStoreTab = true,
			canClearNewIndicators = false,
			menuName = "MPStoreMenu",
			name = Engine.CBBHFCGDIC("LUA_MENU/STORE")
		}
		var_18_4.MPStoreMenu = #var_18_3
	end

	local var_18_5 = Dvar.IBEGCHEFE("NSNRTPNQPN") and CONDITIONS.IsBattlePassEnabled()
	local var_18_6 = Dvar.CFHDGABACF("NTSLOQPLNT")

	if var_18_5 and var_18_6 < #var_18_3 + 1 and var_18_6 > 1 then
		local var_18_7 = {}

		for iter_18_0 = 1, #var_18_3 do
			var_18_7[iter_18_0] = var_18_3[iter_18_0]

			if var_18_6 == #var_18_3 then
				if iter_18_0 == var_18_2 then
					var_18_3[iter_18_0] = var_18_3[iter_18_0 + 1]
				elseif iter_18_0 == var_18_6 then
					var_18_3[iter_18_0] = var_18_7[var_18_2]
				end
			elseif iter_18_0 == var_18_6 then
				var_18_3[iter_18_0] = var_18_3[var_18_2]
			elseif iter_18_0 == var_18_2 + 1 then
				var_18_3[iter_18_0] = var_18_7[iter_18_0]
			elseif var_18_6 < iter_18_0 then
				var_18_3[iter_18_0] = var_18_7[iter_18_0 - 1]
			end

			var_18_4[var_18_3[iter_18_0].menuName] = iter_18_0
		end
	end

	arg_18_0:addEventHandler("store_menu_error", function(arg_19_0, arg_19_1)
		local var_19_0 = LUI.IsLastInputGamepad(arg_18_1) and FocusType.Gamepad or FocusType.MouseOver

		arg_18_0.Tabs:FocusTab(arg_18_1, 0, var_19_0)
	end)

	local var_18_8 = {}

	for iter_18_1, iter_18_2 in ipairs(var_18_3) do
		table.insert(var_18_8, {
			name = iter_18_2.name,
			disabled = iter_18_2.disabled,
			hasDefaultFocus = iter_18_1 - 1 == var_18_0.activeTabIndex,
			focusFunction = function(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
				local var_20_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
				local var_20_1 = var_20_0:GetValue(arg_20_1)

				if var_0_5(arg_18_0, iter_18_2.menuName) then
					arg_20_1 = var_20_1
				end

				if Engine.JEDFGECDJ() > 1 and (iter_18_2.menuName == "BattlePassMenu" or iter_18_2.menuName == "MPStoreMenu") then
					if not var_18_0.tabsInitialized or arg_20_3 ~= FocusType.MenuFlow then
						var_20_0:SetValue(arg_20_1, arg_20_1)
					else
						arg_20_1 = var_20_1
					end
				end

				if iter_18_2.menuName == "MPStoreMenu" and Engine.DBAEJAHFGJ(arg_20_1) then
					arg_18_0.Tabs:SetCurrentTabIndex(var_18_0.activeTabIndex)
					LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_20_1, false)

					return
				end

				if var_18_0.activeTabIndex and arg_20_2 == var_18_0.activeTabIndex and arg_18_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_18_0, var_18_0.activeTabIndex, "activeTabWidget", arg_20_2, arg_20_3, iter_18_2.menuName, {
					buildPriority = -1,
					controllerIndex = arg_20_1
				})

				var_18_0.activeTabIndex = arg_20_2

				arg_18_0:UpdateJoinableStatus(arg_20_1)

				if arg_18_0._backButtonHandlerSet and arg_20_2 ~= 0 then
					local var_20_2 = arg_18_0.activeTabWidget

					if var_20_2 and not var_20_2.BackButtonOverride then
						function var_20_2.BackButtonOverride(arg_21_0, arg_21_1)
							local var_21_0 = arg_21_1.qualifier ~= "keyboard" and arg_21_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

							arg_18_0.Tabs:FocusTab(arg_20_1, 0, var_21_0)

							return false
						end
					end
				end

				arg_18_0.Nat:SetAlpha(0)
				arg_18_0.JoinableStatus:SetAlpha(0)

				if iter_18_2.menuName == "MPPlayMenu" or iter_18_2.menuName == "BRPlayMenu" then
					arg_18_0.Nat:SetAlpha(1)
					arg_18_0.JoinableStatus:SetAlpha(1)
				end

				if iter_18_2.menuName == "TournamentLobbyFlow" then
					-- block empty
				end

				local function var_20_3(arg_22_0)
					if not arg_22_0._isMenuInitialized then
						return
					end

					arg_18_0:GetCurrentMenu().signoutSplitscreen = iter_18_2.menuName == var_18_1

					if var_0_5(arg_22_0, iter_18_2.menuName) and Engine.JEDFGECDJ() > 1 then
						arg_22_0:AddButtonPrompt({
							side = "left",
							button_ref = "button_left_trigger",
							priority = 3,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", Engine.CGHHDHCDEC(var_20_1) + 1)
						})
					elseif var_0_10(iter_18_2.menuName) then
						if AAR.IsMatchClientDataAvailable() then
							arg_22_0:AddButtonPrompt({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 3,
								helper_text = Engine.CBBHFCGDIC("LUA_MENU/GAME_SUMMARY")
							})
						else
							arg_22_0:RemoveButtonPrompt({
								helper_text = "",
								button_ref = "button_left_trigger"
							})
						end
					else
						arg_22_0:RemoveButtonPrompt({
							helper_text = "",
							button_ref = "button_left_trigger"
						})
					end

					if MLG.IsCDLActive(arg_20_1) and iter_18_2.menuName == "MPWeaponMenu" and CONDITIONS.IsConsoleGame(arg_18_0) then
						ACTIONS.AnimateSequence(arg_18_0.PartyWidget, "CDLon")
					else
						ACTIONS.AnimateSequence(arg_18_0.PartyWidget, "CDLoff")
					end

					if not var_0_1(iter_18_2.menuName) then
						arg_18_0:RemoveButtonPrompt({
							helper_text = "",
							button_ref = "button_r3"
						})
					end

					arg_18_0.bindButton:registerEventHandler("button_alt2", nil)
					arg_18_0.bindButton:registerEventHandler("button_left_trigger", nil)
					arg_18_0.bindButton:registerEventHandler("button_right_trigger", nil)
					arg_18_0:RemoveButtonPrompt({
						priority = 5,
						button_ref = "button_right_trigger",
						helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/TOGGLE_UI")
					})

					local var_22_0
					local var_22_1

					if iter_18_2.menuName == "MPBattlenetStoreMenu" then
						var_22_0 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_CAPS")

						local var_22_2 = ""
					elseif iter_18_2.menuName == "LobbyFlowWidget" then
						var_22_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

						local var_22_3 = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
					elseif iter_18_2.menuName == "TournamentLobbyFlow" then
						var_22_0 = ""

						local var_22_4 = ""
					elseif iter_18_2.isStoreTab and not iter_18_2.isBattlePassTab then
						var_22_0 = Engine.CBBHFCGDIC("LUA_MENU/INSPECT")

						local var_22_5 = ""
					else
						var_22_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

						local var_22_6 = ""
					end

					var_0_7(arg_18_0, iter_18_2.menuName, true, arg_20_1)

					if iter_18_2.menuName == "BattlePassMenu" then
						arg_18_0.activeTabWidget._currentMenu = arg_18_0:GetCurrentMenu()

						arg_18_0.activeTabWidget:UpdateMenuDisplay()
					elseif iter_18_2.menuName == "SeasonalEventMenu" then
						LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = nil

						local var_22_7 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

						if not var_22_7.useTitleHowTo and not var_22_7.disableFTUE then
							local var_22_8 = arg_18_0.activeTabWidget:GetFrontDataGameSource()

							if var_22_8 then
								arg_18_0.activeTabWidget:UpdateTitleDescAndCrossLaunchPrompt(arg_18_0, var_22_8)
							end
						end

						if var_22_7.useTitleHowTo or var_22_7.useAllChallengesTab then
							local var_22_9 = arg_18_0.activeTabWidget:GetFrontDataGameSource()

							if var_22_9 then
								arg_18_0.activeTabWidget:UpdateTitleDescAndCrossLaunchPrompt(arg_18_0, var_22_9)
							end

							if arg_18_0.activeTabWidget.SeasonalEventTitle and var_22_7.useAllChallengesTab then
								local var_22_10 = {
									button_ref = "button_dpad_up",
									priority = 1,
									helper_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/SEE_ALL_CH_KBM")),
									prompt_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/SEE_ALL_CH"))
								}

								arg_18_0.activeTabWidget.SeasonalEventTitle.SeasonalEventAllChallengesPrompts:SetupPromptsData(arg_18_0, var_22_10)
							end

							if arg_18_0.activeTabWidget.howToPrompt and var_22_7.useTitleHowTo then
								local var_22_11 = {
									button_ref = "button_alt1",
									priority = 1,
									helper_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/HOW_DOES_IT_WORK_KBM")),
									prompt_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/HOW_DOES_IT_WORK_ALT1"))
								}

								if var_22_7.useTugOfWarView then
									var_22_11.containerAlignment = LUI.Alignment.Center
								end

								arg_18_0.activeTabWidget.howToPrompt:SetupPromptsData(arg_18_0, var_22_11)
							end
						end

						if arg_18_0.activeTabWidget.SquareProgressPanel and var_22_7.showPreviewButtonInFooter then
							arg_18_0:AddButtonPrompt({
								priority = 2,
								button_ref = "button_r3",
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_KBM")
							})
						end

						if CONDITIONS.SeasonalEventHasParticipationChallenges() then
							arg_18_0:AddButtonPrompt({
								gamepad_only = true,
								button_ref = "button_alt1",
								priority = 1,
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_KBM")
							})
							arg_18_0:RemoveButtonPrompt({
								side = "left",
								button_ref = "button_primary",
								helper_text = ""
							})
						elseif var_22_7.useTugOfWarView then
							arg_18_0:AddButtonPrompt({
								gamepad_only = true,
								button_ref = "button_primary",
								priority = 4,
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_KBM")
							})
						elseif not CONDITIONS.SeasonalEventDisablesFTUE() and CONDITIONS.IsEventTabMoreInfoEnabled() and not var_22_7.useTitleHowTo then
							arg_18_0:AddButtonPrompt({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 4,
								helper_text = Engine.CBBHFCGDIC("MENU/MORE_INFO")
							})
							arg_18_0.bindButton:registerEventHandler("button_left_trigger", function(arg_23_0, arg_23_1)
								LUI.FlowManager.RequestPopupMenu(arg_18_0, "SeasonalEventDetailsPopup", true, arg_20_1, false, {
									openedFromMenu = true
								})
							end)
						end

						if var_22_7.uiToggleSequences then
							arg_18_0:AddButtonPrompt({
								priority = 5,
								button_ref = "button_right_trigger",
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/TOGGLE_UI")
							})
						end
					else
						LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = nil

						arg_18_0:RemoveButtonPrompt({
							side = "left",
							button_ref = "button_alt2",
							helper_text = ""
						})

						if iter_18_2.menuName == "WZOperatorSelect" then
							arg_18_0.activeTabWidget:UpdateButtonPrompts(arg_20_1)
						else
							arg_18_0:AddButtonPrompt({
								side = "left",
								button_ref = "button_primary",
								priority = 2,
								helper_text = var_22_0
							})
						end
					end

					local var_22_12 = arg_18_0:getParent()

					if var_22_12 and var_22_12.LobbyStatus then
						if var_22_12.id == "MPPublicLobby" then
							if arg_18_0.activeTabWidget.UpdateParentLobbyStatus then
								arg_18_0.activeTabWidget:UpdateParentLobbyStatus()
							else
								var_22_12.LobbyStatus:SetAlpha(1)
							end

							arg_18_0.ShowBlackoutOverlayIfRequired(arg_18_0, arg_20_1)
						elseif var_22_12.id == "TournamentLoadingScreen" or var_22_12.id == "TournamentMatchmaking" then
							if iter_18_2.menuName == "TournamentLoading" then
								var_22_12.LobbyStatus:SetAlpha(0)
							else
								var_22_12.LobbyStatus:SetAlpha(1)
							end
						end
					end

					if iter_18_2.menuName == var_18_1 then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabPlay)
					elseif iter_18_2.menuName == "MPWeaponMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabWeapons)
					elseif var_0_1(iter_18_2.menuName) then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabOperators)

						if not Onboarding.Operators.WasCompleted(arg_18_0, arg_20_1) then
							if CONDITIONS.IsMagmaGameMode(arg_18_0) then
								LUI.FlowManager.RequestPopupMenu(arg_18_0, "onboardingpopup", true, arg_20_1, false, ONBOARDING_DATA.GetOnboardingWZOperatorData())
							else
								LUI.FlowManager.RequestPopupMenu(arg_18_0, "onboardingpopup", true, arg_20_1, false, ONBOARDING_DATA.GetOnboardingOperatorData())
							end

							Onboarding.Operators.MarkCompleted(arg_18_0, arg_20_1)
						end
					elseif iter_18_2.menuName == "BattlePassMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBattlepass)
					elseif iter_18_2.menuName == "SeasonalEventMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabSeasonalEvent)
					elseif iter_18_2.menuName == "ChallengeMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabChallenges)
					elseif iter_18_2.menuName == "MPStoreMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabStore)

						if var_18_0.useStandaloneStore then
							var_0_8(arg_18_0, arg_20_1, arg_20_2)
						end
					elseif iter_18_2.menuName == "MPBarracksMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBarracks)
					elseif iter_18_2.menuName == "CareerMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabCareer)
					end

					if Engine.JEDFGECDJ() > 1 and (iter_18_2.menuName == "BattlePassMenu" or iter_18_2.menuName == "MPStoreMenu") then
						var_0_6(arg_18_0, true, arg_20_1)
					else
						var_0_6(arg_18_0, false)
					end

					var_0_2(arg_18_0, arg_20_1)
				end

				if iter_18_2.isStoreTab or iter_18_2.isWZOperatorTab then
					arg_18_0.PartyWidget:SetAlpha(0, 200)
					arg_18_0.PartyWidget:EnableSocialMenu(false)
					ACTIONS.AnimateSequence(arg_18_0, "PlayerTextOffsetStore")
				else
					arg_18_0.PartyWidget:SetAlpha(1, 200)
					arg_18_0.PartyWidget:EnableSocialMenu(true)
					ACTIONS.AnimateSequence(arg_18_0, "PlayerTextOffsetDefault")
				end

				if not arg_18_0._isMenuInitialized then
					arg_18_0:addEventHandler("menu_create", function(arg_24_0, arg_24_1)
						arg_24_0._isMenuInitialized = true

						var_20_3(arg_24_0)
					end)
				end

				var_20_3(arg_18_0)
				arg_18_0:processEvent({
					name = "focus_tab_changed",
					tabName = iter_18_2.menuName
				})
			end,
			buildSpecificTab = iter_18_2.buildSpecificTab,
			isStoreTab = iter_18_2.isStoreTab,
			isEventTab = iter_18_2.isEventTab,
			isBattlePassTab = iter_18_2.isBattlePassTab,
			isWZOperatorTab = iter_18_2.isWZOperatorTab,
			hasRestrictionIcon = iter_18_2.hasRestrictionIcon
		})
	end

	arg_18_0.Tabs:SetTabs(var_18_8)

	arg_18_0._tabsData = var_18_3
	arg_18_0._tabIndexMap = var_18_4

	var_0_2(arg_18_0, arg_18_1)

	var_18_0.tabsInitialized = true
end

local function var_0_12(arg_25_0, arg_25_1)
	if not arg_25_1 then
		return
	end

	LUI.FlowManager.GetScopedData(arg_25_0).onRestoreFocusOptions = {
		tabToFocus = arg_25_1.tabToFocus,
		buttonToFocus = arg_25_1.buttonToFocus,
		bundleToFocus = arg_25_1.bundleToFocus,
		triggerButtonAction = arg_25_1.triggerButtonAction,
		openMenuFunction = arg_25_1.openMenuFunction,
		bundleIDToGift = arg_25_1.bundleIDToGift,
		openGiftingPopupType = arg_25_1.openGiftingPopupType
	}

	if CONDITIONS.IsSeasonalEventTabActive() then
		local var_25_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if var_25_0 then
			var_25_0.onRestoreFocusOptions = {
				overrideTabToFocus = arg_25_1.tabToFocus
			}
		end
	end
end

local function var_0_13(arg_26_0, arg_26_1)
	local var_26_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.dov2nukelunched")

	if var_26_0:GetValue(arg_26_1) then
		LUI.FlowManager.RequestPopupMenu(arg_26_0, "BRFullScreenOverlayPopup", true, arg_26_1, false)
		var_26_0:SetValue(arg_26_1, false)
	end
end

local function var_0_14(arg_27_0, arg_27_1)
	return function(arg_28_0, arg_28_1)
		local var_28_0 = tonumber(BATTLEPASS.GetItemCost(arg_27_1))

		if var_28_0 > Commerce.CEDDCGHIGA(arg_28_1.controller, LOOT.CurrencyIDs.COD_POINTS) then
			local var_28_1 = {
				showBalance = true,
				controllerIndex = arg_28_1.controller,
				currencyID = LOOT.CurrencyIDs.COD_POINTS,
				currencyAmount = var_28_0
			}

			STORE.EnterStore(arg_28_1.controller, arg_28_0:GetCurrentMenu().id, arg_28_0.id, var_28_1, "PurchaseCODPointsPopup", true)
		elseif arg_27_0._recipentXuidString then
			local var_28_2 = arg_27_0._recipentXuidString

			LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchasePopup")

			local var_28_3 = BATTLEPASS.GetItemSKU(arg_27_1)

			LUI.ToastManager.GetInstance():QueueGiftRecipientXuid(arg_27_0._recipentXuidString)

			local var_28_4 = 1

			Gifting.DAFDBDBEJC(arg_28_1.controller, var_28_3, var_28_4, arg_27_0._recipentXuidString)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_27_0._controllerIndex, false, {
				purchaseGift = true
			}, nil, false, true)

			arg_27_0:Wait(1500).onComplete = function()
				LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

				local var_29_0 = {
					state = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_GIFTED,
					recipentXuidString = var_28_2
				}

				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_27_0._controllerIndex, false, var_29_0, nil, false, true)
			end
			arg_27_0._recipentXuidString = nil
		end
	end
end

local function var_0_15(arg_30_0, arg_30_1)
	local function var_30_0(arg_31_0, arg_31_1)
		arg_31_0._recipentXuidString = arg_31_1
	end

	local function var_30_1()
		local var_32_0 = BATTLEPASS.GetPurchaseRef()
		local var_32_1 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, var_32_0, CSV.battlePassIDs.cols.sku)
		local var_32_2 = {
			sourceMenu = arg_30_0,
			battlePassSKU = var_32_1,
			giftingActionCallback = var_30_0
		}

		LUI.FlowManager.RequestPopupMenu(arg_30_0, "BattlePassPurchasePopup", true, arg_30_1, false, var_32_2)
	end

	arg_30_0.GetPurchaseAction = var_0_14
	arg_30_0._screenOpenedTime = Engine.DEIDGHDBHD()

	GIFT.StartFTUEFlow(arg_30_0, var_30_1)
end

local function var_0_16(arg_33_0, arg_33_1, arg_33_2)
	local function var_33_0(arg_34_0, arg_34_1)
		return function(arg_35_0)
			assert(arg_35_0)

			local var_35_0 = {
				bundleGiftInfo = arg_34_1,
				recipientXuidString = arg_35_0
			}

			LUI.FlowManager.RequestPopupMenu(nil, "GiftBundlePurchaseConfirmationPopup", true, arg_34_0, false, var_35_0)
		end
	end

	local var_33_1 = 0
	local var_33_2, var_33_3 = STORE.GetBundleCost(arg_33_1, arg_33_2)

	if var_33_3 and var_33_3 < var_33_2 then
		var_33_1 = var_33_3
	else
		var_33_1 = var_33_2
	end

	local var_33_4 = {
		currencyAmount = var_33_1,
		id = arg_33_2,
		name = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_2, CSV.bundleIDs.cols.name),
		titleImage = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_2, CSV.bundleIDs.cols.titleImage)
	}
	local var_33_5 = {
		controllerIndex = arg_33_1,
		bundleSKU = arg_33_2,
		selectedGifteeCallback = var_33_0(arg_33_1, var_33_4)
	}

	local function var_33_6()
		local var_36_0 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_33_5)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_33_1, false, {
			flyInLeftNarrow = true,
			widget = var_36_0
		})
	end

	GIFT.StartFTUEFlow(arg_33_0, var_33_6)
end

local function var_0_17(arg_37_0, arg_37_1, arg_37_2)
	assert(arg_37_0.MenuTitle)
	assert(arg_37_0.Tabs)
	assert(arg_37_0.Nat)
	assert(arg_37_0.JoinableStatus)
	assert(arg_37_0.TabBacker)
	arg_37_0.Tabs:SetAlignment(LUI.Alignment.Left)

	arg_37_0.SetupTabs = var_0_11
	arg_37_0.GetTabIndexByWidgetName = var_0_9
	arg_37_0.SetupOnRestoreFocusOverride = var_0_12
	arg_37_0.SetupBackButtonHandler = var_0_4
	arg_37_0.UpdateJoinableStatus = var_0_3
	arg_37_0.UpdateTabBreadcrumbs = var_0_2
	arg_37_0.ShowBlackoutOverlayIfRequired = var_0_13
	arg_37_0.OpenGiftBundleToFriendPopup = var_0_16
	arg_37_0.OpenGiftBattlePassToFriendPopup = var_0_15
	arg_37_0._controllerIndex = arg_37_1

	CoD.CheckAndApplyResetSeasonalPlayerData(arg_37_1)
	CoD.CheckAndApplySeasonalEventPlayerData(arg_37_0, arg_37_1)

	local var_37_0 = Dvar.CFHDGABACF("lui_tabs_menu_default_focus_tab_num")

	if var_37_0 and var_37_0 > 0 then
		LUI.FlowManager.GetScopedData("MainMenu").tabIndexToFocus = var_37_0 - 1
	end

	arg_37_0:setPriority(-1)

	local function var_37_1(arg_38_0, arg_38_1)
		local var_38_0 = LUI.FlowManager.GetScopedData(arg_37_0)
		local var_38_1 = LUI.FlowManager.GetScopedData("MainMenu")
		local var_38_2 = var_38_0.onRestoreFocusOptions

		if var_38_2 then
			local var_38_3 = var_38_2.tabToFocus

			if var_38_3 then
				local var_38_4 = var_0_9(arg_37_0, var_38_3)

				if var_38_4 then
					arg_37_0.Tabs:FocusTab(arg_37_1, var_38_4 - 1)

					if arg_37_0.activeTabWidget.FocusButtonByName and var_38_2.buttonToFocus then
						arg_37_0.activeTabWidget:FocusButtonByName(var_38_2.buttonToFocus)
					elseif arg_37_0.activeTabWidget.FocusBundleByID and var_38_2.bundleToFocus then
						arg_37_0.activeTabWidget:FocusBundleByID(var_38_2.bundleToFocus, var_38_2.triggerButtonAction, var_38_2.openGiftingPopup)
					elseif var_38_3 == "BattlePassMenu" and var_38_2.openGiftingPopup then
						arg_37_0.activeTabWidget:OpenGiftingPopup()
					end

					if var_38_2.openMenuFunction then
						var_38_2.openMenuFunction()
					end
				end
			elseif var_38_2.openGiftingPopupType == "bundle" and var_38_2.bundleIDToGift then
				arg_37_0:OpenGiftBundleToFriendPopup(arg_37_1, var_38_2.bundleIDToGift)
			elseif var_38_2.openGiftingPopupType == "battlepass" then
				arg_37_0:OpenGiftBattlePassToFriendPopup(arg_37_1)
			end

			var_38_0.onRestoreFocusOptions = nil

			return true
		elseif var_38_1.tabIndexToFocus then
			arg_37_0.Tabs:FocusTab(arg_37_1, var_38_1.tabIndexToFocus)

			var_38_1.tabIndexToFocus = nil
		end

		arg_37_0.ShowBlackoutOverlayIfRequired(arg_37_0, arg_37_1)
	end

	arg_37_0.Tabs:addEventHandler("restore_focus", var_37_1)
	arg_37_0:addEventHandler("gain_focus", var_37_1)

	if CONDITIONS.IsMagmaGameMode() then
		local var_37_2 = LUI.FlowManager.IsInStack("BRMainMenuStore")
		local var_37_3 = Engine.CFHBIHABCB(arg_37_1)

		if var_37_2 and var_37_3 then
			arg_37_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
		else
			arg_37_0.MenuTitle:SetWarzoneTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
		end
	elseif CONDITIONS.IsCoreMultiplayer(arg_37_0) then
		arg_37_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	elseif CONDITIONS.IsThirdGameMode(arg_37_0) then
		arg_37_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TAC_OPS"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	end

	arg_37_0:addEventHandler("menu_create", function(arg_39_0, arg_39_1)
		local var_39_0 = Lobby.DGDAAFJDBI()

		if var_39_0 then
			if var_39_0 == "NETWORK_STRICT" and Dvar.IBEGCHEFE("MMONQLOPSO") == false then
				LUI.FlowManager.RequestPopupMenu(arg_37_0, "strict_nat_warning", true, arg_37_1, false)
				Dvar.DHEGHJJJHI("MMONQLOPSO", true)
			end

			local var_39_1 = Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", var_39_0)

			assert(arg_37_0.Nat)
			arg_37_0.Nat:setText(var_39_1)
		end
	end)

	arg_37_0.bindButton = LUI.UIBindButton.new()
	arg_37_0.bindButton.id = "selfBindButton"

	arg_37_0:addElement(arg_37_0.bindButton)

	local function var_37_4(arg_40_0, arg_40_1)
		if arg_37_0.Tabs then
			local var_40_0 = arg_37_0.Tabs:GetCurrentTab()
			local var_40_1 = arg_37_0._tabsData[var_40_0.index + 1].menuName

			if var_0_5(arg_37_0, var_40_1) and Engine.JEDFGECDJ() > 1 then
				local var_40_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
				local var_40_3 = var_40_2:GetValue(arg_37_1)
				local var_40_4 = Engine.CGHHDHCDEC(var_40_3)

				var_40_2:SetValue(arg_37_1, var_40_4)
				arg_37_0:AddButtonPrompt({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_40_3 + 1)
				})

				return true
			elseif var_0_10(var_40_1) and AAR.IsMatchClientDataAvailable() and Dvar.CFHDGABACF("MTKSQRQLKN") ~= 0 then
				Lobby.OpenAfterActionReport(arg_40_1.controller, false, false)
			end
		end

		return false
	end

	arg_37_0.bindButton:addEventHandler("button_left_trigger", var_37_4)

	local function var_37_5()
		local var_41_0 = arg_37_0.Tabs:GetCurrentTab()
		local var_41_1 = arg_37_0._tabsData[var_41_0.index + 1].menuName
		local var_41_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
		local var_41_3 = var_41_2:GetValue(arg_37_1)

		if Engine.JEDFGECDJ() > 1 then
			if var_41_1 == "BattlePassMenu" or var_41_1 == "MPStoreMenu" then
				var_0_6(arg_37_0, true, var_41_3)
			end

			local var_41_4 = Engine.CGHHDHCDEC(var_41_3)

			if var_0_5(arg_37_0, var_41_1) then
				arg_37_0:AddButtonPrompt({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_41_4 + 1)
				})
			else
				arg_37_0:RemoveButtonPrompt({
					helper_text = "",
					button_ref = "button_left_trigger"
				})
			end
		else
			if var_41_1 == "BattlePassMenu" or var_41_1 == "MPStoreMenu" then
				var_0_6(arg_37_0, false)
				var_41_2:SetValue(arg_37_1, 0)
			end

			if var_0_5(arg_37_0, var_41_1) then
				var_41_2:SetValue(arg_37_1, 0)
			end

			arg_37_0:RemoveButtonPrompt({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
		end

		var_0_7(arg_37_0, var_41_1, false, arg_37_1)
	end

	local function var_37_6()
		local var_42_0 = arg_37_0.Tabs:GetCurrentTab()

		if var_42_0 then
			local var_42_1 = arg_37_0._tabsData[var_42_0.index + 1].menuName

			var_0_7(arg_37_0, var_42_1)
		end
	end

	local var_37_7 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_37_8 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.squadMembers.memberCount")

	arg_37_0:SubscribeToModel(var_37_7:GetModel(arg_37_1), var_37_5, true)
	arg_37_0:SubscribeToModel(var_37_8:GetModel(arg_37_1), var_37_6, true)

	local function var_37_9(arg_43_0, arg_43_1)
		local var_43_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_43_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_37_0:addAndCallEventHandler("onVideoChange", var_37_9)
	LAYOUT.AddAspectRatioFadeFrame(arg_37_0, arg_37_1)

	local var_37_10 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	if not var_37_10:GetValue(arg_37_1) then
		var_37_10:SetValue(arg_37_1, arg_37_1)
	end

	arg_37_0.Tabs:SetSendEventOnTabChange(true)
	arg_37_0:addEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_44_0, arg_44_1)
		assert(arg_44_1.index)
		arg_37_0.activeTabWidget:processEvent(arg_44_1)
		LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_44_1.controller)

		return true
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_37_0, "WZWipSetup")
	end
end

function MPTabsMenu(arg_45_0, arg_45_1)
	local var_45_0 = LUI.UIElement.new()

	var_45_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_45_0.id = "MPTabsMenu"
	var_45_0._animationSets = var_45_0._animationSets or {}
	var_45_0._sequences = var_45_0._sequences or {}

	local var_45_1 = arg_45_1 and arg_45_1.controllerIndex

	if not var_45_1 and not Engine.DDJFBBJAIG() then
		var_45_1 = var_45_0:getRootController()
	end

	assert(var_45_1)

	local var_45_2 = var_45_0
	local var_45_3
	local var_45_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_45_1
	})

	var_45_4.id = "TabBacker"

	var_45_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_45_0:addElement(var_45_4)

	var_45_0.TabBacker = var_45_4

	local var_45_5

	if CONDITIONS.IsUserSignedInDemonware(var_45_1) then
		local var_45_6 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_45_1
		})

		var_45_6.id = "MPPlayerDetails"

		var_45_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_45_0:addElement(var_45_6)

		var_45_0.MPPlayerDetails = var_45_6
	end

	local var_45_7
	local var_45_8 = LUI.UIText.new()

	var_45_8.id = "Nat"

	var_45_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_45_8:setText("", 0)
	var_45_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_45_8:SetAlignment(LUI.Alignment.Right)
	var_45_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_45_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -33, _1080p * -11)
	var_45_0:addElement(var_45_8)

	var_45_0.Nat = var_45_8

	local var_45_9
	local var_45_10 = LUI.UIText.new()

	var_45_10.id = "JoinableStatus"

	var_45_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_45_10:setText("", 0)
	var_45_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_45_10:SetAlignment(LUI.Alignment.Right)
	var_45_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_45_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -53, _1080p * -31)
	var_45_0:addElement(var_45_10)

	var_45_0.JoinableStatus = var_45_10

	local var_45_11
	local var_45_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_45_1
	})

	var_45_12.id = "MenuTitle"

	var_45_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), 0)
	var_45_12.Line:SetLeft(0, 0)
	var_45_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_45_0:addElement(var_45_12)

	var_45_0.MenuTitle = var_45_12

	local var_45_13
	local var_45_14 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_45_1
			})
		end,
		controllerIndex = var_45_1
	}
	local var_45_15 = LUI.TabManager.new(var_45_14)

	var_45_15.id = "Tabs"

	var_45_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 987, _1080p * 108, _1080p * 160)
	var_45_0:addElement(var_45_15)

	var_45_0.Tabs = var_45_15

	local var_45_16
	local var_45_17 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_45_1
	})

	var_45_17.id = "PartyWidget"

	var_45_17:SetAlpha(0, 0)
	var_45_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_45_0:addElement(var_45_17)

	var_45_0.PartyWidget = var_45_17

	local var_45_18
	local var_45_19 = LUI.UIImage.new()

	var_45_19.id = "PlayerTextBacker"

	var_45_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_45_19:SetAlpha(0, 0)
	var_45_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -302, _1080p * -96, _1080p * 190, _1080p * 218)
	var_45_0:addElement(var_45_19)

	var_45_0.PlayerTextBacker = var_45_19

	local var_45_20
	local var_45_21 = LUI.UIImage.new()

	var_45_21.id = "PlayerTextTexture"

	var_45_21:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_45_21:SetAlpha(0, 0)
	var_45_21:SetPixelGridEnabled(true)
	var_45_21:SetPixelGridContrast(0.5, 0)
	var_45_21:SetPixelGridBlockWidth(2, 0)
	var_45_21:SetPixelGridBlockHeight(2, 0)
	var_45_21:SetPixelGridGutterWidth(1, 0)
	var_45_21:SetPixelGridGutterHeight(1, 0)
	var_45_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -302, _1080p * -96, _1080p * 190, _1080p * 218)
	var_45_0:addElement(var_45_21)

	var_45_0.PlayerTextTexture = var_45_21

	local var_45_22
	local var_45_23 = LUI.UIStyledText.new()

	var_45_23.id = "PlayerText"

	var_45_23:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_45_23:SetAlpha(0, 0)
	var_45_23:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_45_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_45_23:SetWordWrap(false)
	var_45_23:SetAlignment(LUI.Alignment.Right)
	var_45_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_45_23:SetShadowRGBFromTable(SWATCHES.Reticles.White, 0)
	var_45_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -298, _1080p * -101, _1080p * 192, _1080p * 216)
	var_45_0:addElement(var_45_23)

	var_45_0.PlayerText = var_45_23

	local var_45_24

	if CONDITIONS.IsMagmaGameMode() then
		local var_45_25 = MenuBuilder.BuildRegisteredType("WZLookForPartySearchStatusTopper", {
			controllerIndex = var_45_1
		})

		var_45_25.id = "SearchStatusTopper"

		var_45_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 45, _1080p * 88)
		var_45_0:addElement(var_45_25)

		var_45_0.SearchStatusTopper = var_45_25
	end

	local function var_45_26()
		return
	end

	var_45_0._sequences.DefaultSequence = var_45_26

	local var_45_27
	local var_45_28 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_19:RegisterAnimationSequence("PlayerTextOn", var_45_28)

	local var_45_29 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_21:RegisterAnimationSequence("PlayerTextOn", var_45_29)

	local var_45_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_23:RegisterAnimationSequence("PlayerTextOn", var_45_30)

	local function var_45_31()
		var_45_19:AnimateSequence("PlayerTextOn")
		var_45_21:AnimateSequence("PlayerTextOn")
		var_45_23:AnimateSequence("PlayerTextOn")
	end

	var_45_0._sequences.PlayerTextOn = var_45_31

	local var_45_32
	local var_45_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -54
		}
	}

	var_45_10:RegisterAnimationSequence("PlayerTextOff", var_45_33)

	local var_45_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_19:RegisterAnimationSequence("PlayerTextOff", var_45_34)

	local var_45_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_21:RegisterAnimationSequence("PlayerTextOff", var_45_35)

	local var_45_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_23:RegisterAnimationSequence("PlayerTextOff", var_45_36)

	local function var_45_37()
		var_45_10:AnimateSequence("PlayerTextOff")
		var_45_19:AnimateSequence("PlayerTextOff")
		var_45_21:AnimateSequence("PlayerTextOff")
		var_45_23:AnimateSequence("PlayerTextOff")
	end

	var_45_0._sequences.PlayerTextOff = var_45_37

	local var_45_38
	local var_45_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		}
	}

	var_45_19:RegisterAnimationSequence("PlayerTextOffsetStore", var_45_39)

	local var_45_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		}
	}

	var_45_21:RegisterAnimationSequence("PlayerTextOffsetStore", var_45_40)

	local var_45_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		}
	}

	var_45_23:RegisterAnimationSequence("PlayerTextOffsetStore", var_45_41)

	local function var_45_42()
		var_45_19:AnimateSequence("PlayerTextOffsetStore")
		var_45_21:AnimateSequence("PlayerTextOffsetStore")
		var_45_23:AnimateSequence("PlayerTextOffsetStore")
	end

	var_45_0._sequences.PlayerTextOffsetStore = var_45_42

	local var_45_43
	local var_45_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 159
		}
	}

	var_45_15:RegisterAnimationSequence("PlayerTextOffsetDefault", var_45_44)

	local var_45_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 218
		}
	}

	var_45_19:RegisterAnimationSequence("PlayerTextOffsetDefault", var_45_45)

	local var_45_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 218
		}
	}

	var_45_21:RegisterAnimationSequence("PlayerTextOffsetDefault", var_45_46)

	local var_45_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 216
		}
	}

	var_45_23:RegisterAnimationSequence("PlayerTextOffsetDefault", var_45_47)

	local function var_45_48()
		var_45_15:AnimateSequence("PlayerTextOffsetDefault")
		var_45_19:AnimateSequence("PlayerTextOffsetDefault")
		var_45_21:AnimateSequence("PlayerTextOffsetDefault")
		var_45_23:AnimateSequence("PlayerTextOffsetDefault")
	end

	var_45_0._sequences.PlayerTextOffsetDefault = var_45_48

	local var_45_49
	local var_45_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 993
		}
	}

	var_45_15:RegisterAnimationSequence("WZWipSetup", var_45_50)

	local function var_45_51()
		var_45_15:AnimateSequence("WZWipSetup")
	end

	var_45_0._sequences.WZWipSetup = var_45_51

	var_0_17(var_45_0, var_45_1, arg_45_1)

	return var_45_0
end

MenuBuilder.registerType("MPTabsMenu", MPTabsMenu)
LockTable(_M)
