module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	arg_1_0:SetHandleMouse(true)
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
	arg_2_0:SetHandleMouse(false)
end

local function var_0_2(arg_3_0)
	if CONDITIONS.IsPSDoubleXPActive() then
		ACTIONS.AnimateSequence(arg_3_0.BRPlaylistButton, "ShowModifiers")
		ACTIONS.AnimateSequence(arg_3_0.BRPlaylistButton, "Modifiers")
	else
		ACTIONS.AnimateSequence(arg_3_0.BRPlaylistButton, "HideModifiers")
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2)

	arg_4_0.categoryDataSource = arg_4_2

	arg_4_0.PlaylistGrid:SetGridDataSource(arg_4_2.playlists)

	arg_4_0.isNewPlaylist = PlaylistUtils.ContainsNewPlaylist(arg_4_1, arg_4_2)

	arg_4_0.BRPlaylistButton:SetNew(arg_4_0.isNewPlaylist)
	arg_4_0.BRPlaylistButton:UpdateBreadcrumb()
	arg_4_0.BRPlaylistButton.GamemodeName:setText(ToUpperCase(arg_4_2.name:GetValue(arg_4_1)))
	arg_4_0.BRPlaylistButton.Description:setText(arg_4_2.desc:GetValue(arg_4_1))
	PlaylistUtils.UpdateBackgroundImage(arg_4_0.BRPlaylistButton.Background, arg_4_1, arg_4_2.image:GetValue(arg_4_1))

	local function var_4_0()
		arg_4_0._gridIsFocused = true

		arg_4_0.BRPlaylistButton:ForceButtonOver(arg_4_1, {
			ignoreFocus = true
		})
		arg_4_0.BRPlaylistButton.Background:ForceHighlightOnly()
		var_0_0(arg_4_0)
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH, 0, _1080p * PlaylistUtils.BUTTON_EXPAND_BOTTOM_SIZE, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)
	end

	arg_4_0.PlaylistGrid._onNewTargetFocusPosition = var_4_0

	PlaylistUtils.UpdatePlaylistRestrictionVisualsViaDataSource(arg_4_0, arg_4_1, {
		categoryDataSource = arg_4_2
	})

	local var_4_1 = arg_4_2.playlists:GetDataSourceAtIndex(0)

	if var_4_1 then
		PlaylistUtils.InitializePlaylistButton(arg_4_0.BRPlaylistButton, var_4_1, arg_4_1)

		local var_4_2 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()
		local var_4_3 = PlaylistUtils.isEarlyAccessLocked(button, var_4_1, arg_4_1)
		local var_4_4 = var_4_1.isForceLocked and var_4_1.isForceLocked:GetValue(arg_4_1)

		arg_4_0.BRPlaylistButton._isForceLocked = var_4_4

		local var_4_5 = var_4_2 or var_4_4 or var_4_3

		arg_4_0.BRPlaylistButton:SetButtonDisabled(var_4_5)
	end
end

local function var_0_4(arg_6_0)
	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.kbmSlide)
	var_0_0(arg_6_0)

	arg_6_0._gridIsFocused = true
end

local function var_0_5(arg_7_0)
	arg_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH, 0, _1080p * PlaylistUtils.BUTTON_COLLAPSE_BOTTOM_SIZE, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)
	var_0_1(arg_7_0)

	arg_7_0._gridIsFocused = false
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.Setup = var_0_3
	arg_8_0.OnButtonFocus = var_0_4
	arg_8_0.OnButtonLoseFocus = var_0_5
	arg_8_0.BRPlaylistButton._isCategoryButton = true

	local function var_8_0(arg_9_0, arg_9_1)
		if not arg_9_1.mouse then
			arg_8_0:processEvent({
				name = "lose_focus"
			})
			var_0_0(arg_9_0)
			arg_9_0.PlaylistGrid:processEvent({
				name = "gain_focus"
			})

			arg_9_0._gridIsFocused = true

			arg_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH, 0, _1080p * PlaylistUtils.BUTTON_EXPAND_BOTTOM_SIZE, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)
		else
			arg_9_0._gridIsFocused = false
		end

		return true
	end

	arg_8_0:registerEventHandler("button_action", var_8_0)
	arg_8_0:registerEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not LUI.IsLastInputMouseNavigation(arg_8_1) then
			arg_10_0.BRPlaylistButton:processEvent({
				name = "gain_focus"
			})
		end

		return true
	end)
	arg_8_0.MouseFocusArea:SetFocusable(true)
	arg_8_0.MouseFocusArea:registerEventHandler("button_over", function(arg_11_0, arg_11_1)
		arg_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH, 0, _1080p * PlaylistUtils.BUTTON_EXPAND_BOTTOM_SIZE, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)

		if LUI.IsLastInputMouseNavigation(arg_8_1) and not arg_8_0._gridIsFocused then
			arg_8_0:OnButtonFocus()
			arg_8_0.BRPlaylistButton:ForceButtonOver(arg_8_1)
		end
	end)
	arg_8_0.BRPlaylistButton:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		arg_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH, 0, _1080p * PlaylistUtils.BUTTON_EXPAND_BOTTOM_SIZE, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)

		if LUI.IsLastInputMouseNavigation(arg_8_1) and not arg_8_0._gridIsFocused then
			arg_8_0:OnButtonFocus()
		end
	end)
	arg_8_0.BRPlaylistButton:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if LUI.IsLastInputMouseNavigation(arg_8_1) then
			if arg_8_0._gridIsFocused then
				arg_8_0.BRPlaylistButton:ForceButtonOver(arg_8_1)
				arg_8_0.BRPlaylistButton.Background:ForceHighlightOnly()
			elseif not arg_8_0.handleMouseMove then
				arg_8_0:processEvent({
					name = "lose_focus"
				})
			end
		else
			arg_8_0:processEvent({
				name = "lose_focus"
			})
		end
	end)
	arg_8_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		var_0_5(arg_8_0)
	end)

	arg_8_0.bindButton = LUI.UIBindButton.new()
	arg_8_0.bindButton.id = "bindButton"

	arg_8_0:addElement(arg_8_0.bindButton)
	arg_8_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if arg_8_0._gridIsFocused or arg_8_0.PlaylistGrid:GetFocusPosition() then
			arg_8_0.PlaylistGrid:processEvent({
				name = "lose_focus"
			})
			arg_8_0:processEvent({
				name = "gain_focus"
			})

			arg_8_0._gridIsFocused = false

			var_0_1(arg_8_0)

			return true
		end

		return false
	end)
	arg_8_0:SubscribeToModelThroughElement(arg_8_0, "desc", function()
		assert(arg_8_0.Description)

		local var_16_0 = arg_8_0:GetDataSource().desc:GetValue(arg_8_1)

		if var_16_0 and #var_16_0 > 0 then
			arg_8_0.BRPlaylistButton.Description:setText(var_16_0)
		end
	end)
	arg_8_0:SetHandleMouse(false)
	var_0_2(arg_8_0)
end

function BRGameModePlayButton(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIButton.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 792 * _1080p, 0, 154 * _1080p)

	var_17_0.id = "BRGameModePlayButton"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0

	var_17_0:setUseStencil(true)

	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("EmptyFocusable", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "MouseFocusArea"

	var_17_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 445, _1080p * 754, _1080p * 7, _1080p * -45)
	var_17_0:addElement(var_17_4)

	var_17_0.MouseFocusArea = var_17_4

	local var_17_5
	local var_17_6 = {
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
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PlaylistButtonSmall", {
				controllerIndex = var_17_1
			})
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 332,
		rowHeight = _1080p * 30,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_7 = LUI.UIDataSourceGrid.new(var_17_6)

	var_17_7.id = "PlaylistGrid"

	var_17_7:SetAlpha(0, 0)
	var_17_7:setUseStencil(true)
	var_17_7:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 332, _1080p * 3, _1080p * -2)
	var_17_0:addElement(var_17_7)

	var_17_0.PlaylistGrid = var_17_7

	local var_17_8
	local var_17_9 = MenuBuilder.BuildRegisteredType("BRFeatureButton", {
		controllerIndex = var_17_1
	})

	var_17_9.id = "BRPlaylistButton"

	var_17_9.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_17_9:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 430, 0, 0)

	local function var_17_10()
		local var_19_0 = var_17_0:GetDataSource().DataSources.frontEnd.MP.playlist.desc:GetValue(var_17_1)

		if var_19_0 ~= nil then
			var_17_9.Description:setText(var_19_0, 0)
		end
	end

	var_17_9:SubscribeToModelThroughElement(var_17_0, "DataSources.frontEnd.MP.playlist.desc", var_17_10)
	var_17_0:addElement(var_17_9)

	var_17_0.BRPlaylistButton = var_17_9

	local var_17_11
	local var_17_12 = LUI.UIImage.new()

	var_17_12.id = "PlaylistRestrictionIcon"

	var_17_12:SetAlpha(0, 0)
	var_17_12:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_17_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 11, _1080p * 43, _1080p * -47, _1080p * -15)
	var_17_0:addElement(var_17_12)

	var_17_0.PlaylistRestrictionIcon = var_17_12

	local var_17_13
	local var_17_14 = LUI.UIImage.new()

	var_17_14.id = "PlaylistRestrictionHighlightBottomGlow"

	var_17_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_17_14:SetAlpha(0, 0)
	var_17_14:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_17_14:SetVMin(1, 0)
	var_17_14:SetVMax(0, 0)
	var_17_14:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -86, _1080p * -1)
	var_17_0:addElement(var_17_14)

	var_17_0.PlaylistRestrictionHighlightBottomGlow = var_17_14

	local var_17_15
	local var_17_16 = LUI.UIImage.new()

	var_17_16.id = "PlaylistRestrictionHighlightBottom"

	var_17_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_17_16:SetAlpha(0, 0)
	var_17_16:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_17_16:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -3, _1080p * -1)
	var_17_0:addElement(var_17_16)

	var_17_0.PlaylistRestrictionHighlightBottom = var_17_16

	local var_17_17
	local var_17_18 = LUI.UIImage.new()

	var_17_18.id = "PlaylistRestrictionHighlightTop"

	var_17_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_17_18:SetAlpha(0, 0)
	var_17_18:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_17_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 3, _1080p * 5)
	var_17_0:addElement(var_17_18)

	var_17_0.PlaylistRestrictionHighlightTop = var_17_18

	local function var_17_19()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_19

	local var_17_20
	local var_17_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		}
	}

	var_17_4:RegisterAnimationSequence("ButtonOver", var_17_21)

	local var_17_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 443
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 775
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_7:RegisterAnimationSequence("ButtonOver", var_17_22)

	local function var_17_23()
		var_17_4:AnimateSequence("ButtonOver")
		var_17_7:AnimateSequence("ButtonOver")
	end

	var_17_0._sequences.ButtonOver = var_17_23

	local var_17_24
	local var_17_25 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 332
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_7:RegisterAnimationSequence("ButtonUp", var_17_25)

	local function var_17_26()
		var_17_7:AnimateSequence("ButtonUp")
	end

	var_17_0._sequences.ButtonUp = var_17_26

	local var_17_27
	local var_17_28 = {
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
			value = _1080p * 332
		}
	}

	var_17_7:RegisterAnimationSequence("Disabled", var_17_28)

	local function var_17_29()
		var_17_7:AnimateSequence("Disabled")
	end

	var_17_0._sequences.Disabled = var_17_29

	local var_17_30
	local var_17_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_17_0.BRPlaylistButton.GamemodeName
		}
	}

	var_17_9:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_17_31)

	local var_17_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_17_12:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_17_32)

	local var_17_33 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_17_33)

	local var_17_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_17_16:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_17_34)

	local var_17_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_17_35)

	local function var_17_36()
		var_17_9:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_17_12:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_17_14:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_17_16:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_17_18:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_17_0._sequences.ModPlaylistRestrictionEnabled = var_17_36

	local var_17_37
	local var_17_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_17_0.BRPlaylistButton.GamemodeName
		}
	}

	var_17_9:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_17_38)

	local var_17_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_17_39)

	local var_17_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_17_40)

	local var_17_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_16:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_17_41)

	local var_17_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_17_42)

	local function var_17_43()
		var_17_9:AnimateSequence("ModPlaylistRestrictionOff")
		var_17_12:AnimateSequence("ModPlaylistRestrictionOff")
		var_17_14:AnimateSequence("ModPlaylistRestrictionOff")
		var_17_16:AnimateSequence("ModPlaylistRestrictionOff")
		var_17_18:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_17_0._sequences.ModPlaylistRestrictionOff = var_17_43

	local var_17_44
	local var_17_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_17_0.BRPlaylistButton.GamemodeName
		}
	}

	var_17_9:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_17_45)

	local var_17_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_17_12:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_17_46)

	local var_17_47 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_17_47)

	local var_17_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_17_16:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_17_48)

	local var_17_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_17_49)

	local function var_17_50()
		var_17_9:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_17_12:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_17_14:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_17_16:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_17_18:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_17_0._sequences.ModPlaylistRestrictionDisabled = var_17_50

	var_0_6(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("BRGameModePlayButton", BRGameModePlayButton)
LockTable(_M)
