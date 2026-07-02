module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.NewItemSmallIcon)
	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and 1 or 0, 0, true)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 ~= "" then
		arg_2_0._images[arg_2_1]:setImage(RegisterMaterial(arg_2_2))

		if arg_2_2 == WEAPON.emptyCustomizeSlotIcon then
			arg_2_0._isEmptyImages[arg_2_1] = true
		else
			arg_2_0._isEmptyImages[arg_2_1] = false
		end

		if arg_2_0._isEmptyImages[arg_2_1] then
			arg_2_0._images[arg_2_1]:SetRGBFromTable(CONDITIONS.IsWZWipFlowEnabled() and SWATCHES.CH2.WZGenericText or SWATCHES.genericButton.textDefault)
		end
	else
		arg_2_0._images[arg_2_1]:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Image1)
	ACTIONS.AnimateSequence(arg_3_0, "ShowSticker" .. tostring(arg_3_1))

	local var_3_0 = 316 + (LAYOUT.GetElementWidth(arg_3_0.Image1) / _1080p + 5) * (arg_3_1 - 1)

	arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_3_0 * _1080p, 0, 112 * _1080p)
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_1 = CONDITIONS.IsWZWipFlowEnabled() and SWATCHES.CH2.WZGenericText or arg_4_1

	for iter_4_0 = 1, #arg_4_0._images do
		if arg_4_0._isEmptyImages[imageIndex] then
			arg_4_0._images[imageIndex]:SetRGBFromTable(arg_4_1)
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Image1)
	assert(arg_5_0.Image2)
	assert(arg_5_0.Image3)
	assert(arg_5_0.Image4)

	arg_5_0.SetImageWithNum = var_0_1
	arg_5_0.SetAvailableImages = var_0_2
	arg_5_0.SetEmptySlotColor = var_0_3
	arg_5_0.UpdateBreadcrumb = var_0_0
	arg_5_0._images = {
		arg_5_0.Image1,
		arg_5_0.Image2,
		arg_5_0.Image3,
		arg_5_0.Image4
	}
	arg_5_0._isEmptyImages = {
		false,
		false,
		false,
		false
	}

	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		arg_5_0:SetEmptySlotColor(SWATCHES.genericButton.textFocus)
		ACTIONS.AnimateSequence(arg_6_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		arg_5_0:SetEmptySlotColor(SWATCHES.genericButton.textDefault)
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		arg_5_0:SetEmptySlotColor(SWATCHES.genericButton.textDefault)
		ACTIONS.AnimateSequence(arg_8_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"))
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		arg_5_0:SetEmptySlotColor(SWATCHES.genericButton.textDisabled)
		ACTIONS.AnimateSequence(arg_9_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)
	arg_5_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_10_0, "Locked")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end

	arg_5_0:SetEmptySlotColor(SWATCHES.genericButton.textDefault)
end

function StickerCustomizeButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_11_0.id = "StickerCustomizeButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "LoadoutItemButtonBackground"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.LoadoutItemButtonBackground = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Image1"

	var_11_6:setImage(RegisterMaterial("customization_empty_slot"), 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 194, _1080p * 286, _1080p * 10, _1080p * 102)
	var_11_0:addElement(var_11_6)

	var_11_0.Image1 = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Image2"

	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 291, _1080p * 383, _1080p * 10, _1080p * 102)
	var_11_0:addElement(var_11_8)

	var_11_0.Image2 = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "Image3"

	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 388, _1080p * 480, _1080p * 10, _1080p * 102)
	var_11_0:addElement(var_11_10)

	var_11_0.Image3 = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "Image4"

	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 485, _1080p * 577, _1080p * 10, _1080p * 102)
	var_11_0:addElement(var_11_12)

	var_11_0.Image4 = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "Lock"

	var_11_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_11_14:SetAlpha(0, 0)
	var_11_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_11_0:addElement(var_11_14)

	var_11_0.Lock = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIStyledText.new()

	var_11_16.id = "Description"

	var_11_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_16:SetAlpha(0, 0)
	var_11_16:setText("", 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_11_16:SetAlignment(LUI.Alignment.Left)
	var_11_16:SetShadowRGBFromInt(0, 0)
	var_11_16:SetOutlineRGBFromInt(0, 0)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 189, _1080p * 37, _1080p * 58)
	var_11_0:addElement(var_11_16)

	var_11_0.Description = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIStyledText.new()

	var_11_18.id = "Category"

	var_11_18:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_18:setText("WWWWWWWWWW", 0)
	var_11_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_18:SetAlignment(LUI.Alignment.Left)
	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 189, _1080p * 9, _1080p * 37)
	var_11_0:addElement(var_11_18)

	var_11_0.Category = var_11_18

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "NewItemSmallIcon"

	var_11_20:SetAlpha(0, 0)
	var_11_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_11_0:addElement(var_11_20)

	var_11_0.NewItemSmallIcon = var_11_20

	local function var_11_21()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_21

	local var_11_22
	local var_11_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOver", var_11_23)

	local var_11_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOver", var_11_24)

	local var_11_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOver", var_11_25)

	local function var_11_26()
		var_11_14:AnimateSequence("ButtonOver")
		var_11_16:AnimateSequence("ButtonOver")
		var_11_18:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_26

	local var_11_27
	local var_11_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonUp", var_11_28)

	local var_11_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUp", var_11_29)

	local var_11_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUp", var_11_30)

	local function var_11_31()
		var_11_14:AnimateSequence("ButtonUp")
		var_11_16:AnimateSequence("ButtonUp")
		var_11_18:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_31

	local var_11_32
	local var_11_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOverDisabled", var_11_33)

	local var_11_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOverDisabled", var_11_34)

	local var_11_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOverDisabled", var_11_35)

	local function var_11_36()
		var_11_14:AnimateSequence("ButtonOverDisabled")
		var_11_16:AnimateSequence("ButtonOverDisabled")
		var_11_18:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_36

	local var_11_37
	local var_11_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonUpDisabled", var_11_38)

	local var_11_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUpDisabled", var_11_39)

	local var_11_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUpDisabled", var_11_40)

	local function var_11_41()
		var_11_14:AnimateSequence("ButtonUpDisabled")
		var_11_16:AnimateSequence("ButtonUpDisabled")
		var_11_18:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_41

	local var_11_42
	local var_11_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Locked", var_11_43)

	local var_11_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Locked", var_11_44)

	local var_11_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Locked", var_11_45)

	local var_11_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Locked", var_11_46)

	local var_11_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Locked", var_11_47)

	local function var_11_48()
		var_11_6:AnimateSequence("Locked")
		var_11_8:AnimateSequence("Locked")
		var_11_10:AnimateSequence("Locked")
		var_11_12:AnimateSequence("Locked")
		var_11_14:AnimateSequence("Locked")
	end

	var_11_0._sequences.Locked = var_11_48

	local var_11_49
	local var_11_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ShowSticker1", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ShowSticker1", var_11_51)

	local var_11_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ShowSticker1", var_11_52)

	local var_11_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ShowSticker1", var_11_53)

	local function var_11_54()
		var_11_6:AnimateSequence("ShowSticker1")
		var_11_8:AnimateSequence("ShowSticker1")
		var_11_10:AnimateSequence("ShowSticker1")
		var_11_12:AnimateSequence("ShowSticker1")
	end

	var_11_0._sequences.ShowSticker1 = var_11_54

	local var_11_55
	local var_11_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ShowSticker2", var_11_56)

	local var_11_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ShowSticker2", var_11_57)

	local var_11_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ShowSticker2", var_11_58)

	local var_11_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ShowSticker2", var_11_59)

	local function var_11_60()
		var_11_6:AnimateSequence("ShowSticker2")
		var_11_8:AnimateSequence("ShowSticker2")
		var_11_10:AnimateSequence("ShowSticker2")
		var_11_12:AnimateSequence("ShowSticker2")
	end

	var_11_0._sequences.ShowSticker2 = var_11_60

	local var_11_61
	local var_11_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ShowSticker3", var_11_62)

	local var_11_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ShowSticker3", var_11_63)

	local var_11_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ShowSticker3", var_11_64)

	local var_11_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ShowSticker3", var_11_65)

	local function var_11_66()
		var_11_6:AnimateSequence("ShowSticker3")
		var_11_8:AnimateSequence("ShowSticker3")
		var_11_10:AnimateSequence("ShowSticker3")
		var_11_12:AnimateSequence("ShowSticker3")
	end

	var_11_0._sequences.ShowSticker3 = var_11_66

	local var_11_67
	local var_11_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ShowSticker4", var_11_68)

	local var_11_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ShowSticker4", var_11_69)

	local var_11_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ShowSticker4", var_11_70)

	local var_11_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ShowSticker4", var_11_71)

	local function var_11_72()
		var_11_6:AnimateSequence("ShowSticker4")
		var_11_8:AnimateSequence("ShowSticker4")
		var_11_10:AnimateSequence("ShowSticker4")
		var_11_12:AnimateSequence("ShowSticker4")
	end

	var_11_0._sequences.ShowSticker4 = var_11_72

	local var_11_73
	local var_11_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_11_14:RegisterAnimationSequence("WZWipSetup", var_11_74)

	local var_11_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("WZWipSetup", var_11_75)

	local function var_11_76()
		var_11_14:AnimateSequence("WZWipSetup")
		var_11_18:AnimateSequence("WZWipSetup")
	end

	var_11_0._sequences.WZWipSetup = var_11_76

	local var_11_77
	local var_11_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("WZWipButtonOver", var_11_78)

	local var_11_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonOver", var_11_79)

	local var_11_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("WZWipButtonOver", var_11_80)

	local function var_11_81()
		var_11_14:AnimateSequence("WZWipButtonOver")
		var_11_16:AnimateSequence("WZWipButtonOver")
		var_11_18:AnimateSequence("WZWipButtonOver")
	end

	var_11_0._sequences.WZWipButtonOver = var_11_81

	local var_11_82
	local var_11_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_83)

	local var_11_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_84)

	local var_11_85 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_85)

	local function var_11_86()
		var_11_14:AnimateSequence("WZWipButtonOverDisabled")
		var_11_16:AnimateSequence("WZWipButtonOverDisabled")
		var_11_18:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_11_0._sequences.WZWipButtonOverDisabled = var_11_86

	local var_11_87
	local var_11_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("WZWipButtonUp", var_11_88)

	local var_11_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonUp", var_11_89)

	local var_11_90 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("WZWipButtonUp", var_11_90)

	local function var_11_91()
		var_11_14:AnimateSequence("WZWipButtonUp")
		var_11_16:AnimateSequence("WZWipButtonUp")
		var_11_18:AnimateSequence("WZWipButtonUp")
	end

	var_11_0._sequences.WZWipButtonUp = var_11_91

	local var_11_92
	local var_11_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_93)

	local var_11_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_94)

	local var_11_95 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_95)

	local function var_11_96()
		var_11_14:AnimateSequence("WZWipButtonUpDisabled")
		var_11_16:AnimateSequence("WZWipButtonUpDisabled")
		var_11_18:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_11_0._sequences.WZWipButtonUpDisabled = var_11_96

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("StickerCustomizeButton", StickerCustomizeButton)
LockTable(_M)
