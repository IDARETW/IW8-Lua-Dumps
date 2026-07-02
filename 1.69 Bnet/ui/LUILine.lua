LUI.UILine = LUI.Class(LUI.UIElement)
LUI.UILine.START = 0
LUI.UILine.END = 1

function LUI.UILine.init(arg_1_0)
	LUI.UILine.super.init(arg_1_0)
	arg_1_0:SetupLine()
end

function LUI.UILine.SetVertexPosition(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7)
	assert(arg_2_1 == LUI.UILine.START or arg_2_1 == LUI.UILine.END)

	if arg_2_1 == 0 then
		arg_2_0:SetLeftAnchor(arg_2_2, arg_2_6, arg_2_7)
		arg_2_0:SetTopAnchor(arg_2_3, arg_2_6, arg_2_7)
		arg_2_0:SetLeft(arg_2_4, arg_2_6, arg_2_7)

		return arg_2_0:SetTop(arg_2_5, arg_2_6, arg_2_7)
	else
		arg_2_0:SetRightAnchor(1 - arg_2_2, arg_2_6, arg_2_7)
		arg_2_0:SetBottomAnchor(1 - arg_2_3, arg_2_6, arg_2_7)
		arg_2_0:SetRight(arg_2_4, arg_2_6, arg_2_7)

		return arg_2_0:SetBottom(arg_2_5, arg_2_6, arg_2_7)
	end
end

LUI.UILine.id = "LUILine"
