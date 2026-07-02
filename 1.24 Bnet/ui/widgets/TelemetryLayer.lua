LUI.TelemetryLayer = LUI.Class(LUI.UIElement)

function LUI.TelemetryLayer.ShouldBeVisible(arg_1_0)
	if Engine.CGABICJHAI() then
		return true
	end
end

function LUI.TelemetryLayer.TrapsInput(arg_2_0)
	return false
end

function LUI.TelemetryLayer.InitLayer(arg_3_0)
	local var_3_0
	local var_3_1 = MenuBuilder.BuildRegisteredType("TelemetryContainer", {
		controllerIndex = arg_3_0._controllerIndex
	})

	var_3_1.id = "TelemetryContainer"
	arg_3_0.TelemetryContainer = var_3_1

	local var_3_2 = 5 * _1080p

	arg_3_0.TelemetryContainer:SetLeft(var_3_2)
	arg_3_0:addElement(var_3_1)
end

function LUI.TelemetryLayer.init(arg_4_0, arg_4_1)
	LUI.UIElement.init(arg_4_0)

	arg_4_0._controllerIndex = arg_4_1.controllerIndex or Engine.IJEBHJIJF()
	arg_4_0.id = "TelemetryLayer"
end

function LUI.TelemetryLayer.ClearLayer(arg_5_0, arg_5_1)
	arg_5_0:closeChildren()
end

function LUI.TelemetryLayer.GetLayer()
	return Engine.DBFFAEEFGJ().telemetryLayer
end
