module(..., package.seeall)

function GenericSelectionButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_1_0.id = "GenericSelectionButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

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
	local var_1_6 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Selected"

	var_1_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -55, _1080p * -27, _1080p * -14, _1080p * 14)
	var_1_0:addElement(var_1_6)

	var_1_0.Selected = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Text"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_8:setText(ToUpperCase(""), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(2000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(300)
	var_1_8:SetAnimMoveSpeed(50)
	var_1_8:SetEndDelay(1500)
	var_1_8:SetCrossfadeTime(750)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetOutlineRGBFromInt(0, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 20, _1080p * 332, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 216, _1080p * 259, _1080p * -21, _1080p * 21)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_12)

	local function var_1_13()
		var_1_8:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_13

	local var_1_14 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_14)

	local function var_1_15()
		var_1_8:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_15

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("Disabled", var_1_16)

	local var_1_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Disabled", var_1_17)

	local function var_1_18()
		var_1_8:AnimateSequence("Disabled")
		var_1_10:AnimateSequence("Disabled")
	end

	var_1_0._sequences.Disabled = var_1_18

	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("Enabled", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Enabled", var_1_20)

	local function var_1_21()
		var_1_8:AnimateSequence("Enabled")
		var_1_10:AnimateSequence("Enabled")
	end

	var_1_0._sequences.Enabled = var_1_21

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("AR", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_1_8:RegisterAnimationSequence("AR", var_1_23)

	local var_1_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_10:RegisterAnimationSequence("AR", var_1_24)

	local function var_1_25()
		var_1_6:AnimateSequence("AR")
		var_1_8:AnimateSequence("AR")
		var_1_10:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_25

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

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
	end)
	var_1_0:addEventHandler("enable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Enabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericSelectionButton", GenericSelectionButton)
LockTable(_M)
