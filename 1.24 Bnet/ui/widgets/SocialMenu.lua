module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0:Wait(1000).onComplete = function()
		return var_0_1(arg_1_0, arg_1_1)
	end

	local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)

	if arg_1_0.usesPlayerGrid and var_1_0.enableRefreshFriendsList then
		if Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() then
			Engine.DAGFFDGFII("friends_refresh", arg_1_1)
		end

		FRIENDS.RefreshData(arg_1_0.activeTabID, arg_1_0.activeTabWidget:GetPlayerGrid(), arg_1_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SOCIAL_TITLE"))

	arg_3_0.usesPlayerGrid = true

	local var_3_0 = Engine.CAADCDEEIA()
	local var_3_1 = {}
	local var_3_2 = {}
	local var_3_3 = #var_3_2 + 1

	var_3_1[FRIENDS.TabIDs.FRIENDS] = var_3_3
	var_3_2[var_3_3] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FRIENDS")),
		id = FRIENDS.TabIDs.FRIENDS
	}

	if not var_3_0 then
		local var_3_4 = #var_3_2 + 1

		var_3_1[FRIENDS.TabIDs.PRIVATE_PARTY] = var_3_4
		var_3_2[var_3_4] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PARTY")),
			id = FRIENDS.TabIDs.PRIVATE_PARTY
		}

		if Dvar.IBEGCHEFE("NOPQSROMKK") then
			local var_3_5 = #var_3_2 + 1

			var_3_1[FRIENDS.TabIDs.REGIMENTS] = var_3_5
			var_3_2[var_3_5] = {
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENTS")),
				id = FRIENDS.TabIDs.REGIMENTS
			}
		end

		if Dvar.IBEGCHEFE("NORTQRPRPM") then
			local var_3_6 = #var_3_2 + 1

			var_3_1[FRIENDS.TabIDs.RECENT_PLAYERS] = var_3_6
			var_3_2[var_3_6] = {
				name = ToUpperCase(Engine.CBBHFCGDIC("MENU/RECENT_PLAYERS")),
				id = FRIENDS.TabIDs.RECENT_PLAYERS
			}
		end
	end

	arg_3_0.tabNamesAndIDs = var_3_2

	local function var_3_7(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0
		local var_4_1
		local var_4_2

		if arg_3_0.activeTabID == FRIENDS.TabIDs.RECENT_PLAYERS or arg_3_0.activeTabID == FRIENDS.TabIDs.FRIENDS then
			local var_4_3 = arg_3_0.activeTabWidget:GetPlayerGrid()

			var_4_2 = var_4_3

			local var_4_4 = math.floor(var_4_3.cachedFriends / 2)
			local var_4_5 = var_4_3:GetFocusPositionIndex({
				clampContentIndexToDatasetLength = true
			})

			if not var_4_5 then
				return
			end

			var_4_0 = var_4_5 - var_4_4
			var_4_1 = var_4_5 + var_4_4
		else
			var_4_2 = arg_4_0

			if arg_4_1 == -1 and arg_4_2 == -1 then
				var_4_0 = 0
				var_4_1 = 0
			else
				local var_4_6 = math.floor(arg_4_0.cachedFriends / 2)
				local var_4_7 = arg_4_1 + math.floor((arg_4_2 - arg_4_1) / 2)

				var_4_0 = var_4_7 + 1 - var_4_6
				var_4_1 = var_4_7 + var_4_6
			end
		end

		var_4_2.getFriendFrom = var_4_0 > 0 and var_4_0 or 0

		if var_4_2.friendsCount == 0 then
			var_4_2.getFriendTo = 0
		else
			var_4_2.getFriendTo = var_4_1 < var_4_2.friendsCount - 1 and var_4_1 or var_4_2.friendsCount - 1
		end

		FRIENDS.RefreshData(arg_3_0.activeTabID, var_4_2, arg_3_1)
	end

	local var_3_8 = {
		_customScrolling = true,
		SetLinkedGridDataSource = function()
			return
		end,
		UpdateScrolling = var_3_7,
		LinkTo = function()
			return
		end
	}
	local var_3_9 = LUI.FlowManager.GetScopedData(arg_3_0)

	local function var_3_10(arg_7_0)
		if arg_7_0 then
			if not arg_3_0._leavePartyHelperAdded then
				arg_3_0._leavePartyHelperAdded = true

				arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_left_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_PARTY")
				})
			end
		elseif arg_3_0._leavePartyHelperAdded then
			arg_3_0._leavePartyHelperAdded = nil

			arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_left_trigger"
			})
		end
	end

	local var_3_11 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_2) do
		table.insert(var_3_11, {
			name = iter_3_1.name,
			hasDefaultFocus = arg_3_2.setRegimentsDefault and iter_3_1.id == FRIENDS.TabIDs.REGIMENTS or var_3_9.activeTabIndex == iter_3_0,
			focusFunction = function(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
				if var_3_9.activeTabIndex and iter_3_0 == var_3_9.activeTabIndex and arg_3_0.activeTabWidget then
					return
				end

				local var_8_0 = arg_3_0.tabNamesAndIDs[arg_8_2 + 1].id

				if arg_3_0.activeTabID ~= var_8_0 then
					arg_3_0.activeTabID = var_8_0

					if arg_3_0.activeTabWidget then
						arg_3_0.activeTabWidget:closeTree()

						arg_3_0.activeTabWidget = nil
					end

					arg_3_0.usesPlayerGrid = true

					if arg_3_0._manageFriendsHelperAdded then
						arg_3_0._manageFriendsHelperAdded = nil

						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_alt2"
						})
					end

					if arg_3_0._leavePartyHelperAdded then
						arg_3_0._leavePartyHelperAdded = nil

						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_left_trigger"
						})
					end

					if arg_3_0._partyTabHelperAdded then
						arg_3_0._partyTabHelperAdded = nil

						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_r3"
						})
					end

					if arg_3_0._regimentsHelpersAdded then
						arg_3_0._regimentsHelpersAdded = nil

						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_alt1"
						})
						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_r3"
						})
						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_left_trigger"
						})
					end

					if arg_3_0._friendsTabHelperAdded then
						arg_3_0._friendsTabHelperAdded = nil

						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_alt1"
						})
						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_alt2"
						})
						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_r3"
						})
					end

					if arg_3_0._setClanTagPromptAdded then
						arg_3_0._setClanTagPromptAdded = nil

						arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
							button_ref = "button_right_trigger"
						})
					end

					arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						button_ref = "button_primary"
					})

					if var_8_0 == FRIENDS.TabIDs.FRIENDS then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialFriendsMenu", {
							controllerIndex = arg_8_1,
							buttonHelperBar = arg_3_0.HelperBar
						})
						arg_3_0._friendsTabHelperAdded = true

						arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
							side = "left",
							button_ref = "button_primary",
							priority = 2,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
						})
					elseif var_8_0 == FRIENDS.TabIDs.PRIVATE_PARTY then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPartyMenu", {
							controllerIndex = arg_8_1,
							helpbar = arg_3_0.HelperBar
						})
						arg_3_0.activeTabWidget.UpdateLeavePartyButtonHelper = var_3_10

						arg_3_0.activeTabWidget:processEvent({
							name = "update_social_party"
						})

						arg_3_0._partyTabHelperAdded = true
						arg_3_0.usesPlayerGrid = false
					elseif var_8_0 == FRIENDS.TabIDs.REGIMENTS then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialRegimentsMenu", {
							controllerIndex = arg_8_1,
							menu = arg_3_0
						})

						if arg_3_0.activeTabWidget._activeClanID then
							arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 20,
								helper_text = Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT")
							})
						else
							arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
								side = "left",
								button_ref = "button_left_trigger",
								helper_text = ""
							})
						end

						if FRIENDS.GetCurrentClanTagType(arg_8_1) == ClanTagType.CUSTOM then
							arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
								side = "left",
								button_ref = "button_right_trigger",
								priority = 30,
								helper_text = Engine.CBBHFCGDIC("REGIMENTS/USE_REGIMENT_TAG")
							})

							arg_3_0._setClanTagPromptAdded = true
						end

						arg_3_0._regimentsHelpersAdded = true

						arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
							side = "left",
							button_ref = "button_primary",
							priority = 2,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
						})

						arg_3_0.usesPlayerGrid = false
						arg_3_2.setRegimentsDefault = nil
					elseif var_8_0 == FRIENDS.TabIDs.RECENT_PLAYERS then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialRecentMenu", {
							controllerIndex = arg_8_1
						})

						arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
							side = "left",
							button_ref = "button_primary",
							priority = 2,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
						})
					else
						assert(false)
					end

					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
					arg_3_0:addElement(arg_3_0.activeTabWidget)

					arg_3_0.activeTabWidget._socialMenu = arg_3_0

					if arg_3_0.activeTabWidget.SetupButtonBinds then
						arg_3_0.activeTabWidget.SetupButtonBinds()
					end

					if arg_3_0.usesPlayerGrid then
						local var_8_1 = arg_3_0.activeTabWidget:GetPlayerGrid()

						if arg_3_0.activeTabID == FRIENDS.TabIDs.RECENT_PLAYERS then
							FRIENDS.InitPlayerRequestData(var_8_1, FRIENDS.SOCIAL_MENU_CACHED_RECENT_PLAYERS)
							var_8_1:AddScrollbar(var_3_8)
						else
							FRIENDS.InitPlayerRequestData(var_8_1, FRIENDS.SOCIAL_MENU_CACHED_FRIENDS / 2)
							var_8_1:AddScrollbar(var_3_8)
						end

						FRIENDS.RefreshData(arg_3_0.activeTabID, var_8_1, arg_8_1)
					end

					if iter_3_0 ~= var_3_9.activeTabIndex and arg_8_3 ~= FocusType.MouseOver and arg_8_3 ~= FocusType.MenuFlow then
						arg_3_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end

					var_3_9.activeTabIndex = iter_3_0
				end
			end
		})
	end

	arg_3_0.Tabs:SetTabs(var_3_11)

	var_3_9.enableRefreshFriendsList = true
	arg_3_0:Wait(1000).onComplete = function()
		return var_0_1(arg_3_0, arg_3_1)
	end

	arg_3_0:addEventHandler("send_friend_request_complete", function(arg_10_0, arg_10_1)
		if arg_3_0.usesPlayerGrid then
			FRIENDS.RefreshData(arg_3_0.activeTabID, arg_3_0.activeTabWidget:GetPlayerGrid(), arg_3_1)
		end
	end)
	arg_3_0:addEventHandler("fetch_friend_data_complete", function(arg_11_0, arg_11_1)
		if arg_3_0.usesPlayerGrid then
			LUI.FlowManager.GetScopedData(arg_3_0).enableRefreshFriendsList = true
		end
	end)
	arg_3_0.bindButton:addEventHandler("button_alt2", function(arg_12_0, arg_12_1)
		if arg_3_0.activeTabWidget.ManageFriendsFunc then
			arg_3_0.activeTabWidget:ManageFriendsFunc(arg_3_1)
		end
	end)

	if CONDITIONS.IsUserSignedInBnet(arg_3_1) then
		arg_3_0.PlayerDetailsAvailability.m_requireFocusType = FocusType.MouseOver

		arg_3_0.PlayerDetailsAvailability:setPriority(100)
		arg_3_0:RemoveElement(arg_3_0.PlayerDetailsAvailability)
		arg_3_0:addElement(arg_3_0.PlayerDetailsAvailability)
		arg_3_0.bindButton:addEventHandler("button_left_stick", function(arg_13_0, arg_13_1)
			arg_3_0.PlayerDetailsAvailability:ChangeDropdownState(arg_3_1)

			if arg_3_0.PlayerDetailsAvailability._dropdownState then
				ACTIONS.LoseFocus(arg_3_0, "SocialMenuLayout", arg_3_1)
				ACTIONS.GainFocus(arg_3_0, "PlayerDetailsAvailability", arg_3_1)
			else
				ACTIONS.LoseFocus(arg_3_0, "PlayerDetailsAvailability", arg_3_1)
				arg_3_0.activeTabWidget:processEvent({
					name = "gain_focus"
				})
			end
		end)
	end

	if Engine.DDJFBBJAIG() then
		FrontEndScene.HideAllCharacters()
		Engine.DHFCHIIJCA("squad_lobby")
	end

	arg_3_0.bindButton:registerEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_1.controller or arg_3_1

		ACTIONS.LeaveMenu(arg_3_0)

		local var_14_1 = LUI.FlowManager.GetVisibleMenu()

		if var_14_1 then
			var_14_1:processEvent({
				name = "closing_quick_access_menu",
				controllerIndex = var_14_0
			})
		end
	end)

	local function var_3_12(arg_15_0)
		local var_15_0 = FRIENDS.GetNotificationDataSourceByTab(arg_15_0)
		local var_15_1 = var_3_1[arg_15_0]
		local var_15_2 = arg_3_0.Tabs:GetTabAtIndex(var_15_1)

		if var_15_2 then
			local var_15_3 = var_15_0:GetValue(arg_3_1)
			local var_15_4 = var_15_3 and var_15_3 > 0

			var_15_2:SetBreadcrumb(var_15_4)
		end
	end

	local var_3_13 = FRIENDS.GetNotificationDataSourceByTab(FRIENDS.TabIDs.FRIENDS)

	arg_3_0:SubscribeToModel(var_3_13:GetModel(arg_3_1), function()
		var_3_12(FRIENDS.TabIDs.FRIENDS)
	end)

	local var_3_14 = FRIENDS.GetNotificationDataSourceByTab(FRIENDS.TabIDs.PRIVATE_PARTY)

	arg_3_0:SubscribeToModel(var_3_14:GetModel(arg_3_1), function()
		var_3_12(FRIENDS.TabIDs.PRIVATE_PARTY)
	end)

	if Dvar.IBEGCHEFE("NOPQSROMKK") then
		local var_3_15 = FRIENDS.GetNotificationDataSourceByTab(FRIENDS.TabIDs.REGIMENTS)

		arg_3_0:SubscribeToModel(var_3_15:GetModel(arg_3_1), function()
			var_3_12(FRIENDS.TabIDs.REGIMENTS)
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	ACTIONS.ScaleFullscreen(arg_3_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.TabBacker)

	if not CONDITIONS.InGameSPOrFrontendMP() then
		ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.BackgroundImage)
	end

	METRICS.RecordSocialMenuOpeningFlow(arg_3_1, arg_3_2.hasUsedShortcut == true)
end

function SocialMenu(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "SocialMenu"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	var_19_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_19_1
	})
	var_19_0.HelperBar.id = "HelperBar"

	var_19_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_19_0.HelperBar:setPriority(10)
	var_19_0:addElement(var_19_0.HelperBar)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = {
		worldBlur = 1,
		controllerIndex = var_19_1
	}
	local var_19_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_19_4)

	var_19_5.id = "WorldBlur"

	var_19_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_19_0:addElement(var_19_5)

	var_19_0.WorldBlur = var_19_5

	local var_19_6
	local var_19_7 = LUI.UIImage.new()

	var_19_7.id = "Darken"

	var_19_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_7:SetAlpha(0.5, 0)
	var_19_0:addElement(var_19_7)

	var_19_0.Darken = var_19_7

	local var_19_8

	if not CONDITIONS.InGameSPOrFrontendMP(var_19_0) then
		local var_19_9 = LUI.UIImage.new()

		var_19_9.id = "BackgroundImage"

		var_19_9:setImage(RegisterMaterial("frontend_option_bg"), 0)
		var_19_0:addElement(var_19_9)

		var_19_0.BackgroundImage = var_19_9
	end

	local var_19_10
	local var_19_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_19_1
	})

	var_19_11.id = "TabBacker"

	var_19_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_19_0:addElement(var_19_11)

	var_19_0.TabBacker = var_19_11

	local var_19_12
	local var_19_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_19_1
	})

	var_19_13.id = "MenuTitle"

	var_19_13.MenuTitle:setText(ToUpperCase(""), 0)
	var_19_13.Line:SetLeft(0, 0)
	var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_19_0:addElement(var_19_13)

	var_19_0.MenuTitle = var_19_13

	local var_19_14

	if CONDITIONS.IsUserSignedInDemonware(var_19_1) then
		local var_19_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_19_1
		})

		var_19_15.id = "PlayerDetails"

		var_19_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_19_0:addElement(var_19_15)

		var_19_0.PlayerDetails = var_19_15
	end

	local var_19_16

	if CONDITIONS.IsUserSignedInBnet(var_19_1) then
		local var_19_17 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailability", {
			controllerIndex = var_19_1
		})

		var_19_17.id = "PlayerDetailsAvailability"

		var_19_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 131, _1080p * 271)
		var_19_0:addElement(var_19_17)

		var_19_0.PlayerDetailsAvailability = var_19_17
	end

	local var_19_18

	if CONDITIONS.InFrontend(var_19_0) then
		local var_19_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_19_1
		})

		var_19_19.id = "LobbyMembersFooter"

		var_19_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_19_0:addElement(var_19_19)

		var_19_0.LobbyMembersFooter = var_19_19
	end

	local var_19_20
	local var_19_21 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_19_1
			})
		end,
		controllerIndex = var_19_1
	}
	local var_19_22 = LUI.TabManager.new(var_19_21)

	var_19_22.id = "Tabs"

	var_19_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 986, _1080p * 108, _1080p * 160)
	var_19_0:addElement(var_19_22)

	var_19_0.Tabs = var_19_22

	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_19_23 = LUI.UIBindButton.new()

	var_19_23.id = "selfBindButton"

	var_19_0:addElement(var_19_23)

	var_19_0.bindButton = var_19_23

	var_19_0.bindButton:addEventHandler("button_secondary", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_19_1
		end

		ACTIONS.LeaveMenu(var_19_0)
	end)
	var_19_0.bindButton:addEventHandler("button_start", function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_1.controller or var_19_1

		ACTIONS.OpenOptionsMenu(var_22_0, "", "")
	end)
	var_0_2(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("SocialMenu", SocialMenu)
LockTable(_M)
