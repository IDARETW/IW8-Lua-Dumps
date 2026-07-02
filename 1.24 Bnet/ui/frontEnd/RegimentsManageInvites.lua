module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITES"))

	arg_1_0._clanID = arg_1_2.clanID

	local var_1_0 = {}

	if arg_1_2.init then
		arg_1_0.Tabs:SetAlpha(0)
	else
		var_1_0[#var_1_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INVITE_PLAYERS")),
			id = FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS,
			hasDefaultFocus = arg_1_2.defaultTabFocus == FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS
		}
	end

	var_1_0[#var_1_0 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITES")),
		id = FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS,
		hasDefaultFocus = arg_1_2.defaultTabFocus == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS
	}
	arg_1_0.tabNamesAndIDs = var_1_0

	local var_1_1 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		table.insert(var_1_1, {
			name = iter_1_1.name,
			hasDefaultFocus = iter_1_1.hasDefaultFocus,
			disabled = iter_1_1.disabled,
			focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				local var_2_0 = arg_1_0.tabNamesAndIDs[arg_2_2 + 1].id

				if arg_1_0.activeTabID ~= var_2_0 then
					arg_1_0.activeTabID = var_2_0

					if arg_1_0.activeTabWidget then
						arg_1_0.activeTabWidget:closeTree()

						arg_1_0.activeTabWidget = nil
					end

					if var_2_0 == FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS then
						arg_1_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialAddFriends", {
							isRegiments = true,
							controllerIndex = arg_2_1,
							platform = CoD.GetActiveSocialFriendsPlatform(),
							clanID = arg_1_0._clanID
						})
					elseif var_2_0 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
						arg_1_0.activeTabWidget = MenuBuilder.BuildRegisteredType("RegimentsPendingInvites", {
							controllerIndex = arg_2_1,
							init = arg_1_2.init,
							noFence = arg_1_2.noFence,
							clanID = arg_1_0._clanID,
							localClientRole = arg_1_2.localClientRole
						})
					else
						assert(false)
					end

					arg_1_0:addElement(arg_1_0.activeTabWidget)

					if arg_2_3 ~= FocusType.MouseOver and arg_2_3 ~= FocusType.MenuFlow then
						arg_1_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end
				end

				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		})
	end

	arg_1_0.Tabs:SetTabs(var_1_1)
	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_1_0, arg_1_1)
end

function RegimentsManageInvites(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_3_0.id = "RegimentsManageInvites"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "MenuTitle"

	var_3_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITES")), 0)
	var_3_4.Line:SetLeft(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_3_0:addElement(var_3_4)

	var_3_0.MenuTitle = var_3_4

	local var_3_5
	local var_3_6 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_3_1
			})
		end,
		controllerIndex = var_3_1
	}
	local var_3_7 = LUI.TabManager.new(var_3_6)

	var_3_7.id = "Tabs"

	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 677, _1080p * 108, _1080p * 160)
	var_3_0:addElement(var_3_7)

	var_3_0.Tabs = var_3_7

	local var_3_8 = LUI.UIBindButton.new()

	var_3_8.id = "selfBindButton"

	var_3_0:addElement(var_3_8)

	var_3_0.bindButton = var_3_8

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_3_1
		end

		if CONDITIONS.IsGamepadEnabled(var_3_0) then
			ACTIONS.LeaveMenu(var_3_0)
		end
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RegimentsManageInvites", RegimentsManageInvites)
LockTable(_M)
