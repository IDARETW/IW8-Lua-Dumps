LUI.UIFPSCounter = LUI.Class(LUI.UIElement)

function LUI.UIFPSCounter.init(arg_1_0, arg_1_1)
	LUI.UIFPSCounter.super.init(arg_1_0, arg_1_1)
	arg_1_0:SetupFPSCounter(arg_1_1)
end

LUI.UIFPSCounter.id = "LUIFPSCounter"
