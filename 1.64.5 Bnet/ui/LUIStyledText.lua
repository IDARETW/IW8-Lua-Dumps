LUI.UIStyledText = LUI.Class(LUI.UIText)
LUI.UIStyledText.AutoScrollStyle = {
	ScrollH = 1,
	ScrollV = 2,
	None = 0
}
ELLIPSES = {
	enabled_default = 2,
	enabled = 1,
	disabled = 0
}

function LUI.UIStyledText.init(arg_1_0)
	LUI.UIStyledText.super.init(arg_1_0)
	arg_1_0:SetupStyledText()
end

function LUI.UIStyledText.SetDecodeParams(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0:SetDecodeLetterLength(arg_2_1)
	arg_2_0:SetDecodeMaxRandChars(arg_2_2)
	arg_2_0:SetDecodeUpdatesPerLetter(arg_2_3)
end

function LUI.UIStyledText.setText(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:TextUpdate()

	return LUI.UIStyledText.super.setText(arg_3_0, arg_3_1, arg_3_2)
end

LUI.UIStyledText.id = "LUIStyledText"
