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

		if Dvar.IBEGCHEFE("LKLQOTKSNR") then
			local var_2_8 = MAIN_MENU.GetNGBladeState()

			if not CONDITIONS.IsLazeOrOutrun() and var_2_8 >= MAIN_MENU.NGBladeStates.CortezNowAvailable then
				var_2_7:SetCortezBanner(arg_2_0)
			elseif not CONDITIONS.IsLaze() and STORE.IsVanguardAvailable(arg_2_1) and not STORE.IsVanguardOwned(arg_2_1) and CONDITIONS.IsVanguardPreOrderBannerActive() then
				var_2_7:SetVGBanner(arg_2_0)
			elseif CONDITIONS.IsBattlePassTopperActive() and not BATTLEPASS.IsOwned(arg_2_1) then
				var_2_7:SetBundleTopperBanner(arg_2_0)
			elseif arg_2_0._storeHasFreeItem then
				var_2_7:SetFreeBanner(arg_2_0._storeHasFreeItem)
			elseif arg_2_0.storeSaleTimer and #arg_2_0.storeSaleTimer > 0 and tonumber(arg_2_0.storeSaleTimer) > Engine.DEIDGHDBHD() and STORE.GetHighestDiscountPercentage(arg_2_1) > 0 then
				var_2_7:SetSaleBanner()
			elseif arg_2_0.limitedTimeItem then
				var_2_7:SetLimitedTimeBanner(arg_2_0.limitedTimeItem)
			elseif not CONDITIONS.IsLaze() and Dvar.IBEGCHEFE("LMMPLKNTMP") and CONDITIONS.IsCortezPremiumPlayer(arg_2_1) == false and STORE.IsCortezOwned(arg_2_1) == false then
				if #STORE.GetCortezCategoryData(arg_2_1) > 0 then
					var_2_7:SetCortezBanner(arg_2_0)
				end
			elseif CONDITIONS.IsStoreRefreshTimerEnabled() then
				var_2_7:SetStoreTabRefreshTimer(arg_2_0)
			elseif not CONDITIONS.IsLaze() and Dvar.IBEGCHEFE("TNMTRNOQT") and CONDITIONS.IsT9PremiumPlayer(arg_2_1) == false and STORE.IsZeusOwned(arg_2_1) == false and #STORE.GetZeusCategoryData(arg_2_1) > 0 then
				var_2_7:SetZeusBanner(arg_2_0)
			end
		end
	end

	local var_2_9 = arg_2_0:GetTabIndexByWidgetName("BattlePassMenu")
	local var_2_10 = var_2_9 and arg_2_0.Tabs:GetTabAtIndex(var_2_9)

	if var_2_10 then
		local var_2_11 = BATTLEPASS.IsOwned(arg_2_1)

		if BATTLEPASS.IsTierSkipGiftActive(arg_2_1) and not var_2_11 then
			local var_2_12 = tonumber(BATTLEPASS.GetTierSkipGiftTimer())

			var_2_10:SetPromoBanner(var_2_12, false)
		elseif CONDITIONS.IsTierSaleEnabled() and var_2_11 then
			local var_2_13 = Dvar.DHEEJCCJBH("MQTOPKPMRS")

			if var_2_13 and var_2_13 ~= "" then
				var_2_10:SetPromoBanner(var_2_13, true)
			end
		elseif not CONDITIONS.IsLaze() and Dvar.IBEGCHEFE("LNQTKTLKOS") then
			var_2_10:SetVGBanner(arg_2_0)
		else
			var_2_10:SetSeasonBanner()
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

		if CONDITIONS.IsPostSeasonAndMagma() == false then
			arg_10_0._xpNotificationPrompt = (CONDITIONS.IsMagmaGameMode() and var_10_1.WZDoubleXPNotifications or var_10_1.DoubleXPNotifications):GetPromptContainer()

			arg_10_0:AddButtonPrompt({
				replaceTop = true,
				button_ref = "button_l3",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TOKENS"),
				container = arg_10_0._xpNotificationPrompt,
				containerAlignment = LUI.Alignment.Right
			})
		end

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

		if CONDITIONS.IsPostSeasonAndMagma() == false then
			arg_10_0._xpNotificationPrompt = (CONDITIONS.IsMagmaGameMode() and var_10_6.WZDoubleXPNotifications and var_10_6.WZDoubleXPNotifications or var_10_6.DoubleXPNotifications):GetPromptContainer()

			arg_10_0:AddButtonPrompt({
				button_ref = "button_l3",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TOKENS"),
				container = arg_10_0._xpNotificationPrompt,
				containerAlignment = LUI.Alignment.Right
			})
		end

		arg_10_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			helper_text = ""
		})

		if Lobby.GetCurrentNumLobbyMembers(arg_10_3) > 1 and Lobby.BBDICGHE() then
			arg_10_0._allPlayersMuted = Lobby.FJCJFBBF()

			local var_10_7 = arg_10_0._allPlayersMuted and "LUA_MENU/UNMUTE_ALL" or "LUA_MENU/MUTE_ALL"

			arg_10_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC(var_10_7)
			})
			arg_10_0.bindButton:registerEventHandlerIfFree("button_right_stick", function(arg_14_0, arg_14_1)
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

local function var_0_11(arg_18_0)
	local function var_18_0(arg_19_0, arg_19_1)
		if arg_18_0.Tabs then
			local var_19_0 = arg_18_0.Tabs:GetCurrentTab()
			local var_19_1 = arg_18_0._tabsData[var_19_0.index + 1].menuName

			if var_0_5(arg_18_0, var_19_1) and Engine.JEDFGECDJ() > 1 then
				local var_19_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
				local var_19_3 = var_19_2:GetValue(controllerIndex)
				local var_19_4 = Engine.CGHHDHCDEC(var_19_3)

				var_19_2:SetValue(controllerIndex, var_19_4)
				arg_18_0:AddButtonPrompt({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_19_3 + 1)
				})

				return true
			elseif var_0_10(var_19_1) and AAR.IsMatchClientDataAvailable() and Dvar.CFHDGABACF("MTKSQRQLKN") ~= 0 then
				Lobby.OpenAfterActionReport(arg_19_1.controller, false, false)
			end
		end

		return false
	end

	arg_18_0.bindButton:registerEventHandler("button_left_trigger", var_18_0)
end

local function var_0_12(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = LUI.FlowManager.GetScopedData(arg_20_0)
	local var_20_1 = arg_20_2 and arg_20_2.firstTabWidget
	local var_20_2

	if var_20_1 == nil then
		if CONDITIONS.IsMagmaGameMode() then
			var_20_1 = "BRPlayMenu"
		elseif CONDITIONS.IsCoreMultiplayer() then
			var_20_1 = "MPPlayMenu"
		elseif CONDITIONS.IsThirdGameMode() then
			var_20_1 = "CPPlayMenu"
		end
	end

	arg_20_0._isMenuInitialized = false

	local var_20_3 = {}
	local var_20_4 = {}

	var_20_3[#var_20_3 + 1] = {
		isPlayTab = true,
		canClearNewIndicators = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PLAY"),
		menuName = var_20_1
	}
	var_20_4[var_20_1] = #var_20_3

	if var_20_1 == "TournamentLobbyFlow" then
		arg_20_0.MenuTitle:SetAlpha(0)
	end

	if CONDITIONS.IsSeasonalEventTabActive() and SEASONAL_EVENT.GetCurrentSeasonalEventTabName() ~= nil then
		var_20_3[#var_20_3 + 1] = {
			isEventTab = true,
			canClearNewIndicators = true,
			menuName = "SeasonalEventMenu",
			name = Engine.CBBHFCGDIC(SEASONAL_EVENT.GetCurrentSeasonalEventTabName())
		}
		var_20_4.SeasonalEventMenu = #var_20_3
	end

	var_20_3[#var_20_3 + 1] = {
		isWeaponsTab = true,
		menuName = "MPWeaponMenu",
		hasRestrictionIcon = true,
		canClearNewIndicators = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/WEAPONS"),
		disabled = not Dvar.IBEGCHEFE("LORQPPPMT")
	}
	var_20_4.MPWeaponMenu = #var_20_3

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_20_3[#var_20_3 + 1] = {
			menuName = "WZOperatorSelect",
			isWZOperatorTab = true,
			canClearNewIndicators = true,
			isOperatorTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/OPERATORS"),
			disabled = not Dvar.IBEGCHEFE("LSPTSOQPPT")
		}
		var_20_4.WZOperatorSelect = #var_20_3
	else
		var_20_3[#var_20_3 + 1] = {
			menuName = "MPOperatorMenu",
			canClearNewIndicators = true,
			isOperatorTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/OPERATORS"),
			disabled = not Dvar.IBEGCHEFE("LSPTSOQPPT")
		}
		var_20_4.MPOperatorMenu = #var_20_3
	end

	if CONDITIONS.IsChallengeTabEnabled() then
		var_20_3[#var_20_3 + 1] = {
			menuName = "ChallengeMenu",
			canClearNewIndicators = false,
			name = Engine.CBBHFCGDIC("MENU/CHALLENGES")
		}
		var_20_4.ChallengeMenu = #var_20_3
	end

	if not CONDITIONS.IsWeGameGovBanned() then
		var_20_3[#var_20_3 + 1] = {
			isBarracksTab = true,
			canClearNewIndicators = true,
			menuName = "MPBarracksMenu",
			name = Engine.CBBHFCGDIC("LUA_MENU/BARRACKS"),
			disabled = not Dvar.IBEGCHEFE("NPKSLQQPMP")
		}
		var_20_4.MPBarracksMenu = #var_20_3
	end

	if CONDITIONS.IsBattlePassEnabled() then
		var_20_3[#var_20_3 + 1] = {
			isStoreTab = true,
			menuName = "BattlePassMenu",
			canClearNewIndicators = false,
			isBattlePassTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS")
		}
		var_20_4.BattlePassMenu = #var_20_3
		var_20_2 = #var_20_3
	end

	if CONDITIONS.IsStoreAllowed() then
		var_20_3[#var_20_3 + 1] = {
			isStoreTab = true,
			canClearNewIndicators = false,
			menuName = "MPStoreMenu",
			name = Engine.CBBHFCGDIC("LUA_MENU/STORE")
		}
		var_20_4.MPStoreMenu = #var_20_3
	end

	local var_20_5 = Dvar.IBEGCHEFE("NSNRTPNQPN") and CONDITIONS.IsBattlePassEnabled()
	local var_20_6 = Dvar.CFHDGABACF("NTSLOQPLNT")

	if var_20_5 and var_20_6 < #var_20_3 + 1 and var_20_6 > 1 then
		local var_20_7 = {}

		for iter_20_0 = 1, #var_20_3 do
			var_20_7[iter_20_0] = var_20_3[iter_20_0]

			if var_20_6 == #var_20_3 then
				if iter_20_0 == var_20_2 then
					var_20_3[iter_20_0] = var_20_3[iter_20_0 + 1]
				elseif iter_20_0 == var_20_6 then
					var_20_3[iter_20_0] = var_20_7[var_20_2]
				end
			elseif iter_20_0 == var_20_6 then
				var_20_3[iter_20_0] = var_20_3[var_20_2]
			elseif iter_20_0 == var_20_2 + 1 then
				var_20_3[iter_20_0] = var_20_7[iter_20_0]
			elseif var_20_6 < iter_20_0 then
				var_20_3[iter_20_0] = var_20_7[iter_20_0 - 1]
			end

			var_20_4[var_20_3[iter_20_0].menuName] = iter_20_0
		end
	end

	arg_20_0:addEventHandler("store_menu_error", function(arg_21_0, arg_21_1)
		local var_21_0 = LUI.IsLastInputGamepad(arg_20_1) and FocusType.Gamepad or FocusType.MouseOver

		arg_20_0.Tabs:FocusTab(arg_20_1, 0, var_21_0)
	end)

	local var_20_8 = {}

	for iter_20_1, iter_20_2 in ipairs(var_20_3) do
		table.insert(var_20_8, {
			name = iter_20_2.name,
			disabled = iter_20_2.disabled,
			hasDefaultFocus = iter_20_1 - 1 == var_20_0.activeTabIndex,
			focusFunction = function(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
				local var_22_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
				local var_22_1 = var_22_0:GetValue(arg_22_1)

				if var_0_5(arg_20_0, iter_20_2.menuName) then
					arg_22_1 = var_22_1
				end

				if Engine.JEDFGECDJ() > 1 and (iter_20_2.menuName == "BattlePassMenu" or iter_20_2.menuName == "MPStoreMenu") then
					if not var_20_0.tabsInitialized or arg_22_3 ~= FocusType.MenuFlow then
						var_22_0:SetValue(arg_22_1, arg_22_1)
					else
						arg_22_1 = var_22_1
					end
				end

				if iter_20_2.menuName == "MPStoreMenu" and Engine.DBAEJAHFGJ(arg_22_1) then
					arg_20_0.Tabs:SetCurrentTabIndex(var_20_0.activeTabIndex)
					LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_22_1, false)

					return
				end

				if var_20_0.activeTabIndex and arg_22_2 == var_20_0.activeTabIndex and arg_20_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_20_0, var_20_0.activeTabIndex, "activeTabWidget", arg_22_2, arg_22_3, iter_20_2.menuName, {
					buildPriority = -1,
					controllerIndex = arg_22_1
				})

				var_20_0.activeTabIndex = arg_22_2

				arg_20_0:UpdateJoinableStatus(arg_22_1)

				if arg_20_0._backButtonHandlerSet and arg_22_2 ~= 0 then
					local var_22_2 = arg_20_0.activeTabWidget

					if var_22_2 and not var_22_2.BackButtonOverride then
						function var_22_2.BackButtonOverride(arg_23_0, arg_23_1)
							local var_23_0 = arg_23_1.qualifier ~= "keyboard" and arg_23_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

							arg_20_0.Tabs:FocusTab(arg_22_1, 0, var_23_0)

							return false
						end
					end
				end

				arg_20_0.Nat:SetAlpha(0)
				arg_20_0.JoinableStatus:SetAlpha(0)

				if iter_20_2.menuName == "MPPlayMenu" or iter_20_2.menuName == "BRPlayMenu" then
					arg_20_0.Nat:SetAlpha(1)
					arg_20_0.JoinableStatus:SetAlpha(1)
				end

				if iter_20_2.menuName == "TournamentLobbyFlow" then
					-- block empty
				end

				local function var_22_3(arg_24_0)
					if not arg_24_0._isMenuInitialized then
						return
					end

					arg_20_0:GetCurrentMenu().signoutSplitscreen = iter_20_2.menuName == var_20_1

					if var_0_5(arg_24_0, iter_20_2.menuName) and Engine.JEDFGECDJ() > 1 then
						arg_24_0:AddButtonPrompt({
							side = "left",
							button_ref = "button_left_trigger",
							priority = 3,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", Engine.CGHHDHCDEC(var_22_1) + 1)
						})
					elseif var_0_10(iter_20_2.menuName) then
						if AAR.IsMatchClientDataAvailable() then
							arg_24_0:AddButtonPrompt({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 3,
								helper_text = Engine.CBBHFCGDIC("LUA_MENU/GAME_SUMMARY")
							})
						else
							arg_24_0:RemoveButtonPrompt({
								helper_text = "",
								button_ref = "button_left_trigger"
							})
						end
					else
						arg_24_0:RemoveButtonPrompt({
							helper_text = "",
							button_ref = "button_left_trigger"
						})
					end

					if MLG.IsCDLActive(arg_22_1) and iter_20_2.menuName == "MPWeaponMenu" and CONDITIONS.IsConsoleGame(arg_20_0) then
						ACTIONS.AnimateSequence(arg_20_0.PartyWidget, "CDLon")
					else
						ACTIONS.AnimateSequence(arg_20_0.PartyWidget, "CDLoff")
					end

					if not var_0_1(iter_20_2.menuName) then
						arg_20_0:RemoveButtonPrompt({
							helper_text = "",
							button_ref = "button_r3"
						})
					end

					arg_20_0.bindButton:registerEventHandler("button_alt2", nil)
					arg_20_0.bindButton:registerEventHandler("button_left_trigger", nil)
					arg_20_0.bindButton:registerEventHandler("button_right_trigger", nil)
					arg_20_0:RemoveButtonPrompt({
						priority = 5,
						button_ref = "button_right_trigger",
						helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/TOGGLE_UI")
					})
					var_0_11(arg_20_0)

					local var_24_0
					local var_24_1

					if iter_20_2.menuName == "MPBattlenetStoreMenu" then
						var_24_0 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_CAPS")

						local var_24_2 = ""
					elseif iter_20_2.menuName == "LobbyFlowWidget" then
						var_24_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

						local var_24_3 = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
					elseif iter_20_2.menuName == "TournamentLobbyFlow" then
						var_24_0 = ""

						local var_24_4 = ""
					elseif iter_20_2.isStoreTab and not iter_20_2.isBattlePassTab then
						var_24_0 = Engine.CBBHFCGDIC("LUA_MENU/INSPECT")

						local var_24_5 = ""
					else
						var_24_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

						local var_24_6 = ""
					end

					var_0_7(arg_20_0, iter_20_2.menuName, true, arg_22_1)

					if iter_20_2.menuName == "BattlePassMenu" then
						arg_20_0.activeTabWidget._currentMenu = arg_20_0:GetCurrentMenu()

						arg_20_0.activeTabWidget:UpdateMenuDisplay()
					elseif iter_20_2.menuName == "SeasonalEventMenu" then
						LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = nil

						local var_24_7 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

						if not var_24_7.useTitleHowTo and not var_24_7.disableFTUE then
							local var_24_8 = arg_20_0.activeTabWidget:GetFrontDataGameSource()

							if var_24_8 then
								arg_20_0.activeTabWidget:UpdateTitleDescAndCrossLaunchPrompt(arg_20_0, var_24_8)
							end
						end

						if var_24_7.useTitleHowTo or var_24_7.useAllChallengesTab then
							local var_24_9 = arg_20_0.activeTabWidget:GetFrontDataGameSource()

							if var_24_9 then
								arg_20_0.activeTabWidget:UpdateTitleDescAndCrossLaunchPrompt(arg_20_0, var_24_9)
							end

							if arg_20_0.activeTabWidget.SeasonalEventTitle and var_24_7.useAllChallengesTab then
								local var_24_10 = {
									button_ref = "button_dpad_up",
									priority = 1,
									helper_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/SEE_ALL_CH_KBM")),
									prompt_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/SEE_ALL_CH"))
								}

								arg_20_0.activeTabWidget.SeasonalEventTitle.SeasonalEventAllChallengesPrompts:SetupPromptsData(arg_20_0, var_24_10)
							end

							if arg_20_0.activeTabWidget.howToPrompt and var_24_7.useTitleHowTo then
								local var_24_11 = {
									button_ref = "button_alt1",
									priority = 1,
									helper_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/HOW_DOES_IT_WORK_KBM")),
									prompt_text = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/HOW_DOES_IT_WORK_ALT1"))
								}

								if var_24_7.useTugOfWarView then
									var_24_11.containerAlignment = LUI.Alignment.Center
								end

								arg_20_0.activeTabWidget.howToPrompt:SetupPromptsData(arg_20_0, var_24_11)
							end
						end

						if arg_20_0.activeTabWidget.SquareProgressPanel and var_24_7.showPreviewButtonInFooter then
							arg_20_0:AddButtonPrompt({
								priority = 2,
								button_ref = "button_r3",
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_KBM")
							})
						end

						if CONDITIONS.SeasonalEventHasParticipationChallenges() then
							arg_20_0:AddButtonPrompt({
								gamepad_only = true,
								button_ref = "button_alt1",
								priority = 1,
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_KBM")
							})
							arg_20_0:RemoveButtonPrompt({
								side = "left",
								button_ref = "button_primary",
								helper_text = ""
							})
						elseif var_24_7.useTugOfWarView then
							arg_20_0:AddButtonPrompt({
								gamepad_only = true,
								button_ref = "button_primary",
								priority = 4,
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_KBM")
							})
						elseif not CONDITIONS.SeasonalEventDisablesFTUE() and CONDITIONS.IsEventTabMoreInfoEnabled() and not var_24_7.useTitleHowTo then
							arg_20_0:AddButtonPrompt({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 4,
								helper_text = Engine.CBBHFCGDIC("MENU/MORE_INFO")
							})
							arg_20_0.bindButton:registerEventHandler("button_left_trigger", function(arg_25_0, arg_25_1)
								LUI.FlowManager.RequestPopupMenu(arg_20_0, "SeasonalEventDetailsPopup", true, arg_22_1, false, {
									openedFromMenu = true
								})
							end)
						end

						if var_24_7.uiToggleSequences then
							arg_20_0:AddButtonPrompt({
								priority = 5,
								button_ref = "button_right_trigger",
								helper_text = Engine.CBBHFCGDIC("SEASONAL_EVENT/TOGGLE_UI")
							})
						end
					else
						LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = nil

						arg_20_0:RemoveButtonPrompt({
							side = "left",
							button_ref = "button_alt2",
							helper_text = ""
						})

						if iter_20_2.menuName == "WZOperatorSelect" then
							arg_20_0.activeTabWidget:UpdateButtonPrompts(arg_22_1)
						else
							arg_20_0:AddButtonPrompt({
								side = "left",
								button_ref = "button_primary",
								priority = 2,
								helper_text = var_24_0
							})
						end
					end

					local var_24_12 = arg_20_0:getParent()

					if var_24_12 and var_24_12.LobbyStatus then
						if var_24_12.id == "MPPublicLobby" then
							if arg_20_0.activeTabWidget.UpdateParentLobbyStatus then
								arg_20_0.activeTabWidget:UpdateParentLobbyStatus()
							else
								var_24_12.LobbyStatus:SetAlpha(1)
							end

							arg_20_0.ShowBlackoutOverlayIfRequired(arg_20_0, arg_22_1)
						elseif var_24_12.id == "TournamentLoadingScreen" or var_24_12.id == "TournamentMatchmaking" then
							if iter_20_2.menuName == "TournamentLoading" then
								var_24_12.LobbyStatus:SetAlpha(0)
							else
								var_24_12.LobbyStatus:SetAlpha(1)
							end
						end
					end

					if iter_20_2.menuName == var_20_1 then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabPlay)
					elseif iter_20_2.menuName == "MPWeaponMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabWeapons)
					elseif var_0_1(iter_20_2.menuName) then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabOperators)

						if not Onboarding.Operators.WasCompleted(arg_20_0, arg_22_1) then
							if CONDITIONS.IsMagmaGameMode(arg_20_0) then
								LUI.FlowManager.RequestPopupMenu(arg_20_0, "onboardingpopup", true, arg_22_1, false, ONBOARDING_DATA.GetOnboardingWZOperatorData())
							else
								LUI.FlowManager.RequestPopupMenu(arg_20_0, "onboardingpopup", true, arg_22_1, false, ONBOARDING_DATA.GetOnboardingOperatorData())
							end

							Onboarding.Operators.MarkCompleted(arg_20_0, arg_22_1)
						end
					elseif iter_20_2.menuName == "BattlePassMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBattlepass)
					elseif iter_20_2.menuName == "SeasonalEventMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabSeasonalEvent)
					elseif iter_20_2.menuName == "ChallengeMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabChallenges)
					elseif iter_20_2.menuName == "MPStoreMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabStore)

						if var_20_0.useStandaloneStore then
							var_0_8(arg_20_0, arg_22_1, arg_22_2)
						end
					elseif iter_20_2.menuName == "MPBarracksMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBarracks)
					elseif iter_20_2.menuName == "CareerMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabCareer)
					end

					if Engine.JEDFGECDJ() > 1 and (iter_20_2.menuName == "BattlePassMenu" or iter_20_2.menuName == "MPStoreMenu") then
						var_0_6(arg_20_0, true, arg_22_1)
					else
						var_0_6(arg_20_0, false)
					end

					var_0_2(arg_20_0, arg_22_1)
				end

				if iter_20_2.isStoreTab or iter_20_2.isWZOperatorTab then
					arg_20_0.PartyWidget:SetAlpha(0, 200)
					arg_20_0.PartyWidget:EnableSocialMenu(false)
					ACTIONS.AnimateSequence(arg_20_0, "PlayerTextOffsetStore")
				else
					arg_20_0.PartyWidget:SetAlpha(1, 200)
					arg_20_0.PartyWidget:EnableSocialMenu(true)
					ACTIONS.AnimateSequence(arg_20_0, "PlayerTextOffsetDefault")
				end

				if not arg_20_0._isMenuInitialized then
					arg_20_0:addEventHandler("menu_create", function(arg_26_0, arg_26_1)
						arg_26_0._isMenuInitialized = true

						var_22_3(arg_26_0)
					end)
				end

				var_22_3(arg_20_0)
				arg_20_0:processEvent({
					name = "focus_tab_changed",
					tabName = iter_20_2.menuName
				})
			end,
			buildSpecificTab = iter_20_2.buildSpecificTab,
			isStoreTab = iter_20_2.isStoreTab,
			isEventTab = iter_20_2.isEventTab,
			isBattlePassTab = iter_20_2.isBattlePassTab,
			isWZOperatorTab = iter_20_2.isWZOperatorTab,
			hasRestrictionIcon = iter_20_2.hasRestrictionIcon
		})
	end

	arg_20_0.Tabs:SetTabs(var_20_8)

	arg_20_0._tabsData = var_20_3
	arg_20_0._tabIndexMap = var_20_4

	var_0_2(arg_20_0, arg_20_1)

	var_20_0.tabsInitialized = true
end

local function var_0_13(arg_27_0, arg_27_1)
	if not arg_27_1 then
		return
	end

	LUI.FlowManager.GetScopedData(arg_27_0).onRestoreFocusOptions = {
		tabToFocus = arg_27_1.tabToFocus,
		buttonToFocus = arg_27_1.buttonToFocus,
		bundleToFocus = arg_27_1.bundleToFocus,
		triggerButtonAction = arg_27_1.triggerButtonAction,
		openMenuFunction = arg_27_1.openMenuFunction,
		bundleIDToGift = arg_27_1.bundleIDToGift,
		openGiftingPopupType = arg_27_1.openGiftingPopupType
	}

	if CONDITIONS.IsSeasonalEventTabActive() then
		local var_27_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if var_27_0 then
			var_27_0.onRestoreFocusOptions = {
				overrideTabToFocus = arg_27_1.tabToFocus
			}
		end
	end
end

local function var_0_14(arg_28_0, arg_28_1)
	local var_28_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.dov2nukelunched")

	if var_28_0:GetValue(arg_28_1) then
		LUI.FlowManager.RequestPopupMenu(arg_28_0, "BRFullScreenOverlayPopup", true, arg_28_1, false)
		var_28_0:SetValue(arg_28_1, false)
	end
end

local function var_0_15(arg_29_0, arg_29_1)
	return function(arg_30_0, arg_30_1)
		local var_30_0 = tonumber(BATTLEPASS.GetItemCost(arg_29_1))

		if var_30_0 > Commerce.CEDDCGHIGA(arg_30_1.controller, LOOT.CurrencyIDs.COD_POINTS) then
			local var_30_1 = {
				showBalance = true,
				controllerIndex = arg_30_1.controller,
				currencyID = LOOT.CurrencyIDs.COD_POINTS,
				currencyAmount = var_30_0
			}

			STORE.EnterStore(arg_30_1.controller, arg_30_0:GetCurrentMenu().id, arg_30_0.id, var_30_1, "PurchaseCODPointsPopup", true)
		elseif arg_29_0._recipentXuidString then
			local var_30_2 = arg_29_0._recipentXuidString

			LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchasePopup")

			local var_30_3 = BATTLEPASS.GetItemSKU(arg_29_1)

			LUI.ToastManager.GetInstance():QueueGiftRecipientXuid(arg_29_0._recipentXuidString)

			local var_30_4 = 1

			Gifting.DAFDBDBEJC(arg_30_1.controller, var_30_3, var_30_4, arg_29_0._recipentXuidString)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_29_0._controllerIndex, false, {
				purchaseGift = true
			}, nil, false, true)

			arg_29_0:Wait(1500).onComplete = function()
				LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

				local var_31_0 = {
					state = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_GIFTED,
					recipentXuidString = var_30_2
				}

				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_29_0._controllerIndex, false, var_31_0, nil, false, true)
			end
			arg_29_0._recipentXuidString = nil
		end
	end
end

local function var_0_16(arg_32_0, arg_32_1)
	local function var_32_0(arg_33_0, arg_33_1)
		arg_33_0._recipentXuidString = arg_33_1
	end

	local function var_32_1()
		local var_34_0 = BATTLEPASS.GetPurchaseRef()
		local var_34_1 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, var_34_0, CSV.battlePassIDs.cols.sku)
		local var_34_2 = {
			sourceMenu = arg_32_0,
			battlePassSKU = var_34_1,
			giftingActionCallback = var_32_0
		}

		LUI.FlowManager.RequestPopupMenu(arg_32_0, "BattlePassPurchasePopup", true, arg_32_1, false, var_34_2)
	end

	arg_32_0.GetPurchaseAction = var_0_15
	arg_32_0._screenOpenedTime = Engine.DEIDGHDBHD()

	GIFT.StartFTUEFlow(arg_32_0, var_32_1)
end

local function var_0_17(arg_35_0, arg_35_1, arg_35_2)
	local function var_35_0(arg_36_0, arg_36_1)
		return function(arg_37_0)
			assert(arg_37_0)

			local var_37_0 = {
				bundleGiftInfo = arg_36_1,
				recipientXuidString = arg_37_0
			}

			LUI.FlowManager.RequestPopupMenu(nil, "GiftBundlePurchaseConfirmationPopup", true, arg_36_0, false, var_37_0)
		end
	end

	local var_35_1 = 0
	local var_35_2, var_35_3 = STORE.GetBundleCost(arg_35_1, arg_35_2)

	if var_35_3 and var_35_3 < var_35_2 then
		var_35_1 = var_35_3
	else
		var_35_1 = var_35_2
	end

	local var_35_4 = {
		currencyAmount = var_35_1,
		id = arg_35_2,
		name = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_35_2, CSV.bundleIDs.cols.name),
		titleImage = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_35_2, CSV.bundleIDs.cols.titleImage)
	}
	local var_35_5 = {
		controllerIndex = arg_35_1,
		bundleSKU = arg_35_2,
		selectedGifteeCallback = var_35_0(arg_35_1, var_35_4)
	}

	local function var_35_6()
		local var_38_0 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_35_5)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_35_1, false, {
			flyInLeftNarrow = true,
			widget = var_38_0
		})
	end

	GIFT.StartFTUEFlow(arg_35_0, var_35_6)
end

local function var_0_18(arg_39_0, arg_39_1, arg_39_2)
	assert(arg_39_0.MenuTitle)
	assert(arg_39_0.Tabs)
	assert(arg_39_0.Nat)
	assert(arg_39_0.JoinableStatus)
	assert(arg_39_0.TabBacker)
	arg_39_0.Tabs:SetAlignment(LUI.Alignment.Left)

	arg_39_0.SetupTabs = var_0_12
	arg_39_0.GetTabIndexByWidgetName = var_0_9
	arg_39_0.SetupOnRestoreFocusOverride = var_0_13
	arg_39_0.SetupBackButtonHandler = var_0_4
	arg_39_0.UpdateJoinableStatus = var_0_3
	arg_39_0.UpdateTabBreadcrumbs = var_0_2
	arg_39_0.ShowBlackoutOverlayIfRequired = var_0_14
	arg_39_0.OpenGiftBundleToFriendPopup = var_0_17
	arg_39_0.OpenGiftBattlePassToFriendPopup = var_0_16
	arg_39_0._controllerIndex = arg_39_1

	CoD.CheckAndApplyResetSeasonalPlayerData(arg_39_1)
	CoD.CheckAndApplySeasonalEventPlayerData(arg_39_0, arg_39_1)

	local var_39_0 = Dvar.CFHDGABACF("lui_tabs_menu_default_focus_tab_num")

	if var_39_0 and var_39_0 > 0 then
		LUI.FlowManager.GetScopedData("MainMenu").tabIndexToFocus = var_39_0 - 1
	end

	arg_39_0:setPriority(-1)

	local function var_39_1(arg_40_0, arg_40_1)
		local var_40_0 = LUI.FlowManager.GetScopedData(arg_39_0)
		local var_40_1 = LUI.FlowManager.GetScopedData("MainMenu")
		local var_40_2 = var_40_0.onRestoreFocusOptions

		if var_40_2 then
			local var_40_3 = var_40_2.tabToFocus

			if var_40_3 then
				local var_40_4 = var_0_9(arg_39_0, var_40_3)

				if var_40_4 then
					arg_39_0.Tabs:FocusTab(arg_39_1, var_40_4 - 1)

					if arg_39_0.activeTabWidget.FocusButtonByName and var_40_2.buttonToFocus then
						arg_39_0.activeTabWidget:FocusButtonByName(var_40_2.buttonToFocus)
					elseif arg_39_0.activeTabWidget.FocusBundleByID and var_40_2.bundleToFocus then
						arg_39_0.activeTabWidget:FocusBundleByID(var_40_2.bundleToFocus, var_40_2.triggerButtonAction, var_40_2.openGiftingPopup)
					elseif var_40_3 == "BattlePassMenu" and var_40_2.openGiftingPopup then
						arg_39_0.activeTabWidget:OpenGiftingPopup()
					end

					if var_40_2.openMenuFunction then
						var_40_2.openMenuFunction()
					end
				end
			elseif var_40_2.openGiftingPopupType == "bundle" and var_40_2.bundleIDToGift then
				arg_39_0:OpenGiftBundleToFriendPopup(arg_39_1, var_40_2.bundleIDToGift)
			elseif var_40_2.openGiftingPopupType == "battlepass" then
				arg_39_0:OpenGiftBattlePassToFriendPopup(arg_39_1)
			end

			var_40_0.onRestoreFocusOptions = nil

			return true
		elseif var_40_1.tabIndexToFocus then
			arg_39_0.Tabs:FocusTab(arg_39_1, var_40_1.tabIndexToFocus)

			var_40_1.tabIndexToFocus = nil
		end

		arg_39_0.ShowBlackoutOverlayIfRequired(arg_39_0, arg_39_1)
	end

	arg_39_0.Tabs:addEventHandler("restore_focus", var_39_1)
	arg_39_0:addEventHandler("gain_focus", var_39_1)

	if CONDITIONS.IsMagmaGameMode() then
		local var_39_2 = LUI.FlowManager.IsInStack("BRMainMenuStore")
		local var_39_3 = Engine.CFHBIHABCB(arg_39_1)

		if var_39_2 and var_39_3 then
			arg_39_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
		else
			arg_39_0.MenuTitle:SetWarzoneTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
		end
	elseif CONDITIONS.IsCoreMultiplayer(arg_39_0) then
		arg_39_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	elseif CONDITIONS.IsThirdGameMode(arg_39_0) then
		arg_39_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TAC_OPS"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	end

	arg_39_0:addEventHandler("menu_create", function(arg_41_0, arg_41_1)
		local var_41_0 = Lobby.DGDAAFJDBI()

		if var_41_0 then
			if var_41_0 == "NETWORK_STRICT" and Dvar.IBEGCHEFE("MMONQLOPSO") == false then
				LUI.FlowManager.RequestPopupMenu(arg_39_0, "strict_nat_warning", true, arg_39_1, false)
				Dvar.DHEGHJJJHI("MMONQLOPSO", true)
			end

			local var_41_1 = Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", var_41_0)

			assert(arg_39_0.Nat)
			arg_39_0.Nat:setText(var_41_1)
		end
	end)

	arg_39_0.bindButton = LUI.UIBindButton.new()
	arg_39_0.bindButton.id = "selfBindButton"

	arg_39_0:addElement(arg_39_0.bindButton)
	var_0_11(arg_39_0)

	local function var_39_4()
		local var_42_0 = arg_39_0.Tabs:GetCurrentTab()
		local var_42_1 = arg_39_0._tabsData[var_42_0.index + 1].menuName
		local var_42_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
		local var_42_3 = var_42_2:GetValue(arg_39_1)

		if Engine.JEDFGECDJ() > 1 then
			if var_42_1 == "BattlePassMenu" or var_42_1 == "MPStoreMenu" then
				var_0_6(arg_39_0, true, var_42_3)
			end

			local var_42_4 = Engine.CGHHDHCDEC(var_42_3)

			if var_0_5(arg_39_0, var_42_1) then
				arg_39_0:AddButtonPrompt({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_42_4 + 1)
				})
			else
				arg_39_0:RemoveButtonPrompt({
					helper_text = "",
					button_ref = "button_left_trigger"
				})
			end
		else
			if var_42_1 == "BattlePassMenu" or var_42_1 == "MPStoreMenu" then
				var_0_6(arg_39_0, false)
				var_42_2:SetValue(arg_39_1, 0)
			end

			if var_0_5(arg_39_0, var_42_1) then
				var_42_2:SetValue(arg_39_1, 0)
			end

			arg_39_0:RemoveButtonPrompt({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
		end

		var_0_7(arg_39_0, var_42_1, false, arg_39_1)
	end

	local function var_39_5()
		local var_43_0 = arg_39_0.Tabs:GetCurrentTab()

		if var_43_0 then
			local var_43_1 = arg_39_0._tabsData[var_43_0.index + 1].menuName

			var_0_7(arg_39_0, var_43_1)
		end
	end

	local var_39_6 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_39_7 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.squadMembers.memberCount")

	arg_39_0:SubscribeToModel(var_39_6:GetModel(arg_39_1), var_39_4, true)
	arg_39_0:SubscribeToModel(var_39_7:GetModel(arg_39_1), var_39_5, true)

	local function var_39_8(arg_44_0, arg_44_1)
		local var_44_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_44_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_39_0:addAndCallEventHandler("onVideoChange", var_39_8)
	LAYOUT.AddAspectRatioFadeFrame(arg_39_0, arg_39_1)

	local var_39_9 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	if not var_39_9:GetValue(arg_39_1) then
		var_39_9:SetValue(arg_39_1, arg_39_1)
	end

	arg_39_0.Tabs:SetSendEventOnTabChange(true)
	arg_39_0:addEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_45_0, arg_45_1)
		assert(arg_45_1.index)
		arg_39_0.activeTabWidget:processEvent(arg_45_1)
		LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_45_1.controller)

		return true
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_39_0, "WZWipSetup")
	end
end

function MPTabsMenu(arg_46_0, arg_46_1)
	local var_46_0 = LUI.UIElement.new()

	var_46_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_46_0.id = "MPTabsMenu"
	var_46_0._animationSets = var_46_0._animationSets or {}
	var_46_0._sequences = var_46_0._sequences or {}

	local var_46_1 = arg_46_1 and arg_46_1.controllerIndex

	if not var_46_1 and not Engine.DDJFBBJAIG() then
		var_46_1 = var_46_0:getRootController()
	end

	assert(var_46_1)

	local var_46_2 = var_46_0
	local var_46_3
	local var_46_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_46_1
	})

	var_46_4.id = "TabBacker"

	var_46_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_46_0:addElement(var_46_4)

	var_46_0.TabBacker = var_46_4

	local var_46_5

	if CONDITIONS.IsUserSignedInDemonware(var_46_1) then
		local var_46_6 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_46_1
		})

		var_46_6.id = "MPPlayerDetails"

		var_46_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_46_0:addElement(var_46_6)

		var_46_0.MPPlayerDetails = var_46_6
	end

	local var_46_7
	local var_46_8 = LUI.UIText.new()

	var_46_8.id = "Nat"

	var_46_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_46_8:setText("", 0)
	var_46_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_46_8:SetAlignment(LUI.Alignment.Right)
	var_46_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_46_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -33, _1080p * -11)
	var_46_0:addElement(var_46_8)

	var_46_0.Nat = var_46_8

	local var_46_9
	local var_46_10 = LUI.UIText.new()

	var_46_10.id = "JoinableStatus"

	var_46_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_46_10:setText("", 0)
	var_46_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_46_10:SetAlignment(LUI.Alignment.Right)
	var_46_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_46_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -53, _1080p * -31)
	var_46_0:addElement(var_46_10)

	var_46_0.JoinableStatus = var_46_10

	local var_46_11
	local var_46_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_46_1
	})

	var_46_12.id = "MenuTitle"

	var_46_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), 0)
	var_46_12.Line:SetLeft(0, 0)
	var_46_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_46_0:addElement(var_46_12)

	var_46_0.MenuTitle = var_46_12

	local var_46_13
	local var_46_14 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_46_1
			})
		end,
		controllerIndex = var_46_1
	}
	local var_46_15 = LUI.TabManager.new(var_46_14)

	var_46_15.id = "Tabs"

	var_46_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 987, _1080p * 108, _1080p * 160)
	var_46_0:addElement(var_46_15)

	var_46_0.Tabs = var_46_15

	local var_46_16
	local var_46_17 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_46_1
	})

	var_46_17.id = "PartyWidget"

	var_46_17:SetAlpha(0, 0)
	var_46_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_46_0:addElement(var_46_17)

	var_46_0.PartyWidget = var_46_17

	local var_46_18
	local var_46_19 = LUI.UIImage.new()

	var_46_19.id = "PlayerTextBacker"

	var_46_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_46_19:SetAlpha(0, 0)
	var_46_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -302, _1080p * -96, _1080p * 190, _1080p * 218)
	var_46_0:addElement(var_46_19)

	var_46_0.PlayerTextBacker = var_46_19

	local var_46_20
	local var_46_21 = LUI.UIImage.new()

	var_46_21.id = "PlayerTextTexture"

	var_46_21:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_46_21:SetAlpha(0, 0)
	var_46_21:SetPixelGridEnabled(true)
	var_46_21:SetPixelGridContrast(0.5, 0)
	var_46_21:SetPixelGridBlockWidth(2, 0)
	var_46_21:SetPixelGridBlockHeight(2, 0)
	var_46_21:SetPixelGridGutterWidth(1, 0)
	var_46_21:SetPixelGridGutterHeight(1, 0)
	var_46_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -302, _1080p * -96, _1080p * 190, _1080p * 218)
	var_46_0:addElement(var_46_21)

	var_46_0.PlayerTextTexture = var_46_21

	local var_46_22
	local var_46_23 = LUI.UIStyledText.new()

	var_46_23.id = "PlayerText"

	var_46_23:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_46_23:SetAlpha(0, 0)
	var_46_23:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_46_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_46_23:SetWordWrap(false)
	var_46_23:SetAlignment(LUI.Alignment.Right)
	var_46_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_46_23:SetShadowRGBFromTable(SWATCHES.Reticles.White, 0)
	var_46_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -298, _1080p * -101, _1080p * 192, _1080p * 216)
	var_46_0:addElement(var_46_23)

	var_46_0.PlayerText = var_46_23

	local var_46_24

	if CONDITIONS.IsMagmaGameMode() then
		local var_46_25 = MenuBuilder.BuildRegisteredType("WZLookForPartySearchStatusTopper", {
			controllerIndex = var_46_1
		})

		var_46_25.id = "SearchStatusTopper"

		var_46_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 45, _1080p * 88)
		var_46_0:addElement(var_46_25)

		var_46_0.SearchStatusTopper = var_46_25
	end

	local function var_46_26()
		return
	end

	var_46_0._sequences.DefaultSequence = var_46_26

	local var_46_27
	local var_46_28 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_19:RegisterAnimationSequence("PlayerTextOn", var_46_28)

	local var_46_29 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_21:RegisterAnimationSequence("PlayerTextOn", var_46_29)

	local var_46_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_23:RegisterAnimationSequence("PlayerTextOn", var_46_30)

	local function var_46_31()
		var_46_19:AnimateSequence("PlayerTextOn")
		var_46_21:AnimateSequence("PlayerTextOn")
		var_46_23:AnimateSequence("PlayerTextOn")
	end

	var_46_0._sequences.PlayerTextOn = var_46_31

	local var_46_32
	local var_46_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -54
		}
	}

	var_46_10:RegisterAnimationSequence("PlayerTextOff", var_46_33)

	local var_46_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_19:RegisterAnimationSequence("PlayerTextOff", var_46_34)

	local var_46_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_21:RegisterAnimationSequence("PlayerTextOff", var_46_35)

	local var_46_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_23:RegisterAnimationSequence("PlayerTextOff", var_46_36)

	local function var_46_37()
		var_46_10:AnimateSequence("PlayerTextOff")
		var_46_19:AnimateSequence("PlayerTextOff")
		var_46_21:AnimateSequence("PlayerTextOff")
		var_46_23:AnimateSequence("PlayerTextOff")
	end

	var_46_0._sequences.PlayerTextOff = var_46_37

	local var_46_38
	local var_46_39 = {
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

	var_46_19:RegisterAnimationSequence("PlayerTextOffsetStore", var_46_39)

	local var_46_40 = {
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

	var_46_21:RegisterAnimationSequence("PlayerTextOffsetStore", var_46_40)

	local var_46_41 = {
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

	var_46_23:RegisterAnimationSequence("PlayerTextOffsetStore", var_46_41)

	local function var_46_42()
		var_46_19:AnimateSequence("PlayerTextOffsetStore")
		var_46_21:AnimateSequence("PlayerTextOffsetStore")
		var_46_23:AnimateSequence("PlayerTextOffsetStore")
	end

	var_46_0._sequences.PlayerTextOffsetStore = var_46_42

	local var_46_43
	local var_46_44 = {
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

	var_46_15:RegisterAnimationSequence("PlayerTextOffsetDefault", var_46_44)

	local var_46_45 = {
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

	var_46_19:RegisterAnimationSequence("PlayerTextOffsetDefault", var_46_45)

	local var_46_46 = {
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

	var_46_21:RegisterAnimationSequence("PlayerTextOffsetDefault", var_46_46)

	local var_46_47 = {
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

	var_46_23:RegisterAnimationSequence("PlayerTextOffsetDefault", var_46_47)

	local function var_46_48()
		var_46_15:AnimateSequence("PlayerTextOffsetDefault")
		var_46_19:AnimateSequence("PlayerTextOffsetDefault")
		var_46_21:AnimateSequence("PlayerTextOffsetDefault")
		var_46_23:AnimateSequence("PlayerTextOffsetDefault")
	end

	var_46_0._sequences.PlayerTextOffsetDefault = var_46_48

	local var_46_49
	local var_46_50 = {
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

	var_46_15:RegisterAnimationSequence("WZWipSetup", var_46_50)

	local function var_46_51()
		var_46_15:AnimateSequence("WZWipSetup")
	end

	var_46_0._sequences.WZWipSetup = var_46_51

	var_0_18(var_46_0, var_46_1, arg_46_1)

	return var_46_0
end

MenuBuilder.registerType("MPTabsMenu", MPTabsMenu)
LockTable(_M)
