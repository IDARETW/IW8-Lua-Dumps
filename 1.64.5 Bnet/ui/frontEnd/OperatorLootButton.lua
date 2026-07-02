module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	assert(arg_1_1.ref)
	arg_1_0:SetButtonDisabled(not arg_1_1.isUnlocked)
	arg_1_0.LootName:setText(Engine.CBBHFCGDIC(arg_1_1.name))

	local var_1_0 = LOOT.GetItemQuality(arg_1_4, arg_1_1.ref)
	local var_1_1 = LOOT.GetRarityColor(var_1_0)

	if arg_1_1.bannerImage and #arg_1_1.bannerImage > 0 then
		arg_1_0.BannerImage:SetAlpha(1)
		arg_1_0.BannerImage:setImage(RegisterMaterial(arg_1_1.bannerImage))
		ACTIONS.AnimateSequence(arg_1_0, "MilSim")
	else
		arg_1_0.BannerImage:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
	end

	arg_1_0.QualityMarker:SetAlpha(var_1_0 == 0 and 0 or not arg_1_1.isUnlocked and 0.4 or 1)
	arg_1_0.QualityMarker:SetRGBFromTable(var_1_1)

	local var_1_2 = OPERATOR.GetEquippedItemForLootType(arg_1_2, arg_1_3, arg_1_4)

	assert(var_1_2)

	arg_1_0._lootData = arg_1_1
	arg_1_0._lootType = arg_1_4
	arg_1_0._lootID = LOOT.GetItemID(arg_1_4, arg_1_1.ref)
	arg_1_0.isNew = arg_1_0.NewItemNotification:UpdateBreadcrumbByID(arg_1_2, arg_1_0._lootID, true)

	local var_1_3 = RANDOM.IsEnabled(arg_1_2, arg_1_4, {
		operatorRef = arg_1_3
	})
	local var_1_4 = var_1_3 and arg_1_1.isRandom or not var_1_3 and arg_1_1.ref == var_1_2

	arg_1_0:SetSelected(var_1_4)
	arg_1_0.Lock:SetAlpha(arg_1_1.isUnlocked and 0 or 1)
end

local function var_0_1(arg_2_0)
	arg_2_0.NewItemNotification:ClearBreadcrumbByID(arg_2_0._controllerIndex, arg_2_0._lootID, true)
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Selected)
	ACTIONS.AnimateSequence(arg_3_0.Selected, arg_3_1 and "On" or "Off")

	if arg_3_1 then
		arg_3_0.NewItemNotification:UpdateAlpha(0, 0, true)
		arg_3_0:ClearNew()
	end

	arg_3_0.isSelected = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateLootButtonDetails = var_0_0
	arg_4_0.SetSelected = var_0_2
	arg_4_0.RefreshButtonColors = RefreshButtonColors
	arg_4_0.ClearNew = var_0_1
	arg_4_0._controllerIndex = arg_4_1

	local function var_4_0(arg_5_0, arg_5_1)
		arg_5_0:dispatchEventToRoot({
			name = "operator_loot_button_focused",
			child = arg_5_0
		})
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonOver")
	end

	local function var_4_1(arg_6_0, arg_6_1)
		arg_6_0:dispatchEventToRoot({
			name = "operator_loot_button_up",
			child = arg_6_0
		})
		WZWIP.AnimateThemeElement(arg_6_0, "ButtonUp")
	end

	local function var_4_2(arg_7_0, arg_7_1)
		arg_7_0:dispatchEventToRoot({
			name = "operator_loot_button_focused",
			child = arg_7_0
		})
		WZWIP.AnimateThemeElement(arg_7_0, "ButtonOverDisabled")
	end

	local function var_4_3(arg_8_0, arg_8_1)
		WZWIP.AnimateThemeElement(arg_8_0, "ButtonUpDisabled")
	end

	local function var_4_4(arg_9_0, arg_9_1)
		if arg_4_0._lootData and arg_4_0._lootData.isUnlocked then
			arg_9_0:dispatchEventToRoot({
				name = "operator_loot_button_action"
			})
		end
	end

	local function var_4_5(arg_10_0, arg_10_1)
		arg_10_0:dispatchEventToRoot({
			name = "operator_loot_button_focused",
			child = arg_10_0
		})
	end

	arg_4_0:addEventHandler("button_over", var_4_0)
	arg_4_0:addEventHandler("button_over_disable", var_4_2)
	arg_4_0:addEventHandler("button_up", var_4_1)
	arg_4_0:addEventHandler("button_disable", var_4_3)
	arg_4_0:addEventHandler("button_action", var_4_4)
	arg_4_0:addEventHandler("update_focused", var_4_5)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function OperatorLootButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 48 * _1080p)

	var_11_0.id = "OperatorLootButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "GenericButtonBackground"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.GenericButtonBackground = var_11_4

	local var_11_5
	local var_11_6 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_11_7 = LUI.UIBorder.new(var_11_6)

	var_11_7.id = "Border"

	var_11_7:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_7:SetAlpha(0, 0)
	var_11_7:SetBorderThicknessLeft(_1080p * 0, 0)
	var_11_7:SetBorderThicknessRight(_1080p * 0, 0)
	var_11_7:SetBorderThicknessBottom(_1080p * 0, 0)
	var_11_0:addElement(var_11_7)

	var_11_0.Border = var_11_7

	local var_11_8
	local var_11_9 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_11_1
	})

	var_11_9.id = "Selected"

	var_11_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -30, _1080p * -10, _1080p * -10, _1080p * 10)
	var_11_0:addElement(var_11_9)

	var_11_0.Selected = var_11_9

	local var_11_10
	local var_11_11 = LUI.UIImage.new()

	var_11_11.id = "BannerImage"

	var_11_11:SetAlpha(0, 0)
	var_11_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 288, _1080p * 422, _1080p * 8, _1080p * 40)
	var_11_0:addElement(var_11_11)

	var_11_0.BannerImage = var_11_11

	local var_11_12
	local var_11_13 = LUI.UIStyledText.new()

	var_11_13.id = "LootName"

	var_11_13:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_13:setText("Name", 0)
	var_11_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_13:SetAlignment(LUI.Alignment.Left)
	var_11_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_13:SetStartupDelay(2000)
	var_11_13:SetLineHoldTime(400)
	var_11_13:SetAnimMoveTime(2000)
	var_11_13:SetAnimMoveSpeed(150)
	var_11_13:SetEndDelay(2000)
	var_11_13:SetCrossfadeTime(250)
	var_11_13:SetFadeInTime(300)
	var_11_13:SetFadeOutTime(300)
	var_11_13:SetMaxVisibleLines(1)
	var_11_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -433, _1080p * -40, _1080p * 13, _1080p * 37)
	var_11_0:addElement(var_11_13)

	var_11_0.LootName = var_11_13

	local var_11_14
	local var_11_15 = LUI.UIImage.new()

	var_11_15.id = "Lock"

	var_11_15:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_11_15:SetAlpha(0, 0)
	var_11_15:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_15:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -29, _1080p * -9, _1080p * -10, _1080p * 10)
	var_11_0:addElement(var_11_15)

	var_11_0.Lock = var_11_15

	local var_11_16
	local var_11_17 = LUI.UIImage.new()

	var_11_17.id = "QualityMarker"

	var_11_17:SetPixelGridEnabled(true)
	var_11_17:SetPixelGridContrast(0.5, 0)
	var_11_17:SetPixelGridBlockWidth(2, 0)
	var_11_17:SetPixelGridBlockHeight(2, 0)
	var_11_17:SetPixelGridGutterWidth(1, 0)
	var_11_17:SetPixelGridGutterHeight(1, 0)
	var_11_17:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_11_0:addElement(var_11_17)

	var_11_0.QualityMarker = var_11_17

	local var_11_18

	if CONDITIONS.AlwaysFalse(var_11_0) then
		var_11_18 = LUI.UIImage.new()
		var_11_18.id = "RewardItem"

		var_11_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
		var_11_18:SetAlpha(0, 0)
		var_11_18:setImage(RegisterMaterial("placeholder_x"), 0)
		var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 406, _1080p * 446, _1080p * 4, _1080p * 44)
		var_11_0:addElement(var_11_18)

		var_11_0.RewardItem = var_11_18
	end

	local var_11_19

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		var_11_19 = LUI.UIImage.new()
		var_11_19.id = "CodPoints"

		var_11_19:SetAlpha(0, 0)
		var_11_19:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
		var_11_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 356, _1080p * 388, _1080p * 8, _1080p * 40)
		var_11_0:addElement(var_11_19)

		var_11_0.CodPoints = var_11_19
	end

	local var_11_20
	local var_11_21 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_21.id = "NewItemNotification"

	var_11_21:SetAlpha(0, 0)
	var_11_21:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -15, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_21)

	var_11_0.NewItemNotification = var_11_21

	local function var_11_22()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_22

	local var_11_23
	local var_11_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonOver", var_11_24)

	local var_11_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_11_9:RegisterAnimationSequence("ButtonOver", var_11_25)

	local var_11_26 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_13:RegisterAnimationSequence("ButtonOver", var_11_26)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("ButtonOver", var_11_27)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("ButtonOver", var_11_28)
	end

	local function var_11_29()
		var_11_7:AnimateSequence("ButtonOver")
		var_11_9:AnimateSequence("ButtonOver")
		var_11_13:AnimateSequence("ButtonOver")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("ButtonOver")
		end
	end

	var_11_0._sequences.ButtonOver = var_11_29

	local var_11_30
	local var_11_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonUp", var_11_31)

	local var_11_32 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_13:RegisterAnimationSequence("ButtonUp", var_11_32)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("ButtonUp", var_11_33)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("ButtonUp", var_11_34)
	end

	local function var_11_35()
		var_11_7:AnimateSequence("ButtonUp")
		var_11_13:AnimateSequence("ButtonUp")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("ButtonUp")
		end
	end

	var_11_0._sequences.ButtonUp = var_11_35

	local var_11_36
	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("Locked", var_11_37)

	local var_11_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("Locked", var_11_38)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("Locked", var_11_39)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("Locked", var_11_40)
	end

	local function var_11_41()
		var_11_9:AnimateSequence("Locked")
		var_11_15:AnimateSequence("Locked")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("Locked")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("Locked")
		end
	end

	var_11_0._sequences.Locked = var_11_41

	local var_11_42
	local var_11_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("Unlocked", var_11_43)

	local var_11_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("Unlocked", var_11_44)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("Unlocked", var_11_45)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_46 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("Unlocked", var_11_46)
	end

	local function var_11_47()
		var_11_9:AnimateSequence("Unlocked")
		var_11_15:AnimateSequence("Unlocked")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("Unlocked")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("Unlocked")
		end
	end

	var_11_0._sequences.Unlocked = var_11_47

	local var_11_48
	local var_11_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("Supply", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("Supply", var_11_50)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_51 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("Supply", var_11_51)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("Supply", var_11_52)
	end

	local function var_11_53()
		var_11_9:AnimateSequence("Supply")
		var_11_15:AnimateSequence("Supply")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("Supply")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("Supply")
		end
	end

	var_11_0._sequences.Supply = var_11_53

	local var_11_54
	local var_11_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("Purchase", var_11_55)

	local var_11_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("Purchase", var_11_56)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("Purchase", var_11_57)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_58 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("Purchase", var_11_58)
	end

	local function var_11_59()
		var_11_9:AnimateSequence("Purchase")
		var_11_15:AnimateSequence("Purchase")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("Purchase")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("Purchase")
		end
	end

	var_11_0._sequences.Purchase = var_11_59

	local var_11_60
	local var_11_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		}
	}

	var_11_9:RegisterAnimationSequence("AR", var_11_61)

	local var_11_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -433
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		}
	}

	var_11_13:RegisterAnimationSequence("AR", var_11_62)

	local var_11_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -452
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_11_15:RegisterAnimationSequence("AR", var_11_63)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_64 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 43
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 83
			}
		}

		var_11_18:RegisterAnimationSequence("AR", var_11_64)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_65 = {
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

		var_11_19:RegisterAnimationSequence("AR", var_11_65)
	end

	local var_11_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -406
		}
	}

	var_11_21:RegisterAnimationSequence("AR", var_11_66)

	local function var_11_67()
		var_11_9:AnimateSequence("AR")
		var_11_13:AnimateSequence("AR")
		var_11_15:AnimateSequence("AR")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("AR")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("AR")
		end

		var_11_21:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_67

	local var_11_68
	local var_11_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonOverDisabled", var_11_69)

	local var_11_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_11_9:RegisterAnimationSequence("ButtonOverDisabled", var_11_70)

	local var_11_71 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textOverDisabled
		}
	}

	var_11_13:RegisterAnimationSequence("ButtonOverDisabled", var_11_71)

	local var_11_72 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_17:RegisterAnimationSequence("ButtonOverDisabled", var_11_72)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_73 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("ButtonOverDisabled", var_11_73)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("ButtonOverDisabled", var_11_74)
	end

	local function var_11_75()
		var_11_7:AnimateSequence("ButtonOverDisabled")
		var_11_9:AnimateSequence("ButtonOverDisabled")
		var_11_13:AnimateSequence("ButtonOverDisabled")
		var_11_17:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_75

	local var_11_76
	local var_11_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonUpDisabled", var_11_77)

	local var_11_78 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_13:RegisterAnimationSequence("ButtonUpDisabled", var_11_78)

	local var_11_79 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_17:RegisterAnimationSequence("ButtonUpDisabled", var_11_79)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_80 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("ButtonUpDisabled", var_11_80)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_81 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("ButtonUpDisabled", var_11_81)
	end

	local function var_11_82()
		var_11_7:AnimateSequence("ButtonUpDisabled")
		var_11_13:AnimateSequence("ButtonUpDisabled")
		var_11_17:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_82

	local var_11_83
	local var_11_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -183
		}
	}

	var_11_13:RegisterAnimationSequence("MilSim", var_11_84)

	local function var_11_85()
		var_11_13:AnimateSequence("MilSim")
	end

	var_11_0._sequences.MilSim = var_11_85

	local var_11_86
	local var_11_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_11_0.GenericButtonBackground.TextGlow
		}
	}

	var_11_4:RegisterAnimationSequence("WZWipSetup", var_11_87)

	local var_11_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_11_7:RegisterAnimationSequence("WZWipSetup", var_11_88)

	local var_11_89 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35
		}
	}

	var_11_13:RegisterAnimationSequence("WZWipSetup", var_11_89)

	local function var_11_90()
		var_11_4:AnimateSequence("WZWipSetup")
		var_11_7:AnimateSequence("WZWipSetup")
		var_11_13:AnimateSequence("WZWipSetup")
	end

	var_11_0._sequences.WZWipSetup = var_11_90

	local var_11_91
	local var_11_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("WZWipButtonOver", var_11_92)

	local var_11_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_11_9:RegisterAnimationSequence("WZWipButtonOver", var_11_93)

	local var_11_94 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_13:RegisterAnimationSequence("WZWipButtonOver", var_11_94)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_95 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("WZWipButtonOver", var_11_95)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_96 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("WZWipButtonOver", var_11_96)
	end

	local function var_11_97()
		var_11_7:AnimateSequence("WZWipButtonOver")
		var_11_9:AnimateSequence("WZWipButtonOver")
		var_11_13:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("WZWipButtonOver")
		end
	end

	var_11_0._sequences.WZWipButtonOver = var_11_97

	local var_11_98
	local var_11_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_99)

	local var_11_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_11_9:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_100)

	local var_11_101 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_13:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_101)

	local var_11_102 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_17:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_102)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_103 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_103)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_104 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_104)
	end

	local function var_11_105()
		var_11_7:AnimateSequence("WZWipButtonOverDisabled")
		var_11_9:AnimateSequence("WZWipButtonOverDisabled")
		var_11_13:AnimateSequence("WZWipButtonOverDisabled")
		var_11_17:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_11_0._sequences.WZWipButtonOverDisabled = var_11_105

	local var_11_106
	local var_11_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("WZWipButtonUp", var_11_107)

	local var_11_108 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_13:RegisterAnimationSequence("WZWipButtonUp", var_11_108)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_109 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("WZWipButtonUp", var_11_109)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_110 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("WZWipButtonUp", var_11_110)
	end

	local function var_11_111()
		var_11_7:AnimateSequence("WZWipButtonUp")
		var_11_13:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("WZWipButtonUp")
		end
	end

	var_11_0._sequences.WZWipButtonUp = var_11_111

	local var_11_112
	local var_11_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_113)

	local var_11_114 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_13:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_114)

	local var_11_115 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_17:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_115)

	if CONDITIONS.AlwaysFalse(var_11_0) then
		local var_11_116 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_18:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_116)
	end

	if CONDITIONS.AreCODPointsEnabled(var_11_0) then
		local var_11_117 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_19:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_117)
	end

	local function var_11_118()
		var_11_7:AnimateSequence("WZWipButtonUpDisabled")
		var_11_13:AnimateSequence("WZWipButtonUpDisabled")
		var_11_17:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.AlwaysFalse(var_11_0) then
			var_11_18:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.AreCODPointsEnabled(var_11_0) then
			var_11_19:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_11_0._sequences.WZWipButtonUpDisabled = var_11_118

	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("OperatorLootButton", OperatorLootButton)
LockTable(_M)
