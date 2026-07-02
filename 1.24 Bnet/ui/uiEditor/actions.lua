ACTIONS = {
	AnimateSequence = function(arg_1_0, arg_1_1)
		if arg_1_0._sequences[arg_1_1] then
			arg_1_0._sequences[arg_1_1]()
		end
	end,
	AnimateSequenceIfItExists = function(arg_2_0, arg_2_1)
		if arg_2_0._sequences and arg_2_0._sequences[arg_2_1] then
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
		end
	end,
	AnimateSequenceByElement = function(arg_3_0, arg_3_1)
		if arg_3_0[arg_3_1.elementName] then
			assert(arg_3_0[arg_3_1.elementName]._sequences)
			arg_3_0[arg_3_1.elementName]._sequences[arg_3_1.sequenceName]()
		else
			local var_3_0 = arg_3_0
			local var_3_1 = LUI.Split(arg_3_1.elementPath, ".")

			for iter_3_0, iter_3_1 in ipairs(var_3_1) do
				var_3_0 = var_3_0[iter_3_1]
			end

			assert(var_3_0)
			var_3_0._sequences[arg_3_1.sequenceName]()
		end
	end,
	SetText = function(arg_4_0, arg_4_1)
		arg_4_0:setText(Engine.CBBHFCGDIC(arg_4_1))
	end,
	SetFont = function(arg_5_0, arg_5_1)
		arg_5_0:SetFont(FONTS.GetFont(arg_5_1.File))
	end,
	SetAlpha = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		arg_6_0:SetAlpha(arg_6_1, arg_6_2, arg_6_3)
	end,
	ScaleFullscreen = function(arg_7_0)
		arg_7_0:setupScaleFullscreen()
	end,
	ScaleStretchAnchorFullscreen = function(arg_8_0)
		arg_8_0:scaleStretchAnchorToRoot()
	end,
	GainFocus = function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_0[arg_9_1]:processEvent({
			name = "gain_focus",
			controller = arg_9_2
		})
	end,
	LoseFocus = function(arg_10_0, arg_10_1, arg_10_2)
		(#arg_10_1 > 0 and arg_10_0[arg_10_1] or arg_10_0):processEvent({
			name = "lose_focus",
			controller = arg_10_2
		})
	end,
	DebugPrint = function(arg_11_0, arg_11_1)
		DebugPrint(arg_11_1)
	end,
	PlaySoundSetSound = function(arg_12_0, arg_12_1, arg_12_2)
		arg_12_0:playSound(arg_12_1, arg_12_2)
	end,
	StopSoundSetSound = function(arg_13_0, arg_13_1)
		arg_13_0:stopSound(arg_13_1)
	end,
	ResumeGame = function(arg_14_0)
		PreGame.RestoreDuckAudio()

		if Engine.IGAJBFHE() then
			Engine.CCCCGJJHFB()

			if not LUI.FlowManager.IsInStack("pre_game") then
				Engine.DIDFHBFDFG(PauseReason.KEY_INPUT)
			end
		else
			Engine.DIDFHBFDFG(PauseReason.KEY_INPUT)
		end
	end,
	ReturnToHub = function(arg_15_0)
		return
	end,
	CloseAllMenus = function(arg_16_0)
		LUI.FlowManager.RequestCloseAllMenus()
	end,
	CloseChildren = function(arg_17_0)
		arg_17_0:closeChildren()
	end,
	LeaveMenu = function(arg_18_0)
		LUI.FlowManager.RequestLeaveMenu(arg_18_0, true)
	end,
	LeaveMenuByName = function(arg_19_0)
		LUI.FlowManager.RequestLeaveMenuByName(arg_19_0, true)
	end,
	RestoreMenu = function(arg_20_0, arg_20_1, arg_20_2)
		LUI.FlowManager.RequestRestoreMenu(arg_20_0, arg_20_1, arg_20_2)
	end,
	OpenMenu = function(arg_21_0, arg_21_1, arg_21_2)
		LUI.FlowManager.RequestAddMenu(arg_21_0, arg_21_1, arg_21_2, nil, nil, true)
	end,
	OpenPopupMenu = function(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
		LUI.FlowManager.RequestPopupMenu(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	end,
	OpenOptionsMenu = function(arg_23_0, arg_23_1, arg_23_2)
		if Dvar.IBEGCHEFE("LSQNRLMKST") then
			local var_23_0 = {
				activeTabId = arg_23_1,
				hasUsedShortcut = arg_23_2
			}

			LUI.FlowManager.RequestAddMenu("OptionsMenuNewLayout", true, arg_23_0, nil, var_23_0, true)
		else
			ACTIONS.OpenMenu("OptionsMenu", true, arg_23_0)
		end
	end,
	OpenPCAchievementMenu = function(arg_24_0)
		LUI.FlowManager.RequestAddMenu("PCAchievementsMenu", true, arg_24_0, nil, nil, true)
	end,
	NextPage = function(arg_25_0)
		arg_25_0:dispatchEventToChildren({
			name = "next_page"
		})
	end,
	PrevPage = function(arg_26_0)
		arg_26_0:dispatchEventToChildren({
			name = "prev_page"
		})
	end,
	ScriptNotify = function(arg_27_0, arg_27_1)
		Engine.EBHIFJCGBH(arg_27_0, arg_27_1)
	end,
	AdvancePostGame = function(arg_28_0)
		PostGameFanfare:advance()
	end,
	PlayMission = function(arg_29_0, arg_29_1)
		return
	end,
	UploadStats = function(arg_30_0, arg_30_1)
		if Engine.DDJFBBJAIG() then
			Engine.EBIDFIDHIE("uploadstats", arg_30_1)
		end
	end,
	OpenChallengesMenu = function(arg_31_0, arg_31_1, arg_31_2)
		local var_31_0 = arg_31_0:GetCurrentMenu()
		local var_31_1 = arg_31_1:GetDataSource()
		local var_31_2 = {
			subCategoryDataSource = var_31_1
		}

		LUI.FlowManager.RequestAddMenu("ChallengesMenu", true, arg_31_2, nil, var_31_2)
	end,
	SpendClassicWeaponToken = function(arg_32_0, arg_32_1)
		local var_32_0 = arg_32_0:GetCurrentMenu():GetDataSource(arg_32_1).classicWeaponTokenCount
		local var_32_1 = var_32_0:GetValue(arg_32_1)
		local var_32_2 = arg_32_0:GetDataSource(arg_32_1)
		local var_32_3 = var_32_2.name:GetValue(arg_32_1)
		local var_32_4 = {
			itemName = var_32_3
		}

		if var_32_2.isUnlocked:GetValue(arg_32_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "ClassicWeaponAlreadyUnlockedPopup", true, arg_32_1, false, var_32_4)

			return
		elseif var_32_1 <= 0 then
			LUI.FlowManager.RequestPopupMenu(nil, "ClassicWeaponNotEnoughTokensPopup", true, arg_32_1, false, var_32_4)

			return
		else
			function var_32_4.confirmAction()
				PlayerData.BFFBGAJGD(arg_32_1, CoD.StatsGroup.Common).sharedProgression.classicWeapons[var_32_2.weaponRef]:set(1)
				var_32_0:SetValue(arg_32_1, var_32_1 - 1)
				var_32_2.isUnlocked:SetValue(arg_32_1, true)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "ClassicWeaponsYesNoPopup", true, arg_32_1, false, var_32_4)
		end
	end,
	ResetOptionTab = function(arg_34_0, arg_34_1, arg_34_2)
		local var_34_0 = arg_34_0.SubcategoriesOptions and arg_34_0.SubcategoriesOptions.subCategoryName or arg_34_0.tabName
		local var_34_1 = var_34_0 == ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GRAPHICS"))
		local var_34_2 = ""

		if not var_34_1 then
			var_34_2 = Engine.CBBHFCGDIC("MENU/RESET_TAB_OPTION_MESSAGE", var_34_0)
		else
			var_34_2 = Engine.CBBHFCGDIC("MENU/RESET_GRAPHICS_TAB_OPTION_MESSAGE", var_34_0)
		end

		local function var_34_3()
			if arg_34_0.ResetTabOptions then
				arg_34_0.ResetTabOptions(arg_34_0, arg_34_2)
			end
		end

		LUI.FlowManager.RequestPopupMenu(arg_34_0, "PopupYesNo", true, arg_34_2, false, {
			yesAction = var_34_3,
			message = var_34_2
		})
		arg_34_0:dispatchEventToChildren({
			name = "remove_overlays"
		})
	end,
	ResetBindingsAll = function(arg_36_0, arg_36_1, arg_36_2)
		local var_36_0 = ""

		if arg_36_0.tabId == "keyboardAndMouse" or arg_36_0.tabId == "codCaster" then
			local var_36_1 = arg_36_0.tabId == "codCaster" and Engine.CBBHFCGDIC("MENU/RESET_ALL_CODCASTER_KEYBINDS_MESSAGE") or Engine.CBBHFCGDIC("MENU/RESET_ALL_KEYBINDS_MESSAGE")

			if arg_36_0.tabId ~= "codCaster" or not CSV.codCasterBindings then
				local var_36_2 = CSV.keyBindingsOptions
			end

			local function var_36_3()
				Engine.BFHCBIBDGH(arg_36_2)
				arg_36_0:dispatchEventToRoot({
					name = "options_window_refresh",
					controller = arg_36_2
				})
			end

			LUI.FlowManager.RequestPopupMenu(arg_36_0, "PopupYesNo", true, arg_36_2, false, {
				yesAction = var_36_3,
				message = var_36_1
			})
			arg_36_0:dispatchEventToChildren({
				name = "remove_overlays"
			})
		end
	end,
	ResetSingleOption = function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0.HandleResetButtonPressed then
			arg_38_0.HandleResetButtonPressed(arg_38_0, arg_38_2)
		end
	end,
	ApplyOptionTab = function(arg_39_0, arg_39_1, arg_39_2)
		if arg_39_0.HandleApplyButtonPressed then
			arg_39_0.HandleApplyButtonPressed(arg_39_0, arg_39_2)
		end
	end,
	ToggleMicTest = function(arg_40_0, arg_40_1, arg_40_2)
		if arg_40_0.ToggleMicTest then
			arg_40_0:ToggleMicTest()
		end
	end
}
