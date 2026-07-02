LUI.UIScoreboardRow = LUI.Class(LUI.UIElement)

function LUI.UIScoreboardRow.build(arg_1_0, arg_1_1)
	return (LUI.UIScoreboardRow.new())
end

function LUI.UIScoreboardRow.init(arg_2_0)
	LUI.UIElement.init(arg_2_0)
	arg_2_0:SetupScoreboardRow()
end

LUI.UIScoreboardRow.id = "LUIScoreboardRow"
