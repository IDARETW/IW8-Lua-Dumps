module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		controllerIndex = arg_1_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = arg_1_1.message
	}
	local var_1_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_1_0)

	var_1_1.id = "RegimentRestrictionPopup"

	return var_1_1
end

MenuBuilder.registerType("RegimentRestrictionPopup", var_0_0)

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = true
	local var_2_1 = true

	if not arg_2_2 or #arg_2_2 == 0 or #arg_2_2 > FRIENDS.CLANS_MAX_NAME_LENGTH then
		var_2_0 = false
	end

	if not arg_2_3 or #arg_2_3 == 0 or #arg_2_3 > FRIENDS.CLANS_CLANTAG_LENGTH then
		var_2_1 = false
	end

	if var_2_0 and not Engine.HEIIHIEH(arg_2_2) then
		if arg_2_0.PopupButtons == nil or arg_2_0.PopupButtons.NameInputButton:GetErrorState() == false then
			local var_2_2 = Engine.CBBHFCGDIC("REGIMENTS/DIGITS_RESTRICTION_ERROR", FRIENDS.MAX_DIGITS_IN_CLAN_NAME)

			LUI.FlowManager.RequestPopupMenu(arg_2_0, "RegimentRestrictionPopup", true, arg_2_1, false, {
				controllerIndex = arg_2_1,
				message = var_2_2
			})
		end

		var_2_0 = false
	end

	if var_2_0 and var_2_1 and OSK.CJAFGACAFH then
		local var_2_3 = arg_2_3 .. arg_2_2
		local var_2_4 = OSK.CJAFGACAFH(arg_2_1, var_2_3)

		if #var_2_4 > 0 then
			LUI.FlowManager.RequestPopupMenu(arg_2_0, "RegimentRestrictionPopup", true, arg_2_1, false, {
				controllerIndex = arg_2_1,
				message = Engine.CBBHFCGDIC(var_2_4)
			})

			var_2_0 = false
			var_2_1 = false
		end
	end

	if arg_2_0.PopupButtons then
		arg_2_0.PopupButtons.NameInputButton:SetErrorState(not var_2_0)
		arg_2_0.PopupButtons.TagInputButton:SetErrorState(not var_2_1)
	end

	return var_2_0 and var_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:IsInputValid(arg_3_1, arg_3_0._name, arg_3_0._tag)

	if arg_3_0.PopupButtons then
		arg_3_0.PopupButtons.CreateButton:SetButtonDisabled(not var_3_0)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.PopupButtons.NameInputButton)
	assert(arg_4_0.PopupButtons.TagInputButton)
	assert(arg_4_0.PopupButtons.CreateButton)
	assert(arg_4_0.MenuTitle)
	arg_4_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATE")))

	arg_4_0.UpdateRegimentCreateStatus = var_0_2
	arg_4_0.IsInputValid = var_0_1
	arg_4_0._isInit = arg_4_2.init
	arg_4_0._name = nil
	arg_4_0._tag = nil

	local var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_ENTER_NAME")
	local var_4_1 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_ENTER_TAG")

	arg_4_0.PopupButtons.NameInputButton:SetupUITextEdit(arg_4_1, FRIENDS.CLANS_MAX_NAME_LENGTH, var_4_0, true)
	arg_4_0.PopupButtons.TagInputButton:SetupUITextEdit(arg_4_1, FRIENDS.CLANS_CLANTAG_LENGTH, var_4_1, true)
	arg_4_0.PopupButtons.NameCharacters:setText(Engine.CBBHFCGDIC("LUA_MENU/CHARACTERS_USED", 0, FRIENDS.CLANS_MAX_NAME_LENGTH))
	arg_4_0.PopupButtons.TagCharacters:setText(Engine.CBBHFCGDIC("LUA_MENU/CHARACTERS_USED", 0, FRIENDS.CLANS_CLANTAG_LENGTH))

	function arg_4_0.PopupButtons.NameInputButton.isTypingCallbackFunc(arg_5_0, arg_5_1)
		local var_5_0 = #arg_5_1

		arg_4_0._name = arg_5_1

		arg_4_0.PopupButtons.NameCharacters:setText(Engine.CBBHFCGDIC("LUA_MENU/CHARACTERS_USED", var_5_0, FRIENDS.CLANS_MAX_NAME_LENGTH))

		if var_5_0 > FRIENDS.CLANS_MAX_NAME_LENGTH then
			arg_4_0.PopupButtons.NameCharacters:SetRGBFromTable(SWATCHES.HUDWarnings.danger)
		else
			arg_4_0.PopupButtons.NameCharacters:SetRGBFromTable(SWATCHES.text.primaryText)
		end
	end

	arg_4_0.PopupButtons.NameInputButton:addEventHandler("text_edit_is_typing", function(arg_6_0, arg_6_1)
		if arg_6_0._textEditingActive then
			local var_6_0 = arg_6_1.text or ""

			arg_6_0.isTypingCallbackFunc(arg_6_1.isTyping, var_6_0)
		end
	end)

	function arg_4_0.PopupButtons.NameInputButton.buttonActionCallbackFunc()
		if LUI.IsLastInputGamepad(arg_4_1) and Engine.HDGDBCJFG() then
			arg_4_0.PopupButtons.NameInputButton:TextEditOff()

			local var_7_0 = arg_4_0.PopupButtons.NameInputButton.textEdit:getText()

			OSK.CBJGJDGFC(arg_4_1, Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_NAME"), var_7_0, FRIENDS.CLANS_MAX_NAME_LENGTH, true, true, true, function(arg_8_0, arg_8_1, arg_8_2)
				if arg_8_1 then
					arg_4_0._name = arg_8_1

					arg_4_0:UpdateRegimentCreateStatus(arg_8_0)
					arg_4_0.PopupButtons.NameInputButton.textEdit:setTextEditText(arg_8_1)

					if arg_8_1 ~= "" and not arg_4_0.PopupButtons.NameInputButton:GetErrorState() then
						arg_4_0.PopupButtons.NameInputButton:processEvent({
							name = "lose_focus"
						})
						arg_4_0.PopupButtons.TagInputButton:processEvent({
							name = "gain_focus"
						})
					else
						arg_4_0.PopupButtons.NameInputButton:SetErrorState(true)
					end

					arg_4_0.PopupButtons.NameInputButton.isTypingCallbackFunc(nil, arg_8_1)
				elseif arg_4_0._name == nil then
					arg_4_0.PopupButtons.NameInputButton:SetErrorState(true)
				end
			end)
		end
	end

	function arg_4_0.PopupButtons.TagInputButton.isTypingCallbackFunc(arg_9_0, arg_9_1)
		local var_9_0 = #arg_9_1

		arg_4_0._tag = arg_9_1

		arg_4_0.PopupButtons.TagCharacters:setText(Engine.CBBHFCGDIC("LUA_MENU/CHARACTERS_USED", var_9_0, FRIENDS.CLANS_CLANTAG_LENGTH))

		if var_9_0 > FRIENDS.CLANS_CLANTAG_LENGTH then
			arg_4_0.PopupButtons.TagCharacters:SetRGBFromTable(SWATCHES.HUDWarnings.danger)
		else
			arg_4_0.PopupButtons.TagCharacters:SetRGBFromTable(SWATCHES.text.primaryText)
		end
	end

	arg_4_0.PopupButtons.TagInputButton:addEventHandler("text_edit_is_typing", function(arg_10_0, arg_10_1)
		if arg_10_0._textEditingActive then
			local var_10_0 = arg_10_1.text or ""

			arg_10_0.isTypingCallbackFunc(arg_10_1.isTyping, var_10_0)
		end
	end)

	function arg_4_0.PopupButtons.TagInputButton.buttonActionCallbackFunc()
		if LUI.IsLastInputGamepad(arg_4_1) and Engine.HDGDBCJFG() then
			arg_4_0.PopupButtons.TagInputButton:TextEditOff()

			local var_11_0 = arg_4_0.PopupButtons.TagInputButton.textEdit:getText()

			OSK.CBJGJDGFC(arg_4_1, Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_TAG"), var_11_0, FRIENDS.CLANS_CLANTAG_LENGTH, true, true, true, function(arg_12_0, arg_12_1, arg_12_2)
				if arg_12_1 then
					arg_4_0._tag = arg_12_1

					arg_4_0:UpdateRegimentCreateStatus(arg_12_0)
					arg_4_0.PopupButtons.TagInputButton.textEdit:setTextEditText(arg_12_1)

					if arg_12_1 ~= "" then
						arg_4_0.PopupButtons.TagInputButton:processEvent({
							name = "lose_focus"
						})
						arg_4_0.PopupButtons.CreateButton:processEvent({
							name = "gain_focus"
						})
					end

					arg_4_0.PopupButtons.TagInputButton.isTypingCallbackFunc(nil, arg_12_1)
				elseif arg_4_0._tag == nil then
					arg_4_0.PopupButtons.TagInputButton:SetErrorState(true)
				end
			end)
		end
	end

	arg_4_0:addEventHandler("text_edit_complete", function(arg_13_0, arg_13_1)
		if Engine.CGABICJHAI() or not LUI.IsLastInputGamepad(arg_4_1) then
			arg_4_0:UpdateRegimentCreateStatus(arg_4_1)
		end
	end)
	arg_4_0.PopupButtons.CreateButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		local var_14_0 = arg_4_0.PopupButtons.NameInputButton.textEdit
		local var_14_1 = arg_4_0.PopupButtons.TagInputButton.textEdit
		local var_14_2 = not var_14_0._firstInteraction and var_14_0:getText() or ""
		local var_14_3 = not var_14_1._firstInteraction and var_14_1:getText() or ""

		if arg_4_0:IsInputValid(arg_4_1, var_14_2, var_14_3) then
			local var_14_4 = {
				regimentName = var_14_2,
				regimentTag = var_14_3,
				IsInputValid = arg_4_0.IsInputValid
			}

			LUI.FlowManager.RequestPopupMenu(nil, "CreateRegimentConfirmationPopup", true, arg_14_1.controller, false, var_14_4)
		end
	end)
	arg_4_0:registerEventHandler("clans_notification", function(arg_15_0, arg_15_1)
		local var_15_0 = arg_15_1.options

		if var_15_0.genEventName == "clans_created" then
			if var_15_0.success then
				local var_15_1 = {
					icon = "hud_info_alert",
					displayTime = 3000,
					header = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATED"),
					description = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATED_DESC")
				}

				arg_15_0:dispatchEventToRoot({
					name = "send_toast_notification",
					immediate = true,
					options = var_15_1
				})

				if arg_4_0._isInit then
					LUI.FlowManager.RequestLeaveMenu(arg_4_0, true, true)
				end
			else
				local var_15_2 = var_15_0.error
				local var_15_3 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				if var_15_2 == ClanFailureReason.GENERIC_CLAN_ERROR then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
				elseif var_15_2 == ClanFailureReason.NAME_TAKEN then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_NAME_TAKEN")
				elseif var_15_2 == ClanFailureReason.NAME_TOO_SHORT then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_NAME_TOO_SHORT")
				elseif var_15_2 == ClanFailureReason.NAME_VULGAR then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_NAME_VULGAR")
				elseif var_15_2 == ClanFailureReason.TAG_TAKEN then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_TAG_TAKEN")
				elseif var_15_2 == ClanFailureReason.TAG_TOO_SHORT then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_TAG_TOO_SHORT")
				elseif var_15_2 == ClanFailureReason.TAG_VULGAR then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_TAG_VULGAR")
				elseif var_15_2 == ClanFailureReason.MAX_CLAN_OWNERSHIPS then
					var_15_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LIMIT")
				end

				LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
				LUI.FlowManager.RequestPopupMenu(arg_4_0, "PopupOK", true, arg_4_1, false, {
					title = var_15_3,
					message = var_15_4
				})
			end
		elseif var_15_0.genEventName == "clans_initialized_clan" then
			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)

			if var_15_0.success then
				LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_15_1.controller, false, {
					controllerIndex = arg_4_1,
					message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
				})

				if not Clans.FAFJFADBJ(arg_4_1, var_15_0.clanId) then
					LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
					LUI.FlowManager.RequestPopupMenu(arg_4_0, "PopupOK", true, arg_4_1, false, {
						title = Engine.CBBHFCGDIC("MENU/ERROR"),
						message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
					})
				end
			else
				local var_15_5 = var_15_0.error
				local var_15_6 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_15_7 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_4_0, "PopupOK", true, arg_4_1, false, {
					title = var_15_6,
					message = var_15_7
				})
			end
		elseif var_15_0.genEventName == "clans_activated_clan" then
			if var_15_0.success then
				arg_4_0:dispatchEventToRoot({
					name = "change_active_clan",
					newActiveClanID = var_15_0.clanId
				})
				LUI.FlowManager.RequestLeaveMenu(arg_4_0, true, true)
			else
				local var_15_8 = var_15_0.error
				local var_15_9 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_15_10 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestPopupMenu(arg_4_0, "PopupOK", true, arg_4_1, false, {
					title = var_15_9,
					message = var_15_10
				})
			end

			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
		end
	end)

	function arg_4_0.backButtonOverride(arg_16_0, arg_16_1)
		arg_4_0.PopupButtons.NameInputButton:TextEditOff()
		arg_4_0.PopupButtons.TagInputButton:TextEditOff()
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function RegimentsCreatePopup(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "RegimentsCreatePopup"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "MenuTitle"

	var_17_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATE")), 0)
	var_17_4.Line:SetLeft(0, 0)
	var_17_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_4)

	var_17_0.MenuTitle = var_17_4

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("RegimentsCreatePopupButtons", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "PopupButtons"

	var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 570, _1080p * 200, _1080p * 470)
	var_17_0:addElement(var_17_6)

	var_17_0.PopupButtons = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIStyledText.new()

	var_17_8.id = "WarningLabel"

	var_17_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_17_8:setText(Engine.CBBHFCGDIC("REGIMENTS/NAME_WARNING"), 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_17_8:SetAlignment(LUI.Alignment.Left)
	var_17_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 570, _1080p * 480, _1080p * 502)
	var_17_0:addElement(var_17_8)

	var_17_0.WarningLabel = var_17_8

	local function var_17_9()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_9

	local var_17_10
	local var_17_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 510
		}
	}

	var_17_8:RegisterAnimationSequence("AR", var_17_11)

	local function var_17_12()
		var_17_8:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_12

	PostLoadFunc(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("RegimentsCreatePopup", RegimentsCreatePopup)
LockTable(_M)
