module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		if not arg_3_0:getParent():isInFocus() then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
			ACTIONS.AnimateSequence(arg_3_0, "GlowAnime")
		end
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_5_0, arg_5_1)
		if not arg_5_0:getParent():isInFocus() then
			ACTIONS.AnimateSequence(arg_5_0, "ButtonUpDisabled")
		end
	end)
	arg_1_0:addEventHandler("Purchased", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_1_0, "Purchased")
	end)
end

function StoreItemButtonBackground(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 120 * _1080p)

	var_7_0.id = "StoreItemButtonBackground"
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

	var_7_4.id = "Backer"

	var_7_4:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed, 0)
	var_7_4:SetAlpha(0.9, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Backer = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "TextureLayer"

	var_7_6:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_7_6:SetAlpha(0.1, 0)
	var_7_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_7_0:addElement(var_7_6)

	var_7_0.TextureLayer = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "Gradient"

	var_7_8:SetRGBFromTable(SWATCHES.Store.BundleTextOver, 0)
	var_7_8:SetAlpha(0, 0)
	var_7_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_8:SetBlendMode(BLEND_MODE.multiply)
	var_7_0:addElement(var_7_8)

	var_7_0.Gradient = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Highlight"

	var_7_10:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_7_10:SetAlpha(0.1, 0)
	var_7_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -20, 0)
	var_7_0:addElement(var_7_10)

	var_7_0.Highlight = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "BottomOverlay"

	var_7_12:SetRGBFromInt(0, 0)
	var_7_12:SetAlpha(0.4, 0)
	var_7_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -50, 0)
	var_7_0:addElement(var_7_12)

	var_7_0.BottomOverlay = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("StoreButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "HighlightTop"

	var_7_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_7_0:addElement(var_7_14)

	var_7_0.HighlightTop = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("StoreButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "HighlightBottom"

	var_7_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_7_0:addElement(var_7_16)

	var_7_0.HighlightBottom = var_7_16

	local function var_7_17()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_17

	local var_7_18
	local var_7_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_19)

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOver", var_7_20)

	local var_7_21 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleTextHighlight
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_21)

	local var_7_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOver", var_7_22)

	local var_7_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOver", var_7_23)

	local var_7_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOver", var_7_24)

	local function var_7_25()
		var_7_4:AnimateSequence("ButtonOver")
		var_7_6:AnimateSequence("ButtonOver")
		var_7_8:AnimateSequence("ButtonOver")
		var_7_10:AnimateSequence("ButtonOver")
		var_7_14:AnimateSequence("ButtonOver")
		var_7_16:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_25

	local var_7_26
	local var_7_27 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_27)

	local var_7_28 = {
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUp", var_7_28)

	local var_7_29 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_29)

	local var_7_30 = {
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUp", var_7_30)

	local var_7_31 = {
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUp", var_7_31)

	local function var_7_32()
		var_7_4:AnimateSequence("ButtonUp")
		var_7_6:AnimateSequence("ButtonUp")
		var_7_8:AnimateSequence("ButtonUp")
		var_7_14:AnimateSequence("ButtonUp")
		var_7_16:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_32

	local var_7_33
	local var_7_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOverDisabled", var_7_34)

	local var_7_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverDisabled", var_7_35)

	local var_7_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_36)

	local var_7_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOverDisabled", var_7_37)

	local var_7_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOverDisabled", var_7_38)

	local function var_7_39()
		var_7_4:AnimateSequence("ButtonOverDisabled")
		var_7_6:AnimateSequence("ButtonOverDisabled")
		var_7_8:AnimateSequence("ButtonOverDisabled")
		var_7_14:AnimateSequence("ButtonOverDisabled")
		var_7_16:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_39

	local var_7_40
	local var_7_41 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpDisabled", var_7_41)

	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpDisabled", var_7_42)

	local var_7_43 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_43)

	local var_7_44 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUpDisabled", var_7_44)

	local var_7_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUpDisabled", var_7_45)

	local function var_7_46()
		var_7_4:AnimateSequence("ButtonUpDisabled")
		var_7_6:AnimateSequence("ButtonUpDisabled")
		var_7_8:AnimateSequence("ButtonUpDisabled")
		var_7_14:AnimateSequence("ButtonUpDisabled")
		var_7_16:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -100,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0.5,
			duration = 1667,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0.1,
			duration = 1167,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_7_10:RegisterAnimationSequence("GlowAnime", var_7_48)

	local function var_7_49()
		var_7_10:AnimateLoop("GlowAnime")
	end

	var_7_0._sequences.GlowAnime = var_7_49

	local var_7_50
	local var_7_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Purchased", var_7_51)

	local var_7_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Purchased", var_7_52)

	local function var_7_53()
		var_7_10:AnimateSequence("Purchased")
		var_7_12:AnimateSequence("Purchased")
	end

	var_7_0._sequences.Purchased = var_7_53

	local var_7_54
	local var_7_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Free", var_7_55)

	local function var_7_56()
		var_7_12:AnimateSequence("Free")
	end

	var_7_0._sequences.Free = var_7_56

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("StoreItemButtonBackground", StoreItemButtonBackground)
LockTable(_M)
