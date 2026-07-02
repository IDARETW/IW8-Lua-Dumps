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

OPTIONS_DATA.optionsCategory = {
	voiceOptions = "voice_options",
	controlOptions = "control_options",
	networkDiagnosticOptions = "network_diagnostic_options",
	audioOptions = "audio_options",
	videoOptions = "video_options"
}

local function var_0_20(arg_26_0, arg_26_1)
	local var_26_0

	if arg_26_1 == OPTIONS_DATA.optionsCategory.videoOptions then
		var_26_0 = arg_26_0.VideoOptions
	elseif arg_26_1 == OPTIONS_DATA.optionsCategory.audioOptions then
		var_26_0 = arg_26_0.AudioOptions
	elseif arg_26_1 == OPTIONS_DATA.optionsCategory.networkDiagnosticOptions then
		var_26_0 = arg_26_0.NetworkDiagnosticOptions
	elseif arg_26_1 == OPTIONS_DATA.optionsCategory.controlOptions then
		var_26_0 = arg_26_0.ControlOptions
	elseif arg_26_1 == OPTIONS_DATA.optionsCategory.voiceOptions then
		var_26_0 = arg_26_0.VoiceOptions
	else
		var_26_0 = arg_26_0.VideoOptions
	end

	return var_26_0
end

function OPTIONS_DATA.UpdateOptionsWindow(arg_27_0, arg_27_1, arg_27_2)
	LUI.FlowManager.GetScopedData(arg_27_0).currentOptionsCategory = arg_27_1

	local var_27_0
	local var_27_1 = var_0_20(arg_27_0, arg_27_1)

	if arg_27_1 == OPTIONS_DATA.optionsCategory.videoOptions then
		var_27_0 = var_0_15
	elseif arg_27_1 == OPTIONS_DATA.optionsCategory.audioOptions then
		var_27_0 = var_0_17
	elseif arg_27_1 == OPTIONS_DATA.optionsCategory.networkDiagnosticOptions then
		var_27_0 = var_0_16
	elseif arg_27_1 == OPTIONS_DATA.optionsCategory.controlOptions then
		var_27_0 = var_0_18
	elseif arg_27_1 == OPTIONS_DATA.optionsCategory.voiceOptions then
		var_27_0 = var_0_19
	else
		var_27_0 = var_0_15
	end

	arg_27_0:processEvent({
		name = "category_changed",
		title = var_27_1.GenericOptionButtonBase.Title:getText(),
		createOptions = var_27_0,
		noFocus = arg_27_2
	})

	if arg_27_0.NetworkDiagnosticOptions ~= nil then
		if arg_27_1 == "network_diagnostic_options" then
			arg_27_0:processEvent({
				name = "network_diagnostic_show_internal"
			})
		else
			arg_27_0:processEvent({
				name = "network_diagnostic_hide_internal"
			})
		end
	end
end

OPTIONS_DATA.optionsDataList = {
	ButtonLayout = {
		labels = OPTIONS.GetCurrentButtonLayoutLabels,
		action = function(arg_28_0, arg_28_1, arg_28_2)
			local var_28_0 = arg_28_0:GetCurrentMenu()

			if var_28_0.ButtonLayoutOptionsMenu and not var_28_0.ButtonLayoutOptionsMenu.isBR then
				arg_28_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_28_1,
					index = arg_28_2
				})
			else
				local var_28_1 = CSV.ReadRow(CSV.buttonLayouts, arg_28_2 - 1)

				Engine.CBCIHEGADA(var_28_1.cfg, arg_28_1, false)
			end
		end,
		onRefresh = function(arg_29_0, arg_29_1, arg_29_2)
			if arg_29_0:GetCurrentMenu() then
				arg_29_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updatedVisual",
					controller = arg_29_1,
					index = arg_29_2
				})
			end
		end,
		onReset = function(arg_30_0, arg_30_1)
			arg_30_0:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				resetFlip = true,
				controller = arg_30_1
			})
		end,
		value = function(arg_31_0)
			local var_31_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_31_0)

			if string.match(var_31_0, "_alt$") then
				var_31_0 = string.gsub(var_31_0, "_alt", "")
			end

			local var_31_1 = OPTIONS.buttonLayoutStrings[var_31_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_31_1)))
		end,
		defaultOptionValue = function(arg_32_0)
			return 1
		end,
		specificAction = function(arg_33_0, arg_33_1, arg_33_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_33_0, arg_33_1, {
				showLayout = true,
				name = "buttonLayout"
			})
		end,
		customPreviewButtonAction = function(arg_34_0, arg_34_1)
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_34_1, false)
		end,
		buildCondition = function(arg_35_0)
			return not CONDITIONS.IsSplitscreen() and not CONDITIONS.IsBRGameType()
		end
	},
	ButtonLayoutSplitscreen = {
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
		value = function(arg_37_0)
			local var_37_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_37_0)

			if string.match(var_37_0, "_alt$") then
				var_37_0 = string.gsub(var_37_0, "_alt", "")
			end

			local var_37_1 = OPTIONS.buttonLayoutStrings[var_37_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_37_1)))
		end,
		defaultOptionValue = function(arg_38_0)
			return 1
		end,
		specificAction = function(arg_39_0, arg_39_1, arg_39_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_39_0, arg_39_1, {
				showLayout = false,
				name = "buttonLayout",
				showSwap = true
			})
		end,
		customPreviewButtonAction = function(arg_40_0, arg_40_1)
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_40_1, false)
		end,
		buildCondition = function(arg_41_0)
			return CONDITIONS.IsSplitscreen()
		end
	},
	StickLayout = {
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_42_0, arg_42_1, arg_42_2)
			if arg_42_0:GetCurrentMenu().StickLayoutOptionsMenu then
				arg_42_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_42_1,
					index = arg_42_2
				})
			else
				local var_42_0 = CSV.ReadRow(CSV.stickLayouts, arg_42_2 - 1)

				Engine.BEBBDFEICI(var_42_0.cfg, arg_42_1)
			end
		end,
		onRefresh = function(arg_43_0, arg_43_1, arg_43_2)
			if arg_43_0:GetCurrentMenu() then
				arg_43_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updatedVisual",
					controller = arg_43_1,
					index = arg_43_2
				})
			end
		end,
		value = function(arg_44_0)
			local var_44_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_44_0)
			local var_44_1 = OPTIONS.stickLayoutStrings[var_44_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_44_1)))
		end,
		defaultOptionValue = function(arg_45_0)
			return 1
		end,
		specificAction = function(arg_46_0, arg_46_1, arg_46_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_46_0, arg_46_1, {
				showLayout = true,
				name = "stickLayout"
			})
		end,
		customPreviewButtonAction = function(arg_47_0, arg_47_1)
			LUI.FlowManager.RequestAddMenu("StickLayout", true, arg_47_1, false)
		end,
		buildCondition = function(arg_48_0)
			return not CONDITIONS.IsSplitscreen()
		end
	},
	StickLayoutSplitscreen = {
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_49_0, arg_49_1, arg_49_2)
			if arg_49_0:GetCurrentMenu().StickLayoutOptionsMenu then
				arg_49_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_49_1,
					index = arg_49_2
				})
			else
				local var_49_0 = CSV.ReadRow(CSV.stickLayouts, arg_49_2 - 1)

				Engine.BEBBDFEICI(var_49_0.cfg, arg_49_1)
			end
		end,
		value = function(arg_50_0)
			local var_50_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_50_0)
			local var_50_1 = OPTIONS.stickLayoutStrings[var_50_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_50_1)))
		end,
		defaultOptionValue = function(arg_51_0)
			return 1
		end,
		specificAction = function(arg_52_0, arg_52_1, arg_52_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_52_0, arg_52_1, {
				showLayout = false,
				name = "stickLayout"
			})
		end,
		customPreviewButtonAction = function(arg_53_0, arg_53_1)
			LUI.FlowManager.RequestAddMenu("StickLayout", true, arg_53_1, false)
		end,
		buildCondition = function(arg_54_0)
			return CONDITIONS.IsSplitscreen()
		end
	},
	BRButtonLayout = {
		labels = OPTIONS.GetCurrentBRButtonLayoutLabels,
		action = function(arg_55_0, arg_55_1, arg_55_2)
			local var_55_0 = arg_55_0:GetCurrentMenu()

			if var_55_0.ButtonLayoutOptionsMenu and var_55_0.ButtonLayoutOptionsMenu.isBR then
				arg_55_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_55_1,
					index = arg_55_2
				})
			else
				local var_55_1 = CSV.ReadRow(CSV.brButtonLayouts, arg_55_2 - 1)

				Engine.CBCIHEGADA(var_55_1.cfg, arg_55_1, true)
			end
		end,
		onRefresh = function(arg_56_0, arg_56_1, arg_56_2)
			if arg_56_0:GetCurrentMenu() then
				arg_56_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updatedVisual",
					controller = arg_56_1,
					index = arg_56_2
				})
			end
		end,
		onReset = function(arg_57_0, arg_57_1)
			arg_57_0:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				resetFlip = true,
				controller = arg_57_1
			})
		end,
		value = function(arg_58_0)
			local var_58_0 = Engine.BECCFCBIAA("gpadBRButtonsConfig", arg_58_0)

			if string.match(var_58_0, "_alt$") then
				var_58_0 = string.gsub(var_58_0, "_alt", "")
			end

			local var_58_1 = OPTIONS.brButtonLayoutStrings[var_58_0]

			return (var_0_0(OPTIONS.GetBRButtonLayoutLabels(), Engine.CBBHFCGDIC(var_58_1)))
		end,
		defaultOptionValue = function(arg_59_0)
			return 1
		end,
		customPreviewButtonAction = function(arg_60_0, arg_60_1)
			LUI.FlowManager.RequestAddMenu("ButtonLayout", true, arg_60_1, false)
		end,
		specificAction = function(arg_61_0, arg_61_1, arg_61_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_61_0, arg_61_1, {
				showLayout = true,
				name = "buttonLayout",
				isBR = true
			})
		end,
		buildCondition = function(arg_62_0)
			return CONDITIONS.IsBRGameType()
		end
	},
	TargetAssist = {
		disabled = var_0_2
	},
	Tessellation = {
		action = function(arg_63_0, arg_63_1, arg_63_2)
			local var_63_0 = {
				"0_Off",
				"1_Near",
				"2_All"
			}

			Dvar.BDEHAEGHAF("MMNMQTSOSP", var_63_0[arg_63_2])
		end,
		value = function(arg_64_0)
			return Dvar.CFHDGABACF("MMNMQTSOSP") + 1
		end,
		defaultOptionValue = function(arg_65_0)
			return 2
		end
	},
	TexFilterAniso = {
		action = function(arg_66_0, arg_66_1, arg_66_2)
			local var_66_0 = {
				2,
				4,
				5
			}

			Dvar.DFIJDJFIFD("NSPQOSROQP", var_66_0[arg_66_2])
		end,
		value = function(arg_67_0)
			local var_67_0 = {
				2,
				4,
				5
			}
			local var_67_1 = Dvar.CFHDGABACF("NSPQOSROQP")

			if var_67_1 <= var_67_0[1] then
				return 1
			elseif var_67_1 <= var_67_0[2] then
				return 2
			elseif var_67_1 <= var_67_0[3] then
				return 3
			end
		end,
		defaultOptionValue = function(arg_68_0)
			return 2
		end
	},
	TextureRes = {
		action = function(arg_69_0, arg_69_1, arg_69_2)
			local var_69_0 = {
				3,
				2,
				1,
				0
			}

			Dvar.DFIJDJFIFD("NNTOQLMSLO", var_69_0[arg_69_2])
			Dvar.DFIJDJFIFD("MPMQRLKQQN", var_69_0[arg_69_2])
			Dvar.DFIJDJFIFD("NTROOKOSPM", var_69_0[arg_69_2])
		end,
		value = function()
			local var_70_0 = {
				3,
				2,
				1,
				0
			}

			return var_0_0(var_70_0, Dvar.CFHDGABACF("NNTOQLMSLO"))
		end
	},
	VoiceChatRealTimeProcessing = {
		disabled = var_0_4,
		value = function(arg_71_0)
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
		customPreviewButtonAction = function(arg_73_0, arg_73_1)
			LUI.FlowManager.RequestAddMenu("ColorblindFullscreen", true, arg_73_1, false)
		end,
		specificAction = function(arg_74_0, arg_74_1, arg_74_2)
			local var_74_0 = arg_74_1.SetActive

			function arg_74_1.SetActive(arg_75_0, arg_75_1)
				local var_75_0 = var_74_0(arg_75_0, arg_75_1)

				arg_74_0:processEvent({
					name = "colorblind_over"
				})

				if arg_74_0:GetCurrentMenu() then
					arg_74_0:dispatchEventToCurrentMenu({
						name = "colorblind_over",
						controller = arg_74_2,
						index = value
					})
				end

				return var_75_0
			end

			local var_74_1 = arg_74_1.RemoveActive

			function arg_74_1.RemoveActive(arg_76_0, arg_76_1)
				local var_76_0 = var_74_1(arg_76_0, arg_76_1)

				arg_74_0:processEvent({
					name = "colorblind_up"
				})

				if arg_74_0:GetCurrentMenu() then
					arg_74_0:dispatchEventToCurrentMenu({
						name = "colorblind_up",
						controller = arg_74_2,
						index = value
					})
				end

				return var_76_0
			end

			arg_74_1:addEventHandler("button_up", function(arg_77_0, arg_77_1)
				if arg_77_0.isBootOptions then
					arg_74_0:processEvent({
						name = "colorblind_up"
					})

					if arg_74_0:GetCurrentMenu() then
						arg_74_0:dispatchEventToCurrentMenu({
							name = "colorblind_up",
							controller = arg_74_2,
							index = value
						})
					end
				end
			end)
		end,
		isDependencyDisabled = function(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
			return arg_78_2 == 1
		end
	},
	ColorblindFilter = {
		labels = OPTIONS.colorBlindTargetLabels,
		action = function(arg_79_0, arg_79_1, arg_79_2)
			OPTIONS.ColorBlindTargetsSelect(arg_79_2, arg_79_1)
		end,
		value = function(arg_80_0)
			local var_80_0, var_80_1 = Engine.CBCJIDDIED(arg_80_0)
			local var_80_2 = var_80_0 and var_80_1

			return 1 + (var_80_1 and 1 or 0) + (var_80_2 and 1 or 0)
		end,
		defaultOptionValue = function(arg_81_0, arg_81_1)
			return 2
		end
	},
	FramerateLimit = {
		isDependencyDisabled = function(arg_82_0, arg_82_1, arg_82_2, arg_82_3)
			return arg_82_2 == 1
		end
	},
	GeneralSubCategoryHDR = {
		buildCondition = function(arg_83_0)
			return var_0_7() or Engine.DJDAJEJDE()
		end
	},
	DismembermentOption = {
		action = function(arg_84_0, arg_84_1, arg_84_2)
			Dvar.DHEGHJJJHI("OQLRMLRK", arg_84_2 == 2)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_84_1)
		end,
		value = function(arg_85_0)
			return Dvar.IBEGCHEFE("OQLRMLRK") and 2 or 1
		end,
		defaultOptionValue = function(arg_86_0)
			return 2
		end,
		buildCondition = function()
			return Engine.CIDEADAABH()
		end
	},
	HDR = {
		isDependencyDisabled = function(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
			if arg_88_3 == "Brightness" or arg_88_3 == "SDRColorSpace" then
				return arg_88_2 == 2
			else
				return arg_88_2 == 1
			end
		end,
		action = function(arg_89_0, arg_89_1, arg_89_2)
			Dvar.DHEGHJJJHI("MTONTNKOKR", arg_89_2 == 2)
			Engine.EBIDFIDHIE("vid_reconfig")
		end,
		buildCondition = var_0_7
	},
	HDRBrightness = {
		action = function(arg_90_0, arg_90_1, arg_90_2)
			arg_90_2 = Mirror(arg_90_2, SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)

			Dvar.IICIFEEDC("PPNORSOSS", arg_90_2)
		end,
		value = function(arg_91_0)
			return Mirror(Dvar.BJJCJHDBII("PPNORSOSS"), SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)
		end,
		buildCondition = function(arg_92_0)
			return Engine.DJDAJEJDE()
		end
	},
	HDRCalibration = {
		action = function(arg_93_0, arg_93_1, arg_93_2)
			Engine.DAGFFDGFII("profile_UpdateProfileMenuOptionsHDRLumDvars")
			LUI.FlowManager.RequestPopupMenu(unused, "BootHDRBlackPoint", true, arg_93_1, false, {
				fromOptionMenu = true
			}, true, true)
		end,
		buildCondition = function(arg_94_0)
			return Engine.DJDAJEJDE()
		end
	},
	InternalIPAddress = {
		name = function()
			local var_95_0 = Dvar.IBEGCHEFE("SQMORMQQS")

			return Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS", var_95_0 and Engine.JCBDICCAH(NetworkInfo.DBDIHEIEGB()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_96_0, arg_96_1, arg_96_2)
			local var_96_0 = arg_96_2 == 2
			local var_96_1 = Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS", var_96_0 and Engine.JCBDICCAH(NetworkInfo.DBDIHEIEGB()) or "LUA_MENU/HIDDEN")
			local var_96_2 = arg_96_0:GetCurrentMenu()

			if var_96_2 then
				var_96_2.OptionName:setText(ToUpperCase(var_96_1))
			end

			arg_96_0.buttonName = var_96_1

			arg_96_0.GenericOptionButtonBase.Title:setText(var_96_1)
		end,
		defaultOptionValue = function(arg_97_0)
			return 1
		end
	},
	ExternalIPAddress = {
		name = function()
			local var_98_0 = Dvar.IBEGCHEFE("MTSPMPOSTO")

			return Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS", var_98_0 and Engine.JCBDICCAH(NetworkInfo.BBJBJGDIGD()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_99_0, arg_99_1, arg_99_2)
			local var_99_0 = arg_99_2 == 2
			local var_99_1 = Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS", var_99_0 and Engine.JCBDICCAH(NetworkInfo.BBJBJGDIGD()) or "LUA_MENU/HIDDEN")
			local var_99_2 = arg_99_0:GetCurrentMenu()

			if var_99_2 then
				var_99_2.OptionName:setText(ToUpperCase(var_99_1))
			end

			arg_99_0.buttonName = var_99_1

			arg_99_0.GenericOptionButtonBase.Title:setText(var_99_1)
		end,
		defaultOptionValue = function(arg_100_0)
			return 1
		end
	},
	GeographicalRegion = {
		name = function()
			local var_101_0 = Dvar.IBEGCHEFE("MKMOPQKMPO")

			return Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION", var_101_0 and Engine.JCBDICCAH(NetworkInfo.BGJIBGHBAG()) or "LUA_MENU/HIDDEN")
		end,
		onRefresh = function(arg_102_0, arg_102_1, arg_102_2)
			local var_102_0 = arg_102_2 == 2
			local var_102_1 = Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION", var_102_0 and Engine.JCBDICCAH(NetworkInfo.BGJIBGHBAG()) or "LUA_MENU/HIDDEN")
			local var_102_2 = arg_102_0:GetCurrentMenu()

			if var_102_2 then
				var_102_2.OptionName:setText(ToUpperCase(var_102_1))
			end

			arg_102_0.buttonName = var_102_1

			arg_102_0.GenericOptionButtonBase.Title:setText(var_102_1)
		end,
		defaultOptionValue = function(arg_103_0)
			return 1
		end
	},
	ConnectionMeter = {
		value = function(arg_104_0)
			return Dvar.IBEGCHEFE("OMOTRTTLNP") and 1 or 2
		end,
		action = function(arg_105_0, arg_105_1, arg_105_2)
			Dvar.DHEGHJJJHI("OMOTRTTLNP", arg_105_2 == 1)
		end,
		onRefresh = function(arg_106_0, arg_106_1, arg_106_2)
			arg_106_0:processEvent({
				name = "connection_meter_toggle"
			})
		end,
		specificAction = function(arg_107_0, arg_107_1, arg_107_2)
			arg_107_1:addEventHandler("connection_meter_toggle", function(arg_108_0, arg_108_1)
				arg_107_0:processEvent({
					name = "connection_meter_toggle_internal"
				})
				Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_107_2)
			end)
		end,
		defaultOptionValue = function(arg_109_0)
			return 1
		end
	},
	DebugKeyboard = {
		action = function(arg_110_0, arg_110_1, arg_110_2)
			Engine.DAGFFDGFII("profile_toggleDevKeyboard")
		end,
		defaultOptionValue = function(arg_111_0)
			return 1
		end,
		value = function(arg_112_0)
			return Engine.BECCFCBIAA("useDevKeyboard", arg_112_0) and 2 or 1
		end
	},
	NewTextChatDebug = {
		action = function(arg_113_0, arg_113_1, arg_113_2)
			local var_113_0 = arg_113_2 == 2

			Dvar.DHEGHJJJHI("LKSKPKTOON", var_113_0)
			Dvar.DHEGHJJJHI("NNOQMLNSMP", not var_113_0)
			Dvar.DHEGHJJJHI("NLPSQMQRTP", not var_113_0)
			LUI.UIRoot.ReloadChatForDebugOption()
		end,
		defaultOptionValue = function(arg_114_0)
			return 1
		end
	},
	KeybindChangeLoadoutExpander = {
		buildCondition = function()
			return not CONDITIONS.IsSplitscreen()
		end
	},
	OnlineDebug = {
		defaultOptionValue = function(arg_116_0)
			return 1
		end,
		buildCondition = function()
			return Debug.CGCBEDDFEC()
		end
	},
	DoNotSellMyData = {
		action = function(arg_118_0, arg_118_1, arg_118_2)
			if arg_118_2 == OPTIONS.disableButtonOptions.ENABLED then
				local var_118_0 = {
					yesAction = function()
						Regulations.DAACCJJHEG(arg_118_1, OPTIONS.regulationType.CCPA, OPTIONS.regulationPreference.OPT_OUT)
					end,
					noAction = function()
						arg_118_0.currentValue = OPTIONS.disableButtonOptions.DISABLED

						arg_118_0:UpdateContent()
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "EnableCCPAWarning", true, arg_118_1, false, var_118_0)
			elseif arg_118_2 == OPTIONS.disableButtonOptions.DISABLED then
				Regulations.DAACCJJHEG(arg_118_1, OPTIONS.regulationType.CCPA, OPTIONS.regulationPreference.OPT_IN)
			end
		end,
		value = function(arg_121_0)
			local var_121_0 = Regulations.BHFFIJBAEG(arg_121_0, OPTIONS.regulationType.CCPA)
			local var_121_1 = OPTIONS.disableButtonOptions.DISABLED

			if var_121_0 and var_121_0 == OPTIONS.regulationPreference.OPT_OUT then
				var_121_1 = OPTIONS.disableButtonOptions.ENABLED
			end

			return var_121_1
		end,
		defaultOptionValue = function(arg_122_0)
			return OPTIONS.disableButtonOptions.DISABLED
		end,
		buildCondition = function(arg_123_0)
			if Engine.BIIBDBAHD() then
				local var_123_0 = Regulations.BGEIIEHJFD(arg_123_0, OPTIONS.regulationType.CCPA)

				return var_123_0 and var_123_0 == OPTIONS.regulationEnforcement.ENFORCED
			else
				return false
			end
		end,
		disabled = function(arg_124_0)
			local var_124_0 = Regulations.BGEIIEHJFD(arg_124_0, OPTIONS.regulationType.CCPA)

			return not var_124_0 or var_124_0 ~= OPTIONS.regulationEnforcement.ENFORCED
		end
	},
	WeaponMountingMovementExit = {
		isDependencyDisabled = function(arg_125_0, arg_125_1, arg_125_2, arg_125_3)
			return arg_125_2 == 1
		end,
		buildCondition = var_0_8
	},
	WeaponMountingMovementExitController = {
		buildCondition = var_0_8
	},
	ADSFOV = {
		defaultOptionValue = function(arg_126_0)
			return 1
		end
	},
	MouseAdsUseMonitorDistance = {
		isDependencyDisabled = function(arg_127_0, arg_127_1, arg_127_2, arg_127_3)
			return arg_127_2 == 1
		end,
		defaultOptionValue = function(arg_128_0)
			return 2
		end
	},
	VoiceChatRecordingMode = {
		action = function(arg_129_0, arg_129_1, arg_129_2)
			Dvar.DHEGHJJJHI("MOOMTQSMPS", arg_129_2 == 1)
		end,
		value = function(arg_130_0, arg_130_1, arg_130_2)
			return Dvar.IBEGCHEFE("MOOMTQSMPS") and 1 or 2
		end,
		defaultOptionValue = function(arg_131_0, arg_131_1, arg_131_2)
			return Dvar.DBGFIDHBFC("MOOMTQSMPS") and 1 or 2
		end,
		isDependencyDisabled = function(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
			if arg_132_3 == "OpenMicRecordingSensitivity" then
				return arg_132_2 == 1
			elseif arg_132_3 == "VoiceChat" then
				return arg_132_2 == 2
			end
		end
	},
	UseVoiceCom = {
		isDependencyDisabled = function(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
			return arg_133_2 == 1
		end,
		defaultOptionValue = function(arg_134_0)
			return 2
		end
	},
	DisplayGamma = {
		value = function(arg_135_0)
			return 1
		end,
		defaultOptionValue = function(arg_136_0)
			return 2
		end,
		buildCondition = function()
			return false
		end
	},
	VSync = {
		action = function(arg_138_0, arg_138_1, arg_138_2)
			if CONDITIONS.IsConsoleGame() then
				Dvar.DHEGHJJJHI("MPPNRRRPMP", arg_138_2)
			else
				Dvar.DFIJDJFIFD("MPPNRRRPMP", arg_138_2 - 1)
			end
		end,
		value = function(arg_139_0)
			if not Engine.CAFCFHEFDD() and Dvar.CFHDGABACF("NNSQSMTQPP") == 0 then
				return 1
			else
				return Dvar.IBEGCHEFE("MPPNRRRPMP") and 2 or 1
			end
		end,
		defaultOptionValue = function(arg_140_0)
			return 2
		end,
		disabled = function()
			return not Engine.CAFCFHEFDD() and Dvar.CFHDGABACF("NNSQSMTQPP") == 0
		end
	},
	CPUPriority = {
		defaultOptionValue = function(arg_142_0)
			return 2
		end
	},
	ParticleLighting = {
		value = function()
			local var_143_0 = {
				2,
				3,
				4,
				5
			}
			local var_143_1 = Dvar.CFHDGABACF("MTNMRSTQN")
			local var_143_2 = 1

			if var_143_1 <= var_143_0[1] then
				var_143_2 = 1
			elseif var_143_1 <= var_143_0[2] then
				var_143_2 = 2
			elseif var_143_1 <= var_143_0[3] then
				var_143_2 = 3
			elseif var_143_1 <= var_143_0[4] then
				var_143_2 = 4
			end

			return var_143_2
		end,
		action = function(arg_144_0, arg_144_1, arg_144_2)
			local var_144_0 = {
				2,
				3,
				4,
				5
			}
			local var_144_1 = {
				64,
				32,
				24,
				16
			}

			Dvar.DFIJDJFIFD("MTNMRSTQN", var_144_0[arg_144_2])
			Dvar.IICIFEEDC("PSTSNKNPR", var_144_1[arg_144_2])
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
		defaultOptionValue = function(arg_146_0)
			return 1
		end,
		action = function(arg_147_0, arg_147_1, arg_147_2)
			Dvar.DHEGHJJJHI("MPRNRNTNNQ", arg_147_2 == 1)
		end
	},
	VoiceChatMuteAllStrategy = {
		action = function(arg_148_0, arg_148_1, arg_148_2)
			local var_148_0 = arg_148_2 ~= MuteStrategy.MuteStrategyMuteAll + 1

			Dvar.DHEGHJJJHI("cl_voice", var_148_0)
			Lobby.HCCAGAJGJ(arg_148_1, arg_148_2 - 1)
		end,
		value = function(arg_149_0)
			return Lobby.BJFFJACJDD(arg_149_0) + 1
		end,
		isDependencyDisabled = function(arg_150_0, arg_150_1, arg_150_2, arg_150_3)
			return arg_150_2 == 2
		end,
		defaultOptionValue = function(arg_151_0)
			return Engine.IEBBJFBE("voiceMuteStrategy", arg_151_0) + 1
		end
	},
	CrossPlay = {
		action = function(arg_152_0, arg_152_1, arg_152_2)
			local var_152_0 = Engine.BBHCDCACGA(arg_152_1, arg_152_2 == OPTIONS.disableButtonOptions.ENABLED)

			if Lobby.GFFECBCCF() or CONDITIONS.IsSingleplayer() then
				if arg_152_2 == OPTIONS.disableButtonOptions.ENABLED then
					Dvar.DHEGHJJJHI("QOTNQOSRN", true)
					Social.CEFBABBCGD(arg_152_1, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_WARNING"))
				else
					Social.CEFBABBCGD(arg_152_1, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_DISABLED"))
				end
			end

			if var_152_0 then
				ACTIONS.UploadStats(arg_152_0, arg_152_1)

				if not Engine.CAADCDEEIA() and enabled == 0 and Friends.BAGCHIDGCC() then
					Engine.DAGFFDGFII("xstopprivateparty 1 1")
					Engine.DAGFFDGFII("xstartprivateparty")
					LUI.FlowManager.RequestPopupMenu(nil, "CrossPlayDisabledPrivatePartyBackoutMessage", true, arg_152_1, false, {}, nil, true, true)
				end
			end
		end,
		value = function(arg_153_0)
			return Engine.FIDIEBFAG(arg_153_0) and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end,
		defaultOptionValue = function(arg_154_0)
			if Engine.ECAJCAJJGF() or Engine.DJFGIIBCBH(arg_154_0) then
				return 1
			else
				return 2
			end
		end,
		disabled = function(arg_155_0)
			return not Engine.DJFGIIBCBH(arg_155_0)
		end,
		buildCondition = function(arg_156_0)
			return not Engine.ECAJCAJJGF()
		end
	},
	Adapter = {
		value = function()
			local var_157_0 = Dvar.DHEEJCCJBH("MPLSTSPKPT")

			return (var_0_0(Engine.CJCDDGBHJI(), var_157_0))
		end,
		action = function(arg_158_0, arg_158_1, arg_158_2)
			local var_158_0 = Engine.CJCDDGBHJI()

			Dvar.BDEHAEGHAF("MPLSTSPKPT", var_158_0[arg_158_2])
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
		action = function(arg_161_0, arg_161_1)
			LUI.FlowManager.RequestAddMenu("AdvancedVideoOptions", true, arg_161_1)
		end
	},
	AimAssist = {
		action = function(arg_162_0, arg_162_1, arg_162_2)
			Engine.DFJDIFJEGA("hasPlayerChangedAimAssistSetting", 1, arg_162_1)

			if arg_162_2 == 1 then
				Engine.DFJDIFJEGA("autoAim", 0, arg_162_1)
				Engine.DFJDIFJEGA("targetAssist", 0, arg_162_1)
			else
				Engine.DFJDIFJEGA("autoAim", 1, arg_162_1)
				Engine.DFJDIFJEGA("targetAssist", 1, arg_162_1)
				Engine.DFJDIFJEGA("aimAssistType", arg_162_2 - 1, arg_162_1)
			end
		end,
		defaultOptionValue = function(arg_163_0)
			if Engine.IEBBJFBE("autoAim") then
				return Engine.IEBBJFBE("aimAssistType") + 1
			else
				return 1
			end
		end,
		value = function(arg_164_0)
			if not Engine.BECCFCBIAA("autoAim", arg_164_0) then
				return 1
			else
				return Engine.BECCFCBIAA("aimAssistType", arg_164_0) + 1
			end
		end,
		disabled = var_0_2
	},
	AimResponseCurveType = {
		action = function(arg_165_0, arg_165_1, arg_165_2)
			Engine.DFJDIFJEGA("aimResponseCurveType", arg_165_2, arg_165_1)
		end,
		value = function(arg_166_0)
			return Engine.BECCFCBIAA("aimResponseCurveType", arg_166_0)
		end,
		defaultOptionValue = function(arg_167_0, arg_167_1)
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
		action = function(arg_169_0, arg_169_1, arg_169_2)
			Engine.DEEDAHEFAJ(arg_169_1, arg_169_2)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_169_1)
		end,
		defaultOptionValue = function(arg_170_0, arg_170_1)
			return Engine.IEBBJFBE("aimAssistType")
		end,
		value = function(arg_171_0)
			return Engine.BECCFCBIAA("aimAssistType", arg_171_0)
		end
	},
	AntiAliasing = {
		labels = function()
			local var_172_0 = {
				Engine.CBBHFCGDIC("MENU/OFF"),
				Engine.CBBHFCGDIC("MENU/SMAA_1X")
			}

			if Engine.CGDBBICBA() then
				var_172_0[#var_172_0 + 1] = Engine.CBBHFCGDIC("MENU/SMAA_TEMPORAL")
				var_172_0[#var_172_0 + 1] = Engine.CBBHFCGDIC("MENU/FILMIC_SMAA_T2X")
			end

			return var_172_0
		end,
		onDependencyParentRefresh = function(arg_173_0, arg_173_1, arg_173_2, arg_173_3, arg_173_4)
			if arg_173_3 == "DXR" and arg_173_4 ~= OPTIONS.disableButtonOptions.DISABLED then
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
		value = function(arg_177_0)
			local var_177_0 = Dvar.CFHDGABACF("QKKMRRLRR")

			return (LUI.clamp(var_177_0 - 1, 1, 6))
		end,
		action = function(arg_178_0, arg_178_1, arg_178_2)
			local var_178_0 = ({
				0,
				3,
				4,
				5,
				6
			})[arg_178_2]

			Dvar.DFIJDJFIFD("QKKMRRLRR", var_178_0)

			local var_178_1 = OPTIONS.InitOptionsList(arg_178_0, arg_178_1)
			local var_178_2 = OPTIONS.GetOptionsDataByIdentifier(arg_178_0, arg_178_1, var_178_1, "HudBoundsH", CSV.generalOptions)
			local var_178_3 = OPTIONS.GetOptionsDataByIdentifier(arg_178_0, arg_178_1, var_178_1, "HudBoundsV", CSV.generalOptions)
			local var_178_4 = var_178_2.defaultOptionValue(arg_178_0, arg_178_1)
			local var_178_5 = var_178_3.defaultOptionValue(arg_178_0, arg_178_1)

			Dvar.IICIFEEDC(var_178_2.dvar, var_178_4)
			Dvar.IICIFEEDC(var_178_3.dvar, var_178_5)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_178_1)
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
		action = function(arg_182_0, arg_182_1, arg_182_2)
			Engine.DFJDIFJEGA("autoSprintGamepad", arg_182_2 - 1, arg_182_1)
		end,
		defaultOptionValue = function(arg_183_0, arg_183_1)
			return 1
		end,
		value = function(arg_184_0)
			return Engine.BECCFCBIAA("autoSprintGamepad", arg_184_0) + 1
		end
	},
	AutoSprintKBM = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("OLMPNPQOML")
		end,
		action = function(arg_186_0, arg_186_1, arg_186_2)
			Engine.DFJDIFJEGA("autoSprintKBM", arg_186_2 - 1, arg_186_1)
		end,
		defaultOptionValue = function(arg_187_0, arg_187_1)
			return 1
		end,
		value = function(arg_188_0)
			return Engine.BECCFCBIAA("autoSprintKBM", arg_188_0) + 1
		end
	},
	Bandwidth = {
		name = function()
			local var_189_0 = NetworkInfo.HGEFAEJCE()

			return Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH", var_189_0)
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
		value = function(arg_191_0)
			local var_191_0 = (Dvar.BJJCJHDBII("NMRKMSMTOO") - SliderBounds.Brightness.DvarMin) / (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) * 100

			return (LUI.clamp(var_191_0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max))
		end,
		defaultOptionValue = function(arg_192_0)
			local var_192_0 = (Dvar.DBGFIDHBFC("NMRKMSMTOO") - SliderBounds.Brightness.DvarMin) / (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) * 100

			return (LUI.clamp(var_192_0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max))
		end,
		action = function(arg_193_0, arg_193_1, arg_193_2)
			local var_193_0 = LUI.clamp(arg_193_2, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max) / 100 * (SliderBounds.Brightness.DvarMax - SliderBounds.Brightness.DvarMin) + SliderBounds.Brightness.DvarMin

			Dvar.IICIFEEDC("NMRKMSMTOO", var_193_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_193_1)

			if arg_193_0:GetCurrentMenu() then
				arg_193_0:dispatchEventToCurrentMenu({
					name = "brightness_updated"
				})
			end
		end,
		specificAction = function(arg_194_0, arg_194_1, arg_194_2)
			local var_194_0 = arg_194_1.SetActive

			function arg_194_1.SetActive(arg_195_0, arg_195_1)
				local var_195_0 = var_194_0(arg_195_0, arg_195_1)

				arg_194_0:processEvent({
					name = "brightness_over"
				})

				if arg_194_0:GetCurrentMenu() then
					arg_194_0:dispatchEventToCurrentMenu({
						name = "brightness_over",
						controller = arg_194_2,
						index = value
					})
				end

				return var_195_0
			end

			local var_194_1 = arg_194_1.RemoveActive

			function arg_194_1.RemoveActive(arg_196_0, arg_196_1)
				local var_196_0 = var_194_1(arg_196_0, arg_196_1)

				arg_194_0:processEvent({
					name = "brightness_up"
				})

				if arg_194_0:GetCurrentMenu() then
					arg_194_0:dispatchEventToCurrentMenu({
						name = "brightness_up",
						controller = arg_194_2,
						index = value
					})
				end

				return var_196_0
			end

			arg_194_1:addEventHandler("button_up", function(arg_197_0, arg_197_1)
				if arg_197_0.isBootOptions then
					arg_194_0:processEvent({
						name = "brightness_up"
					})

					if arg_194_0:GetCurrentMenu() then
						arg_194_0:dispatchEventToCurrentMenu({
							name = "brightness_up",
							controller = arg_194_2,
							index = value
						})
					end
				end
			end)
			arg_194_1:addEventHandler("optimal_video_update", function(arg_198_0, arg_198_1)
				local var_198_0 = LUI.clamp(Dvar.BJJCJHDBII("NMRKMSMTOO"), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max)

				arg_194_1:SetCurrentValue(var_198_0)
			end)
		end,
		customPreviewButtonAction = function(arg_199_0, arg_199_1)
			LUI.FlowManager.RequestAddMenu("BootBrightness", true, arg_199_1, false)
		end,
		buildCondition = function(arg_200_0)
			return not Engine.DJDAJEJDE() and Engine.BFDACIJIAD(arg_200_0)
		end
	},
	SDRColorSpace = {
		labels = function()
			return {
				Engine.JCBDICCAH("2.2 (sRGB)"),
				Engine.JCBDICCAH("2.4 (BT1886)")
			}
		end,
		action = function(arg_202_0, arg_202_1, arg_202_2)
			local var_202_0 = Dvar.DCEBHAJGCJ("NRQNOQMOPS")

			arg_202_2 = var_0_9(var_202_0, arg_202_2)

			Dvar.DAACJFEEDC("NRQNOQMOPS", arg_202_2)
		end,
		value = function(arg_203_0)
			local var_203_0 = Dvar.DCEBHAJGCJ("NRQNOQMOPS")
			local var_203_1 = Dvar.DHEEJCCJBH("NRQNOQMOPS")

			return var_0_0(var_203_0, var_203_1)
		end
	},
	CinematicsVolume = {
		disabled = var_0_4
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
		action = function(arg_206_0, arg_206_1, arg_206_2, arg_206_3)
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountOptionsPopup", true, arg_206_1, false, {}, nil, true, true)
		end,
		buildCondition = function(arg_207_0)
			local var_207_0 = false

			if Engine.DDJFBBJAIG() then
				var_207_0 = IsOnlineMatch() and CODACCOUNT.IsEnabled() and not Engine.DBAEJAHFGJ(arg_207_0)
			end

			return var_207_0
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
	MotionBlur = {
		buildCondition = var_0_3
	},
	WeaponBlur = {
		buildCondition = var_0_3
	},
	ControllerSound = {
		action = function(arg_210_0, arg_210_1)
			Dvar.DHEGHJJJHI("MNKONSOLT", not Dvar.IBEGCHEFE("MNKONSOLT"))
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_210_1)
		end,
		buildCondition = function()
			return Engine.CIEGIACHAE()
		end
	},
	ControllerMinDeadzone = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NPQOMTNPOQ")
		end
	},
	CopyKeysFromOtherMode = {
		name = function()
			local var_213_0 = "LUA_MENU_PC/COPY_KEYS_MP"

			if Engine.CAADCDEEIA() then
				var_213_0 = "LUA_MENU_PC/COPY_KEYS_SP"
			end

			return Engine.CBBHFCGDIC(var_213_0)
		end,
		description = function()
			local var_214_0 = "LUA_MENU_PC/COPY_KEYS_MP_DESC"

			if Engine.CAADCDEEIA() then
				var_214_0 = "LUA_MENU_PC/COPY_KEYS_SP_DESC"
			end

			return Engine.CBBHFCGDIC(var_214_0)
		end,
		action = function(arg_215_0, arg_215_1)
			LUI.FlowManager.RequestPopupMenu(nil, "CopyKeysFromOtherMode", true, arg_215_1)
		end,
		disabled = var_0_5
	},
	CPUTime = {
		disabled = var_0_4
	},
	GeneralSubCategoryGameInstalls = {
		buildCondition = function(arg_216_0)
			return Engine.DDJFBBJAIG() and Dvar.IBEGCHEFE("PPMTTRNQM") and Engine.CFHBIHABCB(arg_216_0) and not CONDITIONS.IsLaunchChunk()
		end
	},
	GameInstalls = {
		action = function(arg_217_0, arg_217_1, arg_217_2)
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_217_1, false)
		end,
		buildCondition = function(arg_218_0)
			return Engine.DDJFBBJAIG() and Dvar.IBEGCHEFE("PPMTTRNQM") and Engine.CFHBIHABCB(arg_218_0) and not CONDITIONS.IsLaunchChunk()
		end
	},
	GeneralSubCategoryCredits = {
		buildCondition = function()
			return Engine.DDJFBBJAIG()
		end
	},
	Credits = {
		action = function(arg_220_0, arg_220_1, arg_220_2)
			LUI.FlowManager.RequestAddMenu("CreditsMenu", true, arg_220_1, false, {
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
	DisplayAnonymousGamertags = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("QNOOPTKTT")
		end
	},
	DisplayMode = {
		labels = function()
			local var_225_0 = {}

			if Engine.BAADCHEJJD() then
				var_225_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/MODE_WINDOWED"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_BORDERLESS"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_EXTENDED_WINDOW")
				}
			else
				var_225_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/MODE_WINDOWED"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_BORDERLESS"),
					Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN_EXTENDED_WINDOW")
				}
			end

			return var_225_0
		end,
		action = function(arg_226_0, arg_226_1, arg_226_2)
			local var_226_0 = arg_226_2 - 1

			if not Engine.BAADCHEJJD() and arg_226_2 > 1 then
				var_226_0 = arg_226_2
			end

			Dvar.DFIJDJFIFD("NNSQSMTQPP", var_226_0)
		end,
		value = function(arg_227_0)
			local var_227_0 = Dvar.CFHDGABACF("NNSQSMTQPP") + 1

			if not Engine.BAADCHEJJD() and var_227_0 > 1 then
				var_227_0 = var_227_0 - 1
			end

			return var_227_0
		end,
		specificAction = function(arg_228_0, arg_228_1, arg_228_2)
			arg_228_1:addEventHandler("onVideoChange", function(arg_229_0, arg_229_1)
				arg_229_0:processEvent({
					name = "seek_value"
				})
			end)
		end,
		description = Engine.BEFACAIFDD() and Engine.CBBHFCGDIC("MENU/DISPLAY_MODE_DESC_ALT") or Engine.CBBHFCGDIC("MENU/DISPLAY_MODE_DESC"),
		isDependencyDisabled = function(arg_230_0, arg_230_1, arg_230_2, arg_230_3)
			if arg_230_3 == "RefreshRate" or arg_230_3 == "ImageQuality" then
				return arg_230_2 ~= 2
			elseif arg_230_3 == "Monitor" then
				return arg_230_2 ~= 2 and arg_230_2 ~= 3
			end
		end
	},
	SSR = {
		action = function(arg_231_0, arg_231_1, arg_231_2)
			local var_231_0 = Dvar.DCEBHAJGCJ("NNTTTQSRN")

			arg_231_2 = var_0_9(var_231_0, arg_231_2)

			Dvar.BDEHAEGHAF("NNTTTQSRN", arg_231_2)
		end,
		value = function(arg_232_0)
			local var_232_0 = Dvar.DCEBHAJGCJ("NNTTTQSRN")
			local var_232_1 = Dvar.DHEEJCCJBH("NNTTTQSRN")

			return var_0_0(var_232_0, var_232_1)
		end
	},
	DXR = {
		labels = function()
			local var_233_0 = {}

			if Dvar.IBEGCHEFE("LKLOMSPQSR") then
				var_233_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
					Engine.CBBHFCGDIC("LUA_MENU/ENABLED"),
					Engine.CBBHFCGDIC("MENU/QUALITY_ULTRA")
				}
			else
				var_233_0 = {
					Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
					Engine.CBBHFCGDIC("LUA_MENU/ENABLED")
				}
			end

			return var_233_0
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
		isDependencyDisabled = function(arg_235_0, arg_235_1, arg_235_2, arg_235_3)
			if arg_235_3 == "AntiAliasing" then
				return arg_235_2 ~= OPTIONS.disableButtonOptions.DISABLED
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
		action = function(arg_238_0, arg_238_1, arg_238_2)
			Dvar.IICIFEEDC("MPTTMMKST", arg_238_2 / 100)
		end,
		value = function(arg_239_0, arg_239_1)
			return Dvar.BJJCJHDBII("MPTTMMKST") * 100
		end,
		defaultOptionValue = function(arg_240_0)
			return Dvar.DBGFIDHBFC("MPTTMMKST") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	EnglishVoiceOvers = {
		action = function(arg_241_0, arg_241_1, arg_241_2)
			if arg_241_2 > 1 then
				Engine.CDFHJHDEFC(true)
			else
				Engine.CDFHJHDEFC(false)
			end
		end,
		value = function(arg_242_0, arg_242_1)
			return Engine.EEHHCFBGC() and 2 or 1
		end,
		buildCondition = function()
			return Engine.CCGEHCIECB()
		end,
		defaultOptionValue = function(arg_244_0, arg_244_1)
			return Engine.EEHHCFBGC() and 2 or 1
		end,
		disabled = function()
			return not Engine.CCGEHCIECB()
		end
	},
	EquipmentBehavior = {
		action = function(arg_246_0, arg_246_1, arg_246_2)
			Engine.DAGFFDGFII("profile_toggleHoldGrenade")
		end,
		defaultOptionValue = function(arg_247_0)
			return 1
		end,
		value = function(arg_248_0)
			return Engine.BECCFCBIAA("grenadeHold", arg_248_0) and 1 or 2
		end
	},
	EquipmentBehaviorKBM = {
		action = function(arg_249_0, arg_249_1, arg_249_2)
			Engine.DAGFFDGFII("profile_toggleHoldGrenadeKBM")
		end,
		defaultOptionValue = function(arg_250_0)
			return 1
		end,
		value = function(arg_251_0)
			return Engine.BECCFCBIAA("grenadeHoldKBM", arg_251_0) == 1 and 1 or 2
		end
	},
	FilmGrainAttenPC = {
		action = function(arg_252_0, arg_252_1, arg_252_2)
			local var_252_0 = LUI.clamp(arg_252_2, 0, 1)

			Engine.DFJDIFJEGA("filmGrainAttenuation", var_252_0, arg_252_1)
			Dvar.IICIFEEDC("LKOLMLQRRT", var_252_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_252_1)
		end
	},
	FilmGrainAttenConsole = {
		action = function(arg_253_0, arg_253_1, arg_253_2)
			local var_253_0 = LUI.clamp(arg_253_2, 0, 1)

			Engine.DFJDIFJEGA("filmGrainAttenuation", var_253_0, arg_253_1)
			Dvar.IICIFEEDC("LKOLMLQRRT", var_253_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_253_1)
		end,
		buildCondition = var_0_3
	},
	Filter = {
		action = function(arg_254_0, arg_254_1, arg_254_2)
			Engine.DFJDIFJEGA("mouseFilter", arg_254_2 / 10, arg_254_1)
		end,
		value = function(arg_255_0)
			return Engine.BECCFCBIAA("mouseFilter", arg_255_0) * 10
		end
	},
	FilterOld = {
		action = function(arg_256_0, arg_256_1, arg_256_2)
			Engine.DFJDIFJEGA("mouseSmoothing", arg_256_2, arg_256_1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_256_1)
		end
	},
	FirstParty = {
		name = function()
			local var_257_0 = OPTIONS.FirstPartyServersLabel()

			if NetworkInfo.DDADIHAFHH() then
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED", var_257_0)
			else
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED", var_257_0)
			end
		end,
		description = function()
			local var_258_0 = OPTIONS.FirstPartyServersLabel()

			if NetworkInfo.DDADIHAFHH() then
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED_DESC", var_258_0)
			else
				return Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED_DESC", var_258_0)
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
		action = function(arg_269_0, arg_269_1, arg_269_2)
			Engine.DFJDIFJEGA("gpadUseReloadProfile", arg_269_2 - 1, arg_269_1)
		end,
		defaultOptionValue = function(arg_270_0, arg_270_1)
			return 1
		end,
		value = function(arg_271_0)
			return Engine.BECCFCBIAA("gpadUseReloadProfile", arg_271_0) + 1
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
		disabled = function(arg_273_0)
			local var_273_0 = false

			if not OPTIONS.DualInputConnected(arg_273_0) or not OPTIONS.IsInputSwapEnabled() or IsMlgGameBattlesInputLock() or Tournament.BEAIBEGFFB() then
				var_273_0 = true
			end

			return var_273_0
		end,
		value = function(arg_274_0)
			return Engine.BECCFCBIAA("gpadEnabled", arg_274_0) and 1 or 2
		end,
		action = function(arg_275_0, arg_275_1, arg_275_2)
			Engine.CIGGHDDHGJ(arg_275_1, not arg_275_2)
			Engine.DAGFFDGFII("updategamerprofile")
		end,
		specificAction = function(arg_276_0, arg_276_1, arg_276_2)
			local function var_276_0()
				arg_276_1:SetButtonDisabled(not OPTIONS.DualInputConnected(arg_276_2) or not OPTIONS.IsInputSwapEnabled())
			end

			function arg_276_1.GetSpecificImage(arg_278_0)
				local var_278_0 = ""
				local var_278_1 = Engine.GGFCHCDDE(arg_276_2)

				if not Engine.HDGDBCJFG() then
					if var_278_1 then
						var_278_0 = "_ps4"
					end
				elseif Engine.BIAEDEEBJI(arg_276_2) then
					var_278_0 = "_vita"
				elseif var_278_1 then
					var_278_0 = "_ps4"
				end

				if arg_278_0:find("_ps4") then
					arg_278_0 = arg_278_0:sub(1, -5)
				elseif arg_278_0:find("_vita") then
					arg_278_0 = arg_278_0:sub(1, -6)
				end

				if var_278_0 == "_ps4" or var_278_0 == "_vita" then
					return arg_278_0 .. var_278_0
				else
					return arg_278_0
				end
			end

			arg_276_1:addEventHandler("input_method_changed", var_276_0)
			arg_276_1:addEventHandler("input_connection", var_276_0)
		end
	},
	GraphicContent = {
		disabled = var_0_4,
		value = function(arg_279_0)
			return 1
		end
	},
	ImageQuality = {
		labels = function()
			return Engine.DJDAJBFCEE()
		end,
		action = function(arg_281_0, arg_281_1, arg_281_2)
			Dvar.BDEHAEGHAF("LTPQTTPSOR", arg_281_0.displayResolutions and arg_281_0.displayResolutions[arg_281_2] or Engine.DJDAJBFCEE()[arg_281_2])
		end,
		value = function(arg_282_0)
			local var_282_0 = Engine.DJDAJBFCEE()

			return var_0_10("LTPQTTPSOR", var_282_0)
		end,
		onDependencyParentRefresh = function(arg_283_0, arg_283_1, arg_283_2, arg_283_3, arg_283_4)
			if arg_283_3 == "Monitor" then
				local var_283_0 = arg_283_0.displayResolutions and arg_283_0.displayResolutions[arg_283_2] or Engine.DJDAJBFCEE()[arg_283_2]

				arg_283_0.displayResolutions = Engine.DJDAJBFCEE(arg_283_4 - 1)

				arg_283_0:UpdateLabels(arg_283_0.displayResolutions)

				if arg_283_2 == 1 then
					return 1
				else
					return var_0_0(arg_283_0.displayResolutions, var_283_0) or 1
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
		action = function(arg_295_0, arg_295_1, arg_295_2)
			local var_295_0 = OPTIONS.hitMarkerSoundAliases[arg_295_2]

			Engine.CFBBHFFBH(arg_295_1, var_295_0)
		end,
		customPreviewButtonAction = function(arg_296_0, arg_296_1)
			LUI.FlowManager.RequestAddMenu("HitMarkerPreview", true, arg_296_1)
		end,
		value = function(arg_297_0)
			local var_297_0 = Engine.BECCFCBIAA("sndHitMarkerAlias", arg_297_0)

			return (var_0_0(OPTIONS.hitMarkerSoundAliases, var_297_0))
		end,
		defaultOptionValue = function(arg_298_0)
			return 3
		end
	},
	HitMarkersSoundEffect = {
		disabled = var_0_4
	},
	HitMarkersVisuals = {
		disabled = var_0_4
	},
	HudBoundsH = {
		action = function(arg_299_0, arg_299_1, arg_299_2)
			Dvar.IICIFEEDC("SPLRMSQLK", arg_299_2 / 100)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_299_1)
		end,
		value = function(arg_300_0)
			return Dvar.BJJCJHDBII("SPLRMSQLK") * 100
		end,
		defaultOptionValue = function(arg_301_0)
			local var_301_0 = Dvar.DBGFIDHBFC("SPLRMSQLK")
			local var_301_1 = 2.3333333333333335
			local var_301_2 = 1.5999999999999999

			if CoD.AspectRatioCompare(var_301_1) == LUI.COMPARE.higher then
				local var_301_3 = Engine.CEGEEHGGBA()
				local var_301_4 = var_301_3 - var_301_2

				if var_301_4 > 0 then
					var_301_0 = 1 - (var_301_3 - var_301_1) / var_301_4
				end
			end

			return var_301_0 * 100
		end
	},
	HudBoundsV = {
		action = function(arg_302_0, arg_302_1, arg_302_2)
			Dvar.IICIFEEDC("MLMOSSMNOO", arg_302_2 / 100)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_302_1)
		end,
		value = function(arg_303_0)
			return Dvar.BJJCJHDBII("MLMOSSMNOO") * 100
		end,
		defaultOptionValue = function(arg_304_0)
			return Dvar.DBGFIDHBFC("MLMOSSMNOO") * 100
		end
	},
	InventoryKeybindsExpander = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled()
		end
	},
	InvertPitchGamepad = {
		action = function(arg_306_0, arg_306_1, arg_306_2)
			if arg_306_2 == 3 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 1, arg_306_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 0, arg_306_1)
			elseif arg_306_2 == 2 then
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_306_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 1, arg_306_1)
			else
				Engine.DFJDIFJEGA("invertPitchGamepad", 0, arg_306_1)
				Engine.DFJDIFJEGA("invertPitchFlyingGamepad", 0, arg_306_1)
			end
		end,
		value = function(arg_307_0)
			local var_307_0 = Engine.BECCFCBIAA("invertPitchGamepad", arg_307_0)
			local var_307_1 = Engine.BECCFCBIAA("invertPitchFlyingGamepad", arg_307_0)

			if var_307_0 then
				return 3
			elseif var_307_1 then
				return 2
			else
				return 1
			end
		end
	},
	InvertPitchKBM = {
		action = function(arg_308_0, arg_308_1, arg_308_2)
			Engine.DAGFFDGFII("profile_invertPitchKBM " .. tostring(arg_308_2 - 1), arg_308_1)
		end,
		value = function(arg_309_0)
			return Engine.BECFECEHDB(arg_309_0) + 1
		end
	},
	JuggernautDefaultMusic = {
		action = function(arg_310_0, arg_310_1, arg_310_2)
			Engine.DFJDIFJEGA("juggMusicEnableDefault", arg_310_2 - 1, arg_310_1)
		end,
		defaultOptionValue = function(arg_311_0, arg_311_1)
			return 2
		end,
		value = function(arg_312_0)
			if Engine.BECCFCBIAA("juggMusicEnableDefault", arg_312_0) then
				return 2
			else
				return 1
			end
		end
	},
	LanguageSelect = {
		labels = OPTIONS.GetLanguageLabels,
		defaultOptionValue = function(arg_313_0)
			local var_313_0 = OPTIONS.GetLanguageIndices()
			local var_313_1 = Engine.DGAIDIEIAC()

			for iter_313_0 = 1, #var_313_0 do
				if var_313_0[iter_313_0] == var_313_1 then
					return iter_313_0
				end
			end
		end,
		value = function(arg_314_0)
			local var_314_0 = OPTIONS.GetLanguageIndices()
			local var_314_1 = Engine.DGAIDIEIAC()

			for iter_314_0 = 1, #var_314_0 do
				if var_314_0[iter_314_0] == var_314_1 then
					return iter_314_0
				end
			end
		end,
		action = function(arg_315_0, arg_315_1, arg_315_2)
			local function var_315_0(arg_316_0)
				local var_316_0 = {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC("LANGUAGE_SELECT/CONFIRM_CHANGE"),
					yesAction = function(arg_317_0, arg_317_1)
						Engine.CEHDAACIJA(arg_317_1, arg_316_0)
						Engine.DAGFFDGFII("updategamerprofile")
						DCache.EAEHIJBBCD(arg_316_0)
						Engine.BHIJFFCAEB("")
					end,
					noAction = function()
						arg_315_0:processEvent({
							name = "seek_value",
							controllerIndex = arg_315_1
						})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_315_1, false, var_316_0)
			end

			local var_315_1 = GetLanguageCode(GetCurrentLanguage())
			local var_315_2 = OPTIONS.GetLanguageIndices()[arg_315_2]

			if var_315_1 ~= var_315_2 then
				var_315_0(var_315_2)
			end
		end
	},
	LODRamp = {
		value = function(arg_319_0)
			return 3 - Dvar.CFHDGABACF("LPNQOKLRQR")
		end,
		action = function(arg_320_0, arg_320_1, arg_320_2)
			local var_320_0 = #arg_320_0.labels

			Dvar.DFIJDJFIFD("LPNQOKLRQR", var_320_0 - arg_320_2)
		end
	},
	LookHorzSens = {
		labels = OPTIONS.GetSensitivityLabels(),
		action = function(arg_321_0, arg_321_1, arg_321_2)
			Engine.CBGBBHHIJE(arg_321_1, arg_321_2 - 1)
		end,
		value = function(arg_322_0)
			return Engine.DIDFDDCCDE(arg_322_0) + 1
		end,
		defaultOptionValue = function(arg_323_0)
			return Engine.BHFJEBACDF() + 1
		end,
		disabled = var_0_2
	},
	LookVertSens = {
		labels = OPTIONS.GetSensitivityLabels(),
		action = function(arg_324_0, arg_324_1, arg_324_2)
			Engine.HGJFFDFCE(arg_324_1, arg_324_2 - 1)
		end,
		value = function(arg_325_0)
			return Engine.IFJCDCCAI(arg_325_0) + 1
		end,
		defaultOptionValue = function(arg_326_0)
			return Engine.BHFJEBACDF() + 1
		end,
		disabled = var_0_2
	},
	StickLayoutBootOptions = {
		type = "Dropdown",
		name = Engine.CBBHFCGDIC("PLATFORM/THUMBSTICK_LAYOUT"),
		description = Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"),
		labels = OPTIONS.GetStickLayoutLabels(),
		action = function(arg_327_0, arg_327_1, arg_327_2)
			if arg_327_0:GetCurrentMenu() then
				arg_327_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_327_1,
					index = arg_327_2
				})
			end
		end,
		onRefresh = function(arg_328_0, arg_328_1, arg_328_2)
			if arg_328_0:GetCurrentMenu() then
				arg_328_0:dispatchEventToCurrentMenu({
					name = "stickLayout_updated",
					controller = arg_328_1,
					index = arg_328_2
				})
			end
		end,
		specialDefaultReset = function(arg_329_0, arg_329_1)
			arg_329_0:dispatchEventToCurrentMenu({
				index = 1,
				name = "stickLayout_updated",
				controller = arg_329_1
			})
		end,
		value = function(arg_330_0)
			local var_330_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_330_0)
			local var_330_1 = OPTIONS.stickLayoutStrings[var_330_0]

			return (var_0_0(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_330_1)))
		end,
		specificAction = function(arg_331_0, arg_331_1, arg_331_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_331_0, arg_331_1, {
				showLayout = true,
				name = "stickLayout"
			})
		end,
		defaultOptionValue = function(arg_332_0)
			return 1
		end
	},
	ButtonLayoutBootOptions = {
		type = "Dropdown",
		name = Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT"),
		description = Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"),
		labels = OPTIONS.GetCurrentButtonLayoutLabels,
		action = function(arg_333_0, arg_333_1, arg_333_2)
			if arg_333_0:GetCurrentMenu() then
				arg_333_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_333_1,
					index = arg_333_2
				})
			end
		end,
		onRefresh = function(arg_334_0, arg_334_1, arg_334_2)
			if arg_334_0:GetCurrentMenu() then
				arg_334_0:dispatchEventToCurrentMenu({
					name = "buttonLayout_updated",
					controller = arg_334_1,
					index = arg_334_2
				})
			end
		end,
		value = function(arg_335_0)
			local var_335_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_335_0)

			if string.match(var_335_0, "_alt$") then
				var_335_0 = string.gsub(var_335_0, "_alt", "")
			end

			local var_335_1 = OPTIONS.buttonLayoutStrings[var_335_0]

			return (var_0_0(OPTIONS.GetButtonLayoutLabels(), Engine.CBBHFCGDIC(var_335_1)))
		end,
		specificAction = function(arg_336_0, arg_336_1, arg_336_2)
			OPTIONS.SetActiveOptionCallbackEvents(arg_336_0, arg_336_1, {
				showLayout = true,
				name = "buttonLayout"
			})
		end,
		defaultOptionValue = function(arg_337_0)
			return 1
		end
	},
	VoiceChatChannel = {
		disabled = var_0_4
	},
	OpenMicRecordingSensitivity = {
		action = function(arg_338_0, arg_338_1, arg_338_2)
			Dvar.IICIFEEDC("MSKKKMTQNT", arg_338_2 * 655.36)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_338_1)
		end,
		value = function(arg_339_0)
			return Dvar.BJJCJHDBII("MSKKKMTQNT") / 655.36
		end,
		defaultOptionValue = function(arg_340_0)
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
		action = function(arg_341_0, arg_341_1, arg_341_2)
			Engine.BFIFFDCGAB(arg_341_1, arg_341_2 - 1)
		end,
		value = function(arg_342_0)
			return Engine.DDIFAGHHAB(arg_342_0) + 1
		end,
		defaultOptionValue = function(arg_343_0)
			return 1
		end,
		buildCondition = function(arg_344_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	MinimapRotation = {
		action = function(arg_345_0, arg_345_1, arg_345_2)
			local var_345_0 = arg_345_2 == 2

			Engine.CECAAEJABF(arg_345_1, var_345_0)
		end,
		value = function(arg_346_0)
			return Engine.BIEGEGDIGH(arg_346_0) and 2 or 1
		end,
		defaultOptionValue = function(arg_347_0)
			return 2
		end,
		buildCondition = function(arg_348_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	CompassCardinalDirectionText = {
		action = function(arg_349_0, arg_349_1, arg_349_2)
			local var_349_0 = arg_349_2 == 2

			Engine.DFDGCIDHJH(arg_349_1, var_349_0)
		end,
		value = function(arg_350_0)
			return Engine.BFDEDEGDFD(arg_350_0) and 2 or 1
		end,
		defaultOptionValue = function(arg_351_0)
			return 1
		end
	},
	MixPreset = {
		alwaysShowDefault = true,
		customPreviewButtonAction = function(arg_352_0, arg_352_1)
			LUI.FlowManager.RequestAddMenu("AudioMixPreset", true, arg_352_1)
		end,
		value = function()
			local var_353_0, var_353_1 = OPTIONS.GetCurrentAudioMixPreset()

			return var_353_1
		end,
		defaultOptionValue = function(arg_354_0)
			return 5
		end,
		action = function(arg_355_0, arg_355_1, arg_355_2)
			local var_355_0 = OPTIONS.GetMixPresets()

			Dvar.DFIJDJFIFD("PTKLRRLLQ", var_355_0[arg_355_2].value)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_355_1)
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
			local var_358_0 = Dvar.DHEEJCCJBH("MMMOQLSSOS")

			return var_0_0(Engine.BHEFDBJAAF(), var_358_0)
		end,
		action = function(arg_359_0, arg_359_1, arg_359_2)
			local var_359_0 = Engine.BHEFDBJAAF()

			Dvar.BDEHAEGHAF("MMMOQLSSOS", var_359_0[arg_359_2])
		end
	},
	Prone = {
		action = function(arg_360_0, arg_360_1, arg_360_2)
			Engine.DFJDIFJEGA("proneType", arg_360_2, arg_360_1)
		end,
		defaultOptionValue = function(arg_361_0)
			return Engine.IEBBJFBE("proneType")
		end,
		value = function(arg_362_0)
			return Engine.BECCFCBIAA("proneType", arg_362_0)
		end
	},
	Crouch = {
		action = function(arg_363_0, arg_363_1, arg_363_2)
			Engine.DFJDIFJEGA("crouchType", arg_363_2, arg_363_1)
		end,
		defaultOptionValue = function(arg_364_0)
			return Engine.IEBBJFBE("crouchType")
		end,
		value = function(arg_365_0)
			return Engine.BECCFCBIAA("crouchType", arg_365_0)
		end,
		isDependencyDisabled = function(arg_366_0, arg_366_1, arg_366_2, arg_366_3)
			if arg_366_3 == "SlideEnabledKeyboard" then
				return arg_366_2 == 2
			end
		end
	},
	MountConfig = {
		action = function(arg_367_0, arg_367_1, arg_367_2)
			Engine.CIAGIFEAIC(arg_367_1, arg_367_0.engineValueMap[arg_367_2])
		end,
		defaultOptionValue = function(arg_368_0)
			local var_368_0 = Engine.IEBBJFBE("mountButtonConfig")

			return var_368_0 < 4 and var_368_0 or var_368_0 - 3
		end,
		value = function(arg_369_0)
			local var_369_0 = Engine.BECCFCBIAA("mountButtonConfig", arg_369_0)

			return var_369_0 < 4 and var_369_0 or var_369_0 - 3
		end,
		onDependencyParentRefresh = function(arg_370_0, arg_370_1, arg_370_2, arg_370_3, arg_370_4)
			if arg_370_3 == "ADSHoldGamepad" then
				local var_370_0 = OPTIONS.GetMountConfigLabels()
				local var_370_1 = OPTIONS.GetMountConfigValues()
				local var_370_2 = arg_370_0.engineValueMap and arg_370_0.engineValueMap[arg_370_2] or var_370_1[arg_370_2]

				arg_370_0.engineValueMap = var_370_1

				if arg_370_4 == 2 then
					table.remove(var_370_0, 2)
					table.remove(var_370_1, 2)
				end

				arg_370_0:UpdateLabels(var_370_0)

				local var_370_3 = var_0_0(arg_370_0.engineValueMap, var_370_2)

				if var_370_3 then
					return var_370_3
				else
					return var_0_0(arg_370_0.engineValueMap, Engine.IEBBJFBE("mountButtonConfig"))
				end
			end
		end,
		buildCondition = var_0_8
	},
	MountConfigKBM = {
		labels = OPTIONS.GetMountConfigKBMLabels(),
		action = function(arg_371_0, arg_371_1, arg_371_2)
			Engine.IEGJEIHE(arg_371_1, arg_371_0.engineValueMap[arg_371_2])
		end,
		defaultOptionValue = function(arg_372_0)
			local var_372_0 = OPTIONS.GetMountConfigKBMValues()
			local var_372_1 = Engine.IEBBJFBE("mountButtonConfigKBM")

			return var_0_0(var_372_0, var_372_1)
		end,
		value = function(arg_373_0)
			local var_373_0 = OPTIONS.GetMountConfigKBMValues()
			local var_373_1 = Engine.BECCFCBIAA("mountButtonConfigKBM", arg_373_0)

			return var_0_0(var_373_0, var_373_1)
		end,
		isDependencyDisabled = function(arg_374_0, arg_374_1, arg_374_2, arg_374_3)
			return arg_374_2 == 1
		end,
		onDependencyParentRefresh = function(arg_375_0, arg_375_1, arg_375_2, arg_375_3, arg_375_4)
			if arg_375_3 == "ADSHoldKeyboard" then
				local var_375_0 = OPTIONS.GetMountConfigKBMLabels()
				local var_375_1 = OPTIONS.GetMountConfigKBMValues()
				local var_375_2 = arg_375_0.engineValueMap and arg_375_0.engineValueMap[arg_375_2] or var_375_1[arg_375_2]

				arg_375_0.engineValueMap = var_375_1

				if arg_375_4 == 2 then
					table.remove(var_375_0, 2)
					table.remove(var_375_1, 2)
				end

				arg_375_0:UpdateLabels(var_375_0)

				local var_375_3 = var_0_0(arg_375_0.engineValueMap, var_375_2)

				if var_375_3 then
					return var_375_3
				else
					return var_0_0(arg_375_0.engineValueMap, Engine.IEBBJFBE("mountButtonConfigKBM"))
				end
			end
		end,
		buildCondition = var_0_8
	},
	MountingExitDelay = {
		buildCondition = var_0_8
	},
	MouseSmoothingOld = {
		action = function(arg_376_0, arg_376_1, arg_376_2, arg_376_3)
			local var_376_0 = arg_376_3 / 10

			Dvar.IICIFEEDC(arg_376_2, var_376_0)
		end,
		value = function(arg_377_0, arg_377_1)
			return Dvar.BJJCJHDBII(arg_377_1) * 10
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
		action = function(arg_378_0, arg_378_1, arg_378_2)
			Dvar.IICIFEEDC("LRTMQRTPLO", arg_378_2 / 100)
		end,
		value = function(arg_379_0)
			return Dvar.BJJCJHDBII("LRTMQRTPLO") * 100
		end,
		defaultOptionValue = function(arg_380_0)
			return Dvar.DBGFIDHBFC("LRTMQRTPLO") * 100
		end
	},
	VoiceChatVolume = {
		action = function(arg_381_0, arg_381_1, arg_381_2)
			Dvar.IICIFEEDC("MPQSQTNRNO", arg_381_2 / 100)
		end,
		value = function(arg_382_0)
			return Dvar.BJJCJHDBII("MPQSQTNRNO") * 100
		end,
		defaultOptionValue = function(arg_383_0)
			return Dvar.DBGFIDHBFC("MPQSQTNRNO") * 100
		end
	},
	MusicVolume = {
		action = function(arg_384_0, arg_384_1, arg_384_2)
			Dvar.IICIFEEDC("LLPPPNKTSO", arg_384_2 / 100)
		end,
		value = function(arg_385_0)
			return Dvar.BJJCJHDBII("LLPPPNKTSO") * 100
		end,
		defaultOptionValue = function(arg_386_0)
			return Dvar.DBGFIDHBFC("LLPPPNKTSO") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	NATType = {
		name = function()
			local var_387_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_387_0] == nil then
				netdiagNat = "unknown"
			end

			if OPTIONS.natTypeDescUILabels[var_387_0] == nil then
				netdiagNat = "unknown"
			end

			return Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", OPTIONS.natTypeUILabels[var_387_0])
		end,
		description = function()
			local var_388_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_388_0] == nil then
				netdiagNat = "unknown"
			end

			if OPTIONS.natTypeDescUILabels[var_388_0] == nil then
				netdiagNat = "unknown"
			end

			return Engine.CBBHFCGDIC(OPTIONS.natTypeDescUILabels[var_388_0], var_388_0)
		end
	},
	OptimalVideo = {
		action = function(arg_389_0, arg_389_1)
			LUI.FlowManager.RequestPopupMenu(nil, "OptimalVideoNotice", true, arg_389_1)
		end
	},
	PartyInviteNotifications = {
		disabled = var_0_4,
		value = function(arg_390_0)
			return 1
		end
	},
	ParachuteAutoDeployGamepad = {
		buildCondition = function()
			local var_391_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_391_0
		end,
		action = function(arg_392_0, arg_392_1, arg_392_2)
			if arg_392_2 == 2 then
				arg_392_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployGamepadDisabled", arg_392_2, arg_392_1)
		end,
		value = function(arg_393_0)
			local var_393_0 = Engine.BECCFCBIAA("isParachuteAutoDeployGamepadDisabled", arg_393_0)

			if var_393_0 == 0 then
				var_393_0 = 2
			end

			return var_393_0
		end,
		defaultOptionValue = function(arg_394_0)
			return 2
		end
	},
	ParachuteAutoDeployKBM = {
		buildCondition = function()
			local var_395_0 = Engine.DGEFGAJIB() == 1

			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("NMMMNQPNTO") and not var_395_0
		end,
		action = function(arg_396_0, arg_396_1, arg_396_2)
			if arg_396_2 == 2 then
				arg_396_2 = 0
			end

			Engine.DFJDIFJEGA("isParachuteAutoDeployKBMDisabled", arg_396_2, arg_396_1)
		end,
		value = function(arg_397_0)
			local var_397_0 = Engine.BECCFCBIAA("isParachuteAutoDeployKBMDisabled", arg_397_0)

			if var_397_0 == 0 then
				var_397_0 = 2
			end

			return var_397_0
		end,
		defaultOptionValue = function(arg_398_0)
			return 2
		end
	},
	PeripheralLighting = {
		disabled = var_0_4,
		value = function(arg_399_0)
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
	ProfanityFilterEnabled = {
		buildCondition = function()
			return not IsLanguageArabic()
		end
	},
	PushToTalk = {
		action = function(arg_402_0, arg_402_1, arg_402_2)
			Dvar.DHEGHJJJHI("MOOMTQSMPS", arg_402_2 == 1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_402_1)
		end,
		value = function(arg_403_0)
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
			local var_405_0 = {}
			local var_405_1 = Engine.DJGJIJCACA()

			for iter_405_0, iter_405_1 in pairs(var_405_1) do
				table.insert(var_405_0, LUI.Round(tonumber(iter_405_1)))
			end

			return var_405_0
		end,
		value = function(arg_406_0)
			local var_406_0 = Dvar.DHEEJCCJBH("SOKNOQRPL")

			return var_0_0(Engine.DJGJIJCACA(), var_406_0)
		end,
		action = function(arg_407_0, arg_407_1, arg_407_2)
			local var_407_0 = Engine.DJGJIJCACA()

			Dvar.BDEHAEGHAF("SOKNOQRPL", var_407_0[arg_407_2])
		end
	},
	ResetControls = {
		type = "GenericButton",
		id = "ResetControls",
		name = Engine.CBBHFCGDIC("LUA_MENU/RESTORE_DEFAULT_CONTROLS"),
		description = Engine.CBBHFCGDIC("LUA_MENU/RESET_CONTROLS_DESC"),
		action = function(arg_408_0, arg_408_1)
			LUI.FlowManager.RequestPopupMenu(nil, "ResetControls", true, arg_408_1)
		end,
		disabled = var_0_5
	},
	Resolution = {
		name = function()
			return Engine.CBBHFCGDIC("MENU/VIDEO_MODE_EMPTY")
		end,
		action = function(arg_410_0, arg_410_1, arg_410_2)
			Dvar.DFIJDJFIFD("LNKPMNNMQM", arg_410_2)
		end,
		onRefresh = function(arg_411_0, arg_411_1, arg_411_2)
			if arg_411_0.displayResolutions and arg_411_0.imageQualityValue and arg_411_0.displayModeIndex then
				local var_411_0 = OPTIONS.CalculateViewportDimensions(arg_411_2, arg_411_0.displayModeIndex, arg_411_0.displayResolutions, arg_411_0.imageQualityValue)
				local var_411_1 = Engine.CBBHFCGDIC("MENU/VIDEO_MODE", LUI.Round(var_411_0[1]), LUI.Round(var_411_0[2]))

				arg_411_0.GenericOptionButtonBase.Title:setText(var_411_1)

				local var_411_2 = OPTIONS.CalculateViewportDimensions(100, arg_411_0.displayModeIndex, arg_411_0.displayResolutions, arg_411_0.imageQualityValue)

				arg_411_0:SetMinimumValue(arg_411_1, Engine.DJADGEBIBJ(var_411_2[2]))
			end
		end,
		value = function(arg_412_0)
			return Dvar.CFHDGABACF("NRSLPQLQPL")
		end,
		onDependencyParentRefresh = function(arg_413_0, arg_413_1, arg_413_2, arg_413_3, arg_413_4)
			if arg_413_3 == "ImageQuality" then
				arg_413_0.imageQualityValue = arg_413_4
			elseif arg_413_3 == "Monitor" then
				arg_413_0.displayResolutions = Engine.DJDAJBFCEE(arg_413_4 - 1)
			elseif arg_413_3 == "DisplayMode" then
				arg_413_0.displayModeIndex = arg_413_4
			end

			if arg_413_0.imageQualityValue and arg_413_0.displayResolutions and arg_413_0.imageQualityValue > #arg_413_0.displayResolutions then
				arg_413_0.imageQualityValue = #arg_413_0.displayResolutions
			end

			return true
		end
	},
	PlatformConstrainedChat = {
		action = function(arg_414_0, arg_414_1, arg_414_2)
			Dvar.DHEGHJJJHI("MSSTLSMOQN", arg_414_2 == OPTIONS.disableButtonOptions.ENABLED)
			Engine.DFJDIFJEGA("allowCrossplayChat", arg_414_2 - 1, arg_414_1)
		end,
		value = function(arg_415_0)
			return Engine.BECCFCBIAA("allowCrossplayChat", arg_415_0) == 0 and OPTIONS.disableButtonOptions.DISABLED or OPTIONS.disableButtonOptions.ENABLED
		end,
		buildCondition = function()
			return Engine.CIEGIACHAE()
		end
	},
	Rumble = {
		disabled = var_0_2
	},
	SafeArea = {
		action = function(arg_417_0, arg_417_1, arg_417_2, arg_417_3)
			LUI.FlowManager.RequestPopupMenu(nil, "ScreenMargins", true, arg_417_1, false, {}, nil, true)
		end,
		hideOption = function(arg_418_0)
			return not Engine.DDJFBBJAIG() and not not CONDITIONS.IsSplitscreen() or not Engine.BFDACIJIAD(arg_418_0)
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
			local var_420_0 = {
				3,
				4,
				8
			}
			local var_420_1 = Dvar.CFHDGABACF("SRKPNTSRM")
			local var_420_2 = 1

			if var_420_1 <= var_420_0[1] then
				var_420_2 = 1
			elseif var_420_1 <= var_420_0[2] then
				var_420_2 = 2
			elseif var_420_1 <= var_420_0[3] then
				var_420_2 = 3
			end

			return var_420_2
		end,
		action = function(arg_421_0, arg_421_1)
			local var_421_0 = {
				3,
				4,
				8
			}
			local var_421_1 = {
				5,
				8,
				16
			}

			Dvar.DFIJDJFIFD("SRKPNTSRM", var_421_0[arg_421_1.index])
			Dvar.DFIJDJFIFD("OKKTMLKNNR", var_421_1[arg_421_1.index])
		end
	},
	ShadowMapResolution = {
		action = function(arg_422_0, arg_422_1, arg_422_2)
			local var_422_0 = Dvar.DCEBHAJGCJ("NTKRPRKMOK")[arg_422_2]

			Dvar.BDEHAEGHAF("NTKRPRKMOK", var_422_0)
		end,
		defaultOptionValue = function(arg_423_0)
			return Dvar.DBGFIDHBFC("NTKRPRKMOK") + 1
		end,
		value = function(arg_424_0)
			return Dvar.CFHDGABACF("NTKRPRKMOK") + 1
		end
	},
	GeneralSubCategoryScreen = {
		buildCondition = var_0_3
	},
	GeneralSubCategoryHUD = {
		buildCondition = function(arg_425_0)
			return Dvar.IBEGCHEFE("MPKTSNOLSO")
		end
	},
	FOV = {
		updateDescriptionOnAction = true,
		description = function()
			local var_426_0 = LUI.Round(Engine.DHIDDHFHBB())
			local var_426_1 = LUI.Round(Engine.HCHEJADDD(var_426_0))

			return Engine.CBBHFCGDIC("PLATFORM_UI/FOV_DESC", var_426_0, var_426_1)
		end,
		specificAction = function(arg_427_0, arg_427_1, arg_427_2)
			local var_427_0 = (80 - SliderBounds.HorizontalFOV.Min) / (SliderBounds.HorizontalFOV.Max - SliderBounds.HorizontalFOV.Min)

			arg_427_1.GenericFillBar.TickMarker:SetAnchorsAndPosition(var_427_0, 1 - var_427_0 - 0.01, 0, 0, 0, 0, -4, 4)
		end,
		UpdateContent = UpdateFOVFillNumberContent
	},
	ShaderFrontendPreload = {
		action = function(arg_428_0, arg_428_1, arg_428_2, arg_428_3)
			LUI.FlowManager.RequestPopupMenu(nil, "ShaderCacheDialog", false, arg_428_3.controller, false, uploadOptions, unused, false, true)
		end,
		specificAction = function(arg_429_0, arg_429_1, arg_429_2)
			arg_429_1:addEventHandler("refresh_values", function(arg_430_0, arg_430_1)
				arg_429_1:SetButtonDisabled(not ShaderUpload.DIGGBDJIIE())
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
		action = function(arg_433_0, arg_433_1)
			Dvar.DHEGHJJJHI("NPLRKNKKOP", not Dvar.IBEGCHEFE("NPLRKNKKOP"))
			Dvar.DHEGHJJJHI("NKMQMOKNRP", Dvar.IBEGCHEFE("NPLRKNKKOP"))
		end,
		defaultOptionValue = function(arg_434_0, arg_434_1)
			return 1
		end,
		value = function(arg_435_0)
			return Dvar.IBEGCHEFE("NPLRKNKKOP") and 2 or 1
		end,
		buildCondition = function()
			return Engine.CGABICJHAI()
		end
	},
	SplitscreenShadows = {
		action = function(arg_437_0, arg_437_1, arg_437_2)
			if arg_437_2 == 2 then
				arg_437_2 = 3
			end

			Engine.DAGFFDGFII("profile_setSunShadowSplitscreen " .. arg_437_2 - 1, arg_437_1)
		end,
		value = function(arg_438_0)
			local var_438_0 = Dvar.DHEEJCCJBH("OLSOQRKNLO")
			local var_438_1 = Dvar.DCEBHAJGCJ("OLSOQRKNLO")
			local var_438_2 = var_0_0(var_438_1, var_438_0)

			return math.min(var_438_2, 2)
		end,
		hideOption = function(arg_439_0)
			return not Engine.BFDACIJIAD(arg_439_0) or not CONDITIONS.IsSplitscreen()
		end
	},
	SprintCancelReload = {
		disabled = var_0_2
	},
	StanceUpToJump = {
		action = function(arg_440_0, arg_440_1, arg_440_2)
			Engine.DAGFFDGFII("profile_toggleStanceUpJump")
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_440_1)
		end,
		defaultOptionValue = function(arg_441_0, arg_441_1)
			return Engine.IEBBJFBE("stanceUpJump") == 1
		end,
		value = function(arg_442_0)
			return Engine.BECCFCBIAA("stanceUpJump", arg_442_0) and 2 or 1
		end
	},
	SteeringVehicleStickSensitivity = {
		disabled = var_0_4
	},
	StickAcceleration = {
		disabled = var_0_4
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
		action = function(arg_443_0, arg_443_1, arg_443_2)
			Dvar.DHEGHJJJHI("LNOSSNSNTK", arg_443_2)
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
		disabled = var_0_4
	},
	TelemetryFPSCounter = {
		action = function(arg_445_0, arg_445_1, arg_445_2)
			Engine.DFJDIFJEGA("displayTelemetryFPS", arg_445_2 - 1, arg_445_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "fps",
				value = arg_445_2 - 1
			})
		end,
		value = function(arg_446_0)
			return Engine.BECCFCBIAA("displayTelemetryFPS", arg_446_0) and 2 or 1
		end
	},
	TelemetryServerLatency = {
		action = function(arg_447_0, arg_447_1, arg_447_2)
			Engine.DFJDIFJEGA("displayTelemetryLatency", arg_447_2 - 1, arg_447_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "latency",
				value = arg_447_2 - 1
			})
		end,
		value = function(arg_448_0)
			return Engine.BECCFCBIAA("displayTelemetryLatency", arg_448_0) and 2 or 1
		end
	},
	TelemetryGPUTemp = {
		action = function(arg_449_0, arg_449_1, arg_449_2)
			Engine.DFJDIFJEGA("displayTelemetryGpuTemperature", arg_449_2 - 1, arg_449_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "gpuTemp",
				value = arg_449_2 - 1
			})
		end,
		value = function(arg_450_0)
			return Engine.BECCFCBIAA("displayTelemetryGpuTemperature", arg_450_0) and 2 or 1
		end
	},
	TelemetryGPUTime = {
		action = function(arg_451_0, arg_451_1, arg_451_2)
			Engine.DFJDIFJEGA("displayTelemetryGpuTime", arg_451_2 - 1, arg_451_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "gpuTime",
				value = arg_451_2 - 1
			})
		end,
		value = function(arg_452_0)
			return Engine.BECCFCBIAA("displayTelemetryGpuTime", arg_452_0) and 2 or 1
		end
	},
	TelemetryCPUTime = {
		action = function(arg_453_0, arg_453_1, arg_453_2)
			Engine.DFJDIFJEGA("displayTelemetryCpuTime", arg_453_2 - 1, arg_453_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "cpuTime",
				value = arg_453_2 - 1
			})
		end,
		value = function(arg_454_0)
			return Engine.BECCFCBIAA("displayTelemetryCpuTime", arg_454_0) and 2 or 1
		end
	},
	TelemetryMuteSound = {
		action = function(arg_455_0, arg_455_1, arg_455_2)
			Engine.DFJDIFJEGA("showSoundMuted", arg_455_2 - 1, arg_455_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "sound",
				value = arg_455_2 - 1
			})
		end,
		value = function(arg_456_0)
			return Engine.BECCFCBIAA("showSoundMuted", arg_456_0) and 2 or 1
		end
	},
	TelemetryMuteVoiceChat = {
		action = function(arg_457_0, arg_457_1, arg_457_2)
			Engine.DFJDIFJEGA("showVoiceChatMuted", arg_457_2 - 1, arg_457_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "voiceChat",
				value = arg_457_2 - 1
			})
		end,
		value = function(arg_458_0)
			return Engine.BECCFCBIAA("showVoiceChatMuted", arg_458_0) and 2 or 1
		end
	},
	TelemetryPacketLoss = {
		action = function(arg_459_0, arg_459_1, arg_459_2)
			Engine.DFJDIFJEGA("displayTelemetryPacketLoss", arg_459_2 - 1, arg_459_1)
			LUI.TelemetryLayer.GetLayer():processEvent({
				name = "update_telemetry",
				id = "packetLoss",
				value = arg_459_2 - 1
			})
		end,
		value = function(arg_460_0)
			return Engine.BECCFCBIAA("displayTelemetryPacketLoss") + 1
		end
	},
	TextChatEnabled = {
		disabled = function(arg_461_0)
			return Engine.CDFCHEJJE(arg_461_0)
		end,
		onRefresh = function(arg_462_0, arg_462_1, arg_462_2)
			arg_462_0:dispatchEventToRoot({
				name = "text_chat_updated",
				controller = arg_462_1,
				active = arg_462_2 == OPTIONS.disableButtonOptions.ENABLED
			})
		end,
		buildCondition = function()
			return not IsLanguageArabic()
		end,
		isDependencyDisabled = function(arg_464_0, arg_464_1, arg_464_2, arg_464_3)
			return arg_464_2 == 1
		end,
		value = function(arg_465_0)
			return Engine.BECCFCBIAA("textChatEnabled", arg_465_0) and not Engine.CDFCHEJJE(arg_465_0) and 2 or 1
		end
	},
	ToggleArmorPlateApplyAll = {
		buildCondition = function()
			return CONDITIONS.IsMagmaEnabled() and Dvar.IBEGCHEFE("LOLOTKQLLN")
		end,
		action = function(arg_467_0, arg_467_1, arg_467_2)
			Engine.DFJDIFJEGA("armorPlateApplyAllKBM", arg_467_2 - 1, arg_467_1)
			Engine.DFJDIFJEGA("armorPlateApplyAllGamepad", arg_467_2 - 1, arg_467_1)
		end,
		value = function(arg_468_0)
			return Engine.BECCFCBIAA("armorPlateApplyAllKBM", arg_468_0) + 1
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
		action = function(arg_472_0, arg_472_1, arg_472_2)
			local var_472_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")

			Dvar.BDEHAEGHAF("MSQLPLNSQN", var_472_0[arg_472_2])
		end,
		value = function(arg_473_0)
			local var_473_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")
			local var_473_1 = Dvar.DHEEJCCJBH("MSQLPLNSQN")

			return var_0_0(var_473_0, var_473_1)
		end,
		defaultOptionValue = function(arg_474_0, arg_474_1)
			return 1
		end
	},
	VoiceChatDeviceXBOX = {
		buildCondition = function()
			return not CONDITIONS.IsPS4()
		end,
		action = function(arg_476_0, arg_476_1, arg_476_2)
			local var_476_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")

			Dvar.BDEHAEGHAF("MSQLPLNSQN", var_476_0[arg_476_2])
		end,
		value = function(arg_477_0)
			local var_477_0 = Dvar.DCEBHAJGCJ("MSQLPLNSQN")
			local var_477_1 = Dvar.DHEEJCCJBH("MSQLPLNSQN")

			return var_0_0(var_477_0, var_477_1)
		end,
		defaultOptionValue = function(arg_478_0, arg_478_1)
			return 1
		end
	},
	VoiceFutz = {
		action = function(arg_479_0, arg_479_1, arg_479_2)
			Dvar.BDEHAEGHAF("TLOLPTLNQ", OPTIONS.voiceChatEffectValues[arg_479_2])
		end,
		value = function(arg_480_0)
			return var_0_0(OPTIONS.voiceChatEffectValues, Dvar.DHEEJCCJBH("TLOLPTLNQ"))
		end,
		defaultOptionValue = function(arg_481_0)
			return var_0_0(OPTIONS.voiceChatEffectValues, "mw_default")
		end
	},
	VoiceLevelIndicator = {
		specificAction = function(arg_482_0, arg_482_1, arg_482_2)
			arg_482_1:SetButtonDisabled(true)
			arg_482_1.ArrowRight:SetAlpha(0)
			arg_482_1.ArrowLeft:SetAlpha(0)

			local var_482_0 = arg_482_0:Wait(100)
			local var_482_1

			local function var_482_2(arg_483_0)
				local var_483_0 = Engine.BJEDCJAEHH()

				arg_482_1.GenericFillBar.Fill:SetAnchors(0, 1 - var_483_0, 0, 0, 0)

				arg_483_0:Wait(100).onComplete = var_482_2
			end

			var_482_0.onComplete = var_482_2
		end
	},
	VoiceVolume = {
		action = function(arg_484_0, arg_484_1, arg_484_2)
			Dvar.IICIFEEDC("MSSPLOROPP", arg_484_2 / 100)
		end,
		value = function(arg_485_0)
			return Dvar.BJJCJHDBII("MSSPLOROPP") * 100
		end,
		defaultOptionValue = function(arg_486_0)
			return Dvar.DBGFIDHBFC("MSSPLOROPP") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	Volume = {
		action = function(arg_487_0, arg_487_1, arg_487_2)
			Dvar.IICIFEEDC("LQTPNKKMOP", arg_487_2 / 100)
		end,
		value = function(arg_488_0)
			return Dvar.BJJCJHDBII("LQTPNKKMOP") * 100
		end,
		defaultOptionValue = function(arg_489_0)
			return Dvar.DBGFIDHBFC("LQTPNKKMOP") * 100
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	RecordLevel = {
		action = function()
			return function(arg_491_0)
				Dvar.IICIFEEDC("OSONRTTPO", arg_491_0 * 65536)
			end
		end,
		value = function(arg_492_0)
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
		action = function(arg_495_0, arg_495_1, arg_495_2, arg_495_3)
			Dvar.IICIFEEDC("MSKKKMTQNT", arg_495_3 * 65536)
		end,
		value = function(arg_496_0)
			return Dvar.BJJCJHDBII("MSKKKMTQNT") / 65536
		end
	},
	UnlockAllItems = {
		action = function(arg_497_0, arg_497_1, arg_497_2)
			Dvar.DHEGHJJJHI("OLKMKMTKRO", not Dvar.IBEGCHEFE("OLKMKMTKRO"))
		end,
		defaultOptionValue = function(arg_498_0)
			return 1
		end,
		buildCondition = function()
			return Engine.BHICADFIHA()
		end
	},
	PrintWeaponAttributes = {
		action = function(arg_500_0, arg_500_1, arg_500_2)
			Dvar.DFIJDJFIFD("MMTMMPTQKM", arg_500_2)
		end,
		defaultOptionValue = function(arg_501_0)
			local var_501_0 = Dvar.CFHDGABACF("MMTMMPTQKM")

			return var_501_0 and var_501_0 or 1
		end,
		value = function(arg_502_0)
			local var_502_0 = Dvar.CFHDGABACF("MMTMMPTQKM")

			return var_502_0 and var_502_0 or 1
		end
	},
	NvidiaHighlights = {
		buildCondition = function()
			return Dvar.CFHDGABACF("NRNOLQMMON") == 1
		end
	},
	CoDCaster_TeamInfo = {
		action = function(arg_504_0, arg_504_1)
			LUI.FlowManager.RequestAddMenu("CodcasterSetup", true, arg_504_1)
		end
	},
	DataViewBindingCodcaster = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("RPNQOQSOS")
		end
	},
	SlideEnabledKeyboard = {
		onDependencyParentRefresh = function(arg_506_0, arg_506_1, arg_506_2, arg_506_3, arg_506_4)
			local var_506_0 = arg_506_2

			if arg_506_3 == "Crouch" and arg_506_4 == 2 then
				Engine.DFJDIFJEGA("tapToSlideEnabledKeyboard", 1, arg_506_1)

				var_506_0 = 2
			end

			return var_506_0
		end
	},
	CoDCaster_FreeCamSmoothFactor = {
		action = function(arg_507_0, arg_507_1, arg_507_2)
			Dvar.IICIFEEDC("NKOLKNSQNP", (34 - arg_507_2) / 1000)
		end,
		value = function(arg_508_0)
			return 34 - Dvar.BJJCJHDBII("NKOLKNSQNP") * 1000
		end,
		defaultOptionValue = function(arg_509_0)
			Dvar.IICIFEEDC("NKOLKNSQNP", 0.007)

			return 26
		end,
		buildCondition = Engine.BFDACIJIAD
	},
	CoDCaster_FreeCamSpeed = {
		action = function(arg_510_0, arg_510_1, arg_510_2)
			Dvar.IICIFEEDC("NRKNMTPMTO", arg_510_2 / 100)
		end,
		value = function(arg_511_0)
			return Dvar.BJJCJHDBII("NRKNMTPMTO") * 100
		end,
		defaultOptionValue = function(arg_512_0)
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
		action = function(arg_513_0, arg_513_1, arg_513_2, arg_513_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_513_0, OPTIONS_DATA.optionsCategory.videoOptions, arg_513_3.mouse)
		end,
		focusAction = function(arg_514_0)
			arg_514_0:processEvent({
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
		action = function(arg_515_0, arg_515_1, arg_515_2, arg_515_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_515_0, OPTIONS_DATA.optionsCategory.audioOptions, arg_515_3.mouse)
		end,
		focusAction = function(arg_516_0)
			arg_516_0:processEvent({
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
		action = function(arg_517_0, arg_517_1, arg_517_2, arg_517_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_517_0, OPTIONS_DATA.optionsCategory.networkDiagnosticOptions, arg_517_3.mouse)
			arg_517_0:processEvent({
				name = "network_diagnostic_show"
			})
		end,
		focusAction = function(arg_518_0)
			arg_518_0:processEvent({
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
		action = function(arg_519_0, arg_519_1, arg_519_2, arg_519_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_519_0, OPTIONS_DATA.optionsCategory.controlOptions, arg_519_3.mouse)
		end,
		focusAction = function(arg_520_0)
			arg_520_0:processEvent({
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
		action = function(arg_521_0, arg_521_1, arg_521_2, arg_521_3)
			OPTIONS_DATA.UpdateOptionsWindow(arg_521_0, OPTIONS_DATA.optionsCategory.voiceOptions, arg_521_3.mouse)
		end,
		focusAction = function(arg_522_0)
			arg_522_0:processEvent({
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
		action = function(arg_523_0, arg_523_1)
			CoD.SpamRemovalAction()
		end,
		focusAction = function(arg_524_0)
			arg_524_0:processEvent({
				name = "category_button_over"
			})
		end,
		buildCondition = function()
			return Engine.BHICADFIHA() or Engine.BGAAHHAGAC()
		end
	},
	StreamingDebug = {
		description = "Streaming Debug",
		name = "Streaming Debug",
		type = "GenericButton",
		id = "StreamingDebug",
		buttonHeight = 30,
		action = function(arg_526_0, arg_526_1)
			CoD.StreamingDebugAction()
		end,
		focusAction = function(arg_527_0)
			arg_527_0:processEvent({
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
		action = function(arg_529_0, arg_529_1)
			CoD.StreamImageSortListsAction()
		end,
		focusAction = function(arg_530_0)
			arg_530_0:processEvent({
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
		focusAction = function(arg_532_0)
			arg_532_0:processEvent({
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
		focusAction = function(arg_533_0)
			arg_533_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	lightAndShadowOptions = {
		buttonHeight = 30,
		type = "GenericButton",
		id = "LightAndShadowOptions",
		name = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/LIGHT_AND_SHADOW_OPTIONS") or nil,
		description = Engine.CGABICJHAI() and Engine.CBBHFCGDIC("PLATFORM_UI/DESC_LIGHT_SHADOW_OPTIONS") or nil,
		focusAction = function(arg_534_0)
			arg_534_0:processEvent({
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
		focusAction = function(arg_535_0)
			arg_535_0:processEvent({
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
		focusAction = function(arg_536_0)
			arg_536_0:processEvent({
				name = "category_button_over"
			})
		end
	},
	WeaponInspectAction = {
		buildCondition = function()
			return Dvar.IBEGCHEFE("NOKSLTKTRT")
		end
	},
	WarTracksAsAPassenger = {
		action = function(arg_538_0, arg_538_1, arg_538_2)
			Engine.DFJDIFJEGA("warTrackPassengerEnable", arg_538_2 - 1, arg_538_1)
		end,
		value = function(arg_539_0)
			return Engine.BECCFCBIAA("warTrackPassengerEnable", arg_539_0) + 1
		end,
		defaultOptionValue = function(arg_540_0)
			return 2
		end
	}
}
