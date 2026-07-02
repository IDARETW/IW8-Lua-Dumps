module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

function PostLoadFunc(arg_2_0)
	arg_2_0:SetHandleMouse(true)
	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		var_0_0(arg_2_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		var_0_0(arg_2_0, "ButtonUp")
	end)
	arg_2_0:SetNotifyOnLayoutInit(true)
	arg_2_0:registerEventHandler("layout_initialized", function(arg_5_0)
		local var_5_0, var_5_1, var_5_2, var_5_3 = arg_5_0:getLocalRect()
		local var_5_4, var_5_5 = arg_5_0.Text:getElementTextDims()
		local var_5_6 = var_5_4 + _1080p * 26

		arg_5_0:SetAnchorsAndPosition(0, 1, 0, 1, var_5_0, var_5_6, var_5_1, var_5_3)
	end)
end

function GenericCheckBoxButtonWithLabel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 25 * _1080p)

	var_6_0.id = "GenericCheckBoxButtonWithLabel"
	var_6_0._animationSets = {}
	var_6_0._sequences = {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIStyledText.new()

	var_6_4.id = "Text"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_4:setText("", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_4:SetWordWrap(false)
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 28, _1080p * 200, _1080p * -8.5, _1080p * 9.5)
	var_6_0:addElement(var_6_4)

	var_6_0.Text = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Checkbox"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 24, _1080p * 2, _1080p * 24)
	var_6_0:addElement(var_6_6)

	var_6_0.Checkbox = var_6_6

	local function var_6_7()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_7

	local var_6_8 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonOver", var_6_8)

	local function var_6_9()
		var_6_4:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_9

	local var_6_10 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonUp", var_6_10)

	local function var_6_11()
		var_6_4:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_11

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericCheckBoxButtonWithLabel", GenericCheckBoxButtonWithLabel)
LockTable(_M)
