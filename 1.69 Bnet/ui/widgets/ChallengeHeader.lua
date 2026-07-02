module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		arg_1_0.Title:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end
end

function ChallengeHeader(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 526 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "ChallengeHeader"
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
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_4:SetStartupDelay(2000)
	var_2_4:SetLineHoldTime(400)
	var_2_4:SetAnimMoveTime(2000)
	var_2_4:SetAnimMoveSpeed(150)
	var_2_4:SetEndDelay(2000)
	var_2_4:SetCrossfadeTime(250)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(3)
	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -34, _1080p * -10)
	var_2_0:addElement(var_2_4)

	var_2_0.Title = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Line"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_6:SetAlpha(0.6, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -6, _1080p * -5)
	var_2_0:addElement(var_2_6)

	var_2_0.Line = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "ChallengeCount"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -34, _1080p * -10)
	var_2_0:addElement(var_2_8)

	var_2_0.ChallengeCount = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "SubHeader"

	var_2_10:SetRGBFromTable(SWATCHES.HUD.warning, 0)
	var_2_10:SetAlpha(0, 0)
	var_2_10:setText("", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Right)
	var_2_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -28, _1080p * -10)
	var_2_0:addElement(var_2_10)

	var_2_0.SubHeader = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_13)

	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_14)

	local function var_2_15()
		var_2_4:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_15

	local var_2_16
	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -36
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -300
		}
	}

	var_2_4:RegisterAnimationSequence("ARChallengeMenu", var_2_17)

	local function var_2_18()
		var_2_4:AnimateSequence("ARChallengeMenu")
	end

	var_2_0._sequences.ARChallengeMenu = var_2_18

	local var_2_19
	local var_2_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -408
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -640
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_2_4:RegisterAnimationSequence("ARBankHeader", var_2_20)

	local function var_2_21()
		var_2_4:AnimateSequence("ARBankHeader")
	end

	var_2_0._sequences.ARBankHeader = var_2_21

	local var_2_22
	local var_2_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ShowSubHeader", var_2_23)

	local function var_2_24()
		var_2_10:AnimateSequence("ShowSubHeader")
	end

	var_2_0._sequences.ShowSubHeader = var_2_24

	local var_2_25
	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 162
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -4 * _1080p
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_2_10:RegisterAnimationSequence("ShowSubHeaderDisclaimer", var_2_26)

	local function var_2_27()
		var_2_10:AnimateSequence("ShowSubHeaderDisclaimer")
	end

	var_2_0._sequences.ShowSubHeaderDisclaimer = var_2_27

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ChallengeHeader", ChallengeHeader)
LockTable(_M)
