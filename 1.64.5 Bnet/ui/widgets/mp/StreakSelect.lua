module(..., package.seeall)

if Engine.DDJFBBJAIG() then
	LUI.FlowManager.RegisterFenceGroup("StreakSelect", {
		"StatsGroup"
	})
end

local var_0_0 = 150
local var_0_1 = var_0_0 + 50
local var_0_2 = 64

local function var_0_3(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {
		displayTime = 2000,
		icon = arg_1_2,
		header = Engine.CBBHFCGDIC("LUA_MENU/KILLSTREAK_EQUIPPED"),
		description = Engine.CBBHFCGDIC(arg_1_3),
		type = LUI.ToastManager.NotificationType.StreakEquipped,
		controllerIndex = arg_1_1
	}

	arg_1_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_1_0
	})
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and arg_2_1._gridContentColumnIndex or 0
	local var_2_1 = arg_2_0.StreakGrid:GetPositionForIndex(var_2_0)

	arg_2_0.StreakGrid:SetFocusedPosition(var_2_1, true, false)
end

local function var_0_5(arg_3_0, arg_3_1)
	if arg_3_1 then
		local var_3_0 = tonumber(arg_3_0.kills)

		return var_3_0, Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", var_3_0)
	else
		return tonumber(arg_3_0.scoreCost), arg_3_0.scoreCost
	end
end

local function var_0_6(arg_4_0, arg_4_1)
	if arg_4_0.streakCategories then
		for iter_4_0, iter_4_1 in pairs(arg_4_0.streakCategories) do
			arg_4_0:RemoveElement(iter_4_1)

			arg_4_0.streakCategories[iter_4_0] = nil
		end
	end

	arg_4_0.streakCategories = {}

	local var_4_0 = 0
	local var_4_1
	local var_4_2
	local var_4_3
	local var_4_4 = false
	local var_4_5 = arg_4_0.StreakGrid:GetBuiltChildren()
	local var_4_6 = arg_4_0.StreakCategory:GetCurrentAnchorsAndPositions()

	for iter_4_2, iter_4_3 in ipairs(var_4_5) do
		if not iter_4_3.data then
			var_4_4 = true
			var_4_2 = var_4_5[iter_4_2 - 1]
		elseif var_4_0 ~= tonumber(iter_4_3.data.kills) then
			if not var_4_1 then
				var_4_1 = iter_4_3
			elseif not var_4_2 then
				var_4_2 = var_4_5[iter_4_2 - 1]
				var_4_3 = iter_4_3
			end

			var_4_0 = tonumber(iter_4_3.data.kills)
		end

		if var_4_1 and var_4_2 then
			local var_4_7 = {
				kills = var_4_1.data.kills,
				scoreCost = var_4_1.data.scoreCost
			}
			local var_4_8 = var_4_1:GetCurrentAnchorsAndPositions()
			local var_4_9 = var_4_2:GetCurrentAnchorsAndPositions()
			local var_4_10 = arg_4_0.StreakGrid:GetCurrentAnchorsAndPositions()
			local var_4_11, var_4_12 = var_0_5(var_4_7, arg_4_0.showKills)
			local var_4_13 = MenuBuilder.BuildRegisteredType("StreakKillCategory", {
				controllerIndex = arg_4_1
			})

			var_4_13.id = "StreakCategory_" .. var_4_11
			var_4_13.data = var_4_7

			var_4_13.Text:setText(var_4_12)
			var_4_13:SetAnchorsAndPosition(0, 1, 1, 0, var_4_8.left + var_4_10.left, var_4_9.right + var_4_10.left, var_4_6.top, var_4_6.bottom)
			arg_4_0:addElement(var_4_13)

			arg_4_0.streakCategories[var_4_1.data.kills] = var_4_13
			var_4_1 = var_4_3
			var_4_2 = nil
		end

		if var_4_4 then
			break
		end
	end

	arg_4_0.StreakCategory:SetAlpha(0)
end

local function var_0_7(arg_5_0)
	local var_5_0 = 0

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.equippedStreaks) do
		if iter_5_1.isActive then
			var_5_0 = var_5_0 + 1
		end
	end

	arg_5_0.StreakEquippedStack.StreakEquippedSlots.EquippedNum:setText(var_5_0 .. "/" .. #arg_5_0.equippedStreaks)
end

local function var_0_8(arg_6_0, arg_6_1)
	local var_6_0 = ""
	local var_6_1 = Engine.CBBHFCGDIC("MENU/BACK")
	local var_6_2 = ""
	local var_6_3 = ""

	if arg_6_0.showKills then
		var_6_2 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_SCORESTREAK_VALUES")
	else
		var_6_2 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_KILLSTREAK_VALUES")
	end

	if arg_6_0.buttonOver.data.isUnlocked then
		if arg_6_0.swapVisible then
			var_6_0 = Engine.CBBHFCGDIC("LUA_MENU/SWAP")
		elseif arg_6_0.buttonOver.selected then
			var_6_0 = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
		else
			var_6_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		end
	end

	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = var_6_1
	}, {
		replaceTop = true
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = var_6_0
	}, {
		replaceTop = true
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT_ALL")
	}, {
		replaceTop = true
	})
	arg_6_0.StreakEquippedStack:ShowKills(arg_6_0.showKills)

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.ShowScorestreakValues() then
			if arg_6_1 and LUI.IsLastInputKeyboardMouse(arg_6_1) then
				arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_right_trigger",
					priority = 4,
					helper_text = var_6_2
				}, {
					replaceTop = true
				})
			else
				arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					button_ref = "button_right_trigger",
					priority = 4,
					helper_text = var_6_2,
					container = arg_6_0.StreakCost.SwapPrompt
				}, {
					replaceTop = true
				})
			end
		end
	else
		arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_6_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_6_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_6_0)

		if CONDITIONS.ShowScorestreakValues() then
			arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_right_trigger",
				priority = 4,
				helper_text = var_6_2
			}, {
				replaceTop = true
			})
		end
	end
end

local function var_0_9(arg_8_0)
	if arg_8_0.showKills then
		ACTIONS.AnimateSequence(arg_8_0.StreakCost, "Kills")
		arg_8_0.StreakCost.Text:setText(Engine.CBBHFCGDIC("INTEL_MP/KILLS_SHORT_DESC", arg_8_0.buttonOver.data.kills))
	else
		ACTIONS.AnimateSequence(arg_8_0.StreakCost, "Score")
		arg_8_0.StreakCost.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE_WITH_VALUE", arg_8_0.buttonOver.data.scoreCost))
	end
end

local function var_0_10(arg_9_0, arg_9_1)
	arg_9_0.showKills = not arg_9_0.showKills

	for iter_9_0, iter_9_1 in pairs(arg_9_0.streakCategories) do
		local var_9_0, var_9_1 = var_0_5(iter_9_1.data, arg_9_0.showKills)

		iter_9_1.Text:setText(var_9_1)
	end

	var_0_8(arg_9_0, arg_9_1)

	if Engine.DDJFBBJAIG() then
		var_0_9(arg_9_0)
	end
end

local function var_0_11(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_1.swapVisible = false

	if not arg_10_1.buttonOver then
		arg_10_1.buttonOver = arg_10_2
	end

	for iter_10_0 = 1, #arg_10_1.selectedButtons do
		local var_10_0 = arg_10_1.selectedButtons[iter_10_0]

		if var_10_0 then
			local var_10_1 = var_10_0.data.kills == arg_10_2.data.kills
			local var_10_2 = var_10_0.data.ref == arg_10_2.data.ref
			local var_10_3 = true
			local var_10_4 = arg_10_0 and var_10_1 and not var_10_2 and arg_10_2.data.isUnlocked

			if var_10_4 then
				arg_10_1.SwapWidget:SetReplacesText(var_10_0.data.name)
				ACTIONS.AnimateSequence(arg_10_1.SwapWidget, "TurnOn")

				arg_10_1.swapVisible = true
			end

			var_10_0:UpdateHighlightStatus(var_10_4, var_10_3)
		end
	end

	arg_10_1.SwapWidget:SetVisible(arg_10_1.swapVisible)
	ACTIONS.AnimateSequence(arg_10_1, arg_10_1.swapVisible and "IsNewAndSwap" or "IsNew")
	var_0_8(arg_10_1, arg_10_3)
end

local function var_0_12(arg_11_0)
	assert(arg_11_0.buttonOver)

	local var_11_0 = arg_11_0.buttonOver.data.kills

	if arg_11_0.activeCategory == var_11_0 or not arg_11_0.streakCategories then
		return
	end

	if arg_11_0.activeCategory then
		ACTIONS.AnimateSequence(arg_11_0.streakCategories[arg_11_0.activeCategory], "HighlightOff")
	end

	arg_11_0.activeCategory = var_11_0

	if arg_11_0.activeCategory then
		ACTIONS.AnimateSequence(arg_11_0.streakCategories[arg_11_0.activeCategory], "HighlightOn")
	end
end

local function var_0_13(arg_12_0, arg_12_1)
	if arg_12_1 then
		arg_12_0.EquippedWidget:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_12_0.EquippedWidget, "TurnOn")
		arg_12_0.NewItemNotification:SetAlpha(0)
	else
		arg_12_0.EquippedWidget:SetAlpha(0)
	end
end

local function var_0_14(arg_13_0, arg_13_1, arg_13_2)
	var_0_11(false, arg_13_0, arg_13_0.buttonOver)

	arg_13_0.selectedButtons = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.equippedStreaks) do
		iter_13_1.isActive = false
	end

	arg_13_0.buttonOver:dispatchEventToCurrentMenu({
		name = "update_buttons"
	})
	var_0_7(arg_13_0)
	var_0_13(arg_13_0, false)
	var_0_8(arg_13_0, arg_13_2)
	arg_13_0.StreakEquippedStack:Update(arg_13_0.equippedStreaks)
end

local function var_0_15(arg_14_0, arg_14_1)
	local var_14_0 = hashset({
		"radar_drone_overwatch",
		"manual_turret",
		"scrambler_drone_guard",
		"cruise_predator",
		"precision_airstrike",
		"pac_sentry",
		"hover_jet",
		"white_phosphorus",
		"directional_uav",
		"airdrop",
		"sentry_gun",
		"airdrop_multiple",
		"bradley",
		"chopper_support",
		"juggernaut",
		"chopper_gunner",
		"toma_strike",
		"gunship",
		"uav"
	})
	local var_14_1

	if var_14_0[arg_14_1.data.ref] then
		var_14_1 = "frontend_streak_" .. arg_14_1.data.ref

		arg_14_0.Showcase:SetAlpha(0)
	else
		var_14_1 = "frontend_streak_uav"

		arg_14_0.Showcase:SetAlpha(1)
	end

	assert(arg_14_0.FadeCover)

	local var_14_2 = arg_14_0._streakSelectionComplete and var_0_0 or 10

	if not arg_14_0._prevImage then
		var_14_2 = 0
	end

	arg_14_0.FadeCover:SetAlpha(1, var_14_2, LUI.EASING.inQuadratic)

	arg_14_0.FadeCover:Wait(var_0_0, true).onComplete = function()
		if arg_14_0._streakSelectionComplete then
			assert(arg_14_0.FrontEndMenuBackground)
			arg_14_0.FrontEndMenuBackground:setImage(RegisterMaterial(var_14_1))
			arg_14_0.FrontEndMenuBackground:SetScale(arg_14_0.scaleAdjust, 0)
			arg_14_0.FrontEndMenuBackground:SetScale(arg_14_0.scaleAdjust + 0.015, 2500, LUI.EASING.outQuadratic)
			arg_14_0.FadeCover:SetAlpha(0, var_0_1, LUI.EASING.outQuadratic)

			arg_14_0._prevImage = var_14_1
		end
	end
end

local function var_0_16(arg_16_0, arg_16_1)
	Engine.DFCGFCGBFD(STREAK.GetTutorialVideo(arg_16_0.buttonOver.data.ref), VideoPlaybackFlags.LOOP + VideoPlaybackFlags.MUTE)
	arg_16_0:addEventHandler("menu_close", function(arg_17_0, arg_17_1)
		Engine.EBCGADABJ()
	end)
	LUI.FlowManager.RequestPopupMenu(nil, "TutorialVideoMaximized", true, arg_16_1, false, {
		title = Engine.CBBHFCGDIC(arg_16_0.buttonOver.data.name),
		videoRef = STREAK.GetTutorialVideo(arg_16_0.buttonOver.data.ref),
		videoFlags = VideoPlaybackFlags.LOOP + VideoPlaybackFlags.MUTE
	})
end

local function var_0_17(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	local var_18_0 = LOOT.GetItemID(LOOT.itemTypes.STREAK, arg_18_3.ref)

	arg_18_3.isNew = Loot.HDJCADADF(arg_18_1, var_18_0)

	arg_18_2:Setup(arg_18_3)

	if Engine.DDJFBBJAIG() and arg_18_3.ref == "pac_sentry" then
		arg_18_0.wheelsonButton = arg_18_2
	end

	local function var_18_1(arg_19_0, arg_19_1)
		arg_18_0.buttonOver = arg_19_0

		arg_18_0.StreakName:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_19_0.data.name)))
		arg_18_0.StreakDescription:setText(Engine.CBBHFCGDIC(arg_19_0.data.desc))

		local var_19_0 = Loot.HDJCADADF(arg_18_1, var_18_0)

		arg_18_0.NewItemNotification:UpdateAlpha(var_19_0 and 1 or 0, 0, true)

		if Engine.DDJFBBJAIG() then
			var_0_15(arg_18_0, arg_19_0)
		end

		if Engine.DDJFBBJAIG() then
			arg_18_0.Showcase:setImage(RegisterMaterial(arg_19_0.data.fullImage))
			var_0_9(arg_18_0)
		end

		if arg_19_0.data.isUnlocked then
			ACTIONS.AnimateSequence(arg_18_0, "Unlocked")
		else
			ACTIONS.AnimateSequence(arg_18_0, "Locked")
			arg_18_0.UnlockCriteria.UnlockDesc:setText(arg_19_0.data.unlockCriteria)
		end

		local var_19_1 = arg_19_1.controller or arg_18_1

		var_0_11(true, arg_18_0, arg_19_0, var_19_1)
		var_0_12(arg_18_0)
		var_0_8(arg_18_0, var_19_1)
		var_0_13(arg_18_0, arg_19_0.selected)

		if MLG.IsCDLActive(var_19_1) and MatchRules.DAAABIJDJI(arg_19_0.data.ref) then
			ACTIONS.AnimateSequence(arg_18_0, "CDLRestricted")

			if arg_19_0.selected or arg_18_0.swapVisible or arg_18_3.isNew then
				ACTIONS.AnimateSequence(arg_18_0, "CDLEquipped")
			else
				ACTIONS.AnimateSequence(arg_18_0, "CDLUnequipped")
			end
		else
			ACTIONS.AnimateSequence(arg_18_0, "CDLUnrestricted")
		end

		if arg_19_0:IsDisabled() then
			arg_18_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_primary"
			})
		end

		if Engine.DDJFBBJAIG() then
			local var_19_2 = arg_19_0.data.ref == "bradley"

			arg_18_0.MapsStreakAvailable:SetVisible(var_19_2)
			arg_18_0.MapsStreakAvailable:SetMouseFocusBlocker(not var_19_2)
			arg_18_0.wheelsonButton:SetStarVisible(var_19_2)

			arg_18_0._streakSelectionComplete = false
			arg_18_0:Wait(var_0_0 - 10, true).onComplete = function()
				arg_18_0._streakSelectionComplete = true
			end
		end

		if Engine.DDJFBBJAIG() and not Onboarding.Killstreaks.WasCompleted(arg_18_0, var_19_1) then
			LUI.FlowManager.RequestPopupMenu(arg_18_0, "onboardingpopup", true, var_19_1, false, ONBOARDING_DATA.GetOnboardingKillstreaksData())
			Onboarding.Killstreaks.MarkCompleted(arg_18_0, var_19_1)
		end
	end

	arg_18_2:addEventHandler("button_over", var_18_1)
	arg_18_2:addEventHandler("button_over_disable", var_18_1)
	arg_18_2:addEventHandler("button_up", function(arg_21_0, arg_21_1)
		var_0_11(false, arg_18_0, arg_21_0, arg_21_1.controller)
	end)
	arg_18_2:registerEventHandler("update_buttons", function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0.data.ref

		for iter_22_0, iter_22_1 in ipairs(arg_18_0.equippedStreaks) do
			if var_22_0 == iter_22_1.ref and iter_22_1.isActive then
				arg_22_0:SetSelected(true)

				arg_18_0.selectedButtons[iter_22_0] = arg_22_0

				arg_22_0:ToggleDisabled()

				break
			else
				arg_22_0:SetSelected(false)
			end
		end
	end)
	arg_18_2:registerEventHandler("button_action", function(arg_23_0, arg_23_1)
		local function var_23_0()
			table.sort(arg_18_0.equippedStreaks, function(arg_25_0, arg_25_1)
				return tonumber(arg_25_0.kills) < tonumber(arg_25_1.kills)
			end)
			arg_23_0:dispatchEventToCurrentMenu({
				name = "update_buttons"
			})
			var_0_13(arg_18_0, arg_23_0.selected)

			if MLG.IsCDLActive(controller) and MatchRules.DAAABIJDJI(arg_23_0.data.ref) then
				ACTIONS.AnimateSequence(arg_18_0, "CDLEquipped")
			end

			arg_18_0.StreakEquippedStack:Update(arg_18_0.equippedStreaks)
			var_0_8(arg_18_0, arg_23_1.controller)
			var_0_7(arg_18_0)
		end

		if arg_23_0.data.isUnlocked then
			var_0_11(false, arg_18_0, arg_23_0, arg_23_1.controller)

			arg_18_0.selectedButtons = {}

			local var_23_1 = true
			local var_23_2 = false
			local var_23_3 = {}
			local var_23_4 = false
			local var_23_5 = false

			for iter_23_0, iter_23_1 in ipairs(arg_18_0.equippedStreaks) do
				if iter_23_1.ref == arg_23_0.data.ref then
					var_23_4 = true
				end

				if iter_23_1.kills == arg_23_0.data.kills then
					var_23_5 = true
				end

				if var_23_4 or var_23_5 then
					break
				end
			end

			for iter_23_2 = #arg_18_0.equippedStreaks, 1, -1 do
				local var_23_6 = arg_18_0.equippedStreaks[iter_23_2]
				local var_23_7 = var_23_6.kills == arg_23_0.data.kills

				local function var_23_8(arg_26_0)
					var_23_6.isActive = arg_26_0
					var_23_2 = arg_26_0 and not arg_23_0.selected
					var_23_1 = false
				end

				local function var_23_9()
					arg_18_0.equippedStreaks[iter_23_2] = arg_23_0.data
					arg_18_0.equippedStreaks[iter_23_2].isActive = true
					var_23_2 = not arg_23_0.selected
					var_23_1 = false
				end

				if var_23_6.isActive then
					if var_23_6.ref == arg_23_0.data.ref then
						var_23_8(false)

						break
					elseif var_23_7 then
						var_23_9()

						break
					end
				elseif var_23_6.ref == arg_23_0.data.ref then
					var_23_8(true)

					break
				elseif var_23_7 and not var_23_4 then
					var_23_9()

					break
				elseif not var_23_7 and not var_23_5 then
					var_23_9()

					break
				end
			end

			if var_23_1 then
				local var_23_10 = {
					streaks = arg_18_0.equippedStreaks,
					selection = arg_23_0.data,
					showKills = arg_18_0.showKills,
					onReplace = function(arg_28_0)
						for iter_28_0, iter_28_1 in ipairs(arg_18_0.equippedStreaks) do
							if iter_28_1.ref == arg_28_0 then
								arg_18_0.equippedStreaks[iter_28_0] = arg_23_0.data
								arg_18_0.equippedStreaks[iter_28_0].isActive = true

								break
							end
						end

						var_23_0()
						var_0_3(arg_18_0, arg_23_1.controller, arg_23_0.data.icon, arg_23_0.data.name)
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "StreakReplacePopup", true, arg_23_1.controller, false, var_23_10, nil, true, false)
			end

			var_23_0()

			if var_23_2 then
				var_0_3(arg_18_0, arg_23_1.controller, arg_23_0.data.icon, arg_23_0.data.name)
			end
		end
	end)
end

local function var_0_18(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.bindButton:registerEventHandler("button_alt1", function(arg_30_0, arg_30_1)
		if arg_30_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end

		var_0_14(arg_29_0, arg_29_2, arg_30_1.controller)
	end)

	if CONDITIONS.ShowScorestreakValues() then
		arg_29_0.bindButton:registerEventHandler("button_right_trigger", function(arg_31_0, arg_31_1)
			var_0_10(arg_29_0, arg_29_1)

			if arg_31_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		end)
	end
end

local function var_0_19(arg_32_0, arg_32_1, arg_32_2)
	assert(arg_32_0.StreakGrid)
	assert(arg_32_0.StreakName)
	assert(arg_32_0.StreakDescription)
	assert(arg_32_0.HelperBar)
	assert(arg_32_0.UnlockCriteria)

	arg_32_0.scaleAdjust = 0
	arg_32_0._streakSelectionComplete = true
	arg_32_0._prevImage = nil

	arg_32_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	arg_32_0.MapsStreakAvailable:InitializeDimensions(arg_32_0.MapsStreakAvailable:GetCurrentAnchorsAndPositions())
	arg_32_0.MapsStreakAvailable:UpdatePanel()

	local var_32_0 = PlayerData.BFFBGAJGD(arg_32_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.killstreakSetups
	local var_32_1 = {}

	arg_32_0.equippedStreaks = {}

	local var_32_2 = {}

	for iter_32_0, iter_32_1 in ddlpairs(var_32_0) do
		var_32_2[iter_32_1.killstreak:get()] = true
	end

	for iter_32_2 = 0, StringTable.BFHCAIIDA(CSV.streaks.file) - 1 do
		local var_32_3 = CSV.ReadRow(CSV.streaks, iter_32_2)

		if var_32_3.showInMenus == "1" then
			local var_32_4 = PROGRESSION.GetUnlockRank(LOOT.GetItemID(LOOT.itemTypes.STREAK, var_32_3.ref))
			local var_32_5 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_32_4
			})

			var_32_3.unlockInfo = {
				type = LOOT.unlockTypes.LEVEL,
				level = var_32_4 and var_32_5._rankDisplay or 99
			}
			var_32_3.isUnlocked = PROGRESSION.IsUnlocked(arg_32_1, LOOT.itemTypes.STREAK, var_32_3.ref)

			if not var_32_3.isUnlocked then
				var_32_3.unlockCriteria = PROGRESSION.GetUnlockText(arg_32_1, LOOT.itemTypes.STREAK, var_32_3.ref)
			end

			if var_32_2[var_32_3.ref] then
				var_32_3.isActive = true

				table.insert(arg_32_0.equippedStreaks, var_32_3)
			end

			table.insert(var_32_1, var_32_3)
		end
	end

	table.sort(var_32_1, function(arg_33_0, arg_33_1)
		return tonumber(arg_33_0.kills) < tonumber(arg_33_1.kills)
	end)
	table.sort(arg_32_0.equippedStreaks, function(arg_34_0, arg_34_1)
		return tonumber(arg_34_0.kills) < tonumber(arg_34_1.kills)
	end)
	arg_32_0.StreakEquippedStack:Update(arg_32_0.equippedStreaks)
	var_0_7(arg_32_0)
	arg_32_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/KILLSTREAKS"))

	arg_32_0.showKills = true

	arg_32_0.StreakGrid:SetRefreshChild(function(arg_35_0, arg_35_1, arg_35_2)
		var_0_17(arg_32_0, arg_32_1, arg_35_0, var_32_1[arg_32_0.StreakGrid:GetContentIndex(arg_35_1, arg_35_2) + 1], var_32_0)
	end)
	arg_32_0.StreakGrid:SetNumChildren(#var_32_1)
	arg_32_0.StreakGrid:RefreshContent()
	arg_32_0.StreakGrid:SetNotifyOnLayoutInit(true)
	arg_32_0.StreakGrid:addEventHandler("layout_initialized", function()
		var_0_6(arg_32_0, arg_32_1)
		var_0_12(arg_32_0)
	end)
	var_0_18(arg_32_0, arg_32_1, var_32_0)
	arg_32_0:addEventHandler("menu_close", function(arg_37_0, arg_37_1)
		for iter_37_0, iter_37_1 in ddlpairs(var_32_0) do
			iter_37_1.killstreak:set(arg_32_0.equippedStreaks[iter_37_0 + 1].ref)
		end

		ACTIONS.UploadStats(arg_32_0, arg_32_1)

		local var_37_0 = LUI.DataSourceInControllerModel.new("cg.players.selectedLoadout")

		if not Engine.DDJFBBJAIG() and var_37_0:GetValue(arg_32_1) then
			Engine.EBHIFJCGBH("class_edit", var_37_0:GetValue(arg_32_1))
		end
	end)
	arg_32_0:addEventHandler("menu_create", function(arg_38_0, arg_38_1)
		arg_32_0.selectedButtons = {}

		arg_38_0:dispatchEventToCurrentMenu({
			name = "update_buttons"
		})
		var_0_4(arg_32_0, arg_32_0.selectedButtons[1])
	end)

	if CONDITIONS.InGame(arg_32_0) then
		ACTIONS.ScaleFullscreen(arg_32_0.InGameMenuBackground)
		ACTIONS.ScaleFullscreen(arg_32_0.Background)
	elseif Engine.CGABICJHAI() then
		local function var_32_6()
			local var_39_0 = CoD.GetAspectRatioScaleAdjust(0.2)

			arg_32_0.FrontEndMenuBackground:SetScale(var_39_0)

			arg_32_0.scaleAdjust = var_39_0
		end

		ACTIONS.ScaleFullscreen(arg_32_0.Vignette)
		ACTIONS.ScaleFullscreen(arg_32_0.Background)
		ACTIONS.ScaleFullscreen(arg_32_0.BackgroundRight)
		ACTIONS.ScaleFullscreen(arg_32_0.FadeCover)
		arg_32_0:addAndCallEventHandler("onVideoChange", var_32_6)
		LAYOUT.AddAspectRatioFadeFrame(arg_32_0, arg_32_1, arg_32_0.FrontEndMenuBackground)
	end

	local function var_32_7(arg_40_0, arg_40_1)
		if CONDITIONS.ShowScorestreakValues() then
			local var_40_0 = ""

			if arg_40_0.showKills then
				var_40_0 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_SCORESTREAK_VALUES")
			else
				var_40_0 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_KILLSTREAK_VALUES")
			end

			arg_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_right_trigger",
				priority = 4,
				helper_text = var_40_0
			}, {
				replaceTop = true
			})
		end
	end

	arg_32_0:addAndCallEventHandler("update_input_type", var_32_7, {
		controllerIndex = arg_32_1
	})

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_32_0, "AR")
	end

	LUI.TextChat.SetupMenuForSingleLine(arg_32_0)

	if not IsLanguageArabic() then
		arg_32_0.NewItemNotification:SetupLeftAlignment()
	end

	if arg_32_0.BRWarningInfo then
		arg_32_0.BRWarningInfo:SetupWarning("LUA_MENU/BR_WARNING_KILLSTREAKS_DESC")
	end
end

function StreakSelect(arg_41_0, arg_41_1)
	local var_41_0 = LUI.UIElement.new()

	var_41_0.id = "StreakSelect"
	var_41_0._animationSets = var_41_0._animationSets or {}
	var_41_0._sequences = var_41_0._sequences or {}

	local var_41_1 = arg_41_1 and arg_41_1.controllerIndex

	if not var_41_1 and not Engine.DDJFBBJAIG() then
		var_41_1 = var_41_0:getRootController()
	end

	assert(var_41_1)

	var_41_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_41_1
	})
	var_41_0.HelperBar.id = "HelperBar"

	var_41_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_41_0.HelperBar:setPriority(10)
	var_41_0:addElement(var_41_0.HelperBar)

	local var_41_2 = var_41_0
	local var_41_3

	if CONDITIONS.InGame(var_41_0) then
		local var_41_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_41_1
		})

		var_41_4.id = "InGameMenuBackground"

		var_41_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_41_0:addElement(var_41_4)

		var_41_0.InGameMenuBackground = var_41_4
	end

	local var_41_5

	if CONDITIONS.InFrontend(var_41_0) then
		local var_41_6 = LUI.UIImage.new()

		var_41_6.id = "FrontEndMenuBackground"

		var_41_0:addElement(var_41_6)

		var_41_0.FrontEndMenuBackground = var_41_6
	end

	local var_41_7

	if Engine.DDJFBBJAIG() then
		local var_41_8 = LUI.UIImage.new()

		var_41_8.id = "FadeCover"

		var_41_8:SetRGBFromInt(0, 0)
		var_41_8:SetAlpha(0, 0)
		var_41_0:addElement(var_41_8)

		var_41_0.FadeCover = var_41_8
	end

	local var_41_9

	if Engine.DDJFBBJAIG() then
		local var_41_10 = LUI.UIImage.new()

		var_41_10.id = "Vignette"

		var_41_10:SetRGBFromInt(0, 0)
		var_41_10:SetAlpha(0.6, 0)
		var_41_10:setImage(RegisterMaterial("bkgd_vignette"), 0)
		var_41_10:SetBlendMode(BLEND_MODE.multiply)
		var_41_0:addElement(var_41_10)

		var_41_0.Vignette = var_41_10
	end

	local var_41_11

	if Engine.DDJFBBJAIG() then
		local var_41_12 = LUI.UIImage.new()

		var_41_12.id = "Showcase"

		var_41_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -446, _1080p * 446, _1080p * 22, _1080p * 914)
		var_41_0:addElement(var_41_12)

		var_41_0.Showcase = var_41_12
	end

	local var_41_13
	local var_41_14 = LUI.UIImage.new()

	var_41_14.id = "Background"

	var_41_14:SetRGBFromInt(0, 0)
	var_41_14:SetAlpha(0.6, 0)
	var_41_14:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_41_14:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1322, 0, 0)
	var_41_0:addElement(var_41_14)

	var_41_0.Background = var_41_14

	local var_41_15

	if Engine.DDJFBBJAIG() then
		local var_41_16 = LUI.UIImage.new()

		var_41_16.id = "BackgroundRight"

		var_41_16:SetRGBFromInt(0, 0)
		var_41_16:SetAlpha(0.4, 0)
		var_41_16:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
		var_41_16:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -598, 0, 0)
		var_41_0:addElement(var_41_16)

		var_41_0.BackgroundRight = var_41_16
	end

	local var_41_17
	local var_41_18 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_41_1
	})

	var_41_18.id = "MenuTitle"

	var_41_18.MenuTitle:setText(Engine.CBBHFCGDIC("CAS/STREAK_SELECT"), 0)
	var_41_18.Line:SetLeft(0, 0)
	var_41_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_41_0:addElement(var_41_18)

	var_41_0.MenuTitle = var_41_18

	local var_41_19
	local var_41_20 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 19,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_41_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("StreakButton", {
				controllerIndex = var_41_1
			})
		end,
		refreshChild = function(arg_43_0, arg_43_1, arg_43_2)
			return
		end,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 84,
		rowHeight = _1080p * 116,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_41_21 = LUI.UIGrid.new(var_41_20)

	var_41_21.id = "StreakGrid"

	var_41_21:setUseStencil(false)
	var_41_21:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 114, _1080p * -114, _1080p * -221, _1080p * -101)
	var_41_0:addElement(var_41_21)

	var_41_0.StreakGrid = var_41_21

	local var_41_22
	local var_41_23 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_41_1
	})

	var_41_23.id = "UnlockCriteria"

	var_41_23:SetAlpha(0, 0)
	var_41_23.UnlockDesc:SetRight(_1080p * 800, 0)
	var_41_23.UnlockDesc:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_41_23.UnlockDesc:setText("LOCKED", 0)
	var_41_23.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_41_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 456, _1080p * 700, _1080p * 730)
	var_41_0:addElement(var_41_23)

	var_41_0.UnlockCriteria = var_41_23

	local var_41_24
	local var_41_25 = LUI.UIText.new()

	var_41_25.id = "StreakName"

	var_41_25:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_41_25:setText("", 0)
	var_41_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_41_25:SetAlignment(LUI.Alignment.Left)
	var_41_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_41_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 1294, _1080p * 491, _1080p * 541)
	var_41_0:addElement(var_41_25)

	var_41_0.StreakName = var_41_25

	local var_41_26
	local var_41_27 = LUI.UIStyledText.new()

	var_41_27.id = "StreakDescription"

	var_41_27:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_41_27:setText("", 0)
	var_41_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_41_27:SetAlignment(LUI.Alignment.Left)
	var_41_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_41_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 886, _1080p * 545, _1080p * 565)
	var_41_0:addElement(var_41_27)

	var_41_0.StreakDescription = var_41_27

	local var_41_28
	local var_41_29 = MenuBuilder.BuildRegisteredType("StreakKillCategory", {
		controllerIndex = var_41_1
	})

	var_41_29.id = "StreakCategory"

	var_41_29:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_41_29.Text:setText("Dynamic Kill Categories...", 0)
	var_41_29:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 119, _1080p * 312, _1080p * -275, _1080p * -245)
	var_41_0:addElement(var_41_29)

	var_41_0.StreakCategory = var_41_29

	local var_41_30
	local var_41_31 = MenuBuilder.BuildRegisteredType("StreakEquippedStack", {
		controllerIndex = var_41_1
	})

	var_41_31.id = "StreakEquippedStack"

	var_41_31:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -267, _1080p * -81, _1080p * -575, _1080p * -275)
	var_41_0:addElement(var_41_31)

	var_41_0.StreakEquippedStack = var_41_31

	local var_41_32

	if Engine.DDJFBBJAIG() then
		var_41_32 = MenuBuilder.BuildRegisteredType("StreakCostWidget", {
			controllerIndex = var_41_1
		})
		var_41_32.id = "StreakCost"

		var_41_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 277, _1080p * 662, _1080p * 694)
		var_41_0:addElement(var_41_32)

		var_41_0.StreakCost = var_41_32
	end

	local var_41_33

	if CONDITIONS.InFrontendPublicMP(var_41_0) then
		local var_41_34 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_41_1
		})

		var_41_34.id = "MPPlayerDetails"

		var_41_34:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_41_0:addElement(var_41_34)

		var_41_0.MPPlayerDetails = var_41_34
	end

	local var_41_35
	local var_41_36 = MenuBuilder.BuildRegisteredType("SwapWidget", {
		controllerIndex = var_41_1
	})

	var_41_36.id = "SwapWidget"

	var_41_36:SetAlpha(0, 0)
	var_41_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 563, _1080p * 700, _1080p * 730)
	var_41_0:addElement(var_41_36)

	var_41_0.SwapWidget = var_41_36

	local var_41_37
	local var_41_38 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_41_1
	})

	var_41_38.id = "EquippedWidget"

	var_41_38:SetAlpha(0, 0)
	var_41_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 249, _1080p * 700, _1080p * 730)
	var_41_0:addElement(var_41_38)

	var_41_0.EquippedWidget = var_41_38

	local var_41_39

	if CONDITIONS.InFrontend(var_41_0) then
		local var_41_40 = MenuBuilder.BuildRegisteredType("MapsStreakAvailable", {
			controllerIndex = var_41_1
		})

		var_41_40.id = "MapsStreakAvailable"

		var_41_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1364, _1080p * 1824, _1080p * 128, _1080p * 200)
		var_41_0:addElement(var_41_40)

		var_41_0.MapsStreakAvailable = var_41_40
	end

	local var_41_41

	if CONDITIONS.InFrontend(var_41_0) then
		local var_41_42 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_41_1
		})

		var_41_42.id = "LobbyMembersFooter"

		var_41_42:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_41_0:addElement(var_41_42)

		var_41_0.LobbyMembersFooter = var_41_42
	end

	local var_41_43

	if CONDITIONS.InGame(var_41_0) then
		local var_41_44 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_41_1
		})

		var_41_44.id = "InGameMenuTimerStatus"

		var_41_44:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_41_0:addElement(var_41_44)

		var_41_0.InGameMenuTimerStatus = var_41_44
	end

	local var_41_45
	local var_41_46 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_41_1
	})

	var_41_46.id = "NewItemNotification"

	var_41_46:SetAlpha(0, 0)
	var_41_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 191, _1080p * 700, _1080p * 730)
	var_41_0:addElement(var_41_46)

	var_41_0.NewItemNotification = var_41_46

	local var_41_47
	local var_41_48 = MenuBuilder.BuildRegisteredType("CDLRestricted", {
		controllerIndex = var_41_1
	})

	var_41_48.id = "CDLRestriction"

	var_41_48:SetAlpha(0, 0)
	var_41_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, _1080p * 370, _1080p * 743, _1080p * 773)
	var_41_0:addElement(var_41_48)

	var_41_0.CDLRestriction = var_41_48

	local var_41_49

	if CONDITIONS.IsMagmaGameMode(var_41_0) then
		local var_41_50 = MenuBuilder.BuildRegisteredType("BRWarningInfo", {
			controllerIndex = var_41_1
		})

		var_41_50.id = "BRWarningInfo"

		var_41_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 739, _1080p * 455, _1080p * 485)
		var_41_0:addElement(var_41_50)

		var_41_0.BRWarningInfo = var_41_50
	end

	local function var_41_51()
		return
	end

	var_41_0._sequences.DefaultSequence = var_41_51

	local var_41_52
	local var_41_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_23:RegisterAnimationSequence("Locked", var_41_53)

	local function var_41_54()
		var_41_23:AnimateSequence("Locked")
	end

	var_41_0._sequences.Locked = var_41_54

	local var_41_55
	local var_41_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_23:RegisterAnimationSequence("Unlocked", var_41_56)

	local function var_41_57()
		var_41_23:AnimateSequence("Unlocked")
	end

	var_41_0._sequences.Unlocked = var_41_57

	local var_41_58
	local var_41_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 457
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 706
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 738
		}
	}

	var_41_23:RegisterAnimationSequence("FrontEnd", var_41_59)

	local var_41_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 486
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 536
		}
	}

	var_41_25:RegisterAnimationSequence("FrontEnd", var_41_60)

	local var_41_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 699
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		}
	}

	var_41_27:RegisterAnimationSequence("FrontEnd", var_41_61)

	local var_41_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 564
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 706
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 736
		}
	}

	var_41_36:RegisterAnimationSequence("FrontEnd", var_41_62)

	local var_41_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 706
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 736
		}
	}

	var_41_38:RegisterAnimationSequence("FrontEnd", var_41_63)

	local function var_41_64()
		var_41_23:AnimateSequence("FrontEnd")
		var_41_25:AnimateSequence("FrontEnd")
		var_41_27:AnimateSequence("FrontEnd")
		var_41_36:AnimateSequence("FrontEnd")
		var_41_38:AnimateSequence("FrontEnd")
	end

	var_41_0._sequences.FrontEnd = var_41_64

	local var_41_65
	local var_41_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 457
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 680
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 712
		}
	}

	var_41_23:RegisterAnimationSequence("InGame", var_41_66)

	local var_41_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 486
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 536
		}
	}

	var_41_25:RegisterAnimationSequence("InGame", var_41_67)

	local var_41_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 699
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		}
	}

	var_41_27:RegisterAnimationSequence("InGame", var_41_68)

	if Engine.DDJFBBJAIG() then
		local var_41_69 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 627
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 659
			}
		}

		var_41_32:RegisterAnimationSequence("InGame", var_41_69)
	end

	local var_41_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 564
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 680
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 710
		}
	}

	var_41_36:RegisterAnimationSequence("InGame", var_41_70)

	local var_41_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 680
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 710
		}
	}

	var_41_38:RegisterAnimationSequence("InGame", var_41_71)

	local function var_41_72()
		var_41_23:AnimateSequence("InGame")
		var_41_25:AnimateSequence("InGame")
		var_41_27:AnimateSequence("InGame")

		if Engine.DDJFBBJAIG() then
			var_41_32:AnimateSequence("InGame")
		end

		var_41_36:AnimateSequence("InGame")
		var_41_38:AnimateSequence("InGame")
	end

	var_41_0._sequences.InGame = var_41_72

	local var_41_73
	local var_41_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 390
		}
	}

	var_41_23:RegisterAnimationSequence("AR", var_41_74)

	local var_41_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 734
		}
	}

	var_41_25:RegisterAnimationSequence("AR", var_41_75)

	local var_41_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 734
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 558
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_41_27:RegisterAnimationSequence("AR", var_41_76)

	local function var_41_77()
		var_41_23:AnimateSequence("AR")
		var_41_25:AnimateSequence("AR")
		var_41_27:AnimateSequence("AR")
	end

	var_41_0._sequences.AR = var_41_77

	local var_41_78
	local var_41_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 737
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 767
		}
	}

	var_41_46:RegisterAnimationSequence("IsNewAndSwap", var_41_79)

	local function var_41_80()
		var_41_46:AnimateSequence("IsNewAndSwap")
	end

	var_41_0._sequences.IsNewAndSwap = var_41_80

	local var_41_81
	local var_41_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 700
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 730
		}
	}

	var_41_46:RegisterAnimationSequence("IsNew", var_41_82)

	local function var_41_83()
		var_41_46:AnimateSequence("IsNew")
	end

	var_41_0._sequences.IsNew = var_41_83

	local var_41_84
	local var_41_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 743
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 773
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 366
		}
	}

	var_41_48:RegisterAnimationSequence("CDLEquipped", var_41_85)

	local function var_41_86()
		var_41_48:AnimateSequence("CDLEquipped")
	end

	var_41_0._sequences.CDLEquipped = var_41_86

	local var_41_87
	local var_41_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 700
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 730
		}
	}

	var_41_48:RegisterAnimationSequence("CDLUnequipped", var_41_88)

	local function var_41_89()
		var_41_48:AnimateSequence("CDLUnequipped")
	end

	var_41_0._sequences.CDLUnequipped = var_41_89

	local var_41_90
	local var_41_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_48:RegisterAnimationSequence("CDLRestricted", var_41_91)

	local function var_41_92()
		var_41_48:AnimateSequence("CDLRestricted")
	end

	var_41_0._sequences.CDLRestricted = var_41_92

	local var_41_93
	local var_41_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_48:RegisterAnimationSequence("CDLUnrestricted", var_41_94)

	local function var_41_95()
		var_41_48:AnimateSequence("CDLUnrestricted")
	end

	var_41_0._sequences.CDLUnrestricted = var_41_95

	var_41_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_41_96 = LUI.UIBindButton.new()

	var_41_96.id = "selfBindButton"

	var_41_0:addElement(var_41_96)

	var_41_0.bindButton = var_41_96

	var_41_0.bindButton:addEventHandler("button_secondary", function(arg_56_0, arg_56_1)
		if not arg_56_1.controller then
			local var_56_0 = var_41_1
		end

		ACTIONS.LeaveMenu(var_41_0)
	end)
	var_0_19(var_41_0, var_41_1, arg_41_1)

	return var_41_0
end

MenuBuilder.registerType("StreakSelect", StreakSelect)
LockTable(_M)
