module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.PromptContainer
end

local function var_0_1(arg_2_0)
	for iter_2_0 = 1, #arg_2_0._tokens do
		arg_2_0._tokens[iter_2_0].isUsed = false

		arg_2_0._tokens[iter_2_0].token:SetUnavailable()
	end
end

local function var_0_2(arg_3_0)
	for iter_3_0 = 1, #arg_3_0._tokens do
		if arg_3_0._tokens[iter_3_0].isUsed == false then
			arg_3_0._tokens[iter_3_0].isUsed = true

			return arg_3_0._tokens[iter_3_0].token
		end
	end

	return nil
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0, var_4_1, var_4_2, var_4_3, var_4_4 = OnlineProgression.CEHEBBGFGG(arg_4_1, PROGRESSION.GetTokenTitle())
	local var_4_5, var_4_6, var_4_7, var_4_8, var_4_9 = OnlineProgression.CEHEBBGFGG(arg_4_1, PROGRESSION.GetSecondaryTokenTitle())
	local var_4_10, var_4_11, var_4_12, var_4_13, var_4_14 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	local var_4_15 = Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())
	local var_4_16 = 0

	ACTIONS.AnimateSequence(arg_4_0, "Equipped")
	var_0_1(arg_4_0)

	if arg_4_3[LOOT.doubleXpTypes.XP] or LOOT.IsPSDoubleXPActive() or arg_4_2[LOOT.doubleXpTypes.XP] then
		local var_4_17 = var_0_2(arg_4_0)

		if var_4_17 then
			local var_4_18 = var_4_10

			if CONDITIONS.IsPS4() and var_4_14 and var_4_10 < var_4_14 then
				var_4_18 = var_4_14
			end

			local var_4_19 = var_4_0

			if var_4_19 == nil then
				var_4_19 = var_4_5
			elseif var_4_5 ~= nil and var_4_19 < var_4_5 then
				var_4_19 = var_4_5
			end

			var_4_17.Image:setImage(RegisterMaterial("icon_double_xp_mini"))
			var_4_17:SetAlpha(1)

			if arg_4_3[LOOT.doubleXpTypes.XP] then
				var_4_17:SetupTimer(var_4_18, var_4_19, var_4_15)
			elseif arg_4_2[LOOT.doubleXpTypes.XP] then
				var_4_17:SetAvailable()
			end

			var_4_16 = var_4_16 + 1

			if CONDITIONS.IsWZWipDvarEnabled() then
				var_4_17.Category:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CAREER")))
			end
		end
	end

	if arg_4_3[LOOT.doubleXpTypes.WEAPON] or arg_4_2[LOOT.doubleXpTypes.WEAPON] then
		local var_4_20 = var_0_2(arg_4_0)

		if var_4_20 then
			local var_4_21 = var_4_1

			if var_4_21 == nil then
				var_4_21 = var_4_6
			elseif var_4_6 ~= nil and var_4_21 < var_4_6 then
				var_4_21 = var_4_6
			end

			var_4_20.Image:setImage(RegisterMaterial("icon_double_weapon_xp_mini"))

			if arg_4_3[LOOT.doubleXpTypes.WEAPON] then
				var_4_20:SetupTimer(var_4_11, var_4_21, var_4_15)
			elseif arg_4_2[LOOT.doubleXpTypes.WEAPON] then
				var_4_20:SetAvailable()
			end

			var_4_20:SetAlpha(1)

			var_4_16 = var_4_16 + 1

			if CONDITIONS.IsMagmaGameMode() then
				var_4_20.Category:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPON")))
			end
		end
	end

	if arg_4_3[LOOT.doubleXpTypes.BATTLE_PASS] or arg_4_2[LOOT.doubleXpTypes.BATTLE_PASS] then
		local var_4_22 = var_0_2(arg_4_0)

		if var_4_22 then
			local var_4_23 = var_4_3

			var_4_22.Image:setImage(RegisterMaterial("icon_double_battle_xp_mini"))

			if arg_4_3[LOOT.doubleXpTypes.BATTLE_PASS] then
				var_4_22:SetupTimer(var_4_13, var_4_23, var_4_15)
			elseif arg_4_2[LOOT.doubleXpTypes.BATTLE_PASS] then
				var_4_22:SetAvailable()
			end

			var_4_22:SetAlpha(1)

			var_4_16 = var_4_16 + 1

			if CONDITIONS.IsWZWipDvarEnabled() then
				if BATTLEPASS.IsOwned(arg_4_1) then
					ACTIONS.AnimateSequence(var_4_22, "HighlightCategory")
				end

				var_4_22.Category:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS")))
			end
		end
	end

	if CONDITIONS.AreKeysEnabled() and arg_4_3[LOOT.doubleXpTypes.KEY] or arg_4_2[LOOT.doubleXpTypes.KEY] then
		local var_4_24 = var_0_2(arg_4_0)

		if var_4_24 then
			var_4_24.Image:setImage(RegisterMaterial("icon_double_xp_mini"))

			if arg_4_3[LOOT.doubleXpTypes.KEY] then
				var_4_24:SetupTimer(var_4_12, var_4_2, var_4_15)
			elseif arg_4_2[LOOT.doubleXpTypes.KEY] then
				var_4_24:SetAvailable()
			end

			var_4_24:SetAlpha(1)

			var_4_16 = var_4_16 + 1

			if CONDITIONS.IsWZWipDvarEnabled() then
				var_4_24.Category:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/KEYS_CAPS")))
			end
		end
	end

	if arg_4_3[LOOT.doubleXpTypes.OPERATOR] or arg_4_2[LOOT.doubleXpTypes.OPERATOR] then
		local var_4_25 = var_0_2(arg_4_0)

		if var_4_25 then
			var_4_25.Image:setImage(RegisterMaterial("icon_double_operator_xp_mini"))

			if arg_4_3[LOOT.doubleXpTypes.OPERATOR] then
				var_4_25:SetupTimer(var_4_9, var_4_4, var_4_15)
			elseif arg_4_2[LOOT.doubleXpTypes.OPERATOR] then
				var_4_25:SetAvailable()
			end

			var_4_25:SetAlpha(1)

			var_4_16 = var_4_16 + 1

			if CONDITIONS.IsWZWipDvarEnabled() then
				var_4_25.Category:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR")))
			end
		end
	end

	arg_4_0._numTokensActive = var_4_16
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0._cachedTokenIds[arg_5_2] ~= arg_5_2 then
		arg_5_0._cachedTokenIds[arg_5_2] = arg_5_2

		arg_5_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_5_1, arg_5_2, true)
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0, var_6_1, var_6_2, var_6_3, var_6_4 = OnlineProgression.CEHEBBGFGG(arg_6_1, PROGRESSION.GetTokenTitle())
	local var_6_5, var_6_6, var_6_7, var_6_8, var_6_9 = OnlineProgression.CEHEBBGFGG(arg_6_1, PROGRESSION.GetSecondaryTokenTitle())
	local var_6_10, var_6_11, var_6_12, var_6_13, var_6_14 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	local var_6_15 = Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())
	local var_6_16 = false
	local var_6_17 = false
	local var_6_18 = false
	local var_6_19 = false
	local var_6_20 = false

	arg_6_0._cachedTokenIds = {}

	local var_6_21 = LOOT.GetDoubleXPTokens()

	for iter_6_0, iter_6_1 in pairs(var_6_21) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_1) > 0 then
			var_6_16 = true

			break
		end

		var_0_4(arg_6_0, arg_6_1, iter_6_1)
	end

	local var_6_22 = LOOT.GetDoubleWeaponXPTokens()

	for iter_6_2, iter_6_3 in pairs(var_6_22) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_3) > 0 then
			var_6_17 = true

			break
		end

		var_0_4(arg_6_0, arg_6_1, iter_6_3)
	end

	local var_6_23 = LOOT.GetDoubleBattlePassTokens()

	for iter_6_4, iter_6_5 in pairs(var_6_23) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_5) > 0 then
			var_6_19 = true

			break
		end

		var_0_4(arg_6_0, arg_6_1, iter_6_5)
	end

	if CONDITIONS.AreKeysEnabled() then
		local var_6_24 = LOOT.GetDoubleKeyTokens()

		for iter_6_6, iter_6_7 in pairs(var_6_24) do
			if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_7) > 0 then
				var_6_18 = true

				break
			end

			var_0_4(arg_6_0, arg_6_1, iter_6_7)
		end
	end

	local var_6_25 = LOOT.GetDoubleOperatorXPTokens()

	for iter_6_8, iter_6_9 in pairs(var_6_25) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_9) > 0 then
			var_6_20 = true

			break
		end

		var_0_4(arg_6_0, arg_6_1, iter_6_9)
	end

	local var_6_26 = var_6_0 ~= nil and var_6_0 - var_6_15 > 0 or var_6_5 ~= nil and var_6_5 - var_6_15 > 0 or var_6_10 ~= nil and var_6_10 - var_6_15 > 0 or CONDITIONS.IsPS4() and var_6_14 ~= nil and var_6_14 - var_6_15 > 0
	local var_6_27 = var_6_1 ~= nil and var_6_1 - var_6_15 > 0 or var_6_6 ~= nil and var_6_6 - var_6_15 > 0 or var_6_11 ~= nil and var_6_11 - var_6_15 > 0
	local var_6_28 = var_6_2 ~= nil and var_6_2 - var_6_15 > 0 or var_6_12 ~= nil and var_6_12 - var_6_15 > 0
	local var_6_29 = var_6_3 ~= nil and var_6_3 - var_6_15 > 0 or var_6_13 ~= nil and var_6_13 - var_6_15 > 0
	local var_6_30 = var_6_4 ~= nil and var_6_4 - var_6_15 > 0 or var_6_9 ~= nil and var_6_9 - var_6_15 > 0

	arg_6_0._playerHasToken = var_6_16 or var_6_17 or CONDITIONS.AreKeysEnabled() and var_6_18 or var_6_19 or var_6_20

	local var_6_31 = var_6_26 or var_6_27 or CONDITIONS.AreKeysEnabled() and var_6_28 or var_6_29 or var_6_30
	local var_6_32 = var_6_16 or var_6_17 or CONDITIONS.AreKeysEnabled() and var_6_18 or var_6_19 or var_6_20
	local var_6_33 = LOOT.IsDoubleXPActive() or LOOT.IsPSDoubleXPActive()
	local var_6_34 = LOOT.IsDoubleWeaponXPActive()
	local var_6_35 = CONDITIONS.AreKeysEnabled() and LOOT.IsDoubleKeyActive()
	local var_6_36 = LOOT.IsDoubleBattlePassXPActive()
	local var_6_37 = false
	local var_6_38 = var_6_33 or var_6_34 or var_6_35 or var_6_36 or var_6_37
	local var_6_39 = {
		[LOOT.doubleXpTypes.XP] = var_6_16,
		[LOOT.doubleXpTypes.WEAPON] = var_6_17,
		[LOOT.doubleXpTypes.BATTLE_PASS] = var_6_19,
		[LOOT.doubleXpTypes.KEY] = var_6_18,
		[LOOT.doubleXpTypes.OPERATOR] = var_6_20
	}

	if not arg_6_0._isInLobby and var_6_31 or var_6_32 then
		local var_6_40 = {
			[LOOT.doubleXpTypes.XP] = var_6_26,
			[LOOT.doubleXpTypes.WEAPON] = var_6_27,
			[LOOT.doubleXpTypes.BATTLE_PASS] = var_6_29,
			[LOOT.doubleXpTypes.KEY] = var_6_28,
			[LOOT.doubleXpTypes.OPERATOR] = var_6_30
		}

		var_0_3(arg_6_0, arg_6_1, var_6_39, var_6_40)
	elseif var_6_38 or var_6_31 then
		local var_6_41 = {
			[LOOT.doubleXpTypes.XP] = var_6_33 or var_6_26,
			[LOOT.doubleXpTypes.WEAPON] = var_6_34 or var_6_27,
			[LOOT.doubleXpTypes.BATTLE_PASS] = var_6_36 or var_6_29,
			[LOOT.doubleXpTypes.KEY] = var_6_35 or var_6_28,
			[LOOT.doubleXpTypes.OPERATOR] = var_6_37
		}

		var_0_3(arg_6_0, arg_6_1, var_6_39, var_6_41)
	else
		var_0_1(arg_6_0)
	end

	if arg_6_0._playerHasToken and arg_6_0._canUseInputActivation then
		ACTIONS.AnimateSequence(arg_6_0, "ShowPrompt")
		arg_6_0.PromptContainer:SetMouseFocusBlocker(false)
	else
		ACTIONS.AnimateSequence(arg_6_0, "HidePrompt")
		arg_6_0.PromptContainer:SetMouseFocusBlocker(true)
	end

	arg_6_0:dispatchEventToParent({
		name = "update_double_xp_token"
	})
end

local function var_0_6(arg_7_0)
	return arg_7_0._playerHasToken and arg_7_0._canUseInputActivation
end

local function var_0_7(arg_8_0)
	ACTIONS.AnimateSequence(arg_8_0, "InGame")
	ACTIONS.AnimateSequence(arg_8_0.Token1, "SmallIcon")
	ACTIONS.AnimateSequence(arg_8_0.Token2, "SmallIcon")
	ACTIONS.AnimateSequence(arg_8_0.Token3, "SmallIcon")
	ACTIONS.AnimateSequence(arg_8_0.Token4, "SmallIcon")
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_0.Token1)
	assert(arg_9_0.Token2)
	assert(arg_9_0.Token3)
	assert(arg_9_0.Token4)

	arg_9_0.GetEnablePrompt = var_0_6
	arg_9_0.GetPromptContainer = var_0_0
	arg_9_0.SetInGameLayout = var_0_7
	arg_9_0._isInLobby = Engine.DAFGFCFHJI()
	arg_9_0._numTokensActive = 0
	arg_9_0._isAvailable = false
	arg_9_0._tokens = {
		{
			isUsed = false,
			token = arg_9_0.Token1
		},
		{
			isUsed = false,
			token = arg_9_0.Token2
		},
		{
			isUsed = false,
			token = arg_9_0.Token3
		},
		{
			isUsed = false,
			token = arg_9_0.Token4
		}
	}
	arg_9_0._cachedTokenIds = {}
	arg_9_0._canUseInputActivation = CONDITIONS.InFrontend() or CONDITIONS.IsMagmaGameMode()

	var_0_5(arg_9_0, arg_9_1)

	local var_9_0 = LUI.UITimer.new({
		interval = 1000,
		event = "update_tokens"
	})

	var_9_0.id = "doubleXPTimer"

	arg_9_0:addElement(var_9_0)
	arg_9_0:registerEventHandler("update_tokens", function(arg_10_0, arg_10_1)
		var_0_5(arg_9_0, arg_9_1)
	end)

	if arg_9_0._canUseInputActivation then
		arg_9_0.bindButton = LUI.UIBindButton.new()
		arg_9_0.bindButton.id = "selfBindButton"

		arg_9_0:addElement(arg_9_0.bindButton)
		arg_9_0.bindButton:addEventHandler("button_left_stick", function(arg_11_0, arg_11_1)
			if arg_11_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end

			if arg_9_0._playerHasToken then
				local var_11_0 = arg_9_0:GetCurrentMenu()
				local var_11_1 = MenuBuilder.BuildRegisteredType("TokenMenu", {
					controllerIndex = arg_11_1.controller,
					sourceMenu = var_11_0
				})

				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_11_1.controller, false, {
					flyInLeftNarrow = true,
					disableQuickAccessShortcuts = false,
					widget = var_11_1
				})

				for iter_11_0, iter_11_1 in pairs(arg_9_0._cachedTokenIds) do
					arg_9_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_9_1, iter_11_1, true)
				end
			end
		end)
	end

	THEMES.ApplyRandomMaskRotation(arg_9_0, {
		elementToMask = arg_9_0.WZWipBacker
	})

	if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		ACTIONS.AnimateSequence(arg_9_0.EarnRateBuff, "ShowXPBoostOnly")
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_9_0, "WZSetup")
	end

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_9_0, "JP")
	end

	if IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_9_0, "RU")
	end
end

function WideDoubleXPNotifications(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 432 * _1080p, 0, 180 * _1080p)

	var_12_0.id = "WideDoubleXPNotifications"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "WZWipBacker"

	var_12_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_12_4:SetAlpha(0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.WZWipBacker = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "Backer"

	var_12_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_6:SetAlpha(0.3, 0)
	var_12_6:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_12_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 32, _1080p * 162)
	var_12_0:addElement(var_12_6)

	var_12_0.Backer = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "Mask"

	var_12_8:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
	var_12_0:addElement(var_12_8)

	var_12_0.Mask = var_12_8

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "Token4"

	var_12_10.Image:setImage(RegisterMaterial("icon_xp_token_unavailable"), 0)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 324, _1080p * 432, _1080p * 53, _1080p * 145)
	var_12_0:addElement(var_12_10)

	var_12_0.Token4 = var_12_10

	local var_12_11
	local var_12_12 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_12_1
	})

	var_12_12.id = "Token3"

	var_12_12.Image:setImage(RegisterMaterial("icon_xp_token_unavailable"), 0)
	var_12_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 216, _1080p * 324, _1080p * 53, _1080p * 145)
	var_12_0:addElement(var_12_12)

	var_12_0.Token3 = var_12_12

	local var_12_13
	local var_12_14 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_12_1
	})

	var_12_14.id = "Token2"

	var_12_14.Image:setImage(RegisterMaterial("icon_xp_token_unavailable"), 0)
	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 108, _1080p * 216, _1080p * 53, _1080p * 145)
	var_12_0:addElement(var_12_14)

	var_12_0.Token2 = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "Token1"

	var_12_16.Image:setImage(RegisterMaterial("icon_xp_token_unavailable"), 0)
	var_12_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 108, _1080p * 53, _1080p * 145)
	var_12_0:addElement(var_12_16)

	var_12_0.Token1 = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIText.new()

	var_12_18.id = "AvailableTokens"

	var_12_18:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_18:SetAlpha(0, 0)
	var_12_18:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_TOKENS_AVAILABLE"), 0)
	var_12_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_18:SetAlignment(LUI.Alignment.Right)
	var_12_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -287, _1080p * -9, _1080p * 51, _1080p * 71)
	var_12_0:addElement(var_12_18)

	var_12_0.AvailableTokens = var_12_18

	local var_12_19
	local var_12_20 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_12_1
	})

	var_12_20.id = "PromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_12_20.Label:setText("", 0)
	end

	var_12_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -216, _1080p * -36, _1080p * 8, _1080p * 32)
	var_12_0:addElement(var_12_20)

	var_12_0.PromptContainer = var_12_20

	local var_12_21

	if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		var_12_21 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
			controllerIndex = var_12_1
		})
		var_12_21.id = "EarnRateBuff"

		var_12_21.EarnRate:SetAlignment(LUI.Alignment.Center)
		var_12_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 334, _1080p * 130, _1080p * 160)
		var_12_0:addElement(var_12_21)

		var_12_0.EarnRateBuff = var_12_21
	end

	local var_12_22
	local var_12_23 = LUI.UIStyledText.new()

	var_12_23.id = "Header"

	var_12_23:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/DOUBLE_XP_TOKEN")), 0)
	var_12_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_23:SetAlignment(LUI.Alignment.Left)
	var_12_23:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -157, _1080p * 8, _1080p * 32)
	var_12_0:addElement(var_12_23)

	var_12_0.Header = var_12_23

	local var_12_24
	local var_12_25 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_12_1
	})

	var_12_25.id = "NewItemSmallIcon"

	var_12_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -20, _1080p * -12, _1080p * 15, _1080p * 23)
	var_12_0:addElement(var_12_25)

	var_12_0.NewItemSmallIcon = var_12_25

	local var_12_26

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_12_26 = LUI.UIImage.new()
		var_12_26.id = "WZWipTopDivider"

		var_12_26:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_12_26:SetAlpha(0.65, 0)
		var_12_26:setImage(RegisterMaterial("line_dot_ch2"), 0)
		var_12_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 432, _1080p * 37, _1080p * 40)
		var_12_0:addElement(var_12_26)

		var_12_0.WZWipTopDivider = var_12_26
	end

	local function var_12_27()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_27

	local var_12_28
	local var_12_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ShowPrompt", var_12_29)

	local function var_12_30()
		var_12_20:AnimateSequence("ShowPrompt")
	end

	var_12_0._sequences.ShowPrompt = var_12_30

	local var_12_31
	local var_12_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("HideAll", var_12_32)

	local var_12_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("HideAll", var_12_33)

	local var_12_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("HideAll", var_12_34)

	local var_12_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("HideAll", var_12_35)

	local var_12_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("HideAll", var_12_36)

	local var_12_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("HideAll", var_12_37)

	local var_12_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("HideAll", var_12_38)

	local var_12_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("HideAll", var_12_39)

	if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_12_40 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 67
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 99
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_21:RegisterAnimationSequence("HideAll", var_12_40)
	end

	local var_12_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("HideAll", var_12_41)

	local var_12_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("HideAll", var_12_42)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_12_43 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_26:RegisterAnimationSequence("HideAll", var_12_43)
	end

	local function var_12_44()
		var_12_4:AnimateSequence("HideAll")
		var_12_6:AnimateSequence("HideAll")
		var_12_10:AnimateSequence("HideAll")
		var_12_12:AnimateSequence("HideAll")
		var_12_14:AnimateSequence("HideAll")
		var_12_16:AnimateSequence("HideAll")
		var_12_18:AnimateSequence("HideAll")
		var_12_20:AnimateSequence("HideAll")

		if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_12_21:AnimateSequence("HideAll")
		end

		var_12_23:AnimateSequence("HideAll")
		var_12_25:AnimateSequence("HideAll")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_12_26:AnimateSequence("HideAll")
		end
	end

	var_12_0._sequences.HideAll = var_12_44

	local var_12_45
	local var_12_46 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Available", var_12_46)

	local var_12_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Available", var_12_47)

	local var_12_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("Available", var_12_48)

	local var_12_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("Available", var_12_49)

	local var_12_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("Available", var_12_50)

	local var_12_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("Available", var_12_51)

	local var_12_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("Available", var_12_52)

	local function var_12_53()
		var_12_4:AnimateSequence("Available")
		var_12_6:AnimateSequence("Available")
		var_12_10:AnimateSequence("Available")
		var_12_12:AnimateSequence("Available")
		var_12_14:AnimateSequence("Available")
		var_12_16:AnimateSequence("Available")
		var_12_23:AnimateSequence("Available")
	end

	var_12_0._sequences.Available = var_12_53

	local var_12_54
	local var_12_55 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Equipped", var_12_55)

	local var_12_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Equipped", var_12_56)

	local var_12_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("Equipped", var_12_57)

	local var_12_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("Equipped", var_12_58)

	local function var_12_59()
		var_12_4:AnimateSequence("Equipped")
		var_12_6:AnimateSequence("Equipped")
		var_12_18:AnimateSequence("Equipped")
		var_12_23:AnimateSequence("Equipped")
	end

	var_12_0._sequences.Equipped = var_12_59

	local var_12_60
	local var_12_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_12_6:RegisterAnimationSequence("HidePrompt", var_12_61)

	local var_12_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("HidePrompt", var_12_62)

	local function var_12_63()
		var_12_6:AnimateSequence("HidePrompt")
		var_12_20:AnimateSequence("HidePrompt")
	end

	var_12_0._sequences.HidePrompt = var_12_63

	local var_12_64
	local var_12_65 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZSetup", var_12_65)

	local var_12_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZSetup", var_12_66)

	local var_12_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_10:RegisterAnimationSequence("WZSetup", var_12_67)

	local var_12_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_12:RegisterAnimationSequence("WZSetup", var_12_68)

	local var_12_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_14:RegisterAnimationSequence("WZSetup", var_12_69)

	local var_12_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_16:RegisterAnimationSequence("WZSetup", var_12_70)

	local var_12_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_12_18:RegisterAnimationSequence("WZSetup", var_12_71)

	if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_12_72 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 150
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 180
			}
		}

		var_12_21:RegisterAnimationSequence("WZSetup", var_12_72)
	end

	local var_12_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_12_23:RegisterAnimationSequence("WZSetup", var_12_73)

	local function var_12_74()
		var_12_4:AnimateSequence("WZSetup")
		var_12_6:AnimateSequence("WZSetup")
		var_12_10:AnimateSequence("WZSetup")
		var_12_12:AnimateSequence("WZSetup")
		var_12_14:AnimateSequence("WZSetup")
		var_12_16:AnimateSequence("WZSetup")
		var_12_18:AnimateSequence("WZSetup")

		if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_12_21:AnimateSequence("WZSetup")
		end

		var_12_23:AnimateSequence("WZSetup")
	end

	var_12_0._sequences.WZSetup = var_12_74

	local var_12_75
	local var_12_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		}
	}

	var_12_23:RegisterAnimationSequence("JP", var_12_76)

	local function var_12_77()
		var_12_23:AnimateSequence("JP")
	end

	var_12_0._sequences.JP = var_12_77

	local var_12_78
	local var_12_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -162
		}
	}

	var_12_23:RegisterAnimationSequence("RU", var_12_79)

	local function var_12_80()
		var_12_23:AnimateSequence("RU")
	end

	var_12_0._sequences.RU = var_12_80

	local var_12_81
	local var_12_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -92
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_10:RegisterAnimationSequence("InGame", var_12_82)

	local var_12_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -92
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_12:RegisterAnimationSequence("InGame", var_12_83)

	local var_12_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -92
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_14:RegisterAnimationSequence("InGame", var_12_84)

	local var_12_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -92
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_16:RegisterAnimationSequence("InGame", var_12_85)

	if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_12_86 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_21:RegisterAnimationSequence("InGame", var_12_86)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_12_87 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 35
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 38
			}
		}

		var_12_26:RegisterAnimationSequence("InGame", var_12_87)
	end

	local function var_12_88()
		var_12_10:AnimateSequence("InGame")
		var_12_12:AnimateSequence("InGame")
		var_12_14:AnimateSequence("InGame")
		var_12_16:AnimateSequence("InGame")

		if not CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_12_21:AnimateSequence("InGame")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_12_26:AnimateSequence("InGame")
		end
	end

	var_12_0._sequences.InGame = var_12_88

	var_0_8(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("WideDoubleXPNotifications", WideDoubleXPNotifications)
LockTable(_M)
