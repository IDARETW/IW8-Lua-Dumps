LUI.UIRepeatedImage = LUI.Class(LUI.UIElement)

function LUI.UIRepeatedImage.build(arg_1_0, arg_1_1)
	return (LUI.UIRepeatedImage.new())
end

function LUI.UIRepeatedImage.init(arg_2_0)
	LUI.UIElement.init(arg_2_0)
	arg_2_0:SetupRepeatedImage()
end

LUI.UIRepeatedImage.id = "LUIRepeatedImage"
