module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		rankName = PROGRESSION.GetRankName(arg_1_1),
		itemID = PROGRESSION.GetRankUnlocks(arg_1_1)[1]
	}

	var_1_0.type = LOOT.GetTypeForID(tonumber(var_1_0.itemID)) or "xp"
	var_1_0.ref = LOOT.GetItemRef(var_1_0.type, var_1_0.itemID)
	var_1_0.name = LOOT.GetItemName(var_1_0.type, var_1_0.ref, var_1_0.itemID)
	var_1_0.image = LOOT.GetItemImage(var_1_0.type, var_1_0.ref, var_1_0.itemID)
	var_1_0.rarity = LOOT.GetItemQuality(var_1_0.type, var_1_0.ref, var_1_0.itemID)
	var_1_0.rarityImage = LOOT.GetRarityImage(var_1_0.rarity)
	var_1_0.rarityColor = LOOT.GetRarityColor(var_1_0.rarity)
	var_1_0.received = arg_1_1 <= PROGRESSION.GetPlayerRank(arg_1_0)

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_1.received and "Received" or "NotReceived")
	arg_2_0.LootCard:UpdateCardConfig(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = PROGRESSION.GetPlayerLifeTimeMaxRank()
	local var_3_1 = var_0_0(arg_3_1, var_3_0)

	arg_3_0.UnlockDesc:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/SEASON_UNLOCK_DESC", var_3_0 + 1, var_3_1.rankName))
	var_0_1(arg_3_0, var_3_1)
	ACTIONS.ScaleFullscreen(arg_3_0.Darkener)
end

function SeasonUnlocksPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "SeasonUnlocksPopup"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -259, _1080p * 259)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText(ToUpperCase(Engine.CBBHFCGDIC("ELDER_PROGRESSION/WEAPON_UNLOCKS")), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -228, _1080p * -168)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "UnlockDesc"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -168, _1080p * -138)
	var_4_0:addElement(var_4_10)

	var_4_0.UnlockDesc = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "LootCard"

	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 885, _1080p * 1035, _1080p * 440, _1080p * 640)
	var_4_0:addElement(var_4_12)

	var_4_0.LootCard = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ContinueButton"

	var_4_14.Text:SetLeft(_1080p * 20, 0)
	var_4_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_4_14.Text:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 728, _1080p * 766)
	var_4_0:addElement(var_4_14)

	var_4_0.ContinueButton = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIText.new()

	var_4_16.id = "LootReceived"

	var_4_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_16:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED"), 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -136, _1080p * 136, _1080p * 130, _1080p * 158)
	var_4_0:addElement(var_4_16)

	var_4_0.LootReceived = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "ButtonHelperBar"

	var_4_18.Background:SetAlpha(0, 0)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 259, _1080p * 319)
	var_4_0:addElement(var_4_18)

	var_4_0.ButtonHelperBar = var_4_18

	local function var_4_19()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_19

	local var_4_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Received", var_4_20)

	local function var_4_21()
		var_4_16:AnimateSequence("Received")
	end

	var_4_0._sequences.Received = var_4_21

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -235
		}
	}

	var_4_6:RegisterAnimationSequence("NotReceived", var_4_22)

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -203
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -143
		}
	}

	var_4_8:RegisterAnimationSequence("NotReceived", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -113
		}
	}

	var_4_10:RegisterAnimationSequence("NotReceived", var_4_24)

	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 459
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 659
		}
	}

	var_4_12:RegisterAnimationSequence("NotReceived", var_4_25)

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 715
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 753
		}
	}

	var_4_14:RegisterAnimationSequence("NotReceived", var_4_26)

	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("NotReceived", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 295
		}
	}

	var_4_18:RegisterAnimationSequence("NotReceived", var_4_28)

	local function var_4_29()
		var_4_6:AnimateSequence("NotReceived")
		var_4_8:AnimateSequence("NotReceived")
		var_4_10:AnimateSequence("NotReceived")
		var_4_12:AnimateSequence("NotReceived")
		var_4_14:AnimateSequence("NotReceived")
		var_4_16:AnimateSequence("NotReceived")
		var_4_18:AnimateSequence("NotReceived")
	end

	var_4_0._sequences.NotReceived = var_4_29

	var_4_14:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)

	function var_4_0.addButtonHelperFunction(arg_9_0, arg_9_1)
		arg_9_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_30 = LUI.UIBindButton.new()

	var_4_30.id = "selfBindButton"

	var_4_0:addElement(var_4_30)

	var_4_0.bindButton = var_4_30

	var_4_0.bindButton:addEventHandler("button_primary", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonUnlocksPopup", SeasonUnlocksPopup)
LockTable(_M)
