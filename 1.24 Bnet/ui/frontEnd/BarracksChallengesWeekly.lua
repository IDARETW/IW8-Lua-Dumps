module(..., package.seeall)

local var_0_0 = 1000
local var_0_1 = 604800

local function var_0_2(arg_1_0)
	local var_1_0 = arg_1_0._challenges and arg_1_0._challenges[arg_1_0._season]
	local var_1_1 = arg_1_0._brChallenges and arg_1_0._brChallenges[arg_1_0._season]

	return var_1_0, var_1_1
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1[arg_2_0]

	if var_2_0 and var_2_0.numWeeks then
		for iter_2_0 = 1, var_2_0.numWeeks do
			local var_2_1 = var_2_0[iter_2_0]

			if var_2_1 then
				Challenge.SortByNearestComplete(var_2_1)
			end
		end
	end
end

local function var_0_4(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = ScheduledChallenges.EBFEIJBCEC(arg_3_1)
	local var_3_2 = StringTable.BFHCAIIDA(CSV.weeklyChallenges.file)

	for iter_3_0 = 0, var_3_2 - 1 do
		local var_3_3 = CSV.ReadRow(CSV.weeklyChallenges, iter_3_0)
		local var_3_4 = tonumber(var_3_3.start)
		local var_3_5 = tonumber(var_3_3.length)
		local var_3_6 = tonumber(Engine.DEIDGHDBHD()) + Dvar.CFHDGABACF("MNRLLKTLPT")

		if var_3_4 >= 0 and var_3_4 <= var_3_6 and var_3_6 <= var_3_5 then
			local var_3_7 = split(var_3_3.ref, "_")
			local var_3_8 = tonumber(var_3_3.season)
			local var_3_9 = tonumber(var_3_7[5])

			if not var_3_0[var_3_8] then
				var_3_0[var_3_8] = {}
				var_3_0[var_3_8].numWeeks = 0
			end

			if not var_3_0[var_3_8][var_3_9] then
				var_3_0[var_3_8][var_3_9] = {}
				var_3_0[var_3_8][var_3_9].isWeekLocked = false
				var_3_0[var_3_8][var_3_9].numComplete = 0
				var_3_0[var_3_8].numWeeks = var_3_0[var_3_8].numWeeks + 1
			end

			var_3_3.amountNeeded = tonumber(var_3_3.amount)

			if var_3_1 and var_3_1[var_3_3.id] then
				var_3_3.amountEarned = var_3_1[var_3_3.id]
			else
				var_3_3.amountEarned = 0
			end

			var_3_3.progress = var_3_3.amountEarned / var_3_3.amountNeeded
			var_3_3.progress = LUI.clamp(var_3_3.progress, 0, 1)
			var_3_3.isComplete = var_3_3.amountEarned >= var_3_3.amountNeeded
			var_3_3.type = Challenge.Type.WEEKLY
			var_3_3.rewards = Challenge.GetRewards(var_3_3, var_3_3.type)
			var_3_3.unlocked = Engine.CFHBIHABCB(arg_3_1)

			table.insert(var_3_0[var_3_8][var_3_9], var_3_3)
		end
	end

	var_0_3(arg_3_0._season, var_3_0)

	arg_3_0._challenges = var_3_0
end

local function var_0_5(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = ScheduledChallenges.BCFEBEHEBI(arg_4_1)
	local var_4_2 = StringTable.BFHCAIIDA(CSV.brWeeklyChallenges.file)

	for iter_4_0 = 0, var_4_2 - 1 do
		local var_4_3 = CSV.ReadRow(CSV.brWeeklyChallenges, iter_4_0)
		local var_4_4 = tonumber(var_4_3.start)
		local var_4_5 = tonumber(var_4_3.length)
		local var_4_6 = tonumber(Engine.DEIDGHDBHD()) + Dvar.CFHDGABACF("MNRLLKTLPT")

		if var_4_4 >= 0 and var_4_4 <= var_4_6 and var_4_6 <= var_4_5 then
			local var_4_7 = split(var_4_3.ref, "_")
			local var_4_8 = tonumber(var_4_3.season)
			local var_4_9 = tonumber(var_4_7[6])

			if not var_4_0[var_4_8] then
				var_4_0[var_4_8] = {}
				var_4_0[var_4_8].numWeeks = 0
			end

			if not var_4_0[var_4_8][var_4_9] then
				var_4_0[var_4_8][var_4_9] = {}
				var_4_0[var_4_8].numWeeks = var_4_0[var_4_8].numWeeks + 1
				var_4_0[var_4_8][var_4_9].numComplete = 0
			end

			var_4_3.amountNeeded = tonumber(var_4_3.amount)

			if var_4_1 and var_4_1[var_4_3.id] then
				var_4_3.amountEarned = var_4_1[var_4_3.id]
			else
				var_4_3.amountEarned = 0
			end

			var_4_3.progress = var_4_3.amountEarned / var_4_3.amountNeeded
			var_4_3.progress = LUI.clamp(var_4_3.progress, 0, 1)
			var_4_3.isComplete = var_4_3.amountEarned >= var_4_3.amountNeeded
			var_4_3.type = Challenge.Type.BR_WEEKLY
			var_4_3.rewards = Challenge.GetRewards(var_4_3, var_4_3.type)
			var_4_3.unlocked = true

			table.insert(var_4_0[var_4_8][var_4_9], var_4_3)
		end
	end

	var_0_3(arg_4_0._season, var_4_0)

	arg_4_0._brChallenges = var_4_0
end

local function var_0_6(arg_5_0, arg_5_1)
	if arg_5_0._challenges and arg_5_0._brChallenges and arg_5_0._season and arg_5_0._challenges[arg_5_0._season] and arg_5_0._brChallenges[arg_5_0._season] and arg_5_0._currentActiveWeek then
		local var_5_0 = arg_5_0._challenges[arg_5_0._season][arg_5_0._currentActiveWeek]
		local var_5_1 = arg_5_0._brChallenges[arg_5_0._season][arg_5_0._currentActiveWeek]
		local var_5_2 = Challenge.GetCurrentWeekChallengesData(arg_5_1, var_5_0, var_5_1)

		arg_5_0.CurrentWeekChallenges:PopulateWeeklyChallenges(arg_5_1, arg_5_0._currentActiveWeek, var_5_2)
	else
		arg_5_0.CurrentWeekChallenges:SetAlpha(0)
	end
end

local function var_0_7(arg_6_0)
	local var_6_0, var_6_1 = var_0_2(arg_6_0)

	if var_6_0 or var_6_1 then
		local var_6_2 = 0

		if var_6_0 then
			var_6_2 = arg_6_0._challenges[arg_6_0._season].numWeeks
		elseif var_6_1 then
			var_6_2 = arg_6_0._brChallenges[arg_6_0._season].numWeeks
		end

		if var_6_2 and var_6_2 > 0 then
			arg_6_0.Grid:SetNumChildren(var_6_2)
		end
	else
		arg_6_0.Grid:SetNumChildren(0)
	end

	arg_6_0.Grid:SetRefreshChild(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_6_0._challenges and arg_6_0._challenges[arg_6_0._season] and #arg_6_0._challenges[arg_6_0._season] > 0 or arg_6_0._brChallenges and arg_6_0._brChallenges[arg_6_0._season] and #arg_6_0._brChallenges[arg_6_0._season] > 0 then
			local var_7_0 = arg_7_1 + arg_7_2 * arg_6_0.Grid:GetNumColumns()
			local var_7_1 = {
				[Challenge.Type.WEEKLY] = {},
				[Challenge.Type.BR_WEEKLY] = {}
			}

			if var_6_0 and arg_6_0._challenges[arg_6_0._season][var_7_0 + 1] then
				var_7_1[Challenge.Type.WEEKLY] = arg_6_0._challenges[arg_6_0._season][var_7_0 + 1]
			end

			if var_6_1 and arg_6_0._brChallenges[arg_6_0._season][var_7_0 + 1] then
				var_7_1[Challenge.Type.BR_WEEKLY] = arg_6_0._brChallenges[arg_6_0._season][var_7_0 + 1]
			end

			arg_7_0:Setup(arg_6_0, var_7_1, var_7_0 + 1)
		end
	end)
	arg_6_0.Grid:FocusFirstItem()
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._season = SEASON.GetCurrentSeason()

	arg_8_0.CurrentWeekChallenges:closeTree()

	arg_8_0.CurrentWeekChallenges = nil
	arg_8_0._currentActiveWeek = 1

	arg_8_0:registerEventHandler("challenges_update_locked", function(arg_9_0, arg_9_1)
		if arg_9_1.locked then
			ACTIONS.AnimateSequence(arg_8_0, "NoChallenges")
		else
			ACTIONS.AnimateSequence(arg_8_0, "Challenges")
		end

		local var_9_0 = CONDITIONS.IsMagmaGameMode() and arg_9_1.brChallenges or arg_9_1.coreChallenges
		local var_9_1 = CONDITIONS.IsMagmaGameMode() and Challenge.Type.BR_WEEKLY or Challenge.Type.WEEKLY

		arg_8_0.WeeklyChallengesSummary:PreviewWeekly(arg_8_1, var_9_0, var_9_1)
	end)
	var_0_4(arg_8_0, arg_8_1)
	var_0_5(arg_8_0, arg_8_1)

	local var_8_0, var_8_1 = var_0_2(arg_8_0)

	if (not var_8_0 or #arg_8_0._challenges[arg_8_0._season] <= 0) and (not var_8_1 or #arg_8_0._brChallenges[arg_8_0._season] <= 0) then
		arg_8_0.NoChallengesLabel:SetAlpha(1)
		arg_8_0.WeeklyChallengesSummary:SetAlpha(0)
	else
		arg_8_0.NoChallengesLabel:SetAlpha(0)
	end

	var_0_7(arg_8_0)

	if Dvar.IBEGCHEFE("NPOLQSQMNO") then
		local var_8_2 = SEASON.GetName(SEASON.GetCurrentSeason())

		if var_8_2 and #var_8_2 > 0 then
			arg_8_0.SeasonText:setText(Engine.CBBHFCGDIC(var_8_2))
		end

		Challenge.SetupSeasonEndsTimer(arg_8_0, arg_8_0.SeasonEnd, "CHALLENGE/RESET_TIME")
	end

	arg_8_0:registerEventHandler("challenges_open_weekly_tabs", function(arg_10_0, arg_10_1)
		arg_8_2.activeIndex = arg_10_1.index
		arg_8_2.challenges = arg_8_0._challenges[arg_8_0._season]
		arg_8_2.brChallenges = arg_8_0._brChallenges[arg_8_0._season]

		LUI.FlowManager.RequestAddMenu("BarracksChallengesWeeklyTabs", true, arg_10_1.controller, false, arg_8_2, false)
	end)
	arg_8_0:addEventHandler("restore_focus", function(arg_11_0, arg_11_1)
		local var_11_0 = LUI.FlowManager.GetScopedData(arg_8_0)

		if var_11_0.weekTabIndex then
			local var_11_1 = arg_8_0.Grid:GetPositionForIndex(var_11_0.weekTabIndex)

			arg_8_0.Grid:SetFocusedPosition(var_11_1, true, false, false, false)
		end
	end)
end

function BarracksChallengesWeekly(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "BarracksChallengesWeekly"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BarracksChallengeItemWeek", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 64,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_5 = LUI.UIGrid.new(var_12_4)

	var_12_5.id = "Grid"

	var_12_5:setUseStencil(true)
	var_12_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 582, _1080p * 216, _1080p * 890)
	var_12_0:addElement(var_12_5)

	var_12_0.Grid = var_12_5

	local var_12_6
	local var_12_7 = LUI.UIImage.new()

	var_12_7.id = "Line1"

	var_12_7:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_7:SetAlpha(0.4, 0)
	var_12_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 578, _1080p * 208, _1080p * 209)
	var_12_0:addElement(var_12_7)

	var_12_0.Line1 = var_12_7

	local var_12_8
	local var_12_9 = LUI.UIStyledText.new()

	var_12_9.id = "SeasonText"

	var_12_9:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_9:setText("", 0)
	var_12_9:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_12_9:SetWordWrap(false)
	var_12_9:SetAlignment(LUI.Alignment.Left)
	var_12_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 408, _1080p * 182, _1080p * 204)
	var_12_0:addElement(var_12_9)

	var_12_0.SeasonText = var_12_9

	local var_12_10
	local var_12_11 = LUI.UIStyledText.new()

	var_12_11.id = "SeasonEnd"

	var_12_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_11:setText("", 0)
	var_12_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_12_11:SetWordWrap(false)
	var_12_11:SetAlignment(LUI.Alignment.Right)
	var_12_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 414, _1080p * 578, _1080p * 182, _1080p * 204)
	var_12_0:addElement(var_12_11)

	var_12_0.SeasonEnd = var_12_11

	local var_12_12
	local var_12_13 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_12_1
	})

	var_12_13.id = "VerticalMinimalScrollbar"

	var_12_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 107, _1080p * 216, _1080p * 890)
	var_12_0:addElement(var_12_13)

	var_12_0.VerticalMinimalScrollbar = var_12_13

	local var_12_14
	local var_12_15 = LUI.UIText.new()

	var_12_15.id = "NoChallengesLabel"

	var_12_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_15:SetAlpha(0, 0)
	var_12_15:setText(Engine.CBBHFCGDIC("CHALLENGE/NONE_AVAILABLE"), 0)
	var_12_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_15:SetAlignment(LUI.Alignment.Center)
	var_12_15:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -12, _1080p * 12)
	var_12_0:addElement(var_12_15)

	var_12_0.NoChallengesLabel = var_12_15

	local var_12_16
	local var_12_17 = MenuBuilder.BuildRegisteredType("BarracksChallengesSummary", {
		controllerIndex = var_12_1
	})

	var_12_17.id = "WeeklyChallengesSummary"

	var_12_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1664, _1080p * 200, _1080p * 976)
	var_12_0:addElement(var_12_17)

	var_12_0.WeeklyChallengesSummary = var_12_17

	local var_12_18
	local var_12_19 = MenuBuilder.BuildRegisteredType("CurrentWeekChallenges", {
		controllerIndex = var_12_1
	})

	var_12_19.id = "CurrentWeekChallenges"

	var_12_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 816, _1080p * 1616, _1080p * 195, _1080p * 995)
	var_12_0:addElement(var_12_19)

	var_12_0.CurrentWeekChallenges = var_12_19

	local function var_12_20()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_20

	local var_12_21
	local var_12_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_17:RegisterAnimationSequence("NoChallenges", var_12_22)

	local function var_12_23()
		var_12_17:AnimateSequence("NoChallenges")
	end

	var_12_0._sequences.NoChallenges = var_12_23

	local var_12_24
	local var_12_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_17:RegisterAnimationSequence("Challenges", var_12_25)

	local function var_12_26()
		var_12_17:AnimateSequence("Challenges")
	end

	var_12_0._sequences.Challenges = var_12_26

	local var_12_27 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_12_13,
		startCap = var_12_13.startCap,
		endCap = var_12_13.endCap,
		sliderArea = var_12_13.sliderArea,
		slider = var_12_13.sliderArea and var_12_13.sliderArea.slider,
		fixedSizeSlider = var_12_13.sliderArea and var_12_13.sliderArea.fixedSizeSlider
	})

	var_12_5:AddScrollbar(var_12_27)
	var_0_8(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("BarracksChallengesWeekly", BarracksChallengesWeekly)
LockTable(_M)
