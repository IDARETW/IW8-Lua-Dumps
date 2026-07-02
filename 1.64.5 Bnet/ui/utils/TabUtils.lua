TAB = TAB or {}
TAB.MP = {
	OPERATORS = 3,
	PLAY = 0,
	WEAPONS = 1,
	STORE = 6,
	BATTLE_PASS = 5,
	BARRACKS = 4,
	EVENT = 7,
	CHALLENGES = 2
}
TAB.TAB_EVENT = {
	FOCUS_TAB = 1,
	MOUSE_ENTER = 2,
	LEFT_MOUSE_UP = 5,
	LEFT_MOUSE_DOWN = 4,
	MOUSE_LEAVE = 3
}

function TAB.SetTabState(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 and arg_1_1.event ~= TAB.TAB_EVENT.FOCUS_TAB
	local var_1_1 = arg_1_1 and arg_1_1.event == TAB.TAB_EVENT.MOUSE_ENTER
	local var_1_2 = arg_1_1 and arg_1_1.focusWithSound
	local var_1_3 = IsLanguageArabic() and CONDITIONS.IsMagmaGameMode() and "AR" or ""

	if not arg_1_0._disabled then
		if var_1_0 then
			if arg_1_1 and arg_1_1.event == TAB.TAB_EVENT.MOUSE_ENTER then
				if arg_1_0.focused then
					WZWIP.AnimateThemeElement(arg_1_0, "Highlighted" .. var_1_3)
				else
					WZWIP.AnimateThemeElement(arg_1_0, "Focused" .. var_1_3)
				end
			elseif arg_1_1 and arg_1_1.event == TAB.TAB_EVENT.LEFT_MOUSE_UP then
				WZWIP.AnimateThemeElement(arg_1_0, "Highlighted" .. var_1_3)
			elseif arg_1_0.focused then
				WZWIP.AnimateThemeElement(arg_1_0, "FocusedNoSound" .. var_1_3)
			else
				WZWIP.AnimateThemeElement(arg_1_0, "UnFocused" .. var_1_3)
			end
		elseif arg_1_0.focused then
			if var_1_2 then
				WZWIP.AnimateThemeElement(arg_1_0, "Focused" .. var_1_3)
			else
				WZWIP.AnimateThemeElement(arg_1_0, "FocusedNoSound" .. var_1_3)
			end
		else
			WZWIP.AnimateThemeElement(arg_1_0, "UnFocused" .. var_1_3)
		end
	end

	if arg_1_0._isBattlePassTab then
		WZWIP.AnimateThemeElement(arg_1_0, (arg_1_0.focused or var_1_1) and "BattlePassTabOver" or "BattlePassTabUp")
	end

	if arg_1_0._isFreeItem then
		WZWIP.AnimateThemeElement(arg_1_0, (arg_1_0.focused or var_1_1) and "FreeBundleTabOver" or "FreeBundleTabUp")
	end

	if arg_1_0._isEventTab then
		local var_1_4 = SEASONAL_EVENT.GetCurrentInitSetupSequenceName()

		var_1_4 = (arg_1_0.focused or var_1_1) and var_1_4 .. "TabOver" or var_1_4 .. "TabUp"

		local var_1_5 = WZWIP.CheckForApplyPrependWZWipPrefix(var_1_4, true)

		if not arg_1_0._sequences[var_1_5] then
			var_1_4 = (arg_1_0.focused or var_1_1) and "SeasonalEventTabOver" or "SeasonalEventTabUp"
		end

		WZWIP.AnimateThemeElement(arg_1_0, var_1_4)
	end
end

function TAB.SetUp(arg_2_0, arg_2_1)
	assert(arg_2_0._sequences)
	assert(arg_2_0._sequences.UnFocused)
	assert(arg_2_0._sequences.Focused)
	assert(arg_2_0._sequences.Disabled)
	assert(arg_2_0._sequences.Highlighted)
	assert(arg_2_0._sequences.FocusedNoSound)

	local var_2_0 = IsLanguageArabic() and CONDITIONS.IsWZWipFlowEnabled() and "AR" or ""

	function arg_2_0.Enable(arg_3_0)
		arg_3_0._disabled = false

		WZWIP.AnimateThemeElement(arg_3_0, "UnFocused" .. var_2_0)
	end

	function arg_2_0.Disable(arg_4_0)
		arg_4_0._disabled = true

		WZWIP.AnimateThemeElement(arg_4_0, "Disabled" .. var_2_0)
	end

	function arg_2_0.IsEnabled(arg_5_0)
		return not arg_5_0._disabled
	end

	arg_2_0:registerEventHandler("focus_tab", function(arg_6_0, arg_6_1)
		arg_6_0.focused = arg_6_1.index == arg_6_0.index

		TAB.SetTabState(arg_6_0, {
			event = TAB.TAB_EVENT.FOCUS_TAB,
			focusWithSound = arg_6_1.playSound
		})
		arg_6_0.TabText:SetParentHasFocus(not not arg_6_0.focused)
	end)
	arg_2_0:registerEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_7_0, arg_7_1)
		if arg_7_1.index == arg_2_0.index then
			arg_2_0:dispatchEventToCurrentMenu({
				name = LUI.TabManager.TAB_SWITCH_EVENT,
				controller = arg_7_1.controller,
				index = arg_7_1.index
			})
		end

		return true
	end)
	arg_2_0:SetHandleMouse(true)
	arg_2_0:registerEventHandler("mouseenter", function(arg_8_0, arg_8_1)
		Engine.BJDBIAGIDA(CoD.SFX.MouseOver)
		TAB.SetTabState(arg_8_0, {
			event = TAB.TAB_EVENT.MOUSE_ENTER
		})
	end)
	arg_2_0:registerEventHandler("mouseleave", function(arg_9_0, arg_9_1)
		TAB.SetTabState(arg_9_0, {
			event = TAB.TAB_EVENT.MOUSE_LEAVE
		})

		if not arg_9_0.focused and arg_9_0._disabled then
			arg_9_0._sequences.Disabled()
		end

		arg_9_0:setFocus(false)
	end)
	arg_2_0:registerEventHandler("leftmousedown", function(arg_10_0, arg_10_1)
		return
	end)
	arg_2_0:registerEventHandler("leftmouseup", function(arg_11_0, arg_11_1)
		if arg_11_1.inside and not arg_11_0._disabled then
			arg_11_0:playSound("menu_open")
			arg_11_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_11_0.index
			})
			TAB.SetTabState(arg_11_0, {
				event = TAB.TAB_EVENT.LEFT_MOUSE_UP
			})
		end
	end)
	arg_2_0:registerEventHandler("tab_disable_blur", function(arg_12_0, arg_12_1)
		ACTIONS.AnimateSequence(arg_12_0, "NoBlur")
	end)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "disabled", function(arg_13_0)
		if DataModel.JJEHAEBDF(arg_13_0) then
			arg_2_0:Disable()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_2_0, "KORZH")
	elseif IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_2_0, "DE")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_2_0, "RU")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_2_0, "JP")
		arg_2_0.TabText:SetMaxVisibleLines(1)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function TAB.UpdateBuiltWidgetOnTabChange(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4, arg_14_5, arg_14_6)
	if arg_14_0[arg_14_2] then
		if arg_14_0[arg_14_2].OnClose then
			arg_14_0[arg_14_2]:OnClose()
		end

		arg_14_0[arg_14_2]:closeTree()

		arg_14_0[arg_14_2] = nil
	end

	arg_14_0[arg_14_2] = MenuBuilder.BuildRegisteredType(arg_14_5, arg_14_6)

	if arg_14_6.buildPriority then
		arg_14_0[arg_14_2]:setPriority(arg_14_6.buildPriority)
	end

	arg_14_0[arg_14_2]:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	arg_14_0:addElement(arg_14_0[arg_14_2])
	arg_14_0[arg_14_2]:processEvent({
		name = "tab_create"
	})

	if arg_14_0[arg_14_2].OnInit then
		arg_14_0[arg_14_2]:OnInit()
	end

	if arg_14_3 ~= arg_14_1 and arg_14_4 ~= FocusType.MouseOver and arg_14_4 ~= FocusType.MenuFlow then
		arg_14_0[arg_14_2]:processEvent({
			shouldPlayButtonSound = false,
			name = "gain_focus"
		})
	end
end

function TAB.GetIndex(arg_15_0)
	local var_15_0 = 0
	local var_15_1 = {
		[TAB.MP.PLAY] = var_15_0
	}
	local var_15_2 = var_15_0 + 1

	if CONDITIONS.IsSeasonalEventTabActive() then
		var_15_1[TAB.MP.EVENT] = var_15_2
		var_15_2 = var_15_2 + 1
	end

	var_15_1[TAB.MP.WEAPONS] = var_15_2

	local var_15_3 = var_15_2 + 1

	var_15_1[TAB.MP.OPERATORS] = var_15_3

	local var_15_4 = var_15_3 + 1

	if CONDITIONS.IsWeGameGovBanned() then
		return var_15_1[arg_15_0]
	end

	if CONDITIONS.IsChallengeTabEnabled() then
		var_15_1[TAB.MP.CHALLENGES] = var_15_4
		var_15_4 = var_15_4 + 1
	end

	var_15_1[TAB.MP.BARRACKS] = var_15_4

	local var_15_5 = var_15_4 + 1

	if CONDITIONS.IsBattlePassEnabled() then
		if Dvar.IBEGCHEFE("NSNRTPNQPN") then
			local var_15_6 = Dvar.CFHDGABACF("NTSLOQPLNT")
			local var_15_7 = var_15_1[TAB.MP.BARRACKS] + 1
			local var_15_8 = TAB.BPReorder(var_15_6, var_15_7)

			var_15_1[TAB.MP.PLAY] = var_15_8[var_15_1[TAB.MP.PLAY]]

			if CONDITIONS.IsSeasonalEventTabActive() then
				var_15_1[TAB.MP.EVENT] = var_15_8[var_15_1[TAB.MP.EVENT]]
			end

			var_15_1[TAB.MP.WEAPONS] = var_15_8[var_15_1[TAB.MP.WEAPONS]]

			if CONDITIONS.IsChallengeTabEnabled() then
				var_15_1[TAB.MP.CHALLENGES] = var_15_8[var_15_1[TAB.MP.CHALLENGES]]
			end

			var_15_1[TAB.MP.OPERATORS] = var_15_8[var_15_1[TAB.MP.OPERATORS]]
			var_15_1[TAB.MP.BARRACKS] = var_15_8[var_15_1[TAB.MP.BARRACKS]]
			var_15_1[TAB.MP.BATTLE_PASS] = var_15_8[var_15_7]

			if CONDITIONS.IsStoreAllowed() then
				var_15_1[TAB.MP.STORE] = var_15_8[var_15_7 + 1]
			end
		else
			var_15_1[TAB.MP.BATTLE_PASS] = var_15_1[TAB.MP.BARRACKS] + 1

			if CONDITIONS.IsStoreAllowed() then
				var_15_1[TAB.MP.STORE] = var_15_1[TAB.MP.BATTLE_PASS] + 1
			end
		end
	elseif CONDITIONS.IsStoreAllowed() and not Dvar.IBEGCHEFE("NSNRTPNQPN") then
		var_15_1[TAB.MP.STORE] = var_15_1[TAB.MP.BARRACKS] + 1
	end

	return var_15_1[arg_15_0]
end

function TAB.BPReorder(arg_16_0, arg_16_1)
	local var_16_0 = 4

	if CONDITIONS.IsBattlePassEnabled() then
		var_16_0 = var_16_0 + 1
	end

	if CONDITIONS.IsStoreAllowed() then
		var_16_0 = var_16_0 + 1
	end

	if CONDITIONS.IsChallengeTabEnabled() then
		var_16_0 = var_16_0 + 1
	end

	if CONDITIONS.IsSeasonalEventTabActive() then
		var_16_0 = var_16_0 + 1
	end

	arg_16_0 = arg_16_0 - 1

	local var_16_1 = {}

	if arg_16_0 < var_16_0 and arg_16_0 > 0 then
		for iter_16_0 = 0, var_16_0 - 1 do
			if arg_16_0 == arg_16_1 then
				var_16_1[iter_16_0] = iter_16_0
			elseif arg_16_0 == var_16_0 - 1 then
				if iter_16_0 == arg_16_1 then
					var_16_1[iter_16_0] = iter_16_0 + 1
				elseif iter_16_0 == arg_16_0 then
					var_16_1[iter_16_0] = arg_16_1
				else
					var_16_1[iter_16_0] = iter_16_0
				end
			elseif iter_16_0 == arg_16_0 then
				var_16_1[iter_16_0] = iter_16_0 + 1
			elseif iter_16_0 == arg_16_1 then
				var_16_1[iter_16_0] = arg_16_0
			elseif arg_16_0 < iter_16_0 and iter_16_0 ~= var_16_0 - 1 then
				var_16_1[iter_16_0] = iter_16_0 + 1
			else
				var_16_1[iter_16_0] = iter_16_0
			end
		end

		return var_16_1
	else
		for iter_16_1 = 0, var_16_0 - 1 do
			var_16_1[iter_16_1] = iter_16_1
		end

		return var_16_1
	end
end
