module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1.image)
	assert(arg_1_1.name)
	arg_1_0.Icon:setImage(RegisterMaterial(arg_1_1.image))
	arg_1_0.Name:setText(Engine.CBBHFCGDIC(arg_1_1.name))

	if arg_1_1.desc and #arg_1_1.desc > 0 then
		arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.desc))

		local var_1_0 = arg_1_0.Name:GetCurrentAnchorsAndPositions().top
		local var_1_1 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.Name, Engine.CBBHFCGDIC(arg_1_1.name))
		local var_1_2 = LAYOUT.GetElementHeight(arg_1_0.Description)

		arg_1_0.Description:SetTop(var_1_0 + var_1_1)
		arg_1_0.Description:SetBottom(var_1_0 + var_1_1 + var_1_2)
	end

	ACTIONS.AnimateSequence(arg_1_0, "DisplayItem")
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupCommendation = var_0_0
end

function AARParadeCommendationItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 264 * _1080p, 0, 264 * _1080p)

	var_3_0.id = "AARParadeCommendationItem"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Flash"

	var_3_4:SetAlpha(0.3, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -74, _1080p * 74, _1080p * -140, _1080p * 60)
	var_3_0:addElement(var_3_4)

	var_3_0.Flash = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Sparks"

	var_3_6:SetZRotation(120, 0)
	var_3_6:SetColorOpParam(1, 0)
	var_3_6:setImage(RegisterMaterial("commendation_sparks"), 0)
	var_3_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 97, _1080p * -97, _1080p * 38, _1080p * 232)
	var_3_0:addElement(var_3_6)

	var_3_0.Sparks = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Icon"

	var_3_8:setImage(RegisterMaterial("icon_commendation_stim"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -240, _1080p * -40)
	var_3_0:addElement(var_3_8)

	var_3_0.Icon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Name"

	var_3_10:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_3_10:setText("Commendation", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -132, _1080p * 132, _1080p * 211, _1080p * 247)
	var_3_0:addElement(var_3_10)

	var_3_0.Name = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Description"

	var_3_12:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -132, _1080p * 132, _1080p * 247, _1080p * 269)
	var_3_0:addElement(var_3_12)

	var_3_0.Description = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -64
		},
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.3,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_4:RegisterAnimationSequence("DisplayItem", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DisplayItem", var_3_16)

	local var_3_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outCubic
		}
	}

	var_3_8:RegisterAnimationSequence("DisplayItem", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("DisplayItem", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("DisplayItem", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("DisplayItem")
		var_3_6:AnimateSequence("DisplayItem")
		var_3_8:AnimateSequence("DisplayItem")
		var_3_10:AnimateSequence("DisplayItem")
		var_3_12:AnimateSequence("DisplayItem")
	end

	var_3_0._sequences.DisplayItem = var_3_20

	local var_3_21
	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("HideItem", var_3_22)

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("HideItem", var_3_23)

	local function var_3_24()
		var_3_8:AnimateSequence("HideItem")
		var_3_10:AnimateSequence("HideItem")
	end

	var_3_0._sequences.HideItem = var_3_24

	local var_3_25
	local var_3_26 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowText", var_3_26)

	local function var_3_27()
		var_3_10:AnimateSequence("ShowText")
	end

	var_3_0._sequences.ShowText = var_3_27

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARParadeCommendationItem", AARParadeCommendationItem)
LockTable(_M)
