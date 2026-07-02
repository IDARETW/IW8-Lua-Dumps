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

	local var_2_0 = arg_2_2.rarity > 0

	arg_2_0.QualityMarker:SetAlpha(var_2_0 and 1 or 0)

	if var_2_0 then
		local var_2_1 = LOOT.GetRarityColor(arg_2_2.rarity)

		arg_2_0.QualityMarker:SetRGBFromTable(var_2_1)
	end

	arg_2_0.Selected:SetEquipped(arg_2_3)

	local var_2_2 = arg_2_2.isUnlocked or arg_2_2.unlockInfo and arg_2_2.unlockInfo.unlocked

	arg_2_0:SetButtonDisabled(not var_2_2)

	arg_2_0._lootType = arg_2_2.lootType
	arg_2_0._lootRef = arg_2_2.ref
	arg_2_0._lootID = LOOT.GetItemID(arg_2_0._lootType, arg_2_0._lootRef, {
		weaponRef = arg_2_2.weaponRef
	})

	arg_2_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_2_0._controllerIndex, arg_2_0._lootID)

	local function var_2_3()
		LUI.FlowManager.RequestAddMenu("WeaponPreview", true, controllerIndex, nil, {
			watchRef = arg_2_1._selectedWatch
		}, true)
		Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
	end

	if arg_2_0._lootRef ~= WATCH.WatchNoneValue and WATCH.IsPreviewEnabled(arg_2_0._lootRef) and not arg_2_2.isRandom then
		arg_2_0:SetupContextualMenu({
			title = arg_2_0.LootName:getText()
		})

		local var_2_4 = {
			id = "watchPreview",
			actionName = Engine.CBBHFCGDIC("CAS/PREVIEW_WATCH"),
			actionFunction = var_2_3
		}

		arg_2_0:AddContextualMenuAction(var_2_4)
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

		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOver")
	end)
	arg_4_0:registerEventHandler("button_over_disable", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewItem()
		end

		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOverDisabled")
	end)
	arg_4_0:registerEventHandler("button_action", function()
		if arg_4_0._menu then
			arg_4_0._menu:EquipItem()
		end
	end)
	arg_4_0:registerEventHandler("button_up", function()
		arg_4_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_4_1, arg_4_0._lootID)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")
	end)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_4_0, "WZSetup")
	end

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

	if CONDITIONS.AlwaysFalse() then
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

	if CONDITIONS.AlwaysFalse() then
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

	if CONDITIONS.AreCODPointsEnabled() then
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

	local var_9_17

	if CONDITIONS.IsMagmaGameMode() then
		var_9_17 = LUI.UIImage.new()
		var_9_17.id = "BotBorderWZ"

		var_9_17:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_9_17:SetAlpha(0.6, 0)
		var_9_17:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
		var_9_0:addElement(var_9_17)

		var_9_0.BotBorderWZ = var_9_17
	end

	local var_9_18

	if CONDITIONS.IsMagmaGameMode() then
		var_9_18 = LUI.UIImage.new()
		var_9_18.id = "TopBorderWZ"

		var_9_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_9_18:SetAlpha(0.6, 0)
		var_9_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_9_0:addElement(var_9_18)

		var_9_0.TopBorderWZ = var_9_18
	end

	local function var_9_19()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_19

	local var_9_20
	local var_9_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_21)

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_22 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("ButtonOver", var_9_22)
	end

	local function var_9_23()
		var_9_8:AnimateSequence("ButtonOver")

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("ButtonOver")
		end
	end

	var_9_0._sequences.ButtonOver = var_9_23

	local var_9_24
	local var_9_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_25)

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("ButtonUp", var_9_26)
	end

	local function var_9_27()
		var_9_8:AnimateSequence("ButtonUp")

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("ButtonUp")
		end
	end

	var_9_0._sequences.ButtonUp = var_9_27

	local var_9_28
	local var_9_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Locked", var_9_29)

	if CONDITIONS.AlwaysFalse() then
		local var_9_30 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Locked", var_9_30)
	end

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Locked", var_9_31)
	end

	local function var_9_32()
		var_9_6:AnimateSequence("Locked")

		if CONDITIONS.AlwaysFalse() then
			var_9_9:AnimateSequence("Locked")
		end

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("Locked")
		end
	end

	var_9_0._sequences.Locked = var_9_32

	local var_9_33
	local var_9_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Unlocked", var_9_34)

	if CONDITIONS.AlwaysFalse() then
		local var_9_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Unlocked", var_9_35)
	end

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Unlocked", var_9_36)
	end

	local function var_9_37()
		var_9_6:AnimateSequence("Unlocked")

		if CONDITIONS.AlwaysFalse() then
			var_9_9:AnimateSequence("Unlocked")
		end

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("Unlocked")
		end
	end

	var_9_0._sequences.Unlocked = var_9_37

	local var_9_38
	local var_9_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Supply", var_9_39)

	if CONDITIONS.AlwaysFalse() then
		local var_9_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Supply", var_9_40)
	end

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_41 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Supply", var_9_41)
	end

	local function var_9_42()
		var_9_6:AnimateSequence("Supply")

		if CONDITIONS.AlwaysFalse() then
			var_9_9:AnimateSequence("Supply")
		end

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("Supply")
		end
	end

	var_9_0._sequences.Supply = var_9_42

	local var_9_43
	local var_9_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Purchase", var_9_44)

	if CONDITIONS.AlwaysFalse() then
		local var_9_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("Purchase", var_9_45)
	end

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_46 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("Purchase", var_9_46)
	end

	local function var_9_47()
		var_9_6:AnimateSequence("Purchase")

		if CONDITIONS.AlwaysFalse() then
			var_9_9:AnimateSequence("Purchase")
		end

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("Purchase")
		end
	end

	var_9_0._sequences.Purchase = var_9_47

	local var_9_48
	local var_9_49 = {
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

	var_9_6:RegisterAnimationSequence("AR", var_9_49)

	if CONDITIONS.AlwaysFalse() then
		local var_9_50 = {
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

		var_9_9:RegisterAnimationSequence("AR", var_9_50)
	end

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_51 = {
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

		var_9_14:RegisterAnimationSequence("AR", var_9_51)
	end

	local var_9_52 = {
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

	var_9_16:RegisterAnimationSequence("AR", var_9_52)

	local function var_9_53()
		var_9_6:AnimateSequence("AR")

		if CONDITIONS.AlwaysFalse() then
			var_9_9:AnimateSequence("AR")
		end

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("AR")
		end

		var_9_16:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_53

	local var_9_54
	local var_9_55 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_9_8:RegisterAnimationSequence("WZSetup", var_9_55)

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_56 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_9_17:RegisterAnimationSequence("WZSetup", var_9_56)
	end

	local function var_9_57()
		var_9_8:AnimateSequence("WZSetup")

		if CONDITIONS.IsMagmaGameMode() then
			var_9_17:AnimateSequence("WZSetup")
		end
	end

	var_9_0._sequences.WZSetup = var_9_57

	local var_9_58
	local var_9_59 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonOver", var_9_59)

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_60 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_17:RegisterAnimationSequence("WZWipButtonOver", var_9_60)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_61 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_9_18:RegisterAnimationSequence("WZWipButtonOver", var_9_61)
	end

	local function var_9_62()
		var_9_8:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsMagmaGameMode() then
			var_9_17:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_9_18:AnimateSequence("WZWipButtonOver")
		end
	end

	var_9_0._sequences.WZWipButtonOver = var_9_62

	local var_9_63
	local var_9_64 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonUp", var_9_64)

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_65 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("WZWipButtonUp", var_9_65)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_66 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_9_17:RegisterAnimationSequence("WZWipButtonUp", var_9_66)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_67 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_9_18:RegisterAnimationSequence("WZWipButtonUp", var_9_67)
	end

	local function var_9_68()
		var_9_8:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_9_17:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_9_18:AnimateSequence("WZWipButtonUp")
		end
	end

	var_9_0._sequences.WZWipButtonUp = var_9_68

	local var_9_69
	local var_9_70 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOverDisabled", var_9_70)

	if CONDITIONS.AreCODPointsEnabled() then
		local var_9_71 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("ButtonOverDisabled", var_9_71)
	end

	local function var_9_72()
		var_9_8:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.AreCODPointsEnabled() then
			var_9_14:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_72

	local var_9_73
	local var_9_74 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_74)

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_75 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_17:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_75)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_9_76 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_18:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_76)
	end

	local function var_9_77()
		var_9_8:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsMagmaGameMode() then
			var_9_17:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_9_18:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_9_0._sequences.WZWipButtonOverDisabled = var_9_77

	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("WatchButton", WatchButton)
LockTable(_M)
