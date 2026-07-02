module(..., package.seeall)

local var_0_0 = "frontEnd.AAR.scoreboard"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue(arg_1_1)
	local var_1_1 = MP.GetTeamInfo(Teams.axis)
	local var_1_2 = MP.GetTeamInfo(Teams.allies)
	local var_1_3 = MP.GetFactionReference(Teams.axis)
	local var_1_4 = MP.GetFactionReference(Teams.allies)
	local var_1_5 = DataSources.frontEnd.AAR.gameType:GetValue(arg_1_1)

	if var_1_0 == Teams.allies then
		local var_1_6 = MP.GetTeamLogo(Teams.allies, var_1_0, var_1_4, true)

		arg_1_0.FriendlyScores.Scoreboard:SetTeamIndex(Teams.allies)
		arg_1_0.FriendlyTeamBase.Name:setText(ToUpperCase(tostring(var_1_2.name)), 0)
		arg_1_0.FriendlyTeamBase.Icon:setImage(RegisterMaterial(var_1_6), 0)
		arg_1_0.FriendlyTeamBase.DarkIcon:setImage(RegisterMaterial(var_1_6), 0)

		local var_1_7 = MP.GetTeamLogo(Teams.axis, var_1_0, var_1_3, true)

		arg_1_0.EnemyScores.Scoreboard:SetTeamIndex(Teams.axis)
		arg_1_0.EnemyTeamBase.Name:setText(ToUpperCase(tostring(var_1_1.name)), 0)
		arg_1_0.EnemyTeamBase.Icon:setImage(RegisterMaterial(var_1_7), 0)
		arg_1_0.EnemyTeamBase.DarkIcon:setImage(RegisterMaterial(var_1_7), 0)
	elseif var_1_0 == Teams.axis then
		local var_1_8 = MP.GetTeamLogo(Teams.axis, var_1_0, var_1_3, true)

		arg_1_0.FriendlyScores.Scoreboard:SetTeamIndex(Teams.axis)
		arg_1_0.FriendlyTeamBase.Name:setText(ToUpperCase(tostring(var_1_1.name)), 0)
		arg_1_0.FriendlyTeamBase.Icon:setImage(RegisterMaterial(var_1_8), 0)
		arg_1_0.FriendlyTeamBase.DarkIcon:setImage(RegisterMaterial(var_1_8), 0)

		local var_1_9 = MP.GetTeamLogo(Teams.allies, var_1_0, var_1_4, true)

		arg_1_0.EnemyScores.Scoreboard:SetTeamIndex(Teams.allies)
		arg_1_0.EnemyTeamBase.Name:setText(ToUpperCase(tostring(var_1_2.name)), 0)
		arg_1_0.EnemyTeamBase.Icon:setImage(RegisterMaterial(var_1_9), 0)
		arg_1_0.EnemyTeamBase.DarkIcon:setImage(RegisterMaterial(var_1_9), 0)
	else
		local var_1_10 = MP.GetTeamLogo(Teams.allies, Teams.allies, var_1_4, true)

		arg_1_0.FriendlyScores.Scoreboard:SetTeamIndex(Teams.allies)
		arg_1_0.FriendlyTeamBase.Name:setText(ToUpperCase(tostring(var_1_2.name)), 0)
		arg_1_0.FriendlyTeamBase.Icon:setImage(RegisterMaterial(var_1_10), 0)
		arg_1_0.FriendlyTeamBase.DarkIcon:setImage(RegisterMaterial(var_1_10), 0)

		local var_1_11 = MP.GetTeamLogo(Teams.axis, var_1_0, var_1_3, true)

		arg_1_0.EnemyScores.Scoreboard:SetTeamIndex(Teams.axis)
		arg_1_0.EnemyTeamBase.Name:setText(ToUpperCase(tostring(var_1_1.name)), 0)
		arg_1_0.EnemyTeamBase.Icon:setImage(RegisterMaterial(var_1_11), 0)
		arg_1_0.EnemyTeamBase.DarkIcon:setImage(RegisterMaterial(var_1_11), 0)
	end

	if var_1_5 == MP.GameMode.InfectGameType then
		if var_1_0 == Teams.axis then
			arg_1_0.FriendlyTeamBase.Name:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/INFECTED_TEAM")))
			arg_1_0.EnemyTeamBase.Name:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/SURVIVORS_TEAM")))
		else
			arg_1_0.FriendlyTeamBase.Name:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/SURVIVORS_TEAM")))
			arg_1_0.EnemyTeamBase.Name:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/INFECTED_TEAM")))
		end
	end

	local function var_1_12(arg_2_0)
		return function()
			local var_3_0 = arg_2_0.Scoreboard:GetIndex()

			if var_3_0 then
				return {
					x = 0,
					y = var_3_0
				}
			end
		end
	end

	arg_1_0.EnemyScores.Scoreboard:SetDefaultFocusFunction(var_1_12(arg_1_0.EnemyScores))
	arg_1_0.FriendlyScores.Scoreboard:SetDefaultFocusFunction(var_1_12(arg_1_0.FriendlyScores))
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue(arg_4_1)

	if var_4_0 == Teams.allies then
		arg_4_0.friendTeam = Teams.allies
		arg_4_0.enemyTeam = Teams.axis
	elseif var_4_0 == Teams.axis then
		arg_4_0.friendTeam = Teams.axis
		arg_4_0.enemyTeam = Teams.allies
	else
		arg_4_0.friendTeam = Teams.allies
		arg_4_0.enemyTeam = Teams.axis
	end

	local var_4_1 = PostMatch.DGCJIFGJBD(arg_4_1, arg_4_0.friendTeam)
	local var_4_2 = PostMatch.DGCJIFGJBD(arg_4_1, arg_4_0.enemyTeam)

	arg_4_0.isFriendTeamDataAvailable = var_4_1 and (var_4_1[0] or #var_4_1 == 0)
	arg_4_0.isEnemyTeamDataAvailable = var_4_2 and (var_4_2[0] or #var_4_2 == 0)

	local var_4_3 = arg_4_0.isEnemyTeamDataAvailable and arg_4_0.isFriendTeamDataAvailable

	if var_4_3 then
		local var_4_4 = #var_4_2 + 1

		if #var_4_2 == 0 then
			var_4_4 = 0
		end

		arg_4_0.EnemyScores = MenuBuilder.BuildRegisteredType("TeamScores", {
			isFriendly = false,
			isEnemy = true,
			controllerIndex = arg_4_1,
			team = arg_4_0.enemyTeam,
			teamNum = var_4_4
		})
		arg_4_0.EnemyScores.id = "EnemyScores"

		arg_4_0.EnemyScores.Backer:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed)
		arg_4_0.EnemyScores.Rows:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam)
		arg_4_0.EnemyScores:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -269, _1080p * 780, _1080p * 444, _1080p * 723)
		arg_4_0:addElement(arg_4_0.EnemyScores)

		local var_4_5 = #var_4_1 + 1

		if #var_4_1 == 0 then
			var_4_5 = 0
		end

		arg_4_0.FriendlyScores = MenuBuilder.BuildRegisteredType("TeamScores", {
			isFriendly = true,
			isEnemy = false,
			controllerIndex = arg_4_1,
			team = arg_4_0.friendTeam,
			teamNum = var_4_5
		})
		arg_4_0.FriendlyScores.id = "FriendlyScores"

		arg_4_0.FriendlyScores.Backer:SetRGBFromTable(SWATCHES.AAR.FriendlyDarkBlue)
		arg_4_0.FriendlyScores.Rows:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
		arg_4_0.FriendlyScores:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -269, _1080p * 780, _1080p * 131, _1080p * 410)
		arg_4_0:addElement(arg_4_0.FriendlyScores)
		assert(arg_4_0.EnemyScores)
		assert(arg_4_0.FriendlyScores)
		arg_4_0.FriendlyScores.Scoreboard:SetMask(arg_4_0.FriendlyMask)
		arg_4_0.EnemyScores.Scoreboard:SetMask(arg_4_0.EnemyMask)

		arg_4_0.EnemyScoresBindButton = LUI.UIBindButton.new()
		arg_4_0.EnemyScoresBindButton.id = "EnemyScoresBindButton"

		arg_4_0.EnemyScores:addElement(arg_4_0.EnemyScoresBindButton)
		arg_4_0.EnemyScoresBindButton:addEventHandler("button_up", function(arg_5_0, arg_5_1)
			if not arg_5_1.controller then
				local var_5_0 = controller
			end

			if (#arg_5_0:getParent():getAllFocusedChildren() > 0 or arg_5_0:getParent():isInFocus()) and arg_4_0.isFriendTeamDataAvailable and arg_4_0.EnemyScores.Scoreboard:GetGrid():GetFocusPositionIndex() == 0 then
				ACTIONS.LoseFocus(arg_4_0, "EnemyScores", arg_4_1)
				ACTIONS.GainFocus(arg_4_0, "FriendlyScores", arg_4_1)
				arg_4_0.FriendlyScores.Scoreboard:GetGrid():SetFocusedPosition({
					x = 0,
					y = arg_4_0.FriendlyScores.Scoreboard:GetGrid():GetNumRows() - 1
				}, false)

				return true
			end

			return false
		end)
		arg_4_0.EnemyScoresBindButton:addEventHandler("button_down", function(arg_6_0, arg_6_1)
			if not arg_6_1.controller then
				local var_6_0 = controller
			end

			if (#arg_6_0:getParent():getAllFocusedChildren() > 0 or arg_6_0:getParent():isInFocus()) and arg_4_0.isFriendTeamDataAvailable and arg_4_0.EnemyScores.Scoreboard:GetGrid():GetFocusPositionIndex() + 1 == arg_4_0.EnemyScores.Scoreboard:GetGrid():GetNumRows() then
				ACTIONS.LoseFocus(arg_4_0, "EnemyScores", arg_4_1)
				ACTIONS.GainFocus(arg_4_0, "FriendlyScores", arg_4_1)
				arg_4_0.FriendlyScores.Scoreboard:GetGrid():SetFocusedPosition({
					x = 0,
					y = 0
				}, false)

				return true
			end

			return false
		end)

		arg_4_0.FriendlyScoresBindButton = LUI.UIBindButton.new()
		arg_4_0.FriendlyScoresBindButton.id = "FriendlyScoresBindButton"

		arg_4_0.FriendlyScores:addElement(arg_4_0.FriendlyScoresBindButton)
		arg_4_0.FriendlyScoresBindButton:addEventHandler("button_down", function(arg_7_0, arg_7_1)
			if not arg_7_1.controller then
				local var_7_0 = controller
			end

			if (#arg_7_0:getParent():getAllFocusedChildren() > 0 or arg_7_0:getParent():isInFocus()) and arg_4_0.isEnemyTeamDataAvailable and arg_4_0.FriendlyScores.Scoreboard:GetGrid():GetFocusPositionIndex() + 1 == arg_4_0.FriendlyScores.Scoreboard:GetGrid():GetNumRows() and arg_4_0.EnemyScores.Scoreboard:GetGrid():GetNumRows() > 0 then
				ACTIONS.LoseFocus(arg_4_0, "FriendlyScores", arg_4_1)
				ACTIONS.GainFocus(arg_4_0, "EnemyScores", arg_4_1)
				arg_4_0.EnemyScores.Scoreboard:GetGrid():SetFocusedPosition({
					x = 0,
					y = 0
				}, false)

				return true
			end

			return false
		end)
		arg_4_0.FriendlyScoresBindButton:addEventHandler("button_up", function(arg_8_0, arg_8_1)
			if not arg_8_1.controller then
				local var_8_0 = controller
			end

			if (#arg_8_0:getParent():getAllFocusedChildren() > 0 or arg_8_0:getParent():isInFocus()) and arg_4_0.isEnemyTeamDataAvailable and arg_4_0.FriendlyScores.Scoreboard:GetGrid():GetFocusPositionIndex() == 0 and arg_4_0.EnemyScores.Scoreboard:GetGrid():GetNumRows() > 0 then
				ACTIONS.LoseFocus(arg_4_0, "FriendlyScores", arg_4_1)
				ACTIONS.GainFocus(arg_4_0, "EnemyScores", arg_4_1)
				arg_4_0.EnemyScores.Scoreboard:GetGrid():SetFocusedPosition({
					x = 0,
					y = arg_4_0.EnemyScores.Scoreboard:GetGrid():GetNumRows() - 1
				}, false)

				return true
			end

			return false
		end)

		local var_4_6 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".friendlyFocus")
		local var_4_7 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".enemyFocus")

		if arg_4_0.isFriendTeamDataAvailable then
			arg_4_0.EnemyScores.Scoreboard:GetGrid():SetLastFocusIndexDataSource(var_4_7)
		end

		if arg_4_0.isEnemyTeamDataAvailable then
			arg_4_0.FriendlyScores.Scoreboard:GetGrid():SetLastFocusIndexDataSource(var_4_6)
		end

		var_0_1(arg_4_0, arg_4_1, var_4_6, var_4_7)

		local function var_4_8()
			local var_9_0 = DataSources.frontEnd.AAR.friendlyScore:GetValue(arg_4_1)
			local var_9_1 = DataSources.frontEnd.AAR.enemyScore:GetValue(arg_4_1)
			local var_9_2 = ToUpperCase(Engine.CBBHFCGDIC("MENU/WON"))
			local var_9_3 = ToUpperCase(Engine.CBBHFCGDIC("MENU/LOST"))
			local var_9_4 = ToUpperCase(Engine.CBBHFCGDIC("MENU/TIED"))

			LAYOUT.SetTextBoxSize(arg_4_0.FriendlyTeamBase.Score, arg_4_0.FriendlyTeamBase.Underline, var_9_0, -25, nil, LUI.Alignment.Right, 0)
			LAYOUT.SetTextBoxSize(arg_4_0.EnemyTeamBase.Score, arg_4_0.EnemyTeamBase.Underline, var_9_1, -25, nil, LUI.Alignment.Right, 0)

			if var_9_0 ~= nil and var_9_1 ~= nil then
				if var_9_0 == var_9_1 then
					arg_4_0.FriendlyOutcome:setText(var_9_4)
					ACTIONS.AnimateSequence(arg_4_0.FriendlyTeamBase, "DisplayLoss")
					ACTIONS.AnimateSequence(arg_4_0.EnemyTeamBase, "DisplayLoss")
				elseif var_9_1 < var_9_0 then
					arg_4_0.FriendlyOutcome:setText(var_9_2)
					ACTIONS.AnimateSequence(arg_4_0.FriendlyTeamBase, "DisplayWin")
					ACTIONS.AnimateSequence(arg_4_0.EnemyTeamBase, "DisplayLoss")
				else
					arg_4_0.FriendlyOutcome:setText(var_9_3)
					ACTIONS.AnimateSequence(arg_4_0.FriendlyTeamBase, "DisplayLoss")
					ACTIONS.AnimateSequence(arg_4_0.EnemyTeamBase, "DisplayWin")
				end
			end

			if DataSources.frontEnd.AAR.gameType:GetValue(arg_4_1) == MP.GameMode.InfectGameType then
				local var_9_5 = DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue(arg_4_1)
				local var_9_6 = DataSources.frontEnd.AAR.scoreboard.numPlayersTeamA:GetValue(arg_4_1)

				if var_9_5 == Teams.allies then
					arg_4_0.FriendlyOutcome:setText(var_9_2)
				elseif var_9_6 > 0 then
					arg_4_0.FriendlyOutcome:setText(var_9_3)
				else
					arg_4_0.FriendlyOutcome:setText(var_9_2)
					ACTIONS.AnimateSequence(arg_4_0.FriendlyTeamBase, "DisplayWin")
				end
			end
		end

		local var_4_9 = DataSources.frontEnd.AAR.enemyScore

		arg_4_0:SubscribeToModel(var_4_9:GetModel(arg_4_1), var_4_8)

		local var_4_10 = DataSources.frontEnd.AAR.friendlyScore

		arg_4_0:SubscribeToModel(var_4_10:GetModel(arg_4_1), var_4_8)
		arg_4_0.FriendlyScores.Scoreboard:processEvent({
			name = "open_scoreboard"
		})
		arg_4_0.EnemyScores.Scoreboard:processEvent({
			name = "open_scoreboard"
		})
	end

	return var_4_3
end

local function var_0_3(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MatchTimer)

	local var_10_0 = DataSources.frontEnd.AAR.gameTime

	arg_10_0.MatchTimer:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_TIME_WITH_TIME", var_10_0:GetValue(arg_10_1)))

	local var_10_1 = 100
	local var_10_2 = 0
	local var_10_3 = 3000
	local var_10_4

	local function var_10_5()
		if not var_0_2(arg_10_0, arg_10_1) then
			var_10_2 = var_10_2 + var_10_1

			if var_10_2 <= var_10_3 then
				arg_10_0:Wait(var_10_1, true).onComplete = var_10_5
			else
				LUI.FlowManager.RequestLeaveMenu()
			end
		end
	end

	var_10_5()
end

function AARTeamScoreboard(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -960 * _1080p, 960 * _1080p, -415 * _1080p, 415 * _1080p)

	var_12_0.id = "AARTeamScoreboard"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.soundSet = "aarscoreboard"

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIText.new()

	var_12_4.id = "MatchTimer"

	var_12_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_4:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_TIME_WITH_TIME"), 0)
	var_12_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_4:SetAlignment(LUI.Alignment.Right)
	var_12_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 423, _1080p * 780, _1080p * 66, _1080p * 86)
	var_12_0:addElement(var_12_4)

	var_12_0.MatchTimer = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("TeamBase", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "EnemyTeamBase"

	var_12_6.Score:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_12_6.Score:setText("0000", 0)
	var_12_6.Name:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_6.Underline:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam, 0)
	var_12_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -671, _1080p * -371, _1080p * 418, _1080p * 718)
	var_12_0:addElement(var_12_6)

	var_12_0.EnemyTeamBase = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("TeamBase", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "FriendlyTeamBase"

	var_12_8.Score:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_12_8.Score:setText("0000", 0)
	var_12_8.Name:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_8.Underline:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_12_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -671, _1080p * -371, _1080p * 90, _1080p * 390)
	var_12_0:addElement(var_12_8)

	var_12_0.FriendlyTeamBase = var_12_8

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("ScoreboardTitleRow", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "ScoreboardTitleRow"

	var_12_10:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_12_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -222, _1080p * 800, _1080p * 90, _1080p * 126)
	var_12_0:addElement(var_12_10)

	var_12_0.ScoreboardTitleRow = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "HeaderBottomBorder"

	var_12_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -269, _1080p * 780, _1080p * 94, _1080p * 95)
	var_12_0:addElement(var_12_12)

	var_12_0.HeaderBottomBorder = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIStyledText.new()

	var_12_14.id = "FriendlyOutcome"

	var_12_14:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_12_14:setText(Engine.CBBHFCGDIC("MENU/WON"), 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_14:SetAlignment(LUI.Alignment.Left)
	var_12_14:SetShadowMinDistance(-0.2, 0)
	var_12_14:SetShadowMaxDistance(0.2, 0)
	var_12_14:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -269, _1080p * 91, _1080p * 26, _1080p * 62)
	var_12_0:addElement(var_12_14)

	var_12_0.FriendlyOutcome = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("ScoreboardHeaderSubInfo", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "ScoreboardHeaderSubInfo"

	var_12_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -269, _1080p * 382, _1080p * 66, _1080p * 88)
	var_12_0:addElement(var_12_16)

	var_12_0.ScoreboardHeaderSubInfo = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIImage.new()

	var_12_18.id = "FriendlyMask"

	var_12_18:setImage(RegisterMaterial("stencil_mask"), 0)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -339, _1080p * 780, _1080p * 131, _1080p * 413)
	var_12_0:addElement(var_12_18)

	var_12_0.FriendlyMask = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIImage.new()

	var_12_20.id = "EnemyMask"

	var_12_20:setImage(RegisterMaterial("stencil_mask"), 0)
	var_12_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -339, _1080p * 780, _1080p * 444, _1080p * 726)
	var_12_0:addElement(var_12_20)

	var_12_0.EnemyMask = var_12_20

	local var_12_21

	if not CONDITIONS.ShouldHideButtonPrompts(var_12_0) then
		local var_12_22 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
			controllerIndex = var_12_1
		})

		var_12_22.id = "ButtonHelperBar"

		var_12_22.Background:SetAlpha(0, 0)
		var_12_22:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 918, _1080p * -154, _1080p * -42, 0)
		var_12_0:addElement(var_12_22)

		var_12_0.ButtonHelperBar = var_12_22
	end

	var_0_3(var_12_0, var_12_1, arg_12_1)
	ACTIONS.PlaySoundSetSound(var_12_0, "intro", false)

	return var_12_0
end

MenuBuilder.registerType("AARTeamScoreboard", AARTeamScoreboard)
LockTable(_M)
