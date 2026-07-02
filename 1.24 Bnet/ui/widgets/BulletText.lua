module(..., package.seeall)

local var_0_0 = {
	Bullet = 1,
	Numeric = 2
}
local var_0_1 = 16 * _1080p

local function var_0_2(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_2.extra then
		arg_1_0.Text:setText(Engine.CBBHFCGDIC(arg_1_2.text, arg_1_2.extra))
	else
		arg_1_0.Text:setText(Engine.CBBHFCGDIC(arg_1_2.text))
	end

	arg_1_0.Text:SetRGBFromTable(arg_1_3.textColor or COLORS.white)
	arg_1_0.Text:SetOptOutRightToLeftAlignmentFlip(not arg_1_0._switchLeftToRightAlignment)

	local var_1_0 = var_0_1 * arg_1_3.bulletScale
	local var_1_1 = arg_1_3.fontSize * _1080p / 2

	if arg_1_0._switchLeftToRightAlignment then
		arg_1_0.Text:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -400, var_1_0 - arg_1_3.separation * _1080p, 0, _1080p * (arg_1_3.fontSize or 24))
	else
		arg_1_0.Text:SetAnchorsAndPosition(0, 1, 0, 1, var_1_0 + arg_1_3.separation * _1080p, _1080p * 400, 0, _1080p * (arg_1_3.fontSize or 24))
	end

	if arg_1_3.listType == var_0_0.Numeric then
		if arg_1_0.Bullet then
			arg_1_0:RemoveElement(arg_1_0.Bullet)
		end

		if arg_1_0._switchLeftToRightAlignment then
			arg_1_0.Number:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -var_1_0, 0, 0, _1080p * (arg_1_3.fontSize or 24))
		else
			arg_1_0.Number:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_1_0 * _1080p, 0, _1080p * (arg_1_3.fontSize or 24))
		end

		local var_1_2 = arg_1_3.numericSeparator
		local var_1_3

		if var_1_2 == "()" then
			var_1_3 = arg_1_3.numericSeparator and "(" .. arg_1_1 .. ")" or arg_1_1
		elseif var_1_2 == "[]" then
			var_1_3 = arg_1_3.numericSeparator and "[" .. arg_1_1 .. "]" or arg_1_1
		elseif var_1_2 == "{}" then
			var_1_3 = arg_1_3.numericSeparator and "{" .. arg_1_1 .. "}" or arg_1_1
		else
			if var_1_2 == ")" and arg_1_0._switchLeftToRightAlignment then
				var_1_2 = "("
			end

			var_1_3 = arg_1_0._switchLeftToRightAlignment and (var_1_2 and var_1_2 or "") .. arg_1_1 or arg_1_1 .. (var_1_2 and var_1_2 or "")
		end

		arg_1_0.Number:setText(var_1_3)

		local var_1_4

		if arg_1_3.bulletColor then
			var_1_4 = arg_1_3.bulletColor
		elseif arg_1_3.textColor then
			var_1_4 = arg_1_3.textColor
		else
			var_1_4 = COLORS.white
		end

		arg_1_0.Number:SetRGBFromTable(var_1_4)
	else
		if arg_1_0.Number then
			arg_1_0:RemoveElement(arg_1_0.Number)
		end

		if arg_1_0._switchLeftToRightAlignment then
			arg_1_0.Bullet:SetAnchorsAndPosition(1, 0, 0, 1, -var_1_0, 0, var_1_1 - var_1_0 / 2, var_1_1 + var_1_0 / 2)
		else
			arg_1_0.Bullet:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_1_0, var_1_1 - var_1_0 / 2, var_1_1 + var_1_0 / 2)
		end

		local var_1_5

		if arg_1_3.bulletColor then
			var_1_5 = arg_1_3.bulletColor
		elseif arg_1_3.textColor then
			var_1_5 = arg_1_3.textColor
		else
			var_1_5 = COLORS.white
		end

		arg_1_0.Bullet:SetRGBFromTable(var_1_5)
		arg_1_0.Bullet:setImage(RegisterMaterial(arg_1_3.bulletImage or "passive_circle_background"), 0)
		arg_1_0.Bullet:SetScale(arg_1_3.bulletScale - 1 or -0.5)
	end
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupBullet = var_0_2
	arg_2_0._switchLeftToRightAlignment = IsLanguageArabic() and not arg_2_2

	if arg_2_0._switchLeftToRightAlignment then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function BulletText(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "BulletText"
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

	var_3_4.id = "Bullet"

	var_3_4:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 16, _1080p * 4, _1080p * 20)
	var_3_0:addElement(var_3_4)

	var_3_0.Bullet = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Text"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 400, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_6)

	var_3_0.Text = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Number"

	var_3_8:setText("1.", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 24)
	var_3_0:addElement(var_3_8)

	var_3_0.Number = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
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

	var_3_4:RegisterAnimationSequence("AR", var_3_11)

	local var_3_12 = {
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

	var_3_8:RegisterAnimationSequence("AR", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_13

	var_0_3(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BulletText", BulletText)
LockTable(_M)
