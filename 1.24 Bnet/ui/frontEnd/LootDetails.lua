module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = LOOT.GetTypeForID(arg_1_0)

	return var_1_0 == LOOT.itemTypes.WATCH or var_1_0 == LOOT.itemTypes.CHARM or var_1_0 == LOOT.itemTypes.STICKER or var_1_0 == LOOT.itemTypes.VEHICLE_CAMO
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_2_1.name)))
	arg_2_0.QualityWithText:UpdateQualityText(arg_2_1.rarity)
	arg_2_0.SeasonWithText:UpdateSeasonText(arg_2_1.season)
	arg_2_0.EquippedWidget:SetAlpha(arg_2_1.isSelected and 1 or 0)
	arg_2_0.NewItemNotification:SetAlpha(arg_2_1.isNew and 1 or 0)

	local var_2_0 = arg_2_1.season and arg_2_1.season > 0
	local var_2_1 = 110 * _1080p
	local var_2_2 = 8 * _1080p
	local var_2_3 = 4 * _1080p
	local var_2_4 = 16 * _1080p
	local var_2_5 = 0

	if arg_2_1.isSelected then
		var_2_5 = var_2_5 + LAYOUT.GetElementHeight(arg_2_0.EquippedWidget) + var_2_2

		if var_2_0 then
			var_2_5 = var_2_5 + LAYOUT.GetElementHeight(arg_2_0.SeasonWithText) + var_2_3

			ACTIONS.AnimateSequence(arg_2_0, "EquippedWithSeason")
		else
			ACTIONS.AnimateSequence(arg_2_0, "EquippedWithoutSeason")
		end
	elseif not arg_2_1.isSelected and not arg_2_1.isNew then
		if var_2_0 then
			var_2_5 = var_2_5 + LAYOUT.GetElementHeight(arg_2_0.SeasonWithText) + var_2_3

			ACTIONS.AnimateSequence(arg_2_0, "NotEquippedWithSeason")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NotEquippedWithoutSeason")
		end
	elseif arg_2_1.isNew then
		if var_2_0 then
			var_2_5 = var_2_5 + LAYOUT.GetElementHeight(arg_2_0.SeasonWithText) + var_2_3
			var_2_5 = var_2_5 + LAYOUT.GetElementHeight(arg_2_0.NewItemNotification) + var_2_3

			ACTIONS.AnimateSequence(arg_2_0, "NewWithSeason")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NewWithoutSeason")
		end
	end

	local var_2_6 = 0

	if arg_2_1.ref and arg_2_1.ref ~= "default" and var_0_0(arg_2_1.lootID) then
		local var_2_7
		local var_2_8 = LOOT.GetTypeForID(arg_2_1.lootID)
		local var_2_9

		if arg_2_1.flavorOverride and #arg_2_1.flavorOverride > 0 then
			var_2_9 = arg_2_1.flavorOverride
		else
			if var_2_8 == LOOT.itemTypes.VEHICLE_CAMO then
				var_2_7 = VEHICLE.GetFlavorText(arg_2_1.ref)
			else
				var_2_7 = ToUpperCase("STORE_FLAVOR/" .. arg_2_1.ref .. "_FLAVOR")
			end

			var_2_9 = Engine.CBBHFCGDIC(var_2_7)
		end

		if var_2_9 ~= var_2_7 then
			arg_2_0.FlavorText:SetAlpha(1)
			arg_2_0.FlavorText:setText(var_2_9)
		else
			arg_2_0.FlavorText:SetAlpha(0)
		end

		var_2_6 = var_2_6 + LAYOUT.GetTextHeightWithWrapping(arg_2_0.FlavorText, var_2_9) + var_2_4
	else
		arg_2_0.FlavorText:SetAlpha(0)
	end

	arg_2_0:SetBottom(arg_2_0._curDimensions.bottom + var_2_5, 200)
	arg_2_0.DoubleNotchedBacker:SetBottom(var_2_6, 200)

	local var_2_10 = LAYOUT.GetElementHeight(arg_2_0.PromptPreview)
	local var_2_11 = var_2_6 + var_2_2
	local var_2_12 = var_2_11 + var_2_10

	arg_2_0.PromptPreview:SetTop(var_2_11, 200)
	arg_2_0.PromptPreview:SetBottom(var_2_12, 200)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._curDimensions = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupDetails = var_0_1
	arg_4_0.InitializeDimensions = var_0_2
end

function LootDetails(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 110 * _1080p)

	var_5_0.id = "LootDetails"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0.75, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "Name"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_6:SetWordWrap(false)
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_6:SetStartupDelay(2000)
	var_5_6:SetLineHoldTime(400)
	var_5_6:SetAnimMoveTime(2000)
	var_5_6:SetAnimMoveSpeed(150)
	var_5_6:SetEndDelay(2000)
	var_5_6:SetCrossfadeTime(400)
	var_5_6:SetFadeInTime(300)
	var_5_6:SetFadeOutTime(300)
	var_5_6:SetMaxVisibleLines(1)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 32, _1080p * -32, _1080p * 9, _1080p * 59)
	var_5_0:addElement(var_5_6)

	var_5_0.Name = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "SeasonWithText"

	var_5_8:SetAlpha(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 194, _1080p * -3, _1080p * 29)
	var_5_0:addElement(var_5_8)

	var_5_0.SeasonWithText = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "QualityWithText"

	var_5_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 194, _1080p * -40, _1080p * -8)
	var_5_0:addElement(var_5_10)

	var_5_0.QualityWithText = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "EquippedWidget"

	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 170, _1080p * -76, _1080p * -46)
	var_5_0:addElement(var_5_12)

	var_5_0.EquippedWidget = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "NewItemNotification"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 112, _1080p * -76, _1080p * -46)
	var_5_0:addElement(var_5_14)

	var_5_0.NewItemNotification = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "FlavorText"

	var_5_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_16:SetAlpha(0, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 32, _1080p * 494, _1080p * 8, _1080p * 26)
	var_5_0:addElement(var_5_16)

	var_5_0.FlavorText = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "PromptPreview"

	var_5_18:SetAlpha(0, 0)
	var_5_18:setText(Engine.CBBHFCGDIC("CAS/WATCH_PREVIEW_PROMPT"), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 378, _1080p * 40, _1080p * 60)
	var_5_0:addElement(var_5_18)

	var_5_0.PromptPreview = var_5_18

	local function var_5_19()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_8:RegisterAnimationSequence("EquippedWithSeason", var_5_21)

	local var_5_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -44
		}
	}

	var_5_10:RegisterAnimationSequence("EquippedWithSeason", var_5_22)

	local var_5_23 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -113
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -83
		}
	}

	var_5_12:RegisterAnimationSequence("EquippedWithSeason", var_5_23)

	local var_5_24 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_5_16:RegisterAnimationSequence("EquippedWithSeason", var_5_24)

	local function var_5_25()
		var_5_8:AnimateSequence("EquippedWithSeason")
		var_5_10:AnimateSequence("EquippedWithSeason")
		var_5_12:AnimateSequence("EquippedWithSeason")
		var_5_16:AnimateSequence("EquippedWithSeason")
	end

	var_5_0._sequences.EquippedWithSeason = var_5_25

	local var_5_26
	local var_5_27 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_10:RegisterAnimationSequence("EquippedWithoutSeason", var_5_27)

	local var_5_28 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -77
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -47
		}
	}

	var_5_12:RegisterAnimationSequence("EquippedWithoutSeason", var_5_28)

	local var_5_29 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_5_16:RegisterAnimationSequence("EquippedWithoutSeason", var_5_29)

	local function var_5_30()
		var_5_10:AnimateSequence("EquippedWithoutSeason")
		var_5_12:AnimateSequence("EquippedWithoutSeason")
		var_5_16:AnimateSequence("EquippedWithoutSeason")
	end

	var_5_0._sequences.EquippedWithoutSeason = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		}
	}

	var_5_8:RegisterAnimationSequence("NewWithoutSeason", var_5_32)

	local var_5_33 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_10:RegisterAnimationSequence("NewWithoutSeason", var_5_33)

	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("NewWithoutSeason", var_5_34)

	local var_5_35 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -46
		}
	}

	var_5_14:RegisterAnimationSequence("NewWithoutSeason", var_5_35)

	local var_5_36 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_5_16:RegisterAnimationSequence("NewWithoutSeason", var_5_36)

	local function var_5_37()
		var_5_8:AnimateSequence("NewWithoutSeason")
		var_5_10:AnimateSequence("NewWithoutSeason")
		var_5_12:AnimateSequence("NewWithoutSeason")
		var_5_14:AnimateSequence("NewWithoutSeason")
		var_5_16:AnimateSequence("NewWithoutSeason")
	end

	var_5_0._sequences.NewWithoutSeason = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_8:RegisterAnimationSequence("NewWithSeason", var_5_39)

	local var_5_40 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -77
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_5_10:RegisterAnimationSequence("NewWithSeason", var_5_40)

	local var_5_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("NewWithSeason", var_5_41)

	local var_5_42 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -113
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -83
		}
	}

	var_5_14:RegisterAnimationSequence("NewWithSeason", var_5_42)

	local var_5_43 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_5_16:RegisterAnimationSequence("NewWithSeason", var_5_43)

	local function var_5_44()
		var_5_8:AnimateSequence("NewWithSeason")
		var_5_10:AnimateSequence("NewWithSeason")
		var_5_12:AnimateSequence("NewWithSeason")
		var_5_14:AnimateSequence("NewWithSeason")
		var_5_16:AnimateSequence("NewWithSeason")
	end

	var_5_0._sequences.NewWithSeason = var_5_44

	local var_5_45
	local var_5_46 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_8:RegisterAnimationSequence("NotEquippedWithoutSeason", var_5_46)

	local var_5_47 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_10:RegisterAnimationSequence("NotEquippedWithoutSeason", var_5_47)

	local var_5_48 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -77
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -47
		}
	}

	var_5_12:RegisterAnimationSequence("NotEquippedWithoutSeason", var_5_48)

	local function var_5_49()
		var_5_8:AnimateSequence("NotEquippedWithoutSeason")
		var_5_10:AnimateSequence("NotEquippedWithoutSeason")
		var_5_12:AnimateSequence("NotEquippedWithoutSeason")
	end

	var_5_0._sequences.NotEquippedWithoutSeason = var_5_49

	local var_5_50
	local var_5_51 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_5_8:RegisterAnimationSequence("NotEquippedWithSeason", var_5_51)

	local var_5_52 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -77
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_5_10:RegisterAnimationSequence("NotEquippedWithSeason", var_5_52)

	local var_5_53 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -77
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -47
		}
	}

	var_5_12:RegisterAnimationSequence("NotEquippedWithSeason", var_5_53)

	local function var_5_54()
		var_5_8:AnimateSequence("NotEquippedWithSeason")
		var_5_10:AnimateSequence("NotEquippedWithSeason")
		var_5_12:AnimateSequence("NotEquippedWithSeason")
	end

	var_5_0._sequences.NotEquippedWithSeason = var_5_54

	local var_5_55
	local var_5_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_5_18:RegisterAnimationSequence("WithFlavorText", var_5_56)

	local function var_5_57()
		var_5_18:AnimateSequence("WithFlavorText")
	end

	var_5_0._sequences.WithFlavorText = var_5_57

	local var_5_58
	local var_5_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		}
	}

	var_5_18:RegisterAnimationSequence("WithoutFlavorText", var_5_59)

	local function var_5_60()
		var_5_18:AnimateSequence("WithoutFlavorText")
	end

	var_5_0._sequences.WithoutFlavorText = var_5_60

	if CONDITIONS.IsArabic(var_5_0) then
		ACTIONS.AnimateSequence(var_5_0, "AR")
	end

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LootDetails", LootDetails)
LockTable(_M)
