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
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
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
		end,
		buildCondition = function()
			return not CONDITIONS.IsStreamingFromCloud()
		end
	},
	GeneralSubCategoryHDR = {
		buildCondition = function(arg_101_0)
			return var_0_7() or Engine.DJDAJEJDE()
		end
	},
	DismembermentOption = {
		action = function(arg_102_0, arg_102_1, arg_102_2)
			Dvar.DHEGHJJJHI("OQLRMLRK", arg_102_2 == 2)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_102_1)
		end,
		value = function(arg_103_0)
			return Dvar.IBEGCHEFE("OQLRMLRK") and 2 or 1
		end,
		defaultOptionValue = function(arg_104_0)
			return 2
		end,
		buildCondition = function()
			return Engine.CIDEADAABH()
		end
	},
	HDR = {
		isDependencyDisabled = function(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
			if arg_106_3 == "Brightness" or arg_106_3 == "SDRColorSpace" then
				return arg_106_2 == 2
			else
				return arg_106_2 == 1
			end
		end,
		action = function(arg_107_0, arg_107_1, arg_107_2)
			Dvar.DHEGHJJJHI("MTONTNKOKR", arg_107_2 == 2)
			Engine.EBIDFIDHIE("vid_reconfig")
		end,
		buildCondition = var_0_7
	},
	HDRBrightness = {
		action = function(arg_108_0, arg_108_1, arg_108_2)
			arg_108_2 = Mirror(arg_108_2, SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)

			Dvar.IICIFEEDC("PPNORSOSS", arg_108_2)
		end,
		value = function(arg_109_0)
			return Mirror(Dvar.BJJCJHDBII("PPNORSOSS"), SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)
		end,
		buildCondition = function(arg_110_0)
			return Engine.DJDAJEJDE()
		end
	},
	HDRCalibration = {
		action = function(arg_111_0, arg_111_1, arg_111_2)
			Engine.DAGFFDGFII("profile_UpdateProfileMenuOptionsHDRLumDvars")
			LUI.FlowManager.RequestPopupMenu(unused, "BootHDRBlackPoint", true, arg_111_1, false, {
				fromOptionMenu = true
			}, true, true)
		end,
		buildCondition = function(arg_112_0)
			return Engine.DJDAJEJDE()
		end
	},
	InternalIPAddress = {
		name = function()
			local var_113_0 = Dvar.IBEGCHEFE("SQMORMQQS")

			return Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS", var_113_0 and Engine.JCBDICCAH(NetworkInfo.DBDIHEIEGB()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_114_0, arg_114_1, arg_114_2)
			local var_114_0 = arg_114_2 == 2
			local var_114_1 = Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS", var_114_0 and Engine.JCBDICCAH(NetworkInfo.DBDIHEIEGB()) or "LUA_MENU/HIDDEN")
			local var_114_2 = arg_114_0:GetCurrentMenu()

			if var_114_2 then
				var_114_2.OptionName:setText(ToUpperCase(var_114_1))
			end

			arg_114_0.buttonName = var_114_1

			arg_114_0.GenericOptionButtonBase.Title:setText(var_114_1)
		end,
		defaultOptionValue = function(arg_115_0)
			return 1
		end
	},
	ExternalIPAddress = {
		name = function()
			local var_116_0 = Dvar.IBEGCHEFE("MTSPMPOSTO")

			return Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS", var_116_0 and Engine.JCBDICCAH(NetworkInfo.BBJBJGDIGD()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_117_0, arg_117_1, arg_117_2)
			local var_117_0 = arg_117_2 == 2
			local var_117_1 = Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS", var_117_0 and Engine.JCBDICCAH(NetworkInfo.BBJBJGDIGD()) or "LUA_MENU/HIDDEN")
			local var_117_2 = arg_117_0:GetCurrentMenu()

			if var_117_2 then
				var_117_2.OptionName:setText(ToUpperCase(var_117_1))
			end

			arg_117_0.buttonName = var_117_1

			arg_117_0.GenericOptionButtonBase.Title:setText(var_117_1)
		end,
		defaultOptionValue = function(arg_118_0)
			return 1
		end
	},
	GeographicalRegion = {
		name = function()
			local var_119_0 = Dvar.IBEGCHEFE("MKMOPQKMPO")

			return Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION", var_119_0 and Engine.JCBDICCAH(NetworkInfo.BGJIBGHBAG()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_120_0, arg_120_1, arg_120_2)
			local var_120_0 = arg_120_2 == 2
			local var_120_1 = Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION", var_120_0 and Engine.JCBDICCAH(NetworkInfo.BGJIBGHBAG()) or "LUA_MENU/HIDDEN")
			local var_120_2 = arg_120_0:GetCurrentMenu()

			if var_120_2 then
				var_120_2.OptionName:setText(ToUpperCase(var_120_1))
			end

			arg_120_0.buttonName = var_120_1

			arg_120_0.GenericOptionButtonBase.Title:setText(var_120_1)
		end,
		defaultOptionValue = function(arg_121_0)
			return 1
		end
	},
	ConnectionMeter = {
		value = function(arg_122_0)
			return Dvar.IBEGCHEFE("OMOTRTTLNP") and 1 or 2
		end,
		action = function(arg_123_0, arg_123_1, arg_123_2)
			Dvar.DHEGHJJJHI("OMOTRTTLNP", arg_123_2 == 1)
		end,
		onRefresh = function(arg_124_0, arg_124_1, arg_124_2)
			arg_124_0:processEvent({
				name = "connection_meter_toggle"
			})
		end,
		specificAction = function(arg_125_0, arg_125_1, arg_125_2)
			arg_125_1:addEventHandler("connection_meter_toggle", function(arg_126_0, arg_126_1)
				arg_125_0:processEvent({
					name = "connection_meter_toggle_internal"
				})
				Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_125_2)
			end)
		end,
		defaultOptionValue = function(arg_127_0)
			return 1
		end
	},
	DebugKeyboard = {
		action = function(arg_128_0, arg_128_1, arg_128_2)
			Engine.DAGFFDGFII("profile_toggleDevKeyboard")
		end,
		defaultOptionValue = function(arg_129_0)
			return 1
		end,
		value = function(arg_130_0)
			return Engine.BECCFCBIAA("useDevKeyboard", arg_130_0) and 2 or 1
		end
	},
	NewTextChatDebug = {
		action = function(arg_131_0, arg_131_1, arg_131_2)
			local var_131_0 = arg_131_2 == 2

			Dvar.DHEGHJJJHI("LKSKPKTOON", var_131_0)
			Dvar.DHEGHJJJHI("NNOQMLNSMP", not var_131_0)
			Dvar.DHEGHJJJHI("NLPSQMQRTP", not var_131_0)
			LUI.UIRoot.ReloadChatForDebugOption()
		end,
		defaultOptionValue = function(arg_132_0)
			return 1
		end
	},
	KeybindChangeLoadoutExpander = {
		buildCondition = function()
			return not CONDITIONS.IsSplitscreen()
		end
	},
	OnlineDebug = {
		defaultOptionValue = function(arg_134_0)
			return 1
		end,
		buildCondition = function()
			return Debug.CGCBEDDFEC()
		end
	},
	DoNotSellMyData = {
		action = function(arg_136_0, arg_136_1, arg_136_2)
			local var_136_0 = Regulations.DDHCCFAIHI(arg_136_1)

			if arg_136_2 == OPTIONS.disableButtonOptions.ENABLED then
				if var_136_0 ~= OPTIONS.regulationType.INVALID then
					local var_136_1 = {
						yesAction = function()
							Regulations.DAACCJJHEG(arg_136_1, var_136_0, OPTIONS.regulationPreference.OPT_OUT)
						end,
						noAction = function()
							arg_136_0.currentValue = OPTIONS.disableButtonOptions.DISABLED

							arg_136_0:UpdateContent()
						end,
						message = Engine.CBBHFCGDIC(OPTIONS.regulationDesc[var_136_0])
					}

					LUI.FlowManager.RequestPopupMenu(nil, "EnableCCPAWarning", true, arg_136_1, false, var_136_1)
				end
			elseif arg_136_2 == OPTIONS.disableButtonOptions.DISABLED then
				Regulations.DAACCJJHEG(arg_136_1, var_136_0, OPTIONS.regulationPreference.OPT_IN)
			end
		end,
		value = function(arg_139_0)
			local var_139_0 = Regulations.DDHCCFAIHI(arg_139_0)
			local var_139_1 = OPTIONS.disableButtonOptions.DISABLED

			if var_139_0 ~= OPTIONS.regulationType.INVALID then
				local var_139_2 = Regulations.BHFFIJBAEG(arg_139_0, var_139_0)

				if var_139_2 and var_139_2 == OPTIONS.regulationPreference.OPT_OUT then
					var_139_1 = OPTIONS.disableButtonOptions.ENABLED
				end
			end

			return var_139_1
		end,
		defaultOptionValue = function(arg_140_0)
			return OPTIONS.disableButtonOptions.DISABLED
		end,
		buildCondition = function(arg_141_0)
			if Engine.BIIBDBAHD() then
				return (Regulations.FCCAFGFD(arg_141_0))
			else
				return false
			end
		end,
		disabled = function(arg_142_0)
			return not Regulations.FCCAFGFD(arg_142_0)
		end,
		name = function()
			local var_143_0 = Engine.DBFFAEEFGJ():GetControllerIndex() or 0

			if Engine.BIIBDBAHD() and Regulations.FCCAFGFD(var_143_0) then
				local var_143_1 = Regulations.DDHCCFAIHI(var_143_0)

				if var_143_1 ~= OPTIONS.regulationType.INVALID then
					return Engine.CBBHFCGDIC(OPTIONS.regulationName[var_143_1])
				end
			end

			return Engine.CBBHFCGDIC("MENU/PRIVACY_CHOICES_NAME")
		end,
		description = function()
			local var_144_0 = Engine.DBFFAEEFGJ():GetControllerIndex() or 0

			if Engine.BIIBDBAHD() and Regulations.FCCAFGFD(var_144_0) then
				local var_144_1 = Regulations.DDHCCFAIHI(var_144_0)

				if var_144_1 ~= OPTIONS.regulationType.INVALID then
					return Engine.CBBHFCGDIC(OPTIONS.regulationDesc[var_144_1])
				end
			end

			return Engine.CBBHFCGDIC("MENU/PRIVACY_CHOICES_DESC")
		end
	},
	WeaponMountingMovementExit = {
		isDependencyDisabled = function(arg_145_0, arg_145_1, arg_145_2, arg_145_3)
			return arg_145_2 == 1
		end,
		buildCondition = var_0_8
	},
	WeaponMountingMovementExitController = {
		buildCondition = var_0_8
	},
	ADSFOV = {
		applyableOverride = false,
		applyable = false,
		defaultOptionValue = function(arg_146_0)
			return 1
		end
	},
	MouseAdsUseMonitorDistance = {
		isDependencyDisabled = function(arg_147_0, arg_147_1, arg_147_2, arg_147_3)
			return arg_147_2 == 1
		end,
		defaultOptionValue = function(arg_148_0)
			return 2
		end
	},
	VoiceChatRecordingMode = {
		action = function(arg_149_0, arg_149_1, arg_149_2)
			Dvar.DHEGHJJJHI("MOOMTQSMPS", arg_149_2 == 1)
		end,
		value = function(arg_150_0, arg_150_1, arg_150_2)
			return Dvar.IBEGCHEFE("MOOMTQSMPS") and 1 or 2
		end,
		defaultOptionValue = function(arg_151_0, arg_151_1, arg_151_2)
			return Dvar.DBGFIDHBFC("MOOMTQSMPS") and 1 or 2
		end,
		isDependencyDisabled = function(arg_152_0, arg_152_1, arg_152_2, arg_152_3)
			if arg_152_3 == "OpenMicRecordingSensitivity" then
				return arg_152_2 == 1
			elseif arg_152_3 == "VoiceChat" then
				return arg_152_2 == 2
			end
		end
	},
	UseVoiceCom = {
		isDependencyDisabled = function(arg_153_0, arg_153_1, arg_153_2, arg_153_3)
			return arg_153_2 == 1
		end,
		defaultOptionValue = function(arg_154_0)
			return 2
		end
	},
	DisplayGamma = {
		value = function(arg_155_0)
			return 1
		end,
		defaultOptionValue = function(arg_156_0)
			return 2
		end,
		buildCondition = function()
			return false
		end
	},
	VSync = {
		action = function(arg_158_0, arg_158_1, arg_158_2)
			if CONDITIONS.IsConsoleGame() then
				Dvar.DHEGHJJJHI("MPPNRRRPMP", arg_158_2)
			else
				Dvar.DFIJDJFIFD("MPPNRRRPMP", arg_158_2 - 1)
			end
		end,
		value = function(arg_159_0)
			if not Engine.CAFCFHEFDD() and Dvar.CFHDGABACF("NNSQSMTQPP") == 0 then
				return 1
			else
				return Dvar.IBEGCHEFE("MPPNRRRPMP") and 2 or 1
			end
		end,
		defaultOptionValue = function(arg_160_0)
			return Dvar.DBGFIDHBFC("MPPNRRRPMP") + 1
		end,
		disabled = function()
			return not Engine.CAFCFHEFDD() and Dvar.CFHDGABACF("NNSQSMTQPP") == 0
		end
	},
	CPUPriority = {
		defaultOptionValue = function(arg_162_0)
			return 2
		end
	},
	ParticleLighting = {
		value = function()
			local var_163_0 = {
				2,
				3,
				4,
				5
			}
			local var_163_1 = Dvar.CFHDGABACF("MTNMRSTQN")
			local var_163_2 = 1

			if var_163_1 <= var_163_0[1] then
				var_163_2 = 1
			elseif var_163_1 <= var_163_0[2] then
				var_163_2 = 2
			elseif var_163_1 <= var_163_0[3] then
				var_163_2 = 3
			elseif var_163_1 <= var_163_0[4] then
				var_163_2 = 4
			end

			return var_163_2
		end,
		action = function(arg_164_0, arg_164_1, arg_164_2)
			local var_164_0 = {
				2,
				3,
				4,
				5
			}
			local var_164_1 = {
				64,
				32,
				24,
				16
			}

			Dvar.DFIJDJFIFD("MTNMRSTQN", var_164_0[arg_164_2])
			Dvar.IICIFEEDC("PSTSNKNPR", var_164_1[arg_164_2])
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
		defaultOptionValue = function(arg_166_0)
			return 1
		end,
		action = function(arg_167_0, arg_167_1, arg_167_2)
			Dvar.DHEGHJJJHI("MPRNRNTNNQ", arg_167_2 == 1)
		end
	},
	VoiceChatMuteAllStrategy = {
		action = function(arg_168_0, arg_168_1, arg_168_2)
			local var_168_0 = arg_168_2 ~= MuteStrategy.MuteStrategyMuteAll + 1

			Dvar.DHEGHJJJHI("cl_voice", var_168_0)
			Lobby.HCCAGAJGJ(arg_168_1, arg_168_2 - 1)
		end,
		value = function(arg_169_0)
			return Lobby.BJFFJACJDD(arg_169_0) + 1
		end,
		disabled = function(arg_170_0)
			if Dvar.IBEGCHEFE("LQSTPOPKRO") then
				return Engine.HFFCCEIAB(arg_170_0) or CONDITIONS.IsPCMSStore() and Engine.CDFCHEJJE(arg_170_0)
			elseif CONDITIONS.IsPCMSStore() then
				return Engine.CDFCHEJJE(arg_170_0)
			else
				return false
			end
		end,
		isDependencyDisabled = function(arg_171_0, arg_171_1, arg_171_2, arg_171_3)
			return arg_171_2 == 2
		end,
		defaultOptionValue = function(arg_172_0)
			return Engine.IEBBJFBE("voiceMuteStrategy", arg_172_0) + 1
		end
	},
	CrossPlay = {
		action = function(arg_173_0, arg_173_1, arg_173_2)
			if CONDITIONS.IsPCMSStore() and not Engine.DEEJHHBAIC(arg_173_1, MP_COMMON.LivePrivileges.LIVE_PRIVILEGE_INDEX_CROSSPLAY) then
				local var_173_0 = true

				Engine.JDFCAABHC(arg_173_1, MP_COMMON.LivePrivileges.LIVE_PRIVILEGE_INDEX_CROSSPLAY, var_173_0)

				return OPTIONS.disableButtonOptions.DISABLED
			else
				local var_173_1 = Engine.BBHCDCACGA(arg_173_1, arg_173_2 == OPTIONS.disableButtonOptions.ENABLED)

				if Lobby.GFFECBCCF() or CONDITIONS.IsSingleplayer() then
					if arg_173_2 == OPTIONS.disableButtonOptions.ENABLED then
						Dvar.DHEGHJJJHI("QOTNQOSRN", true)
						Social.CEFBABBCGD(arg_173_1, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_WARNING"))
					else
						Social.CEFBABBCGD(arg_173_1, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_DISABLED"))
					end
				end

				if var_173_1 then
					ACTIONS.UploadStats(arg_173_0, arg_173_1)

					if not Engine.CAADCDEEIA() and enabled == 0 and Friends.BAGCHIDGCC() then
						Engine.DAGFFDGFII("xstopprivateparty 1 1")
						Engine.DAGFFDGFII("xstartprivateparty")
						LUI.FlowManager.RequestPopupMenu(nil, "CrossPlayDisabledPrivatePartyBackoutMessage", true, arg_173_1, false, {}, nil, true, true)
					end
				end
			end
		end,
		value = function(arg_174_0)
			return Engine.FIDIEBFAG(arg_174_0) and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end,
		defaultOptionValue = function(arg_175_0)
			if Engine.ECAJCAJJGF() or Engine.DJFGIIBCBH(arg_175_0) then
				return 1
			else
				return 2
			end
		end,
		disabled = function(arg_176_0)
			local var_176_0 = false

			if CONDITIONS.IsPCMSStore() then
				var_176_0 = Engine.CHAGGFEEJD(arg_176_0) or Engine.DAFGFCFHJI() or Engine.JIFDEGGHE() or not CONDITIONS.InFrontend()
			else
				var_176_0 = not Engine.DJFGIIBCBH(arg_176_0)
			end

			return var_176_0
		end,
		buildCondition = function(arg_177_0)
			if Engine.CGABICJHAI() then
				return Dvar.IBEGCHEFE("OMTMSLKTKR") and not Engine.ECAJCAJJGF()
			else
				return true
			end
		end
	},
	Adapter = {
		value = function()
			local var_178_0 = Dvar.DHEEJCCJBH("MPLSTSPKPT")

			return (var_0_0(Engine.CJCDDGBHJI(), var_178_0))
		end,
		action = function(arg_179_0, arg_179_1, arg_179_2)
			local var_179_0 = Engine.CJCDDGBHJI()

			Dvar.BDEHAEGHAF("MPLSTSPKPT", var_179_0[arg_179_2])
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
		action = function(arg_182_0, arg_182_1)
			LUI.FlowManager.RequestAddMenu("AdvancedVideoOptions", true, arg_182_1)
		end
	},
	AimAssist = {
		action = function(arg_183_0, arg_183_1, arg_183_2)
			Engine.DFJDIFJEGA("hasPlayerChangedAimAssistSetting", 1, arg_183_1)

			if arg_183_2 == 1 then
				Engine.DFJDIFJEGA("autoAim", 0, arg_183_1)
				Engine.DFJDIFJEGA("targetAssist", 0, arg_183_1)
			else
				Engine.DFJDIFJEGA("autoAim", 1, arg_183_1)
				Engine.DFJDIFJEGA("targetAssist", 1, arg_183_1)
				Engine.DFJDIFJEGA("aimAssistType", arg_183_2 - 1, arg_183_1)
			end
		end,
		defaultOptionValue = function(arg_184_0)
			if Engine.IEBBJFBE("autoAim") then
				return Engine.IEBBJFBE("aimAssistType") + 1
			else
				return 1
			end
		end,
		value = function(arg_185_0)
			if not Engine.BECCFCBIAA("autoAim", arg_185_0) then
				return 1
			else
				return Engine.BECCFCBIAA("aimAssistType", arg_185_0) + 1
			end
		end,
		disabled = var_0_2
	},
	AimResponseCurveType = {
		action = function(arg_186_0, arg_186_1, arg_186_2)
			Engine.DFJDIFJEGA("aimResponseCurveType", arg_186_2, arg_186_1)
		end,
		value = function(arg_187_0)
			return Engine.BECCFCBIAA("aimResponseCurveType", arg_187_0)
		end,
		defaultOptionValue = function(arg_188_0, arg_188_1)
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
		action = function(arg_190_0, arg_190_1, arg_190_2)
			Engine.DEEDAHEFAJ(arg_190_1, arg_190_2)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_190_1)
		end,
		defaultOptionValue = function(arg_191_0, arg_191_1)
			return Engine.IEBBJFBE("aimAssistType")
		end,
		value = function(arg_192_0)
			return Engine.BECCFCBIAA("aimAssistType", arg_192_0)
		end
	},
	AntiAliasing = {
		labels = function()
			local var_193_0 = {
				Engine.CBBHFCGDIC("MENU/OFF"),
				Engine.CBBHFCGDIC("MENU/SMAA_1X")
			}

			if Engine.CGDBBICBA() then
				var_193_0[#var_193_0 + 1] = Engine.CBBHFCGDIC("MENU/SMAA_TEMPORAL")
				var_193_0[#var_193_0 + 1] = Engine.CBBHFCGDIC("MENU/FILMIC_SMAA_T2X")
			end

			return var_193_0
		end,
		action = function(arg_194_0, arg_194_1, arg_194_2)
			if not (Dvar.CFHDGABACF("MQOMSSQRRQ") == 4) and arg_194_2 >= 1 then
				Dvar.DFIJDJFIFD("MLNLRLRPQL", arg_194_2 - 1)
				Dvar.DFIJDJFIFD("MQOMSSQRRQ", arg_194_2 - 1)
			end
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("MQOMSSQRRQ") + 1
		end,
		onDependencyParentRefresh = function(arg_196_0, arg_196_1, arg_196_2, arg_196_3, arg_196_4)
			if arg_196_3 == "DXR" and arg_196_4 ~= OPTIONS.disableButtonOptions.DISABLED then
				return 4
			end
		end
	},
	ArmorPlate = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	ArmorPlateApplyAllGamepad = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("LOLOTKQLLN") and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	ArmorPlateApplyAllKBM = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("LOLOTKQLLN") and not CONDITIONS.IsLazeOrOutrun()
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
		value = function(arg_200_0)
			local var_200_0 = Dvar.CFHDGABACF("QKKMRRLRR")

			return (LUI.clamp(var_200_0 - 1, 1, 6))
		end,
		action = function(arg_201_0, arg_201_1, arg_201_2)
			local var_201_0 = ({
				0,
				3,
				4,
				5,
				6
			})[arg_201_2]

			Dvar.DFIJDJFIFD("QKKMRRLRR", var_201_0)

			local var_201_1 = OPTIONS.InitOptionsList(arg_201_0, arg_201_1)
			local var_201_2 = OPTIONS.GetOptionsDataByIdentifier(arg_201_0, arg_201_1, var_201_1, "HudBoundsH", CSV.generalOptions)
			local var_201_3 = OPTIONS.GetOptionsDataByIdentifier(arg_201_0, arg_201_1, var_201_1, "HudBoundsV", CSV.generalOptions)
			local var_201_4 = var_201_2.defaultOptionValue(arg_201_0, arg_201_1)
			local var_201_5 = var_201_3.defaultOptionValue(arg_201_0, arg_201_1)

			Dvar.IICIFEEDC(var_201_2.dvar, var_201_4)
			Dvar.IICIFEEDC(var_201_3.dvar, var_201_5)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_201_1)
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
		action = function(arg_206_0, arg_206_1, arg_206_2)
			Engine.DFJDIFJEGA("autoSprintGamepad", arg_206_2 - 1, arg_206_1)
		end,
		defaultOptionValue = function(arg_207_0, arg_207_1)
			return 1
		end,
		value = function(arg_208_0)
			return Engine.BECCFCBIAA("autoSprintGamepad", arg_208_0) + 1
		end
	},
	AutoSprintKBM = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("OLMPNPQOML")
		end,
		action = function(arg_210_0, arg_210_1, arg_210_2)
			Engine.DFJDIFJEGA("autoSprintKBM", arg_210_2 - 1, arg_210_1)
		end,
		defaultOptionValue = function(arg_211_0, arg_211_1)
			return 1
		end,
		value = function(arg_212_0)
			return Engine.BECCFCBIAA("autoSprintKBM", arg_212_0) + 1
		end
	},
	Bandwidth = {
		name = function()
			local var_213_0 = NetworkInfo.HGEFAEJCE()

			return Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH", var_213_0)
		end
	},
	BreathSprintAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
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
		value = function(arg_215_0)
			local var_215_0 = (Dvar.BJJCJHDBII("NMRKMSMTOO") - SliderBounds.Brightness.DvarMin) / (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) * 100

			return (LUI.clamp(var_215_0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max))
		end,
		defaultOptionValue = function(arg_216_0)
			local var_216_0 = (Dvar.DBGFIDHBFC("NMRKMSMTOO") - SliderBounds.Brightness.DvarMin) / (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) * 100

			return (LUI.clamp(var_216_0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max))
		end,
		action = function(arg_217_0, arg_217_1, arg_217_2)
			local var_217_0 = LUI.clamp(arg_217_2, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max) / 100 * (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) + SliderBounds.Brightness.DvarMin

			Dvar.IICIFEEDC("NMRKMSMTOO", var_217_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_217_1)

			if arg_217_0:GetCurrentMenu() then
				arg_217_0:dispatchEventToCurrentMenu({
					name = "brightness_updated"
				})
			end
		end,
		specificAction = function(arg_218_0, arg_218_1, arg_218_2)
			local var_218_0 = arg_218_1.SetActive

			function arg_218_1.SetActive(arg_219_0, arg_219_1)
				local var_219_0 = var_218_0(arg_219_0, arg_219_1)

				arg_218_0:processEvent({
					name = "brightness_over"
				})

				if arg_218_0:GetCurrentMenu() then
					arg_218_0:dispatchEventToCurrentMenu({
						name = "brightness_over",
						controller = arg_218_2,
						index = value
					})
				end

				return var_219_0
			end

			local var_218_1 = arg_218_1.RemoveActive

			function arg_218_1.RemoveActive(arg_220_0, arg_220_1)
				local var_220_0 = var_218_1(arg_220_0, arg_220_1)

				arg_218_0:processEvent({
					name = "brightness_up"
				})

				if arg_218_0:GetCurrentMenu() then
					arg_218_0:dispatchEventToCurrentMenu({
						name = "brightness_up",
						controller = arg_218_2,
						index = value
					})
				end

				return var_220_0
			end

			arg_218_1:addEventHandler("button_up", function(arg_221_0, arg_221_1)
				if arg_221_0.isBootOptions then
					arg_218_0:processEvent({
						name = "brightness_up"
					})

					if arg_218_0:GetCurrentMenu() then
						arg_218_0:dispatchEventToCurrentMenu({
							name = "brightness_up",
							controller = arg_218_2,
							index = value
						})
					end
				end
			end)
			arg_218_1:addEventHandler("optimal_video_update", function(arg_222_0, arg_222_1)
				local var_222_0 = LUI.clamp(Dvar.BJJCJHDBII("NMRKMSMTOO"), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max)

				arg_218_1:SetCurrentValue(var_222_0)
			end)
		end,
		customPreviewButtonAction = function(arg_223_0, arg_223_1)
			LUI.FlowManager.RequestAddMenu("BootBrightness", true, arg_223_1, false)
		end,
		buildCondition = function(arg_224_0)
			return not Engine.DJDAJEJDE() and Engine.BFDACIJIAD(arg_224_0)
		end
	},
	SDRColorSpace = {
		labels = function()
			return {
				Engine.JCBDICCAH("2.2 (sRGB)"),
				Engine.JCBDICCAH("2.4 (BT1886)")
			}
		end,
		action = function(arg_226_0, arg_226_1, arg_226_2)
			local var_226_0 = Dvar.DCEBHAJGCJ("NRQNOQMOPS")

			arg_226_2 = var_0_9(var_226_0, arg_226_2)

			Dvar.DAACJFEEDC("NRQNOQMOPS", arg_226_2)
		end,
		value = function(arg_227_0)
			local var_227_0 = Dvar.DCEBHAJGCJ("NRQNOQMOPS")
			local var_227_1 = Dvar.DHEEJCCJBH("NRQNOQMOPS")

			return var_0_0(var_227_0, var_227_1)
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("OKMKNSQTTO") + 1
		end
	},
	CinematicsVolume = {
		action = function(arg_229_0, arg_229_1, arg_229_2)
			Dvar.IICIFEEDC("LKNOKRSKL", arg_229_2 / 100)
		end,
		value = function(arg_230_0, arg_230_1)
			return Dvar.BJJCJHDBII("LKNOKRSKL") * 100
		end,
		defaultOptionValue = function(arg_231_0)
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
		action = function(arg_234_0, arg_234_1, arg_234_2, arg_234_3)
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountOptionsPopup", true, arg_234_1, false, {}, nil, true, true)
		end,
		buildCondition = function(arg_235_0)
			local var_235_0 = false

			if Engine.DDJFBBJAIG() then
				var_235_0 = IsOnlineMatch() and CODACCOUNT.IsEnabled() and not Engine.DBAEJAHFGJ(arg_235_0)
			end

			return var_235_0
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
			local var_238_0 = not Dvar.IBEGCHEFE("NKPLOQLPLT") and Dvar.DHEEJCCJBH("TSSRKROQM") ~= "Unsupported"
			local var_238_1 = Dvar.CFHDGABACF("MQOMSSQRRQ") == 4

			if not var_238_0 then
				if var_238_1 then
					Dvar.DFIJDJFIFD("MQOMSSQRRQ", Dvar.CFHDGABACF("MLNLRLRPQL"))
				end

				return false
			end

			return true
		end,
		action = function(arg_239_0, arg_239_1, arg_239_2)
			if arg_239_2 == OPTIONS.disableButtonOptions.DISABLED then
				local var_239_0 = Dvar.CFHDGABACF("MLNLRLRPQL")

				Dvar.DFIJDJFIFD("MQOMSSQRRQ", var_239_0)
			elseif arg_239_2 >= OPTIONS.disableButtonOptions.ENABLED then
				local var_239_1 = var_0_20(arg_239_2)

				Dvar.DFIJDJFIFD("MQOMSSQRRQ", 4)
				Dvar.DFIJDJFIFD("OLQMMMTLMO", var_239_1)
			end
		end,
		value = function(arg_240_0)
			local var_240_0 = Dvar.DHEEJCCJBH("TSSRKROQM") == "Supported"
			local var_240_1 = Dvar.CFHDGABACF("MQOMSSQRRQ") == 4
			local var_240_2 = Dvar.CFHDGABACF("OLQMMMTLMO")

			if not var_240_0 then
				Dvar.DFIJDJFIFD("MQOMSSQRRQ", Dvar.CFHDGABACF("MLNLRLRPQL"))

				return OPTIONS.disableButtonOptions.DISABLED
			elseif var_240_1 then
				return (var_0_21(var_240_2))
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
		isDependencyDisabled = function(arg_243_0, arg_243_1, arg_243_2, arg_243_3)
			if arg_243_3 == "AntiAliasing" or arg_243_3 == "DynamicResolution" or arg_243_3 == "DynamicResolutionFramerateTarget" then
				if arg_243_2 ~= OPTIONS.disableButtonOptions.DISABLED then
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
		action = function(arg_244_0, arg_244_1)
			Dvar.DHEGHJJJHI("MNKONSOLT", not Dvar.IBEGCHEFE("MNKONSOLT"))
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_244_1)
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
			local var_250_0 = "LUA_MENU_PC/COPY_KEYS_MP"

			if Engine.CAADCDEEIA() then
				var_250_0 = "LUA_MENU_PC/COPY_KEYS_SP"
			end

			return Engine.CBBHFCGDIC(var_250_0)
		end,
		description = function()
			local var_251_0 = "LUA_MENU_PC/COPY_KEYS_MP_DESC"

			if Engine.CAADCDEEIA() then
				var_251_0 = "LUA_MENU_PC/COPY_KEYS_SP_DESC"
			end

			return Engine.CBBHFCGDIC(var_251_0)
		end,
		action = function(arg_252_0, arg_252_1)
			LUI.FlowManager.RequestPopupMenu(nil, "CopyKeysFromOtherMode", true, arg_252_1)
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
		action = function(arg_254_0, arg_254_1, arg_254_2)
			if Engine.CGABICJHAI() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_254_1, false)
			else
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_254_1, false)
			end
		end,
		buildCondition = function(arg_255_0)
			if Engine.CHDGBEFDHB() then
				return false
			else
				return Engine.DDJFBBJAIG() and Dvar.IBEGCHEFE("PPMTTRNQM") and not CONDITIONS.IsLaunchChunk()
			end
		end
	},
	GeneralSubCategoryCredits = {
		buildCondition = function()
			return Engine.DDJFBBJAIG()
		end
	},
	Credits = {
		action = function(arg_257_0, arg_257_1, arg_257_2)
			LUI.FlowManager.RequestAddMenu("CreditsMenu", true, arg_257_1, false, {
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
			return not Engine.CHDGBEFDHB() and not Engine.EAABDHIDFJ()
		end
	},
	DisplayAnonymousGamertags = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NLMOTKKLKK")
		end
	},
	DisplayAnonymousGamertagToOthers = {
		buildCondition = function(arg_263_0)
			Engine.DHFGJHAADD(arg_263_0, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_STREAMER_MODE)

			if Dvar.IBEGCHEFE("NQPQRKLNNT") then
				Engine.CEJJDJJHIJ(arg_263_0, "dlog_event_anonymization_state", {
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
			local var_264_0 = {}

			if Engine.BAADCHEJJD() then
				var_264_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/MODE_WINDOWED"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_BORDERLESS"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_EXTENDED_WINDOW")
				}
			else
				var_264_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/MODE_WINDOWED"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_BORDERLESS"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_EXTENDED_WINDOW")
				}
			end

			return var_264_0
		end,
		action = function(arg_265_0, arg_265_1, arg_265_2)
			local var_265_0 = arg_265_2 - 1

			if not Engine.BAADCHEJJD() and arg_265_2 > 1 then
				var_265_0 = arg_265_2
			end

			Dvar.DFIJDJFIFD("NNSQSMTQPP", var_265_0)
		end,
		value = function(arg_266_0)
			local var_266_0 = Dvar.CFHDGABACF("NNSQSMTQPP") + 1

			if not Engine.BAADCHEJJD() and var_266_0 > 1 then
				var_266_0 = var_266_0 - 1
			end

			return var_266_0
		end,
		specificAction = function(arg_267_0, arg_267_1, arg_267_2)
			arg_267_1:addEventHandler("onVideoChange", function(arg_268_0, arg_268_1)
				arg_268_0:processEvent({
					name = "seek_value"
				})
			end)
		end,
		description = Engine.BEFACAIFDD() and Engine.CBBHFCGDIC("MENU/DISPLAY_MODE_DESC_ALT") or Engine.CBBHFCGDIC("MENU/DISPLAY_MODE_DESC"),
		isDependencyDisabled = function(arg_269_0, arg_269_1, arg_269_2, arg_269_3)
			if arg_269_3 == "RefreshRate" or arg_269_3 == "ImageQuality" then
				return arg_269_2 ~= 2
			elseif arg_269_3 == "Monitor" then
				return arg_269_2 ~= 2 and arg_269_2 ~= 3
			end
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("NNSQSMTQPP") + 1
		end
	},
	SSR = {
		action = function(arg_271_0, arg_271_1, arg_271_2)
			local var_271_0 = Dvar.DCEBHAJGCJ("NNTTTQSRN")

			arg_271_2 = var_0_9(var_271_0, arg_271_2)

			Dvar.BDEHAEGHAF("NNTTTQSRN", arg_271_2)
		end,
		value = function(arg_272_0)
			local var_272_0 = Dvar.DCEBHAJGCJ("NNTTTQSRN")
			local var_272_1 = Dvar.DHEEJCCJBH("NNTTTQSRN")

			return var_0_0(var_272_0, var_272_1)
		end
	},
	DXR = {
		labels = function()
			local var_273_0 = {}

			if Dvar.IBEGCHEFE("LKLOMSPQSR") then
				var_273_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
					Engine.CBBHFCGDIC("LUA_MENU/ENABLED"),
					Engine.CBBHFCGDIC("MENU/QUALITY_ULTRA")
				}
			else
				var_273_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
					Engine.CBBHFCGDIC("LUA_MENU/ENABLED")
				}
			end

			return var_273_0
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
		isDependencyDisabled = function(arg_275_0, arg_275_1, arg_275_2, arg_275_3)
			if arg_275_3 == "AntiAliasing" then
				return arg_275_2 ~= OPTIONS.disableButtonOptions.DISABLED
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
		action = function(arg_278_0, arg_278_1, arg_278_2)
			Dvar.IICIFEEDC("MPTTMMKST", arg_278_2 / 100)
		end,
		value = function(arg_279_0, arg_279_1)
			return Dvar.BJJCJHDBII("MPTTMMKST") * 100
		end,
		defaultOptionValue = function(arg_280_0)
			return Dvar.DBGFIDHBFC("MPTTMMKST") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	EnglishVoiceOvers = {
		action = function(arg_281_0, arg_281_1, arg_281_2)
			if arg_281_2 > 1 then
				Engine.CDFHJHDEFC(true)
			else
				Engine.CDFHJHDEFC(false)
			end
		end,
		value = function(arg_282_0, arg_282_1)
			return Engine.EEHHCFBGC() and 2 or 1
		end,
		buildCondition = function()
			return Engine.CCGEHCIECB()
		end,
		defaultOptionValue = function(arg_284_0, arg_284_1)
			return Engine.EEHHCFBGC() and 2 or 1
		end,
		disabled = function()
			return not Engine.CCGEHCIECB()
		end
	},
	EquipmentBehavior = {
		action = function(arg_286_0, arg_286_1, arg_286_2)
			Engine.DAGFFDGFII("profile_toggleHoldGrenade")
		end,
		defaultOptionValue = function(arg_287_0)
			return 1
		end,
		value = function(arg_288_0)
			return Engine.BECCFCBIAA("grenadeHold", arg_288_0) and 1 or 2
		end
	},
	EquipmentBehaviorKBM = {
		action = function(arg_289_0, arg_289_1, arg_289_2)
			Engine.DAGFFDGFII("profile_toggleHoldGrenadeKBM")
		end,
		defaultOptionValue = function(arg_290_0)
			return 1
		end,
		value = function(arg_291_0)
			return Engine.BECCFCBIAA("grenadeHoldKBM", arg_291_0) == 1 and 1 or 2
		end
	},
	FilmGrainAttenPC = {
		action = function(arg_292_0, arg_292_1, arg_292_2)
			local var_292_0 = LUI.clamp(arg_292_2, 0, 1)

			Engine.DFJDIFJEGA("filmGrainAttenuation", var_292_0, arg_292_1)
			Dvar.IICIFEEDC("LKOLMLQRRT", var_292_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_292_1)
		end
	},
	FilmGrainAttenConsole = {
		action = function(arg_293_0, arg_293_1, arg_293_2)
			local var_293_0 = LUI.clamp(arg_293_2, 0, 1)

			Engine.DFJDIFJEGA("filmGrainAttenuation", var_293_0, arg_293_1)
			Dvar.IICIFEEDC("LKOLMLQRRT", var_293_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_293_1)
		end,
		buildCondition = var_0_3
	},
	Filter = {
		action = function(arg_294_0, arg_294_1, arg_294_2)
			Engine.DFJDIFJEGA("mouseFilter", arg_294_2 / 10, arg_294_1)
		end,
		value = function(arg_295_0)
			return Engine.BECCFCBIAA("mouseFilter", arg_295_0) * 10
		end
	},
	FilterOld = {
		action = function(arg_296_0, arg_296_1, arg_296_2)
			Engine.DFJDIFJEGA("mouseSmoothing", arg_296_2, arg_296_1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_296_1)
		end
	},
	FirstParty = {
		name = function()
			local var_297_0 = OPTIONS.FirstPartyServersLabel()

			if NetworkInfo.DDADIHAFHH() then
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED", var_297_0)
			else
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED", var_297_0)
			end
		end,
		description = function()
			local var_298_0 = OPTIONS.FirstPartyServersLabel()

			if NetworkInfo.DDADIHAFHH() then
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED_DESC", var_298_0)
			else
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED_DESC", var_298_0)
			end
		end
	},
	FlyingVehicleAscend = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_ASCEND_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_ASCEND_DESC")
			end
		end
	},
	FlyingVehicleBackward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_BACKWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_BACKWARD_DESC")
			end
		end
	},
	FlyingVehicleDescend = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_DESCEND_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_DESCEND_DESC")
			end
		end
	},
	FlyingVehicleFlares = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_FLARES_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_FLARES_DESC")
			end
		end
	},
	FlyingVehicleForward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_FORWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_MOVE_FORWARD_DESC")
			end
		end
	},
	FlyingVehicleLeft = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_LEFT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_LEFT_DESC")
			end
		end
	},
	FlyingVehicleRight = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_RIGHT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_TURN_RIGHT_DESC")
			end
		end
	},
	FlyingVehicleHornAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/FL_VEH_HORN_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/FL_VEH_HORN_DESC")
			end
		end
	},
	FlyingVehicleWarTrackToggle = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
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
		action = function(arg_309_0, arg_309_1, arg_309_2)
			Engine.DFJDIFJEGA("gpadUseReloadProfile", arg_309_2 - 1, arg_309_1)
		end,
		defaultOptionValue = function(arg_310_0, arg_310_1)
			return 1
		end,
		value = function(arg_311_0)
			return Engine.BECCFCBIAA("gpadUseReloadProfile", arg_311_0) + 1
		end
	},
	GestureAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/CUSTOMIZE_GESTURE_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/CUSTOMIZE_GESTURE_DESC")
			end
		end
	},
	InputMethod = {
		disabled = function(arg_313_0)
			local var_313_0 = false

			if not OPTIONS.DualInputConnected(arg_313_0) or not OPTIONS.IsInputSwapEnabled() or IsMlgGameBattlesInputLock() or Tournament.BEAIBEGFFB() then
				var_313_0 = true
			end

			return var_313_0
		end,
		value = function(arg_314_0)
			return Engine.BECCFCBIAA("gpadEnabled", arg_314_0) and 1 or 2
		end,
		action = function(arg_315_0, arg_315_1, arg_315_2)
			Engine.CIGGHDDHGJ(arg_315_1, not arg_315_2)
			Engine.DAGFFDGFII("updategamerprofile")
		end,
		getSpecificImage = function(arg_316_0, arg_316_1)
			local var_316_0 = ""
			local var_316_1 = Engine.GGFCHCDDE(arg_316_1)
			local var_316_2 = Engine.FIIDEFBHJ(arg_316_1)

			if not Engine.HDGDBCJFG() then
				if var_316_1 or var_316_2 then
					var_316_0 = "_ps4"
				end
			elseif Engine.BIAEDEEBJI(arg_316_1) then
				var_316_0 = "_vita"
			elseif var_316_1 then
				var_316_0 = "_ps4"
			end

			if arg_316_0:find("_ps4") then
				arg_316_0 = arg_316_0:sub(1, -5)
			elseif arg_316_0:find("_vita") then
				arg_316_0 = arg_316_0:sub(1, -6)
			end

			if var_316_0 == "_ps4" or var_316_0 == "_vita" then
				return arg_316_0 .. var_316_0
			else
				return arg_316_0
			end
		end,
		specificAction = function(arg_317_0, arg_317_1, arg_317_2)
			local function var_317_0()
				arg_317_1:SetButtonDisabled(not OPTIONS.DualInputConnected(arg_317_2) or not OPTIONS.IsInputSwapEnabled())
			end

			arg_317_1:addEventHandler("input_method_changed", var_317_0)
			arg_317_1:addEventHandler("input_connection", var_317_0)
		end
	},
	GraphicContent = {
		disabled = var_0_4,
		value = function(arg_319_0)
			return 1
		end
	},
	ImageQuality = {
		labels = function()
			return Engine.DJDAJBFCEE()
		end,
		action = function(arg_321_0, arg_321_1, arg_321_2)
			Dvar.BDEHAEGHAF("LTPQTTPSOR", arg_321_0.displayResolutions and arg_321_0.displayResolutions[arg_321_2] or Engine.DJDAJBFCEE()[arg_321_2])
		end,
		value = function(arg_322_0)
			local var_322_0 = Engine.DJDAJBFCEE()

			return var_0_10("LTPQTTPSOR", var_322_0)
		end,
		onDependencyParentRefresh = function(arg_323_0, arg_323_1, arg_323_2, arg_323_3, arg_323_4)
			if arg_323_3 == "Monitor" then
				local var_323_0 = arg_323_0.displayResolutions and arg_323_0.displayResolutions[arg_323_2] or Engine.DJDAJBFCEE()[arg_323_2]

				arg_323_0.displayResolutions = Engine.DJDAJBFCEE(arg_323_4 - 1)

				arg_323_0:UpdateLabels(arg_323_0.displayResolutions)

				if arg_323_2 == 1 then
					return 1
				else
					return var_0_0(arg_323_0.displayResolutions, var_323_0) or 1
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
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_BACKWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_BACKWARD_DESC")
			end
		end
	},
	GroundVehicleForward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_FORWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_MOVE_FORWARD_DESC")
			end
		end
	},
	GroundVehicleHandbrake = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_HANDBRAKE_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_HANDBRAKE_DESC")
			end
		end
	},
	GroundVehicleHornAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
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
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_WARTRACK_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_WARTRACK_DESC")
			end
		end,
		buildCondition = function()
			return Dvar.IBEGCHEFE("NKORSMKORK")
		end
	},
	GroundVehicleLeanBackward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_BACKWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_BACKWARD_DESC")
			end
		end
	},
	GroundVehicleLeanForward = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_FORWARD_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_LEAN_FORWARD_DESC")
			end
		end
	},
	GroundVehicleLeft = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_LEFT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_LEFT_DESC")
			end
		end
	},
	GroundVehicleRight = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_RIGHT_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/GR_VEH_TURN_RIGHT_DESC")
			end
		end
	},
	KBMSubCategoryAirplaneKeybinds = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleForward = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleBackward = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleLeft = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleRight = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleFire = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleAim = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleAirBrake = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleFreeLook = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehicleAdvanceContrl = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehiclePitchUp = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	AirplaneVehiclePitchDown = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	HitMarkerPresets = {
		action = function(arg_347_0, arg_347_1, arg_347_2)
			local var_347_0 = OPTIONS.hitMarkerSoundAliases[arg_347_2]

			Engine.CFBBHFFBH(arg_347_1, var_347_0)
		end,
		customPreviewButtonAction = function(arg_348_0, arg_348_1)
			LUI.FlowManager.RequestAddMenu("HitMarkerPreview", true, arg_348_1)
		end,
		value = function(arg_349_0)
			local var_349_0 = Engine.BECCFCBIAA("sndHitMarkerAlias", arg_349_0)

			return (var_0_0(OPTIONS.hitMarkerSoundAliases, var_349_0))
		end,
		defaultOptionValue = function(arg_350_0)
			return 3
		end
	},
	HitMarkersSoundEffect = {
		disabled = var_0_4
	},
	MonoAudio = {
		action = function(arg_351_0, arg_351_1, arg_351_2)
			Dvar.DHEGHJJJHI("LSTMNLPNOP", arg_351_2 == OPTIONS.disableButtonOptions.ENABLED)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_351_1)
		end,
		value = function(arg_352_0)
			return Dvar.IBEGCHEFE("LSTMNLPNOP") and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end,
		defaultOptionValue = function(arg_353_0)
			return OPTIONS.disableButtonOptions.DISABLED
		end
	},
	MonoBleed = {
		action = function(arg_354_0, arg_354_1, arg_354_2)
			Dvar.IICIFEEDC("LNTSRPMPRQ", arg_354_2 / 100)
		end,
		value = function(arg_355_0, arg_355_1)
			return Dvar.BJJCJHDBII("LNTSRPMPRQ") * 100
		end,
		defaultOptionValue = function(arg_356_0)
			return Dvar.DBGFIDHBFC("LNTSRPMPRQ") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	HitMarkersVisuals = {
		disabled = var_0_4
	},
	HudBoundsH = {
		action = function(arg_357_0, arg_357_1, arg_357_2)
			Dvar.IICIFEEDC("SPLRMSQLK", arg_357_2 / 100)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_357_1)
		end,
		value = function(arg_358_0)
			return Dvar.BJJCJHDBII("SPLRMSQLK") * 100
		end,
		defaultOptionValue = function(arg_359_0)
			local var_359_0 = Dvar.DBGFIDHBFC("SPLRMSQLK")
			local var_359_1 = 2.3333333333333335
			local var_359_2 = 1.5999999999999999

			if CoD.AspectRatioCompare(var_359_1) == LUI.COMPARE.higher then
				local var_359_3 = Engine.CEGEEHGGBA()
				local var_359_4 = var_359_3 - var_359_2

				if var_359_4 > 0 then
					var_359_0 = 1 - (var_359_3 - var_359_1) / var_359_4
				end
			end

			return var_359_0 * 100
		end
	},
	HudBoundsV = {
		action = function(arg_360_0, arg_360_1, arg_360_2)
			Dvar.IICIFEEDC("MLMOSSMNOO", arg_360_2 / 100)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_360_1)
		end,
		value = function(arg_361_0)
			return Dvar.BJJCJHDBII("MLMOSSMNOO") * 100
		end,
		defaultOptionValue = function(arg_362_0)
			return Dvar.DBGFIDHBFC("MLMOSSMNOO") * 100
		end
	},
	InventoryKeybindsExpander = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	InvertPitchGamepad = {
		action = function(arg_364_0, arg_364_1, arg_364_2)
			if arg_364_2 == 5 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 1, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 1, arg_364_1)
			elseif arg_364_2 == 4 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 1, arg_364_1)
			elseif arg_364_2 == 3 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 0, arg_364_1)
			elseif arg_364_2 == 2 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 0, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 1, arg_364_1)
			else
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 0, arg_364_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneGamepad", 0, arg_364_1)
			end
		end,
		value = function(arg_365_0)
			local var_365_0 = Engine.BECCFCBIAA("invertPitchGamepad", arg_365_0)
			local var_365_1 = Engine.BECCFCBIAA("invertPitchFlyingGamepad", arg_365_0)
			local var_365_2 = Engine.BECCFCBIAA("invertPitchAirplaneGamepad", arg_365_0)

			if var_365_0 then
				return 5
			elseif var_365_2 and var_365_1 then
				return 4
			elseif var_365_1 then
				return 3
			elseif var_365_2 then
				return 2
			else
				return 1
			end
		end
	},
	InvertPitchFlyingKBM = {
		action = function(arg_366_0, arg_366_1, arg_366_2)
			if arg_366_2 == 4 then
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 1, arg_366_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 1, arg_366_1)
			elseif arg_366_2 == 3 then
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 1, arg_366_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 0, arg_366_1)
			elseif arg_366_2 == 2 then
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 0, arg_366_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 1, arg_366_1)
			else
				Engine.DFJDIFJEGA("invertPitchFlyingKBM", 0, arg_366_1)
				Engine.DFJDIFJEGA("invertPitchAirplaneKBM", 0, arg_366_1)
			end
		end,
		value = function(arg_367_0)
			local var_367_0 = Engine.BECCFCBIAA("invertPitchFlyingKBM", arg_367_0)
			local var_367_1 = Engine.BECCFCBIAA("invertPitchAirplaneKBM", arg_367_0)

			if var_367_1 and var_367_0 then
				return 4
			elseif var_367_0 then
				return 3
			elseif var_367_1 then
				return 2
			else
				return 1
			end
		end
	},
	InvertPitchKBM = {
		action = function(arg_368_0, arg_368_1, arg_368_2)
			Engine.DAGFFDGFII("profile_invertPitchKBM " .. tostring(arg_368_2 - 1), arg_368_1)
		end,
		value = function(arg_369_0)
			return Engine.BECFECEHDB(arg_369_0) + 1
		end
	},
	JuggernautDefaultMusic = {
		action = function(arg_370_0, arg_370_1, arg_370_2)
			Engine.DFJDIFJEGA("juggMusicEnableDefault", arg_370_2 - 1, arg_370_1)
		end,
		defaultOptionValue = function(arg_371_0, arg_371_1)
			return 2
		end,
		value = function(arg_372_0)
			if Engine.BECCFCBIAA("juggMusicEnableDefault", arg_372_0) then
				return 2
			else
				return 1
			end
		end
	},
	LanguageSelect = {
		labels = OPTIONS.GetLanguageLabels,
		defaultOptionValue = function(arg_373_0)
			local var_373_0 = OPTIONS.GetLanguageIndices()
			local var_373_1 = Engine.DGAIDIEIAC()

			for iter_373_0 = 1, #var_373_0 do
				if var_373_0[iter_373_0] == var_373_1 then
					return iter_373_0
				end
			end
		end,
		value = function(arg_374_0)
			local var_374_0 = OPTIONS.GetLanguageIndices()
			local var_374_1 = Engine.DGAIDIEIAC()

			for iter_374_0 = 1, #var_374_0 do
				if var_374_0[iter_374_0] == var_374_1 then
					return iter_374_0
				end
			end
		end,
		action = function(arg_375_0, arg_375_1, arg_375_2)
			local function var_375_0(arg_376_0)
				local var_376_0 = {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC("LANGUAGE_SELECT/CONFIRM_CHANGE"),
					yesAction = function(arg_377_0, arg_377_1)
						Engine.CEHDAACIJA(arg_377_1, arg_376_0)
						Engine.DAGFFDGFII("updategamerprofile")
						DCache.EAEHIJBBCD(arg_376_0)
						Engine.BHIJFFCAEB("")
					end,
					noAction = function()
						arg_375_0:processEvent({
							name = "seek_value",
							controllerIndex = arg_375_1
						})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_375_1, false, var_376_0)
			end

			local var_375_1 = GetLanguageCode(GetCurrentLanguage())
			local var_375_2 = OPTIONS.GetLanguageIndices()[arg_375_2]

			if var_375_1 ~= var_375_2 then
				var_375_0(var_375_2)
			end
		end
	},
	LODRamp = {
		value = function(arg_379_0)
			return 3 - Dvar.CFHDGABACF("LPNQOKLRQR")
		end,
		action = function(arg_380_0, arg_380_1, arg_380_2)
			local var_380_0 = #arg_380_0.labels

			Dvar.DFIJDJFIFD("LPNQOKLRQR", var_380_0 - arg_380_2)
		end
	},
	LookHorzSens = {
		labels = OPTIONS.GetSensitivityLabels(),
		action = function(arg_381_0, arg_381_1, arg_381_2)
			Engine.CBGBBHHIJE(arg_381_1, arg_381_2 - 1)
		end,
		value = function(arg_382_0)
			return Engine.DIDFDDCCDE(arg_382_0) + 1
		end,
		defaultOptionValue = function(arg_383_0)
			return Engine.BHFJEBACDF() + 1
		end,
		disabled = var_0_2
	},
	LookVertSens = {
		labels = OPTIONS.GetSensitivityLabels(),
		action = function(arg_384_0, arg_384_1, arg_384_2)
			Engine.HGJFFDFCE(arg_384_1, arg_384_2 - 1)
		end,
		value = function(arg_385_0)
			return Engine.IFJCDCCAI(arg_385_0) + 1
		end,
		defaultOptionValue = function(arg_386_0)
			return Engine.BHFJEBACDF() + 1
		end,
		disabled = var_0_2
	},
	StickLayoutBootOptions = {
		type = "Dropdown",
		name = Engine.CBBHFCGDIC("PLATFORM/THUMBSTICK_LAYOUT"),
		description = Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"),
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_387_0, arg_387_1, arg_387_2)
			if arg_387_0:GetCurrentMenu() then
				arg_387_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_387_1,
					index = arg_387_2
				})
			end
		end,
		onRefresh = function(arg_388_0, arg_388_1, arg_388_2)
			if arg_388_0:GetCurrentMenu() then
				arg_388_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_388_1,
					index = arg_388_2
				})
			end
		end,
		specialDefaultReset = function(arg_389_0, arg_389_1)
			arg_389_0:dispatchEventToCurrentMenu({
				index = 1,
				name = "stickLayout_updated",
				controller = arg_389_1
			})
		end,
		value = function(arg_390_0)
			local var_390_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_390_0)
			local var_390_1 = OPTIONS.stickLayoutStrings[var_390_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_390_1)))
		end,
		specificAction = function(arg_391_0, arg_391_1, arg_391_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_391_0, arg_391_1, {
				showLayout = true,
				name = "stickLayout"
			})
		end,
		defaultOptionValue = function(arg_392_0)
			return 1
		end
	},
	ButtonLayoutBootOptions = {
		type = "Dropdown",
		name = Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT"),
		description = Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"),
		labels = OPTIONS.GetCurrentButtonLayoutLabels,
		action = function(arg_393_0, arg_393_1, arg_393_2)
			if arg_393_0:GetCurrentMenu() then
				arg_393_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_393_1,
					index = arg_393_2
				})
			end
		end,
		onRefresh = function(arg_394_0, arg_394_1, arg_394_2)
			if arg_394_0:GetCurrentMenu() then
				arg_394_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_394_1,
					index = arg_394_2
				})
			end
		end,
		value = function(arg_395_0)
			local var_395_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_395_0)

			if string.match(var_395_0, "_alt$") then
				var_395_0 = string.gsub(var_395_0, "_alt", "")
			end

			local var_395_1 = OPTIONS.buttonLayoutStrings[var_395_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_395_1)))
		end,
		specificAction = function(arg_396_0, arg_396_1, arg_396_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_396_0, arg_396_1, {
				showLayout = true,
				name = "buttonLayout"
			})
		end,
		defaultOptionValue = function(arg_397_0)
			return 1
		end
	},
	VoiceChatChannel = {
		disabled = var_0_4
	},
	OpenMicRecordingSensitivity = {
		action = function(arg_398_0, arg_398_1, arg_398_2)
			Dvar.IICIFEEDC("MSKKKMTQNT", arg_398_2 * 655.36)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_398_1)
		end,
		value = function(arg_399_0)
			return Dvar.BJJCJHDBII("MSKKKMTQNT") / 655.36
		end,
		defaultOptionValue = function(arg_400_0)
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
		action = function(arg_401_0, arg_401_1, arg_401_2)
			Engine.BFIFFDCGAB(arg_401_1, arg_401_2 - 1)
		end,
		value = function(arg_402_0)
			return Engine.DDIFAGHHAB(arg_402_0) + 1
		end,
		defaultOptionValue = function(arg_403_0)
			return 1
		end,
		buildCondition = function(arg_404_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	MinimapRotation = {
		action = function(arg_405_0, arg_405_1, arg_405_2)
			local var_405_0 = arg_405_2 == 2

			Engine.CECAAEJABF(arg_405_1, var_405_0)
		end,
		value = function(arg_406_0)
			return Engine.BIEGEGDIGH(arg_406_0) and 2 or 1
		end,
		defaultOptionValue = function(arg_407_0)
			return 2
		end,
		buildCondition = function(arg_408_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	CompassCardinalDirectionText = {
		action = function(arg_409_0, arg_409_1, arg_409_2)
			local var_409_0 = arg_409_2 == 2

			Engine.DFDGCIDHJH(arg_409_1, var_409_0)
		end,
		value = function(arg_410_0)
			return Engine.BFDEDEGDFD(arg_410_0) and 2 or 1
		end,
		defaultOptionValue = function(arg_411_0)
			return 1
		end
	},
	ObituaryTimeOnScreen = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_412_0, arg_412_1, arg_412_2)
			if arg_412_2 <= 1 then
				Engine.CFJACGBBII(arg_412_1, ObituaryTimeOnScreen.OFF)
			else
				Engine.CFJACGBBII(arg_412_1, LUI.clamp(arg_412_2 - 2, ObituaryTimeOnScreen.DEFAULT, ObituaryTimeOnScreen.EXTENDED))
			end
		end,
		value = function(arg_413_0)
			if Engine.CDHBFIFCEA(arg_413_0) == ObituaryTimeOnScreen.OFF then
				return 1
			else
				return LUI.clamp(Engine.CDHBFIFCEA(arg_413_0), ObituaryTimeOnScreen.DEFAULT, ObituaryTimeOnScreen.EXTENDED) + 2
			end
		end,
		defaultOptionValue = function(arg_414_0)
			return ObituaryTimeOnScreen.DEFAULT + 2
		end
	},
	NewMessageSoundAlert = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_415_0, arg_415_1, arg_415_2)
			Engine.BAGGCHDDCD(arg_415_1, LUI.clamp(arg_415_2 - 1, NewMessageSoundAlertType.DISABLED, NewMessageSoundAlertType.BOTH))
		end,
		value = function(arg_416_0)
			return LUI.clamp(Engine.CCBGEJDJJ(arg_416_0), NewMessageSoundAlertType.DISABLED, NewMessageSoundAlertType.BOTH) + 1
		end,
		defaultOptionValue = function(arg_417_0)
			return 1
		end
	},
	SoundAlert = {
		action = function(arg_418_0, arg_418_1, arg_418_2)
			Engine.DIHECGBHBG(arg_418_1, arg_418_2 - 1)
		end,
		value = function(arg_419_0)
			return Engine.BCFDGFIAII(arg_419_0) + 1
		end,
		defaultOptionValue = function(arg_420_0)
			return 1
		end
	},
	TextChatBehavior = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_421_0, arg_421_1, arg_421_2)
			Engine.DCBAIHDCFC(arg_421_1, LUI.clamp(arg_421_2 - 1, TextChatBehavior.OFF, TextChatBehavior.CUSTOM))
		end,
		value = function(arg_422_0)
			return LUI.clamp(Engine.HHFCGDBEE(arg_422_0), TextChatBehavior.OFF, TextChatBehavior.CUSTOM) + 1
		end,
		defaultOptionValue = function(arg_423_0)
			return 1
		end,
		isDependencyDisabled = function(arg_424_0, arg_424_1, arg_424_2, arg_424_3)
			return arg_424_2 ~= TextChatBehavior.CUSTOM + 1
		end
	},
	PlayerMessagesBehavior = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_425_0, arg_425_1, arg_425_2)
			Engine.BIGJHBAJEE(arg_425_1, LUI.clamp(arg_425_2 - 1, TextChatBehavior.OFF, TextChatBehavior.EXTENDED))
		end,
		value = function(arg_426_0)
			return LUI.clamp(Engine.DEHEEEBGAE(arg_426_0), TextChatBehavior.OFF, TextChatBehavior.EXTENDED) + 1
		end,
		defaultOptionValue = function(arg_427_0)
			return 1
		end
	},
	SystemMessagesBehavior = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_428_0, arg_428_1, arg_428_2)
			Engine.CGDFDDCIFC(arg_428_1, LUI.clamp(arg_428_2 - 1, TextChatBehavior.OFF, TextChatBehavior.EXTENDED))
		end,
		value = function(arg_429_0)
			return LUI.clamp(Engine.BGFCDIHDBC(arg_429_0), TextChatBehavior.OFF, TextChatBehavior.EXTENDED) + 1
		end,
		defaultOptionValue = function(arg_430_0)
			return 1
		end
	},
	AlwaysOnScreen = {
		resetOverride = true,
		applyableOverride = false,
		applyable = false,
		action = function(arg_431_0, arg_431_1, arg_431_2)
			Engine.CCGFGJADDA(arg_431_1, LUI.clamp(arg_431_2 - 1, 0, 1))
		end,
		value = function(arg_432_0)
			return LUI.clamp(Engine.CJGIDICGIG(arg_432_0), 0, 1) + 1
		end,
		defaultOptionValue = function(arg_433_0)
			return 1
		end
	},
	SprintTacticalBehavior = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("MNQRTPNKQN")
		end,
		action = function(arg_435_0, arg_435_1, arg_435_2)
			Engine.BAEHCHBBCF(arg_435_1, LUI.clamp(arg_435_2 - 1, 0, 2))
		end,
		value = function(arg_436_0)
			return LUI.clamp(Engine.DGECFCHIDD(arg_436_0), 0, 2) + 1
		end,
		defaultOptionValue = function(arg_437_0)
			return 1
		end
	},
	VehiclesAutoMoveGamepad = {
		action = function(arg_438_0, arg_438_1, arg_438_2)
			Engine.DDHIEBBCI(arg_438_1, LUI.clamp(arg_438_2 - 1, 0, 1))
		end,
		value = function(arg_439_0)
			return LUI.clamp(Engine.DDDGAEFCHG(arg_439_0), 0, 1) + 1
		end,
		defaultOptionValue = function(arg_440_0)
			return 1
		end
	},
	MixPreset = {
		customPreviewButtonAction = function(arg_441_0, arg_441_1)
			LUI.FlowManager.RequestAddMenu("AudioMixPreset", true, arg_441_1)
		end,
		value = function()
			local var_442_0, var_442_1 = OPTIONS.GetCurrentAudioMixPreset()

			return var_442_1
		end,
		defaultOptionValue = function(arg_443_0)
			return 5
		end,
		action = function(arg_444_0, arg_444_1, arg_444_2)
			local var_444_0 = OPTIONS.GetMixPresets()

			Dvar.DFIJDJFIFD("PTKLRRLLQ", var_444_0[arg_444_2].value)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_444_1)
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
			local var_447_0 = Dvar.DHEEJCCJBH("MMMOQLSSOS")

			return var_0_0(Engine.BHEFDBJAAF(), var_447_0) or 1
		end,
		action = function(arg_448_0, arg_448_1, arg_448_2)
			local var_448_0 = Engine.BHEFDBJAAF()

			Dvar.BDEHAEGHAF("MMMOQLSSOS", var_448_0[arg_448_2])
		end
	},
	Prone = {
		action = function(arg_449_0, arg_449_1, arg_449_2)
			Engine.DFJDIFJEGA("proneType", arg_449_2, arg_449_1)
		end,
		defaultOptionValue = function(arg_450_0)
			return Engine.IEBBJFBE("proneType")
		end,
		value = function(arg_451_0)
			return Engine.BECCFCBIAA("proneType", arg_451_0)
		end
	},
	Crouch = {
		action = function(arg_452_0, arg_452_1, arg_452_2)
			Engine.DFJDIFJEGA("crouchType", arg_452_2, arg_452_1)
		end,
		defaultOptionValue = function(arg_453_0)
			return Engine.IEBBJFBE("crouchType")
		end,
		value = function(arg_454_0)
			return Engine.BECCFCBIAA("crouchType", arg_454_0)
		end,
		isDependencyDisabled = function(arg_455_0, arg_455_1, arg_455_2, arg_455_3)
			if arg_455_3 == "SlideEnabledKeyboard" then
				return arg_455_2 == 2
			end
		end
	},
	MountConfig = {
		action = function(arg_456_0, arg_456_1, arg_456_2)
			Engine.CIAGIFEAIC(arg_456_1, arg_456_0.engineValueMap[arg_456_2])
		end,
		defaultOptionValue = function(arg_457_0)
			local var_457_0 = Engine.IEBBJFBE("mountButtonConfig")

			return var_457_0 < 4 and var_457_0 or var_457_0 - 3
		end,
		value = function(arg_458_0)
			local var_458_0 = Engine.BECCFCBIAA("mountButtonConfig", arg_458_0)

			return var_458_0 < 4 and var_458_0 or var_458_0 - 3
		end,
		onDependencyParentRefresh = function(arg_459_0, arg_459_1, arg_459_2, arg_459_3, arg_459_4)
			if arg_459_3 == "ADSHoldGamepad" then
				local var_459_0 = OPTIONS.GetMountConfigLabels()
				local var_459_1 = OPTIONS.GetMountConfigValues()
				local var_459_2 = arg_459_0.engineValueMap and arg_459_0.engineValueMap[arg_459_2] or var_459_1[arg_459_2]

				arg_459_0.engineValueMap = var_459_1

				if arg_459_4 == 2 then
					table.remove(var_459_0, 2)
					table.remove(var_459_1, 2)
				end

				arg_459_0:UpdateLabels(var_459_0)

				local var_459_3 = var_0_0(arg_459_0.engineValueMap, var_459_2)

				if var_459_3 then
					return var_459_3
				else
					return var_0_0(arg_459_0.engineValueMap, Engine.IEBBJFBE("mountButtonConfig"))
				end
			end
		end,
		buildCondition = var_0_8
	},
	MountConfigKBM = {
		labels = OPTIONS.GetMountConfigKBMLabels(),
		action = function(arg_460_0, arg_460_1, arg_460_2)
			if arg_460_0.engineValueMap then
				Engine.IEGJEIHE(arg_460_1, arg_460_0.engineValueMap[arg_460_2])
			end
		end,
		defaultOptionValue = function(arg_461_0)
			local var_461_0 = OPTIONS.GetMountConfigKBMValues()
			local var_461_1 = Engine.IEBBJFBE("mountButtonConfigKBM")

			return var_0_0(var_461_0, var_461_1)
		end,
		value = function(arg_462_0)
			local var_462_0 = OPTIONS.GetMountConfigKBMValues()
			local var_462_1 = Engine.BECCFCBIAA("mountButtonConfigKBM", arg_462_0)

			return var_0_0(var_462_0, var_462_1)
		end,
		isDependencyDisabled = function(arg_463_0, arg_463_1, arg_463_2, arg_463_3)
			return arg_463_2 == 1
		end,
		onDependencyParentRefresh = function(arg_464_0, arg_464_1, arg_464_2, arg_464_3, arg_464_4)
			if arg_464_3 == "ADSHoldKeyboard" then
				local var_464_0 = OPTIONS.GetMountConfigKBMLabels()
				local var_464_1 = OPTIONS.GetMountConfigKBMValues()
				local var_464_2 = arg_464_0.engineValueMap and arg_464_0.engineValueMap[arg_464_2] or var_464_1[arg_464_2]

				arg_464_0.engineValueMap = var_464_1

				if arg_464_4 == 2 then
					table.remove(var_464_0, 2)
					table.remove(var_464_1, 2)
				end

				arg_464_0:UpdateLabels(var_464_0)

				local var_464_3 = var_0_0(arg_464_0.engineValueMap, var_464_2)

				if var_464_3 then
					return var_464_3
				else
					return var_0_0(arg_464_0.engineValueMap, Engine.IEBBJFBE("mountButtonConfigKBM"))
				end
			end
		end,
		buildCondition = var_0_8
	},
	MountingExitDelay = {
		buildCondition = var_0_8
	},
	MouseSmoothingOld = {
		action = function(arg_465_0, arg_465_1, arg_465_2, arg_465_3)
			local var_465_0 = arg_465_3 / 10

			Dvar.IICIFEEDC(arg_465_2, var_465_0)
		end,
		value = function(arg_466_0, arg_466_1)
			return Dvar.BJJCJHDBII(arg_466_1) * 10
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
		action = function(arg_467_0, arg_467_1, arg_467_2)
			Dvar.IICIFEEDC("LRTMQRTPLO", arg_467_2 / 100)
		end,
		value = function(arg_468_0)
			return Dvar.BJJCJHDBII("LRTMQRTPLO") * 100
		end,
		defaultOptionValue = function(arg_469_0)
			return Dvar.DBGFIDHBFC("LRTMQRTPLO") * 100
		end
	},
	VoiceChatVolume = {
		action = function(arg_470_0, arg_470_1, arg_470_2)
			Dvar.IICIFEEDC("MPQSQTNRNO", arg_470_2 / 100)
		end,
		value = function(arg_471_0)
			return Dvar.BJJCJHDBII("MPQSQTNRNO") * 100
		end,
		defaultOptionValue = function(arg_472_0)
			return Dvar.DBGFIDHBFC("MPQSQTNRNO") * 100
		end
	},
	MusicVolume = {
		action = function(arg_473_0, arg_473_1, arg_473_2)
			Dvar.IICIFEEDC("LLPPPNKTSO", arg_473_2 / 100)
		end,
		value = function(arg_474_0)
			return Dvar.BJJCJHDBII("LLPPPNKTSO") * 100
		end,
		defaultOptionValue = function(arg_475_0)
			return Dvar.DBGFIDHBFC("LLPPPNKTSO") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	NATType = {
		name = function()
			local var_476_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_476_0] == nil then
				netdiagNat = "unknown"
			end

			if OPTIONS.natTypeDescUILabels[var_476_0] == nil then
				netdiagNat = "unknown"
			end

			return Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", OPTIONS.natTypeUILabels[var_476_0])
		end,
		description = function()
			local var_477_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_477_0] == nil then
				netdiagNat = "unknown"
			end

			if OPTIONS.natTypeDescUILabels[var_477_0] == nil then
				netdiagNat = "unknown"
			end

			return Engine.CBBHFCGDIC(OPTIONS.natTypeDescUILabels[var_477_0], var_477_0)
		end
	},
	OptimalVideo = {
		action = function(arg_478_0, arg_478_1)
			LUI.FlowManager.RequestPopupMenu(nil, "OptimalVideoNotice", true, arg_478_1)
		end
	},
	PartyInviteNotifications = {
		disabled = var_0_4,
		value = function(arg_479_0)
			return 1
		end
	},
	ParachuteAutoDeployGamepad = {
		buildCondition = function()
			local var_480_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_480_0
		end,
		action = function(arg_481_0, arg_481_1, arg_481_2)
			if arg_481_2 == 2 then
				arg_481_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployGamepadDisabled", arg_481_2, arg_481_1)
		end,
		value = function(arg_482_0)
			local var_482_0 = Engine.BECCFCBIAA("isParachuteAutoDeployGamepadDisabled", arg_482_0)

			if var_482_0 == 0 then
				var_482_0 = 2
			end

			return var_482_0
		end,
		defaultOptionValue = function(arg_483_0)
			return 2
		end,
		description = function()
			if CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/PARACHUTE_AUTO_DEPLOY_LAZE_DESC")
			else
				return Engine.CBBHFCGDIC("MENU/PARACHUTE_AUTO_DEPLOY_DESC")
			end
		end
	},
	ParachuteAutoDeployKBM = {
		buildCondition = function()
			local var_485_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_485_0
		end,
		action = function(arg_486_0, arg_486_1, arg_486_2)
			if arg_486_2 == 2 then
				arg_486_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployKBMDisabled", arg_486_2, arg_486_1)
		end,
		value = function(arg_487_0)
			local var_487_0 = Engine.BECCFCBIAA("isParachuteAutoDeployKBMDisabled", arg_487_0)

			if var_487_0 == 0 then
				var_487_0 = 2
			end

			return var_487_0
		end,
		defaultOptionValue = function(arg_488_0)
			return 2
		end
	},
	ParachuteAutoDeployLazeKBM = {
		buildCondition = function()
			local var_489_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and CONDITIONS.IsLazeOrOutrun() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_489_0
		end,
		action = function(arg_490_0, arg_490_1, arg_490_2)
			if arg_490_2 == 2 then
				arg_490_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployKBMDisabled", arg_490_2, arg_490_1)
		end,
		value = function(arg_491_0)
			local var_491_0 = Engine.BECCFCBIAA("isParachuteAutoDeployKBMDisabled", arg_491_0)

			if var_491_0 == 0 then
				var_491_0 = 2
			end

			return var_491_0
		end,
		defaultOptionValue = function(arg_492_0)
			return 2
		end
	},
	PeripheralLighting = {
		disabled = var_0_4,
		value = function(arg_493_0)
			return 1
		end
	},
	PickUpBehavior = {
		disabled = var_0_4
	},
	PingAction = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	PingActionLaze = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and CONDITIONS.IsLazeOrOutrun()
		end
	},
	PlayerNameIndicator = {
		disabled = var_0_4
	},
	LazeProfanityFilter = {
		action = function(arg_496_0, arg_496_1)
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
		action = function(arg_499_0, arg_499_1, arg_499_2)
			Dvar.DHEGHJJJHI("MOOMTQSMPS", arg_499_2 == 1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_499_1)
		end,
		value = function(arg_500_0)
			return Dvar.IBEGCHEFE("MOOMTQSMPS") and 1 or 2
		end
	},
	QuickInventory = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and CONDITIONS.IsBrQuickInventoryEnabled() and not CONDITIONS.IsLazeOrOutrun()
		end
	},
	RealNames = {
		disabled = var_0_4
	},
	RefreshRate = {
		labels = function()
			local var_502_0 = {}
			local var_502_1 = Engine.DJGJIJCACA()

			for iter_502_0, iter_502_1 in pairs(var_502_1) do
				table.insert(var_502_0, LUI.Round(tonumber(iter_502_1)))
			end

			return var_502_0
		end,
		value = function(arg_503_0)
			local var_503_0 = Dvar.DHEEJCCJBH("SOKNOQRPL")

			return var_0_0(Engine.DJGJIJCACA(), var_503_0)
		end,
		action = function(arg_504_0, arg_504_1, arg_504_2)
			Dvar.BDEHAEGHAF("SOKNOQRPL", arg_504_0.labels[arg_504_2])
		end,
		onDependencyParentRefresh = function(arg_505_0, arg_505_1, arg_505_2, arg_505_3, arg_505_4)
			if arg_505_3 == "Monitor" then
				local var_505_0 = {}
				local var_505_1 = Engine.DJGJIJCACA(arg_505_4 - 1)

				for iter_505_0, iter_505_1 in pairs(var_505_1) do
					table.insert(var_505_0, LUI.Round(tonumber(iter_505_1)))
				end

				arg_505_0:UpdateLabels(var_505_0)

				local var_505_2 = LUI.Round(tonumber(Dvar.DHEEJCCJBH("SOKNOQRPL")))
				local var_505_3 = var_0_0(var_505_0, var_505_2)

				if var_505_3 then
					return var_505_3
				else
					return 1
				end
			end
		end,
		buildCondition = function()
			return not CONDITIONS.IsStreamingFromCloud()
		end
	},
	ResetControls = {
		type = "GenericButton",
		id = "ResetControls",
		name = Engine.CBBHFCGDIC("LUA_MENU/RESTORE_DEFAULT_CONTROLS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/RESET_CONTROLS_DESC"),
		action = function(arg_507_0, arg_507_1)
			LUI.FlowManager.RequestPopupMenu(nil, "ResetControls", true, arg_507_1)
		end,
		disabled = var_0_5
	},
	Resolution = {
		name = function()
			return Engine.CBBHFCGDIC("MENU/VIDEO_MODE_EMPTY")
		end,
		action = function(arg_509_0, arg_509_1, arg_509_2)
			Dvar.DFIJDJFIFD("LNKPMNNMQM", arg_509_2)
		end,
		onRefresh = function(arg_510_0, arg_510_1, arg_510_2)
			if arg_510_0.displayResolutions and arg_510_0.imageQualityValue and arg_510_0.displayModeIndex and arg_510_0.monitorIndex then
				local var_510_0 = Engine.BACCFGEDED(arg_510_0.monitorIndex - 1)
				local var_510_1 = OPTIONS.CalculateViewportDimensions(arg_510_2, arg_510_0.displayModeIndex, arg_510_0.displayResolutions, arg_510_0.imageQualityValue, var_510_0)
				local var_510_2 = Engine.CBBHFCGDIC("MENU/VIDEO_MODE", LUI.Round(var_510_1[1]), LUI.Round(var_510_1[2]))

				arg_510_0.GenericOptionButtonBase.Title:setText(var_510_2)

				local var_510_3 = OPTIONS.CalculateViewportDimensions(100, arg_510_0.displayModeIndex, arg_510_0.displayResolutions, arg_510_0.imageQualityValue, var_510_0)

				arg_510_0:SetMinimumValue(arg_510_1, Engine.DJADGEBIBJ(var_510_3[2]))
			end
		end,
		value = function(arg_511_0)
			return Dvar.CFHDGABACF("NRSLPQLQPL")
		end,
		onDependencyParentRefresh = function(arg_512_0, arg_512_1, arg_512_2, arg_512_3, arg_512_4)
			if arg_512_3 == "ImageQuality" then
				arg_512_0.imageQualityValue = arg_512_4
			elseif arg_512_3 == "Monitor" then
				arg_512_0.monitorIndex = arg_512_4
				arg_512_0.displayResolutions = Engine.DJDAJBFCEE(arg_512_4 - 1)
			elseif arg_512_3 == "DisplayMode" then
				arg_512_0.displayModeIndex = arg_512_4
			end

			if arg_512_0.imageQualityValue and arg_512_0.displayResolutions and arg_512_0.imageQualityValue > #arg_512_0.displayResolutions then
				arg_512_0.imageQualityValue = #arg_512_0.displayResolutions
			end

			return true
		end
	},
	PlatformConstrainedChat = {
		action = function(arg_513_0, arg_513_1, arg_513_2)
			Dvar.DHEGHJJJHI("MSSTLSMOQN", arg_513_2 == OPTIONS.disableButtonOptions.ENABLED)
			Engine.DFJDIFJEGA("allowCrossplayChat", arg_513_2 - 1, arg_513_1)
		end,
		value = function(arg_514_0)
			return Engine.BECCFCBIAA("allowCrossplayChat", arg_514_0) == 0 and OPTIONS.disableButtonOptions.DISABLED or OPTIONS.disableButtonOptions.ENABLED
		end,
		buildCondition = function()
			return Engine.CIEGIACHAE()
		end
	},
	Rumble = {
		disabled = var_0_2
	},
	SafeArea = {
		action = function(arg_516_0, arg_516_1, arg_516_2, arg_516_3)
			LUI.FlowManager.RequestPopupMenu(nil, "ScreenMargins", true, arg_516_1, false, {}, nil, true)
		end,
		hideOption = function(arg_517_0)
			return not Engine.DDJFBBJAIG() and not not CONDITIONS.IsSplitscreen() or not Engine.BFDACIJIAD(arg_517_0)
		end
	},
	ScoreboardMap = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
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
			local var_519_0 = {
				3,
				4,
				8
			}
			local var_519_1 = Dvar.CFHDGABACF("SRKPNTSRM")
			local var_519_2 = 1

			if var_519_1 <= var_519_0[1] then
				var_519_2 = 1
			elseif var_519_1 <= var_519_0[2] then
				var_519_2 = 2
			elseif var_519_1 <= var_519_0[3] then
				var_519_2 = 3
			end

			return var_519_2
		end,
		action = function(arg_520_0, arg_520_1)
			local var_520_0 = {
				3,
				4,
				8
			}
			local var_520_1 = {
				5,
				8,
				16
			}

			Dvar.DFIJDJFIFD("SRKPNTSRM", var_520_0[arg_520_1.index])
			Dvar.DFIJDJFIFD("OKKTMLKNNR", var_520_1[arg_520_1.index])
		end
	},
	ShadowMapResolution = {
		action = function(arg_521_0, arg_521_1, arg_521_2)
			local var_521_0 = Dvar.DCEBHAJGCJ("NTKRPRKMOK")[arg_521_2]

			Dvar.BDEHAEGHAF("NTKRPRKMOK", var_521_0)
		end,
		defaultOptionValue = function(arg_522_0)
			return Dvar.DBGFIDHBFC("NTKRPRKMOK") + 1
		end,
		value = function(arg_523_0)
			return Dvar.CFHDGABACF("NTKRPRKMOK") + 1
		end
	},
	GeneralSubCategoryScreen = {
		buildCondition = var_0_3
	},
	GeneralSubCategoryHUD = {
		buildCondition = function(arg_524_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	FOV = {
		applyableOverride = false,
		applyable = false,
		updateDescriptionOnAction = true,
		description = function()
			local var_525_0 = LUI.Round(Engine.DHIDDHFHBB())
			local var_525_1 = LUI.Round(Engine.HCHEJADDD(var_525_0))

			return Engine.CBBHFCGDIC("PLATFORM_UI/FOV_DESC", var_525_0, var_525_1)
		end,
		specificAction = function(arg_526_0, arg_526_1, arg_526_2)
			local var_526_0 = (80 - SliderBounds.HorizontalFOV.Min) / (SliderBounds.HorizontalFOV.Max - SliderBounds.HorizontalFOV.Min)

			arg_526_1.GenericFillBar.TickMarker:SetAnchorsAndPosition(var_526_0, 1 - var_526_0 - 0.01, 0, 0, 0, 0, -4, 4)
		end,
		defaultOptionValue = function()
			return Dvar.DBGFIDHBFC("NNMSONQSOP")
		end,
		UpdateContent = UpdateFOVFillNumberContent
	},
	ShaderFrontendPreload = {
		action = function(arg_528_0, arg_528_1, arg_528_2, arg_528_3)
			LUI.FlowManager.RequestPopupMenu(nil, "ShaderCacheDialog", false, arg_528_3.controller, false, uploadOptions, unused, false, true)
		end,
		specificAction = function(arg_529_0, arg_529_1, arg_529_2)
			arg_529_1:addEventHandler("refresh_values", function(arg_530_0, arg_530_1)
				arg_529_1:SetButtonDisabled(not ShaderUpload.DIGGBDJIIE())
			end)
		end,
		buildCondition = function()
			return Engine.CGABICJHAI() and ShaderUpload.DIGGBDJIIE() and not CONDITIONS.IsStreamingFromCloud()
		end
	},
	ShowMapAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/SHOW_MAP_OPTIONS_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/SHOW_MAP_OPTIONS_DESC")
			end
		end
	},
	SkipIntro = {
		action = function(arg_533_0, arg_533_1)
			local var_533_0 = Dvar.IBEGCHEFE("NPLRKNKKOP")

			Dvar.DHEGHJJJHI("NPLRKNKKOP", not var_533_0)
			Dvar.DHEGHJJJHI("NKMQMOKNRP", not var_533_0)

			if var_533_0 then
				LUI.DataSourceInControllerModel.new("alwaysLoaded.hasPlayerSeenSeasonVideo"):SetValue(arg_533_1, true)
			end
		end,
		defaultOptionValue = function(arg_534_0, arg_534_1)
			return 1
		end,
		value = function(arg_535_0)
			return Dvar.IBEGCHEFE("NPLRKNKKOP") and 2 or 1
		end,
		buildCondition = function()
			return Engine.CGABICJHAI() and not CONDITIONS.IsStreamingFromCloud()
		end
	},
	SplitscreenShadows = {
		action = function(arg_537_0, arg_537_1, arg_537_2)
			if arg_537_2 == 2 then
				arg_537_2 = 3
			end

			Engine.DAGFFDGFII("profile_setSunShadowSplitscreen " .. arg_537_2 - 1, arg_537_1)
		end,
		value = function(arg_538_0)
			local var_538_0 = Dvar.DHEEJCCJBH("OLSOQRKNLO")
			local var_538_1 = Dvar.DCEBHAJGCJ("OLSOQRKNLO")
			local var_538_2 = var_0_0(var_538_1, var_538_0)

			return math.min(var_538_2, 2)
		end,
		hideOption = function(arg_539_0)
			return not Engine.BFDACIJIAD(arg_539_0) or not CONDITIONS.IsSplitscreen()
		end
	},
	SprintCancelReload = {
		disabled = var_0_2
	},
	StanceUpToJump = {
		action = function(arg_540_0, arg_540_1, arg_540_2)
			Engine.DAGFFDGFII("profile_toggleStanceUpJump")
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_540_1)
		end,
		defaultOptionValue = function(arg_541_0, arg_541_1)
			return Engine.IEBBJFBE("stanceUpJump") == 1
		end,
		value = function(arg_542_0)
			return Engine.BECCFCBIAA("stanceUpJump", arg_542_0) and 2 or 1
		end
	},
	SteeringVehicleStickSensitivity = {
		disabled = var_0_4
	},
	StickAcceleration = {
		disabled = var_0_4
	},
	StreamingQuality = {
		disabled = function(arg_543_0, arg_543_1)
			return not Engine.DDJFBBJAIG()
		end,
		action = function(arg_544_0, arg_544_1, arg_544_2)
			Dvar.DFIJDJFIFD("OMKLNPPNSM", arg_544_2 - 1)
		end,
		value = function(arg_545_0)
			return Dvar.CFHDGABACF("OMKLNPPNSM") + 1
		end,
		defaultOptionValue = function(arg_546_0, arg_546_1)
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
		action = function(arg_547_0, arg_547_1, arg_547_2)
			Dvar.DHEGHJJJHI("LNOSSNSNTK", arg_547_2)
		end
	},
	SuperSprintAction = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/SUPER_SPRINT_KEYBIND_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/SUPER_SPRINT_KEYBIND_DESC")
			end
		end
	},
	SystemClock = {
		action = function(arg_549_0, arg_549_1, arg_549_2)
			Engine.DFJDIFJEGA("displayTelemetryTime", arg_549_2 - 1, arg_549_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "localTime",
				value = arg_549_2 - 1
			})
		end,
		value = function(arg_550_0)
			return Engine.BECCFCBIAA("displayTelemetryTime", arg_550_0) and 2 or 1
		end
	},
	TelemetryFPSCounter = {
		action = function(arg_551_0, arg_551_1, arg_551_2)
			Engine.DFJDIFJEGA("displayTelemetryFPS", arg_551_2 - 1, arg_551_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "fps",
				value = arg_551_2 - 1
			})
		end,
		value = function(arg_552_0)
			return Engine.BECCFCBIAA("displayTelemetryFPS", arg_552_0) and 2 or 1
		end
	},
	TelemetryServerLatency = {
		action = function(arg_553_0, arg_553_1, arg_553_2)
			Engine.DFJDIFJEGA("displayTelemetryLatency", arg_553_2 - 1, arg_553_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "latency",
				value = arg_553_2 - 1
			})
		end,
		value = function(arg_554_0)
			return Engine.BECCFCBIAA("displayTelemetryLatency", arg_554_0) and 2 or 1
		end
	},
	TelemetryGPUTemp = {
		action = function(arg_555_0, arg_555_1, arg_555_2)
			Engine.DFJDIFJEGA("displayTelemetryGpuTemperature", arg_555_2 - 1, arg_555_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "gpuTemp",
				value = arg_555_2 - 1
			})
		end,
		value = function(arg_556_0)
			return Engine.BECCFCBIAA("displayTelemetryGpuTemperature", arg_556_0) and 2 or 1
		end
	},
	TelemetryGPUTime = {
		action = function(arg_557_0, arg_557_1, arg_557_2)
			Engine.DFJDIFJEGA("displayTelemetryGpuTime", arg_557_2 - 1, arg_557_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "gpuTime",
				value = arg_557_2 - 1
			})
		end,
		value = function(arg_558_0)
			return Engine.BECCFCBIAA("displayTelemetryGpuTime", arg_558_0) and 2 or 1
		end
	},
	TelemetryCPUTime = {
		action = function(arg_559_0, arg_559_1, arg_559_2)
			Engine.DFJDIFJEGA("displayTelemetryCpuTime", arg_559_2 - 1, arg_559_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "cpuTime",
				value = arg_559_2 - 1
			})
		end,
		value = function(arg_560_0)
			return Engine.BECCFCBIAA("displayTelemetryCpuTime", arg_560_0) and 2 or 1
		end
	},
	TelemetryMuteSound = {
		action = function(arg_561_0, arg_561_1, arg_561_2)
			Engine.DFJDIFJEGA("showSoundMuted", arg_561_2 - 1, arg_561_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "sound",
				value = arg_561_2 - 1
			})
		end,
		value = function(arg_562_0)
			return Engine.BECCFCBIAA("showSoundMuted", arg_562_0) and 2 or 1
		end
	},
	TelemetryMuteVoiceChat = {
		action = function(arg_563_0, arg_563_1, arg_563_2)
			Engine.DFJDIFJEGA("showVoiceChatMuted", arg_563_2 - 1, arg_563_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "voiceChat",
				value = arg_563_2 - 1
			})
		end,
		value = function(arg_564_0)
			return Engine.BECCFCBIAA("showVoiceChatMuted", arg_564_0) and 2 or 1
		end
	},
	TelemetryPacketLoss = {
		action = function(arg_565_0, arg_565_1, arg_565_2)
			Engine.DFJDIFJEGA("displayTelemetryPacketLoss", arg_565_2 - 1, arg_565_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "packetLoss",
				value = arg_565_2 - 1
			})
		end,
		value = function(arg_566_0)
			return Engine.BECCFCBIAA("displayTelemetryPacketLoss") + 1
		end
	},
	TextChatEnabled = {
		disabled = function(arg_567_0)
			if Dvar.IBEGCHEFE("LQSTPOPKRO") then
				return Engine.CDFCHEJJE(arg_567_0) or Engine.JBFICJJHG(arg_567_0)
			else
				return Engine.CDFCHEJJE(arg_567_0)
			end
		end,
		onRefresh = function(arg_568_0, arg_568_1, arg_568_2)
			arg_568_0:dispatchEventToRoot({
				name = "text_chat_updated",
				controller = arg_568_1,
				active = arg_568_2 == OPTIONS.disableButtonOptions.ENABLED
			})
		end,
		buildCondition = function()
			return not IsLanguageArabic()
		end,
		isDependencyDisabled = function(arg_570_0, arg_570_1, arg_570_2, arg_570_3)
			return arg_570_2 == 1
		end,
		value = function(arg_571_0)
			return Engine.BECCFCBIAA("textChatEnabled", arg_571_0) and not Engine.CDFCHEJJE(arg_571_0) and 2 or 1
		end
	},
	ToogleLean = {
		disabled = GamepadEnabled
	},
	ToggleMapCursorEnable = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun()
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
		action = function(arg_575_0, arg_575_1, arg_575_2)
			local var_575_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")

			Dvar.BDEHAEGHAF("MSQLPLNSQN", var_575_0[arg_575_2])
		end,
		value = function(arg_576_0)
			local var_576_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")
			local var_576_1 = Dvar.DHEEJCCJBH("MSQLPLNSQN")

			return var_0_0(var_576_0, var_576_1)
		end,
		defaultOptionValue = function(arg_577_0, arg_577_1)
			return 1
		end
	},
	SoundSpeakerDevicePC = {
		labels = function()
			return Engine.BHBBJDEAC()
		end,
		value = function(arg_579_0)
			local var_579_0 = Dvar.DHEEJCCJBH("LLMMMMLOOO")
			local var_579_1 = var_0_0(Engine.BJBABGABCA(), var_579_0)

			if var_579_1 == nil then
				return 1
			end

			return var_579_1
		end,
		action = function(arg_580_0, arg_580_1, arg_580_2)
			local var_580_0 = Engine.BJBABGABCA()

			Dvar.BDEHAEGHAF("MSLTMOPNPN", var_580_0[arg_580_2])
		end,
		defaultOptionValue = function(arg_581_0, arg_581_1)
			return 1
		end,
		onRefresh = function(arg_582_0, arg_582_1, arg_582_2)
			arg_582_0.labels = Engine.BHBBJDEAC()
		end
	},
	VoiceSpeakerDevicePC = {
		labels = function()
			return Engine.DIHFEBAJJD()
		end,
		value = function(arg_584_0)
			local var_584_0 = Dvar.DHEEJCCJBH("LKKOOLRTTL")
			local var_584_1 = var_0_0(Engine.CIGDFGGEFD(), var_584_0)

			if var_584_1 == nil then
				return 1
			end

			return var_584_1
		end,
		action = function(arg_585_0, arg_585_1, arg_585_2)
			local var_585_0 = Engine.CIGDFGGEFD()

			Dvar.BDEHAEGHAF("NNQPPROKRO", var_585_0[arg_585_2])
		end,
		defaultOptionValue = function(arg_586_0, arg_586_1)
			return 1
		end,
		onRefresh = function(arg_587_0, arg_587_1, arg_587_2)
			arg_587_0.labels = Engine.DIHFEBAJJD()
		end
	},
	MicrophoneDevicePC = {
		labels = function()
			return Engine.BBIDIHBAEG()
		end,
		value = function(arg_589_0)
			local var_589_0 = Dvar.DHEEJCCJBH("NPQTQQNORO")
			local var_589_1 = var_0_0(Engine.EBJCHFFFII(), var_589_0)

			if var_589_1 == nil then
				return 1
			end

			return var_589_1
		end,
		action = function(arg_590_0, arg_590_1, arg_590_2)
			local var_590_0 = Engine.EBJCHFFFII()

			Dvar.BDEHAEGHAF("NOPOLMQKPL", var_590_0[arg_590_2])
		end,
		defaultOptionValue = function(arg_591_0, arg_591_1)
			return 1
		end,
		onRefresh = function(arg_592_0, arg_592_1, arg_592_2)
			arg_592_0.labels = Engine.BBIDIHBAEG()
		end
	},
	VoiceChatDeviceXBOX = {
		buildCondition = function()
			return not CONDITIONS.IsPS4()
		end,
		action = function(arg_594_0, arg_594_1, arg_594_2)
			local var_594_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")

			Dvar.BDEHAEGHAF("MSQLPLNSQN", var_594_0[arg_594_2])
		end,
		value = function(arg_595_0)
			local var_595_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")
			local var_595_1 = Dvar.DHEEJCCJBH("MSQLPLNSQN")

			return var_0_0(var_595_0, var_595_1)
		end,
		defaultOptionValue = function(arg_596_0, arg_596_1)
			return 1
		end
	},
	VoiceFutz = {
		action = function(arg_597_0, arg_597_1, arg_597_2)
			Dvar.BDEHAEGHAF("TLOLPTLNQ", OPTIONS.voiceChatEffectValues[arg_597_2])
		end,
		value = function(arg_598_0)
			return var_0_0(OPTIONS.voiceChatEffectValues, Dvar.DHEEJCCJBH("TLOLPTLNQ"))
		end,
		defaultOptionValue = function(arg_599_0)
			return var_0_0(OPTIONS.voiceChatEffectValues, "mw_default")
		end
	},
	VoiceLevelIndicator = {
		specificAction = function(arg_600_0, arg_600_1, arg_600_2)
			arg_600_1:SetButtonDisabled(true)
			arg_600_1.ArrowRight:SetAlpha(0)
			arg_600_1.ArrowLeft:SetAlpha(0)

			local var_600_0 = arg_600_0:Wait(100)
			local var_600_1

			local function var_600_2(arg_601_0)
				local var_601_0 = Engine.BJEDCJAEHH()

				arg_600_1.GenericFillBar.Fill:SetAnchors(0, 1 - var_601_0, 0, 0, 0)

				arg_601_0:Wait(100).onComplete = var_600_2
			end

			var_600_0.onComplete = var_600_2
		end
	},
	VoiceVolume = {
		action = function(arg_602_0, arg_602_1, arg_602_2)
			Dvar.IICIFEEDC("MSSPLOROPP", arg_602_2 / 100)
		end,
		value = function(arg_603_0)
			return Dvar.BJJCJHDBII("MSSPLOROPP") * 100
		end,
		defaultOptionValue = function(arg_604_0)
			return Dvar.DBGFIDHBFC("MSSPLOROPP") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	Volume = {
		action = function(arg_605_0, arg_605_1, arg_605_2)
			Dvar.IICIFEEDC("LQTPNKKMOP", arg_605_2 / 100)
		end,
		value = function(arg_606_0)
			return Dvar.BJJCJHDBII("LQTPNKKMOP") * 100
		end,
		defaultOptionValue = function(arg_607_0)
			return Dvar.DBGFIDHBFC("LQTPNKKMOP") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	RecordLevel = {
		action = function()
			return function(arg_609_0)
				Dvar.IICIFEEDC("OSONRTTPO", arg_609_0 * 65536)
			end
		end,
		value = function(arg_610_0)
			return Dvar.BJJCJHDBII("OSONRTTPO") / 65536
		end
	},
	KillStreak1Action = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/KILLSTREAK_REWARD_SLOT_1_DESC")
			else
				return Engine.CBBHFCGDIC("MENU/KILLSTREAK_REWARD_SLOT_1_LAZE_DESC")
			end
		end
	},
	VehicleCameraAutoRecenterController = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC")
			end
		end
	},
	VehicleCameraAutoRecenterKeyboard = {
		description = function()
			if CONDITIONS.IsMagmaEnabled() and not CONDITIONS.IsLazeOrOutrun() then
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC_MAGMA")
			else
				return Engine.CBBHFCGDIC("MENU/VEHICLE_CAMERA_AUTO_CENTER_DESC")
			end
		end
	},
	VoiceThreshold = {
		action = function(arg_614_0, arg_614_1, arg_614_2, arg_614_3)
			Dvar.IICIFEEDC("MSKKKMTQNT", arg_614_3 * 65536)
		end,
		value = function(arg_615_0)
			return Dvar.BJJCJHDBII("MSKKKMTQNT") / 65536
		end
	},
	UnlockAllItems = {
		action = function(arg_616_0, arg_616_1, arg_616_2)
			Dvar.DHEGHJJJHI("OLKMKMTKRO", not Dvar.IBEGCHEFE("OLKMKMTKRO"))
		end,
		defaultOptionValue = function(arg_617_0)
			return 1
		end,
		buildCondition = function()
			return Engine.BHICADFIHA()
		end
	},
	PrintWeaponAttributes = {
		action = function(arg_619_0, arg_619_1, arg_619_2)
			Dvar.DFIJDJFIFD("MMTMMPTQKM", arg_619_2)
		end,
		defaultOptionValue = function(arg_620_0)
			local var_620_0 = Dvar.CFHDGABACF("MMTMMPTQKM")

			return var_620_0 and var_620_0 or 1
		end,
		value = function(arg_621_0)
			local var_621_0 = Dvar.CFHDGABACF("MMTMMPTQKM")

			return var_621_0 and var_621_0 or 1
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
		action = function(arg_624_0, arg_624_1)
			LUI.FlowManager.RequestAddMenu("CodcasterSetup", true, arg_624_1)
		end
	},
	DataViewBindingCodcaster = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("RPNQOQSOS")
		end
	},
	SlideEnabledKeyboard = {
		onDependencyParentRefresh = function(arg_626_0, arg_626_1, arg_626_2, arg_626_3, arg_626_4)
			local var_626_0 = arg_626_2

			if arg_626_3 == "Crouch" and arg_626_4 == 2 then
				Engine.DFJDIFJEGA("tapToSlideEnabledKeyboard", 1, arg_626_1)

				var_626_0 = 2
			end

			return var_626_0
		end
	},
	CoDCaster_FreeCamSmoothFactor = {
		action = function(arg_627_0, arg_627_1, arg_627_2)
			Dvar.IICIFEEDC("NKOLKNSQNP", (34 - arg_627_2) / 1000)
		end,
		value = function(arg_628_0)
			return 34 - Dvar.BJJCJHDBII("NKOLKNSQNP") * 1000
		end,
		defaultOptionValue = function(arg_629_0)
			Dvar.IICIFEEDC("NKOLKNSQNP", 0.007)

			return 26
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	CoDCaster_FreeCamSpeed = {
		action = function(arg_630_0, arg_630_1, arg_630_2)
			Dvar.IICIFEEDC("NRKNMTPMTO", arg_630_2 / 100)
		end,
		value = function(arg_631_0)
			return Dvar.BJJCJHDBII("NRKNMTPMTO") * 100
		end,
		defaultOptionValue = function(arg_632_0)
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
		action = function(arg_633_0, arg_633_1, arg_633_2, arg_633_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_633_0, OPTIONS_DATA.optionsCategory.videoOptions, arg_633_3.mouse)
		end,
		focusAction = function(arg_634_0)
			arg_634_0:processEvent({
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
		action = function(arg_635_0, arg_635_1, arg_635_2, arg_635_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_635_0, OPTIONS_DATA.optionsCategory.audioOptions, arg_635_3.mouse)
		end,
		focusAction = function(arg_636_0)
			arg_636_0:processEvent({
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
		action = function(arg_637_0, arg_637_1, arg_637_2, arg_637_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_637_0, OPTIONS_DATA.optionsCategory.networkDiagnosticOptions, arg_637_3.mouse)
			arg_637_0:processEvent({
				name = "network_diagnostic_show"
			})
		end,
		focusAction = function(arg_638_0)
			arg_638_0:processEvent({
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
		action = function(arg_639_0, arg_639_1, arg_639_2, arg_639_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_639_0, OPTIONS_DATA.optionsCategory.controlOptions, arg_639_3.mouse)
		end,
		focusAction = function(arg_640_0)
			arg_640_0:processEvent({
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
		action = function(arg_641_0, arg_641_1, arg_641_2, arg_641_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_641_0, OPTIONS_DATA.optionsCategory.voiceOptions, arg_641_3.mouse)
		end,
		focusAction = function(arg_642_0)
			arg_642_0:processEvent({
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
		action = function(arg_643_0, arg_643_1)
			CoD.SpamRemovalAction()
		end,
		focusAction = function(arg_644_0)
			arg_644_0:processEvent({
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
		action = function(arg_646_0, arg_646_1)
			CoD.GrantAllT9ItemsAction(arg_646_1)
		end,
		focusAction = function(arg_647_0)
			arg_647_0:processEvent({
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
		action = function(arg_649_0, arg_649_1)
			CoD.SendDailyChallengeCompletion(arg_649_1, arg_649_0)
		end,
		focusAction = function(arg_650_0)
			arg_650_0:processEvent({
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
		action = function(arg_652_0, arg_652_1)
			CoD.StreamingDebugAction()
		end,
		focusAction = function(arg_653_0)
			arg_653_0:processEvent({
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
		action = function(arg_655_0, arg_655_1)
			CoD.StreamImageSortListsAction()
		end,
		focusAction = function(arg_656_0)
			arg_656_0:processEvent({
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
		action = function(arg_658_0, arg_658_1)
			CoD.StreamHTTPDebugAction()
		end,
		focusAction = function(arg_659_0)
			arg_659_0:processEvent({
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
		focusAction = function(arg_661_0)
			arg_661_0:processEvent({
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
		focusAction = function(arg_662_0)
			arg_662_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	GeneralSubCategoryDetailsTextures = {
		buildCondition = function(arg_663_0)
			return not Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end
	},
	InternetBandwidthUsage = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_665_0, arg_665_1, arg_665_2)
			local var_665_0 = Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_665_1)
			local var_665_1 = arg_665_2 - 1

			if var_665_1 == 1 then
				StreamHTTP.BEICCJHHAH(0)
			else
				StreamHTTP.BEICCJHHAH(var_665_0 * 1024)
			end

			Engine.DFJDIFJEGA("httpStreamUsageLimit", var_665_1, arg_665_1)
		end,
		value = function(arg_666_0)
			return Engine.BECCFCBIAA("httpStreamUsageLimit", arg_666_0) + 1
		end,
		isDependencyDisabled = function(arg_667_0, arg_667_1, arg_667_2, arg_667_3)
			if (arg_667_3 == "TextureDownloadLimitPC" or arg_667_3 == "TextureDownloadLimitConsole") and arg_667_2 ~= OPTIONS.disableButtonOptions.DISABLED then
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
			local var_672_0 = {}

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				var_672_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_672_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_STANDARD")
				var_672_0[3] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			else
				var_672_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_672_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			end

			return var_672_0
		end,
		action = function(arg_673_0, arg_673_1, arg_673_2)
			if arg_673_2 == 1 then
				Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 0, arg_673_1)
				Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 0)
			else
				Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 1, arg_673_1)

				if Dvar.IBEGCHEFE("PTQMQOKQ") and arg_673_2 == 2 then
					Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 0)
				else
					Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 1)
				end
			end
		end,
		value = function(arg_674_0)
			local var_674_0 = Engine.BECCFCBIAA("httpDownloadTexturesEnable", arg_674_0)
			local var_674_1 = Engine.BECCFCBIAA("httpDownloadTexturesQuality", arg_674_0)

			if var_674_0 == 0 then
				return 1
			elseif Dvar.IBEGCHEFE("PTQMQOKQ") then
				return var_674_1 > 0 and 3 or 2
			else
				return 2
			end
		end,
		isDependencyDisabled = function(arg_675_0, arg_675_1, arg_675_2, arg_675_3)
			return arg_675_2 == 1
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
			local var_678_0 = {}

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				var_678_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_678_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_STANDARD")
				var_678_0[3] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			else
				var_678_0[1] = Engine.CBBHFCGDIC("LUA_MENU/DISABLED")
				var_678_0[2] = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADQUALITY_HIGH")
			end

			return var_678_0
		end,
		action = function(arg_679_0, arg_679_1, arg_679_2)
			local var_679_0 = arg_679_0
			local var_679_1 = {
				0,
				24
			}

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				var_679_1 = {
					0,
					8,
					24
				}
			end

			local var_679_2 = StreamHTTP.DECHFDIAFC()
			local var_679_3 = var_679_1[arg_679_2]
			local var_679_4 = var_679_2 > 0 and 1 or 0
			local var_679_5 = var_679_3 > 0 and 1 or 0
			local var_679_6 = "PLATFORM/TEXTURE_CACHE_ALLOC_CONFIRM"

			if Engine.CIEGIACHAE() then
				var_679_6 = Engine.CBBHFCGDIC(var_679_6, var_679_3)
			else
				var_679_6 = Engine.CBBHFCGDIC(var_679_6)
			end

			if var_679_2 < var_679_3 then
				local var_679_7 = {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = var_679_6,
					noLabel = Engine.CBBHFCGDIC("MENU/CANCEL"),
					noAction = function(arg_680_0, arg_680_1)
						StreamHTTP.BDFCGGGAEA(var_679_2)
						Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_679_4, arg_679_1)
						var_679_0:processEvent({
							name = "seek_value",
							controllerIndex = arg_679_1
						})
					end,
					yesAction = function(arg_681_0, arg_681_1)
						StreamHTTP.BDFCGGGAEA(var_679_3)

						if Engine.BAHIIBFDDG() and CONDITIONS.UserHasATexturePack() ~= 0 then
							local var_681_0 = {}

							var_0_23(var_681_0, true, arg_679_1)
							LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNoCancel", true, arg_679_1, false, var_681_0, nil, true, true)
						end
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_679_1, false, var_679_7)
			end

			if var_679_3 > 0 and var_679_3 < var_679_2 then
				StreamHTTP.BDFCGGGAEA(var_679_3)
				Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_679_5, arg_679_1)
			end

			if var_679_3 == 0 and var_679_2 > 0 then
				if Engine.CIEGIACHAE() then
					local var_679_8 = {
						message = Engine.CBBHFCGDIC("PLATFORM/TEXTURE_CLEARCACHE_POPUP"),
						noAction = function(arg_682_0, arg_682_1)
							StreamHTTP.BDFCGGGAEA(var_679_2)
							Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_679_4, arg_682_1)
							var_679_0:processEvent({
								name = "seek_value",
								controllerIndex = arg_682_1
							})
						end,
						yesAction = function(arg_683_0, arg_683_1)
							StreamHTTP.BDFCGGGAEA(var_679_3)
							Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_679_5, arg_683_1)
							var_679_0:processEvent({
								name = "seek_value",
								controllerIndex = arg_683_1
							})
						end
					}

					LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_679_1, false, var_679_8)
				end

				if Engine.BAHIIBFDDG() then
					StreamHTTP.BDFCGGGAEA(var_679_3)
					Engine.DFJDIFJEGA("httpDownloadTexturesEnable", var_679_5, arg_679_1)
					var_679_0:processEvent({
						name = "seek_value",
						controllerIndex = arg_679_1
					})

					if Engine.IDICJHGG() and not Dvar.IBEGCHEFE("PTQMQOKQ") then
						local var_679_9 = {
							message = Engine.CBBHFCGDIC("PLATFORM/TEXTURE_CLEARCACHE_POPUP"),
							action = function(arg_684_0, arg_684_1)
								return
							end
						}

						LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_679_1, false, var_679_9)
					end
				end
			end
		end,
		value = function(arg_685_0)
			local var_685_0 = StreamHTTP.DECHFDIAFC()

			if Dvar.IBEGCHEFE("PTQMQOKQ") then
				if var_685_0 >= 22 then
					return 3
				end

				if var_685_0 > 0 then
					return 2
				end
			elseif var_685_0 > 0 then
				return 2
			end

			return 1
		end,
		isDependencyDisabled = function(arg_686_0, arg_686_1, arg_686_2, arg_686_3)
			return arg_686_2 == 1
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
		action = function(arg_689_0, arg_689_1, arg_689_2)
			Engine.DFJDIFJEGA("httpStreamLimitMBytes", arg_689_2 * 1024, arg_689_1)

			if Engine.BECCFCBIAA("httpStreamUsageLimit", arg_689_1) == 1 then
				StreamHTTP.BEICCJHHAH(0)
			else
				StreamHTTP.BEICCJHHAH(arg_689_2 * 1024)
			end
		end,
		value = function(arg_690_0)
			return Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_690_0) / 1024
		end,
		specificAction = function(arg_691_0, arg_691_1, arg_691_2)
			local var_691_0 = arg_691_1.SetActive

			function arg_691_1.SetActive(arg_692_0, arg_692_1)
				local var_692_0 = var_691_0(arg_692_0, arg_692_1)

				arg_691_0:processEvent({
					name = "texture_download_limit_over"
				})

				if arg_691_0:GetCurrentMenu() then
					arg_691_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_over",
						controller = arg_691_2,
						index = value
					})
				end

				return var_692_0
			end

			local var_691_1 = arg_691_1.RemoveActive

			function arg_691_1.RemoveActive(arg_693_0, arg_693_1)
				local var_693_0 = var_691_1(arg_693_0, arg_693_1)

				arg_691_0:processEvent({
					name = "texture_download_limit_up"
				})

				if arg_691_0:GetCurrentMenu() then
					arg_691_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_up",
						controller = arg_691_2,
						index = value
					})
				end

				return var_693_0
			end

			arg_691_1:addEventHandler("button_up", function(arg_694_0, arg_694_1)
				if arg_694_0.isBootOptions then
					arg_691_0:processEvent({
						name = "texture_download_limit_up"
					})

					if arg_691_0:GetCurrentMenu() then
						arg_691_0:dispatchEventToCurrentMenu({
							name = "texture_download_limit_up",
							controller = arg_691_2,
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
		action = function(arg_696_0, arg_696_1, arg_696_2)
			Engine.DFJDIFJEGA("httpStreamLimitMBytes", arg_696_2 * 1024, arg_696_1)

			if Engine.BECCFCBIAA("httpStreamUsageLimit", arg_696_1) == 1 then
				StreamHTTP.BEICCJHHAH(0)
			else
				StreamHTTP.BEICCJHHAH(arg_696_2 * 1024)
			end
		end,
		value = function(arg_697_0)
			return Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_697_0) / 1024
		end,
		specificAction = function(arg_698_0, arg_698_1, arg_698_2)
			local var_698_0 = arg_698_1.SetActive

			function arg_698_1.SetActive(arg_699_0, arg_699_1)
				local var_699_0 = var_698_0(arg_699_0, arg_699_1)

				arg_698_0:processEvent({
					name = "texture_download_limit_over"
				})

				if arg_698_0:GetCurrentMenu() then
					arg_698_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_over",
						controller = arg_698_2,
						index = value
					})
				end

				return var_699_0
			end

			local var_698_1 = arg_698_1.RemoveActive

			function arg_698_1.RemoveActive(arg_700_0, arg_700_1)
				local var_700_0 = var_698_1(arg_700_0, arg_700_1)

				arg_698_0:processEvent({
					name = "texture_download_limit_up"
				})

				if arg_698_0:GetCurrentMenu() then
					arg_698_0:dispatchEventToCurrentMenu({
						name = "texture_download_limit_up",
						controller = arg_698_2,
						index = value
					})
				end

				return var_700_0
			end

			arg_698_1:addEventHandler("button_up", function(arg_701_0, arg_701_1)
				if arg_701_0.isBootOptions then
					arg_698_0:processEvent({
						name = "texture_download_limit_up"
					})

					if arg_698_0:GetCurrentMenu() then
						arg_698_0:dispatchEventToCurrentMenu({
							name = "texture_download_limit_up",
							controller = arg_698_2,
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
		action = function(arg_703_0, arg_703_1, arg_703_2)
			if StreamHTTP.DECHFDIAFC() ~= arg_703_2 then
				StreamHTTP.BDFCGGGAEA(arg_703_2)
				Engine.BHIJFFCAEB("Changed http cache size")
			end
		end,
		onRefresh = function(arg_704_0, arg_704_1, arg_704_2)
			Dvar.DHEGHJJJHI("LQSQKPKOSQ", StreamHTTP.DECHFDIAFC() ~= arg_704_2)
		end,
		value = function(arg_705_0)
			return StreamHTTP.DECHFDIAFC()
		end
	},
	AlertIconAll = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		isDependencyDisabled = function(arg_707_0, arg_707_1, arg_707_2, arg_707_3)
			if arg_707_2 == 3 then
				return false
			end

			return true
		end,
		getSpecificImage = function(arg_708_0)
			if not Engine.CGABICJHAI() then
				arg_708_0 = "image_options_ingamealerts_console_"
			end

			return arg_708_0
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
		onDependencyParentRefresh = function(arg_711_0, arg_711_1, arg_711_2, arg_711_3, arg_711_4)
			return var_0_22(arg_711_4, arg_711_2)
		end
	},
	AlertIconHighLatency = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_713_0, arg_713_1, arg_713_2, arg_713_3, arg_713_4)
			return var_0_22(arg_713_4, arg_713_2)
		end
	},
	AlertIconLatencyVariation = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_715_0, arg_715_1, arg_715_2, arg_715_3, arg_715_4)
			return var_0_22(arg_715_4, arg_715_2)
		end
	},
	AlertIconPacketBurst = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("MTTTROPML")
		end,
		onDependencyParentRefresh = function(arg_717_0, arg_717_1, arg_717_2, arg_717_3, arg_717_4)
			return var_0_22(arg_717_4, arg_717_2)
		end
	},
	AlertIconShaderWarning = {
		buildCondition = function()
			return Engine.CGABICJHAI() and not Dvar.IBEGCHEFE("MTTTROPML") and not Dvar.IBEGCHEFE("QSPRQKKMN")
		end,
		onDependencyParentRefresh = function(arg_719_0, arg_719_1, arg_719_2, arg_719_3, arg_719_4)
			return var_0_22(arg_719_4, arg_719_2)
		end
	},
	TextureCacheClearPC = {
		buildCondition = function()
			return Engine.CGABICJHAI() and CONDITIONS.InFrontend() and Dvar.IBEGCHEFE("LTNRTMMPKQ")
		end,
		action = function(arg_721_0, arg_721_1)
			local var_721_0 = {
				title = Engine.CBBHFCGDIC("MENU/CLEAR_CACHE_TITLE"),
				message = Engine.CBBHFCGDIC("MENU/CLEAR_CACHE_MSG"),
				noLabel = Engine.CBBHFCGDIC("MENU/CANCEL"),
				yesLabel = Engine.CBBHFCGDIC("MENU/CONTINUE"),
				yesAction = function()
					Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 0, arg_721_1)
					Dvar.DHEGHJJJHI("OPPPMPTPL", false)
					Dvar.DAACJFEEDC("MOKSKTKTLQ", 1)
					LUI.ClearCacheLayer.SetAllowCacheClear(true)
					arg_721_0:processEvent({
						name = "texture_streaming_disable"
					})
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_721_1, false, var_721_0)
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
		action = function(arg_727_0, arg_727_1, arg_727_2)
			if Dvar.CFHDGABACF("MQOMSSQRRQ") == 4 then
				Dvar.DHEGHJJJHI("NPPSOKOPLP", false)
			else
				Dvar.DHEGHJJJHI("NPPSOKOPLP", arg_727_2 == OPTIONS.disableButtonOptions.ENABLED)
			end
		end
	},
	DynamicResolutionFramerateTarget = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("LQMMKMTNTT")
		end,
		action = function(arg_729_0, arg_729_1, arg_729_2)
			local var_729_0 = 1000

			Dvar.IICIFEEDC("RTOOKRTNO", var_729_0 / arg_729_2)
		end,
		value = function(arg_730_0)
			local var_730_0 = Dvar.BJJCJHDBII("RTOOKRTNO")
			local var_730_1 = 300
			local var_730_2 = 1000

			if var_730_0 <= var_730_2 / var_730_1 then
				Dvar.IICIFEEDC("RTOOKRTNO", var_730_2 / var_730_1)

				return var_730_1
			else
				return var_730_2 / var_730_0
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
		focusAction = function(arg_732_0)
			arg_732_0:processEvent({
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
		focusAction = function(arg_733_0)
			arg_733_0:processEvent({
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
		focusAction = function(arg_734_0)
			arg_734_0:processEvent({
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
		action = function(arg_737_0, arg_737_1, arg_737_2)
			Engine.DFJDIFJEGA("warTrackPassengerEnable", arg_737_2 - 1, arg_737_1)
		end,
		value = function(arg_738_0)
			return Engine.BECCFCBIAA("warTrackPassengerEnable", arg_738_0) + 1
		end,
		defaultOptionValue = function(arg_739_0)
			return 2
		end
	},
	WarTracksVolume = {
		action = function(arg_740_0, arg_740_1, arg_740_2)
			Dvar.IICIFEEDC("OMPKLSORSL", arg_740_2 / 100)
		end,
		value = function(arg_741_0, arg_741_1)
			return Dvar.BJJCJHDBII("OMPKLSORSL") * 100
		end,
		defaultOptionValue = function(arg_742_0)
			return Dvar.DBGFIDHBFC("OMPKLSORSL") * 100
		end
	},
	HoldBreathGamepad = {
		buildCondition = function(arg_743_0)
			return Dvar.IBEGCHEFE("MNPTNPNLMK")
		end
	},
	HoldBreathKeyboard = {
		onDependencyParentRefresh = function(arg_744_0, arg_744_1, arg_744_2, arg_744_3, arg_744_4)
			if arg_744_3 == "ChangeZoomToggleHybridKBM" and arg_744_4 == 1 then
				return 1
			end
		end,
		buildCondition = function(arg_745_0)
			return Dvar.IBEGCHEFE("MNPTNPNLMK")
		end
	},
	ChangeZoomToggleHybridKBM = {
		isDependencyDisabled = function(arg_746_0, arg_746_1, arg_746_2, arg_746_3)
			return arg_746_2 == 1
		end
	},
	AdsMouseSensitivityPerZoomOption = {
		isDependencyDisabled = function(arg_747_0, arg_747_1, arg_747_2, arg_747_3)
			if arg_747_3 == "AdsMouseSensitivityMultiplierOption" then
				return arg_747_2 == OPTIONS.disableButtonOptions.ENABLED
			else
				return arg_747_2 == OPTIONS.disableButtonOptions.DISABLED
			end
		end
	},
	AdsStickSensitivityPerZoomOption = {
		isDependencyDisabled = function(arg_748_0, arg_748_1, arg_748_2, arg_748_3)
			if arg_748_3 == "AdsStickSensitivityMultiplierOption" then
				return arg_748_2 == OPTIONS.disableButtonOptions.ENABLED
			else
				return arg_748_2 == OPTIONS.disableButtonOptions.DISABLED
			end
		end
	},
	CameraMovementBehavior = {
		applyableOverride = false,
		applyable = false
	},
	ShowCompass = {
		isDependencyDisabled = function(arg_749_0, arg_749_1, arg_749_2, arg_749_3)
			return arg_749_2 == 1
		end,
		action = function(arg_750_0, arg_750_1, arg_750_2)
			Engine.DFJDIFJEGA("showCompass", arg_750_2 - 1, arg_750_1)

			if LUI.HudManager then
				local var_750_0 = LUI.HudManager.GetInstance()

				if var_750_0 then
					var_750_0:processEvent({
						name = "on_show_compass_changed"
					})
				end
			end
		end
	},
	AlwaysShowVehicleControls = {
		buildCondition = function()
			return not Dvar.IBEGCHEFE("NSSQNMQKLM") and not CONDITIONS.IsLaze()
		end,
		action = function(arg_752_0, arg_752_1, arg_752_2)
			if arg_752_2 == 4 then
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 0, arg_752_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 0, arg_752_1)
			elseif arg_752_2 == 3 then
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 0, arg_752_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 1, arg_752_1)
			elseif arg_752_2 == 2 then
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 1, arg_752_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 0, arg_752_1)
			else
				Engine.DFJDIFJEGA("alwaysShowGroundVehicleControls", 1, arg_752_1)
				Engine.DFJDIFJEGA("alwaysShowAirVehicleControls", 1, arg_752_1)
			end
		end,
		value = function(arg_753_0)
			local var_753_0 = Engine.BECCFCBIAA("alwaysShowGroundVehicleControls", arg_753_0)
			local var_753_1 = Engine.BECCFCBIAA("alwaysShowAirVehicleControls", arg_753_0)

			if var_753_0 and var_753_1 then
				return 1
			elseif var_753_0 and not var_753_1 then
				return 2
			elseif var_753_1 and not var_753_0 then
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
		buildCondition = function()
			return not CONDITIONS.IsLaze()
		end,
		action = function(arg_756_0, arg_756_1, arg_756_2)
			Engine.DFJDIFJEGA("manualGasMaskEnable", arg_756_2 - 1, arg_756_1)
		end,
		value = function(arg_757_0)
			return Engine.BECCFCBIAA("manualGasMaskEnable", arg_757_0) + 1
		end,
		defaultOptionValue = function(arg_758_0)
			return 1
		end
	},
	BuystationCloseOnPurchase = {
		action = function(arg_759_0, arg_759_1, arg_759_2)
			Engine.DFJDIFJEGA("buystationCloseMenuOnPurchase", arg_759_2 - 1, arg_759_1)
		end
	},
	DefaultToFirstLoadoutItem = {
		action = function(arg_760_0, arg_760_1, arg_760_2)
			Engine.DFJDIFJEGA("defaultToFirstLoadoutItemInDrop", arg_760_2 - 1, arg_760_1)
		end
	}
}
