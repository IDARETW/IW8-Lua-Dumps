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

	arg_2_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		if not arg_2_0._isInPreviewState then
			ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
		end
	end)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	THEMES.ApplyRandomMaskRotation(arg_2_0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function LoadoutItemButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 86 * _1080p)

	var_5_0.id = "LoadoutItemButton"
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

	var_5_4:SetAlpha(0, 0)
	var_5_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "ButtonDarkener"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.ButtonDarkener = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Background"

	var_5_8:SetAlpha(0.8, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.Background = var_5_8

	local var_5_9

	if CONDITIONS.IsMagmaGameMode() then
		local var_5_10 = MenuBuilder.BuildRegisteredType("BRRarityColorBackground", {
			controllerIndex = var_5_1
		})

		var_5_10.id = "RarityColorBackground"

		var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_5_0:addElement(var_5_10)

		var_5_0.RarityColorBackground = var_5_10
	end

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Icon"

	var_5_12:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 99, _1080p * 165, _1080p * -33, _1080p * 33)
	var_5_0:addElement(var_5_12)

	var_5_0.Icon = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "ItemName"

	var_5_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_14:SetStartupDelay(1000)
	var_5_14:SetLineHoldTime(400)
	var_5_14:SetAnimMoveTime(150)
	var_5_14:SetAnimMoveSpeed(50)
	var_5_14:SetEndDelay(1000)
	var_5_14:SetCrossfadeTime(400)
	var_5_14:SetFadeInTime(300)
	var_5_14:SetFadeOutTime(300)
	var_5_14:SetMaxVisibleLines(1)
	var_5_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -134, _1080p * 40, _1080p * 62)
	var_5_0:addElement(var_5_14)

	var_5_0.ItemName = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIText.new()

	var_5_16.id = "Title"

	var_5_16:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_16:SetAlpha(0.8, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 270, _1080p * 10, _1080p * 34)
	var_5_0:addElement(var_5_16)

	var_5_0.Title = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "NewItemNotification"

	var_5_18:SetAlpha(0, 0)
	var_5_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_5_0:addElement(var_5_18)

	var_5_0.NewItemNotification = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "RestrictionWarning"

	var_5_20:SetAlpha(0, 0)
	var_5_20:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -34, _1080p * -4, _1080p * 26, _1080p * 56)
	var_5_0:addElement(var_5_20)

	var_5_0.RestrictionWarning = var_5_20

	local var_5_21

	if CONDITIONS.IsVanguardRevealed() then
		var_5_21 = LUI.UIImage.new()
		var_5_21.id = "Mask"

		var_5_21:SetAlpha(0, 0)
		var_5_21:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_5_0:addElement(var_5_21)

		var_5_0.Mask = var_5_21
	end

	local function var_5_22()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_22

	local var_5_23
	local var_5_24 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_24)

	local var_5_25 = {
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

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_25)

	local var_5_26 = {
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

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_26)

	local var_5_27 = {
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

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_27)

	local function var_5_28()
		var_5_8:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_28

	local var_5_29
	local var_5_30 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_30)

	local var_5_31 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_31)

	local var_5_32 = {
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

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_32)

	local var_5_33 = {
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

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_33)

	local function var_5_34()
		var_5_8:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_34

	local var_5_35
	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LoadoutEdit", var_5_36)

	local var_5_37 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LoadoutEdit", var_5_37)

	local var_5_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LoadoutEdit", var_5_38)

	local var_5_39 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_5_12:RegisterAnimationSequence("LoadoutEdit", var_5_39)

	local var_5_40 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_14:RegisterAnimationSequence("LoadoutEdit", var_5_40)

	local var_5_41 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_16:RegisterAnimationSequence("LoadoutEdit", var_5_41)

	local function var_5_42()
		var_5_4:AnimateSequence("LoadoutEdit")
		var_5_6:AnimateSequence("LoadoutEdit")
		var_5_8:AnimateSequence("LoadoutEdit")
		var_5_12:AnimateSequence("LoadoutEdit")
		var_5_14:AnimateSequence("LoadoutEdit")
		var_5_16:AnimateSequence("LoadoutEdit")
	end

	var_5_0._sequences.LoadoutEdit = var_5_42

	local var_5_43
	local var_5_44 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LoadoutPreview", var_5_44)

	local var_5_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LoadoutPreview", var_5_45)

	local var_5_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LoadoutPreview", var_5_46)

	local var_5_47 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_5_12:RegisterAnimationSequence("LoadoutPreview", var_5_47)

	local var_5_48 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_14:RegisterAnimationSequence("LoadoutPreview", var_5_48)

	local var_5_49 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_16:RegisterAnimationSequence("LoadoutPreview", var_5_49)

	local function var_5_50()
		var_5_4:AnimateSequence("LoadoutPreview")
		var_5_6:AnimateSequence("LoadoutPreview")
		var_5_8:AnimateSequence("LoadoutPreview")
		var_5_12:AnimateSequence("LoadoutPreview")
		var_5_14:AnimateSequence("LoadoutPreview")
		var_5_16:AnimateSequence("LoadoutPreview")
	end

	var_5_0._sequences.LoadoutPreview = var_5_50

	local var_5_51
	local var_5_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("RestrictionOn", var_5_52)

	local function var_5_53()
		var_5_20:AnimateSequence("RestrictionOn")
	end

	var_5_0._sequences.RestrictionOn = var_5_53

	local var_5_54
	local var_5_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("RestrictionOff", var_5_55)

	local function var_5_56()
		var_5_20:AnimateSequence("RestrictionOff")
	end

	var_5_0._sequences.RestrictionOff = var_5_56

	local var_5_57
	local var_5_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipSetup", var_5_58)

	local var_5_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_59)

	local var_5_60 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipSetup", var_5_60)

	local var_5_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipSetup", var_5_61)

	local var_5_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipSetup", var_5_62)

	if CONDITIONS.IsVanguardRevealed() then
		local var_5_63 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_21:RegisterAnimationSequence("WZWipSetup", var_5_63)
	end

	local function var_5_64()
		var_5_4:AnimateSequence("WZWipSetup")
		var_5_6:AnimateSequence("WZWipSetup")
		var_5_8:AnimateSequence("WZWipSetup")
		var_5_14:AnimateSequence("WZWipSetup")
		var_5_16:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsVanguardRevealed() then
			var_5_21:AnimateSequence("WZWipSetup")
		end
	end

	var_5_0._sequences.WZWipSetup = var_5_64

	local var_5_65
	local var_5_66 = {
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

	var_5_12:RegisterAnimationSequence("WZWipButtonOver", var_5_66)

	local var_5_67 = {
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipButtonOver", var_5_67)

	local var_5_68 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipButtonOver", var_5_68)

	local function var_5_69()
		var_5_12:AnimateSequence("WZWipButtonOver")
		var_5_14:AnimateSequence("WZWipButtonOver")
		var_5_16:AnimateSequence("WZWipButtonOver")
	end

	var_5_0._sequences.WZWipButtonOver = var_5_69

	local var_5_70
	local var_5_71 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipButtonUp", var_5_71)

	local var_5_72 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipButtonUp", var_5_72)

	local var_5_73 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipButtonUp", var_5_73)

	local function var_5_74()
		var_5_12:AnimateSequence("WZWipButtonUp")
		var_5_14:AnimateSequence("WZWipButtonUp")
		var_5_16:AnimateSequence("WZWipButtonUp")
	end

	var_5_0._sequences.WZWipButtonUp = var_5_74

	local var_5_75
	local var_5_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_76)

	local var_5_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_77)

	local var_5_78 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_78)

	local var_5_79 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_79)

	local function var_5_80()
		var_5_4:AnimateSequence("WZWipLoadoutEdit")
		var_5_8:AnimateSequence("WZWipLoadoutEdit")
		var_5_12:AnimateSequence("WZWipLoadoutEdit")
		var_5_16:AnimateSequence("WZWipLoadoutEdit")
	end

	var_5_0._sequences.WZWipLoadoutEdit = var_5_80

	local var_5_81
	local var_5_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_82)

	local var_5_83 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_83)

	local var_5_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_84)

	local var_5_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_85)

	local var_5_86 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_86)

	local var_5_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_87)

	local function var_5_88()
		var_5_4:AnimateSequence("WZWipLoadoutPreview")
		var_5_6:AnimateSequence("WZWipLoadoutPreview")
		var_5_8:AnimateSequence("WZWipLoadoutPreview")
		var_5_12:AnimateSequence("WZWipLoadoutPreview")
		var_5_14:AnimateSequence("WZWipLoadoutPreview")
		var_5_16:AnimateSequence("WZWipLoadoutPreview")
	end

	var_5_0._sequences.WZWipLoadoutPreview = var_5_88

	local var_5_89
	local var_5_90 = {
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

	var_5_12:RegisterAnimationSequence("AR", var_5_90)

	local var_5_91 = {
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

	var_5_14:RegisterAnimationSequence("AR", var_5_91)

	local var_5_92 = {
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

	var_5_16:RegisterAnimationSequence("AR", var_5_92)

	local function var_5_93()
		var_5_12:AnimateSequence("AR")
		var_5_14:AnimateSequence("AR")
		var_5_16:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_93

	local var_5_94
	local var_5_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipRestrictionOn", var_5_95)

	local var_5_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipRestrictionOn", var_5_96)

	local function var_5_97()
		var_5_16:AnimateSequence("WZWipRestrictionOn")
		var_5_20:AnimateSequence("WZWipRestrictionOn")
	end

	var_5_0._sequences.WZWipRestrictionOn = var_5_97

	local var_5_98
	local var_5_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipRestrictionOff", var_5_99)

	local var_5_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipRestrictionOff", var_5_100)

	local function var_5_101()
		var_5_16:AnimateSequence("WZWipRestrictionOff")
		var_5_20:AnimateSequence("WZWipRestrictionOff")
	end

	var_5_0._sequences.WZWipRestrictionOff = var_5_101

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LoadoutItemButton", LoadoutItemButton)
LockTable(_M)
