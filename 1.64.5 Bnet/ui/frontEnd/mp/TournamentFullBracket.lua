module(..., package.seeall)

local var_0_0 = _1080p * 406
local var_0_1 = _1080p * 738
local var_0_2 = _1080p * 816
local var_0_3 = _1080p * 94

local function var_0_4(arg_1_0, arg_1_1)
	for iter_1_0 = 1, arg_1_1.numMatches do
		assert(arg_1_0["MatchGroup" .. iter_1_0])

		local var_1_0 = arg_1_1.roundData.matches[arg_1_1.matchStart + (iter_1_0 - 1)]

		arg_1_0["MatchGroup" .. iter_1_0]:Update(var_1_0)
	end
end

local function var_0_5(arg_2_0, arg_2_1)
	arg_2_1 = arg_2_1 or {}
	arg_2_1.numMatches = arg_2_1.numMatches or 1

	arg_2_0.TournamentRoundTitle:Setup(arg_2_1)

	for iter_2_0 = 1, arg_2_1.numMatches do
		assert(arg_2_0["MatchGroup" .. iter_2_0])
		arg_2_0["MatchGroup" .. iter_2_0]:SetMatch(iter_2_0, arg_2_1)
	end

	if arg_2_1.isLeft then
		ACTIONS.AnimateSequence(arg_2_0, "Left")
	end
end

local function var_0_6(arg_3_0)
	local var_3_0 = CONDITIONS.IsTournamentFullSize(arg_3_0)
	local var_3_1 = TOURNAMENT.GetFullData()
	local var_3_2 = var_3_1.rounds[1]
	local var_3_3 = var_3_1.rounds[2]
	local var_3_4 = var_3_1.rounds[3]

	var_0_4(arg_3_0.TournamentQuadBracket, {
		matchStart = 1,
		numMatches = 4,
		roundData = var_3_1.rounds[1]
	})
	ACTIONS.AnimateSequence(arg_3_0.TournamentQuadBracket.TournamentRoundTitle, "Left")
	arg_3_0.TournamentQuadBracket.TournamentRoundTitle:SetAlpha(TOURNAMENT.IsRoundComplete(var_3_2) and 0.5 or 1)
	var_0_4(arg_3_0.TournamentDuoBracket, {
		matchStart = 1,
		numMatches = 2,
		roundData = var_3_1.rounds[2]
	})
	ACTIONS.AnimateSequence(arg_3_0.TournamentDuoBracket.TournamentRoundTitle, "Left")
	arg_3_0.TournamentDuoBracket.TournamentRoundTitle:SetAlpha(TOURNAMENT.IsRoundComplete(var_3_3) and 0.5 or 1)
	var_0_4(arg_3_0.TournamentSingleBracket, {
		matchStart = 1,
		numMatches = 1,
		roundData = var_3_1.rounds[3]
	})
	ACTIONS.AnimateSequence(arg_3_0.TournamentSingleBracket.TournamentRoundTitle, "Left")
	arg_3_0.TournamentSingleBracket.TournamentRoundTitle:SetAlpha(TOURNAMENT.IsRoundComplete(var_3_4) and 0.5 or 1)

	if var_3_0 then
		var_0_4(arg_3_0.TournamentFinalsBracket, {
			matchStart = 1,
			numMatches = 1,
			roundData = var_3_1.rounds[4]
		})
		ACTIONS.AnimateSequence(arg_3_0.TournamentFinalsBracket.TournamentRoundTitle, "Center")
		var_0_4(arg_3_0.TournamentQuadBracket2, {
			matchStart = 5,
			numMatches = 4,
			roundData = var_3_1.rounds[1]
		})
		ACTIONS.AnimateSequence(arg_3_0.TournamentQuadBracket2.TournamentRoundTitle, "Right")
		arg_3_0.TournamentQuadBracket2.TournamentRoundTitle:SetAlpha(TOURNAMENT.IsRoundComplete(var_3_2) and 0.5 or 1)
		var_0_4(arg_3_0.TournamentDuoBracket2, {
			matchStart = 3,
			numMatches = 2,
			roundData = var_3_1.rounds[2]
		})
		ACTIONS.AnimateSequence(arg_3_0.TournamentDuoBracket2.TournamentRoundTitle, "Right")
		arg_3_0.TournamentDuoBracket2.TournamentRoundTitle:SetAlpha(TOURNAMENT.IsRoundComplete(var_3_3) and 0.5 or 1)
		var_0_4(arg_3_0.TournamentSingleBracket2, {
			matchStart = 2,
			numMatches = 1,
			roundData = var_3_1.rounds[3]
		})
		ACTIONS.AnimateSequence(arg_3_0.TournamentSingleBracket2.TournamentRoundTitle, "Right")
		arg_3_0.TournamentSingleBracket2.TournamentRoundTitle:SetAlpha(TOURNAMENT.IsRoundComplete(var_3_4) and 0.5 or 1)
	end
end

local function var_0_7(arg_4_0)
	local var_4_0 = CONDITIONS.IsTournamentFullSize(arg_4_0)

	var_0_5(arg_4_0.TournamentQuadBracket, {
		matchStart = 1,
		roundIndex = 1,
		numMatches = 4,
		nextBracket = arg_4_0.TournamentDuoBracket
	})
	var_0_5(arg_4_0.TournamentDuoBracket, {
		numMatches = 2,
		roundIndex = 2,
		matchStart = 5,
		nextBracket = arg_4_0.TournamentSingleBracket,
		prevBracket = arg_4_0.TournamentQuadBracket
	})
	var_0_5(arg_4_0.TournamentSingleBracket, {
		numMatches = 1,
		roundIndex = 3,
		matchStart = 7,
		nextBracket = var_4_0 and arg_4_0.TournamentFinalsBracket or nil,
		prevBracket = arg_4_0.TournamentDuoBracket
	})

	if var_4_0 then
		arg_4_0.TournamentFinalsBracket.TournamentRoundTitle:Setup({
			roundIndex = 4
		})
		var_0_5(arg_4_0.TournamentQuadBracket2, {
			isLeft = true,
			numMatches = 4,
			roundIndex = 1,
			matchStart = 1,
			nextBracket = arg_4_0.TournamentDuoBracket2
		})
		var_0_5(arg_4_0.TournamentDuoBracket2, {
			isLeft = true,
			numMatches = 2,
			matchStart = 5,
			roundIndex = 2,
			nextBracket = arg_4_0.TournamentSingleBracket2,
			prevBracket = arg_4_0.TournamentQuadBracket2
		})
		var_0_5(arg_4_0.TournamentSingleBracket2, {
			isLeft = true,
			numMatches = 1,
			matchStart = 7,
			roundIndex = 3,
			nextBracket = arg_4_0.TournamentFinalsBracket,
			prevBracket = arg_4_0.TournamentDuoBracket2
		})
	end
end

local function var_0_8(arg_5_0, arg_5_1)
	local var_5_0 = {
		scrollingThresholdX = 0,
		maxVisibleColumns = 3,
		wrapY = false,
		maxVisibleRows = 1,
		mouseWheelScrollingOffsetPx = 80,
		maxColumns = 7,
		wrapX = false,
		controllerIndex = arg_5_1,
		spacingX = var_0_3
	}
	local var_5_1 = LUI.UIGrid.new(var_5_0)

	var_5_1.id = "BracketGrid"

	var_5_1:setUseStencil(true)
	var_5_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	arg_5_0.BracketGrid = var_5_1

	local var_5_2 = MenuBuilder.BuildRegisteredType("TournamentQuadBracket", {
		controllerIndex = arg_5_1
	})

	var_5_2.id = "TournamentQuadBracket"

	var_5_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
	var_5_1:AddElement(var_5_2)

	arg_5_0.TournamentQuadBracket = var_5_2

	local var_5_3 = MenuBuilder.BuildRegisteredType("TournamentDuoBracket", {
		controllerIndex = arg_5_1
	})

	var_5_3.id = "TournamentDuoBracket"

	var_5_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
	var_5_1:AddElement(var_5_3)

	arg_5_0.TournamentDuoBracket = var_5_3

	if CONDITIONS.IsTournamentFullSize(arg_5_0) then
		local var_5_4 = MenuBuilder.BuildRegisteredType("TournamentSingleBracket", {
			controllerIndex = arg_5_1
		})

		var_5_4.id = "TournamentSingleBracket"

		var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
		var_5_1:AddElement(var_5_4)

		arg_5_0.TournamentSingleBracket = var_5_4

		local var_5_5 = MenuBuilder.BuildRegisteredType("TournamentFinalsBracket", {
			controllerIndex = arg_5_1
		})

		var_5_5.id = "TournamentFinalsBracket"

		var_5_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_2, 0, var_0_1)
		var_5_1:AddElement(var_5_5)

		arg_5_0.TournamentFinalsBracket = var_5_5

		assert(var_5_5.MatchGroup1)
		var_5_5.MatchGroup1:addEventHandler("gain_focus", function(arg_6_0, arg_6_1)
			if arg_6_1.focusType == FocusType.MouseOver then
				return
			end

			if arg_6_1.direction == "right" then
				var_5_1:processEvent({
					name = "ensure_line_visible",
					line = 4.73,
					direction = LUI.DIRECTION.horizontal
				})
			elseif arg_6_1.direction == "left" then
				var_5_1:processEvent({
					name = "ensure_line_visible",
					line = 2.09,
					direction = LUI.DIRECTION.horizontal
				})
			end
		end)

		local var_5_6 = MenuBuilder.BuildRegisteredType("TournamentSingleBracket", {
			controllerIndex = arg_5_1
		})

		var_5_6.id = "TournamentSingleBracket2"

		var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
		var_5_1:AddElement(var_5_6)

		arg_5_0.TournamentSingleBracket2 = var_5_6

		local var_5_7 = MenuBuilder.BuildRegisteredType("TournamentDuoBracket", {
			controllerIndex = arg_5_1
		})

		var_5_7.id = "TournamentDuoBracket2"

		var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
		var_5_1:AddElement(var_5_7)

		arg_5_0.TournamentDuoBracket2 = var_5_7

		local var_5_8 = MenuBuilder.BuildRegisteredType("TournamentQuadBracket", {
			controllerIndex = arg_5_1
		})

		var_5_8.id = "TournamentQuadBracket2"

		var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
		var_5_1:AddElement(var_5_8)

		arg_5_0.TournamentQuadBracket2 = var_5_8

		local var_5_9 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.horizontal,
			eventListener = arg_5_0.Scrollbar,
			startCap = arg_5_0.Scrollbar.startCap,
			endCap = arg_5_0.Scrollbar.endCap,
			sliderArea = arg_5_0.Scrollbar.sliderArea,
			fixedSizeSlider = arg_5_0.Scrollbar.sliderArea and arg_5_0.Scrollbar.sliderArea.fixedSizeSlider
		})

		var_5_9:SetKBMStyle(true)
		var_5_1:AddScrollbar(var_5_9)
	else
		local var_5_10 = MenuBuilder.BuildRegisteredType("TournamentSingleBracket", {
			controllerIndex = arg_5_1
		})

		var_5_10.id = "TournamentSingleBracket"

		var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_0_0, 0, var_0_1)
		var_5_1:AddElement(var_5_10)

		arg_5_0.TournamentSingleBracket = var_5_10
	end

	local var_5_11 = Tournament.DEAFAIEJGI()
	local var_5_12 = Tournament.BJGJIJIEGG()
	local var_5_13 = 2^(var_5_11 - (var_5_12 + 1))

	if Tournament.DEADJEGBCJ() + 1 > math.ceil(var_5_13 / 2) then
		var_5_1:SetDefaultFocus({
			y = 0,
			x = var_5_1:GetNumChildren() - var_5_12 - 1
		})
	else
		var_5_1:SetDefaultFocus({
			y = 0,
			x = var_5_12
		})
	end

	arg_5_0:addElement(var_5_1)
	var_5_1:addEventHandler("layout_initialized", function(arg_7_0, arg_7_1)
		var_5_1:SetMaxVisibleColumns(var_5_1:GetNumChildren())
		var_5_1:processEvent({
			shouldPlayButtonSound = false,
			name = "gain_focus"
		})
	end)
end

local function var_0_9(arg_8_0, arg_8_1, arg_8_2)
	assert(Tournament.DEAFAIEJGI() > 0)

	arg_8_0.SetupStaticFields = var_0_7
	arg_8_0.UpdateBracket = var_0_6

	var_0_8(arg_8_0, arg_8_1)
	arg_8_0:addElement(CoD.GetWorldBlur())
end

function TournamentFullBracket(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 750 * _1080p)

	var_9_0.id = "TournamentFullBracket"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3

	if CONDITIONS.IsTournamentFullSize(var_9_0) then
		local var_9_4 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
			controllerIndex = var_9_1
		})

		var_9_4.id = "Scrollbar"

		var_9_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 5, _1080p * 15)
		var_9_0:addElement(var_9_4)

		var_9_0.Scrollbar = var_9_4
	end

	var_0_9(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("TournamentFullBracket", TournamentFullBracket)
LockTable(_M)
