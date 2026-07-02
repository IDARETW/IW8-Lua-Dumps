module(..., package.seeall)

local function var_0_0(arg_1_0)
	if not arg_1_0._saleTimer or not (#arg_1_0._saleTimer > 0) then
		arg_1_0:SetAlpha(0)

		return
	end

	local var_1_0

	local function var_1_1()
		local var_2_0, var_2_1, var_2_2, var_2_3 = STORE.GetCountDownTimeComponents(arg_1_0._saleTimer)

		arg_1_0.SaleText:setText(Engine.CBBHFCGDIC("MENU/SALE_BANNER_END_AT", var_2_0, var_2_1, var_2_2, var_2_3))

		local var_2_4 = 86400
		local var_2_5 = Engine.DEIDGHDBHD()
		local var_2_6 = tonumber(arg_1_0._saleTimer) - var_2_5

		if var_2_4 < var_2_6 then
			ACTIONS.AnimateSequence(arg_1_0, "SaleNormal")
		elseif var_2_6 > 0 then
			ACTIONS.AnimateSequence(arg_1_0, "SaleEnding")
		else
			arg_1_0:SetAlpha(0)

			return
		end

		arg_1_0:Wait(1000, true).onComplete = function()
			var_1_1()
		end
	end

	var_1_1()
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = STORE.GetHighestDiscountPercentage(arg_4_1)

	arg_4_0.SaleText:setText(Engine.CBBHFCGDIC("MENU/SALE_BANNER", math.floor(var_4_0 * 100)))

	local var_4_1 = LAYOUT.GetTextWidth(arg_4_0.SaleText)
	local var_4_2 = arg_4_0.SaleText:GetCurrentAnchorsAndPositions().left
	local var_4_3 = 6 * _1080p

	arg_4_0.SaleTimerText:SetLeft(var_4_2 + var_4_1 + var_4_3)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SaleBannerSetup = var_0_0
	arg_5_0._saleTimer = STORE.GetSaleTimer(arg_5_1)

	arg_5_0.Texture:SetMask(arg_5_0.Mask)

	if arg_5_0._saleTimer and #arg_5_0._saleTimer > 0 then
		arg_5_0:SaleBannerSetup()
	end
end

function StoreSaleBanner(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 37 * _1080p)

	var_6_0.id = "StoreSaleBanner"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:setUseStencil(true)

	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "SaleBannerBG"

	var_6_4:SetRGBFromTable(SWATCHES.Store.HotItemBase, 0)
	var_6_4:SetAlpha(0.8, 0)
	var_6_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 754, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.SaleBannerBG = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Texture"

	var_6_6:SetRGBFromTable(SWATCHES.Store.SaleBanner1, 0)
	var_6_6:SetAlpha(0.2, 0)
	var_6_6:setImage(RegisterMaterial("warzone_banner"), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -161, _1080p * 1451, _1080p * -44, _1080p * 82)
	var_6_0:addElement(var_6_6)

	var_6_0.Texture = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Mask"

	var_6_8:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 754, _1080p * 1, _1080p * -1)
	var_6_0:addElement(var_6_8)

	var_6_0.Mask = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "SaleText"

	var_6_10:SetRGBFromTable(SWATCHES.Store.HotItemText, 0)
	var_6_10:setText(ToUpperCase("MENU/SALE_BANNER_END_AT"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_10:SetWordWrap(false)
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 516, _1080p * 2, _1080p * 32)
	var_6_0:addElement(var_6_10)

	var_6_0.SaleText = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "Node"

	var_6_12:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_6_0:addElement(var_6_12)

	var_6_0.Node = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "Underline"

	var_6_14:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_6_14:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1559, _1080p * 36, 0)
	var_6_0:addElement(var_6_14)

	var_6_0.Underline = var_6_14

	local function var_6_15()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemBacker
		}
	}

	var_6_4:RegisterAnimationSequence("SaleEnding", var_6_17)

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_6_6:RegisterAnimationSequence("SaleEnding", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2
		}
	}

	var_6_10:RegisterAnimationSequence("SaleEnding", var_6_19)

	local var_6_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2
		}
	}

	var_6_12:RegisterAnimationSequence("SaleEnding", var_6_20)

	local var_6_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2
		}
	}

	var_6_14:RegisterAnimationSequence("SaleEnding", var_6_21)

	local function var_6_22()
		var_6_4:AnimateSequence("SaleEnding")
		var_6_6:AnimateSequence("SaleEnding")
		var_6_10:AnimateSequence("SaleEnding")
		var_6_12:AnimateSequence("SaleEnding")
		var_6_14:AnimateSequence("SaleEnding")
	end

	var_6_0._sequences.SaleEnding = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemBase
		}
	}

	var_6_4:RegisterAnimationSequence("SaleNormal", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner1
		}
	}

	var_6_6:RegisterAnimationSequence("SaleNormal", var_6_25)

	local var_6_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 33
		}
	}

	var_6_10:RegisterAnimationSequence("SaleNormal", var_6_26)

	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemHighlight
		}
	}

	var_6_12:RegisterAnimationSequence("SaleNormal", var_6_27)

	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner1
		}
	}

	var_6_14:RegisterAnimationSequence("SaleNormal", var_6_28)

	local function var_6_29()
		var_6_4:AnimateSequence("SaleNormal")
		var_6_6:AnimateSequence("SaleNormal")
		var_6_10:AnimateSequence("SaleNormal")
		var_6_12:AnimateSequence("SaleNormal")
		var_6_14:AnimateSequence("SaleNormal")
	end

	var_6_0._sequences.SaleNormal = var_6_29

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("StoreSaleBanner", StoreSaleBanner)
LockTable(_M)
