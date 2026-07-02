module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "Show")
	arg_1_0.Desc:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC(arg_1_1)))

	if maxLineCount and maxLineCount > 1 then
		arg_1_0.Desc:SetWordWrap(true)
		arg_1_0.Desc:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
		arg_1_0.Desc:SetStartupDelay(2000)
		arg_1_0.Desc:SetLineHoldTime(400)
		arg_1_0.Desc:SetAnimMoveTime(2000)
		arg_1_0.Desc:SetAnimMoveSpeed(150)
		arg_1_0.Desc:SetEndDelay(2000)
		arg_1_0.Desc:SetCrossfadeTime(250)
		arg_1_0.Desc:SetFadeInTime(300)
		arg_1_0.Desc:SetFadeOutTime(300)
		arg_1_0.Desc:SetMaxVisibleLines(maxLineCount)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.BRWarning)

	arg_2_0.SetupWarning = var_0_0

	ACTIONS.AnimateSequence(arg_2_0.BRWarning, "Show")
	ACTIONS.AnimateSequence(arg_2_0, "Hide")

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function BRWarningInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 286 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "BRWarningInfo"
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

	var_3_4.id = "Desc"

	var_3_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("LUA_MENU/BR_WARNING_ICON_DESC"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_4:SetStartupDelay(2000)
	var_3_4:SetLineHoldTime(400)
	var_3_4:SetAnimMoveTime(2000)
	var_3_4:SetAnimMoveSpeed(150)
	var_3_4:SetEndDelay(2000)
	var_3_4:SetCrossfadeTime(250)
	var_3_4:SetFadeInTime(300)
	var_3_4:SetFadeOutTime(300)
	var_3_4:SetMaxVisibleLines(1)
	var_3_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 59, _1080p * -10, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_4)

	var_3_0.Desc = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "BRWarning"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -4, _1080p * 60, _1080p * -4, _1080p * 4)
	var_3_0:addElement(var_3_6)

	var_3_0.BRWarning = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_9)

	local function var_3_10()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Show", var_3_12)

	local var_3_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Show", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("Show")
		var_3_6:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_16)

	local var_3_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_17)

	local function var_3_18()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_18

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BRWarningInfo", BRWarningInfo)
LockTable(_M)
