module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	end
end

function PS4Layout(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_2_0.id = "PS4Layout"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3

	if CONDITIONS.IsPCOrPS4(var_2_0) then
		local var_2_4 = LUI.UIImage.new()

		var_2_4.id = "ControllerImage"

		var_2_4:setImage(RegisterMaterial("cont_ps4"), 0)
		var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 25, _1080p * 537)
		var_2_0:addElement(var_2_4)

		var_2_0.ControllerImage = var_2_4
	end

	local var_2_5

	if CONDITIONS.IsPCOrPS4(var_2_0) then
		local var_2_6 = LUI.UIImage.new()

		var_2_6.id = "Arrows"

		var_2_6:setImage(RegisterMaterial("cont_lines_btn_ps4"), 0)
		var_2_6:SetBlendMode(BLEND_MODE.addWithAlpha)
		var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -2, _1080p * 510, 0, _1080p * 512)
		var_2_0:addElement(var_2_6)

		var_2_0.Arrows = var_2_6
	end

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "LeftTrigger"

	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -228, _1080p * 98, _1080p * 51, _1080p * 71)

	local function var_2_9()
		local var_3_0 = var_2_0:GetDataSource().leftTriggerColor:GetValue(var_2_1)

		if var_3_0 ~= nil then
			var_2_8:SetRGBFromInt(var_3_0, 0)
		end
	end

	var_2_8:SubscribeToModelThroughElement(var_2_0, "leftTriggerColor", var_2_9)

	local function var_2_10()
		local var_4_0 = var_2_0:GetDataSource().leftTrigger:GetValue(var_2_1)

		if var_4_0 ~= nil then
			var_2_8:setText(var_4_0, 0)
		end
	end

	var_2_8:SubscribeToModelThroughElement(var_2_0, "leftTrigger", var_2_10)
	var_2_0:addElement(var_2_8)

	var_2_0.LeftTrigger = var_2_8

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "LeftShoulder"

	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Right)
	var_2_12:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -227, _1080p * 71, _1080p * 110, _1080p * 130)

	local function var_2_13()
		local var_5_0 = var_2_0:GetDataSource().leftShoulderColor:GetValue(var_2_1)

		if var_5_0 ~= nil then
			var_2_12:SetRGBFromInt(var_5_0, 0)
		end
	end

	var_2_12:SubscribeToModelThroughElement(var_2_0, "leftShoulderColor", var_2_13)

	local function var_2_14()
		local var_6_0 = var_2_0:GetDataSource().leftShoulder:GetValue(var_2_1)

		if var_6_0 ~= nil then
			var_2_12:setText(var_6_0, 0)
		end
	end

	var_2_12:SubscribeToModelThroughElement(var_2_0, "leftShoulder", var_2_14)
	var_2_0:addElement(var_2_12)

	var_2_0.LeftShoulder = var_2_12

	local var_2_15
	local var_2_16 = LUI.UIStyledText.new()

	var_2_16.id = "RightTrigger"

	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 416, _1080p * 732, _1080p * 52, _1080p * 72)

	local function var_2_17()
		local var_7_0 = var_2_0:GetDataSource().rightTriggerColor:GetValue(var_2_1)

		if var_7_0 ~= nil then
			var_2_16:SetRGBFromInt(var_7_0, 0)
		end
	end

	var_2_16:SubscribeToModelThroughElement(var_2_0, "rightTriggerColor", var_2_17)

	local function var_2_18()
		local var_8_0 = var_2_0:GetDataSource().rightTrigger:GetValue(var_2_1)

		if var_8_0 ~= nil then
			var_2_16:setText(var_8_0, 0)
		end
	end

	var_2_16:SubscribeToModelThroughElement(var_2_0, "rightTrigger", var_2_18)
	var_2_0:addElement(var_2_16)

	var_2_0.RightTrigger = var_2_16

	local var_2_19
	local var_2_20 = LUI.UIStyledText.new()

	var_2_20.id = "RightShoulder"

	var_2_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_20:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 442, _1080p * 731, _1080p * 110, _1080p * 130)

	local function var_2_21()
		local var_9_0 = var_2_0:GetDataSource().rightShoulderColor:GetValue(var_2_1)

		if var_9_0 ~= nil then
			var_2_20:SetRGBFromInt(var_9_0, 0)
		end
	end

	var_2_20:SubscribeToModelThroughElement(var_2_0, "rightShoulderColor", var_2_21)

	local function var_2_22()
		local var_10_0 = var_2_0:GetDataSource().rightShoulder:GetValue(var_2_1)

		if var_10_0 ~= nil then
			var_2_20:setText(var_10_0, 0)
		end
	end

	var_2_20:SubscribeToModelThroughElement(var_2_0, "rightShoulder", var_2_22)
	var_2_0:addElement(var_2_20)

	var_2_0.RightShoulder = var_2_20

	local var_2_23
	local var_2_24 = LUI.UIStyledText.new()

	var_2_24.id = "Start"

	var_2_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_24:SetAlignment(LUI.Alignment.Right)
	var_2_24:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 236, _1080p * 377, _1080p * 112, _1080p * 132)

	local function var_2_25()
		local var_11_0 = var_2_0:GetDataSource().startColor:GetValue(var_2_1)

		if var_11_0 ~= nil then
			var_2_24:SetRGBFromInt(var_11_0, 0)
		end
	end

	var_2_24:SubscribeToModelThroughElement(var_2_0, "startColor", var_2_25)

	local function var_2_26()
		local var_12_0 = var_2_0:GetDataSource().start:GetValue(var_2_1)

		if var_12_0 ~= nil then
			var_2_24:setText(var_12_0, 0)
		end
	end

	var_2_24:SubscribeToModelThroughElement(var_2_0, "start", var_2_26)
	var_2_0:addElement(var_2_24)

	var_2_0.Start = var_2_24

	local var_2_27
	local var_2_28 = LUI.UIStyledText.new()

	var_2_28.id = "Select"

	var_2_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_28:SetAlignment(LUI.Alignment.Center)
	var_2_28:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 123, _1080p * 328, _1080p * 63, _1080p * 83)

	local function var_2_29()
		local var_13_0 = var_2_0:GetDataSource().selectColor:GetValue(var_2_1)

		if var_13_0 ~= nil then
			var_2_28:SetRGBFromInt(var_13_0, 0)
		end
	end

	var_2_28:SubscribeToModelThroughElement(var_2_0, "selectColor", var_2_29)

	local function var_2_30()
		local var_14_0 = var_2_0:GetDataSource().select:GetValue(var_2_1)

		if var_14_0 ~= nil then
			var_2_28:setText(var_14_0, 0)
		end
	end

	var_2_28:SubscribeToModelThroughElement(var_2_0, "select", var_2_30)
	var_2_0:addElement(var_2_28)

	var_2_0.Select = var_2_28

	local var_2_31
	local var_2_32 = LUI.UIStyledText.new()

	var_2_32.id = "RightStick"

	var_2_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_32:SetAlignment(LUI.Alignment.Left)
	var_2_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 326, _1080p * 715, _1080p * 468, _1080p * 488)

	local function var_2_33()
		local var_15_0 = var_2_0:GetDataSource().rightStickColor:GetValue(var_2_1)

		if var_15_0 ~= nil then
			var_2_32:SetRGBFromInt(var_15_0, 0)
		end
	end

	var_2_32:SubscribeToModelThroughElement(var_2_0, "rightStickColor", var_2_33)

	local function var_2_34()
		local var_16_0 = var_2_0:GetDataSource().rightStick:GetValue(var_2_1)

		if var_16_0 ~= nil then
			var_2_32:setText(var_16_0, 0)
		end
	end

	var_2_32:SubscribeToModelThroughElement(var_2_0, "rightStick", var_2_34)
	var_2_0:addElement(var_2_32)

	var_2_0.RightStick = var_2_32

	local var_2_35
	local var_2_36 = LUI.UIStyledText.new()

	var_2_36.id = "LeftStick"

	var_2_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_36:SetAlignment(LUI.Alignment.Right)
	var_2_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -210, _1080p * 186, _1080p * 468, _1080p * 488)

	local function var_2_37()
		local var_17_0 = var_2_0:GetDataSource().leftStickColor:GetValue(var_2_1)

		if var_17_0 ~= nil then
			var_2_36:SetRGBFromInt(var_17_0, 0)
		end
	end

	var_2_36:SubscribeToModelThroughElement(var_2_0, "leftStickColor", var_2_37)

	local function var_2_38()
		local var_18_0 = var_2_0:GetDataSource().leftStick:GetValue(var_2_1)

		if var_18_0 ~= nil then
			var_2_36:setText(var_18_0, 0)
		end
	end

	var_2_36:SubscribeToModelThroughElement(var_2_0, "leftStick", var_2_38)
	var_2_0:addElement(var_2_36)

	var_2_0.LeftStick = var_2_36

	local var_2_39
	local var_2_40 = LUI.UIStyledText.new()

	var_2_40.id = "DPadLeft"

	var_2_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_40:SetAlignment(LUI.Alignment.Right)
	var_2_40:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -286, _1080p * -9, _1080p * 288, _1080p * 308)

	local function var_2_41()
		local var_19_0 = var_2_0:GetDataSource().dPadLeftColor:GetValue(var_2_1)

		if var_19_0 ~= nil then
			var_2_40:SetRGBFromInt(var_19_0, 0)
		end
	end

	var_2_40:SubscribeToModelThroughElement(var_2_0, "dPadLeftColor", var_2_41)

	local function var_2_42()
		local var_20_0 = var_2_0:GetDataSource().dPadLeft:GetValue(var_2_1)

		if var_20_0 ~= nil then
			var_2_40:setText(var_20_0, 0)
		end
	end

	var_2_40:SubscribeToModelThroughElement(var_2_0, "dPadLeft", var_2_42)
	var_2_0:addElement(var_2_40)

	var_2_0.DPadLeft = var_2_40

	local var_2_43
	local var_2_44 = LUI.UIStyledText.new()

	var_2_44.id = "DPadDown"

	var_2_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_44:SetAlignment(LUI.Alignment.Right)
	var_2_44:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -286, _1080p * -9, _1080p * 329, _1080p * 349)

	local function var_2_45()
		local var_21_0 = var_2_0:GetDataSource().dPadDownColor:GetValue(var_2_1)

		if var_21_0 ~= nil then
			var_2_44:SetRGBFromInt(var_21_0, 0)
		end
	end

	var_2_44:SubscribeToModelThroughElement(var_2_0, "dPadDownColor", var_2_45)

	local function var_2_46()
		local var_22_0 = var_2_0:GetDataSource().dPadDown:GetValue(var_2_1)

		if var_22_0 ~= nil then
			var_2_44:setText(var_22_0, 0)
		end
	end

	var_2_44:SubscribeToModelThroughElement(var_2_0, "dPadDown", var_2_46)
	var_2_0:addElement(var_2_44)

	var_2_0.DPadDown = var_2_44

	local var_2_47
	local var_2_48 = LUI.UIStyledText.new()

	var_2_48.id = "DPadRight"

	var_2_48:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_48:SetAlignment(LUI.Alignment.Right)
	var_2_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -210, _1080p * 142, _1080p * 435, _1080p * 455)

	local function var_2_49()
		local var_23_0 = var_2_0:GetDataSource().dPadRightColor:GetValue(var_2_1)

		if var_23_0 ~= nil then
			var_2_48:SetRGBFromInt(var_23_0, 0)
		end
	end

	var_2_48:SubscribeToModelThroughElement(var_2_0, "dPadRightColor", var_2_49)

	local function var_2_50()
		local var_24_0 = var_2_0:GetDataSource().dPadRight:GetValue(var_2_1)

		if var_24_0 ~= nil then
			var_2_48:setText(var_24_0, 0)
		end
	end

	var_2_48:SubscribeToModelThroughElement(var_2_0, "dPadRight", var_2_50)
	var_2_0:addElement(var_2_48)

	var_2_0.DPadRight = var_2_48

	local var_2_51
	local var_2_52 = LUI.UIStyledText.new()

	var_2_52.id = "DPadUp"

	var_2_52:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_52:SetAlignment(LUI.Alignment.Right)
	var_2_52:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -286, _1080p * -9, _1080p * 249, _1080p * 269)

	local function var_2_53()
		local var_25_0 = var_2_0:GetDataSource().dPadUpColor:GetValue(var_2_1)

		if var_25_0 ~= nil then
			var_2_52:SetRGBFromInt(var_25_0, 0)
		end
	end

	var_2_52:SubscribeToModelThroughElement(var_2_0, "dPadUpColor", var_2_53)

	local function var_2_54()
		local var_26_0 = var_2_0:GetDataSource().dPadUp:GetValue(var_2_1)

		if var_26_0 ~= nil then
			var_2_52:setText(var_26_0, 0)
		end
	end

	var_2_52:SubscribeToModelThroughElement(var_2_0, "dPadUp", var_2_54)
	var_2_0:addElement(var_2_52)

	var_2_0.DPadUp = var_2_52

	local var_2_55
	local var_2_56 = LUI.UIStyledText.new()

	var_2_56.id = "AltTwo"

	var_2_56:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_56:SetAlignment(LUI.Alignment.Left)
	var_2_56:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_56:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 517, _1080p * 800, _1080p * 262, _1080p * 282)

	local function var_2_57()
		local var_27_0 = var_2_0:GetDataSource().altTwoColor:GetValue(var_2_1)

		if var_27_0 ~= nil then
			var_2_56:SetRGBFromInt(var_27_0, 0)
		end
	end

	var_2_56:SubscribeToModelThroughElement(var_2_0, "altTwoColor", var_2_57)

	local function var_2_58()
		local var_28_0 = var_2_0:GetDataSource().altTwo:GetValue(var_2_1)

		if var_28_0 ~= nil then
			var_2_56:setText(var_28_0, 0)
		end
	end

	var_2_56:SubscribeToModelThroughElement(var_2_0, "altTwo", var_2_58)
	var_2_0:addElement(var_2_56)

	var_2_0.AltTwo = var_2_56

	local var_2_59
	local var_2_60 = LUI.UIStyledText.new()

	var_2_60.id = "Secondary"

	var_2_60:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_60:SetAlignment(LUI.Alignment.Left)
	var_2_60:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_60:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 517, _1080p * 800, _1080p * 298, _1080p * 318)

	local function var_2_61()
		local var_29_0 = var_2_0:GetDataSource().secondaryColor:GetValue(var_2_1)

		if var_29_0 ~= nil then
			var_2_60:SetRGBFromInt(var_29_0, 0)
		end
	end

	var_2_60:SubscribeToModelThroughElement(var_2_0, "secondaryColor", var_2_61)

	local function var_2_62()
		local var_30_0 = var_2_0:GetDataSource().secondary:GetValue(var_2_1)

		if var_30_0 ~= nil then
			var_2_60:setText(var_30_0, 0)
		end
	end

	var_2_60:SubscribeToModelThroughElement(var_2_0, "secondary", var_2_62)
	var_2_0:addElement(var_2_60)

	var_2_0.Secondary = var_2_60

	local var_2_63
	local var_2_64 = LUI.UIStyledText.new()

	var_2_64.id = "AltOne"

	var_2_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_64:SetAlignment(LUI.Alignment.Left)
	var_2_64:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_64:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 517, _1080p * 800, _1080p * 335, _1080p * 355)

	local function var_2_65()
		local var_31_0 = var_2_0:GetDataSource().altOneColor:GetValue(var_2_1)

		if var_31_0 ~= nil then
			var_2_64:SetRGBFromInt(var_31_0, 0)
		end
	end

	var_2_64:SubscribeToModelThroughElement(var_2_0, "altOneColor", var_2_65)

	local function var_2_66()
		local var_32_0 = var_2_0:GetDataSource().altOne:GetValue(var_2_1)

		if var_32_0 ~= nil then
			var_2_64:setText(var_32_0, 0)
		end
	end

	var_2_64:SubscribeToModelThroughElement(var_2_0, "altOne", var_2_66)
	var_2_0:addElement(var_2_64)

	var_2_0.AltOne = var_2_64

	local var_2_67
	local var_2_68 = LUI.UIStyledText.new()

	var_2_68.id = "Primary"

	var_2_68:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_68:SetAlignment(LUI.Alignment.Left)
	var_2_68:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_68:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 517, _1080p * 800, _1080p * 372, _1080p * 392)

	local function var_2_69()
		local var_33_0 = var_2_0:GetDataSource().primaryColor:GetValue(var_2_1)

		if var_33_0 ~= nil then
			var_2_68:SetRGBFromInt(var_33_0, 0)
		end
	end

	var_2_68:SubscribeToModelThroughElement(var_2_0, "primaryColor", var_2_69)

	local function var_2_70()
		local var_34_0 = var_2_0:GetDataSource().primary:GetValue(var_2_1)

		if var_34_0 ~= nil then
			var_2_68:setText(var_34_0, 0)
		end
	end

	var_2_68:SubscribeToModelThroughElement(var_2_0, "primary", var_2_70)
	var_2_0:addElement(var_2_68)

	var_2_0.Primary = var_2_68

	local function var_2_71()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_71

	local var_2_72
	local var_2_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_73)

	local var_2_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 115
		}
	}

	var_2_12:RegisterAnimationSequence("AR", var_2_74)

	local var_2_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 402
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 706
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_75)

	local var_2_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 115
		}
	}

	var_2_20:RegisterAnimationSequence("AR", var_2_76)

	local var_2_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 237
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		}
	}

	var_2_24:RegisterAnimationSequence("AR", var_2_77)

	local var_2_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 104
		}
	}

	var_2_28:RegisterAnimationSequence("AR", var_2_78)

	local var_2_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 467
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 503
		}
	}

	var_2_32:RegisterAnimationSequence("AR", var_2_79)

	local var_2_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 467
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 503
		}
	}

	var_2_36:RegisterAnimationSequence("AR", var_2_80)

	local var_2_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -12
		}
	}

	var_2_40:RegisterAnimationSequence("AR", var_2_81)

	local var_2_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 344
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 376
		}
	}

	var_2_44:RegisterAnimationSequence("AR", var_2_82)

	local var_2_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 435
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 471
		}
	}

	var_2_48:RegisterAnimationSequence("AR", var_2_83)

	local var_2_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 272
		}
	}

	var_2_52:RegisterAnimationSequence("AR", var_2_84)

	local var_2_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 262
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 298
		}
	}

	var_2_56:RegisterAnimationSequence("AR", var_2_85)

	local var_2_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 298
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 334
		}
	}

	var_2_60:RegisterAnimationSequence("AR", var_2_86)

	local var_2_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 371
		}
	}

	var_2_64:RegisterAnimationSequence("AR", var_2_87)

	local var_2_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 372
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 408
		}
	}

	var_2_68:RegisterAnimationSequence("AR", var_2_88)

	local function var_2_89()
		var_2_8:AnimateSequence("AR")
		var_2_12:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
		var_2_20:AnimateSequence("AR")
		var_2_24:AnimateSequence("AR")
		var_2_28:AnimateSequence("AR")
		var_2_32:AnimateSequence("AR")
		var_2_36:AnimateSequence("AR")
		var_2_40:AnimateSequence("AR")
		var_2_44:AnimateSequence("AR")
		var_2_48:AnimateSequence("AR")
		var_2_52:AnimateSequence("AR")
		var_2_56:AnimateSequence("AR")
		var_2_60:AnimateSequence("AR")
		var_2_64:AnimateSequence("AR")
		var_2_68:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_89

	local var_2_90
	local var_2_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 307
		}
	}

	var_2_40:RegisterAnimationSequence("JP", var_2_91)

	local var_2_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 348
		}
	}

	var_2_44:RegisterAnimationSequence("JP", var_2_92)

	local var_2_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 268
		}
	}

	var_2_52:RegisterAnimationSequence("JP", var_2_93)

	local function var_2_94()
		var_2_40:AnimateSequence("JP")
		var_2_44:AnimateSequence("JP")
		var_2_52:AnimateSequence("JP")
	end

	var_2_0._sequences.JP = var_2_94

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("PS4Layout", PS4Layout)
LockTable(_M)
