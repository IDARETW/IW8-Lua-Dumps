module(..., package.seeall)

local var_0_0 = 150

local function var_0_1(arg_1_0)
	local var_1_0 = not arg_1_0.ClanNameInput:IsPastFirstInteraction()
	local var_1_1 = not arg_1_0.ClanTagInput:IsPastFirstInteraction()
	local var_1_2 = false

	if var_1_0 and var_1_1 then
		local var_1_3 = arg_1_0.ClanNameInput.TextEdit:getText()
		local var_1_4 = arg_1_0.ClanTagInput.TextEdit:getText()
		local var_1_5 = CLANS.IsValidClanTag(arg_1_0._controllerIndex, var_1_4)
		local var_1_6 = CLANS.IsValidClanName(arg_1_0._controllerIndex, var_1_3)

		if var_1_5.valid and var_1_6.valid then
			var_1_2 = true
		end

		if not var_1_5.valid then
			CLANS.DispatchClanNotification(arg_1_0, Engine.CBBHFCGDIC("CLANS/INVALID_CLAN_TAG"), var_1_5.error)
		end

		if not var_1_6.valid then
			CLANS.DispatchClanNotification(arg_1_0, Engine.CBBHFCGDIC("CLANS/INVALID_CLAN_NAME"), var_1_6.error)
		end
	end

	return var_1_2
end

local function var_0_2(arg_2_0)
	if arg_2_0._ctNameDebounceTimer ~= nil then
		arg_2_0._ctNameDebounceTimer:closeTree()

		arg_2_0._ctNameDebounceTimer = nil
	end
end

local function var_0_3(arg_3_0)
	if arg_3_0._ctNameDebounceTimer ~= nil then
		arg_3_0._ctNameDebounceTimer:closeTree()

		arg_3_0._ctNameDebounceTimer = nil
	end

	arg_3_0._ctNameDebounceTimer = LUI.UITimer.new({
		event = "ct_debounce_name_typing",
		interval = var_0_0
	})
	arg_3_0._ctNameDebounceTimer.id = "ctNameDebounceTimer"

	arg_3_0:addElement(arg_3_0._ctNameDebounceTimer)
	arg_3_0:addAndCallEventHandler("ct_debounce_name_typing", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_3_0.ClanNameInput.TextEdit:getText()
		local var_4_1 = false
		local var_4_2 = ""

		if #var_4_0 > 0 then
			local var_4_3 = CLANS.IsValidClanName(arg_3_0._controllerIndex, var_4_0)

			var_4_1 = var_4_3.valid
			var_4_2 = var_4_3.error
		else
			var_4_1 = true
		end

		if var_4_1 then
			ACTIONS.AnimateSequence(arg_3_0.ClanNameInput, "Valid")
			arg_3_0.ErrorLabel:setText("")
		else
			ACTIONS.AnimateSequence(arg_3_0.ClanNameInput, "Error")
			arg_3_0.ErrorLabel:setText(var_4_2)
		end
	end)
end

local function var_0_4(arg_5_0)
	arg_5_0.ClanNameInput:SetupTextEdit({
		_maxStringLength = CLANS.MAX_NAME_LENGTH,
		_defaultInputString = Engine.CBBHFCGDIC("LUA_MENU/SAMPLE_CLAN_NAME")
	})

	function arg_5_0.ClanNameInput.buttonActionCallbackFunc()
		if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_5_0._controllerIndex) then
			arg_5_0.ClanNameInput:SetTextEditOff()
			OSK.CBJGJDGFC(arg_5_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CLAN_NAME"), "", CLANS.MAX_NAME_LENGTH, true, true, true, function(arg_7_0, arg_7_1, arg_7_2)
				if arg_7_1 then
					arg_5_0.ClanNameInput.TextEdit:setTextEditText(arg_7_1)
				end

				arg_5_0.ClanNameInput:SetTextEditOff()
			end, CoD.KeyboardInputTypes.Normal)
		end

		var_0_3(arg_5_0)
	end

	function arg_5_0.ClanNameInput.textEditCompleteCallbackFunc(arg_8_0, arg_8_1)
		if LUI.IsLastInputKeyboardMouse(arg_5_0._controllerIndex) then
			arg_5_0.ClanNameInput:SetTextEditOff()
		else
			return function(arg_9_0, arg_9_1)
				local var_9_0 = FocusType.MouseOver

				if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_5_0._controllerIndex) then
					var_9_0 = FocusType.Gamepad
				end

				arg_9_0:getParent():FocusNextElement(arg_9_0, "down", var_9_0, arg_9_1._qualifier, arg_5_0._controllerIndex)
			end
		end

		var_0_2(arg_5_0)
	end

	function arg_5_0.ClanNameInput.isTypingCallbackFunc(arg_10_0, arg_10_1)
		arg_5_0.ClanNameInput.TextEdit:setTextEditText(arg_10_1)
	end
end

local function var_0_5(arg_11_0)
	if arg_11_0._ctTagDebounceTimer ~= nil then
		arg_11_0._ctTagDebounceTimer:closeTree()

		arg_11_0._ctTagDebounceTimer = nil
	end
end

local function var_0_6(arg_12_0)
	if arg_12_0._ctTagDebounceTimer ~= nil then
		arg_12_0._ctTagDebounceTimer:closeTree()

		arg_12_0._ctTagDebounceTimer = nil
	end

	arg_12_0._ctTagDebounceTimer = LUI.UITimer.new({
		event = "ct_debounce_tag_typing",
		interval = var_0_0
	})
	arg_12_0._ctTagDebounceTimer.id = "ctTagDebounceTimer"

	arg_12_0:addElement(arg_12_0._ctTagDebounceTimer)
	arg_12_0:addAndCallEventHandler("ct_debounce_tag_typing", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_12_0.ClanTagInput.TextEdit:getText()
		local var_13_1 = false
		local var_13_2 = ""

		if #var_13_0 > 0 then
			local var_13_3 = CLANS.IsValidClanTag(arg_12_0._controllerIndex, var_13_0)

			var_13_1 = var_13_3.valid
			var_13_2 = var_13_3.error
		else
			var_13_1 = true
		end

		if var_13_1 then
			ACTIONS.AnimateSequence(arg_12_0.ClanTagInput, "Valid")
			arg_12_0.ErrorLabel:setText("")
		else
			ACTIONS.AnimateSequence(arg_12_0.ClanTagInput, "Error")
			arg_12_0.ErrorLabel:setText(var_13_2)
		end
	end)
end

local function var_0_7(arg_14_0)
	arg_14_0.ClanTagInput:SetupTextEdit({
		_maxStringLength = CLANS.MAX_TAG_LENGTH,
		_defaultInputString = Engine.CBBHFCGDIC("LUA_MENU/SAMPLE_CLAN_TAG")
	})

	function arg_14_0.ClanTagInput.buttonActionCallbackFunc()
		if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_14_0._controllerIndex) then
			arg_14_0.ClanTagInput:SetTextEditOff()
			OSK.CBJGJDGFC(arg_14_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG"), "", CLANS.MAX_TAG_LENGTH, true, true, true, function(arg_16_0, arg_16_1, arg_16_2)
				if arg_16_1 then
					arg_14_0.ClanTagInput.TextEdit:setTextEditText(arg_16_1)
				end

				arg_14_0.ClanTagInput:SetTextEditOff()
			end, CoD.KeyboardInputTypes.Normal)
		end

		var_0_6(arg_14_0)
	end

	function arg_14_0.ClanTagInput.textEditCompleteCallbackFunc(arg_17_0, arg_17_1)
		if LUI.IsLastInputKeyboardMouse(arg_14_0._controllerIndex) then
			arg_14_0.ClanTagInput:SetTextEditOff()
		else
			return function(arg_18_0, arg_18_1)
				local var_18_0 = FocusType.MouseOver

				if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_14_0._controllerIndex) then
					var_18_0 = FocusType.Gamepad
				end

				arg_18_0:getParent():FocusNextElement(arg_18_0, "down", var_18_0, arg_18_1._qualifier, arg_14_0._controllerIndex)
			end
		end

		var_0_5(arg_14_0)
	end

	function arg_14_0.ClanTagInput.isTypingCallbackFunc(arg_19_0, arg_19_1)
		arg_14_0.ClanTagInput.TextEdit:setTextEditText(arg_19_1)
	end
end

local function var_0_8(arg_20_0)
	ACTIONS.LeaveMenu(arg_20_0)
end

local function var_0_9(arg_21_0)
	if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_21_0._controllerIndex) then
		arg_21_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_21_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_10(arg_22_0)
	local var_22_0 = LUI.UIBindButton.new()

	var_22_0.id = "selfBindButton"

	arg_22_0:addElement(var_22_0)

	arg_22_0._bindButton = var_22_0

	arg_22_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_22_0._bindButton:addEventHandler("button_secondary", function(arg_23_0, arg_23_1)
		var_0_8(arg_22_0)
	end)
	arg_22_0:addAndCallEventHandler("update_input_type", arg_22_0.UpdateInputType, {
		controllerIndex = arg_22_0._controllerIndex
	})
end

local function var_0_11(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0._controllerIndex = arg_24_1
	arg_24_0.UpdateInputType = var_0_9
	arg_24_0._submittedClanName = ""
	arg_24_0._submittedClanTag = ""

	var_0_4(arg_24_0)
	var_0_7(arg_24_0)
	arg_24_0.ContinueButton:registerEventHandler("button_action", function(arg_25_0, arg_25_1)
		if var_0_1(arg_24_0) then
			local var_25_0 = arg_24_0.ClanNameInput.TextEdit:getText()
			local var_25_1 = arg_24_0.ClanTagInput.TextEdit:getText()

			arg_24_0._submittedClanName = var_25_0
			arg_24_0._submittedClanTag = var_25_1

			Clans2.CAECAECGBH(arg_24_1, var_25_1)

			arg_24_0.tagValidationStarted = true
			arg_24_0:Wait(CLANS.CLAN_EVENT_WAIT_TIME).onComplete = function()
				if arg_24_0.tagValidationStarted then
					arg_24_0.tagValidationStarted = false

					CLANS.DispatchClanNotification(arg_24_0, Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_VALIDATION_FAILED"), "")
					DebugPrint("Clan Tag ( " .. var_25_1 .. " ) is already taken")
				end
			end
		else
			LUI.FlowManager.RequestPopupMenu(arg_24_0, "PopupOK", true, arg_25_1.controller, false, {
				message = Engine.CBBHFCGDIC("CLANS/INVALID_CLAN_NAME_TAG")
			})
		end
	end)
	ACTIONS.AnimateSequence(arg_24_0.ContinueButton, "CenterText")
	arg_24_0:addEventHandler(CLANS.CLAN_EVENTS.CHECK_TAG_AVAILABILITY, function(arg_27_0, arg_27_1)
		if CONDITIONS.IsMenuInStack("ClanTagUsedPopup") then
			return
		end

		if not arg_27_1.tagAvailable then
			LUI.FlowManager.RequestPopupMenu(arg_24_0, "ClanTagUsedPopup", true, arg_24_1, false, {
				clanTag = arg_24_0._submittedClanTag
			})
		else
			LUI.FlowManager.RequestLeaveMenu(arg_24_0, false, true)
			LUI.FlowManager.RequestAddMenu("CreateClanP_2", true, arg_24_1, false, {
				clanName = arg_24_0._submittedClanName,
				clanTag = arg_24_0._submittedClanTag
			}, false)
		end

		arg_24_0.tagValidationStarted = false
	end)
	arg_24_0:registerEventHandler(CLANS.CLAN_EVENTS.CLAN_TAG_FROM_POPUP, function(arg_28_0, arg_28_1)
		local var_28_0 = arg_28_1.options.clanTag

		arg_24_0.ClanTagInput:SetDefaultInputString(var_28_0)
	end)
	var_0_10(arg_24_0)
	arg_24_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/CREATE_A_CLAN"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_24_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_24_0, arg_24_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function CreateClanP_1(arg_29_0, arg_29_1)
	local var_29_0 = LUI.UIVerticalNavigator.new()

	var_29_0.id = "CreateClanP_1"

	local var_29_1 = arg_29_1 and arg_29_1.controllerIndex

	if not var_29_1 and not Engine.DDJFBBJAIG() then
		var_29_1 = var_29_0:getRootController()
	end

	assert(var_29_1)

	var_29_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_29_1
	})
	var_29_0.HelperBar.id = "HelperBar"

	var_29_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_29_0.HelperBar:setPriority(10)
	var_29_0:addElement(var_29_0.HelperBar)

	local var_29_2 = var_29_0
	local var_29_3
	local var_29_4 = LUI.UIText.new()

	var_29_4.id = "ChooseClanTagHeader"

	var_29_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CHOOSE_CLAN_TAG")), 0)
	var_29_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_29_4:SetAlignment(LUI.Alignment.Center)
	var_29_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_29_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 257, _1080p * 307)
	var_29_0:addElement(var_29_4)

	var_29_0.ChooseClanTagHeader = var_29_4

	local var_29_5
	local var_29_6 = LUI.UIText.new()

	var_29_6.id = "ClanTagDescription"

	var_29_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_DESC"), 0)
	var_29_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_29_6:SetAlignment(LUI.Alignment.Center)
	var_29_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_29_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -754, _1080p * 754, _1080p * 421, _1080p * 457)
	var_29_0:addElement(var_29_6)

	var_29_0.ClanTagDescription = var_29_6

	local var_29_7
	local var_29_8 = LUI.UIText.new()

	var_29_8.id = "ClanNameLabel"

	var_29_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_NAME")), 0)
	var_29_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_29_8:SetAlignment(LUI.Alignment.Left)
	var_29_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -383, _1080p * -200, _1080p * 598, _1080p * 634)
	var_29_0:addElement(var_29_8)

	var_29_0.ClanNameLabel = var_29_8

	local var_29_9
	local var_29_10 = LUI.UIText.new()

	var_29_10.id = "ClanTagLabel"

	var_29_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG")), 0)
	var_29_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_29_10:SetAlignment(LUI.Alignment.Left)
	var_29_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -383, _1080p * -221, _1080p * 660, _1080p * 696)
	var_29_0:addElement(var_29_10)

	var_29_0.ClanTagLabel = var_29_10

	local var_29_11
	local var_29_12 = MenuBuilder.BuildRegisteredType("ClanInput", {
		controllerIndex = var_29_1
	})

	var_29_12.id = "ClanNameInput"

	var_29_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 598, _1080p * 634)
	var_29_0:addElement(var_29_12)

	var_29_0.ClanNameInput = var_29_12

	local var_29_13
	local var_29_14 = MenuBuilder.BuildRegisteredType("ClanInput", {
		controllerIndex = var_29_1
	})

	var_29_14.id = "ClanTagInput"

	var_29_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 660, _1080p * 696)
	var_29_0:addElement(var_29_14)

	var_29_0.ClanTagInput = var_29_14

	local var_29_15
	local var_29_16 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_29_1
	})

	var_29_16.id = "ContinueButton"

	var_29_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE")), 0)
	var_29_16.Description:setText(ToUpperCase(""), 0)
	var_29_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 774, _1080p * 814)
	var_29_0:addElement(var_29_16)

	var_29_0.ContinueButton = var_29_16

	local var_29_17
	local var_29_18 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_29_1
	})

	var_29_18.id = "TabBacker"

	var_29_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_29_0:addElement(var_29_18)

	var_29_0.TabBacker = var_29_18

	local var_29_19
	local var_29_20 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_29_1
	})

	var_29_20.id = "MenuTitle"

	var_29_20.MenuTitle:setText("PRIMARY WEAPON SELECT", 0)
	var_29_20.Line:SetLeft(0, 0)
	var_29_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_29_0:addElement(var_29_20)

	var_29_0.MenuTitle = var_29_20

	local var_29_21

	if CONDITIONS.InFrontend() then
		local var_29_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_29_1
		})

		var_29_22.id = "LobbyMembersFooter"

		var_29_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_29_0:addElement(var_29_22)

		var_29_0.LobbyMembersFooter = var_29_22
	end

	local var_29_23

	if CONDITIONS.IsUserSignedInDemonware(var_29_1) then
		local var_29_24 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_29_1
		})

		var_29_24.id = "MPPlayerDetails"

		var_29_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_29_0:addElement(var_29_24)

		var_29_0.MPPlayerDetails = var_29_24
	end

	local var_29_25
	local var_29_26 = LUI.UIText.new()

	var_29_26.id = "ErrorLabel"

	var_29_26:SetRGBFromTable(SWATCHES.genericMenu.failed, 0)
	var_29_26:setText("", 0)
	var_29_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_29_26:SetAlignment(LUI.Alignment.Center)
	var_29_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 727, _1080p * 745)
	var_29_0:addElement(var_29_26)

	var_29_0.ErrorLabel = var_29_26

	var_0_11(var_29_0, var_29_1, arg_29_1)

	return var_29_0
end

MenuBuilder.registerType("CreateClanP_1", CreateClanP_1)
LockTable(_M)
