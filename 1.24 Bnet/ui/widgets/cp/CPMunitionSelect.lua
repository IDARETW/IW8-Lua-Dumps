module(..., package.seeall)

local var_0_0 = 150
local var_0_1 = var_0_0 + 50

local function var_0_2(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {
		displayTime = 2000,
		icon = arg_1_2,
		header = Engine.CBBHFCGDIC("LUA_MENU/MUNITION_EQUIPPED"),
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

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and arg_2_1._gridContentColumnIndex or 0
	local var_2_1 = arg_2_0.Grid:GetPositionForIndex(var_2_0)

	arg_2_0.Grid:SetFocusedPosition(var_2_1, true, false)
end

local function var_0_4(arg_3_0)
	if CONDITIONS.IsWaveGameType() then
		return tonumber(arg_3_0.survivalCost)
	else
		return tonumber(arg_3_0.scoreCost)
	end
end

local function var_0_5(arg_4_0)
	local var_4_0 = var_0_4(arg_4_0)

	if var_4_0 == 0 then
		return Engine.CBBHFCGDIC("LUA_MENU/COST_FREE")
	end

	if CONDITIONS.IsWaveGameType() then
		return Engine.CBBHFCGDIC("COOP_GAME_PLAY/CURRENCY", var_4_0)
	else
		return Engine.CBBHFCGDIC("LUA_MENU/MUNITION_CURRENCY", var_4_0)
	end
end

local function var_0_6(arg_5_0, arg_5_1)
	if arg_5_0.categories then
		for iter_5_0, iter_5_1 in pairs(arg_5_0.categories) do
			arg_5_0:RemoveElement(iter_5_1)

			arg_5_0.categories[iter_5_0] = nil
		end
	end

	arg_5_0.categories = {}

	local var_5_0
	local var_5_1
	local var_5_2
	local var_5_3 = arg_5_0.Category:GetCurrentAnchorsAndPositions()

	local function var_5_4(arg_6_0)
		assert(var_5_1.data)

		local var_6_0 = var_0_4(var_5_1.data)
		local var_6_1 = var_5_1:GetCurrentAnchorsAndPositions()
		local var_6_2 = arg_6_0.Grid:GetCurrentAnchorsAndPositions()
		local var_6_3, var_6_4, var_6_5, var_6_6 = var_5_1:getCurrentGlobalRect()
		local var_6_7 = MenuBuilder.BuildRegisteredType("StreakKillCategory", {
			controllerIndex = arg_5_1
		})

		var_6_7.id = "Category_" .. var_6_0
		var_6_7.data = var_6_0

		var_6_7.Text:setText(var_0_5(var_5_1.data))
		var_6_7:SetAnchorsAndPosition(var_5_3.leftAnchor, var_5_3.rightAnchor, var_5_3.topAnchor, var_5_3.bottomAnchor, var_6_1.left + var_6_2.left, var_6_5, var_5_3.top, var_5_3.bottom)
		arg_6_0:addElement(var_6_7)

		arg_6_0.categories[var_5_0] = var_6_7
	end

	local function var_5_5(arg_7_0)
		assert(var_5_2)

		local var_7_0 = var_5_2:GetCurrentAnchorsAndPositions()
		local var_7_1 = arg_7_0.Grid:GetCurrentAnchorsAndPositions()
		local var_7_2 = 2 * _1080p

		arg_7_0.categories[var_5_0]:SetRight(var_7_0.right + var_7_1.left + var_7_2)
	end

	local var_5_6 = arg_5_0.Grid:GetBuiltChildren()

	for iter_5_2, iter_5_3 in ipairs(var_5_6) do
		if iter_5_3.data then
			if var_5_0 == nil then
				var_5_0 = var_0_4(iter_5_3.data)
				var_5_1 = iter_5_3

				var_5_4(arg_5_0)
			else
				local var_5_7 = var_0_4(iter_5_3.data)

				if var_5_7 ~= var_5_0 then
					var_5_2 = var_5_6[iter_5_2 - 1]

					var_5_5(arg_5_0)

					var_5_0 = var_5_7
					var_5_1 = iter_5_3

					var_5_4(arg_5_0)
				end
			end
		else
			var_5_2 = var_5_6[iter_5_2 - 1]

			var_5_5(arg_5_0)

			break
		end
	end

	arg_5_0.Category:SetAlpha(0)
end

local function var_0_7(arg_8_0)
	local var_8_0 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.equippedMunitions) do
		if iter_8_1.isActive and iter_8_1.ref ~= "empty1" and iter_8_1.ref ~= "empty2" and iter_8_1.ref ~= "empty3" and iter_8_1.ref ~= "none" then
			var_8_0 = var_8_0 + 1
		end
	end

	arg_8_0.EquippedStack.StreakEquippedSlots.EquippedNum:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_8_0, #arg_8_0.equippedMunitions))
end

local function var_0_8(arg_9_0, arg_9_1)
	local var_9_0 = ""
	local var_9_1 = Engine.CBBHFCGDIC("MENU/BACK")
	local var_9_2 = ""
	local var_9_3 = ""

	if arg_9_0.buttonOver.data.isUnlocked then
		var_9_0 = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	end

	arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = var_9_1
	}, {
		replaceTop = true
	})
	arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = var_9_0
	}, {
		replaceTop = true
	})

	if Engine.DDJFBBJAIG() then
		arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_RESET")
		}, {
			replaceTop = true
		})
	end

	arg_9_0.EquippedStack:ShowKills(arg_9_0.showKills)

	if not Engine.DDJFBBJAIG() and not CONDITIONS.IsThirdGameMode() then
		arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 2,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_9_0.bindButton:addEventHandler("button_start", function(arg_10_0, arg_10_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_9_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_9_0)
	end
end

local function var_0_9(arg_11_0)
	if CONDITIONS.IsWaveGameType() then
		arg_11_0.MunitionCost:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/CURRENCY", arg_11_0.buttonOver.data.survivalCost))
	else
		arg_11_0.MunitionCost:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_COST", arg_11_0.buttonOver.data.scoreCost))
	end
end

local function var_0_10(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.CPDataSource.coopCareerStats.currency:GetValue(arg_12_1)

	PlayerData.BFFBGAJGD(arg_12_1, CoD.StatsGroup.Coop).coopCareerStats.currency:set(var_12_0 + arg_12_2)
end

local function var_0_11(arg_13_0, arg_13_1, arg_13_2)
	if CONDITIONS.IsWaveGameType() then
		CP.CurrencySubtract(arg_13_1, arg_13_2)
		Engine.BJDBIAGIDA("ui_select_purchase_confirm")
	else
		local var_13_0 = arg_13_0.CPDataSource.coopCareerStats.currency:GetValue(arg_13_1)

		PlayerData.BFFBGAJGD(arg_13_1, CoD.StatsGroup.Coop).coopCareerStats.currency:set(var_13_0 - arg_13_2)
	end
end

local function var_0_12(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.CPDataSource.coopCareerStats.currency:GetValue(arg_14_1)

	if CONDITIONS.IsWaveGameType() then
		var_14_0 = CP.CurrencyGet(arg_14_1)
	end

	return var_14_0
end

local function var_0_13(arg_15_0)
	assert(arg_15_0.buttonOver)

	local var_15_0 = var_0_4(arg_15_0.buttonOver.data)

	if arg_15_0.activeCategory == var_15_0 or not arg_15_0.categories then
		return
	end

	if arg_15_0.activeCategory then
		ACTIONS.AnimateSequence(arg_15_0.categories[arg_15_0.activeCategory], "HighlightOff")
	end

	arg_15_0.activeCategory = var_15_0

	if arg_15_0.activeCategory then
		ACTIONS.AnimateSequence(arg_15_0.categories[arg_15_0.activeCategory], "HighlightOn")
	end
end

local function var_0_14(arg_16_0, arg_16_1)
	if arg_16_1 then
		arg_16_0.EquippedWidget:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_16_0.EquippedWidget, "TurnOn")
	else
		arg_16_0.EquippedWidget:SetAlpha(0)
	end
end

local function var_0_15(arg_17_0, arg_17_1)
	local var_17_0 = PlayerData.BFFBGAJGD(arg_17_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups

	if CONDITIONS.IsWaveGameType() then
		var_17_0 = PlayerData.BFFBGAJGD(arg_17_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups
	end

	for iter_17_0, iter_17_1 in ddlpairs(var_17_0) do
		iter_17_1.munition:set(arg_17_0.equippedMunitions[iter_17_0 + 1].ref)
	end

	ACTIONS.UploadStats(arg_17_0, arg_17_1)

	if CONDITIONS.IsWaveGameType() then
		local var_17_1 = CP.ScriptCurrencyGet(arg_17_1) - CP.CurrencyGet(arg_17_1)

		Engine.EBHIFJCGBH("munitions_updated", var_17_1)
	elseif not Engine.DDJFBBJAIG() then
		Engine.EBHIFJCGBH("munitions_updated", 1)
	end
end

local function var_0_16(arg_18_0, arg_18_1)
	arg_18_0.selectedButtons = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.equippedMunitions) do
		iter_18_1.isActive = false
	end

	arg_18_0.buttonOver:dispatchEventToCurrentMenu({
		name = "update_buttons"
	})
	var_0_7(arg_18_0)
	var_0_14(arg_18_0, false)
	var_0_8(arg_18_0, arg_18_1)
	arg_18_0.EquippedStack:ClearMunitions(arg_18_0.equippedMunitions, arg_18_1)

	for iter_18_2 = 0, StringTable.BFHCAIIDA(CSV.munitions.file) - 1 do
		local var_18_0 = CSV.ReadRow(CSV.munitions, iter_18_2)

		if var_18_0.ref == "empty1" then
			arg_18_0.equippedMunitions[1] = var_18_0
		elseif var_18_0.ref == "empty2" then
			arg_18_0.equippedMunitions[2] = var_18_0
		elseif var_18_0.ref == "empty3" then
			arg_18_0.equippedMunitions[3] = var_18_0
		end
	end

	var_0_15(arg_18_0, arg_18_1)
end

local function var_0_17(arg_19_0, arg_19_1)
	local var_19_0

	if arg_19_1.data.backGroundImage ~= "specialty_ks_null" and arg_19_1.data.backGroundImage ~= "" then
		var_19_0 = arg_19_1.data.backGroundImage

		arg_19_0.Showcase:SetAlpha(0)
	else
		var_19_0 = "frontend_streak_uav"

		arg_19_0.Showcase:SetAlpha(1)
	end

	assert(arg_19_0.FadeCover)

	local var_19_1 = arg_19_0._munitionSelectionComplete and var_0_0 or 10

	if not arg_19_0._prevImage then
		var_19_1 = 0
	end

	arg_19_0.FadeCover:SetAlpha(1, var_19_1, LUI.EASING.inQuadratic)

	arg_19_0.FadeCover:Wait(var_0_0, true).onComplete = function()
		if arg_19_0._munitionSelectionComplete then
			assert(arg_19_0.FrontEndMenuBackground)
			arg_19_0.FrontEndMenuBackground:setImage(RegisterMaterial(var_19_0))
			arg_19_0.FrontEndMenuBackground:SetScale(arg_19_0.scaleAdjust, 0)
			arg_19_0.FrontEndMenuBackground:SetScale(arg_19_0.scaleAdjust + 0.015, 2500, LUI.EASING.outQuadratic)
			arg_19_0.FadeCover:SetAlpha(0, var_0_1, LUI.EASING.outQuadratic)

			arg_19_0._prevImage = var_19_0
		end
	end
end

local function var_0_18(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = arg_21_0.equippedMunitions[arg_21_2]
	local var_21_1 = PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups

	if CONDITIONS.IsWaveGameType() then
		local var_21_2 = PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups
	end

	if var_21_0.ref ~= "empty3" and var_21_0.ref ~= "empty2" and var_21_0.ref ~= "empty1" then
		local var_21_3 = tonumber(arg_21_0.equippedMunitions[arg_21_2].scoreCost)

		var_0_10(arg_21_0, arg_21_1, var_21_3)
	end

	arg_21_0.equippedMunitions[arg_21_2] = arg_21_3
	arg_21_0.equippedMunitions[arg_21_2].isActive = true

	var_0_11(arg_21_0, arg_21_1, arg_21_3.scoreCost)

	if CONDITIONS.IsWaveGameType() then
		if CP.CurrencyGet(arg_21_1) >= tonumber(arg_21_3.scoreCost) then
			ACTIONS.AnimateSequence(arg_21_0.PurchaseWidget, "CanBuy")
		else
			ACTIONS.AnimateSequence(arg_21_0.PurchaseWidget, "NoBuy")
		end
	end

	var_0_15(arg_21_0, arg_21_1)
end

local function var_0_19(arg_22_0, arg_22_1, arg_22_2)
	assert(arg_22_1)
	assert(arg_22_1.data)

	local var_22_0 = var_0_12(arg_22_0, arg_22_2)
	local var_22_1 = var_0_4(arg_22_1.data)

	if arg_22_1._isAvailable then
		local var_22_2 = true

		if arg_22_1.data.isUnlocked then
			if CONDITIONS.IsWaveGameType() and var_22_0 < var_22_1 then
				var_22_2 = false
			else
				for iter_22_0 = 1, #arg_22_0.equippedMunitions do
					local var_22_3 = var_0_4(arg_22_0.equippedMunitions[iter_22_0])

					if var_22_0 < var_22_1 and var_22_0 < var_22_1 - var_22_3 then
						var_22_2 = false

						break
					end
				end
			end
		else
			var_22_2 = false
		end

		arg_22_1._isAvailable = var_22_2

		arg_22_1:FakeDisabled(false)
	end
end

local function var_0_20(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	arg_23_2:Setup(arg_23_3)
	var_0_19(arg_23_0, arg_23_2, arg_23_1)

	local function var_23_0(arg_24_0, arg_24_1)
		arg_23_0.buttonOver = arg_24_0

		arg_23_0.MunitionName:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_24_0.data.name)))
		arg_23_0.MunitionDescription:setText(Engine.CBBHFCGDIC(arg_24_0.data.desc))

		if Engine.DDJFBBJAIG() then
			var_0_17(arg_23_0, arg_24_0)
		end

		var_0_9(arg_23_0)

		if arg_24_0.data.isUnlocked then
			ACTIONS.AnimateSequence(arg_23_0, "Unlocked")
		else
			ACTIONS.AnimateSequence(arg_23_0, "Locked")
			arg_23_0.UnlockCriteria.UnlockDesc:setText(arg_24_0.data.unlockCriteria)
		end

		local var_24_0 = arg_24_1.controller or arg_23_1

		if arg_23_0.categories then
			var_0_13(arg_23_0)
		end

		var_0_8(arg_23_0, var_24_0)

		if arg_24_0:IsDisabled() then
			arg_23_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_primary"
			})
		end

		var_0_14(arg_23_0, arg_24_0.selected)

		if Engine.DDJFBBJAIG() then
			arg_23_0._munitionSelectionComplete = false
			arg_23_0:Wait(var_0_0 - 10, true).onComplete = function()
				arg_23_0._munitionSelectionComplete = true
			end
		end

		if CONDITIONS.IsWaveGameType() then
			local var_24_1 = tonumber(arg_24_0.data.survivalCost)
			local var_24_2 = CP.CurrencyGet(arg_23_1)

			arg_23_0.PurchaseWidget.CostValue:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/COST_SURVIVAL", tostring(var_24_1)))

			if var_24_1 <= var_24_2 then
				ACTIONS.AnimateSequence(arg_23_0.PurchaseWidget, "CanBuy")
			else
				ACTIONS.AnimateSequence(arg_23_0.PurchaseWidget, "NoBuy")
			end
		end
	end

	arg_23_2:addEventHandler("button_over", var_23_0)
	arg_23_2:addEventHandler("button_over_disable", var_23_0)
	arg_23_2:registerEventHandler("update_buttons", function(arg_26_0, arg_26_1)
		local var_26_0 = arg_26_0.data.ref

		for iter_26_0, iter_26_1 in ipairs(arg_23_0.equippedMunitions) do
			var_0_19(arg_23_0, arg_26_0, arg_23_1)

			if var_26_0 == iter_26_1.ref and iter_26_1.isActive then
				arg_26_0:SetSelected(true)

				arg_23_0.selectedButtons[iter_26_0] = arg_26_0

				arg_26_0:ToggleDisabled()

				break
			else
				arg_26_0:SetSelected(false)
			end
		end
	end)
	arg_23_2:registerEventHandler("button_action", function(arg_27_0, arg_27_1)
		local function var_27_0()
			arg_27_0:dispatchEventToCurrentMenu({
				name = "update_buttons"
			})
			var_0_14(arg_23_0, arg_27_0.selected)
			arg_23_0.EquippedStack:Update(arg_23_0.equippedMunitions)
			var_0_8(arg_23_0, arg_27_1.controller)
			var_0_7(arg_23_0)
		end

		if arg_27_0.data.isUnlocked then
			arg_23_0.selectedButtons = {}

			local var_27_1 = true

			for iter_27_0 = 1, #arg_23_0.equippedMunitions do
				local var_27_2 = arg_23_0.equippedMunitions[iter_27_0]

				if var_27_2.ref == "empty3" or var_27_2.ref == "empty2" or var_27_2.ref == "empty1" then
					if var_0_12(arg_23_0, arg_27_1.controller) >= tonumber(arg_27_0.data.scoreCost) then
						var_0_18(arg_23_0, arg_27_1.controller, iter_27_0, arg_27_0.data)
						var_0_2(arg_23_0, arg_27_1.controller, arg_27_0.data.icon, arg_27_0.data.name)

						var_27_1 = false

						break
					end

					var_27_1 = false
				elseif not CONDITIONS.IsWaveGameType() then
					var_27_1 = true
				end
			end

			if var_27_1 then
				if not Engine.DDJFBBJAIG() then
					return
				end

				local var_27_3 = {
					streaks = arg_23_0.equippedMunitions,
					selection = arg_27_0.data,
					showKills = arg_23_0.showKills,
					onReplace = function(arg_29_0, arg_29_1)
						if var_0_12(arg_23_0, arg_27_0._scoped.controllerIndex) + tonumber(arg_23_0.equippedMunitions[arg_29_1 + 1].scoreCost) - tonumber(arg_27_0.data.scoreCost) >= 0 then
							var_0_18(arg_23_0, arg_27_1.controller, arg_29_1 + 1, arg_27_0.data)

							if not CONDITIONS.IsWaveGameType() then
								PlayerData.BFFBGAJGD(arg_23_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[arg_29_1].munition:set(arg_27_0.data.ref)
							else
								PlayerData.BFFBGAJGD(arg_23_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups[arg_29_1].munition:set(arg_27_0.data.ref)
							end

							var_27_0()
							var_0_2(arg_23_0, arg_27_1.controller, arg_27_0.data.icon, arg_27_0.data.name)
						end
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "CPMunitionReplacePopup", true, arg_27_1.controller, false, var_27_3, nil, true, false)
			end

			var_27_0()
		end
	end)
end

local function var_0_21(arg_30_0, arg_30_1)
	if Engine.DDJFBBJAIG() then
		arg_30_0.bindButton:registerEventHandler("button_alt1", function(arg_31_0, arg_31_1)
			if arg_31_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end

			var_0_16(arg_30_0, arg_31_1.controller)
		end)
	end
end

local function var_0_22(arg_32_0, arg_32_1, arg_32_2)
	assert(arg_32_0.Grid)
	assert(arg_32_0.MunitionName)
	assert(arg_32_0.MunitionDescription)
	assert(arg_32_0.HelperBar)
	assert(arg_32_0.UnlockCriteria)

	arg_32_0._munitionSelectionComplete = true
	arg_32_0._prevImage = nil
	arg_32_0.scaleAdjust = 0

	arg_32_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	local var_32_0 = PlayerData.BFFBGAJGD(arg_32_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups

	if CONDITIONS.IsWaveGameType() then
		var_32_0 = PlayerData.BFFBGAJGD(arg_32_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups
	end

	local var_32_1 = {}

	arg_32_0.CPDataSource = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Coop, CoD.PlayMode.Aliens)
	arg_32_0.equippedMunitions = {}

	local var_32_2 = {}

	for iter_32_0, iter_32_1 in ddlpairs(var_32_0) do
		var_32_2[iter_32_1.munition:get()] = true
	end

	local var_32_3 = var_32_0[0].munition:get()
	local var_32_4 = var_32_0[1].munition:get()
	local var_32_5 = var_32_0[2].munition:get()

	for iter_32_2 = 0, StringTable.BFHCAIIDA(CSV.munitions.file) - 1 do
		local var_32_6 = CSV.ReadRow(CSV.munitions, iter_32_2)

		if var_32_6.showInMenus == "1" then
			local var_32_7 = var_32_6.lootID

			if var_32_7 and #var_32_7 > 0 then
				local var_32_8 = tonumber(var_32_7)

				var_32_6.isNew = Loot.HDJCADADF(arg_32_1, var_32_8)
				var_32_6.lootType = LOOT.GetTypeForID(var_32_8)
				var_32_6.lootRef = LOOT.GetItemRef(var_32_6.lootType, var_32_8)
				var_32_6.isUnlocked = PROGRESSION.IsUnlocked(arg_32_1, var_32_6.lootType, var_32_6.lootRef)

				if not var_32_6.isUnlocked then
					var_32_6.unlockCriteria = PROGRESSION.GetUnlockText(arg_32_1, var_32_6.lootType, var_32_6.lootRef)
				end
			else
				var_32_6.isUnlocked = true
			end

			if CONDITIONS.IsWaveGameType() then
				var_32_6.scoreCost = var_32_6.survivalCost

				if var_32_6.ref == "respawn" then
					var_32_6.desc = "COOP_CRAFTING/RESPAWN_SURVIVAL_DESC"
				end
			end

			table.insert(var_32_1, var_32_6)
		end

		if var_32_2[var_32_6.ref] then
			var_32_6.isActive = true

			if var_32_6.ref == var_32_3 then
				arg_32_0.equippedMunitions[1] = var_32_6
			end

			if var_32_6.ref == var_32_4 then
				arg_32_0.equippedMunitions[2] = var_32_6
			end

			if var_32_6.ref == var_32_5 then
				arg_32_0.equippedMunitions[3] = var_32_6
			end
		end
	end

	table.sort(var_32_1, function(arg_33_0, arg_33_1)
		return tonumber(var_0_4(arg_33_0)) < tonumber(var_0_4(arg_33_1))
	end)
	arg_32_0.EquippedStack:Update(arg_32_0.equippedMunitions)
	var_0_7(arg_32_0)
	arg_32_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_TITLE"))

	arg_32_0.showKills = false

	arg_32_0.Grid:SetRefreshChild(function(arg_34_0, arg_34_1, arg_34_2)
		var_0_20(arg_32_0, arg_32_1, arg_34_0, var_32_1[arg_32_0.Grid:GetContentIndex(arg_34_1, arg_34_2) + 1])
	end)
	arg_32_0.Grid:SetNumChildren(#var_32_1)
	arg_32_0.Grid:RefreshContent()
	arg_32_0.Grid:SetNotifyOnLayoutInit(true)
	arg_32_0.Grid:addEventHandler("layout_initialized", function()
		var_0_6(arg_32_0, arg_32_1)
		var_0_13(arg_32_0)
	end)
	var_0_21(arg_32_0, arg_32_1)

	if CONDITIONS.IsWaveGameType() then
		arg_32_0:registerOmnvarHandler("cp_open_cac", function(arg_36_0, arg_36_1)
			if arg_36_1.value == -2 then
				arg_36_0:processEvent({
					name = "menu_close"
				})
				LUI.FlowManager.RequestCloseAllMenus()
			end
		end)
	end

	arg_32_0:addEventHandler("menu_create", function(arg_37_0, arg_37_1)
		arg_32_0.selectedButtons = {}

		arg_37_0:dispatchEventToCurrentMenu({
			name = "update_buttons"
		})
		var_0_3(arg_32_0, arg_32_0.selectedButtons[1])
	end)

	if CONDITIONS.InGame(arg_32_0) then
		if Engine.CGABICJHAI() then
			ACTIONS.ScaleFullscreen(arg_32_0.InGameMenuBackground)
			ACTIONS.ScaleFullscreen(arg_32_0.Background)
			ACTIONS.ScaleFullscreen(arg_32_0.BackgroundRight)
		end
	elseif Engine.CGABICJHAI() then
		local function var_32_9()
			local var_38_0 = CoD.GetAspectRatioScaleAdjust(0.2)

			arg_32_0.FrontEndMenuBackground:SetScale(var_38_0)

			arg_32_0.scaleAdjust = var_38_0
		end

		ACTIONS.ScaleFullscreen(arg_32_0.Background)
		ACTIONS.ScaleFullscreen(arg_32_0.BackgroundRight)
		ACTIONS.ScaleFullscreen(arg_32_0.FadeCover)
		arg_32_0:addAndCallEventHandler("onVideoChange", var_32_9)
		LAYOUT.AddAspectRatioFadeFrame(arg_32_0, arg_32_1, arg_32_0.FrontEndMenuBackground)
	end

	LUI.TextChat.SetupMenuForSingleLine(arg_32_0)

	if not CONDITIONS.IsWaveGameType() then
		local function var_32_10()
			local var_39_0 = arg_32_0.CPDataSource.coopCareerStats.currency:GetValue(arg_32_1)

			arg_32_0.PlayerCurrency:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_CURRENCY", tostring(var_39_0)))
		end

		local var_32_11 = arg_32_0.CPDataSource.coopCareerStats.currency

		arg_32_0:SubscribeToModel(var_32_11:GetModel(arg_32_1), var_32_10)
	end

	if not IsLanguageArabic() then
		arg_32_0.NewItemNotification:SetupLeftAlignment()
	end

	if CONDITIONS.IsWaveGameType() then
		ACTIONS.AnimateSequence(arg_32_0, "WaveMode")
	end

	if Engine.DDJFBBJAIG() and not Onboarding.CPMunitions.WasCompleted(arg_32_0, arg_32_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "onboardingpopup", true, arg_32_1, false, ONBOARDING_DATA.GetOnboardingMunitionData())
		Onboarding.CPMunitions.MarkCompleted(arg_32_0, arg_32_1)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_32_0, "AR")
	end
end

function CPMunitionSelect(arg_40_0, arg_40_1)
	local var_40_0 = LUI.UIElement.new()

	var_40_0.id = "CPMunitionSelect"
	var_40_0._animationSets = var_40_0._animationSets or {}
	var_40_0._sequences = var_40_0._sequences or {}

	local var_40_1 = arg_40_1 and arg_40_1.controllerIndex

	if not var_40_1 and not Engine.DDJFBBJAIG() then
		var_40_1 = var_40_0:getRootController()
	end

	assert(var_40_1)

	var_40_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_40_1
	})
	var_40_0.HelperBar.id = "HelperBar"

	var_40_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_40_0.HelperBar:setPriority(10)
	var_40_0:addElement(var_40_0.HelperBar)

	local var_40_2 = var_40_0
	local var_40_3

	if CONDITIONS.InGame(var_40_0) then
		local var_40_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_40_1
		})

		var_40_4.id = "InGameMenuBackground"

		var_40_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_40_0:addElement(var_40_4)

		var_40_0.InGameMenuBackground = var_40_4
	end

	local var_40_5

	if CONDITIONS.InFrontend(var_40_0) then
		local var_40_6 = LUI.UIImage.new()

		var_40_6.id = "FrontEndMenuBackground"

		var_40_0:addElement(var_40_6)

		var_40_0.FrontEndMenuBackground = var_40_6
	end

	local var_40_7

	if Engine.DDJFBBJAIG() then
		local var_40_8 = LUI.UIImage.new()

		var_40_8.id = "FadeCover"

		var_40_8:SetRGBFromInt(0, 0)
		var_40_8:SetAlpha(0, 0)
		var_40_0:addElement(var_40_8)

		var_40_0.FadeCover = var_40_8
	end

	local var_40_9

	if Engine.DDJFBBJAIG() then
		local var_40_10 = LUI.UIImage.new()

		var_40_10.id = "Showcase"

		var_40_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -446, _1080p * 446, _1080p * 22, _1080p * 914)
		var_40_0:addElement(var_40_10)

		var_40_0.Showcase = var_40_10
	end

	local var_40_11
	local var_40_12 = LUI.UIImage.new()

	var_40_12.id = "Background"

	var_40_12:SetRGBFromInt(0, 0)
	var_40_12:SetAlpha(0.6, 0)
	var_40_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_40_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1322, 0, 0)
	var_40_0:addElement(var_40_12)

	var_40_0.Background = var_40_12

	local var_40_13
	local var_40_14 = LUI.UIImage.new()

	var_40_14.id = "BackgroundRight"

	var_40_14:SetRGBFromInt(0, 0)
	var_40_14:SetAlpha(0.6, 0)
	var_40_14:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_40_14:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -598, 0, 0)
	var_40_0:addElement(var_40_14)

	var_40_0.BackgroundRight = var_40_14

	local var_40_15
	local var_40_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_40_1
	})

	var_40_16.id = "MenuTitle"

	var_40_16.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_TITLE"), 0)
	var_40_16.Line:SetLeft(0, 0)
	var_40_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_40_0:addElement(var_40_16)

	var_40_0.MenuTitle = var_40_16

	local var_40_17
	local var_40_18 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_40_1
	})

	var_40_18.id = "UnlockCriteria"

	var_40_18:SetAlpha(0, 0)
	var_40_18.UnlockDesc:SetRight(_1080p * 800, 0)
	var_40_18.UnlockDesc:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_40_18.UnlockDesc:setText("LOCKED", 0)
	var_40_18.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_40_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 456, _1080p * 700, _1080p * 730)
	var_40_0:addElement(var_40_18)

	var_40_0.UnlockCriteria = var_40_18

	local var_40_19
	local var_40_20 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 17,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_40_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("StreakButton", {
				controllerIndex = var_40_1
			})
		end,
		refreshChild = function(arg_42_0, arg_42_1, arg_42_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 84,
		rowHeight = _1080p * 116,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_40_21 = LUI.UIGrid.new(var_40_20)

	var_40_21.id = "Grid"

	var_40_21:setUseStencil(false)
	var_40_21:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 167, _1080p * -33, _1080p * -221, _1080p * -58)
	var_40_0:addElement(var_40_21)

	var_40_0.Grid = var_40_21

	local var_40_22
	local var_40_23 = LUI.UIText.new()

	var_40_23.id = "MunitionName"

	var_40_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_40_23:setText("", 0)
	var_40_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_40_23:SetAlignment(LUI.Alignment.Left)
	var_40_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_40_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 1294, _1080p * 491, _1080p * 541)
	var_40_0:addElement(var_40_23)

	var_40_0.MunitionName = var_40_23

	local var_40_24
	local var_40_25 = LUI.UIStyledText.new()

	var_40_25.id = "MunitionDescription"

	var_40_25:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_40_25:setText("", 0)
	var_40_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_40_25:SetAlignment(LUI.Alignment.Left)
	var_40_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_40_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 600, _1080p * 545, _1080p * 565)
	var_40_0:addElement(var_40_25)

	var_40_0.MunitionDescription = var_40_25

	local var_40_26
	local var_40_27 = MenuBuilder.BuildRegisteredType("StreakEquippedStack", {
		controllerIndex = var_40_1
	})

	var_40_27.id = "EquippedStack"

	var_40_27:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -267, _1080p * -81, _1080p * -575, _1080p * -275)
	var_40_0:addElement(var_40_27)

	var_40_0.EquippedStack = var_40_27

	local var_40_28

	if CONDITIONS.InFrontendPublicMP(var_40_0) then
		local var_40_29 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_40_1
		})

		var_40_29.id = "MPPlayerDetails"

		var_40_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_40_0:addElement(var_40_29)

		var_40_0.MPPlayerDetails = var_40_29
	end

	local var_40_30
	local var_40_31 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_40_1
	})

	var_40_31.id = "EquippedWidget"

	var_40_31:SetAlpha(0, 0)
	var_40_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 249, _1080p * 700, _1080p * 730)
	var_40_0:addElement(var_40_31)

	var_40_0.EquippedWidget = var_40_31

	local var_40_32

	if not CONDITIONS.IsWaveGameType(var_40_0) then
		var_40_32 = LUI.UIText.new()
		var_40_32.id = "PlayerCurrency"

		var_40_32:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
		var_40_32:setText("", 0)
		var_40_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_40_32:SetAlignment(LUI.Alignment.Left)
		var_40_32:SetOptOutRightToLeftAlignmentFlip(true)
		var_40_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 471, _1080p * 409, _1080p * 445)
		var_40_0:addElement(var_40_32)

		var_40_0.PlayerCurrency = var_40_32
	end

	local var_40_33
	local var_40_34 = LUI.UIText.new()

	var_40_34.id = "AvailableLabel"

	var_40_34:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_40_34:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_AVAILABLE"), 0)
	var_40_34:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_40_34:SetAlignment(LUI.Alignment.Left)
	var_40_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_40_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 307, _1080p * 380, _1080p * 402)
	var_40_0:addElement(var_40_34)

	var_40_0.AvailableLabel = var_40_34

	local var_40_35
	local var_40_36 = LUI.UIStyledText.new()

	var_40_36.id = "MunitionCost"

	var_40_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_40_36:SetAlpha(0.7, 0)
	var_40_36:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_COST"), 0)
	var_40_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_40_36:SetAlignment(LUI.Alignment.Left)
	var_40_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_40_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 364, _1080p * 655, _1080p * 685)
	var_40_0:addElement(var_40_36)

	var_40_0.MunitionCost = var_40_36

	local var_40_37

	if CONDITIONS.IsWaveGameType(var_40_0) then
		local var_40_38 = LUI.UIStyledText.new()

		var_40_38.id = "CurrentCash"

		var_40_38:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
		var_40_38:setText("", 0)
		var_40_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_40_38:SetAlignment(LUI.Alignment.Left)
		var_40_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 614, _1080p * 409, _1080p * 445)
		var_40_0:addElement(var_40_38)

		var_40_0.CurrentCash = var_40_38
	end

	local var_40_39
	local var_40_40 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_40_1
	})

	var_40_40.id = "NewItemNotification"

	var_40_40:SetAlpha(0, 0)
	var_40_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 191, _1080p * 700, _1080p * 730)
	var_40_0:addElement(var_40_40)

	var_40_0.NewItemNotification = var_40_40

	local var_40_41
	local var_40_42 = MenuBuilder.BuildRegisteredType("StreakKillCategory", {
		controllerIndex = var_40_1
	})

	var_40_42.id = "Category"

	var_40_42:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_40_42.Text:setText("Dynamic Kill Categories...", 0)
	var_40_42:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 323, _1080p * -275, _1080p * -245)
	var_40_0:addElement(var_40_42)

	var_40_0.Category = var_40_42

	local var_40_43

	if CONDITIONS.InFrontend(var_40_0) then
		local var_40_44 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_40_1
		})

		var_40_44.id = "LobbyMembersFooter"

		var_40_44:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_40_0:addElement(var_40_44)

		var_40_0.LobbyMembersFooter = var_40_44
	end

	local var_40_45

	if CONDITIONS.IsWaveGameType(var_40_0) then
		local var_40_46 = MenuBuilder.BuildRegisteredType("WaveTimer", {
			controllerIndex = var_40_1
		})

		var_40_46.id = "WaveTimer"

		var_40_46.ReinforcementsText:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/RESPAWN_COUNTDOWN"), 0)
		var_40_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1689, _1080p * 293, _1080p * 427)
		var_40_0:addElement(var_40_46)

		var_40_0.WaveTimer = var_40_46
	end

	local var_40_47

	if CONDITIONS.IsWaveGameType(var_40_0) then
		local var_40_48 = MenuBuilder.BuildRegisteredType("PurchaseWidget", {
			controllerIndex = var_40_1
		})

		var_40_48.id = "PurchaseWidget"

		var_40_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 640, _1080p * 1090, _1080p * 545, _1080p * 690)
		var_40_0:addElement(var_40_48)

		var_40_0.PurchaseWidget = var_40_48
	end

	local function var_40_49()
		return
	end

	var_40_0._sequences.DefaultSequence = var_40_49

	local var_40_50
	local var_40_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_18:RegisterAnimationSequence("Locked", var_40_51)

	local function var_40_52()
		var_40_18:AnimateSequence("Locked")
	end

	var_40_0._sequences.Locked = var_40_52

	local var_40_53
	local var_40_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_18:RegisterAnimationSequence("Unlocked", var_40_54)

	local function var_40_55()
		var_40_18:AnimateSequence("Unlocked")
	end

	var_40_0._sequences.Unlocked = var_40_55

	local var_40_56

	if not CONDITIONS.IsWaveGameType(var_40_0) then
		local var_40_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_40_32:RegisterAnimationSequence("WaveMode", var_40_57)
	end

	local var_40_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_34:RegisterAnimationSequence("WaveMode", var_40_58)

	local var_40_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_36:RegisterAnimationSequence("WaveMode", var_40_59)

	local function var_40_60()
		if not CONDITIONS.IsWaveGameType(var_40_0) then
			var_40_32:AnimateSequence("WaveMode")
		end

		var_40_34:AnimateSequence("WaveMode")
		var_40_36:AnimateSequence("WaveMode")
	end

	var_40_0._sequences.WaveMode = var_40_60

	local var_40_61
	local var_40_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 551
		}
	}

	var_40_23:RegisterAnimationSequence("AR", var_40_62)

	local var_40_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 575
		}
	}

	var_40_25:RegisterAnimationSequence("AR", var_40_63)

	if not CONDITIONS.IsWaveGameType(var_40_0) then
		local var_40_64 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 455
			}
		}

		var_40_32:RegisterAnimationSequence("AR", var_40_64)
	end

	local var_40_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 412
		}
	}

	var_40_34:RegisterAnimationSequence("AR", var_40_65)

	local var_40_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 695
		}
	}

	var_40_36:RegisterAnimationSequence("AR", var_40_66)

	local function var_40_67()
		var_40_23:AnimateSequence("AR")
		var_40_25:AnimateSequence("AR")

		if not CONDITIONS.IsWaveGameType(var_40_0) then
			var_40_32:AnimateSequence("AR")
		end

		var_40_34:AnimateSequence("AR")
		var_40_36:AnimateSequence("AR")
	end

	var_40_0._sequences.AR = var_40_67

	var_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_40_68 = LUI.UIBindButton.new()

	var_40_68.id = "selfBindButton"

	var_40_0:addElement(var_40_68)

	var_40_0.bindButton = var_40_68

	var_40_0.bindButton:addEventHandler("button_secondary", function(arg_48_0, arg_48_1)
		if not arg_48_1.controller then
			local var_48_0 = var_40_1
		end

		ACTIONS.LeaveMenu(var_40_0)
	end)
	var_0_22(var_40_0, var_40_1, arg_40_1)

	return var_40_0
end

MenuBuilder.registerType("CPMunitionSelect", CPMunitionSelect)
LockTable(_M)
