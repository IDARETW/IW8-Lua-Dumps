module(..., package.seeall)

local var_0_0 = 200
local var_0_1 = {
	EQUIPPED_WIDGET = 30 * _1080p,
	QUALITY_WITH_TEXT = 32 * _1080p,
	SEASON_WITH_TEXT = 32 * _1080p,
	FLAVOR_TEXT = 22 * _1080p
}

local function var_0_2(arg_1_0)
	return arg_1_0 ~= nil and arg_1_0 > 0
end

local function var_0_3(arg_2_0)
	local var_2_0 = LOOT.GetTypeForID(arg_2_0)

	return var_2_0 == LOOT.itemTypes.WATCH or var_2_0 == LOOT.itemTypes.CHARM or var_2_0 == LOOT.itemTypes.STICKER or var_2_0 == LOOT.itemTypes.VEHICLE_CAMO
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_3_1.name)))
	arg_3_0.QualityWithText:UpdateQualityText(arg_3_1.rarity)
	arg_3_0.SeasonWithText:UpdateSeasonText(arg_3_1.season)
	arg_3_0.EquippedWidget:SetAlpha(arg_3_1.isSelected and 1 or 0)
	arg_3_0.NewItemNotification:SetAlpha(arg_3_1.isNew and not arg_3_1.isSelected and 1 or 0)

	if arg_3_1.season then
		local var_3_0

		var_3_0 = arg_3_1.season > 0
	end

	local var_3_1 = arg_3_0.Name:GetCurrentAnchorsAndPositions().bottom
	local var_3_2 = 10 * _1080p

	arg_3_0.EquippedWidget:SetAlpha(0)
	arg_3_0.NewItemNotification:SetAlpha(0)

	if arg_3_1.isSelected then
		arg_3_0.EquippedWidget:SetAlpha(1, var_0_0)
	elseif arg_3_1.isNew then
		arg_3_0.NewItemNotification:SetAlpha(1, var_0_0)
	end

	if arg_3_1.isSelected or arg_3_1.isNew then
		local var_3_3 = LAYOUT.GetElementHeight(arg_3_0.EquippedWidget)
		local var_3_4 = var_0_2(var_3_3) and var_3_3 or var_0_1.EQUIPPED_WIDGET

		arg_3_0.EquippedWidget:SetTop(var_3_1 + var_3_2, var_0_0)
		arg_3_0.EquippedWidget:SetBottom(var_3_1 + var_3_2 + var_3_4, var_0_0)
		arg_3_0.NewItemNotification:SetTop(var_3_1 + var_3_2, var_0_0)
		arg_3_0.NewItemNotification:SetBottom(var_3_1 + var_3_2 + var_3_4, var_0_0)

		var_3_1 = var_3_1 + var_3_4 + var_3_2
	end

	local var_3_5 = LAYOUT.GetElementHeight(arg_3_0.QualityWithText)
	local var_3_6 = var_0_2(var_3_5) and var_3_5 or var_0_1.QUALITY_WITH_TEXT
	local var_3_7 = var_3_1 + var_3_2

	arg_3_0.QualityWithText:SetTop(var_3_7, var_0_0)

	local var_3_8 = var_3_7 + var_3_6

	arg_3_0.QualityWithText:SetBottom(var_3_8, var_0_0)

	local var_3_9 = 0

	if arg_3_1.season and arg_3_1.season > 0 then
		local var_3_10 = LAYOUT.GetElementHeight(arg_3_0.SeasonWithText)

		var_3_9 = var_0_2(var_3_10) and var_3_10 or var_0_1.SEASON_WITH_TEXT

		arg_3_0.SeasonWithText:UpdateSeasonText(arg_3_1.season)
		arg_3_0.SeasonWithText:SetAlpha(1, var_0_0)

		local var_3_11 = var_3_8 + var_3_2
		local var_3_12 = var_3_11 + var_3_9

		arg_3_0.SeasonWithText:SetTop(var_3_11, var_0_0)
		arg_3_0.SeasonWithText:SetBottom(var_3_12, var_0_0)

		var_3_9 = var_3_9 + var_3_2
	else
		arg_3_0.SeasonWithText:SetAlpha(0, 0)
	end

	local var_3_13 = var_3_1 + (arg_3_1.rarity ~= nil and arg_3_1.rarity > -1 and var_3_6 or 0) + var_3_9 + var_3_2

	if arg_3_1.isRandom == true and arg_3_1.lootType == LOOT.itemTypes.WATCH then
		arg_3_1.flavorOverride = Engine.CBBHFCGDIC("CUSTOMIZE/RANDOM_WATCH")
	end

	if arg_3_1.ref and arg_3_1.ref ~= "default" and not arg_3_1.isRandom and var_0_3(arg_3_1.lootID) then
		local var_3_14
		local var_3_15
		local var_3_16 = LOOT.GetTypeForID(arg_3_1.lootID)

		if arg_3_1.flavorOverride and #arg_3_1.flavorOverride > 0 then
			var_3_14 = arg_3_1.flavorOverride
		else
			if var_3_16 == LOOT.itemTypes.VEHICLE_CAMO then
				var_3_15 = VEHICLE.GetFlavorText(arg_3_1.ref)
			else
				var_3_15 = arg_3_1.storeFlavor
			end

			var_3_14 = Engine.CBBHFCGDIC(var_3_15)
		end

		if var_3_14 ~= var_3_15 then
			arg_3_0.FlavorText:SetAlpha(0)
			arg_3_0.FlavorText:SetAlpha(1, var_0_0)
			arg_3_0.FlavorText:setText(var_3_14)
		else
			arg_3_0.FlavorText:SetAlpha(1)
		end

		local var_3_17 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.FlavorText, var_3_14)
		local var_3_18 = var_0_2(var_3_17) and var_3_17 or var_0_1.FLAVOR_TEXT
		local var_3_19 = LAYOUT.GetElementHeight(arg_3_0.FlavorText)
		local var_3_20 = var_0_2(var_3_19) and var_3_19 or var_0_1.FLAVOR_TEXT

		arg_3_0.FlavorText:SetTop(var_3_13 + var_3_2, var_0_0)
		arg_3_0.FlavorText:SetBottom(var_3_20 + var_3_13 + var_3_2, var_0_0)

		var_3_13 = var_3_13 + var_3_18 + var_3_2
	else
		arg_3_0.FlavorText:SetAlpha(0)
		arg_3_0.FlavorText:setText("")
	end

	local var_3_21 = ""

	if arg_3_1.lootType == LOOT.itemTypes.WATCH then
		var_3_21 = "CAS/WATCH_PREVIEW_PROMPT"
	elseif arg_3_1.lootType == LOOT.itemTypes.CHARM then
		var_3_21 = "LUA_MENU/PREVIEW_CHARM_PROMPT"
	elseif arg_3_1.lootType == LOOT.itemTypes.STICKER then
		var_3_21 = "LUA_MENU/PREVIEW_STICKER_PROMPT"
	end

	local var_3_22 = Engine.CBBHFCGDIC(var_3_21)

	arg_3_0.PromptPreview:setText(var_3_22)

	local var_3_23 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.PromptPreview, var_3_22)
	local var_3_24 = 25 * _1080p
	local var_3_25 = var_3_13 + var_3_24

	arg_3_0.DoubleNotchedBacker:SetBottom(var_3_25, var_0_0)

	local var_3_26 = var_3_25 + var_3_24

	arg_3_0.PromptPreview:SetTop(var_3_26, var_0_0)
	arg_3_0.PromptPreview:SetBottom(var_3_26 + var_3_23, var_0_0)
end

local function var_0_5(arg_4_0, arg_4_1)
	arg_4_0._curDim = arg_4_1
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetupDetails = var_0_4
	arg_5_0.InitializeDimensions = var_0_5

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_5_0, "WZSetup")
	end
end

function LootDetails(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 245 * _1080p)

	var_6_0.id = "LootDetails"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "DoubleNotchedBacker"

	var_6_4:SetAlpha(0.75, 0)
	var_6_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 245)
	var_6_0:addElement(var_6_4)

	var_6_0.DoubleNotchedBacker = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "Name"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_6:SetStartupDelay(2000)
	var_6_6:SetLineHoldTime(400)
	var_6_6:SetAnimMoveTime(2000)
	var_6_6:SetAnimMoveSpeed(150)
	var_6_6:SetEndDelay(2000)
	var_6_6:SetCrossfadeTime(400)
	var_6_6:SetFadeInTime(300)
	var_6_6:SetFadeOutTime(300)
	var_6_6:SetMaxVisibleLines(1)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 32, _1080p * -32, _1080p * 16, _1080p * 66)
	var_6_0:addElement(var_6_6)

	var_6_0.Name = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "SeasonWithText"

	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 194, _1080p * 151, _1080p * 183)
	var_6_0:addElement(var_6_8)

	var_6_0.SeasonWithText = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "QualityWithText"

	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 194, _1080p * 113, _1080p * 145)
	var_6_0:addElement(var_6_10)

	var_6_0.QualityWithText = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "EquippedWidget"

	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 170, _1080p * 77, _1080p * 107)
	var_6_0:addElement(var_6_12)

	var_6_0.EquippedWidget = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "NewItemNotification"

	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 112, _1080p * 77, _1080p * 107)
	var_6_0:addElement(var_6_14)

	var_6_0.NewItemNotification = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "FlavorText"

	var_6_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_16:setText("", 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_16:SetAlignment(LUI.Alignment.Left)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 494, _1080p * 195, _1080p * 217)
	var_6_0:addElement(var_6_16)

	var_6_0.FlavorText = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIText.new()

	var_6_18.id = "PromptPreview"

	var_6_18:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_6_18:setText(Engine.CBBHFCGDIC("CAS/WATCH_PREVIEW_PROMPT"), 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_18:SetAlignment(LUI.Alignment.Left)
	var_6_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 378, _1080p * 253, _1080p * 277)
	var_6_0:addElement(var_6_18)

	var_6_0.PromptPreview = var_6_18

	local function var_6_19()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_6_0.DoubleNotchedBacker.Background
		}
	}

	var_6_4:RegisterAnimationSequence("WZSetup", var_6_21)

	local var_6_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_6:RegisterAnimationSequence("WZSetup", var_6_22)

	local var_6_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_6_16:RegisterAnimationSequence("WZSetup", var_6_23)

	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_6_18:RegisterAnimationSequence("WZSetup", var_6_24)

	local function var_6_25()
		var_6_4:AnimateSequence("WZSetup")
		var_6_6:AnimateSequence("WZSetup")
		var_6_16:AnimateSequence("WZSetup")
		var_6_18:AnimateSequence("WZSetup")
	end

	var_6_0._sequences.WZSetup = var_6_25

	var_0_6(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LootDetails", LootDetails)
LockTable(_M)
