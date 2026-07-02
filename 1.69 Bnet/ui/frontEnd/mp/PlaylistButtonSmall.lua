module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Background._wzTheme = true
	arg_1_0._controllerIndex = arg_1_1

	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:GetDataSource()

		if var_2_0.categoryIndex then
			local var_2_1 = var_2_0.categoryIndex:GetValue(arg_1_1)
			local var_2_2 = var_2_0.playlistIndex:GetValue(arg_1_1)

			if var_2_1 ~= nil and var_2_2 ~= nil then
				local var_2_3 = Playlist.DCFCIFABGH(var_2_1, var_2_2)
				local var_2_4 = var_2_3 == Lobby.PlaylistLockState.UNLOCKED
				local var_2_5 = var_2_0.maxPlayerSize:GetValue(arg_1_1)
				local var_2_6 = Dvar.CFHDGABACF("MTTRPNMPRP")

				local function var_2_7()
					Lobby.TryNavigateToLobby(function()
						if Playlist.CDBBECIGIG(var_2_1, var_2_2) then
							if CONDITIONS.IsMagmaGameMode(arg_1_0) then
								local function var_4_0()
									LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_1_1, false, {
										openFromPlaylist = true
									})
								end

								if PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(arg_1_0, arg_1_1, var_2_0, var_4_0) then
									-- block empty
								else
									var_4_0()
								end
							else
								LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_1_1, false, {
									openFromPlaylist = true
								})
							end
						end
					end)
				end

				local var_2_8 = Playlist.DEJGAECIBG(var_2_2, var_2_1)

				if not var_2_4 and var_2_3 == Lobby.PlaylistLockState.LOCKED_FORCE_LOCK then
					local var_2_9 = {}

					table.insert(var_2_9, var_2_0)
				elseif not var_2_4 and var_2_3 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					local var_2_10 = {}

					table.insert(var_2_10, var_2_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_1_1, false, {
						invalidPlaylists = var_2_10
					})
				elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_2_0, arg_1_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_1_1, false, {
						isSplitScreenWarning = true,
						controllerIndex = arg_1_1,
						text = var_2_0.name:GetValue(arg_1_1)
					})
				elseif not Engine.FIDIEBFAG(arg_1_1) and var_2_6 <= var_2_5 then
					local var_2_11 = {
						controllerIndex = arg_1_1,
						onAccept = var_2_7,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_1_1, false, var_2_11)
				elseif var_2_8 and Engine.JACCCCEDI() then
					local var_2_12 = {}

					table.insert(var_2_12, var_2_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_1_1, false, {
						premium = true,
						invalidPlaylists = var_2_12
					})
				elseif var_2_8 and not Engine.HBIAGEFCC() then
					local var_2_13 = {}

					table.insert(var_2_13, var_2_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_1_1, false, {
						subscription = true,
						invalidPlaylists = var_2_13
					})
				else
					var_2_7()
				end
			end
		end
	end)
	arg_1_0:registerEventHandler("button_over", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_1_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_1_0:registerEventHandler("button_up", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_1_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)

	local function var_1_0()
		local var_8_0 = arg_1_0:GetDataSource().maxPartySize:GetValue(arg_1_1)

		if var_8_0 ~= nil then
			arg_1_0.PartyCount:setText(ToUpperCase(var_8_0))
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "maxPartySize", var_1_0)

	local function var_1_1()
		local var_9_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		arg_1_0:SetButtonDisabled(var_9_0)
	end

	local var_1_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_1_3 = DataSources.frontEnd.lobby.memberCount

	arg_1_0:SubscribeToModel(var_1_2:GetModel(arg_1_1), var_1_1, true)
	arg_1_0:SubscribeToModel(var_1_3:GetModel(arg_1_1), var_1_1, true)
	arg_1_0:registerEventHandler("update_publisher_variables", var_1_1)
	var_1_1()

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function PlaylistButtonSmall(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 332 * _1080p, 0, 30 * _1080p)

	var_10_0.id = "PlaylistButtonSmall"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "BackgroundDarkener"

	var_10_4:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_10_4:SetAlpha(0.5, 0)
	var_10_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 12, _1080p * 332, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.BackgroundDarkener = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "Background"

	var_10_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 12, _1080p * 332, 0, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.Background = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "TeamIcon"

	var_10_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_8:SetAlpha(0, 0)
	var_10_8:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 282, _1080p * 307, _1080p * 3, _1080p * 28)
	var_10_0:addElement(var_10_8)

	var_10_0.TeamIcon = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "PartyCount"

	var_10_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_10:SetAlpha(0, 0)
	var_10_10:setText("1", 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 307, _1080p * 332, _1080p * 3, _1080p * 27)
	var_10_0:addElement(var_10_10)

	var_10_0.PartyCount = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "Text"

	var_10_12:SetRGBFromTable(SWATCHES.genericButton.warzoneTextDefault, 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetWordWrap(false)
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_12:SetStartupDelay(2000)
	var_10_12:SetLineHoldTime(400)
	var_10_12:SetAnimMoveTime(2000)
	var_10_12:SetAnimMoveSpeed(150)
	var_10_12:SetEndDelay(2000)
	var_10_12:SetCrossfadeTime(250)
	var_10_12:SetFadeInTime(300)
	var_10_12:SetFadeOutTime(300)
	var_10_12:SetMaxVisibleLines(1)
	var_10_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 16, _1080p * 255, _1080p * -12, _1080p * 12)

	local function var_10_13()
		local var_11_0 = var_10_0:GetDataSource().name:GetValue(var_10_1)

		if var_11_0 ~= nil then
			var_10_12:setText(var_11_0, 0)
		end
	end

	var_10_12:SubscribeToModelThroughElement(var_10_0, "name", var_10_13)
	var_10_0:addElement(var_10_12)

	var_10_0.Text = var_10_12

	local var_10_14
	local var_10_15 = LUI.UIImage.new()

	var_10_15.id = "Arrow"

	var_10_15:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus, 0)
	var_10_15:SetAlpha(0, 0)
	var_10_15:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_10_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 12, _1080p * 3, _1080p * 27)
	var_10_0:addElement(var_10_15)

	var_10_0.Arrow = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIImage.new()

	var_10_17.id = "Highlight"

	var_10_17:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus, 0)
	var_10_17:SetAlpha(0, 0)
	var_10_17:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_17:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 12, _1080p * 332, 0, 0)
	var_10_0:addElement(var_10_17)

	var_10_0.Highlight = var_10_17

	local var_10_18
	local var_10_19 = LUI.UIImage.new()

	var_10_19.id = "PlaylistRestrictionIcon"

	var_10_19:SetAlpha(0, 0)
	var_10_19:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_10_19:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * 2, _1080p * 24, _1080p * -26, _1080p * -4)
	var_10_0:addElement(var_10_19)

	var_10_0.PlaylistRestrictionIcon = var_10_19

	local var_10_20
	local var_10_21 = LUI.UIImage.new()

	var_10_21.id = "PlaylistRestrictionHighlight"

	var_10_21:SetAlpha(0, 0)
	var_10_21:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_10_21:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_10_0:addElement(var_10_21)

	var_10_0.PlaylistRestrictionHighlight = var_10_21

	local function var_10_22()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_22

	local var_10_23
	local var_10_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_24)

	local var_10_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_25)

	local var_10_26 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonOver", var_10_26)

	local var_10_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("ButtonOver", var_10_27)

	local var_10_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonOver", var_10_28)

	local function var_10_29()
		var_10_8:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
		var_10_12:AnimateSequence("ButtonOver")
		var_10_15:AnimateSequence("ButtonOver")
		var_10_17:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_29

	local var_10_30
	local var_10_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_31)

	local var_10_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_32)

	local var_10_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextDefault
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonUp", var_10_33)

	local var_10_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("ButtonUp", var_10_34)

	local var_10_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonUp", var_10_35)

	local function var_10_36()
		var_10_8:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
		var_10_12:AnimateSequence("ButtonUp")
		var_10_15:AnimateSequence("ButtonUp")
		var_10_17:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_36

	local var_10_37
	local var_10_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52
		}
	}

	var_10_8:RegisterAnimationSequence("AR", var_10_38)

	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_10_10:RegisterAnimationSequence("AR", var_10_39)

	local var_10_40 = {
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
			value = _1080p * -200
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_10_12:RegisterAnimationSequence("AR", var_10_40)

	local function var_10_41()
		var_10_8:AnimateSequence("AR")
		var_10_10:AnimateSequence("AR")
		var_10_12:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_41

	local var_10_42
	local var_10_43 = {
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

	var_10_12:RegisterAnimationSequence("Selection", var_10_43)

	local var_10_44 = {
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

	var_10_17:RegisterAnimationSequence("Selection", var_10_44)

	local function var_10_45()
		var_10_12:AnimateSequence("Selection")
		var_10_17:AnimateSequence("Selection")
	end

	var_10_0._sequences.Selection = var_10_45

	local var_10_46
	local var_10_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipSetup", var_10_47)

	local var_10_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipSetup", var_10_48)

	local var_10_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipSetup", var_10_49)

	local var_10_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("WZWipSetup", var_10_50)

	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipSetup", var_10_51)

	local var_10_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipSetup", var_10_52)

	local function var_10_53()
		var_10_4:AnimateSequence("WZWipSetup")
		var_10_8:AnimateSequence("WZWipSetup")
		var_10_10:AnimateSequence("WZWipSetup")
		var_10_12:AnimateSequence("WZWipSetup")
		var_10_15:AnimateSequence("WZWipSetup")
		var_10_17:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_53

	local var_10_54
	local var_10_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOver", var_10_55)

	local var_10_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOver", var_10_56)

	local var_10_57 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("WZWipButtonOver", var_10_57)

	local var_10_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipButtonOver", var_10_58)

	local var_10_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonOver", var_10_59)

	local function var_10_60()
		var_10_8:AnimateSequence("WZWipButtonOver")
		var_10_10:AnimateSequence("WZWipButtonOver")
		var_10_12:AnimateSequence("WZWipButtonOver")
		var_10_15:AnimateSequence("WZWipButtonOver")
		var_10_17:AnimateSequence("WZWipButtonOver")
	end

	var_10_0._sequences.WZWipButtonOver = var_10_60

	local var_10_61
	local var_10_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUp", var_10_62)

	local var_10_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonUp", var_10_63)

	local var_10_64 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("WZWipButtonUp", var_10_64)

	local var_10_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipButtonUp", var_10_65)

	local var_10_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonUp", var_10_66)

	local function var_10_67()
		var_10_8:AnimateSequence("WZWipButtonUp")
		var_10_10:AnimateSequence("WZWipButtonUp")
		var_10_12:AnimateSequence("WZWipButtonUp")
		var_10_15:AnimateSequence("WZWipButtonUp")
		var_10_17:AnimateSequence("WZWipButtonUp")
	end

	var_10_0._sequences.WZWipButtonUp = var_10_67

	local var_10_68
	local var_10_69 = {
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

	var_10_12:RegisterAnimationSequence("WZWipSelection", var_10_69)

	local var_10_70 = {
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

	var_10_17:RegisterAnimationSequence("WZWipSelection", var_10_70)

	local function var_10_71()
		var_10_12:AnimateSequence("WZWipSelection")
		var_10_17:AnimateSequence("WZWipSelection")
	end

	var_10_0._sequences.WZWipSelection = var_10_71

	local var_10_72
	local var_10_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_10_12:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_10_73)

	local var_10_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_10_74)

	local var_10_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_10_75)

	local function var_10_76()
		var_10_12:AnimateSequence("ModPlaylistRestrictionOff")
		var_10_19:AnimateSequence("ModPlaylistRestrictionOff")
		var_10_21:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_10_0._sequences.ModPlaylistRestrictionOff = var_10_76

	local var_10_77
	local var_10_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_10_12:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_10_78)

	local var_10_79 = {
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

	var_10_19:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_10_79)

	local var_10_80 = {
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

	var_10_21:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_10_80)

	local function var_10_81()
		var_10_12:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_10_19:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_10_21:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_10_0._sequences.ModPlaylistRestrictionEnabled = var_10_81

	local var_10_82
	local var_10_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_10_12:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_10_83)

	local var_10_84 = {
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

	var_10_19:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_10_84)

	local var_10_85 = {
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

	var_10_21:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_10_85)

	local function var_10_86()
		var_10_12:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_10_19:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_10_21:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_10_0._sequences.ModPlaylistRestrictionDisabled = var_10_86

	var_0_0(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("PlaylistButtonSmall", PlaylistButtonSmall)
LockTable(_M)
