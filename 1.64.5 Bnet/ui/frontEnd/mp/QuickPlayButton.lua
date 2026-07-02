module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isButtonEnabled and arg_1_0._isNewPlaylist then
		arg_1_0.NewItemNotification:SetAlpha(arg_1_1.isButtonFocused and 1 or 0.6)
	else
		arg_1_0.NewItemNotification:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._normalFilteredDataSource = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._hardcoreFilteredDataSource = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._CDLFilteredDataSource = arg_4_1
end

local function var_0_4(arg_5_0)
	return arg_5_0._normalFilteredDataSource
end

local function var_0_5(arg_6_0)
	return arg_6_0._hardcoreFilteredDataSource
end

local function var_0_6(arg_7_0)
	return arg_7_0._CDLFilteredDataSource
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0._normalFilteredDataSource)
	assert(arg_8_0._hardcoreFilteredDataSource)

	local var_8_0 = MP.GetLastQuickplayFilter(arg_8_1)
	local var_8_1 = Dvar.IBEGCHEFE("MMTOPPQOON") and var_8_0 == MP.PLAYLIST_FILTER_MODE.CDLRules

	if not var_8_0 or var_8_1 and not arg_8_0._CDLFilteredDataSource then
		MP.SetLastQuickplayFilter(arg_8_1, MP.PLAYLIST_FILTER_MODE.normal)

		var_8_0 = MP.PLAYLIST_FILTER_MODE.normal

		MLG.SetUsingMLGRules(false)
		MatchRules.BCECADEHDA()
	end

	if var_8_0 == MP.PLAYLIST_FILTER_MODE.normal then
		arg_8_0:SetDataSource(arg_8_0._normalFilteredDataSource, arg_8_1)
	elseif var_8_1 then
		arg_8_0:SetDataSource(arg_8_0._CDLFilteredDataSource, arg_8_1)
	else
		arg_8_0:SetDataSource(arg_8_0._hardcoreFilteredDataSource, arg_8_1)
	end

	if not arg_8_0._disabled then
		local var_8_2 = arg_8_0:GetDataSource().name:GetValue(arg_8_1)

		arg_8_0.Category:setText(var_8_2)
	end

	arg_8_0._isNewPlaylist = arg_8_2

	if not arg_8_0._isNewPlaylist then
		arg_8_0.NewItemNotification:SetAlpha(0)
	end
end

local function var_0_8(arg_9_0)
	arg_9_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
end

local function var_0_9(arg_10_0)
	arg_10_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
end

local function var_0_10(arg_11_0, arg_11_1)
	arg_11_0._ignoreButtonUp = arg_11_1
end

local function var_0_11(arg_12_0, arg_12_1)
	if not LUI.IsLastInputMouseNavigation(arg_12_1) then
		if arg_12_0._disabled then
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabled")
			arg_12_0:UpdateBreadcrumb({
				isButtonFocused = true,
				isButtonEnabled = false
			})
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOver")
			ACTIONS.AnimateSequence(arg_12_0.Background, "UnavailableUp")
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverNoGlow")
			arg_12_0:UpdateBreadcrumb({
				isButtonFocused = true,
				isButtonEnabled = true
			})
		end
	elseif arg_12_0._disabled then
		ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabledKBM")
		arg_12_0:UpdateBreadcrumb({
			isButtonFocused = true,
			isButtonEnabled = false
		})
	else
		ACTIONS.AnimateSequence(arg_12_0, "ButtonOverKBM")
		ACTIONS.AnimateSequence(arg_12_0.Background, "UnavailableUp")
		ACTIONS.AnimateSequence(arg_12_0, "ButtonOverNoGlow")
		arg_12_0:UpdateBreadcrumb({
			isButtonFocused = true,
			isButtonEnabled = true
		})
	end
end

local function var_0_12(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.SetNormalFilteredDataSource = var_0_1
	arg_13_0.SetHardcoreFilteredDataSource = var_0_2
	arg_13_0.SetCDLFilteredDataSource = var_0_3
	arg_13_0.GetNormalFilteredDataSource = var_0_4
	arg_13_0.GetHardcoreFilteredDataSource = var_0_5
	arg_13_0.GetCDLFilteredDataSource = var_0_6
	arg_13_0.SetupButton = var_0_7
	arg_13_0.ExpandButton = var_0_8
	arg_13_0.ContractButton = var_0_9
	arg_13_0.IgnoreButtonUp = var_0_10
	arg_13_0.ForceButtonOver = var_0_11
	arg_13_0.UpdateBreadcrumb = var_0_0
	arg_13_0.disabledDescriptionText = Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")
	arg_13_0._ignoreButtonUp = false
	arg_13_0._disabled = false

	arg_13_0:addEventHandler("disable", function(arg_14_0, arg_14_1)
		arg_13_0.Category:setText(arg_13_0.disabledDescriptionText)
		arg_13_0.Category:SetRGBFromTable(SWATCHES.genericButton.textDisabled)

		arg_13_0._disabled = true

		arg_13_0.NewItemNotification:SetAlpha(0)
	end)
	arg_13_0:addEventHandler("enable", function(arg_15_0, arg_15_1)
		local var_15_0 = arg_13_0:GetDataSource().name:GetValue(arg_13_1)

		arg_13_0.Category:setText(var_15_0)
		arg_13_0.Category:SetRGBFromTable(SWATCHES.genericButton.description)

		arg_13_0._disabled = false

		arg_13_0.NewItemNotification:SetAlpha(1)
	end)
	arg_13_0:addEventHandler("button_action", function(arg_16_0, arg_16_1)
		local function var_16_0()
			Lobby.TryNavigateToLobby(function()
				local function var_18_0()
					local var_19_0 = arg_16_0:GetDataSource().index:GetValue(arg_13_1)

					if Playlist.CDBBECIGIG(var_19_0, PlaylistUtils.USE_FILTERED_PLAYLIST_ID) then
						LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_13_1, false, {
							openFromPlaylist = true
						})
					end
				end

				if LOADOUT.MATCHRULES.ShouldShowLoadoutRestrictedPopup(arg_13_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "CDLInvalidLoadout", true, arg_13_1, false, {
						confirmAction = var_18_0
					})
				else
					var_18_0()
				end
			end)
		end

		if PlaylistUtils.CheckIfAllLocked(arg_16_0:GetDataSource(), arg_13_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "PlaylistMatchmakingFilterLockedPopup", true, arg_13_1, false, {
				dataSource = arg_13_0:GetDataSource(),
				controllerIndex = arg_13_1
			})
		else
			if not PlaylistUtils.AtLeastOneGameModeFiltered(arg_16_0:GetDataSource(), arg_13_1) then
				PlaylistUtils.SelectAll(arg_16_0:GetDataSource(), arg_13_1, true, false)
			end

			local var_16_1 = PlaylistUtils.ValidateSelection(arg_13_0:GetDataSource(), arg_16_1.controller)
			local var_16_2 = var_16_1.invalidPlaylists
			local var_16_3 = var_16_1.numFiltered
			local var_16_4 = var_16_1.requiresCrossplay
			local var_16_5 = var_16_1.maxPlayerPlaylists
			local var_16_6 = var_16_1.nonF2PPlaylists
			local var_16_7 = arg_16_0:GetDataSource().index:GetValue(arg_13_1)

			if Lobby.IsSplitScreenEnabled() and Playlist.CCJCFIFHJA(var_16_7) then
				LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_13_1, false, {
					isSplitScreenWarning = true,
					controllerIndex = arg_13_1,
					text = Engine.CBBHFCGDIC("LUA_MENU/CDL_CAPS")
				})
			elseif #var_16_2 > 0 then
				LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_13_1, false, {
					filtered = true,
					invalidPlaylists = var_16_2
				})
			elseif #var_16_5 > 0 and Lobby.IsSplitScreenEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_13_1, false, {
					maxPlayerPlaylists = var_16_5,
					controllerIndex = arg_13_1,
					acceptFunc = var_16_0,
					dataSource = arg_16_0:GetDataSource()
				})
			elseif not Engine.FIDIEBFAG(arg_13_1) and var_16_4 then
				local var_16_8 = {
					controllerIndex = arg_13_1,
					onAccept = var_16_0,
					crossplayRecommended = Engine.CIEGIACHAE()
				}

				LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_13_1, false, var_16_8)
			elseif #var_16_6 > 0 and Engine.JACCCCEDI() then
				LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_13_1, false, {
					premium = true,
					invalidPlaylists = var_16_6
				})
			elseif #var_16_6 > 0 and not Engine.HBIAGEFCC() then
				LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_13_1, false, {
					subscription = true,
					invalidPlaylists = var_16_6
				})
			else
				var_16_0()
			end

			if LUI.IsLastInputMouseNavigation(arg_16_1.controller) then
				return true
			end
		end
	end)
	arg_13_0:addEventHandler("button_over", function(arg_20_0, arg_20_1)
		if not LUI.IsLastInputMouseNavigation(arg_13_1) then
			ACTIONS.AnimateSequence(arg_13_0, "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_13_0, "ButtonOverKBM")
		end

		ACTIONS.AnimateSequence(arg_13_0, "ButtonOverGlow")
		arg_20_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		arg_13_0:UpdateBreadcrumb({
			isButtonFocused = true,
			isButtonEnabled = true
		})
	end)
	arg_13_0:addEventHandler("button_up", function(arg_21_0, arg_21_1)
		if not arg_13_0._ignoreButtonUp then
			if LUI.IsLastInputMouseNavigation then
				ACTIONS.AnimateSequence(arg_13_0, "ButtonOverKBM")
			else
				ACTIONS.AnimateSequence(arg_13_0, "ButtonOver")
			end

			ACTIONS.AnimateSequence(arg_13_0.Background, "UnavailableUp")
			ACTIONS.AnimateSequence(arg_13_0, "ButtonOverNoGlow")
		end

		arg_13_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		arg_13_0:UpdateBreadcrumb({
			isButtonFocused = false,
			isButtonEnabled = true
		})
	end)
	arg_13_0:addEventHandler("button_over_disable", function(arg_22_0, arg_22_1)
		if not LUI.IsLastInputMouseNavigation(arg_13_1) then
			ACTIONS.AnimateSequence(arg_13_0, "ButtonOverDisabled")
		else
			ACTIONS.AnimateSequence(arg_13_0, "ButtonOverDisabledKBM")
		end

		arg_22_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		arg_13_0:UpdateBreadcrumb({
			isButtonFocused = true,
			isButtonEnabled = false
		})
	end)
	arg_13_0:addEventHandler("button_disable", function(arg_23_0, arg_23_1)
		if not arg_13_0._ignoreButtonUp then
			ACTIONS.AnimateSequence(arg_13_0, "ButtonUpDisabled")
		end

		arg_13_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		arg_13_0:UpdateBreadcrumb({
			isButtonFocused = false,
			isButtonEnabled = false
		})
	end)
	arg_13_0:addEventHandler("lose_focus", function(arg_24_0, arg_24_1)
		arg_24_0:dispatchEventToParent(arg_24_1)
	end)

	if IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_13_0, "CHT")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_13_0, "AR")
	end

	if not IsLanguageArabic() then
		arg_13_0.NewItemNotification:SetupRightAlignment()
	end
end

function QuickPlayButton(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIButton.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_25_0.id = "QuickPlayButton"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)

	local var_25_2 = var_25_0
	local var_25_3
	local var_25_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_25_1
	})

	var_25_4.id = "Background"

	var_25_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_25_0:addElement(var_25_4)

	var_25_0.Background = var_25_4

	local var_25_5
	local var_25_6 = LUI.UIImage.new()

	var_25_6.id = "Backer"

	var_25_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_25_6:SetAlpha(0, 0)
	var_25_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_25_0:addElement(var_25_6)

	var_25_0.Backer = var_25_6

	local var_25_7
	local var_25_8 = LUI.UIStyledText.new()

	var_25_8.id = "Text"

	var_25_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_25_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/QUICK_PLAY")), 0)
	var_25_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_8:SetWordWrap(false)
	var_25_8:SetAlignment(LUI.Alignment.Left)
	var_25_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_25_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_25_8:SetStartupDelay(1000)
	var_25_8:SetLineHoldTime(400)
	var_25_8:SetAnimMoveTime(150)
	var_25_8:SetAnimMoveSpeed(50)
	var_25_8:SetEndDelay(1000)
	var_25_8:SetCrossfadeTime(400)
	var_25_8:SetFadeInTime(300)
	var_25_8:SetFadeOutTime(300)
	var_25_8:SetMaxVisibleLines(1)
	var_25_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_25_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 350, _1080p * -15, _1080p * 15)
	var_25_0:addElement(var_25_8)

	var_25_0.Text = var_25_8

	local var_25_9
	local var_25_10 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_25_1
	})

	var_25_10.id = "NewItemNotification"

	var_25_10:SetAlpha(0, 0)
	var_25_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 312, _1080p * 390, _1080p * -15, _1080p * 15)
	var_25_0:addElement(var_25_10)

	var_25_0.NewItemNotification = var_25_10

	local var_25_11
	local var_25_12 = LUI.UIImage.new()

	var_25_12.id = "Lock"

	var_25_12:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_25_12:SetAlpha(0, 0)
	var_25_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_25_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_25_0:addElement(var_25_12)

	var_25_0.Lock = var_25_12

	local var_25_13
	local var_25_14 = LUI.UIStyledText.new()

	var_25_14.id = "Description"

	var_25_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_14:SetAlpha(0, 0)
	var_25_14:setText("", 0)
	var_25_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_14:SetAlignment(LUI.Alignment.Left)
	var_25_14:SetShadowRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_25_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 410, _1080p * -23, _1080p * -3)
	var_25_0:addElement(var_25_14)

	var_25_0.Description = var_25_14

	local var_25_15
	local var_25_16 = LUI.UIStyledText.new()

	var_25_16.id = "Category"

	var_25_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_16:SetAlpha(0, 0)
	var_25_16:setText("", 0)
	var_25_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_16:SetAlignment(LUI.Alignment.Left)
	var_25_16:SetShadowMinDistance(-0.2, 0)
	var_25_16:SetShadowMaxDistance(0.2, 0)
	var_25_16:SetShadowUOffset(-0.002, 0)
	var_25_16:SetShadowRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_25_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 380, _1080p * 45, _1080p * 65)
	var_25_0:addElement(var_25_16)

	var_25_0.Category = var_25_16

	local function var_25_17()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_17

	local var_25_18
	local var_25_19 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonOver", var_25_19)

	local var_25_20 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOver", var_25_20)

	local var_25_21 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -30
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonOver", var_25_21)

	local var_25_22 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonOver", var_25_22)

	local var_25_23 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonOver", var_25_23)

	local var_25_24 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ButtonOver", var_25_24)

	local function var_25_25()
		var_25_6:AnimateSequence("ButtonOver")
		var_25_8:AnimateSequence("ButtonOver")
		var_25_10:AnimateSequence("ButtonOver")
		var_25_12:AnimateSequence("ButtonOver")
		var_25_14:AnimateSequence("ButtonOver")
		var_25_16:AnimateSequence("ButtonOver")
	end

	var_25_0._sequences.ButtonOver = var_25_25

	local var_25_26
	local var_25_27 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonUp", var_25_27)

	local var_25_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonUp", var_25_28)

	local var_25_29 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonUp", var_25_29)

	local var_25_30 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonUp", var_25_30)

	local var_25_31 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ButtonUp", var_25_31)

	local function var_25_32()
		var_25_6:AnimateSequence("ButtonUp")
		var_25_8:AnimateSequence("ButtonUp")
		var_25_10:AnimateSequence("ButtonUp")
		var_25_14:AnimateSequence("ButtonUp")
		var_25_16:AnimateSequence("ButtonUp")
	end

	var_25_0._sequences.ButtonUp = var_25_32

	local var_25_33
	local var_25_34 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonOverDisabled", var_25_34)

	local var_25_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOverDisabled", var_25_35)

	local var_25_36 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -30
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonOverDisabled", var_25_36)

	local var_25_37 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonOverDisabled", var_25_37)

	local var_25_38 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonOverDisabled", var_25_38)

	local var_25_39 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ButtonOverDisabled", var_25_39)

	local function var_25_40()
		var_25_6:AnimateSequence("ButtonOverDisabled")
		var_25_8:AnimateSequence("ButtonOverDisabled")
		var_25_10:AnimateSequence("ButtonOverDisabled")
		var_25_12:AnimateSequence("ButtonOverDisabled")
		var_25_14:AnimateSequence("ButtonOverDisabled")
		var_25_16:AnimateSequence("ButtonOverDisabled")
	end

	var_25_0._sequences.ButtonOverDisabled = var_25_40

	local var_25_41
	local var_25_42 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonUpDisabled", var_25_42)

	local var_25_43 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonUpDisabled", var_25_43)

	local var_25_44 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonUpDisabled", var_25_44)

	local var_25_45 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonUpDisabled", var_25_45)

	local var_25_46 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ButtonUpDisabled", var_25_46)

	local function var_25_47()
		var_25_6:AnimateSequence("ButtonUpDisabled")
		var_25_8:AnimateSequence("ButtonUpDisabled")
		var_25_12:AnimateSequence("ButtonUpDisabled")
		var_25_14:AnimateSequence("ButtonUpDisabled")
		var_25_16:AnimateSequence("ButtonUpDisabled")
	end

	var_25_0._sequences.ButtonUpDisabled = var_25_47

	local var_25_48
	local var_25_49 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonOverKBM", var_25_49)

	local var_25_50 = {
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOverKBM", var_25_50)

	local var_25_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonOverKBM", var_25_51)

	local var_25_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonOverKBM", var_25_52)

	local var_25_53 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ButtonOverKBM", var_25_53)

	local function var_25_54()
		var_25_6:AnimateSequence("ButtonOverKBM")
		var_25_8:AnimateSequence("ButtonOverKBM")
		var_25_10:AnimateSequence("ButtonOverKBM")
		var_25_12:AnimateSequence("ButtonOverKBM")
		var_25_16:AnimateSequence("ButtonOverKBM")
	end

	var_25_0._sequences.ButtonOverKBM = var_25_54

	local var_25_55
	local var_25_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_25_56)

	local var_25_57 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_25_57)

	local var_25_58 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonOverDisabledKBM", var_25_58)

	local var_25_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonOverDisabledKBM", var_25_59)

	local var_25_60 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ButtonOverDisabledKBM", var_25_60)

	local function var_25_61()
		var_25_6:AnimateSequence("ButtonOverDisabledKBM")
		var_25_8:AnimateSequence("ButtonOverDisabledKBM")
		var_25_12:AnimateSequence("ButtonOverDisabledKBM")
		var_25_14:AnimateSequence("ButtonOverDisabledKBM")
		var_25_16:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_25_0._sequences.ButtonOverDisabledKBM = var_25_61

	local var_25_62
	local var_25_63 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 350
		}
	}

	var_25_8:RegisterAnimationSequence("AR", var_25_63)

	local var_25_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 120
		}
	}

	var_25_10:RegisterAnimationSequence("AR", var_25_64)

	local var_25_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -394
		}
	}

	var_25_12:RegisterAnimationSequence("AR", var_25_65)

	local var_25_66 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 350
		}
	}

	var_25_14:RegisterAnimationSequence("AR", var_25_66)

	local var_25_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 405
		}
	}

	var_25_16:RegisterAnimationSequence("AR", var_25_67)

	local function var_25_68()
		var_25_8:AnimateSequence("AR")
		var_25_10:AnimateSequence("AR")
		var_25_12:AnimateSequence("AR")
		var_25_14:AnimateSequence("AR")
		var_25_16:AnimateSequence("AR")
	end

	var_25_0._sequences.AR = var_25_68

	local var_25_69
	local var_25_70 = {
		{
			value = -0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOverGlow", var_25_70)

	local function var_25_71()
		var_25_8:AnimateSequence("ButtonOverGlow")
	end

	var_25_0._sequences.ButtonOverGlow = var_25_71

	local var_25_72
	local var_25_73 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOverNoGlow", var_25_73)

	local function var_25_74()
		var_25_8:AnimateSequence("ButtonOverNoGlow")
	end

	var_25_0._sequences.ButtonOverNoGlow = var_25_74

	local var_25_75
	local var_25_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_25_10:RegisterAnimationSequence("Disable", var_25_76)

	local var_25_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_12:RegisterAnimationSequence("Disable", var_25_77)

	local function var_25_78()
		var_25_10:AnimateSequence("Disable")
		var_25_12:AnimateSequence("Disable")
	end

	var_25_0._sequences.Disable = var_25_78

	local var_25_79
	local var_25_80 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		}
	}

	var_25_8:RegisterAnimationSequence("CHT", var_25_80)

	local var_25_81 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		}
	}

	var_25_14:RegisterAnimationSequence("CHT", var_25_81)

	local function var_25_82()
		var_25_8:AnimateSequence("CHT")
		var_25_14:AnimateSequence("CHT")
	end

	var_25_0._sequences.CHT = var_25_82

	var_25_0:addEventHandler("disable", function(arg_38_0, arg_38_1)
		if not arg_38_1.controller then
			local var_38_0 = var_25_1
		end

		ACTIONS.AnimateSequence(var_25_0, "Disable")
	end)
	var_0_12(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("QuickPlayButton", QuickPlayButton)
LockTable(_M)
