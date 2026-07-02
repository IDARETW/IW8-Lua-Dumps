BOOT = {}
BOOT.LegalBootPopups = {}
BOOT.CurrentLegalPopupIndex = 1

function BootEULAPopup(arg_1_0, arg_1_1)
	local var_1_0 = {
		"PLATFORM/EULA_1",
		"PLATFORM/EULA_2",
		"PLATFORM/EULA_3",
		"PLATFORM/EULA_4",
		"PLATFORM/EULA_5",
		"PLATFORM/EULA_6",
		"PLATFORM/EULA_7",
		"PLATFORM/EULA_8"
	}

	if Engine.CIEGIACHAE() then
		if IsAmericaSKU() then
			table.insert(var_1_0, "PLATFORM/EULA_ADDENDUM_AMERICA_1")
		elseif IsEuropeSKU() then
			table.insert(var_1_0, "PLATFORM/EULA_ADDENDUM_EUROPE_1")
		end
	end

	arg_1_1 = arg_1_1 or {}
	arg_1_1.EULAStringIds = var_1_0
	arg_1_1.disableAcceptUntilLastPage = false
	arg_1_1.acceptAction = BOOT.AcceptLegalPopupAction

	function arg_1_1.declineAction(arg_2_0, arg_2_1)
		local var_2_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/EULA_ACCEPT"),
			message = Engine.CBBHFCGDIC("LUA_MENU/EULA_MESSAGE")
		}

		LUI.FlowManager.RequestPopupMenu(arg_1_0, "EULADeclinePopup", true, arg_2_1.controller, false, var_2_0, arg_1_0, true, true)
	end

	local var_1_1 = MenuBuilder.BuildRegisteredType("EULAPopup", arg_1_1)

	var_1_1.id = "BootEULAPopup"

	return var_1_1
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

function BOOT.AcceptLegalPopupAction(arg_7_0, arg_7_1)
	BOOT.IncreaseBootPopupIndex()

	local var_7_0 = BOOT.GetCurrentLegalBootPopupName()

	if var_7_0 then
		LUI.FlowManager.RequestPopupMenu(unused, var_7_0, false, arg_7_1.controller, false, {}, nil, true, true)
		LUI.FlowManager.RequestLeaveMenu(arg_7_0:GetCurrentMenu(), true)
	else
		BOOT.AcceptEULA()
		LUI.FlowManager.RequestLeaveMenu(arg_7_0:GetCurrentMenu(), true)
	end
end

function BOOT.AcceptEULA()
	Engine.DAGFFDGFII("profile_SetAcceptedEULA")
end

function BOOT.InitializeBootLegalPopupList()
	local var_9_0 = {}

	table.insert(var_9_0, {
		popupName = "BootEULAPopup"
	})

	if Engine.DDHFCGHJEA() then
		table.insert(var_9_0, {
			popupName = "BootKoreanPIProcessingPopup"
		})
		table.insert(var_9_0, {
			popupName = "BootKoreanPIOverseasPopup"
		})
	end

	return var_9_0
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

function BOOT.GetRetryPopupButtons(arg_13_0)
	local var_13_0 = {
		label = Engine.CBBHFCGDIC("MENU/RETRY"),
		action = function(arg_14_0, arg_14_1)
			Engine.CDGCBCBAJ("Retry accessing MainMenu", arg_13_0)
			LUI.FlowManager.RequestLeaveMenu(arg_14_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_13_0)
		end
	}
	local var_13_1 = {
		label = Engine.CBBHFCGDIC("MENU/GO_OFFLINE"),
		action = function(arg_15_0, arg_15_1)
			Engine.CDGCBCBAJ("Going Offline", arg_13_0)
			LUI.FlowManager.RequestLeaveMenu(arg_15_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_13_0)
		end
	}
	local var_13_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		action = function(arg_16_0, arg_16_1)
			LUI.FlowManager.RequestPopupMenu(self, "quit_popmenu", false, arg_16_1.controller)
		end
	}

	if Engine.CGABICJHAI() then
		return {
			var_13_0,
			var_13_2
		}
	elseif CONDITIONS.ForceOnlineMenus() then
		return {
			var_13_0
		}
	else
		return {
			var_13_0,
			var_13_1
		}
	end
end

function BOOT.GetOkayPopupButtons()
	return {
		{
			label = Engine.CBBHFCGDIC("MENU/OK"),
			action = function(arg_18_0, arg_18_1)
				LUI.FlowManager.RequestLeaveMenu(arg_18_0:GetCurrentMenu(), true)
			end
		}
	}
end

function BOOT.AddSettingUpdatedEvent(arg_19_0, arg_19_1, arg_19_2)
	return function(...)
		arg_19_2(...)
		arg_19_0:dispatchEventToCurrentMenu({
			name = "setting_updated",
			controller = arg_19_1
		})
	end
end

function BOOT.CreateColorBlindFilterLogic(arg_21_0, arg_21_1)
	assert(arg_21_0.Colorblind)

	local var_21_0 = OPTIONS.GetColorBlindConfig(arg_21_1)

	var_21_0.action = BOOT.AddSettingUpdatedEvent(arg_21_0, arg_21_1, var_21_0.action)

	LUI.AddUIArrowTextButtonLogic(arg_21_0.Colorblind, arg_21_1, var_21_0)
end

function BOOT.CreateInputMethodLogic(arg_22_0, arg_22_1, arg_22_2)
	assert(arg_22_0.InputMethod)

	local var_22_0 = OPTIONS.GetOptionsDataByIdentifier(arg_22_0, arg_22_1, arg_22_2, "InputMethod", CSV.generalOptions)
	local var_22_1 = var_22_0.action

	function var_22_0.action(...)
		var_22_1(...)

		if arg_22_0.UpdateBootOptionControlsLayout then
			arg_22_0.UpdateBootOptionControlsLayout(arg_22_0, arg_22_1)
		end
	end

	var_22_0.action = BOOT.AddSettingUpdatedEvent(arg_22_0, arg_22_1, var_22_0.action)
	var_22_0.defaultValue = var_22_0.value(arg_22_1)

	LUI.AddUIToggleButtonLogic(arg_22_0.InputMethod, arg_22_1, var_22_0)

	arg_22_0.InputMethod.buttonName = var_22_0.name
	arg_22_0.InputMethod.buttonImage = var_22_0.image
	arg_22_0.InputMethod.buttonDescription = var_22_0.description

	OPTIONS.SetFocusEventHandlerForActiveState(arg_22_0.InputMethod, arg_22_1, var_22_0)
	OPTIONS.SetUpdateButtonSelectedEventHandler(arg_22_0.InputMethod)

	if var_22_0.disabled then
		if type(var_22_0.disabled) == "function" then
			arg_22_0.InputMethod:SetButtonDisabled(var_22_0.disabled(arg_22_1))
		else
			arg_22_0.InputMethod:SetButtonDisabled(var_22_0.disabled)
		end
	end

	if var_22_0.specificAction then
		var_22_0.specificAction(arg_22_0, arg_22_0.InputMethod, arg_22_1)
	end
end

function BOOT.CreateMasterVolumeLogic(arg_24_0, arg_24_1, arg_24_2)
	assert(arg_24_0.MasterVolume)

	local var_24_0 = OPTIONS.GetUniformOptionData(arg_24_2.Volume, arg_24_1, false)
	local var_24_1 = {
		name = var_24_0.name,
		action = function(arg_25_0, arg_25_1, arg_25_2)
			var_24_0.valueSetter(option, arg_25_2, arg_25_0)
		end,
		applyable = var_24_0.applyable,
		defaultValue = var_24_0.valueGetter(arg_24_1),
		valueGetter = var_24_0.valueGetter,
		defaultValueGetter = var_24_0.defaultValueGetter,
		onRefresh = var_24_0.onRefresh,
		onDependencyParentRefresh = var_24_0.onDependencyParentRefresh,
		max = var_24_0.bounds.max,
		min = var_24_0.bounds.min,
		step = var_24_0.bounds.step,
		pcstep = var_24_0.bounds.pcstep,
		decimalPlacesToRound = var_24_0.bounds.decimalPlacesToRound,
		fillElement = arg_24_0.MasterVolume.GenericFillBar.Fill,
		textSelectionColor = {
			g = 100,
			a = 255,
			b = 100,
			r = 96
		}
	}

	LUI.AddSliderWithEditBoxLogic(arg_24_0.MasterVolume, arg_24_1, var_24_1)

	arg_24_0.MasterVolume._name = var_24_0.name
	arg_24_0.MasterVolume._description = var_24_0.description

	arg_24_0.MasterVolume:addEventHandler("button_action", function(arg_26_0, arg_26_1)
		if not arg_26_0:IsActive() then
			arg_26_0:dispatchEventToParent({
				name = "request_active",
				target = arg_26_0,
				controller = arg_24_1
			})

			if arg_26_0:IsActive() then
				return true
			end
		end
	end)

	if var_24_0.focusAction then
		arg_24_0.MasterVolume:addEventHandler("button_over", function(arg_27_0, arg_27_1)
			var_24_0.focusAction(arg_24_0, arg_27_0)
		end)
	end

	arg_24_0.MasterVolume:addEventHandler("gain_focus", function(arg_28_0, arg_28_1)
		ACTIONS.AnimateSequence(arg_24_0, "NoPreview")
		arg_24_0.ButtonTitle:setText(arg_24_0.MasterVolume._name)
		arg_24_0.Description.Text:setText(arg_24_0.MasterVolume._description)
		arg_24_0.MasterVolume:dispatchEventToParent({
			name = "request_active",
			target = arg_24_0.MasterVolume
		})

		return true
	end)

	if arg_24_0.MasterVolume.GenericOptionButtonBase.Title then
		arg_24_0.MasterVolume.GenericOptionButtonBase.Title:setText(var_24_0.name)
	end
end

function BOOT.BuildButtonLabelHandlers(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	arg_29_0:registerEventHandler("update_button_selected", function(arg_30_0, arg_30_1)
		local var_30_0 = arg_30_1.buttonName or ""
		local var_30_1 = arg_30_1.description or ""

		arg_29_2:setText(var_30_0, 0)
		arg_29_3:setText(var_30_1, 0)
	end)
end
