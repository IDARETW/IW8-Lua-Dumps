module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function StickLayoutDirections(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 250 * _1080p)

	var_2_0.id = "StickLayoutDirections"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "UpTextR"

	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * 400, _1080p * 15, _1080p * 33)

	local function var_2_5()
		local var_3_0 = var_2_0:GetDataSource().upColor:GetValue(var_2_1)

		if var_3_0 ~= nil then
			var_2_4:SetRGBFromInt(var_3_0, 0)
		end
	end

	var_2_4:SubscribeToModelThroughElement(var_2_0, "upColor", var_2_5)

	local function var_2_6()
		local var_4_0 = var_2_0:GetDataSource().up:GetValue(var_2_1)

		if var_4_0 ~= nil then
			var_2_4:setText(var_4_0, 0)
		end
	end

	var_2_4:SubscribeToModelThroughElement(var_2_0, "up", var_2_6)
	var_2_0:addElement(var_2_4)

	var_2_0.UpTextR = var_2_4

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "DownTextR"

	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * 400, _1080p * 62, _1080p * 80)

	local function var_2_9()
		local var_5_0 = var_2_0:GetDataSource().downColor:GetValue(var_2_1)

		if var_5_0 ~= nil then
			var_2_8:SetRGBFromInt(var_5_0, 0)
		end
	end

	var_2_8:SubscribeToModelThroughElement(var_2_0, "downColor", var_2_9)

	local function var_2_10()
		local var_6_0 = var_2_0:GetDataSource().down:GetValue(var_2_1)

		if var_6_0 ~= nil then
			var_2_8:setText(var_6_0, 0)
		end
	end

	var_2_8:SubscribeToModelThroughElement(var_2_0, "down", var_2_10)
	var_2_0:addElement(var_2_8)

	var_2_0.DownTextR = var_2_8

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "RightTextR"

	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * 400, _1080p * 109, _1080p * 127)

	local function var_2_13()
		local var_7_0 = var_2_0:GetDataSource().rightColor:GetValue(var_2_1)

		if var_7_0 ~= nil then
			var_2_12:SetRGBFromInt(var_7_0, 0)
		end
	end

	var_2_12:SubscribeToModelThroughElement(var_2_0, "rightColor", var_2_13)

	local function var_2_14()
		local var_8_0 = var_2_0:GetDataSource().right:GetValue(var_2_1)

		if var_8_0 ~= nil then
			var_2_12:setText(var_8_0, 0)
		end
	end

	var_2_12:SubscribeToModelThroughElement(var_2_0, "right", var_2_14)
	var_2_0:addElement(var_2_12)

	var_2_0.RightTextR = var_2_12

	local var_2_15
	local var_2_16 = LUI.UIStyledText.new()

	var_2_16.id = "LeftTextR"

	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * 400, _1080p * 156, _1080p * 174)

	local function var_2_17()
		local var_9_0 = var_2_0:GetDataSource().leftColor:GetValue(var_2_1)

		if var_9_0 ~= nil then
			var_2_16:SetRGBFromInt(var_9_0, 0)
		end
	end

	var_2_16:SubscribeToModelThroughElement(var_2_0, "leftColor", var_2_17)

	local function var_2_18()
		local var_10_0 = var_2_0:GetDataSource().left:GetValue(var_2_1)

		if var_10_0 ~= nil then
			var_2_16:setText(var_10_0, 0)
		end
	end

	var_2_16:SubscribeToModelThroughElement(var_2_0, "left", var_2_18)
	var_2_0:addElement(var_2_16)

	var_2_0.LeftTextR = var_2_16

	local var_2_19
	local var_2_20 = LUI.UIStyledText.new()

	var_2_20.id = "ButtonTextR"

	var_2_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_20:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_20:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * 400, _1080p * 203, _1080p * 221)

	local function var_2_21()
		local var_11_0 = var_2_0:GetDataSource().buttonColor:GetValue(var_2_1)

		if var_11_0 ~= nil then
			var_2_20:SetRGBFromInt(var_11_0, 0)
		end
	end

	var_2_20:SubscribeToModelThroughElement(var_2_0, "buttonColor", var_2_21)

	local function var_2_22()
		local var_12_0 = var_2_0:GetDataSource().button:GetValue(var_2_1)

		if var_12_0 ~= nil then
			var_2_20:setText(var_12_0, 0)
		end
	end

	var_2_20:SubscribeToModelThroughElement(var_2_0, "button", var_2_22)
	var_2_0:addElement(var_2_20)

	var_2_0.ButtonTextR = var_2_20

	local var_2_23
	local var_2_24 = LUI.UIStyledText.new()

	var_2_24.id = "UpTextL"

	var_2_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_24:SetAlignment(LUI.Alignment.Right)
	var_2_24:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -400, _1080p * -40, _1080p * 15, _1080p * 33)

	local function var_2_25()
		local var_13_0 = var_2_0:GetDataSource().upColor:GetValue(var_2_1)

		if var_13_0 ~= nil then
			var_2_24:SetRGBFromInt(var_13_0, 0)
		end
	end

	var_2_24:SubscribeToModelThroughElement(var_2_0, "upColor", var_2_25)

	local function var_2_26()
		local var_14_0 = var_2_0:GetDataSource().up:GetValue(var_2_1)

		if var_14_0 ~= nil then
			var_2_24:setText(var_14_0, 0)
		end
	end

	var_2_24:SubscribeToModelThroughElement(var_2_0, "up", var_2_26)
	var_2_0:addElement(var_2_24)

	var_2_0.UpTextL = var_2_24

	local var_2_27
	local var_2_28 = LUI.UIStyledText.new()

	var_2_28.id = "DownTextL"

	var_2_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_28:SetAlignment(LUI.Alignment.Right)
	var_2_28:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -400, _1080p * -40, _1080p * 62, _1080p * 80)

	local function var_2_29()
		local var_15_0 = var_2_0:GetDataSource().downColor:GetValue(var_2_1)

		if var_15_0 ~= nil then
			var_2_28:SetRGBFromInt(var_15_0, 0)
		end
	end

	var_2_28:SubscribeToModelThroughElement(var_2_0, "downColor", var_2_29)

	local function var_2_30()
		local var_16_0 = var_2_0:GetDataSource().down:GetValue(var_2_1)

		if var_16_0 ~= nil then
			var_2_28:setText(var_16_0, 0)
		end
	end

	var_2_28:SubscribeToModelThroughElement(var_2_0, "down", var_2_30)
	var_2_0:addElement(var_2_28)

	var_2_0.DownTextL = var_2_28

	local var_2_31
	local var_2_32 = LUI.UIStyledText.new()

	var_2_32.id = "RightTextL"

	var_2_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_32:SetAlignment(LUI.Alignment.Right)
	var_2_32:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -400, _1080p * -40, _1080p * 109, _1080p * 127)

	local function var_2_33()
		local var_17_0 = var_2_0:GetDataSource().rightColor:GetValue(var_2_1)

		if var_17_0 ~= nil then
			var_2_32:SetRGBFromInt(var_17_0, 0)
		end
	end

	var_2_32:SubscribeToModelThroughElement(var_2_0, "rightColor", var_2_33)

	local function var_2_34()
		local var_18_0 = var_2_0:GetDataSource().right:GetValue(var_2_1)

		if var_18_0 ~= nil then
			var_2_32:setText(var_18_0, 0)
		end
	end

	var_2_32:SubscribeToModelThroughElement(var_2_0, "right", var_2_34)
	var_2_0:addElement(var_2_32)

	var_2_0.RightTextL = var_2_32

	local var_2_35
	local var_2_36 = LUI.UIStyledText.new()

	var_2_36.id = "LeftTextL"

	var_2_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_36:SetAlignment(LUI.Alignment.Right)
	var_2_36:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -400, _1080p * -40, _1080p * 156, _1080p * 174)

	local function var_2_37()
		local var_19_0 = var_2_0:GetDataSource().leftColor:GetValue(var_2_1)

		if var_19_0 ~= nil then
			var_2_36:SetRGBFromInt(var_19_0, 0)
		end
	end

	var_2_36:SubscribeToModelThroughElement(var_2_0, "leftColor", var_2_37)

	local function var_2_38()
		local var_20_0 = var_2_0:GetDataSource().left:GetValue(var_2_1)

		if var_20_0 ~= nil then
			var_2_36:setText(var_20_0, 0)
		end
	end

	var_2_36:SubscribeToModelThroughElement(var_2_0, "left", var_2_38)
	var_2_0:addElement(var_2_36)

	var_2_0.LeftTextL = var_2_36

	local var_2_39
	local var_2_40 = LUI.UIStyledText.new()

	var_2_40.id = "ButtonTextL"

	var_2_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_40:SetAlignment(LUI.Alignment.Right)
	var_2_40:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -400, _1080p * -40, _1080p * 203, _1080p * 221)

	local function var_2_41()
		local var_21_0 = var_2_0:GetDataSource().buttonColor:GetValue(var_2_1)

		if var_21_0 ~= nil then
			var_2_40:SetRGBFromInt(var_21_0, 0)
		end
	end

	var_2_40:SubscribeToModelThroughElement(var_2_0, "buttonColor", var_2_41)

	local function var_2_42()
		local var_22_0 = var_2_0:GetDataSource().button:GetValue(var_2_1)

		if var_22_0 ~= nil then
			var_2_40:setText(var_22_0, 0)
		end
	end

	var_2_40:SubscribeToModelThroughElement(var_2_0, "button", var_2_42)
	var_2_0:addElement(var_2_40)

	var_2_0.ButtonTextL = var_2_40

	local var_2_43
	local var_2_44 = LUI.UIImage.new()

	var_2_44.id = "UpArrow"

	var_2_44:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_2_44:SetZRotation(-90, 0)
	var_2_44:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_2_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 173, _1080p * 200, _1080p * -2, _1080p * 52)
	var_2_0:addElement(var_2_44)

	var_2_0.UpArrow = var_2_44

	local var_2_45
	local var_2_46 = LUI.UIImage.new()

	var_2_46.id = "LeftArrow"

	var_2_46:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_2_46:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_2_46:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 27, _1080p * 140, _1080p * 194)
	var_2_0:addElement(var_2_46)

	var_2_0.LeftArrow = var_2_46

	local var_2_47
	local var_2_48 = LUI.UIImage.new()

	var_2_48.id = "RightArrow"

	var_2_48:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_2_48:SetZRotation(180, 0)
	var_2_48:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_2_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 173, _1080p * 200, _1080p * 92, _1080p * 146)
	var_2_0:addElement(var_2_48)

	var_2_0.RightArrow = var_2_48

	local var_2_49
	local var_2_50 = LUI.UIImage.new()

	var_2_50.id = "DownArrow"

	var_2_50:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_2_50:SetZRotation(90, 0)
	var_2_50:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_2_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 173, _1080p * 200, _1080p * 45, _1080p * 99)
	var_2_0:addElement(var_2_50)

	var_2_0.DownArrow = var_2_50

	local var_2_51
	local var_2_52 = LUI.UIImage.new()

	var_2_52.id = "Button"

	var_2_52:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_2_52:setImage(RegisterMaterial("button_stick_down"), 0)
	var_2_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 189, _1080p * 217, _1080p * 197, _1080p * 225)
	var_2_0:addElement(var_2_52)

	var_2_0.Button = var_2_52

	local var_2_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_2_4:RegisterAnimationSequence("DefaultSequence", var_2_53)

	local var_2_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_2_8:RegisterAnimationSequence("DefaultSequence", var_2_54)

	local var_2_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_2_12:RegisterAnimationSequence("DefaultSequence", var_2_55)

	local var_2_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_2_16:RegisterAnimationSequence("DefaultSequence", var_2_56)

	local var_2_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_2_20:RegisterAnimationSequence("DefaultSequence", var_2_57)

	local function var_2_58()
		var_2_4:AnimateSequence("DefaultSequence")
		var_2_8:AnimateSequence("DefaultSequence")
		var_2_12:AnimateSequence("DefaultSequence")
		var_2_16:AnimateSequence("DefaultSequence")
		var_2_20:AnimateSequence("DefaultSequence")
	end

	var_2_0._sequences.DefaultSequence = var_2_58

	local var_2_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ArrowsOnLeft", var_2_59)

	local var_2_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ArrowsOnLeft", var_2_60)

	local var_2_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ArrowsOnLeft", var_2_61)

	local var_2_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("ArrowsOnLeft", var_2_62)

	local var_2_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("ArrowsOnLeft", var_2_63)

	local var_2_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_24:RegisterAnimationSequence("ArrowsOnLeft", var_2_64)

	local var_2_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_28:RegisterAnimationSequence("ArrowsOnLeft", var_2_65)

	local var_2_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_32:RegisterAnimationSequence("ArrowsOnLeft", var_2_66)

	local var_2_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_36:RegisterAnimationSequence("ArrowsOnLeft", var_2_67)

	local var_2_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_40:RegisterAnimationSequence("ArrowsOnLeft", var_2_68)

	local var_2_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 27
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
		}
	}

	var_2_44:RegisterAnimationSequence("ArrowsOnLeft", var_2_69)

	local var_2_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 27
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
		}
	}

	var_2_46:RegisterAnimationSequence("ArrowsOnLeft", var_2_70)

	local var_2_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 27
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
		}
	}

	var_2_48:RegisterAnimationSequence("ArrowsOnLeft", var_2_71)

	local var_2_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 27
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
		}
	}

	var_2_50:RegisterAnimationSequence("ArrowsOnLeft", var_2_72)

	local var_2_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_2_52:RegisterAnimationSequence("ArrowsOnLeft", var_2_73)

	local function var_2_74()
		var_2_4:AnimateSequence("ArrowsOnLeft")
		var_2_8:AnimateSequence("ArrowsOnLeft")
		var_2_12:AnimateSequence("ArrowsOnLeft")
		var_2_16:AnimateSequence("ArrowsOnLeft")
		var_2_20:AnimateSequence("ArrowsOnLeft")
		var_2_24:AnimateSequence("ArrowsOnLeft")
		var_2_28:AnimateSequence("ArrowsOnLeft")
		var_2_32:AnimateSequence("ArrowsOnLeft")
		var_2_36:AnimateSequence("ArrowsOnLeft")
		var_2_40:AnimateSequence("ArrowsOnLeft")
		var_2_44:AnimateSequence("ArrowsOnLeft")
		var_2_46:AnimateSequence("ArrowsOnLeft")
		var_2_48:AnimateSequence("ArrowsOnLeft")
		var_2_50:AnimateSequence("ArrowsOnLeft")
		var_2_52:AnimateSequence("ArrowsOnLeft")
	end

	var_2_0._sequences.ArrowsOnLeft = var_2_74

	local var_2_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ArrowsOnRight", var_2_75)

	local var_2_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ArrowsOnRight", var_2_76)

	local var_2_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ArrowsOnRight", var_2_77)

	local var_2_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("ArrowsOnRight", var_2_78)

	local var_2_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("ArrowsOnRight", var_2_79)

	local var_2_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_24:RegisterAnimationSequence("ArrowsOnRight", var_2_80)

	local var_2_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_28:RegisterAnimationSequence("ArrowsOnRight", var_2_81)

	local var_2_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_32:RegisterAnimationSequence("ArrowsOnRight", var_2_82)

	local var_2_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_36:RegisterAnimationSequence("ArrowsOnRight", var_2_83)

	local var_2_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_40:RegisterAnimationSequence("ArrowsOnRight", var_2_84)

	local var_2_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_2_44:RegisterAnimationSequence("ArrowsOnRight", var_2_85)

	local var_2_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_2_46:RegisterAnimationSequence("ArrowsOnRight", var_2_86)

	local var_2_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_2_48:RegisterAnimationSequence("ArrowsOnRight", var_2_87)

	local var_2_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_2_50:RegisterAnimationSequence("ArrowsOnRight", var_2_88)

	local var_2_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_stick_down")
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
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 225
		}
	}

	var_2_52:RegisterAnimationSequence("ArrowsOnRight", var_2_89)

	local function var_2_90()
		var_2_4:AnimateSequence("ArrowsOnRight")
		var_2_8:AnimateSequence("ArrowsOnRight")
		var_2_12:AnimateSequence("ArrowsOnRight")
		var_2_16:AnimateSequence("ArrowsOnRight")
		var_2_20:AnimateSequence("ArrowsOnRight")
		var_2_24:AnimateSequence("ArrowsOnRight")
		var_2_28:AnimateSequence("ArrowsOnRight")
		var_2_32:AnimateSequence("ArrowsOnRight")
		var_2_36:AnimateSequence("ArrowsOnRight")
		var_2_40:AnimateSequence("ArrowsOnRight")
		var_2_44:AnimateSequence("ArrowsOnRight")
		var_2_46:AnimateSequence("ArrowsOnRight")
		var_2_48:AnimateSequence("ArrowsOnRight")
		var_2_50:AnimateSequence("ArrowsOnRight")
		var_2_52:AnimateSequence("ArrowsOnRight")
	end

	var_2_0._sequences.ArrowsOnRight = var_2_90

	local var_2_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("HideStickButtonPromptsForVita", var_2_91)

	local var_2_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_40:RegisterAnimationSequence("HideStickButtonPromptsForVita", var_2_92)

	local var_2_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_52:RegisterAnimationSequence("HideStickButtonPromptsForVita", var_2_93)

	local function var_2_94()
		var_2_20:AnimateSequence("HideStickButtonPromptsForVita")
		var_2_40:AnimateSequence("HideStickButtonPromptsForVita")
		var_2_52:AnimateSequence("HideStickButtonPromptsForVita")
	end

	var_2_0._sequences.HideStickButtonPromptsForVita = var_2_94

	local var_2_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_95)

	local var_2_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_96)

	local var_2_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 132
		}
	}

	var_2_12:RegisterAnimationSequence("AR", var_2_97)

	local var_2_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 179
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_98)

	local var_2_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_2_20:RegisterAnimationSequence("AR", var_2_99)

	local var_2_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_2_24:RegisterAnimationSequence("AR", var_2_100)

	local var_2_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_2_28:RegisterAnimationSequence("AR", var_2_101)

	local var_2_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 132
		}
	}

	var_2_32:RegisterAnimationSequence("AR", var_2_102)

	local var_2_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 179
		}
	}

	var_2_36:RegisterAnimationSequence("AR", var_2_103)

	local var_2_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_2_40:RegisterAnimationSequence("AR", var_2_104)

	local function var_2_105()
		var_2_4:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
		var_2_12:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
		var_2_20:AnimateSequence("AR")
		var_2_24:AnimateSequence("AR")
		var_2_28:AnimateSequence("AR")
		var_2_32:AnimateSequence("AR")
		var_2_36:AnimateSequence("AR")
		var_2_40:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_105

	local var_2_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_stick_left_anim")
		}
	}

	var_2_52:RegisterAnimationSequence("L3ButtonIcon", var_2_106)

	local function var_2_107()
		var_2_52:AnimateSequence("L3ButtonIcon")
	end

	var_2_0._sequences.L3ButtonIcon = var_2_107

	local var_2_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_stick_right_anim")
		}
	}

	var_2_52:RegisterAnimationSequence("R3ButtonIcon", var_2_108)

	local function var_2_109()
		var_2_52:AnimateSequence("R3ButtonIcon")
	end

	var_2_0._sequences.R3ButtonIcon = var_2_109

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)
	ACTIONS.AnimateSequence(var_2_0, "DefaultSequence")

	return var_2_0
end

MenuBuilder.registerType("StickLayoutDirections", StickLayoutDirections)
LockTable(_M)
