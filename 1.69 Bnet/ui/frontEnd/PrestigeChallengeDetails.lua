module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1.isLocked and "Locked" or "Unlocked")

	if arg_1_1.isLocked then
		arg_1_0.ProgressBar:SetImmediateProgress(0)
		arg_1_0.Reward:SetAlpha(0)
		arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED")))
		arg_1_0.Description:setText(Engine.CBBHFCGDIC("PRESTIGE/UNLOCKED_AT", arg_1_1.challengeSeasonRankMin, arg_1_1.seasonNum))
		arg_1_0.NextTier:SetAlpha(0)
	else
		local var_1_0 = arg_1_1.progress or 0
		local var_1_1 = 0
		local var_1_2 = 0
		local var_1_3 = 0
		local var_1_4 = 0

		for iter_1_0 = 1, PROGRESSION.MAX_CHALLENGE_TIERS_COUNT do
			if arg_1_1["tier" .. tostring(iter_1_0) .. "Quantity"] ~= "" then
				var_1_4 = var_1_4 + 1
			else
				break
			end
		end

		assert(var_1_4 > 0, "SetDetailsFromChallengeData: Challenge does not have valid tier info set.")

		for iter_1_1 = 1, var_1_4 do
			var_1_2 = tonumber(arg_1_1["tier" .. tostring(iter_1_1) .. "Quantity"])
			var_1_3 = tonumber(arg_1_1["tier" .. tostring(iter_1_1) .. "XP"])

			if var_1_0 < var_1_2 then
				var_1_1 = iter_1_1

				break
			end
		end

		local var_1_5 = var_1_0 / math.max(var_1_2, 1)
		local var_1_6 = LUI.clamp(var_1_5, 0, 1)

		arg_1_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CHALLENGE_ITEM_TITLE", arg_1_1._challengeIndex)))
		arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.description, var_1_2))
		arg_1_0.TierMeter:SetTierCount(var_1_4)
		arg_1_0.TierMeter:SetActiveTier(var_1_1)
		arg_1_0.Progress:SetAlpha(1)
		arg_1_0.Progress:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_0, var_1_2))
		arg_1_0.ProgressBar:SetImmediateProgress(var_1_6)
		arg_1_0.Reward:SetAlpha(1)
		arg_1_0.Reward.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", var_1_3 or 0))
		ACTIONS.AnimateSequence(arg_1_0, "RewardMark" .. var_1_1)
		arg_1_0.NextTier:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TIER_X_OF_Y", var_1_1, var_1_4)))

		if var_1_6 >= 1 then
			ACTIONS.AnimateSequence(arg_1_0, "Complete")
		end
	end

	local var_1_7 = "Locked"

	if arg_1_1.isT9Exclusive == "1" then
		var_1_7 = "ExclusiveLocked"
	end

	ACTIONS.AnimateSequence(arg_1_0.Reward.Lock, var_1_7)
	ACTIONS.AnimateSequence(arg_1_0.Reward.Lock, "HideBacking")

	if arg_1_1.isT9Exclusive == "1" then
		ACTIONS.AnimateSequence(arg_1_0, "ExclusiveLocked")
	end

	arg_1_1.isDetailsCard = true

	arg_1_0.CardPreview:SetDetailsFromChallengeData(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetDetailsFromChallengeData = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function PrestigeChallengeDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1090 * _1080p, 0, 124 * _1080p)

	var_3_0.id = "PrestigeChallengeDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "WZContainer"

	var_3_4.TitleBackground:SetLeft(_1080p * 4, 0)
	var_3_4.TitleBackground:SetRight(_1080p * -4, 0)
	var_3_4.TitleBackground:SetTop(_1080p * 19, 0)
	var_3_4.TitleBackground:SetBottom(_1080p * 47, 0)
	var_3_4.TitleBackground:SetAlpha(0, 0)
	var_3_4.Title:SetLeft(_1080p * 14, 0)
	var_3_4.Title:SetRight(_1080p * -14, 0)
	var_3_4.Title:SetTop(_1080p * 19, 0)
	var_3_4.Title:SetBottom(_1080p * 43, 0)
	var_3_4.Title:SetAlpha(0, 0)
	var_3_4.Title:setText("", 0)
	var_3_4.Title:SetAlignment(LUI.Alignment.Center)
	var_3_4.BorderBacker:SetLeft(0, 0)
	var_3_4.BorderBacker:SetRight(0, 0)
	var_3_4.BorderBacker:SetTop(0, 0)
	var_3_4.BorderBacker:SetBottom(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.WZContainer = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ProgressBar"

	var_3_6.DialogueBackground:SetAlpha(0.1, 0)
	var_3_6.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_6.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_3_6.Frame:SetAlpha(0.5, 0)
	var_3_6.Cap:SetAlpha(0, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 430, _1080p * 101, _1080p * 113)
	var_3_0:addElement(var_3_6)

	var_3_0.ProgressBar = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Progress"

	var_3_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 220, _1080p * 431, _1080p * 76, _1080p * 94)
	var_3_0:addElement(var_3_8)

	var_3_0.Progress = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Description"

	var_3_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("MENU/GROUP_CREATE_DESCRIPTION"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 432, _1080p * 33, _1080p * 51)
	var_3_0:addElement(var_3_10)

	var_3_0.Description = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("PrestigeTierReward", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Reward"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 591, _1080p * 651, _1080p * 92, _1080p * 112)
	var_3_0:addElement(var_3_12)

	var_3_0.Reward = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Title"

	var_3_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_14:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE")), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 432, _1080p * 12, _1080p * 36)
	var_3_0:addElement(var_3_14)

	var_3_0.Title = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("ProgressionTierMeter", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "TierMeter"

	var_3_16:SetScale(0.1, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 475, _1080p * 631, _1080p * 38, _1080p * 70)
	var_3_0:addElement(var_3_16)

	var_3_0.TierMeter = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "NextTier"

	var_3_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_18:SetScale(-0.1, 0)
	var_3_18:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEXT_TIER_COLON")), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 458, _1080p * 647, _1080p * 12, _1080p * 30)
	var_3_0:addElement(var_3_18)

	var_3_0.NextTier = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("PrestigeChallengeCard", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "CardPreview"

	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -414, _1080p * -9, _1080p * 12, _1080p * 112)
	var_3_0:addElement(var_3_20)

	var_3_0.CardPreview = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "CompleteLabel"

	var_3_22:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_22:SetAlpha(0, 0)
	var_3_22:setText(Engine.CBBHFCGDIC("LUA_MENU/COMPLETED_CAPS"), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 243, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_22)

	var_3_0.CompleteLabel = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIImage.new()

	var_3_24.id = "MarkedCompleteImage"

	var_3_24:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_24:SetAlpha(0, 0)
	var_3_24:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 28, _1080p * 94, _1080p * 112)
	var_3_0:addElement(var_3_24)

	var_3_0.MarkedCompleteImage = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIImage.new()

	var_3_26.id = "BOSnipe"

	var_3_26:SetAlpha(0, 0)
	var_3_26:setImage(RegisterMaterial("bo_sel_snipe_sm"), 0)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 194, _1080p * 100, _1080p * 125)
	var_3_0:addElement(var_3_26)

	var_3_0.BOSnipe = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIText.new()

	var_3_28.id = "BOExclusiveDesc"

	var_3_28:SetRGBFromTable(SWATCHES.CH2.SnipeOverlayBOColdWar, 0)
	var_3_28:SetAlpha(0, 0)
	var_3_28:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGE_PROGRESS_BO_EXCLUSIVE"), 0)
	var_3_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_28:SetAlignment(LUI.Alignment.Left)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 432, _1080p * 93, _1080p * 101)
	var_3_0:addElement(var_3_28)

	var_3_0.BOExclusiveDesc = var_3_28

	local var_3_29
	local var_3_30 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_31 = LUI.UIBorder.new(var_3_30)

	var_3_31.id = "BorderDetails"

	var_3_31:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_3_31:SetAlpha(0.25, 0)
	var_3_0:addElement(var_3_31)

	var_3_0.BorderDetails = var_3_31

	local function var_3_32()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_36)

	local var_3_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_37)

	local var_3_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Locked", var_3_38)

	local var_3_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Locked", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Locked", var_3_40)

	local var_3_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Locked", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Locked", var_3_42)

	local function var_3_43()
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")
		var_3_16:AnimateSequence("Locked")
		var_3_18:AnimateSequence("Locked")
		var_3_22:AnimateSequence("Locked")
		var_3_24:AnimateSequence("Locked")
		var_3_26:AnimateSequence("Locked")
		var_3_28:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_43

	local var_3_44
	local var_3_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Unlocked", var_3_45)

	local var_3_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Unlocked", var_3_46)

	local var_3_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Unlocked", var_3_47)

	local var_3_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Unlocked", var_3_48)

	local var_3_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Unlocked", var_3_49)

	local var_3_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Unlocked", var_3_50)

	local var_3_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Unlocked", var_3_51)

	local var_3_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Unlocked", var_3_52)

	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Unlocked", var_3_53)

	local function var_3_54()
		var_3_6:AnimateSequence("Unlocked")
		var_3_8:AnimateSequence("Unlocked")
		var_3_12:AnimateSequence("Unlocked")
		var_3_16:AnimateSequence("Unlocked")
		var_3_18:AnimateSequence("Unlocked")
		var_3_22:AnimateSequence("Unlocked")
		var_3_24:AnimateSequence("Unlocked")
		var_3_26:AnimateSequence("Unlocked")
		var_3_28:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_54

	local var_3_55
	local var_3_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ExclusiveLocked", var_3_56)

	local var_3_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ExclusiveLocked", var_3_57)

	local var_3_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 118
		}
	}

	var_3_26:RegisterAnimationSequence("ExclusiveLocked", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -469
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 53
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

	var_3_28:RegisterAnimationSequence("ExclusiveLocked", var_3_59)

	local function var_3_60()
		var_3_16:AnimateSequence("ExclusiveLocked")
		var_3_18:AnimateSequence("ExclusiveLocked")
		var_3_26:AnimateSequence("ExclusiveLocked")
		var_3_28:AnimateSequence("ExclusiveLocked")
	end

	var_3_0._sequences.ExclusiveLocked = var_3_60

	local var_3_61
	local var_3_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Complete", var_3_62)

	local var_3_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Complete", var_3_63)

	local var_3_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Complete", var_3_64)

	local var_3_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Complete", var_3_65)

	local var_3_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Complete", var_3_66)

	local var_3_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Complete", var_3_67)

	local var_3_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Complete", var_3_68)

	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("Complete", var_3_69)

	local var_3_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("Complete", var_3_70)

	local function var_3_71()
		var_3_6:AnimateSequence("Complete")
		var_3_8:AnimateSequence("Complete")
		var_3_12:AnimateSequence("Complete")
		var_3_16:AnimateSequence("Complete")
		var_3_18:AnimateSequence("Complete")
		var_3_22:AnimateSequence("Complete")
		var_3_24:AnimateSequence("Complete")
		var_3_26:AnimateSequence("Complete")
		var_3_28:AnimateSequence("Complete")
	end

	var_3_0._sequences.Complete = var_3_71

	local var_3_72
	local var_3_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 453
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 513
		}
	}

	var_3_12:RegisterAnimationSequence("RewardMark1", var_3_73)

	local function var_3_74()
		var_3_12:AnimateSequence("RewardMark1")
	end

	var_3_0._sequences.RewardMark1 = var_3_74

	local var_3_75
	local var_3_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 488
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 548
		}
	}

	var_3_12:RegisterAnimationSequence("RewardMark2", var_3_76)

	local function var_3_77()
		var_3_12:AnimateSequence("RewardMark2")
	end

	var_3_0._sequences.RewardMark2 = var_3_77

	local var_3_78
	local var_3_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 522
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 582
		}
	}

	var_3_12:RegisterAnimationSequence("RewardMark3", var_3_79)

	local function var_3_80()
		var_3_12:AnimateSequence("RewardMark3")
	end

	var_3_0._sequences.RewardMark3 = var_3_80

	local var_3_81
	local var_3_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 557
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 617
		}
	}

	var_3_12:RegisterAnimationSequence("RewardMark4", var_3_82)

	local function var_3_83()
		var_3_12:AnimateSequence("RewardMark4")
	end

	var_3_0._sequences.RewardMark4 = var_3_83

	local var_3_84
	local var_3_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 591
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 651
		}
	}

	var_3_12:RegisterAnimationSequence("RewardMark5", var_3_85)

	local function var_3_86()
		var_3_12:AnimateSequence("RewardMark5")
	end

	var_3_0._sequences.RewardMark5 = var_3_86

	local var_3_87
	local var_3_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 435
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_88)

	local var_3_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_89)

	local function var_3_90()
		var_3_10:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_90

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PrestigeChallengeDetails", PrestigeChallengeDetails)
LockTable(_M)
