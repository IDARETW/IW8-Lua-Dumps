LUI.DebugLayer = LUI.Class(LUI.UIElement)

function LUI.DebugLayer.GetInstance(arg_1_0)
	local var_1_0 = Engine.DBFFAEEFGJ()

	assert(var_1_0)

	local var_1_1 = var_1_0.debugLayer

	assert(var_1_1)

	return var_1_1
end

function LUI.DebugLayer.init(arg_2_0, arg_2_1)
	LUI.DebugLayer.super.init(arg_2_0)

	arg_2_0.id = "DebugLayer"

	assert(arg_2_1.controllerIndex)

	arg_2_0._controllerIndex = arg_2_1.controllerIndex
end

function LUI.DebugLayer.ShouldBeVisible(arg_3_0)
	return Debug.CHFBFDCHBA()
end

function LUI.DebugLayer.InitLayer(arg_4_0)
	arg_4_0.DebugLayerWidget = MenuBuilder.BuildRegisteredType("DebugLayerWidget", {
		controllerIndex = arg_4_0._controllerIndex
	})
	arg_4_0.DebugLayerWidget.id = "DebugLayerWidget"

	arg_4_0:addElement(arg_4_0.DebugLayerWidget)
end

function LUI.DebugLayer.ClearLayer(arg_5_0, arg_5_1)
	arg_5_0:closeChildren()
end
