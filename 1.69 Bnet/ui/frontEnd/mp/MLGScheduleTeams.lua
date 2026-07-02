module(..., package.seeall)

function MLGScheduleTeams(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1150 * _1080p, 0, 263 * _1080p)

	var_1_0.id = "MLGScheduleTeams"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameBattlesLobbyMember", {
				controllerIndex = var_1_1
			})
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_5 = LUI.UIDataSourceGrid.new(var_1_4)

	var_1_5.id = "Team2Members"

	var_1_5:setUseStencil(false)
	var_1_5:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -500, 0, _1080p * 49, _1080p * 297)
	var_1_0:addElement(var_1_5)

	var_1_0.Team2Members = var_1_5

	local var_1_6
	local var_1_7 = LUI.UIStyledText.new()

	var_1_7.id = "Team2Name"

	var_1_7:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_7:setText("", 0)
	var_1_7:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_1_7:SetAlignment(LUI.Alignment.Left)
	var_1_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_7:SetStartupDelay(1000)
	var_1_7:SetLineHoldTime(400)
	var_1_7:SetAnimMoveTime(600)
	var_1_7:SetAnimMoveSpeed(50)
	var_1_7:SetEndDelay(1000)
	var_1_7:SetCrossfadeTime(400)
	var_1_7:SetFadeInTime(300)
	var_1_7:SetFadeOutTime(300)
	var_1_7:SetMaxVisibleLines(1)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 650, _1080p * 1150, 0, _1080p * 44)
	var_1_0:addElement(var_1_7)

	var_1_0.Team2Name = var_1_7

	local var_1_8
	local var_1_9 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameBattlesLobbyMember", {
				controllerIndex = var_1_1
			})
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_10 = LUI.UIDataSourceGrid.new(var_1_9)

	var_1_10.id = "Team1Members"

	var_1_10:setUseStencil(false)
	var_1_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1150, _1080p * -650, _1080p * 49, _1080p * 297)
	var_1_0:addElement(var_1_10)

	var_1_0.Team1Members = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "Team1Name"

	var_1_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_12:SetStartupDelay(1000)
	var_1_12:SetLineHoldTime(400)
	var_1_12:SetAnimMoveTime(600)
	var_1_12:SetAnimMoveSpeed(50)
	var_1_12:SetEndDelay(1000)
	var_1_12:SetCrossfadeTime(400)
	var_1_12:SetFadeInTime(300)
	var_1_12:SetFadeOutTime(300)
	var_1_12:SetMaxVisibleLines(1)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 44)
	var_1_0:addElement(var_1_12)

	var_1_0.Team1Name = var_1_12

	return var_1_0
end

MenuBuilder.registerType("MLGScheduleTeams", MLGScheduleTeams)
LockTable(_M)
