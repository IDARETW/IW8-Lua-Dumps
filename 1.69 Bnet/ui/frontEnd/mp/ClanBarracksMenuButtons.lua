module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0._controllerIndex
	local var_1_1 = Engine.EAGGAEGHHA(var_1_0)
	local var_1_2 = Clans2.CFGBBBHFHB(var_1_0)

	if Clans2.CFDHGBFICH(var_1_0, var_1_2, var_1_1) >= CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER then
		arg_1_0.ClanMembersButton.Text:setText(Engine.CBBHFCGDIC("CLANS/MANAGE_MEMBERS"))
		arg_1_0.ClanMembersButton.Description:setText(Engine.CBBHFCGDIC("CLANS/MANAGE_MEMBERS_DESC"))

		local var_1_3 = Clans2.BJJADIBFB(arg_1_0._controllerIndex, var_1_2)
		local var_1_4 = Clans2.DGGAFGIEBJ(arg_1_0._controllerIndex, var_1_2)

		if #var_1_3 > 0 or #var_1_4 > 0 then
			arg_1_0.ClanMembersButton:UpdateNewItemNotification(1)
		else
			arg_1_0.ClanMembersButton:UpdateNewItemNotification(0)
		end
	else
		arg_1_0.ClanMembersButton.Text:setText(Engine.CBBHFCGDIC("CLANS/MEMBER_LIST"))
		arg_1_0.ClanMembersButton.Description:setText(Engine.CBBHFCGDIC("CLANS/MEMBER_LIST_DESC"))
		arg_1_0.ClanMembersButton:UpdateNewItemNotification(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.Buttons = {
		[arg_2_0.ClanDashboardButton.id] = arg_2_0.ClanDashboardButton,
		[arg_2_0.ClanMembersButton.id] = arg_2_0.ClanMembersButton,
		[arg_2_0.ClanInfoButton.id] = arg_2_0.ClanInfoButton
	}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.Buttons) do
		assert(iter_2_1.Description)
		iter_2_1:setGainFocusSFX(SOUND_SETS.mpMainMenu.move)
		iter_2_1:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown)
		iter_2_1:AddTooltipData(arg_2_1, {
			tooltipDescription = iter_2_1.Description:getText()
		})
	end

	arg_2_0:addAndCallEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_3_0, arg_3_1)
		var_0_0(arg_2_0)
	end)
end

function ClanBarracksMenuButtons(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalList.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 650 * _1080p)

	var_4_0.id = "ClanBarracksMenuButtons"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(10 * _1080p)

	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "ClanDashboardButton"

	var_4_4.Text:setText(Engine.CBBHFCGDIC("CLANS/DASHBOARD"), 0)
	var_4_4.Description:setText(Engine.CBBHFCGDIC("CLANS/DASHBOARD_BUTTON_DESC"), 0)
	var_4_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_4_4.DisabledText:SetAnimMoveTime(2000)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_4_0:addElement(var_4_4)

	var_4_0.ClanDashboardButton = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ClanMembersButton"

	var_4_6.Text:setText(Engine.CBBHFCGDIC("CLANS/MEMBER_LIST"), 0)
	var_4_6.Description:setText(Engine.CBBHFCGDIC("CLANS/MEMBER_LIST_BUTTON_DESC"), 0)
	var_4_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_4_6.DisabledText:SetAnimMoveTime(2000)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
	var_4_0:addElement(var_4_6)

	var_4_0.ClanMembersButton = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ClanInfoButton"

	var_4_8.Text:setText(Engine.CBBHFCGDIC("CLANS/CLAN_INFO"), 0)
	var_4_8.Description:setText(Engine.CBBHFCGDIC("CLANS/CLAN_INFO_BUTTON_DESC"), 0)
	var_4_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_4_8.DisabledText:SetAnimMoveTime(2000)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
	var_4_0:addElement(var_4_8)

	var_4_0.ClanInfoButton = var_4_8

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClanBarracksMenuButtons", ClanBarracksMenuButtons)
LockTable(_M)
