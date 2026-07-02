module(..., package.seeall)

local var_0_0 = 220
local var_0_1 = 570

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LOOT.GetLootCardData(arg_1_0._controllerIndex, arg_1_2)

	if var_1_0 then
		local var_1_1 = LOOT.GetDarkRarityColor(var_1_0.rarity)

		arg_1_1.RarityBG:SetRGBFromTable(var_1_1)
		arg_1_1.Border:setImage(RegisterMaterial(LOOT.GetRarityBorder(var_1_0.rarity)))
		arg_1_1.RarityImage:setImage(RegisterMaterial(var_1_0.rarityImage))
		LOOT.ApplyRarityIconColoring(arg_1_1.RarityImage, var_1_0.rarity)
		ACTIONS.AnimateSequence(arg_1_1, "GlintAnime")

		if var_1_0.image and #var_1_0.image > 0 then
			arg_1_1:UpdateCardConfig(var_1_0.type, var_1_0.image)
			arg_1_1.Foreground:setImage(RegisterMaterial(var_1_0.image))
		else
			assert(false, "Could not find image asset for type: " .. var_1_0.type .. ", and ref: " .. var_1_0.ref)
		end

		if var_1_0.name and #var_1_0.name > 0 then
			arg_1_1.ItemName:setText(ToUpperCase(var_1_0.name))
		else
			assert(false, "Could not find item name for type: " .. var_1_0.type .. ", and ref: " .. var_1_0.ref)
		end

		local var_1_2 = LOOT.GetItemClassName(var_1_0.type, var_1_0.ref)

		if var_1_2 and #var_1_2 > 0 then
			arg_1_1.ItemType:setText(var_1_2)
		else
			assert(false, "Could not find item class name for type: " .. var_1_0.type .. ", and ref: " .. var_1_0.ref)
		end
	else
		assert(false, "Missing loot card data for id " .. arg_1_2)
		arg_1_1:SetAlpha(0)
	end
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Spinner:SetAlpha(1)
	OnlineProgression.CCIEBBDDFH(arg_2_1, BRLOOT.rewardsTypes.FIRST_MATCH_REWARD)

	local var_2_0 = 1000
	local var_2_1 = 10
	local var_2_2 = 0
	local var_2_3

	local function var_2_4()
		arg_2_0:Wait(var_2_0).onComplete = function()
			local var_4_0 = OnlineProgression.DFBEBDGCHJ(arg_2_1, BRLOOT.rewardsTypes.FIRST_MATCH_REWARD)
			local var_4_1, var_4_2 = BATTLEPASS.IsPendingTransactions(arg_2_1)

			if var_4_0 and var_4_2 then
				arg_2_2(true)
			elseif var_2_2 < var_2_1 then
				var_2_4()
			else
				arg_2_2(false)
			end
		end
		var_2_2 = var_2_2 + 1
	end

	var_2_4()
end

local function var_0_4(arg_5_0)
	arg_5_0._collectingReward = false

	local function var_5_0(arg_6_0, arg_6_1)
		if not arg_5_0._collectingReward then
			arg_5_0._collectingReward = true

			arg_5_0.CollectButton:SetButtonDisabled(true)
			var_0_3(arg_5_0, arg_5_0._controllerIndex, function(arg_7_0)
				if arg_5_0._confirmAction then
					arg_5_0._confirmAction(arg_7_0)
				end

				LUI.FlowManager.RequestLeaveMenu(arg_6_0)
			end)
		end
	end

	arg_5_0.bindButton:addEventHandler("button_secondary", var_5_0)
	arg_5_0.CollectButton:addEventHandler("button_action", var_5_0)
	var_0_2(arg_5_0, arg_5_0._lootCards[1], BATTLEPASS.SINGLE_TIER_SKIP_ID)
end

local function var_0_5(arg_8_0)
	arg_8_0:addEventHandler("loot_item_transaction_complete", function(arg_9_0, arg_9_1)
		LUI.FlowManager.RequestLeaveMenu(arg_9_0, true)

		if arg_8_0._confirmAction then
			arg_8_0._confirmAction(true)
		end
	end)
	arg_8_0:addEventHandler("loot_item_transaction_error", function(arg_10_0, arg_10_1)
		if arg_10_1.errorCode == STORE.ProductNoLongerAvailableError then
			LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_8_0._controllerIndex, true)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_10_0, true)
		end

		if arg_8_0._confirmAction then
			arg_8_0._confirmAction(false)
		end
	end)
end

local function var_0_6(arg_11_0)
	assert(arg_11_0._bundleID)
	assert(arg_11_0._battlePassName)
	ACTIONS.AnimateSequence(arg_11_0, "TierGift")

	local var_11_0 = LOOT.GetItemsInBundle(arg_11_0._bundleID)
	local var_11_1 = BATTLEPASS.GetItemRef(var_11_0[1])
	local var_11_2 = tonumber(BATTLEPASS.GetItemSkips(var_11_1))

	local function var_11_3(arg_12_0, arg_12_1)
		arg_11_0.Spinner:SetAlpha(1)
		Loot.HAJHHFGJJ(arg_11_0._controllerIndex, arg_11_0._bundleID)
	end

	var_0_5(arg_11_0)
	arg_11_0.bindButton:addEventHandler("button_secondary", var_11_3)
	arg_11_0.CollectButton:addEventHandler("button_action", var_11_3)
	arg_11_0.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_SKIP_GIFT_TITLE", var_11_2))
	arg_11_0.Message:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_SKIP_GIFT_DESC", arg_11_0._battlePassName, var_11_2))
	arg_11_0.CollectButton.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_GIFT"))
	var_0_2(arg_11_0, arg_11_0._lootCards[1], tonumber(var_11_0[1]))
	arg_11_0._lootCards[1].Foreground:setImage(RegisterMaterial("icon_tier_skip_token"))
end

local function var_0_7(arg_13_0)
	ACTIONS.AnimateSequence(arg_13_0, "VIPGift")

	if arg_13_0._purchasedBattlePassVIPGift then
		arg_13_0.Message:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIP_GIFT_RECENT_OWNER_MESSAGE"))
	else
		arg_13_0.Message:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIP_GIFT_OWNER_MESSAGE"))
	end

	local var_13_0 = Dvar.CFHDGABACF("LNTOLMQMOQ")
	local var_13_1 = LOOT.GetItemsInBundle(var_13_0)

	for iter_13_0, iter_13_1 in ipairs(arg_13_0._lootCards) do
		if var_13_1[iter_13_0] then
			var_0_2(arg_13_0, iter_13_1, var_13_1[iter_13_0])
		else
			iter_13_1:SetAlpha(0)
		end
	end

	local function var_13_2(arg_14_0, arg_14_1)
		arg_13_0.Spinner:SetAlpha(1)
		BATTLEPASS.RecordVIPGiftEvent(arg_13_0._controllerIndex, "collect_free_gift", arg_13_0, -1, true)
		Loot.HAJHHFGJJ(arg_13_0._controllerIndex, var_13_0)
	end

	function arg_13_0._confirmAction(arg_15_0)
		if arg_15_0 then
			LUI.FlowManager.RequestAddMenu("StoreFullScreenCinematic", true, arg_13_0._controllerIndex, false, {
				isVIP = true,
				isPremium = true
			}, true)
		else
			local var_15_0 = BATTLEPASS.IsOwned(arg_13_0._controllerIndex) and "BATTLEPASS/OWNERS_GIFT" or "BATTLEPASS/THANK_YOU_GIFT"
			local var_15_1 = {
				title = Engine.CBBHFCGDIC("MENU/ERROR"),
				message = Engine.CBBHFCGDIC("BATTLEPASS/VIP_ERROR_COLLECTING", var_15_0)
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_13_0._controllerIndex, false, var_15_1, nil, false, true)
		end
	end

	var_0_5(arg_13_0)
	arg_13_0.bindButton:addEventHandler("button_secondary", var_13_2)
	arg_13_0.CollectButton:addEventHandler("button_action", var_13_2)

	arg_13_0:Wait(var_0_0).onComplete = function()
		arg_13_0.LootItemCardFlare1:PlayFlareSprite("BattlePassPurchased")
		Engine.BJDBIAGIDA(SOUND_SETS.aarBattlePass.lootCardLegendary)
	end
	arg_13_0:Wait(var_0_1).onComplete = function()
		arg_13_0.LootItemCardFlare2:PlayFlareSprite("BattlePassPurchased")
		Engine.BJDBIAGIDA(SOUND_SETS.aarBattlePass.lootCardLegendary)
	end

	arg_13_0.LootCard1:SetPreview(false)
	arg_13_0.LootCard2:SetPreview(false)
	ACTIONS.AnimateSequence(arg_13_0.LootCard1, "ShowGoldFrame")
	ACTIONS.AnimateSequence(arg_13_0.LootCard2, "ShowGoldFrame")
	ACTIONS.AnimateSequence(arg_13_0.CollectButton, "LowGlow")
	ACTIONS.AnimateSequence(arg_13_0.CollectButton, "ButtonUpGlint")
	ACTIONS.AnimateSequence(arg_13_0.CollectButton, "Glint")
	arg_13_0.CollectButton:addEventHandler("button_up", function(arg_18_0, arg_18_1)
		ACTIONS.AnimateSequence(arg_13_0.CollectButton, "ButtonUpGlint")
	end)
	arg_13_0.CollectButton:addEventHandler("button_over", function(arg_19_0, arg_19_1)
		ACTIONS.AnimateSequence(arg_13_0.CollectButton, "ButtonOverGlint")
	end)
end

local function var_0_8(arg_20_0, arg_20_1, arg_20_2)
	assert(arg_20_2.isBRReward or arg_20_2.isTierGift or arg_20_2.isBPVIPGift)

	arg_20_0._confirmAction = arg_20_2.onConfirm
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0._purchasedBattlePassVIPGift = arg_20_2.purchasedBattlePassVIPGift
	arg_20_0._lootCards = {
		arg_20_0.LootCard1,
		arg_20_0.LootCard2
	}

	local var_20_0 = BATTLEPASS.GetEmblemGold()

	if var_20_0 and #var_20_0 > 0 then
		arg_20_0.SeasonImg:setImage(RegisterMaterial(var_20_0))
	end

	if arg_20_2.isBRReward or arg_20_2.isTierGift then
		arg_20_0._lootCards[2]:closeTree()

		arg_20_0._lootCards[2] = nil
	end

	if arg_20_2.isBRReward then
		var_0_4(arg_20_0)
	elseif arg_20_2.isTierGift then
		arg_20_0._bundleID = arg_20_2.bundleID
		arg_20_0._battlePassName = arg_20_2.battlePassName

		var_0_6(arg_20_0)
	elseif arg_20_2.isBPVIPGift then
		var_0_7(arg_20_0)
	end

	ACTIONS.ScaleFullscreen(arg_20_0.Darkener)
end

function BattlePassRewardPopup(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_21_0.id = "BattlePassRewardPopup"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = LUI.UIImage.new()

	var_21_4.id = "Darkener"

	var_21_4:SetRGBFromInt(0, 0)
	var_21_4:SetAlpha(0.95, 0)
	var_21_0:addElement(var_21_4)

	var_21_0.Darkener = var_21_4

	local var_21_5
	local var_21_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_21_1
	})

	var_21_6.id = "GenericPopupWindow"

	var_21_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_21_6.PopupBackground:SetAlpha(0.3, 0)
	var_21_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_21_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_21_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_21_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_21_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_21_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_21_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -309, _1080p * 369)
	var_21_0:addElement(var_21_6)

	var_21_0.GenericPopupWindow = var_21_6

	local var_21_7
	local var_21_8 = LUI.UIImage.new()

	var_21_8.id = "VIPWreath"

	var_21_8:SetAlpha(0, 0)
	var_21_8:setImage(RegisterMaterial("bp_vip_wreath"), 0)
	var_21_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_21_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 388, _1080p * 1532, _1080p * -2, _1080p * 1142)
	var_21_0:addElement(var_21_8)

	var_21_0.VIPWreath = var_21_8

	local var_21_9
	local var_21_10 = LUI.UIImage.new()

	var_21_10.id = "SeasonImg"

	var_21_10:SetAlpha(0.08, 0)
	var_21_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 621, _1080p * 1299, _1080p * 231, _1080p * 909)
	var_21_0:addElement(var_21_10)

	var_21_0.SeasonImg = var_21_10

	local var_21_11
	local var_21_12 = LUI.UIStyledText.new()

	var_21_12.id = "Title"

	var_21_12:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_21_12:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONGRATULATIONS")), 0)
	var_21_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_21_12:SetAlignment(LUI.Alignment.Center)
	var_21_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -731, _1080p * 731, _1080p * -276, _1080p * -216)
	var_21_0:addElement(var_21_12)

	var_21_0.Title = var_21_12

	local var_21_13
	local var_21_14 = LUI.UIText.new()

	var_21_14.id = "Message"

	var_21_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_21_14:setText(Engine.CBBHFCGDIC("BATTLEPASS/WARZONE_REWARD_MESSAGE"), 0)
	var_21_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_14:SetAlignment(LUI.Alignment.Center)
	var_21_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -195, _1080p * -165)
	var_21_0:addElement(var_21_14)

	var_21_0.Message = var_21_14

	local var_21_15
	local var_21_16 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_21_1
	})

	var_21_16.id = "CollectButton"

	var_21_16.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_REWARD"), 0)
	var_21_16.Text:SetAlignment(LUI.Alignment.Center)
	var_21_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 293, _1080p * 331)
	var_21_0:addElement(var_21_16)

	var_21_0.CollectButton = var_21_16

	local var_21_17
	local var_21_18 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_21_1
	})

	var_21_18.id = "LootCard1"

	var_21_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 855, _1080p * 1065, _1080p * 458, _1080p * 738)
	var_21_0:addElement(var_21_18)

	var_21_0.LootCard1 = var_21_18

	local var_21_19
	local var_21_20 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_21_1
	})

	var_21_20.id = "LootItemCardFlare1"

	var_21_20:SetAlpha(0, 0)
	var_21_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1226, _1080p * 357, _1080p * 869)
	var_21_0:addElement(var_21_20)

	var_21_0.LootItemCardFlare1 = var_21_20

	local var_21_21
	local var_21_22 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_21_1
	})

	var_21_22.id = "LootCard2"

	var_21_22:SetAlpha(0, 0)
	var_21_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 855, _1080p * 1065, _1080p * 458, _1080p * 738)
	var_21_0:addElement(var_21_22)

	var_21_0.LootCard2 = var_21_22

	local var_21_23
	local var_21_24 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_21_1
	})

	var_21_24.id = "LootItemCardFlare2"

	var_21_24:SetAlpha(0, 0)
	var_21_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1226, _1080p * 357, _1080p * 869)
	var_21_0:addElement(var_21_24)

	var_21_0.LootItemCardFlare2 = var_21_24

	local var_21_25
	local var_21_26 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_21_1
	})

	var_21_26.id = "Spinner"

	var_21_26:SetAlpha(0, 0)
	var_21_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 260, _1080p * 270)
	var_21_0:addElement(var_21_26)

	var_21_0.Spinner = var_21_26

	local var_21_27
	local var_21_28 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_21_1
	})

	var_21_28.id = "ButtonHelperBar"

	var_21_28.Background:SetAlpha(0, 0)
	var_21_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 909, _1080p * 969)
	var_21_0:addElement(var_21_28)

	var_21_0.ButtonHelperBar = var_21_28

	local function var_21_29()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_29

	local var_21_30
	local var_21_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1823
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 908
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 232
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_battlepass_tier_gift_bg")
		}
	}

	var_21_10:RegisterAnimationSequence("TierGift", var_21_31)

	local function var_21_32()
		var_21_10:AnimateSequence("TierGift")
	end

	var_21_0._sequences.TierGift = var_21_32

	local var_21_33
	local var_21_34 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("VIPGift", var_21_34)

	local var_21_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS_GIFT"))
		}
	}

	var_21_12:RegisterAnimationSequence("VIPGift", var_21_35)

	local var_21_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_GIFT"),
			child = var_21_0.CollectButton.Text
		}
	}

	var_21_16:RegisterAnimationSequence("VIPGift", var_21_36)

	local var_21_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 712
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 922
		},
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
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 740
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 90,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_21_18:RegisterAnimationSequence("VIPGift", var_21_37)

	local var_21_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 621
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1133
		},
		{
			duration = 220,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 344
		},
		{
			duration = 220,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 856
		},
		{
			value = 1,
			duration = 220,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 220,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 561
		},
		{
			duration = 220,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1073
		}
	}

	var_21_20:RegisterAnimationSequence("VIPGift", var_21_38)

	local var_21_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1012
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1222
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 440,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 420,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_21_22:RegisterAnimationSequence("VIPGift", var_21_39)

	local var_21_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 861
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1373
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 854
		},
		{
			value = 1,
			duration = 570,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 570,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 861
		},
		{
			duration = 570,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 344
		},
		{
			duration = 570,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1373
		},
		{
			duration = 570,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 856
		}
	}

	var_21_24:RegisterAnimationSequence("VIPGift", var_21_40)

	local function var_21_41()
		var_21_8:AnimateSequence("VIPGift")
		var_21_12:AnimateSequence("VIPGift")
		var_21_16:AnimateSequence("VIPGift")
		var_21_18:AnimateSequence("VIPGift")
		var_21_20:AnimateSequence("VIPGift")
		var_21_22:AnimateSequence("VIPGift")
		var_21_24:AnimateSequence("VIPGift")
	end

	var_21_0._sequences.VIPGift = var_21_41

	function var_21_0.addButtonHelperFunction(arg_25_0, arg_25_1)
		arg_25_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_21_0:addEventHandler("menu_create", var_21_0.addButtonHelperFunction)

	local var_21_42 = LUI.UIBindButton.new()

	var_21_42.id = "selfBindButton"

	var_21_0:addElement(var_21_42)

	var_21_0.bindButton = var_21_42

	var_0_8(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("BattlePassRewardPopup", BattlePassRewardPopup)
LockTable(_M)
