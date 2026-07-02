module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CPTeamScores.isFriendly = true
end

function CPAARScoreboard(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "CPAARScoreboard"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("CPTeamScores", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "CPTeamScores"

	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 550, _1080p * -120, _1080p * 80)
	var_2_0:addElement(var_2_4)

	var_2_0.CPTeamScores = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "MatchTimer"

	var_2_6:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 349, _1080p * 477, _1080p * -148, _1080p * -128)

	local function var_2_7()
		local var_3_0 = DataSources.frontEnd.AAR.gameTime:GetValue(var_2_1)

		if var_3_0 ~= nil then
			var_2_6:setText(var_3_0, 0)
		end
	end

	local var_2_8 = DataSources.frontEnd.AAR.gameTime

	var_2_6:SubscribeToModel(var_2_8:GetModel(var_2_1), var_2_7)
	var_2_0:addElement(var_2_6)

	var_2_0.MatchTimer = var_2_6

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "TeamIcon"

	var_2_10:SetScale(1, 0)
	var_2_10:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -647, _1080p * -519, _1080p * -89, _1080p * 39)
	var_2_0:addElement(var_2_10)

	var_2_0.TeamIcon = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "HeaderBottomBorder"

	var_2_12:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -122, _1080p * -121)
	var_2_0:addElement(var_2_12)

	var_2_0.HeaderBottomBorder = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("CPScoreboardHeader", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "ScoreboardHeader"

	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, 0, _1080p * -148, _1080p * -126)
	var_2_0:addElement(var_2_14)

	var_2_0.ScoreboardHeader = var_2_14

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPAARScoreboard", CPAARScoreboard)
LockTable(_M)
