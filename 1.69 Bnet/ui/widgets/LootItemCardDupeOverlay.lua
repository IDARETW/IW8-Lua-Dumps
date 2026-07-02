module(..., package.seeall)

function LootItemCardDupeOverlay(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 600 * _1080p)

	var_1_0.id = "LootItemCardDupeOverlay"
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

	var_1_4.id = "BlackOverlay"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.9, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BlackOverlay = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericBoxWithBorders", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Border"

	var_1_6.Fill:SetRGBFromInt(0, 0)
	var_1_6.Fill:SetAlpha(0.4, 0)
	var_1_6.Stroke:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_1_6.Stroke.Left:SetRight(_1080p * 1, 0)
	var_1_6.Stroke.Right:SetLeft(_1080p * -1, 0)
	var_1_6.Stroke.Top:SetBottom(_1080p * 1, 0)
	var_1_6.Stroke.Bottom:SetTop(_1080p * -1, 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -40, _1080p * 40)
	var_1_0:addElement(var_1_6)

	var_1_0.Border = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Text"

	var_1_8:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_1_8:setText(ToUpperCase(""), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -35, _1080p * 35)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "WhiteOverlay"

	var_1_10:SetAlpha(0, 0)
	var_1_10:SetPixelGridEnabled(true)
	var_1_10:SetPixelGridContrast(0.5, 0)
	var_1_10:SetPixelGridBlockWidth(2, 0)
	var_1_10:SetPixelGridBlockHeight(2, 0)
	var_1_10:SetPixelGridGutterWidth(1, 0)
	var_1_10:SetPixelGridGutterHeight(1, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.WhiteOverlay = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.98,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("PlayAnime", var_1_13)

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1,
			child = var_1_0.Border.Stroke.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1,
			child = var_1_0.Border.Stroke.Right
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 800,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1,
			child = var_1_0.Border.Stroke.Left
		},
		{
			duration = 800,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1,
			child = var_1_0.Border.Stroke.Right
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 400,
			easing = LUI.EASING.outCubic,
			child = var_1_0.Border.Stroke.Left
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1,
			child = var_1_0.Border.Stroke.Right
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1,
			easing = LUI.EASING.snap,
			child = var_1_0.Border.Stroke.Left
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -400,
			easing = LUI.EASING.snap,
			child = var_1_0.Border.Stroke.Right
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1,
			easing = LUI.EASING.inCubic,
			child = var_1_0.Border.Stroke.Right
		}
	}

	var_1_6:RegisterAnimationSequence("PlayAnime", var_1_14)

	local var_1_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/DUPLICATE"))
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("PlayAnime", var_1_15)

	local var_1_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0.1,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inCubic
		}
	}

	var_1_10:RegisterAnimationSequence("PlayAnime", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("PlayAnime")
		var_1_6:AnimateSequence("PlayAnime")
		var_1_8:AnimateSequence("PlayAnime")
		var_1_10:AnimateSequence("PlayAnime")
	end

	var_1_0._sequences.PlayAnime = var_1_17

	return var_1_0
end

MenuBuilder.registerType("LootItemCardDupeOverlay", LootItemCardDupeOverlay)
LockTable(_M)
