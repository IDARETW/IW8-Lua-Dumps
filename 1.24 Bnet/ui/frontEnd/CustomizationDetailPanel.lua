module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = PlayercardUtils.GetFrontendDataSources(var_0_0, arg_1_1)

	arg_1_0.SmallPlayerCard:SetDataSource(var_1_0, arg_1_1)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = tonumber(arg_2_1.rarity)
	local var_2_1 = tonumber(arg_2_1.season)

	if var_2_0 then
		arg_2_0.QualityWithText:UpdateQualityText(var_2_0)
	end

	if var_2_1 then
		arg_2_0.SeasonWithText:UpdateSeasonText(var_2_1)
	end

	arg_2_0.PreviewImage:setImage(RegisterMaterial(arg_2_1.image))

	if arg_2_2 and not arg_2_0.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_2_0.EquippedWidget, "TurnOn")
	end

	arg_2_0.EquippedWidget:UpdateVisibility(arg_2_2)

	local var_2_2 = arg_2_3 and not LOOT.HideLootBreadcrumbsCondition()

	arg_2_0.NewItemPreviewNotification:SetAlpha(not arg_2_2 and var_2_2 and 1 or 0)

	if arg_2_2 then
		if var_2_1 and var_2_1 > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
			ACTIONS.AnimateSequence(arg_2_0, "EquippedWithSeason")
		else
			ACTIONS.AnimateSequence(arg_2_0, "EquippedWithoutSeason")
		end
	elseif var_2_1 and var_2_1 > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
		ACTIONS.AnimateSequence(arg_2_0, var_2_2 and "NewWithSeason" or "NotEquippedWithSeason")
	else
		ACTIONS.AnimateSequence(arg_2_0, var_2_2 and "NewWithoutSeason" or "NotEquippedWithoutSeason")
	end

	arg_2_0.CurrentName:setText(Engine.CBBHFCGDIC(arg_2_1.name))
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.EquippedWidget)

	arg_3_0.UpdatePanel = var_0_2
	arg_3_0.UpdatePlayerCardData = var_0_1
	arg_3_0._controllerIndex = arg_3_1

	arg_3_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	arg_3_0:UpdatePlayerCardData(arg_3_1)

	if not IsLanguageArabic() then
		arg_3_0.NewItemPreviewNotification:SetupLeftAlignment()
	end
end

function CustomizationDetailPanel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 555 * _1080p, 0, 638 * _1080p)

	var_4_0.id = "CustomizationDetailPanel"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "SelectedEmblemBG"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 555, 0, _1080p * 447)
	var_4_0:addElement(var_4_4)

	var_4_0.SelectedEmblemBG = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "CurrentEmblemBG"

	var_4_6:SetAlpha(0.5, 0)
	var_4_6.Background:SetRGBFromInt(1447446, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 555, _1080p * 466, _1080p * 638)
	var_4_0:addElement(var_4_6)

	var_4_0.CurrentEmblemBG = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "CurrentEquipTitle"

	var_4_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENTLY_EQUIPPED"), 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 466, _1080p * 513)
	var_4_0:addElement(var_4_8)

	var_4_0.CurrentEquipTitle = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "SeasonWithText"

	var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -528, _1080p * -368, _1080p * 394, _1080p * 426)
	var_4_0:addElement(var_4_10)

	var_4_0.SeasonWithText = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "QualityWithText"

	var_4_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -528, _1080p * -368, _1080p * 355, _1080p * 387)
	var_4_0:addElement(var_4_12)

	var_4_0.QualityWithText = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "EquippedWidget"

	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 163, _1080p * 311, _1080p * 341)
	var_4_0:addElement(var_4_14)

	var_4_0.EquippedWidget = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "SmallPlayerCard"

	var_4_16.GradientBacker:SetAlpha(0, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 537, _1080p * 494, _1080p * 618)
	var_4_0:addElement(var_4_16)

	var_4_0.SmallPlayerCard = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIText.new()

	var_4_18.id = "CurrentName"

	var_4_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_18:setText("", 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_18:SetWordWrap(false)
	var_4_18:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -528, _1080p * -18, _1080p * 10, _1080p * 46)
	var_4_0:addElement(var_4_18)

	var_4_0.CurrentName = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "PreviewImage"

	var_4_20:setImage(RegisterMaterial("ui_emblem_040"), 0)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 398, _1080p * 58, _1080p * 290)
	var_4_0:addElement(var_4_20)

	var_4_0.PreviewImage = var_4_20

	local var_4_21
	local var_4_22 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_4_1
	})

	var_4_22.id = "NewItemPreviewNotification"

	var_4_22:SetAlpha(0, 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 105, _1080p * 311, _1080p * 341)
	var_4_0:addElement(var_4_22)

	var_4_0.NewItemPreviewNotification = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 326
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_24)

	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 517
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_25)

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_4_8:RegisterAnimationSequence("DefaultSequence", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 358
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 390
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("DefaultSequence", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("DefaultSequence", var_4_28)

	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("DefaultSequence", var_4_29)

	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 373
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 497
		}
	}

	var_4_16:RegisterAnimationSequence("DefaultSequence", var_4_30)

	local function var_4_31()
		var_4_4:AnimateSequence("DefaultSequence")
		var_4_6:AnimateSequence("DefaultSequence")
		var_4_8:AnimateSequence("DefaultSequence")
		var_4_10:AnimateSequence("DefaultSequence")
		var_4_12:AnimateSequence("DefaultSequence")
		var_4_14:AnimateSequence("DefaultSequence")
		var_4_16:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 447
		}
	}

	var_4_4:RegisterAnimationSequence("EquippedWithSeason", var_4_33)

	local var_4_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 466
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 638
		}
	}

	var_4_6:RegisterAnimationSequence("EquippedWithSeason", var_4_34)

	local var_4_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 466
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 513
		}
	}

	var_4_8:RegisterAnimationSequence("EquippedWithSeason", var_4_35)

	local var_4_36 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 394
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 426
		}
	}

	var_4_10:RegisterAnimationSequence("EquippedWithSeason", var_4_36)

	local var_4_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 354
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 386
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("EquippedWithSeason", var_4_37)

	local var_4_38 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("EquippedWithSeason", var_4_38)

	local var_4_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 618
		}
	}

	var_4_16:RegisterAnimationSequence("EquippedWithSeason", var_4_39)

	local function var_4_40()
		var_4_4:AnimateSequence("EquippedWithSeason")
		var_4_6:AnimateSequence("EquippedWithSeason")
		var_4_8:AnimateSequence("EquippedWithSeason")
		var_4_10:AnimateSequence("EquippedWithSeason")
		var_4_12:AnimateSequence("EquippedWithSeason")
		var_4_14:AnimateSequence("EquippedWithSeason")
		var_4_16:AnimateSequence("EquippedWithSeason")
	end

	var_4_0._sequences.EquippedWithSeason = var_4_40

	local var_4_41
	local var_4_42 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 410
		}
	}

	var_4_4:RegisterAnimationSequence("EquippedWithoutSeason", var_4_42)

	local var_4_43 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 429
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 601
		}
	}

	var_4_6:RegisterAnimationSequence("EquippedWithoutSeason", var_4_43)

	local var_4_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 429
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 476
		}
	}

	var_4_8:RegisterAnimationSequence("EquippedWithoutSeason", var_4_44)

	local var_4_45 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		}
	}

	var_4_10:RegisterAnimationSequence("EquippedWithoutSeason", var_4_45)

	local var_4_46 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("EquippedWithoutSeason", var_4_46)

	local var_4_47 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("EquippedWithoutSeason", var_4_47)

	local var_4_48 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 457
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 581
		}
	}

	var_4_16:RegisterAnimationSequence("EquippedWithoutSeason", var_4_48)

	local function var_4_49()
		var_4_4:AnimateSequence("EquippedWithoutSeason")
		var_4_6:AnimateSequence("EquippedWithoutSeason")
		var_4_8:AnimateSequence("EquippedWithoutSeason")
		var_4_10:AnimateSequence("EquippedWithoutSeason")
		var_4_12:AnimateSequence("EquippedWithoutSeason")
		var_4_14:AnimateSequence("EquippedWithoutSeason")
		var_4_16:AnimateSequence("EquippedWithoutSeason")
	end

	var_4_0._sequences.EquippedWithoutSeason = var_4_49

	local var_4_50
	local var_4_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 401
		}
	}

	var_4_4:RegisterAnimationSequence("NotEquippedWithSeason", var_4_51)

	local var_4_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 420
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 592
		}
	}

	var_4_6:RegisterAnimationSequence("NotEquippedWithSeason", var_4_52)

	local var_4_53 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 420
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 467
		}
	}

	var_4_8:RegisterAnimationSequence("NotEquippedWithSeason", var_4_53)

	local var_4_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 350
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 382
		}
	}

	var_4_10:RegisterAnimationSequence("NotEquippedWithSeason", var_4_54)

	local var_4_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 311
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 343
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("NotEquippedWithSeason", var_4_55)

	local var_4_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("NotEquippedWithSeason", var_4_56)

	local var_4_57 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 448
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 572
		}
	}

	var_4_16:RegisterAnimationSequence("NotEquippedWithSeason", var_4_57)

	local function var_4_58()
		var_4_4:AnimateSequence("NotEquippedWithSeason")
		var_4_6:AnimateSequence("NotEquippedWithSeason")
		var_4_8:AnimateSequence("NotEquippedWithSeason")
		var_4_10:AnimateSequence("NotEquippedWithSeason")
		var_4_12:AnimateSequence("NotEquippedWithSeason")
		var_4_14:AnimateSequence("NotEquippedWithSeason")
		var_4_16:AnimateSequence("NotEquippedWithSeason")
	end

	var_4_0._sequences.NotEquippedWithSeason = var_4_58

	local var_4_59
	local var_4_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 364
		}
	}

	var_4_4:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_60)

	local var_4_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 383
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 555
		}
	}

	var_4_6:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_61)

	local var_4_62 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 383
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 430
		}
	}

	var_4_8:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_62)

	local var_4_63 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 311
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 343
		}
	}

	var_4_10:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_63)

	local var_4_64 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 311
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 343
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_64)

	local var_4_65 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_65)

	local var_4_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 411
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 535
		}
	}

	var_4_16:RegisterAnimationSequence("NotEquippedWithoutSeason", var_4_66)

	local function var_4_67()
		var_4_4:AnimateSequence("NotEquippedWithoutSeason")
		var_4_6:AnimateSequence("NotEquippedWithoutSeason")
		var_4_8:AnimateSequence("NotEquippedWithoutSeason")
		var_4_10:AnimateSequence("NotEquippedWithoutSeason")
		var_4_12:AnimateSequence("NotEquippedWithoutSeason")
		var_4_14:AnimateSequence("NotEquippedWithoutSeason")
		var_4_16:AnimateSequence("NotEquippedWithoutSeason")
	end

	var_4_0._sequences.NotEquippedWithoutSeason = var_4_67

	local var_4_68
	local var_4_69 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 362
		}
	}

	var_4_4:RegisterAnimationSequence("Equipped", var_4_69)

	local var_4_70 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 553
		}
	}

	var_4_6:RegisterAnimationSequence("Equipped", var_4_70)

	local var_4_71 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 428
		}
	}

	var_4_8:RegisterAnimationSequence("Equipped", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Equipped", var_4_72)

	local var_4_73 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Equipped", var_4_73)

	local var_4_74 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Equipped", var_4_74)

	local var_4_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 409
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 533
		}
	}

	var_4_16:RegisterAnimationSequence("Equipped", var_4_75)

	local function var_4_76()
		var_4_4:AnimateSequence("Equipped")
		var_4_6:AnimateSequence("Equipped")
		var_4_8:AnimateSequence("Equipped")
		var_4_10:AnimateSequence("Equipped")
		var_4_12:AnimateSequence("Equipped")
		var_4_14:AnimateSequence("Equipped")
		var_4_16:AnimateSequence("Equipped")
	end

	var_4_0._sequences.Equipped = var_4_76

	local var_4_77
	local var_4_78 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 326
		}
	}

	var_4_4:RegisterAnimationSequence("NotEquipped", var_4_78)

	local var_4_79 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 345
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 517
		}
	}

	var_4_6:RegisterAnimationSequence("NotEquipped", var_4_79)

	local var_4_80 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 345
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_4_8:RegisterAnimationSequence("NotEquipped", var_4_80)

	local var_4_81 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 358
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 390
		}
	}

	var_4_10:RegisterAnimationSequence("NotEquipped", var_4_81)

	local var_4_82 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("NotEquipped", var_4_82)

	local var_4_83 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("NotEquipped", var_4_83)

	local var_4_84 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 373
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 497
		}
	}

	var_4_16:RegisterAnimationSequence("NotEquipped", var_4_84)

	local function var_4_85()
		var_4_4:AnimateSequence("NotEquipped")
		var_4_6:AnimateSequence("NotEquipped")
		var_4_8:AnimateSequence("NotEquipped")
		var_4_10:AnimateSequence("NotEquipped")
		var_4_12:AnimateSequence("NotEquipped")
		var_4_14:AnimateSequence("NotEquipped")
		var_4_16:AnimateSequence("NotEquipped")
	end

	var_4_0._sequences.NotEquipped = var_4_85

	local var_4_86
	local var_4_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("DetailsHidden", var_4_87)

	local var_4_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("DetailsHidden", var_4_88)

	local var_4_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("DetailsHidden", var_4_89)

	local function var_4_90()
		var_4_6:AnimateSequence("DetailsHidden")
		var_4_8:AnimateSequence("DetailsHidden")
		var_4_16:AnimateSequence("DetailsHidden")
	end

	var_4_0._sequences.DetailsHidden = var_4_90

	local var_4_91
	local var_4_92 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 362
		}
	}

	var_4_4:RegisterAnimationSequence("New", var_4_92)

	local var_4_93 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 553
		}
	}

	var_4_6:RegisterAnimationSequence("New", var_4_93)

	local var_4_94 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 428
		}
	}

	var_4_8:RegisterAnimationSequence("New", var_4_94)

	local var_4_95 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("New", var_4_95)

	local var_4_96 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("New", var_4_96)

	local var_4_97 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("New", var_4_97)

	local var_4_98 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 409
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 533
		}
	}

	var_4_16:RegisterAnimationSequence("New", var_4_98)

	local function var_4_99()
		var_4_4:AnimateSequence("New")
		var_4_6:AnimateSequence("New")
		var_4_8:AnimateSequence("New")
		var_4_10:AnimateSequence("New")
		var_4_12:AnimateSequence("New")
		var_4_14:AnimateSequence("New")
		var_4_16:AnimateSequence("New")
	end

	var_4_0._sequences.New = var_4_99

	local var_4_100
	local var_4_101 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 447
		}
	}

	var_4_4:RegisterAnimationSequence("NewWithSeason", var_4_101)

	local var_4_102 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 466
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 638
		}
	}

	var_4_6:RegisterAnimationSequence("NewWithSeason", var_4_102)

	local var_4_103 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 466
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 513
		}
	}

	var_4_8:RegisterAnimationSequence("NewWithSeason", var_4_103)

	local var_4_104 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 394
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 426
		}
	}

	var_4_10:RegisterAnimationSequence("NewWithSeason", var_4_104)

	local var_4_105 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("NewWithSeason", var_4_105)

	local var_4_106 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 618
		}
	}

	var_4_16:RegisterAnimationSequence("NewWithSeason", var_4_106)

	local function var_4_107()
		var_4_4:AnimateSequence("NewWithSeason")
		var_4_6:AnimateSequence("NewWithSeason")
		var_4_8:AnimateSequence("NewWithSeason")
		var_4_10:AnimateSequence("NewWithSeason")
		var_4_12:AnimateSequence("NewWithSeason")
		var_4_16:AnimateSequence("NewWithSeason")
	end

	var_4_0._sequences.NewWithSeason = var_4_107

	local var_4_108
	local var_4_109 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 410
		}
	}

	var_4_4:RegisterAnimationSequence("NewWithoutSeason", var_4_109)

	local var_4_110 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 429
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 601
		}
	}

	var_4_6:RegisterAnimationSequence("NewWithoutSeason", var_4_110)

	local var_4_111 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 429
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 476
		}
	}

	var_4_8:RegisterAnimationSequence("NewWithoutSeason", var_4_111)

	local var_4_112 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		}
	}

	var_4_10:RegisterAnimationSequence("NewWithoutSeason", var_4_112)

	local var_4_113 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("NewWithoutSeason", var_4_113)

	local var_4_114 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 457
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 581
		}
	}

	var_4_16:RegisterAnimationSequence("NewWithoutSeason", var_4_114)

	local function var_4_115()
		var_4_4:AnimateSequence("NewWithoutSeason")
		var_4_6:AnimateSequence("NewWithoutSeason")
		var_4_8:AnimateSequence("NewWithoutSeason")
		var_4_10:AnimateSequence("NewWithoutSeason")
		var_4_12:AnimateSequence("NewWithoutSeason")
		var_4_16:AnimateSequence("NewWithoutSeason")
	end

	var_4_0._sequences.NewWithoutSeason = var_4_115

	local var_4_116
	local var_4_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HideCurrentEquipped", var_4_117)

	local var_4_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideCurrentEquipped", var_4_118)

	local var_4_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("HideCurrentEquipped", var_4_119)

	local function var_4_120()
		var_4_6:AnimateSequence("HideCurrentEquipped")
		var_4_8:AnimateSequence("HideCurrentEquipped")
		var_4_16:AnimateSequence("HideCurrentEquipped")
	end

	var_4_0._sequences.HideCurrentEquipped = var_4_120

	var_0_3(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("CustomizationDetailPanel", CustomizationDetailPanel)
LockTable(_M)
