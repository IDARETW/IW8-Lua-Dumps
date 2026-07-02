module(..., package.seeall)

local var_0_0 = 150
local var_0_1 = 900

local function var_0_2(arg_1_0)
	local var_1_0 = arg_1_0.participationChallengesData
	local var_1_1 = #arg_1_0.participationChallengesData

	arg_1_0.toComplete = {}

	arg_1_0.Grid:SetNumChildren(var_1_1)
	arg_1_0.Grid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + 1
		local var_2_1 = var_1_0[var_2_0]

		arg_2_0._column = arg_2_1
		arg_2_0._challengeIndex = var_2_0
		arg_1_0._curGame = var_2_1 and var_2_1.gameSource or nil

		arg_2_0:SetChallengeData(var_2_1)

		if arg_2_0.shouldShowComplete then
			table.insert(arg_1_0.toComplete, var_2_0)
		end

		arg_2_0:addEventHandler("gain_focus", function(arg_3_0, arg_3_1)
			arg_1_0.Pips:SetActive(arg_2_0._challengeIndex)

			arg_1_0._selectedChallengeIndex = arg_2_0._challengeIndex

			if LUI.IsLastInputKeyboardMouse(arg_1_0._controllerIndex) then
				if arg_2_0._challengeIndex == #arg_1_0.participationChallengesData then
					arg_1_0.ArrowRight:LoseFocus({})
					arg_1_0.ArrowLeft:SetButtonDisabled(false)
				elseif arg_2_0._challengeIndex == 1 then
					arg_1_0.ArrowLeft:LoseFocus({})
					arg_1_0.ArrowRight:SetButtonDisabled(false)
				end
			end

			if arg_2_0.shouldShowComplete then
				arg_2_0:ShowCompleteAnim()
			end

			return true
		end)

		if arg_2_0.ChallengeReward then
			arg_2_0.ChallengeReward:SetupEventHandlers()
		end

		arg_2_0:SetPromptsEnabled(true)
	end)
	arg_1_0.Grid:RefreshContent()
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_1 = LUI.clamp(arg_4_1, 1, #arg_4_0.participationChallengesData)

	if arg_4_0._isAnimating or arg_4_0._selectedChallengeIndex == arg_4_1 then
		return
	end

	local var_4_0 = LUI.clamp(arg_4_1 - 1, 0, #arg_4_0.participationChallengesData)
	local var_4_1 = {
		y = 0,
		x = var_4_0
	}

	arg_4_0.Grid:SetFocusedPosition(var_4_1, false)

	arg_4_0._isAnimating = true
	arg_4_0:Wait(var_0_0).onComplete = function()
		arg_4_0._isAnimating = false
	end
	arg_4_0._selectedChallengeIndex = arg_4_1
end

local function var_0_4(arg_6_0)
	var_0_3(arg_6_0, arg_6_0._selectedChallengeIndex + 1)
end

local function var_0_5(arg_7_0)
	var_0_3(arg_7_0, arg_7_0._selectedChallengeIndex - 1)
end

local function var_0_6(arg_8_0)
	arg_8_0.Grid:SetMaxVisibleColumns(1)
	arg_8_0.Grid:SetUpdateArrowVisibilityOnRefresh(false)

	arg_8_0.Grid._disableMouseWheel = true

	arg_8_0.Grid:addEventHandler("gamepad_button", function(arg_9_0, arg_9_1)
		if arg_9_1.qualifier == "mousewheel" then
			if arg_9_1.button == "down" then
				var_0_4(arg_8_0)
			elseif arg_9_1.button == "up" then
				var_0_5(arg_8_0)
			end
		end
	end)

	local var_8_0 = 0
	local var_8_1 = 0.5

	GRID.SetUpArrowScrolling(arg_8_0, arg_8_0._controllerIndex, {
		numGridItemsShown = 1,
		scrollStepsBack = var_8_0,
		scrollStepsForward = var_8_1,
		kbmArrowUI = {
			leftArrow = arg_8_0.ArrowLeft,
			rightArrow = arg_8_0.ArrowRight
		},
		gamePadArrowUI = {
			leftPrompt = arg_8_0.LeftPrompt,
			rightPrompt = arg_8_0.RightPrompt
		}
	})
	arg_8_0.Grid:SetCustomArrowScrollAmount(0.05)
	arg_8_0:registerEventHandler("navigate_with_pip", function(arg_10_0, arg_10_1)
		var_0_3(arg_8_0, arg_10_1.index)
	end)
end

local function var_0_7(arg_11_0, arg_11_1)
	arg_11_0.participationChallengesData = SEASONAL_EVENT.FilterParticipationChallengesData(arg_11_0._controllerIndex, arg_11_1._participationChallengesData)

	var_0_2(arg_11_0)
	arg_11_0.MasteryRewardSquareProgressPanel:Setup(arg_11_1._participationChallengesData)
	arg_11_0.Pips:Setup(arg_11_0._controllerIndex, #arg_11_0.participationChallengesData, true)
	var_0_6(arg_11_0)

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.toComplete) do
		local var_11_0 = math.max(var_0_1 * iter_11_0, 1)

		arg_11_0:Wait(var_11_0).onComplete = function()
			arg_11_0._isAnimating = false

			var_0_3(arg_11_0, iter_11_1)
		end
	end

	local var_11_1 = 1

	for iter_11_2 = 1, #arg_11_0.participationChallengesData do
		var_11_1 = iter_11_2

		if not arg_11_0.participationChallengesData[iter_11_2].isComplete then
			break
		end
	end

	var_0_3(arg_11_0, var_11_1)
end

local function var_0_8(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.SetupData = var_0_7
	arg_13_0.SelectNextChallenge = var_0_4
	arg_13_0.SelectPreviousChallenge = var_0_5
	arg_13_0._controllerIndex = arg_13_1
end

function SeasonalEventParticipationChallengesContainer(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 400 * _1080p)

	var_14_0.id = "SeasonalEventParticipationChallengesContainer"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "Backer"

	var_14_4:setImage(RegisterMaterial("logo_cod_wz_s4_event"), 0)
	var_14_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1200, 0, _1080p * 400)
	var_14_0:addElement(var_14_4)

	var_14_0.Backer = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "LineTopLeft"

	var_14_6:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_14_6:SetAlpha(0.4, 0)
	var_14_6:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 741, _1080p * 1, _1080p * -1)
	var_14_0:addElement(var_14_6)

	var_14_0.LineTopLeft = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIText.new()

	var_14_8.id = "Title"

	var_14_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_8:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/PAR_CHALLENGES"), 0)
	var_14_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_8:SetAlignment(LUI.Alignment.Left)
	var_14_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 388, _1080p * 30, _1080p * 60)
	var_14_0:addElement(var_14_8)

	var_14_0.Title = var_14_8

	local var_14_9
	local var_14_10 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_14_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SeasonalEventParticipationChallenge", {
				controllerIndex = var_14_1
			})
		end,
		refreshChild = function(arg_16_0, arg_16_1, arg_16_2)
			return
		end,
		spacingX = _1080p * 50,
		spacingY = _1080p * 50,
		columnWidth = _1080p * 585,
		rowHeight = _1080p * 250,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_14_11 = LUI.UIGrid.new(var_14_10)

	var_14_11.id = "Grid"

	var_14_11:setUseStencil(true)
	var_14_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 69, _1080p * 654, _1080p * 88, _1080p * 340)
	var_14_0:addElement(var_14_11)

	var_14_0.Grid = var_14_11

	local var_14_12
	local var_14_13 = MenuBuilder.BuildRegisteredType("SeasonalEventSquareProgressPanel", {
		controllerIndex = var_14_1
	})

	var_14_13.id = "MasteryRewardSquareProgressPanel"

	var_14_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 725, _1080p * 1237, _1080p * 26, _1080p * 290)
	var_14_0:addElement(var_14_13)

	var_14_0.MasteryRewardSquareProgressPanel = var_14_13

	local var_14_14
	local var_14_15 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_14_1
	})

	var_14_15.id = "ArrowLeft"

	var_14_15.Arrow:SetZRotation(90, 0)
	var_14_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 56, _1080p * 196, _1080p * 228)
	var_14_0:addElement(var_14_15)

	var_14_0.ArrowLeft = var_14_15

	local var_14_16
	local var_14_17 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_14_1
	})

	var_14_17.id = "ArrowRight"

	var_14_17.Arrow:SetZRotation(-90, 0)
	var_14_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 668, _1080p * 698, _1080p * 196, _1080p * 228)
	var_14_0:addElement(var_14_17)

	var_14_0.ArrowRight = var_14_17

	local var_14_18
	local var_14_19 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_14_1
	}
	local var_14_20 = MenuBuilder.BuildRegisteredType("IconImage", var_14_19)

	var_14_20.id = "LeftPrompt"

	var_14_20:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_14_20:setImage(RegisterMaterial("button_trigger_left"), 0)
	var_14_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 24, _1080p * 56, _1080p * -204, _1080p * -172)
	var_14_0:addElement(var_14_20)

	var_14_0.LeftPrompt = var_14_20

	local var_14_21
	local var_14_22 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_14_1
	}
	local var_14_23 = MenuBuilder.BuildRegisteredType("IconImage", var_14_22)

	var_14_23.id = "RightPrompt"

	var_14_23:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_14_23:setImage(RegisterMaterial("button_trigger_right"), 0)
	var_14_23:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 68, _1080p * 100, _1080p * -204, _1080p * -172)
	var_14_0:addElement(var_14_23)

	var_14_0.RightPrompt = var_14_23

	local var_14_24
	local var_14_25 = MenuBuilder.BuildRegisteredType("UnlocksMenuPips", {
		controllerIndex = var_14_1
	})

	var_14_25.id = "Pips"

	var_14_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 324, _1080p * 344, _1080p * 359, _1080p * 366)
	var_14_0:addElement(var_14_25)

	var_14_0.Pips = var_14_25

	local var_14_26
	local var_14_27 = LUI.UIImage.new()

	var_14_27.id = "LineBottom"

	var_14_27:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_14_27:SetAlpha(0.4, 0)
	var_14_27:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_14_27:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1065, _1080p * 399, _1080p * 401)
	var_14_0:addElement(var_14_27)

	var_14_0.LineBottom = var_14_27

	local var_14_28
	local var_14_29 = LUI.UIImage.new()

	var_14_29.id = "LineTopRight"

	var_14_29:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_14_29:SetAlpha(0.4, 0)
	var_14_29:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_14_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1200, _1080p * 962, _1080p * 1, _1080p * -1)
	var_14_0:addElement(var_14_29)

	var_14_0.LineTopRight = var_14_29

	var_14_11:AddArrow(var_14_17)
	var_14_11:AddArrow(var_14_15)
	var_0_8(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("SeasonalEventParticipationChallengesContainer", SeasonalEventParticipationChallengesContainer)
LockTable(_M)
