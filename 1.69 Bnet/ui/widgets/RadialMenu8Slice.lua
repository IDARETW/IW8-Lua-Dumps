module(..., package.seeall)

local var_0_0 = 400

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.index)

	local var_1_0 = (270 + arg_1_2.index * 45) % 360 - 90

	arg_1_0.Icon:SetZRotation(-var_1_0)

	local function var_1_1()
		local var_2_0 = arg_1_0:getParent()
		local var_2_1 = false

		if var_2_0 and var_2_0._currentSelectionIndex == arg_1_2.index then
			var_2_1 = true
		end

		if var_2_1 then
			ACTIONS.AnimateSequence(arg_1_0, "AvailableSelected")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Available")
		end
	end

	arg_1_0:addEventHandler("input_method_changed", var_1_1)

	function arg_1_0.widgetAction()
		local var_3_0 = arg_1_0:getParent()

		if arg_1_0._itemIndex ~= -1 then
			if arg_1_0._lootType == LOOT.itemTypes.GESTURES then
				Engine.EBHIFJCGBH("radial_menu_selection_gesture", arg_1_0._itemIndex)
			elseif arg_1_0._lootType == LOOT.itemTypes.SPRAYS then
				Engine.EBHIFJCGBH("radial_menu_selection_spray", arg_1_0._itemIndex)
			end

			ACTIONS.AnimateSequence(arg_1_0, "Pulse")

			if var_3_0._closeRadialWidgetOverride then
				arg_1_0:Wait(var_0_0).onComplete = function()
					var_3_0:SetAlpha(0)

					if CONDITIONS.IsBRTutorialMap(arg_1_0) then
						Engine.EBHIFJCGBH("radial_menu_active", 0)
					end
				end
			end
		else
			var_3_0:SetAlpha(0)

			if CONDITIONS.IsBRTutorialMap(arg_1_0) then
				Engine.EBHIFJCGBH("radial_menu_active", 0)
			end
		end
	end
end

function RadialMenu8Slice(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_5_0.id = "RadialMenu8Slice"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "ExpandedImage"

	var_5_4:setImage(RegisterMaterial("radial_expanded_kbm_8"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 252, _1080p * -250, _1080p * -694, _1080p * -192)
	var_5_0:addElement(var_5_4)

	var_5_0.ExpandedImage = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "RadialSonar"

	var_5_6:SetRGBFromTable(SWATCHES.scorestreakButton.unavailable, 0)
	var_5_6:SetAlpha(0.25, 0)
	var_5_6:setImage(RegisterMaterial("radial_8slice_sonar"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
	var_5_0:addElement(var_5_6)

	var_5_0.RadialSonar = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "RadialTexture"

	var_5_8:SetRGBFromTable(SWATCHES.scorestreakButton.unavailable, 0)
	var_5_8:SetAlpha(0.25, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.5, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:setImage(RegisterMaterial("radial_8slice_sonar"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
	var_5_0:addElement(var_5_8)

	var_5_0.RadialTexture = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "RadialHighlight"

	var_5_10:SetAlpha(0.15, 0)
	var_5_10:SetColorOp(COLOR_OP.saturation, 0)
	var_5_10:setImage(RegisterMaterial("radial_8slice_selected_unavailable"), 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
	var_5_0:addElement(var_5_10)

	var_5_0.RadialHighlight = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Icon"

	var_5_12:SetRGBFromTable(SWATCHES.scorestreakButton.unavailable, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 306, _1080p * 18, _1080p * 118)
	var_5_0:addElement(var_5_12)

	var_5_0.Icon = var_5_12

	local function var_5_13()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_13

	local var_5_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Available", var_5_14)

	local var_5_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Available", var_5_15)

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_8slice_available")
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_5_10:RegisterAnimationSequence("Available", var_5_16)

	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_12:RegisterAnimationSequence("Available", var_5_17)

	local function var_5_18()
		var_5_4:AnimateSequence("Available")
		var_5_8:AnimateSequence("Available")
		var_5_10:AnimateSequence("Available")
		var_5_12:AnimateSequence("Available")
	end

	var_5_0._sequences.Available = var_5_18

	local var_5_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Unavailable", var_5_19)

	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_6:RegisterAnimationSequence("Unavailable", var_5_20)

	local var_5_21 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_8:RegisterAnimationSequence("Unavailable", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_8slice_selected_unavailable")
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_5_10:RegisterAnimationSequence("Unavailable", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_12:RegisterAnimationSequence("Unavailable", var_5_23)

	local function var_5_24()
		var_5_4:AnimateSequence("Unavailable")
		var_5_6:AnimateSequence("Unavailable")
		var_5_8:AnimateSequence("Unavailable")
		var_5_10:AnimateSequence("Unavailable")
		var_5_12:AnimateSequence("Unavailable")
	end

	var_5_0._sequences.Unavailable = var_5_24

	local var_5_25 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_5_8:RegisterAnimationSequence("AvailableSelected", var_5_25)

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_8slice_selected_available")
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_5_10:RegisterAnimationSequence("AvailableSelected", var_5_26)

	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_12:RegisterAnimationSequence("AvailableSelected", var_5_27)

	local function var_5_28()
		var_5_8:AnimateSequence("AvailableSelected")
		var_5_10:AnimateSequence("AvailableSelected")
		var_5_12:AnimateSequence("AvailableSelected")
	end

	var_5_0._sequences.AvailableSelected = var_5_28

	local var_5_29 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_6:RegisterAnimationSequence("UnavailableSelected", var_5_29)

	local var_5_30 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_8:RegisterAnimationSequence("UnavailableSelected", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_8slice_selected_unavailable")
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_5_10:RegisterAnimationSequence("UnavailableSelected", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_12:RegisterAnimationSequence("UnavailableSelected", var_5_32)

	local function var_5_33()
		var_5_6:AnimateSequence("UnavailableSelected")
		var_5_8:AnimateSequence("UnavailableSelected")
		var_5_10:AnimateSequence("UnavailableSelected")
		var_5_12:AnimateSequence("UnavailableSelected")
	end

	var_5_0._sequences.UnavailableSelected = var_5_33

	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 7985663,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_6:RegisterAnimationSequence("Pulse", var_5_34)

	local var_5_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Pulse", var_5_35)

	local function var_5_36()
		var_5_6:AnimateSequence("Pulse")
		var_5_12:AnimateSequence("Pulse")
	end

	var_5_0._sequences.Pulse = var_5_36

	local var_5_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ExpandedSelection", var_5_37)

	local function var_5_38()
		var_5_4:AnimateSequence("ExpandedSelection")
	end

	var_5_0._sequences.ExpandedSelection = var_5_38

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("RadialMenu8Slice", RadialMenu8Slice)
LockTable(_M)
