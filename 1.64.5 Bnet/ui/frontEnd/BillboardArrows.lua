module(..., package.seeall)

function BillboardArrows(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 580 * _1080p)

	var_1_0.id = "BillboardArrows"
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

	var_1_4.id = "GradientRight"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_4:SetUMin(1, 0)
	var_1_4:SetUMax(0, 0)
	var_1_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -200, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.GradientRight = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "GradientLeft"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.5, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 200, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.GradientLeft = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "ArrowRight"

	var_1_8:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_1_8:SetAlpha(0.5, 0)
	var_1_8:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_1_8:SetUMin(1, 0)
	var_1_8:SetUMax(0, 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -106, _1080p * 10, _1080p * -88, _1080p * 28)
	var_1_0:addElement(var_1_8)

	var_1_0.ArrowRight = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "ArrowLeft"

	var_1_10:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_1_10:SetAlpha(0.5, 0)
	var_1_10:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -10, _1080p * 106, _1080p * -88, _1080p * 28)
	var_1_0:addElement(var_1_10)

	var_1_0.ArrowLeft = var_1_10

	local var_1_11
	local var_1_12 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_1_1
	}
	local var_1_13 = MenuBuilder.BuildRegisteredType("IconImage", var_1_12)

	var_1_13.id = "RightPrompt"

	var_1_13:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_1_13:setImage(RegisterMaterial("button_trigger_right"), 0)
	var_1_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -68, _1080p * -24, _1080p * 15, _1080p * 59)
	var_1_0:addElement(var_1_13)

	var_1_0.RightPrompt = var_1_13

	local var_1_14
	local var_1_15 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_1_1
	}
	local var_1_16 = MenuBuilder.BuildRegisteredType("IconImage", var_1_15)

	var_1_16.id = "LeftPrompt"

	var_1_16:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_1_16:setImage(RegisterMaterial("button_trigger_left"), 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 23, _1080p * 67, _1080p * 15, _1080p * 59)
	var_1_0:addElement(var_1_16)

	var_1_0.LeftPrompt = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_17

	local var_1_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Intro", var_1_18)

	local var_1_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Intro", var_1_19)

	local var_1_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_13:RegisterAnimationSequence("Intro", var_1_20)

	local var_1_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Intro", var_1_21)

	local function var_1_22()
		var_1_8:AnimateLoop("Intro")
		var_1_10:AnimateLoop("Intro")
		var_1_13:AnimateLoop("Intro")
		var_1_16:AnimateLoop("Intro")
	end

	var_1_0._sequences.Intro = var_1_22

	return var_1_0
end

MenuBuilder.registerType("BillboardArrows", BillboardArrows)
LockTable(_M)
