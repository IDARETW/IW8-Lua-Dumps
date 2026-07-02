module(..., package.seeall)

local var_0_0 = 16 * _1080p
local var_0_1 = {
	Full = 2,
	Mini = 1,
	None = 0
}

local function var_0_2(arg_1_0, arg_1_1)
	arg_1_0._isNew = arg_1_1
end

local function var_0_3(arg_2_0)
	if arg_2_0._isButtonEnabled and arg_2_0._isNew then
		ACTIONS.AnimateSequence(arg_2_0, "NewUp")

		arg_2_0._isNewShown = true
	else
		ACTIONS.AnimateSequence(arg_2_0, "NewHide")

		arg_2_0._isNewShown = false
	end
end

local function var_0_4(arg_3_0)
	local var_3_0 = {
		{
			isUsed = false,
			icon = arg_3_0.ModifierIcon1
		},
		{
			isUsed = false,
			icon = arg_3_0.ModifierIcon2
		},
		{
			isUsed = false,
			icon = arg_3_0.ModifierIcon3
		},
		{
			isUsed = false,
			icon = arg_3_0.ModifierIcon4
		}
	}

	local function var_3_1()
		for iter_4_0 = 1, #var_3_0 do
			if not var_3_0[iter_4_0].isUsed then
				var_3_0[iter_4_0].isUsed = true

				local var_4_0 = var_3_0[iter_4_0].icon

				var_4_0:SetAlpha(1)

				return var_4_0
			end
		end
	end

	local function var_3_2(arg_5_0, arg_5_1)
		if arg_5_0:GetValue(arg_3_0._controllerIndex) > 1 or CONDITIONS.IsPSDoubleXPActive() then
			var_3_1():setImage(RegisterMaterial(arg_5_1))
		end
	end

	local var_3_3 = arg_3_0:GetDataSource()

	if arg_3_0._isDataSourceValid and var_3_3 then
		var_3_2(var_3_3.xpScale, "icon_double_xp_mini")
		var_3_2(var_3_3.weaponXpScale, "icon_double_weapon_xp_mini")
		var_3_2(var_3_3.battlePassXpScale, "icon_double_battle_xp_mini")
		var_3_2(var_3_3.operatorXpScale, "icon_double_operator_xp_mini")
		PlaylistUtils.UpdatePlaylistRestrictionVisualsViaDataSource(arg_3_0, arg_3_0._controllerIndex, {
			playlistDataSource = var_3_3
		})
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	assert(arg_6_0.Description)

	arg_6_0._isLimitedTime = arg_6_0:GetDataSource().isLimitedTime:GetValue(arg_6_1)

	local var_6_0 = arg_6_0:GetDataSource().desc:GetValue(arg_6_1)

	if LUI.IsLastInputMouseNavigation(arg_6_1) and arg_6_0._isLimitedTime then
		local var_6_1 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME")
		local var_6_2 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME_DESC", Engine.JCBDICCAH(var_6_1), Engine.JCBDICCAH(var_6_0))
	end

	if arg_6_0._isDataSourceValid then
		arg_6_0:UpdateModifiers()
	end
end

local function var_0_6(arg_7_0, arg_7_1)
	if not arg_7_0._isLimitedTime then
		arg_7_0.LimitedTimeIcon:SetAlpha(0)
		arg_7_0.LimitedTimeNotification:SetAlpha(0)

		return
	end

	if arg_7_1 == var_0_1.Mini then
		arg_7_0.LimitedTimeIcon:SetAlpha(0.6, 300)
		ACTIONS.AnimateSequence(arg_7_0, IsLanguageArabic() and "ModUpAR" or "ModUp")
		arg_7_0.LimitedTimeNotification:SetAlpha(0)
	elseif arg_7_1 == var_0_1.Full then
		arg_7_0.LimitedTimeNotification:SetAlpha(1, 500)
		ACTIONS.AnimateSequence(arg_7_0, IsLanguageArabic() and "ModOverLimitedAR" or "ModOverLimited")
		arg_7_0.LimitedTimeIcon:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_7_0.LimitedTimeNotification, "ARShowIcon")
		else
			ACTIONS.AnimateSequence(arg_7_0.LimitedTimeNotification, "ShowIcon")
		end
	end
end

local function var_0_7(arg_8_0)
	arg_8_0._isDataSourceValid = true

	arg_8_0:UpdateModifiers()
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_2 then
		arg_9_0.WarningIcon:SetAlpha(0)
		arg_9_0.WarningText:SetAlpha(0)

		if arg_9_0._isDataSourceValid then
			arg_9_0:UpdateModifiers()
		end

		return
	end

	local var_9_0 = arg_9_0:GetDataSource()

	if var_9_0 and PlaylistUtils.DoesPlaylistRequireSquadFill(arg_9_1, var_9_0) then
		arg_9_0.WarningIcon:SetAlpha(1)
		arg_9_0.WarningText:SetAlpha(1)
		arg_9_0.ModifierIcon1:SetAlpha(0)
		arg_9_0.ModifierIcon2:SetAlpha(0)
		arg_9_0.ModifierIcon3:SetAlpha(0)
	else
		arg_9_0.WarningIcon:SetAlpha(0)
		arg_9_0.WarningText:SetAlpha(0)
		arg_9_0:UpdateModifiers()
	end
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0._isCategoryButton and (not arg_10_2 or not arg_10_2.ignoreFocus) then
		arg_10_0.Background:processEvent({
			name = "gain_focus"
		})
	end

	arg_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, PlaylistUtils.BUTTON_EXPAND_BOTTOM_SIZE * _1080p, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)

	arg_10_0._isFocused = true

	var_0_5(arg_10_0, arg_10_1)
	ACTIONS.AnimateSequence(arg_10_0, "ButtonOver")

	if arg_10_0._isNewShown and not arg_10_0._isLimitedTime then
		ACTIONS.AnimateSequence(arg_10_0, "NewOver")
	end

	ACTIONS.AnimateSequence(arg_10_0, IsLanguageArabic() and "ModOverNewAR" or "ModOverNew")
	LAYOUT.ToggleFontOnFocusEvent(arg_10_0.GamemodeName, {
		isFocused = arg_10_0._isFocused
	})
	var_0_6(arg_10_0, var_0_1.Full)
	var_0_8(arg_10_0, arg_10_1)
end

local function var_0_10(arg_11_0)
	arg_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, PlaylistUtils.BUTTON_COLLAPSE_BOTTOM_SIZE * _1080p, PlaylistUtils.BUTTON_EXPAND_COLLAPSE_DURATION)
	ACTIONS.AnimateSequence(arg_11_0, "ButtonUp")
	arg_11_0.Background:AnimateQuickplayBgButtonUp()

	arg_11_0._isFocused = false

	if arg_11_0._isNewShown then
		ACTIONS.AnimateSequence(arg_11_0, "NewUp")
	end

	ACTIONS.AnimateSequence(arg_11_0, IsLanguageArabic() and "ModUpAR" or "ModUp")
	LAYOUT.ToggleFontOnFocusEvent(arg_11_0.GamemodeName, {
		isFocused = arg_11_0._isFocused
	})
	var_0_6(arg_11_0, var_0_1.Mini)
	var_0_8(arg_11_0, arg_11_0._controllerIndex, true)
end

local function var_0_11(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._controllerIndex = arg_12_1
	arg_12_0._isCategoryButton = false
	arg_12_0.UpdateBreadcrumb = var_0_3
	arg_12_0.UpdateModifiers = var_0_4
	arg_12_0.OnDataSourceAssigned = var_0_7
	arg_12_0.ForceButtonOver = var_0_9
	arg_12_0.OnButtonLoseFocus = var_0_10
	arg_12_0._isNew = false
	arg_12_0.SetNew = var_0_2
	arg_12_0._isButtonEnabled = true

	var_0_8(arg_12_0, arg_12_1, true)

	if arg_12_2.alternateBkgMask and arg_12_2.index then
		local var_12_0 = arg_12_2.index

		if var_12_0 > THEMES.VANGUARD_MASK_SEED then
			var_12_0 = math.random(1, THEMES.VANGUARD_MASK_SEED)
		end

		if arg_12_0._sequences["MaskState" .. var_12_0] then
			ACTIONS.AnimateSequence(arg_12_0, "MaskState" .. var_12_0)
		end
	end

	arg_12_0:SetMask(arg_12_0.Mask)
	arg_12_0:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		if arg_12_0._isCategoryButton then
			return
		end

		local var_13_0 = arg_12_0:GetDataSource()

		if var_13_0 and var_13_0.categoryIndex then
			local var_13_1 = var_13_0.categoryIndex:GetValue(arg_12_1)
			local var_13_2 = var_13_0.playlistIndex:GetValue(arg_12_1)

			if var_13_1 ~= nil and var_13_2 ~= nil then
				local var_13_3 = Playlist.DCFCIFABGH(var_13_1, var_13_2)
				local var_13_4 = var_13_3 == Lobby.PlaylistLockState.UNLOCKED
				local var_13_5 = var_13_0.maxPlayerSize:GetValue(arg_12_1)
				local var_13_6 = Dvar.CFHDGABACF("MTTRPNMPRP")

				local function var_13_7(arg_14_0)
					local function var_14_0()
						if PlaylistUtils.DoesPlaylistRequireSquadFill(arg_14_0, var_13_0) then
							Lobby.ForceEnableFill(arg_12_0, arg_14_0)
						end

						if Playlist.CDBBECIGIG(var_13_1, var_13_2) then
							LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_13_1.controller, false, {
								openFromPlaylist = true
							})
						end
					end

					if PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(arg_12_0, arg_14_0, var_13_0, var_14_0) then
						-- block empty
					elseif PlaylistUtils.DoesPlaylistRequireScareWarning(arg_14_0, var_13_0) then
						LUI.FlowManager.RequestPopupMenu(nil, "PlaylistScareWarningPopup", true, arg_14_0, false, {
							onAccept = var_14_0,
							controllerIndex = arg_14_0
						})
					else
						var_14_0()
					end
				end

				local function var_13_8()
					Lobby.TryNavigateToLobby(function()
						local var_17_0 = PlaylistUtils.DoesPlaylistContainGameType(arg_12_1, var_13_0, MP.GameMode.BRTDMGameType)
						local var_17_1 = PlaylistUtils.DoesPlaylistContainGameType(arg_12_1, var_13_0, MP.GameMode.TruckWarGameType)
						local var_17_2 = PlaylistUtils.DoesPlaylistContainGameType(arg_12_1, var_13_0, MP.GameMode.MPZombiesGameType)
						local var_17_3 = PlaylistUtils.DoesPlaylistContainGameTypeInList(arg_12_1, var_13_0, {
							MP.GameMode.RebirthDuo,
							MP.GameMode.RebirthTrio,
							MP.GameMode.RebirthQuad
						})

						if not Onboarding.GamemodeTDMAnywhere.WasCompleted(arg_12_0, arg_12_1) and var_17_0 then
							LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingTDMAnywhereData(var_13_7))
							Onboarding.GamemodeTDMAnywhere.MarkCompleted(arg_12_0, arg_12_1)
						elseif not Onboarding.GamemodeArmoredRoyale.WasCompleted(arg_12_0, arg_12_1) and var_17_1 then
							LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingArmoredRoyaleData(var_13_7))
							Onboarding.GamemodeArmoredRoyale.MarkCompleted(arg_12_0, arg_12_1)
						elseif not Onboarding.GamemodeZombiesBR.WasCompleted(arg_12_0, arg_12_1) and var_17_2 then
							LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingZombiesBRData(var_13_7))
							Onboarding.GamemodeZombiesBR.MarkCompleted(arg_12_0, arg_12_1)
						elseif not Onboarding.Rebirth.WasCompleted(arg_12_0, arg_12_1) and var_17_3 then
							LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingRebirthOnboardingData(var_13_7))
							Onboarding.Rebirth.MarkCompleted(arg_12_0, arg_12_1)
						else
							var_13_7(arg_12_1)
						end
					end)
				end

				local var_13_9 = Playlist.DEJGAECIBG(var_13_2, var_13_1)

				if not var_13_4 and var_13_3 == Lobby.PlaylistLockState.LOCKED_FORCE_LOCK then
					local var_13_10 = {}

					table.insert(var_13_10, var_13_0)
				elseif not var_13_4 and var_13_3 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					local var_13_11 = {}

					table.insert(var_13_11, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						invalidPlaylists = var_13_11
					})
				elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_13_0, arg_12_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_12_1, false, {
						isSplitScreenWarning = true,
						controllerIndex = arg_12_1,
						text = var_13_0.name:GetValue(arg_12_1)
					})
				elseif not Engine.FIDIEBFAG(arg_12_1) and var_13_6 <= var_13_5 then
					local var_13_12 = {
						controllerIndex = arg_12_1,
						onAccept = var_13_8,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_12_1, false, var_13_12)
				elseif var_13_9 and Engine.JACCCCEDI() then
					local var_13_13 = {}

					table.insert(var_13_13, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						premium = true,
						invalidPlaylists = var_13_13
					})
				elseif var_13_9 and not Engine.HBIAGEFCC() then
					local var_13_14 = {}

					table.insert(var_13_14, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						subscription = true,
						invalidPlaylists = var_13_14
					})
				else
					var_13_8()
				end
			end
		end
	end)
	ACTIONS.AnimateSequence(arg_12_0, "Modifiers")
	arg_12_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		arg_12_0:ForceButtonOver(arg_12_1)
	end)
	arg_12_0:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
		arg_12_0._isFocused = true

		var_0_5(arg_12_0, arg_12_1)

		if arg_19_0._isForceLocked then
			arg_19_0.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_PLAYLIST_LOCKED"))
		end

		ACTIONS.AnimateSequence(arg_19_0, arg_19_0._isForceLocked == true and "ButtonOverDisabledWithDesc" or "ButtonOverDisabled")

		if arg_12_0._isNewShown and not arg_12_0._isLimitedTime then
			ACTIONS.AnimateSequence(arg_12_0, "NewOver")
		end

		LAYOUT.ToggleFontOnFocusEvent(arg_12_0.GamemodeName, {
			isFocused = arg_12_0._isFocused
		})
		var_0_6(arg_19_0, var_0_1.Full)
		var_0_8(arg_12_0, arg_12_1, true)
	end)
	arg_12_0:addEventHandler("button_up", function(arg_20_0, arg_20_1)
		var_0_10(arg_12_0)
	end)
	arg_12_0:addEventHandler("button_disable", function(arg_21_0, arg_21_1)
		arg_12_0._isFocused = false

		ACTIONS.AnimateSequence(arg_21_0, arg_21_0._isForceLocked == true and "ButtonUpDisabledWithDesc" or "ButtonUpDisabled")

		if arg_12_0._isNewShown then
			ACTIONS.AnimateSequence(arg_12_0, "NewUp")
		end

		LAYOUT.ToggleFontOnFocusEvent(arg_12_0.GamemodeName, {
			isFocused = arg_12_0._isFocused
		})

		arg_12_0._isButtonEnabled = false

		arg_12_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_12_0, "Disabled")
		var_0_6(arg_21_0, var_0_1.Mini)
		var_0_8(arg_12_0, arg_12_1, true)

		if arg_12_0._isDataSourceValid then
			arg_12_0:UpdateModifiers()
		end
	end)
	arg_12_0:addEventHandler("enable", function(arg_22_0, arg_22_1)
		arg_12_0._isButtonEnabled = true

		arg_12_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_12_0, "Enabled")

		if arg_12_0._isDataSourceValid then
			arg_12_0:UpdateModifiers()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_12_0, "AR")
	else
		arg_12_0.NewItemNotification:SetupRightAlignment()
	end

	arg_12_0:SubscribeToModelThroughElement(arg_12_0, "isLimitedTime", function()
		arg_12_0._isLimitedTime = arg_12_0:GetDataSource().isLimitedTime:GetValue(arg_12_1)

		local var_23_0 = arg_12_0.LimitedTimeIcon
		local var_23_1 = 0.6

		if arg_12_0._isLimitedTime then
			var_23_0:SetAlpha(var_23_1, 500)
		else
			var_23_0:SetAlpha(0)
		end
	end)
	arg_12_0.Description:SubscribeToModelThroughElement(arg_12_0, "desc", function()
		if not arg_12_0._isCategoryButton then
			local var_24_0 = arg_12_0:GetDataSource().desc:GetValue(arg_12_1)

			if var_24_0 ~= nil then
				arg_12_0.Description:setText(var_24_0)
				var_0_5(arg_12_0, arg_12_1)
			end
		end
	end)
	arg_12_0.GamemodeName:SubscribeToModelThroughElement(arg_12_0, "name", function()
		if not arg_12_0._isCategoryButton then
			local var_25_0 = arg_12_0:GetDataSource().name:GetValue(arg_12_1)

			if var_25_0 ~= nil then
				arg_12_0.GamemodeName:setText(ToUpperCase(var_25_0))
			end
		end
	end)
	ACTIONS.AnimateSequence(arg_12_0, "ButtonUp")
	arg_12_0.Background:AnimateQuickplayBgButtonUp()
end

function BRFeatureButton(arg_26_0, arg_26_1)
	local var_26_0 = LUI.UIButton.new()

	var_26_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 154 * _1080p)

	var_26_0.id = "BRFeatureButton"
	var_26_0._animationSets = var_26_0._animationSets or {}
	var_26_0._sequences = var_26_0._sequences or {}

	local var_26_1 = arg_26_1 and arg_26_1.controllerIndex

	if not var_26_1 and not Engine.DDJFBBJAIG() then
		var_26_1 = var_26_0:getRootController()
	end

	assert(var_26_1)

	local var_26_2 = var_26_0
	local var_26_3
	local var_26_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_26_1
	})

	var_26_4.id = "Background"

	var_26_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_26_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 3, _1080p * -3)
	var_26_0:addElement(var_26_4)

	var_26_0.Background = var_26_4

	local var_26_5
	local var_26_6 = LUI.UIImage.new()

	var_26_6.id = "Mask"

	var_26_6:SetZRotation(180, 0)
	var_26_6:setImage(RegisterMaterial("ui_mp_wz_bkg_button_1"), 0)
	var_26_6:Setup9SliceImage(_1080p * 100, _1080p * 50, 0.15, 0.3)
	var_26_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_26_0:addElement(var_26_6)

	var_26_0.Mask = var_26_6

	local var_26_7
	local var_26_8 = LUI.UIStyledText.new()

	var_26_8.id = "GamemodeName"

	var_26_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_26_8:setText(ToUpperCase(""), 0)
	var_26_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_8:SetWordWrap(false)
	var_26_8:SetAlignment(LUI.Alignment.Left)
	var_26_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_26_8:SetStartupDelay(2000)
	var_26_8:SetLineHoldTime(400)
	var_26_8:SetAnimMoveTime(2000)
	var_26_8:SetAnimMoveSpeed(150)
	var_26_8:SetEndDelay(2000)
	var_26_8:SetCrossfadeTime(250)
	var_26_8:SetFadeInTime(300)
	var_26_8:SetFadeOutTime(300)
	var_26_8:SetMaxVisibleLines(1)
	var_26_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 11, _1080p * -11, _1080p * 7, _1080p * 37)
	var_26_0:addElement(var_26_8)

	var_26_0.GamemodeName = var_26_8

	local var_26_9
	local var_26_10 = LUI.UIImage.new()

	var_26_10.id = "NewItemOverlay"

	var_26_10:SetRGBFromInt(65290, 0)
	var_26_10:SetAlpha(0, 0)
	var_26_10:setImage(RegisterMaterial("icon_new_pulse"), 0)
	var_26_0:addElement(var_26_10)

	var_26_0.NewItemOverlay = var_26_10

	local var_26_11
	local var_26_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_26_1
	})

	var_26_12.id = "NewItemSmallIcon"

	var_26_12:SetAlpha(0, 0)
	var_26_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 405, _1080p * 413, _1080p * 13, _1080p * 21)
	var_26_0:addElement(var_26_12)

	var_26_0.NewItemSmallIcon = var_26_12

	local var_26_13
	local var_26_14 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_26_1
	})

	var_26_14.id = "NewItemNotification"

	var_26_14:SetAlpha(0, 0)
	var_26_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 341, _1080p * 419, _1080p * 7, _1080p * 37)
	var_26_0:addElement(var_26_14)

	var_26_0.NewItemNotification = var_26_14

	local var_26_15
	local var_26_16 = LUI.UIImage.new()

	var_26_16.id = "Lock"

	var_26_16:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_26_16:SetAlpha(0, 0)
	var_26_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_26_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -33, _1080p * -9, _1080p * -33, _1080p * -9)
	var_26_0:addElement(var_26_16)

	var_26_0.Lock = var_26_16

	local var_26_17
	local var_26_18 = LUI.UIStyledText.new()

	var_26_18.id = "Description"

	var_26_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_26_18:SetAlpha(0, 0)
	var_26_18:setText("", 0)
	var_26_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_18:SetAlignment(LUI.Alignment.Left)
	var_26_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_26_18:SetStartupDelay(2000)
	var_26_18:SetLineHoldTime(2000)
	var_26_18:SetAnimMoveTime(1000)
	var_26_18:SetAnimMoveSpeed(150)
	var_26_18:SetEndDelay(2000)
	var_26_18:SetCrossfadeTime(1000)
	var_26_18:SetFadeInTime(300)
	var_26_18:SetFadeOutTime(300)
	var_26_18:SetMaxVisibleLines(2)
	var_26_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 289, _1080p * 37, _1080p * 57)
	var_26_0:addElement(var_26_18)

	var_26_0.Description = var_26_18

	local var_26_19
	local var_26_20 = LUI.UIImage.new()

	var_26_20.id = "Backer"

	var_26_20:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_26_20:SetAlpha(0, 0)
	var_26_20:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -52, _1080p * -16)
	var_26_0:addElement(var_26_20)

	var_26_0.Backer = var_26_20

	local var_26_21
	local var_26_22 = LUI.UIStyledText.new()

	var_26_22.id = "DisabledText"

	var_26_22:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_26_22:SetAlpha(0, 0)
	var_26_22:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_26_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_22:SetWordWrap(false)
	var_26_22:SetAlignment(LUI.Alignment.Left)
	var_26_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_26_22:SetStartupDelay(2000)
	var_26_22:SetLineHoldTime(400)
	var_26_22:SetAnimMoveTime(2000)
	var_26_22:SetAnimMoveSpeed(150)
	var_26_22:SetEndDelay(2000)
	var_26_22:SetCrossfadeTime(1000)
	var_26_22:SetFadeInTime(300)
	var_26_22:SetFadeOutTime(300)
	var_26_22:SetMaxVisibleLines(1)
	var_26_22:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 19, _1080p * 376, _1080p * -45, _1080p * -25)
	var_26_0:addElement(var_26_22)

	var_26_0.DisabledText = var_26_22

	local var_26_23
	local var_26_24 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_26_1
	})

	var_26_24.id = "LimitedTimeNotification"

	var_26_24:SetAlpha(0, 0)
	var_26_24:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -167, _1080p * -11, _1080p * -42, _1080p * -12)
	var_26_0:addElement(var_26_24)

	var_26_0.LimitedTimeNotification = var_26_24

	local var_26_25
	local var_26_26 = LUI.UIImage.new()

	var_26_26.id = "LimitedTimeIcon"

	var_26_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_26:SetAlpha(0, 0)
	var_26_26:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_26_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 397, _1080p * 421, _1080p * 30, _1080p * 54)
	var_26_0:addElement(var_26_26)

	var_26_0.LimitedTimeIcon = var_26_26

	local var_26_27
	local var_26_28 = LUI.UIImage.new()

	var_26_28.id = "ModifierIcon1"

	var_26_28:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_28:SetAlpha(0, 0)
	var_26_28:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_26_28:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 350, _1080p * 385, _1080p * -45, _1080p * -10)
	var_26_0:addElement(var_26_28)

	var_26_0.ModifierIcon1 = var_26_28

	local var_26_29
	local var_26_30 = LUI.UIImage.new()

	var_26_30.id = "ModifierIcon2"

	var_26_30:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_30:SetAlpha(0, 0)
	var_26_30:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_26_30:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 310, _1080p * 345, _1080p * -45, _1080p * -10)
	var_26_0:addElement(var_26_30)

	var_26_0.ModifierIcon2 = var_26_30

	local var_26_31
	local var_26_32 = LUI.UIImage.new()

	var_26_32.id = "ModifierIcon3"

	var_26_32:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_32:SetAlpha(0, 0)
	var_26_32:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_26_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 270, _1080p * 305, _1080p * -45, _1080p * -10)
	var_26_0:addElement(var_26_32)

	var_26_0.ModifierIcon3 = var_26_32

	local var_26_33
	local var_26_34 = LUI.UIImage.new()

	var_26_34.id = "ModifierIcon4"

	var_26_34:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_34:SetAlpha(0, 0)
	var_26_34:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_26_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 230, _1080p * 265, _1080p * -45, _1080p * -10)
	var_26_0:addElement(var_26_34)

	var_26_0.ModifierIcon4 = var_26_34

	local var_26_35
	local var_26_36 = LUI.UIImage.new()

	var_26_36.id = "WarningIcon"

	var_26_36:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_26_36:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 5, _1080p * 41, _1080p * -65, _1080p * -29)
	var_26_0:addElement(var_26_36)

	var_26_0.WarningIcon = var_26_36

	local var_26_37
	local var_26_38 = LUI.UIStyledText.new()

	var_26_38.id = "WarningText"

	var_26_38:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_26_38:SetAlpha(0.8, 0)
	var_26_38:setText(Engine.CBBHFCGDIC("LUA_MENU/SQUAD_FILL_REQUIRED"), 0)
	var_26_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_38:SetWordWrap(false)
	var_26_38:SetAlignment(LUI.Alignment.Left)
	var_26_38:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_26_38:SetStartupDelay(2000)
	var_26_38:SetLineHoldTime(400)
	var_26_38:SetAnimMoveTime(2000)
	var_26_38:SetAnimMoveSpeed(150)
	var_26_38:SetEndDelay(2000)
	var_26_38:SetCrossfadeTime(250)
	var_26_38:SetFadeInTime(300)
	var_26_38:SetFadeOutTime(300)
	var_26_38:SetMaxVisibleLines(1)
	var_26_38:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 43, _1080p * 234, _1080p * -59, _1080p * -35)
	var_26_0:addElement(var_26_38)

	var_26_0.WarningText = var_26_38

	local var_26_39

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_26_39 = LUI.UIImage.new()
		var_26_39.id = "HighlightTop"

		var_26_39:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_26_39:SetAlpha(0, 0)
		var_26_39:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_26_39:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 3, _1080p * 5)
		var_26_0:addElement(var_26_39)

		var_26_0.HighlightTop = var_26_39
	end

	local var_26_40

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_26_40 = LUI.UIImage.new()
		var_26_40.id = "HighlightBottom"

		var_26_40:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_26_40:SetAlpha(0, 0)
		var_26_40:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_26_40:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -5, _1080p * -3)
		var_26_0:addElement(var_26_40)

		var_26_0.HighlightBottom = var_26_40
	end

	local var_26_41
	local var_26_42 = LUI.UIImage.new()

	var_26_42.id = "PlaylistRestrictionIcon"

	var_26_42:SetAlpha(0, 0)
	var_26_42:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_26_42:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 11, _1080p * 43, _1080p * -41, _1080p * -9)
	var_26_0:addElement(var_26_42)

	var_26_0.PlaylistRestrictionIcon = var_26_42

	local var_26_43
	local var_26_44 = LUI.UIImage.new()

	var_26_44.id = "PlaylistRestrictionHighlightBottom"

	var_26_44:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_26_44:SetAlpha(0, 0)
	var_26_44:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_26_44:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -5, _1080p * -3)
	var_26_0:addElement(var_26_44)

	var_26_0.PlaylistRestrictionHighlightBottom = var_26_44

	local var_26_45
	local var_26_46 = LUI.UIImage.new()

	var_26_46.id = "PlaylistRestrictionHighlightTop"

	var_26_46:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_26_46:SetAlpha(0, 0)
	var_26_46:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_26_46:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 3, _1080p * 5)
	var_26_0:addElement(var_26_46)

	var_26_0.PlaylistRestrictionHighlightTop = var_26_46

	local var_26_47
	local var_26_48 = LUI.UIImage.new()

	var_26_48.id = "PlaylistRestrictionHighlightBottomGlow"

	var_26_48:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_26_48:SetAlpha(0, 0)
	var_26_48:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_26_48:SetVMin(1, 0)
	var_26_48:SetVMax(0, 0)
	var_26_48:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -87, _1080p * -2)
	var_26_0:addElement(var_26_48)

	var_26_0.PlaylistRestrictionHighlightBottomGlow = var_26_48

	local function var_26_49()
		return
	end

	var_26_0._sequences.DefaultSequence = var_26_49

	local var_26_50
	local var_26_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_16:RegisterAnimationSequence("Disabled", var_26_51)

	local function var_26_52()
		var_26_16:AnimateSequence("Disabled")
	end

	var_26_0._sequences.Disabled = var_26_52

	local function var_26_53()
		return
	end

	var_26_0._sequences.DisabledAR = var_26_53

	local var_26_54
	local var_26_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_16:RegisterAnimationSequence("Enabled", var_26_55)

	local function var_26_56()
		var_26_16:AnimateSequence("Enabled")
	end

	var_26_0._sequences.Enabled = var_26_56

	local function var_26_57()
		return
	end

	var_26_0._sequences.EnabledAR = var_26_57

	local var_26_58
	local var_26_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		}
	}

	var_26_8:RegisterAnimationSequence("AR", var_26_59)

	local var_26_60 = {
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
			value = _1080p * -413
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -405
		}
	}

	var_26_12:RegisterAnimationSequence("AR", var_26_60)

	local var_26_61 = {
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
			value = _1080p * -419
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -341
		}
	}

	var_26_14:RegisterAnimationSequence("AR", var_26_61)

	local var_26_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		}
	}

	var_26_16:RegisterAnimationSequence("AR", var_26_62)

	local var_26_63 = {
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
			value = _1080p * -336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		}
	}

	var_26_18:RegisterAnimationSequence("AR", var_26_63)

	local var_26_64 = {
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
			value = _1080p * -376
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		}
	}

	var_26_22:RegisterAnimationSequence("AR", var_26_64)

	local var_26_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -269
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -58
		}
	}

	var_26_24:RegisterAnimationSequence("AR", var_26_65)

	local var_26_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("AR", var_26_66)

	local var_26_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 80
		}
	}

	var_26_28:RegisterAnimationSequence("AR", var_26_67)

	local var_26_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 120
		}
	}

	var_26_30:RegisterAnimationSequence("AR", var_26_68)

	local var_26_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		}
	}

	var_26_32:RegisterAnimationSequence("AR", var_26_69)

	local var_26_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40
		}
	}

	var_26_34:RegisterAnimationSequence("AR", var_26_70)

	local var_26_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_26_36:RegisterAnimationSequence("AR", var_26_71)

	local var_26_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 182
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 373
		}
	}

	var_26_38:RegisterAnimationSequence("AR", var_26_72)

	local function var_26_73()
		var_26_8:AnimateSequence("AR")
		var_26_12:AnimateSequence("AR")
		var_26_14:AnimateSequence("AR")
		var_26_16:AnimateSequence("AR")
		var_26_18:AnimateSequence("AR")
		var_26_22:AnimateSequence("AR")
		var_26_24:AnimateSequence("AR")
		var_26_26:AnimateSequence("AR")
		var_26_28:AnimateSequence("AR")
		var_26_30:AnimateSequence("AR")
		var_26_32:AnimateSequence("AR")
		var_26_34:AnimateSequence("AR")
		var_26_36:AnimateSequence("AR")
		var_26_38:AnimateSequence("AR")
	end

	var_26_0._sequences.AR = var_26_73

	local var_26_74
	local var_26_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_26_28:RegisterAnimationSequence("Modifiers", var_26_75)

	local var_26_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_26_30:RegisterAnimationSequence("Modifiers", var_26_76)

	local var_26_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_26_32:RegisterAnimationSequence("Modifiers", var_26_77)

	local var_26_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_26_34:RegisterAnimationSequence("Modifiers", var_26_78)

	local function var_26_79()
		var_26_28:AnimateSequence("Modifiers")
		var_26_30:AnimateSequence("Modifiers")
		var_26_32:AnimateSequence("Modifiers")
		var_26_34:AnimateSequence("Modifiers")
	end

	var_26_0._sequences.Modifiers = var_26_79

	local var_26_80
	local var_26_81 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOver", var_26_81)

	local var_26_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_16:RegisterAnimationSequence("ButtonOver", var_26_82)

	local var_26_83 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonOver", var_26_83)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_84 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonOver", var_26_84)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_85 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonOver", var_26_85)
	end

	local function var_26_86()
		var_26_8:AnimateSequence("ButtonOver")
		var_26_16:AnimateSequence("ButtonOver")
		var_26_18:AnimateSequence("ButtonOver")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonOver")
		end
	end

	var_26_0._sequences.ButtonOver = var_26_86

	local var_26_87
	local var_26_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverKBM", var_26_88)

	local var_26_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonOverKBM", var_26_89)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_90 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonOverKBM", var_26_90)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_91 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonOverKBM", var_26_91)
	end

	local function var_26_92()
		var_26_8:AnimateSequence("ButtonOverKBM")
		var_26_18:AnimateSequence("ButtonOverKBM")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonOverKBM")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonOverKBM")
		end
	end

	var_26_0._sequences.ButtonOverKBM = var_26_92

	local var_26_93
	local var_26_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		}
	}

	var_26_28:RegisterAnimationSequence("ModOverLimited", var_26_94)

	local var_26_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 205
		}
	}

	var_26_30:RegisterAnimationSequence("ModOverLimited", var_26_95)

	local var_26_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 165
		}
	}

	var_26_32:RegisterAnimationSequence("ModOverLimited", var_26_96)

	local var_26_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 125
		}
	}

	var_26_34:RegisterAnimationSequence("ModOverLimited", var_26_97)

	local function var_26_98()
		var_26_28:AnimateSequence("ModOverLimited")
		var_26_30:AnimateSequence("ModOverLimited")
		var_26_32:AnimateSequence("ModOverLimited")
		var_26_34:AnimateSequence("ModOverLimited")
	end

	var_26_0._sequences.ModOverLimited = var_26_98

	local var_26_99
	local var_26_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 355
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 390
		}
	}

	var_26_28:RegisterAnimationSequence("ModOverNew", var_26_100)

	local var_26_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 350
		}
	}

	var_26_30:RegisterAnimationSequence("ModOverNew", var_26_101)

	local var_26_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 275
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 310
		}
	}

	var_26_32:RegisterAnimationSequence("ModOverNew", var_26_102)

	local var_26_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 270
		}
	}

	var_26_34:RegisterAnimationSequence("ModOverNew", var_26_103)

	local function var_26_104()
		var_26_28:AnimateSequence("ModOverNew")
		var_26_30:AnimateSequence("ModOverNew")
		var_26_32:AnimateSequence("ModOverNew")
		var_26_34:AnimateSequence("ModOverNew")
	end

	var_26_0._sequences.ModOverNew = var_26_104

	local var_26_105
	local var_26_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 380
		}
	}

	var_26_28:RegisterAnimationSequence("ModUp", var_26_106)

	local var_26_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		}
	}

	var_26_30:RegisterAnimationSequence("ModUp", var_26_107)

	local var_26_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 300
		}
	}

	var_26_32:RegisterAnimationSequence("ModUp", var_26_108)

	local var_26_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 225
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_26_34:RegisterAnimationSequence("ModUp", var_26_109)

	local function var_26_110()
		var_26_28:AnimateSequence("ModUp")
		var_26_30:AnimateSequence("ModUp")
		var_26_32:AnimateSequence("ModUp")
		var_26_34:AnimateSequence("ModUp")
	end

	var_26_0._sequences.ModUp = var_26_110

	local var_26_111
	local var_26_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 195
		}
	}

	var_26_28:RegisterAnimationSequence("ModOverLimitedAR", var_26_112)

	local var_26_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 235
		}
	}

	var_26_30:RegisterAnimationSequence("ModOverLimitedAR", var_26_113)

	local var_26_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 275
		}
	}

	var_26_32:RegisterAnimationSequence("ModOverLimitedAR", var_26_114)

	local var_26_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 155
		}
	}

	var_26_34:RegisterAnimationSequence("ModOverLimitedAR", var_26_115)

	local function var_26_116()
		var_26_28:AnimateSequence("ModOverLimitedAR")
		var_26_30:AnimateSequence("ModOverLimitedAR")
		var_26_32:AnimateSequence("ModOverLimitedAR")
		var_26_34:AnimateSequence("ModOverLimitedAR")
	end

	var_26_0._sequences.ModOverLimitedAR = var_26_116

	local var_26_117
	local var_26_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 267
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 302
		}
	}

	var_26_28:RegisterAnimationSequence("ModOverNewAR", var_26_118)

	local var_26_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 307
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 342
		}
	}

	var_26_30:RegisterAnimationSequence("ModOverNewAR", var_26_119)

	local var_26_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 347
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 382
		}
	}

	var_26_32:RegisterAnimationSequence("ModOverNewAR", var_26_120)

	local var_26_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 262
		}
	}

	var_26_34:RegisterAnimationSequence("ModOverNewAR", var_26_121)

	local function var_26_122()
		var_26_28:AnimateSequence("ModOverNewAR")
		var_26_30:AnimateSequence("ModOverNewAR")
		var_26_32:AnimateSequence("ModOverNewAR")
		var_26_34:AnimateSequence("ModOverNewAR")
	end

	var_26_0._sequences.ModOverNewAR = var_26_122

	local var_26_123
	local var_26_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 80
		}
	}

	var_26_28:RegisterAnimationSequence("ModUpAR", var_26_124)

	local var_26_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 120
		}
	}

	var_26_30:RegisterAnimationSequence("ModUpAR", var_26_125)

	local var_26_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		}
	}

	var_26_32:RegisterAnimationSequence("ModUpAR", var_26_126)

	local var_26_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40
		}
	}

	var_26_34:RegisterAnimationSequence("ModUpAR", var_26_127)

	local function var_26_128()
		var_26_28:AnimateSequence("ModUpAR")
		var_26_30:AnimateSequence("ModUpAR")
		var_26_32:AnimateSequence("ModUpAR")
		var_26_34:AnimateSequence("ModUpAR")
	end

	var_26_0._sequences.ModUpAR = var_26_128

	local var_26_129
	local var_26_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverDisabled", var_26_130)

	local var_26_131 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_20:RegisterAnimationSequence("ButtonOverDisabled", var_26_131)

	local var_26_132 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_22:RegisterAnimationSequence("ButtonOverDisabled", var_26_132)

	local var_26_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		}
	}

	var_26_24:RegisterAnimationSequence("ButtonOverDisabled", var_26_133)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_134 = {
			{
				value = 0.6,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonOverDisabled", var_26_134)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_135 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonOverDisabled", var_26_135)
	end

	local function var_26_136()
		var_26_8:AnimateSequence("ButtonOverDisabled")
		var_26_20:AnimateSequence("ButtonOverDisabled")
		var_26_22:AnimateSequence("ButtonOverDisabled")
		var_26_24:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_26_0._sequences.ButtonOverDisabled = var_26_136

	local var_26_137
	local var_26_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_138)

	local var_26_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		}
	}

	var_26_24:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_139)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_140 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_140)
	end

	local function var_26_141()
		var_26_8:AnimateSequence("ButtonOverDisabledKBM")
		var_26_24:AnimateSequence("ButtonOverDisabledKBM")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonOverDisabledKBM")
		end
	end

	var_26_0._sequences.ButtonOverDisabledKBM = var_26_141

	local var_26_142
	local var_26_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_143)

	local var_26_144 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_144)

	local var_26_145 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_20:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_145)

	local var_26_146 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_22:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_146)

	local var_26_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		}
	}

	var_26_24:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_147)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_148 = {
			{
				value = 0.6,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_148)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_149 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonOverDisabledWithDesc", var_26_149)
	end

	local function var_26_150()
		var_26_8:AnimateSequence("ButtonOverDisabledWithDesc")
		var_26_18:AnimateSequence("ButtonOverDisabledWithDesc")
		var_26_20:AnimateSequence("ButtonOverDisabledWithDesc")
		var_26_22:AnimateSequence("ButtonOverDisabledWithDesc")
		var_26_24:AnimateSequence("ButtonOverDisabledWithDesc")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonOverDisabledWithDesc")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonOverDisabledWithDesc")
		end
	end

	var_26_0._sequences.ButtonOverDisabledWithDesc = var_26_150

	local var_26_151
	local var_26_152 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonUp", var_26_152)

	local var_26_153 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonUp", var_26_153)

	local var_26_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_26_24:RegisterAnimationSequence("ButtonUp", var_26_154)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_155 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonUp", var_26_155)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_156 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonUp", var_26_156)
	end

	local function var_26_157()
		var_26_8:AnimateSequence("ButtonUp")
		var_26_18:AnimateSequence("ButtonUp")
		var_26_24:AnimateSequence("ButtonUp")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonUp")
		end
	end

	var_26_0._sequences.ButtonUp = var_26_157

	local var_26_158
	local var_26_159 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.5,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonUpDisabled", var_26_159)

	local var_26_160 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_20:RegisterAnimationSequence("ButtonUpDisabled", var_26_160)

	local var_26_161 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_22:RegisterAnimationSequence("ButtonUpDisabled", var_26_161)

	local var_26_162 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_24:RegisterAnimationSequence("ButtonUpDisabled", var_26_162)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_163 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonUpDisabled", var_26_163)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_164 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonUpDisabled", var_26_164)
	end

	local function var_26_165()
		var_26_8:AnimateSequence("ButtonUpDisabled")
		var_26_20:AnimateSequence("ButtonUpDisabled")
		var_26_22:AnimateSequence("ButtonUpDisabled")
		var_26_24:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_26_0._sequences.ButtonUpDisabled = var_26_165

	local var_26_166
	local var_26_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_167)

	local var_26_168 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_168)

	local var_26_169 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_20:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_169)

	local var_26_170 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_22:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_170)

	local var_26_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_24:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_171)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_172 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_26_39:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_172)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_26_173 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_26_40:RegisterAnimationSequence("ButtonUpDisabledWithDesc", var_26_173)
	end

	local function var_26_174()
		var_26_8:AnimateSequence("ButtonUpDisabledWithDesc")
		var_26_18:AnimateSequence("ButtonUpDisabledWithDesc")
		var_26_20:AnimateSequence("ButtonUpDisabledWithDesc")
		var_26_22:AnimateSequence("ButtonUpDisabledWithDesc")
		var_26_24:AnimateSequence("ButtonUpDisabledWithDesc")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_39:AnimateSequence("ButtonUpDisabledWithDesc")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_26_40:AnimateSequence("ButtonUpDisabledWithDesc")
		end
	end

	var_26_0._sequences.ButtonUpDisabledWithDesc = var_26_174

	local var_26_175
	local var_26_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("NewOver", var_26_176)

	local var_26_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_12:RegisterAnimationSequence("NewOver", var_26_177)

	local var_26_178 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("NewOver", var_26_178)

	local function var_26_179()
		var_26_10:AnimateSequence("NewOver")
		var_26_12:AnimateSequence("NewOver")
		var_26_14:AnimateSequence("NewOver")
	end

	var_26_0._sequences.NewOver = var_26_179

	local var_26_180
	local var_26_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("NewUp", var_26_181)

	local var_26_182 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_12:RegisterAnimationSequence("NewUp", var_26_182)

	local var_26_183 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("NewUp", var_26_183)

	local function var_26_184()
		var_26_10:AnimateSequence("NewUp")
		var_26_12:AnimateSequence("NewUp")
		var_26_14:AnimateSequence("NewUp")
	end

	var_26_0._sequences.NewUp = var_26_184

	local var_26_185
	local var_26_186 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("NewHide", var_26_186)

	local var_26_187 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_12:RegisterAnimationSequence("NewHide", var_26_187)

	local var_26_188 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("NewHide", var_26_188)

	local function var_26_189()
		var_26_10:AnimateSequence("NewHide")
		var_26_12:AnimateSequence("NewHide")
		var_26_14:AnimateSequence("NewHide")
	end

	var_26_0._sequences.NewHide = var_26_189

	local var_26_190
	local var_26_191 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_26_6:RegisterAnimationSequence("MaskState1", var_26_191)

	local function var_26_192()
		var_26_6:AnimateSequence("MaskState1")
	end

	var_26_0._sequences.MaskState1 = var_26_192

	local var_26_193
	local var_26_194 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_26_6:RegisterAnimationSequence("MaskState2", var_26_194)

	local function var_26_195()
		var_26_6:AnimateSequence("MaskState2")
	end

	var_26_0._sequences.MaskState2 = var_26_195

	local var_26_196
	local var_26_197 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_26_6:RegisterAnimationSequence("MaskState3", var_26_197)

	local function var_26_198()
		var_26_6:AnimateSequence("MaskState3")
	end

	var_26_0._sequences.MaskState3 = var_26_198

	local var_26_199
	local var_26_200 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_26_6:RegisterAnimationSequence("MaskState4", var_26_200)

	local function var_26_201()
		var_26_6:AnimateSequence("MaskState4")
	end

	var_26_0._sequences.MaskState4 = var_26_201

	local var_26_202
	local var_26_203 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_26_8:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_26_203)

	local var_26_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_42:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_26_204)

	local var_26_205 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_44:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_26_205)

	local var_26_206 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_46:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_26_206)

	local var_26_207 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_48:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_26_207)

	local function var_26_208()
		var_26_8:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_26_42:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_26_44:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_26_46:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_26_48:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_26_0._sequences.ModPlaylistRestrictionEnabled = var_26_208

	local var_26_209
	local var_26_210 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_26_8:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_26_210)

	local var_26_211 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_42:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_26_211)

	local var_26_212 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_44:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_26_212)

	local var_26_213 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_46:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_26_213)

	local var_26_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_48:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_26_214)

	local function var_26_215()
		var_26_8:AnimateSequence("ModPlaylistRestrictionOff")
		var_26_42:AnimateSequence("ModPlaylistRestrictionOff")
		var_26_44:AnimateSequence("ModPlaylistRestrictionOff")
		var_26_46:AnimateSequence("ModPlaylistRestrictionOff")
		var_26_48:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_26_0._sequences.ModPlaylistRestrictionOff = var_26_215

	local var_26_216
	local var_26_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_26_8:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_26_217)

	local var_26_218 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_42:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_26_218)

	local var_26_219 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_44:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_26_219)

	local var_26_220 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_46:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_26_220)

	local var_26_221 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_48:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_26_221)

	local function var_26_222()
		var_26_8:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_26_42:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_26_44:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_26_46:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_26_48:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_26_0._sequences.ModPlaylistRestrictionDisabled = var_26_222

	local var_26_223
	local var_26_224 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_28:RegisterAnimationSequence("HideModifiers", var_26_224)

	local var_26_225 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_30:RegisterAnimationSequence("HideModifiers", var_26_225)

	local var_26_226 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_32:RegisterAnimationSequence("HideModifiers", var_26_226)

	local var_26_227 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_34:RegisterAnimationSequence("HideModifiers", var_26_227)

	local function var_26_228()
		var_26_28:AnimateSequence("HideModifiers")
		var_26_30:AnimateSequence("HideModifiers")
		var_26_32:AnimateSequence("HideModifiers")
		var_26_34:AnimateSequence("HideModifiers")
	end

	var_26_0._sequences.HideModifiers = var_26_228

	local var_26_229
	local var_26_230 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_28:RegisterAnimationSequence("ShowModifiers", var_26_230)

	local var_26_231 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_30:RegisterAnimationSequence("ShowModifiers", var_26_231)

	local var_26_232 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_32:RegisterAnimationSequence("ShowModifiers", var_26_232)

	local var_26_233 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_34:RegisterAnimationSequence("ShowModifiers", var_26_233)

	local function var_26_234()
		var_26_28:AnimateSequence("ShowModifiers")
		var_26_30:AnimateSequence("ShowModifiers")
		var_26_32:AnimateSequence("ShowModifiers")
		var_26_34:AnimateSequence("ShowModifiers")
	end

	var_26_0._sequences.ShowModifiers = var_26_234

	var_0_11(var_26_0, var_26_1, arg_26_1)

	return var_26_0
end

MenuBuilder.registerType("BRFeatureButton", BRFeatureButton)
LockTable(_M)
