module(..., package.seeall)

local var_0_0 = 16 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0._isNew = arg_1_1
end

local function var_0_2(arg_2_0)
	if arg_2_0._isButtonEnabled and arg_2_0._isNew then
		arg_2_0.NewItemSmallIcon:SetAlpha(arg_2_0._isFocused and 1 or 0)

		arg_2_0._isNewShown = true
	else
		arg_2_0.NewItemSmallIcon:SetAlpha(0)

		arg_2_0._isNewShown = false
	end
end

local function var_0_3(arg_3_0)
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
		}
	}

	;(function()
		for iter_4_0 = 1, #var_3_0 do
			if not var_3_0[iter_4_0].isUsed then
				var_3_0[iter_4_0].isUsed = false

				var_3_0[iter_4_0].icon:SetAlpha(0)
			end
		end

		local var_4_0 = arg_3_0.NewItemSmallIcon:GetCurrentAnchorsAndPositions()
		local var_4_1 = LAYOUT.GetElementWidth(arg_3_0.NewItemSmallIcon)

		if IsLanguageArabic() then
			local var_4_2 = var_4_0.right + var_4_1 + var_0_0

			arg_3_0.Name:SetLeft(var_4_2)
		else
			local var_4_3 = var_4_0.left - var_0_0

			arg_3_0.Name:SetRight(var_4_3)
		end
	end)()

	local function var_3_1()
		for iter_5_0 = 1, #var_3_0 do
			if not var_3_0[iter_5_0].isUsed then
				var_3_0[iter_5_0].isUsed = true

				local var_5_0 = var_3_0[iter_5_0].icon

				var_5_0:SetAlpha(1)

				local var_5_1 = LAYOUT.GetElementWidth(arg_3_0.NewItemSmallIcon)

				if IsLanguageArabic() then
					local var_5_2 = var_5_0:GetCurrentAnchorsAndPositions().right + var_0_0

					arg_3_0.NewItemSmallIcon:SetLeft(var_5_2)
					arg_3_0.NewItemSmallIcon:SetRight(var_5_2 + var_5_1)
					arg_3_0.Name:SetLeft(var_5_2 + var_5_1 + var_0_0)
				else
					local var_5_3 = var_5_0:GetCurrentAnchorsAndPositions().left - var_0_0

					arg_3_0.NewItemSmallIcon:SetRight(var_5_3)
					arg_3_0.NewItemSmallIcon:SetLeft(var_5_3 - var_5_1)
					arg_3_0.Name:SetRight(var_5_3 - var_5_1 - var_0_0)
				end

				return var_5_0
			end
		end
	end

	local var_3_2 = arg_3_0._isDataSourceValid and PlaylistUtils.DoesCategoryContainXPBoost(arg_3_0:GetDataSource(), arg_3_0._controllerIndex)

	if var_3_2 and #var_3_2 >= 1 then
		for iter_3_0, iter_3_1 in pairs(var_3_2) do
			if iter_3_0 == LOOT.doubleXpTypes.XP and iter_3_1 then
				var_3_1():setImage(RegisterMaterial("icon_double_xp_mini"), 0)
			elseif iter_3_0 == LOOT.doubleXpTypes.WEAPON and iter_3_1 then
				var_3_1():setImage(RegisterMaterial("icon_double_weapon_xp_mini"), 0)
			elseif iter_3_0 == LOOT.doubleXpTypes.BATTLE_PASS and iter_3_1 then
				var_3_1():setImage(RegisterMaterial("icon_double_battle_xp_mini"), 0)
			end
		end
	end

	local var_3_3 = arg_3_0:GetDataSource()

	if arg_3_0._isDataSourceValid and var_3_3 then
		PlaylistUtils.UpdatePlaylistRestrictionVisualsViaDataSource(arg_3_0, arg_3_0._controllerIndex, {
			playlistDataSource = var_3_3
		})
	end
end

local function var_0_4(arg_6_0)
	arg_6_0._isDataSourceValid = true

	arg_6_0:UpdateModifiers()
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.UpdateModifiers = var_0_3
	arg_7_0.OnDataSourceAssigned = var_0_4
	arg_7_0._controllerIndex = arg_7_1
	arg_7_0._isNew = false
	arg_7_0.SetNew = var_0_1
	arg_7_0.UpdateBreadcrumb = var_0_2
	arg_7_0._isNewShown = false
	arg_7_0._isFocused = true
	arg_7_0._isButtonEnabled = true
	arg_7_0._isDataSourceValid = false

	local function var_7_0(arg_8_0)
		Lobby.TryNavigateToLobby(function()
			local var_9_0 = arg_8_0:GetDataSource()
			local var_9_1 = var_9_0.index:GetValue(arg_7_1)

			Playlist.CDBBECIGIG(var_9_1, PlaylistUtils.USE_FILTERED_PLAYLIST_ID)

			if CONDITIONS.IsMagmaGameMode(arg_7_0) then
				local function var_9_2()
					LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_7_1, false, {
						openFromPlaylist = true
					})
				end

				if PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(arg_7_0, arg_7_1, var_9_0, var_9_2) then
					-- block empty
				else
					var_9_2()
				end
			else
				LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_7_1, false, {
					openFromPlaylist = true
				})
			end
		end)
	end

	arg_7_0:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		local var_11_0 = PlaylistUtils.ValidateSelection(arg_7_0:GetDataSource(), arg_11_1.controller)
		local var_11_1 = var_11_0.invalidPlaylists
		local var_11_2 = var_11_0.requiresCrossplay
		local var_11_3 = var_11_0.maxPlayerPlaylists
		local var_11_4 = var_11_0.nonF2PPlaylists

		if #var_11_1 > 0 then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_7_1, false, {
				promoted = true,
				filtered = true,
				invalidPlaylists = var_11_1
			})
		elseif #var_11_3 > 0 and Lobby.IsSplitScreenEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_7_1, false, {
				isSplitScreenWarning = true,
				text = arg_11_0:GetDataSource().name:GetValue(arg_7_1),
				controllerIndex = arg_7_1
			})
		elseif not Engine.FIDIEBFAG(arg_7_1) and var_11_2 then
			local var_11_5 = {
				controllerIndex = arg_7_1,
				onAccept = var_7_0,
				button = arg_11_0,
				crossplayRecommended = Engine.CIEGIACHAE()
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_7_1, false, var_11_5)
		elseif #var_11_4 > 0 and Engine.JACCCCEDI() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_7_1, false, {
				premium = true,
				invalidPlaylists = var_11_4
			})
		elseif #var_11_4 > 0 and not Engine.HBIAGEFCC() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_7_1, false, {
				subscription = true,
				invalidPlaylists = var_11_4
			})
		else
			var_7_0(arg_11_0)
		end
	end)

	local function var_7_1(arg_12_0)
		arg_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_12_0.Name:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end

	local function var_7_2(arg_13_0)
		arg_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_13_0.Name:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	arg_7_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		arg_7_0._isFocused = true

		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			var_7_1(arg_14_0)
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")
			arg_7_0.NewItemSmallIcon:SetAlpha(0)
			arg_7_0.NewItemNotification:SetAlpha(arg_7_0._isNewShown and 1 or 0)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_7_0, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_7_0, "ButtonOverTitle")
			end
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOverKBM")
		end

		arg_14_0.Name:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_7_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		arg_7_0._isFocused = false

		var_7_2(arg_15_0)
		ACTIONS.AnimateSequence(arg_15_0, "ButtonUp")
		arg_7_0.NewItemSmallIcon:SetAlpha(arg_7_0._isNewShown and 1 or 0)
		arg_7_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitle")
		end
	end)
	arg_7_0:addEventHandler("button_up_disable", function(arg_16_0, arg_16_1)
		arg_7_0._isFocused = false

		var_7_2(arg_16_0)
		ACTIONS.AnimateSequence(arg_16_0, "ButtonUpDisabled")
		arg_7_0.NewItemSmallIcon:SetAlpha(arg_7_0._isNewShown and 1 or 0)
		arg_7_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitle")
		end
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		arg_7_0._isFocused = true

		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			var_7_1(arg_17_0)
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOverDisabled")
			arg_7_0.NewItemSmallIcon:SetAlpha(0)
			arg_7_0.NewItemNotification:SetAlpha(arg_7_0._isNewShown and 1 or 0)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_7_0, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_7_0, "ButtonOverTitle")
			end
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOverDisabledKBM")
		end
	end)
	arg_7_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		arg_7_0._isButtonEnabled = false

		var_7_2(arg_18_0)
		arg_7_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_7_0, IsLanguageArabic() and "DisabledAR" or "Disabled")

		if arg_7_0._isDataSourceValid then
			arg_7_0:UpdateModifiers()
		end
	end)
	arg_7_0:addEventHandler("enable", function(arg_19_0, arg_19_1)
		arg_7_0._isButtonEnabled = true

		arg_7_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_7_0, IsLanguageArabic() and "EnabledAR" or "Enabled")

		if arg_7_0._isDataSourceValid then
			arg_7_0:UpdateModifiers()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitleAR")
	else
		arg_7_0.NewItemNotification:SetupRightAlignment()
	end

	arg_7_0:SubscribeToModelThroughElement(arg_7_0, "image", function()
		assert(arg_7_0.Background)

		local var_20_0 = arg_7_0:GetDataSource().image:GetValue(arg_7_1)

		if var_20_0 and #var_20_0 > 0 then
			arg_7_0.Background.BackgroundImage:setImage(RegisterMaterial(var_20_0))
		end
	end)
	arg_7_0:SubscribeToModelThroughElement(arg_7_0, "desc", function()
		assert(arg_7_0.Description)

		local var_21_0 = arg_7_0:GetDataSource().desc:GetValue(arg_7_1)

		arg_7_0:AddTooltipData(arg_7_1, {
			tooltipDescription = var_21_0
		})

		if arg_7_0._isDataSourceValid then
			arg_7_0:UpdateModifiers()
		end
	end)
end

function PlaylistPromotedButton(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIButton.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_22_0.id = "PlaylistPromotedButton"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = MenuBuilder.BuildRegisteredType("FeaturedButtonBackground", {
		controllerIndex = var_22_1
	})

	var_22_4.id = "Background"

	var_22_4.BackgroundImage:SetTop(_1080p * -108, 0)
	var_22_4.BackgroundImage:SetBottom(_1080p * 108, 0)
	var_22_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_22_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_22_0:addElement(var_22_4)

	var_22_0.Background = var_22_4

	local var_22_5
	local var_22_6 = LUI.UIImage.new()

	var_22_6.id = "Backer"

	var_22_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_22_6:SetAlpha(0, 0)
	var_22_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_22_0:addElement(var_22_6)

	var_22_0.Backer = var_22_6

	local var_22_7
	local var_22_8 = LUI.UIStyledText.new()

	var_22_8.id = "Name"

	var_22_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_22_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_8:SetWordWrap(false)
	var_22_8:SetAlignment(LUI.Alignment.Left)
	var_22_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_22_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_22_8:SetStartupDelay(1000)
	var_22_8:SetLineHoldTime(400)
	var_22_8:SetAnimMoveTime(2000)
	var_22_8:SetAnimMoveSpeed(150)
	var_22_8:SetEndDelay(2000)
	var_22_8:SetCrossfadeTime(1000)
	var_22_8:SetFadeInTime(300)
	var_22_8:SetFadeOutTime(300)
	var_22_8:SetMaxVisibleLines(1)
	var_22_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_22_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 395, _1080p * -15, _1080p * 15)

	local function var_22_9()
		local var_23_0 = var_22_0:GetDataSource().name:GetValue(var_22_1)

		if var_23_0 ~= nil then
			var_22_8:setText(ToUpperCase(var_23_0), 0)
		end
	end

	var_22_8:SubscribeToModelThroughElement(var_22_0, "name", var_22_9)
	var_22_0:addElement(var_22_8)

	var_22_0.Name = var_22_8

	local var_22_10
	local var_22_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_22_1
	})

	var_22_11.id = "NewItemNotification"

	var_22_11:SetAlpha(0, 0)
	var_22_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * -19, _1080p * 11)
	var_22_0:addElement(var_22_11)

	var_22_0.NewItemNotification = var_22_11

	local var_22_12
	local var_22_13 = LUI.UIImage.new()

	var_22_13.id = "Lock"

	var_22_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_22_13:SetAlpha(0, 0)
	var_22_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_22_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_22_0:addElement(var_22_13)

	var_22_0.Lock = var_22_13

	local var_22_14
	local var_22_15 = LUI.UIStyledText.new()

	var_22_15.id = "Description"

	var_22_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_22_15:SetAlpha(0, 0)
	var_22_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_15:SetAlignment(LUI.Alignment.Left)
	var_22_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_22_15:SetStartupDelay(2000)
	var_22_15:SetLineHoldTime(1000)
	var_22_15:SetAnimMoveTime(2000)
	var_22_15:SetAnimMoveSpeed(150)
	var_22_15:SetEndDelay(3000)
	var_22_15:SetCrossfadeTime(1000)
	var_22_15:SetFadeInTime(300)
	var_22_15:SetFadeOutTime(300)
	var_22_15:SetMaxVisibleLines(3)
	var_22_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 336, _1080p * -25, _1080p * -5)

	local function var_22_16()
		local var_24_0 = var_22_0:GetDataSource().desc:GetValue(var_22_1)

		if var_24_0 ~= nil then
			var_22_15:setText(var_24_0, 0)
		end
	end

	var_22_15:SubscribeToModelThroughElement(var_22_0, "desc", var_22_16)
	var_22_0:addElement(var_22_15)

	var_22_0.Description = var_22_15

	local var_22_17
	local var_22_18 = LUI.UIStyledText.new()

	var_22_18.id = "DisabledText"

	var_22_18:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_22_18:SetAlpha(0, 0)
	var_22_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_22_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_18:SetWordWrap(false)
	var_22_18:SetAlignment(LUI.Alignment.Left)
	var_22_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_22_18:SetStartupDelay(2000)
	var_22_18:SetLineHoldTime(400)
	var_22_18:SetAnimMoveTime(2000)
	var_22_18:SetAnimMoveSpeed(150)
	var_22_18:SetEndDelay(2000)
	var_22_18:SetCrossfadeTime(1000)
	var_22_18:SetFadeInTime(300)
	var_22_18:SetFadeOutTime(300)
	var_22_18:SetMaxVisibleLines(1)
	var_22_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_22_0:addElement(var_22_18)

	var_22_0.DisabledText = var_22_18

	local var_22_19
	local var_22_20 = LUI.UIImage.new()

	var_22_20.id = "ModifierIcon1"

	var_22_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_22_20:SetAlpha(0, 0)
	var_22_20:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_22_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 374, _1080p * 426, _1080p * -13, _1080p * 13)
	var_22_0:addElement(var_22_20)

	var_22_0.ModifierIcon1 = var_22_20

	local var_22_21
	local var_22_22 = LUI.UIImage.new()

	var_22_22.id = "ModifierIcon2"

	var_22_22:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_22_22:SetAlpha(0, 0)
	var_22_22:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_22_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 332, _1080p * 384, _1080p * -13, _1080p * 13)
	var_22_0:addElement(var_22_22)

	var_22_0.ModifierIcon2 = var_22_22

	local var_22_23
	local var_22_24 = LUI.UIImage.new()

	var_22_24.id = "ModifierIcon3"

	var_22_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_22_24:SetAlpha(0, 0)
	var_22_24:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_22_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 290, _1080p * 342, _1080p * -13, _1080p * 13)
	var_22_0:addElement(var_22_24)

	var_22_0.ModifierIcon3 = var_22_24

	local var_22_25
	local var_22_26 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_22_1
	})

	var_22_26.id = "NewItemSmallIcon"

	var_22_26:SetAlpha(0, 0)
	var_22_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -4, _1080p * 4)
	var_22_0:addElement(var_22_26)

	var_22_0.NewItemSmallIcon = var_22_26

	local var_22_27
	local var_22_28 = LUI.UIImage.new()

	var_22_28.id = "PlaylistRestrictionIcon"

	var_22_28:SetAlpha(0, 0)
	var_22_28:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_22_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 45, _1080p * 11, _1080p * 45)
	var_22_0:addElement(var_22_28)

	var_22_0.PlaylistRestrictionIcon = var_22_28

	local var_22_29
	local var_22_30 = LUI.UIImage.new()

	var_22_30.id = "PlaylistRestrictionHighlight"

	var_22_30:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_22_30:SetAlpha(0, 0)
	var_22_30:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_22_30:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_22_0:addElement(var_22_30)

	var_22_0.PlaylistRestrictionHighlight = var_22_30

	local function var_22_31()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_31

	local var_22_32
	local var_22_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_22_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_22_0.Background.BackgroundImage
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonOver", var_22_33)

	local var_22_34 = {
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

	var_22_8:RegisterAnimationSequence("ButtonOver", var_22_34)

	local var_22_35 = {
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

	var_22_11:RegisterAnimationSequence("ButtonOver", var_22_35)

	local var_22_36 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("ButtonOver", var_22_36)

	local var_22_37 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_15:RegisterAnimationSequence("ButtonOver", var_22_37)

	local var_22_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		}
	}

	var_22_20:RegisterAnimationSequence("ButtonOver", var_22_38)

	local var_22_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		}
	}

	var_22_22:RegisterAnimationSequence("ButtonOver", var_22_39)

	local var_22_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		}
	}

	var_22_24:RegisterAnimationSequence("ButtonOver", var_22_40)

	local var_22_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("ButtonOver", var_22_41)

	local function var_22_42()
		var_22_4:AnimateSequence("ButtonOver")
		var_22_8:AnimateSequence("ButtonOver")
		var_22_11:AnimateSequence("ButtonOver")
		var_22_13:AnimateSequence("ButtonOver")
		var_22_15:AnimateSequence("ButtonOver")
		var_22_20:AnimateSequence("ButtonOver")
		var_22_22:AnimateSequence("ButtonOver")
		var_22_24:AnimateSequence("ButtonOver")
		var_22_26:AnimateSequence("ButtonOver")
	end

	var_22_0._sequences.ButtonOver = var_22_42

	local var_22_43
	local var_22_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonUp", var_22_44)

	local var_22_45 = {
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

	var_22_8:RegisterAnimationSequence("ButtonUp", var_22_45)

	local var_22_46 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_11:RegisterAnimationSequence("ButtonUp", var_22_46)

	local var_22_47 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("ButtonUp", var_22_47)

	local var_22_48 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_15:RegisterAnimationSequence("ButtonUp", var_22_48)

	local var_22_49 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("ButtonUp", var_22_49)

	local var_22_50 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_22_20:RegisterAnimationSequence("ButtonUp", var_22_50)

	local var_22_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_22_22:RegisterAnimationSequence("ButtonUp", var_22_51)

	local var_22_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_22_24:RegisterAnimationSequence("ButtonUp", var_22_52)

	local function var_22_53()
		var_22_6:AnimateSequence("ButtonUp")
		var_22_8:AnimateSequence("ButtonUp")
		var_22_11:AnimateSequence("ButtonUp")
		var_22_13:AnimateSequence("ButtonUp")
		var_22_15:AnimateSequence("ButtonUp")
		var_22_18:AnimateSequence("ButtonUp")
		var_22_20:AnimateSequence("ButtonUp")
		var_22_22:AnimateSequence("ButtonUp")
		var_22_24:AnimateSequence("ButtonUp")
	end

	var_22_0._sequences.ButtonUp = var_22_53

	local var_22_54
	local var_22_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_22_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_22_0.Background.BackgroundImage
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonOverDisabled", var_22_55)

	local var_22_56 = {
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

	var_22_6:RegisterAnimationSequence("ButtonOverDisabled", var_22_56)

	local var_22_57 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOverDisabled", var_22_57)

	local var_22_58 = {
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

	var_22_13:RegisterAnimationSequence("ButtonOverDisabled", var_22_58)

	local var_22_59 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_15:RegisterAnimationSequence("ButtonOverDisabled", var_22_59)

	local var_22_60 = {
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

	var_22_18:RegisterAnimationSequence("ButtonOverDisabled", var_22_60)

	local var_22_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -33
		}
	}

	var_22_20:RegisterAnimationSequence("ButtonOverDisabled", var_22_61)

	local var_22_62 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -33
		}
	}

	var_22_22:RegisterAnimationSequence("ButtonOverDisabled", var_22_62)

	local var_22_63 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -33
		}
	}

	var_22_24:RegisterAnimationSequence("ButtonOverDisabled", var_22_63)

	local var_22_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("ButtonOverDisabled", var_22_64)

	local function var_22_65()
		var_22_4:AnimateSequence("ButtonOverDisabled")
		var_22_6:AnimateSequence("ButtonOverDisabled")
		var_22_8:AnimateSequence("ButtonOverDisabled")
		var_22_13:AnimateSequence("ButtonOverDisabled")
		var_22_15:AnimateSequence("ButtonOverDisabled")
		var_22_18:AnimateSequence("ButtonOverDisabled")
		var_22_20:AnimateSequence("ButtonOverDisabled")
		var_22_22:AnimateSequence("ButtonOverDisabled")
		var_22_24:AnimateSequence("ButtonOverDisabled")
		var_22_26:AnimateSequence("ButtonOverDisabled")
	end

	var_22_0._sequences.ButtonOverDisabled = var_22_65

	local var_22_66
	local var_22_67 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonUpDisabled", var_22_67)

	local var_22_68 = {
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

	var_22_8:RegisterAnimationSequence("ButtonUpDisabled", var_22_68)

	local var_22_69 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
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
		}
	}

	var_22_11:RegisterAnimationSequence("ButtonUpDisabled", var_22_69)

	local var_22_70 = {
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

	var_22_13:RegisterAnimationSequence("ButtonUpDisabled", var_22_70)

	local var_22_71 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_15:RegisterAnimationSequence("ButtonUpDisabled", var_22_71)

	local var_22_72 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("ButtonUpDisabled", var_22_72)

	local var_22_73 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_22_20:RegisterAnimationSequence("ButtonUpDisabled", var_22_73)

	local var_22_74 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_22_22:RegisterAnimationSequence("ButtonUpDisabled", var_22_74)

	local var_22_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_22_24:RegisterAnimationSequence("ButtonUpDisabled", var_22_75)

	local function var_22_76()
		var_22_6:AnimateSequence("ButtonUpDisabled")
		var_22_8:AnimateSequence("ButtonUpDisabled")
		var_22_11:AnimateSequence("ButtonUpDisabled")
		var_22_13:AnimateSequence("ButtonUpDisabled")
		var_22_15:AnimateSequence("ButtonUpDisabled")
		var_22_18:AnimateSequence("ButtonUpDisabled")
		var_22_20:AnimateSequence("ButtonUpDisabled")
		var_22_22:AnimateSequence("ButtonUpDisabled")
		var_22_24:AnimateSequence("ButtonUpDisabled")
	end

	var_22_0._sequences.ButtonUpDisabled = var_22_76

	local var_22_77
	local var_22_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_22_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_22_0.Background.BackgroundImage
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonOverKBM", var_22_78)

	local var_22_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonOverKBM", var_22_79)

	local var_22_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOverKBM", var_22_80)

	local var_22_81 = {
		{
			value = 0,
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

	var_22_11:RegisterAnimationSequence("ButtonOverKBM", var_22_81)

	local var_22_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("ButtonOverKBM", var_22_82)

	local var_22_83 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("ButtonOverKBM", var_22_83)

	local function var_22_84()
		var_22_4:AnimateSequence("ButtonOverKBM")
		var_22_6:AnimateSequence("ButtonOverKBM")
		var_22_8:AnimateSequence("ButtonOverKBM")
		var_22_11:AnimateSequence("ButtonOverKBM")
		var_22_13:AnimateSequence("ButtonOverKBM")
		var_22_18:AnimateSequence("ButtonOverKBM")
	end

	var_22_0._sequences.ButtonOverKBM = var_22_84

	local var_22_85
	local var_22_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_22_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_22_0.Background.BackgroundImage
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonOverDisabledKBM", var_22_86)

	local var_22_87 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_22_87)

	local var_22_88 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_22_88)

	local var_22_89 = {
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

	var_22_11:RegisterAnimationSequence("ButtonOverDisabledKBM", var_22_89)

	local var_22_90 = {
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

	var_22_13:RegisterAnimationSequence("ButtonOverDisabledKBM", var_22_90)

	local var_22_91 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("ButtonOverDisabledKBM", var_22_91)

	local function var_22_92()
		var_22_4:AnimateSequence("ButtonOverDisabledKBM")
		var_22_6:AnimateSequence("ButtonOverDisabledKBM")
		var_22_8:AnimateSequence("ButtonOverDisabledKBM")
		var_22_11:AnimateSequence("ButtonOverDisabledKBM")
		var_22_13:AnimateSequence("ButtonOverDisabledKBM")
		var_22_18:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_22_0._sequences.ButtonOverDisabledKBM = var_22_92

	local var_22_93
	local var_22_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_22_8:RegisterAnimationSequence("AR", var_22_94)

	local var_22_95 = {
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

	var_22_11:RegisterAnimationSequence("AR", var_22_95)

	local var_22_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_22_13:RegisterAnimationSequence("AR", var_22_96)

	local var_22_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 83
		}
	}

	var_22_15:RegisterAnimationSequence("AR", var_22_97)

	local var_22_98 = {
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

	var_22_18:RegisterAnimationSequence("AR", var_22_98)

	local var_22_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		}
	}

	var_22_20:RegisterAnimationSequence("AR", var_22_99)

	local var_22_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 99
		}
	}

	var_22_22:RegisterAnimationSequence("AR", var_22_100)

	local var_22_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 141
		}
	}

	var_22_24:RegisterAnimationSequence("AR", var_22_101)

	local var_22_102 = {
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

	var_22_26:RegisterAnimationSequence("AR", var_22_102)

	local function var_22_103()
		var_22_8:AnimateSequence("AR")
		var_22_11:AnimateSequence("AR")
		var_22_13:AnimateSequence("AR")
		var_22_15:AnimateSequence("AR")
		var_22_18:AnimateSequence("AR")
		var_22_20:AnimateSequence("AR")
		var_22_22:AnimateSequence("AR")
		var_22_24:AnimateSequence("AR")
		var_22_26:AnimateSequence("AR")
	end

	var_22_0._sequences.AR = var_22_103

	local var_22_104
	local var_22_105 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("Disabled", var_22_105)

	local var_22_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 341
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 393
		}
	}

	var_22_20:RegisterAnimationSequence("Disabled", var_22_106)

	local var_22_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 351
		}
	}

	var_22_22:RegisterAnimationSequence("Disabled", var_22_107)

	local var_22_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 257
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 309
		}
	}

	var_22_24:RegisterAnimationSequence("Disabled", var_22_108)

	local var_22_109 = {
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

	var_22_26:RegisterAnimationSequence("Disabled", var_22_109)

	local function var_22_110()
		var_22_13:AnimateSequence("Disabled")
		var_22_20:AnimateSequence("Disabled")
		var_22_22:AnimateSequence("Disabled")
		var_22_24:AnimateSequence("Disabled")
		var_22_26:AnimateSequence("Disabled")
	end

	var_22_0._sequences.Disabled = var_22_110

	local var_22_111
	local var_22_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("Enabled", var_22_112)

	local var_22_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("Enabled", var_22_113)

	local var_22_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("Enabled", var_22_114)

	local var_22_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 426
		}
	}

	var_22_20:RegisterAnimationSequence("Enabled", var_22_115)

	local var_22_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 384
		}
	}

	var_22_22:RegisterAnimationSequence("Enabled", var_22_116)

	local var_22_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 342
		}
	}

	var_22_24:RegisterAnimationSequence("Enabled", var_22_117)

	local var_22_118 = {
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

	var_22_26:RegisterAnimationSequence("Enabled", var_22_118)

	local function var_22_119()
		var_22_6:AnimateSequence("Enabled")
		var_22_13:AnimateSequence("Enabled")
		var_22_18:AnimateSequence("Enabled")
		var_22_20:AnimateSequence("Enabled")
		var_22_22:AnimateSequence("Enabled")
		var_22_24:AnimateSequence("Enabled")
		var_22_26:AnimateSequence("Enabled")
	end

	var_22_0._sequences.Enabled = var_22_119

	local var_22_120
	local var_22_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("DisabledAR", var_22_121)

	local var_22_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 88
		}
	}

	var_22_20:RegisterAnimationSequence("DisabledAR", var_22_122)

	local var_22_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 130
		}
	}

	var_22_22:RegisterAnimationSequence("DisabledAR", var_22_123)

	local var_22_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 172
		}
	}

	var_22_24:RegisterAnimationSequence("DisabledAR", var_22_124)

	local var_22_125 = {
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

	var_22_26:RegisterAnimationSequence("DisabledAR", var_22_125)

	local function var_22_126()
		var_22_13:AnimateSequence("DisabledAR")
		var_22_20:AnimateSequence("DisabledAR")
		var_22_22:AnimateSequence("DisabledAR")
		var_22_24:AnimateSequence("DisabledAR")
		var_22_26:AnimateSequence("DisabledAR")
	end

	var_22_0._sequences.DisabledAR = var_22_126

	local var_22_127
	local var_22_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_13:RegisterAnimationSequence("EnabledAR", var_22_128)

	local var_22_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		}
	}

	var_22_20:RegisterAnimationSequence("EnabledAR", var_22_129)

	local var_22_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 99
		}
	}

	var_22_22:RegisterAnimationSequence("EnabledAR", var_22_130)

	local var_22_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 141
		}
	}

	var_22_24:RegisterAnimationSequence("EnabledAR", var_22_131)

	local var_22_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 22
		}
	}

	var_22_26:RegisterAnimationSequence("EnabledAR", var_22_132)

	local function var_22_133()
		var_22_13:AnimateSequence("EnabledAR")
		var_22_20:AnimateSequence("EnabledAR")
		var_22_22:AnimateSequence("EnabledAR")
		var_22_24:AnimateSequence("EnabledAR")
		var_22_26:AnimateSequence("EnabledAR")
	end

	var_22_0._sequences.EnabledAR = var_22_133

	local var_22_134
	local var_22_135 = {
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

	var_22_8:RegisterAnimationSequence("ButtonUpTitleAR", var_22_135)

	local function var_22_136()
		var_22_8:AnimateSequence("ButtonUpTitleAR")
	end

	var_22_0._sequences.ButtonUpTitleAR = var_22_136

	local var_22_137
	local var_22_138 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -67
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOverTitleAR", var_22_138)

	local function var_22_139()
		var_22_8:AnimateSequence("ButtonOverTitleAR")
	end

	var_22_0._sequences.ButtonOverTitleAR = var_22_139

	local var_22_140
	local var_22_141 = {
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

	var_22_8:RegisterAnimationSequence("ButtonOverTitle", var_22_141)

	local function var_22_142()
		var_22_8:AnimateSequence("ButtonOverTitle")
	end

	var_22_0._sequences.ButtonOverTitle = var_22_142

	local var_22_143
	local var_22_144 = {
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

	var_22_8:RegisterAnimationSequence("ButtonUpTitle", var_22_144)

	local function var_22_145()
		var_22_8:AnimateSequence("ButtonUpTitle")
	end

	var_22_0._sequences.ButtonUpTitle = var_22_145

	local var_22_146
	local var_22_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_22_8:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_22_147)

	local var_22_148 = {
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

	var_22_28:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_22_148)

	local var_22_149 = {
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

	var_22_30:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_22_149)

	local function var_22_150()
		var_22_8:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_22_28:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_22_30:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_22_0._sequences.ModPlaylistRestrictionEnabled = var_22_150

	local var_22_151
	local var_22_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_28:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_22_152)

	local var_22_153 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_30:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_22_153)

	local function var_22_154()
		var_22_28:AnimateSequence("ModPlaylistRestrictionOff")
		var_22_30:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_22_0._sequences.ModPlaylistRestrictionOff = var_22_154

	local var_22_155
	local var_22_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_22_8:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_22_156)

	local var_22_157 = {
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

	var_22_28:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_22_157)

	local var_22_158 = {
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

	var_22_30:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_22_158)

	local function var_22_159()
		var_22_8:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_22_28:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_22_30:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_22_0._sequences.ModPlaylistRestrictionDisabled = var_22_159

	var_22_0:addEventHandler("button_disable", function(arg_44_0, arg_44_1)
		if not arg_44_1.controller then
			local var_44_0 = var_22_1
		end

		ACTIONS.AnimateSequence(var_22_0, "ButtonUpDisabled")

		if CONDITIONS.IsArabic() then
			ACTIONS.AnimateSequence(var_22_0, "ButtonUpTitleAR")
		end

		if not CONDITIONS.IsArabic() then
			ACTIONS.AnimateSequence(var_22_0, "ButtonUpTitle")
		end
	end)
	var_0_5(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("PlaylistPromotedButton", PlaylistPromotedButton)
LockTable(_M)
