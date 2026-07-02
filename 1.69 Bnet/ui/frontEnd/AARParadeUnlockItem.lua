module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = RegisterMaterial(arg_1_2)

	if Engine.DFEIGFBEH(var_1_0) > 1 then
		ACTIONS.AnimateSequence(arg_1_0, "WeaponLayout")
	else
		ACTIONS.AnimateSequence(arg_1_0, "NormalLayout")
	end

	arg_1_0.Icon:setImage(var_1_0)
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "ShowNameAndType")

	if arg_2_0._unlockTypeSound then
		Engine.BJDBIAGIDA(arg_2_0._unlockTypeSound)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetUpLayout = var_0_0
	arg_3_0.PlayIntro = var_0_1
	arg_3_0._unlockTypeSound = nil
end

function AARParadeUnlockItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 224 * _1080p)

	var_4_0.id = "AARParadeUnlockItem"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 400, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Title"

	var_4_6.Text:setText(ToUpperCase(""), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -9, 0, _1080p * 47)
	var_4_0:addElement(var_4_6)

	var_4_0.Title = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Icon"

	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -29, _1080p * 99)
	var_4_0:addElement(var_4_8)

	var_4_0.Icon = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Type"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -15, _1080p * 54, _1080p * 78)
	var_4_0:addElement(var_4_10)

	var_4_0.Type = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("BannerGradient", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "HighlighFlashBanner"

	var_4_12:SetAlpha(0, 0)
	var_4_12.BGAdd:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_12.BGMult:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -200, _1080p * 200, 0, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.HighlighFlashBanner = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("BannerGradient", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "HeaderFlashBanner"

	var_4_14:SetAlpha(0, 0)
	var_4_14.BGAdd:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_14.BGMult:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -1000, _1080p * 1000, 0, _1080p * 47)
	var_4_0:addElement(var_4_14)

	var_4_0.HeaderFlashBanner = var_4_14

	local function var_4_15()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_15

	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		}
	}

	var_4_8:RegisterAnimationSequence("WeaponLayout", var_4_16)

	local function var_4_17()
		var_4_8:AnimateSequence("WeaponLayout")
	end

	var_4_0._sequences.WeaponLayout = var_4_17

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 64
		}
	}

	var_4_8:RegisterAnimationSequence("NormalLayout", var_4_18)

	local function var_4_19()
		var_4_8:AnimateSequence("NormalLayout")
	end

	var_4_0._sequences.NormalLayout = var_4_19

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Intro", var_4_20)

	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1000,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1000,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_12:RegisterAnimationSequence("Intro", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("Intro")
		var_4_12:AnimateSequence("Intro")
	end

	var_4_0._sequences.Intro = var_4_22

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1000,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1000,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_14:RegisterAnimationSequence("ShowName", var_4_23)

	local function var_4_24()
		var_4_14:AnimateSequence("ShowName")
	end

	var_4_0._sequences.ShowName = var_4_24

	local var_4_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ShowNameAndType", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowNameAndType", var_4_26)

	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_4_10:RegisterAnimationSequence("ShowNameAndType", var_4_27)

	local function var_4_28()
		var_4_6:AnimateSequence("ShowNameAndType")
		var_4_8:AnimateSequence("ShowNameAndType")
		var_4_10:AnimateSequence("ShowNameAndType")
	end

	var_4_0._sequences.ShowNameAndType = var_4_28

	local var_4_29 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("HideAll", var_4_29)

	local var_4_30 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HideAll", var_4_30)

	local var_4_31 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideAll", var_4_31)

	local var_4_32 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("HideAll", var_4_32)

	local function var_4_33()
		var_4_4:AnimateSequence("HideAll")
		var_4_6:AnimateSequence("HideAll")
		var_4_8:AnimateSequence("HideAll")
		var_4_10:AnimateSequence("HideAll")
	end

	var_4_0._sequences.HideAll = var_4_33

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("AARParadeUnlockItem", AARParadeUnlockItem)
LockTable(_M)
