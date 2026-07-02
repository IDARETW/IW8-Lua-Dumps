module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.CalibrationGuide)
	arg_1_0:SetAlpha(0)
	arg_1_0:addEventHandler("brightness_over", function(arg_2_0, arg_2_1)
		arg_1_0:SetAlpha(1)
	end)
	arg_1_0:addEventHandler("brightness_up", function(arg_3_0, arg_3_1)
		arg_1_0:SetAlpha(0)
	end)
end

function HDRBrightnessGuide(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 750 * _1080p, 0, 250 * _1080p)

	var_4_0.id = "HDRBrightnessGuide"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("CalibrationGuideHDRBrightness", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "CalibrationGuide"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 750, _1080p * 50, _1080p * 200)
	var_4_0:addElement(var_4_4)

	var_4_0.CalibrationGuide = var_4_4

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)
	ACTIONS.SetAlpha(var_4_0, 0, 0, 0)

	return var_4_0
end

MenuBuilder.registerType("HDRBrightnessGuide", HDRBrightnessGuide)
LockTable(_M)
