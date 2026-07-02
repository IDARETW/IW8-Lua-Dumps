module(..., package.seeall)

local var_0_0 = {
	{
		_isEmpty = true
	}
}

local function var_0_1(arg_1_0)
	local var_1_0 = not arg_1_0._activeGrid._isDailyGrid
	local var_1_1 = "HideControllerPagination"

	if var_1_0 and LUI.IsLastInputGamepad(arg_1_0._controllerIndex) and arg_1_0._activeGrid:GetMaxVisibleRows() * arg_1_0._activeGrid:GetMaxVisibleColumns() < arg_1_0._activeGrid:GetNumChildren() then
		var_1_1 = "ShowControllerPagination"
	end

	ACTIONS.AnimateSequence(arg_1_0, var_1_1)
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_1 and type(arg_2_1) == "table", "ChallengeGridInit: invalid options")
	assert(arg_2_1.gridWidget, "ChallengeGridInit: gridWidget is nil")
	assert(arg_2_1.challengeDataFuncName, "ChallengeGridInit: challengeDataFuncName is nil")
	assert(arg_2_1.refreshEventName, "ChallengeGridInit: refreshEventName is nil")

	local function var_2_0()
		local var_3_0 = Challenge[arg_2_1.challengeDataFuncName](arg_2_0._controllerIndex)
		local var_3_1 = next(var_3_0) == nil and not arg_2_1.gridWidget._isDailyGrid

		if var_3_1 then
			var_3_0 = var_0_0
		end

		arg_2_1.gridWidget._isEmpty = var_3_1

		var_0_1(arg_2_0)

		return var_3_0
	end

	local function var_2_1()
		local var_4_0 = var_2_0()
		local var_4_1 = Challenge.GetValidatedNumChallengesForSpecifiedMax(#var_4_0, arg_2_1.gridWidget._maxVisibleChallenges)

		arg_2_1.gridWidget:SetNumChildren(var_4_1)
		arg_2_1.gridWidget:RefreshContent()
	end

	arg_2_1.gridWidget:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		arg_5_0._gridRow = arg_2_1.gridWidget._forceSelectedChallengeDataRow or arg_5_2

		local var_5_0 = var_2_0()[arg_5_0._gridRow + 1]

		arg_5_0:Setup(arg_2_0, var_5_0)

		if arg_2_0._isUsingSingleActiveChallengeLayout and arg_2_1.gridWidget._isDailyGrid and arg_2_1.gridWidget._forceSelectedChallengeDataRow then
			arg_5_0:SetFocusable(false)

			if not arg_2_0._selectedBtn then
				arg_2_0._selectedBtn = arg_5_0

				arg_2_0._selectedBtn:SetIsSelected(true)
			end
		end
	end)
	var_2_1()
	arg_2_0:addEventHandler(arg_2_1.refreshEventName, function(arg_6_0, arg_6_1)
		var_2_1()
	end)
end

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0:SetWidgetsAlwaysVisible(arg_7_1)
	arg_7_0:SetMouseFocusBlocker(not arg_7_1)
	arg_7_0:SetDirectionalInputEnabled(arg_7_1)
	arg_7_0:UpdateNumbersAndArrows()
end

local function var_0_4(arg_8_0)
	var_0_1(arg_8_0)

	if LUI.IsLastInputGamepad(arg_8_0._controllerIndex) then
		arg_8_0._inactiveGrid:processEvent({
			name = "lose_focus"
		})
		arg_8_0._activeGrid:processEvent({
			name = arg_8_0._activeGrid._isEmpty and "lose_focus" or "gain_focus"
		})
	end

	local var_8_0 = not arg_8_0._activeGrid._isEmpty

	var_0_3(arg_8_0._activeGrid, var_8_0)
	var_0_3(arg_8_0._inactiveGrid, false)
end

local function var_0_5(arg_9_0, arg_9_1)
	arg_9_0._activeGrid, arg_9_0._inactiveGrid = arg_9_0._inactiveGrid, arg_9_0._activeGrid

	var_0_4(arg_9_0)
end

local function var_0_6(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0._activeGrid:GetElementAtPosition(0, arg_10_0._activeGrid.selectedChallengeRow)
	local var_10_1 = arg_10_0._inactiveGrid:GetElementAtPosition(0, arg_10_0._inactiveGrid.selectedChallengeRow)

	ScheduledChallenges.DBFGBFDIHA(arg_10_1, var_10_1._challenge.id, var_10_0._challenge.id)

	var_10_0._challenge, var_10_1._challenge = var_10_1._challenge, var_10_0._challenge

	var_10_0:Setup(arg_10_0, var_10_0._challenge)
	var_10_1:Setup(arg_10_0, var_10_1._challenge)
	var_10_1:processEvent({
		snap = true,
		name = "button_up"
	})

	arg_10_0._activeGrid.selectedChallengeRow = nil

	arg_10_0._activeGrid:SetMouseFocusBlocker(false)
	arg_10_0._activeGrid:SetDirectionalInputEnabled(true)

	arg_10_0._inactiveGrid.selectedChallengeRow = nil

	arg_10_0._inactiveGrid:SetMouseFocusBlocker(false)
	arg_10_0._inactiveGrid:SetDirectionalInputEnabled(true)

	if arg_10_0._selectedBtn then
		arg_10_0._selectedBtn:SetIsSelected(false)

		arg_10_0._selectedBtn = nil
	end

	var_0_5(arg_10_0)
end

local function var_0_7(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0._inactiveGrid.selectedChallengeRow

	if var_11_0 then
		var_0_6(arg_11_0, arg_11_1)
	else
		var_0_5(arg_11_0)

		arg_11_0._selectedBtn = arg_11_0._inactiveGrid:GetElementAtPosition(0, arg_11_0._inactiveGrid.selectedChallengeRow)

		arg_11_0._selectedBtn:SetIsSelected(true)
	end

	arg_11_0:dispatchEventToChildren({
		name = "challenge_btn_selection_hint_update",
		immediate = true,
		menuHasDoneBtnSelection = not var_11_0
	})
end

local function var_0_8(arg_12_0, arg_12_1)
	arg_12_0.DailyGrid._forceSelectedChallengeDataRow = arg_12_1

	arg_12_0.DailyGrid:RefreshContent()
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._controllerIndex = arg_13_1
	arg_13_0._activeGrid = arg_13_0.BankGrid
	arg_13_0._inactiveGrid = arg_13_0.DailyGrid
	arg_13_0._isUsingSingleActiveChallengeLayout = true
	arg_13_0.DailyGrid._maxVisibleChallenges = Challenge.MAX_NUM_ACTIVE_DAILY_CHALLENGES
	arg_13_0.BankGrid._maxVisibleChallenges = Challenge.MAX_NUM_BANKED_CHALLENGES
	arg_13_0.SetForceSelectedDailyChallengeRow = var_0_8

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_13_0, "AR")
		ACTIONS.AnimateSequence(arg_13_0.BankHeader, "ARBankHeader")
		ACTIONS.AnimateSequence(arg_13_0.DailyHeader, "ARChallengeMenu")
		ACTIONS.AnimateSequence(arg_13_0.Hint, "ARHint")
	end

	if arg_13_0._isUsingSingleActiveChallengeLayout then
		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_13_0, "ShowSingleActiveChallengeAR")
		else
			ACTIONS.AnimateSequence(arg_13_0, "ShowSingleActiveChallenge")
		end

		arg_13_0.DailyGrid._maxVisibleChallenges = 1
		arg_13_0.DailyGrid._forceSelectedChallengeDataRow = nil
		arg_13_0.BankGrid._isUsingSingleActiveChallengeLayout = arg_13_0._isUsingSingleActiveChallengeLayout

		arg_13_0:addEventHandler("gain_focus", function(arg_14_0, arg_14_1)
			if not arg_13_0._activeGrid._isEmpty then
				arg_13_0._activeGrid:processEvent({
					name = "gain_focus"
				})
			end

			return true
		end)
	end

	arg_13_0.DailyResetTimer:SetupRightAlignment()
	Challenge.SetupDailyResetTimer(arg_13_0.DailyResetTimer, arg_13_0.DailyResetTimer.Text, nil, {
		labelKeyOverride = "CHALLENGE/NEW_IN_X"
	})
	arg_13_0.DailyResetTimer:SetupAlignment()

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_13_0.DailyResetTimer, "ARLargerFont")
	end

	arg_13_0.DailyGrid._isDailyGrid = true

	var_0_2(arg_13_0, {
		refreshEventName = "new_br_daily_challenges",
		challengeDataFuncName = "GetBRDailyChallenges",
		gridWidget = arg_13_0.DailyGrid
	})
	var_0_2(arg_13_0, {
		refreshEventName = "new_br_banked_challenges",
		challengeDataFuncName = "GetBRBankedChallenges",
		gridWidget = arg_13_0.BankGrid
	})
	arg_13_0._activeGrid:SetFocusedPosition({
		x = 0,
		y = 0
	}, true)
	var_0_4(arg_13_0)
	arg_13_0:registerEventHandler("daily_challenge_selected", function(arg_15_0, arg_15_1)
		assert(arg_15_1.selectedChallengeRow and type(arg_15_1.selectedChallengeRow) == "number", "daily_challenge_selected event, invalid event.selectedChallengeRow")

		arg_15_0.DailyGrid.selectedChallengeRow = arg_15_1.selectedChallengeRow

		var_0_7(arg_15_0, arg_13_1)
	end)
	arg_13_0:registerEventHandler("bank_challenge_selected", function(arg_16_0, arg_16_1)
		assert(arg_16_1.selectedChallengeRow and type(arg_16_1.selectedChallengeRow) == "number", "bank_challenge_selected event, invalid event.selectedChallengeRow")

		if arg_16_0._isUsingSingleActiveChallengeLayout then
			local var_16_0 = arg_13_0._activeGrid:GetElementAtPosition(0, arg_16_1.selectedChallengeRow)
			local var_16_1 = arg_13_0._inactiveGrid:GetFirstFocusablePosition()
			local var_16_2 = arg_13_0._inactiveGrid:GetElementAtPosition(var_16_1.x, var_16_1.y)

			ScheduledChallenges.DBFGBFDIHA(arg_13_1, var_16_2._challenge.id, var_16_0._challenge.id)

			local var_16_3 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGE_ACTIVATING"),
				description = var_16_0._localizedChallengeTitleText,
				type = LUI.ToastManager.NotificationType.EquipmentEquipped,
				controllerIndex = arg_13_1
			}

			arg_16_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_16_3
			})
			ACTIONS.LeaveMenu(arg_16_0)
		else
			arg_16_0.BankGrid.selectedChallengeRow = arg_16_1.selectedChallengeRow

			var_0_7(arg_16_0, arg_13_1)
		end
	end)
	arg_13_0:addEventHandler("update_input_type", var_0_4)
	LAYOUT.AddAspectRatioFadeFrame(arg_13_0, arg_13_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_13_0.Darken)
end

function WZBarracksChallengesDaily(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "WZBarracksChallengesDaily"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "Darken"

	var_17_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_4:SetAlpha(0.5, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Darken = var_17_4

	local var_17_5
	local var_17_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZBarracksChallengeItem", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 825,
		rowHeight = _1080p * 64,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_7 = LUI.UIGrid.new(var_17_6)

	var_17_7.id = "DailyGrid"

	var_17_7:setUseStencil(false)
	var_17_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 927, _1080p * 236, _1080p * 448)
	var_17_0:addElement(var_17_7)

	var_17_0.DailyGrid = var_17_7

	local var_17_8
	local var_17_9 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_17_1
	})

	var_17_9.id = "DailyHeader"

	var_17_9.Title:SetRGBFromInt(16777215, 0)
	var_17_9.Title:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGE_CAPS_SELECTED"), 0)
	var_17_9.Line:SetAlpha(0, 0)
	var_17_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 855, _1080p * 201, _1080p * 241)
	var_17_0:addElement(var_17_9)

	var_17_0.DailyHeader = var_17_9

	local var_17_10
	local var_17_11 = {
		scrollingThresholdX = 7,
		maxVisibleRows = 7,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZBarracksChallengeItem", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_21_0, arg_21_1, arg_21_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 825,
		rowHeight = _1080p * 64,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_12 = LUI.UIGrid.new(var_17_11)

	var_17_12.id = "BankGrid"

	var_17_12:setUseStencil(true)
	var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1451, _1080p * 526, _1080p * 1034)
	var_17_0:addElement(var_17_12)

	var_17_0.BankGrid = var_17_12

	local var_17_13
	local var_17_14 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_17_1
	})

	var_17_14.id = "BankHeader"

	var_17_14.Title:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_17_14.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/RESERVE_CHALLENGES")), 0)
	var_17_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 924, _1080p * 486, _1080p * 526)
	var_17_0:addElement(var_17_14)

	var_17_0.BankHeader = var_17_14

	local var_17_15
	local var_17_16 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_16.id = "VerticalScrollbar"

	var_17_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 82, _1080p * 526, _1080p * 1034)
	var_17_0:addElement(var_17_16)

	var_17_0.VerticalScrollbar = var_17_16

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "ArrowUp"

	var_17_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -564, _1080p * -532, _1080p * 1044, _1080p * 1076)
	var_17_0:addElement(var_17_18)

	var_17_0.ArrowUp = var_17_18

	local var_17_19
	local var_17_20 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_17_1
	})

	var_17_20.id = "ArrowDown"

	var_17_20.Arrow:SetZRotation(180, 0)
	var_17_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -396, _1080p * -364, _1080p * 1044, _1080p * 1076)
	var_17_0:addElement(var_17_20)

	var_17_0.ArrowDown = var_17_20

	local var_17_21
	local var_17_22 = LUI.UIText.new()

	var_17_22.id = "ListCount"

	var_17_22:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_17_22:setText("", 0)
	var_17_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_22:SetAlignment(LUI.Alignment.Center)
	var_17_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -532, _1080p * -396, _1080p * 1051, _1080p * 1071)
	var_17_0:addElement(var_17_22)

	var_17_0.ListCount = var_17_22

	local var_17_23
	local var_17_24 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_17_1
	})

	var_17_24.id = "DailyResetTimer"

	var_17_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 843, _1080p * 921, _1080p * 488, _1080p * 518)
	var_17_0:addElement(var_17_24)

	var_17_0.DailyResetTimer = var_17_24

	local var_17_25
	local var_17_26 = MenuBuilder.BuildRegisteredType("WZGlobalHint", {
		controllerIndex = var_17_1
	})

	var_17_26.id = "Hint"

	var_17_26:SetAlpha(0, 0)
	var_17_26.Title:setText(Engine.CBBHFCGDIC("CHALLENGE/RESERVE_SELECTION_HINT"), 0)
	var_17_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 937, _1080p * 1358, _1080p * 249, _1080p * 289)
	var_17_0:addElement(var_17_26)

	var_17_0.Hint = var_17_26

	local function var_17_27()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_27

	local var_17_28
	local var_17_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 886
		}
	}

	var_17_12:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_29)

	local var_17_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 338
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		}
	}

	var_17_14:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_30)

	local var_17_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 886
		}
	}

	var_17_16:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_31)

	local var_17_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 896
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 928
		}
	}

	var_17_18:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_32)

	local var_17_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 896
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 928
		}
	}

	var_17_20:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_33)

	local var_17_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 903
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 923
		}
	}

	var_17_22:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_34)

	local var_17_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 369
		}
	}

	var_17_24:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_35)

	local var_17_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_26:RegisterAnimationSequence("ShowSingleActiveChallenge", var_17_36)

	local function var_17_37()
		var_17_12:AnimateSequence("ShowSingleActiveChallenge")
		var_17_14:AnimateSequence("ShowSingleActiveChallenge")
		var_17_16:AnimateSequence("ShowSingleActiveChallenge")
		var_17_18:AnimateSequence("ShowSingleActiveChallenge")
		var_17_20:AnimateSequence("ShowSingleActiveChallenge")
		var_17_22:AnimateSequence("ShowSingleActiveChallenge")
		var_17_24:AnimateSequence("ShowSingleActiveChallenge")
		var_17_26:AnimateSequence("ShowSingleActiveChallenge")
	end

	var_17_0._sequences.ShowSingleActiveChallenge = var_17_37

	local var_17_38
	local var_17_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 232
		}
	}

	var_17_9:RegisterAnimationSequence("AR", var_17_39)

	local var_17_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 674
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 752
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 486
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 516
		}
	}

	var_17_24:RegisterAnimationSequence("AR", var_17_40)

	local function var_17_41()
		var_17_9:AnimateSequence("AR")
		var_17_24:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_41

	local var_17_42
	local var_17_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 886
		}
	}

	var_17_12:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_43)

	local var_17_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 338
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		}
	}

	var_17_14:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_44)

	local var_17_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 886
		}
	}

	var_17_16:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_45)

	local var_17_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 896
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 928
		}
	}

	var_17_18:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_46)

	local var_17_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 896
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 928
		}
	}

	var_17_20:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_47)

	local var_17_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 903
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 923
		}
	}

	var_17_22:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_48)

	local var_17_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 337
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 367
		}
	}

	var_17_24:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_49)

	local var_17_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_26:RegisterAnimationSequence("ShowSingleActiveChallengeAR", var_17_50)

	local function var_17_51()
		var_17_12:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_14:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_16:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_18:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_20:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_22:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_24:AnimateSequence("ShowSingleActiveChallengeAR")
		var_17_26:AnimateSequence("ShowSingleActiveChallengeAR")
	end

	var_17_0._sequences.ShowSingleActiveChallengeAR = var_17_51

	local var_17_52
	local var_17_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("HideControllerPagination", var_17_53)

	local var_17_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_20:RegisterAnimationSequence("HideControllerPagination", var_17_54)

	local var_17_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_22:RegisterAnimationSequence("HideControllerPagination", var_17_55)

	local function var_17_56()
		var_17_18:AnimateSequence("HideControllerPagination")
		var_17_20:AnimateSequence("HideControllerPagination")
		var_17_22:AnimateSequence("HideControllerPagination")
	end

	var_17_0._sequences.HideControllerPagination = var_17_56

	local var_17_57
	local var_17_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ShowControllerPagination", var_17_58)

	local var_17_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_20:RegisterAnimationSequence("ShowControllerPagination", var_17_59)

	local var_17_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_22:RegisterAnimationSequence("ShowControllerPagination", var_17_60)

	local function var_17_61()
		var_17_18:AnimateSequence("ShowControllerPagination")
		var_17_20:AnimateSequence("ShowControllerPagination")
		var_17_22:AnimateSequence("ShowControllerPagination")
	end

	var_17_0._sequences.ShowControllerPagination = var_17_61

	local var_17_62 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_17_16,
		startCap = var_17_16.startCap,
		endCap = var_17_16.endCap,
		sliderArea = var_17_16.sliderArea,
		slider = var_17_16.sliderArea and var_17_16.sliderArea.slider,
		fixedSizeSlider = var_17_16.sliderArea and var_17_16.sliderArea.fixedSizeSlider
	})

	var_17_12:AddScrollbar(var_17_62)
	var_17_12:AddItemNumbers(var_17_22)
	var_0_9(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("WZBarracksChallengesDaily", WZBarracksChallengesDaily)
LockTable(_M)
