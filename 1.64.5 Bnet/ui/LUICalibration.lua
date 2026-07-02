LUI.Calibration = LUI.Class(LUI.UIElement)

function LUI.Calibration.init(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}

	LUI.Calibration.super.init(arg_1_0, arg_1_1)
	arg_1_0:SetupCalibration(arg_1_1)
end

LUI.Calibration.id = "LUICalibration"

MenuBuilder.registerType("Calibration", function(arg_2_0, arg_2_1)
	return LUI.Calibration.new(arg_2_1)
end)
