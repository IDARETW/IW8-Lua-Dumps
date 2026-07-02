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
	end

	arg_1_0.QualityMarker:SetAlpha(var_1_0 == 0 and 0 or not arg_1_1.isUnlocked and 0.4 or 1)
	arg_1_0.QualityMarker:SetRGBFromTable(var_1_1)

	local var_1_2 = OPERATOR.GetEquippedItemForLootType(arg_1_2, arg_1_3, arg_1_4)

	assert(var_1_2)

	arg_1_0._lootData = arg_1_1
	arg_1_0._lootType = arg_1_4
	arg_1_0._lootID = LOOT.GetItemID(arg_1_4, arg_1_1.ref)
	arg_1_0.isNew = arg_1_0.NewItemNotification:UpdateBreadcrumbByID(arg_1_2, arg_1_0._lootID, true)

	local var_1_3 = arg_1_1.ref == var_1_2

	arg_1_0:SetSelected(var_1_3)
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
	end

	local function var_4_1(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonUp")
		arg_6_0:dispatchEventToRoot({
			name = "operator_loot_button_up",
			child = arg_6_0
		})
	end

	local function var_4_2(arg_7_0, arg_7_1)
		arg_7_0:dispatchEventToRoot({
			name = "operator_loot_button_focused",
			child = arg_7_0
		})
	end

	local function var_4_3(arg_8_0, arg_8_1)
		if arg_4_0._lootData and arg_4_0._lootData.isUnlocked then
			arg_8_0:dispatchEventToRoot({
				name = "operator_loot_button_action"
			})
		end
	end

	local function var_4_4(arg_9_0, arg_9_1)
		arg_9_0:dispatchEventToRoot({
			name = "operator_loot_button_focused",
			child = arg_9_0
		})
	end

	arg_4_0:addEventHandler("button_over", var_4_0)
	arg_4_0:addEventHandler("button_over_disable", var_4_2)
	arg_4_0:addEventHandler("button_up", var_4_1)
	arg_4_0:addEventHandler("button_action", var_4_3)
	arg_4_0:addEventHandler("update_focused", var_4_4)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function OperatorLootButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 48 * _1080p)

	var_10_0.id = "OperatorLootButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "GenericButtonBackground"

	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.GenericButtonBackground = var_10_4

	local var_10_5
	local var_10_6 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_10_7 = LUI.UIBorder.new(var_10_6)

	var_10_7.id = "Border"

	var_10_7:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_10_7:SetAlpha(0, 0)
	var_10_7:SetBorderThicknessLeft(_1080p * 0, 0)
	var_10_7:SetBorderThicknessRight(_1080p * 0, 0)
	var_10_7:SetBorderThicknessBottom(_1080p * 0, 0)
	var_10_0:addElement(var_10_7)

	var_10_0.Border = var_10_7

	local var_10_8
	local var_10_9 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_10_1
	})

	var_10_9.id = "Selected"

	var_10_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -30, _1080p * -10, _1080p * -10, _1080p * 10)
	var_10_0:addElement(var_10_9)

	var_10_0.Selected = var_10_9

	local var_10_10
	local var_10_11 = LUI.UIImage.new()

	var_10_11.id = "BannerImage"

	var_10_11:SetAlpha(0, 0)
	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 288, _1080p * 422, _1080p * 8, _1080p * 40)
	var_10_0:addElement(var_10_11)

	var_10_0.BannerImage = var_10_11

	local var_10_12
	local var_10_13 = LUI.UIStyledText.new()

	var_10_13.id = "LootName"

	var_10_13:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_13:setText("Name", 0)
	var_10_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_13:SetAlignment(LUI.Alignment.Left)
	var_10_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_13:SetStartupDelay(2000)
	var_10_13:SetLineHoldTime(400)
	var_10_13:SetAnimMoveTime(2000)
	var_10_13:SetAnimMoveSpeed(150)
	var_10_13:SetEndDelay(2000)
	var_10_13:SetCrossfadeTime(250)
	var_10_13:SetFadeInTime(300)
	var_10_13:SetFadeOutTime(300)
	var_10_13:SetMaxVisibleLines(1)
	var_10_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 420, _1080p * 13, _1080p * 37)
	var_10_0:addElement(var_10_13)

	var_10_0.LootName = var_10_13

	local var_10_14
	local var_10_15 = LUI.UIImage.new()

	var_10_15.id = "Lock"

	var_10_15:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_15:SetAlpha(0, 0)
	var_10_15:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_15:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -29, _1080p * -9, _1080p * -10, _1080p * 10)
	var_10_0:addElement(var_10_15)

	var_10_0.Lock = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIImage.new()

	var_10_17.id = "QualityMarker"

	var_10_17:SetPixelGridEnabled(true)
	var_10_17:SetPixelGridContrast(0.5, 0)
	var_10_17:SetPixelGridBlockWidth(2, 0)
	var_10_17:SetPixelGridBlockHeight(2, 0)
	var_10_17:SetPixelGridGutterWidth(1, 0)
	var_10_17:SetPixelGridGutterHeight(1, 0)
	var_10_17:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_10_0:addElement(var_10_17)

	var_10_0.QualityMarker = var_10_17

	local var_10_18

	if CONDITIONS.AlwaysFalse(var_10_0) then
		var_10_18 = LUI.UIImage.new()
		var_10_18.id = "RewardItem"

		var_10_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
		var_10_18:SetAlpha(0, 0)
		var_10_18:setImage(RegisterMaterial("placeholder_x"), 0)
		var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 406, _1080p * 446, _1080p * 4, _1080p * 44)
		var_10_0:addElement(var_10_18)

		var_10_0.RewardItem = var_10_18
	end

	local var_10_19

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		var_10_19 = LUI.UIImage.new()
		var_10_19.id = "CodPoints"

		var_10_19:SetAlpha(0, 0)
		var_10_19:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
		var_10_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 356, _1080p * 388, _1080p * 8, _1080p * 40)
		var_10_0:addElement(var_10_19)

		var_10_0.CodPoints = var_10_19
	end

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "NewItemNotification"

	var_10_21:SetAlpha(0, 0)
	var_10_21:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -15, _1080p * -4, _1080p * 4)
	var_10_0:addElement(var_10_21)

	var_10_0.NewItemNotification = var_10_21

	local var_10_22

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("DefaultSequence", var_10_23)
	end

	local function var_10_24()
		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("DefaultSequence")
		end
	end

	var_10_0._sequences.DefaultSequence = var_10_24

	local var_10_25
	local var_10_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_7:RegisterAnimationSequence("ButtonOver", var_10_26)

	local var_10_27 = {
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

	var_10_9:RegisterAnimationSequence("ButtonOver", var_10_27)

	local var_10_28 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonOver", var_10_28)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("ButtonOver", var_10_29)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_30 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("ButtonOver", var_10_30)
	end

	local function var_10_31()
		var_10_7:AnimateSequence("ButtonOver")
		var_10_9:AnimateSequence("ButtonOver")
		var_10_13:AnimateSequence("ButtonOver")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("ButtonOver")
		end
	end

	var_10_0._sequences.ButtonOver = var_10_31

	local var_10_32
	local var_10_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_7:RegisterAnimationSequence("ButtonUp", var_10_33)

	local var_10_34 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonUp", var_10_34)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("ButtonUp", var_10_35)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("ButtonUp", var_10_36)
	end

	local function var_10_37()
		var_10_7:AnimateSequence("ButtonUp")
		var_10_13:AnimateSequence("ButtonUp")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("ButtonUp")
		end
	end

	var_10_0._sequences.ButtonUp = var_10_37

	local var_10_38
	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_9:RegisterAnimationSequence("Locked", var_10_39)

	local var_10_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("Locked", var_10_40)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_41 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("Locked", var_10_41)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_42 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("Locked", var_10_42)
	end

	local function var_10_43()
		var_10_9:AnimateSequence("Locked")
		var_10_15:AnimateSequence("Locked")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("Locked")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("Locked")
		end
	end

	var_10_0._sequences.Locked = var_10_43

	local var_10_44
	local var_10_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_9:RegisterAnimationSequence("Unlocked", var_10_45)

	local var_10_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("Unlocked", var_10_46)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_47 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("Unlocked", var_10_47)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("Unlocked", var_10_48)
	end

	local function var_10_49()
		var_10_9:AnimateSequence("Unlocked")
		var_10_15:AnimateSequence("Unlocked")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("Unlocked")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("Unlocked")
		end
	end

	var_10_0._sequences.Unlocked = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_9:RegisterAnimationSequence("Supply", var_10_51)

	local var_10_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("Supply", var_10_52)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_53 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("Supply", var_10_53)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("Supply", var_10_54)
	end

	local function var_10_55()
		var_10_9:AnimateSequence("Supply")
		var_10_15:AnimateSequence("Supply")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("Supply")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("Supply")
		end
	end

	var_10_0._sequences.Supply = var_10_55

	local var_10_56
	local var_10_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_9:RegisterAnimationSequence("Purchase", var_10_57)

	local var_10_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("Purchase", var_10_58)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_59 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("Purchase", var_10_59)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_60 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("Purchase", var_10_60)
	end

	local function var_10_61()
		var_10_9:AnimateSequence("Purchase")
		var_10_15:AnimateSequence("Purchase")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("Purchase")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("Purchase")
		end
	end

	var_10_0._sequences.Purchase = var_10_61

	local var_10_62
	local var_10_63 = {
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

	var_10_9:RegisterAnimationSequence("AR", var_10_63)

	local var_10_64 = {
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

	var_10_15:RegisterAnimationSequence("AR", var_10_64)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_65 = {
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

		var_10_18:RegisterAnimationSequence("AR", var_10_65)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_66 = {
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

		var_10_19:RegisterAnimationSequence("AR", var_10_66)
	end

	local var_10_67 = {
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

	var_10_21:RegisterAnimationSequence("AR", var_10_67)

	local function var_10_68()
		var_10_9:AnimateSequence("AR")
		var_10_15:AnimateSequence("AR")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("AR")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("AR")
		end

		var_10_21:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_68

	local var_10_69
	local var_10_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_7:RegisterAnimationSequence("ButtonOverDisabled", var_10_70)

	local var_10_71 = {
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

	var_10_9:RegisterAnimationSequence("ButtonOverDisabled", var_10_71)

	local var_10_72 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textOverDisabled
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonOverDisabled", var_10_72)

	local var_10_73 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonOverDisabled", var_10_73)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("ButtonOverDisabled", var_10_74)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_75 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("ButtonOverDisabled", var_10_75)
	end

	local function var_10_76()
		var_10_7:AnimateSequence("ButtonOverDisabled")
		var_10_9:AnimateSequence("ButtonOverDisabled")
		var_10_13:AnimateSequence("ButtonOverDisabled")
		var_10_17:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_76

	local var_10_77
	local var_10_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_7:RegisterAnimationSequence("ButtonUpDisabled", var_10_78)

	local var_10_79 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonUpDisabled", var_10_79)

	local var_10_80 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonUpDisabled", var_10_80)

	if CONDITIONS.AlwaysFalse(var_10_0) then
		local var_10_81 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_18:RegisterAnimationSequence("ButtonUpDisabled", var_10_81)
	end

	if CONDITIONS.AreCODPointsEnabled(var_10_0) then
		local var_10_82 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_19:RegisterAnimationSequence("ButtonUpDisabled", var_10_82)
	end

	local function var_10_83()
		var_10_7:AnimateSequence("ButtonUpDisabled")
		var_10_13:AnimateSequence("ButtonUpDisabled")
		var_10_17:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.AlwaysFalse(var_10_0) then
			var_10_18:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.AreCODPointsEnabled(var_10_0) then
			var_10_19:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_83

	local var_10_84
	local var_10_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 275
		}
	}

	var_10_13:RegisterAnimationSequence("MilSim", var_10_85)

	local function var_10_86()
		var_10_13:AnimateSequence("MilSim")
	end

	var_10_0._sequences.MilSim = var_10_86

	var_10_0:addEventHandler("button_over", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOver")
	end)
	var_10_0:addEventHandler("button_up", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUp")
	end)
	var_10_0:addEventHandler("button_over_disable", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOverDisabled")
	end)
	var_10_0:addEventHandler("button_disable", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUpDisabled")
	end)
	var_0_3(var_10_0, var_10_1, arg_10_1)
	ACTIONS.AnimateSequence(var_10_0, "DefaultSequence")

	return var_10_0
end

MenuBuilder.registerType("OperatorLootButton", OperatorLootButton)
LockTable(_M)
