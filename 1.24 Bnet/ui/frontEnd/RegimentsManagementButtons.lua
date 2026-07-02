module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.Description:getText()

	arg_1_2:AddTooltipData(arg_1_1, {
		tooltipDescription = var_1_0
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.HappyHourButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		assert(arg_2_0._clanID)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsHappyHourMenu", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			clanID = arg_2_0._clanID
		})
	end)
	arg_2_0.AddOfficersButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			defaultTabFocus = FRIENDS.ManageRegimentMembersTabIDs.ADD_OFFICERS,
			clanID = arg_2_0._clanID,
			localClientRole = arg_2_0._localClientRole
		})
	end)
	var_0_0(arg_2_0, arg_2_1, arg_2_0.AddOfficersButton)
	arg_2_0.RemoveOfficersButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			defaultTabFocus = FRIENDS.ManageRegimentMembersTabIDs.REMOVE_OFFICERS,
			clanID = arg_2_0._clanID,
			localClientRole = arg_2_0._localClientRole
		})
	end)
	var_0_0(arg_2_0, arg_2_1, arg_2_0.RemoveOfficersButton)
	arg_2_0.KickMembers:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			controllerIndex = arg_2_1,
			defaultTabFocus = FRIENDS.ManageRegimentMembersTabIDs.KICK_MEMBERS,
			clanID = arg_2_0._clanID,
			localClientRole = arg_2_0._localClientRole
		})
	end)
	var_0_0(arg_2_0, arg_2_1, arg_2_0.KickMembers)
	arg_2_0.TransferOwnershipButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		assert(arg_2_0._clanID)
		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsMemberManagementPopup", true, arg_2_1, false, {
			transferOwnership = true,
			controllerIndex = arg_2_1,
			clanID = arg_2_0._clanID
		})
	end)
	var_0_0(arg_2_0, arg_2_1, arg_2_0.TransferOwnershipButton)
	arg_2_0.DeleteButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		assert(arg_2_0._clanID)
		assert(arg_2_0._localClientRole)

		local var_8_0 = Clans.CEACCICGB(arg_2_1) or {}
		local var_8_1 = -1

		for iter_8_0 = 1, #var_8_0 do
			if var_8_0[iter_8_0] ~= arg_2_0._clanID then
				var_8_1 = var_8_0[iter_8_0]

				break
			end
		end

		if arg_2_0._localClientRole == OnlineClanRole.OWNER then
			local var_8_2 = FRIENDS.RegimentPopupActions.DELETE

			if Clans.DGGFBEFIBC(arg_2_1, arg_2_0._clanID) > 1 then
				var_8_2 = FRIENDS.RegimentPopupActions.CANNOT_DELETE
			end

			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_2_1, false, {
				controllerIndex = arg_2_1,
				clanID = arg_2_0._clanID,
				switchToID = var_8_1,
				action = var_8_2
			})
		else
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentActionsPopup", true, arg_2_1, false, {
				controllerIndex = arg_2_1,
				clanID = arg_2_0._clanID,
				switchToID = var_8_1,
				action = FRIENDS.RegimentPopupActions.LEAVE
			})
		end
	end)
	var_0_0(arg_2_0, arg_2_1, arg_2_0.DeleteButton)
	arg_2_0:registerEventHandler("clans_notification", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.options

		if var_9_0.genEventName == "clans_left_clan_active" or var_9_0.genEventName == "clans_left_clan_inactive" then
			if var_9_0.success then
				LUI.FlowManager.RequestLeaveMenu(arg_2_0)
			else
				local var_9_1 = var_9_0.error
				local var_9_2 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_9_3 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					title = var_9_2,
					message = var_9_3
				})
			end
		end
	end)
end

function RegimentsManagementButtons(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalList.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 500 * _1080p)

	var_10_0.id = "RegimentsManagementButtons"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0

	var_10_0:SetSpacing(5 * _1080p)

	local var_10_3
	local var_10_4 = LUI.UIText.new()

	var_10_4.id = "HappyHour"

	var_10_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_4:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR"), 0)
	var_10_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_4:SetAlignment(LUI.Alignment.Left)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 20)
	var_10_0:addElement(var_10_4)

	var_10_0.HappyHour = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Line1"

	var_10_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_6:SetAlpha(0.4, 0)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 25, _1080p * 26)
	var_10_0:addElement(var_10_6)

	var_10_0.Line1 = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("HappyHourButton", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "HappyHourButton"

	var_10_8.HappyHourSetting:SetAnimMoveTime(2000)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 31, _1080p * 81)
	var_10_0:addElement(var_10_8)

	var_10_0.HappyHourButton = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Spacer1"

	var_10_10:SetRGBFromInt(0, 0)
	var_10_10:SetAlpha(0, 0)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 86, _1080p * 96)
	var_10_0:addElement(var_10_10)

	var_10_0.Spacer1 = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIText.new()

	var_10_12.id = "ManageMembers"

	var_10_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_MEMBERS"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 101, _1080p * 121)
	var_10_0:addElement(var_10_12)

	var_10_0.ManageMembers = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "Line2"

	var_10_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_14:SetAlpha(0.4, 0)
	var_10_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 126, _1080p * 127)
	var_10_0:addElement(var_10_14)

	var_10_0.Line2 = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "AddOfficersButton"

	var_10_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ADD_OFFICERS"), 0)
	var_10_16.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/ADD_OFFICERS_DESC"), 0)
	var_10_16.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_10_16.DisabledText:SetAnimMoveTime(2000)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 132, _1080p * 182)
	var_10_0:addElement(var_10_16)

	var_10_0.AddOfficersButton = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "RemoveOfficersButton"

	var_10_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_OFFICERS"), 0)
	var_10_18.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/REMOVE_OFFICER_DESC"), 0)
	var_10_18.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_10_18.DisabledText:SetAnimMoveTime(2000)
	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 187, _1080p * 237)
	var_10_0:addElement(var_10_18)

	var_10_0.RemoveOfficersButton = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "KickMembers"

	var_10_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/KICK_MEMBERS"), 0)
	var_10_20.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/KICK_MEMBERS_DESC"), 0)
	var_10_20.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_10_20.DisabledText:SetAnimMoveTime(2000)
	var_10_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 242, _1080p * 292)
	var_10_0:addElement(var_10_20)

	var_10_0.KickMembers = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIImage.new()

	var_10_22.id = "Spacer2"

	var_10_22:SetRGBFromInt(0, 0)
	var_10_22:SetAlpha(0, 0)
	var_10_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 297, _1080p * 307)
	var_10_0:addElement(var_10_22)

	var_10_0.Spacer2 = var_10_22

	local var_10_23
	local var_10_24 = LUI.UIText.new()

	var_10_24.id = "Ownership"

	var_10_24:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_24:setText(Engine.CBBHFCGDIC("LUA_MENU/OWNERSHIP"), 0)
	var_10_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_24:SetAlignment(LUI.Alignment.Left)
	var_10_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 312, _1080p * 332)
	var_10_0:addElement(var_10_24)

	var_10_0.Ownership = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIImage.new()

	var_10_26.id = "Line3"

	var_10_26:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_26:SetAlpha(0.4, 0)
	var_10_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 337, _1080p * 338)
	var_10_0:addElement(var_10_26)

	var_10_0.Line3 = var_10_26

	local var_10_27
	local var_10_28 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_10_1
	})

	var_10_28.id = "TransferOwnershipButton"

	var_10_28.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP"), 0)
	var_10_28.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP_BUTTON_DESC"), 0)
	var_10_28.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_10_28.DisabledText:SetAnimMoveTime(2000)
	var_10_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 343, _1080p * 393)
	var_10_0:addElement(var_10_28)

	var_10_0.TransferOwnershipButton = var_10_28

	local var_10_29
	local var_10_30 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_10_1
	})

	var_10_30.id = "DeleteButton"

	var_10_30.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/DELETE_REGIMENT"), 0)
	var_10_30.Description:setText(Engine.CBBHFCGDIC("REGIMENTS/DELETE_REGIMENT_BUTTON_DESC"), 0)
	var_10_30.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_10_30.DisabledText:SetAnimMoveTime(2000)
	var_10_30:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 398, _1080p * 448)
	var_10_0:addElement(var_10_30)

	var_10_0.DeleteButton = var_10_30

	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("RegimentsManagementButtons", RegimentsManagementButtons)
LockTable(_M)
