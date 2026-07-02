module(..., package.seeall)

local var_0_0 = {
	tabChange = 3,
	openingAccessibilityMenu = 4,
	leave = 1,
	closingAccessibilityMenu = 5,
	dismiss = 2
}
local var_0_1 = {
	Restart = {
		Title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		Message = Engine.CBBHFCGDIC("LANGUAGE_SELECT/CONFIRM_CHANGE")
	},
	Vram = {
		Title = Engine.CBBHFCGDIC("LUA_MENU/VRAM_NOTICE_DESC"),
		Message = Engine.CBBHFCGDIC("LUA_MENU/VRAM_WARNING_DESC")
	},
	Unsaved = {
		Title = Engine.CBBHFCGDIC("LUA_MENU/APPLY_SETTINGS"),
		Message = Engine.CBBHFCGDIC("LUA_MENU/APPLY_UNSAVED_SETTINGS_MESSAGE")
	}
}
local var_0_2 = {
	quality = 2,
	display = 1
}
local var_0_3 = {
	"DisplayMode",
	"Resolution",
	"DynamicResolution",
	"DynamicResolutionFramerateTarget",
	"AspectRatio",
	"TextureDownloadPC",
	"InternetBandwidthUsage",
	"TextureDownloadLimitPC",
	"WeaponBlurPC",
	"MotionBlurPC",
	"ADSFOV",
	"FOV",
	"Brightness",
	"CameraMovementBehavior",
	"VSync",
	"FramerateLimit",
	"CustomFramerateLimit",
	"MenuCustomFramerateLimit",
	"OutOfFocusCustomFramerateLimit",
	"SDRColorSpace",
	"NvidiaHighlights",
	"NvidiaReflex",
	"DismembermentOption",
	"AntiAliasing",
	"NvidiaDLSS",
	"ContrastAdaptiveSharpener",
	"ContrastAdaptiveSharpenerStrength"
}
local var_0_4 = {
	"WeaponBlurPC",
	"MotionBlurPC",
	"Brightness",
	"ADSFOV",
	"FOV",
	"CameraMovementBehavior",
	"Colorblind",
	"ColorblindFilter",
	"ObituaryTimeOnScreen",
	"NewMessageSoundAlert",
	"TextChatBehavior",
	"PlayerMessagesBehavior",
	"SystemMessagesBehavior",
	"DismembermentOption",
	"AlwaysOnScreen"
}

local function var_0_5(arg_1_0)
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

local function var_0_6(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(var_0_5(arg_2_0)) do
		if iter_2_1.id == arg_2_1 then
			return iter_2_1
		end
	end
end

local function var_0_7(arg_3_0, arg_3_1)
	arg_3_0:RemoveButtonHelperText("button_r3", "left")

	if arg_3_0._customPreviewButtonAction and LUI.IsLastInputGamepad(arg_3_1) then
		arg_3_0:AddButtonHelperText({
			side = "left",
			priority = 10,
			gamepad_only = true,
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("MENU/MORE_INFO")
		})
	elseif #arg_3_0.modifiedOptions > 0 then
		arg_3_0:AddButtonHelperText({
			clickable = true,
			priority = 10,
			side = "left",
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/APPLY_SETTINGS")
		})
	elseif arg_3_0.tabId == "keyboardAndMouse" then
		arg_3_0:AddButtonHelperText({
			clickable = true,
			priority = 10,
			side = "left",
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("MENU/RESET_ALL_KEYBINDS")
		})
	elseif arg_3_0.tabId == "codCaster" then
		arg_3_0:AddButtonHelperText({
			clickable = true,
			priority = 10,
			side = "left",
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("MENU/RESET_ALL_CODCASTER_KEYBINDS")
		})
	else
		arg_3_0:AddButtonHelperText({
			side = "left",
			priority = 8,
			gamepad_only = true,
			button_ref = "button_r3",
			helper_text = ""
		})
	end
end

local function var_0_8(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if #arg_4_0.modifiedOptions > 0 then
		arg_4_0:dispatchEventToChildren({
			name = "remove_overlays"
		})

		if not arg_4_0.applyAction or arg_4_0.applyAction(arg_4_0, arg_4_1, arg_4_2, arg_4_3) then
			arg_4_0.ApplyingChanges = true

			for iter_4_0, iter_4_1 in pairs(var_0_5(arg_4_0)) do
				iter_4_1:processEvent({
					name = "apply_value"
				})
			end

			arg_4_0.modifiedOptions = {}

			var_0_7(arg_4_0, arg_4_1)
			arg_4_0.OptionWindow.buttonList:SetFocusedPosition({
				x = 0,
				y = arg_4_0.CurrentSelectedOption
			}, true)

			arg_4_0.ApplyingChanges = false

			Dvar.DHEGHJJJHI("LQSQKPKOSQ", false)

			if arg_4_3 then
				arg_4_3()
			end
		end
	end
end

local function var_0_9(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.modifiedOptions = {}

	var_0_7(arg_5_0, arg_5_1)

	for iter_5_0, iter_5_1 in pairs(var_0_5(arg_5_0)) do
		iter_5_1:processEvent({
			name = "seek_value"
		})
	end

	if arg_5_2 then
		arg_5_2()
	end
end

local function var_0_10(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	local var_6_0 = {
		title = arg_6_3.Title,
		message = arg_6_3.Message,
		buttons = {
			{
				label = Engine.CBBHFCGDIC("@MENU/APPLY"),
				action = function(arg_7_0)
					LUI.FlowManager.RequestLeaveMenu(arg_7_0, true)
					var_0_8(arg_6_0, arg_6_1, arg_6_2, arg_6_4)
					arg_6_0:HandleFlowRequest(arg_6_1)
				end
			},
			{
				label = Engine.CBBHFCGDIC("@MENU/DISCARD"),
				action = function(arg_8_0)
					Dvar.DHEGHJJJHI("LQSQKPKOSQ", false)
					LUI.FlowManager.RequestLeaveMenu(arg_8_0, true)
					var_0_9(arg_6_0, arg_6_1, arg_6_4)
					arg_6_0:HandleFlowRequest(arg_6_1)
				end
			},
			{
				label = Engine.CBBHFCGDIC("@MENU/CANCEL"),
				action = function()
					local var_9_0 = LUI.FlowManager.GetScopedData(arg_6_0)

					if var_9_0 then
						var_9_0.requestedTab = nil
					end

					if LUI.IsLastInputMouseNavigation(arg_6_1) then
						local var_9_1 = LUI.FlowManager.GetPerControllerPersistentData(arg_6_1)
						local var_9_2 = arg_6_0.SubcategoriesOptions

						if var_9_2 and var_9_1.selectedCategoryIndex then
							local var_9_3 = var_9_2.options[var_9_1.selectedCategoryIndex[arg_6_0.tabId]]

							if var_9_3 then
								var_9_3:dispatchEventToParent({
									name = "request_active",
									target = var_9_3
								})
							end
						end
					end
				end
			}
		}
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupMessageAndButtons", true, arg_6_1, false, var_6_0)
end

local function var_0_11(arg_10_0, arg_10_1)
	arg_10_0.CurrentSelectedOption = 1

	local var_10_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_10_1)

	var_10_0.selectedOptionIndex = 1
	var_10_0.activeTabIndex = 1

	arg_10_0.OptionWindow:ClearCurrentOptions(arg_10_1)
	arg_10_0:SetupTabs(arg_10_1)
end

local function var_0_12(arg_11_0, arg_11_1)
	arg_11_0.isAccessibilityOptionsMode = true

	arg_11_0.bindButton:RemoveButtonPrompt({
		side = "left",
		button_ref = "button_start"
	})
	arg_11_0.bindButton:registerEventHandler("button_start", nil)
	var_0_11(arg_11_0, arg_11_1)
end

local function var_0_13(arg_12_0, arg_12_1)
	arg_12_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_start",
		priority = 11,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/ACCESSIBILITY")
	})
	arg_12_0.bindButton:addEventHandler("button_start", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.controller or arg_12_1

		arg_12_0:HandleFlowRequest(var_13_0, var_0_0.openingAccessibilityMenu)
	end)
end

local function var_0_14(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0.isSubCategoriesInFadeOut = arg_14_2

	if arg_14_0.SubcategoriesOptions then
		arg_14_0.SubcategoriesOptions:FadeCategories(arg_14_2, arg_14_1)
	end

	arg_14_0.OptionWindow:FadeOptions(arg_14_3)
end

local function var_0_15(arg_15_0, arg_15_1)
	arg_15_0.bindButton:registerEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_1.controller or arg_15_1
		local var_16_1 = LUI.FlowManager.GetScopedData(arg_15_0)

		if arg_15_0.optionDetailPreview then
			arg_15_0.optionDetailPreview:closeTree()

			arg_15_0.optionDetailPreview = nil

			return true
		elseif var_16_1._redirectBindButtonEventTarget and var_16_1._redirectBindButtonEventTarget:processEvent(arg_16_1) then
			return true
		elseif arg_15_0.isAccessibilityOptionsMode and not arg_15_0.loadedDirectlyIntoAccessibilityMode then
			arg_15_0:HandleFlowRequest(var_16_0, var_0_0.closingAccessibilityMenu)
		else
			arg_15_0:HandleFlowRequest(var_16_0, var_0_0.leave)
		end

		return true
	end)

	if not arg_15_0.isAccessibilityOptionsMode then
		var_0_13(arg_15_0, arg_15_1)
	end
end

local function var_0_16(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = LUI.FlowManager.GetScopedData(arg_17_0)

	if #arg_17_0.modifiedOptions > 0 or Dvar.IBEGCHEFE("LQSQKPKOSQ") then
		local var_17_1 = Dvar.IBEGCHEFE("LQSQKPKOSQ") and var_0_1.Restart or var_0_1.Unsaved

		var_0_10(arg_17_0, arg_17_1, false, var_17_1, arg_17_4)

		var_17_0.flowRequestType = arg_17_2 ~= nil and arg_17_2 or var_17_0.flowRequestType

		return
	end

	if Dvar.BJJCJHDBII("MPLORMMQPT") == 2 then
		Dvar.IICIFEEDC("QLQPPSRK", -100)
	end

	if Dvar.BJJCJHDBII("MPLORMMQPT") == 1 then
		Dvar.IICIFEEDC("QLQPPSRK", 0)
	end

	Engine.EBIDFIDHIE("updategamerprofile " .. arg_17_1)

	local var_17_2 = Engine.DBFFAEEFGJ()

	arg_17_2 = var_17_0.flowRequestType or arg_17_2

	if arg_17_2 == var_0_0.leave then
		arg_17_0:dispatchEventToRoot({
			name = "closing_quick_access_menu",
			controllerIndex = arg_17_1
		})
		ACTIONS.LeaveMenu(arg_17_0)
		ACTIONS.HandleLeaveOptionsMenu(var_17_2)
		Engine.CJAEBHAHBB(arg_17_1)
	elseif arg_17_2 == var_0_0.dismiss then
		arg_17_0:dispatchEventToRoot({
			name = "closing_quick_access_menu",
			controllerIndex = arg_17_1
		})
		Engine.CJAEBHAHBB(arg_17_1)

		if LUI.FlowManager.IsInStack("TrialResults") then
			ACTIONS.LeaveMenu(arg_17_0)
		else
			local var_17_3 = var_17_2.flowManager:GetStackTop()

			LUI.FlowManager.RequestCloseAllMenus(var_17_3.name, arg_17_3, arg_17_1)
		end

		if Engine.CAADCDEEIA() then
			ACTIONS.ResumeGame(arg_17_0)
		end
	elseif arg_17_2 == var_0_0.tabChange then
		if var_17_0.requestedTab then
			arg_17_0.Tabs:FocusTab(arg_17_1, var_17_0.requestedTab.tabIndex, var_17_0.requestedTab.focusType)
		end
	elseif arg_17_2 == var_0_0.openingAccessibilityMenu then
		var_0_12(arg_17_0, arg_17_1)
	elseif arg_17_2 == var_0_0.closingAccessibilityMenu then
		arg_17_0.isAccessibilityOptionsMode = false

		var_0_11(arg_17_0, arg_17_1)
		var_0_13(arg_17_0, arg_17_1)
	end

	var_17_0.flowRequestType = nil
end

local function var_0_17(arg_18_0, arg_18_1)
	if arg_18_0._shouldUpdateGraphics then
		for iter_18_0, iter_18_1 in ipairs(var_0_5(arg_18_0)) do
			iter_18_1:processEvent({
				name = "seek_value",
				controllerIndex = arg_18_1
			})
		end

		arg_18_0.modifiedOptions = {}

		var_0_7(arg_18_0, arg_18_1)

		arg_18_0._shouldUpdateGraphics = false
	end

	local var_18_0 = var_0_6(arg_18_0, "DisplayMode")

	if var_18_0 then
		var_18_0:processEvent({
			name = "seek_value",
			controllerIndex = arg_18_1
		})
	end

	arg_18_0.MenuBackgroundImage:SetBackgroundSize()

	if #arg_18_0.OptionWindow.options then
		local var_18_1 = var_0_6(arg_18_0, "Monitor")

		if var_18_1 and var_18_1.Dropdown then
			local var_18_2 = Dvar.DHEEJCCJBH("MMMOQLSSOS")

			var_18_1.Dropdown:UpdateCurrentTextDropdown(Engine.BHEFDBJAAF())

			local var_18_3 = Dvar.DHEEJCCJBH("MMMOQLSSOS")
			local var_18_4 = OPTIONS.ValueToListIndex(Engine.BHEFDBJAAF(), var_18_3) or 1

			var_18_1.Dropdown:processEvent({
				name = "update_value",
				controllerIndex = arg_18_1,
				value = var_18_4
			})
		end
	end
end

local function var_0_18(arg_19_0, arg_19_1)
	if arg_19_0.resetAction then
		arg_19_0.resetAction(arg_19_0, arg_19_1)

		if arg_19_0.optionsToResetNormally then
			for iter_19_0, iter_19_1 in ipairs(var_0_5(arg_19_0)) do
				for iter_19_2, iter_19_3 in ipairs(arg_19_0.optionsToResetNormally) do
					if iter_19_3 == iter_19_1.id then
						iter_19_1.resettable = true

						break
					end
				end

				if iter_19_1.resettable then
					local var_19_0 = arg_19_0.optionsList[iter_19_1.id]

					OPTIONS.ResetOptionElement(arg_19_0, arg_19_1, iter_19_1, var_19_0)
				end
			end
		end
	else
		for iter_19_4, iter_19_5 in ipairs(var_0_5(arg_19_0)) do
			local var_19_1 = arg_19_0.optionsList[iter_19_5.id]

			OPTIONS.ResetOptionElement(arg_19_0, arg_19_1, iter_19_5, var_19_1)
		end
	end
end

local function var_0_19(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.OptionWindow.buttonList:getFirstInFocus()

	if var_20_0 then
		local var_20_1 = arg_20_0.optionsList[var_20_0.id]

		if var_20_1 then
			OPTIONS.ResetOptionElement(arg_20_0, arg_20_1, var_20_0, var_20_1)
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end

		return true
	end
end

local function var_0_20(arg_21_0, arg_21_1)
	local var_21_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_21_1).selectedCategoryIndex.graphics

	arg_21_0._shouldUpdateGraphics = true

	if var_21_0 == var_0_2.quality then
		Engine.EJJEHHFCC(false)
		Dvar.DFIJDJFIFD("LNKPMNNMQM", Dvar.DBGFIDHBFC("LNKPMNNMQM"))
	end

	Engine.EBIDFIDHIE("vid_reconfig")
end

local function var_0_21(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if not arg_22_2 and (arg_22_0.OptionsGraphicsSliderBar and arg_22_0.OptionsGraphicsSliderBar:isOverMaxRecommended() or Dvar.IBEGCHEFE("LQSQKPKOSQ") == true) then
		local var_22_0 = Dvar.IBEGCHEFE("LQSQKPKOSQ") and var_0_1.Restart or var_0_1.Vram

		var_0_10(arg_22_0, arg_22_1, true, var_22_0, arg_22_3)

		return false
	else
		Engine.EBIDFIDHIE("vid_reconfig")

		return true
	end
end

local var_0_22

local function var_0_23(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:getFirstChild()
	local var_23_1 = 0

	while var_23_0 do
		var_23_1 = var_23_1 + var_0_23(var_23_0, arg_23_1)
		var_23_0 = var_23_0:getNextSibling()
	end

	if arg_23_0._typeName then
		if not arg_23_1[arg_23_0._typeName] then
			arg_23_1[arg_23_0._typeName] = {}
		end

		table.insert(arg_23_1[arg_23_0._typeName], var_23_1)
	end

	return var_23_1 + 1
end

local function var_0_24(arg_24_0)
	local var_24_0 = 0

	for iter_24_0 = 0, arg_24_0.OptionWindow.buttonList:GetNumRows() - 1 do
		local var_24_1 = arg_24_0.OptionWindow.buttonList:GetElementAtPosition(0, iter_24_0)
		local var_24_2 = arg_24_0.optionsList[var_24_1.id]

		if var_24_2 and var_24_2.id then
			if var_24_2.type == "Expander" then
				var_24_0 = var_24_0 + 1

				local var_24_3 = var_24_1.ChildrenContainer:getFirstChild()

				while var_24_3 do
					local var_24_4 = arg_24_0.optionsList[var_24_3.id]

					var_24_0 = var_24_0 + 1
					var_24_3 = var_24_3:getNextSibling()
				end
			else
				var_24_0 = var_24_0 + 1
			end
		end
	end

	DebugPrint("Options Count: " .. var_24_0)

	local var_24_5 = {}
	local var_24_6 = var_0_23(arg_24_0, var_24_5)

	DebugPrint("Elem Count: " .. var_24_6)
end

local function var_0_25(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = StringTable.BFHCAIIDA(arg_25_2.file)
	local var_25_1 = {}
	local var_25_2
	local var_25_3
	local var_25_4
	local var_25_5 = {}
	local var_25_6
	local var_25_7
	local var_25_8
	local var_25_9
	local var_25_10

	if arg_25_2.cols.showInGame then
		var_25_8 = not Engine.DDJFBBJAIG()
	end

	if arg_25_2.cols.requireKBM then
		var_25_9 = Engine.JDFDCGCIJ(arg_25_1)
	end

	for iter_25_0 = 0, var_25_0 - 1 do
		local var_25_11 = StringTable.CBGJCDIHCE(arg_25_2.file, iter_25_0, arg_25_2.cols.identifier)
		local var_25_12 = StringTable.CBGJCDIHCE(arg_25_2.file, iter_25_0, arg_25_2.cols.categoryName)
		local var_25_13 = false

		if arg_25_2.cols.showInGame then
			local var_25_14 = StringTable.CBGJCDIHCE(arg_25_2.file, iter_25_0, arg_25_2.cols.showInGame) ~= "N"

			var_25_13 = var_25_8 and not var_25_14
		end

		if not var_25_13 and arg_25_2.cols.requireKBM then
			var_25_13 = StringTable.CBGJCDIHCE(arg_25_2.file, iter_25_0, arg_25_2.cols.requireKBM) == "Y" and not var_25_9
		end

		if var_25_12 ~= "" then
			if var_25_3 then
				var_25_1[#var_25_1 + 1] = {
					name = var_25_3,
					optionsList = var_25_5,
					id = var_25_2
				}
			end

			var_25_4 = var_25_13

			if not var_25_13 then
				var_25_2 = var_25_11
				var_25_3 = var_25_12
				var_25_5 = {}
			else
				var_25_3 = nil
			end
		elseif not var_25_4 then
			var_25_5[#var_25_5 + 1] = var_25_11
		end
	end

	if var_25_3 then
		var_25_1[#var_25_1 + 1] = {
			name = var_25_3,
			optionsList = var_25_5,
			id = var_25_2
		}
	end

	return var_25_1
end

local function var_0_26(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(var_0_5(arg_26_0)) do
		iter_26_1:processEvent({
			name = "refresh_option",
			controllerIndex = arg_26_1
		})
	end
end

local function var_0_27(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	for iter_27_0, iter_27_1 in ipairs(var_0_5(arg_27_0)) do
		if iter_27_1.id == arg_27_1 then
			iter_27_1:processEvent({
				name = "request_disable",
				disableSource = arg_27_3,
				disable = arg_27_2
			})
			iter_27_1:processEvent({
				name = "parent_value_changed",
				parentId = arg_27_3,
				parentValue = arg_27_4
			})

			break
		end
	end
end

local function var_0_28(arg_28_0, arg_28_1)
	local var_28_0 = StringTable.BFHCAIIDA(arg_28_1.file)
	local var_28_1 = {}
	local var_28_2
	local var_28_3

	for iter_28_0 = 0, var_28_0 - 1 do
		local var_28_4 = StringTable.CBGJCDIHCE(arg_28_1.file, iter_28_0, arg_28_1.cols.identifier)

		if StringTable.CBGJCDIHCE(arg_28_1.file, iter_28_0, arg_28_1.cols.categoryName) == "" then
			var_28_1[#var_28_1 + 1] = var_28_4
		end
	end

	return var_28_1
end

local function var_0_29(arg_29_0, arg_29_1)
	local var_29_0 = Dvar.BJJCJHDBII("NMRKMSMTOO")
	local var_29_1 = LUI.clamp(var_29_0, SliderBounds.Brightness.DvarMin, SliderBounds.Brightness.DvarMax) + arg_29_0.colorModifier
	local var_29_2 = LUI.clamp(var_29_1, 0, 1)

	arg_29_0.Background:SetRGBFromTable({
		r = var_29_2,
		g = var_29_2,
		b = var_29_2
	})
end

local function var_0_30(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = CONDITIONS.IsMagmaGameMode()
	local var_30_1 = Engine.BECCFCBIAA(OPTIONS.GetCurrentGpadButtonsConfigName(var_30_0), arg_30_1)
	local var_30_2, var_30_3 = string.gsub(var_30_1, "_alt", "")
	local var_30_4

	if CONDITIONS.IsSplitscreen() then
		var_30_4 = var_0_6(arg_30_0, "ButtonLayoutSplitscreen")
	elseif var_30_0 then
		var_30_4 = var_0_6(arg_30_0, "BRButtonLayout")
	else
		var_30_4 = var_0_6(arg_30_0, "ButtonLayout")
	end

	if var_30_4 then
		if arg_30_2 or var_30_3 > 0 then
			Engine.CBCIHEGADA(var_30_2, arg_30_1, var_30_0)

			if var_30_4 and var_30_4.Dropdown then
				if var_30_0 then
					var_30_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetBRButtonLayoutLabels())
				else
					var_30_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetButtonLayoutLabels())
				end
			end
		else
			Engine.CBCIHEGADA(var_30_1 .. "_alt", arg_30_1, var_30_0)

			if var_30_4 and var_30_4.Dropdown then
				if var_30_0 then
					var_30_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetBRButtonLayoutAltLabels())
				else
					var_30_4.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetButtonLayoutAltLabels())
				end
			end
		end
	end
end

local function var_0_31(arg_31_0, arg_31_1, arg_31_2)
	if arg_31_2 and not arg_31_0.StickLayoutOptionsMenu then
		local var_31_0
		local var_31_1 = MenuBuilder.BuildRegisteredType("StickLayoutOptionsMenu", {
			controllerIndex = arg_31_1
		})

		var_31_1.id = "StickLayoutOptionsMenu"

		var_31_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 350, _1080p * 810)
		arg_31_0:addElement(var_31_1)

		arg_31_0.StickLayoutOptionsMenu = var_31_1

		if arg_31_0.isMenuInitiallized then
			arg_31_0.StickLayoutOptionsMenu:processEvent({
				name = "menu_create",
				controller = arg_31_1
			})
		end
	elseif not arg_31_2 and arg_31_0.StickLayoutOptionsMenu then
		arg_31_0.StickLayoutOptionsMenu:closeTree()

		arg_31_0.StickLayoutOptionsMenu = nil
	end
end

local function var_0_32(arg_32_0, arg_32_1, arg_32_2)
	if arg_32_2 and not arg_32_0.NetworkInfoWidget and not arg_32_0.ConnectionMeter and not CONDITIONS.IsSplitscreen() then
		local var_32_0
		local var_32_1 = MenuBuilder.BuildRegisteredType("NetworkInfos", {
			controllerIndex = arg_32_1
		})

		var_32_1.id = "NetworkInfos"

		if IsLanguageArabic() then
			var_32_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1328, _1080p * 1790, _1080p * 695, _1080p * 865)
		else
			var_32_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1458, _1080p * 695, _1080p * 865)
		end

		arg_32_0:addElement(var_32_1)

		arg_32_0.NetworkInfosWidget = var_32_1

		local var_32_2 = MenuBuilder.BuildRegisteredType("ConnectionMeter", {
			controllerIndex = arg_32_1
		})

		var_32_2.id = "ConnectionMeter"

		if IsLanguageArabic() then
			var_32_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1328, _1080p * 1790, _1080p * 515, _1080p * 685)
		else
			var_32_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1458, _1080p * 515, _1080p * 685)
		end

		arg_32_0:addElement(var_32_2)

		arg_32_0.ConnectionMeter = var_32_2
	elseif (CONDITIONS.IsSplitscreen() or not arg_32_2) and arg_32_0.NetworkInfosWidget and arg_32_0.ConnectionMeter then
		arg_32_0.NetworkInfosWidget:closeTree()

		arg_32_0.NetworkInfosWidget = nil

		arg_32_0.ConnectionMeter:closeTree()

		arg_32_0.ConnectionMeter = nil
	end
end

local function var_0_33(arg_33_0, arg_33_1)
	if arg_33_1 and not arg_33_0._dvrDisabled then
		CoD.GameDVRDisable()

		arg_33_0._dvrDisabled = true
	elseif not arg_33_1 and arg_33_0._dvrDisabled then
		CoD.GameDVREnable()

		arg_33_0._dvrDisabled = false
	end
end

local function var_0_34(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_2 and not arg_34_0.MicLevelSliderBar then
		local var_34_0 = MenuBuilder.BuildRegisteredType("MicLevelSliderBar", {
			controllerIndex = arg_34_1
		})

		var_34_0.id = "MicLevelSliderBar"

		if IsLanguageArabic() then
			var_34_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1164, _1080p * 1790, _1080p * 847, _1080p * 912)
		else
			var_34_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 988, _1080p * 1624, _1080p * 847, _1080p * 912)
		end

		arg_34_0:addElement(var_34_0)

		arg_34_0.MicLevelSliderBar = var_34_0

		arg_34_0.MicLevelSliderBar:Show()
	elseif not arg_34_2 and arg_34_0.MicLevelSliderBar then
		arg_34_0.MicLevelSliderBar:closeTree()

		arg_34_0.MicLevelSliderBar = nil
	end
end

local function var_0_35(arg_35_0, arg_35_1)
	if arg_35_0.PlayPrompt then
		arg_35_0:RemoveButtonHelperTextFromElement(arg_35_0.ButtonHelperBar, "button_alt1", "left")

		if arg_35_0._soundId == nil or not Engine.CHFEJIG(arg_35_0._soundId) then
			arg_35_0._soundId = Engine.BJDBIAGIDA("ui_audio_test")

			arg_35_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/STOP_AUDIO_PROMPT"), 0)
			arg_35_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/STOP")
			})

			if arg_35_0.checkSoundTimer then
				arg_35_0:RemoveElement(arg_35_0.checkSoundTimer)
				arg_35_0.checkSoundTimer:closeTree()

				arg_35_0.checkSoundTimer = nil
			end

			arg_35_0.checkSoundTimer = LUI.UITimer.new({
				interval = 45,
				event = "checkSound"
			})

			arg_35_0:addElement(arg_35_0.checkSoundTimer)
		else
			Engine.EAGBECEBGA(arg_35_0._soundId)

			arg_35_0._soundId = nil

			arg_35_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_35_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
			})

			if arg_35_0.checkSoundTimer then
				arg_35_0:RemoveElement(arg_35_0.checkSoundTimer)
				arg_35_0.checkSoundTimer:closeTree()

				arg_35_0.checkSoundTimer = nil
			end
		end
	end
end

local function var_0_36(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_2 and not arg_36_0.PlayPrompt then
		local var_36_0 = LUI.UIText.new()

		var_36_0.id = "PlayPrompt"

		var_36_0:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
		var_36_0:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
		var_36_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_36_0:SetAlignment(LUI.Alignment.Left)
		var_36_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 920, _1080p * 189, _1080p * 209)
		arg_36_0:addElement(var_36_0)

		arg_36_0.PlayPrompt = var_36_0
		arg_36_0._soundId = nil

		arg_36_0:registerEventHandler("checkSound", function(arg_37_0, arg_37_1)
			if arg_36_0._soundId and not Engine.CHFEJIG(arg_36_0._soundId) then
				arg_36_0._soundId = nil

				arg_36_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
				arg_36_0:RemoveButtonHelperTextFromElement(arg_36_0.ButtonHelperBar, "button_alt1", "left")
				arg_36_0:AddButtonHelperText({
					kbm_only = true,
					priority = 2,
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
				})

				if arg_36_0.checkSoundTimer then
					arg_36_0:RemoveElement(arg_36_0.checkSoundTimer)
					arg_36_0.checkSoundTimer:closeTree()

					arg_36_0.checkSoundTimer = nil
				end
			end
		end)
		arg_36_0:AddButtonHelperText({
			kbm_only = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
		})
	elseif not arg_36_2 and arg_36_0.PlayPrompt then
		arg_36_0.PlayPrompt:closeTree()

		arg_36_0.PlayPrompt = nil

		if arg_36_0._soundId then
			Engine.EAGBECEBGA(arg_36_0._soundId)

			arg_36_0._soundId = nil
		end

		arg_36_0:RemoveButtonHelperTextFromElement(arg_36_0.ButtonHelperBar, "button_alt1", "left")

		if arg_36_0.checkSoundTimer then
			arg_36_0:RemoveElement(arg_36_0.checkSoundTimer)
			arg_36_0.checkSoundTimer:closeTree()

			arg_36_0.checkSoundTimer = nil
		end
	end
end

local function var_0_37(arg_38_0, arg_38_1)
	if not arg_38_0.SwapTriggersPrompt then
		local var_38_0
		local var_38_1 = MenuBuilder.BuildRegisteredType("SwapTriggersPrompt", {
			controllerIndex = arg_38_1
		})

		var_38_1.id = "SwapTriggersPrompt"

		var_38_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 310, _1080p * 350)
		arg_38_0:addElement(var_38_1)

		arg_38_0.SwapTriggersPrompt = var_38_1

		if arg_38_0.isMenuInitiallized then
			arg_38_0.SwapTriggersPrompt:processEvent({
				name = "menu_create",
				controller = arg_38_1
			})
		end
	end
end

local function var_0_38(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	if arg_39_2 and not arg_39_0.ButtonLayoutOptionsMenu then
		local var_39_0
		local var_39_1 = MenuBuilder.BuildRegisteredType("ButtonLayoutOptionsMenu", {
			controllerIndex = arg_39_1,
			isBR = arg_39_3
		})

		var_39_1.id = "ButtonLayoutOptionsMenu"

		var_39_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 350, _1080p * 874)
		arg_39_0:addElement(var_39_1)

		arg_39_0.ButtonLayoutOptionsMenu = var_39_1

		if not arg_39_4 then
			var_39_1:SetAlpha(0)
		end

		if arg_39_0.isMenuInitiallized then
			arg_39_0.ButtonLayoutOptionsMenu:processEvent({
				name = "menu_create",
				controller = arg_39_1
			})
		end

		var_0_37(arg_39_0, arg_39_1)
	elseif not arg_39_2 and arg_39_0.ButtonLayoutOptionsMenu then
		arg_39_0.ButtonLayoutOptionsMenu:closeTree()

		arg_39_0.ButtonLayoutOptionsMenu = nil

		if arg_39_0.SwapTriggersPrompt then
			arg_39_0.SwapTriggersPrompt:closeTree()

			arg_39_0.SwapTriggersPrompt = nil
		end
	end
end

local function var_0_39(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_2 and not arg_40_0.CalibrationGuide then
		local var_40_0
		local var_40_1 = MenuBuilder.BuildRegisteredType("CalibrationGuide", {
			controllerIndex = arg_40_1
		})

		var_40_1.id = "CalibrationGuide"

		if IsLanguageArabic() then
			var_40_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1061, _1080p * 1696, _1080p * 300, _1080p * 832)
		else
			var_40_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1611, _1080p * 300, _1080p * 832)
		end

		arg_40_0:addElement(var_40_1)

		arg_40_0.CalibrationGuide = var_40_1

		arg_40_0.CalibrationGuide:SetSwatchUpdateHandler(var_0_29)

		local var_40_2 = Engine.FFFHHEJDI()

		arg_40_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier = arg_40_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier + var_40_2

		arg_40_0.CalibrationGuide:processEvent({
			name = "calibration_updated"
		})
	elseif not arg_40_2 and arg_40_0.CalibrationGuide then
		arg_40_0.CalibrationGuide:closeTree()

		arg_40_0.CalibrationGuide = nil
	end
end

local function var_0_40(arg_41_0, arg_41_1, arg_41_2)
	if arg_41_2 and not arg_41_0.ColorblindGuide then
		local var_41_0 = MenuBuilder.BuildRegisteredType("ColorblindSwatches", {
			controllerIndex = arg_41_1
		})

		var_41_0.id = "ColorblindGuide"

		var_41_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1676, _1080p * 900, _1080p * 1100)
		arg_41_0:addElement(var_41_0)

		arg_41_0.ColorblindGuide = var_41_0
	elseif not arg_41_2 and arg_41_0.ColorblindGuide then
		arg_41_0.ColorblindGuide:closeTree()

		arg_41_0.ColorblindGuide = nil
	end
end

local function var_0_41(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_2 and not arg_42_0.DailyDownloadLimit then
		local var_42_0 = MenuBuilder.BuildRegisteredType("DailyDownloadLimit", {
			controllerIndex = arg_42_1
		})

		var_42_0.id = "DailyDownloadLimit"

		var_42_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1611, _1080p * 400, _1080p * 832)
		arg_42_0:addElement(var_42_0)

		arg_42_0.DailyDownloadLimit = var_42_0
	elseif not arg_42_2 and arg_42_0.DailyDownloadLimit then
		arg_42_0.DailyDownloadLimit:closeTree()

		arg_42_0.DailyDownloadLimit = nil
	end
end

local function var_0_42(arg_43_0)
	if arg_43_0.OptionName then
		arg_43_0.OptionName:SetAlpha(0)
	end

	var_0_38(arg_43_0, controllerIndex, false)
	var_0_31(arg_43_0, controllerIndex, false)
	var_0_39(arg_43_0, controllerIndex, false)
	var_0_40(arg_43_0, controllerIndex, false)
	var_0_41(arg_43_0, controllerIndex, false)

	if arg_43_0.ButtonDescriptionText.Description then
		arg_43_0.ButtonDescriptionText.Description:SetAlpha(0)
	end

	if arg_43_0.ImagePreview then
		arg_43_0.ImagePreview:SetAlpha(0)

		if not arg_43_0._imageHidden then
			arg_43_0._imageHidden = true

			if arg_43_0._firstAnim then
				ACTIONS.AnimateSequence(arg_43_0, "InstantHideImagePreview")

				arg_43_0._firstAnim = false
			else
				ACTIONS.AnimateSequence(arg_43_0, "HideImagePreview")
			end
		end
	end
end

local function var_0_43(arg_44_0, arg_44_1)
	local var_44_0 = Engine.CGABICJHAI()
	local var_44_1 = {}
	local var_44_2 = not CONDITIONS.IsSplitscreen() or Engine.DDJFBBJAIG() or arg_44_1 == Engine.IJEBHJIJF()

	if var_44_0 then
		var_44_1[#var_44_1 + 1] = {
			applyable = true,
			id = "graphics",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCESSIBILITY_OPTION_VISUALS")),
			csv = CSV.accessibilityVisualsOptions,
			applyAction = var_0_21,
			resetAction = var_0_20,
			optionsToResetNormally = var_0_4
		}
	else
		var_44_1[#var_44_1 + 1] = {
			id = "graphics",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCESSIBILITY_OPTION_VISUALS")),
			csv = CSV.accessibilityVisualsOptions
		}
	end

	if var_44_2 then
		var_44_1[#var_44_1 + 1] = {
			id = "audio",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/AUDIO")),
			csv = CSV.accessibilityAudioOptions
		}
	end

	if var_44_0 then
		var_44_1[#var_44_1 + 1] = {
			id = "keyboardAndMouse",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE")),
			csv = CSV.accessibilityKeyboardAndMouseOptions
		}
		var_44_1[#var_44_1 + 1] = {
			id = "gamepad",
			name = ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")),
			csv = CSV.accessibilityGamepadOptions
		}
	else
		var_44_1[#var_44_1 + 1] = {
			id = "gamepad",
			name = ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")),
			csv = CSV.accessibilityGamepadOptions
		}
		var_44_1[#var_44_1 + 1] = {
			id = "keyboardAndMouse",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE")),
			csv = CSV.accessibilityKeyboardAndMouseOptions,
			visible = Engine.JDFDCGCIJ(arg_44_1)
		}
	end

	return var_44_1
end

local function var_0_44(arg_45_0, arg_45_1)
	if CONDITIONS.InGameAndBR(arg_45_0) and DataSources.inGame.player.BRData then
		DataSources.inGame.player.BRData.PlayerStatusIsInSettings:SetValue(arg_45_1, false)
	end

	local var_45_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_45_1)
	local var_45_1 = LUI.FlowManager.GetScopedData(arg_45_0)
	local var_45_2 = {}
	local var_45_3 = Engine.CGABICJHAI()
	local var_45_4 = not CONDITIONS.IsSplitscreen() or Engine.DDJFBBJAIG() or arg_45_1 == Engine.IJEBHJIJF()
	local var_45_5 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_45_1)

	if not var_45_0.selectedCategoryIndex then
		var_45_0.selectedCategoryIndex = {}
	end

	if arg_45_0.isAccessibilityOptionsMode then
		arg_45_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/ACCESSIBILITY_OPTIONS"))

		var_45_2 = var_0_43(arg_45_0, arg_45_1)
	else
		arg_45_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS"))

		if var_45_3 then
			var_45_2[#var_45_2 + 1] = {
				id = "keyboardAndMouse",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE")),
				csv = CSV.keyboardAndMouseOptions
			}
		else
			var_45_2[#var_45_2 + 1] = {
				id = "gamepad",
				name = ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")),
				csv = CSV.gamepadOptions
			}
		end

		if var_45_3 then
			var_45_2[#var_45_2 + 1] = {
				applyable = true,
				id = "graphics",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GRAPHICS")),
				csv = CSV.videoOptions,
				applyAction = var_0_21,
				resetAction = var_0_20,
				optionsToResetNormally = var_0_3
			}
		else
			var_45_2[#var_45_2 + 1] = {
				id = "graphics",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GRAPHICS")),
				csv = CSV.videoConsoleOptions
			}
		end

		var_45_2[#var_45_2 + 1] = {
			id = "interface",
			name = ToUpperCase(Engine.CBBHFCGDIC("OPTIONS/INTERFACE")),
			csv = CSV.interfaceOptions
		}

		if var_45_4 then
			var_45_2[#var_45_2 + 1] = {
				id = "audio",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/AUDIO")),
				csv = CSV.audioOptions
			}
		end

		if var_45_3 then
			var_45_2[#var_45_2 + 1] = {
				id = "gamepad",
				name = ToUpperCase(Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")),
				csv = CSV.gamepadOptions
			}
		else
			var_45_2[#var_45_2 + 1] = {
				id = "keyboardAndMouse",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE")),
				csv = CSV.keyboardAndMouseOptions,
				visible = Engine.JDFDCGCIJ(arg_45_1)
			}
		end

		if var_45_5 and Dvar.IBEGCHEFE("lui_disable_codcaster_options_tab") ~= true then
			var_45_2[#var_45_2 + 1] = {
				id = "codCaster",
				name = ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/CODCASTER_TITLE")),
				csv = CSV.codCasterOptions
			}
		end

		if var_45_4 then
			var_45_2[#var_45_2 + 1] = {
				id = "account",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCOUNT_TAB")),
				csv = CSV.accountOptions
			}
		end

		if Engine.BHICADFIHA() or Engine.BGAAHHAGAC() then
			var_45_2[#var_45_2 + 1] = {
				id = "debug",
				name = "DEBUG",
				visible = true,
				csv = CSV.debugOptions
			}
		end
	end

	local var_45_6 = var_45_1.activeTabId

	if var_45_6 then
		for iter_45_0, iter_45_1 in ipairs(var_45_2) do
			if iter_45_1.id == var_45_6 then
				var_45_0.activeTabIndex = iter_45_0

				break
			end
		end
	end

	local var_45_7 = {}

	for iter_45_2, iter_45_3 in ipairs(var_45_2) do
		if iter_45_3.visible == nil or iter_45_3.visible then
			table.insert(var_45_7, {
				name = iter_45_3.name,
				disabled = iter_45_3.disabled,
				hasDefaultFocus = iter_45_2 == var_45_0.activeTabIndex,
				focusCondition = function(arg_46_0, arg_46_1, arg_46_2)
					if #arg_45_0.modifiedOptions > 0 and arg_46_1 ~= var_45_0.activeTabIndex - 1 then
						var_45_1.requestedTab = {
							tabIndex = arg_46_1,
							focusType = arg_46_2
						}

						arg_45_0:HandleFlowRequest(arg_46_0, var_0_0.tabChange)

						return false
					else
						return true
					end
				end,
				focusFunction = function(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
					arg_45_0.tabName = iter_45_3.name
					arg_45_0.tabId = iter_45_3.id
					arg_45_0.tabCSV = iter_45_3.csv
					arg_45_0.applyAction = iter_45_3.applyAction
					arg_45_0.resetAction = iter_45_3.resetAction
					arg_45_0.optionsToResetNormally = iter_45_3.optionsToResetNormally

					if var_45_0.activeTabIndex and iter_45_2 == var_45_0.activeTabIndex and arg_45_0.OptionWindow.buttonList and arg_45_0.OptionWindow.buttonList._activeElement then
						return
					end

					var_45_1.requestedTab = nil

					arg_45_0:dispatchEventToChildren({
						name = "remove_overlays"
					})

					local var_47_0
					local var_47_1
					local var_47_2

					if arg_45_0.OptionsGraphicsSliderBar then
						if iter_45_3.id == "graphics" and not arg_45_0.isAccessibilityOptionsMode then
							arg_45_0.OptionsGraphicsSliderBar:processEvent({
								name = "refresh_vram"
							})
							arg_45_0.OptionsGraphicsSliderBar:processEvent({
								name = "show"
							})
						else
							arg_45_0.OptionsGraphicsSliderBar:processEvent({
								name = "hide"
							})
						end
					end

					var_0_7(arg_45_0, arg_47_1)

					if not Engine.CAADCDEEIA() then
						if iter_45_3.id == "audio" then
							var_0_34(arg_45_0, arg_47_1, true)
						else
							var_0_34(arg_45_0, arg_47_1, false)
						end
					end

					var_0_36(arg_45_0, arg_47_1, iter_45_3.id == "audio")
					var_0_32(arg_45_0, arg_47_1, iter_45_3.id == "account")
					var_0_33(arg_45_0, iter_45_3.id == "account")

					local var_47_3 = var_0_25(arg_45_0, arg_47_1, iter_45_3.csv)

					if var_47_3 and #var_47_3 > 1 then
						ACTIONS.AnimateSequence(arg_45_0, "ShowSecondaryTabs")

						local var_47_4 = var_0_25(arg_45_0, arg_47_1, iter_45_3.csv)
						local var_47_5 = {}
						local var_47_6 = LUI.FlowManager.GetPerControllerPersistentData(arg_47_1)

						if not arg_45_0.SubcategoriesOptions then
							local var_47_7
							local var_47_8 = MenuBuilder.BuildRegisteredType("OptionCategories", {
								controllerIndex = arg_47_1
							})

							var_47_8.id = "SubcategoriesOptions"

							var_47_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 300, _1080p * 170, _1080p * 600)
							arg_45_0:addElement(var_47_8)

							arg_45_0.SubcategoriesOptions = var_47_8

							arg_45_0.SubcategoriesOptions:registerEventHandler("category_changed", function(arg_48_0, arg_48_1)
								local function var_48_0()
									arg_48_0.options[arg_48_1.index]:dispatchEventToParent({
										name = "request_active",
										target = arg_48_0.options[arg_48_1.index]
									})

									if not arg_45_0._imageHidden then
										ACTIONS.AnimateSequence(arg_45_0, "HideImagePreview")

										arg_45_0._imageHidden = true
									end

									var_47_6.selectedCategoryIndex[arg_45_0.tabId] = arg_48_1.index
									arg_48_0.subCategoryName = arg_48_0.options[arg_48_1.index].Text:getText()

									var_0_42(arg_45_0)
									arg_45_0.OptionWindow:UpdateOptions(arg_47_1, arg_48_1.createOptions, arg_45_0.optionsList)

									arg_45_0.OptionWindow.buttonList.noFocus = arg_48_1.noFocus

									if not arg_48_1.mouse and #arg_45_0.OptionWindow.options > 0 then
										arg_45_0:processEvent({
											name = "update_button_name",
											buttonName = arg_45_0.OptionWindow.options[1].buttonName
										})
									end

									var_0_26(arg_45_0, arg_48_1.controller)
								end

								if #arg_45_0.modifiedOptions > 0 then
									arg_45_0:HandleFlowRequest(arg_47_1, var_0_0.tabChange, nil, var_48_0)
								else
									var_48_0()
								end
							end)
						end

						arg_45_0.OptionsKeyBindingBanner:SetAlpha(1, 200)

						if not var_47_6.selectedCategoryIndex[iter_45_3.id] or not var_47_4[var_47_6.selectedCategoryIndex[iter_45_3.id]] then
							var_47_6.selectedCategoryIndex[iter_45_3.id] = 1
						end

						var_47_0 = OPTIONS.CreateOptionList(arg_45_0, arg_47_1, var_47_4[var_47_6.selectedCategoryIndex[iter_45_3.id]].optionsList, iter_45_3.applyable)

						function var_47_2(arg_50_0, arg_50_1)
							for iter_50_0, iter_50_1 in ipairs(var_47_4) do
								local var_50_0 = OPTIONS.CreateOptionCategory(arg_50_0, arg_50_1, iter_50_1, iter_50_0, iter_45_3.applyable)

								var_50_0:addEventHandler("button_action", function(arg_51_0, arg_51_1)
									if not LUI.IsLastInputMouseNavigation(arg_50_1) then
										arg_51_0:GetCurrentMenu():processEvent({
											name = "gain_focus",
											controller = arg_51_1.controller
										})
										arg_51_0:GetCurrentMenu():processEvent({
											name = "lose_focus",
											controller = arg_51_1.controller
										})
									end
								end)

								var_47_5[#var_47_5 + 1] = var_50_0
							end

							return var_47_5
						end
					else
						ACTIONS.AnimateSequence(arg_45_0, "HideSecondaryTabs")

						local var_47_9 = var_0_28(arg_45_0, iter_45_3.csv)

						var_47_0 = OPTIONS.CreateOptionList(arg_45_0, arg_47_1, var_47_9, iter_45_3.applyable)

						if arg_45_0.SubcategoriesOptions then
							arg_45_0.SubcategoriesOptions:closeTree()

							arg_45_0.SubcategoriesOptions = nil
						end

						if iter_45_3.id == "audio" then
							arg_45_0.OptionsKeyBindingBanner:SetAlpha(1, 200)
						else
							arg_45_0.OptionsKeyBindingBanner:SetAlpha(0, 200)
						end
					end

					var_0_42(arg_45_0)

					if not var_45_1.alreadyLoaded and var_45_0.selectedOptionIndex and not arg_45_0.SubcategoriesOptions and (var_45_1.focusedOptionId == nil or var_45_1.focusedOptionId == "") then
						local var_47_10 = #arg_45_0.optionsList < var_45_0.selectedOptionIndex and var_45_0.selectedOptionIndex or nil

						arg_45_0.OptionWindow:UpdateOptions(arg_47_1, var_47_0, arg_45_0.optionsList, nil, var_47_10)
					else
						arg_45_0.OptionWindow:UpdateOptions(arg_47_1, var_47_0, arg_45_0.optionsList)
					end

					if arg_45_0.OptionWindow and arg_45_0.OptionWindow.options and var_45_1.focusedOptionId and var_45_1.focusedOptionId ~= "" then
						local var_47_11

						for iter_47_0, iter_47_1 in ipairs(arg_45_0.OptionWindow.options) do
							if iter_47_1.id == var_45_1.focusedOptionId then
								var_47_11 = iter_47_0

								break
							end
						end

						if var_47_11 then
							arg_45_0:Wait(1).onComplete = function()
								arg_45_0.OptionWindow.buttonList:SetFocusedPosition({
									x = 0,
									y = var_47_11 - 1
								}, true, true, true, false)
							end
						end
					end

					var_45_1.alreadyLoaded = true

					if arg_45_0.SubcategoriesOptions then
						local var_47_12 = var_45_0.selectedCategoryIndex[arg_45_0.tabId]

						arg_45_0.SubcategoriesOptions:UpdateOptions(arg_47_1, var_47_2, arg_45_0.optionsList, nil, var_47_12)
						arg_45_0.SubcategoriesOptions.options[1]:processEvent({
							name = "button_action",
							mouse = false,
							controller = arg_47_1
						})
						arg_45_0.bindButton:registerEventHandler("button_right_trigger", function(arg_53_0, arg_53_1)
							if LUI.IsLastInputGamepad(arg_47_1) and arg_45_0.SubcategoriesOptions then
								local var_53_0 = var_45_0.selectedCategoryIndex[arg_45_0.tabId] + 1

								if var_53_0 > #arg_45_0.SubcategoriesOptions.options then
									var_53_0 = 1
								end

								arg_45_0.SubcategoriesOptions.options[var_53_0]:processEvent({
									name = "button_action",
									mouse = false,
									controller = arg_53_1.controller
								})
							end
						end)
						arg_45_0.bindButton:registerEventHandler("button_left_trigger", function(arg_54_0, arg_54_1)
							if LUI.IsLastInputGamepad(arg_47_1) and arg_45_0.SubcategoriesOptions then
								local var_54_0 = var_45_0.selectedCategoryIndex[arg_45_0.tabId] - 1

								if var_54_0 < 1 then
									var_54_0 = #arg_45_0.SubcategoriesOptions.options
								end

								arg_45_0.SubcategoriesOptions.options[var_54_0]:processEvent({
									name = "button_action",
									mouse = false,
									controller = arg_54_1.controller
								})
							end
						end)
					end

					if not LUI.IsLastInputMouseNavigation(arg_47_1) then
						arg_45_0:processEvent({
							name = "gain_focus",
							controller = arg_47_1,
							shouldPlayButtonSound = not arg_45_0._firstTabFocus
						})
						arg_45_0:processEvent({
							name = "lose_focus",
							controller = arg_47_1
						})

						if arg_45_0._firstTabFocus == true then
							arg_45_0._firstTabFocus = false
						end
					end

					var_45_0.activeTabIndex = iter_45_2

					var_0_26(arg_45_0, arg_47_1)
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end
	end

	arg_45_0.Tabs:SetTabs(var_45_7)
	arg_45_0.Tabs:SizeTabsToFit()
end

local function var_0_45(arg_55_0, arg_55_1, arg_55_2)
	Engine.BBHEIABDAC(arg_55_1)
end

local function var_0_46(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	local var_56_0 = MenuBuilder.BuildRegisteredType(arg_56_2, {
		controllerIndex = arg_56_1
	})

	var_56_0.id = arg_56_2

	var_56_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1020, _1080p * 1770, _1080p * 415, _1080p * 665)
	arg_56_0:addElement(var_56_0)
	arg_56_3.button:addEventHandler("button_over", function(arg_57_0, arg_57_1)
		var_56_0:processEvent({
			name = arg_56_3.guideEventOver
		})

		if CONDITIONS.IsSplitscreen(arg_56_0) then
			var_56_0:SetTop(150)
			var_56_0:SetLeft(_1080p * 1344)
		end
	end)
	arg_56_3.button:addEventHandler("button_up", function(arg_58_0, arg_58_1)
		var_56_0:processEvent({
			name = arg_56_3.guideEventUp
		})
	end)

	return var_56_0
end

local function var_0_47(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = arg_59_1:getParent()

	if var_59_0._customPreviewButtonAction then
		LUI.FlowManager.GetScopedData(arg_59_1).alreadyLoaded = nil

		arg_59_0:dispatchEventToChildren({
			name = "remove_overlays"
		})
		var_59_0._customPreviewButtonAction(arg_59_1, arg_59_2)
	elseif var_59_0._detailedPreviewImage then
		local var_59_1 = var_59_0.OptionName:getText()
		local var_59_2 = var_59_0.ButtonDescriptionText.Description:getText()
		local var_59_3 = var_59_0._detailedPreviewImage

		if not var_59_0.optionDetailPreview then
			local var_59_4 = MenuBuilder.BuildRegisteredType("OptionDetailPreview", {
				controllerIndex = arg_59_2,
				name = var_59_1,
				description = var_59_2,
				image = var_59_3
			})

			var_59_4.id = "optionDetailPreview"

			var_59_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
			var_59_0:addElement(var_59_4)

			var_59_0.optionDetailPreview = var_59_4
		end
	end
end

local function var_0_48(arg_60_0, arg_60_1)
	local var_60_0 = {}

	for iter_60_0, iter_60_1 in ipairs(arg_60_1) do
		local var_60_1 = arg_60_0[iter_60_1]

		if var_60_1 then
			table.insert(var_60_0, Engine.CBBHFCGDIC(var_60_1))
		end
	end

	local var_60_2 = ", "

	if IsLanguageArabic() then
		var_60_0 = LUI.ReverseTable(var_60_0)
		var_60_2 = " , "
	end

	return table.concat(var_60_0, var_60_2)
end

local function var_0_49(arg_61_0, arg_61_1)
	arg_61_0:addEventHandler("key_bound_banner", function(arg_62_0, arg_62_1)
		if arg_62_0.OptionsKeyBindingBanner then
			local var_62_0 = Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS", Engine.JCBDICCAH(arg_62_1.binding), arg_62_1.optionName)
			local var_62_1 = "Success"
			local var_62_2 = arg_62_1.unboundCommands and #arg_62_1.unboundCommands > 1

			if arg_62_1.invalidBinding then
				var_62_0 = Engine.CBBHFCGDIC("MENU/BINDING_INVALID", Engine.JCBDICCAH(arg_62_1.binding), arg_62_1.optionName)
				var_62_1 = "Error"
			elseif var_62_2 then
				local var_62_3 = var_0_48(arg_62_0._keybindActionList, arg_62_1.unboundCommands)

				if var_62_3 then
					var_62_0 = Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS_REASSIGNED", Engine.JCBDICCAH(arg_62_1.binding), arg_62_1.optionName, var_62_3)
					var_62_1 = "Error"
				end
			elseif arg_62_1.unboundCommands[1] ~= "" and arg_62_1.currentCmd ~= arg_62_1.unboundCommands[1] then
				local var_62_4 = arg_62_0._keybindActionList[arg_62_1.unboundCommands[1]]

				if var_62_4 and arg_62_1.optionName ~= Engine.CBBHFCGDIC(var_62_4) then
					var_62_0 = Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS_REASSIGNED", Engine.JCBDICCAH(arg_62_1.binding), arg_62_1.optionName, Engine.CBBHFCGDIC(var_62_4))
					var_62_1 = "Error"
				end
			end

			arg_62_0.OptionsKeyBindingBanner.Text:setText(var_62_0)
			ACTIONS.AnimateSequence(arg_62_0.OptionsKeyBindingBanner, var_62_1)

			if arg_62_0._timer then
				arg_62_0._timer:closeTree()

				arg_62_0._timer = nil
			end

			arg_62_0._timer = LUI.UITimer.new({
				interval = 6000,
				event = "hide_banner"
			})

			arg_62_0:addElement(arg_62_0._timer)
		end
	end)
	arg_61_0:addEventHandler("binding_key", function(arg_63_0, arg_63_1)
		if arg_63_0.OptionsKeyBindingBanner then
			if arg_63_0._timer then
				arg_63_0._timer:closeTree()

				arg_63_0._timer = nil
			end

			arg_63_0.OptionsKeyBindingBanner.Text:setText(Engine.CBBHFCGDIC("MENU/BINDING_INSTRUCTION"))
			ACTIONS.AnimateSequence(arg_63_0.OptionsKeyBindingBanner, "Binding")
		end
	end)
	arg_61_0:addEventHandler("hide_banner", function(arg_64_0, arg_64_1)
		if arg_64_0.OptionsKeyBindingBanner then
			ACTIONS.AnimateSequence(arg_64_0.OptionsKeyBindingBanner, "BackToDefault")
		end

		return true
	end)
end

local function var_0_50(arg_65_0)
	local var_65_0 = CSV.options
	local var_65_1 = StringTable.BJJBBCJGEJ(var_65_0.file, var_65_0.cols.identifier, arg_65_0)
	local var_65_2 = {
		id = arg_65_0,
		type = StringTable.CBGJCDIHCE(var_65_0.file, var_65_1, var_65_0.cols.type),
		name = StringTable.CBGJCDIHCE(var_65_0.file, var_65_1, var_65_0.cols.name),
		description = StringTable.CBGJCDIHCE(var_65_0.file, var_65_1, var_65_0.cols.description)
	}

	var_65_2.name = Engine.CBBHFCGDIC(var_65_2.name)
	var_65_2.description = Engine.CBBHFCGDIC(var_65_2.description)

	if var_65_0.cols.labels ~= nil then
		local var_65_3 = StringTable.CBGJCDIHCE(var_65_0.file, var_65_1, var_65_0.cols.labels)

		if var_65_3 ~= "" then
			var_65_2.labels = {}

			local var_65_4 = LUI.Split(var_65_3, ";")

			for iter_65_0 = 1, #var_65_4 do
				var_65_2.labels[iter_65_0] = Engine.CBBHFCGDIC(var_65_4[iter_65_0])
			end
		end
	end

	if OPTIONS_DATA.optionsDataList[arg_65_0] then
		local var_65_5 = OPTIONS_DATA.optionsDataList[arg_65_0]

		for iter_65_1, iter_65_2 in pairs(var_65_5) do
			var_65_2[iter_65_1] = iter_65_2
		end
	end

	var_65_2.optionsList = optionsList

	return var_65_2
end

local function var_0_51(arg_66_0, arg_66_1)
	if Engine.BIIBDBAHD() then
		local var_66_0 = Regulations.BGEIIEHJFD(arg_66_1, OPTIONS.regulationType.CCPA)

		if var_66_0 == OPTIONS.regulationEnforcement.UNKNOWN or var_66_0 == OPTIONS.regulationEnforcement.ENFORCEMENT_ERROR then
			if arg_66_0._fetchTimerHolder.count < OPTIONS.CCPA_REQUEST_MAX_COUNT then
				arg_66_0._fetchTimerHolder:Wait(OPTIONS.CCPA_REQUEST_INTERVAL).onComplete = function()
					arg_66_0:GetEnforcement(arg_66_1)
				end
				arg_66_0._fetchTimerHolder.count = arg_66_0._fetchTimerHolder.count + 1
			end
		elseif var_66_0 == OPTIONS.regulationEnforcement.ENFORCED then
			local var_66_1 = "DoNotSellMyData"
			local var_66_2 = var_0_50(var_66_1)

			arg_66_0.optionsList[var_66_1] = var_66_2
		end
	end
end

local function var_0_52(arg_68_0, arg_68_1)
	arg_68_0.isMenuInitiallized = true

	arg_68_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_68_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_l3",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("MENU/RESET_TAB_OPTION")
	})
	arg_68_0:AddButtonHelperText({
		side = "left",
		priority = 4,
		kbmTooltipPromptOverload = "button_l3",
		button_ref = "button_r3",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/APPLY_SETTINGS")
	})
	arg_68_0.bindButton:addEventHandler("button_left_stick", function(arg_69_0, arg_69_1)
		local var_69_0 = arg_69_1.controller or arg_68_1

		ACTIONS.ResetOptionTab(arg_68_0, arg_69_0, var_69_0)
	end)
	var_0_15(arg_68_0, arg_68_1)

	if Engine.DDJFBBJAIG() then
		LAYOUT.AddAspectRatioFadeFrame(arg_68_0, arg_68_1)
	end

	if CONDITIONS.IsSplitscreen(arg_68_0) then
		ACTIONS.AnimateSequence(arg_68_0, "SplitScreenState")
	end

	if CONDITIONS.IsThirdGameMode(arg_68_0) then
		ACTIONS.PlaySoundSetSound(arg_68_0, "cpSelectAlt", false)
	end
end

local function var_0_53(arg_70_0, arg_70_1, arg_70_2)
	arg_70_0.isAccessibilityOptionsMode = arg_70_2 and arg_70_2.displayAccessibilityOptionsOnly
	arg_70_0.loadedDirectlyIntoAccessibilityMode = arg_70_0.isAccessibilityOptionsMode
	arg_70_0._firstAnim = true
	arg_70_0._firstTabFocus = true
	arg_70_0.isMenuInitiallized = false
	arg_70_0.HandleFlowRequest = var_0_16
	arg_70_0.InitMenuDisplay = var_0_52

	arg_70_0:registerEventHandler("add_button_helper_text", function(arg_71_0, arg_71_1)
		arg_71_0.ButtonHelperBar:processEvent(arg_71_1)

		return true
	end)
	arg_70_0:registerEventHandler("update_current_grid_focus", function(arg_72_0, arg_72_1)
		arg_72_0.OptionWindow.buttonList:processEvent(arg_72_1)

		return true
	end)

	local var_70_0 = LUI.UIBindButton.new()

	var_70_0.id = "selfBindButton"

	arg_70_0:addElement(var_70_0)

	arg_70_0.bindButton = var_70_0

	arg_70_0:addEventHandler("menu_create", arg_70_0.InitMenuDisplay)
	arg_70_0:addEventHandler("input_connection", function(arg_73_0, arg_73_1)
		arg_73_0:SetupTabs(arg_73_1.controllerIndex)
	end)
	LUI.TextChat.SetupMenuForSingleLine(arg_70_0)

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_70_1 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = false,
			controllerIndex = arg_70_1
		})

		arg_70_0:addElement(var_70_1)
	end

	function arg_70_0.closeTree(arg_74_0)
		OPTIONS.OptionsToReset = {}

		LUI.UIElement.closeTree(arg_74_0)
	end

	assert(arg_70_0.OptionWindow)

	local function var_70_2(arg_75_0, arg_75_1)
		local var_75_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_70_1)

		var_75_0.selectedOptionIndex = arg_75_0.OptionWindow:GetChildIndexInGrid(arg_75_1.previewOption) + 1

		arg_75_0.OptionWindow.buttonList:SetDefaultFocus({
			x = 0,
			y = var_75_0.selectedOptionIndex - 1
		})

		if not arg_75_0.ApplyingChanges then
			arg_75_0.CurrentSelectedOption = var_75_0.selectedOptionIndex - 1
		end

		assert(arg_75_0.ButtonDescriptionText)
		assert(arg_75_0.OptionName)
		assert(arg_75_0.ImagePreview)

		if arg_75_1.description then
			arg_75_0.ButtonDescriptionText.Description:SetAlpha(1)
			arg_75_0.ButtonDescriptionText.Description:setText(LAYOUT.SetWarzoneStringHighlightOverride(arg_75_1.description))
		else
			arg_75_0.ButtonDescriptionText.Description:SetAlpha(0)
		end

		if arg_75_1.buttonName then
			arg_75_0.OptionName:SetAlpha(1)
			arg_75_0.OptionName:setText(ToUpperCase(arg_75_1.buttonName))
		end

		if arg_75_1.image == nil or arg_75_1.image == "" or CONDITIONS.IsSplitscreen() then
			arg_75_0.ImagePreview:SetAlpha(0)

			if not arg_75_0._imageHidden then
				ACTIONS.AnimateSequence(arg_75_0, "HideImagePreview")

				arg_75_0._imageHidden = true
			end
		else
			arg_75_0.ImagePreview:SetAlpha(1)
			arg_75_0.ImagePreview:setImage(RegisterMaterial(arg_75_1.image))

			if arg_75_0._imageHidden then
				ACTIONS.AnimateSequence(arg_75_0, "ShowImagePreview")

				arg_75_0._imageHidden = false
			end
		end

		if arg_75_1.customPreviewButtonAction then
			arg_75_0._previewOption = arg_75_1.previewOption
		end

		if arg_75_1.customPreviewButtonAction and not arg_75_1.disabled then
			arg_75_0._customPreviewButtonAction = arg_75_1.customPreviewButtonAction

			var_0_7(arg_75_0, arg_70_1)
		else
			arg_75_0._customPreviewButtonAction = nil
		end

		if arg_75_1.detailedPreviewImage then
			arg_75_0._detailedPreviewImage = RegisterMaterial(arg_75_1.detailedPreviewImage)

			var_0_7(arg_75_0, arg_70_1)
		else
			arg_75_0._detailedPreviewImage = nil
		end

		if arg_75_1.customPreviewButtonAction == nil and arg_75_1.detailedPreviewImage == nil then
			var_0_7(arg_75_0, arg_70_1)
		end

		if arg_75_1.resettable and arg_75_1.type ~= "GenericButton" and LUI.IsLastInputGamepad(arg_70_1) and not OPTIONS.IsCurrentTabGraphics(arg_70_1) then
			arg_75_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt2",
				priority = 9,
				helper_text = Engine.CBBHFCGDIC("MENU/RESET_OPTION")
			})
		else
			arg_75_0:RemoveButtonHelperText("button_alt2", "left")
		end
	end

	arg_70_0:addEventHandler("update_button_selected", var_70_2)
	arg_70_0:addEventHandler("update_input_type", function(arg_76_0, arg_76_1)
		var_0_7(arg_76_0, arg_70_1)
	end)

	local function var_70_3(arg_77_0, arg_77_1)
		for iter_77_0, iter_77_1 in ipairs(arg_70_0.modifiedOptions) do
			if iter_77_1.id == arg_77_1.target.id then
				return
			end
		end

		table.insert(arg_70_0.modifiedOptions, arg_77_1.target)
		var_0_7(arg_77_0, arg_70_1)
	end

	arg_70_0:addEventHandler("add_modified_option", var_70_3)
	arg_70_0:addEventHandler("detail_view_close", function(arg_78_0, arg_78_1)
		arg_78_0.optionDetailPreview:closeTree()

		arg_78_0.optionDetailPreview = nil
	end)
	arg_70_0.bindButton:registerEventHandler("button_right_stick", function(arg_79_0, arg_79_1)
		local var_79_0 = arg_79_0:getParent()
		local var_79_1 = var_79_0._customPreviewButtonAction or var_79_0._detailedPreviewImage and not var_79_0.optionDetailPreview
		local var_79_2 = arg_79_1.controller or arg_70_1

		if var_79_1 and LUI.IsLastInputGamepad(var_79_2) then
			if arg_79_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end

			var_0_47(arg_70_0, arg_79_0, var_79_2)
		elseif arg_70_0.tabId == "keyboardAndMouse" or arg_70_0.tabId == "codCaster" then
			ACTIONS.ResetBindingsAll(arg_70_0, arg_79_0, var_79_2)
		elseif #arg_70_0.modifiedOptions > 0 then
			ACTIONS.ApplyOptionTab(arg_70_0, arg_79_0, var_79_2)
		end
	end)

	arg_70_0.modifiedOptions = {}
	arg_70_0.SetupTabs = var_0_44
	arg_70_0.optionsList = OPTIONS.InitOptionsList(arg_70_0, arg_70_1)

	OPTIONS.InitKeybindOptionsList(arg_70_0, arg_70_1, arg_70_0.optionsList, CSV.keyBindingsOptions)
	OPTIONS.InitKeybindOptionsList(arg_70_0, arg_70_1, arg_70_0.optionsList, CSV.codCasterBindings)
	arg_70_0.OptionWindow:registerEventHandler("subcategory_changed", function(arg_80_0, arg_80_1)
		arg_70_0.OptionWindow:UpdateOptions(arg_70_1, arg_80_1.createOptions, arg_70_0.optionsList)
	end)
	arg_70_0.OptionWindow:registerEventHandler("buttonLayout_over", function(arg_81_0, arg_81_1)
		if arg_81_1.showLayout then
			var_0_38(arg_70_0, arg_70_1, true, arg_81_1.isBR, true)

			if not arg_81_1.isBR then
				arg_70_0.SwapTriggersPrompt:processEvent({
					name = "buttonLayout_over"
				})
			end

			arg_70_0.ButtonLayoutOptionsMenu:processEvent({
				name = "buttonLayout_over"
			})
		end

		if arg_81_1.showSwap then
			var_0_38(arg_70_0, arg_70_1, true, arg_81_1.isBR, false)

			if not arg_81_1.isBR then
				arg_70_0.SwapTriggersPrompt:processEvent({
					name = "buttonLayout_over"
				})
			end
		end

		return true
	end)
	arg_70_0.OptionWindow:registerEventHandler("buttonLayout_up", function()
		var_0_38(arg_70_0, arg_70_1, false)
	end)
	arg_70_0.OptionWindow:registerEventHandler("stickLayout_over", function(arg_83_0, arg_83_1)
		if arg_83_1.showLayout then
			var_0_31(arg_70_0, arg_70_1, true)
			arg_70_0.StickLayoutOptionsMenu:processEvent({
				name = "stickLayout_over"
			})
		end

		return true
	end)
	arg_70_0.OptionWindow:registerEventHandler("stickLayout_up", function(arg_84_0, arg_84_1)
		var_0_31(arg_70_0, arg_70_1, false)
	end)
	arg_70_0.OptionWindow:registerEventHandler("brightness_over", function(arg_85_0, arg_85_1)
		var_0_39(arg_70_0, arg_70_1, true)
	end)
	arg_70_0.OptionWindow:registerEventHandler("brightness_up", function(arg_86_0, arg_86_1)
		var_0_39(arg_70_0, arg_70_1, false)
	end)

	if Dvar.IBEGCHEFE("NQROMTQPMT") then
		arg_70_0.OptionWindow:registerEventHandler("colorblind_over", function(arg_87_0, arg_87_1)
			var_0_40(arg_70_0, arg_70_1, true)
		end)
		arg_70_0.OptionWindow:registerEventHandler("colorblind_up", function(arg_88_0, arg_88_1)
			var_0_40(arg_70_0, arg_70_1, false)
		end)
	end

	arg_70_0.OptionWindow:registerEventHandler("texture_download_limit_over", function(arg_89_0, arg_89_1)
		var_0_41(arg_70_0, arg_70_1, true)
	end)
	arg_70_0.OptionWindow:registerEventHandler("texture_download_limit_up", function(arg_90_0, arg_90_1)
		var_0_41(arg_70_0, arg_70_1, false)
	end)
	arg_70_0.OptionWindow:registerEventHandler("brightness_updated", function(arg_91_0, arg_91_1)
		if arg_70_0.CalibrationGuide then
			arg_70_0.CalibrationGuide:processEvent({
				name = "calibration_updated"
			})
		end
	end)
	arg_70_0.OptionWindow:registerEventHandler("texture_streaming_disable", function(arg_92_0, arg_92_1)
		var_0_6(arg_70_0, "TextureDownloadPC"):processEvent({
			name = "seek_value",
			controllerIndex = arg_92_1.controller
		})
	end)
	arg_70_0:registerEventHandler("gain_focus", function(arg_93_0, arg_93_1)
		if not arg_93_0.OptionWindow.isFaded then
			return arg_93_0.OptionWindow:processEvent(arg_93_1)
		elseif arg_93_0.SubcategoriesOptions and not arg_93_0.SubcategoriesOptions.isFaded then
			return arg_93_0.SubcategoriesOptions:processEvent(arg_93_1)
		end

		return false
	end)
	arg_70_0:registerEventHandler("lose_focus", function(arg_94_0, arg_94_1)
		if arg_94_0.OptionWindow.isFaded then
			arg_94_0.OptionWindow:processEvent(arg_94_1)
		end

		if arg_94_0.SubcategoriesOptions and arg_94_0.SubcategoriesOptions.isFaded then
			arg_94_0.SubcategoriesOptions:processEvent(arg_94_1)
		end

		if LUI.IsLastInputGamepad(arg_70_1) then
			arg_94_0:dispatchEventToChildren({
				name = "remove_overlays"
			})
		end

		return true
	end)
	arg_70_0:addEventHandler("menu_create", function(arg_95_0, arg_95_1)
		arg_95_0:SetupTabs(arg_95_1.controller)
		var_0_7(arg_70_0, arg_70_1)
	end)
	arg_70_0:addAndCallEventHandler("onVideoChange", function(arg_96_0, arg_96_1)
		var_0_17(arg_96_0, arg_70_1)
	end)
	arg_70_0:addEventHandler("subcategory_option_selected", function(arg_97_0, arg_97_1)
		arg_70_0.OptionWindow:RefreshCurrentOptions()
	end)
	var_0_49(arg_70_0, arg_70_1)
	arg_70_0:registerEventHandler("gamepad_button", function(arg_98_0, arg_98_1)
		if arg_98_1.down and arg_98_1.qualifier == "keyboard" and arg_98_1.button == "quick_options" then
			arg_98_0:HandleFlowRequest(arg_70_1, var_0_0.leave)

			return true
		end

		if not arg_98_1.controller then
			local var_98_0 = arg_70_1
		end

		if (arg_98_1.button == "shoulderr" or arg_98_1.button == "shoulderl") and arg_98_1.qualifier == "gamepad" then
			arg_98_0:processEvent({
				name = "gain_focus",
				controller = arg_98_1.controller
			})
			arg_98_0:processEvent({
				name = "lose_focus",
				controller = arg_98_1.controller
			})
		end

		if arg_98_1.down and arg_98_1.button == "alt2" and not OPTIONS.IsCurrentTabGraphics(arg_70_1) and var_0_19(arg_98_0, arg_98_1.controller) then
			return true
		end

		return false
	end)

	local var_70_4 = var_0_0.leave

	arg_70_0:addEventHandler("closing_quick_access_menu", function(arg_99_0, arg_99_1)
		arg_99_0:HandleFlowRequest(arg_70_1, var_70_4)
	end)

	local var_70_5 = var_0_0.dismiss

	arg_70_0:addEventHandler("gamepad_button", function(arg_100_0, arg_100_1)
		if arg_100_1.down and arg_100_1.button == "dismiss_pause_menu" and not Engine.DDJFBBJAIG() then
			arg_100_0:HandleFlowRequest(arg_70_1, var_70_5, true)

			return true
		end
	end)
	arg_70_0:registerEventHandler("redirect_button_event_to_target", function(arg_101_0, arg_101_1)
		LUI.FlowManager.GetScopedData(arg_101_0)._redirectBindButtonEventTarget = arg_101_1.target
	end)

	arg_70_0._initialColorBlindMode = Engine.BECCFCBIAA("colorBlindMode", arg_70_1)

	local var_70_6, var_70_7 = Engine.CBCJIDDIED(arg_70_1)

	arg_70_0._initialColorBlindUITarget = var_70_7

	arg_70_0:addEventHandler("menu_close", function(arg_102_0, arg_102_1)
		Engine.EBIDFIDHIE("updategamerprofile " .. arg_102_1.controller)
		var_0_33(arg_102_0, false)

		if arg_70_0._soundId then
			Engine.EAGBECEBGA(arg_70_0._soundId)

			arg_70_0._soundId = nil
		end

		if Dvar.IBEGCHEFE("NQROMTQPMT") then
			local var_102_0 = Engine.BECCFCBIAA("colorBlindMode", arg_70_1)
			local var_102_1, var_102_2 = Engine.CBCJIDDIED(arg_70_1)

			if var_102_0 ~= arg_70_0._initialColorBlindMode or var_102_2 ~= arg_70_0._initialColorBlindUITarget then
				COLOR_BLIND.UpdateAllSwatches(arg_70_1)
			end
		end
	end)

	arg_70_0.RefreshDependency = var_0_27

	arg_70_0:addEventHandler("options_window_refresh", function(arg_103_0, arg_103_1)
		arg_103_0:dispatchEventToChildren({
			name = "refresh"
		})
		arg_103_0:dispatchEventToChildren({
			name = "refresh_values",
			controller = arg_103_1.controller
		})
	end)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_70_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_70_0.SecondaryTabBacker)

	function arg_70_0.restoreState(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
		if not LUI.IsLastInputMouseNavigation(arg_104_2) then
			arg_104_0:processEvent({
				name = "gain_focus",
				controller = arg_104_2
			})
			arg_104_0:processEvent({
				name = "lose_focus",
				controller = arg_104_2
			})

			return true, 1
		end

		return LUI.UIElement.restoreState(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	end

	local function var_70_8(arg_105_0, arg_105_1)
		if not LUI.IsLastInputMouseNavigation(arg_70_1) then
			arg_105_0:processEvent({
				name = "gain_focus",
				controller = arg_70_1
			})
			arg_105_0:processEvent({
				name = "lose_focus",
				controller = arg_70_1
			})
		end
	end

	arg_70_0:addAndCallEventHandler("update_input_type", var_70_8, {
		controllerIndex = arg_70_1
	})

	arg_70_0.ResetTabOptions = var_0_18
	arg_70_0.HandleResetButtonPressed = var_0_19
	arg_70_0.HandleApplyButtonPressed = var_0_8

	local var_70_9 = Lobby.DGDAAFJDBI()

	if var_70_9 and not Engine.CAADCDEEIA() then
		local var_70_10 = Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", var_70_9)

		if arg_70_0.Nat then
			arg_70_0.Nat:setText(var_70_10)
		end
	end

	arg_70_0:addEventHandler("update_input_type", function(arg_106_0, arg_106_1)
		if LUI.IsLastInputGamepad(arg_106_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_106_0, "Gamepad")
		else
			ACTIONS.AnimateSequence(arg_106_0, "KBM")
		end
	end)
	arg_70_0.bindButton:registerEventHandler("button_alt1", function(arg_107_0, arg_107_1)
		var_0_35(arg_70_0, arg_107_1.controller)

		if arg_70_0.ButtonLayoutOptionsMenu then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			arg_70_0.ButtonLayoutOptionsMenu:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				controller = arg_107_1.controller
			})
		end
	end)
	arg_70_0:addEventHandler("buttonLayout_triggerUpdate", function(arg_108_0, arg_108_1)
		var_0_30(arg_108_0, arg_108_1.controller, arg_108_1.resetFlip)
	end)

	if LUI.IsLastInputGamepad(arg_70_1) then
		ACTIONS.AnimateSequence(arg_70_0, "GamepadSnap")
	else
		ACTIONS.AnimateSequence(arg_70_0, "KBMSnap")
	end

	arg_70_0._fetchTimerHolder = LUI.UIElement.new()

	arg_70_0:addElement(arg_70_0._fetchTimerHolder)

	arg_70_0._fetchTimerHolder.count = 0

	if Engine.BIIBDBAHD() then
		arg_70_0.GetEnforcement = var_0_51

		local var_70_11 = Regulations.BGEIIEHJFD(arg_70_1, 0)

		if var_70_11 == OPTIONS.regulationEnforcement.UNKNOWN or var_70_11 == OPTIONS.regulationEnforcement.ENFORCEMENT_ERROR then
			Regulations.CFAEACEIIJ(arg_70_1)
			arg_70_0:GetEnforcement(arg_70_1)
		end
	end

	METRICS.RecordOptionsMenuOpeningFlow(arg_70_1, arg_70_2.hasUsedShortcut == true)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_70_0, "WZWipSetup")
	end
end

function OptionsMenuNewLayout(arg_109_0, arg_109_1)
	local var_109_0 = LUI.UIElement.new()

	var_109_0.id = "OptionsMenuNewLayout"
	var_109_0._animationSets = var_109_0._animationSets or {}
	var_109_0._sequences = var_109_0._sequences or {}

	local var_109_1 = arg_109_1 and arg_109_1.controllerIndex

	if not var_109_1 and not Engine.DDJFBBJAIG() then
		var_109_1 = var_109_0:getRootController()
	end

	assert(var_109_1)
	var_0_45(var_109_0, var_109_1, arg_109_1)

	local var_109_2 = var_109_0
	local var_109_3
	local var_109_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_109_1
	})

	var_109_4.id = "MenuBackgroundImage"

	var_109_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_109_0:addElement(var_109_4)

	var_109_0.MenuBackgroundImage = var_109_4

	local var_109_5
	local var_109_6 = LUI.UIImage.new()

	var_109_6.id = "SecondaryTabBacker"

	var_109_6:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_109_6:SetAlpha(0, 0)
	var_109_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 160, _1080p * 200)
	var_109_0:addElement(var_109_6)

	var_109_0.SecondaryTabBacker = var_109_6

	local var_109_7
	local var_109_8 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_109_1
	})

	var_109_8.id = "TabBacker"

	var_109_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_109_0:addElement(var_109_8)

	var_109_0.TabBacker = var_109_8

	local var_109_9
	local var_109_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_109_1
	})

	var_109_10.id = "ButtonHelperBar"

	var_109_10.Background:SetAlpha(0.5, 0)
	var_109_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_109_0:addElement(var_109_10)

	var_109_0.ButtonHelperBar = var_109_10

	local var_109_11
	local var_109_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_109_1
	})

	var_109_12.id = "MenuTitle"

	var_109_12.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")), 0)
	var_109_12.Line:SetLeft(0, 0)
	var_109_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_109_0:addElement(var_109_12)

	var_109_0.MenuTitle = var_109_12

	local var_109_13
	local var_109_14 = MenuBuilder.BuildRegisteredType("OptionsKeyBindingBanner", {
		controllerIndex = var_109_1
	})

	var_109_14.id = "OptionsKeyBindingBanner"

	var_109_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 936, _1080p * 996)
	var_109_0:addElement(var_109_14)

	var_109_0.OptionsKeyBindingBanner = var_109_14

	local var_109_15
	local var_109_16 = MenuBuilder.BuildRegisteredType("OptionWindow", {
		controllerIndex = var_109_1
	})

	var_109_16.id = "OptionWindow"

	var_109_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 929, _1080p * 240, _1080p * 906)
	var_109_0:addElement(var_109_16)

	var_109_0.OptionWindow = var_109_16

	local var_109_17
	local var_109_18 = LUI.UIImage.new()

	var_109_18.id = "DescriptionBackground"

	var_109_18:SetRGBFromInt(0, 0)
	var_109_18:SetAlpha(0, 0)
	var_109_18:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_109_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 988, _1080p * 1628, _1080p * 240, _1080p * 906)
	var_109_0:addElement(var_109_18)

	var_109_0.DescriptionBackground = var_109_18

	local var_109_19
	local var_109_20 = LUI.UIImage.new()

	var_109_20.id = "ImagePreview"

	var_109_20:SetAlpha(0, 0)
	var_109_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 277, _1080p * 725)
	var_109_0:addElement(var_109_20)

	var_109_0.ImagePreview = var_109_20

	local var_109_21
	local var_109_22 = LUI.UIStyledText.new()

	var_109_22.id = "OptionName"

	var_109_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_109_22:setText(ToUpperCase(""), 0)
	var_109_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_109_22:SetWordWrap(false)
	var_109_22:SetAlignment(LUI.Alignment.Left)
	var_109_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_109_22:SetStartupDelay(1000)
	var_109_22:SetLineHoldTime(400)
	var_109_22:SetAnimMoveTime(0)
	var_109_22:SetAnimMoveSpeed(100)
	var_109_22:SetEndDelay(1500)
	var_109_22:SetCrossfadeTime(0)
	var_109_22:SetFadeInTime(300)
	var_109_22:SetFadeOutTime(300)
	var_109_22:SetMaxVisibleLines(1)
	var_109_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 232, _1080p * 262)
	var_109_0:addElement(var_109_22)

	var_109_0.OptionName = var_109_22

	local var_109_23
	local var_109_24 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_109_1
	})

	var_109_24.id = "ButtonDescriptionText"

	var_109_24.Description:SetRight(0, 0)
	var_109_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 998, _1080p * 1790, _1080p * 739, _1080p * 767)
	var_109_0:addElement(var_109_24)

	var_109_0.ButtonDescriptionText = var_109_24

	local var_109_25
	local var_109_26 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_109_1
			})
		end,
		controllerIndex = var_109_1
	}
	local var_109_27 = LUI.TabManager.new(var_109_26)

	var_109_27.id = "Tabs"

	var_109_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1350, _1080p * 108, _1080p * 160)
	var_109_0:addElement(var_109_27)

	var_109_0.Tabs = var_109_27

	local var_109_28
	local var_109_29 = LUI.UIText.new()

	var_109_29.id = "Nat"

	var_109_29:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_109_29:setText("", 0)
	var_109_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_109_29:SetAlignment(LUI.Alignment.Left)
	var_109_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_109_29:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 111, _1080p * 477, _1080p * -100, _1080p * -80)
	var_109_0:addElement(var_109_29)

	var_109_0.Nat = var_109_29

	local var_109_30

	if Engine.CGABICJHAI() then
		local var_109_31 = MenuBuilder.BuildRegisteredType("OptionsGraphicsSliderBar", {
			controllerIndex = var_109_1
		})

		var_109_31.id = "OptionsGraphicsSliderBar"

		var_109_31:SetAlpha(0, 0)
		var_109_31:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1045, _1080p * 1645, _1080p * 396, _1080p * 444)
		var_109_0:addElement(var_109_31)

		var_109_0.OptionsGraphicsSliderBar = var_109_31
	end

	local var_109_32

	if CONDITIONS.InGameMP() then
		var_109_32 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_109_1
		})
		var_109_32.id = "InGameMenuTimerStatus"

		var_109_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_109_0:addElement(var_109_32)

		var_109_0.InGameMenuTimerStatus = var_109_32
	end

	local var_109_33

	if CONDITIONS.InFrontendMPOrCP() then
		local var_109_34 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_109_1
		})

		var_109_34.id = "LobbyMembersFooter"

		var_109_34:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_109_0:addElement(var_109_34)

		var_109_0.LobbyMembersFooter = var_109_34
	end

	local function var_109_35()
		return
	end

	var_109_0._sequences.DefaultSequence = var_109_35

	local var_109_36
	local var_109_37 = {
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

	var_109_10:RegisterAnimationSequence("FullScreenState", var_109_37)

	local function var_109_38()
		var_109_10:AnimateSequence("FullScreenState")
	end

	var_109_0._sequences.FullScreenState = var_109_38

	local var_109_39
	local var_109_40 = {
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

	var_109_14:RegisterAnimationSequence("SplitScreenState", var_109_40)

	local var_109_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_109_20:RegisterAnimationSequence("SplitScreenState", var_109_41)

	if CONDITIONS.InGameMP() then
		local var_109_42 = {
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

		var_109_32:RegisterAnimationSequence("SplitScreenState", var_109_42)
	end

	local function var_109_43()
		var_109_14:AnimateSequence("SplitScreenState")
		var_109_20:AnimateSequence("SplitScreenState")

		if CONDITIONS.InGameMP() then
			var_109_32:AnimateSequence("SplitScreenState")
		end
	end

	var_109_0._sequences.SplitScreenState = var_109_43

	local var_109_44
	local var_109_45 = {
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

	var_109_20:RegisterAnimationSequence("HideImagePreview", var_109_45)

	local var_109_46 = {
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

	var_109_24:RegisterAnimationSequence("HideImagePreview", var_109_46)

	local function var_109_47()
		var_109_20:AnimateSequence("HideImagePreview")
		var_109_24:AnimateSequence("HideImagePreview")
	end

	var_109_0._sequences.HideImagePreview = var_109_47

	local var_109_48
	local var_109_49 = {
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

	var_109_20:RegisterAnimationSequence("ShowImagePreview", var_109_49)

	local var_109_50 = {
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

	var_109_24:RegisterAnimationSequence("ShowImagePreview", var_109_50)

	local function var_109_51()
		var_109_20:AnimateSequence("ShowImagePreview")
		var_109_24:AnimateSequence("ShowImagePreview")
	end

	var_109_0._sequences.ShowImagePreview = var_109_51

	local var_109_52
	local var_109_53 = {
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

	var_109_20:RegisterAnimationSequence("InstantHideImagePreview", var_109_53)

	local var_109_54 = {
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

	var_109_24:RegisterAnimationSequence("InstantHideImagePreview", var_109_54)

	local function var_109_55()
		var_109_20:AnimateSequence("InstantHideImagePreview")
		var_109_24:AnimateSequence("InstantHideImagePreview")
	end

	var_109_0._sequences.InstantHideImagePreview = var_109_55

	local var_109_56
	local var_109_57 = {
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

	var_109_6:RegisterAnimationSequence("ShowSecondaryTabs", var_109_57)

	local function var_109_58()
		var_109_6:AnimateSequence("ShowSecondaryTabs")
	end

	var_109_0._sequences.ShowSecondaryTabs = var_109_58

	local var_109_59
	local var_109_60 = {
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

	var_109_6:RegisterAnimationSequence("HideSecondaryTabs", var_109_60)

	local function var_109_61()
		var_109_6:AnimateSequence("HideSecondaryTabs")
	end

	var_109_0._sequences.HideSecondaryTabs = var_109_61

	local var_109_62
	local var_109_63 = {
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

	var_109_27:RegisterAnimationSequence("KBM", var_109_63)

	local function var_109_64()
		var_109_27:AnimateSequence("KBM")
	end

	var_109_0._sequences.KBM = var_109_64

	local var_109_65
	local var_109_66 = {
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

	var_109_27:RegisterAnimationSequence("Gamepad", var_109_66)

	local function var_109_67()
		var_109_27:AnimateSequence("Gamepad")
	end

	var_109_0._sequences.Gamepad = var_109_67

	local var_109_68
	local var_109_69 = {
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

	var_109_27:RegisterAnimationSequence("GamepadSnap", var_109_69)

	local function var_109_70()
		var_109_27:AnimateSequence("GamepadSnap")
	end

	var_109_0._sequences.GamepadSnap = var_109_70

	local var_109_71
	local var_109_72 = {
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

	var_109_27:RegisterAnimationSequence("KBMSnap", var_109_72)

	local function var_109_73()
		var_109_27:AnimateSequence("KBMSnap")
	end

	var_109_0._sequences.KBMSnap = var_109_73

	local var_109_74
	local var_109_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_109_6:RegisterAnimationSequence("WZWipSetup", var_109_75)

	local var_109_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_109_22:RegisterAnimationSequence("WZWipSetup", var_109_76)

	local var_109_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription,
			child = var_109_0.ButtonDescriptionText.Description
		}
	}

	var_109_24:RegisterAnimationSequence("WZWipSetup", var_109_77)

	local function var_109_78()
		var_109_6:AnimateSequence("WZWipSetup")
		var_109_22:AnimateSequence("WZWipSetup")
		var_109_24:AnimateSequence("WZWipSetup")
	end

	var_109_0._sequences.WZWipSetup = var_109_78

	var_0_53(var_109_0, var_109_1, arg_109_1)

	return var_109_0
end

MenuBuilder.registerType("OptionsMenuNewLayout", OptionsMenuNewLayout)
LockTable(_M)
