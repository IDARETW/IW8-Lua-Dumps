module(..., package.seeall)

local var_0_0 = 200

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.ItemDescBacker:SetBottom(arg_1_1, var_0_0)
end

local function var_0_2(arg_2_0)
	if arg_2_0._hornAudioID then
		Engine.EAGBECEBGA(arg_2_0._hornAudioID)

		arg_2_0._hornAudioID = nil
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or {}

	if arg_3_1.name and #arg_3_1.name then
		arg_3_0.ItemName:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_3_1.name)))
	end

	arg_3_0.UnlockRequirements:SetAlpha(0)
	arg_3_0.SecondActionPrompt:SetAlpha(0)

	if not arg_3_1.isUnlocked and (arg_3_1.challengeInfo or arg_3_1.unlockText) then
		if arg_3_1.challengeInfo then
			arg_3_0.UnlockRequirements:Setup(arg_3_1.challengeInfo)
		elseif arg_3_1.unlockText then
			arg_3_0.UnlockRequirements:SetupUnlockCriteria(arg_3_1.unlockText)
		end

		if LAYOUT.GetElementHeight(arg_3_0.UnlockRequirements.UnlockCriteria) < LAYOUT.GetTextHeightWithWrapping(arg_3_0.UnlockRequirements.UnlockCriteria, arg_3_0.UnlockRequirements.UnlockCriteria:getText()) then
			ACTIONS.AnimateSequence(arg_3_0.UnlockRequirements, "UnlockTwoLines")
			arg_3_0.UnlockRequirements.UnlockCriteria:SetMaxVisibleLines(2)
		else
			ACTIONS.AnimateSequence(arg_3_0.UnlockRequirements, "Unlock")
			arg_3_0.UnlockRequirements.UnlockCriteria:SetMaxVisibleLines(1)
		end

		if not arg_3_1.challengeInfo and arg_3_1.unlockText then
			arg_3_0.UnlockRequirements:SetupUnlockCriteria(arg_3_1.unlockText)
		end

		if arg_3_1.unlockActionPrompt and #arg_3_1.unlockActionPrompt > 0 then
			arg_3_0.SecondActionPrompt:setText(arg_3_1.unlockActionPrompt)
			arg_3_0.SecondActionPrompt:SetAlpha(1, 300)
		end

		arg_3_0.UnlockRequirements:SetAlpha(1, 300)
	end

	local var_3_0 = arg_3_0.ItemName:GetCurrentAnchorsAndPositions().bottom
	local var_3_1 = 10 * _1080p

	arg_3_0.EquippedWidget:SetAlpha(0)
	arg_3_0.NewItemNotification:SetAlpha(0)

	if arg_3_1.isSelected then
		arg_3_0.EquippedWidget:SetAlpha(1, 200)
	elseif arg_3_1.isNew then
		arg_3_0.NewItemNotification:SetAlpha(1, 200)
	end

	if arg_3_1.isSelected or arg_3_1.isNew then
		local var_3_2 = LAYOUT.GetElementHeight(arg_3_0.EquippedWidget)

		arg_3_0.EquippedWidget:SetTop(var_3_0 + var_3_1, var_0_0)
		arg_3_0.EquippedWidget:SetBottom(var_3_0 + var_3_1 + var_3_2, var_0_0)
		arg_3_0.NewItemNotification:SetTop(var_3_0 + var_3_1, var_0_0)
		arg_3_0.NewItemNotification:SetBottom(var_3_0 + var_3_1 + var_3_2, var_0_0)

		var_3_0 = var_3_0 + var_3_2 + var_3_1
	end

	arg_3_0.QualityWithText:UpdateQualityText(arg_3_1.rarity)

	local var_3_3 = LAYOUT.GetElementHeight(arg_3_0.QualityWithText)
	local var_3_4 = var_3_0 + var_3_1

	arg_3_0.QualityWithText:SetTop(var_3_4, var_0_0)
	arg_3_0.SpecialWeaponAttributeWithText:SetTop(var_3_4, var_0_0)

	local var_3_5 = var_3_4 + var_3_3

	arg_3_0.QualityWithText:SetBottom(var_3_5, var_0_0)
	arg_3_0.SpecialWeaponAttributeWithText:SetBottom(var_3_5, var_0_0)

	local var_3_6 = arg_3_0.QualityWithText:CalculateWidth()
	local var_3_7 = 16 * _1080p
	local var_3_8 = 400 * _1080p
	local var_3_9 = arg_3_0.QualityWithText:GetCurrentAnchorsAndPositions().left + var_3_6 + var_3_7
	local var_3_10 = var_3_9 + var_3_8

	arg_3_0.SpecialWeaponAttributeWithText:SetLeft(var_3_9)
	arg_3_0.SpecialWeaponAttributeWithText:SetRight(var_3_10)

	if arg_3_1.lootType == LOOT.itemTypes.VEHICLE_CAMO and VEHICLE.GetAttributeType(arg_3_1.ref) then
		arg_3_0.SpecialWeaponAttributeWithText:SetupVehicleAttribute(arg_3_1.ref)
	else
		arg_3_0.SpecialWeaponAttributeWithText:SetAlpha(0)
	end

	local var_3_11 = 0

	if arg_3_1.season and arg_3_1.season > 0 then
		var_3_11 = LAYOUT.GetElementHeight(arg_3_0.SeasonWithText)

		arg_3_0.SeasonWithText:UpdateSeasonText(arg_3_1.season)
		arg_3_0.SeasonWithText:SetAlpha(1, var_0_0)

		local var_3_12 = var_3_5 + var_3_1
		local var_3_13 = var_3_12 + var_3_11

		arg_3_0.SeasonWithText:SetTop(var_3_12, var_0_0)
		arg_3_0.SeasonWithText:SetBottom(var_3_13, var_0_0)

		var_3_11 = var_3_11 + var_3_1
	else
		arg_3_0.SeasonWithText:SetAlpha(0, 0)
	end

	local var_3_14 = var_3_0 + (arg_3_1.rarity ~= nil and arg_3_1.rarity > -1 and var_3_3 or 0) + var_3_11 + var_3_1

	if arg_3_1.isRandom == true then
		if arg_3_1.lootType == LOOT.itemTypes.VEHICLE_HORN then
			arg_3_1.flavorText = Engine.CBBHFCGDIC("CUSTOMIZE/RANDOM_VEHICLE_HORN")
		elseif arg_3_1.lootType == LOOT.itemTypes.VEHICLE_TRACK then
			arg_3_1.flavorText = Engine.CBBHFCGDIC("CUSTOMIZE/RANDOM_VEHICLE_TRACK")
		elseif arg_3_1.lootType == LOOT.itemTypes.VEHICLE_CAMO then
			arg_3_1.flavorText = Engine.CBBHFCGDIC("CUSTOMIZE/RANDOM_VEHICLE_CAMO")
		end
	end

	if arg_3_1.flavorText and #arg_3_1.flavorText > 0 then
		if arg_3_1.flavorText ~= arg_3_0.ItemDesc:getText() then
			arg_3_0.ItemDesc:SetAlpha(0)
			arg_3_0.ItemDesc:setText(arg_3_1.flavorText)
			arg_3_0.ItemDesc:SetAlpha(1, 300)
		end

		local var_3_15 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.ItemDesc, arg_3_1.flavorText)
		local var_3_16 = LAYOUT.GetElementHeight(arg_3_0.ItemDesc)

		arg_3_0.ItemDesc:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.ItemDesc:SetBottom(var_3_16 + var_3_14 + var_3_1, var_0_0)

		var_3_14 = var_3_14 + var_3_15 + var_3_1
	else
		arg_3_0.ItemDesc:SetAlpha(0)
		arg_3_0.ItemDesc:setText("")
	end

	if not arg_3_1.isCamo and arg_3_1.lootType == LOOT.itemTypes.VEHICLE_HORN and arg_3_1.isRandom ~= true and arg_3_1.lootType ~= LOOT.itemTypes.VEHICLE_TRACK then
		arg_3_0.QuipOverlay:SetAlpha(1, var_0_0)

		local var_3_17 = LAYOUT.GetElementHeight(arg_3_0.QuipOverlay)

		arg_3_0.QuipOverlay:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.QuipOverlay:SetBottom(var_3_14 + var_3_1 + var_3_17, var_0_0)

		var_3_14 = var_3_14 + var_3_17 + var_3_1

		arg_3_0.ActionPrompt:SetAlpha(1, var_0_0)

		local var_3_18 = LAYOUT.GetElementHeight(arg_3_0.ActionPrompt)

		arg_3_0.ActionPrompt:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.ActionPrompt:SetBottom(var_3_14 + var_3_1 + var_3_18, var_0_0)

		var_3_14 = var_3_14 + var_3_18 + var_3_1
	else
		arg_3_0.QuipOverlay:SetAlpha(0)
		arg_3_0.ActionPrompt:SetAlpha(0)
	end

	if arg_3_1.lootType == LOOT.itemTypes.VEHICLE_TRACK and arg_3_1.lootID ~= 1 then
		arg_3_0.VehicleTrackList:SetAlpha(1, var_0_0)

		local var_3_19 = LAYOUT.GetElementHeight(arg_3_0.VehicleTrackList)

		arg_3_0.VehicleTrackList:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.VehicleTrackList:SetBottom(var_3_14 + var_3_1 + var_3_19, var_0_0)

		var_3_14 = var_3_14 + var_3_19 + var_3_1

		arg_3_0.ActionPrompt:SetAlpha(1, var_0_0)

		local var_3_20 = LAYOUT.GetElementHeight(arg_3_0.ActionPrompt)

		arg_3_0.ActionPrompt:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.ActionPrompt:SetBottom(var_3_14 + var_3_1 + var_3_20, var_0_0)

		var_3_14 = var_3_14 + var_3_20 + var_3_1
	end

	if not arg_3_1.isUnlocked and (arg_3_1.challengeInfo or arg_3_1.unlockText) then
		local var_3_21 = LAYOUT.GetElementHeight(arg_3_0.UnlockRequirements)

		arg_3_0.UnlockRequirements:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.UnlockRequirements:SetBottom(var_3_14 + var_3_1 + var_3_21, var_0_0)

		var_3_14 = var_3_14 + var_3_21 + var_3_1
	end

	if arg_3_1.unlockActionPrompt and #arg_3_1.unlockActionPrompt > 0 then
		local var_3_22 = LAYOUT.GetElementHeight(arg_3_0.SecondActionPrompt)

		arg_3_0.SecondActionPrompt:SetTop(var_3_14 + var_3_1, var_0_0)
		arg_3_0.SecondActionPrompt:SetBottom(var_3_14 + var_3_1 + var_3_22, var_0_0)

		var_3_14 = var_3_14 + var_3_22 + var_3_1
	end

	local var_3_23 = var_3_14 + 20 * _1080p

	var_0_1(arg_3_0, var_3_23)

	return var_3_23
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_1 then
		ACTIONS.AnimateSequence(arg_4_0.EquippedWidget, "TurnOn")
		arg_4_0.NewItemNotification:SetAlpha(0)
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0

	local function var_5_1()
		if arg_5_0._hornAudioID and not Engine.CHFEJIG(arg_5_0._hornAudioID) then
			arg_5_0._hornAudioID = nil

			arg_5_0.QuipOverlay:setImage(RegisterMaterial("ui_waveform_idle"))
		else
			arg_5_0:Wait(100).onComplete = var_5_1
		end
	end

	arg_5_0.StopSound(arg_5_0)

	arg_5_0._hornAudioID = Engine.BJDBIAGIDA(arg_5_1)

	arg_5_0.QuipOverlay:setImage(RegisterMaterial("ui_waveform_active"))
	var_5_1()
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.ItemName)
	assert(arg_7_0.ItemDesc)

	arg_7_0.InitializeDimensions = InitializeDimensions
	arg_7_0.SetupDetails = var_0_3
	arg_7_0.ShowEquippedAnim = var_0_4
	arg_7_0.PreviewHorn = var_0_5
	arg_7_0.StopSound = var_0_2

	arg_7_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	else
		arg_7_0.NewItemNotification:SetupLeftAlignment()
	end
end

function VehicleLootPanel(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 527 * _1080p, 0, 548 * _1080p)

	var_8_0.id = "VehicleLootPanel"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "ItemDescBacker"

	var_8_4:SetAlpha(0.75, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 548)
	var_8_0:addElement(var_8_4)

	var_8_0.ItemDescBacker = var_8_4

	local var_8_5

	if CONDITIONS.InFrontend(var_8_0) then
		var_8_5 = LUI.UIStyledText.new()
		var_8_5.id = "SecondActionPrompt"

		var_8_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_8_5:setText(Engine.CBBHFCGDIC("LUA_MENU/TUTORIAL_PROMPT"), 0)
		var_8_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_8_5:SetAlignment(LUI.Alignment.Left)
		var_8_5:SetOptOutRightToLeftAlignmentFlip(true)
		var_8_5:SetTintFontIcons(true)
		var_8_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 493, _1080p * 505, _1080p * 525)
		var_8_0:addElement(var_8_5)

		var_8_0.SecondActionPrompt = var_8_5
	end

	local var_8_6

	if CONDITIONS.InFrontend(var_8_0) then
		var_8_6 = LUI.UIStyledText.new()
		var_8_6.id = "ActionPrompt"

		var_8_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_8_6:setText(Engine.CBBHFCGDIC("LUA_MENU/TUTORIAL_PROMPT"), 0)
		var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_8_6:SetAlignment(LUI.Alignment.Left)
		var_8_6:SetOptOutRightToLeftAlignmentFlip(true)
		var_8_6:SetTintFontIcons(true)
		var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 495, _1080p * 337, _1080p * 357)
		var_8_0:addElement(var_8_6)

		var_8_0.ActionPrompt = var_8_6
	end

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "ItemName"

	var_8_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_8:setText("", 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetStartupDelay(1000)
	var_8_8:SetLineHoldTime(400)
	var_8_8:SetAnimMoveTime(150)
	var_8_8:SetAnimMoveSpeed(50)
	var_8_8:SetEndDelay(1000)
	var_8_8:SetCrossfadeTime(400)
	var_8_8:SetFadeInTime(300)
	var_8_8:SetFadeOutTime(300)
	var_8_8:SetMaxVisibleLines(1)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 495, _1080p * 16, _1080p * 66)
	var_8_0:addElement(var_8_8)

	var_8_0.ItemName = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIStyledText.new()

	var_8_10.id = "ItemDesc"

	var_8_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 495, _1080p * 186, _1080p * 208)
	var_8_0:addElement(var_8_10)

	var_8_0.ItemDesc = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "EquippedWidget"

	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 170, _1080p * 73, _1080p * 103)
	var_8_0:addElement(var_8_12)

	var_8_0.EquippedWidget = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "NewItemNotification"

	var_8_14:SetAlpha(0, 0)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 112, _1080p * 73, _1080p * 103)
	var_8_0:addElement(var_8_14)

	var_8_0.NewItemNotification = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("UnlockRequirements", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "UnlockRequirements"

	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 477, _1080p * 375, _1080p * 505)
	var_8_0:addElement(var_8_16)

	var_8_0.UnlockRequirements = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "SeasonWithText"

	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 194, _1080p * 146, _1080p * 178)
	var_8_0:addElement(var_8_18)

	var_8_0.SeasonWithText = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "QualityWithText"

	var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 194, _1080p * 108, _1080p * 140)
	var_8_0:addElement(var_8_20)

	var_8_0.QualityWithText = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIImage.new()

	var_8_22.id = "QuipOverlay"

	var_8_22:SetScale(-0.35, 0)
	var_8_22:setImage(RegisterMaterial("ui_waveform_idle"), 0)
	var_8_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -62, _1080p * 485, _1080p * 215, _1080p * 353)
	var_8_0:addElement(var_8_22)

	var_8_0.QuipOverlay = var_8_22

	local var_8_23
	local var_8_24 = MenuBuilder.BuildRegisteredType("SpecialWeaponAttributeWithText", {
		controllerIndex = var_8_1
	})

	var_8_24.id = "SpecialWeaponAttributeWithText"

	var_8_24:SetAlpha(0, 0)
	var_8_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 202, _1080p * 494, _1080p * 108, _1080p * 140)
	var_8_0:addElement(var_8_24)

	var_8_0.SpecialWeaponAttributeWithText = var_8_24

	local var_8_25
	local var_8_26 = MenuBuilder.BuildRegisteredType("VehicleTrackList", {
		controllerIndex = var_8_1
	})

	var_8_26.id = "VehicleTrackList"

	var_8_26:SetAlpha(0, 0)
	var_8_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 495, _1080p * 224, _1080p * 324)
	var_8_0:addElement(var_8_26)

	var_8_0.VehicleTrackList = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
		}
	}

	var_8_4:RegisterAnimationSequence("DefaultSequence", var_8_28)

	local function var_8_29()
		var_8_4:AnimateSequence("DefaultSequence")
	end

	var_8_0._sequences.DefaultSequence = var_8_29

	local var_8_30

	if CONDITIONS.InFrontend(var_8_0) then
		local var_8_31 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 490
			}
		}

		var_8_5:RegisterAnimationSequence("AR", var_8_31)
	end

	if CONDITIONS.InFrontend(var_8_0) then
		local var_8_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 322
			}
		}

		var_8_6:RegisterAnimationSequence("AR", var_8_32)
	end

	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 171
		}
	}

	var_8_10:RegisterAnimationSequence("AR", var_8_33)

	local function var_8_34()
		if CONDITIONS.InFrontend(var_8_0) then
			var_8_5:AnimateSequence("AR")
		end

		if CONDITIONS.InFrontend(var_8_0) then
			var_8_6:AnimateSequence("AR")
		end

		var_8_10:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_34

	var_0_6(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("VehicleLootPanel", VehicleLootPanel)
LockTable(_M)
