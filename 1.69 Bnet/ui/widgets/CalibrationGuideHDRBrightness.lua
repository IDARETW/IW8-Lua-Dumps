module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Swatch0)
	assert(arg_1_0.Swatch1)
	assert(arg_1_0.Swatch2)
	assert(arg_1_0.Swatch3)
	assert(arg_1_0.Swatch4)

	local var_1_0
	local var_1_1
	local var_1_2
	local var_1_3 = 0.05
	local var_1_4 = 0.3
	local var_1_5 = var_1_4 - var_1_3
	local var_1_6 = var_1_4 + var_1_3

	arg_1_0.Swatch0.Icon:SetRGBFromTable({
		r = var_1_6,
		g = var_1_6,
		b = var_1_6
	})
	arg_1_0.Swatch0.Background:SetRGBFromTable({
		r = var_1_5,
		g = var_1_5,
		b = var_1_5
	})

	local var_1_7 = 0.4
	local var_1_8 = var_1_7 - var_1_3
	local var_1_9 = var_1_7 + var_1_3

	arg_1_0.Swatch1.Icon:SetRGBFromTable({
		r = var_1_9,
		g = var_1_9,
		b = var_1_9
	})
	arg_1_0.Swatch1.Background:SetRGBFromTable({
		r = var_1_8,
		g = var_1_8,
		b = var_1_8
	})

	local var_1_10 = 0.5
	local var_1_11 = var_1_10 - var_1_3
	local var_1_12 = var_1_10 + var_1_3

	arg_1_0.Swatch2.Icon:SetRGBFromTable({
		r = var_1_12,
		g = var_1_12,
		b = var_1_12
	})
	arg_1_0.Swatch2.Background:SetRGBFromTable({
		r = var_1_11,
		g = var_1_11,
		b = var_1_11
	})

	local var_1_13 = 0.6
	local var_1_14 = var_1_13 - var_1_3
	local var_1_15 = var_1_13 + var_1_3

	arg_1_0.Swatch3.Icon:SetRGBFromTable({
		r = var_1_15,
		g = var_1_15,
		b = var_1_15
	})
	arg_1_0.Swatch3.Background:SetRGBFromTable({
		r = var_1_14,
		g = var_1_14,
		b = var_1_14
	})

	local var_1_16 = 0.7
	local var_1_17 = var_1_16 - var_1_3
	local var_1_18 = var_1_16 + var_1_3

	arg_1_0.Swatch4.Icon:SetRGBFromTable({
		r = var_1_18,
		g = var_1_18,
		b = var_1_18
	})
	arg_1_0.Swatch4.Background:SetRGBFromTable({
		r = var_1_17,
		g = var_1_17,
		b = var_1_17
	})
end

function CalibrationGuideHDRBrightness(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 750 * _1080p, 0, 150 * _1080p)

	var_2_0.id = "CalibrationGuideHDRBrightness"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("CalibrationSwatchHDRBrightness", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Swatch0"

	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 150)
	var_2_0:addElement(var_2_4)

	var_2_0.Swatch0 = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("CalibrationSwatchHDRBrightness", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "Swatch1"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 300, 0, _1080p * 150)
	var_2_0:addElement(var_2_6)

	var_2_0.Swatch1 = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("CalibrationSwatchHDRBrightness", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "Swatch2"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 450, 0, _1080p * 150)
	var_2_0:addElement(var_2_8)

	var_2_0.Swatch2 = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("CalibrationSwatchHDRBrightness", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "Swatch3"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 450, _1080p * 600, 0, _1080p * 150)
	var_2_0:addElement(var_2_10)

	var_2_0.Swatch3 = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("CalibrationSwatchHDRBrightness", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "Swatch4"

	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 600, _1080p * 750, 0, _1080p * 150)
	var_2_0:addElement(var_2_12)

	var_2_0.Swatch4 = var_2_12

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CalibrationGuideHDRBrightness", CalibrationGuideHDRBrightness)
LockTable(_M)
