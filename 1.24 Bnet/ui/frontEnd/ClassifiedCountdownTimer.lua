module(..., package.seeall)

local var_0_0 = 1000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.Hour1,
		arg_1_0.Hour2
	}
	local var_1_1 = {
		arg_1_0.Minute1,
		arg_1_0.Minute2
	}
	local var_1_2 = {
		arg_1_0.Second1,
		arg_1_0.Second2
	}
	local var_1_3 = {
		"watch_digital_digit_0",
		"watch_digital_digit_1",
		"watch_digital_digit_2",
		"watch_digital_digit_3",
		"watch_digital_digit_4",
		"watch_digital_digit_5",
		"watch_digital_digit_6",
		"watch_digital_digit_7",
		"watch_digital_digit_8",
		"watch_digital_digit_9"
	}
	local var_1_4 = {}
	local var_1_5 = {}
	local var_1_6 = {}
	local var_1_7 = 0
	local var_1_8 = tonumber(Engine.DCJHCAFIIA())
	local var_1_9 = Dvar.CFHDGABACF("MNNTMPMOLK")

	if var_1_9 ~= 0 then
		if var_1_8 and var_1_8 > 0 and var_1_9 and var_1_9 > 0 then
			var_1_7 = var_1_9 - var_1_8
		end

		local function var_1_10(arg_2_0, arg_2_1, arg_2_2)
			local var_2_0
			local var_2_1
			local var_2_2 = tostring(arg_2_1)

			if #var_2_2 > 1 then
				var_2_0 = string.sub(var_2_2, 1, 1)
				var_2_1 = string.sub(var_2_2, 2, 2)

				arg_2_0[1]:setImage(RegisterMaterial(var_1_3[var_2_0 + 1]))
				arg_2_0[2]:setImage(RegisterMaterial(var_1_3[var_2_1 + 1]))
			else
				var_2_0 = 0
				var_2_1 = string.sub(var_2_2, 1, 1)

				arg_2_0[1]:setImage(RegisterMaterial(var_1_3[var_2_0 + 1]))
				arg_2_0[2]:setImage(RegisterMaterial(var_1_3[var_2_1 + 1]))
			end

			if arg_2_2[1] ~= var_1_3[var_2_0 + 1] or arg_2_2[2] ~= var_1_3[var_2_1 + 1] then
				arg_2_0[1]:SetRGBFromTable(COLORS.white)
				arg_2_0[1]:SetRGBFromTable(SWATCHES.genericButton.textFocus, 500, LUI.EASING.inQuadratic)
				arg_2_0[2]:SetRGBFromTable(COLORS.white)
				arg_2_0[2]:SetRGBFromTable(SWATCHES.genericButton.textFocus, 500, LUI.EASING.inQuadratic)
			end

			arg_2_2[1] = var_1_3[var_2_0 + 1]
			arg_2_2[2] = var_1_3[var_2_1 + 1]
		end

		local var_1_11

		local function var_1_12()
			var_1_7 = var_1_7 - 1

			if var_1_7 > 0 then
				ACTIONS.AnimateSequence(arg_1_0, "Timer")
				arg_1_0:SetGlitchAmount(0.01)

				local var_3_0 = var_1_7 / 3600
				local var_3_1 = math.floor(var_3_0)

				var_1_10(var_1_0, var_3_1, var_1_4)

				local var_3_2 = var_1_7 / 60 - var_3_1 * 60
				local var_3_3 = math.floor(var_3_2)

				var_1_10(var_1_1, var_3_3, var_1_5)

				local var_3_4 = var_3_2 * 60 - var_3_3 * 60
				local var_3_5 = math.floor(var_3_4)

				var_1_10(var_1_2, var_3_5, var_1_6)

				arg_1_0:Wait(var_0_0).onComplete = var_1_12
			else
				ACTIONS.AnimateSequence(arg_1_0, "TimerExpired")
				arg_1_0:SetGlitchAmount(0.01)
				arg_1_0.Transmission:SetDecodeParams(40, 1, 2)
				arg_1_0.Transmission:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INCOMING_TRANSMISSION")))
			end
		end

		var_1_12()
	else
		arg_1_0.Transmission:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED")))
		ACTIONS.AnimateSequence(arg_1_0, "Scrambled")
		arg_1_0:SetGlitchAmount(0.8)
		arg_1_0.Transmission:SetDecodeParams(40, 1, 2)
	end
end

function ClassifiedCountdownTimer(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 80 * _1080p)

	var_4_0.id = "ClassifiedCountdownTimer"
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

	var_4_4.id = "Hour1"

	var_4_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.9, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * -112, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_4)

	var_4_0.Hour1 = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Hour2"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_6:SetPixelGridEnabled(true)
	var_4_6:SetPixelGridContrast(0.9, 0)
	var_4_6:SetPixelGridBlockWidth(2, 0)
	var_4_6:SetPixelGridBlockHeight(2, 0)
	var_4_6:SetPixelGridGutterWidth(1, 0)
	var_4_6:SetPixelGridGutterHeight(1, 0)
	var_4_6:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -140, _1080p * -60, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_6)

	var_4_0.Hour2 = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Colon1"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_8:SetPixelGridEnabled(true)
	var_4_8:SetPixelGridContrast(0.9, 0)
	var_4_8:SetPixelGridBlockWidth(2, 0)
	var_4_8:SetPixelGridBlockHeight(2, 0)
	var_4_8:SetPixelGridGutterWidth(1, 0)
	var_4_8:SetPixelGridGutterHeight(1, 0)
	var_4_8:setImage(RegisterMaterial("watch_digital_digit_colon"), 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -74, _1080p * -54, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_8)

	var_4_0.Colon1 = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Minute1"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_10:SetPixelGridEnabled(true)
	var_4_10:SetPixelGridContrast(0.9, 0)
	var_4_10:SetPixelGridBlockWidth(2, 0)
	var_4_10:SetPixelGridBlockHeight(2, 0)
	var_4_10:SetPixelGridGutterWidth(1, 0)
	var_4_10:SetPixelGridGutterHeight(1, 0)
	var_4_10:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -66, _1080p * 14, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_10)

	var_4_0.Minute1 = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Minute2"

	var_4_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_12:SetPixelGridEnabled(true)
	var_4_12:SetPixelGridContrast(0.9, 0)
	var_4_12:SetPixelGridBlockWidth(2, 0)
	var_4_12:SetPixelGridBlockHeight(2, 0)
	var_4_12:SetPixelGridGutterWidth(1, 0)
	var_4_12:SetPixelGridGutterHeight(1, 0)
	var_4_12:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * 66, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_12)

	var_4_0.Minute2 = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "Second1"

	var_4_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_14:SetPixelGridEnabled(true)
	var_4_14:SetPixelGridContrast(0.9, 0)
	var_4_14:SetPixelGridBlockWidth(2, 0)
	var_4_14:SetPixelGridBlockHeight(2, 0)
	var_4_14:SetPixelGridGutterWidth(1, 0)
	var_4_14:SetPixelGridGutterHeight(1, 0)
	var_4_14:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 140, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_14)

	var_4_0.Second1 = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Second2"

	var_4_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_16:SetPixelGridEnabled(true)
	var_4_16:SetPixelGridContrast(0.9, 0)
	var_4_16:SetPixelGridBlockWidth(2, 0)
	var_4_16:SetPixelGridBlockHeight(2, 0)
	var_4_16:SetPixelGridGutterWidth(1, 0)
	var_4_16:SetPixelGridGutterHeight(1, 0)
	var_4_16:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 112, _1080p * 192, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_16)

	var_4_0.Second2 = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIImage.new()

	var_4_18.id = "Colon2"

	var_4_18:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_18:SetPixelGridEnabled(true)
	var_4_18:SetPixelGridContrast(0.9, 0)
	var_4_18:SetPixelGridBlockWidth(2, 0)
	var_4_18:SetPixelGridBlockHeight(2, 0)
	var_4_18:SetPixelGridGutterWidth(1, 0)
	var_4_18:SetPixelGridGutterHeight(1, 0)
	var_4_18:setImage(RegisterMaterial("watch_digital_digit_colon"), 0)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 74, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_18)

	var_4_0.Colon2 = var_4_18

	local var_4_19
	local var_4_20 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_4_21 = LUI.UIBorder.new(var_4_20)

	var_4_21.id = "TransmissionFrame"

	var_4_21:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_21:SetAlpha(0, 0)
	var_4_21:SetPixelGridEnabled(true)
	var_4_21:SetPixelGridContrast(0.5, 0)
	var_4_21:SetPixelGridBlockWidth(2, 0)
	var_4_21:SetPixelGridBlockHeight(2, 0)
	var_4_21:SetPixelGridGutterWidth(1, 0)
	var_4_21:SetPixelGridGutterHeight(1, 0)
	var_4_21:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_21:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_21:SetBorderThicknessTop(_1080p * 2, 0)
	var_4_21:SetBorderThicknessBottom(_1080p * 2, 0)
	var_4_21:SetAnchorsAndPosition(0.5, 0.5, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_21)

	var_4_0.TransmissionFrame = var_4_21

	local var_4_22
	local var_4_23 = LUI.UIStyledText.new()

	var_4_23.id = "Transmission"

	var_4_23:SetRGBFromInt(11776947, 0)
	var_4_23:SetAlpha(0, 0)
	var_4_23:SetPixelGridEnabled(true)
	var_4_23:SetPixelGridContrast(0.5, 0)
	var_4_23:SetPixelGridBlockWidth(2, 0)
	var_4_23:SetPixelGridBlockHeight(2, 0)
	var_4_23:SetPixelGridGutterWidth(1, 0)
	var_4_23:SetPixelGridGutterHeight(1, 0)
	var_4_23:setText("Incoming Transmission", 0)
	var_4_23:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_4_23:SetAlignment(LUI.Alignment.Center)
	var_4_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_23:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -16, _1080p * 20)
	var_4_0:addElement(var_4_23)

	var_4_0.Transmission = var_4_23

	local var_4_24
	local var_4_25 = LUI.UIImage.new()

	var_4_25.id = "Hour1Backer"

	var_4_25:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_25:SetAlpha(0.2, 0)
	var_4_25:SetPixelGridEnabled(true)
	var_4_25:SetPixelGridContrast(0.9, 0)
	var_4_25:SetPixelGridBlockWidth(2, 0)
	var_4_25:SetPixelGridBlockHeight(2, 0)
	var_4_25:SetPixelGridGutterWidth(1, 0)
	var_4_25:SetPixelGridGutterHeight(1, 0)
	var_4_25:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * -112, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_25)

	var_4_0.Hour1Backer = var_4_25

	local var_4_26
	local var_4_27 = LUI.UIImage.new()

	var_4_27.id = "Hour2Backer"

	var_4_27:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_27:SetAlpha(0.2, 0)
	var_4_27:SetPixelGridEnabled(true)
	var_4_27:SetPixelGridContrast(0.9, 0)
	var_4_27:SetPixelGridBlockWidth(2, 0)
	var_4_27:SetPixelGridBlockHeight(2, 0)
	var_4_27:SetPixelGridGutterWidth(1, 0)
	var_4_27:SetPixelGridGutterHeight(1, 0)
	var_4_27:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -140, _1080p * -60, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_27)

	var_4_0.Hour2Backer = var_4_27

	local var_4_28
	local var_4_29 = LUI.UIImage.new()

	var_4_29.id = "Minute1Backer"

	var_4_29:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_29:SetAlpha(0.2, 0)
	var_4_29:SetPixelGridEnabled(true)
	var_4_29:SetPixelGridContrast(0.9, 0)
	var_4_29:SetPixelGridBlockWidth(2, 0)
	var_4_29:SetPixelGridBlockHeight(2, 0)
	var_4_29:SetPixelGridGutterWidth(1, 0)
	var_4_29:SetPixelGridGutterHeight(1, 0)
	var_4_29:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -66, _1080p * 14, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_29)

	var_4_0.Minute1Backer = var_4_29

	local var_4_30
	local var_4_31 = LUI.UIImage.new()

	var_4_31.id = "Minute2Backer"

	var_4_31:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_31:SetAlpha(0.2, 0)
	var_4_31:SetPixelGridEnabled(true)
	var_4_31:SetPixelGridContrast(0.9, 0)
	var_4_31:SetPixelGridBlockWidth(2, 0)
	var_4_31:SetPixelGridBlockHeight(2, 0)
	var_4_31:SetPixelGridGutterWidth(1, 0)
	var_4_31:SetPixelGridGutterHeight(1, 0)
	var_4_31:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_31:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * 66, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_31)

	var_4_0.Minute2Backer = var_4_31

	local var_4_32
	local var_4_33 = LUI.UIImage.new()

	var_4_33.id = "Second1Backer"

	var_4_33:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_33:SetAlpha(0.2, 0)
	var_4_33:SetPixelGridEnabled(true)
	var_4_33:SetPixelGridContrast(0.9, 0)
	var_4_33:SetPixelGridBlockWidth(2, 0)
	var_4_33:SetPixelGridBlockHeight(2, 0)
	var_4_33:SetPixelGridGutterWidth(1, 0)
	var_4_33:SetPixelGridGutterHeight(1, 0)
	var_4_33:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 140, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_33)

	var_4_0.Second1Backer = var_4_33

	local var_4_34
	local var_4_35 = LUI.UIImage.new()

	var_4_35.id = "Second2Backer"

	var_4_35:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_35:SetAlpha(0.2, 0)
	var_4_35:SetPixelGridEnabled(true)
	var_4_35:SetPixelGridContrast(0.9, 0)
	var_4_35:SetPixelGridBlockWidth(2, 0)
	var_4_35:SetPixelGridBlockHeight(2, 0)
	var_4_35:SetPixelGridGutterWidth(1, 0)
	var_4_35:SetPixelGridGutterHeight(1, 0)
	var_4_35:setImage(RegisterMaterial("watch_digital_digit_0"), 0)
	var_4_35:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 112, _1080p * 192, _1080p * -40, _1080p * 40)
	var_4_0:addElement(var_4_35)

	var_4_0.Second2Backer = var_4_35

	local function var_4_36()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_36

	local var_4_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("TimerExpired", var_4_37)

	local var_4_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("TimerExpired", var_4_38)

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("TimerExpired", var_4_39)

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("TimerExpired", var_4_40)

	local var_4_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("TimerExpired", var_4_41)

	local var_4_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("TimerExpired", var_4_42)

	local var_4_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("TimerExpired", var_4_43)

	local var_4_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("TimerExpired", var_4_44)

	local var_4_45 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -175,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 175,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_21:RegisterAnimationSequence("TimerExpired", var_4_45)

	local var_4_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_4_23:RegisterAnimationSequence("TimerExpired", var_4_46)

	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("TimerExpired", var_4_47)

	local var_4_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_27:RegisterAnimationSequence("TimerExpired", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("TimerExpired", var_4_49)

	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_31:RegisterAnimationSequence("TimerExpired", var_4_50)

	local var_4_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("TimerExpired", var_4_51)

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("TimerExpired", var_4_52)

	local function var_4_53()
		var_4_4:AnimateLoop("TimerExpired")
		var_4_6:AnimateLoop("TimerExpired")
		var_4_8:AnimateLoop("TimerExpired")
		var_4_10:AnimateLoop("TimerExpired")
		var_4_12:AnimateLoop("TimerExpired")
		var_4_14:AnimateLoop("TimerExpired")
		var_4_16:AnimateLoop("TimerExpired")
		var_4_18:AnimateLoop("TimerExpired")
		var_4_21:AnimateLoop("TimerExpired")
		var_4_23:AnimateLoop("TimerExpired")
		var_4_25:AnimateLoop("TimerExpired")
		var_4_27:AnimateLoop("TimerExpired")
		var_4_29:AnimateLoop("TimerExpired")
		var_4_31:AnimateLoop("TimerExpired")
		var_4_33:AnimateLoop("TimerExpired")
		var_4_35:AnimateLoop("TimerExpired")
	end

	var_4_0._sequences.TimerExpired = var_4_53

	local var_4_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Timer", var_4_54)

	local var_4_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Timer", var_4_55)

	local var_4_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Timer", var_4_56)

	local var_4_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Timer", var_4_57)

	local var_4_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Timer", var_4_58)

	local var_4_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Timer", var_4_59)

	local var_4_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Timer", var_4_60)

	local var_4_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Timer", var_4_61)

	local var_4_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Timer", var_4_62)

	local var_4_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("Timer", var_4_63)

	local var_4_64 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("Timer", var_4_64)

	local var_4_65 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_27:RegisterAnimationSequence("Timer", var_4_65)

	local var_4_66 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("Timer", var_4_66)

	local var_4_67 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_31:RegisterAnimationSequence("Timer", var_4_67)

	local var_4_68 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Timer", var_4_68)

	local var_4_69 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Timer", var_4_69)

	local function var_4_70()
		var_4_4:AnimateSequence("Timer")
		var_4_6:AnimateSequence("Timer")
		var_4_8:AnimateSequence("Timer")
		var_4_10:AnimateSequence("Timer")
		var_4_12:AnimateSequence("Timer")
		var_4_14:AnimateSequence("Timer")
		var_4_16:AnimateSequence("Timer")
		var_4_18:AnimateSequence("Timer")
		var_4_21:AnimateSequence("Timer")
		var_4_23:AnimateSequence("Timer")
		var_4_25:AnimateSequence("Timer")
		var_4_27:AnimateSequence("Timer")
		var_4_29:AnimateSequence("Timer")
		var_4_31:AnimateSequence("Timer")
		var_4_33:AnimateSequence("Timer")
		var_4_35:AnimateSequence("Timer")
	end

	var_4_0._sequences.Timer = var_4_70

	local var_4_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Scrambled", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Scrambled", var_4_72)

	local var_4_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Scrambled", var_4_73)

	local var_4_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Scrambled", var_4_74)

	local var_4_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Scrambled", var_4_75)

	local var_4_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Scrambled", var_4_76)

	local var_4_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Scrambled", var_4_77)

	local var_4_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Scrambled", var_4_78)

	local var_4_79 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Scrambled", var_4_79)

	local var_4_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("Scrambled", var_4_80)

	local var_4_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("Scrambled", var_4_81)

	local var_4_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_27:RegisterAnimationSequence("Scrambled", var_4_82)

	local var_4_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("Scrambled", var_4_83)

	local var_4_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_31:RegisterAnimationSequence("Scrambled", var_4_84)

	local var_4_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Scrambled", var_4_85)

	local var_4_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Scrambled", var_4_86)

	local function var_4_87()
		var_4_4:AnimateSequence("Scrambled")
		var_4_6:AnimateSequence("Scrambled")
		var_4_8:AnimateSequence("Scrambled")
		var_4_10:AnimateSequence("Scrambled")
		var_4_12:AnimateSequence("Scrambled")
		var_4_14:AnimateSequence("Scrambled")
		var_4_16:AnimateSequence("Scrambled")
		var_4_18:AnimateSequence("Scrambled")
		var_4_21:AnimateSequence("Scrambled")
		var_4_23:AnimateSequence("Scrambled")
		var_4_25:AnimateSequence("Scrambled")
		var_4_27:AnimateSequence("Scrambled")
		var_4_29:AnimateSequence("Scrambled")
		var_4_31:AnimateSequence("Scrambled")
		var_4_33:AnimateSequence("Scrambled")
		var_4_35:AnimateSequence("Scrambled")
	end

	var_4_0._sequences.Scrambled = var_4_87

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClassifiedCountdownTimer", ClassifiedCountdownTimer)
LockTable(_M)
