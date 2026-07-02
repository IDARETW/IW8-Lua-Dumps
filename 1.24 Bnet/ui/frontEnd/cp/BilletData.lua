module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "KORZHJP")
	end
end

function BilletData(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 710 * _1080p, 0, 20 * _1080p)

	var_2_0.id = "BilletData"
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

	var_2_4.id = "Text"

	var_2_4:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_4:SetStartupDelay(1000)
	var_2_4:SetLineHoldTime(1000)
	var_2_4:SetAnimMoveTime(150)
	var_2_4:SetAnimMoveSpeed(50)
	var_2_4:SetEndDelay(1000)
	var_2_4:SetCrossfadeTime(400)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(1)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 710, 0, _1080p * 18)
	var_2_0:addElement(var_2_4)

	var_2_0.Text = var_2_4

	local function var_2_5()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_5

	local var_2_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -700
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_6)

	local function var_2_7()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_7

	local var_2_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 692
		}
	}

	var_2_4:RegisterAnimationSequence("KORZHJP", var_2_8)

	local function var_2_9()
		var_2_4:AnimateSequence("KORZHJP")
	end

	var_2_0._sequences.KORZHJP = var_2_9

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BilletData", BilletData)
LockTable(_M)
