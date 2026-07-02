module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.CurrentBalanceAmount)
	assert(arg_1_0.ItemCostAmount)
	assert(arg_1_0.RequiredAmount)
	arg_1_0.CurrentBalanceAmount:setText(Engine.JCBDICCAH(arg_1_1.currentBalance))
	arg_1_0.ItemCostAmount:setText(Engine.JCBDICCAH(arg_1_1.bundleCost))
	arg_1_0.RequiredAmount:setText(Engine.JCBDICCAH(arg_1_1.requiredAmount))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateBalanceInfo = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function RequiredCPAmount(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 90 * _1080p)

	var_3_0.id = "RequiredCPAmount"
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

	var_3_4.id = "CurrentBalanceLabel"

	var_3_4:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("LUA_MENU/YOUR_CURRENT_BALANCE"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
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
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 210, _1080p * 6, _1080p * 24)
	var_3_0:addElement(var_3_4)

	var_3_0.CurrentBalanceLabel = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "CurrentBalanceIcon"

	var_3_6:SetScale(-0.25, 0)
	var_3_6:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_3_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -79, _1080p * -55, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_6)

	var_3_0.CurrentBalanceIcon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "CurrentBalanceAmount"

	var_3_8:SetRGBFromTable(SWATCHES.Store.CPBalance, 0)
	var_3_8:setText("0", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -50, 0, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_8)

	var_3_0.CurrentBalanceAmount = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "ItemCostLabel"

	var_3_10:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/ITEM_COST"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(2000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(2000)
	var_3_10:SetAnimMoveSpeed(150)
	var_3_10:SetEndDelay(2000)
	var_3_10:SetCrossfadeTime(250)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 210, _1080p * 36, _1080p * 54)
	var_3_0:addElement(var_3_10)

	var_3_0.ItemCostLabel = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "ItemCostIcon"

	var_3_12:SetScale(-0.25, 0)
	var_3_12:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -79, _1080p * -55, _1080p * 33, _1080p * 57)
	var_3_0:addElement(var_3_12)

	var_3_0.ItemCostIcon = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "ItemCostAmount"

	var_3_14:SetRGBFromTable(SWATCHES.Store.CPCost, 0)
	var_3_14:setText("0", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -50, 0, _1080p * 33, _1080p * 57)
	var_3_0:addElement(var_3_14)

	var_3_0.ItemCostAmount = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "RequiredLabel"

	var_3_16:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("LUA_MENU/REQUIRED_AMOUNT"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetWordWrap(false)
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_16:SetStartupDelay(2000)
	var_3_16:SetLineHoldTime(400)
	var_3_16:SetAnimMoveTime(2000)
	var_3_16:SetAnimMoveSpeed(150)
	var_3_16:SetEndDelay(2000)
	var_3_16:SetCrossfadeTime(250)
	var_3_16:SetFadeInTime(300)
	var_3_16:SetFadeOutTime(300)
	var_3_16:SetMaxVisibleLines(1)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 210, _1080p * 66, _1080p * 84)
	var_3_0:addElement(var_3_16)

	var_3_0.RequiredLabel = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "RequiredIcon"

	var_3_18:SetScale(-0.25, 0)
	var_3_18:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -79, _1080p * -55, _1080p * 63, _1080p * 87)
	var_3_0:addElement(var_3_18)

	var_3_0.RequiredIcon = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "RequiredAmount"

	var_3_20:SetRGBFromInt(16711680, 0)
	var_3_20:setText("0", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetWordWrap(false)
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -50, 0, _1080p * 63, _1080p * 87)
	var_3_0:addElement(var_3_20)

	var_3_0.RequiredAmount = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "DividerLine"

	var_3_22:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -26, _1080p * -25, 0, _1080p * 84)
	var_3_0:addElement(var_3_22)

	var_3_0.DividerLine = var_3_22

	local function var_3_23()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 27
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 27
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 57
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 57
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_3_18:RegisterAnimationSequence("AR", var_3_32)

	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_3_20:RegisterAnimationSequence("AR", var_3_33)

	local function var_3_34()
		var_3_4:AnimateSequence("AR")
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
		var_3_18:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_34

	local var_3_35
	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("RequiredAmountHide", var_3_36)

	local var_3_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("RequiredAmountHide", var_3_37)

	local var_3_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("RequiredAmountHide", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_3_22:RegisterAnimationSequence("RequiredAmountHide", var_3_39)

	local function var_3_40()
		var_3_16:AnimateSequence("RequiredAmountHide")
		var_3_18:AnimateSequence("RequiredAmountHide")
		var_3_20:AnimateSequence("RequiredAmountHide")
		var_3_22:AnimateSequence("RequiredAmountHide")
	end

	var_3_0._sequences.RequiredAmountHide = var_3_40

	local var_3_41
	local var_3_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("RequiredAmountShow", var_3_42)

	local var_3_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("RequiredAmountShow", var_3_43)

	local var_3_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("RequiredAmountShow", var_3_44)

	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 84
		}
	}

	var_3_22:RegisterAnimationSequence("RequiredAmountShow", var_3_45)

	local function var_3_46()
		var_3_16:AnimateSequence("RequiredAmountShow")
		var_3_18:AnimateSequence("RequiredAmountShow")
		var_3_20:AnimateSequence("RequiredAmountShow")
		var_3_22:AnimateSequence("RequiredAmountShow")
	end

	var_3_0._sequences.RequiredAmountShow = var_3_46

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RequiredCPAmount", RequiredCPAmount)
LockTable(_M)
