module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function WZGlobalHint(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 526 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "WZGlobalHint"
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

	var_2_4.id = "Title"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 55, 0, _1080p * -12, _1080p * 12)
	var_2_0:addElement(var_2_4)

	var_2_0.Title = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Icon"

	var_2_6:setImage(RegisterMaterial("ui_mp_br_frontend_install_warning_icon_ch2"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 40, 0, _1080p * 40)
	var_2_0:addElement(var_2_6)

	var_2_0.Icon = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_10

	local var_2_11
	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -142
		}
	}

	var_2_4:RegisterAnimationSequence("ARHint", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("ARHint")
	end

	var_2_0._sequences.ARHint = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WZGlobalHint", WZGlobalHint)
LockTable(_M)
