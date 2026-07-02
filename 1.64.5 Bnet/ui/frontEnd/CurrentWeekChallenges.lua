module(..., package.seeall)

local var_0_0 = 10

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = MenuBuilder.BuildRegisteredType("BarracksChallengeItem", {
		controllerIndex = arg_1_1
	})

	var_1_0:Setup(arg_1_0, arg_1_2)

	return var_1_0
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	for iter_2_0 = 1, var_0_0 do
		arg_2_0.WeeklyChallengesGrid:AddElement(var_0_1(arg_2_0, arg_2_1, arg_2_3[iter_2_0]))
	end

	arg_2_0.WeekHeader.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/WEEK_N", arg_2_2))
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PopulateWeeklyChallenges = var_0_2

	local var_3_0
	local var_3_1 = {
		buildArrowsLabel = false,
		maxRows = 10,
		maxVisibleRows = 10,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = arg_3_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 8,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_2 = LUI.UIGrid.new(var_3_1)

	var_3_2.id = "WeeklyChallengesGrid"

	var_3_2:setUseStencil(true)
	var_3_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 783, _1080p * 55, _1080p * 765)
	var_3_2:SetMouseFocusBlocker(true)
	arg_3_0:addElement(var_3_2)

	arg_3_0.WeeklyChallengesGrid = var_3_2
end

function CurrentWeekChallenges(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 850 * _1080p, 0, 830 * _1080p)

	var_4_0.id = "CurrentWeekChallenges"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -10, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "WeekHeader"

	var_4_6.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 263, 0, _1080p * 46)
	var_4_0:addElement(var_4_6)

	var_4_0.WeekHeader = var_4_6

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CurrentWeekChallenges", CurrentWeekChallenges)
LockTable(_M)
