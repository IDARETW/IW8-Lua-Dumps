module(..., package.seeall)

local var_0_0 = 500

local function var_0_1(arg_1_0)
	local var_1_0 = arg_1_0._controllerIndex
	local var_1_1 = arg_1_0._coreData.clanId
	local var_1_2 = Clans2.GFFJCJFIJ(var_1_0, var_1_1)
	local var_1_3 = Engine.EAGGAEGHHA(var_1_0)
	local var_1_4 = Clans2.CFDHGBFICH(var_1_0, var_1_1, var_1_3)
	local var_1_5 = Clans2.CFDHGBFICH(var_1_0, var_1_1, arg_1_0._coreData.xuid)

	arg_1_0._playerData = {
		clanId = var_1_1,
		xuid = arg_1_0._coreData.xuid,
		clanDetails = var_1_2,
		viewerMemberRole = var_1_4,
		memberRole = var_1_5
	}
end

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_1 == CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
		return arg_2_0.MemberButton
	elseif arg_2_1 == CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER then
		return arg_2_0.OfficerButton
	elseif arg_2_1 == CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN then
		return arg_2_0.AdminButton
	elseif arg_2_1 == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		return arg_2_0.LeaderButton
	end
end

local function var_0_3(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(CLANS.CLAN_MEMBER_ROLE) do
		if iter_3_1 ~= CLANS.CLAN_MEMBER_ROLE.INVLAID_ROLE then
			arg_3_0._buttonStatus[iter_3_1] = {
				selected = false,
				locked = true
			}

			local var_3_0 = var_0_2(arg_3_0, iter_3_1)

			var_3_0.Lock:SetAlpha(1)
			var_3_0.Selected:SetEquipped(false)
		end
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0._buttonStatus[arg_4_1]

	arg_4_0._buttonStatus[arg_4_1] = {
		selected = var_4_0.selected,
		locked = arg_4_2
	}

	var_0_2(arg_4_0, arg_4_1).Lock:SetAlpha(arg_4_2 and 1 or 0)
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0._buttonStatus[arg_5_1]

	arg_5_0._buttonStatus[arg_5_1] = {
		selected = arg_5_2,
		locked = var_5_0.locked
	}

	var_0_2(arg_5_0, arg_5_1).Selected:SetEquipped(arg_5_2)
end

local function var_0_6(arg_6_0)
	var_0_3(arg_6_0)

	local var_6_0 = arg_6_0._playerData
	local var_6_1 = var_6_0.viewerMemberRole
	local var_6_2 = var_6_0.memberRole

	var_0_5(arg_6_0, var_6_2, true)

	if var_6_1 >= CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER and var_6_2 < var_6_1 then
		var_0_4(arg_6_0, CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER, false)
	end

	if var_6_1 >= CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN and var_6_2 < var_6_1 then
		var_0_4(arg_6_0, CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER, false)
		var_0_4(arg_6_0, CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER, false)
		var_0_4(arg_6_0, CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN, false)
	end

	if var_6_1 >= CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		var_0_4(arg_6_0, CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER, false)
	end
end

local function var_0_7(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0._playerData
	local var_7_1 = var_7_0.viewerMemberRole
	local var_7_2 = var_7_0.memberRole

	if arg_7_0._updateWaiting or arg_7_1.selected or arg_7_1.locked or var_7_1 <= var_7_2 then
		return false
	end

	return true
end

local function var_0_8(arg_8_0, arg_8_1)
	CLANS.DispatchClanNotification(arg_8_0, Engine.CBBHFCGDIC("CLANS/MEMBER_RANK_CHANGED"), Engine.CBBHFCGDIC("CLANS/MEMBER_RANK_CHANGED_DESC", Engine.CBBHFCGDIC(CLANS.CLAN_MEMBER_ROLE_LOCALIZATION[arg_8_1])))
end

local function var_0_9(arg_9_0)
	arg_9_0._updateWaiting = true
	arg_9_0:Wait(var_0_0).onComplete = function()
		arg_9_0._updateWaiting = false

		var_0_1(arg_9_0)
		var_0_6(arg_9_0)
	end
end

local function var_0_10(arg_11_0)
	local var_11_0 = {
		controllerIndex = arg_11_0._controllerIndex,
		memberXUID = arg_11_0._coreData.xuid,
		clanId = arg_11_0._playerData.clanId,
		gamertag = arg_11_0._coreData.gamertag,
		leaveMenu = arg_11_0.id
	}

	LUI.FlowManager.RequestPopupMenu(arg_11_0, "BanClanMemberPopup", true, arg_11_0._controllerIndex, false, var_11_0)
end

local function var_0_11(arg_12_0)
	local var_12_0 = arg_12_0._buttonStatus[CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER]

	if var_0_7(arg_12_0, var_12_0) then
		LUI.FlowManager.RequestLeaveMenu(arg_12_0, false, true)
		LUI.FlowManager.RequestPopupMenu(arg_12_0, "ClanConfirmActionPopup", true, arg_12_0._controllerIndex, false, {
			controllerIndex = arg_12_0._controllerIndex,
			clanId = arg_12_0._playerData.clanId,
			usage = CLANS.CLAN_POPUP_INPUT.CLAN_TRANSFER_OWNERSHIP,
			clanDetails = arg_12_0._playerData.clanDetails,
			memberName = arg_12_0._coreData.name or arg_12_0._coreData.fullName or arg_12_0._coreData.fullNameWithHash,
			xuid = arg_12_0._coreData.xuid
		})
	end
end

local function var_0_12(arg_13_0)
	local var_13_0 = arg_13_0._buttonStatus[CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN]

	if var_0_7(arg_13_0, var_13_0) and Clans2.GBGAGGGAH(arg_13_0._controllerIndex, arg_13_0._playerData.clanId, arg_13_0._playerData.xuid) then
		var_0_8(arg_13_0, CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN)
		var_0_9(arg_13_0)
	end
end

local function var_0_13(arg_14_0)
	local var_14_0 = arg_14_0._buttonStatus[CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER]

	if var_0_7(arg_14_0, var_14_0) then
		local var_14_1 = arg_14_0._playerData.memberRole < CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER
		local var_14_2 = false

		if var_14_1 then
			var_14_2 = Clans2.DIHIDEGEA(arg_14_0._controllerIndex, arg_14_0._playerData.clanId, arg_14_0._playerData.xuid)
		else
			var_14_2 = Clans2.EBJEBJJFEG(arg_14_0._controllerIndex, arg_14_0._playerData.clanId, arg_14_0._playerData.xuid)
		end

		if var_14_2 then
			var_0_8(arg_14_0, CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER)
			var_0_9(arg_14_0)
		end
	end
end

local function var_0_14(arg_15_0)
	local var_15_0 = arg_15_0._buttonStatus[CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER]

	if var_0_7(arg_15_0, var_15_0) and Clans2.DBAJADFEG(arg_15_0._controllerIndex, arg_15_0._playerData.clanId, arg_15_0._playerData.xuid) then
		var_0_8(arg_15_0, CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER)
		var_0_9(arg_15_0)
	end
end

local function var_0_15(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2.playerData

	assert(var_16_0, "PlayerData passed CANNOT be NIL")

	arg_16_0._controllerIndex = arg_16_1
	arg_16_0._buttonStatus = {}
	arg_16_0._coreData = var_16_0

	var_0_1(arg_16_0)
	ACTIONS.AnimateSequence(arg_16_0.LeaderButton, "SelectedOffset")
	ACTIONS.AnimateSequence(arg_16_0.AdminButton, "SelectedOffset")
	ACTIONS.AnimateSequence(arg_16_0.OfficerButton, "SelectedOffset")
	ACTIONS.AnimateSequence(arg_16_0.MemberButton, "SelectedOffset")

	local var_16_1 = var_16_0.name or var_16_0.fullNameWithHash or var_16_0.fullName or var_16_0.gamerTag
	local var_16_2 = arg_16_0._playerData.clanDetails

	arg_16_0.ChangeRoleInfo:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_16_2.clanTag), Engine.JCBDICCAH(var_16_1)))
	var_0_6(arg_16_0)
	arg_16_0.LeaderButton:addEventHandler("button_action", function(arg_17_0, arg_17_1)
		var_0_11(arg_16_0)
	end)
	arg_16_0.AdminButton:addEventHandler("button_action", function(arg_18_0, arg_18_1)
		var_0_12(arg_16_0)
	end)
	arg_16_0.OfficerButton:addEventHandler("button_action", function(arg_19_0, arg_19_1)
		var_0_13(arg_16_0)
	end)
	arg_16_0.MemberButton:addEventHandler("button_action", function(arg_20_0, arg_20_1)
		var_0_14(arg_16_0)
	end)
	arg_16_0.BanMemberButton.Text:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus)
	arg_16_0.BanMemberButton:addEventHandler("button_action", function(arg_21_0, arg_21_1)
		var_0_10(arg_16_0)
	end)
	arg_16_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_OWNER_TRANSFERRED, function(arg_22_0, arg_22_1)
		var_0_9(arg_16_0)
	end)
end

function ClanChangeRankFlyout(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIVerticalNavigator.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_23_0.id = "ClanChangeRankFlyout"

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = LUI.UIText.new()

	var_23_4.id = "ChangeRoleHeader"

	var_23_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_CHANGE_ROLE")), 0)
	var_23_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_23_4:SetAlignment(LUI.Alignment.Left)
	var_23_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_23_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 37, _1080p * -42, _1080p * 27, _1080p * 77)
	var_23_0:addElement(var_23_4)

	var_23_0.ChangeRoleHeader = var_23_4

	local var_23_5
	local var_23_6 = LUI.UIText.new()

	var_23_6.id = "ChangeRoleInfo"

	var_23_6:setText("", 0)
	var_23_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_6:SetAlignment(LUI.Alignment.Left)
	var_23_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_23_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 37, _1080p * -42, _1080p * 88, _1080p * 124)
	var_23_0:addElement(var_23_6)

	var_23_0.ChangeRoleInfo = var_23_6

	local var_23_7
	local var_23_8 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_23_1
	})

	var_23_8.id = "LeaderButton"

	var_23_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OWNER")), 0)
	var_23_8.Text:SetAlignment(LUI.Alignment.Left)
	var_23_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 583, _1080p * 176, _1080p * 214)
	var_23_0:addElement(var_23_8)

	var_23_0.LeaderButton = var_23_8

	local var_23_9
	local var_23_10 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_23_1
	})

	var_23_10.id = "AdminButton"

	var_23_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ADMIN")), 0)
	var_23_10.Text:SetAlignment(LUI.Alignment.Left)
	var_23_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 583, _1080p * 226, _1080p * 264)
	var_23_0:addElement(var_23_10)

	var_23_0.AdminButton = var_23_10

	local var_23_11
	local var_23_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_23_1
	})

	var_23_12.id = "OfficerButton"

	var_23_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OFFICER")), 0)
	var_23_12.Text:SetAlignment(LUI.Alignment.Left)
	var_23_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 583, _1080p * 276, _1080p * 314)
	var_23_0:addElement(var_23_12)

	var_23_0.OfficerButton = var_23_12

	local var_23_13
	local var_23_14 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_23_1
	})

	var_23_14.id = "MemberButton"

	var_23_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MEMBER")), 0)
	var_23_14.Text:SetAlignment(LUI.Alignment.Left)
	var_23_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 583, _1080p * 326, _1080p * 364)
	var_23_0:addElement(var_23_14)

	var_23_0.MemberButton = var_23_14

	local var_23_15
	local var_23_16 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_23_1
	})

	var_23_16.id = "BanMemberButton"

	var_23_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BAN_MEMBER"), 0)
	var_23_16.Description:setText("", 0)
	var_23_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 583, _1080p * 438, _1080p * 487)
	var_23_0:addElement(var_23_16)

	var_23_0.BanMemberButton = var_23_16

	var_0_15(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("ClanChangeRankFlyout", ClanChangeRankFlyout)
LockTable(_M)
