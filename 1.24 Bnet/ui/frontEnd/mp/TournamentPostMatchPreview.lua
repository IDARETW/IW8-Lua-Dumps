module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.RoundResults)

	local var_1_0 = Tournament.DEAAICJGHI(arg_1_2.roundIndex, arg_1_2.matchIndex)

	arg_1_0.RoundResults:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.RoundResults:GetContentIndex(arg_2_1, arg_2_2)

		arg_2_0:Setup(arg_1_2.roundIndex, arg_1_2.matchIndex, var_2_0)
	end)
	arg_1_0.RoundResults:SetNumChildren(var_1_0)
	arg_1_0.RoundResults:RefreshContent()
	arg_1_0.TournamentPlayerNames:SetClientCharacterScene(arg_1_1, arg_1_2.roundIndex, arg_1_2.matchIndex)
end

function TournamentPostMatchPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "TournamentPostMatchPreview"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	var_3_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})
	var_3_0.HelperBar.id = "HelperBar"

	var_3_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0.HelperBar:setPriority(10)
	var_3_0:addElement(var_3_0.HelperBar)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TournamentTeamPreview", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "TournamentTeamPreview"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 1260, _1080p * 154, _1080p * 454)
	var_3_0:addElement(var_3_4)

	var_3_0.TournamentTeamPreview = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "MenuTitle"

	var_3_6.MenuTitle:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_PREVIEW"), 0)
	var_3_6.Line:SetLeft(0, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_3_0:addElement(var_3_6)

	var_3_0.MenuTitle = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Result"

	var_3_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/FINAL_RESULT"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -98, _1080p * 98, _1080p * 170, _1080p * 194)
	var_3_0:addElement(var_3_8)

	var_3_0.Result = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("TournamentPlayerNames", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "TournamentPlayerNames"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 200, _1080p * 600)
	var_3_0:addElement(var_3_10)

	var_3_0.TournamentPlayerNames = var_3_10

	local var_3_11
	local var_3_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 10,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("TournamentRoundResult", {
				controllerIndex = var_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			return
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 50,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_13 = LUI.UIGrid.new(var_3_12)

	var_3_13.id = "RoundResults"

	var_3_13:setUseStencil(true)
	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 701, _1080p * 1219, _1080p * 494, _1080p * 700)
	var_3_0:addElement(var_3_13)

	var_3_0.RoundResults = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIText.new()

	var_3_15.id = "ResultsTitle"

	var_3_15:setText(Engine.CBBHFCGDIC("TOURNAMENT/ROUND_RESULTS"), 0)
	var_3_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_15:SetAlignment(LUI.Alignment.Center)
	var_3_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 454, _1080p * 478)
	var_3_0:addElement(var_3_15)

	var_3_0.ResultsTitle = var_3_15

	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_3_16 = LUI.UIBindButton.new()

	var_3_16.id = "selfBindButton"

	var_3_0:addElement(var_3_16)

	var_3_0.bindButton = var_3_16

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_3_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or var_3_1

		ACTIONS.OpenOptionsMenu(var_7_0, "")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentPostMatchPreview", TournamentPostMatchPreview)
LockTable(_M)
