LUI.UIText = LUI.Class(LUI.UIElement)

function LUI.UIText.build(arg_1_0, arg_1_1)
	return (LUI.UIText.new())
end

function LUI.UIText.init(arg_2_0)
	LUI.UIElement.init(arg_2_0)
	arg_2_0:setupUIText()
end

function LUI.UIText.setText(arg_3_0, arg_3_1, arg_3_2)
	return arg_3_0:setTextInC(arg_3_1, arg_3_2)
end

function LUI.UIText.setTextStyle(arg_4_0, arg_4_1)
	arg_4_0.m_textStyle = arg_4_1
end

function LUI.UIText.GetDebuggerInfo(arg_5_0, arg_5_1)
	LUI.UIElement.GetDebuggerInfo(arg_5_0, arg_5_1)

	local var_5_0 = "LUIText = {"
	local var_5_1 = arg_5_0:getText()

	var_5_1 = var_5_1 and var_5_1 or ""

	local var_5_2 = (var_5_0 .. "text = '" .. var_5_1 .. "',") .. "fontSize = " .. arg_5_0:GetFontSize() .. ","
	local var_5_3 = arg_5_0:GetWordWrap() and "true" or "false"
	local var_5_4 = (var_5_2 .. "wordWrap = " .. var_5_3 .. ",") .. "}"

	arg_5_1[#arg_5_1 + 1] = var_5_4
end

LUI.UIText.id = "LUIText"
