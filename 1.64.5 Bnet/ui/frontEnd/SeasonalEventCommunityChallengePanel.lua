module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = #arg_1_1

	arg_1_0.GridPreview:SetNumChildren(var_1_0)
	arg_1_0.GridPreview:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_2 + 1
		local var_2_1 = arg_1_1[var_2_0]

		arg_2_0._row = arg_2_2
		arg_2_0._challengeIndex = var_2_0

		arg_2_0:SetupData(var_2_1)
	end)
	arg_1_0.GridPreview:RefreshContent()
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.ChallengeDesc:setText(Engine.CBBHFCGDIC(arg_3_1.challengeDesc))
	arg_3_0.NextUnlockText:setText(Engine.CBBHFCGDIC(arg_3_1.nextUnlockName))
	arg_3_0.RewardImage:setImage(RegisterMaterial(arg_3_1.nextUnlockImage))

	arg_3_0.challengeId = arg_3_1.id

	local var_3_0 = arg_3_1.challengeInfo
	local var_3_1 = var_3_0.globalProgress

	arg_3_0.ProgressDesc:setText(LUI.FormatLargeNumber(var_3_1) .. "/" .. LUI.FormatLargeNumber(arg_3_1.maxValue))
	arg_3_0.ChallengeProgress:SetProgress(var_3_1 / arg_3_1.maxValue)

	if var_3_0.playerProgress > 0 then
		arg_3_0.ChallengePlayerProgressDesc:setText(Engine.CBBHFCGDIC(arg_3_1.challengePlayerProgressDesc, var_3_0.playerProgress))
	else
		arg_3_0.ChallengePlayerProgressDesc:setText(Engine.CBBHFCGDIC(""))
	end

	local var_3_2 = arg_3_1.isComplete or Dvar.IBEGCHEFE("lui_test_force_cm_ch_complete_" .. arg_3_1.id)
	local var_3_3 = not arg_3_1.isAvailable
	local var_3_4 = var_3_0.challengeFound and not Dvar.IBEGCHEFE("lui_test_force_cm_ch_locked_" .. arg_3_1.id)

	if var_3_2 then
		ACTIONS.AnimateSequence(arg_3_0, "CompletedChallenge")

		arg_3_0.shouldShowComplete = not SEASONAL_EVENT.GetSeenUnlockID(arg_3_0._controllerIndex, arg_3_1.id)
	elseif var_3_3 then
		ACTIONS.AnimateSequence(arg_3_0, "StandbyChallenge")
		arg_3_0.ChallengeInProgressText:setText(arg_3_1.standbyText, 0)
	elseif var_3_4 then
		ACTIONS.AnimateSequence(arg_3_0, "ActiveChallenge")
	else
		ACTIONS.AnimateSequence(arg_3_0, "UpcomingChallenge")
	end

	arg_3_0._communityChallengeData = arg_3_1
end

local function var_0_2(arg_4_0)
	ACTIONS.AnimateSequence(arg_4_0, "CompleteAnim")
	SEASONAL_EVENT.SetSeenUnlockID(arg_4_0._controllerIndex, arg_4_0.challengeId)

	arg_4_0.shouldShowComplete = false
end

local function var_0_3(arg_5_0)
	arg_5_0:addEventHandler("updated_community_challenge_progress", function(arg_6_0, arg_6_1)
		if not arg_5_0._communityChallengeData then
			return
		end

		if arg_6_1.id == arg_5_0._communityChallengeData.challengeId then
			local var_6_0 = arg_5_0._communityChallengeData
			local var_6_1 = LUI.ShallowCopy(var_6_0.challengeInfo)

			var_6_1.globalProgress = arg_6_1.globalProgress
			var_6_1.playerProgress = arg_6_1.playerProgress

			local var_6_2 = SEASONAL_EVENT.AdjustProgressWithCommunityChallengeData(var_6_1, var_6_0)

			if var_6_2.playerProgress > var_6_0.challengeInfo.playerProgress or var_6_2.globalProgress > var_6_0.challengeInfo.globalProgress then
				arg_5_0._communityChallengeData.challengeInfo = var_6_2

				var_0_1(arg_6_0, arg_5_0._communityChallengeData)
			end
		end
	end)
	arg_5_0:addEventHandler("completed_community_challenge", function(arg_7_0, arg_7_1)
		if not arg_5_0._communityChallengeData then
			return
		end

		if arg_7_1.id == arg_5_0._communityChallengeData.challengeId then
			arg_5_0._communityChallengeData.challengeInfo.globalProgress = arg_5_0._communityChallengeData.maxValue

			var_0_1(arg_7_0, arg_5_0._communityChallengeData)
		end
	end)
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0.SetData = var_0_1
	arg_8_0.SetupPreviewsGrid = var_0_0
	arg_8_0.ShowCompleteAnim = var_0_2

	var_0_3(arg_8_0)
end

function SeasonalEventCommunityChallengePanel(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 315 * _1080p)

	var_9_0.id = "SeasonalEventCommunityChallengePanel"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Backer"

	var_9_4:setImage(RegisterMaterial("logo_cod_wz_s4_event"), 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1200, 0, _1080p * 315)
	var_9_0:addElement(var_9_4)

	var_9_0.Backer = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "RewardImage"

	var_9_6:setImage(RegisterMaterial("placeholder_x"), 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 430, _1080p * -90, 0, _1080p * 315)
	var_9_0:addElement(var_9_6)

	var_9_0.RewardImage = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "NextUnlockText"

	var_9_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_9_8:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/REBIRTH_EVENT"), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_8:SetWordWrap(false)
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetStartupDelay(1600)
	var_9_8:SetLineHoldTime(1500)
	var_9_8:SetAnimMoveTime(2000)
	var_9_8:SetAnimMoveSpeed(50)
	var_9_8:SetEndDelay(1000)
	var_9_8:SetCrossfadeTime(400)
	var_9_8:SetFadeInTime(300)
	var_9_8:SetFadeOutTime(300)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 621, _1080p * 1121, _1080p * 224, _1080p * 254)
	var_9_0:addElement(var_9_8)

	var_9_0.NextUnlockText = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIText.new()

	var_9_10.id = "UnlocksText"

	var_9_10:SetRGBFromTable(SWATCHES.EventPromos.ArmoredRebirthGray, 0)
	var_9_10:setText(Engine.CBBHFCGDIC("AAR/UNLOCKS"), 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_10:SetAlignment(LUI.Alignment.Left)
	var_9_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 621, _1080p * 1121, _1080p * 202, _1080p * 220)
	var_9_0:addElement(var_9_10)

	var_9_0.UnlocksText = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIStyledText.new()

	var_9_12.id = "ProgressDesc"

	var_9_12:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_9_12:setText("1/10000", 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetWordWrap(false)
	var_9_12:SetAlignment(LUI.Alignment.Right)
	var_9_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 313, _1080p * 575, _1080p * 182, _1080p * 202)
	var_9_0:addElement(var_9_12)

	var_9_0.ProgressDesc = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIStyledText.new()

	var_9_14.id = "ChallengePlayerProgressDesc"

	var_9_14:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_9_14:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_PROGRESS_1"), 0)
	var_9_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_14:SetWordWrap(false)
	var_9_14:SetAlignment(LUI.Alignment.Left)
	var_9_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 505, _1080p * 208, _1080p * 229)
	var_9_0:addElement(var_9_14)

	var_9_0.ChallengePlayerProgressDesc = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "ChallengeProgress"

	var_9_16.Overlay:SetRGBFromTable(SWATCHES.BattlePass.BRVIPDarkGray, 0)
	var_9_16.Fill:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_9_16.Fill:SetAlpha(0.93, 0)
	var_9_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 575, _1080p * 150, _1080p * 170)
	var_9_0:addElement(var_9_16)

	var_9_0.ChallengeProgress = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIText.new()

	var_9_18.id = "ChallengeDesc"

	var_9_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_9_18:setText(Engine.CBBHFCGDIC("MENU/PLACEHOLDER"), 0)
	var_9_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_18:SetAlignment(LUI.Alignment.Left)
	var_9_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 461, _1080p * 90, _1080p * 112)
	var_9_0:addElement(var_9_18)

	var_9_0.ChallengeDesc = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIText.new()

	var_9_20.id = "ChallengeTitle"

	var_9_20:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_9_20:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CHALLENGES"), 0)
	var_9_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_20:SetAlignment(LUI.Alignment.Left)
	var_9_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 586, _1080p * 28, _1080p * 64)
	var_9_0:addElement(var_9_20)

	var_9_0.ChallengeTitle = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIImage.new()

	var_9_22.id = "BarEffect"

	var_9_22:setImage(RegisterMaterial("logo_cod_wz_s4_event"), 0)
	var_9_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 608, _1080p * 68, _1080p * 206)
	var_9_0:addElement(var_9_22)

	var_9_0.BarEffect = var_9_22

	local var_9_23
	local var_9_24 = LUI.UIImage.new()

	var_9_24.id = "Darkener"

	var_9_24:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_24:SetAlpha(0, 0)
	var_9_24:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 79, _1080p * 1110, 0, _1080p * 315)
	var_9_0:addElement(var_9_24)

	var_9_0.Darkener = var_9_24

	local var_9_25
	local var_9_26 = LUI.UIImage.new()

	var_9_26.id = "Checkmark"

	var_9_26:SetAlpha(0, 0)
	var_9_26:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_9_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1059, _1080p * 1097, _1080p * 14, _1080p * 52)
	var_9_0:addElement(var_9_26)

	var_9_0.Checkmark = var_9_26

	local var_9_27
	local var_9_28 = LUI.UIImage.new()

	var_9_28.id = "LineBottom"

	var_9_28:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_9_28:SetAlpha(0.4, 0)
	var_9_28:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_9_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 211, _1080p * 1200, _1080p * 314, _1080p * 316)
	var_9_0:addElement(var_9_28)

	var_9_0.LineBottom = var_9_28

	local var_9_29
	local var_9_30 = LUI.UIImage.new()

	var_9_30.id = "LineTop"

	var_9_30:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_9_30:SetAlpha(0.4, 0)
	var_9_30:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_9_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 59, _1080p * 1200, _1080p * 1, _1080p * -1)
	var_9_0:addElement(var_9_30)

	var_9_0.LineTop = var_9_30

	local var_9_31
	local var_9_32 = LUI.UIImage.new()

	var_9_32.id = "UnlockEffect"

	var_9_32:SetRGBFromInt(2347377, 0)
	var_9_32:SetAlpha(0, 0)
	var_9_32:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_9_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1200, _1080p * 241, _1080p * 316)
	var_9_0:addElement(var_9_32)

	var_9_0.UnlockEffect = var_9_32

	local var_9_33
	local var_9_34 = LUI.UIText.new()

	var_9_34.id = "ChallengeInfo"

	var_9_34:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_9_34:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_PROGRESS_INFO"), 0)
	var_9_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_34:SetAlignment(LUI.Alignment.Left)
	var_9_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 594, _1080p * 233, _1080p * 251)
	var_9_0:addElement(var_9_34)

	var_9_0.ChallengeInfo = var_9_34

	local var_9_35
	local var_9_36 = LUI.UIText.new()

	var_9_36.id = "ChallengeInProgressText"

	var_9_36:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_9_36:SetAlpha(0, 0)
	var_9_36:setText(Engine.CBBHFCGDIC("MENU/PLACEHOLDER"), 0)
	var_9_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_36:SetAlignment(LUI.Alignment.Right)
	var_9_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 698, _1080p * 1046, _1080p * 25, _1080p * 41)
	var_9_0:addElement(var_9_36)

	var_9_0.ChallengeInProgressText = var_9_36

	local var_9_37
	local var_9_38 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_9_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SeasonalEventCommunityChallengePreview", {
				controllerIndex = var_9_1
			})
		end,
		refreshChild = function(arg_11_0, arg_11_1, arg_11_2)
			return
		end,
		spacingX = _1080p * 11,
		spacingY = _1080p * 11,
		columnWidth = _1080p * 64,
		rowHeight = _1080p * 64,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_9_39 = LUI.UIGrid.new(var_9_38)

	var_9_39.id = "GridPreview"

	var_9_39:setUseStencil(true)
	var_9_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1123, _1080p * 1187, _1080p * 14, _1080p * 303)
	var_9_0:addElement(var_9_39)

	var_9_0.GridPreview = var_9_39

	local function var_9_40()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_40

	local var_9_41
	local var_9_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1110
		}
	}

	var_9_4:RegisterAnimationSequence("AllChallengeLayout", var_9_42)

	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 520
		}
	}

	var_9_6:RegisterAnimationSequence("AllChallengeLayout", var_9_43)

	local var_9_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1183
		}
	}

	var_9_8:RegisterAnimationSequence("AllChallengeLayout", var_9_44)

	local var_9_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1183
		}
	}

	var_9_10:RegisterAnimationSequence("AllChallengeLayout", var_9_45)

	local var_9_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 195
		}
	}

	var_9_12:RegisterAnimationSequence("AllChallengeLayout", var_9_46)

	local var_9_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 163
		}
	}

	var_9_16:RegisterAnimationSequence("AllChallengeLayout", var_9_47)

	local var_9_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_9_18:RegisterAnimationSequence("AllChallengeLayout", var_9_48)

	local var_9_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("AllChallengeLayout", var_9_49)

	local var_9_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("AllChallengeLayout", var_9_50)

	local var_9_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1200
		}
	}

	var_9_24:RegisterAnimationSequence("AllChallengeLayout", var_9_51)

	local var_9_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1183
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_9_26:RegisterAnimationSequence("AllChallengeLayout", var_9_52)

	local var_9_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1110
		}
	}

	var_9_28:RegisterAnimationSequence("AllChallengeLayout", var_9_53)

	local var_9_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1110
		}
	}

	var_9_30:RegisterAnimationSequence("AllChallengeLayout", var_9_54)

	local var_9_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 388
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_9_36:RegisterAnimationSequence("AllChallengeLayout", var_9_55)

	local var_9_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_39:RegisterAnimationSequence("AllChallengeLayout", var_9_56)

	local function var_9_57()
		var_9_4:AnimateSequence("AllChallengeLayout")
		var_9_6:AnimateSequence("AllChallengeLayout")
		var_9_8:AnimateSequence("AllChallengeLayout")
		var_9_10:AnimateSequence("AllChallengeLayout")
		var_9_12:AnimateSequence("AllChallengeLayout")
		var_9_16:AnimateSequence("AllChallengeLayout")
		var_9_18:AnimateSequence("AllChallengeLayout")
		var_9_20:AnimateSequence("AllChallengeLayout")
		var_9_22:AnimateSequence("AllChallengeLayout")
		var_9_24:AnimateSequence("AllChallengeLayout")
		var_9_26:AnimateSequence("AllChallengeLayout")
		var_9_28:AnimateSequence("AllChallengeLayout")
		var_9_30:AnimateSequence("AllChallengeLayout")
		var_9_36:AnimateSequence("AllChallengeLayout")
		var_9_39:AnimateSequence("AllChallengeLayout")
	end

	var_9_0._sequences.AllChallengeLayout = var_9_57

	local var_9_58
	local var_9_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_9_12:RegisterAnimationSequence("ActiveChallenge", var_9_59)

	local var_9_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_9_18:RegisterAnimationSequence("ActiveChallenge", var_9_60)

	local var_9_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("ActiveChallenge", var_9_61)

	local var_9_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_ACTIVE")
		}
	}

	var_9_36:RegisterAnimationSequence("ActiveChallenge", var_9_62)

	local function var_9_63()
		var_9_12:AnimateSequence("ActiveChallenge")
		var_9_18:AnimateSequence("ActiveChallenge")
		var_9_26:AnimateSequence("ActiveChallenge")
		var_9_36:AnimateSequence("ActiveChallenge")
	end

	var_9_0._sequences.ActiveChallenge = var_9_63

	local var_9_64
	local var_9_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("UpcomingChallenge", var_9_65)

	local var_9_66 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("UpcomingChallenge", var_9_66)

	local var_9_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("UpcomingChallenge", var_9_67)

	local var_9_68 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("UpcomingChallenge", var_9_68)

	local var_9_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_lock")
		}
	}

	var_9_26:RegisterAnimationSequence("UpcomingChallenge", var_9_69)

	local var_9_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredRebirthGray
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_SOON")
		}
	}

	var_9_36:RegisterAnimationSequence("UpcomingChallenge", var_9_70)

	local function var_9_71()
		var_9_12:AnimateSequence("UpcomingChallenge")
		var_9_16:AnimateSequence("UpcomingChallenge")
		var_9_18:AnimateSequence("UpcomingChallenge")
		var_9_24:AnimateSequence("UpcomingChallenge")
		var_9_26:AnimateSequence("UpcomingChallenge")
		var_9_36:AnimateSequence("UpcomingChallenge")
	end

	var_9_0._sequences.UpcomingChallenge = var_9_71

	local var_9_72
	local var_9_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("CompletedChallenge", var_9_73)

	local var_9_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("CompletedChallenge", var_9_74)

	local var_9_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		}
	}

	var_9_18:RegisterAnimationSequence("CompletedChallenge", var_9_75)

	local var_9_76 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("CompletedChallenge", var_9_76)

	local var_9_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_checkbox_checked")
		}
	}

	var_9_26:RegisterAnimationSequence("CompletedChallenge", var_9_77)

	local var_9_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredRebirthGray
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_COMPLETED")
		}
	}

	var_9_36:RegisterAnimationSequence("CompletedChallenge", var_9_78)

	local function var_9_79()
		var_9_12:AnimateSequence("CompletedChallenge")
		var_9_16:AnimateSequence("CompletedChallenge")
		var_9_18:AnimateSequence("CompletedChallenge")
		var_9_24:AnimateSequence("CompletedChallenge")
		var_9_26:AnimateSequence("CompletedChallenge")
		var_9_36:AnimateSequence("CompletedChallenge")
	end

	var_9_0._sequences.CompletedChallenge = var_9_79

	local var_9_80
	local var_9_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 240
		},
		{
			value = 1,
			duration = 420,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 630,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -124
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_32:RegisterAnimationSequence("CompleteAnim", var_9_81)

	local function var_9_82()
		var_9_32:AnimateSequence("CompleteAnim")
	end

	var_9_0._sequences.CompleteAnim = var_9_82

	local var_9_83
	local var_9_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("StandbyChallenge", var_9_84)

	local var_9_85 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("StandbyChallenge", var_9_85)

	local var_9_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("StandbyChallenge", var_9_86)

	local var_9_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("StandbyChallenge", var_9_87)

	local var_9_88 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("StandbyChallenge", var_9_88)

	local var_9_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_playlist_match_time")
		}
	}

	var_9_26:RegisterAnimationSequence("StandbyChallenge", var_9_89)

	local var_9_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_STANDBY")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("StandbyChallenge", var_9_90)

	local function var_9_91()
		var_9_12:AnimateSequence("StandbyChallenge")
		var_9_16:AnimateSequence("StandbyChallenge")
		var_9_18:AnimateSequence("StandbyChallenge")
		var_9_22:AnimateSequence("StandbyChallenge")
		var_9_24:AnimateSequence("StandbyChallenge")
		var_9_26:AnimateSequence("StandbyChallenge")
		var_9_36:AnimateSequence("StandbyChallenge")
	end

	var_9_0._sequences.StandbyChallenge = var_9_91

	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SeasonalEventCommunityChallengePanel", SeasonalEventCommunityChallengePanel)
LockTable(_M)
