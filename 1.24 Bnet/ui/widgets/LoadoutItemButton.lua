module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	assert(arg_1_0.ItemName)
	assert(arg_1_0.Icon)

	local var_1_0 = Engine.CBBHFCGDIC(arg_1_4)
	local var_1_1 = LOOT.GetItemName(arg_1_3, arg_1_2)
	local var_1_2 = LOOT.GetItemImage(arg_1_3, arg_1_2)
	local var_1_3 = StringTable.BFHCAIIDA(CSV.MPEquipment.file) - 1

	arg_1_0.NewItemNotification:UpdateAlpha(0, 0, true)

	local var_1_4 = Loot.BCBAGDEJAJ(arg_1_1, LOOT.typeNames[arg_1_3])

	ACTIONS.AnimateSequence(arg_1_0, "RestrictionOff")

	if arg_1_4 == "LUA_MENU/RIG_LETHAL" then
		for iter_1_0 = 1, #var_1_4 do
			local var_1_5 = LOOT.GetItemRef(arg_1_3, var_1_4[iter_1_0])
			local var_1_6 = StringTable.BJJBBCJGEJ(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, var_1_5)
			local var_1_7 = CSV.ReadRow(CSV.MPEquipment, var_1_6)

			if var_1_7.uiSlot == "1" and var_1_7.uiOrder ~= "-1" then
				arg_1_0.NewItemNotification:UpdateAlpha(MatchRules.BAJDCAAGCG(arg_1_2) and 0 or 1, 0, true)

				break
			end
		end
	elseif arg_1_4 == "LUA_MENU/TITLE_TACTICAL" then
		for iter_1_1 = 1, #var_1_4 do
			local var_1_8 = LOOT.GetItemRef(arg_1_3, var_1_4[iter_1_1])
			local var_1_9 = StringTable.BJJBBCJGEJ(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, var_1_8)
			local var_1_10 = CSV.ReadRow(CSV.MPEquipment, var_1_9)

			if var_1_10.uiSlot == "2" and var_1_10.uiOrder ~= "-1" then
				arg_1_0.NewItemNotification:UpdateAlpha(MatchRules.BAJDCAAGCG(arg_1_2) and 0 or 1, 0, true)

				break
			end
		end
	end

	if MatchRules.BAJDCAAGCG(arg_1_2) then
		ACTIONS.AnimateSequence(arg_1_0, "RestrictionOn")
	end

	arg_1_0.ItemName:setText(var_1_1)
	arg_1_0.Icon:setImage(RegisterMaterial(var_1_2))
	arg_1_0.Title:setText(var_1_0)

	if arg_1_0.RarityColorBackground then
		if not Engine.DDJFBBJAIG() and CONDITIONS.IsBRGameType(arg_1_0) then
			local var_1_11 = BRLOOT.GetEquipmentLootRarityNumber(arg_1_2)

			if var_1_11 then
				arg_1_0.RarityColorBackground:ShowRarityColor(var_1_11)
			else
				arg_1_0.RarityColorBackground:ShowRarityColor(BRLOOT.itemRarities.COMMON)
			end
		else
			arg_1_0.RarityColorBackground:HideRarityColor()
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupButton = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function LoadoutItemButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 86 * _1080p)

	var_3_0.id = "LoadoutItemButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "ButtonDarkener"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.ButtonDarkener = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Background"

	var_3_8:SetAlpha(0.8, 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Background = var_3_8

	local var_3_9

	if CONDITIONS.IsMagmaGameMode(var_3_0) then
		local var_3_10 = MenuBuilder.BuildRegisteredType("BRRarityColorBackground", {
			controllerIndex = var_3_1
		})

		var_3_10.id = "RarityColorBackground"

		var_3_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_3_0:addElement(var_3_10)

		var_3_0.RarityColorBackground = var_3_10
	end

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Icon"

	var_3_12:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 99, _1080p * 165, _1080p * -33, _1080p * 33)
	var_3_0:addElement(var_3_12)

	var_3_0.Icon = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "ItemName"

	var_3_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_14:SetStartupDelay(1000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(150)
	var_3_14:SetAnimMoveSpeed(50)
	var_3_14:SetEndDelay(1000)
	var_3_14:SetCrossfadeTime(400)
	var_3_14:SetFadeInTime(300)
	var_3_14:SetFadeOutTime(300)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -134, _1080p * 40, _1080p * 62)
	var_3_0:addElement(var_3_14)

	var_3_0.ItemName = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "Title"

	var_3_16:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_16:SetAlpha(0.8, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 270, _1080p * 10, _1080p * 34)
	var_3_0:addElement(var_3_16)

	var_3_0.Title = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "NewItemNotification"

	var_3_18:SetAlpha(0, 0)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_3_0:addElement(var_3_18)

	var_3_0.NewItemNotification = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "RestrictionWarning"

	var_3_20:SetAlpha(0, 0)
	var_3_20:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -34, _1080p * -4, _1080p * 26, _1080p * 56)
	var_3_0:addElement(var_3_20)

	var_3_0.RestrictionWarning = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_23)

	local var_3_24 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonOver", var_3_24)

	local var_3_25 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonOver", var_3_25)

	local var_3_26 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonOver", var_3_26)

	local function var_3_27()
		var_3_8:AnimateSequence("ButtonOver")
		var_3_12:AnimateSequence("ButtonOver")
		var_3_14:AnimateSequence("ButtonOver")
		var_3_16:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_29)

	local var_3_30 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonUp", var_3_30)

	local var_3_31 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonUp", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonUp", var_3_32)

	local function var_3_33()
		var_3_8:AnimateSequence("ButtonUp")
		var_3_12:AnimateSequence("ButtonUp")
		var_3_14:AnimateSequence("ButtonUp")
		var_3_16:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_33

	local var_3_34
	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("LoadoutEdit", var_3_35)

	local var_3_36 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LoadoutEdit", var_3_36)

	local var_3_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("LoadoutEdit", var_3_37)

	local var_3_38 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_3_12:RegisterAnimationSequence("LoadoutEdit", var_3_38)

	local var_3_39 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_14:RegisterAnimationSequence("LoadoutEdit", var_3_39)

	local var_3_40 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_16:RegisterAnimationSequence("LoadoutEdit", var_3_40)

	local function var_3_41()
		var_3_4:AnimateSequence("LoadoutEdit")
		var_3_6:AnimateSequence("LoadoutEdit")
		var_3_8:AnimateSequence("LoadoutEdit")
		var_3_12:AnimateSequence("LoadoutEdit")
		var_3_14:AnimateSequence("LoadoutEdit")
		var_3_16:AnimateSequence("LoadoutEdit")
	end

	var_3_0._sequences.LoadoutEdit = var_3_41

	local var_3_42
	local var_3_43 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("LoadoutPreview", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LoadoutPreview", var_3_44)

	local var_3_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("LoadoutPreview", var_3_45)

	local var_3_46 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_3_12:RegisterAnimationSequence("LoadoutPreview", var_3_46)

	local var_3_47 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_14:RegisterAnimationSequence("LoadoutPreview", var_3_47)

	local var_3_48 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_3_16:RegisterAnimationSequence("LoadoutPreview", var_3_48)

	local function var_3_49()
		var_3_4:AnimateSequence("LoadoutPreview")
		var_3_6:AnimateSequence("LoadoutPreview")
		var_3_8:AnimateSequence("LoadoutPreview")
		var_3_12:AnimateSequence("LoadoutPreview")
		var_3_14:AnimateSequence("LoadoutPreview")
		var_3_16:AnimateSequence("LoadoutPreview")
	end

	var_3_0._sequences.LoadoutPreview = var_3_49

	local var_3_50
	local var_3_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -163
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -97
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_51)

	local var_3_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_52)

	local var_3_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_53)

	local function var_3_54()
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_54

	local var_3_55
	local var_3_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("RestrictionOn", var_3_56)

	local function var_3_57()
		var_3_20:AnimateSequence("RestrictionOn")
	end

	var_3_0._sequences.RestrictionOn = var_3_57

	local var_3_58
	local var_3_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("RestrictionOff", var_3_59)

	local function var_3_60()
		var_3_20:AnimateSequence("RestrictionOff")
	end

	var_3_0._sequences.RestrictionOff = var_3_60

	var_3_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LoadoutItemButton", LoadoutItemButton)
LockTable(_M)
