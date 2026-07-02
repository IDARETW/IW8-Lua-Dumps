module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		arg_1_0._messagesFont = FONTS.GetFont(FONTS.MainRegular.File)
		arg_1_0._messageLineHeight = 24
	else
		arg_1_0._messagesFont = FONTS.GetFont(FONTS.BattleNetRegular.File)
		arg_1_0._messageLineHeight = 20
	end

	arg_1_0._messageLineHeight1080p = arg_1_0._messageLineHeight * _1080p
	arg_1_0._halfMessageLineHeight = arg_1_0._messageLineHeight * 0.5
	arg_1_0._messageLineWidth = 406

	local function var_1_0(arg_2_0)
		arg_2_0.maxVisibleColumns = 1
		arg_2_0.controllerIndex = arg_1_1
		arg_2_0.wrapX = false
		arg_2_0.wrapY = false
		arg_2_0.spacingX = _1080p * 0
		arg_2_0.spacingY = _1080p * 0
		arg_2_0.adjustSizeToContent = false
		arg_2_0.horizontalAlignment = LUI.Alignment.Left
		arg_2_0.verticalAlignment = LUI.Alignment.Bottom
		arg_2_0.arrowsEnabled = false
		arg_2_0.springCoefficient = 400
		arg_2_0.maxVelocity = 5000
		arg_2_0.alwaysSnap = false
		arg_2_0.scrollingThresholdY = 1
		arg_2_0.mouseWheelScrollingOffsetPx = arg_1_0._messageLineHeight1080p
	end

	arg_1_0.chatMessages = {}

	local var_1_1 = {
		maxVisibleRows = LUI.TextChat.WantedChatLines,
		buildChild = function()
			local var_3_0 = MenuBuilder.BuildRegisteredType("TextChatEntryLine", {
				disposable = false,
				controllerIndex = arg_1_1
			})

			var_3_0.NameHighlight:addEventHandler("mouseenter", function(arg_4_0, arg_4_1)
				if arg_4_0.currentMessageIndex then
					arg_4_0:AnimateSequence("MouseOverName")
				end
			end)
			var_3_0.NameHighlight:addEventHandler("mouseleave", function(arg_5_0, arg_5_1)
				if arg_5_0.currentMessageIndex then
					arg_5_0:AnimateSequence("MouseUpName")
				end
			end)
			var_3_0.NameHighlight:addEventHandler("leftmouseup", function(arg_6_0, arg_6_1)
				if arg_6_0.currentMessageIndex then
					local var_6_0 = arg_1_0.chatMessages[arg_6_0.currentMessageIndex].xuid

					if var_6_0 == "0" then
						var_6_0 = arg_1_0.chatMessages[arg_6_0.currentMessageIndex].platformId
					end

					LUI.TextChat.InitiateWhisperWithXUID(nil, arg_6_1.controller, var_6_0, arg_1_0.chatMessages[arg_6_0.currentMessageIndex].name)

					return true
				end
			end)
			var_3_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 24 * _1080p)
			var_3_0.Message:SetAlpha(0)

			local function var_3_1(arg_7_0, arg_7_1, arg_7_2)
				return function()
					local var_8_0 = arg_7_0.chatMessages[arg_7_1.NameHighlight.currentMessageIndex]
					local var_8_1
					local var_8_2

					if var_8_0.chatType == OnlineChatType.PRIVATE_CHAT or var_8_0.chatType == OnlineChatType.PLAYER_EVENT then
						if var_8_0.platformId and var_8_0.platformId ~= "0" then
							var_8_1 = Social.HCGJEAAHE(arg_7_2, var_8_0.platformId)
							var_8_2 = FRIENDS.TabIDs.ONLINE_FRIENDS
						else
							var_8_2 = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
						end
					end

					var_8_2 = var_8_2 or Social.ECHBFGEHFI(arg_7_2, var_8_0.xuid)

					return {
						presencePlatform = 0,
						isContextualMenu = true,
						gamertag = var_8_0.name,
						crossplayGamertag = var_8_1 ~= "" and var_8_1 or nil,
						xuid = var_8_0.xuid,
						platformId = var_8_0.platformId or "0",
						controllerIndex = arg_7_2,
						selectedTab = var_8_2,
						showBattlenetData = Engine.CGABICJHAI() or nil,
						getButtonsCallback = function(arg_9_0)
							return (FRIENDS.GetFriendActions(arg_9_0))
						end
					}
				end
			end

			FRIENDS.SetupPlayerContextualMenuOptions(var_3_0.NameHighlight, arg_1_1, var_3_1(arg_1_0, var_3_0, arg_1_1))

			return var_3_0
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			if #arg_1_0.chatMessages > 0 and arg_10_2 < #arg_1_0.chatMessages then
				local var_10_0 = arg_10_2 + 1
				local var_10_1 = arg_1_0.chatMessages[var_10_0].message
				local var_10_2 = arg_1_0.chatMessages[var_10_0].NameHighlight

				if var_10_1 then
					arg_10_0.Message:setText(var_10_1)

					local var_10_3 = arg_1_0.chatMessages[var_10_0].nameWidth

					if var_10_3 then
						arg_10_0.NameHighlight:SetRight(var_10_3 * _1080p)
						arg_10_0.NameHighlight:SetHandleMouse(true)
					else
						arg_10_0.NameHighlight:SetHandleMouse(false)
					end

					arg_10_0.NameHighlight.currentMessageIndex = var_10_0

					arg_10_0.Message:SetLeft(0)
					arg_10_0.Message:SetRGBFromTable(LUI.TextChat.ChatChannels[arg_1_0.chatMessages[var_10_0].chatType].color)

					if not arg_1_0.MessagesShouldFade() or arg_1_0.chatMessages[var_10_0].startFadeTime and arg_1_0.chatMessages[var_10_0].startFadeTime > Engine.BFBIDEGDFB() then
						arg_10_0.Message:SetAlpha(1)
					end
				end
			end
		end,
		columnWidth = _1080p * arg_1_0._messageLineWidth,
		measureRow = function(arg_11_0)
			if #arg_1_0.chatMessages > 0 and arg_11_0 < #arg_1_0.chatMessages then
				local var_11_0, var_11_1, var_11_2, var_11_3 = GetTextDimensions(arg_1_0.chatMessages[arg_11_0 + 1].message, arg_1_0._messagesFont, arg_1_0._messageLineHeight, arg_1_0._messageLineWidth)
				local var_11_4 = var_11_1 - var_11_3

				return math.ceil(var_11_4 / arg_1_0._messageLineHeight) * arg_1_0._messageLineHeight * _1080p
			end

			return arg_1_0._messageLineHeight1080p
		end
	}

	var_1_0(var_1_1)

	function arg_1_0.CreateMessagesGrid(arg_12_0, arg_12_1)
		if arg_12_0.messagesGrid then
			arg_12_0.messagesGrid:closeTree()

			arg_12_0.messagesGrid = nil
		end

		assert(arg_12_0.MessagesVerticalScrollbar)

		if arg_12_0.scrollbar then
			arg_12_0.scrollbar:closeTree()

			arg_12_0.scrollbar = nil
		end

		local var_12_0 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = arg_12_0.MessagesVerticalScrollbar,
			startCap = arg_12_0.MessagesVerticalScrollbar.startCap,
			endCap = arg_12_0.MessagesVerticalScrollbar.endCap,
			sliderArea = arg_12_0.MessagesVerticalScrollbar.sliderArea,
			slider = arg_12_0.MessagesVerticalScrollbar.sliderArea and arg_12_0.MessagesVerticalScrollbar.sliderArea.slider,
			fixedSizeSlider = arg_12_0.MessagesVerticalScrollbar.sliderArea and arg_12_0.MessagesVerticalScrollbar.sliderArea.fixedSizeSlider
		})

		var_12_0:SetKBMStyle(true)

		arg_12_0.scrollbar = var_12_0
		var_1_1.maxVisibleRows = arg_12_1

		local var_12_1 = LUI.UIGrid.new(var_1_1)

		var_12_1.id = "messagesGrid"

		var_12_1:SetAnchorsAndPosition(0, 0, 0, 0, 9 * _1080p, -9 * _1080p, 10, -4)
		var_12_1:setUseStencil(true)
		arg_12_0:addElement(var_12_1)

		arg_12_0.messagesGrid = var_12_1

		var_12_1:AddScrollbar(arg_12_0.scrollbar)

		arg_1_0._scrollbarVisibility = true

		arg_12_0.messagesGrid:SetNumChildren(#arg_12_0.chatMessages)
		arg_12_0.messagesGrid:RefreshContent()
	end

	arg_1_0:CreateMessagesGrid(LUI.TextChat.WantedChatLines)

	local function var_1_2(arg_13_0, arg_13_1)
		local var_13_0
		local var_13_1 = LUI.TextChat.ChatChannels[arg_13_0.chatType].color
		local var_13_2 = ""
		local var_13_3 = false
		local var_13_4 = arg_13_0.xuid
		local var_13_5
		local var_13_6 = arg_13_0.gamertag

		if arg_13_0.gamertag ~= "" then
			if arg_13_0.chatType == OnlineChatType.PRIVATE_CHAT then
				local var_13_7 = ""

				if arg_13_0.fullName and arg_13_0.fullName ~= "" then
					var_13_7 = " (" .. arg_13_0.fullName .. ")"
				end

				if arg_13_0.localPlayer and arg_13_0.whisperTarget then
					var_13_2 = Engine.CBBHFCGDIC("LUA_MENU/CHAT_SENT_WHISPER_PREFIX") .. "[" .. arg_13_0.whisperTarget .. var_13_7 .. "] "

					if arg_13_0.whisperTargetXUID and arg_13_0.whisperTargetXUID ~= "0" then
						var_13_4 = arg_13_0.whisperTargetXUID
						var_13_3 = true
					end

					var_13_6 = arg_13_0.whisperTarget
				else
					var_13_2 = "[" .. arg_13_0.gamertag .. var_13_7 .. "] "
				end
			else
				var_13_2 = "[" .. arg_13_0.gamertag .. "] "
			end

			if arg_13_0.chatType == OnlineChatType.PRIVATE_CHAT or arg_13_0.chatType == OnlineChatType.PLAYER_EVENT then
				local var_13_8 = var_13_4

				if Friends.DIIAFCGBDA(arg_1_1, "0", var_13_8) or Social.EAFICEHEHI(var_13_8) then
					var_13_5 = var_13_8
					var_13_4 = Social.BEEDHHIEGB(arg_1_1, var_13_5)
				end
			end
		end

		local var_13_9 = arg_13_1 and (arg_13_0.chatInUse == nil or arg_13_0.chatInUse == false) and Engine.BFBIDEGDFB() + LUI.TextChat.MessagesFadeOutTimeInMs
		local var_13_10

		if not arg_13_0.localPlayer or var_13_3 then
			local var_13_11, var_13_12, var_13_13, var_13_14 = GetTextDimensions(var_13_2, arg_1_0._messagesFont, arg_1_0._messageLineHeight)

			var_13_10 = var_13_13 - var_13_11
		end

		return {
			name = var_13_6,
			nameWidth = var_13_10,
			message = var_13_2 .. arg_13_0.message,
			chatType = arg_13_0.chatType,
			startFadeTime = var_13_9,
			xuid = var_13_4,
			platformId = var_13_5
		}, var_13_1
	end

	function arg_1_0.ScrollListToEnd(arg_14_0)
		arg_14_0.messagesGrid:SetPosition({
			x = 0,
			y = #arg_14_0.chatMessages - 1
		}, true)
	end

	function arg_1_0.SetChatMessages(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = {}
		local var_15_1 = {
			name = "",
			message = "",
			startFadeTime = 0,
			textColor = SWATCHES.BattleNetChat.selfChat
		}
		local var_15_2 = Engine.DBFCJBDJEC() and arg_15_2 and Engine.CAADCDEEIA()
		local var_15_3 = arg_1_0.ShouldSetFadeTimers()

		for iter_15_0 = 1, #arg_15_1 do
			local var_15_4, var_15_5 = var_1_2(arg_15_1[iter_15_0], var_15_3)

			if var_15_2 then
				var_15_4.startFadeTime = -1
				var_15_4.forceHide = true
			end

			table.insert(var_15_0, var_15_4)
		end

		arg_15_0.chatMessages = var_15_0

		arg_15_0.messagesGrid:SetNumChildren(#arg_15_0.chatMessages)
		arg_15_0:ScrollListToEnd()
		arg_15_0.messagesGrid:RefreshContent()
	end

	function arg_1_0.GetLastReceivedMessage(arg_16_0)
		local var_16_0

		if #arg_1_0.chatMessages then
			var_16_0 = arg_1_0.chatMessages[#arg_1_0.chatMessages]
		end

		return var_16_0
	end

	function arg_1_0.AddChatMessage(arg_17_0, arg_17_1)
		local var_17_0, var_17_1 = var_1_2(arg_17_1, arg_1_0.ShouldSetFadeTimers())

		table.insert(arg_17_0.chatMessages, var_17_0)

		local var_17_2 = arg_17_0.messagesGrid:GetFocusPosition(LUI.DIRECTION.vertical)
		local var_17_3 = var_17_2 == nil or var_17_2 >= #arg_17_0.chatMessages - 2

		arg_17_0.messagesGrid:SetNumChildren(#arg_17_0.chatMessages)

		if var_17_3 then
			arg_17_0:ScrollListToEnd()
		end

		arg_17_0.messagesGrid:RefreshContent()

		return var_17_0, var_17_1
	end

	arg_1_0.messagesGrid:SetNumChildren(#arg_1_0.chatMessages)
	arg_1_0.messagesGrid:SetPosition({
		x = 0,
		y = #arg_1_0.chatMessages - 1
	}, true)
	arg_1_0.messagesGrid:RefreshContent()

	function arg_1_0.frame(arg_18_0)
		if not arg_18_0.ShouldSetFadeTimers() then
			return
		end

		local var_18_0 = Engine.BFBIDEGDFB()
		local var_18_1 = arg_18_0.messagesGrid:getFirstChild()

		while var_18_1 do
			local var_18_2 = var_18_1.NameHighlight.currentMessageIndex

			if var_18_2 and var_18_2 > 0 then
				local var_18_3 = arg_18_0.chatMessages[var_18_2]

				if var_18_3.startFadeTime and var_18_3.startFadeTime > 0 and var_18_0 >= var_18_3.startFadeTime then
					var_18_3.startFadeTime = -1

					ACTIONS.AnimateSequence(var_18_1, "FadeOut")
				elseif (var_18_3.startFadeTime == nil or var_18_3.startFadeTime < 0) and (var_18_3.forceHide or var_18_1.Message:GetAlpha() == 1) then
					var_18_3.forceHide = false

					ACTIONS.AnimateSequence(var_18_1, "FadeOut")
				end
			end

			var_18_1 = var_18_1:getNextSibling()
		end
	end

	function arg_1_0.resetMessagesFadeTimerAndUnlock(arg_19_0)
		if arg_19_0.ShouldSetFadeTimers() and #arg_19_0.chatMessages > 0 then
			local var_19_0 = Engine.BFBIDEGDFB() + LUI.TextChat.MessagesFadeOutTimeInMs

			for iter_19_0, iter_19_1 in ipairs(arg_19_0.chatMessages) do
				iter_19_1.startFadeTime = var_19_0
			end
		end
	end

	function arg_1_0.redisplayMessages(arg_20_0)
		arg_20_0:ScrollListToEnd()

		for iter_20_0, iter_20_1 in ipairs(arg_20_0.chatMessages) do
			iter_20_1.startFadeTime = -1
		end

		local var_20_0 = arg_20_0.messagesGrid:getFirstChild()

		while var_20_0 do
			if var_20_0.NameHighlight.currentMessageIndex then
				ACTIONS.AnimateSequence(var_20_0, "FadeIn")
			end

			var_20_0 = var_20_0:getNextSibling()
		end
	end

	function arg_1_0.SetScrollbarWantedVisibility(arg_21_0)
		if arg_1_0._scrollbarVisibility == arg_21_0 then
			return
		end

		if arg_21_0 then
			ACTIONS.AnimateSequence(arg_1_0, "ShowScrollbar")
		else
			ACTIONS.AnimateSequence(arg_1_0, "HideScrollbar")
		end

		arg_1_0._scrollbarVisibility = arg_21_0
	end

	arg_1_0:SetHandleMouseMove(true)
	arg_1_0:addEventHandler("mouseenter", function(arg_22_0, arg_22_1)
		if not arg_22_0._scrollbarVisibility then
			ACTIONS.AnimateSequence(arg_1_0, "ShowScrollbar")
		end
	end)
	arg_1_0:addEventHandler("mouseleave", function(arg_23_0, arg_23_1)
		if not arg_23_0._scrollbarVisibility then
			ACTIONS.AnimateSequence(arg_1_0, "HideScrollbar")
		end
	end)
	arg_1_0:registerEventHandler("gamepad_button", function(arg_24_0, arg_24_1)
		if arg_24_1.qualifier and arg_24_1.qualifier == "gamepad" and (arg_24_1.button == "up" or arg_24_1.button == "down") then
			arg_24_1.qualifier = "mousewheel"
			arg_24_1.forceScrollMove = true

			arg_24_0.messagesGrid:processEvent(arg_24_1)

			return true
		end

		return false
	end)
end

function TextChatEntriesList(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIElement.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 515 * _1080p, 0, 160 * _1080p)

	var_25_0.id = "TextChatEntriesList"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)

	local var_25_2 = var_25_0

	var_25_0:setUseStencil(true)

	local var_25_3
	local var_25_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_25_1
	})

	var_25_4.id = "MessagesVerticalScrollbar"

	var_25_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -10, _1080p * 5, _1080p * 1, _1080p * -4)
	var_25_0:addElement(var_25_4)

	var_25_0.MessagesVerticalScrollbar = var_25_4

	local function var_25_5()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_5

	local var_25_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_4:RegisterAnimationSequence("HideScrollbar", var_25_6)

	local function var_25_7()
		var_25_4:AnimateSequence("HideScrollbar")
	end

	var_25_0._sequences.HideScrollbar = var_25_7

	local var_25_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_4:RegisterAnimationSequence("ShowScrollbar", var_25_8)

	local function var_25_9()
		var_25_4:AnimateSequence("ShowScrollbar")
	end

	var_25_0._sequences.ShowScrollbar = var_25_9

	var_0_0(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("TextChatEntriesList", TextChatEntriesList)
LockTable(_M)
