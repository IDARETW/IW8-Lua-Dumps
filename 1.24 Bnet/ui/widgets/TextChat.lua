module(..., package.seeall)

LUI.TextChat = LUI.Class(LUI.UIElement)
LUI.TextChat.NO_CHAT = OnlineChatType.COUNT
LUI.TextChat.FIRST_VALID_CHAT_INDEX = OnlineChatType.PARTY_CHAT
LUI.TextChat.LAST_VALID_CHAT_INDEX = OnlineChatType.PRIVATE_CHAT

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1.id)
	local var_1_1 = Engine.DCJGJDDEHE()
	local var_1_2 = var_1_1 * (arg_1_0.id - 1) + 1
	local var_1_3 = var_1_2 + var_1_1

	return var_1_0 and var_1_2 <= var_1_0 and var_1_0 < var_1_3
end

LUI.TextChat.ChatChannels = {
	[OnlineChatType.PARTY_CHAT] = {
		color = SWATCHES.BattleNetChat.partyChat,
		name = Engine.CBBHFCGDIC("MENU/CHANNEL_PARTY") .. ":"
	},
	[OnlineChatType.GAME_CHAT] = {
		color = SWATCHES.BattleNetChat.matchChat,
		name = Engine.CBBHFCGDIC("MENU/CHANNEL_MATCH") .. ":"
	},
	[OnlineChatType.TEAM_CHAT] = {
		color = SWATCHES.BattleNetChat.teamChat,
		name = Engine.CBBHFCGDIC("MENU/CHANNEL_TEAM") .. ":"
	},
	[OnlineChatType.CLAN_CHAT] = {
		color = SWATCHES.BattleNetChat.clansChat,
		name = Engine.CBBHFCGDIC("MENU/CHANNEL_REGIMENTS") .. ":"
	},
	[OnlineChatType.PRIVATE_CHAT] = {
		color = SWATCHES.BattleNetChat.whisperChat
	},
	[OnlineChatType.SYSTEM_EVENT] = {
		isStaticId = true,
		name = "SystemEvent",
		id = {
			id = 1
		},
		typeCheckFunction = var_0_0,
		color = SWATCHES.BattleNetChat.systemEvent
	},
	[OnlineChatType.SYSTEM_ERROR] = {
		isStaticId = true,
		name = "Error",
		id = {
			id = 2
		},
		typeCheckFunction = var_0_0,
		color = SWATCHES.BattleNetChat.warningChat
	},
	[OnlineChatType.PLAYER_EVENT] = {
		isStaticId = true,
		name = "PlayerEvent",
		id = {
			id = 3
		},
		typeCheckFunction = var_0_0,
		color = SWATCHES.BattleNetChat.systemEvent
	}
}
LUI.TextChat.DisplayStates = {
	EXPANDED_INACTIVE = 4,
	SINGLE_LINE = 2,
	ALL_LINES = 3,
	NONE = 1
}
LUI.TextChat.Styles = {
	MENU = 1,
	INGAME = 2
}
LUI.TextChat.DisplayStatesSequences = {
	[LUI.TextChat.DisplayStates.NONE] = {
		[LUI.TextChat.Styles.MENU] = {
			anim = ""
		},
		[LUI.TextChat.Styles.INGAME] = {
			anim = ""
		}
	},
	[LUI.TextChat.DisplayStates.SINGLE_LINE] = {
		[LUI.TextChat.Styles.MENU] = {
			noMouseInBody = true,
			anim = {
				"CommonMenu",
				"CollapsedSingle"
			}
		},
		[LUI.TextChat.Styles.INGAME] = {
			noMouseInBody = true,
			anim = "InGameCollapsed"
		}
	},
	[LUI.TextChat.DisplayStates.ALL_LINES] = {
		[LUI.TextChat.Styles.MENU] = {
			anim = {
				"CommonMenu",
				"Expanded"
			}
		},
		[LUI.TextChat.Styles.INGAME] = {
			anim = "InGameExpanded"
		}
	},
	[LUI.TextChat.DisplayStates.EXPANDED_INACTIVE] = {
		[LUI.TextChat.Styles.MENU] = {
			anim = {
				"CommonMenu",
				"ExpandedInactive"
			}
		},
		[LUI.TextChat.Styles.INGAME] = {
			anim = "InGameExpandedInactive"
		}
	}
}
LUI.TextChat.DefaultMinimizedState = LUI.TextChat.DisplayStates.SINGLE_LINE
LUI.TextChat.PrivateChatChannels = {}
LUI.TextChat.WantedChatLines = 8
LUI.TextChat.MessagesFadeOutTimeInMs = 8000
LUI.TextChat.GamepadOpenChatTimeInMs = 1000
LUI.TextChat.CrossplayWarningTimeInMs = 10000
LUI.TextChat.MaxAutocompleteOptions = 6
LUI.TextChat.LastMessageText = nil
LUI.TextChat.LastMessageColor = nil
LUI.TextChat.LastUserSetChannel = LUI.TextChat.NO_CHAT

local function var_0_1(arg_2_0)
	return arg_2_0._chatInactive or MP and MP.IsOffline()
end

local function var_0_2(arg_3_0)
	return arg_3_0 == LUI.TextChat.DisplayStates.ALL_LINES
end

local function var_0_3(arg_4_0)
	return arg_4_0 == OnlineChatType.SYSTEM_EVENT or arg_4_0 == OnlineChatType.SYSTEM_ERROR or arg_4_0 == OnlineChatType.PLAYER_EVENT
end

local function var_0_4(arg_5_0)
	return arg_5_0 == LUI.TextChat.DisplayStates.EXPANDED_INACTIVE
end

local function var_0_5(arg_6_0)
	return arg_6_0 == LUI.TextChat.DisplayStates.ALL_LINES
end

local function var_0_6(arg_7_0)
	return arg_7_0 == LUI.TextChat.DisplayStates.NONE
end

local function var_0_7(arg_8_0)
	return var_0_2(arg_8_0._currentState)
end

local function var_0_8(arg_9_0)
	return var_0_4(arg_9_0._currentState)
end

local function var_0_9(arg_10_0)
	return var_0_5(arg_10_0._currentState)
end

local function var_0_10(arg_11_0)
	return var_0_6(arg_11_0._currentState)
end

local function var_0_11(arg_12_0)
	return var_0_4(arg_12_0) or var_0_2(arg_12_0)
end

local function var_0_12(arg_13_0)
	return var_0_11(arg_13_0._currentState)
end

local function var_0_13(arg_14_0)
	return arg_14_0 ~= nil and arg_14_0 >= LUI.TextChat.FIRST_VALID_CHAT_INDEX and arg_14_0 <= LUI.TextChat.LAST_VALID_CHAT_INDEX
end

local function var_0_14(arg_15_0)
	return var_0_13(arg_15_0._activeChatType)
end

local function var_0_15(arg_16_0)
	return not var_0_1(arg_16_0)
end

local function var_0_16(arg_17_0)
	return arg_17_0 and not arg_17_0.chatOptOut and arg_17_0.chatMinimizedDisplayState ~= LUI.TextChat.DisplayStates.NONE
end

local function var_0_17()
	local var_18_0 = {
		CoD.GetPauseMenu(),
		"OptionsMenuNewLayout",
		"SocialMenu",
		"TrialResults"
	}

	return not LUI.FlowManager.IsAnyInStack(var_18_0) and not Engine.DDJFBBJAIG() and not LUI.HUD.IsChatAllowedInHUD()
end

local function var_0_18(arg_19_0)
	return arg_19_0 and (arg_19_0.chatMinimizedDisplayState or LUI.TextChat.DefaultMinimizedState) or LUI.TextChat.DisplayStates.NONE
end

local function var_0_19(arg_20_0)
	return LUI.TextChat.ChatChannels[arg_20_0].isStaticId
end

local function var_0_20(arg_21_0, arg_21_1)
	if arg_21_0 == nil or arg_21_1 == nil then
		return false
	end

	return arg_21_0.id == arg_21_1.id and arg_21_0.label == arg_21_1.label and arg_21_0.epoch == arg_21_1.epoch
end

local function var_0_21(arg_22_0)
	local function var_22_0()
		local var_23_0, var_23_1, var_23_2 = Friends.DECIABAAIE(arg_22_0._controllerIndex)

		if var_23_2 <= 0 then
			if Engine.CFHBIHABCB(arg_22_0._controllerIndex) then
				Social.CEFBABBCGD(arg_22_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_WELCOME"))
			else
				Social.CEFBABBCGD(arg_22_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_WELCOME_WARZONE"))
			end
		elseif Engine.CFHBIHABCB(arg_22_0._controllerIndex) then
			Social.CEFBABBCGD(arg_22_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_WELCOME_FRIEND", var_23_2))
		else
			Social.CEFBABBCGD(arg_22_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_WELCOME_WARZONE_FRIEND", var_23_2))
		end
	end

	if Engine.FIDIEBFAG(Engine.IJEBHJIJF()) and not Dvar.IBEGCHEFE("QOTNQOSRN") then
		Dvar.DHEGHJJJHI("QOTNQOSRN", true)
		Social.CEFBABBCGD(arg_22_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_WARNING"))

		arg_22_0:Wait(LUI.TextChat.CrossplayWarningTimeInMs).onComplete = function()
			var_22_0()
		end
	else
		var_22_0()
	end
end

local function var_0_22(arg_25_0, arg_25_1)
	if var_0_1(arg_25_0) then
		arg_25_0.CollapsedChatLog.Message:setText(Engine.CBBHFCGDIC("MENU/CHAT_DISABLED"))
	elseif LUI.IsLastInputGamepad(arg_25_1) then
		arg_25_0.CollapsedChatLog.Message:setText(Engine.CBBHFCGDIC("MENU/CHAT_NO_MESSAGES_YET_GAMEPAD"))
	else
		arg_25_0.CollapsedChatLog.Message:setText(Engine.CBBHFCGDIC("MENU/CHAT_NO_MESSAGES_YET"))
	end
end

local function var_0_23(arg_26_0, arg_26_1)
	local var_26_0 = LUI.FlowManager.GetVisibleMenu()
	local var_26_1 = arg_26_0._currentState
	local var_26_2 = arg_26_0._currentStyle

	if arg_26_0.userWantsToType then
		arg_26_0._currentState = LUI.TextChat.DisplayStates.ALL_LINES
	elseif arg_26_0.expandedInactive then
		arg_26_0._currentState = LUI.TextChat.DisplayStates.EXPANDED_INACTIVE
	elseif var_26_0 then
		arg_26_0._currentState = var_0_16(var_26_0) and var_0_18(var_26_0) or LUI.TextChat.DisplayStates.NONE
	else
		local var_26_3 = Engine.DBFFAEEFGJ()

		assert(var_26_3)

		local var_26_4 = var_26_3.hudManager

		if var_26_4 then
			arg_26_0._currentState = (LUI.HUD.IsChatAllowedInHUD() and not LUI.IsLastInputGamepad(arg_26_0._controllerIndex) or LUI.HudManager.ShouldBeVisible(var_26_4) and not arg_26_0._hiddenDueToOverlay) and LUI.TextChat.DefaultMinimizedState or LUI.TextChat.DisplayStates.NONE
		end
	end

	local var_26_5 = var_0_17() and LUI.TextChat.Styles.INGAME or LUI.TextChat.Styles.MENU

	if not (var_26_1 ~= arg_26_0._currentState or var_26_5 ~= arg_26_0._currentStyle) then
		return
	end

	if arg_26_0.userWantsToType then
		arg_26_0.PromptContainer:SetAlpha(1)
	else
		arg_26_0.PromptContainer:SetAlpha(0)
		arg_26_0.TextChatButton:UpdateInputType({
			controllerIndex = arg_26_0._controllerIndex
		})
	end

	arg_26_0:updateDarkenerStatus()

	arg_26_0._currentStyle = var_26_5

	if arg_26_0._currentState == LUI.TextChat.DisplayStates.NONE then
		arg_26_0:SetAlpha(0)
		arg_26_0:SetMouseFocusBlocker(true)
	else
		arg_26_0:SetAlpha(1)
		arg_26_0:SetMouseFocusBlocker(false)
	end

	local var_26_6 = LUI.TextChat.DisplayStatesSequences[arg_26_0._currentState][var_26_5].anim

	if type(var_26_6) ~= "table" then
		var_26_6 = {
			var_26_6
		}
	end

	for iter_26_0, iter_26_1 in ipairs(var_26_6) do
		local var_26_7 = iter_26_1

		if arg_26_0._sequences[var_26_7] then
			ACTIONS.AnimateSequence(arg_26_0, var_26_7)
		end

		if arg_26_0.TextChatFooter._sequences[var_26_7] then
			ACTIONS.AnimateSequence(arg_26_0.TextChatFooter, var_26_7)
		end

		if arg_26_0.TextChatBody._sequences[var_26_7] and arg_26_0.TextChatBody.TextChatEntriesList and arg_26_0.TextChatBody.TextChatEntriesList.sequences then
			local var_26_8 = arg_26_0.TextChatBody.TextChatEntriesList.sequences[var_26_7]

			if var_26_8 then
				local var_26_9 = #var_26_8

				if var_26_8[var_26_9] then
					var_26_8[var_26_9].onComplete = function(arg_27_0)
						LUI.UIGrid.UpdateScrolling(arg_27_0.messagesGrid)
					end
				end
			end

			ACTIONS.AnimateSequence(arg_26_0.TextChatBody, var_26_7)
		end
	end

	if arg_26_0.userWantsToType or arg_26_0.expandedInactive then
		arg_26_0.TextChatBody.TextChatEntriesList:redisplayMessages()
	else
		if var_0_11(var_26_1) then
			if arg_26_0._currentStyle ~= LUI.TextChat.Styles.INGAME then
				arg_26_0.TextChatFooter.InputTextButton:ReturnFocusToMenu()
			end

			arg_26_0.TextChatBody.TextChatEntriesList:resetMessagesFadeTimerAndUnlock()
		end

		arg_26_0.TextChatBody.TextChatEntriesList:ScrollListToEnd()
	end

	arg_26_0.TextChatBody.TextChatEntriesList.SetScrollbarWantedVisibility(arg_26_0.userWantsToType)

	local var_26_10 = var_0_5(arg_26_0._currentState)

	arg_26_0.TextChatFooter:SetMouseFocusBlocker(not var_26_10)
	arg_26_0.TextChatBody:SetMouseFocusBlocker(LUI.TextChat.DisplayStatesSequences[arg_26_0._currentState][var_26_5].noMouseInBody)
	arg_26_0.TextChatButton:SetMouseFocusBlocker(not var_26_10 or var_0_1(arg_26_0) or arg_26_0._currentStyle == LUI.TextChat.Styles.INGAME)
	arg_26_0.CollapsedChatLog:SetMouseFocusBlocker(not var_26_10 or arg_26_0._currentStyle == LUI.TextChat.Styles.INGAME)
	arg_26_0.BackgroundHover:SetMouseFocusBlocker(var_26_10 or arg_26_0._currentStyle == LUI.TextChat.Styles.INGAME)
end

local function var_0_24(arg_28_0)
	if arg_28_0._controllerIndex then
		arg_28_0._chatMouseCursorActive = arg_28_0.userWantsToType

		LUI.UIRoot.SetLuiLayerKeycatch(arg_28_0, arg_28_0._controllerIndex, arg_28_0._chatMouseCursorActive)
	end
end

local function var_0_25(arg_29_0, arg_29_1)
	if arg_29_0.userWantsToType ~= arg_29_1 then
		arg_29_0.userWantsToType = arg_29_1

		var_0_23(arg_29_0)

		if arg_29_0._currentStyle == LUI.TextChat.Styles.INGAME and Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() or arg_29_0._chatMouseCursorActive and not arg_29_0.userWantsToType then
			var_0_24(arg_29_0)
		end
	end
end

local function var_0_26(arg_30_0, arg_30_1)
	if arg_30_0.expandedInactive ~= arg_30_1 then
		arg_30_0.expandedInactive = arg_30_1

		var_0_23(arg_30_0)
	end
end

local function var_0_27(arg_31_0, arg_31_1, arg_31_2)
	if var_0_8(arg_31_0) then
		var_0_26(arg_31_0, false)
	end

	arg_31_0._chatInactive = not arg_31_1

	if LUI.TextChat.LastMessageText == nil then
		var_0_22(arg_31_0, arg_31_2)
	end

	if var_0_1(arg_31_0) then
		arg_31_0.CollapsedChatLog._closeOnClick = true
	else
		arg_31_0.CollapsedChatLog._closeOnClick = false
	end

	arg_31_0.TextChatButton:UpdateInputType({
		controllerIndex = arg_31_2
	})
end

function LUI.TextChat.IsChatVisible(arg_32_0)
	return arg_32_0.chat and arg_32_0.chat._currentState ~= LUI.TextChat.DisplayStates.NONE
end

function StartEditing(arg_33_0, arg_33_1)
	if var_0_1(arg_33_0) then
		var_0_26(arg_33_0, not var_0_8(arg_33_0))

		return true
	else
		local var_33_0 = arg_33_0.TextChatFooter.InputTextButton

		return var_33_0.TryStartEditing(var_33_0, {
			controller = arg_33_1
		})
	end
end

function LUI.TextChat.StartEditing(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.chat

	if not var_34_0 then
		return false
	end

	return StartEditing(var_34_0, arg_34_1)
end

function LUI.TextChat.init(arg_35_0, arg_35_1)
	LUI.TextChat.super.init(arg_35_0)

	arg_35_0.id = "TextChat"

	assert(arg_35_1.controllerIndex)

	arg_35_0._controllerIndex = arg_35_1.controllerIndex
end

function LUI.TextChat.InitLayer(arg_36_0)
	local var_36_0 = MenuBuilder.BuildRegisteredType("TextChat", {
		controllerIndex = arg_36_0._controllerIndex
	})

	var_36_0.id = "chat"

	var_36_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_36_0:addElement(var_36_0)

	arg_36_0.chat = var_36_0
	var_36_0._controllerIndex = arg_36_0._controllerIndex
	var_36_0._currentState = -1
	var_36_0._currentStyle = var_0_17() and LUI.TextChat.Styles.INGAME or LUI.TextChat.Styles.MENU

	var_0_25(var_36_0, false)
end

function LUI.TextChat.ClearLayer(arg_37_0)
	if arg_37_0.scoreboardModel then
		arg_37_0:UnsubscribeFromModel(arg_37_0.scoreboardModel)

		arg_37_0.scoreboardModel = nil
	end

	arg_37_0.chat:closeTree()

	arg_37_0.chat = nil
end

function LUI.TextChat.GetLayer()
	return Engine.DBFFAEEFGJ().textChat
end

function LUI.TextChat.ShouldChangeStyle(arg_39_0)
	local var_39_0 = LUI.TextChat.Styles.MENU

	if LUI.HUD then
		var_39_0 = LUI.HUD.IsChatAllowedInHUD() and LUI.TextChat.Styles.MENU or LUI.TextChat.Styles.INGAME
	end

	return arg_39_0._currentStyle ~= var_39_0
end

function LUI.TextChat.Frame(arg_40_0)
	if not arg_40_0.chat then
		return
	end

	local var_40_0 = false
	local var_40_1 = LUI.FlowManager.GetVisibleMenu()

	if not var_40_1 and Engine.DDJFBBJAIG() then
		var_40_0 = true
	elseif var_40_1 then
		var_40_0 = var_40_0 or not var_0_16(var_40_1)
	else
		local var_40_2 = Engine.DBFFAEEFGJ()

		assert(var_40_2)

		local var_40_3 = var_40_2.hudManager

		if var_40_3 then
			if not arg_40_0.scoreboardModel and Engine.EAAHGICFBD() and DataSources.inGame.HUD.isScoreboardOpen then
				arg_40_0.scoreboardModel = arg_40_0:SubscribeToModel(DataSources.inGame.HUD.isScoreboardOpen:GetModel(arg_40_0._controllerIndex), function(arg_41_0)
					if DataModel.JJEHAEBDF(arg_41_0) then
						arg_40_0.chat._hiddenDueToOverlay = true
					else
						arg_40_0.chat._hiddenDueToOverlay = false
					end
				end, true)
			end

			local var_40_4 = LUI.HudManager.ShouldBeVisible(var_40_3)

			var_40_0 = (var_40_0 or not var_40_4) and (not LUI.HUD.IsChatAllowedInHUD() or LUI.IsLastInputGamepad(arg_40_0._controllerIndex))
		end
	end

	if not var_0_7(arg_40_0.chat) or var_0_10(arg_40_0.chat) ~= var_40_0 or LUI.TextChat.ShouldChangeStyle(arg_40_0.chat) then
		var_0_23(arg_40_0.chat)
	end

	arg_40_0.chat.TextChatBody.TextChatEntriesList.frame(arg_40_0.chat.TextChatBody.TextChatEntriesList)

	if Lobby.GFFECBCCF() and not Dvar.IBEGCHEFE("NLKQPLPLQK") then
		Dvar.DHEGHJJJHI("NLKQPLPLQK", true)
		var_0_21(arg_40_0)
	end
end

function LUI.TextChat.ShouldBeVisible(arg_42_0)
	if not Dvar.IBEGCHEFE("LKSKPKTOON") then
		return false
	elseif Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_42_0._controllerIndex) and not Dvar.IBEGCHEFE("NQOMTKMNPT") then
		return false
	elseif Engine.CDFCHEJJE(arg_42_0._controllerIndex) then
		return false
	elseif CODCASTER_CONDITIONS.IsMPCODCaster() or MLG.DBIBHEAEGD() then
		return false
	end

	local var_42_0 = true
	local var_42_1 = Engine.DBFFAEEFGJ()

	if var_42_1 and var_42_1.flowManager then
		var_42_0 = not LUI.FlowManager.AreMainMenuFencedOut(var_42_1.flowManager)
	end

	if Engine.DDJFBBJAIG() then
		local var_42_2 = Engine.IJEBHJIJF()

		if var_42_2 ~= arg_42_0._controllerIndex then
			arg_42_0._controllerIndex = var_42_2
		end
	elseif Engine.IJEBHJIJF() ~= arg_42_0._controllerIndex then
		return false
	end

	return var_42_0
end

function LUI.TextChat.RefreshChatState()
	local var_43_0 = LUI.TextChat.GetLayer()

	if var_43_0 and var_43_0.chat then
		var_0_23(var_43_0.chat)
	end
end

function LUI.TextChat.SetupMenuForNoChat(arg_44_0)
	arg_44_0.chatMinimizedDisplayState = LUI.TextChat.DisplayStates.NONE
end

function LUI.TextChat.SetupMenuForNoLine(arg_45_0)
	LUI.TextChat.SetupMenuForSingleLine(arg_45_0)
end

function LUI.TextChat.SetupMenuForSingleLine(arg_46_0)
	arg_46_0.chatMinimizedDisplayState = LUI.TextChat.DisplayStates.SINGLE_LINE
end

function LUI.TextChat.SetupScreenForMenuChat(arg_47_0)
	LUI.TextChat.SetupMenuForSingleLine(arg_47_0)
	LUI.HUD.AllowChatInHUD()
	arg_47_0:addEventHandler("on_close", function(arg_48_0, arg_48_1)
		LUI.HUD.DisallowChatInHUD()
	end)
end

function LUI.TextChat.TrapsInput(arg_49_0, arg_49_1)
	if not arg_49_0.chat then
		return false
	end

	local var_49_0, var_49_1 = LUI.TextChat.InputsTrappedOrInteresting(arg_49_0, arg_49_1)

	return var_49_0 or var_49_1
end

function LUI.TextChat.InputsTrappedOrInteresting(arg_50_0, arg_50_1)
	if Engine.CAADCDEEIA() then
		return false, false
	end

	local var_50_0 = false
	local var_50_1 = false

	if var_0_7(arg_50_0.chat) then
		var_50_0 = true
	elseif not var_0_10(arg_50_0.chat) then
		if arg_50_0.chat._currentStyle ~= LUI.TextChat.Styles.INGAME then
			var_50_1 = arg_50_1.button == "select"
		end

		if LUI.IsLastInputKeyboardMouse(arg_50_1.controller) then
			var_50_1 = var_50_1 or arg_50_1.button == "open_chat" or arg_50_1.button == "open_match_chat" or arg_50_1.button == "open_team_chat" or arg_50_1.button == "open_party_chat"
		end
	end

	return var_50_0, var_50_1
end

local function var_0_28(arg_51_0)
	if var_0_7(arg_51_0) then
		var_0_26(arg_51_0, false)
		var_0_25(arg_51_0, false)
		Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
		arg_51_0.TextChatFooter.InputTextButton.TextEditOff()

		arg_51_0.m_rightMouseDown = nil
		arg_51_0.m_leftMouseDown = nil
	end

	return true
end

local function var_0_29(arg_52_0, arg_52_1, arg_52_2)
	if var_0_3(arg_52_1) then
		return
	end

	local var_52_0 = SWATCHES.BattleNetChat.whisperChat
	local var_52_1 = ""

	if arg_52_2 then
		var_52_1 = arg_52_2 .. ":"
	elseif arg_52_1 and LUI.TextChat.ChatChannels[arg_52_1] and LUI.TextChat.ChatChannels[arg_52_1].name then
		var_52_1 = LUI.TextChat.ChatChannels[arg_52_1].name
		var_52_0 = LUI.TextChat.ChatChannels[arg_52_1].color
	else
		arg_52_0.TextChatFooter.CurrentChannel:setText("")
	end

	arg_52_0.TextChatFooter.CurrentChannel:setText(var_52_1)
	arg_52_0.TextChatFooter.CurrentChannel:SetRGBFromTable(var_52_0)

	local var_52_2, var_52_3, var_52_4, var_52_5 = GetTextDimensions(var_52_1, FONTS.GetFont(FONTS.BattleNetRegular.File), 20 * _1080p)
	local var_52_6 = var_52_4 - var_52_2 + 3

	arg_52_0.TextChatFooter.CurrentChannel:SetRight(arg_52_0.TextChatFooter._currentChannelInitialLeft + var_52_6)
	arg_52_0.TextChatFooter.InputTextButton:SetLeft(var_52_6 + arg_52_0.TextChatFooter._currentChannelInitialLeft)
end

local function var_0_30(arg_53_0, arg_53_1, arg_53_2)
	if arg_53_1 == OnlineChatType.PRIVATE_CHAT then
		local var_53_0 = LUI.TextChat.PrivateChatChannels[arg_53_2.id]

		if var_53_0 then
			arg_53_0._activeChatID = var_53_0.id
			arg_53_0._activeChatType = OnlineChatType.PRIVATE_CHAT

			if var_53_0.name == "" then
				local var_53_1 = Social.BBFEJIEGJG(var_53_0.id, OnlineChatType.PRIVATE_CHAT)

				for iter_53_0, iter_53_1 in ipairs(var_53_1) do
					if iter_53_1.gamertag and not iter_53_1.localPlayer then
						var_53_0.name = iter_53_1.gamertag

						break
					end
				end
			end

			var_0_29(arg_53_0, arg_53_0._activeChatType, var_53_0.name)
		else
			return false
		end
	else
		arg_53_0._activeChatID = LUI.TextChat.ChatChannels[arg_53_1] and LUI.TextChat.ChatChannels[arg_53_1].id or nil
		arg_53_0._activeChatType = arg_53_1

		var_0_29(arg_53_0, arg_53_0._activeChatType)
	end

	Dvar.BDEHAEGHAF("LQPKMLTOQM", arg_53_0._activeChatID and arg_53_0._activeChatID.id or "")
	Dvar.DFIJDJFIFD("MOOOOTKPTL", arg_53_0._activeChatType)

	return true
end

function LUI.TextChat.GetActiveChannelCount()
	local var_54_0 = 0

	for iter_54_0, iter_54_1 in ipairs(LUI.TextChat.ChatChannels) do
		if iter_54_1.id ~= nil and not iter_54_1.isStaticId then
			var_54_0 = var_54_0 + 1
		end
	end

	for iter_54_2, iter_54_3 in pairs(LUI.TextChat.PrivateChatChannels) do
		if iter_54_3.id ~= nil then
			var_54_0 = var_54_0 + 1
		end
	end

	return var_54_0
end

function LUI.TextChat.InitiateWhisperWithXUID(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	if arg_55_2 ~= "" then
		local var_55_0 = arg_55_2
		local var_55_1 = {
			label = 0,
			epoch = 0,
			id = var_55_0
		}
		local var_55_2 = Friends.CADJIDDGA(arg_55_1)

		if var_55_2 and var_55_2.count > 0 then
			for iter_55_0, iter_55_1 in ipairs(var_55_2.friends) do
				if iter_55_1.xuid == arg_55_2 then
					arg_55_3 = iter_55_1.gamertag

					break
				end
			end
		end

		Social.HGFFAFCDI(arg_55_1, arg_55_2, arg_55_3, true)

		if not arg_55_0 then
			local var_55_3 = Engine.DBFFAEEFGJ()

			arg_55_0 = var_55_3 and var_55_3.textChat.chat
		end

		if arg_55_0.chat then
			arg_55_0 = arg_55_0.chat
		end

		var_0_30(arg_55_0, OnlineChatType.PRIVATE_CHAT, var_55_1)
	end
end

local function var_0_31(arg_56_0, arg_56_1)
	local var_56_0 = var_0_15(arg_56_0)

	if LUI.TextChat.ChatChannels[arg_56_1].id ~= nil and var_56_0 then
		var_0_30(arg_56_0, arg_56_1)

		return true
	else
		return not var_56_0
	end
end

local var_0_32 = {
	{
		names = {
			"/t",
			"/team"
		},
		autocompleteListString = "/t " .. Engine.CBBHFCGDIC("LUA_MENU/TEAM_CHAT_HINT"),
		execute = function(arg_57_0, arg_57_1)
			if var_0_31(arg_57_0, OnlineChatType.TEAM_CHAT) then
				return true
			else
				return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_TEAM")
			end
		end
	},
	{
		names = {
			"/m",
			"/match"
		},
		autocompleteListString = "/m " .. Engine.CBBHFCGDIC("LUA_MENU/MATCH_CHAT_HINT"),
		execute = function(arg_58_0, arg_58_1)
			if var_0_31(arg_58_0, OnlineChatType.GAME_CHAT) then
				return true
			else
				return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_MATCH")
			end
		end
	},
	{
		names = {
			"/p",
			"/party"
		},
		autocompleteListString = "/p " .. Engine.CBBHFCGDIC("LUA_MENU/PARTY_CHAT_HINT"),
		execute = function(arg_59_0, arg_59_1)
			if var_0_31(arg_59_0, OnlineChatType.PARTY_CHAT) then
				return true
			else
				return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_PARTY")
			end
		end
	},
	{
		secondParamListType = "friends",
		names = {
			"/w",
			"/whisper"
		},
		autocompleteListString = "/w " .. Engine.CBBHFCGDIC("LUA_MENU/WHISPER_CHAT_HINT"),
		execute = function(arg_60_0, arg_60_1, arg_60_2)
			if #arg_60_2 < 2 then
				return true
			end

			local var_60_0 = arg_60_2[2]
			local var_60_1

			if arg_60_0._lastFirstParameterMetadata then
				var_60_1 = arg_60_0._lastFirstParameterMetadata.xuid
			else
				local var_60_2 = Social.CEAACEBEBG(arg_60_1, var_60_0)

				if #var_60_2 > 0 then
					if #var_60_2 == 1 then
						var_60_1 = var_60_2[1].xuid or var_60_2[1].xuidString
					else
						return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_MULTIPLE_PLAYERS")
					end
				end
			end

			if var_60_1 ~= nil then
				LUI.TextChat.InitiateWhisperWithXUID(self, arg_60_1, var_60_1, var_60_0)
			else
				return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_PLAYER_NOT_FOUND")
			end

			return true
		end,
		getFirstParamsList = function(arg_61_0, arg_61_1)
			local var_61_0 = {}
			local var_61_1 = Friends.CADJIDDGA(arg_61_0)

			if var_61_1 and var_61_1.count > 0 then
				for iter_61_0, iter_61_1 in ipairs(var_61_1.friends) do
					local var_61_2 = iter_61_1.xuid

					if iter_61_1.platformId ~= "0" then
						var_61_2 = iter_61_1.platformId
					end

					table.insert(var_61_0, {
						name = arg_61_1 .. iter_61_1.gamertag,
						displayName = iter_61_1.gamertag,
						xuid = var_61_2
					})
				end
			end

			return var_61_0
		end
	},
	{
		names = {
			"/r",
			"/reply"
		},
		autocompleteListString = "/r " .. Engine.CBBHFCGDIC("LUA_MENU/REPLY_CHAT_HINT"),
		execute = function(arg_62_0, arg_62_1, arg_62_2)
			if arg_62_0._replyTargetChatId == nil then
				return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NO_REPLY_TARGET")
			end

			if not var_0_30(arg_62_0, OnlineChatType.PRIVATE_CHAT, arg_62_0._replyTargetChatId) then
				return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_REPLY_FAILED")
			end

			return true
		end
	}
}

local function var_0_33(arg_63_0, arg_63_1, arg_63_2)
	assert(arg_63_0.TextChatFooter)
	assert(arg_63_0.TextChatFooter.InputTextButton)
	assert(arg_63_0.TextChatBody)
	assert(arg_63_0.TextChatBody.TextChatEntriesList)

	arg_63_0._lastInputText = ""

	if not Engine.BBHAECABBD(arg_63_1) then
		arg_63_1 = Engine.IJEBHJIJF()
	end

	arg_63_0._controllerIndex = arg_63_1
	arg_63_0._chatInactive = not not Engine.CDFCHEJJE(arg_63_1) or not Engine.BECCFCBIAA("textChatEnabled", arg_63_1)
	arg_63_0._isArabic = IsLanguageArabic()

	if not Engine.CGABICJHAI() then
		LUI.TextChat.DefaultMinimizedState = LUI.TextChat.DisplayStates.SINGLE_LINE
	end

	local var_63_0
	local var_63_1 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_63_1
	})

	var_63_1.id = "ButtonHelperBar"

	var_63_1.Background:SetAlpha(0, 0)
	var_63_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1020, _1080p * 1080)
	arg_63_0:addElement(var_63_1)

	arg_63_0.ButtonHelperBar = var_63_1

	arg_63_0.PromptContainer:SetAlignment(LUI.Alignment.Right)
	arg_63_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		gamepad_only = true,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE"),
		container = arg_63_0.PromptContainer
	})
	arg_63_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		button_ref2 = "button_shoulderr",
		gamepad_only = true,
		button_ref = "button_shoulderl",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CHANNELS"),
		container = arg_63_0.PromptContainer
	})

	function arg_63_0.updateDarkenerStatus(arg_64_0, arg_64_1)
		local var_64_0 = true

		if var_0_7(arg_64_0) and arg_64_0._controllerIndex and LUI.IsLastInputGamepad(arg_64_0._controllerIndex) then
			var_64_0 = (not Engine.DDJFBBJAIG() or false) and var_0_17()
		end

		ACTIONS.AnimateSequence(arg_64_0, var_64_0 and "HideDarkener" or "ShowDarkener")
	end

	arg_63_0:registerAndCallEventHandler("update_input_type", arg_63_0.updateDarkenerStatus)

	local function var_63_2(arg_65_0, arg_65_1)
		local var_65_0 = arg_65_0._activeChatType
		local var_65_1 = var_65_0
		local var_65_2

		if var_65_0 == OnlineChatType.PRIVATE_CHAT then
			local var_65_3 = false

			for iter_65_0, iter_65_1 in pairs(LUI.TextChat.PrivateChatChannels) do
				if var_65_3 then
					var_65_2 = iter_65_1.id

					break
				elseif iter_65_1.id == arg_65_0._activeChatID then
					var_65_3 = true
				end
			end
		end

		local var_65_4 = false

		while not var_65_2 do
			var_65_1 = var_65_1 + 1

			if var_65_1 > LUI.TextChat.LAST_VALID_CHAT_INDEX then
				if var_65_4 then
					return
				end

				var_65_4 = true
				var_65_1 = LUI.TextChat.FIRST_VALID_CHAT_INDEX
			end

			if var_65_1 == var_65_0 then
				var_65_2 = arg_65_0._activeChatID
			elseif var_65_1 == OnlineChatType.PRIVATE_CHAT then
				for iter_65_2, iter_65_3 in pairs(LUI.TextChat.PrivateChatChannels) do
					var_65_2 = iter_65_3.id

					break
				end
			else
				var_65_2 = LUI.TextChat.ChatChannels[var_65_1].id and var_0_13(var_65_1)
			end
		end

		if arg_65_1 then
			LUI.TextChat.LastUserSetChannel = var_65_1
		end

		var_0_30(arg_65_0, var_65_1, var_65_2)
	end

	local function var_63_3(arg_66_0, arg_66_1)
		local var_66_0 = arg_66_0._activeChatType
		local var_66_1 = var_66_0
		local var_66_2
		local var_66_3 = false

		if var_66_0 == OnlineChatType.PRIVATE_CHAT then
			local var_66_4

			for iter_66_0, iter_66_1 in pairs(LUI.TextChat.PrivateChatChannels) do
				if iter_66_1.id == arg_66_0._activeChatID then
					var_66_2 = var_66_4

					break
				else
					var_66_4 = iter_66_1.id
				end
			end
		end

		while not var_66_2 do
			var_66_1 = var_66_1 - 1

			if var_66_1 < LUI.TextChat.FIRST_VALID_CHAT_INDEX then
				if var_66_3 then
					return
				end

				var_66_3 = true
				var_66_1 = LUI.TextChat.LAST_VALID_CHAT_INDEX
			end

			if var_66_1 == var_66_0 then
				var_66_2 = arg_66_0._activeChatID
			elseif var_66_1 == OnlineChatType.PRIVATE_CHAT then
				for iter_66_2, iter_66_3 in pairs(LUI.TextChat.PrivateChatChannels) do
					var_66_2 = iter_66_3.id
				end
			else
				var_66_2 = LUI.TextChat.ChatChannels[var_66_1].id and var_0_13(var_66_1)
			end
		end

		if arg_66_1 then
			LUI.TextChat.LastUserSetChannel = var_66_1
		end

		var_0_30(arg_66_0, var_66_1, var_66_2)
	end

	arg_63_0:addEventHandler("text_chat_updated", function(arg_67_0, arg_67_1)
		var_0_27(arg_67_0, arg_67_1.active and not Engine.CDFCHEJJE(arg_63_1), arg_67_1.controller)

		return true
	end)
	arg_63_0:addEventHandler("text_edit_tab_pressed", function(arg_68_0, arg_68_1)
		if not var_0_10(arg_68_0) then
			var_63_2(arg_68_0, true)
		end
	end)
	arg_63_0:SetHandleMouseButton(true)
	arg_63_0:addEventHandler("minimize_chat", var_0_28)

	local function var_63_4(arg_69_0)
		local var_69_0 = {}

		for iter_69_0, iter_69_1 in pairs(OnlineChatType) do
			if OnlineChatType.COUNT ~= iter_69_1 then
				local var_69_1 = Social.CAHAEIIBJJ(iter_69_1)

				for iter_69_2 = 1, #var_69_1 do
					table.insert(var_69_0, var_69_1[iter_69_2])
				end
			end
		end

		table.sort(var_69_0, function(arg_70_0, arg_70_1)
			if arg_70_0.receivedTimeInt == arg_70_1.receivedTimeInt then
				return arg_70_0.chatType < arg_70_1.chatType
			end

			return arg_70_0.receivedTimeInt < arg_70_1.receivedTimeInt
		end)
		arg_63_0.TextChatBody.TextChatEntriesList:SetChatMessages(var_69_0, arg_69_0)

		local var_69_2 = arg_63_0.TextChatBody.TextChatEntriesList:GetLastReceivedMessage()

		if var_69_2 then
			LUI.TextChat.LastMessageText = var_69_2.message
			LUI.TextChat.LastMessageColor = LUI.TextChat.ChatChannels[var_69_2.chatType].color
		else
			LUI.TextChat.LastMessageText = nil
		end
	end

	local function var_63_5(arg_71_0, arg_71_1)
		if arg_71_1 == "/StartTest" then
			if not arg_71_0.debugTestTimer then
				arg_71_0.debugTestTimer = LUI.UITimer.new({
					interval = 2000,
					event = {
						name = "debugTestTimer"
					}
				})
				arg_71_0.debugTestTimerNb = 1

				arg_71_0:addElement(arg_71_0.debugTestTimer)
				arg_71_0:registerEventHandler("debugTestTimer", function(arg_72_0, arg_72_1)
					if arg_72_0.debugTestTimerNb then
						Social.ECAJABJEHB(arg_72_0._controllerIndex, arg_72_0._activeChatID, arg_72_0._activeChatType, "Test " .. arg_72_0.debugTestTimerNb)

						arg_72_0.debugTestTimerNb = arg_72_0.debugTestTimerNb + 1
					end
				end)
			end
		elseif arg_71_1 == "/StopTest" and arg_71_0.debugTestTimer then
			arg_71_0.debugTestTimer:closeTree()

			arg_71_0.debugTestTimer = nil
		end
	end

	local function var_63_6()
		if arg_63_0._autoCompleteList == nil or #arg_63_0._autoCompleteList > 0 then
			arg_63_0._autoCompleteList = {}
		end

		for iter_73_0, iter_73_1 in ipairs(var_0_32) do
			table.insert(arg_63_0._autoCompleteList, {
				names = iter_73_1.names,
				displayName = iter_73_1.autocompleteListString,
				clickCallback = iter_73_1.execute,
				getFirstParamsList = iter_73_1.getFirstParamsList
			})
		end
	end

	local function var_63_7()
		if arg_63_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer then
			arg_63_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:closeTree()

			arg_63_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer = nil
		end
	end

	local function var_63_8()
		arg_63_0._lastInputText = ""
		arg_63_0._lastAutocompledText = nil

		var_63_7()
	end

	local function var_63_9(arg_76_0)
		local var_76_0 = {
			string.match(arg_76_0, "(.-)%s(.*)")
		}

		if #var_76_0 == 0 then
			table.insert(var_76_0, arg_76_0)
		end

		return var_76_0
	end

	local function var_63_10(arg_77_0, arg_77_1)
		local var_77_0 = true
		local var_77_1 = var_63_9(arg_77_0)
		local var_77_2 = false

		for iter_77_0, iter_77_1 in ipairs(var_0_32) do
			for iter_77_2, iter_77_3 in ipairs(iter_77_1.names) do
				if iter_77_3 == var_77_1[1] then
					if iter_77_1.secondParamListType and #var_77_1 < 2 then
						if not arg_77_1 then
							arg_63_0.TextChatFooter.InputTextButton.textEdit:setTextEditText(iter_77_3 .. " ")
						end

						return
					else
						assert(iter_77_1.execute)

						local var_77_3, var_77_4 = iter_77_1.execute(arg_63_0, arg_63_1, var_77_1)

						if not var_77_3 and var_77_4 then
							Social.BEFGJDEHCF(arg_63_1, var_77_4)
						end
					end

					var_77_2 = true

					break
				end
			end

			if var_77_2 then
				break
			end
		end

		if not var_77_2 then
			Social.BEFGJDEHCF(arg_63_1, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_INVALID_CMD"))
		end

		if var_77_0 then
			var_63_8()
			arg_63_0.TextChatFooter.InputTextButton.textEdit:setTextEditText("")
			arg_63_0.TextChatBody.TextChatEntriesList:ScrollListToEnd()

			return true
		end

		return false
	end

	local function var_63_11(arg_78_0)
		var_63_7()

		if #arg_78_0 == 0 then
			return
		end

		local var_78_0 = #arg_78_0 > LUI.TextChat.MaxAutocompleteOptions and LUI.TextChat.MaxAutocompleteOptions or #arg_78_0
		local var_78_1 = 0
		local var_78_2 = LUI.UIVerticalList.new({
			adjustSizeToContent = true,
			ignoreStretchingChildren = true,
			verticalAlignment = LUI.Alignment.Bottom
		})

		var_78_2:SetSpacing(0)

		for iter_78_0 = 1, var_78_0 do
			local var_78_3 = MenuBuilder.BuildRegisteredType("TextChatAutocompleteListItem", {
				controllerIndex = arg_63_1
			})

			var_78_3:SetLeftAnchor(0)
			var_78_3:SetRightAnchor(0)
			var_78_2:addElement(var_78_3)
			var_78_3:SetHandleMouse(true)
			var_78_3:SetFocusable(true)
			var_78_3:addEventHandler("mouseenter", function()
				arg_63_0:setFocus(true)
			end)
			var_78_3:addEventHandler("mouseleave", function()
				arg_63_0:setFocus(false)
			end)
			var_78_3:addEventHandler("leftmouseup", function(arg_81_0, arg_81_1)
				arg_63_0._lastAutocompledText = arg_78_0[iter_78_0].names and arg_78_0[iter_78_0].names[1] or arg_78_0[iter_78_0].name
				arg_63_0._lastFirstParameterMetadata = arg_78_0[iter_78_0]

				var_63_10(arg_63_0._lastAutocompledText)

				return true
			end)
			var_78_3:addEventHandler("button_over", function(arg_82_0, arg_82_1)
				if arg_82_1.controller or arg_82_1.focusType == 0 then
					arg_63_0._lastAutocompledText = arg_78_0[iter_78_0].names and arg_78_0[iter_78_0].names[1] or arg_78_0[iter_78_0].name
					arg_63_0._lastFirstParameterMetadata = arg_78_0[iter_78_0]

					arg_63_0.TextChatFooter.InputTextButton.textEdit:setTextEditText(arg_63_0._lastAutocompledText, true)
				end
			end)
			var_78_3.name:setText(arg_78_0[iter_78_0].displayName)

			local var_78_4, var_78_5, var_78_6, var_78_7 = GetTextDimensions(arg_78_0[iter_78_0].displayName, FONTS.GetFont(FONTS.BattleNetRegular.File), 20 * _1080p)
			local var_78_8 = var_78_6 - var_78_4

			if var_78_1 < var_78_8 then
				var_78_1 = var_78_8
			end
		end

		local var_78_9 = MenuBuilder.BuildRegisteredType("TextChatAutocompleteList", {
			controllerIndex = arg_63_1
		})

		arg_63_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer = var_78_9

		arg_63_0.TextChatFooter.InputTextButton:addElement(var_78_9)

		arg_63_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer.List = var_78_2

		arg_63_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:addElement(var_78_2)

		local var_78_10 = 5 * _1080p

		var_78_2:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_78_9:SetAnchorsAndPosition(0, 0, 0, 0.9, -var_78_10 * 2, 0, -var_78_10 * 3 - 21.5 * var_78_0 * _1080p, -var_78_10)
		var_78_2:SetDefaultFocus(1)
		var_78_2:processEvent({
			name = "gain_focus",
			controllerIndex = arg_63_1
		})
	end

	local function var_63_12(arg_83_0, arg_83_1)
		local var_83_0
		local var_83_1
		local var_83_2
		local var_83_3 = false
		local var_83_4 = 0
		local var_83_5 = {}
		local var_83_6 = var_63_9(arg_83_0)

		for iter_83_0, iter_83_1 in ipairs(arg_63_0._autoCompleteList) do
			for iter_83_2, iter_83_3 in ipairs(iter_83_1.names) do
				local var_83_7, var_83_8 = string.find(iter_83_3, var_83_6[1], 0, true)

				if var_83_7 == 1 and var_83_7 ~= nil then
					if var_83_0 == nil then
						var_83_0 = iter_83_3
						var_83_3 = var_83_8 == string.len(iter_83_3)
					end

					table.insert(var_83_5, iter_83_1)

					var_83_4 = var_83_4 + 1

					break
				end
			end

			if var_83_4 >= LUI.TextChat.MaxAutocompleteOptions then
				break
			end
		end

		if #var_83_5 > 0 and var_83_3 and var_83_5[1].getFirstParamsList then
			if string.len(arg_83_0) > string.len(var_83_0) then
				local var_83_9 = var_83_5[1].getFirstParamsList(arg_63_1, var_83_0 .. " ")
				local var_83_10 = 0

				var_83_5 = {}

				if var_83_9 then
					local var_83_11 = var_83_6[2] and var_83_6[2] or ""

					for iter_83_4, iter_83_5 in ipairs(var_83_9) do
						local var_83_12, var_83_13 = string.find(iter_83_5.displayName, var_83_11, 0, true)

						if var_83_12 == 1 and var_83_12 ~= nil then
							table.insert(var_83_5, iter_83_5)

							if var_83_1 == nil then
								var_83_1 = iter_83_5.name
								var_83_2 = iter_83_5
							end

							var_83_10 = var_83_10 + 1
						end

						if var_83_10 >= LUI.TextChat.MaxAutocompleteOptions then
							break
						end
					end
				end

				if var_83_1 then
					var_83_0 = var_83_1
				end
			end
		else
			arg_63_0._lastFirstParameterMetadata = nil
		end

		if var_83_0 and arg_83_1 then
			if string.len(var_83_0) > string.len(arg_83_0) then
				arg_63_0.TextChatFooter.InputTextButton.textEdit:setTextEditText(var_83_0, true)
			end

			arg_63_0._lastAutocompledText = var_83_0
			arg_63_0._lastFirstParameterMetadata = var_83_2
		else
			arg_63_0._lastAutocompledText = nil
			arg_63_0._lastFirstParameterMetadata = nil
		end

		var_63_11(var_83_5)
	end

	function arg_63_0.TextChatFooter.InputTextButton.isTypingCallbackFunc(arg_84_0, arg_84_1)
		if arg_84_1 == nil or arg_63_0._lastInputExecuted then
			arg_84_1 = ""
			arg_63_0._lastInputExecuted = false

			var_63_8()
		else
			var_63_12(arg_84_1, string.len(arg_63_0._lastInputText) < string.len(arg_84_1))
		end

		arg_63_0._lastInputText = arg_84_1

		arg_63_0.TextChatFooter.InputTextButton:UpdateInputHintText({
			controllerIndex = arg_63_1
		})
	end

	arg_63_0:addEventHandler("text_edit_space_bar_pressed", function(arg_85_0, arg_85_1)
		if arg_63_0._lastAutocompledText == arg_63_0._lastInputText then
			local var_85_0 = var_63_10(arg_63_0._lastAutocompledText, true)

			arg_63_0._lastInputExecuted = var_85_0
		end

		return true
	end)

	function arg_63_0.TextChatFooter.InputTextButton.textEditCompleteCallbackFunc(arg_86_0, arg_86_1, arg_86_2)
		if arg_86_0 then
			arg_63_0.TextChatFooter.InputTextButton.textEdit:setTextEditText("")
			var_63_7()
			var_0_28(arg_63_0)

			return
		end

		if Engine.ECAJCAJJGF() then
			local var_86_0, var_86_1, var_86_2, var_86_3, var_86_4 = Social.CJCJIAEGDH(arg_63_0._controllerIndex)

			if var_86_0 then
				Social.CEFBABBCGD(arg_63_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_BANNED", var_86_1, var_86_2, var_86_3, var_86_4))

				return
			end
		end

		if arg_63_0.TextChatFooter.InputTextButton._commandsModeActive then
			var_63_10(arg_86_1)

			if Engine.BHICADFIHA() then
				var_63_5(arg_63_0, arg_86_1)
			end
		else
			if arg_63_0._activeChatID and arg_63_0._activeChatType ~= LUI.TextChat.NO_CHAT then
				if arg_86_1 ~= "" then
					Social.ECAJABJEHB(arg_63_0._controllerIndex, arg_63_0._activeChatID, arg_63_0._activeChatType, arg_86_1)

					if arg_63_0._activeChatType == OnlineChatType.PARTY_CHAT then
						local var_86_5 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")

						if var_86_5 and var_86_5:GetValue() <= 1 then
							Social.BEFGJDEHCF(arg_63_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_SOLO_PARTY"))
						end
					end
				end
			elseif arg_86_1 ~= "" then
				if LUI.IsLastInputGamepad(arg_63_0._controllerIndex) then
					Social.CEFBABBCGD(arg_63_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NO_CHANNEL_GAMEPAD"))
				else
					Social.CEFBABBCGD(arg_63_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NO_CHANNEL"))
				end
			end

			if arg_86_2 then
				arg_63_0.TextChatFooter.InputTextButton.TextEditOff()
			elseif var_0_17() or arg_86_1 == "" then
				arg_63_0.TextChatFooter.InputTextButton.TextEditOff()
				Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
				var_0_25(arg_63_0, false)
			end

			var_63_8()
			arg_63_0.TextChatFooter.InputTextButton.textEdit:setTextEditText("")
			arg_63_0.TextChatBody.TextChatEntriesList:ScrollListToEnd()
		end
	end

	function arg_63_0.TextChatBody.TextChatEntriesList.ShouldSetFadeTimers()
		return not var_0_12(arg_63_0)
	end

	function arg_63_0.TextChatBody.TextChatEntriesList.MessagesShouldFade()
		return arg_63_0._currentStyle == LUI.TextChat.Styles.INGAME and not var_0_12(arg_63_0)
	end

	function arg_63_0.TextChatFooter.InputTextButton.buttonActionCallbackFunc()
		Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailOpen)
		var_0_25(arg_63_0, true)
	end

	local var_63_13 = {
		{
			button_ref = "button_home",
			keyprompt_text = "[{chatmodelastused}]",
			helper_text = Engine.CBBHFCGDIC("MENU/PRESS_TO_CHAT")
		}
	}
	local var_63_14 = {
		promptsData = var_63_13
	}

	arg_63_0.BackgroundHover:AddTooltipData(arg_63_1, var_63_14)

	local function var_63_15(arg_90_0, arg_90_1, arg_90_2)
		local var_90_0 = arg_90_0.CollapsedChatLog

		if arg_90_1 == "" or arg_90_1 == nil then
			var_0_22(arg_90_0, arg_63_1)
			var_90_0.Message:SetRGBFromTable(COLORS.grey128)
			var_90_0.Message:SetAlignment(LUI.Alignment.Center)
		else
			var_90_0.Message:setText(arg_90_1)
			var_90_0.Message:SetRGBFromTable(arg_90_2)

			if LUI.TextChat.LastMessageText == nil then
				var_90_0.Message:SetAlignment(LUI.Alignment.Left)
			end
		end

		LUI.TextChat.LastMessageText = arg_90_1
		LUI.TextChat.LastMessageColor = arg_90_2
	end

	arg_63_0:addEventHandler("lui_social_received_message", function(arg_91_0, arg_91_1)
		if arg_91_1.isTransmitted then
			if arg_91_1.chatId == 0 then
				return true
			end

			arg_91_1.chatInUse = var_0_12(arg_91_0)

			local var_91_0, var_91_1 = arg_91_0.TextChatBody.TextChatEntriesList:AddChatMessage(arg_91_1)

			var_63_15(arg_91_0, var_91_0.message, var_91_1)

			if arg_91_1.chatType == OnlineChatType.PRIVATE_CHAT and not arg_91_1.localPlayer then
				arg_91_0._replyTargetChatId = arg_91_1.chatId
			end

			if arg_91_1.localPlayer and arg_91_1.chatType >= OnlineChatType.PARTY_CHAT then
				METRICS.TextChatUsageSendDLogEvent(arg_63_0._controllerIndex)
			end
		elseif arg_91_1.isThrottled then
			Social.BEFGJDEHCF(arg_91_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/MESSAGE_SENDING_THROTTLED"))
		else
			Social.BEFGJDEHCF(arg_91_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/MESSAGE_SENDING_FAILED"))
		end

		return true
	end)
	arg_63_0:addEventHandler("lui_social_member_added", function(arg_92_0, arg_92_1)
		if not arg_92_1.localPlayer then
			local var_92_0 = LUI.TextChat.PrivateChatChannels[arg_92_1.chatId.id]

			if var_92_0 then
				local var_92_1 = split(arg_92_1.gamertag, "#")

				if var_92_1 and #var_92_1 > 0 then
					arg_92_1.gamertag = var_92_1[1]
				end

				var_92_0.name = arg_92_1.gamertag

				if var_0_20(arg_63_0._activeChatID, arg_92_1.chatId) then
					var_0_30(arg_63_0, arg_63_0._activeChatType, arg_63_0._activeChatID)
				end
			end
		end

		return true
	end)

	local function var_63_16(arg_93_0, arg_93_1)
		local var_93_0 = false

		if arg_93_1.chatType ~= OnlineChatType.PRIVATE_CHAT then
			if not var_0_19(arg_93_1.chatType) then
				if arg_93_1.chatType == OnlineChatType.TEAM_CHAT and Engine.EAIICIFIFA() then
					arg_63_0.TextChatFooter.InputTextButton:UpdateInputHintText({
						controllerIndex = arg_63_1
					})

					return true
				end

				LUI.TextChat.ChatChannels[arg_93_1.chatType].id = arg_93_1.chatId
				var_93_0 = LUI.TextChat.LastUserSetChannel == arg_93_1.chatType or arg_63_0._activeChatType == arg_93_1.chatType
			end
		elseif LUI.TextChat.PrivateChatChannels[arg_93_1.chatId.id] == nil then
			local var_93_1 = {
				id = arg_93_1.chatId,
				name = arg_93_1.chatName or ""
			}

			LUI.TextChat.PrivateChatChannels[arg_93_1.chatId.id] = var_93_1

			if arg_93_1.initiatedChat then
				var_0_30(arg_63_0, OnlineChatType.PRIVATE_CHAT, arg_93_1.chatId)
			end
		end

		if not var_93_0 and (arg_63_0._activeChatType == OnlineChatType.PARTY_CHAT or arg_63_0._alreadyAvoidedEmptyPartyChat) then
			local var_93_2 = arg_63_0._alreadyAvoidedEmptyPartyChat

			if not var_93_2 then
				local var_93_3 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")

				var_93_2 = var_93_3 and var_93_3:GetValue() <= 1
			end

			if var_93_2 then
				arg_63_0._alreadyAvoidedEmptyPartyChat = true

				if arg_93_1.chatType == OnlineChatType.TEAM_CHAT then
					var_93_0 = true
				elseif arg_93_1.chatType == OnlineChatType.GAME_CHAT and arg_63_0._activeChatType ~= OnlineChatType.TEAM_CHAT then
					var_93_0 = true
				end
			end
		end

		if var_93_0 or not var_0_14(arg_63_0) and var_0_13(arg_93_1.chatType) then
			var_0_30(arg_63_0, arg_93_1.chatType, arg_93_1.chatId)
		end

		arg_63_0.TextChatFooter.InputTextButton:UpdateInputHintText({
			controllerIndex = arg_63_1
		})

		return true
	end

	arg_63_0:addEventHandler("lui_social_channel_added", var_63_16)
	arg_63_0:addEventHandler("lui_social_channel_removed", function(arg_94_0, arg_94_1)
		local var_94_0 = -1

		if LUI.TextChat.PrivateChatChannels[arg_94_1.chatId.id] then
			var_94_0 = arg_94_1.chatId
		else
			var_94_0 = LUI.TextChat.ChatChannels[arg_94_1.chatType].id
		end

		if var_94_0 ~= nil and var_0_20(var_94_0, arg_94_1.chatId) then
			LUI.TextChat.ChatChannels[arg_94_1.chatType].id = nil

			Dvar.BDEHAEGHAF("LQPKMLTOQM", "")
			Dvar.DFIJDJFIFD("MOOOOTKPTL", LUI.TextChat.NO_CHAT)

			arg_63_0._activeChatID = nil
			arg_63_0._activeChatType = LUI.TextChat.NO_CHAT

			var_63_2(arg_94_0, false)
			var_63_4(false)

			if arg_63_0._activeChatType == LUI.TextChat.NO_CHAT then
				var_0_30(arg_94_0, LUI.TextChat.NO_CHAT, nil)
			end

			var_63_15(arg_63_0, LUI.TextChat.LastMessageText, LUI.TextChat.LastMessageColor, false)
		end

		arg_63_0.TextChatFooter.InputTextButton:UpdateInputHintText({
			controllerIndex = arg_63_1
		})

		return true
	end)
	arg_63_0:addEventHandler("lui_social_game_changed", function(arg_95_0, arg_95_1)
		local var_95_0 = arg_95_1.clientProgramID
		local var_95_1 = FRIENDS.BattleNetGameInfo[var_95_0] and FRIENDS.BattleNetGameInfo[var_95_0].name

		if var_95_1 and var_95_1 ~= "" then
			local var_95_2 = Engine.CBBHFCGDIC(var_95_1)

			if var_95_2 ~= "" and arg_95_1.controller and arg_95_1.platformId then
				Social.DAFDEJICJJ(arg_95_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_STARTED_PLAYING", var_95_2), arg_95_1.platformId, arg_95_1.friendName)
			end
		end
	end)
	arg_63_0:addEventHandler("clans_notification", function(arg_96_0, arg_96_1)
		local var_96_0 = arg_96_1.options

		if var_96_0.genEventName == "clans_happy_hour_updated" then
			if var_96_0.success then
				Social.CEFBABBCGD(arg_63_1, FRIENDS.GetHappyHourSetTimeString(arg_63_1, var_96_0.clanId))
			end
		elseif var_96_0.genEventName == "clans_happy_hour_start" then
			if var_96_0.success then
				Social.CEFBABBCGD(arg_63_1, Engine.CBBHFCGDIC("REGIMENTS/HAPPY_HOUR_START"))
			end
		elseif var_96_0.genEventName == "clans_happy_hour_end" and var_96_0.success then
			Social.CEFBABBCGD(arg_63_1, Engine.CBBHFCGDIC("REGIMENTS/HAPPY_HOUR_END"))
		end
	end)

	local function var_63_17(arg_97_0, arg_97_1)
		local var_97_0 = LUI.FlowManager.GetVisibleMenu()

		if var_97_0 then
			if arg_97_0.TextChatFooter.InputTextButton.topMenuStates[var_97_0.id] == nil then
				arg_97_0.TextChatFooter.InputTextButton.topMenuStates[var_97_0.id] = var_97_0:saveState()
			end

			if LUI.IsLastInputGamepad(arg_97_1.controller) then
				var_97_0:processEvent({
					name = "lose_focus"
				})
				var_97_0:processEvent({
					dispatchChildren = true,
					name = "popup_active"
				})
			end
		else
			return false
		end

		StartEditing(arg_97_0, arg_97_1.controller)

		return true
	end

	local function var_63_18(arg_98_0, arg_98_1)
		if var_0_10(arg_98_0) or not LUI.IsLastInputGamepad(arg_98_1.controller) then
			return false
		end

		local var_98_0 = var_0_12(arg_98_0)

		if not var_98_0 and arg_98_0._currentStyle == LUI.TextChat.Styles.INGAME then
			return false
		end

		if var_0_1(arg_98_0) and var_98_0 then
			if arg_98_1.button == "secondary" then
				var_0_26(arg_98_0, false)
			else
				return true
			end
		end

		local var_98_1 = var_98_0

		if arg_98_1.button == "select" and not var_98_0 and arg_98_1.down then
			var_98_1 = var_63_17(arg_98_0, arg_98_1)
		elseif var_98_0 and arg_98_1.down then
			if arg_98_1.button == "primary" and not Engine.CGABICJHAI() then
				arg_98_0.TextChatFooter.InputTextButton:openVirtualKeyboard(arg_98_1)
			elseif arg_98_1.button == "secondary" or arg_98_1.button == "select" then
				arg_63_0.TextChatFooter.InputTextButton.TextEditOff()
				var_0_25(arg_98_0, false)
				Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
			elseif arg_98_1.button == "shoulderr" then
				var_63_2(arg_98_0, true)
			elseif arg_98_1.button == "shoulderl" then
				var_63_3(arg_98_0, true)
			elseif arg_98_1.button == "rs_up" then
				arg_98_0.TextChatBody:processEvent(arg_98_1)
			elseif arg_98_1.button == "rs_down" then
				arg_98_0.TextChatBody:processEvent(arg_98_1)
			elseif arg_98_1.button == "up" then
				arg_98_0.TextChatBody:processEvent(arg_98_1)
			elseif arg_98_1.button == "down" then
				arg_98_0.TextChatBody:processEvent(arg_98_1)
			end
		end

		return var_98_1
	end

	local function var_63_19(arg_99_0, arg_99_1)
		if arg_99_1.button == "open_chat" or arg_99_1.button == "kp_enter" then
			return StartEditing(arg_99_0, arg_99_1.controller)
		elseif arg_99_1.button == "open_match_chat" then
			if not var_0_31(arg_99_0, OnlineChatType.GAME_CHAT) then
				Social.BEFGJDEHCF(arg_99_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_LOBBY"))
			end

			return StartEditing(arg_99_0, arg_99_1.controller)
		elseif arg_99_1.button == "open_team_chat" then
			if not var_0_31(arg_99_0, OnlineChatType.TEAM_CHAT) then
				Social.BEFGJDEHCF(arg_99_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_TEAM"))
			end

			return StartEditing(arg_99_0, arg_99_1.controller)
		elseif arg_99_1.button == "open_party_chat" then
			if not var_0_31(arg_99_0, OnlineChatType.PARTY_CHAT) then
				Social.BEFGJDEHCF(arg_99_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_PARTY"))
			end

			return StartEditing(arg_99_0, arg_99_1.controller)
		elseif arg_99_1.button == "open_clan_chat" then
			if not var_0_31(arg_99_0, OnlineChatType.CLAN_CHAT) then
				Social.BEFGJDEHCF(arg_99_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_CLAN"))
			end

			return StartEditing(arg_99_0, arg_99_1.controller)
		elseif arg_99_1.button == "up" or arg_99_1.button == "down" then
			local var_99_0 = var_0_12(arg_99_0)

			if var_99_0 and arg_99_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer and not arg_99_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:processEvent(arg_99_1) then
				arg_99_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:processEvent({
					name = "gain_focus",
					controllerIndex = arg_99_1.controller
				})
			end

			return var_99_0
		elseif arg_99_1.button == "secondary" and var_0_8(arg_99_0) and var_0_1(arg_99_0) then
			var_0_26(arg_99_0, false)

			return true
		elseif not var_0_17() and var_0_8(arg_99_0) and var_0_1(arg_99_0) then
			return true
		end
	end

	function LUI.TextChat.processEvent(arg_100_0, arg_100_1)
		if arg_100_0.chat then
			if arg_100_1.name == "gamepad_button" then
				if arg_100_1.controller == arg_100_0._controllerIndex then
					if arg_100_1.qualifier == "gamepad" or arg_100_1.qualifier == "dpad" then
						return var_63_18(arg_100_0.chat, arg_100_1)
					elseif arg_100_1.down and arg_100_1.qualifier == "keyboard" and not var_0_10(arg_100_0.chat) then
						return var_63_19(arg_100_0.chat, arg_100_1)
					end
				elseif var_0_12(arg_100_0.chat) then
					return true
				end
			elseif arg_100_1.name == "pause" and var_0_8(arg_100_0.chat) then
				var_0_26(arg_100_0.chat, false)

				return true
			else
				return LUI.TextChat.super.processEvent(arg_100_0, arg_100_1)
			end
		else
			return false
		end
	end

	local function var_63_20(arg_101_0, arg_101_1)
		if arg_101_1.inside then
			if var_0_1(arg_63_0) then
				var_0_26(arg_63_0, not var_0_8(arg_63_0))
			elseif not var_0_7(arg_63_0) then
				arg_63_0.TextChatFooter.InputTextButton.TryStartEditing(arg_63_0.TextChatFooter.InputTextButton, arg_101_1)
			elseif arg_101_0._closeOnClick then
				arg_63_0.TextChatFooter.InputTextButton.TextEditOff()
				Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
				var_0_25(arg_63_0, false)
			end
		end
	end

	arg_63_0.TextChatButton:SetHandleMouse(true)

	arg_63_0.TextChatButton._closeOnClick = true

	arg_63_0.TextChatButton:SetMouseFocusBlocker(true)
	arg_63_0.TextChatButton:addEventHandler("leftmouseup", var_63_20)
	arg_63_0.CollapsedChatLog:SetHandleMouse(true)
	arg_63_0.CollapsedChatLog:SetMouseFocusBlocker(true)
	arg_63_0.CollapsedChatLog:addEventHandler("leftmouseup", var_63_20)
	arg_63_0.CollapsedChatLog.Message:SetLeft(0)
	arg_63_0.CollapsedChatLog.Message:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	arg_63_0.CollapsedChatLog.Message:SetUseEllipses(ELLIPSES.enabled)

	arg_63_0.userWantsToType = nil
	arg_63_0.expandedInactive = nil
	arg_63_0._currentState = -1
	arg_63_0._currentStyle = var_0_17() and LUI.TextChat.Styles.INGAME or LUI.TextChat.Styles.MENU

	var_0_25(arg_63_0, false)

	local var_63_21 = Dvar.DHEEJCCJBH("LQPKMLTOQM")
	local var_63_22 = Dvar.CFHDGABACF("MOOOOTKPTL") or LUI.TextChat.NO_CHAT

	var_0_30(arg_63_0, var_63_22, var_63_21 ~= "" and {
		id = var_63_21
	} or nil)

	local var_63_23 = Social.CJADDJHDGH()

	for iter_63_0 = 1, #var_63_23 do
		var_63_16(nil, var_63_23[iter_63_0])
	end

	if not var_0_14(arg_63_0) then
		var_63_2(arg_63_0, false)
	end

	var_63_4(Engine.CAADCDEEIA())
	var_63_15(arg_63_0, LUI.TextChat.LastMessageText, LUI.TextChat.LastMessageColor, false)
	arg_63_0.BackgroundHover:SetHandleMouse(true)
	arg_63_0.BackgroundHover:addEventHandler("mouseenter", function(arg_102_0, arg_102_1)
		ACTIONS.AnimateSequence(arg_63_0, "ButtonAndFieldHover")
	end)
	arg_63_0.BackgroundHover:addEventHandler("mouseleave", function(arg_103_0, arg_103_1)
		ACTIONS.AnimateSequence(arg_63_0, "ButtonAndFieldOut")
	end)
	arg_63_0.BackgroundHover:addEventHandler("leftmouseup", var_63_20)

	local function var_63_24(arg_104_0, arg_104_1)
		arg_104_0.TextChatBody.TextChatEntriesList.SetScrollbarWantedVisibility(arg_104_0.userWantsToType)

		if LUI.TextChat.LastMessageText == nil then
			var_0_22(arg_104_0, arg_104_1.controllerIndex)
		end
	end

	var_0_27(arg_63_0, not arg_63_0._chatInactive, arg_63_1)
	arg_63_0:addAndCallEventHandler("update_input_type", var_63_24, {
		controllerIndex = arg_63_1
	})
	var_63_6()

	if CONDITIONS.InGame() then
		ACTIONS.ScaleFullscreen(arg_63_0)
	end

	ACTIONS.ScaleFullscreen(arg_63_0.Darkener)
end

function TextChat(arg_105_0, arg_105_1)
	local var_105_0 = LUI.UIElement.new()

	var_105_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_105_0.id = "TextChat"
	var_105_0._animationSets = var_105_0._animationSets or {}
	var_105_0._sequences = var_105_0._sequences or {}

	local var_105_1 = arg_105_1 and arg_105_1.controllerIndex

	if not var_105_1 and not Engine.DDJFBBJAIG() then
		var_105_1 = var_105_0:getRootController()
	end

	assert(var_105_1)

	local var_105_2 = var_105_0
	local var_105_3
	local var_105_4 = LUI.UIImage.new()

	var_105_4.id = "Darkener"

	var_105_4:SetRGBFromInt(0, 0)
	var_105_4:SetAlpha(0, 0)
	var_105_0:addElement(var_105_4)

	var_105_0.Darkener = var_105_4

	local var_105_5
	local var_105_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_105_1
	})

	var_105_6.id = "BackgroundHover"

	var_105_6:SetAlpha(0, 0)
	var_105_6.Text:SetLeft(_1080p * 20, 0)
	var_105_6.Text:setText(ToUpperCase(""), 0)
	var_105_6.Text:SetAlignment(LUI.Alignment.Left)
	var_105_6:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -578, _1080p * -76, _1080p * -57, _1080p * -17)
	var_105_0:addElement(var_105_6)

	var_105_0.BackgroundHover = var_105_6

	local var_105_7
	local var_105_8 = LUI.UIImage.new()

	var_105_8.id = "CollapsedChatLogBacker"

	var_105_8:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_105_8:SetAlpha(0.5, 0)
	var_105_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -535, _1080p * -87, _1080p * -52, _1080p * -22)
	var_105_0:addElement(var_105_8)

	var_105_0.CollapsedChatLogBacker = var_105_8

	local var_105_9
	local var_105_10 = MenuBuilder.BuildRegisteredType("TextChatEntryLine", {
		controllerIndex = var_105_1
	})

	var_105_10.id = "CollapsedChatLog"

	var_105_10:SetAlpha(0, 0)
	var_105_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -526, _1080p * -86, _1080p * -49, _1080p * -25)
	var_105_0:addElement(var_105_10)

	var_105_0.CollapsedChatLog = var_105_10

	local var_105_11
	local var_105_12 = MenuBuilder.BuildRegisteredType("TextChatBody", {
		controllerIndex = var_105_1
	})

	var_105_12.id = "TextChatBody"

	var_105_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -546, _1080p * -76, _1080p * -243, _1080p * -57)
	var_105_0:addElement(var_105_12)

	var_105_0.TextChatBody = var_105_12

	local var_105_13
	local var_105_14 = LUI.UIImage.new()

	var_105_14.id = "TextChatFooterInGameBacker"

	var_105_14:SetRGBFromTable(SWATCHES.genericButton.textFocusAlt, 0)
	var_105_14:SetAlpha(0, 0)
	var_105_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -76, _1080p * -546, _1080p * -731, _1080p * -677)
	var_105_0:addElement(var_105_14)

	var_105_0.TextChatFooterInGameBacker = var_105_14

	local var_105_15
	local var_105_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_105_17 = LUI.UIBorder.new(var_105_16)

	var_105_17.id = "TextChatInGameBorder"

	var_105_17:SetRGBFromTable(SWATCHES.CAC.button, 0)
	var_105_17:SetAlpha(0, 0)
	var_105_17:SetBorderThicknessTop(_1080p * 0, 0)
	var_105_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -566, _1080p * -96, _1080p * 302, _1080p * 356)
	var_105_0:addElement(var_105_17)

	var_105_0.TextChatInGameBorder = var_105_17

	local var_105_18
	local var_105_19 = MenuBuilder.BuildRegisteredType("TextChatFooter", {
		controllerIndex = var_105_1
	})

	var_105_19.id = "TextChatFooter"

	var_105_19:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -536, _1080p * -86, _1080p * -53, _1080p * -21)
	var_105_0:addElement(var_105_19)

	var_105_0.TextChatFooter = var_105_19

	local var_105_20
	local var_105_21 = MenuBuilder.BuildRegisteredType("TextChatButton", {
		controllerIndex = var_105_1
	})

	var_105_21.id = "TextChatButton"

	var_105_21:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -572, _1080p * -542, _1080p * -52, _1080p * -22)
	var_105_0:addElement(var_105_21)

	var_105_0.TextChatButton = var_105_21

	local var_105_22
	local var_105_23 = LUI.UIStyledText.new()

	var_105_23.id = "InactiveChatMessage"

	var_105_23:SetRGBFromInt(8093827, 0)
	var_105_23:SetAlpha(0, 0)
	var_105_23:setText(Engine.CBBHFCGDIC("MENU/CHAT_DISABLED"), 0)
	var_105_23:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_105_23:SetAlignment(LUI.Alignment.Center)
	var_105_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_105_23:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -525, _1080p * -96, _1080p * -47, _1080p * -27)
	var_105_0:addElement(var_105_23)

	var_105_0.InactiveChatMessage = var_105_23

	local var_105_24
	local var_105_25 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_105_1
	})

	var_105_25.id = "PromptContainer"

	if CONDITIONS.AlwaysFalse(var_105_0) then
		var_105_25.Label:setText("ButtonPrompt", 0)
	end

	var_105_25:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -600, _1080p * -112, _1080p * -298, _1080p * -267)
	var_105_0:addElement(var_105_25)

	var_105_0.PromptContainer = var_105_25

	local var_105_26
	local var_105_27 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "wdg_circle_progressbar_back_rim",
		segmentCount = 2,
		controllerIndex = var_105_1
	}
	local var_105_28 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_105_27)

	var_105_28.id = "RadialProgressBarelement"

	var_105_28:SetProgress(0)
	var_105_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1344, _1080p * 1382, _1080p * 1022, _1080p * 1058)
	var_105_0:addElement(var_105_28)

	var_105_0.RadialProgressBarelement = var_105_28

	local var_105_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_6:RegisterAnimationSequence("DefaultSequence", var_105_29)

	local var_105_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		}
	}

	var_105_8:RegisterAnimationSequence("DefaultSequence", var_105_30)

	local var_105_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -526
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		}
	}

	var_105_10:RegisterAnimationSequence("DefaultSequence", var_105_31)

	local var_105_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -546
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_12:RegisterAnimationSequence("DefaultSequence", var_105_32)

	local var_105_33 = {
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

	var_105_14:RegisterAnimationSequence("DefaultSequence", var_105_33)

	local var_105_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_17:RegisterAnimationSequence("DefaultSequence", var_105_34)

	local var_105_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		}
	}

	var_105_19:RegisterAnimationSequence("DefaultSequence", var_105_35)

	local var_105_36 = {
		{
			value = 7985663,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("DefaultSequence", var_105_36)

	local var_105_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -525
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_105_23:RegisterAnimationSequence("DefaultSequence", var_105_37)

	local function var_105_38()
		var_105_6:AnimateSequence("DefaultSequence")
		var_105_8:AnimateSequence("DefaultSequence")
		var_105_10:AnimateSequence("DefaultSequence")
		var_105_12:AnimateSequence("DefaultSequence")
		var_105_14:AnimateSequence("DefaultSequence")
		var_105_17:AnimateSequence("DefaultSequence")
		var_105_19:AnimateSequence("DefaultSequence")
		var_105_21:AnimateSequence("DefaultSequence")
		var_105_23:AnimateSequence("DefaultSequence")
	end

	var_105_0._sequences.DefaultSequence = var_105_38

	local var_105_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		}
	}

	var_105_6:RegisterAnimationSequence("Expanded", var_105_39)

	local var_105_40 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.evenStripe
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -535
		}
	}

	var_105_8:RegisterAnimationSequence("Expanded", var_105_40)

	local var_105_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
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

	var_105_10:RegisterAnimationSequence("Expanded", var_105_41)

	local var_105_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -57
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -546
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
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

	var_105_12:RegisterAnimationSequence("Expanded", var_105_42)

	local var_105_43 = {
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

	var_105_14:RegisterAnimationSequence("Expanded", var_105_43)

	local var_105_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_17:RegisterAnimationSequence("Expanded", var_105_44)

	local var_105_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -21
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

	var_105_19:RegisterAnimationSequence("Expanded", var_105_45)

	local var_105_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		}
	}

	var_105_21:RegisterAnimationSequence("Expanded", var_105_46)

	local var_105_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -525
		}
	}

	var_105_23:RegisterAnimationSequence("Expanded", var_105_47)

	local var_105_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -298
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -267
		}
	}

	var_105_25:RegisterAnimationSequence("Expanded", var_105_48)

	local function var_105_49()
		var_105_6:AnimateSequence("Expanded")
		var_105_8:AnimateSequence("Expanded")
		var_105_10:AnimateSequence("Expanded")
		var_105_12:AnimateSequence("Expanded")
		var_105_14:AnimateSequence("Expanded")
		var_105_17:AnimateSequence("Expanded")
		var_105_19:AnimateSequence("Expanded")
		var_105_21:AnimateSequence("Expanded")
		var_105_23:AnimateSequence("Expanded")
		var_105_25:AnimateSequence("Expanded")
	end

	var_105_0._sequences.Expanded = var_105_49

	local var_105_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_6:RegisterAnimationSequence("InGameExpanded", var_105_50)

	local var_105_51 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -107
		}
	}

	var_105_8:RegisterAnimationSequence("InGameExpanded", var_105_51)

	local var_105_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -506
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		}
	}

	var_105_10:RegisterAnimationSequence("InGameExpanded", var_105_52)

	local var_105_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -566
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_12:RegisterAnimationSequence("InGameExpanded", var_105_53)

	local var_105_54 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -566
		}
	}

	var_105_14:RegisterAnimationSequence("InGameExpanded", var_105_54)

	local var_105_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -566
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_105_17:RegisterAnimationSequence("InGameExpanded", var_105_55)

	local var_105_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 345
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_19:RegisterAnimationSequence("InGameExpanded", var_105_56)

	local var_105_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("InGameExpanded", var_105_57)

	local var_105_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -546
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -116
		}
	}

	var_105_23:RegisterAnimationSequence("InGameExpanded", var_105_58)

	local var_105_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -665
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -635
		}
	}

	var_105_25:RegisterAnimationSequence("InGameExpanded", var_105_59)

	local function var_105_60()
		var_105_6:AnimateSequence("InGameExpanded")
		var_105_8:AnimateSequence("InGameExpanded")
		var_105_10:AnimateSequence("InGameExpanded")
		var_105_12:AnimateSequence("InGameExpanded")
		var_105_14:AnimateSequence("InGameExpanded")
		var_105_17:AnimateSequence("InGameExpanded")
		var_105_19:AnimateSequence("InGameExpanded")
		var_105_21:AnimateSequence("InGameExpanded")
		var_105_23:AnimateSequence("InGameExpanded")
		var_105_25:AnimateSequence("InGameExpanded")
	end

	var_105_0._sequences.InGameExpanded = var_105_60

	local var_105_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_6:RegisterAnimationSequence("InGameCollapsed", var_105_61)

	local var_105_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		}
	}

	var_105_8:RegisterAnimationSequence("InGameCollapsed", var_105_62)

	local var_105_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -526
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		}
	}

	var_105_10:RegisterAnimationSequence("InGameCollapsed", var_105_63)

	local var_105_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -566
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_12:RegisterAnimationSequence("InGameCollapsed", var_105_64)

	local var_105_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -566
		}
	}

	var_105_14:RegisterAnimationSequence("InGameCollapsed", var_105_65)

	local var_105_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -566
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_105_17:RegisterAnimationSequence("InGameCollapsed", var_105_66)

	local var_105_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 344
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_19:RegisterAnimationSequence("InGameCollapsed", var_105_67)

	local var_105_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("InGameCollapsed", var_105_68)

	local var_105_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -116
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_23:RegisterAnimationSequence("InGameCollapsed", var_105_69)

	local var_105_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -665
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -635
		}
	}

	var_105_25:RegisterAnimationSequence("InGameCollapsed", var_105_70)

	local function var_105_71()
		var_105_6:AnimateSequence("InGameCollapsed")
		var_105_8:AnimateSequence("InGameCollapsed")
		var_105_10:AnimateSequence("InGameCollapsed")
		var_105_12:AnimateSequence("InGameCollapsed")
		var_105_14:AnimateSequence("InGameCollapsed")
		var_105_17:AnimateSequence("InGameCollapsed")
		var_105_19:AnimateSequence("InGameCollapsed")
		var_105_21:AnimateSequence("InGameCollapsed")
		var_105_23:AnimateSequence("InGameCollapsed")
		var_105_25:AnimateSequence("InGameCollapsed")
	end

	var_105_0._sequences.InGameCollapsed = var_105_71

	local var_105_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_6:RegisterAnimationSequence("CollapsedSingle", var_105_72)

	local var_105_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		}
	}

	var_105_8:RegisterAnimationSequence("CollapsedSingle", var_105_73)

	local var_105_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -526
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
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

	var_105_10:RegisterAnimationSequence("CollapsedSingle", var_105_74)

	local var_105_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -57
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -546
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_12:RegisterAnimationSequence("CollapsedSingle", var_105_75)

	local var_105_76 = {
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

	var_105_14:RegisterAnimationSequence("CollapsedSingle", var_105_76)

	local var_105_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_17:RegisterAnimationSequence("CollapsedSingle", var_105_77)

	local var_105_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
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

	var_105_19:RegisterAnimationSequence("CollapsedSingle", var_105_78)

	local var_105_79 = {
		{
			value = 7042423,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("CollapsedSingle", var_105_79)

	local var_105_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -525
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_105_23:RegisterAnimationSequence("CollapsedSingle", var_105_80)

	local var_105_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -267
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -298
		}
	}

	var_105_25:RegisterAnimationSequence("CollapsedSingle", var_105_81)

	local function var_105_82()
		var_105_6:AnimateSequence("CollapsedSingle")
		var_105_8:AnimateSequence("CollapsedSingle")
		var_105_10:AnimateSequence("CollapsedSingle")
		var_105_12:AnimateSequence("CollapsedSingle")
		var_105_14:AnimateSequence("CollapsedSingle")
		var_105_17:AnimateSequence("CollapsedSingle")
		var_105_19:AnimateSequence("CollapsedSingle")
		var_105_21:AnimateSequence("CollapsedSingle")
		var_105_23:AnimateSequence("CollapsedSingle")
		var_105_25:AnimateSequence("CollapsedSingle")
	end

	var_105_0._sequences.CollapsedSingle = var_105_82

	local var_105_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -57
		}
	}

	var_105_6:RegisterAnimationSequence("CommonMenu", var_105_83)

	local var_105_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.overText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		}
	}

	var_105_8:RegisterAnimationSequence("CommonMenu", var_105_84)

	local var_105_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -526
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

	var_105_10:RegisterAnimationSequence("CommonMenu", var_105_85)

	local var_105_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -546
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_105_12:RegisterAnimationSequence("CommonMenu", var_105_86)

	local var_105_87 = {
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

	var_105_14:RegisterAnimationSequence("CommonMenu", var_105_87)

	local var_105_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_17:RegisterAnimationSequence("CommonMenu", var_105_88)

	local var_105_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -21
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

	var_105_19:RegisterAnimationSequence("CommonMenu", var_105_89)

	local var_105_90 = {
		{
			value = 7042423,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("CommonMenu", var_105_90)

	local var_105_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -525
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_105_23:RegisterAnimationSequence("CommonMenu", var_105_91)

	local var_105_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -298
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -267
		}
	}

	var_105_25:RegisterAnimationSequence("CommonMenu", var_105_92)

	local function var_105_93()
		var_105_6:AnimateSequence("CommonMenu")
		var_105_8:AnimateSequence("CommonMenu")
		var_105_10:AnimateSequence("CommonMenu")
		var_105_12:AnimateSequence("CommonMenu")
		var_105_14:AnimateSequence("CommonMenu")
		var_105_17:AnimateSequence("CommonMenu")
		var_105_19:AnimateSequence("CommonMenu")
		var_105_21:AnimateSequence("CommonMenu")
		var_105_23:AnimateSequence("CommonMenu")
		var_105_25:AnimateSequence("CommonMenu")
	end

	var_105_0._sequences.CommonMenu = var_105_93

	local var_105_94 = {
		{
			value = 7042423,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_21:RegisterAnimationSequence("ButtonAndFieldHover", var_105_94)

	local function var_105_95()
		var_105_21:AnimateSequence("ButtonAndFieldHover")
	end

	var_105_0._sequences.ButtonAndFieldHover = var_105_95

	local var_105_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_105_21:RegisterAnimationSequence("ButtonAndFieldOut", var_105_96)

	local function var_105_97()
		var_105_21:AnimateSequence("ButtonAndFieldOut")
	end

	var_105_0._sequences.ButtonAndFieldOut = var_105_97

	local var_105_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_21:RegisterAnimationSequence("ButtonAndFieldUpDisabled", var_105_98)

	local function var_105_99()
		var_105_21:AnimateSequence("ButtonAndFieldUpDisabled")
	end

	var_105_0._sequences.ButtonAndFieldUpDisabled = var_105_99

	local var_105_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 7985663,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_105_21:RegisterAnimationSequence("ButtonAndFieldEnabled", var_105_100)

	local function var_105_101()
		var_105_21:AnimateSequence("ButtonAndFieldEnabled")
	end

	var_105_0._sequences.ButtonAndFieldEnabled = var_105_101

	local var_105_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_21:RegisterAnimationSequence("ButtonAndFieldHoverDisabled", var_105_102)

	local function var_105_103()
		var_105_21:AnimateSequence("ButtonAndFieldHoverDisabled")
	end

	var_105_0._sequences.ButtonAndFieldHoverDisabled = var_105_103

	local var_105_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_21:RegisterAnimationSequence("ButtonAndFieldDisabled", var_105_104)

	local function var_105_105()
		var_105_21:AnimateSequence("ButtonAndFieldDisabled")
	end

	var_105_0._sequences.ButtonAndFieldDisabled = var_105_105

	local var_105_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_6:RegisterAnimationSequence("ExpandedInactive", var_105_106)

	local var_105_107 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		}
	}

	var_105_8:RegisterAnimationSequence("ExpandedInactive", var_105_107)

	local var_105_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -514
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -104
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -28
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_10:RegisterAnimationSequence("ExpandedInactive", var_105_108)

	local var_105_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -64
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -546
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_12:RegisterAnimationSequence("ExpandedInactive", var_105_109)

	local var_105_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_14:RegisterAnimationSequence("ExpandedInactive", var_105_110)

	local var_105_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_17:RegisterAnimationSequence("ExpandedInactive", var_105_111)

	local var_105_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_19:RegisterAnimationSequence("ExpandedInactive", var_105_112)

	local var_105_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("ExpandedInactive", var_105_113)

	local var_105_114 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -525
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_105_23:RegisterAnimationSequence("ExpandedInactive", var_105_114)

	local var_105_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -298
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -267
		}
	}

	var_105_25:RegisterAnimationSequence("ExpandedInactive", var_105_115)

	local function var_105_116()
		var_105_6:AnimateSequence("ExpandedInactive")
		var_105_8:AnimateSequence("ExpandedInactive")
		var_105_10:AnimateSequence("ExpandedInactive")
		var_105_12:AnimateSequence("ExpandedInactive")
		var_105_14:AnimateSequence("ExpandedInactive")
		var_105_17:AnimateSequence("ExpandedInactive")
		var_105_19:AnimateSequence("ExpandedInactive")
		var_105_21:AnimateSequence("ExpandedInactive")
		var_105_23:AnimateSequence("ExpandedInactive")
		var_105_25:AnimateSequence("ExpandedInactive")
	end

	var_105_0._sequences.ExpandedInactive = var_105_116

	local var_105_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		}
	}

	var_105_6:RegisterAnimationSequence("InGameExpandedInactive", var_105_117)

	local var_105_118 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 344
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -107
		}
	}

	var_105_8:RegisterAnimationSequence("InGameExpandedInactive", var_105_118)

	local var_105_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -506
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -86
		}
	}

	var_105_10:RegisterAnimationSequence("InGameExpandedInactive", var_105_119)

	local var_105_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -566
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_12:RegisterAnimationSequence("InGameExpandedInactive", var_105_120)

	local var_105_121 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -566
		}
	}

	var_105_14:RegisterAnimationSequence("InGameExpandedInactive", var_105_121)

	local var_105_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -566
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_105_17:RegisterAnimationSequence("InGameExpandedInactive", var_105_122)

	local var_105_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 346
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_105_19:RegisterAnimationSequence("InGameExpandedInactive", var_105_123)

	local var_105_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -572
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -542
		}
	}

	var_105_21:RegisterAnimationSequence("InGameExpandedInactive", var_105_124)

	local var_105_125 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -116
		}
	}

	var_105_23:RegisterAnimationSequence("InGameExpandedInactive", var_105_125)

	local var_105_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -665
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -635
		}
	}

	var_105_25:RegisterAnimationSequence("InGameExpandedInactive", var_105_126)

	local function var_105_127()
		var_105_6:AnimateSequence("InGameExpandedInactive")
		var_105_8:AnimateSequence("InGameExpandedInactive")
		var_105_10:AnimateSequence("InGameExpandedInactive")
		var_105_12:AnimateSequence("InGameExpandedInactive")
		var_105_14:AnimateSequence("InGameExpandedInactive")
		var_105_17:AnimateSequence("InGameExpandedInactive")
		var_105_19:AnimateSequence("InGameExpandedInactive")
		var_105_21:AnimateSequence("InGameExpandedInactive")
		var_105_23:AnimateSequence("InGameExpandedInactive")
		var_105_25:AnimateSequence("InGameExpandedInactive")
	end

	var_105_0._sequences.InGameExpandedInactive = var_105_127

	local var_105_128 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_4:RegisterAnimationSequence("ShowDarkener", var_105_128)

	local function var_105_129()
		var_105_4:AnimateSequence("ShowDarkener")
	end

	var_105_0._sequences.ShowDarkener = var_105_129

	local var_105_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_105_4:RegisterAnimationSequence("HideDarkener", var_105_130)

	local function var_105_131()
		var_105_4:AnimateSequence("HideDarkener")
	end

	var_105_0._sequences.HideDarkener = var_105_131

	var_105_19:addEventHandler("button_over", function(arg_122_0, arg_122_1)
		if not arg_122_1.controller then
			local var_122_0 = var_105_1
		end

		ACTIONS.AnimateSequenceByElement(var_105_0, {
			elementPath = "self.TextChatFooter",
			sequenceName = "GainFocus",
			elementName = "TextChatFooter"
		})
	end)
	var_0_33(var_105_0, var_105_1, arg_105_1)
	ACTIONS.AnimateSequence(var_105_0, "DefaultSequence")

	return var_105_0
end

MenuBuilder.registerType("TextChat", TextChat)
LockTable(_M)
