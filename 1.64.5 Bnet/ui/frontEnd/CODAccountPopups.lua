module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function CODAccountFencePopup(arg_1_0, arg_1_1)
	assert(arg_1_1.controllerIndex)

	local var_1_0 = MenuBuilder.BuildRegisteredType("CODAccountGreeting", arg_1_1)

	var_1_0.id = "CODAccountFencePopup"

	var_1_0:addEventHandler("AccountRegistrationSuccess", function(arg_2_0, arg_2_1)
		arg_1_1.onSuccess()
	end)

	return var_1_0
end

local function var_0_0(arg_3_0, arg_3_1)
	assert(arg_3_1.controllerIndex)

	local var_3_0

	if AccountRegistration.CEDFJJCJJD(arg_3_1.controllerIndex) or CODACCOUNT.ForceAnonymousAccount() then
		var_3_0 = MenuBuilder.BuildRegisteredType("CODAccountSettings", arg_3_1)
	else
		arg_3_1.isAnonymousAccount = true
		var_3_0 = MenuBuilder.BuildRegisteredType("CODAccountGreeting", arg_3_1)
	end

	var_3_0.id = "CODAccountOptionsPopup"

	return var_3_0
end

function CODAccountRegisterPopup(arg_4_0, arg_4_1)
	arg_4_1.widget = MenuBuilder.BuildRegisteredType("CODAccountRegister", arg_4_1)

	function arg_4_1.backButtonOverride(arg_5_0, arg_5_1)
		if arg_4_1.onCancelRegister then
			arg_4_1.onCancelRegister()
		end
	end

	local var_4_0 = MenuBuilder.BuildRegisteredType("FlyInPopup", arg_4_1)

	var_4_0.id = "CODAccountRegisterPopup"

	return var_4_0
end

function CODAccountEULAPopupA(arg_6_0, arg_6_1)
	local var_6_0 = {}

	for iter_6_0 = 1, 5 do
		table.insert(var_6_0, string.format("CODACCOUNT/EULA_A_%03d", iter_6_0))
	end

	arg_6_1 = arg_6_1 or {}
	arg_6_1.EULAStringIds = var_6_0
	arg_6_1.title = Engine.CBBHFCGDIC("CODACCOUNT/EULA_A_TITLE")

	function arg_6_1.acceptAction(arg_7_0, arg_7_1)
		LUI.FlowManager.RequestLeaveMenu(arg_7_0:GetCurrentMenu())
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountEULAPopupB", true, arg_7_1.controller, false, arg_6_1, nil, true, true)
	end

	function arg_6_1.declineAction(arg_8_0, arg_8_1)
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountEULADeclinePopup", true, arg_8_1.controller, false, {
			message = Engine.CBBHFCGDIC("CODACCOUNT/EULA_A_DECLINE_MESSAGE")
		}, nil, true, true)
	end

	local var_6_1 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_6_1)

	var_6_1.id = "CODAccountEULAPopupA"

	var_6_1.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	})
	var_6_1.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		LUI.FlowManager.RequestLeaveMenu(arg_9_0:GetCurrentMenu())
	end)

	return var_6_1
end

function CODAccountEULAPopupB(arg_10_0, arg_10_1)
	local var_10_0 = {}

	for iter_10_0 = 1, 4 do
		table.insert(var_10_0, string.format("CODACCOUNT/EULA_B_%03d", iter_10_0))
	end

	arg_10_1 = arg_10_1 or {}
	arg_10_1.EULAStringIds = var_10_0
	arg_10_1.title = Engine.CBBHFCGDIC("CODACCOUNT/EULA_B_TITLE")

	function arg_10_1.acceptAction(arg_11_0, arg_11_1)
		LUI.FlowManager.RequestPopupMenu(arg_10_0, "CODAccountRegisteringPopup", true, arg_11_1.controller, false, {
			controllerIndex = arg_11_1.controller
		}, nil, true, true)

		local var_11_0 = arg_10_1.accountCredentials
		local var_11_1 = var_11_0.controllerIndex
		local var_11_2 = var_11_0.email
		local var_11_3 = var_11_0.password
		local var_11_4 = var_11_0.countryCode
		local var_11_5 = var_11_0.marketingOptIn

		if var_11_0.isAnonymousAccount then
			AccountRegistration.IJBAAJFGB(var_11_1, var_11_2, var_11_3, var_11_4, var_11_5)
		else
			local var_11_6 = var_11_0.username

			AccountRegistration.HHIGGAHGI(var_11_1, var_11_2, var_11_6, var_11_3, var_11_4, var_11_5)
		end
	end

	function arg_10_1.declineAction(arg_12_0, arg_12_1)
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountEULADeclinePopup", true, arg_12_1.controller, false, {
			message = Engine.CBBHFCGDIC("CODACCOUNT/EULA_B_DECLINE_MESSAGE")
		}, nil, true, true)
	end

	local var_10_1 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_10_1)

	var_10_1.id = "CODAccountEULAPopupB"
	var_10_1._autoConnectionFailedIgnored = false

	var_10_1.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	})
	var_10_1.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		LUI.FlowManager.RequestLeaveMenu(arg_13_0:GetCurrentMenu())
	end)
	var_10_1:registerEventHandler("AccountRegistrationSuccess", function(arg_14_0, arg_14_1)
		assert(arg_10_1.controllerIndex == arg_14_1.options.controllerIndex)
		LUI.FlowManager.RequestLeaveMenu(arg_14_0)

		if arg_10_1.accountCredentials.isAnonymousAccount then
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountRestartingPopup", true, arg_10_1.controllerIndex, true, {}, nil, true, true)
		else
			LUI.FlowManager.RequestLeaveMenuByName("CODAccountRegisteringPopup")
		end
	end)
	var_10_1:registerEventHandler("AccountRegistrationFailure", function(arg_15_0, arg_15_1)
		assert(arg_10_1.controllerIndex == arg_15_1.options.controllerIndex)

		if AccountRegistration.BAADBIECDG() and AccountRegistration.BEJFHBHICG() ~= 0 and not var_10_1._autoConnectionFailedIgnored then
			var_10_1._autoConnectionFailedIgnored = true
		else
			local var_15_0 = {
				title = Engine.CBBHFCGDIC("CODACCOUNT/REGISTER_ERROR_TITLE"),
				message = Engine.CBBHFCGDIC(CODACCOUNT.GetErrorString(arg_15_1.options.errorCode), arg_15_1.options.detailErrorCode),
				controllerIndex = arg_10_1.controllerIndex,
				buttons = {
					{
						label = Engine.CBBHFCGDIC("MENU/OK"),
						action = function(arg_16_0, arg_16_1)
							LUI.FlowManager.RequestPopupMenu(nil, "CODAccountRegisterPopup", true, arg_10_1.controllerIndex, true, arg_10_1, nil, true, true)
						end
					}
				}
			}

			LUI.FlowManager.RequestPopupMenu(arg_10_0, "CODAccountErrorPopup", true, arg_10_1.controllerIndex, true, var_15_0, nil, true, true)
			LUI.FlowManager.RequestLeaveMenu(arg_15_0)
		end
	end)

	return var_10_1
end

local function var_0_1(arg_17_0, arg_17_1)
	assert(arg_17_1.message)

	arg_17_1.title = Engine.CBBHFCGDIC("LUA_MENU/EULA_ACCEPT")
	arg_17_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	return MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_17_1)
end

local function var_0_2(arg_18_0, arg_18_1)
	arg_18_1.message = Engine.CBBHFCGDIC("CODACCOUNT/REGISTERING")

	local var_18_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_18_1)

	var_18_0.id = "CODAccountRegisteringPopup"

	return var_18_0
end

local function var_0_3(arg_19_0, arg_19_1)
	arg_19_1.message = Engine.CBBHFCGDIC("CODACCOUNT/LOGGING_IN")

	local var_19_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_19_1)

	var_19_0.id = "CODAccountLoggingInPopup"

	var_19_0:addEventHandler("AccountRegistrationSuccess", function(arg_20_0, arg_20_1)
		LUI.FlowManager.RequestLeaveMenu(arg_20_0, true, true)
	end)
	var_19_0:addEventHandler("AccountRegistrationFailure", function(arg_21_0, arg_21_1)
		LUI.FlowManager.RequestLeaveMenu(arg_21_0, true, true)
	end)

	return var_19_0
end

local function var_0_4(arg_22_0, arg_22_1)
	assert(arg_22_1.controllerIndex)

	arg_22_1.message = Engine.CBBHFCGDIC("CODACCOUNT/RESTARTING")

	local var_22_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_22_1)

	var_22_0.id = "CODAccountRestartingPopup"

	local var_22_1 = 3000

	var_22_0:Wait(var_22_1).onComplete = function()
		Engine.DAGFFDGFII("profile_SetHasEverSeen_CODAccount " .. arg_22_1.controllerIndex .. " 0")
		Engine.DAGFFDGFII("updategamerprofile " .. arg_22_1.controllerIndex)
		Dvar.DHEGHJJJHI("MKKNSMLKPR", true)
		Dvar.BDEHAEGHAF("LQSPQSNQSN", "CODACCOUNT/ACCOUNT_UPDATED")
	end

	return var_22_0
end

local function var_0_5(arg_24_0, arg_24_1)
	assert(arg_24_1.title)
	assert(arg_24_1.message)

	arg_24_1.buttons = arg_24_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_24_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_24_1)

	var_24_0.id = "CODAccountSuccessPopup"

	return var_24_0
end

local function var_0_6(arg_25_0, arg_25_1)
	assert(arg_25_1.title)
	assert(arg_25_1.message)

	arg_25_1.buttons = arg_25_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_25_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_25_1)

	var_25_0.id = "CODAccountErrorPopup"

	return var_25_0
end

MenuBuilder.registerType("CODAccountFencePopup", CODAccountFencePopup)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountFencePopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountFencePopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountRegisterPopup", CODAccountRegisterPopup)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountRegisterPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountRegisterPopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountEULAPopupA", CODAccountEULAPopupA)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountEULAPopupA", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountEULAPopupA", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountEULAPopupB", CODAccountEULAPopupB)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountEULAPopupB", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountEULAPopupB", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountEULADeclinePopup", var_0_1)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountEULADeclinePopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountEULADeclinePopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountRegisteringPopup", var_0_2)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountRegisteringPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountRegisteringPopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountLoggingInPopup", var_0_3)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountLoggingInPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountLoggingInPopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountRestartingPopup", var_0_4)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountRestartingPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountRestartingPopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountSuccessPopup", var_0_5)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountSuccessPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountSuccessPopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountErrorPopup", var_0_6)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountErrorPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountErrorPopup", CoD.GameDVREnable)
MenuBuilder.registerType("CODAccountOptionsPopup", var_0_0)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountOptionsPopup", CoD.GameDVRDisable)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountOptionsPopup", CoD.GameDVREnable)
LockTable(_M)
