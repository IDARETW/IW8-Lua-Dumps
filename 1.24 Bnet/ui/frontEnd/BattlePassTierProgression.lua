module(..., package.seeall)

local var_0_0 = 600
local var_0_1 = 1100
local var_0_2 = 0
local var_0_3
local var_0_4 = {
	[LOOT.Rarity.BASE] = SOUND_SETS.aarBattlePass.lootCardUncommon,
	[LOOT.Rarity.COMMON] = SOUND_SETS.aarBattlePass.lootCardCommon,
	[LOOT.Rarity.RARE] = SOUND_SETS.aarBattlePass.lootCardRare,
	[LOOT.Rarity.EPIC] = SOUND_SETS.aarBattlePass.lootCardEpic,
	[LOOT.Rarity.LEGENDARY] = SOUND_SETS.aarBattlePass.lootCardLegendary
}

local function var_0_5(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Engine.BJDBIAGIDA(arg_1_1)

	if arg_1_2 and arg_1_2 > 0 then
		arg_1_2 = math.max(arg_1_2, 1)
		arg_1_0:Wait(arg_1_2).onComplete = function()
			Engine.EAGBECEBGA(var_1_0)
		end
	end
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0._enablePurchase = arg_3_2 and true or false

	arg_3_0.PurchaseButtonText:SetAlpha(arg_3_2 and 1 or 0, arg_3_3 or 0)
	arg_3_0.PurchaseButtonHighlight:SetAlpha(arg_3_2 and 0.5 or 0, arg_3_3 or 0)
	arg_3_0.PurchaseButtonBacker:SetAlpha(arg_3_2 and 0.9 or 0, arg_3_3 or 0)
	arg_3_0.PurchaseButtonTextureLayer:SetAlpha(arg_3_2 and 0.1 or 0, arg_3_3 or 0)
end

local function var_0_7(arg_4_0, arg_4_1)
	arg_4_0.ProgressLine:SetAlpha(0)
	arg_4_0.ProgressBar:SetAlpha(0)
	arg_4_0.LevelBorder:SetAlpha(0)
	arg_4_0.Level:SetAlpha(0)
	arg_4_0.NextLevel:SetAlpha(0)
	arg_4_0.NextLevelBorder:SetAlpha(0)
	arg_4_0.NextFill:SetAlpha(0)
	arg_4_0.Fill:SetAlpha(0)
	arg_4_0.Glow:SetAlpha(0)
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_2 = false
	arg_5_3 = 0

	arg_5_0.ProgressBar:SetAlpha(arg_5_2 and 1 or 0, arg_5_3 or 0)
	arg_5_0.LevelBorder:SetAlpha(arg_5_2 and 1 or 0, arg_5_3 or 0)
	arg_5_0.Level:SetAlpha(arg_5_2 and 1 or 0, arg_5_3 or 0)
end

local function var_0_9(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.Title:SetAlpha(arg_6_2 and 1 or 0, arg_6_3 or 0)
	arg_6_0.StateText:SetAlpha(arg_6_2 and 1 or 0, arg_6_3 or 0)
	arg_6_0.TierName:SetAlpha(arg_6_2 and 1 or 0, arg_6_3 or 0)
	arg_6_0.TierIcon:SetAlpha(arg_6_2 and 1 or 0, arg_6_3 or 0)
	arg_6_0.TierIconCircle:SetAlpha(arg_6_2 and 1 or 0, arg_6_3 or 0)
end

local function var_0_10(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	var_0_9(arg_7_0, arg_7_1, false, 0)
	var_0_8(arg_7_0, arg_7_1, false, 0)

	local var_7_0 = BATTLEPASS.GetXP(arg_7_1)
	local var_7_1 = BATTLEPASS.GetTierByXP(arg_7_1, var_7_0)
	local var_7_2 = BATTLEPASS.GetTierPercentageFromXP(arg_7_1, var_7_0)

	arg_7_0.TierName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE", var_7_1))
	arg_7_0.Level:setText(var_7_1)
	arg_7_0.NextLevel:setText(var_7_1 + 1)
	arg_7_0.StateText:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER"))
	var_0_8(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	var_0_9(arg_7_0, arg_7_1, true, arg_7_3)
end

local function var_0_11(arg_8_0, arg_8_1)
	var_0_9(arg_8_0, arg_8_1, false, 0)
	var_0_8(arg_8_0, arg_8_1, false, 0)
	arg_8_0.AARBattlePassBonusPanel:SetAlpha(0)
	arg_8_0.LootCardFreeBanner:SetAlpha(0)
	arg_8_0.TierName:setText(Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE"))
	arg_8_0.Level:setText(BATTLEPASS.GetMaxTier() - 1)
	arg_8_0.NextLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX"))
	arg_8_0.StateText:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER"))
	ACTIONS.AnimateSequence(arg_8_0, "TierMax")
	var_0_8(arg_8_0, arg_8_1, true, 200)
	var_0_9(arg_8_0, arg_8_1, true, 200)
end

local var_0_12

local function var_0_13(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = BATTLEPASS.GetTierLootIsFree(arg_9_1, arg_9_0.displayTier)
	local var_9_1 = BATTLEPASS.GetTierLootID(arg_9_1, arg_9_0.displayTier)
	local var_9_2 = BATTLEPASS.GetTierLootChallengeID(arg_9_1, arg_9_0.displayTier)
	local var_9_3 = tonumber(BATTLEPASS.GetTierCODPoints(arg_9_1, arg_9_0.displayTier))
	local var_9_4 = 1

	if BATTLEPASS.IsOwned(arg_9_1) or var_9_0 then
		var_0_6(arg_9_0, arg_9_1, false)
		arg_9_0.BattlePassUpgradeLabel:SetAlpha(0)
		arg_9_0.LootCard:SetRGBFromTable(SWATCHES.Reticles.White, 0)
		arg_9_0.CODPointImage:SetRGBFromTable(SWATCHES.Reticles.White, 0)
		arg_9_0.CODPointPrice:SetRGBFromTable(SWATCHES.Reticles.White, 0)
	else
		var_0_6(arg_9_0, arg_9_1, true)
		arg_9_0.BattlePassUpgradeLabel:SetAlpha(1)
		arg_9_0.LootCard:SetRGBFromTable(SWATCHES.Reticles.White, 0)
		ACTIONS.AnimateSequence(arg_9_0.LootCard, "Locked")

		if var_9_2 and #var_9_2 > 0 then
			ACTIONS.AnimateSequence(arg_9_0.MissionCard, "Locked")
		end

		arg_9_0.CODPointImage:SetRGBFromTable(SWATCHES.Scoreboard.grayText, 0)
		arg_9_0.CODPointPrice:SetRGBFromTable(SWATCHES.Scoreboard.grayText, 0)
	end

	local var_9_5 = LOOT.GetTypeForID(var_9_1)
	local var_9_6 = LOOT.GetItemRef(var_9_5, var_9_1)
	local var_9_7 = LOOT.GetItemQuality(var_9_5, var_9_6) or 0
	local var_9_8 = LOOT.GetRarityImage(var_9_7)
	local var_9_9 = LOOT.GetRarityColor(var_9_7)
	local var_9_10
	local var_9_11

	if var_9_5 == LOOT.itemTypes.WEAPON then
		var_9_11 = WEAPON.GetLootWeaponName(var_9_6, var_9_1)
		var_9_10 = WEAPON.GetLootVariantImage(var_9_6, var_9_1)
	else
		var_9_11 = LOOT.GetItemName(var_9_5, var_9_6)
		var_9_10 = LOOT.GetItemImage(var_9_5, var_9_6)
	end

	local var_9_12 = {
		ref = var_9_6,
		type = var_9_5,
		name = var_9_11,
		image = var_9_10,
		rarity = var_9_7,
		rarityImage = var_9_8,
		rarityColor = var_9_9
	}
	local var_9_13 = {
		typeIcon = "icon_mission_generic",
		typeName = "",
		type = "mission",
		image = "icon_mission_generic",
		typeIconRenderedScale = 0.4,
		typeIconRendered = "icon_mission_generic",
		rarityImage = "white",
		name = Engine.CBBHFCGDIC("BATTLEPASS/NEW_MISSION")
	}

	arg_9_0.MissionCard.Card:UpdateCardConfig(var_9_13)
	arg_9_0.LootCard.Card:UpdateCardConfig(var_9_12)

	if var_9_2 and #var_9_2 > 0 then
		ACTIONS.AnimateSequence(arg_9_0, "TierMissionUnlock")

		var_9_4 = 2 * var_0_0

		arg_9_0.LootCard.Flare:PlayRarityFlare(var_9_12.rarity)

		arg_9_0.LootCard:Wait(1000).onComplete = function()
			arg_9_0.MissionCard.Flare:PlayRarityFlare(0)
		end
	else
		ACTIONS.AnimateSequence(arg_9_0, "TierUnlock")

		var_9_4 = var_0_0

		arg_9_0.LootCard.Flare:PlayRarityFlare(var_9_12.rarity)
	end

	if var_9_0 then
		ACTIONS.AnimateSequence(arg_9_0, "TierUnlockFree")
	end

	var_0_5(arg_9_0, var_0_4[var_9_12.rarity])
	arg_9_0.StateText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_UNLOCKS")))
	arg_9_0.StateText:SetAlpha(0)
	arg_9_0.StateText:SetAlpha(1, 100)

	arg_9_0:Wait(var_9_4).onComplete = function()
		var_0_3(arg_9_0, arg_9_1, arg_9_2)
		arg_9_0.StateText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER")))
		arg_9_0.StateText:SetAlpha(0)
		arg_9_0.StateText:SetAlpha(1, 200)
		arg_9_0.BattlePassUpgradeLabel:SetAlpha(0)
		var_0_6(arg_9_0, arg_9_1, false)
		arg_9_0.TierName:SetAlpha(1)
		arg_9_0.TierIcon:SetAlpha(0, 200)
		arg_9_0.TierIconCircle:SetAlpha(0, 200)
	end
end

local function var_0_14(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.AARBattlePassBonusPanel:SetAlpha(0, 200)

	arg_12_0.displayTier = arg_12_0.displayTier + 1

	arg_12_0.StateText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_UP")))
	arg_12_0.StateText:SetAlpha(0)
	arg_12_0.StateText:SetAlpha(1, 100)

	arg_12_0.earnedTypeXP = arg_12_0.earnedTypeXP - arg_12_2

	var_0_5(arg_12_0, SOUND_SETS.aarBattlePass.tierUp)
	ACTIONS.AnimateSequence(arg_12_0, "TierRankup")
	arg_12_0.TierName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE", arg_12_0.displayTier))
	arg_12_0.Level:setText(arg_12_0.displayTier)
	arg_12_0.NextLevel:setText(arg_12_0.displayTier + 1)

	arg_12_0:Wait(var_0_1 + var_0_2).onComplete = function()
		var_0_3(arg_12_0, arg_12_1, true)
		arg_12_0.StateText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER")))
		arg_12_0.StateText:SetAlpha(1, 200)
		arg_12_0.BattlePassUpgradeLabel:SetAlpha(0)
		var_0_6(arg_12_0, arg_12_1, false)
	end
end

function var_0_3(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.TierName:SetAlpha(1)
	arg_14_0.TierName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE", arg_14_0.displayTier))

	local var_14_0 = BATTLEPASS.GetTierMinXP(arg_14_0.displayTier)
	local var_14_1 = BATTLEPASS.GetTierMaxXP(arg_14_0.displayTier)
	local var_14_2 = var_14_1 <= arg_14_0.displayTierXP + arg_14_0.earnedTypeXP
	local var_14_3 = arg_14_0.displayTier == BATTLEPASS.GetMaxTier()
	local var_14_4 = arg_14_0.earnedTypeXP

	if var_14_2 then
		var_14_4 = var_14_1 - arg_14_0.displayTierXP
	end

	local var_14_5 = (arg_14_0.displayTierXP + var_14_4 - var_14_0) / (var_14_1 - var_14_0)
	local var_14_6

	if var_14_4 > 0 then
		local var_14_7 = arg_14_0.preTierXPPercentage or 0

		if var_14_2 or arg_14_2 then
			var_14_6 = (var_14_5 - var_14_7) * var_0_0
		else
			var_14_6 = var_0_0
		end

		var_0_5(arg_14_0, SOUND_SETS.aarBattlePass.tierProgressBar, (var_14_5 - var_14_7) * var_0_0)
		ACTIONS.AnimateSequence(arg_14_0, "BlinkTierName")
		arg_14_0.Level:setText(arg_14_0.displayTier)
		arg_14_0.NextLevel:setText(arg_14_0.displayTier + 1)
	else
		var_14_6 = 1
	end

	if var_14_6 > 1 and not arg_14_0._purchaseBattlePassInAARSuccess then
		arg_14_0:dispatchEventToRoot({
			name = "update_aar_battlepass_tier",
			immediate = true,
			dispatchChildren = true,
			displayTierXP = arg_14_0.displayTierXP,
			earnedTypeXP = var_14_4,
			waitTime = var_14_6
		})
	end

	arg_14_0.StateText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER")))
	var_0_9(arg_14_0, arg_14_1, true)

	local function var_14_8(arg_15_0, arg_15_1)
		arg_15_0.displayTierXP = arg_15_0.displayTierXP + var_14_4

		if var_14_3 then
			var_0_11(arg_15_0, arg_15_1)
		elseif var_14_2 then
			arg_15_0.preTierXPPercentage = 0

			var_0_14(arg_15_0, arg_15_1, var_14_4)
		elseif arg_15_0.displayTierXP < arg_15_0.currentTierXP then
			arg_15_0.earnedTypeXP = arg_15_0.currentTierXP - arg_15_0.displayTierXP

			if arg_15_0.earnedTypeXP > 0 then
				arg_15_0.preTierXPPercentage = var_14_5
			end

			var_0_3(arg_15_0, arg_15_1)
		else
			arg_15_0:SetAlpha(0, 100)
			arg_15_0:dispatchEventToRoot({
				dispatchChildren = true,
				name = AAR.PARADE_BATTLE_PASS_DONE
			})
		end
	end

	if arg_14_0._isAARBattlepass then
		arg_14_0:registerEventHandler("update_aar_battlepass_tier_done", function(arg_16_0, arg_16_1)
			var_14_8(arg_16_0, arg_14_1)
		end)

		if var_14_6 == 1 then
			arg_14_0:Wait(var_14_6).onComplete = function(arg_17_0, arg_17_1)
				var_14_8(arg_17_0, arg_17_1)
			end
		end
	else
		arg_14_0:Wait(var_14_6).onComplete = function(arg_18_0, arg_18_1)
			var_14_8(arg_18_0, arg_18_1)
		end
	end
end

local function var_0_15(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.startTierXP = arg_19_2.startTierXP
	arg_19_0.currentTierXP = arg_19_2.currentTierXP
	arg_19_0.displayTierXP = arg_19_2.startTierXP
	arg_19_0.startTier = arg_19_2.startTier
	arg_19_0.currentTier = arg_19_2.currentTier
	arg_19_0.displayTier = arg_19_2.startTier

	local var_19_0 = BATTLEPASS.GetTierMinXP(arg_19_0.displayTier)
	local var_19_1 = BATTLEPASS.GetTierMaxXP(arg_19_0.displayTier)

	arg_19_0.preTierXPPercentage = (arg_19_0.displayTierXP - var_19_0) / (var_19_1 - var_19_0)

	arg_19_0.Level:setText(arg_19_0.displayTier)
	arg_19_0.NextLevel:setText(arg_19_0.displayTier + 1)

	arg_19_0.earnedTypeXP = arg_19_0.currentTierXP - arg_19_0.displayTierXP

	ACTIONS.AnimateSequence(arg_19_0, "BlinkTierName")
	var_0_5(arg_19_0, SOUND_SETS.aarBattlePass.matchBonus)
	arg_19_0.TierIcon:SetAlpha(0)
	arg_19_0.TierIconCircle:SetAlpha(0)

	arg_19_0:Wait(150).onComplete = function()
		var_0_3(arg_19_0, arg_19_1)
	end
end

local function var_0_16(arg_21_0, arg_21_1)
	arg_21_0._isDoubleXP = LOOT.IsDoubleBattlePassXPActive()
	arg_21_0._currentTierXP = BATTLEPASS.GetXP(arg_21_1)
	arg_21_0._currentTier = BATTLEPASS.GetTier(arg_21_1)

	local var_21_0 = BATTLEPASS.GetCurrentEmblem()

	if var_21_0 then
		arg_21_0.TierIcon:setImage(RegisterMaterial(var_21_0))
	end

	if BATTLEPASS.IsOwned(arg_21_1) then
		arg_21_0.TierIconCircle:SetRGBFromTable(SWATCHES.BattlePass.Purchased)
		arg_21_0.TierName:SetRGBFromTable(SWATCHES.BattlePass.Purchased)
		arg_21_0.Overlay:SetRGBFromTable(SWATCHES.BattlePass.Purchased)
		arg_21_0.BattlePassPurchaseButton:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_21_0, "GlowPurchased")
	else
		arg_21_0.TierIconCircle:SetRGBFromTable(SWATCHES.HUD.HUDMain)
		arg_21_0.TierName:SetRGBFromTable(SWATCHES.HUD.HUDMain)
		arg_21_0.Overlay:SetRGBFromTable(SWATCHES.HUD.HUDMain)
		arg_21_0.BattlePassPurchaseButton:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_21_0, "GlowFree")
	end
end

function PostLoadFunc(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0:addElement(LOOT.GetLootFlareMaterialStreamer())
	var_0_16(arg_22_0, arg_22_1)
	var_0_7(arg_22_0, arg_22_1)

	arg_22_0.DisplayCurrentTier = var_0_10
	arg_22_0.DisplayBattlePassCompletion = var_0_11
	arg_22_0.PlayTierUnlocksAnimation = var_0_13
	arg_22_0.PlayTierupAnimation = var_0_14
	arg_22_0.PlayTierXPAnimation = var_0_3
	arg_22_0.PlayBattlePassTierProgression = var_0_15

	local var_22_0 = LUI.UIBindButton.new()

	var_22_0.id = "selfBindButton"

	arg_22_0:addElement(var_22_0)

	arg_22_0.bindButton = var_22_0
	arg_22_0._isAARBattlepass = arg_22_2.isAARBattlepass

	arg_22_0.bindButton:addEventHandler("button_alt1", function(arg_23_0, arg_23_1)
		if not BATTLEPASS.IsOwned(arg_22_1) then
			arg_22_0:dispatchEventToRoot({
				dispatchChildren = true,
				name = "purchase_aar_battlepass",
				immediate = true
			})
		end
	end)
	arg_22_0:registerEventHandler("purchase_aar_battlepass_success", function(arg_24_0, arg_24_1)
		var_0_16(arg_22_0, arg_22_1)

		arg_22_0._purchaseBattlePassInAARSuccess = true
	end)
	ACTIONS.AnimateSequence(arg_22_0, "TierCircle")
end

function BattlePassTierProgression(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIElement.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_25_0.id = "BattlePassTierProgression"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)

	local var_25_2 = var_25_0
	local var_25_3
	local var_25_4 = LUI.UIText.new()

	var_25_4.id = "BattlePassUpgradeLabel"

	var_25_4:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_25_4:SetAlpha(0, 0)
	var_25_4:setText(Engine.CBBHFCGDIC("BATTLEPASS/ITEM_NOT_AVAILABLE"), 0)
	var_25_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_4:SetAlignment(LUI.Alignment.Center)
	var_25_4:SetTintFontIcons(true)
	var_25_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 707, _1080p * 1213, _1080p * 761, _1080p * 785)
	var_25_0:addElement(var_25_4)

	var_25_0.BattlePassUpgradeLabel = var_25_4

	local var_25_5
	local var_25_6 = LUI.UIImage.new()

	var_25_6.id = "XPIcon"

	var_25_6:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_25_6:SetAlpha(0, 0)
	var_25_6:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_25_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1220, _1080p * 1348, _1080p * 742, _1080p * 870)
	var_25_0:addElement(var_25_6)

	var_25_0.XPIcon = var_25_6

	local var_25_7
	local var_25_8 = LUI.UIImage.new()

	var_25_8.id = "TierIconCircle"

	var_25_8:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_25_8:SetScale(-0.4, 0)
	var_25_8:setImage(RegisterMaterial("battlepass_celebration_tier_circle"), 0)
	var_25_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -278, _1080p * 278, _1080p * 241, _1080p * 797)
	var_25_0:addElement(var_25_8)

	var_25_0.TierIconCircle = var_25_8

	local var_25_9
	local var_25_10 = LUI.UIImage.new()

	var_25_10.id = "TierIcon"

	var_25_10:SetScale(-0.4, 0)
	var_25_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -175, _1080p * 175, _1080p * 335, _1080p * 685)
	var_25_0:addElement(var_25_10)

	var_25_0.TierIcon = var_25_10

	local var_25_11
	local var_25_12 = MenuBuilder.BuildRegisteredType("AARBattlePassBonusPanel", {
		controllerIndex = var_25_1
	})

	var_25_12.id = "AARBattlePassBonusPanel"

	var_25_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -501, _1080p * 499, _1080p * 279, _1080p * 679)
	var_25_0:addElement(var_25_12)

	var_25_0.AARBattlePassBonusPanel = var_25_12

	local var_25_13
	local var_25_14 = LUI.UIText.new()

	var_25_14.id = "TierName"

	var_25_14:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_25_14:setText(ToUpperCase(""), 0)
	var_25_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_14:SetAlignment(LUI.Alignment.Center)
	var_25_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 615, _1080p * 651)
	var_25_0:addElement(var_25_14)

	var_25_0.TierName = var_25_14

	local var_25_15
	local var_25_16 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_25_1
	})

	var_25_16.id = "LootCardFreeBanner"

	var_25_16:SetAlpha(0, 0)
	var_25_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 885, _1080p * 1035, _1080p * 386, _1080p * 410)
	var_25_0:addElement(var_25_16)

	var_25_0.LootCardFreeBanner = var_25_16

	local var_25_17
	local var_25_18 = LUI.UIStyledText.new()

	var_25_18.id = "StateText"

	var_25_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_25_18:setText("", 0)
	var_25_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_25_18:SetWordWrap(false)
	var_25_18:SetAlignment(LUI.Alignment.Center)
	var_25_18:SetDecodeLetterLength(20)
	var_25_18:SetDecodeMaxRandChars(6)
	var_25_18:SetDecodeUpdatesPerLetter(4)
	var_25_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 286, _1080p * 346)
	var_25_0:addElement(var_25_18)

	var_25_0.StateText = var_25_18

	local var_25_19
	local var_25_20 = LUI.UIStyledText.new()

	var_25_20.id = "Title"

	var_25_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_25_20:setText(Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS"), 0)
	var_25_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_20:SetWordWrap(false)
	var_25_20:SetAlignment(LUI.Alignment.Center)
	var_25_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -392, _1080p * 392, _1080p * 254, _1080p * 284)
	var_25_0:addElement(var_25_20)

	var_25_0.Title = var_25_20

	local var_25_21
	local var_25_22 = LUI.UIImage.new()

	var_25_22.id = "CODPointImage"

	var_25_22:SetAlpha(0, 0)
	var_25_22:setImage(RegisterMaterial("mw_cod_points_200_small"), 0)
	var_25_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -206, _1080p * -6)
	var_25_0:addElement(var_25_22)

	var_25_0.CODPointImage = var_25_22

	local var_25_23
	local var_25_24 = LUI.UIImage.new()

	var_25_24.id = "CODPointBG"

	var_25_24:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_25_24:SetAlpha(0, 0)
	var_25_24:SetPixelGridEnabled(true)
	var_25_24:SetPixelGridContrast(0.5, 0)
	var_25_24:SetPixelGridBlockWidth(2, 0)
	var_25_24:SetPixelGridBlockHeight(2, 0)
	var_25_24:SetPixelGridGutterWidth(1, 0)
	var_25_24:SetPixelGridGutterHeight(1, 0)
	var_25_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 388, _1080p * 708, _1080p * -259, _1080p * -209)
	var_25_0:addElement(var_25_24)

	var_25_0.CODPointBG = var_25_24

	local var_25_25
	local var_25_26 = LUI.UIStyledText.new()

	var_25_26.id = "CODPointPrice"

	var_25_26:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_25_26:SetAlpha(0, 0)
	var_25_26:setText("", 0)
	var_25_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_26:SetAlignment(LUI.Alignment.Center)
	var_25_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_25_26:SetStartupDelay(1000)
	var_25_26:SetLineHoldTime(500)
	var_25_26:SetAnimMoveTime(750)
	var_25_26:SetAnimMoveSpeed(50)
	var_25_26:SetEndDelay(1000)
	var_25_26:SetCrossfadeTime(400)
	var_25_26:SetFadeInTime(300)
	var_25_26:SetFadeOutTime(300)
	var_25_26:SetMaxVisibleLines(1)
	var_25_26:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 388, _1080p * 708, _1080p * -259, _1080p * -235)
	var_25_0:addElement(var_25_26)

	var_25_0.CODPointPrice = var_25_26

	local var_25_27
	local var_25_28 = LUI.UIImage.new()

	var_25_28.id = "Overlay"

	var_25_28:SetRGBFromInt(0, 0)
	var_25_28:SetAlpha(0, 0)
	var_25_28:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_25_0:addElement(var_25_28)

	var_25_0.Overlay = var_25_28

	local var_25_29
	local var_25_30 = LUI.UIImage.new()

	var_25_30.id = "PurchaseButtonBacker"

	var_25_30:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed, 0)
	var_25_30:SetAlpha(0, 0)
	var_25_30:setImage(RegisterMaterial("ui_default_white"), 0)
	var_25_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 430, _1080p * 802, _1080p * 320, _1080p * 364)
	var_25_0:addElement(var_25_30)

	var_25_0.PurchaseButtonBacker = var_25_30

	local var_25_31
	local var_25_32 = LUI.UIImage.new()

	var_25_32.id = "PurchaseButtonTextureLayer"

	var_25_32:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_25_32:SetAlpha(0, 0)
	var_25_32:SetPixelGridEnabled(true)
	var_25_32:SetPixelGridContrast(0.8, 0)
	var_25_32:SetPixelGridBlockWidth(2, 0)
	var_25_32:SetPixelGridBlockHeight(2, 0)
	var_25_32:SetPixelGridGutterWidth(1, 0)
	var_25_32:SetPixelGridGutterHeight(1, 0)
	var_25_32:setImage(RegisterMaterial("ui_default_white"), 0)
	var_25_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 430, _1080p * 802, _1080p * 320, _1080p * 364)
	var_25_0:addElement(var_25_32)

	var_25_0.PurchaseButtonTextureLayer = var_25_32

	local var_25_33
	local var_25_34 = LUI.UIStyledText.new()

	var_25_34.id = "PurchaseButtonText"

	var_25_34:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_25_34:SetAlpha(0, 0)
	var_25_34:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_BATTLEPASS_WITH_BUTTON")), 0)
	var_25_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_34:SetWordWrap(false)
	var_25_34:SetAlignment(LUI.Alignment.Center)
	var_25_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 450, _1080p * 782, _1080p * 327, _1080p * 357)
	var_25_0:addElement(var_25_34)

	var_25_0.PurchaseButtonText = var_25_34

	local var_25_35
	local var_25_36 = LUI.UIImage.new()

	var_25_36.id = "PurchaseButtonHighlight"

	var_25_36:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_25_36:SetAlpha(0, 0)
	var_25_36:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_25_36:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 430, _1080p * 802, _1080p * 346, _1080p * 364)
	var_25_0:addElement(var_25_36)

	var_25_0.PurchaseButtonHighlight = var_25_36

	local var_25_37
	local var_25_38 = LUI.UIImage.new()

	var_25_38.id = "ProgressLine"

	var_25_38:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_25_38:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -270, _1080p * 270, _1080p * -261, _1080p * -262)
	var_25_0:addElement(var_25_38)

	var_25_0.ProgressLine = var_25_38

	local var_25_39
	local var_25_40 = MenuBuilder.BuildRegisteredType("BattlePassProgressBar", {
		controllerIndex = var_25_1
	})

	var_25_40.id = "ProgressBar"

	var_25_40.Fill:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_25_40.Cap:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_40.Cap:SetAlpha(0, 0)
	var_25_40.Glint:SetAlpha(0, 0)
	var_25_40:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -270, _1080p * 270, _1080p * -265, _1080p * -259)
	var_25_0:addElement(var_25_40)

	var_25_0.ProgressBar = var_25_40

	local var_25_41
	local var_25_42 = LUI.UIImage.new()

	var_25_42.id = "Glow"

	var_25_42:SetAlpha(0, 0)
	var_25_42:setImage(RegisterMaterial("battlepass_progressbar_atlas"), 0)
	var_25_42:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 300, _1080p * 300, _1080p * 256, _1080p * 302)
	var_25_0:addElement(var_25_42)

	var_25_0.Glow = var_25_42

	local var_25_43
	local var_25_44 = LUI.UIImage.new()

	var_25_44.id = "Fill"

	var_25_44:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_25_44:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -302, _1080p * -270, _1080p * -276, _1080p * -248)
	var_25_0:addElement(var_25_44)

	var_25_0.Fill = var_25_44

	local var_25_45
	local var_25_46 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_25_47 = LUI.UIBorder.new(var_25_46)

	var_25_47.id = "LevelBorder"

	var_25_47:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_25_47:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -302, _1080p * -270, _1080p * -276, _1080p * -248)
	var_25_0:addElement(var_25_47)

	var_25_0.LevelBorder = var_25_47

	local var_25_48
	local var_25_49 = LUI.UIText.new()

	var_25_49.id = "Level"

	var_25_49:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_25_49:setText("99", 0)
	var_25_49:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_49:SetWordWrap(false)
	var_25_49:SetTracking(-1 * _1080p, 0)
	var_25_49:SetAlignment(LUI.Alignment.Center)
	var_25_49:SetVerticalAlignment(LUI.Alignment.Center)
	var_25_49:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -302, _1080p * -270, _1080p * -274, _1080p * -250)
	var_25_0:addElement(var_25_49)

	var_25_0.Level = var_25_49

	local var_25_50
	local var_25_51 = MenuBuilder.BuildRegisteredType("BattlePassTierProgressionLoot", {
		controllerIndex = var_25_1
	})

	var_25_51.id = "LootCard"

	var_25_51:SetAlpha(0, 0)
	var_25_51:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -75, _1080p * 75, _1080p * 410, _1080p * 610)
	var_25_0:addElement(var_25_51)

	var_25_0.LootCard = var_25_51

	local var_25_52
	local var_25_53 = MenuBuilder.BuildRegisteredType("BattlePassTierProgressionLoot", {
		controllerIndex = var_25_1
	})

	var_25_53.id = "MissionCard"

	var_25_53:SetAlpha(0, 0)
	var_25_53:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -75, _1080p * 75, _1080p * 410, _1080p * 610)
	var_25_0:addElement(var_25_53)

	var_25_0.MissionCard = var_25_53

	local var_25_54
	local var_25_55 = LUI.UIImage.new()

	var_25_55.id = "NextFill"

	var_25_55:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_25_55:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 270, _1080p * 302, _1080p * -276, _1080p * -248)
	var_25_0:addElement(var_25_55)

	var_25_0.NextFill = var_25_55

	local var_25_56
	local var_25_57 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_25_58 = LUI.UIBorder.new(var_25_57)

	var_25_58.id = "NextLevelBorder"

	var_25_58:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_25_58:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 270, _1080p * 302, _1080p * -276, _1080p * -248)
	var_25_0:addElement(var_25_58)

	var_25_0.NextLevelBorder = var_25_58

	local var_25_59
	local var_25_60 = LUI.UIText.new()

	var_25_60.id = "NextLevel"

	var_25_60:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_25_60:setText("99", 0)
	var_25_60:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_60:SetWordWrap(false)
	var_25_60:SetTracking(-1 * _1080p, 0)
	var_25_60:SetAlignment(LUI.Alignment.Center)
	var_25_60:SetVerticalAlignment(LUI.Alignment.Center)
	var_25_60:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 270, _1080p * 302, _1080p * -274, _1080p * -250)
	var_25_0:addElement(var_25_60)

	var_25_0.NextLevel = var_25_60

	local var_25_61
	local var_25_62 = MenuBuilder.BuildRegisteredType("BattlePassPurchaseButton", {
		controllerIndex = var_25_1
	})

	var_25_62.id = "BattlePassPurchaseButton"

	var_25_62:SetScale(-0.4, 0)
	var_25_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1292, _1080p * 1792, _1080p * 279, _1080p * 479)
	var_25_0:addElement(var_25_62)

	var_25_0.BattlePassPurchaseButton = var_25_62

	local function var_25_63()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_63

	local function var_25_64()
		return
	end

	var_25_0._sequences.TierRankupFX = var_25_64

	local var_25_65
	local var_25_66 = {
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = -0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuintic
		},
		{
			value = 1,
			duration = 1850,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_10:RegisterAnimationSequence("TierRankup", var_25_66)

	local var_25_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 1700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_14:RegisterAnimationSequence("TierRankup", var_25_67)

	local var_25_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_18:RegisterAnimationSequence("TierRankup", var_25_68)

	local var_25_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_28:RegisterAnimationSequence("TierRankup", var_25_69)

	local function var_25_70()
		var_25_10:AnimateSequence("TierRankup")
		var_25_14:AnimateSequence("TierRankup")
		var_25_18:AnimateSequence("TierRankup")
		var_25_28:AnimateSequence("TierRankup")
	end

	var_25_0._sequences.TierRankup = var_25_70

	local var_25_71
	local var_25_72 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_25_6:RegisterAnimationSequence("TierDoubleXP", var_25_72)

	local function var_25_73()
		var_25_6:AnimateSequence("TierDoubleXP")
	end

	var_25_0._sequences.TierDoubleXP = var_25_73

	local var_25_74
	local var_25_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("TierUnlock", var_25_75)

	local var_25_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("TierUnlock", var_25_76)

	local var_25_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_38:RegisterAnimationSequence("TierUnlock", var_25_77)

	local var_25_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_40:RegisterAnimationSequence("TierUnlock", var_25_78)

	local var_25_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_44:RegisterAnimationSequence("TierUnlock", var_25_79)

	local var_25_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_47:RegisterAnimationSequence("TierUnlock", var_25_80)

	local var_25_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_49:RegisterAnimationSequence("TierUnlock", var_25_81)

	local var_25_82 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1650,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_51:RegisterAnimationSequence("TierUnlock", var_25_82)

	local var_25_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_55:RegisterAnimationSequence("TierUnlock", var_25_83)

	local var_25_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_58:RegisterAnimationSequence("TierUnlock", var_25_84)

	local var_25_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_60:RegisterAnimationSequence("TierUnlock", var_25_85)

	local function var_25_86()
		var_25_8:AnimateSequence("TierUnlock")
		var_25_10:AnimateSequence("TierUnlock")
		var_25_38:AnimateSequence("TierUnlock")
		var_25_40:AnimateSequence("TierUnlock")
		var_25_44:AnimateSequence("TierUnlock")
		var_25_47:AnimateSequence("TierUnlock")
		var_25_49:AnimateSequence("TierUnlock")
		var_25_51:AnimateSequence("TierUnlock")
		var_25_55:AnimateSequence("TierUnlock")
		var_25_58:AnimateSequence("TierUnlock")
		var_25_60:AnimateSequence("TierUnlock")
	end

	var_25_0._sequences.TierUnlock = var_25_86

	local function var_25_87()
		return
	end

	var_25_0._sequences.TierDisplay = var_25_87

	local var_25_88
	local var_25_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_22:RegisterAnimationSequence("TierCODPointUnlock", var_25_89)

	local var_25_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_24:RegisterAnimationSequence("TierCODPointUnlock", var_25_90)

	local var_25_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("TierCODPointUnlock", var_25_91)

	local function var_25_92()
		var_25_22:AnimateSequence("TierCODPointUnlock")
		var_25_24:AnimateSequence("TierCODPointUnlock")
		var_25_26:AnimateSequence("TierCODPointUnlock")
	end

	var_25_0._sequences.TierCODPointUnlock = var_25_92

	local var_25_93
	local var_25_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("TierUnlockFree", var_25_94)

	local function var_25_95()
		var_25_16:AnimateSequence("TierUnlockFree")
	end

	var_25_0._sequences.TierUnlockFree = var_25_95

	local var_25_96
	local var_25_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_38:RegisterAnimationSequence("TierMissionUnlock", var_25_97)

	local var_25_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_40:RegisterAnimationSequence("TierMissionUnlock", var_25_98)

	local var_25_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_44:RegisterAnimationSequence("TierMissionUnlock", var_25_99)

	local var_25_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_47:RegisterAnimationSequence("TierMissionUnlock", var_25_100)

	local var_25_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_49:RegisterAnimationSequence("TierMissionUnlock", var_25_101)

	local var_25_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1750,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 147,
			easing = LUI.EASING.outSine
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 297,
			easing = LUI.EASING.outSine
		},
		{
			duration = 1200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 147,
			easing = LUI.EASING.outSine
		},
		{
			duration = 1200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 297,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_51:RegisterAnimationSequence("TierMissionUnlock", var_25_102)

	local var_25_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 900,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 840,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_53:RegisterAnimationSequence("TierMissionUnlock", var_25_103)

	local var_25_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_55:RegisterAnimationSequence("TierMissionUnlock", var_25_104)

	local var_25_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_58:RegisterAnimationSequence("TierMissionUnlock", var_25_105)

	local var_25_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_60:RegisterAnimationSequence("TierMissionUnlock", var_25_106)

	local function var_25_107()
		var_25_38:AnimateSequence("TierMissionUnlock")
		var_25_40:AnimateSequence("TierMissionUnlock")
		var_25_44:AnimateSequence("TierMissionUnlock")
		var_25_47:AnimateSequence("TierMissionUnlock")
		var_25_49:AnimateSequence("TierMissionUnlock")
		var_25_51:AnimateSequence("TierMissionUnlock")
		var_25_53:AnimateSequence("TierMissionUnlock")
		var_25_55:AnimateSequence("TierMissionUnlock")
		var_25_58:AnimateSequence("TierMissionUnlock")
		var_25_60:AnimateSequence("TierMissionUnlock")
	end

	var_25_0._sequences.TierMissionUnlock = var_25_107

	local var_25_108
	local var_25_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1630,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_14:RegisterAnimationSequence("BlinkTierName", var_25_109)

	local function var_25_110()
		var_25_14:AnimateSequence("BlinkTierName")
	end

	var_25_0._sequences.BlinkTierName = var_25_110

	local var_25_111
	local var_25_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 650,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_14:RegisterAnimationSequence("BlinkTierNameDelayed", var_25_112)

	local function var_25_113()
		var_25_14:AnimateSequence("BlinkTierNameDelayed")
	end

	var_25_0._sequences.BlinkTierNameDelayed = var_25_113

	local var_25_114
	local var_25_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -270,
			duration = 20000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_25_8:RegisterAnimationSequence("TierMax", var_25_115)

	local var_25_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326
		}
	}

	var_25_55:RegisterAnimationSequence("TierMax", var_25_116)

	local var_25_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326
		}
	}

	var_25_58:RegisterAnimationSequence("TierMax", var_25_117)

	local var_25_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326
		}
	}

	var_25_60:RegisterAnimationSequence("TierMax", var_25_118)

	local function var_25_119()
		var_25_8:AnimateLoop("TierMax")
		var_25_55:AnimateLoop("TierMax")
		var_25_58:AnimateLoop("TierMax")
		var_25_60:AnimateLoop("TierMax")
	end

	var_25_0._sequences.TierMax = var_25_119

	local var_25_120
	local var_25_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_25_42:RegisterAnimationSequence("GlowFree", var_25_121)

	local function var_25_122()
		var_25_42:AnimateSequence("GlowFree")
	end

	var_25_0._sequences.GlowFree = var_25_122

	local var_25_123
	local var_25_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_25_42:RegisterAnimationSequence("GlowPurchased", var_25_124)

	local function var_25_125()
		var_25_42:AnimateSequence("GlowPurchased")
	end

	var_25_0._sequences.GlowPurchased = var_25_125

	local var_25_126
	local var_25_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -360,
			duration = 20000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_25_8:RegisterAnimationSequence("TierCircle", var_25_127)

	local function var_25_128()
		var_25_8:AnimateLoop("TierCircle")
	end

	var_25_0._sequences.TierCircle = var_25_128

	PostLoadFunc(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("BattlePassTierProgression", BattlePassTierProgression)
LockTable(_M)
