module(..., package.seeall)

local var_0_0 = 38
local var_0_1 = 32

function GetTextWidth(arg_1_0)
	local var_1_0 = FONTS.GetFont(FONTS.MainLight.File)
	local var_1_1, var_1_2, var_1_3, var_1_4 = GetTextDimensions(arg_1_0, var_1_0, var_0_0)

	return var_1_3
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0(arg_3_0)
		return function()
			local var_4_0 = arg_3_0.Scoreboard:GetIndex()

			if var_4_0 then
				return {
					x = 0,
					y = var_4_0
				}
			end
		end
	end

	arg_2_0.Scores.Scoreboard:SetDefaultFocusFunction(var_2_0(arg_2_0.Scores))
	arg_2_0.Scores.Scoreboard:SetTeamIndex(Teams.free)
	arg_2_0.Scores.Scoreboard:RefreshGrid()
	arg_2_0.Scores.Rows:SetColorOp(COLOR_OP.saturation, 0)
end

function AARFFAScoreboard(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "AARFFAScoreboard"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "HeaderRowBackground"

	var_5_4:SetRGBFromTable(SWATCHES.Scoreboard.background, 0)
	var_5_4:SetAlpha(0.4, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 395, _1080p * -442, _1080p * 255, _1080p * 339)
	var_5_0:addElement(var_5_4)

	var_5_0.HeaderRowBackground = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("ScoreboardTitleRow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ScoreboardTitleRowFriendly"

	var_5_6:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -513, _1080p * 600, _1080p * 303, _1080p * 339)
	var_5_0:addElement(var_5_6)

	var_5_0.ScoreboardTitleRowFriendly = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("TeamScores", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Scores"

	var_5_8.Backer:SetRGBFromInt(2763047, 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -561, _1080p * 513, _1080p * 344, _1080p * 626)
	var_5_0:addElement(var_5_8)

	var_5_0.Scores = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ScoreboardHeaderSubInfo", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "ScoreboardHeaderSubInfo"

	var_5_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_10:SetScale(0.5, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 542, _1080p * 1075, _1080p * 272, _1080p * 302)
	var_5_0:addElement(var_5_10)

	var_5_0.ScoreboardHeaderSubInfo = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Border"

	var_5_12:SetAlpha(0.4, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 395, _1080p * -442, _1080p * 303, _1080p * 304)
	var_5_0:addElement(var_5_12)

	var_5_0.Border = var_5_12

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("AARFFAScoreboard", AARFFAScoreboard)
LockTable(_M)
