module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_2) do
		table.insert(var_1_0, iter_1_1.bestMedal)
	end

	arg_1_0.TrialEventEarnedMedals:RefreshData(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.GoldRewardCard:SetMiniMode(true)

	local var_2_0 = LOOT.GetLootCardData(arg_2_1, TRIALS.CompletionLootID)

	arg_2_0.GoldRewardCard:UpdateCardConfig(var_2_0)
	arg_2_0.bindButton:addEventHandler("button_right_stick", function(arg_3_0, arg_3_1)
		STORE.PreviewItem(arg_2_1, LOOT.GetTypeForID(TRIALS.CompletionLootID), TRIALS.CompletionLootID)
	end)
end

local function var_0_2(arg_4_0, arg_4_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_4_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.MP_TRIAL_EVENT)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.isQuickAccessShortcutsDisabled = true
	arg_5_0._isTrialAttemptStarted = true

	SetStartButtonDisabled(arg_5_0, true)

	local var_5_0 = WEAPON.StreamTrialWeapons(arg_5_2)
	local var_5_1 = false

	arg_5_0:registerEventHandler(pollWeaponsEvent, function(arg_6_0, arg_6_1)
		local var_6_0 = Streaming.BJHEBDBACF(var_5_0)

		if not var_5_1 and (var_6_0 or pollAttemptCount >= maxPollAttempts) then
			Dvar.DFIJDJFIFD("MRNSMSRQMO", 0)

			var_5_1 = true
			arg_6_0._isTrialAttemptStarted = false
		end

		pollAttemptCount = pollAttemptCount + 1
	end)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	Engine.EBIDFIDHIE(MPConfig.default_online, arg_7_1)
	Dvar.DFIJDJFIFD("OOTQKOTRM", 1)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", true)
	Dvar.DHEGHJJJHI("TKRPRPOSQ", true)
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	var_0_2(arg_8_0, arg_8_1)
	MatchRules.CJGCIGEBB(1)
	MatchRules.CIGFFEAEFD("gametype", "trial")
	MatchRules.BCECADEHDA()

	arg_8_0._lastSelectedItem = 1

	arg_8_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/MODE_NAME")))

	if Engine.BHICADFIHA() then
		local var_8_0
		local var_8_1 = MenuBuilder.BuildRegisteredType("UIText", {
			controllerIndex = arg_8_1
		})

		var_8_1.id = "StartTime"

		var_8_1:SetRGBFromTable(COLORS.grey77, 0)
		var_8_1:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_8_1:SetAlignment(LUI.Alignment.Left)
		var_8_1:SetAlpha(1)
		var_8_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 124, _1080p * 1050, _1080p * 1042, _1080p * 1072)
		arg_8_0:addElement(var_8_1)

		arg_8_0.StartTime = var_8_1

		function arg_8_0.UpdateDebugStartTime()
			local var_9_0 = Dvar.CFHDGABACF("NRTPTSNRNK") - Engine.DCJHCAFIIA()

			if var_9_0 > 0 then
				arg_8_0.StartTime:setText(Engine.JCBDICCAH("DEBUG: Starts in " .. LUI.Round(var_9_0 / 3600) .. " hours"))
			else
				arg_8_0.StartTime:setText(Engine.JCBDICCAH("DEBUG: Event started " .. LUI.Round(var_9_0 / -3600) .. " hours ago"))
			end
		end

		arg_8_0.UpdateDebugStartTime()
	end

	if Engine.ECHCFGDDDF() then
		local var_8_2 = LUI.UIElement.new()

		var_8_2:SetBlurStrength(5)
		var_8_2:setupWorldBlur()

		var_8_2.id = "blur"

		arg_8_0:addElement(var_8_2)
	end

	if not Onboarding.TRIAL_EVENT_INTRODUCTION.WasCompleted(arg_8_0, arg_8_1) then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "onboardingpopup", true, arg_8_1, false, ONBOARDING_DATA.GetOnboardingTrialEventData())
		Onboarding.TRIAL_EVENT_INTRODUCTION.MarkCompleted(arg_8_0, arg_8_1)
	end

	arg_8_0.TrialsList:SetArrowsEnabled(true)

	arg_8_0.TrialsList._showNumbersAndArrowsKBM = true

	arg_8_0.LeftArrow:addEventHandler("button_action", function()
		if arg_8_0._lastSelectedItem > 1 then
			arg_8_0._lastSelectedItem = arg_8_0._lastSelectedItem - 1

			arg_8_0.TrialsList:SetFocusedPosition({
				y = 0,
				x = arg_8_0._lastSelectedItem - 1
			}, false)
		end

		return true
	end)
	arg_8_0.RightArrow:addEventHandler("button_action", function()
		if arg_8_0._lastSelectedItem < 5 then
			arg_8_0._lastSelectedItem = arg_8_0._lastSelectedItem + 1

			arg_8_0.TrialsList:SetFocusedPosition({
				y = 0,
				x = arg_8_0._lastSelectedItem - 1
			}, false)
		end

		return true
	end)

	local var_8_3 = TRIALS.GetTrialsEventData(arg_8_1)
	local var_8_4 = Dvar.CFHDGABACF("OLSTKPRLST")
	local var_8_5 = Dvar.CFHDGABACF("MRNSMSRQMO")
	local var_8_6 = Dvar.CFHDGABACF("MSMRONMPQN")
	local var_8_7 = {
		{
			name = "TrialEventRewardPopup",
			shouldShowFct = function()
				if TRIALS.ParticipationAwardGiven(arg_8_1) then
					return false
				end

				for iter_12_0, iter_12_1 in ipairs(var_8_3) do
					if iter_12_1.bestScore ~= 0 then
						return true
					end
				end

				return false
			end,
			show = function()
				TRIALS.GiveParticipationAward(arg_8_1)
				LUI.FlowManager.RequestPopupMenu(arg_8_0, "TrialEventRewardPopup", true, arg_8_1, false, {
					isParticipation = true
				})

				return "TrialEventRewardPopup"
			end
		},
		{
			name = "TrialEventRewardPopup",
			shouldShowFct = function()
				return var_8_5 > var_8_6
			end,
			show = function()
				local var_15_0 = TRIALS.GetTrialsEventData(arg_8_1)
				local var_15_1 = {
					reward = var_8_5,
					previousMedal = var_8_6,
					lootIds = var_15_0[var_8_4].lootIds
				}

				LUI.FlowManager.RequestPopupMenu(arg_8_0, "TrialEventRewardPopup", true, arg_8_1, false, var_15_1)

				return "TrialEventRewardPopup"
			end
		},
		{
			name = "TrialEventRewardPopup",
			shouldShowFct = function()
				local var_16_0 = false

				if var_8_5 > var_8_6 and not TRIALS.AllGoldAwardGiven(arg_8_1) then
					var_16_0 = true

					local var_16_1 = TRIALS.GetTrialsEventData(arg_8_1)

					for iter_16_0, iter_16_1 in ipairs(var_16_1) do
						if iter_16_1.bestMedal < 3 then
							var_16_0 = false

							break
						end
					end
				end

				return var_16_0
			end,
			show = function()
				TRIALS.GiveAllGoldAward(arg_8_1)
				LUI.FlowManager.RequestPopupMenu(arg_8_0, "TrialEventRewardPopup", true, arg_8_1, false, {
					showCompletionReward = true
				})

				return "TrialEventRewardPopup"
			end
		}
	}

	Dvar.DFIJDJFIFD("OLSTKPRLST", 0)
	Dvar.DFIJDJFIFD("MSMRONMPQN", 0)
	Dvar.DFIJDJFIFD("MRNSMSRQMO", 0)

	arg_8_0._currentPopupIdx = 1

	local var_8_8 = Engine.DBFFAEEFGJ()

	function arg_8_0.showCurrentPopup()
		return
	end

	function arg_8_0.showNextPopup()
		local var_19_0 = false

		while not var_19_0 do
			arg_8_0._currentElementIdx = next(var_8_7, arg_8_0._currentElementIdx)

			if arg_8_0._currentElementIdx == nil then
				arg_8_0._isPopupFlowComplete = true

				return
			end

			var_19_0 = false

			local var_19_1 = var_8_7[arg_8_0._currentElementIdx]

			if var_19_1.shouldShowFct() then
				local var_19_2 = var_19_1.show()
				local var_19_3 = var_8_8.flowManager:GetStackTop(false)

				if var_19_2 and var_19_3 and var_19_3.name == var_19_2 and var_19_3.menu then
					var_19_0 = true
				end
			end
		end
	end

	arg_8_0:addEventHandler("popup_inactive", function()
		arg_8_0.showNextPopup()
	end)
	arg_8_0.showNextPopup()
	TRIALS.SetupEndGlobalTimer(arg_8_0.EventTimeLeftHours)

	local function var_8_9(arg_21_0, arg_21_1, arg_21_2)
		local var_21_0 = Engine.DCJHCAFIIA()

		if var_8_3[arg_21_1._index].startTime - var_21_0 <= 0 then
			local var_21_1 = var_8_3[arg_21_1._index]

			Dvar.DFIJDJFIFD("OLSTKPRLST", arg_21_1._index)
			Dvar.DFIJDJFIFD("MSMRONMPQN", var_21_1.bestMedal)
			LUI.FlowManager.RequestPopupMenu(nil, "TrialEventStartPopup", true, arg_8_1, false, {
				trialData = var_21_1
			})
		end

		return true
	end

	local function var_8_10(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0._lastSelectedItem == arg_22_1._index then
			local var_22_0 = var_8_3[arg_22_1._index]

			LUI.FlowManager.RequestPopupMenu(nil, "TrialEventLeaderboard", true, arg_8_1, false, {
				trialIndex = arg_22_1._index,
				trialTitle = var_22_0.ui_name
			})

			return true
		end
	end

	local function var_8_11(arg_23_0, arg_23_1, arg_23_2)
		if Engine.BHICADFIHA() and arg_23_0._lastSelectedItem == arg_23_1._index then
			local var_23_0 = var_8_3[arg_23_1._index]

			var_23_0.bestMedal = var_23_0.bestMedal + 1

			if var_23_0.bestMedal > 3 then
				var_23_0.bestMedal = 0
			end

			local var_23_1 = 0
			local var_23_2 = 0

			if var_23_0.bestMedal > 0 then
				var_23_2 = var_23_0["tier" .. var_23_0.bestMedal]
				var_23_1 = var_23_0.scoreType == "time" and -10 or 10
			else
				var_23_2 = var_23_0.tier1
				var_23_1 = var_23_0.scoreType == "time" and 10 or -10
			end

			PlayerData.BFFBGAJGD(arg_8_1, CoD.StatsGroup.Ranked).trialsBestScore[var_23_0.playerDataId]:set(var_23_2 + var_23_1)
			OnlineProgression.CHAHIBGCEG(arg_8_1, arg_23_1._index, var_23_0.bestMedal)

			var_8_3 = TRIALS.GetTrialsEventData(arg_8_1)

			var_0_0(arg_23_0, arg_8_1, var_8_3)
			arg_23_0.TrialsList:RefreshContent()
			Engine.DAGFFDGFII("uploadstats", arg_8_1)

			return true
		end
	end

	local function var_8_12(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
		if Engine.BHICADFIHA() and arg_24_0._lastSelectedItem == arg_24_1._index then
			local var_24_0 = Dvar.CFHDGABACF("NRTPTSNRNK")

			Dvar.DFIJDJFIFD("NRTPTSNRNK", var_24_0 + arg_24_3)

			var_8_3 = TRIALS.GetTrialsEventData(arg_8_1)

			arg_24_0.TrialsList:RefreshContent()
			arg_24_0.UpdateDebugStartTime()

			return true
		end
	end

	local function var_8_13(arg_25_0, arg_25_1, arg_25_2)
		local var_25_0 = var_8_3[arg_25_1._index]

		arg_25_0.TrialTitle:setText(Engine.CBBHFCGDIC(var_25_0.ui_name))
		arg_25_0.TrialDesc:setText(Engine.CBBHFCGDIC(var_25_0.ui_description))
		arg_25_0.RewardsDetails:RefreshData(var_25_0)
		arg_25_0.ListTitle:setText(Engine.CBBHFCGDIC("TRIALEVENT/SELECTED_TRIAL_LIST_TITLE", arg_25_1._index, #var_8_3))

		arg_25_0._lastSelectedItem = arg_25_1._index
	end

	arg_8_0.TrialsList:SetRefreshChild(function(arg_26_0, arg_26_1, arg_26_2)
		arg_26_0._index = arg_26_1 + 1

		local var_26_0 = var_8_3[arg_26_0._index]

		arg_26_0:SetupButton(var_26_0)

		if arg_26_0.handlersSet ~= true then
			arg_26_0.handlersSet = true

			arg_26_0:addEventHandler("button_action", function(arg_27_0, arg_27_1)
				return var_8_9(arg_8_0, arg_27_0, arg_27_1)
			end)
			arg_26_0.bindButton:addEventHandler("button_alt2", function(arg_28_0, arg_28_1)
				return var_8_10(arg_8_0, arg_26_0, arg_28_1)
			end)

			if Engine.BHICADFIHA() then
				arg_26_0.bindButton:addEventHandler("button_right_trigger", function(arg_29_0, arg_29_1)
					return var_8_11(arg_8_0, arg_26_0, arg_29_1)
				end)
				arg_26_0.bindButton:addEventHandler("button_shoulderl", function(arg_30_0, arg_30_1)
					return var_8_12(arg_8_0, arg_26_0, arg_30_1, -86400)
				end)
				arg_26_0.bindButton:addEventHandler("button_shoulderr", function(arg_31_0, arg_31_1)
					return var_8_12(arg_8_0, arg_26_0, arg_31_1, 86400)
				end)
			end

			arg_26_0:addEventHandler("gain_focus", function(arg_32_0, arg_32_1)
				var_8_13(arg_8_0, arg_32_0)

				return true
			end)
			arg_26_0:addEventHandler("button_over", function(arg_33_0, arg_33_1)
				var_8_13(arg_8_0, arg_33_0)

				return true
			end)
			arg_26_0:addEventHandler("button_over_disable", function(arg_34_0, arg_34_1)
				var_8_13(arg_8_0, arg_34_0)

				return true
			end)
		end
	end)
	arg_8_0.TrialsList:SetNumChildren(5)
	arg_8_0.TrialsList:RefreshContent()
	arg_8_0.TrialsList:FocusFirstItem()
	var_0_0(arg_8_0, arg_8_1, var_8_3)
	var_0_1(arg_8_0, arg_8_1)

	if Engine.BHICADFIHA() then
		arg_8_0:registerEventHandler("debug_refresh_medals", function(arg_35_0, arg_35_1)
			var_8_3 = TRIALS.GetTrialsEventData(arg_8_1)

			var_0_0(arg_35_0, arg_8_1, var_8_3)

			return true
		end)
	end

	local var_8_14 = arg_8_0.EventTimeLeftLabel:GetCurrentAnchorsAndPositions().left + LAYOUT.GetTextWidth(arg_8_0.EventTimeLeftLabel)
	local var_8_15 = 10 * _1080p
	local var_8_16 = 200 * _1080p

	arg_8_0.EventTimeLeftHours:SetLeft(var_8_14 + var_8_15)
	arg_8_0.EventTimeLeftHours:SetRight(var_8_14 + var_8_15 + var_8_16)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_8_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_8_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_8_0, arg_8_1)
	var_0_2(arg_8_0, arg_8_1)
end

function TrialEventContainer(arg_36_0, arg_36_1)
	local var_36_0 = LUI.UIHorizontalNavigator.new()

	var_36_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_36_0.id = "TrialEventContainer"

	local var_36_1 = arg_36_1 and arg_36_1.controllerIndex

	if not var_36_1 and not Engine.DDJFBBJAIG() then
		var_36_1 = var_36_0:getRootController()
	end

	assert(var_36_1)
	var_0_4(var_36_0, var_36_1, arg_36_1)

	local var_36_2 = var_36_0
	local var_36_3
	local var_36_4 = LUI.UIImage.new()

	var_36_4.id = "Darken"

	var_36_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_36_4:SetAlpha(0.7, 0)
	var_36_0:addElement(var_36_4)

	var_36_0.Darken = var_36_4

	local var_36_5
	local var_36_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_36_1
	})

	var_36_6.id = "TabBacker"

	var_36_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_36_0:addElement(var_36_6)

	var_36_0.TabBacker = var_36_6

	local var_36_7
	local var_36_8 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_36_1
	})

	var_36_8.id = "MPPlayerDetails"

	var_36_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
	var_36_0:addElement(var_36_8)

	var_36_0.MPPlayerDetails = var_36_8

	local var_36_9
	local var_36_10 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_36_1
	})

	var_36_10.id = "BGLeft"

	var_36_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_36_10:SetAlpha(0.5, 0)
	var_36_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 96, _1080p * -1438, _1080p * 573, _1080p * -143)
	var_36_0:addElement(var_36_10)

	var_36_0.BGLeft = var_36_10

	local var_36_11
	local var_36_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_36_1
	})

	var_36_12.id = "MenuTitle"

	var_36_12.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/MODE_NAME")), 0)
	var_36_12.Line:SetLeft(0, 0)
	var_36_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_36_0:addElement(var_36_12)

	var_36_0.MenuTitle = var_36_12

	local var_36_13
	local var_36_14 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_36_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("TrialEventListButton", {
				controllerIndex = var_36_1
			})
		end,
		refreshChild = function(arg_38_0, arg_38_1, arg_38_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 375,
		rowHeight = _1080p * 210,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_36_15 = LUI.UIGrid.new(var_36_14)

	var_36_15.id = "TrialsList"

	var_36_15:setUseStencil(true)
	var_36_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 640, _1080p * 1724, _1080p * -375, _1080p * -165)
	var_36_0:addElement(var_36_15)

	var_36_0.TrialsList = var_36_15

	local var_36_16
	local var_36_17 = LUI.UIText.new()

	var_36_17.id = "TrialTitle"

	var_36_17:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_36_17:setText("", 0)
	var_36_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_36_17:SetAlignment(LUI.Alignment.Left)
	var_36_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 654, _1080p * 1285, _1080p * 217, _1080p * 267)
	var_36_0:addElement(var_36_17)

	var_36_0.TrialTitle = var_36_17

	local var_36_18
	local var_36_19 = LUI.UIText.new()

	var_36_19.id = "TrialDesc"

	var_36_19:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_36_19:setText("", 0)
	var_36_19:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_36_19:SetAlignment(LUI.Alignment.Left)
	var_36_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 654, _1080p * 1192, _1080p * 277, _1080p * 299)
	var_36_0:addElement(var_36_19)

	var_36_0.TrialDesc = var_36_19

	local var_36_20
	local var_36_21 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_36_1
	})

	var_36_21.id = "HorizontalScrollbar"

	var_36_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 640, _1080p * 1724, _1080p * -139, _1080p * -134)
	var_36_0:addElement(var_36_21)

	var_36_0.HorizontalScrollbar = var_36_21

	local var_36_22
	local var_36_23 = LUI.UIImage.new()

	var_36_23.id = "Logo"

	var_36_23:setImage(RegisterMaterial("trial_event_logo"), 0)
	var_36_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 161, _1080p * 417, _1080p * 164, _1080p * 420)
	var_36_0:addElement(var_36_23)

	var_36_0.Logo = var_36_23

	local var_36_24
	local var_36_25 = MenuBuilder.BuildRegisteredType("TrialEventRewardsDetails", {
		controllerIndex = var_36_1
	})

	var_36_25.id = "RewardsDetails"

	var_36_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1382, _1080p * 1790, _1080p * 217, _1080p * 517)
	var_36_0:addElement(var_36_25)

	var_36_0.RewardsDetails = var_36_25

	local var_36_26
	local var_36_27 = LUI.UIText.new()

	var_36_27.id = "EventTimeLeftLabel"

	var_36_27:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_36_27:setText(Engine.CBBHFCGDIC("TRIALEVENT/TIME_LEFT_LABEL"), 0)
	var_36_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_36_27:SetWordWrap(false)
	var_36_27:SetAlignment(LUI.Alignment.Left)
	var_36_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_36_27:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -1687, _1080p * 534, _1080p * 562)
	var_36_0:addElement(var_36_27)

	var_36_0.EventTimeLeftLabel = var_36_27

	local var_36_28
	local var_36_29 = MenuBuilder.BuildRegisteredType("TrialEventEarnedMedalsContainer", {
		controllerIndex = var_36_1
	})

	var_36_29.id = "TrialEventEarnedMedals"

	var_36_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 464, _1080p * 631, _1080p * 759)
	var_36_0:addElement(var_36_29)

	var_36_0.TrialEventEarnedMedals = var_36_29

	local var_36_30
	local var_36_31 = LUI.UIText.new()

	var_36_31.id = "ListTitle"

	var_36_31:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_36_31:setText("", 0)
	var_36_31:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_36_31:SetAlignment(LUI.Alignment.Left)
	var_36_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 649, _1080p * 1149, _1080p * 667, _1080p * 689)
	var_36_0:addElement(var_36_31)

	var_36_0.ListTitle = var_36_31

	local var_36_32
	local var_36_33 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_36_1
	})

	var_36_33.id = "EventTimeLeftHours"

	var_36_33:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_36_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_36_33:SetAlignment(LUI.Alignment.Left)
	var_36_33:setEndTime(0)
	var_36_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 221, _1080p * 421, _1080p * 534, _1080p * 564)
	var_36_0:addElement(var_36_33)

	var_36_0.EventTimeLeftHours = var_36_33

	local var_36_34
	local var_36_35 = LUI.UIImage.new()

	var_36_35.id = "DividerTotalMedal"

	var_36_35:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_36_35:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_36_35:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -382, _1080p * -1920, _1080p * -413, _1080p * -412)
	var_36_0:addElement(var_36_35)

	var_36_0.DividerTotalMedal = var_36_35

	local var_36_36
	local var_36_37 = LUI.UIText.new()

	var_36_37.id = "WelcomLabel"

	var_36_37:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_36_37:setText(Engine.CBBHFCGDIC("TRIALEVENT/WELCOME_DESCRIPTION"), 0)
	var_36_37:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_36_37:SetAlignment(LUI.Alignment.Center)
	var_36_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 484, _1080p * 410, _1080p * 432)
	var_36_0:addElement(var_36_37)

	var_36_0.WelcomLabel = var_36_37

	local var_36_38
	local var_36_39 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_36_1
	})

	var_36_39.id = "ChallengeHeader"

	var_36_39.Text:setText(Engine.CBBHFCGDIC("TRIALEVENT/TOTAL_MEDALS_TITLE"), 0)
	var_36_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 359, _1080p * 573, _1080p * 619)
	var_36_0:addElement(var_36_39)

	var_36_0.ChallengeHeader = var_36_39

	local var_36_40
	local var_36_41 = LUI.UIText.new()

	var_36_41.id = "MedalRewardLabel"

	var_36_41:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_36_41:setText(Engine.CBBHFCGDIC("TRIALEVENT/GOLD_REWARD_TITLE"), 0)
	var_36_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_36_41:SetAlignment(LUI.Alignment.Left)
	var_36_41:SetOptOutRightToLeftAlignmentFlip(true)
	var_36_41:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 218, _1080p * -1526, _1080p * 800, _1080p * 824)
	var_36_0:addElement(var_36_41)

	var_36_0.MedalRewardLabel = var_36_41

	local var_36_42
	local var_36_43 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_36_1
	})

	var_36_43.id = "GoldRewardCard"

	var_36_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 124, _1080p * 206, _1080p * 800, _1080p * 910)
	var_36_0:addElement(var_36_43)

	var_36_0.GoldRewardCard = var_36_43

	local var_36_44
	local var_36_45 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_36_1
	})

	var_36_45.id = "GoldRewardPromptContainer"

	if CONDITIONS.AlwaysFalse(var_36_0) then
		var_36_45.Label:setText(Engine.CBBHFCGDIC("TRIALEVENT/PREVIEW_REWARD"), 0)
	end

	var_36_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 218, _1080p * 363, _1080p * 880, _1080p * 910)
	var_36_0:addElement(var_36_45)

	var_36_0.GoldRewardPromptContainer = var_36_45

	local var_36_46
	local var_36_47 = MenuBuilder.BuildRegisteredType("TrialEventListArrow", {
		controllerIndex = var_36_1
	})

	var_36_47.id = "LeftArrow"

	var_36_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 546, _1080p * 616, _1080p * 748, _1080p * 872)
	var_36_0:addElement(var_36_47)

	var_36_0.LeftArrow = var_36_47

	local var_36_48
	local var_36_49 = MenuBuilder.BuildRegisteredType("TrialEventListArrow", {
		controllerIndex = var_36_1
	})

	var_36_49.id = "RightArrow"

	var_36_49.Arrow:SetZRotation(270, 0)
	var_36_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1748, _1080p * 1818, _1080p * 748, _1080p * 873)
	var_36_0:addElement(var_36_49)

	var_36_0.RightArrow = var_36_49

	local var_36_50 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_36_21,
		startCap = var_36_21.startCap,
		endCap = var_36_21.endCap,
		sliderArea = var_36_21.sliderArea,
		slider = var_36_21.sliderArea and var_36_21.sliderArea.slider,
		fixedSizeSlider = var_36_21.sliderArea and var_36_21.sliderArea.fixedSizeSlider
	})

	var_36_15:AddScrollbar(var_36_50)
	var_36_15:AddArrow(var_36_47)
	var_36_15:AddArrow(var_36_49)

	function var_36_0.addButtonHelperFunction(arg_39_0, arg_39_1)
		arg_39_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("TRIALEVENT/PREVIEW_REWARD"),
			container = var_36_45
		})
	end

	var_36_0:addEventHandler("menu_create", var_36_0.addButtonHelperFunction)

	local var_36_51 = LUI.UIBindButton.new()

	var_36_51.id = "selfBindButton"

	var_36_0:addElement(var_36_51)

	var_36_0.bindButton = var_36_51

	var_0_5(var_36_0, var_36_1, arg_36_1)

	return var_36_0
end

MenuBuilder.registerType("TrialEventContainer", TrialEventContainer)
LockTable(_M)
