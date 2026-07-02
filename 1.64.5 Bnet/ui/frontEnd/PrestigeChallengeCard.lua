module(..., package.seeall)

function SetDetailsFromChallengeData(arg_1_0, arg_1_1)
	assert(arg_1_1)

	arg_1_0._challengeData = arg_1_1

	arg_1_0.WZContainer:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CHALLENGE_ITEM_TITLE", arg_1_1._challengeIndex), {
		useUppercase = true,
		useRegularFont = true
	})

	local var_1_0 = arg_1_1.callingCard

	if var_1_0 ~= nil and var_1_0 ~= "" then
		arg_1_0.Card:setImage(RegisterMaterial(var_1_0))
	else
		DebugPrint("PrestigeChallengeCard - SetDetailsFromChallengeData() : Invalid 'callingCard' image is passed in for challengeRef: " .. arg_1_1.challengeRef .. ", make sure the 'callingCard' column has valid data in CSV.seasonalProgressionChallenges")
	end

	local var_1_1 = arg_1_1.isLocked and "Locked" or "Unlocked"

	ACTIONS.AnimateSequence(arg_1_0, var_1_1)

	if arg_1_1.isT9Exclusive == "1" then
		ACTIONS.AnimateSequence(arg_1_0.Lock, "ExclusiveLocked")
	end

	if arg_1_1.isMastery == "1" then
		ACTIONS.AnimateSequence(arg_1_0, "Mastery")
	end

	local var_1_2 = arg_1_0.GetChallengeProgressDetails(arg_1_0, arg_1_1)

	if not arg_1_1.isLocked and not arg_1_1.isDetailsCard then
		arg_1_0.UpdateProgressBar(arg_1_0, var_1_2)

		if var_1_2.isComplete then
			ACTIONS.AnimateSequence(arg_1_0, "Complete")
		end
	end

	if arg_1_1.isDetailsCard then
		if var_1_2.isComplete then
			ACTIONS.AnimateSequence(arg_1_0, "DetailsPreviewCardComplete")
		elseif arg_1_1.isLocked then
			ACTIONS.AnimateSequence(arg_1_0, "DetailsPreviewCardClassified")
		else
			ACTIONS.AnimateSequence(arg_1_0, "DetailsPreviewCard")
		end
	end
end

local function var_0_0(arg_2_0, arg_2_1)
	if arg_2_1.isInProgress then
		arg_2_0.ChallengeProgressCount:SetAlpha(1)
		arg_2_0.ChallengeProgressBar:SetAlpha(1)
	else
		arg_2_0.ChallengeProgressCount:SetAlpha(0)
		arg_2_0.ChallengeProgressBar:SetAlpha(0)
	end

	arg_2_0.ChallengeProgressCount:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_2_1.progressVal, arg_2_1.progressGoal))
	arg_2_0.ChallengeProgressBar:SetImmediateProgress(arg_2_1.progressPct)
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = arg_3_1.progress or 0
	local var_3_2 = 0
	local var_3_3 = 0
	local var_3_4 = 0
	local var_3_5 = 0

	for iter_3_0 = 1, PROGRESSION.MAX_CHALLENGE_TIERS_COUNT do
		if arg_3_1["tier" .. tostring(iter_3_0) .. "Quantity"] ~= "" then
			var_3_5 = var_3_5 + 1
		else
			break
		end
	end

	for iter_3_1 = 1, var_3_5 do
		var_3_3 = tonumber(arg_3_1["tier" .. tostring(iter_3_1) .. "Quantity"])

		if var_3_1 < var_3_3 then
			local var_3_6 = iter_3_1

			break
		end
	end

	local var_3_7 = var_3_1 / math.max(var_3_3, 1)
	local var_3_8 = LUI.clamp(var_3_7, 0, 1)

	var_3_0.progressPct = var_3_8
	var_3_0.progressVal = var_3_1
	var_3_0.progressGoal = var_3_3
	var_3_0.isComplete = var_3_3 <= var_3_1
	var_3_0.isInProgress = var_3_8 > 0

	return var_3_0
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetDetailsFromChallengeData = SetDetailsFromChallengeData
	arg_4_0.UpdateProgressBar = var_0_0
	arg_4_0.GetChallengeProgressDetails = var_0_1

	THEMES.ApplyRandomMaskRotation(arg_4_0, {
		byPassSetMask = true,
		masker = arg_4_0.ClassifiedOverlay
	})
	ACTIONS.AnimateSequence(arg_4_0.LockClassified, "LockOnly")

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function PrestigeChallengeCard(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 266 * _1080p, 0, 92 * _1080p)

	var_5_0.id = "PrestigeChallengeCard"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "WZContainer"

	var_5_4.TitleBackground:SetLeft(_1080p * 1, 0)
	var_5_4.TitleBackground:SetRight(_1080p * -1, 0)
	var_5_4.TitleBackground:SetTop(_1080p * 68, 0)
	var_5_4.TitleBackground:SetBottom(_1080p * 91, 0)
	var_5_4.Title:SetLeft(_1080p * 7, 0)
	var_5_4.Title:SetRight(_1080p * -14, 0)
	var_5_4.Title:SetTop(_1080p * 69, 0)
	var_5_4.Title:SetBottom(_1080p * 87, 0)
	var_5_4.Title:SetAlpha(0.5, 0)
	var_5_4.Title:setText(ToUpperCase(""), 0)
	var_5_4.Title:SetAlignment(LUI.Alignment.Center)
	var_5_4.BorderBacker:SetLeft(0, 0)
	var_5_4.BorderBacker:SetRight(0, 0)
	var_5_4.BorderBacker:SetTop(0, 0)
	var_5_4.BorderBacker:SetBottom(0, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.WZContainer = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ChallengeProgressBar"

	var_5_6:SetAlpha(0, 0)
	var_5_6.DialogueBackground:SetAlpha(0.1, 0)
	var_5_6.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_5_6.Frame:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_5_6.Frame:SetAlpha(0, 0)
	var_5_6.Cap:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_5_6.Cap:SetAlpha(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 265, _1080p * 86, _1080p * 91)
	var_5_0:addElement(var_5_6)

	var_5_0.ChallengeProgressBar = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "ChallengeProgressCount"

	var_5_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:SetScale(-0.2, 0)
	var_5_8:setText("&&1/&&1", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:setTextStyle(CoD.TextStyle.Shadowed)
	var_5_8:SetAlignment(LUI.Alignment.Right)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -80, _1080p * 5, _1080p * 68, _1080p * 86)
	var_5_0:addElement(var_5_8)

	var_5_0.ChallengeProgressCount = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Card"

	var_5_10:SetRGBFromTable(SWATCHES.CH2.NeutralGray, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 264, _1080p * 1, _1080p * 68)
	var_5_0:addElement(var_5_10)

	var_5_0.Card = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "ClassifiedOverlay"

	var_5_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_5_12:SetAlpha(0.5, 0)
	var_5_12:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1)
	var_5_0:addElement(var_5_12)

	var_5_0.ClassifiedOverlay = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("PrestigeLock", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "Lock"

	var_5_14.Lock:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_5_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -43, _1080p * -3, _1080p * 3, _1080p * 43)
	var_5_0:addElement(var_5_14)

	var_5_0.Lock = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("PrestigeLock", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "LockClassified"

	var_5_16.Backing:SetAlpha(0, 0)
	var_5_16.Lock:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_16.Lock:SetAlpha(0.05, 0)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -31, _1080p * 9)
	var_5_0:addElement(var_5_16)

	var_5_0.LockClassified = var_5_16

	local function var_5_17()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_17

	local var_5_18
	local var_5_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.MainMenuLines
		}
	}

	var_5_10:RegisterAnimationSequence("WZWipSetup", var_5_19)

	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 272
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 296
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipSetup", var_5_20)

	local function var_5_21()
		var_5_10:AnimateSequence("WZWipSetup")
		var_5_14:AnimateSequence("WZWipSetup")
	end

	var_5_0._sequences.WZWipSetup = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightBottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightTop
		}
	}

	var_5_4:RegisterAnimationSequence("Active", var_5_23)

	local var_5_24 = {
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_5_6:RegisterAnimationSequence("Active", var_5_24)

	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		}
	}

	var_5_8:RegisterAnimationSequence("Active", var_5_25)

	local var_5_26 = {
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_5_10:RegisterAnimationSequence("Active", var_5_26)

	local var_5_27 = {
		{
			value = -0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_14:RegisterAnimationSequence("Active", var_5_27)

	local function var_5_28()
		var_5_4:AnimateLoop("Active")
		var_5_6:AnimateLoop("Active")
		var_5_8:AnimateLoop("Active")
		var_5_10:AnimateLoop("Active")
		var_5_14:AnimateLoop("Active")
	end

	var_5_0._sequences.Active = var_5_28

	local var_5_29
	local var_5_30 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 370
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 93
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("DetailsPreviewCard", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("DetailsPreviewCard", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 402
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 362
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
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_5_14:RegisterAnimationSequence("DetailsPreviewCard", var_5_32)

	local function var_5_33()
		var_5_10:AnimateSequence("DetailsPreviewCard")
		var_5_12:AnimateSequence("DetailsPreviewCard")
		var_5_14:AnimateSequence("DetailsPreviewCard")
	end

	var_5_0._sequences.DetailsPreviewCard = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Unlocked", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Unlocked", var_5_36)

	local var_5_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_5_0.Lock.Backing
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_5_0.Lock.Lock
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Lock.Lock
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Lock.Backing
		}
	}

	var_5_14:RegisterAnimationSequence("Unlocked", var_5_37)

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Unlocked", var_5_38)

	local function var_5_39()
		var_5_10:AnimateSequence("Unlocked")
		var_5_12:AnimateSequence("Unlocked")
		var_5_14:AnimateSequence("Unlocked")
		var_5_16:AnimateSequence("Unlocked")
	end

	var_5_0._sequences.Unlocked = var_5_39

	local var_5_40
	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED")),
			child = var_5_0.WZContainer.Title
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED")),
			child = var_5_0.WZContainer.Title
		}
	}

	var_5_4:RegisterAnimationSequence("Locked", var_5_41)

	local var_5_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Locked", var_5_42)

	local var_5_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Locked", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_5_10:RegisterAnimationSequence("Locked", var_5_44)

	local var_5_45 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Locked", var_5_45)

	local var_5_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_5_0.Lock.Backing
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Lock.Backing
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_5_0.Lock.Lock
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Lock.Lock
		}
	}

	var_5_14:RegisterAnimationSequence("Locked", var_5_46)

	local var_5_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Locked", var_5_47)

	local function var_5_48()
		var_5_4:AnimateSequence("Locked")
		var_5_6:AnimateSequence("Locked")
		var_5_8:AnimateSequence("Locked")
		var_5_10:AnimateSequence("Locked")
		var_5_12:AnimateSequence("Locked")
		var_5_14:AnimateSequence("Locked")
		var_5_16:AnimateSequence("Locked")
	end

	var_5_0._sequences.Locked = var_5_48

	local var_5_49
	local var_5_50 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightBottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightTop
		}
	}

	var_5_4:RegisterAnimationSequence("Inactive", var_5_50)

	local var_5_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_6:RegisterAnimationSequence("Inactive", var_5_51)

	local var_5_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		}
	}

	var_5_10:RegisterAnimationSequence("Inactive", var_5_52)

	local var_5_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_14:RegisterAnimationSequence("Inactive", var_5_53)

	local function var_5_54()
		var_5_4:AnimateSequence("Inactive")
		var_5_6:AnimateSequence("Inactive")
		var_5_10:AnimateSequence("Inactive")
		var_5_14:AnimateSequence("Inactive")
	end

	var_5_0._sequences.Inactive = var_5_54

	local function var_5_55()
		return
	end

	var_5_0._sequences.ActiveNoBorder = var_5_55

	local var_5_56
	local var_5_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.TitleBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -13,
			child = var_5_0.WZContainer.BorderBacker
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.Title
		}
	}

	var_5_4:RegisterAnimationSequence("NoTitleAndBacker", var_5_57)

	local var_5_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 266
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		}
	}

	var_5_10:RegisterAnimationSequence("NoTitleAndBacker", var_5_58)

	local var_5_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 221
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 263
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_5_14:RegisterAnimationSequence("NoTitleAndBacker", var_5_59)

	local function var_5_60()
		var_5_4:AnimateSequence("NoTitleAndBacker")
		var_5_10:AnimateSequence("NoTitleAndBacker")
		var_5_14:AnimateSequence("NoTitleAndBacker")
	end

	var_5_0._sequences.NoTitleAndBacker = var_5_60

	local var_5_61
	local var_5_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Complete", var_5_62)

	local var_5_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Complete", var_5_63)

	local var_5_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Complete", var_5_64)

	local var_5_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Complete", var_5_65)

	local function var_5_66()
		var_5_6:AnimateSequence("Complete")
		var_5_8:AnimateSequence("Complete")
		var_5_10:AnimateSequence("Complete")
		var_5_14:AnimateSequence("Complete")
	end

	var_5_0._sequences.Complete = var_5_66

	local var_5_67
	local var_5_68 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 370
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("DetailsPreviewCardComplete", var_5_68)

	local var_5_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 331
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 372
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_5_14:RegisterAnimationSequence("DetailsPreviewCardComplete", var_5_69)

	local function var_5_70()
		var_5_10:AnimateSequence("DetailsPreviewCardComplete")
		var_5_14:AnimateSequence("DetailsPreviewCardComplete")
	end

	var_5_0._sequences.DetailsPreviewCardComplete = var_5_70

	local var_5_71
	local var_5_72 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 370
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 93
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("DetailsPreviewCardClassified", var_5_72)

	local var_5_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("DetailsPreviewCardClassified", var_5_73)

	local var_5_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 362
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 402
		}
	}

	var_5_14:RegisterAnimationSequence("DetailsPreviewCardClassified", var_5_74)

	local function var_5_75()
		var_5_10:AnimateSequence("DetailsPreviewCardClassified")
		var_5_12:AnimateSequence("DetailsPreviewCardClassified")
		var_5_14:AnimateSequence("DetailsPreviewCardClassified")
	end

	var_5_0._sequences.DetailsPreviewCardClassified = var_5_75

	local var_5_76
	local var_5_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -266
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -211
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_77)

	local function var_5_78()
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_78

	local var_5_79
	local var_5_80 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightTop
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightBottom
		}
	}

	var_5_4:RegisterAnimationSequence("InactiveAR", var_5_80)

	local var_5_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_6:RegisterAnimationSequence("InactiveAR", var_5_81)

	local var_5_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		}
	}

	var_5_8:RegisterAnimationSequence("InactiveAR", var_5_82)

	local var_5_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		}
	}

	var_5_10:RegisterAnimationSequence("InactiveAR", var_5_83)

	local function var_5_84()
		var_5_4:AnimateSequence("InactiveAR")
		var_5_6:AnimateSequence("InactiveAR")
		var_5_8:AnimateSequence("InactiveAR")
		var_5_10:AnimateSequence("InactiveAR")
	end

	var_5_0._sequences.InactiveAR = var_5_84

	local var_5_85
	local var_5_86 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightTop
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.WZContainer.HighlightBottom
		}
	}

	var_5_4:RegisterAnimationSequence("ActiveAR", var_5_86)

	local var_5_87 = {
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_5_6:RegisterAnimationSequence("ActiveAR", var_5_87)

	local var_5_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 87
		}
	}

	var_5_8:RegisterAnimationSequence("ActiveAR", var_5_88)

	local var_5_89 = {
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_5_10:RegisterAnimationSequence("ActiveAR", var_5_89)

	local function var_5_90()
		var_5_4:AnimateLoop("ActiveAR")
		var_5_6:AnimateLoop("ActiveAR")
		var_5_8:AnimateLoop("ActiveAR")
		var_5_10:AnimateLoop("ActiveAR")
	end

	var_5_0._sequences.ActiveAR = var_5_90

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("PrestigeChallengeCard", PrestigeChallengeCard)
LockTable(_M)
