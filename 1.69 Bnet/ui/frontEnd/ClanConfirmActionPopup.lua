module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1.memberName and arg_1_1.xuid)

	local var_1_0 = arg_1_0._clanDetails
	local var_1_1 = Engine.JCBDICCAH(var_1_0.clanTag)
	local var_1_2 = Engine.JCBDICCAH(var_1_0.clanName)
	local var_1_3 = Engine.JCBDICCAH(arg_1_1.memberName)

	arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNERSHIP_POPUP_HEADER")))
	arg_1_0.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNERSHIP_POPUP_DESC", var_1_1, var_1_2, var_1_1, var_1_3))
	arg_1_0.ErrorLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/FAILED_TO_PROMOTE_TO_OWNER"))
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		DebugPrint("Transferring Ownership")
		arg_1_0.ErrorLabel:SetAlpha(0)

		if Clans2.BJDBJGDJBB(arg_1_0._controllerIndex, var_1_0.clanId, arg_1_1.xuid) then
			arg_1_0:dispatchEventToRoot({
				dispatchChildren = true,
				immediate = true,
				name = CLANS.CLAN_EVENTS.CLAN_OWNER_TRANSFERRED
			})
			ACTIONS.LeaveMenu(arg_1_0)
		else
			arg_1_0.ErrorLabel:SetAlpha(1)
		end
	end)
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_CLAN_NAME")))

	local var_3_0 = arg_3_1.clanName

	arg_3_0.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_CLAN_NAME_DESC", Engine.JCBDICCAH(var_3_0)))
	arg_3_0.ConfirmButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		DebugPrint("Changing Clan Name")
		arg_3_0.ErrorLabel:SetAlpha(0)
		DebugPrint("New Clan Name: " .. tostring(var_3_0))
		arg_3_0:dispatchEventToRoot({
			dispatchChildren = true,
			immediate = true,
			name = CLANS.CLAN_EVENTS.CLAN_NAME_EDITED,
			options = {
				newName = var_3_0
			}
		})
		ACTIONS.LeaveMenu(arg_3_0)
	end)
end

local function var_0_2(arg_5_0, arg_5_1)
	arg_5_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_CLAN_TAG")))

	local var_5_0 = arg_5_1.clanTag

	arg_5_0.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_CLAN_TAG_DESC", Engine.JCBDICCAH(var_5_0)))
	arg_5_0.ConfirmButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		DebugPrint("Changing Clan Tag")
		arg_5_0.ErrorLabel:SetAlpha(0)
		DebugPrint("New Clan Tag: " .. tostring(var_5_0))
		arg_5_0:dispatchEventToRoot({
			dispatchChildren = true,
			immediate = true,
			name = CLANS.CLAN_EVENTS.CLAN_TAG_EDITED,
			options = {
				newTag = var_5_0
			}
		})
		ACTIONS.LeaveMenu(arg_5_0)
	end)
end

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("CLANS/LEAVE_CLAN")))

	local var_7_0 = Engine.JCBDICCAH(arg_7_1.clanDetails.clanTag)
	local var_7_1 = Engine.JCBDICCAH(arg_7_1.clanDetails.clanName)

	arg_7_0.Description:setText(Engine.CBBHFCGDIC("CLANS/LEAVE_CLAN_CONFIRMATION", var_7_0, var_7_1))
	arg_7_0.ConfirmButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		DebugPrint("Leaving Clan")
		arg_7_0.ErrorLabel:SetAlpha(0)
		arg_7_0:dispatchEventToRoot({
			dispatchChildren = true,
			immediate = true,
			name = CLANS.CLAN_EVENTS.CLAN_LEAVE_FROM_POPUP
		})
		ACTIONS.LeaveMenu(arg_7_0)
	end)
end

local function var_0_4(arg_9_0, arg_9_1)
	arg_9_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("CLANS/DISBAND_CLAN")))

	local var_9_0 = Engine.JCBDICCAH(arg_9_1.clanDetails.clanTag)
	local var_9_1 = Engine.JCBDICCAH(arg_9_1.clanDetails.clanName)

	arg_9_0.Description:setText(Engine.CBBHFCGDIC("CLANS/DISBAND_CLAN_CONFIRMATION", var_9_0, var_9_1))
	arg_9_0.ConfirmButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		DebugPrint("Disbanding Clan")
		arg_9_0.ErrorLabel:SetAlpha(0)
		arg_9_0:dispatchEventToRoot({
			dispatchChildren = true,
			immediate = true,
			name = CLANS.CLAN_EVENTS.CLAN_DISBAND_FROM_POPUP
		})
		ACTIONS.LeaveMenu(arg_9_0)
	end)
end

local function var_0_5(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_2.usage and arg_11_2.clanDetails)

	arg_11_0._controllerIndex = arg_11_1
	arg_11_0._usage = arg_11_2.usage
	arg_11_0._clanDetails = arg_11_2.clanDetails

	if arg_11_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_TRANSFER_OWNERSHIP then
		var_0_0(arg_11_0, arg_11_2)
	elseif arg_11_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_NAME then
		var_0_1(arg_11_0, arg_11_2)
	elseif arg_11_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_TAG then
		var_0_2(arg_11_0, arg_11_2)
	elseif arg_11_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_LEAVE_CLAN then
		var_0_3(arg_11_0, arg_11_2)
	elseif arg_11_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_DISBAND_CLAN then
		var_0_4(arg_11_0, arg_11_2)
	end

	arg_11_0.ClanEmblem:SetEmblem(arg_11_2.clanDetails.emblemData, true)
	arg_11_0.CancelButton:registerEventHandler("button_action", function(arg_12_0, arg_12_1)
		ACTIONS.LeaveMenu(arg_11_0)
	end)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_11_0, arg_11_1, {
		addWorldBlur = true,
		addScreenDarkener = true,
		darkenerOpacity = LAYOUT.DEFAULT_POPUP_DARKENER_OPACITY
	})
end

function ClanConfirmActionPopup(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0.id = "ClanConfirmActionPopup"

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "GenericPopupWindow"

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_13_4.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_13_4.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_13_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_13_0:addElement(var_13_4)

	var_13_0.GenericPopupWindow = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIText.new()

	var_13_6.id = "Title"

	var_13_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNERSHIP_POPUP_HEADER")), 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_6:SetAlignment(LUI.Alignment.Left)
	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -144, _1080p * -84)
	var_13_0:addElement(var_13_6)

	var_13_0.Title = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIStyledText.new()

	var_13_8.id = "Description"

	var_13_8:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNERSHIP_POPUP_DESC"), 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_8:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 443, _1080p * -84, _1080p * -64)
	var_13_0:addElement(var_13_8)

	var_13_0.Description = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "ConfirmButton"

	var_13_10.Text:SetLeft(_1080p * 20, 0)
	var_13_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNERSHIP_CONFIRM"), 0)
	var_13_10.Text:SetAlignment(LUI.Alignment.Left)
	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 180, _1080p * 52, _1080p * 90)
	var_13_0:addElement(var_13_10)

	var_13_0.ConfirmButton = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "CancelButton"

	var_13_12.Text:SetLeft(_1080p * 20, 0)
	var_13_12.Text:setText(Engine.CBBHFCGDIC("MENU/CANCEL"), 0)
	var_13_12.Text:SetAlignment(LUI.Alignment.Left)
	var_13_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 180, _1080p * 97, _1080p * 135)
	var_13_0:addElement(var_13_12)

	var_13_0.CancelButton = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "ClanEmblem"

	var_13_14:SetScale(1, 0)
	var_13_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * -332, _1080p * -64, _1080p * 64)
	var_13_0:addElement(var_13_14)

	var_13_0.ClanEmblem = var_13_14

	local var_13_15
	local var_13_16 = LUI.UIText.new()

	var_13_16.id = "ErrorLabel"

	var_13_16:SetRGBFromTable(SWATCHES.genericMenu.failed, 0)
	var_13_16:SetAlpha(0, 0)
	var_13_16:setText(Engine.CBBHFCGDIC("LUA_MENU/FAILED_TO_PROMOTE_TO_OWNER"), 0)
	var_13_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_16:SetAlignment(LUI.Alignment.Left)
	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1220, _1080p * 556, _1080p * 574)
	var_13_0:addElement(var_13_16)

	var_13_0.ErrorLabel = var_13_16

	var_0_5(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("ClanConfirmActionPopup", ClanConfirmActionPopup)
LockTable(_M)
