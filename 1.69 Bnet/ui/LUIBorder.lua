LUI.UIBorder = LUI.Class(LUI.UIElement)

function LUI.UIBorder.init(arg_1_0, arg_1_1)
	LUI.UIBorder.super.init(arg_1_0, arg_1_1)
	arg_1_0:SetupBorder(arg_1_1)
end

LUI.UIBorder.id = "LUIBorder"
