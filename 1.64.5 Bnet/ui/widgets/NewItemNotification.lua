module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_1 = LOOT.HideLootBreadcrumbsCondition(arg_1_3) and 0 or arg_1_1

	if arg_1_2 then
		arg_1_0:SetAlpha(arg_1_1, arg_1_2)
	else
		arg_1_0:SetAlpha(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if LOOT.HideLootBreadcrumbsCondition(arg_2_3) then
		return
	end

	local var_2_0

	if LOOT.IsBundle(arg_2_2) then
		var_2_0 = not STORE.HasSeenItem(arg_2_1, arg_2_2)
	else
		var_2_0 = Loot.HDJCADADF(arg_2_1, arg_2_2)
	end

	arg_2_0:UpdateAlpha(var_2_0 and 1 or 0)

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if LOOT.HideLootBreadcrumbsCondition(arg_3_3) then
		return
	end

	if LOOT.IsBundle(arg_3_2) then
		isNew = not STORE.HasSeenItem(arg_3_1, arg_3_2)

		if isNew then
			arg_3_0:SetAlpha(0)
			STORE.MarkItemSeen(arg_3_1, arg_3_2)
		end
	elseif Loot.HDJCADADF(arg_3_1, arg_3_2) then
		arg_3_0:SetAlpha(0)
		Loot.BCAACADBEA(arg_3_1, arg_3_2)
	end
end

local function var_0_3(arg_4_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")

		arg_4_0._backerWidth = LAYOUT.SetTextBoxSize(arg_4_0.NewText, arg_4_0.Backer, arg_4_0.NewText:getText(), 9, nil, LUI.Alignment.Left, 0)

		local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0.Backer:getLocalRect()

		arg_4_0.Highlight:SetRight(var_4_2)
		arg_4_0.Highlight:SetLeft(var_4_2 - 6 * _1080p)
	else
		local var_4_4 = LAYOUT.GetTextWidth(arg_4_0.NewText)

		arg_4_0._backerWidth = LAYOUT.SetTextBoxSize(arg_4_0.NewText, arg_4_0.Backer, arg_4_0.NewText:getText(), arg_4_0._isLeftAligned and 4 or 9, nil, arg_4_0._isLeftAligned and LUI.Alignment.Left or LUI.Alignment.Right, 0)

		local var_4_5, var_4_6, var_4_7, var_4_8 = arg_4_0.Backer:getLocalRect()

		arg_4_0.Highlight:SetLeft(var_4_5)
		arg_4_0.Highlight:SetRight(var_4_5 + 6 * _1080p)
	end
end

local function var_0_4(arg_5_0)
	arg_5_0._isLeftAligned = false

	ACTIONS.AnimateSequence(arg_5_0, "RightAligned")
	var_0_3(arg_5_0)
end

local function var_0_5(arg_6_0)
	arg_6_0._isLeftAligned = true

	ACTIONS.AnimateSequence(arg_6_0, "LeftAligned")
	var_0_3(arg_6_0)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.UpdateAlpha = var_0_0
	arg_7_0.UpdateBreadcrumbByID = var_0_1
	arg_7_0.ClearBreadcrumbByID = var_0_2
	arg_7_0._isLeftAligned = true
	arg_7_0.SetupAlignment = var_0_3
	arg_7_0.SetupRightAlignment = var_0_4
	arg_7_0.SetupLeftAlignment = var_0_5

	arg_7_0:SetupAlignment()
end

function NewItemNotification(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 78 * _1080p, 0, 30 * _1080p)

	var_8_0.id = "NewItemNotification"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Backer"

	var_8_4:SetRGBFromTable(SWATCHES.genericMenu.newIndicatorDark, 0)
	var_8_4:SetPixelGridEnabled(true)
	var_8_4:SetPixelGridContrast(0.5, 0)
	var_8_4:SetPixelGridBlockWidth(2, 0)
	var_8_4:SetPixelGridBlockHeight(2, 0)
	var_8_4:SetPixelGridGutterWidth(1, 0)
	var_8_4:SetPixelGridGutterHeight(1, 0)
	var_8_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -78, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Backer = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Highlight"

	var_8_6:SetRGBFromTable(SWATCHES.genericMenu.newIndicator, 0)
	var_8_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -78, _1080p * -72, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.Highlight = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "NewText"

	var_8_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Right)
	var_8_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 34, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_8)

	var_8_0.NewText = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10 = {
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_8_4:RegisterAnimationSequence("AR", var_8_10)

	local var_8_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_8_6:RegisterAnimationSequence("AR", var_8_11)

	local var_8_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
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
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_12)

	local function var_8_13()
		var_8_4:AnimateSequence("AR")
		var_8_6:AnimateSequence("AR")
		var_8_8:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_13

	local var_8_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Off", var_8_14)

	local var_8_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Off", var_8_15)

	local function var_8_16()
		var_8_4:AnimateSequence("Off")
		var_8_8:AnimateSequence("Off")
	end

	var_8_0._sequences.Off = var_8_16

	local var_8_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 78
		}
	}

	var_8_4:RegisterAnimationSequence("LeftAligned", var_8_17)

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_8_6:RegisterAnimationSequence("LeftAligned", var_8_18)

	local var_8_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_8_8:RegisterAnimationSequence("LeftAligned", var_8_19)

	local function var_8_20()
		var_8_4:AnimateSequence("LeftAligned")
		var_8_6:AnimateSequence("LeftAligned")
		var_8_8:AnimateSequence("LeftAligned")
	end

	var_8_0._sequences.LeftAligned = var_8_20

	local var_8_21 = {
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_8_4:RegisterAnimationSequence("RightAligned", var_8_21)

	local var_8_22 = {
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -72
		}
	}

	var_8_6:RegisterAnimationSequence("RightAligned", var_8_22)

	local var_8_23 = {
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_8_8:RegisterAnimationSequence("RightAligned", var_8_23)

	local function var_8_24()
		var_8_4:AnimateSequence("RightAligned")
		var_8_6:AnimateSequence("RightAligned")
		var_8_8:AnimateSequence("RightAligned")
	end

	var_8_0._sequences.RightAligned = var_8_24

	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("NewItemNotification", NewItemNotification)
LockTable(_M)
