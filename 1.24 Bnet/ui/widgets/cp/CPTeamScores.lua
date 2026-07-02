module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = "CPScoreboardRow"

	if Dvar.IBEGCHEFE("NSLPPMQKQM") then
		var_1_0 = "ScoreboardRow"
	end

	local var_1_1
	local var_1_2 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = arg_1_1,
		buildChild = function()
			return (MenuBuilder.BuildRegisteredType(var_1_0, {
				controllerIndex = arg_1_1
			}))
		end,
		refreshChild = function(arg_3_0, arg_3_1, arg_3_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 980,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_3 = LUI.UIGrid.new(var_1_2)

	var_1_3.id = "Players"

	var_1_3:setUseStencil(false)
	var_1_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 1000, _1080p * 35, _1080p * 175)
	arg_1_0:addElement(var_1_3)

	arg_1_0.Players = var_1_3
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = "CPScoreboardRow"

	if Dvar.IBEGCHEFE("NSLPPMQKQM") then
		var_4_0 = "ScoreboardRow"
	end

	local var_4_1
	local var_4_2 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = arg_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType(var_4_0, {
				controllerIndex = arg_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1072,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_3 = LUI.UIGrid.new(var_4_2)

	var_4_3.id = "Players"

	var_4_3:setUseStencil(false)
	var_4_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 1000, _1080p * 35, _1080p * 175)
	arg_4_0:addElement(var_4_3)

	arg_4_0.Players = var_4_3
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = SCOREBOARD.IsAARScoreboard()

	if Engine.CGABICJHAI() then
		var_0_0(arg_7_0, arg_7_1)

		if var_7_0 then
			arg_7_0.PingHeader:SetAlpha(0)
			ACTIONS.AnimateSequence(arg_7_0, "Normal")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ingamePC")
		end
	else
		var_0_1(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "Normal")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end

	if not var_7_0 then
		function arg_7_2.numPlayersFunction(arg_8_0)
			return Game.CDJJDJJDHC()
		end
	end

	arg_7_2.grid = arg_7_0.Players
	arg_7_2.direction = LUI.DIRECTION.vertical

	local var_7_1 = LUI.Scoreboard.new(arg_7_2)

	var_7_1:SetTeamIndex(Teams.allies)
	arg_7_0:addElement(var_7_1)

	arg_7_0.Scoreboard = var_7_1

	arg_7_0.Players:SetNumRows(4)
	arg_7_0.Players:SetNumColumns(1)
	arg_7_0.Players:SetMask(arg_7_0.Mask)
	arg_7_0.Players:SetRefreshChild(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_7_0.Scoreboard then
			local var_9_0 = arg_7_0.Scoreboard:GetTeamIndex()

			if var_9_0 then
				arg_9_0:RefreshRowContent(var_9_0, arg_9_2)

				if not Engine.CGABICJHAI() then
					arg_9_0:SetRight(_1080p * 890, 0)
				elseif CONDITIONS.InFrontend() then
					arg_9_0:SetRight(_1080p * 890, 0)
				end
			end
		end
	end)

	local function var_7_2()
		local var_10_0 = arg_7_0.Scoreboard:GetIndex()

		if var_10_0 then
			return {
				x = 0,
				y = var_10_0
			}
		end
	end

	arg_7_0.Scoreboard:SetDefaultFocusFunction(var_7_2)
	arg_7_0:registerEventHandler("open_scoreboard", function(arg_11_0, arg_11_1)
		if not CONDITIONS.IsGamepadEnabled() then
			ACTIONS.GainFocus(arg_7_0, "Players", arg_7_1)
		end

		local var_11_0 = SCOREBOARD.GetCurrentScoreBoardMenu(arg_11_0, arg_7_1)

		if var_11_0 ~= nil and var_11_0.ButtonHelperBar ~= nil and (not Engine.ECHCFGDDDF() or not CODCASTER.CanCODCast() or not CODCASTER.IsCODCaster()) then
			if LUI.IsLastInputKeyboardMouse(arg_7_1) and not CONDITIONS.IsGamepadEnabled() then
				var_11_0:AddButtonHelperTextToElement(var_11_0.ButtonHelperBar, {
					kbm_only = true,
					priority = 0,
					ignoreTooltip = true,
					ignoreButtonBackground = true,
					side = "right",
					button_ref = "button_secondary",
					clickable = false,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/ENABLE_CURSOR_PROMPT")
				})
			else
				var_11_0:RemoveButtonHelperTextFromElement(var_11_0.ButtonHelperBar, "button_secondary")
			end
		end

		arg_7_0:registerEventHandler("lui_layer_keycatch_notify", function(arg_12_0, arg_12_1)
			if LUI.IsLastInputKeyboardMouse(arg_12_1.controller) then
				local var_12_0 = LUI.ScoreboardLayer.GetScoreboardMenu(arg_7_1)

				if var_12_0 and var_12_0.ButtonHelperBar then
					var_12_0:RemoveButtonHelperTextFromElement(var_12_0.ButtonHelperBar, "button_secondary", "right")
				end
			end
		end)
	end)
	arg_7_0:addEventHandler("gamepad_button", function(arg_13_0, arg_13_1)
		return arg_7_0.Players:ProcessEventToChildInFocus(arg_13_1)
	end)
	arg_7_0:registerEventHandler("set_post_match_state", function(arg_14_0, arg_14_1)
		if Engine.CGABICJHAI() then
			arg_14_0.PingHeader:SetAlpha(0)
		end

		ACTIONS.AnimateSequence(arg_7_0, "Normal")
		arg_7_0.Players:SetRefreshChild(function(arg_15_0, arg_15_1, arg_15_2)
			if arg_7_0.Scoreboard then
				local var_15_0 = arg_7_0.Scoreboard:GetTeamIndex()

				if var_15_0 then
					arg_15_0:RefreshRowContent(var_15_0, arg_15_2)
					arg_15_0:SetRight(_1080p * 890, 0)
				end
			end
		end)
	end)
end

function CPTeamScores(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1010 * _1080p, 0, 200 * _1080p)

	var_16_0.id = "CPTeamScores"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "Backer"

	var_16_4:SetRGBFromInt(0, 0)
	var_16_4:SetAlpha(0.5, 0)
	var_16_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 30, _1080p * -50)
	var_16_0:addElement(var_16_4)

	var_16_0.Backer = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "BackgroundRows"

	var_16_6:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_16_6:SetAlpha(0.08, 0)
	var_16_6:setImage(RegisterMaterial("hud_scoreboard_rows_cp"), 0)
	var_16_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 35, _1080p * 145)
	var_16_0:addElement(var_16_6)

	var_16_0.BackgroundRows = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIStyledText.new()

	var_16_8.id = "KillsHeader"

	var_16_8:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_16_8:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/KILLS"), 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_8:SetAlignment(LUI.Alignment.Center)
	var_16_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_16_8:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 562, _1080p * 662, _1080p * 7, _1080p * 25)
	var_16_0:addElement(var_16_8)

	var_16_0.KillsHeader = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIStyledText.new()

	var_16_10.id = "RevivesHeader"

	var_16_10:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_16_10:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/REVIVES"), 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_10:SetAlignment(LUI.Alignment.Center)
	var_16_10:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_16_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 672, _1080p * 792, _1080p * 7, _1080p * 25)
	var_16_0:addElement(var_16_10)

	var_16_0.RevivesHeader = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIStyledText.new()

	var_16_12.id = "DownsHeader"

	var_16_12:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_16_12:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/DOWNS"), 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_12:SetLeading(-9 * _1080p, 0)
	var_16_12:SetAlignment(LUI.Alignment.Center)
	var_16_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_16_12:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_16_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 801, _1080p * 901, _1080p * 7, _1080p * 25)
	var_16_0:addElement(var_16_12)

	var_16_0.DownsHeader = var_16_12

	local var_16_13

	if CONDITIONS.IsPC(var_16_0) then
		var_16_13 = LUI.UIStyledText.new()
		var_16_13.id = "PingHeader"

		var_16_13:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
		var_16_13:setText(Engine.CBBHFCGDIC("LUA_MENU/LATENCY"), 0)
		var_16_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_16_13:SetLeading(-9 * _1080p, 0)
		var_16_13:SetAlignment(LUI.Alignment.Right)
		var_16_13:SetVerticalAlignment(LUI.Alignment.Center)
		var_16_13:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_16_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 909, _1080p * 995, _1080p * 7, _1080p * 25)
		var_16_0:addElement(var_16_13)

		var_16_0.PingHeader = var_16_13
	end

	local var_16_14
	local var_16_15 = LUI.UIImage.new()

	var_16_15.id = "Mask"

	var_16_15:setImage(RegisterMaterial("stencil_mask"), 0)
	var_16_15:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -62, _1080p * -2, 0, 0)
	var_16_0:addElement(var_16_15)

	var_16_0.Mask = var_16_15

	local function var_16_16()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_16

	local var_16_17
	local var_16_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_16_4:RegisterAnimationSequence("ingamePC", var_16_18)

	local var_16_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_16_6:RegisterAnimationSequence("ingamePC", var_16_19)

	local function var_16_20()
		var_16_4:AnimateSequence("ingamePC")
		var_16_6:AnimateSequence("ingamePC")
	end

	var_16_0._sequences.ingamePC = var_16_20

	local var_16_21
	local var_16_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		}
	}

	var_16_4:RegisterAnimationSequence("Normal", var_16_22)

	local var_16_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -105
		}
	}

	var_16_6:RegisterAnimationSequence("Normal", var_16_23)

	local function var_16_24()
		var_16_4:AnimateSequence("Normal")
		var_16_6:AnimateSequence("Normal")
	end

	var_16_0._sequences.Normal = var_16_24

	local var_16_25
	local var_16_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		}
	}

	var_16_8:RegisterAnimationSequence("AR", var_16_26)

	local var_16_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		}
	}

	var_16_10:RegisterAnimationSequence("AR", var_16_27)

	local var_16_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		}
	}

	var_16_12:RegisterAnimationSequence("AR", var_16_28)

	if CONDITIONS.IsPC(var_16_0) then
		local var_16_29 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 30
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 4
			}
		}

		var_16_13:RegisterAnimationSequence("AR", var_16_29)
	end

	local function var_16_30()
		var_16_8:AnimateSequence("AR")
		var_16_10:AnimateSequence("AR")
		var_16_12:AnimateSequence("AR")

		if CONDITIONS.IsPC(var_16_0) then
			var_16_13:AnimateSequence("AR")
		end
	end

	var_16_0._sequences.AR = var_16_30

	var_0_2(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("CPTeamScores", CPTeamScores)
LockTable(_M)
