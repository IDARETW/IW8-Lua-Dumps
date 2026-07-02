module(..., package.seeall)

local var_0_0 = "GroupssSocialInvitePopup"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.Description:getText()

	arg_1_2:AddTooltipData(arg_1_1, {
		tooltipDescription = var_1_0
	})
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.AddOfficersButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			defaultTabFocus = FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS,
			clanID = arg_2_0._clanID,
			localClientRole = arg_2_0._localClientRole
		})
	end)
	var_0_1(arg_2_0, arg_2_1, arg_2_0.AddOfficersButton)
	arg_2_0.RemoveOfficersButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			defaultTabFocus = FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS,
			clanID = arg_2_0._clanID,
			localClientRole = arg_2_0._localClientRole
		})
	end)
	var_0_1(arg_2_0, arg_2_1, arg_2_0.RemoveOfficersButton)
	arg_2_0.KickMembers:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			defaultTabFocus = FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS,
			clanID = arg_2_0._clanID,
			localClientRole = arg_2_0._localClientRole
		})
	end)
	var_0_1(arg_2_0, arg_2_1, arg_2_0.KickMembers)
	arg_2_0.InviteMembers:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		assert(arg_2_0._clanID)

		if not MenuBuilder.IsTypeRegistered(var_0_0) then
			local function var_6_0(arg_7_0, arg_7_1)
				local var_7_0 = {
					groupClanId = arg_7_1.groupClanId
				}
				local var_7_1 = MenuBuilder.BuildRegisteredType("ClansSocialInvite", {
					controllerIndex = arg_7_1.controllerIndex,
					usage = CLANS.CLAN_SOCIAL_INVITE_INPUT.GROUPS,
					data = var_7_0
				})
				local var_7_2 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
					controllerIndex = arg_7_1.controllerIndex,
					widget = var_7_1
				})

				var_7_2.id = var_0_0

				var_7_1:SetParent(var_7_2)

				return var_7_2
			end

			MenuBuilder.registerType(var_0_0, var_6_0)
		end

		LUI.FlowManager.RequestPopupMenu(nil, var_0_0, true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			groupClanId = arg_2_0._clanID
		})
	end)
	var_0_1(arg_2_0, arg_2_1, arg_2_0.InviteMembers)
	arg_2_0.TransferOwnershipButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		assert(arg_2_0._clanID)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			transferOwnership = true,
			controllerIndex = arg_2_1,
			clanID = arg_2_0._clanID
		})
	end)
	var_0_1(arg_2_0, arg_2_1, arg_2_0.TransferOwnershipButton)
	arg_2_0.DeleteButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)

		local var_9_0 = Clans.CEACCICGB(arg_2_1) or {}
		local var_9_1 = -1

		for iter_9_0 = 1, #var_9_0 do
			if var_9_0[iter_9_0] ~= arg_2_0._clanID then
				var_9_1 = var_9_0[iter_9_0]

				break
			end
		end

		if arg_2_0._localClientRole == OnlineClanRole.OWNER then
			local var_9_2 = FRIENDS.RegimentPopupActions.DELETE

			if Clans.DGGFBEFIBC(arg_2_1, arg_2_0._clanID) > 1 then
				var_9_2 = FRIENDS.RegimentPopupActions.CANNOT_DELETE
			end

			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_2_1, false, {
				controllerIndex = arg_2_1,
				clanID = arg_2_0._clanID,
				switchToID = var_9_1,
				action = var_9_2
			})
		else
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_2_1, false, {
				controllerIndex = arg_2_1,
				clanID = arg_2_0._clanID,
				switchToID = var_9_1,
				action = FRIENDS.RegimentPopupActions.LEAVE
			})
		end
	end)
	var_0_1(arg_2_0, arg_2_1, arg_2_0.DeleteButton)
	arg_2_0:registerEventHandler("clans_notification", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1.options

		if var_10_0.genEventName == "clans_left_clan_active" or var_10_0.genEventName == "clans_left_clan_inactive" then
			if var_10_0.success then
				LUI.FlowManager.RequestLeaveMenu(arg_2_0)
			else
				local var_10_1 = var_10_0.error
				local var_10_2 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_10_3 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					title = var_10_2,
					message = var_10_3
				})
			end
		end
	end)
end

function RegimentsManagementButtons(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalList.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 500 * _1080p)

	var_11_0.id = "RegimentsManagementButtons"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	var_11_0:SetSpacing(5 * _1080p)

	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Spacer1"

	var_11_4:SetRGBFromInt(0, 0)
	var_11_4:SetAlpha(0, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 10)
	var_11_0:addElement(var_11_4)

	var_11_0.Spacer1 = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIText.new()

	var_11_6.id = "ManageMembers"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_6:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_MEMBERS"), 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_6:SetAlignment(LUI.Alignment.Left)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 15, _1080p * 35)
	var_11_0:addElement(var_11_6)

	var_11_0.ManageMembers = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Line2"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_8:SetAlpha(0.4, 0)
	var_11_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 41)
	var_11_0:addElement(var_11_8)

	var_11_0.Line2 = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "AddOfficersButton"

	var_11_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ADD_OFFICERS"), 0)
	var_11_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/ADD_OFFICERS_DESC"), 0)
	var_11_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_11_10.DisabledText:SetAnimMoveTime(2000)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 46, _1080p * 96)
	var_11_0:addElement(var_11_10)

	var_11_0.AddOfficersButton = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "RemoveOfficersButton"

	var_11_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_OFFICERS"), 0)
	var_11_12.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_OFFICER_DESC"), 0)
	var_11_12.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_11_12.DisabledText:SetAnimMoveTime(2000)
	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 101, _1080p * 151)
	var_11_0:addElement(var_11_12)

	var_11_0.RemoveOfficersButton = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "KickMembers"

	var_11_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/KICK_MEMBERS"), 0)
	var_11_14.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/KICK_MEMBERS_DESC"), 0)
	var_11_14.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_11_14.DisabledText:SetAnimMoveTime(2000)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 156, _1080p * 206)
	var_11_0:addElement(var_11_14)

	var_11_0.KickMembers = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "InviteMembers"

	var_11_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/INVITE_SOCIAL"), 0)
	var_11_16.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/INVITE_SOCIAL_DESC"), 0)
	var_11_16.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_11_16.DisabledText:SetAnimMoveTime(2000)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 211, _1080p * 261)
	var_11_0:addElement(var_11_16)

	var_11_0.InviteMembers = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIImage.new()

	var_11_18.id = "Spacer2"

	var_11_18:SetRGBFromInt(0, 0)
	var_11_18:SetAlpha(0, 0)
	var_11_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 266, _1080p * 276)
	var_11_0:addElement(var_11_18)

	var_11_0.Spacer2 = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIText.new()

	var_11_20.id = "Ownership"

	var_11_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_20:setText(Engine.CBBHFCGDIC("LUA_MENU/OWNERSHIP"), 0)
	var_11_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_20:SetAlignment(LUI.Alignment.Left)
	var_11_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 281, _1080p * 301)
	var_11_0:addElement(var_11_20)

	var_11_0.Ownership = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIImage.new()

	var_11_22.id = "Line3"

	var_11_22:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_22:SetAlpha(0.4, 0)
	var_11_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 306, _1080p * 307)
	var_11_0:addElement(var_11_22)

	var_11_0.Line3 = var_11_22

	local var_11_23
	local var_11_24 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_11_1
	})

	var_11_24.id = "TransferOwnershipButton"

	var_11_24.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP"), 0)
	var_11_24.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP_BUTTON_DESC"), 0)
	var_11_24.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_11_24.DisabledText:SetAnimMoveTime(2000)
	var_11_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 312, _1080p * 362)
	var_11_0:addElement(var_11_24)

	var_11_0.TransferOwnershipButton = var_11_24

	local var_11_25
	local var_11_26 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_11_1
	})

	var_11_26.id = "DeleteButton"

	var_11_26.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/DELETE_REGIMENT"), 0)
	var_11_26.Description:setText(Engine.CBBHFCGDIC("REGIMENTS/DELETE_REGIMENT_BUTTON_DESC"), 0)
	var_11_26.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_11_26.DisabledText:SetAnimMoveTime(2000)
	var_11_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 367, _1080p * 417)
	var_11_0:addElement(var_11_26)

	var_11_0.DeleteButton = var_11_26

	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("RegimentsManagementButtons", RegimentsManagementButtons)
LockTable(_M)
