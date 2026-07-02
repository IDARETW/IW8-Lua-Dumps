module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Scoreboard._grid:RefreshContent()
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.RefreshContent = var_0_0

	local var_2_0 = CONDITIONS.IsSplitscreen() and 5 or SCOREBOARD.maxVisibleTeamSize
	local var_2_1 = SCOREBOARD.maxVisibleTeamSize

	if Dvar.IBEGCHEFE("SPTSNKQSN") then
		var_2_1 = math.max(var_2_1, Dvar.CFHDGABACF("OOTQKOTRM") / 2)
	end

	arg_2_0.isFriendly = nil
	arg_2_0.isEnemy = nil
	arg_2_0.team = arg_2_2.team

	if not SCOREBOARD.IsAARScoreboard() then
		if Game.EBEHIFHGD() == MP.GameMode.ArenaGameType then
			var_2_0 = 6
		end
	else
		if arg_2_2.teamNum then
			var_2_1 = math.min(arg_2_2.teamNum, SCOREBOARD.maxVisibleTeamSize)
		end

		arg_2_0.isFriendly = arg_2_2.isFriendly
		arg_2_0.isEnemy = arg_2_2.isEnemy
	end

	local function var_2_2()
		if CODCASTER.CanCODCast() and CODCASTER.IsCODCaster() then
			local var_3_0 = arg_2_0.isFriendly and 1 or 2
			local var_3_1, var_3_2 = CODCASTER.GetTeamColor(arg_2_1, var_3_0)

			arg_2_0.Rows:SetRGBFromTable(COLORS.black)
			arg_2_0.Rows:SetAlpha(0.1)
			arg_2_0.Backer:SetRGBFromInt(var_3_1)
		elseif arg_2_0.isFriendly then
			arg_2_0.Rows:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
		else
			arg_2_0.Rows:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam)
		end
	end

	arg_2_2.scrollbar = arg_2_0.VerticalScrollbar

	local var_2_3 = {
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		alwaysSnap = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = false,
		numColumns = 1,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 5000,
		maxVisibleRows = var_2_0,
		controllerIndex = arg_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ScoreboardRow", {
				controllerIndex = arg_2_1,
				isFriendly = arg_2_0.isFriendly,
				isEnemy = arg_2_0.isEnemy
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			arg_5_0.isFriendly = arg_2_0.isFriendly
			arg_5_0.isEnemy = arg_2_0.isEnemy

			if CONDITIONS.InFrontend() and arg_2_2.team then
				local var_5_0 = arg_2_2.team

				arg_5_0:RefreshRowContent(var_5_0, arg_5_2)
			elseif arg_2_0.Scoreboard then
				local var_5_1 = arg_2_0.Scoreboard:GetTeamIndex()

				if var_5_1 then
					local var_5_2 = arg_5_2

					if arg_2_0.isFriendly and not Dvar.IBEGCHEFE("SPTSNKQSN") then
						local var_5_3 = Game.DJABDGEIID(var_5_1)
						local var_5_4 = Game.CDGDCBIBBE()

						var_5_2 = SCOREBOARD.GetRowDataIndex(var_5_3, var_5_4, arg_5_2)
					end

					arg_5_0:RefreshRowContent(var_5_1, var_5_2)
				end

				if CONDITIONS.IsUsingFFAMatchStatus() then
					arg_5_0:SetRight(LAYOUT.GetElementWidth(arg_2_0), 0)
				end
			end

			var_2_2()
		end,
		numRows = var_2_1,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 818,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}

	arg_2_2.arrowIndicator = arg_2_0.IndicatorArrow
	arg_2_0.Scoreboard = LUI.Scoreboard.new(arg_2_2, var_2_3)
	arg_2_0.Scoreboard.id = "Scoreboard"

	arg_2_0:addElement(arg_2_0.Scoreboard)

	arg_2_0._controllerIndex = arg_2_1

	local function var_2_4(arg_6_0, arg_6_1)
		local var_6_0 = arg_2_0.Scoreboard:GetTeamIndex()
		local var_6_1 = Game.DJABDGEIID(var_6_0)
		local var_6_2 = arg_6_1 and arg_6_1.returnFriendTeamRealNum == true

		if CONDITIONS.IsArmsRaceGameType() and not var_6_2 then
			if Dvar.IBEGCHEFE("SPTSNKQSN") then
				var_6_1 = math.min(var_6_1, Dvar.CFHDGABACF("OOTQKOTRM") / 2)
			else
				var_6_1 = math.min(var_6_1, SCOREBOARD.maxVisibleTeamSize)
			end
		end

		return var_6_1
	end

	arg_2_0.Scoreboard:SetNumberOfPlayersFunction(var_2_4)
	arg_2_0:addEventHandler("open_scoreboard", function(arg_7_0, arg_7_1)
		local var_7_0 = SCOREBOARD.GetCurrentScoreBoardMenu(arg_7_0, arg_2_1)

		if var_7_0 ~= nil and var_7_0.ButtonHelperBar ~= nil then
			if CONDITIONS.InGame() and CONDITIONS.IsCoreMultiplayer() then
				local var_7_1 = DataSources.inGame.MP.match.matchOver

				if CONDITIONS.IsGamepadEnabled() then
					var_7_0:AddButtonHelperTextToElement(var_7_0.ButtonHelperBar, {
						side = "right",
						priority = 0,
						gamepad_only = true,
						button_ref = "button_select",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE")
					})
				else
					var_7_0:RemoveButtonHelperTextFromElement(var_7_0.ButtonHelperBar, "button_select", "right")
				end

				local function var_7_2()
					if var_7_1:GetValue(arg_2_1) then
						var_7_0:RemoveButtonHelperTextFromElement(var_7_0.ButtonHelperBar, "button_select", "right")
					end
				end

				arg_2_0:SubscribeToModel(var_7_1:GetModel(arg_2_1), var_7_2)
			end

			if not Engine.ECHCFGDDDF() or not CODCASTER.CanCODCast() or not CODCASTER.IsCODCaster() then
				if LUI.IsLastInputKeyboardMouse(arg_2_1) and not CONDITIONS.IsGamepadEnabled() then
					var_7_0:AddButtonHelperTextToElement(var_7_0.ButtonHelperBar, {
						priority = 0,
						side = "right",
						kbm_only = true,
						button_ref = "button_secondary",
						clickable = false,
						ignoreTooltip = true,
						ignoreButtonBackground = true,
						helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/ENABLE_CURSOR_PROMPT"),
						overrideTextUpColor = SWATCHES.HUD.spinnerText
					})
				else
					var_7_0:RemoveButtonHelperTextFromElement(var_7_0.ButtonHelperBar, "button_secondary")
				end
			end
		end

		arg_2_0:registerEventHandler("lui_layer_keycatch_notify", function(arg_9_0, arg_9_1)
			if LUI.IsLastInputKeyboardMouse(arg_9_1.controller) then
				local var_9_0 = LUI.ScoreboardLayer.GetScoreboardMenu(arg_2_1)

				if var_9_0 and var_9_0.ButtonHelperBar then
					var_9_0:RemoveButtonHelperTextFromElement(var_9_0.ButtonHelperBar, "button_secondary", "right")
				end
			end
		end)
	end)
	arg_2_0:addEventHandler("close_scoreboard", function(arg_10_0, arg_10_1)
		local var_10_0 = SCOREBOARD.GetCurrentScoreBoardMenu(arg_10_0, arg_2_1)

		if var_10_0 ~= nil and var_10_0.ButtonHelperBar ~= nil then
			arg_2_0:RemoveButtonHelperTextFromElement(var_10_0.ButtonHelperBar, "button_secondary", "right")
			arg_2_0:RemoveButtonHelperTextFromElement(var_10_0.ButtonHelperBar, "button_r3", "right")
			arg_2_0:RemoveButtonHelperTextFromElement(var_10_0.ButtonHelperBar, "button_select", "right")
		end

		LUI.MouseCursorContextualMenuLayer.ForceCloseContextualMenu()
	end)
end

function TeamScores(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 890 * _1080p, 0, 280 * _1080p)

	var_11_0.id = "TeamScores"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Backer"

	var_11_4:SetRGBFromInt(5066061, 0)
	var_11_4:SetAlpha(0.6, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5)
	var_11_0:addElement(var_11_4)

	var_11_0.Backer = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Rows"

	var_11_6:SetAlpha(0.08, 0)
	var_11_6:setImage(RegisterMaterial("hud_scoreboard_rows"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -1, 0, _1080p * 280)
	var_11_0:addElement(var_11_6)

	var_11_0.Rows = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("IndicatorArrow", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "IndicatorArrow"

	var_11_8:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -10, _1080p * 10, _1080p * 280, _1080p * 295)
	var_11_0:addElement(var_11_8)

	var_11_0.IndicatorArrow = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "VerticalScrollbar"

	var_11_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 10, _1080p * 25, _1080p * -5, _1080p * 285)
	var_11_0:addElement(var_11_10)

	var_11_0.VerticalScrollbar = var_11_10

	local function var_11_11()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_11

	local var_11_12
	local var_11_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max
		}
	}

	var_11_6:RegisterAnimationSequence("Splitscreen", var_11_13)

	local var_11_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 160
		}
	}

	var_11_8:RegisterAnimationSequence("Splitscreen", var_11_14)

	local var_11_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		}
	}

	var_11_10:RegisterAnimationSequence("Splitscreen", var_11_15)

	local function var_11_16()
		var_11_6:AnimateSequence("Splitscreen")
		var_11_8:AnimateSequence("Splitscreen")
		var_11_10:AnimateSequence("Splitscreen")
	end

	var_11_0._sequences.Splitscreen = var_11_16

	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	if CONDITIONS.IsSplitscreen(var_11_0) then
		ACTIONS.AnimateSequence(var_11_0, "Splitscreen")
	end

	return var_11_0
end

MenuBuilder.registerType("TeamScores", TeamScores)
LockTable(_M)
