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
		LOOT.itemTypes.GESTURES
	}
}

local function var_0_1(arg_1_0, arg_1_1)
	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = false

		for iter_2_0, iter_2_1 in pairs(arg_2_1) do
			if LOOT.IsCategoryNew(arg_2_0, iter_2_1) then
				var_2_0 = true

				break
			end
		end

		return var_2_0
	end

	local function var_1_1(arg_3_0, arg_3_1)
		local var_3_0 = arg_1_0:GetTabIndexByWidgetName(arg_3_0)
		local var_3_1 = var_3_0 and arg_1_0.Tabs:GetTabAtIndex(var_3_0)

		if var_3_1 and var_3_1.SetBreadcrumb then
			var_3_1:SetBreadcrumb(arg_3_1)
		end
	end

	local var_1_2 = var_1_0(arg_1_1, var_0_0.NonWeaponTypes)
	local var_1_3 = (CONDITIONS.IsDevelopmentBuild() or PROGRESSION.IsUnlocked(arg_1_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef)) and LOOT.LoadoutHasNewLoot(arg_1_1)
	local var_1_4 = #WEAPON.GetNewWeaponIDs(arg_1_1, {
		getBaseWeapon = false
	}) > 0

	arg_1_0.isWeaponTabNew = var_1_2 or var_1_3 or var_1_4
	arg_1_0.isOperatorTypeNew = var_1_0(arg_1_1, var_0_0.OperatorTypes)
	arg_1_0.isBarracksNew = var_1_0(arg_1_1, var_0_0.BarracksTypes)
	arg_1_0.isBattlePassNew = BATTLEPASS.HasNewItems(arg_1_1)
	arg_1_0.storeHasNewItem, arg_1_0._storeHasFreeItem, arg_1_0.limitedTimeItem = STORE.HasNewAndFreeAndLimitedTimeItems(arg_1_1)

	var_1_1("MPWeaponMenu", arg_1_0.isWeaponTabNew)
	var_1_1("MPOperatorMenu", arg_1_0.isOperatorTypeNew)
	var_1_1("MPBarracksMenu", arg_1_0.isBarracksNew)
	var_1_1("BattlePassMenu", arg_1_0.isBattlePassNew)

	local var_1_5 = arg_1_0:GetTabIndexByWidgetName("MPStoreMenu")
	local var_1_6 = var_1_5 and arg_1_0.Tabs:GetTabAtIndex(var_1_5)

	if var_1_6 and var_1_6.SetBreadcrumb then
		var_1_6:SetBreadcrumb(arg_1_0.storeHasNewItem)

		if arg_1_0.limitedTimeItem then
			var_1_6:SetLimitedTimeBanner(arg_1_0.limitedTimeItem)
		else
			var_1_6:SetFreeBanner(arg_1_0._storeHasFreeItem)
		end
	end

	local var_1_7 = arg_1_0:GetTabIndexByWidgetName("BattlePassMenu")
	local var_1_8 = var_1_7 and arg_1_0.Tabs:GetTabAtIndex(var_1_7)

	if var_1_8 then
		local var_1_9 = BATTLEPASS.IsOwned(arg_1_1)

		if BATTLEPASS.IsTierSkipGiftActive(arg_1_1) and not var_1_9 then
			local var_1_10 = tonumber(BATTLEPASS.GetTierSkipGiftTimer())

			var_1_8:SetPromoBanner(var_1_10, false)
		elseif CONDITIONS.IsTierSaleEnabled() and var_1_9 then
			local var_1_11 = Dvar.DHEEJCCJBH("MQTOPKPMRS")

			var_1_8:SetPromoBanner(var_1_11, true)
		else
			var_1_8:SetSeasonBanner()
		end
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = Lobby.BCBBBABFFB()

	if var_4_0 == CoD.PartyPrivacySetting.CLOSED then
		arg_4_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_CLOSED"))
	elseif var_4_0 == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		arg_4_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS"))
	elseif var_4_0 == CoD.PartyPrivacySetting.INVITE_ONLY then
		arg_4_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_INVITE_ONLY"))
	else
		arg_4_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_PUBLIC"))
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	if arg_5_1 ~= nil then
		arg_5_0._backButtonHandlerSet = true

		if not arg_5_0.bindButton then
			arg_5_0.bindButton = LUI.UIBindButton.new()
			arg_5_0.bindButton.id = "selfBindButton"

			arg_5_0:addElement(arg_5_0.bindButton)
		end

		arg_5_0.bindButton:registerEventHandler("button_secondary", function(arg_6_0, arg_6_1)
			local var_6_0 = arg_5_0.activeTabWidget
			local var_6_1 = true

			if var_6_0 and var_6_0.BackButtonOverride then
				var_6_1 = var_6_0.BackButtonOverride(arg_6_0, arg_6_1)
			end

			if var_6_1 then
				arg_5_1(arg_6_0, arg_6_1)
			end
		end)
	end
end

local function var_0_4(arg_7_0, arg_7_1)
	return arg_7_1 == "MPWeaponMenu" or arg_7_1 == "MPOperatorMenu" or arg_7_1 == "MPBarracksMenu"
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 and arg_8_2 then
		arg_8_0.PlayerText:setText(Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_8_2)))

		local var_8_0 = 6 * _1080p
		local var_8_1 = LAYOUT.GetTextWidth(arg_8_0.PlayerText) + var_8_0
		local var_8_2 = arg_8_0.PlayerText:GetCurrentAnchorsAndPositions()

		arg_8_0.PlayerTextBacker:SetLeft(var_8_2.right - var_8_1)
		arg_8_0.PlayerTextTexture:SetLeft(var_8_2.right - var_8_1)
		ACTIONS.AnimateSequence(arg_8_0, "PlayerTextOn")
	else
		ACTIONS.AnimateSequence(arg_8_0, "PlayerTextOff")
	end
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	local function var_9_0()
		if arg_9_0._challengesPromptInWidget then
			arg_9_0:AddButtonHelperText({
				button_ref = "button_alt1",
				helper_text = "",
				container = arg_9_0._challengesPrompt
			})

			arg_9_0._challengesPromptInWidget = false

			return true
		end
	end

	if arg_9_1 == "MPPlayMenu" or arg_9_1 == "BRPlayMenu" or arg_9_1 == "CPPlayMenu" then
		local var_9_1 = arg_9_0.activeTabWidget
		local var_9_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count"):GetValue(controllerIndex)

		arg_9_0._challengesPrompt = var_9_1.Challenges:GetPromptContainer()

		if var_9_2 and var_9_2 > 1 then
			var_9_0()
			arg_9_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt1",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT")
			})
		else
			arg_9_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt1",
				helper_text = ""
			})
			arg_9_0:AddButtonHelperText({
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT"),
				container = arg_9_0._challengesPrompt
			})

			arg_9_0._challengesPromptInWidget = true
		end

		arg_9_0._xpNotificationPrompt = var_9_1.DoubleXPNotifications:GetPromptContainer()

		arg_9_0:RemoveButtonHelperText("button_l3", "right")
		arg_9_0:AddButtonHelperText({
			button_ref = "button_l3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TOKENS"),
			container = arg_9_0._xpNotificationPrompt,
			containerAlignment = LUI.Alignment.Right
		})

		if var_9_1.UpdateChallengesVisibility then
			var_9_1:UpdateChallengesVisibility(var_9_2 <= 1, arg_9_2)
		end

		arg_9_0.bindButton:registerEventHandler("button_alt1", function(arg_11_0, arg_11_1)
			if not Engine.DBAEJAHFGJ(arg_11_1.controller) then
				if CONDITIONS.IsChallengeTabEnabled() then
					Challenge.FocusTab(arg_11_0, arg_11_1)
				else
					LUI.FlowManager.RequestAddMenu("BarracksChallenges", true, arg_11_1.controller, false, {}, true)
				end
			else
				LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_11_1.controller, false)
			end
		end)
		Lobby.DisplayNvidiaHighlightsButton(arg_9_0, "MW_Highlights")
	elseif arg_9_1 ~= "LobbyFlowWidget" then
		if not var_9_0() then
			arg_9_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt1",
				helper_text = ""
			})
		end

		if arg_9_0._xpNotificationPrompt then
			arg_9_0:AddButtonHelperText({
				button_ref = "button_l3",
				helper_text = "",
				container = arg_9_0._xpNotificationPrompt,
				containerAlignment = LUI.Alignment.Right
			})

			arg_9_0._xpNotificationPrompt = nil
		end

		arg_9_0:RemoveButtonHelperText("button_right_stick", "left")
		arg_9_0.bindButton:registerEventHandler("button_right_stick", nil)
		arg_9_0.bindButton:registerEventHandler("button_alt1", nil)
	end

	if (arg_9_1 == "MPStoreMenu" or arg_9_1 == "BattlePassMenu") and Dvar.IBEGCHEFE("OLNMSNSTKS") then
		arg_9_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_l3",
			priority = 4,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPORT_A_CREATOR")
		})
	else
		arg_9_0:RemoveButtonHelperText("button_left_stick", "left")
	end

	if Dvar.IBEGCHEFE("MOSNKSLTKM") and arg_9_1 ~= "MPStoreMenu" and arg_9_1 ~= "BattlePassMenu" then
		if arg_9_1 == "MPBarracksMenu" then
			if arg_9_0.isBarracksNew then
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLEAR_NEW", "LUA_MENU/BARRACKS")
				})
			else
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = ""
				})
			end
		elseif arg_9_1 == "MPOperatorMenu" then
			if arg_9_0.isOperatorTypeNew then
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLEAR_NEW", "LUA_MENU/OPERATORS")
				})
			else
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = ""
				})
			end
		elseif arg_9_1 == "MPWeaponMenu" then
			if arg_9_0.isWeaponTabNew then
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLEAR_NEW", "LUA_MENU/WEAPONS")
				})
			else
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = ""
				})
			end
		elseif arg_9_1 ~= "MPPlayMenu" and arg_9_1 ~= "BRPlayMenu" then
			arg_9_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_l3",
				helper_text = ""
			})
		end
	end

	if arg_9_1 == "LobbyFlowWidget" or arg_9_1 == "CPPlayMenu" or arg_9_1 == "CPPublicLobbyPlayMenu" then
		arg_9_0._xpNotificationPrompt = arg_9_0.activeTabWidget.DoubleXPNotifications:GetPromptContainer()

		arg_9_0:AddButtonHelperText({
			button_ref = "button_l3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_TOKENS"),
			container = arg_9_0._xpNotificationPrompt,
			containerAlignment = LUI.Alignment.Right
		})
		arg_9_0:RemoveButtonHelperText("button_right_stick", "left")

		if Lobby.GetCurrentNumLobbyMembers(controllerIndex) > 1 and Lobby.BBDICGHE() then
			arg_9_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_r3",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
			})

			arg_9_0._allPlayersMuted = false

			arg_9_0.bindButton:addEventHandler("button_right_stick", function(arg_12_0, arg_12_1)
				arg_9_0._allPlayersMuted = not arg_9_0._allPlayersMuted

				local var_12_0 = arg_9_0._allPlayersMuted and "LUA_MENU/UNMUTE_ALL" or "LUA_MENU/MUTE_ALL"

				arg_9_0:RemoveButtonHelperText("button_r3", "left")
				arg_9_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_r3",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC(var_12_0)
				})
				arg_9_0:dispatchEventToAllChildren({
					name = "lobby_mute_event",
					controllerIndex = controllerIndex
				})
				Lobby.BFGAACEHBH(arg_12_1.controller, arg_9_0._allPlayersMuted)

				return true
			end)
		else
			arg_9_0:RemoveButtonHelperText("button_r3", "left")
		end
	end

	if arg_9_1 == "MPStoreMenu" and arg_9_0._xpNotificationPrompt then
		arg_9_0:AddButtonHelperText({
			button_ref = "button_l3",
			helper_text = "",
			container = arg_9_0._xpNotificationPrompt
		})

		arg_9_0._xpNotificationPrompt = nil
	end
end

local function var_0_7(arg_13_0, arg_13_1)
	arg_13_0.Tabs:HideTabs()
	arg_13_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))

	if arg_13_0.PartyWidget then
		arg_13_0.PartyWidget:closeTree()

		arg_13_0.PartyWidget = nil
	end
end

local function var_0_8(arg_14_0, arg_14_1)
	return arg_14_0._tabIndexMap[arg_14_1]
end

local function var_0_9(arg_15_0)
	return arg_15_0 == "LobbyFlowWidget" or arg_15_0 == "CPPlayMenu" or arg_15_0 == "CPPublicLobbyPlayMenu" or arg_15_0 == "MPPlayMenu" or arg_15_0 == "BRPlayMenu"
end

local function var_0_10(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = LUI.FlowManager.GetScopedData(arg_16_0)
	local var_16_1 = arg_16_2 and arg_16_2.firstTabWidget
	local var_16_2

	if var_16_1 == nil then
		if CONDITIONS.IsMagmaGameMode() then
			var_16_1 = "BRPlayMenu"
		elseif CONDITIONS.IsCoreMultiplayer() then
			var_16_1 = "MPPlayMenu"
		elseif CONDITIONS.IsThirdGameMode() then
			var_16_1 = "CPPlayMenu"
		end
	end

	arg_16_0._isMenuInitialized = false

	local var_16_3 = {}
	local var_16_4 = {}

	var_16_3[#var_16_3 + 1] = {
		name = Engine.CBBHFCGDIC("LUA_MENU/PLAY"),
		menuName = var_16_1
	}
	var_16_4[var_16_1] = #var_16_3

	if var_16_1 == "TournamentLobbyFlow" then
		arg_16_0.MenuTitle:SetAlpha(0)
	end

	var_16_3[#var_16_3 + 1] = {
		menuName = "MPWeaponMenu",
		hasRestrictionIcon = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/WEAPONS"),
		disabled = not Dvar.IBEGCHEFE("LORQPPPMT")
	}
	var_16_4.MPWeaponMenu = #var_16_3
	var_16_3[#var_16_3 + 1] = {
		menuName = "MPOperatorMenu",
		name = Engine.CBBHFCGDIC("LUA_MENU/OPERATORS"),
		disabled = not Dvar.IBEGCHEFE("LSPTSOQPPT")
	}
	var_16_4.MPOperatorMenu = #var_16_3

	if CONDITIONS.IsChallengeTabEnabled() then
		var_16_3[#var_16_3 + 1] = {
			menuName = "ChallengeMenu",
			name = Engine.CBBHFCGDIC("MENU/CHALLENGES")
		}
		var_16_4.ChallengeMenu = #var_16_3
	end

	if not CONDITIONS.IsWeGameGovBanned() then
		var_16_3[#var_16_3 + 1] = {
			menuName = "MPBarracksMenu",
			name = Engine.CBBHFCGDIC("LUA_MENU/BARRACKS"),
			disabled = not Dvar.IBEGCHEFE("NPKSLQQPMP")
		}
		var_16_4.MPBarracksMenu = #var_16_3
	end

	if CONDITIONS.IsBattlePassEnabled() then
		var_16_3[#var_16_3 + 1] = {
			isStoreTab = true,
			menuName = "BattlePassMenu",
			isBattlePassTab = true,
			name = Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS")
		}
		var_16_4.BattlePassMenu = #var_16_3
		var_16_2 = #var_16_3
	end

	if CONDITIONS.IsStoreAllowed() then
		var_16_3[#var_16_3 + 1] = {
			isStoreTab = true,
			menuName = "MPStoreMenu",
			name = Engine.CBBHFCGDIC("LUA_MENU/STORE")
		}
		var_16_4.MPStoreMenu = #var_16_3
	end

	local var_16_5 = Dvar.IBEGCHEFE("NSNRTPNQPN")
	local var_16_6 = Dvar.CFHDGABACF("NTSLOQPLNT")

	if var_16_5 and var_16_6 < #var_16_3 + 1 and var_16_6 > 1 then
		local var_16_7 = {}

		for iter_16_0 = 1, #var_16_3 do
			var_16_7[iter_16_0] = var_16_3[iter_16_0]

			if var_16_6 == #var_16_3 then
				if iter_16_0 == var_16_2 then
					var_16_3[iter_16_0] = var_16_3[iter_16_0 + 1]
				elseif iter_16_0 == var_16_6 then
					var_16_3[iter_16_0] = var_16_7[var_16_2]
				end
			elseif iter_16_0 == var_16_6 then
				var_16_3[iter_16_0] = var_16_3[var_16_2]
			elseif iter_16_0 == var_16_2 + 1 then
				var_16_3[iter_16_0] = var_16_7[iter_16_0]
			elseif var_16_6 < iter_16_0 then
				var_16_3[iter_16_0] = var_16_7[iter_16_0 - 1]
			end

			var_16_4[var_16_3[iter_16_0].menuName] = iter_16_0
		end
	end

	arg_16_0:addEventHandler("store_menu_error", function(arg_17_0, arg_17_1)
		local var_17_0 = LUI.IsLastInputGamepad(arg_16_1) and FocusType.Gamepad or FocusType.MouseOver

		arg_16_0.Tabs:FocusTab(arg_16_1, 0, var_17_0)
	end)

	local var_16_8 = {}

	for iter_16_1, iter_16_2 in ipairs(var_16_3) do
		table.insert(var_16_8, {
			name = iter_16_2.name,
			disabled = iter_16_2.disabled,
			hasDefaultFocus = iter_16_1 - 1 == var_16_0.activeTabIndex,
			focusFunction = function(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
				local var_18_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
				local var_18_1 = var_18_0:GetValue(arg_18_1)

				if var_0_4(arg_16_0, iter_16_2.menuName) then
					arg_18_1 = var_18_1
				end

				if Engine.JEDFGECDJ() > 1 and (iter_16_2.menuName == "BattlePassMenu" or iter_16_2.menuName == "MPStoreMenu") then
					if not var_16_0.tabsInitialized or arg_18_3 ~= FocusType.MenuFlow then
						var_18_0:SetValue(arg_18_1, arg_18_1)
					else
						arg_18_1 = var_18_1
					end
				end

				if iter_16_2.menuName == "MPStoreMenu" and Engine.DBAEJAHFGJ(arg_18_1) then
					arg_16_0.Tabs:SetCurrentTabIndex(var_16_0.activeTabIndex)
					LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_18_1, false)

					return
				end

				if var_16_0.activeTabIndex and arg_18_2 == var_16_0.activeTabIndex and arg_16_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_16_0, var_16_0.activeTabIndex, "activeTabWidget", arg_18_2, arg_18_3, iter_16_2.menuName, {
					buildPriority = -1,
					controllerIndex = arg_18_1
				})

				var_16_0.activeTabIndex = arg_18_2

				arg_16_0:UpdateJoinableStatus(arg_18_1)

				if arg_16_0._backButtonHandlerSet and arg_18_2 ~= 0 then
					local var_18_2 = arg_16_0.activeTabWidget

					if var_18_2 and not var_18_2.BackButtonOverride then
						function var_18_2.BackButtonOverride(arg_19_0, arg_19_1)
							local var_19_0 = arg_19_1.qualifier ~= "keyboard" and arg_19_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

							arg_16_0.Tabs:FocusTab(arg_18_1, 0, var_19_0)

							return false
						end
					end
				end

				arg_16_0.Nat:SetAlpha(0)
				arg_16_0.JoinableStatus:SetAlpha(0)

				if iter_16_2.menuName == "MPPlayMenu" or menuName == "BRPlayMenu" then
					arg_16_0.Nat:SetAlpha(1)
					arg_16_0.JoinableStatus:SetAlpha(1)
				end

				if iter_16_2.menuName == "TournamentLobbyFlow" then
					-- block empty
				end

				local function var_18_3(arg_20_0)
					if not arg_20_0._isMenuInitialized then
						return
					end

					arg_16_0:GetCurrentMenu().signoutSplitscreen = iter_16_2.menuName == var_16_1

					if var_0_4(arg_20_0, iter_16_2.menuName) and Engine.JEDFGECDJ() > 1 then
						arg_20_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_left_trigger",
							priority = 3,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", Engine.CGHHDHCDEC(var_18_1) + 1)
						})
					elseif var_0_9(iter_16_2.menuName) then
						if AAR.IsMatchClientDataAvailable() then
							arg_20_0:AddButtonHelperText({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 3,
								helper_text = Engine.CBBHFCGDIC("LUA_MENU/GAME_SUMMARY")
							})
						else
							arg_20_0:AddButtonHelperText({
								helper_text = "",
								button_ref = "button_left_trigger"
							})
						end
					else
						arg_20_0:AddButtonHelperText({
							helper_text = "",
							button_ref = "button_left_trigger"
						})
					end

					if MLG.IsCDLActive(arg_18_1) and iter_16_2.menuName == "MPWeaponMenu" and CONDITIONS.IsConsoleGame(arg_16_0) then
						ACTIONS.AnimateSequence(arg_16_0.PartyWidget, "CDLon")
					else
						ACTIONS.AnimateSequence(arg_16_0.PartyWidget, "CDLoff")
					end

					local var_20_0
					local var_20_1

					if iter_16_2.menuName == "MPBattlenetStoreMenu" then
						var_20_0 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_CAPS")

						local var_20_2 = ""
					elseif iter_16_2.menuName == "LobbyFlowWidget" then
						var_20_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

						local var_20_3 = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
					elseif iter_16_2.menuName == "TournamentLobbyFlow" then
						var_20_0 = ""

						local var_20_4 = ""
					elseif iter_16_2.isStoreTab and not iter_16_2.isBattlePassTab then
						var_20_0 = Engine.CBBHFCGDIC("LUA_MENU/INSPECT")

						local var_20_5 = ""
					else
						var_20_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")

						local var_20_6 = ""
					end

					if iter_16_2.menuName == "BattlePassMenu" then
						arg_16_0.activeTabWidget._currentMenu = arg_16_0:GetCurrentMenu()

						arg_16_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_primary",
							priority = 2,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
						})
						arg_16_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_alt2",
							priority = 3,
							helper_text = Engine.CBBHFCGDIC("BATTLEPASS/MORE_INFO")
						})
					else
						LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = nil

						arg_16_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_primary",
							priority = 2,
							helper_text = var_20_0
						})
						arg_16_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_alt2",
							helper_text = ""
						})
					end

					local var_20_7 = arg_16_0:getParent()

					if var_20_7 and var_20_7.LobbyStatus then
						if var_20_7.id == "MPPublicLobby" then
							if arg_16_0.activeTabWidget.UpdateParentLobbyStatus then
								arg_16_0.activeTabWidget:UpdateParentLobbyStatus()
							else
								var_20_7.LobbyStatus:SetAlpha(1)
							end
						elseif var_20_7.id == "TournamentLoadingScreen" or var_20_7.id == "TournamentMatchmaking" then
							if iter_16_2.menuName == "TournamentLoading" then
								var_20_7.LobbyStatus:SetAlpha(0)
							else
								var_20_7.LobbyStatus:SetAlpha(1)
							end
						end
					end

					if iter_16_2.menuName == var_16_1 then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabPlay)
					elseif iter_16_2.menuName == "MPWeaponMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabWeapons)
					elseif iter_16_2.menuName == "MPOperatorMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabOperators)

						if not Onboarding.Operators.WasCompleted(arg_16_0, arg_18_1) then
							if CONDITIONS.IsMagmaGameMode(arg_16_0) then
								LUI.FlowManager.RequestPopupMenu(arg_16_0, "onboardingpopup", true, arg_18_1, false, ONBOARDING_DATA.GetOnboardingWZOperatorData())
							else
								LUI.FlowManager.RequestPopupMenu(arg_16_0, "onboardingpopup", true, arg_18_1, false, ONBOARDING_DATA.GetOnboardingOperatorData())
							end

							Onboarding.Operators.MarkCompleted(arg_16_0, arg_18_1)
						end
					elseif iter_16_2.menuName == "BattlePassMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBattlepass)
					elseif iter_16_2.menuName == "ChallengeMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabChallenges)
					elseif iter_16_2.menuName == "MPStoreMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabStore)

						if var_16_0.useStandaloneStore then
							var_0_7(arg_16_0, arg_18_2)
						end
					elseif iter_16_2.menuName == "MPBarracksMenu" then
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBarracks)
					end

					if Engine.JEDFGECDJ() > 1 and (iter_16_2.menuName == "BattlePassMenu" or iter_16_2.menuName == "MPStoreMenu") then
						var_0_5(arg_16_0, true, arg_18_1)
					else
						var_0_5(arg_16_0, false)
					end

					var_0_1(arg_16_0, arg_18_1)
					var_0_6(arg_16_0, iter_16_2.menuName, true)
				end

				if iter_16_2.isStoreTab then
					arg_16_0.PartyWidget:SetAlpha(0, 200)
					arg_16_0.PartyWidget:EnableSocialMenu(false)
					ACTIONS.AnimateSequence(arg_16_0, "PlayerTextOffsetStore")
				else
					arg_16_0.PartyWidget:SetAlpha(1, 200)
					arg_16_0.PartyWidget:EnableSocialMenu(true)
					ACTIONS.AnimateSequence(arg_16_0, "PlayerTextOffsetDefault")
				end

				if not arg_16_0._isMenuInitialized then
					arg_16_0:addEventHandler("menu_create", function(arg_21_0, arg_21_1)
						arg_21_0._isMenuInitialized = true

						var_18_3(arg_21_0)
					end)
				end

				var_18_3(arg_16_0)
				arg_16_0:processEvent({
					name = "focus_tab_changed",
					tabName = iter_16_2.menuName
				})
			end,
			buildSpecificTab = iter_16_2.buildSpecificTab,
			isStoreTab = iter_16_2.isStoreTab,
			isBattlePassTab = iter_16_2.isBattlePassTab,
			hasRestrictionIcon = iter_16_2.hasRestrictionIcon
		})
	end

	arg_16_0.Tabs:SetTabs(var_16_8)

	arg_16_0._tabsData = var_16_3
	arg_16_0._tabIndexMap = var_16_4

	var_0_1(arg_16_0, arg_16_1)

	var_16_0.tabsInitialized = true
end

local function var_0_11(arg_22_0, arg_22_1)
	if not arg_22_1 then
		return
	end

	LUI.FlowManager.GetScopedData(arg_22_0).onRestoreFocusOptions = {
		tabToFocus = arg_22_1.tabToFocus,
		buttonToFocus = arg_22_1.buttonToFocus,
		bundleToFocus = arg_22_1.bundleToFocus,
		triggerButtonAction = arg_22_1.triggerButtonAction,
		openMenuFunction = arg_22_1.openMenuFunction
	}
end

local function var_0_12(arg_23_0, arg_23_1, arg_23_2)
	assert(arg_23_0.MenuTitle)
	assert(arg_23_0.Tabs)
	assert(arg_23_0.Nat)
	assert(arg_23_0.JoinableStatus)
	assert(arg_23_0.TabBacker)
	arg_23_0.Tabs:SetAlignment(LUI.Alignment.Left)

	arg_23_0.SetupTabs = var_0_10
	arg_23_0.GetTabIndexByWidgetName = var_0_8
	arg_23_0.SetupOnRestoreFocusOverride = var_0_11
	arg_23_0.SetupBackButtonHandler = var_0_3
	arg_23_0.UpdateJoinableStatus = var_0_2
	arg_23_0.UpdateTabBreadcrumbs = var_0_1

	Engine.BBEEIGHJBA(CoD.Music.MainMPMusic)
	arg_23_0:setPriority(-1)

	local function var_23_0(arg_24_0, arg_24_1)
		local var_24_0 = LUI.FlowManager.GetScopedData(arg_23_0)
		local var_24_1 = LUI.FlowManager.GetScopedData("MainMenu")
		local var_24_2 = var_24_0.onRestoreFocusOptions

		if var_24_2 then
			local var_24_3 = var_24_2.tabToFocus

			if var_24_3 then
				local var_24_4 = var_0_8(arg_23_0, var_24_3)

				if var_24_4 then
					arg_23_0.Tabs:FocusTab(arg_23_1, var_24_4 - 1)

					if arg_23_0.activeTabWidget.FocusButtonByName and var_24_2.buttonToFocus then
						arg_23_0.activeTabWidget:FocusButtonByName(var_24_2.buttonToFocus)
					elseif arg_23_0.activeTabWidget.FocusBundleByID and var_24_2.bundleToFocus then
						arg_23_0.activeTabWidget:FocusBundleByID(var_24_2.bundleToFocus, var_24_2.triggerButtonAction)
					end

					if var_24_2.openMenuFunction then
						var_24_2.openMenuFunction()
					end
				end
			end

			var_24_0.onRestoreFocusOptions = nil

			return true
		elseif var_24_1.tabIndexToFocus then
			arg_23_0.Tabs:FocusTab(arg_23_1, var_24_1.tabIndexToFocus)

			var_24_1.tabIndexToFocus = nil
		end
	end

	arg_23_0.Tabs:addEventHandler("restore_focus", var_23_0)
	arg_23_0:addEventHandler("gain_focus", var_23_0)

	if CONDITIONS.IsMagmaGameMode() then
		local var_23_1 = LUI.FlowManager.IsInStack("BRMainMenuStore")
		local var_23_2 = Engine.CFHBIHABCB(arg_23_1)

		if var_23_1 and var_23_2 then
			arg_23_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
		else
			arg_23_0.MenuTitle:SetWarzoneTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
		end
	elseif CONDITIONS.IsCoreMultiplayer(arg_23_0) then
		arg_23_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	elseif CONDITIONS.IsThirdGameMode(arg_23_0) then
		arg_23_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TAC_OPS"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	end

	arg_23_0:addEventHandler("menu_create", function(arg_25_0, arg_25_1)
		local var_25_0 = Lobby.DGDAAFJDBI()

		if var_25_0 then
			if var_25_0 == "NETWORK_STRICT" and Dvar.IBEGCHEFE("MMONQLOPSO") == false then
				LUI.FlowManager.RequestPopupMenu(arg_23_0, "strict_nat_warning", true, arg_23_1, false)
				Dvar.DHEGHJJJHI("MMONQLOPSO", true)
			end

			local var_25_1 = Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", var_25_0)

			assert(arg_23_0.Nat)
			arg_23_0.Nat:setText(var_25_1)
		end
	end)

	arg_23_0.bindButton = LUI.UIBindButton.new()
	arg_23_0.bindButton.id = "selfBindButton"

	arg_23_0:addElement(arg_23_0.bindButton)

	local function var_23_3(arg_26_0, arg_26_1)
		if arg_23_0.Tabs then
			local var_26_0 = arg_23_0.Tabs:GetCurrentTab()
			local var_26_1 = arg_23_0._tabsData[var_26_0.index + 1].menuName

			if var_0_4(arg_23_0, var_26_1) and Engine.JEDFGECDJ() > 1 then
				local var_26_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
				local var_26_3 = var_26_2:GetValue(arg_23_1)
				local var_26_4 = Engine.CGHHDHCDEC(var_26_3)

				var_26_2:SetValue(arg_23_1, var_26_4)
				arg_23_0:AddButtonHelperText({
					helper_text = "",
					button_ref = "button_left_trigger"
				})
				arg_23_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_26_3 + 1)
				})

				return true
			elseif var_0_9(var_26_1) and AAR.IsMatchClientDataAvailable() and Dvar.CFHDGABACF("MTKSQRQLKN") ~= 0 then
				Lobby.OpenAfterActionReport(arg_26_1.controller, false, false)
			end
		end

		return false
	end

	arg_23_0.bindButton:addEventHandler("button_left_trigger", var_23_3)

	local function var_23_4()
		local var_27_0 = arg_23_0.Tabs:GetCurrentTab()
		local var_27_1 = arg_23_0._tabsData[var_27_0.index + 1].menuName
		local var_27_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
		local var_27_3 = var_27_2:GetValue(arg_23_1)

		if Engine.JEDFGECDJ() > 1 then
			if var_27_1 == "BattlePassMenu" or var_27_1 == "MPStoreMenu" then
				var_0_5(arg_23_0, true, var_27_3)
			end

			local var_27_4 = Engine.CGHHDHCDEC(var_27_3)

			if var_0_4(arg_23_0, var_27_1) then
				arg_23_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_27_4 + 1)
				})
			else
				arg_23_0:AddButtonHelperText({
					helper_text = "",
					button_ref = "button_left_trigger"
				})
			end
		else
			if var_27_1 == "BattlePassMenu" or var_27_1 == "MPStoreMenu" then
				var_0_5(arg_23_0, false)
				var_27_2:SetValue(arg_23_1, 0)
			end

			if var_0_4(arg_23_0, var_27_1) then
				var_27_2:SetValue(arg_23_1, 0)
			end

			arg_23_0:AddButtonHelperText({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
		end

		var_0_6(arg_23_0, var_27_1)
	end

	local function var_23_5()
		local var_28_0 = arg_23_0.Tabs:GetCurrentTab()
		local var_28_1 = arg_23_0._tabsData[var_28_0.index + 1].menuName

		var_0_6(arg_23_0, var_28_1)
	end

	local var_23_6 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_23_7 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.squadMembers.memberCount")

	arg_23_0:SubscribeToModel(var_23_6:GetModel(arg_23_1), var_23_4, true)
	arg_23_0:SubscribeToModel(var_23_7:GetModel(arg_23_1), var_23_5, true)

	local function var_23_8(arg_29_0, arg_29_1)
		local var_29_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_29_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_23_0:addAndCallEventHandler("onVideoChange", var_23_8)
	LAYOUT.AddAspectRatioFadeFrame(arg_23_0, arg_23_1)

	local var_23_9 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	if not var_23_9:GetValue(arg_23_1) then
		var_23_9:SetValue(arg_23_1, arg_23_1)
	end

	arg_23_0.Tabs:SetSendEventOnTabChange(true)
	arg_23_0:addEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_30_0, arg_30_1)
		assert(arg_30_1.index)
		arg_23_0.activeTabWidget:processEvent(arg_30_1)

		return true
	end)
end

function MPTabsMenu(arg_31_0, arg_31_1)
	local var_31_0 = LUI.UIElement.new()

	var_31_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_31_0.id = "MPTabsMenu"
	var_31_0._animationSets = var_31_0._animationSets or {}
	var_31_0._sequences = var_31_0._sequences or {}

	local var_31_1 = arg_31_1 and arg_31_1.controllerIndex

	if not var_31_1 and not Engine.DDJFBBJAIG() then
		var_31_1 = var_31_0:getRootController()
	end

	assert(var_31_1)

	local var_31_2 = var_31_0
	local var_31_3
	local var_31_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_31_1
	})

	var_31_4.id = "TabBacker"

	var_31_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_31_0:addElement(var_31_4)

	var_31_0.TabBacker = var_31_4

	local var_31_5

	if CONDITIONS.IsUserSignedInDemonware(var_31_1) then
		local var_31_6 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_31_1
		})

		var_31_6.id = "MPPlayerDetails"

		var_31_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_31_0:addElement(var_31_6)

		var_31_0.MPPlayerDetails = var_31_6
	end

	local var_31_7
	local var_31_8 = LUI.UIText.new()

	var_31_8.id = "Nat"

	var_31_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_31_8:setText("", 0)
	var_31_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_31_8:SetAlignment(LUI.Alignment.Right)
	var_31_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_31_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -36, _1080p * -14)
	var_31_0:addElement(var_31_8)

	var_31_0.Nat = var_31_8

	local var_31_9
	local var_31_10 = LUI.UIText.new()

	var_31_10.id = "JoinableStatus"

	var_31_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_31_10:setText("", 0)
	var_31_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_31_10:SetAlignment(LUI.Alignment.Right)
	var_31_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_31_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -56, _1080p * -34)
	var_31_0:addElement(var_31_10)

	var_31_0.JoinableStatus = var_31_10

	local var_31_11
	local var_31_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_31_1
	})

	var_31_12.id = "MenuTitle"

	var_31_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), 0)
	var_31_12.Line:SetLeft(0, 0)
	var_31_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_31_0:addElement(var_31_12)

	var_31_0.MenuTitle = var_31_12

	local var_31_13
	local var_31_14 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_31_1
			})
		end,
		controllerIndex = var_31_1
	}
	local var_31_15 = LUI.TabManager.new(var_31_14)

	var_31_15.id = "Tabs"

	var_31_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 987, _1080p * 108, _1080p * 160)
	var_31_0:addElement(var_31_15)

	var_31_0.Tabs = var_31_15

	local var_31_16
	local var_31_17 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_31_1
	})

	var_31_17.id = "PartyWidget"

	var_31_17:SetAlpha(0, 0)
	var_31_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_31_0:addElement(var_31_17)

	var_31_0.PartyWidget = var_31_17

	local var_31_18
	local var_31_19 = LUI.UIImage.new()

	var_31_19.id = "PlayerTextBacker"

	var_31_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_31_19:SetAlpha(0, 0)
	var_31_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -302, _1080p * -96, _1080p * 190, _1080p * 218)
	var_31_0:addElement(var_31_19)

	var_31_0.PlayerTextBacker = var_31_19

	local var_31_20
	local var_31_21 = LUI.UIImage.new()

	var_31_21.id = "PlayerTextTexture"

	var_31_21:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_31_21:SetAlpha(0, 0)
	var_31_21:SetPixelGridEnabled(true)
	var_31_21:SetPixelGridContrast(0.5, 0)
	var_31_21:SetPixelGridBlockWidth(2, 0)
	var_31_21:SetPixelGridBlockHeight(2, 0)
	var_31_21:SetPixelGridGutterWidth(1, 0)
	var_31_21:SetPixelGridGutterHeight(1, 0)
	var_31_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -302, _1080p * -96, _1080p * 190, _1080p * 218)
	var_31_0:addElement(var_31_21)

	var_31_0.PlayerTextTexture = var_31_21

	local var_31_22
	local var_31_23 = LUI.UIStyledText.new()

	var_31_23.id = "PlayerText"

	var_31_23:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_31_23:SetAlpha(0, 0)
	var_31_23:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_31_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_31_23:SetWordWrap(false)
	var_31_23:SetAlignment(LUI.Alignment.Right)
	var_31_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_31_23:SetShadowRGBFromTable(SWATCHES.Reticles.White, 0)
	var_31_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -298, _1080p * -101, _1080p * 192, _1080p * 216)
	var_31_0:addElement(var_31_23)

	var_31_0.PlayerText = var_31_23

	local function var_31_24()
		return
	end

	var_31_0._sequences.DefaultSequence = var_31_24

	local var_31_25
	local var_31_26 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_31_19:RegisterAnimationSequence("PlayerTextOn", var_31_26)

	local var_31_27 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_31_21:RegisterAnimationSequence("PlayerTextOn", var_31_27)

	local var_31_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_31_23:RegisterAnimationSequence("PlayerTextOn", var_31_28)

	local function var_31_29()
		var_31_19:AnimateSequence("PlayerTextOn")
		var_31_21:AnimateSequence("PlayerTextOn")
		var_31_23:AnimateSequence("PlayerTextOn")
	end

	var_31_0._sequences.PlayerTextOn = var_31_29

	local var_31_30
	local var_31_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_31_19:RegisterAnimationSequence("PlayerTextOff", var_31_31)

	local var_31_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_31_21:RegisterAnimationSequence("PlayerTextOff", var_31_32)

	local var_31_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_31_23:RegisterAnimationSequence("PlayerTextOff", var_31_33)

	local function var_31_34()
		var_31_19:AnimateSequence("PlayerTextOff")
		var_31_21:AnimateSequence("PlayerTextOff")
		var_31_23:AnimateSequence("PlayerTextOff")
	end

	var_31_0._sequences.PlayerTextOff = var_31_34

	local var_31_35
	local var_31_36 = {
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

	var_31_19:RegisterAnimationSequence("PlayerTextOffsetStore", var_31_36)

	local var_31_37 = {
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

	var_31_21:RegisterAnimationSequence("PlayerTextOffsetStore", var_31_37)

	local var_31_38 = {
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

	var_31_23:RegisterAnimationSequence("PlayerTextOffsetStore", var_31_38)

	local function var_31_39()
		var_31_19:AnimateSequence("PlayerTextOffsetStore")
		var_31_21:AnimateSequence("PlayerTextOffsetStore")
		var_31_23:AnimateSequence("PlayerTextOffsetStore")
	end

	var_31_0._sequences.PlayerTextOffsetStore = var_31_39

	local var_31_40
	local var_31_41 = {
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

	var_31_19:RegisterAnimationSequence("PlayerTextOffsetDefault", var_31_41)

	local var_31_42 = {
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

	var_31_21:RegisterAnimationSequence("PlayerTextOffsetDefault", var_31_42)

	local var_31_43 = {
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

	var_31_23:RegisterAnimationSequence("PlayerTextOffsetDefault", var_31_43)

	local function var_31_44()
		var_31_19:AnimateSequence("PlayerTextOffsetDefault")
		var_31_21:AnimateSequence("PlayerTextOffsetDefault")
		var_31_23:AnimateSequence("PlayerTextOffsetDefault")
	end

	var_31_0._sequences.PlayerTextOffsetDefault = var_31_44

	var_0_12(var_31_0, var_31_1, arg_31_1)

	return var_31_0
end

MenuBuilder.registerType("MPTabsMenu", MPTabsMenu)
LockTable(_M)
