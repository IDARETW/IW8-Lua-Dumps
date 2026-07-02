module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Challenge.GetQuestsForMissionChallenges(arg_1_1, arg_1_0._challengeWhitelist)
	local var_1_1

	if arg_1_0._isIntel then
		var_1_1 = Challenge.GetMissionsForQuests(arg_1_1, var_1_0)
	else
		local var_1_2 = Quests.BCIHEIDCGD(arg_1_1, arg_1_0._activationCategory)

		local function var_1_3(arg_2_0)
			return var_1_2 == tonumber(arg_2_0.id)
		end

		var_1_1 = Challenge.GetMissionsForQuests(arg_1_1, var_1_0, nil, var_1_3)

		Challenge.SortMissionChallenges(var_1_1)

		arg_1_0._activeIndex = nil

		for iter_1_0, iter_1_1 in ipairs(var_1_1) do
			if iter_1_1.isActive then
				arg_1_0._activeIndex = iter_1_0

				break
			end
		end
	end

	return var_1_1
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = ""

	if not arg_3_0._challenges[arg_3_1].complete and arg_3_1 ~= arg_3_0._activeIndex and not arg_3_0._challenges[arg_3_1].isBattlePassLocked then
		var_3_0 = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE")
	end

	arg_3_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = var_3_0
	})
end

local function var_0_2(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0, arg_5_1)
		arg_5_0._challenges = var_0_0(arg_5_0, arg_4_1)

		arg_5_0.Grid:RefreshContent()
		var_0_1(arg_5_0, arg_5_0._buttonOverIndex)

		local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)

		if var_5_0 then
			var_5_0._missionActivated = true
		end

		arg_5_0._pendingActivationIndex = nil

		LUI.FlowManager.RequestLeaveMenuByName("MissionActivationSpinner")
	end

	arg_4_0:registerEventHandler("quest_activated", function(arg_6_0, arg_6_1)
		var_4_0(arg_6_0, true)
	end)

	local function var_4_1(arg_7_0)
		local var_7_0 = ""

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
			var_7_0 = Engine.CBBHFCGDIC("CHALLENGE/DEV_ERROR_ACTIVATION", "CHALLENGE/ACTIVATE", arg_7_0)
		else
			var_7_0 = Engine.CBBHFCGDIC("CHALLENGE/ERROR_ACTIVATION", "CHALLENGE/ACTIVATE")
		end

		local var_7_1 = {
			controllerIndex = arg_4_1,
			message = var_7_0,
			label = Engine.CBBHFCGDIC("LUA_MENU/OK"),
			action = function(arg_8_0, arg_8_1)
				LUI.FlowManager.RequestLeaveMenu(arg_8_0)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_4_1, true, var_7_1, nil, false, true)
	end

	local function var_4_2(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0._challenges[arg_9_0._pendingActivationIndex].firstIncompleteQuestID

		arg_9_0._challenges = var_0_0(arg_9_0, arg_4_1)

		arg_9_0.Grid:RefreshContent()
		var_4_1(var_9_0)

		arg_9_0._pendingActivationIndex = nil
	end

	arg_4_0:registerEventHandler("quest_activation_failed", var_4_2)
	arg_4_0:registerEventHandler("quest_deactivation_failed", var_4_2)
end

local function var_0_3(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not arg_10_0._pendingActivationIndex then
		arg_10_0._pendingActivationIndex = arg_10_2

		local var_10_0 = arg_10_0._challenges[arg_10_2].firstIncompleteQuestID

		local function var_10_1()
			arg_10_0._pendingActivationIndex = nil
		end

		local function var_10_2()
			local var_12_0 = {
				controllerIndex = arg_10_1,
				message = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATING_MISSION")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "MissionActivationSpinner", true, arg_10_1, false, var_12_0, nil, false, true)
			Quests.DDCDGAJBBD(arg_10_1, var_10_0)

			local var_12_1 = {
				iconScale = -0.2,
				displayTime = 3000,
				icon = "icon_playlist_trophy",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("CHALLENGE/MISSION_ACTIVATED"),
				description = Engine.CBBHFCGDIC(arg_10_0._challenges[arg_10_2].name),
				type = LUI.ToastManager.NotificationType.MissionChallenges,
				controllerIndex = arg_10_1
			}

			arg_10_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_12_1
			})
		end

		if arg_10_0._activeIndex ~= nil then
			local var_10_3 = arg_10_0._challenges[arg_10_0._activeIndex].name
			local var_10_4 = arg_10_0._challenges[arg_10_2].name
			local var_10_5 = {
				activeMissionName = var_10_3 and Engine.CBBHFCGDIC(var_10_3) or "",
				newMissionName = var_10_4 and Engine.CBBHFCGDIC(var_10_4) or "",
				onAccept = var_10_2,
				onDecline = var_10_1
			}

			LUI.FlowManager.RequestPopupMenu(nil, "ActivateMissionPopup", true, arg_10_1, false, var_10_5, nil, false, true)
		else
			var_10_2()
		end
	end
end

local function var_0_4(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = MenuBuilder.BuildRegisteredType("BarracksChallengeItemMission", {
		controllerIndex = arg_13_1
	})

	var_13_0:Setup(arg_13_0, arg_13_2, arg_13_3)

	return var_13_0
end

local function var_0_5(arg_14_0, arg_14_1)
	local var_14_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_14_0
	})

	var_14_0.id = "challengeHeader" .. arg_14_1

	var_14_0.Title:setText(arg_14_1)
	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 40)

	return var_14_0
end

local function var_0_6(arg_15_0, arg_15_1, arg_15_2)
	if not arg_15_0._isIntel then
		arg_15_0.Grid:SetNumChildren(#arg_15_0._challenges)
		arg_15_0.Grid:SetRefreshChild(function(arg_16_0, arg_16_1, arg_16_2)
			local var_16_0 = arg_16_2 + 1
			local var_16_1 = arg_15_0._challenges[var_16_0]

			arg_16_0:Setup(arg_15_0, var_16_1, var_16_0)

			if var_16_1 == arg_15_0.Grid.lastMissionFocused then
				arg_16_0:processEvent({
					name = "gain_focus"
				})
			end
		end)

		local var_15_0 = arg_15_0._activeIndex and arg_15_0._activeIndex - 1 or 0

		if arg_15_2.challengeID and arg_15_2.challengeID ~= "" then
			for iter_15_0 = 1, #arg_15_0._challenges do
				if arg_15_0._challenges[iter_15_0].objectives[1].ref == arg_15_2.challengeID then
					var_15_0 = iter_15_0 - 1

					break
				end
			end
		end

		arg_15_0.Grid:SetDefaultFocus({
			x = 0,
			y = var_15_0
		})
		arg_15_0.Grid:SetPosition({
			x = 0,
			y = var_15_0
		}, true)
		arg_15_0.MissionDetails:SetData(arg_15_0._challenges[var_15_0 + 1])
	else
		arg_15_0.Grid:closeTree()

		local var_15_1 = {}
		local var_15_2 = 0

		for iter_15_1, iter_15_2 in ipairs(arg_15_0._challenges) do
			local var_15_3 = Challenge.GetIntelSeason(iter_15_2.intelSeasonWeek)

			if not var_15_1[var_15_3] then
				var_15_1[var_15_3] = true
				var_15_2 = var_15_2 + 1
			end
		end

		local var_15_4 = var_15_2 + #arg_15_0._challenges
		local var_15_5 = {
			buildArrowsLabel = true,
			maxVisibleRows = 7,
			scrollingThresholdX = 1,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleColumns = 1,
			wrapY = true,
			springCoefficient = 400,
			maxRows = var_15_4,
			controllerIndex = arg_15_1,
			spacingX = _1080p * 10,
			spacingY = _1080p * 10,
			columnWidth = _1080p * 600,
			arrowsVerticalOffset = _1080p * 10,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			countFunction = function()
				if arg_15_0.Grid.lastMissionElementFocused then
					return arg_15_0.Grid.lastMissionElementFocused._index, #arg_15_0._challenges
				else
					return 0, 0
				end
			end
		}

		arg_15_0.Grid = LUI.UIGrid.new(var_15_5)
		arg_15_0.Grid.id = "Grid"

		arg_15_0.Grid:setUseStencil(true)
		arg_15_0.Grid:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 696, _1080p * 216, _1080p * 896)
		arg_15_0:addElement(arg_15_0.Grid)

		local var_15_6 = {}

		Challenge.SortIntelMissions(arg_15_0._challenges)

		for iter_15_3, iter_15_4 in ipairs(arg_15_0._challenges) do
			local var_15_7 = Challenge.GetIntelSeason(iter_15_4.intelSeasonWeek)

			if not var_15_6[var_15_7] then
				var_15_6[var_15_7] = true
				var_15_2 = var_15_2 + 1

				arg_15_0.Grid:AddElement(var_0_5(arg_15_1, Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", var_15_7)))
			end

			arg_15_0.Grid:AddElement(var_0_4(arg_15_0, arg_15_1, iter_15_4, iter_15_3))
		end

		arg_15_0.SeasonEnd:SetAlpha(0)
		arg_15_0.SeasonText:SetAlpha(0)
		arg_15_0.Line:SetAlpha(0)
		arg_15_0.MissionDetails:SetData(arg_15_0._challenges[1])
	end

	arg_15_0._scrollbar = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_15_0.VerticalMinimalScrollbar,
		startCap = arg_15_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_15_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_15_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_15_0.VerticalMinimalScrollbar.sliderArea and arg_15_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_15_0.VerticalMinimalScrollbar.sliderArea and arg_15_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	arg_15_0.Grid:AddScrollbar(arg_15_0._scrollbar)
	arg_15_0.Grid:SetMouseWheelScrollingOffsetPx(32)
	arg_15_0.Grid:addEventHandler("new_mission_focused", function(arg_18_0, arg_18_1)
		if arg_18_0.lastMissionElementFocused and arg_18_0.lastMissionElementFocused ~= arg_18_1.newFocusedElement then
			arg_18_0.lastMissionElementFocused:CustomLoseFocus()
		end

		LUI.FlowManager.GetScopedData(arg_15_0).lastFocusedIndex = arg_15_0.Grid:GetFocusPosition()
		arg_18_0.lastMissionElementFocused = arg_18_1.newFocusedElement
		arg_18_0.lastMissionFocused = arg_18_1.newFocusedElement._challenge
	end)

	if arg_15_0._isIntel and not LUI.IsLastInputKeyboardMouse(arg_15_1) then
		arg_15_0.Grid:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)
	end
end

local function var_0_7(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0._challengeWhitelist = arg_19_2.challengeWhitelist
	arg_19_0._activationCategory = arg_19_2.activationCategory
	arg_19_0._isIntel = arg_19_0._challengeWhitelist == Challenge.IntelMissionsWhitelist
	arg_19_0._isCPChallenge = arg_19_0._challengeWhitelist == Challenge.CPMissionsWhitelist
	arg_19_0._challenges = var_0_0(arg_19_0, arg_19_1)

	local var_19_0 = LUI.FlowManager.GetScopedData(arg_19_0)

	if not arg_19_0._challenges or #arg_19_0._challenges <= 0 then
		ACTIONS.AnimateSequence(arg_19_0, "HideChallenges")
		arg_19_0.Grid:SetNumChildren(0)

		return
	end

	if not arg_19_0._isIntel then
		var_0_2(arg_19_0, arg_19_1)
	end

	arg_19_0:registerEventHandler("challenges_update_mission_details", function(arg_20_0, arg_20_1)
		local var_20_0

		if var_19_0 and var_19_0.focussedMissionIndex then
			var_20_0 = var_19_0.focussedMissionIndex
		end

		if arg_20_1.index and arg_19_0._challenges[arg_20_1.index] and arg_20_0:GetCurrentMenu() then
			arg_20_0._buttonOverIndex = arg_20_1.index

			arg_20_0.MissionDetails:SetData(arg_19_0._challenges[arg_20_1.index], var_20_0)

			var_19_0.focussedMissionIndex = nil

			if not arg_19_0._isIntel then
				var_0_1(arg_20_0, arg_20_1.index)
			end
		end
	end)

	if not arg_19_0._isIntel then
		arg_19_0:registerEventHandler("challenges_mission_activation", function(arg_21_0, arg_21_1)
			if arg_21_1.index and arg_21_0._challenges[arg_21_1.index] then
				var_0_3(arg_21_0, arg_19_1, arg_21_1.index)
			end
		end)
	end

	arg_19_0:registerEventHandler("restore_focus", function(arg_22_0, arg_22_1)
		if not arg_19_0._isIntel and var_19_0._missionActivated then
			arg_19_0.Grid:SetFocusedPosition({
				x = 0,
				y = arg_19_0._activeIndex - 1
			}, false, nil, false)
			arg_19_0._scrollbar:GetWidget():processEvent({
				name = "scrollbar_force_show",
				controller = arg_22_1.controller
			})
			arg_19_0.Grid:dispatchEventToChildren(arg_22_1)

			var_19_0._missionActivated = nil

			return true
		end

		if var_19_0.lastFocusedIndex then
			arg_19_0.Grid:SetFocusedPosition({
				x = 0,
				y = var_19_0.lastFocusedIndex
			}, true, nil, false)
			arg_19_0._scrollbar:GetWidget():processEvent({
				name = "scrollbar_force_show",
				controller = arg_22_1.controller
			})

			var_19_0.lastFocusedIndex = nil

			return true
		end
	end)
	var_0_6(arg_19_0, arg_19_1, arg_19_2)

	if Dvar.IBEGCHEFE("NPOLQSQMNO") then
		local var_19_1 = SEASON.GetName(SEASON.GetCurrentSeason())

		if var_19_1 and #var_19_1 > 0 then
			arg_19_0.SeasonText:setText(Engine.CBBHFCGDIC("CHALLENGE/SEASON_MISSIONS", Engine.CBBHFCGDIC(var_19_1)))
		end

		Challenge.SetupSeasonEndsTimer(arg_19_0, arg_19_0.SeasonEnd, "CHALLENGE/SEASON_ENDS")
	end

	local var_19_2 = Dvar.IBEGCHEFE("LRNMMQMTPK")

	local function var_19_3(arg_23_0, arg_23_1)
		LUI.FlowManager.RequestPopupMenu(arg_23_0, "onboardingpopup", true, arg_23_1, false, ONBOARDING_DATA.GetOnboardingIntelMissionChallengesData())
		Onboarding.IntelMissionChallenges.MarkCompleted(arg_23_0, arg_23_1)
	end

	if not Onboarding.MissionChallenges.WasCompleted(arg_19_0, arg_19_1) then
		local var_19_4 = ONBOARDING_DATA.GetOnboardingMissionChallengesData()

		local function var_19_5(arg_24_0, arg_24_1)
			ACTIONS.LeaveMenu(arg_24_0)

			if var_19_2 then
				var_19_3(arg_24_0, arg_24_1)
			end
		end

		var_19_4.confirmButton.action = var_19_5

		LUI.FlowManager.RequestPopupMenu(arg_19_0, "onboardingpopup", true, arg_19_1, false, var_19_4)
		Onboarding.MissionChallenges.MarkCompleted(arg_19_0, arg_19_1)
	elseif var_19_2 and not Onboarding.IntelMissionChallenges.WasCompleted(arg_19_0, arg_19_1) then
		var_19_3(arg_19_0, arg_19_1)
	end
end

function BarracksChallengesMissions(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIElement.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_25_0.id = "BarracksChallengesMissions"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)

	local var_25_2 = var_25_0
	local var_25_3
	local var_25_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_25_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BarracksChallengeItemMission", {
				controllerIndex = var_25_1
			})
		end,
		refreshChild = function(arg_27_0, arg_27_1, arg_27_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 128,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_25_5 = LUI.UIGrid.new(var_25_4)

	var_25_5.id = "Grid"

	var_25_5:setUseStencil(true)
	var_25_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 896, _1080p * 216, _1080p * 946)
	var_25_0:addElement(var_25_5)

	var_25_0.Grid = var_25_5

	local var_25_6
	local var_25_7 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetails", {
		controllerIndex = var_25_1
	})

	var_25_7.id = "MissionDetails"

	var_25_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1767, _1080p * 216, _1080p * 991)
	var_25_0:addElement(var_25_7)

	var_25_0.MissionDetails = var_25_7

	local var_25_8
	local var_25_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_25_1
	})

	var_25_9.id = "VerticalMinimalScrollbar"

	var_25_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 713, _1080p * 216, _1080p * 896)
	var_25_0:addElement(var_25_9)

	var_25_0.VerticalMinimalScrollbar = var_25_9

	local var_25_10
	local var_25_11 = LUI.UIImage.new()

	var_25_11.id = "Line"

	var_25_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_11:SetAlpha(0.4, 0)
	var_25_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 696, _1080p * 208, _1080p * 209)
	var_25_0:addElement(var_25_11)

	var_25_0.Line = var_25_11

	local var_25_12
	local var_25_13 = LUI.UIStyledText.new()

	var_25_13.id = "SeasonText"

	var_25_13:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_13:setText("", 0)
	var_25_13:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_13:SetWordWrap(false)
	var_25_13:SetAlignment(LUI.Alignment.Left)
	var_25_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 386, _1080p * 182, _1080p * 204)
	var_25_0:addElement(var_25_13)

	var_25_0.SeasonText = var_25_13

	local var_25_14
	local var_25_15 = LUI.UIStyledText.new()

	var_25_15.id = "SeasonEnd"

	var_25_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_15:setText("", 0)
	var_25_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_15:SetWordWrap(false)
	var_25_15:SetAlignment(LUI.Alignment.Right)
	var_25_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 532, _1080p * 696, _1080p * 182, _1080p * 204)
	var_25_0:addElement(var_25_15)

	var_25_0.SeasonEnd = var_25_15

	local var_25_16
	local var_25_17 = LUI.UIText.new()

	var_25_17.id = "NoChallengesLabel"

	var_25_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_17:SetAlpha(0, 0)
	var_25_17:setText(Engine.CBBHFCGDIC("CHALLENGE/NONE_AVAILABLE"), 0)
	var_25_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_17:SetAlignment(LUI.Alignment.Center)
	var_25_17:SetVerticalAlignment(LUI.Alignment.Center)
	var_25_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -12, _1080p * 12)
	var_25_0:addElement(var_25_17)

	var_25_0.NoChallengesLabel = var_25_17

	local function var_25_18()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_18

	local var_25_19
	local var_25_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_5:RegisterAnimationSequence("HideChallenges", var_25_20)

	local var_25_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_7:RegisterAnimationSequence("HideChallenges", var_25_21)

	local var_25_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_9:RegisterAnimationSequence("HideChallenges", var_25_22)

	local var_25_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_11:RegisterAnimationSequence("HideChallenges", var_25_23)

	local var_25_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_13:RegisterAnimationSequence("HideChallenges", var_25_24)

	local var_25_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_15:RegisterAnimationSequence("HideChallenges", var_25_25)

	local var_25_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("HideChallenges", var_25_26)

	local function var_25_27()
		var_25_5:AnimateSequence("HideChallenges")
		var_25_7:AnimateSequence("HideChallenges")
		var_25_9:AnimateSequence("HideChallenges")
		var_25_11:AnimateSequence("HideChallenges")
		var_25_13:AnimateSequence("HideChallenges")
		var_25_15:AnimateSequence("HideChallenges")
		var_25_17:AnimateSequence("HideChallenges")
	end

	var_25_0._sequences.HideChallenges = var_25_27

	var_0_7(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("BarracksChallengesMissions", BarracksChallengesMissions)
LockTable(_M)
