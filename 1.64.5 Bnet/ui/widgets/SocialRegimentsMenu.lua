module(..., package.seeall)

if not MenuBuilder.IsTypeRegistered("RegimentInvitationPopup") then
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
			var_1_1.ButtonHelperBar:PushButtonPrompt({
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
end

if not MenuBuilder.IsTypeRegistered("RegimentInvitePopup") then
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
end

local function var_0_2(arg_5_0, arg_5_1)
	if not arg_5_0.MenuLayout or not arg_5_0._activeClanID or arg_5_0._activeClanID == -1 then
		return
	end

	if arg_5_0._updateClanInfo then
		local var_5_0 = Clans.GFFJCJFIJ(arg_5_0._controllerIndex, arg_5_0._activeClanID)
		local var_5_1 = var_5_0.name

		if var_5_0.clanTag then
			var_5_1 = "[" .. var_5_0.clanTag .. "] " .. var_5_0.name
		end

		FRIENDS.SetPlayerGridHeader(arg_5_0.MenuLayout, var_5_1, nil, true)

		arg_5_0._clanRole = Clans.CFDHGBFICH(arg_5_0._controllerIndex, arg_5_0._activeClanID, arg_5_0._localPlayerXuid)
		arg_5_0._isMember = arg_5_0._activeClanID and arg_5_0._clanRole == OnlineClanRole.MEMBER

		if not arg_5_0._isMember then
			arg_5_0._helperBar:PushButtonPrompt({
				side = "left",
				priority = 10,
				replaceTop = true,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITE"),
				container = arg_5_0.MenuLayout.FirstTopPromptContainer
			})
			ACTIONS.AnimateSequence(arg_5_0.MenuLayout, "ShowFirstPrompt")
		else
			arg_5_0._helperBar:PopButtonPrompt({
				button_ref = "button_alt2"
			})
			ACTIONS.AnimateSequence(arg_5_0.MenuLayout, "HideFirstPrompt")
		end

		local var_5_2 = arg_5_0._isMember and Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT") or Engine.CBBHFCGDIC("LUA_MENU/MANAGE_REGIMENT")

		arg_5_0._helperBar:PushButtonPrompt({
			side = "left",
			priority = 30,
			replaceTop = true,
			button_ref = "button_r3",
			helper_text = var_5_2,
			container = arg_5_0.MenuLayout.ThirdTopPromptContainer
		})
		arg_5_0._helperBar.ButtonHelperText:PushButtonPrompt({
			side = "right",
			priority = 30,
			replaceTop = true,
			button_ref = "button_left_trigger",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT"),
			container = arg_5_0.MenuLayout.FourthTopPromptContainer
		})

		arg_5_0._updateClanInfo = false
	end

	local var_5_3 = Clans.DGGFBEFIBC(arg_5_0._controllerIndex, arg_5_0._activeClanID)
	local var_5_4 = Engine.CBBHFCGDIC("REGIMENTS/ROSTER_COUNT", var_5_3, FRIENDS.CLANS_MAX_MEMBERS)

	FRIENDS.SetPlayerGridHeader(arg_5_0.MenuLayout, nil, var_5_4, true)

	local var_5_5 = arg_5_0.MenuLayout.PlayersGrid

	var_5_5.playersData = FRIENDS.GetGroupMembers(arg_5_0._controllerIndex, arg_5_0._activeClanID) or {}

	local var_5_6 = #var_5_5.playersData

	if var_5_5._lastChildrenCount == nil or var_5_5._lastChildrenCount ~= var_5_6 then
		if LUI.IsLastInputMouseNavigation(arg_5_0._controllerIndex) then
			local var_5_7 = var_5_5._shouldFocus

			var_5_5._shouldFocus = false

			var_5_5:SetNumChildren(var_5_6)

			var_5_5._shouldFocus = var_5_7
		else
			var_5_5:SetNumChildren(var_5_6)
		end
	end

	var_5_5._lastChildrenCount = var_5_6

	var_5_5:RefreshContent()
	arg_5_0.HappyHourWidget:SetAlpha(0)
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
	arg_7_0._helperBar:PopButtonPrompt({
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
	arg_9_0.HappyHourWidget:SetAlpha(0)

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
	arg_9_0.bindButton:addEventHandler("button_left_trigger", function(arg_15_0, arg_15_1)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsSwitchPopup", true, arg_9_0._controllerIndex, false, {
			controllerIndex = arg_9_0._controllerIndex
		})
	end)
	ACTIONS.AnimateSequence(arg_9_0.MenuLayout, "ShowFourthContainer")
end

local function var_0_7(arg_16_0, arg_16_1)
	if arg_16_0.regimentsInit then
		return
	end

	arg_16_0._activeClanID = nil

	var_0_4(arg_16_0)

	local var_16_0 = arg_16_1 and arg_16_1._disableAllButtons
	local var_16_1 = MenuBuilder.BuildRegisteredType("RegimentsInit", {
		controllerIndex = arg_16_0._controllerIndex,
		disableAllButtons = var_16_0
	})

	var_16_1.id = "RegimentsInit"

	arg_16_0:addElement(var_16_1)

	arg_16_0.regimentsInit = var_16_1

	if arg_16_0._helperBar then
		arg_16_0._helperBar:PushButtonPrompt({
			side = "left",
			button_ref = "button_left_trigger",
			helper_text = ""
		})
	end
end

local function var_0_8(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.GetPlayerGrid = var_0_3
	arg_17_0.CreateRegimentsInit = var_0_7
	arg_17_0.CreateMenuLayout = var_0_6
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._helperBar = arg_17_2.helperBar
	arg_17_0._menu = arg_17_2.menu
	arg_17_0._updateClanInfo = true
	arg_17_0._localPlayerXuid = Engine.EAGGAEGHHA(arg_17_1)
	arg_17_0._clanIDs = Clans.CEACCICGB(arg_17_1) or {}

	if #arg_17_0._clanIDs > 0 then
		arg_17_0._activeClanID = Clans.CFGBBBHFHB(arg_17_0._controllerIndex)

		if arg_17_0._activeClanID then
			var_0_6(arg_17_0)
		else
			var_0_7(arg_17_0, {
				_disableAllButtons = true
			})
		end
	else
		var_0_7(arg_17_0)
	end

	arg_17_0:addEventHandler("change_active_clan", function(arg_18_0, arg_18_1)
		if not arg_18_0._activeClanID or arg_18_0._activeClanID == -1 then
			if not arg_18_1.newActiveClanID or arg_18_1.newActiveClanID == -1 then
				arg_18_0:CreateRegimentsInit()
			else
				arg_18_0._activeClanID = arg_18_1.newActiveClanID
				arg_18_0._updateClanInfo = true

				arg_18_0:CreateMenuLayout()
			end
		elseif arg_18_1.newActiveClanID then
			if arg_18_1.newActiveClanID == -1 then
				arg_18_0:CreateRegimentsInit()
			else
				arg_18_0._activeClanID = arg_18_1.newActiveClanID
				arg_18_0._updateClanInfo = true

				arg_18_0:CreateMenuLayout()
				var_0_2(arg_18_0)
			end
		end

		return true
	end)
	arg_17_0:registerEventHandler("clans_notification", function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_1.options

		if var_19_0.genEventName == "clans_activated_clan" then
			if var_19_0.success then
				arg_17_0:dispatchEventToRoot({
					name = "change_active_clan",
					newActiveClanID = var_19_0.clanId
				})
			else
				local var_19_1 = var_19_0.error
				local var_19_2 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_19_3 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupOK", true, arg_17_1, false, {
					title = var_19_2,
					message = var_19_3
				})
			end

			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
		elseif var_19_0.genEventName == "clans_initialized_clan" then
			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)

			if var_19_0.success then
				LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_19_1.controller, false, {
					controllerIndex = arg_17_1,
					message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
				})

				if not Clans.FAFJFADBJ(arg_17_1, var_19_0.clanId) then
					LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
					LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupOK", true, arg_17_1, false, {
						title = Engine.CBBHFCGDIC("MENU/ERROR"),
						message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
					})
				end
			else
				local var_19_4 = var_19_0.error
				local var_19_5 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_19_6 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupOK", true, arg_17_1, false, {
					title = var_19_5,
					message = var_19_6
				})
			end
		elseif var_19_0.genEventName == "clans_promoted_to_owner" or var_19_0.genEventName == "clans_promoted_to_officer" or var_19_0.genEventName == "clans_demoted_to_member" or var_19_0.genEventName == "clans_demoted_to_officer" or var_19_0.genEventName == "clans_kicked_from_clan" then
			if var_19_0.success then
				local var_19_7 = true

				if var_19_0.genEventName == "clans_kicked_from_clan" then
					if arg_17_0._activeClanID == var_19_0.clanId then
						var_0_4(arg_17_0)

						local var_19_8 = Clans.CEACCICGB(arg_17_1) or {}

						if #var_19_8 > 0 then
							LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_17_1, false, {
								controllerIndex = arg_17_1,
								message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
							})

							if not Clans.FAFJFADBJ(arg_17_1, var_19_8[1]) then
								LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
								LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupOK", true, arg_17_1, false, {
									title = Engine.CBBHFCGDIC("MENU/ERROR"),
									message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
								})
							end
						else
							var_0_7(arg_17_0)
						end

						arg_17_0._clanIDs = {}
					else
						var_19_7 = false
					end
				end

				if var_19_7 then
					LUI.FlowManager.RequestLeaveMenuByName("RegimentsSwitchPopup", true, true)
					LUI.FlowManager.RequestLeaveMenuByName("RegimentsManagementPopup", true, true)
				end

				arg_19_0._updateClanInfo = true

				var_0_2(arg_19_0)
			else
				local var_19_9 = var_19_0.error
				local var_19_10 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_19_11 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupOK", true, arg_17_1, false, {
					title = var_19_10,
					message = var_19_11
				})
			end
		end
	end)

	if not Onboarding.GroupsRevealAfterRegimentTransition.WasCompleted(arg_17_0, arg_17_0._controllerIndex) then
		LUI.FlowManager.RequestPopupMenu(arg_17_0, "onboardingpopup", true, arg_17_0._controllerIndex, false, ONBOARDING_DATA.GetGroupsRevealData())
		Onboarding.GroupsRevealAfterRegimentTransition.MarkCompleted(arg_17_0, arg_17_0._controllerIndex)
	end
end

function SocialRegimentsMenu(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0.id = "SocialRegimentsMenu"

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = MenuBuilder.BuildRegisteredType("HappyHourWidget", {
		controllerIndex = var_20_1
	})

	var_20_4.id = "HappyHourWidget"

	var_20_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1696, _1080p * 175, _1080p * 251)
	var_20_0:addElement(var_20_4)

	var_20_0.HappyHourWidget = var_20_4

	var_0_8(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("SocialRegimentsMenu", SocialRegimentsMenu)
LockTable(_M)
