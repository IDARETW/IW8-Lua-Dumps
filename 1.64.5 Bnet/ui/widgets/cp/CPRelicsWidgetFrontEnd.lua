module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function CPRelicsWidgetFrontEnd(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 100 * _1080p)

	var_2_0.id = "CPRelicsWidgetFrontEnd"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "RelicIcon"

	var_2_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 67, _1080p * 4, _1080p * 54)
	var_2_0:addElement(var_2_6)

	var_2_0.RelicIcon = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "RelicText"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetShadowUOffset(-0.002, 0)
	var_2_8:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 363, _1080p * 4, _1080p * 28)
	var_2_0:addElement(var_2_8)

	var_2_0.RelicText = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "RelicDesc"

	var_2_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_10:SetStartupDelay(5000)
	var_2_10:SetLineHoldTime(4000)
	var_2_10:SetAnimMoveTime(500)
	var_2_10:SetAnimMoveSpeed(300)
	var_2_10:SetEndDelay(1000)
	var_2_10:SetCrossfadeTime(400)
	var_2_10:SetFadeInTime(300)
	var_2_10:SetFadeOutTime(300)
	var_2_10:SetMaxVisibleLines(3)
	var_2_10:SetShadowMaxDistance(0.2, 0)
	var_2_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 363, _1080p * 33, _1080p * 53)
	var_2_0:addElement(var_2_10)

	var_2_0.RelicDesc = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Display", var_2_13)

	local var_2_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Display", var_2_14)

	local var_2_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Display", var_2_15)

	local function var_2_16()
		var_2_6:AnimateSequence("Display")
		var_2_8:AnimateSequence("Display")
		var_2_10:AnimateSequence("Display")
	end

	var_2_0._sequences.Display = var_2_16

	local var_2_17
	local var_2_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Hide", var_2_18)

	local var_2_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Hide", var_2_19)

	local var_2_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Hide", var_2_20)

	local function var_2_21()
		var_2_6:AnimateSequence("Hide")
		var_2_8:AnimateSequence("Hide")
		var_2_10:AnimateSequence("Hide")
	end

	var_2_0._sequences.Hide = var_2_21

	local var_2_22
	local var_2_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_23)

	local var_2_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_24)

	local function var_2_25()
		var_2_8:AnimateSequence("AR")
		var_2_10:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_25

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPRelicsWidgetFrontEnd", CPRelicsWidgetFrontEnd)
LockTable(_M)
