module(..., package.seeall)

local var_0_0 = 4 * _1080p

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2 or var_0_0

	arg_1_0:SetAlpha(1)
	arg_1_0.EventText:setText(arg_1_1)

	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.EventText)
	local var_1_2 = arg_1_0.EventText:GetCurrentAnchorsAndPositions().left + var_1_1 + var_1_0

	arg_1_0.Backer:SetRight(var_1_2)

	return var_1_2
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2 or var_0_0

	arg_2_0:SetAlpha(1)
	arg_2_0.EventText:setText(arg_2_1)
	arg_2_0.EventText:SetAlignment(LUI.Alignment.Right)

	local var_2_1 = LAYOUT.GetElementWidth(arg_2_0.Backer)
	local var_2_2 = LAYOUT.GetElementWidth(arg_2_0.Node)
	local var_2_3 = LAYOUT.GetTextWidth(arg_2_0.EventText)
	local var_2_4 = var_2_1 - var_2_3 - var_2_2

	arg_2_0.Backer:SetLeft(var_2_4 - var_2_0)
	arg_2_0.Node:SetLeft(var_2_4 - var_2_0)
	arg_2_0.Node:SetRight(var_2_4 - var_2_0 + var_2_2)

	return var_2_3 + var_2_2 + var_2_0
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_2 or var_0_0

	arg_3_0:SetAlpha(1)
	arg_3_0.EventText:setText(arg_3_1)

	local var_3_1 = LAYOUT.GetTextWidth(arg_3_0.EventText)
	local var_3_2 = arg_3_0.EventText:GetCurrentAnchorsAndPositions().left + var_3_1 + var_3_0

	arg_3_0.Backer:SetRight(var_3_2)

	local var_3_3 = LAYOUT.GetElementWidth(arg_3_0.Node)

	arg_3_0.Node:SetLeft(var_3_2 - var_3_3)
	arg_3_0.Node:SetRight(var_3_2)

	return var_3_2
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupEventBanner = var_0_1
	arg_4_0.SetupRightAlignedBanner = var_0_2
	arg_4_0.SetupAREventBanner = var_0_3
end

function EventBanner(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 30 * _1080p)

	var_5_0.id = "EventBanner"
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

	var_5_4.id = "Backer"

	var_5_4:SetRGBFromTable(SWATCHES.Frontend.LimitedTagSecondary, 0)
	var_5_4:SetAlpha(0.55, 0)
	var_5_4:SetPixelGridEnabled(true)
	var_5_4:SetPixelGridContrast(0.5, 0)
	var_5_4:SetPixelGridBlockWidth(2, 0)
	var_5_4:SetPixelGridBlockHeight(2, 0)
	var_5_4:SetPixelGridGutterWidth(1, 0)
	var_5_4:SetPixelGridGutterHeight(1, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 150, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Backer = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Node"

	var_5_6:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Node = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "EventText"

	var_5_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 9, _1080p * 146, _1080p * -10, _1080p * 10)
	var_5_0:addElement(var_5_8)

	var_5_0.EventText = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10
	local var_5_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_5_8:RegisterAnimationSequence("Big", var_5_11)

	local function var_5_12()
		var_5_8:AnimateSequence("Big")
	end

	var_5_0._sequences.Big = var_5_12

	local var_5_13
	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		}
	}

	var_5_6:RegisterAnimationSequence("AR", var_5_14)

	local var_5_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 143
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_15)

	local function var_5_16()
		var_5_6:AnimateSequence("AR")
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_16

	var_0_4(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("EventBanner", EventBanner)
LockTable(_M)
