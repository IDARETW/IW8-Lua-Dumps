module(..., package.seeall)

local var_0_0 = "gamebattles.schedule"

local function var_0_1(arg_1_0)
	return function(arg_2_0, arg_2_1, arg_2_2)
		return {
			matchId = LUI.DataSourceInGlobalModel.new(arg_1_0 .. "." .. arg_2_1 .. ".matchId"),
			matchTime = LUI.DataSourceInGlobalModel.new(arg_1_0 .. "." .. arg_2_1 .. ".matchTime"),
			gameCount = LUI.DataSourceInGlobalModel.new(arg_1_0 .. "." .. arg_2_1 .. ".gameCount")
		}
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = LUI.DataSourceFromList.new(arg_3_0)

	var_3_0.MakeDataSourceAtIndex = var_0_1(arg_3_1 .. ".matches")

	return var_3_0
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = "frontEnd.mlg"

	DataSources.frontEnd.mlg = LUI.DataSourceInGlobalModel.new(var_4_0)
	DataSources.frontEnd.mlg.count = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".count")
	DataSources.frontEnd.mlg.matches = var_0_2(DataSources.frontEnd.mlg.count, var_4_0)
end

local function var_0_4()
	local var_5_0 = {}

	for iter_5_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		var_5_0[Lobby.CJEHDHDGBH(iter_5_0)] = {
			name = Lobby.CAAHCDGEDH(iter_5_0),
			image = Lobby.EAJBIDDDGF(iter_5_0)
		}
	end

	return var_5_0
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = LUI.DataSourceFromList.new(#arg_6_1.teams[arg_6_2].players)

	function var_6_0.MakeDataSourceAtIndex(arg_7_0, arg_7_1)
		local var_7_0 = var_0_0 .. ".team" .. arg_6_2 .. "." .. arg_7_1 + 1
		local var_7_1 = arg_6_1.teams[arg_6_2].players[arg_7_1 + 1]

		return {
			memberIndex = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".memberIndex", 0),
			xuid = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".xuid", 0),
			isLobbyHost = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".isLobbyHost", false),
			isPrivatePartyHost = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".isPrivatePartyHost", false),
			platformId = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".platformId", "unknown"),
			controllerIndex = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".controllerIndex", -1),
			gamertag = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".gamertag", var_7_1.name),
			missingGamertag = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".missingGamertag", true),
			team = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".team", arg_6_2),
			squad = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".squad", -1),
			desiredTeam = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".desiredTeam", arg_6_2),
			clanTag = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".clanTag", ""),
			isMyPlayer = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".isMyPlayer", false),
			microphoneState = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".microphoneState", 0),
			isCrossplayPlayer = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".isCrossplayPlayer", false),
			followersCount = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".followersCount", 0),
			commitReady = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".commitReady", false),
			isPlaceHolderPlayer = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".isPlaceHolderPlayer", true),
			presencePlatform = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".presencePlatform", nil),
			usingGamepad = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".usingGamepad", nil),
			subparty = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".subparty", nil),
			displayRank = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".displayRank", nil),
			rankIcon = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".rankIcon", nil),
			microphoneAlpha = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".microphoneAlpha", 0),
			microphoneIcon = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".microphoneIcon", nil)
		}
	end

	return var_6_0
end

local function var_0_6()
	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_7(arg_9_0, arg_9_1)
	if arg_9_1 then
		local var_9_0 = arg_9_1.teams
		local var_9_1 = {
			arg_9_0.Team1Members,
			arg_9_0.Team2Members
		}

		WipeGlobalModelsAtPath(var_0_0)

		for iter_9_0, iter_9_1 in ipairs(var_9_1) do
			arg_9_0["Team" .. iter_9_0 .. "Name"]:setText(var_9_0[iter_9_0].teamName)

			local var_9_2 = var_0_5(arg_9_0, arg_9_1, iter_9_0)

			iter_9_1:SetGridDataSource(var_9_2)

			for iter_9_2 = 0, #var_9_0[iter_9_0].players - 1 do
				local var_9_3 = iter_9_1:GetElementAtPosition(0, iter_9_2)

				ACTIONS.AnimateSequence(var_9_3.LobbyMember, "GameBattles")
				ACTIONS.AnimateSequence(var_9_3.LobbyMember, "IsNotConnectedPlayer")
				ACTIONS.AnimateSequence(var_9_3, "IsNotMyPlayer")
				var_9_3.LobbyMember:SetButtonDisabled(true)
				var_9_3:SetFocusable(false)
				var_9_3.LobbyMember:SetFocusable(false)
				var_9_3:SetMouseFocusBlocker(true)
				var_9_3.LobbyMember.SocialPlatformPresence.Icon:setImage(RegisterMaterial("gamebattles_logo_small"), 0)
				var_9_3.LobbyMember.SocialPlatformPresence.Icon:SetAlpha(0.75)
				var_9_3.LobbyMember.InputMethod:SetAlpha(0)
			end
		end

		local var_9_4 = arg_9_1.games
		local var_9_5 = LUI.DataSourceFromList.new(#var_9_4)
		local var_9_6 = arg_9_0.mapsInfoTable

		function var_9_5.MakeDataSourceAtIndex(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1 + 1
			local var_10_1 = var_0_0 .. ".game." .. var_10_0
			local var_10_2 = var_9_4[var_10_0].map
			local var_10_3 = var_9_6[var_10_2]
			local var_10_4 = var_9_4[var_10_0].gametype
			local var_10_5 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_10_4, CSV.gameTypesTable.cols.image)
			local var_10_6 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_10_4, CSV.gameTypesTable.cols.name)

			return {
				name = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".name", var_10_3.name),
				image = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".image", var_10_3.image),
				number = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".number", var_10_0),
				gametypeName = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".gametypeName", Engine.CBBHFCGDIC(var_10_6)),
				gametypeIcon = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".gametypeIcon", var_10_5)
			}
		end

		arg_9_0.Maps:SetGridDataSource(var_9_5)
	end
end

local function var_0_8(arg_11_0, arg_11_1)
	if not GAMEBATTLES.HasJoinedMatch(arg_11_1) then
		arg_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 4,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_REFRESH")
		})
		arg_11_0.RefreshMatchesPrompt:SetAlpha(1)

		arg_11_0.isRefreshEnabled = true
	end
end

local function var_0_9(arg_12_0)
	arg_12_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		side = "left",
		button_ref = "button_alt1"
	})
	arg_12_0.RefreshMatchesPrompt:SetAlpha(0)

	arg_12_0.isRefreshEnabled = false
end

local function var_0_10(arg_13_0, arg_13_1)
	arg_13_0:DisableScheduleRefresh()

	local var_13_0 = GAMEBATTLES.GetScheduleRefreshInterval()

	arg_13_0.refreshButtonCooldown = arg_13_0:Wait(var_13_0)

	function arg_13_0.refreshButtonCooldown.onComplete()
		arg_13_0:EnableScheduleRefresh(arg_13_1)
	end
end

local function var_0_11(arg_15_0, arg_15_1)
	if arg_15_0.isRefreshEnabled then
		GAMEBATTLES.ShowFenceToRefreshSchedule()

		if MLG.BIHFEHBCFB(arg_15_1) ~= GAMEBATTLES.INVALID_MATCH_ID then
			MLG.ResetGameBattleMatchId(arg_15_1)
		end

		arg_15_0:StartRefreshButtonCooldown(arg_15_1)
	end
end

local function var_0_12(arg_16_0, arg_16_1)
	arg_16_0.Matches:SetGridDataSource(DataSources.frontEnd.mlg.matches)

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.Matches:GetBuiltChildren()) do
		iter_16_1:registerEventHandler("button_over", function(arg_17_0, arg_17_1)
			local var_17_0 = arg_17_0:GetDataSource().matchId:GetValue(arg_16_1)

			if var_17_0 ~= arg_16_0.currentlySelectedMatch then
				local var_17_1 = GAMEBATTLES.GetMatchByMatchID(arg_16_1, var_17_0)

				arg_16_0:UpdateMatchInfo(var_17_1)

				arg_16_0.currentlySelectedMatch = var_17_0
			end
		end)
	end
end

local function var_0_13(arg_18_0, arg_18_1)
	arg_18_0.isRefreshEnabled = not GAMEBATTLES.HasJoinedMatch(arg_18_1)
	arg_18_0.gbMatch = GAMEBATTLES.GetFirstActiveMatch(arg_18_1)

	if arg_18_0.gbMatch then
		ACTIONS.AnimateSequence(arg_18_0, "HasMatches")
		var_0_3(arg_18_0, arg_18_1)
		arg_18_0:InitializeMatchList(arg_18_1)
		arg_18_0:UpdateMatchInfo(arg_18_0.gbMatch)

		arg_18_0.currentlySelectedMatch = arg_18_0.gbMatch.matchId
		arg_18_0.RefreshMatchesPrompt = arg_18_0.RefreshMatchesPromptLeft
	else
		ACTIONS.AnimateSequence(arg_18_0, "HasNoMatches")
		ACTIONS.AnimateSequence(arg_18_0.GameBattlesUpcomingMatch, "NoUpcomingMatch")
		arg_18_0.GameBattlesUpcomingMatch.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NO_SCHEDULED_MATCH"))
		arg_18_0.GameBattlesUpcomingMatch:ShowErrorMessage("PLATFORM/NO_UPCOMING_MATCH")

		arg_18_0.RefreshMatchesPrompt = arg_18_0.RefreshMatchesPromptCenter
	end

	arg_18_0:StartRefreshButtonCooldown(arg_18_1)
end

local function var_0_14(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.UpdateMatchInfo = var_0_7
	arg_19_0.RefreshSchedule = var_0_11
	arg_19_0.EnableScheduleRefresh = var_0_8
	arg_19_0.DisableScheduleRefresh = var_0_9
	arg_19_0.StartRefreshButtonCooldown = var_0_10
	arg_19_0.InitializeSchedule = var_0_13
	arg_19_0.InitializeMatchList = var_0_12
	arg_19_0.mapsInfoTable = var_0_4()

	FrontEndScene.HideAllCharacters()
	arg_19_0.ArrowUp:SetFocusable(false)
	arg_19_0.ArrowDown:SetFocusable(false)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_19_0.TabBacker)
	arg_19_0:InitializeSchedule(arg_19_1)
	arg_19_0:addEventHandler("gamebattles_schedule_data_refreshed", function(arg_20_0, arg_20_1)
		arg_20_0:InitializeSchedule(arg_20_1.controller)
	end)
	arg_19_0.bindButton:addEventHandler("button_alt1", function(arg_21_0, arg_21_1)
		arg_19_0:RefreshSchedule(arg_19_1)
	end)

	if Engine.CIEGIACHAE() and Dvar.IBEGCHEFE("MQLPTSRKTN") then
		arg_19_0.bindButton:addEventHandler("button_alt2", function(arg_22_0, arg_22_1)
			MLG.HBCJGDEBA(arg_19_1)
		end)
		arg_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 3,
			side = "left",
			button_ref = "button_alt2",
			helper_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/GAMEBATTLES_TOURNAMENT_LIST")
		})
	end
end

function GameBattlesSchedule(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIHorizontalNavigator.new()

	var_23_0.id = "GameBattlesSchedule"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	var_23_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_23_1
	})
	var_23_0.HelperBar.id = "HelperBar"

	var_23_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_23_0.HelperBar:setPriority(10)
	var_23_0:addElement(var_23_0.HelperBar)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "LobbyMembersFooter"

	var_23_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_23_0:addElement(var_23_4)

	var_23_0.LobbyMembersFooter = var_23_4

	local var_23_5
	local var_23_6 = {
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
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameBattlesLobbyMember", {
				controllerIndex = var_23_1
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
	local var_23_7 = LUI.UIDataSourceGrid.new(var_23_6)

	var_23_7.id = "Team2Members"

	var_23_7:setUseStencil(false)
	var_23_7:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 380, _1080p * 880, _1080p * -366, _1080p * -118)
	var_23_0:addElement(var_23_7)

	var_23_0.Team2Members = var_23_7

	local var_23_8
	local var_23_9 = LUI.UIImage.new()

	var_23_9.id = "Team2Divider"

	var_23_9:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_23_9:SetAlpha(0.6, 0)
	var_23_9:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 380, _1080p * 880, _1080p * -371, _1080p * -370)
	var_23_0:addElement(var_23_9)

	var_23_0.Team2Divider = var_23_9

	local var_23_10
	local var_23_11 = LUI.UIStyledText.new()

	var_23_11.id = "Team2Name"

	var_23_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_23_11:setText("", 0)
	var_23_11:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_23_11:SetAlignment(LUI.Alignment.Left)
	var_23_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_11:SetStartupDelay(1000)
	var_23_11:SetLineHoldTime(400)
	var_23_11:SetAnimMoveTime(600)
	var_23_11:SetAnimMoveSpeed(50)
	var_23_11:SetEndDelay(1000)
	var_23_11:SetCrossfadeTime(400)
	var_23_11:SetFadeInTime(300)
	var_23_11:SetFadeOutTime(300)
	var_23_11:SetMaxVisibleLines(1)
	var_23_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 380, _1080p * 880, _1080p * -422, _1080p * -378)
	var_23_0:addElement(var_23_11)

	var_23_0.Team2Name = var_23_11

	local var_23_12
	local var_23_13 = {
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
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameBattlesLobbyMember", {
				controllerIndex = var_23_1
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
	local var_23_14 = LUI.UIDataSourceGrid.new(var_23_13)

	var_23_14.id = "Team1Members"

	var_23_14:setUseStencil(false)
	var_23_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -394, _1080p * 106, _1080p * -366, _1080p * -118)
	var_23_0:addElement(var_23_14)

	var_23_0.Team1Members = var_23_14

	local var_23_15
	local var_23_16 = LUI.UIImage.new()

	var_23_16.id = "Team1Divider"

	var_23_16:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_23_16:SetAlpha(0.6, 0)
	var_23_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -394, _1080p * 106, _1080p * -371, _1080p * -370)
	var_23_0:addElement(var_23_16)

	var_23_0.Team1Divider = var_23_16

	local var_23_17
	local var_23_18 = LUI.UIStyledText.new()

	var_23_18.id = "Team1Name"

	var_23_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_23_18:setText("", 0)
	var_23_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_23_18:SetAlignment(LUI.Alignment.Left)
	var_23_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_18:SetStartupDelay(1000)
	var_23_18:SetLineHoldTime(400)
	var_23_18:SetAnimMoveTime(600)
	var_23_18:SetAnimMoveSpeed(50)
	var_23_18:SetEndDelay(1000)
	var_23_18:SetCrossfadeTime(400)
	var_23_18:SetFadeInTime(300)
	var_23_18:SetFadeOutTime(300)
	var_23_18:SetMaxVisibleLines(1)
	var_23_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -394, _1080p * 106, _1080p * -422, _1080p * -378)
	var_23_0:addElement(var_23_18)

	var_23_0.Team1Name = var_23_18

	local var_23_19
	local var_23_20 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 2,
		buildArrowsLabel = false,
		wrapX = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		maxVisibleColumns = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ScheduleMapInfo", {
				controllerIndex = var_23_1
			})
		end,
		spacingX = _1080p * 25,
		spacingY = _1080p * 25,
		columnWidth = _1080p * 408,
		rowHeight = _1080p * 210,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_23_21 = LUI.UIDataSourceGrid.new(var_23_20)

	var_23_21.id = "Maps"

	var_23_21:setUseStencil(false)
	var_23_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -394, _1080p * 880, _1080p * -340, _1080p * 105)
	var_23_0:addElement(var_23_21)

	var_23_0.Maps = var_23_21

	local var_23_22
	local var_23_23 = MenuBuilder.BuildRegisteredType("ArrowDown", {
		controllerIndex = var_23_1
	})

	var_23_23.id = "ArrowDown"

	var_23_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 402, _1080p * 422, _1080p * 922, _1080p * 962)
	var_23_0:addElement(var_23_23)

	var_23_0.ArrowDown = var_23_23

	local var_23_24
	local var_23_25 = MenuBuilder.BuildRegisteredType("ArrowUp", {
		controllerIndex = var_23_1
	})

	var_23_25.id = "ArrowUp"

	var_23_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 238, _1080p * 258, _1080p * 922, _1080p * 962)
	var_23_0:addElement(var_23_25)

	var_23_0.ArrowUp = var_23_25

	local var_23_26
	local var_23_27 = LUI.UIText.new()

	var_23_27.id = "ListCount"

	var_23_27:setText("1/15", 0)
	var_23_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_27:SetAlignment(LUI.Alignment.Center)
	var_23_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 257.5, _1080p * 402.5, _1080p * 929.5, _1080p * 953.5)
	var_23_0:addElement(var_23_27)

	var_23_0.ListCount = var_23_27

	local var_23_28
	local var_23_29 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_23_1
	})

	var_23_29.id = "Scrollbar"

	var_23_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * -837, _1080p * -340, _1080p * 422)
	var_23_0:addElement(var_23_29)

	var_23_0.Scrollbar = var_23_29

	local var_23_30
	local var_23_31 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MLGScheduleButton", {
				controllerIndex = var_23_1
			})
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 400,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_23_32 = LUI.UIDataSourceGrid.new(var_23_31)

	var_23_32.id = "Matches"

	var_23_32:setUseStencil(true)
	var_23_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -430, _1080p * -340, _1080p * 422)
	var_23_0:addElement(var_23_32)

	var_23_0.Matches = var_23_32

	local var_23_33
	local var_23_34 = LUI.UIStyledText.new()

	var_23_34.id = "RefreshMatchesPromptLeft"

	var_23_34:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_REFRESH_PROMPT"), 0)
	var_23_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_34:SetAlignment(LUI.Alignment.Left)
	var_23_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -830, _1080p * -430, _1080p * 170, _1080p * 194)
	var_23_0:addElement(var_23_34)

	var_23_0.RefreshMatchesPromptLeft = var_23_34

	local var_23_35
	local var_23_36 = LUI.UIStyledText.new()

	var_23_36.id = "RefreshMatchesPromptCenter"

	var_23_36:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_REFRESH_PROMPT"), 0)
	var_23_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_36:SetAlignment(LUI.Alignment.Center)
	var_23_36:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -230, _1080p * 230, _1080p * 398, _1080p * 422)
	var_23_0:addElement(var_23_36)

	var_23_0.RefreshMatchesPromptCenter = var_23_36

	local var_23_37
	local var_23_38 = MenuBuilder.BuildRegisteredType("GameBattlesUpcomingMatch", {
		controllerIndex = var_23_1
	})

	var_23_38.id = "GameBattlesUpcomingMatch"

	var_23_38:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -230, _1080p * 230, _1080p * 171, _1080p * 391)
	var_23_0:addElement(var_23_38)

	var_23_0.GameBattlesUpcomingMatch = var_23_38

	local var_23_39
	local var_23_40 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_23_1
	})

	var_23_40.id = "TabBacker"

	var_23_40:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_23_0:addElement(var_23_40)

	var_23_0.TabBacker = var_23_40

	local var_23_41
	local var_23_42 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_23_1
	})

	var_23_42.id = "MenuTitle"

	var_23_42.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/GAME_BATTLES_SCHEDULE_BUTTON")), 0)
	var_23_42.Line:SetLeft(0, 0)
	var_23_42:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_23_0:addElement(var_23_42)

	var_23_0.MenuTitle = var_23_42

	local function var_23_43()
		return
	end

	var_23_0._sequences.DefaultSequence = var_23_43

	local var_23_44
	local var_23_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_7:RegisterAnimationSequence("HasNoMatches", var_23_45)

	local var_23_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_9:RegisterAnimationSequence("HasNoMatches", var_23_46)

	local var_23_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_11:RegisterAnimationSequence("HasNoMatches", var_23_47)

	local var_23_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("HasNoMatches", var_23_48)

	local var_23_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("HasNoMatches", var_23_49)

	local var_23_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_18:RegisterAnimationSequence("HasNoMatches", var_23_50)

	local var_23_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("HasNoMatches", var_23_51)

	local var_23_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_23:RegisterAnimationSequence("HasNoMatches", var_23_52)

	local var_23_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_25:RegisterAnimationSequence("HasNoMatches", var_23_53)

	local var_23_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_27:RegisterAnimationSequence("HasNoMatches", var_23_54)

	local var_23_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_29:RegisterAnimationSequence("HasNoMatches", var_23_55)

	local var_23_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_32:RegisterAnimationSequence("HasNoMatches", var_23_56)

	local var_23_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_34:RegisterAnimationSequence("HasNoMatches", var_23_57)

	local var_23_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_38:RegisterAnimationSequence("HasNoMatches", var_23_58)

	local function var_23_59()
		var_23_7:AnimateSequence("HasNoMatches")
		var_23_9:AnimateSequence("HasNoMatches")
		var_23_11:AnimateSequence("HasNoMatches")
		var_23_14:AnimateSequence("HasNoMatches")
		var_23_16:AnimateSequence("HasNoMatches")
		var_23_18:AnimateSequence("HasNoMatches")
		var_23_21:AnimateSequence("HasNoMatches")
		var_23_23:AnimateSequence("HasNoMatches")
		var_23_25:AnimateSequence("HasNoMatches")
		var_23_27:AnimateSequence("HasNoMatches")
		var_23_29:AnimateSequence("HasNoMatches")
		var_23_32:AnimateSequence("HasNoMatches")
		var_23_34:AnimateSequence("HasNoMatches")
		var_23_38:AnimateSequence("HasNoMatches")
	end

	var_23_0._sequences.HasNoMatches = var_23_59

	local var_23_60
	local var_23_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_7:RegisterAnimationSequence("HasMatches", var_23_61)

	local var_23_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_9:RegisterAnimationSequence("HasMatches", var_23_62)

	local var_23_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_11:RegisterAnimationSequence("HasMatches", var_23_63)

	local var_23_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("HasMatches", var_23_64)

	local var_23_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("HasMatches", var_23_65)

	local var_23_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_18:RegisterAnimationSequence("HasMatches", var_23_66)

	local var_23_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("HasMatches", var_23_67)

	local var_23_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_23:RegisterAnimationSequence("HasMatches", var_23_68)

	local var_23_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_25:RegisterAnimationSequence("HasMatches", var_23_69)

	local var_23_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_27:RegisterAnimationSequence("HasMatches", var_23_70)

	local var_23_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_29:RegisterAnimationSequence("HasMatches", var_23_71)

	local var_23_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_32:RegisterAnimationSequence("HasMatches", var_23_72)

	local var_23_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_36:RegisterAnimationSequence("HasMatches", var_23_73)

	local var_23_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_38:RegisterAnimationSequence("HasMatches", var_23_74)

	local function var_23_75()
		var_23_7:AnimateSequence("HasMatches")
		var_23_9:AnimateSequence("HasMatches")
		var_23_11:AnimateSequence("HasMatches")
		var_23_14:AnimateSequence("HasMatches")
		var_23_16:AnimateSequence("HasMatches")
		var_23_18:AnimateSequence("HasMatches")
		var_23_21:AnimateSequence("HasMatches")
		var_23_23:AnimateSequence("HasMatches")
		var_23_25:AnimateSequence("HasMatches")
		var_23_27:AnimateSequence("HasMatches")
		var_23_29:AnimateSequence("HasMatches")
		var_23_32:AnimateSequence("HasMatches")
		var_23_36:AnimateSequence("HasMatches")
		var_23_38:AnimateSequence("HasMatches")
	end

	var_23_0._sequences.HasMatches = var_23_75

	var_23_4:addEventHandler("menu_create", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_23_1
		end

		ACTIONS.ScaleFullscreen(var_23_0)
	end)

	local var_23_76 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_23_29,
		startCap = var_23_29.startCap,
		endCap = var_23_29.endCap,
		sliderArea = var_23_29.sliderArea,
		slider = var_23_29.sliderArea and var_23_29.sliderArea.slider,
		fixedSizeSlider = var_23_29.sliderArea and var_23_29.sliderArea.fixedSizeSlider
	})

	var_23_32:AddScrollbar(var_23_76)
	var_23_32:AddArrow(var_23_25)
	var_23_32:AddArrow(var_23_23)
	var_23_32:AddItemNumbers(var_23_27)
	var_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	var_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_23_77 = LUI.UIBindButton.new()

	var_23_77.id = "selfBindButton"

	var_23_0:addElement(var_23_77)

	var_23_0.bindButton = var_23_77

	var_23_0.bindButton:addEventHandler("button_start", function(arg_32_0, arg_32_1)
		local var_32_0 = arg_32_1.controller or var_23_1

		ACTIONS.OpenOptionsMenu(var_32_0, "", "")
	end)
	var_23_0.bindButton:addEventHandler("button_secondary", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_23_1
		end

		ACTIONS.LeaveMenu(var_23_0)
	end)
	var_0_14(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("GameBattlesSchedule", GameBattlesSchedule)
LUI.FlowManager.RegisterStackPopBehaviour("GameBattlesSchedule", var_0_6)
LockTable(_M)
