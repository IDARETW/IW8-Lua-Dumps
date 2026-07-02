module(..., package.seeall)

local var_0_0 = 150
local var_0_1 = var_0_0 + 50
local var_0_2 = 9
local var_0_3 = 5
local var_0_4 = 4
local var_0_5 = 500
local var_0_6 = 3600
local var_0_7 = 5
local var_0_8 = 10
local var_0_9 = 20
local var_0_10 = "battlePassError"
local var_0_11 = {
	100,
	50,
	20,
	10,
	5,
	2,
	1
}
local var_0_12 = {
	[100] = "battlepass_skip100",
	[10] = "battlepass_skip10",
	[1] = "battlepass_skip1",
	[5] = "battlepass_skip5",
	[50] = "battlepass_skip50",
	[20] = "battlepass_skip20",
	[2] = "battlepass_skip2"
}
local var_0_13 = {
	REDEEMING = 3,
	UPSELLING = 5,
	ONBOARDING_PT1 = 2,
	PENDING = 1,
	ONBOARDING_PT2 = 4,
	NONE = 0
}

local function var_0_14(arg_1_0)
	return arg_1_0 and arg_1_0.itemData or nil
end

local function var_0_15(arg_2_0, arg_2_1)
	if arg_2_0 and arg_2_0.lootTable and arg_2_1 and arg_2_1 > 0 then
		return arg_2_0.lootTable[arg_2_1]
	end

	return nil
end

local function var_0_16(arg_3_0, arg_3_1)
	local var_3_0 = var_0_14(arg_3_0)

	return var_0_15(var_3_0, arg_3_1)
end

local function var_0_17(arg_4_0, arg_4_1)
	arg_4_0.LeftArrow:SetAlpha(0)
	arg_4_0.RightArrow:SetAlpha(0)
	arg_4_0.LeftPrompt:SetAlpha(0)
	arg_4_0.RightPrompt:SetAlpha(0)
end

local function var_0_18(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:Wait(arg_5_2).onComplete = function()
		local var_6_0, var_6_1, var_6_2, var_6_3 = arg_5_0:getLocalRect()

		arg_5_0:SetBottom(var_6_1 + arg_5_1 * _1080p, 0)
	end
end

local function var_0_19(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.WeaponAttributes then
		arg_7_0.WeaponAttributes:SetAlpha(0)

		if arg_7_1 == LOOT.itemTypes.WEAPON and arg_7_2 and #arg_7_2 > 0 then
			local var_7_0
			local var_7_1
			local var_7_2 = LOOT.GetItemRef(arg_7_1, arg_7_2)

			if var_7_2 and #var_7_2 > 0 then
				var_7_0 = WEAPON.GenerateWeaponTableFromRef(var_7_2)

				local var_7_3 = WEAPON.GetVariantRef(arg_7_2)

				if var_7_3 and #var_7_3 > 0 then
					local var_7_4 = WEAPON.GetVariantFile(var_7_2)
					local var_7_5 = StringTable.BJJBBCJGEJ(var_7_4, CSV.weaponVariants.cols.ref, var_7_3)
					local var_7_6 = CSV.ReadRowWithFile(CSV.weaponVariants, var_7_4, var_7_5)

					var_7_1 = WEAPON.GetLootModTable(arg_7_0._controllerIndex, var_7_2, arg_7_2, var_7_6)
				end
			end

			if var_7_0 and var_7_1 and var_7_1.attachments and #var_7_1.attachments >= 0 then
				arg_7_0.WeaponAttributes:Setup(var_7_1, var_7_2, var_7_0)
			end
		end
	end
end

local function var_0_20(arg_8_0)
	local var_8_0 = arg_8_0:GetCurrentMenu(arg_8_0)

	if var_8_0.MPTabsMenu and var_8_0.MPTabsMenu.UpdateTabBreadcrumbs then
		var_8_0.MPTabsMenu:UpdateTabBreadcrumbs(arg_8_0._controllerIndex)
	end
end

local function var_0_21(arg_9_0, arg_9_1)
	local var_9_0 = LOOT.GetRarityColor(tonumber(arg_9_1.rarity))
	local var_9_1 = LOOT.GetLootQualityString(tonumber(arg_9_1.rarity))
	local var_9_2 = arg_9_1.type == LOOT.itemTypes.CONSUMABLE
	local var_9_3 = arg_9_1.className

	if arg_9_1.type == LOOT.itemTypes.WEAPON then
		if arg_9_1.IsVariant then
			local var_9_4 = WEAPON.GetSubClass(arg_9_1.ref)

			var_9_3 = Engine.CBBHFCGDIC("BATTLEPASS/BLUEPRINT_WITH_TYPE", var_9_4)
		else
			var_9_3 = "LOOT_MP/ITEM_TYPE_WEAPON"
		end
	elseif arg_9_1.type == LOOT.itemTypes.FEATURE then
		if arg_9_1.amount or arg_9_1.duration then
			var_9_3 = "LOOT_MP/CONSUMABLE"
			var_9_2 = true
		elseif arg_9_1.isOperatorChallenge then
			var_9_3 = "LUA_MENU/OPERATOR_MISSIONS"
		end
	end

	arg_9_0.QualityText:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE", var_9_1, var_9_3))
	arg_9_0.QualityText:SetRGBFromTable(var_9_0)

	local var_9_5 = var_0_16(arg_9_0._currentChild, arg_9_0._lootIndex)
	local var_9_6 = var_9_5._gameSourceId
	local var_9_7 = var_9_5.lootID
	local var_9_8

	var_9_8 = var_9_7 == LOOT.COD_POINTS_ITEM_ID

	if not var_9_2 and arg_9_1.type ~= LOOT.itemTypes.FEATURE then
		if var_9_7 then
			local var_9_9 = LOOT.GetGameSourceExclusivityByItemID(var_9_5.lootID)

			arg_9_0.ExclusiveSnipeIcon:UpdateExclusiveSnipeIcon({
				selected = true,
				gameSourceExclusivityID = var_9_9
			})
		else
			arg_9_0.ExclusiveSnipeIcon:UpdateExclusiveSnipeIcon({
				selected = true,
				isExclusive = true,
				gameSourceID = var_9_6
			})
		end
	else
		ACTIONS.AnimateSequence(arg_9_0.ExclusiveSnipeIcon, "Hide")
	end

	local var_9_10 = LAYOUT.GetTextWidth(arg_9_0.QualityText)
	local var_9_11, var_9_12, var_9_13, var_9_14 = arg_9_0.QualityText:getLocalRect()
	local var_9_15 = 70 * _1080p

	arg_9_0.ExclusiveSnipeIcon:SetLeft(var_9_11 + var_9_10 + var_9_15)
	arg_9_0.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(tonumber(arg_9_1.rarity))))
	LOOT.ApplyRarityIconColoring(arg_9_0.RarityIcon, tonumber(arg_9_1.rarity))
end

local function var_0_22(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = 26

	if arg_10_1.type == LOOT.itemTypes.WEAPON then
		if arg_10_3 then
			arg_10_0.WeaponDescription:setText(WEAPON.GetDesc(arg_10_1.ref))
			var_0_19(arg_10_0, arg_10_1.type, arg_10_1.itemID)
			ACTIONS.AnimateSequence(arg_10_0, "WeaponDetails")

			if arg_10_0.BattlePassPurchaseButton then
				arg_10_0.BattlePassPurchaseButton._showTooltip = false

				arg_10_0.BattlePassPurchaseButton:UpdateTooltip()
			end

			if IsLanguageArabic() then
				local var_10_1 = 180

				var_0_18(arg_10_0.UnlockCriteria, var_10_0, var_10_1)
				var_0_18(arg_10_0.DetailsPrompt, var_10_0, var_10_1)
				var_0_18(arg_10_0.WeaponDescription, var_10_0, var_10_1)
			end
		else
			if arg_10_0.SpecialWeaponAttributeWithText:SetupWeaponAttribute(arg_10_1.itemID) then
				ACTIONS.AnimateSequence(arg_10_0, "WeaponPreviewWithAttribute")
			else
				ACTIONS.AnimateSequence(arg_10_0, "WeaponPreview")
			end

			if arg_10_0.BattlePassPurchaseButton then
				arg_10_0.BattlePassPurchaseButton._showTooltip = true

				arg_10_0.BattlePassPurchaseButton:UpdateTooltip()
			end

			if IsLanguageArabic() then
				local var_10_2 = 180

				var_0_18(arg_10_0.UnlockCriteria, var_10_0, var_10_2)
				var_0_18(arg_10_0.DetailsPrompt, var_10_0, var_10_2)
			end
		end
	elseif arg_10_2 and arg_10_2.lootTable[arg_10_0._lootIndex].challengeID and arg_10_2.lootTable[arg_10_0._lootIndex].challengeID ~= "" then
		local var_10_3 = Challenge.GetNameFromRef(arg_10_2.lootTable[arg_10_0._lootIndex].challengeID, Challenge.Type.MISSION)

		if var_10_3 then
			arg_10_0.MissionTag:SetupMissionTag(arg_10_1.rarityColor, var_10_3)
			arg_10_0.MissionTag:SetAlpha(0, 0)
			arg_10_0.MissionTag:SetAlpha(1, 150)
		else
			arg_10_0.MissionTag:SetAlpha(0, 150)
		end

		ACTIONS.AnimateSequence(arg_10_0, "MissionPreview")

		if IsLanguageArabic() then
			local var_10_4 = 180

			var_0_18(arg_10_0.UnlockCriteria, var_10_0, var_10_4)
		end
	elseif arg_10_1.type == LOOT.itemTypes.CONSUMABLE then
		arg_10_0.WeaponDescription:setText(arg_10_1.duration)
		ACTIONS.AnimateSequence(arg_10_0, "ConsumablePreview")

		if IsLanguageArabic() then
			local var_10_5 = 180

			var_0_18(arg_10_0.UnlockCriteria, var_10_0, var_10_5)
			var_0_18(arg_10_0.WeaponDescription, var_10_0 + 8, var_10_5)
		end
	elseif arg_10_1.type == LOOT.itemTypes.FEATURE then
		arg_10_0.WeaponDescription:setText(LOOT.GetFeatureItemDesc(arg_10_1.ref))
		ACTIONS.AnimateSequence(arg_10_0, "ConsumablePreview")

		if IsLanguageArabic() then
			local var_10_6 = 180

			var_0_18(arg_10_0.UnlockCriteria, var_10_0, var_10_6)
			var_0_18(arg_10_0.WeaponDescription, var_10_0 + 8, var_10_6)
		end
	else
		ACTIONS.AnimateSequence(arg_10_0, "ItemPreview")

		if IsLanguageArabic() then
			local var_10_7 = 180

			var_0_18(arg_10_0.UnlockCriteria, var_10_0, var_10_7)
		end
	end

	if arg_10_0._isStandalone and arg_10_0.BattlePassPurchaseButton then
		arg_10_0.BattlePassPurchaseButton:SetAlpha(0)
		arg_10_0.BattlePassPurchaseButton:SetFocusable(false)
	end
end

local function var_0_23(arg_11_0, arg_11_1)
	if arg_11_1.controller == arg_11_0._controllerIndex then
		if arg_11_0._currentChild then
			arg_11_0._isExpanded = not arg_11_0._isExpanded

			local var_11_0 = var_0_14(arg_11_0._currentChild)

			var_0_22(arg_11_0, arg_11_0._currentChild.lootData, var_11_0, arg_11_0._isExpanded)

			if arg_11_0._currentChild.lootData.type == LOOT.itemTypes.WEAPON then
				Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
			end
		end

		if arg_11_0._missionChallengeID then
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

			if not arg_11_0._missionChallengeData then
				if Engine.BHICADFIHA() then
					LUI.FlowManager.RequestPopupMenu(arg_11_0, "PopupOK", true, arg_11_1.controller, false, {
						message = "Could not get missionChallengeData, likely missing SkinID for missionChallenge: " .. arg_11_0._missionChallengeID
					})
				else
					arg_11_0:OpenBattlePassPopup()
					assert(false, "[BattlePassMenu] Error: Could not get missionChallengeData, likely missing SkinID for missionChallenge: " .. arg_11_0._missionChallengeID)
				end

				return
			end

			if arg_11_0._missionChallengeData.category == "OPERATOR" then
				local var_11_1 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_11_0._missionChallengeID, CSV.questChallenges.cols.id)

				if var_11_1 and #var_11_1 > 0 then
					LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_11_0._controllerIndex, false, {
						singleMissionOverride = true,
						challengeID = var_11_1,
						skinLootId = arg_11_0._missionChallengeData.loot
					})
				end
			end
		end
	end
end

local function var_0_24(arg_12_0, arg_12_1)
	if Dvar.IBEGCHEFE("OLNMSNSTKS") then
		LUI.FlowManager.RequestPopupMenu(arg_12_0, "CreatorCodePopup", true, arg_12_1.controller, false, options)
	end
end

local function var_0_25(arg_13_0, arg_13_1)
	if not arg_13_0._isAnimating then
		Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

		if arg_13_0._battlePassOwned then
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_13_0._controllerIndex, false, {
				skipDelay = true
			})
		else
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_13_0._controllerIndex, false, {
				skipDelay = true,
				closeAction = OpenUpsellPopup,
				menu = arg_13_0
			})
		end
	end
end

local function var_0_26(arg_14_0)
	arg_14_0.bindButton:processEvent({
		name = "button_alt2"
	})
end

local function var_0_27(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.lootData
	local var_15_1 = var_15_0 and var_15_0.isOperatorChallengeReward
	local var_15_2 = arg_15_1._tierType and tonumber(arg_15_1._tierType) == BATTLEPASS.ItemTypes.CLAN

	if var_15_1 then
		if var_15_0 and var_15_0.isLocked then
			local var_15_3 = var_15_0.operatorChallengeName or ""

			arg_15_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/OPERATOR_CHALLENGE_UNLOCK_MESSAGE", var_15_3))
			ACTIONS.AnimateSequence(arg_15_0, "IsLocked")
		else
			ACTIONS.AnimateSequence(arg_15_0, "NotLocked")
		end
	elseif arg_15_1._isLocked then
		if not arg_15_1._isOwned and arg_15_1._level ~= nil then
			if var_15_2 then
				arg_15_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_WITH_CLAN"))
			elseif arg_15_0._battlePassOwned then
				arg_15_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE", arg_15_1._level))
			else
				arg_15_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", arg_15_1._level))
			end
		elseif arg_15_1._isBundleBonus then
			arg_15_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_WITH_BATTLEPASS_BUNDLE"))
		else
			arg_15_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_WITH_BATTLEPASS"))
		end

		ACTIONS.AnimateSequence(arg_15_0, "IsLocked")
	else
		ACTIONS.AnimateSequence(arg_15_0, "NotLocked")
	end
end

local function var_0_28(arg_16_0)
	local var_16_0 = {
		leftOffset = arg_16_0.Name:GetCurrentAnchorsAndPositions().left,
		nameWidth = LAYOUT.GetRawTextWidth(arg_16_0.Name, var_0_7, arg_16_0._controllerIndex)
	}

	var_16_0.bluePrintIconWidth = 0

	return var_16_0
end

local function var_0_29(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1.type == LOOT.itemTypes.WEAPON then
		ACTIONS.AnimateSequence(arg_17_0, arg_17_1.IsVariant and "IsBlueprint" or "IsBaseWeapon")

		local var_17_0 = arg_17_0._delayBlueprintIcon and 1 or 0

		arg_17_2.bluePrintIconWidth = LAYOUT.GetElementWidth(arg_17_0.BlueprintIcon) / _1080p

		local var_17_1 = (arg_17_2.nameWidth + var_0_8) * _1080p + arg_17_2.leftOffset
		local var_17_2 = var_17_1 + arg_17_2.bluePrintIconWidth * _1080p

		arg_17_0.BlueprintIcon:SetLeft(var_17_1, var_17_0)
		arg_17_0.BlueprintIcon:SetRight(var_17_2, var_17_0)
		arg_17_0.BlueprintIcon:SetAlpha(1, var_17_0)
	else
		arg_17_0.BlueprintIcon:SetAlpha(0)
	end
end

local function var_0_30(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = 180

	if LOOT.HasReactiveCamo(arg_18_1.itemID) then
		local var_18_1 = arg_18_2.bluePrintIconWidth
		local var_18_2 = var_0_9 + (var_18_1 ~= 0 and var_0_8 or 0)
		local var_18_3 = arg_18_2.leftOffset + arg_18_2.nameWidth + var_18_1 + var_18_2
		local var_18_4 = var_18_3 + var_18_0

		arg_18_0.ReactiveIcon:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_18_3, _1080p * var_18_4, _1080p * 244, _1080p * 324)
		arg_18_0.ReactiveIcon:SetAlpha(1)
	else
		arg_18_0.ReactiveIcon:SetAlpha(0)
	end
end

local function var_0_31(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.lootData

	if not (var_19_0 and next(var_19_0) ~= nil) then
		return
	end

	arg_19_0.Name:setText(ToUpperCase(var_19_0.name or ""))

	local var_19_1 = var_0_28(arg_19_0)

	var_0_21(arg_19_0, var_19_0)
	var_0_29(arg_19_0, var_19_0, var_19_1)
	var_0_30(arg_19_0, var_19_0, var_19_1)
	var_0_22(arg_19_0, var_19_0, var_0_14(arg_19_1), false)
end

local function var_0_32(arg_20_0, arg_20_1)
	arg_20_0._isExpanded = false

	local var_20_0 = var_0_14(arg_20_1)

	if not (var_20_0 and next(var_20_0) ~= nil) then
		return
	end

	arg_20_0._billboardMaterial = nil

	local var_20_1 = var_20_0.lootTable[arg_20_0._lootIndex].billboardImage

	if var_20_1 and #var_20_1 > 0 then
		arg_20_0._billboardMaterial = RegisterMaterial(var_20_1)
	end

	if arg_20_0.BillboardImg:GetImage() == arg_20_0._billboardMaterial then
		var_0_31(arg_20_0, arg_20_1)

		return
	end

	arg_20_0._itemSelectionComplete = false
	arg_20_0.Background:Wait(var_0_0 - 10, true).onComplete = function()
		arg_20_0._itemSelectionComplete = true
	end

	assert(arg_20_0.FadeCover)

	local var_20_2 = arg_20_0._itemSelectionComplete and var_0_0 or 10

	if not arg_20_0._prevImage then
		var_20_2 = 0
	end

	arg_20_0.FadeCover:SetAlpha(1, var_20_2, LUI.EASING.inQuadratic)

	arg_20_0.FadeCover:Wait(var_0_0, true).onComplete = function()
		if arg_20_0._itemSelectionComplete then
			assert(arg_20_0.BillboardImg)

			if arg_20_0._billboardMaterial then
				arg_20_0.BillboardImg:setImage(arg_20_0._billboardMaterial)
				arg_20_0.BillboardImg:SetAlpha(1)
			else
				arg_20_0.BillboardImg:SetAlpha(0)
			end

			arg_20_0.FadeCover:SetAlpha(0, var_0_1, LUI.EASING.outQuadratic)

			arg_20_0._prevImage = arg_20_0._billboardMaterial
		end
	end

	var_0_31(arg_20_0, arg_20_1)
end

local function var_0_33(arg_23_0, arg_23_1)
	if arg_23_1 == 0 then
		return BATTLEPASS.NumBonusItems
	end

	if arg_23_1 == arg_23_0._maxBattlePassLevel then
		return #arg_23_0._battlePassData
	end

	for iter_23_0, iter_23_1 in ipairs(arg_23_0._battlePassData) do
		if arg_23_1 == (iter_23_1 and tonumber(iter_23_1.level)) and iter_23_1 and iter_23_1.showProgress then
			return iter_23_0
		end
	end
end

local function var_0_34(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0._battlePassData[arg_24_1]

	if var_24_0 then
		for iter_24_0, iter_24_1 in ipairs(var_24_0.lootTable) do
			local var_24_1 = iter_24_1 and iter_24_1.lootID

			if var_24_1 and LOOT.IsItemIDEquippableByS4(var_24_1) then
				return true
			end
		end
	end

	return false
end

local function var_0_35(arg_25_0, arg_25_1)
	local var_25_0 = LUI.FlowManager.GetScopedData("MainMenu")

	if not var_25_0.battlepassSelectedColumn then
		var_25_0.battlepassSelectedColumn = #arg_25_0._battlePassData - 1

		for iter_25_0, iter_25_1 in ipairs(arg_25_0._battlePassData) do
			if iter_25_1 then
				local var_25_1 = tonumber(iter_25_1.level)

				if tonumber(iter_25_1.xp) > arg_25_0._battlePassXP then
					var_25_0.battlepassSelectedColumn = iter_25_0 - 1
					arg_25_0._currentLevel = var_25_1 - 1

					break
				end
			end
		end
	end

	local var_25_2 = var_25_0.battlepassSelectedColumn

	arg_25_0.Grid:SetDefaultFocus({
		y = 0,
		x = var_25_2
	}, arg_25_1)
end

local function var_0_36(arg_26_0, arg_26_1)
	if arg_26_0._isStandalone then
		return
	end

	local var_26_0 = BATTLEPASS.GetTier(arg_26_0._controllerIndex)

	arg_26_1 = tonumber(arg_26_1)
	arg_26_0._purchaseEnabled = not arg_26_0._battlePassOwned

	if arg_26_0._needFixUp then
		arg_26_0._purchaseEnabled = true

		if arg_26_0.BattlePassPurchaseButton then
			arg_26_0.BattlePassPurchaseButton:UpdateButtonState(arg_26_0._battlePassOwned, true, arg_26_0._currentLevel, arg_26_0._needFixUp)
		end
	elseif arg_26_0._battlePassOwned and arg_26_1 then
		local var_26_1 = arg_26_1 - var_26_0
		local var_26_2 = arg_26_1 > 0 and var_26_1 > 0 and var_26_0 < arg_26_0._maxBattlePassLevel and Dvar.IBEGCHEFE("MMQLPLSNOM") and arg_26_1 ~= BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL

		if var_26_2 then
			arg_26_0._tierSkips = var_26_1
			arg_26_0._purchaseEnabled = true

			local var_26_3 = BATTLEPASS.SINGLE_TIER_COST

			if CONDITIONS.IsTierSaleEnabled() then
				var_26_3 = Dvar.CFHDGABACF("MOKSKKQRLK")
			end

			arg_26_0._itemCost = arg_26_0._tierSkips * var_26_3

			local var_26_4 = Engine.CBBHFCGDIC(arg_26_0._tierSkips == 1 and "MENU/BUY_TIER_SINGLE" or "MENU/BUY_TIERS_MULTIPLE", arg_26_0._tierSkips)

			if arg_26_0.BattlePassPurchaseButton then
				arg_26_0.BattlePassPurchaseButton.PurchaseText:setText(ToUpperCase(var_26_4))
			end
		else
			arg_26_0._tierSkips = 0
			arg_26_0._itemCost = 0
			arg_26_0._purchaseEnabled = false
		end

		if arg_26_0.BattlePassPurchaseButton then
			arg_26_0.BattlePassPurchaseButton:UpdateButtonState(arg_26_0._battlePassOwned, not var_26_2, var_26_0)
		end
	elseif arg_26_0.BattlePassPurchaseButton then
		arg_26_0.BattlePassPurchaseButton:UpdateButtonState(arg_26_0._battlePassOwned, true, var_26_0)
	end

	arg_26_0._purchaseEnabled = arg_26_0._purchaseEnabled and not arg_26_0._isAnimating
end

local function var_0_37(arg_27_0)
	local var_27_0 = var_0_14(arg_27_0._currentChild)

	var_0_32(arg_27_0, arg_27_0._currentChild)
	var_0_36(arg_27_0, var_27_0 and var_27_0.level or 0)
	var_0_27(arg_27_0, arg_27_0._currentChild)

	local var_27_1 = var_0_15(var_27_0, arg_27_0._lootIndex)

	if var_27_1 and var_27_1.challengeID and var_27_1.challengeID ~= "" then
		arg_27_0._missionChallengeID = var_27_1.challengeID

		local var_27_2 = false
		local var_27_3 = Challenge.GetMissionDataByRef(arg_27_0._controllerIndex, arg_27_0._missionChallengeID)

		while var_27_3 do
			local var_27_4 = var_27_3.loot

			if LOOT.GetTypeForID(var_27_4) == LOOT.itemTypes.OPERATOR_SKIN then
				var_27_2 = true

				break
			end

			var_27_3 = Challenge.GetNextMissionDataInChain(arg_27_0._controllerIndex, var_27_3)
		end

		if not var_27_2 then
			DebugPrint("Could not find skin id in mission chain for " .. arg_27_0._missionChallengeID)
		end

		arg_27_0._missionChallengeData = var_27_3
	else
		arg_27_0._missionChallengeID = nil
		arg_27_0._missionChallengeData = nil
	end

	local var_27_5 = arg_27_0._currentChild.lootData.type

	if arg_27_0._currentMenu then
		local var_27_6 = arg_27_0._currentMenu.PopupHelperBar

		if arg_27_0._isAnimating then
			if var_27_6 then
				var_27_6.ButtonHelperText:PopButtonPrompt({
					button_ref = "button_alt2"
				})
			end

			if not CONDITIONS.IsGiftingEnabled() or not arg_27_0._battlePassOwned then
				arg_27_0:RemoveButtonPrompt({
					helper_text = "",
					button_ref = "button_alt2"
				})
			end
		end

		if arg_27_0._isAnimating or not LOOT.CanPreview(var_27_5, arg_27_0._currentChild.lootData.itemID) then
			if arg_27_0._isBattlePassPopup and arg_27_0._currentMenu.UpdatePrompts then
				arg_27_0._currentMenu:UpdatePrompts(false)
			else
				arg_27_0:RemoveButtonPrompt({
					side = "left",
					button_ref = "button_primary",
					helper_text = ""
				})
			end
		elseif arg_27_0._isBattlePassPopup and arg_27_0._currentMenu.UpdatePrompts then
			arg_27_0._currentMenu:UpdatePrompts(true)
		else
			arg_27_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
			})
		end
	end
end

local function var_0_38(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_1 then
		arg_28_0._battlePassXP = arg_28_1
		arg_28_0._previousXP = arg_28_0._battlePassXP
	end

	local var_28_0 = BATTLEPASS.GetXP(arg_28_0._controllerIndex)

	if arg_28_2 then
		var_28_0 = arg_28_2
	end

	arg_28_0._finalXP = var_28_0

	if var_28_0 < arg_28_0._battlePassXP then
		arg_28_0._battlePassXP = 0
		arg_28_0._previousXP = 0
	end

	if var_28_0 == arg_28_0._battlePassXP then
		return
	end

	arg_28_0._previousLevel = BATTLEPASS.GetTierByXP(arg_28_0._controllerIndex, arg_28_0._previousXP)

	local var_28_1 = BATTLEPASS.GetTierByXP(arg_28_0._controllerIndex, var_28_0)
	local var_28_2 = var_0_33(arg_28_0, arg_28_0._previousLevel)
	local var_28_3 = var_0_33(arg_28_0, var_28_1)
	local var_28_4 = LUI.clamp(var_28_2, 0, #arg_28_0._battlePassData - 1)
	local var_28_5 = LUI.clamp(var_28_3, 0, #arg_28_0._battlePassData - 1)

	arg_28_0._purchaseEnabled = false

	arg_28_0.TierPurchaseBG:SetAlpha(1)
	arg_28_0.TierPurchaseBG:StartAnimation()
	arg_28_0:AnimateUnlocks(var_28_4, var_28_5, false)
end

local function var_0_39(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	arg_29_0._battlePassXP = arg_29_1
	arg_29_0._previousXP = arg_29_1
	arg_29_0._finalXP = arg_29_2
	arg_29_0._previousLevel = BATTLEPASS.GetTierByXP(arg_29_0._controllerIndex, arg_29_0._previousXP)

	local var_29_0 = BATTLEPASS.GetTierByXP(arg_29_0._controllerIndex, arg_29_2)
	local var_29_1 = var_0_33(arg_29_0, arg_29_0._previousLevel)
	local var_29_2 = var_0_33(arg_29_0, var_29_0)
	local var_29_3 = LUI.clamp(var_29_1, 0, #arg_29_0._battlePassData - 1)
	local var_29_4 = LUI.clamp(var_29_2, 0, #arg_29_0._battlePassData - 1)

	arg_29_0._purchaseEnabled = false
	arg_29_0._isAnimating = false
	arg_29_0._aarFillWaitTime = arg_29_3

	arg_29_0.TierPurchaseBG:SetAlpha(1)
	arg_29_0.TierPurchaseBG:StartAnimation()
	arg_29_0:AnimateUnlocks(var_29_3, var_29_4, false, true)
end

local function var_0_40(arg_30_0)
	local var_30_0 = BATTLEPASS.HasNewPassForSeason(arg_30_0._controllerIndex)
	local var_30_1, var_30_2 = BATTLEPASS.IsPendingTransactions(arg_30_0._controllerIndex)
	local var_30_3 = BATTLEPASS.IsOwned(arg_30_0._controllerIndex)
	local var_30_4 = arg_30_0._BRRewardState == var_0_13.NONE or arg_30_0._BRRewardState == var_0_13.UPSELLING

	return var_30_0 and not var_30_1 and not var_30_3 and var_30_4 and not arg_30_0._crmPurchaseBattlePass or Dvar.IBEGCHEFE("battlepass_always_show_upsell") and not arg_30_0._upsellSeen
end

local function var_0_41(arg_31_0, arg_31_1)
	if CONDITIONS.IsQABotSkipActive() then
		return
	end

	arg_31_0._upsellSeen = true

	LUI.FlowManager.RequestPopupMenu(arg_31_0, "BattlePassUpsellPopup", true, arg_31_0._controllerIndex, false, {
		sourceMenu = arg_31_0,
		backLeavesBPMenuPopup = arg_31_1
	})
end

local function var_0_42(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = arg_32_1,
		action = arg_32_2 or function()
			if arg_32_0._purchaseBattlePassInAAR then
				ACTIONS.LeaveMenu(arg_32_0)

				if AAR.IsAnyNonXPParadeAvailable(arg_32_0._controllerIndex) then
					LUI.FlowManager.RequestAddMenu("AARContainer", true, arg_32_0._controllerIndex, false, {
						fromBattlepassAAR = true,
						controller = controllerIndex
					})
				end
			else
				arg_32_0.Grid:RefreshContent()
			end
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_32_0._controllerIndex, false, var_32_0, nil, false, true)
end

local function var_0_43(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0 = LUI.FlowManager.GetScopedData("MainMenu")
	local var_34_1 = AAR.GetDebugMatchInfoPackageString(arg_34_1)
	local var_34_2 = "current position " .. tostring(arg_34_2) .. " \n start position " .. tostring(arg_34_3) .. " \n end position " .. tostring(arg_34_4) .. " \n previous xp " .. tostring(arg_34_0._previousXP) .. " \n previous level " .. tostring(arg_34_0._previousLevel) .. " \n current level " .. tostring(arg_34_0._currentLevel) .. " \n battle pass xp " .. tostring(arg_34_0._battlePassXP) .. " \n scoped data colum " .. tostring(var_34_0 and var_34_0.battlepassSelectedColumn or "-1")

	DebugPrint("$$$ Battle Pass Menu AAR State: " .. var_34_1 .. var_34_2)
end

local function var_0_44(arg_35_0)
	if Onboarding.BattlePass.WasCompleted(arg_35_0, arg_35_0._controllerIndex) then
		arg_35_0._bpGiftWaitTimer:closeTree()

		arg_35_0._bpGiftWaitTimer = nil

		GIFT.ProcessQueuedBattlepassGifts(arg_35_0._controllerIndex)
	end
end

local function var_0_45(arg_36_0)
	if arg_36_0._bpGiftWaitTimer ~= nil then
		arg_36_0._bpGiftWaitTimer:closeTree()

		arg_36_0._bpGiftWaitTimer = nil
	end

	arg_36_0._bpGiftWaitTimer = LUI.UITimer.new({
		interval = 1000,
		event = "bp_wait_for_bp_onboarding"
	})
	arg_36_0._bpGiftWaitTimer.id = "bpWaitForBPOnboarding"

	arg_36_0:addElement(arg_36_0._bpGiftWaitTimer)
	arg_36_0:addAndCallEventHandler("bp_wait_for_bp_onboarding", function(arg_37_0, arg_37_1)
		var_0_44(arg_36_0)
	end)
end

local function var_0_46(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	if arg_38_0._isAnimating then
		return
	end

	local var_38_0 = {
		START = 0,
		FILL = 2,
		FLARE = 3,
		END = 5,
		GRID = 1,
		DELAY = 4
	}
	local var_38_1 = {
		[var_38_0.START] = 1,
		[var_38_0.GRID] = arg_38_3 and 50 or 100,
		[var_38_0.FILL] = arg_38_3 and 50 or 100,
		[var_38_0.FLARE] = arg_38_3 and 100 or 600,
		[var_38_0.DELAY] = arg_38_3 and 50 or 200,
		[var_38_0.END] = 1
	}

	if arg_38_4 then
		var_38_1[var_38_0.FILL] = arg_38_0._aarFillWaitTime and arg_38_0._aarFillWaitTime or var_38_1[var_38_0.FILL]
	end

	local function var_38_2(arg_39_0, arg_39_1)
		arg_38_0.Grid:SetFocusedPosition({
			y = 0,
			x = arg_39_0
		}, arg_39_1, nil, false)

		return arg_38_0.Grid:GetElementAtPosition(arg_39_0, 0)
	end

	local var_38_3
	local var_38_4 = arg_38_1
	local var_38_5
	local var_38_6 = arg_38_1 + 1
	local var_38_7 = tonumber(arg_38_0._battlePassData[var_38_6].level)
	local var_38_8 = arg_38_0._finalXP and arg_38_0._finalXP or BATTLEPASS.GetXP(arg_38_0._controllerIndex)
	local var_38_9 = BATTLEPASS.GetTierMaxXP(arg_38_0._maxBattlePassLevel)

	arg_38_0._isAnimating = true
	arg_38_0._skipAnimationEnabled = true

	arg_38_0.Grid:SetDirectionalInputEnabled(false)
	arg_38_0.Grid:SetMouseFocusBlocker(true)
	arg_38_0.HorizontalScrollbar:SetAlpha(0)
	arg_38_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(true)

	local var_38_10 = LUI.IsLastInputKeyboardMouse(arg_38_0._controllerIndex) and "button_left_trigger" or "button_alt1"

	arg_38_0:AddButtonPrompt({
		helper_text = Engine.CBBHFCGDIC("BATTLEPASS/SKIP_CELEBRATION"),
		button_ref = var_38_10,
		container = arg_38_0.PromptContainer,
		containerAlignment = LUI.Alignment.Left
	})

	arg_38_0._battlePassXP = arg_38_3 and BATTLEPASS.GetTierMinXP(var_38_7 > 0 and var_38_7 - 1 or 0) or arg_38_0._previousXP

	arg_38_0.Grid:RefreshContent()
	var_0_37(arg_38_0)

	local var_38_11

	local function var_38_12()
		if not var_38_3 then
			var_38_3 = var_38_0.START
		else
			var_38_3 = var_38_3 + 1

			if var_38_3 == var_38_0.END and (var_38_4 < arg_38_2 or arg_38_0._battlePassXP < var_38_8 or var_38_4 == arg_38_2 and var_38_8 == var_38_9) then
				var_38_3 = var_38_0.START
			end
		end

		if arg_38_0:GetCurrentMenu() and arg_38_0:GetCurrentMenu().id ~= LUI.FlowManager.GetVisibleMenu().id or arg_38_0._purchaseBattlePassInAAR and not arg_38_0._purchaseBattlePassInAARSuccess then
			arg_38_0._skipAnimation = true
		end

		if arg_38_0._skipAnimation then
			arg_38_0._skipAnimation = false
			arg_38_0._skipAnimationEnabled = false

			if var_38_5 then
				var_38_5:EnableGlow(false)
				var_38_5.BattlePassFlare:ClearFlare()
			end

			var_38_3 = var_38_0.END
			var_38_4 = arg_38_2
			var_38_5 = var_38_2(var_38_4, var_38_4 == arg_38_1)

			arg_38_0.BattlePassStatus:UpdateActiveBanner(arg_38_0._battlePassOwned)
		end

		if var_38_3 == var_38_0.START then
			var_38_5 = var_38_2(var_38_4, var_38_4 == arg_38_1)

			if var_38_5 then
				local var_40_0 = var_0_14(var_38_5)

				if not var_40_0 then
					DebugPrint("BattlePassMenu:AnimateUnlocks: currentChild missing itemData, skipping animation\n" .. "\tstartPosition = " .. tostring(arg_38_1) .. ", currentPosition = " .. tostring(var_38_4) .. ", endPosition = " .. tostring(arg_38_2))

					arg_38_0._skipAnimation = true
					arg_38_0._forceDelayEnd = true
				else
					arg_38_0._forceDelayEnd = false
				end

				var_38_5:SetBattlePassOwned(arg_38_0._battlePassOwned)
				var_38_5:SetIsAnimating(true)

				if var_40_0 and var_40_0.showProgress and not arg_38_0._displayBattlePassInAAR then
					var_38_5:EnableGlow(true)
				end

				if arg_38_3 then
					if var_38_4 == arg_38_1 then
						Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseFirst)
					elseif var_38_4 == arg_38_2 then
						Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseLast)
					else
						Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseCard)
					end
				end
			else
				var_0_43(arg_38_0, arg_38_0._controllerIndex, var_38_4, arg_38_1, arg_38_2)
				assert(var_38_5, "( currentChild == nil ) currentPosition = " .. var_38_4 .. ", startPosition = " .. arg_38_1)

				arg_38_0._skipAnimation = true
				arg_38_0._forceDelayEnd = true
			end
		elseif var_38_3 == var_38_0.FILL then
			local var_40_1 = var_0_14(var_38_5)
			local var_40_2 = 0
			local var_40_3 = var_40_1 and tonumber(var_40_1.level)
			local var_40_4 = BATTLEPASS.GetTierMinXP(var_40_3)
			local var_40_5 = var_40_4

			if var_40_3 > 0 and var_40_3 ~= BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL then
				var_40_5 = BATTLEPASS.GetTierMinXP(var_40_3 - 1)
			end

			if var_40_4 <= var_38_8 then
				var_40_2 = 1
				arg_38_0._battlePassXP = var_40_4
			else
				var_40_2 = (var_38_8 - var_40_5) / (var_40_4 - var_40_5)
				arg_38_0._battlePassXP = var_38_8
			end

			var_38_5.progress = var_40_2

			if var_40_1 and var_40_1.showProgress then
				var_38_5:SetProgress(var_40_2, var_38_1[var_38_0.FILL])
			end
		elseif var_38_3 == var_38_0.FLARE then
			if var_38_5.progress == 1 then
				local var_40_6 = var_0_14(var_38_5)
				local var_40_7 = var_40_6 and var_40_6.isFree == "1"
				local var_40_8 = var_40_6 and tonumber(var_40_6.isFree) == BATTLEPASS.ItemTypes.CLAN

				var_38_5:SetTopBanner(var_40_7, false, false, var_40_6 and var_40_6.isFree)
				var_38_5:SetLocked(not arg_38_0._battlePassOwned and not var_40_7)
				ACTIONS.AnimateSequence(arg_38_0, "NotLocked")

				if var_38_4 ~= arg_38_2 or var_38_8 >= var_38_9 then
					if var_38_5:HasVanguardItem() then
						var_38_5.BattlePassFlare:PlayVanguardFlare()
					elseif arg_38_3 then
						var_38_5.BattlePassFlare:PlayPurchasedFlare()
					else
						var_38_5.BattlePassFlare:PlayRarityFlare(var_38_5.lootData.rarity)
					end
				end

				if arg_38_0._battlePassOwned then
					ACTIONS.AnimateSequence(var_38_5, "CompletePurchased")
				elseif var_40_7 or var_40_8 then
					ACTIONS.AnimateSequence(var_38_5, "CompleteFree")
				else
					ACTIONS.AnimateSequence(var_38_5, "HideCheckbox")
				end

				if var_40_6 and var_40_6.showProgress then
					ACTIONS.AnimateSequence(var_38_5, "TierCompleteFlare")
				end

				if arg_38_0._displayBattlePassInAAR then
					var_38_5:EnableGlow(true, {
						enableImmediately = true
					})
				end
			end
		elseif var_38_3 == var_38_0.DELAY then
			if not arg_38_3 then
				var_38_5:EnableGlow(false, {
					enableImmediately = false,
					disableGlowTime = 1500
				})
			end

			var_38_5:SetIsAnimating(false)

			var_38_4 = var_38_4 + 1
		end

		if var_38_3 ~= var_38_0.END then
			local var_40_9 = var_38_1[var_38_3] < 1 and 1 or var_38_1[var_38_3]

			arg_38_0:Wait(var_40_9).onComplete = function()
				var_38_12()
			end
		else
			arg_38_0._purchaseEnabled = true
			arg_38_0._isAnimating = false
			arg_38_0._battlePassXP = var_38_8

			arg_38_0.Grid:SetMouseFocusBlocker(false)
			arg_38_0.Grid:RefreshContent()
			var_0_37(arg_38_0)
			arg_38_0:RemoveButtonPrompt({
				helper_text = "",
				button_ref = var_38_10,
				container = arg_38_0.PromptContainer
			})
			arg_38_0.HorizontalScrollbar:SetAlpha(1, 150)
			arg_38_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(false)
			BATTLEPASS.SetLastMenuXP(arg_38_0._controllerIndex, arg_38_0._battlePassXP)

			if not arg_38_0._displayBattlePassInAAR then
				arg_38_0.Grid:SetDirectionalInputEnabled(true)
				arg_38_0.TierPurchaseBG:SetAlpha(0, 150)

				local var_40_10 = BATTLEPASS.GetLastFreeTierReached(arg_38_0._controllerIndex)

				BATTLEPASS.SetLastFreeTierSeen(arg_38_0._controllerIndex, var_40_10)
				var_0_20(arg_38_0)
			else
				arg_38_0.Grid:SetDirectionalInputEnabled(false)
			end

			local function var_40_11()
				if arg_38_0._battlePassXP >= BATTLEPASS.GetTierMaxXP(BATTLEPASS.GetMaxTier()) then
					local var_42_0 = arg_38_0._displayBattlePassInAAR and arg_38_0._displayBattlePassInAAR or false

					arg_38_0._celebrateState = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_COMPLETE

					LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_38_0._controllerIndex, var_42_0, {
						state = arg_38_0._celebrateState
					}, nil, false, true)
				end

				if not arg_38_0._displayBattlePassInAAR then
					arg_38_0:dispatchEventToParent({
						name = "start_auto_close"
					})
				else
					arg_38_0:dispatchEventToRoot({
						dispatchChildren = true,
						name = "update_aar_battlepass_tier_done"
					})
				end

				if not arg_38_0._isBattlePassPopup then
					var_0_45(arg_38_0)
				end
			end

			if arg_38_0._forceDelayEnd then
				arg_38_0:Wait(2000).onComplete = var_40_11
			else
				var_40_11()
			end

			if arg_38_0.shouldAwardFreeTierGift then
				if not arg_38_0._wasTierGiftAwarded then
					arg_38_0:Wait(500).onComplete = function()
						local var_43_0 = {
							isTierGift = true,
							bundleID = tonumber(BATTLEPASS.GetTierSkipGiftID()),
							battlePassName = BATTLEPASS.GetItemName(arg_38_0.tierGiftBattlePassPurchaseRef),
							onConfirm = function(arg_44_0)
								if arg_44_0 then
									arg_38_0._wasTierGiftAwarded = true
									arg_38_0._autoTierSkip = true

									arg_38_0:GetPurchaseAction()(arg_38_0, {
										controller = arg_38_0._controllerIndex
									})
								else
									arg_38_0.shouldAwardFreeTierGift = false

									var_0_42(arg_38_0, Engine.CBBHFCGDIC("BATTLEPASS/REWARD_ERROR_MESSAGE"))
								end
							end
						}

						arg_38_0.tierGiftBattlePassPurchaseRef = nil

						LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_38_0._controllerIndex, false, var_43_0, nil, false, true)
					end
				else
					arg_38_0._autoTierSkip = false
					arg_38_0.shouldAwardFreeTierGift = false
				end
			elseif arg_38_0._autoTierSkip then
				arg_38_0._autoTierSkip = false
			end
		end
	end

	if arg_38_4 then
		var_38_12()
	else
		arg_38_0:Wait(1750, true).onComplete = var_38_12
	end
end

local function var_0_47(arg_45_0)
	if arg_45_0._isAnimating then
		return
	end

	local var_45_0 = 32
	local var_45_1 = 5000
	local var_45_2 = 8000
	local var_45_3 = {
		FLARE = 2,
		END = 3,
		START = 0,
		MOVE = 1
	}
	local var_45_4 = {
		[var_45_3.START] = 300,
		[var_45_3.MOVE] = 600,
		[var_45_3.FLARE] = 300,
		[var_45_3.END] = 1200
	}
	local var_45_5 = BATTLEPASS.GetShowcaseTiers()

	local function var_45_6()
		local var_46_0 = table.remove(var_45_5, 1)

		var_46_0 = var_46_0 and var_46_0 + BATTLEPASS.NumBonusItems - 1

		if not var_46_0 or var_46_0 <= BATTLEPASS.NumBonusItems then
			var_46_0 = BATTLEPASS.NumBonusItems
		end

		return var_46_0
	end

	local var_45_7 = var_45_3.START
	local var_45_8 = var_45_6()
	local var_45_9 = arg_45_0.Grid:GetElementAtPosition(var_45_8, 0)
	local var_45_10 = 0
	local var_45_11 = 0

	local function var_45_12(arg_47_0)
		var_45_10 = 0
		var_45_11 = arg_47_0
	end

	arg_45_0.TierPurchaseBG:SetAlpha(1)
	arg_45_0.TierPurchaseBG.TierText:SetAlpha(0)
	arg_45_0.TierPurchaseBG:StartAnimation()

	arg_45_0._isAnimating = true
	arg_45_0._skipAnimationEnabled = true

	arg_45_0.Grid:SetDirectionalInputEnabled(false)
	arg_45_0.Grid:SetMouseFocusBlocker(true)

	local var_45_13 = LUI.IsLastInputKeyboardMouse(arg_45_0._controllerIndex) and "button_left_trigger" or "button_alt1"

	arg_45_0:AddButtonPrompt({
		helper_text = Engine.CBBHFCGDIC("BATTLEPASS/SKIP_CELEBRATION"),
		button_ref = var_45_13,
		container = arg_45_0.PromptContainer,
		containerAlignment = LUI.Alignment.Left
	})

	local var_45_14

	local function var_45_15()
		arg_45_0:Wait(var_45_0).onComplete = function()
			var_45_10 = var_45_10 + var_45_0

			if arg_45_0:GetCurrentMenu().id ~= LUI.FlowManager.GetVisibleMenu().id then
				return
			end

			if arg_45_0._skipAnimation then
				arg_45_0._skipAnimation = false
				arg_45_0._skipAnimationEnabled = false

				var_45_9.BattlePassFlare:ClearFlare()
				var_45_12(0)

				var_45_7 = var_45_3.END
			end

			if var_45_7 == var_45_3.START then
				arg_45_0.Grid:SetMaxVelocity(var_45_2)
				arg_45_0.Grid:SetFocusedPosition({
					y = 0,
					x = var_45_8
				}, true)

				var_45_9 = arg_45_0.Grid:GetElementAtPosition(var_45_8, 0)

				var_45_12(var_45_4[var_45_3.START])

				var_45_7 = var_45_3.FLARE
			elseif var_45_7 == var_45_3.MOVE and var_45_10 > var_45_11 then
				var_45_9.BattlePassFlare:ClearFlare()
				var_45_9:processEvent({
					name = "lose_active"
				})

				var_45_8 = var_45_6()

				arg_45_0.Grid:SetFocusedPosition({
					y = 0,
					x = var_45_8
				}, false)
				var_45_12(var_45_4[var_45_3.MOVE])

				var_45_7 = var_45_3.FLARE
			elseif var_45_7 == var_45_3.FLARE and var_45_10 > var_45_11 then
				var_45_9 = arg_45_0.Grid:GetElementAtPosition(var_45_8, 0)

				if var_45_9 and var_45_9._isOver then
					if var_45_9:HasVanguardItem() then
						var_45_9.BattlePassFlare:PlayVanguardFlare()
					else
						var_45_9.BattlePassFlare:PlayRarityFlare(var_45_9.lootData.rarity)
					end

					if var_45_8 <= BATTLEPASS.NumBonusItems then
						var_45_12(var_45_4[var_45_3.END])

						var_45_7 = var_45_3.END
					else
						var_45_12(var_45_4[var_45_3.FLARE])

						var_45_7 = var_45_3.MOVE
					end
				end
			elseif var_45_7 == var_45_3.END and var_45_10 > var_45_11 then
				arg_45_0.Grid:SetMaxVelocity(var_45_1)

				if not arg_45_0._displayBattlePassInAAR then
					arg_45_0.TierPurchaseBG.TierText:SetAlpha(1)
					arg_45_0.TierPurchaseBG:SetAlpha(0, 150)
				end

				arg_45_0._isAnimating = false
				arg_45_0._skipAnimationEnabled = false

				arg_45_0.Grid:SetDirectionalInputEnabled(true)

				var_45_8 = BATTLEPASS.NumBonusItems

				arg_45_0.Grid:SetFocusedPosition({
					y = 0,
					x = var_45_8
				}, true)
				var_0_41(arg_45_0)
			end

			var_45_15()
		end
	end

	var_45_15()
end

local function var_0_48(arg_50_0)
	arg_50_0._isAnimating = true
	arg_50_0._purchaseEnabled = false

	arg_50_0.Grid:SetDirectionalInputEnabled(false)
	arg_50_0.Grid:SetMouseFocusBlocker(true)
	arg_50_0.HorizontalScrollbar:SetAlpha(0)
	arg_50_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(true)

	local var_50_0 = 5000
	local var_50_1 = arg_50_0.Grid:GetContentSize(LUI.DIRECTION.horizontal) / arg_50_0.Grid:GetContentCount(LUI.DIRECTION.horizontal)
	local var_50_2 = 400
	local var_50_3 = 800

	arg_50_0.Grid:SetSpringCoefficient(var_50_3)

	local var_50_4 = 550
	local var_50_5 = 100
	local var_50_6 = var_50_5 / 1000
	local var_50_7 = 0
	local var_50_8 = 1
	local var_50_9

	local function var_50_10()
		arg_50_0.Grid:GetElementAtPosition(var_50_7, 0).BattlePassFlare:PlayVanguardFlare()

		arg_50_0:Wait(var_50_4).onComplete = function()
			var_50_9()
		end
	end

	local var_50_11

	local function var_50_12()
		var_50_7 = var_50_7 + 1

		local var_53_0 = arg_50_0.Grid:GetElementAtPosition(var_50_7, 0):HasVanguardItem()

		if var_53_0 then
			arg_50_0.Grid:SetFocusedPosition({
				y = 0,
				x = var_50_7
			}, false, nil)
		else
			arg_50_0.Grid:SetPosition({
				y = 0,
				x = var_50_7
			}, false, nil)
		end

		arg_50_0:Wait(var_50_8).onComplete = function()
			if var_53_0 then
				var_50_10()
			else
				var_50_12()
			end
		end
	end

	function var_50_9()
		local var_55_0 = 0
		local var_55_1 = true

		for iter_55_0 = var_50_7 + 1 + 1, #arg_50_0._battlePassData - 1 do
			var_55_0 = var_55_0 + 1

			if var_0_34(arg_50_0, iter_55_0) then
				var_55_1 = false

				break
			end
		end

		if not var_55_1 then
			local var_55_2 = var_50_1 * var_55_0 / var_50_6

			arg_50_0.Grid:SetMaxVelocity(var_55_2)

			var_50_8 = var_50_5 / var_55_0

			var_50_12()
		else
			arg_50_0._purchaseEnabled = true
			arg_50_0._isAnimating = false

			arg_50_0.Grid:SetMouseFocusBlocker(false)
			arg_50_0.HorizontalScrollbar:SetAlpha(1, 150)
			arg_50_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(false)
			arg_50_0.Grid:SetDirectionalInputEnabled(true)
			arg_50_0.TierPurchaseBG:SetAlpha(0, 150)
			arg_50_0.TierPurchaseBG:HideVanguardRevealInfo()
			arg_50_0.Grid:RefreshContent()
			arg_50_0.Grid:SetMaxVelocity(var_50_0)
			arg_50_0.Grid:SetSpringCoefficient(var_50_2)
		end
	end

	local var_50_13 = 1750

	arg_50_0:Wait(var_50_13, true).onComplete = function()
		arg_50_0.TierPurchaseBG:SetAlpha(1)
		arg_50_0.TierPurchaseBG:ShowVanguardRevealInfo()
		arg_50_0.Grid:FocusFirstItem()

		local var_56_0 = 500

		arg_50_0:Wait(var_56_0, true).onComplete = function()
			Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpVGTierRevealLong)
			var_50_9()
		end
	end
end

local function var_0_49(arg_58_0, arg_58_1)
	arg_58_0._finalXP = BATTLEPASS.GetXP(arg_58_0._controllerIndex)

	local var_58_0 = BATTLEPASS.GetTier(arg_58_0._controllerIndex)
	local var_58_1 = 0
	local var_58_2 = var_0_33(arg_58_0, var_58_0)

	if arg_58_1 then
		var_58_1 = var_0_33(arg_58_0, arg_58_0._previousLevel)
	end

	if arg_58_0._purchaseBattlePassInAARSuccess then
		var_58_2 = arg_58_0.finalAAREndPosition
	end

	local var_58_3 = LUI.clamp(var_58_1, 0, #arg_58_0._battlePassData - 1)
	local var_58_4 = LUI.clamp(var_58_2, 0, #arg_58_0._battlePassData - 1)

	var_0_46(arg_58_0, var_58_3, var_58_4, not arg_58_1)
end

local function var_0_50(arg_59_0)
	local var_59_0 = BATTLEPASS.IsOwned(arg_59_0._controllerIndex)
	local var_59_1 = BATTLEPASS.GetMaxTier() == BATTLEPASS.GetTier(arg_59_0._controllerIndex)
	local var_59_2 = not var_59_0
	local var_59_3 = not var_59_1

	return BATTLEPASS.NeedFixUp(arg_59_0._controllerIndex) and (var_59_2 or var_59_3)
end

local function var_0_51(arg_60_0, arg_60_1)
	local function var_60_0()
		arg_60_0._previousXP = BATTLEPASS.GetXP(arg_60_0._controllerIndex)
		arg_60_0._previousLevel = BATTLEPASS.GetTier(arg_60_0._controllerIndex)
		arg_60_0._purchaseQueue = LUI.CreateQueue()
		arg_60_0._activationQueue = LUI.CreateQueue()
		arg_60_0._queuedRef = nil
		arg_60_0._queuedPurchase = nil
		arg_60_0._numTransactions = 0
		arg_60_0._numTransactionsComplete = 0

		if not arg_60_0._battlePassOwned and arg_60_1 then
			local var_61_0 = arg_60_1

			if not arg_60_0._autoTierSkip then
				arg_60_0._tierSkips = 0

				arg_60_0._purchaseQueue:Push({
					ref = arg_60_1
				})

				arg_60_0._numTransactions = arg_60_0._numTransactions + 1
			else
				var_61_0 = BATTLEPASS.GetPurchaseRef()
			end

			local var_61_1 = BATTLEPASS.GetActivationRefs(var_61_0)
			local var_61_2 = #var_61_1

			for iter_61_0, iter_61_1 in ipairs(var_61_1) do
				arg_60_0._activationQueue:Push({
					ref = iter_61_1.ref,
					id = iter_61_0,
					count = var_61_2,
					skipValue = iter_61_1.quantity
				})

				arg_60_0._numTransactions = arg_60_0._numTransactions + 1
			end

			if arg_60_1 == BATTLEPASS.GetPurchaseRef() then
				arg_60_0._celebrateState = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_UNLOCKED
			elseif arg_60_1 == BATTLEPASS.GetPurchaseBundleRef() then
				arg_60_0._celebrateState = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_TIER_BUNDLE_UNLOCKED
			end
		else
			arg_60_0._celebrateState = BATTLEPASS.FullScreenPopupStates.TIERS_UNLOCKED
		end

		if not arg_60_0._autoTierSkip then
			local var_61_3 = BATTLEPASS.GetTier(arg_60_0._controllerIndex)
			local var_61_4 = arg_60_0._maxBattlePassLevel - var_61_3
			local var_61_5 = arg_60_0._tierSkips

			if var_61_4 < var_61_5 then
				var_61_5 = var_61_4
			end

			if var_61_5 > 0 then
				arg_60_0._purchaseQueue:Push({
					ref = BATTLEPASS.GetTierSkipPurchaseRef(),
					skipValue = var_61_5
				})

				arg_60_0._tierSkips = arg_60_0._tierSkips - var_61_5
				arg_60_0._numTransactions = arg_60_0._numTransactions + 1

				arg_60_0._activationQueue:Push({
					ref = BATTLEPASS.GetTierSkipPurchaseRef(),
					skipValue = var_61_5
				})
			end
		else
			local var_61_6 = 0
			local var_61_7 = BATTLEPASS.GetTier(arg_60_0._controllerIndex)
			local var_61_8, var_61_9 = BATTLEPASS.GetPendingTierSkips(arg_60_0._controllerIndex)

			for iter_61_2, iter_61_3 in ipairs(var_61_8) do
				local var_61_10 = iter_61_3.skips

				if not arg_60_0._allowTierBank or var_61_7 + var_61_6 + var_61_10 <= arg_60_0._maxBattlePassLevel then
					arg_60_0._activationQueue:Push({
						ref = iter_61_3.ref,
						skipValue = var_61_10
					})

					arg_60_0._numTransactions = arg_60_0._numTransactions + 1
					var_61_6 = var_61_6 + var_61_10
				end
			end
		end

		local var_61_11 = false
		local var_61_12
		local var_61_13

		local function var_61_14()
			arg_60_0:Wait(16).onComplete = function()
				if arg_60_0._queuedRef then
					if not arg_60_0._errorCode then
						var_61_14()
					else
						local var_63_0 = BATTLEPASS.GetErrorMessage(arg_60_0._errorCode, arg_60_0._queuedRef)

						arg_60_0._errorCode = nil
						arg_60_0._queuedRef = nil
						arg_60_0._needFixUp = var_0_50(arg_60_0)

						LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup")
						var_0_42(arg_60_0, var_63_0)
					end
				elseif arg_60_0._purchaseQueue and not arg_60_0._queuedPurchase then
					arg_60_0._queuedPurchase = arg_60_0._purchaseQueue:Pop()

					if arg_60_0._queuedPurchase then
						arg_60_0._queuedRef = arg_60_0._queuedPurchase.ref

						local var_63_1 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0._queuedRef, CSV.battlePassIDs.cols.id))
						local var_63_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0._queuedRef, CSV.battlePassIDs.cols.sku)

						if var_63_2 ~= "" then
							var_63_1 = tonumber(var_63_2)
						end

						local var_63_3 = 1

						if BATTLEPASS.TierSkipHasIndividualChallenges(arg_60_0._queuedRef) then
							var_63_3 = arg_60_0._queuedPurchase.skipValue
						end

						if STORE.IsItemOnSale(var_63_1, arg_60_0._controllerIndex) then
							local var_63_4 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0._queuedRef, CSV.battlePassIDs.cols.saleSku)

							if var_63_4 ~= "" then
								var_63_1 = tonumber(var_63_4)
							end
						end

						Battlepass.GAICDBJEC(arg_60_0._controllerIndex, var_63_1, var_63_3)
					else
						arg_60_0._purchaseQueue = nil
					end

					var_61_14()
				elseif arg_60_0._activationQueue then
					arg_60_0._activation = arg_60_0._activationQueue:Pop()

					if arg_60_0._activation then
						arg_60_0._queuedRef = arg_60_0._activation.ref

						local var_63_5 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0._queuedRef, CSV.battlePassIDs.cols.id))
						local var_63_6 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0._queuedRef, CSV.battlePassIDs.cols.challengeID)

						if BATTLEPASS.TierSkipHasIndividualChallenges(arg_60_0._queuedRef) then
							local var_63_7 = BATTLEPASS.GetTier(arg_60_0._controllerIndex)
							local var_63_8 = arg_60_0._maxBattlePassLevel - var_63_7
							local var_63_9 = arg_60_0._activation.skipValue

							if var_63_8 < var_63_9 then
								var_63_9 = var_63_8
							end

							if arg_60_0._queuedRef == BATTLEPASS.T9_SKIP_VALUE_REF then
								var_63_6 = StringTable.CBGJCDIHCE(CSV.t9TierSkipIDs.file, var_63_9, CSV.t9TierSkipIDs.cols.id)
							elseif arg_60_0._queuedRef == BATTLEPASS.S4_SKIP_VALUE_REF then
								var_63_6 = StringTable.CBGJCDIHCE(CSV.s4TierSkipIDs.file, var_63_9, CSV.s4TierSkipIDs.cols.id)
							end
						end

						Battlepass.CBHBFIJDHG(arg_60_0._controllerIndex, var_63_6, var_63_5)
					else
						arg_60_0._activationQueue = nil
					end

					var_61_14()
				else
					if not var_61_12 then
						var_61_12 = Engine.BFBIDEGDFB()
					else
						local var_63_10 = Engine.BFBIDEGDFB() - var_61_12

						if not var_61_11 and var_63_10 >= var_0_5 then
							var_61_11 = true

							arg_60_0.TierPurchaseBG:SetAlpha(1)
							arg_60_0.TierPurchaseBG:StartAnimation()
							LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup")
							LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_60_0._controllerIndex, false, {
								state = arg_60_0._celebrateState
							}, nil, false, true)
							arg_60_0:DisableBundleBonusTopper(arg_60_0)
						end
					end

					if var_61_11 and arg_60_0._purchaseBattlePassInAAR then
						arg_60_0._purchaseBattlePassInAARSuccess = true

						if arg_60_0.BattlePassTierProgression then
							arg_60_0.BattlePassTierProgression:SetAlpha(0)
						end

						arg_60_0.TierPurchaseBG:SetAlpha(1)
						arg_60_0:dispatchEventToRoot({
							dispatchChildren = true,
							name = "purchase_aar_battlepass_success",
							immediate = true
						})
					end

					if var_61_11 and not LUI.FlowManager.IsInStack("BattlePassFullScreenPopup") then
						arg_60_0._needFixUp = var_0_50(arg_60_0)

						var_0_49(arg_60_0, arg_60_1 == nil)
					else
						var_61_14()
					end
				end
			end
		end

		var_61_14()
	end

	return function(arg_64_0, arg_64_1)
		if not arg_60_0._battlePassOwned and not arg_60_0._autoTierSkip then
			arg_60_0._itemCost = tonumber(BATTLEPASS.GetItemCost(arg_60_1))
		end

		local var_64_0 = arg_60_0._recipentXuidString and tonumber(BATTLEPASS.GetItemCost(arg_60_1)) or arg_60_0._itemCost

		arg_60_0._availableCODPoints = Commerce.CEDDCGHIGA(arg_64_1.controller, LOOT.CurrencyIDs.COD_POINTS)

		if not arg_60_0._autoTierSkip and var_64_0 > arg_60_0._availableCODPoints then
			local var_64_1 = {
				showBalance = true,
				controllerIndex = arg_64_1.controller,
				currencyID = LOOT.CurrencyIDs.COD_POINTS,
				currencyAmount = var_64_0
			}

			STORE.EnterStore(arg_64_1.controller, arg_64_0:GetCurrentMenu().id, arg_64_0.id, var_64_1, "PurchaseCODPointsPopup", true)
		elseif arg_60_0._recipentXuidString then
			local var_64_2 = arg_60_0._recipentXuidString

			LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchasePopup")

			local var_64_3 = BATTLEPASS.GetItemSKU(arg_60_1)

			LUI.ToastManager.GetInstance():QueueGiftRecipientXuid(arg_60_0._recipentXuidString)

			local var_64_4 = 1

			Gifting.DAFDBDBEJC(arg_64_1.controller, var_64_3, var_64_4, arg_60_0._recipentXuidString)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_60_0._controllerIndex, false, {
				purchaseGift = true
			}, nil, false, true)

			arg_60_0:Wait(1500).onComplete = function()
				LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

				local var_65_0 = {
					state = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_GIFTED,
					recipentXuidString = var_64_2
				}

				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_60_0._controllerIndex, false, var_65_0, nil, false, true)
			end
			arg_60_0._recipentXuidString = nil
		else
			local var_64_5

			if not arg_60_0._battlePassOwned and arg_60_1 then
				var_64_5 = Engine.CBBHFCGDIC(BATTLEPASS.GetItemName(arg_60_1))
			elseif arg_60_0._tierSkips == 1 then
				var_64_5 = Engine.CBBHFCGDIC("BATTLEPASS/1_TIER_SKIP")
			else
				var_64_5 = Engine.CBBHFCGDIC("BATTLEPASS/N_TIER_SKIPS", arg_60_0._tierSkips)
			end

			local var_64_6 = {
				hidePurchasingText = arg_60_0._autoTierSkip,
				itemCost = arg_60_0._itemCost,
				itemName = var_64_5,
				confirmAction = var_60_0,
				cancelAction = function()
					arg_60_0._purchaseEnabled = true
				end
			}

			LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup", true)

			local var_64_7 = arg_60_0._currentMenu.id ~= LUI.FlowManager.GetVisibleMenu().id and (not arg_60_0._autoTierSkip or arg_60_0._BRRewardState ~= var_0_13.NONE)

			if Engine.DBFCJBDJEC() and Engine.DDHFCGHJEA() and not isPendingTransactions and not arg_60_0._autoTierSkip then
				local var_64_8 = ""
				local var_64_9 = false

				if not arg_60_0._battlePassOwned and arg_60_1 then
					if arg_60_1 == BATTLEPASS.GetPurchaseRef() then
						var_64_8 = "battlepass_button_premium"
					elseif arg_60_1 == BATTLEPASS.GetPurchaseBundleRef() then
						var_64_8 = "battlepass_button_bundle"
					end
				else
					var_64_8 = "battlepass_emblem"
					var_64_9 = true
				end

				local var_64_10 = {
					isItemNameLocalized = true,
					itemName = var_64_5,
					itemImage = var_64_8,
					itemCurrencyID = LOOT.CurrencyIDs.COD_POINTS,
					itemCurrencyAmount = arg_60_0._itemCost,
					isBattlepassTier = var_64_9,
					confirmAction = function()
						LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_64_1.controller, var_64_7, var_64_6, nil, false, true)

						arg_60_0._purchaseEnabled = false
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchaseKoreaLegalPupup", true, arg_64_1.controller, var_64_7, var_64_10, nil, false, false)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_64_1.controller, var_64_7, var_64_6, nil, false, true)

				arg_60_0._purchaseEnabled = false
			end
		end
	end
end

local function var_0_52(arg_68_0, arg_68_1)
	local var_68_0, var_68_1 = BATTLEPASS.IsPendingTransactions(arg_68_1)
	local var_68_2, var_68_3 = BATTLEPASS.GetPendingTierSkips(arg_68_1)
	local var_68_4

	if var_68_0 then
		if var_68_3 >= 20 then
			var_68_4 = BATTLEPASS.GetPurchaseBundleRef()
		else
			var_68_4 = BATTLEPASS.GetPurchaseRef()
		end
	end

	arg_68_0:GetPurchaseAction(var_68_4)(arg_68_0, {
		controller = arg_68_1
	})
end

local function var_0_53(arg_69_0)
	arg_69_0._purchaseEnabled = false
	arg_69_0._previousXP = BATTLEPASS.GetXP(arg_69_0._controllerIndex)
	arg_69_0._previousLevel = BATTLEPASS.GetTier(arg_69_0._controllerIndex)

	BATTLEPASS.FixUp(arg_69_0._controllerIndex)

	local var_69_0 = 60000

	arg_69_0._fixingUp = true
	arg_69_0:Wait(var_69_0).onComplete = function()
		arg_69_0:processEvent({
			name = "battlepass_fixup_failed"
		})
	end

	LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_69_0._controllerIndex, false, {
		fixUp = true
	}, nil, false, true)
end

local function var_0_54(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:GetPurchaseAction()
	local var_71_1 = {
		sourceMenu = arg_71_0,
		purchaseAction = var_71_0,
		backLeavesBPMenuPopup = arg_71_0._purchaseBattlePassInAAR or arg_71_0._purchaseBattlePassInStore or arg_71_0._purchaseBattlePassInVIPGift
	}

	LUI.FlowManager.RequestPopupMenu(arg_71_0, "BattlePassPurchasePopup", true, arg_71_1, false, var_71_1)
end

local function var_0_55(arg_72_0, arg_72_1)
	if arg_72_0._battlePassOwned then
		var_0_42(arg_72_0, Engine.CBBHFCGDIC("BATTLEPASS/ERROR_ALREADY_OWN"), function()
			ACTIONS.LeaveMenu(arg_72_0)
		end)

		return
	end

	arg_72_0._purchaseBattlePassInVIPGift = true

	if arg_72_1 then
		local var_72_0 = {
			skipDelay = true,
			menu = arg_72_0,
			closeAction = function(arg_74_0)
				var_0_41(arg_74_0, true)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_72_0._controllerIndex, false, var_72_0)
	else
		var_0_54(arg_72_0, arg_72_0._controllerIndex)
	end
end

local function var_0_56(arg_75_0)
	if arg_75_0._battlePassOwned then
		var_0_42(arg_75_0, Engine.CBBHFCGDIC("BATTLEPASS/ERROR_ALREADY_OWN"), function()
			ACTIONS.LeaveMenu(arg_75_0)
		end)

		return
	end

	arg_75_0._purchaseBattlePassInStore = true

	if not Onboarding.BattlePass.WasCompleted(arg_75_0, arg_75_0._controllerIndex) then
		local var_75_0 = {
			skipDelay = true,
			menu = arg_75_0,
			closeAction = function(arg_77_0)
				var_0_54(arg_77_0, arg_77_0._controllerIndex)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_75_0._controllerIndex, false, var_75_0)
	else
		var_0_54(arg_75_0, arg_75_0._controllerIndex)
	end
end

local function var_0_57(arg_78_0, arg_78_1)
	ACTIONS.AnimateSequence(arg_78_0, "SetupStandalone")

	arg_78_0._purchaseBattlePassInAAR = true

	var_0_54(arg_78_0, arg_78_1)
end

local function var_0_58(arg_79_0, arg_79_1, arg_79_2)
	arg_79_0._displayBattlePassInAAR = true
	arg_79_0._shouldAnimateDoubleXP = arg_79_2.isDoubleXPActive

	local var_79_0 = arg_79_2.startTierXP
	local var_79_1 = BATTLEPASS.GetTierByXP(arg_79_0._controllerIndex, arg_79_2.currentTierXP)

	arg_79_0.finalAAREndPosition = var_0_33(arg_79_0, var_79_1)
	arg_79_0.BattlePassTierProgression = MenuBuilder.BuildRegisteredType("BattlePassTierProgression", {
		isAARBattlepass = true,
		controllerIndex = arg_79_1
	})
	arg_79_0.BattlePassTierProgression.id = "BattlePassTierProgression"

	arg_79_0.BattlePassTierProgression:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * -54, _1080p * 1026)
	arg_79_0:addElement(arg_79_0.BattlePassTierProgression)
	arg_79_0.BattlePassTierProgression:PlayBattlePassTierProgression(arg_79_1, arg_79_2)
	arg_79_0.BattlePassTierProgression:SetAlpha(0)
	arg_79_0.BattlePassTierProgression:SetAlpha(1, 100)
	var_0_17(arg_79_0, arg_79_1)
	arg_79_0.Background:SetAlpha(0)
	arg_79_0.TierPurchaseBG:HideBattlePassInfo()
	arg_79_0.Grid:SetDirectionalInputEnabled(false)
	arg_79_0.BattlePassGridContainer:SetupAARGridMask()
	arg_79_0:registerEventHandler("update_aar_battlepass_tier", function(arg_80_0, arg_80_1)
		if not arg_79_0._purchaseBattlePassInAAR then
			arg_79_0:AnimateXPEarnedInAAR(arg_80_1.displayTierXP, arg_80_1.earnedTypeXP + arg_80_1.displayTierXP, arg_80_1.waitTime)
		end
	end)
	arg_79_0:registerEventHandler(AAR.PARADE_BATTLE_PASS_DONE, function(arg_81_0, arg_81_1)
		if not arg_79_0._purchaseBattlePassInAAR then
			ACTIONS.LeaveMenu(arg_79_0)

			if AAR.IsAnyNonXPParadeAvailable(arg_79_0._controllerIndex) then
				LUI.FlowManager.RequestAddMenu("AARContainer", true, arg_79_0._controllerIndex, false, {
					fromBattlepassAAR = true,
					controller = arg_79_1
				})
			end
		end
	end)
end

local function var_0_59(arg_82_0, arg_82_1)
	if arg_82_0._skipAnimationEnabled then
		arg_82_0._skipAnimation = true
	end
end

local function var_0_60(arg_83_0, arg_83_1)
	if arg_83_1.controller == arg_83_0._controllerIndex then
		if arg_83_0._purchaseEnabled then
			if arg_83_0._isStandalone then
				return
			elseif arg_83_0._needFixUp then
				var_0_53(arg_83_0)
			elseif not arg_83_0._battlePassOwned then
				LUI.FlowManager.RequestPopupMenu(arg_83_0, "BattlePassPurchasePopup", true, arg_83_1.controller, false, {
					sourceMenu = arg_83_0,
					purchaseAction = purchaseAction
				})
			elseif arg_83_0._tierSkips > 0 then
				LUI.FlowManager.RequestPopupMenu(arg_83_0, "BattlePassTiersPurchasePopup", true, arg_83_1.controller, false, {
					sourceMenu = arg_83_0,
					purchaseAction = purchaseAction,
					tierSkips = arg_83_0._tierSkips
				})
			end

			Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseSelect)
		elseif arg_83_0._skipAnimationEnabled and not LUI.IsLastInputKeyboardMouse(arg_83_1.controller) then
			arg_83_0._skipAnimation = true
		end
	end
end

local function var_0_61(arg_84_0, arg_84_1)
	arg_84_0._recipentXuidString = arg_84_1
end

local function var_0_62(arg_85_0, arg_85_1)
	local function var_85_0()
		local var_86_0 = BATTLEPASS.GetPurchaseRef()
		local var_86_1 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, var_86_0, CSV.battlePassIDs.cols.sku)
		local var_86_2 = {
			sourceMenu = arg_85_0,
			battlePassSKU = var_86_1,
			giftingActionCallback = var_0_61
		}

		LUI.FlowManager.RequestPopupMenu(arg_85_0, "BattlePassPurchasePopup", true, arg_85_1.controller, false, var_86_2)
	end

	GIFT.StartFTUEFlow(arg_85_0, var_85_0)
end

local function var_0_63(arg_87_0, arg_87_1)
	if LUI.IsLastInputKeyboardMouse(arg_87_1.controller) then
		if CONDITIONS.IsWZWipDvarEnabled() and arg_87_0._shouldShowGameSourceUpsell then
			LUI.FlowManager.RequestPopupMenu(arg_87_0, "WZCWUpsellPopup", true, arg_87_0._controllerIndex, false)

			return
		end

		if not arg_87_0._isAnimating then
			if LOOT.CanPreview(arg_87_0._currentChild.lootData.type, arg_87_0._currentChild.lootData.itemID) then
				STORE.PreviewItem(arg_87_1.controller, arg_87_0._currentChild.lootData.type, arg_87_0._currentChild.lootData.itemID, nil, nil, true)
			end
		elseif arg_87_0._skipAnimationEnabled then
			arg_87_0._skipAnimation = true
		end
	else
		var_0_60(arg_87_0, arg_87_1)
	end
end

local function var_0_64(arg_88_0, arg_88_1, arg_88_2)
	if arg_88_1 and not arg_88_2 then
		local var_88_0 = {
			promptsData = {
				{
					button_ref = "button_alt1",
					keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
				}
			}
		}

		arg_88_0:AddTooltipData(controllerIndex, var_88_0)
	else
		arg_88_0:RemoveToolTipData()
	end
end

local function var_0_65(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	local var_89_0 = ToUpperCase(arg_89_0.lootData.name or "")

	arg_89_0:SetupContextualMenu({
		title = var_89_0
	})

	if arg_89_1._battlePassOwned and not arg_89_3 and arg_89_2 then
		local var_89_1 = {
			id = "battlePassContextualBuyTier",
			actionName = Engine.CBBHFCGDIC("BATTLEPASS/BUY_TIERS_MULTIPLE"),
			actionFunction = function()
				var_0_60(arg_89_1, {
					controller = arg_89_1._controllerIndex
				})
			end
		}

		arg_89_0:AddContextualMenuAction(var_89_1)
	end

	local var_89_2 = arg_89_0.lootData.type
	local var_89_3 = var_0_14(arg_89_0)

	if var_89_2 == LOOT.itemTypes.WEAPON then
		local var_89_4 = Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_REWARD_DETAILS_CONTEXTUAL")
		local var_89_5 = {
			id = "battlePassContextualViewDetails",
			actionName = var_89_4,
			actionFunction = function()
				if var_89_2 == LOOT.itemTypes.WEAPON then
					arg_89_1._isExpanded = not arg_89_1._isExpanded

					Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
				end

				var_0_22(arg_89_1, arg_89_0.lootData, var_89_3, arg_89_1._isExpanded)

				if arg_89_1._missionChallengeID then
					Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

					if not Engine.DBAEJAHFGJ(arg_89_1._controllerIndex) then
						if arg_89_1._missionChallengeData.category == Challenge.Operator then
							local var_91_0 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_89_1._missionChallengeID, CSV.questChallenges.cols.id)

							if var_91_0 and #var_91_0 > 0 then
								LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_89_1._controllerIndex, false, {
									challengeID = var_91_0,
									skinLootId = arg_89_1._missionChallengeData.loot
								})
							end
						end
					else
						LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_89_1._controllerIndex, false)
					end
				end
			end
		}

		arg_89_0:AddContextualMenuAction(var_89_5)
	end

	if LOOT.CanPreview(var_89_2, arg_89_0.lootData.itemID) or arg_89_1._shouldShowGameSourceUpsell then
		local var_89_6 = var_0_15(var_89_3, arg_89_1._lootIndex)
		local var_89_7 = (var_89_6 and var_89_6._gameSourceId) == LUI.GAME_SOURCE_ID.COLD_WAR
		local var_89_8 = {
			id = "battlePassContextualPreview",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"),
			actionFunction = function()
				if not arg_89_1._isAnimating then
					if arg_89_1._shouldShowGameSourceUpsell then
						LUI.FlowManager.RequestPopupMenu(arg_89_1, "WZCWUpsellPopup", true, arg_89_1._controllerIndex, false)

						return
					end

					STORE.PreviewItem(arg_89_1._controllerIndex, var_89_2, arg_89_0.lootData.itemID, nil, nil, true)
				end
			end
		}

		arg_89_0:AddContextualMenuAction(var_89_8)
		var_0_64(arg_89_0, true, var_89_7)
	else
		var_0_64(arg_89_0, false)
	end
end

local function var_0_66(arg_93_0)
	if arg_93_0 then
		local var_93_0 = arg_93_0[#arg_93_0]

		if #var_93_0.lootTable > 1 then
			table.remove(arg_93_0, #arg_93_0)

			for iter_93_0, iter_93_1 in ipairs(var_93_0.lootTable) do
				local var_93_1 = LUI.ShallowCopy(var_93_0)
				local var_93_2 = {
					lootID = iter_93_1.lootID,
					billboardImage = iter_93_1.billboardImage,
					challengeID = iter_93_1.challengeID,
					subTierID = iter_93_1.subTierID
				}

				if iter_93_0 > 1 then
					var_93_1.showProgress = false
				end

				var_93_1.subTierID = iter_93_1.subTierID
				var_93_1.lootTable = {}

				table.insert(var_93_1.lootTable, var_93_2)
				table.insert(arg_93_0, var_93_1)
				BATTLEPASS.AddItemTileImage(iter_93_1.tileImage, iter_93_1.lootID)
			end
		end
	end
end

local function var_0_67(arg_94_0, arg_94_1)
	if not Dvar.IBEGCHEFE("MPQSMOPRQK") then
		return
	end

	local var_94_0 = Challenge.GetQuestsForMissionChallenges(arg_94_1, {
		Challenge.Operator
	}).quests
	local var_94_1 = {}

	for iter_94_0, iter_94_1 in pairs(var_94_0) do
		var_94_1[iter_94_1[1].ref] = iter_94_0
	end

	for iter_94_2, iter_94_3 in ipairs(arg_94_0) do
		for iter_94_4, iter_94_5 in ipairs(iter_94_3.lootTable) do
			local var_94_2 = iter_94_5.challengeID

			if var_94_2 and #var_94_2 > 0 and var_94_1[var_94_2] then
				local var_94_3 = var_94_1[var_94_2]

				for iter_94_6, iter_94_7 in ipairs(var_94_0[var_94_3]) do
					if iter_94_7.loot and #iter_94_7.loot > 0 then
						local var_94_4 = LUI.ShallowCopy(iter_94_5)
						local var_94_5 = Quests.CCBJIDFAHE(arg_94_1, tonumber(iter_94_7.id)) >= tonumber(iter_94_7.amount)

						var_94_4.lootID = iter_94_7.loot
						var_94_4.isOperatorChallengeReward = true
						var_94_4.operatorChallengeName = iter_94_7.name
						var_94_4.isLocked = not iter_94_7.unlocked or not var_94_5

						table.insert(iter_94_3.lootTable, var_94_4)
					end
				end

				break
			end
		end
	end
end

local function var_0_68(arg_95_0, arg_95_1)
	for iter_95_0, iter_95_1 in ipairs(arg_95_0) do
		local var_95_0 = BATTLEPASS.GetTierSplitItemIDs(tonumber(iter_95_1.level))
		local var_95_1 = BATTLEPASS.GetTierSplitBillboardImages(tonumber(iter_95_1.level))
		local var_95_2 = BATTLEPASS.GetTierSplitTileImages(tonumber(iter_95_1.level))

		for iter_95_2, iter_95_3 in ipairs(iter_95_1.lootTable) do
			assert(iter_95_3.subTierID and iter_95_3.subTierID > 0, "SetupSplitTierUnlocks: Invalid subTierID provided, expected non-nil and greater than 0")

			local var_95_3 = var_95_0[iter_95_3.subTierID]
			local var_95_4 = var_95_1[iter_95_3.subTierID]
			local var_95_5 = var_95_2[iter_95_3.subTierID]

			if var_95_3 and var_95_3 ~= "0" then
				iter_95_3._gameSourceId = LOOT.GetGameSourceIDFromItemID(iter_95_3.lootID)

				local var_95_6 = LUI.ShallowCopy(iter_95_3)

				var_95_6._gameSourceId = LOOT.GetGameSourceIDFromItemID(var_95_3)
				var_95_6.lootID = var_95_3

				if var_95_4 and var_95_4 ~= "" and var_95_4 ~= "0" then
					var_95_6.billboardImage = var_95_4
				end

				BATTLEPASS.AddItemTileImage(var_95_5, var_95_3)
				table.insert(iter_95_1.lootTable, var_95_6)

				break
			end
		end
	end
end

local function var_0_69(arg_96_0)
	if arg_96_0._gridTimer then
		arg_96_0._gridTimer:closeTree()

		arg_96_0._gridTimer = nil
		arg_96_0._battlePassData = BATTLEPASS.GetAllTiersData(arg_96_0._controllerIndex)

		var_0_66(arg_96_0._battlePassData)
		var_0_67(arg_96_0._battlePassData, arg_96_0._controllerIndex)
		var_0_68(arg_96_0._battlePassData, arg_96_0._controllerIndex)
		arg_96_0.Grid:SetNumChildren(#arg_96_0._battlePassData)
		arg_96_0.Grid:RefreshContent()
	end
end

local var_0_70

local function var_0_71(arg_97_0)
	if not (not LUI.FlowManager.IsInStack("BattlePassRewardPopup") and not LUI.FlowManager.IsInStack("BattlePassOnboardingPopup") and not LUI.FlowManager.IsInStack("BattlePassPurchaseProgressPopup")) then
		return
	end

	if arg_97_0._BRRewardState == var_0_13.PENDING and CONDITIONS.IsBRFirstMatchTierSkipRewardEnabled() then
		local var_97_0 = {
			isBRReward = true,
			onConfirm = function(arg_98_0)
				LUI.FlowManager.GetScopedData("MainMenu").brRewardPending = nil
				arg_97_0._BRRewardState = arg_98_0 and var_0_13.ONBOARDING_PT1 or var_0_13.NONE

				if not arg_98_0 then
					var_0_42(arg_97_0, Engine.CBBHFCGDIC("BATTLEPASS/REWARD_ERROR_MESSAGE"))
				elseif LUI.IsLastInputMouseNavigation(arg_97_0._controllerIndex) then
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassRewardPopup", true)
					var_0_71(arg_97_0)
				end
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_97_0._controllerIndex, false, var_97_0, nil, false, true)
	elseif arg_97_0._BRRewardState == var_0_13.ONBOARDING_PT1 and not LUI.FlowManager.IsInStack("BattlePassRewardPopup") then
		if not Onboarding.BattlePass.WasCompleted(arg_97_0, arg_97_0._controllerIndex) then
			local var_97_1 = {
				currentPage = 1,
				overrideAction = function()
					Engine.EBCGADABJ()
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassOnboardingPopup")

					arg_97_0._BRRewardState = var_0_13.REDEEMING

					var_0_71(arg_97_0)
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_97_0._controllerIndex, false, var_97_1)
		else
			arg_97_0._BRRewardState = var_0_13.REDEEMING

			var_0_71(arg_97_0)
		end
	elseif arg_97_0._BRRewardState == var_0_13.REDEEMING then
		if not arg_97_0._animatingBRReward then
			arg_97_0._animatingBRReward = true

			Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokeCardSlam)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_97_0._controllerIndex, false, {
				tierSkipID = BATTLEPASS.SINGLE_TIER_SKIP_ID
			})

			arg_97_0:Wait(1500).onComplete = function()
				LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

				arg_97_0._autoTierSkip = true
				arg_97_0._animatingBRReward = false

				var_0_52(arg_97_0, arg_97_0._controllerIndex)

				arg_97_0._BRRewardState = var_0_13.ONBOARDING_PT2
			end
		end
	elseif arg_97_0._BRRewardState == var_0_13.ONBOARDING_PT2 then
		arg_97_0._autoTierSkip = false

		if not Onboarding.BattlePass.WasCompleted(arg_97_0, arg_97_0._controllerIndex) then
			arg_97_0:Wait(1500).onComplete = function()
				local var_101_0 = {
					currentPage = 2,
					closeAction = function()
						arg_97_0._BRRewardState = var_0_13.UPSELLING

						var_0_71(arg_97_0)
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_97_0._controllerIndex, false, var_101_0)
			end
		else
			arg_97_0._BRRewardState = var_0_13.UPSELLING

			var_0_71(arg_97_0)
		end
	elseif arg_97_0._BRRewardState == var_0_13.UPSELLING then
		if var_0_40(arg_97_0) then
			var_0_41(arg_97_0)
		end

		arg_97_0._BRRewardState = var_0_13.NONE
	end
end

function PreLoadFunc(arg_103_0, arg_103_1, arg_103_2)
	arg_103_0._displayBattlePassInAAR = arg_103_2.displayBattlePassInAAR ~= nil
end

local function var_0_72(arg_104_0)
	local var_104_0 = LOOT.itemSourceExclusivity.NONE
	local var_104_1 = var_0_16(arg_104_0._currentChild, arg_104_0._lootIndex)
	local var_104_2 = var_104_1 and var_104_1.lootID

	if var_104_2 then
		var_104_0 = LOOT.GetGameSourceExclusivityByItemID(var_104_2)
	end

	arg_104_0._isGameSourceUpsellItemFocused = var_104_0 == LOOT.itemSourceExclusivity.CW_EXCLUSIVE and true or false
	arg_104_0._shouldShowGameSourceUpsell = arg_104_0._isGameSourceUpsellItemFocused and (not STORE.IsZeusOwned(arg_104_0._controllerIndex) or Dvar.IBEGCHEFE("RONTRKPRP") == true)

	ACTIONS.AnimateSequence(arg_104_0, arg_104_0._shouldShowGameSourceUpsell and "ShowGameSourceUpsell" or "HideGameSourceUpsell")
end

local function var_0_73(arg_105_0, arg_105_1)
	local var_105_0 = var_0_14(arg_105_0._currentChild)
	local var_105_1 = var_105_0 and #var_105_0.lootTable or 0

	if var_105_1 > 1 then
		if arg_105_1.button == "up" then
			if var_105_1 > arg_105_0._lootIndex then
				arg_105_0._lootIndex = arg_105_0._lootIndex + 1
			else
				arg_105_0._lootIndex = 1
			end
		elseif arg_105_1.button == "down" then
			if arg_105_0._lootIndex > 1 then
				arg_105_0._lootIndex = arg_105_0._lootIndex - 1
			else
				arg_105_0._lootIndex = var_105_1
			end
		end

		var_0_72(arg_105_0)
		arg_105_0._currentChild:CycleLootCards(arg_105_0._lootIndex)
		var_0_65(arg_105_0._currentChild, arg_105_0, arg_105_0._currentChild.isLockedWithBattlePass, arg_105_0._isBattlePassPopup)
		var_0_37(arg_105_0)
	end
end

local function var_0_74(arg_106_0, arg_106_1, arg_106_2)
	arg_106_0.AnimateXPEarned = var_0_38
	arg_106_0.AnimateXPEarnedInAAR = var_0_39
	arg_106_0.AnimateUnlocks = var_0_46
	arg_106_0.AnimateShowcase = var_0_47
	arg_106_0.AnimateVanguardTierEvent = var_0_48
	arg_106_0.UpdateMenuDisplay = var_0_37
	arg_106_0.CycleLootCards = var_0_73
	arg_106_0._screenOpenedTime = Engine.DEIDGHDBHD()
	arg_106_0.OpenBattlePassPopup = var_0_25
	arg_106_0.Grid = arg_106_0.BattlePassGridContainer.Grid
	arg_106_0.HorizontalScrollbar = arg_106_0.BattlePassGridContainer.HorizontalScrollbar
	arg_106_0._delayBlueprintIcon = true

	ACTIONS.ScaleFullscreen(arg_106_0.Background)

	if not arg_106_2.displayBattlePassInAAR then
		Engine.DHFCHIIJCA("quartermaster")
	end

	local var_106_0 = LUI.FlowManager.GetScopedData("MainMenu")

	arg_106_0._maxBattlePassLevel = BATTLEPASS.GetMaxTier()
	arg_106_0._controllerIndex = arg_106_1
	arg_106_0._battlePassXP = BATTLEPASS.GetLastMenuXP(arg_106_0._controllerIndex)

	if arg_106_2.displayBattlePassInAAR then
		arg_106_0._battlePassXP = arg_106_2.battlePassData.startTierXP
	end

	arg_106_0._previousXP = arg_106_0._battlePassXP
	arg_106_0._battlePassOwned = BATTLEPASS.IsOwned(arg_106_0._controllerIndex)
	arg_106_0._battlePassData = BATTLEPASS.GetAllTiersData(arg_106_0._controllerIndex)
	arg_106_0._availableCODPoints = Commerce.CEDDCGHIGA(arg_106_0._controllerIndex, LOOT.CurrencyIDs.COD_POINTS)
	arg_106_0._currentLevel = BATTLEPASS.GetTier(arg_106_0._controllerIndex)

	if arg_106_2.displayBattlePassInAAR then
		arg_106_0._currentLevel = BATTLEPASS.GetTierByXP(arg_106_0._controllerIndex, arg_106_0._battlePassXP)
	end

	arg_106_0._isAnimating = false
	arg_106_0._isExpanded = false
	arg_106_0._currentChild = nil
	arg_106_0._autoTierSkip = arg_106_2.tierSkipID ~= nil
	arg_106_0._displayBattlePassInAAR = arg_106_2.displayBattlePassInAAR ~= nil
	arg_106_0._isBattlePassPopup = arg_106_2.isBattlePassPopup
	arg_106_0._isStandalone = arg_106_0._isBattlePassPopup or arg_106_0._displayBattlePassInAAR or arg_106_2.isStandalone or arg_106_2.purchaseBattlePassInAAR
	arg_106_0._needFixUp = var_0_50(arg_106_0)
	arg_106_0._itemSelectionComplete = true
	arg_106_0._lootIndex = 1
	arg_106_0._BRRewardState = not arg_106_0._isStandalone and BATTLEPASS.BRRewardAvailable(arg_106_0._controllerIndex) and var_106_0.brRewardPending and var_0_13.PENDING or var_0_13.NONE
	arg_106_0._allowTierBank = arg_106_2.allowTierBank
	arg_106_0._shouldShowVGOnboarding = CONDITIONS.ShouldShowVanguardBPSplitTiersEvent(arg_106_0, arg_106_0._controllerIndex)
	arg_106_0._hasSeenVGSplitTierVid = true

	if var_106_0.crmPurchaseBattlePass then
		var_106_0.crmPurchaseBattlePass = nil
		arg_106_0._crmPurchaseBattlePass = true
	end

	if arg_106_0._BRRewardState == var_0_13.PENDING then
		arg_106_0._battlePassXP = BATTLEPASS.GetXP()
		arg_106_0._previousXP = arg_106_0._battlePassXP
	end

	arg_106_0.GetPurchaseAction = var_0_51
	arg_106_0.TriggerAutoTierSkip = var_0_52
	arg_106_0.TriggerPurchaseBattlePassInAAR = var_0_57
	arg_106_0.TriggerDisplayBattlePassInAAR = var_0_58
	arg_106_0.TriggerPurchaseBattlePassInStore = var_0_56
	arg_106_0.TriggerPurchaseBattlePassInVIPGift = var_0_55
	arg_106_0.DisableBundleBonusTopper = var_0_69

	arg_106_0:addElement(LOOT.GetLootFlareMaterialStreamer())
	arg_106_0.BattlePassStatus:UpdateActiveBanner(arg_106_0._battlePassOwned)
	var_0_66(arg_106_0._battlePassData)
	var_0_67(arg_106_0._battlePassData, arg_106_0._controllerIndex)
	var_0_68(arg_106_0._battlePassData, arg_106_0._controllerIndex)
	arg_106_0.BillboardImg:SetMask(arg_106_0.CenterOutMask)
	arg_106_0.FadeCover:SetMask(arg_106_0.CenterOutMaskFade)

	local function var_106_1(arg_107_0, arg_107_1, arg_107_2)
		local var_107_0 = arg_107_1 + 1
		local var_107_1 = arg_106_0._battlePassData[var_107_0]
		local var_107_2 = var_107_1 and tonumber(var_107_1.level) or 0
		local var_107_3 = var_107_2 <= 0
		local var_107_4 = var_107_2 == BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL
		local var_107_5 = {}
		local var_107_6 = Dvar.IBEGCHEFE("NKPPMRTRRK")

		for iter_107_0, iter_107_1 in ipairs(var_107_1.lootTable) do
			local var_107_7 = iter_107_1 and iter_107_1.lootID

			if var_107_7 then
				local var_107_8 = LOOT.IsItemIDEquippableByS4(var_107_7)

				if not var_107_8 or var_107_6 then
					if var_107_8 and iter_107_0 ~= 1 then
						var_107_5[iter_107_0] = var_107_5[1]
						var_107_5[1] = iter_107_1
					else
						var_107_5[iter_107_0] = iter_107_1
					end
				end
			else
				var_107_5[iter_107_0] = iter_107_1
			end
		end

		var_107_1.lootTable = var_107_5

		local var_107_9 = var_107_1 and var_107_1.lootTable[1]

		arg_107_0._isMultiItemGameSourceTier = var_107_1 and #var_107_1.lootTable > 1 and var_107_9 and var_107_9._gameSourceId

		if arg_107_0._isMultiItemGameSourceTier and arg_107_0.LootItemCardMiniDouble.FlipFocusable then
			local var_107_10 = {
				promptsData = {
					{
						button_ref = "button_right_stick",
						keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
						helper_text = Engine.CBBHFCGDIC("BATTLEPASS/FLIP")
					}
				}
			}

			arg_107_0.LootItemCardMiniDouble.FlipFocusable:AddTooltipData(arg_106_0._controllerIndex, var_107_10)
		end

		arg_107_0.itemData = var_107_1

		arg_107_0:SetupLootData(var_107_1)

		local var_107_11 = arg_107_0.lootData

		arg_107_0:SetBattlePassOwned(arg_106_0._battlePassOwned)
		arg_107_0:SetTopBanner(var_107_1 and var_107_1.isFree == "1", not arg_106_0._battlePassOwned and var_107_3, var_107_4, var_107_1.isFree)
		arg_107_0:SetIsAnimating(arg_106_0._isAnimating)
		arg_107_0:EnableGlow(false)

		local var_107_12 = 0

		if not var_107_3 then
			local var_107_13 = var_107_1 and tonumber(var_107_1.xp) or 0

			if var_107_13 <= arg_106_0._battlePassXP then
				var_107_12 = 1
			else
				local var_107_14 = 0

				if var_107_2 > 1 and not var_107_4 then
					var_107_14 = BATTLEPASS.GetTierMinXP(var_107_2 - 1)
				end

				if var_107_14 < arg_106_0._battlePassXP then
					local var_107_15 = var_107_13 - var_107_14

					var_107_12 = (arg_106_0._battlePassXP - var_107_14) / var_107_15
				end
			end

			if var_107_12 ~= 1 then
				ACTIONS.AnimateSequence(arg_107_0, "HideCheckbox")
			end
		else
			var_107_12 = arg_106_0._battlePassOwned and 1 or 0
		end

		local var_107_16 = var_107_2

		if var_107_3 or var_107_4 then
			var_107_16 = nil
		end

		arg_107_0:SetLevel(var_107_16, var_107_1 and var_107_1.showProgress)
		arg_107_0:SetProgress(var_107_12, 0)
		arg_107_0:SetIsBundleBonus(var_107_4)

		if var_107_1 and var_107_1.lootTable[1].challengeID and var_107_1.lootTable[1].challengeID ~= "" then
			arg_107_0:ShowMission(true)
		else
			arg_107_0:ShowMission(false)
		end

		arg_107_0._column = arg_107_1

		arg_107_0:UpdateExpandedState()

		local var_107_17 = var_107_12 == 1
		local var_107_18 = var_107_12 < 1
		local var_107_19 = var_107_1 and var_107_1.isFree == "1"
		local var_107_20 = var_107_12 == 1 and var_107_1 and var_107_1.isFree ~= "1"
		local var_107_21

		var_107_21 = not var_107_19 or not var_107_17 or var_107_3

		local var_107_22

		arg_107_0.isLockedWithBattlePass, var_107_22 = not var_107_17 and not var_107_3, var_107_1 and tonumber(var_107_1.isFree) == BATTLEPASS.ItemTypes.CLAN

		arg_107_0:SetOwned(var_107_17)
		arg_107_0:SetLocked(not arg_106_0._battlePassOwned and (var_107_3 or var_107_20) or var_107_18 and not var_107_3)

		if not var_107_17 and (not var_107_3 or not arg_106_0._battlePassOwned) then
			local var_107_23 = BATTLEPASS.GetTierLootIsPromoted(arg_106_0._controllerIndex, var_107_2, var_107_1.subTierID)

			arg_107_0:SetPromoted(var_107_23)

			local var_107_24 = BATTLEPASS.GetTierLootIsShowcased(arg_106_0._controllerIndex, var_107_2, var_107_1.subTierID)

			arg_107_0:SetShowcased(var_107_24)
		else
			arg_107_0:SetShowcased(false)
			arg_107_0:SetPromoted(false)
		end

		arg_107_0:SetDirectionalInputEnabled(not arg_106_0._isAnimating)

		if not arg_107_0._buttonHandlerAdded then
			arg_107_0._buttonHandlerAdded = true

			arg_107_0:addEventHandler("button_over", function(arg_108_0, arg_108_1)
				if arg_106_0._focusItem == nil or arg_106_0._focusItem ~= arg_108_0 then
					if arg_106_0._focusItem ~= nil then
						var_0_64(arg_106_0._focusItem, false)
						arg_106_0._focusItem:processEvent({
							name = "lose_active"
						})
					end

					arg_106_0._focusItem = arg_108_0
					arg_106_0._currentChild = arg_107_0
					arg_106_0._lootIndex = 1
				end

				var_0_72(arg_106_0)

				local var_108_0 = var_0_14(arg_107_0)
				local var_108_1 = not (var_108_0 and tonumber(var_108_0.level) <= 0 or false) and not arg_107_0._isOwned

				arg_106_0.BillboardImg:SetHandleMouse(var_108_1)
				var_0_65(arg_107_0, arg_106_0, var_108_1, arg_106_0._isBattlePassPopup)
				var_0_37(arg_106_0)
			end)
			arg_107_0.LootItemCardMiniDouble.FlipFocusable:addEventHandler("button_action", function(arg_109_0, arg_109_1)
				if arg_107_0._backCardPulledUp then
					arg_106_0:CycleLootCards({
						button = "down"
					})
				end
			end)
			arg_107_0.LootItemCardMiniDouble:addEventHandler("button_action", function(arg_110_0, arg_110_1)
				arg_110_0 = arg_110_0:getParent()

				local var_110_0 = not arg_110_1.keyboard or arg_106_0._battlePassOwned

				if arg_106_0._shouldShowGameSourceUpsell and var_110_0 then
					LUI.FlowManager.RequestPopupMenu(arg_106_0, "WZCWUpsellPopup", true, arg_106_0._controllerIndex, false)
				elseif not arg_110_1.keyboard then
					local var_110_1 = arg_110_1.controller == arg_106_0._controllerIndex

					if not arg_106_0._isAnimating and var_110_1 and not arg_106_0._displayBattlePassInAAR and LOOT.CanPreview(arg_110_0.lootData.type, arg_110_0.lootData.itemID) then
						STORE.PreviewItem(arg_106_0._controllerIndex, arg_110_0.lootData.type, arg_110_0.lootData.itemID, nil, nil, true)
					end
				end

				return true
			end)
		end
	end

	if CONDITIONS.IsBattlePassBundleTopperActive() then
		local var_106_2 = Engine.DEIDGHDBHD()
		local var_106_3 = Dvar.CFHDGABACF("LKOKTLQSPT")
		local var_106_4 = (var_106_2 < var_106_3 and var_106_3 - var_106_2 or 0) * 1000
		local var_106_5 = var_106_4 > BATTLEPASS.TOPPER_TIMER_MAX_THRESHOLD_MS and BATTLEPASS.TOPPER_TIMER_MAX_THRESHOLD_TIMER_TICK_MS or var_106_4

		arg_106_0._gridTimer = LUI.UITimer.new({
			event = "disable_bp_topper_timer",
			interval = var_106_5
		})
		arg_106_0._gridTimer.id = "bpTopperTimerGrid"

		arg_106_0:addElement(arg_106_0._gridTimer)
		arg_106_0:addAndCallEventHandler("disable_bp_topper_timer", function()
			local var_111_0 = Engine.DEIDGHDBHD()
			local var_111_1 = Dvar.CFHDGABACF("LKOKTLQSPT")

			if (var_111_0 < var_111_1 and var_111_1 - var_111_0 or 0) == 0 then
				arg_106_0:DisableBundleBonusTopper(arg_106_0)
			end
		end)
	end

	arg_106_0.Grid:SetSnapOnWrapEnabled(true)
	arg_106_0.Grid:SetRefreshChild(var_106_1)
	arg_106_0.Grid:SetNumChildren(#arg_106_0._battlePassData)
	arg_106_0.Grid:SetMeasureColumnFunction(LUI.ExpanderUtils.GenerateMeasureColumnFunction(150 * _1080p))
	arg_106_0.Grid:RefreshContent()

	local var_106_6 = Onboarding.BattlePass.WasCompleted(arg_106_0, arg_106_0._controllerIndex)

	arg_106_0.Grid:SetNotifyOnLayoutInit(true)
	arg_106_0.Grid:addEventHandler("layout_initialized", function()
		var_106_6 = Onboarding.BattlePass.WasCompleted(arg_106_0, arg_106_0._controllerIndex)

		local var_112_0 = BATTLEPASS.HasNewPassForSeason(arg_106_0._controllerIndex) and not BATTLEPASS.IsOwned(arg_106_0._controllerIndex) or Dvar.IBEGCHEFE("battlepass_always_show_upsell") and not arg_106_0._upsellSeen

		if var_106_6 and not var_112_0 and arg_106_0._BRRewardState == var_0_13.NONE and not arg_106_0._crmPurchaseBattlePass then
			var_0_38(arg_106_0)
		end
	end)

	if arg_106_0._BRRewardState == var_0_13.NONE and not arg_106_0._isStandalone then
		if arg_106_0._crmPurchaseBattlePass and not BATTLEPASS.IsOwned(arg_106_0._controllerIndex) then
			Onboarding.BattlePass.MarkCompleted(arg_106_0, arg_106_0._controllerIndex)
			BATTLEPASS.MarkPassSeenForSeason(arg_106_0._controllerIndex, SEASON.GetCurrentSeasonDataNum({
				isForBattlePass = true
			}))
			var_0_54(arg_106_0, arg_106_1)
		elseif not var_106_6 then
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_106_0._controllerIndex, false)
		end
	end

	if var_106_0.showBattlePassPurchasePopup then
		var_106_0.showBattlePassPurchasePopup = nil

		var_0_54(arg_106_0, arg_106_1)
	end

	local function var_106_7(arg_113_0, arg_113_1)
		var_106_6 = Onboarding.BattlePass.WasCompleted(arg_106_0, arg_106_0._controllerIndex)

		if not arg_106_0._isAnimating and var_106_6 then
			if var_0_40(arg_106_0) then
				if Dvar.IBEGCHEFE("battlepass_use_showcase_animation") then
					arg_106_0:AnimateShowcase()
				else
					var_0_41(arg_106_0)
				end
			elseif arg_106_0._shouldShowVGOnboarding and not arg_106_0._hasSeenVGSplitTierVid then
				arg_106_0._hasSeenVGSplitTierVid = true

				local function var_113_0(arg_114_0)
					return function()
						arg_106_0:AnimateVanguardTierEvent()
						Onboarding.VanguardBattlePassSplitTiers.MarkCompleted(arg_106_0, arg_106_0._controllerIndex)
					end
				end

				local var_113_1 = {
					unskippable = false,
					disableQuickAccess = true,
					video = "mtx_vg_tiers_activated_1080",
					skipImmediate = false,
					isEncrypted = false,
					skipVideoOnPartyJoin = true,
					onVideoFinished = var_113_0(arg_106_0._controllerIndex)
				}

				LUI.FlowManager.RequestPopupMenu(arg_106_0, "CinematicFullscreen", true, arg_106_0._controllerIndex, false, var_113_1)
				Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpVGTierRevealVideo)
			end
		end
	end

	if arg_106_0._isStandalone then
		if not arg_106_0._displayBattlePassInAAR then
			arg_106_0._battlePassXP = BATTLEPASS.GetXP(arg_106_0._controllerIndex)
		end

		ACTIONS.AnimateSequence(arg_106_0, "SetupStandalone")
		arg_106_0.HorizontalScrollbar:SetAlpha(0)
		arg_106_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(true)
	else
		arg_106_0:addEventHandler("gain_focus", function(arg_116_0, arg_116_1)
			if arg_106_0._BRRewardState ~= var_0_13.NONE then
				var_0_71(arg_106_0)
			else
				var_106_7(arg_116_0, arg_116_1)
			end
		end)

		if LUI.IsLastInputMouseNavigation(arg_106_0._controllerIndex) then
			arg_106_0:processEvent({
				name = "gain_focus"
			})
		end

		arg_106_0:addEventHandler("restore_focus", function(arg_117_0, arg_117_1)
			local var_117_0 = LUI.FlowManager.GetScopedData(arg_106_0)

			if arg_106_0._BRRewardState ~= var_0_13.NONE then
				var_0_71(arg_106_0)
			elseif var_117_0.restoreTiersPopup then
				var_117_0.restoreTiersPopup = false

				LUI.FlowManager.RequestPopupMenu(arg_106_0, "BattlePassTiersPurchasePopup", true, arg_106_1, false, {
					sourceMenu = arg_106_0,
					tierSkips = arg_106_0._tierSkips
				})
			elseif var_117_0.isPurchaseFromPreview then
				var_117_0.isPurchaseFromPreview = false

				var_0_60(arg_106_0, {
					controller = arg_106_0._controllerIndex
				})
			else
				var_106_7(arg_117_0, arg_117_1)
			end

			var_0_20(arg_117_0)

			if not arg_117_0._displayBattlePassInAAR then
				Engine.DHFCHIIJCA("quartermaster")
			end
		end)
	end

	local function var_106_8()
		arg_106_0._numTransactionsComplete = arg_106_0._numTransactionsComplete + 1

		arg_106_0:dispatchEventToRoot({
			name = "update_battle_pass_purchasing_popup",
			progress = arg_106_0._numTransactionsComplete / arg_106_0._numTransactions
		})
	end

	arg_106_0.BillboardImg:SetHandleMouse(true)
	arg_106_0.BillboardImg:registerEventHandler("leftmousedown", function(arg_119_0, arg_119_1)
		return true
	end)
	arg_106_0.BillboardImg:registerEventHandler("leftmouseup", function(arg_120_0, arg_120_1)
		var_0_60(arg_106_0, arg_120_1)

		return true
	end)

	if arg_106_0.BattlePassPurchaseButton then
		arg_106_0.BattlePassPurchaseButton:addEventHandler("button_action", function(arg_121_0, arg_121_1)
			if arg_121_1.mouse then
				var_0_60(arg_106_0, arg_121_1)
			end
		end)
	end

	arg_106_0:addEventHandler("loot_item_transaction_complete", function(arg_122_0, arg_122_1)
		var_106_8()

		arg_106_0._queuedRef = nil
	end)
	arg_106_0:addEventHandler("loot_item_transaction_error", function(arg_123_0, arg_123_1)
		if arg_123_1.errorCode == STORE.ProductNoLongerAvailableError then
			LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_106_1, false)
		end

		DebugPrint("BattlePass loot_item_transaction_error for ref: " .. arg_106_0._queuedRef)

		arg_106_0._purchaseEnabled = true
		arg_106_0._errorCode = BATTLEPASS.GetErrorCode(arg_123_1.name, arg_106_0._queuedRef)
	end)
	arg_106_0:addEventHandler("battlepass_activation_failed", function(arg_124_0, arg_124_1)
		DebugPrint("BattlePass battlepass_activation_failed for ref: " .. arg_106_0._queuedRef)

		arg_106_0._purchaseEnabled = true
		arg_106_0._errorCode = BATTLEPASS.GetErrorCode(arg_124_1.name, arg_106_0._queuedRef)
	end)
	arg_106_0:addEventHandler("cycle_loot_cards", function(arg_125_0, arg_125_1)
		arg_106_0:CycleLootCards({
			button = "down"
		})
	end)

	local function var_106_9(arg_126_0, arg_126_1)
		if arg_126_0._currentChild then
			local var_126_0 = arg_126_0._currentChild.lootData.type == LOOT.itemTypes.WEAPON
			local var_126_1 = arg_126_0._missionChallengeID

			if var_126_0 or var_126_1 then
				var_0_23(arg_126_0, arg_126_1)
			else
				var_0_25(arg_126_0, arg_126_1)
			end
		else
			var_0_25(arg_126_0, arg_126_1)
		end
	end

	local function var_106_10(arg_127_0, arg_127_1)
		if CONDITIONS.IsGiftingEnabled() and BATTLEPASS.IsOwned(arg_127_0._controllerIndex) then
			var_0_62(arg_127_0, arg_127_1)
		end
	end

	local function var_106_11(arg_128_0, arg_128_1)
		local var_128_0 = not arg_128_1.keyboard or arg_128_0._battlePassOwned

		if arg_128_0._shouldShowGameSourceUpsell and var_128_0 then
			LUI.FlowManager.RequestPopupMenu(arg_128_0, "WZCWUpsellPopup", true, arg_128_0._controllerIndex, false)
		end
	end

	GRID.SetUpArrowScrolling(arg_106_0, arg_106_1, {
		numGridItemsShown = var_0_2,
		scrollStepsForward = var_0_3,
		scrollStepsBack = var_0_4,
		onUpdateInputType = var_0_35,
		ignoreCondition = arg_106_0._displayBattlePassInAAR,
		bindButtonInput = {
			button_left_trigger = LUI.IsLastInputKeyboardMouse(arg_106_0._controllerIndex) and var_0_59 or nil,
			button_alt1 = var_0_60,
			button_alt2 = var_106_10,
			button_right_stick = var_106_9,
			button_left_stick = var_0_24,
			button_right_trigger = LUI.IsLastInputKeyboardMouse(arg_106_0._controllerIndex) and var_106_11 or nil
		},
		bitsToSetOnScroll = {
			arg_106_0._delayBlueprintIcon
		},
		kbmArrowUI = {
			leftArrow = arg_106_0.LeftArrow,
			rightArrow = arg_106_0.RightArrow
		},
		gamePadArrowUI = {
			leftPrompt = arg_106_0.LeftPrompt,
			rightPrompt = arg_106_0.RightPrompt
		}
	})
	arg_106_0:addEventHandler("battlepass_event_complete", function(arg_129_0, arg_129_1)
		DebugPrint("BattlePass battlepass_event_complete for ref: " .. arg_106_0._queuedRef)
		var_106_8()

		arg_106_0._battlePassOwned = BATTLEPASS.IsOwned(arg_106_0._controllerIndex)

		arg_106_0.BattlePassStatus:UpdateActiveBanner(arg_106_0._battlePassOwned)

		if tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_106_0._queuedRef, CSV.battlePassIDs.cols.type)) == BATTLEPASS.ItemTypes.TIER_SKIP and arg_129_1.controller then
			local var_129_0 = StringTable.BJJBBCJGEJ(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_106_0._queuedRef)
			local var_129_1 = CSV.ReadRowWithFile(CSV.battlePassIDs, CSV.battlePassIDs.file, var_129_0)
			local var_129_2 = tonumber(var_129_1.skips)
			local var_129_3 = arg_129_1.rank - var_129_2

			Engine.CEJJDJJHIJ(arg_129_1.controller, "dlog_event_bp_tier_up", {
				previous_bp_tier = var_129_3,
				new_bp_tier = arg_129_1.rank,
				reason = var_129_1.event
			})
		end

		if arg_106_0._activation then
			if arg_106_0._activation.id and arg_106_0._activation.count then
				if arg_106_0._activation.id == arg_106_0._activation.count then
					arg_106_0._queuedPurchase = nil
				end
			else
				arg_106_0._queuedPurchase = nil
			end
		end

		arg_106_0._queuedRef = nil

		if CONDITIONS.IsGiftingEnabled() and arg_106_0._battlePassOwned then
			arg_106_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_alt2",
				priority = 6,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_BATTLEPASS")
			})
		end
	end)
	arg_106_0:addEventHandler("battlepass_send_event_failed", function(arg_130_0, arg_130_1)
		DebugPrint("BattlePass battlepass_send_event_failed for ref: " .. arg_106_0._queuedRef)

		arg_106_0._errorCode = BATTLEPASS.GetErrorCode(arg_130_1.name, arg_106_0._queuedRef)
	end)

	local function var_106_12()
		LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup")

		arg_106_0._needFixUp = var_0_50(arg_106_0)
		arg_106_0._battlePassOwned = BATTLEPASS.IsOwned(arg_106_0._controllerIndex)
		arg_106_0._battlePassXP = BATTLEPASS.GetXP(arg_106_0._controllerIndex)

		if arg_106_0._fixingUp then
			arg_106_0._fixingUp = false

			arg_106_0:Wait(1, true)
		end
	end

	arg_106_0:addEventHandler("battlepass_fixup_complete", function(arg_132_0, arg_132_1)
		DebugPrint("BattlePass battlepass_fixup_complete")

		local var_132_0 = BATTLEPASS.IsOwned(arg_106_0._controllerIndex)
		local var_132_1 = BATTLEPASS.GetXP(arg_106_0._controllerIndex)
		local var_132_2 = arg_106_0._battlePassOwned ~= var_132_0
		local var_132_3 = arg_106_0._battlePassXP ~= var_132_1

		var_106_12()
		arg_106_0.BattlePassStatus:UpdateActiveBanner(var_132_0)

		local var_132_4

		if var_132_2 and var_132_3 then
			var_132_4 = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_TIER_BUNDLE_UNLOCKED
		elseif var_132_2 then
			var_132_4 = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_UNLOCKED
		elseif var_132_3 then
			var_132_4 = BATTLEPASS.FullScreenPopupStates.TIERS_UNLOCKED
		else
			var_132_4 = BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_UNLOCKED
		end

		LUI.FlowManager.RequestPopupMenu(nil, "BattlePassFullScreenPopup", true, arg_106_0._controllerIndex, false, {
			state = var_132_4
		}, nil, false, true)

		local var_132_5

		local function var_132_6()
			arg_106_0:Wait(100).onComplete = function()
				if LUI.FlowManager.IsInStack("BattlePassFullScreenPopup") then
					var_132_6()
				else
					var_0_49(arg_106_0, var_132_3 and not var_132_2)
				end
			end
		end

		var_132_6()
	end)
	arg_106_0:addEventHandler("battlepass_fixup_failed", function(arg_135_0, arg_135_1)
		DebugPrint("BattlePass battlepass_fixup_failed")
		var_106_12()
		var_0_42(arg_106_0, Engine.CBBHFCGDIC("BATTLEPASS/FAILED_CLAIM", "BATTLEPASS/BATTLE_PASS_TOKENS"))
	end)
	arg_106_0:addEventHandler("FocusBattlepassTile", function(arg_136_0, arg_136_1)
		arg_106_0.Grid:SetFocusedPosition({
			y = 0,
			x = arg_136_1.tileIndex
		}, false, nil, false)

		arg_106_0._currentChild = arg_106_0.Grid:GetElementAtPosition(arg_136_1.tileIndex, 0)
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_106_0, arg_106_1)
	ACTIONS.ScaleFullscreen(arg_106_0.Background)

	local function var_106_13()
		local var_137_0 = CoD.GetAspectRatioScaleAdjust(0.65)

		arg_106_0.VignetteRight:SetScale(var_137_0)

		local var_137_1 = CoD.GetAspectRatioScaleAdjust(0.5)

		arg_106_0.VignetteLeft:SetScale(var_137_1)
	end

	arg_106_0:addAndCallEventHandler("onVideoChange", var_106_13)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_106_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_106_0, "JP")
	end

	arg_106_0:addEventHandler("gamepad_button", function(arg_138_0, arg_138_1)
		if arg_138_1.controller ~= arg_106_0._controllerIndex then
			if arg_138_1.button == "left" or arg_138_1.button == "right" or arg_138_1.button == "up" or arg_138_1.button == "down" then
				return true
			end
		elseif arg_138_1.down and not arg_106_0._isAnimating and (arg_138_1.button == "up" or arg_138_1.button == "down") then
			var_0_73(arg_106_0, arg_138_1)
		end
	end)
	arg_106_0:addEventHandler("purchase_aar_battlepass", function(arg_139_0, arg_139_1)
		var_0_57(arg_106_0, arg_106_1)
	end)

	if arg_106_0._isBattlePassPopup then
		arg_106_0:addEventHandler("menu_create", function(arg_140_0, arg_140_1)
			var_0_37(arg_106_0)
		end)
	else
		arg_106_0:addEventHandler("tab_create", function()
			arg_106_0._currentMenu = arg_106_0:GetCurrentMenu(arg_106_0)

			var_0_37(arg_106_0)
		end)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_106_0, "WZWipSetup")
	end

	local var_106_14 = LUI.FlowManager.GetScopedData("MainMenu")

	if var_106_14 and var_106_14.ShouldHandleGiftBattlePass then
		var_106_14.ShouldHandleGiftBattlePass = nil

		local function var_106_15(arg_142_0)
			if not Onboarding.BattlePass.WasCompleted(arg_142_0, arg_142_0._controllerIndex) then
				local var_142_0 = {
					skipDelay = true,
					menu = arg_142_0,
					closeAction = function(arg_143_0)
						var_0_60(arg_143_0, {
							controller = arg_143_0._controllerIndex
						})
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "BattlePassOnboardingPopup", true, arg_142_0._controllerIndex, true, var_142_0)
			else
				var_0_60(arg_142_0, {
					controller = arg_142_0._controllerIndex
				})
			end
		end

		local var_106_16

		local function var_106_17(arg_144_0)
			arg_144_0:Wait(100).onComplete = function(arg_145_0)
				if LUI.FlowManager.IsInStack("BattlePassOnboardingPopup") then
					var_106_17(arg_145_0)
				else
					var_106_15(arg_145_0)
				end
			end
		end

		var_106_17(arg_106_0)
	elseif not arg_106_0._isBattlePassPopup then
		arg_106_0:addAndCallEventHandler("gift_queued_in", function(arg_146_0, arg_146_1)
			var_0_45(arg_106_0)

			return true
		end)
	end

	arg_106_0:registerEventHandler("claim_pending_bp_purchase_gift", function(arg_147_0, arg_147_1)
		arg_106_0._needFixUp = var_0_50(arg_106_0)

		var_0_60(arg_106_0, arg_147_1)
		Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokeCardSlam)

		arg_106_0._autoTierSkip = true
		arg_106_0._animatingBRReward = false

		var_0_52(arg_106_0, arg_106_0._controllerIndex)

		arg_106_0._BRRewardState = var_0_13.ONBOARDING_PT2
	end)

	arg_106_0.OpenGiftingPopup = var_0_26
end

function BattlePassMenu(arg_148_0, arg_148_1)
	local var_148_0 = LUI.UIElement.new()

	var_148_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_148_0.id = "BattlePassMenu"
	var_148_0._animationSets = var_148_0._animationSets or {}
	var_148_0._sequences = var_148_0._sequences or {}

	local var_148_1 = arg_148_1 and arg_148_1.controllerIndex

	if not var_148_1 and not Engine.DDJFBBJAIG() then
		var_148_1 = var_148_0:getRootController()
	end

	assert(var_148_1)
	PreLoadFunc(var_148_0, var_148_1, arg_148_1)

	local var_148_2 = var_148_0
	local var_148_3
	local var_148_4 = LUI.UIImage.new()

	var_148_4.id = "Background"

	var_148_4:SetRGBFromInt(0, 0)
	var_148_4:SetAlpha(0.9, 0)
	var_148_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_148_0:addElement(var_148_4)

	var_148_0.Background = var_148_4

	local var_148_5
	local var_148_6 = LUI.UIImage.new()

	var_148_6.id = "BillboardImg"

	var_148_6:setImage(RegisterMaterial("mw_store_billboard_placeholder"), 0)
	var_148_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -340, _1080p * 380)
	var_148_0:addElement(var_148_6)

	var_148_0.BillboardImg = var_148_6

	local var_148_7
	local var_148_8 = LUI.UIImage.new()

	var_148_8.id = "CenterOutMask"

	var_148_8:setImage(RegisterMaterial("ui_mp_br_shared_item_mask"), 0)
	var_148_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -355, _1080p * 405)
	var_148_0:addElement(var_148_8)

	var_148_0.CenterOutMask = var_148_8

	local var_148_9
	local var_148_10 = LUI.UIImage.new()

	var_148_10.id = "FadeCover"

	var_148_10:SetRGBFromInt(0, 0)
	var_148_10:SetAlpha(0, 0)
	var_148_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -463, _1080p * 486)
	var_148_0:addElement(var_148_10)

	var_148_0.FadeCover = var_148_10

	local var_148_11
	local var_148_12 = LUI.UIImage.new()

	var_148_12.id = "CenterOutMaskFade"

	var_148_12:setImage(RegisterMaterial("ui_mp_br_shared_item_mask"), 0)
	var_148_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1038, _1080p * 1007, _1080p * -404, _1080p * 409)
	var_148_0:addElement(var_148_12)

	var_148_0.CenterOutMaskFade = var_148_12

	local var_148_13
	local var_148_14 = LUI.UIImage.new()

	var_148_14.id = "VignetteRight"

	var_148_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_148_14:SetAlpha(0.3, 0)
	var_148_14:setImage(RegisterMaterial("gradient_curve"), 0)
	var_148_14:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -467, 0, 0)
	var_148_0:addElement(var_148_14)

	var_148_0.VignetteRight = var_148_14

	local var_148_15
	local var_148_16 = LUI.UIImage.new()

	var_148_16.id = "VignetteLeft"

	var_148_16:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_148_16:SetAlpha(0.9, 0)
	var_148_16:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_148_16:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1920, _1080p * -1030, 0, 0)
	var_148_0:addElement(var_148_16)

	var_148_0.VignetteLeft = var_148_16

	local var_148_17
	local var_148_18 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_148_1
	}
	local var_148_19 = MenuBuilder.BuildRegisteredType("IconImage", var_148_18)

	var_148_19.id = "LeftPrompt"

	var_148_19:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_148_19:setImage(RegisterMaterial("button_trigger_left"), 0)
	var_148_19:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -771, _1080p * -727, _1080p * -267, _1080p * -223)
	var_148_0:addElement(var_148_19)

	var_148_0.LeftPrompt = var_148_19

	local var_148_20
	local var_148_21 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_148_1
	}
	local var_148_22 = MenuBuilder.BuildRegisteredType("IconImage", var_148_21)

	var_148_22.id = "RightPrompt"

	var_148_22:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_148_22:setImage(RegisterMaterial("button_trigger_right"), 0)
	var_148_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 727, _1080p * 771, _1080p * -267, _1080p * -223)
	var_148_0:addElement(var_148_22)

	var_148_0.RightPrompt = var_148_22

	local var_148_23

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		var_148_23 = MenuBuilder.BuildRegisteredType("BattlePassPurchaseButton", {
			controllerIndex = var_148_1
		})
		var_148_23.id = "BattlePassPurchaseButton"

		var_148_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 572, _1080p * 413, _1080p * 613)
		var_148_0:addElement(var_148_23)

		var_148_0.BattlePassPurchaseButton = var_148_23
	end

	local var_148_24
	local var_148_25 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_148_1
	})

	var_148_25.id = "WeaponAttributes"

	var_148_25:SetAlpha(0, 0)
	var_148_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 508, _1080p * 433, _1080p * 593)
	var_148_0:addElement(var_148_25)

	var_148_0.WeaponAttributes = var_148_25

	local var_148_26
	local var_148_27 = LUI.UIStyledText.new()

	var_148_27.id = "QualityText"

	var_148_27:setText(Engine.CBBHFCGDIC("BATTLEPASS/RARITY_AND_TYPE"), 0)
	var_148_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_148_27:SetWordWrap(false)
	var_148_27:SetAlignment(LUI.Alignment.Left)
	var_148_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_148_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 141, _1080p * 617, _1080p * 218, _1080p * 246)
	var_148_0:addElement(var_148_27)

	var_148_0.QualityText = var_148_27

	local var_148_28
	local var_148_29 = LUI.UIImage.new()

	var_148_29.id = "RarityIcon"

	var_148_29:setImage(RegisterMaterial("icon_rarity_4"), 0)
	var_148_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 128, _1080p * 216, _1080p * 248)
	var_148_0:addElement(var_148_29)

	var_148_0.RarityIcon = var_148_29

	local var_148_30
	local var_148_31 = LUI.UIStyledText.new()

	var_148_31.id = "WeaponDescription"

	var_148_31:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_148_31:setText("some random text here", 0)
	var_148_31:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_148_31:SetAlignment(LUI.Alignment.Left)
	var_148_31:SetOptOutRightToLeftAlignmentFlip(true)
	var_148_31:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_148_31:SetStartupDelay(1000)
	var_148_31:SetLineHoldTime(400)
	var_148_31:SetAnimMoveTime(1000)
	var_148_31:SetAnimMoveSpeed(150)
	var_148_31:SetEndDelay(1000)
	var_148_31:SetCrossfadeTime(1000)
	var_148_31:SetFadeInTime(300)
	var_148_31:SetFadeOutTime(300)
	var_148_31:SetMaxVisibleLines(2)
	var_148_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 572, _1080p * 319, _1080p * 341)
	var_148_0:addElement(var_148_31)

	var_148_0.WeaponDescription = var_148_31

	local var_148_32
	local var_148_33 = LUI.UIStyledText.new()

	var_148_33.id = "DetailsPrompt"

	var_148_33:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_148_33:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIEW_REWARD_DETAILS"), 0)
	var_148_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_148_33:SetWordWrap(false)
	var_148_33:SetAlignment(LUI.Alignment.Left)
	var_148_33:SetOptOutRightToLeftAlignmentFlip(true)
	var_148_33:SetTintFontIcons(true)
	var_148_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 472, _1080p * 319, _1080p * 343)
	var_148_0:addElement(var_148_33)

	var_148_0.DetailsPrompt = var_148_33

	local var_148_34
	local var_148_35 = LUI.UIStyledText.new()

	var_148_35.id = "DetailsPromptAttributesOpened"

	var_148_35:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_148_35:SetAlpha(0, 0)
	var_148_35:setText(Engine.CBBHFCGDIC("BATTLEPASS/HIDE_REWARD_DETAILS"), 0)
	var_148_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_148_35:SetWordWrap(false)
	var_148_35:SetAlignment(LUI.Alignment.Left)
	var_148_35:SetOptOutRightToLeftAlignmentFlip(true)
	var_148_35:SetTintFontIcons(true)
	var_148_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 472, _1080p * 586, _1080p * 610)
	var_148_0:addElement(var_148_35)

	var_148_0.DetailsPromptAttributesOpened = var_148_35

	local var_148_36
	local var_148_37 = MenuBuilder.BuildRegisteredType("GenericArrowButtonLarge", {
		controllerIndex = var_148_1
	})

	var_148_37.id = "LeftArrow"

	var_148_37:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -830, _1080p * -690, _1080p * -370, _1080p * -120)
	var_148_0:addElement(var_148_37)

	var_148_0.LeftArrow = var_148_37

	local var_148_38
	local var_148_39 = MenuBuilder.BuildRegisteredType("GenericArrowButtonLarge", {
		controllerIndex = var_148_1
	})

	var_148_39.id = "RightArrow"

	var_148_39.Arrow:SetZRotation(271, 0)
	var_148_39:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 691, _1080p * 831, _1080p * -370, _1080p * -120)
	var_148_0:addElement(var_148_39)

	var_148_0.RightArrow = var_148_39

	local var_148_40
	local var_148_41 = LUI.UIStyledText.new()

	var_148_41.id = "Name"

	var_148_41:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_148_41:setText(ToUpperCase("TITLE"), 0)
	var_148_41:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_148_41:SetWordWrap(false)
	var_148_41:SetTracking(5 * _1080p, 0)
	var_148_41:SetAlignment(LUI.Alignment.Left)
	var_148_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 249, _1080p * 319)
	var_148_0:addElement(var_148_41)

	var_148_0.Name = var_148_41

	local var_148_42
	local var_148_43 = LUI.UIImage.new()

	var_148_43.id = "BlueprintIcon"

	var_148_43:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_148_43:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_148_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 283, _1080p * 329, _1080p * 259, _1080p * 305)
	var_148_0:addElement(var_148_43)

	var_148_0.BlueprintIcon = var_148_43

	local var_148_44
	local var_148_45 = MenuBuilder.BuildRegisteredType("BattlePassStatus", {
		controllerIndex = var_148_1
	})

	var_148_45.id = "BattlePassStatus"

	var_148_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1388, _1080p * 1824, _1080p * 218, _1080p * 282)
	var_148_0:addElement(var_148_45)

	var_148_0.BattlePassStatus = var_148_45

	local var_148_46
	local var_148_47 = LUI.UIStyledText.new()

	var_148_47.id = "UnlockCriteria"

	var_148_47:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_148_47:SetAlpha(0, 0)
	var_148_47:setText("Rewarded with Battle Pass", 0)
	var_148_47:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_148_47:SetWordWrap(false)
	var_148_47:SetAlignment(LUI.Alignment.Left)
	var_148_47:SetOptOutRightToLeftAlignmentFlip(true)
	var_148_47:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_148_47:SetStartupDelay(1000)
	var_148_47:SetLineHoldTime(400)
	var_148_47:SetAnimMoveTime(1000)
	var_148_47:SetAnimMoveSpeed(150)
	var_148_47:SetEndDelay(1000)
	var_148_47:SetCrossfadeTime(250)
	var_148_47:SetFadeInTime(300)
	var_148_47:SetFadeOutTime(300)
	var_148_47:SetMaxVisibleLines(1)
	var_148_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 125, _1080p * 600, _1080p * 319, _1080p * 341)
	var_148_0:addElement(var_148_47)

	var_148_0.UnlockCriteria = var_148_47

	local var_148_48
	local var_148_49 = LUI.UIImage.new()

	var_148_49.id = "LockIcon"

	var_148_49:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_148_49:SetAlpha(0, 0)
	var_148_49:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_148_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 121, _1080p * 317, _1080p * 343)
	var_148_0:addElement(var_148_49)

	var_148_0.LockIcon = var_148_49

	local var_148_50
	local var_148_51 = MenuBuilder.BuildRegisteredType("BattlePassMissionTag", {
		controllerIndex = var_148_1
	})

	var_148_51.id = "MissionTag"

	var_148_51:SetAlpha(0, 0)
	var_148_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 315, _1080p * 375)
	var_148_0:addElement(var_148_51)

	var_148_0.MissionTag = var_148_51

	local var_148_52
	local var_148_53 = MenuBuilder.BuildRegisteredType("SpecialWeaponAttributeWithText", {
		controllerIndex = var_148_1
	})

	var_148_53.id = "SpecialWeaponAttributeWithText"

	var_148_53:SetAlpha(0, 0)
	var_148_53.Title:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_148_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 315, _1080p * 347)
	var_148_0:addElement(var_148_53)

	var_148_0.SpecialWeaponAttributeWithText = var_148_53

	local var_148_54
	local var_148_55 = MenuBuilder.BuildRegisteredType("WZExclusiveSnipeIcon", {
		controllerIndex = var_148_1
	})

	var_148_55.id = "ExclusiveSnipeIcon"

	var_148_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 281, _1080p * 681, _1080p * 214, _1080p * 246)
	var_148_0:addElement(var_148_55)

	var_148_0.ExclusiveSnipeIcon = var_148_55

	local var_148_56
	local var_148_57 = MenuBuilder.BuildRegisteredType("WZBattlePassUpsellPrompt", {
		controllerIndex = var_148_1
	})

	var_148_57.id = "Upsell"

	var_148_57:SetAlpha(0, 0)
	var_148_57:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -396, _1080p * -96, _1080p * 313, _1080p * 513)
	var_148_0:addElement(var_148_57)

	var_148_0.Upsell = var_148_57

	local var_148_58
	local var_148_59 = MenuBuilder.BuildRegisteredType("BattlePassPurchaseBackground", {
		controllerIndex = var_148_1
	})

	var_148_59.id = "TierPurchaseBG"

	var_148_59:SetAlpha(0, 0)
	var_148_59:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_148_0:addElement(var_148_59)

	var_148_0.TierPurchaseBG = var_148_59

	local var_148_60
	local var_148_61 = MenuBuilder.BuildRegisteredType("BattlePassGridContainer", {
		controllerIndex = var_148_1
	})

	var_148_61.id = "BattlePassGridContainer"

	var_148_61:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -700, _1080p * 700, _1080p * -539, _1080p * -81)
	var_148_0:addElement(var_148_61)

	var_148_0.BattlePassGridContainer = var_148_61

	local var_148_62
	local var_148_63 = MenuBuilder.BuildRegisteredType("SupportingCreatorCode", {
		controllerIndex = var_148_1
	})

	var_148_63.id = "SupportingCreatorCode"

	var_148_63:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1162, _1080p * 1522, _1080p * 220, _1080p * 244)
	var_148_0:addElement(var_148_63)

	var_148_0.SupportingCreatorCode = var_148_63

	local var_148_64
	local var_148_65 = LUI.UIImage.new()

	var_148_65.id = "ReactiveIcon"

	var_148_65:setImage(RegisterMaterial("ui_icon_blueprint_reactive_camo_flipbook"), 0)
	var_148_65:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 276, _1080p * 244, _1080p * 324)
	var_148_0:addElement(var_148_65)

	var_148_0.ReactiveIcon = var_148_65

	local var_148_66
	local var_148_67 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_148_1
	})

	var_148_67.id = "PromptContainer"

	var_148_67:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)

	if CONDITIONS.AlwaysFalse() then
		var_148_67.Label:setText("", 0)
	end

	var_148_67:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 260, _1080p * -1348, _1080p * -109, _1080p * -85)
	var_148_0:addElement(var_148_67)

	var_148_0.PromptContainer = var_148_67

	local function var_148_68()
		return
	end

	var_148_0._sequences.DefaultSequence = var_148_68

	local var_148_69

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_70 = {
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("WeaponPreview", var_148_70)
	end

	local var_148_71 = {
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

	var_148_25:RegisterAnimationSequence("WeaponPreview", var_148_71)

	local var_148_72 = {
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

	var_148_31:RegisterAnimationSequence("WeaponPreview", var_148_72)

	local var_148_73 = {
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

	var_148_33:RegisterAnimationSequence("WeaponPreview", var_148_73)

	local var_148_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_35:RegisterAnimationSequence("WeaponPreview", var_148_74)

	local var_148_75 = {
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

	var_148_47:RegisterAnimationSequence("WeaponPreview", var_148_75)

	local var_148_76 = {
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

	var_148_49:RegisterAnimationSequence("WeaponPreview", var_148_76)

	local var_148_77 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_51:RegisterAnimationSequence("WeaponPreview", var_148_77)

	local var_148_78 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_53:RegisterAnimationSequence("WeaponPreview", var_148_78)

	local function var_148_79()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("WeaponPreview")
		end

		var_148_25:AnimateSequence("WeaponPreview")
		var_148_31:AnimateSequence("WeaponPreview")
		var_148_33:AnimateSequence("WeaponPreview")
		var_148_35:AnimateSequence("WeaponPreview")
		var_148_47:AnimateSequence("WeaponPreview")
		var_148_49:AnimateSequence("WeaponPreview")
		var_148_51:AnimateSequence("WeaponPreview")
		var_148_53:AnimateSequence("WeaponPreview")
	end

	var_148_0._sequences.WeaponPreview = var_148_79

	local var_148_80

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_81 = {
			{
				value = 0,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("WeaponDetails", var_148_81)
	end

	local var_148_82 = {
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

	var_148_25:RegisterAnimationSequence("WeaponDetails", var_148_82)

	local var_148_83 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_31:RegisterAnimationSequence("WeaponDetails", var_148_83)

	local var_148_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_33:RegisterAnimationSequence("WeaponDetails", var_148_84)

	local var_148_85 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_35:RegisterAnimationSequence("WeaponDetails", var_148_85)

	local var_148_86 = {
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

	var_148_47:RegisterAnimationSequence("WeaponDetails", var_148_86)

	local var_148_87 = {
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

	var_148_49:RegisterAnimationSequence("WeaponDetails", var_148_87)

	local var_148_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_51:RegisterAnimationSequence("WeaponDetails", var_148_88)

	local var_148_89 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_53:RegisterAnimationSequence("WeaponDetails", var_148_89)

	local function var_148_90()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("WeaponDetails")
		end

		var_148_25:AnimateSequence("WeaponDetails")
		var_148_31:AnimateSequence("WeaponDetails")
		var_148_33:AnimateSequence("WeaponDetails")
		var_148_35:AnimateSequence("WeaponDetails")
		var_148_47:AnimateSequence("WeaponDetails")
		var_148_49:AnimateSequence("WeaponDetails")
		var_148_51:AnimateSequence("WeaponDetails")
		var_148_53:AnimateSequence("WeaponDetails")
	end

	var_148_0._sequences.WeaponDetails = var_148_90

	local var_148_91

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_92 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("ItemPreview", var_148_92)
	end

	local var_148_93 = {
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

	var_148_25:RegisterAnimationSequence("ItemPreview", var_148_93)

	local var_148_94 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_31:RegisterAnimationSequence("ItemPreview", var_148_94)

	local var_148_95 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_33:RegisterAnimationSequence("ItemPreview", var_148_95)

	local var_148_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_35:RegisterAnimationSequence("ItemPreview", var_148_96)

	local var_148_97 = {
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

	var_148_47:RegisterAnimationSequence("ItemPreview", var_148_97)

	local var_148_98 = {
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

	var_148_49:RegisterAnimationSequence("ItemPreview", var_148_98)

	local var_148_99 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_51:RegisterAnimationSequence("ItemPreview", var_148_99)

	local var_148_100 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_53:RegisterAnimationSequence("ItemPreview", var_148_100)

	local function var_148_101()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("ItemPreview")
		end

		var_148_25:AnimateSequence("ItemPreview")
		var_148_31:AnimateSequence("ItemPreview")
		var_148_33:AnimateSequence("ItemPreview")
		var_148_35:AnimateSequence("ItemPreview")
		var_148_47:AnimateSequence("ItemPreview")
		var_148_49:AnimateSequence("ItemPreview")
		var_148_51:AnimateSequence("ItemPreview")
		var_148_53:AnimateSequence("ItemPreview")
	end

	var_148_0._sequences.ItemPreview = var_148_101

	local var_148_102

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_103 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("MissionPreview", var_148_103)
	end

	local var_148_104 = {
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

	var_148_25:RegisterAnimationSequence("MissionPreview", var_148_104)

	local var_148_105 = {
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

	var_148_31:RegisterAnimationSequence("MissionPreview", var_148_105)

	local var_148_106 = {
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

	var_148_33:RegisterAnimationSequence("MissionPreview", var_148_106)

	local var_148_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_35:RegisterAnimationSequence("MissionPreview", var_148_107)

	local var_148_108 = {
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

	var_148_47:RegisterAnimationSequence("MissionPreview", var_148_108)

	local var_148_109 = {
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

	var_148_49:RegisterAnimationSequence("MissionPreview", var_148_109)

	local var_148_110 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_53:RegisterAnimationSequence("MissionPreview", var_148_110)

	local function var_148_111()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("MissionPreview")
		end

		var_148_25:AnimateSequence("MissionPreview")
		var_148_31:AnimateSequence("MissionPreview")
		var_148_33:AnimateSequence("MissionPreview")
		var_148_35:AnimateSequence("MissionPreview")
		var_148_47:AnimateSequence("MissionPreview")
		var_148_49:AnimateSequence("MissionPreview")
		var_148_53:AnimateSequence("MissionPreview")
	end

	var_148_0._sequences.MissionPreview = var_148_111

	local var_148_112
	local var_148_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_4:RegisterAnimationSequence("SetupStandalone", var_148_113)

	local var_148_114 = {
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

	var_148_6:RegisterAnimationSequence("SetupStandalone", var_148_114)

	local var_148_115 = {
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

	var_148_8:RegisterAnimationSequence("SetupStandalone", var_148_115)

	local var_148_116 = {
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

	var_148_10:RegisterAnimationSequence("SetupStandalone", var_148_116)

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_117 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("SetupStandalone", var_148_117)
	end

	local var_148_118 = {
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

	var_148_45:RegisterAnimationSequence("SetupStandalone", var_148_118)

	local function var_148_119()
		var_148_4:AnimateSequence("SetupStandalone")
		var_148_6:AnimateSequence("SetupStandalone")
		var_148_8:AnimateSequence("SetupStandalone")
		var_148_10:AnimateSequence("SetupStandalone")

		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("SetupStandalone")
		end

		var_148_45:AnimateSequence("SetupStandalone")
	end

	var_148_0._sequences.SetupStandalone = var_148_119

	local var_148_120
	local var_148_121 = {
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

	var_148_43:RegisterAnimationSequence("IsBlueprint", var_148_121)

	local function var_148_122()
		var_148_43:AnimateSequence("IsBlueprint")
	end

	var_148_0._sequences.IsBlueprint = var_148_122

	local var_148_123

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_124 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("ConsumablePreview", var_148_124)
	end

	local var_148_125 = {
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

	var_148_25:RegisterAnimationSequence("ConsumablePreview", var_148_125)

	local var_148_126 = {
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

	var_148_31:RegisterAnimationSequence("ConsumablePreview", var_148_126)

	local var_148_127 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_33:RegisterAnimationSequence("ConsumablePreview", var_148_127)

	local var_148_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_35:RegisterAnimationSequence("ConsumablePreview", var_148_128)

	local var_148_129 = {
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

	var_148_47:RegisterAnimationSequence("ConsumablePreview", var_148_129)

	local var_148_130 = {
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

	var_148_49:RegisterAnimationSequence("ConsumablePreview", var_148_130)

	local var_148_131 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_51:RegisterAnimationSequence("ConsumablePreview", var_148_131)

	local var_148_132 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_53:RegisterAnimationSequence("ConsumablePreview", var_148_132)

	local function var_148_133()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("ConsumablePreview")
		end

		var_148_25:AnimateSequence("ConsumablePreview")
		var_148_31:AnimateSequence("ConsumablePreview")
		var_148_33:AnimateSequence("ConsumablePreview")
		var_148_35:AnimateSequence("ConsumablePreview")
		var_148_47:AnimateSequence("ConsumablePreview")
		var_148_49:AnimateSequence("ConsumablePreview")
		var_148_51:AnimateSequence("ConsumablePreview")
		var_148_53:AnimateSequence("ConsumablePreview")
	end

	var_148_0._sequences.ConsumablePreview = var_148_133

	local var_148_134
	local var_148_135 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_47:RegisterAnimationSequence("IsLocked", var_148_135)

	local var_148_136 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_49:RegisterAnimationSequence("IsLocked", var_148_136)

	local function var_148_137()
		var_148_47:AnimateSequence("IsLocked")
		var_148_49:AnimateSequence("IsLocked")
	end

	var_148_0._sequences.IsLocked = var_148_137

	local var_148_138
	local var_148_139 = {
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

	var_148_47:RegisterAnimationSequence("NotLocked", var_148_139)

	local var_148_140 = {
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

	var_148_49:RegisterAnimationSequence("NotLocked", var_148_140)

	local function var_148_141()
		var_148_47:AnimateSequence("NotLocked")
		var_148_49:AnimateSequence("NotLocked")
	end

	var_148_0._sequences.NotLocked = var_148_141

	local var_148_142
	local var_148_143 = {
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

	var_148_43:RegisterAnimationSequence("IsBaseWeapon", var_148_143)

	local function var_148_144()
		var_148_43:AnimateSequence("IsBaseWeapon")
	end

	var_148_0._sequences.IsBaseWeapon = var_148_144

	local var_148_145
	local var_148_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_148_31:RegisterAnimationSequence("AR", var_148_146)

	local var_148_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 612
		}
	}

	var_148_35:RegisterAnimationSequence("AR", var_148_147)

	local var_148_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_148_41:RegisterAnimationSequence("AR", var_148_148)

	local function var_148_149()
		var_148_31:AnimateSequence("AR")
		var_148_35:AnimateSequence("AR")
		var_148_41:AnimateSequence("AR")
	end

	var_148_0._sequences.AR = var_148_149

	local var_148_150

	if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
		local var_148_151 = {
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_148_23:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_151)
	end

	local var_148_152 = {
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

	var_148_25:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_152)

	local var_148_153 = {
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

	var_148_31:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_153)

	local var_148_154 = {
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

	var_148_33:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_154)

	local var_148_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_35:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_155)

	local var_148_156 = {
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

	var_148_47:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_156)

	local var_148_157 = {
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

	var_148_49:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_157)

	local var_148_158 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_51:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_158)

	local var_148_159 = {
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

	var_148_53:RegisterAnimationSequence("WeaponPreviewWithAttribute", var_148_159)

	local function var_148_160()
		if not CONDITIONS.IsDisplayingBattlePassAAR(var_148_0) then
			var_148_23:AnimateSequence("WeaponPreviewWithAttribute")
		end

		var_148_25:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_31:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_33:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_35:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_47:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_49:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_51:AnimateSequence("WeaponPreviewWithAttribute")
		var_148_53:AnimateSequence("WeaponPreviewWithAttribute")
	end

	var_148_0._sequences.WeaponPreviewWithAttribute = var_148_160

	local var_148_161
	local var_148_162 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_57:RegisterAnimationSequence("ShowGameSourceUpsell", var_148_162)

	local function var_148_163()
		var_148_57:AnimateSequence("ShowGameSourceUpsell")
	end

	var_148_0._sequences.ShowGameSourceUpsell = var_148_163

	local var_148_164
	local var_148_165 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_148_57:RegisterAnimationSequence("HideGameSourceUpsell", var_148_165)

	local function var_148_166()
		var_148_57:AnimateSequence("HideGameSourceUpsell")
	end

	var_148_0._sequences.HideGameSourceUpsell = var_148_166

	local var_148_167
	local var_148_168 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_148_4:RegisterAnimationSequence("WZWipSetup", var_148_168)

	local var_148_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("wz_store_billboard_placeholder")
		}
	}

	var_148_6:RegisterAnimationSequence("WZWipSetup", var_148_169)

	local function var_148_170()
		var_148_4:AnimateSequence("WZWipSetup")
		var_148_6:AnimateSequence("WZWipSetup")
	end

	var_148_0._sequences.WZWipSetup = var_148_170

	local var_148_171
	local var_148_172 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 354
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 334
		}
	}

	var_148_31:RegisterAnimationSequence("JP", var_148_172)

	local function var_148_173()
		var_148_31:AnimateSequence("JP")
	end

	var_148_0._sequences.JP = var_148_173

	var_0_74(var_148_0, var_148_1, arg_148_1)

	return var_148_0
end

MenuBuilder.registerType("BattlePassMenu", BattlePassMenu)
LockTable(_M)
