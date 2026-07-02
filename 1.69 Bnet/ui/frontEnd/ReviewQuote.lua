module(..., package.seeall)

function ReviewQuote(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 120 * _1080p)

	var_1_0.id = "ReviewQuote"
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

	var_1_4.id = "Image"

	var_1_4:SetAlpha(0.8, 0)
	var_1_4:setImage(RegisterMaterial("mm_blade_review1"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -85, _1080p * 85, _1080p * -56, _1080p * -18)
	var_1_0:addElement(var_1_4)

	var_1_0.Image = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Quote"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.attachmentDefault, 0)
	var_1_6:setText(ToUpperCase(""), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -113, _1080p * 113, _1080p * -7, _1080p * 11)
	var_1_0:addElement(var_1_6)

	var_1_0.Quote = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Line"

	var_1_8:SetRGBFromTable(SWATCHES.CAC.attachmentDefault, 0)
	var_1_8:SetAlpha(0.4, 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * 29, _1080p * 27)
	var_1_0:addElement(var_1_8)

	var_1_0.Line = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "Source"

	var_1_10:SetRGBFromTable(SWATCHES.CAC.attachmentDefault, 0)
	var_1_10:SetAlpha(0.5, 0)
	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -113, _1080p * 113, _1080p * 35, _1080p * 53)
	var_1_0:addElement(var_1_10)

	var_1_0.Source = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mm_blade_review3")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_1_4:RegisterAnimationSequence("Variant2", var_1_13)

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_DESC_2"))
		}
	}

	var_1_6:RegisterAnimationSequence("Variant2", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		}
	}

	var_1_8:RegisterAnimationSequence("Variant2", var_1_15)

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_MEDIA_2")
		}
	}

	var_1_10:RegisterAnimationSequence("Variant2", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Variant2")
		var_1_6:AnimateSequence("Variant2")
		var_1_8:AnimateSequence("Variant2")
		var_1_10:AnimateSequence("Variant2")
	end

	var_1_0._sequences.Variant2 = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mm_blade_review4")
		}
	}

	var_1_4:RegisterAnimationSequence("Variant4", var_1_19)

	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_DESC_4"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 88
		}
	}

	var_1_6:RegisterAnimationSequence("Variant4", var_1_20)

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 33
		}
	}

	var_1_8:RegisterAnimationSequence("Variant4", var_1_21)

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_MEDIA_4")
		}
	}

	var_1_10:RegisterAnimationSequence("Variant4", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("Variant4")
		var_1_6:AnimateSequence("Variant4")
		var_1_8:AnimateSequence("Variant4")
		var_1_10:AnimateSequence("Variant4")
	end

	var_1_0._sequences.Variant4 = var_1_23

	local var_1_24
	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mm_blade_review2")
		}
	}

	var_1_4:RegisterAnimationSequence("Variant3", var_1_25)

	local var_1_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -22
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_DESC_3"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		}
	}

	var_1_6:RegisterAnimationSequence("Variant3", var_1_26)

	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_1_8:RegisterAnimationSequence("Variant3", var_1_27)

	local var_1_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_MEDIA_3")
		}
	}

	var_1_10:RegisterAnimationSequence("Variant3", var_1_28)

	local function var_1_29()
		var_1_4:AnimateSequence("Variant3")
		var_1_6:AnimateSequence("Variant3")
		var_1_8:AnimateSequence("Variant3")
		var_1_10:AnimateSequence("Variant3")
	end

	var_1_0._sequences.Variant3 = var_1_29

	local var_1_30
	local var_1_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mm_blade_review1")
		}
	}

	var_1_4:RegisterAnimationSequence("Variant1", var_1_31)

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_DESC_1"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		}
	}

	var_1_6:RegisterAnimationSequence("Variant1", var_1_32)

	local var_1_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		}
	}

	var_1_8:RegisterAnimationSequence("Variant1", var_1_33)

	local var_1_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BUYMW_QUOTE_MEDIA_1")
		}
	}

	var_1_10:RegisterAnimationSequence("Variant1", var_1_34)

	local function var_1_35()
		var_1_4:AnimateSequence("Variant1")
		var_1_6:AnimateSequence("Variant1")
		var_1_8:AnimateSequence("Variant1")
		var_1_10:AnimateSequence("Variant1")
	end

	var_1_0._sequences.Variant1 = var_1_35

	return var_1_0
end

MenuBuilder.registerType("ReviewQuote", ReviewQuote)
LockTable(_M)
