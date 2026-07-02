module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.ItemType)
	assert(arg_1_0.ItemQuality)

	if arg_1_1.itemRef then
		local var_1_0 = VEHICLE.GetFlavorText(arg_1_1.itemRef)
		local var_1_1 = Engine.CBBHFCGDIC(var_1_0)

		arg_1_0.FlavorText:setText(var_1_1)
	end

	local var_1_2
	local var_1_3
	local var_1_4

	if not arg_1_1.isDefault then
		local var_1_5 = arg_1_1.storePreviewItemType
		local var_1_6 = LOOT.GetItemID(var_1_5, arg_1_1.itemRef)
		local var_1_7 = LOOT.GetItemClassName(var_1_5, arg_1_1.itemRef)

		if var_1_7 and #var_1_7 > 0 then
			arg_1_0.ItemType:setText(var_1_7)
		end

		var_1_4 = LOOT.GetItemQuality(var_1_5, arg_1_1.itemRef, var_1_6)
		var_1_2 = LOOT.GetItemName(var_1_5, arg_1_1.itemRef, var_1_6)

		local var_1_8 = CSV.MultiTableLookup(CSV.itemSourceTable.fileList, CSV.itemSourceTable.cols.marketPlaceID, var_1_6, CSV.itemSourceTable.cols.refType)

		if var_1_5 == LOOT.itemTypes.T9_MISC and LOOT.IsItemIDEquippableByWZ(var_1_6) and var_1_8 == "vehicleskin" then
			var_1_5 = LOOT.itemTypes.VEHICLE_CAMO
		end

		var_1_3 = LOOT.GetItemImage(var_1_5, arg_1_1.itemRef, var_1_6)
	else
		var_1_4 = arg_1_1.rarity
		var_1_2 = Engine.CBBHFCGDIC(arg_1_1.name)
		var_1_3 = arg_1_1.showcaseImage
	end

	arg_1_0.ItemQuality:UpdateQualityText(var_1_4)
	arg_1_0.MenuTitle:SetAlpha(1)
	arg_1_0.MenuTitle:SetTitle(var_1_2)
	arg_1_0.ImageMain:setImage(RegisterMaterial(var_1_3))

	if arg_1_1.isStorePreview then
		ACTIONS.AnimateSequence(arg_1_0, "FromStore")

		local var_1_9 = arg_1_1.storePreviewItemType
		local var_1_10 = LOOT.GetItemID(var_1_9, arg_1_1.itemRef)

		if Loot.DEBEIFJEEG(arg_1_0._controllerIndex, var_1_10) > 0 then
			local var_1_11 = LAYOUT.GetTextWidth(arg_1_0.MenuTitle.MenuTitle)
			local var_1_12 = LAYOUT.GetElementWidth(arg_1_0.CheckboxFrame)
			local var_1_13 = 100 * _1080p
			local var_1_14

			var_1_14 = var_1_9 == LOOT.itemTypes.WEAPON

			local var_1_15 = {
				arg_1_0.Checkbox,
				arg_1_0.CheckboxFrame
			}

			for iter_1_0 = 1, #var_1_15 do
				var_1_15[iter_1_0]:SetLeft(var_1_11 + var_1_13)
				var_1_15[iter_1_0]:SetRight(var_1_11 + var_1_13 + var_1_12)
				var_1_15[iter_1_0]:SetAlpha(1)
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.bindButton = LUI.UIBindButton.new()
	arg_2_0.bindButton.id = "selfBindButton"

	arg_2_0:addElement(arg_2_0.bindButton)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		ACTIONS.LeaveMenu(arg_2_0)
	end)

	if arg_2_2.isBattlePass then
		BATTLEPASS.AddPurchasePrompt(arg_2_0, arg_2_1)
	end

	local var_2_0 = arg_2_2.bundleData

	if arg_2_2.isStorePreview and arg_2_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_2_0.isBundlePurchased then
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE")
		})
		arg_2_0.bindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
			STORE.OpenQuickPurchasePopupInPreview(var_2_0)
		end)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	if not Engine.DDJFBBJAIG() then
		return
	end

	var_0_0(arg_5_0, arg_5_2)
	Engine.DHFCHIIJCA("loadout_showcase_preview")
	var_0_1(arg_5_0, arg_5_1, arg_5_2)
	ACTIONS.ScaleFullscreen(arg_5_0.BG)

	if arg_5_2.timerValue then
		arg_5_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_5_2.timerValue, true)
	else
		arg_5_0.LimitedTimeItem:SetAlpha(0)
	end
end

function VehiclePreview(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "VehiclePreview"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "BG"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.BG = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "ImageMain"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 448, _1080p * 1472, _1080p * 216, _1080p * 796)
	var_6_0:addElement(var_6_6)

	var_6_0.ImageMain = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "ItemQuality"

	var_6_8:SetAlpha(0, 0)
	var_6_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1824, _1080p * -1664, _1080p * 146, _1080p * 178)
	var_6_0:addElement(var_6_8)

	var_6_0.ItemQuality = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "ItemType"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 108, _1080p * 138)
	var_6_0:addElement(var_6_10)

	var_6_0.ItemType = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "MenuTitle"

	var_6_12:SetAlpha(0, 0)
	var_6_12.MenuTitle:setText("", 0)
	var_6_12.Line:SetLeft(0, 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_12)

	var_6_0.MenuTitle = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIStyledText.new()

	var_6_14.id = "FlavorText"

	var_6_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_14:SetAlpha(0, 0)
	var_6_14:setText("", 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Left)
	var_6_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_14:SetStartupDelay(2000)
	var_6_14:SetLineHoldTime(400)
	var_6_14:SetAnimMoveTime(2000)
	var_6_14:SetAnimMoveSpeed(150)
	var_6_14:SetEndDelay(2000)
	var_6_14:SetCrossfadeTime(250)
	var_6_14:SetFadeInTime(300)
	var_6_14:SetFadeOutTime(300)
	var_6_14:SetMaxVisibleLines(2)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 520, _1080p * 185, _1080p * 207)
	var_6_0:addElement(var_6_14)

	var_6_0.FlavorText = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "LimitedTimeItem"

	var_6_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 396, _1080p * -460, _1080p * -430)
	var_6_0:addElement(var_6_16)

	var_6_0.LimitedTimeItem = var_6_16

	local var_6_17
	local var_6_18 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_19 = LUI.UIBorder.new(var_6_18)

	var_6_19.id = "CheckboxFrame"

	var_6_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_6_19:SetAlpha(0, 0)
	var_6_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_6_0:addElement(var_6_19)

	var_6_0.CheckboxFrame = var_6_19

	local var_6_20
	local var_6_21 = LUI.UIImage.new()

	var_6_21.id = "Checkbox"

	var_6_21:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_6_21:SetAlpha(0, 0)
	var_6_21:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_6_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_6_0:addElement(var_6_21)

	var_6_0.Checkbox = var_6_21

	local function var_6_22()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 766
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 798
		}
	}

	var_6_8:RegisterAnimationSequence("FromStore", var_6_24)

	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 728
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 758
		}
	}

	var_6_10:RegisterAnimationSequence("FromStore", var_6_25)

	local var_6_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 620
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 720
		}
	}

	var_6_12:RegisterAnimationSequence("FromStore", var_6_26)

	local var_6_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 841
		}
	}

	var_6_14:RegisterAnimationSequence("FromStore", var_6_27)

	local function var_6_28()
		var_6_8:AnimateSequence("FromStore")
		var_6_10:AnimateSequence("FromStore")
		var_6_12:AnimateSequence("FromStore")
		var_6_14:AnimateSequence("FromStore")
	end

	var_6_0._sequences.FromStore = var_6_28

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_6_29 = LUI.UIBindButton.new()

	var_6_29.id = "ImageMainBindButton"

	var_6_6:addElement(var_6_29)

	var_6_6.bindButton = var_6_29

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("VehiclePreview", VehiclePreview)
LockTable(_M)
