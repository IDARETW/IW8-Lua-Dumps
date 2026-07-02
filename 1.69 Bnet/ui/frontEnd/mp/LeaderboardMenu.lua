module(..., package.seeall)

local var_0_0 = "<unknown>"

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("LeaderboardFilterFlyout", arg_1_1)

	var_1_0.id = "LeaderboardFilterPopup"

	return var_1_0
end

MenuBuilder.registerType("LeaderboardFilterPopup", var_0_1)

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("LeaderboardGamemodeSelectFlyout", arg_2_1)

	var_2_0.id = "LeaderboardGamemodeSelectFlyout"

	return var_2_0
end

MenuBuilder.registerType("LeaderboardGamemodeSelectPopup", var_0_2)

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = Engine.CBBHFCGDIC(Leaderboards.GetLeaderboardTitle(arg_3_1))

	arg_3_0.MenuTitle:SetTitle(var_3_0)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1.Title
	local var_4_1 = arg_4_2.Title

	arg_4_0.Filter:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_FILTER", var_4_0, var_4_1))
end

local function var_0_5(arg_5_0)
	if not arg_5_0._populatedPlayerRow then
		arg_5_0.PlayerRow:SetAlpha(0)

		return
	end

	local var_5_0, var_5_1 = arg_5_0.LeaderboardContent:GetRowBoundaries()

	if not var_5_0 or not var_5_1 then
		var_5_0 = 1
		var_5_1 = arg_5_0.LeaderboardContent:GetMaxVisibleRows()
	end

	local var_5_2 = math.floor(var_5_0)
	local var_5_3 = math.ceil(var_5_1)
	local var_5_4 = false

	if arg_5_0.PlayerRow and arg_5_0.PlayerRow._data then
		local var_5_5 = Leaderboards.ECHJEACIHA()

		if var_5_5 then
			var_5_4 = var_5_2 < var_5_5 and var_5_5 <= var_5_3
		end
	end

	arg_5_0.PlayerRow:SetAlpha(var_5_4 and 0 or 1)
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	return arg_6_0._leaderboard ~= leaderboard or arg_6_0._filter ~= arg_6_1 or arg_6_0._platformFilter ~= arg_6_2 or arg_6_0._isHardcore ~= arg_6_3
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
	if not var_0_6(arg_7_0, arg_7_3, arg_7_4, arg_7_5) then
		return
	end

	arg_7_0._leaderboard = arg_7_2
	arg_7_0._filter = arg_7_3
	arg_7_0._platformFilter = arg_7_4
	arg_7_0._isHardcore = arg_7_5
	arg_7_0._autoScrolledToPlayer = false
	arg_7_0._populatedPlayerRow = false

	local var_7_0 = {
		[Leaderboards.FilterCategory.Player] = arg_7_0._filter,
		[Leaderboards.FilterCategory.Platform] = arg_7_0._platformFilter
	}

	Leaderboards.SetSelectedFilters(arg_7_1, var_7_0)
	arg_7_0.HardcoreText:SetAlpha(arg_7_5 and 1 or 0)

	local var_7_1 = arg_7_0.LeaderboardContent:GetMaxVisibleRows()

	Leaderboards.BEIGDFDHHA()
	Leaderboards.OpenLeaderboard(arg_7_0._leaderboard, arg_7_0._isHardcore)

	local var_7_2 = arg_7_0._platformFilter.Value ~= Leaderboards.PlatformFilters.None.Value

	Leaderboards.EFGIJHCCA(arg_7_1, arg_7_0._filter.Value, 0, var_7_1, var_7_2)

	arg_7_0._isInitialFetch = true

	var_0_3(arg_7_0, arg_7_0._leaderboard)
	var_0_4(arg_7_0, arg_7_0._filter, arg_7_0._platformFilter)
	arg_7_0.HeaderRow:CreateExtraColumns(arg_7_1, arg_7_2)
	arg_7_0.PlayerRow:Populate(arg_7_1, arg_7_0._leaderboard, {
		rowIndex = Leaderboards.ECHJEACIHA()
	})
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = Leaderboards.DCEFCJCAFG()

	arg_8_0.numRows = var_8_0

	if not var_8_0 or var_8_0 == 0 then
		arg_8_0.LeaderboardContent:SetNumRows(0)
		arg_8_0.LeaderboardContent:SetAlpha(0)
		arg_8_0.PlayerRow:SetAlpha(0)

		return
	end

	arg_8_0.LeaderboardContent:SetAlpha(1)

	if var_8_0 ~= arg_8_0.LeaderboardContent:GetNumRows() then
		arg_8_0.LeaderboardContent:SetNumRows(var_8_0)
		arg_8_0.LeaderboardContent:processEvent({
			name = "gain_focus",
			controller = arg_8_1
		})
	end

	arg_8_0.LeaderboardContent:RefreshContent()

	arg_8_0._shouldTriggerDownload = true

	if not arg_8_0._autoScrolledToPlayer then
		local var_8_1 = Leaderboards.ECHJEACIHA()

		if var_8_1 then
			arg_8_0._autoScrolledToPlayer = true

			arg_8_0.LeaderboardContent:SetFocusedPosition({
				x = 0,
				y = var_8_1
			}, true, true)
		end
	end

	if not arg_8_0._populatedPlayerRow then
		local var_8_2 = Leaderboards.DGDBJBEGJE(arg_8_1)

		if var_8_2 then
			var_8_2.Gamertag = Engine.BAGAFBABEE(arg_8_1)
			arg_8_0._populatedPlayerRow = var_8_2.Rank and #var_8_2.Rank > 0
			var_8_2.rowIndex = Leaderboards.ECHJEACIHA()

			arg_8_0.PlayerRow:Populate(arg_8_1, arg_8_0._leaderboard, var_8_2)
		end
	end

	var_0_5(arg_8_0)
end

local function var_0_9(arg_9_0)
	arg_9_0.LeaderboardContent:FocusFirstItem()
end

local function var_0_10(arg_10_0, arg_10_1)
	if Leaderboards.DCEFCJCAFG() <= 0 then
		return
	end

	if arg_10_0._pendingUpdate then
		return
	end

	local var_10_0 = arg_10_0.LeaderboardContent:GetRowBoundaries()

	if var_10_0 then
		local var_10_1 = var_10_0 + arg_10_1

		if arg_10_0.LeaderboardContent:IsPositionFocusable({
			x = 0,
			y = var_10_1
		}) then
			arg_10_0.LeaderboardContent:SetTargetRow(var_10_1, true, true)
			arg_10_0.LeaderboardContent:SetFocusedPosition({
				x = 0,
				y = var_10_1
			}, true, false)
		end
	end
end

local function var_0_11(arg_11_0)
	local var_11_0 = arg_11_0.LeaderboardContent:GetMaxVisibleRows()

	var_0_10(arg_11_0, var_11_0)
end

local function var_0_12(arg_12_0)
	local var_12_0 = arg_12_0.LeaderboardContent:GetMaxVisibleRows()

	var_0_10(arg_12_0, -var_12_0)
end

local function var_0_13(arg_13_0, arg_13_1)
	if not arg_13_0.playercardDownloadWait then
		arg_13_0.playercardDownloadWait = arg_13_0:Wait(1000, true)

		function arg_13_0.playercardDownloadWait.onComplete()
			Leaderboards.DHADJHGJCI(arg_13_0._controllerIndex)

			arg_13_0.playercardDownloadWait = nil
		end
	end

	arg_13_0.LeaderboardPlayerCard:SetAlpha(0)

	local var_13_0

	local function var_13_1()
		local var_15_0 = arg_13_1:GetPlayerCardData()

		if var_15_0 and var_15_0.gamerTag ~= var_0_0 then
			arg_13_0.LeaderboardPlayerCard:SetData(var_15_0)
			arg_13_0.LeaderboardPlayerCard:SetAlpha(1)
		else
			arg_13_0.LeaderboardPlayerCard:Wait(200, true).onComplete = var_13_1
		end
	end

	var_13_1()
end

local function var_0_14(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_0.PlayerRow)
	assert(arg_16_0.bindButton)
	assert(arg_16_0.ButtonHelperBar)

	arg_16_0._controllerIndex = arg_16_1
	arg_16_0._pageSize = 60
	arg_16_0._maxNumberOfEntries = 10000
	arg_16_0._oldFrom = 0
	arg_16_0._oldTo = 0
	arg_16_0._isInitialFetch = true

	local var_16_0 = Leaderboards.Filters.Friends
	local var_16_1 = Leaderboards.PlatformFilters.None
	local var_16_2 = Leaderboards.GetSelectedFilters(arg_16_1)

	if var_16_2 then
		var_16_0 = var_16_2[Leaderboards.FilterCategory.Player] or var_16_0
		var_16_1 = var_16_2[Leaderboards.FilterCategory.Platform] or var_16_1
	end

	local var_16_3 = arg_16_2.leaderboardType or "Score"
	local var_16_4 = arg_16_2.isHardcore or false

	var_0_7(arg_16_0, arg_16_1, var_16_3, var_16_0, var_16_1, var_16_4)

	arg_16_0._canSwitchLeaderboard = arg_16_2.canSwitchLeaderboard
	arg_16_0._boardsToUse = arg_16_2.boardsToUse

	if arg_16_0._canSwitchLeaderboard then
		arg_16_0:AddButtonHelperTextToElement(arg_16_0.ButtonHelperBar, {
			side = "left",
			button_ref = "button_alt2",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_CHANGE")
		})
	end

	arg_16_0.LeaderboardContent:SetSnapOnWrapEnabled(true)
	arg_16_0.LeaderboardContent:SetNumColumns(1)
	arg_16_0.LeaderboardContent:SetNumRows(1)

	function arg_16_0.LeaderboardContent.PositionChanged(arg_17_0)
		LUI.UIGrid.PositionChanged(arg_17_0)

		local var_17_0, var_17_1 = arg_17_0:GetRowBoundaries()

		if not var_17_0 or not var_17_1 then
			var_17_0 = 0
			var_17_1 = arg_16_0.LeaderboardContent:GetMaxVisibleRows()
		end

		local var_17_2 = math.floor(var_17_0)
		local var_17_3 = math.floor(var_17_1) - 1
		local var_17_4 = arg_16_0._platformFilter.Value ~= Leaderboards.PlatformFilters.None.Value

		arg_16_0._pendingUpdate = not Leaderboards.EFGIJHCCA(arg_16_1, arg_16_0._filter.Value, var_17_2, var_17_3, var_17_4)

		var_0_5(arg_16_0)
	end

	local var_16_5 = LUI.UITimer.new({
		interval = 50,
		event = "refresh_leaderboard"
	})

	arg_16_0:addElement(var_16_5)
	arg_16_0:registerEventHandler("refresh_leaderboard", function(arg_18_0, arg_18_1)
		if arg_18_0._pendingUpdate then
			arg_18_0.LeaderboardContent:PositionChanged()
		end
	end)
	arg_16_0.LeaderboardContent:SetRefreshChild(function(arg_19_0, arg_19_1, arg_19_2)
		assert(arg_19_0.Row)

		if not arg_16_0.numRows or arg_16_0.numRows == 0 then
			arg_16_0.LeaderboardContent:SetAlpha(0)
			arg_16_0.LeaderboardContent:SetNumRows(0)

			return
		end

		arg_16_0.LeaderboardContent:SetAlpha(1)

		local var_19_0 = Leaderboards.CIAAJCFHDJ(arg_16_1, arg_19_2)

		var_19_0.rowIndex = arg_19_2

		arg_19_0.Row:Populate(arg_16_1, arg_16_0._leaderboard, var_19_0)
	end)
	arg_16_0:registerEventHandler("leaderboard_fetch_complete", function(arg_20_0, arg_20_1)
		var_0_8(arg_20_0, arg_16_1)
		arg_20_0.LeaderboardContent:PositionChanged()
	end)
	arg_16_0.bindButton:addEventHandler("button_shoulderl", function(arg_21_0, arg_21_1)
		if LUI.IsLastInputGamepad(arg_16_1) then
			var_0_9(arg_16_0)
		end
	end)
	arg_16_0.bindButton:addEventHandler("button_alt1", function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_1.controller or arg_16_1
		local var_22_1 = {
			controllerIndex = var_22_0,
			filter = arg_16_0._filter,
			platformFilter = arg_16_0._platformFilter,
			playlistFilter = arg_16_0._isHardcore,
			showPlaylistFilter = Leaderboards.GetLeaderboardHasHardcoreMode(arg_16_0._leaderboard),
			setFilterOptions = function(arg_23_0, arg_23_1, arg_23_2)
				var_0_7(arg_16_0, var_22_0, arg_16_0._leaderboard, arg_23_0, arg_23_1, arg_23_2)
			end
		}
		local var_22_2 = MenuBuilder.BuildRegisteredType("LeaderboardFilterPopup", var_22_1)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, var_22_0, false, {
			widget = var_22_2,
			backButtonOverride = var_22_1.backButtonOverride,
			closePopupOverride = var_22_1.backButtonOverride
		})
	end)
	arg_16_0:AddButtonHelperTextToElement(arg_16_0.ButtonHelperBar, {
		kbm_only = true,
		priority = 3,
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("CAS/LOCKER_FILTER")
	})
	arg_16_0.bindButton:addEventHandler("button_alt2", function(arg_24_0, arg_24_1)
		if LUI.IsLastInputKeyboardMouse(arg_16_1) then
			var_0_9(arg_16_0)
		end

		if not arg_16_0._canSwitchLeaderboard then
			return false
		end

		local var_24_0 = arg_24_1.controller or arg_16_1
		local var_24_1 = {
			controllerIndex = var_24_0,
			leaderboard = arg_16_0._leaderboard,
			isHardcore = arg_16_0._isHardcore,
			boardsToUse = arg_16_0._boardsToUse,
			changeLeaderboard = function(arg_25_0)
				var_0_7(arg_16_0, var_24_0, arg_25_0, arg_16_0._filter, arg_16_0._platformFilter, arg_16_0._isHardcore)
			end
		}
		local var_24_2 = MenuBuilder.BuildRegisteredType("LeaderboardGamemodeSelectPopup", var_24_1)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, var_24_0, false, {
			widget = var_24_2
		})
	end)
	arg_16_0.bindButton:addEventHandler("button_left_trigger", function(arg_26_0, arg_26_1)
		var_0_12(arg_16_0)
	end)
	arg_16_0.bindButton:addEventHandler("button_right_trigger", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = arg_16_1
		end

		var_0_11(arg_16_0)
	end)

	local function var_16_6(arg_28_0, arg_28_1)
		if not arg_28_1.down then
			return
		end

		local var_28_0 = arg_28_1.button == "page_up"
		local var_28_1 = arg_28_1.button == "page_down"

		if var_28_0 then
			return var_0_12(arg_16_0)
		elseif var_28_1 then
			return var_0_11(arg_16_0)
		elseif arg_28_1.button == "home" then
			var_0_9(arg_16_0)

			return true
		end

		return false
	end

	arg_16_0:addEventHandler("gamepad_button", var_16_6)

	local var_16_7 = arg_16_0.Filter

	var_16_7:SetShadowUOffset(-0.001)
	var_16_7:SetShadowVOffset(-0.001)

	if Engine.ECHCFGDDDF() then
		local var_16_8 = LUI.UIElement.new({
			worldBlur = 5
		})

		var_16_8:setupWorldBlur()

		var_16_8.id = "blur"

		arg_16_0:addElement(var_16_8)
	end

	arg_16_0:addEventHandler("leaderboard_row_on_button_over", function(arg_29_0, arg_29_1)
		var_0_13(arg_29_0, arg_29_1.row)

		return true
	end)
	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_16_0, arg_16_1)
	arg_16_0:addAndCallEventHandler("update_input_type", function(arg_30_0, arg_30_1)
		if LUI.IsLastInputKeyboardMouse(arg_30_0._controllerIndex) then
			ACTIONS.AnimateSequence(arg_30_0, "KBM")
		else
			ACTIONS.AnimateSequence(arg_30_0, "Gamepad")
		end
	end)
	arg_16_0.Scrollbar.sliderArea.fixedSizeSlider:addEventHandler("leftmouseup", function(arg_31_0, arg_31_1)
		arg_16_0.LeaderboardContent:PositionChanged()
	end)
	arg_16_0.LeaderboardContent:addEventHandler("gamepad_button", function(arg_32_0, arg_32_1)
		if arg_32_1.qualifier == "mousewheel" then
			arg_32_0:PositionChanged()
		end
	end)
	ACTIONS.ScaleFullscreen(arg_16_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_16_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_16_0, arg_16_1)
	arg_16_0.LeaderboardContent:SetScrollbarKBMStyle(false)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_16_0)
	end
end

function LeaderboardMenu(arg_33_0, arg_33_1)
	local var_33_0 = LUI.UIElement.new()

	var_33_0.id = "LeaderboardMenu"
	var_33_0._animationSets = var_33_0._animationSets or {}
	var_33_0._sequences = var_33_0._sequences or {}

	local var_33_1 = arg_33_1 and arg_33_1.controllerIndex

	if not var_33_1 and not Engine.DDJFBBJAIG() then
		var_33_1 = var_33_0:getRootController()
	end

	assert(var_33_1)

	local var_33_2 = var_33_0
	local var_33_3
	local var_33_4 = {
		worldBlur = 1,
		controllerIndex = var_33_1
	}
	local var_33_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_33_4)

	var_33_5.id = "WorldBlur"

	var_33_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * 3)
	var_33_0:addElement(var_33_5)

	var_33_0.WorldBlur = var_33_5

	local var_33_6
	local var_33_7 = LUI.UIImage.new()

	var_33_7.id = "Darken"

	var_33_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_33_7:SetAlpha(0.5, 0)
	var_33_0:addElement(var_33_7)

	var_33_0.Darken = var_33_7

	local var_33_8
	local var_33_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_33_1
	})

	var_33_9.id = "Vignette"

	var_33_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_33_0:addElement(var_33_9)

	var_33_0.Vignette = var_33_9

	local var_33_10
	local var_33_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_33_1
	})

	var_33_11.id = "TabBacker"

	var_33_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_33_0:addElement(var_33_11)

	var_33_0.TabBacker = var_33_11

	local var_33_12
	local var_33_13 = MenuBuilder.BuildRegisteredType("LeaderboardRow", {
		controllerIndex = var_33_1
	})

	var_33_13.id = "PlayerRow"

	var_33_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1196, _1080p * 953, _1080p * 991)
	var_33_0:addElement(var_33_13)

	var_33_0.PlayerRow = var_33_13

	local var_33_14
	local var_33_15 = LUI.UIStyledText.new()

	var_33_15.id = "Filter"

	var_33_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_33_15:setText("", 0)
	var_33_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_33_15:SetWordWrap(false)
	var_33_15:SetAlignment(LUI.Alignment.Right)
	var_33_15:SetTintFontIcons(true)
	var_33_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_33_15:SetStartupDelay(2000)
	var_33_15:SetLineHoldTime(400)
	var_33_15:SetAnimMoveTime(2000)
	var_33_15:SetAnimMoveSpeed(150)
	var_33_15:SetEndDelay(2000)
	var_33_15:SetCrossfadeTime(250)
	var_33_15:SetFadeInTime(300)
	var_33_15:SetFadeOutTime(300)
	var_33_15:SetMaxVisibleLines(1)
	var_33_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 857, _1080p * 1196, _1080p * 174, _1080p * 198)
	var_33_0:addElement(var_33_15)

	var_33_0.Filter = var_33_15

	local var_33_16
	local var_33_17 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_33_1
	})

	var_33_17.id = "ButtonHelperBar"

	var_33_17:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1920, _1080p * -85, 0)
	var_33_0:addElement(var_33_17)

	var_33_0.ButtonHelperBar = var_33_17

	local var_33_18
	local var_33_19 = MenuBuilder.BuildRegisteredType("LeaderboardHeaderRow", {
		controllerIndex = var_33_1
	})

	var_33_19.id = "HeaderRow"

	var_33_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1196, _1080p * 206, _1080p * 236)
	var_33_0:addElement(var_33_19)

	var_33_0.HeaderRow = var_33_19

	local var_33_20
	local var_33_21 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 20,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 5,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 3,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_33_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LeaderboardRowButton", {
				controllerIndex = var_33_1
			})
		end,
		refreshChild = function(arg_35_0, arg_35_1, arg_35_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 1100,
		rowHeight = _1080p * 30,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_33_22 = LUI.UIGrid.new(var_33_21)

	var_33_22.id = "LeaderboardContent"

	var_33_22:setUseStencil(true)
	var_33_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1200, _1080p * 236, _1080p * 912)
	var_33_0:addElement(var_33_22)

	var_33_0.LeaderboardContent = var_33_22

	local var_33_23
	local var_33_24 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_33_1
	})

	var_33_24.id = "MenuTitle"

	var_33_24.MenuTitle:setText("", 0)
	var_33_24.Line:SetLeft(0, 0)
	var_33_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_33_0:addElement(var_33_24)

	var_33_0.MenuTitle = var_33_24

	local var_33_25
	local var_33_26 = MenuBuilder.BuildRegisteredType("LeaderboardPlayerCard", {
		controllerIndex = var_33_1
	})

	var_33_26.id = "LeaderboardPlayerCard"

	var_33_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1316, _1080p * 1824, _1080p * 201, _1080p * 551)
	var_33_0:addElement(var_33_26)

	var_33_0.LeaderboardPlayerCard = var_33_26

	local var_33_27
	local var_33_28 = LUI.UIStyledText.new()

	var_33_28.id = "HardcoreText"

	var_33_28:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_33_28:setText(Engine.CBBHFCGDIC("LUA_MENU/HARDCORE_CAPS"), 0)
	var_33_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_33_28:SetAlignment(LUI.Alignment.Left)
	var_33_28:SetShadowMinDistance(-0.2, 0)
	var_33_28:SetShadowMaxDistance(0.2, 0)
	var_33_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 747, _1080p * 106, _1080p * 142)
	var_33_0:addElement(var_33_28)

	var_33_0.HardcoreText = var_33_28

	local var_33_29
	local var_33_30 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_33_1
	})

	var_33_30.id = "Scrollbar"

	var_33_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1205, _1080p * 1215, _1080p * 236, _1080p * 912)
	var_33_0:addElement(var_33_30)

	var_33_0.Scrollbar = var_33_30

	local var_33_31
	local var_33_32 = LUI.UIImage.new()

	var_33_32.id = "Line"

	var_33_32:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_33_32:SetAlpha(0.4, 0)
	var_33_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1196, _1080p * 200, _1080p * 201)
	var_33_0:addElement(var_33_32)

	var_33_0.Line = var_33_32

	local var_33_33
	local var_33_34 = LUI.UIStyledText.new()

	var_33_34.id = "TopPrompt"

	var_33_34:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_33_34:setText(Engine.CBBHFCGDIC("LUA_MENU/TOP"), 0)
	var_33_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_33_34:SetWordWrap(false)
	var_33_34:SetAlignment(LUI.Alignment.Left)
	var_33_34:SetTintFontIcons(true)
	var_33_34:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_33_34:SetStartupDelay(2000)
	var_33_34:SetLineHoldTime(400)
	var_33_34:SetAnimMoveTime(2000)
	var_33_34:SetAnimMoveSpeed(150)
	var_33_34:SetEndDelay(2000)
	var_33_34:SetCrossfadeTime(250)
	var_33_34:SetFadeInTime(300)
	var_33_34:SetFadeOutTime(300)
	var_33_34:SetMaxVisibleLines(1)
	var_33_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 321, _1080p * 174, _1080p * 198)
	var_33_0:addElement(var_33_34)

	var_33_0.TopPrompt = var_33_34

	local var_33_35
	local var_33_36 = LUI.UIStyledText.new()

	var_33_36.id = "PageUpPrompt"

	var_33_36:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_33_36:setText(Engine.CBBHFCGDIC("LUA_MENU/PAGE_UP"), 0)
	var_33_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_33_36:SetWordWrap(false)
	var_33_36:SetAlignment(LUI.Alignment.Left)
	var_33_36:SetTintFontIcons(true)
	var_33_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_33_36:SetStartupDelay(2000)
	var_33_36:SetLineHoldTime(400)
	var_33_36:SetAnimMoveTime(2000)
	var_33_36:SetAnimMoveSpeed(150)
	var_33_36:SetEndDelay(2000)
	var_33_36:SetCrossfadeTime(250)
	var_33_36:SetFadeInTime(300)
	var_33_36:SetFadeOutTime(300)
	var_33_36:SetMaxVisibleLines(1)
	var_33_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 352, _1080p * 577, _1080p * 174, _1080p * 198)
	var_33_0:addElement(var_33_36)

	var_33_0.PageUpPrompt = var_33_36

	local var_33_37
	local var_33_38 = LUI.UIStyledText.new()

	var_33_38.id = "PageDownPrompt"

	var_33_38:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_33_38:setText(Engine.CBBHFCGDIC("LUA_MENU/PAGE_DOWN"), 0)
	var_33_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_33_38:SetWordWrap(false)
	var_33_38:SetAlignment(LUI.Alignment.Left)
	var_33_38:SetTintFontIcons(true)
	var_33_38:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_33_38:SetStartupDelay(2000)
	var_33_38:SetLineHoldTime(400)
	var_33_38:SetAnimMoveTime(2000)
	var_33_38:SetAnimMoveSpeed(150)
	var_33_38:SetEndDelay(2000)
	var_33_38:SetCrossfadeTime(250)
	var_33_38:SetFadeInTime(300)
	var_33_38:SetFadeOutTime(300)
	var_33_38:SetMaxVisibleLines(1)
	var_33_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 621, _1080p * 846, _1080p * 174, _1080p * 198)
	var_33_0:addElement(var_33_38)

	var_33_0.PageDownPrompt = var_33_38

	local var_33_39
	local var_33_40 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_33_1
	})

	var_33_40.id = "LobbyMembersFooter"

	var_33_40:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_33_0:addElement(var_33_40)

	var_33_0.LobbyMembersFooter = var_33_40

	local function var_33_41()
		return
	end

	var_33_0._sequences.DefaultSequence = var_33_41

	local var_33_42
	local var_33_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/TOP_KBM")
		}
	}

	var_33_34:RegisterAnimationSequence("KBM", var_33_43)

	local var_33_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_33_36:RegisterAnimationSequence("KBM", var_33_44)

	local var_33_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_33_38:RegisterAnimationSequence("KBM", var_33_45)

	local function var_33_46()
		var_33_34:AnimateSequence("KBM")
		var_33_36:AnimateSequence("KBM")
		var_33_38:AnimateSequence("KBM")
	end

	var_33_0._sequences.KBM = var_33_46

	local var_33_47
	local var_33_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/TOP")
		}
	}

	var_33_34:RegisterAnimationSequence("Gamepad", var_33_48)

	local var_33_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_33_36:RegisterAnimationSequence("Gamepad", var_33_49)

	local var_33_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_33_38:RegisterAnimationSequence("Gamepad", var_33_50)

	local function var_33_51()
		var_33_34:AnimateSequence("Gamepad")
		var_33_36:AnimateSequence("Gamepad")
		var_33_38:AnimateSequence("Gamepad")
	end

	var_33_0._sequences.Gamepad = var_33_51

	local var_33_52 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_33_30,
		startCap = var_33_30.startCap,
		endCap = var_33_30.endCap,
		sliderArea = var_33_30.sliderArea,
		slider = var_33_30.sliderArea and var_33_30.sliderArea.slider,
		fixedSizeSlider = var_33_30.sliderArea and var_33_30.sliderArea.fixedSizeSlider
	})

	var_33_22:AddScrollbar(var_33_52)

	function var_33_0.addButtonHelperFunction(arg_39_0, arg_39_1)
		arg_39_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	var_33_0:addEventHandler("menu_create", var_33_0.addButtonHelperFunction)

	local var_33_53 = LUI.UIBindButton.new()

	var_33_53.id = "selfBindButton"

	var_33_0:addElement(var_33_53)

	var_33_0.bindButton = var_33_53

	var_33_0.bindButton:addEventHandler("button_secondary", function(arg_40_0, arg_40_1)
		if not arg_40_1.controller then
			local var_40_0 = var_33_1
		end

		ACTIONS.LeaveMenu(var_33_0)
	end)
	var_0_14(var_33_0, var_33_1, arg_33_1)

	return var_33_0
end

MenuBuilder.registerType("LeaderboardMenu", LeaderboardMenu)
LockTable(_M)
