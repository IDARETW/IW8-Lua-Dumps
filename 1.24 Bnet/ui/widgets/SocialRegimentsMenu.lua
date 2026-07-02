module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("SocialRegimentsInvitationsPopup", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		quickCloseEvent = "closing_quick_access_menu",
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0,
		disableQuickAccessShortcuts = arg_1_1.disableQuickAccessShortcuts
	})

	var_1_1.id = "RegimentInvitationPopup"

	if var_1_1 and var_1_1.ButtonHelperBar then
		var_1_1.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("REGIMENTS/BLOCK_INVITES")
		})
	end

	var_1_1:addEventHandler("closing_quick_access_menu", function(arg_2_0, arg_2_1)
		arg_2_0:exitAnimation(arg_2_0, arg_1_1)
	end)

	return var_1_1
end

MenuBuilder.registerType("RegimentInvitationPopup", var_0_0)

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = MenuBuilder.BuildRegisteredType("SocialRegimentsInvitePopup", arg_3_1)
	local var_3_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		quickCloseEvent = "closing_quick_access_menu",
		controllerIndex = arg_3_1.controllerIndex,
		widget = var_3_0,
		disableQuickAccessShortcuts = arg_3_1.disableQuickAccessShortcuts
	})

	var_3_1.id = "RegimentInvitePopup"

	var_3_1:addEventHandler("closing_quick_access_menu", function(arg_4_0, arg_4_1)
		arg_4_0:exitAnimation(arg_4_0, arg_3_1)
	end)

	return var_3_1
end

MenuBuilder.registerType("RegimentInvitePopup", var_0_1)

local function var_0_2(arg_5_0, arg_5_1)
	if not arg_5_0.MenuLayout or not arg_5_0._activeClanID or arg_5_0._activeClanID == -1 then
		return
	end

	if arg_5_0._updateClanInfo then
		local var_5_0 = Clans.GFFJCJFIJ(arg_5_0._controllerIndex, arg_5_0._activeClanID)
		local var_5_1 = "[" .. var_5_0.clanTag .. "] " .. var_5_0.name

		arg_5_0.MenuLayout:SetHeader(var_5_1, nil, true)

		arg_5_0._clanRole = Clans.CFDHGBFICH(arg_5_0._controllerIndex, arg_5_0._activeClanID, arg_5_0._localPlayerXuid)
		arg_5_0._isMember = arg_5_0._activeClanID and arg_5_0._clanRole == OnlineClanRole.MEMBER

		if not arg_5_0._isMember then
			arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				priority = 10,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITE"),
				container = arg_5_0.MenuLayout.FirstTopPromptContainer
			})
			ACTIONS.AnimateSequence(arg_5_0.MenuLayout, "ShowFirstPrompt")
		else
			arg_5_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt2"
			})
			ACTIONS.AnimateSequence(arg_5_0.MenuLayout, "HideFirstPrompt")
		end

		arg_5_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_r3"
		})

		local var_5_2 = arg_5_0._isMember and Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT") or Engine.CBBHFCGDIC("LUA_MENU/MANAGE_REGIMENT")

		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 30,
			button_ref = "button_r3",
			helper_text = var_5_2,
			container = arg_5_0.MenuLayout.ThirdTopPromptContainer
		})

		arg_5_0._updateClanInfo = false
	end

	local var_5_3 = Clans.DGGFBEFIBC(arg_5_0._controllerIndex, arg_5_0._activeClanID)
	local var_5_4 = Engine.CBBHFCGDIC("REGIMENTS/ROSTER_COUNT", var_5_3, FRIENDS.CLANS_MAX_MEMBERS)

	arg_5_0.MenuLayout:SetHeader(nil, var_5_4, true)

	local var_5_5 = arg_5_0.MenuLayout.PlayersGrid

	var_5_5.playersData = Clans.GIDGAGEAC(arg_5_0._controllerIndex, arg_5_0._activeClanID) or {}

	var_5_5:SetNumChildren(#var_5_5.playersData)
	var_5_5:RefreshContent()
	arg_5_0.HappyHourWidget:SetAlpha(1)
	arg_5_0.HappyHourWidget:SetupHappyHour(arg_5_0._activeClanID)
end

local function var_0_3(arg_6_0)
	return arg_6_0.MenuLayout.PlayersGrid
end

local function var_0_4(arg_7_0)
	if arg_7_0.MenuLayout then
		arg_7_0.MenuLayout:closeTree()

		arg_7_0.MenuLayout = nil
	end

	arg_7_0.HappyHourWidget:SetAlpha(0)
	arg_7_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		button_ref = "button_alt2"
	})
end

local function var_0_5(arg_8_0)
	if arg_8_0.regimentsInit then
		arg_8_0.regimentsInit:closeTree()

		arg_8_0.regimentsInit = nil
	end
end

local function var_0_6(arg_9_0)
	if arg_9_0.MenuLayout then
		return
	end

	var_0_5(arg_9_0)

	local var_9_0
	local var_9_1 = MenuBuilder.BuildRegisteredType("SocialMenuLayout", {
		controllerIndex = arg_9_0._controllerIndex,
		tabID = FRIENDS.TabIDs.REGIMENTS,
		menu = arg_9_0
	})

	var_9_1.id = "MenuLayout"

	var_9_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	arg_9_0:addElement(var_9_1)

	arg_9_0.MenuLayout = var_9_1

	arg_9_0.MenuLayout:SetRefreshChildFuncByTab(FRIENDS.TabIDs.REGIMENTS)
	arg_9_0.HappyHourWidget:SetAlpha(1)

	if not arg_9_0.socialRegimentsTimer then
		local var_9_2 = LUI.UITimer.new({
			interval = 1000,
			event = "update_social_regiments"
		})

		var_9_2.id = "socialRegimentsTimer"

		arg_9_0:addElement(var_9_2)
		arg_9_0:addAndCallEventHandler("update_social_regiments", var_0_2)

		arg_9_0.socialRegimentsTimer = var_9_2
	end

	arg_9_0.MenuLayout.InviteButton:SetPromptText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATIONS"))

	local var_9_3 = LUI.UIBindButton.new()

	var_9_3.id = "bindButton"

	arg_9_0:addElement(var_9_3)

	arg_9_0.bindButton = var_9_3

	arg_9_0.bindButton:addEventHandler("button_alt1", function(arg_10_0, arg_10_1)
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentInvitationPopup", true, arg_10_1.controller, false, {
			controllerIndex = arg_10_1.controller
		})
	end)

	local function var_9_4(arg_11_0)
		local var_11_0 = {
			tabID = FRIENDS.TabIDs.REGIMENTS,
			controllerIndex = arg_11_0,
			clanID = arg_9_0._activeClanID
		}

		LUI.FlowManager.RequestPopupMenu(nil, "RegimentInvitePopup", true, arg_11_0, false, var_11_0)
	end

	arg_9_0.bindButton:addEventHandler("button_alt2", function(arg_12_0, arg_12_1)
		var_9_4(arg_12_1.controller)
	end)
	arg_9_0.MenuLayout.InviteButton:SetAction(function(arg_13_0, arg_13_1)
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentInvitationPopup", true, arg_13_1.controller, false, {
			controllerIndex = arg_13_1.controller
		})
	end)
	arg_9_0.bindButton:addEventHandler("button_right_stick", function(arg_14_0, arg_14_1)
		if not arg_9_0.MenuLayout then
			return
		end

		if arg_9_0._isMember then
			local var_14_0 = Clans.CEACCICGB(arg_9_0._controllerIndex) or {}
			local var_14_1 = -1

			for iter_14_0 = 1, #var_14_0 do
				if var_14_0[iter_14_0] ~= arg_9_0._activeClanID then
					var_14_1 = var_14_0[iter_14_0]

					break
				end
			end

			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_9_0._controllerIndex, false, {
				controllerIndex = arg_9_0._controllerIndex,
				clanID = arg_9_0._activeClanID,
				switchToID = var_14_1,
				action = FRIENDS.RegimentPopupActions.LEAVE
			})
		else
			LUI.FlowManager.RequestAddMenu("ManageRegimentMenu", true, arg_9_0._controllerIndex, false, {
				clanID = arg_9_0._activeClanID,
				localClientRole = arg_9_0._clanRole
			})
		end
	end)

	if arg_9_0._menu and arg_9_0._menu.HelperBar then
		arg_9_0._menu.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_left_trigger",
			priority = 20,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT")
		})
	end

	arg_9_0.bindButton:addEventHandler("button_left_trigger", function(arg_15_0, arg_15_1)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsSwitchPopup", true, arg_9_0._controllerIndex, false, {
			controllerIndex = arg_9_0._controllerIndex
		})
	end)
	arg_9_0.bindButton:addEventHandler("button_right_trigger", function(arg_16_0, arg_16_1)
		if FRIENDS.GetCurrentClanTagType(arg_9_0._controllerIndex) == ClanTagType.CUSTOM then
			Engine.GGIHFEAGD(arg_9_0._controllerIndex, ClanTagType.OFFICIAL)
			arg_9_0._menu.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_right_trigger"
			})

			local var_16_0 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				description = Engine.CBBHFCGDIC("REGIMENTS/REGIMENT_CLAN_TAG_SET")
			}

			arg_9_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_16_0
			})
			arg_9_0:dispatchEventToRoot({
				name = "change_active_clan_tag_type"
			})
		end
	end)
end

local function var_0_7(arg_17_0)
	if arg_17_0.regimentsInit then
		return
	end

	arg_17_0._activeClanID = nil

	var_0_4(arg_17_0)

	local var_17_0 = MenuBuilder.BuildRegisteredType("RegimentsInit", {
		controllerIndex = arg_17_0._controllerIndex
	})

	var_17_0.id = "RegimentsInit"

	arg_17_0:addElement(var_17_0)

	arg_17_0.regimentsInit = var_17_0

	if arg_17_0._menu and arg_17_0._menu.HelperBar then
		arg_17_0._menu.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_left_trigger",
			helper_text = ""
		})
	end
end

local function var_0_8(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.GetPlayerGrid = var_0_3
	arg_18_0.CreateRegimentsInit = var_0_7
	arg_18_0.CreateMenuLayout = var_0_6
	arg_18_0._controllerIndex = arg_18_1
	arg_18_0._menu = arg_18_2.menu
	arg_18_0._updateClanInfo = true
	arg_18_0._localPlayerXuid = Engine.EAGGAEGHHA(arg_18_1)
	arg_18_0._clanIDs = Clans.CEACCICGB(arg_18_1) or {}

	if #arg_18_0._clanIDs > 0 then
		arg_18_0._activeClanID = Clans.CFGBBBHFHB(arg_18_0._controllerIndex)

		assert(arg_18_0._activeClanID)
		var_0_6(arg_18_0)
	else
		var_0_7(arg_18_0)
	end

	arg_18_0:addEventHandler("change_active_clan", function(arg_19_0, arg_19_1)
		if not arg_19_0._activeClanID or arg_19_0._activeClanID == -1 then
			if not arg_19_1.newActiveClanID or arg_19_1.newActiveClanID == -1 then
				arg_19_0:CreateRegimentsInit()
			else
				arg_19_0._activeClanID = arg_19_1.newActiveClanID
				arg_19_0._updateClanInfo = true

				arg_19_0:CreateMenuLayout()
			end
		elseif arg_19_1.newActiveClanID then
			if arg_19_1.newActiveClanID == -1 then
				arg_19_0:CreateRegimentsInit()
			else
				arg_19_0._activeClanID = arg_19_1.newActiveClanID
				arg_19_0._updateClanInfo = true

				var_0_2(arg_19_0)
			end
		end

		return true
	end)
	arg_18_0:registerEventHandler("clans_notification", function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_1.options

		if var_20_0.genEventName == "clans_activated_clan" then
			if var_20_0.success then
				arg_18_0:dispatchEventToRoot({
					name = "change_active_clan",
					newActiveClanID = var_20_0.clanId
				})
			else
				local var_20_1 = var_20_0.error
				local var_20_2 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_20_3 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_18_0, "PopupOK", true, arg_18_1, false, {
					title = var_20_2,
					message = var_20_3
				})
			end

			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
		elseif var_20_0.genEventName == "clans_promoted_to_owner" or var_20_0.genEventName == "clans_promoted_to_officer" or var_20_0.genEventName == "clans_demoted_to_member" or var_20_0.genEventName == "clans_demoted_to_officer" or var_20_0.genEventName == "clans_kicked_from_clan" then
			if var_20_0.success then
				local var_20_4 = true

				if var_20_0.genEventName == "clans_kicked_from_clan" then
					if arg_18_0._activeClanID == var_20_0.clanId then
						var_0_4(arg_18_0)

						local var_20_5 = Clans.CEACCICGB(arg_18_1) or {}

						if #var_20_5 > 0 then
							LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_18_1, false, {
								controllerIndex = arg_18_1,
								message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
							})

							if not Clans.FAFJFADBJ(arg_18_1, var_20_5[1]) then
								LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
								LUI.FlowManager.RequestPopupMenu(arg_18_0, "PopupOK", true, arg_18_1, false, {
									title = Engine.CBBHFCGDIC("MENU/ERROR"),
									message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
								})
							end
						else
							var_0_7(arg_18_0)
						end

						arg_18_0._clanIDs = {}
					else
						var_20_4 = false
					end
				end

				if var_20_4 then
					LUI.FlowManager.RequestLeaveMenuByName("RegimentsSwitchPopup", true, true)
					LUI.FlowManager.RequestLeaveMenuByName("RegimentsManagementPopup", true, true)
				end

				arg_20_0._updateClanInfo = true

				var_0_2(arg_20_0)
			else
				local var_20_6 = var_20_0.error
				local var_20_7 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_20_8 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_18_0, "PopupOK", true, arg_18_1, false, {
					title = var_20_7,
					message = var_20_8
				})
			end
		end
	end)
end

function SocialRegimentsMenu(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0.id = "SocialRegimentsMenu"

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	var_21_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_21_1
	})
	var_21_0.HelperBar.id = "HelperBar"

	var_21_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_21_0.HelperBar:setPriority(10)
	var_21_0:addElement(var_21_0.HelperBar)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = MenuBuilder.BuildRegisteredType("HappyHourWidget", {
		controllerIndex = var_21_1
	})

	var_21_4.id = "HappyHourWidget"

	var_21_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1696, _1080p * 175, _1080p * 251)
	var_21_0:addElement(var_21_4)

	var_21_0.HappyHourWidget = var_21_4

	var_0_8(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("SocialRegimentsMenu", SocialRegimentsMenu)
LockTable(_M)
