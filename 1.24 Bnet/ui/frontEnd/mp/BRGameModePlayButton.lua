module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.categoryDataSource = arg_1_2

	arg_1_0.PlaylistGrid:SetGridDataSource(arg_1_2.playlists)

	arg_1_0.isNewPlaylist = PlaylistUtils.ContainsNewPlaylist(arg_1_1, arg_1_2)

	arg_1_0.BRPlaylistButton:SetNew(arg_1_0.isNewPlaylist)
	arg_1_0.BRPlaylistButton:UpdateBreadcrumb()
	arg_1_0.BRPlaylistButton.CategoryName:setText(ToUpperCase(arg_1_2.name:GetValue(arg_1_1)))

	local function var_1_0()
		arg_1_0._gridIsFocused = true

		arg_1_0.BRPlaylistButton:ForceButtonOver()
		arg_1_0.BRPlaylistButton.Background:ForceHighlightOnly()
		ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	end

	arg_1_0.PlaylistGrid._onNewTargetFocusPosition = var_1_0
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_0

	local function var_3_0(arg_4_0, arg_4_1)
		if not arg_4_1.mouse then
			arg_3_0:processEvent({
				name = "lose_focus"
			})
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
			arg_4_0.PlaylistGrid:processEvent({
				name = "gain_focus"
			})

			arg_4_0._gridIsFocused = true
		else
			arg_4_0._gridIsFocused = false
		end

		return true
	end

	arg_3_0:registerEventHandler("button_action", var_3_0)
	arg_3_0:registerEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not LUI.IsLastInputMouseNavigation(arg_3_1) then
			arg_5_0.BRPlaylistButton:processEvent({
				name = "gain_focus"
			})
		end

		return true
	end)
	arg_3_0.BRPlaylistButton:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if LUI.IsLastInputMouseNavigation(arg_3_1) and not arg_3_0._gridIsFocused then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.kbmSlide)
			ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")

			arg_3_0._gridIsFocused = true
		end
	end)
	arg_3_0.BRPlaylistButton:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if LUI.IsLastInputMouseNavigation(arg_3_1) and arg_3_0._gridIsFocused then
			arg_3_0.BRPlaylistButton:ForceButtonOver()
			arg_3_0.BRPlaylistButton.Background:ForceHighlightOnly()
		end
	end)
	arg_3_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")

		arg_3_0._gridIsFocused = false
	end)

	arg_3_0.bindButton = LUI.UIBindButton.new()
	arg_3_0.bindButton.id = "bindButton"

	arg_3_0:addElement(arg_3_0.bindButton)
	arg_3_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if arg_3_0._gridIsFocused or arg_3_0.PlaylistGrid:GetFocusPosition() then
			arg_3_0.PlaylistGrid:processEvent({
				name = "lose_focus"
			})
			arg_3_0:processEvent({
				name = "gain_focus"
			})

			arg_3_0._gridIsFocused = false

			ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")

			return true
		end

		return false
	end)
	arg_3_0:SubscribeToModelThroughElement(arg_3_0, "desc", function()
		assert(arg_3_0.Description)

		local var_10_0 = arg_3_0:GetDataSource().desc:GetValue(arg_3_1)

		if var_10_0 and #var_10_0 > 0 then
			arg_3_0.BRPlaylistButton.Description:setText(var_10_0)
		end
	end)
end

function BRGameModePlayButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 743 * _1080p, 0, 130 * _1080p)

	var_11_0.id = "BRGameModePlayButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 4,
		buildArrowsLabel = false,
		wrapX = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PlaylistButtonSmall", {
				controllerIndex = var_11_1
			})
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 312,
		rowHeight = _1080p * 30,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_5 = LUI.UIDataSourceGrid.new(var_11_4)

	var_11_5.id = "PlaylistGrid"

	var_11_5:SetAlpha(0, 0)
	var_11_5:setUseStencil(true)
	var_11_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 312, 0, _1080p * 167)
	var_11_0:addElement(var_11_5)

	var_11_0.PlaylistGrid = var_11_5

	local var_11_6
	local var_11_7 = MenuBuilder.BuildRegisteredType("BRPlaylistButton", {
		controllerIndex = var_11_1
	})

	var_11_7.id = "BRPlaylistButton"

	var_11_7.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 430, 0, 0)

	local function var_11_8()
		local var_13_0 = var_11_0:GetDataSource().DataSources.frontEnd.MP.playlist.desc:GetValue(var_11_1)

		if var_13_0 ~= nil then
			var_11_7.Description:setText(var_13_0, 0)
		end
	end

	var_11_7:SubscribeToModelThroughElement(var_11_0, "DataSources.frontEnd.MP.playlist.desc", var_11_8)
	var_11_0:addElement(var_11_7)

	var_11_0.BRPlaylistButton = var_11_7

	local function var_11_9()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_9

	local var_11_10
	local var_11_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 443
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 755
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_5:RegisterAnimationSequence("ButtonOver", var_11_11)

	local function var_11_12()
		var_11_5:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_12

	local var_11_13
	local var_11_14 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 312
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_5:RegisterAnimationSequence("ButtonUp", var_11_14)

	local function var_11_15()
		var_11_5:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_15

	local var_11_16
	local var_11_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 300
		}
	}

	var_11_5:RegisterAnimationSequence("Disabled", var_11_17)

	local function var_11_18()
		var_11_5:AnimateSequence("Disabled")
	end

	var_11_0._sequences.Disabled = var_11_18

	var_0_1(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("BRGameModePlayButton", BRGameModePlayButton)
LockTable(_M)
