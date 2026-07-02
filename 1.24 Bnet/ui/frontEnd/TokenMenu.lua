module(..., package.seeall)

local var_0_0 = {
	TOKEN_WEAPON_XP = 1,
	TOKEN_PLAYER_XP = 0,
	TOKEN_KEYS = 2
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = MenuBuilder.BuildRegisteredType("TokenButton", {
		controllerIndex = arg_1_1
	})

	var_1_0.Text:setText(arg_1_2.XPName ~= "" and arg_1_2.XPName or arg_1_2.ref)
	var_1_0.NumberCount:setText(arg_1_2.tokenAmount)
	var_1_0.TokenImage:setImage(RegisterMaterial(arg_1_2.image))
	var_1_0.TimerText:setText(arg_1_2.duration)
	var_1_0:SetButtonDisabled(arg_1_0._sourceMenu._tokenInputBlocked)
	var_1_0:registerEventHandler("button_action", function(arg_2_0, arg_2_1)
		if not arg_1_0._sourceMenu._tokenInputBlocked then
			OnlineProgression.DCAHGJEDJJ(arg_1_1, arg_1_2.achievementID)

			arg_1_0._sourceMenu._tokenInputBlocked = true

			arg_1_0.TokenGrid:RefreshContent()
			ACTIONS.AnimateSequence(arg_1_0, "ShowActivating")

			arg_1_0._sourceMenu._notificationData = {
				displayTime = 2000,
				icon = arg_1_2.image,
				header = arg_1_2.header,
				description = arg_1_2.duration,
				type = LUI.ToastManager.NotificationType.DoubleXPNotifications,
				controllerIndex = arg_1_0._controllerIndex
			}
			LUI.FlowManager.GetScopedData(arg_1_0._sourceMenu).tokenNotificaionData = arg_1_0._sourceMenu._notificationData
		end
	end)

	return var_1_0
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_3_0
	})

	var_3_0.id = "challengeHeader" .. arg_3_1

	var_3_0.Title:setText(arg_3_1)
	var_3_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 64)

	return var_3_0
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0

	if arg_4_2 == LOOT.doubleXpTypes.XP then
		var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/XP_TOKEN")
	elseif arg_4_2 == LOOT.doubleXpTypes.WEAPON then
		var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_XP_TOKEN")
	elseif arg_4_2 == LOOT.doubleXpTypes.BATTLE_PASS then
		var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/BATTLEPASS_XP_TOKEN")
	elseif arg_4_2 == LOOT.doubleXpTypes.KEY then
		var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/DOUBLE_KEY_TOKEN")
	end

	arg_4_0.TokenGrid:AddElement(var_0_2(arg_4_1, var_4_0))

	for iter_4_0, iter_4_1 in ipairs(arg_4_3) do
		arg_4_0.TokenGrid:AddElement(var_0_1(arg_4_0, arg_4_1, iter_4_1))
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0
	local var_5_1 = {
		buildArrowsLabel = true,
		maxRows = 50,
		maxVisibleRows = 8,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		controllerIndex = arg_5_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_2 = LUI.UIGrid.new(var_5_1)

	var_5_2.id = "TokenGrid"

	var_5_2:setUseStencil(true)
	var_5_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 522, _1080p * 215, _1080p * 1015)
	arg_5_0:addElement(var_5_2)

	arg_5_0.TokenGrid = var_5_2

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_5_1
	})

	var_5_4.id = "VerticalMinimalScrollbar"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 532, _1080p * 543, _1080p * 215, _1080p * 745)
	arg_5_0:addElement(var_5_4)

	arg_5_0.VerticalMinimalScrollbar = var_5_4

	local var_5_5 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_5_4,
		startCap = var_5_4.startCap,
		endCap = var_5_4.endCap,
		sliderArea = var_5_4.sliderArea,
		slider = var_5_4.sliderArea and var_5_4.sliderArea.slider,
		fixedSizeSlider = var_5_4.sliderArea and var_5_4.sliderArea.fixedSizeSlider
	})

	arg_5_0.TokenGrid:AddScrollbar(var_5_5)
end

local function var_0_5(arg_6_0)
	arg_6_0.TokenGrid.GridCountArrows:closeTree()

	arg_6_0.TokenGrid.GridCountArrows = nil

	arg_6_0.TokenGrid:closeTree()

	arg_6_0.TokenGrid = nil

	arg_6_0.VerticalMinimalScrollbar:closeTree()

	arg_6_0.VerticalMinimalScrollbar = nil
end

local function var_0_6(arg_7_0, arg_7_1)
	return {
		tokenID = arg_7_0,
		XPName = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, arg_7_0, CSV.consumablesIDs.cols.name)),
		ref = StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, arg_7_0, CSV.consumablesIDs.cols.ref),
		achievementID = StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, arg_7_0, CSV.consumablesIDs.cols.AE_ID),
		tokenAmount = Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_MULTIPLIER", arg_7_1),
		image = StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, arg_7_0, CSV.consumablesIDs.cols.image),
		duration = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, arg_7_0, CSV.consumablesIDs.cols.duration)),
		rarity = tonumber(StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, arg_7_0, CSV.consumablesIDs.cols.quality))
	}
end

local function var_0_7(arg_8_0, arg_8_1)
	local var_8_0
	local var_8_1

	if arg_8_1 == LOOT.doubleXpTypes.XP then
		var_8_0 = Engine.CBBHFCGDIC("LUA_MENU/XPTOKEN_EQUIPPED")
		var_8_1 = LOOT.DOUBLE_XP_TOKENS
	elseif arg_8_1 == LOOT.doubleXpTypes.WEAPON then
		var_8_0 = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_XPTOKEN_EQUIPPED")
		var_8_1 = LOOT.DOUBLE_WEAPON_XP_TOKENS
	elseif arg_8_1 == LOOT.doubleXpTypes.BATTLE_PASS then
		var_8_0 = Engine.CBBHFCGDIC("LUA_MENU/BATTLE_XPTOKEN_EQUIPPED")
		var_8_1 = LOOT.DOUBLE_BATTLE_PASS_TOKENS
	elseif arg_8_1 == LOOT.doubleXpTypes.KEY then
		var_8_0 = Engine.CBBHFCGDIC("LUA_MENU/KEY_XPTOKEN_EQUIPPED")
		var_8_1 = LOOT.DOUBLE_KEY_TOKENS
	end

	local var_8_2 = {}

	for iter_8_0, iter_8_1 in pairs(var_8_1) do
		local var_8_3 = OnlineProgression.BIDJFJIHC(arg_8_0, iter_8_1)

		if var_8_3 > 0 then
			local var_8_4 = var_0_6(iter_8_1, var_8_3)

			var_8_4.header = var_8_0

			table.insert(var_8_2, var_8_4)
		end
	end

	table.sort(var_8_2, function(arg_9_0, arg_9_1)
		if arg_9_0.rarity and arg_9_1.rarity then
			return arg_9_0.rarity < arg_9_1.rarity
		end
	end)

	return var_8_2
end

local function var_0_8(arg_10_0, arg_10_1)
	if arg_10_0.TokenGrid then
		var_0_5(arg_10_0)
	end

	var_0_4(arg_10_0, arg_10_1)

	for iter_10_0, iter_10_1 in pairs(LOOT.doubleXpTypes) do
		if iter_10_1 ~= LOOT.doubleXpTypes.KEY or iter_10_1 == LOOT.doubleXpTypes.KEY and CONDITIONS.AreKeysEnabled() then
			local var_10_0 = var_0_7(arg_10_1, iter_10_1)

			if var_10_0 ~= nil and #var_10_0 > 0 then
				var_0_3(arg_10_0, arg_10_1, iter_10_1, var_10_0)
			end
		end
	end

	arg_10_0.TokenGrid:SetFocusedPosition({
		x = 0,
		y = 1
	}, true)
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_2.sourceMenu)
	arg_11_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/2XP_TOKEN")), 0)

	arg_11_0._tokenButtonArray = {}
	arg_11_0._sourceMenu = arg_11_2.sourceMenu or arg_11_0
	arg_11_0._sourceMenu._tokenInputBlocked = arg_11_0._sourceMenu._tokenInputBlocked or false

	local var_11_0 = LUI.FlowManager.GetScopedData(arg_11_2.sourceMenu)

	arg_11_0._sourceMenu._notificationData = var_11_0.tokenNotificaionData and var_11_0.tokenNotificaionData or {}

	var_0_8(arg_11_0, arg_11_1)
	arg_11_0._sourceMenu:registerEventHandler("token_activation_failed", function(arg_12_0, arg_12_1)
		arg_11_0._sourceMenu._tokenInputBlocked = false

		local var_12_0 = arg_11_0._sourceMenu._notificationData

		var_12_0.icon = "icon_empty_circle"
		var_12_0.header = Engine.CBBHFCGDIC("LUA_MENU/TOKEN_ACTIVATION_FAILED")

		arg_11_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_12_0
		})
		ACTIONS.AnimateSequence(arg_11_0, "HideActivating")
		var_0_8(arg_11_0, arg_11_1)
	end)
	arg_11_0._sourceMenu:registerEventHandler("token_activation_success", function(arg_13_0, arg_13_1)
		arg_11_0._sourceMenu._tokenInputBlocked = false

		local var_13_0 = arg_11_0._sourceMenu._notificationData

		arg_11_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_13_0
		})
		ACTIONS.AnimateSequence(arg_11_0, "HideActivating")
		var_0_8(arg_11_0, arg_11_1)
	end)
end

function TokenMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIVerticalNavigator.new()

	var_14_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -320 * _1080p, 320 * _1080p, -540 * _1080p, 540 * _1080p)

	var_14_0.id = "TokenMenu"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "MenuTitle"

	var_14_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/2XP_TOKEN")), 0)
	var_14_4.Line:SetLeft(0, 0)
	var_14_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 555, 0, _1080p * 100)
	var_14_0:addElement(var_14_4)

	var_14_0.MenuTitle = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIText.new()

	var_14_6.id = "ActivatingTokensLabel"

	var_14_6:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_14_6:SetAlpha(0, 0)
	var_14_6:setText(Engine.CBBHFCGDIC("LUA_MENU/ACTIVATING_TOKEN"), 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_6:SetAlignment(LUI.Alignment.Center)
	var_14_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 522, _1080p * 161, _1080p * 181)
	var_14_0:addElement(var_14_6)

	var_14_0.ActivatingTokensLabel = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "spinner"

	var_14_8:SetAlpha(0, 0)
	var_14_8:setImage(RegisterMaterial("spinner_loading"), 0)
	var_14_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 522, _1080p * 196, _1080p * 206)
	var_14_0:addElement(var_14_8)

	var_14_0.spinner = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIStyledText.new()

	var_14_10.id = "ActivatingTokensLabelCopy0"

	var_14_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_14_10:setText(Engine.CBBHFCGDIC("LUA_MENU/TOKEN_TIMER_WARNING"), 0)
	var_14_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_10:SetAlignment(LUI.Alignment.Left)
	var_14_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_14_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_14_10:SetStartupDelay(1000)
	var_14_10:SetLineHoldTime(400)
	var_14_10:SetAnimMoveTime(1000)
	var_14_10:SetAnimMoveSpeed(150)
	var_14_10:SetEndDelay(1000)
	var_14_10:SetCrossfadeTime(400)
	var_14_10:SetFadeInTime(300)
	var_14_10:SetFadeOutTime(300)
	var_14_10:SetMaxVisibleLines(2)
	var_14_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 522, _1080p * 118, _1080p * 138)
	var_14_0:addElement(var_14_10)

	var_14_0.ActivatingTokensLabelCopy0 = var_14_10

	local function var_14_11()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_11

	local var_14_12
	local var_14_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ShowActivating", var_14_13)

	local var_14_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ShowActivating", var_14_14)

	local function var_14_15()
		var_14_6:AnimateSequence("ShowActivating")
		var_14_8:AnimateSequence("ShowActivating")
	end

	var_14_0._sequences.ShowActivating = var_14_15

	local var_14_16
	local var_14_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("HideActivating", var_14_17)

	local var_14_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("HideActivating", var_14_18)

	local function var_14_19()
		var_14_6:AnimateSequence("HideActivating")
		var_14_8:AnimateSequence("HideActivating")
	end

	var_14_0._sequences.HideActivating = var_14_19

	var_0_9(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("TokenMenu", TokenMenu)
LockTable(_M)
