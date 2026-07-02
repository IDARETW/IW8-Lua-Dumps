module(..., package.seeall)

local var_0_0 = 16 * _1080p
local var_0_1 = 350 * _1080p

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

	local var_3_2 = arg_3_0._isDataSourceValid and PlaylistUtils.DoesCategoryContainXPBoost(arg_3_0:GetDataSource(), controllerIndex)

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
			categoryDataSource = var_3_3
		})
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	Lobby.TryNavigateToLobby(function()
		local var_6_0 = arg_5_0:GetDataSource().index:GetValue(arg_5_1)

		Playlist.CDBBECIGIG(var_6_0, PlaylistUtils.USE_FILTERED_PLAYLIST_ID)

		if CONDITIONS.IsMagmaGameMode(self) then
			local function var_6_1()
				LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_5_1, false, {
					openFromPlaylist = true
				})
			end

			if PlaylistUtils.TryShowBtnActionPlaylistRestrictionPopups(self, arg_5_1, dataSource, var_6_1) then
				-- block empty
			else
				var_6_1()
			end
		else
			LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_5_1, false, {
				openFromPlaylist = true
			})
		end
	end)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = Onboarding.GamemodeMoshpit.WasCompleted(arg_8_0, arg_8_1)
	local var_8_1 = Onboarding.GamemodeTDM.WasCompleted(arg_8_0, arg_8_1)
	local var_8_2 = Onboarding.GamemodeGunfight.WasCompleted(arg_8_0, arg_8_1)

	if var_8_0 and var_8_1 and var_8_2 then
		return
	end

	local var_8_3 = arg_8_0:GetDataSource()
	local var_8_4 = PlaylistUtils.GetCategoryGameTypes(arg_8_1, var_8_3)
	local var_8_5 = 0

	for iter_8_0, iter_8_1 in pairs(var_8_4) do
		var_8_5 = var_8_5 + 1
	end

	local function var_8_6()
		var_0_5(arg_8_0, arg_8_1)
	end

	if var_8_5 > 1 then
		if not var_8_0 then
			LUI.FlowManager.RequestPopupMenu(arg_8_0, "onboardingpopup", true, arg_8_1, false, ONBOARDING_DATA.GetOnboardingMPMoshpitData(var_8_6))
			Onboarding.GamemodeMoshpit.MarkCompleted(arg_8_0, arg_8_1)

			return true
		end
	elseif var_8_4[PlaylistUtils.GameTypes.TDMGameType] and not var_8_1 then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "onboardingpopup", true, arg_8_1, false, ONBOARDING_DATA.GetOnboardingTDMData(var_8_6))
		Onboarding.GamemodeTDM.MarkCompleted(arg_8_0, arg_8_1)

		return true
	elseif var_8_4[PlaylistUtils.GameTypes.GunfightGameType] and not var_8_2 then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "onboardingpopup", true, arg_8_1, false, ONBOARDING_DATA.GetOnboardingGunfightData(var_8_6))
		Onboarding.GamemodeGunfight.MarkCompleted(arg_8_0, arg_8_1)

		return true
	end

	return false
end

local function var_0_7(arg_10_0)
	arg_10_0._isDataSourceValid = true

	arg_10_0:UpdateModifiers()
end

local function var_0_8(arg_11_0, arg_11_1)
	if arg_11_0._isDataSourceValid then
		local var_11_0 = arg_11_0:GetDataSource().desc:GetValue(arg_11_1)

		if LUI.IsLastInputMouseNavigation(arg_11_1) and arg_11_0._isLimitedTime then
			local var_11_1 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME")

			var_11_0 = Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME_DESC", Engine.JCBDICCAH(var_11_1), Engine.JCBDICCAH(var_11_0))
		end

		arg_11_0:AddTooltipData(arg_11_1, {
			tooltipDescription = var_11_0
		})
		arg_11_0:UpdateModifiers()
	end
end

local function var_0_9(arg_12_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_12_0, "ButtonUpAR")
	else
		ACTIONS.AnimateSequence(arg_12_0, "ButtonUp")
	end

	ACTIONS.AnimateSequence(arg_12_0.Background, "ButtonUp")

	arg_12_0._isFocused = false

	arg_12_0.NewItemSmallIcon:SetAlpha(arg_12_0._isNewShown and not arg_12_0._isLimitedTime and 1 or 0, 150)
	arg_12_0.NewItemNotification:SetAlpha(0)
	arg_12_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	arg_12_0.LimitedTimeIcon:SetAlpha(0.6, 300)
	arg_12_0.LimitedTimeNotification:SetAlpha(0)
end

local function var_0_10(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._controllerIndex = arg_13_1
	arg_13_0.UpdateBreadcrumb = var_0_3
	arg_13_0.OnDataSourceAssigned = var_0_7
	arg_13_0.UpdateModifiers = var_0_4
	arg_13_0.OnButtonLoseFocus = var_0_9
	arg_13_0._isNew = false
	arg_13_0.SetNew = var_0_2
	arg_13_0._isButtonEnabled = true

	if arg_13_2.isTournament then
		arg_13_0:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			TOURNAMENT.ButtonAction(arg_14_1.controller)
		end)
	else
		arg_13_0:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			local var_15_0 = PlaylistUtils.ValidateSelection(arg_13_0:GetDataSource(), arg_15_1.controller)
			local var_15_1 = var_15_0.invalidPlaylists
			local var_15_2 = var_15_0.requiresCrossplay
			local var_15_3 = var_15_0.maxPlayerPlaylists
			local var_15_4 = var_15_0.nonF2PPlaylists

			if not var_0_6(arg_13_0, arg_13_1, var_0_5) then
				if #var_15_1 > 0 then
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_13_1, false, {
						promoted = true,
						filtered = true,
						invalidPlaylists = var_15_1
					})
				elseif #var_15_3 > 0 and Lobby.IsSplitScreenEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_13_1, false, {
						isSplitScreenWarning = true,
						text = arg_15_0:GetDataSource().name:GetValue(arg_13_1),
						controllerIndex = arg_13_1
					})
				elseif not Engine.FIDIEBFAG(arg_13_1) and var_15_2 then
					local var_15_5 = {
						controllerIndex = arg_13_1,
						onAccept = var_0_5,
						button = arg_15_0,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_13_1, false, var_15_5)
				elseif #var_15_4 > 0 and Engine.JACCCCEDI() then
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_13_1, false, {
						premium = true,
						invalidPlaylists = var_15_4
					})
				elseif #var_15_4 > 0 and not Engine.HBIAGEFCC() then
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_13_1, false, {
						subscription = true,
						invalidPlaylists = var_15_4
					})
				else
					var_0_5(arg_15_0, arg_13_1)
				end
			end
		end)
	end

	arg_13_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		arg_13_0._isFocused = true

		var_0_8(arg_13_0, arg_13_1)
		ACTIONS.AnimateSequence(arg_13_0, CONDITIONS.IsWZWipFlowEnabled() and "WZWipButtonOver" or "ButtonOver")
		arg_13_0.NewItemSmallIcon:SetAlpha(0)
		arg_13_0.NewItemNotification:SetAlpha(arg_13_0._isNewShown and not arg_13_0._isLimitedTime and 1 or 0, 150)
		arg_13_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		arg_13_0.LimitedTimeNotification:SetAlpha(1, 500)
		arg_13_0.LimitedTimeIcon:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_13_0.LimitedTimeNotification, "ARShowIcon")
		else
			ACTIONS.AnimateSequence(arg_13_0.LimitedTimeNotification, "ShowIcon")
		end
	end)
	arg_13_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		var_0_9(arg_13_0)
	end)
	arg_13_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		arg_13_0._isFocused = false

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_18_0, "ButtonUpDisabledAR")
		else
			ACTIONS.AnimateSequence(arg_18_0, "ButtonUpDisabled")
		end

		arg_13_0.NewItemSmallIcon:SetAlpha(arg_13_0._isNewShown and 1 or 0, 150)
		arg_13_0.NewItemNotification:SetAlpha(0)
		arg_13_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

		arg_13_0._isButtonEnabled = false

		arg_13_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_13_0, "Disabled")

		if arg_13_0._isDataSourceValid then
			arg_13_0:UpdateModifiers()
		end
	end)
	arg_13_0:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
		arg_13_0._isFocused = true

		var_0_8(arg_13_0, arg_13_1)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_13_0, CONDITIONS.IsWZWipFlowEnabled() and "WZWipButtonOverDisabledAR" or "ButtonOverDisabledAR")
		else
			ACTIONS.AnimateSequence(arg_13_0, CONDITIONS.IsWZWipFlowEnabled() and "WZWipButtonOverDisabled" or "ButtonOverDisabled")
		end

		arg_13_0.NewItemSmallIcon:SetAlpha(0)
		arg_13_0.NewItemNotification:SetAlpha(arg_13_0._isNewShown and 1 or 0, 150)
		arg_13_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_13_0:addEventHandler("enable", function(arg_20_0, arg_20_1)
		arg_13_0._isButtonEnabled = true

		arg_13_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_13_0, "Enabled")

		if arg_13_0._isDataSourceValid then
			arg_13_0:UpdateModifiers()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_13_0, "AR")
	else
		arg_13_0.NewItemNotification:SetupRightAlignment()
	end

	arg_13_0.LimitedTimeIcon:SetAlpha(0.6, 300)

	arg_13_0._isLimitedTime = true

	arg_13_0:SubscribeToModelThroughElement(arg_13_0, "desc", function()
		if arg_13_0._isDataSourceValid then
			var_0_8(arg_13_0, arg_13_1)
			arg_13_0:UpdateModifiers()
		end
	end)
	arg_13_0:SubscribeToModelThroughElement(arg_13_0, "image", function()
		assert(arg_13_0.Background)

		local var_22_0 = arg_13_0:GetDataSource().image:GetValue(arg_13_1)

		if var_22_0 and #var_22_0 > 0 then
			arg_13_0.Background.BackgroundImage:setImage(RegisterMaterial(var_22_0))
		end
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_13_0, "WZWipSetup")
	end
end

function BRPromotedButton(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIButton.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_23_0.id = "BRPromotedButton"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "Background"

	var_23_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_23_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_23_0:addElement(var_23_4)

	var_23_0.Background = var_23_4

	local var_23_5
	local var_23_6 = LUI.UIImage.new()

	var_23_6.id = "Backer"

	var_23_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_23_6:SetAlpha(0, 0)
	var_23_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -36, 0)
	var_23_0:addElement(var_23_6)

	var_23_0.Backer = var_23_6

	local var_23_7
	local var_23_8 = LUI.UIStyledText.new()

	var_23_8.id = "GamemodeName"

	var_23_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_23_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_8:SetWordWrap(false)
	var_23_8:SetAlignment(LUI.Alignment.Left)
	var_23_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_23_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_8:SetStartupDelay(1000)
	var_23_8:SetLineHoldTime(400)
	var_23_8:SetAnimMoveTime(2000)
	var_23_8:SetAnimMoveSpeed(150)
	var_23_8:SetEndDelay(2000)
	var_23_8:SetCrossfadeTime(1000)
	var_23_8:SetFadeInTime(300)
	var_23_8:SetFadeOutTime(300)
	var_23_8:SetMaxVisibleLines(1)
	var_23_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 325, _1080p * -59, _1080p * -29)

	local function var_23_9()
		local var_24_0 = var_23_0:GetDataSource().name:GetValue(var_23_1)

		if var_24_0 ~= nil then
			var_23_8:setText(ToUpperCase(var_24_0), 0)
		end
	end

	var_23_8:SubscribeToModelThroughElement(var_23_0, "name", var_23_9)
	var_23_0:addElement(var_23_8)

	var_23_0.GamemodeName = var_23_8

	local var_23_10
	local var_23_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_23_1
	})

	var_23_11.id = "NewItemNotification"

	var_23_11:SetAlpha(0, 0)
	var_23_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * 25, _1080p * 55)
	var_23_0:addElement(var_23_11)

	var_23_0.NewItemNotification = var_23_11

	local var_23_12
	local var_23_13 = LUI.UIImage.new()

	var_23_13.id = "Lock"

	var_23_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_23_13:SetAlpha(0, 0)
	var_23_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_23_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * 32, _1080p * 62)
	var_23_0:addElement(var_23_13)

	var_23_0.Lock = var_23_13

	local var_23_14
	local var_23_15 = LUI.UIStyledText.new()

	var_23_15.id = "Description"

	var_23_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_23_15:SetAlpha(0, 0)
	var_23_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_15:SetAlignment(LUI.Alignment.Left)
	var_23_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_23_15:SetStartupDelay(2000)
	var_23_15:SetLineHoldTime(1000)
	var_23_15:SetAnimMoveTime(2000)
	var_23_15:SetAnimMoveSpeed(150)
	var_23_15:SetEndDelay(3000)
	var_23_15:SetCrossfadeTime(1000)
	var_23_15:SetFadeInTime(300)
	var_23_15:SetFadeOutTime(300)
	var_23_15:SetMaxVisibleLines(3)
	var_23_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 336, _1080p * -29, _1080p * -9)

	local function var_23_16()
		local var_25_0 = var_23_0:GetDataSource().desc:GetValue(var_23_1)

		if var_25_0 ~= nil then
			var_23_15:setText(var_25_0, 0)
		end
	end

	var_23_15:SubscribeToModelThroughElement(var_23_0, "desc", var_23_16)
	var_23_0:addElement(var_23_15)

	var_23_0.Description = var_23_15

	local var_23_17
	local var_23_18 = LUI.UIStyledText.new()

	var_23_18.id = "DisabledText"

	var_23_18:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_23_18:SetAlpha(0, 0)
	var_23_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_23_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_18:SetWordWrap(false)
	var_23_18:SetAlignment(LUI.Alignment.Left)
	var_23_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_18:SetStartupDelay(2000)
	var_23_18:SetLineHoldTime(400)
	var_23_18:SetAnimMoveTime(2000)
	var_23_18:SetAnimMoveSpeed(150)
	var_23_18:SetEndDelay(2000)
	var_23_18:SetCrossfadeTime(1000)
	var_23_18:SetFadeInTime(300)
	var_23_18:SetFadeOutTime(300)
	var_23_18:SetMaxVisibleLines(1)
	var_23_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 37, _1080p * 57)
	var_23_0:addElement(var_23_18)

	var_23_0.DisabledText = var_23_18

	local var_23_19
	local var_23_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_23_1
	})

	var_23_20.id = "NewItemSmallIcon"

	var_23_20:SetAlpha(0, 0)
	var_23_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * 36, _1080p * 44)
	var_23_0:addElement(var_23_20)

	var_23_0.NewItemSmallIcon = var_23_20

	local var_23_21
	local var_23_22 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_23_1
	})

	var_23_22.id = "LimitedTimeBanner"

	var_23_22:SetAlpha(0, 0)
	var_23_22.Backer:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_23_22.Node:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 275, _1080p * 425, _1080p * 92, _1080p * 122)
	var_23_0:addElement(var_23_22)

	var_23_0.LimitedTimeBanner = var_23_22

	local var_23_23
	local var_23_24 = MenuBuilder.BuildRegisteredType("RegistrationTime", {
		controllerIndex = var_23_1
	})

	var_23_24.id = "RegistrationCutoff"

	var_23_24:SetAlpha(0, 0)
	var_23_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 336, _1080p * 414, _1080p * -15, _1080p * 15)
	var_23_0:addElement(var_23_24)

	var_23_0.RegistrationCutoff = var_23_24

	local var_23_25
	local var_23_26 = LUI.UIImage.new()

	var_23_26.id = "MWSnipe"

	var_23_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_26:SetAlpha(0.6, 0)
	var_23_26:setImage(RegisterMaterial("mw_snipe_sm"), 0)
	var_23_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -100, 0, 0, _1080p * 50)
	var_23_0:addElement(var_23_26)

	var_23_0.MWSnipe = var_23_26

	local var_23_27
	local var_23_28 = LUI.UIImage.new()

	var_23_28.id = "SnipeLine"

	var_23_28:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_28:SetAlpha(0.6, 0)
	var_23_28:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_23_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -100, 0, _1080p * 2)
	var_23_0:addElement(var_23_28)

	var_23_0.SnipeLine = var_23_28

	local var_23_29
	local var_23_30 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_23_1
	})

	var_23_30.id = "LimitedTimeNotification"

	var_23_30:SetAlpha(0, 0)
	var_23_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -166, _1080p * -10, _1080p * 92, _1080p * 122)
	var_23_0:addElement(var_23_30)

	var_23_0.LimitedTimeNotification = var_23_30

	local var_23_31
	local var_23_32 = LUI.UIImage.new()

	var_23_32.id = "LimitedTimeIcon"

	var_23_32:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_32:SetAlpha(0, 0)
	var_23_32:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_23_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 395, _1080p * 419, _1080p * 30, _1080p * 54)
	var_23_0:addElement(var_23_32)

	var_23_0.LimitedTimeIcon = var_23_32

	local var_23_33
	local var_23_34 = LUI.UIImage.new()

	var_23_34.id = "ModifierIcon1"

	var_23_34:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_34:SetAlpha(0, 0)
	var_23_34:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_23_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 335, _1080p * 387, _1080p * 94, _1080p * 120)
	var_23_0:addElement(var_23_34)

	var_23_0.ModifierIcon1 = var_23_34

	local var_23_35
	local var_23_36 = LUI.UIImage.new()

	var_23_36.id = "ModifierIcon2"

	var_23_36:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_36:SetAlpha(0, 0)
	var_23_36:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_23_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 251, _1080p * 303, _1080p * 94, _1080p * 120)
	var_23_0:addElement(var_23_36)

	var_23_0.ModifierIcon2 = var_23_36

	local var_23_37
	local var_23_38 = LUI.UIImage.new()

	var_23_38.id = "ModifierIcon3"

	var_23_38:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_23_38:SetAlpha(0, 0)
	var_23_38:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_23_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 293, _1080p * 345, _1080p * 94, _1080p * 120)
	var_23_0:addElement(var_23_38)

	var_23_0.ModifierIcon3 = var_23_38

	local var_23_39
	local var_23_40 = LUI.UIImage.new()

	var_23_40.id = "PlaylistRestrictionIcon"

	var_23_40:SetAlpha(0, 0)
	var_23_40:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
	var_23_40:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 42, _1080p * -42, _1080p * -10)
	var_23_0:addElement(var_23_40)

	var_23_0.PlaylistRestrictionIcon = var_23_40

	local var_23_41
	local var_23_42 = LUI.UIImage.new()

	var_23_42.id = "PlaylistRestrictionHighlightBottom"

	var_23_42:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_23_42:SetAlpha(0, 0)
	var_23_42:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_23_42:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -3, 0)
	var_23_0:addElement(var_23_42)

	var_23_0.PlaylistRestrictionHighlightBottom = var_23_42

	local var_23_43
	local var_23_44 = LUI.UIImage.new()

	var_23_44.id = "PlaylistRestrictionHighlightTop"

	var_23_44:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_23_44:SetAlpha(0, 0)
	var_23_44:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_23_44:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -130, _1080p * -127)
	var_23_0:addElement(var_23_44)

	var_23_0.PlaylistRestrictionHighlightTop = var_23_44

	local function var_23_45()
		return
	end

	var_23_0._sequences.DefaultSequence = var_23_45

	local var_23_46
	local var_23_47 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonOver", var_23_47)

	local var_23_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("ButtonOver", var_23_48)

	local var_23_49 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_15:RegisterAnimationSequence("ButtonOver", var_23_49)

	local var_23_50 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonOver", var_23_50)

	local var_23_51 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonOver", var_23_51)

	local var_23_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonOver", var_23_52)

	local var_23_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 176
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonOver", var_23_53)

	local var_23_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 218
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonOver", var_23_54)

	local function var_23_55()
		var_23_8:AnimateSequence("ButtonOver")
		var_23_13:AnimateSequence("ButtonOver")
		var_23_15:AnimateSequence("ButtonOver")
		var_23_26:AnimateSequence("ButtonOver")
		var_23_28:AnimateSequence("ButtonOver")
		var_23_34:AnimateSequence("ButtonOver")
		var_23_36:AnimateSequence("ButtonOver")
		var_23_38:AnimateSequence("ButtonOver")
	end

	var_23_0._sequences.ButtonOver = var_23_55

	local var_23_56
	local var_23_57 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
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
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUp", var_23_57)

	local var_23_58 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_15:RegisterAnimationSequence("ButtonUp", var_23_58)

	local var_23_59 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonUp", var_23_59)

	local var_23_60 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonUp", var_23_60)

	local var_23_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonUp", var_23_61)

	local var_23_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 303
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonUp", var_23_62)

	local var_23_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonUp", var_23_63)

	local function var_23_64()
		var_23_8:AnimateSequence("ButtonUp")
		var_23_15:AnimateSequence("ButtonUp")
		var_23_26:AnimateSequence("ButtonUp")
		var_23_28:AnimateSequence("ButtonUp")
		var_23_34:AnimateSequence("ButtonUp")
		var_23_36:AnimateSequence("ButtonUp")
		var_23_38:AnimateSequence("ButtonUp")
	end

	var_23_0._sequences.ButtonUp = var_23_64

	local var_23_65
	local var_23_66 = {
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

	var_23_6:RegisterAnimationSequence("ButtonOverDisabled", var_23_66)

	local var_23_67 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonOverDisabled", var_23_67)

	local var_23_68 = {
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

	var_23_18:RegisterAnimationSequence("ButtonOverDisabled", var_23_68)

	local var_23_69 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonOverDisabled", var_23_69)

	local var_23_70 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonOverDisabled", var_23_70)

	local var_23_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonOverDisabled", var_23_71)

	local var_23_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 303
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonOverDisabled", var_23_72)

	local var_23_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonOverDisabled", var_23_73)

	local function var_23_74()
		var_23_6:AnimateSequence("ButtonOverDisabled")
		var_23_8:AnimateSequence("ButtonOverDisabled")
		var_23_18:AnimateSequence("ButtonOverDisabled")
		var_23_26:AnimateSequence("ButtonOverDisabled")
		var_23_28:AnimateSequence("ButtonOverDisabled")
		var_23_34:AnimateSequence("ButtonOverDisabled")
		var_23_36:AnimateSequence("ButtonOverDisabled")
		var_23_38:AnimateSequence("ButtonOverDisabled")
	end

	var_23_0._sequences.ButtonOverDisabled = var_23_74

	local var_23_75
	local var_23_76 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUpDisabled", var_23_76)

	local var_23_77 = {
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUpDisabled", var_23_77)

	local var_23_78 = {
		{
			duration = 50,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_18:RegisterAnimationSequence("ButtonUpDisabled", var_23_78)

	local var_23_79 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonUpDisabled", var_23_79)

	local var_23_80 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonUpDisabled", var_23_80)

	local var_23_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonUpDisabled", var_23_81)

	local var_23_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 303
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonUpDisabled", var_23_82)

	local var_23_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonUpDisabled", var_23_83)

	local function var_23_84()
		var_23_6:AnimateSequence("ButtonUpDisabled")
		var_23_8:AnimateSequence("ButtonUpDisabled")
		var_23_18:AnimateSequence("ButtonUpDisabled")
		var_23_26:AnimateSequence("ButtonUpDisabled")
		var_23_28:AnimateSequence("ButtonUpDisabled")
		var_23_34:AnimateSequence("ButtonUpDisabled")
		var_23_36:AnimateSequence("ButtonUpDisabled")
		var_23_38:AnimateSequence("ButtonUpDisabled")
	end

	var_23_0._sequences.ButtonUpDisabled = var_23_84

	local var_23_85
	local var_23_86 = {
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
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonOverKBM", var_23_86)

	local var_23_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonOverKBM", var_23_87)

	local var_23_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonOverKBM", var_23_88)

	local var_23_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonOverKBM", var_23_89)

	local var_23_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 176
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonOverKBM", var_23_90)

	local var_23_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 218
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonOverKBM", var_23_91)

	local function var_23_92()
		var_23_8:AnimateSequence("ButtonOverKBM")
		var_23_26:AnimateSequence("ButtonOverKBM")
		var_23_28:AnimateSequence("ButtonOverKBM")
		var_23_34:AnimateSequence("ButtonOverKBM")
		var_23_36:AnimateSequence("ButtonOverKBM")
		var_23_38:AnimateSequence("ButtonOverKBM")
	end

	var_23_0._sequences.ButtonOverKBM = var_23_92

	local var_23_93
	local var_23_94 = {
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_23_94)

	local var_23_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonOverDisabledKBM", var_23_95)

	local var_23_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonOverDisabledKBM", var_23_96)

	local var_23_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonOverDisabledKBM", var_23_97)

	local var_23_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 303
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonOverDisabledKBM", var_23_98)

	local var_23_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonOverDisabledKBM", var_23_99)

	local function var_23_100()
		var_23_8:AnimateSequence("ButtonOverDisabledKBM")
		var_23_26:AnimateSequence("ButtonOverDisabledKBM")
		var_23_28:AnimateSequence("ButtonOverDisabledKBM")
		var_23_34:AnimateSequence("ButtonOverDisabledKBM")
		var_23_36:AnimateSequence("ButtonOverDisabledKBM")
		var_23_38:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_23_0._sequences.ButtonOverDisabledKBM = var_23_100

	local var_23_101
	local var_23_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 325
		}
	}

	var_23_8:RegisterAnimationSequence("AR", var_23_102)

	local var_23_103 = {
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

	var_23_11:RegisterAnimationSequence("AR", var_23_103)

	local var_23_104 = {
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

	var_23_13:RegisterAnimationSequence("AR", var_23_104)

	local var_23_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 325
		}
	}

	var_23_15:RegisterAnimationSequence("AR", var_23_105)

	local var_23_106 = {
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

	var_23_18:RegisterAnimationSequence("AR", var_23_106)

	local var_23_107 = {
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

	var_23_20:RegisterAnimationSequence("AR", var_23_107)

	local var_23_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -422
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -266
		}
	}

	var_23_30:RegisterAnimationSequence("AR", var_23_108)

	local var_23_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		}
	}

	var_23_32:RegisterAnimationSequence("AR", var_23_109)

	local var_23_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_23_34:RegisterAnimationSequence("AR", var_23_110)

	local var_23_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_23_36:RegisterAnimationSequence("AR", var_23_111)

	local var_23_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_23_38:RegisterAnimationSequence("AR", var_23_112)

	local function var_23_113()
		var_23_8:AnimateSequence("AR")
		var_23_11:AnimateSequence("AR")
		var_23_13:AnimateSequence("AR")
		var_23_15:AnimateSequence("AR")
		var_23_18:AnimateSequence("AR")
		var_23_20:AnimateSequence("AR")
		var_23_30:AnimateSequence("AR")
		var_23_32:AnimateSequence("AR")
		var_23_34:AnimateSequence("AR")
		var_23_36:AnimateSequence("AR")
		var_23_38:AnimateSequence("AR")
	end

	var_23_0._sequences.AR = var_23_113

	local var_23_114
	local var_23_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("Disabled", var_23_115)

	local function var_23_116()
		var_23_13:AnimateSequence("Disabled")
	end

	var_23_0._sequences.Disabled = var_23_116

	local var_23_117
	local var_23_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("Enabled", var_23_118)

	local function var_23_119()
		var_23_13:AnimateSequence("Enabled")
	end

	var_23_0._sequences.Enabled = var_23_119

	local var_23_120
	local var_23_121 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
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
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUpAR", var_23_121)

	local var_23_122 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_15:RegisterAnimationSequence("ButtonUpAR", var_23_122)

	local var_23_123 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonUpAR", var_23_123)

	local var_23_124 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonUpAR", var_23_124)

	local var_23_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonUpAR", var_23_125)

	local var_23_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonUpAR", var_23_126)

	local var_23_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonUpAR", var_23_127)

	local function var_23_128()
		var_23_8:AnimateSequence("ButtonUpAR")
		var_23_15:AnimateSequence("ButtonUpAR")
		var_23_26:AnimateSequence("ButtonUpAR")
		var_23_28:AnimateSequence("ButtonUpAR")
		var_23_34:AnimateSequence("ButtonUpAR")
		var_23_36:AnimateSequence("ButtonUpAR")
		var_23_38:AnimateSequence("ButtonUpAR")
	end

	var_23_0._sequences.ButtonUpAR = var_23_128

	local var_23_129
	local var_23_130 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_130)

	local var_23_131 = {
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_131)

	local var_23_132 = {
		{
			duration = 50,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_18:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_132)

	local var_23_133 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_133)

	local var_23_134 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_134)

	local var_23_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_135)

	local var_23_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_136)

	local var_23_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonUpDisabledAR", var_23_137)

	local function var_23_138()
		var_23_6:AnimateSequence("ButtonUpDisabledAR")
		var_23_8:AnimateSequence("ButtonUpDisabledAR")
		var_23_18:AnimateSequence("ButtonUpDisabledAR")
		var_23_26:AnimateSequence("ButtonUpDisabledAR")
		var_23_28:AnimateSequence("ButtonUpDisabledAR")
		var_23_34:AnimateSequence("ButtonUpDisabledAR")
		var_23_36:AnimateSequence("ButtonUpDisabledAR")
		var_23_38:AnimateSequence("ButtonUpDisabledAR")
	end

	var_23_0._sequences.ButtonUpDisabledAR = var_23_138

	local var_23_139
	local var_23_140 = {
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

	var_23_6:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_140)

	local var_23_141 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_141)

	local var_23_142 = {
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

	var_23_18:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_142)

	local var_23_143 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_143)

	local var_23_144 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_144)

	local var_23_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_23_34:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_145)

	local var_23_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		}
	}

	var_23_36:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_146)

	local var_23_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
		}
	}

	var_23_38:RegisterAnimationSequence("ButtonOverDisabledAR", var_23_147)

	local function var_23_148()
		var_23_6:AnimateSequence("ButtonOverDisabledAR")
		var_23_8:AnimateSequence("ButtonOverDisabledAR")
		var_23_18:AnimateSequence("ButtonOverDisabledAR")
		var_23_26:AnimateSequence("ButtonOverDisabledAR")
		var_23_28:AnimateSequence("ButtonOverDisabledAR")
		var_23_34:AnimateSequence("ButtonOverDisabledAR")
		var_23_36:AnimateSequence("ButtonOverDisabledAR")
		var_23_38:AnimateSequence("ButtonOverDisabledAR")
	end

	var_23_0._sequences.ButtonOverDisabledAR = var_23_148

	local var_23_149
	local var_23_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipSetup", var_23_150)

	local var_23_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_23_28:RegisterAnimationSequence("WZWipSetup", var_23_151)

	local function var_23_152()
		var_23_26:AnimateSequence("WZWipSetup")
		var_23_28:AnimateSequence("WZWipSetup")
	end

	var_23_0._sequences.WZWipSetup = var_23_152

	local var_23_153
	local var_23_154 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonOver", var_23_154)

	local var_23_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipButtonOver", var_23_155)

	local var_23_156 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_15:RegisterAnimationSequence("WZWipButtonOver", var_23_156)

	local var_23_157 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipButtonOver", var_23_157)

	local var_23_158 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("WZWipButtonOver", var_23_158)

	local var_23_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_23_34:RegisterAnimationSequence("WZWipButtonOver", var_23_159)

	local var_23_160 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 176
		}
	}

	var_23_36:RegisterAnimationSequence("WZWipButtonOver", var_23_160)

	local var_23_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 218
		}
	}

	var_23_38:RegisterAnimationSequence("WZWipButtonOver", var_23_161)

	local function var_23_162()
		var_23_8:AnimateSequence("WZWipButtonOver")
		var_23_13:AnimateSequence("WZWipButtonOver")
		var_23_15:AnimateSequence("WZWipButtonOver")
		var_23_26:AnimateSequence("WZWipButtonOver")
		var_23_28:AnimateSequence("WZWipButtonOver")
		var_23_34:AnimateSequence("WZWipButtonOver")
		var_23_36:AnimateSequence("WZWipButtonOver")
		var_23_38:AnimateSequence("WZWipButtonOver")
	end

	var_23_0._sequences.WZWipButtonOver = var_23_162

	local var_23_163
	local var_23_164 = {
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

	var_23_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_164)

	local var_23_165 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_165)

	local var_23_166 = {
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

	var_23_18:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_166)

	local var_23_167 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_167)

	local var_23_168 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_168)

	local var_23_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		}
	}

	var_23_34:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_169)

	local var_23_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 303
		}
	}

	var_23_36:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_170)

	local var_23_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		}
	}

	var_23_38:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_171)

	local function var_23_172()
		var_23_6:AnimateSequence("WZWipButtonOverDisabled")
		var_23_8:AnimateSequence("WZWipButtonOverDisabled")
		var_23_18:AnimateSequence("WZWipButtonOverDisabled")
		var_23_26:AnimateSequence("WZWipButtonOverDisabled")
		var_23_28:AnimateSequence("WZWipButtonOverDisabled")
		var_23_34:AnimateSequence("WZWipButtonOverDisabled")
		var_23_36:AnimateSequence("WZWipButtonOverDisabled")
		var_23_38:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_23_0._sequences.WZWipButtonOverDisabled = var_23_172

	local var_23_173
	local var_23_174 = {
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

	var_23_6:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_174)

	local var_23_175 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_175)

	local var_23_176 = {
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

	var_23_18:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_176)

	local var_23_177 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_26:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_177)

	local var_23_178 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_28:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_178)

	local var_23_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_23_34:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_179)

	local var_23_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		}
	}

	var_23_36:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_180)

	local var_23_181 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
		}
	}

	var_23_38:RegisterAnimationSequence("WZWipButtonOverDisabledAR", var_23_181)

	local function var_23_182()
		var_23_6:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_8:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_18:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_26:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_28:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_34:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_36:AnimateSequence("WZWipButtonOverDisabledAR")
		var_23_38:AnimateSequence("WZWipButtonOverDisabledAR")
	end

	var_23_0._sequences.WZWipButtonOverDisabledAR = var_23_182

	local var_23_183
	local var_23_184 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_23_8:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_23_184)

	local var_23_185 = {
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

	var_23_40:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_23_185)

	local var_23_186 = {
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

	var_23_42:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_23_186)

	local var_23_187 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_44:RegisterAnimationSequence("ModPlaylistRestrictionEnabled", var_23_187)

	local function var_23_188()
		var_23_8:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_23_40:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_23_42:AnimateSequence("ModPlaylistRestrictionEnabled")
		var_23_44:AnimateSequence("ModPlaylistRestrictionEnabled")
	end

	var_23_0._sequences.ModPlaylistRestrictionEnabled = var_23_188

	local var_23_189
	local var_23_190 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_23_8:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_23_190)

	local var_23_191 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_40:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_23_191)

	local var_23_192 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_42:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_23_192)

	local var_23_193 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_44:RegisterAnimationSequence("ModPlaylistRestrictionOff", var_23_193)

	local function var_23_194()
		var_23_8:AnimateSequence("ModPlaylistRestrictionOff")
		var_23_40:AnimateSequence("ModPlaylistRestrictionOff")
		var_23_42:AnimateSequence("ModPlaylistRestrictionOff")
		var_23_44:AnimateSequence("ModPlaylistRestrictionOff")
	end

	var_23_0._sequences.ModPlaylistRestrictionOff = var_23_194

	local var_23_195
	local var_23_196 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_23_8:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_23_196)

	local var_23_197 = {
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

	var_23_40:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_23_197)

	local var_23_198 = {
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

	var_23_42:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_23_198)

	local var_23_199 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_44:RegisterAnimationSequence("ModPlaylistRestrictionDisabled", var_23_199)

	local function var_23_200()
		var_23_8:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_23_40:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_23_42:AnimateSequence("ModPlaylistRestrictionDisabled")
		var_23_44:AnimateSequence("ModPlaylistRestrictionDisabled")
	end

	var_23_0._sequences.ModPlaylistRestrictionDisabled = var_23_200

	var_23_0:addEventHandler("button_disable", function(arg_46_0, arg_46_1)
		if not arg_46_1.controller then
			local var_46_0 = var_23_1
		end

		ACTIONS.AnimateSequence(var_23_0, "ButtonUpDisabled")

		if CONDITIONS.IsArabic() then
			ACTIONS.AnimateSequence(var_23_0, "ButtonUpTitleAR")
		end

		if not CONDITIONS.IsArabic() then
			ACTIONS.AnimateSequence(var_23_0, "ButtonUpTitle")
		end
	end)
	var_0_10(var_23_0, var_23_1, arg_23_1)
	ACTIONS.AnimateSequenceByElement(var_23_0, {
		elementPath = "self.Background",
		sequenceName = "WZPromoted",
		elementName = "Background"
	})

	return var_23_0
end

MenuBuilder.registerType("BRPromotedButton", BRPromotedButton)
LockTable(_M)
