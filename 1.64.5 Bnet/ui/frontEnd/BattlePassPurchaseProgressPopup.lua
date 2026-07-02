module(..., package.seeall)

local var_0_0 = 500
local var_0_1 = 6

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1)
	local var_1_1 = LOOT.itemTypes.BATTLE_PASS
	local var_1_2 = LOOT.GetItemRef(var_1_1, tostring(var_1_0))

	if var_1_2 and #var_1_2 > 0 then
		local var_1_3 = LOOT.GetItemQuality(var_1_1, var_1_2)
		local var_1_4 = LOOT.GetDarkRarityColor(var_1_3)

		arg_1_0.TierSkipCard.RarityBG:SetRGBFromTable(var_1_4)
		arg_1_0.TierSkipCard.Border:setImage(RegisterMaterial(LOOT.GetRarityBorder(var_1_3)))
		arg_1_0.TierSkipCard.RarityImage:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_3)))
		LOOT.ApplyRarityIconColoring(arg_1_0.TierSkipCard.RarityImage, var_1_3)
		ACTIONS.AnimateSequence(arg_1_0.TierSkipCard, "GlintAnime")

		local var_1_5 = LOOT.GetBattlepassImage(var_1_1, var_1_2, var_1_0)

		if var_1_5 and #var_1_5 > 0 then
			arg_1_0.TierSkipCard:UpdateCardConfig(var_1_1, var_1_5)
			arg_1_0.TierSkipCard.Foreground:setImage(RegisterMaterial(var_1_5))
		else
			DebugPrint("Could not find image asset for type: " .. var_1_1 .. ", and ref: " .. var_1_2)
		end

		local var_1_6 = LOOT.GetItemName(var_1_1, var_1_2)

		if var_1_6 and #var_1_6 > 0 then
			arg_1_0.TierSkipCard.ItemName:setText(ToUpperCase(var_1_6))
		else
			DebugPrint("Could not find item name for type: " .. var_1_1 .. ", and ref: " .. var_1_2)
		end

		local var_1_7 = LOOT.GetItemClassName(var_1_1, var_1_2)

		if var_1_7 and #var_1_7 > 0 then
			arg_1_0.TierSkipCard.ItemType:setText(var_1_7)
		else
			DebugPrint("Could not find item class name for type: " .. var_1_1 .. ", and ref: " .. ref)
		end
	end
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.isQuickAccessShortcutsDisabled = true
	arg_2_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_2_0._currentSeason and arg_2_0._currentSeason == var_0_1 then
		ACTIONS.AnimateSequence(arg_2_0, "ColorAlt")
	end

	if arg_2_2.hidePurchasingText then
		arg_2_0.Purchasing:SetAlpha(0)
	end

	if arg_2_2.tierSkipID then
		var_0_2(arg_2_0, arg_2_2.tierSkipID)
		arg_2_0.Flare:PlayFlareSprite("Smoke")
		ACTIONS.AnimateSequence(arg_2_0, "AutoTierSkip")
	else
		arg_2_0:RemoveElement(arg_2_0.TierSkipCard)

		if arg_2_2.fixUp then
			arg_2_0.Purchasing:setText(Engine.CBBHFCGDIC("BATTLEPASS/FIX_UP_MESSAGE"))
		elseif arg_2_2.purchaseGift then
			arg_2_0.Purchasing:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING"))
		else
			arg_2_0:registerEventHandler("update_battle_pass_purchasing_popup", function(arg_3_0, arg_3_1)
				if arg_3_1.progress then
					arg_2_0.Progress:SetProgress(arg_3_1.progress, 1)
				end
			end)
			arg_2_2.confirmAction()

			arg_2_0:Wait(var_0_0).onComplete = function()
				ACTIONS.AnimateSequence(arg_2_0, "ShowProgress")
			end
		end

		Engine.DFCGFCGBFD("mp_battlepass_onboarding", VideoPlaybackFlags.LOOP)
	end

	Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseWindow)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Background)
end

function BattlePassPurchaseProgressPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "BattlePassPurchaseProgressPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.9, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_6.PopupBackground:SetAlpha(0.3, 0)
	var_5_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -370, _1080p * 430)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Cinematic"

	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 31, _1080p * 31)
	var_5_0:addElement(var_5_8)

	var_5_0.Cinematic = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Spinner"

	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -411, _1080p * 411, _1080p * 358, _1080p * 369)
	var_5_0:addElement(var_5_10)

	var_5_0.Spinner = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "Progress"

	var_5_12:SetAlpha(0, 0)
	var_5_12.Fill:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_12.Frame:SetAlpha(0, 0)
	var_5_12.Cap:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -411, _1080p * 411, _1080p * 358, _1080p * 368)
	var_5_0:addElement(var_5_12)

	var_5_0.Progress = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "TierSkipCard"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 855, _1080p * 1065, _1080p * 400, _1080p * 680)
	var_5_0:addElement(var_5_14)

	var_5_0.TierSkipCard = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Purchasing"

	var_5_16:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_5_16:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE")), 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_16:SetAlignment(LUI.Alignment.Center)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -850, _1080p * 850, _1080p * 258, _1080p * 334)
	var_5_0:addElement(var_5_16)

	var_5_0.Purchasing = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "Flare"

	var_5_18:SetAlpha(0, 0)
	var_5_18:SetScale(-0.05, 0)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -140, _1080p * 140)
	var_5_0:addElement(var_5_18)

	var_5_0.Flare = var_5_18

	local function var_5_19()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ShowProgress", var_5_21)

	local var_5_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ShowProgress", var_5_22)

	local function var_5_23()
		var_5_10:AnimateSequence("ShowProgress")
		var_5_12:AnimateSequence("ShowProgress")
	end

	var_5_0._sequences.ShowProgress = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("AutoTierSkip", var_5_25)

	local var_5_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("AutoTierSkip", var_5_26)

	local var_5_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("AutoTierSkip", var_5_27)

	local var_5_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("AutoTierSkip", var_5_28)

	local var_5_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("AutoTierSkip", var_5_29)

	local var_5_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("AutoTierSkip", var_5_30)

	local var_5_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("AutoTierSkip", var_5_31)

	local function var_5_32()
		var_5_4:AnimateSequence("AutoTierSkip")
		var_5_6:AnimateSequence("AutoTierSkip")
		var_5_10:AnimateSequence("AutoTierSkip")
		var_5_12:AnimateSequence("AutoTierSkip")
		var_5_14:AnimateSequence("AutoTierSkip")
		var_5_16:AnimateSequence("AutoTierSkip")
		var_5_18:AnimateSequence("AutoTierSkip")
	end

	var_5_0._sequences.AutoTierSkip = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenMain,
			child = var_5_0.Progress.Fill
		}
	}

	var_5_12:RegisterAnimationSequence("ColorAlt", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenMain
		}
	}

	var_5_16:RegisterAnimationSequence("ColorAlt", var_5_35)

	local function var_5_36()
		var_5_12:AnimateSequence("ColorAlt")
		var_5_16:AnimateSequence("ColorAlt")
	end

	var_5_0._sequences.ColorAlt = var_5_36

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassPurchaseProgressPopup", BattlePassPurchaseProgressPopup)
LockTable(_M)
