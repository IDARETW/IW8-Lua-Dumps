module(..., package.seeall)

local var_0_0 = 16 * _1080p
local var_0_1 = 10 * _1080p
local var_0_2 = {
	Full = 2,
	Mini = 1,
	None = 0
}

local function var_0_3(arg_1_0, arg_1_1)
	arg_1_0._isNew = arg_1_1
end

local function var_0_4(arg_2_0)
	if arg_2_0._isButtonEnabled and arg_2_0._isNew then
		arg_2_0.NewItemSmallIcon:SetAlpha(arg_2_0._isFocused and 1 or 0)

		arg_2_0._isNewShown = true
	else
		arg_2_0.NewItemSmallIcon:SetAlpha(0)

		arg_2_0._isNewShown = false
	end
end

local function var_0_5(arg_3_0, arg_3_1, arg_3_2)
	if not arg_3_0._isLimitedTime then
		return
	end

	local var_3_0 = LAYOUT.GetElementWidth(arg_3_0.LimitedTimeIcon)

	if IsLanguageArabic() then
		local var_3_1 = arg_3_2:GetCurrentAnchorsAndPositions().right + var_0_1

		arg_3_0.LimitedTimeIcon:SetLeft(var_3_1)

		local var_3_2 = var_3_1 + var_3_0

		arg_3_0.LimitedTimeIcon:SetRight(var_3_2)
	else
		local var_3_3 = arg_3_2:GetCurrentAnchorsAndPositions().left - var_0_1

		arg_3_0.LimitedTimeIcon:SetRight(var_3_3)

		local var_3_4 = var_3_3 - var_3_0

		arg_3_0.LimitedTimeIcon:SetLeft(var_3_4)
	end
end

local function var_0_6(arg_4_0, arg_4_1)
	local var_4_0 = {
		{
			isUsed = false,
			icon = arg_4_0.ModifierIcon1
		},
		{
			isUsed = false,
			icon = arg_4_0.ModifierIcon2
		},
		{
			isUsed = false,
			icon = arg_4_0.ModifierIcon3
		},
		{
			isUsed = false,
			icon = arg_4_0.ModifierIcon4
		}
	}

	;(function()
		for iter_5_0 = 1, #var_4_0 do
			if not var_4_0[iter_5_0].isUsed then
				var_4_0[iter_5_0].isUsed = false

				var_4_0[iter_5_0].icon:SetAlpha(0)
			end
		end

		local var_5_0 = arg_4_0.NewItemSmallIcon:GetCurrentAnchorsAndPositions()
		local var_5_1 = LAYOUT.GetElementWidth(arg_4_0.NewItemSmallIcon)
		local var_5_2 = LAYOUT.GetElementWidth(arg_4_0.LimitedTimeIcon)
		local var_5_3 = false
		local var_5_4 = arg_4_0:GetDataSource(arg_4_0._controllerIndex)

		if var_5_4 and var_5_4.isNew then
			var_5_3 = var_5_4.isNew:GetValue(arg_4_0._controllerIndex)
		end

		if IsLanguageArabic() then
			local var_5_5 = var_5_0.right + var_0_0

			arg_4_0.GamemodeName:SetLeft(var_5_5 + var_5_1 + var_0_0)

			if var_5_3 then
				var_0_5(arg_4_0, arg_4_0._controllerIndex, arg_4_0.NewItemSmallIcon)
				arg_4_0.GamemodeName:SetLeft(arg_4_0.LimitedTimeIcon:GetCurrentAnchorsAndPositions().right + var_5_2 + var_0_1)
			end
		else
			local var_5_6 = var_5_0.left - var_0_0

			arg_4_0.GamemodeName:SetRight(var_5_6 - var_5_1 - var_0_0)

			if var_5_3 then
				var_0_5(arg_4_0, arg_4_0._controllerIndex, arg_4_0.NewItemSmallIcon)
				arg_4_0.GamemodeName:SetRight(arg_4_0.LimitedTimeIcon:GetCurrentAnchorsAndPositions().left - var_5_2 - var_0_1)
			end
		end
	end)()

	local function var_4_1()
		for iter_6_0 = 1, #var_4_0 do
			if not var_4_0[iter_6_0].isUsed then
				var_4_0[iter_6_0].isUsed = true

				local var_6_0 = var_4_0[iter_6_0].icon

				var_6_0:SetAlpha(1)

				return var_6_0
			end
		end
	end

	local function var_4_2(arg_7_0)
		local var_7_0 = LAYOUT.GetElementWidth(arg_4_0.NewItemSmallIcon)
		local var_7_1 = LAYOUT.GetElementWidth(arg_4_0.LimitedTimeIcon)

		if IsLanguageArabic() then
			local var_7_2 = arg_7_0:GetCurrentAnchorsAndPositions().right + var_0_0

			arg_4_0.NewItemSmallIcon:SetLeft(var_7_2)
			arg_4_0.NewItemSmallIcon:SetRight(var_7_2 + var_7_0)
			arg_4_0.GamemodeName:SetLeft(arg_4_0.NewItemSmallIcon:GetCurrentAnchorsAndPositions().right + var_7_0 + var_0_0)

			if arg_4_0._isLimitedTime then
				if arg_4_0._isNewShown then
					arg_7_0 = arg_4_0.NewItemSmallIcon
				end

				var_0_5(arg_4_0, arg_4_0._controllerIndex, arg_7_0)
				arg_4_0.GamemodeName:SetLeft(arg_4_0.LimitedTimeIcon:GetCurrentAnchorsAndPositions().right + var_7_1 + var_0_1)
			end
		else
			local var_7_3 = arg_7_0:GetCurrentAnchorsAndPositions().left - var_0_0

			arg_4_0.NewItemSmallIcon:SetRight(var_7_3)
			arg_4_0.NewItemSmallIcon:SetLeft(var_7_3 - var_7_0)
			arg_4_0.GamemodeName:SetRight(arg_4_0.NewItemSmallIcon:GetCurrentAnchorsAndPositions().left - var_7_0 - var_0_0)

			if arg_4_0._isLimitedTime then
				if arg_4_0._isNewShown then
					arg_7_0 = arg_4_0.NewItemSmallIcon
				end

				var_0_5(arg_4_0, arg_4_0._controllerIndex, arg_7_0)
				arg_4_0.GamemodeName:SetRight(arg_4_0.LimitedTimeIcon:GetCurrentAnchorsAndPositions().left - var_7_1 - var_0_1)
			end
		end
	end

	local function var_4_3(arg_8_0, arg_8_1)
		if arg_8_0:GetValue(arg_4_0._controllerIndex) > 1 then
			local var_8_0 = var_4_1()

			var_8_0:setImage(RegisterMaterial(arg_8_1))
			var_4_2(var_8_0)
		end
	end

	local var_4_4 = arg_4_0:GetDataSource()

	if arg_4_0._isDataSourceValid and var_4_4 then
		var_4_3(var_4_4.xpScale, "icon_double_xp_mini")
		var_4_3(var_4_4.weaponXpScale, "icon_double_weapon_xp_mini")
		var_4_3(var_4_4.battlePassXpScale, "icon_double_battle_xp_mini")
		var_4_3(var_4_4.operatorXpScale, "icon_double_operator_xp_mini")
		PlaylistUtils.UpdatePlaylistRestrictionVisualsViaDataSource(arg_4_0, arg_4_0._controllerIndex, {
			playlistDataSource = var_4_4
		})
	end
end

local function var_0_7(arg_9_0)
	arg_9_0._isDataSourceValid = true

	arg_9_0:UpdateModifiers()
end

local function var_0_8(arg_10_0, arg_10_1)
	assert(arg_10_0.Description)

	arg_10_0._isLimitedTime = arg_10_0:GetDataSource().isLimitedTime:GetValue(arg_10_1)

	local var_10_0 = arg_10_0:GetDataSource().desc:GetValue(arg_10_1)

	if LUI.IsLastInputMouseNavigation(arg_10_1) and arg_10_0._isLimitedTime then
		local var_10_1 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME")

		var_10_0 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME_DESC", Engine.JCBDICCAH(var_10_1), Engine.JCBDICCAH(var_10_0))
	end

	arg_10_0.Description:setText(var_10_0)
	arg_10_0:AddTooltipData(arg_10_1, {
		tooltipDescription = var_10_0
	})

	if arg_10_0._isDataSourceValid then
		arg_10_0:UpdateModifiers()
	end
end

local function var_0_9(arg_11_0, arg_11_1)
	if not arg_11_0._isLimitedTime then
		arg_11_0.LimitedTimeIcon:SetAlpha(0)
		arg_11_0.LimitedTimeNotification:SetAlpha(0)

		return
	end

	if arg_11_1 == var_0_2.Mini then
		arg_11_0.LimitedTimeIcon:SetAlpha(0.6, 300)
		arg_11_0.LimitedTimeNotification:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_11_0, IsLanguageArabic() and "ModUpAR" or "ModUp")
	elseif arg_11_1 == var_0_2.Full then
		arg_11_0.LimitedTimeNotification:SetAlpha(1, 500)
		arg_11_0.LimitedTimeIcon:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_11_0, IsLanguageArabic() and "ModOverLimitedAR" or "ModOverLimited")

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_11_0.LimitedTimeNotification, "ARShowIcon")
		else
			ACTIONS.AnimateSequence(arg_11_0.LimitedTimeNotification, "ShowIcon")
		end
	end
end

local function var_0_10(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.UpdateModifiers = var_0_6
	arg_12_0.OnDataSourceAssigned = var_0_7
	arg_12_0._isNew = false
	arg_12_0._controllerIndex = arg_12_1
	arg_12_0.SetNew = var_0_3
	arg_12_0.UpdateBreadcrumb = var_0_4
	arg_12_0._isNewShown = false
	arg_12_0._isFocused = true
	arg_12_0._isButtonEnabled = true
	arg_12_0._isDataSourceValid = false

	arg_12_0:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_12_0:GetDataSource()

		if var_13_0.categoryIndex then
			local var_13_1 = var_13_0.categoryIndex:GetValue(arg_12_1)
			local var_13_2 = var_13_0.playlistIndex:GetValue(arg_12_1)

			if var_13_1 ~= nil and var_13_2 ~= nil then
				local var_13_3 = Playlist.DCFCIFABGH(var_13_1, var_13_2)
				local var_13_4 = var_13_3 == Lobby.PlaylistLockState.UNLOCKED
				local var_13_5 = var_13_0.maxPlayerSize:GetValue(arg_12_1)
				local var_13_6 = Dvar.CFHDGABACF("MTTRPNMPRP")

				local function var_13_7()
					Lobby.TryNavigateToLobby(function()
						Playlist.CDBBECIGIG(var_13_1, var_13_2)

						if Engine.EAIICIFIFA() then
							LUI.FlowManager.RequestAddMenu("CPPublicMatchMenu", false, arg_13_1.controller, false, {
								openFromPlaylist = true
							})
						elseif CONDITIONS.IsMagmaGameMode(arg_12_0) then
							local function var_15_0()
								LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_12_1, false, {
									openFromPlaylist = true
								})
							end

							if PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(arg_12_0, arg_12_1, var_13_0, var_15_0) then
								-- block empty
							else
								var_15_0()
							end
						else
							LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_13_1.controller, false, {
								openFromPlaylist = true
							})
						end
					end)
				end

				local var_13_8 = Playlist.DEJGAECIBG(var_13_2, var_13_1)

				if not var_13_4 and var_13_3 == Lobby.PlaylistLockState.LOCKED_FORCE_LOCK then
					local var_13_9 = {}

					table.insert(var_13_9, var_13_0)
				elseif not var_13_4 and var_13_3 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					local var_13_10 = {}

					table.insert(var_13_10, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						invalidPlaylists = var_13_10
					})
				elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_13_0, arg_12_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_12_1, false, {
						isSplitScreenWarning = true,
						controllerIndex = arg_12_1,
						text = var_13_0.name:GetValue(arg_12_1)
					})
				elseif not Engine.FIDIEBFAG(arg_12_1) and var_13_6 <= var_13_5 then
					local var_13_11 = {
						controllerIndex = arg_12_1,
						onAccept = var_13_7,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_12_1, false, var_13_11)
				elseif var_13_8 and Engine.JACCCCEDI() then
					local var_13_12 = {}

					table.insert(var_13_12, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						premium = true,
						invalidPlaylists = var_13_12
					})
				elseif var_13_8 and not Engine.HBIAGEFCC() then
					local var_13_13 = {}

					table.insert(var_13_13, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						subscription = true,
						invalidPlaylists = var_13_13
					})
				else
					var_13_7()
				end
			end
		end
	end)

	local function var_12_0(arg_17_0)
		arg_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_17_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end

	local function var_12_1(arg_18_0)
		arg_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_18_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	arg_12_0:addEventHandler("button_over", function(arg_19_0, arg_19_1)
		arg_12_0._isFocused = true

		var_0_8(arg_12_0, arg_12_1)

		if not LUI.IsLastInputMouseNavigation(arg_12_1) then
			var_12_0(arg_19_0)
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOver")

			if arg_12_0._isNewShown then
				ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "ModOverNewAR" or "ModOverNew")
			end

			arg_12_0.NewItemSmallIcon:SetAlpha(0)
			arg_12_0.NewItemNotification:SetAlpha(arg_12_0._isNewShown and 1 or 0, 400)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitle")
			end

			var_0_9(arg_19_0, var_0_2.Full)
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverKBM")
		end

		arg_19_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_12_0:addEventHandler("button_up", function(arg_20_0, arg_20_1)
		arg_12_0._isFocused = false

		var_12_1(arg_20_0)
		ACTIONS.AnimateSequence(arg_20_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "ModUpAR" or "ModUp")
		arg_12_0.NewItemSmallIcon:SetAlpha(arg_12_0._isNewShown and 1 or 0, 150)
		arg_12_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitle")
		end

		var_0_9(arg_20_0, var_0_2.Mini)
	end)
	arg_12_0:addEventHandler("button_over_disable", function(arg_21_0, arg_21_1)
		arg_12_0._isFocused = true

		var_0_8(arg_12_0, arg_12_1)

		if not LUI.IsLastInputMouseNavigation(arg_12_1) then
			var_12_0(arg_21_0)
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabled")
			arg_12_0.NewItemSmallIcon:SetAlpha(0)
			arg_12_0.NewItemNotification:SetAlpha(arg_12_0._isNewShown and 1 or 0, 400)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitle")
			end

			var_0_9(arg_21_0, var_0_2.Full)
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabledKBM")
		end
	end)
	arg_12_0:addEventHandler("button_up_disable", function(arg_22_0, arg_22_1)
		arg_12_0._isFocused = false

		var_12_1(arg_22_0)
		ACTIONS.AnimateSequence(arg_22_0, "ButtonUpDisabled")
		arg_12_0.NewItemSmallIcon:SetAlpha(arg_12_0._isNewShown and 1 or 0, 400)
		arg_12_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitle")
		end

		var_0_9(arg_22_0, var_0_2.Mini)
	end)
	arg_12_0:addEventHandler("button_disable", function(arg_23_0, arg_23_1)
		arg_12_0._isButtonEnabled = false

		var_12_1(arg_23_0)
		arg_12_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "DisabledAR" or "Disabled")
		var_0_9(arg_23_0, var_0_2.Mini)

		if arg_12_0._isDataSourceValid then
			arg_12_0:UpdateModifiers()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_12_0, "AR")
		ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitleAR")
	else
		arg_12_0.NewItemNotification:SetupRightAlignment()
	end

	arg_12_0:addEventHandler("enable", function(arg_24_0, arg_24_1)
		arg_12_0._isButtonEnabled = true

		arg_12_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "EnabledAR" or "Enabled")

		if arg_12_0._isDataSourceValid then
			arg_12_0:UpdateModifiers()
		end
	end)
	arg_12_0:SubscribeToModelThroughElement(arg_12_0, "isLimitedTime", function()
		arg_12_0._isLimitedTime = arg_12_0:GetDataSource().isLimitedTime:GetValue(arg_12_1)

		local var_25_0 = arg_12_0.LimitedTimeIcon
		local var_25_1 = 0.6

		if arg_12_0._isLimitedTime then
			var_25_0:SetAlpha(var_25_1, 300)
		else
			var_25_0:SetAlpha(0)
		end
	end)
	arg_12_0:SubscribeToModelThroughElement(arg_12_0, "desc", function()
		var_0_8(arg_12_0, arg_12_1)
	end)
end

function PlaylistFeaturedButton(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIButton.new()

	var_27_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_27_0.id = "PlaylistFeaturedButton"
	var_27_0._animationSets = var_27_0._animationSets or {}
	var_27_0._sequences = var_27_0._sequences or {}

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)

	local var_27_2 = var_27_0
	local var_27_3
	local var_27_4 = MenuBuilder.BuildRegisteredType("FeaturedButtonBackground", {
		controllerIndex = var_27_1
	})

	var_27_4.id = "Background"

	var_27_4.BackgroundImage:SetTop(_1080p * -108, 0)
	var_27_4.BackgroundImage:SetBottom(_1080p * 108, 0)
	var_27_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_27_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_27_0:addElement(var_27_4)

	var_27_0.Background = var_27_4

	local var_27_5
	local var_27_6 = LUI.UIImage.new()

	var_27_6.id = "Backer"

	var_27_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_27_6:SetAlpha(0, 0)
	var_27_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_27_0:addElement(var_27_6)

	var_27_0.Backer = var_27_6

	local var_27_7
	local var_27_8 = LUI.UIStyledText.new()

	var_27_8.id = "GamemodeName"

	var_27_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_27_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_8:SetWordWrap(false)
	var_27_8:SetAlignment(LUI.Alignment.Left)
	var_27_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_27_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_27_8:SetStartupDelay(1000)
	var_27_8:SetLineHoldTime(400)
	var_27_8:SetAnimMoveTime(2000)
	var_27_8:SetAnimMoveSpeed(150)
	var_27_8:SetEndDelay(2000)
	var_27_8:SetCrossfadeTime(1000)
	var_27_8:SetFadeInTime(300)
	var_27_8:SetFadeOutTime(300)
	var_27_8:SetMaxVisibleLines(1)
	var_27_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_27_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 303, _1080p * -15, _1080p * 15)

	local function var_27_9()
		local var_28_0 = var_27_0:GetDataSource().name:GetValue(var_27_1)

		if var_28_0 ~= nil then
			var_27_8:setText(ToUpperCase(var_28_0), 0)
		end
	end

	var_27_8:SubscribeToModelThroughElement(var_27_0, "name", var_27_9)
	var_27_0:addElement(var_27_8)

	var_27_0.GamemodeName = var_27_8

	local var_27_10
	local var_27_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_27_1
	})

	var_27_11.id = "NewItemNotification"

	var_27_11:SetAlpha(0, 0)
	var_27_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * -19, _1080p * 11)
	var_27_0:addElement(var_27_11)

	var_27_0.NewItemNotification = var_27_11

	local var_27_12
	local var_27_13 = LUI.UIImage.new()

	var_27_13.id = "Lock"

	var_27_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_27_13:SetAlpha(0, 0)
	var_27_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_27_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_27_0:addElement(var_27_13)

	var_27_0.Lock = var_27_13

	local var_27_14
	local var_27_15 = LUI.UIStyledText.new()

	var_27_15.id = "Description"

	var_27_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_27_15:SetAlpha(0, 0)
	var_27_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_15:SetAlignment(LUI.Alignment.Left)
	var_27_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_27_15:SetStartupDelay(2000)
	var_27_15:SetLineHoldTime(400)
	var_27_15:SetAnimMoveTime(2000)
	var_27_15:SetAnimMoveSpeed(150)
	var_27_15:SetEndDelay(2000)
	var_27_15:SetCrossfadeTime(2000)
	var_27_15:SetFadeInTime(300)
	var_27_15:SetFadeOutTime(300)
	var_27_15:SetMaxVisibleLines(3)
	var_27_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 336, _1080p * -24, _1080p * -4)

	local function var_27_16()
		local var_29_0 = var_27_0:GetDataSource().desc:GetValue(var_27_1)

		if var_29_0 ~= nil then
			var_27_15:setText(var_29_0, 0)
		end
	end

	var_27_15:SubscribeToModelThroughElement(var_27_0, "desc", var_27_16)
	var_27_0:addElement(var_27_15)

	var_27_0.Description = var_27_15

	local var_27_17
	local var_27_18 = LUI.UIStyledText.new()

	var_27_18.id = "DisabledText"

	var_27_18:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_27_18:SetAlpha(0, 0)
	var_27_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_27_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_18:SetWordWrap(false)
	var_27_18:SetAlignment(LUI.Alignment.Left)
	var_27_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_27_18:SetStartupDelay(2000)
	var_27_18:SetLineHoldTime(400)
	var_27_18:SetAnimMoveTime(2000)
	var_27_18:SetAnimMoveSpeed(150)
	var_27_18:SetEndDelay(2000)
	var_27_18:SetCrossfadeTime(1000)
	var_27_18:SetFadeInTime(300)
	var_27_18:SetFadeOutTime(300)
	var_27_18:SetMaxVisibleLines(1)
	var_27_18:SetShadowMinDistance(-0.2, 0)
	var_27_18:SetShadowMaxDistance(0.2, 0)
	var_27_18:SetShadowUOffset(-0.002, 0)
	var_27_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_27_0:addElement(var_27_18)

	var_27_0.DisabledText = var_27_18

	local var_27_19
	local var_27_20 = LUI.UIImage.new()

	var_27_20.id = "ModifierIcon1"

	var_27_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_27_20:SetAlpha(0, 0)
	var_27_20:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_27_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 355, _1080p * 390, _1080p * -18, _1080p * 17)
	var_27_0:addElement(var_27_20)

	var_27_0.ModifierIcon1 = var_27_20

	local var_27_21
	local var_27_22 = LUI.UIImage.new()

	var_27_22.id = "ModifierIcon2"

	var_27_22:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_27_22:SetAlpha(0, 0)
	var_27_22:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_27_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 315, _1080p * 350, _1080p * -18, _1080p * 17)
	var_27_0:addElement(var_27_22)

	var_27_0.ModifierIcon2 = var_27_22

	local var_27_23
	local var_27_24 = LUI.UIImage.new()

	var_27_24.id = "ModifierIcon3"

	var_27_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_27_24:SetAlpha(0, 0)
	var_27_24:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_27_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 275, _1080p * 310, _1080p * -18, _1080p * 17)
	var_27_0:addElement(var_27_24)

	var_27_0.ModifierIcon3 = var_27_24

	local var_27_25
	local var_27_26 = LUI.UIImage.new()

	var_27_26.id = "ModifierIcon4"

	var_27_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_27_26:SetAlpha(0, 0)
	var_27_26:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_27_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 235, _1080p * 270, _1080p * -18, _1080p * 17)
	var_27_0:addElement(var_27_26)

	var_27_0.ModifierIcon4 = var_27_26

	local var_27_27
	local var_27_28 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_27_1
	})

	var_27_28.id = "NewItemSmallIcon"

	var_27_28:SetAlpha(0, 0)
	var_27_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -4, _1080p * 4)
	var_27_0:addElement(var_27_28)

	var_27_0.NewItemSmallIcon = var_27_28

	local var_27_29
	local var_27_30 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_27_1
	})

	var_27_30.id = "LimitedTimeNotification"

	var_27_30:SetAlpha(0, 0)
	var_27_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -167, _1080p * -11, _1080p * 115, _1080p * 145)
	var_27_0:addElement(var_27_30)

	var_27_0.LimitedTimeNotification = var_27_30

	local var_27_31
	local var_27_32 = LUI.UIImage.new()

	var_27_32.id = "LimitedTimeIcon"

	var_27_32:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_27_32:SetAlpha(0, 0)
	var_27_32:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_27_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 397, _1080p * 421, _1080p * -12, _1080p * 12)
	var_27_0:addElement(var_27_32)

	var_27_0.LimitedTimeIcon = var_27_32

	local var_27_33
	local var_27_34 = LUI.UIImage.new()

	var_27_34.id = "PlaylistRestrictionIcon"

	var_27_34:SetAlpha(0, 0)
	var_27_34:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_27_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 45, _1080p * 11, _1080p * 45)
	var_27_0:addElement(var_27_34)

	var_27_0.PlaylistRestrictionIcon = var_27_34

	local var_27_35
	local var_27_36 = LUI.UIImage.new()

	var_27_36.id = "PlaylistRestrictionHighlight"

	var_27_36:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_27_36:SetAlpha(0, 0)
	var_27_36:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_27_36:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_27_0:addElement(var_27_36)

	var_27_0.PlaylistRestrictionHighlight = var_27_36

	local function var_27_37()
		return
	end

	var_27_0._sequences.DefaultSequence = var_27_37

	local var_27_38
	local var_27_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_27_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_27_0.Background.BackgroundImage
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonOver", var_27_39)

	local var_27_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOver", var_27_40)

	local var_27_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_27_11:RegisterAnimationSequence("ButtonOver", var_27_41)

	local var_27_42 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_13:RegisterAnimationSequence("ButtonOver", var_27_42)

	local var_27_43 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_15:RegisterAnimationSequence("ButtonOver", var_27_43)

	local var_27_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonOver", var_27_44)

	local var_27_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_27_22:RegisterAnimationSequence("ButtonOver", var_27_45)

	local var_27_46 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_27_24:RegisterAnimationSequence("ButtonOver", var_27_46)

	local var_27_47 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		}
	}

	var_27_26:RegisterAnimationSequence("ButtonOver", var_27_47)

	local var_27_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -11
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonOver", var_27_48)

	local var_27_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -32
		}
	}

	var_27_32:RegisterAnimationSequence("ButtonOver", var_27_49)

	local function var_27_50()
		var_27_4:AnimateSequence("ButtonOver")
		var_27_8:AnimateSequence("ButtonOver")
		var_27_11:AnimateSequence("ButtonOver")
		var_27_13:AnimateSequence("ButtonOver")
		var_27_15:AnimateSequence("ButtonOver")
		var_27_20:AnimateSequence("ButtonOver")
		var_27_22:AnimateSequence("ButtonOver")
		var_27_24:AnimateSequence("ButtonOver")
		var_27_26:AnimateSequence("ButtonOver")
		var_27_30:AnimateSequence("ButtonOver")
		var_27_32:AnimateSequence("ButtonOver")
	end

	var_27_0._sequences.ButtonOver = var_27_50

	local var_27_51
	local var_27_52 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonUp", var_27_52)

	local var_27_53 = {
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
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonUp", var_27_53)

	local var_27_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_27_11:RegisterAnimationSequence("ButtonUp", var_27_54)

	local var_27_55 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_13:RegisterAnimationSequence("ButtonUp", var_27_55)

	local var_27_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_15:RegisterAnimationSequence("ButtonUp", var_27_56)

	local var_27_57 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("ButtonUp", var_27_57)

	local var_27_58 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonUp", var_27_58)

	local var_27_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_22:RegisterAnimationSequence("ButtonUp", var_27_59)

	local var_27_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_24:RegisterAnimationSequence("ButtonUp", var_27_60)

	local var_27_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_26:RegisterAnimationSequence("ButtonUp", var_27_61)

	local var_27_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonUp", var_27_62)

	local var_27_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_27_32:RegisterAnimationSequence("ButtonUp", var_27_63)

	local function var_27_64()
		var_27_6:AnimateSequence("ButtonUp")
		var_27_8:AnimateSequence("ButtonUp")
		var_27_11:AnimateSequence("ButtonUp")
		var_27_13:AnimateSequence("ButtonUp")
		var_27_15:AnimateSequence("ButtonUp")
		var_27_18:AnimateSequence("ButtonUp")
		var_27_20:AnimateSequence("ButtonUp")
		var_27_22:AnimateSequence("ButtonUp")
		var_27_24:AnimateSequence("ButtonUp")
		var_27_26:AnimateSequence("ButtonUp")
		var_27_30:AnimateSequence("ButtonUp")
		var_27_32:AnimateSequence("ButtonUp")
	end

	var_27_0._sequences.ButtonUp = var_27_64

	local var_27_65
	local var_27_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_27_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_27_0.Background.BackgroundImage
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonOverDisabled", var_27_66)

	local var_27_67 = {
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

	var_27_6:RegisterAnimationSequence("ButtonOverDisabled", var_27_67)

	local var_27_68 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOverDisabled", var_27_68)

	local var_27_69 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_27_11:RegisterAnimationSequence("ButtonOverDisabled", var_27_69)

	local var_27_70 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 69
		}
	}

	var_27_13:RegisterAnimationSequence("ButtonOverDisabled", var_27_70)

	local var_27_71 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_15:RegisterAnimationSequence("ButtonOverDisabled", var_27_71)

	local var_27_72 = {
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

	var_27_18:RegisterAnimationSequence("ButtonOverDisabled", var_27_72)

	local var_27_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonOverDisabled", var_27_73)

	local var_27_74 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		}
	}

	var_27_22:RegisterAnimationSequence("ButtonOverDisabled", var_27_74)

	local var_27_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		}
	}

	var_27_24:RegisterAnimationSequence("ButtonOverDisabled", var_27_75)

	local var_27_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		}
	}

	var_27_26:RegisterAnimationSequence("ButtonOverDisabled", var_27_76)

	local var_27_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonOverDisabled", var_27_77)

	local function var_27_78()
		var_27_4:AnimateSequence("ButtonOverDisabled")
		var_27_6:AnimateSequence("ButtonOverDisabled")
		var_27_8:AnimateSequence("ButtonOverDisabled")
		var_27_11:AnimateSequence("ButtonOverDisabled")
		var_27_13:AnimateSequence("ButtonOverDisabled")
		var_27_15:AnimateSequence("ButtonOverDisabled")
		var_27_18:AnimateSequence("ButtonOverDisabled")
		var_27_20:AnimateSequence("ButtonOverDisabled")
		var_27_22:AnimateSequence("ButtonOverDisabled")
		var_27_24:AnimateSequence("ButtonOverDisabled")
		var_27_26:AnimateSequence("ButtonOverDisabled")
		var_27_30:AnimateSequence("ButtonOverDisabled")
	end

	var_27_0._sequences.ButtonOverDisabled = var_27_78

	local var_27_79
	local var_27_80 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonUpDisabled", var_27_80)

	local var_27_81 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
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

	var_27_8:RegisterAnimationSequence("ButtonUpDisabled", var_27_81)

	local var_27_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_27_11:RegisterAnimationSequence("ButtonUpDisabled", var_27_82)

	local var_27_83 = {
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

	var_27_13:RegisterAnimationSequence("ButtonUpDisabled", var_27_83)

	local var_27_84 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_15:RegisterAnimationSequence("ButtonUpDisabled", var_27_84)

	local var_27_85 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("ButtonUpDisabled", var_27_85)

	local var_27_86 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonUpDisabled", var_27_86)

	local var_27_87 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_22:RegisterAnimationSequence("ButtonUpDisabled", var_27_87)

	local var_27_88 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_24:RegisterAnimationSequence("ButtonUpDisabled", var_27_88)

	local var_27_89 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_27_26:RegisterAnimationSequence("ButtonUpDisabled", var_27_89)

	local var_27_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonUpDisabled", var_27_90)

	local function var_27_91()
		var_27_6:AnimateSequence("ButtonUpDisabled")
		var_27_8:AnimateSequence("ButtonUpDisabled")
		var_27_11:AnimateSequence("ButtonUpDisabled")
		var_27_13:AnimateSequence("ButtonUpDisabled")
		var_27_15:AnimateSequence("ButtonUpDisabled")
		var_27_18:AnimateSequence("ButtonUpDisabled")
		var_27_20:AnimateSequence("ButtonUpDisabled")
		var_27_22:AnimateSequence("ButtonUpDisabled")
		var_27_24:AnimateSequence("ButtonUpDisabled")
		var_27_26:AnimateSequence("ButtonUpDisabled")
		var_27_30:AnimateSequence("ButtonUpDisabled")
	end

	var_27_0._sequences.ButtonUpDisabled = var_27_91

	local var_27_92
	local var_27_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_27_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_27_0.Background.BackgroundImage
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonOverKBM", var_27_93)

	local var_27_94 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonOverKBM", var_27_94)

	local var_27_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOverKBM", var_27_95)

	local var_27_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_11:RegisterAnimationSequence("ButtonOverKBM", var_27_96)

	local var_27_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_13:RegisterAnimationSequence("ButtonOverKBM", var_27_97)

	local var_27_98 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("ButtonOverKBM", var_27_98)

	local function var_27_99()
		var_27_4:AnimateSequence("ButtonOverKBM")
		var_27_6:AnimateSequence("ButtonOverKBM")
		var_27_8:AnimateSequence("ButtonOverKBM")
		var_27_11:AnimateSequence("ButtonOverKBM")
		var_27_13:AnimateSequence("ButtonOverKBM")
		var_27_18:AnimateSequence("ButtonOverKBM")
	end

	var_27_0._sequences.ButtonOverKBM = var_27_99

	local var_27_100
	local var_27_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_27_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_27_0.Background.BackgroundImage
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_101)

	local var_27_102 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_102)

	local var_27_103 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_103)

	local var_27_104 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_27_11:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_104)

	local var_27_105 = {
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

	var_27_13:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_105)

	local var_27_106 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_106)

	local var_27_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonOverDisabledKBM", var_27_107)

	local function var_27_108()
		var_27_4:AnimateSequence("ButtonOverDisabledKBM")
		var_27_6:AnimateSequence("ButtonOverDisabledKBM")
		var_27_8:AnimateSequence("ButtonOverDisabledKBM")
		var_27_11:AnimateSequence("ButtonOverDisabledKBM")
		var_27_13:AnimateSequence("ButtonOverDisabledKBM")
		var_27_18:AnimateSequence("ButtonOverDisabledKBM")
		var_27_30:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_27_0._sequences.ButtonOverDisabledKBM = var_27_108

	local var_27_109
	local var_27_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_27_8:RegisterAnimationSequence("AR", var_27_110)

	local var_27_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 89
		}
	}

	var_27_11:RegisterAnimationSequence("AR", var_27_111)

	local var_27_112 = {
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

	var_27_13:RegisterAnimationSequence("AR", var_27_112)

	local var_27_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		}
	}

	var_27_15:RegisterAnimationSequence("AR", var_27_113)

	local var_27_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 65
		}
	}

	var_27_18:RegisterAnimationSequence("AR", var_27_114)

	local var_27_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_27_20:RegisterAnimationSequence("AR", var_27_115)

	local var_27_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		}
	}

	var_27_22:RegisterAnimationSequence("AR", var_27_116)

	local var_27_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		}
	}

	var_27_24:RegisterAnimationSequence("AR", var_27_117)

	local var_27_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_27_26:RegisterAnimationSequence("AR", var_27_118)

	local var_27_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_27_28:RegisterAnimationSequence("AR", var_27_119)

	local var_27_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -419
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_27_30:RegisterAnimationSequence("AR", var_27_120)

	local var_27_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 29
		}
	}

	var_27_32:RegisterAnimationSequence("AR", var_27_121)

	local function var_27_122()
		var_27_8:AnimateSequence("AR")
		var_27_11:AnimateSequence("AR")
		var_27_13:AnimateSequence("AR")
		var_27_15:AnimateSequence("AR")
		var_27_18:AnimateSequence("AR")
		var_27_20:AnimateSequence("AR")
		var_27_22:AnimateSequence("AR")
		var_27_24:AnimateSequence("AR")
		var_27_26:AnimateSequence("AR")
		var_27_28:AnimateSequence("AR")
		var_27_30:AnimateSequence("AR")
		var_27_32:AnimateSequence("AR")
	end

	var_27_0._sequences.AR = var_27_122

	local var_27_123
	local var_27_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_27_13:RegisterAnimationSequence("Disabled", var_27_124)

	local var_27_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 395
		}
	}

	var_27_20:RegisterAnimationSequence("Disabled", var_27_125)

	local var_27_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 355
		}
	}

	var_27_22:RegisterAnimationSequence("Disabled", var_27_126)

	local var_27_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 315
		}
	}

	var_27_24:RegisterAnimationSequence("Disabled", var_27_127)

	local var_27_128 = {
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

	var_27_26:RegisterAnimationSequence("Disabled", var_27_128)

	local var_27_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 386
		}
	}

	var_27_28:RegisterAnimationSequence("Disabled", var_27_129)

	local var_27_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 116
		}
	}

	var_27_30:RegisterAnimationSequence("Disabled", var_27_130)

	local var_27_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 398
		}
	}

	var_27_32:RegisterAnimationSequence("Disabled", var_27_131)

	local function var_27_132()
		var_27_13:AnimateSequence("Disabled")
		var_27_20:AnimateSequence("Disabled")
		var_27_22:AnimateSequence("Disabled")
		var_27_24:AnimateSequence("Disabled")
		var_27_26:AnimateSequence("Disabled")
		var_27_28:AnimateSequence("Disabled")
		var_27_30:AnimateSequence("Disabled")
		var_27_32:AnimateSequence("Disabled")
	end

	var_27_0._sequences.Disabled = var_27_132

	local var_27_133
	local var_27_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_6:RegisterAnimationSequence("Enabled", var_27_134)

	local var_27_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_27_13:RegisterAnimationSequence("Enabled", var_27_135)

	local var_27_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("Enabled", var_27_136)

	local var_27_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 425
		}
	}

	var_27_20:RegisterAnimationSequence("Enabled", var_27_137)

	local var_27_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 385
		}
	}

	var_27_22:RegisterAnimationSequence("Enabled", var_27_138)

	local var_27_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 310
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_27_24:RegisterAnimationSequence("Enabled", var_27_139)

	local var_27_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 270
		}
	}

	var_27_26:RegisterAnimationSequence("Enabled", var_27_140)

	local var_27_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 413
		}
	}

	var_27_28:RegisterAnimationSequence("Enabled", var_27_141)

	local function var_27_142()
		var_27_6:AnimateSequence("Enabled")
		var_27_13:AnimateSequence("Enabled")
		var_27_18:AnimateSequence("Enabled")
		var_27_20:AnimateSequence("Enabled")
		var_27_22:AnimateSequence("Enabled")
		var_27_24:AnimateSequence("Enabled")
		var_27_26:AnimateSequence("Enabled")
		var_27_28:AnimateSequence("Enabled")
	end

	var_27_0._sequences.Enabled = var_27_142

	local var_27_143
	local var_27_144 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -395
		}
	}

	var_27_13:RegisterAnimationSequence("DisabledAR", var_27_144)

	local var_27_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_27_20:RegisterAnimationSequence("DisabledAR", var_27_145)

	local var_27_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		}
	}

	var_27_22:RegisterAnimationSequence("DisabledAR", var_27_146)

	local var_27_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		}
	}

	var_27_24:RegisterAnimationSequence("DisabledAR", var_27_147)

	local var_27_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_27_26:RegisterAnimationSequence("DisabledAR", var_27_148)

	local var_27_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 54
		}
	}

	var_27_28:RegisterAnimationSequence("DisabledAR", var_27_149)

	local var_27_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -249
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_27_30:RegisterAnimationSequence("DisabledAR", var_27_150)

	local var_27_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 59
		}
	}

	var_27_32:RegisterAnimationSequence("DisabledAR", var_27_151)

	local function var_27_152()
		var_27_13:AnimateSequence("DisabledAR")
		var_27_20:AnimateSequence("DisabledAR")
		var_27_22:AnimateSequence("DisabledAR")
		var_27_24:AnimateSequence("DisabledAR")
		var_27_26:AnimateSequence("DisabledAR")
		var_27_28:AnimateSequence("DisabledAR")
		var_27_30:AnimateSequence("DisabledAR")
		var_27_32:AnimateSequence("DisabledAR")
	end

	var_27_0._sequences.DisabledAR = var_27_152

	local var_27_153
	local var_27_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_6:RegisterAnimationSequence("EnabledAR", var_27_154)

	local var_27_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -395
		}
	}

	var_27_13:RegisterAnimationSequence("EnabledAR", var_27_155)

	local var_27_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("EnabledAR", var_27_156)

	local var_27_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_27_20:RegisterAnimationSequence("EnabledAR", var_27_157)

	local var_27_158 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		}
	}

	var_27_22:RegisterAnimationSequence("EnabledAR", var_27_158)

	local var_27_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		}
	}

	var_27_24:RegisterAnimationSequence("EnabledAR", var_27_159)

	local var_27_160 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_27_26:RegisterAnimationSequence("EnabledAR", var_27_160)

	local var_27_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 24
		}
	}

	var_27_28:RegisterAnimationSequence("EnabledAR", var_27_161)

	local function var_27_162()
		var_27_6:AnimateSequence("EnabledAR")
		var_27_13:AnimateSequence("EnabledAR")
		var_27_18:AnimateSequence("EnabledAR")
		var_27_20:AnimateSequence("EnabledAR")
		var_27_22:AnimateSequence("EnabledAR")
		var_27_24:AnimateSequence("EnabledAR")
		var_27_26:AnimateSequence("EnabledAR")
		var_27_28:AnimateSequence("EnabledAR")
	end

	var_27_0._sequences.EnabledAR = var_27_162

	local var_27_163
	local var_27_164 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -66
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOverTitleAR", var_27_164)

	local var_27_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -249
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonOverTitleAR", var_27_165)

	local function var_27_166()
		var_27_8:AnimateSequence("ButtonOverTitleAR")
		var_27_30:AnimateSequence("ButtonOverTitleAR")
	end

	var_27_0._sequences.ButtonOverTitleAR = var_27_166

	local var_27_167
	local var_27_168 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonUpTitleAR", var_27_168)

	local var_27_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_27_30:RegisterAnimationSequence("ButtonUpTitleAR", var_27_169)

	local function var_27_170()
		var_27_8:AnimateSequence("ButtonUpTitleAR")
		var_27_30:AnimateSequence("ButtonUpTitleAR")
	end

	var_27_0._sequences.ButtonUpTitleAR = var_27_170

	local var_27_171
	local var_27_172 = {
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

	var_27_8:RegisterAnimationSequence("ButtonOverTitle", var_27_172)

	local function var_27_173()
		var_27_8:AnimateSequence("ButtonOverTitle")
	end

	var_27_0._sequences.ButtonOverTitle = var_27_173

	local var_27_174
	local var_27_175 = {
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

	var_27_8:RegisterAnimationSequence("ButtonUpTitle", var_27_175)

	local function var_27_176()
		var_27_8:AnimateSequence("ButtonUpTitle")
	end

	var_27_0._sequences.ButtonUpTitle = var_27_176

	local var_27_177
	local var_27_178 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 310
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_27_20:RegisterAnimationSequence("ModOverNew", var_27_178)

	local var_27_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 305
		}
	}

	var_27_22:RegisterAnimationSequence("ModOverNew", var_27_179)

	local var_27_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		}
	}

	var_27_24:RegisterAnimationSequence("ModOverNew", var_27_180)

	local var_27_181 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 225
		}
	}

	var_27_26:RegisterAnimationSequence("ModOverNew", var_27_181)

	local function var_27_182()
		var_27_20:AnimateSequence("ModOverNew")
		var_27_22:AnimateSequence("ModOverNew")
		var_27_24:AnimateSequence("ModOverNew")
		var_27_26:AnimateSequence("ModOverNew")
	end

	var_27_0._sequences.ModOverNew = var_27_182

	local var_27_183
	local var_27_184 = {
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

	var_27_20:RegisterAnimationSequence("ModOverLimited", var_27_184)

	local var_27_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 230
		}
	}

	var_27_22:RegisterAnimationSequence("ModOverLimited", var_27_185)

	local var_27_186 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_27_24:RegisterAnimationSequence("ModOverLimited", var_27_186)

	local var_27_187 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		}
	}

	var_27_26:RegisterAnimationSequence("ModOverLimited", var_27_187)

	local function var_27_188()
		var_27_20:AnimateSequence("ModOverLimited")
		var_27_22:AnimateSequence("ModOverLimited")
		var_27_24:AnimateSequence("ModOverLimited")
		var_27_26:AnimateSequence("ModOverLimited")
	end

	var_27_0._sequences.ModOverLimited = var_27_188

	local var_27_189
	local var_27_190 = {
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

	var_27_20:RegisterAnimationSequence("ModOverNewAR", var_27_190)

	local var_27_191 = {
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

	var_27_22:RegisterAnimationSequence("ModOverNewAR", var_27_191)

	local var_27_192 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		}
	}

	var_27_24:RegisterAnimationSequence("ModOverNewAR", var_27_192)

	local var_27_193 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 205
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 240
		}
	}

	var_27_26:RegisterAnimationSequence("ModOverNewAR", var_27_193)

	local function var_27_194()
		var_27_20:AnimateSequence("ModOverNewAR")
		var_27_22:AnimateSequence("ModOverNewAR")
		var_27_24:AnimateSequence("ModOverNewAR")
		var_27_26:AnimateSequence("ModOverNewAR")
	end

	var_27_0._sequences.ModOverNewAR = var_27_194

	local var_27_195
	local var_27_196 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_27_20:RegisterAnimationSequence("ModOverLimitedAR", var_27_196)

	local var_27_197 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 230
		}
	}

	var_27_22:RegisterAnimationSequence("ModOverLimitedAR", var_27_197)

	local var_27_198 = {
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

	var_27_24:RegisterAnimationSequence("ModOverLimitedAR", var_27_198)

	local var_27_199 = {
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

	var_27_26:RegisterAnimationSequence("ModOverLimitedAR", var_27_199)

	local function var_27_200()
		var_27_20:AnimateSequence("ModOverLimitedAR")
		var_27_22:AnimateSequence("ModOverLimitedAR")
		var_27_24:AnimateSequence("ModOverLimitedAR")
		var_27_26:AnimateSequence("ModOverLimitedAR")
	end

	var_27_0._sequences.ModOverLimitedAR = var_27_200

	local var_27_201
	local var_27_202 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_27_20:RegisterAnimationSequence("ModUpAR", var_27_202)

	local var_27_203 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		}
	}

	var_27_22:RegisterAnimationSequence("ModUpAR", var_27_203)

	local var_27_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		}
	}

	var_27_24:RegisterAnimationSequence("ModUpAR", var_27_204)

	local var_27_205 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		}
	}

	var_27_26:RegisterAnimationSequence("ModUpAR", var_27_205)

	local function var_27_206()
		var_27_20:AnimateSequence("ModUpAR")
		var_27_22:AnimateSequence("ModUpAR")
		var_27_24:AnimateSequence("ModUpAR")
		var_27_26:AnimateSequence("ModUpAR")
	end

	var_27_0._sequences.ModUpAR = var_27_206

	local var_27_207
	local var_27_208 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 385
		}
	}

	var_27_20:RegisterAnimationSequence("ModUp", var_27_208)

	local var_27_209 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 310
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_27_22:RegisterAnimationSequence("ModUp", var_27_209)

	local var_27_210 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 305
		}
	}

	var_27_24:RegisterAnimationSequence("ModUp", var_27_210)

	local var_27_211 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		}
	}

	var_27_26:RegisterAnimationSequence("ModUp", var_27_211)

	local function var_27_212()
		var_27_20:AnimateSequence("ModUp")
		var_27_22:AnimateSequence("ModUp")
		var_27_24:AnimateSequence("ModUp")
		var_27_26:AnimateSequence("ModUp")
	end

	var_27_0._sequences.ModUp = var_27_212

	local var_27_213
	local var_27_214 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_27_8:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_27_214)

	local var_27_215 = {
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

	var_27_34:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_27_215)

	local var_27_216 = {
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

	var_27_36:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_27_216)

	local function var_27_217()
		var_27_8:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_27_34:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_27_36:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_27_0._sequences.ModPlaylistRestrictionEnabled = var_27_217

	local var_27_218
	local var_27_219 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_34:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_27_219)

	local var_27_220 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_36:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_27_220)

	local function var_27_221()
		var_27_34:AnimateSequence("ModPlaylistRestrictionOff")
		var_27_36:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_27_0._sequences.ModPlaylistRestrictionOff = var_27_221

	local var_27_222
	local var_27_223 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_27_8:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_27_223)

	local var_27_224 = {
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

	var_27_34:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_27_224)

	local var_27_225 = {
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

	var_27_36:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_27_225)

	local function var_27_226()
		var_27_8:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_27_34:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_27_36:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_27_0._sequences.ModPlaylistRestrictionDisabled = var_27_226

	var_27_0:addEventHandler("button_disable", function(arg_55_0, arg_55_1)
		if not arg_55_1.controller then
			local var_55_0 = var_27_1
		end

		ACTIONS.AnimateSequence(var_27_0, "ButtonUpDisabled")

		if CONDITIONS.IsArabic() then
			ACTIONS.AnimateSequence(var_27_0, "ButtonUpTitleAR")
		end

		if not CONDITIONS.IsArabic() then
			ACTIONS.AnimateSequence(var_27_0, "ButtonUpTitle")
		end
	end)
	var_0_10(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("PlaylistFeaturedButton", PlaylistFeaturedButton)
LockTable(_M)
