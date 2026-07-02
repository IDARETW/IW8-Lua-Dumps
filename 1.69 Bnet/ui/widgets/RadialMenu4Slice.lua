module(..., package.seeall)

local var_0_0 = 400

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.index)

	local var_1_0 = (270 + arg_1_2.index * 90) % 360 - 90

	arg_1_0.KillstreakIcon:SetZRotation(-var_1_0)

	local function var_1_1()
		local var_2_0 = arg_1_0:getParent()
		local var_2_1 = false

		if var_2_0 and var_2_0._currentSelectionIndex == arg_1_2.index then
			var_2_1 = true
		end

		if arg_1_0:GetDataSource().isActive:GetValue(arg_1_1) == 1 then
			if var_2_1 then
				ACTIONS.AnimateSequence(arg_1_0, "AvailableSelected")
			else
				ACTIONS.AnimateSequence(arg_1_0, "Available")
			end
		elseif var_2_1 then
			ACTIONS.AnimateSequence(arg_1_0, "UnavailableSelected")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Unavailable")
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "index", var_1_1, true)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "isActive", var_1_1, true)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "isSlotSelected", var_1_1, true)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "currentScore", var_1_1, true)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "relativeCost", var_1_1, true)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "remainingPoints", var_1_1, true)
	arg_1_0:addEventHandler("input_method_changed", var_1_1)

	function arg_1_0.widgetAction()
		local var_3_0 = arg_1_0:getParent()

		if arg_1_0:GetDataSource().isActive:GetValue(arg_1_1) == 1 then
			Engine.EBHIFJCGBH("streak_select", arg_1_0.streakIndex)
			ACTIONS.AnimateSequence(arg_1_0, "Pulse")
			Engine.BJDBIAGIDA(SOUND_SETS.inGame.wheelConfirm)

			if var_3_0._closeRadialWidgetOverride then
				arg_1_0:Wait(var_0_0).onComplete = function()
					var_3_0:SetAlpha(0)
				end
			end
		elseif var_3_0._closeRadialWidgetOverride then
			var_3_0:SetAlpha(0)
		end
	end
end

function RadialMenu4Slice(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_5_0.id = "RadialMenu4Slice"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "ExpandedImage"

	var_5_4:SetAlpha(0, 0)
	var_5_4:setImage(RegisterMaterial("radial_expanded_kbm_4"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -609, _1080p * -97)
	var_5_0:addElement(var_5_4)

	var_5_0.ExpandedImage = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "RadialSonar"

	var_5_6:SetRGBFromTable(SWATCHES.scorestreakButton.unavailable, 0)
	var_5_6:SetAlpha(0.25, 0)
	var_5_6:setImage(RegisterMaterial("radial_4slice_sonar"), 0)
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
	var_5_8:setImage(RegisterMaterial("radial_4slice_sonar"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
	var_5_0:addElement(var_5_8)

	var_5_0.RadialTexture = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "RadialHighlight"

	var_5_10:SetAlpha(0.15, 0)
	var_5_10:SetColorOp(COLOR_OP.saturation, 0)
	var_5_10:setImage(RegisterMaterial("radial_4slice_selected_unavailable"), 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
	var_5_0:addElement(var_5_10)

	var_5_0.RadialHighlight = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "KillstreakIcon"

	var_5_12:SetRGBFromTable(SWATCHES.scorestreakButton.unavailable, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 306, _1080p * 18, _1080p * 118)

	local function var_5_13()
		local var_6_0 = var_5_0:GetDataSource().icon:GetValue(var_5_1)

		if var_6_0 ~= nil then
			var_5_12:setImage(RegisterMaterial(var_6_0), 0)
		end
	end

	var_5_12:SubscribeToModelThroughElement(var_5_0, "icon", var_5_13)
	var_5_0:addElement(var_5_12)

	var_5_0.KillstreakIcon = var_5_12

	local function var_5_14()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_14

	local var_5_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Available", var_5_15)

	local var_5_16 = {
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

	var_5_8:RegisterAnimationSequence("Available", var_5_16)

	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_4slice_available")
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

	var_5_10:RegisterAnimationSequence("Available", var_5_17)

	local var_5_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_12:RegisterAnimationSequence("Available", var_5_18)

	local function var_5_19()
		var_5_4:AnimateSequence("Available")
		var_5_8:AnimateSequence("Available")
		var_5_10:AnimateSequence("Available")
		var_5_12:AnimateSequence("Available")
	end

	var_5_0._sequences.Available = var_5_19

	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Unavailable", var_5_20)

	local var_5_21 = {
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

	var_5_6:RegisterAnimationSequence("Unavailable", var_5_21)

	local var_5_22 = {
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

	var_5_8:RegisterAnimationSequence("Unavailable", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_4slice_selected_unavailable")
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

	var_5_10:RegisterAnimationSequence("Unavailable", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_12:RegisterAnimationSequence("Unavailable", var_5_24)

	local function var_5_25()
		var_5_4:AnimateSequence("Unavailable")
		var_5_6:AnimateSequence("Unavailable")
		var_5_8:AnimateSequence("Unavailable")
		var_5_10:AnimateSequence("Unavailable")
		var_5_12:AnimateSequence("Unavailable")
	end

	var_5_0._sequences.Unavailable = var_5_25

	local var_5_26 = {
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

	var_5_8:RegisterAnimationSequence("AvailableSelected", var_5_26)

	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_4slice_selected_available")
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

	var_5_10:RegisterAnimationSequence("AvailableSelected", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_12:RegisterAnimationSequence("AvailableSelected", var_5_28)

	local function var_5_29()
		var_5_8:AnimateSequence("AvailableSelected")
		var_5_10:AnimateSequence("AvailableSelected")
		var_5_12:AnimateSequence("AvailableSelected")
	end

	var_5_0._sequences.AvailableSelected = var_5_29

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

	var_5_6:RegisterAnimationSequence("UnavailableSelected", var_5_30)

	local var_5_31 = {
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

	var_5_8:RegisterAnimationSequence("UnavailableSelected", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("radial_4slice_selected_unavailable")
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

	var_5_10:RegisterAnimationSequence("UnavailableSelected", var_5_32)

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.scorestreakButton.unavailable
		}
	}

	var_5_12:RegisterAnimationSequence("UnavailableSelected", var_5_33)

	local function var_5_34()
		var_5_6:AnimateSequence("UnavailableSelected")
		var_5_8:AnimateSequence("UnavailableSelected")
		var_5_10:AnimateSequence("UnavailableSelected")
		var_5_12:AnimateSequence("UnavailableSelected")
	end

	var_5_0._sequences.UnavailableSelected = var_5_34

	local var_5_35 = {
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

	var_5_6:RegisterAnimationSequence("Pulse", var_5_35)

	local var_5_36 = {
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

	var_5_12:RegisterAnimationSequence("Pulse", var_5_36)

	local function var_5_37()
		var_5_6:AnimateSequence("Pulse")
		var_5_12:AnimateSequence("Pulse")
	end

	var_5_0._sequences.Pulse = var_5_37

	local var_5_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ExpandedSelection", var_5_38)

	local function var_5_39()
		var_5_4:AnimateSequence("ExpandedSelection")
	end

	var_5_0._sequences.ExpandedSelection = var_5_39

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("RadialMenu4Slice", RadialMenu4Slice)
LockTable(_M)
