module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.defaultSetupOptions = arg_1_1 or {}
end

local function var_0_1(arg_2_0)
	return arg_2_0.defaultSetupOptions
end

function UIAA_AimAssist(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or {}

	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "AA_AimAssist"

	var_3_0:SetupAA_AimAssist(arg_3_1)

	var_3_0.SetDefaultSetupOptions = var_0_0
	var_3_0.GetDefaultSetupOptions = var_0_1

	var_3_0:SetDefaultSetupOptions(arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AA_AimAssist", UIAA_AimAssist)
LockTable(_M)
