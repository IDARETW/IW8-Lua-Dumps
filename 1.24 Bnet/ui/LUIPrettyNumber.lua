LUI.UIPrettyNumber = LUI.Class(LUI.UIText)

function LUI.UIPrettyNumber.init(arg_1_0, arg_1_1)
	assert(arg_1_1)
	assert(type(arg_1_1.speed) == "number")
	assert(type(arg_1_1.initialValue) == "number")
	assert(not arg_1_1.precision or type(arg_1_1.precision) == "number")

	arg_1_1.precision = arg_1_1.precision or 1

	LUI.UIText.init(arg_1_0)

	arg_1_0.id = "UIPrettyNumber"

	if arg_1_0.setupPrettyNumber then
		arg_1_0:setupPrettyNumber(arg_1_1.speed, arg_1_1.initialValue, arg_1_1.precision)
	end
end
