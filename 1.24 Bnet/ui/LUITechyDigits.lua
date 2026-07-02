LUI.UITechyDigits = LUI.Class(LUI.UIText)

function LUI.UITechyDigits.build(arg_1_0, arg_1_1)
	return (LUI.UITechyDigits.new(arg_1_1))
end

function LUI.UITechyDigits.init(arg_2_0, arg_2_1)
	arg_2_1 = arg_2_1 or {}

	LUI.UIText.init(arg_2_0)

	if LUI.UIElement.setupTechyDigits then
		arg_2_0:setupTechyDigits()
	end

	arg_2_0.digits = arg_2_1.digits or 8
	arg_2_0.minValue = arg_2_1.minValue or 0
	arg_2_0.maxValue = arg_2_1.maxValue or 99999999
	arg_2_0.longWait = arg_2_1.longWait or 340
	arg_2_0.shortWaitMin = arg_2_1.shortWaitMin or 20
	arg_2_0.shortWaitMax = arg_2_1.shortWaitMax or 60
	arg_2_0.pulsesMin = arg_2_1.pulsesMin or 3
	arg_2_0.pulsesMax = arg_2_1.pulsesMax or 7
end

LUI.UITechyDigits.id = "UITechyDigits"
