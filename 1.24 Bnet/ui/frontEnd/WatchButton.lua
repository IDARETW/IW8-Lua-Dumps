module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		arg_1_0.LootName:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 420, _1080p * 3, _1080p * 44)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	if not arg_2_0._menu then
		arg_2_0._menu = arg_2_1
	end

	if arg_2_2.name and arg_2_2.name ~= "" then
		arg_2_0.LootName:setText(Engine.CBBHFCGDIC(arg_2_2.name))
	else
		arg_2_0.LootName:setText("ITEM HAS NO NAME")
	end

	arg_2_0.QualityMarker:SetAlpha(arg_2_2.rarity == 0 and 0 or 1)

	local var_2_0 = LOOT.GetRarityColor(arg_2_2.rarity)

	arg_2_0.QualityMarker:SetRGBFromTable(var_2_0)
	arg_2_0.Selected:SetEquipped(arg_2_3)

	local var_2_1 = arg_2_2.isUnlocked or arg_2_2.unlockInfo and arg_2_2.unlockInfo.unlocked

	arg_2_0:SetButtonDisabled(not var_2_1)

	arg_2_0._lootType = arg_2_2.lootType
	arg_2_0._lootRef = arg_2_2.ref
	arg_2_0._lootID = LOOT.GetItemID(arg_2_0._lootType, arg_2_0._lootRef, {
		weaponRef = arg_2_2.weaponRef
	})

	arg_2_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_2_0._controllerIndex, arg_2_0._lootID)

	local function var_2_2()
		LUI.FlowManager.RequestAddMenu("WeaponPreview", true, controllerIndex, nil, {
			watchRef = arg_2_1._selectedWatch
		}, true)
		Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
	end

	if arg_2_0._lootRef ~= WATCH.WatchNoneValue and WATCH.IsPreviewEnabled(arg_2_0._lootRef) then
		arg_2_0:SetupContextualMenu({
			title = arg_2_0.LootName:getText()
		})

		local var_2_3 = {
			id = "watchPreview",
			actionName = Engine.CBBHFCGDIC("CAS/PREVIEW_WATCH"),
			actionFunction = var_2_2
		}

		arg_2_0:AddContextualMenuAction(var_2_3)
	else
		arg_2_0:SetupContextualMenu()
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.RefreshButton = var_0_1
	arg_4_0._controllerIndex = arg_4_1

	arg_4_0:registerEventHandler("button_over", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewItem(arg_4_0._lootRef)
		end
	end)
	arg_4_0:registerEventHandler("button_over_disable", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewItem()
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
	end)
	arg_4_0:registerEventHandler("button_action", function()
		if arg_4_0._menu then
			arg_4_0._menu:EquipItem()
		end
	end)
	arg_4_0:registerEventHandler("button_up", function()
		arg_4_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_4_1, arg_4_0._lootID)
	end)
	var_0_0(arg_4_0)
end

function WatchButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 48 * _1080p)

	var_9_0.id = "WatchButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "GenericButtonBackground"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.GenericButtonBackground = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "Selected"

	var_9_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -7, _1080p * -8, _1080p * 8)
	var_9_0:addElement(var_9_6)

	var_9_0.Selected = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "LootName"

	var_9_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_8:setText("Name", 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 440, _1080p * 13, _1080p * 37)
	var_9_0:addElement(var_9_8)

	var_9_0.LootName = var_9_8

	local var_9_9

	if CONDITIONS.AlwaysFalse(var_9_0) then
		var_9_9 = LUI.UIImage.new()
		var_9_9.id = "Lock"

		var_9_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
		var_9_9:SetAlpha(0, 0)
		var_9_9:setImage(RegisterMaterial("icon_lock"), 0)
		var_9_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -25, _1080p * -5, _1080p * -10, _1080p * 10)
		var_9_0:addElement(var_9_9)

		var_9_0.Lock = var_9_9
	end

	local var_9_10
	local var_9_11 = LUI.UIImage.new()

	var_9_11.id = "QualityMarker"

	var_9_11:SetPixelGridEnabled(true)
	var_9_11:SetPixelGridContrast(0.5, 0)
	var_9_11:SetPixelGridBlockWidth(2, 0)
	var_9_11:SetPixelGridBlockHeight(2, 0)
	var_9_11:SetPixelGridGutterWidth(1, 0)
	var_9_11:SetPixelGridGutterHeight(1, 0)
	var_9_11:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_9_0:addElement(var_9_11)

	var_9_0.QualityMarker = var_9_11

	local var_9_12

	if CONDITIONS.AlwaysFalse(var_9_0) then
		local var_9_13 = LUI.UIImage.new()

		var_9_13.id = "RewardItem"

		var_9_13:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
		var_9_13:SetAlpha(0, 0)
		var_9_13:setImage(RegisterMaterial("placeholder_x"), 0)
		var_9_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 406, _1080p * 446, _1080p * 4, _1080p * 44)
		var_9_0:addElement(var_9_13)

		var_9_0.RewardItem = var_9_13
	end

	local var_9_14

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		var_9_14 = LUI.UIImage.new()
		var_9_14.id = "CodPoints"

		var_9_14:SetAlpha(0, 0)
		var_9_14:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
		var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 356, _1080p * 388, _1080p * 8, _1080p * 40)
		var_9_0:addElement(var_9_14)

		var_9_0.CodPoints = var_9_14
	end

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "NewItemSmallIcon"

	var_9_16:SetAlpha(0, 0)
	var_9_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -4, _1080p * 4)
	var_9_0:addElement(var_9_16)

	var_9_0.NewItemSmallIcon = var_9_16

	local function var_9_17()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_17

	local var_9_18
	local var_9_19 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_19)

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("ButtonOver", var_9_20)
	end

	local function var_9_21()
		var_9_8:AnimateSequence("ButtonOver")

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("ButtonOver")
		end
	end

	var_9_0._sequences.ButtonOver = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_23)

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_24 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("ButtonUp", var_9_24)
	end

	local function var_9_25()
		var_9_8:AnimateSequence("ButtonUp")

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("ButtonUp")
		end
	end

	var_9_0._sequences.ButtonUp = var_9_25

	local var_9_26
	local var_9_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Locked", var_9_27)

	if CONDITIONS.AlwaysFalse(var_9_0) then
		local var_9_28 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Locked", var_9_28)
	end

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Locked", var_9_29)
	end

	local function var_9_30()
		var_9_6:AnimateSequence("Locked")

		if CONDITIONS.AlwaysFalse(var_9_0) then
			var_9_9:AnimateSequence("Locked")
		end

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("Locked")
		end
	end

	var_9_0._sequences.Locked = var_9_30

	local var_9_31
	local var_9_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Unlocked", var_9_32)

	if CONDITIONS.AlwaysFalse(var_9_0) then
		local var_9_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Unlocked", var_9_33)
	end

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Unlocked", var_9_34)
	end

	local function var_9_35()
		var_9_6:AnimateSequence("Unlocked")

		if CONDITIONS.AlwaysFalse(var_9_0) then
			var_9_9:AnimateSequence("Unlocked")
		end

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("Unlocked")
		end
	end

	var_9_0._sequences.Unlocked = var_9_35

	local var_9_36
	local var_9_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Supply", var_9_37)

	if CONDITIONS.AlwaysFalse(var_9_0) then
		local var_9_38 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Supply", var_9_38)
	end

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Supply", var_9_39)
	end

	local function var_9_40()
		var_9_6:AnimateSequence("Supply")

		if CONDITIONS.AlwaysFalse(var_9_0) then
			var_9_9:AnimateSequence("Supply")
		end

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("Supply")
		end
	end

	var_9_0._sequences.Supply = var_9_40

	local var_9_41
	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Purchase", var_9_42)

	if CONDITIONS.AlwaysFalse(var_9_0) then
		local var_9_43 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Purchase", var_9_43)
	end

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_44 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Purchase", var_9_44)
	end

	local function var_9_45()
		var_9_6:AnimateSequence("Purchase")

		if CONDITIONS.AlwaysFalse(var_9_0) then
			var_9_9:AnimateSequence("Purchase")
		end

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("Purchase")
		end
	end

	var_9_0._sequences.Purchase = var_9_45

	local var_9_46
	local var_9_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -404
		}
	}

	var_9_6:RegisterAnimationSequence("AR", var_9_47)

	if CONDITIONS.AlwaysFalse(var_9_0) then
		local var_9_48 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -187
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -154
			}
		}

		var_9_9:RegisterAnimationSequence("AR", var_9_48)
	end

	if CONDITIONS.AreCODPointsEnabled(var_9_0) then
		local var_9_49 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 32
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 63
			}
		}

		var_9_14:RegisterAnimationSequence("AR", var_9_49)
	end

	local var_9_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -416
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -408
		}
	}

	var_9_16:RegisterAnimationSequence("AR", var_9_50)

	local function var_9_51()
		var_9_6:AnimateSequence("AR")

		if CONDITIONS.AlwaysFalse(var_9_0) then
			var_9_9:AnimateSequence("AR")
		end

		if CONDITIONS.AreCODPointsEnabled(var_9_0) then
			var_9_14:AnimateSequence("AR")
		end

		var_9_16:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_51

	var_9_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOver")
	end)
	var_9_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("WatchButton", WatchButton)
LockTable(_M)
