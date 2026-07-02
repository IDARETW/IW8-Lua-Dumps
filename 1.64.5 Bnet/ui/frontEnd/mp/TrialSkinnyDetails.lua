module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	arg_1_0.Name:setText(Engine.CBBHFCGDIC(arg_1_1.ui_name))
	arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.ui_description))

	if arg_1_1.ui_description_specific then
		arg_1_0.DescriptionTrial:setText(Engine.CBBHFCGDIC(arg_1_1.ui_description_specific))
	end

	arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.ui_previewImage))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTrialDetails = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function TrialSkinnyDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 471 * _1080p)

	var_3_0.id = "TrialSkinnyDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "TrialDetails"

	var_3_4:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("MPUI/HOW_TRIAL_WORKS"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 17, _1080p * -19, _1080p * 10, _1080p * -425)
	var_3_0:addElement(var_3_4)

	var_3_0.TrialDetails = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Rules"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_RULES"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 17, _1080p * -416, _1080p * 63, _1080p * -384)
	var_3_0:addElement(var_3_6)

	var_3_0.Rules = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Description"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 17, _1080p * -19, _1080p * 89, _1080p * -362)
	var_3_0:addElement(var_3_8)

	var_3_0.Description = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Name"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 17, _1080p * -17, _1080p * 219, _1080p * -222)
	var_3_0:addElement(var_3_10)

	var_3_0.Name = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Image"

	var_3_12:setImage(RegisterMaterial("loading_mp_spear_bg"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 394, _1080p * 254, _1080p * 454)
	var_3_0:addElement(var_3_12)

	var_3_0.Image = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "DescriptionTrial"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 416, _1080p * -17, _1080p * 238, _1080p * -213)
	var_3_0:addElement(var_3_14)

	var_3_0.DescriptionTrial = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "IconGameMode"

	var_3_16:setImage(RegisterMaterial("icon_mp_mode_trial"), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -92, _1080p * 8, _1080p * 14, _1080p * 112)
	var_3_0:addElement(var_3_16)

	var_3_0.IconGameMode = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -425
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 54
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -361
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_20)

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -222
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_21)

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 306
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 454
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 219
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -416
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -213
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("AR")
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_25

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialSkinnyDetails", TrialSkinnyDetails)
LockTable(_M)
