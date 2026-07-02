BOOT = {}
BOOT.LegalBootPopups = {}
BOOT.CurrentLegalPopupIndex = 1

local var_0_0 = 6

function BootEULAPopup(arg_1_0, arg_1_1)
	arg_1_1.EULAStringIds, arg_1_1 = {
		"PLATFORM/EULA_1",
		"PLATFORM/EULA_2",
		"PLATFORM/EULA_3",
		"PLATFORM/EULA_4",
		"PLATFORM/EULA_5",
		"PLATFORM/EULA_6",
		"PLATFORM/EULA_7",
		"PLATFORM/EULA_8"
	}, arg_1_1 or {}
	arg_1_1.disableAcceptUntilLastPage = false
	arg_1_1.acceptAction = BOOT.AcceptLegalPopupAction

	function arg_1_1.declineAction(arg_2_0, arg_2_1)
		local var_2_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/BOOT_EULA_DECLINE_TITLE"),
			message = Engine.CBBHFCGDIC("LUA_MENU/BOOT_EULA_DECLINE_MSG")
		}

		LUI.FlowManager.RequestPopupMenu(arg_1_0, "EULADeclinePopup", true, arg_2_1.controller, false, var_2_0, arg_1_0, true, true)
	end

	local var_1_0 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_1_1)

	var_1_0.id = "BootEULAPopup"

	return var_1_0
end

MenuBuilder.registerType("BootEULAPopup", BootEULAPopup)

function BootKoreanPIProcessingPopup(arg_3_0, arg_3_1)
	arg_3_1.EULAStringIds, arg_3_1 = {
		"KOREAN_LEGAL/KOREAN_PI_BODY_0",
		"KOREAN_LEGAL/KOREAN_PI_BODY_1",
		"KOREAN_LEGAL/KOREAN_PI_BODY_2",
		"KOREAN_LEGAL/KOREAN_PI_BODY_3"
	}, arg_3_1 or {}
	arg_3_1.disableAcceptUntilLastPage = true
	arg_3_1.terms = Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_PI_HEADER")
	arg_3_1.acceptAction = BOOT.AcceptLegalPopupAction

	function arg_3_1.declineAction(arg_4_0, arg_4_1)
		local var_4_0 = {
			title = Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_PI_DECLINE_TITLE"),
			message = Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_PI_DECLINE_DESCRIPTION")
		}

		LUI.FlowManager.RequestPopupMenu(arg_3_0, "EULADeclinePopup", true, arg_4_1.controller, false, var_4_0, arg_3_0, true, true)
	end

	local var_3_0 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_3_1)

	var_3_0.id = "KoreanPIProcessingPopup"

	return var_3_0
end

MenuBuilder.registerType("BootKoreanPIProcessingPopup", BootKoreanPIProcessingPopup)

function BootKoreanPIOverseasPopup(arg_5_0, arg_5_1)
	arg_5_1.EULAStringIds, arg_5_1 = {
		"KOREAN_LEGAL/KOREAN_PIO_BODY_0"
	}, arg_5_1 or {}
	arg_5_1.disableAcceptUntilLastPage = true
	arg_5_1.terms = Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_PIO_HEADER")
	arg_5_1.acceptAction = BOOT.AcceptLegalPopupAction

	function arg_5_1.declineAction(arg_6_0, arg_6_1)
		local var_6_0 = {
			title = Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_PIO_DECLINE_TITLE"),
			message = Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_PIO_DECLINE_DESCRIPTION")
		}

		LUI.FlowManager.RequestPopupMenu(arg_5_0, "EULADeclinePopup", true, arg_6_1.controller, false, var_6_0, arg_5_0, true, true)
	end

	local var_5_0 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_5_1)

	var_5_0.id = "KoreanPIOverseaPopup"

	return var_5_0
end

MenuBuilder.registerType("BootKoreanPIOverseasPopup", BootKoreanPIOverseasPopup)

function BootTermsOfUsePopup(arg_7_0, arg_7_1)
	local var_7_0 = {}

	for iter_7_0 = 1, 6 do
		table.insert(var_7_0, string.format("CODACCOUNT/EULA_A_%03d", iter_7_0))
	end

	arg_7_1 = arg_7_1 or {}
	arg_7_1.EULAStringIds = var_7_0
	arg_7_1.title = Engine.CBBHFCGDIC("CODACCOUNT/EULA_A_TITLE")
	arg_7_1.acceptAction = BOOT.AcceptLegalPopupAction

	function arg_7_1.declineAction(arg_8_0, arg_8_1)
		local var_8_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/BOOT_TERMS_OF_USE_DECLINE_TITLE"),
			message = Engine.CBBHFCGDIC("LUA_MENU/BOOT_TERMS_OF_USE_DECLINE_MSG")
		}

		LUI.FlowManager.RequestPopupMenu(arg_7_0, "EULADeclinePopup", true, arg_8_1.controller, false, var_8_0, arg_7_0, true, true)
	end

	local var_7_1 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_7_1)

	var_7_1.id = "BootTermsOfUsePopup"

	return var_7_1
end

MenuBuilder.registerType("BootTermsOfUsePopup", BootTermsOfUsePopup)

function BootPrivacyPolicyPopup(arg_9_0, arg_9_1)
	local var_9_0 = {}

	for iter_9_0 = 1, var_0_0 do
		table.insert(var_9_0, string.format("CODACCOUNT/EULA_B_%03d", iter_9_0))
	end

	arg_9_1 = arg_9_1 or {}
	arg_9_1.EULAStringIds = var_9_0
	arg_9_1.title = Engine.CBBHFCGDIC("CODACCOUNT/EULA_B_TITLE")
	arg_9_1.acceptAction = BOOT.AcceptLegalPopupAction

	function arg_9_1.declineAction(arg_10_0, arg_10_1)
		local var_10_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/BOOT_PRIVACY_POLICY_DECLINE_TITLE"),
			message = Engine.CBBHFCGDIC("LUA_MENU/BOOT_PRIVACY_POLICY_DECLINE_MSG")
		}

		LUI.FlowManager.RequestPopupMenu(arg_9_0, "EULADeclinePopup", true, arg_10_1.controller, false, var_10_0, arg_9_0, true, true)
	end

	local var_9_1 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_9_1)

	var_9_1.id = "BootPrivacyPolicyPopup"

	return var_9_1
end

MenuBuilder.registerType("BootPrivacyPolicyPopup", BootPrivacyPolicyPopup)

function BOOT.AcceptLegalPopupAction(arg_11_0, arg_11_1)
	BOOT.IncreaseBootPopupIndex()

	local var_11_0 = BOOT.GetCurrentLegalBootPopupName()

	if var_11_0 == "BootTermsOfUsePopup" and not BOOT.ShouldShowBootTermsOfUse(arg_11_1.controller) then
		BOOT.IncreaseBootPopupIndex()

		var_11_0 = BOOT.GetCurrentLegalBootPopupName()
	end

	if var_11_0 == "BootPrivacyPolicyPopup" and not BOOT.ShouldShowBootPrivacyPolicyPopup(arg_11_1.controller) then
		BOOT.IncreaseBootPopupIndex()

		var_11_0 = BOOT.GetCurrentLegalBootPopupName()
	end

	if var_11_0 then
		LUI.FlowManager.RequestPopupMenu(unused, var_11_0, false, arg_11_1.controller, false, {}, nil, true, true)
		LUI.FlowManager.RequestLeaveMenu(arg_11_0:GetCurrentMenu(), true)
	else
		BOOT.AcceptEULA()
		LUI.FlowManager.RequestLeaveMenu(arg_11_0:GetCurrentMenu(), true)
	end
end

function BOOT.AcceptEULA()
	Engine.DAGFFDGFII("profile_SetAcceptedEULA")
end

function BOOT.ShouldShowBootTermsOfUse(arg_13_0)
	if not Engine.BECCFCBIAA("hasEverPlayed_MainMenu", arg_13_0) then
		return false
	end

	local var_13_0 = Dvar.CFHDGABACF("MPQPKPSTRR")

	if var_13_0 == nil or var_13_0 <= 1 then
		return false
	end

	return true
end

function BOOT.ShouldShowBootPrivacyPolicyPopup(arg_14_0)
	if not Engine.BECCFCBIAA("hasEverPlayed_MainMenu", arg_14_0) then
		return false
	end

	local var_14_0 = Dvar.CFHDGABACF("LKMLKOLSNL")

	if var_14_0 == nil or var_14_0 <= 1 then
		return false
	end

	return true
end

function BOOT.InitializeBootLegalPopupList()
	local var_15_0 = {}

	table.insert(var_15_0, {
		popupName = "BootEULAPopup"
	})
	table.insert(var_15_0, {
		popupName = "BootTermsOfUsePopup"
	})
	table.insert(var_15_0, {
		popupName = "BootPrivacyPolicyPopup"
	})

	if Engine.DDHFCGHJEA() then
		table.insert(var_15_0, {
			popupName = "BootKoreanPIProcessingPopup"
		})
		table.insert(var_15_0, {
			popupName = "BootKoreanPIOverseasPopup"
		})
	end

	return var_15_0
end

function BOOT.InitializeLegalBootPopupsSequence()
	BOOT.LegalBootPopups = BOOT.InitializeBootLegalPopupList()
	BOOT.CurrentLegalPopupIndex = 1
end

function BOOT.GetCurrentLegalBootPopupName()
	if BOOT.LegalBootPopups[BOOT.CurrentLegalPopupIndex] then
		return BOOT.LegalBootPopups[BOOT.CurrentLegalPopupIndex].popupName
	end
end

function BOOT.IncreaseBootPopupIndex()
	BOOT.CurrentLegalPopupIndex = BOOT.CurrentLegalPopupIndex + 1
end

function BOOT.GetRetryPopupButtons(arg_19_0)
	local var_19_0 = {
		label = Engine.CBBHFCGDIC("MENU/RETRY"),
		action = function(arg_20_0, arg_20_1)
			Engine.CDGCBCBAJ("Retry accessing MainMenu", arg_19_0)
			LUI.FlowManager.RequestLeaveMenu(arg_20_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_19_0)
		end
	}
	local var_19_1 = {
		label = Engine.CBBHFCGDIC("MENU/GO_OFFLINE"),
		action = function(arg_21_0, arg_21_1)
			Engine.CDGCBCBAJ("Going Offline", arg_19_0)
			LUI.FlowManager.RequestLeaveMenu(arg_21_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_19_0)
		end
	}
	local var_19_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		action = function(arg_22_0, arg_22_1)
			LUI.FlowManager.RequestPopupMenu(self, "quit_popmenu", false, arg_22_1.controller)
		end
	}

	if Engine.CGABICJHAI() then
		return {
			var_19_0,
			var_19_2
		}
	elseif CONDITIONS.ForceOnlineMenus() then
		return {
			var_19_0
		}
	else
		return {
			var_19_0,
			var_19_1
		}
	end
end

function BOOT.GetOkayPopupButtons()
	return {
		{
			label = Engine.CBBHFCGDIC("MENU/OK"),
			action = function(arg_24_0, arg_24_1)
				LUI.FlowManager.RequestLeaveMenu(arg_24_0:GetCurrentMenu(), true)
			end
		}
	}
end

function BOOT.AddSettingUpdatedEvent(arg_25_0, arg_25_1, arg_25_2)
	return function(...)
		arg_25_2(...)
		arg_25_0:dispatchEventToCurrentMenu({
			name = "setting_updated",
			controller = arg_25_1
		})
	end
end

function BOOT.CreateColorBlindFilterLogic(arg_27_0, arg_27_1)
	assert(arg_27_0.Colorblind)

	local var_27_0 = OPTIONS.GetColorBlindConfig(arg_27_1)

	var_27_0.action = BOOT.AddSettingUpdatedEvent(arg_27_0, arg_27_1, var_27_0.action)

	LUI.AddUIArrowTextButtonLogic(arg_27_0.Colorblind, arg_27_1, var_27_0)
end

function BOOT.CreateInputMethodLogic(arg_28_0, arg_28_1, arg_28_2)
	assert(arg_28_0.InputMethod)

	local var_28_0 = OPTIONS.GetOptionsDataByIdentifier(arg_28_0, arg_28_1, arg_28_2, "InputMethod", CSV.generalOptions)
	local var_28_1 = var_28_0.action

	function var_28_0.action(...)
		var_28_1(...)

		if arg_28_0.UpdateBootOptionControlsLayout then
			arg_28_0.UpdateBootOptionControlsLayout(arg_28_0, arg_28_1)
		end
	end

	var_28_0.action = BOOT.AddSettingUpdatedEvent(arg_28_0, arg_28_1, var_28_0.action)
	var_28_0.defaultValue = var_28_0.value(arg_28_1)

	LUI.AddUIToggleButtonLogic(arg_28_0.InputMethod, arg_28_1, var_28_0)

	arg_28_0.InputMethod.buttonName = var_28_0.name
	arg_28_0.InputMethod.buttonImage = var_28_0.image
	arg_28_0.InputMethod.buttonDescription = var_28_0.description

	OPTIONS.SetFocusEventHandlerForActiveState(arg_28_0.InputMethod, arg_28_1, var_28_0)
	OPTIONS.SetUpdateButtonSelectedEventHandler(arg_28_0.InputMethod)

	if var_28_0.disabled then
		if type(var_28_0.disabled) == "function" then
			arg_28_0.InputMethod:SetButtonDisabled(var_28_0.disabled(arg_28_1))
		else
			arg_28_0.InputMethod:SetButtonDisabled(var_28_0.disabled)
		end
	end

	if var_28_0.specificAction then
		var_28_0.specificAction(arg_28_0, arg_28_0.InputMethod, arg_28_1)
	end
end

function BOOT.CreateMasterVolumeLogic(arg_30_0, arg_30_1, arg_30_2)
	assert(arg_30_0.MasterVolume)

	local var_30_0 = OPTIONS.GetUniformOptionData(arg_30_2.Volume, arg_30_1, false)
	local var_30_1 = {
		name = var_30_0.name,
		action = function(arg_31_0, arg_31_1, arg_31_2)
			var_30_0.valueSetter(option, arg_31_2, arg_31_0)
		end,
		applyable = var_30_0.applyable,
		defaultValue = var_30_0.valueGetter(arg_30_1),
		valueGetter = var_30_0.valueGetter,
		defaultValueGetter = var_30_0.defaultValueGetter,
		onRefresh = var_30_0.onRefresh,
		onDependencyParentRefresh = var_30_0.onDependencyParentRefresh,
		max = var_30_0.bounds.max,
		min = var_30_0.bounds.min,
		step = var_30_0.bounds.step,
		pcstep = var_30_0.bounds.pcstep,
		decimalPlacesToRound = var_30_0.bounds.decimalPlacesToRound,
		fillElement = arg_30_0.MasterVolume.GenericFillBar.Fill,
		textSelectionColor = {
			g = 100,
			a = 255,
			b = 100,
			r = 96
		}
	}

	LUI.AddSliderWithEditBoxLogic(arg_30_0.MasterVolume, arg_30_1, var_30_1)

	arg_30_0.MasterVolume._name = var_30_0.name
	arg_30_0.MasterVolume._description = var_30_0.description

	arg_30_0.MasterVolume:addEventHandler("button_action", function(arg_32_0, arg_32_1)
		if not arg_32_0:IsActive() then
			arg_32_0:dispatchEventToParent({
				name = "request_active",
				target = arg_32_0,
				controller = arg_30_1
			})

			if arg_32_0:IsActive() then
				return true
			end
		end
	end)

	if var_30_0.focusAction then
		arg_30_0.MasterVolume:addEventHandler("button_over", function(arg_33_0, arg_33_1)
			var_30_0.focusAction(arg_30_0, arg_33_0)
		end)
	end

	arg_30_0.MasterVolume:addEventHandler("gain_focus", function(arg_34_0, arg_34_1)
		ACTIONS.AnimateSequence(arg_30_0, "NoPreview")
		arg_30_0.ButtonTitle:setText(arg_30_0.MasterVolume._name)
		arg_30_0.Description.Text:setText(arg_30_0.MasterVolume._description)
		arg_30_0.MasterVolume:dispatchEventToParent({
			name = "request_active",
			target = arg_30_0.MasterVolume
		})

		return true
	end)

	if arg_30_0.MasterVolume.GenericOptionButtonBase.Title then
		arg_30_0.MasterVolume.GenericOptionButtonBase.Title:setText(var_30_0.name)
	end
end

function BOOT.BuildButtonLabelHandlers(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	arg_35_0:registerEventHandler("update_button_selected", function(arg_36_0, arg_36_1)
		local var_36_0 = arg_36_1.buttonName or ""
		local var_36_1 = arg_36_1.description or ""

		arg_35_2:setText(var_36_0, 0)
		arg_35_3:setText(var_36_1, 0)
	end)
end
