module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)

	arg_1_0._bundleData = arg_1_1
	arg_1_0._timePubVar = (function(arg_2_0)
		local function var_2_0(arg_3_0)
			local var_3_0 = Dvar.DHEEJCCJBH(arg_3_0)
			local var_3_1 = split(var_3_0, ",")

			for iter_3_0, iter_3_1 in ipairs(var_3_1) do
				if iter_3_1 == arg_2_0 then
					return arg_3_0 .. "_timer"
				end
			end
		end

		return var_2_0("MMOOTLNTNR") or var_2_0("OTPQONQQT") or var_2_0("LOKOLPNMNP")
	end)(arg_1_1.id)

	if arg_1_0._timePubVar then
		arg_1_0.LimitedTime:SetupTimeLimit(arg_1_0._timePubVar)
		arg_1_0.LimitedTime:SetAlpha(1)
	else
		arg_1_0.LimitedTime:SetupTimeLimit(nil)
		arg_1_0.LimitedTime:SetAlpha(0)
	end

	arg_1_0.BundleImage:setImage(RegisterMaterial(arg_1_1.image))
	arg_1_0.BundleNameImage:setImage(RegisterMaterial(arg_1_1.titleImage))
	arg_1_0.BundleTypeLabel:setText(Engine.CBBHFCGDIC(arg_1_1.bundleType))
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupButtonData = var_0_0

	arg_4_0:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if arg_4_0._bundleData then
			local var_5_0 = {
				displayUpsellPopup = false,
				bundleID = tonumber(arg_4_0._bundleData.id),
				rarity = tonumber(arg_4_0._bundleData.rarity),
				description = arg_4_0._bundleData.description,
				bundleType = arg_4_0._bundleData.bundleType,
				titleImage = arg_4_0._bundleData.titleImage,
				currencyID = tonumber(arg_4_0._bundleData.currencyID),
				currencyAmount = tonumber(arg_4_0._bundleData.currencyAmount),
				timerPubVar = arg_4_0.timerPubVar
			}

			LUI.FlowManager.RequestLeaveMenuByName("StoreBundlePreview")
			LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_4_1, false, var_5_0)
		end
	end)
end

function BundleButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 350 * _1080p)

	var_6_0.id = "BundleButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "BundleImage"

	var_6_4:setImage(RegisterMaterial("mw_store_billboard_british_metal"), 0)
	var_6_4:SetUMin(0.4, 0)
	var_6_4:SetUMax(0.9, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 300)
	var_6_0:addElement(var_6_4)

	var_6_0.BundleImage = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "BundleNameImage"

	var_6_6:setImage(RegisterMaterial("mw_store_title_british_metal"), 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -115, _1080p * 115, _1080p * 180, _1080p * 295)
	var_6_0:addElement(var_6_6)

	var_6_0.BundleNameImage = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "BundleTypeLabel"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TYPE_OPERATOR"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -38, _1080p * -10)
	var_6_0:addElement(var_6_8)

	var_6_0.BundleTypeLabel = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "HighlightBarTop"

	var_6_10:SetAlpha(0, 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_6_0:addElement(var_6_10)

	var_6_0.HighlightBarTop = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "HighlightBarBottom"

	var_6_12:SetAlpha(0, 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -50, _1080p * -48)
	var_6_0:addElement(var_6_12)

	var_6_0.HighlightBarBottom = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "LimitedTime"

	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 299, _1080p * 540, _1080p * 14, _1080p * 44)
	var_6_0:addElement(var_6_14)

	var_6_0.LimitedTime = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "Gradient"

	var_6_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_16:SetAlpha(0, 0)
	var_6_16:SetPixelGridEnabled(true)
	var_6_16:SetPixelGridContrast(0.2, 0)
	var_6_16:SetPixelGridBlockWidth(2, 0)
	var_6_16:SetPixelGridBlockHeight(2, 0)
	var_6_16:SetPixelGridGutterWidth(1, 0)
	var_6_16:SetPixelGridGutterHeight(1, 0)
	var_6_16:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_6_16:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -50)
	var_6_0:addElement(var_6_16)

	var_6_0.Gradient = var_6_16

	local function var_6_17()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonOver", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_19)

	local var_6_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_20)

	local var_6_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOver", var_6_21)

	local var_6_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonOver", var_6_22)

	local var_6_23 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("ButtonOver", var_6_23)

	local function var_6_24()
		var_6_4:AnimateSequence("ButtonOver")
		var_6_6:AnimateSequence("ButtonOver")
		var_6_8:AnimateSequence("ButtonOver")
		var_6_10:AnimateSequence("ButtonOver")
		var_6_12:AnimateSequence("ButtonOver")
		var_6_16:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_24

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonUp", var_6_25)

	local var_6_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_26)

	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_27)

	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUp", var_6_28)

	local var_6_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonUp", var_6_29)

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("ButtonUp", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("ButtonUp")
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
		var_6_10:AnimateSequence("ButtonUp")
		var_6_12:AnimateSequence("ButtonUp")
		var_6_16:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_31

	var_6_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "ButtonUp")

	return var_6_0
end

MenuBuilder.registerType("BundleButton", BundleButton)
LockTable(_M)
