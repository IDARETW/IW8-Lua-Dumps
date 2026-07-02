module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Dvar.BJJCJHDBII("NMRKMSMTOO")
	local var_1_1 = LUI.clamp(var_1_0, SliderBounds.Brightness.DvarMin, SliderBounds.Brightness.DvarMax) + arg_1_0.colorModifier
	local var_1_2 = LUI.clamp(var_1_1, 0, 1)

	arg_1_0.Background:SetRGBFromTable({
		r = var_1_2,
		g = var_1_2,
		b = var_1_2
	})
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.CalibrationGuide)
	arg_2_0:SetAlpha(0)
	arg_2_0:addEventHandler("brightness_over", function(arg_3_0, arg_3_1)
		arg_2_0:SetAlpha(1)
		arg_2_0:dispatchEventToChildren({
			name = "calibration_updated"
		})
	end)
	arg_2_0:addEventHandler("brightness_up", function(arg_4_0, arg_4_1)
		arg_2_0:SetAlpha(0)
	end)
	arg_2_0:addEventHandler("brightness_updated", function(arg_5_0, arg_5_1)
		arg_2_0:dispatchEventToChildren({
			name = "calibration_updated"
		})
	end)
	arg_2_0.CalibrationGuide:SetSwatchUpdateHandler(var_0_0)

	local var_2_0 = Engine.FFFHHEJDI()

	arg_2_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier = arg_2_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier + var_2_0
end

function BrightnessGuide(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 750 * _1080p, 0, 250 * _1080p)

	var_6_0.id = "BrightnessGuide"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("CalibrationGuide", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "CalibrationGuide"

	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 750, 0, _1080p * 250)
	var_6_0:addElement(var_6_4)

	var_6_0.CalibrationGuide = var_6_4

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)
	ACTIONS.SetAlpha(var_6_0, 0, 0, 0)

	return var_6_0
end

MenuBuilder.registerType("BrightnessGuide", BrightnessGuide)
LockTable(_M)
