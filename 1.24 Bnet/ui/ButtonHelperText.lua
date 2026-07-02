LUI.ButtonHelperText = LUI.Class(LUI.UIElement)

local var_0_0 = CoD.TextSettings.ButtonHelperFont
local var_0_1 = 30 * _1080p
local var_0_2 = 12
local var_0_3 = 2
local var_0_4 = 10.66
local var_0_5 = 10 * _1080p
local var_0_6 = SWATCHES.tabManager.tabText

LUI.ButtonHelperText.GAMEPAD_BUTTON_ICON_HEIGHT = 20
LUI.ButtonHelperText.PROMPT_ORDER = {
	"button_primary",
	"button_secondary",
	"button_start"
}
TOOLTIPS = {
	EXIT = {
		key = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")),
		text = Engine.CBBHFCGDIC("LUA_MENU/FOOTER_TOOLTIP_QUIT")
	},
	OPTIONS = {
		key = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS_CAPS")),
		text = Engine.CBBHFCGDIC("LUA_MENU/FOOTER_TOOLTIP_OPTIONS")
	},
	DISMISS = {
		key = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")),
		text = Engine.CBBHFCGDIC("LUA_MENU/FOOTER_TOOLTIP_DISMISS_GAME")
	}
}
LUI.ButtonHelperText.AutomaticIcons = {
	{
		icon = "FooterBackIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	},
	{
		icon = "FooterBackIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE")
	},
	{
		icon = "FooterOptionsIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	},
	{
		icon = "FooterCursorIcon",
		text = Engine.CBBHFCGDIC("MPUI/ENABLE_CURSOR")
	},
	{
		icon = "MuteAllIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
	},
	{
		icon = "UnmuteAllIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/UNMUTE_ALL")
	},
	{
		icon = "FooterNVidiaIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_SUMMARY")
	}
}

local function var_0_7(arg_1_0)
	if arg_1_0.optOutOfAutomaticKBMIcon then
		return nil
	end

	for iter_1_0, iter_1_1 in ipairs(LUI.ButtonHelperText.AutomaticIcons) do
		if string.find(arg_1_0.helper_text, iter_1_1.text) then
			return iter_1_1
		end
	end

	return nil
end

local function var_0_8(arg_2_0)
	local var_2_0 = ""

	for iter_2_0, iter_2_1 in pairs(TOOLTIPS) do
		if arg_2_0 == iter_2_1.key then
			var_2_0 = iter_2_1.text

			break
		end
	end

	return var_2_0
end

local function var_0_9(arg_3_0, arg_3_1)
	return (arg_3_1.clickable or arg_3_1.kbm_only) and LUI.IsLastInputKeyboardMouse(arg_3_0)
end

local function var_0_10(arg_4_0)
	return arg_4_0.button_ref and arg_4_0.button_ref or arg_4_0.button_ref2
end

local function var_0_11(arg_5_0)
	return (Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_5_0)) and LUI.ButtonHelperText.GAMEPAD_BUTTON_ICON_HEIGHT or var_0_0.Height
end

local function var_0_12(arg_6_0, arg_6_1, arg_6_2)
	assert(ButtonMap[arg_6_1])

	if not arg_6_2.useTextButtons or LUI.IsLastInputGamepad(arg_6_0) then
		return CoD.GetIconForButton(arg_6_1)
	else
		return CoD.GetTextForButton(arg_6_1)
	end
end

local function var_0_13(arg_7_0, arg_7_1, arg_7_2)
	if not var_0_9(arg_7_0, arg_7_2) then
		local var_7_0 = var_0_12(arg_7_0, arg_7_1, arg_7_2)
		local var_7_1 = var_0_11(arg_7_0)
		local var_7_2, var_7_3, var_7_4, var_7_5 = GetTextDimensions(var_7_0, var_0_0.Font, var_7_1)

		return var_7_4 - var_7_2
	elseif var_0_7(arg_7_2) then
		return var_0_4
	else
		return 0
	end
end

local function var_0_14(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0
	local var_8_1, var_8_2, var_8_3, var_8_4 = GetTextDimensions(var_8_0, var_0_0.Font, var_0_0.Height)
	local var_8_5 = var_8_3 - var_8_1

	if not arg_8_1 then
		var_8_5 = var_8_5 + 5
	end

	return var_8_5 * _1080p
end

local function var_0_15(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = var_0_9(arg_9_0, arg_9_1)
	local var_9_1 = 0
	local var_9_2 = 0
	local var_9_3 = 0
	local var_9_4 = 0
	local var_9_5 = 0

	if arg_9_2 and not var_9_0 then
		var_9_2 = var_0_13(arg_9_0, arg_9_2, arg_9_1)
	end

	local var_9_6 = var_0_14(arg_9_1.helper_text, var_9_0)

	if arg_9_3 and not var_9_0 then
		var_9_3 = var_0_13(arg_9_0, arg_9_3, arg_9_1)
	end

	return (arg_9_4 - (var_9_2 + var_9_6 + var_9_3)) / 2
end

local function var_0_16(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = var_0_9(arg_10_0, arg_10_2)
	local var_10_1 = var_0_12(arg_10_0, arg_10_1, arg_10_2)
	local var_10_2 = var_0_13(arg_10_0, arg_10_1, arg_10_2)
	local var_10_3 = var_0_11(arg_10_0)
	local var_10_4

	if not var_10_0 then
		var_10_4 = LUI.UIStyledText.new()

		var_10_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, var_10_2, -var_10_3 / 2, var_10_3 / 2)
		var_10_4:SetRGBFromTable(var_0_6)
		var_10_4:SetFont(var_0_0.Font)
		var_10_4:SetAlignment(LUI.Alignment.Center)
		var_10_4:SetTintFontIcons(true)
		var_10_4:SetAlpha(0.8, 0)
		var_10_4:SetWordWrap(false)

		var_10_4.id = arg_10_2.side .. "Icon"

		var_10_4:setText(var_10_1)
	else
		local var_10_5 = var_0_7(arg_10_2)

		if var_10_5 then
			var_10_4 = MenuBuilder.BuildRegisteredType(var_10_5.icon, {
				controllerIndex = arg_10_0
			})

			local var_10_6, var_10_7, var_10_8, var_10_9 = var_10_4:getLocalRect()
			local var_10_10 = var_10_8 - var_10_6

			var_10_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, var_10_10, -var_10_3 / 2, var_10_3 / 2)
			var_10_4:SetTintFontIcons(true)
			var_10_4:SetRGBFromTable(var_0_6)
			var_10_4:SetAlpha(1, 0)

			var_10_4.id = arg_10_2.side .. "Icon"
		end
	end

	return var_10_4
end

local function var_0_17(arg_11_0, arg_11_1, arg_11_2)
	return var_0_14(arg_11_0, arg_11_2)
end

local function var_0_18(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = var_0_9(arg_12_0, arg_12_1)
	local var_12_1 = var_0_17(arg_12_1.helper_text, arg_12_2, var_12_0)
	local var_12_2 = var_12_0 and SWATCHES.genericButton.listButtonDefault or var_0_6

	if arg_12_1.overrideTextUpColor then
		var_12_2 = arg_12_1.overrideTextUpColor
	end

	local var_12_3 = var_12_0 and SWATCHES.genericButton.textFocus or SWATCHES.buttonHelper.helperText

	if arg_12_1.overrideTextOverColor then
		var_12_2 = arg_12_1.overrideTextOverColor
	end

	local var_12_4 = {
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = var_12_3
		}
	}
	local var_12_5 = {
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = var_12_2
		}
	}
	local var_12_6 = LUI.UIText.new()
	local var_12_7 = var_0_0.Height * _1080p * 0.5

	var_12_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, var_12_1, -var_12_7, var_12_7)
	var_12_6:SetFont(var_0_0.Font)
	var_12_6:SetAlignment(arg_12_2 and LUI.Alignment.Center or LUI.Alignment.Left)
	var_12_6:SetRGBFromTable(var_12_2)

	var_12_6.id = "promptText" .. arg_12_1.primaryRef
	var_12_6.ref = arg_12_1.primaryRef

	var_12_6:setText(arg_12_1.helper_text)
	var_12_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_6:SetWordWrap(false)
	var_12_6:RegisterAnimationSequence("buttonOver", var_12_4)
	var_12_6:RegisterAnimationSequence("buttonUp", var_12_5)
	var_12_6:AnimateSequence("buttonUp")
	var_12_6:registerEventHandler("button_up", function(arg_13_0, arg_13_1)
		arg_13_0:AnimateSequence("buttonUp")
	end)
	var_12_6:registerEventHandler("button_over", function(arg_14_0, arg_14_1)
		arg_14_0:AnimateSequence("buttonOver")
	end)

	return var_12_6
end

function SendButtonEvent(arg_15_0, arg_15_1)
	if arg_15_0.data.clickable and arg_15_1.mouse == true then
		local var_15_0 = {}

		var_15_0.name = "gamepad_button"
		var_15_0.immediate = true

		assert(ButtonMap[arg_15_0.data.primaryRef].raw_button)

		var_15_0.button = ButtonMap[arg_15_0.data.primaryRef].raw_button
		var_15_0.down = var_15_0.button ~= "select"
		var_15_0.controller = arg_15_1.controller

		arg_15_0:dispatchEventToRoot(var_15_0)
	end
end

local function var_0_19(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0
	local var_16_1 = var_0_9(arg_16_0, arg_16_1)

	if arg_16_1.width then
		var_16_0 = arg_16_1.width
	else
		local var_16_2 = 0
		local var_16_3 = 0

		if arg_16_2 then
			var_16_2 = var_0_13(arg_16_0, arg_16_2, arg_16_1)
		end

		local var_16_4 = var_0_14(arg_16_1.helper_text, var_16_1)

		if arg_16_3 then
			var_16_3 = var_0_13(arg_16_0, arg_16_3, arg_16_1)
		end

		if var_16_1 then
			local var_16_5 = var_0_7(arg_16_1)

			var_16_0 = var_16_2 + var_16_4 + var_16_3 + var_0_5 * 2

			if arg_16_2 and var_16_5 then
				var_16_0 = var_16_0 + var_0_5
			end

			if arg_16_3 and var_16_5 then
				var_16_0 = var_16_0 + var_0_5
			end
		else
			var_16_0 = var_16_2 + var_16_4 + var_16_3
		end
	end

	return var_16_0
end

local function var_0_20(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.button_ref
	local var_17_1 = arg_17_1.button_ref2
	local var_17_2 = var_0_19(arg_17_0, arg_17_1, var_17_0, var_17_1)
	local var_17_3 = var_0_9(arg_17_0, arg_17_1)

	arg_17_1.primaryRef = var_0_10(arg_17_1)

	if arg_17_1.useTextButtons == nil then
		arg_17_1.useTextButtons = false
	end

	local var_17_4 = LUI.UIButton.new()

	if arg_17_1.container then
		local var_17_5 = arg_17_1.container:GetCurrentAnchorsAndPositions()
		local var_17_6 = (var_17_5.right - var_17_5.left) / 2

		if arg_17_1.containerAlignment == LUI.Alignment.Right then
			var_17_4:SetAnchorsAndPosition(1, 0, 0, 0, -var_17_2, 0, 0, 0)
		elseif arg_17_1.containerAlignment == LUI.Alignment.Center then
			var_17_4:SetAnchorsAndPosition(0, 1, 0, 0, var_17_6 - var_17_2 / 2, var_17_6 + var_17_2 / 2, 0, 0)
		else
			var_17_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_17_2, 0, 0)
		end
	else
		var_17_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_17_2, 0, 0)
	end

	var_17_4.id = arg_17_1.primaryRef
	var_17_4.data = arg_17_1
	var_17_4.m_requireFocusType = FocusType.MouseOver
	var_17_4.ref = arg_17_1.primaryRef
	var_17_4.hasTwoButtons = arg_17_1.button_ref and arg_17_1.button_ref2
	var_17_4.blockKeyboardSound = true

	if var_17_3 then
		if not arg_17_1.ignoreButtonBackground then
			local var_17_7 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
				controllerIndex = arg_17_0
			})

			var_17_7.id = "ButtonBackground"

			var_17_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
			var_17_4:addElement(var_17_7)

			var_17_4.ButtonBackground = var_17_7
		end

		if var_17_0 then
			local var_17_8 = CoD.GetTextForButton(var_17_0)
			local var_17_9 = arg_17_1.helper_text

			if arg_17_1.kbmTooltipPromptOverload and arg_17_1.kbmTooltipPromptOverload ~= "" then
				var_17_8 = CoD.GetTextForButton(arg_17_1.kbmTooltipPromptOverload)
			end

			for iter_17_0, iter_17_1 in ipairs(LUI.ButtonHelperText.PROMPT_ORDER) do
				if iter_17_1 == var_17_0 then
					var_17_9 = var_0_8(Engine.CBEAHDFCFC(var_17_9))
				end
			end

			if var_17_9 == arg_17_1.helper_text then
				var_17_9 = ""
			end

			if var_17_8 then
				local var_17_10 = {
					{
						keyprompt_text = var_17_8,
						helper_text = var_17_9,
						button_ref = var_17_0,
						ignoreTooltipPrompt = arg_17_1.ignoreTooltipPrompt
					}
				}

				if not arg_17_1.ignoreTooltip then
					local var_17_11 = {
						promptsData = var_17_10
					}

					var_17_4:AddTooltipData(arg_17_0, var_17_11)
				end
			end
		end
	end

	var_17_4:registerEventHandler("button_action", SendButtonEvent)

	local var_17_12 = LUI.UIHorizontalList.new()

	if var_17_3 then
		var_17_12:SetAnchorsAndPosition(0, 0, 0, 0, var_0_5, 0, 0, 0)
	else
		var_17_12:SetAnchorsAndPosition(0, 0, 0, 0, var_0_15(arg_17_0, arg_17_1, var_17_0, var_17_1, var_17_2), var_17_2, 0, 0)
	end

	var_17_12:SetSpacing(var_0_5)

	var_17_12.id = "helperHorizontalList"

	if var_17_0 then
		local var_17_13 = var_0_16(arg_17_0, var_17_0, arg_17_1)

		if var_17_13 then
			var_17_13:SetRGBFromTable(var_0_6)
			var_17_12:addElement(var_17_13)
		end
	end

	var_17_12:addElement(var_0_18(arg_17_0, arg_17_1, var_17_4.hasTwoButtons))

	if var_17_1 then
		local var_17_14 = var_0_16(arg_17_0, var_17_1, arg_17_1)

		if var_17_14 then
			var_17_14:SetRGBFromTable(var_0_6)
			var_17_12:addElement(var_17_14)
		end
	end

	var_17_4:addElement(var_17_12)

	if arg_17_1.priority then
		var_17_4:setPriority(arg_17_1.priority)
	end

	if not arg_17_1.clickable then
		var_17_4:SetFocusable(false)
		var_17_4:SetHandleMouseButton(false)
	end

	return var_17_4
end

local function var_0_21(arg_18_0)
	local var_18_0 = 75
	local var_18_1 = -75
	local var_18_2 = LUI.UIElement.new()

	var_18_2:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 5, 26)

	var_18_2.id = "buttonHelperListContainer"
	arg_18_0._buttonHelperLists = {}

	local var_18_3 = LUI.UIHorizontalList.new()

	var_18_3:SetLeft(var_18_0)
	var_18_3:SetAlignment(LUI.Alignment.Left)
	var_18_3:SetSpacing(var_0_1)

	var_18_3.id = "buttonHelperLeftList"
	var_18_3.side = "left"

	var_18_2:addElement(var_18_3)

	var_18_2.buttonHelperLeftList = var_18_3
	arg_18_0._buttonHelperLists.left = var_18_3

	local var_18_4 = LUI.UIHorizontalList.new()

	var_18_4:SetRight(var_18_1)
	var_18_4:SetAlignment(LUI.Alignment.Right)
	var_18_4:SetSpacing(var_0_1)

	var_18_4.id = "buttonHelperRightList"
	var_18_4.side = "right"

	var_18_2:addElement(var_18_4)

	var_18_2.buttonHelperRightList = var_18_4
	arg_18_0._buttonHelperLists.right = var_18_4

	local var_18_5 = LUI.UIHorizontalList.new()

	var_18_5:SetLeft(var_18_0)
	var_18_5:SetRight(var_18_1)
	var_18_5:SetAlignment(LUI.Alignment.Center)
	var_18_5:SetSpacing(var_0_1)

	var_18_5.id = "buttonHelperCenterList"
	var_18_5.side = "center"

	var_18_2:addElement(var_18_5)

	var_18_2.buttonHelperCenterList = var_18_5
	arg_18_0._buttonHelperLists.center = var_18_5

	if LUI.IsLastInputKeyboardMouse(arg_18_0._controllerIndex) then
		var_18_3:SetSpacing(var_0_2)
		var_18_5:SetSpacing(var_0_2)
		var_18_4:SetSpacing(var_0_2)
	end

	var_18_2:registerEventHandler("update_input_type", function(arg_19_0, arg_19_1)
		if LUI.IsLastInputKeyboardMouse(arg_19_1.controllerIndex) then
			arg_19_0.buttonHelperLeftList:SetSpacing(var_0_2)
			arg_19_0.buttonHelperCenterList:SetSpacing(var_0_2)
			arg_19_0.buttonHelperRightList:SetSpacing(var_0_2)
		else
			arg_19_0.buttonHelperLeftList:SetSpacing(var_0_1)
			arg_19_0.buttonHelperCenterList:SetSpacing(var_0_1)
			arg_19_0.buttonHelperRightList:SetSpacing(var_0_1)
		end
	end)

	return var_18_2
end

function LUI.ButtonHelperText.GetPromptByButtonRef(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0._buttonHelperLists) do
		local var_20_0 = iter_20_1:getFirstChild()

		while var_20_0 do
			if var_20_0.data.primaryRef == arg_20_1 then
				var_20_0.side = iter_20_1.side

				return var_20_0
			end

			var_20_0 = var_20_0:getNextSibling()
		end
	end
end

function LUI.ButtonHelperText.AddHelperListContainer(arg_21_0, arg_21_1)
	assert(arg_21_0._buttonHelperLists)
	assert(arg_21_1.id ~= "left" and arg_21_1.id ~= "right", "Custom button helper containers cannot be named \"left\" or \"right\". These are reserved")

	if arg_21_0._buttonHelperLists[arg_21_1.id] then
		return
	end

	arg_21_0._buttonHelperLists[arg_21_1.id] = arg_21_1
end

function LUI.ButtonHelperText.AttemptRemoveHelperListContainer(arg_22_0, arg_22_1)
	assert(arg_22_0._buttonHelperLists)

	local var_22_0

	if #arg_22_0._promptStack[arg_22_1] > 0 then
		var_22_0 = arg_22_0._promptStack[arg_22_1][#arg_22_0._promptStack[arg_22_1]].side
	end

	if var_22_0 == "left" or var_22_0 == "right" or var_22_0 == nil then
		return
	end

	local var_22_1 = arg_22_0._buttonHelperLists[var_22_0]

	if not var_22_1 then
		return
	end

	if var_22_1:getFirstChild() then
		return
	end

	arg_22_0._buttonHelperLists[var_22_0] = nil
end

function LUI.ButtonHelperText.PushButtonPrompt(arg_23_0, arg_23_1, arg_23_2)
	assert(arg_23_1.button_ref and #arg_23_1.button_ref > 0 or arg_23_1.button_ref2 and #arg_23_1.button_ref2 > 0)
	assert(arg_23_1.helper_text)

	arg_23_2 = arg_23_2 or {}
	arg_23_2.replaceTop = arg_23_2.replaceTop or false

	if arg_23_1.container then
		arg_23_0:AddHelperListContainer(arg_23_1.container)

		arg_23_1.side = arg_23_1.container.id
	end

	if arg_23_1.useTextButtons == nil then
		arg_23_1.useTextButtons = false
	end

	arg_23_1.side = arg_23_1.side or "left"

	if arg_23_1.clickable == nil then
		arg_23_1.clickable = true
	end

	local var_23_0 = var_0_10(arg_23_1)

	assert(ButtonMap[var_23_0])

	if not arg_23_0._promptStack[var_23_0] then
		arg_23_0._promptStack[var_23_0] = {}
	end

	local var_23_1 = arg_23_0.wasLastInputGamepad and not LUI.IsLastInputGamepad(arg_23_0._controllerIndex)

	arg_23_0.wasLastInputGamepad = LUI.IsLastInputGamepad(arg_23_0._controllerIndex)

	local var_23_2 = #arg_23_0._promptStack[var_23_0]

	if arg_23_1.helper_text == "" then
		arg_23_0:RemoveButtonPrompt(var_23_0)

		return
	elseif var_23_2 > 0 then
		arg_23_1.primaryRef = var_0_10(arg_23_1)

		if LUI.AreTableContentsEqual(arg_23_1, arg_23_0._promptStack[var_23_0][var_23_2]) and not var_23_1 then
			return
		end

		if arg_23_2.replaceTop then
			arg_23_0:RemoveButtonPrompt(var_23_0)
		else
			arg_23_0:CloseButtonPrompt(var_23_0)
		end
	end

	table.insert(arg_23_0._promptStack[var_23_0], arg_23_1)

	local var_23_3 = false

	if arg_23_1.force_display then
		var_23_3 = true
	elseif LUI.IsLastInputGamepad(arg_23_0._controllerIndex) then
		if not arg_23_1.kbm_only then
			var_23_3 = true
		end
	elseif not arg_23_1.gamepad_only and var_23_0 ~= "button_primary" then
		var_23_3 = true
	end

	if var_23_3 then
		arg_23_0._buttonHelperLists[arg_23_1.side]:addElement(var_0_20(arg_23_0._controllerIndex, arg_23_1))
	end
end

function LUI.ButtonHelperText.RemoveButtonPrompt(arg_24_0, arg_24_1)
	arg_24_0:CloseButtonPrompt(arg_24_1)
	arg_24_0:AttemptRemoveHelperListContainer(arg_24_1)
	assert(arg_24_0._promptStack[arg_24_1], "Attempting to remove a button prompt that doesn't exist.")
	table.remove(arg_24_0._promptStack[arg_24_1])
end

function LUI.ButtonHelperText.CloseButtonPrompt(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0:GetPromptByButtonRef(arg_25_1)

	if var_25_0 then
		var_25_0:processEvent({
			immediate = true,
			name = "lose_focus"
		})
		var_25_0:closeTree()
	end
end

function LUI.ButtonHelperText.RefreshButtonHelpers(arg_26_0, arg_26_1)
	arg_26_0._controllerIndex = arg_26_1.controllerIndex

	local var_26_0 = LUI.DeepCopy(arg_26_0._promptStack)

	for iter_26_0, iter_26_1 in pairs(arg_26_0._promptStack) do
		if #iter_26_1 > 0 then
			arg_26_0:RemoveButtonPrompt(iter_26_0)
		end
	end

	for iter_26_2, iter_26_3 in ipairs(arg_26_0.PROMPT_ORDER) do
		if var_26_0[iter_26_3] then
			local var_26_1 = var_26_0[iter_26_3][#var_26_0[iter_26_3]]

			if var_26_1 then
				arg_26_0:PushButtonPrompt(var_26_1)
			end

			var_26_0[iter_26_3] = nil
		end
	end

	for iter_26_4, iter_26_5 in pairs(var_26_0) do
		if #iter_26_5 > 0 then
			local var_26_2 = iter_26_5[#iter_26_5]

			arg_26_0:PushButtonPrompt(var_26_2)
		end
	end
end

function LUI.ButtonHelperText.PopButtonPrompt(arg_27_0, arg_27_1)
	assert(arg_27_0._buttonHelperLists)

	local var_27_0 = var_0_10(arg_27_1)

	if not arg_27_0._promptStack[var_27_0] then
		DebugPrint("PopButtonPrompt: '" .. var_27_0 .. "' doesn't exist")

		return
	end

	arg_27_0:RemoveButtonPrompt(var_27_0)

	local var_27_1 = arg_27_0._promptStack[var_27_0]

	if var_27_1 and #var_27_1 > 0 then
		arg_27_0:PushButtonPrompt(var_27_1[#var_27_1])
	end
end

function LUI.ButtonHelperText.SetupFocusOnlyButtonPrompt(arg_28_0, arg_28_1, arg_28_2)
	arg_28_1:addEventHandler("gain_focus", function(arg_29_0, arg_29_1)
		arg_28_0:PushButtonPrompt(arg_28_2)
	end)
	arg_28_1:addEventHandler("lose_focus", function(arg_30_0, arg_30_1)
		if arg_30_0:isInFocus() then
			arg_28_0:PopButtonPrompt(arg_28_2)
		end
	end)
end

local function var_0_22(arg_31_0, arg_31_1)
	arg_31_0:SetupFocusOnlyButtonPrompt(arg_31_1.focusButton, arg_31_1)
end

function LUI.ButtonHelperText.init(arg_32_0, arg_32_1)
	assert(arg_32_1.controllerIndex)

	arg_32_0._controllerIndex = arg_32_1.controllerIndex

	LUI.ButtonHelperText.super.init(arg_32_0)
	arg_32_0:addElement(var_0_21(arg_32_0))
	arg_32_0:registerEventHandler("update_input_type", arg_32_0.RefreshButtonHelpers)
	arg_32_0:registerEventHandler("add_button_helper_text", arg_32_0.PushButtonPrompt)
	arg_32_0:registerEventHandler("setup_focus_only_button_prompt", var_0_22)

	arg_32_0._promptStack = {}
end
