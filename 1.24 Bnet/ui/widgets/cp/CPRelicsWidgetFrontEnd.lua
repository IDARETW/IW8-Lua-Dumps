module(..., package.seeall)

function CPRelicsWidgetFrontEnd(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "CPRelicsWidgetFrontEnd"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "RelicIcon"

	var_1_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 67, _1080p * 4, _1080p * 54)
	var_1_0:addElement(var_1_6)

	var_1_0.RelicIcon = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "RelicText"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetShadowMinDistance(-0.2, 0)
	var_1_8:SetShadowMaxDistance(0.2, 0)
	var_1_8:SetShadowUOffset(-0.002, 0)
	var_1_8:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 363, _1080p * 4, _1080p * 28)
	var_1_0:addElement(var_1_8)

	var_1_0.RelicText = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "RelicDesc"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_10:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_1_10:SetStartupDelay(5000)
	var_1_10:SetLineHoldTime(4000)
	var_1_10:SetAnimMoveTime(500)
	var_1_10:SetAnimMoveSpeed(300)
	var_1_10:SetEndDelay(1000)
	var_1_10:SetCrossfadeTime(400)
	var_1_10:SetFadeInTime(300)
	var_1_10:SetFadeOutTime(300)
	var_1_10:SetMaxVisibleLines(3)
	var_1_10:SetShadowMinDistance(-0.2, 0)
	var_1_10:SetShadowMaxDistance(0.2, 0)
	var_1_10:SetShadowUOffset(-0.002, 0)
	var_1_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 363, _1080p * 33, _1080p * 53)
	var_1_0:addElement(var_1_10)

	var_1_0.RelicDesc = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Display", var_1_13)

	local var_1_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Display", var_1_14)

	local var_1_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Display", var_1_15)

	local function var_1_16()
		var_1_6:AnimateSequence("Display")
		var_1_8:AnimateSequence("Display")
		var_1_10:AnimateSequence("Display")
	end

	var_1_0._sequences.Display = var_1_16

	local var_1_17
	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Hide", var_1_18)

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Hide", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Hide", var_1_20)

	local function var_1_21()
		var_1_6:AnimateSequence("Hide")
		var_1_8:AnimateSequence("Hide")
		var_1_10:AnimateSequence("Hide")
	end

	var_1_0._sequences.Hide = var_1_21

	return var_1_0
end

MenuBuilder.registerType("CPRelicsWidgetFrontEnd", CPRelicsWidgetFrontEnd)
LockTable(_M)
