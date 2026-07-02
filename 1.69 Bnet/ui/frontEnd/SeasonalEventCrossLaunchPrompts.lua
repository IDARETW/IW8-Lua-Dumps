module(..., package.seeall)

local function var_0_0(arg_1_0)
	return LUI.IsLastInputKeyboardMouse(arg_1_0) and "PromptsKBM" or "PromptsGamepad"
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._promptsEnabled = true

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	arg_2_0.CWLaunchPrompt:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/BLACK_OPS_FREE_TRIAL_PROMPT")))
	LAYOUT.SizeTextBackingSizeToText(arg_2_0, {
		padding = 10,
		textfield = arg_2_0.CWLaunchPrompt,
		textfieldBackingImage = arg_2_0.Backing
	})
	arg_2_0:registerAndCallEventHandler("update_input_type", function(arg_3_0, arg_3_1)
		if arg_3_0._gameSource == LUI.GAME_SOURCE_ID.COLD_WAR and Dvar.IBEGCHEFE("RONTRKPRP") == true and not LUI.IsLastInputKeyboardMouse(arg_3_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_3_0, "ShowBacking")
		else
			ACTIONS.AnimateSequence(arg_3_0, "HideBacking")
		end

		ACTIONS.AnimateSequence(arg_3_0, var_0_0(arg_3_1.controllerIndex))
	end, {
		element = arg_2_0,
		controllerIndex = arg_2_1
	})
end

function SeasonalEventCrossLaunchPrompts(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 50 * _1080p)

	var_4_0.id = "SeasonalEventCrossLaunchPrompts"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backing"

	var_4_4:SetAlpha(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 50)
	var_4_0:addElement(var_4_4)

	var_4_0.Backing = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "CWLaunchPrompt"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/CROSS_LAUNCH_PROMPT_BLACK_OPS_MP"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 10, _1080p * 38)
	var_4_0:addElement(var_4_6)

	var_4_0.CWLaunchPrompt = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ButtonPromptContainerCWLaunch"

	if CONDITIONS.AlwaysFalse(var_4_0) then
		var_4_8.Label:setText("ButtonPrompt", 0)
	end

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 50)
	var_4_0:addElement(var_4_8)

	var_4_0.ButtonPromptContainerCWLaunch = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("PromptsGamepad", var_4_11)

	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("PromptsGamepad", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("PromptsGamepad")
		var_4_8:AnimateSequence("PromptsGamepad")
	end

	var_4_0._sequences.PromptsGamepad = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("PromptsKBM", var_4_15)

	local var_4_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("PromptsKBM", var_4_16)

	local function var_4_17()
		var_4_6:AnimateSequence("PromptsKBM")
		var_4_8:AnimateSequence("PromptsKBM")
	end

	var_4_0._sequences.PromptsKBM = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_19)

	local function var_4_20()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowBacking", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("ShowBacking")
	end

	var_4_0._sequences.ShowBacking = var_4_23

	local var_4_24
	local var_4_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("HideBacking", var_4_25)

	local function var_4_26()
		var_4_4:AnimateSequence("HideBacking")
	end

	var_4_0._sequences.HideBacking = var_4_26

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonalEventCrossLaunchPrompts", SeasonalEventCrossLaunchPrompts)
LockTable(_M)
