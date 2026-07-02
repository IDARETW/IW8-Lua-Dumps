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

local function var_0_5(arg_5_0, arg_5_1)
	Lobby.TryNavigateToLobby(function()
		local var_6_0 = arg_5_0:GetDataSource().index:GetValue(arg_5_1)

		Playlist.CDBBECIGIG(var_6_0, PlaylistUtils.USE_FILTERED_PLAYLIST_ID)

		if CONDITIONS.IsMagmaGameMode(self) then
			LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_5_1, false, {
				openFromPlaylist = true
			})
		else
			LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_5_1, false, {
				openFromPlaylist = true
			})
		end
	end)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = Onboarding.GamemodeMoshpit.WasCompleted(arg_7_0, arg_7_1)
	local var_7_1 = Onboarding.GamemodeTDM.WasCompleted(arg_7_0, arg_7_1)
	local var_7_2 = Onboarding.GamemodeGunfight.WasCompleted(arg_7_0, arg_7_1)

	if var_7_0 and var_7_1 and var_7_2 then
		return
	end

	local var_7_3 = arg_7_0:GetDataSource()
	local var_7_4 = PlaylistUtils.GetCategoryGameTypes(arg_7_1, var_7_3)
	local var_7_5 = 0

	for iter_7_0, iter_7_1 in pairs(var_7_4) do
		var_7_5 = var_7_5 + 1
	end

	local function var_7_6()
		var_0_5(arg_7_0, arg_7_1)
	end

	if var_7_5 > 1 then
		if not var_7_0 then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "onboardingpopup", true, arg_7_1, false, ONBOARDING_DATA.GetOnboardingMPMoshpitData(var_7_6))
			Onboarding.GamemodeMoshpit.MarkCompleted(arg_7_0, arg_7_1)

			return true
		end
	elseif var_7_4[PlaylistUtils.GameTypes.TDMGameType] and not var_7_1 then
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "onboardingpopup", true, arg_7_1, false, ONBOARDING_DATA.GetOnboardingTDMData(var_7_6))
		Onboarding.GamemodeTDM.MarkCompleted(arg_7_0, arg_7_1)

		return true
	elseif var_7_4[PlaylistUtils.GameTypes.GunfightGameType] and not var_7_2 then
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "onboardingpopup", true, arg_7_1, false, ONBOARDING_DATA.GetOnboardingGunfightData(var_7_6))
		Onboarding.GamemodeGunfight.MarkCompleted(arg_7_0, arg_7_1)

		return true
	end

	return false
end

local function var_0_7(arg_9_0)
	arg_9_0:UpdateModifiers()
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.UpdateBreadcrumb = var_0_3
	arg_10_0.OnDataSourceAssigned = var_0_7
	arg_10_0.UpdateModifiers = var_0_4
	arg_10_0._isNew = false
	arg_10_0.SetNew = var_0_2
	arg_10_0._isButtonEnabled = true

	if arg_10_2.isTournament then
		arg_10_0:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			TOURNAMENT.ButtonAction(arg_11_1.controller)
		end)
	else
		arg_10_0:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			local var_12_0 = PlaylistUtils.ValidateSelection(arg_10_0:GetDataSource(), arg_12_1.controller)
			local var_12_1 = var_12_0.invalidPlaylists
			local var_12_2 = var_12_0.requiresCrossplay
			local var_12_3 = var_12_0.maxPlayerPlaylists
			local var_12_4 = var_12_0.nonF2PPlaylists

			if not var_0_6(arg_10_0, arg_10_1, var_0_5) then
				if #var_12_1 > 0 then
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_10_1, false, {
						promoted = true,
						filtered = true,
						invalidPlaylists = var_12_1
					})
				elseif #var_12_3 > 0 and Lobby.IsSplitScreenEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_10_1, false, {
						isSplitScreenWarning = true,
						text = arg_12_0:GetDataSource().name:GetValue(arg_10_1),
						controllerIndex = arg_10_1
					})
				elseif not Engine.FIDIEBFAG(arg_10_1) and var_12_2 then
					local var_12_5 = {
						controllerIndex = arg_10_1,
						onAccept = var_0_5,
						button = arg_12_0,
						crossplayRecommended = Engine.CIEGIACHAE()
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_10_1, false, var_12_5)
				elseif #var_12_4 > 0 and Engine.JACCCCEDI() then
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_10_1, false, {
						premium = true,
						invalidPlaylists = var_12_4
					})
				elseif #var_12_4 > 0 and not Engine.HBIAGEFCC() then
					LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_10_1, false, {
						subscription = true,
						invalidPlaylists = var_12_4
					})
				else
					var_0_5(arg_12_0, arg_10_1)
				end
			end
		end)
	end

	arg_10_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		arg_10_0._isFocused = true

		ACTIONS.AnimateSequence(arg_10_0, "ButtonOver")
		arg_10_0.NewItemSmallIcon:SetAlpha(0)
		arg_10_0.NewItemNotification:SetAlpha(arg_10_0._isNewShown and 1 or 0, 150)
		arg_10_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		arg_10_0.LimitedTimeNotification:SetAlpha(1, 500)
		arg_10_0.LimitedTimeIcon:SetAlpha(0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_10_0.LimitedTimeNotification, "ARShowIcon")
		else
			ACTIONS.AnimateSequence(arg_10_0.LimitedTimeNotification, "ShowIcon")
		end
	end)
	arg_10_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_10_0, "ButtonUpAR")
		else
			ACTIONS.AnimateSequence(arg_10_0, "ButtonUp")
		end

		ACTIONS.AnimateSequence(arg_10_0.Background, "ButtonUp")

		arg_10_0._isFocused = false

		arg_10_0.NewItemSmallIcon:SetAlpha(arg_10_0._isNewShown and 1 or 0, 150)
		arg_10_0.NewItemNotification:SetAlpha(0)
		arg_10_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		arg_10_0.LimitedTimeIcon:SetAlpha(0.6, 300)
		arg_10_0.LimitedTimeNotification:SetAlpha(0)
	end)
	arg_10_0:addEventHandler("button_disable", function(arg_15_0, arg_15_1)
		arg_10_0._isFocused = false

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_15_0, "ButtonUpDisabledAR")
		else
			ACTIONS.AnimateSequence(arg_15_0, "ButtonUpDisabled")
		end

		arg_10_0.NewItemSmallIcon:SetAlpha(arg_10_0._isNewShown and 1 or 0, 150)
		arg_10_0.NewItemNotification:SetAlpha(0)
		arg_10_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

		arg_10_0._isButtonEnabled = false

		arg_10_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_10_0, "Disabled")

		if arg_10_0._isDataSourceValid then
			arg_10_0:UpdateModifiers()
		end
	end)
	arg_10_0:addEventHandler("button_over_disable", function(arg_16_0, arg_16_1)
		arg_10_0._isFocused = true

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_10_0, "ButtonOverDisabledAR")
		else
			ACTIONS.AnimateSequence(arg_10_0, "ButtonOverDisabled")
		end

		arg_10_0.NewItemSmallIcon:SetAlpha(0)
		arg_10_0.NewItemNotification:SetAlpha(arg_10_0._isNewShown and 1 or 0, 150)
		arg_10_0.GamemodeName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_10_0:addEventHandler("enable", function(arg_17_0, arg_17_1)
		arg_10_0._isButtonEnabled = true

		arg_10_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_10_0, "Enabled")

		if arg_10_0._isDataSourceValid then
			arg_10_0:UpdateModifiers()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_10_0, "AR")
	else
		arg_10_0.NewItemNotification:SetupRightAlignment()
	end

	arg_10_0.LimitedTimeIcon:SetAlpha(0.6, 300)
	arg_10_0:SubscribeToModelThroughElement(arg_10_0, "desc", function()
		assert(arg_10_0.Description)

		local var_18_0 = arg_10_0:GetDataSource().desc:GetValue(arg_10_1)

		if arg_10_0._isDataSourceValid then
			arg_10_0:UpdateModifiers()
		end
	end)
	arg_10_0:SubscribeToModelThroughElement(arg_10_0, "image", function()
		assert(arg_10_0.Background)

		local var_19_0 = arg_10_0:GetDataSource().image:GetValue(arg_10_1)

		if var_19_0 and #var_19_0 > 0 then
			arg_10_0.Background.BackgroundImage:setImage(RegisterMaterial(var_19_0))
		end
	end)
end

function BRPromotedButton(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIButton.new()

	var_20_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_20_0.id = "BRPromotedButton"
	var_20_0._animationSets = var_20_0._animationSets or {}
	var_20_0._sequences = var_20_0._sequences or {}

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_20_1
	})

	var_20_4.id = "Background"

	var_20_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_20_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_20_0:addElement(var_20_4)

	var_20_0.Background = var_20_4

	local var_20_5
	local var_20_6 = LUI.UIImage.new()

	var_20_6.id = "Backer"

	var_20_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_20_6:SetAlpha(0, 0)
	var_20_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -36, 0)
	var_20_0:addElement(var_20_6)

	var_20_0.Backer = var_20_6

	local var_20_7
	local var_20_8 = LUI.UIStyledText.new()

	var_20_8.id = "GamemodeName"

	var_20_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_20_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_8:SetWordWrap(false)
	var_20_8:SetAlignment(LUI.Alignment.Left)
	var_20_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_20_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_20_8:SetStartupDelay(1000)
	var_20_8:SetLineHoldTime(400)
	var_20_8:SetAnimMoveTime(2000)
	var_20_8:SetAnimMoveSpeed(150)
	var_20_8:SetEndDelay(2000)
	var_20_8:SetCrossfadeTime(1000)
	var_20_8:SetFadeInTime(300)
	var_20_8:SetFadeOutTime(300)
	var_20_8:SetMaxVisibleLines(1)
	var_20_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_20_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 325, _1080p * -59, _1080p * -29)

	local function var_20_9()
		local var_21_0 = var_20_0:GetDataSource().name:GetValue(var_20_1)

		if var_21_0 ~= nil then
			var_20_8:setText(ToUpperCase(var_21_0), 0)
		end
	end

	var_20_8:SubscribeToModelThroughElement(var_20_0, "name", var_20_9)
	var_20_0:addElement(var_20_8)

	var_20_0.GamemodeName = var_20_8

	local var_20_10
	local var_20_11 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_20_1
	})

	var_20_11.id = "NewItemNotification"

	var_20_11:SetAlpha(0, 0)
	var_20_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 341, _1080p * 419, _1080p * -19, _1080p * 11)
	var_20_0:addElement(var_20_11)

	var_20_0.NewItemNotification = var_20_11

	local var_20_12
	local var_20_13 = LUI.UIImage.new()

	var_20_13.id = "Lock"

	var_20_13:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_20_13:SetAlpha(0, 0)
	var_20_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_20_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * 32, _1080p * 62)
	var_20_0:addElement(var_20_13)

	var_20_0.Lock = var_20_13

	local var_20_14
	local var_20_15 = LUI.UIStyledText.new()

	var_20_15.id = "Description"

	var_20_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_20_15:SetAlpha(0, 0)
	var_20_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_15:SetAlignment(LUI.Alignment.Left)
	var_20_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_20_15:SetStartupDelay(2000)
	var_20_15:SetLineHoldTime(1000)
	var_20_15:SetAnimMoveTime(2000)
	var_20_15:SetAnimMoveSpeed(150)
	var_20_15:SetEndDelay(3000)
	var_20_15:SetCrossfadeTime(1000)
	var_20_15:SetFadeInTime(300)
	var_20_15:SetFadeOutTime(300)
	var_20_15:SetMaxVisibleLines(3)
	var_20_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 336, _1080p * -29, _1080p * -9)

	local function var_20_16()
		local var_22_0 = var_20_0:GetDataSource().desc:GetValue(var_20_1)

		if var_22_0 ~= nil then
			var_20_15:setText(var_22_0, 0)
		end
	end

	var_20_15:SubscribeToModelThroughElement(var_20_0, "desc", var_20_16)
	var_20_0:addElement(var_20_15)

	var_20_0.Description = var_20_15

	local var_20_17
	local var_20_18 = LUI.UIStyledText.new()

	var_20_18.id = "DisabledText"

	var_20_18:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_20_18:SetAlpha(0, 0)
	var_20_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_20_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_18:SetWordWrap(false)
	var_20_18:SetAlignment(LUI.Alignment.Left)
	var_20_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_20_18:SetStartupDelay(2000)
	var_20_18:SetLineHoldTime(400)
	var_20_18:SetAnimMoveTime(2000)
	var_20_18:SetAnimMoveSpeed(150)
	var_20_18:SetEndDelay(2000)
	var_20_18:SetCrossfadeTime(1000)
	var_20_18:SetFadeInTime(300)
	var_20_18:SetFadeOutTime(300)
	var_20_18:SetMaxVisibleLines(1)
	var_20_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 37, _1080p * 57)
	var_20_0:addElement(var_20_18)

	var_20_0.DisabledText = var_20_18

	local var_20_19
	local var_20_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_20_1
	})

	var_20_20.id = "NewItemSmallIcon"

	var_20_20:SetAlpha(0, 0)
	var_20_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -4, _1080p * 4)
	var_20_0:addElement(var_20_20)

	var_20_0.NewItemSmallIcon = var_20_20

	local var_20_21
	local var_20_22 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_20_1
	})

	var_20_22.id = "LimitedTimeBanner"

	var_20_22:SetAlpha(0, 0)
	var_20_22.Backer:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_20_22.Node:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_20_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 275, _1080p * 425, _1080p * 92, _1080p * 122)
	var_20_0:addElement(var_20_22)

	var_20_0.LimitedTimeBanner = var_20_22

	local var_20_23
	local var_20_24 = MenuBuilder.BuildRegisteredType("RegistrationTime", {
		controllerIndex = var_20_1
	})

	var_20_24.id = "RegistrationCutoff"

	var_20_24:SetAlpha(0, 0)
	var_20_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 336, _1080p * 414, _1080p * -15, _1080p * 15)
	var_20_0:addElement(var_20_24)

	var_20_0.RegistrationCutoff = var_20_24

	local var_20_25
	local var_20_26 = LUI.UIImage.new()

	var_20_26.id = "MWSnipe"

	var_20_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_20_26:SetAlpha(0.6, 0)
	var_20_26:setImage(RegisterMaterial("mw_snipe_sm"), 0)
	var_20_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -100, 0, 0, _1080p * 50)
	var_20_0:addElement(var_20_26)

	var_20_0.MWSnipe = var_20_26

	local var_20_27
	local var_20_28 = LUI.UIImage.new()

	var_20_28.id = "SnipeLine"

	var_20_28:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_20_28:SetAlpha(0.6, 0)
	var_20_28:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_20_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -100, 0, _1080p * 2)
	var_20_0:addElement(var_20_28)

	var_20_0.SnipeLine = var_20_28

	local var_20_29
	local var_20_30 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_20_1
	})

	var_20_30.id = "LimitedTimeNotification"

	var_20_30:SetAlpha(0, 0)
	var_20_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -166, _1080p * -10, _1080p * 92, _1080p * 122)
	var_20_0:addElement(var_20_30)

	var_20_0.LimitedTimeNotification = var_20_30

	local var_20_31
	local var_20_32 = LUI.UIImage.new()

	var_20_32.id = "LimitedTimeIcon"

	var_20_32:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_20_32:SetAlpha(0, 0)
	var_20_32:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_20_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 395, _1080p * 419, _1080p * 30, _1080p * 54)
	var_20_0:addElement(var_20_32)

	var_20_0.LimitedTimeIcon = var_20_32

	local var_20_33
	local var_20_34 = LUI.UIImage.new()

	var_20_34.id = "ModifierIcon1"

	var_20_34:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_20_34:SetAlpha(0, 0)
	var_20_34:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_20_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 363, _1080p * 387, _1080p * 95, _1080p * 119)
	var_20_0:addElement(var_20_34)

	var_20_0.ModifierIcon1 = var_20_34

	local var_20_35
	local var_20_36 = LUI.UIImage.new()

	var_20_36.id = "ModifierIcon2"

	var_20_36:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_20_36:SetAlpha(0, 0)
	var_20_36:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_20_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 301, _1080p * 325, _1080p * 95, _1080p * 119)
	var_20_0:addElement(var_20_36)

	var_20_0.ModifierIcon2 = var_20_36

	local var_20_37
	local var_20_38 = LUI.UIImage.new()

	var_20_38.id = "ModifierIcon3"

	var_20_38:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_20_38:SetAlpha(0, 0)
	var_20_38:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_20_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 333, _1080p * 357, _1080p * 95, _1080p * 119)
	var_20_0:addElement(var_20_38)

	var_20_0.ModifierIcon3 = var_20_38

	local function var_20_39()
		return
	end

	var_20_0._sequences.DefaultSequence = var_20_39

	local var_20_40
	local var_20_41 = {
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

	var_20_8:RegisterAnimationSequence("ButtonOver", var_20_41)

	local var_20_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_13:RegisterAnimationSequence("ButtonOver", var_20_42)

	local var_20_43 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("ButtonOver", var_20_43)

	local var_20_44 = {
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

	var_20_26:RegisterAnimationSequence("ButtonOver", var_20_44)

	local var_20_45 = {
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

	var_20_28:RegisterAnimationSequence("ButtonOver", var_20_45)

	local var_20_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 236
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonOver", var_20_46)

	local var_20_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 202
		}
	}

	var_20_36:RegisterAnimationSequence("ButtonOver", var_20_47)

	local var_20_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 231
		}
	}

	var_20_38:RegisterAnimationSequence("ButtonOver", var_20_48)

	local function var_20_49()
		var_20_8:AnimateSequence("ButtonOver")
		var_20_13:AnimateSequence("ButtonOver")
		var_20_15:AnimateSequence("ButtonOver")
		var_20_26:AnimateSequence("ButtonOver")
		var_20_28:AnimateSequence("ButtonOver")
		var_20_34:AnimateSequence("ButtonOver")
		var_20_36:AnimateSequence("ButtonOver")
		var_20_38:AnimateSequence("ButtonOver")
	end

	var_20_0._sequences.ButtonOver = var_20_49

	local var_20_50
	local var_20_51 = {
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

	var_20_8:RegisterAnimationSequence("ButtonUp", var_20_51)

	local var_20_52 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("ButtonUp", var_20_52)

	local var_20_53 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("ButtonUp", var_20_53)

	local var_20_54 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_28:RegisterAnimationSequence("ButtonUp", var_20_54)

	local var_20_55 = {
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

	var_20_34:RegisterAnimationSequence("ButtonUp", var_20_55)

	local var_20_56 = {
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

	var_20_36:RegisterAnimationSequence("ButtonUp", var_20_56)

	local var_20_57 = {
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

	var_20_38:RegisterAnimationSequence("ButtonUp", var_20_57)

	local function var_20_58()
		var_20_8:AnimateSequence("ButtonUp")
		var_20_15:AnimateSequence("ButtonUp")
		var_20_26:AnimateSequence("ButtonUp")
		var_20_28:AnimateSequence("ButtonUp")
		var_20_34:AnimateSequence("ButtonUp")
		var_20_36:AnimateSequence("ButtonUp")
		var_20_38:AnimateSequence("ButtonUp")
	end

	var_20_0._sequences.ButtonUp = var_20_58

	local var_20_59
	local var_20_60 = {
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

	var_20_6:RegisterAnimationSequence("ButtonOverDisabled", var_20_60)

	local var_20_61 = {
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

	var_20_8:RegisterAnimationSequence("ButtonOverDisabled", var_20_61)

	local var_20_62 = {
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

	var_20_18:RegisterAnimationSequence("ButtonOverDisabled", var_20_62)

	local var_20_63 = {
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

	var_20_26:RegisterAnimationSequence("ButtonOverDisabled", var_20_63)

	local var_20_64 = {
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

	var_20_28:RegisterAnimationSequence("ButtonOverDisabled", var_20_64)

	local var_20_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 109
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonOverDisabled", var_20_65)

	local var_20_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 109
		}
	}

	var_20_36:RegisterAnimationSequence("ButtonOverDisabled", var_20_66)

	local var_20_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 388
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 109
		}
	}

	var_20_38:RegisterAnimationSequence("ButtonOverDisabled", var_20_67)

	local function var_20_68()
		var_20_6:AnimateSequence("ButtonOverDisabled")
		var_20_8:AnimateSequence("ButtonOverDisabled")
		var_20_18:AnimateSequence("ButtonOverDisabled")
		var_20_26:AnimateSequence("ButtonOverDisabled")
		var_20_28:AnimateSequence("ButtonOverDisabled")
		var_20_34:AnimateSequence("ButtonOverDisabled")
		var_20_36:AnimateSequence("ButtonOverDisabled")
		var_20_38:AnimateSequence("ButtonOverDisabled")
	end

	var_20_0._sequences.ButtonOverDisabled = var_20_68

	local var_20_69
	local var_20_70 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_6:RegisterAnimationSequence("ButtonUpDisabled", var_20_70)

	local var_20_71 = {
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

	var_20_8:RegisterAnimationSequence("ButtonUpDisabled", var_20_71)

	local var_20_72 = {
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

	var_20_18:RegisterAnimationSequence("ButtonUpDisabled", var_20_72)

	local var_20_73 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("ButtonUpDisabled", var_20_73)

	local var_20_74 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_28:RegisterAnimationSequence("ButtonUpDisabled", var_20_74)

	local var_20_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 363
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonUpDisabled", var_20_75)

	local var_20_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_20_36:RegisterAnimationSequence("ButtonUpDisabled", var_20_76)

	local var_20_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_20_38:RegisterAnimationSequence("ButtonUpDisabled", var_20_77)

	local function var_20_78()
		var_20_6:AnimateSequence("ButtonUpDisabled")
		var_20_8:AnimateSequence("ButtonUpDisabled")
		var_20_18:AnimateSequence("ButtonUpDisabled")
		var_20_26:AnimateSequence("ButtonUpDisabled")
		var_20_28:AnimateSequence("ButtonUpDisabled")
		var_20_34:AnimateSequence("ButtonUpDisabled")
		var_20_36:AnimateSequence("ButtonUpDisabled")
		var_20_38:AnimateSequence("ButtonUpDisabled")
	end

	var_20_0._sequences.ButtonUpDisabled = var_20_78

	local var_20_79
	local var_20_80 = {
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

	var_20_8:RegisterAnimationSequence("ButtonOverKBM", var_20_80)

	local var_20_81 = {
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

	var_20_26:RegisterAnimationSequence("ButtonOverKBM", var_20_81)

	local var_20_82 = {
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

	var_20_28:RegisterAnimationSequence("ButtonOverKBM", var_20_82)

	local function var_20_83()
		var_20_8:AnimateSequence("ButtonOverKBM")
		var_20_26:AnimateSequence("ButtonOverKBM")
		var_20_28:AnimateSequence("ButtonOverKBM")
	end

	var_20_0._sequences.ButtonOverKBM = var_20_83

	local var_20_84
	local var_20_85 = {
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

	var_20_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_20_85)

	local var_20_86 = {
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

	var_20_26:RegisterAnimationSequence("ButtonOverDisabledKBM", var_20_86)

	local var_20_87 = {
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

	var_20_28:RegisterAnimationSequence("ButtonOverDisabledKBM", var_20_87)

	local var_20_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 306
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 107
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonOverDisabledKBM", var_20_88)

	local var_20_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 107
		}
	}

	var_20_36:RegisterAnimationSequence("ButtonOverDisabledKBM", var_20_89)

	local var_20_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 388
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 106
		}
	}

	var_20_38:RegisterAnimationSequence("ButtonOverDisabledKBM", var_20_90)

	local function var_20_91()
		var_20_8:AnimateSequence("ButtonOverDisabledKBM")
		var_20_26:AnimateSequence("ButtonOverDisabledKBM")
		var_20_28:AnimateSequence("ButtonOverDisabledKBM")
		var_20_34:AnimateSequence("ButtonOverDisabledKBM")
		var_20_36:AnimateSequence("ButtonOverDisabledKBM")
		var_20_38:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_20_0._sequences.ButtonOverDisabledKBM = var_20_91

	local var_20_92
	local var_20_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 325
		}
	}

	var_20_8:RegisterAnimationSequence("AR", var_20_93)

	local var_20_94 = {
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

	var_20_11:RegisterAnimationSequence("AR", var_20_94)

	local var_20_95 = {
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

	var_20_13:RegisterAnimationSequence("AR", var_20_95)

	local var_20_96 = {
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
			value = _1080p * 411
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 83
		}
	}

	var_20_15:RegisterAnimationSequence("AR", var_20_96)

	local var_20_97 = {
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

	var_20_18:RegisterAnimationSequence("AR", var_20_97)

	local var_20_98 = {
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

	var_20_20:RegisterAnimationSequence("AR", var_20_98)

	local var_20_99 = {
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

	var_20_30:RegisterAnimationSequence("AR", var_20_99)

	local var_20_100 = {
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

	var_20_32:RegisterAnimationSequence("AR", var_20_100)

	local var_20_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		}
	}

	var_20_34:RegisterAnimationSequence("AR", var_20_101)

	local var_20_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
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

	var_20_36:RegisterAnimationSequence("AR", var_20_102)

	local var_20_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
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

	var_20_38:RegisterAnimationSequence("AR", var_20_103)

	local function var_20_104()
		var_20_8:AnimateSequence("AR")
		var_20_11:AnimateSequence("AR")
		var_20_13:AnimateSequence("AR")
		var_20_15:AnimateSequence("AR")
		var_20_18:AnimateSequence("AR")
		var_20_20:AnimateSequence("AR")
		var_20_30:AnimateSequence("AR")
		var_20_32:AnimateSequence("AR")
		var_20_34:AnimateSequence("AR")
		var_20_36:AnimateSequence("AR")
		var_20_38:AnimateSequence("AR")
	end

	var_20_0._sequences.AR = var_20_104

	local var_20_105
	local var_20_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_13:RegisterAnimationSequence("Disabled", var_20_106)

	local function var_20_107()
		var_20_13:AnimateSequence("Disabled")
	end

	var_20_0._sequences.Disabled = var_20_107

	local var_20_108
	local var_20_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_13:RegisterAnimationSequence("Enabled", var_20_109)

	local function var_20_110()
		var_20_13:AnimateSequence("Enabled")
	end

	var_20_0._sequences.Enabled = var_20_110

	local var_20_111
	local var_20_112 = {
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

	var_20_8:RegisterAnimationSequence("ButtonUpAR", var_20_112)

	local var_20_113 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("ButtonUpAR", var_20_113)

	local var_20_114 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("ButtonUpAR", var_20_114)

	local var_20_115 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_28:RegisterAnimationSequence("ButtonUpAR", var_20_115)

	local var_20_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonUpAR", var_20_116)

	local var_20_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 122
		}
	}

	var_20_36:RegisterAnimationSequence("ButtonUpAR", var_20_117)

	local var_20_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_20_38:RegisterAnimationSequence("ButtonUpAR", var_20_118)

	local function var_20_119()
		var_20_8:AnimateSequence("ButtonUpAR")
		var_20_15:AnimateSequence("ButtonUpAR")
		var_20_26:AnimateSequence("ButtonUpAR")
		var_20_28:AnimateSequence("ButtonUpAR")
		var_20_34:AnimateSequence("ButtonUpAR")
		var_20_36:AnimateSequence("ButtonUpAR")
		var_20_38:AnimateSequence("ButtonUpAR")
	end

	var_20_0._sequences.ButtonUpAR = var_20_119

	local var_20_120
	local var_20_121 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_6:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_121)

	local var_20_122 = {
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

	var_20_8:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_122)

	local var_20_123 = {
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

	var_20_18:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_123)

	local var_20_124 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_124)

	local var_20_125 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_28:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_125)

	local var_20_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_126)

	local var_20_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
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

	var_20_36:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_127)

	local var_20_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
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

	var_20_38:RegisterAnimationSequence("ButtonUpDisabledAR", var_20_128)

	local function var_20_129()
		var_20_6:AnimateSequence("ButtonUpDisabledAR")
		var_20_8:AnimateSequence("ButtonUpDisabledAR")
		var_20_18:AnimateSequence("ButtonUpDisabledAR")
		var_20_26:AnimateSequence("ButtonUpDisabledAR")
		var_20_28:AnimateSequence("ButtonUpDisabledAR")
		var_20_34:AnimateSequence("ButtonUpDisabledAR")
		var_20_36:AnimateSequence("ButtonUpDisabledAR")
		var_20_38:AnimateSequence("ButtonUpDisabledAR")
	end

	var_20_0._sequences.ButtonUpDisabledAR = var_20_129

	local var_20_130
	local var_20_131 = {
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

	var_20_6:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_131)

	local var_20_132 = {
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

	var_20_8:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_132)

	local var_20_133 = {
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

	var_20_18:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_133)

	local var_20_134 = {
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

	var_20_26:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_134)

	local var_20_135 = {
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

	var_20_28:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_135)

	local var_20_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		}
	}

	var_20_34:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_136)

	local var_20_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_20_36:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_137)

	local var_20_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_20_38:RegisterAnimationSequence("ButtonOverDisabledAR", var_20_138)

	local function var_20_139()
		var_20_6:AnimateSequence("ButtonOverDisabledAR")
		var_20_8:AnimateSequence("ButtonOverDisabledAR")
		var_20_18:AnimateSequence("ButtonOverDisabledAR")
		var_20_26:AnimateSequence("ButtonOverDisabledAR")
		var_20_28:AnimateSequence("ButtonOverDisabledAR")
		var_20_34:AnimateSequence("ButtonOverDisabledAR")
		var_20_36:AnimateSequence("ButtonOverDisabledAR")
		var_20_38:AnimateSequence("ButtonOverDisabledAR")
	end

	var_20_0._sequences.ButtonOverDisabledAR = var_20_139

	var_20_0:addEventHandler("button_disable", function(arg_36_0, arg_36_1)
		if not arg_36_1.controller then
			local var_36_0 = var_20_1
		end

		ACTIONS.AnimateSequence(var_20_0, "ButtonUpDisabled")

		if CONDITIONS.IsArabic(var_20_0) then
			ACTIONS.AnimateSequence(var_20_0, "ButtonUpTitleAR")
		end

		if not CONDITIONS.IsArabic(var_20_0) then
			ACTIONS.AnimateSequence(var_20_0, "ButtonUpTitle")
		end
	end)
	var_0_8(var_20_0, var_20_1, arg_20_1)
	ACTIONS.AnimateSequenceByElement(var_20_0, {
		elementPath = "self.Background",
		sequenceName = "WZPromoted",
		elementName = "Background"
	})

	return var_20_0
end

MenuBuilder.registerType("BRPromotedButton", BRPromotedButton)
LockTable(_M)
