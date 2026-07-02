module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = 36 * _1080p
	local var_1_1 = 55 * _1080p
	local var_1_2 = {
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon1
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon2
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon3
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon4
		}
	}

	local function var_1_3()
		for iter_2_0 = 1, #var_1_2 do
			if not var_1_2[iter_2_0].isUsed then
				var_1_2[iter_2_0].isUsed = true

				local var_2_0 = var_1_2[iter_2_0].icon

				var_2_0:SetAlpha(1)

				return var_2_0
			end
		end
	end

	local function var_1_4(arg_3_0, arg_3_1)
		if arg_3_0:GetValue(arg_1_0._controllerIndex) > 1 then
			var_1_3():setImage(RegisterMaterial(arg_3_1))
		end
	end

	local var_1_5 = arg_1_0:GetDataSource()

	if var_1_5 then
		var_1_4(var_1_5.xpScale, "icon_double_xp_mini")
		var_1_4(var_1_5.weaponXpScale, "icon_double_weapon_xp_mini")
		var_1_4(var_1_5.battlePassXpScale, "icon_double_battle_xp_mini")
		var_1_4(var_1_5.operatorXpScale, "icon_double_operator_xp_mini")
		PlaylistUtils.UpdatePlaylistRestrictionVisualsViaDataSource(arg_1_0, arg_1_0._controllerIndex, {
			playlistDataSource = var_1_5
		})
	end

	local var_1_6 = 0

	for iter_1_0 = 1, #var_1_2 do
		if var_1_2[iter_1_0].isUsed then
			var_1_6 = var_1_6 + 1
		end
	end

	local var_1_7 = var_1_1 + var_1_0 * var_1_6

	if not arg_1_0._textLayout then
		arg_1_0._textLayout = arg_1_0.Button.Text:GetCurrentAnchorsAndPositions()
	end

	if IsLanguageArabic() then
		arg_1_0.Button.Text:SetLeft(arg_1_0._textLayout.left + var_1_7)
	else
		arg_1_0.Button.Text:SetRight(arg_1_0._textLayout.right - var_1_7)
	end
end

local var_0_1 = {
	LOCKED_EARLY_ACCESS = 7,
	LOCKED_MAXPARTY = 3,
	LOCKED_NO_FILTERS_SET = 6,
	LOCKED_FORCE_LOCKED = 8,
	LOCKED_MINPARTY = 4,
	DEDI_REQUIRED = 5,
	UNLOCKED = 0,
	LOCKED_DLC_PARTY = 2,
	LOCKED_DLC_LOCAL = 1
}
local var_0_2 = 200

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:SetAlpha(1)

	if arg_4_2 == var_0_2 then
		return
	end

	local var_4_0, var_4_1 = Playlist.CGJBAEBBG(arg_4_1, arg_4_2)

	if var_4_0 == true and var_4_1 == false then
		arg_4_0:SetAlpha(0.25)
	end
end

local function var_0_4(arg_5_0)
	return function(arg_6_0, arg_6_1)
		assert(arg_5_0.Button)

		local var_6_0 = arg_5_0._controllerIndex
		local var_6_1 = arg_5_0:GetDataSource()
		local var_6_2 = var_6_1.playlistIndex:GetValue(arg_6_1.controller)
		local var_6_3 = var_6_1.categoryIndex:GetValue(arg_6_1.controller)
		local var_6_4 = Playlist.DCFCIFABGH(var_6_3, var_6_2)

		if var_6_4 == var_0_1.LOCKED_DLC_LOCAL then
			STORE.GoToStore(arg_6_1.controller, arg_5_0:GetCurrentMenu().id, arg_5_0.id, "vip")

			return
		end

		if var_6_4 ~= var_0_1.UNLOCKED then
			arg_5_0.Button:SetButtonDisabled(true)

			return
		end

		local var_6_5, var_6_6 = Playlist.CGJBAEBBG(var_6_3, var_6_2)

		if var_6_5 == true and var_6_2 ~= var_0_2 then
			Playlist.CBHGDIGEI(var_6_3, var_6_2)
			var_0_3(arg_5_0.Button, var_6_3, var_6_2)

			return
		end

		local var_6_7 = Playlist.CHFFDAHDIB(var_6_3, var_6_2)
		local var_6_8 = LUI.FlowManager.GetScopedData(arg_5_0)
		local var_6_9 = Friends.BJDEIGDDCD()
		local var_6_10 = var_6_9 and #var_6_9 > 1

		if Lobby.BCJAAJAHDD() and var_6_7 and #var_6_7 > 0 and CP.HasSeenCinematic(arg_6_1.controller, var_6_7) == 0 and not var_6_10 then
			CP.SetHasSeenIntroVideo(arg_6_1.controller, var_6_7)
			CP.PlayIntroVideo(arg_6_1.controller, var_6_7)
		else
			local function var_6_11()
				local function var_7_0()
					if PlaylistUtils.DoesPlaylistRequireSquadFill(var_6_0, var_6_1) then
						Lobby.ForceEnableFill(arg_5_0, var_6_0)
					end

					if Playlist.CDBBECIGIG(var_6_3, var_6_2) then
						MissionUtils.SetCurrentPlaylist(var_6_3, var_6_2)
						Engine.DAGFFDGFII("uploadstats", arg_6_1.controller)

						if Engine.EAIICIFIFA() then
							local var_8_0 = var_6_1.numRounds:GetValue(arg_6_1.controller)
							local var_8_1 = var_6_1.timeLimit:GetValue(arg_6_1.controller)

							LUI.FlowManager.RequestAddMenu("CPPublicMatchMenu", false, arg_6_1.controller, false, {
								openFromPlaylist = true,
								relics = var_8_0,
								difficulty = var_8_1
							})
						elseif Engine.HEEFCICJE() then
							LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_6_1.controller, false, {
								openFromPlaylist = true
							})
						else
							LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_6_1.controller, false, {
								openFromPlaylist = true
							})
						end
					end
				end

				Lobby.TryNavigateToLobby(var_7_0)
			end

			if PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(arg_5_0, var_6_0, var_6_1, var_6_11) then
				-- block empty
			elseif PlaylistUtils.DoesPlaylistRequireScareWarning(var_6_0, var_6_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "PlaylistScareWarningPopup", true, var_6_0, false, {
					onAccept = var_6_11,
					controllerIndex = var_6_0
				})
			else
				var_6_11()
			end
		end
	end
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_0.Button)
	arg_9_0.Button:addEventHandler("button_action", var_0_4(arg_9_0))

	arg_9_0._activeMods = 0
	arg_9_0._controllerIndex = arg_9_1

	local function var_9_0(arg_10_0, arg_10_1)
		if Engine.EAIICIFIFA() then
			local var_10_0 = arg_9_0:GetDataSource()

			assert(var_10_0)

			local var_10_1 = var_10_0.playlistIndex:GetValue()

			assert(var_10_1)
			Engine.EBHIFJCGBH("map_select", var_10_1)
		end

		if Engine.HEEFCICJE() then
			local var_10_2 = arg_9_0:GetDataSource()

			assert(var_10_2)
			arg_10_0:dispatchEventToRoot({
				name = "playlist_button_over",
				dataSource = var_10_2,
				controller = arg_10_1.controller
			})
		end
	end

	arg_9_0.Button:addEventHandler("button_over", var_9_0)
	arg_9_0.Button:addEventHandler("button_over_disable", var_9_0)

	local function var_9_1(arg_11_0)
		local var_11_0 = arg_11_0:GetDataSource()

		if var_11_0 then
			local var_11_1 = var_11_0.playlistIndex:GetValue(arg_9_1)
			local var_11_2 = var_11_0.categoryIndex:GetValue(arg_9_1)
			local var_11_3 = Playlist.DCFCIFABGH(var_11_2, var_11_1)
			local var_11_4 = var_11_3 == var_0_1.UNLOCKED
			local var_11_5 = var_11_3 == var_0_1.LOCKED_DLC_LOCAL

			if CONDITIONS.IsThirdGameMode() then
				local var_11_6 = var_11_0.timeLimit:GetValue(arg_9_1)

				if var_11_6 == 101 then
					var_11_4 = CP.IsRaidPlaylistUnlocked(var_11_6, arg_9_1)
				end
			end

			local var_11_7 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

			var_11_4 = var_11_4 and not var_11_7

			local var_11_8 = not var_11_4 and not var_11_5

			arg_11_0.Button:SetButtonDisabled(var_11_8)
			var_0_3(arg_11_0.Button, var_11_2, var_11_1)

			if var_11_3 == var_0_1.UNLOCKED then
				arg_11_0.Button:SetButtonDescription("")
			elseif var_11_3 == var_0_1.LOCKED_DLC_LOCAL then
				arg_11_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("DLC/PLAYLIST_MISSING_MAP_PACK"))
			elseif var_11_3 == var_0_1.LOCKED_DLC_PARTY then
				arg_11_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("DLC/NOTEVERYONEHASREQUIREDDLC"))
			elseif var_11_3 == var_0_1.LOCKED_MAXPARTY then
				local var_11_9 = var_11_0.maxPartySize:GetValue(arg_9_1)

				arg_11_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("MPUI/MAXPARTYSIZE", var_11_9))
			elseif var_11_3 == var_0_1.LOCKED_MINPARTY then
				local var_11_10 = var_11_0.minPartySize:GetValue(arg_9_1)

				arg_11_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("MPUI/MINPARTYSIZE", var_11_10))
			elseif var_11_3 == var_0_1.LOCKED_NO_FILTERS_SET then
				arg_11_0.Button:SetButtonDescription("No filters set!")
			end

			if var_11_0.isNew then
				local var_11_11 = var_11_0.isNew:GetValue(arg_9_1)

				if var_11_11 and not var_11_8 then
					arg_9_0.NewItemNotification:SetAlpha(var_11_11)
				end
			end

			if var_11_0.isLimitedTime then
				local var_11_12 = var_11_0.isLimitedTime:GetValue(arg_9_1)
				local var_11_13

				var_11_13 = var_11_12 and not var_11_8

				arg_9_0.LimitedTimeIcon:SetAlpha(var_11_12 and 0.6 or 0)
			end
		end
	end

	local var_9_2

	local function var_9_3(arg_12_0)
		var_9_1(arg_12_0)

		arg_12_0:Wait(1000).onComplete = var_9_3
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_9_0, "AR")
	end

	var_9_3(arg_9_0)
	arg_9_0:SubscribeToDataSourceThroughElement(arg_9_0, nil, function()
		var_9_1(arg_9_0)
	end)

	local function var_9_4()
		local var_14_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		arg_9_0.Button:SetButtonDisabled(var_14_0)
	end

	local var_9_5 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_9_6 = DataSources.frontEnd.lobby.memberCount

	arg_9_0:SubscribeToModel(var_9_5:GetModel(arg_9_1), var_9_4, true)
	arg_9_0:SubscribeToModel(var_9_6:GetModel(arg_9_1), var_9_4, true)
	arg_9_0:addEventHandler("update_publisher_variables", var_9_4)
	var_9_4()
	arg_9_0:SubscribeToModelThroughElement(arg_9_0, "xpScale", function()
		var_0_0(arg_9_0)
	end)
	arg_9_0:SubscribeToModelThroughElement(arg_9_0, "weaponXpScale", function()
		var_0_0(arg_9_0)
	end)
	arg_9_0:SubscribeToModelThroughElement(arg_9_0, "battlePassXpScale", function()
		var_0_0(arg_9_0)
	end)
	arg_9_0:SubscribeToModelThroughElement(arg_9_0, "operatorXpScale", function()
		var_0_0(arg_9_0)
	end)
end

function PlaylistButton(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 40 * _1080p)

	var_19_0.id = "PlaylistButton"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "Button"

	var_19_4.Text:SetLeft(_1080p * 20, 0)
	var_19_4.Text:SetAlignment(LUI.Alignment.Left)
	var_19_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_19_5()
		local var_20_0 = var_19_0:GetDataSource().name:GetValue(var_19_1)

		if var_20_0 ~= nil then
			var_19_4.Text:setText(ToUpperCase(var_20_0), 0)
		end
	end

	var_19_4:SubscribeToModelThroughElement(var_19_0, "name", var_19_5)
	var_19_0:addElement(var_19_4)

	var_19_0.Button = var_19_4

	local var_19_6
	local var_19_7 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_19_1
	})

	var_19_7.id = "NewItemNotification"

	var_19_7:SetAlpha(0, 0)
	var_19_7:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -4, _1080p * 4)
	var_19_0:addElement(var_19_7)

	var_19_0.NewItemNotification = var_19_7

	local var_19_8
	local var_19_9 = LUI.UIImage.new()

	var_19_9.id = "LimitedTimeIcon"

	var_19_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_19_9:SetAlpha(0, 0)
	var_19_9:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_19_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 401, _1080p * 425, _1080p * -12, _1080p * 12)
	var_19_0:addElement(var_19_9)

	var_19_0.LimitedTimeIcon = var_19_9

	local var_19_10
	local var_19_11 = LUI.UIImage.new()

	var_19_11.id = "ModifierIcon1"

	var_19_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_19_11:SetAlpha(0, 0)
	var_19_11:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_19_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 367, _1080p * 397, _1080p * 5, _1080p * 35)
	var_19_0:addElement(var_19_11)

	var_19_0.ModifierIcon1 = var_19_11

	local var_19_12
	local var_19_13 = LUI.UIImage.new()

	var_19_13.id = "ModifierIcon2"

	var_19_13:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_19_13:SetAlpha(0, 0)
	var_19_13:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 337, _1080p * 367, _1080p * 5, _1080p * 35)
	var_19_0:addElement(var_19_13)

	var_19_0.ModifierIcon2 = var_19_13

	local var_19_14
	local var_19_15 = LUI.UIImage.new()

	var_19_15.id = "ModifierIcon3"

	var_19_15:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_19_15:SetAlpha(0, 0)
	var_19_15:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_19_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 307, _1080p * 337, _1080p * 5, _1080p * 35)
	var_19_0:addElement(var_19_15)

	var_19_0.ModifierIcon3 = var_19_15

	local var_19_16
	local var_19_17 = LUI.UIImage.new()

	var_19_17.id = "ModifierIcon4"

	var_19_17:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_19_17:SetAlpha(0, 0)
	var_19_17:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_19_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 277, _1080p * 307, _1080p * 5, _1080p * 35)
	var_19_0:addElement(var_19_17)

	var_19_0.ModifierIcon4 = var_19_17

	local var_19_18
	local var_19_19 = LUI.UIImage.new()

	var_19_19.id = "PlaylistRestrictionIcon"

	var_19_19:SetAlpha(0, 0)
	var_19_19:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_19_19:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 245, _1080p * 275, _1080p * -15, _1080p * 15)
	var_19_0:addElement(var_19_19)

	var_19_0.PlaylistRestrictionIcon = var_19_19

	local var_19_20
	local var_19_21 = LUI.UIImage.new()

	var_19_21.id = "PlaylistRestrictionHighlightBottom"

	var_19_21:SetAlpha(0, 0)
	var_19_21:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_19_21:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, _1080p * -1)
	var_19_0:addElement(var_19_21)

	var_19_0.PlaylistRestrictionHighlightBottom = var_19_21

	local function var_19_22()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_22

	local var_19_23
	local var_19_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -431
		}
	}

	var_19_7:RegisterAnimationSequence("AR", var_19_24)

	local var_19_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		}
	}

	var_19_9:RegisterAnimationSequence("AR", var_19_25)

	local var_19_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 84
		}
	}

	var_19_11:RegisterAnimationSequence("AR", var_19_26)

	local var_19_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 114
		}
	}

	var_19_13:RegisterAnimationSequence("AR", var_19_27)

	local var_19_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 144
		}
	}

	var_19_15:RegisterAnimationSequence("AR", var_19_28)

	local var_19_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 174
		}
	}

	var_19_17:RegisterAnimationSequence("AR", var_19_29)

	local var_19_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 207
		}
	}

	var_19_19:RegisterAnimationSequence("AR", var_19_30)

	local function var_19_31()
		var_19_7:AnimateSequence("AR")
		var_19_9:AnimateSequence("AR")
		var_19_11:AnimateSequence("AR")
		var_19_13:AnimateSequence("AR")
		var_19_15:AnimateSequence("AR")
		var_19_17:AnimateSequence("AR")
		var_19_19:AnimateSequence("AR")
	end

	var_19_0._sequences.AR = var_19_31

	local var_19_32
	local var_19_33 = {
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

	var_19_19:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_19_33)

	local var_19_34 = {
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

	var_19_21:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_19_34)

	local function var_19_35()
		var_19_19:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_19_21:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_19_0._sequences.ModPlaylistRestrictionEnabled = var_19_35

	local var_19_36
	local var_19_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_19:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_19_37)

	local var_19_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_21:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_19_38)

	local function var_19_39()
		var_19_19:AnimateSequence("ModPlaylistRestrictionOff")
		var_19_21:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_19_0._sequences.ModPlaylistRestrictionOff = var_19_39

	local var_19_40
	local var_19_41 = {
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

	var_19_19:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_19_41)

	local var_19_42 = {
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

	var_19_21:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_19_42)

	local function var_19_43()
		var_19_19:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_19_21:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_19_0._sequences.ModPlaylistRestrictionDisabled = var_19_43

	var_0_5(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("PlaylistButton", PlaylistButton)
LockTable(_M)
