module(..., package.seeall)

Popups = {}
Popups.PopupYesActionAttempts = {
	0,
	0,
	0
}

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.controllerIndex

	if not var_1_0 then
		DebugPrint("Warning: opening popup for unspecified controllerIndex, defaulting to 0")

		var_1_0 = 0
	end

	local var_1_1 = MenuBuilder.BuildRegisteredType("PopupFrame", {
		controllerIndex = var_1_0,
		hideBackground = arg_1_1.hideBackground,
		blockBackground = arg_1_1.blockBackground,
		hideFrame = arg_1_1.hideFrame,
		noBackButton = arg_1_1.noBackButton,
		noSelectButton = arg_1_1.noSelectButton
	})

	assert(var_1_1.MeasureTitle)

	local var_1_2 = arg_1_1.title or Engine.CBBHFCGDIC("MENU/NOTICE")
	local var_1_3 = arg_1_1.width or LUI.clamp(var_1_1:MeasureTitle(var_1_2) + 500, 430, 1200)
	local var_1_4 = arg_1_1.spacing or 6
	local var_1_5 = arg_1_1.yOffset or 0
	local var_1_6 = arg_1_1.cancelClosesPopup ~= false
	local var_1_7 = arg_1_1.cancelAction
	local var_1_8 = arg_1_1.listContent or {}
	local var_1_9 = arg_1_1.countdownEvent
	local var_1_10 = arg_1_1.countdownStartTime
	local var_1_11 = LUI.UIElement.new()

	var_1_11.id = "screen"

	LUI.TextChat.SetupMenuForNoChat(var_1_11)

	local var_1_12 = LUI.UIElement.new()

	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -var_1_3 / 2, var_1_3 / 2, var_1_5, var_1_5)

	var_1_12.id = "PopupList"

	var_1_11:addElement(var_1_12)

	local var_1_13 = LUI.UIVerticalList.new({
		adjustSizeToContent = true,
		ignoreStretchingChildren = true,
		verticalAlignment = LUI.Alignment.Middle
	})

	var_1_13:SetSpacing(var_1_4)
	var_1_12:addElement(var_1_13)
	assert(var_1_1.SetTitle)
	var_1_1:SetTitle(var_1_2)
	var_1_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_13:addElement(var_1_1)

	var_1_11.frame = var_1_1

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.listContent) do
		var_1_13:addElement(iter_1_1)
	end

	local var_1_14 = LUI.UIBindButton.new()

	var_1_14.id = "bindButton"

	var_1_14:registerEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		if var_1_7 then
			var_1_7(arg_2_0, arg_2_1.controller)
		end

		if var_1_6 then
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true)
		end

		return true
	end)
	var_1_11:addElement(var_1_14)

	if var_1_9 and var_1_8 and #var_1_8 > 0 then
		local var_1_15 = LUI.UITimer.new({
			interval = 1000,
			event = "countdown_to_reboot"
		})

		var_1_15.id = "timer"

		var_1_11:addElement(var_1_15)
		var_1_11:registerEventHandler("countdown_to_reboot", function(arg_3_0, arg_3_1)
			(function()
				var_1_10 = var_1_10 - 1

				if var_1_8[1] and var_1_8[1].id == "message" then
					if var_1_10 > 0 then
						var_1_8[1]:setText(Engine.CBBHFCGDIC("LUA_MENU/PATCH_UPDATE_RESTART_AUTO", var_1_10))
					else
						var_1_8[1]:setText(Engine.CBBHFCGDIC("LUA_MENU/PATCH_UPDATE_BUTTON"))
					end
				end

				if var_1_10 <= 0 then
					var_1_15:closeTree()

					var_1_15 = nil

					var_1_7()

					return
				end
			end)()
		end)
	end

	return var_1_11
end

local function var_0_1(arg_5_0)
	return function(arg_6_0, arg_6_1)
		if #arg_5_0.listContent > 0 then
			return arg_5_0.listContent[arg_6_1]
		end
	end
end

local function var_0_2(arg_7_0, arg_7_1)
	local var_7_0 = Engine.BFBIDEGDFB() - arg_7_1
	local var_7_1 = 0

	for iter_7_0 = 1, math.min(#Popups.PopupYesActionAttempts, arg_7_0) do
		if var_7_0 < Popups.PopupYesActionAttempts[iter_7_0] then
			var_7_1 = var_7_1 + 1
		end
	end

	if arg_7_0 <= var_7_1 then
		return true
	end

	table.insert(Popups.PopupYesActionAttempts, Engine.BFBIDEGDFB())

	if arg_7_0 < #Popups.PopupYesActionAttempts then
		table.remove(Popups.PopupYesActionAttempts, 1)
	end

	return false
end

local function var_0_3(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.message or "Default popup message"

	if not arg_8_1.buttons then
		local var_8_1 = {}
	end

	local var_8_2 = arg_8_1.buttonsClosePopup ~= false
	local var_8_3 = arg_8_1.defaultFocusIndex
	local var_8_4 = arg_8_1.statusMessage
	local var_8_5 = arg_8_1.blockSoundOnButtonClose
	local var_8_6 = arg_8_1.controllerIndex

	if not var_8_6 then
		DebugPrint("Warning: opening popup for unspecified controllerIndex")

		var_8_6 = 0
	end

	local var_8_7 = {
		controllerIndex = var_8_6,
		title = arg_8_1.title,
		width = arg_8_1.width,
		spacing = arg_8_1.spacing or 6,
		cancelClosesPopup = arg_8_1.cancelClosesPopup,
		cancelAction = arg_8_1.cancelAction,
		yOffset = arg_8_1.yOffset,
		hideBackground = arg_8_1.hideBackground,
		blockBackground = arg_8_1.blockBackground,
		noBackButton = arg_8_1.noBackButton,
		noSelectButton = arg_8_1.noSelectButton,
		countdownEvent = arg_8_1.countdownEvent,
		countdownStartTime = arg_8_1.countdownStartTime,
		noBackButton = arg_8_1.noBackButton,
		listContent = {}
	}
	local var_8_8 = 24

	if IsLanguageArabic() then
		var_8_8 = 36
	end

	if #var_8_0 > 0 then
		local var_8_9 = LUI.UIText.new()

		var_8_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_8_8 * _1080p)
		var_8_9:SetAlignment(LUI.Alignment.Center)
		var_8_9:SetRGBFromTable(CONDITIONS.IsWZWipDvarEnabled() and SWATCHES.WZGlobalSwatches.WZDescription or SWATCHES.genericButton.description, 0)

		if arg_8_1.useBnetFont then
			var_8_9:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		else
			var_8_9:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
		end

		var_8_9.id = "message"

		var_8_9:setText(var_8_0)

		if arg_8_1.useMessageContainer and arg_8_1.messageContainerHeight then
			local var_8_10 = LUI.UIElement.new()

			var_8_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_8_1.messageContainerHeight * _1080p)
			var_8_10:addElement(var_8_9)
			table.insert(var_8_7.listContent, var_8_10)
		else
			table.insert(var_8_7.listContent, var_8_9)
		end
	end

	if var_8_4 ~= nil then
		local var_8_11 = LUI.UIText.new()

		var_8_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 10)
		var_8_11:SetAlignment(LUI.Alignment.Center)
		var_8_11:SetRGBFromTable(CONDITIONS.IsWZWipDvarEnabled() and SWATCHES.WZGlobalSwatches.WZDescription or SWATCHES.genericButton.description, 0)
		var_8_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))

		var_8_11.id = "submessage"

		var_8_11:setText(var_8_4)
		table.insert(var_8_7.listContent, var_8_11)
	end

	local var_8_12 = false

	for iter_8_0, iter_8_1 in ipairs(arg_8_1.buttons) do
		assert(type(iter_8_1.label) == "string")
		assert(type(iter_8_1.action) == "function")

		local var_8_13 = MenuBuilder.BuildRegisteredType("PopupButton", {
			controllerIndex = var_8_6
		})

		var_8_13.listDefaultFocus = iter_8_0 == var_8_3

		if hashset({
			string.lower(Engine.CBBHFCGDIC("@MENU/CANCEL")),
			string.lower(Engine.CBBHFCGDIC("@MENU/EXIT")),
			string.lower(Engine.CBBHFCGDIC("@MENU/NO")),
			string.lower(Engine.CBBHFCGDIC("@LUA_MENU/NO")),
			string.lower(Engine.CBBHFCGDIC("@MENU/BACK")),
			string.lower(Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"))
		})[string.lower(iter_8_1.label)] then
			var_8_7.noBackButton = true
		end

		var_8_13:SetLeftAnchor(0.5)
		var_8_13:SetRightAnchor(0.5)
		var_8_13:SetLeft(-200)
		var_8_13:SetRight(200)

		var_8_13.id = "button_" .. iter_8_0
		var_8_13._doNotForceUpperCase = iter_8_1.doNotForceUpperCase

		assert(var_8_13.SetText)
		var_8_13:SetText(iter_8_1.label)
		var_8_13:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			assert(arg_9_1.controller)

			local var_9_0 = false

			if arg_8_1.rateLimited then
				var_9_0 = var_0_2(arg_8_1.rateLimitAttempts, arg_8_1.rateLimitIntervalMS)
			end

			if not var_9_0 then
				iter_8_1.action(arg_9_0, arg_9_1.controller)

				if var_8_2 then
					LUI.FlowManager.RequestLeaveMenu(arg_9_0, true, var_8_5)
				end
			end
		end)

		if iter_8_1.disabled then
			var_8_13:SetButtonDisabled(true)
		end

		if iter_8_1.buttonDescription then
			var_8_13.buttonDescription = iter_8_1.buttonDescription
			var_8_12 = true
		end

		if iter_8_1.actionSFX then
			var_8_13:setActionSFX(iter_8_1.actionSFX)
		end

		table.insert(var_8_7.listContent, var_8_13)
	end

	if var_8_12 then
		local var_8_14 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
			controllerIndex = var_8_6
		})

		var_8_14.id = "buttonDescription"

		var_8_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
		var_8_14.Description:SetRightAnchor(0)
		var_8_14.Description:SetRight(0)
		table.insert(var_8_7.listContent, var_8_14)
	end

	local var_8_15 = MenuBuilder.BuildRegisteredType("PopupList", var_8_7)

	var_8_15.GetButton = var_0_1(var_8_7)

	Engine.BJDBIAGIDA(arg_8_1.popupSFX and arg_8_1.popupSFX or SOUND_SETS.default.popup)

	return var_8_15
end

local function var_0_4(arg_10_0, arg_10_1)
	local var_10_0 = 3
	local var_10_1 = {}

	local function var_10_2()
		return
	end

	var_10_1.controllerIndex = arg_10_1.controllerIndex
	var_10_1.title = arg_10_1.title
	var_10_1.width = arg_10_1.width
	var_10_1.message = arg_10_1.message
	var_10_1.defaultFocusIndex = arg_10_1.defaultFocusIndex or var_10_0
	var_10_1.cancelClosesPopup = true
	var_10_1.buttonsClosePopup = true
	var_10_1.cancelAction = arg_10_1.cancelAction
	var_10_1.noBackButton = arg_10_1.noBackButton
	var_10_1.yOffset = arg_10_1.yOffset
	var_10_1.blockSoundOnButtonClose = arg_10_1.blockSoundOnButtonClose ~= false
	var_10_1.statusMessage = arg_10_1.statusMessage
	var_10_1.buttons = arg_10_1.buttons or {
		{
			label = arg_10_1.yesLabel or Engine.CBBHFCGDIC("LUA_MENU/YES"),
			action = arg_10_1.yesAction or var_10_2,
			actionSFX = arg_10_1.actionSFX
		},
		{
			label = arg_10_1.noLabel or Engine.CBBHFCGDIC("LUA_MENU/NO"),
			action = arg_10_1.noAction or var_10_2
		},
		{
			label = arg_10_1.cancelLabel or Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = arg_10_1.cancelAction or var_10_2
		}
	}
	var_10_1.rateLimited = arg_10_1.rateLimited
	var_10_1.rateLimitIntervalMS = arg_10_1.rateLimitIntervalMS
	var_10_1.rateLimitAttempts = arg_10_1.rateLimitAttempts
	var_10_1.popupSFX = arg_10_1.popupSFX
	var_10_1.useBnetFont = arg_10_1.useBnetFont

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_10_1))
end

local function var_0_5(arg_12_0, arg_12_1)
	local var_12_0 = {
		controllerIndex = arg_12_1.controllerIndex,
		title = arg_12_1.title,
		width = arg_12_1.width,
		message = arg_12_1.message,
		defaultFocusIndex = arg_12_1.defaultFocusIndex or 2
	}

	var_12_0.cancelClosesPopup = true
	var_12_0.buttonsClosePopup = true
	var_12_0.cancelAction = arg_12_1.noAction
	var_12_0.noBackButton = arg_12_1.noBackButton
	var_12_0.yOffset = arg_12_1.yOffset
	var_12_0.blockSoundOnButtonClose = arg_12_1.blockSoundOnButtonClose ~= false
	var_12_0.blockBackground = arg_12_1.blockBackground
	var_12_0.statusMessage = arg_12_1.statusMessage
	var_12_0.buttons = {
		{
			label = arg_12_1.yesLabel or Engine.CBBHFCGDIC("LUA_MENU/YES"),
			action = arg_12_1.yesAction or function(arg_13_0)
				return
			end,
			actionSFX = arg_12_1.actionSFX
		},
		{
			label = arg_12_1.noLabel or Engine.CBBHFCGDIC("LUA_MENU/NO"),
			action = arg_12_1.noAction or function(arg_14_0)
				return
			end
		}
	}
	var_12_0.rateLimited = arg_12_1.rateLimited
	var_12_0.rateLimitIntervalMS = arg_12_1.rateLimitIntervalMS
	var_12_0.rateLimitAttempts = arg_12_1.rateLimitAttempts
	var_12_0.popupSFX = arg_12_1.popupSFX
	var_12_0.useBnetFont = arg_12_1.useBnetFont

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_12_0))
end

local function var_0_6(arg_15_0, arg_15_1)
	local var_15_0 = {
		controllerIndex = arg_15_1.controllerIndex,
		title = arg_15_1.title,
		width = arg_15_1.width,
		message = arg_15_1.message,
		statusMessage = arg_15_1.statusMessage
	}

	var_15_0.cancelClosesPopup = true
	var_15_0.buttonsClosePopup = true
	var_15_0.cancelAction = arg_15_1.action
	var_15_0.yOffset = arg_15_1.yOffset
	var_15_0.buttons = {
		{
			label = arg_15_1.label or Engine.CBBHFCGDIC("MENU/EXIT"),
			action = arg_15_1.action or function(arg_16_0)
				return
			end
		}
	}
	var_15_0.popupSFX = arg_15_1.popupSFX
	var_15_0.useBnetFont = arg_15_1.useBnetFont
	var_15_0.countdownEvent = arg_15_1.countdownEvent
	var_15_0.countdownStartTime = arg_15_1.countdownStartTime
	var_15_0.noBackButton = arg_15_1.noBackButton

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_15_0))
end

local function var_0_7(arg_17_0, arg_17_1)
	local var_17_0 = {
		controllerIndex = arg_17_1.controllerIndex,
		title = arg_17_1.title,
		width = arg_17_1.width,
		message = arg_17_1.message,
		statusMessage = arg_17_1.statusMessage
	}

	var_17_0.cancelClosesPopup = false
	var_17_0.buttonsClosePopup = false
	var_17_0.cancelAction = arg_17_1.action
	var_17_0.yOffset = arg_17_1.yOffset
	var_17_0.buttons = {}
	var_17_0.popupSFX = arg_17_1.popupSFX
	var_17_0.useBnetFont = arg_17_1.useBnetFont
	var_17_0.noBackButton = true
	var_17_0.noSelectButton = true

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_17_0))
end

MenuBuilder.registerType("PopupList", var_0_0)
MenuBuilder.registerType("PopupMessageAndButtons", var_0_3)
MenuBuilder.registerType("PopupYesNoCancel", var_0_4)
MenuBuilder.registerType("PopupYesNo", var_0_5)
MenuBuilder.registerType("PopupOK", var_0_6)
MenuBuilder.registerType("PopupReadOnly", var_0_7)
LockTable(_M)
