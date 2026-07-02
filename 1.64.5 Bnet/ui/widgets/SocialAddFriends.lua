module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._searchPlatform = arg_1_1
	arg_1_0._searchHintString = arg_1_3

	if arg_1_0.PlatformDropdown then
		arg_1_0.PlatformDropdown:SetButtonText(arg_1_2)
	end

	if CONDITIONS.IsArabic() then
		arg_1_0._searchHintString = "LUA_MENU/FRIEND_SEARCH_HINT_TEMP"
	end

	arg_1_0.FriendSearch.NameTextBox:SetDefaultInputString(Engine.CBBHFCGDIC(arg_1_0._searchHintString))
	arg_1_0.FriendSearch.NameTextBox:TextEditOff()
	arg_1_0.FriendSearch.NameTextBox:ResetFirstInteraction()
	arg_1_0:SetSearchButtonEnabled(false)

	if arg_1_0._searchPlatform == ClientPlatform.BNET and Engine.DBFCJBDJEC() then
		arg_1_0.FriendSearch.NameTextBox:AddTooltipData(arg_1_0._controllerIndex, {
			tooltipDescription = Engine.CBBHFCGDIC("MENU/BNET_FRIEND_REQUEST_MORE_INFOS")
		})
	else
		arg_1_0.FriendSearch.NameTextBox:RemoveToolTipData()
	end
end

function SelectSearchPlatform(arg_2_0, arg_2_1)
	local var_2_0 = {
		title = Engine.CBBHFCGDIC(arg_2_1.title)
	}

	var_2_0.message = ""
	var_2_0.defaultFocusIndex = 0
	var_2_0.buttons = {}
	var_2_0.width = 460
	var_2_0.controllerIndex = arg_2_1.controllerIndex

	for iter_2_0 = 1, #arg_2_1.buttons do
		local var_2_1 = Engine.CBBHFCGDIC(arg_2_1.buttons[iter_2_0].text)
		local var_2_2 = {
			label = var_2_1,
			doNotForceUpperCase = arg_2_1.buttons[iter_2_0].doNotForceUpperCase,
			action = arg_2_1.buttons[iter_2_0].action,
			isEquipped = arg_2_1.curPlatform and arg_2_1.curPlatform == arg_2_1.buttons[iter_2_0].platform or false
		}

		table.insert(var_2_0.buttons, var_2_2)
	end

	local var_2_3 = MenuBuilder.BuildRegisteredType("SelectSearchPlatformPopup", var_2_0)
	local var_2_4 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_2_1.controllerIndex,
		widget = var_2_3
	})

	var_2_4.id = "SelectSearchPlatform"

	return var_2_4
end

MenuBuilder.registerType("SelectSearchPlatform", SelectSearchPlatform)

local function var_0_1(arg_3_0)
	REGISTRATION.UpdateEmail(arg_3_0)

	local var_3_0, var_3_1 = REGISTRATION.CheckIsPassing(REGISTRATION.EmailRules)

	return var_3_0
end

local function var_0_2(arg_4_0)
	REGISTRATION.UpdateUserName(arg_4_0, true)

	local var_4_0, var_4_1 = REGISTRATION.CheckIsPassing(REGISTRATION.UserNameRules)

	return var_4_0
end

local function var_0_3(arg_5_0, arg_5_1)
	if arg_5_0.FriendSearch.SendFriendRequestButton then
		arg_5_0.FriendSearch.SendFriendRequestButton:SetButtonDisabled(not arg_5_1)
		arg_5_0.FriendSearch.SendFriendRequestButton:SetMouseFocusBlocker(not arg_5_1)
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.FriendSearch.NameTextBox
	local var_6_1 = var_6_0.textEdit:getText()

	if var_6_1 and var_6_1 ~= "" then
		if arg_6_0._searchPlatform == ClientPlatform.BNET and Engine.DBFCJBDJEC() then
			if arg_6_0.ValidateBattletag(var_6_1) or arg_6_0.ValidateEmail(var_6_1) then
				if arg_6_2 then
					Clans.DCADIAJCII(arg_6_1, arg_6_0._clanID, var_6_1, arg_6_0._searchPlatform)
				else
					Social.FDFHHBHHE(arg_6_1, var_6_1, false)
				end

				var_6_0:SetTextEraseOnEditOff(true)
			else
				var_6_0:SetTextEraseOnEditOff(false)
			end
		elseif arg_6_0.ValidateBattletag(var_6_1) then
			if arg_6_2 then
				Clans.DCADIAJCII(arg_6_1, arg_6_0._clanID, var_6_1, arg_6_0._searchPlatform)
			else
				Social.DIGABIEEAG(arg_6_1, var_6_1, arg_6_0._searchPlatform)
			end

			var_6_0:SetTextEraseOnEditOff(true)
		else
			var_6_0:SetTextEraseOnEditOff(false)
		end

		var_6_0:TextEditOff()
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_2.platform)
	assert(arg_7_2.isRegiments ~= nil)
	assert(arg_7_0.RecentPlayersGrid)
	assert(arg_7_0.NoPlayersLabel)
	assert(arg_7_0.FriendSearch)

	if not Engine.ECAJCAJJGF() then
		assert(arg_7_0.PlatformDropdown)
	end

	arg_7_0._controllerIndex = arg_7_1
	arg_7_0.ValidateEmail = var_0_1
	arg_7_0.ValidateBattletag = var_0_2
	arg_7_0.SetSearchButtonEnabled = var_0_3
	arg_7_0._clanID = arg_7_2.clanID

	arg_7_0.VerticalScrollbar:closeTree()

	arg_7_0.VerticalScrollbar = nil

	arg_7_0.NoPlayersLabel:closeTree()

	arg_7_0.NoPlayersLabel = nil

	arg_7_0.RecentPlayersGrid:closeTree()

	arg_7_0.RecentPlayersGrid = nil

	arg_7_0.Line:closeTree()

	arg_7_0.Line = nil

	arg_7_0.ActivisionPlayersLabel:closeTree()

	arg_7_0.ActivisionPlayersLabel = nil

	local function var_7_0(arg_8_0)
		local var_8_0 = true

		if arg_7_0._searchPlatform == ClientPlatform.BNET and Engine.DBFCJBDJEC() then
			var_8_0 = arg_7_0.ValidateEmail(arg_8_0) or arg_7_0.ValidateBattletag(arg_8_0)
		elseif arg_7_0._searchPlatform == ClientPlatform.NONE or arg_7_0._searchPlatform == ClientPlatform.BNET then
			var_8_0 = arg_7_0.ValidateBattletag(arg_8_0)
		else
			var_8_0 = arg_8_0 ~= ""
		end

		return var_8_0
	end

	function arg_7_0.FriendSearch.NameTextBox.buttonActionCallbackFunc()
		if Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_7_1) then
			local var_9_0 = arg_7_0.FriendSearch.NameTextBox.textEdit:getText()

			arg_7_0.FriendSearch.NameTextBox:TextEditOff()
			arg_7_0.FriendSearch.NameTextBox.textEdit:setTextEditText(var_9_0)
			OSK.CBJGJDGFC(arg_7_1, Engine.CBBHFCGDIC(arg_7_0._searchHintString), var_9_0 and var_9_0 or "", FRIENDS.maxNameLength, false, false, true, function(arg_10_0, arg_10_1, arg_10_2)
				if arg_10_1 then
					arg_7_0.FriendSearch.NameTextBox.textEdit:setTextEditText(arg_10_1)

					if var_7_0(arg_10_1) then
						if arg_7_0.FriendSearch.SendFriendRequestButton then
							arg_7_0:SetSearchButtonEnabled(true)
							arg_7_0.FriendSearch.NameTextBox:processEvent({
								name = "lose_focus"
							})
							arg_7_0.FriendSearch.SendFriendRequestButton:processEvent({
								name = "gain_focus"
							})
						end

						var_0_4(arg_7_0, arg_10_0, arg_7_2.isRegiments)
					else
						arg_7_0:SetSearchButtonEnabled(false)
					end
				end

				arg_7_0.FriendSearch.NameTextBox:TextEditOff()
			end, CoD.KeyboardInputTypes.Email)
		end
	end

	function arg_7_0.FriendSearch.NameTextBox.isTypingCallbackFunc(arg_11_0, arg_11_1)
		arg_7_0:SetSearchButtonEnabled(var_7_0(arg_11_1))
	end

	if arg_7_0.FriendSearch.SendFriendRequestButton then
		arg_7_0.FriendSearch.SendFriendRequestButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			if arg_7_0.FriendSearch.NameTextBox:IsPastFirstInteraction() then
				var_0_4(arg_7_0, arg_7_1, arg_7_2.isRegiments)
			end
		end)
	end

	function arg_7_0.FriendSearch.NameTextBox.textEditCompleteCallbackFunc(arg_13_0, arg_13_1, arg_13_2)
		if LUI.IsLastInputKeyboardMouse(arg_7_1) and not arg_13_1 and arg_13_2 and arg_13_2 ~= "" then
			if arg_7_0._searchPlatform == ClientPlatform.BNET and Engine.DBFCJBDJEC() then
				if arg_7_0.ValidateBattletag(arg_13_2) or arg_7_0.ValidateEmail(arg_13_2) then
					if arg_7_2.isRegiments then
						Clans.DCADIAJCII(arg_7_1, arg_7_0._clanID, arg_13_2, arg_7_0._searchPlatform)
					else
						Social.FDFHHBHHE(arg_7_1, arg_13_2, false)
					end
				end
			elseif arg_7_0.ValidateBattletag(arg_13_2) then
				if arg_7_2.isRegiments then
					Clans.DCADIAJCII(arg_7_1, arg_7_0._clanID, arg_13_2, arg_7_0._searchPlatform)
				else
					Social.DIGABIEEAG(arg_7_1, arg_13_2, arg_7_0._searchPlatform)
				end
			end
		end
	end

	arg_7_0.FriendSearch.NameTextBox:SetAlpha(0.6)

	if arg_7_0.RecentPlayersGrid then
		local var_7_1 = Friends.DAHGHDHFIA(arg_7_1, FRIENDS.TabIDs.RECENT_PLAYERS, 0, FRIENDS.SOCIAL_MENU_CACHED_RECENT_PLAYERS / 2 - 1, 0)

		arg_7_0.RecentPlayersGrid:SetNumChildren(math.min(var_7_1.count, FRIENDS.SOCIAL_MENU_CACHED_RECENT_PLAYERS))
		arg_7_0.NoPlayersLabel:SetAlpha(var_7_1.count == 0 and 1 or 0)

		local function var_7_2(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_0.xuidString or arg_14_0.xuid

			return not Friends.BIAJAECICH(arg_14_1, var_14_0)
		end

		local function var_7_3(arg_15_0, arg_15_1)
			local var_15_0 = arg_15_0._playerData.presencePlatform == arg_15_0._currentPlatform

			return Engine.HDGDBCJFG() and var_15_0
		end

		local function var_7_4(arg_16_0, arg_16_1, arg_16_2)
			local var_16_0 = var_7_1.friends[arg_16_2 + 1]

			arg_16_0:SetupPlayerData(var_16_0)
			ACTIONS.AnimateSequence(arg_16_0, "HideJoinableStatus")
			arg_16_0:SetupContextualMenu({
				title = var_16_0.fullName
			})

			local function var_16_1(arg_17_0, arg_17_1)
				return function()
					if arg_7_2.platform == SocialFriendsPlatform.wegame then
						Social.HJFBFFDD(arg_17_1, arg_17_0, false)
					else
						Social.DEIAGIIJDF(arg_17_1, arg_17_0)
					end
				end
			end

			arg_16_0._addFriendActionFunc = var_16_1

			local function var_16_2(arg_19_0, arg_19_1)
				return function()
					if Friends.CCBABDAGGJ(arg_19_1, arg_19_0._playerData.xuid, arg_19_0._playerData.platformId, FRIENDS.TabIDs.RECENT_PLAYERS).isValidEntry and Friends.GGDCJJGBI(arg_19_1) and not Social.BFEBABDDDE(arg_19_1, arg_19_0._playerData.xuid, "PlatformIdForViewProfile") then
						local var_20_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

						LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_19_1, false, {
							message = var_20_0
						})
					end
				end
			end

			arg_16_0._viewProfileActionFunc = var_16_2

			arg_16_0:AddContextualMenuAction({
				id = "addFriendRecentPlayer",
				actionName = Engine.CBBHFCGDIC("LUA_MENU/ADD_FRIEND"),
				conditionFunction = function()
					return var_7_2(var_16_0, arg_7_1)
				end,
				actionFunction = var_16_1(var_16_0.xuid, arg_7_1)
			})
			arg_16_0:AddContextualMenuAction({
				id = "viewProfileRecentPlayer",
				actionName = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
				conditionFunction = function()
					return var_7_3(arg_16_0, arg_7_1)
				end,
				actionFunction = var_16_2(arg_16_0, arg_7_1)
			})

			if not arg_16_0._handlersAdded then
				arg_16_0:addEventHandler("button_action", function(arg_23_0, arg_23_1)
					local var_23_0 = arg_23_0._playerData
					local var_23_1 = arg_23_1.controller
					local var_23_2 = {
						title = var_23_0.fullName
					}

					var_23_2.message = ""
					var_23_2.buttons = {}

					if var_7_2(var_16_0, var_23_1) then
						table.insert(var_23_2.buttons, {
							label = Engine.CBBHFCGDIC("LUA_MENU/ADD_FRIEND"),
							action = arg_23_0._addFriendActionFunc(var_23_0.xuid, var_23_1)
						})
					end

					if var_7_3(arg_16_0, var_23_1) then
						table.insert(var_23_2.buttons, {
							label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
							action = arg_23_0._viewProfileActionFunc(arg_23_0, var_23_1)
						})
					end

					table.insert(var_23_2.buttons, {
						label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
						action = function()
							return
						end
					})
					LUI.FlowManager.RequestPopupMenu(arg_23_0, "PopupMessageAndButtons", true, var_23_1, false, var_23_2, nil, true, true)
				end)

				arg_16_0._handlersAdded = true
			end
		end

		arg_7_0.RecentPlayersGrid:SetRefreshChild(var_7_4)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end

	local function var_7_5(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
		return {
			doNotForceUpperCase = true,
			platform = arg_25_1,
			text = arg_25_2,
			hintText = arg_25_3,
			action = function(arg_26_0, arg_26_1)
				var_0_0(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
			end
		}
	end

	local var_7_6 = {
		title = "LUA_MENU/SEARCH_FRIEND_USING",
		menu = arg_7_0,
		buttons = {}
	}
	local var_7_7 = Engine.ECAJCAJJGF() and "LUA_MENU/INGAME_FRIEND_SEARCH_HINT" or "LUA_MENU/FRIEND_SEARCH_HINT"

	table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.NONE, "LUA_MENU/ATVI_ACCOUNT", var_7_7))

	if Engine.HDGDBCJFG() then
		if Engine.CIEGIACHAE() then
			table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.PS4, "LUA_MENU/GAMERTAG_LONG_PS4", "LUA_MENU/PS4_ADD_FRIEND_HINT"))
			table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.XBOX_ONE, "LUA_MENU/OTHER_CONSOLE", "LUA_MENU/INVITE_ACCOUNT_NAME_HINT"))
		else
			table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.XBOX_ONE, "LUA_MENU/GAMERTAG_LONG_XBONE", "LUA_MENU/XB3_ADD_FRIEND_HINT"))
			table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.PS4, "LUA_MENU/OTHER_CONSOLE", "LUA_MENU/INVITE_ACCOUNT_NAME_HINT"))
		end

		table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.BNET, "LUA_MENU/PC", "LUA_MENU/INVITE_ACCOUNT_NAME_HINT"))
	elseif Engine.DBFCJBDJEC() then
		table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.BNET, "LUA_MENU/FRIENDS_BATTLENET", "LUA_MENU/BNET_FRIEND_SEARCH_HINT"))
		table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.PS4, "LUA_MENU/GAMERTAG_LONG_PS4", "LUA_MENU/PS4_ADD_FRIEND_HINT"))
		table.insert(var_7_6.buttons, var_7_5(arg_7_0, ClientPlatform.XBOX_ONE, "LUA_MENU/GAMERTAG_LONG_XBONE", "LUA_MENU/XB3_ADD_FRIEND_HINT"))
	end

	if arg_7_0.PlatformDropdown then
		local var_7_8 = LUI.UIBindButton.new()

		var_7_8.id = "selfBindButton"

		arg_7_0:addElement(var_7_8)

		arg_7_0.bindButton = var_7_8

		arg_7_0.bindButton:addEventHandler("button_alt2", function(arg_27_0, arg_27_1)
			if LUI.IsLastInputGamepad(arg_7_1) then
				var_7_6.curPlatform = arg_7_0._searchPlatform

				LUI.FlowManager.RequestPopupMenu(arg_7_0, "SelectSearchPlatform", false, arg_7_1, false, var_7_6)
			end
		end)

		arg_7_0.PlatformDropdown.m_requireFocusType = FocusType.MouseOver

		arg_7_0.PlatformDropdown:SetButtonText(var_7_6.buttons[1].text)
		arg_7_0.PlatformDropdown:SetGamepadOptions({
			hideArrowOnGamepad = true,
			hidePromptOnGamepad = false
		})
		arg_7_0.PlatformDropdown:SetDropdownOptions(var_7_6.buttons)
		arg_7_0.FriendSearch.NameTextBox:addEventHandler("gain_focus", function(arg_28_0, arg_28_1)
			arg_7_0.PlatformDropdown:SetGamepadOptions({
				hideArrowOnGamepad = true,
				hidePromptOnGamepad = false
			})
		end)
		arg_7_0.FriendSearch.NameTextBox:addEventHandler("lose_focus", function(arg_29_0, arg_29_1)
			arg_7_0.PlatformDropdown:SetGamepadOptions({
				hideArrowOnGamepad = true,
				hidePromptOnGamepad = true
			})
		end)

		if arg_7_0.FriendSearch.SendFriendRequestButton then
			arg_7_0.FriendSearch.SendFriendRequestButton:addEventHandler("gain_focus", function(arg_30_0, arg_30_1)
				arg_7_0.PlatformDropdown:SetGamepadOptions({
					hideArrowOnGamepad = true,
					hidePromptOnGamepad = false
				})
			end)
		end

		arg_7_0.FriendSearch.NameTextBox:addEventHandler("lose_focus", function(arg_31_0, arg_31_1)
			arg_7_0.PlatformDropdown:SetGamepadOptions({
				hideArrowOnGamepad = true,
				hidePromptOnGamepad = true
			})
		end)
	end

	local var_7_9 = var_7_6.buttons[1]

	var_0_0(arg_7_0, var_7_9.platform, var_7_9.text, var_7_9.hintText)

	if Engine.ECAJCAJJGF() then
		arg_7_0.ActivisionPlayersLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/RECENT_INGAME_FRIENDS"), 0)
	end
end

function SocialAddFriends(arg_32_0, arg_32_1)
	local var_32_0 = LUI.UIVerticalNavigator.new()

	var_32_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_32_0.id = "SocialAddFriends"
	var_32_0._animationSets = var_32_0._animationSets or {}
	var_32_0._sequences = var_32_0._sequences or {}

	local var_32_1 = arg_32_1 and arg_32_1.controllerIndex

	if not var_32_1 and not Engine.DDJFBBJAIG() then
		var_32_1 = var_32_0:getRootController()
	end

	assert(var_32_1)

	local var_32_2 = var_32_0
	local var_32_3
	local var_32_4 = MenuBuilder.BuildRegisteredType("SocialFriendSearch", {
		controllerIndex = var_32_1
	})

	var_32_4.id = "FriendSearch"

	var_32_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 144, _1080p * 682, _1080p * 200, _1080p * 300)
	var_32_0:addElement(var_32_4)

	var_32_0.FriendSearch = var_32_4

	local var_32_5
	local var_32_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(6, 4),
		controllerIndex = var_32_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialPlayer", {
				controllerIndex = var_32_1
			})
		end,
		refreshChild = function(arg_34_0, arg_34_1, arg_34_2)
			return
		end,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 100,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_32_7 = LUI.UIGrid.new(var_32_6)

	var_32_7.id = "RecentPlayersGrid"

	var_32_7:setUseStencil(true)
	var_32_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 652, _1080p * 383, _1080p * 1007)
	var_32_0:addElement(var_32_7)

	var_32_0.RecentPlayersGrid = var_32_7

	local var_32_8
	local var_32_9 = LUI.UIText.new()

	var_32_9.id = "NoPlayersLabel"

	var_32_9:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_32_9:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_RECENT_PLAYERS"), 0)
	var_32_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_32_9:SetAlignment(LUI.Alignment.Center)
	var_32_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 136, _1080p * -167, _1080p * 95, _1080p * 127)
	var_32_0:addElement(var_32_9)

	var_32_0.NoPlayersLabel = var_32_9

	local var_32_10
	local var_32_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_32_1
	})

	var_32_11.id = "VerticalScrollbar"

	var_32_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 658, _1080p * 671, _1080p * 383, _1080p * 1008)
	var_32_0:addElement(var_32_11)

	var_32_0.VerticalScrollbar = var_32_11

	local var_32_12
	local var_32_13 = LUI.UIText.new()

	var_32_13.id = "ActivisionPlayersLabel"

	var_32_13:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_32_13:setText(Engine.CBBHFCGDIC("LUA_MENU/RECENT_ACTIVISION_FRIENDS"), 0)
	var_32_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_32_13:SetAlignment(LUI.Alignment.Left)
	var_32_13:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 146, _1080p * -176, _1080p * 354, _1080p * 374)
	var_32_0:addElement(var_32_13)

	var_32_0.ActivisionPlayersLabel = var_32_13

	local var_32_14
	local var_32_15 = LUI.UIImage.new()

	var_32_15.id = "Line"

	var_32_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_32_15:SetAlpha(0.4, 0)
	var_32_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 146, _1080p * 649, _1080p * 376, _1080p * 377)
	var_32_0:addElement(var_32_15)

	var_32_0.Line = var_32_15

	local var_32_16

	if not CONDITIONS.IsWeGame(var_32_0) then
		var_32_16 = LUI.UIText.new()
		var_32_16.id = "SearchPlatformLabel"

		var_32_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_32_16:setText(Engine.CBBHFCGDIC("LUA_MENU/SEARCH_FRIEND_USING"), 0)
		var_32_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_32_16:SetAlignment(LUI.Alignment.Left)
		var_32_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 146, _1080p * -419, _1080p * 205, _1080p * 225)
		var_32_0:addElement(var_32_16)

		var_32_0.SearchPlatformLabel = var_32_16
	end

	local var_32_17

	if not CONDITIONS.IsWeGame(var_32_0) then
		var_32_17 = MenuBuilder.BuildRegisteredType("CompactDropdown", {
			controllerIndex = var_32_1
		})
		var_32_17.id = "PlatformDropdown"

		var_32_17.GamepadPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT2_BUTTON"), 0)
		var_32_17:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 387, _1080p * -213, _1080p * 201, _1080p * 361)
		var_32_0:addElement(var_32_17)

		var_32_0.PlatformDropdown = var_32_17
	end

	local function var_32_18()
		return
	end

	var_32_0._sequences.DefaultSequence = var_32_18

	local var_32_19
	local var_32_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 290
		}
	}

	var_32_13:RegisterAnimationSequence("AR", var_32_20)

	if not CONDITIONS.IsWeGame(var_32_0) then
		local var_32_21 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -213
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 377
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 228
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 202
			}
		}

		var_32_16:RegisterAnimationSequence("AR", var_32_21)
	end

	if not CONDITIONS.IsWeGame(var_32_0) then
		local var_32_22 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 146
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -454
			}
		}

		var_32_17:RegisterAnimationSequence("AR", var_32_22)
	end

	local function var_32_23()
		var_32_13:AnimateSequence("AR")

		if not CONDITIONS.IsWeGame(var_32_0) then
			var_32_16:AnimateSequence("AR")
		end

		if not CONDITIONS.IsWeGame(var_32_0) then
			var_32_17:AnimateSequence("AR")
		end
	end

	var_32_0._sequences.AR = var_32_23

	local var_32_24 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_32_11,
		startCap = var_32_11.startCap,
		endCap = var_32_11.endCap,
		sliderArea = var_32_11.sliderArea,
		slider = var_32_11.sliderArea and var_32_11.sliderArea.slider,
		fixedSizeSlider = var_32_11.sliderArea and var_32_11.sliderArea.fixedSizeSlider
	})

	var_32_7:AddScrollbar(var_32_24)
	var_0_5(var_32_0, var_32_1, arg_32_1)

	return var_32_0
end

MenuBuilder.registerType("SocialAddFriends", SocialAddFriends)
LockTable(_M)
