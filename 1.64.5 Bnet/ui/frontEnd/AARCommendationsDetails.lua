module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Description:setText(arg_1_1)

	local var_1_0 = 30 * _1080p
	local var_1_1 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.Description, arg_1_1)
	local var_1_2 = arg_1_0.Description:GetCurrentAnchorsAndPositions().top

	arg_1_0.DoubleNotchedBacker:SetBottom(var_1_2 + var_1_1 + var_1_0, 200, LUI.EASING.outCubic)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1.image)
	assert(arg_2_1.name)
	assert(arg_2_1.desc)
	assert(arg_2_1.num)
	arg_2_0.Icon:setImage(RegisterMaterial(arg_2_1.image))
	arg_2_0.Name:setText(Engine.CBBHFCGDIC(arg_2_1.name), 0)
	arg_2_0.Number:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_MULTIPLIER", arg_2_1.num), 0)
	var_0_0(arg_2_0, Engine.CBBHFCGDIC(arg_2_1.desc))
	ACTIONS.AnimateSequence(arg_2_0, "RefreshPanel")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Icon)
	assert(arg_3_0.Name)
	assert(arg_3_0.Description)
	assert(arg_3_0.Number)

	arg_3_0.SetupAccoladeDetails = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function AARCommendationsDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 700 * _1080p)

	var_4_0.id = "AARCommendationsDetails"
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

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 462)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Icon"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 122, _1080p * 378, _1080p * 57, _1080p * 313)
	var_4_0:addElement(var_4_6)

	var_4_0.Icon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Number"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -209, _1080p * 209, _1080p * 315, _1080p * 385)
	var_4_0:addElement(var_4_8)

	var_4_0.Number = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Name"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_10:setText("blah blah blah blah blah blah blah blah blah", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 41, _1080p * 458, _1080p * 405, _1080p * 441)
	var_4_0:addElement(var_4_10)

	var_4_0.Name = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "Description"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 448, _1080p * 462, _1080p * 484)
	var_4_0:addElement(var_4_12)

	var_4_0.Description = var_4_12

	local function var_4_13()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 492
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_15)

	local function var_4_16()
		var_4_12:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_16

	local var_4_17
	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_6:RegisterAnimationSequence("RefreshPanel", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_8:RegisterAnimationSequence("RefreshPanel", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_10:RegisterAnimationSequence("RefreshPanel", var_4_20)

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_12:RegisterAnimationSequence("RefreshPanel", var_4_21)

	local function var_4_22()
		var_4_6:AnimateSequence("RefreshPanel")
		var_4_8:AnimateSequence("RefreshPanel")
		var_4_10:AnimateSequence("RefreshPanel")
		var_4_12:AnimateSequence("RefreshPanel")
	end

	var_4_0._sequences.RefreshPanel = var_4_22

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("AARCommendationsDetails", AARCommendationsDetails)
LockTable(_M)
