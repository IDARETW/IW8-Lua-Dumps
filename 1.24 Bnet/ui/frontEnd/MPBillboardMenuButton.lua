module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -100, _1080p * 100, 200, LUI.EASING.outQuadratic)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -164, _1080p * 164, _1080p * -92, _1080p * 92, 100, LUI.EASING.outQuadratic)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.ScaleButtonUp = var_0_0
	arg_3_0.ScaleButtonDown = var_0_1

	arg_3_0:addEventHandler("lose_focus", function(arg_4_0, arg_4_1)
		if not LUI.IsLastInputMouseNavigation(arg_3_1) then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	if arg_3_0.NewItemNotification then
		arg_3_0.NewItemNotification.Highlight:SetRGBFromTable(SWATCHES.Store.NewItemTab)
		arg_3_0.NewItemNotification.Backer:SetRGBFromTable(SWATCHES.Store.NewItemBackground)
		arg_3_0.NewItemNotification:SetupRightAlignment()
	end
end

function MPBillboardMenuButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 328 * _1080p, 0, 184 * _1080p)

	var_5_0.id = "MPBillboardMenuButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "ItemImage"

	var_5_4:SetRGBFromInt(5066061, 0)
	var_5_4:SetScale(-0.25, 0)
	var_5_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -128, _1080p * 128)
	var_5_0:addElement(var_5_4)

	var_5_0.ItemImage = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Gradient"

	var_5_6:SetRGBFromInt(0, 0)
	var_5_6:SetAlpha(0.4, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -75, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Gradient = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Text"

	var_5_8:SetRGBFromTable(SWATCHES.Store.TextIdle, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetTracking(3 * _1080p, 0)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_8:SetStartupDelay(1000)
	var_5_8:SetLineHoldTime(400)
	var_5_8:SetAnimMoveTime(150)
	var_5_8:SetAnimMoveSpeed(50)
	var_5_8:SetEndDelay(1000)
	var_5_8:SetCrossfadeTime(400)
	var_5_8:SetFadeInTime(300)
	var_5_8:SetFadeOutTime(300)
	var_5_8:SetMaxVisibleLines(2)
	var_5_8:SetShadowRGBFromInt(0, 0)
	var_5_8:SetOutlineRGBFromInt(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -34, _1080p * -10)
	var_5_0:addElement(var_5_8)

	var_5_0.Text = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "HighlightBarBottom"

	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.HighlightBarBottom = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "NewItemNotification"

	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -88, _1080p * -10, _1080p * 10, _1080p * 40)
	var_5_0:addElement(var_5_12)

	var_5_0.NewItemNotification = var_5_12

	local function var_5_13()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_13

	local var_5_14 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_14)

	local var_5_15 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_15)

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_16)

	local var_5_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_17)

	local function var_5_18()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_18

	local var_5_19 = {
		{
			value = 5000268,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_19)

	local var_5_20 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_20)

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextIdle
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_21)

	local var_5_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_22)

	local function var_5_23()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_6:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_23

	local var_5_24 = {
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("Locked", var_5_24)

	local function var_5_25()
		var_5_4:AnimateSequence("Locked")
	end

	var_5_0._sequences.Locked = var_5_25

	local var_5_26 = {
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOverDisabled", var_5_26)

	local var_5_27 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOverDisabled", var_5_27)

	local function var_5_28()
		var_5_4:AnimateSequence("ButtonOverDisabled")
		var_5_6:AnimateSequence("ButtonOverDisabled")
	end

	var_5_0._sequences.ButtonOverDisabled = var_5_28

	local var_5_29 = {
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUpDisabled", var_5_29)

	local var_5_30 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUpDisabled", var_5_30)

	local function var_5_31()
		var_5_4:AnimateSequence("ButtonUpDisabled")
		var_5_6:AnimateSequence("ButtonUpDisabled")
	end

	var_5_0._sequences.ButtonUpDisabled = var_5_31

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_32)

	local function var_5_33()
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_33

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_5_4:RegisterAnimationSequence("CategoryEmpty", var_5_34)

	local function var_5_35()
		var_5_4:AnimateSequence("CategoryEmpty")
	end

	var_5_0._sequences.CategoryEmpty = var_5_35

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_5_4:RegisterAnimationSequence("CategoryNotEmpty", var_5_36)

	local function var_5_37()
		var_5_4:AnimateSequence("CategoryNotEmpty")
	end

	var_5_0._sequences.CategoryNotEmpty = var_5_37

	local var_5_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("NewNotificationShow", var_5_38)

	local function var_5_39()
		var_5_12:AnimateSequence("NewNotificationShow")
	end

	var_5_0._sequences.NewNotificationShow = var_5_39

	local var_5_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("NewNotificationHide", var_5_40)

	local function var_5_41()
		var_5_12:AnimateSequence("NewNotificationHide")
	end

	var_5_0._sequences.NewNotificationHide = var_5_41

	var_5_0:addEventHandler("gain_focus", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MPBillboardMenuButton", MPBillboardMenuButton)
LockTable(_M)
