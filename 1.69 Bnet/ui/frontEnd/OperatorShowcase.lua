module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = arg_1_0.operatorData.skinInfo or OPERATOR.GetEquippedSkinForOperator(arg_1_3, arg_1_2)
	local var_1_1 = arg_1_0.weaponData.accessoryWeaponModel or WATCH.WatchNoneValue
	local var_1_2 = OPERATOR.ValidateAccessoryModel(var_1_1, var_1_0.bodyModel)
	local var_1_3 = WEAPON.GetWeaponDetailsFromModel(arg_1_0.weaponData.secondaryModel)

	if not OPERATOR.IsStowedWeaponAllowedInPreviewScreens(var_1_3.weaponAsset) then
		arg_1_0.weaponData.secondaryModel = WEAPON.NoneValue
	end

	FrontEndScene.RequestWeaponWorldModels({
		arg_1_0.weaponData.primaryModel,
		arg_1_0.weaponData.secondaryModel,
		var_1_2
	})

	local var_1_4 = {
		defaultAnim = false,
		showCharacter = true,
		element = arg_1_0,
		weaponModel = arg_1_0.weaponData.primaryModel,
		secondaryModel = arg_1_0.weaponData.secondaryModel,
		accessoryModel = var_1_2
	}

	OPERATOR.UpdateClientCharacter(arg_1_1, var_1_0.bodyModel, var_1_0.headModel, var_1_4)
	ClientCharacter.DDHJHDEHFG(arg_1_1, 0, 10, 0)

	local var_1_5 = OPERATOR.GetExecutionForOperator(arg_1_3, arg_1_2)
	local var_1_6 = OPERATOR.GetPetCharacterForSuperFaction(arg_1_0.operatorData.currentState)

	OPERATOR.UpdatePet(arg_1_3, var_1_6, {
		idle = true,
		execution = var_1_5,
		element = arg_1_0
	})

	local var_1_7 = OPERATOR.GetOperatorSkinRef(var_1_0.bodyModel, var_1_0.headModel)
	local var_1_8 = OPERATOR.GetTurnIdleAnimation(arg_1_2, var_1_7)

	assert(var_1_8 and var_1_8 ~= "")

	local var_1_9 = ClientCharacter.DCECEDGHEG(arg_1_1)
	local var_1_10, var_1_11, var_1_12 = OPERATOR.GetTransitionInfoFromAnimation(var_1_9)

	if arg_1_0.queueAnim then
		ClientCharacter.BHJJGDDGFI(arg_1_1, var_1_8, var_1_12, var_1_10, var_1_11)
	else
		ClientCharacter.CAECDIHFCF(arg_1_1, var_1_8)
	end

	arg_1_0.CharacterRotator:SetClientCharacterInfo(arg_1_1, arg_1_2, var_1_7)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._isBattlePassPreview or arg_2_0._isStorePreview then
		arg_2_0.westSelectedOperator = arg_2_0.operatorData.previewOperatorRef

		arg_2_0:SetupClientCharacterForOperator(0, arg_2_0.westSelectedOperator, arg_2_1)
	elseif arg_2_0.operatorData.currentState == OPERATOR.SuperFaction.WEST then
		arg_2_0.westSelectedOperator = arg_2_0.operatorData.westSelectedOperator

		arg_2_0:SetupClientCharacterForOperator(FrontEndScene.ClientCharacters.OperatorWest, arg_2_0.westSelectedOperator, arg_2_1)
		arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(OPERATOR.GetName(arg_2_0.westSelectedOperator)))
	else
		arg_2_0.eastSelectedOperator = arg_2_0.operatorData.eastSelectedOperator

		arg_2_0:SetupClientCharacterForOperator(FrontEndScene.ClientCharacters.OperatorEast, arg_2_0.eastSelectedOperator, arg_2_1)
		arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(OPERATOR.GetName(arg_2_0.eastSelectedOperator)))
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.ItemType)
	assert(arg_3_0.ItemQuality)
	assert(arg_3_0.FlavorText)

	arg_3_0.queueAnim = false

	ACTIONS.AnimateSequence(arg_3_0, "FromStore")
	FrontEndScene.RequestBodyModels({
		arg_3_0.operatorData.skinInfo.bodyModel
	})
	FrontEndScene.RequestHeadModels({
		arg_3_0.operatorData.skinInfo.headModel
	})

	local var_3_0 = arg_3_1.storePreviewItemType
	local var_3_1 = LOOT.GetItemClassName(var_3_0, arg_3_1.itemRef)

	if var_3_1 and #var_3_1 > 0 then
		arg_3_0.ItemType:setText(var_3_1)
	end

	local var_3_2 = arg_3_1.itemRef

	if var_3_0 == LOOT.itemTypes.FEATURE then
		var_3_2 = LOOT.GetFeatureOperatorSkinRef(arg_3_1.itemRef)
	end

	local var_3_3 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, var_3_2, CSV.operatorSkins.cols.desc)

	if var_3_3 then
		arg_3_0.FlavorText:setText(Engine.CBBHFCGDIC(var_3_3))
	end

	local var_3_4 = LOOT.GetItemQuality(var_3_0, arg_3_1.itemRef)

	arg_3_0.ItemQuality:UpdateQualityText(var_3_4)
	arg_3_0:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		if arg_3_1.titleOverride and #arg_3_1.titleOverride > 0 then
			arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(arg_3_1.titleOverride))
		end

		local var_4_0 = var_3_0 == LOOT.itemTypes.WEAPON and arg_3_1.weaponTable.lootID or LOOT.GetItemID(var_3_0, arg_3_1.itemRef)

		if Loot.DEBEIFJEEG(arg_3_0._controllerIndex, var_4_0) > 0 then
			local var_4_1 = LAYOUT.GetTextWidth(arg_3_0.MenuTitle.MenuTitle)
			local var_4_2 = LAYOUT.GetElementWidth(arg_3_0.CheckboxFrame)
			local var_4_3 = 100 * _1080p
			local var_4_4 = 16 * _1080p
			local var_4_5 = {
				arg_3_0.Checkbox,
				arg_3_0.CheckboxFrame
			}

			for iter_4_0 = 1, #var_4_5 do
				var_4_5[iter_4_0]:SetLeft(var_4_1 + var_4_3 + var_4_4)
				var_4_5[iter_4_0]:SetRight(var_4_1 + var_4_3 + var_4_4 + var_4_2)
				var_4_5[iter_4_0]:SetAlpha(1)
			end
		end
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.operatorData = arg_5_2.operatorData
	arg_5_0.weaponData = arg_5_2.weaponData
	arg_5_0.isCustomizationMenu = true
	arg_5_0.queueAnim = true
	arg_5_0._isBattlePassPreview = arg_5_2.isBattlePass
	arg_5_0._isStorePreview = arg_5_2.isStorePreview
	arg_5_0._controllerIndex = arg_5_1

	arg_5_0.PreviewControlsLegend:SetupLegend(arg_5_0, LOOT.itemTypes.OPERATOR)
	arg_5_0.PreviewControlsLegend:processEvent({
		name = "update_input_type",
		controllerIndex = arg_5_1
	})

	arg_5_0.SetupClientCharacterForOperator = var_0_0
	arg_5_0.SetupOperator = var_0_1
	arg_5_0.isQuickAccessShortcutsDisabled = true

	if arg_5_0._isBattlePassPreview or arg_5_0._isStorePreview then
		Engine.DHFCHIIJCA("character_preview_select")
	elseif arg_5_0.operatorData.currentState == OPERATOR.SuperFaction.WEST then
		Engine.DHFCHIIJCA("character_faction_select_l")
	else
		Engine.DHFCHIIJCA("character_faction_select_r")
	end

	if arg_5_0._isStorePreview then
		var_0_2(arg_5_0, arg_5_2)
	end

	if not arg_5_0.weaponData then
		local var_5_0 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_5_1)
		local var_5_1, var_5_2 = OPERATOR.GetWeaponDataFromLoadout(arg_5_1)

		arg_5_0.weaponData = {
			primaryModel = var_5_1,
			secondaryModel = var_5_2,
			accessoryWeaponModel = var_5_0
		}
	end

	arg_5_0:SetupOperator(arg_5_1)

	local var_5_3 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		useMousePan = true,
		snapToCenter = false,
		enableZoom = true,
		enableHoldZoom = true,
		useLeftStick = true,
		enableWheelZoom = true,
		enableSway = false,
		controllerIndex = arg_5_1
	})
	local var_5_4 = -40
	local var_5_5 = 0
	local var_5_6 = 0
	local var_5_7 = 0

	var_5_3:SetLimits(var_5_6, var_5_7, var_5_4, var_5_5)
	var_5_3:SetSwayValues(2000, 0.06, 0.1)
	var_5_3:SetScreenOrigin(0, 40)
	var_5_3:SetVelocity(1)
	var_5_3:SetMaxZoom(50)
	var_5_3:SetMinZoom(0)
	var_5_3:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 500, _1080p * -540, _1080p * 480)
	var_5_3:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_PANFOURWAYS)
	arg_5_0.CharacterRotator.characterRotationArea:addElement(var_5_3)

	arg_5_0.CharacterRotator.characterRotationArea.FrontendCameraMover = var_5_3

	local var_5_8 = LUI.UIBindButton.new()

	var_5_8.id = "selfBindButton"

	arg_5_0:addElement(var_5_8)

	arg_5_0.bindButton = var_5_8

	arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/RESET_POSITION")
	})
	arg_5_0.bindButton:addEventHandler("button_alt2", function(arg_6_0, arg_6_1)
		if arg_6_1.controller == var_5_3.controllerIndex then
			var_5_3:ResetCamera()

			if arg_6_1.qualifier == "keyboard" or arg_6_1.qualifier == "gamepad" then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		end
	end)

	local function var_5_9(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.name == "button_shoulderl" and -0.25 or 0.25

		if LUI.IsLastInputKeyboardMouse(arg_7_1.controller) then
			arg_5_0.CharacterRotator.characterRotationArea:ButtonInput(var_7_0)
		end
	end

	arg_5_0.bindButton:addEventHandler("button_right_stick", ToggleCamera)
	arg_5_0.bindButton:addEventHandler("button_shoulderl", var_5_9)
	arg_5_0.bindButton:addEventHandler("button_shoulderr", var_5_9)

	local var_5_10 = arg_5_2.bundleData

	if arg_5_2.isBattlePass then
		BATTLEPASS.AddPurchasePrompt(arg_5_0, arg_5_1)
	end

	if arg_5_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_5_10.isBundlePurchased then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE")
		})
		arg_5_0.bindButton:addEventHandler("button_alt1", function(arg_8_0, arg_8_1)
			STORE.OpenQuickPurchasePopupInPreview(var_5_10)
		end)
	end

	ACTIONS.ScaleFullscreen(arg_5_0.Vignette)
	LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
	arg_5_0:registerEventHandler("closing_quick_access_menu", function(arg_9_0, arg_9_1)
		if arg_9_0._isBattlePassPreview or arg_9_0._isStorePreview then
			Engine.DHFCHIIJCA("character_preview_select")
		elseif arg_9_0.operatorData.currentState == OPERATOR.SuperFaction.WEST then
			Engine.DHFCHIIJCA("character_faction_select_l")
		else
			Engine.DHFCHIIJCA("character_faction_select_r")
		end

		arg_9_0:SetupOperator(arg_9_1.controllerIndex)

		return true
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end

	if arg_5_2.timerValue then
		arg_5_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_5_2.timerValue, true, true)
	else
		arg_5_0.LimitedTimeItem:SetAlpha(0)
	end
end

function OperatorShowcase(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "OperatorShowcase"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Vignette"

	var_10_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_10_4:SetBlendMode(BLEND_MODE.multiply)
	var_10_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_10_0:addElement(var_10_4)

	var_10_0.Vignette = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("CharacterRotator", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "CharacterRotator"

	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 500, _1080p * -540, _1080p * 480)
	var_10_0:addElement(var_10_6)

	var_10_0.CharacterRotator = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "LobbyMembersFooter"

	var_10_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_10_0:addElement(var_10_8)

	var_10_0.LobbyMembersFooter = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("PreviewControlsLegend", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "PreviewControlsLegend"

	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 456, _1080p * 154, _1080p * 435)
	var_10_0:addElement(var_10_10)

	var_10_0.PreviewControlsLegend = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "ItemQuality"

	var_10_12:SetAlpha(0, 0)
	var_10_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1824, _1080p * -1664, _1080p * 146, _1080p * 178)
	var_10_0:addElement(var_10_12)

	var_10_0.ItemQuality = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIText.new()

	var_10_14.id = "ItemType"

	var_10_14:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_14:SetAlpha(0, 0)
	var_10_14:setText("", 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_14:SetAlignment(LUI.Alignment.Left)
	var_10_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 108, _1080p * 138)
	var_10_0:addElement(var_10_14)

	var_10_0.ItemType = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "MenuTitle"

	var_10_16.MenuTitle:setText("Operator Name", 0)
	var_10_16.Line:SetLeft(0, 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_10_0:addElement(var_10_16)

	var_10_0.MenuTitle = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIStyledText.new()

	var_10_18.id = "FlavorText"

	var_10_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_18:SetAlpha(0, 0)
	var_10_18:setText("", 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_18:SetAlignment(LUI.Alignment.Left)
	var_10_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_10_18:SetStartupDelay(2000)
	var_10_18:SetLineHoldTime(400)
	var_10_18:SetAnimMoveTime(2000)
	var_10_18:SetAnimMoveSpeed(150)
	var_10_18:SetEndDelay(2000)
	var_10_18:SetCrossfadeTime(250)
	var_10_18:SetFadeInTime(300)
	var_10_18:SetFadeOutTime(300)
	var_10_18:SetMaxVisibleLines(2)
	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 520, _1080p * 185, _1080p * 207)
	var_10_0:addElement(var_10_18)

	var_10_0.FlavorText = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "LimitedTimeItem"

	var_10_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 396, _1080p * 550, _1080p * 580)
	var_10_0:addElement(var_10_20)

	var_10_0.LimitedTimeItem = var_10_20

	local var_10_21
	local var_10_22 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_10_23 = LUI.UIBorder.new(var_10_22)

	var_10_23.id = "CheckboxFrame"

	var_10_23:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_10_23:SetAlpha(0, 0)
	var_10_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 488, _1080p * 512, _1080p * 59, _1080p * 83)
	var_10_0:addElement(var_10_23)

	var_10_0.CheckboxFrame = var_10_23

	local var_10_24
	local var_10_25 = LUI.UIImage.new()

	var_10_25.id = "Checkbox"

	var_10_25:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_10_25:SetAlpha(0, 0)
	var_10_25:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_10_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 488, _1080p * 512, _1080p * 59, _1080p * 83)
	var_10_0:addElement(var_10_25)

	var_10_0.Checkbox = var_10_25

	local function var_10_26()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_26

	local var_10_27
	local var_10_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 531
		}
	}

	var_10_10:RegisterAnimationSequence("FromStore", var_10_28)

	local var_10_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("FromStore", var_10_29)

	local var_10_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("FromStore", var_10_30)

	local var_10_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("FromStore", var_10_31)

	local function var_10_32()
		var_10_10:AnimateSequence("FromStore")
		var_10_12:AnimateSequence("FromStore")
		var_10_14:AnimateSequence("FromStore")
		var_10_18:AnimateSequence("FromStore")
	end

	var_10_0._sequences.FromStore = var_10_32

	local function var_10_33()
		return
	end

	var_10_0._sequences.AR = var_10_33

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_10_34 = LUI.UIBindButton.new()

	var_10_34.id = "selfBindButton"

	var_10_0:addElement(var_10_34)

	var_10_0.bindButton = var_10_34

	var_10_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_10_1
		end

		ACTIONS.LeaveMenu(var_10_0)
	end)
	var_0_3(var_10_0, var_10_1, arg_10_1)
	ACTIONS.PlaySoundSetSound(var_10_0, "gainFocus", false)

	return var_10_0
end

MenuBuilder.registerType("OperatorShowcase", OperatorShowcase)
LockTable(_M)
