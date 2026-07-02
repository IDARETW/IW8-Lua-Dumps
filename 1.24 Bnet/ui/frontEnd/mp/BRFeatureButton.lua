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
		arg_2_0.NewItemSmallIcon:SetAlpha(1)

		arg_2_0._isNewShown = true
	else
		arg_2_0.NewItemSmallIcon:SetAlpha(0)

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
		if arg_5_0:GetValue(controllerIndex) > 1 then
			var_3_1():setImage(RegisterMaterial(arg_5_1))
		end
	end

	var_3_2(arg_3_0:GetDataSource().xpScale, "icon_double_xp")
	var_3_2(arg_3_0:GetDataSource().weaponXpScale, "icon_double_weapon_xp")
	var_3_2(arg_3_0:GetDataSource().battlePassXpScale, "icon_double_battle_xp")
end

local function var_0_5(arg_6_0, arg_6_1)
	assert(arg_6_0.Description)

	arg_6_0._isLimitedTime = arg_6_0:GetDataSource().isLimitedTime:GetValue(arg_6_1)

	local var_6_0 = arg_6_0:GetDataSource().desc:GetValue(arg_6_1)

	if LUI.IsLastInputMouseNavigation(arg_6_1) and arg_6_0._isLimitedTime then
		local var_6_1 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME")

		var_6_0 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME_DESC", Engine.JCBDICCAH(var_6_1), Engine.JCBDICCAH(var_6_0))
	end

	arg_6_0:AddTooltipData(arg_6_1, {
		tooltipDescription = var_6_0
	})

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
		arg_7_0.LimitedTimeNotification:SetAlpha(0)
	elseif arg_7_1 == var_0_1.Full then
		arg_7_0.LimitedTimeNotification:SetAlpha(1, 500)
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
	arg_9_0.UpdateBreadcrumb = var_0_3
	arg_9_0.UpdateModifiers = var_0_4
	arg_9_0.OnDataSourceAssigned = var_0_7
	arg_9_0._isNew = false
	arg_9_0.SetNew = var_0_2
	arg_9_0._isButtonEnabled = true

	arg_9_0:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_9_0:GetDataSource()

		if var_10_0.categoryIndex then
			local var_10_1 = var_10_0.categoryIndex:GetValue(arg_9_1)
			local var_10_2 = var_10_0.playlistIndex:GetValue(arg_9_1)

			if var_10_1 ~= nil and var_10_2 ~= nil then
				local var_10_3 = Playlist.DCFCIFABGH(var_10_1, var_10_2)
				local var_10_4 = var_10_3 == Lobby.PlaylistLockState.UNLOCKED
				local var_10_5 = var_10_0.maxPlayerSize:GetValue(arg_9_1)
				local var_10_6 = Dvar.CFHDGABACF("MTTRPNMPRP")

				local function var_10_7(arg_11_0)
					if Playlist.CDBBECIGIG(var_10_1, var_10_2) then
						LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_10_1.controller, false, {
							openFromPlaylist = true
						})
					end
				end

				local function var_10_8()
					Lobby.TryNavigateToLobby(function()
						local var_13_0 = PlaylistUtils.DoesPlaylistContainGameType(arg_9_1, var_10_0, MP.GameMode.BRTDMGameType)

						if not Onboarding.GamemodeTDMAnywhere.WasCompleted(arg_9_0, arg_9_1) and var_13_0 then
							LUI.FlowManager.RequestPopupMenu(arg_9_0, "onboardingpopup", true, arg_9_1, false, ONBOARDING_DATA.GetOnboardingTDMAnywhereData(var_10_7))
							Onboarding.GamemodeTDMAnywhere.MarkCompleted(arg_9_0, arg_9_1)
						else
							var_10_7(arg_9_1)
						end
					end)
				end

				local var_10_9 = Playlist.DEJGAECIBG(var_10_2, var_10_1)

				if not var_10_4 and var_10_3 == Lobby.PlaylistLockState.LOCKED_MAXPARTY then
					local var_10_10 = {}

					table.insert(var_10_10, var_10_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_9_1, false, {
						invalidPlaylists = var_10_10
					})
				elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_10_0, arg_9_1) then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_9_1, false, {
						isSplitScreenWarning = true,
						controllerIndex = arg_9_1,
						text = var_10_0.name:GetValue(arg_9_1)
					})
				elseif not Engine.FIDIEBFAG(arg_9_1) and var_10_6 <= var_10_5 then
					local var_10_11 = {
						controllerIndex = arg_9_1,
						onAccept = var_10_8,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_9_1, false, var_10_11)
				elseif var_10_9 and Engine.JACCCCEDI() then
					local var_10_12 = {}

					table.insert(var_10_12, var_10_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_9_1, false, {
						premium = true,
						invalidPlaylists = var_10_12
					})
				elseif var_10_9 and not Engine.HBIAGEFCC() then
					local var_10_13 = {}

					table.insert(var_10_13, var_10_0)
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_9_1, false, {
						subscription = true,
						invalidPlaylists = var_10_13
					})
				else
					var_10_8()
				end
			end
		end
	end)
	arg_9_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		arg_9_0._isFocused = true

		var_0_5(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_9_0, CONDITIONS.IsMagmaGameMode(arg_9_0) and "WZButtonOver" or "ButtonOver")
		arg_9_0.NewItemSmallIcon:SetAlpha(0)
		arg_9_0.NewItemNotification:SetAlpha(arg_9_0._isNewShown and 1 or 0, 150)
		arg_9_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_0_6(arg_14_0, var_0_1.Full)
	end)
	arg_9_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		arg_9_0._isFocused = true

		var_0_5(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_9_0, "ButtonOverDisabled")
		arg_9_0.NewItemSmallIcon:SetAlpha(0)
		arg_9_0.NewItemNotification:SetAlpha(arg_9_0._isNewShown and 1 or 0, 150)
		arg_9_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_0_6(arg_15_0, var_0_1.Full)
	end)
	arg_9_0:addEventHandler("button_up", function(arg_16_0, arg_16_1)
		ACTIONS.AnimateSequence(arg_9_0, CONDITIONS.IsMagmaGameMode(arg_9_0) and "WZButtonUp" or "ButtonUp")
		ACTIONS.AnimateSequence(arg_9_0.Background, CONDITIONS.IsMagmaGameMode(arg_9_0) and "WZButtonUp" or "ButtonUp")

		arg_9_0._isFocused = false

		arg_9_0.NewItemSmallIcon:SetAlpha(arg_9_0._isNewShown and 1 or 0, 150)
		arg_9_0.NewItemNotification:SetAlpha(0)
		arg_9_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_0_6(arg_16_0, var_0_1.Mini)
	end)
	arg_9_0:addEventHandler("button_disable", function(arg_17_0, arg_17_1)
		arg_9_0._isFocused = false

		ACTIONS.AnimateSequence(arg_17_0, "ButtonUpDisabled")
		arg_9_0.NewItemSmallIcon:SetAlpha(arg_9_0._isNewShown and 1 or 0, 150)
		arg_9_0.NewItemNotification:SetAlpha(0)
		arg_9_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

		arg_9_0._isButtonEnabled = false

		arg_9_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_9_0, "Disabled")
		var_0_6(arg_17_0, var_0_1.Mini)

		if arg_9_0._isDataSourceValid then
			arg_9_0:UpdateModifiers()
		end
	end)
	arg_9_0:addEventHandler("enable", function(arg_18_0, arg_18_1)
		arg_9_0._isButtonEnabled = true

		arg_9_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_9_0, "Enabled")

		if arg_9_0._isDataSourceValid then
			arg_9_0:UpdateModifiers()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_9_0, "AR")
	else
		arg_9_0.NewItemNotification:SetupRightAlignment()
	end

	arg_9_0:SubscribeToModelThroughElement(arg_9_0, "isLimitedTime", function()
		arg_9_0._isLimitedTime = arg_9_0:GetDataSource().isLimitedTime:GetValue(arg_9_1)

		local var_19_0 = arg_9_0.LimitedTimeIcon
		local var_19_1 = 0.6

		if arg_9_0._isLimitedTime then
			var_19_0:SetAlpha(var_19_1, 500)
		else
			var_19_0:SetAlpha(0)
		end
	end)
	arg_9_0:SubscribeToModelThroughElement(arg_9_0, "desc", function()
		var_0_5(arg_9_0, arg_9_1)
	end)
	assert(arg_9_0.Background)
	arg_9_0.Background:SetWZTheme(true)
	ACTIONS.AnimateSequence(arg_9_0, CONDITIONS.IsMagmaGameMode(arg_9_0) and "WZButtonUp" or "ButtonUp")
	ACTIONS.AnimateSequence(arg_9_0.Background, CONDITIONS.IsMagmaGameMode(arg_9_0) and "WZButtonUp" or "ButtonUp")
end

function BRFeatureButton(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIButton.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_21_0.id = "BRFeatureButton"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_21_1
	})

	var_21_4.id = "Background"

	var_21_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_21_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_21_0:addElement(var_21_4)

	var_21_0.Background = var_21_4

	local var_21_5
	local var_21_6 = LUI.UIStyledText.new()

	var_21_6.id = "GamemodeName"

	var_21_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_21_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_6:SetWordWrap(false)
	var_21_6:SetAlignment(LUI.Alignment.Left)
	var_21_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_21_6:SetStartupDelay(2000)
	var_21_6:SetLineHoldTime(400)
	var_21_6:SetAnimMoveTime(2000)
	var_21_6:SetAnimMoveSpeed(150)
	var_21_6:SetEndDelay(2000)
	var_21_6:SetCrossfadeTime(250)
	var_21_6:SetFadeInTime(300)
	var_21_6:SetFadeOutTime(300)
	var_21_6:SetMaxVisibleLines(1)
	var_21_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 358, _1080p * -59, _1080p * -29)

	local function var_21_7()
		local var_22_0 = var_21_0:GetDataSource().name:GetValue(var_21_1)

		if var_22_0 ~= nil then
			var_21_6:setText(ToUpperCase(var_22_0), 0)
		end
	end

	var_21_6:SubscribeToModelThroughElement(var_21_0, "name", var_21_7)
	var_21_0:addElement(var_21_6)

	var_21_0.GamemodeName = var_21_6

	local var_21_8
	local var_21_9 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_21_1
	})

	var_21_9.id = "NewItemSmallIcon"

	var_21_9:SetAlpha(0, 0)
	var_21_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -8, 0)
	var_21_0:addElement(var_21_9)

	var_21_0.NewItemSmallIcon = var_21_9

	local var_21_10
	local var_21_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_21_1
	})

	var_21_11.id = "NewItemNotification"

	var_21_11:SetAlpha(0, 0)
	var_21_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * -25, _1080p * 5)
	var_21_0:addElement(var_21_11)

	var_21_0.NewItemNotification = var_21_11

	local var_21_12
	local var_21_13 = LUI.UIImage.new()

	var_21_13.id = "Lock"

	var_21_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_21_13:SetAlpha(0, 0)
	var_21_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_21_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -40, _1080p * -10, _1080p * 35, _1080p * 65)
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
	var_21_15:SetLineHoldTime(2000)
	var_21_15:SetAnimMoveTime(1000)
	var_21_15:SetAnimMoveSpeed(150)
	var_21_15:SetEndDelay(2000)
	var_21_15:SetCrossfadeTime(1000)
	var_21_15:SetFadeInTime(300)
	var_21_15:SetFadeOutTime(300)
	var_21_15:SetMaxVisibleLines(2)
	var_21_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 343, _1080p * -29, _1080p * -9)

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
	local var_21_18 = LUI.UIImage.new()

	var_21_18.id = "Backer"

	var_21_18:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_21_18:SetAlpha(0, 0)
	var_21_18:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -38, _1080p * -2)
	var_21_0:addElement(var_21_18)

	var_21_0.Backer = var_21_18

	local var_21_19
	local var_21_20 = LUI.UIStyledText.new()

	var_21_20.id = "DisabledText"

	var_21_20:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_21_20:SetAlpha(0, 0)
	var_21_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_21_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_20:SetWordWrap(false)
	var_21_20:SetAlignment(LUI.Alignment.Left)
	var_21_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_21_20:SetStartupDelay(2000)
	var_21_20:SetLineHoldTime(400)
	var_21_20:SetAnimMoveTime(2000)
	var_21_20:SetAnimMoveSpeed(150)
	var_21_20:SetEndDelay(2000)
	var_21_20:SetCrossfadeTime(1000)
	var_21_20:SetFadeInTime(300)
	var_21_20:SetFadeOutTime(300)
	var_21_20:SetMaxVisibleLines(1)
	var_21_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 37, _1080p * 57)
	var_21_0:addElement(var_21_20)

	var_21_0.DisabledText = var_21_20

	local var_21_21
	local var_21_22 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_21_1
	})

	var_21_22.id = "LimitedTimeNotification"

	var_21_22:SetAlpha(0, 0)
	var_21_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -167, _1080p * -11, _1080p * 92, _1080p * 122)
	var_21_0:addElement(var_21_22)

	var_21_0.LimitedTimeNotification = var_21_22

	local var_21_23
	local var_21_24 = LUI.UIImage.new()

	var_21_24.id = "LimitedTimeIcon"

	var_21_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_21_24:SetAlpha(0, 0)
	var_21_24:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_21_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 395, _1080p * 419, _1080p * 30, _1080p * 54)
	var_21_0:addElement(var_21_24)

	var_21_0.LimitedTimeIcon = var_21_24

	local var_21_25
	local var_21_26 = LUI.UIImage.new()

	var_21_26.id = "ModifierIcon1"

	var_21_26:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_21_26:SetAlpha(0, 0)
	var_21_26:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_21_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 363, _1080p * 387, _1080p * 95, _1080p * 119)
	var_21_0:addElement(var_21_26)

	var_21_0.ModifierIcon1 = var_21_26

	local var_21_27
	local var_21_28 = LUI.UIImage.new()

	var_21_28.id = "ModifierIcon2"

	var_21_28:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_21_28:SetAlpha(0, 0)
	var_21_28:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_21_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 301, _1080p * 325, _1080p * 95, _1080p * 119)
	var_21_0:addElement(var_21_28)

	var_21_0.ModifierIcon2 = var_21_28

	local var_21_29
	local var_21_30 = LUI.UIImage.new()

	var_21_30.id = "ModifierIcon3"

	var_21_30:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_21_30:SetAlpha(0, 0)
	var_21_30:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_21_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 333, _1080p * 357, _1080p * 95, _1080p * 119)
	var_21_0:addElement(var_21_30)

	var_21_0.ModifierIcon3 = var_21_30

	local function var_21_31()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_31

	local var_21_32
	local var_21_33 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOver", var_21_33)

	local var_21_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("ButtonOver", var_21_34)

	local var_21_35 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonOver", var_21_35)

	local var_21_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		}
	}

	var_21_22:RegisterAnimationSequence("ButtonOver", var_21_36)

	local var_21_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_21_24:RegisterAnimationSequence("ButtonOver", var_21_37)

	local var_21_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		}
	}

	var_21_26:RegisterAnimationSequence("ButtonOver", var_21_38)

	local var_21_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 184
		}
	}

	var_21_28:RegisterAnimationSequence("ButtonOver", var_21_39)

	local var_21_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 216
		}
	}

	var_21_30:RegisterAnimationSequence("ButtonOver", var_21_40)

	local function var_21_41()
		var_21_6:AnimateSequence("ButtonOver")
		var_21_13:AnimateSequence("ButtonOver")
		var_21_15:AnimateSequence("ButtonOver")
		var_21_22:AnimateSequence("ButtonOver")
		var_21_24:AnimateSequence("ButtonOver")
		var_21_26:AnimateSequence("ButtonOver")
		var_21_28:AnimateSequence("ButtonOver")
		var_21_30:AnimateSequence("ButtonOver")
	end

	var_21_0._sequences.ButtonOver = var_21_41

	local var_21_42
	local var_21_43 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
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
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonUp", var_21_43)

	local var_21_44 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonUp", var_21_44)

	local var_21_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		}
	}

	var_21_22:RegisterAnimationSequence("ButtonUp", var_21_45)

	local var_21_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_21_24:RegisterAnimationSequence("ButtonUp", var_21_46)

	local var_21_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 363
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		}
	}

	var_21_26:RegisterAnimationSequence("ButtonUp", var_21_47)

	local var_21_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 301
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 325
		}
	}

	var_21_28:RegisterAnimationSequence("ButtonUp", var_21_48)

	local var_21_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		}
	}

	var_21_30:RegisterAnimationSequence("ButtonUp", var_21_49)

	local function var_21_50()
		var_21_6:AnimateSequence("ButtonUp")
		var_21_15:AnimateSequence("ButtonUp")
		var_21_22:AnimateSequence("ButtonUp")
		var_21_24:AnimateSequence("ButtonUp")
		var_21_26:AnimateSequence("ButtonUp")
		var_21_28:AnimateSequence("ButtonUp")
		var_21_30:AnimateSequence("ButtonUp")
	end

	var_21_0._sequences.ButtonUp = var_21_50

	local var_21_51
	local var_21_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
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
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOverDisabled", var_21_52)

	local var_21_53 = {
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

	var_21_18:RegisterAnimationSequence("ButtonOverDisabled", var_21_53)

	local var_21_54 = {
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

	var_21_20:RegisterAnimationSequence("ButtonOverDisabled", var_21_54)

	local var_21_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 92
		}
	}

	var_21_22:RegisterAnimationSequence("ButtonOverDisabled", var_21_55)

	local var_21_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_21_24:RegisterAnimationSequence("ButtonOverDisabled", var_21_56)

	local function var_21_57()
		var_21_6:AnimateSequence("ButtonOverDisabled")
		var_21_18:AnimateSequence("ButtonOverDisabled")
		var_21_20:AnimateSequence("ButtonOverDisabled")
		var_21_22:AnimateSequence("ButtonOverDisabled")
		var_21_24:AnimateSequence("ButtonOverDisabled")
	end

	var_21_0._sequences.ButtonOverDisabled = var_21_57

	local var_21_58
	local var_21_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
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
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_59)

	local var_21_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 92
		}
	}

	var_21_22:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_60)

	local var_21_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_21_24:RegisterAnimationSequence("ButtonOverDisabledKBM", var_21_61)

	local function var_21_62()
		var_21_6:AnimateSequence("ButtonOverDisabledKBM")
		var_21_22:AnimateSequence("ButtonOverDisabledKBM")
		var_21_24:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_21_0._sequences.ButtonOverDisabledKBM = var_21_62

	local var_21_63
	local var_21_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
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
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonUpDisabled", var_21_64)

	local var_21_65 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_18:RegisterAnimationSequence("ButtonUpDisabled", var_21_65)

	local var_21_66 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_20:RegisterAnimationSequence("ButtonUpDisabled", var_21_66)

	local var_21_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 95
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_22:RegisterAnimationSequence("ButtonUpDisabled", var_21_67)

	local var_21_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 27
		}
	}

	var_21_24:RegisterAnimationSequence("ButtonUpDisabled", var_21_68)

	local function var_21_69()
		var_21_6:AnimateSequence("ButtonUpDisabled")
		var_21_18:AnimateSequence("ButtonUpDisabled")
		var_21_20:AnimateSequence("ButtonUpDisabled")
		var_21_22:AnimateSequence("ButtonUpDisabled")
		var_21_24:AnimateSequence("ButtonUpDisabled")
	end

	var_21_0._sequences.ButtonUpDisabled = var_21_69

	local var_21_70
	local var_21_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOverKBM", var_21_71)

	local function var_21_72()
		var_21_6:AnimateSequence("ButtonOverKBM")
	end

	var_21_0._sequences.ButtonOverKBM = var_21_72

	local var_21_73
	local var_21_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Disabled", var_21_74)

	local var_21_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 92
		}
	}

	var_21_22:RegisterAnimationSequence("Disabled", var_21_75)

	local var_21_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_21_24:RegisterAnimationSequence("Disabled", var_21_76)

	local function var_21_77()
		var_21_13:AnimateSequence("Disabled")
		var_21_22:AnimateSequence("Disabled")
		var_21_24:AnimateSequence("Disabled")
	end

	var_21_0._sequences.Disabled = var_21_77

	local function var_21_78()
		return
	end

	var_21_0._sequences.DisabledAR = var_21_78

	local var_21_79
	local var_21_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Enabled", var_21_80)

	local function var_21_81()
		var_21_13:AnimateSequence("Enabled")
	end

	var_21_0._sequences.Enabled = var_21_81

	local function var_21_82()
		return
	end

	var_21_0._sequences.EnabledAR = var_21_82

	local var_21_83
	local var_21_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_21_6:RegisterAnimationSequence("AR", var_21_84)

	local var_21_85 = {
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

	var_21_9:RegisterAnimationSequence("AR", var_21_85)

	local var_21_86 = {
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

	var_21_11:RegisterAnimationSequence("AR", var_21_86)

	local var_21_87 = {
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

	var_21_13:RegisterAnimationSequence("AR", var_21_87)

	local var_21_88 = {
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
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_21_15:RegisterAnimationSequence("AR", var_21_88)

	local var_21_89 = {
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

	var_21_20:RegisterAnimationSequence("AR", var_21_89)

	local var_21_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -269
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 122
		}
	}

	var_21_22:RegisterAnimationSequence("AR", var_21_90)

	local var_21_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_24:RegisterAnimationSequence("AR", var_21_91)

	local var_21_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
		}
	}

	var_21_26:RegisterAnimationSequence("AR", var_21_92)

	local var_21_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 89
		}
	}

	var_21_28:RegisterAnimationSequence("AR", var_21_93)

	local var_21_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		}
	}

	var_21_30:RegisterAnimationSequence("AR", var_21_94)

	local function var_21_95()
		var_21_6:AnimateSequence("AR")
		var_21_9:AnimateSequence("AR")
		var_21_11:AnimateSequence("AR")
		var_21_13:AnimateSequence("AR")
		var_21_15:AnimateSequence("AR")
		var_21_20:AnimateSequence("AR")
		var_21_22:AnimateSequence("AR")
		var_21_24:AnimateSequence("AR")
		var_21_26:AnimateSequence("AR")
		var_21_28:AnimateSequence("AR")
		var_21_30:AnimateSequence("AR")
	end

	var_21_0._sequences.AR = var_21_95

	local var_21_96
	local var_21_97 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_21_6:RegisterAnimationSequence("WZButtonOver", var_21_97)

	local var_21_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("WZButtonOver", var_21_98)

	local var_21_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneDescription
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("WZButtonOver", var_21_99)

	local function var_21_100()
		var_21_6:AnimateSequence("WZButtonOver")
		var_21_13:AnimateSequence("WZButtonOver")
		var_21_15:AnimateSequence("WZButtonOver")
	end

	var_21_0._sequences.WZButtonOver = var_21_100

	local var_21_101
	local var_21_102 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextDefault
		},
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
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_21_6:RegisterAnimationSequence("WZButtonUp", var_21_102)

	local var_21_103 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("WZButtonUp", var_21_103)

	local function var_21_104()
		var_21_6:AnimateSequence("WZButtonUp")
		var_21_15:AnimateSequence("WZButtonUp")
	end

	var_21_0._sequences.WZButtonUp = var_21_104

	local var_21_105
	local var_21_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.warzoneTextFocus
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_21_6:RegisterAnimationSequence("WZButtonOverKBM", var_21_106)

	local function var_21_107()
		var_21_6:AnimateSequence("WZButtonOverKBM")
	end

	var_21_0._sequences.WZButtonOverKBM = var_21_107

	var_0_8(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("BRFeatureButton", BRFeatureButton)
LockTable(_M)
