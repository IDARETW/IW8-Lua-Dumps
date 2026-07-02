module(..., package.seeall)

local var_0_0 = 1
local var_0_1 = 2

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("SocialManagePartyPopup", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0,
		disableQuickAccessShortcuts = arg_1_1.disableQuickAccessShortcuts
	})

	var_1_1.id = "ManagePartyPopup"

	var_1_1:addEventHandler("closing_quick_access_menu", function(arg_2_0, arg_2_1)
		arg_2_0:exitAnimation(arg_2_0, arg_1_1)
	end)

	return var_1_1
end

MenuBuilder.registerType("ManagePartyPopup", var_0_2)

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.MenuTitle)
	arg_3_0.MenuTitle:SetMaxRightEdge(500)

	arg_3_0._isCreated = false

	local var_3_0 = Engine.CBBHFCGDIC("LUA_MENU/MANAGE_PARTY")

	if arg_3_2.menuTitle then
		var_3_0 = arg_3_2.menuTitle
	end

	arg_3_0.MenuTitle:SetTitle(var_3_0)
	arg_3_0.MenuTitle:SetAlpha(0)

	local var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/INVITE_PLAYERS")

	if arg_3_2.inviteTabTitle then
		var_3_1 = arg_3_2.inviteTabTitle
	end

	if arg_3_2.defaultTabFocus == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS or arg_3_2.defaultTabFocus == FRIENDS.ManagePartyTabIDs.KICK_PLAYERS then
		assert(arg_3_2.areWeHost)
	end

	if not Engine.DDJFBBJAIG() then
		ACTIONS.AnimateSequence(arg_3_0, "inGame")
	end

	local var_3_2 = arg_3_2.areWeHost and not Engine.CIFCEGIDAI()
	local var_3_3 = {
		[var_0_0] = {
			name = ToUpperCase(var_3_1),
			id = FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS,
			hasDefaultFocus = var_3_2 and arg_3_2.defaultTabFocus == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS or false,
			disabled = not var_3_2
		},
		[var_0_1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC(Engine.HDGDBCJFG() and "LUA_MENU/ACTIVISION_PARTY_INVITATIONS" or "LUA_MENU/PARTY_INVITATIONS")),
			id = FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS,
			hasDefaultFocus = var_3_2 and arg_3_2.defaultTabFocus == FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS or true
		}
	}

	if CONDITIONS.InFrontend() then
		var_3_3[#var_3_3 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KICK_PLAYERS")),
			id = FRIENDS.ManagePartyTabIDs.KICK_PLAYERS,
			hasDefaultFocus = arg_3_2.defaultTabFocus == FRIENDS.ManagePartyTabIDs.KICK_PLAYERS,
			disabled = not arg_3_2.areWeHost
		}
	end

	arg_3_0.tabNamesAndIDs = var_3_3

	local var_3_4 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_3) do
		table.insert(var_3_4, {
			name = iter_3_1.name,
			hasDefaultFocus = iter_3_1.hasDefaultFocus,
			disabled = iter_3_1.disabled,
			focusFunction = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
				local var_4_0 = arg_3_0.tabNamesAndIDs[arg_4_2 + 1].id

				if arg_3_0.activeTabID ~= var_4_0 then
					arg_3_0.activeTabID = var_4_0

					if arg_3_0.activeTabWidget then
						arg_3_0.activeTabWidget:closeTree()

						arg_3_0.activeTabWidget = nil
					end

					if arg_3_0.PlayerDetailsAvailability then
						arg_3_0.PlayerDetailsAvailability.m_requireFocusType = FocusType.MouseOver

						arg_3_0.bindButton:addEventHandler("button_right_trigger", function(arg_5_0, arg_5_1)
							arg_3_0.PlayerDetailsAvailability:ChangeDropdownState(arg_4_1)
						end)
					end

					if var_4_0 == FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("PartyInvitationPopup", {
							controllerIndex = arg_4_1,
							tabID = FRIENDS.TabIDs.PRIVATE_PARTY,
							subTabID = FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS
						})
					elseif var_4_0 == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPartyQuickInvitePopup", {
							controllerIndex = arg_4_1
						})
					elseif var_4_0 == FRIENDS.ManagePartyTabIDs.KICK_PLAYERS then
						arg_3_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPartyKickPlayers", {
							controllerIndex = arg_4_1
						})
					else
						assert(false)
					end

					arg_3_0:addElement(arg_3_0.activeTabWidget)

					if arg_4_3 ~= FocusType.MouseOver and arg_4_3 ~= FocusType.MenuFlow then
						arg_3_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end
				end

				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			end
		})
	end

	arg_3_0.Tabs:SetTabs(var_3_4)
	arg_3_0.Tabs:SizeTabsToFit()
	arg_3_0:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
		arg_3_0._isCreated = true
	end)
	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_3_0, arg_3_1)
	METRICS.RecordSocialMenuOpeningFlow(arg_3_1, arg_3_2.hasUsedShortcut == true)

	local var_3_5 = DataSources.inGame.MP.match.postGameState

	if var_3_5 then
		arg_3_0.postGameHandler = arg_3_0:SubscribeToModel(var_3_5:GetModel(arg_3_1), function(arg_7_0)
			if DataModel.JJEHAEBDF(arg_7_0) ~= PostGameState.INACTIVE and not Engine.DDJFBBJAIG() and Engine.CIFCEGIDAI() then
				local var_7_0 = LUI.IsLastInputKeyboardMouse(arg_3_1) and FocusType.MouseOver or FocusType.Gamepad

				arg_3_0.Tabs:FocusTab(arg_3_1, var_0_1, var_7_0)
				arg_3_0.Tabs:GetTabAtIndex(var_0_0):Disable()
			end
		end)
	end
end

function SocialManagePartyPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_8_0.id = "SocialManagePartyPopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "MenuTitle"

	var_8_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_PARTY")), 0)
	var_8_4.Line:SetLeft(0, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 592, 0, _1080p * 100)
	var_8_0:addElement(var_8_4)

	var_8_0.MenuTitle = var_8_4

	local var_8_5

	if not Engine.HDGDBCJFG() and CONDITIONS.IsUserSignedInBnetFrontend(var_8_1) then
		var_8_5 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailability", {
			controllerIndex = var_8_1
		})
		var_8_5.id = "PlayerDetailsAvailability"

		var_8_5:SetAlpha(0, 0)
		var_8_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 607, _1080p * 807, _1080p * 69, _1080p * 209)
		var_8_0:addElement(var_8_5)

		var_8_0.PlayerDetailsAvailability = var_8_5
	end

	local var_8_6
	local var_8_7 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_8_1
			})
		end,
		controllerIndex = var_8_1
	}
	local var_8_8 = LUI.TabManager.new(var_8_7)

	var_8_8.id = "Tabs"

	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 677, _1080p * 108, _1080p * 160)
	var_8_0:addElement(var_8_8)

	var_8_0.Tabs = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10

	if not Engine.HDGDBCJFG() and CONDITIONS.IsUserSignedInBnetFrontend(var_8_1) then
		local var_8_11 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_5:RegisterAnimationSequence("inGame", var_8_11)
	end

	local var_8_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 603
		}
	}

	var_8_8:RegisterAnimationSequence("inGame", var_8_12)

	local function var_8_13()
		if not Engine.HDGDBCJFG() and CONDITIONS.IsUserSignedInBnetFrontend(var_8_1) then
			var_8_5:AnimateSequence("inGame")
		end

		var_8_8:AnimateSequence("inGame")
	end

	var_8_0._sequences.inGame = var_8_13

	local var_8_14 = LUI.UIBindButton.new()

	var_8_14.id = "selfBindButton"

	var_8_0:addElement(var_8_14)

	var_8_0.bindButton = var_8_14

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_8_1
		end

		if CONDITIONS.IsGamepadEnabled(var_8_0) then
			ACTIONS.LeaveMenu(var_8_0)
		end
	end)
	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SocialManagePartyPopup", SocialManagePartyPopup)
LockTable(_M)
