module(..., package.seeall)

local var_0_0 = 150
local var_0_1 = var_0_0 + 50
local var_0_2 = 9
local var_0_3 = 5
local var_0_4 = 4
local var_0_5 = 500
local var_0_6 = 3600
local var_0_7 = "battlePassError"
local var_0_8 = {
	100,
	50,
	20,
	10,
	5,
	2,
	1
}
local var_0_9 = {
	[100] = "battlepass_skip100",
	[10] = "battlepass_skip10",
	[1] = "battlepass_skip1",
	[5] = "battlepass_skip5",
	[50] = "battlepass_skip50",
	[20] = "battlepass_skip20",
	[2] = "battlepass_skip2"
}
local var_0_10 = {
	REDEEMING = 3,
	UPSELLING = 5,
	ONBOARDING_PT1 = 2,
	PENDING = 1,
	ONBOARDING_PT2 = 4,
	NONE = 0
}

local function var_0_11(arg_1_0, arg_1_1)
	arg_1_0.LeftArrow:SetAlpha(0)
	arg_1_0.RightArrow:SetAlpha(0)
	arg_1_0.ArrowLeft:SetAlpha(0)
	arg_1_0.ArrowRight:SetAlpha(0)
	arg_1_0.LeftPrompt:SetAlpha(0)
	arg_1_0.RightPrompt:SetAlpha(0)
end

local function var_0_12(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:Wait(arg_2_2).onComplete = function()
		local var_3_0, var_3_1, var_3_2, var_3_3 = arg_2_0:getLocalRect()

		arg_2_0:SetBottom(var_3_1 + arg_2_1 * _1080p, 0)
	end
end

local function var_0_13(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.WeaponAttributes then
		arg_4_0.WeaponAttributes:SetAlpha(0)

		if arg_4_1 == LOOT.itemTypes.WEAPON and arg_4_2 and arg_4_2 > 0 then
			local var_4_0
			local var_4_1
			local var_4_2 = LOOT.GetItemRef(arg_4_1, arg_4_2)

			if var_4_2 and #var_4_2 > 0 then
				var_4_0 = WEAPON.GenerateWeaponTableFromRef(var_4_2)

				local var_4_3 = WEAPON.GetVariantRef(arg_4_2)

				if var_4_3 and #var_4_3 > 0 then
					local var_4_4 = WEAPON.GetVariantFile(var_4_2)
					local var_4_5 = StringTable.BJJBBCJGEJ(var_4_4, CSV.weaponVariants.cols.ref, var_4_3)
					local var_4_6 = CSV.ReadRowWithFile(CSV.weaponVariants, var_4_4, var_4_5)

					var_4_1 = WEAPON.GetLootModTable(arg_4_0._controllerIndex, var_4_2, arg_4_2, var_4_6)
				end
			end

			if var_4_0 and var_4_1 and var_4_1.attachments and #var_4_1.attachments >= 0 then
				arg_4_0.WeaponAttributes:Setup(var_4_1, var_4_2, var_4_0)
			end
		end
	end
end

local function var_0_14(arg_5_0)
	local var_5_0 = arg_5_0:GetCurrentMenu(arg_5_0)

	if var_5_0.MPTabsMenu and var_5_0.MPTabsMenu.UpdateTabBreadcrumbs then
		var_5_0.MPTabsMenu:UpdateTabBreadcrumbs(arg_5_0._controllerIndex)
	end
end

local function var_0_15(arg_6_0, arg_6_1)
	local var_6_0 = LOOT.GetRarityColor(tonumber(arg_6_1.rarity))
	local var_6_1 = LOOT.GetLootQualityString(tonumber(arg_6_1.rarity))
	local var_6_2 = arg_6_1.className

	if arg_6_1.type == LOOT.itemTypes.WEAPON then
		if arg_6_1.IsVariant then
			local var_6_3 = WEAPON.GetSubClass(arg_6_1.ref)

			var_6_2 = Engine.CBBHFCGDIC("BATTLEPASS/BLUEPRINT_WITH_TYPE", var_6_3)
		else
			var_6_2 = "LOOT_MP/ITEM_TYPE_WEAPON"
		end
	elseif arg_6_1.type == LOOT.itemTypes.FEATURE then
		if arg_6_1.amount or arg_6_1.duration then
			var_6_2 = "LOOT_MP/CONSUMABLE"
		elseif arg_6_1.isOperatorChallenge then
			var_6_2 = "LUA_MENU/OPERATOR_MISSIONS"
		end
	end

	arg_6_0.QualityText:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE", var_6_1, var_6_2))
	arg_6_0.QualityText:SetRGBFromTable(var_6_0)
	arg_6_0.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(tonumber(arg_6_1.rarity))))
	arg_6_0.RarityIcon:SetRGBFromTable(var_6_0)
end

local function var_0_16(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = 26

	if arg_7_1.type == LOOT.itemTypes.WEAPON then
		if arg_7_3 then
			arg_7_0.WeaponDescription:setText(WEAPON.GetDesc(arg_7_1.ref))
			var_0_13(arg_7_0, arg_7_1.type, arg_7_1.itemID)
			ACTIONS.AnimateSequence(arg_7_0, "WeaponDetails")

			if arg_7_0.BattlePassPurchaseButton then
				arg_7_0.BattlePassPurchaseButton._showTooltip = false

				arg_7_0.BattlePassPurchaseButton:UpdateTooltip()
			end

			if IsLanguageArabic() then
				local var_7_1 = 180

				var_0_12(arg_7_0.UnlockCriteria, var_7_0, var_7_1)
				var_0_12(arg_7_0.DetailsPrompt, var_7_0, var_7_1)
				var_0_12(arg_7_0.WeaponDescription, var_7_0, var_7_1)
			end
		else
			if arg_7_0.SpecialWeaponAttributeWithText:SetupWeaponAttribute(arg_7_1.itemID) then
				ACTIONS.AnimateSequence(arg_7_0, "WeaponPreviewWithAttribute")
			else
				ACTIONS.AnimateSequence(arg_7_0, "WeaponPreview")
			end

			if arg_7_0.BattlePassPurchaseButton then
				arg_7_0.BattlePassPurchaseButton._showTooltip = true

				arg_7_0.BattlePassPurchaseButton:UpdateTooltip()
			end

			if IsLanguageArabic() then
				local var_7_2 = 180

				var_0_12(arg_7_0.UnlockCriteria, var_7_0, var_7_2)
				var_0_12(arg_7_0.DetailsPrompt, var_7_0, var_7_2)
			end
		end
	elseif arg_7_2.lootTable[arg_7_0._lootIndex].challengeID and arg_7_2.lootTable[arg_7_0._lootIndex].challengeID ~= "" then
		local var_7_3 = Challenge.GetNameFromRef(arg_7_2.lootTable[arg_7_0._lootIndex].challengeID, Challenge.Type.MISSION)

		if var_7_3 then
			arg_7_0.MissionTag:SetupMissionTag(arg_7_1.rarityColor, var_7_3)
			arg_7_0.MissionTag:SetAlpha(0, 0)
			arg_7_0.MissionTag:SetAlpha(1, 150)
		else
			arg_7_0.MissionTag:SetAlpha(0, 150)
		end

		ACTIONS.AnimateSequence(arg_7_0, "MissionPreview")

		if IsLanguageArabic() then
			local var_7_4 = 180

			var_0_12(arg_7_0.UnlockCriteria, var_7_0, var_7_4)
		end
	elseif arg_7_1.type == LOOT.itemTypes.CONSUMABLE then
		arg_7_0.WeaponDescription:setText(arg_7_1.duration)
		ACTIONS.AnimateSequence(arg_7_0, "ConsumablePreview")

		if IsLanguageArabic() then
			local var_7_5 = 180

			var_0_12(arg_7_0.UnlockCriteria, var_7_0, var_7_5)
			var_0_12(arg_7_0.WeaponDescription, var_7_0 + 8, var_7_5)
		end
	else
		ACTIONS.AnimateSequence(arg_7_0, "ItemPreview")

		if IsLanguageArabic() then
			local var_7_6 = 180

			var_0_12(arg_7_0.UnlockCriteria, var_7_0, var_7_6)
		end
	end

	if arg_7_0._isStandalone and arg_7_0.BattlePassPurchaseButton then
		arg_7_0.BattlePassPurchaseButton:SetAlpha(0)
		arg_7_0.BattlePassPurchaseButton:SetFocusable(false)
	end
end

local function var_0_17(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.lootData

	if var_8_0 and var_8_0.isOperatorChallengeReward then
		if var_8_0 and var_8_0.isLocked then
			local var_8_1 = var_8_0.operatorChallengeName or ""

			arg_8_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/OPERATOR_CHALLENGE_UNLOCK_MESSAGE", var_8_1))
			ACTIONS.AnimateSequence(arg_8_0, "IsLocked")
		else
			ACTIONS.AnimateSequence(arg_8_0, "NotLocked")
		end
	elseif arg_8_1._isLocked then
		if not arg_8_1._isOwned and arg_8_1._level ~= nil then
			if arg_8_0._battlePassOwned then
				arg_8_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE", arg_8_1._level))
			else
				arg_8_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", arg_8_1._level))
			end
		else
			arg_8_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_WITH_BATTLEPASS"))
		end

		ACTIONS.AnimateSequence(arg_8_0, "IsLocked")
	else
		ACTIONS.AnimateSequence(arg_8_0, "NotLocked")
	end
end

local function var_0_18(arg_9_0, arg_9_1)
	arg_9_0._isExpanded = false

	local var_9_0 = arg_9_1.lootData
	local var_9_1 = arg_9_1.itemData

	var_0_15(arg_9_0, var_9_0)
	arg_9_0.Name:setText(ToUpperCase(var_9_0.name or ""))

	if var_9_0.type == LOOT.itemTypes.WEAPON then
		if var_9_0.IsVariant then
			ACTIONS.AnimateSequence(arg_9_0, "IsBlueprint")
		else
			ACTIONS.AnimateSequence(arg_9_0, "IsBaseWeapon")
		end

		local var_9_2 = 1.18
		local var_9_3 = LAYOUT.GetTextWidth(arg_9_0.Name) * var_9_2
		local var_9_4 = arg_9_0.Name:GetCurrentAnchorsAndPositions().left
		local var_9_5 = LAYOUT.GetElementWidth(arg_9_0.BlueprintIcon)
		local var_9_6 = arg_9_0._delayBlueprintIcon and 1 or 0

		arg_9_0._delayBlueprintIcon = false

		arg_9_0.BlueprintIcon:SetLeft(var_9_3 + var_9_4, var_9_6)
		arg_9_0.BlueprintIcon:SetRight(var_9_3 + var_9_4 + var_9_5, var_9_6)
		arg_9_0.BlueprintIcon:SetAlpha(1, var_9_6)
	else
		arg_9_0.BlueprintIcon:SetAlpha(0)
	end

	var_0_16(arg_9_0, var_9_0, var_9_1, false)

	local var_9_7
	local var_9_8 = var_9_1.lootTable[arg_9_0._lootIndex].billboardImage

	if var_9_8 and #var_9_8 > 0 then
		var_9_7 = RegisterMaterial(var_9_8)
	end

	if arg_9_0.BillboardImg:GetImage() == var_9_7 then
		return
	end

	arg_9_0._itemSelectionComplete = false
	arg_9_0.Background:Wait(var_0_0 - 10, true).onComplete = function()
		arg_9_0._itemSelectionComplete = true
	end

	assert(arg_9_0.FadeCover)

	local var_9_9 = arg_9_0._itemSelectionComplete and var_0_0 or 10

	if not arg_9_0._prevImage then
		var_9_9 = 0
	end

	arg_9_0.FadeCover:SetAlpha(1, var_9_9, LUI.EASING.inQuadratic)

	arg_9_0.FadeCover:Wait(var_0_0, true).onComplete = function()
		if arg_9_0._itemSelectionComplete then
			assert(arg_9_0.BillboardImg)

			if var_9_7 then
				arg_9_0.BillboardImg:setImage(var_9_7)
				arg_9_0.BillboardImg:SetAlpha(1)
			else
				arg_9_0.BillboardImg:SetAlpha(0)
			end

			arg_9_0.FadeCover:SetAlpha(0, var_0_1, LUI.EASING.outQuadratic)

			arg_9_0._prevImage = streakBackgroundImage
		end
	end
end

local function var_0_19(arg_12_0, arg_12_1)
	if arg_12_1 == 0 then
		return BATTLEPASS.NumBonusItems
	end

	if arg_12_1 == arg_12_0._maxBattlePassLevel then
		return #arg_12_0._battlePassData
	end

	for iter_12_0, iter_12_1 in ipairs(arg_12_0._battlePassData) do
		if arg_12_1 == tonumber(iter_12_1.level) and iter_12_1.showProgress then
			return iter_12_0
		end
	end
end

local function var_0_20(arg_13_0, arg_13_1)
	local var_13_0 = LUI.FlowManager.GetScopedData("MainMenu")

	if not var_13_0.battlepassSelectedColumn then
		var_13_0.battlepassSelectedColumn = #arg_13_0._battlePassData - 1

		for iter_13_0, iter_13_1 in ipairs(arg_13_0._battlePassData) do
			local var_13_1 = tonumber(iter_13_1.level)

			if tonumber(iter_13_1.xp) > arg_13_0._battlePassXP then
				var_13_0.battlepassSelectedColumn = iter_13_0 - 1
				arg_13_0._currentLevel = var_13_1 - 1

				break
			end
		end
	end

	local var_13_2 = var_13_0.battlepassSelectedColumn

	arg_13_0.Grid:SetDefaultFocus({
		y = 0,
		x = var_13_2
	}, arg_13_1)
end

local function var_0_21(arg_14_0, arg_14_1)
	if arg_14_0._isStandalone then
		return
	end

	local var_14_0 = BATTLEPASS.GetTier(arg_14_0._controllerIndex)

	arg_14_1 = tonumber(arg_14_1)
	arg_14_0._purchaseEnabled = not arg_14_0._battlePassOwned

	if arg_14_0._needFixUp then
		arg_14_0._purchaseEnabled = true

		if arg_14_0.BattlePassPurchaseButton then
			arg_14_0.BattlePassPurchaseButton:UpdateButtonState(arg_14_0._battlePassOwned, true, arg_14_0._currentLevel, arg_14_0._needFixUp)
		end
	elseif arg_14_0._battlePassOwned and arg_14_1 then
		local var_14_1 = arg_14_1 - var_14_0
		local var_14_2 = arg_14_1 > 0 and var_14_1 > 0 and var_14_0 < arg_14_0._maxBattlePassLevel and Dvar.IBEGCHEFE("MMQLPLSNOM")

		if var_14_2 then
			arg_14_0._tierSkips = var_14_1
			arg_14_0._purchaseEnabled = true

			local var_14_3 = BATTLEPASS.SINGLE_TIER_COST

			if CONDITIONS.IsTierSaleEnabled() then
				var_14_3 = Dvar.CFHDGABACF("MOKSKKQRLK")
			end

			arg_14_0._itemCost = arg_14_0._tierSkips * var_14_3

			local var_14_4 = Engine.CBBHFCGDIC(arg_14_0._tierSkips == 1 and "MENU/BUY_TIER_SINGLE" or "MENU/BUY_TIERS_MULTIPLE", arg_14_0._tierSkips)

			if arg_14_0.BattlePassPurchaseButton then
				arg_14_0.BattlePassPurchaseButton.PurchaseText:setText(ToUpperCase(var_14_4))
			end
		else
			arg_14_0._tierSkips = 0
			arg_14_0._itemCost = 0
			arg_14_0._purchaseEnabled = false
		end

		if arg_14_0.BattlePassPurchaseButton then
			arg_14_0.BattlePassPurchaseButton:UpdateButtonState(arg_14_0._battlePassOwned, not var_14_2, var_14_0)
		end
	elseif arg_14_0.BattlePassPurchaseButton then
		arg_14_0.BattlePassPurchaseButton:UpdateButtonState(arg_14_0._battlePassOwned, true, var_14_0)
	end

	arg_14_0._purchaseEnabled = arg_14_0._purchaseEnabled and not arg_14_0._isAnimating
end

local function var_0_22(arg_15_0)
	var_0_18(arg_15_0, arg_15_0._currentChild)
	var_0_21(arg_15_0, arg_15_0._currentChild.itemData.level)
	var_0_17(arg_15_0, arg_15_0._currentChild)

	if arg_15_0._currentChild.itemData.lootTable[arg_15_0._lootIndex].challengeID and arg_15_0._currentChild.itemData.lootTable[arg_15_0._lootIndex].challengeID ~= "" then
		arg_15_0._missionChallengeID = arg_15_0._currentChild.itemData.lootTable[arg_15_0._lootIndex].challengeID

		local var_15_0 = Challenge.GetMissionDataByRef(arg_15_0._controllerIndex, arg_15_0._missionChallengeID)
		local var_15_1 = var_15_0

		while var_15_1 do
			var_15_0 = var_15_1
			var_15_1 = Challenge.GetNextMissionDataInChain(arg_15_0._controllerIndex, var_15_0)
		end

		arg_15_0._missionChallengeData = var_15_0
	else
		arg_15_0._missionChallengeID = nil
		arg_15_0._missionChallengeData = nil
	end

	local var_15_2 = arg_15_0._currentChild.lootData.type

	if arg_15_0._currentMenu then
		if arg_15_0._isAnimating then
			if arg_15_0._currentMenu.PopupHelperBar then
				arg_15_0._currentMenu.PopupHelperBar.ButtonHelperText:PopButtonPrompt({
					button_ref = "button_alt2"
				})
			end

			arg_15_0._currentMenu.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt2"
			})
		elseif arg_15_0._currentMenu.PopupHelperBar then
			arg_15_0._currentMenu.PopupHelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt2",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("BATTLEPASS/MORE_INFO")
			})
		else
			arg_15_0._currentMenu.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt2",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("BATTLEPASS/MORE_INFO")
			})
		end

		if arg_15_0._isAnimating or not LOOT.CanPreview(var_15_2, arg_15_0._currentChild.lootData.itemID) then
			if arg_15_0._isBattlePassPopup and arg_15_0._currentMenu.UpdatePrompts then
				arg_15_0._currentMenu:UpdatePrompts(false)
			else
				arg_15_0._currentMenu:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					helper_text = ""
				})
			end
		elseif arg_15_0._isBattlePassPopup and arg_15_0._currentMenu.UpdatePrompts then
			arg_15_0._currentMenu:UpdatePrompts(true)
		else
			arg_15_0._currentMenu:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
			})
		end
	end
end

local function var_0_23(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_1 then
		arg_16_0._battlePassXP = arg_16_1
		arg_16_0._previousXP = arg_16_0._battlePassXP
	end

	local var_16_0 = BATTLEPASS.GetXP(arg_16_0._controllerIndex)

	if arg_16_2 then
		var_16_0 = arg_16_2
	end

	arg_16_0._finalXP = var_16_0

	if var_16_0 < arg_16_0._battlePassXP then
		arg_16_0._battlePassXP = 0
		arg_16_0._previousXP = 0
	end

	if var_16_0 == arg_16_0._battlePassXP then
		return
	end

	arg_16_0._previousLevel = BATTLEPASS.GetTierByXP(arg_16_0._controllerIndex, arg_16_0._previousXP)

	local var_16_1 = BATTLEPASS.GetTierByXP(arg_16_0._controllerIndex, var_16_0)
	local var_16_2 = var_0_19(arg_16_0, arg_16_0._previousLevel)
	local var_16_3 = var_0_19(arg_16_0, var_16_1)
	local var_16_4 = LUI.clamp(var_16_2, 0, #arg_16_0._battlePassData - 1)
	local var_16_5 = LUI.clamp(var_16_3, 0, #arg_16_0._battlePassData - 1)

	arg_16_0._purchaseEnabled = false

	arg_16_0.TierPurchaseBG:SetAlpha(1)
	arg_16_0.TierPurchaseBG:StartAnimation()
	arg_16_0:AnimateUnlocks(var_16_4, var_16_5, false)
end

local function var_0_24(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_0._battlePassXP = arg_17_1
	arg_17_0._previousXP = arg_17_1
	arg_17_0._finalXP = arg_17_2
	arg_17_0._previousLevel = BATTLEPASS.GetTierByXP(arg_17_0._controllerIndex, arg_17_0._previousXP)

	local var_17_0 = BATTLEPASS.GetTierByXP(arg_17_0._controllerIndex, arg_17_2)
	local var_17_1 = var_0_19(arg_17_0, arg_17_0._previousLevel)
	local var_17_2 = var_0_19(arg_17_0, var_17_0)
	local var_17_3 = LUI.clamp(var_17_1, 0, #arg_17_0._battlePassData - 1)
	local var_17_4 = LUI.clamp(var_17_2, 0, #arg_17_0._battlePassData - 1)

	arg_17_0._purchaseEnabled = false
	arg_17_0._isAnimating = false
	arg_17_0._aarFillWaitTime = arg_17_3

	arg_17_0.TierPurchaseBG:SetAlpha(1)
	arg_17_0.TierPurchaseBG:StartAnimation()
	arg_17_0:AnimateUnlocks(var_17_3, var_17_4, false, true)
end

local function var_0_25(arg_18_0)
	local var_18_0 = BATTLEPASS.HasNewPassForSeason(arg_18_0._controllerIndex)
	local var_18_1, var_18_2 = BATTLEPASS.IsPendingTransactions(arg_18_0._controllerIndex)
	local var_18_3 = BATTLEPASS.IsOwned(arg_18_0._controllerIndex)
	local var_18_4 = arg_18_0._BRRewardState == var_0_10.NONE or arg_18_0._BRRewardState == var_0_10.UPSELLING

	return var_18_0 and not var_18_1 and not var_18_3 and var_18_4 and not arg_18_0._crmPurchaseBattlePass or Dvar.IBEGCHEFE("battlepass_always_show_upsell") and not arg_18_0._upsellSeen
end

local function var_0_26(arg_19_0, arg_19_1)
	arg_19_0._upsellSeen = true

	LUI.FlowManager.RequestPopupMenu(arg_19_0, "BattlePassUpsellPopup", true, arg_19_0._controllerIndex, false, {
		sourceMenu = arg_19_0,
		backLeavesBPMenuPopup = arg_19_1
	})
end

local function var_0_27(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = arg_20_1,
		action = arg_20_2 or function()
			if arg_20_0._purchaseBattlePassInAAR then
				ACTIONS.LeaveMenu(arg_20_0)

				if AAR.IsAnyNonXPParadeAvailable(arg_20_0._controllerIndex) then
					LUI.FlowManager.RequestAddMenu("AARContainer", true, arg_20_0._controllerIndex, false, {
						fromBattlepassAAR = true,
						controller = controllerIndex
					})
				end
			else
				arg_20_0.Grid:RefreshContent()
			end
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_20_0._controllerIndex, false, var_20_0, nil, false, true)
end

local function var_0_28(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	local var_22_0 = LUI.FlowManager.GetScopedData("MainMenu")
	local var_22_1 = AAR.GetDebugMatchInfoPackageString(arg_22_1)
	local var_22_2 = "current position " .. tostring(arg_22_2) .. " \n start position " .. tostring(arg_22_3) .. " \n end position " .. tostring(arg_22_4) .. " \n previous xp " .. tostring(arg_22_0._previousXP) .. " \n previous level " .. tostring(arg_22_0._previousLevel) .. " \n current level " .. tostring(arg_22_0._currentLevel) .. " \n battle pass xp " .. tostring(arg_22_0._battlePassXP) .. " \n scoped data colum " .. tostring(var_22_0 and var_22_0.battlepassSelectedColumn or "-1")

	DebugPrint("$$$ Battle Pass Menu AAR State: " .. var_22_1 .. var_22_2)
end

local function var_0_29(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	if arg_23_0._isAnimating then
		return
	end

	local var_23_0 = {
		START = 0,
		FILL = 2,
		FLARE = 3,
		END = 5,
		GRID = 1,
		DELAY = 4
	}
	local var_23_1 = {
		[var_23_0.START] = 1,
		[var_23_0.GRID] = arg_23_3 and 50 or 100,
		[var_23_0.FILL] = arg_23_3 and 50 or 100,
		[var_23_0.FLARE] = arg_23_3 and 100 or 600,
		[var_23_0.DELAY] = arg_23_3 and 50 or 200,
		[var_23_0.END] = 1
	}

	if arg_23_4 then
		var_23_1[var_23_0.FILL] = arg_23_0._aarFillWaitTime and arg_23_0._aarFillWaitTime or var_23_1[var_23_0.FILL]
	end

	local function var_23_2(arg_24_0, arg_24_1)
		arg_23_0.Grid:SetFocusedPosition({
			y = 0,
			x = arg_24_0
		}, arg_24_1, nil, false)

		return arg_23_0.Grid:GetElementAtPosition(arg_24_0, 0)
	end

	local var_23_3
	local var_23_4 = arg_23_1
	local var_23_5
	local var_23_6 = 0
	local var_23_7 = arg_23_1 + 1
	local var_23_8 = tonumber(arg_23_0._battlePassData[var_23_7].level)
	local var_23_9 = arg_23_0._finalXP and arg_23_0._finalXP or BATTLEPASS.GetXP(arg_23_0._controllerIndex)
	local var_23_10 = BATTLEPASS.GetTierMaxXP(arg_23_0._maxBattlePassLevel)

	arg_23_0._isAnimating = true
	arg_23_0._skipAnimationEnabled = true

	arg_23_0.Grid:SetDirectionalInputEnabled(false)
	arg_23_0.Grid:SetMouseFocusBlocker(true)
	arg_23_0.HorizontalScrollbar:SetAlpha(0)
	arg_23_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(true)
	arg_23_0.PromptContainer:setText(Engine.CBBHFCGDIC("BATTLEPASS/SKIP_CELEBRATION_PROMPT"))

	arg_23_0._battlePassXP = arg_23_3 and BATTLEPASS.GetTierMinXP(var_23_8 > 0 and var_23_8 - 1 or 0) or arg_23_0._previousXP

	arg_23_0.Grid:RefreshContent()
	var_0_22(arg_23_0)

	local var_23_11

	local function var_23_12()
		if not var_23_3 then
			var_23_3 = var_23_0.START
		else
			var_23_3 = var_23_3 + 1

			if var_23_3 == var_23_0.END and (var_23_4 < arg_23_2 or arg_23_0._battlePassXP < var_23_9 or var_23_4 == arg_23_2 and var_23_9 == var_23_10) then
				var_23_3 = var_23_0.START
			end
		end

		if arg_23_0:GetCurrentMenu() and arg_23_0:GetCurrentMenu().id ~= LUI.FlowManager.GetVisibleMenu().id or arg_23_0._purchaseBattlePassInAAR and not arg_23_0._purchaseBattlePassInAARSuccess then
			arg_23_0._skipAnimation = true
		end

		if arg_23_0._skipAnimation then
			arg_23_0._skipAnimation = false
			arg_23_0._skipAnimationEnabled = false

			if var_23_5 then
				var_23_5:EnableGlow(false)
				var_23_5.BattlePassFlare:ClearFlare()
			end

			var_23_3 = var_23_0.END
			var_23_4 = arg_23_2
			var_23_5 = var_23_2(var_23_4, var_23_4 == arg_23_1)
		end

		if var_23_3 == var_23_0.START then
			var_23_5 = var_23_2(var_23_4, var_23_4 == arg_23_1)

			if var_23_5 then
				arg_23_0._forceDelayEnd = false

				var_23_5:SetBattlePassOwned(arg_23_0._battlePassOwned)
				var_23_5:SetIsAnimating(true)

				if var_23_5.itemData.showProgress and not arg_23_0._displayBattlePassInAAR then
					var_23_5:EnableGlow(true)
				end

				if arg_23_3 then
					if var_23_4 == arg_23_1 then
						Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseFirst)
					elseif var_23_4 == arg_23_2 then
						Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseLast)
					else
						Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseCard)
					end
				end
			else
				var_0_28(arg_23_0, arg_23_0._controllerIndex, var_23_4, arg_23_1, arg_23_2)
				assert(var_23_5, "( currentChild == nil ) currentPosition = " .. var_23_4 .. ", startPosition = " .. arg_23_1)

				arg_23_0._skipAnimation = true
				arg_23_0._forceDelayEnd = true
			end
		elseif var_23_3 == var_23_0.FILL then
			local var_25_0 = 0
			local var_25_1 = tonumber(var_23_5.itemData.level)
			local var_25_2 = BATTLEPASS.GetTierMinXP(var_25_1)
			local var_25_3 = var_25_2

			if var_25_1 > 0 then
				var_25_3 = BATTLEPASS.GetTierMinXP(var_25_1 - 1)
			end

			if var_25_2 <= var_23_9 then
				var_25_0 = 1
				arg_23_0._battlePassXP = var_25_2
			else
				var_25_0 = (var_23_9 - var_25_3) / (var_25_2 - var_25_3)
				arg_23_0._battlePassXP = var_23_9
			end

			var_23_5.progress = var_25_0

			if var_23_5.itemData.showProgress then
				var_23_5:SetProgress(var_25_0, var_23_1[var_23_0.FILL])
			end
		elseif var_23_3 == var_23_0.FLARE then
			if var_23_5.progress == 1 then
				local var_25_4 = var_23_5.itemData.isFree == "1"

				var_23_5:SetTopBanner(var_25_4, false)
				var_23_5:SetLocked(not arg_23_0._battlePassOwned and not var_25_4)
				ACTIONS.AnimateSequence(arg_23_0, "NotLocked")

				if var_23_4 ~= arg_23_2 or var_23_9 >= var_23_10 then
					if arg_23_3 then
						var_23_5.BattlePassFlare:PlayPurchasedFlare()
					else
						var_23_5.BattlePassFlare:PlayRarityFlare(var_23_5.lootData.rarity)
					end
				end

				if arg_23_0._battlePassOwned then
					ACTIONS.AnimateSequence(var_23_5, "CompletePurchased")
				elseif var_25_4 then
					ACTIONS.AnimateSequence(var_23_5, "CompleteFree")
				else
					ACTIONS.AnimateSequence(var_23_5, "HideCheckbox")
				end

				if var_23_5.itemData.showProgress then
					ACTIONS.AnimateSequence(var_23_5, "TierCompleteFlare")
				end

				if arg_23_0._displayBattlePassInAAR then
					var_23_5:EnableGlow(true, {
						enableImmediately = true
					})
				end
			end
		elseif var_23_3 == var_23_0.DELAY then
			if not arg_23_3 then
				var_23_5:EnableGlow(false, {
					enableImmediately = false,
					disableGlowTime = 1500
				})
			end

			var_23_5:SetIsAnimating(false)

			var_23_4 = var_23_4 + 1
		end

		if var_23_3 ~= var_23_0.END then
			local var_25_5 = var_23_1[var_23_3] < 1 and 1 or var_23_1[var_23_3]

			arg_23_0:Wait(var_25_5).onComplete = function()
				var_23_12()
			end
		else
			arg_23_0._purchaseEnabled = true
			arg_23_0._isAnimating = false
			arg_23_0._battlePassXP = var_23_9

			arg_23_0.Grid:SetMouseFocusBlocker(false)
			arg_23_0.Grid:RefreshContent()
			var_0_22(arg_23_0)
			arg_23_0.PromptContainer:setText("")
			arg_23_0.HorizontalScrollbar:SetAlpha(1, 150)
			arg_23_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(false)
			BATTLEPASS.SetLastMenuXP(arg_23_0._controllerIndex, arg_23_0._battlePassXP)

			if not arg_23_0._displayBattlePassInAAR then
				arg_23_0.Grid:SetDirectionalInputEnabled(true)
				arg_23_0.TierPurchaseBG:SetAlpha(0, 150)

				local var_25_6 = BATTLEPASS.GetLastFreeTierReached(arg_23_0._controllerIndex)

				BATTLEPASS.SetLastFreeTierSeen(arg_23_0._controllerIndex, var_25_6)
				var_0_14(arg_23_0)
			else
				arg_23_0.Grid:SetDirectionalInputEnabled(false)
			end

			local function var_25_7()
				if arg_23_0._battlePassXP >= BATTLEPASS.GetTierMaxXP(BATTLEPASS.GetMaxTier()) then
					local var_27_0 = arg_23_0._displayBattlePassInAAR and arg_23_0._displayBattlePassInAAR or false

					arg_23_0._celebrateState = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_COMPLETE

					LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_23_0._controllerIndex, var_27_0, {
						state = arg_23_0._celebrateState
					}, nil, false, true)
				end

				if not arg_23_0._displayBattlePassInAAR then
					arg_23_0:dispatchEventToParent({
						name = "start_auto_close"
					})
				else
					arg_23_0:dispatchEventToRoot({
						dispatchChildren = true,
						name = "update_aar_battlepass_tier_done"
					})
				end
			end

			if arg_23_0._forceDelayEnd then
				arg_23_0:Wait(2000).onComplete = var_25_7
			else
				var_25_7()
			end

			if arg_23_0.shouldAwardFreeTierGift then
				if not arg_23_0._wasTierGiftAwarded then
					arg_23_0:Wait(500).onComplete = function()
						local var_28_0 = {
							isTierGift = true,
							bundleID = tonumber(BATTLEPASS.GetTierSkipGiftID()),
							battlePassName = BATTLEPASS.GetItemName(arg_23_0.tierGiftBattlePassPurchaseRef),
							onConfirm = function(arg_29_0)
								if arg_29_0 then
									arg_23_0._wasTierGiftAwarded = true
									arg_23_0._autoTierSkip = true

									arg_23_0:GetPurchaseAction()(arg_23_0, {
										controller = arg_23_0._controllerIndex
									})
								else
									arg_23_0.shouldAwardFreeTierGift = false

									var_0_27(arg_23_0, Engine.CBBHFCGDIC("BATTLEPASS/REWARD_ERROR_MESSAGE"))
								end
							end
						}

						arg_23_0.tierGiftBattlePassPurchaseRef = nil

						LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_23_0._controllerIndex, false, var_28_0, nil, false, true)
					end
				else
					arg_23_0._autoTierSkip = false
					arg_23_0.shouldAwardFreeTierGift = false
				end
			end
		end
	end

	if arg_23_4 then
		var_23_12()
	else
		arg_23_0:Wait(1750, true).onComplete = var_23_12
	end
end

local function var_0_30(arg_30_0)
	if arg_30_0._isAnimating then
		return
	end

	local var_30_0 = 32
	local var_30_1 = 5000
	local var_30_2 = 8000
	local var_30_3 = {
		FLARE = 2,
		END = 3,
		START = 0,
		MOVE = 1
	}
	local var_30_4 = {
		[var_30_3.START] = 300,
		[var_30_3.MOVE] = 600,
		[var_30_3.FLARE] = 300,
		[var_30_3.END] = 1200
	}
	local var_30_5 = BATTLEPASS.GetShowcaseTiers()

	local function var_30_6()
		local var_31_0 = table.remove(var_30_5, 1)

		var_31_0 = var_31_0 and var_31_0 + BATTLEPASS.NumBonusItems - 1

		if not var_31_0 or var_31_0 <= BATTLEPASS.NumBonusItems then
			var_31_0 = BATTLEPASS.NumBonusItems
		end

		return var_31_0
	end

	local var_30_7 = var_30_3.START
	local var_30_8 = var_30_6()
	local var_30_9 = arg_30_0.Grid:GetElementAtPosition(var_30_8, 0)
	local var_30_10 = 0
	local var_30_11 = 0

	local function var_30_12(arg_32_0)
		var_30_10 = 0
		var_30_11 = arg_32_0
	end

	arg_30_0.TierPurchaseBG:SetAlpha(1)
	arg_30_0.TierPurchaseBG.TierText:SetAlpha(0)
	arg_30_0.TierPurchaseBG:StartAnimation()

	arg_30_0._isAnimating = true
	arg_30_0._skipAnimationEnabled = true

	arg_30_0.Grid:SetDirectionalInputEnabled(false)
	arg_30_0.Grid:SetMouseFocusBlocker(true)
	arg_30_0.PromptContainer:setText(Engine.CBBHFCGDIC("BATTLEPASS/SKIP_CELEBRATION_PROMPT"))

	local var_30_13

	local function var_30_14()
		arg_30_0:Wait(var_30_0).onComplete = function()
			var_30_10 = var_30_10 + var_30_0

			if arg_30_0:GetCurrentMenu().id ~= LUI.FlowManager.GetVisibleMenu().id then
				return
			end

			if arg_30_0._skipAnimation then
				arg_30_0._skipAnimation = false
				arg_30_0._skipAnimationEnabled = false

				var_30_9.BattlePassFlare:ClearFlare()
				var_30_12(0)

				var_30_7 = var_30_3.END
			end

			if var_30_7 == var_30_3.START then
				arg_30_0.Grid:SetMaxVelocity(var_30_2)
				arg_30_0.Grid:SetFocusedPosition({
					y = 0,
					x = var_30_8
				}, true)

				var_30_9 = arg_30_0.Grid:GetElementAtPosition(var_30_8, 0)

				var_30_12(var_30_4[var_30_3.START])

				var_30_7 = var_30_3.FLARE
			elseif var_30_7 == var_30_3.MOVE and var_30_10 > var_30_11 then
				var_30_9.BattlePassFlare:ClearFlare()
				var_30_9:processEvent({
					name = "lose_active"
				})

				var_30_8 = var_30_6()

				arg_30_0.Grid:SetFocusedPosition({
					y = 0,
					x = var_30_8
				}, false)
				var_30_12(var_30_4[var_30_3.MOVE])

				var_30_7 = var_30_3.FLARE
			elseif var_30_7 == var_30_3.FLARE and var_30_10 > var_30_11 then
				var_30_9 = arg_30_0.Grid:GetElementAtPosition(var_30_8, 0)

				if var_30_9 and var_30_9._isOver then
					var_30_9.BattlePassFlare:PlayRarityFlare(var_30_9.lootData.rarity)

					if var_30_8 <= BATTLEPASS.NumBonusItems then
						var_30_12(var_30_4[var_30_3.END])

						var_30_7 = var_30_3.END
					else
						var_30_12(var_30_4[var_30_3.FLARE])

						var_30_7 = var_30_3.MOVE
					end
				end
			elseif var_30_7 == var_30_3.END and var_30_10 > var_30_11 then
				arg_30_0.Grid:SetMaxVelocity(var_30_1)

				if not arg_30_0._displayBattlePassInAAR then
					arg_30_0.TierPurchaseBG.TierText:SetAlpha(1)
					arg_30_0.TierPurchaseBG:SetAlpha(0, 150)
				end

				arg_30_0._isAnimating = false
				arg_30_0._skipAnimationEnabled = false

				arg_30_0.Grid:SetDirectionalInputEnabled(true)

				var_30_8 = BATTLEPASS.NumBonusItems

				arg_30_0.Grid:SetFocusedPosition({
					y = 0,
					x = var_30_8
				}, true)
				var_0_26(arg_30_0)
			end

			var_30_14()
		end
	end

	var_30_14()
end

local function var_0_31(arg_35_0, arg_35_1)
	arg_35_0._finalXP = BATTLEPASS.GetXP(arg_35_0._controllerIndex)

	local var_35_0 = BATTLEPASS.GetTier(arg_35_0._controllerIndex)
	local var_35_1 = 0
	local var_35_2 = var_0_19(arg_35_0, var_35_0)

	if arg_35_1 then
		var_35_1 = var_0_19(arg_35_0, arg_35_0._previousLevel)
	end

	if arg_35_0._purchaseBattlePassInAARSuccess then
		var_35_2 = arg_35_0.finalAAREndPosition
	end

	local var_35_3 = LUI.clamp(var_35_1, 0, #arg_35_0._battlePassData - 1)
	local var_35_4 = LUI.clamp(var_35_2, 0, #arg_35_0._battlePassData - 1)

	var_0_29(arg_35_0, var_35_3, var_35_4, not arg_35_1)
end

local function var_0_32(arg_36_0)
	local var_36_0 = BATTLEPASS.IsOwned(arg_36_0._controllerIndex)
	local var_36_1 = BATTLEPASS.GetMaxTier() == BATTLEPASS.GetTier(arg_36_0._controllerIndex)
	local var_36_2 = not var_36_0
	local var_36_3 = not var_36_1

	return BATTLEPASS.NeedFixUp(arg_36_0._controllerIndex) and (var_36_2 or var_36_3)
end

local function var_0_33(arg_37_0, arg_37_1)
	local function var_37_0()
		arg_37_0._previousXP = BATTLEPASS.GetXP(arg_37_0._controllerIndex)
		arg_37_0._previousLevel = BATTLEPASS.GetTier(arg_37_0._controllerIndex)
		arg_37_0._purchaseQueue = LUI.CreateQueue()
		arg_37_0._activationQueue = LUI.CreateQueue()
		arg_37_0._queuedRef = nil
		arg_37_0._queuedPurchase = nil
		arg_37_0._numTransactions = 0
		arg_37_0._numTransactionsComplete = 0

		if not arg_37_0._battlePassOwned and arg_37_1 then
			local var_38_0 = arg_37_1

			if not arg_37_0._autoTierSkip then
				arg_37_0._tierSkips = 0

				arg_37_0._purchaseQueue:Push({
					ref = arg_37_1
				})

				arg_37_0._numTransactions = arg_37_0._numTransactions + 1
			else
				var_38_0 = BATTLEPASS.GetPurchaseRef()
			end

			local var_38_1 = BATTLEPASS.GetActivationRefs(var_38_0)
			local var_38_2 = #var_38_1

			for iter_38_0, iter_38_1 in ipairs(var_38_1) do
				arg_37_0._activationQueue:Push({
					ref = iter_38_1,
					id = iter_38_0,
					count = var_38_2
				})

				arg_37_0._numTransactions = arg_37_0._numTransactions + 2
			end

			if arg_37_1 == BATTLEPASS.GetPurchaseRef() then
				arg_37_0._celebrateState = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_UNLOCKED
			elseif arg_37_1 == BATTLEPASS.GetPurchaseBundleRef() then
				arg_37_0._celebrateState = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_TIER_BUNDLE_UNLOCKED
			end
		else
			arg_37_0._celebrateState = BATTLEPASS.FullScreenPopupStates.TIERS_UNLOCKED
		end

		if not arg_37_0._autoTierSkip then
			while arg_37_0._tierSkips > 0 do
				for iter_38_2, iter_38_3 in ipairs(var_0_8) do
					if arg_37_0._tierSkips / iter_38_3 >= 1 then
						arg_37_0._purchaseQueue:Push({
							ref = var_0_9[iter_38_3],
							skipValue = iter_38_3
						})
						arg_37_0._activationQueue:Push({
							ref = var_0_9[iter_38_3]
						})

						arg_37_0._tierSkips = arg_37_0._tierSkips - iter_38_3
						arg_37_0._numTransactions = arg_37_0._numTransactions + 3

						break
					end
				end
			end
		else
			local var_38_3 = 0
			local var_38_4 = BATTLEPASS.GetTier(arg_37_0._controllerIndex)
			local var_38_5, var_38_6 = BATTLEPASS.GetPendingTierSkips(arg_37_0._controllerIndex)

			for iter_38_4, iter_38_5 in ipairs(var_38_5) do
				if not arg_37_0._allowTierBank or var_38_4 + var_38_3 + iter_38_5 <= arg_37_0._maxBattlePassLevel then
					arg_37_0._activationQueue:Push({
						ref = var_0_9[iter_38_5]
					})

					arg_37_0._numTransactions = arg_37_0._numTransactions + 2
					var_38_3 = var_38_3 + iter_38_5
				end
			end
		end

		local var_38_7 = false
		local var_38_8
		local var_38_9

		local function var_38_10()
			arg_37_0:Wait(16).onComplete = function()
				if arg_37_0._queuedRef then
					if not arg_37_0._errorCode then
						var_38_10()
					else
						local var_40_0 = BATTLEPASS.GetErrorMessage(arg_37_0._errorCode, arg_37_0._queuedRef)

						arg_37_0._errorCode = nil
						arg_37_0._queuedRef = nil
						arg_37_0._needFixUp = var_0_32(arg_37_0)

						LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup")
						var_0_27(arg_37_0, var_40_0)
					end
				elseif arg_37_0._purchaseQueue and not arg_37_0._queuedPurchase then
					arg_37_0._queuedPurchase = arg_37_0._purchaseQueue:Pop()

					if arg_37_0._queuedPurchase then
						arg_37_0._queuedRef = arg_37_0._queuedPurchase.ref

						local var_40_1 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_37_0._queuedRef, CSV.battlePassIDs.cols.id))

						if STORE.IsItemOnSale(var_40_1, arg_37_0._controllerIndex) then
							var_40_1 = var_40_1 + STORE.ItemSaleIdOffset
						end

						Battlepass.GAICDBJEC(arg_37_0._controllerIndex, var_40_1)
					else
						arg_37_0._purchaseQueue = nil
					end

					var_38_10()
				elseif arg_37_0._activationQueue then
					arg_37_0._activation = arg_37_0._activationQueue:Pop()

					if arg_37_0._activation then
						arg_37_0._queuedRef = arg_37_0._activation.ref

						local var_40_2 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_37_0._queuedRef, CSV.battlePassIDs.cols.id))

						if not arg_37_0._autoTierSkip and STORE.IsItemOnSale(var_40_2, arg_37_0._controllerIndex) then
							var_40_2 = var_40_2 + STORE.ItemSaleIdOffset
						end

						local var_40_3 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_37_0._queuedRef, CSV.battlePassIDs.cols.challengeID))

						Battlepass.CBHBFIJDHG(arg_37_0._controllerIndex, var_40_3, var_40_2)
					else
						arg_37_0._activationQueue = nil
					end

					var_38_10()
				else
					if not var_38_8 then
						var_38_8 = Engine.BFBIDEGDFB()
					else
						local var_40_4 = Engine.BFBIDEGDFB() - var_38_8

						if not var_38_7 and var_40_4 >= var_0_5 then
							var_38_7 = true

							arg_37_0.TierPurchaseBG:SetAlpha(1)
							arg_37_0.TierPurchaseBG:StartAnimation()
							LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup")
							LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_37_0._controllerIndex, false, {
								state = arg_37_0._celebrateState
							}, nil, false, true)
						end
					end

					if var_38_7 and arg_37_0._purchaseBattlePassInAAR then
						arg_37_0._purchaseBattlePassInAARSuccess = true

						if arg_37_0.BattlePassTierProgression then
							arg_37_0.BattlePassTierProgression:SetAlpha(0)
						end

						arg_37_0.TierPurchaseBG:SetAlpha(1)
						arg_37_0:dispatchEventToRoot({
							dispatchChildren = true,
							name = "purchase_aar_battlepass_success",
							immediate = true
						})
					end

					if var_38_7 and not LUI.FlowManager.IsInStack("BattlePassFullScreenPopup") then
						arg_37_0._needFixUp = var_0_32(arg_37_0)

						var_0_31(arg_37_0, arg_37_1 == nil)
					else
						var_38_10()
					end
				end
			end
		end

		var_38_10()
	end

	return function(arg_41_0, arg_41_1)
		if not arg_37_0._battlePassOwned and not arg_37_0._autoTierSkip then
			arg_37_0._itemCost = tonumber(BATTLEPASS.GetItemCost(arg_37_1))
		end

		arg_37_0._availableCODPoints = Commerce.CEDDCGHIGA(arg_41_1.controller, LOOT.CurrencyIDs.COD_POINTS)

		if not arg_37_0._autoTierSkip and arg_37_0._availableCODPoints < arg_37_0._itemCost then
			local var_41_0 = {
				showBalance = true,
				controllerIndex = arg_41_1.controller,
				currencyID = LOOT.CurrencyIDs.COD_POINTS,
				currencyAmount = arg_37_0._itemCost
			}

			STORE.EnterStore(arg_41_1.controller, arg_41_0:GetCurrentMenu().id, arg_41_0.id, var_41_0, "PurchaseCODPointsPopup", true)
		else
			local var_41_1

			if not arg_37_0._battlePassOwned and arg_37_1 then
				var_41_1 = Engine.CBBHFCGDIC(BATTLEPASS.GetItemName(arg_37_1))
			elseif arg_37_0._tierSkips == 1 then
				var_41_1 = Engine.CBBHFCGDIC("BATTLEPASS/1_TIER_SKIP")
			else
				var_41_1 = Engine.CBBHFCGDIC("BATTLEPASS/N_TIER_SKIPS", arg_37_0._tierSkips)
			end

			local var_41_2 = {
				hidePurchasingText = arg_37_0._autoTierSkip,
				itemCost = arg_37_0._itemCost,
				itemName = var_41_1,
				confirmAction = var_37_0,
				cancelAction = function()
					arg_37_0._purchaseEnabled = true
				end
			}

			LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup", true)

			local var_41_3 = arg_37_0._currentMenu.id ~= LUI.FlowManager.GetVisibleMenu().id and (not arg_37_0._autoTierSkip or arg_37_0._BRRewardState ~= var_0_10.NONE)

			if Engine.DBFCJBDJEC() and Engine.DDHFCGHJEA() and not isPendingTransactions and not arg_37_0._autoTierSkip then
				local var_41_4 = ""
				local var_41_5 = false

				if not arg_37_0._battlePassOwned and arg_37_1 then
					if arg_37_1 == BATTLEPASS.GetPurchaseRef() then
						var_41_4 = "battlepass_button_premium"
					elseif arg_37_1 == BATTLEPASS.GetPurchaseBundleRef() then
						var_41_4 = "battlepass_button_bundle"
					end
				else
					var_41_4 = "battlepass_emblem"
					var_41_5 = true
				end

				local var_41_6 = {
					isItemNameLocalized = true,
					itemName = var_41_1,
					itemImage = var_41_4,
					itemCurrencyID = LOOT.CurrencyIDs.COD_POINTS,
					itemCurrencyAmount = arg_37_0._itemCost,
					isBattlepassTier = var_41_5,
					confirmAction = function()
						LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_41_1.controller, var_41_3, var_41_2, nil, false, true)

						arg_37_0._purchaseEnabled = false
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchaseKoreaLegalPupup", true, arg_41_1.controller, var_41_3, var_41_6, nil, false, false)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_41_1.controller, var_41_3, var_41_2, nil, false, true)

				arg_37_0._purchaseEnabled = false
			end
		end
	end
end

local function var_0_34(arg_44_0, arg_44_1)
	local var_44_0, var_44_1 = BATTLEPASS.IsPendingTransactions(arg_44_1)
	local var_44_2, var_44_3 = BATTLEPASS.GetPendingTierSkips(arg_44_1)
	local var_44_4

	if var_44_0 then
		if var_44_3 >= 20 then
			var_44_4 = BATTLEPASS.GetPurchaseBundleRef()
		else
			var_44_4 = BATTLEPASS.GetPurchaseRef()
		end
	end

	arg_44_0:GetPurchaseAction(var_44_4)(arg_44_0, {
		controller = arg_44_1
	})
end

local function var_0_35(arg_45_0)
	arg_45_0._purchaseEnabled = false
	arg_45_0._previousXP = BATTLEPASS.GetXP(arg_45_0._controllerIndex)
	arg_45_0._previousLevel = BATTLEPASS.GetTier(arg_45_0._controllerIndex)

	BATTLEPASS.FixUp(arg_45_0._controllerIndex)

	local var_45_0 = 60000

	arg_45_0._fixingUp = true
	arg_45_0:Wait(var_45_0).onComplete = function()
		arg_45_0:processEvent({
			name = "battlepass_fixup_failed"
		})
	end

	LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_45_0._controllerIndex, false, {
		fixUp = true
	}, nil, false, true)
end

local function var_0_36(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetPurchaseAction()
	local var_47_1 = {
		sourceMenu = arg_47_0,
		purchaseAction = var_47_0,
		backLeavesBPMenuPopup = arg_47_0._purchaseBattlePassInAAR or arg_47_0._purchaseBattlePassInStore or arg_47_0._purchaseBattlePassInVIPGift
	}

	LUI.FlowManager.RequestPopupMenu(arg_47_0, "BattlePassPurchasePopup", true, arg_47_1, false, var_47_1)
end

local function var_0_37(arg_48_0, arg_48_1)
	if arg_48_0._battlePassOwned then
		var_0_27(arg_48_0, Engine.CBBHFCGDIC("BATTLEPASS/ERROR_ALREADY_OWN"), function()
			ACTIONS.LeaveMenu(arg_48_0)
		end)

		return
	end

	arg_48_0._purchaseBattlePassInVIPGift = true

	if arg_48_1 then
		local var_48_0 = {
			skipDelay = true,
			menu = arg_48_0,
			closeAction = function(arg_50_0)
				var_0_26(arg_50_0, true)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_48_0._controllerIndex, false, var_48_0)
	else
		var_0_36(arg_48_0, arg_48_0._controllerIndex)
	end
end

local function var_0_38(arg_51_0)
	if arg_51_0._battlePassOwned then
		var_0_27(arg_51_0, Engine.CBBHFCGDIC("BATTLEPASS/ERROR_ALREADY_OWN"), function()
			ACTIONS.LeaveMenu(arg_51_0)
		end)

		return
	end

	arg_51_0._purchaseBattlePassInStore = true

	if not Onboarding.BattlePass.WasCompleted(arg_51_0, arg_51_0._controllerIndex) then
		local var_51_0 = {
			skipDelay = true,
			menu = arg_51_0,
			closeAction = function(arg_53_0)
				var_0_36(arg_53_0, arg_53_0._controllerIndex)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_51_0._controllerIndex, false, var_51_0)
	else
		var_0_36(arg_51_0, arg_51_0._controllerIndex)
	end
end

local function var_0_39(arg_54_0, arg_54_1)
	ACTIONS.AnimateSequence(arg_54_0, "SetupStandalone")

	arg_54_0._purchaseBattlePassInAAR = true

	var_0_36(arg_54_0, arg_54_1)
end

local function var_0_40(arg_55_0, arg_55_1, arg_55_2)
	arg_55_0._displayBattlePassInAAR = true
	arg_55_0._shouldAnimateDoubleXP = arg_55_2.isDoubleXPActive

	local var_55_0 = arg_55_2.startTierXP
	local var_55_1 = BATTLEPASS.GetTierByXP(arg_55_0._controllerIndex, arg_55_2.currentTierXP)

	arg_55_0.finalAAREndPosition = var_0_19(arg_55_0, var_55_1)
	arg_55_0.BattlePassTierProgression = MenuBuilder.BuildRegisteredType("BattlePassTierProgression", {
		isAARBattlepass = true,
		controllerIndex = arg_55_1
	})
	arg_55_0.BattlePassTierProgression.id = "BattlePassTierProgression"

	arg_55_0.BattlePassTierProgression:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * -54, _1080p * 1026)
	arg_55_0:addElement(arg_55_0.BattlePassTierProgression)
	arg_55_0.BattlePassTierProgression:PlayBattlePassTierProgression(arg_55_1, arg_55_2)
	arg_55_0.BattlePassTierProgression:SetAlpha(0)
	arg_55_0.BattlePassTierProgression:SetAlpha(1, 100)
	var_0_11(arg_55_0, arg_55_1)
	arg_55_0.Background:SetAlpha(0)
	ACTIONS.AnimateSequence(arg_55_0.TierPurchaseBG, "HideBattlePassInfo")
	arg_55_0.Grid:SetDirectionalInputEnabled(false)
	arg_55_0:registerEventHandler("update_aar_battlepass_tier", function(arg_56_0, arg_56_1)
		if not arg_55_0._purchaseBattlePassInAAR then
			arg_55_0:AnimateXPEarnedInAAR(arg_56_1.displayTierXP, arg_56_1.earnedTypeXP + arg_56_1.displayTierXP, arg_56_1.waitTime)
		end
	end)
	arg_55_0:registerEventHandler(AAR.PARADE_BATTLE_PASS_DONE, function(arg_57_0, arg_57_1)
		if not arg_55_0._purchaseBattlePassInAAR then
			ACTIONS.LeaveMenu(arg_55_0)

			if AAR.IsAnyNonXPParadeAvailable(arg_55_0._controllerIndex) then
				LUI.FlowManager.RequestAddMenu("AARContainer", true, arg_55_0._controllerIndex, false, {
					fromBattlepassAAR = true,
					controller = arg_55_1
				})
			end
		end
	end)
end

local function var_0_41(arg_58_0, arg_58_1)
	if arg_58_1.controller == arg_58_0._controllerIndex then
		if arg_58_0._purchaseEnabled then
			if arg_58_0._isStandalone then
				return
			elseif arg_58_0._needFixUp then
				var_0_35(arg_58_0)
			elseif not arg_58_0._battlePassOwned then
				LUI.FlowManager.RequestPopupMenu(arg_58_0, "BattlePassPurchasePopup", true, arg_58_1.controller, false, {
					sourceMenu = arg_58_0,
					purchaseAction = purchaseAction
				})
			elseif arg_58_0._tierSkips > 0 then
				LUI.FlowManager.RequestPopupMenu(arg_58_0, "BattlePassTiersPurchasePopup", true, arg_58_1.controller, false, {
					sourceMenu = arg_58_0,
					purchaseAction = purchaseAction,
					tierSkips = arg_58_0._tierSkips
				})
			end

			Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseSelect)
		elseif arg_58_0._skipAnimationEnabled then
			arg_58_0._skipAnimation = true
		end
	end
end

local function var_0_42(arg_59_0, arg_59_1)
	if arg_59_1 then
		local var_59_0 = {
			promptsData = {
				{
					kbmTooltipPromptOverload = "button_alt1",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
				}
			}
		}

		arg_59_0:AddTooltipData(controllerIndex, var_59_0)
	else
		arg_59_0:RemoveToolTipData()
	end
end

local function var_0_43(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	local var_60_0 = ToUpperCase(arg_60_0.lootData.name or "")

	arg_60_0:SetupContextualMenu({
		title = var_60_0
	})

	if arg_60_1._battlePassOwned and not arg_60_3 and arg_60_2 then
		local var_60_1 = {
			id = "battlePassContextualBuyTier",
			actionName = Engine.CBBHFCGDIC("BATTLEPASS/BUY_TIERS_MULTIPLE"),
			actionFunction = function()
				var_0_41(arg_60_1, {
					controller = arg_60_1._controllerIndex
				})
			end
		}

		arg_60_0:AddContextualMenuAction(var_60_1)
	end

	local var_60_2 = arg_60_0.lootData.type

	if var_60_2 == LOOT.itemTypes.WEAPON or var_60_2 == LOOT.itemTypes.OPERATOR_SKIN then
		local var_60_3

		if var_60_2 == LOOT.itemTypes.WEAPON then
			var_60_3 = Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_REWARD_DETAILS_CONTEXTUAL")
		else
			var_60_3 = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_MISSION_DETAILS_CONTEXTUAL")
		end

		local var_60_4 = {
			id = "battlePassContextualViewDetails",
			actionName = var_60_3,
			actionFunction = function()
				if var_60_2 == LOOT.itemTypes.WEAPON then
					arg_60_1._isExpanded = not arg_60_1._isExpanded

					Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
				end

				var_0_16(arg_60_1, arg_60_0.lootData, arg_60_0.itemData, arg_60_1._isExpanded)

				if arg_60_1._missionChallengeID then
					Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

					if not Engine.DBAEJAHFGJ(arg_60_1._controllerIndex) then
						if arg_60_1._missionChallengeData.category == Challenge.Operator then
							local var_62_0 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_60_1._missionChallengeID, CSV.questChallenges.cols.id)

							if var_62_0 and #var_62_0 > 0 then
								LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_60_1._controllerIndex, false, {
									challengeID = var_62_0,
									skinLootId = arg_60_1._missionChallengeData.loot
								})
							end
						end
					else
						LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_60_1._controllerIndex, false)
					end
				end
			end
		}

		arg_60_0:AddContextualMenuAction(var_60_4)
	end

	if LOOT.CanPreview(var_60_2, arg_60_0.lootData.itemID) then
		local var_60_5 = {
			id = "battlePassContextualPreview",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"),
			actionFunction = function()
				if not arg_60_1._isAnimating then
					STORE.PreviewItem(arg_60_1._controllerIndex, var_60_2, arg_60_0.lootData.itemID, nil, nil, true)
				end
			end
		}

		arg_60_0:AddContextualMenuAction(var_60_5)
		var_0_42(arg_60_0, true)
	else
		var_0_42(arg_60_0, false)
	end
end

local function var_0_44(arg_64_0)
	if arg_64_0 then
		local var_64_0 = arg_64_0[#arg_64_0]

		if #var_64_0.lootTable > 1 then
			table.remove(arg_64_0, #arg_64_0)

			for iter_64_0, iter_64_1 in ipairs(var_64_0.lootTable) do
				local var_64_1 = LUI.ShallowCopy(var_64_0)
				local var_64_2 = {
					lootID = iter_64_1.lootID,
					billboardImage = iter_64_1.billboardImage,
					challengeID = iter_64_1.challengeID
				}

				if iter_64_0 > 1 then
					var_64_1.showProgress = false
				end

				var_64_1.subTierID = iter_64_1.subTierID
				var_64_1.lootTable = {}

				table.insert(var_64_1.lootTable, var_64_2)
				table.insert(arg_64_0, var_64_1)
			end
		end
	end
end

local function var_0_45(arg_65_0, arg_65_1)
	if not Dvar.IBEGCHEFE("MPQSMOPRQK") then
		return
	end

	local var_65_0 = Challenge.GetQuestsForMissionChallenges(arg_65_1, {
		Challenge.Operator
	}).quests
	local var_65_1 = {}

	for iter_65_0, iter_65_1 in pairs(var_65_0) do
		var_65_1[iter_65_1[1].ref] = iter_65_0
	end

	for iter_65_2, iter_65_3 in ipairs(arg_65_0) do
		for iter_65_4, iter_65_5 in ipairs(iter_65_3.lootTable) do
			local var_65_2 = iter_65_5.challengeID

			if var_65_2 and #var_65_2 > 0 and var_65_1[var_65_2] then
				local var_65_3 = var_65_1[var_65_2]

				for iter_65_6, iter_65_7 in ipairs(var_65_0[var_65_3]) do
					if iter_65_7.loot and #iter_65_7.loot > 0 then
						local var_65_4 = LUI.ShallowCopy(iter_65_5)
						local var_65_5 = Quests.CCBJIDFAHE(arg_65_1, tonumber(iter_65_7.id)) >= tonumber(iter_65_7.amount)

						var_65_4.lootID = iter_65_7.loot
						var_65_4.isOperatorChallengeReward = true
						var_65_4.operatorChallengeName = iter_65_7.name
						var_65_4.isLocked = not iter_65_7.unlocked or not var_65_5

						table.insert(iter_65_3.lootTable, var_65_4)
					end
				end

				break
			end
		end
	end
end

local var_0_46

local function var_0_47(arg_66_0)
	if not (not LUI.FlowManager.IsInStack("BattlePassRewardPopup") and not LUI.FlowManager.IsInStack("BattlePassOnboardingPopup") and not LUI.FlowManager.IsInStack("BattlePassPurchaseProgressPopup")) then
		return
	end

	if arg_66_0._BRRewardState == var_0_10.PENDING then
		local var_66_0 = {
			isBRReward = true,
			onConfirm = function(arg_67_0)
				LUI.FlowManager.GetScopedData("MainMenu").brRewardPending = nil
				arg_66_0._BRRewardState = arg_67_0 and var_0_10.ONBOARDING_PT1 or var_0_10.NONE

				if not arg_67_0 then
					var_0_27(arg_66_0, Engine.CBBHFCGDIC("BATTLEPASS/REWARD_ERROR_MESSAGE"))
				elseif LUI.IsLastInputMouseNavigation(arg_66_0._controllerIndex) then
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassRewardPopup", true)
					var_0_47(arg_66_0)
				end
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_66_0._controllerIndex, false, var_66_0, nil, false, true)
	elseif arg_66_0._BRRewardState == var_0_10.ONBOARDING_PT1 and not LUI.FlowManager.IsInStack("BattlePassRewardPopup") then
		if not Onboarding.BattlePass.WasCompleted(arg_66_0, arg_66_0._controllerIndex) then
			local var_66_1 = {
				currentPage = 1,
				overrideAction = function()
					Engine.EBCGADABJ()
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassOnboardingPopup")

					arg_66_0._BRRewardState = var_0_10.REDEEMING

					var_0_47(arg_66_0)
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_66_0._controllerIndex, false, var_66_1)
		else
			arg_66_0._BRRewardState = var_0_10.REDEEMING

			var_0_47(arg_66_0)
		end
	elseif arg_66_0._BRRewardState == var_0_10.REDEEMING then
		if not arg_66_0._animatingBRReward then
			arg_66_0._animatingBRReward = true

			Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokeCardSlam)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_66_0._controllerIndex, false, {
				tierSkipID = BATTLEPASS.SINGLE_TIER_SKIP_ID
			})

			arg_66_0:Wait(1500).onComplete = function()
				LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

				arg_66_0._autoTierSkip = true
				arg_66_0._animatingBRReward = false

				var_0_34(arg_66_0, arg_66_0._controllerIndex)

				arg_66_0._BRRewardState = var_0_10.ONBOARDING_PT2
			end
		end
	elseif arg_66_0._BRRewardState == var_0_10.ONBOARDING_PT2 then
		arg_66_0._autoTierSkip = false

		if not Onboarding.BattlePass.WasCompleted(arg_66_0, arg_66_0._controllerIndex) then
			arg_66_0:Wait(1500).onComplete = function()
				local var_70_0 = {
					currentPage = 2,
					closeAction = function()
						arg_66_0._BRRewardState = var_0_10.UPSELLING

						var_0_47(arg_66_0)
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_66_0._controllerIndex, false, var_70_0)
			end
		else
			arg_66_0._BRRewardState = var_0_10.UPSELLING

			var_0_47(arg_66_0)
		end
	elseif arg_66_0._BRRewardState == var_0_10.UPSELLING then
		if var_0_25(arg_66_0) then
			var_0_26(arg_66_0)
		end

		arg_66_0._BRRewardState = var_0_10.NONE
	end
end

function PreLoadFunc(arg_72_0, arg_72_1, arg_72_2)
	arg_72_0._displayBattlePassInAAR = arg_72_2.displayBattlePassInAAR ~= nil
end

local function var_0_48(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0.AnimateXPEarned = var_0_23
	arg_73_0.AnimateXPEarnedInAAR = var_0_24
	arg_73_0.AnimateUnlocks = var_0_29
	arg_73_0.AnimateShowcase = var_0_30
	arg_73_0.Grid = arg_73_0.BattlePassGridContainer.Grid
	arg_73_0.HorizontalScrollbar = arg_73_0.BattlePassGridContainer.HorizontalScrollbar

	ACTIONS.ScaleFullscreen(arg_73_0.Background)

	if not arg_73_2.displayBattlePassInAAR then
		Engine.DHFCHIIJCA("quartermaster")
	end

	local var_73_0 = LUI.FlowManager.GetScopedData("MainMenu")

	arg_73_0._maxBattlePassLevel = BATTLEPASS.GetMaxTier()
	arg_73_0._controllerIndex = arg_73_1
	arg_73_0._battlePassXP = BATTLEPASS.GetLastMenuXP(arg_73_0._controllerIndex)

	if arg_73_2.displayBattlePassInAAR then
		arg_73_0._battlePassXP = arg_73_2.battlePassData.startTierXP
	end

	arg_73_0._previousXP = arg_73_0._battlePassXP
	arg_73_0._battlePassOwned = BATTLEPASS.IsOwned(arg_73_0._controllerIndex)
	arg_73_0._battlePassData = BATTLEPASS.GetAllTiersData()
	arg_73_0._availableCODPoints = Commerce.CEDDCGHIGA(arg_73_0._controllerIndex, LOOT.CurrencyIDs.COD_POINTS)
	arg_73_0._currentLevel = BATTLEPASS.GetTier(arg_73_0._controllerIndex)

	if arg_73_2.displayBattlePassInAAR then
		arg_73_0._currentLevel = BATTLEPASS.GetTierByXP(arg_73_0._controllerIndex, arg_73_0._battlePassXP)
	end

	arg_73_0._isAnimating = false
	arg_73_0._isExpanded = false
	arg_73_0._currentChild = nil
	arg_73_0._autoTierSkip = arg_73_2.tierSkipID ~= nil
	arg_73_0._displayBattlePassInAAR = arg_73_2.displayBattlePassInAAR ~= nil
	arg_73_0._isBattlePassPopup = arg_73_2.isBattlePassPopup
	arg_73_0._isStandalone = arg_73_0._isBattlePassPopup or arg_73_0._displayBattlePassInAAR or arg_73_2.isStandalone or arg_73_2.purchaseBattlePassInAAR
	arg_73_0._needFixUp = var_0_32(arg_73_0)
	arg_73_0._itemSelectionComplete = true
	arg_73_0._lootIndex = 1
	arg_73_0._BRRewardState = not arg_73_0._isStandalone and BATTLEPASS.BRRewardAvailable(arg_73_0._controllerIndex) and var_73_0.brRewardPending and var_0_10.PENDING or var_0_10.NONE
	arg_73_0._allowTierBank = arg_73_2.allowTierBank

	if var_73_0.crmPurchaseBattlePass then
		var_73_0.crmPurchaseBattlePass = nil
		arg_73_0._crmPurchaseBattlePass = true
	end

	if arg_73_0._BRRewardState == var_0_10.PENDING then
		arg_73_0._battlePassXP = BATTLEPASS.GetXP()
		arg_73_0._previousXP = arg_73_0._battlePassXP
	end

	arg_73_0.GetPurchaseAction = var_0_33
	arg_73_0.TriggerAutoTierSkip = var_0_34
	arg_73_0.TriggerPurchaseBattlePassInAAR = var_0_39
	arg_73_0.TriggerDisplayBattlePassInAAR = var_0_40
	arg_73_0.TriggerPurchaseBattlePassInStore = var_0_38
	arg_73_0.TriggerPurchaseBattlePassInVIPGift = var_0_37

	arg_73_0:addElement(LOOT.GetLootFlareMaterialStreamer())
	arg_73_0.BattlePassStatus:UpdateActiveBanner(arg_73_0._battlePassOwned)
	var_0_44(arg_73_0._battlePassData)
	var_0_45(arg_73_0._battlePassData, arg_73_0._controllerIndex)

	if arg_73_0._isBattlePassPopup then
		arg_73_0.BillboardImg:SetMask(arg_73_0.CenterOutMask)
		arg_73_0.CenterOutMask:SetAlpha(1)
	end

	local function var_73_1(arg_74_0, arg_74_1, arg_74_2)
		local var_74_0 = arg_74_1 + 1
		local var_74_1 = arg_73_0._battlePassData[var_74_0]
		local var_74_2 = tonumber(var_74_1.level)
		local var_74_3 = var_74_2 <= 0

		arg_74_0.itemData = var_74_1

		arg_74_0:SetupLootData(var_74_1)

		local var_74_4 = arg_74_0.lootData

		arg_74_0:SetBattlePassOwned(arg_73_0._battlePassOwned)
		arg_74_0:SetTopBanner(var_74_1.isFree == "1", not arg_73_0._battlePassOwned and var_74_3)
		arg_74_0:SetIsAnimating(arg_73_0._isAnimating)
		arg_74_0:EnableGlow(false)

		local var_74_5 = 0

		if var_74_2 > 0 then
			local var_74_6 = tonumber(var_74_1.xp)

			if var_74_6 <= arg_73_0._battlePassXP then
				var_74_5 = 1
			else
				local var_74_7 = 0

				if var_74_2 > 1 then
					var_74_7 = BATTLEPASS.GetTierMinXP(var_74_2 - 1)
				end

				if var_74_7 < arg_73_0._battlePassXP then
					local var_74_8 = var_74_6 - var_74_7

					var_74_5 = (arg_73_0._battlePassXP - var_74_7) / var_74_8
				end
			end

			if var_74_5 ~= 1 then
				ACTIONS.AnimateSequence(arg_74_0, "HideCheckbox")
			end
		end

		if var_74_2 > 0 then
			arg_74_0:SetLevel(var_74_2, var_74_1.showProgress)
			arg_74_0:SetProgress(var_74_5, 0)
		else
			arg_74_0:SetLevel(nil, var_74_1.showProgress)
			arg_74_0:SetProgress(0, 0)
		end

		if var_74_1.lootTable[1].challengeID and var_74_1.lootTable[1].challengeID ~= "" then
			arg_74_0:ShowMission(true)
		else
			arg_74_0:ShowMission(false)
		end

		arg_74_0._column = arg_74_1

		arg_74_0:UpdateExpandedState()

		local var_74_9 = var_74_5 == 1 or var_74_2 == 0 and arg_73_0._battlePassOwned
		local var_74_10 = var_74_5 < 1
		local var_74_11 = var_74_1.isFree == "1"
		local var_74_12 = var_74_5 == 1 and var_74_1.isFree ~= "1"
		local var_74_13

		var_74_13 = not var_74_11 or not var_74_9 or var_74_3
		arg_74_0.isLockedWithBattlePass = not var_74_9 and not var_74_3

		arg_74_0:SetOwned(var_74_9)
		arg_74_0:SetLocked(not arg_73_0._battlePassOwned and (var_74_3 or var_74_12) or var_74_10 and not var_74_3)

		if not var_74_9 and (not var_74_3 or not arg_73_0._battlePassOwned) then
			local var_74_14 = BATTLEPASS.GetTierLootIsPromoted(arg_73_0._controllerIndex, var_74_2, var_74_1.subTierID)

			arg_74_0:SetPromoted(var_74_14)

			local var_74_15 = BATTLEPASS.GetTierLootIsShowcased(arg_73_0._controllerIndex, var_74_2, var_74_1.subTierID)

			arg_74_0:SetShowcased(var_74_15)
		else
			arg_74_0.BattlePassFlare:ClearFlare()
			arg_74_0:SetShowcased(false)
			arg_74_0:SetPromoted(false)
		end

		arg_74_0:SetDirectionalInputEnabled(not arg_73_0._isAnimating)

		if not arg_74_0._buttonHandlerAdded then
			arg_74_0._buttonHandlerAdded = true

			arg_74_0:addEventHandler("button_over", function(arg_75_0, arg_75_1)
				if arg_73_0._focusItem == nil or arg_73_0._focusItem ~= arg_75_0 then
					if arg_73_0._focusItem ~= nil then
						var_0_42(arg_73_0._focusItem, false)
						arg_73_0._focusItem:processEvent({
							name = "lose_active"
						})
					end

					arg_73_0._focusItem = arg_75_0
					arg_73_0._currentChild = arg_74_0
					arg_73_0._lootIndex = 1
				end

				local var_75_0 = not (tonumber(arg_74_0.itemData.level) <= 0) and not arg_74_0._isOwned

				arg_73_0.BillboardImg:SetHandleMouse(var_75_0)
				var_0_43(arg_74_0, arg_73_0, var_75_0, arg_73_0._isBattlePassPopup)
				var_0_22(arg_73_0)
			end)
			arg_74_0:addEventHandler("button_up", function(arg_76_0, arg_76_1)
				if arg_73_0._focusItem == arg_76_0 then
					arg_73_0._focusItem:processEvent({
						name = "lose_active"
					})

					arg_73_0._focusItem = nil
				end

				arg_73_0._lootIndex = 1
			end)
			arg_74_0:addEventHandler("button_action", function(arg_77_0, arg_77_1)
				if not arg_77_1.keyboard then
					local var_77_0 = arg_77_1.controller == arg_73_0._controllerIndex

					if not arg_73_0._isAnimating and var_77_0 and not arg_73_0._displayBattlePassInAAR and LOOT.CanPreview(arg_77_0.lootData.type, arg_77_0.lootData.itemID) then
						STORE.PreviewItem(arg_73_0._controllerIndex, arg_77_0.lootData.type, arg_77_0.lootData.itemID, nil, nil, true)
					end
				else
					var_0_41(arg_73_0, arg_77_1)
				end
			end)
		end
	end

	arg_73_0.Grid:SetSnapOnWrapEnabled(true)
	arg_73_0.Grid:SetRefreshChild(var_73_1)
	arg_73_0.Grid:SetNumChildren(#arg_73_0._battlePassData)
	arg_73_0.Grid:SetMeasureColumnFunction(LUI.ExpanderUtils.GenerateMeasureColumnFunction(150 * _1080p))
	arg_73_0.Grid:RefreshContent()

	local var_73_2 = Onboarding.BattlePass.WasCompleted(arg_73_0, arg_73_0._controllerIndex)

	arg_73_0.Grid:SetNotifyOnLayoutInit(true)
	arg_73_0.Grid:addEventHandler("layout_initialized", function()
		var_73_2 = Onboarding.BattlePass.WasCompleted(arg_73_0, arg_73_0._controllerIndex)

		local var_78_0 = BATTLEPASS.HasNewPassForSeason(arg_73_0._controllerIndex) and not BATTLEPASS.IsOwned(arg_73_0._controllerIndex) or Dvar.IBEGCHEFE("battlepass_always_show_upsell") and not arg_73_0._upsellSeen

		if var_73_2 and not var_78_0 and arg_73_0._BRRewardState == var_0_10.NONE and not arg_73_0._crmPurchaseBattlePass then
			var_0_23(arg_73_0)
		end
	end)

	if arg_73_0._BRRewardState == var_0_10.NONE and not arg_73_0._isStandalone then
		if arg_73_0._crmPurchaseBattlePass and not BATTLEPASS.IsOwned(arg_73_0._controllerIndex) then
			Onboarding.BattlePass.MarkCompleted(arg_73_0, arg_73_0._controllerIndex)
			BATTLEPASS.MarkPassSeenForSeason(arg_73_0._controllerIndex, SEASON.GetCurrentSeason())
			var_0_36(arg_73_0, arg_73_1)
		elseif not var_73_2 then
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_73_0._controllerIndex, false)
		end
	end

	if var_73_0.showBattlePassPurchasePopup then
		var_73_0.showBattlePassPurchasePopup = nil

		var_0_36(arg_73_0, arg_73_1)
	end

	local function var_73_3(arg_79_0, arg_79_1)
		var_73_2 = Onboarding.BattlePass.WasCompleted(arg_73_0, arg_73_0._controllerIndex)

		if not arg_73_0._isAnimating and var_73_2 and var_0_25(arg_73_0) then
			if Dvar.IBEGCHEFE("battlepass_use_showcase_animation") then
				arg_73_0:AnimateShowcase()
			else
				var_0_26(arg_73_0)
			end
		end
	end

	if arg_73_0._isStandalone then
		if not arg_73_0._displayBattlePassInAAR then
			arg_73_0._battlePassXP = BATTLEPASS.GetXP(arg_73_0._controllerIndex)
		end

		ACTIONS.AnimateSequence(arg_73_0, "SetupStandalone")
		arg_73_0.HorizontalScrollbar:SetAlpha(0)
		arg_73_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(true)
	else
		arg_73_0:addEventHandler("gain_focus", function(arg_80_0, arg_80_1)
			if arg_73_0._BRRewardState ~= var_0_10.NONE then
				var_0_47(arg_73_0)
			else
				var_73_3(arg_80_0, arg_80_1)
			end
		end)

		if LUI.IsLastInputMouseNavigation(arg_73_0._controllerIndex) then
			arg_73_0:processEvent({
				name = "gain_focus"
			})
		end

		arg_73_0:addEventHandler("restore_focus", function(arg_81_0, arg_81_1)
			local var_81_0 = LUI.FlowManager.GetScopedData(arg_73_0)

			if arg_73_0._BRRewardState ~= var_0_10.NONE then
				var_0_47(arg_73_0)
			elseif var_81_0.restoreTiersPopup then
				var_81_0.restoreTiersPopup = false

				LUI.FlowManager.RequestPopupMenu(arg_73_0, "BattlePassTiersPurchasePopup", true, arg_73_1, false, {
					sourceMenu = arg_73_0,
					tierSkips = arg_73_0._tierSkips
				})
			elseif var_81_0.isPurchaseFromPreview then
				var_81_0.isPurchaseFromPreview = false

				var_0_41(arg_73_0, {
					controller = arg_73_0._controllerIndex
				})
			else
				var_73_3(arg_81_0, arg_81_1)
			end

			var_0_14(arg_81_0)
		end)
	end

	local var_73_4 = LUI.UIBindButton.new()

	var_73_4.id = "bindButton"

	arg_73_0:addElement(var_73_4)

	arg_73_0.bindButton = var_73_4

	local function var_73_5(arg_82_0)
		if not arg_73_0._isAnimating and not arg_73_0._displayBattlePassInAAR then
			local var_82_0

			if arg_82_0 then
				if LUI.IsLastInputMouseNavigation(arg_73_1) then
					var_82_0 = (arg_73_0.Grid:GetBuiltChildren()[1]._column or 1) - var_0_3
				else
					var_82_0 = arg_73_0.Grid:GetFocusPositionIndex() - var_0_2
				end
			elseif LUI.IsLastInputMouseNavigation(arg_73_1) then
				var_82_0 = (arg_73_0.Grid:GetBuiltChildren()[1]._column or 1) + var_0_2 + var_0_4
			else
				var_82_0 = arg_73_0.Grid:GetFocusPositionIndex() + var_0_2
			end

			local var_82_1 = {
				y = 0,
				x = var_82_0
			}

			arg_73_0.Grid:SetFocusedPosition(var_82_1, false)

			arg_73_0._delayBlueprintIcon = true
		end
	end

	arg_73_0.bindButton:addEventHandler("button_left_trigger", function(arg_83_0, arg_83_1)
		if arg_83_1.controller == arg_73_0._controllerIndex then
			var_73_5(true)
		end
	end)
	arg_73_0.bindButton:addEventHandler("button_right_trigger", function(arg_84_0, arg_84_1)
		if arg_84_1.controller == arg_73_0._controllerIndex then
			var_73_5(false)
		end
	end)
	arg_73_0.bindButton:addEventHandler("button_alt2", function(arg_85_0, arg_85_1)
		if not arg_73_0._isAnimating then
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

			if arg_73_0._battlePassOwned then
				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_73_0._controllerIndex, false, {
					skipDelay = true
				})
			else
				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_73_0._controllerIndex, false, {
					skipDelay = true,
					closeAction = var_0_26,
					menu = arg_73_0
				})
			end
		end
	end)
	arg_73_0.LeftArrow:addEventHandler("button_action", function(arg_86_0, arg_86_1)
		if arg_86_1.controller == arg_73_0._controllerIndex then
			var_73_5(true)
		end
	end)
	arg_73_0.RightArrow:addEventHandler("button_action", function(arg_87_0, arg_87_1)
		if arg_87_1.controller == arg_73_0._controllerIndex then
			var_73_5(false)
		end
	end)
	arg_73_0.bindButton:addEventHandler("button_right_stick", function(arg_88_0, arg_88_1)
		if arg_88_1.controller == arg_73_0._controllerIndex then
			if arg_73_0._currentChild then
				arg_73_0._isExpanded = not arg_73_0._isExpanded

				var_0_16(arg_73_0, arg_73_0._currentChild.lootData, arg_73_0._currentChild.itemData, arg_73_0._isExpanded)

				if arg_73_0._currentChild.lootData.type == LOOT.itemTypes.WEAPON then
					Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
				end
			end

			if arg_73_0._missionChallengeID then
				Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

				if arg_73_0._missionChallengeData.category == "OPERATOR" then
					local var_88_0 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_73_0._missionChallengeID, CSV.questChallenges.cols.id)

					if var_88_0 and #var_88_0 > 0 then
						LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_73_0._controllerIndex, false, {
							challengeID = var_88_0,
							skinLootId = arg_73_0._missionChallengeData.loot
						})
					end
				end
			end
		end
	end)
	arg_73_0.bindButton:addEventHandler("button_left_stick", function(arg_89_0, arg_89_1)
		if Dvar.IBEGCHEFE("OLNMSNSTKS") then
			LUI.FlowManager.RequestPopupMenu(arg_73_0, "CreatorCodePopup", true, arg_73_1, false, arg_73_2)
		end
	end)

	local function var_73_6()
		arg_73_0._numTransactionsComplete = arg_73_0._numTransactionsComplete + 1

		arg_73_0:dispatchEventToRoot({
			name = "update_battle_pass_purchasing_popup",
			progress = arg_73_0._numTransactionsComplete / arg_73_0._numTransactions
		})
	end

	arg_73_0.BillboardImg:SetHandleMouse(true)
	arg_73_0.BillboardImg:registerEventHandler("leftmousedown", function(arg_91_0, arg_91_1)
		return true
	end)
	arg_73_0.BillboardImg:registerEventHandler("leftmouseup", function(arg_92_0, arg_92_1)
		var_0_41(arg_73_0, arg_92_1)

		return true
	end)
	arg_73_0.bindButton:addEventHandler("button_alt1", function(arg_93_0, arg_93_1)
		if LUI.IsLastInputKeyboardMouse(arg_73_1) then
			if not arg_73_0._isAnimating then
				if LOOT.CanPreview(arg_73_0._currentChild.lootData.type, arg_73_0._currentChild.lootData.itemID) then
					STORE.PreviewItem(arg_73_1, arg_73_0._currentChild.lootData.type, arg_73_0._currentChild.lootData.itemID, nil, nil, true)
				end
			elseif arg_73_0._skipAnimationEnabled then
				arg_73_0._skipAnimation = true
			end
		else
			var_0_41(arg_73_0, arg_93_1)
		end
	end)
	arg_73_0.bindButton:addEventHandler("button_primary", function(arg_94_0, arg_94_1)
		if LUI.IsLastInputKeyboardMouse(arg_73_1) then
			var_0_41(arg_73_0, arg_94_1)
		end
	end)

	if arg_73_0.BattlePassPurchaseButton then
		arg_73_0.BattlePassPurchaseButton:addEventHandler("button_action", function(arg_95_0, arg_95_1)
			var_0_41(arg_73_0, arg_95_1)
		end)
	end

	arg_73_0:addEventHandler("loot_item_transaction_complete", function(arg_96_0, arg_96_1)
		var_73_6()

		arg_73_0._queuedRef = nil
	end)
	arg_73_0:addEventHandler("loot_item_transaction_error", function(arg_97_0, arg_97_1)
		if arg_97_1.errorCode == STORE.ProductNoLongerAvailableError then
			LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_73_1, false)
		end

		DebugPrint("BattlePass loot_item_transaction_error for ref: " .. arg_73_0._queuedRef)

		arg_73_0._purchaseEnabled = true
		arg_73_0._errorCode = BATTLEPASS.GetErrorCode(arg_97_1.name, arg_73_0._queuedRef)
	end)
	arg_73_0:addEventHandler("battlepass_activated", function(arg_98_0, arg_98_1)
		var_73_6()

		local var_98_0 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_73_0._queuedRef, CSV.battlePassIDs.cols.event)

		Battlepass.BHAGDBCJDJ(arg_73_0._controllerIndex, var_98_0)
	end)
	arg_73_0:addEventHandler("battlepass_activation_failed", function(arg_99_0, arg_99_1)
		DebugPrint("BattlePass battlepass_activation_failed for ref: " .. arg_73_0._queuedRef)

		arg_73_0._purchaseEnabled = true
		arg_73_0._errorCode = BATTLEPASS.GetErrorCode(arg_99_1.name, arg_73_0._queuedRef)
	end)
	arg_73_0:addEventHandler("battlepass_event_complete", function(arg_100_0, arg_100_1)
		DebugPrint("BattlePass battlepass_event_complete for ref: " .. arg_73_0._queuedRef)
		var_73_6()

		arg_73_0._battlePassOwned = BATTLEPASS.IsOwned(arg_73_0._controllerIndex)

		arg_73_0.BattlePassStatus:UpdateActiveBanner(arg_73_0._battlePassOwned)

		if tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_73_0._queuedRef, CSV.battlePassIDs.cols.type)) == BATTLEPASS.ItemTypes.TIER_SKIP and arg_100_1.controller then
			local var_100_0 = StringTable.BJJBBCJGEJ(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_73_0._queuedRef)
			local var_100_1 = CSV.ReadRowWithFile(CSV.battlePassIDs, CSV.battlePassIDs.file, var_100_0)
			local var_100_2 = tonumber(var_100_1.skips)
			local var_100_3 = arg_100_1.rank - var_100_2

			Engine.CEJJDJJHIJ(arg_100_1.controller, "dlog_event_bp_tier_up", {
				previous_bp_tier = var_100_3,
				new_bp_tier = arg_100_1.rank,
				reason = var_100_1.event
			})
		end

		if arg_73_0._activation then
			if arg_73_0._activation.id and arg_73_0._activation.count then
				if arg_73_0._activation.id == arg_73_0._activation.count then
					arg_73_0._queuedPurchase = nil
				end
			else
				arg_73_0._queuedPurchase = nil
			end
		end

		arg_73_0._queuedRef = nil
	end)
	arg_73_0:addEventHandler("battlepass_send_event_failed", function(arg_101_0, arg_101_1)
		DebugPrint("BattlePass battlepass_send_event_failed for ref: " .. arg_73_0._queuedRef)

		arg_73_0._errorCode = BATTLEPASS.GetErrorCode(arg_101_1.name, arg_73_0._queuedRef)
	end)

	local function var_73_7()
		LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup")

		arg_73_0._needFixUp = var_0_32(arg_73_0)
		arg_73_0._battlePassOwned = BATTLEPASS.IsOwned(arg_73_0._controllerIndex)
		arg_73_0._battlePassXP = BATTLEPASS.GetXP(arg_73_0._controllerIndex)

		if arg_73_0._fixingUp then
			arg_73_0._fixingUp = false

			arg_73_0:Wait(1, true)
		end
	end

	arg_73_0:addEventHandler("battlepass_fixup_complete", function(arg_103_0, arg_103_1)
		DebugPrint("BattlePass battlepass_fixup_complete")

		local var_103_0 = BATTLEPASS.IsOwned(arg_73_0._controllerIndex)
		local var_103_1 = BATTLEPASS.GetXP(arg_73_0._controllerIndex)
		local var_103_2 = arg_73_0._battlePassOwned ~= var_103_0
		local var_103_3 = arg_73_0._battlePassXP ~= var_103_1

		var_73_7()
		arg_73_0.BattlePassStatus:UpdateActiveBanner(var_103_0)

		local var_103_4

		if var_103_2 and var_103_3 then
			var_103_4 = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_TIER_BUNDLE_UNLOCKED
		elseif var_103_2 then
			var_103_4 = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_UNLOCKED
		else
			var_103_4 = BATTLEPASS.FullScreenPopupStates.TIERS_UNLOCKED
		end

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_73_0._controllerIndex, false, {
			state = var_103_4
		}, nil, false, true)

		local var_103_5

		local function var_103_6()
			arg_73_0:Wait(100).onComplete = function()
				if LUI.FlowManager.IsInStack("BattlePassFullScreenPopup") then
					var_103_6()
				else
					var_0_31(arg_73_0, var_103_3 and not var_103_2)
				end
			end
		end

		var_103_6()
	end)
	arg_73_0:addEventHandler("battlepass_fixup_failed", function(arg_106_0, arg_106_1)
		DebugPrint("BattlePass battlepass_fixup_failed")
		var_73_7()
		var_0_27(arg_73_0, Engine.CBBHFCGDIC("BATTLEPASS/FAILED_CLAIM", "BATTLEPASS/BATTLE_PASS_TOKENS"))
	end)

	local function var_73_8(arg_107_0, arg_107_1)
		if not arg_107_0._isAnimating then
			var_0_20(arg_107_0, true)
			arg_107_0.Grid:GainFocus(arg_107_1)
		end

		if LUI.IsLastInputKeyboardMouse(arg_107_1.controllerIndex) then
			arg_107_0.LeftArrow:SetAlpha(1)
			arg_107_0.RightArrow:SetAlpha(1)
			arg_107_0.ArrowLeft:SetAlpha(0)
			arg_107_0.ArrowRight:SetAlpha(0)
			arg_107_0.LeftPrompt:SetAlpha(0)
			arg_107_0.RightPrompt:SetAlpha(0)
		else
			arg_107_0.LeftArrow:SetAlpha(0)
			arg_107_0.RightArrow:SetAlpha(0)
			arg_107_0.ArrowLeft:SetAlpha(1)
			arg_107_0.ArrowRight:SetAlpha(1)
			arg_107_0.LeftPrompt:SetAlpha(1)
			arg_107_0.RightPrompt:SetAlpha(1)
		end
	end

	arg_73_0:registerAndCallEventHandler("update_input_type", var_73_8, {
		controllerIndex = arg_73_0._controllerIndex
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_73_0, arg_73_1)
	ACTIONS.ScaleFullscreen(arg_73_0.Background)

	local function var_73_9()
		local var_108_0 = CoD.GetAspectRatioScaleAdjust(0.65)

		arg_73_0.VignetteRight:SetScale(var_108_0)

		local var_108_1 = CoD.GetAspectRatioScaleAdjust(0.5)

		arg_73_0.VignetteLeft:SetScale(var_108_1)
	end

	arg_73_0:addAndCallEventHandler("onVideoChange", var_73_9)

	if IsLanguageArabic() then
		arg_73_0.Name:SetTracking(0, 0)
		ACTIONS.AnimateSequence(arg_73_0, "AR")
	elseif IsLanguageJapanese() then
		arg_73_0.WeaponDescription:SetScale(-0.05, 0)
	end

	arg_73_0:addEventHandler("gamepad_button", function(arg_109_0, arg_109_1)
		if arg_109_1.controller ~= arg_73_0._controllerIndex then
			if arg_109_1.button == "left" or arg_109_1.button == "right" or arg_109_1.button == "up" or arg_109_1.button == "down" then
				return true
			end
		elseif arg_109_1.down and not arg_73_0._isAnimating and (arg_109_1.button == "up" or arg_109_1.button == "down") then
			local var_109_0 = #arg_73_0._currentChild.itemData.lootTable

			if var_109_0 > 1 then
				if arg_109_1.button == "up" then
					if var_109_0 > arg_73_0._lootIndex then
						arg_73_0._lootIndex = arg_73_0._lootIndex + 1
					else
						arg_73_0._lootIndex = 1
					end
				elseif arg_109_1.button == "down" then
					if arg_73_0._lootIndex > 1 then
						arg_73_0._lootIndex = arg_73_0._lootIndex - 1
					else
						arg_73_0._lootIndex = var_109_0
					end
				end

				arg_73_0._currentChild:CycleLootCards(arg_73_0._lootIndex)
				var_0_43(arg_73_0._currentChild, arg_73_0, arg_73_0._currentChild.isLockedWithBattlePass, arg_73_0._isBattlePassPopup)
				var_0_22(arg_73_0)
			end
		end
	end)
	arg_73_0:addEventHandler("purchase_aar_battlepass", function(arg_110_0, arg_110_1)
		var_0_39(arg_73_0, arg_73_1)
	end)

	if arg_73_0._isBattlePassPopup then
		arg_73_0:addEventHandler("menu_create", function(arg_111_0, arg_111_1)
			var_0_22(arg_73_0)
		end)
	end
end

function BattlePassMenu(arg_112_0, arg_112_1)
	local var_112_0 = LUI.UIElement.new()

	var_112_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_112_0.id = "BattlePassMenu"
	var_112_0._animationSets = var_112_0._animationSets or {}
	var_112_0._sequences = var_112_0._sequences or {}

	local var_112_1 = arg_112_1 and arg_112_1.controllerIndex

	if not var_112_1 and not Engine.DDJFBBJAIG() then
		var_112_1 = var_112_0:getRootController()
	end

	assert(var_112_1)
	PreLoadFunc(var_112_0, var_112_1, arg_112_1)

	local var_112_2 = var_112_0
	local var_112_3
	local var_112_4 = LUI.UIImage.new()

	var_112_4.id = "Background"

	var_112_4:SetRGBFromInt(0, 0)
	var_112_4:SetAlpha(0.9, 0)
	var_112_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_112_0:addElement(var_112_4)

	var_112_0.Background = var_112_4

	local var_112_5
	local var_112_6 = LUI.UIImage.new()

	var_112_6.id = "BillboardImg"

	var_112_6:setImage(RegisterMaterial("mw_store_billboard_placeholder"), 0)
	var_112_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -341, _1080p * 239)
	var_112_0:addElement(var_112_6)

	var_112_0.BillboardImg = var_112_6

	local var_112_7
	local var_112_8 = LUI.UIImage.new()

	var_112_8.id = "CenterOutMask"

	var_112_8:SetAlpha(0, 0)
	var_112_8:setImage(RegisterMaterial("gradient_center_out"), 0)
	var_112_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 199, _1080p * 779)
	var_112_0:addElement(var_112_8)

	var_112_0.CenterOutMask = var_112_8

	local var_112_9
	local var_112_10 = LUI.UIImage.new()

	var_112_10.id = "FadeCover"

	var_112_10:SetRGBFromInt(0, 0)
	var_112_10:SetAlpha(0, 0)
	var_112_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -341, _1080p * 239)
	var_112_0:addElement(var_112_10)

	var_112_0.FadeCover = var_112_10

	local var_112_11
	local var_112_12 = LUI.UIImage.new()

	var_112_12.id = "VignetteRight"

	var_112_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_112_12:SetAlpha(0.3, 0)
	var_112_12:setImage(RegisterMaterial("gradient_curve"), 0)
	var_112_12:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -467, 0, 0)
	var_112_0:addElement(var_112_12)

	var_112_0.VignetteRight = var_112_12

	local var_112_13
	local var_112_14 = LUI.UIImage.new()

	var_112_14.id = "VignetteLeft"

	var_112_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_112_14:SetAlpha(0.9, 0)
	var_112_14:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_112_14:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1920, _1080p * -1030, 0, 0)
	var_112_0:addElement(var_112_14)

	var_112_0.VignetteLeft = var_112_14

	local var_112_15
	local var_112_16 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_112_1
	}
	local var_112_17 = MenuBuilder.BuildRegisteredType("IconImage", var_112_16)

	var_112_17.id = "LeftPrompt"

	var_112_17:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_112_17:setImage(RegisterMaterial("button_trigger_left"), 0)
	var_112_17:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -771, _1080p * -727, _1080p * -267, _1080p * -223)
	var_112_0:addElement(var_112_17)

	var_112_0.LeftPrompt = var_112_17

	local var_112_18
	local var_112_19 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_112_1
	}
	local var_112_20 = MenuBuilder.BuildRegisteredType("IconImage", var_112_19)

	var_112_20.id = "RightPrompt"

	var_112_20:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_112_20:setImage(RegisterMaterial("button_trigger_right"), 0)
	var_112_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 727, _1080p * 771, _1080p * -267, _1080p * -223)
	var_112_0:addElement(var_112_20)

	var_112_0.RightPrompt = var_112_20

	local var_112_21
	local var_112_22 = LUI.UIImage.new()

	var_112_22.id = "ArrowLeft"

	var_112_22:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_112_22:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_112_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -775, _1080p * -785, _1080p * -255, _1080p * -235)
	var_112_0:addElement(var_112_22)

	var_112_0.ArrowLeft = var_112_22

	local var_112_23
	local var_112_24 = LUI.UIImage.new()

	var_112_24.id = "ArrowRight"

	var_112_24:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_112_24:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_112_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 775, _1080p * 785, _1080p * -255, _1080p * -235)
	var_112_0:addElement(var_112_24)

	var_112_0.ArrowRight = var_112_24

	local var_112_25

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		var_112_25 = MenuBuilder.BuildRegisteredType("BattlePassPurchaseButton", {
			controllerIndex = var_112_1
		})
		var_112_25.id = "BattlePassPurchaseButton"

		var_112_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 572, _1080p * 413, _1080p * 613)
		var_112_0:addElement(var_112_25)

		var_112_0.BattlePassPurchaseButton = var_112_25
	end

	local var_112_26
	local var_112_27 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_112_1
	})

	var_112_27.id = "WeaponAttributes"

	var_112_27:SetAlpha(0, 0)
	var_112_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 508, _1080p * 433, _1080p * 593)
	var_112_0:addElement(var_112_27)

	var_112_0.WeaponAttributes = var_112_27

	local var_112_28
	local var_112_29 = LUI.UIStyledText.new()

	var_112_29.id = "QualityText"

	var_112_29:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE"), 0)
	var_112_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_112_29:SetWordWrap(false)
	var_112_29:SetAlignment(LUI.Alignment.Left)
	var_112_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_112_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 141, _1080p * 617, _1080p * 218, _1080p * 246)
	var_112_0:addElement(var_112_29)

	var_112_0.QualityText = var_112_29

	local var_112_30
	local var_112_31 = LUI.UIImage.new()

	var_112_31.id = "RarityIcon"

	var_112_31:setImage(RegisterMaterial("icon_rarity_4"), 0)
	var_112_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 128, _1080p * 216, _1080p * 248)
	var_112_0:addElement(var_112_31)

	var_112_0.RarityIcon = var_112_31

	local var_112_32
	local var_112_33 = LUI.UIStyledText.new()

	var_112_33.id = "WeaponDescription"

	var_112_33:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_112_33:SetAlpha(0, 0)
	var_112_33:setText("some random text here", 0)
	var_112_33:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_112_33:SetAlignment(LUI.Alignment.Left)
	var_112_33:SetOptOutRightToLeftAlignmentFlip(true)
	var_112_33:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_112_33:SetStartupDelay(1000)
	var_112_33:SetLineHoldTime(400)
	var_112_33:SetAnimMoveTime(1000)
	var_112_33:SetAnimMoveSpeed(150)
	var_112_33:SetEndDelay(1000)
	var_112_33:SetCrossfadeTime(1000)
	var_112_33:SetFadeInTime(300)
	var_112_33:SetFadeOutTime(300)
	var_112_33:SetMaxVisibleLines(2)
	var_112_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 572, _1080p * 319, _1080p * 341)
	var_112_0:addElement(var_112_33)

	var_112_0.WeaponDescription = var_112_33

	local var_112_34
	local var_112_35 = LUI.UIStyledText.new()

	var_112_35.id = "DetailsPrompt"

	var_112_35:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_112_35:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIEW_REWARD_DETAILS"), 0)
	var_112_35:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_112_35:SetWordWrap(false)
	var_112_35:SetAlignment(LUI.Alignment.Left)
	var_112_35:SetOptOutRightToLeftAlignmentFlip(true)
	var_112_35:SetTintFontIcons(true)
	var_112_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 472, _1080p * 319, _1080p * 341)
	var_112_0:addElement(var_112_35)

	var_112_0.DetailsPrompt = var_112_35

	local var_112_36
	local var_112_37 = LUI.UIStyledText.new()

	var_112_37.id = "DetailsPromptAttributesOpened"

	var_112_37:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_112_37:SetAlpha(0, 0)
	var_112_37:setText(Engine.CBBHFCGDIC("BATTLEPASS/HIDE_REWARD_DETAILS"), 0)
	var_112_37:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_112_37:SetWordWrap(false)
	var_112_37:SetAlignment(LUI.Alignment.Left)
	var_112_37:SetOptOutRightToLeftAlignmentFlip(true)
	var_112_37:SetTintFontIcons(true)
	var_112_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 472, _1080p * 586, _1080p * 608)
	var_112_0:addElement(var_112_37)

	var_112_0.DetailsPromptAttributesOpened = var_112_37

	local var_112_38
	local var_112_39 = MenuBuilder.BuildRegisteredType("BattlePassArrowKBM", {
		controllerIndex = var_112_1
	})

	var_112_39.id = "LeftArrow"

	var_112_39:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -830, _1080p * -690, _1080p * -370, _1080p * -120)
	var_112_0:addElement(var_112_39)

	var_112_0.LeftArrow = var_112_39

	local var_112_40
	local var_112_41 = MenuBuilder.BuildRegisteredType("BattlePassArrowKBM", {
		controllerIndex = var_112_1
	})

	var_112_41.id = "RightArrow"

	var_112_41.Arrow:SetZRotation(271, 0)
	var_112_41:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 691, _1080p * 831, _1080p * -370, _1080p * -120)
	var_112_0:addElement(var_112_41)

	var_112_0.RightArrow = var_112_41

	local var_112_42
	local var_112_43 = LUI.UIStyledText.new()

	var_112_43.id = "Name"

	var_112_43:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_112_43:setText(ToUpperCase("TITLE "), 0)
	var_112_43:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_112_43:SetWordWrap(false)
	var_112_43:SetTracking(5 * _1080p, 0)
	var_112_43:SetAlignment(LUI.Alignment.Left)
	var_112_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 249, _1080p * 319)
	var_112_0:addElement(var_112_43)

	var_112_0.Name = var_112_43

	local var_112_44
	local var_112_45 = LUI.UIImage.new()

	var_112_45.id = "BlueprintIcon"

	var_112_45:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_112_45:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_112_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 283, _1080p * 329, _1080p * 259, _1080p * 305)
	var_112_0:addElement(var_112_45)

	var_112_0.BlueprintIcon = var_112_45

	local var_112_46
	local var_112_47 = MenuBuilder.BuildRegisteredType("BattlePassStatus", {
		controllerIndex = var_112_1
	})

	var_112_47.id = "BattlePassStatus"

	var_112_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1388, _1080p * 1824, _1080p * 167, _1080p * 231)
	var_112_0:addElement(var_112_47)

	var_112_0.BattlePassStatus = var_112_47

	local var_112_48
	local var_112_49 = LUI.UIStyledText.new()

	var_112_49.id = "UnlockCriteria"

	var_112_49:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_112_49:SetAlpha(0, 0)
	var_112_49:setText("Rewarded with Battle Pass", 0)
	var_112_49:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_112_49:SetWordWrap(false)
	var_112_49:SetAlignment(LUI.Alignment.Left)
	var_112_49:SetOptOutRightToLeftAlignmentFlip(true)
	var_112_49:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_112_49:SetStartupDelay(1000)
	var_112_49:SetLineHoldTime(400)
	var_112_49:SetAnimMoveTime(1000)
	var_112_49:SetAnimMoveSpeed(150)
	var_112_49:SetEndDelay(1000)
	var_112_49:SetCrossfadeTime(250)
	var_112_49:SetFadeInTime(300)
	var_112_49:SetFadeOutTime(300)
	var_112_49:SetMaxVisibleLines(1)
	var_112_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 125, _1080p * 600, _1080p * 319, _1080p * 341)
	var_112_0:addElement(var_112_49)

	var_112_0.UnlockCriteria = var_112_49

	local var_112_50
	local var_112_51 = LUI.UIImage.new()

	var_112_51.id = "LockIcon"

	var_112_51:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_112_51:SetAlpha(0, 0)
	var_112_51:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_112_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 121, _1080p * 317, _1080p * 343)
	var_112_0:addElement(var_112_51)

	var_112_0.LockIcon = var_112_51

	local var_112_52
	local var_112_53 = MenuBuilder.BuildRegisteredType("BattlePassMissionTag", {
		controllerIndex = var_112_1
	})

	var_112_53.id = "MissionTag"

	var_112_53:SetAlpha(0, 0)
	var_112_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 315, _1080p * 375)
	var_112_0:addElement(var_112_53)

	var_112_0.MissionTag = var_112_53

	local var_112_54
	local var_112_55 = MenuBuilder.BuildRegisteredType("BattlePassPurchaseBackground", {
		controllerIndex = var_112_1
	})

	var_112_55.id = "TierPurchaseBG"

	var_112_55:SetAlpha(0, 0)
	var_112_55:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_112_0:addElement(var_112_55)

	var_112_0.TierPurchaseBG = var_112_55

	local var_112_56
	local var_112_57 = LUI.UIText.new()

	var_112_57.id = "PromptContainer"

	var_112_57:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_112_57:setText("", 0)
	var_112_57:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_112_57:SetWordWrap(false)
	var_112_57:SetAlignment(LUI.Alignment.Left)
	var_112_57:SetOptOutRightToLeftAlignmentFlip(true)
	var_112_57:SetTintFontIcons(true)
	var_112_57:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 260, _1080p * -1348, _1080p * -109, _1080p * -85)
	var_112_0:addElement(var_112_57)

	var_112_0.PromptContainer = var_112_57

	local var_112_58
	local var_112_59 = MenuBuilder.BuildRegisteredType("BattlePassGridContainer", {
		controllerIndex = var_112_1
	})

	var_112_59.id = "BattlePassGridContainer"

	var_112_59:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -700, _1080p * 700, _1080p * -540, _1080p * -82)
	var_112_0:addElement(var_112_59)

	var_112_0.BattlePassGridContainer = var_112_59

	local var_112_60
	local var_112_61 = MenuBuilder.BuildRegisteredType("SupportingCreatorCode", {
		controllerIndex = var_112_1
	})

	var_112_61.id = "SupportingCreatorCode"

	var_112_61:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1162, _1080p * 1522, _1080p * 172, _1080p * 196)
	var_112_0:addElement(var_112_61)

	var_112_0.SupportingCreatorCode = var_112_61

	local var_112_62
	local var_112_63 = MenuBuilder.BuildRegisteredType("SpecialWeaponAttributeWithText", {
		controllerIndex = var_112_1
	})

	var_112_63.id = "SpecialWeaponAttributeWithText"

	var_112_63:SetAlpha(0, 0)
	var_112_63.Title:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_112_63:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 315, _1080p * 347)
	var_112_0:addElement(var_112_63)

	var_112_0.SpecialWeaponAttributeWithText = var_112_63

	local function var_112_64()
		return
	end

	var_112_0._sequences.DefaultSequence = var_112_64

	local var_112_65

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_66 = {
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("WeaponPreview", var_112_66)
	end

	local var_112_67 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 304
		}
	}

	var_112_27:RegisterAnimationSequence("WeaponPreview", var_112_67)

	local var_112_68 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 341,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BodyRegular.File,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319,
			easing = LUI.EASING.snap
		}
	}

	var_112_33:RegisterAnimationSequence("WeaponPreview", var_112_68)

	local var_112_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_REWARD_DETAILS")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 341
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_35:RegisterAnimationSequence("WeaponPreview", var_112_69)

	local var_112_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_37:RegisterAnimationSequence("WeaponPreview", var_112_70)

	local var_112_71 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 358
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		}
	}

	var_112_49:RegisterAnimationSequence("WeaponPreview", var_112_71)

	local var_112_72 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 356
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 382
		}
	}

	var_112_51:RegisterAnimationSequence("WeaponPreview", var_112_72)

	local var_112_73 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_53:RegisterAnimationSequence("WeaponPreview", var_112_73)

	local var_112_74 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_63:RegisterAnimationSequence("WeaponPreview", var_112_74)

	local function var_112_75()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("WeaponPreview")
		end

		var_112_27:AnimateSequence("WeaponPreview")
		var_112_33:AnimateSequence("WeaponPreview")
		var_112_35:AnimateSequence("WeaponPreview")
		var_112_37:AnimateSequence("WeaponPreview")
		var_112_49:AnimateSequence("WeaponPreview")
		var_112_51:AnimateSequence("WeaponPreview")
		var_112_53:AnimateSequence("WeaponPreview")
		var_112_63:AnimateSequence("WeaponPreview")
	end

	var_112_0._sequences.WeaponPreview = var_112_75

	local var_112_76

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_77 = {
			{
				value = 0,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("WeaponDetails", var_112_77)
	end

	local var_112_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 360
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 412
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 572
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_27:RegisterAnimationSequence("WeaponDetails", var_112_78)

	local var_112_79 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_33:RegisterAnimationSequence("WeaponDetails", var_112_79)

	local var_112_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_35:RegisterAnimationSequence("WeaponDetails", var_112_80)

	local var_112_81 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_37:RegisterAnimationSequence("WeaponDetails", var_112_81)

	local var_112_82 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 377
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 397
		}
	}

	var_112_49:RegisterAnimationSequence("WeaponDetails", var_112_82)

	local var_112_83 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 375
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 401
		}
	}

	var_112_51:RegisterAnimationSequence("WeaponDetails", var_112_83)

	local var_112_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_53:RegisterAnimationSequence("WeaponDetails", var_112_84)

	local var_112_85 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_63:RegisterAnimationSequence("WeaponDetails", var_112_85)

	local function var_112_86()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("WeaponDetails")
		end

		var_112_27:AnimateSequence("WeaponDetails")
		var_112_33:AnimateSequence("WeaponDetails")
		var_112_35:AnimateSequence("WeaponDetails")
		var_112_37:AnimateSequence("WeaponDetails")
		var_112_49:AnimateSequence("WeaponDetails")
		var_112_51:AnimateSequence("WeaponDetails")
		var_112_53:AnimateSequence("WeaponDetails")
		var_112_63:AnimateSequence("WeaponDetails")
	end

	var_112_0._sequences.WeaponDetails = var_112_86

	local var_112_87

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_88 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("ItemPreview", var_112_88)
	end

	local var_112_89 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 304
		}
	}

	var_112_27:RegisterAnimationSequence("ItemPreview", var_112_89)

	local var_112_90 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_33:RegisterAnimationSequence("ItemPreview", var_112_90)

	local var_112_91 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_35:RegisterAnimationSequence("ItemPreview", var_112_91)

	local var_112_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_37:RegisterAnimationSequence("ItemPreview", var_112_92)

	local var_112_93 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 325
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 345
		}
	}

	var_112_49:RegisterAnimationSequence("ItemPreview", var_112_93)

	local var_112_94 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 323
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 349
		}
	}

	var_112_51:RegisterAnimationSequence("ItemPreview", var_112_94)

	local var_112_95 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_53:RegisterAnimationSequence("ItemPreview", var_112_95)

	local var_112_96 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_63:RegisterAnimationSequence("ItemPreview", var_112_96)

	local function var_112_97()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("ItemPreview")
		end

		var_112_27:AnimateSequence("ItemPreview")
		var_112_33:AnimateSequence("ItemPreview")
		var_112_35:AnimateSequence("ItemPreview")
		var_112_37:AnimateSequence("ItemPreview")
		var_112_49:AnimateSequence("ItemPreview")
		var_112_51:AnimateSequence("ItemPreview")
		var_112_53:AnimateSequence("ItemPreview")
		var_112_63:AnimateSequence("ItemPreview")
	end

	var_112_0._sequences.ItemPreview = var_112_97

	local var_112_98

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_99 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("MissionPreview", var_112_99)
	end

	local var_112_100 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 304
		}
	}

	var_112_27:RegisterAnimationSequence("MissionPreview", var_112_100)

	local var_112_101 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 341
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_33:RegisterAnimationSequence("MissionPreview", var_112_101)

	local var_112_102 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 341
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319
		}
	}

	var_112_35:RegisterAnimationSequence("MissionPreview", var_112_102)

	local var_112_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_37:RegisterAnimationSequence("MissionPreview", var_112_103)

	local var_112_104 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 383
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 403
		}
	}

	var_112_49:RegisterAnimationSequence("MissionPreview", var_112_104)

	local var_112_105 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 380
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406
		}
	}

	var_112_51:RegisterAnimationSequence("MissionPreview", var_112_105)

	local var_112_106 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_63:RegisterAnimationSequence("MissionPreview", var_112_106)

	local function var_112_107()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("MissionPreview")
		end

		var_112_27:AnimateSequence("MissionPreview")
		var_112_33:AnimateSequence("MissionPreview")
		var_112_35:AnimateSequence("MissionPreview")
		var_112_37:AnimateSequence("MissionPreview")
		var_112_49:AnimateSequence("MissionPreview")
		var_112_51:AnimateSequence("MissionPreview")
		var_112_63:AnimateSequence("MissionPreview")
	end

	var_112_0._sequences.MissionPreview = var_112_107

	local var_112_108
	local var_112_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_4:RegisterAnimationSequence("SetupStandalone", var_112_109)

	local var_112_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 290
		}
	}

	var_112_6:RegisterAnimationSequence("SetupStandalone", var_112_110)

	local var_112_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 830
		}
	}

	var_112_8:RegisterAnimationSequence("SetupStandalone", var_112_111)

	local var_112_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 290
		}
	}

	var_112_10:RegisterAnimationSequence("SetupStandalone", var_112_112)

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_113 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("SetupStandalone", var_112_113)
	end

	local var_112_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 282
		}
	}

	var_112_47:RegisterAnimationSequence("SetupStandalone", var_112_114)

	local function var_112_115()
		var_112_4:AnimateSequence("SetupStandalone")
		var_112_6:AnimateSequence("SetupStandalone")
		var_112_8:AnimateSequence("SetupStandalone")
		var_112_10:AnimateSequence("SetupStandalone")

		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("SetupStandalone")
		end

		var_112_47:AnimateSequence("SetupStandalone")
	end

	var_112_0._sequences.SetupStandalone = var_112_115

	local var_112_116
	local var_112_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 283
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 329
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 259
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_blueprint")
		}
	}

	var_112_45:RegisterAnimationSequence("IsBlueprint", var_112_117)

	local function var_112_118()
		var_112_45:AnimateSequence("IsBlueprint")
	end

	var_112_0._sequences.IsBlueprint = var_112_118

	local var_112_119

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_120 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("ConsumablePreview", var_112_120)
	end

	local var_112_121 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 304
		}
	}

	var_112_27:RegisterAnimationSequence("ConsumablePreview", var_112_121)

	local var_112_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 343
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_33:RegisterAnimationSequence("ConsumablePreview", var_112_122)

	local var_112_123 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_35:RegisterAnimationSequence("ConsumablePreview", var_112_123)

	local var_112_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_37:RegisterAnimationSequence("ConsumablePreview", var_112_124)

	local var_112_125 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 358
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		}
	}

	var_112_49:RegisterAnimationSequence("ConsumablePreview", var_112_125)

	local var_112_126 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 356
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 382
		}
	}

	var_112_51:RegisterAnimationSequence("ConsumablePreview", var_112_126)

	local var_112_127 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_53:RegisterAnimationSequence("ConsumablePreview", var_112_127)

	local var_112_128 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_63:RegisterAnimationSequence("ConsumablePreview", var_112_128)

	local function var_112_129()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("ConsumablePreview")
		end

		var_112_27:AnimateSequence("ConsumablePreview")
		var_112_33:AnimateSequence("ConsumablePreview")
		var_112_35:AnimateSequence("ConsumablePreview")
		var_112_37:AnimateSequence("ConsumablePreview")
		var_112_49:AnimateSequence("ConsumablePreview")
		var_112_51:AnimateSequence("ConsumablePreview")
		var_112_53:AnimateSequence("ConsumablePreview")
		var_112_63:AnimateSequence("ConsumablePreview")
	end

	var_112_0._sequences.ConsumablePreview = var_112_129

	local var_112_130
	local var_112_131 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_49:RegisterAnimationSequence("IsLocked", var_112_131)

	local var_112_132 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_51:RegisterAnimationSequence("IsLocked", var_112_132)

	local function var_112_133()
		var_112_49:AnimateSequence("IsLocked")
		var_112_51:AnimateSequence("IsLocked")
	end

	var_112_0._sequences.IsLocked = var_112_133

	local var_112_134
	local var_112_135 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 339,
			easing = LUI.EASING.snap
		}
	}

	var_112_49:RegisterAnimationSequence("NotLocked", var_112_135)

	local var_112_136 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 317,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 343,
			easing = LUI.EASING.snap
		}
	}

	var_112_51:RegisterAnimationSequence("NotLocked", var_112_136)

	local function var_112_137()
		var_112_49:AnimateSequence("NotLocked")
		var_112_51:AnimateSequence("NotLocked")
	end

	var_112_0._sequences.NotLocked = var_112_137

	local var_112_138
	local var_112_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 338
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_icon_weapon_glint")
		}
	}

	var_112_45:RegisterAnimationSequence("IsBaseWeapon", var_112_139)

	local function var_112_140()
		var_112_45:AnimateSequence("IsBaseWeapon")
	end

	var_112_0._sequences.IsBaseWeapon = var_112_140

	local var_112_141
	local var_112_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_112_33:RegisterAnimationSequence("AR", var_112_142)

	local var_112_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 612
		}
	}

	var_112_37:RegisterAnimationSequence("AR", var_112_143)

	local function var_112_144()
		var_112_33:AnimateSequence("AR")
		var_112_37:AnimateSequence("AR")
	end

	var_112_0._sequences.AR = var_112_144

	local var_112_145

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
		local var_112_146 = {
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_112_25:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_146)
	end

	local var_112_147 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 304
		}
	}

	var_112_27:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_147)

	local var_112_148 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 341,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BodyRegular.File,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319,
			easing = LUI.EASING.snap
		}
	}

	var_112_33:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_148)

	local var_112_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_REWARD_DETAILS")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 353
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 375
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_35:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_149)

	local var_112_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_37:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_150)

	local var_112_151 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 383
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 403
		}
	}

	var_112_49:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_151)

	local var_112_152 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 407
		}
	}

	var_112_51:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_152)

	local var_112_153 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_53:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_153)

	local var_112_154 = {
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 347
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 315
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_112_63:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_112_154)

	local function var_112_155()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_112_0) then
			var_112_25:AnimateSequence("WeaponPreviewWithAttribute")
		end

		var_112_27:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_33:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_35:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_37:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_49:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_51:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_53:AnimateSequence("WeaponPreviewWithAttribute")
		var_112_63:AnimateSequence("WeaponPreviewWithAttribute")
	end

	var_112_0._sequences.WeaponPreviewWithAttribute = var_112_155

	var_0_48(var_112_0, var_112_1, arg_112_1)

	return var_112_0
end

MenuBuilder.registerType("BattlePassMenu", BattlePassMenu)
LockTable(_M)
