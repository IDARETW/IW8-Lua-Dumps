module(..., package.seeall)

local var_0_0 = {
	EXPANDED = 1,
	COLLAPSED = 0
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._displayStates = var_0_0.COLLAPSED

	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = CONDITIONS.IsWZWipDvarEnabled() and arg_2_0.WZWipHalo or arg_2_0.Halo

		assert(var_2_0, "A halo element must be present in the widget before attempting an transform on it.")

		if not var_2_0._baseWidth then
			var_2_0._baseWidth = var_2_0:getWidth()
		end

		arg_1_0:applyElementTransform()

		local var_2_1, var_2_2 = ProjectRootCoordinate(arg_2_1.rootName, arg_2_1.x, arg_2_1.y)

		if arg_2_0:IsPositionInside(var_2_1, var_2_2) and not arg_2_0.fixedSizeSlider:IsPositionInside(var_2_1, var_2_2) then
			var_2_0:SetAlpha(1)

			local var_2_3, var_2_4 = Engine.DBFFAEEFGJ():PixelsToUnits(var_2_1, var_2_2)
			local var_2_5, var_2_6, var_2_7, var_2_8 = arg_2_0:getCurrentGlobalRect()
			local var_2_9 = var_2_3 - var_2_5
			local var_2_10 = var_2_9 - var_2_0._baseWidth / 2
			local var_2_11 = var_2_9 + var_2_0._baseWidth / 2

			var_2_0:SetLeft(var_2_10)
			var_2_0:SetRight(var_2_11)
		else
			var_2_0:SetAlpha(0)
		end

		arg_1_0:undoElementTransform()
	end

	arg_1_0:addEventHandler("mousemove", var_1_0)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		if arg_3_0._displayStates == var_0_0.COLLAPSED then
			WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver")

			arg_3_0._displayStates = var_0_0.EXPANDED
		end
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if arg_4_0._displayStates == var_0_0.EXPANDED then
			WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")

			arg_4_0._displayStates = var_0_0.COLLAPSED
		end
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function HorizontalMinimalScrollbarSliderArea(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 11 * _1080p)

	var_5_0.id = "HorizontalMinimalScrollbarSliderArea"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "background"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.scrollbarBackground, 0)
	var_5_4:SetAlpha(0.2, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -2.5, _1080p * 2.5)
	var_5_0:addElement(var_5_4)

	var_5_0.background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Halo"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_6:SetPixelGridEnabled(true)
	var_5_6:setImage(RegisterMaterial("horizontal_scrollbar_gradient"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 148, _1080p * 226, _1080p * 11, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Halo = var_5_6

	local var_5_7

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_7 = LUI.UIImage.new()
		var_5_7.id = "WZWipHalo"

		var_5_7:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_5_7:SetAlpha(0, 0)
		var_5_7:setImage(RegisterMaterial("horizontal_scrollbar_gradient"), 0)
		var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 148, _1080p * 226, _1080p * 11, 0)
		var_5_0:addElement(var_5_7)

		var_5_0.WZWipHalo = var_5_7
	end

	local var_5_8
	local var_5_9 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbarSlider", {
		controllerIndex = var_5_1
	})

	var_5_9.id = "fixedSizeSlider"

	var_5_9:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 70, _1080p * 170, _1080p * 3, _1080p * -3)
	var_5_0:addElement(var_5_9)

	var_5_0.fixedSizeSlider = var_5_9

	local function var_5_10()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_10

	local var_5_11
	local var_5_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5.5
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_12)

	local var_5_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_13)

	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("ButtonOver", var_5_14)

	local function var_5_15()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_9:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5.5
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_17)

	local var_5_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("ButtonUp", var_5_18)

	local function var_5_19()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_9:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_21)

	local function var_5_22()
		var_5_6:AnimateSequence("WZWipSetup")
	end

	var_5_0._sequences.WZWipSetup = var_5_22

	local var_5_23
	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5.5
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipButtonOver", var_5_24)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_25 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_7:RegisterAnimationSequence("WZWipButtonOver", var_5_25)
	end

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("WZWipButtonOver", var_5_26)

	local function var_5_27()
		var_5_4:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_7:AnimateSequence("WZWipButtonOver")
		end

		var_5_9:AnimateSequence("WZWipButtonOver")
	end

	var_5_0._sequences.WZWipButtonOver = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5.5
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipButtonUp", var_5_29)

	local var_5_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("WZWipButtonUp", var_5_30)

	local function var_5_31()
		var_5_4:AnimateSequence("WZWipButtonUp")
		var_5_9:AnimateSequence("WZWipButtonUp")
	end

	var_5_0._sequences.WZWipButtonUp = var_5_31

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("HorizontalMinimalScrollbarSliderArea", HorizontalMinimalScrollbarSliderArea)
LockTable(_M)
