module(..., package.seeall)

local var_0_0 = 10 * _1080p

local function var_0_1(arg_1_0)
	local var_1_0 = {
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
		}
	}

	local function var_1_1()
		for iter_2_0 = 1, #var_1_0 do
			if not var_1_0[iter_2_0].isUsed then
				var_1_0[iter_2_0].isUsed = true

				local var_2_0 = var_1_0[iter_2_0].icon

				var_2_0:SetAlpha(1)

				return var_2_0
			end
		end
	end

	local function var_1_2(arg_3_0)
		if not IsLanguageArabic() then
			arg_1_0.Text:SetRight(arg_3_0:GetCurrentAnchorsAndPositions().left - var_0_0)
		end
	end

	local function var_1_3(arg_4_0, arg_4_1)
		if arg_4_0:GetValue(controllerIndex) > 1 then
			local var_4_0 = var_1_1()

			var_4_0:setImage(RegisterMaterial(arg_4_1))
			var_1_2(var_4_0)
		end
	end

	var_1_3(arg_1_0:GetDataSource().xpScale, "icon_double_xp")
	var_1_3(arg_1_0:GetDataSource().weaponXpScale, "icon_double_weapon_xp")
	var_1_3(arg_1_0:GetDataSource().battlePassXpScale, "icon_double_battle_xp")
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.Background._wzTheme = true
	arg_5_0.UpdateModifiers = var_0_1

	arg_5_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_0:GetDataSource()

		if var_6_0.categoryIndex then
			local var_6_1 = var_6_0.categoryIndex:GetValue(arg_5_1)
			local var_6_2 = var_6_0.playlistIndex:GetValue(arg_5_1)

			if var_6_1 ~= nil and var_6_2 ~= nil then
				local var_6_3 = Playlist.DCFCIFABGH(var_6_1, var_6_2)
				local var_6_4 = var_6_3 == Lobby.PlaylistLockState.UNLOCKED
				local var_6_5 = var_6_0.maxPlayerSize:GetValue(arg_5_1)
				local var_6_6 = Dvar.CFHDGABACF("MTTRPNMPRP")

				local function var_6_7()
					Lobby.TryNavigateToLobby(function()
						if Playlist.CDBBECIGIG(var_6_1, var_6_2) then
							if CONDITIONS.IsMagmaGameMode(arg_5_0) then
								LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_5_1, false, {
									openFromPlaylist = true
								})
							else
								LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_5_1, false, {
									openFromPlaylist = true
								})
							end
						end
					end)
				end

				local var_6_8 = Playlist.DEJGAECIBG(var_6_2, var_6_1)

				if not var_6_4 and var_6_3 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					local var_6_9 = {}

					table.insert(var_6_9, var_6_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_5_1, false, {
						invalidPlaylists = var_6_9
					})
				elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_6_0, arg_5_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_5_1, false, {
						isSplitScreenWarning = true,
						controllerIndex = arg_5_1,
						text = var_6_0.name:GetValue(arg_5_1)
					})
				elseif not Engine.FIDIEBFAG(arg_5_1) and var_6_6 <= var_6_5 then
					local var_6_10 = {
						controllerIndex = arg_5_1,
						onAccept = var_6_7,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_5_1, false, var_6_10)
				elseif var_6_8 and Engine.JACCCCEDI() then
					local var_6_11 = {}

					table.insert(var_6_11, var_6_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_5_1, false, {
						premium = true,
						invalidPlaylists = var_6_11
					})
				elseif var_6_8 and not Engine.HBIAGEFCC() then
					local var_6_12 = {}

					table.insert(var_6_12, var_6_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_5_1, false, {
						subscription = true,
						invalidPlaylists = var_6_12
					})
				else
					var_6_7()
				end
			end
		end
	end)
	arg_5_0:registerEventHandler("button_over", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
	end)
	arg_5_0:registerEventHandler("button_up", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_5_0, "ButtonUp")
	end)

	local function var_5_0()
		local var_11_0 = arg_5_0:GetDataSource().maxPartySize:GetValue(arg_5_1)

		if var_11_0 ~= nil then
			arg_5_0.PartyCount:setText(ToUpperCase(var_11_0))
		end
	end

	arg_5_0:SubscribeToModelThroughElement(arg_5_0, "maxPartySize", var_5_0)

	local function var_5_1()
		local var_12_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		arg_5_0:SetButtonDisabled(var_12_0)
	end

	local var_5_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_5_3 = DataSources.frontEnd.lobby.memberCount

	arg_5_0:SubscribeToModel(var_5_2:GetModel(arg_5_1), var_5_1, true)
	arg_5_0:SubscribeToModel(var_5_3:GetModel(arg_5_1), var_5_1, true)
	arg_5_0:registerEventHandler("update_publisher_variables", var_5_1)
	var_5_1()
	arg_5_0:SubscribeToModelThroughElement(arg_5_0, "xpScale", function()
		var_0_1(arg_5_0)
	end)
	arg_5_0:SubscribeToModelThroughElement(arg_5_0, "weaponXpScale", function()
		var_0_1(arg_5_0)
	end)
	arg_5_0:SubscribeToModelThroughElement(arg_5_0, "battlePassXpScale", function()
		var_0_1(arg_5_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

function PlaylistButtonSmall(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIButton.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 312 * _1080p, 0, 30 * _1080p)

	var_16_0.id = "PlaylistButtonSmall"
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

	var_16_4.id = "BackgroundDarkener"

	var_16_4:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_16_4:SetAlpha(0.5, 0)
	var_16_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 12, _1080p * 312, 0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.BackgroundDarkener = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "Background"

	var_16_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 12, _1080p * 312, 0, 0)
	var_16_0:addElement(var_16_6)

	var_16_0.Background = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIImage.new()

	var_16_8.id = "TeamIcon"

	var_16_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_8:SetAlpha(0, 0)
	var_16_8:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 260, _1080p * 285, _1080p * 3, _1080p * 28)
	var_16_0:addElement(var_16_8)

	var_16_0.TeamIcon = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIText.new()

	var_16_10.id = "PartyCount"

	var_16_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_10:SetAlpha(0, 0)
	var_16_10:setText("1", 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_10:SetAlignment(LUI.Alignment.Left)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 287, _1080p * 312, _1080p * 3, _1080p * 27)
	var_16_0:addElement(var_16_10)

	var_16_0.PartyCount = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIStyledText.new()

	var_16_12.id = "Text"

	var_16_12:SetRGBFromTable(SWATCHES.genericButton.warzoneTextDefault, 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_12:SetWordWrap(false)
	var_16_12:SetAlignment(LUI.Alignment.Left)
	var_16_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_12:SetStartupDelay(2000)
	var_16_12:SetLineHoldTime(400)
	var_16_12:SetAnimMoveTime(2000)
	var_16_12:SetAnimMoveSpeed(150)
	var_16_12:SetEndDelay(2000)
	var_16_12:SetCrossfadeTime(250)
	var_16_12:SetFadeInTime(300)
	var_16_12:SetFadeOutTime(300)
	var_16_12:SetMaxVisibleLines(1)
	var_16_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 16, _1080p * 255, _1080p * -12, _1080p * 12)

	local function var_16_13()
		local var_17_0 = var_16_0:GetDataSource().name:GetValue(var_16_1)

		if var_17_0 ~= nil then
			var_16_12:setText(var_17_0, 0)
		end
	end

	var_16_12:SubscribeToModelThroughElement(var_16_0, "name", var_16_13)
	var_16_0:addElement(var_16_12)

	var_16_0.Text = var_16_12

	local var_16_14
	local var_16_15 = LUI.UIImage.new()

	var_16_15.id = "Arrow"

	var_16_15:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus, 0)
	var_16_15:SetAlpha(0, 0)
	var_16_15:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_16_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 12, _1080p * 3, _1080p * 27)
	var_16_0:addElement(var_16_15)

	var_16_0.Arrow = var_16_15

	local var_16_16
	local var_16_17 = LUI.UIImage.new()

	var_16_17.id = "Highlight"

	var_16_17:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus, 0)
	var_16_17:SetAlpha(0, 0)
	var_16_17:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_16_17:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 12, _1080p * 312, 0, 0)
	var_16_0:addElement(var_16_17)

	var_16_0.Highlight = var_16_17

	local var_16_18
	local var_16_19 = LUI.UIImage.new()

	var_16_19.id = "ModifierIcon1"

	var_16_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_19:SetAlpha(0, 0)
	var_16_19:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_16_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 233, _1080p * 258, _1080p * 3, _1080p * 28)
	var_16_0:addElement(var_16_19)

	var_16_0.ModifierIcon1 = var_16_19

	local var_16_20
	local var_16_21 = LUI.UIImage.new()

	var_16_21.id = "ModifierIcon2"

	var_16_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_21:SetAlpha(0, 0)
	var_16_21:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_16_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 208, _1080p * 233, _1080p * 3, _1080p * 28)
	var_16_0:addElement(var_16_21)

	var_16_0.ModifierIcon2 = var_16_21

	local var_16_22
	local var_16_23 = LUI.UIImage.new()

	var_16_23.id = "ModifierIcon3"

	var_16_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_23:SetAlpha(0, 0)
	var_16_23:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_16_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 183, _1080p * 208, _1080p * 3, _1080p * 28)
	var_16_0:addElement(var_16_23)

	var_16_0.ModifierIcon3 = var_16_23

	local function var_16_24()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_24

	local var_16_25
	local var_16_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_26)

	local var_16_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOver", var_16_27)

	local var_16_28 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOver", var_16_28)

	local var_16_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_15:RegisterAnimationSequence("ButtonOver", var_16_29)

	local var_16_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_17:RegisterAnimationSequence("ButtonOver", var_16_30)

	local function var_16_31()
		var_16_8:AnimateSequence("ButtonOver")
		var_16_10:AnimateSequence("ButtonOver")
		var_16_12:AnimateSequence("ButtonOver")
		var_16_15:AnimateSequence("ButtonOver")
		var_16_17:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_31

	local var_16_32
	local var_16_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_33)

	local var_16_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUp", var_16_34)

	local var_16_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextDefault
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUp", var_16_35)

	local var_16_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_15:RegisterAnimationSequence("ButtonUp", var_16_36)

	local var_16_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_17:RegisterAnimationSequence("ButtonUp", var_16_37)

	local function var_16_38()
		var_16_8:AnimateSequence("ButtonUp")
		var_16_10:AnimateSequence("ButtonUp")
		var_16_12:AnimateSequence("ButtonUp")
		var_16_15:AnimateSequence("ButtonUp")
		var_16_17:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_38

	local var_16_39
	local var_16_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 64
		}
	}

	var_16_8:RegisterAnimationSequence("AR", var_16_40)

	local var_16_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_16_10:RegisterAnimationSequence("AR", var_16_41)

	local var_16_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -236
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_16_12:RegisterAnimationSequence("AR", var_16_42)

	local var_16_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 89
		}
	}

	var_16_19:RegisterAnimationSequence("AR", var_16_43)

	local var_16_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 113
		}
	}

	var_16_21:RegisterAnimationSequence("AR", var_16_44)

	local var_16_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 138
		}
	}

	var_16_23:RegisterAnimationSequence("AR", var_16_45)

	local function var_16_46()
		var_16_8:AnimateSequence("AR")
		var_16_10:AnimateSequence("AR")
		var_16_12:AnimateSequence("AR")
		var_16_19:AnimateSequence("AR")
		var_16_21:AnimateSequence("AR")
		var_16_23:AnimateSequence("AR")
	end

	var_16_0._sequences.AR = var_16_46

	local var_16_47
	local var_16_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_16_12:RegisterAnimationSequence("Selection", var_16_48)

	local var_16_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_17:RegisterAnimationSequence("Selection", var_16_49)

	local function var_16_50()
		var_16_12:AnimateSequence("Selection")
		var_16_17:AnimateSequence("Selection")
	end

	var_16_0._sequences.Selection = var_16_50

	var_0_2(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("PlaylistButtonSmall", PlaylistButtonSmall)
LockTable(_M)
