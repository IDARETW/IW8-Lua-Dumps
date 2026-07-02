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
		local var_5_4 = arg_4_0:GetDataSource(controllerIndex)

		if var_5_4 and var_5_4.isNew then
			var_5_3 = var_5_4.isNew:GetValue(controllerIndex)
		end

		if IsLanguageArabic() then
			local var_5_5 = var_5_0.right + var_0_0

			arg_4_0.GamemodeName:SetLeft(var_5_5 + var_5_1 + var_0_0)

			if var_5_3 then
				var_0_5(arg_4_0, controllerIndex, arg_4_0.NewItemSmallIcon)
				arg_4_0.GamemodeName:SetLeft(arg_4_0.LimitedTimeIcon:GetCurrentAnchorsAndPositions().right + var_5_2 + var_0_1)
			end
		else
			local var_5_6 = var_5_0.left - var_0_0

			arg_4_0.GamemodeName:SetRight(var_5_6 - var_5_1 - var_0_0)

			if var_5_3 then
				var_0_5(arg_4_0, controllerIndex, arg_4_0.NewItemSmallIcon)
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

				var_0_5(arg_4_0, controllerIndex, arg_7_0)
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

				var_0_5(arg_4_0, controllerIndex, arg_7_0)
				arg_4_0.GamemodeName:SetRight(arg_4_0.LimitedTimeIcon:GetCurrentAnchorsAndPositions().left - var_7_1 - var_0_1)
			end
		end
	end

	local function var_4_3(arg_8_0, arg_8_1)
		if arg_8_0:GetValue(controllerIndex) > 1 then
			local var_8_0 = var_4_1()

			var_8_0:setImage(RegisterMaterial(arg_8_1))
			var_4_2(var_8_0)
		end
	end

	var_4_3(arg_4_0:GetDataSource().xpScale, "icon_double_xp")
	var_4_3(arg_4_0:GetDataSource().weaponXpScale, "icon_double_weapon_xp")
	var_4_3(arg_4_0:GetDataSource().battlePassXpScale, "icon_double_battle_xp")
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
	elseif arg_11_1 == var_0_2.Full then
		arg_11_0.LimitedTimeNotification:SetAlpha(1, 500)
		arg_11_0.LimitedTimeIcon:SetAlpha(0)

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
							LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_13_1.controller, false, {
								openFromPlaylist = true
							})
						else
							LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_13_1.controller, false, {
								openFromPlaylist = true
							})
						end
					end)
				end

				local var_13_8 = Playlist.DEJGAECIBG(var_13_2, var_13_1)

				if not var_13_4 and var_13_3 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					local var_13_9 = {}

					table.insert(var_13_9, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						invalidPlaylists = var_13_9
					})
				elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_13_0, arg_12_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_12_1, false, {
						isSplitScreenWarning = true,
						controllerIndex = arg_12_1,
						text = var_13_0.name:GetValue(arg_12_1)
					})
				elseif not Engine.FIDIEBFAG(arg_12_1) and var_13_6 <= var_13_5 then
					local var_13_10 = {
						controllerIndex = arg_12_1,
						onAccept = var_13_7,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_12_1, false, var_13_10)
				elseif var_13_8 and Engine.JACCCCEDI() then
					local var_13_11 = {}

					table.insert(var_13_11, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						premium = true,
						invalidPlaylists = var_13_11
					})
				elseif var_13_8 and not Engine.HBIAGEFCC() then
					local var_13_12 = {}

					table.insert(var_13_12, var_13_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_12_1, false, {
						subscription = true,
						invalidPlaylists = var_13_12
					})
				else
					var_13_7()
				end
			end
		end
	end)

	local function var_12_0(arg_16_0)
		arg_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_16_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end

	local function var_12_1(arg_17_0)
		arg_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_17_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	arg_12_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		arg_12_0._isFocused = true

		var_0_8(arg_12_0, arg_12_1)

		if not LUI.IsLastInputMouseNavigation(arg_12_1) then
			var_12_0(arg_18_0)
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOver")
			arg_12_0.NewItemSmallIcon:SetAlpha(0)
			arg_12_0.NewItemNotification:SetAlpha(arg_12_0._isNewShown and 1 or 0, 400)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitle")
			end

			var_0_9(arg_18_0, var_0_2.Full)
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverKBM")
		end

		arg_18_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_12_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		arg_12_0._isFocused = false

		var_12_1(arg_19_0)
		ACTIONS.AnimateSequence(arg_19_0, "ButtonUp")
		arg_12_0.NewItemSmallIcon:SetAlpha(arg_12_0._isNewShown and 1 or 0, 150)
		arg_12_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitle")
		end

		var_0_9(arg_19_0, var_0_2.Mini)
	end)
	arg_12_0:addEventHandler("button_over_disable", function(arg_20_0, arg_20_1)
		arg_12_0._isFocused = true

		var_0_8(arg_12_0, arg_12_1)

		if not LUI.IsLastInputMouseNavigation(arg_12_1) then
			var_12_0(arg_20_0)
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabled")
			arg_12_0.NewItemSmallIcon:SetAlpha(0)
			arg_12_0.NewItemNotification:SetAlpha(arg_12_0._isNewShown and 1 or 0, 400)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_12_0, "ButtonOverTitle")
			end

			var_0_9(arg_20_0, var_0_2.Full)
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabledKBM")
		end
	end)
	arg_12_0:addEventHandler("button_up_disable", function(arg_21_0, arg_21_1)
		arg_12_0._isFocused = false

		var_12_1(arg_21_0)
		ACTIONS.AnimateSequence(arg_21_0, "ButtonUpDisabled")
		arg_12_0.NewItemSmallIcon:SetAlpha(arg_12_0._isNewShown and 1 or 0, 400)
		arg_12_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonUpTitle")
		end

		var_0_9(arg_21_0, var_0_2.Mini)
	end)
	arg_12_0:addEventHandler("button_disable", function(arg_22_0, arg_22_1)
		arg_12_0._isButtonEnabled = false

		var_12_1(arg_22_0)
		arg_12_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "DisabledAR" or "Disabled")
		var_0_9(arg_22_0, var_0_2.Mini)

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

	arg_12_0:addEventHandler("enable", function(arg_23_0, arg_23_1)
		arg_12_0._isButtonEnabled = true

		arg_12_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "EnabledAR" or "Enabled")

		if arg_12_0._isDataSourceValid then
			arg_12_0:UpdateModifiers()
		end
	end)
	arg_12_0:SubscribeToModelThroughElement(arg_12_0, "isLimitedTime", function()
		arg_12_0._isLimitedTime = arg_12_0:GetDataSource().isLimitedTime:GetValue(arg_12_1)

		local var_24_0 = arg_12_0.LimitedTimeIcon
		local var_24_1 = 0.6

		if arg_12_0._isLimitedTime then
			var_24_0:SetAlpha(var_24_1, 300)
		else
			var_24_0:SetAlpha(0)
		end
	end)
	arg_12_0:SubscribeToModelThroughElement(arg_12_0, "desc", function()
		var_0_8(arg_12_0, arg_12_1)
	end)
end

function PlaylistFeaturedButton(arg_26_0, arg_26_1)
	local var_26_0 = LUI.UIButton.new()

	var_26_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_26_0.id = "PlaylistFeaturedButton"
	var_26_0._animationSets = var_26_0._animationSets or {}
	var_26_0._sequences = var_26_0._sequences or {}

	local var_26_1 = arg_26_1 and arg_26_1.controllerIndex

	if not var_26_1 and not Engine.DDJFBBJAIG() then
		var_26_1 = var_26_0:getRootController()
	end

	assert(var_26_1)

	local var_26_2 = var_26_0
	local var_26_3
	local var_26_4 = MenuBuilder.BuildRegisteredType("FeaturedButtonBackground", {
		controllerIndex = var_26_1
	})

	var_26_4.id = "Background"

	var_26_4.BackgroundImage:SetTop(_1080p * -108, 0)
	var_26_4.BackgroundImage:SetBottom(_1080p * 108, 0)
	var_26_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_26_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_26_0:addElement(var_26_4)

	var_26_0.Background = var_26_4

	local var_26_5
	local var_26_6 = LUI.UIImage.new()

	var_26_6.id = "Backer"

	var_26_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_26_6:SetAlpha(0, 0)
	var_26_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_26_0:addElement(var_26_6)

	var_26_0.Backer = var_26_6

	local var_26_7
	local var_26_8 = LUI.UIStyledText.new()

	var_26_8.id = "GamemodeName"

	var_26_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_26_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_8:SetWordWrap(false)
	var_26_8:SetAlignment(LUI.Alignment.Left)
	var_26_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_26_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_26_8:SetStartupDelay(1000)
	var_26_8:SetLineHoldTime(400)
	var_26_8:SetAnimMoveTime(2000)
	var_26_8:SetAnimMoveSpeed(150)
	var_26_8:SetEndDelay(2000)
	var_26_8:SetCrossfadeTime(1000)
	var_26_8:SetFadeInTime(300)
	var_26_8:SetFadeOutTime(300)
	var_26_8:SetMaxVisibleLines(1)
	var_26_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 303, _1080p * -15, _1080p * 15)

	local function var_26_9()
		local var_27_0 = var_26_0:GetDataSource().name:GetValue(var_26_1)

		if var_27_0 ~= nil then
			var_26_8:setText(ToUpperCase(var_27_0), 0)
		end
	end

	var_26_8:SubscribeToModelThroughElement(var_26_0, "name", var_26_9)
	var_26_0:addElement(var_26_8)

	var_26_0.GamemodeName = var_26_8

	local var_26_10
	local var_26_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_26_1
	})

	var_26_11.id = "NewItemNotification"

	var_26_11:SetAlpha(0, 0)
	var_26_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * -19, _1080p * 11)
	var_26_0:addElement(var_26_11)

	var_26_0.NewItemNotification = var_26_11

	local var_26_12
	local var_26_13 = LUI.UIImage.new()

	var_26_13.id = "Lock"

	var_26_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_26_13:SetAlpha(0, 0)
	var_26_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_26_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_26_0:addElement(var_26_13)

	var_26_0.Lock = var_26_13

	local var_26_14
	local var_26_15 = LUI.UIStyledText.new()

	var_26_15.id = "Description"

	var_26_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_26_15:SetAlpha(0, 0)
	var_26_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_15:SetAlignment(LUI.Alignment.Left)
	var_26_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_26_15:SetStartupDelay(2000)
	var_26_15:SetLineHoldTime(400)
	var_26_15:SetAnimMoveTime(2000)
	var_26_15:SetAnimMoveSpeed(150)
	var_26_15:SetEndDelay(2000)
	var_26_15:SetCrossfadeTime(2000)
	var_26_15:SetFadeInTime(300)
	var_26_15:SetFadeOutTime(300)
	var_26_15:SetMaxVisibleLines(3)
	var_26_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 336, _1080p * -24, _1080p * -4)

	local function var_26_16()
		local var_28_0 = var_26_0:GetDataSource().desc:GetValue(var_26_1)

		if var_28_0 ~= nil then
			var_26_15:setText(var_28_0, 0)
		end
	end

	var_26_15:SubscribeToModelThroughElement(var_26_0, "desc", var_26_16)
	var_26_0:addElement(var_26_15)

	var_26_0.Description = var_26_15

	local var_26_17
	local var_26_18 = LUI.UIStyledText.new()

	var_26_18.id = "DisabledText"

	var_26_18:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_26_18:SetAlpha(0, 0)
	var_26_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_26_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_18:SetWordWrap(false)
	var_26_18:SetAlignment(LUI.Alignment.Left)
	var_26_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_26_18:SetStartupDelay(2000)
	var_26_18:SetLineHoldTime(400)
	var_26_18:SetAnimMoveTime(2000)
	var_26_18:SetAnimMoveSpeed(150)
	var_26_18:SetEndDelay(2000)
	var_26_18:SetCrossfadeTime(1000)
	var_26_18:SetFadeInTime(300)
	var_26_18:SetFadeOutTime(300)
	var_26_18:SetMaxVisibleLines(1)
	var_26_18:SetShadowMinDistance(-0.2, 0)
	var_26_18:SetShadowMaxDistance(0.2, 0)
	var_26_18:SetShadowUOffset(-0.002, 0)
	var_26_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_26_0:addElement(var_26_18)

	var_26_0.DisabledText = var_26_18

	local var_26_19
	local var_26_20 = LUI.UIImage.new()

	var_26_20.id = "ModifierIcon1"

	var_26_20:SetAlpha(0, 0)
	var_26_20:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_26_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 395, _1080p * 425, _1080p * -15, _1080p * 15)
	var_26_0:addElement(var_26_20)

	var_26_0.ModifierIcon1 = var_26_20

	local var_26_21
	local var_26_22 = LUI.UIImage.new()

	var_26_22.id = "ModifierIcon2"

	var_26_22:SetAlpha(0, 0)
	var_26_22:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_26_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 365, _1080p * 395, _1080p * -15, _1080p * 15)
	var_26_0:addElement(var_26_22)

	var_26_0.ModifierIcon2 = var_26_22

	local var_26_23
	local var_26_24 = LUI.UIImage.new()

	var_26_24.id = "ModifierIcon3"

	var_26_24:SetAlpha(0, 0)
	var_26_24:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_26_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 335, _1080p * 365, _1080p * -15, _1080p * 15)
	var_26_0:addElement(var_26_24)

	var_26_0.ModifierIcon3 = var_26_24

	local var_26_25
	local var_26_26 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_26_1
	})

	var_26_26.id = "NewItemSmallIcon"

	var_26_26:SetAlpha(0, 0)
	var_26_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -4, _1080p * 4)
	var_26_0:addElement(var_26_26)

	var_26_0.NewItemSmallIcon = var_26_26

	local var_26_27
	local var_26_28 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_26_1
	})

	var_26_28.id = "LimitedTimeNotification"

	var_26_28:SetAlpha(0, 0)
	var_26_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -167, _1080p * -11, _1080p * 115, _1080p * 145)
	var_26_0:addElement(var_26_28)

	var_26_0.LimitedTimeNotification = var_26_28

	local var_26_29
	local var_26_30 = LUI.UIImage.new()

	var_26_30.id = "LimitedTimeIcon"

	var_26_30:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_26_30:SetAlpha(0, 0)
	var_26_30:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_26_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 397, _1080p * 421, _1080p * -12, _1080p * 12)
	var_26_0:addElement(var_26_30)

	var_26_0.LimitedTimeIcon = var_26_30

	local function var_26_31()
		return
	end

	var_26_0._sequences.DefaultSequence = var_26_31

	local var_26_32
	local var_26_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_26_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_26_0.Background.BackgroundImage
		}
	}

	var_26_4:RegisterAnimationSequence("ButtonOver", var_26_33)

	local var_26_34 = {
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

	var_26_8:RegisterAnimationSequence("ButtonOver", var_26_34)

	local var_26_35 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_13:RegisterAnimationSequence("ButtonOver", var_26_35)

	local var_26_36 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_15:RegisterAnimationSequence("ButtonOver", var_26_36)

	local var_26_37 = {
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

	var_26_20:RegisterAnimationSequence("ButtonOver", var_26_37)

	local var_26_38 = {
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

	var_26_22:RegisterAnimationSequence("ButtonOver", var_26_38)

	local var_26_39 = {
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

	var_26_24:RegisterAnimationSequence("ButtonOver", var_26_39)

	local var_26_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
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

	var_26_28:RegisterAnimationSequence("ButtonOver", var_26_40)

	local var_26_41 = {
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

	var_26_30:RegisterAnimationSequence("ButtonOver", var_26_41)

	local function var_26_42()
		var_26_4:AnimateSequence("ButtonOver")
		var_26_8:AnimateSequence("ButtonOver")
		var_26_13:AnimateSequence("ButtonOver")
		var_26_15:AnimateSequence("ButtonOver")
		var_26_20:AnimateSequence("ButtonOver")
		var_26_22:AnimateSequence("ButtonOver")
		var_26_24:AnimateSequence("ButtonOver")
		var_26_28:AnimateSequence("ButtonOver")
		var_26_30:AnimateSequence("ButtonOver")
	end

	var_26_0._sequences.ButtonOver = var_26_42

	local var_26_43
	local var_26_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonUp", var_26_44)

	local var_26_45 = {
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

	var_26_8:RegisterAnimationSequence("ButtonUp", var_26_45)

	local var_26_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_11:RegisterAnimationSequence("ButtonUp", var_26_46)

	local var_26_47 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_13:RegisterAnimationSequence("ButtonUp", var_26_47)

	local var_26_48 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_15:RegisterAnimationSequence("ButtonUp", var_26_48)

	local var_26_49 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonUp", var_26_49)

	local var_26_50 = {
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

	var_26_20:RegisterAnimationSequence("ButtonUp", var_26_50)

	local var_26_51 = {
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

	var_26_22:RegisterAnimationSequence("ButtonUp", var_26_51)

	local var_26_52 = {
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

	var_26_24:RegisterAnimationSequence("ButtonUp", var_26_52)

	local var_26_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_28:RegisterAnimationSequence("ButtonUp", var_26_53)

	local var_26_54 = {
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

	var_26_30:RegisterAnimationSequence("ButtonUp", var_26_54)

	local function var_26_55()
		var_26_6:AnimateSequence("ButtonUp")
		var_26_8:AnimateSequence("ButtonUp")
		var_26_11:AnimateSequence("ButtonUp")
		var_26_13:AnimateSequence("ButtonUp")
		var_26_15:AnimateSequence("ButtonUp")
		var_26_18:AnimateSequence("ButtonUp")
		var_26_20:AnimateSequence("ButtonUp")
		var_26_22:AnimateSequence("ButtonUp")
		var_26_24:AnimateSequence("ButtonUp")
		var_26_28:AnimateSequence("ButtonUp")
		var_26_30:AnimateSequence("ButtonUp")
	end

	var_26_0._sequences.ButtonUp = var_26_55

	local var_26_56
	local var_26_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_26_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_26_0.Background.BackgroundImage
		}
	}

	var_26_4:RegisterAnimationSequence("ButtonOverDisabled", var_26_57)

	local var_26_58 = {
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

	var_26_6:RegisterAnimationSequence("ButtonOverDisabled", var_26_58)

	local var_26_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverDisabled", var_26_59)

	local var_26_60 = {
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

	var_26_13:RegisterAnimationSequence("ButtonOverDisabled", var_26_60)

	local var_26_61 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_15:RegisterAnimationSequence("ButtonOverDisabled", var_26_61)

	local var_26_62 = {
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

	var_26_18:RegisterAnimationSequence("ButtonOverDisabled", var_26_62)

	local var_26_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_26_20:RegisterAnimationSequence("ButtonOverDisabled", var_26_63)

	local var_26_64 = {
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

	var_26_22:RegisterAnimationSequence("ButtonOverDisabled", var_26_64)

	local var_26_65 = {
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

	var_26_24:RegisterAnimationSequence("ButtonOverDisabled", var_26_65)

	local var_26_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_28:RegisterAnimationSequence("ButtonOverDisabled", var_26_66)

	local function var_26_67()
		var_26_4:AnimateSequence("ButtonOverDisabled")
		var_26_6:AnimateSequence("ButtonOverDisabled")
		var_26_8:AnimateSequence("ButtonOverDisabled")
		var_26_13:AnimateSequence("ButtonOverDisabled")
		var_26_15:AnimateSequence("ButtonOverDisabled")
		var_26_18:AnimateSequence("ButtonOverDisabled")
		var_26_20:AnimateSequence("ButtonOverDisabled")
		var_26_22:AnimateSequence("ButtonOverDisabled")
		var_26_24:AnimateSequence("ButtonOverDisabled")
		var_26_28:AnimateSequence("ButtonOverDisabled")
	end

	var_26_0._sequences.ButtonOverDisabled = var_26_67

	local var_26_68
	local var_26_69 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonUpDisabled", var_26_69)

	local var_26_70 = {
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

	var_26_8:RegisterAnimationSequence("ButtonUpDisabled", var_26_70)

	local var_26_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_11:RegisterAnimationSequence("ButtonUpDisabled", var_26_71)

	local var_26_72 = {
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

	var_26_13:RegisterAnimationSequence("ButtonUpDisabled", var_26_72)

	local var_26_73 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_15:RegisterAnimationSequence("ButtonUpDisabled", var_26_73)

	local var_26_74 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonUpDisabled", var_26_74)

	local var_26_75 = {
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

	var_26_20:RegisterAnimationSequence("ButtonUpDisabled", var_26_75)

	local var_26_76 = {
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

	var_26_22:RegisterAnimationSequence("ButtonUpDisabled", var_26_76)

	local var_26_77 = {
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

	var_26_24:RegisterAnimationSequence("ButtonUpDisabled", var_26_77)

	local var_26_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_28:RegisterAnimationSequence("ButtonUpDisabled", var_26_78)

	local function var_26_79()
		var_26_6:AnimateSequence("ButtonUpDisabled")
		var_26_8:AnimateSequence("ButtonUpDisabled")
		var_26_11:AnimateSequence("ButtonUpDisabled")
		var_26_13:AnimateSequence("ButtonUpDisabled")
		var_26_15:AnimateSequence("ButtonUpDisabled")
		var_26_18:AnimateSequence("ButtonUpDisabled")
		var_26_20:AnimateSequence("ButtonUpDisabled")
		var_26_22:AnimateSequence("ButtonUpDisabled")
		var_26_24:AnimateSequence("ButtonUpDisabled")
		var_26_28:AnimateSequence("ButtonUpDisabled")
	end

	var_26_0._sequences.ButtonUpDisabled = var_26_79

	local var_26_80
	local var_26_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_26_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_26_0.Background.BackgroundImage
		}
	}

	var_26_4:RegisterAnimationSequence("ButtonOverKBM", var_26_81)

	local var_26_82 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonOverKBM", var_26_82)

	local var_26_83 = {
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

	var_26_8:RegisterAnimationSequence("ButtonOverKBM", var_26_83)

	local var_26_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_11:RegisterAnimationSequence("ButtonOverKBM", var_26_84)

	local var_26_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_13:RegisterAnimationSequence("ButtonOverKBM", var_26_85)

	local var_26_86 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonOverKBM", var_26_86)

	local function var_26_87()
		var_26_4:AnimateSequence("ButtonOverKBM")
		var_26_6:AnimateSequence("ButtonOverKBM")
		var_26_8:AnimateSequence("ButtonOverKBM")
		var_26_11:AnimateSequence("ButtonOverKBM")
		var_26_13:AnimateSequence("ButtonOverKBM")
		var_26_18:AnimateSequence("ButtonOverKBM")
	end

	var_26_0._sequences.ButtonOverKBM = var_26_87

	local var_26_88
	local var_26_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_26_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_26_0.Background.BackgroundImage
		}
	}

	var_26_4:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_89)

	local var_26_90 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_90)

	local var_26_91 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_91)

	local var_26_92 = {
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

	var_26_13:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_92)

	local var_26_93 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_93)

	local var_26_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_28:RegisterAnimationSequence("ButtonOverDisabledKBM", var_26_94)

	local function var_26_95()
		var_26_4:AnimateSequence("ButtonOverDisabledKBM")
		var_26_6:AnimateSequence("ButtonOverDisabledKBM")
		var_26_8:AnimateSequence("ButtonOverDisabledKBM")
		var_26_13:AnimateSequence("ButtonOverDisabledKBM")
		var_26_18:AnimateSequence("ButtonOverDisabledKBM")
		var_26_28:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_26_0._sequences.ButtonOverDisabledKBM = var_26_95

	local var_26_96
	local var_26_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_26_8:RegisterAnimationSequence("AR", var_26_97)

	local var_26_98 = {
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

	var_26_11:RegisterAnimationSequence("AR", var_26_98)

	local var_26_99 = {
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

	var_26_13:RegisterAnimationSequence("AR", var_26_99)

	local var_26_100 = {
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

	var_26_15:RegisterAnimationSequence("AR", var_26_100)

	local var_26_101 = {
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

	var_26_18:RegisterAnimationSequence("AR", var_26_101)

	local var_26_102 = {
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

	var_26_20:RegisterAnimationSequence("AR", var_26_102)

	local var_26_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		}
	}

	var_26_22:RegisterAnimationSequence("AR", var_26_103)

	local var_26_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		}
	}

	var_26_24:RegisterAnimationSequence("AR", var_26_104)

	local var_26_105 = {
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

	var_26_26:RegisterAnimationSequence("AR", var_26_105)

	local var_26_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_26_28:RegisterAnimationSequence("AR", var_26_106)

	local var_26_107 = {
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

	var_26_30:RegisterAnimationSequence("AR", var_26_107)

	local function var_26_108()
		var_26_8:AnimateSequence("AR")
		var_26_11:AnimateSequence("AR")
		var_26_13:AnimateSequence("AR")
		var_26_15:AnimateSequence("AR")
		var_26_18:AnimateSequence("AR")
		var_26_20:AnimateSequence("AR")
		var_26_22:AnimateSequence("AR")
		var_26_24:AnimateSequence("AR")
		var_26_26:AnimateSequence("AR")
		var_26_28:AnimateSequence("AR")
		var_26_30:AnimateSequence("AR")
	end

	var_26_0._sequences.AR = var_26_108

	local var_26_109
	local var_26_110 = {
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

	var_26_13:RegisterAnimationSequence("Disabled", var_26_110)

	local var_26_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 363
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 392
		}
	}

	var_26_20:RegisterAnimationSequence("Disabled", var_26_111)

	local var_26_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 363
		}
	}

	var_26_22:RegisterAnimationSequence("Disabled", var_26_112)

	local var_26_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 303
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 333
		}
	}

	var_26_24:RegisterAnimationSequence("Disabled", var_26_113)

	local var_26_114 = {
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

	var_26_26:RegisterAnimationSequence("Disabled", var_26_114)

	local var_26_115 = {
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

	var_26_28:RegisterAnimationSequence("Disabled", var_26_115)

	local var_26_116 = {
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

	var_26_30:RegisterAnimationSequence("Disabled", var_26_116)

	local function var_26_117()
		var_26_13:AnimateSequence("Disabled")
		var_26_20:AnimateSequence("Disabled")
		var_26_22:AnimateSequence("Disabled")
		var_26_24:AnimateSequence("Disabled")
		var_26_26:AnimateSequence("Disabled")
		var_26_28:AnimateSequence("Disabled")
		var_26_30:AnimateSequence("Disabled")
	end

	var_26_0._sequences.Disabled = var_26_117

	local var_26_118
	local var_26_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_6:RegisterAnimationSequence("Enabled", var_26_119)

	local var_26_120 = {
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

	var_26_13:RegisterAnimationSequence("Enabled", var_26_120)

	local var_26_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("Enabled", var_26_121)

	local var_26_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 395
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 425
		}
	}

	var_26_20:RegisterAnimationSequence("Enabled", var_26_122)

	local var_26_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 365
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 395
		}
	}

	var_26_22:RegisterAnimationSequence("Enabled", var_26_123)

	local var_26_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 365
		}
	}

	var_26_24:RegisterAnimationSequence("Enabled", var_26_124)

	local var_26_125 = {
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

	var_26_26:RegisterAnimationSequence("Enabled", var_26_125)

	local function var_26_126()
		var_26_6:AnimateSequence("Enabled")
		var_26_13:AnimateSequence("Enabled")
		var_26_18:AnimateSequence("Enabled")
		var_26_20:AnimateSequence("Enabled")
		var_26_22:AnimateSequence("Enabled")
		var_26_24:AnimateSequence("Enabled")
		var_26_26:AnimateSequence("Enabled")
	end

	var_26_0._sequences.Enabled = var_26_126

	local var_26_127
	local var_26_128 = {
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

	var_26_13:RegisterAnimationSequence("DisabledAR", var_26_128)

	local var_26_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		}
	}

	var_26_20:RegisterAnimationSequence("DisabledAR", var_26_129)

	local var_26_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		}
	}

	var_26_22:RegisterAnimationSequence("DisabledAR", var_26_130)

	local var_26_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 125
		}
	}

	var_26_24:RegisterAnimationSequence("DisabledAR", var_26_131)

	local var_26_132 = {
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

	var_26_26:RegisterAnimationSequence("DisabledAR", var_26_132)

	local var_26_133 = {
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

	var_26_28:RegisterAnimationSequence("DisabledAR", var_26_133)

	local var_26_134 = {
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

	var_26_30:RegisterAnimationSequence("DisabledAR", var_26_134)

	local function var_26_135()
		var_26_13:AnimateSequence("DisabledAR")
		var_26_20:AnimateSequence("DisabledAR")
		var_26_22:AnimateSequence("DisabledAR")
		var_26_24:AnimateSequence("DisabledAR")
		var_26_26:AnimateSequence("DisabledAR")
		var_26_28:AnimateSequence("DisabledAR")
		var_26_30:AnimateSequence("DisabledAR")
	end

	var_26_0._sequences.DisabledAR = var_26_135

	local var_26_136
	local var_26_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_6:RegisterAnimationSequence("EnabledAR", var_26_137)

	local var_26_138 = {
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

	var_26_13:RegisterAnimationSequence("EnabledAR", var_26_138)

	local var_26_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_18:RegisterAnimationSequence("EnabledAR", var_26_139)

	local var_26_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
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

	var_26_20:RegisterAnimationSequence("EnabledAR", var_26_140)

	local var_26_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		}
	}

	var_26_22:RegisterAnimationSequence("EnabledAR", var_26_141)

	local var_26_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		}
	}

	var_26_24:RegisterAnimationSequence("EnabledAR", var_26_142)

	local var_26_143 = {
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

	var_26_26:RegisterAnimationSequence("EnabledAR", var_26_143)

	local function var_26_144()
		var_26_6:AnimateSequence("EnabledAR")
		var_26_13:AnimateSequence("EnabledAR")
		var_26_18:AnimateSequence("EnabledAR")
		var_26_20:AnimateSequence("EnabledAR")
		var_26_22:AnimateSequence("EnabledAR")
		var_26_24:AnimateSequence("EnabledAR")
		var_26_26:AnimateSequence("EnabledAR")
	end

	var_26_0._sequences.EnabledAR = var_26_144

	local var_26_145
	local var_26_146 = {
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

	var_26_8:RegisterAnimationSequence("ButtonOverTitleAR", var_26_146)

	local var_26_147 = {
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

	var_26_28:RegisterAnimationSequence("ButtonOverTitleAR", var_26_147)

	local function var_26_148()
		var_26_8:AnimateSequence("ButtonOverTitleAR")
		var_26_28:AnimateSequence("ButtonOverTitleAR")
	end

	var_26_0._sequences.ButtonOverTitleAR = var_26_148

	local var_26_149
	local var_26_150 = {
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

	var_26_8:RegisterAnimationSequence("ButtonUpTitleAR", var_26_150)

	local var_26_151 = {
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

	var_26_28:RegisterAnimationSequence("ButtonUpTitleAR", var_26_151)

	local function var_26_152()
		var_26_8:AnimateSequence("ButtonUpTitleAR")
		var_26_28:AnimateSequence("ButtonUpTitleAR")
	end

	var_26_0._sequences.ButtonUpTitleAR = var_26_152

	local var_26_153
	local var_26_154 = {
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

	var_26_8:RegisterAnimationSequence("ButtonOverTitle", var_26_154)

	local function var_26_155()
		var_26_8:AnimateSequence("ButtonOverTitle")
	end

	var_26_0._sequences.ButtonOverTitle = var_26_155

	local var_26_156
	local var_26_157 = {
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

	var_26_8:RegisterAnimationSequence("ButtonUpTitle", var_26_157)

	local function var_26_158()
		var_26_8:AnimateSequence("ButtonUpTitle")
	end

	var_26_0._sequences.ButtonUpTitle = var_26_158

	var_26_0:addEventHandler("button_disable", function(arg_45_0, arg_45_1)
		if not arg_45_1.controller then
			local var_45_0 = var_26_1
		end

		ACTIONS.AnimateSequence(var_26_0, "ButtonUpDisabled")

		if CONDITIONS.IsArabic(var_26_0) then
			ACTIONS.AnimateSequence(var_26_0, "ButtonUpTitleAR")
		end

		if not CONDITIONS.IsArabic(var_26_0) then
			ACTIONS.AnimateSequence(var_26_0, "ButtonUpTitle")
		end
	end)
	var_0_10(var_26_0, var_26_1, arg_26_1)

	return var_26_0
end

MenuBuilder.registerType("PlaylistFeaturedButton", PlaylistFeaturedButton)
LockTable(_M)
