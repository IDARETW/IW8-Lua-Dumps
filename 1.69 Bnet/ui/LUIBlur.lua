LUI.UIBlur = LUI.Class(LUI.UIElement)

function LUI.UIBlur.init(arg_1_0)
	LUI.UIBlur.super.init(arg_1_0)
	arg_1_0:SetupBlur()
end

LUI.UIBlur.id = "LUIBlur"
