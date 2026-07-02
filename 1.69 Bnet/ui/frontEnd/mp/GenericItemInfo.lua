module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_1_0, "CH")
	end
end

function GenericItemInfo(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p)

	var_2_0.id = "GenericItemInfo"
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

	var_2_4.id = "BodyText"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_4:SetStartupDelay(2000)
	var_2_4:SetLineHoldTime(0)
	var_2_4:SetAnimMoveTime(1000)
	var_2_4:SetAnimMoveSpeed(5000)
	var_2_4:SetEndDelay(2000)
	var_2_4:SetCrossfadeTime(400)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(5)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1, _1080p * -40, _1080p * 50, _1080p * 70)
	var_2_0:addElement(var_2_4)

	var_2_0.BodyText = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "HeaderText"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_6:setText(ToUpperCase(""), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(1000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(2000)
	var_2_6:SetAnimMoveSpeed(50)
	var_2_6:SetEndDelay(1000)
	var_2_6:SetCrossfadeTime(400)
	var_2_6:SetFadeInTime(300)
	var_2_6:SetFadeOutTime(300)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetDecodeLetterLength(30)
	var_2_6:SetDecodeMaxRandChars(6)
	var_2_6:SetDecodeUpdatesPerLetter(4)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -1, 0, 0, _1080p * 50)
	var_2_0:addElement(var_2_6)

	var_2_0.HeaderText = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
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
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
		}
	}

	var_2_4:RegisterAnimationSequence("CH", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("CH")
	end

	var_2_0._sequences.CH = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GenericItemInfo", GenericItemInfo)
LockTable(_M)
