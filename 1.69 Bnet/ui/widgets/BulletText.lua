module(..., package.seeall)

local var_0_0 = {
	Bullet = 1,
	Numeric = 2
}
local var_0_1 = 16 * _1080p

local function var_0_2(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if not arg_1_0.TrailingImage then
		return
	end

	local var_1_0 = arg_1_1.trailingImageScale or 1
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.Text) * _1080p + arg_1_2.separation * _1080p + 100 * _1080p * var_1_0

	if arg_1_3 then
		arg_1_0.TrailingImage:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_1_1 - _1080p * 18, var_1_1 - _1080p * 48, _1080p * -15, _1080p * 15)
	else
		arg_1_0.TrailingImage:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18 + var_1_1, _1080p * 48 + var_1_1, _1080p * -15, _1080p * 15)
	end

	arg_1_0.TrailingImage:SetScale(var_1_0)
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_2.extra then
		arg_2_0.Text:setText(Engine.CBBHFCGDIC(arg_2_2.text, arg_2_2.extra))
	else
		arg_2_0.Text:setText(Engine.CBBHFCGDIC(arg_2_2.text))
	end

	if arg_2_2.trailingImage then
		arg_2_0.TrailingImage:setImage(RegisterMaterial(arg_2_2.trailingImage))
	else
		arg_2_0:RemoveElement(arg_2_0.TrailingImage)

		arg_2_0.TrailingImage = nil
	end

	arg_2_0.Text:SetRGBFromTable(arg_2_3.textColor or COLORS.white)
	arg_2_0.Text:SetOptOutRightToLeftAlignmentFlip(not arg_2_0._switchLeftToRightAlignment)

	local var_2_0 = var_0_1 * arg_2_3.bulletScale
	local var_2_1 = arg_2_3.fontSize * _1080p / 2

	var_0_2(arg_2_0, arg_2_2, arg_2_3, arg_2_0._switchLeftToRightAlignment)

	if arg_2_0._switchLeftToRightAlignment then
		arg_2_0.Text:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -400, var_2_0 - 20 * _1080p - arg_2_3.separation * _1080p, 0, _1080p * (arg_2_3.fontSize or 24))
	else
		arg_2_0.Text:SetAnchorsAndPosition(0, 1, 0, 1, var_2_0 + arg_2_3.separation * _1080p, _1080p * 400, 0, _1080p * (arg_2_3.fontSize or 24))
	end

	if arg_2_3.listType == var_0_0.Numeric then
		if arg_2_0.Bullet then
			arg_2_0:RemoveElement(arg_2_0.Bullet)
		end

		if arg_2_0._switchLeftToRightAlignment then
			arg_2_0.Number:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -var_2_0, 0, 0, _1080p * (arg_2_3.fontSize or 24))
		else
			arg_2_0.Number:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_2_0 * _1080p, 0, _1080p * (arg_2_3.fontSize or 24))
		end

		local var_2_2 = arg_2_3.numericSeparator
		local var_2_3

		if var_2_2 == "()" then
			var_2_3 = arg_2_3.numericSeparator and "(" .. arg_2_1 .. ")" or arg_2_1
		elseif var_2_2 == "[]" then
			var_2_3 = arg_2_3.numericSeparator and "[" .. arg_2_1 .. "]" or arg_2_1
		elseif var_2_2 == "{}" then
			var_2_3 = arg_2_3.numericSeparator and "{" .. arg_2_1 .. "}" or arg_2_1
		else
			if var_2_2 == ")" and arg_2_0._switchLeftToRightAlignment then
				var_2_2 = "("
			end

			var_2_3 = arg_2_0._switchLeftToRightAlignment and (var_2_2 and var_2_2 or "") .. arg_2_1 or arg_2_1 .. (var_2_2 and var_2_2 or "")
		end

		arg_2_0.Number:setText(var_2_3)

		local var_2_4

		if arg_2_3.bulletColor then
			var_2_4 = arg_2_3.bulletColor
		elseif arg_2_3.textColor then
			var_2_4 = arg_2_3.textColor
		else
			var_2_4 = COLORS.white
		end

		arg_2_0.Number:SetRGBFromTable(var_2_4)
	else
		if arg_2_0.Number then
			arg_2_0:RemoveElement(arg_2_0.Number)
		end

		if arg_2_0._switchLeftToRightAlignment then
			arg_2_0.Bullet:SetAnchorsAndPosition(1, 0, 0, 1, 0, var_2_0, var_2_1 - var_2_0 / 2, var_2_1 + var_2_0 / 2)
		else
			arg_2_0.Bullet:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_2_0, var_2_1 - var_2_0 / 2, var_2_1 + var_2_0 / 2)
		end

		local var_2_5

		if arg_2_3.bulletColor then
			var_2_5 = arg_2_3.bulletColor
		elseif arg_2_3.textColor then
			var_2_5 = arg_2_3.textColor
		else
			var_2_5 = COLORS.white
		end

		arg_2_0.Bullet:SetRGBFromTable(var_2_5)
		arg_2_0.Bullet:setImage(RegisterMaterial(arg_2_3.bulletImage or "passive_circle_background"), 0)
		arg_2_0.Bullet:SetScale(arg_2_3.bulletScale - 1 or -0.5)
	end
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupBullet = var_0_3
	arg_3_0._switchLeftToRightAlignment = IsLanguageArabic() and not arg_3_2.optOutOfRightToLeftAlignmentFlip

	if arg_3_0._switchLeftToRightAlignment then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function BulletText(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 24 * _1080p)

	var_4_0.id = "BulletText"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Bullet"

	var_4_4:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 16, _1080p * 4, _1080p * 20)
	var_4_0:addElement(var_4_4)

	var_4_0.Bullet = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Text"

	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 400, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Number"

	var_4_8:setText("1.", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Right)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 24)
	var_4_0:addElement(var_4_8)

	var_4_0.Number = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "TrailingImage"

	var_4_10:setImage(RegisterMaterial("logo_activision"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 48, _1080p * -15, _1080p * 15)
	var_4_0:addElement(var_4_10)

	var_4_0.TrailingImage = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
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
			value = _1080p * -16
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_4:RegisterAnimationSequence("AR", var_4_13)

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 381
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_14)

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
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

	var_4_8:RegisterAnimationSequence("AR", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("AR")
		var_4_6:AnimateSequence("AR")
		var_4_8:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_16

	var_0_4(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BulletText", BulletText)
LockTable(_M)
