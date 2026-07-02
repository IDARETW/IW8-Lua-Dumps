module(..., package.seeall)

function TelemetryWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 190 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "TelemetryWidget"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.Objective.iconDark, 0)
	var_1_4:SetAlpha(0.65, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 192, 0, _1080p * 20)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("TelemetryLayout", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "TelemetryLayout"

	var_1_6.Name:setText("", 0)
	var_1_6.Info:setText("", 0)
	var_1_6.Unit:setText("", 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 190, _1080p * -4, _1080p * 21)
	var_1_0:addElement(var_1_6)

	var_1_0.TelemetryLayout = var_1_6

	return var_1_0
end

MenuBuilder.registerType("TelemetryWidget", TelemetryWidget)
LockTable(_M)
