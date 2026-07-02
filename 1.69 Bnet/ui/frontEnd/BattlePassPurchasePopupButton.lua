module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	arg_1_0.Cost:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_1)
	assert(arg_2_2)
	assert(arg_2_3)
	arg_2_0.BundleDescription:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC", arg_2_3))

	if Engine.CIEGIACHAE() then
		arg_2_0.OriginalCost:setText(arg_2_2)
	end

	arg_2_0.Cost:setText(arg_2_1)

	if arg_2_0._showLateGrinder then
		ACTIONS.AnimateSequence(arg_2_0, "LateGrinderPremium")
	else
		ACTIONS.AnimateSequence(arg_2_0, "PremiumBundle")

		local var_2_0 = LUI.Round((arg_2_2 - arg_2_1) / arg_2_2 * 100, 1)

		arg_2_0.DiscountBanner:SetupEventBanner(Engine.CBBHFCGDIC("BATTLEPASS/DISCOUNT_PERCENT", var_2_0), 10 * _1080p)
	end
end

local function var_0_2(arg_3_0)
	if arg_3_0._showLateGrinder then
		ACTIONS.AnimateSequence(arg_3_0, "LateGrinder")
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupPremiumButton = var_0_0
	arg_4_0.SetupBundleButton = var_0_1
	arg_4_0.SetupLateGrinder = var_0_2

	local var_4_0 = BATTLEPASS.GetCurrentCPRewards(arg_4_1)

	arg_4_0._showLateGrinder = CONDITIONS.IsLateGrindersEnabled() and var_4_0.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS

	if arg_4_0._showLateGrinder then
		arg_4_0.DiscountBanner:SetupEventBanner(Engine.CBBHFCGDIC("BATTLEPASS/MOST_AFFORDABLE"), 10 * _1080p)
	end
end

function BattlePassPurchasePopupButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 256 * _1080p)

	var_5_0.id = "BattlePassPurchasePopupButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("StoreButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "HighlightBottom"

	var_5_4:SetAlpha(0, 0)
	var_5_4.Bar:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_4.ButtonGlowTop:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_4.ButtonGlowTop.Glow:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, _1080p * 1)
	var_5_0:addElement(var_5_4)

	var_5_0.HighlightBottom = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("StoreButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "HighlightTop"

	var_5_6:SetAlpha(0, 0)
	var_5_6.Bar:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_6.ButtonGlowTop:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_6.ButtonGlowTop.Glow:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -1, _1080p * 1)
	var_5_0:addElement(var_5_6)

	var_5_0.HighlightTop = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Backer"

	var_5_8:SetRGBFromTable(SWATCHES.HUD.enemyTeamDark, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.Backer = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "BackgroundImage"

	var_5_10:SetAlpha(0.75, 0)
	var_5_10:setImage(RegisterMaterial("battlepass_button_premium"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -128, _1080p * 128)
	var_5_0:addElement(var_5_10)

	var_5_0.BackgroundImage = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Gradient"

	var_5_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_12:SetAlpha(0, 0)
	var_5_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_0:addElement(var_5_12)

	var_5_0.Gradient = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "TopGradient"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_14:SetAlpha(0.5, 0)
	var_5_14:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 92, 0)
	var_5_0:addElement(var_5_14)

	var_5_0.TopGradient = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "DiscountBanner"

	var_5_16:SetAlpha(0, 0)
	var_5_16.Backer:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_5_16.Backer:SetAlpha(0.5, 0)
	var_5_16.Node:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22, _1080p * 172, _1080p * 193, _1080p * 223)
	var_5_0:addElement(var_5_16)

	var_5_0.DiscountBanner = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "OriginalCost"

	var_5_18:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_5_18:SetAlpha(0, 0)
	var_5_18:setText("4000", 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 292, _1080p * 137, _1080p * 187)
	var_5_0:addElement(var_5_18)

	var_5_0.OriginalCost = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "RedLine"

	var_5_20:SetRGBFromTable(SWATCHES.Store.CPRequired, 0)
	var_5_20:SetAlpha(0, 0)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 188, _1080p * 296, _1080p * 161, _1080p * 163)
	var_5_0:addElement(var_5_20)

	var_5_0.RedLine = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIImage.new()

	var_5_22.id = "CurrencyIcon"

	var_5_22:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22, _1080p * 62, _1080p * 142, _1080p * 182)
	var_5_0:addElement(var_5_22)

	var_5_0.CurrencyIcon = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIText.new()

	var_5_24.id = "Cost"

	var_5_24:SetRGBFromTable(SWATCHES.Store.CPCost, 0)
	var_5_24:setText("1000", 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 170, _1080p * 137, _1080p * 187)
	var_5_0:addElement(var_5_24)

	var_5_0.Cost = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIStyledText.new()

	var_5_26.id = "BundleDescription"

	var_5_26:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_26:SetAlpha(0, 0)
	var_5_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC"), 0)
	var_5_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_26:SetAlignment(LUI.Alignment.Left)
	var_5_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 492, _1080p * 54, _1080p * 78)
	var_5_0:addElement(var_5_26)

	var_5_0.BundleDescription = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIStyledText.new()

	var_5_28.id = "Title"

	var_5_28:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_28:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM"), 0)
	var_5_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_28:SetAlignment(LUI.Alignment.Left)
	var_5_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_28:SetStartupDelay(1000)
	var_5_28:SetLineHoldTime(400)
	var_5_28:SetAnimMoveTime(2000)
	var_5_28:SetAnimMoveSpeed(50)
	var_5_28:SetEndDelay(1000)
	var_5_28:SetCrossfadeTime(400)
	var_5_28:SetFadeInTime(300)
	var_5_28:SetFadeOutTime(300)
	var_5_28:SetMaxVisibleLines(1)
	var_5_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 492, _1080p * 12, _1080p * 48)
	var_5_0:addElement(var_5_28)

	var_5_0.Title = var_5_28

	local var_5_29
	local var_5_30 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_5_1
	})

	var_5_30.id = "Banner"

	var_5_30:SetAlpha(0, 0)
	var_5_30:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -25, _1080p * -1)
	var_5_0:addElement(var_5_30)

	var_5_0.Banner = var_5_30

	local var_5_31
	local var_5_32 = LUI.UIImage.new()

	var_5_32.id = "PurchaseArrow"

	var_5_32:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_32:SetAlpha(0, 0)
	var_5_32:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_5_32:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 10, _1080p * 37, _1080p * -27, _1080p * 27)
	var_5_0:addElement(var_5_32)

	var_5_0.PurchaseArrow = var_5_32

	local function var_5_33()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_35)

	local var_5_36 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_36)

	local var_5_37 = {
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_37)

	local var_5_38 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("ButtonOver", var_5_38)

	local var_5_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_32:RegisterAnimationSequence("ButtonOver", var_5_39)

	local function var_5_40()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_28:AnimateSequence("ButtonOver")
		var_5_32:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_40

	local var_5_41
	local var_5_42 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_42)

	local var_5_43 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_44)

	local var_5_45 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("ButtonUp", var_5_45)

	local var_5_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_32:RegisterAnimationSequence("ButtonUp", var_5_46)

	local function var_5_47()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_6:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_28:AnimateSequence("ButtonUp")
		var_5_32:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_47

	local var_5_48
	local var_5_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("PremiumBundle", var_5_49)

	local var_5_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("PremiumBundle", var_5_50)

	local var_5_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("PremiumBundle", var_5_51)

	local var_5_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("PremiumBundle", var_5_52)

	local function var_5_53()
		var_5_16:AnimateSequence("PremiumBundle")
		var_5_18:AnimateSequence("PremiumBundle")
		var_5_20:AnimateSequence("PremiumBundle")
		var_5_26:AnimateSequence("PremiumBundle")
	end

	var_5_0._sequences.PremiumBundle = var_5_53

	local var_5_54
	local var_5_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("HideCost", var_5_55)

	local var_5_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("HideCost", var_5_56)

	local var_5_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("HideCost", var_5_57)

	local var_5_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("HideCost", var_5_58)

	local var_5_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("HideCost", var_5_59)

	local function var_5_60()
		var_5_16:AnimateSequence("HideCost")
		var_5_18:AnimateSequence("HideCost")
		var_5_20:AnimateSequence("HideCost")
		var_5_22:AnimateSequence("HideCost")
		var_5_24:AnimateSequence("HideCost")
	end

	var_5_0._sequences.HideCost = var_5_60

	local var_5_61
	local var_5_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("LateGrinder", var_5_62)

	local function var_5_63()
		var_5_16:AnimateSequence("LateGrinder")
	end

	var_5_0._sequences.LateGrinder = var_5_63

	local var_5_64
	local var_5_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("LateGrinderPremium", var_5_65)

	local var_5_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("LateGrinderPremium", var_5_66)

	local var_5_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("LateGrinderPremium", var_5_67)

	local var_5_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("LateGrinderPremium", var_5_68)

	local function var_5_69()
		var_5_16:AnimateSequence("LateGrinderPremium")
		var_5_18:AnimateSequence("LateGrinderPremium")
		var_5_20:AnimateSequence("LateGrinderPremium")
		var_5_26:AnimateSequence("LateGrinderPremium")
	end

	var_5_0._sequences.LateGrinderPremium = var_5_69

	var_5_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassPurchasePopupButton", BattlePassPurchasePopupButton)
LockTable(_M)
