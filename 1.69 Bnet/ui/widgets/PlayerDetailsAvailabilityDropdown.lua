module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	arg_1_0.AvailableButton.m_requireFocusType = FocusType.MouseOver
	arg_1_0.AwayButton.m_requireFocusType = FocusType.MouseOver
	arg_1_0.BusyButton.m_requireFocusType = FocusType.MouseOver
	arg_1_0.AppearOfflineButton.m_requireFocusType = FocusType.MouseOver
end

function PlayerDetailsAvailabilityDropdown(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 130 * _1080p)

	var_2_0.id = "PlayerDetailsAvailabilityDropdown"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(4 * _1080p)

	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Spacer"

	var_2_4:SetAlpha(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_2_0:addElement(var_2_4)

	var_2_0.Spacer = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailabilityButton", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "AvailableButton"

	var_2_6.Dot:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusAvailable, 0)
	var_2_6.Arrow:SetAlpha(0, 0)
	var_2_6.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_ONLINE"), 0)
	var_2_6.AvailabilityLabel:SetAlignment(LUI.Alignment.Left)
	var_2_6.PadPromptLabel:SetAlpha(0, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 6, _1080p * 33)
	var_2_0:addElement(var_2_6)

	var_2_0.AvailableButton = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailabilityButton", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "AwayButton"

	var_2_8.Dot:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusAway, 0)
	var_2_8.Dot:setImage(RegisterMaterial("icon_bnet_away"), 0)
	var_2_8.Arrow:SetAlpha(0, 0)
	var_2_8.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_AWAY"), 0)
	var_2_8.AvailabilityLabel:SetAlignment(LUI.Alignment.Left)
	var_2_8.PadPromptLabel:SetAlpha(0, 0)
	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 37, _1080p * 64)
	var_2_0:addElement(var_2_8)

	var_2_0.AwayButton = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailabilityButton", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "BusyButton"

	var_2_10.Dot:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusBusy, 0)
	var_2_10.Dot:setImage(RegisterMaterial("icon_bnet_busy"), 0)
	var_2_10.Arrow:SetAlpha(0, 0)
	var_2_10.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_BUSY"), 0)
	var_2_10.AvailabilityLabel:SetAlignment(LUI.Alignment.Left)
	var_2_10.PadPromptLabel:SetAlpha(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 68, _1080p * 95)
	var_2_0:addElement(var_2_10)

	var_2_0.BusyButton = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailabilityButton", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "AppearOfflineButton"

	var_2_12.Dot:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusAppearOffline, 0)
	var_2_12.Dot:setImage(RegisterMaterial("icon_bnet_offline"), 0)
	var_2_12.Arrow:SetAlpha(0, 0)
	var_2_12.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_OFFLINE"), 0)
	var_2_12.AvailabilityLabel:SetAlignment(LUI.Alignment.Left)
	var_2_12.PadPromptLabel:SetAlpha(0, 0)
	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 99, _1080p * 126)
	var_2_0:addElement(var_2_12)

	var_2_0.AppearOfflineButton = var_2_12

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("PlayerDetailsAvailabilityDropdown", PlayerDetailsAvailabilityDropdown)
LockTable(_M)
