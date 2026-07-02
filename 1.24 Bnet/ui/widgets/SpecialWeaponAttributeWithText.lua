module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = WEAPON.GetSpecialAttributeName(arg_1_1)
	local var_1_1 = WEAPON.GetSpecialAttributeIcon(arg_1_1)

	if var_1_0 and #var_1_0 > 0 and var_1_1 and #var_1_1 > 0 then
		arg_1_0.SpecialWeaponAttributeWithText.Title:setText(Engine.CBBHFCGDIC(var_1_0))
		arg_1_0.SpecialWeaponAttributeWithText.Icon:setImage(RegisterMaterial(var_1_1))

		return true
	end

	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupWeaponAttribute = var_0_0
end

function SpecialWeaponAttributeWithText(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "SpecialWeaponAttributeWithText"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(10 * _1080p)

	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Icon"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Title"

	var_3_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 74, _1080p * 574, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
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

	var_3_6:RegisterAnimationSequence("AR", var_3_9)

	local function var_3_10()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	if CONDITIONS.IsArabic(var_3_0) then
		ACTIONS.AnimateSequence(var_3_0, "AR")
	end

	return var_3_0
end

MenuBuilder.registerType("SpecialWeaponAttributeWithText", SpecialWeaponAttributeWithText)
LockTable(_M)
