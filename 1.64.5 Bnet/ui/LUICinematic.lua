LUI.Cinematic = LUI.Class(LUI.UIElement)

function LUI.Cinematic.init(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}

	LUI.Cinematic.super.init(arg_1_0, arg_1_1)
	arg_1_0:SetupCinematic(arg_1_1)
end

LUI.Cinematic.id = "LUICinematic"

MenuBuilder.registerType("Cinematic", function(arg_2_0, arg_2_1)
	return LUI.Cinematic.new(arg_2_1)
end)
