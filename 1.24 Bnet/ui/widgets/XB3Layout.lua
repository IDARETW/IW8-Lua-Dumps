module(..., package.seeall)

function XB3Layout(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_1_0.id = "XB3Layout"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		var_1_3 = LUI.UIImage.new()
		var_1_3.id = "ControllerImage"

		var_1_3:setImage(RegisterMaterial("cont"), 0)
		var_1_3:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -228, _1080p * 284)
		var_1_0:addElement(var_1_3)

		var_1_0.ControllerImage = var_1_3
	end

	local var_1_4

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		var_1_4 = LUI.UIImage.new()
		var_1_4.id = "Arrows"

		var_1_4:setImage(RegisterMaterial("cont_lines_btn"), 0)
		var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -246, _1080p * 234, _1080p * -250, _1080p * 250)
		var_1_0:addElement(var_1_4)

		var_1_0.Arrows = var_1_4
	end

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "LeftTrigger"

	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Right)
	var_1_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -187, _1080p * 113, _1080p * 43, _1080p * 63)

	local function var_1_7()
		local var_2_0 = var_1_0:GetDataSource().leftTriggerColor:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_6:SetRGBFromInt(var_2_0, 0)
		end
	end

	var_1_6:SubscribeToModelThroughElement(var_1_0, "leftTriggerColor", var_1_7)

	local function var_1_8()
		local var_3_0 = var_1_0:GetDataSource().leftTrigger:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_6:setText(var_3_0, 0)
		end
	end

	var_1_6:SubscribeToModelThroughElement(var_1_0, "leftTrigger", var_1_8)
	var_1_0:addElement(var_1_6)

	var_1_0.LeftTrigger = var_1_6

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "LeftShoulder"

	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Right)
	var_1_10:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -235, _1080p * 85, _1080p * 105, _1080p * 125)

	local function var_1_11()
		local var_4_0 = var_1_0:GetDataSource().leftShoulderColor:GetValue(var_1_1)

		if var_4_0 ~= nil then
			var_1_10:SetRGBFromInt(var_4_0, 0)
		end
	end

	var_1_10:SubscribeToModelThroughElement(var_1_0, "leftShoulderColor", var_1_11)

	local function var_1_12()
		local var_5_0 = var_1_0:GetDataSource().leftShoulder:GetValue(var_1_1)

		if var_5_0 ~= nil then
			var_1_10:setText(var_5_0, 0)
		end
	end

	var_1_10:SubscribeToModelThroughElement(var_1_0, "leftShoulder", var_1_12)
	var_1_0:addElement(var_1_10)

	var_1_0.LeftShoulder = var_1_10

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "RightTrigger"

	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 402, _1080p * 702, _1080p * 42, _1080p * 62)

	local function var_1_15()
		local var_6_0 = var_1_0:GetDataSource().rightTriggerColor:GetValue(var_1_1)

		if var_6_0 ~= nil then
			var_1_14:SetRGBFromInt(var_6_0, 0)
		end
	end

	var_1_14:SubscribeToModelThroughElement(var_1_0, "rightTriggerColor", var_1_15)

	local function var_1_16()
		local var_7_0 = var_1_0:GetDataSource().rightTrigger:GetValue(var_1_1)

		if var_7_0 ~= nil then
			var_1_14:setText(var_7_0, 0)
		end
	end

	var_1_14:SubscribeToModelThroughElement(var_1_0, "rightTrigger", var_1_16)
	var_1_0:addElement(var_1_14)

	var_1_0.RightTrigger = var_1_14

	local var_1_17
	local var_1_18 = LUI.UIText.new()

	var_1_18.id = "RightShoulder"

	var_1_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_18:SetAlignment(LUI.Alignment.Left)
	var_1_18:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 430, _1080p * 752, _1080p * 105, _1080p * 125)

	local function var_1_19()
		local var_8_0 = var_1_0:GetDataSource().rightShoulderColor:GetValue(var_1_1)

		if var_8_0 ~= nil then
			var_1_18:SetRGBFromInt(var_8_0, 0)
		end
	end

	var_1_18:SubscribeToModelThroughElement(var_1_0, "rightShoulderColor", var_1_19)

	local function var_1_20()
		local var_9_0 = var_1_0:GetDataSource().rightShoulder:GetValue(var_1_1)

		if var_9_0 ~= nil then
			var_1_18:setText(var_9_0, 0)
		end
	end

	var_1_18:SubscribeToModelThroughElement(var_1_0, "rightShoulder", var_1_20)
	var_1_0:addElement(var_1_18)

	var_1_0.RightShoulder = var_1_18

	local var_1_21
	local var_1_22 = LUI.UIText.new()

	var_1_22.id = "Start"

	var_1_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_22:SetAlignment(LUI.Alignment.Center)
	var_1_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 223, _1080p * 381, _1080p * 90, _1080p * 110)

	local function var_1_23()
		local var_10_0 = var_1_0:GetDataSource().selectColor:GetValue(var_1_1)

		if var_10_0 ~= nil then
			var_1_22:SetRGBFromInt(var_10_0, 0)
		end
	end

	var_1_22:SubscribeToModelThroughElement(var_1_0, "selectColor", var_1_23)

	local function var_1_24()
		local var_11_0 = var_1_0:GetDataSource().start:GetValue(var_1_1)

		if var_11_0 ~= nil then
			var_1_22:setText(var_11_0, 0)
		end
	end

	var_1_22:SubscribeToModelThroughElement(var_1_0, "start", var_1_24)
	var_1_0:addElement(var_1_22)

	var_1_0.Start = var_1_22

	local var_1_25
	local var_1_26 = LUI.UIText.new()

	var_1_26.id = "Select"

	var_1_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_26:SetAlignment(LUI.Alignment.Center)
	var_1_26:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 141, _1080p * 345, _1080p * 56, _1080p * 76)

	local function var_1_27()
		local var_12_0 = var_1_0:GetDataSource().selectColor:GetValue(var_1_1)

		if var_12_0 ~= nil then
			var_1_26:SetRGBFromInt(var_12_0, 0)
		end
	end

	var_1_26:SubscribeToModelThroughElement(var_1_0, "selectColor", var_1_27)

	local function var_1_28()
		local var_13_0 = var_1_0:GetDataSource().select:GetValue(var_1_1)

		if var_13_0 ~= nil then
			var_1_26:setText(var_13_0, 0)
		end
	end

	var_1_26:SubscribeToModelThroughElement(var_1_0, "select", var_1_28)
	var_1_0:addElement(var_1_26)

	var_1_0.Select = var_1_26

	local var_1_29
	local var_1_30 = LUI.UIText.new()

	var_1_30.id = "RightStick"

	var_1_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_30:SetAlignment(LUI.Alignment.Left)
	var_1_30:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 65, _1080p * 378, _1080p * 219, _1080p * 239)

	local function var_1_31()
		local var_14_0 = var_1_0:GetDataSource().rightStickColor:GetValue(var_1_1)

		if var_14_0 ~= nil then
			var_1_30:SetRGBFromInt(var_14_0, 0)
		end
	end

	var_1_30:SubscribeToModelThroughElement(var_1_0, "rightStickColor", var_1_31)

	local function var_1_32()
		local var_15_0 = var_1_0:GetDataSource().rightStick:GetValue(var_1_1)

		if var_15_0 ~= nil then
			var_1_30:setText(var_15_0, 0)
		end
	end

	var_1_30:SubscribeToModelThroughElement(var_1_0, "rightStick", var_1_32)
	var_1_0:addElement(var_1_30)

	var_1_0.RightStick = var_1_30

	local var_1_33
	local var_1_34 = LUI.UIText.new()

	var_1_34.id = "DPadLeft"

	var_1_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_34:SetAlignment(LUI.Alignment.Right)
	var_1_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -238, _1080p * -40, _1080p * 219.5, _1080p * 239.5)

	local function var_1_35()
		local var_16_0 = var_1_0:GetDataSource().dPadRightColor:GetValue(var_1_1)

		if var_16_0 ~= nil then
			var_1_34:SetRGBFromInt(var_16_0, 0)
		end
	end

	var_1_34:SubscribeToModelThroughElement(var_1_0, "dPadRightColor", var_1_35)

	local function var_1_36()
		local var_17_0 = var_1_0:GetDataSource().dPadRight:GetValue(var_1_1)

		if var_17_0 ~= nil then
			var_1_34:setText(var_17_0, 0)
		end
	end

	var_1_34:SubscribeToModelThroughElement(var_1_0, "dPadRight", var_1_36)
	var_1_0:addElement(var_1_34)

	var_1_0.DPadLeft = var_1_34

	local var_1_37
	local var_1_38 = LUI.UIText.new()

	var_1_38.id = "DPadDown"

	var_1_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_38:SetAlignment(LUI.Alignment.Right)
	var_1_38:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -200, _1080p * 5, _1080p * 444, _1080p * 464)

	local function var_1_39()
		local var_18_0 = var_1_0:GetDataSource().dPadDownColor:GetValue(var_1_1)

		if var_18_0 ~= nil then
			var_1_38:SetRGBFromInt(var_18_0, 0)
		end
	end

	var_1_38:SubscribeToModelThroughElement(var_1_0, "dPadDownColor", var_1_39)

	local function var_1_40()
		local var_19_0 = var_1_0:GetDataSource().dPadDown:GetValue(var_1_1)

		if var_19_0 ~= nil then
			var_1_38:setText(var_19_0, 0)
		end
	end

	var_1_38:SubscribeToModelThroughElement(var_1_0, "dPadDown", var_1_40)
	var_1_0:addElement(var_1_38)

	var_1_0.DPadDown = var_1_38

	local var_1_41
	local var_1_42 = LUI.UIText.new()

	var_1_42.id = "DPadRight"

	var_1_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_42:SetAlignment(LUI.Alignment.Right)
	var_1_42:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -205, 0, _1080p * 395, _1080p * 415)

	local function var_1_43()
		local var_20_0 = var_1_0:GetDataSource().dPadLeftColor:GetValue(var_1_1)

		if var_20_0 ~= nil then
			var_1_42:SetRGBFromInt(var_20_0, 0)
		end
	end

	var_1_42:SubscribeToModelThroughElement(var_1_0, "dPadLeftColor", var_1_43)

	local function var_1_44()
		local var_21_0 = var_1_0:GetDataSource().dPadLeft:GetValue(var_1_1)

		if var_21_0 ~= nil then
			var_1_42:setText(var_21_0, 0)
		end
	end

	var_1_42:SubscribeToModelThroughElement(var_1_0, "dPadLeft", var_1_44)
	var_1_0:addElement(var_1_42)

	var_1_0.DPadRight = var_1_42

	local var_1_45
	local var_1_46 = LUI.UIText.new()

	var_1_46.id = "DPadTop"

	var_1_46:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_46:SetAlignment(LUI.Alignment.Right)
	var_1_46:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -210, _1080p * -5, _1080p * 340, _1080p * 360)

	local function var_1_47()
		local var_22_0 = var_1_0:GetDataSource().dPadUpColor:GetValue(var_1_1)

		if var_22_0 ~= nil then
			var_1_46:SetRGBFromInt(var_22_0, 0)
		end
	end

	var_1_46:SubscribeToModelThroughElement(var_1_0, "dPadUpColor", var_1_47)

	local function var_1_48()
		local var_23_0 = var_1_0:GetDataSource().dPadUp:GetValue(var_1_1)

		if var_23_0 ~= nil then
			var_1_46:setText(var_23_0, 0)
		end
	end

	var_1_46:SubscribeToModelThroughElement(var_1_0, "dPadUp", var_1_48)
	var_1_0:addElement(var_1_46)

	var_1_0.DPadTop = var_1_46

	local var_1_49
	local var_1_50 = LUI.UIText.new()

	var_1_50.id = "LeftStick"

	var_1_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_50:SetAlignment(LUI.Alignment.Right)
	var_1_50:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -200, _1080p * 5, _1080p * 245, _1080p * 265)

	local function var_1_51()
		local var_24_0 = var_1_0:GetDataSource().leftStickColor:GetValue(var_1_1)

		if var_24_0 ~= nil then
			var_1_50:SetRGBFromInt(var_24_0, 0)
		end
	end

	var_1_50:SubscribeToModelThroughElement(var_1_0, "leftStickColor", var_1_51)

	local function var_1_52()
		local var_25_0 = var_1_0:GetDataSource().leftStick:GetValue(var_1_1)

		if var_25_0 ~= nil then
			var_1_50:setText(var_25_0, 0)
		end
	end

	var_1_50:SubscribeToModelThroughElement(var_1_0, "leftStick", var_1_52)
	var_1_0:addElement(var_1_50)

	var_1_0.LeftStick = var_1_50

	local var_1_53
	local var_1_54 = LUI.UIText.new()

	var_1_54.id = "AltTwo"

	var_1_54:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_54:SetAlignment(LUI.Alignment.Left)
	var_1_54:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_54:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 247, _1080p * 519, _1080p * 6.5, _1080p * 26.5)

	local function var_1_55()
		local var_26_0 = var_1_0:GetDataSource().altTwoColor:GetValue(var_1_1)

		if var_26_0 ~= nil then
			var_1_54:SetRGBFromInt(var_26_0, 0)
		end
	end

	var_1_54:SubscribeToModelThroughElement(var_1_0, "altTwoColor", var_1_55)

	local function var_1_56()
		local var_27_0 = var_1_0:GetDataSource().altTwo:GetValue(var_1_1)

		if var_27_0 ~= nil then
			var_1_54:setText(var_27_0, 0)
		end
	end

	var_1_54:SubscribeToModelThroughElement(var_1_0, "altTwo", var_1_56)
	var_1_0:addElement(var_1_54)

	var_1_0.AltTwo = var_1_54

	local var_1_57
	local var_1_58 = LUI.UIText.new()

	var_1_58.id = "Secondary"

	var_1_58:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_58:SetAlignment(LUI.Alignment.Left)
	var_1_58:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_58:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 257, _1080p * 529, _1080p * 44.5, _1080p * 64.5)

	local function var_1_59()
		local var_28_0 = var_1_0:GetDataSource().secondaryColor:GetValue(var_1_1)

		if var_28_0 ~= nil then
			var_1_58:SetRGBFromInt(var_28_0, 0)
		end
	end

	var_1_58:SubscribeToModelThroughElement(var_1_0, "secondaryColor", var_1_59)

	local function var_1_60()
		local var_29_0 = var_1_0:GetDataSource().secondary:GetValue(var_1_1)

		if var_29_0 ~= nil then
			var_1_58:setText(var_29_0, 0)
		end
	end

	var_1_58:SubscribeToModelThroughElement(var_1_0, "secondary", var_1_60)
	var_1_0:addElement(var_1_58)

	var_1_0.Secondary = var_1_58

	local var_1_61
	local var_1_62 = LUI.UIText.new()

	var_1_62.id = "AltOne"

	var_1_62:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_62:SetAlignment(LUI.Alignment.Left)
	var_1_62:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_62:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 262, _1080p * 534, _1080p * 86.5, _1080p * 106.5)

	local function var_1_63()
		local var_30_0 = var_1_0:GetDataSource().altOneColor:GetValue(var_1_1)

		if var_30_0 ~= nil then
			var_1_62:SetRGBFromInt(var_30_0, 0)
		end
	end

	var_1_62:SubscribeToModelThroughElement(var_1_0, "altOneColor", var_1_63)

	local function var_1_64()
		local var_31_0 = var_1_0:GetDataSource().altOne:GetValue(var_1_1)

		if var_31_0 ~= nil then
			var_1_62:setText(var_31_0, 0)
		end
	end

	var_1_62:SubscribeToModelThroughElement(var_1_0, "altOne", var_1_64)
	var_1_0:addElement(var_1_62)

	var_1_0.AltOne = var_1_62

	local var_1_65
	local var_1_66 = LUI.UIText.new()

	var_1_66.id = "Primary"

	var_1_66:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_66:SetAlignment(LUI.Alignment.Left)
	var_1_66:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_66:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 257, _1080p * 529, _1080p * 127.5, _1080p * 147.5)

	local function var_1_67()
		local var_32_0 = var_1_0:GetDataSource().primaryColor:GetValue(var_1_1)

		if var_32_0 ~= nil then
			var_1_66:SetRGBFromInt(var_32_0, 0)
		end
	end

	var_1_66:SubscribeToModelThroughElement(var_1_0, "primaryColor", var_1_67)

	local function var_1_68()
		local var_33_0 = var_1_0:GetDataSource().primary:GetValue(var_1_1)

		if var_33_0 ~= nil then
			var_1_66:setText(var_33_0, 0)
		end
	end

	var_1_66:SubscribeToModelThroughElement(var_1_0, "primary", var_1_68)
	var_1_0:addElement(var_1_66)

	var_1_0.Primary = var_1_66

	local function var_1_69()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_69

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		local var_1_70 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -256
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -228
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 256
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 284
			}
		}

		var_1_3:RegisterAnimationSequence("XB3", var_1_70)
	end

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		local var_1_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -252
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 240
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -256
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 256
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_1_4:RegisterAnimationSequence("XB3", var_1_71)
	end

	local var_1_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 122
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_6:RegisterAnimationSequence("XB3", var_1_72)

	local var_1_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_10:RegisterAnimationSequence("XB3", var_1_73)

	local var_1_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 171
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_14:RegisterAnimationSequence("XB3", var_1_74)

	local var_1_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_18:RegisterAnimationSequence("XB3", var_1_75)

	local var_1_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_22:RegisterAnimationSequence("XB3", var_1_76)

	local var_1_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_26:RegisterAnimationSequence("XB3", var_1_77)

	local var_1_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 479
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 499
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_30:RegisterAnimationSequence("XB3", var_1_78)

	local var_1_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 479
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 499
		}
	}

	var_1_34:RegisterAnimationSequence("XB3", var_1_79)

	local var_1_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -201
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 247
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 265
		}
	}

	var_1_50:RegisterAnimationSequence("XB3", var_1_80)

	local var_1_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 280
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_54:RegisterAnimationSequence("XB3", var_1_81)

	local var_1_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 321
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_58:RegisterAnimationSequence("XB3", var_1_82)

	local var_1_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 344
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 363
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_62:RegisterAnimationSequence("XB3", var_1_83)

	local var_1_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 385
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 404
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_1_66:RegisterAnimationSequence("XB3", var_1_84)

	local function var_1_85()
		if CONDITIONS.IsPCOrXB3(var_1_0) then
			var_1_3:AnimateSequence("XB3")
		end

		if CONDITIONS.IsPCOrXB3(var_1_0) then
			var_1_4:AnimateSequence("XB3")
		end

		var_1_6:AnimateSequence("XB3")
		var_1_10:AnimateSequence("XB3")
		var_1_14:AnimateSequence("XB3")
		var_1_18:AnimateSequence("XB3")
		var_1_22:AnimateSequence("XB3")
		var_1_26:AnimateSequence("XB3")
		var_1_30:AnimateSequence("XB3")
		var_1_34:AnimateSequence("XB3")
		var_1_50:AnimateSequence("XB3")
		var_1_54:AnimateSequence("XB3")
		var_1_58:AnimateSequence("XB3")
		var_1_62:AnimateSequence("XB3")
		var_1_66:AnimateSequence("XB3")
	end

	var_1_0._sequences.XB3 = var_1_85

	return var_1_0
end

MenuBuilder.registerType("XB3Layout", XB3Layout)
LockTable(_M)
