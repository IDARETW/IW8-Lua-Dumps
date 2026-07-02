module(..., package.seeall)

EXEC_COMMAND = {
	vidReconfig = "vid_reconfig",
	sysRestart = "sys_restart"
}

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	(function()
		local var_2_0 = {}

		for iter_2_0, iter_2_1 in pairs(arg_1_2) do
			local var_2_1 = Dvar.EBBAIAEICC(iter_2_0)

			if var_2_1 == DvarTypeTable.DvarString or var_2_1 == DvarTypeTable.DvarEnum then
				var_2_0[iter_2_0] = Dvar.DHEEJCCJBH(iter_2_0)

				Dvar.BDEHAEGHAF(iter_2_0, iter_2_1)
			elseif var_2_1 == DvarTypeTable.DvarInt then
				var_2_0[iter_2_0] = Dvar.CFHDGABACF(iter_2_0)

				Dvar.DFIJDJFIFD(iter_2_0, iter_2_1)
			elseif var_2_1 == DvarTypeTable.DvarBool then
				var_2_0[iter_2_0] = Dvar.IBEGCHEFE(iter_2_0)

				Dvar.DHEGHJJJHI(iter_2_0, iter_2_1)
			elseif var_2_1 == DvarTypeTable.DvarFloat then
				var_2_0[iter_2_0] = Dvar.BJJCJHDBII(iter_2_0)

				Dvar.IICIFEEDC(iter_2_0, iter_2_1)
			end

			if iter_2_0 == "LKOLMLQRRT" then
				Engine.DAGFFDGFII("profile_setFilmGrain " .. tostring(iter_2_1), arg_1_1)
			end
		end

		if arg_1_3 then
			Engine.EBIDFIDHIE(arg_1_3)
		end

		if arg_1_4 then
			local var_2_2 = {
				menu = arg_1_0,
				controllerIndex = arg_1_1,
				varOptions = var_2_0,
				execCommand = arg_1_3
			}

			LUI.FlowManager.RequestPopupMenu(nil, "KeepDisplaySettingsPopup", true, arg_1_1, false, var_2_2)
		end
	end)()
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = "PLATFORM_UI/KEEP_DISPLAY_SETTINGS_TIME"
	local var_3_1
	local var_3_2 = 15
	local var_3_3

	local function var_3_4()
		return Engine.CBBHFCGDIC(var_3_0, var_3_2)
	end

	local function var_3_5()
		if var_3_3 then
			function var_3_3.onComplete()
				return
			end
		end
	end

	local function var_3_6()
		if var_3_3 then
			function var_3_3.onComplete()
				return
			end
		end

		var_0_0(arg_3_1.menu, arg_3_1.controllerIndex, arg_3_1.varOptions, arg_3_1.execCommand, false)
	end

	local var_3_7 = Engine.CBBHFCGDIC("PLATFORM_UI/KEEP_DISPLAY_SETTINGS")
	local var_3_8 = Engine.CBBHFCGDIC("PLATFORM_UI/KEEP_DISPLAY_SETTINGS_DESC")
	local var_3_9 = MenuBuilder.BuildRegisteredType("PopupYesNo", {
		title = var_3_7,
		message = var_3_8,
		statusMessage = var_3_4(),
		yesAction = var_3_5,
		noAction = var_3_6
	})
	local var_3_10 = var_3_9:getFirstDescendentById("submessage")

	if var_3_10 then
		local var_3_11

		local function var_3_12()
			var_3_2 = var_3_2 - 1

			var_3_10:setText(var_3_4())

			if var_3_2 > 0 then
				var_3_3 = var_3_9:Wait(1000)
				var_3_3.onComplete = var_3_12
			else
				LUI.FlowManager.RequestLeaveMenu(var_3_9, true)

				var_3_3 = nil

				var_3_6()
			end
		end

		var_3_3 = var_3_9:Wait(1000)
		var_3_3.onComplete = var_3_12
	end

	return var_3_9
end

MenuBuilder.registerType("KeepDisplaySettingsPopup", var_0_1)

local function var_0_2(arg_10_0, arg_10_1)
	arg_10_0:addEventHandler("refresh_values", function()
		arg_10_1()
	end)
	arg_10_1()
end

local function var_0_3()
	return {
		Engine.CBBHFCGDIC("LUA_MENU/NO"),
		Engine.CBBHFCGDIC("LUA_MENU/YES")
	}
end

local function var_0_4()
	return {
		Engine.CBBHFCGDIC("LUA_MENU/OFF"),
		Engine.CBBHFCGDIC("LUA_MENU/ON")
	}
end

function ValueToListIndex(arg_14_0, arg_14_1)
	assert(#arg_14_0 > 0)

	for iter_14_0, iter_14_1 in ipairs(arg_14_0) do
		if arg_14_1 == iter_14_1 then
			return iter_14_0
		end
	end

	DebugPrint("Warning: Advanced Video trying to get a value from list that doesn't exist. ( " .. arg_14_1 .. ") Defaulting to 1")

	return 1
end

local function var_0_5(arg_15_0, arg_15_1)
	assert(#arg_15_0 > 0)
	assert(arg_15_1 <= #arg_15_0)

	return arg_15_0[arg_15_1]
end

local function var_0_6(arg_16_0)
	assert(arg_16_0.currentValue <= arg_16_0.max and arg_16_0.currentValue >= arg_16_0.min)
	assert(arg_16_0.updateDuration)

	local var_16_0 = (arg_16_0.currentValue - arg_16_0.min) / (arg_16_0.max - arg_16_0.min)

	if arg_16_0.direction == ArrowBarFillDirections.LEFT_TO_RIGHT then
		arg_16_0.fillElement:SetAnchors(0, 1 - var_16_0, 0, 0, arg_16_0.updateDuration)
	else
		arg_16_0.fillElement:SetAnchors(1 - var_16_0, 0, 0, 0, arg_16_0.updateDuration)
	end

	local var_16_1 = arg_16_0.currentValue * 80

	assert(arg_16_0.updateDuration)
	arg_16_0.Text:setText(string.format("%.1f", var_16_1), arg_16_0.updateDuration)
	arg_16_0.ShowNumberFunction(true)
end

local function var_0_7(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = Dvar.EBBAIAEICC(arg_17_0)
	local var_17_1 = 1

	if var_17_0 == DvarTypeTable.DvarString or var_17_0 == DvarTypeTable.DvarEnum then
		local var_17_2 = Dvar.DHEEJCCJBH(arg_17_0)

		if arg_17_2 then
			var_17_1 = ValueToListIndex(arg_17_2, var_17_2)
		else
			var_17_1 = ValueToListIndex(arg_17_1, var_17_2)
		end
	elseif var_17_0 == DvarTypeTable.DvarInt then
		local var_17_3 = Dvar.CFHDGABACF(arg_17_0)

		if arg_17_2 then
			var_17_1 = ValueToListIndex(arg_17_2, var_17_3)
		else
			var_17_1 = var_17_3
		end
	elseif var_17_0 == DvarTypeTable.DvarBool then
		var_17_1 = Dvar.IBEGCHEFE(arg_17_0) and 2 or 1
	end

	return var_17_1
end

local function var_0_8(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	return function(arg_19_0)
		local var_19_0 = false
		local var_19_1 = {}

		for iter_19_0 = 1, #arg_18_2 do
			local var_19_2 = arg_18_2[iter_19_0].name
			local var_19_3 = Dvar.EBBAIAEICC(var_19_2)
			local var_19_4 = arg_18_2[iter_19_0].overrideSetValues
			local var_19_5

			if var_19_4 then
				var_19_5 = var_0_5(var_19_4, arg_19_0)
			elseif var_19_3 == DvarTypeTable.DvarString or var_19_3 == DvarTypeTable.DvarEnum then
				var_19_5 = var_0_5(arg_18_3, arg_19_0)
			elseif var_19_3 == DvarTypeTable.DvarInt then
				var_19_5 = arg_19_0
			elseif var_19_3 == DvarTypeTable.DvarBool then
				var_19_5 = false

				if arg_19_0 == 2 then
					var_19_5 = true
				end
			end

			var_19_1[var_19_2] = var_19_5

			if arg_18_2[iter_19_0].showKeepSettingPopup then
				var_19_0 = true
			end
		end

		var_0_0(arg_18_0, arg_18_1, var_19_1, arg_18_4, var_19_0)
	end
end

local function var_0_9(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5, arg_20_6)
	return function()
		local var_21_0 = arg_20_3()
		local var_21_1 = var_0_7(arg_20_2, var_21_0, arg_20_5)
		local var_21_2 = {
			{
				name = arg_20_2,
				overrideSetValues = arg_20_5
			}
		}
		local var_21_3 = var_0_8(arg_20_0, arg_20_1, var_21_2, var_21_0, arg_20_4)
		local var_21_4 = {
			wrapAround = true,
			labels = var_21_0,
			action = var_21_3,
			defaultValue = var_21_1,
			clickRepeatDisabled = arg_20_6
		}

		LUI.AddUIArrowTextButtonLogic(arg_20_0, arg_20_1, var_21_4)
	end
end

local function var_0_10(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6)
	local var_22_0 = var_0_9(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6)

	var_0_2(arg_22_0, var_22_0)
end

local function var_0_11(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4, arg_23_5, arg_23_6)
	local var_23_0 = Dvar.BJJCJHDBII(arg_23_2)

	local function var_23_1(arg_24_0)
		var_0_0(arg_23_0, arg_23_1, {
			[arg_23_2] = arg_24_0
		}, nil)
	end

	if var_23_0 < arg_23_3 then
		var_23_0 = arg_23_3
	elseif arg_23_4 < var_23_0 then
		var_23_0 = arg_23_4
	end

	local var_23_2 = {
		wrapAround = false,
		decimalPlacesToRound = 6,
		action = var_23_1,
		defaultValue = var_23_0,
		max = arg_23_4,
		min = arg_23_3,
		step = arg_23_5,
		fillElement = arg_23_0.GenericFillBar.Fill
	}

	if arg_23_6.showTextValue and arg_23_6.sliderID and arg_23_6.sliderID == "FOV" then
		var_23_2.UpdateContent = var_0_6
	end

	LUI.AddUIArrowFillBarButtonLogic(arg_23_0, arg_23_1, var_23_2)
end

local function var_0_12(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_25_3
	})

	var_25_0.id = "Adapter"

	var_25_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)

	var_25_0.buttonDescription = Engine.CBBHFCGDIC(arg_25_2)

	var_25_0.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_25_1)), 0)
	var_25_0.Text:SetAlignment(LUI.Alignment.Left)

	return var_25_0
end

local function var_0_13(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_26_3
	})

	var_26_0.id = arg_26_0

	var_26_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)

	var_26_0.buttonDescription = Engine.CBBHFCGDIC(arg_26_2)

	var_26_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_26_1)), 0)

	return var_26_0
end

local function var_0_14(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	return function(arg_28_0, arg_28_1)
		local var_28_0 = {}
		local var_28_1 = arg_27_2()
		local var_28_2 = {}

		for iter_28_0 = 1, #arg_27_3 do
			local var_28_3 = arg_27_3[iter_28_0].overrideSetValuesFunc

			if var_28_3 then
				arg_27_3[iter_28_0].overrideSetValues = {}

				for iter_28_1 = 1, #var_28_1 do
					local var_28_4 = var_28_3(iter_28_1)

					table.insert(arg_27_3[iter_28_0].overrideSetValues, var_28_4)
				end
			end
		end

		local var_28_5 = var_0_8(arg_28_0, arg_28_1, arg_27_3, var_28_1, arg_27_4)

		for iter_28_2 = 1, #var_28_1 do
			local function var_28_6(arg_29_0, arg_29_1)
				var_28_5(iter_28_2)
				arg_29_0:dispatchEventToCurrentMenu({
					name = "subcategory_option_selected"
				})
			end

			if arg_27_4 == EXEC_COMMAND.sysRestart then
				local var_28_7 = var_28_6

				function var_28_6(arg_30_0, arg_30_1)
					LUI.FlowManager.RequestPopupMenu(nil, "SysRestartWarning", true, arg_30_1.controller, false, {
						yesAction = var_28_7
					}, nil, false, true)
				end
			end

			local var_28_8 = {
				id = arg_27_0 .. "Button" .. iter_28_2,
				text = var_28_1[iter_28_2],
				desc = arg_27_1,
				actionFunc = var_28_6
			}

			table.insert(var_28_0, var_28_8)
		end

		return var_28_0
	end
end

local function var_0_15(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4)
	LUI.FlowManager.GetScopedData(arg_31_0).currentOptionsSubCategory = arg_31_1

	local var_31_0 = arg_31_0[arg_31_1]

	arg_31_0:processEvent({
		name = "subcategory_changed",
		title = var_31_0.Text:getText(),
		createOptions = arg_31_2,
		noFocus = arg_31_3,
		blockMouseInSubcategory = arg_31_4
	})
end

local function var_0_16(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_1.buttonCategory or ""
	local var_32_1 = arg_32_1.buttonTitle or ""
	local var_32_2 = arg_32_1.buttonDescription or ""
	local var_32_3 = arg_32_1.getCurrentValueFunc
	local var_32_4 = arg_32_1.getButtonDisabledFunc
	local var_32_5 = arg_32_1.createOptionsFunc
	local var_32_6 = arg_32_1.getAllOptionsFunc
	local var_32_7 = arg_32_1.blockMouseInSubcategory or false
	local var_32_8 = var_32_3 and var_32_3() or ""
	local var_32_9 = OPTIONS.BuildGenericDualLabelButton(var_32_0, var_32_1, var_32_8, var_32_2, arg_32_2)
	local var_32_10 = var_32_4 and var_32_4() or false
	local var_32_11 = var_32_6()

	var_32_9:SetButtonDisabled(var_32_10 or #var_32_11 <= 1)

	arg_32_0[var_32_0] = var_32_9

	var_32_9:addEventHandler("button_action", function(arg_33_0, arg_33_1)
		var_0_15(arg_32_0, var_32_0, var_32_5, arg_33_1.mouse, var_32_7)
	end)
	var_32_9:addEventHandler("refresh_values", function(arg_34_0, arg_34_1)
		local var_34_0 = var_32_3 and var_32_3() or ""

		var_32_9.DynamicText:setText(ToUpperCase(Engine.CBBHFCGDIC(var_34_0)))

		local var_34_1 = var_32_4 and var_32_4() or false
		local var_34_2 = var_32_6()

		var_34_1 = var_34_1 or #var_34_2 <= 1

		var_32_9:SetButtonDisabled(var_34_1)

		if var_34_1 then
			local var_34_3 = LUI.FlowManager.GetScopedData(arg_32_0)

			if var_34_3.showingSubCategory and var_32_0 == var_34_3.currentOptionsSubCategory then
				arg_32_0:getParent():LeaveSubCategoryMenu({
					noFocus = false
				})
			end
		end
	end)

	return var_32_9
end

local function var_0_17(arg_35_0, arg_35_1)
	local var_35_0 = var_0_13("AspectRatio", "PLATFORM_UI/ASPECT_RATIO_CAPS", "PLATFORM_UI/ASPECT_RATIO_DESC", arg_35_1)

	local function var_35_1()
		local var_36_0 = Dvar.DCEBHAJGCJ("QKKMRRLRR")

		local function var_36_1()
			return {
				Engine.CBBHFCGDIC("MENU/AUTO"),
				Engine.CBBHFCGDIC("MENU/STANDARD"),
				Engine.CBBHFCGDIC("MENU/WIDE_16_10"),
				Engine.CBBHFCGDIC("MENU/WIDE_16_9")
			}
		end

		var_0_10(var_35_0, arg_35_1, "QKKMRRLRR", var_36_1, EXEC_COMMAND.vidReconfig, var_36_0)
	end

	var_0_2(var_35_0, var_35_1)

	return var_35_0
end

local function var_0_18(arg_38_0, arg_38_1)
	local var_38_0 = Engine.DJDAJBFCEE

	local function var_38_1()
		if Engine.BEFACAIFDD() then
			return false
		else
			return Dvar.CFHDGABACF("NNSQSMTQPP") == 1
		end
	end

	local function var_38_2()
		local var_40_0 = var_38_1()
		local var_40_1 = ""

		if var_40_0 then
			local var_40_2 = var_38_0()

			var_40_1 = var_40_2[var_0_7("LTPQTTPSOR", var_40_2)]
		else
			var_40_1 = Engine.EBGGFHDIJJ()
		end

		return var_40_1
	end

	local function var_38_3()
		return not var_38_1()
	end

	local var_38_4 = {
		buttonCategory = "Resolution",
		buttonDescription = "MENU/VIDEO_MODE_DESC",
		buttonTitle = "MENU/VIDEO_MODE_CAPS",
		getCurrentValueFunc = var_38_2,
		getButtonDisabledFunc = var_38_3,
		getAllOptionsFunc = var_38_0
	}
	local var_38_5 = {
		{
			showKeepSettingPopup = true,
			name = "LTPQTTPSOR"
		}
	}

	var_38_4.createOptionsFunc = var_0_14(var_38_4.buttonCategory, var_38_4.buttonDescription, var_38_4.getAllOptionsFunc, var_38_5, EXEC_COMMAND.vidReconfig)

	return var_0_16(arg_38_0, var_38_4, arg_38_1)
end

local function var_0_19(arg_42_0, arg_42_1)
	local function var_42_0()
		local var_43_0 = Engine.CJFDFGGBEJ()

		for iter_43_0 = 1, #var_43_0 do
			if var_43_0[iter_43_0] == "" then
				var_43_0[iter_43_0] = "PLATFORM_UI/NATIVE"
			end
		end

		return var_43_0
	end

	local function var_42_1()
		return var_42_0()[Engine.EAABBIABII()]
	end

	local var_42_2 = {
		buttonCategory = "ImageQuality",
		buttonDescription = "MENU/IMAGE_QUALITY_DESC",
		buttonTitle = "MENU/IMAGE_QUALITY_CAPS",
		getCurrentValueFunc = var_42_1,
		getAllOptionsFunc = var_42_0
	}
	local var_42_3 = {
		{
			name = "PLROSKRRQ",
			overrideSetValuesFunc = Engine.CDFBEEAADB
		}
	}

	var_42_2.createOptionsFunc = var_0_14(var_42_2.buttonCategory, var_42_2.buttonDescription, var_42_2.getAllOptionsFunc, var_42_3, EXEC_COMMAND.vidReconfig)

	return var_0_16(arg_42_0, var_42_2, arg_42_1)
end

local function var_0_20(arg_45_0, arg_45_1)
	local var_45_0 = {
		title = Engine.CBBHFCGDIC("PLATFORM_UI/SYS_RESTART_WARNING_TITLE")
	}
	local var_45_1 = Engine.EAAHGICFBD() and "PLATFORM_UI/SYS_RESTART_WARNING_MP" or "PLATFORM_UI/SYS_RESTART_WARNING_SP"

	var_45_0.message = Engine.CBBHFCGDIC(var_45_1)
	var_45_0.yesAction = arg_45_1.yesAction

	local var_45_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_45_0)

	var_45_2.id = "SysRestartWarning"

	return var_45_2
end

MenuBuilder.registerType("SysRestartWarning", var_0_20)

local function var_0_21()
	local var_46_0 = {
		title = Engine.CBBHFCGDIC("PLATFORM/SHADER_PRECACHE_QUESTION_TITLE"),
		message = Engine.CBBHFCGDIC("PLATFORM/SHADER_PRECACHE_QUESTION"),
		buttons = {}
	}

	table.insert(var_46_0.buttons, {
		label = Engine.CBBHFCGDIC("PLATFORM/SHADER_PRECACHE_RESTART"),
		action = function()
			ShaderUpload.BHEJAGFIBB()
			Dvar.DHEGHJJJHI("NSORSLLORM", false)
		end
	})
	table.insert(var_46_0.buttons, {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function()
			return
		end
	})

	local var_46_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_46_0)

	var_46_1.id = "ShaderCacheDialog"

	return var_46_1
end

MenuBuilder.registerType("ShaderCacheDialog", var_0_21)

local function var_0_22(arg_49_0, arg_49_1)
	local var_49_0 = {}

	OPTIONS.AddOptionsToTable(arg_49_0, arg_49_1, var_49_0, CSV.displayVideoOptions)

	var_49_0[#var_49_0 + 1] = var_0_18(arg_49_0, arg_49_1)
	var_49_0[#var_49_0 + 1] = var_0_19(arg_49_0, arg_49_1)

	return var_49_0
end

local function var_0_23(arg_50_0, arg_50_1)
	local var_50_0 = {}

	OPTIONS.AddOptionsToTable(arg_50_0, arg_50_1, var_50_0, CSV.textureVideoOptions)

	return var_50_0
end

local function var_0_24(arg_51_0, arg_51_1)
	local var_51_0 = {}

	OPTIONS.AddOptionsToTable(arg_51_0, arg_51_1, var_51_0, CSV.lightShadowVideoOptions)

	return var_51_0
end

local function var_0_25(arg_52_0, arg_52_1)
	local var_52_0 = {}

	OPTIONS.AddOptionsToTable(arg_52_0, arg_52_1, var_52_0, CSV.postProcessVideoOptions)

	return var_52_0
end

local function var_0_26(arg_53_0, arg_53_1)
	local var_53_0 = {}

	OPTIONS.AddOptionsToTable(arg_53_0, arg_53_1, var_53_0, CSV.miscVideoOptions)

	return var_53_0
end

local function var_0_27(arg_54_0, arg_54_1)
	local var_54_0

	if arg_54_1 == "display_options" then
		var_54_0 = arg_54_0.DisplayOptions
	elseif arg_54_1 == "texture_options" then
		var_54_0 = arg_54_0.TextureOptions
	elseif arg_54_1 == "light_shadow_options" then
		var_54_0 = arg_54_0.LightAndShadowOptions
	elseif arg_54_1 == "post_process_options" then
		var_54_0 = arg_54_0.PostProcessOptions
	elseif arg_54_1 == "misc_options" then
		var_54_0 = arg_54_0.MiscOptions
	else
		var_54_0 = arg_54_0.DisplayOptions
	end

	return var_54_0
end

local function var_0_28(arg_55_0, arg_55_1, arg_55_2)
	LUI.FlowManager.GetScopedData(arg_55_0).currentOptionsCategory = arg_55_1

	local var_55_0
	local var_55_1 = var_0_27(arg_55_0, arg_55_1)

	if arg_55_1 == "display_options" then
		var_55_0 = var_0_22
	elseif arg_55_1 == "texture_options" then
		var_55_0 = var_0_23
	elseif arg_55_1 == "light_shadow_options" then
		var_55_0 = var_0_24
	elseif arg_55_1 == "post_process_options" then
		var_55_0 = var_0_25
	elseif arg_55_1 == "misc_options" then
		var_55_0 = var_0_26
	else
		var_55_0 = CreateVideoOptions
	end

	arg_55_0:processEvent({
		name = "category_changed",
		title = var_55_1.GenericOptionButtonBase.Title:getText(),
		createOptions = var_55_0,
		noFocus = arg_55_2,
		category = arg_55_1
	})
end

local function var_0_29(arg_56_0, arg_56_1, arg_56_2)
	assert(arg_56_0.DisplayOptions)
	assert(arg_56_0.TextureOptions)
	assert(arg_56_0.LightAndShadowOptions)
	assert(arg_56_0.PostProcessOptions)
	assert(arg_56_0.MiscOptions)
	arg_56_0.DisplayOptions:addEventHandler("button_action", function(arg_57_0, arg_57_1)
		var_0_28(arg_56_0, "display_options", arg_57_1.mouse)
	end)
	arg_56_0.TextureOptions:addEventHandler("button_action", function(arg_58_0, arg_58_1)
		var_0_28(arg_56_0, "texture_options", arg_58_1.mouse)
	end)
	arg_56_0.LightAndShadowOptions:addEventHandler("button_action", function(arg_59_0, arg_59_1)
		var_0_28(arg_56_0, "light_shadow_options", arg_59_1.mouse)
	end)
	arg_56_0.PostProcessOptions:addEventHandler("button_action", function(arg_60_0, arg_60_1)
		var_0_28(arg_56_0, "post_process_options", arg_60_1.mouse)
	end)
	arg_56_0.MiscOptions:addEventHandler("button_action", function(arg_61_0, arg_61_1)
		var_0_28(arg_56_0, "misc_options", arg_61_1.mouse)
	end)
	arg_56_0:addEventHandler("menu_create", function()
		local var_62_0 = LUI.FlowManager.GetScopedData(arg_56_0).currentOptionsCategory

		if var_62_0 == nil then
			var_62_0 = "display_options"
		end

		var_0_28(arg_56_0, var_62_0, true)
	end)
	arg_56_0:registerEventHandler("onVideoChange", function()
		local var_63_0 = LUI.FlowManager.GetScopedData(arg_56_0).currentOptionsCategory

		var_0_28(arg_56_0, var_63_0, true)

		return true
	end)
end

function OptionsVideoAdvanced(arg_64_0, arg_64_1)
	local var_64_0 = LUI.UIVerticalList.new()

	var_64_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 705 * _1080p)
	var_64_0:SetSpacing(10 * _1080p)

	var_64_0.id = "PCOptions"
	var_64_0._animationSets = {}
	var_64_0._sequences = {}

	local var_64_1 = arg_64_1 or {}
	local var_64_2 = var_64_1.controllerIndex

	var_64_0:setUseStencil(false)

	local var_64_3 = OPTIONS.CreateOption(var_64_0, var_64_2, OPTIONS_DATA.optionsDataList.displayOptions)

	var_64_0:addElement(var_64_3)

	var_64_0.DisplayOptions = var_64_3

	local var_64_4 = OPTIONS.CreateOption(var_64_0, var_64_2, OPTIONS_DATA.optionsDataList.textureOptions)

	var_64_0:addElement(var_64_4)

	var_64_0.TextureOptions = var_64_4

	local var_64_5 = OPTIONS.CreateOption(var_64_0, var_64_2, OPTIONS_DATA.optionsDataList.lightAndShadowOptions)

	var_64_0:addElement(var_64_5)

	var_64_0.LightAndShadowOptions = var_64_5

	local var_64_6 = OPTIONS.CreateOption(var_64_0, var_64_2, OPTIONS_DATA.optionsDataList.postProcessOptions)

	var_64_0:addElement(var_64_6)

	var_64_0.PostProcessOptions = var_64_6

	local var_64_7 = OPTIONS.CreateOption(var_64_0, var_64_2, OPTIONS_DATA.optionsDataList.miscOptions)

	var_64_0:addElement(var_64_7)

	var_64_0.MiscOptions = var_64_7

	var_0_29(var_64_0, var_64_2, var_64_1)

	return var_64_0
end

MenuBuilder.registerType("OptionsVideoAdvanced", OptionsVideoAdvanced)
LockTable(_M)
