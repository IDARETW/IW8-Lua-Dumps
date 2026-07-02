module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0._rewardIcons) do
		iter_1_1:SetAlpha(0)
	end

	if arg_1_1 and #arg_1_1 > 0 then
		local var_1_0 = math.min(#arg_1_1, #arg_1_0._rewardIcons)

		for iter_1_2 = 1, var_1_0 do
			local var_1_1 = arg_1_1[iter_1_2]
			local var_1_2 = arg_1_0._rewardIcons[iter_1_2]

			if var_1_1 and var_1_2 and var_1_1.typeIconRendered and #var_1_1.typeIconRendered > 0 then
				if var_1_1.typeIconRenderedScale then
					var_1_2:SetScale(var_1_1.typeIconRenderedScale)
				end

				var_1_2:setImage(RegisterMaterial(var_1_1.typeIconRendered))
				var_1_2:SetAlpha(1)
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	var_0_0(arg_2_0, arg_2_1.rewards)

	if arg_2_1.progress then
		arg_2_0.ProgressBar:SetProgress(math.min(arg_2_1.progress, 1), 0, 0)
	else
		arg_2_0.ProgressBar:SetAlpha(0)
	end

	if arg_2_1.amountEarned and arg_2_1.amountNeeded then
		arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", math.min(arg_2_1.amountEarned, arg_2_1.amountNeeded), arg_2_1.amountNeeded))
	else
		arg_2_0.ProgressDesc:SetAlpha(0)
	end

	local var_2_0 = ""

	if arg_2_1.desc and #arg_2_1.desc > 0 and arg_2_1.amount and #arg_2_1.amount > 0 then
		var_2_0 = Engine.CBBHFCGDIC(arg_2_1.desc, arg_2_1.amount)
	end

	if arg_2_2 then
		local var_2_1, var_2_2 = Challenge.GetQuestStageByRef(arg_2_1.ref)
		local var_2_3 = Engine.CBBHFCGDIC("CHALLENGE/MISSION_PROGRESS_DESC", var_2_2, arg_2_1.totalStageValue, var_2_0)

		arg_2_0.Title:setText(var_2_3)
	else
		arg_2_0.Title:setText(var_2_0)
	end

	if arg_2_1.progress == 1 then
		if arg_2_0.Checkbox then
			arg_2_0.Checkbox:SetValue(true, true)
		end

		ACTIONS.AnimateSequence(arg_2_0, "Complete")
	else
		if arg_2_0.Checkbox then
			arg_2_0.Checkbox:SetValue(false, true)
		end

		ACTIONS.AnimateSequence(arg_2_0, "Incomplete")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if not arg_2_1.unlocked then
		arg_2_0.Lock:SetAlpha(1)
	else
		arg_2_0.Lock:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = Challenge.GetDifficulty(arg_3_1.id, arg_3_1.type)

	if not arg_3_1.isComplete then
		arg_3_0.Difficulty:SetAlpha(1)

		if var_3_0 == Challenge.Difficulty.REGULAR then
			arg_3_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_regular"))
		elseif var_3_0 == Challenge.Difficulty.HARDENED then
			arg_3_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_hard"))
		elseif var_3_0 == Challenge.Difficulty.VETERAN then
			arg_3_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_veteran"))
		elseif var_3_0 == Challenge.Difficulty.GAMES_OF_SUMMER then
			arg_3_0.Difficulty:setImage(RegisterMaterial("icon_challenge_difficulty_gos"))
		else
			arg_3_0.Difficulty:SetAlpha(0)
		end
	else
		arg_3_0.Difficulty:SetAlpha(0)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.RewardIcon1)
	assert(arg_4_0.RewardIcon2)
	assert(arg_4_0.Lock)

	arg_4_0._rewardIcons = {
		arg_4_0.RewardIcon1,
		arg_4_0.RewardIcon2
	}
	arg_4_0.SetData = var_0_1
	arg_4_0.SetDifficulty = var_0_2

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function ChallengesSummaryItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 90 * _1080p)

	var_5_0.id = "ChallengesSummaryItem"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "Title"

	var_5_4:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_5_4:setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_4:SetStartupDelay(1000)
	var_5_4:SetLineHoldTime(400)
	var_5_4:SetAnimMoveTime(1000)
	var_5_4:SetAnimMoveSpeed(150)
	var_5_4:SetEndDelay(1000)
	var_5_4:SetCrossfadeTime(1000)
	var_5_4:SetFadeInTime(300)
	var_5_4:SetFadeOutTime(300)
	var_5_4:SetMaxVisibleLines(2)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -93, _1080p * 31, _1080p * 53)
	var_5_0:addElement(var_5_4)

	var_5_0.Title = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "RewardIcon1"

	var_5_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -37, _1080p * -4, _1080p * 21, _1080p * 53)
	var_5_0:addElement(var_5_6)

	var_5_0.RewardIcon1 = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "RewardIcon2"

	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -74, _1080p * -41, _1080p * 21, _1080p * 53)
	var_5_0:addElement(var_5_8)

	var_5_0.RewardIcon2 = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "ProgressBar"

	var_5_10.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_10.Overlay:SetAlpha(0.2, 0)
	var_5_10.Fill:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, 0, _1080p * 58, _1080p * 76)
	var_5_0:addElement(var_5_10)

	var_5_0.ProgressBar = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "ProgressDesc"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.backgroundDisabledFocus, 0)
	var_5_12:setText("99/99", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 363, _1080p * 58, _1080p * 76)
	var_5_0:addElement(var_5_12)

	var_5_0.ProgressDesc = var_5_12

	local var_5_13

	if not CONDITIONS.InGameAndBR() then
		var_5_13 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
			controllerIndex = var_5_1
		})
		var_5_13.id = "Checkbox"

		var_5_13.Backer:SetAlpha(0.2, 0)
		var_5_13.Frame:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
		var_5_13.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
		var_5_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -18, 0, _1080p * 58, _1080p * 76)
		var_5_0:addElement(var_5_13)

		var_5_0.Checkbox = var_5_13
	end

	local var_5_14
	local var_5_15 = LUI.UIImage.new()

	var_5_15.id = "Difficulty"

	var_5_15:SetAlpha(0, 0)
	var_5_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -15, _1080p * -3, _1080p * 61, _1080p * 73)
	var_5_0:addElement(var_5_15)

	var_5_0.Difficulty = var_5_15

	local var_5_16
	local var_5_17 = LUI.UIImage.new()

	var_5_17.id = "Lock"

	var_5_17:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_5_17:SetAlpha(0, 0)
	var_5_17:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 1, _1080p * 33, _1080p * 49, _1080p * 81)
	var_5_0:addElement(var_5_17)

	var_5_0.Lock = var_5_17

	local function var_5_18()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Top
		}
	}

	var_5_4:RegisterAnimationSequence("TitleOnly", var_5_20)

	local var_5_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("TitleOnly", var_5_21)

	local var_5_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("TitleOnly", var_5_22)

	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("TitleOnly", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("TitleOnly", var_5_24)

	if not CONDITIONS.InGameAndBR() then
		local var_5_25 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_13:RegisterAnimationSequence("TitleOnly", var_5_25)
	end

	local function var_5_26()
		var_5_4:AnimateSequence("TitleOnly")
		var_5_6:AnimateSequence("TitleOnly")
		var_5_8:AnimateSequence("TitleOnly")
		var_5_10:AnimateSequence("TitleOnly")
		var_5_12:AnimateSequence("TitleOnly")

		if not CONDITIONS.InGameAndBR() then
			var_5_13:AnimateSequence("TitleOnly")
		end
	end

	var_5_0._sequences.TitleOnly = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		}
	}

	var_5_4:RegisterAnimationSequence("AR", var_5_28)

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_29)

	local function var_5_30()
		var_5_4:AnimateSequence("AR")
		var_5_12:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_5_0.ProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_10:RegisterAnimationSequence("Complete", var_5_32)

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocusAlt
		}
	}

	var_5_12:RegisterAnimationSequence("Complete", var_5_33)

	if not CONDITIONS.InGameAndBR() then
		local var_5_34 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault,
				child = var_5_0.Checkbox.Frame
			}
		}

		var_5_13:RegisterAnimationSequence("Complete", var_5_34)
	end

	local function var_5_35()
		var_5_10:AnimateSequence("Complete")
		var_5_12:AnimateSequence("Complete")

		if not CONDITIONS.InGameAndBR() then
			var_5_13:AnimateSequence("Complete")
		end
	end

	var_5_0._sequences.Complete = var_5_35

	local var_5_36
	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle,
			child = var_5_0.ProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_10:RegisterAnimationSequence("Incomplete", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		}
	}

	var_5_12:RegisterAnimationSequence("Incomplete", var_5_38)

	if not CONDITIONS.InGameAndBR() then
		local var_5_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.AAR.AARdescription,
				child = var_5_0.Checkbox.Frame
			}
		}

		var_5_13:RegisterAnimationSequence("Incomplete", var_5_39)
	end

	local function var_5_40()
		var_5_10:AnimateSequence("Incomplete")
		var_5_12:AnimateSequence("Incomplete")

		if not CONDITIONS.InGameAndBR() then
			var_5_13:AnimateSequence("Incomplete")
		end
	end

	var_5_0._sequences.Incomplete = var_5_40

	local var_5_41
	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipSetup", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_10:RegisterAnimationSequence("WZWipSetup", var_5_43)

	if not CONDITIONS.InGameAndBR() then
		local var_5_44 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.CH2Neutral,
				child = var_5_0.Checkbox.Frame
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText,
				child = var_5_0.Checkbox.Fill
			}
		}

		var_5_13:RegisterAnimationSequence("WZWipSetup", var_5_44)
	end

	local function var_5_45()
		var_5_4:AnimateSequence("WZWipSetup")
		var_5_10:AnimateSequence("WZWipSetup")

		if not CONDITIONS.InGameAndBR() then
			var_5_13:AnimateSequence("WZWipSetup")
		end
	end

	var_5_0._sequences.WZWipSetup = var_5_45

	local var_5_46
	local var_5_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_4:RegisterAnimationSequence("HigherContrast", var_5_47)

	local function var_5_48()
		var_5_4:AnimateSequence("HigherContrast")
	end

	var_5_0._sequences.HigherContrast = var_5_48

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ChallengesSummaryItem", ChallengesSummaryItem)
LockTable(_M)
