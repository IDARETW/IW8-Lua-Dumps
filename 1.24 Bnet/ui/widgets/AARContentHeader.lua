module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function AARContentHeader(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p)

	var_2_0.id = "AARContentHeader"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Divider"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Divider = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(2000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(2000)
	var_2_6:SetAnimMoveSpeed(150)
	var_2_6:SetEndDelay(2000)
	var_2_6:SetCrossfadeTime(1000)
	var_2_6:SetFadeInTime(300)
	var_2_6:SetFadeOutTime(300)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, 0, _1080p * 10, _1080p * 40)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local function var_2_8()
		return
	end

	var_2_0._sequences.Intro = var_2_8

	local var_2_9
	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonOver", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_11)

	local function var_2_12()
		var_2_4:AnimateSequence("ButtonOver")
		var_2_6:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_12

	local var_2_13
	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.headerBoarder
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonUp", var_2_14)

	local var_2_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.header
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_15)

	local function var_2_16()
		var_2_4:AnimateSequence("ButtonUp")
		var_2_6:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_16

	local var_2_17
	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_18)

	local function var_2_19()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_19

	local var_2_20
	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_right_to_left")
		}
	}

	var_2_4:RegisterAnimationSequence("RightAligned", var_2_21)

	local var_2_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_2_6:RegisterAnimationSequence("RightAligned", var_2_22)

	local function var_2_23()
		var_2_4:AnimateSequence("RightAligned")
		var_2_6:AnimateSequence("RightAligned")
	end

	var_2_0._sequences.RightAligned = var_2_23

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("AARContentHeader", AARContentHeader)
LockTable(_M)
