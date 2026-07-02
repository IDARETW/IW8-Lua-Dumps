module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.missionTeam"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	return
end

function HeadquartersMissionTeamWidget(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 720 * _1080p)

	var_2_0.id = "HeadquartersMissionTeamWidget"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIBlur.new()

	var_2_4.id = "Blur"

	var_2_4:SetAlpha(0, 0)
	var_2_4:SetBlurStrength(2.75, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Blur = var_2_4

	local var_2_5
	local var_2_6 = {
		maxVisibleRows = 5,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("HeadquartersMissionTeamInfo", {
				controllerIndex = var_2_1
			})
		end,
		spacingX = _1080p * 18,
		spacingY = _1080p * 18,
		columnWidth = _1080p * 700,
		rowHeight = _1080p * 128,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_2_7 = LUI.UIDataSourceGrid.new(var_2_6)

	var_2_7.id = "MissionTeamList"

	var_2_7:setUseStencil(true)
	var_2_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 700, _1080p * 34, _1080p * 746)
	var_2_0:addElement(var_2_7)

	var_2_0.MissionTeamList = var_2_7

	local var_2_8
	local var_2_9 = LUI.UIImage.new()

	var_2_9.id = "ChallengeHeaderBG"

	var_2_9:SetRGBFromInt(0, 0)
	var_2_9:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -700, 0, 0, _1080p * 27.5)
	var_2_0:addElement(var_2_9)

	var_2_0.ChallengeHeaderBG = var_2_9

	local var_2_10
	local var_2_11 = LUI.UIText.new()

	var_2_11.id = "NearCompletionChallenges"

	var_2_11:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/MISSION_TEAM_STATS_HEADER")), 0)
	var_2_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_11:SetAlignment(LUI.Alignment.Left)
	var_2_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 12.5, _1080p * 687.5, _1080p * 4.25, _1080p * 23.25)
	var_2_0:addElement(var_2_11)

	var_2_0.NearCompletionChallenges = var_2_11

	var_0_1(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("HeadquartersMissionTeamWidget", HeadquartersMissionTeamWidget)
LockTable(_M)
