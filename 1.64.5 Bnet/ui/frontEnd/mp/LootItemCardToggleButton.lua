module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.TogglePromptButton then
		arg_1_0.TogglePromptButton:SetMouseFocusBlocker(not arg_1_1)

		if arg_1_1 then
			arg_1_0.TogglePromptButton:AddTooltipData(arg_1_0._controllerIndex, {
				promptsData = {
					{
						kbmTooltipPromptOverload = "button_dpad_down",
						button_ref = "button_dpad_down",
						helper_text = Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_BUTTON")
					}
				}
			})
		else
			arg_1_0.TogglePromptButton:RemoveToolTipData()
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = false

	if LUI.IsLastInputKeyboardMouse(arg_2_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_2_0, "ShowKBMPrompt")

		var_2_0 = true
	else
		ACTIONS.AnimateSequence(arg_2_0, "ShowGamepadPrompt")
	end

	var_0_0(arg_2_0, var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1

	arg_3_0:registerAndCallEventHandler("update_input_type", var_0_1)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	arg_3_0.TogglePromptButton.Background:Setup9SliceImageForSmallUse()
end

function LootItemCardToggleButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 120 * _1080p, 0, 38 * _1080p)

	var_4_0.id = "LootItemCardToggleButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "TogglePromptButton"
	var_4_4.buttonDescription = Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_BUTTON")

	var_4_4.Text:SetLeft(_1080p * 20, 0)
	var_4_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_BUTTON")), 0)
	var_4_4.Text:SetAlignment(LUI.Alignment.Center)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.TogglePromptButton = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "TogglePromptText"

	var_4_6:setText(Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_ITEM"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -60, _1080p * 60, 0, _1080p * 23)
	var_4_0:addElement(var_4_6)

	var_4_0.TogglePromptText = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_9)

	local function var_4_10()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_10

	local var_4_11
	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowGamepadPrompt", var_4_12)

	local var_4_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ShowGamepadPrompt", var_4_13)

	local function var_4_14()
		var_4_4:AnimateSequence("ShowGamepadPrompt")
		var_4_6:AnimateSequence("ShowGamepadPrompt")
	end

	var_4_0._sequences.ShowGamepadPrompt = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowKBMPrompt", var_4_16)

	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ShowKBMPrompt", var_4_17)

	local function var_4_18()
		var_4_4:AnimateSequence("ShowKBMPrompt")
		var_4_6:AnimateSequence("ShowKBMPrompt")
	end

	var_4_0._sequences.ShowKBMPrompt = var_4_18

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LootItemCardToggleButton", LootItemCardToggleButton)
LockTable(_M)
