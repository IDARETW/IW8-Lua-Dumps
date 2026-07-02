module(..., package.seeall)

function PipsWithNavigation(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "PipsWithNavigation"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "BG"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -70, _1080p * 70, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BG = var_1_4

	local var_1_5
	local var_1_6 = {
		spacing = _1080p * 6,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Center,
		buildPip = function()
			return MenuBuilder.BuildRegisteredType("Pip", {
				controllerIndex = var_1_1
			})
		end,
		controllerIndex = var_1_1
	}
	local var_1_7 = LUI.Pips.new(var_1_6)

	var_1_7.id = "Pips"

	var_1_7:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -50, _1080p * 50, _1080p * -16, _1080p * -12)
	var_1_0:addElement(var_1_7)

	var_1_0.Pips = var_1_7

	local var_1_8
	local var_1_9 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_1_1
	}
	local var_1_10 = MenuBuilder.BuildRegisteredType("IconImage", var_1_9)

	var_1_10.id = "RightTrigger"

	var_1_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -48, _1080p * -24, _1080p * -11, _1080p * 13)
	var_1_0:addElement(var_1_10)

	var_1_0.RightTrigger = var_1_10

	local var_1_11
	local var_1_12 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_1_1
	}
	local var_1_13 = MenuBuilder.BuildRegisteredType("IconImage", var_1_12)

	var_1_13.id = "LeftTrigger"

	var_1_13:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_13:SetAlpha(0, 0)
	var_1_13:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 24, _1080p * 48, _1080p * -11, _1080p * 13)
	var_1_0:addElement(var_1_13)

	var_1_0.LeftTrigger = var_1_13

	return var_1_0
end

MenuBuilder.registerType("PipsWithNavigation", PipsWithNavigation)
LockTable(_M)
