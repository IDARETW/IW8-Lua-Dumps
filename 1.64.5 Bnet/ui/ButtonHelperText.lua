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
	"button_start",
	"button_alt1"
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
	},
	INSTALL = {
		key = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")),
		text = Engine.CBBHFCGDIC("LUA_MENU/FOOTER_TOOLTIP_MODIFY_INSTALL")
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
	},
	{
		icon = "FooterMouseIcon",
		text = Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_HIGHLIGHTS")
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
	local var_8_0 = 5
	local var_8_1 = 0.1
	local var_8_2, var_8_3, var_8_4, var_8_5 = GetTextDimensions(arg_8_0, var_0_0.Font, var_0_0.Height)
	local var_8_6 = var_8_4 - var_8_2

	if not arg_8_1 then
		var_8_6 = var_8_6 + var_8_0
	else
		local var_8_7 = var_8_6 * var_8_1

		var_8_7 = var_8_7 < var_8_0 and var_8_0 or var_8_7
		var_8_6 = var_8_6 + var_8_7
	end

	return var_8_6 * _1080p
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
	local var_10_0 = var_0_9(arg_10_0, arg_10_2) or arg_10_2.always_use_alt_PC_icon
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
	local var_11_0 = var_0_9(arg_11_0, arg_11_1)
	local var_11_1 = var_0_14(arg_11_1.helper_text, var_11_0)
	local var_11_2 = var_11_0 and SWATCHES.genericButton.listButtonDefault or var_0_6

	if arg_11_1.overrideTextUpColor then
		var_11_2 = arg_11_1.overrideTextUpColor
	end

	local var_11_3 = var_11_0 and SWATCHES.genericButton.textFocus or SWATCHES.buttonHelper.helperText

	if arg_11_1.overrideTextOverColor then
		var_11_2 = arg_11_1.overrideTextOverColor
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_11_3 = SWATCHES.CH2.WZGenericText
		var_11_2 = SWATCHES.CH2.WZGenericTabText
	end

	local var_11_4 = {
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = var_11_3
		}
	}
	local var_11_5 = {
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = var_11_2
		}
	}
	local var_11_6 = LUI.UIText.new()
	local var_11_7 = var_0_0.Height * _1080p * 0.5

	var_11_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, var_11_1, -var_11_7, var_11_7)
	var_11_6:SetFont(var_0_0.Font)
	var_11_6:SetAlignment(arg_11_2 and LUI.Alignment.Center or LUI.Alignment.Left)
	var_11_6:SetRGBFromTable(var_11_2)

	var_11_6.id = "promptText" .. arg_11_1.primaryRef
	var_11_6.ref = arg_11_1.primaryRef

	var_11_6:setText(arg_11_1.helper_text)
	var_11_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_6:SetWordWrap(false)
	var_11_6:RegisterAnimationSequence("buttonOver", var_11_4)
	var_11_6:RegisterAnimationSequence("buttonUp", var_11_5)
	var_11_6:AnimateSequence("buttonUp")
	var_11_6:registerEventHandler("button_up", function(arg_12_0, arg_12_1)
		arg_12_0:AnimateSequence("buttonUp")
	end)
	var_11_6:registerEventHandler("button_over", function(arg_13_0, arg_13_1)
		arg_13_0:AnimateSequence("buttonOver")
	end)

	return var_11_6
end

function SendButtonEvent(arg_14_0, arg_14_1)
	if arg_14_0.data.clickable and arg_14_1.mouse == true then
		local var_14_0 = {}

		assert(ButtonMap[arg_14_0.data.primaryRef].raw_button)

		local var_14_1 = ButtonMap[arg_14_0.data.primaryRef]

		var_14_0.name = "gamepad_button"
		var_14_0.immediate = true
		var_14_0.button = var_14_1.raw_button
		var_14_0.down = var_14_0.button ~= "select"
		var_14_0.controller = arg_14_1.controller

		if var_14_1.qualifier then
			var_14_0.qualifier = var_14_1.qualifier
		end

		arg_14_0:dispatchEventToRoot(var_14_0)
	end
end

local function var_0_18(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0
	local var_15_1 = var_0_9(arg_15_0, arg_15_1)

	if arg_15_1.width then
		var_15_0 = arg_15_1.width
	else
		local var_15_2 = 0
		local var_15_3 = 0

		if arg_15_2 then
			var_15_2 = var_0_13(arg_15_0, arg_15_2, arg_15_1)
		end

		local var_15_4 = var_0_14(arg_15_1.helper_text, var_15_1)

		if arg_15_3 then
			var_15_3 = var_0_13(arg_15_0, arg_15_3, arg_15_1)
		end

		if var_15_1 then
			local var_15_5 = var_0_7(arg_15_1)

			var_15_0 = var_15_2 + var_15_4 + var_15_3 + var_0_5 * 2

			if arg_15_2 and var_15_5 then
				var_15_0 = var_15_0 + var_0_5
			end

			if arg_15_3 and var_15_5 then
				var_15_0 = var_15_0 + var_0_5
			end
		else
			var_15_0 = var_15_2 + var_15_4 + var_15_3
		end
	end

	return var_15_0
end

local function var_0_19(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.button_ref
	local var_16_1 = arg_16_1.button_ref2
	local var_16_2 = var_0_18(arg_16_0, arg_16_1, var_16_0, var_16_1)
	local var_16_3 = var_0_9(arg_16_0, arg_16_1)

	arg_16_1.primaryRef = var_0_10(arg_16_1)

	if arg_16_1.useTextButtons == nil then
		arg_16_1.useTextButtons = false
	end

	local var_16_4 = LUI.UIButton.new()

	if arg_16_1.container then
		local var_16_5 = arg_16_1.container:GetCurrentAnchorsAndPositions()
		local var_16_6 = (var_16_5.right - var_16_5.left) / 2

		if arg_16_1.containerAlignment == LUI.Alignment.Right then
			var_16_4:SetAnchorsAndPosition(1, 0, 0, 0, -var_16_2, 0, 0, 0)
		elseif arg_16_1.containerAlignment == LUI.Alignment.Center then
			var_16_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, var_16_6 - var_16_2 / 2, var_16_6 + var_16_2 / 2, 0, 0)
		else
			var_16_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_16_2, 0, 0)
		end
	else
		var_16_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_16_2, 0, 0)
	end

	var_16_4.id = arg_16_1.primaryRef
	var_16_4.data = arg_16_1
	var_16_4.m_requireFocusType = FocusType.MouseOver
	var_16_4.ref = arg_16_1.primaryRef
	var_16_4.hasTwoButtons = arg_16_1.button_ref and arg_16_1.button_ref2
	var_16_4.blockKeyboardSound = true

	if var_16_3 then
		if not arg_16_1.ignoreButtonBackground then
			local var_16_7 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
				controllerIndex = arg_16_0
			})

			var_16_7.id = "ButtonBackground"

			var_16_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
			var_16_4:addElement(var_16_7)

			var_16_4.ButtonBackground = var_16_7
		end

		if var_16_0 then
			local var_16_8 = CoD.GetTextForButton(var_16_0)
			local var_16_9 = arg_16_1.helper_text

			if arg_16_1.kbmTooltipPromptOverload and arg_16_1.kbmTooltipPromptOverload ~= "" then
				var_16_8 = CoD.GetTextForButton(arg_16_1.kbmTooltipPromptOverload)
			end

			for iter_16_0, iter_16_1 in ipairs(LUI.ButtonHelperText.PROMPT_ORDER) do
				if iter_16_1 == var_16_0 then
					var_16_9 = var_0_8(Engine.CBEAHDFCFC(var_16_9))
				end
			end

			if var_16_9 == arg_16_1.helper_text then
				var_16_9 = ""
			end

			if var_16_8 then
				local var_16_10 = {
					{
						keyprompt_text = var_16_8,
						helper_text = var_16_9,
						button_ref = var_16_0,
						ignoreTooltipPrompt = arg_16_1.ignoreTooltipPrompt
					}
				}

				if not arg_16_1.ignoreTooltip then
					local var_16_11 = {
						promptsData = var_16_10
					}

					var_16_4:AddTooltipData(arg_16_0, var_16_11)
				end
			end
		end
	end

	var_16_4:registerEventHandler("button_action", SendButtonEvent)

	local var_16_12 = LUI.UIHorizontalList.new()

	if var_16_3 then
		var_16_12:SetAnchorsAndPosition(0, 0, 0, 0, var_0_5, 0, 0, 0)
	else
		var_16_12:SetAnchorsAndPosition(0, 0, 0, 0, var_0_15(arg_16_0, arg_16_1, var_16_0, var_16_1, var_16_2), var_16_2, 0, 0)
	end

	var_16_12:SetSpacing(var_0_5)

	var_16_12.id = "helperHorizontalList"

	if var_16_0 then
		local var_16_13 = var_0_16(arg_16_0, var_16_0, arg_16_1)

		if var_16_13 then
			var_16_13:SetRGBFromTable(var_0_6)
			var_16_12:addElement(var_16_13)
		end
	end

	var_16_12:addElement(var_0_17(arg_16_0, arg_16_1, var_16_4.hasTwoButtons))

	if var_16_1 then
		local var_16_14 = var_0_16(arg_16_0, var_16_1, arg_16_1)

		if var_16_14 then
			var_16_14:SetRGBFromTable(var_0_6)
			var_16_12:addElement(var_16_14)
		end
	end

	if var_16_12:getNumChildren() == 1 then
		var_16_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_16_12:SetAlignment(LUI.Alignment.Center)
	end

	var_16_4:addElement(var_16_12)

	if arg_16_1.priority then
		var_16_4:setPriority(arg_16_1.priority)
	end

	if not arg_16_1.clickable then
		var_16_4:SetFocusable(false)
		var_16_4:SetHandleMouseButton(false)
	end

	return var_16_4
end

local function var_0_20(arg_17_0)
	local var_17_0 = 75
	local var_17_1 = -75
	local var_17_2 = LUI.UIElement.new()

	var_17_2:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 5, 26)

	var_17_2.id = "buttonHelperListContainer"
	arg_17_0._buttonHelperLists = {}

	local var_17_3 = LUI.UIHorizontalList.new()

	var_17_3:SetLeft(var_17_0)
	var_17_3:SetAlignment(LUI.Alignment.Left)
	var_17_3:SetSpacing(var_0_1)

	var_17_3.id = "buttonHelperLeftList"
	var_17_3.side = "left"

	var_17_2:addElement(var_17_3)

	var_17_2.buttonHelperLeftList = var_17_3
	arg_17_0._buttonHelperLists.left = var_17_3

	local var_17_4 = LUI.UIHorizontalList.new()

	var_17_4:SetRight(var_17_1)
	var_17_4:SetAlignment(LUI.Alignment.Right)
	var_17_4:SetSpacing(var_0_1)

	var_17_4.id = "buttonHelperRightList"
	var_17_4.side = "right"

	var_17_2:addElement(var_17_4)

	var_17_2.buttonHelperRightList = var_17_4
	arg_17_0._buttonHelperLists.right = var_17_4

	local var_17_5 = LUI.UIHorizontalList.new()

	var_17_5:SetLeft(var_17_0)
	var_17_5:SetRight(var_17_1)
	var_17_5:SetAlignment(LUI.Alignment.Center)
	var_17_5:SetSpacing(var_0_1)

	var_17_5.id = "buttonHelperCenterList"
	var_17_5.side = "center"

	var_17_2:addElement(var_17_5)

	var_17_2.buttonHelperCenterList = var_17_5
	arg_17_0._buttonHelperLists.center = var_17_5

	if LUI.IsLastInputKeyboardMouse(arg_17_0._controllerIndex) then
		var_17_3:SetSpacing(var_0_2)
		var_17_5:SetSpacing(var_0_2)
		var_17_4:SetSpacing(var_0_2)
	end

	var_17_2:registerEventHandler("update_input_type", function(arg_18_0, arg_18_1)
		if LUI.IsLastInputKeyboardMouse(arg_18_1.controllerIndex) then
			arg_18_0.buttonHelperLeftList:SetSpacing(var_0_2)
			arg_18_0.buttonHelperCenterList:SetSpacing(var_0_2)
			arg_18_0.buttonHelperRightList:SetSpacing(var_0_2)
		else
			arg_18_0.buttonHelperLeftList:SetSpacing(var_0_1)
			arg_18_0.buttonHelperCenterList:SetSpacing(var_0_1)
			arg_18_0.buttonHelperRightList:SetSpacing(var_0_1)
		end
	end)

	return var_17_2
end

function LUI.ButtonHelperText.GetPromptByButtonRef(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in pairs(arg_19_0._buttonHelperLists) do
		local var_19_0 = iter_19_1:getFirstChild()

		while var_19_0 do
			if var_19_0.data.primaryRef == arg_19_1 then
				var_19_0.side = iter_19_1.side

				return var_19_0
			end

			var_19_0 = var_19_0:getNextSibling()
		end
	end
end

function LUI.ButtonHelperText.AddHelperListContainer(arg_20_0, arg_20_1)
	assert(arg_20_0._buttonHelperLists)
	assert(arg_20_1.id ~= "left" and arg_20_1.id ~= "right", "Custom button helper containers cannot be named \"left\" or \"right\". These are reserved")

	if arg_20_0._buttonHelperLists[arg_20_1.id] then
		return
	end

	arg_20_0._buttonHelperLists[arg_20_1.id] = arg_20_1
end

function LUI.ButtonHelperText.AttemptRemoveHelperListContainer(arg_21_0, arg_21_1)
	assert(arg_21_0._buttonHelperLists)
	assert(arg_21_1)

	local var_21_0

	if arg_21_0._promptStack and arg_21_0._promptStack[arg_21_1] and #arg_21_0._promptStack[arg_21_1] > 0 then
		var_21_0 = arg_21_0._promptStack[arg_21_1][#arg_21_0._promptStack[arg_21_1]].side
	end

	if var_21_0 == "left" or var_21_0 == "right" or var_21_0 == "center" or var_21_0 == nil then
		return
	end

	local var_21_1 = arg_21_0._buttonHelperLists[var_21_0]

	if not var_21_1 then
		return
	end

	if var_21_1:getFirstChild() then
		return
	end

	arg_21_0._buttonHelperLists[var_21_0] = nil
end

function LUI.ButtonHelperText.PushButtonPrompt(arg_22_0, arg_22_1)
	assert(arg_22_1.button_ref and #arg_22_1.button_ref > 0 or arg_22_1.button_ref2 and #arg_22_1.button_ref2 > 0)
	assert(arg_22_1.helper_text)

	arg_22_1.replaceTop = arg_22_1.replaceTop or false

	if arg_22_1.container then
		arg_22_0:AddHelperListContainer(arg_22_1.container)

		arg_22_1.side = arg_22_1.container.id
	end

	if arg_22_1.useTextButtons == nil then
		arg_22_1.useTextButtons = false
	end

	arg_22_1.side = arg_22_1.side or "left"

	if arg_22_1.clickable == nil then
		arg_22_1.clickable = true
	end

	local var_22_0 = var_0_10(arg_22_1)

	assert(ButtonMap[var_22_0])

	if not arg_22_0._promptStack[var_22_0] then
		arg_22_0._promptStack[var_22_0] = {}
	end

	local var_22_1 = arg_22_0.wasLastInputGamepad and not LUI.IsLastInputGamepad(arg_22_0._controllerIndex)

	arg_22_0.wasLastInputGamepad = LUI.IsLastInputGamepad(arg_22_0._controllerIndex)

	local var_22_2 = #arg_22_0._promptStack[var_22_0]

	if arg_22_1.helper_text == "" then
		DebugPrint("Push button helper debug: Helper text is empty! ")
		arg_22_0:RemoveButtonPrompt(var_22_0)

		return
	elseif var_22_2 > 0 then
		arg_22_1.primaryRef = var_0_10(arg_22_1)

		if LUI.AreTableContentsEqual(arg_22_1, arg_22_0._promptStack[var_22_0][var_22_2]) and not var_22_1 then
			return
		end

		if arg_22_1.replaceTop then
			arg_22_0:RemoveButtonPrompt(var_22_0)

			if arg_22_1.container then
				arg_22_0:AddHelperListContainer(arg_22_1.container)
			end
		else
			arg_22_0:CloseButtonPrompt(var_22_0)
		end
	end

	table.insert(arg_22_0._promptStack[var_22_0], arg_22_1)

	local var_22_3 = false

	if arg_22_1.force_display then
		var_22_3 = true
	elseif LUI.IsLastInputGamepad(arg_22_0._controllerIndex) then
		if not arg_22_1.kbm_only then
			var_22_3 = true
		end
	elseif not arg_22_1.gamepad_only and var_22_0 ~= "button_primary" then
		var_22_3 = true
	end

	if var_22_3 then
		arg_22_0._buttonHelperLists[arg_22_1.side]:addElement(var_0_19(arg_22_0._controllerIndex, arg_22_1))
	end
end

function LUI.ButtonHelperText.RemoveButtonPrompt(arg_23_0, arg_23_1)
	if arg_23_0._promptStack == nil or arg_23_1 == nil then
		return
	end

	if arg_23_0._promptStack[arg_23_1] == nil then
		return
	end

	arg_23_0:CloseButtonPrompt(arg_23_1)
	arg_23_0:AttemptRemoveHelperListContainer(arg_23_1)
	table.remove(arg_23_0._promptStack[arg_23_1])
end

function LUI.ButtonHelperText.CloseButtonPrompt(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:GetPromptByButtonRef(arg_24_1)

	if var_24_0 then
		var_24_0:processEvent({
			immediate = true,
			name = "lose_focus"
		})
		var_24_0:closeTree()
	end
end

function LUI.ButtonHelperText.RefreshButtonHelpers(arg_25_0, arg_25_1)
	arg_25_0._controllerIndex = arg_25_1.controllerIndex

	local var_25_0 = LUI.DeepCopy(arg_25_0._promptStack)

	for iter_25_0, iter_25_1 in pairs(arg_25_0._promptStack) do
		if #iter_25_1 > 0 then
			arg_25_0:RemoveButtonPrompt(iter_25_0)
		end
	end

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.PROMPT_ORDER) do
		if var_25_0[iter_25_3] then
			local var_25_1 = var_25_0[iter_25_3][#var_25_0[iter_25_3]]

			if var_25_1 then
				arg_25_0:PushButtonPrompt(var_25_1)
			end

			var_25_0[iter_25_3] = nil
		end
	end

	for iter_25_4, iter_25_5 in pairs(var_25_0) do
		if #iter_25_5 > 0 then
			local var_25_2 = iter_25_5[#iter_25_5]

			arg_25_0:PushButtonPrompt(var_25_2)
		end
	end
end

function LUI.ButtonHelperText.PopButtonPrompt(arg_26_0, arg_26_1)
	assert(arg_26_0._buttonHelperLists)

	local var_26_0 = var_0_10(arg_26_1)

	if not arg_26_0._promptStack[var_26_0] then
		DebugPrint("PopButtonPrompt: '" .. var_26_0 .. "' doesn't exist")

		return
	end

	arg_26_0:RemoveButtonPrompt(var_26_0)

	local var_26_1 = arg_26_0._promptStack[var_26_0]

	if var_26_1 and #var_26_1 > 0 then
		arg_26_0:PushButtonPrompt(var_26_1[#var_26_1])
	end
end

function LUI.ButtonHelperText.SetupFocusOnlyButtonPrompt(arg_27_0, arg_27_1, arg_27_2)
	arg_27_1:addEventHandler("gain_focus", function(arg_28_0, arg_28_1)
		arg_27_0:PushButtonPrompt(arg_27_2)
	end)
	arg_27_1:addEventHandler("lose_focus", function(arg_29_0, arg_29_1)
		if arg_29_0:isInFocus() then
			arg_27_0:PopButtonPrompt(arg_27_2)
		end
	end)
end

local function var_0_21(arg_30_0, arg_30_1)
	arg_30_0:SetupFocusOnlyButtonPrompt(arg_30_1.focusButton, arg_30_1)
end

function LUI.ButtonHelperText.init(arg_31_0, arg_31_1)
	assert(arg_31_1.controllerIndex)

	arg_31_0._controllerIndex = arg_31_1.controllerIndex

	LUI.ButtonHelperText.super.init(arg_31_0)
	arg_31_0:addElement(var_0_20(arg_31_0))
	arg_31_0:registerEventHandler("update_input_type", arg_31_0.RefreshButtonHelpers)
	arg_31_0:registerEventHandler("add_button_helper_text", arg_31_0.PushButtonPrompt)
	arg_31_0:registerEventHandler("remove_button_helper_text", arg_31_0.PopButtonPrompt)
	arg_31_0:registerEventHandler("setup_focus_only_button_prompt", var_0_21)

	arg_31_0._promptStack = {}
end
