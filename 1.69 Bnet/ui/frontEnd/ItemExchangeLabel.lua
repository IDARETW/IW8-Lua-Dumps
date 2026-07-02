module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function ItemExchangeLabel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 265 * _1080p, 0, 46 * _1080p)

	var_2_0.id = "ItemExchangeLabel"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "Name"

	var_2_4:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_4:SetStartupDelay(2000)
	var_2_4:SetLineHoldTime(400)
	var_2_4:SetAnimMoveTime(2000)
	var_2_4:SetAnimMoveSpeed(150)
	var_2_4:SetEndDelay(2000)
	var_2_4:SetCrossfadeTime(250)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(1)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -97, _1080p * 24, _1080p * 46)
	var_2_0:addElement(var_2_4)

	var_2_0.Name = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Class"

	var_2_6:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt2, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(2000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(2000)
	var_2_6:SetAnimMoveSpeed(150)
	var_2_6:SetEndDelay(2000)
	var_2_6:SetCrossfadeTime(250)
	var_2_6:SetFadeInTime(300)
	var_2_6:SetFadeOutTime(300)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, 0, 0, _1080p * 24)
	var_2_0:addElement(var_2_6)

	var_2_0.Class = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Bullet"

	var_2_8:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt2, 0)
	var_2_8:SetScale(-0.1, 0)
	var_2_8:setImage(RegisterMaterial("widg_circle_small"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 10, _1080p * 7, _1080p * 17)
	var_2_0:addElement(var_2_8)

	var_2_0.Bullet = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10
	local var_2_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 15
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_11)

	local var_2_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_12)

	local var_2_13 = {
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
			value = _1080p * -10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_14

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ItemExchangeLabel", ItemExchangeLabel)
LockTable(_M)
