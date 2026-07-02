module(..., package.seeall)

local function var_0_0(arg_1_0)
	return LUI.IsLastInputKeyboardMouse(arg_1_0) and "PromptsEnabledKBM" or "PromptsEnabled"
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1 ~= nil, "Usage: SeasonalEventPromptsGroup:SetPromptsEnabled( <isEnabled>, <controllerIndex> )")

	if arg_2_0.promptsEnabled ~= arg_2_1 then
		arg_2_0.promptsEnabled = arg_2_1

		arg_2_0.ButtonPromptContainer:SetMouseFocusBlocker(not arg_2_1)
		arg_2_0.ButtonPromptContainer:SetHandleMouse(arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, arg_2_0.promptsEnabled and var_0_0(arg_2_2) or "PromptsDisabled")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	assert(arg_3_1)
	arg_3_0.PromptLabel:setText(arg_3_2.prompt_text)

	arg_3_2.container = arg_3_0.ButtonPromptContainer

	arg_3_1:AddButtonPrompt(arg_3_2, arg_3_3)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.ButtonPromptContainer.id .. "_" .. tostring(arg_4_0.ButtonPromptContainer)

	arg_4_0.ButtonPromptContainer.id = var_4_0
	arg_4_0.SetupPromptsData = var_0_2
	arg_4_0.SetPromptsEnabled = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	arg_4_0.shouldShowBacking = false

	ACTIONS.AnimateSequence(arg_4_0, "HideBacking")
	arg_4_0:registerAndCallEventHandler("update_input_type", function(arg_5_0, arg_5_1)
		if arg_5_0.shouldShowBacking then
			ACTIONS.AnimateSequence(arg_5_0, "ShowBacking")
		else
			ACTIONS.AnimateSequence(arg_5_0, "HideBacking")
		end

		if arg_5_0.promptsEnabled then
			ACTIONS.AnimateSequence(arg_5_0, var_0_0(arg_5_1.controllerIndex))
		end
	end, {
		element = arg_4_0,
		controllerIndex = arg_4_1
	})
end

function SeasonalEventPromptsGroup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 50 * _1080p)

	var_6_0.id = "SeasonalEventPromptsGroup"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Backing"

	var_6_4:SetAlpha(0, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 50)
	var_6_0:addElement(var_6_4)

	var_6_0.Backing = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "PromptLabel"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_6:SetAlpha(0, 0)
	var_6_6:setText("PromptLabel", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 11, _1080p * -11)
	var_6_0:addElement(var_6_6)

	var_6_0.PromptLabel = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "ButtonPromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_6_8.Label:setText("ButtonPrompt", 0)
	end

	var_6_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_8)

	var_6_0.ButtonPromptContainer = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10
	local var_6_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("PromptsEnabled", var_6_11)

	local var_6_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("PromptsEnabled", var_6_12)

	local function var_6_13()
		var_6_6:AnimateSequence("PromptsEnabled")
		var_6_8:AnimateSequence("PromptsEnabled")
	end

	var_6_0._sequences.PromptsEnabled = var_6_13

	local var_6_14
	local var_6_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("PromptsEnabledKBM", var_6_15)

	local var_6_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("PromptsEnabledKBM", var_6_16)

	local function var_6_17()
		var_6_6:AnimateSequence("PromptsEnabledKBM")
		var_6_8:AnimateSequence("PromptsEnabledKBM")
	end

	var_6_0._sequences.PromptsEnabledKBM = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_19)

	local function var_6_20()
		var_6_6:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_20

	local var_6_21
	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("PromptsDisabled", var_6_22)

	local var_6_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("PromptsDisabled", var_6_23)

	local function var_6_24()
		var_6_6:AnimateSequence("PromptsDisabled")
		var_6_8:AnimateSequence("PromptsDisabled")
	end

	var_6_0._sequences.PromptsDisabled = var_6_24

	local var_6_25
	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ShowBacking", var_6_26)

	local function var_6_27()
		var_6_4:AnimateSequence("ShowBacking")
	end

	var_6_0._sequences.ShowBacking = var_6_27

	local var_6_28
	local var_6_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("HideBacking", var_6_29)

	local function var_6_30()
		var_6_4:AnimateSequence("HideBacking")
	end

	var_6_0._sequences.HideBacking = var_6_30

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SeasonalEventPromptsGroup", SeasonalEventPromptsGroup)
LockTable(_M)
