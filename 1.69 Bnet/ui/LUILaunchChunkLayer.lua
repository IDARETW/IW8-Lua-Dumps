LUI.LaunchChunkLayer = LUI.Class(LUI.UIElement)

function LUI.LaunchChunkLayer.init(arg_1_0, arg_1_1)
	LUI.LaunchChunkLayer.super.init(arg_1_0)

	arg_1_0.id = "LaunchChunkLayer"

	assert(arg_1_1.controllerIndex)

	arg_1_0._controllerIndex = arg_1_1.controllerIndex
end

function LUI.LaunchChunkLayer.ShouldBeVisible(arg_2_0)
	return CONDITIONS.IsLaunchChunk()
end

function LUI.LaunchChunkLayer.InitLayer(arg_3_0)
	arg_3_0.LaunchChunkWidget = MenuBuilder.BuildRegisteredType("LaunchChunkWidget", {
		controllerIndex = arg_3_0._controllerIndex
	})
	arg_3_0.LaunchChunkWidget.id = "LaunchChunkWidget"

	arg_3_0:addElement(arg_3_0.LaunchChunkWidget)
end

function LUI.LaunchChunkLayer.ClearLayer(arg_4_0, arg_4_1)
	arg_4_0:closeChildren()
end
