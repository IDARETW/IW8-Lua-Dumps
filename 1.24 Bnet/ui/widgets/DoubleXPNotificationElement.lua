module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	ACTIONS.AnimateSequence(arg_1_0, "ShowTimer")

	if arg_1_1 and arg_1_1 - arg_1_3 > 0 then
		arg_1_0.TimerText:setText(Engine.JCBDICCAH(Engine.BJCFFHAIFA(arg_1_1 - arg_1_3)))
	elseif arg_1_2 and arg_1_2 - arg_1_3 > 0 then
		arg_1_0.TimerText:setText(Engine.JCBDICCAH(Engine.BJCFFHAIFA(arg_1_2 - arg_1_3)))
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideTimer")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTimer = var_0_0
end

function DoubleXPNotificationElement(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 90 * _1080p)

	var_3_0.id = "DoubleXPNotificationElement"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Image"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, 0, _1080p * 64)
	var_3_0:addElement(var_3_4)

	var_3_0.Image = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "TimerText"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 68, _1080p * 86)
	var_3_0:addElement(var_3_6)

	var_3_0.TimerText = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 77
		}
	}

	var_3_4:RegisterAnimationSequence("HideTimer", var_3_9)

	local var_3_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("HideTimer", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("HideTimer")
		var_3_6:AnimateSequence("HideTimer")
	end

	var_3_0._sequences.HideTimer = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_3_4:RegisterAnimationSequence("ShowTimer", var_3_13)

	local var_3_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowTimer", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("ShowTimer")
		var_3_6:AnimateSequence("ShowTimer")
	end

	var_3_0._sequences.ShowTimer = var_3_15

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("DoubleXPNotificationElement", DoubleXPNotificationElement)
LockTable(_M)
