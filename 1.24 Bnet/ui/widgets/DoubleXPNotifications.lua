module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.PromptContainer
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.Token1)

	local var_2_0 = 8 * _1080p
	local var_2_1, var_2_2, var_2_3, var_2_4 = arg_2_0.PromptContainer:getLocalRect()
	local var_2_5 = var_2_3 - var_2_1
	local var_2_6 = 0

	if arg_2_1 > 0 then
		var_2_6 = LAYOUT.GetElementWidth(arg_2_0.Token1) * arg_2_1
	else
		var_2_6 = LAYOUT.GetTextWidth(arg_2_0.AvailableTokens)
	end

	local var_2_7 = ((var_2_6 < var_2_5 and var_2_5 or var_2_6) + var_2_0) * -1

	arg_2_0.Backer:SetLeft(var_2_7, 150)
	arg_2_0.Line:SetLeft(var_2_7, 150)
end

local function var_0_2(arg_3_0)
	for iter_3_0 = 1, #arg_3_0._tokens do
		arg_3_0._tokens[iter_3_0].isUsed = false

		arg_3_0._tokens[iter_3_0].token:SetAlpha(0)
	end
end

local function var_0_3(arg_4_0)
	for iter_4_0 = 1, #arg_4_0._tokens do
		if arg_4_0._tokens[iter_4_0].isUsed == false then
			arg_4_0._tokens[iter_4_0].isUsed = true

			return arg_4_0._tokens[iter_4_0].token
		end
	end

	return nil
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	local var_5_0, var_5_1, var_5_2, var_5_3 = OnlineProgression.CEHEBBGFGG(arg_5_1)
	local var_5_4, var_5_5, var_5_6, var_5_7 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	local var_5_8 = Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())
	local var_5_9 = 0

	ACTIONS.AnimateSequence(arg_5_0, "Equipped")
	var_0_2(arg_5_0)

	if arg_5_2 then
		local var_5_10 = var_0_3(arg_5_0)

		if var_5_10 then
			var_5_10.Image:setImage(RegisterMaterial("icon_double_xp"))
			var_5_10:SetupTimer(var_5_4, var_5_0, var_5_8)
			var_5_10:SetAlpha(1)

			var_5_9 = var_5_9 + 1
		end
	end

	if arg_5_3 then
		local var_5_11 = var_0_3(arg_5_0)

		if var_5_11 then
			var_5_11.Image:setImage(RegisterMaterial("icon_double_weapon_xp"))
			var_5_11:SetupTimer(var_5_5, var_5_1, var_5_8)
			var_5_11:SetAlpha(1)

			var_5_9 = var_5_9 + 1
		end
	end

	if arg_5_5 then
		local var_5_12 = var_0_3(arg_5_0)

		if var_5_12 then
			var_5_12.Image:setImage(RegisterMaterial("icon_double_battle_xp"))
			var_5_12:SetupTimer(var_5_7, var_5_3, var_5_8)
			var_5_12:SetAlpha(1)

			var_5_9 = var_5_9 + 1
		end
	end

	if CONDITIONS.AreKeysEnabled() and arg_5_4 then
		local var_5_13 = var_0_3(arg_5_0)

		if var_5_13 then
			var_5_13.Image:setImage(RegisterMaterial("icon_double_xp"))
			var_5_13:SetupTimer(var_5_6, var_5_2, var_5_8)
			var_5_13:SetAlpha(1)

			var_5_9 = var_5_9 + 1
		end
	end

	var_0_1(arg_5_0, var_5_9)

	arg_5_0._numTokensActive = var_5_9
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0, var_6_1, var_6_2, var_6_3 = OnlineProgression.CEHEBBGFGG(arg_6_1)
	local var_6_4, var_6_5, var_6_6, var_6_7 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	local var_6_8 = Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())
	local var_6_9 = false
	local var_6_10 = false
	local var_6_11 = false
	local var_6_12 = false

	for iter_6_0, iter_6_1 in pairs(LOOT.DOUBLE_XP_TOKENS) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_1) > 0 then
			var_6_9 = true

			break
		end
	end

	for iter_6_2, iter_6_3 in pairs(LOOT.DOUBLE_WEAPON_XP_TOKENS) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_3) > 0 then
			var_6_10 = true

			break
		end
	end

	for iter_6_4, iter_6_5 in pairs(LOOT.DOUBLE_BATTLE_PASS_TOKENS) do
		if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_5) > 0 then
			var_6_12 = true

			break
		end
	end

	if CONDITIONS.AreKeysEnabled() then
		for iter_6_6, iter_6_7 in pairs(LOOT.DOUBLE_KEY_TOKENS) do
			if OnlineProgression.BIDJFJIHC(arg_6_1, iter_6_7) > 0 then
				var_6_11 = true

				break
			end
		end
	end

	local var_6_13 = var_6_0 ~= nil and var_6_0 - var_6_8 > 0 or var_6_4 ~= nil and var_6_4 - var_6_8 > 0
	local var_6_14 = var_6_1 ~= nil and var_6_1 - var_6_8 > 0 or var_6_5 ~= nil and var_6_5 - var_6_8 > 0
	local var_6_15 = var_6_2 ~= nil and var_6_2 - var_6_8 > 0 or var_6_6 ~= nil and var_6_6 - var_6_8 > 0
	local var_6_16 = var_6_3 ~= nil and var_6_3 - var_6_8 > 0 or var_6_7 ~= nil and var_6_7 - var_6_8 > 0

	arg_6_0._playerHasToken = var_6_9 or var_6_10 or CONDITIONS.AreKeysEnabled() and var_6_11 or var_6_12

	local var_6_17 = var_6_13 or var_6_14 or CONDITIONS.AreKeysEnabled() and var_6_15 or var_6_16
	local var_6_18 = LOOT.IsDoubleXPActive()
	local var_6_19 = LOOT.IsDoubleWeaponXPActive()
	local var_6_20 = CONDITIONS.AreKeysEnabled() and LOOT.IsDoubleKeyActive()
	local var_6_21 = LOOT.IsDoubleBattlePassXPActive()
	local var_6_22 = var_6_18 or var_6_19 or var_6_20 or var_6_21

	if not arg_6_0._isInLobby and var_6_17 then
		var_0_4(arg_6_0, arg_6_1, var_6_13, var_6_14, var_6_15, var_6_16)
	elseif var_6_22 or var_6_17 then
		var_0_4(arg_6_0, arg_6_1, var_6_18 or var_6_13, var_6_19 or var_6_14, var_6_20 or var_6_15, var_6_21 or var_6_16)
	end

	if not var_6_17 and (not arg_6_0._isInLobby or not var_6_22) then
		if arg_6_0._playerHasToken then
			if CONDITIONS.InFrontend() then
				ACTIONS.AnimateSequence(arg_6_0, "Available")
				var_0_1(arg_6_0, arg_6_0._numTokensActive)
			else
				ACTIONS.AnimateSequence(arg_6_0, "HideAll")
			end
		else
			ACTIONS.AnimateSequence(arg_6_0, "HideAll")
		end
	end

	if arg_6_0._playerHasToken and CONDITIONS.InFrontend() then
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
	return arg_7_0._playerHasToken and CONDITIONS.InFrontend()
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.Token1)
	assert(arg_8_0.Token2)
	assert(arg_8_0.Token3)

	arg_8_0.GetEnablePrompt = var_0_6
	arg_8_0.GetPromptContainer = var_0_0
	arg_8_0._isInLobby = Engine.DAFGFCFHJI()
	arg_8_0._numTokensActive = 0
	arg_8_0._isAvailable = false
	arg_8_0._tokens = {
		{
			isUsed = false,
			token = arg_8_0.Token1
		},
		{
			isUsed = false,
			token = arg_8_0.Token2
		},
		{
			isUsed = false,
			token = arg_8_0.Token3
		}
	}

	var_0_5(arg_8_0, arg_8_1)

	local var_8_0 = LUI.UITimer.new({
		interval = 1000,
		event = "update_tokens"
	})

	var_8_0.id = "doubleXPTimer"

	arg_8_0:addElement(var_8_0)
	arg_8_0:registerEventHandler("update_tokens", function(arg_9_0, arg_9_1)
		var_0_5(arg_8_0, arg_8_1)
	end)

	if CONDITIONS.InFrontend() then
		arg_8_0.bindButton = LUI.UIBindButton.new()
		arg_8_0.bindButton.id = "selfBindButton"

		arg_8_0:addElement(arg_8_0.bindButton)
		arg_8_0.bindButton:addEventHandler("button_left_stick", function(arg_10_0, arg_10_1)
			if arg_10_1.qualifier then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end

			if arg_8_0._playerHasToken then
				local var_10_0 = arg_8_0:GetCurrentMenu()
				local var_10_1 = MenuBuilder.BuildRegisteredType("TokenMenu", {
					controllerIndex = arg_10_1.controller,
					sourceMenu = var_10_0
				})

				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_10_1.controller, false, {
					flyInLeftNarrow = true,
					disableQuickAccessShortcuts = false,
					widget = var_10_1
				})
			end
		end)
	end
end

function DoubleXPNotifications(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 384 * _1080p, 0, 130 * _1080p)

	var_11_0.id = "DoubleXPNotifications"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Backer"

	var_11_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_4:SetAlpha(0.3, 0)
	var_11_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_11_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -180, 0, 0, _1080p * 130)
	var_11_0:addElement(var_11_4)

	var_11_0.Backer = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "Token3"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -384, _1080p * -256, _1080p * 2, _1080p * 93)
	var_11_0:addElement(var_11_6)

	var_11_0.Token3 = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "Token2"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -256, _1080p * -128, _1080p * 2, _1080p * 93)
	var_11_0:addElement(var_11_8)

	var_11_0.Token2 = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "Token1"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, 0, _1080p * 2, _1080p * 93)
	var_11_0:addElement(var_11_10)

	var_11_0.Token1 = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIText.new()

	var_11_12.id = "AvailableTokens"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_12:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_TOKENS_AVAILABLE"), 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_12:SetAlignment(LUI.Alignment.Right)
	var_11_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -287, _1080p * -9, _1080p * 38, _1080p * 58)
	var_11_0:addElement(var_11_12)

	var_11_0.AvailableTokens = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "Line"

	var_11_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_14:SetAlpha(0.4, 0)
	var_11_14:SetAnchorsAndPosition(1, 0, 0, 1, 0, 0, _1080p * 93, _1080p * 94)
	var_11_0:addElement(var_11_14)

	var_11_0.Line = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "PromptContainer"

	if CONDITIONS.AlwaysFalse(var_11_0) then
		var_11_16.Label:setText("", 0)
	end

	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 368, _1080p * 98, _1080p * 125)
	var_11_0:addElement(var_11_16)

	var_11_0.PromptContainer = var_11_16

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "EarnRateBuff"

	var_11_18.EarnRate:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 175, _1080p * 375, _1080p * -37, _1080p * -5)
	var_11_0:addElement(var_11_18)

	var_11_0.EarnRateBuff = var_11_18

	local function var_11_19()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_19

	local var_11_20
	local var_11_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 130
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_11_4:RegisterAnimationSequence("ShowPrompt", var_11_21)

	local var_11_22 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ShowPrompt", var_11_22)

	local var_11_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ShowPrompt", var_11_23)

	local function var_11_24()
		var_11_4:AnimateSequence("ShowPrompt")
		var_11_14:AnimateSequence("ShowPrompt")
		var_11_16:AnimateSequence("ShowPrompt")
	end

	var_11_0._sequences.ShowPrompt = var_11_24

	local var_11_25
	local var_11_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("HideAll", var_11_26)

	local var_11_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("HideAll", var_11_27)

	local var_11_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("HideAll", var_11_28)

	local var_11_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("HideAll", var_11_29)

	local var_11_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("HideAll", var_11_30)

	local var_11_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("HideAll", var_11_31)

	local var_11_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("HideAll", var_11_32)

	local var_11_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 67
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 99
		}
	}

	var_11_18:RegisterAnimationSequence("HideAll", var_11_33)

	local function var_11_34()
		var_11_4:AnimateSequence("HideAll")
		var_11_6:AnimateSequence("HideAll")
		var_11_8:AnimateSequence("HideAll")
		var_11_10:AnimateSequence("HideAll")
		var_11_12:AnimateSequence("HideAll")
		var_11_14:AnimateSequence("HideAll")
		var_11_16:AnimateSequence("HideAll")
		var_11_18:AnimateSequence("HideAll")
	end

	var_11_0._sequences.HideAll = var_11_34

	local var_11_35
	local var_11_36 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Available", var_11_36)

	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Available", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Available", var_11_38)

	local var_11_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Available", var_11_39)

	local var_11_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Available", var_11_40)

	local var_11_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_11_18:RegisterAnimationSequence("Available", var_11_41)

	local function var_11_42()
		var_11_4:AnimateSequence("Available")
		var_11_6:AnimateSequence("Available")
		var_11_8:AnimateSequence("Available")
		var_11_10:AnimateSequence("Available")
		var_11_12:AnimateSequence("Available")
		var_11_18:AnimateSequence("Available")
	end

	var_11_0._sequences.Available = var_11_42

	local var_11_43
	local var_11_44 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Equipped", var_11_44)

	local var_11_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Equipped", var_11_45)

	local var_11_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_11_18:RegisterAnimationSequence("Equipped", var_11_46)

	local function var_11_47()
		var_11_4:AnimateSequence("Equipped")
		var_11_12:AnimateSequence("Equipped")
		var_11_18:AnimateSequence("Equipped")
	end

	var_11_0._sequences.Equipped = var_11_47

	local var_11_48
	local var_11_49 = {
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

	var_11_4:RegisterAnimationSequence("HidePrompt", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("HidePrompt", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("HidePrompt", var_11_51)

	local function var_11_52()
		var_11_4:AnimateSequence("HidePrompt")
		var_11_14:AnimateSequence("HidePrompt")
		var_11_16:AnimateSequence("HidePrompt")
	end

	var_11_0._sequences.HidePrompt = var_11_52

	var_0_7(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("DoubleXPNotifications", DoubleXPNotifications)
LockTable(_M)
