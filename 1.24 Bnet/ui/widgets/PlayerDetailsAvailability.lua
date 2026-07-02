module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._dropdownState = not arg_1_0._dropdownState

	if arg_1_0._dropdownState then
		arg_1_0.AvailabilityButton.Arrow:SetZRotation(0)
		ACTIONS.AnimateSequence(arg_1_0, "DropdownOn")

		arg_1_0.AvailabilityDropdown.m_requireFocusType = FocusType.ListSelection
		arg_1_0.AvailabilityDropdown.AvailableButton.m_requireFocusType = nil
		arg_1_0.AvailabilityDropdown.AwayButton.m_requireFocusType = nil
		arg_1_0.AvailabilityDropdown.BusyButton.m_requireFocusType = nil
		arg_1_0.AvailabilityDropdown.AppearOfflineButton.m_requireFocusType = nil

		arg_1_0:SetHandleMouse(true)
		arg_1_0.AvailabilityDropdown.AvailableButton:processEvent({
			name = "gain_focus",
			controller = arg_1_1
		})
	else
		arg_1_0.AvailabilityButton.Arrow:SetZRotation(180)
		ACTIONS.AnimateSequence(arg_1_0, "DropdownOff")

		arg_1_0.AvailabilityDropdown.m_requireFocusType = FocusType.MouseOver
		arg_1_0.AvailabilityDropdown.AvailableButton.m_requireFocusType = FocusType.MouseOver
		arg_1_0.AvailabilityDropdown.AwayButton.m_requireFocusType = FocusType.MouseOver
		arg_1_0.AvailabilityDropdown.BusyButton.m_requireFocusType = FocusType.MouseOver
		arg_1_0.AvailabilityDropdown.AppearOfflineButton.m_requireFocusType = FocusType.MouseOver

		arg_1_0:SetHandleMouse(false)
		arg_1_0.AvailabilityDropdown:processEvent({
			name = "lose_focus",
			controller = arg_1_1
		})
	end

	arg_1_0.AvailabilityDropdown:SetMouseFocusBlocker(not arg_1_0._dropdownState)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 == BattleNetOnlineStatus.ONLINE then
		arg_2_0.AvailabilityButton.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_ONLINE"))
		arg_2_0.AvailabilityButton:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 100, _1080p * -70, _1080p * -48)
	elseif arg_2_1 == BattleNetOnlineStatus.AWAY then
		arg_2_0.AvailabilityButton.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_AWAY"))
		arg_2_0.AvailabilityButton:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 100, _1080p * -70, _1080p * -48)
	elseif arg_2_1 == BattleNetOnlineStatus.BUSY then
		arg_2_0.AvailabilityButton.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_BUSY"))
		arg_2_0.AvailabilityButton:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 100, _1080p * -70, _1080p * -48)
	else
		arg_2_0.AvailabilityButton.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_OFFLINE"))
		arg_2_0.AvailabilityButton:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 100, _1080p * -70, _1080p * -48)
	end

	local var_2_0 = FRIENDS.BnetStatusToColorMap[arg_2_1]

	assert(var_2_0)

	local var_2_1 = FRIENDS.BnetStatusToIconNameMap[arg_2_1]

	assert(var_2_1)
	arg_2_0.AvailabilityButton.Dot:SetRGBFromTable(var_2_0)
	arg_2_0.AvailabilityButton.Dot:setImage(RegisterMaterial(var_2_1))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._dropdownState = false
	arg_3_0.ChangeDropdownState = var_0_0
	arg_3_0.SetOnlineStatusVisual = var_0_1

	local var_3_0
	local var_3_1 = Engine.EAGGAEGHHA(arg_3_1)
	local var_3_2 = Social.ECDAFHBHGC(arg_3_1, var_3_1, true)

	arg_3_0:SetOnlineStatusVisual(var_3_2)
	arg_3_0:addEventHandler("bnet_online_status_set", function(arg_4_0, arg_4_1)
		arg_4_0:SetOnlineStatusVisual(arg_4_1.onlineStatus)

		local var_4_0 = ""

		if arg_4_1.onlineStatus == BattleNetOnlineStatus.ONLINE then
			var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_ONLINE")
		elseif arg_4_1.onlineStatus == BattleNetOnlineStatus.AWAY then
			var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_AWAY")
		elseif arg_4_1.onlineStatus == BattleNetOnlineStatus.BUSY then
			var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_BUSY")
		else
			var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_OFFLINE")
		end

		Social.CEFBABBCGD(arg_3_1, var_4_0)
	end)

	arg_3_0.AvailabilityButton.m_requireFocusType = FocusType.MouseOver
	arg_3_0.AvailabilityDropdown.m_requireFocusType = FocusType.MouseOver

	arg_3_0.AvailabilityButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		var_0_0(arg_3_0, arg_3_1)
	end)
	arg_3_0.AvailabilityDropdown.AvailableButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		Social.DEAFJIFCFE(arg_3_1, BattleNetOnlineStatus.ONLINE)
		Dvar.DHEGHJJJHI("NPMQKLOQSS", false)
		var_0_0(arg_3_0, arg_3_1)
	end)
	arg_3_0.AvailabilityDropdown.AwayButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		Social.DEAFJIFCFE(arg_3_1, BattleNetOnlineStatus.AWAY)
		Dvar.DHEGHJJJHI("NPMQKLOQSS", true)
		var_0_0(arg_3_0, arg_3_1)
	end)
	arg_3_0.AvailabilityDropdown.BusyButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		Social.DEAFJIFCFE(arg_3_1, BattleNetOnlineStatus.BUSY)
		Dvar.DHEGHJJJHI("NPMQKLOQSS", true)
		var_0_0(arg_3_0, arg_3_1)
	end)
	arg_3_0.AvailabilityDropdown.AppearOfflineButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		Social.DEAFJIFCFE(arg_3_1, BattleNetOnlineStatus.APPEAR_OFFLINE)
		Dvar.DHEGHJJJHI("NPMQKLOQSS", true)
		var_0_0(arg_3_0, arg_3_1)
	end)
	arg_3_0:SetHandleMouse(false)
	arg_3_0:addEventHandler("leftmouseup", function(arg_10_0, arg_10_1)
		if arg_3_0._dropdownState then
			var_0_0(arg_3_0, arg_3_1)
		end
	end)

	local function var_3_3(arg_11_0, arg_11_1)
		if LUI.IsLastInputKeyboardMouse(arg_11_1.controllerIndex) then
			arg_11_0.AvailabilityButton.PadPromptLabel:SetAlpha(0)
		else
			arg_11_0.AvailabilityButton.PadPromptLabel:SetAlpha(1)
		end
	end

	arg_3_0:addAndCallEventHandler("update_input_type", var_3_3, {
		controllerIndex = arg_3_1
	})
	arg_3_0.AvailabilityDropdown:SetMouseFocusBlocker(true)
end

function PlayerDetailsAvailability(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 158 * _1080p)

	var_12_0.id = "PlayerDetailsAvailability"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailabilityButton", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "AvailabilityButton"

	var_12_4.Dot:SetRGBFromInt(16777215, 0)
	var_12_4.AvailabilityLabel:setText(Engine.CBBHFCGDIC("MENU/SOCIAL_ONLINE"), 0)
	var_12_4.AvailabilityLabel:SetAlignment(LUI.Alignment.Left)
	var_12_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, 0, _1080p * 22)
	var_12_0:addElement(var_12_4)

	var_12_0.AvailabilityButton = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "ListBackground"

	var_12_6:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_12_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, _1080p * 34, _1080p * 154)
	var_12_0:addElement(var_12_6)

	var_12_0.ListBackground = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailabilityDropdown", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "AvailabilityDropdown"

	var_12_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, _1080p * 27, _1080p * 157)
	var_12_0:addElement(var_12_8)

	var_12_0.AvailabilityDropdown = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "Divider"

	var_12_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, _1080p * 27, _1080p * 28)
	var_12_0:addElement(var_12_10)

	var_12_0.Divider = var_12_10

	local function var_12_11()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_11

	local var_12_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("DropdownOn", var_12_12)

	local var_12_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("DropdownOn", var_12_13)

	local var_12_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("DropdownOn", var_12_14)

	local function var_12_15()
		var_12_6:AnimateSequence("DropdownOn")
		var_12_8:AnimateSequence("DropdownOn")
		var_12_10:AnimateSequence("DropdownOn")
	end

	var_12_0._sequences.DropdownOn = var_12_15

	local var_12_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("DropdownOff", var_12_16)

	local var_12_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("DropdownOff", var_12_17)

	local var_12_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("DropdownOff", var_12_18)

	local function var_12_19()
		var_12_6:AnimateSequence("DropdownOff")
		var_12_8:AnimateSequence("DropdownOff")
		var_12_10:AnimateSequence("DropdownOff")
	end

	var_12_0._sequences.DropdownOff = var_12_19

	var_0_2(var_12_0, var_12_1, arg_12_1)
	ACTIONS.AnimateSequence(var_12_0, "DropdownOff")

	return var_12_0
end

MenuBuilder.registerType("PlayerDetailsAvailability", PlayerDetailsAvailability)
LockTable(_M)
