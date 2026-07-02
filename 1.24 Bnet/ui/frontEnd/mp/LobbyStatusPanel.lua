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
	local var_4_0 = Engine.BBDCAFEGDJ() == 1

	if var_4_0 then
		arg_4_0.InputIcon:setImage(RegisterMaterial("icon_platform_controller"))
	else
		arg_4_0.InputIcon:setImage(RegisterMaterial("icon_platform_mousekeyboard"))
	end

	arg_4_0.SelectedInput:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECTED_INPUT", var_4_0 and "LUA_MENU/GAMEPAD" or "LUA_MENU/KEYBOARD_AND_MOUSE"))

	local var_4_1 = LAYOUT.GetTextWidth(arg_4_0.SelectedInput)
	local var_4_2 = LAYOUT.GetElementWidth(arg_4_0.InputIcon)
	local var_4_3 = var_4_1 / 2 + 10 * _1080p

	if var_4_3 > var_0_0 then
		var_4_3 = var_0_0
	end

	arg_4_0.InputIcon:SetLeft(var_4_3)
	arg_4_0.InputIcon:SetRight(var_4_3 + var_4_2)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._gameModes = {}

	arg_5_0:SetAlpha(0)
	arg_5_0.GameModes:SetNumRows(3)
	arg_5_0.GameModes:SetNumColumns(6)
	var_0_3(arg_5_0)

	if CONDITIONS.IsMagmaGameMode(arg_5_0) then
		ACTIONS.AnimateSequence(arg_5_0, "WZ")
	end

	local var_5_0 = Dvar.CFHDGABACF("LSMOOSQMRP")

	if Playlist.FAHJDGFJI(var_5_0) and not Playlist.DDIDBIIJIF(var_5_0) and not Playlist.BICHEFEAHB(var_5_0) then
		ACTIONS.AnimateSequence(arg_5_0, "QuickPlay")

		local var_5_1 = PlaylistUtils.GetPublicPlaylistDatasources()
		local var_5_2 = var_5_1:GetCountValue(arg_5_1) - 1

		for iter_5_0 = 0, var_5_2 do
			local var_5_3 = var_5_1:GetDataSourceAtIndex(iter_5_0)

			if var_5_3.index:GetValue(arg_5_1) == var_5_0 then
				arg_5_0.CurrentFilter:setText(var_5_3.name:GetValue(arg_5_1))

				arg_5_0._gameModes = PlaylistUtils.GetFilteredGameModeIcons(arg_5_1, var_5_3)

				break
			end
		end

		arg_5_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/QUICK_PLAY")))
		var_0_1(arg_5_0)

		return
	else
		local var_5_4 = PlaylistUtils.GetPublicPlaylistDatasources()
		local var_5_5 = var_5_4:GetCountValue(arg_5_1) - 1

		for iter_5_1 = 0, var_5_5 do
			local var_5_6 = var_5_4:GetDataSourceAtIndex(iter_5_1)

			if var_5_6.index:GetValue(arg_5_1) == var_5_0 then
				local var_5_7 = var_5_6.playlists

				if Playlist.BICHEFEAHB(var_5_0) then
					ACTIONS.AnimateSequence(arg_5_0, "QuickPlay")

					local var_5_8 = {}
					local var_5_9 = var_5_7:GetCountValue(arg_5_1)

					for iter_5_2 = 0, var_5_9 do
						local var_5_10, var_5_11 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_5_7, iter_5_2)

						if var_5_10 and var_5_11 then
							local var_5_12 = var_5_7:GetDataSourceAtIndex(iter_5_2).image:GetValue(arg_5_1)

							if not var_5_8[var_5_12] then
								var_5_8[var_5_12] = true

								table.insert(arg_5_0._gameModes, var_5_12)
							end
						end
					end

					arg_5_0.Title:setText(ToUpperCase(var_5_6.name:GetValue(arg_5_1)))
					var_0_1(arg_5_0)

					return
				else
					var_0_2(arg_5_0, arg_5_1)

					return
				end
			end
		end
	end

	var_0_2(arg_5_0, arg_5_1)
end

function LobbyStatusPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 603 * _1080p)

	var_6_0.id = "LobbyStatusPanel"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "ModeBacker"

	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 283)
	var_6_0:addElement(var_6_4)

	var_6_0.ModeBacker = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "GameModesBacker"

	var_6_6:SetAlpha(0.5, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 303, _1080p * 603)
	var_6_0:addElement(var_6_6)

	var_6_0.GameModesBacker = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "GameModesHeader"

	var_6_8.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECTED_GAME_MODES"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 313, _1080p * 353)
	var_6_0:addElement(var_6_8)

	var_6_0.GameModesHeader = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "CurrentFilter"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 481, _1080p * 68, _1080p * 92)
	var_6_0:addElement(var_6_10)

	var_6_0.CurrentFilter = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "LobbyStatus"

	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 481, _1080p * 103, _1080p * 221)
	var_6_0:addElement(var_6_12)

	var_6_0.LobbyStatus = var_6_12

	local var_6_13
	local var_6_14 = {
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
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameModeIcon", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 64,
		rowHeight = _1080p * 64,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_15 = LUI.UIGrid.new(var_6_14)

	var_6_15.id = "GameModes"

	var_6_15:setUseStencil(true)
	var_6_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 33, _1080p * 467, _1080p * 372, _1080p * 588)
	var_6_0:addElement(var_6_15)

	var_6_0.GameModes = var_6_15

	local var_6_16
	local var_6_17 = LUI.UIImage.new()

	var_6_17.id = "SinglePlaylistMode"

	var_6_17:SetAlpha(0, 0)
	var_6_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 179, _1080p * 321, _1080p * 80, _1080p * 222)
	var_6_0:addElement(var_6_17)

	var_6_0.SinglePlaylistMode = var_6_17

	local var_6_18
	local var_6_19 = LUI.UIImage.new()

	var_6_19.id = "Divider"

	var_6_19:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_6_19:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_6_19:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -546, _1080p * -545)
	var_6_0:addElement(var_6_19)

	var_6_0.Divider = var_6_19

	local var_6_20
	local var_6_21 = LUI.UIStyledText.new()

	var_6_21.id = "Title"

	var_6_21:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_6_21:setText("", 0)
	var_6_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_21:SetAlignment(LUI.Alignment.Center)
	var_6_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_21:SetStartupDelay(2000)
	var_6_21:SetLineHoldTime(400)
	var_6_21:SetAnimMoveTime(2000)
	var_6_21:SetAnimMoveSpeed(150)
	var_6_21:SetEndDelay(2000)
	var_6_21:SetCrossfadeTime(250)
	var_6_21:SetFadeInTime(300)
	var_6_21:SetFadeOutTime(300)
	var_6_21:SetMaxVisibleLines(1)
	var_6_21:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 19, _1080p * -19, _1080p * 17, _1080p * 53)
	var_6_0:addElement(var_6_21)

	var_6_0.Title = var_6_21

	local var_6_22
	local var_6_23 = LUI.UIStyledText.new()

	var_6_23.id = "SelectedInput"

	var_6_23:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_23:setText("", 0)
	var_6_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_23:SetAlignment(LUI.Alignment.Center)
	var_6_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -231, _1080p * 231, _1080p * 230, _1080p * 254)
	var_6_0:addElement(var_6_23)

	var_6_0.SelectedInput = var_6_23

	local var_6_24
	local var_6_25 = LUI.UIImage.new()

	var_6_25.id = "InputIcon"

	var_6_25:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_6_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 200, _1080p * 232, _1080p * 226, _1080p * 258)
	var_6_0:addElement(var_6_25)

	var_6_0.InputIcon = var_6_25

	local var_6_26
	local var_6_27 = LUI.UIImage.new()

	var_6_27.id = "Highlight"

	var_6_27:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_27:SetAlpha(0.5, 0)
	var_6_27:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_6_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 250, _1080p * 250, _1080p * 11, _1080p * 57)
	var_6_0:addElement(var_6_27)

	var_6_0.Highlight = var_6_27

	local function var_6_28()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_28

	local var_6_29
	local var_6_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406
		}
	}

	var_6_4:RegisterAnimationSequence("SinglePlaylist", var_6_30)

	local var_6_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("SinglePlaylist", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("SinglePlaylist", var_6_32)

	local var_6_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("SinglePlaylist", var_6_33)

	local var_6_34 = {
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

	var_6_12:RegisterAnimationSequence("SinglePlaylist", var_6_34)

	local var_6_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_15:RegisterAnimationSequence("SinglePlaylist", var_6_35)

	local var_6_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_17:RegisterAnimationSequence("SinglePlaylist", var_6_36)

	local var_6_37 = {
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

	var_6_23:RegisterAnimationSequence("SinglePlaylist", var_6_37)

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 353
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 385
		}
	}

	var_6_25:RegisterAnimationSequence("SinglePlaylist", var_6_38)

	local function var_6_39()
		var_6_4:AnimateSequence("SinglePlaylist")
		var_6_6:AnimateSequence("SinglePlaylist")
		var_6_8:AnimateSequence("SinglePlaylist")
		var_6_10:AnimateSequence("SinglePlaylist")
		var_6_12:AnimateSequence("SinglePlaylist")
		var_6_15:AnimateSequence("SinglePlaylist")
		var_6_17:AnimateSequence("SinglePlaylist")
		var_6_23:AnimateSequence("SinglePlaylist")
		var_6_25:AnimateSequence("SinglePlaylist")
	end

	var_6_0._sequences.SinglePlaylist = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 283
		}
	}

	var_6_4:RegisterAnimationSequence("QuickPlay", var_6_41)

	local var_6_42 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("QuickPlay", var_6_42)

	local var_6_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("QuickPlay", var_6_43)

	local var_6_44 = {
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

	var_6_10:RegisterAnimationSequence("QuickPlay", var_6_44)

	local var_6_45 = {
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

	var_6_12:RegisterAnimationSequence("QuickPlay", var_6_45)

	local var_6_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_15:RegisterAnimationSequence("QuickPlay", var_6_46)

	local var_6_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_17:RegisterAnimationSequence("QuickPlay", var_6_47)

	local var_6_48 = {
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

	var_6_23:RegisterAnimationSequence("QuickPlay", var_6_48)

	local var_6_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 258
		}
	}

	var_6_25:RegisterAnimationSequence("QuickPlay", var_6_49)

	local function var_6_50()
		var_6_4:AnimateSequence("QuickPlay")
		var_6_6:AnimateSequence("QuickPlay")
		var_6_8:AnimateSequence("QuickPlay")
		var_6_10:AnimateSequence("QuickPlay")
		var_6_12:AnimateSequence("QuickPlay")
		var_6_15:AnimateSequence("QuickPlay")
		var_6_17:AnimateSequence("QuickPlay")
		var_6_23:AnimateSequence("QuickPlay")
		var_6_25:AnimateSequence("QuickPlay")
	end

	var_6_0._sequences.QuickPlay = var_6_50

	local var_6_51
	local var_6_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_6_19:RegisterAnimationSequence("WZ", var_6_52)

	local var_6_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_6_21:RegisterAnimationSequence("WZ", var_6_53)

	local var_6_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_6_27:RegisterAnimationSequence("WZ", var_6_54)

	local function var_6_55()
		var_6_19:AnimateSequence("WZ")
		var_6_21:AnimateSequence("WZ")
		var_6_27:AnimateSequence("WZ")
	end

	var_6_0._sequences.WZ = var_6_55

	local var_6_56
	local var_6_57 = {
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

	var_6_27:RegisterAnimationSequence("ShowHighlight", var_6_57)

	local function var_6_58()
		var_6_27:AnimateSequence("ShowHighlight")
	end

	var_6_0._sequences.ShowHighlight = var_6_58

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LobbyStatusPanel", LobbyStatusPanel)
LockTable(_M)
