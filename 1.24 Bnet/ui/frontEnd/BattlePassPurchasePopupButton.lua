module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	arg_1_0.Cost:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_1)
	assert(arg_2_2)
	assert(arg_2_3)

	local var_2_0 = LUI.Round((arg_2_2 - arg_2_1) / arg_2_2 * 100, 1)

	ACTIONS.AnimateSequence(arg_2_0, "PremiumBundle")
	arg_2_0.BundleDescription:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC", arg_2_3))
	arg_2_0.DiscountBanner:SetupEventBanner(Engine.CBBHFCGDIC("BATTLEPASS/DISCOUNT_PERCENT", var_2_0), 10 * _1080p)
	arg_2_0.Cost:setText(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupPremiumButton = var_0_0
	arg_3_0.SetupBundleButton = var_0_1
end

function BattlePassPurchasePopupButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 256 * _1080p)

	var_4_0.id = "BattlePassPurchasePopupButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("StoreButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "HighlightBottom"

	var_4_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, _1080p * 1)
	var_4_0:addElement(var_4_4)

	var_4_0.HighlightBottom = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("StoreButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "HighlightTop"

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -1, _1080p * 1)
	var_4_0:addElement(var_4_6)

	var_4_0.HighlightTop = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Backer"

	var_4_8:SetRGBFromTable(SWATCHES.HUD.enemyTeamDark, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Backer = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "BackgroundImage"

	var_4_10:SetAlpha(0.75, 0)
	var_4_10:setImage(RegisterMaterial("battlepass_button_premium"), 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -128, _1080p * 128)
	var_4_0:addElement(var_4_10)

	var_4_0.BackgroundImage = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Gradient"

	var_4_12:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeamHighlight, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:SetPixelGridEnabled(true)
	var_4_12:SetPixelGridContrast(0.2, 0)
	var_4_12:SetPixelGridBlockWidth(2, 0)
	var_4_12:SetPixelGridBlockHeight(2, 0)
	var_4_12:SetPixelGridGutterWidth(1, 0)
	var_4_12:SetPixelGridGutterHeight(1, 0)
	var_4_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_0:addElement(var_4_12)

	var_4_0.Gradient = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "TopGradient"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_14:SetAlpha(0.5, 0)
	var_4_14:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 92, 0)
	var_4_0:addElement(var_4_14)

	var_4_0.TopGradient = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "DiscountBanner"

	var_4_16:SetAlpha(0, 0)
	var_4_16.Backer:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_16.Backer:SetAlpha(0.5, 0)
	var_4_16.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22, _1080p * 172, _1080p * 193, _1080p * 223)
	var_4_0:addElement(var_4_16)

	var_4_0.DiscountBanner = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIText.new()

	var_4_18.id = "OriginalCost"

	var_4_18:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_4_18:SetAlpha(0, 0)
	var_4_18:setText("4000", 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_18:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 292, _1080p * 137, _1080p * 187)
	var_4_0:addElement(var_4_18)

	var_4_0.OriginalCost = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "RedLine"

	var_4_20:SetRGBFromInt(16711680, 0)
	var_4_20:SetAlpha(0, 0)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 188, _1080p * 296, _1080p * 161, _1080p * 163)
	var_4_0:addElement(var_4_20)

	var_4_0.RedLine = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIImage.new()

	var_4_22.id = "CurrencyIcon"

	var_4_22:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22, _1080p * 62, _1080p * 142, _1080p * 182)
	var_4_0:addElement(var_4_22)

	var_4_0.CurrencyIcon = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIText.new()

	var_4_24.id = "Cost"

	var_4_24:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_4_24:setText("1000", 0)
	var_4_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_24:SetAlignment(LUI.Alignment.Left)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 170, _1080p * 137, _1080p * 187)
	var_4_0:addElement(var_4_24)

	var_4_0.Cost = var_4_24

	local var_4_25
	local var_4_26 = LUI.UIStyledText.new()

	var_4_26.id = "BundleDescription"

	var_4_26:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_4_26:SetAlpha(0, 0)
	var_4_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC"), 0)
	var_4_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_26:SetAlignment(LUI.Alignment.Left)
	var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 492, _1080p * 54, _1080p * 78)
	var_4_0:addElement(var_4_26)

	var_4_0.BundleDescription = var_4_26

	local var_4_27
	local var_4_28 = LUI.UIStyledText.new()

	var_4_28.id = "Title"

	var_4_28:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_4_28:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM"), 0)
	var_4_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_28:SetAlignment(LUI.Alignment.Left)
	var_4_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_28:SetStartupDelay(1000)
	var_4_28:SetLineHoldTime(400)
	var_4_28:SetAnimMoveTime(2000)
	var_4_28:SetAnimMoveSpeed(50)
	var_4_28:SetEndDelay(1000)
	var_4_28:SetCrossfadeTime(400)
	var_4_28:SetFadeInTime(300)
	var_4_28:SetFadeOutTime(300)
	var_4_28:SetMaxVisibleLines(1)
	var_4_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 492, _1080p * 12, _1080p * 48)
	var_4_0:addElement(var_4_28)

	var_4_0.Title = var_4_28

	local var_4_29
	local var_4_30 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_4_1
	})

	var_4_30.id = "Banner"

	var_4_30:SetAlpha(0, 0)
	var_4_30:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -25, _1080p * -1)
	var_4_0:addElement(var_4_30)

	var_4_0.Banner = var_4_30

	local function var_4_31()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_31

	local var_4_32 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_32)

	local var_4_33 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HighlightGlow
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonOver", var_4_34)

	local var_4_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_4_28:RegisterAnimationSequence("ButtonOver", var_4_35)

	local function var_4_36()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_6:AnimateSequence("ButtonOver")
		var_4_12:AnimateSequence("ButtonOver")
		var_4_28:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_36

	local var_4_37 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_37)

	local var_4_38 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_38)

	local var_4_39 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonUp", var_4_39)

	local var_4_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		}
	}

	var_4_28:RegisterAnimationSequence("ButtonUp", var_4_40)

	local function var_4_41()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_6:AnimateSequence("ButtonUp")
		var_4_12:AnimateSequence("ButtonUp")
		var_4_28:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_41

	local var_4_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("PremiumBundle", var_4_42)

	local var_4_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("PremiumBundle", var_4_43)

	local var_4_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("PremiumBundle", var_4_44)

	local var_4_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("PremiumBundle", var_4_45)

	local function var_4_46()
		var_4_16:AnimateSequence("PremiumBundle")
		var_4_18:AnimateSequence("PremiumBundle")
		var_4_20:AnimateSequence("PremiumBundle")
		var_4_26:AnimateSequence("PremiumBundle")
	end

	var_4_0._sequences.PremiumBundle = var_4_46

	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("HideCost", var_4_47)

	local var_4_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("HideCost", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("HideCost", var_4_49)

	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("HideCost", var_4_50)

	local var_4_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("HideCost", var_4_51)

	local function var_4_52()
		var_4_16:AnimateSequence("HideCost")
		var_4_18:AnimateSequence("HideCost")
		var_4_20:AnimateSequence("HideCost")
		var_4_22:AnimateSequence("HideCost")
		var_4_24:AnimateSequence("HideCost")
	end

	var_4_0._sequences.HideCost = var_4_52

	var_4_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BattlePassPurchasePopupButton", BattlePassPurchasePopupButton)
LockTable(_M)
