module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		arg_1_0.TextInfo:SetAlignment(LUI.Alignment.Left)
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function EquippedItemPanel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "EquippedItemPanel"
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

	var_2_4.id = "Image"

	var_2_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, 0, _1080p * -16, _1080p * 16)
	var_2_0:addElement(var_2_4)

	var_2_0.Image = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "TextInfo"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(1000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(350)
	var_2_6:SetAnimMoveSpeed(200)
	var_2_6:SetEndDelay(1600)
	var_2_6:SetCrossfadeTime(400)
	var_2_6:SetFadeInTime(300)
	var_2_6:SetFadeOutTime(300)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -160, _1080p * -37, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.TextInfo = var_2_6

	local var_2_7 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("DefaultSequence", var_2_7)

	local function var_2_8()
		var_2_6:AnimateSequence("DefaultSequence")
	end

	var_2_0._sequences.DefaultSequence = var_2_8

	local var_2_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Minimize", var_2_9)

	local function var_2_10()
		var_2_6:AnimateSequence("Minimize")
	end

	var_2_0._sequences.Minimize = var_2_10

	local var_2_11 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Maximize", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("Maximize")
	end

	var_2_0._sequences.Maximize = var_2_12

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_13)

	local function var_2_14()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_14

	var_0_0(var_2_0, var_2_1, arg_2_1)
	ACTIONS.AnimateSequence(var_2_0, "DefaultSequence")

	return var_2_0
end

MenuBuilder.registerType("EquippedItemPanel", EquippedItemPanel)
LockTable(_M)
