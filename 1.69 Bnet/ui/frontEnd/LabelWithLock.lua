module(..., package.seeall)

local var_0_0 = 4 * _1080p
local var_0_1 = 8 * _1080p
local var_0_2 = 1.15
local var_0_3 = true

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._isSpecial and not IsLanguageArabic() and var_0_2 or 1
	local var_1_1 = IsLanguageArabic() and var_0_1 or var_0_0

	if arg_1_1 == LUI.Alignment.Left then
		ACTIONS.AnimateSequence(arg_1_0, "LeftAligned")

		local var_1_2 = LAYOUT.GetTextWidth(arg_1_0.Tier) * var_1_0

		arg_1_0.ItemName:SetLeft(var_1_2 + var_1_1)
	elseif arg_1_1 == LUI.Alignment.Right then
		if var_0_3 then
			ACTIONS.AnimateSequence(arg_1_0, "FlipRight")

			local var_1_3 = 0

			if not IsLanguageArabic() then
				if arg_1_0._isSpecial then
					var_1_3 = 6 * _1080p
				else
					var_1_3 = 4 * _1080p
				end
			end

			local var_1_4 = LAYOUT.GetTextWidth(arg_1_0.Tier) * var_1_0

			arg_1_0.ItemName:SetRight(-var_1_4 - var_1_1 - var_1_3)
		else
			ACTIONS.AnimateSequence(arg_1_0, "RightAligned")

			local var_1_5 = 0

			if arg_1_0._isSpecial and not IsLanguageArabic() then
				var_1_5 = 12 * _1080p
			end

			local var_1_6 = LAYOUT.GetTextWidth(arg_1_0.ItemName) * var_1_0

			arg_1_0.Tier:SetRight(-var_1_6 - var_1_1 - var_1_5)
		end
	end
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._isSpecial = arg_2_2.isSpecial
	arg_2_0._isTopAligned = arg_2_2.isTopAligned

	local var_2_0 = BATTLEPASS.GetTierItemName(arg_2_1, arg_2_2.tier, arg_2_2.subTier)

	if arg_2_0._isTopAligned then
		arg_2_0.Tier:setText(Engine.JCBDICCAH(arg_2_2.tier))
		arg_2_0.ItemName:setText(ToUpperCase(var_2_0))

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_2_0, "TopAlignedAR")
		else
			ACTIONS.AnimateSequence(arg_2_0, "TopAligned")
		end
	else
		arg_2_0.Tier:setText(Engine.JCBDICCAH(arg_2_2.tier))
		arg_2_0.ItemName:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME", var_2_0)))

		if var_0_3 and arg_2_2.alignment == LUI.Alignment.Right then
			arg_2_0.ItemName:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME_LEFT", var_2_0)))
		end

		if arg_2_0._isSpecial then
			ACTIONS.AnimateSequence(arg_2_0, IsLanguageArabic() and "SpecialAR" or "Special")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Normal")
		end

		var_0_4(arg_2_0, arg_2_2.alignment)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupTier = var_0_5
	arg_3_0._isSpecial = false
	arg_3_0._isTopAligned = false
end

function LabelWithLock(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 24 * _1080p)

	var_4_0.id = "LabelWithLock"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIStyledText.new()

	var_4_4.id = "Tier"

	var_4_4:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_4_4:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetWordWrap(false)
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 137, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_4)

	var_4_0.Tier = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "ItemName"

	var_4_6:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetStartupDelay(1000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(1500)
	var_4_6:SetAnimMoveSpeed(1500)
	var_4_6:SetEndDelay(1000)
	var_4_6:SetCrossfadeTime(400)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 137, 0, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_6)

	var_4_0.ItemName = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenTitleOrange
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_4_4:RegisterAnimationSequence("Special", var_4_9)

	local var_4_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenTitleOrange
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_4_6:RegisterAnimationSequence("Special", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("Special")
		var_4_6:AnimateSequence("Special")
	end

	var_4_0._sequences.Special = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_4_4:RegisterAnimationSequence("RightAligned", var_4_13)

	local var_4_14 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_4_6:RegisterAnimationSequence("RightAligned", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("RightAligned")
		var_4_6:AnimateSequence("RightAligned")
	end

	var_4_0._sequences.RightAligned = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
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
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		}
	}

	var_4_4:RegisterAnimationSequence("LeftAligned", var_4_17)

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -75
		}
	}

	var_4_6:RegisterAnimationSequence("LeftAligned", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("LeftAligned")
		var_4_6:AnimateSequence("LeftAligned")
	end

	var_4_0._sequences.LeftAligned = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenTitlePurple
		}
	}

	var_4_4:RegisterAnimationSequence("Normal", var_4_21)

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenTitlePurple
		}
	}

	var_4_6:RegisterAnimationSequence("Normal", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("Normal")
		var_4_6:AnimateSequence("Normal")
	end

	var_4_0._sequences.Normal = var_4_23

	local var_4_24
	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 3 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_4_4:RegisterAnimationSequence("TopAligned", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 5 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_4_6:RegisterAnimationSequence("TopAligned", var_4_26)

	local function var_4_27()
		var_4_4:AnimateSequence("TopAligned")
		var_4_6:AnimateSequence("TopAligned")
	end

	var_4_0._sequences.TopAligned = var_4_27

	local var_4_28
	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_4_4:RegisterAnimationSequence("AR", var_4_29)

	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_30)

	local function var_4_31()
		var_4_4:AnimateSequence("AR")
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 3 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_4_4:RegisterAnimationSequence("TopAlignedAR", var_4_33)

	local var_4_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 5 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_4_6:RegisterAnimationSequence("TopAlignedAR", var_4_34)

	local function var_4_35()
		var_4_4:AnimateSequence("TopAlignedAR")
		var_4_6:AnimateSequence("TopAlignedAR")
	end

	var_4_0._sequences.TopAlignedAR = var_4_35

	local var_4_36
	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenTitleOrange
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 1 * _1080p
		}
	}

	var_4_4:RegisterAnimationSequence("SpecialAR", var_4_37)

	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenTitleOrange
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 2 * _1080p
		}
	}

	var_4_6:RegisterAnimationSequence("SpecialAR", var_4_38)

	local function var_4_39()
		var_4_4:AnimateSequence("SpecialAR")
		var_4_6:AnimateSequence("SpecialAR")
	end

	var_4_0._sequences.SpecialAR = var_4_39

	local var_4_40
	local var_4_41 = {
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
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		}
	}

	var_4_4:RegisterAnimationSequence("FlipRight", var_4_41)

	local var_4_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -85
		}
	}

	var_4_6:RegisterAnimationSequence("FlipRight", var_4_42)

	local function var_4_43()
		var_4_4:AnimateSequence("FlipRight")
		var_4_6:AnimateSequence("FlipRight")
	end

	var_4_0._sequences.FlipRight = var_4_43

	local var_4_44
	local var_4_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_4_4:RegisterAnimationSequence("DropShadow", var_4_45)

	local var_4_46 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_4_6:RegisterAnimationSequence("DropShadow", var_4_46)

	local function var_4_47()
		var_4_4:AnimateSequence("DropShadow")
		var_4_6:AnimateSequence("DropShadow")
	end

	var_4_0._sequences.DropShadow = var_4_47

	var_0_6(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LabelWithLock", LabelWithLock)
LockTable(_M)
