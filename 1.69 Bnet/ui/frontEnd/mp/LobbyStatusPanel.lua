module(..., package.seeall)

local var_0_0 = 200 * _1080p

local function var_0_1(arg_1_0)
	arg_1_0.GameModes:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.GameModes:GetContentIndex(arg_2_1, arg_2_2) + 1

		if var_2_0 <= #arg_1_0._gameModes then
			local var_2_1 = arg_1_0._gameModes[var_2_0]

			if not var_2_1 or not (#var_2_1 > 0) then
				var_2_1 = "placeholder_x"
			end

			arg_2_0:SetAlpha(1)
			arg_2_0.Image:setImage(RegisterMaterial(var_2_1))
		else
			arg_2_0:SetAlpha(0)
		end
	end)

	local var_1_0 = math.ceil(#arg_1_0._gameModes / arg_1_0.GameModes:GetNumColumns())
	local var_1_1 = arg_1_0.GameModes:GetCurrentAnchorsAndPositions().top
	local var_1_2 = 10 * _1080p
	local var_1_3 = arg_1_0.GameModes:GetRowHeight() + arg_1_0.GameModes:GetSpacingY()

	arg_1_0:SetAlpha(1)
	arg_1_0.GameModesBacker:SetBottom(var_1_1 + var_1_3 * var_1_0 + var_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "ShowHighlight")
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))
	local var_3_1 = PlaylistUtils.FindPlaylistDataSourceFromID(arg_3_1, var_3_0)

	if var_3_1 then
		ACTIONS.AnimateSequence(arg_3_0, "SinglePlaylist")

		local var_3_2 = var_3_1.image:GetValue(arg_3_1)
		local var_3_3 = var_3_1.name:GetValue(arg_3_1)

		if var_3_2 and #var_3_2 > 0 then
			arg_3_0.SinglePlaylistMode:setImage(RegisterMaterial(var_3_2))
			arg_3_0.Title:setText(ToUpperCase(var_3_3))
			arg_3_0:SetAlpha(1)
		end
	end

	ACTIONS.AnimateSequence(arg_3_0, "ShowHighlight")
end

local function var_0_3(arg_4_0)
	arg_4_0:registerEventHandler("self_using_gamepad_update", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.usingGamepad ~= true

		arg_5_0.SelectedInput:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("LUA_MENU/SELECTED_INPUT", var_5_0 and "LUA_MENU/KEYBOARD_AND_MOUSE" or "LUA_MENU/GAMEPAD")))
	end)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._gameModes = {}

	arg_6_0:SetAlpha(0)
	arg_6_0.GameModes:SetNumRows(3)
	arg_6_0.GameModes:SetNumColumns(6)
	var_0_3(arg_6_0)

	if CONDITIONS.IsMagmaGameMode(arg_6_0) then
		ACTIONS.AnimateSequence(arg_6_0, "WZSetup")
	end

	local var_6_0 = Dvar.CFHDGABACF("LSMOOSQMRP")

	if Playlist.FAHJDGFJI(var_6_0) and not Playlist.DDIDBIIJIF(var_6_0) and not Playlist.BICHEFEAHB(var_6_0) then
		ACTIONS.AnimateSequence(arg_6_0, "QuickPlay")

		local var_6_1 = PlaylistUtils.GetPublicPlaylistDatasources()
		local var_6_2 = var_6_1:GetCountValue(arg_6_1) - 1

		for iter_6_0 = 0, var_6_2 do
			local var_6_3 = var_6_1:GetDataSourceAtIndex(iter_6_0)

			if var_6_3.index:GetValue(arg_6_1) == var_6_0 then
				arg_6_0.CurrentFilter:setText(var_6_3.name:GetValue(arg_6_1))

				arg_6_0._gameModes = PlaylistUtils.GetFilteredGameModeIcons(arg_6_1, var_6_3)

				break
			end
		end

		arg_6_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/QUICK_PLAY")))
		var_0_1(arg_6_0)

		return
	else
		local var_6_4 = PlaylistUtils.GetPublicPlaylistDatasources()
		local var_6_5 = var_6_4:GetCountValue(arg_6_1) - 1

		for iter_6_1 = 0, var_6_5 do
			local var_6_6 = var_6_4:GetDataSourceAtIndex(iter_6_1)

			if var_6_6.index:GetValue(arg_6_1) == var_6_0 then
				local var_6_7 = var_6_6.playlists

				if Playlist.BICHEFEAHB(var_6_0) then
					ACTIONS.AnimateSequence(arg_6_0, "QuickPlay")

					local var_6_8 = {}
					local var_6_9 = var_6_7:GetCountValue(arg_6_1)

					for iter_6_2 = 0, var_6_9 do
						local var_6_10, var_6_11 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_6_7, iter_6_2)

						if var_6_10 and var_6_11 then
							local var_6_12 = var_6_7:GetDataSourceAtIndex(iter_6_2).image:GetValue(arg_6_1)

							if not var_6_8[var_6_12] then
								var_6_8[var_6_12] = true

								table.insert(arg_6_0._gameModes, var_6_12)
							end
						end
					end

					arg_6_0.Title:setText(ToUpperCase(var_6_6.name:GetValue(arg_6_1)))
					var_0_1(arg_6_0)

					return
				else
					var_0_2(arg_6_0, arg_6_1)

					return
				end
			end
		end
	end

	var_0_2(arg_6_0, arg_6_1)
end

function LobbyStatusPanel(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 603 * _1080p)

	var_7_0.id = "LobbyStatusPanel"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "ModeBacker"

	var_7_4:SetAlpha(0.5, 0)
	var_7_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 283)
	var_7_0:addElement(var_7_4)

	var_7_0.ModeBacker = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GameModesBacker"

	var_7_6:SetAlpha(0.5, 0)
	var_7_6.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 303, _1080p * 603)
	var_7_0:addElement(var_7_6)

	var_7_0.GameModesBacker = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "GameModesHeader"

	var_7_8.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECTED_GAME_MODES"), 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 313, _1080p * 353)
	var_7_0:addElement(var_7_8)

	var_7_0.GameModesHeader = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "CurrentFilter"

	var_7_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_7_10:setText("", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 481, _1080p * 68, _1080p * 92)
	var_7_0:addElement(var_7_10)

	var_7_0.CurrentFilter = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "LobbyStatus"

	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 481, _1080p * 103, _1080p * 221)
	var_7_0:addElement(var_7_12)

	var_7_0.LobbyStatus = var_7_12

	local var_7_13
	local var_7_14 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 6,
		maxVisibleRows = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameModeIcon", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 64,
		rowHeight = _1080p * 64,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_15 = LUI.UIGrid.new(var_7_14)

	var_7_15.id = "GameModes"

	var_7_15:setUseStencil(true)
	var_7_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 33, _1080p * 467, _1080p * 372, _1080p * 588)
	var_7_0:addElement(var_7_15)

	var_7_0.GameModes = var_7_15

	local var_7_16
	local var_7_17 = LUI.UIImage.new()

	var_7_17.id = "SinglePlaylistMode"

	var_7_17:SetAlpha(0, 0)
	var_7_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 179, _1080p * 321, _1080p * 80, _1080p * 222)
	var_7_0:addElement(var_7_17)

	var_7_0.SinglePlaylistMode = var_7_17

	local var_7_18
	local var_7_19 = LUI.UIImage.new()

	var_7_19.id = "Divider"

	var_7_19:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_7_19:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_7_19:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -546, _1080p * -545)
	var_7_0:addElement(var_7_19)

	var_7_0.Divider = var_7_19

	local var_7_20
	local var_7_21 = LUI.UIStyledText.new()

	var_7_21.id = "Title"

	var_7_21:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_7_21:setText("", 0)
	var_7_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_21:SetAlignment(LUI.Alignment.Center)
	var_7_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_21:SetStartupDelay(2000)
	var_7_21:SetLineHoldTime(400)
	var_7_21:SetAnimMoveTime(2000)
	var_7_21:SetAnimMoveSpeed(150)
	var_7_21:SetEndDelay(2000)
	var_7_21:SetCrossfadeTime(250)
	var_7_21:SetFadeInTime(300)
	var_7_21:SetFadeOutTime(300)
	var_7_21:SetMaxVisibleLines(1)
	var_7_21:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 19, _1080p * -19, _1080p * 16, _1080p * 52)
	var_7_0:addElement(var_7_21)

	var_7_0.Title = var_7_21

	local var_7_22
	local var_7_23 = LUI.UIStyledText.new()

	var_7_23.id = "SelectedInput"

	var_7_23:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_7_23:setText("", 0)
	var_7_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_23:SetAlignment(LUI.Alignment.Center)
	var_7_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 481, _1080p * 230, _1080p * 254)
	var_7_0:addElement(var_7_23)

	var_7_0.SelectedInput = var_7_23

	local var_7_24
	local var_7_25 = LUI.UIImage.new()

	var_7_25.id = "Highlight"

	var_7_25:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_25:SetAlpha(0.5, 0)
	var_7_25:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_7_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 250, _1080p * 250, _1080p * 11, _1080p * 57)
	var_7_0:addElement(var_7_25)

	var_7_0.Highlight = var_7_25

	local function var_7_26()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_26

	local var_7_27
	local var_7_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_challenge"),
			child = var_7_0.ModeBacker.WZWipPromptBackground
		}
	}

	var_7_4:RegisterAnimationSequence("SinglePlaylist", var_7_28)

	local var_7_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("SinglePlaylist", var_7_29)

	local var_7_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("SinglePlaylist", var_7_30)

	local var_7_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("SinglePlaylist", var_7_31)

	local var_7_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 347
		}
	}

	var_7_12:RegisterAnimationSequence("SinglePlaylist", var_7_32)

	local var_7_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("SinglePlaylist", var_7_33)

	local var_7_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("SinglePlaylist", var_7_34)

	local var_7_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 357
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 381
		}
	}

	var_7_23:RegisterAnimationSequence("SinglePlaylist", var_7_35)

	local function var_7_36()
		var_7_4:AnimateSequence("SinglePlaylist")
		var_7_6:AnimateSequence("SinglePlaylist")
		var_7_8:AnimateSequence("SinglePlaylist")
		var_7_10:AnimateSequence("SinglePlaylist")
		var_7_12:AnimateSequence("SinglePlaylist")
		var_7_15:AnimateSequence("SinglePlaylist")
		var_7_17:AnimateSequence("SinglePlaylist")
		var_7_23:AnimateSequence("SinglePlaylist")
	end

	var_7_0._sequences.SinglePlaylist = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 283
		}
	}

	var_7_4:RegisterAnimationSequence("QuickPlay", var_7_38)

	local var_7_39 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("QuickPlay", var_7_39)

	local var_7_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("QuickPlay", var_7_40)

	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("QuickPlay", var_7_41)

	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 221
		}
	}

	var_7_12:RegisterAnimationSequence("QuickPlay", var_7_42)

	local var_7_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_15:RegisterAnimationSequence("QuickPlay", var_7_43)

	local var_7_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_17:RegisterAnimationSequence("QuickPlay", var_7_44)

	local var_7_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 254
		}
	}

	var_7_23:RegisterAnimationSequence("QuickPlay", var_7_45)

	local function var_7_46()
		var_7_4:AnimateSequence("QuickPlay")
		var_7_6:AnimateSequence("QuickPlay")
		var_7_8:AnimateSequence("QuickPlay")
		var_7_10:AnimateSequence("QuickPlay")
		var_7_12:AnimateSequence("QuickPlay")
		var_7_15:AnimateSequence("QuickPlay")
		var_7_17:AnimateSequence("QuickPlay")
		var_7_23:AnimateSequence("QuickPlay")
	end

	var_7_0._sequences.QuickPlay = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_challenge"),
			child = var_7_0.ModeBacker.WZWipPromptBackground
		}
	}

	var_7_4:RegisterAnimationSequence("WZSetup", var_7_48)

	local var_7_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_7_0.GameModesHeader.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator,
			child = var_7_0.GameModesHeader.Divider
		}
	}

	var_7_8:RegisterAnimationSequence("WZSetup", var_7_49)

	local var_7_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_7_10:RegisterAnimationSequence("WZSetup", var_7_50)

	local var_7_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_7_19:RegisterAnimationSequence("WZSetup", var_7_51)

	local var_7_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_7_21:RegisterAnimationSequence("WZSetup", var_7_52)

	local var_7_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_7_23:RegisterAnimationSequence("WZSetup", var_7_53)

	local var_7_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_7_25:RegisterAnimationSequence("WZSetup", var_7_54)

	local function var_7_55()
		var_7_4:AnimateSequence("WZSetup")
		var_7_8:AnimateSequence("WZSetup")
		var_7_10:AnimateSequence("WZSetup")
		var_7_19:AnimateSequence("WZSetup")
		var_7_21:AnimateSequence("WZSetup")
		var_7_23:AnimateSequence("WZSetup")
		var_7_25:AnimateSequence("WZSetup")
	end

	var_7_0._sequences.WZSetup = var_7_55

	local var_7_56
	local var_7_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 500
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_7_25:RegisterAnimationSequence("ShowHighlight", var_7_57)

	local function var_7_58()
		var_7_25:AnimateSequence("ShowHighlight")
	end

	var_7_0._sequences.ShowHighlight = var_7_58

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LobbyStatusPanel", LobbyStatusPanel)
LockTable(_M)
