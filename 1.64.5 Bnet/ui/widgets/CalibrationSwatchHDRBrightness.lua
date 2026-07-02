module(..., package.seeall)

function CalibrationSwatchHDRBrightness(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p)

	var_1_0.id = "CalibrationSwatchHDRBrightness"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		displayMapping = true,
		controllerIndex = var_1_1
	}
	local var_1_5 = MenuBuilder.BuildRegisteredType("Calibration", var_1_4)

	var_1_5.id = "Background"

	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 135, _1080p * 15, _1080p * 135)
	var_1_0:addElement(var_1_5)

	var_1_0.Background = var_1_5

	local var_1_6
	local var_1_7 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
		controllerIndex = var_1_1
	})

	var_1_7.id = "Border"

	var_1_7.Left:SetRight(_1080p * 1, 0)
	var_1_7.Left:SetRGBFromInt(4210752, 0)
	var_1_7.Right:SetLeft(_1080p * -1, 0)
	var_1_7.Right:SetRGBFromInt(4210752, 0)
	var_1_7.Top:SetBottom(_1080p * 1, 0)
	var_1_7.Top:SetRGBFromInt(4210752, 0)
	var_1_7.Bottom:SetTop(_1080p * -1, 0)
	var_1_7.Bottom:SetRGBFromInt(4210752, 0)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 135, _1080p * 15, _1080p * 135)
	var_1_0:addElement(var_1_7)

	var_1_0.Border = var_1_7

	local var_1_8
	local var_1_9 = {
		displayMapping = true,
		controllerIndex = var_1_1
	}
	local var_1_10 = MenuBuilder.BuildRegisteredType("Calibration", var_1_9)

	var_1_10.id = "Icon"

	var_1_10:SetRGBFromInt(0, 0)
	var_1_10:setImage(RegisterMaterial("logo_cod_iw8"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 135, _1080p * 46, _1080p * 107)
	var_1_0:addElement(var_1_10)

	var_1_0.Icon = var_1_10

	return var_1_0
end

MenuBuilder.registerType("CalibrationSwatchHDRBrightness", CalibrationSwatchHDRBrightness)
LockTable(_M)
