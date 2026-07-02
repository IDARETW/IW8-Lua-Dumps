module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function BarracksGameTimeStatBox(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 130 * _1080p)

	var_2_0.id = "BarracksGameTimeStatBox"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "MinutesLabel"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_4:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/MINUTES")), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Center)
	var_2_4:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -134, 0, _1080p * -30, _1080p * -10)
	var_2_0:addElement(var_2_4)

	var_2_0.MinutesLabel = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "HoursLabel"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HOURS")), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -66, _1080p * 66, _1080p * -30, _1080p * -10)
	var_2_0:addElement(var_2_6)

	var_2_0.HoursLabel = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "DaysLabel"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/DAYS")), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 134, _1080p * -30, _1080p * -10)
	var_2_0:addElement(var_2_8)

	var_2_0.DaysLabel = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "Minutes"

	var_2_10:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_2_10:setText("59", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_10:SetAlignment(LUI.Alignment.Center)
	var_2_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -134, 0, _1080p * -95, _1080p * -25)
	var_2_0:addElement(var_2_10)

	var_2_0.Minutes = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "Hours"

	var_2_12:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_2_12:setText("99", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_12:SetAlignment(LUI.Alignment.Center)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -66, _1080p * 66, _1080p * -95, _1080p * -25)
	var_2_0:addElement(var_2_12)

	var_2_0.Hours = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "Days"

	var_2_14:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_2_14:setText("9999", 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_14:SetAlignment(LUI.Alignment.Center)
	var_2_14:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 134, _1080p * -95, _1080p * -25)
	var_2_0:addElement(var_2_14)

	var_2_0.Days = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIText.new()

	var_2_16.id = "Title"

	var_2_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_16:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TOTAL_TIME_SPENT")), 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_16:SetAlignment(LUI.Alignment.Center)
	var_2_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_2_0:addElement(var_2_16)

	var_2_0.Title = var_2_16

	local function var_2_17()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_17

	local var_2_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_18)

	local var_2_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_19)

	local var_2_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_20)

	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_21)

	local function var_2_22()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_22

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BarracksGameTimeStatBox", BarracksGameTimeStatBox)
LockTable(_M)
