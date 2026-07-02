module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		if LUI.IsLastInputMouseNavigation(arg_2_1.controllerIndex) then
			arg_2_0.Gradient:SetAlpha(0.5)
		else
			arg_2_0.Gradient:SetAlpha(0)
		end

		if LUI.IsLastInputKeyboardMouse(arg_2_1.controllerIndex) then
			arg_2_0.ButtonIcon:SetAlpha(0)
			arg_2_0.BuyLabel:SetLeft(_1080p * -200)
		else
			arg_2_0.ButtonIcon:SetAlpha(1)
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})
	arg_1_0.Glint:SetMask(arg_1_0.Mask)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_1_0, "GlintAnimeStop")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_1_0, "GlintAnime")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonOverDisabled")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpDisabled")
	end)
end

function PurchaseTiersButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 120 * _1080p)

	var_7_0.id = "PurchaseTiersButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Gradient"

	var_7_4:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_7_4:SetAlpha(0, 0)
	var_7_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 120)
	var_7_0:addElement(var_7_4)

	var_7_0.Gradient = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("StoreItemButtonBackground", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "Background"

	var_7_6:SetAlpha(0.95, 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.Background = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIStyledText.new()

	var_7_8.id = "BuyLabel"

	var_7_8:SetRGBFromTable(SWATCHES.Store.BundleText, 0)
	var_7_8:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUY_WITH_COD_POINTS")), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_8:SetLeading(-4 * _1080p, 0)
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_8:SetShadowMinDistance(-0.2, 0)
	var_7_8:SetShadowMaxDistance(0.2, 0)
	var_7_8:SetShadowRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -137, _1080p * 200, _1080p * 22, _1080p * 58)
	var_7_0:addElement(var_7_8)

	var_7_0.BuyLabel = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "CurrencyIcon"

	var_7_10:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -72, _1080p * -40, _1080p * -42, _1080p * -10)
	var_7_0:addElement(var_7_10)

	var_7_0.CurrencyIcon = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIText.new()

	var_7_12.id = "Price"

	var_7_12:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_7_12:setText("", 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_12:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -30, _1080p * 66, _1080p * -41, _1080p * -11)
	var_7_0:addElement(var_7_12)

	var_7_0.Price = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "ButtonIcon"

	var_7_14:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_7_14:setImage(RegisterMaterial("button_alt1"), 0)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -173, _1080p * -147, _1080p * 27, _1080p * 53)
	var_7_0:addElement(var_7_14)

	var_7_0.ButtonIcon = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "Glint"

	var_7_16:SetAlpha(0, 0)
	var_7_16:SetZRotation(-60, 0)
	var_7_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -200, _1080p * 600, _1080p * -1000, _1080p * 1000)
	var_7_0:addElement(var_7_16)

	var_7_0.Glint = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "Mask"

	var_7_18:setImage(RegisterMaterial("stencil_mask"), 0)
	var_7_0:addElement(var_7_18)

	var_7_0.Mask = var_7_18

	local function var_7_19()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_19

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleTextOver
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_20)

	local function var_7_21()
		var_7_8:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_21

	local var_7_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleText
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_22)

	local function var_7_23()
		var_7_8:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_23

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_24)

	local function var_7_25()
		var_7_8:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_25

	local var_7_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_26)

	local function var_7_27()
		var_7_8:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_27

	local var_7_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -515
		},
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 985
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1785
		},
		{
			duration = 6000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 985
		},
		{
			duration = 6000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1785
		}
	}

	var_7_16:RegisterAnimationSequence("GlintAnime", var_7_28)

	local function var_7_29()
		var_7_16:AnimateLoop("GlintAnime")
	end

	var_7_0._sequences.GlintAnime = var_7_29

	local var_7_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("GlintAnimeStop", var_7_30)

	local function var_7_31()
		var_7_16:AnimateSequence("GlintAnimeStop")
	end

	var_7_0._sequences.GlintAnimeStop = var_7_31

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("PurchaseTiersButton", PurchaseTiersButton)
LockTable(_M)
