LUI.UIImage = LUI.Class(LUI.UIElement)

function LUI.UIImage.build(arg_1_0, arg_1_1)
	return (LUI.UIImage.new())
end

function LUI.UIImage.init(arg_2_0)
	LUI.UIElement.init(arg_2_0)
	arg_2_0:setupUIImage()
end

LUI.UIImage.id = "LUIImage"
