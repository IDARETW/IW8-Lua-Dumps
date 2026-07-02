module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = PlayercardUtils.GetFrontendDataSources(var_0_0, arg_1_1)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		arg_1_0.SmallPlayerCard:SetDataSource(var_1_0, arg_1_1)
	else
		arg_1_0.WZSmallPlayerCard:SetDataSource(var_1_0, arg_1_1)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0:SetAnchorsAndPosition(0, 1, 0, 1, arg_2_0._curDim.left, arg_2_0._curDim.right, arg_2_0._curDim.top, arg_2_0._curDim.bottom + arg_2_1, 200)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = tonumber(arg_3_1.rarity)
	local var_3_1 = tonumber(arg_3_1.season)

	if var_3_0 then
		arg_3_0.QualityWithText:UpdateQualityText(var_3_0)
	end

	if var_3_1 then
		arg_3_0.SeasonWithText:UpdateSeasonText(var_3_1)
	end

	arg_3_0.CurrentName:setText(Engine.CBBHFCGDIC(arg_3_1.name))
	arg_3_0.PreviewImage:SetAlpha(1)
	arg_3_0.ClanEmblem:SetAlpha(0)

	if arg_3_1.lootType == LOOT.itemTypes.PLAYERCARD then
		arg_3_0.PreviewImage:setImage(RegisterMaterial(arg_3_1.image))
		ACTIONS.AnimateSequence(arg_3_0, "CallingCard")
	elseif arg_3_1.lootType == LOOT.itemTypes.EMBLEM then
		ACTIONS.AnimateSequence(arg_3_0, "Emblem")

		if arg_3_1.isClanEmblem then
			arg_3_0.ClanEmblem:SetAlpha(1)
			arg_3_0.PreviewImage:SetAlpha(0)
			arg_3_0.ClanEmblem:SetEmblem(arg_3_1.clanEmblemData, false)
		else
			arg_3_0.PreviewImage:setImage(RegisterMaterial(arg_3_1.image))
		end
	elseif arg_3_1.lootType == LOOT.itemTypes.FRAME then
		arg_3_0.PreviewImage:setImage(RegisterMaterial(arg_3_1.image))
		ACTIONS.AnimateSequence(arg_3_0, "CallingCard")
	elseif arg_3_1.lootType == LOOT.itemTypes.TITLE then
		arg_3_0.PreviewText:setText(Engine.CBBHFCGDIC(arg_3_1.name))
		ACTIONS.AnimateSequence(arg_3_0, "PlayerTitle")
	elseif arg_3_1.lootType == LOOT.itemTypes.GESTURES then
		arg_3_0.PreviewImage:setImage(RegisterMaterial(arg_3_1.image))
	elseif arg_3_1.lootType == LOOT.itemTypes.SPRAYS then
		arg_3_0.PreviewImage:setImage(RegisterMaterial(arg_3_1.image))
	end

	local var_3_2 = 12 * _1080p
	local var_3_3 = arg_3_0.PreviewImage:GetCurrentAnchorsAndPositions().bottom + var_3_2
	local var_3_4 = arg_3_3 and not LOOT.HideLootBreadcrumbsCondition()

	arg_3_0.NewItemPreviewNotification:SetAlpha(not arg_3_2 and var_3_4 and 1 or 0, 200)

	if not arg_3_2 and var_3_4 then
		local var_3_5 = LAYOUT.GetElementHeight(arg_3_0.NewItemPreviewNotification)

		arg_3_0.NewItemPreviewNotification:SetTop(var_3_3, 200)
		arg_3_0.NewItemPreviewNotification:SetBottom(var_3_3 + var_3_5, 200)

		var_3_3 = var_3_3 + var_3_5 + var_3_2
	end

	if arg_3_2 and not arg_3_0.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_3_0.EquippedWidget, "TurnOn")
	end

	arg_3_0.EquippedWidget:UpdateVisibility(arg_3_2)

	if arg_3_2 then
		local var_3_6 = LAYOUT.GetElementHeight(arg_3_0.EquippedWidget)

		arg_3_0.EquippedWidget:SetTop(var_3_3, 200)
		arg_3_0.EquippedWidget:SetBottom(var_3_3 + var_3_6, 200)

		var_3_3 = var_3_3 + var_3_6 + var_3_2
	end

	if var_3_0 and var_3_0 > -1 then
		arg_3_0.QualityWithText:SetAlpha(1, 200)

		local var_3_7 = LAYOUT.GetElementHeight(arg_3_0.QualityWithText)

		arg_3_0.QualityWithText:SetTop(var_3_3, 200)
		arg_3_0.QualityWithText:SetBottom(var_3_3 + var_3_7, 200)

		var_3_3 = var_3_3 + var_3_7 + var_3_2
	else
		arg_3_0.QualityWithText:SetAlpha(0, 200)
	end

	if var_3_1 and var_3_1 > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
		arg_3_0.SeasonWithText:SetAlpha(1, 200)

		local var_3_8 = LAYOUT.GetElementHeight(arg_3_0.SeasonWithText)

		arg_3_0.SeasonWithText:SetTop(var_3_3, 200)
		arg_3_0.SeasonWithText:SetBottom(var_3_3 + var_3_8, 200)

		var_3_3 = var_3_3 + var_3_8 + var_3_2
	else
		arg_3_0.SeasonWithText:SetAlpha(0, 200)
	end

	arg_3_0.Description:SetAlpha(0)

	if arg_3_1.description and #arg_3_1.description > 0 then
		arg_3_0.Description:setText(arg_3_1.description)
		arg_3_0.Description:SetAlpha(1, 200)

		local var_3_9 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.Description, arg_3_1.description)
		local var_3_10 = LAYOUT.GetElementHeight(arg_3_0.Description)

		arg_3_0.Description:SetTop(var_3_3, 200)
		arg_3_0.Description:SetBottom(var_3_3 + var_3_10, 200)

		var_3_3 = var_3_3 + var_3_9 + var_3_2
	end

	arg_3_0.UnlockCriteria:SetAlpha(0)

	if not arg_3_1.isUnlocked and arg_3_1.unlockText and #arg_3_1.unlockText > 0 then
		arg_3_0.UnlockCriteria:SetUnlockText(arg_3_1.unlockText)
		arg_3_0.UnlockCriteria:SetAlpha(1, 200)

		local var_3_11 = LAYOUT.GetElementHeight(arg_3_0.UnlockCriteria)

		arg_3_0.UnlockCriteria:SetTop(var_3_3, 200)
		arg_3_0.UnlockCriteria:SetBottom(var_3_3 + var_3_11, 200)

		var_3_3 = var_3_3 + var_3_11 + var_3_2
	end

	var_0_2(arg_3_0, var_3_3)
end

local function var_0_4(arg_4_0, arg_4_1)
	arg_4_0._curDim = arg_4_1
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.EquippedWidget)

	arg_5_0.UpdatePanel = var_0_3
	arg_5_0.UpdatePlayerCardData = var_0_1
	arg_5_0.SetupPanel = var_0_4
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._curDim = nil

	arg_5_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	arg_5_0:UpdatePlayerCardData(arg_5_1)

	if not IsLanguageArabic() then
		arg_5_0.NewItemPreviewNotification:SetupLeftAlignment()
	else
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_5_0, "WZSetup")
	end
end

function CustomizationDetailPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 555 * _1080p, 0, 726 * _1080p)

	var_6_0.id = "CustomizationDetailPanel"
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

	var_6_4.id = "SelectedEmblemBG"

	var_6_4:SetAlpha(0.5, 0)
	var_6_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 555, 0, _1080p * -191)
	var_6_0:addElement(var_6_4)

	var_6_0.SelectedEmblemBG = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "CurrentEmblemBG"

	var_6_6:SetAlpha(0.5, 0)
	var_6_6.Background:SetRGBFromInt(1447446, 0)
	var_6_6.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 555, _1080p * -172, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.CurrentEmblemBG = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "CurrentEquipTitle"

	var_6_8.Text:SetLeft(0, 0)
	var_6_8.Text:SetRight(0, 0)
	var_6_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENTLY_EQUIPPED"), 0)
	var_6_8.Text:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -172, _1080p * -125)
	var_6_0:addElement(var_6_8)

	var_6_0.CurrentEquipTitle = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "SeasonWithText"

	var_6_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -528, _1080p * -368, _1080p * 394, _1080p * 426)
	var_6_0:addElement(var_6_10)

	var_6_0.SeasonWithText = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "QualityWithText"

	var_6_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -528, _1080p * -368, _1080p * 355, _1080p * 387)
	var_6_0:addElement(var_6_12)

	var_6_0.QualityWithText = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "EquippedWidget"

	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 163, _1080p * 311, _1080p * 341)
	var_6_0:addElement(var_6_14)

	var_6_0.EquippedWidget = var_6_14

	local var_6_15

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		var_6_15 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
			controllerIndex = var_6_1
		})
		var_6_15.id = "SmallPlayerCard"

		var_6_15.GradientBacker:SetAlpha(0, 0)
		var_6_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 17, _1080p * 537, _1080p * -144, _1080p * -20)
		var_6_0:addElement(var_6_15)

		var_6_0.SmallPlayerCard = var_6_15
	end

	local var_6_16

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		var_6_16 = MenuBuilder.BuildRegisteredType("WZSmallPlayerCard", {
			controllerIndex = var_6_1
		})
		var_6_16.id = "WZSmallPlayerCard"

		var_6_16.GradientBacker:SetAlpha(0, 0)
		var_6_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 17, _1080p * 537, _1080p * -144, _1080p * -20)
		var_6_0:addElement(var_6_16)

		var_6_0.WZSmallPlayerCard = var_6_16
	end

	local var_6_17
	local var_6_18 = LUI.UIStyledText.new()

	var_6_18.id = "CurrentName"

	var_6_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_18:setText("", 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_18:SetWordWrap(false)
	var_6_18:SetAlignment(LUI.Alignment.Left)
	var_6_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_18:SetStartupDelay(2000)
	var_6_18:SetLineHoldTime(2000)
	var_6_18:SetAnimMoveTime(1000)
	var_6_18:SetAnimMoveSpeed(150)
	var_6_18:SetEndDelay(2000)
	var_6_18:SetCrossfadeTime(400)
	var_6_18:SetFadeInTime(300)
	var_6_18:SetFadeOutTime(300)
	var_6_18:SetMaxVisibleLines(1)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 537, _1080p * 10, _1080p * 46)
	var_6_0:addElement(var_6_18)

	var_6_0.CurrentName = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIImage.new()

	var_6_20.id = "PreviewImage"

	var_6_20:setImage(RegisterMaterial("ui_emblem_040"), 0)
	var_6_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 398, _1080p * 58, _1080p * 290)
	var_6_0:addElement(var_6_20)

	var_6_0.PreviewImage = var_6_20

	local var_6_21
	local var_6_22 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_6_1
	})

	var_6_22.id = "ClanEmblem"

	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 398, _1080p * 58, _1080p * 290)
	var_6_0:addElement(var_6_22)

	var_6_0.ClanEmblem = var_6_22

	local var_6_23
	local var_6_24 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_6_1
	})

	var_6_24.id = "NewItemPreviewNotification"

	var_6_24:SetAlpha(0, 0)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 105, _1080p * 311, _1080p * 341)
	var_6_0:addElement(var_6_24)

	var_6_0.NewItemPreviewNotification = var_6_24

	local var_6_25
	local var_6_26 = LUI.UIStyledText.new()

	var_6_26.id = "PreviewText"

	var_6_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_26:setText("", 0)
	var_6_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_26:SetWordWrap(false)
	var_6_26:SetAlignment(LUI.Alignment.Center)
	var_6_26:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_26:SetStartupDelay(2000)
	var_6_26:SetLineHoldTime(2000)
	var_6_26:SetAnimMoveTime(1000)
	var_6_26:SetAnimMoveSpeed(150)
	var_6_26:SetEndDelay(2000)
	var_6_26:SetCrossfadeTime(400)
	var_6_26:SetFadeInTime(300)
	var_6_26:SetFadeOutTime(300)
	var_6_26:SetMaxVisibleLines(1)
	var_6_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 77, _1080p * 472, _1080p * 138, _1080p * 174)
	var_6_0:addElement(var_6_26)

	var_6_0.PreviewText = var_6_26

	local var_6_27
	local var_6_28 = LUI.UIStyledText.new()

	var_6_28.id = "Description"

	var_6_28:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_28:setText("", 0)
	var_6_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_28:SetAlignment(LUI.Alignment.Left)
	var_6_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 522, _1080p * 442, _1080p * 464)
	var_6_0:addElement(var_6_28)

	var_6_0.Description = var_6_28

	local var_6_29
	local var_6_30 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_6_1
	})

	var_6_30.id = "UnlockCriteria"

	var_6_30.UnlockDesc:SetRight(_1080p * 343, 0)
	var_6_30.UnlockDesc:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_30.UnlockDesc:setText("LOCKED", 0)
	var_6_30.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_6_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 522, _1080p * 475, _1080p * 507)
	var_6_0:addElement(var_6_30)

	var_6_0.UnlockCriteria = var_6_30

	local function var_6_31()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("HideCurrentEquipped", var_6_33)

	local var_6_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("HideCurrentEquipped", var_6_34)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_6_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_15:RegisterAnimationSequence("HideCurrentEquipped", var_6_35)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_6_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_16:RegisterAnimationSequence("HideCurrentEquipped", var_6_36)
	end

	local function var_6_37()
		var_6_6:AnimateSequence("HideCurrentEquipped")
		var_6_8:AnimateSequence("HideCurrentEquipped")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_6_15:AnimateSequence("HideCurrentEquipped")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_6_16:AnimateSequence("HideCurrentEquipped")
		end
	end

	var_6_0._sequences.HideCurrentEquipped = var_6_37

	local var_6_38

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_6_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha,
				child = var_6_0.WZSmallPlayerCard.GradientBacker
			}
		}

		var_6_16:RegisterAnimationSequence("CallingCard", var_6_39)
	end

	local var_6_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 186
		}
	}

	var_6_20:RegisterAnimationSequence("CallingCard", var_6_40)

	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_22:RegisterAnimationSequence("CallingCard", var_6_41)

	local var_6_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("CallingCard", var_6_42)

	local function var_6_43()
		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_6_16:AnimateSequence("CallingCard")
		end

		var_6_20:AnimateSequence("CallingCard")
		var_6_22:AnimateSequence("CallingCard")
		var_6_26:AnimateSequence("CallingCard")
	end

	var_6_0._sequences.CallingCard = var_6_43

	local var_6_44

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_6_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha,
				child = var_6_0.SmallPlayerCard.GradientBacker
			}
		}

		var_6_15:RegisterAnimationSequence("Emblem", var_6_45)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_6_46 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha,
				child = var_6_0.WZSmallPlayerCard.GradientBacker
			}
		}

		var_6_16:RegisterAnimationSequence("Emblem", var_6_46)
	end

	local var_6_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 398
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 290
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("Emblem", var_6_47)

	local var_6_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("Emblem", var_6_48)

	local function var_6_49()
		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_6_15:AnimateSequence("Emblem")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_6_16:AnimateSequence("Emblem")
		end

		var_6_20:AnimateSequence("Emblem")
		var_6_26:AnimateSequence("Emblem")
	end

	var_6_0._sequences.Emblem = var_6_49

	local var_6_50
	local var_6_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 474
		}
	}

	var_6_28:RegisterAnimationSequence("AR", var_6_51)

	local function var_6_52()
		var_6_28:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_52

	local var_6_53

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_6_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_15:RegisterAnimationSequence("PlayerTitle", var_6_54)
	end

	local var_6_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 186
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("PlayerTitle", var_6_55)

	local var_6_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_22:RegisterAnimationSequence("PlayerTitle", var_6_56)

	local var_6_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_6_26:RegisterAnimationSequence("PlayerTitle", var_6_57)

	local function var_6_58()
		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_6_15:AnimateSequence("PlayerTitle")
		end

		var_6_20:AnimateSequence("PlayerTitle")
		var_6_22:AnimateSequence("PlayerTitle")
		var_6_26:AnimateSequence("PlayerTitle")
	end

	var_6_0._sequences.PlayerTitle = var_6_58

	local var_6_59
	local var_6_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator,
			child = var_6_0.CurrentEquipTitle.Divider
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_6_0.CurrentEquipTitle.Text
		}
	}

	var_6_8:RegisterAnimationSequence("WZSetup", var_6_60)

	local var_6_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_18:RegisterAnimationSequence("WZSetup", var_6_61)

	local var_6_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_6_26:RegisterAnimationSequence("WZSetup", var_6_62)

	local var_6_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_6_28:RegisterAnimationSequence("WZSetup", var_6_63)

	local var_6_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription,
			child = var_6_0.UnlockCriteria.UnlockDesc
		}
	}

	var_6_30:RegisterAnimationSequence("WZSetup", var_6_64)

	local function var_6_65()
		var_6_8:AnimateSequence("WZSetup")
		var_6_18:AnimateSequence("WZSetup")
		var_6_26:AnimateSequence("WZSetup")
		var_6_28:AnimateSequence("WZSetup")
		var_6_30:AnimateSequence("WZSetup")
	end

	var_6_0._sequences.WZSetup = var_6_65

	var_0_5(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("CustomizationDetailPanel", CustomizationDetailPanel)
LockTable(_M)
