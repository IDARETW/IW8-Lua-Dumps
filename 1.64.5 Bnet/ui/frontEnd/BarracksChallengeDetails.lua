module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.desc and arg_1_1.amount then
		arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.desc, arg_1_1.amount))
	else
		arg_1_0.Description:setText("")
	end

	if arg_1_1.progress then
		arg_1_0.ProgressBar:SetProgress(arg_1_1.progress, 0)
		ACTIONS.AnimateSequence(arg_1_0, arg_1_1.progress == 1 and "Complete" or "Incomplete")
		arg_1_0.Checkbox:SetValue(arg_1_1.progress == 1, true)
	else
		arg_1_0.ProgressBar:SetAlpha(0)
	end

	if arg_1_1.amountEarned and arg_1_1.amountNeeded then
		arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1.amountEarned, arg_1_1.amountNeeded))
	else
		arg_1_0.ProgressDesc:setText("")
	end

	if arg_1_1.type then
		local var_1_0 = Challenge.GetTypeName(arg_1_1.type)

		if arg_1_1.type == Challenge.Type.MISSION and arg_1_1.name then
			var_1_0 = Engine.CBBHFCGDIC("CHALLENGE/MISSION_N", arg_1_1.name)

			arg_1_0.ChallengeResetTimer:SetAlpha(0)
		elseif arg_1_1.type == Challenge.Type.DAILY or arg_1_1.type == Challenge.Type.BR_DAILY then
			arg_1_0.ChallengeResetTimer:SetupRightAlignment()
			Challenge.SetupDailyResetTimer(arg_1_0.ChallengeResetTimer, arg_1_0.ChallengeResetTimer.Text)
			arg_1_0.ChallengeResetTimer:SetupAlignment()
		elseif arg_1_1.type == Challenge.Type.WEEKLY or arg_1_1.type == Challenge.Type.BR_WEEKLY then
			arg_1_0.ChallengeResetTimer:SetAlpha(0)
		end

		arg_1_0.ChallengeTypeHeader.Text:setText(var_1_0 or "")
	else
		ACTIONS.AnimateSequence(arg_1_0, "TitleOff")

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "TitleOffAR")
		end
	end

	if arg_1_1.rewards and #arg_1_1.rewards > 0 then
		local var_1_1 = math.min(#arg_1_1.rewards, #arg_1_0._rewardWidgets)

		ACTIONS.AnimateSequence(arg_1_0, "ShowIcon" .. var_1_1)

		for iter_1_0 = 1, var_1_1 do
			local var_1_2 = arg_1_1.rewards[iter_1_0]
			local var_1_3 = arg_1_0._rewardWidgets[iter_1_0]

			var_1_3.nameLabel:setText(var_1_2.typeName or "")
			var_1_3.lootCard:UpdateCardConfig(var_1_2)
		end
	end

	if not arg_1_1.unlocked then
		arg_1_0.Lock:SetAlpha(1)
	else
		arg_1_0.Lock:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1.type == Challenge.Type.DAILY or arg_2_1.type == Challenge.Type.BR_DAILY then
		if not arg_2_1.isComplete then
			arg_2_0.Difficulty:SetAlpha(1)

			local var_2_0 = Challenge.GetDifficulty(arg_2_1.id, arg_2_1.type)

			if var_2_0 == 1 then
				arg_2_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_regular"))
			elseif var_2_0 == 2 then
				arg_2_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_hard"))
			elseif var_2_0 == 3 then
				arg_2_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_veteran"))
			elseif var_2_0 == 5 then
				arg_2_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_gos"))
			else
				arg_2_0.Difficulty:SetAlpha(0)
			end
		else
			arg_2_0.Difficulty:SetAlpha(0)
		end
	else
		arg_2_0.Difficulty:SetAlpha(0)

		return
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Description)
	assert(arg_3_0.ProgressBar)
	assert(arg_3_0.ProgressDesc)
	assert(arg_3_0.Reward1)
	assert(arg_3_0.Reward2)
	assert(arg_3_0.Lock)

	arg_3_0.SetData = var_0_0
	arg_3_0.SetDifficulty = var_0_1
	arg_3_0._rewardWidgets = {
		{
			nameLabel = arg_3_0.RewardName1,
			lootCard = arg_3_0.Reward1
		},
		{
			nameLabel = arg_3_0.RewardName2,
			lootCard = arg_3_0.Reward2
		}
	}

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function BarracksChallengeDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 514 * _1080p, 0, 500 * _1080p)

	var_4_0.id = "BarracksChallengeDetails"
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

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Description"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_6:setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 45, _1080p * -27, _1080p * 105, _1080p * 129)
	var_4_0:addElement(var_4_6)

	var_4_0.Description = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ChallengeHeader"

	var_4_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * 1, _1080p * 163, _1080p * 209)
	var_4_0:addElement(var_4_8)

	var_4_0.ChallengeHeader = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "ChallengeTypeHeader"

	var_4_10.Text:setText("Challenge Type", 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * 1, 0, _1080p * 46)
	var_4_0:addElement(var_4_10)

	var_4_0.ChallengeTypeHeader = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "RewardName1"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -190, _1080p * -37, _1080p * 228, _1080p * 252)
	var_4_0:addElement(var_4_12)

	var_4_0.RewardName1 = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "RewardName2"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 40, _1080p * 193, _1080p * 228, _1080p * 252)
	var_4_0:addElement(var_4_14)

	var_4_0.RewardName2 = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "Reward1"

	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -190, _1080p * -40, _1080p * 258, _1080p * 458)
	var_4_0:addElement(var_4_16)

	var_4_0.Reward1 = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "Reward2"

	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 40, _1080p * 190, _1080p * 258, _1080p * 458)
	var_4_0:addElement(var_4_18)

	var_4_0.Reward2 = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "ProgressBar"

	var_4_20.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_20.Overlay:SetAlpha(0.2, 0)
	var_4_20.Fill:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_20:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 45, _1080p * -28, _1080p * 135, _1080p * 153)
	var_4_0:addElement(var_4_20)

	var_4_0.ProgressBar = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIText.new()

	var_4_22.id = "ProgressDesc"

	var_4_22:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_22:setText("99/99", 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_22:SetAlignment(LUI.Alignment.Left)
	var_4_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 49, _1080p * 479, _1080p * 135, _1080p * 153)
	var_4_0:addElement(var_4_22)

	var_4_0.ProgressDesc = var_4_22

	local var_4_23
	local var_4_24 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_4_1
	})

	var_4_24.id = "ChallengeResetTimer"

	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 409, _1080p * 487, _1080p * 8, _1080p * 38)
	var_4_0:addElement(var_4_24)

	var_4_0.ChallengeResetTimer = var_4_24

	local var_4_25
	local var_4_26 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_4_1
	})

	var_4_26.id = "Checkbox"

	var_4_26.Backer:SetAlpha(0.2, 0)
	var_4_26.Frame:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 36, _1080p * 135, _1080p * 153)
	var_4_0:addElement(var_4_26)

	var_4_0.Checkbox = var_4_26

	local var_4_27
	local var_4_28 = LUI.UIImage.new()

	var_4_28.id = "Difficulty"

	var_4_28:SetAlpha(0, 0)
	var_4_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 33, _1080p * 138, _1080p * 150)
	var_4_0:addElement(var_4_28)

	var_4_0.Difficulty = var_4_28

	local var_4_29
	local var_4_30 = LUI.UIImage.new()

	var_4_30.id = "Lock"

	var_4_30:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_4_30:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_30:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -53, _1080p * -5, _1080p * -58, _1080p * -10)
	var_4_0:addElement(var_4_30)

	var_4_0.Lock = var_4_30

	local function var_4_31()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -40
		}
	}

	var_4_4:RegisterAnimationSequence("TitleOff", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		}
	}

	var_4_6:RegisterAnimationSequence("TitleOff", var_4_34)

	local var_4_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_4_8:RegisterAnimationSequence("TitleOff", var_4_35)

	local var_4_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("TitleOff", var_4_36)

	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 192
		}
	}

	var_4_12:RegisterAnimationSequence("TitleOff", var_4_37)

	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 192
		}
	}

	var_4_14:RegisterAnimationSequence("TitleOff", var_4_38)

	local var_4_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 398
		}
	}

	var_4_16:RegisterAnimationSequence("TitleOff", var_4_39)

	local var_4_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 398
		}
	}

	var_4_18:RegisterAnimationSequence("TitleOff", var_4_40)

	local var_4_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 99
		}
	}

	var_4_20:RegisterAnimationSequence("TitleOff", var_4_41)

	local var_4_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 99
		}
	}

	var_4_22:RegisterAnimationSequence("TitleOff", var_4_42)

	local var_4_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 99
		}
	}

	var_4_26:RegisterAnimationSequence("TitleOff", var_4_43)

	local var_4_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 450
		}
	}

	var_4_30:RegisterAnimationSequence("TitleOff", var_4_44)

	local function var_4_45()
		var_4_4:AnimateSequence("TitleOff")
		var_4_6:AnimateSequence("TitleOff")
		var_4_8:AnimateSequence("TitleOff")
		var_4_10:AnimateSequence("TitleOff")
		var_4_12:AnimateSequence("TitleOff")
		var_4_14:AnimateSequence("TitleOff")
		var_4_16:AnimateSequence("TitleOff")
		var_4_18:AnimateSequence("TitleOff")
		var_4_20:AnimateSequence("TitleOff")
		var_4_22:AnimateSequence("TitleOff")
		var_4_26:AnimateSequence("TitleOff")
		var_4_30:AnimateSequence("TitleOff")
	end

	var_4_0._sequences.TitleOff = var_4_45

	local var_4_46
	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_4_4:RegisterAnimationSequence("TitleOn", var_4_47)

	local var_4_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_4_6:RegisterAnimationSequence("TitleOn", var_4_48)

	local var_4_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 185
		}
	}

	var_4_8:RegisterAnimationSequence("TitleOn", var_4_49)

	local var_4_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("TitleOn", var_4_50)

	local var_4_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		}
	}

	var_4_12:RegisterAnimationSequence("TitleOn", var_4_51)

	local var_4_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		}
	}

	var_4_14:RegisterAnimationSequence("TitleOn", var_4_52)

	local var_4_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 434
		}
	}

	var_4_16:RegisterAnimationSequence("TitleOn", var_4_53)

	local var_4_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 434
		}
	}

	var_4_18:RegisterAnimationSequence("TitleOn", var_4_54)

	local var_4_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		}
	}

	var_4_20:RegisterAnimationSequence("TitleOn", var_4_55)

	local var_4_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		}
	}

	var_4_22:RegisterAnimationSequence("TitleOn", var_4_56)

	local var_4_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		}
	}

	var_4_26:RegisterAnimationSequence("TitleOn", var_4_57)

	local function var_4_58()
		var_4_4:AnimateSequence("TitleOn")
		var_4_6:AnimateSequence("TitleOn")
		var_4_8:AnimateSequence("TitleOn")
		var_4_10:AnimateSequence("TitleOn")
		var_4_12:AnimateSequence("TitleOn")
		var_4_14:AnimateSequence("TitleOn")
		var_4_16:AnimateSequence("TitleOn")
		var_4_18:AnimateSequence("TitleOn")
		var_4_20:AnimateSequence("TitleOn")
		var_4_22:AnimateSequence("TitleOn")
		var_4_26:AnimateSequence("TitleOn")
	end

	var_4_0._sequences.TitleOn = var_4_58

	local var_4_59
	local var_4_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 76
		}
	}

	var_4_12:RegisterAnimationSequence("ShowIcon1", var_4_60)

	local var_4_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowIcon1", var_4_61)

	local var_4_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		}
	}

	var_4_16:RegisterAnimationSequence("ShowIcon1", var_4_62)

	local var_4_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ShowIcon1", var_4_63)

	local function var_4_64()
		var_4_12:AnimateSequence("ShowIcon1")
		var_4_14:AnimateSequence("ShowIcon1")
		var_4_16:AnimateSequence("ShowIcon1")
		var_4_18:AnimateSequence("ShowIcon1")
	end

	var_4_0._sequences.ShowIcon1 = var_4_64

	local var_4_65
	local var_4_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -38
		}
	}

	var_4_12:RegisterAnimationSequence("ShowIcon2", var_4_66)

	local var_4_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 192
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowIcon2", var_4_67)

	local var_4_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		}
	}

	var_4_16:RegisterAnimationSequence("ShowIcon2", var_4_68)

	local var_4_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ShowIcon2", var_4_69)

	local function var_4_70()
		var_4_12:AnimateSequence("ShowIcon2")
		var_4_14:AnimateSequence("ShowIcon2")
		var_4_16:AnimateSequence("ShowIcon2")
		var_4_18:AnimateSequence("ShowIcon2")
	end

	var_4_0._sequences.ShowIcon2 = var_4_70

	local var_4_71
	local var_4_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -4 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 130
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_72)

	local var_4_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 225
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 255
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_73)

	local var_4_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 225
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 255
		}
	}

	var_4_14:RegisterAnimationSequence("AR", var_4_74)

	local var_4_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 159
		}
	}

	var_4_22:RegisterAnimationSequence("AR", var_4_75)

	local function var_4_76()
		var_4_6:AnimateSequence("AR")
		var_4_12:AnimateSequence("AR")
		var_4_14:AnimateSequence("AR")
		var_4_22:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_76

	local var_4_77
	local var_4_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		}
	}

	var_4_6:RegisterAnimationSequence("TitleOffAR", var_4_78)

	local var_4_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 195
		}
	}

	var_4_12:RegisterAnimationSequence("TitleOffAR", var_4_79)

	local var_4_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 195
		}
	}

	var_4_14:RegisterAnimationSequence("TitleOffAR", var_4_80)

	local var_4_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 104
		}
	}

	var_4_22:RegisterAnimationSequence("TitleOffAR", var_4_81)

	local function var_4_82()
		var_4_6:AnimateSequence("TitleOffAR")
		var_4_12:AnimateSequence("TitleOffAR")
		var_4_14:AnimateSequence("TitleOffAR")
		var_4_22:AnimateSequence("TitleOffAR")
	end

	var_4_0._sequences.TitleOffAR = var_4_82

	local var_4_83
	local var_4_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_4_0.ProgressBar.Fill
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_4_0.ProgressBar.Overlay
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.ProgressBar.Fill
		}
	}

	var_4_20:RegisterAnimationSequence("Complete", var_4_84)

	local var_4_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.disabledLootCrate
		}
	}

	var_4_22:RegisterAnimationSequence("Complete", var_4_85)

	local var_4_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_4_0.Checkbox.Frame
		}
	}

	var_4_26:RegisterAnimationSequence("Complete", var_4_86)

	local function var_4_87()
		var_4_20:AnimateSequence("Complete")
		var_4_22:AnimateSequence("Complete")
		var_4_26:AnimateSequence("Complete")
	end

	var_4_0._sequences.Complete = var_4_87

	local var_4_88
	local var_4_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle,
			child = var_4_0.ProgressBar.Fill
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_4_0.ProgressBar.Overlay
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.ProgressBar.Fill
		}
	}

	var_4_20:RegisterAnimationSequence("Incomplete", var_4_89)

	local var_4_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_4_22:RegisterAnimationSequence("Incomplete", var_4_90)

	local var_4_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription,
			child = var_4_0.Checkbox.Frame
		}
	}

	var_4_26:RegisterAnimationSequence("Incomplete", var_4_91)

	local function var_4_92()
		var_4_20:AnimateSequence("Incomplete")
		var_4_22:AnimateSequence("Incomplete")
		var_4_26:AnimateSequence("Incomplete")
	end

	var_4_0._sequences.Incomplete = var_4_92

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BarracksChallengeDetails", BarracksChallengeDetails)
LockTable(_M)
