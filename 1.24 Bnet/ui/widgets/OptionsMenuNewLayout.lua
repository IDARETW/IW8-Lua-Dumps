module(..., package.seeall)

local var_0_0 = {
	leave = 1,
	tabChange = 3,
	dismiss = 2
}

local function var_0_1(arg_1_0)
	local var_1_0 = {}

	for iter_1_0 = 0, arg_1_0.OptionWindow.buttonList:GetNumRows() - 1 do
		local var_1_1 = arg_1_0.OptionWindow.buttonList:GetElementAtPosition(0, iter_1_0)

		table.insert(var_1_0, var_1_1)

		if var_1_1.ChildrenContainer then
			table.insert(var_1_0, var_1_1._innerWidget)

			local var_1_2 = var_1_1.ChildrenContainer:getFirstChild()

			while var_1_2 do
				table.insert(var_1_0, var_1_2)

				var_1_2 = var_1_2:getNextSibling()
			end
		end
	end

	return var_1_0
end

local function var_0_2(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(var_0_1(arg_2_0)) do
		if iter_2_1.id == arg_2_1 then
			return iter_2_1
		end
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0:RemoveButtonHelperText("button_right_trigger", "left")

	if #arg_3_0.modifiedOptions > 0 then
		arg_3_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_right_trigger",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/APPLY_SETTINGS")
		})
	elseif arg_3_0.tabId == "keyboardAndMouse" then
		arg_3_0:AddButtonHelperText({
			clickable = true,
			priority = 9,
			side = "left",
			button_ref = "button_right_trigger",
			helper_text = Engine.CBBHFCGDIC("MENU/RESET_ALL_KEYBINDS")
		})
	elseif arg_3_0.tabId == "codCaster" then
		arg_3_0:AddButtonHelperText({
			clickable = true,
			priority = 9,
			side = "left",
			button_ref = "button_right_trigger",
			helper_text = Engine.CBBHFCGDIC("MENU/RESET_ALL_CODCASTER_KEYBINDS")
		})
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	if #arg_4_0.modifiedOptions > 0 then
		arg_4_0:dispatchEventToChildren({
			name = "remove_overlays"
		})

		if not arg_4_0.applyAction or arg_4_0.applyAction(arg_4_0, arg_4_1, arg_4_2) then
			arg_4_0.ApplyingChanges = true

			for iter_4_0, iter_4_1 in pairs(var_0_1(arg_4_0)) do
				iter_4_1:processEvent({
					name = "apply_value"
				})
			end

			arg_4_0.modifiedOptions = {}

			var_0_3(arg_4_0, arg_4_1)
			arg_4_0.OptionWindow.buttonList:SetFocusedPosition({
				x = 0,
				y = arg_4_0.CurrentSelectedOption
			}, true)

			arg_4_0.ApplyingChanges = false
		end
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	arg_5_0.modifiedOptions = {}

	var_0_3(arg_5_0, arg_5_1)

	for iter_5_0, iter_5_1 in pairs(var_0_1(arg_5_0)) do
		iter_5_1:processEvent({
			name = "seek_value"
		})
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}

	if arg_6_2 then
		var_6_0.title = Engine.CBBHFCGDIC("LUA_MENU/VRAM_NOTICE_DESC")
		var_6_0.message = Engine.CBBHFCGDIC("LUA_MENU/VRAM_WARNING_DESC")
	else
		var_6_0.title = Engine.CBBHFCGDIC("LUA_MENU/APPLY_SETTINGS")
		var_6_0.message = Engine.CBBHFCGDIC("LUA_MENU/APPLY_UNSAVED_SETTINGS_MESSAGE")
	end

	var_6_0.buttons = {
		{
			label = Engine.CBBHFCGDIC("@MENU/APPLY"),
			action = function(arg_7_0)
				LUI.FlowManager.RequestLeaveMenu(arg_7_0, true)
				var_0_4(arg_6_0, arg_6_1, arg_6_2)
				arg_6_0:HandleFlowRequest(arg_6_1)
			end
		},
		{
			label = Engine.CBBHFCGDIC("@MENU/DISCARD"),
			action = function(arg_8_0)
				LUI.FlowManager.RequestLeaveMenu(arg_8_0, true)
				var_0_5(arg_6_0, arg_6_1)
				arg_6_0:HandleFlowRequest(arg_6_1)
			end
		},
		{
			label = Engine.CBBHFCGDIC("@MENU/CANCEL"),
			action = function()
				return
			end
		}
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupMessageAndButtons", true, arg_6_1, false, var_6_0)
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = LUI.FlowManager.GetScopedData(arg_10_0)

	if #arg_10_0.modifiedOptions > 0 then
		var_0_6(arg_10_0, arg_10_1)

		var_10_0.flowRequestType = arg_10_2 ~= nil and arg_10_2 or var_10_0.flowRequestType

		return
	end

	if Dvar.BJJCJHDBII("MPLORMMQPT") == 2 then
		Dvar.IICIFEEDC("QLQPPSRK", -100)
	end

	if Dvar.BJJCJHDBII("MPLORMMQPT") == 1 then
		Dvar.IICIFEEDC("QLQPPSRK", 0)
	end

	Engine.EBIDFIDHIE("updategamerprofile " .. arg_10_1)

	arg_10_2 = var_10_0.flowRequestType or arg_10_2

	if arg_10_2 == var_0_0.leave then
		arg_10_0:dispatchEventToRoot({
			name = "closing_quick_access_menu",
			controllerIndex = arg_10_1
		})
		ACTIONS.LeaveMenu(arg_10_0)
		Engine.CJAEBHAHBB(arg_10_1)
	elseif arg_10_2 == var_0_0.dismiss then
		arg_10_0:dispatchEventToRoot({
			name = "closing_quick_access_menu",
			controllerIndex = arg_10_1
		})
		Engine.CJAEBHAHBB(arg_10_1)

		if LUI.FlowManager.IsInStack("TrialResults") then
			ACTIONS.LeaveMenu(arg_10_0)
		else
			local var_10_1 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()

			LUI.FlowManager.RequestCloseAllMenus(var_10_1.name, arg_10_3, arg_10_1)
		end

		if Engine.CAADCDEEIA() then
			ACTIONS.ResumeGame(arg_10_0)
		end
	elseif arg_10_2 == var_0_0.tabChange and var_10_0.requestedTab then
		arg_10_0.Tabs:FocusTab(arg_10_1, var_10_0.requestedTab.tabIndex, var_10_0.requestedTab.focusType)
	end

	var_10_0.flowRequestType = nil
end

local function var_0_8(arg_11_0, arg_11_1)
	if arg_11_0._shouldUpdateGraphics then
		for iter_11_0, iter_11_1 in ipairs(var_0_1(arg_11_0)) do
			iter_11_1:processEvent({
				name = "seek_value",
				controllerIndex = arg_11_1
			})
		end

		arg_11_0.modifiedOptions = {}

		var_0_3(arg_11_0, arg_11_1)

		arg_11_0._shouldUpdateGraphics = false
	end

	if arg_11_0._shouldResetGraphics then
		if arg_11_0._previousResolutionMultiplier then
			Dvar.DFIJDJFIFD("LNKPMNNMQM", arg_11_0._previousResolutionMultiplier)
			Engine.EBIDFIDHIE("vid_reconfig")

			arg_11_0._previousResolutionMultiplier = nil
		end

		arg_11_0._shouldResetGraphics = false
		arg_11_0._shouldUpdateGraphics = true
	end

	local var_11_0 = var_0_2(arg_11_0, "DisplayMode")

	if var_11_0 then
		var_11_0:processEvent({
			name = "seek_value",
			controllerIndex = arg_11_1
		})
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_11_0.Background)
end

local function var_0_9(arg_12_0, arg_12_1)
	if arg_12_0.resetAction then
		arg_12_0.resetAction(arg_12_0, arg_12_1)
	else
		for iter_12_0, iter_12_1 in ipairs(var_0_1(arg_12_0)) do
			local var_12_0 = arg_12_0.optionsList[iter_12_1.id]

			OPTIONS.ResetOptionElement(arg_12_0, arg_12_1, iter_12_1, var_12_0)
		end
	end
end

local function var_0_10(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.OptionWindow.buttonList:getFirstInFocus()

	if var_13_0 then
		local var_13_1 = arg_13_0.optionsList[var_13_0.id]

		if var_13_1 then
			OPTIONS.ResetOptionElement(arg_13_0, arg_13_1, var_13_0, var_13_1)
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end

		return true
	end
end

local function var_0_11(arg_14_0, arg_14_1)
	arg_14_0._previousResolutionMultiplier = Dvar.CFHDGABACF("LNKPMNNMQM")

	Engine.EJJEHHFCC(false)

	arg_14_0._shouldResetGraphics = true
end

local function var_0_12(arg_15_0, arg_15_1, arg_15_2)
	if not arg_15_2 and arg_15_0.OptionsGraphicsSliderBar and arg_15_0.OptionsGraphicsSliderBar:isOverMaxRecommended() then
		var_0_6(arg_15_0, arg_15_1, true)

		return false
	else
		Engine.EBIDFIDHIE("vid_reconfig")

		return true
	end
end

local var_0_13

local function var_0_14(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:getFirstChild()
	local var_16_1 = 0

	while var_16_0 do
		var_16_1 = var_16_1 + var_0_14(var_16_0, arg_16_1)
		var_16_0 = var_16_0:getNextSibling()
	end

	if arg_16_0._typeName then
		if not arg_16_1[arg_16_0._typeName] then
			arg_16_1[arg_16_0._typeName] = {}
		end

		table.insert(arg_16_1[arg_16_0._typeName], var_16_1)
	end

	return var_16_1 + 1
end

local function var_0_15(arg_17_0)
	local var_17_0 = 0

	for iter_17_0 = 0, arg_17_0.OptionWindow.buttonList:GetNumRows() - 1 do
		local var_17_1 = arg_17_0.OptionWindow.buttonList:GetElementAtPosition(0, iter_17_0)
		local var_17_2 = arg_17_0.optionsList[var_17_1.id]

		if var_17_2 and var_17_2.id then
			if var_17_2.type == "Expander" then
				var_17_0 = var_17_0 + 1

				local var_17_3 = var_17_1.ChildrenContainer:getFirstChild()

				while var_17_3 do
					local var_17_4 = arg_17_0.optionsList[var_17_3.id]

					var_17_0 = var_17_0 + 1
					var_17_3 = var_17_3:getNextSibling()
				end
			else
				var_17_0 = var_17_0 + 1
			end
		end
	end

	DebugPrint("Options Count: " .. var_17_0)

	local var_17_5 = {}
	local var_17_6 = var_0_14(arg_17_0, var_17_5)

	DebugPrint("Elem Count: " .. var_17_6)
end

local function var_0_16(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = StringTable.BFHCAIIDA(arg_18_2.file)
	local var_18_1 = {}
	local var_18_2
	local var_18_3
	local var_18_4
	local var_18_5 = {}
	local var_18_6
	local var_18_7
	local var_18_8
	local var_18_9
	local var_18_10

	if arg_18_2.cols.showInGame then
		var_18_8 = not Engine.DDJFBBJAIG()
	end

	if arg_18_2.cols.requireKBM then
		var_18_9 = Engine.JDFDCGCIJ(arg_18_1)
	end

	for iter_18_0 = 0, var_18_0 - 1 do
		local var_18_11 = StringTable.CBGJCDIHCE(arg_18_2.file, iter_18_0, arg_18_2.cols.identifier)
		local var_18_12 = StringTable.CBGJCDIHCE(arg_18_2.file, iter_18_0, arg_18_2.cols.categoryName)
		local var_18_13 = false

		if arg_18_2.cols.showInGame then
			local var_18_14 = StringTable.CBGJCDIHCE(arg_18_2.file, iter_18_0, arg_18_2.cols.showInGame) ~= "N"

			var_18_13 = var_18_8 and not var_18_14
		end

		if not var_18_13 and arg_18_2.cols.requireKBM then
			var_18_13 = StringTable.CBGJCDIHCE(arg_18_2.file, iter_18_0, arg_18_2.cols.requireKBM) == "Y" and not var_18_9
		end

		if var_18_12 ~= "" then
			if var_18_3 then
				var_18_1[#var_18_1 + 1] = {
					name = var_18_3,
					optionsList = var_18_5,
					id = var_18_2
				}
			end

			var_18_4 = var_18_13

			if not var_18_13 then
				var_18_2 = var_18_11
				var_18_3 = var_18_12
				var_18_5 = {}
			else
				var_18_3 = nil
			end
		elseif not var_18_4 then
			var_18_5[#var_18_5 + 1] = var_18_11
		end
	end

	if var_18_3 then
		var_18_1[#var_18_1 + 1] = {
			name = var_18_3,
			optionsList = var_18_5,
			id = var_18_2
		}
	end

	return var_18_1
end

local function var_0_17(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(var_0_1(arg_19_0)) do
		iter_19_1:processEvent({
			name = "refresh_option",
			controllerIndex = arg_19_1
		})
	end
end

local function var_0_18(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	for iter_20_0, iter_20_1 in ipairs(var_0_1(arg_20_0)) do
		if iter_20_1.id == arg_20_1 then
			iter_20_1:processEvent({
				name = "request_disable",
				disableSource = arg_20_3,
				disable = arg_20_2
			})
			iter_20_1:processEvent({
				name = "parent_value_changed",
				parentId = arg_20_3,
				parentValue = arg_20_4
			})

			break
		end
	end
end

local function var_0_19(arg_21_0, arg_21_1)
	local var_21_0 = StringTable.BFHCAIIDA(arg_21_1.file)
	local var_21_1 = {}
	local var_21_2
	local var_21_3

	for iter_21_0 = 0, var_21_0 - 1 do
		local var_21_4 = StringTable.CBGJCDIHCE(arg_21_1.file, iter_21_0, arg_21_1.cols.identifier)

		if StringTable.CBGJCDIHCE(arg_21_1.file, iter_21_0, arg_21_1.cols.categoryName) == "" then
			var_21_1[#var_21_1 + 1] = var_21_4
		end
	end

	return var_21_1
end

local function var_0_20(arg_22_0, arg_22_1)
	local var_22_0 = Dvar.BJJCJHDBII("NMRKMSMTOO")
	local var_22_1 = LUI.clamp(var_22_0, SliderBounds.Brightness.DvarMin, SliderBounds.Brightness.DvarMax) + arg_22_0.colorModifier
	local var_22_2 = LUI.clamp(var_22_1, 0, 1)

	arg_22_0.Background:SetRGBFromTable({
		r = var_22_2,
		g = var_22_2,
		b = var_22_2
	})
end

local function var_0_21(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = CONDITIONS.IsBRGameType()
	local var_23_1 = Engine.BECCFCBIAA(OPTIONS.GetCurrentGpadButtonsConfigName(var_23_0), arg_23_1)
	local var_23_2, var_23_3 = string.gsub(var_23_1, "_alt", "")
	local var_23_4

	if CONDITIONS.IsSplitscreen() then
		var_23_4 = var_0_2(arg_23_0, "ButtonLayoutSplitscreen")
	elseif var_23_0 then
		var_23_4 = var_0_2(arg_23_0, "BRButtonLayout")
	else
		var_23_4 = var_0_2(arg_23_0, "ButtonLayout")
	end

	if var_23_4 then
		if arg_23_2 or var_23_3 > 0 then
			Engine.CBCIHEGADA(var_23_2, arg_23_1, var_23_0)

			if var_23_4 and var_23_4.Dropdown then
				if var_23_0 then
					var_23_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetBRButtonLayoutLabels())
				else
					var_23_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetButtonLayoutLabels())
				end
			end
		else
			Engine.CBCIHEGADA(var_23_1 .. "_alt", arg_23_1, var_23_0)

			if var_23_4 and var_23_4.Dropdown then
				if var_23_0 then
					var_23_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetBRButtonLayoutAltLabels())
				else
					var_23_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetButtonLayoutAltLabels())
				end
			end
		end
	end
end

local function var_0_22(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_2 and not arg_24_0.StickLayoutOptionsMenu then
		local var_24_0
		local var_24_1 = MenuBuilder.BuildRegisteredType("StickLayoutOptionsMenu", {
			controllerIndex = arg_24_1
		})

		var_24_1.id = "StickLayoutOptionsMenu"

		var_24_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 350, _1080p * 810)
		arg_24_0:addElement(var_24_1)

		arg_24_0.StickLayoutOptionsMenu = var_24_1

		if arg_24_0.isMenuInitiallized then
			arg_24_0.StickLayoutOptionsMenu:processEvent({
				name = "menu_create",
				controller = arg_24_1
			})
		end
	elseif not arg_24_2 and arg_24_0.StickLayoutOptionsMenu then
		arg_24_0.StickLayoutOptionsMenu:closeTree()

		arg_24_0.StickLayoutOptionsMenu = nil
	end
end

local function var_0_23(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_2 and not arg_25_0.NetworkInfoWidget and not arg_25_0.ConnectionMeter and not CONDITIONS.IsSplitscreen() then
		local var_25_0
		local var_25_1 = MenuBuilder.BuildRegisteredType("NetworkInfos", {
			controllerIndex = arg_25_1
		})

		var_25_1.id = "NetworkInfos"

		if IsLanguageArabic() then
			var_25_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1328, _1080p * 1790, _1080p * 695, _1080p * 865)
		else
			var_25_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1458, _1080p * 695, _1080p * 865)
		end

		arg_25_0:addElement(var_25_1)

		arg_25_0.NetworkInfosWidget = var_25_1

		local var_25_2 = MenuBuilder.BuildRegisteredType("ConnectionMeter", {
			controllerIndex = arg_25_1
		})

		var_25_2.id = "ConnectionMeter"

		if IsLanguageArabic() then
			var_25_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1328, _1080p * 1790, _1080p * 515, _1080p * 685)
		else
			var_25_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1458, _1080p * 515, _1080p * 685)
		end

		arg_25_0:addElement(var_25_2)

		arg_25_0.ConnectionMeter = var_25_2
	elseif (CONDITIONS.IsSplitscreen() or not arg_25_2) and arg_25_0.NetworkInfosWidget and arg_25_0.ConnectionMeter then
		arg_25_0.NetworkInfosWidget:closeTree()

		arg_25_0.NetworkInfosWidget = nil

		arg_25_0.ConnectionMeter:closeTree()

		arg_25_0.ConnectionMeter = nil
	end
end

local function var_0_24(arg_26_0, arg_26_1)
	if arg_26_1 and not arg_26_0._dvrDisabled then
		CoD.GameDVRDisable()

		arg_26_0._dvrDisabled = true
	elseif not arg_26_1 and arg_26_0._dvrDisabled then
		CoD.GameDVREnable()

		arg_26_0._dvrDisabled = false
	end
end

local function var_0_25(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_2 and not arg_27_0.MicLevelSliderBar then
		local var_27_0 = MenuBuilder.BuildRegisteredType("MicLevelSliderBar", {
			controllerIndex = arg_27_1
		})

		var_27_0.id = "MicLevelSliderBar"

		if IsLanguageArabic() then
			var_27_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1164, _1080p * 1790, _1080p * 847, _1080p * 912)
		else
			var_27_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 988, _1080p * 1624, _1080p * 847, _1080p * 912)
		end

		arg_27_0:addElement(var_27_0)

		arg_27_0.MicLevelSliderBar = var_27_0

		arg_27_0.MicLevelSliderBar:Show()
	elseif not arg_27_2 and arg_27_0.MicLevelSliderBar then
		arg_27_0.MicLevelSliderBar:closeTree()

		arg_27_0.MicLevelSliderBar = nil
	end
end

local function var_0_26(arg_28_0, arg_28_1)
	if arg_28_0.PlayPrompt then
		arg_28_0:RemoveButtonHelperTextFromElement(arg_28_0.ButtonHelperBar, "button_alt1", "left")

		if arg_28_0._soundId == nil or not Engine.CHFEJIG(arg_28_0._soundId) then
			arg_28_0._soundId = Engine.BJDBIAGIDA("ui_audio_test")

			arg_28_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/STOP_AUDIO_PROMPT"), 0)
			arg_28_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/STOP")
			})

			if arg_28_0.checkSoundTimer then
				arg_28_0:RemoveElement(arg_28_0.checkSoundTimer)
				arg_28_0.checkSoundTimer:closeTree()

				arg_28_0.checkSoundTimer = nil
			end

			arg_28_0.checkSoundTimer = LUI.UITimer.new({
				interval = 45,
				event = "checkSound"
			})

			arg_28_0:addElement(arg_28_0.checkSoundTimer)
		else
			Engine.EAGBECEBGA(arg_28_0._soundId)

			arg_28_0._soundId = nil

			arg_28_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_28_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
			})

			if arg_28_0.checkSoundTimer then
				arg_28_0:RemoveElement(arg_28_0.checkSoundTimer)
				arg_28_0.checkSoundTimer:closeTree()

				arg_28_0.checkSoundTimer = nil
			end
		end
	end
end

local function var_0_27(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_2 and not arg_29_0.PlayPrompt then
		local var_29_0 = LUI.UIText.new()

		var_29_0.id = "PlayPrompt"

		var_29_0:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
		var_29_0:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
		var_29_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_29_0:SetAlignment(LUI.Alignment.Left)
		var_29_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 920, _1080p * 189, _1080p * 209)
		arg_29_0:addElement(var_29_0)

		arg_29_0.PlayPrompt = var_29_0
		arg_29_0._soundId = nil

		arg_29_0:registerEventHandler("checkSound", function(arg_30_0, arg_30_1)
			if arg_29_0._soundId and not Engine.CHFEJIG(arg_29_0._soundId) then
				arg_29_0._soundId = nil

				arg_29_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
				arg_29_0:AddButtonHelperText({
					kbm_only = true,
					priority = 2,
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
				})

				if arg_29_0.checkSoundTimer then
					arg_29_0:RemoveElement(arg_29_0.checkSoundTimer)
					arg_29_0.checkSoundTimer:closeTree()

					arg_29_0.checkSoundTimer = nil
				end
			end
		end)
		arg_29_0:AddButtonHelperText({
			kbm_only = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
		})
	elseif not arg_29_2 and arg_29_0.PlayPrompt then
		arg_29_0.PlayPrompt:closeTree()

		arg_29_0.PlayPrompt = nil

		if arg_29_0._soundId then
			Engine.EAGBECEBGA(arg_29_0._soundId)

			arg_29_0._soundId = nil
		end

		arg_29_0:RemoveButtonHelperTextFromElement(arg_29_0.ButtonHelperBar, "button_alt1", "left")

		if arg_29_0.checkSoundTimer then
			arg_29_0:RemoveElement(arg_29_0.checkSoundTimer)
			arg_29_0.checkSoundTimer:closeTree()

			arg_29_0.checkSoundTimer = nil
		end
	end
end

local function var_0_28(arg_31_0, arg_31_1)
	if not arg_31_0.SwapTriggersPrompt then
		local var_31_0
		local var_31_1 = MenuBuilder.BuildRegisteredType("SwapTriggersPrompt", {
			controllerIndex = arg_31_1
		})

		var_31_1.id = "SwapTriggersPrompt"

		var_31_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 310, _1080p * 350)
		arg_31_0:addElement(var_31_1)

		arg_31_0.SwapTriggersPrompt = var_31_1

		if arg_31_0.isMenuInitiallized then
			arg_31_0.SwapTriggersPrompt:processEvent({
				name = "menu_create",
				controller = arg_31_1
			})
		end
	end
end

local function var_0_29(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4)
	if arg_32_2 and not arg_32_0.ButtonLayoutOptionsMenu then
		local var_32_0
		local var_32_1 = MenuBuilder.BuildRegisteredType("ButtonLayoutOptionsMenu", {
			controllerIndex = arg_32_1,
			isBR = arg_32_3
		})

		var_32_1.id = "ButtonLayoutOptionsMenu"

		var_32_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 350, _1080p * 874)
		arg_32_0:addElement(var_32_1)

		arg_32_0.ButtonLayoutOptionsMenu = var_32_1

		if not arg_32_4 then
			var_32_1:SetAlpha(0)
		end

		if arg_32_0.isMenuInitiallized then
			arg_32_0.ButtonLayoutOptionsMenu:processEvent({
				name = "menu_create",
				controller = arg_32_1
			})
		end

		var_0_28(arg_32_0, arg_32_1)
	elseif not arg_32_2 and arg_32_0.ButtonLayoutOptionsMenu then
		arg_32_0.ButtonLayoutOptionsMenu:closeTree()

		arg_32_0.ButtonLayoutOptionsMenu = nil

		if arg_32_0.SwapTriggersPrompt then
			arg_32_0.SwapTriggersPrompt:closeTree()

			arg_32_0.SwapTriggersPrompt = nil
		end
	end
end

local function var_0_30(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_2 and not arg_33_0.CalibrationGuide then
		local var_33_0
		local var_33_1 = MenuBuilder.BuildRegisteredType("CalibrationGuide", {
			controllerIndex = arg_33_1
		})

		var_33_1.id = "CalibrationGuide"

		if IsLanguageArabic() then
			var_33_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1061, _1080p * 1696, _1080p * 300, _1080p * 832)
		else
			var_33_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1611, _1080p * 300, _1080p * 832)
		end

		arg_33_0:addElement(var_33_1)

		arg_33_0.CalibrationGuide = var_33_1

		arg_33_0.CalibrationGuide:SetSwatchUpdateHandler(var_0_20)

		local var_33_2 = Engine.FFFHHEJDI()

		arg_33_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier = arg_33_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier + var_33_2

		arg_33_0.CalibrationGuide:processEvent({
			name = "calibration_updated"
		})
	elseif not arg_33_2 and arg_33_0.CalibrationGuide then
		arg_33_0.CalibrationGuide:closeTree()

		arg_33_0.CalibrationGuide = nil
	end
end

local function var_0_31(arg_34_0)
	if arg_34_0.OptionName then
		arg_34_0.OptionName:SetAlpha(0)
	end

	var_0_29(arg_34_0, controllerIndex, false)
	var_0_22(arg_34_0, controllerIndex, false)
	var_0_30(arg_34_0, controllerIndex, false)

	if arg_34_0.ButtonDescriptionText.Description then
		arg_34_0.ButtonDescriptionText.Description:SetAlpha(0)
	end

	if arg_34_0.ImagePreview then
		arg_34_0.ImagePreview:SetAlpha(0)

		if not arg_34_0._imageHidden then
			arg_34_0._imageHidden = true

			if arg_34_0._firstAnim then
				ACTIONS.AnimateSequence(arg_34_0, "InstantHideImagePreview")

				arg_34_0._firstAnim = false
			else
				ACTIONS.AnimateSequence(arg_34_0, "HideImagePreview")
			end
		end
	end
end

local function var_0_32(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	arg_35_0.isSubCategoriesInFadeOut = arg_35_2

	if arg_35_0.SubcategoriesOptions then
		arg_35_0.SubcategoriesOptions:FadeCategories(arg_35_2, arg_35_1)
	end

	arg_35_0.OptionWindow:FadeOptions(arg_35_3)
end

local function var_0_33(arg_36_0, arg_36_1)
	if CONDITIONS.InGameAndBR(arg_36_0) and DataSources.inGame.player.BRData then
		DataSources.inGame.player.BRData.PlayerStatusIsInSettings:SetValue(arg_36_1, false)
	end

	local var_36_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_36_1)
	local var_36_1 = LUI.FlowManager.GetScopedData(arg_36_0)
	local var_36_2 = {}
	local var_36_3 = Engine.CGABICJHAI()
	local var_36_4 = not CONDITIONS.IsSplitscreen() or Engine.DDJFBBJAIG() or arg_36_1 == Engine.IJEBHJIJF()
	local var_36_5 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_36_1)

	if not var_36_0.selectedCategoryIndex then
		var_36_0.selectedCategoryIndex = {}
	end

	if var_36_3 then
		var_36_2[#var_36_2 + 1] = {
			id = "keyboardAndMouse",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE")),
			csv = CSV.keyboardAndMouseOptions
		}
	else
		var_36_2[#var_36_2 + 1] = {
			id = "gamepad",
			name = ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")),
			csv = CSV.gamepadOptions
		}
	end

	var_36_2[#var_36_2 + 1] = {
		id = "general",
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GENERAL")),
		csv = CSV.generalOptions
	}

	if var_36_3 then
		var_36_2[#var_36_2 + 1] = {
			applyable = true,
			id = "graphics",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GRAPHICS")),
			csv = CSV.videoOptions,
			applyAction = var_0_12,
			resetAction = var_0_11
		}
	end

	if var_36_4 then
		var_36_2[#var_36_2 + 1] = {
			id = "audio",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/AUDIO")),
			csv = CSV.audioOptions
		}
	end

	if var_36_3 then
		var_36_2[#var_36_2 + 1] = {
			id = "gamepad",
			name = ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")),
			csv = CSV.gamepadOptions
		}
	else
		var_36_2[#var_36_2 + 1] = {
			id = "keyboardAndMouse",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE")),
			csv = CSV.keyboardAndMouseOptions,
			visible = Engine.JDFDCGCIJ(arg_36_1)
		}
	end

	if var_36_5 and Dvar.IBEGCHEFE("lui_disable_codcaster_options_tab") ~= true then
		var_36_2[#var_36_2 + 1] = {
			id = "codCaster",
			name = ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/CODCASTER_TITLE")),
			csv = CSV.codCasterOptions
		}
	end

	if var_36_4 then
		var_36_2[#var_36_2 + 1] = {
			id = "account",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCOUNT_TAB")),
			csv = CSV.accountOptions
		}
	end

	if Engine.BHICADFIHA() or Engine.BGAAHHAGAC() then
		var_36_2[#var_36_2 + 1] = {
			id = "debug",
			name = "DEBUG",
			visible = true,
			csv = CSV.debugOptions
		}
	end

	local var_36_6 = var_36_1.activeTabId

	if var_36_6 then
		for iter_36_0, iter_36_1 in ipairs(var_36_2) do
			if iter_36_1.id == var_36_6 then
				var_36_0.activeTabIndex = iter_36_0

				break
			end
		end
	end

	local var_36_7 = {}

	for iter_36_2, iter_36_3 in ipairs(var_36_2) do
		if iter_36_3.visible == nil or iter_36_3.visible then
			table.insert(var_36_7, {
				name = iter_36_3.name,
				disabled = iter_36_3.disabled,
				hasDefaultFocus = iter_36_2 == var_36_0.activeTabIndex,
				focusCondition = function(arg_37_0, arg_37_1, arg_37_2)
					if #arg_36_0.modifiedOptions > 0 and arg_37_1 ~= var_36_0.activeTabIndex - 1 then
						var_36_1.requestedTab = {
							tabIndex = arg_37_1,
							focusType = arg_37_2
						}

						arg_36_0:HandleFlowRequest(arg_37_0, var_0_0.tabChange)

						return false
					else
						return true
					end
				end,
				focusFunction = function(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
					arg_36_0.tabName = iter_36_3.name
					arg_36_0.tabId = iter_36_3.id
					arg_36_0.tabCSV = iter_36_3.csv
					arg_36_0.applyAction = iter_36_3.applyAction
					arg_36_0.resetAction = iter_36_3.resetAction

					if var_36_0.activeTabIndex and iter_36_2 == var_36_0.activeTabIndex and arg_36_0.OptionWindow.buttonList and arg_36_0.OptionWindow.buttonList._activeElement then
						return
					end

					var_36_1.requestedTab = nil

					arg_36_0:dispatchEventToChildren({
						name = "remove_overlays"
					})

					local var_38_0
					local var_38_1
					local var_38_2

					if arg_36_0.OptionsGraphicsSliderBar then
						if iter_36_3.id == "graphics" then
							arg_36_0.OptionsGraphicsSliderBar:processEvent({
								name = "refresh_vram"
							})
							arg_36_0.OptionsGraphicsSliderBar:processEvent({
								name = "show"
							})
						else
							arg_36_0.OptionsGraphicsSliderBar:processEvent({
								name = "hide"
							})
						end
					end

					if iter_36_3.id == "keyboardAndMouse" then
						arg_36_0:AddButtonHelperText({
							clickable = true,
							priority = 9,
							side = "left",
							button_ref = "button_right_trigger",
							helper_text = Engine.CBBHFCGDIC("MENU/RESET_ALL_KEYBINDS")
						})
					elseif iter_36_3.id == "codCaster" then
						arg_36_0:AddButtonHelperText({
							clickable = true,
							priority = 9,
							side = "left",
							button_ref = "button_right_trigger",
							helper_text = Engine.CBBHFCGDIC("MENU/RESET_ALL_CODCASTER_KEYBINDS")
						})
					else
						arg_36_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_right_trigger",
							helper_text = "",
							priority = 9
						})
					end

					if not Engine.CAADCDEEIA() then
						if iter_36_3.id == "audio" then
							var_0_25(arg_36_0, arg_38_1, true)
						else
							var_0_25(arg_36_0, arg_38_1, false)
						end
					end

					var_0_27(arg_36_0, arg_38_1, iter_36_3.id == "audio")
					var_0_23(arg_36_0, arg_38_1, iter_36_3.id == "account")
					var_0_24(arg_36_0, iter_36_3.id == "account")

					if iter_36_3.id == "keyboardAndMouse" or iter_36_3.id == "codCaster" then
						ACTIONS.AnimateSequence(arg_36_0, "ShowSecondaryTabs")

						local var_38_3 = var_0_16(arg_36_0, arg_38_1, iter_36_3.csv)
						local var_38_4 = {}
						local var_38_5 = LUI.FlowManager.GetPerControllerPersistentData(arg_38_1)

						if not arg_36_0.SubcategoriesOptions then
							local var_38_6
							local var_38_7 = MenuBuilder.BuildRegisteredType("OptionCategories", {
								controllerIndex = arg_38_1
							})

							var_38_7.id = "SubcategoriesOptions"

							var_38_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 300, _1080p * 170, _1080p * 600)
							arg_36_0:addElement(var_38_7)

							arg_36_0.SubcategoriesOptions = var_38_7

							arg_36_0.SubcategoriesOptions:registerEventHandler("category_changed", function(arg_39_0, arg_39_1)
								if not arg_36_0._imageHidden then
									ACTIONS.AnimateSequence(arg_36_0, "HideImagePreview")

									arg_36_0._imageHidden = true
								end

								var_38_5.selectedCategoryIndex[arg_36_0.tabId] = arg_39_1.index
								arg_39_0.subCategoryName = arg_39_0.options[arg_39_1.index].Text:getText()

								var_0_31(arg_36_0)
								arg_36_0.OptionWindow:UpdateOptions(arg_38_1, arg_39_1.createOptions, arg_36_0.optionsList)

								arg_36_0.OptionWindow.buttonList.noFocus = arg_39_1.noFocus

								if not arg_39_1.mouse then
									if not arg_39_1.noFocus then
										var_0_32(arg_36_0, arg_38_1, true)

										if #arg_36_0.OptionWindow.options > 0 then
											arg_36_0:processEvent({
												name = "update_button_name",
												buttonName = arg_36_0.OptionWindow.options[1].buttonName
											})
										end
									else
										var_0_32(arg_36_0, arg_38_1, false, true)
									end
								end

								var_0_17(arg_36_0, arg_39_1.controller)
							end)
						end

						arg_36_0.OptionsKeyBindingBanner:SetAlpha(1, 200)

						if not var_38_5.selectedCategoryIndex[iter_36_3.id] or not var_38_3[var_38_5.selectedCategoryIndex[iter_36_3.id]] then
							var_38_5.selectedCategoryIndex[iter_36_3.id] = 1
						end

						var_38_0 = OPTIONS.CreateOptionList(arg_36_0, arg_38_1, var_38_3[var_38_5.selectedCategoryIndex[iter_36_3.id]].optionsList, iter_36_3.applyable)

						function var_38_2(arg_40_0, arg_40_1)
							for iter_40_0, iter_40_1 in ipairs(var_38_3) do
								local var_40_0 = OPTIONS.CreateOptionCategory(arg_40_0, arg_40_1, iter_40_1, iter_40_0)

								var_40_0:addEventHandler("button_action", function(arg_41_0, arg_41_1)
									if not LUI.IsLastInputMouseNavigation(arg_40_1) then
										arg_41_0:GetCurrentMenu():processEvent({
											name = "gain_focus",
											controller = arg_41_1.controller
										})
										arg_41_0:GetCurrentMenu():processEvent({
											name = "lose_focus",
											controller = arg_41_1.controller
										})
									end
								end)

								var_38_4[#var_38_4 + 1] = var_40_0
							end

							return var_38_4
						end
					else
						ACTIONS.AnimateSequence(arg_36_0, "HideSecondaryTabs")

						local var_38_8 = var_0_19(arg_36_0, iter_36_3.csv)

						var_38_0 = OPTIONS.CreateOptionList(arg_36_0, arg_38_1, var_38_8, iter_36_3.applyable)

						if arg_36_0.SubcategoriesOptions then
							arg_36_0.SubcategoriesOptions:closeTree()

							arg_36_0.SubcategoriesOptions = nil
						end

						if iter_36_3.id == "audio" then
							arg_36_0.OptionsKeyBindingBanner:SetAlpha(1, 200)
						else
							arg_36_0.OptionsKeyBindingBanner:SetAlpha(0, 200)
						end
					end

					var_0_31(arg_36_0)

					if not var_36_1.alreadyLoaded and var_36_0.selectedOptionIndex and not arg_36_0.SubcategoriesOptions then
						local var_38_9 = #arg_36_0.optionsList < var_36_0.selectedOptionIndex and var_36_0.selectedOptionIndex or nil

						arg_36_0.OptionWindow:UpdateOptions(arg_38_1, var_38_0, arg_36_0.optionsList, nil, var_38_9)
					else
						arg_36_0.OptionWindow:UpdateOptions(arg_38_1, var_38_0, arg_36_0.optionsList)
					end

					var_36_1.alreadyLoaded = true

					if arg_36_0.SubcategoriesOptions then
						local var_38_10 = var_36_0.selectedCategoryIndex[arg_36_0.tabId]

						arg_36_0.SubcategoriesOptions:UpdateOptions(arg_38_1, var_38_2, arg_36_0.optionsList, nil, var_38_10)
					end

					if not LUI.IsLastInputMouseNavigation(arg_38_1) then
						if not arg_36_0.SubcategoriesOptions then
							var_0_32(arg_36_0, arg_38_1, true, false)
						else
							var_0_32(arg_36_0, arg_38_1, false, true)
						end

						arg_36_0:processEvent({
							name = "gain_focus",
							controller = arg_38_1,
							shouldPlayButtonSound = not arg_36_0._firstTabFocus
						})
						arg_36_0:processEvent({
							name = "lose_focus",
							controller = arg_38_1
						})

						if arg_36_0._firstTabFocus == true then
							arg_36_0._firstTabFocus = false
						end
					end

					var_36_0.activeTabIndex = iter_36_2

					var_0_17(arg_36_0, arg_38_1)
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end
	end

	arg_36_0.Tabs:SetTabs(var_36_7)
	arg_36_0.Tabs:SizeTabsToFit()
end

local function var_0_34(arg_42_0, arg_42_1, arg_42_2)
	Engine.BBHEIABDAC(arg_42_1)
end

local function var_0_35(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = MenuBuilder.BuildRegisteredType(arg_43_2, {
		controllerIndex = arg_43_1
	})

	var_43_0.id = arg_43_2

	var_43_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1020, _1080p * 1770, _1080p * 415, _1080p * 665)
	arg_43_0:addElement(var_43_0)
	arg_43_3.button:addEventHandler("button_over", function(arg_44_0, arg_44_1)
		var_43_0:processEvent({
			name = arg_43_3.guideEventOver
		})

		if CONDITIONS.IsSplitscreen(arg_43_0) then
			var_43_0:SetTop(150)
			var_43_0:SetLeft(_1080p * 1344)
		end
	end)
	arg_43_3.button:addEventHandler("button_up", function(arg_45_0, arg_45_1)
		var_43_0:processEvent({
			name = arg_43_3.guideEventUp
		})
	end)

	return var_43_0
end

local function var_0_36(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_1:getParent()

	if var_46_0._customPreviewButtonAction then
		LUI.FlowManager.GetScopedData(arg_46_1).alreadyLoaded = nil

		arg_46_0:dispatchEventToChildren({
			name = "remove_overlays"
		})
		var_46_0._customPreviewButtonAction(arg_46_1, arg_46_2)
	elseif var_46_0._detailedPreviewImage then
		local var_46_1 = var_46_0.OptionName:getText()
		local var_46_2 = var_46_0.ButtonDescriptionText.Description:getText()
		local var_46_3 = var_46_0._detailedPreviewImage

		if not var_46_0.optionDetailPreview then
			local var_46_4 = MenuBuilder.BuildRegisteredType("OptionDetailPreview", {
				controllerIndex = arg_46_2,
				name = var_46_1,
				description = var_46_2,
				image = var_46_3
			})

			var_46_4.id = "optionDetailPreview"

			var_46_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
			var_46_0:addElement(var_46_4)

			var_46_0.optionDetailPreview = var_46_4
		end
	end
end

local function var_0_37(arg_47_0, arg_47_1)
	local var_47_0 = {}

	for iter_47_0, iter_47_1 in ipairs(arg_47_1) do
		local var_47_1 = arg_47_0[iter_47_1]

		if var_47_1 then
			table.insert(var_47_0, Engine.CBBHFCGDIC(var_47_1))
		end
	end

	local var_47_2 = ", "

	if IsLanguageArabic() then
		var_47_0 = LUI.ReverseTable(var_47_0)
		var_47_2 = " , "
	end

	return table.concat(var_47_0, var_47_2)
end

local function var_0_38(arg_48_0, arg_48_1)
	arg_48_0:addEventHandler("key_bound_banner", function(arg_49_0, arg_49_1)
		if arg_49_0.OptionsKeyBindingBanner then
			local var_49_0 = Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS", Engine.JCBDICCAH(arg_49_1.binding), arg_49_1.optionName)
			local var_49_1 = "Success"
			local var_49_2 = arg_49_1.unboundCommands and #arg_49_1.unboundCommands > 1

			if arg_49_1.invalidBinding then
				var_49_0 = Engine.CBBHFCGDIC("MENU/BINDING_INVALID", Engine.JCBDICCAH(arg_49_1.binding), arg_49_1.optionName)
				var_49_1 = "Error"
			elseif var_49_2 then
				local var_49_3 = var_0_37(arg_49_0._keybindActionList, arg_49_1.unboundCommands)

				if var_49_3 then
					var_49_0 = Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS_REASSIGNED", Engine.JCBDICCAH(arg_49_1.binding), arg_49_1.optionName, var_49_3)
					var_49_1 = "Error"
				end
			elseif arg_49_1.unboundCommands[1] ~= "" and arg_49_1.currentCmd ~= arg_49_1.unboundCommands[1] then
				local var_49_4 = arg_49_0._keybindActionList[arg_49_1.unboundCommands[1]]

				if var_49_4 and arg_49_1.optionName ~= Engine.CBBHFCGDIC(var_49_4) then
					var_49_0 = Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS_REASSIGNED", Engine.JCBDICCAH(arg_49_1.binding), arg_49_1.optionName, Engine.CBBHFCGDIC(var_49_4))
					var_49_1 = "Error"
				end
			end

			arg_49_0.OptionsKeyBindingBanner.Text:setText(var_49_0)
			ACTIONS.AnimateSequence(arg_49_0.OptionsKeyBindingBanner, var_49_1)

			if arg_49_0._timer then
				arg_49_0._timer:closeTree()

				arg_49_0._timer = nil
			end

			arg_49_0._timer = LUI.UITimer.new({
				interval = 6000,
				event = "hide_banner"
			})

			arg_49_0:addElement(arg_49_0._timer)
		end
	end)
	arg_48_0:addEventHandler("binding_key", function(arg_50_0, arg_50_1)
		if arg_50_0.OptionsKeyBindingBanner then
			if arg_50_0._timer then
				arg_50_0._timer:closeTree()

				arg_50_0._timer = nil
			end

			arg_50_0.OptionsKeyBindingBanner.Text:setText(Engine.CBBHFCGDIC("MENU/BINDING_INSTRUCTION"))
			ACTIONS.AnimateSequence(arg_50_0.OptionsKeyBindingBanner, "Binding")
		end
	end)
	arg_48_0:addEventHandler("hide_banner", function(arg_51_0, arg_51_1)
		if arg_51_0.OptionsKeyBindingBanner then
			ACTIONS.AnimateSequence(arg_51_0.OptionsKeyBindingBanner, "BackToDefault")
		end

		return true
	end)
end

local function var_0_39(arg_52_0)
	local var_52_0 = CSV.options
	local var_52_1 = StringTable.BJJBBCJGEJ(var_52_0.file, var_52_0.cols.identifier, arg_52_0)
	local var_52_2 = {
		id = arg_52_0,
		type = StringTable.CBGJCDIHCE(var_52_0.file, var_52_1, var_52_0.cols.type),
		name = StringTable.CBGJCDIHCE(var_52_0.file, var_52_1, var_52_0.cols.name),
		description = StringTable.CBGJCDIHCE(var_52_0.file, var_52_1, var_52_0.cols.description)
	}

	var_52_2.name = Engine.CBBHFCGDIC(var_52_2.name)
	var_52_2.description = Engine.CBBHFCGDIC(var_52_2.description)

	if var_52_0.cols.labels ~= nil then
		local var_52_3 = StringTable.CBGJCDIHCE(var_52_0.file, var_52_1, var_52_0.cols.labels)

		if var_52_3 ~= "" then
			var_52_2.labels = {}

			local var_52_4 = LUI.Split(var_52_3, ";")

			for iter_52_0 = 1, #var_52_4 do
				var_52_2.labels[iter_52_0] = Engine.CBBHFCGDIC(var_52_4[iter_52_0])
			end
		end
	end

	if OPTIONS_DATA.optionsDataList[arg_52_0] then
		local var_52_5 = OPTIONS_DATA.optionsDataList[arg_52_0]

		for iter_52_1, iter_52_2 in pairs(var_52_5) do
			var_52_2[iter_52_1] = iter_52_2
		end
	end

	var_52_2.optionsList = optionsList

	return var_52_2
end

local function var_0_40(arg_53_0, arg_53_1)
	if Engine.BIIBDBAHD() then
		local var_53_0 = Regulations.BGEIIEHJFD(arg_53_1, OPTIONS.regulationType.CCPA)

		if var_53_0 == OPTIONS.regulationEnforcement.UNKNOWN or var_53_0 == OPTIONS.regulationEnforcement.ENFORCEMENT_ERROR then
			if arg_53_0._fetchTimerHolder.count < OPTIONS.CCPA_REQUEST_MAX_COUNT then
				arg_53_0._fetchTimerHolder:Wait(OPTIONS.CCPA_REQUEST_INTERVAL).onComplete = function()
					arg_53_0:GetEnforcement(arg_53_1)
				end
				arg_53_0._fetchTimerHolder.count = arg_53_0._fetchTimerHolder.count + 1
			end
		elseif var_53_0 == OPTIONS.regulationEnforcement.ENFORCED then
			local var_53_1 = "DoNotSellMyData"
			local var_53_2 = var_0_39(var_53_1)

			arg_53_0.optionsList[var_53_1] = var_53_2
		end
	end
end

local function var_0_41(arg_55_0, arg_55_1, arg_55_2)
	arg_55_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS"))

	arg_55_0._firstAnim = true
	arg_55_0._firstTabFocus = true
	arg_55_0.isMenuInitiallized = false
	arg_55_0.HandleFlowRequest = var_0_7

	arg_55_0:registerEventHandler("add_button_helper_text", function(arg_56_0, arg_56_1)
		arg_56_0.ButtonHelperBar:processEvent(arg_56_1)

		return true
	end)
	arg_55_0:registerEventHandler("update_current_grid_focus", function(arg_57_0, arg_57_1)
		arg_57_0.OptionWindow.buttonList:processEvent(arg_57_1)

		return true
	end)
	arg_55_0:addEventHandler("menu_create", function(arg_58_0, arg_58_1)
		arg_55_0.isMenuInitiallized = true
	end)
	arg_55_0:addEventHandler("input_connection", function(arg_59_0, arg_59_1)
		arg_59_0:SetupTabs(arg_59_1.controllerIndex)
	end)
	LUI.TextChat.SetupMenuForSingleLine(arg_55_0)

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_55_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = false,
			controllerIndex = arg_55_1
		})

		arg_55_0:addElement(var_55_0)
	end

	assert(arg_55_0.bindButton)

	if not Engine.DDJFBBJAIG() then
		arg_55_0.BackgroundMP:SetAlpha(0.5)
		arg_55_0.Background:SetAlpha(0)
		arg_55_0:addEventHandler("menu_create", function()
			arg_55_0:AddButtonHelperText({
				clickable = true,
				priority = 11,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_55_0.bindButton:addEventHandler("button_start", function(arg_61_0, arg_61_1)
			arg_55_0:HandleFlowRequest(arg_55_1, var_0_0.dismiss, false)
		end)
	else
		arg_55_0.BackgroundMP:SetAlpha(0)
		arg_55_0.Background:SetAlpha(1)
		LAYOUT.AddAspectRatioFadeFrame(arg_55_0, arg_55_1)
	end

	function arg_55_0.closeTree(arg_62_0)
		OPTIONS.OptionsToReset = {}

		LUI.UIElement.closeTree(arg_62_0)
	end

	assert(arg_55_0.OptionWindow)

	local function var_55_1(arg_63_0, arg_63_1)
		if arg_63_0._customPreviewButtonAction then
			arg_63_0:AddButtonHelperText({
				side = "left",
				priority = 10,
				gamepad_only = true,
				button_ref = "button_r3",
				helper_text = arg_63_1
			})
		else
			arg_63_0:AddButtonHelperText({
				side = "left",
				priority = 10,
				gamepad_only = true,
				button_ref = "button_r3",
				helper_text = ""
			})
		end
	end

	local function var_55_2(arg_64_0, arg_64_1)
		local var_64_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_55_1)

		var_64_0.selectedOptionIndex = arg_64_0.OptionWindow:GetChildIndexInGrid(arg_64_1.previewOption) + 1

		arg_64_0.OptionWindow.buttonList:SetDefaultFocus({
			x = 0,
			y = var_64_0.selectedOptionIndex - 1
		})

		if not arg_64_0.ApplyingChanges then
			arg_64_0.CurrentSelectedOption = var_64_0.selectedOptionIndex - 1
		end

		assert(arg_64_0.ButtonDescriptionText)
		assert(arg_64_0.OptionName)
		assert(arg_64_0.ImagePreview)

		if arg_64_1.description then
			arg_64_0.ButtonDescriptionText.Description:SetAlpha(1)
			arg_64_0.ButtonDescriptionText.Description:setText(arg_64_1.description)
		else
			arg_64_0.ButtonDescriptionText.Description:SetAlpha(0)
		end

		if arg_64_1.buttonName then
			arg_64_0.OptionName:SetAlpha(1)
			arg_64_0.OptionName:setText(ToUpperCase(arg_64_1.buttonName))
		end

		if arg_64_1.image == nil or arg_64_1.image == "" or CONDITIONS.IsSplitscreen() then
			arg_64_0.ImagePreview:SetAlpha(0)

			if not arg_64_0._imageHidden then
				ACTIONS.AnimateSequence(arg_64_0, "HideImagePreview")

				arg_64_0._imageHidden = true
			end
		else
			arg_64_0.ImagePreview:SetAlpha(1)
			arg_64_0.ImagePreview:setImage(RegisterMaterial(arg_64_1.image))

			if arg_64_0._imageHidden then
				ACTIONS.AnimateSequence(arg_64_0, "ShowImagePreview")

				arg_64_0._imageHidden = false
			end
		end

		if arg_64_1.customPreviewButtonAction then
			arg_64_0._previewOption = arg_64_1.previewOption
		end

		if arg_64_1.customPreviewButtonAction and not arg_64_1.disabled then
			arg_64_0._customPreviewButtonAction = arg_64_1.customPreviewButtonAction

			var_55_1(arg_64_0, Engine.CBBHFCGDIC("MENU/MORE_INFO"))
		else
			arg_64_0._customPreviewButtonAction = nil
		end

		if arg_64_1.detailedPreviewImage then
			arg_64_0._detailedPreviewImage = RegisterMaterial(arg_64_1.detailedPreviewImage)

			var_55_1(arg_64_0, Engine.CBBHFCGDIC("MENU/MORE_INFO"))
		else
			arg_64_0._detailedPreviewImage = nil
		end

		if arg_64_1.customPreviewButtonAction == nil and arg_64_1.detailedPreviewImage == nil then
			var_55_1(arg_64_0, "")
		end

		if arg_64_1.resettable and arg_64_1.type ~= "GenericButton" and LUI.IsLastInputGamepad(arg_55_1) then
			arg_64_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt2",
				priority = 9,
				helper_text = Engine.CBBHFCGDIC("MENU/RESET_OPTION")
			})
		else
			arg_64_0:RemoveButtonHelperText("button_alt2", "left")
		end
	end

	arg_55_0:addEventHandler("update_button_selected", var_55_2)
	arg_55_0:addEventHandler("update_input_type", function(arg_65_0, arg_65_1)
		var_55_1(arg_65_0, Engine.CBBHFCGDIC("MENU/MORE_INFO"))
	end)

	local function var_55_3(arg_66_0, arg_66_1)
		for iter_66_0, iter_66_1 in ipairs(arg_55_0.modifiedOptions) do
			if iter_66_1.id == arg_66_1.target.id then
				return
			end
		end

		table.insert(arg_55_0.modifiedOptions, arg_66_1.target)
		var_0_3(arg_66_0, arg_55_1)
	end

	arg_55_0:addEventHandler("add_modified_option", var_55_3)
	arg_55_0:addEventHandler("detail_view_close", function(arg_67_0, arg_67_1)
		arg_67_0.optionDetailPreview:closeTree()

		arg_67_0.optionDetailPreview = nil
	end)
	arg_55_0.bindButton:registerEventHandler("button_right_stick", function(arg_68_0, arg_68_1)
		local var_68_0 = arg_68_0:getParent()

		if (var_68_0._customPreviewButtonAction or var_68_0._detailedPreviewImage and not var_68_0.optionDetailPreview) and arg_68_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end

		var_0_36(arg_55_0, arg_68_0, arg_55_1)
	end)

	arg_55_0.modifiedOptions = {}
	arg_55_0.SetupTabs = var_0_33
	arg_55_0.optionsList = OPTIONS.InitOptionsList(arg_55_0, arg_55_1)

	OPTIONS.InitKeybindOptionsList(arg_55_0, arg_55_1, arg_55_0.optionsList, CSV.keyBindingsOptions)
	OPTIONS.InitKeybindOptionsList(arg_55_0, arg_55_1, arg_55_0.optionsList, CSV.codCasterBindings)
	arg_55_0.OptionWindow:registerEventHandler("subcategory_changed", function(arg_69_0, arg_69_1)
		arg_55_0.OptionWindow:UpdateOptions(arg_55_1, arg_69_1.createOptions, arg_55_0.optionsList)
	end)
	arg_55_0.OptionWindow:registerEventHandler("buttonLayout_over", function(arg_70_0, arg_70_1)
		if arg_70_1.showLayout then
			var_0_29(arg_55_0, arg_55_1, true, arg_70_1.isBR, true)

			if not arg_70_1.isBR then
				arg_55_0.SwapTriggersPrompt:processEvent({
					name = "buttonLayout_over"
				})
			end

			arg_55_0.ButtonLayoutOptionsMenu:processEvent({
				name = "buttonLayout_over"
			})
		end

		if arg_70_1.showSwap then
			var_0_29(arg_55_0, arg_55_1, true, arg_70_1.isBR, false)

			if not arg_70_1.isBR then
				arg_55_0.SwapTriggersPrompt:processEvent({
					name = "buttonLayout_over"
				})
			end
		end

		return true
	end)
	arg_55_0.OptionWindow:registerEventHandler("buttonLayout_up", function()
		var_0_29(arg_55_0, arg_55_1, false)
	end)
	arg_55_0.OptionWindow:registerEventHandler("stickLayout_over", function(arg_72_0, arg_72_1)
		if arg_72_1.showLayout then
			var_0_22(arg_55_0, arg_55_1, true)
			arg_55_0.StickLayoutOptionsMenu:processEvent({
				name = "stickLayout_over"
			})
		end

		return true
	end)
	arg_55_0.OptionWindow:registerEventHandler("stickLayout_up", function(arg_73_0, arg_73_1)
		var_0_22(arg_55_0, arg_55_1, false)
	end)
	arg_55_0.OptionWindow:registerEventHandler("brightness_over", function(arg_74_0, arg_74_1)
		var_0_30(arg_55_0, arg_55_1, true)
	end)
	arg_55_0.OptionWindow:registerEventHandler("brightness_up", function(arg_75_0, arg_75_1)
		var_0_30(arg_55_0, arg_55_1, false)
	end)
	arg_55_0.OptionWindow:registerEventHandler("brightness_updated", function(arg_76_0, arg_76_1)
		if arg_55_0.CalibrationGuide then
			arg_55_0.CalibrationGuide:processEvent({
				name = "calibration_updated"
			})
		end
	end)
	arg_55_0:registerEventHandler("gain_focus", function(arg_77_0, arg_77_1)
		if not arg_77_0.OptionWindow.isFaded then
			return arg_77_0.OptionWindow:processEvent(arg_77_1)
		elseif arg_77_0.SubcategoriesOptions and not arg_77_0.SubcategoriesOptions.isFaded then
			return arg_77_0.SubcategoriesOptions:processEvent(arg_77_1)
		end

		return false
	end)
	arg_55_0:registerEventHandler("lose_focus", function(arg_78_0, arg_78_1)
		if arg_78_0.OptionWindow.isFaded then
			arg_78_0.OptionWindow:processEvent(arg_78_1)
		end

		if arg_78_0.SubcategoriesOptions and arg_78_0.SubcategoriesOptions.isFaded then
			arg_78_0.SubcategoriesOptions:processEvent(arg_78_1)
		end

		if LUI.IsLastInputGamepad(arg_55_1) then
			arg_78_0:dispatchEventToChildren({
				name = "remove_overlays"
			})
		end

		return true
	end)
	arg_55_0:addEventHandler("menu_create", function(arg_79_0, arg_79_1)
		arg_79_0:SetupTabs(arg_79_1.controller)
		var_0_3(arg_55_0, arg_55_1)
	end)
	arg_55_0:addAndCallEventHandler("onVideoChange", function(arg_80_0, arg_80_1)
		var_0_8(arg_80_0, arg_55_1)
	end)
	arg_55_0:addEventHandler("subcategory_option_selected", function(arg_81_0, arg_81_1)
		arg_55_0.OptionWindow:RefreshCurrentOptions()
	end)
	var_0_38(arg_55_0, arg_55_1)
	arg_55_0.bindButton:registerEventHandler("button_secondary", function(arg_82_0, arg_82_1)
		local var_82_0 = arg_82_1.controller or arg_55_1
		local var_82_1 = LUI.FlowManager.GetScopedData(arg_55_0)

		if arg_55_0.optionDetailPreview then
			arg_55_0.optionDetailPreview:closeTree()

			arg_55_0.optionDetailPreview = nil
		elseif var_82_1._redirectBindButtonEventTarget and var_82_1._redirectBindButtonEventTarget:processEvent(arg_82_1) then
			return true
		elseif arg_55_0.OptionWindow:getFirstInFocus() and arg_55_0.isSubCategoriesInFadeOut and arg_55_0.SubcategoriesOptions then
			var_0_32(arg_55_0, var_82_0, false, true)
			arg_55_0:dispatchEventToChildren({
				name = "request_active"
			})
			arg_55_0:processEvent({
				name = "gain_focus",
				controller = arg_82_1.controller
			})
			arg_55_0:processEvent({
				name = "lose_focus",
				controller = arg_82_1.controller
			})
		else
			arg_55_0:HandleFlowRequest(var_82_0, var_0_0.leave)
		end

		return true
	end)
	arg_55_0:registerEventHandler("gamepad_button", function(arg_83_0, arg_83_1)
		if arg_83_1.down and arg_83_1.qualifier == "keyboard" and arg_83_1.button == "quick_options" then
			arg_83_0:HandleFlowRequest(arg_55_1, var_0_0.leave)

			return true
		end

		local var_83_0 = arg_83_1.controller or arg_55_1

		if (arg_83_1.button == "shoulderr" or arg_83_1.button == "shoulderl") and arg_83_1.qualifier == "gamepad" then
			local var_83_1 = arg_83_0.OptionWindow:getFirstInFocus() ~= nil

			var_0_32(arg_83_0, var_83_0, var_83_1, not var_83_1)
			arg_83_0:processEvent({
				name = "gain_focus",
				controller = arg_83_1.controller
			})
			arg_83_0:processEvent({
				name = "lose_focus",
				controller = arg_83_1.controller
			})
		end

		if arg_83_1.down and arg_83_1.button == "alt2" and var_0_10(arg_83_0, arg_83_1.controller) then
			return true
		end

		return false
	end)

	local var_55_4 = var_0_0.leave

	arg_55_0:addEventHandler("closing_quick_access_menu", function(arg_84_0, arg_84_1)
		arg_84_0:HandleFlowRequest(arg_55_1, var_55_4)
	end)

	local var_55_5 = var_0_0.dismiss

	arg_55_0:addEventHandler("gamepad_button", function(arg_85_0, arg_85_1)
		if arg_85_1.down and arg_85_1.button == "dismiss_pause_menu" and not Engine.DDJFBBJAIG() then
			arg_85_0:HandleFlowRequest(arg_55_1, var_55_5, true)

			return true
		end
	end)
	arg_55_0:registerEventHandler("redirect_button_event_to_target", function(arg_86_0, arg_86_1)
		LUI.FlowManager.GetScopedData(arg_86_0)._redirectBindButtonEventTarget = arg_86_1.target
	end)
	arg_55_0:addEventHandler("menu_close", function(arg_87_0, arg_87_1)
		Engine.EBIDFIDHIE("updategamerprofile " .. arg_87_1.controller)
		var_0_24(arg_87_0, false)

		if arg_55_0._soundId then
			Engine.EAGBECEBGA(arg_55_0._soundId)

			arg_55_0._soundId = nil
		end
	end)

	arg_55_0.RefreshDependency = var_0_18

	arg_55_0:addEventHandler("options_window_refresh", function(arg_88_0, arg_88_1)
		arg_88_0:dispatchEventToChildren({
			name = "refresh"
		})
		arg_88_0:dispatchEventToChildren({
			name = "refresh_values",
			controller = arg_88_1.controller
		})
	end)
	arg_55_0.bindButton:addEventHandler("button_right_trigger", function(arg_89_0, arg_89_1)
		local var_89_0 = arg_89_1.controller or arg_55_1

		if arg_55_0.tabId == "keyboardAndMouse" or arg_55_0.tabId == "codCaster" then
			ACTIONS.ResetBindingsAll(arg_55_0, arg_89_0, var_89_0)

			return true
		elseif #arg_55_0.modifiedOptions > 0 then
			ACTIONS.ApplyOptionTab(arg_55_0, arg_89_0, var_89_0)

			return true
		end
	end)
	ACTIONS.ScaleFullscreen(arg_55_0.BackgroundMP)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_55_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_55_0.SecondaryTabBacker)

	local var_55_6 = LUI.UIElement.new()

	var_55_6:SetBlurStrength(5)
	var_55_6:setupWorldBlur()

	var_55_6.id = "blur"

	arg_55_0:addElement(var_55_6)

	function arg_55_0.restoreState(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
		if not LUI.IsLastInputMouseNavigation(arg_90_2) then
			if not arg_90_0.SubcategoriesOptions then
				var_0_32(arg_90_0, arg_90_2, true, false)
			else
				var_0_32(arg_90_0, arg_90_2, false, true)
			end

			arg_90_0:processEvent({
				name = "gain_focus",
				controller = arg_90_2
			})
			arg_90_0:processEvent({
				name = "lose_focus",
				controller = arg_90_2
			})

			return true, 1
		end

		return LUI.UIElement.restoreState(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	end

	local function var_55_7(arg_91_0, arg_91_1)
		if not LUI.IsLastInputMouseNavigation(arg_91_1.controllerIndex) and arg_91_0.SubcategoriesOptions then
			local var_91_0 = arg_91_0.OptionWindow:getFirstInFocus() ~= nil

			var_0_32(arg_91_0, arg_91_1.controllerIndex, var_91_0, not var_91_0)
		else
			var_0_32(arg_91_0, arg_91_1.controllerIndex)
		end
	end

	arg_55_0:addAndCallEventHandler("update_input_type", var_55_7, {
		controllerIndex = arg_55_1
	})

	arg_55_0.ResetTabOptions = var_0_9
	arg_55_0.HandleResetButtonPressed = var_0_10
	arg_55_0.HandleApplyButtonPressed = var_0_4

	local var_55_8 = Lobby.DGDAAFJDBI()

	if var_55_8 and not Engine.CAADCDEEIA() then
		local var_55_9 = Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", var_55_8)

		if arg_55_0.Nat then
			arg_55_0.Nat:setText(var_55_9)
		end
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_55_0, "AR")
	end

	arg_55_0:addEventHandler("update_input_type", function(arg_92_0, arg_92_1)
		if LUI.IsLastInputGamepad(arg_92_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_92_0, "Gamepad")
		else
			ACTIONS.AnimateSequence(arg_92_0, "KBM")
		end
	end)
	arg_55_0.bindButton:registerEventHandler("button_alt1", function(arg_93_0, arg_93_1)
		var_0_26(arg_55_0, arg_93_1.controller)

		if arg_55_0.ButtonLayoutOptionsMenu then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			arg_55_0.ButtonLayoutOptionsMenu:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				controller = arg_93_1.controller
			})
		end
	end)
	arg_55_0:addEventHandler("buttonLayout_triggerUpdate", function(arg_94_0, arg_94_1)
		var_0_21(arg_94_0, arg_94_1.controller, arg_94_1.resetFlip)
	end)

	if LUI.IsLastInputGamepad(arg_55_1) then
		ACTIONS.AnimateSequence(arg_55_0, "GamepadSnap")
	else
		ACTIONS.AnimateSequence(arg_55_0, "KBMSnap")
	end

	arg_55_0._fetchTimerHolder = LUI.UIElement.new()

	arg_55_0:addElement(arg_55_0._fetchTimerHolder)

	arg_55_0._fetchTimerHolder.count = 0

	if Engine.BIIBDBAHD() then
		arg_55_0.GetEnforcement = var_0_40

		local var_55_10 = Regulations.BGEIIEHJFD(arg_55_1, 0)

		if var_55_10 == OPTIONS.regulationEnforcement.UNKNOWN or var_55_10 == OPTIONS.regulationEnforcement.ENFORCEMENT_ERROR then
			Regulations.CFAEACEIIJ(arg_55_1)
			arg_55_0:GetEnforcement(arg_55_1)
		end
	end

	METRICS.RecordOptionsMenuOpeningFlow(arg_55_1, arg_55_2.hasUsedShortcut == true)
end

function OptionsMenuNewLayout(arg_95_0, arg_95_1)
	local var_95_0 = LUI.UIElement.new()

	var_95_0.id = "OptionsMenuNewLayout"
	var_95_0._animationSets = var_95_0._animationSets or {}
	var_95_0._sequences = var_95_0._sequences or {}

	local var_95_1 = arg_95_1 and arg_95_1.controllerIndex

	if not var_95_1 and not Engine.DDJFBBJAIG() then
		var_95_1 = var_95_0:getRootController()
	end

	assert(var_95_1)
	var_0_34(var_95_0, var_95_1, arg_95_1)

	local var_95_2 = var_95_0
	local var_95_3
	local var_95_4 = LUI.UIImage.new()

	var_95_4.id = "Background"

	var_95_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_95_0:addElement(var_95_4)

	var_95_0.Background = var_95_4

	local var_95_5
	local var_95_6 = LUI.UIImage.new()

	var_95_6.id = "BackgroundMP"

	var_95_6:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_95_0:addElement(var_95_6)

	var_95_0.BackgroundMP = var_95_6

	local var_95_7
	local var_95_8 = LUI.UIImage.new()

	var_95_8.id = "SecondaryTabBacker"

	var_95_8:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_95_8:SetAlpha(0, 0)
	var_95_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 160, _1080p * 200)
	var_95_0:addElement(var_95_8)

	var_95_0.SecondaryTabBacker = var_95_8

	local var_95_9
	local var_95_10 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_95_1
	})

	var_95_10.id = "TabBacker"

	var_95_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_95_0:addElement(var_95_10)

	var_95_0.TabBacker = var_95_10

	local var_95_11
	local var_95_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_95_1
	})

	var_95_12.id = "ButtonHelperBar"

	var_95_12.Background:SetAlpha(0.5, 0)
	var_95_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_95_0:addElement(var_95_12)

	var_95_0.ButtonHelperBar = var_95_12

	local var_95_13
	local var_95_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_95_1
	})

	var_95_14.id = "MenuTitle"

	var_95_14.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")), 0)
	var_95_14.Line:SetLeft(0, 0)
	var_95_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_95_0:addElement(var_95_14)

	var_95_0.MenuTitle = var_95_14

	local var_95_15
	local var_95_16 = MenuBuilder.BuildRegisteredType("OptionsKeyBindingBanner", {
		controllerIndex = var_95_1
	})

	var_95_16.id = "OptionsKeyBindingBanner"

	var_95_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 936, _1080p * 996)
	var_95_0:addElement(var_95_16)

	var_95_0.OptionsKeyBindingBanner = var_95_16

	local var_95_17
	local var_95_18 = MenuBuilder.BuildRegisteredType("OptionWindow", {
		controllerIndex = var_95_1
	})

	var_95_18.id = "OptionWindow"

	var_95_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 929, _1080p * 240, _1080p * 906)
	var_95_0:addElement(var_95_18)

	var_95_0.OptionWindow = var_95_18

	local var_95_19
	local var_95_20 = LUI.UIImage.new()

	var_95_20.id = "DescriptionBackground"

	var_95_20:SetRGBFromInt(0, 0)
	var_95_20:SetAlpha(0, 0)
	var_95_20:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_95_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 988, _1080p * 1628, _1080p * 240, _1080p * 906)
	var_95_0:addElement(var_95_20)

	var_95_0.DescriptionBackground = var_95_20

	local var_95_21
	local var_95_22 = LUI.UIImage.new()

	var_95_22.id = "ImagePreview"

	var_95_22:SetAlpha(0, 0)
	var_95_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 277, _1080p * 725)
	var_95_0:addElement(var_95_22)

	var_95_0.ImagePreview = var_95_22

	local var_95_23
	local var_95_24 = LUI.UIStyledText.new()

	var_95_24.id = "OptionName"

	var_95_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_95_24:setText(ToUpperCase(""), 0)
	var_95_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_95_24:SetWordWrap(false)
	var_95_24:SetAlignment(LUI.Alignment.Left)
	var_95_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_95_24:SetStartupDelay(1000)
	var_95_24:SetLineHoldTime(400)
	var_95_24:SetAnimMoveTime(0)
	var_95_24:SetAnimMoveSpeed(100)
	var_95_24:SetEndDelay(1500)
	var_95_24:SetCrossfadeTime(0)
	var_95_24:SetFadeInTime(300)
	var_95_24:SetFadeOutTime(300)
	var_95_24:SetMaxVisibleLines(1)
	var_95_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 232, _1080p * 262)
	var_95_0:addElement(var_95_24)

	var_95_0.OptionName = var_95_24

	local var_95_25
	local var_95_26 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_95_1
	})

	var_95_26.id = "ButtonDescriptionText"

	var_95_26.Description:SetRight(0, 0)
	var_95_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 739, _1080p * 767)
	var_95_0:addElement(var_95_26)

	var_95_0.ButtonDescriptionText = var_95_26

	local var_95_27
	local var_95_28 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_95_1
			})
		end,
		controllerIndex = var_95_1
	}
	local var_95_29 = LUI.TabManager.new(var_95_28)

	var_95_29.id = "Tabs"

	var_95_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1350, _1080p * 108, _1080p * 160)
	var_95_0:addElement(var_95_29)

	var_95_0.Tabs = var_95_29

	local var_95_30
	local var_95_31 = LUI.UIText.new()

	var_95_31.id = "Nat"

	var_95_31:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_95_31:setText("", 0)
	var_95_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_95_31:SetAlignment(LUI.Alignment.Left)
	var_95_31:SetOptOutRightToLeftAlignmentFlip(true)
	var_95_31:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 100, _1080p * 466, _1080p * -115, _1080p * -93)
	var_95_0:addElement(var_95_31)

	var_95_0.Nat = var_95_31

	local var_95_32
	local var_95_33 = MenuBuilder.BuildRegisteredType("OptionsGraphicsSliderBar", {
		controllerIndex = var_95_1
	})

	var_95_33.id = "OptionsGraphicsSliderBar"

	var_95_33:SetAlpha(0, 0)
	var_95_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 999, _1080p * 1598, _1080p * 169, _1080p * 217)
	var_95_0:addElement(var_95_33)

	var_95_0.OptionsGraphicsSliderBar = var_95_33

	local var_95_34

	if CONDITIONS.InGameMP(var_95_0) then
		var_95_34 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_95_1
		})
		var_95_34.id = "InGameMenuTimerStatus"

		var_95_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_95_0:addElement(var_95_34)

		var_95_0.InGameMenuTimerStatus = var_95_34
	end

	local var_95_35

	if CONDITIONS.InFrontendMPOrCP(var_95_0) then
		local var_95_36 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_95_1
		})

		var_95_36.id = "LobbyMembersFooter"

		var_95_36:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_95_0:addElement(var_95_36)

		var_95_0.LobbyMembersFooter = var_95_36
	end

	local function var_95_37()
		return
	end

	var_95_0._sequences.DefaultSequence = var_95_37

	local var_95_38
	local var_95_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 995
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1080
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_95_12:RegisterAnimationSequence("FullScreenState", var_95_39)

	local function var_95_40()
		var_95_12:AnimateSequence("FullScreenState")
	end

	var_95_0._sequences.FullScreenState = var_95_40

	local var_95_41
	local var_95_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 506
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 566
		}
	}

	var_95_16:RegisterAnimationSequence("SplitScreenState", var_95_42)

	local var_95_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_95_22:RegisterAnimationSequence("SplitScreenState", var_95_43)

	if CONDITIONS.InGameMP(var_95_0) then
		local var_95_44 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 760
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1160
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 34
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 84
			}
		}

		var_95_34:RegisterAnimationSequence("SplitScreenState", var_95_44)
	end

	local function var_95_45()
		var_95_16:AnimateSequence("SplitScreenState")
		var_95_22:AnimateSequence("SplitScreenState")

		if CONDITIONS.InGameMP(var_95_0) then
			var_95_34:AnimateSequence("SplitScreenState")
		end
	end

	var_95_0._sequences.SplitScreenState = var_95_45

	local var_95_46
	local var_95_47 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 450,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_95_22:RegisterAnimationSequence("HideImagePreview", var_95_47)

	local var_95_48 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 274,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_95_26:RegisterAnimationSequence("HideImagePreview", var_95_48)

	local function var_95_49()
		var_95_22:AnimateSequence("HideImagePreview")
		var_95_26:AnimateSequence("HideImagePreview")
	end

	var_95_0._sequences.HideImagePreview = var_95_49

	local var_95_50
	local var_95_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 450
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 726,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_95_22:RegisterAnimationSequence("ShowImagePreview", var_95_51)

	local var_95_52 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 739,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 767,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_95_26:RegisterAnimationSequence("ShowImagePreview", var_95_52)

	local function var_95_53()
		var_95_22:AnimateSequence("ShowImagePreview")
		var_95_26:AnimateSequence("ShowImagePreview")
	end

	var_95_0._sequences.ShowImagePreview = var_95_53

	local var_95_54
	local var_95_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 450
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_95_22:RegisterAnimationSequence("InstantHideImagePreview", var_95_55)

	local var_95_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 274,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_95_26:RegisterAnimationSequence("InstantHideImagePreview", var_95_56)

	local function var_95_57()
		var_95_22:AnimateSequence("InstantHideImagePreview")
		var_95_26:AnimateSequence("InstantHideImagePreview")
	end

	var_95_0._sequences.InstantHideImagePreview = var_95_57

	local var_95_58
	local var_95_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1790
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 218
		}
	}

	var_95_33:RegisterAnimationSequence("AR", var_95_59)

	local function var_95_60()
		var_95_33:AnimateSequence("AR")
	end

	var_95_0._sequences.AR = var_95_60

	local var_95_61
	local var_95_62 = {
		{
			value = 0.04,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 217,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_95_8:RegisterAnimationSequence("ShowSecondaryTabs", var_95_62)

	local function var_95_63()
		var_95_8:AnimateSequence("ShowSecondaryTabs")
	end

	var_95_0._sequences.ShowSecondaryTabs = var_95_63

	local var_95_64
	local var_95_65 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 200
		}
	}

	var_95_8:RegisterAnimationSequence("HideSecondaryTabs", var_95_65)

	local function var_95_66()
		var_95_8:AnimateSequence("HideSecondaryTabs")
	end

	var_95_0._sequences.HideSecondaryTabs = var_95_66

	local var_95_67
	local var_95_68 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1303
		}
	}

	var_95_29:RegisterAnimationSequence("KBM", var_95_68)

	local function var_95_69()
		var_95_29:AnimateSequence("KBM")
	end

	var_95_0._sequences.KBM = var_95_69

	local var_95_70
	local var_95_71 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1350
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 90
		}
	}

	var_95_29:RegisterAnimationSequence("Gamepad", var_95_71)

	local function var_95_72()
		var_95_29:AnimateSequence("Gamepad")
	end

	var_95_0._sequences.Gamepad = var_95_72

	local var_95_73
	local var_95_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 90
		}
	}

	var_95_29:RegisterAnimationSequence("GamepadSnap", var_95_74)

	local function var_95_75()
		var_95_29:AnimateSequence("GamepadSnap")
	end

	var_95_0._sequences.GamepadSnap = var_95_75

	local var_95_76
	local var_95_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1303
		}
	}

	var_95_29:RegisterAnimationSequence("KBMSnap", var_95_77)

	local function var_95_78()
		var_95_29:AnimateSequence("KBMSnap")
	end

	var_95_0._sequences.KBMSnap = var_95_78

	function var_95_0.addButtonHelperFunction(arg_110_0, arg_110_1)
		arg_110_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_110_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_left_trigger",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("MENU/RESET_TAB_OPTION")
		})
		arg_110_0:AddButtonHelperText({
			side = "left",
			priority = 3,
			kbmTooltipPromptOverload = "button_l3",
			button_ref = "button_right_trigger",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/APPLY_SETTINGS")
		})
	end

	var_95_0:addEventHandler("menu_create", var_95_0.addButtonHelperFunction)

	local var_95_79 = LUI.UIBindButton.new()

	var_95_79.id = "selfBindButton"

	var_95_0:addElement(var_95_79)

	var_95_0.bindButton = var_95_79

	var_95_0.bindButton:addEventHandler("button_secondary", function(arg_111_0, arg_111_1)
		if not arg_111_1.controller then
			local var_111_0 = var_95_1
		end

		ACTIONS.LeaveMenu(var_95_0)
	end)
	var_95_0:addEventHandler("menu_create", function(arg_112_0, arg_112_1)
		if not arg_112_1.controller then
			local var_112_0 = var_95_1
		end

		if CONDITIONS.IsSplitscreen(var_95_0) then
			ACTIONS.AnimateSequence(var_95_0, "SplitScreenState")
		end

		if CONDITIONS.IsThirdGameMode(var_95_0) then
			ACTIONS.PlaySoundSetSound(var_95_0, "cpSelectAlt", false)
		end
	end)
	var_95_0.bindButton:addEventHandler("button_left_trigger", function(arg_113_0, arg_113_1)
		local var_113_0 = arg_113_1.controller or var_95_1

		ACTIONS.ResetOptionTab(var_95_0, arg_113_0, var_113_0)
	end)
	var_0_41(var_95_0, var_95_1, arg_95_1)

	return var_95_0
end

MenuBuilder.registerType("OptionsMenuNewLayout", OptionsMenuNewLayout)
LockTable(_M)
