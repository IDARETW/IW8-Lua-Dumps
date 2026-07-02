module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.activeTabID == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES then
		local var_1_0 = Clans.BJJADIBFB(arg_1_0._controllerIndex, arg_1_0._clanID)

		arg_1_0.activeTabWidget:SetupPlayerGrid(var_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITE"))

	arg_2_0._clanID = arg_2_2.clanID
	arg_2_0._platform = CoD.GetActiveSocialFriendsPlatform()
	arg_2_0._controllerIndex = arg_2_1

	local var_2_0 = {}

	var_2_0[#var_2_0 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INVITE_PLAYERS")),
		id = FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS,
		hasDefaultFocus = arg_2_2.defaultTabFocus == FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS
	}
	var_2_0[#var_2_0 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SENT_INVITES")),
		id = FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES,
		hasDefaultFocus = arg_2_2.defaultTabFocus == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES
	}
	arg_2_0.tabNamesAndIDs = var_2_0

	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		table.insert(var_2_1, {
			name = iter_2_1.name,
			hasDefaultFocus = iter_2_1.hasDefaultFocus,
			focusFunction = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
				local var_3_0 = arg_2_0.tabNamesAndIDs[arg_3_2 + 1].id

				if arg_2_0.activeTabID ~= var_3_0 then
					arg_2_0.activeTabID = var_3_0

					if arg_2_0.activeTabWidget then
						arg_2_0.activeTabWidget:closeTree()

						arg_2_0.activeTabWidget = nil
					end

					if var_3_0 == FRIENDS.ManageRegimentInvitesTabIDs.INVITE_PLAYERS then
						local var_3_1 = {
							isRegiments = true,
							controllerIndex = arg_3_1,
							platform = arg_2_0._platform,
							clanID = arg_2_0._clanID
						}

						arg_2_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialAddFriends", var_3_1)
					elseif var_3_0 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
						local var_3_2 = {
							controllerIndex = arg_3_1,
							tabID = FRIENDS.TabIDs.REGIMENTS,
							subTabID = var_3_0,
							clanID = arg_2_0._clanID,
							noPlayerText = Engine.CBBHFCGDIC("LUA_MENU/NO_SENT_INVITES")
						}

						arg_2_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPopupLayout", var_3_2)

						var_0_0(arg_2_0)
					else
						assert(false)
					end

					arg_2_0:addElement(arg_2_0.activeTabWidget)

					if arg_3_3 ~= FocusType.MouseOver and arg_3_3 ~= FocusType.MenuFlow then
						arg_2_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end
				end

				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		})
	end

	arg_2_0.Tabs:SetTabs(var_2_1)
	arg_2_0.Tabs:SizeTabsToFit()
	arg_2_0:registerEventHandler("clans_notification", function(arg_4_0, arg_4_1)
		if arg_4_1.options.genEventName == "clans_invite_canceled" then
			var_0_0(arg_4_0)
		end
	end)
end

function SocialRegimentsInvitePopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_5_0.id = "SocialRegimentsInvitePopup"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "MenuTitle"

	var_5_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS")), 0)
	var_5_4.Line:SetLeft(0, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.MenuTitle = var_5_4

	local var_5_5
	local var_5_6 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_5_1
			})
		end,
		controllerIndex = var_5_1
	}
	local var_5_7 = LUI.TabManager.new(var_5_6)

	var_5_7.id = "Tabs"

	var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 677, _1080p * 108, _1080p * 160)
	var_5_0:addElement(var_5_7)

	var_5_0.Tabs = var_5_7

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SocialRegimentsInvitePopup", SocialRegimentsInvitePopup)
LockTable(_M)
