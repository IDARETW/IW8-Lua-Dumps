module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isComplete then
		arg_1_0:SetAlpha(0)

		return
	end

	if arg_1_1.desc and arg_1_1.amount then
		arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.desc, arg_1_1.amount))
	else
		arg_1_0.Description:setText("")
	end

	local var_1_0

	if arg_1_1.rewards and #arg_1_1.rewards > 0 then
		var_1_0 = math.min(#arg_1_1.rewards, #arg_1_0._rewardWidgets)

		local var_1_1 = "ShowIcon"

		if arg_1_0._scoped.menuName ~= "MagmaDailyPopup" and var_1_0 == 1 then
			var_1_1 = "ShowIconAlt"
		end

		ACTIONS.AnimateSequence(arg_1_0, var_1_1 .. var_1_0)

		for iter_1_0 = 1, var_1_0 do
			local var_1_2 = arg_1_1.rewards[iter_1_0]

			arg_1_0._rewardWidgets[iter_1_0]:UpdateCardConfig(var_1_2)

			if arg_1_0._scoped.menuName == "MagmaDailyPopup" and var_1_0 == 1 and var_1_2.type == "xp" then
				arg_1_0.Reward1.Border:SetAlpha(0)
				arg_1_0.Reward1.Background:SetAlpha(0)
				arg_1_0.Reward1.RarityBG:SetAlpha(0)
			end
		end
	end

	if not arg_1_1.unlocked then
		ACTIONS.AnimateSequence(arg_1_0, "Locked")
		arg_1_0.Difficulty:SetAlpha(0)
	else
		arg_1_0.Difficulty:SetAlpha(1)

		if arg_1_1.length == "3" then
			ACTIONS.AnimateSequence(arg_1_0.Difficulty, "Three")
		elseif arg_1_1.length == "2" then
			ACTIONS.AnimateSequence(arg_1_0.Difficulty, "Two")
		elseif arg_1_1.length == "1" then
			ACTIONS.AnimateSequence(arg_1_0.Difficulty, "One")
		end

		if arg_1_0._scoped.menuName == "MagmaDailyPopup" then
			if arg_1_1.length == "3" then
				ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
			elseif arg_1_1.length == "2" then
				ACTIONS.AnimateSequence(arg_1_0, "UnlockedSmall")

				if var_1_0 == 2 then
					arg_1_0.Reward1.Border:SetAlpha(0)
					arg_1_0.Reward1.Background:SetAlpha(0)
					arg_1_0.Reward1.RarityBG:SetAlpha(0)
					ACTIONS.AnimateSequence(arg_1_0, "DescRewardSmallShow2")
				else
					ACTIONS.AnimateSequence(arg_1_0, "DescReward1")
				end
			elseif arg_1_1.length == "1" then
				ACTIONS.AnimateSequence(arg_1_0, "UnlockedSmallUp")
			end
		else
			ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Description)
	assert(arg_2_0.Reward1)
	assert(arg_2_0.Reward2)

	arg_2_0.SetData = var_0_0
	arg_2_0._rewardWidgets = {
		arg_2_0.Reward1,
		arg_2_0.Reward2
	}

	arg_2_0.Reward1:SetMiniMode(true)
	arg_2_0.Reward2:SetMiniMode(true)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function ChallengePopupDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 514 * _1080p, 0, 180 * _1080p)

	var_3_0.id = "ChallengePopupDetails"
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

	var_3_4:SetAlpha(0.5, 0)
	var_3_4.Background:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "MWLarge"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_3_6:SetAlpha(0.2, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.5, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -309, _1080p * 105, _1080p * -107, _1080p * 129)
	var_3_0:addElement(var_3_6)

	var_3_0.MWLarge = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Description"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_8:setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Making this longer for testing.", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, _1080p * -215, _1080p * 59, _1080p * 83)
	var_3_0:addElement(var_3_8)

	var_3_0.Description = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Reward1"

	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 46, _1080p * 128, _1080p * 46, _1080p * 156)
	var_3_0:addElement(var_3_10)

	var_3_0.Reward1 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Reward2"

	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 151, _1080p * 233, _1080p * 46, _1080p * 156)
	var_3_0:addElement(var_3_12)

	var_3_0.Reward2 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Gradient"

	var_3_14:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:SetPixelGridEnabled(true)
	var_3_14:SetPixelGridContrast(0.5, 0)
	var_3_14:SetPixelGridBlockWidth(2, 0)
	var_3_14:SetPixelGridBlockHeight(2, 0)
	var_3_14:SetPixelGridGutterWidth(1, 0)
	var_3_14:SetPixelGridGutterHeight(1, 0)
	var_3_14:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 24, _1080p * -24, 0, 0)
	var_3_0:addElement(var_3_14)

	var_3_0.Gradient = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "MWSmall"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_16:setImage(RegisterMaterial("logo_mw"), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 94, _1080p * 14, _1080p * 34)
	var_3_0:addElement(var_3_16)

	var_3_0.MWSmall = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "Text"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_18:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/CHALLENGE_AVAILABLE_WITH_FULL_GAME")), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetShadowMinDistance(-0.3, 0)
	var_3_18:SetShadowMaxDistance(1, 0)
	var_3_18:SetShadowUOffset(0.001, 0)
	var_3_18:SetShadowRGBFromInt(1710618, 0)
	var_3_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -24, _1080p * 15, _1080p * 33)
	var_3_0:addElement(var_3_18)

	var_3_0.Text = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("ChallengeDifficultyWidget", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "Difficulty"

	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 220, _1080p * 151, _1080p * 175)
	var_3_0:addElement(var_3_20)

	var_3_0.Difficulty = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -4 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 75
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_23)

	local function var_3_24()
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_24

	local var_3_25
	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 163
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowIcon1", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ShowIcon1", var_3_27)

	local function var_3_28()
		var_3_10:AnimateSequence("ShowIcon1")
		var_3_12:AnimateSequence("ShowIcon1")
	end

	var_3_0._sequences.ShowIcon1 = var_3_28

	local var_3_29
	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowIcon2", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 151
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 232
		}
	}

	var_3_12:RegisterAnimationSequence("ShowIcon2", var_3_31)

	local function var_3_32()
		var_3_10:AnimateSequence("ShowIcon2")
		var_3_12:AnimateSequence("ShowIcon2")
	end

	var_3_0._sequences.ShowIcon2 = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocusDark,
			child = var_3_0.DoubleNotchedBacker.Background
		}
	}

	var_3_4:RegisterAnimationSequence("Unlocked", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Unlocked", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_3_8:RegisterAnimationSequence("Unlocked", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 132
		}
	}

	var_3_10:RegisterAnimationSequence("Unlocked", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 132
		}
	}

	var_3_12:RegisterAnimationSequence("Unlocked", var_3_38)

	local var_3_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Unlocked", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Unlocked", var_3_40)

	local var_3_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Unlocked", var_3_41)

	local var_3_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 141
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 165
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Unlocked", var_3_42)

	local function var_3_43()
		var_3_4:AnimateSequence("Unlocked")
		var_3_6:AnimateSequence("Unlocked")
		var_3_8:AnimateSequence("Unlocked")
		var_3_10:AnimateSequence("Unlocked")
		var_3_12:AnimateSequence("Unlocked")
		var_3_14:AnimateSequence("Unlocked")
		var_3_16:AnimateSequence("Unlocked")
		var_3_18:AnimateSequence("Unlocked")
		var_3_20:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_43

	local var_3_44
	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bg,
			child = var_3_0.DoubleNotchedBacker.Background
		}
	}

	var_3_4:RegisterAnimationSequence("Locked", var_3_45)

	local var_3_46 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_46)

	local var_3_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 83
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_47)

	local var_3_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 156
		}
	}

	var_3_10:RegisterAnimationSequence("Locked", var_3_48)

	local var_3_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 157
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_49)

	local var_3_50 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Locked", var_3_50)

	local var_3_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_51)

	local var_3_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Locked", var_3_52)

	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Locked", var_3_53)

	local function var_3_54()
		var_3_4:AnimateSequence("Locked")
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_10:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")
		var_3_14:AnimateSequence("Locked")
		var_3_16:AnimateSequence("Locked")
		var_3_18:AnimateSequence("Locked")
		var_3_20:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_54

	local var_3_55
	local var_3_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocusDark,
			child = var_3_0.DoubleNotchedBacker.Background
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		}
	}

	var_3_4:RegisterAnimationSequence("UnlockedSmall", var_3_56)

	local var_3_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("UnlockedSmall", var_3_57)

	local var_3_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_3_8:RegisterAnimationSequence("UnlockedSmall", var_3_58)

	local var_3_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		}
	}

	var_3_10:RegisterAnimationSequence("UnlockedSmall", var_3_59)

	local var_3_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		}
	}

	var_3_12:RegisterAnimationSequence("UnlockedSmall", var_3_60)

	local var_3_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("UnlockedSmall", var_3_61)

	local var_3_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("UnlockedSmall", var_3_62)

	local var_3_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("UnlockedSmall", var_3_63)

	local var_3_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 95
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("UnlockedSmall", var_3_64)

	local function var_3_65()
		var_3_4:AnimateSequence("UnlockedSmall")
		var_3_6:AnimateSequence("UnlockedSmall")
		var_3_8:AnimateSequence("UnlockedSmall")
		var_3_10:AnimateSequence("UnlockedSmall")
		var_3_12:AnimateSequence("UnlockedSmall")
		var_3_14:AnimateSequence("UnlockedSmall")
		var_3_16:AnimateSequence("UnlockedSmall")
		var_3_18:AnimateSequence("UnlockedSmall")
		var_3_20:AnimateSequence("UnlockedSmall")
	end

	var_3_0._sequences.UnlockedSmall = var_3_65

	local var_3_66
	local var_3_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocusDark,
			child = var_3_0.DoubleNotchedBacker.Background
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -70
		}
	}

	var_3_4:RegisterAnimationSequence("UnlockedSmallUp", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		}
	}

	var_3_6:RegisterAnimationSequence("UnlockedSmallUp", var_3_68)

	local var_3_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_3_8:RegisterAnimationSequence("UnlockedSmallUp", var_3_69)

	local var_3_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_3_10:RegisterAnimationSequence("UnlockedSmallUp", var_3_70)

	local var_3_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_3_12:RegisterAnimationSequence("UnlockedSmallUp", var_3_71)

	local var_3_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		}
	}

	var_3_14:RegisterAnimationSequence("UnlockedSmallUp", var_3_72)

	local var_3_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -36
		}
	}

	var_3_16:RegisterAnimationSequence("UnlockedSmallUp", var_3_73)

	local var_3_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		}
	}

	var_3_18:RegisterAnimationSequence("UnlockedSmallUp", var_3_74)

	local var_3_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("UnlockedSmallUp", var_3_75)

	local function var_3_76()
		var_3_4:AnimateSequence("UnlockedSmallUp")
		var_3_6:AnimateSequence("UnlockedSmallUp")
		var_3_8:AnimateSequence("UnlockedSmallUp")
		var_3_10:AnimateSequence("UnlockedSmallUp")
		var_3_12:AnimateSequence("UnlockedSmallUp")
		var_3_14:AnimateSequence("UnlockedSmallUp")
		var_3_16:AnimateSequence("UnlockedSmallUp")
		var_3_18:AnimateSequence("UnlockedSmallUp")
		var_3_20:AnimateSequence("UnlockedSmallUp")
	end

	var_3_0._sequences.UnlockedSmallUp = var_3_76

	local var_3_77
	local var_3_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -106
		}
	}

	var_3_8:RegisterAnimationSequence("ShowIconAlt1", var_3_78)

	local var_3_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 233
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowIconAlt1", var_3_79)

	local var_3_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ShowIconAlt1", var_3_80)

	local function var_3_81()
		var_3_8:AnimateSequence("ShowIconAlt1")
		var_3_10:AnimateSequence("ShowIconAlt1")
		var_3_12:AnimateSequence("ShowIconAlt1")
	end

	var_3_0._sequences.ShowIconAlt1 = var_3_81

	local var_3_82
	local var_3_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_3_8:RegisterAnimationSequence("DescReward1", var_3_83)

	local function var_3_84()
		var_3_8:AnimateSequence("DescReward1")
	end

	var_3_0._sequences.DescReward1 = var_3_84

	local var_3_85
	local var_3_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_3_8:RegisterAnimationSequence("DescRewardAlt1", var_3_86)

	local function var_3_87()
		var_3_8:AnimateSequence("DescRewardAlt1")
	end

	var_3_0._sequences.DescRewardAlt1 = var_3_87

	local var_3_88
	local var_3_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -217
		}
	}

	var_3_8:RegisterAnimationSequence("DescRewardSmallShow2", var_3_89)

	local function var_3_90()
		var_3_8:AnimateSequence("DescRewardSmallShow2")
	end

	var_3_0._sequences.DescRewardSmallShow2 = var_3_90

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ChallengePopupDetails", ChallengePopupDetails)
LockTable(_M)
