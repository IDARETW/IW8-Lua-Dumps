TAB = TAB or {}
TAB.MP = {
	OPERATORS = 3,
	PLAY = 0,
	WEAPONS = 1,
	STORE = 6,
	BATTLE_PASS = 5,
	BARRACKS = 4,
	CHALLENGES = 2
}

function TAB.SetUp(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_0._sequences)
	assert(arg_1_0._sequences.UnFocused)
	assert(arg_1_0._sequences.Focused)
	assert(arg_1_0._sequences.Disabled)
	assert(arg_1_0._sequences.Highlighted)
	assert(arg_1_0._sequences.FocusedNoSound)

	function arg_1_0.Setup(arg_2_0, arg_2_1)
		if arg_1_2 then
			arg_1_2:setText(arg_2_1.name)
		end

		if arg_1_3 then
			arg_1_3:setImage(RegisterMaterial(arg_2_1.image))
		end
	end

	function arg_1_0.Enable(arg_3_0)
		arg_3_0._disabled = false

		ACTIONS.AnimateSequence(arg_3_0, "UnFocused")
	end

	function arg_1_0.Disable(arg_4_0)
		arg_4_0._disabled = true

		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end

	function arg_1_0.IsEnabled(arg_5_0)
		return not arg_5_0._disabled
	end

	arg_1_0:registerEventHandler("focus_tab", function(arg_6_0, arg_6_1)
		if arg_6_1.index == arg_6_0.index then
			if arg_6_1.playSound then
				arg_6_0._sequences.Focused()
			else
				arg_6_0._sequences.FocusedNoSound()
			end

			arg_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 270 * _1080p, 0, 40 * _1080p, 100, LUI.EASING.outQuadratic)

			arg_6_0.focused = true
		elseif arg_6_0.focused then
			arg_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 40 * _1080p, 100, LUI.EASING.outQuadratic)
			arg_6_0._sequences.UnFocused()

			arg_6_0.focused = false
		end
	end)
	arg_1_0:SetHandleMouse(true)
	arg_1_0:registerEventHandler("mouseenter", function(arg_7_0, arg_7_1)
		if not arg_7_0.focused then
			if not arg_7_0._disabled then
				arg_7_0._sequences.Highlighted()
			else
				arg_7_0._sequences.Focused()
			end
		end
	end)
	arg_1_0:registerEventHandler("mouseleave", function(arg_8_0, arg_8_1)
		if arg_8_0.focused and not arg_8_0._disabled then
			arg_8_0._sequences.FocusedNoSound()
		else
			arg_8_0._sequences.UnFocused()
		end
	end)
	arg_1_0:registerEventHandler("leftmousedown", function(arg_9_0, arg_9_1)
		return
	end)
	arg_1_0:registerEventHandler("leftmouseup", function(arg_10_0, arg_10_1)
		if arg_10_1.inside and not arg_10_0._disabled then
			arg_10_0:playSound("menu_open")
			arg_10_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_10_0.index
			})
		end
	end)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "disabled", function(arg_11_0)
		if DataModel.JJEHAEBDF(arg_11_0) then
			arg_1_0:Disable()
		end
	end)
end

function TAB.UpdateBuiltWidgetOnTabChange(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6)
	if arg_12_0[arg_12_2] then
		arg_12_0[arg_12_2]:closeTree()

		arg_12_0[arg_12_2] = nil
	end

	arg_12_0[arg_12_2] = MenuBuilder.BuildRegisteredType(arg_12_5, arg_12_6)

	if arg_12_6.buildPriority then
		arg_12_0[arg_12_2]:setPriority(arg_12_6.buildPriority)
	end

	arg_12_0.activeTabWidget:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	arg_12_0:addElement(arg_12_0.activeTabWidget)
	arg_12_0[arg_12_2]:processEvent({
		name = "tab_create"
	})

	if arg_12_3 ~= arg_12_1 and arg_12_4 ~= FocusType.MouseOver and arg_12_4 ~= FocusType.MenuFlow then
		arg_12_0[arg_12_2]:processEvent({
			shouldPlayButtonSound = false,
			name = "gain_focus"
		})
	end
end

function TAB.GetIndex(arg_13_0)
	local var_13_0 = {
		[TAB.MP.PLAY] = 0,
		[TAB.MP.WEAPONS] = 1,
		[TAB.MP.OPERATORS] = 2
	}

	if CONDITIONS.IsWeGameGovBanned() then
		return var_13_0[arg_13_0]
	end

	if CONDITIONS.IsChallengeTabEnabled() then
		var_13_0[TAB.MP.CHALLENGES] = 3
		var_13_0[TAB.MP.BARRACKS] = 4
	else
		var_13_0[TAB.MP.BARRACKS] = 3
	end

	if CONDITIONS.IsBattlePassEnabled() then
		local var_13_1 = Dvar.CFHDGABACF("NTSLOQPLNT")

		if Dvar.IBEGCHEFE("NSNRTPNQPN") then
			local var_13_2 = Dvar.CFHDGABACF("NTSLOQPLNT")
			local var_13_3 = var_13_0[TAB.MP.BARRACKS] + 1
			local var_13_4 = TAB.BPReorder(var_13_2, var_13_3)

			var_13_0[TAB.MP.PLAY] = var_13_4[var_13_0[TAB.MP.PLAY]]
			var_13_0[TAB.MP.WEAPONS] = var_13_4[var_13_0[TAB.MP.WEAPONS]]

			if CONDITIONS.IsChallengeTabEnabled() then
				var_13_0[TAB.MP.CHALLENGES] = var_13_4[var_13_0[TAB.MP.CHALLENGES]]
			end

			var_13_0[TAB.MP.OPERATORS] = var_13_4[var_13_0[TAB.MP.OPERATORS]]
			var_13_0[TAB.MP.BARRACKS] = var_13_4[var_13_0[TAB.MP.BARRACKS]]
			var_13_0[TAB.MP.BATTLE_PASS] = var_13_4[var_13_3]

			if CONDITIONS.IsStoreAllowed() then
				var_13_0[TAB.MP.STORE] = var_13_4[var_13_3 + 1]
			end
		else
			var_13_0[TAB.MP.BATTLE_PASS] = var_13_0[TAB.MP.BARRACKS] + 1

			if CONDITIONS.IsStoreAllowed() then
				var_13_0[TAB.MP.STORE] = var_13_0[TAB.MP.BATTLE_PASS] + 1
			end
		end
	elseif CONDITIONS.IsStoreAllowed() and not Dvar.IBEGCHEFE("NSNRTPNQPN") then
		var_13_0[TAB.MP.STORE] = var_13_0[TAB.MP.BARRACKS] + 1
	end

	return var_13_0[arg_13_0]
end

function TAB.BPReorder(arg_14_0, arg_14_1)
	local var_14_0 = 4

	if CONDITIONS.IsBattlePassEnabled() then
		var_14_0 = var_14_0 + 1
	end

	if CONDITIONS.IsStoreAllowed() then
		var_14_0 = var_14_0 + 1
	end

	if CONDITIONS.IsChallengeTabEnabled() then
		var_14_0 = var_14_0 + 1
	end

	arg_14_0 = arg_14_0 - 1

	local var_14_1 = {}

	if arg_14_0 < var_14_0 and arg_14_0 > 0 then
		for iter_14_0 = 0, var_14_0 - 1 do
			if arg_14_0 == arg_14_1 then
				var_14_1[iter_14_0] = iter_14_0
			elseif arg_14_0 == var_14_0 - 1 then
				if iter_14_0 == arg_14_1 then
					var_14_1[iter_14_0] = iter_14_0 + 1
				elseif iter_14_0 == arg_14_0 then
					var_14_1[iter_14_0] = arg_14_1
				else
					var_14_1[iter_14_0] = iter_14_0
				end
			elseif iter_14_0 == arg_14_0 then
				var_14_1[iter_14_0] = iter_14_0 + 1
			elseif iter_14_0 == arg_14_1 then
				var_14_1[iter_14_0] = arg_14_0
			elseif arg_14_0 < iter_14_0 and iter_14_0 ~= var_14_0 - 1 then
				var_14_1[iter_14_0] = iter_14_0 + 1
			else
				var_14_1[iter_14_0] = iter_14_0
			end
		end

		return var_14_1
	else
		for iter_14_1 = 0, var_14_0 - 1 do
			var_14_1[iter_14_1] = iter_14_1
		end

		return var_14_1
	end
end
