module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.PromptButton then
		ACTIONS.AnimateSequence(arg_1_0.PromptButton, "OnSale")
	end
end

local function var_0_1(arg_2_0)
	if not arg_2_0._expanded then
		arg_2_0._expanded = true

		ACTIONS.AnimateSequence(arg_2_0, "Expanded")

		if arg_2_0.PromptButton then
			ACTIONS.AnimateSequence(arg_2_0.PromptButton, "Expanded")
			ACTIONS.AnimateSequence(arg_2_0.PromptButton, "GlowPulse")
		end
	end
end

local function var_0_2(arg_3_0)
	if arg_3_0._expanded then
		arg_3_0._expanded = false

		ACTIONS.AnimateSequence(arg_3_0, "Contracted")

		if arg_3_0.PromptButton then
			ACTIONS.AnimateSequence(arg_3_0.PromptButton, "Contracted")
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.FlagOnSale = var_0_0
	arg_4_0.FlagExpanded = var_0_1
	arg_4_0.FlagContracted = var_0_2

	ACTIONS.AnimateSequence(arg_4_0.ReviewQuote1, "Variant1")
	ACTIONS.AnimateSequence(arg_4_0.ReviewQuote2, "Variant2")
	ACTIONS.AnimateSequence(arg_4_0.ReviewQuote3, "Variant3")
	ACTIONS.AnimateSequence(arg_4_0.ReviewQuote4, "Variant4")
end

function MainMenuBladeUpsellOverlay(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "MainMenuBladeUpsellOverlay"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3

	if not CONDITIONS.HideBuyMWPromptMagmaBlades("") then
		var_5_3 = MenuBuilder.BuildRegisteredType("MainMenuBladePromptButton", {
			controllerIndex = var_5_1
		})
		var_5_3.id = "PromptButton"

		var_5_3:SetAlpha(0.6, 0)
		var_5_3:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -211, _1080p * 211, _1080p * -220, _1080p * -90)
		var_5_0:addElement(var_5_3)

		var_5_0.PromptButton = var_5_3
	end

	local var_5_4
	local var_5_5 = LUI.UIImage.new()

	var_5_5.id = "AdditionalInfoGradient"

	var_5_5:SetRGBFromInt(0, 0)
	var_5_5:SetAlpha(0, 0)
	var_5_5:setImage(RegisterMaterial("wdg_gradient_dual"), 0)
	var_5_5:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 72, _1080p * -72, _1080p * 293, _1080p * 338)
	var_5_0:addElement(var_5_5)

	var_5_0.AdditionalInfoGradient = var_5_5

	local var_5_6
	local var_5_7 = LUI.UIStyledText.new()

	var_5_7.id = "AdditionalInfo"

	var_5_7:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_7:SetAlpha(0, 0)
	var_5_7:setText(Engine.CBBHFCGDIC("LUA_MENU/MAGMA_UPSELL_TAGLINE"), 0)
	var_5_7:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_7:SetAlignment(LUI.Alignment.Center)
	var_5_7:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 302, _1080p * 330)
	var_5_0:addElement(var_5_7)

	var_5_0.AdditionalInfo = var_5_7

	local var_5_8
	local var_5_9 = LUI.UIImage.new()

	var_5_9.id = "GameContentGradient"

	var_5_9:SetRGBFromTable(SWATCHES.CAC.attachmentEmpty, 0)
	var_5_9:SetAlpha(0, 0)
	var_5_9:setImage(RegisterMaterial("wdg_gradient_dual"), 0)
	var_5_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -110, _1080p * 110, _1080p * 239, _1080p * 293)
	var_5_0:addElement(var_5_9)

	var_5_0.GameContentGradient = var_5_9

	local var_5_10
	local var_5_11 = LUI.UIStyledText.new()

	var_5_11.id = "GameContent"

	var_5_11:SetAlpha(0, 0)
	var_5_11:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAGMA_UPSELL_HEADER")), 0)
	var_5_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_11:SetWordWrap(false)
	var_5_11:SetTracking(2 * _1080p, 0)
	var_5_11:SetAlignment(LUI.Alignment.Center)
	var_5_11:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 246, _1080p * 286)
	var_5_0:addElement(var_5_11)

	var_5_0.GameContent = var_5_11

	local var_5_12
	local var_5_13 = MenuBuilder.BuildRegisteredType("ReviewQuote", {
		controllerIndex = var_5_1
	})

	var_5_13.id = "ReviewQuote4"

	var_5_13:SetAlpha(0, 0)
	var_5_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -268, _1080p * -18, _1080p * 299, _1080p * 419)
	var_5_0:addElement(var_5_13)

	var_5_0.ReviewQuote4 = var_5_13

	local var_5_14
	local var_5_15 = MenuBuilder.BuildRegisteredType("ReviewQuote", {
		controllerIndex = var_5_1
	})

	var_5_15.id = "ReviewQuote3"

	var_5_15:SetAlpha(0, 0)
	var_5_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 268, _1080p * 299, _1080p * 419)
	var_5_0:addElement(var_5_15)

	var_5_0.ReviewQuote3 = var_5_15

	local var_5_16
	local var_5_17 = MenuBuilder.BuildRegisteredType("ReviewQuote", {
		controllerIndex = var_5_1
	})

	var_5_17.id = "ReviewQuote2"

	var_5_17:SetAlpha(0, 0)
	var_5_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -268, _1080p * -18, _1080p * 73, _1080p * 193)
	var_5_0:addElement(var_5_17)

	var_5_0.ReviewQuote2 = var_5_17

	local var_5_18
	local var_5_19 = MenuBuilder.BuildRegisteredType("ReviewQuote", {
		controllerIndex = var_5_1
	})

	var_5_19.id = "ReviewQuote1"

	var_5_19:SetAlpha(0, 0)
	var_5_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 268, _1080p * 82, _1080p * 202)
	var_5_0:addElement(var_5_19)

	var_5_0.ReviewQuote1 = var_5_19

	local function var_5_20()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_20

	local var_5_21

	if not CONDITIONS.HideBuyMWPromptMagmaBlades("") then
		local var_5_22 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 130,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_3:RegisterAnimationSequence("Expanded", var_5_22)
	end

	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_5:RegisterAnimationSequence("Expanded", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_7:RegisterAnimationSequence("Expanded", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("Expanded", var_5_25)

	local var_5_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.9,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_11:RegisterAnimationSequence("Expanded", var_5_26)

	local var_5_27 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_13:RegisterAnimationSequence("Expanded", var_5_27)

	local var_5_28 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("Expanded", var_5_28)

	local var_5_29 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_17:RegisterAnimationSequence("Expanded", var_5_29)

	local var_5_30 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_19:RegisterAnimationSequence("Expanded", var_5_30)

	local function var_5_31()
		if not CONDITIONS.HideBuyMWPromptMagmaBlades("") then
			var_5_3:AnimateSequence("Expanded")
		end

		var_5_5:AnimateSequence("Expanded")
		var_5_7:AnimateSequence("Expanded")
		var_5_9:AnimateSequence("Expanded")
		var_5_11:AnimateSequence("Expanded")
		var_5_13:AnimateSequence("Expanded")
		var_5_15:AnimateSequence("Expanded")
		var_5_17:AnimateSequence("Expanded")
		var_5_19:AnimateSequence("Expanded")
	end

	var_5_0._sequences.Expanded = var_5_31

	local var_5_32

	if not CONDITIONS.HideBuyMWPromptMagmaBlades("") then
		local var_5_33 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_3:RegisterAnimationSequence("Contracted", var_5_33)
	end

	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_5:RegisterAnimationSequence("Contracted", var_5_34)

	local var_5_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_7:RegisterAnimationSequence("Contracted", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("Contracted", var_5_36)

	local var_5_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_11:RegisterAnimationSequence("Contracted", var_5_37)

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_13:RegisterAnimationSequence("Contracted", var_5_38)

	local var_5_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("Contracted", var_5_39)

	local var_5_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_17:RegisterAnimationSequence("Contracted", var_5_40)

	local var_5_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_19:RegisterAnimationSequence("Contracted", var_5_41)

	local function var_5_42()
		if not CONDITIONS.HideBuyMWPromptMagmaBlades("") then
			var_5_3:AnimateSequence("Contracted")
		end

		var_5_5:AnimateSequence("Contracted")
		var_5_7:AnimateSequence("Contracted")
		var_5_9:AnimateSequence("Contracted")
		var_5_11:AnimateSequence("Contracted")
		var_5_13:AnimateSequence("Contracted")
		var_5_15:AnimateSequence("Contracted")
		var_5_17:AnimateSequence("Contracted")
		var_5_19:AnimateSequence("Contracted")
	end

	var_5_0._sequences.Contracted = var_5_42

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MainMenuBladeUpsellOverlay", MainMenuBladeUpsellOverlay)
LockTable(_M)
