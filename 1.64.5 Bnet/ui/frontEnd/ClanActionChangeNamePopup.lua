module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = not arg_1_0.ClanNameInput:IsPastFirstInteraction()
	local var_1_1 = false
	local var_1_2 = ""

	if var_1_0 then
		local var_1_3 = arg_1_0.ClanNameInput.TextEdit:getText()
		local var_1_4 = CLANS.IsValidClanName(arg_1_0._controllerIndex, var_1_3)

		var_1_1 = var_1_4.valid
		var_1_2 = var_1_4.error
	end

	return {
		success = var_1_1,
		error = var_1_2
	}
end

local function var_0_1(arg_2_0)
	local var_2_0 = not arg_2_0.ClanNameInput:IsPastFirstInteraction()
	local var_2_1 = false
	local var_2_2 = ""

	if var_2_0 then
		local var_2_3 = arg_2_0.ClanNameInput.TextEdit:getText()
		local var_2_4 = CLANS.IsValidClanDescription(arg_2_0._controllerIndex, var_2_3)

		var_2_1 = var_2_4.valid
		var_2_2 = var_2_4.error
	end

	return {
		success = var_2_1,
		error = var_2_2
	}
end

local function var_0_2(arg_3_0)
	if arg_3_0._ctDebounceTimer ~= nil then
		arg_3_0._ctDebounceTimer:closeTree()

		arg_3_0._ctDebounceTimer = nil
	end

	arg_3_0._ctDebounceTimer = LUI.UITimer.new({
		interval = 100,
		event = "ct_debounce_name_typing"
	})
	arg_3_0._ctDebounceTimer.id = "ctDebounceTimer"

	arg_3_0:addElement(arg_3_0._ctDebounceTimer)
	arg_3_0:addAndCallEventHandler("ct_debounce_name_typing", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_3_0.ClanNameInput.TextEdit:getText()

		if arg_3_0._previousInput ~= var_4_0 then
			local var_4_1 = false

			if #var_4_0 > 0 then
				if arg_3_0._inputUsage == CLANS.CLAN_POPUP_INPUT.CLAN_NAME then
					local var_4_2 = var_0_0(arg_3_0)

					var_4_1 = var_4_2.success

					if not var_4_2.success then
						arg_3_0.ErrorLabel:setText(var_4_2.error)
					else
						arg_3_0.ErrorLabel:setText("")
					end
				elseif arg_3_0._inputUsage == CLANS.CLAN_POPUP_INPUT.CLAN_DESCRIPTION then
					local var_4_3 = var_0_1(arg_3_0)

					var_4_1 = var_4_3.success

					if not var_4_3.success then
						arg_3_0.ErrorLabel:setText(var_4_3.error)
					else
						arg_3_0.ErrorLabel:setText("")
					end
				end
			else
				var_4_1 = true

				arg_3_0.ErrorLabel:setText("")
			end

			if var_4_1 then
				ACTIONS.AnimateSequence(arg_3_0.ClanNameInput, "Valid")
			else
				ACTIONS.AnimateSequence(arg_3_0.ClanNameInput, "Error")
			end
		end

		arg_3_0._previousInput = var_4_0
	end)
end

local function var_0_3(arg_5_0)
	if arg_5_0._ctDebounceTimer ~= nil then
		arg_5_0._ctDebounceTimer:closeTree()

		arg_5_0._ctDebounceTimer = nil
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.ClanNameInput:SetupTextEdit({
		_maxStringLength = arg_6_3,
		_defaultInputString = Engine.CBBHFCGDIC(arg_6_1)
	})

	function arg_6_0.ClanNameInput.buttonActionCallbackFunc()
		if LUI.IsLastInputGamepad(arg_6_0._controllerIndex) then
			arg_6_0.ClanNameInput:SetTextEditOff()
			OSK.CBJGJDGFC(arg_6_0._controllerIndex, Engine.CBBHFCGDIC(arg_6_2), "", arg_6_3, true, true, true, function(arg_8_0, arg_8_1, arg_8_2)
				if arg_8_1 then
					arg_6_0.ClanNameInput.TextEdit:setTextEditText(arg_8_1)
				end

				arg_6_0.ClanNameInput:SetTextEditOff()
			end, CoD.KeyboardInputTypes.Normal)
		end

		var_0_2(arg_6_0)
	end

	function arg_6_0.ClanNameInput.textEditCompleteCallbackFunc(arg_9_0, arg_9_1)
		if LUI.IsLastInputKeyboardMouse(arg_6_0._controllerIndex) then
			arg_6_0.ClanNameInput:SetTextEditOff()
		else
			return function(arg_10_0, arg_10_1)
				local var_10_0 = FocusType.MouseOver

				if LUI.IsLastInputGamepad(arg_6_0._controllerIndex) then
					var_10_0 = FocusType.Gamepad
				end

				arg_10_0:getParent():FocusNextElement(arg_10_0, "down", var_10_0, arg_10_1._qualifier, arg_6_0._controllerIndex)
			end
		end

		var_0_3(arg_6_0)
	end

	function arg_6_0.ClanNameInput.isTypingCallbackFunc(arg_11_0, arg_11_1)
		arg_6_0.ClanNameInput.TextEdit:setTextEditText(arg_11_1)
	end
end

local function var_0_5(arg_12_0)
	arg_12_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_NAME_EDITED, function(arg_13_0, arg_13_1)
		ACTIONS.LeaveMenu(arg_12_0)
	end)
end

local function var_0_6(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_2.clanDetails and arg_14_2.usage)

	arg_14_0._controllerIndex = arg_14_1
	arg_14_0._clanDetails = arg_14_2.clanDetails
	arg_14_0._ctDebounceTimer = nil
	arg_14_0._previousInput = nil
	arg_14_0._inputUsage = arg_14_2.usage

	if arg_14_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_NAME then
		arg_14_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_NAME")))
		var_0_4(arg_14_0, "LUA_MENU/SAMPLE_CLAN_NAME", "LUA_MENU/CLAN_NAME", CLANS.MAX_NAME_LENGTH)
	elseif arg_14_2.usage == CLANS.CLAN_POPUP_INPUT.CLAN_DESCRIPTION then
		arg_14_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_DESC")))
		var_0_4(arg_14_0, "LUA_MENU/SAMPLE_CLAN_DESCRIPTION", "LUA_MENU/CLAN_DESCRIPTION", CLANS.MAX_DESCRIPTION_LENGTH)
	end

	var_0_5(arg_14_0)
	arg_14_0.AcceptButton:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		if arg_14_0._inputUsage == CLANS.CLAN_POPUP_INPUT.CLAN_NAME then
			local var_15_0 = arg_14_0.ClanNameInput.TextEdit:getText()
			local var_15_1 = var_0_0(arg_14_0)

			if var_15_1.success then
				DebugPrint("New Clan Name: " .. tostring(var_15_0))
				LUI.FlowManager.RequestPopupMenu(arg_14_0, "ClanConfirmActionPopup", true, arg_15_1.controller, false, {
					controllerIndex = arg_14_0._controllerIndex,
					clanDetails = arg_14_0._clanDetails,
					usage = CLANS.CLAN_POPUP_INPUT.CLAN_NAME,
					clanName = var_15_0
				})
				ACTIONS.LeaveMenu(arg_14_0)
			else
				CLANS.DispatchClanNotification(arg_14_0, Engine.CBBHFCGDIC("CLANS/INVALID_CLAN_NAME"), var_15_1.error)
			end
		else
			local var_15_2 = arg_14_0.ClanNameInput.TextEdit:getText()
			local var_15_3 = var_0_1(arg_14_0)

			if var_15_3.success then
				DebugPrint("New Clan Description: " .. tostring(var_15_2))
				arg_14_0:dispatchEventToRoot({
					dispatchChildren = true,
					immediate = true,
					name = CLANS.CLAN_EVENTS.CLAN_DESCRIPTION_EDITED,
					options = {
						newDescription = var_15_2
					}
				})
				ACTIONS.LeaveMenu(arg_14_0)
			else
				CLANS.DispatchClanNotification(arg_14_0, Engine.CBBHFCGDIC("CLANS/INVALID_CLAN_DESC"), var_15_3.error)
			end
		end
	end)
	arg_14_0.CancelButton:addEventHandler("button_action", function(arg_16_0, arg_16_1)
		ACTIONS.LeaveMenu(arg_14_0)
	end)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_14_0, arg_14_1, {
		addWorldBlur = true,
		addScreenDarkener = true,
		darkenerOpacity = LAYOUT.DEFAULT_POPUP_DARKENER_OPACITY
	})
end

function ClanActionChangeNamePopup(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIVerticalNavigator.new()

	var_17_0.id = "ClanActionChangeNamePopup"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "GenericPopupWindow"

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_17_4.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_17_4.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_17_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_17_0:addElement(var_17_4)

	var_17_0.GenericPopupWindow = var_17_4

	local var_17_5
	local var_17_6 = LUI.UIText.new()

	var_17_6.id = "Title"

	var_17_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_NAME")), 0)
	var_17_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_6:SetAlignment(LUI.Alignment.Center)
	var_17_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -522, _1080p * 522, _1080p * -144, _1080p * -84)
	var_17_0:addElement(var_17_6)

	var_17_0.Title = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIText.new()

	var_17_8.id = "ErrorLabel"

	var_17_8:SetRGBFromTable(SWATCHES.genericMenu.failed, 0)
	var_17_8:setText("", 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_8:SetAlignment(LUI.Alignment.Center)
	var_17_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 260, _1080p * 16, _1080p * 34)
	var_17_0:addElement(var_17_8)

	var_17_0.ErrorLabel = var_17_8

	local var_17_9
	local var_17_10 = MenuBuilder.BuildRegisteredType("ClanInput", {
		controllerIndex = var_17_1
	})

	var_17_10.id = "ClanNameInput"

	var_17_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -65, _1080p * -25)
	var_17_0:addElement(var_17_10)

	var_17_0.ClanNameInput = var_17_10

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "AcceptButton"

	var_17_12.Text:SetLeft(_1080p * 20, 0)
	var_17_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT"), 0)
	var_17_12.Text:SetAlignment(LUI.Alignment.Center)
	var_17_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 220, _1080p * 58, _1080p * 96)
	var_17_0:addElement(var_17_12)

	var_17_0.AcceptButton = var_17_12

	local var_17_13
	local var_17_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_17_1
	})

	var_17_14.id = "CancelButton"

	var_17_14.Text:SetLeft(_1080p * 20, 0)
	var_17_14.Text:setText(Engine.CBBHFCGDIC("MENU/CANCEL"), 0)
	var_17_14.Text:SetAlignment(LUI.Alignment.Center)
	var_17_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 220, _1080p * 110, _1080p * 148)
	var_17_0:addElement(var_17_14)

	var_17_0.CancelButton = var_17_14

	var_0_6(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("ClanActionChangeNamePopup", ClanActionChangeNamePopup)
LockTable(_M)
