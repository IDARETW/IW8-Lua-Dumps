module(..., package.seeall)

function CombatRecordMultipleStatBox(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 280 * _1080p, 0, 160 * _1080p)

	var_1_0.id = "CombatRecordMultipleStatBox"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "DoubleNotchedBacker"

	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.DoubleNotchedBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Stat"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_6:setText(ToUpperCase(""), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 14, _1080p * -140, _1080p * -22, _1080p * 14)
	var_1_0:addElement(var_1_6)

	var_1_0.Stat = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "BarracksHeader"

	var_1_8.Title:setText(ToUpperCase(""), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
	var_1_0:addElement(var_1_8)

	var_1_0.BarracksHeader = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "SubStatLabel"

	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 22, _1080p * 134, _1080p * 67, _1080p * 85)
	var_1_0:addElement(var_1_10)

	var_1_0.SubStatLabel = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "SubStat"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_12:SetAlignment(LUI.Alignment.Center)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 15, _1080p * 141, _1080p * 12, _1080p * 36)
	var_1_0:addElement(var_1_12)

	var_1_0.SubStat = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "SecondStatLabel"

	var_1_14:setText("", 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Center)
	var_1_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 130, _1080p * 98, _1080p * 116)
	var_1_0:addElement(var_1_14)

	var_1_0.SecondStatLabel = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIText.new()

	var_1_16.id = "SecondStat"

	var_1_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_16:setText("", 0)
	var_1_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_16:SetAlignment(LUI.Alignment.Center)
	var_1_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 11, _1080p * -143, _1080p * 39, _1080p * 75)
	var_1_0:addElement(var_1_16)

	var_1_0.SecondStat = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIText.new()

	var_1_18.id = "StatLabel"

	var_1_18:setText("", 0)
	var_1_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_18:SetAlignment(LUI.Alignment.Center)
	var_1_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 133, _1080p * 43, _1080p * 61)
	var_1_0:addElement(var_1_18)

	var_1_0.StatLabel = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIImage.new()

	var_1_20.id = "Divider"

	var_1_20:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_1_20:SetAlpha(0, 0)
	var_1_20:SetZRotation(90, 0)
	var_1_20:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * 4, _1080p * 5)
	var_1_0:addElement(var_1_20)

	var_1_0.Divider = var_1_20

	local function var_1_21()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_21

	local var_1_22
	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_1_6:RegisterAnimationSequence("HideIcon", var_1_23)

	local function var_1_24()
		var_1_6:AnimateSequence("HideIcon")
	end

	var_1_0._sequences.HideIcon = var_1_24

	local var_1_25
	local var_1_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		}
	}

	var_1_6:RegisterAnimationSequence("ShowIcon", var_1_26)

	local function var_1_27()
		var_1_6:AnimateSequence("ShowIcon")
	end

	var_1_0._sequences.ShowIcon = var_1_27

	local var_1_28
	local var_1_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_1_6:RegisterAnimationSequence("TotalEnemies", var_1_29)

	local var_1_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 140
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BodyRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy
		}
	}

	var_1_10:RegisterAnimationSequence("TotalEnemies", var_1_30)

	local var_1_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_1_12:RegisterAnimationSequence("TotalEnemies", var_1_31)

	local var_1_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("TotalEnemies", var_1_32)

	local var_1_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("TotalEnemies", var_1_33)

	local var_1_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("TotalEnemies", var_1_34)

	local var_1_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_1_20:RegisterAnimationSequence("TotalEnemies", var_1_35)

	local function var_1_36()
		var_1_6:AnimateSequence("TotalEnemies")
		var_1_10:AnimateSequence("TotalEnemies")
		var_1_12:AnimateSequence("TotalEnemies")
		var_1_14:AnimateSequence("TotalEnemies")
		var_1_16:AnimateSequence("TotalEnemies")
		var_1_18:AnimateSequence("TotalEnemies")
		var_1_20:AnimateSequence("TotalEnemies")
	end

	var_1_0._sequences.TotalEnemies = var_1_36

	return var_1_0
end

MenuBuilder.registerType("CombatRecordMultipleStatBox", CombatRecordMultipleStatBox)
LockTable(_M)
