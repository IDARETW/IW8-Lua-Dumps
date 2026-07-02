OPTIONS_DATA = {}

local function var_0_0(arg_1_0, arg_1_1)
	assert(#arg_1_0 > 0)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		if arg_1_1 == iter_1_1 then
			return iter_1_0
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = true

	if arg_2_0 == 1 then
		var_2_0 = false
	end

	if not Dvar.IBEGCHEFE("LKSKPKTOON") then
		Dvar.DHEGHJJJHI("NLPSQMQRTP", var_2_0)
	else
		Dvar.DHEGHJJJHI("NLPSQMQRTP", false)
	end

	Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	return Engine.BBDCAFEGDJ() == 0 and Engine.BEFACAIFDD()
end

local function var_0_3(arg_4_0)
	return not CONDITIONS.IsSplitscreen() or arg_4_0 == Engine.IJEBHJIJF()
end

local function var_0_4(arg_5_0, arg_5_1)
	return true
end

local function var_0_5(arg_6_0, arg_6_1)
	return Engine.BBDCAFEGDJ() == 1
end

local function var_0_6()
	return not Engine.GCCHFDJAF()
end

local function var_0_7()
	return Engine.CGABICJHAI() and Engine.BAIEJBHIB()
end

local function var_0_8()
	return not CONDITIONS.InGame() or not MatchRules.BIJEDCBCBH("commonOption", "disableMount")
end

local function var_0_9(arg_10_0, arg_10_1)
	assert(#arg_10_0 > 0)
	assert(arg_10_1 <= #arg_10_0)

	return arg_10_0[arg_10_1]
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = Dvar.EBBAIAEICC(arg_11_0)
	local var_11_1 = 1

	if var_11_0 == DvarTypeTable.DvarString or var_11_0 == DvarTypeTable.DvarEnum then
		local var_11_2 = Dvar.DHEEJCCJBH(arg_11_0)

		if arg_11_2 then
			var_11_1 = var_0_0(arg_11_2, var_11_2)
		else
			var_11_1 = var_0_0(arg_11_1, var_11_2)
		end
	elseif var_11_0 == DvarTypeTable.DvarInt then
		local var_11_3 = Dvar.CFHDGABACF(arg_11_0)

		if arg_11_2 then
			var_11_1 = var_0_0(arg_11_2, var_11_3)
		else
			var_11_1 = var_11_3
		end
	elseif var_11_0 == DvarTypeTable.DvarBool then
		var_11_1 = Dvar.IBEGCHEFE(arg_11_0) and 2 or 1
	end

	return var_11_1
end

local function var_0_11(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	return function(arg_13_0)
		local var_13_0 = false
		local var_13_1 = {}

		for iter_13_0 = 1, #arg_12_2 do
			local var_13_2 = arg_12_2[iter_13_0].name
			local var_13_3 = Dvar.EBBAIAEICC(var_13_2)
			local var_13_4 = arg_12_2[iter_13_0].overrideSetValues
			local var_13_5

			if var_13_4 then
				var_13_5 = var_0_9(var_13_4, arg_13_0)
			elseif var_13_3 == DvarTypeTable.DvarString or var_13_3 == DvarTypeTable.DvarEnum then
				var_13_5 = var_0_9(arg_12_3, arg_13_0)
			elseif var_13_3 == DvarTypeTable.DvarInt then
				var_13_5 = arg_13_0
			elseif var_13_3 == DvarTypeTable.DvarBool then
				var_13_5 = false

				if arg_13_0 == 2 then
					var_13_5 = true
				end
			end

			var_13_1[var_13_2] = var_13_5

			if arg_12_2[iter_13_0].showKeepSettingPopup then
				var_13_0 = true
			end
		end

		SetVarValues(arg_12_0, arg_12_1, var_13_1, arg_12_4, var_13_0)
	end
end

local function var_0_12(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_14_3
	})

	var_14_0.id = "Adapter"

	var_14_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)

	var_14_0.buttonDescription = Engine.CBBHFCGDIC(arg_14_2)

	var_14_0.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_14_1)), 0)
	var_14_0.Text:SetAlignment(LUI.Alignment.Left)

	return var_14_0
end

local function var_0_13(arg_15_0, arg_15_1)
	local var_15_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_15_1)
	local var_15_1 = StringTable.DIFCHIGDFB(CSV.stickLayouts.file, CSV.stickLayouts.cols.cfg, var_15_0, CSV.stickLayouts.cols.name)
	local var_15_2 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_15_1
	})
	local var_15_3 = Engine.CBBHFCGDIC("MENU/STICK_LAYOUT")

	var_15_2.id = "StickLayout"

	var_15_2:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)
	var_15_2.Text:setText(var_15_3)

	var_15_2.buttonName = var_15_3

	var_15_2.Text:SetAlignment(LUI.Alignment.Left)
	var_15_2.DynamicText:setText(Engine.CBBHFCGDIC(var_15_1))
	var_15_2:SetButtonDisabled(var_0_2())
	var_15_2:addEventHandler("refresh", function()
		var_15_2:SetButtonDisabled(var_0_2())
	end)
	var_15_2:addEventHandler("button_action", function(arg_17_0, arg_17_1)
		if arg_17_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			LUI.FlowManager.RequestAddMenu("StickLayout", true, arg_15_1, false)
		end
	end)

	return var_15_2
end

local function var_0_14(arg_18_0, arg_18_1)
	local var_18_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_18_1)
	local var_18_1 = OPTIONS.buttonLayoutStrings[var_18_0] and OPTIONS.buttonLayoutStrings[var_18_0] or "MENU/NOMAD_TACTICAL_ALT"
	local var_18_2 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_18_1
	})
	local var_18_3 = Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT")

	var_18_2.id = "ButtonLayout"

	var_18_2:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)
	var_18_2.Text:setText(var_18_3)

	var_18_2.buttonName = var_18_3

	var_18_2.Text:SetAlignment(LUI.Alignment.Left)
	var_18_2.DynamicText:setText(Engine.CBBHFCGDIC(var_18_1))
	var_18_2:SetButtonDisabled(var_0_2())
	var_18_2:addEventHandler("refresh", function()
		var_18_2:SetButtonDisabled(var_0_2())
	end)
	var_18_2:addEventHandler("button_action", function(arg_20_0, arg_20_1)
		if arg_20_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_18_1, false)
		end
	end)

	return var_18_2
end

local function var_0_15(arg_21_0, arg_21_1)
	local var_21_0 = {}

	OPTIONS.AddOptionsToTable(arg_21_0, arg_21_1, var_21_0, CSV.videoOptionsOldMenu)

	if Engine.BHICADFIHA() and not Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
		table.insert(var_21_0, OPTIONS.GetGunsmithDebugButton(_1080p * 50, arg_21_1))
	end

	return var_21_0
end

local function var_0_16(arg_22_0, arg_22_1)
	local var_22_0 = {}

	OPTIONS.AddOptionsToTable(arg_22_0, arg_22_1, var_22_0, CSV.networkOptions)

	return var_22_0
end

local function var_0_17(arg_23_0, arg_23_1)
	local var_23_0 = {}

	if Engine.EAIICIFIFA() then
		var_23_0[#var_23_0 + 1] = OPTIONS.CreateOption(arg_23_0, arg_23_1, OPTIONS_DATA.optionsDataList.musicPlaylist)
	end

	OPTIONS.AddOptionsToTable(arg_23_0, arg_23_1, var_23_0, CSV.audioOptionsOldMenu)

	return var_23_0
end

local function var_0_18(arg_24_0, arg_24_1)
	local var_24_0 = {}

	OPTIONS.AddOptionsToTable(arg_24_0, arg_24_1, var_24_0, CSV.controlOptions)

	return var_24_0
end

local function var_0_19(arg_25_0, arg_25_1)
	local var_25_0 = {}

	OPTIONS.AddOptionsToTable(arg_25_0, arg_25_1, var_25_0, CSV.voiceOptions)

	return var_25_0
end

local function var_0_20(arg_26_0)
	assert(arg_26_0 >= 2 and arg_26_0 <= 5)

	if arg_26_0 >= 3 then
		return arg_26_0 - 3
	else
		return 3
	end
end

local function var_0_21(arg_27_0)
	assert(arg_27_0 >= 0 and arg_27_0 <= 3)

	if arg_27_0 <= 2 then
		return arg_27_0 + 3
	else
		return 2
	end
end

local function var_0_22(arg_28_0, arg_28_1)
	if arg_28_0 == 1 or arg_28_0 == 2 then
		return arg_28_0
	else
		return arg_28_1
	end
end

local function var_0_23(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_1 and "MENU/CDN_ENABLED_TEXTURE_PACKS_DETECTED" or "MENU/CDN_ENABLE_FAILED_NOT_ENOUGH_DISK_SPACE_TEXTURE_PACKS_DETECTED"
	local var_29_1 = {
		label = Engine.CBBHFCGDIC("MENU/OPEN_TEXTURE_PACKS_UNINSTALL_INSTRUCTIONS"),
		action = function()
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_29_2, false)
		end
	}
	local var_29_2 = {
		label = Engine.CBBHFCGDIC("MENU/DISMISS"),
		action = function()
			return
		end
	}

	arg_29_0.buttons = {
		var_29_1,
		var_29_2
	}
	arg_29_0.title = Engine.CBBHFCGDIC("MENU/NOTICE")
	arg_29_0.message = Engine.CBBHFCGDIC(var_29_0)
end

OPTIONS_DATA.optionsCategory = {
	voiceOptions = "voice_options",
	controlOptions = "control_options",
	networkDiagnosticOptions = "network_diagnostic_options",
	audioOptions = "audio_options",
	videoOptions = "video_options"
}

local function var_0_24(arg_32_0, arg_32_1)
	local var_32_0

	if arg_32_1 == OPTIONS_DATA.optionsCategory.videoOptions then
		var_32_0 = arg_32_0.VideoOptions
	elseif arg_32_1 == OPTIONS_DATA.optionsCategory.audioOptions then
		var_32_0 = arg_32_0.AudioOptions
	elseif arg_32_1 == OPTIONS_DATA.optionsCategory.networkDiagnosticOptions then
		var_32_0 = arg_32_0.NetworkDiagnosticOptions
	elseif arg_32_1 == OPTIONS_DATA.optionsCategory.controlOptions then
		var_32_0 = arg_32_0.ControlOptions
	elseif arg_32_1 == OPTIONS_DATA.optionsCategory.voiceOptions then
		var_32_0 = arg_32_0.VoiceOptions
	else
		var_32_0 = arg_32_0.VideoOptions
	end

	return var_32_0
end

local function var_0_25(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	if arg_33_3 == "AdsMouseSensitivityPerZoomOption" and arg_33_4 == 1 then
		return 1
	end
end

local function var_0_26(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	if arg_34_3 == "AdsStickSensitivityPerZoomOption" and arg_34_4 == 1 then
		return 1
	end
end

function OPTIONS_DATA.UpdateOptionsWindow(arg_35_0, arg_35_1, arg_35_2)
	LUI.FlowManager.GetScopedData(arg_35_0).currentOptionsCategory = arg_35_1

	local var_35_0
	local var_35_1 = var_0_24(arg_35_0, arg_35_1)

	if arg_35_1 == OPTIONS_DATA.optionsCategory.videoOptions then
		var_35_0 = var_0_15
	elseif arg_35_1 == OPTIONS_DATA.optionsCategory.audioOptions then
		var_35_0 = var_0_17
	elseif arg_35_1 == OPTIONS_DATA.optionsCategory.networkDiagnosticOptions then
		var_35_0 = var_0_16
	elseif arg_35_1 == OPTIONS_DATA.optionsCategory.controlOptions then
		var_35_0 = var_0_18
	elseif arg_35_1 == OPTIONS_DATA.optionsCategory.voiceOptions then
		var_35_0 = var_0_19
	else
		var_35_0 = var_0_15
	end

	arg_35_0:processEvent({
		name = "category_changed",
		title = var_35_1.GenericOptionButtonBase.Title:getText(),
		createOptions = var_35_0,
		noFocus = arg_35_2
	})

	if arg_35_0.NetworkDiagnosticOptions ~= nil then
		if arg_35_1 == "network_diagnostic_options" then
			arg_35_0:processEvent({
				name = "network_diagnostic_show_internal"
			})
		else
			arg_35_0:processEvent({
				name = "network_diagnostic_hide_internal"
			})
		end
	end
end

OPTIONS_DATA.optionsDataList = {
	ButtonLayout = {
		labels = OPTIONS.GetCurrentButtonLayoutLabels,
		action = function(arg_36_0, arg_36_1, arg_36_2)
			local var_36_0 = arg_36_0:GetCurrentMenu()

			if var_36_0.ButtonLayoutOptionsMenu and not var_36_0.ButtonLayoutOptionsMenu.isBR then
				arg_36_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_36_1,
					index = arg_36_2
				})
			else
				local var_36_1 = CSV.ReadRow(CSV.buttonLayouts, arg_36_2 - 1)

				Engine.CBCIHEGADA(var_36_1.cfg, arg_36_1, false)
			end
		end,
		onRefresh = function(arg_37_0, arg_37_1, arg_37_2)
			if arg_37_0:GetCurrentMenu() then
				arg_37_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updatedVisual",
					controller = arg_37_1,
					index = arg_37_2
				})
			end
		end,
		onReset = function(arg_38_0, arg_38_1)
			arg_38_0:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				resetFlip = true,
				controller = arg_38_1
			})
		end,
		value = function(arg_39_0)
			local var_39_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_39_0)

			if string.match(var_39_0, "_alt$") then
				var_39_0 = string.gsub(var_39_0, "_alt", "")
			end

			local var_39_1 = OPTIONS.buttonLayoutStrings[var_39_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_39_1)))
		end,
		defaultOptionValue = function(arg_40_0)
			return 1
		end,
		specificAction = function(arg_41_0, arg_41_1, arg_41_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_41_0, arg_41_1, {
				showLayout = true,
				name = "buttonLayout"
			})
		end,
		customPreviewButtonAction = function(arg_42_0, arg_42_1)
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_42_1, false)
		end,
		buildCondition = function(arg_43_0)
			return not CONDITIONS.IsSplitscreen() and not CONDITIONS.IsMagmaGameMode()
		end
	},
	ButtonLayoutSplitscreen = {
		labels = OPTIONS.GetCurrentButtonLayoutLabels,
		action = function(arg_44_0, arg_44_1, arg_44_2)
			local var_44_0 = arg_44_0:GetCurrentMenu()

			if var_44_0.ButtonLayoutOptionsMenu and not var_44_0.ButtonLayoutOptionsMenu.isBR then
				arg_44_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_44_1,
					index = arg_44_2
				})
			else
				local var_44_1 = CSV.ReadRow(CSV.buttonLayouts, arg_44_2 - 1)

				Engine.CBCIHEGADA(var_44_1.cfg, arg_44_1, false)
			end
		end,
		value = function(arg_45_0)
			local var_45_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_45_0)

			if string.match(var_45_0, "_alt$") then
				var_45_0 = string.gsub(var_45_0, "_alt", "")
			end

			local var_45_1 = OPTIONS.buttonLayoutStrings[var_45_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_45_1)))
		end,
		defaultOptionValue = function(arg_46_0)
			return 1
		end,
		specificAction = function(arg_47_0, arg_47_1, arg_47_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_47_0, arg_47_1, {
				showLayout = false,
				name = "buttonLayout",
				showSwap = true
			})
		end,
		customPreviewButtonAction = function(arg_48_0, arg_48_1)
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_48_1, false)
		end,
		buildCondition = function(arg_49_0)
			return CONDITIONS.IsSplitscreen()
		end
	},
	StickLayout = {
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_50_0, arg_50_1, arg_50_2)
			if arg_50_0:GetCurrentMenu().StickLayoutOptionsMenu then
				arg_50_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_50_1,
					index = arg_50_2
				})
			else
				local var_50_0 = CSV.ReadRow(CSV.stickLayouts, arg_50_2 - 1)

				Engine.BEBBDFEICI(var_50_0.cfg, arg_50_1)
			end
		end,
		onRefresh = function(arg_51_0, arg_51_1, arg_51_2)
			if arg_51_0:GetCurrentMenu() then
				arg_51_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updatedVisual",
					controller = arg_51_1,
					index = arg_51_2
				})
			end
		end,
		value = function(arg_52_0)
			local var_52_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_52_0)
			local var_52_1 = OPTIONS.stickLayoutStrings[var_52_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_52_1)))
		end,
		defaultOptionValue = function(arg_53_0)
			return 1
		end,
		specificAction = function(arg_54_0, arg_54_1, arg_54_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_54_0, arg_54_1, {
				showLayout = true,
				name = "stickLayout"
			})
		end,
		customPreviewButtonAction = function(arg_55_0, arg_55_1)
			LUI.FlowManager.RequestAddMenu("StickLayout", true, arg_55_1, false)
		end,
		buildCondition = function(arg_56_0)
			return not CONDITIONS.IsSplitscreen()
		end
	},
	StickLayoutSplitscreen = {
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_57_0, arg_57_1, arg_57_2)
			if arg_57_0:GetCurrentMenu().StickLayoutOptionsMenu then
				arg_57_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_57_1,
					index = arg_57_2
				})
			else
				local var_57_0 = CSV.ReadRow(CSV.stickLayouts, arg_57_2 - 1)

				Engine.BEBBDFEICI(var_57_0.cfg, arg_57_1)
			end
		end,
		value = function(arg_58_0)
			local var_58_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_58_0)
			local var_58_1 = OPTIONS.stickLayoutStrings[var_58_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_58_1)))
		end,
		defaultOptionValue = function(arg_59_0)
			return 1
		end,
		specificAction = function(arg_60_0, arg_60_1, arg_60_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_60_0, arg_60_1, {
				showLayout = false,
				name = "stickLayout"
			})
		end,
		customPreviewButtonAction = function(arg_61_0, arg_61_1)
			LUI.FlowManager.RequestAddMenu("StickLayout", true, arg_61_1, false)
		end,
		buildCondition = function(arg_62_0)
			return CONDITIONS.IsSplitscreen()
		end
	},
	BRButtonLayout = {
		labels = OPTIONS.GetCurrentBRButtonLayoutLabels,
		action = function(arg_63_0, arg_63_1, arg_63_2)
			local var_63_0 = arg_63_0:GetCurrentMenu()

			if var_63_0.ButtonLayoutOptionsMenu and var_63_0.ButtonLayoutOptionsMenu.isBR then
				arg_63_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_63_1,
					index = arg_63_2
				})
			else
				local var_63_1 = CSV.ReadRow(CSV.brButtonLayouts, arg_63_2 - 1)

				Engine.CBCIHEGADA(var_63_1.cfg, arg_63_1, true)
			end
		end,
		onRefresh = function(arg_64_0, arg_64_1, arg_64_2)
			if arg_64_0:GetCurrentMenu() then
				arg_64_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updatedVisual",
					controller = arg_64_1,
					index = arg_64_2
				})
			end
		end,
		onReset = function(arg_65_0, arg_65_1)
			arg_65_0:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				resetFlip = true,
				controller = arg_65_1
			})
		end,
		value = function(arg_66_0)
			local var_66_0 = Engine.BECCFCBIAA("gpadBRButtonsConfig", arg_66_0)

			if string.match(var_66_0, "_alt$") then
				var_66_0 = string.gsub(var_66_0, "_alt", "")
			end

			local var_66_1 = OPTIONS.brButtonLayoutStrings[var_66_0]

			return (var_0_0(OPTIONS.GetBRButtonLayoutLabels(), Engine.CBBHFCGDIC(var_66_1)))
		end,
		defaultOptionValue = function(arg_67_0)
			return 1
		end,
		customPreviewButtonAction = function(arg_68_0, arg_68_1)
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_68_1, false)
		end,
		specificAction = function(arg_69_0, arg_69_1, arg_69_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_69_0, arg_69_1, {
				showLayout = true,
				name = "buttonLayout",
				isBR = true
			})
		end,
		buildCondition = function(arg_70_0)
			return CONDITIONS.IsMagmaGameMode()
		end
	},
	TargetAssist = {
		disabled = var_0_2
	},
	Tessellation = {
		action = function(arg_71_0, arg_71_1, arg_71_2)
			local var_71_0 = {
				"0_Off",
				"1_Near",
				"2_All"
			}

			Dvar.BDEHAEGHAF("MMNMQTSOSP", var_71_0[arg_71_2])
		end,
		value = function(arg_72_0)
			return Dvar.CFHDGABACF("MMNMQTSOSP") + 1
		end,
		defaultOptionValue = function(arg_73_0)
			return 2
		end
	},
	TexFilterAniso = {
		action = function(arg_74_0, arg_74_1, arg_74_2)
			local var_74_0 = {
				2,
				4,
				5
			}

			Dvar.DFIJDJFIFD("NSPQOSROQP", var_74_0[arg_74_2])
		end,
		value = function(arg_75_0)
			local var_75_0 = {
				2,
				4,
				5
			}
			local var_75_1 = Dvar.CFHDGABACF("NSPQOSROQP")

			if var_75_1 <= var_75_0[1] then
				return 1
			elseif var_75_1 <= var_75_0[2] then
				return 2
			elseif var_75_1 <= var_75_0[3] then
				return 3
			end
		end,
		defaultOptionValue = function(arg_76_0)
			return 2
		end
	},
	TextureRes = {
		action = function(arg_77_0, arg_77_1, arg_77_2)
			local var_77_0 = {
				3,
				2,
				1,
				0
			}

			Dvar.DFIJDJFIFD("NNTOQLMSLO", var_77_0[arg_77_2])
			Dvar.DFIJDJFIFD("MPMQRLKQQN", var_77_0[arg_77_2])
			Dvar.DFIJDJFIFD("NTROOKOSPM", var_77_0[arg_77_2])
		end,
		value = function()
			local var_78_0 = {
				3,
				2,
				1,
				0
			}

			return var_0_0(var_78_0, Dvar.CFHDGABACF("NNTOQLMSLO"))
		end
	},
	VoiceChatRealTimeProcessing = {
		disabled = var_0_4,
		value = function(arg_79_0)
			return 1
		end
	},
	CenterVehicleCamera = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/CENTER_VEHICLE_CAMERA_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/CENTER_VEHICLE_CAMERA_DESC")
			end
		end
	},
	Colorblind = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		customPreviewButtonAction = function(arg_81_0, arg_81_1)
			LUI.FlowManager.RequestAddMenu("ColorblindFullscreen", true, arg_81_1, false)
		end,
		action = function(arg_82_0, arg_82_1, arg_82_2)
			Engine.DAGFFDGFII("profile_setColorBlindMode " .. arg_82_2 - 1)
			arg_82_0:dispatchEventToCurrentMenu({
				name = "colorblind_updated",
				value = arg_82_2
			})
			arg_82_0:processEvent({
				name = "button_update_colorBlind",
				controllerIndex = arg_82_1
			})
		end,
		specificAction = function(arg_83_0, arg_83_1, arg_83_2)
			local var_83_0 = arg_83_1.SetActive

			function arg_83_1.SetActive(arg_84_0, arg_84_1)
				local var_84_0 = var_83_0(arg_84_0, arg_84_1)

				arg_83_0:processEvent({
					name = "colorblind_over"
				})

				if arg_83_0:GetCurrentMenu() then
					arg_83_0:dispatchEventToCurrentMenu({
						name = "colorblind_over",
						controller = arg_83_2,
						index = value
					})
				end

				return var_84_0
			end

			local var_83_1 = arg_83_1.RemoveActive

			function arg_83_1.RemoveActive(arg_85_0, arg_85_1)
				local var_85_0 = var_83_1(arg_85_0, arg_85_1)

				arg_83_0:processEvent({
					name = "colorblind_up"
				})

				if arg_83_0:GetCurrentMenu() then
					arg_83_0:dispatchEventToCurrentMenu({
						name = "colorblind_up",
						controller = arg_83_2,
						index = value
					})
				end

				return var_85_0
			end

			arg_83_1:addEventHandler("button_up", function(arg_86_0, arg_86_1)
				if arg_86_0.isBootOptions then
					arg_83_0:processEvent({
						name = "colorblind_up"
					})

					if arg_83_0:GetCurrentMenu() then
						arg_83_0:dispatchEventToCurrentMenu({
							name = "colorblind_up",
							controller = arg_83_2,
							index = value
						})
					end
				end
			end)
		end,
		getSpecificImage = function(arg_87_0, arg_87_1)
			return OPTIONS.GetColorBlindSpecificImage(arg_87_1)
		end,
		isDependencyDisabled = function(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
			return arg_88_2 == 1
		end,
		disabled = function()
			local var_89_0 = Dvar.IBEGCHEFE("NQROMTQPMT")

			return not Engine.DDJFBBJAIG() and var_89_0
		end
	},
	ColorblindFilter = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		labels = OPTIONS.colorBlindTargetLabels,
		action = function(arg_90_0, arg_90_1, arg_90_2)
			OPTIONS.ColorBlindTargetsSelect(arg_90_2, arg_90_1)
			arg_90_0:processEvent({
				name = "button_update_colorBlind",
				controllerIndex = arg_90_1
			})
		end,
		value = function(arg_91_0)
			local var_91_0, var_91_1 = Engine.CBCJIDDIED(arg_91_0)
			local var_91_2 = var_91_0 and var_91_1

			return 1 + (var_91_1 and 1 or 0) + (var_91_2 and 1 or 0)
		end,
		defaultOptionValue = function(arg_92_0, arg_92_1)
			return 2
		end,
		getSpecificImage = function(arg_93_0, arg_93_1)
			return OPTIONS.GetColorBlindSpecificImage(arg_93_1)
		end,
		disabled = function()
			local var_94_0 = Dvar.IBEGCHEFE("NQROMTQPMT")

			return not Engine.DDJFBBJAIG() and var_94_0
		end
	},
	FramerateLimit = {
		isDependencyDisabled = function(arg_95_0, arg_95_1, arg_95_2, arg_95_3)
			return arg_95_2 == 1
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("RLPRTPPQM") and 2 or 1
		end
	},
	CustomFramerateLimit = {
		defaultOptionValue = function()
			local var_97_0 = Dvar.DBGFIDHBFC("MOOSMQQPSQ")

			Dvar.DFIJDJFIFD("MOOSMQQPSQ", var_97_0)

			return var_97_0
		end
	},
	MenuCustomFramerateLimit = {
		defaultOptionValue = function()
			local var_98_0 = Dvar.DBGFIDHBFC("NOTKKOKSQO")

			Dvar.DFIJDJFIFD("NOTKKOKSQO", var_98_0)

			return var_98_0
		end
	},
	OutOfFocusCustomFramerateLimit = {
		defaultOptionValue = function()
			local var_99_0 = Dvar.DBGFIDHBFC("NMLTRQRNTM")

			Dvar.DFIJDJFIFD("NMLTRQRNTM", var_99_0)

			return var_99_0
		end
	},
	GeneralSubCategoryHDR = {
		buildCondition = function(arg_100_0)
			return var_0_7() or Engine.DJDAJEJDE()
		end
	},
	DismembermentOption = {
		action = function(arg_101_0, arg_101_1, arg_101_2)
			Dvar.DHEGHJJJHI("OQLRMLRK", arg_101_2 == 2)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_101_1)
		end,
		value = function(arg_102_0)
			return Dvar.IBEGCHEFE("OQLRMLRK") and 2 or 1
		end,
		defaultOptionValue = function(arg_103_0)
			return 2
		end,
		buildCondition = function()
			return Engine.CIDEADAABH()
		end
	},
	HDR = {
		isDependencyDisabled = function(arg_105_0, arg_105_1, arg_105_2, arg_105_3)
			if arg_105_3 == "Brightness" or arg_105_3 == "SDRColorSpace" then
				return arg_105_2 == 2
			else
				return arg_105_2 == 1
			end
		end,
		action = function(arg_106_0, arg_106_1, arg_106_2)
			Dvar.DHEGHJJJHI("MTONTNKOKR", arg_106_2 == 2)
			Engine.EBIDFIDHIE("vid_reconfig")
		end,
		buildCondition = var_0_7
	},
	HDRBrightness = {
		action = function(arg_107_0, arg_107_1, arg_107_2)
			arg_107_2 = Mirror(arg_107_2, SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)

			Dvar.IICIFEEDC("PPNORSOSS", arg_107_2)
		end,
		value = function(arg_108_0)
			return Mirror(Dvar.BJJCJHDBII("PPNORSOSS"), SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)
		end,
		buildCondition = function(arg_109_0)
			return Engine.DJDAJEJDE()
		end
	},
	HDRCalibration = {
		action = function(arg_110_0, arg_110_1, arg_110_2)
			Engine.DAGFFDGFII("profile_UpdateProfileMenuOptionsHDRLumDvars")
			LUI.FlowManager.RequestPopupMenu(unused, "BootHDRBlackPoint", true, arg_110_1, false, {
				fromOptionMenu = true
			}, true, true)
		end,
		buildCondition = function(arg_111_0)
			return Engine.DJDAJEJDE()
		end
	},
	InternalIPAddress = {
		name = function()
			local var_112_0 = Dvar.IBEGCHEFE("SQMORMQQS")

			return Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS", var_112_0 and Engine.JCBDICCAH(NetworkInfo.DBDIHEIEGB()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_113_0, arg_113_1, arg_113_2)
			local var_113_0 = arg_113_2 == 2
			local var_113_1 = Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS", var_113_0 and Engine.JCBDICCAH(NetworkInfo.DBDIHEIEGB()) or "LUA_MENU/HIDDEN")
			local var_113_2 = arg_113_0:GetCurrentMenu()

			if var_113_2 then
				var_113_2.OptionName:setText(ToUpperCase(var_113_1))
			end

			arg_113_0.buttonName = var_113_1

			arg_113_0.GenericOptionButtonBase.Title:setText(var_113_1)
		end,
		defaultOptionValue = function(arg_114_0)
			return 1
		end
	},
	ExternalIPAddress = {
		name = function()
			local var_115_0 = Dvar.IBEGCHEFE("MTSPMPOSTO")

			return Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS", var_115_0 and Engine.JCBDICCAH(NetworkInfo.BBJBJGDIGD()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_116_0, arg_116_1, arg_116_2)
			local var_116_0 = arg_116_2 == 2
			local var_116_1 = Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS", var_116_0 and Engine.JCBDICCAH(NetworkInfo.BBJBJGDIGD()) or "LUA_MENU/HIDDEN")
			local var_116_2 = arg_116_0:GetCurrentMenu()

			if var_116_2 then
				var_116_2.OptionName:setText(ToUpperCase(var_116_1))
			end

			arg_116_0.buttonName = var_116_1

			arg_116_0.GenericOptionButtonBase.Title:setText(var_116_1)
		end,
		defaultOptionValue = function(arg_117_0)
			return 1
		end
	},
	GeographicalRegion = {
		name = function()
			local var_118_0 = Dvar.IBEGCHEFE("MKMOPQKMPO")

			return Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION", var_118_0 and Engine.JCBDICCAH(NetworkInfo.BGJIBGHBAG()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_119_0, arg_119_1, arg_119_2)
			local var_119_0 = arg_119_2 == 2
			local var_119_1 = Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION", var_119_0 and Engine.JCBDICCAH(NetworkInfo.BGJIBGHBAG()) or "LUA_MENU/HIDDEN")
			local var_119_2 = arg_119_0:GetCurrentMenu()

			if var_119_2 then
				var_119_2.OptionName:setText(ToUpperCase(var_119_1))
			end

			arg_119_0.buttonName = var_119_1

			arg_119_0.GenericOptionButtonBase.Title:setText(var_119_1)
		end,
		defaultOptionValue = function(arg_120_0)
			return 1
		end
	},
	ConnectionMeter = {
		value = function(arg_121_0)
			return Dvar.IBEGCHEFE("OMOTRTTLNP") and 1 or 2
		end,
		action = function(arg_122_0, arg_122_1, arg_122_2)
			Dvar.DHEGHJJJHI("OMOTRTTLNP", arg_122_2 == 1)
		end,
		onRefresh = function(arg_123_0, arg_123_1, arg_123_2)
			arg_123_0:processEvent({
				name = "connection_meter_toggle"
			})
		end,
		specificAction = function(arg_124_0, arg_124_1, arg_124_2)
			arg_124_1:addEventHandler("connection_meter_toggle", function(arg_125_0, arg_125_1)
				arg_124_0:processEvent({
					name = "connection_meter_toggle_internal"
				})
				Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_124_2)
			end)
		end,
		defaultOptionValue = function(arg_126_0)
			return 1
		end
	},
	DebugKeyboard = {
		action = function(arg_127_0, arg_127_1, arg_127_2)
			Engine.DAGFFDGFII("profile_toggleDevKeyboard")
		end,
		defaultOptionValue = function(arg_128_0)
			return 1
		end,
		value = function(arg_129_0)
			return Engine.BECCFCBIAA("useDevKeyboard", arg_129_0) and 2 or 1
		end
	},
	NewTextChatDebug = {
		action = function(arg_130_0, arg_130_1, arg_130_2)
			local var_130_0 = arg_130_2 == 2

			Dvar.DHEGHJJJHI("LKSKPKTOON", var_130_0)
			Dvar.DHEGHJJJHI("NNOQMLNSMP", not var_130_0)
			Dvar.DHEGHJJJHI("NLPSQMQRTP", not var_130_0)
			LUI.UIRoot.ReloadChatForDebugOption()
		end,
		defaultOptionValue = function(arg_131_0)
			return 1
		end
	},
	KeybindChangeLoadoutExpander = {
		buildCondition = function()
			return not CONDITIONS.IsSplitscreen()
		end
	},
	OnlineDebug = {
		defaultOptionValue = function(arg_133_0)
			return 1
		end,
		buildCondition = function()
			return Debug.CGCBEDDFEC()
		end
	},
	DoNotSellMyData = {
		action = function(arg_135_0, arg_135_1, arg_135_2)
			if arg_135_2 == OPTIONS.disableButtonOptions.ENABLED then
				local var_135_0 = {
					yesAction = function()
						Regulations.DAACCJJHEG(arg_135_1, OPTIONS.regulationType.CCPA, OPTIONS.regulationPreference.OPT_OUT)
					end,
					noAction = function()
						arg_135_0.currentValue = OPTIONS.disableButtonOptions.DISABLED

						arg_135_0:UpdateContent()
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "EnableCCPAWarning", true, arg_135_1, false, var_135_0)
			elseif arg_135_2 == OPTIONS.disableButtonOptions.DISABLED then
				Regulations.DAACCJJHEG(arg_135_1, OPTIONS.regulationType.CCPA, OPTIONS.regulationPreference.OPT_IN)
			end
		end,
		value = function(arg_138_0)
			local var_138_0 = Regulations.BHFFIJBAEG(arg_138_0, OPTIONS.regulationType.CCPA)
			local var_138_1 = OPTIONS.disableButtonOptions.DISABLED

			if var_138_0 and var_138_0 == OPTIONS.regulationPreference.OPT_OUT then
				var_138_1 = OPTIONS.disableButtonOptions.ENABLED
			end

			return var_138_1
		end,
		defaultOptionValue = function(arg_139_0)
			return OPTIONS.disableButtonOptions.DISABLED
		end,
		buildCondition = function(arg_140_0)
			if Engine.BIIBDBAHD() then
				local var_140_0 = Regulations.BGEIIEHJFD(arg_140_0, OPTIONS.regulationType.CCPA)

				return var_140_0 and var_140_0 == OPTIONS.regulationEnforcement.ENFORCED
			else
				return false
			end
		end,
		disabled = function(arg_141_0)
			local var_141_0 = Regulations.BGEIIEHJFD(arg_141_0, OPTIONS.regulationType.CCPA)

			return not var_141_0 or var_141_0 ~= OPTIONS.regulationEnforcement.ENFORCED
		end
	},
	WeaponMountingMovementExit = {
		isDependencyDisabled = function(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
			return arg_142_2 == 1
		end,
		buildCondition = var_0_8
	},
	WeaponMountingMovementExitController = {
		buildCondition = var_0_8
	},
	ADSFOV = {
		applyableOverride = false,
		applyable = false,
		defaultOptionValue = function(arg_143_0)
			return 1
		end
	},
	MouseAdsUseMonitorDistance = {
		isDependencyDisabled = function(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
			return arg_144_2 == 1
		end,
		defaultOptionValue = function(arg_145_0)
			return 2
		end
	},
	VoiceChatRecordingMode = {
		action = function(arg_146_0, arg_146_1, arg_146_2)
			Dvar.DHEGHJJJHI("MOOMTQSMPS", arg_146_2 == 1)
		end,
		value = function(arg_147_0, arg_147_1, arg_147_2)
			return Dvar.IBEGCHEFE("MOOMTQSMPS") and 1 or 2
		end,
		defaultOptionValue = function(arg_148_0, arg_148_1, arg_148_2)
			return Dvar.DBGFIDHBFC("MOOMTQSMPS") and 1 or 2
		end,
		isDependencyDisabled = function(arg_149_0, arg_149_1, arg_149_2, arg_149_3)
			if arg_149_3 == "OpenMicRecordingSensitivity" then
				return arg_149_2 == 1
			elseif arg_149_3 == "VoiceChat" then
				return arg_149_2 == 2
			end
		end
	},
	UseVoiceCom = {
		isDependencyDisabled = function(arg_150_0, arg_150_1, arg_150_2, arg_150_3)
			return arg_150_2 == 1
		end,
		defaultOptionValue = function(arg_151_0)
			return 2
		end
	},
	DisplayGamma = {
		value = function(arg_152_0)
			return 1
		end,
		defaultOptionValue = function(arg_153_0)
			return 2
		end,
		buildCondition = function()
			return false
		end
	},
	VSync = {
		action = function(arg_155_0, arg_155_1, arg_155_2)
			if CONDITIONS.IsConsoleGame() then
				Dvar.DHEGHJJJHI("MPPNRRRPMP", arg_155_2)
			else
				Dvar.DFIJDJFIFD("MPPNRRRPMP", arg_155_2 - 1)
			end
		end,
		value = function(arg_156_0)
			if not Engine.CAFCFHEFDD() and Dvar.CFHDGABACF("NNSQSMTQPP") == 0 then
				return 1
			else
				return Dvar.IBEGCHEFE("MPPNRRRPMP") and 2 or 1
			end
		end,
		defaultOptionValue = function(arg_157_0)
			return Dvar.DBGFIDHBFC("MPPNRRRPMP") + 1
		end,
		disabled = function()
			return not Engine.CAFCFHEFDD() and Dvar.CFHDGABACF("NNSQSMTQPP") == 0
		end
	},
	CPUPriority = {
		defaultOptionValue = function(arg_159_0)
			return 2
		end
	},
	ParticleLighting = {
		value = function()
			local var_160_0 = {
				2,
				3,
				4,
				5
			}
			local var_160_1 = Dvar.CFHDGABACF("MTNMRSTQN")
			local var_160_2 = 1

			if var_160_1 <= var_160_0[1] then
				var_160_2 = 1
			elseif var_160_1 <= var_160_0[2] then
				var_160_2 = 2
			elseif var_160_1 <= var_160_0[3] then
				var_160_2 = 3
			elseif var_160_1 <= var_160_0[4] then
				var_160_2 = 4
			end

			return var_160_2
		end,
		action = function(arg_161_0, arg_161_1, arg_161_2)
			local var_161_0 = {
				2,
				3,
				4,
				5
			}
			local var_161_1 = {
				64,
				32,
				24,
				16
			}

			Dvar.DFIJDJFIFD("MTNMRSTQN", var_161_0[arg_161_2])
			Dvar.IICIFEEDC("PSTSNKNPR", var_161_1[arg_161_2])
		end,
		labels = {
			Engine.CBBHFCGDIC("MENU/QUALITY_LOW"),
			Engine.CBBHFCGDIC("MENU/QUALITY_NORMAL"),
			Engine.CBBHFCGDIC("MENU/QUALITY_HIGH"),
			Engine.CBBHFCGDIC("MENU/QUALITY_ULTRA")
		}
	},
	ParticleQuality = {
		value = function()
			return Dvar.IBEGCHEFE("MPRNRNTNNQ") and 1 or 2
		end,
		defaultOptionValue = function(arg_163_0)
			return 1
		end,
		action = function(arg_164_0, arg_164_1, arg_164_2)
			Dvar.DHEGHJJJHI("MPRNRNTNNQ", arg_164_2 == 1)
		end
	},
	VoiceChatMuteAllStrategy = {
		action = function(arg_165_0, arg_165_1, arg_165_2)
			local var_165_0 = arg_165_2 ~= MuteStrategy.MuteStrategyMuteAll + 1

			Dvar.DHEGHJJJHI("cl_voice", var_165_0)
			Lobby.HCCAGAJGJ(arg_165_1, arg_165_2 - 1)
		end,
		value = function(arg_166_0)
			return Lobby.BJFFJACJDD(arg_166_0) + 1
		end,
		isDependencyDisabled = function(arg_167_0, arg_167_1, arg_167_2, arg_167_3)
			return arg_167_2 == 2
		end,
		defaultOptionValue = function(arg_168_0)
			return Engine.IEBBJFBE("voiceMuteStrategy", arg_168_0) + 1
		end
	},
	CrossPlay = {
		action = function(arg_169_0, arg_169_1, arg_169_2)
			local var_169_0 = Engine.BBHCDCACGA(arg_169_1, arg_169_2 == OPTIONS.disableButtonOptions.ENABLED)

			if Lobby.GFFECBCCF() or CONDITIONS.IsSingleplayer() then
				if arg_169_2 == OPTIONS.disableButtonOptions.ENABLED then
					Dvar.DHEGHJJJHI("QOTNQOSRN", true)
					Social.CEFBABBCGD(arg_169_1, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_WARNING"))
				else
					Social.CEFBABBCGD(arg_169_1, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_DISABLED"))
				end
			end

			if var_169_0 then
				ACTIONS.UploadStats(arg_169_0, arg_169_1)

				if not Engine.CAADCDEEIA() and enabled == 0 and Friends.BAGCHIDGCC() then
					Engine.DAGFFDGFII("xstopprivateparty 1 1")
					Engine.DAGFFDGFII("xstartprivateparty")
					LUI.FlowManager.RequestPopupMenu(nil, "CrossPlayDisabledPrivatePartyBackoutMessage", true, arg_169_1, false, {}, nil, true, true)
				end
			end
		end,
		value = function(arg_170_0)
			return Engine.FIDIEBFAG(arg_170_0) and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end,
		defaultOptionValue = function(arg_171_0)
			if Engine.ECAJCAJJGF() or Engine.DJFGIIBCBH(arg_171_0) then
				return 1
			else
				return 2
			end
		end,
		disabled = function(arg_172_0)
			return not Engine.DJFGIIBCBH(arg_172_0)
		end,
		buildCondition = function(arg_173_0)
			return not Engine.ECAJCAJJGF()
		end
	},
	Adapter = {
		value = function()
			local var_174_0 = Dvar.DHEEJCCJBH("MPLSTSPKPT")

			return (var_0_0(Engine.CJCDDGBHJI(), var_174_0))
		end,
		action = function(arg_175_0, arg_175_1, arg_175_2)
			local var_175_0 = Engine.CJCDDGBHJI()

			Dvar.BDEHAEGHAF("MPLSTSPKPT", var_175_0[arg_175_2])
		end,
		labels = function()
			return Engine.CJCDDGBHJI()
		end,
		disabled = function()
			return not Engine.DDJFBBJAIG()
		end
	},
	ADSStickSensitivity = {
		disabled = var_0_4
	},
	ADSWeaponDepthofField = {
		disabled = var_0_4
	},
	AdvancedVideo = {
		action = function(arg_178_0, arg_178_1)
			LUI.FlowManager.RequestAddMenu("AdvancedVideoOptions", true, arg_178_1)
		end
	},
	AimAssist = {
		action = function(arg_179_0, arg_179_1, arg_179_2)
			Engine.DFJDIFJEGA("hasPlayerChangedAimAssistSetting", 1, arg_179_1)

			if arg_179_2 == 1 then
				Engine.DFJDIFJEGA("autoAim", 0, arg_179_1)
				Engine.DFJDIFJEGA("targetAssist", 0, arg_179_1)
			else
				Engine.DFJDIFJEGA("autoAim", 1, arg_179_1)
				Engine.DFJDIFJEGA("targetAssist", 1, arg_179_1)
				Engine.DFJDIFJEGA("aimAssistType", arg_179_2 - 1, arg_179_1)
			end
		end,
		defaultOptionValue = function(arg_180_0)
			if Engine.IEBBJFBE("autoAim") then
				return Engine.IEBBJFBE("aimAssistType") + 1
			else
				return 1
			end
		end,
		value = function(arg_181_0)
			if not Engine.BECCFCBIAA("autoAim", arg_181_0) then
				return 1
			else
				return Engine.BECCFCBIAA("aimAssistType", arg_181_0) + 1
			end
		end,
		disabled = var_0_2
	},
	AimResponseCurveType = {
		action = function(arg_182_0, arg_182_1, arg_182_2)
			Engine.DFJDIFJEGA("aimResponseCurveType", arg_182_2, arg_182_1)
		end,
		value = function(arg_183_0)
			return Engine.BECCFCBIAA("aimResponseCurveType", arg_183_0)
		end,
		defaultOptionValue = function(arg_184_0, arg_184_1)
			return Engine.IEBBJFBE("aimResponseCurveType")
		end,
		disabled = var_0_2
	},
	AimAssistFOVScale = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("OMMKPSMQOL")
		end
	},
	AimAssistType = {
		action = function(arg_186_0, arg_186_1, arg_186_2)
			Engine.DEEDAHEFAJ(arg_186_1, arg_186_2)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_186_1)
		end,
		defaultOptionValue = function(arg_187_0, arg_187_1)
			return Engine.IEBBJFBE("aimAssistType")
		end,
		value = function(arg_188_0)
			return Engine.BECCFCBIAA("aimAssistType", arg_188_0)
		end
	},
	AntiAliasing = {
		labels = function()
			local var_189_0 = {
				Engine.CBBHFCGDIC("MENU/OFF"),
				Engine.CBBHFCGDIC("MENU/SMAA_1X")
			}

			if Engine.CGDBBICBA() then
				var_189_0[#var_189_0 + 1] = Engine.CBBHFCGDIC("MENU/SMAA_TEMPORAL")
				var_189_0[#var_189_0 + 1] = Engine.CBBHFCGDIC("MENU/FILMIC_SMAA_T2X")
			end

			return var_189_0
		end,
		action = function(arg_190_0, arg_190_1, arg_190_2)
			if not (Dvar.CFHDGABACF("MQOMSSQRRQ") == 4) and arg_190_2 >= 1 then
				Dvar.DFIJDJFIFD("MLNLRLRPQL", arg_190_2 - 1)
				Dvar.DFIJDJFIFD("MQOMSSQRRQ", arg_190_2 - 1)
			end
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("MQOMSSQRRQ") + 1
		end,
		onDependencyParentRefresh = function(arg_192_0, arg_192_1, arg_192_2, arg_192_3, arg_192_4)
			if arg_192_3 == "DXR" and arg_192_4 ~= OPTIONS.disableButtonOptions.DISABLED then
				return 4
			end
		end
	},
	ArmorPlate = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled()
		end
	},
	ArmorPlateApplyAllGamepad = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("LOLOTKQLLN")
		end
	},
	ArmorPlateApplyAllKBM = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("LOLOTKQLLN")
		end
	},
	AspectRatio = {
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/ASPECT_RATIO") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/ASPECT_RATIO_DESC") or nil,
		labels = {
			Engine.CBBHFCGDIC("MENU/AUTOMATIC"),
			Engine.CBBHFCGDIC("MENU/WIDE_16_10"),
			Engine.CBBHFCGDIC("MENU/WIDE_16_9"),
			Engine.CBBHFCGDIC("MENU/WIDE_21_9"),
			Engine.CBBHFCGDIC("MENU/WIDE_32_9")
		},
		value = function(arg_196_0)
			local var_196_0 = Dvar.CFHDGABACF("QKKMRRLRR")

			return (LUI.clamp(var_196_0 - 1, 1, 6))
		end,
		action = function(arg_197_0, arg_197_1, arg_197_2)
			local var_197_0 = ({
				0,
				3,
				4,
				5,
				6
			})[arg_197_2]

			Dvar.DFIJDJFIFD("QKKMRRLRR", var_197_0)

			local var_197_1 = OPTIONS.InitOptionsList(arg_197_0, arg_197_1)
			local var_197_2 = OPTIONS.GetOptionsDataByIdentifier(arg_197_0, arg_197_1, var_197_1, "HudBoundsH", CSV.generalOptions)
			local var_197_3 = OPTIONS.GetOptionsDataByIdentifier(arg_197_0, arg_197_1, var_197_1, "HudBoundsV", CSV.generalOptions)
			local var_197_4 = var_197_2.defaultOptionValue(arg_197_0, arg_197_1)
			local var_197_5 = var_197_3.defaultOptionValue(arg_197_0, arg_197_1)

			Dvar.IICIFEEDC(var_197_2.dvar, var_197_4)
			Dvar.IICIFEEDC(var_197_3.dvar, var_197_5)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_197_1)
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("QKKMRRLRR") + 1
		end
	},
	AutomaticMantle = {
		disabled = var_0_4
	},
	AutoForwardAction = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("SKRROQNKK")
		end
	},
	AutoForwardEnabledGamepad = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("SKRROQNKK")
		end
	},
	AutoSprintGamepad = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("OLMPNPQOML")
		end,
		action = function(arg_202_0, arg_202_1, arg_202_2)
			Engine.DFJDIFJEGA("autoSprintGamepad", arg_202_2 - 1, arg_202_1)
		end,
		defaultOptionValue = function(arg_203_0, arg_203_1)
			return 1
		end,
		value = function(arg_204_0)
			return Engine.BECCFCBIAA("autoSprintGamepad", arg_204_0) + 1
		end
	},
	AutoSprintKBM = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("OLMPNPQOML")
		end,
		action = function(arg_206_0, arg_206_1, arg_206_2)
			Engine.DFJDIFJEGA("autoSprintKBM", arg_206_2 - 1, arg_206_1)
		end,
		defaultOptionValue = function(arg_207_0, arg_207_1)
			return 1
		end,
		value = function(arg_208_0)
			return Engine.BECCFCBIAA("autoSprintKBM", arg_208_0) + 1
		end
	},
	Bandwidth = {
		name = function()
			local var_209_0 = NetworkInfo.HGEFAEJCE()

			return Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH", var_209_0)
		end
	},
	BreathSprintAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/SPRINT_HOLD_BREATH_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/SPRINT_HOLD_BREATH_DESC")
			end
		end
	},
	Brightness = {
		decimalPlacesToRound = 3,
		applyableOverride = false,
		applyable = false,
		value = function(arg_211_0)
			local var_211_0 = (Dvar.BJJCJHDBII("NMRKMSMTOO") - SliderBounds.Brightness.DvarMin) / (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) * 100

			return (LUI.clamp(var_211_0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max))
		end,
		defaultOptionValue = function(arg_212_0)
			local var_212_0 = (Dvar.DBGFIDHBFC("NMRKMSMTOO") - SliderBounds.Brightness.DvarMin) / (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) * 100

			return (LUI.clamp(var_212_0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max))
		end,
		action = function(arg_213_0, arg_213_1, arg_213_2)
			local var_213_0 = LUI.clamp(arg_213_2, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max) / 100 * (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) + SliderBounds.Brightness.DvarMin

			Dvar.IICIFEEDC("NMRKMSMTOO", var_213_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_213_1)

			if arg_213_0:GetCurrentMenu() then
				arg_213_0:dispatchEventToCurrentMenu({
					name = "brightness_updated"
				})
			end
		end,
		specificAction = function(arg_214_0, arg_214_1, arg_214_2)
			local var_214_0 = arg_214_1.SetActive

			function arg_214_1.SetActive(arg_215_0, arg_215_1)
				local var_215_0 = var_214_0(arg_215_0, arg_215_1)

				arg_214_0:processEvent({
					name = "brightness_over"
				})

				if arg_214_0:GetCurrentMenu() then
					arg_214_0:dispatchEventToCurrentMenu({
						name = "brightness_over",
						controller = arg_214_2,
						index = value
					})
				end

				return var_215_0
			end

			local var_214_1 = arg_214_1.RemoveActive

			function arg_214_1.RemoveActive(arg_216_0, arg_216_1)
				local var_216_0 = var_214_1(arg_216_0, arg_216_1)

				arg_214_0:processEvent({
					name = "brightness_up"
				})

				if arg_214_0:GetCurrentMenu() then
					arg_214_0:dispatchEventToCurrentMenu({
						name = "brightness_up",
						controller = arg_214_2,
						index = value
					})
				end

				return var_216_0
			end

			arg_214_1:addEventHandler("button_up", function(arg_217_0, arg_217_1)
				if arg_217_0.isBootOptions then
					arg_214_0:processEvent({
						name = "brightness_up"
					})

					if arg_214_0:GetCurrentMenu() then
						arg_214_0:dispatchEventToCurrentMenu({
							name = "brightness_up",
							controller = arg_214_2,
							index = value
						})
					end
				end
			end)
			arg_214_1:addEventHandler("optimal_video_update", function(arg_218_0, arg_218_1)
				local var_218_0 = LUI.clamp(Dvar.BJJCJHDBII("NMRKMSMTOO"), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max)

				arg_214_1:SetCurrentValue(var_218_0)
			end)
		end,
		customPreviewButtonAction = function(arg_219_0, arg_219_1)
			LUI.FlowManager.RequestAddMenu("BootBrightness", true, arg_219_1, false)
		end,
		buildCondition = function(arg_220_0)
			return not Engine.DJDAJEJDE() and Engine.BFDACIJIAD(arg_220_0)
		end
	},
	SDRColorSpace = {
		labels = function()
			return {
				Engine.JCBDICCAH("2.2 (sRGB)"),
				Engine.JCBDICCAH("2.4 (BT1886)")
			}
		end,
		action = function(arg_222_0, arg_222_1, arg_222_2)
			local var_222_0 = Dvar.DCEBHAJGCJ("NRQNOQMOPS")

			arg_222_2 = var_0_9(var_222_0, arg_222_2)

			Dvar.DAACJFEEDC("NRQNOQMOPS", arg_222_2)
		end,
		value = function(arg_223_0)
			local var_223_0 = Dvar.DCEBHAJGCJ("NRQNOQMOPS")
			local var_223_1 = Dvar.DHEEJCCJBH("NRQNOQMOPS")

			return var_0_0(var_223_0, var_223_1)
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("OKMKNSQTTO") + 1
		end
	},
	CinematicsVolume = {
		action = function(arg_225_0, arg_225_1, arg_225_2)
			Dvar.IICIFEEDC("LKNOKRSKL", arg_225_2 / 100)
		end,
		value = function(arg_226_0, arg_226_1)
			return Dvar.BJJCJHDBII("LKNOKRSKL") * 100
		end,
		defaultOptionValue = function(arg_227_0)
			return Dvar.DBGFIDHBFC("LKNOKRSKL") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	ClimbingDownLadders = {
		disabled = var_0_4
	},
	CODAccount = {
		name = function()
			if CODACCOUNT.ForceAnonymousAccount() then
				return Engine.CBBHFCGDIC("MENU/ANONYMOUS_ACCOUNT")
			else
				return Engine.CBBHFCGDIC("MENU/COD_ACCOUNT")
			end
		end,
		description = function()
			if CODACCOUNT.ForceAnonymousAccount() then
				return Engine.CBBHFCGDIC("MENU/ANONYMOUS_ACCOUNT_DESC")
			else
				return Engine.CBBHFCGDIC("MENU/COD_ACCOUNT_DESC")
			end
		end,
		action = function(arg_230_0, arg_230_1, arg_230_2, arg_230_3)
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountOptionsPopup", true, arg_230_1, false, {}, nil, true, true)
		end,
		buildCondition = function(arg_231_0)
			local var_231_0 = false

			if Engine.DDJFBBJAIG() then
				var_231_0 = IsOnlineMatch() and CODACCOUNT.IsEnabled() and not Engine.DBAEJAHFGJ(arg_231_0)
			end

			return var_231_0
		end
	},
	ConnectionType = {
		name = function()
			if NetworkInfo.DCFDACAGBG() == true then
				return Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRELESS")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRED")
			end
		end,
		description = function()
			if NetworkInfo.DCFDACAGBG() == true then
				return Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRELESS_DESC")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRED_DESC")
			end
		end
	},
	NvidiaDLSS = {
		buildCondition = function()
			local var_234_0 = not Dvar.IBEGCHEFE("NKPLOQLPLT") and Dvar.DHEEJCCJBH("TSSRKROQM") ~= "Unsupported"
			local var_234_1 = Dvar.CFHDGABACF("MQOMSSQRRQ") == 4

			if not var_234_0 then
				if var_234_1 then
					Dvar.DFIJDJFIFD("MQOMSSQRRQ", Dvar.CFHDGABACF("MLNLRLRPQL"))
				end

				return false
			end

			return true
		end,
		action = function(arg_235_0, arg_235_1, arg_235_2)
			if arg_235_2 == OPTIONS.disableButtonOptions.DISABLED then
				local var_235_0 = Dvar.CFHDGABACF("MLNLRLRPQL")

				Dvar.DFIJDJFIFD("MQOMSSQRRQ", var_235_0)
			elseif arg_235_2 >= OPTIONS.disableButtonOptions.ENABLED then
				local var_235_1 = var_0_20(arg_235_2)

				Dvar.DFIJDJFIFD("MQOMSSQRRQ", 4)
				Dvar.DFIJDJFIFD("OLQMMMTLMO", var_235_1)
			end
		end,
		value = function(arg_236_0)
			local var_236_0 = Dvar.DHEEJCCJBH("TSSRKROQM") == "Supported"
			local var_236_1 = Dvar.CFHDGABACF("MQOMSSQRRQ") == 4
			local var_236_2 = Dvar.CFHDGABACF("OLQMMMTLMO")

			if not var_236_0 then
				Dvar.DFIJDJFIFD("MQOMSSQRRQ", Dvar.CFHDGABACF("MLNLRLRPQL"))

				return OPTIONS.disableButtonOptions.DISABLED
			elseif var_236_1 then
				return (var_0_21(var_236_2))
			else
				return OPTIONS.disableButtonOptions.DISABLED
			end
		end,
		description = function()
			if Dvar.DHEEJCCJBH("TSSRKROQM") == "Drivers out of data" then
				return Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_DLSS_DRIVER_OUT_OF_DATE")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_DLSS_DESC")
			end
		end,
		disabled = function()
			return Dvar.DHEEJCCJBH("TSSRKROQM") == "Drivers out of data"
		end,
		isDependencyDisabled = function(arg_239_0, arg_239_1, arg_239_2, arg_239_3)
			if arg_239_3 == "AntiAliasing" or arg_239_3 == "DynamicResolution" or arg_239_3 == "DynamicResolutionFramerateTarget" then
				if arg_239_2 ~= OPTIONS.disableButtonOptions.DISABLED then
					return true
				else
					return false
				end
			end
		end
	},
	MotionBlur = {
		buildCondition = var_0_3
	},
	WeaponBlur = {
		buildCondition = var_0_3
	},
	ControllerSound = {
		action = function(arg_240_0, arg_240_1)
			Dvar.DHEGHJJJHI("MNKONSOLT", not Dvar.IBEGCHEFE("MNKONSOLT"))
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_240_1)
		end,
		buildCondition = function()
			return Engine.CIEGIACHAE()
		end
	},
	ControllerMinDeadzoneLeft = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NPQOMTNPOQ")
		end
	},
	ControllerMinDeadzoneRight = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NPQOMTNPOQ")
		end
	},
	ControllerMaxDeadzoneLeft = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NPQOMTNPOQ")
		end
	},
	ControllerMaxDeadzoneRight = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NPQOMTNPOQ")
		end
	},
	CopyKeysFromOtherMode = {
		name = function()
			local var_246_0 = "LUA_MENU_PC/COPY_KEYS_MP"

			if Engine.CAADCDEEIA() then
				var_246_0 = "LUA_MENU_PC/COPY_KEYS_SP"
			end

			return Engine.CBBHFCGDIC(var_246_0)
		end,
		description = function()
			local var_247_0 = "LUA_MENU_PC/COPY_KEYS_MP_DESC"

			if Engine.CAADCDEEIA() then
				var_247_0 = "LUA_MENU_PC/COPY_KEYS_SP_DESC"
			end

			return Engine.CBBHFCGDIC(var_247_0)
		end,
		action = function(arg_248_0, arg_248_1)
			LUI.FlowManager.RequestPopupMenu(nil, "CopyKeysFromOtherMode", true, arg_248_1)
		end,
		disabled = var_0_5
	},
	CPUTime = {
		disabled = var_0_4
	},
	GeneralSubCategoryGameInstalls = {
		buildCondition = function()
			return Engine.DDJFBBJAIG()
		end
	},
	GameInstalls = {
		action = function(arg_250_0, arg_250_1, arg_250_2)
			if Engine.CGABICJHAI() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_250_1, false)
			else
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_250_1, false)
			end
		end,
		buildCondition = function(arg_251_0)
			return Engine.DDJFBBJAIG() and Dvar.IBEGCHEFE("PPMTTRNQM") and not CONDITIONS.IsLaunchChunk()
		end
	},
	GeneralSubCategoryCredits = {
		buildCondition = function()
			return Engine.DDJFBBJAIG()
		end
	},
	Credits = {
		action = function(arg_253_0, arg_253_1, arg_253_2)
			LUI.FlowManager.RequestAddMenu("CreditsMenu", true, arg_253_1, false, {
				openedFromCredits = true
			})
		end,
		buildCondition = function()
			return Engine.DDJFBBJAIG()
		end
	},
	Crosshairs = {
		disabled = var_0_4
	},
	DamageBasedHitMarkers = {
		disabled = var_0_4
	},
	Demonware = {
		name = function()
			if NetworkInfo.FIDJJHHCA() then
				return Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_CONNECTED")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_NOT_CONNECTED")
			end
		end,
		description = function()
			if NetworkInfo.FIDJJHHCA() then
				return Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_CONNECTED_DESC")
			else
				return Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_NOT_CONNECTED_DESC")
			end
		end
	},
	DisplayRealID = {
		buildCondition = function()
			return not Engine.CHDGBEFDHB()
		end
	},
	DisplayAnonymousGamertags = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NLMOTKKLKK")
		end
	},
	DisplayAnonymousGamertagToOthers = {
		buildCondition = function(arg_259_0)
			Engine.DHFGJHAADD(arg_259_0, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_STREAMER_MODE)

			if Dvar.IBEGCHEFE("NQPQRKLNNT") then
				Engine.CEJJDJJHIJ(arg_259_0, "dlog_event_anonymization_state", {
					location = "DisplayAnonymousGamertagToOthers.buildCondition",
					anonothers_feature = Dvar.IBEGCHEFE("NLORMOLLMR"),
					anonothers = Dvar.IBEGCHEFE("SKLKPMSRT"),
					anonself_feature = Dvar.IBEGCHEFE("NLORMOLLMR"),
					anonself_verified = Dvar.IBEGCHEFE("LOMLNTKNQT"),
					anonself = Dvar.IBEGCHEFE("MLOKOLORMO")
				})
			end

			return Dvar.IBEGCHEFE("NLORMOLLMR") and Dvar.IBEGCHEFE("LOMLNTKNQT")
		end
	},
	DisplayMode = {
		labels = function()
			local var_260_0 = {}

			if Engine.BAADCHEJJD() then
				var_260_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/MODE_WINDOWED"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_BORDERLESS"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_EXTENDED_WINDOW")
				}
			else
				var_260_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/MODE_WINDOWED"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_BORDERLESS"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_EXTENDED_WINDOW")
				}
			end

			return var_260_0
		end,
		action = function(arg_261_0, arg_261_1, arg_261_2)
			local var_261_0 = arg_261_2 - 1

			if not Engine.BAADCHEJJD() and arg_261_2 > 1 then
				var_261_0 = arg_261_2
			end

			Dvar.DFIJDJFIFD("NNSQSMTQPP", var_261_0)
		end,
		value = function(arg_262_0)
			local var_262_0 = Dvar.CFHDGABACF("NNSQSMTQPP") + 1

			if not Engine.BAADCHEJJD() and var_262_0 > 1 then
				var_262_0 = var_262_0 - 1
			end

			return var_262_0
		end,
		specificAction = function(arg_263_0, arg_263_1, arg_263_2)
			arg_263_1:addEventHandler("onVideoChange", function(arg_264_0, arg_264_1)
				arg_264_0:processEvent({
					name = "seek_value"
				})
			end)
		end,
		description = Engine.BEFACAIFDD() and Engine.CBBHFCGDIC("MENU/DISPLAY_MODE_DESC_ALT") or Engine.CBBHFCGDIC("MENU/DISPLAY_MODE_DESC"),
		isDependencyDisabled = function(arg_265_0, arg_265_1, arg_265_2, arg_265_3)
			if arg_265_3 == "RefreshRate" or arg_265_3 == "ImageQuality" then
				return arg_265_2 ~= 2
			elseif arg_265_3 == "Monitor" then
				return arg_265_2 ~= 2 and arg_265_2 ~= 3
			end
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("NNSQSMTQPP") + 1
		end
	},
	SSR = {
		action = function(arg_267_0, arg_267_1, arg_267_2)
			local var_267_0 = Dvar.DCEBHAJGCJ("NNTTTQSRN")

			arg_267_2 = var_0_9(var_267_0, arg_267_2)

			Dvar.BDEHAEGHAF("NNTTTQSRN", arg_267_2)
		end,
		value = function(arg_268_0)
			local var_268_0 = Dvar.DCEBHAJGCJ("NNTTTQSRN")
			local var_268_1 = Dvar.DHEEJCCJBH("NNTTTQSRN")

			return var_0_0(var_268_0, var_268_1)
		end
	},
	DXR = {
		labels = function()
			local var_269_0 = {}

			if Dvar.IBEGCHEFE("LKLOMSPQSR") then
				var_269_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
					Engine.CBBHFCGDIC("LUA_MENU/ENABLED"),
					Engine.CBBHFCGDIC("MENU/QUALITY_ULTRA")
				}
			else
				var_269_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
					Engine.CBBHFCGDIC("LUA_MENU/ENABLED")
				}
			end

			return var_269_0
		end,
		description = function()
			if Engine.DBDFIBEJGI() then
				if Dvar.IBEGCHEFE("LKLOMSPQSR") then
					return Engine.CBBHFCGDIC("MENU/DIRECT_RAYTRACING_DESC")
				else
					return Engine.CBBHFCGDIC("MENU/DIRECT_RAYTRACING_DESC_NO_ULTRA")
				end
			else
				return Engine.CBBHFCGDIC("MENU/DIRECT_RAYTRACING_UNAVAILABLE_DESC")
			end
		end,
		isDependencyDisabled = function(arg_271_0, arg_271_1, arg_271_2, arg_271_3)
			if arg_271_3 == "AntiAliasing" then
				return arg_271_2 ~= OPTIONS.disableButtonOptions.DISABLED
			else
				return false
			end
		end,
		disabled = function()
			return not Engine.DBDFIBEJGI()
		end,
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTNTQRLL")
		end
	},
	EffectsVolume = {
		action = function(arg_274_0, arg_274_1, arg_274_2)
			Dvar.IICIFEEDC("MPTTMMKST", arg_274_2 / 100)
		end,
		value = function(arg_275_0, arg_275_1)
			return Dvar.BJJCJHDBII("MPTTMMKST") * 100
		end,
		defaultOptionValue = function(arg_276_0)
			return Dvar.DBGFIDHBFC("MPTTMMKST") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	EnglishVoiceOvers = {
		action = function(arg_277_0, arg_277_1, arg_277_2)
			if arg_277_2 > 1 then
				Engine.CDFHJHDEFC(true)
			else
				Engine.CDFHJHDEFC(false)
			end
		end,
		value = function(arg_278_0, arg_278_1)
			return Engine.EEHHCFBGC() and 2 or 1
		end,
		buildCondition = function()
			return Engine.CCGEHCIECB()
		end,
		defaultOptionValue = function(arg_280_0, arg_280_1)
			return Engine.EEHHCFBGC() and 2 or 1
		end,
		disabled = function()
			return not Engine.CCGEHCIECB()
		end
	},
	EquipmentBehavior = {
		action = function(arg_282_0, arg_282_1, arg_282_2)
			Engine.DAGFFDGFII("profile_toggleHoldGrenade")
		end,
		defaultOptionValue = function(arg_283_0)
			return 1
		end,
		value = function(arg_284_0)
			return Engine.BECCFCBIAA("grenadeHold", arg_284_0) and 1 or 2
		end
	},
	EquipmentBehaviorKBM = {
		action = function(arg_285_0, arg_285_1, arg_285_2)
			Engine.DAGFFDGFII("profile_toggleHoldGrenadeKBM")
		end,
		defaultOptionValue = function(arg_286_0)
			return 1
		end,
		value = function(arg_287_0)
			return Engine.BECCFCBIAA("grenadeHoldKBM", arg_287_0) == 1 and 1 or 2
		end
	},
	FilmGrainAttenPC = {
		action = function(arg_288_0, arg_288_1, arg_288_2)
			local var_288_0 = LUI.clamp(arg_288_2, 0, 1)

			Engine.DFJDIFJEGA("filmGrainAttenuation", var_288_0, arg_288_1)
			Dvar.IICIFEEDC("LKOLMLQRRT", var_288_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_288_1)
		end
	},
	FilmGrainAttenConsole = {
		action = function(arg_289_0, arg_289_1, arg_289_2)
			local var_289_0 = LUI.clamp(arg_289_2, 0, 1)

			Engine.DFJDIFJEGA("filmGrainAttenuation", var_289_0, arg_289_1)
			Dvar.IICIFEEDC("LKOLMLQRRT", var_289_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_289_1)
		end,
		buildCondition = var_0_3
	},
	Filter = {
		action = function(arg_290_0, arg_290_1, arg_290_2)
			Engine.DFJDIFJEGA("mouseFilter", arg_290_2 / 10, arg_290_1)
		end,
		value = function(arg_291_0)
			return Engine.BECCFCBIAA("mouseFilter", arg_291_0) * 10
		end
	},
	FilterOld = {
		action = function(arg_292_0, arg_292_1, arg_292_2)
			Engine.DFJDIFJEGA("mouseSmoothing", arg_292_2, arg_292_1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_292_1)
		end
	},
	FirstParty = {
		name = function()
			local var_293_0 = OPTIONS.FirstPartyServersLabel()

			if NetworkInfo.DDADIHAFHH() then
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED", var_293_0)
			else
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED", var_293_0)
			end
		end,
		description = function()
			local var_294_0 = OPTIONS.FirstPartyServersLabel()

			if NetworkInfo.DDADIHAFHH() then
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED_DESC", var_294_0)
			else
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED_DESC", var_294_0)
			end
		end
	},
	FlyingVehicleAscend = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_ASCEND_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_ASCEND_DESC")
			end
		end
	},
	FlyingVehicleBackward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_BACKWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_BACKWARD_DESC")
			end
		end
	},
	FlyingVehicleDescend = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_DESCEND_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_DESCEND_DESC")
			end
		end
	},
	FlyingVehicleFlares = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_FLARES_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_FLARES_DESC")
			end
		end
	},
	FlyingVehicleForward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_FORWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_FORWARD_DESC")
			end
		end
	},
	FlyingVehicleLeft = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_LEFT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_LEFT_DESC")
			end
		end
	},
	FlyingVehicleRight = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_RIGHT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_RIGHT_DESC")
			end
		end
	},
	FlyingVehicleHornAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_HORN_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_HORN_DESC")
			end
		end
	},
	FlyingVehicleWarTrackToggle = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_WARTRACK_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_WARTRACK_DESC")
			end
		end,
		buildCondition = function()
			return Dvar.IBEGCHEFE("NKORSMKORK")
		end
	},
	FlyingVehiculeStickSensitivity = {
		disabled = var_0_4
	},
	FriendRequestNotifications = {
		disabled = var_0_4
	},
	GamepadReloadBehaviors = {
		action = function(arg_305_0, arg_305_1, arg_305_2)
			Engine.DFJDIFJEGA("gpadUseReloadProfile", arg_305_2 - 1, arg_305_1)
		end,
		defaultOptionValue = function(arg_306_0, arg_306_1)
			return 1
		end,
		value = function(arg_307_0)
			return Engine.BECCFCBIAA("gpadUseReloadProfile", arg_307_0) + 1
		end
	},
	GestureAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/CUSTOMIZE_GESTURE_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/CUSTOMIZE_GESTURE_DESC")
			end
		end
	},
	InputMethod = {
		disabled = function(arg_309_0)
			local var_309_0 = false

			if not OPTIONS.DualInputConnected(arg_309_0) or not OPTIONS.IsInputSwapEnabled() or IsMlgGameBattlesInputLock() or Tournament.BEAIBEGFFB() then
				var_309_0 = true
			end

			return var_309_0
		end,
		value = function(arg_310_0)
			return Engine.BECCFCBIAA("gpadEnabled", arg_310_0) and 1 or 2
		end,
		action = function(arg_311_0, arg_311_1, arg_311_2)
			Engine.CIGGHDDHGJ(arg_311_1, not arg_311_2)
			Engine.DAGFFDGFII("updategamerprofile")
		end,
		getSpecificImage = function(arg_312_0, arg_312_1)
			local var_312_0 = ""
			local var_312_1 = Engine.GGFCHCDDE(arg_312_1)
			local var_312_2 = Engine.FIIDEFBHJ(arg_312_1)

			if not Engine.HDGDBCJFG() then
				if var_312_1 or var_312_2 then
					var_312_0 = "_ps4"
				end
			elseif Engine.BIAEDEEBJI(arg_312_1) then
				var_312_0 = "_vita"
			elseif var_312_1 then
				var_312_0 = "_ps4"
			end

			if arg_312_0:find("_ps4") then
				arg_312_0 = arg_312_0:sub(1, -5)
			elseif arg_312_0:find("_vita") then
				arg_312_0 = arg_312_0:sub(1, -6)
			end

			if var_312_0 == "_ps4" or var_312_0 == "_vita" then
				return arg_312_0 .. var_312_0
			else
				return arg_312_0
			end
		end,
		specificAction = function(arg_313_0, arg_313_1, arg_313_2)
			local function var_313_0()
				arg_313_1:SetButtonDisabled(not OPTIONS.DualInputConnected(arg_313_2) or not OPTIONS.IsInputSwapEnabled())
			end

			arg_313_1:addEventHandler("input_method_changed", var_313_0)
			arg_313_1:addEventHandler("input_connection", var_313_0)
		end
	},
	GraphicContent = {
		disabled = var_0_4,
		value = function(arg_315_0)
			return 1
		end
	},
	ImageQuality = {
		labels = function()
			return Engine.DJDAJBFCEE()
		end,
		action = function(arg_317_0, arg_317_1, arg_317_2)
			Dvar.BDEHAEGHAF("LTPQTTPSOR", arg_317_0.displayResolutions and arg_317_0.displayResolutions[arg_317_2] or Engine.DJDAJBFCEE()[arg_317_2])
		end,
		value = function(arg_318_0)
			local var_318_0 = Engine.DJDAJBFCEE()

			return var_0_10("LTPQTTPSOR", var_318_0)
		end,
		onDependencyParentRefresh = function(arg_319_0, arg_319_1, arg_319_2, arg_319_3, arg_319_4)
			if arg_319_3 == "Monitor" then
				local var_319_0 = arg_319_0.displayResolutions and arg_319_0.displayResolutions[arg_319_2] or Engine.DJDAJBFCEE()[arg_319_2]

				arg_319_0.displayResolutions = Engine.DJDAJBFCEE(arg_319_4 - 1)

				arg_319_0:UpdateLabels(arg_319_0.displayResolutions)

				if arg_319_2 == 1 then
					return 1
				else
					return var_0_0(arg_319_0.displayResolutions, var_319_0) or 1
				end
			end
		end
	},
	GPUTemperature = {
		disabled = var_0_4
	},
	GPUTime = {
		disabled = var_0_4
	},
	GroundVehicleBackward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_BACKWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_BACKWARD_DESC")
			end
		end
	},
	GroundVehicleForward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_FORWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_FORWARD_DESC")
			end
		end
	},
	GroundVehicleHandbrake = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_HANDBRAKE_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_HANDBRAKE_DESC")
			end
		end
	},
	GroundVehicleHornAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_HORN_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_HORN_DESC")
			end
		end,
		buildCondition = function()
			return Dvar.IBEGCHEFE("OLMLSKSRLP")
		end
	},
	GroundVehicleWarTrackToggle = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_WARTRACK_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_WARTRACK_HORN_DESC")
			end
		end,
		buildCondition = function()
			return Dvar.IBEGCHEFE("NKORSMKORK")
		end
	},
	GroundVehicleLeanBackward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_BACKWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_BACKWARD_DESC")
			end
		end
	},
	GroundVehicleLeanForward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_FORWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_FORWARD_DESC")
			end
		end
	},
	GroundVehicleLeft = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_LEFT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_LEFT_DESC")
			end
		end
	},
	GroundVehicleRight = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_RIGHT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_RIGHT_DESC")
			end
		end
	},
	HitMarkerPresets = {
		action = function(arg_331_0, arg_331_1, arg_331_2)
			local var_331_0 = OPTIONS.hitMarkerSoundAliases[arg_331_2]

			Engine.CFBBHFFBH(arg_331_1, var_331_0)
		end,
		customPreviewButtonAction = function(arg_332_0, arg_332_1)
			LUI.FlowManager.RequestAddMenu("HitMarkerPreview", true, arg_332_1)
		end,
		value = function(arg_333_0)
			local var_333_0 = Engine.BECCFCBIAA("sndHitMarkerAlias", arg_333_0)

			return (var_0_0(OPTIONS.hitMarkerSoundAliases, var_333_0))
		end,
		defaultOptionValue = function(arg_334_0)
			return 3
		end
	},
	HitMarkersSoundEffect = {
		disabled = var_0_4
	},
	MonoAudio = {
		action = function(arg_335_0, arg_335_1, arg_335_2)
			Dvar.DHEGHJJJHI("LSTMNLPNOP", arg_335_2 == OPTIONS.disableButtonOptions.ENABLED)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_335_1)
		end,
		value = function(arg_336_0)
			return Dvar.IBEGCHEFE("LSTMNLPNOP") and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end,
		defaultOptionValue = function(arg_337_0)
			return OPTIONS.disableButtonOptions.DISABLED
		end
	},
	MonoBleed = {
		action = function(arg_338_0, arg_338_1, arg_338_2)
			Dvar.IICIFEEDC("LNTSRPMPRQ", arg_338_2 / 100)
		end,
		value = function(arg_339_0, arg_339_1)
			return Dvar.BJJCJHDBII("LNTSRPMPRQ") * 100
		end,
		defaultOptionValue = function(arg_340_0)
			return Dvar.DBGFIDHBFC("LNTSRPMPRQ") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	HitMarkersVisuals = {
		disabled = var_0_4
	},
	HudBoundsH = {
		action = function(arg_341_0, arg_341_1, arg_341_2)
			Dvar.IICIFEEDC("SPLRMSQLK", arg_341_2 / 100)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_341_1)
		end,
		value = function(arg_342_0)
			return Dvar.BJJCJHDBII("SPLRMSQLK") * 100
		end,
		defaultOptionValue = function(arg_343_0)
			local var_343_0 = Dvar.DBGFIDHBFC("SPLRMSQLK")
			local var_343_1 = 2.3333333333333335
			local var_343_2 = 1.5999999999999999

			if CoD.AspectRatioCompare(var_343_1) == LUI.COMPARE.higher then
				local var_343_3 = Engine.CEGEEHGGBA()
				local var_343_4 = var_343_3 - var_343_2

				if var_343_4 > 0 then
					var_343_0 = 1 - (var_343_3 - var_343_1) / var_343_4
				end
			end

			return var_343_0 * 100
		end
	},
	HudBoundsV = {
		action = function(arg_344_0, arg_344_1, arg_344_2)
			Dvar.IICIFEEDC("MLMOSSMNOO", arg_344_2 / 100)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_344_1)
		end,
		value = function(arg_345_0)
			return Dvar.BJJCJHDBII("MLMOSSMNOO") * 100
		end,
		defaultOptionValue = function(arg_346_0)
			return Dvar.DBGFIDHBFC("MLMOSSMNOO") * 100
		end
	},
	InventoryKeybindsExpander = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled()
		end
	},
	InvertPitchGamepad = {
		action = function(arg_348_0, arg_348_1, arg_348_2)
			if arg_348_2 == 5 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 1, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 1, arg_348_1)
			elseif arg_348_2 == 4 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 1, arg_348_1)
			elseif arg_348_2 == 3 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 0, arg_348_1)
			elseif arg_348_2 == 2 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 0, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 1, arg_348_1)
			else
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 0, arg_348_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 0, arg_348_1)
			end
		end,
		value = function(arg_349_0)
			local var_349_0 = Engine.BECCFCBIAA("invertPitchGamepad", arg_349_0)
			local var_349_1 = Engine.BECCFCBIAA("invertPitchFlyingGamepad", arg_349_0)
			local var_349_2 = Engine.BECCFCBIAA("invertPitchAirplaneGamepad", arg_349_0)

			if var_349_0 then
				return 5
			elseif var_349_2 and var_349_1 then
				return 4
			elseif var_349_1 then
				return 3
			elseif var_349_2 then
				return 2
			else
				return 1
			end
		end
	},
	InvertPitchFlyingKBM = {
		action = function(arg_350_0, arg_350_1, arg_350_2)
			if arg_350_2 == 4 then
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 1, arg_350_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 1, arg_350_1)
			elseif arg_350_2 == 3 then
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 1, arg_350_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 0, arg_350_1)
			elseif arg_350_2 == 2 then
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 0, arg_350_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 1, arg_350_1)
			else
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 0, arg_350_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 0, arg_350_1)
			end
		end,
		value = function(arg_351_0)
			local var_351_0 = Engine.BECCFCBIAA("invertPitchFlyingKBM", arg_351_0)
			local var_351_1 = Engine.BECCFCBIAA("invertPitchAirplaneKBM", arg_351_0)

			if var_351_1 and var_351_0 then
				return 4
			elseif var_351_0 then
				return 3
			elseif var_351_1 then
				return 2
			else
				return 1
			end
		end
	},
	InvertPitchKBM = {
		action = function(arg_352_0, arg_352_1, arg_352_2)
			Engine.DAGFFDGFII("profile_invertPitchKBM " .. tostring(arg_352_2 - 1), arg_352_1)
		end,
		value = function(arg_353_0)
			return Engine.BECFECEHDB(arg_353_0) + 1
		end
	},
	JuggernautDefaultMusic = {
		action = function(arg_354_0, arg_354_1, arg_354_2)
			Engine.DFJDIFJEGA("juggMusicEnableDefault", arg_354_2 - 1, arg_354_1)
		end,
		defaultOptionValue = function(arg_355_0, arg_355_1)
			return 2
		end,
		value = function(arg_356_0)
			if Engine.BECCFCBIAA("juggMusicEnableDefault", arg_356_0) then
				return 2
			else
				return 1
			end
		end
	},
	LanguageSelect = {
		labels = OPTIONS.GetLanguageLabels,
		defaultOptionValue = function(arg_357_0)
			local var_357_0 = OPTIONS.GetLanguageIndices()
			local var_357_1 = Engine.DGAIDIEIAC()

			for iter_357_0 = 1, #var_357_0 do
				if var_357_0[iter_357_0] == var_357_1 then
					return iter_357_0
				end
			end
		end,
		value = function(arg_358_0)
			local var_358_0 = OPTIONS.GetLanguageIndices()
			local var_358_1 = Engine.DGAIDIEIAC()

			for iter_358_0 = 1, #var_358_0 do
				if var_358_0[iter_358_0] == var_358_1 then
					return iter_358_0
				end
			end
		end,
		action = function(arg_359_0, arg_359_1, arg_359_2)
			local function var_359_0(arg_360_0)
				local var_360_0 = {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC("LANGUAGE_SELECT/CONFIRM_CHANGE"),
					yesAction = function(arg_361_0, arg_361_1)
						Engine.CEHDAACIJA(arg_361_1, arg_360_0)
						Engine.DAGFFDGFII("updategamerprofile")
						DCache.EAEHIJBBCD(arg_360_0)
						Engine.BHIJFFCAEB("")
					end,
					noAction = function()
						arg_359_0:processEvent({
							name = "seek_value",
							controllerIndex = arg_359_1
						})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_359_1, false, var_360_0)
			end

			local var_359_1 = GetLanguageCode(GetCurrentLanguage())
			local var_359_2 = OPTIONS.GetLanguageIndices()[arg_359_2]

			if var_359_1 ~= var_359_2 then
				var_359_0(var_359_2)
			end
		end
	},
	LODRamp = {
		value = function(arg_363_0)
			return 3 - Dvar.CFHDGABACF("LPNQOKLRQR")
		end,
		action = function(arg_364_0, arg_364_1, arg_364_2)
			local var_364_0 = #arg_364_0.labels

			Dvar.DFIJDJFIFD("LPNQOKLRQR", var_364_0 - arg_364_2)
		end
	},
	LookHorzSens = {
		labels = OPTIONS.GetSensitivityLabels(),
		action = function(arg_365_0, arg_365_1, arg_365_2)
			Engine.CBGBBHHIJE(arg_365_1, arg_365_2 - 1)
		end,
		value = function(arg_366_0)
			return Engine.DIDFDDCCDE(arg_366_0) + 1
		end,
		defaultOptionValue = function(arg_367_0)
			return Engine.BHFJEBACDF() + 1
		end,
		disabled = var_0_2
	},
	LookVertSens = {
		labels = OPTIONS.GetSensitivityLabels(),
		action = function(arg_368_0, arg_368_1, arg_368_2)
			Engine.HGJFFDFCE(arg_368_1, arg_368_2 - 1)
		end,
		value = function(arg_369_0)
			return Engine.IFJCDCCAI(arg_369_0) + 1
		end,
		defaultOptionValue = function(arg_370_0)
			return Engine.BHFJEBACDF() + 1
		end,
		disabled = var_0_2
	},
	StickLayoutBootOptions = {
		type = "Dropdown",
		name = Engine.CBBHFCGDIC("PLATFORM/THUMBSTICK_LAYOUT"),
		description = Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"),
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_371_0, arg_371_1, arg_371_2)
			if arg_371_0:GetCurrentMenu() then
				arg_371_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_371_1,
					index = arg_371_2
				})
			end
		end,
		onRefresh = function(arg_372_0, arg_372_1, arg_372_2)
			if arg_372_0:GetCurrentMenu() then
				arg_372_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_372_1,
					index = arg_372_2
				})
			end
		end,
		specialDefaultReset = function(arg_373_0, arg_373_1)
			arg_373_0:dispatchEventToCurrentMenu({
				index = 1,
				name = "stickLayout_updated",
				controller = arg_373_1
			})
		end,
		value = function(arg_374_0)
			local var_374_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_374_0)
			local var_374_1 = OPTIONS.stickLayoutStrings[var_374_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_374_1)))
		end,
		specificAction = function(arg_375_0, arg_375_1, arg_375_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_375_0, arg_375_1, {
				showLayout = true,
				name = "stickLayout"
			})
		end,
		defaultOptionValue = function(arg_376_0)
			return 1
		end
	},
	ButtonLayoutBootOptions = {
		type = "Dropdown",
		name = Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT"),
		description = Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"),
		labels = OPTIONS.GetCurrentButtonLayoutLabels,
		action = function(arg_377_0, arg_377_1, arg_377_2)
			if arg_377_0:GetCurrentMenu() then
				arg_377_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_377_1,
					index = arg_377_2
				})
			end
		end,
		onRefresh = function(arg_378_0, arg_378_1, arg_378_2)
			if arg_378_0:GetCurrentMenu() then
				arg_378_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_378_1,
					index = arg_378_2
				})
			end
		end,
		value = function(arg_379_0)
			local var_379_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_379_0)

			if string.match(var_379_0, "_alt$") then
				var_379_0 = string.gsub(var_379_0, "_alt", "")
			end

			local var_379_1 = OPTIONS.buttonLayoutStrings[var_379_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_379_1)))
		end,
		specificAction = function(arg_380_0, arg_380_1, arg_380_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_380_0, arg_380_1, {
				showLayout = true,
				name = "buttonLayout"
			})
		end,
		defaultOptionValue = function(arg_381_0)
			return 1
		end
	},
	VoiceChatChannel = {
		disabled = var_0_4
	},
	OpenMicRecordingSensitivity = {
		action = function(arg_382_0, arg_382_1, arg_382_2)
			Dvar.IICIFEEDC("MSKKKMTQNT", arg_382_2 * 655.36)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_382_1)
		end,
		value = function(arg_383_0)
			return Dvar.BJJCJHDBII("MSKKKMTQNT") / 655.36
		end,
		defaultOptionValue = function(arg_384_0)
			return Dvar.DBGFIDHBFC("MSKKKMTQNT") / 655.36
		end
	},
	VoiceChatPlaybackDevice = {
		disabled = var_0_4
	},
	LowerGameVolumeWhenSpeaking = {
		disabled = var_0_4
	},
	LoweredVolumeScale = {
		disabled = var_0_4
	},
	SuspendVoiceChat = {
		disabled = var_0_4
	},
	MinimapStyle = {
		action = function(arg_385_0, arg_385_1, arg_385_2)
			Engine.BFIFFDCGAB(arg_385_1, arg_385_2 - 1)
		end,
		value = function(arg_386_0)
			return Engine.DDIFAGHHAB(arg_386_0) + 1
		end,
		defaultOptionValue = function(arg_387_0)
			return 1
		end,
		buildCondition = function(arg_388_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	MinimapRotation = {
		action = function(arg_389_0, arg_389_1, arg_389_2)
			local var_389_0 = arg_389_2 == 2

			Engine.CECAAEJABF(arg_389_1, var_389_0)
		end,
		value = function(arg_390_0)
			return Engine.BIEGEGDIGH(arg_390_0) and 2 or 1
		end,
		defaultOptionValue = function(arg_391_0)
			return 2
		end,
		buildCondition = function(arg_392_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	CompassCardinalDirectionText = {
		action = function(arg_393_0, arg_393_1, arg_393_2)
			local var_393_0 = arg_393_2 == 2

			Engine.DFDGCIDHJH(arg_393_1, var_393_0)
		end,
		value = function(arg_394_0)
			return Engine.BFDEDEGDFD(arg_394_0) and 2 or 1
		end,
		defaultOptionValue = function(arg_395_0)
			return 1
		end
	},
	ObituaryTimeOnScreen = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_396_0, arg_396_1, arg_396_2)
			if arg_396_2 <= 1 then
				Engine.CFJACGBBII(arg_396_1, ObituaryTimeOnScreen.OFF)
			else
				Engine.CFJACGBBII(arg_396_1, LUI.clamp(arg_396_2 - 2, ObituaryTimeOnScreen.DEFAULT, ObituaryTimeOnScreen.EXTENDED))
			end
		end,
		value = function(arg_397_0)
			if Engine.CDHBFIFCEA(arg_397_0) == ObituaryTimeOnScreen.OFF then
				return 1
			else
				return LUI.clamp(Engine.CDHBFIFCEA(arg_397_0), ObituaryTimeOnScreen.DEFAULT, ObituaryTimeOnScreen.EXTENDED) + 2
			end
		end,
		defaultOptionValue = function(arg_398_0)
			return ObituaryTimeOnScreen.DEFAULT + 2
		end
	},
	NewMessageSoundAlert = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_399_0, arg_399_1, arg_399_2)
			Engine.BAGGCHDDCD(arg_399_1, LUI.clamp(arg_399_2 - 1, NewMessageSoundAlertType.DISABLED, NewMessageSoundAlertType.BOTH))
		end,
		value = function(arg_400_0)
			return LUI.clamp(Engine.CCBGEJDJJ(arg_400_0), NewMessageSoundAlertType.DISABLED, NewMessageSoundAlertType.BOTH) + 1
		end,
		defaultOptionValue = function(arg_401_0)
			return 1
		end
	},
	SoundAlert = {
		action = function(arg_402_0, arg_402_1, arg_402_2)
			Engine.DIHECGBHBG(arg_402_1, arg_402_2 - 1)
		end,
		value = function(arg_403_0)
			return Engine.BCFDGFIAII(arg_403_0) + 1
		end,
		defaultOptionValue = function(arg_404_0)
			return 1
		end
	},
	TextChatBehavior = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_405_0, arg_405_1, arg_405_2)
			Engine.DCBAIHDCFC(arg_405_1, LUI.clamp(arg_405_2 - 1, TextChatBehavior.OFF, TextChatBehavior.CUSTOM))
		end,
		value = function(arg_406_0)
			return LUI.clamp(Engine.HHFCGDBEE(arg_406_0), TextChatBehavior.OFF, TextChatBehavior.CUSTOM) + 1
		end,
		defaultOptionValue = function(arg_407_0)
			return 1
		end,
		isDependencyDisabled = function(arg_408_0, arg_408_1, arg_408_2, arg_408_3)
			return arg_408_2 ~= TextChatBehavior.CUSTOM + 1
		end
	},
	PlayerMessagesBehavior = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_409_0, arg_409_1, arg_409_2)
			Engine.BIGJHBAJEE(arg_409_1, LUI.clamp(arg_409_2 - 1, TextChatBehavior.OFF, TextChatBehavior.EXTENDED))
		end,
		value = function(arg_410_0)
			return LUI.clamp(Engine.DEHEEEBGAE(arg_410_0), TextChatBehavior.OFF, TextChatBehavior.EXTENDED) + 1
		end,
		defaultOptionValue = function(arg_411_0)
			return 1
		end
	},
	SystemMessagesBehavior = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_412_0, arg_412_1, arg_412_2)
			Engine.CGDFDDCIFC(arg_412_1, LUI.clamp(arg_412_2 - 1, TextChatBehavior.OFF, TextChatBehavior.EXTENDED))
		end,
		value = function(arg_413_0)
			return LUI.clamp(Engine.BGFCDIHDBC(arg_413_0), TextChatBehavior.OFF, TextChatBehavior.EXTENDED) + 1
		end,
		defaultOptionValue = function(arg_414_0)
			return 1
		end
	},
	AlwaysOnScreen = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_415_0, arg_415_1, arg_415_2)
			Engine.CCGFGJADDA(arg_415_1, LUI.clamp(arg_415_2 - 1, 0, 1))
		end,
		value = function(arg_416_0)
			return LUI.clamp(Engine.CJGIDICGIG(arg_416_0), 0, 1) + 1
		end,
		defaultOptionValue = function(arg_417_0)
			return 1
		end
	},
	SprintTacticalBehavior = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("MNQRTPNKQN")
		end,
		action = function(arg_419_0, arg_419_1, arg_419_2)
			Engine.BAEHCHBBCF(arg_419_1, LUI.clamp(arg_419_2 - 1, 0, 2))
		end,
		value = function(arg_420_0)
			return LUI.clamp(Engine.DGECFCHIDD(arg_420_0), 0, 2) + 1
		end,
		defaultOptionValue = function(arg_421_0)
			return 1
		end
	},
	VehiclesAutoMoveGamepad = {
		action = function(arg_422_0, arg_422_1, arg_422_2)
			Engine.DDHIEBBCI(arg_422_1, LUI.clamp(arg_422_2 - 1, 0, 1))
		end,
		value = function(arg_423_0)
			return LUI.clamp(Engine.DDDGAEFCHG(arg_423_0), 0, 1) + 1
		end,
		defaultOptionValue = function(arg_424_0)
			return 1
		end
	},
	MixPreset = {
		customPreviewButtonAction = function(arg_425_0, arg_425_1)
			LUI.FlowManager.RequestAddMenu("AudioMixPreset", true, arg_425_1)
		end,
		value = function()
			local var_426_0, var_426_1 = OPTIONS.GetCurrentAudioMixPreset()

			return var_426_1
		end,
		defaultOptionValue = function(arg_427_0)
			return 5
		end,
		action = function(arg_428_0, arg_428_1, arg_428_2)
			local var_428_0 = OPTIONS.GetMixPresets()

			Dvar.DFIJDJFIFD("PTKLRRLLQ", var_428_0[arg_428_2].value)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_428_1)
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	MenuCursorSensitivityMultiplier = {
		buildCondition = function()
			return Engine.CIEGIACHAE()
		end
	},
	Monitor = {
		labels = function()
			return Engine.BHEFDBJAAF()
		end,
		value = function()
			local var_431_0 = Dvar.DHEEJCCJBH("MMMOQLSSOS")

			return var_0_0(Engine.BHEFDBJAAF(), var_431_0) or 1
		end,
		action = function(arg_432_0, arg_432_1, arg_432_2)
			local var_432_0 = Engine.BHEFDBJAAF()

			Dvar.BDEHAEGHAF("MMMOQLSSOS", var_432_0[arg_432_2])
		end
	},
	Prone = {
		action = function(arg_433_0, arg_433_1, arg_433_2)
			Engine.DFJDIFJEGA("proneType", arg_433_2, arg_433_1)
		end,
		defaultOptionValue = function(arg_434_0)
			return Engine.IEBBJFBE("proneType")
		end,
		value = function(arg_435_0)
			return Engine.BECCFCBIAA("proneType", arg_435_0)
		end
	},
	Crouch = {
		action = function(arg_436_0, arg_436_1, arg_436_2)
			Engine.DFJDIFJEGA("crouchType", arg_436_2, arg_436_1)
		end,
		defaultOptionValue = function(arg_437_0)
			return Engine.IEBBJFBE("crouchType")
		end,
		value = function(arg_438_0)
			return Engine.BECCFCBIAA("crouchType", arg_438_0)
		end,
		isDependencyDisabled = function(arg_439_0, arg_439_1, arg_439_2, arg_439_3)
			if arg_439_3 == "SlideEnabledKeyboard" then
				return arg_439_2 == 2
			end
		end
	},
	MountConfig = {
		action = function(arg_440_0, arg_440_1, arg_440_2)
			Engine.CIAGIFEAIC(arg_440_1, arg_440_0.engineValueMap[arg_440_2])
		end,
		defaultOptionValue = function(arg_441_0)
			local var_441_0 = Engine.IEBBJFBE("mountButtonConfig")

			return var_441_0 < 4 and var_441_0 or var_441_0 - 3
		end,
		value = function(arg_442_0)
			local var_442_0 = Engine.BECCFCBIAA("mountButtonConfig", arg_442_0)

			return var_442_0 < 4 and var_442_0 or var_442_0 - 3
		end,
		onDependencyParentRefresh = function(arg_443_0, arg_443_1, arg_443_2, arg_443_3, arg_443_4)
			if arg_443_3 == "ADSHoldGamepad" then
				local var_443_0 = OPTIONS.GetMountConfigLabels()
				local var_443_1 = OPTIONS.GetMountConfigValues()
				local var_443_2 = arg_443_0.engineValueMap and arg_443_0.engineValueMap[arg_443_2] or var_443_1[arg_443_2]

				arg_443_0.engineValueMap = var_443_1

				if arg_443_4 == 2 then
					table.remove(var_443_0, 2)
					table.remove(var_443_1, 2)
				end

				arg_443_0:UpdateLabels(var_443_0)

				local var_443_3 = var_0_0(arg_443_0.engineValueMap, var_443_2)

				if var_443_3 then
					return var_443_3
				else
					return var_0_0(arg_443_0.engineValueMap, Engine.IEBBJFBE("mountButtonConfig"))
				end
			end
		end,
		buildCondition = var_0_8
	},
	MountConfigKBM = {
		labels = OPTIONS.GetMountConfigKBMLabels(),
		action = function(arg_444_0, arg_444_1, arg_444_2)
			if arg_444_0.engineValueMap then
				Engine.IEGJEIHE(arg_444_1, arg_444_0.engineValueMap[arg_444_2])
			end
		end,
		defaultOptionValue = function(arg_445_0)
			local var_445_0 = OPTIONS.GetMountConfigKBMValues()
			local var_445_1 = Engine.IEBBJFBE("mountButtonConfigKBM")

			return var_0_0(var_445_0, var_445_1)
		end,
		value = function(arg_446_0)
			local var_446_0 = OPTIONS.GetMountConfigKBMValues()
			local var_446_1 = Engine.BECCFCBIAA("mountButtonConfigKBM", arg_446_0)

			return var_0_0(var_446_0, var_446_1)
		end,
		isDependencyDisabled = function(arg_447_0, arg_447_1, arg_447_2, arg_447_3)
			return arg_447_2 == 1
		end,
		onDependencyParentRefresh = function(arg_448_0, arg_448_1, arg_448_2, arg_448_3, arg_448_4)
			if arg_448_3 == "ADSHoldKeyboard" then
				local var_448_0 = OPTIONS.GetMountConfigKBMLabels()
				local var_448_1 = OPTIONS.GetMountConfigKBMValues()
				local var_448_2 = arg_448_0.engineValueMap and arg_448_0.engineValueMap[arg_448_2] or var_448_1[arg_448_2]

				arg_448_0.engineValueMap = var_448_1

				if arg_448_4 == 2 then
					table.remove(var_448_0, 2)
					table.remove(var_448_1, 2)
				end

				arg_448_0:UpdateLabels(var_448_0)

				local var_448_3 = var_0_0(arg_448_0.engineValueMap, var_448_2)

				if var_448_3 then
					return var_448_3
				else
					return var_0_0(arg_448_0.engineValueMap, Engine.IEBBJFBE("mountButtonConfigKBM"))
				end
			end
		end,
		buildCondition = var_0_8
	},
	MountingExitDelay = {
		buildCondition = var_0_8
	},
	MouseSmoothingOld = {
		action = function(arg_449_0, arg_449_1, arg_449_2, arg_449_3)
			local var_449_0 = arg_449_3 / 10

			Dvar.IICIFEEDC(arg_449_2, var_449_0)
		end,
		value = function(arg_450_0, arg_450_1)
			return Dvar.BJJCJHDBII(arg_450_1) * 10
		end
	},
	musicPlaylist = {
		sliderDataName = "Volume",
		type = "SliderBarWithEditBox",
		id = "MusicPlaylist",
		dvar = "OLMSPQPNNL",
		name = Engine.CBBHFCGDIC("MENU/MUSIC_PLAYLIST_CAPS"),
		description = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_MUSIC_PLAYLIST_DESC")
	},
	MicrophoneVolume = {
		action = function(arg_451_0, arg_451_1, arg_451_2)
			Dvar.IICIFEEDC("LRTMQRTPLO", arg_451_2 / 100)
		end,
		value = function(arg_452_0)
			return Dvar.BJJCJHDBII("LRTMQRTPLO") * 100
		end,
		defaultOptionValue = function(arg_453_0)
			return Dvar.DBGFIDHBFC("LRTMQRTPLO") * 100
		end
	},
	VoiceChatVolume = {
		action = function(arg_454_0, arg_454_1, arg_454_2)
			Dvar.IICIFEEDC("MPQSQTNRNO", arg_454_2 / 100)
		end,
		value = function(arg_455_0)
			return Dvar.BJJCJHDBII("MPQSQTNRNO") * 100
		end,
		defaultOptionValue = function(arg_456_0)
			return Dvar.DBGFIDHBFC("MPQSQTNRNO") * 100
		end
	},
	MusicVolume = {
		action = function(arg_457_0, arg_457_1, arg_457_2)
			Dvar.IICIFEEDC("LLPPPNKTSO", arg_457_2 / 100)
		end,
		value = function(arg_458_0)
			return Dvar.BJJCJHDBII("LLPPPNKTSO") * 100
		end,
		defaultOptionValue = function(arg_459_0)
			return Dvar.DBGFIDHBFC("LLPPPNKTSO") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	NATType = {
		name = function()
			local var_460_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_460_0] == nil then
				netdiagNat = "unknown"
			end

			if OPTIONS.natTypeDescUILabels[var_460_0] == nil then
				netdiagNat = "unknown"
			end

			return Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", OPTIONS.natTypeUILabels[var_460_0])
		end,
		description = function()
			local var_461_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_461_0] == nil then
				netdiagNat = "unknown"
			end

			if OPTIONS.natTypeDescUILabels[var_461_0] == nil then
				netdiagNat = "unknown"
			end

			return Engine.CBBHFCGDIC(OPTIONS.natTypeDescUILabels[var_461_0], var_461_0)
		end
	},
	OptimalVideo = {
		action = function(arg_462_0, arg_462_1)
			LUI.FlowManager.RequestPopupMenu(nil, "OptimalVideoNotice", true, arg_462_1)
		end
	},
	PartyInviteNotifications = {
		disabled = var_0_4,
		value = function(arg_463_0)
			return 1
		end
	},
	ParachuteAutoDeployGamepad = {
		buildCondition = function()
			local var_464_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_464_0
		end,
		action = function(arg_465_0, arg_465_1, arg_465_2)
			if arg_465_2 == 2 then
				arg_465_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployGamepadDisabled", arg_465_2, arg_465_1)
		end,
		value = function(arg_466_0)
			local var_466_0 = Engine.BECCFCBIAA("isParachuteAutoDeployGamepadDisabled", arg_466_0)

			if var_466_0 == 0 then
				var_466_0 = 2
			end

			return var_466_0
		end,
		defaultOptionValue = function(arg_467_0)
			return 2
		end
	},
	ParachuteAutoDeployKBM = {
		buildCondition = function()
			local var_468_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_468_0
		end,
		action = function(arg_469_0, arg_469_1, arg_469_2)
			if arg_469_2 == 2 then
				arg_469_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployKBMDisabled", arg_469_2, arg_469_1)
		end,
		value = function(arg_470_0)
			local var_470_0 = Engine.BECCFCBIAA("isParachuteAutoDeployKBMDisabled", arg_470_0)

			if var_470_0 == 0 then
				var_470_0 = 2
			end

			return var_470_0
		end,
		defaultOptionValue = function(arg_471_0)
			return 2
		end
	},
	PeripheralLighting = {
		disabled = var_0_4,
		value = function(arg_472_0)
			return 1
		end
	},
	PickUpBehavior = {
		disabled = var_0_4
	},
	PingAction = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled()
		end
	},
	PlayerNameIndicator = {
		disabled = var_0_4
	},
	LazeProfanityFilter = {
		action = function(arg_474_0, arg_474_1)
			Social.BHIBEBIEHC()
		end,
		buildCondition = function()
			return Engine.CHDGBEFDHB()
		end
	},
	ProfanityFilterEnabled = {
		buildCondition = function()
			return not IsLanguageArabic()
		end
	},
	PushToTalk = {
		action = function(arg_477_0, arg_477_1, arg_477_2)
			Dvar.DHEGHJJJHI("MOOMTQSMPS", arg_477_2 == 1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_477_1)
		end,
		value = function(arg_478_0)
			return Dvar.IBEGCHEFE("MOOMTQSMPS") and 1 or 2
		end
	},
	QuickInventory = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and CONDITIONS.IsBrQuickInventoryEnabled()
		end
	},
	RealNames = {
		disabled = var_0_4
	},
	RefreshRate = {
		labels = function()
			local var_480_0 = {}
			local var_480_1 = Engine.DJGJIJCACA()

			for iter_480_0, iter_480_1 in pairs(var_480_1) do
				table.insert(var_480_0, LUI.Round(tonumber(iter_480_1)))
			end

			return var_480_0
		end,
		value = function(arg_481_0)
			local var_481_0 = Dvar.DHEEJCCJBH("SOKNOQRPL")

			return var_0_0(Engine.DJGJIJCACA(), var_481_0)
		end,
		action = function(arg_482_0, arg_482_1, arg_482_2)
			Dvar.BDEHAEGHAF("SOKNOQRPL", arg_482_0.labels[arg_482_2])
		end,
		onDependencyParentRefresh = function(arg_483_0, arg_483_1, arg_483_2, arg_483_3, arg_483_4)
			if arg_483_3 == "Monitor" then
				local var_483_0 = {}
				local var_483_1 = Engine.DJGJIJCACA(arg_483_4 - 1)

				for iter_483_0, iter_483_1 in pairs(var_483_1) do
					table.insert(var_483_0, LUI.Round(tonumber(iter_483_1)))
				end

				arg_483_0:UpdateLabels(var_483_0)

				local var_483_2 = LUI.Round(tonumber(Dvar.DHEEJCCJBH("SOKNOQRPL")))
				local var_483_3 = var_0_0(var_483_0, var_483_2)

				if var_483_3 then
					return var_483_3
				else
					return 1
				end
			end
		end
	},
	ResetControls = {
		type = "GenericButton",
		id = "ResetControls",
		name = Engine.CBBHFCGDIC("LUA_MENU/RESTORE_DEFAULT_CONTROLS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/RESET_CONTROLS_DESC"),
		action = function(arg_484_0, arg_484_1)
			LUI.FlowManager.RequestPopupMenu(nil, "ResetControls", true, arg_484_1)
		end,
		disabled = var_0_5
	},
	Resolution = {
		name = function()
			return Engine.CBBHFCGDIC("MENU/VIDEO_MODE_EMPTY")
		end,
		action = function(arg_486_0, arg_486_1, arg_486_2)
			Dvar.DFIJDJFIFD("LNKPMNNMQM", arg_486_2)
		end,
		onRefresh = function(arg_487_0, arg_487_1, arg_487_2)
			if arg_487_0.displayResolutions and arg_487_0.imageQualityValue and arg_487_0.displayModeIndex and arg_487_0.monitorIndex then
				local var_487_0 = Engine.BACCFGEDED(arg_487_0.monitorIndex - 1)
				local var_487_1 = OPTIONS.CalculateViewportDimensions(arg_487_2, arg_487_0.displayModeIndex, arg_487_0.displayResolutions, arg_487_0.imageQualityValue, var_487_0)
				local var_487_2 = Engine.CBBHFCGDIC("MENU/VIDEO_MODE", LUI.Round(var_487_1[1]), LUI.Round(var_487_1[2]))

				arg_487_0.GenericOptionButtonBase.Title:setText(var_487_2)

				local var_487_3 = OPTIONS.CalculateViewportDimensions(100, arg_487_0.displayModeIndex, arg_487_0.displayResolutions, arg_487_0.imageQualityValue, var_487_0)

				arg_487_0:SetMinimumValue(arg_487_1, Engine.DJADGEBIBJ(var_487_3[2]))
			end
		end,
		value = function(arg_488_0)
			return Dvar.CFHDGABACF("NRSLPQLQPL")
		end,
		onDependencyParentRefresh = function(arg_489_0, arg_489_1, arg_489_2, arg_489_3, arg_489_4)
			if arg_489_3 == "ImageQuality" then
				arg_489_0.imageQualityValue = arg_489_4
			elseif arg_489_3 == "Monitor" then
				arg_489_0.monitorIndex = arg_489_4
				arg_489_0.displayResolutions = Engine.DJDAJBFCEE(arg_489_4 - 1)
			elseif arg_489_3 == "DisplayMode" then
				arg_489_0.displayModeIndex = arg_489_4
			end

			if arg_489_0.imageQualityValue and arg_489_0.displayResolutions and arg_489_0.imageQualityValue > #arg_489_0.displayResolutions then
				arg_489_0.imageQualityValue = #arg_489_0.displayResolutions
			end

			return true
		end
	},
	PlatformConstrainedChat = {
		action = function(arg_490_0, arg_490_1, arg_490_2)
			Dvar.DHEGHJJJHI("MSSTLSMOQN", arg_490_2 == OPTIONS.disableButtonOptions.ENABLED)
			Engine.DFJDIFJEGA("allowCrossplayChat", arg_490_2 - 1, arg_490_1)
		end,
		value = function(arg_491_0)
			return Engine.BECCFCBIAA("allowCrossplayChat", arg_491_0) == 0 and OPTIONS.disableButtonOptions.DISABLED or OPTIONS.disableButtonOptions.ENABLED
		end,
		buildCondition = function()
			return Engine.CIEGIACHAE()
		end
	},
	Rumble = {
		disabled = var_0_2
	},
	SafeArea = {
		action = function(arg_493_0, arg_493_1, arg_493_2, arg_493_3)
			LUI.FlowManager.RequestPopupMenu(nil, "ScreenMargins", true, arg_493_1, false, {}, nil, true)
		end,
		hideOption = function(arg_494_0)
			return not Engine.DDJFBBJAIG() and not not CONDITIONS.IsSplitscreen() or not Engine.BFDACIJIAD(arg_494_0)
		end
	},
	ScoreboardMap = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/SCOREBOARD_MAP_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/SCOREBOARD_MAP_DESC")
			end
		end
	},
	ServerLatency = {
		disabled = var_0_4
	},
	ShadowCasterLevel = {
		value = function()
			local var_496_0 = {
				3,
				4,
				8
			}
			local var_496_1 = Dvar.CFHDGABACF("SRKPNTSRM")
			local var_496_2 = 1

			if var_496_1 <= var_496_0[1] then
				var_496_2 = 1
			elseif var_496_1 <= var_496_0[2] then
				var_496_2 = 2
			elseif var_496_1 <= var_496_0[3] then
				var_496_2 = 3
			end

			return var_496_2
		end,
		action = function(arg_497_0, arg_497_1)
			local var_497_0 = {
				3,
				4,
				8
			}
			local var_497_1 = {
				5,
				8,
				16
			}

			Dvar.DFIJDJFIFD("SRKPNTSRM", var_497_0[arg_497_1.index])
			Dvar.DFIJDJFIFD("OKKTMLKNNR", var_497_1[arg_497_1.index])
		end
	},
	ShadowMapResolution = {
		action = function(arg_498_0, arg_498_1, arg_498_2)
			local var_498_0 = Dvar.DCEBHAJGCJ("NTKRPRKMOK")[arg_498_2]

			Dvar.BDEHAEGHAF("NTKRPRKMOK", var_498_0)
		end,
		defaultOptionValue = function(arg_499_0)
			return Dvar.DBGFIDHBFC("NTKRPRKMOK") + 1
		end,
		value = function(arg_500_0)
			return Dvar.CFHDGABACF("NTKRPRKMOK") + 1
		end
	},
	GeneralSubCategoryScreen = {
		buildCondition = var_0_3
	},
	GeneralSubCategoryHUD = {
		buildCondition = function(arg_501_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	FOV = {
		applyableOverride = false,
		applyable = false,
		updateDescriptionOnAction = true,
		description = function()
			local var_502_0 = LUI.Round(Engine.DHIDDHFHBB())
			local var_502_1 = LUI.Round(Engine.HCHEJADDD(var_502_0))

			return Engine.CBBHFCGDIC("PLATFORM_UI/FOV_DESC", var_502_0, var_502_1)
		end,
		specificAction = function(arg_503_0, arg_503_1, arg_503_2)
			local var_503_0 = (80 - SliderBounds.HorizontalFOV.Min) / (SliderBounds.HorizontalFOV.Max - SliderBounds.HorizontalFOV.Min)

			arg_503_1.GenericFillBar.TickMarker:SetAnchorsAndPosition(var_503_0, 1 - var_503_0 - 0.01, 0, 0, 0, 0, -4, 4)
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("NNMSONQSOP")
		end,
		UpdateContent = UpdateFOVFillNumberContent
	},
	ShaderFrontendPreload = {
		action = function(arg_505_0, arg_505_1, arg_505_2, arg_505_3)
			LUI.FlowManager.RequestPopupMenu(nil, "ShaderCacheDialog", false, arg_505_3.controller, false, uploadOptions, unused, false, true)
		end,
		specificAction = function(arg_506_0, arg_506_1, arg_506_2)
			arg_506_1:addEventHandler("refresh_values", function(arg_507_0, arg_507_1)
				arg_506_1:SetButtonDisabled(not ShaderUpload.DIGGBDJIIE())
			end)
		end,
		buildCondition = function()
			return Engine.CGABICJHAI() and ShaderUpload.DIGGBDJIIE()
		end
	},
	ShowMapAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/SHOW_MAP_OPTIONS_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/SHOW_MAP_OPTIONS_DESC")
			end
		end
	},
	SkipIntro = {
		action = function(arg_510_0, arg_510_1)
			local var_510_0 = Dvar.IBEGCHEFE("NPLRKNKKOP")

			Dvar.DHEGHJJJHI("NPLRKNKKOP", not var_510_0)
			Dvar.DHEGHJJJHI("NKMQMOKNRP", not var_510_0)

			if var_510_0 then
				LUI.DataSourceInControllerModel.new("alwaysLoaded.hasPlayerSeenSeasonVideo"):SetValue(arg_510_1, true)
			end
		end,
		defaultOptionValue = function(arg_511_0, arg_511_1)
			return 1
		end,
		value = function(arg_512_0)
			return Dvar.IBEGCHEFE("NPLRKNKKOP") and 2 or 1
		end,
		buildCondition = function()
			return Engine.CGABICJHAI()
		end
	},
	SplitscreenShadows = {
		action = function(arg_514_0, arg_514_1, arg_514_2)
			if arg_514_2 == 2 then
				arg_514_2 = 3
			end

			Engine.DAGFFDGFII("profile_setSunShadowSplitscreen " .. arg_514_2 - 1, arg_514_1)
		end,
		value = function(arg_515_0)
			local var_515_0 = Dvar.DHEEJCCJBH("OLSOQRKNLO")
			local var_515_1 = Dvar.DCEBHAJGCJ("OLSOQRKNLO")
			local var_515_2 = var_0_0(var_515_1, var_515_0)

			return math.min(var_515_2, 2)
		end,
		hideOption = function(arg_516_0)
			return not Engine.BFDACIJIAD(arg_516_0) or not CONDITIONS.IsSplitscreen()
		end
	},
	SprintCancelReload = {
		disabled = var_0_2
	},
	StanceUpToJump = {
		action = function(arg_517_0, arg_517_1, arg_517_2)
			Engine.DAGFFDGFII("profile_toggleStanceUpJump")
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_517_1)
		end,
		defaultOptionValue = function(arg_518_0, arg_518_1)
			return Engine.IEBBJFBE("stanceUpJump") == 1
		end,
		value = function(arg_519_0)
			return Engine.BECCFCBIAA("stanceUpJump", arg_519_0) and 2 or 1
		end
	},
	SteeringVehicleStickSensitivity = {
		disabled = var_0_4
	},
	StickAcceleration = {
		disabled = var_0_4
	},
	StreamingQuality = {
		disabled = function(arg_520_0, arg_520_1)
			return not Engine.DDJFBBJAIG()
		end,
		action = function(arg_521_0, arg_521_1, arg_521_2)
			Dvar.DFIJDJFIFD("OMKLNPPNSM", arg_521_2 - 1)
		end,
		value = function(arg_522_0)
			return Dvar.CFHDGABACF("OMKLNPPNSM") + 1
		end,
		defaultOptionValue = function(arg_523_0, arg_523_1)
			return Dvar.DBGFIDHBFC("OMKLNPPNSM") + 1
		end
	},
	subsurfaceScattering = {
		type = "ToggleButton",
		id = "SubsurfaceScattering",
		dvar = "LNOSSNSNTK",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/SSS_CAPS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/SSS_DESC") or nil,
		labels = {
			Engine.CBBHFCGDIC("LUA_MENU/NO"),
			Engine.CBBHFCGDIC("LUA_MENU/YES")
		},
		action = function(arg_524_0, arg_524_1, arg_524_2)
			Dvar.DHEGHJJJHI("LNOSSNSNTK", arg_524_2)
		end
	},
	SuperSprintAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/SUPER_SPRINT_KEYBIND_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/SUPER_SPRINT_KEYBIND_DESC")
			end
		end
	},
	SystemClock = {
		action = function(arg_526_0, arg_526_1, arg_526_2)
			Engine.DFJDIFJEGA("displayTelemetryTime", arg_526_2 - 1, arg_526_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "localTime",
				value = arg_526_2 - 1
			})
		end,
		value = function(arg_527_0)
			return Engine.BECCFCBIAA("displayTelemetryTime", arg_527_0) and 2 or 1
		end
	},
	TelemetryFPSCounter = {
		action = function(arg_528_0, arg_528_1, arg_528_2)
			Engine.DFJDIFJEGA("displayTelemetryFPS", arg_528_2 - 1, arg_528_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "fps",
				value = arg_528_2 - 1
			})
		end,
		value = function(arg_529_0)
			return Engine.BECCFCBIAA("displayTelemetryFPS", arg_529_0) and 2 or 1
		end
	},
	TelemetryServerLatency = {
		action = function(arg_530_0, arg_530_1, arg_530_2)
			Engine.DFJDIFJEGA("displayTelemetryLatency", arg_530_2 - 1, arg_530_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "latency",
				value = arg_530_2 - 1
			})
		end,
		value = function(arg_531_0)
			return Engine.BECCFCBIAA("displayTelemetryLatency", arg_531_0) and 2 or 1
		end
	},
	TelemetryGPUTemp = {
		action = function(arg_532_0, arg_532_1, arg_532_2)
			Engine.DFJDIFJEGA("displayTelemetryGpuTemperature", arg_532_2 - 1, arg_532_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "gpuTemp",
				value = arg_532_2 - 1
			})
		end,
		value = function(arg_533_0)
			return Engine.BECCFCBIAA("displayTelemetryGpuTemperature", arg_533_0) and 2 or 1
		end
	},
	TelemetryGPUTime = {
		action = function(arg_534_0, arg_534_1, arg_534_2)
			Engine.DFJDIFJEGA("displayTelemetryGpuTime", arg_534_2 - 1, arg_534_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "gpuTime",
				value = arg_534_2 - 1
			})
		end,
		value = function(arg_535_0)
			return Engine.BECCFCBIAA("displayTelemetryGpuTime", arg_535_0) and 2 or 1
		end
	},
	TelemetryCPUTime = {
		action = function(arg_536_0, arg_536_1, arg_536_2)
			Engine.DFJDIFJEGA("displayTelemetryCpuTime", arg_536_2 - 1, arg_536_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "cpuTime",
				value = arg_536_2 - 1
			})
		end,
		value = function(arg_537_0)
			return Engine.BECCFCBIAA("displayTelemetryCpuTime", arg_537_0) and 2 or 1
		end
	},
	TelemetryMuteSound = {
		action = function(arg_538_0, arg_538_1, arg_538_2)
			Engine.DFJDIFJEGA("showSoundMuted", arg_538_2 - 1, arg_538_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "sound",
				value = arg_538_2 - 1
			})
		end,
		value = function(arg_539_0)
			return Engine.BECCFCBIAA("showSoundMuted", arg_539_0) and 2 or 1
		end
	},
	TelemetryMuteVoiceChat = {
		action = function(arg_540_0, arg_540_1, arg_540_2)
			Engine.DFJDIFJEGA("showVoiceChatMuted", arg_540_2 - 1, arg_540_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "voiceChat",
				value = arg_540_2 - 1
			})
		end,
		value = function(arg_541_0)
			return Engine.BECCFCBIAA("showVoiceChatMuted", arg_541_0) and 2 or 1
		end
	},
	TelemetryPacketLoss = {
		action = function(arg_542_0, arg_542_1, arg_542_2)
			Engine.DFJDIFJEGA("displayTelemetryPacketLoss", arg_542_2 - 1, arg_542_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "packetLoss",
				value = arg_542_2 - 1
			})
		end,
		value = function(arg_543_0)
			return Engine.BECCFCBIAA("displayTelemetryPacketLoss") + 1
		end
	},
	TextChatEnabled = {
		disabled = function(arg_544_0)
			return Engine.CDFCHEJJE(arg_544_0)
		end,
		onRefresh = function(arg_545_0, arg_545_1, arg_545_2)
			arg_545_0:dispatchEventToRoot({
				name = "text_chat_updated",
				controller = arg_545_1,
				active = arg_545_2 == OPTIONS.disableButtonOptions.ENABLED
			})
		end,
		buildCondition = function()
			return not IsLanguageArabic()
		end,
		isDependencyDisabled = function(arg_547_0, arg_547_1, arg_547_2, arg_547_3)
			return arg_547_2 == 1
		end,
		value = function(arg_548_0)
			return Engine.BECCFCBIAA("textChatEnabled", arg_548_0) and not Engine.CDFCHEJJE(arg_548_0) and 2 or 1
		end
	},
	ToogleLean = {
		disabled = GamepadEnabled
	},
	ToggleMapCursorEnable = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled()
		end
	},
	UseHoldKBMProfileOption = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("LSLKMPPLOK")
		end
	},
	VariableRateShading = {
		buildCondition = function()
			return Engine.BBFJEGIJIA() and Dvar.IBEGCHEFE("QKOKLMRQT")
		end
	},
	VRAMUsage = {
		disabled = var_0_4
	},
	VoiceChatDevicePC = {
		action = function(arg_552_0, arg_552_1, arg_552_2)
			local var_552_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")

			Dvar.BDEHAEGHAF("MSQLPLNSQN", var_552_0[arg_552_2])
		end,
		value = function(arg_553_0)
			local var_553_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")
			local var_553_1 = Dvar.DHEEJCCJBH("MSQLPLNSQN")

			return var_0_0(var_553_0, var_553_1)
		end,
		defaultOptionValue = function(arg_554_0, arg_554_1)
			return 1
		end
	},
	SoundSpeakerDevicePC = {
		labels = function()
			return Engine.BHBBJDEAC()
		end,
		value = function(arg_556_0)
			local var_556_0 = Dvar.DHEEJCCJBH("LLMMMMLOOO")
			local var_556_1 = var_0_0(Engine.BJBABGABCA(), var_556_0)

			if var_556_1 == nil then
				return 1
			end

			return var_556_1
		end,
		action = function(arg_557_0, arg_557_1, arg_557_2)
			local var_557_0 = Engine.BJBABGABCA()

			Dvar.BDEHAEGHAF("MSLTMOPNPN", var_557_0[arg_557_2])
		end,
		defaultOptionValue = function(arg_558_0, arg_558_1)
			return 1
		end,
		onRefresh = function(arg_559_0, arg_559_1, arg_559_2)
			arg_559_0.labels = Engine.BHBBJDEAC()
		end
	},
	VoiceSpeakerDevicePC = {
		labels = function()
			return Engine.DIHFEBAJJD()
		end,
		value = function(arg_561_0)
			local var_561_0 = Dvar.DHEEJCCJBH("LKKOOLRTTL")
			local var_561_1 = var_0_0(Engine.CIGDFGGEFD(), var_561_0)

			if var_561_1 == nil then
				return 1
			end

			return var_561_1
		end,
		action = function(arg_562_0, arg_562_1, arg_562_2)
			local var_562_0 = Engine.CIGDFGGEFD()

			Dvar.BDEHAEGHAF("NNQPPROKRO", var_562_0[arg_562_2])
		end,
		defaultOptionValue = function(arg_563_0, arg_563_1)
			return 1
		end,
		onRefresh = function(arg_564_0, arg_564_1, arg_564_2)
			arg_564_0.labels = Engine.DIHFEBAJJD()
		end
	},
	MicrophoneDevicePC = {
		labels = function()
			return Engine.BBIDIHBAEG()
		end,
		value = function(arg_566_0)
			local var_566_0 = Dvar.DHEEJCCJBH("NPQTQQNORO")
			local var_566_1 = var_0_0(Engine.EBJCHFFFII(), var_566_0)

			if var_566_1 == nil then
				return 1
			end

			return var_566_1
		end,
		action = function(arg_567_0, arg_567_1, arg_567_2)
			local var_567_0 = Engine.EBJCHFFFII()

			Dvar.BDEHAEGHAF("NOPOLMQKPL", var_567_0[arg_567_2])
		end,
		defaultOptionValue = function(arg_568_0, arg_568_1)
			return 1
		end,
		onRefresh = function(arg_569_0, arg_569_1, arg_569_2)
			arg_569_0.labels = Engine.BBIDIHBAEG()
		end
	},
	VoiceChatDeviceXBOX = {
		buildCondition = function()
			return not CONDITIONS.IsPS4()
		end,
		action = function(arg_571_0, arg_571_1, arg_571_2)
			local var_571_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")

			Dvar.BDEHAEGHAF("MSQLPLNSQN", var_571_0[arg_571_2])
		end,
		value = function(arg_572_0)
			local var_572_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")
			local var_572_1 = Dvar.DHEEJCCJBH("MSQLPLNSQN")

			return var_0_0(var_572_0, var_572_1)
		end,
		defaultOptionValue = function(arg_573_0, arg_573_1)
			return 1
		end
	},
	VoiceFutz = {
		action = function(arg_574_0, arg_574_1, arg_574_2)
			Dvar.BDEHAEGHAF("TLOLPTLNQ", OPTIONS.voiceChatEffectValues[arg_574_2])
		end,
		value = function(arg_575_0)
			return var_0_0(OPTIONS.voiceChatEffectValues, Dvar.DHEEJCCJBH("TLOLPTLNQ"))
		end,
		defaultOptionValue = function(arg_576_0)
			return var_0_0(OPTIONS.voiceChatEffectValues, "mw_default")
		end
	},
	VoiceLevelIndicator = {
		specificAction = function(arg_577_0, arg_577_1, arg_577_2)
			arg_577_1:SetButtonDisabled(true)
			arg_577_1.ArrowRight:SetAlpha(0)
			arg_577_1.ArrowLeft:SetAlpha(0)

			local var_577_0 = arg_577_0:Wait(100)
			local var_577_1

			local function var_577_2(arg_578_0)
				local var_578_0 = Engine.BJEDCJAEHH()

				arg_577_1.GenericFillBar.Fill:SetAnchors(0, 1 - var_578_0, 0, 0, 0)

				arg_578_0:Wait(100).onComplete = var_577_2
			end

			var_577_0.onComplete = var_577_2
		end
	},
	VoiceVolume = {
		action = function(arg_579_0, arg_579_1, arg_579_2)
			Dvar.IICIFEEDC("MSSPLOROPP", arg_579_2 / 100)
		end,
		value = function(arg_580_0)
			return Dvar.BJJCJHDBII("MSSPLOROPP") * 100
		end,
		defaultOptionValue = function(arg_581_0)
			return Dvar.DBGFIDHBFC("MSSPLOROPP") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	Volume = {
		action = function(arg_582_0, arg_582_1, arg_582_2)
			Dvar.IICIFEEDC("LQTPNKKMOP", arg_582_2 / 100)
		end,
		value = function(arg_583_0)
			return Dvar.BJJCJHDBII("LQTPNKKMOP") * 100
		end,
		defaultOptionValue = function(arg_584_0)
			return Dvar.DBGFIDHBFC("LQTPNKKMOP") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	RecordLevel = {
		action = function()
			return function(arg_586_0)
				Dvar.IICIFEEDC("OSONRTTPO", arg_586_0 * 65536)
			end
		end,
		value = function(arg_587_0)
			return Dvar.BJJCJHDBII("OSONRTTPO") / 65536
		end
	},
	VehicleCameraAutoRecenterController = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC")
			end
		end
	},
	VehicleCameraAutoRecenterKeyboard = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() then
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC")
			end
		end
	},
	VoiceThreshold = {
		action = function(arg_590_0, arg_590_1, arg_590_2, arg_590_3)
			Dvar.IICIFEEDC("MSKKKMTQNT", arg_590_3 * 65536)
		end,
		value = function(arg_591_0)
			return Dvar.BJJCJHDBII("MSKKKMTQNT") / 65536
		end
	},
	UnlockAllItems = {
		action = function(arg_592_0, arg_592_1, arg_592_2)
			Dvar.DHEGHJJJHI("OLKMKMTKRO", not Dvar.IBEGCHEFE("OLKMKMTKRO"))
		end,
		defaultOptionValue = function(arg_593_0)
			return 1
		end,
		buildCondition = function()
			return Engine.BHICADFIHA()
		end
	},
	PrintWeaponAttributes = {
		action = function(arg_595_0, arg_595_1, arg_595_2)
			Dvar.DFIJDJFIFD("MMTMMPTQKM", arg_595_2)
		end,
		defaultOptionValue = function(arg_596_0)
			local var_596_0 = Dvar.CFHDGABACF("MMTMMPTQKM")

			return var_596_0 and var_596_0 or 1
		end,
		value = function(arg_597_0)
			local var_597_0 = Dvar.CFHDGABACF("MMTMMPTQKM")

			return var_597_0 and var_597_0 or 1
		end
	},
	NvidiaHighlights = {
		buildCondition = function()
			return Dvar.CFHDGABACF("NRNOLQMMON") == 1
		end
	},
	NvidiaReflex = {
		buildCondition = function()
			return Dvar.CFHDGABACF("NRNOLQMMON") == 1 and Dvar.IBEGCHEFE("LPTKTQORTR")
		end
	},
	CoDCaster_TeamInfo = {
		action = function(arg_600_0, arg_600_1)
			LUI.FlowManager.RequestAddMenu("CodcasterSetup", true, arg_600_1)
		end
	},
	DataViewBindingCodcaster = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("RPNQOQSOS")
		end
	},
	SlideEnabledKeyboard = {
		onDependencyParentRefresh = function(arg_602_0, arg_602_1, arg_602_2, arg_602_3, arg_602_4)
			local var_602_0 = arg_602_2

			if arg_602_3 == "Crouch" and arg_602_4 == 2 then
				Engine.DFJDIFJEGA("tapToSlideEnabledKeyboard", 1, arg_602_1)

				var_602_0 = 2
			end

			return var_602_0
		end
	},
	CoDCaster_FreeCamSmoothFactor = {
		action = function(arg_603_0, arg_603_1, arg_603_2)
			Dvar.IICIFEEDC("NKOLKNSQNP", (34 - arg_603_2) / 1000)
		end,
		value = function(arg_604_0)
			return 34 - Dvar.BJJCJHDBII("NKOLKNSQNP") * 1000
		end,
		defaultOptionValue = function(arg_605_0)
			Dvar.IICIFEEDC("NKOLKNSQNP", 0.007)

			return 26
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	CoDCaster_FreeCamSpeed = {
		action = function(arg_606_0, arg_606_1, arg_606_2)
			Dvar.IICIFEEDC("NRKNMTPMTO", arg_606_2 / 100)
		end,
		value = function(arg_607_0)
			return Dvar.BJJCJHDBII("NRKNMTPMTO") * 100
		end,
		defaultOptionValue = function(arg_608_0)
			Dvar.IICIFEEDC("NRKNMTPMTO", 0.65)

			return 65
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	videoOptions = {
		type = "GenericButton",
		id = "VideoOptions",
		buttonHeight = 30,
		name = Engine.CBBHFCGDIC("LUA_MENU/VIDEO_OPTIONS_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/VIDEO_OPTIONS_DESC"),
		action = function(arg_609_0, arg_609_1, arg_609_2, arg_609_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_609_0, OPTIONS_DATA.optionsCategory.videoOptions, arg_609_3.mouse)
		end,
		focusAction = function(arg_610_0)
			arg_610_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	audioOptions = {
		type = "GenericButton",
		id = "AudioOptions",
		buttonHeight = 30,
		name = Engine.CBBHFCGDIC("LUA_MENU/AUDIO_OPTIONS_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/AUDIO_OPTIONS_DESC"),
		action = function(arg_611_0, arg_611_1, arg_611_2, arg_611_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_611_0, OPTIONS_DATA.optionsCategory.audioOptions, arg_611_3.mouse)
		end,
		focusAction = function(arg_612_0)
			arg_612_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	networkDiagnosticOptions = {
		type = "GenericButton",
		id = "NetworkDiagnosticOptions",
		buttonHeight = 30,
		name = Engine.CBBHFCGDIC("LUA_MENU/NETWORK_DIAGNOSTIC_OPTIONS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/NETWORK_DIAGNOSTIC_OPTIONS_DESC"),
		action = function(arg_613_0, arg_613_1, arg_613_2, arg_613_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_613_0, OPTIONS_DATA.optionsCategory.networkDiagnosticOptions, arg_613_3.mouse)
			arg_613_0:processEvent({
				name = "network_diagnostic_show"
			})
		end,
		focusAction = function(arg_614_0)
			arg_614_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	controlOptions = {
		type = "GenericButton",
		id = "ControlOptions",
		buttonHeight = 30,
		name = Engine.CBBHFCGDIC("LUA_MENU/CONTROL_OPTIONS_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/CONTROL_OPTIONS_DESC"),
		action = function(arg_615_0, arg_615_1, arg_615_2, arg_615_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_615_0, OPTIONS_DATA.optionsCategory.controlOptions, arg_615_3.mouse)
		end,
		focusAction = function(arg_616_0)
			arg_616_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	voiceOptions = {
		type = "GenericButton",
		id = "VoiceOptions",
		buttonHeight = 30,
		name = Engine.CBBHFCGDIC("LUA_MENU/VOICE_OPTIONS_CAPS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/VOICE_OPTIONS_DESC"),
		action = function(arg_617_0, arg_617_1, arg_617_2, arg_617_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_617_0, OPTIONS_DATA.optionsCategory.voiceOptions, arg_617_3.mouse)
		end,
		focusAction = function(arg_618_0)
			arg_618_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	SpamRemoval = {
		description = "Spam Removal",
		name = "SPAM REMOVAL",
		type = "GenericButton",
		id = "SpamRemoval",
		buttonHeight = 30,
		action = function(arg_619_0, arg_619_1)
			CoD.SpamRemovalAction()
		end,
		focusAction = function(arg_620_0)
			arg_620_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA() or Engine.BGAAHHAGAC()
		end
	},
	GrantT9Items = {
		description = "Grant All T9 Items",
		name = "Grant All T9 Items",
		type = "GenericButton",
		id = "GrantT9Items",
		buttonHeight = 30,
		action = function(arg_622_0, arg_622_1)
			CoD.GrantAllT9ItemsAction(arg_622_1)
		end,
		focusAction = function(arg_623_0)
			arg_623_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA()
		end
	},
	SendDailyChallengeCompletion = {
		description = "Send Daily Challenge Completion",
		name = "Send Daily Challenge Completion",
		type = "GenericButton",
		id = "SendDailyChallengeCompletion",
		buttonHeight = 30,
		action = function(arg_625_0, arg_625_1)
			CoD.SendDailyChallengeCompletion(arg_625_1, arg_625_0)
		end,
		focusAction = function(arg_626_0)
			arg_626_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA() and CONDITIONS.InGame()
		end
	},
	StreamingDebug = {
		description = "Streaming Debug",
		name = "Streaming Debug",
		type = "GenericButton",
		id = "StreamingDebug",
		buttonHeight = 30,
		action = function(arg_628_0, arg_628_1)
			CoD.StreamingDebugAction()
		end,
		focusAction = function(arg_629_0)
			arg_629_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA() or Engine.BGAAHHAGAC()
		end
	},
	StreamImageSortLists = {
		description = "Show stream image sort list fullscreen debug overlay",
		name = "Stream Image Sort Lists",
		type = "GenericButton",
		id = "StreamImageSortLists",
		buttonHeight = 30,
		action = function(arg_631_0, arg_631_1)
			CoD.StreamImageSortListsAction()
		end,
		focusAction = function(arg_632_0)
			arg_632_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA() or Engine.BGAAHHAGAC()
		end
	},
	StreamHTTPDebug = {
		description = "Show Stream HTTP debug overlay",
		name = "Stream HTTP Debug",
		type = "GenericButton",
		id = "StreamHTTPDebug",
		buttonHeight = 30,
		action = function(arg_634_0, arg_634_1)
			CoD.StreamHTTPDebugAction()
		end,
		focusAction = function(arg_635_0)
			arg_635_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA() or Engine.BGAAHHAGAC()
		end
	},
	displayOptions = {
		buttonHeight = 30,
		type = "GenericButton",
		id = "DisplayOptions",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DISPLAY_OPTIONS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DESC_DISPLAY_OPTIONS") or nil,
		focusAction = function(arg_637_0)
			arg_637_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	textureOptions = {
		buttonHeight = 30,
		type = "GenericButton",
		id = "TextureOptions",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/TEXTURE_OPTIONS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DESC_TEXTURE_OPTIONS") or nil,
		focusAction = function(arg_638_0)
			arg_638_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	GeneralSubCategoryDetailsTextures = {
		buildCondition = function(arg_639_0)
			return not Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end
	},
	InternetBandwidthUsage = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_641_0, arg_641_1, arg_641_2)
			local var_641_0 = Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_641_1)
			local var_641_1 = arg_641_2 - 1

			if var_641_1 == 1 then
				StreamHTTP.BEICCJHHAH(0)
			else
				StreamHTTP.BEICCJHHAH(var_641_0 * 1024)
			end

			Engine.DFJDIFJEGA("httpStreamUsageLimit", var_641_1, arg_641_1)
		end,
		value = function(arg_642_0)
			return Engine.BECCFCBIAA("httpStreamUsageLimit", arg_642_0) + 1
		end,
		isDependencyDisabled = function(arg_643_0, arg_643_1, arg_643_2, arg_643_3)
			if (arg_643_3 == "TextureDownloadLimitPC" or arg_643_3 == "TextureDownloadLimitConsole") and arg_643_2 ~= OPTIONS.disableButtonOptions.DISABLED then
				return true
			else
				return false
			end
		end
	},
	TextureDownloadExpanderPC = {
		buildCondition = function()
			return Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end
	},
	TextureDownloadExpanderConsole = {
		buildCondition = function()
			return not Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end
	},
	TextureDownloadPC = {
		buildCondition = function()
			return Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		description = function()
			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				return Engine.CBBHFCGDIC("PLATFORM/TEXTURE_DOWNLOADING_DESC_SQ_HQ")
			else
				return Engine.CBBHFCGDIC("PLATFORM/TEXTURE_DOWNLOADING_DESC")
			end
		end,
		labels = function()
			local var_648_0 = {}

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				var_648_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_648_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_STANDARD")
				var_648_0[3] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			else
				var_648_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_648_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			end

			return var_648_0
		end,
		action = function(arg_649_0, arg_649_1, arg_649_2)
			if arg_649_2 == 1 then
				Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 0, arg_649_1)
				Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 0)
			else
				Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 1, arg_649_1)

				if Dvar.IBEGCHEFE("PTQMQOKQ") and arg_649_2 == 2 then
					Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 0)
				else
					Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 1)
				end
			end
		end,
		value = function(arg_650_0)
			local var_650_0 = Engine.BECCFCBIAA("httpDownloadTexturesEnable", arg_650_0)
			local var_650_1 = Engine.BECCFCBIAA("httpDownloadTexturesQuality", arg_650_0)

			if var_650_0 == 0 then
				return 1
			elseif Dvar.IBEGCHEFE("PTQMQOKQ") then
				return var_650_1 > 0 and 3 or 2
			else
				return 2
			end
		end,
		isDependencyDisabled = function(arg_651_0, arg_651_1, arg_651_2, arg_651_3)
			return arg_651_2 == 1
		end
	},
	TextureDownloadConsole = {
		wrapAround = false,
		buildCondition = function()
			return not Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		description = function()
			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				return Engine.CBBHFCGDIC("PLATFORM/TEXTURE_DOWNLOADING_DESC_SQ_HQ")
			else
				return Engine.CBBHFCGDIC("PLATFORM/TEXTURE_DOWNLOADING_DESC")
			end
		end,
		labels = function()
			local var_654_0 = {}

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				var_654_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_654_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_STANDARD")
				var_654_0[3] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			else
				var_654_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_654_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			end

			return var_654_0
		end,
		action = function(arg_655_0, arg_655_1, arg_655_2)
			local var_655_0 = arg_655_0
			local var_655_1 = {
				0,
				24
			}

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				var_655_1 = {
					0,
					8,
					24
				}
			end

			local var_655_2 = StreamHTTP.DECHFDIAFC()
			local var_655_3 = var_655_1[arg_655_2]
			local var_655_4 = var_655_2 > 0 and 1 or 0
			local var_655_5 = var_655_3 > 0 and 1 or 0
			local var_655_6 = "PLATFORM/TEXTURE_CACHE_ALLOC_CONFIRM"

			if Engine.CIEGIACHAE() then
				var_655_6 = Engine.CBBHFCGDIC(var_655_6, var_655_3)
			else
				var_655_6 = Engine.CBBHFCGDIC(var_655_6)
			end

			if var_655_2 < var_655_3 then
				local var_655_7 = {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = var_655_6,
					noLabel = Engine.CBBHFCGDIC("MENU/CANCEL"),
					noAction = function(arg_656_0, arg_656_1)
						StreamHTTP.BDFCGGGAEA(var_655_2)
						Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_655_4, arg_655_1)
						var_655_0:processEvent({
							name = "seek_value",
							controllerIndex = arg_655_1
						})
					end,
					yesAction = function(arg_657_0, arg_657_1)
						StreamHTTP.BDFCGGGAEA(var_655_3)

						if Engine.BAHIIBFDDG() and CONDITIONS.UserHasATexturePack() ~= 0 then
							local var_657_0 = {}

							var_0_23(var_657_0, true, arg_655_1)
							LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNoCancel", true, arg_655_1, false, var_657_0, nil, true, true)
						end
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_655_1, false, var_655_7)
			end

			if var_655_3 > 0 and var_655_3 < var_655_2 then
				StreamHTTP.BDFCGGGAEA(var_655_3)
				Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_655_5, arg_655_1)
			end

			if var_655_3 == 0 and var_655_2 > 0 then
				if Engine.CIEGIACHAE() then
					local var_655_8 = {
						message = Engine.CBBHFCGDIC("PLATFORM/TEXTURE_CLEARCACHE_POPUP"),
						noAction = function(arg_658_0, arg_658_1)
							StreamHTTP.BDFCGGGAEA(var_655_2)
							Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_655_4, arg_658_1)
							var_655_0:processEvent({
								name = "seek_value",
								controllerIndex = arg_658_1
							})
						end,
						yesAction = function(arg_659_0, arg_659_1)
							StreamHTTP.BDFCGGGAEA(var_655_3)
							Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_655_5, arg_659_1)
							var_655_0:processEvent({
								name = "seek_value",
								controllerIndex = arg_659_1
							})
						end
					}

					LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_655_1, false, var_655_8)
				end

				if Engine.BAHIIBFDDG() then
					StreamHTTP.BDFCGGGAEA(var_655_3)
					Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_655_5, arg_655_1)
					var_655_0:processEvent({
						name = "seek_value",
						controllerIndex = arg_655_1
					})

					if Engine.IDICJHGG() and not Dvar.IBEGCHEFE("PTQMQOKQ") then
						local var_655_9 = {
							message = Engine.CBBHFCGDIC("PLATFORM/TEXTURE_CLEARCACHE_POPUP"),
							action = function(arg_660_0, arg_660_1)
								return
							end
						}

						LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_655_1, false, var_655_9)
					end
				end
			end
		end,
		value = function(arg_661_0)
			local var_661_0 = StreamHTTP.DECHFDIAFC()

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				if var_661_0 >= 22 then
					return 3
				end

				if var_661_0 > 0 then
					return 2
				end
			elseif var_661_0 > 0 then
				return 2
			end

			return 1
		end,
		isDependencyDisabled = function(arg_662_0, arg_662_1, arg_662_2, arg_662_3)
			return arg_662_2 == 1
		end,
		defaultOptionValue = function()
			return 1
		end
	},
	TextureDownloadLimitPC = {
		sliderDataName = "StreamHTTPLimitBounds",
		buildCondition = function()
			return Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_665_0, arg_665_1, arg_665_2)
			Engine.DFJDIFJEGA("httpStreamLimitMBytes", arg_665_2 * 1024, arg_665_1)

			if Engine.BECCFCBIAA("httpStreamUsageLimit", arg_665_1) == 1 then
				StreamHTTP.BEICCJHHAH(0)
			else
				StreamHTTP.BEICCJHHAH(arg_665_2 * 1024)
			end
		end,
		value = function(arg_666_0)
			return Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_666_0) / 1024
		end,
		specificAction = function(arg_667_0, arg_667_1, arg_667_2)
			local var_667_0 = arg_667_1.SetActive

			function arg_667_1.SetActive(arg_668_0, arg_668_1)
				local var_668_0 = var_667_0(arg_668_0, arg_668_1)

				arg_667_0:processEvent({
					name = "texture_download_limit_over"
				})

				if arg_667_0:GetCurrentMenu() then
					arg_667_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_over",
						controller = arg_667_2,
						index = value
					})
				end

				return var_668_0
			end

			local var_667_1 = arg_667_1.RemoveActive

			function arg_667_1.RemoveActive(arg_669_0, arg_669_1)
				local var_669_0 = var_667_1(arg_669_0, arg_669_1)

				arg_667_0:processEvent({
					name = "texture_download_limit_up"
				})

				if arg_667_0:GetCurrentMenu() then
					arg_667_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_up",
						controller = arg_667_2,
						index = value
					})
				end

				return var_669_0
			end

			arg_667_1:addEventHandler("button_up", function(arg_670_0, arg_670_1)
				if arg_670_0.isBootOptions then
					arg_667_0:processEvent({
						name = "texture_download_limit_up"
					})

					if arg_667_0:GetCurrentMenu() then
						arg_667_0:dispatchEventToCurrentMenu({
							name = "texture_download_limit_up",
							controller = arg_667_2,
							index = value
						})
					end
				end
			end)
		end
	},
	TextureDownloadLimitConsole = {
		sliderDataName = "StreamHTTPLimitBounds",
		buildCondition = function()
			return not Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_672_0, arg_672_1, arg_672_2)
			Engine.DFJDIFJEGA("httpStreamLimitMBytes", arg_672_2 * 1024, arg_672_1)

			if Engine.BECCFCBIAA("httpStreamUsageLimit", arg_672_1) == 1 then
				StreamHTTP.BEICCJHHAH(0)
			else
				StreamHTTP.BEICCJHHAH(arg_672_2 * 1024)
			end
		end,
		value = function(arg_673_0)
			return Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_673_0) / 1024
		end,
		specificAction = function(arg_674_0, arg_674_1, arg_674_2)
			local var_674_0 = arg_674_1.SetActive

			function arg_674_1.SetActive(arg_675_0, arg_675_1)
				local var_675_0 = var_674_0(arg_675_0, arg_675_1)

				arg_674_0:processEvent({
					name = "texture_download_limit_over"
				})

				if arg_674_0:GetCurrentMenu() then
					arg_674_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_over",
						controller = arg_674_2,
						index = value
					})
				end

				return var_675_0
			end

			local var_674_1 = arg_674_1.RemoveActive

			function arg_674_1.RemoveActive(arg_676_0, arg_676_1)
				local var_676_0 = var_674_1(arg_676_0, arg_676_1)

				arg_674_0:processEvent({
					name = "texture_download_limit_up"
				})

				if arg_674_0:GetCurrentMenu() then
					arg_674_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_up",
						controller = arg_674_2,
						index = value
					})
				end

				return var_676_0
			end

			arg_674_1:addEventHandler("button_up", function(arg_677_0, arg_677_1)
				if arg_677_0.isBootOptions then
					arg_674_0:processEvent({
						name = "texture_download_limit_up"
					})

					if arg_674_0:GetCurrentMenu() then
						arg_674_0:dispatchEventToCurrentMenu({
							name = "texture_download_limit_up",
							controller = arg_674_2,
							index = value
						})
					end
				end
			end)
		end
	},
	TextureDownloadCacheSizePC = {
		sliderDataName = "StreamHTTPCacheSizeBounds",
		buildCondition = function()
			return Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_679_0, arg_679_1, arg_679_2)
			if StreamHTTP.DECHFDIAFC() ~= arg_679_2 then
				StreamHTTP.BDFCGGGAEA(arg_679_2)
				Engine.BHIJFFCAEB("Changed http cache size")
			end
		end,
		onRefresh = function(arg_680_0, arg_680_1, arg_680_2)
			Dvar.DHEGHJJJHI("LQSQKPKOSQ", StreamHTTP.DECHFDIAFC() ~= arg_680_2)
		end,
		value = function(arg_681_0)
			return StreamHTTP.DECHFDIAFC()
		end
	},
	AlertIconAll = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		isDependencyDisabled = function(arg_683_0, arg_683_1, arg_683_2, arg_683_3)
			if arg_683_2 == 3 then
				return false
			end

			return true
		end,
		getSpecificImage = function(arg_684_0)
			if not Engine.CGABICJHAI() then
				arg_684_0 = "image_options_ingamealerts_console_"
			end

			return arg_684_0
		end,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("LUA_MENU/ALERT_ICONS_ALL_DESC_PC") or Engine.CBBHFCGDIC("LUA_MENU/ALERT_ICONS_ALL_DESC_CONSOLE")
	},
	AlertIconExpander = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end
	},
	AlertIconExtrapolation = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_687_0, arg_687_1, arg_687_2, arg_687_3, arg_687_4)
			return var_0_22(arg_687_4, arg_687_2)
		end
	},
	AlertIconHighLatency = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_689_0, arg_689_1, arg_689_2, arg_689_3, arg_689_4)
			return var_0_22(arg_689_4, arg_689_2)
		end
	},
	AlertIconLatencyVariation = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_691_0, arg_691_1, arg_691_2, arg_691_3, arg_691_4)
			return var_0_22(arg_691_4, arg_691_2)
		end
	},
	AlertIconPacketBurst = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_693_0, arg_693_1, arg_693_2, arg_693_3, arg_693_4)
			return var_0_22(arg_693_4, arg_693_2)
		end
	},
	AlertIconShaderWarning = {
		buildCondition = function()
			return Engine.CGABICJHAI() and not Dvar.IBEGCHEFE("MTTTROPML") and not Dvar.IBEGCHEFE("QSPRQKKMN")
		end,
		onDependencyParentRefresh = function(arg_695_0, arg_695_1, arg_695_2, arg_695_3, arg_695_4)
			return var_0_22(arg_695_4, arg_695_2)
		end
	},
	TextureCacheClearPC = {
		buildCondition = function()
			return Engine.CGABICJHAI() and CONDITIONS.InFrontend() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_697_0, arg_697_1)
			local var_697_0 = {
				title = Engine.CBBHFCGDIC("MENU/CLEAR_CACHE_TITLE"),
				message = Engine.CBBHFCGDIC("MENU/CLEAR_CACHE_MSG"),
				noLabel = Engine.CBBHFCGDIC("MENU/CANCEL"),
				yesLabel = Engine.CBBHFCGDIC("MENU/CONTINUE"),
				yesAction = function()
					Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 0, arg_697_1)
					Dvar.DHEGHJJJHI("OPPPMPTPL", false)
					Dvar.DAACJFEEDC("MOKSKTKTLQ", 1)
					LUI.ClearCacheLayer.SetAllowCacheClear(true)
					arg_697_0:processEvent({
						name = "texture_streaming_disable"
					})
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_697_1, false, var_697_0)
		end
	},
	ContrastAdaptiveSharpenerExpander = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("NOPKOOSRTS")
		end
	},
	ContrastAdaptiveSharpener = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("NOPKOOSRTS")
		end
	},
	ContrastAdaptiveSharpenerStrength = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("NOPKOOSRTS")
		end
	},
	DynamicResolution = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("LQMMKMTNTT")
		end,
		action = function(arg_703_0, arg_703_1, arg_703_2)
			if Dvar.CFHDGABACF("MQOMSSQRRQ") == 4 then
				Dvar.DHEGHJJJHI("NPPSOKOPLP", false)
			else
				Dvar.DHEGHJJJHI("NPPSOKOPLP", arg_703_2 == OPTIONS.disableButtonOptions.ENABLED)
			end
		end
	},
	DynamicResolutionFramerateTarget = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("LQMMKMTNTT")
		end,
		action = function(arg_705_0, arg_705_1, arg_705_2)
			local var_705_0 = 1000

			Dvar.IICIFEEDC("RTOOKRTNO", var_705_0 / arg_705_2)
		end,
		value = function(arg_706_0)
			local var_706_0 = Dvar.BJJCJHDBII("RTOOKRTNO")
			local var_706_1 = 300
			local var_706_2 = 1000

			if var_706_0 <= var_706_2 / var_706_1 then
				Dvar.IICIFEEDC("RTOOKRTNO", var_706_2 / var_706_1)

				return var_706_1
			else
				return var_706_2 / var_706_0
			end
		end,
		defaultOptionValue = function()
			return 1000 / Dvar.DBGFIDHBFC("RTOOKRTNO")
		end
	},
	lightAndShadowOptions = {
		buttonHeight = 30,
		type = "GenericButton",
		id = "LightAndShadowOptions",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/LIGHT_AND_SHADOW_OPTIONS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DESC_LIGHT_SHADOW_OPTIONS") or nil,
		focusAction = function(arg_708_0)
			arg_708_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	postProcessOptions = {
		buttonHeight = 30,
		type = "GenericButton",
		id = "PostProcessOptions",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/POST_PROCESS_OPTIONS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DESC_POST_PROCESS_OPTIONS") or nil,
		focusAction = function(arg_709_0)
			arg_709_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	miscOptions = {
		buttonHeight = 30,
		type = "GenericButton",
		id = "MiscOptions",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/MISC_OPTIONS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DESC_MISCELLANEOUS_OPTIONS") or nil,
		focusAction = function(arg_710_0)
			arg_710_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	WeaponInspectAction = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NOKSLTKTRT")
		end
	},
	DecreaseZoomAction = {
		buildCondition = function()
			return CONDITIONS.IsWZWipDvarEnabled()
		end
	},
	WarTracksAsAPassenger = {
		action = function(arg_713_0, arg_713_1, arg_713_2)
			Engine.DFJDIFJEGA("warTrackPassengerEnable", arg_713_2 - 1, arg_713_1)
		end,
		value = function(arg_714_0)
			return Engine.BECCFCBIAA("warTrackPassengerEnable", arg_714_0) + 1
		end,
		defaultOptionValue = function(arg_715_0)
			return 2
		end
	},
	WarTracksVolume = {
		action = function(arg_716_0, arg_716_1, arg_716_2)
			Dvar.IICIFEEDC("OMPKLSORSL", arg_716_2 / 100)
		end,
		value = function(arg_717_0, arg_717_1)
			return Dvar.BJJCJHDBII("OMPKLSORSL") * 100
		end,
		defaultOptionValue = function(arg_718_0)
			return Dvar.DBGFIDHBFC("OMPKLSORSL") * 100
		end
	},
	HoldBreathGamepad = {
		buildCondition = function(arg_719_0)
			return Dvar.IBEGCHEFE("MNPTNPNLMK")
		end
	},
	HoldBreathKeyboard = {
		onDependencyParentRefresh = function(arg_720_0, arg_720_1, arg_720_2, arg_720_3, arg_720_4)
			if arg_720_3 == "ChangeZoomToggleHybridKBM" and arg_720_4 == 1 then
				return 1
			end
		end,
		buildCondition = function(arg_721_0)
			return Dvar.IBEGCHEFE("MNPTNPNLMK")
		end
	},
	ChangeZoomToggleHybridKBM = {
		isDependencyDisabled = function(arg_722_0, arg_722_1, arg_722_2, arg_722_3)
			return arg_722_2 == 1
		end
	},
	AdsMouseSensitivityPerZoomOption = {
		isDependencyDisabled = function(arg_723_0, arg_723_1, arg_723_2, arg_723_3)
			if arg_723_3 == "AdsMouseSensitivityMultiplierOption" then
				return arg_723_2 == OPTIONS.disableButtonOptions.ENABLED
			else
				return arg_723_2 == OPTIONS.disableButtonOptions.DISABLED
			end
		end
	},
	AdsStickSensitivityPerZoomOption = {
		isDependencyDisabled = function(arg_724_0, arg_724_1, arg_724_2, arg_724_3)
			if arg_724_3 == "AdsStickSensitivityMultiplierOption" then
				return arg_724_2 == OPTIONS.disableButtonOptions.ENABLED
			else
				return arg_724_2 == OPTIONS.disableButtonOptions.DISABLED
			end
		end
	},
	CameraMovementBehavior = {
		applyableOverride = false,
		applyable = false
	},
	ShowCompass = {
		isDependencyDisabled = function(arg_725_0, arg_725_1, arg_725_2, arg_725_3)
			return arg_725_2 == 1
		end,
		action = function(arg_726_0, arg_726_1, arg_726_2)
			Engine.DFJDIFJEGA("showCompass", arg_726_2 - 1, arg_726_1)

			if LUI.HudManager then
				local var_726_0 = LUI.HudManager.GetInstance()

				if var_726_0 then
					var_726_0:processEvent({
						name = "on_show_compass_changed"
					})
				end
			end
		end
	},
	AlwaysShowVehicleControls = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("NSSQNMQKLM")
		end,
		action = function(arg_728_0, arg_728_1, arg_728_2)
			if arg_728_2 == 4 then
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 0, arg_728_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 0, arg_728_1)
			elseif arg_728_2 == 3 then
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 0, arg_728_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 1, arg_728_1)
			elseif arg_728_2 == 2 then
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 1, arg_728_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 0, arg_728_1)
			else
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 1, arg_728_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 1, arg_728_1)
			end
		end,
		value = function(arg_729_0)
			local var_729_0 = Engine.BECCFCBIAA("alwaysShowGroundVehicleControls", arg_729_0)
			local var_729_1 = Engine.BECCFCBIAA("alwaysShowAirVehicleControls", arg_729_0)

			if var_729_0 and var_729_1 then
				return 1
			elseif var_729_0 and not var_729_1 then
				return 2
			elseif var_729_1 and not var_729_0 then
				return 3
			else
				return 4
			end
		end,
		defaultOptionValue = function()
			return 4
		end
	},
	ManualGasMask = {
		action = function(arg_731_0, arg_731_1, arg_731_2)
			Engine.DFJDIFJEGA("manualGasMaskEnable", arg_731_2 - 1, arg_731_1)
		end,
		value = function(arg_732_0)
			return Engine.BECCFCBIAA("manualGasMaskEnable", arg_732_0) + 1
		end,
		defaultOptionValue = function(arg_733_0)
			return 1
		end
	},
	BuystationCloseOnPurchase = {
		action = function(arg_734_0, arg_734_1, arg_734_2)
			Engine.DFJDIFJEGA("buystationCloseMenuOnPurchase", arg_734_2 - 1, arg_734_1)
		end
	},
	DefaultToFirstLoadoutItem = {
		action = function(arg_735_0, arg_735_1, arg_735_2)
			Engine.DFJDIFJEGA("defaultToFirstLoadoutItemInDrop", arg_735_2 - 1, arg_735_1)
		end
	}
}
