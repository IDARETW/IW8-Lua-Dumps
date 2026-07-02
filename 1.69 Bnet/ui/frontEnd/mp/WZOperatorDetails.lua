module(..., package.seeall)

local var_0_0 = "Faction"

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = "NONE"
	local var_1_1 = "RANDOM"
	local var_1_2 = "CDL"
	local var_1_3 = "ShowFaction"
	local var_1_4 = "HideFaction"
	local var_1_5 = arg_1_1.factionRef ~= "" and arg_1_1.factionRef or var_1_0

	if var_1_5 == OPERATOR.DEFAULT_FACTION then
		local var_1_6 = tonumber(OPERATOR.GetOperatorSuperFactionRef(arg_1_1.ref)) == OPERATOR.SuperFaction.WEST
		local var_1_7 = var_1_0

		if OPERATOR.IsMWOperator(arg_1_1.ref) then
			local var_1_8

			var_1_8 = var_1_6 and "WEST" or "EAST"
		end

		return var_1_4
	elseif var_1_5 == var_1_1 or var_1_5 == var_1_0 then
		return var_1_4
	elseif var_1_5 == var_1_2 then
		return var_0_0 .. var_1_5
	end

	local var_1_9 = OPERATOR.GetFactionIcon(arg_1_1.ref)

	if var_1_9 ~= nil and var_1_9 ~= "" then
		arg_1_0.FactionIcon:setImage(RegisterMaterial(var_1_9))

		return var_1_3
	else
		return var_1_4
	end
end

local function var_0_2(arg_2_0)
	local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_0:getLocalRect()
	local var_2_4 = var_2_2 - var_2_0
	local var_2_5 = var_2_4 * 0.5
	local var_2_6 = arg_2_0.NewItemNotification._backerWidth
	local var_2_7 = var_2_5 - arg_2_0._equippedWidth * 0.5
	local var_2_8 = var_2_5 - var_2_6 * 0.5

	if arg_2_0._isNew and arg_2_0._isEquipped then
		local var_2_9 = 20 * _1080p
		local var_2_10 = (var_2_4 - (var_2_6 + arg_2_0._equippedWidth + var_2_9)) * 0.5

		arg_2_0.NewItemNotification:SetLeft(var_2_10)
		arg_2_0.NewItemNotification:SetRight(var_2_10 + var_2_6)
		arg_2_0.EquippedWidget:SetLeft(var_2_10 + var_2_6 + var_2_9)
		arg_2_0.EquippedWidget:SetRight(var_2_10 + var_2_6 + arg_2_0._equippedWidth + var_2_9)
	else
		arg_2_0.NewItemNotification:SetLeft(var_2_8)
		arg_2_0.NewItemNotification:SetRight(var_2_8 * 2)
		arg_2_0.EquippedWidget:SetLeft(var_2_7)
		arg_2_0.EquippedWidget:SetRight(var_2_7 * 2)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {
		operatorFaction = OPERATOR.WZ_OPERATOR_INDEX
	}
	local var_3_1 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.OPERATOR, var_3_0)
	local var_3_2 = OPERATOR.SetIsOperatorSelected(arg_3_1, {
		operatorInfo = arg_3_2
	})

	if var_3_2 and not var_3_1 then
		ACTIONS.AnimateSequence(arg_3_0.EquippedWidget, "TurnOn")
	end

	arg_3_0._isEquipped = var_3_2

	arg_3_0.EquippedWidget:SetAlpha(var_3_2 and 1 or 0)
	var_0_2(arg_3_0)
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 and arg_4_1.isFavorite
	local var_4_1 = OPERATOR.GetOperatorGameSourceID(arg_4_0._operatorRef)

	ACTIONS.AnimateSequence(arg_4_0, var_4_0 and "SetFavorite" .. var_4_1 or "SetUnfavorited")
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	OPERATOR.CheckValidOperatorParams(arg_5_2)

	local var_5_0 = arg_5_2.operatorInfo

	arg_5_0._operatorRef = var_5_0.ref

	arg_5_0.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(var_5_0.name)))

	if math.floor(LAYOUT.GetElementHeight(arg_5_0.Name)) < math.floor(LAYOUT.GetTextHeightWithWrapping(arg_5_0.Name, ToUpperCase(Engine.CBBHFCGDIC(var_5_0.name)))) then
		ACTIONS.AnimateSequence(arg_5_0, "WrappedText")
	else
		ACTIONS.AnimateSequence(arg_5_0, "UnWrappedText")
	end

	if var_5_0.factionRef ~= OPERATOR.RANDOM_FACTION then
		local var_5_1 = OPERATOR.GetFactionName(var_5_0.ref)

		arg_5_0.FactionName:setText(ToUpperCase(Engine.CBBHFCGDIC(var_5_1)))
	end

	local var_5_2 = var_0_1(arg_5_0, var_5_0)
	local var_5_3 = OPERATOR.GetOperatorGameSourceID(arg_5_0._operatorRef)
	local var_5_4 = LUI.GetAnimForGameSource(var_5_3)

	if var_5_4 ~= nil then
		ACTIONS.AnimateSequence(arg_5_0, var_5_4)
	else
		ACTIONS.AnimateSequence(arg_5_0, "SetDefaultDisplay")
	end

	ACTIONS.AnimateSequence(arg_5_0, var_5_2)
	arg_5_0:SetFavoriteStatus({
		isFavorite = var_5_0.favorited
	})

	local var_5_5 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, var_5_0.ref)

	arg_5_0._isNew = arg_5_0.NewItemNotification:UpdateBreadcrumbByID(arg_5_1, var_5_5, true)
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetOperatorDetails = var_0_5
	arg_6_0.UpdateEquippedWidget = var_0_3
	arg_6_0.SetFavoriteStatus = var_0_4
	arg_6_0._equippedWidth = arg_6_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_6_0, "KORZHJP")
	end

	if not IsLanguageArabic() then
		arg_6_0.NewItemNotification:SetupLeftAlignment()
	end
end

function WZOperatorDetails(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 500 * _1080p)

	var_7_0.id = "WZOperatorDetails"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "FavoriteBacker"

	var_7_4:SetAlpha(0, 0)
	var_7_4:setImage(RegisterMaterial("favorite_backer"), 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 282, _1080p * 168, _1080p * 240)
	var_7_0:addElement(var_7_4)

	var_7_0.FavoriteBacker = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "FactionIcon"

	var_7_6:SetColorOpParam(0.03, 0)
	var_7_6:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 186, _1080p * 314, _1080p * -10, _1080p * 118)
	var_7_0:addElement(var_7_6)

	var_7_0.FactionIcon = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIStyledText.new()

	var_7_8.id = "FactionName"

	var_7_8:SetRGBFromTable(SWATCHES.CH2.WZGenericTabText, 0)
	var_7_8:setText("SHADOW COMPANY", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_8:SetWordWrap(false)
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 430, _1080p * 118, _1080p * 158)
	var_7_0:addElement(var_7_8)

	var_7_0.FactionName = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "Name"

	var_7_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_10:setText(ToUpperCase("GRAVES"), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_10:SetLeading(-15 * _1080p, 0)
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_10:SetDecodeUseSystemTime(false)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 492, _1080p * 169, _1080p * 239)
	var_7_0:addElement(var_7_10)

	var_7_0.Name = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "EquippedWidget"

	var_7_12:SetAlpha(0, 0)
	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 182, _1080p * 318, _1080p * 250, _1080p * 280)
	var_7_0:addElement(var_7_12)

	var_7_0.EquippedWidget = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "NewItemNotification"

	var_7_14:SetAlpha(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 211, _1080p * 289, _1080p * 250, _1080p * 280)
	var_7_0:addElement(var_7_14)

	var_7_0.NewItemNotification = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "BottomLine"

	var_7_16:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_16:SetAlpha(0.6, 0)
	var_7_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 239, _1080p * 240)
	var_7_0:addElement(var_7_16)

	var_7_0.BottomLine = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "TopLIne"

	var_7_18:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_18:SetAlpha(0.6, 0)
	var_7_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 168, _1080p * 169)
	var_7_0:addElement(var_7_18)

	var_7_0.TopLIne = var_7_18

	local function var_7_19()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_19

	local var_7_20
	local var_7_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 239
		}
	}

	var_7_10:RegisterAnimationSequence("KORZHJP", var_7_21)

	local var_7_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_7_12:RegisterAnimationSequence("KORZHJP", var_7_22)

	local function var_7_23()
		var_7_10:AnimateSequence("KORZHJP")
		var_7_12:AnimateSequence("KORZHJP")
	end

	var_7_0._sequences.KORZHJP = var_7_23

	local var_7_24
	local var_7_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_west_large")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("FactionRANDOM", var_7_25)

	local var_7_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("FactionRANDOM", var_7_26)

	local function var_7_27()
		var_7_6:AnimateSequence("FactionRANDOM")
		var_7_8:AnimateSequence("FactionRANDOM")
	end

	var_7_0._sequences.FactionRANDOM = var_7_27

	local var_7_28
	local var_7_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_east_large")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("FactionDEFAULT", var_7_29)

	local var_7_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("FactionDEFAULT", var_7_30)

	local function var_7_31()
		var_7_6:AnimateSequence("FactionDEFAULT")
		var_7_8:AnimateSequence("FactionDEFAULT")
	end

	var_7_0._sequences.FactionDEFAULT = var_7_31

	local var_7_32
	local var_7_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("FactionNONE", var_7_33)

	local var_7_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("FactionNONE", var_7_34)

	local function var_7_35()
		var_7_6:AnimateSequence("FactionNONE")
		var_7_8:AnimateSequence("FactionNONE")
	end

	var_7_0._sequences.FactionNONE = var_7_35

	local var_7_36
	local var_7_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_east_gray_large")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("FactionEAST", var_7_37)

	local var_7_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("FactionEAST", var_7_38)

	local function var_7_39()
		var_7_6:AnimateSequence("FactionEAST")
		var_7_8:AnimateSequence("FactionEAST")
	end

	var_7_0._sequences.FactionEAST = var_7_39

	local var_7_40
	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_west_gray_large")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("FactionWEST", var_7_41)

	local var_7_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("FactionWEST", var_7_42)

	local function var_7_43()
		var_7_6:AnimateSequence("FactionWEST")
		var_7_8:AnimateSequence("FactionWEST")
	end

	var_7_0._sequences.FactionWEST = var_7_43

	local var_7_44
	local var_7_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_nato_large")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("FactionCDL", var_7_45)

	local var_7_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("FactionCDL", var_7_46)

	local function var_7_47()
		var_7_6:AnimateSequence("FactionCDL")
		var_7_8:AnimateSequence("FactionCDL")
	end

	var_7_0._sequences.FactionCDL = var_7_47

	local var_7_48
	local var_7_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_7_10:RegisterAnimationSequence("MW", var_7_49)

	local function var_7_50()
		var_7_10:AnimateSequence("MW")
	end

	var_7_0._sequences.MW = var_7_50

	local var_7_51
	local var_7_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_7_10:RegisterAnimationSequence("CW", var_7_52)

	local function var_7_53()
		var_7_10:AnimateSequence("CW")
	end

	var_7_0._sequences.CW = var_7_53

	local var_7_54
	local var_7_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("SetDefaultDisplay", var_7_55)

	local var_7_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_7_10:RegisterAnimationSequence("SetDefaultDisplay", var_7_56)

	local function var_7_57()
		var_7_4:AnimateSequence("SetDefaultDisplay")
		var_7_10:AnimateSequence("SetDefaultDisplay")
	end

	var_7_0._sequences.SetDefaultDisplay = var_7_57

	local var_7_58
	local var_7_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite_backer")
		}
	}

	var_7_4:RegisterAnimationSequence("SetFavoriteiw8", var_7_59)

	local function var_7_60()
		var_7_4:AnimateSequence("SetFavoriteiw8")
	end

	var_7_0._sequences.SetFavoriteiw8 = var_7_60

	local var_7_61
	local var_7_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite_backer_cw")
		}
	}

	var_7_4:RegisterAnimationSequence("SetFavoritet9", var_7_62)

	local function var_7_63()
		var_7_4:AnimateSequence("SetFavoritet9")
	end

	var_7_0._sequences.SetFavoritet9 = var_7_63

	local var_7_64
	local var_7_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite_backer")
		}
	}

	var_7_4:RegisterAnimationSequence("SetUnfavorited", var_7_65)

	local function var_7_66()
		var_7_4:AnimateSequence("SetUnfavorited")
	end

	var_7_0._sequences.SetUnfavorited = var_7_66

	local var_7_67
	local var_7_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 185
		}
	}

	var_7_4:RegisterAnimationSequence("WrappedText", var_7_68)

	local var_7_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		}
	}

	var_7_6:RegisterAnimationSequence("WrappedText", var_7_69)

	local var_7_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 103
		}
	}

	var_7_8:RegisterAnimationSequence("WrappedText", var_7_70)

	local var_7_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 184
		}
	}

	var_7_10:RegisterAnimationSequence("WrappedText", var_7_71)

	local var_7_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_7_12:RegisterAnimationSequence("WrappedText", var_7_72)

	local var_7_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_7_14:RegisterAnimationSequence("WrappedText", var_7_73)

	local var_7_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 239
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 240
		}
	}

	var_7_16:RegisterAnimationSequence("WrappedText", var_7_74)

	local var_7_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_7_18:RegisterAnimationSequence("WrappedText", var_7_75)

	local function var_7_76()
		var_7_4:AnimateSequence("WrappedText")
		var_7_6:AnimateSequence("WrappedText")
		var_7_8:AnimateSequence("WrappedText")
		var_7_10:AnimateSequence("WrappedText")
		var_7_12:AnimateSequence("WrappedText")
		var_7_14:AnimateSequence("WrappedText")
		var_7_16:AnimateSequence("WrappedText")
		var_7_18:AnimateSequence("WrappedText")
	end

	var_7_0._sequences.WrappedText = var_7_76

	local var_7_77
	local var_7_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 240
		}
	}

	var_7_4:RegisterAnimationSequence("UnWrappedText", var_7_78)

	local var_7_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 118
		}
	}

	var_7_6:RegisterAnimationSequence("UnWrappedText", var_7_79)

	local var_7_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 158
		}
	}

	var_7_8:RegisterAnimationSequence("UnWrappedText", var_7_80)

	local var_7_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 239
		}
	}

	var_7_10:RegisterAnimationSequence("UnWrappedText", var_7_81)

	local var_7_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_7_12:RegisterAnimationSequence("UnWrappedText", var_7_82)

	local var_7_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		}
	}

	var_7_14:RegisterAnimationSequence("UnWrappedText", var_7_83)

	local var_7_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 239
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 240
		}
	}

	var_7_16:RegisterAnimationSequence("UnWrappedText", var_7_84)

	local var_7_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 169
		}
	}

	var_7_18:RegisterAnimationSequence("UnWrappedText", var_7_85)

	local function var_7_86()
		var_7_4:AnimateSequence("UnWrappedText")
		var_7_6:AnimateSequence("UnWrappedText")
		var_7_8:AnimateSequence("UnWrappedText")
		var_7_10:AnimateSequence("UnWrappedText")
		var_7_12:AnimateSequence("UnWrappedText")
		var_7_14:AnimateSequence("UnWrappedText")
		var_7_16:AnimateSequence("UnWrappedText")
		var_7_18:AnimateSequence("UnWrappedText")
	end

	var_7_0._sequences.UnWrappedText = var_7_86

	local var_7_87
	local var_7_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_7_10:RegisterAnimationSequence("VG", var_7_88)

	local function var_7_89()
		var_7_10:AnimateSequence("VG")
	end

	var_7_0._sequences.VG = var_7_89

	local var_7_90
	local var_7_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite_backer_vg")
		}
	}

	var_7_4:RegisterAnimationSequence("SetFavorites4", var_7_91)

	local function var_7_92()
		var_7_4:AnimateSequence("SetFavorites4")
	end

	var_7_0._sequences.SetFavorites4 = var_7_92

	local var_7_93
	local var_7_94 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ShowFaction", var_7_94)

	local var_7_95 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ShowFaction", var_7_95)

	local function var_7_96()
		var_7_6:AnimateSequence("ShowFaction")
		var_7_8:AnimateSequence("ShowFaction")
	end

	var_7_0._sequences.ShowFaction = var_7_96

	local var_7_97
	local var_7_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("HideFaction", var_7_98)

	local var_7_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("HideFaction", var_7_99)

	local function var_7_100()
		var_7_6:AnimateSequence("HideFaction")
		var_7_8:AnimateSequence("HideFaction")
	end

	var_7_0._sequences.HideFaction = var_7_100

	var_0_6(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("WZOperatorDetails", WZOperatorDetails)
LockTable(_M)
