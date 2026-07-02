module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		assert(arg_2_0.Description)

		if arg_2_1.text then
			local var_2_0 = arg_2_1.text

			arg_2_0.Description:SetAlpha(1)

			if arg_2_1.text ~= arg_2_0.Description:getText() then
				arg_2_0.Description:setText(var_2_0)

				if not arg_2_1.onlyText and not IsLanguageArabic() then
					ACTIONS.AnimateSequence(arg_2_0, "Update")
				end
			end
		end
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	arg_1_0:addEventHandler("update_button_description", var_1_0)
end

function ButtonDescriptionText(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "ButtonDescriptionText"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "Description"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_4:setText(ToUpperCase(""), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetDecodeUpdatesPerLetter(4)
	var_3_4:SetDecodeUseSystemTime(false)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 22)
	var_3_0:addElement(var_3_4)

	var_3_0.Description = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Update", var_3_6)

	local function var_3_7()
		var_3_4:AnimateSequence("Update")
	end

	var_3_0._sequences.Update = var_3_7

	local var_3_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Default", var_3_8)

	local function var_3_9()
		var_3_4:AnimateSequence("Default")
	end

	var_3_0._sequences.Default = var_3_9

	local var_3_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_4:RegisterAnimationSequence("BlackText", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("BlackText")
	end

	var_3_0._sequences.BlackText = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 368
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_13

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ButtonDescriptionText", ButtonDescriptionText)
LockTable(_M)
