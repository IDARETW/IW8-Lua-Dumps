module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

local function var_0_1(arg_2_0)
	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		var_0_0(arg_2_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		var_0_0(arg_2_0, "ButtonUp")
	end)
end

function SocialPlatformCheckbox(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 25 * _1080p)

	var_5_0.id = "SocialPlatformCheckbox"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Checkbox"

	var_5_4.Fill:SetRGBFromInt(16777215, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 25, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Checkbox = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "Text"

	var_5_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetWordWrap(false)
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 36, _1080p * 150, _1080p * -8.5, _1080p * 9.5)
	var_5_0:addElement(var_5_6)

	var_5_0.Text = var_5_6

	local function var_5_7()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_7

	local var_5_8 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_8)

	local function var_5_9()
		var_5_6:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_9

	local var_5_10 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_10)

	local function var_5_11()
		var_5_6:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_11

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SocialPlatformCheckbox", SocialPlatformCheckbox)
LockTable(_M)
