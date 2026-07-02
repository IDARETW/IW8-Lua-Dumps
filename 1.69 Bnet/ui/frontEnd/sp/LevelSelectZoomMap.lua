module(..., package.seeall)

function LevelSelectZoomMap(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 68 * _1080p)

	var_1_0.id = "LevelSelectZoomMap"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "LowResMap"

	var_1_4:SetRGBFromTable(SWATCHES.itemCard.background, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("campaign_urzikstan_map_low_res"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1114, _1080p * -90, _1080p * -498, _1080p * 14)
	var_1_0:addElement(var_1_4)

	var_1_0.LowResMap = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Map"

	var_1_6:SetRGBFromTable(SWATCHES.itemCard.background, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_6:setImage(RegisterMaterial("campaign_urzikstan_map"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1114, _1080p * -90, _1080p * -498, _1080p * 14)
	var_1_0:addElement(var_1_6)

	var_1_0.Map = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Frame"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("campaign_world_map_zoom_frame"), 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1114, _1080p * -90, _1080p * -498, _1080p * 14)
	var_1_0:addElement(var_1_8)

	var_1_0.Frame = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "RegionName"

	var_1_10:SetAlpha(0, 0)
	var_1_10:setText(Engine.CBBHFCGDIC("LEVELS/URZIKSTAN"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetTracking(5 * _1080p, 0)
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetDecodeLetterLength(24)
	var_1_10:SetDecodeMaxRandChars(12)
	var_1_10:SetDecodeUpdatesPerLetter(4)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -1046, _1080p * -546, _1080p * -497, _1080p * -473)
	var_1_0:addElement(var_1_10)

	var_1_0.RegionName = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			value = -0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			value = -0.7,
			duration = 50,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -662.5,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 361.5,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -316.5,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 195.5,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 135,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -377,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 211,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -813,
			easing = LUI.EASING.snap
		},
		{
			value = -0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			value = -0.2,
			duration = 50,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -963.5,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60.5,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -437.5,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 74.5,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -498,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1114,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -90,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ZoomIn", var_1_12)

	local var_1_13 = {
		{
			value = 0,
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
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ZoomIn", var_1_13)

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_1_8:RegisterAnimationSequence("ZoomIn", var_1_14)

	local var_1_15 = {
		{
			value = 0.4,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_1_10:RegisterAnimationSequence("ZoomIn", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("ZoomIn")
		var_1_6:AnimateSequence("ZoomIn")
		var_1_8:AnimateSequence("ZoomIn")
		var_1_10:AnimateSequence("ZoomIn")
	end

	var_1_0._sequences.ZoomIn = var_1_16

	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1114
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -90
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -498
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -407.25,
			easing = LUI.EASING.snap
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 104.75,
			easing = LUI.EASING.snap
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -888.25,
			easing = LUI.EASING.snap
		},
		{
			value = -0.3,
			duration = 60,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 135.75,
			easing = LUI.EASING.snap
		},
		{
			value = -0.7,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -587.25,
			easing = LUI.EASING.snap
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 436.75,
			easing = LUI.EASING.snap
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -286.25,
			easing = LUI.EASING.snap
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 225.75,
			easing = LUI.EASING.snap
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256,
			easing = LUI.EASING.snap
		},
		{
			value = -0.8,
			duration = 20,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -512,
			easing = LUI.EASING.snap
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512,
			easing = LUI.EASING.snap
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256,
			easing = LUI.EASING.snap
		}
	}

	var_1_4:RegisterAnimationSequence("ZoomOut", var_1_17)

	local var_1_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ZoomOut", var_1_18)

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 320,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ZoomOut", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ZoomOut", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("ZoomOut")
		var_1_6:AnimateSequence("ZoomOut")
		var_1_8:AnimateSequence("ZoomOut")
		var_1_10:AnimateSequence("ZoomOut")
	end

	var_1_0._sequences.ZoomOut = var_1_21

	return var_1_0
end

MenuBuilder.registerType("LevelSelectZoomMap", LevelSelectZoomMap)
LockTable(_M)
