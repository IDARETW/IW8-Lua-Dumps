module(..., package.seeall)

function TokenButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "TokenButton"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Background"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "TimerText"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_6:SetAlpha(0.5, 0)
	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 87, _1080p * 416, 0, _1080p * 22)
	var_1_0:addElement(var_1_6)

	var_1_0.TimerText = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Text"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(2000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(2000)
	var_1_8:SetAnimMoveSpeed(150)
	var_1_8:SetEndDelay(2000)
	var_1_8:SetCrossfadeTime(1000)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 87, _1080p * 365, _1080p * -29, _1080p * -1)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "NumberCount"

	var_1_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_10:SetAlpha(0.5, 0)
	var_1_10:setText("x999", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_10:SetWordWrap(false)
	var_1_10:SetAlignment(LUI.Alignment.Right)
	var_1_10:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 365, _1080p * 416, _1080p * -26, _1080p * -4)
	var_1_0:addElement(var_1_10)

	var_1_0.NumberCount = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "TokenImage"

	var_1_12:SetAlpha(0.5, 0)
	var_1_12:setImage(RegisterMaterial("icon_double_xp_token"), 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 78, _1080p * -38, _1080p * 34)
	var_1_0:addElement(var_1_12)

	var_1_0.TokenImage = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "Lock"

	var_1_14:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_1_14:SetAlpha(0, 0)
	var_1_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 175, _1080p * 205, _1080p * 4, _1080p * 34)
	var_1_0:addElement(var_1_14)

	var_1_0.Lock = var_1_14

	local function var_1_15()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_15

	local var_1_16 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_16)

	local var_1_17 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_17)

	local var_1_18 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_18)

	local var_1_19 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonOver", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonOver", var_1_20)

	local function var_1_21()
		var_1_6:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
		var_1_12:AnimateSequence("ButtonOver")
		var_1_14:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_21

	local var_1_22 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_22)

	local var_1_23 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_23)

	local var_1_24 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUp", var_1_24)

	local var_1_25 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUp", var_1_25)

	local var_1_26 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonUp", var_1_26)

	local function var_1_27()
		var_1_6:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
		var_1_10:AnimateSequence("ButtonUp")
		var_1_12:AnimateSequence("ButtonUp")
		var_1_14:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_27

	local var_1_28 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOverDisabled", var_1_28)

	local var_1_29 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOverDisabled", var_1_29)

	local var_1_30 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOverDisabled", var_1_30)

	local var_1_31 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonOverDisabled", var_1_31)

	local var_1_32 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonOverDisabled", var_1_32)

	local function var_1_33()
		var_1_6:AnimateSequence("ButtonOverDisabled")
		var_1_8:AnimateSequence("ButtonOverDisabled")
		var_1_10:AnimateSequence("ButtonOverDisabled")
		var_1_12:AnimateSequence("ButtonOverDisabled")
		var_1_14:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_33

	local var_1_34 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUpDisabled", var_1_34)

	local var_1_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpDisabled", var_1_35)

	local var_1_36 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUpDisabled", var_1_36)

	local var_1_37 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUpDisabled", var_1_37)

	local var_1_38 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonUpDisabled", var_1_38)

	local function var_1_39()
		var_1_6:AnimateSequence("ButtonUpDisabled")
		var_1_8:AnimateSequence("ButtonUpDisabled")
		var_1_10:AnimateSequence("ButtonUpDisabled")
		var_1_12:AnimateSequence("ButtonUpDisabled")
		var_1_14:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_39

	local var_1_40 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonDisabled", var_1_40)

	local var_1_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonDisabled", var_1_41)

	local var_1_42 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonDisabled", var_1_42)

	local var_1_43 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonDisabled", var_1_43)

	local var_1_44 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonDisabled", var_1_44)

	local function var_1_45()
		var_1_6:AnimateSequence("ButtonDisabled")
		var_1_8:AnimateSequence("ButtonDisabled")
		var_1_10:AnimateSequence("ButtonDisabled")
		var_1_12:AnimateSequence("ButtonDisabled")
		var_1_14:AnimateSequence("ButtonDisabled")
	end

	var_1_0._sequences.ButtonDisabled = var_1_45

	var_1_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonDisabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOverDisabled")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUpDisabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("TokenButton", TokenButton)
LockTable(_M)
