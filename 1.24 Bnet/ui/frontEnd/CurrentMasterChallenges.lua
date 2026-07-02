module(..., package.seeall)

local var_0_0 = 4

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = Challenge.GetMasterChallengesCount()
	local var_1_1 = var_1_0 < var_0_0 and var_1_0 or var_0_0

	for iter_1_0 = 1, var_1_1 do
		local var_1_2 = MenuBuilder.BuildRegisteredType("CurrentMasterChallengeWidget", {
			controllerIndex = arg_1_1
		})
		local var_1_3 = arg_1_0._challengeData[iter_1_0]

		var_1_2:Setup(arg_1_0, var_1_3)
		arg_1_0.Grid:AddElement(var_1_2)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0
	local var_2_1 = {
		buildArrowsLabel = false,
		maxRows = 4,
		maxVisibleRows = 4,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = arg_2_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 20,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_2_2 = LUI.UIGrid.new(var_2_1)

	var_2_2.id = "Grid"

	var_2_2:setUseStencil(true)
	var_2_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 825, _1080p * 75, _1080p * 775)
	var_2_2:SetMouseFocusBlocker(true)
	arg_2_0:addElement(var_2_2)

	arg_2_0.Grid = var_2_2
end

local function var_0_3(arg_3_0, arg_3_1)
	var_0_2(arg_3_0, arg_3_1)

	local var_3_0 = Challenge.GetMasterChallengesCount()
	local var_3_1 = Challenge.GetCompletedStickerBookChallengeCount(arg_3_1)

	arg_3_0.ChallengeCompletionStatus:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_COMPLETION", var_3_1, var_3_0))

	arg_3_0._challengeData = Challenge.GetAllMasterChallenges(arg_3_1, true)

	var_0_1(arg_3_0, arg_3_1)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupChallenges = var_0_3
end

function CurrentMasterChallenges(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 500 * _1080p)

	var_5_0.id = "CurrentMasterChallenges"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "ChallengeCompletionStatus"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -9, _1080p * 10, _1080p * 40)
	var_5_0:addElement(var_5_6)

	var_5_0.ChallengeCompletionStatus = var_5_6

	var_0_4(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CurrentMasterChallenges", CurrentMasterChallenges)
LockTable(_M)
