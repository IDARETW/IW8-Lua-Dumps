LUI.ButtonHelperTextTooltip = LUI.Class(LUI.UIElement)

local var_0_0 = 5
local var_0_1 = 7

local function var_0_2(arg_1_0)
	return arg_1_0.button_ref
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2.keyprompt_text

	if arg_2_2.kbmTooltipPromptOverload then
		var_2_0 = CoD.GetTextForButton(arg_2_2.kbmTooltipPromptOverload)
	end

	if var_2_0 ~= nil and var_2_0 ~= "" then
		local var_2_1 = StripColorMarkers(var_2_0)
		local var_2_2 = MenuBuilder.BuildRegisteredType("KBMButtonWithProgress", {
			controllerIndex = arg_2_0,
			finalPromptText = var_2_1
		})

		assert(var_2_2.KeyString)
		var_2_2:SetPromptText(var_2_1)

		var_2_2.id = var_2_0 .. "KBMButtonPrompt"

		local var_2_3 = var_2_2:GetCurrentAnchorsAndPositions()
		local var_2_4 = math.abs(var_2_3.right - var_2_3.left)

		var_2_2:SetPressAnimation()

		var_2_2.KeyString._scoped = {}
		var_2_2.KeyString._scoped.exclusiveController = arg_2_0
		var_2_2.KeyString._scoped.isControllerExclusive = true

		return var_2_2, var_2_4
	end

	return nil, 0
end

local function var_0_4(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.helper_text

	if var_3_0 ~= nil and var_3_0 ~= "" then
		local var_3_1 = LUI.UIText.new()

		var_3_1:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, 0, -var_0_1, var_0_1)
		var_3_1:SetAlignment(bothButtonRef and LUI.Alignment.Center or LUI.Alignment.Left)
		var_3_1:SetRGBFromTable(COLORS.white)
		var_3_1:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

		var_3_1.id = "promptText" .. arg_3_1.primaryRef
		var_3_1.ref = arg_3_1.primaryRef

		var_3_1:setText(arg_3_1.helper_text)
		var_3_1:SetOptOutRightToLeftAlignmentFlip(true)
		var_3_1:SetWordWrap(false)

		local var_3_2 = LAYOUT.GetTextWidth(var_3_1)

		return var_3_1, var_3_2
	end

	return nil, 0
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = 2

	if arg_4_3 <= 0 or arg_4_2 <= 0 then
		var_4_0 = 1
	end

	return arg_4_2 + arg_4_3 + var_0_0 * var_4_0
end

function LUI.ButtonHelperTextTooltip.TooltipButtonPrompt(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.button_ref
	local var_5_1
	local var_5_2

	arg_5_1.primaryRef = var_0_2(arg_5_1)

	local var_5_3, var_5_4 = var_0_3(arg_5_0, var_5_0, arg_5_1)
	local var_5_5, var_5_6 = var_0_4(arg_5_0, arg_5_1)
	local var_5_7 = var_0_5(arg_5_0, arg_5_1, var_5_4, var_5_6)
	local var_5_8 = LUI.UIButton.new()

	var_5_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_5_7, 0, 0)

	var_5_8.id = arg_5_1.primaryRef
	var_5_8.data = arg_5_1
	var_5_8.ref = arg_5_1.primaryRef
	var_5_8.savedWidth = var_5_7

	local var_5_9 = LUI.UIHorizontalList.new()

	var_5_9:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_5_9:SetSpacing(var_0_0)

	var_5_9.id = "helperHorizontalList"

	if var_5_3 then
		var_5_9:addElement(var_5_3)
	end

	if var_5_5 then
		var_5_9:addElement(var_5_5)
	end

	var_5_8:addElement(var_5_9)

	return var_5_8
end

local function var_0_6(arg_6_0)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)

	var_6_0.id = "buttonHelperListContainer"

	local var_6_1 = LUI.UIHorizontalList.new()

	var_6_1:SetLeft(var_0_0)
	var_6_1:SetAlignment(LUI.Alignment.Left)
	var_6_1:SetSpacing(var_0_0)

	var_6_1.id = "buttonHelperLeftList"

	var_6_1:SetAdjustSizeToContent(true)
	var_6_0:addElement(var_6_1)

	arg_6_0._promptList = var_6_1

	return var_6_0
end

function LUI.ButtonHelperTextTooltip.GetPromptByButtonRef(arg_7_0, arg_7_1)
	assert(arg_7_0._promptList)

	local var_7_0 = {
		arg_7_0._promptList
	}

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = iter_7_1:getFirstChild()

		while var_7_1 do
			if var_7_1.data.primaryRef == arg_7_1 then
				return var_7_1
			end

			var_7_1 = var_7_1:getNextSibling()
		end
	end
end

function LUI.ButtonHelperTextTooltip.PushTooltipButtonPrompt(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_1.button_ref and #arg_8_1.button_ref > 0)
	assert(arg_8_1.helper_text)

	local var_8_0 = var_0_2(arg_8_1)

	assert(ButtonMap[var_8_0])

	if not arg_8_0._promptStack[var_8_0] then
		arg_8_0._promptStack[var_8_0] = {}
	end

	local var_8_1 = #arg_8_0._promptStack[var_8_0]

	if var_8_1 > 0 then
		if LUI.AreTableContentsEqual(arg_8_1, arg_8_0._promptStack[var_8_0][var_8_1]) then
			return
		end

		arg_8_0:CloseButtonPrompt(var_8_0)
	end

	table.insert(arg_8_0._promptStack[var_8_0], arg_8_1)
	arg_8_0._promptList:addElement(LUI.ButtonHelperTextTooltip.TooltipButtonPrompt(arg_8_0._controllerIndex, arg_8_1))
end

function LUI.ButtonHelperTextTooltip.GetTooltipPromptsTotalWidth(arg_9_0)
	assert(arg_9_0._promptList)

	local var_9_0 = arg_9_0._promptList:getFirstChild()
	local var_9_1 = 0
	local var_9_2 = 0

	while var_9_0 do
		if var_9_0.savedWidth then
			var_9_1 = var_9_1 + var_9_0.savedWidth
			var_9_2 = var_9_2 + 1
		end

		var_9_0 = var_9_0:getNextSibling()
	end

	local var_9_3 = var_9_2

	if var_9_2 > 1 then
		var_9_3 = var_9_3 + 1
	end

	return var_9_1 + var_0_0 * var_9_3
end

function LUI.ButtonHelperTextTooltip.TryRemoveAllButtonPrompts(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0._promptStack) do
		if #iter_10_1 > 0 then
			arg_10_0:RemoveButtonPrompt(iter_10_0)
		end
	end
end

function LUI.ButtonHelperTextTooltip.RemoveButtonPrompt(arg_11_0, arg_11_1)
	arg_11_0:CloseButtonPrompt(arg_11_1)
	assert(arg_11_0._promptStack[arg_11_1], "Attempting to remove a button prompt that doesn't exist.")
	table.remove(arg_11_0._promptStack[arg_11_1])
end

function LUI.ButtonHelperTextTooltip.CloseButtonPrompt(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:GetPromptByButtonRef(arg_12_1)

	if var_12_0 then
		var_12_0:closeTree()
	end
end

function LUI.ButtonHelperTextTooltip.RefreshButtonHelpers(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0._promptStack) do
		if #iter_13_1 > 0 then
			local var_13_0 = iter_13_1[#iter_13_1]

			arg_13_0:RemoveButtonPrompt(iter_13_0)
			arg_13_0:PushTooltipButtonPrompt(var_13_0)
		end
	end
end

function LUI.ButtonHelperTextTooltip.init(arg_14_0, arg_14_1)
	assert(arg_14_1.controllerIndex)

	arg_14_0._controllerIndex = arg_14_1.controllerIndex

	LUI.ButtonHelperTextTooltip.super.init(arg_14_0)
	arg_14_0:addElement(var_0_6(arg_14_0))
	arg_14_0:registerEventHandler("update_input_type", arg_14_0.RefreshButtonHelpers)

	arg_14_0._promptStack = {}
end
