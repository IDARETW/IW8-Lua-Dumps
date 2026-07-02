module(..., package.seeall)

local var_0_0 = 1
local var_0_1 = 5
local var_0_2 = 5
local var_0_3 = 500
local var_0_4 = 700

local function var_0_5(arg_1_0)
	local var_1_0 = arg_1_0.ClanTagInput.TextEdit:getText()

	arg_1_0._clanTagValid = false

	Clans2.CAECAECGBH(arg_1_0._controllerIndex, var_1_0)
end

local function var_0_6(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	ACTIONS.AnimateSequence(arg_2_1, "CenterText")

	local var_2_0 = arg_2_3 * var_0_1 + arg_2_2
	local var_2_1 = arg_2_0._suggestedTags[var_2_0]

	arg_2_1.Text:setText(var_2_1)
	arg_2_1:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
		arg_2_0.ClanTagInput:SetDefaultInputString(var_2_1)
		var_0_5(arg_2_0)
	end)
end

local function var_0_7(arg_4_0, arg_4_1)
	Clans2.EEJBJCDBI(arg_4_0._controllerIndex, arg_4_1)
	arg_4_0:addEventHandler(CLANS.CLAN_EVENTS.FETCH_SUGGESTED_CLAN_TAGS, function(arg_5_0, arg_5_1)
		arg_4_0._suggestedTags = arg_5_1.suggestionCount

		local var_5_0 = #arg_4_0._suggestedTags

		if arg_5_1.suggestionCount[0] ~= nil then
			var_5_0 = var_5_0 + 1
		end

		var_5_0 = var_5_0 > var_0_2 and var_0_2 or var_5_0

		arg_4_0.TagSuggestionGrid:SetNumChildren(var_5_0)
		arg_4_0.TagSuggestionGrid:RefreshContent()
	end)
end

local function var_0_8(arg_6_0)
	if arg_6_0._ctDebounceTimer ~= nil then
		arg_6_0._ctDebounceTimer:closeTree()

		arg_6_0._ctDebounceTimer = nil
	end
end

local function var_0_9(arg_7_0)
	if arg_7_0._ctDebounceTimer ~= nil then
		arg_7_0._ctDebounceTimer:closeTree()

		arg_7_0._ctDebounceTimer = nil
	end

	arg_7_0._ctDebounceTimer = LUI.UITimer.new({
		event = "ct_debounce_tag_typing",
		interval = var_0_3
	})
	arg_7_0._ctDebounceTimer.id = "ctDebounceTimer"

	arg_7_0:addElement(arg_7_0._ctDebounceTimer)
	arg_7_0:addAndCallEventHandler("ct_debounce_tag_typing", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_7_0.ClanTagInput.TextEdit:getText()

		if arg_7_0._previousInput ~= var_8_0 then
			var_0_5(arg_7_0)
			var_0_7(arg_7_0, var_8_0)
		end

		arg_7_0._previousInput = var_8_0
	end)
end

local function var_0_10(arg_9_0, arg_9_1)
	arg_9_0.ClanTagInput:SetupTextEdit({
		_skipDefaultInputString = true,
		_maxStringLength = CLANS.MAX_TAG_LENGTH,
		_defaultInputString = Engine.CBBHFCGDIC("LUA_MENU/SAMPLE_CLAN_TAG")
	})

	function arg_9_0.ClanTagInput.buttonActionCallbackFunc()
		if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_9_0._controllerIndex) then
			arg_9_0.ClanTagInput:SetTextEditOff()
			OSK.CBJGJDGFC(arg_9_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG"), "", CLANS.MAX_TAG_LENGTH, true, true, true, function(arg_11_0, arg_11_1, arg_11_2)
				if arg_11_1 then
					arg_9_0.ClanTagInput.TextEdit:setTextEditText(arg_11_1)
				end

				arg_9_0.ClanTagInput:SetTextEditOff()
			end, CoD.KeyboardInputTypes.Normal)
		end

		var_0_9(arg_9_0)
	end

	function arg_9_0.ClanTagInput.textEditCompleteCallbackFunc(arg_12_0, arg_12_1)
		if LUI.IsLastInputKeyboardMouse(arg_9_0._controllerIndex) then
			arg_9_0.ClanTagInput:SetTextEditOff()
		else
			return function(arg_13_0, arg_13_1)
				local var_13_0 = FocusType.MouseOver

				if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_9_0._controllerIndex) then
					var_13_0 = FocusType.Gamepad
				end

				arg_13_0:getParent():FocusNextElement(arg_13_0, "down", var_13_0, arg_13_1._qualifier, arg_9_0._controllerIndex)
			end
		end

		arg_9_0:Wait(var_0_4).onComplete = function()
			var_0_8(arg_9_0)
			var_0_5(arg_9_0)
		end
	end

	function arg_9_0.ClanTagInput.isTypingCallbackFunc(arg_15_0, arg_15_1)
		arg_9_0.ClanTagInput.TextEdit:setTextEditText(arg_15_1)
	end

	arg_9_0.ClanTagInput:SetDefaultInputString(arg_9_1)
	arg_9_0.ClanTagInput:ForceSetFirstInteractionFalse()
	var_0_5(arg_9_0)
end

local function var_0_11(arg_16_0)
	ACTIONS.LeaveMenu(arg_16_0)
end

local function var_0_12(arg_17_0)
	if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_17_0._controllerIndex) then
		arg_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_17_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_13(arg_18_0)
	local var_18_0 = LUI.UIBindButton.new()

	var_18_0.id = "selfBindButton"

	arg_18_0:addElement(var_18_0)

	arg_18_0._bindButton = var_18_0

	arg_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_18_0._bindButton:addEventHandler("button_secondary", function(arg_19_0, arg_19_1)
		var_0_11(arg_18_0)
	end)
	arg_18_0:addAndCallEventHandler("update_input_type", arg_18_0.UpdateInputType, {
		controllerIndex = arg_18_0._controllerIndex
	})
end

local function var_0_14(arg_20_0)
	arg_20_0:addEventHandler(CLANS.CLAN_EVENTS.CHECK_TAG_AVAILABILITY, function(arg_21_0, arg_21_1)
		if not arg_21_1.tagAvailable then
			arg_20_0._clanTagValid = false

			ACTIONS.AnimateSequence(arg_20_0.ClanTagInput, "Error")
		else
			arg_20_0._clanTagValid = true

			ACTIONS.AnimateSequence(arg_20_0.ClanTagInput, "Valid")
		end
	end)
end

local function var_0_15(arg_22_0)
	arg_22_0.ClanTagUsedLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_USED_HEADER"))
	arg_22_0.ContinueButton:addEventHandler("button_action", function(arg_23_0, arg_23_1)
		local var_23_0 = arg_22_0.ClanTagInput.TextEdit:getText()

		if not arg_22_0._clanTagValid then
			LUI.FlowManager.RequestPopupMenu(arg_22_0, "PopupOK", true, arg_23_1.controller, false, {
				message = Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_USED_HEADER")
			})
		else
			arg_22_0:dispatchEventToRoot({
				dispatchChildren = true,
				immediate = true,
				name = CLANS.CLAN_EVENTS.CLAN_TAG_FROM_POPUP,
				options = {
					clanTag = var_23_0
				}
			})
			ACTIONS.LeaveMenu(arg_22_0)
		end
	end)
end

local function var_0_16(arg_24_0, arg_24_1)
	arg_24_0.ClanTagUsedLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECT_NEW_CLAN_TAG"))
	arg_24_0.ContinueButton:addEventHandler("button_action", function(arg_25_0, arg_25_1)
		local var_25_0 = arg_24_0.ClanTagInput.TextEdit:getText()

		if not arg_24_0._clanTagValid then
			LUI.FlowManager.RequestPopupMenu(arg_24_0, "PopupOK", true, arg_25_1.controller, false, {
				message = Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_USED_HEADER")
			})
		else
			LUI.FlowManager.RequestPopupMenu(arg_24_0, "ClanConfirmActionPopup", true, arg_25_1.controller, false, {
				controllerIndex = arg_24_0._controllerIndex,
				clanDetails = arg_24_1.clanDetails,
				usage = CLANS.CLAN_POPUP_INPUT.CLAN_TAG,
				clanTag = var_25_0
			})
		end
	end)
	arg_24_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_TAG_EDITED, function(arg_26_0, arg_26_1)
		ACTIONS.LeaveMenu(arg_24_0)
	end)
end

local function var_0_17(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0._controllerIndex = arg_27_1
	arg_27_0.UpdateInputType = var_0_12
	arg_27_0._clanTagValid = false
	arg_27_0._previousInput = ""
	arg_27_0._inputUsage = arg_27_2.usage or nil

	var_0_10(arg_27_0, arg_27_2.clanTag)
	var_0_14(arg_27_0)
	var_0_7(arg_27_0, arg_27_2.clanTag)
	var_0_13(arg_27_0)

	if arg_27_0._inputUsage == CLANS.CLAN_POPUP_INPUT.CLAN_TAG then
		var_0_16(arg_27_0, arg_27_2)
	else
		var_0_15(arg_27_0)
	end

	ACTIONS.AnimateSequence(arg_27_0.ContinueButton, "CenterText")
	ACTIONS.AnimateSequence(arg_27_0.CancelButton, "CenterText")
	arg_27_0.CancelButton:registerEventHandler("button_action", function(arg_28_0, arg_28_1)
		var_0_11(arg_27_0)
	end)
	arg_27_0.TagSuggestionGrid:SetSnapOnWrapEnabled(true)
	arg_27_0.TagSuggestionGrid:SetRefreshChild(function(arg_29_0, arg_29_1, arg_29_2)
		var_0_6(arg_27_0, arg_29_0, arg_29_1, arg_29_2)
	end)
	arg_27_0.TagSuggestionGrid:SetNumChildren(0)
	arg_27_0.TagSuggestionGrid:RefreshContent()
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_27_0, arg_27_1, {
		addWorldBlur = true,
		addScreenDarkener = true,
		darkenerOpacity = LAYOUT.DEFAULT_POPUP_DARKENER_OPACITY
	})
end

function ClanTagUsedPopup(arg_30_0, arg_30_1)
	local var_30_0 = LUI.UIVerticalNavigator.new()

	var_30_0.id = "ClanTagUsedPopup"

	local var_30_1 = arg_30_1 and arg_30_1.controllerIndex

	if not var_30_1 and not Engine.DDJFBBJAIG() then
		var_30_1 = var_30_0:getRootController()
	end

	assert(var_30_1)

	var_30_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_30_1
	})
	var_30_0.HelperBar.id = "HelperBar"

	var_30_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_30_0.HelperBar:setPriority(10)
	var_30_0:addElement(var_30_0.HelperBar)

	local var_30_2 = var_30_0
	local var_30_3
	local var_30_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_30_1
	})

	var_30_4.id = "GenericPopupWindow"

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_30_4.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_30_4.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_30_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -310, _1080p * 379)
	var_30_0:addElement(var_30_4)

	var_30_0.GenericPopupWindow = var_30_4

	local var_30_5
	local var_30_6 = LUI.UIText.new()

	var_30_6.id = "ClanTagUsedLabel"

	var_30_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_USED_HEADER")), 0)
	var_30_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_30_6:SetAlignment(LUI.Alignment.Center)
	var_30_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -311, _1080p * 311, _1080p * 265, _1080p * 315)
	var_30_0:addElement(var_30_6)

	var_30_0.ClanTagUsedLabel = var_30_6

	local var_30_7
	local var_30_8 = LUI.UIText.new()

	var_30_8.id = "EnterTagLabel"

	var_30_8:setText(Engine.CBBHFCGDIC("LUA_MENU/ENTER_NEW_TAG"), 0)
	var_30_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_30_8:SetAlignment(LUI.Alignment.Center)
	var_30_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 411, _1080p * 447)
	var_30_0:addElement(var_30_8)

	var_30_0.EnterTagLabel = var_30_8

	local var_30_9
	local var_30_10 = MenuBuilder.BuildRegisteredType("ClanInput", {
		controllerIndex = var_30_1
	})

	var_30_10.id = "ClanTagInput"

	var_30_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 472, _1080p * 522)
	var_30_0:addElement(var_30_10)

	var_30_0.ClanTagInput = var_30_10

	local var_30_11
	local var_30_12 = LUI.UIText.new()

	var_30_12.id = "ClanTagSuggestionsLabel"

	var_30_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_SUGGESTIONS_INFO"), 0)
	var_30_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_30_12:SetAlignment(LUI.Alignment.Center)
	var_30_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -321, _1080p * 321, _1080p * 685, _1080p * 713)
	var_30_0:addElement(var_30_12)

	var_30_0.ClanTagSuggestionsLabel = var_30_12

	local var_30_13
	local var_30_14 = {
		scrollingThresholdX = 1000,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1000,
		wrapX = false,
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_30_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ClanTagSuggestButton", {
				controllerIndex = var_30_1
			})
		end,
		refreshChild = function(arg_32_0, arg_32_1, arg_32_2)
			return
		end,
		spacingX = _1080p * 7,
		spacingY = _1080p * 7,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_30_15 = LUI.UIGrid.new(var_30_14)

	var_30_15.id = "TagSuggestionGrid"

	var_30_15:setUseStencil(true)
	var_30_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -520, _1080p * 520, _1080p * 574, _1080p * 632)
	var_30_0:addElement(var_30_15)

	var_30_0.TagSuggestionGrid = var_30_15

	local var_30_16
	local var_30_17 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_30_1
	})

	var_30_17.id = "ContinueButton"

	var_30_17.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_30_17.Description:setText("", 0)
	var_30_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 767, _1080p * 807)
	var_30_0:addElement(var_30_17)

	var_30_0.ContinueButton = var_30_17

	local var_30_18
	local var_30_19 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_30_1
	})

	var_30_19.id = "CancelButton"

	var_30_19.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_30_19.Description:setText("", 0)
	var_30_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 828, _1080p * 868)
	var_30_0:addElement(var_30_19)

	var_30_0.CancelButton = var_30_19

	var_0_17(var_30_0, var_30_1, arg_30_1)

	return var_30_0
end

MenuBuilder.registerType("ClanTagUsedPopup", ClanTagUsedPopup)
LockTable(_M)
