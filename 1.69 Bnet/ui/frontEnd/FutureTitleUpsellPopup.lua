module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
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

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1

	if arg_2_2.freeRewards then
		local var_2_0 = tonumber(StringTable.DIFCHIGDFB(CSV.miscChallenges.file, CSV.miscChallenges.cols.id, Challenge.DoVEventChallengeID1, CSV.miscChallenges.cols.loot))

		var_0_0(arg_2_0, arg_2_0.LootCard1, var_2_0)
	end

	local function var_2_1(arg_3_0, arg_3_1)
		if arg_2_2.freeRewards then
			local var_3_0 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				header = Engine.CBBHFCGDIC("MENU/NOTICE"),
				description = Engine.CBBHFCGDIC("STORE/DOV_EVENT_REWARD_DESC")
			}

			arg_2_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_3_0
			})
			LUI.FlowManager.RequestLeaveMenu(arg_3_0)
		else
			STORE.GoToStore(arg_2_1, arg_2_0.id, STORE.ZeusCategory)
		end
	end

	arg_2_0.CollectButton:registerEventHandler("button_action", var_2_1)
	arg_2_0.bindButton:registerEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if arg_2_2.freeRewards then
			var_2_1(arg_4_0, arg_4_1)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_4_0)
		end
	end)
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
end

function FutureTitleUpsellPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "FutureTitleUpsellPopup"
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

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.95, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

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
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -363, _1080p * 467)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Title"

	var_5_8:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONGRATULATIONS")), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -731, _1080p * 731, _1080p * -276, _1080p * -216)
	var_5_0:addElement(var_5_8)

	var_5_0.Title = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "Message"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("STORE/DOV_EVENT_REWARD_DESC"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -195, _1080p * -165)
	var_5_0:addElement(var_5_10)

	var_5_0.Message = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "CollectButton"

	var_5_12.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_REWARD"), 0)
	var_5_12.Text:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 293, _1080p * 331)
	var_5_0:addElement(var_5_12)

	var_5_0.CollectButton = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "LootCard1"

	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 855, _1080p * 1065, _1080p * 458, _1080p * 738)
	var_5_0:addElement(var_5_14)

	var_5_0.LootCard1 = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "Spinner"

	var_5_16:SetAlpha(0, 0)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 260, _1080p * 270)
	var_5_0:addElement(var_5_16)

	var_5_0.Spinner = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "ButtonHelperBar"

	var_5_18.Background:SetAlpha(0, 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 909, _1080p * 969)
	var_5_0:addElement(var_5_18)

	var_5_0.ButtonHelperBar = var_5_18

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

	var_5_8:RegisterAnimationSequence("SetupUpsell", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/ZEUS_UPSELL_DESC")
		}
	}

	var_5_10:RegisterAnimationSequence("SetupUpsell", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER"),
			child = var_5_0.CollectButton.Text
		}
	}

	var_5_12:RegisterAnimationSequence("SetupUpsell", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("SetupUpsell", var_5_24)

	local function var_5_25()
		var_5_8:AnimateSequence("SetupUpsell")
		var_5_10:AnimateSequence("SetupUpsell")
		var_5_12:AnimateSequence("SetupUpsell")
		var_5_14:AnimateSequence("SetupUpsell")
	end

	var_5_0._sequences.SetupUpsell = var_5_25

	function var_5_0.addButtonHelperFunction(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_26 = LUI.UIBindButton.new()

	var_5_26.id = "selfBindButton"

	var_5_0:addElement(var_5_26)

	var_5_0.bindButton = var_5_26

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("FutureTitleUpsellPopup", FutureTitleUpsellPopup)
LockTable(_M)
