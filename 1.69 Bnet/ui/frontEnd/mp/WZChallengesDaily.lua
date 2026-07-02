module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Header.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_1, #Challenge.GetBRBankedChallenges(arg_1_0._controllerIndex))))
	arg_1_0.Header.Title:SetFont(FONTS.GetFont(FONTS.MainBold.File))

	if arg_1_1 == "CHALLENGE/DAILY_CHALLENGES_X_RESERVES_PARTIAL_CAPS" and IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "ARShortHeader")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.SetHeaderText = var_0_0

	arg_2_0.ChallengeResetTimer:SetupRightAlignment()
	Challenge.SetupDailyResetTimer(arg_2_0.ChallengeResetTimer, arg_2_0.ChallengeResetTimer.Text, nil, {
		labelKeyOverride = "CHALLENGE/REFRESH_TIMER_CW_STYLE"
	})
	arg_2_0.ChallengeResetTimer:SetupAlignment()

	local function var_2_0(arg_3_0)
		arg_3_0._challengeData = Challenge.GetBRDailyChallenges(arg_2_1)

		local var_3_0 = Challenge.GetValidatedNumChallengesForSpecifiedMax(#arg_3_0._challengeData, Challenge.MAX_NUM_ACTIVE_DAILY_CHALLENGES)

		arg_3_0.DailyGrid:SetNumChildren(var_3_0)
		arg_3_0.DailyGrid:RefreshContent()
	end

	arg_2_0.DailyGrid._isDailyGrid = true

	arg_2_0.DailyGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_0._gridRow = arg_4_2

		assert(arg_2_0._challengeData, "WZChallengesDaily.lua -> DailyGrid:SetRefreshChild: self._challengeData is nil, but expected to be populated/non-nil")

		local var_4_0 = arg_2_0._challengeData[arg_4_0._gridRow + 1]

		arg_4_0:Setup(arg_2_0, var_4_0)
	end)
	var_2_0(arg_2_0)
	arg_2_0.DailyGrid:dispatchEventToChildren({
		menuHasDoneBtnSelection = true,
		name = "challenge_btn_selection_hint_update",
		immediate = true
	})

	local function var_2_1(arg_5_0, arg_5_1)
		local var_5_0 = "WZChallengesDaily.lua -> DailyGridContentRefreshEventWrapper: "
		local var_5_1 = " is nil/invalid and must be specified as a valid non-nil value"

		assert(arg_5_0, var_5_0 .. "element" .. var_5_1)
		assert(arg_5_1, var_5_0 .. "event" .. var_5_1)
		assert(arg_5_1.value ~= nil, var_5_0 .. "event.value" .. var_5_1)
		assert(arg_5_1.name, var_5_0 .. "event.name" .. var_5_1)

		if arg_5_1.value then
			var_2_0(arg_5_0)
		else
			DebugPrint(arg_5_1.name .. " event was unsuccessful")
		end
	end

	arg_2_0:addEventHandler("new_br_daily_challenges", function(arg_6_0, arg_6_1)
		var_2_1(arg_6_0, arg_6_1)
	end)
	arg_2_0:addEventHandler("new_br_exchange", function(arg_7_0, arg_7_1)
		local var_7_0 = {
			displayTime = 3000,
			iconScale = -0.3,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGE_ACTIVE"),
			type = LUI.ToastManager.NotificationType.EquipmentEquipped,
			controllerIndex = arg_2_1
		}

		arg_7_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_7_0
		})
		var_2_1(arg_7_0, arg_7_1)
	end)
	arg_2_0:addEventHandler("daily_challenge_selected", function(arg_8_0, arg_8_1)
		assert(arg_8_1 and arg_8_1.selectedChallengeRow, "WZChallengesDaily - event.selectedChallengeRow is invalid and expected to always be specified")
		LUI.FlowManager.RequestAddMenu("BarracksChallengesDailyContainer", true, arg_2_1, false, {
			forceSelectedChallengeRow = arg_8_1.selectedChallengeRow
		}, false)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
		ACTIONS.AnimateSequence(arg_2_0.Header, "ARChallengeMenu")
		ACTIONS.AnimateSequence(arg_2_0.ChallengeResetTimer, "ARLargerFont")
	end

	ACTIONS.AnimateSequence(arg_2_0, "Init")
end

function WZChallengesDaily(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1081 * _1080p, 0, 759 * _1080p)

	var_9_0.id = "WZChallengesDaily"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("WZChallengesDailyStorageInfo", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "WZChallengesDailyStorageInfo"

	var_9_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -289, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.WZChallengesDailyStorageInfo = var_9_4

	local var_9_5
	local var_9_6 = {
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
		controllerIndex = var_9_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZBarracksChallengeItem", {
				controllerIndex = var_9_1
			})
		end,
		refreshChild = function(arg_11_0, arg_11_1, arg_11_2)
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
	local var_9_7 = LUI.UIGrid.new(var_9_6)

	var_9_7.id = "DailyGrid"

	var_9_7:setUseStencil(false)
	var_9_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 825, _1080p * 40, _1080p * 252)
	var_9_0:addElement(var_9_7)

	var_9_0.DailyGrid = var_9_7

	local var_9_8
	local var_9_9 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_9_1
	})

	var_9_9.id = "Header"

	var_9_9.Title:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_9_9.Title:setText("", 0)
	var_9_9.Line:SetAlpha(0, 0)
	var_9_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 826, 0, _1080p * 40)
	var_9_0:addElement(var_9_9)

	var_9_0.Header = var_9_9

	local var_9_10
	local var_9_11 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_9_1
	})

	var_9_11.id = "ChallengeResetTimer"

	var_9_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 747, _1080p * 825, _1080p * 5, _1080p * 35)
	var_9_0:addElement(var_9_11)

	var_9_0.ChallengeResetTimer = var_9_11

	local function var_9_12()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_12

	local var_9_13
	local var_9_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 264
		}
	}

	var_9_9:RegisterAnimationSequence("AR", var_9_14)

	local var_9_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 709
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 787
		}
	}

	var_9_11:RegisterAnimationSequence("AR", var_9_15)

	local function var_9_16()
		var_9_9:AnimateSequence("AR")
		var_9_11:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_16

	local var_9_17
	local var_9_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 530
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 234
		}
	}

	var_9_9:RegisterAnimationSequence("ARShortHeader", var_9_18)

	local function var_9_19()
		var_9_9:AnimateSequence("ARShortHeader")
	end

	var_9_0._sequences.ARShortHeader = var_9_19

	local var_9_20
	local var_9_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -739
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -450
		}
	}

	var_9_4:RegisterAnimationSequence("Init", var_9_21)

	local function var_9_22()
		var_9_4:AnimateSequence("Init")
	end

	var_9_0._sequences.Init = var_9_22

	var_0_1(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("WZChallengesDaily", WZChallengesDaily)
LockTable(_M)
