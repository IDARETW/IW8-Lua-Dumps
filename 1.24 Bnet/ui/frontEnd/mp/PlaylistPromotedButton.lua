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

	local var_3_2 = PlaylistUtils.DoesCategoryContainXPBoost(arg_3_0:GetDataSource(), controllerIndex)

	if var_3_2 and #var_3_2 >= 1 then
		for iter_3_0, iter_3_1 in pairs(var_3_2) do
			if iter_3_0 == LOOT.doubleXpTypes.XP and iter_3_1 then
				var_3_1():setImage(RegisterMaterial("icon_double_xp"), 0)
			elseif iter_3_0 == LOOT.doubleXpTypes.WEAPON and iter_3_1 then
				var_3_1():setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
			elseif iter_3_0 == LOOT.doubleXpTypes.BATTLE_PASS and iter_3_1 then
				var_3_1():setImage(RegisterMaterial("icon_double_battle_xp"), 0)
			end
		end
	end
end

local function var_0_4(arg_6_0)
	arg_6_0:UpdateModifiers()

	arg_6_0._isDataSourceValid = true
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.UpdateModifiers = var_0_3
	arg_7_0.OnDataSourceAssigned = var_0_4
	arg_7_0._isNew = false
	arg_7_0.SetNew = var_0_1
	arg_7_0.UpdateBreadcrumb = var_0_2
	arg_7_0._isNewShown = false
	arg_7_0._isFocused = true
	arg_7_0._isButtonEnabled = true
	arg_7_0._isDataSourceValid = false

	local function var_7_0(arg_8_0)
		Lobby.TryNavigateToLobby(function()
			local var_9_0 = arg_8_0:GetDataSource().index:GetValue(arg_7_1)

			Playlist.CDBBECIGIG(var_9_0, PlaylistUtils.USE_FILTERED_PLAYLIST_ID)

			if CONDITIONS.IsMagmaGameMode(arg_7_0) then
				LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_7_1, false, {
					openFromPlaylist = true
				})
			else
				LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_7_1, false, {
					openFromPlaylist = true
				})
			end
		end)
	end

	arg_7_0:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		local var_10_0 = PlaylistUtils.ValidateSelection(arg_7_0:GetDataSource(), arg_10_1.controller)
		local var_10_1 = var_10_0.invalidPlaylists
		local var_10_2 = var_10_0.requiresCrossplay
		local var_10_3 = var_10_0.maxPlayerPlaylists
		local var_10_4 = var_10_0.nonF2PPlaylists

		if #var_10_1 > 0 then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_7_1, false, {
				promoted = true,
				filtered = true,
				invalidPlaylists = var_10_1
			})
		elseif #var_10_3 > 0 and Lobby.IsSplitScreenEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_7_1, false, {
				isSplitScreenWarning = true,
				text = arg_10_0:GetDataSource().name:GetValue(arg_7_1),
				controllerIndex = arg_7_1
			})
		elseif not Engine.FIDIEBFAG(arg_7_1) and var_10_2 then
			local var_10_5 = {
				controllerIndex = arg_7_1,
				onAccept = var_7_0,
				button = arg_10_0,
				crossplayRecommended = Engine.CIEGIACHAE()
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_7_1, false, var_10_5)
		elseif #var_10_4 > 0 and Engine.JACCCCEDI() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_7_1, false, {
				premium = true,
				invalidPlaylists = var_10_4
			})
		elseif #var_10_4 > 0 and not Engine.HBIAGEFCC() then
			LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_7_1, false, {
				subscription = true,
				invalidPlaylists = var_10_4
			})
		else
			var_7_0(arg_10_0)
		end
	end)

	local function var_7_1(arg_11_0)
		arg_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_11_0.Name:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end

	local function var_7_2(arg_12_0)
		arg_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_12_0.Name:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	arg_7_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		arg_7_0._isFocused = true

		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			var_7_1(arg_13_0)
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

		arg_13_0.Name:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_7_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		arg_7_0._isFocused = false

		var_7_2(arg_14_0)
		ACTIONS.AnimateSequence(arg_14_0, "ButtonUp")
		arg_7_0.NewItemSmallIcon:SetAlpha(arg_7_0._isNewShown and 1 or 0)
		arg_7_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitle")
		end
	end)
	arg_7_0:addEventHandler("button_up_disable", function(arg_15_0, arg_15_1)
		arg_7_0._isFocused = false

		var_7_2(arg_15_0)
		ACTIONS.AnimateSequence(arg_15_0, "ButtonUpDisabled")
		arg_7_0.NewItemSmallIcon:SetAlpha(arg_7_0._isNewShown and 1 or 0)
		arg_7_0.NewItemNotification:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitleAR")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpTitle")
		end
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_16_0, arg_16_1)
		arg_7_0._isFocused = true

		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			var_7_1(arg_16_0)
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
	arg_7_0:addEventHandler("button_disable", function(arg_17_0, arg_17_1)
		arg_7_0._isButtonEnabled = false

		var_7_2(arg_17_0)
		arg_7_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_7_0, IsLanguageArabic() and "DisabledAR" or "Disabled")

		if arg_7_0._isDataSourceValid then
			arg_7_0:UpdateModifiers()
		end
	end)
	arg_7_0:addEventHandler("enable", function(arg_18_0, arg_18_1)
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

		local var_19_0 = arg_7_0:GetDataSource().image:GetValue(arg_7_1)

		if var_19_0 and #var_19_0 > 0 then
			arg_7_0.Background.BackgroundImage:setImage(RegisterMaterial(var_19_0))
		end
	end)
	arg_7_0:SubscribeToModelThroughElement(arg_7_0, "desc", function()
		assert(arg_7_0.Description)

		local var_20_0 = arg_7_0:GetDataSource().desc:GetValue(arg_7_1)

		arg_7_0:AddTooltipData(arg_7_1, {
			tooltipDescription = var_20_0
		})

		if arg_7_0._isDataSourceValid then
			arg_7_0:UpdateModifiers()
		end
	end)
end

function PlaylistPromotedButton(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIButton.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_21_0.id = "PlaylistPromotedButton"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = MenuBuilder.BuildRegisteredType("FeaturedButtonBackground", {
		controllerIndex = var_21_1
	})

	var_21_4.id = "Background"

	var_21_4.BackgroundImage:SetTop(_1080p * -108, 0)
	var_21_4.BackgroundImage:SetBottom(_1080p * 108, 0)
	var_21_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_21_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_21_0:addElement(var_21_4)

	var_21_0.Background = var_21_4

	local var_21_5
	local var_21_6 = LUI.UIImage.new()

	var_21_6.id = "Backer"

	var_21_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_21_6:SetAlpha(0, 0)
	var_21_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_21_0:addElement(var_21_6)

	var_21_0.Backer = var_21_6

	local var_21_7
	local var_21_8 = LUI.UIStyledText.new()

	var_21_8.id = "Name"

	var_21_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_21_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_8:SetWordWrap(false)
	var_21_8:SetAlignment(LUI.Alignment.Left)
	var_21_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_21_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_21_8:SetStartupDelay(1000)
	var_21_8:SetLineHoldTime(400)
	var_21_8:SetAnimMoveTime(2000)
	var_21_8:SetAnimMoveSpeed(150)
	var_21_8:SetEndDelay(2000)
	var_21_8:SetCrossfadeTime(1000)
	var_21_8:SetFadeInTime(300)
	var_21_8:SetFadeOutTime(300)
	var_21_8:SetMaxVisibleLines(1)
	var_21_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_21_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 395, _1080p * -15, _1080p * 15)

	local function var_21_9()
		local var_22_0 = var_21_0:GetDataSource().name:GetValue(var_21_1)

		if var_22_0 ~= nil then
			var_21_8:setText(ToUpperCase(var_22_0), 0)
		end
	end

	var_21_8:SubscribeToModelThroughElement(var_21_0, "name", var_21_9)
	var_21_0:addElement(var_21_8)

	var_21_0.Name = var_21_8

	local var_21_10
	local var_21_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_21_1
	})

	var_21_11.id = "NewItemNotification"

	var_21_11:SetAlpha(0, 0)
	var_21_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * -19, _1080p * 11)
	var_21_0:addElement(var_21_11)

	var_21_0.NewItemNotification = var_21_11

	local var_21_12
	local var_21_13 = LUI.UIImage.new()

	var_21_13.id = "Lock"

	var_21_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_21_13:SetAlpha(0, 0)
	var_21_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_21_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_21_0:addElement(var_21_13)

	var_21_0.Lock = var_21_13

	local var_21_14
	local var_21_15 = LUI.UIStyledText.new()

	var_21_15.id = "Description"

	var_21_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_21_15:SetAlpha(0, 0)
	var_21_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_15:SetAlignment(LUI.Alignment.Left)
	var_21_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_21_15:SetStartupDelay(2000)
	var_21_15:SetLineHoldTime(1000)
	var_21_15:SetAnimMoveTime(2000)
	var_21_15:SetAnimMoveSpeed(150)
	var_21_15:SetEndDelay(3000)
	var_21_15:SetCrossfadeTime(1000)
	var_21_15:SetFadeInTime(300)
	var_21_15:SetFadeOutTime(300)
	var_21_15:SetMaxVisibleLines(3)
	var_21_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 336, _1080p * -25, _1080p * -5)

	local function var_21_16()
		local var_23_0 = var_21_0:GetDataSource().desc:GetValue(var_21_1)

		if var_23_0 ~= nil then
			var_21_15:setText(var_23_0, 0)
		end
	end

	var_21_15:SubscribeToModelThroughElement(var_21_0, "desc", var_21_16)
	var_21_0:addElement(var_21_15)

	var_21_0.Description = var_21_15

	local var_21_17
	local var_21_18 = LUI.UIStyledText.new()

	var_21_18.id = "DisabledText"

	var_21_18:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_21_18:SetAlpha(0, 0)
	var_21_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_21_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_18:SetWordWrap(false)
	var_21_18:SetAlignment(LUI.Alignment.Left)
	var_21_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_21_18:SetStartupDelay(2000)
	var_21_18:SetLineHoldTime(400)
	var_21_18:SetAnimMoveTime(2000)
	var_21_18:SetAnimMoveSpeed(150)
	var_21_18:SetEndDelay(2000)
	var_21_18:SetCrossfadeTime(1000)
	var_21_18:SetFadeInTime(300)
	var_21_18:SetFadeOutTime(300)
	var_21_18:SetMaxVisibleLines(1)
	var_21_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_21_0:addElement(var_21_18)

	var_21_0.DisabledText = var_21_18

	local var_21_19
	local var_21_20 = LUI.UIImage.new()

	var_21_20.id = "ModifierIcon1"

	var_21_20:SetAlpha(0, 0)
	var_21_20:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_21_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 396, _1080p * 426, _1080p * -15, _1080p * 15)
	var_21_0:addElement(var_21_20)

	var_21_0.ModifierIcon1 = var_21_20

	local var_21_21
	local var_21_22 = LUI.UIImage.new()

	var_21_22.id = "ModifierIcon2"

	var_21_22:SetAlpha(0, 0)
	var_21_22:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_21_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 366, _1080p * 396, _1080p * -15, _1080p * 15)
	var_21_0:addElement(var_21_22)

	var_21_0.ModifierIcon2 = var_21_22

	local var_21_23
	local var_21_24 = LUI.UIImage.new()

	var_21_24.id = "ModifierIcon3"

	var_21_24:SetAlpha(0, 0)
	var_21_24:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_21_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 336, _1080p * 366, _1080p * -15, _1080p * 15)
	var_21_0:addElement(var_21_24)

	var_21_0.ModifierIcon3 = var_21_24

	local var_21_25
	local var_21_26 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_21_1
	})

	var_21_26.id = "NewItemSmallIcon"

	var_21_26:SetAlpha(0, 0)
	var_21_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -4, _1080p * 4)
	var_21_0:addElement(var_21_26)

	var_21_0.NewItemSmallIcon = var_21_26

	local function var_21_27()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_27

	local var_21_28
	local var_21_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_21_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_21_0.Background.BackgroundImage
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonOver", var_21_29)

	local var_21_30 = {
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

	var_21_8:RegisterAnimationSequence("ButtonOver", var_21_30)

	local var_21_31 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("ButtonOver", var_21_31)

	local var_21_32 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonOver", var_21_32)

	local var_21_33 = {
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

	var_21_20:RegisterAnimationSequence("ButtonOver", var_21_33)

	local var_21_34 = {
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

	var_21_22:RegisterAnimationSequence("ButtonOver", var_21_34)

	local var_21_35 = {
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

	var_21_24:RegisterAnimationSequence("ButtonOver", var_21_35)

	local var_21_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_26:RegisterAnimationSequence("ButtonOver", var_21_36)

	local function var_21_37()
		var_21_4:AnimateSequence("ButtonOver")
		var_21_8:AnimateSequence("ButtonOver")
		var_21_13:AnimateSequence("ButtonOver")
		var_21_15:AnimateSequence("ButtonOver")
		var_21_20:AnimateSequence("ButtonOver")
		var_21_22:AnimateSequence("ButtonOver")
		var_21_24:AnimateSequence("ButtonOver")
		var_21_26:AnimateSequence("ButtonOver")
	end

	var_21_0._sequences.ButtonOver = var_21_37

	local var_21_38
	local var_21_39 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonUp", var_21_39)

	local var_21_40 = {
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

	var_21_8:RegisterAnimationSequence("ButtonUp", var_21_40)

	local var_21_41 = {
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

	var_21_11:RegisterAnimationSequence("ButtonUp", var_21_41)

	local var_21_42 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("ButtonUp", var_21_42)

	local var_21_43 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonUp", var_21_43)

	local var_21_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_18:RegisterAnimationSequence("ButtonUp", var_21_44)

	local var_21_45 = {
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

	var_21_20:RegisterAnimationSequence("ButtonUp", var_21_45)

	local var_21_46 = {
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

	var_21_22:RegisterAnimationSequence("ButtonUp", var_21_46)

	local var_21_47 = {
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

	var_21_24:RegisterAnimationSequence("ButtonUp", var_21_47)

	local function var_21_48()
		var_21_6:AnimateSequence("ButtonUp")
		var_21_8:AnimateSequence("ButtonUp")
		var_21_11:AnimateSequence("ButtonUp")
		var_21_13:AnimateSequence("ButtonUp")
		var_21_15:AnimateSequence("ButtonUp")
		var_21_18:AnimateSequence("ButtonUp")
		var_21_20:AnimateSequence("ButtonUp")
		var_21_22:AnimateSequence("ButtonUp")
		var_21_24:AnimateSequence("ButtonUp")
	end

	var_21_0._sequences.ButtonUp = var_21_48

	local var_21_49
	local var_21_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108,
			child = var_21_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108,
			child = var_21_0.Background.BackgroundImage
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonOverDisabled", var_21_50)

	local var_21_51 = {
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

	var_21_6:RegisterAnimationSequence("ButtonOverDisabled", var_21_51)

	local var_21_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonOverDisabled", var_21_52)

	local var_21_53 = {
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

	var_21_13:RegisterAnimationSequence("ButtonOverDisabled", var_21_53)

	local var_21_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonOverDisabled", var_21_54)

	local var_21_55 = {
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

	var_21_18:RegisterAnimationSequence("ButtonOverDisabled", var_21_55)

	local var_21_56 = {
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

	var_21_20:RegisterAnimationSequence("ButtonOverDisabled", var_21_56)

	local var_21_57 = {
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

	var_21_22:RegisterAnimationSequence("ButtonOverDisabled", var_21_57)

	local var_21_58 = {
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

	var_21_24:RegisterAnimationSequence("ButtonOverDisabled", var_21_58)

	local var_21_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_26:RegisterAnimationSequence("ButtonOverDisabled", var_21_59)

	local function var_21_60()
		var_21_4:AnimateSequence("ButtonOverDisabled")
		var_21_6:AnimateSequence("ButtonOverDisabled")
		var_21_8:AnimateSequence("ButtonOverDisabled")
		var_21_13:AnimateSequence("ButtonOverDisabled")
		var_21_15:AnimateSequence("ButtonOverDisabled")
		var_21_18:AnimateSequence("ButtonOverDisabled")
		var_21_20:AnimateSequence("ButtonOverDisabled")
		var_21_22:AnimateSequence("ButtonOverDisabled")
		var_21_24:AnimateSequence("ButtonOverDisabled")
		var_21_26:AnimateSequence("ButtonOverDisabled")
	end

	var_21_0._sequences.ButtonOverDisabled = var_21_60

	local var_21_61
	local var_21_62 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonUpDisabled", var_21_62)

	local var_21_63 = {
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

	var_21_8:RegisterAnimationSequence("ButtonUpDisabled", var_21_63)

	local var_21_64 = {
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

	var_21_11:RegisterAnimationSequence("ButtonUpDisabled", var_21_64)

	local var_21_65 = {
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

	var_21_13:RegisterAnimationSequence("ButtonUpDisabled", var_21_65)

	local var_21_66 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonUpDisabled", var_21_66)

	local var_21_67 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_18:RegisterAnimationSequence("ButtonUpDisabled", var_21_67)

	local var_21_68 = {
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

	var_21_20:RegisterAnimationSequence("ButtonUpDisabled", var_21_68)

	local var_21_69 = {
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

	var_21_22:RegisterAnimationSequence("ButtonUpDisabled", var_21_69)

	local var_21_70 = {
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

	var_21_24:RegisterAnimationSequence("ButtonUpDisabled", var_21_70)

	local function var_21_71()
		var_21_6:AnimateSequence("ButtonUpDisabled")
		var_21_8:AnimateSequence("ButtonUpDisabled")
		var_21_11:AnimateSequence("ButtonUpDisabled")
		var_21_13:AnimateSequence("ButtonUpDisabled")
		var_21_15:AnimateSequence("ButtonUpDisabled")
		var_21_18:AnimateSequence("ButtonUpDisabled")
		var_21_20:AnimateSequence("ButtonUpDisabled")
		var_21_22:AnimateSequence("ButtonUpDisabled")
		var_21_24:AnimateSequence("ButtonUpDisabled")
	end

	var_21_0._sequences.ButtonUpDisabled = var_21_71

	local var_21_72
	local var_21_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_21_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_21_0.Background.BackgroundImage
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonOverKBM", var_21_73)

	local var_21_74 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOverKBM", var_21_74)

	local var_21_75 = {
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

	var_21_8:RegisterAnimationSequence("ButtonOverKBM", var_21_75)

	local var_21_76 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_11:RegisterAnimationSequence("ButtonOverKBM", var_21_76)

	local var_21_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("ButtonOverKBM", var_21_77)

	local var_21_78 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_18:RegisterAnimationSequence("ButtonOverKBM", var_21_78)

	local function var_21_79()
		var_21_4:AnimateSequence("ButtonOverKBM")
		var_21_6:AnimateSequence("ButtonOverKBM")
		var_21_8:AnimateSequence("ButtonOverKBM")
		var_21_11:AnimateSequence("ButtonOverKBM")
		var_21_13:AnimateSequence("ButtonOverKBM")
		var_21_18:AnimateSequence("ButtonOverKBM")
	end

	var_21_0._sequences.ButtonOverKBM = var_21_79

	local var_21_80
	local var_21_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -76,
			child = var_21_0.Background.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140,
			child = var_21_0.Background.BackgroundImage
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_81)

	local var_21_82 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_82)

	local var_21_83 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_83)

	local var_21_84 = {
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

	var_21_13:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_84)

	local var_21_85 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_18:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_85)

	local function var_21_86()
		var_21_4:AnimateSequence("ButtonOverDisabledKBM")
		var_21_6:AnimateSequence("ButtonOverDisabledKBM")
		var_21_8:AnimateSequence("ButtonOverDisabledKBM")
		var_21_13:AnimateSequence("ButtonOverDisabledKBM")
		var_21_18:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_21_0._sequences.ButtonOverDisabledKBM = var_21_86

	local var_21_87
	local var_21_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_21_8:RegisterAnimationSequence("AR", var_21_88)

	local var_21_89 = {
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

	var_21_11:RegisterAnimationSequence("AR", var_21_89)

	local var_21_90 = {
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

	var_21_13:RegisterAnimationSequence("AR", var_21_90)

	local var_21_91 = {
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

	var_21_15:RegisterAnimationSequence("AR", var_21_91)

	local var_21_92 = {
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

	var_21_18:RegisterAnimationSequence("AR", var_21_92)

	local var_21_93 = {
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

	var_21_20:RegisterAnimationSequence("AR", var_21_93)

	local var_21_94 = {
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

	var_21_22:RegisterAnimationSequence("AR", var_21_94)

	local var_21_95 = {
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

	var_21_24:RegisterAnimationSequence("AR", var_21_95)

	local var_21_96 = {
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

	var_21_26:RegisterAnimationSequence("AR", var_21_96)

	local function var_21_97()
		var_21_8:AnimateSequence("AR")
		var_21_11:AnimateSequence("AR")
		var_21_13:AnimateSequence("AR")
		var_21_15:AnimateSequence("AR")
		var_21_18:AnimateSequence("AR")
		var_21_20:AnimateSequence("AR")
		var_21_22:AnimateSequence("AR")
		var_21_24:AnimateSequence("AR")
		var_21_26:AnimateSequence("AR")
	end

	var_21_0._sequences.AR = var_21_97

	local var_21_98
	local var_21_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Disabled", var_21_99)

	local var_21_100 = {
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

	var_21_20:RegisterAnimationSequence("Disabled", var_21_100)

	local var_21_101 = {
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

	var_21_22:RegisterAnimationSequence("Disabled", var_21_101)

	local var_21_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 335
		}
	}

	var_21_24:RegisterAnimationSequence("Disabled", var_21_102)

	local var_21_103 = {
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

	var_21_26:RegisterAnimationSequence("Disabled", var_21_103)

	local function var_21_104()
		var_21_13:AnimateSequence("Disabled")
		var_21_20:AnimateSequence("Disabled")
		var_21_22:AnimateSequence("Disabled")
		var_21_24:AnimateSequence("Disabled")
		var_21_26:AnimateSequence("Disabled")
	end

	var_21_0._sequences.Disabled = var_21_104

	local var_21_105
	local var_21_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("Enabled", var_21_106)

	local var_21_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Enabled", var_21_107)

	local var_21_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_18:RegisterAnimationSequence("Enabled", var_21_108)

	local var_21_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 396
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 426
		}
	}

	var_21_20:RegisterAnimationSequence("Enabled", var_21_109)

	local var_21_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 366
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 396
		}
	}

	var_21_22:RegisterAnimationSequence("Enabled", var_21_110)

	local var_21_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 366
		}
	}

	var_21_24:RegisterAnimationSequence("Enabled", var_21_111)

	local var_21_112 = {
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

	var_21_26:RegisterAnimationSequence("Enabled", var_21_112)

	local function var_21_113()
		var_21_6:AnimateSequence("Enabled")
		var_21_13:AnimateSequence("Enabled")
		var_21_18:AnimateSequence("Enabled")
		var_21_20:AnimateSequence("Enabled")
		var_21_22:AnimateSequence("Enabled")
		var_21_24:AnimateSequence("Enabled")
		var_21_26:AnimateSequence("Enabled")
	end

	var_21_0._sequences.Enabled = var_21_113

	local var_21_114
	local var_21_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("DisabledAR", var_21_115)

	local var_21_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 66
		}
	}

	var_21_20:RegisterAnimationSequence("DisabledAR", var_21_116)

	local var_21_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 96
		}
	}

	var_21_22:RegisterAnimationSequence("DisabledAR", var_21_117)

	local var_21_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 126
		}
	}

	var_21_24:RegisterAnimationSequence("DisabledAR", var_21_118)

	local var_21_119 = {
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

	var_21_26:RegisterAnimationSequence("DisabledAR", var_21_119)

	local function var_21_120()
		var_21_13:AnimateSequence("DisabledAR")
		var_21_20:AnimateSequence("DisabledAR")
		var_21_22:AnimateSequence("DisabledAR")
		var_21_24:AnimateSequence("DisabledAR")
		var_21_26:AnimateSequence("DisabledAR")
	end

	var_21_0._sequences.DisabledAR = var_21_120

	local var_21_121
	local var_21_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("EnabledAR", var_21_122)

	local var_21_123 = {
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

	var_21_20:RegisterAnimationSequence("EnabledAR", var_21_123)

	local var_21_124 = {
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

	var_21_22:RegisterAnimationSequence("EnabledAR", var_21_124)

	local var_21_125 = {
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

	var_21_24:RegisterAnimationSequence("EnabledAR", var_21_125)

	local var_21_126 = {
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

	var_21_26:RegisterAnimationSequence("EnabledAR", var_21_126)

	local function var_21_127()
		var_21_13:AnimateSequence("EnabledAR")
		var_21_20:AnimateSequence("EnabledAR")
		var_21_22:AnimateSequence("EnabledAR")
		var_21_24:AnimateSequence("EnabledAR")
		var_21_26:AnimateSequence("EnabledAR")
	end

	var_21_0._sequences.EnabledAR = var_21_127

	local var_21_128
	local var_21_129 = {
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

	var_21_8:RegisterAnimationSequence("ButtonUpTitleAR", var_21_129)

	local function var_21_130()
		var_21_8:AnimateSequence("ButtonUpTitleAR")
	end

	var_21_0._sequences.ButtonUpTitleAR = var_21_130

	local var_21_131
	local var_21_132 = {
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

	var_21_8:RegisterAnimationSequence("ButtonOverTitleAR", var_21_132)

	local function var_21_133()
		var_21_8:AnimateSequence("ButtonOverTitleAR")
	end

	var_21_0._sequences.ButtonOverTitleAR = var_21_133

	local var_21_134
	local var_21_135 = {
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

	var_21_8:RegisterAnimationSequence("ButtonOverTitle", var_21_135)

	local function var_21_136()
		var_21_8:AnimateSequence("ButtonOverTitle")
	end

	var_21_0._sequences.ButtonOverTitle = var_21_136

	local var_21_137
	local var_21_138 = {
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

	var_21_8:RegisterAnimationSequence("ButtonUpTitle", var_21_138)

	local function var_21_139()
		var_21_8:AnimateSequence("ButtonUpTitle")
	end

	var_21_0._sequences.ButtonUpTitle = var_21_139

	var_21_0:addEventHandler("button_disable", function(arg_40_0, arg_40_1)
		if not arg_40_1.controller then
			local var_40_0 = var_21_1
		end

		ACTIONS.AnimateSequence(var_21_0, "ButtonUpDisabled")

		if CONDITIONS.IsArabic(var_21_0) then
			ACTIONS.AnimateSequence(var_21_0, "ButtonUpTitleAR")
		end

		if not CONDITIONS.IsArabic(var_21_0) then
			ACTIONS.AnimateSequence(var_21_0, "ButtonUpTitle")
		end
	end)
	var_0_5(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("PlaylistPromotedButton", PlaylistPromotedButton)
LockTable(_M)
