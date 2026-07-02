module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function BarracksStatBox(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 429 * _1080p, 0, 100 * _1080p)

	var_2_0.id = "BarracksStatBox"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "Value"

	var_2_4:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 22.5, _1080p * 209.5, _1080p * -35, _1080p * 35)
	var_2_0:addElement(var_2_4)

	var_2_0.Value = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Description"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_6:setText(ToUpperCase(""), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(1000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(150)
	var_2_6:SetAnimMoveSpeed(50)
	var_2_6:SetEndDelay(1000)
	var_2_6:SetCrossfadeTime(400)
	var_2_6:SetFadeInTime(300)
	var_2_6:SetFadeOutTime(300)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -189.5, _1080p * 15.5, _1080p * 4, _1080p * 24)
	var_2_0:addElement(var_2_6)

	var_2_0.Description = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "Title"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_8:setText(ToUpperCase(""), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_8:SetStartupDelay(1000)
	var_2_8:SetLineHoldTime(400)
	var_2_8:SetAnimMoveTime(150)
	var_2_8:SetAnimMoveSpeed(50)
	var_2_8:SetEndDelay(1000)
	var_2_8:SetCrossfadeTime(400)
	var_2_8:SetFadeInTime(300)
	var_2_8:SetFadeOutTime(300)
	var_2_8:SetMaxVisibleLines(1)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -189.5, _1080p * 15.5, _1080p * -26, _1080p * 4)
	var_2_0:addElement(var_2_8)

	var_2_0.Title = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_12

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BarracksStatBox", BarracksStatBox)
LockTable(_M)
