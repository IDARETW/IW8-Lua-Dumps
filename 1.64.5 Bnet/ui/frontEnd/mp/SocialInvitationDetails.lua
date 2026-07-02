module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0._invitationData.clanId

	if arg_1_0._playerData and arg_1_0._playerData.isLocalClient then
		return Clans2.CFGBBBHFHB(arg_1_0._controllerIndex)
	elseif arg_1_0._playerData and CLANS.IsValidId(var_1_0) then
		return var_1_0
	else
		return CLANS.INVALID_CLAN_ID_STRING
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = EmblemEditorUtils.GetEmblemImageFromID(arg_2_1)

	if var_2_0 == nil or #var_2_0 == 0 then
		var_2_0 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
	end

	arg_2_0.ClanEmblemWidget:SetNonClanEmblem(var_2_0)
end

local function var_0_2(arg_3_0)
	local var_3_0 = arg_3_0._invitationData.emblemIndex

	if var_3_0 then
		return
	end

	if EmblemEditorUtils.IsClanEmblem(var_3_0) then
		local var_3_1 = var_0_0(arg_3_0)

		if CLANS.IsValidId(var_3_1) then
			local var_3_2 = Clans2.CJBHDGCJFJ(arg_3_0._controllerIndex, var_3_1)

			arg_3_0.ClanEmblem:SetEmblem(var_3_2, false)
		else
			var_0_1(arg_3_0, var_3_0)
		end
	else
		var_0_1(arg_3_0, var_3_0)
	end
end

local function var_0_3(arg_4_0)
	local var_4_0 = arg_4_0._playerData and arg_4_0._playerData.fullName or arg_4_0._invitationData.fullName

	arg_4_0.NameLabel:setText(var_4_0)
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1 ~= nil and #arg_5_1 > 0

	if var_5_0 then
		arg_5_0.InvitationDescription:setText(Engine.CBBHFCGDIC(arg_5_1))
	end

	arg_5_0.InvitationDescription:SetAlpha(var_5_0 and 1 or 0)
end

local function var_0_5(arg_6_0)
	local var_6_0 = arg_6_0._invitationData.timestamp
	local var_6_1 = var_6_0 ~= nil and #var_6_0 > 0

	if var_6_1 then
		arg_6_0.TimestampLabel:setText(var_6_0)
	end

	arg_6_0.TimestampLabel:SetAlpha(var_6_1 and 1 or 0)
end

local function var_0_6(arg_7_0)
	local var_7_0
	local var_7_1 = arg_7_0._id == FRIENDS.INVITATIONS.ID.CLANS2_REQUEST_SENT
	local var_7_2 = arg_7_0._id == FRIENDS.INVITATIONS.ID.FRIEND_INVITE_SENT
	local var_7_3 = var_7_1 or var_7_2
	local var_7_4 = arg_7_0._invitationData.xuid

	if not var_7_3 and var_7_4 then
		var_7_0 = Friends.HCAFBJBHC(arg_7_0._controllerIndex, var_7_4)
		var_7_0 = FRIENDS.UnifyPlayerDataFormat(var_7_0)
	elseif var_7_3 then
		var_7_0 = {
			isLocalClient = true,
			fullName = Engine.BAGAFBABEE(arg_7_0._controllerIndex)
		}
	end

	arg_7_0._playerData = var_7_0
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_1)

	arg_8_0._invitationData = arg_8_1
	arg_8_0._id = arg_8_1.invitationId or nil

	var_0_6(arg_8_0)
	var_0_2(arg_8_0)
	var_0_3(arg_8_0)
	var_0_4(arg_8_0, arg_8_2)
	var_0_5(arg_8_0)
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0._invitationData = nil
	arg_9_0._id = nil
	arg_9_0.SetupInvitationDetails = var_0_7
end

function SocialInvitationDetails(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalStackedLayout.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 360 * _1080p)

	var_10_0.id = "SocialInvitationDetails"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0

	var_10_0:SetSpacing(12 * _1080p)

	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "ClanEmblemWidget"

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 342, 0, _1080p * 224)
	var_10_0:addElement(var_10_4)

	var_10_0.ClanEmblemWidget = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIStyledText.new()

	var_10_6.id = "NameLabel"

	var_10_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL"), 0)
	var_10_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_6:SetAlignment(LUI.Alignment.Center)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 236, _1080p * 272)
	var_10_0:addElement(var_10_6)

	var_10_0.NameLabel = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIStyledText.new()

	var_10_8.id = "InvitationDescription"

	var_10_8:setText(Engine.CBBHFCGDIC("INBOX/CLANS2_INVITE_RECEIVED_DESC"), 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_8:SetAlignment(LUI.Alignment.Center)
	var_10_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 284, _1080p * 308)
	var_10_0:addElement(var_10_8)

	var_10_0.InvitationDescription = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIStyledText.new()

	var_10_10.id = "TimestampLabel"

	var_10_10:setText(Engine.CBBHFCGDIC("INBOX/INVITE_TIMESTAMP"), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 320, _1080p * 344)
	var_10_0:addElement(var_10_10)

	var_10_0.TimestampLabel = var_10_10

	var_0_8(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("SocialInvitationDetails", SocialInvitationDetails)
LockTable(_M)
