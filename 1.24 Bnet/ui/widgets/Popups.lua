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
		hideFrame = arg_1_1.hideFrame,
		noBackButton = arg_1_1.noBackButton
	})

	assert(var_1_1.MeasureTitle)

	local var_1_2 = arg_1_1.title or Engine.CBBHFCGDIC("MENU/NOTICE")
	local var_1_3 = arg_1_1.width or LUI.clamp(var_1_1:MeasureTitle(var_1_2) + 500, 430, 1200)
	local var_1_4 = arg_1_1.spacing or 6
	local var_1_5 = arg_1_1.yOffset or 0
	local var_1_6 = arg_1_1.cancelClosesPopup ~= false
	local var_1_7 = arg_1_1.cancelAction

	if not arg_1_1.listContent then
		local var_1_8 = {}
	end

	local var_1_9 = LUI.UIElement.new()

	var_1_9.id = "screen"

	LUI.TextChat.SetupMenuForNoChat(var_1_9)

	local var_1_10 = LUI.UIElement.new()

	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -var_1_3 / 2, var_1_3 / 2, var_1_5, var_1_5)

	var_1_10.id = "PopupList"

	var_1_9:addElement(var_1_10)

	local var_1_11 = LUI.UIVerticalList.new({
		adjustSizeToContent = true,
		ignoreStretchingChildren = true,
		verticalAlignment = LUI.Alignment.Middle
	})

	var_1_11:SetSpacing(var_1_4)
	var_1_10:addElement(var_1_11)
	assert(var_1_1.SetTitle)
	var_1_1:SetTitle(var_1_2)
	var_1_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_11:addElement(var_1_1)

	var_1_9.frame = var_1_1

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.listContent) do
		var_1_11:addElement(iter_1_1)
	end

	local var_1_12 = LUI.UIBindButton.new()

	var_1_12.id = "bindButton"

	var_1_12:registerEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		if var_1_7 then
			var_1_7(arg_2_0, arg_2_1.controller)
		end

		if var_1_6 then
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true)
		end

		return true
	end)
	var_1_9:addElement(var_1_12)

	return var_1_9
end

local function var_0_1(arg_3_0)
	return function(arg_4_0, arg_4_1)
		if #arg_3_0.listContent > 0 then
			return arg_3_0.listContent[arg_4_1]
		end
	end
end

local function var_0_2(arg_5_0, arg_5_1)
	local var_5_0 = Engine.BFBIDEGDFB() - arg_5_1
	local var_5_1 = 0

	for iter_5_0 = 1, math.min(#Popups.PopupYesActionAttempts, arg_5_0) do
		if var_5_0 < Popups.PopupYesActionAttempts[iter_5_0] then
			var_5_1 = var_5_1 + 1
		end
	end

	if arg_5_0 <= var_5_1 then
		return true
	end

	table.insert(Popups.PopupYesActionAttempts, Engine.BFBIDEGDFB())

	if arg_5_0 < #Popups.PopupYesActionAttempts then
		table.remove(Popups.PopupYesActionAttempts, 1)
	end

	return false
end

local function var_0_3(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.message or "Default popup message"

	if not arg_6_1.buttons then
		local var_6_1 = {}
	end

	local var_6_2 = arg_6_1.buttonsClosePopup ~= false
	local var_6_3 = arg_6_1.defaultFocusIndex
	local var_6_4 = arg_6_1.statusMessage
	local var_6_5 = arg_6_1.blockSoundOnButtonClose
	local var_6_6 = arg_6_1.controllerIndex

	if not var_6_6 then
		DebugPrint("Warning: opening popup for unspecified controllerIndex")

		var_6_6 = 0
	end

	local var_6_7 = {
		controllerIndex = var_6_6,
		title = arg_6_1.title,
		width = arg_6_1.width,
		spacing = arg_6_1.spacing or 6,
		cancelClosesPopup = arg_6_1.cancelClosesPopup,
		cancelAction = arg_6_1.cancelAction,
		yOffset = arg_6_1.yOffset,
		hideBackground = arg_6_1.hideBackground,
		noBackButton = arg_6_1.noBackButton,
		listContent = {}
	}
	local var_6_8 = 24

	if IsLanguageArabic() then
		var_6_8 = 36
	end

	if #var_6_0 > 0 then
		local var_6_9 = LUI.UIText.new()

		var_6_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_6_8 * _1080p)
		var_6_9:SetAlignment(LUI.Alignment.Center)
		var_6_9:SetRGBFromTable(SWATCHES.genericButton.description, 0)

		if arg_6_1.useBnetFont then
			var_6_9:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		else
			var_6_9:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
		end

		var_6_9.id = "message"

		var_6_9:setText(var_6_0)

		if arg_6_1.useMessageContainer and arg_6_1.messageContainerHeight then
			local var_6_10 = LUI.UIElement.new()

			var_6_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_6_1.messageContainerHeight * _1080p)
			var_6_10:addElement(var_6_9)
			table.insert(var_6_7.listContent, var_6_10)
		else
			table.insert(var_6_7.listContent, var_6_9)
		end
	end

	if var_6_4 ~= nil then
		local var_6_11 = LUI.UIText.new()

		var_6_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 10)
		var_6_11:SetAlignment(LUI.Alignment.Center)
		var_6_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_6_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))

		var_6_11.id = "submessage"

		var_6_11:setText(var_6_4)
		table.insert(var_6_7.listContent, var_6_11)
	end

	local var_6_12 = false

	for iter_6_0, iter_6_1 in ipairs(arg_6_1.buttons) do
		assert(type(iter_6_1.label) == "string")
		assert(type(iter_6_1.action) == "function")

		local var_6_13 = MenuBuilder.BuildRegisteredType("PopupButton", {
			controllerIndex = var_6_6
		})

		var_6_13.listDefaultFocus = iter_6_0 == var_6_3

		if hashset({
			string.lower(Engine.CBBHFCGDIC("@MENU/CANCEL")),
			string.lower(Engine.CBBHFCGDIC("@MENU/EXIT")),
			string.lower(Engine.CBBHFCGDIC("@MENU/NO")),
			string.lower(Engine.CBBHFCGDIC("@LUA_MENU/NO")),
			string.lower(Engine.CBBHFCGDIC("@MENU/BACK")),
			string.lower(Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"))
		})[string.lower(iter_6_1.label)] then
			var_6_7.noBackButton = true
		end

		var_6_13:SetLeftAnchor(0.5)
		var_6_13:SetRightAnchor(0.5)
		var_6_13:SetLeft(-200)
		var_6_13:SetRight(200)

		var_6_13.id = "button_" .. iter_6_0
		var_6_13._doNotForceUpperCase = iter_6_1.doNotForceUpperCase

		assert(var_6_13.SetText)
		var_6_13:SetText(iter_6_1.label)
		var_6_13:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			assert(arg_7_1.controller)

			local var_7_0 = false

			if arg_6_1.rateLimited then
				var_7_0 = var_0_2(arg_6_1.rateLimitAttempts, arg_6_1.rateLimitIntervalMS)
			end

			if not var_7_0 then
				iter_6_1.action(arg_7_0, arg_7_1.controller)

				if var_6_2 then
					LUI.FlowManager.RequestLeaveMenu(arg_7_0, true, var_6_5)
				end
			end
		end)

		if iter_6_1.disabled then
			var_6_13:SetButtonDisabled(true)
		end

		if iter_6_1.buttonDescription then
			var_6_13.buttonDescription = iter_6_1.buttonDescription
			var_6_12 = true
		end

		if iter_6_1.actionSFX then
			var_6_13:setActionSFX(iter_6_1.actionSFX)
		end

		table.insert(var_6_7.listContent, var_6_13)
	end

	if var_6_12 then
		local var_6_14 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
			controllerIndex = var_6_6
		})

		var_6_14.id = "buttonDescription"

		var_6_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
		var_6_14.Description:SetRightAnchor(0)
		var_6_14.Description:SetRight(0)
		table.insert(var_6_7.listContent, var_6_14)
	end

	local var_6_15 = MenuBuilder.BuildRegisteredType("PopupList", var_6_7)

	var_6_15.GetButton = var_0_1(var_6_7)

	Engine.BJDBIAGIDA(arg_6_1.popupSFX and arg_6_1.popupSFX or SOUND_SETS.default.popup)

	return var_6_15
end

local function var_0_4(arg_8_0, arg_8_1)
	local var_8_0 = 3
	local var_8_1 = {}

	local function var_8_2()
		return
	end

	var_8_1.controllerIndex = arg_8_1.controllerIndex
	var_8_1.title = arg_8_1.title
	var_8_1.width = arg_8_1.width
	var_8_1.message = arg_8_1.message
	var_8_1.defaultFocusIndex = arg_8_1.defaultFocusIndex or var_8_0
	var_8_1.cancelClosesPopup = true
	var_8_1.buttonsClosePopup = true
	var_8_1.cancelAction = arg_8_1.cancelAction
	var_8_1.noBackButton = arg_8_1.noBackButton
	var_8_1.yOffset = arg_8_1.yOffset
	var_8_1.blockSoundOnButtonClose = arg_8_1.blockSoundOnButtonClose ~= false
	var_8_1.statusMessage = arg_8_1.statusMessage
	var_8_1.buttons = {
		{
			label = arg_8_1.yesLabel or Engine.CBBHFCGDIC("LUA_MENU/YES"),
			action = arg_8_1.yesAction or var_8_2,
			actionSFX = arg_8_1.actionSFX
		},
		{
			label = arg_8_1.noLabel or Engine.CBBHFCGDIC("LUA_MENU/NO"),
			action = arg_8_1.noAction or var_8_2
		},
		{
			label = arg_8_1.cancelLabel or Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = arg_8_1.cancelAction or var_8_2
		}
	}
	var_8_1.rateLimited = arg_8_1.rateLimited
	var_8_1.rateLimitIntervalMS = arg_8_1.rateLimitIntervalMS
	var_8_1.rateLimitAttempts = arg_8_1.rateLimitAttempts
	var_8_1.popupSFX = arg_8_1.popupSFX
	var_8_1.useBnetFont = arg_8_1.useBnetFont

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_8_1))
end

local function var_0_5(arg_10_0, arg_10_1)
	local var_10_0 = {
		controllerIndex = arg_10_1.controllerIndex,
		title = arg_10_1.title,
		width = arg_10_1.width,
		message = arg_10_1.message,
		defaultFocusIndex = arg_10_1.defaultFocusIndex or 2
	}

	var_10_0.cancelClosesPopup = true
	var_10_0.buttonsClosePopup = true
	var_10_0.cancelAction = arg_10_1.noAction
	var_10_0.noBackButton = arg_10_1.noBackButton
	var_10_0.yOffset = arg_10_1.yOffset
	var_10_0.blockSoundOnButtonClose = arg_10_1.blockSoundOnButtonClose ~= false
	var_10_0.statusMessage = arg_10_1.statusMessage
	var_10_0.buttons = {
		{
			label = arg_10_1.yesLabel or Engine.CBBHFCGDIC("LUA_MENU/YES"),
			action = arg_10_1.yesAction or function(arg_11_0)
				return
			end,
			actionSFX = arg_10_1.actionSFX
		},
		{
			label = arg_10_1.noLabel or Engine.CBBHFCGDIC("LUA_MENU/NO"),
			action = arg_10_1.noAction or function(arg_12_0)
				return
			end
		}
	}
	var_10_0.rateLimited = arg_10_1.rateLimited
	var_10_0.rateLimitIntervalMS = arg_10_1.rateLimitIntervalMS
	var_10_0.rateLimitAttempts = arg_10_1.rateLimitAttempts
	var_10_0.popupSFX = arg_10_1.popupSFX
	var_10_0.useBnetFont = arg_10_1.useBnetFont

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_10_0))
end

local function var_0_6(arg_13_0, arg_13_1)
	local var_13_0 = {
		controllerIndex = arg_13_1.controllerIndex,
		title = arg_13_1.title,
		width = arg_13_1.width,
		message = arg_13_1.message,
		statusMessage = arg_13_1.statusMessage
	}

	var_13_0.cancelClosesPopup = true
	var_13_0.buttonsClosePopup = true
	var_13_0.cancelAction = arg_13_1.action
	var_13_0.yOffset = arg_13_1.yOffset
	var_13_0.buttons = {
		{
			label = arg_13_1.label or Engine.CBBHFCGDIC("MENU/EXIT"),
			action = arg_13_1.action or function(arg_14_0)
				return
			end
		}
	}
	var_13_0.popupSFX = arg_13_1.popupSFX
	var_13_0.useBnetFont = arg_13_1.useBnetFont

	return (MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_13_0))
end

MenuBuilder.registerType("PopupList", var_0_0)
MenuBuilder.registerType("PopupMessageAndButtons", var_0_3)
MenuBuilder.registerType("PopupYesNoCancel", var_0_4)
MenuBuilder.registerType("PopupYesNo", var_0_5)
MenuBuilder.registerType("PopupOK", var_0_6)
LockTable(_M)
