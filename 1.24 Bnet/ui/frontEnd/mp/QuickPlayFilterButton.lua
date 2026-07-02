module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	end

	arg_1_0:addEventHandler("lose_focus", function(arg_2_0, arg_2_1)
		arg_2_0:dispatchEventToParent(arg_2_1)
	end)
end

function QuickPlayFilterButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "QuickPlayFilterButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "FilterButtonBG"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.FilterButtonBG = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "FilterIcon"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_3_6:setImage(RegisterMaterial("filter_icon"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -25, _1080p * 25, _1080p * 36, _1080p * 86)
	var_3_0:addElement(var_3_6)

	var_3_0.FilterIcon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Title"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -61, _1080p * 61, _1080p * 7, _1080p * 31)
	var_3_0:addElement(var_3_8)

	var_3_0.Title = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "NewItemSmallIcon"

	var_3_10:SetAlpha(0, 0)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -7, _1080p * 7, _1080p * 15)
	var_3_0:addElement(var_3_10)

	var_3_0.NewItemSmallIcon = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_13)

	local var_3_14 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_14)

	local function var_3_15()
		var_3_6:AnimateSequence("ButtonOver")
		var_3_8:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_17)

	local var_3_18 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.CategoryHeader
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_18)

	local function var_3_19()
		var_3_6:AnimateSequence("ButtonUp")
		var_3_8:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 36
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_21)

	local function var_3_22()
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52
		}
	}

	var_3_4:RegisterAnimationSequence("JP", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 51
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 36
		}
	}

	var_3_6:RegisterAnimationSequence("JP", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		}
	}

	var_3_8:RegisterAnimationSequence("JP", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_3_10:RegisterAnimationSequence("JP", var_3_27)

	local function var_3_28()
		var_3_4:AnimateSequence("JP")
		var_3_6:AnimateSequence("JP")
		var_3_8:AnimateSequence("JP")
		var_3_10:AnimateSequence("JP")
	end

	var_3_0._sequences.JP = var_3_28

	var_3_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("QuickPlayFilterButton", QuickPlayFilterButton)
LockTable(_M)
