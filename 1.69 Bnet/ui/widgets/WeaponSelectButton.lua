module(..., package.seeall)

function WeaponSelectButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 166 * _1080p)

	var_1_0.id = "WeaponSelectButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "BlurBackground"

	var_1_4:SetRGBFromInt(6710886, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetBlurStrength(2, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 26, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BlurBackground = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "Border"

	var_1_7:SetAlpha(0.2, 0)
	var_1_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 26, 0)
	var_1_0:addElement(var_1_7)

	var_1_0.Border = var_1_7

	local var_1_8
	local var_1_9 = LUI.UIStyledText.new()

	var_1_9.id = "WeaponClass"

	var_1_9:setText(ToUpperCase(""), 0)
	var_1_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_9:SetAlignment(LUI.Alignment.Left)
	var_1_9:SetStartupDelay(2000)
	var_1_9:SetLineHoldTime(400)
	var_1_9:SetAnimMoveTime(300)
	var_1_9:SetEndDelay(1500)
	var_1_9:SetCrossfadeTime(750)
	var_1_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_9:SetMaxVisibleLines(1)
	var_1_9:SetOutlineRGBFromInt(0, 0)
	var_1_9:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 5, _1080p * 173, _1080p * -27, _1080p * -5)
	var_1_0:addElement(var_1_9)

	var_1_0.WeaponClass = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIImage.new()

	var_1_11.id = "Image"

	var_1_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -113, _1080p * 113, _1080p * 38, _1080p * 151)
	var_1_0:addElement(var_1_11)

	var_1_0.Image = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIStyledText.new()

	var_1_13.id = "WeaponName"

	var_1_13:setText(ToUpperCase(""), 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_13:SetAlignment(LUI.Alignment.Left)
	var_1_13:SetStartupDelay(2000)
	var_1_13:SetLineHoldTime(400)
	var_1_13:SetAnimMoveTime(300)
	var_1_13:SetEndDelay(1500)
	var_1_13:SetCrossfadeTime(750)
	var_1_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_13:SetMaxVisibleLines(1)
	var_1_13:SetOutlineRGBFromInt(0, 0)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 173, _1080p * 31, _1080p * 53)
	var_1_0:addElement(var_1_13)

	var_1_0.WeaponName = var_1_13

	local var_1_14
	local var_1_15 = LUI.UIStyledText.new()

	var_1_15.id = "WeaponLevel"

	var_1_15:setText(ToUpperCase(""), 0)
	var_1_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_15:SetAlignment(LUI.Alignment.Right)
	var_1_15:SetStartupDelay(2000)
	var_1_15:SetLineHoldTime(400)
	var_1_15:SetAnimMoveTime(300)
	var_1_15:SetEndDelay(1500)
	var_1_15:SetCrossfadeTime(750)
	var_1_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_15:SetMaxVisibleLines(1)
	var_1_15:SetOutlineRGBFromInt(0, 0)
	var_1_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -173, _1080p * -5, _1080p * -27, _1080p * -5)
	var_1_0:addElement(var_1_15)

	var_1_0.WeaponLevel = var_1_15

	local var_1_16
	local var_1_17 = LUI.UIStyledText.new()

	var_1_17.id = "WeaponAndCamo"

	var_1_17:setText("WEAPON", 0)
	var_1_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_17:SetAlignment(LUI.Alignment.Left)
	var_1_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_1_0:addElement(var_1_17)

	var_1_0.WeaponAndCamo = var_1_17

	local function var_1_18()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_18

	local var_1_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonOver", var_1_20)

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_1_17:RegisterAnimationSequence("ButtonOver", var_1_21)

	local function var_1_22()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_7:AnimateSequence("ButtonOver")
		var_1_17:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_22

	local var_1_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_23)

	local var_1_24 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonUp", var_1_24)

	local var_1_25 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_17:RegisterAnimationSequence("ButtonUp", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_7:AnimateSequence("ButtonUp")
		var_1_17:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_26

	local var_1_27 = {
		{
			value = 11711405,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("NewNotification", var_1_27)

	local function var_1_28()
		var_1_9:AnimateSequence("NewNotification")
	end

	var_1_0._sequences.NewNotification = var_1_28

	var_1_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)

	return var_1_0
end

MenuBuilder.registerType("WeaponSelectButton", WeaponSelectButton)
LockTable(_M)
