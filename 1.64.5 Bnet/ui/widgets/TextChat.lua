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
		color = SWATCHES.BattleNetChat.groupChat,
		name = Engine.CBBHFCGDIC("MENU/CHANNEL_REGIMENTS") .. ":"
	},
	[OnlineChatType.CLAN_CHAT2] = {
		color = SWATCHES.BattleNetChat.clansChat,
		name = Engine.CBBHFCGDIC("MENU/CHANNEL_CLANS") .. ":"
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
LUI.TextChat.DefaultMessagesFadeOutTimeInMs = 5000
LUI.TextChat.MediumMessagesFadeOutTimeInMs = 15000
LUI.TextChat.LongMessagesFadeOutTimeInMs = 30000
LUI.TextChat.ExtendedMessagesFadeOutTimeInMs = 60000
LUI.TextChat.MessagesFakeInfiniteFadeOutTimeInMs = 3600000

function LUI.TextChat.GetTimeBasedOnBehavior(arg_2_0)
	if arg_2_0 == TextChatBehavior.OFF then
		return -1
	elseif arg_2_0 == TextChatBehavior.DEFAULT then
		return LUI.TextChat.DefaultMessagesFadeOutTimeInMs
	elseif arg_2_0 == TextChatBehavior.MEDIUM then
		return LUI.TextChat.MediumMessagesFadeOutTimeInMs
	elseif arg_2_0 == TextChatBehavior.LONG then
		return LUI.TextChat.LongMessagesFadeOutTimeInMs
	elseif arg_2_0 == TextChatBehavior.EXTENDED then
		return LUI.TextChat.ExtendedMessagesFadeOutTimeInMs
	else
		return LUI.TextChat.DefaultMessagesFadeOutTimeInMs
	end
end

function LUI.TextChat.GetMessagesFadeOutTimeInMs(arg_3_0, arg_3_1)
	local var_3_0 = Engine.HHFCGDBEE(arg_3_1)

	if var_3_0 == TextChatBehavior.CUSTOM then
		local function var_3_1(arg_4_0, arg_4_1)
			return (arg_4_0 == OnlineChatType.PARTY_CHAT or arg_4_0 == OnlineChatType.GAME_CHAT or arg_4_0 == OnlineChatType.TEAM_CHAT or arg_4_0 == OnlineChatType.CLAN_CHAT or arg_4_0 == OnlineChatType.PRIVATE_CHAT) and not arg_4_1
		end

		local function var_3_2(arg_5_0)
			return arg_5_0 == OnlineChatType.SYSTEM_EVENT or arg_5_0 == OnlineChatType.SYSTEM_ERROR
		end

		local var_3_3 = Engine.DEHEEEBGAE(arg_3_1)
		local var_3_4 = Engine.BGFCDIHDBC(arg_3_1)

		if Engine.CJGIDICGIG(arg_3_1) == 0 then
			if var_3_1(arg_3_0.chatType, arg_3_0.localPlayer) then
				return LUI.TextChat.GetTimeBasedOnBehavior(var_3_3)
			elseif var_3_2(arg_3_0.chatType) then
				return LUI.TextChat.GetTimeBasedOnBehavior(var_3_4)
			else
				return LUI.TextChat.DefaultMessagesFadeOutTimeInMs
			end
		else
			return LUI.TextChat.MessagesFakeInfiniteFadeOutTimeInMs
		end
	else
		return LUI.TextChat.GetTimeBasedOnBehavior(var_3_0)
	end
end

local function var_0_1(arg_6_0)
	return arg_6_0._chatInactive or MP and MP.IsOffline()
end

local function var_0_2(arg_7_0)
	return arg_7_0 == LUI.TextChat.DisplayStates.ALL_LINES
end

local function var_0_3(arg_8_0)
	return arg_8_0 == OnlineChatType.SYSTEM_EVENT or arg_8_0 == OnlineChatType.SYSTEM_ERROR or arg_8_0 == OnlineChatType.PLAYER_EVENT
end

local function var_0_4(arg_9_0)
	return arg_9_0 == LUI.TextChat.DisplayStates.EXPANDED_INACTIVE
end

local function var_0_5(arg_10_0)
	return arg_10_0 == LUI.TextChat.DisplayStates.ALL_LINES
end

local function var_0_6(arg_11_0)
	return arg_11_0 == LUI.TextChat.DisplayStates.NONE
end

local function var_0_7(arg_12_0)
	return var_0_2(arg_12_0._currentState)
end

local function var_0_8(arg_13_0)
	return var_0_4(arg_13_0._currentState)
end

local function var_0_9(arg_14_0)
	return var_0_5(arg_14_0._currentState)
end

local function var_0_10(arg_15_0)
	return var_0_6(arg_15_0._currentState)
end

local function var_0_11(arg_16_0)
	return var_0_4(arg_16_0) or var_0_2(arg_16_0)
end

local function var_0_12(arg_17_0)
	return var_0_11(arg_17_0._currentState)
end

local function var_0_13(arg_18_0)
	return arg_18_0 ~= nil and arg_18_0 >= LUI.TextChat.FIRST_VALID_CHAT_INDEX and arg_18_0 <= LUI.TextChat.LAST_VALID_CHAT_INDEX
end

local function var_0_14(arg_19_0)
	return var_0_13(arg_19_0._activeChatType)
end

local function var_0_15(arg_20_0)
	return not var_0_1(arg_20_0)
end

local function var_0_16(arg_21_0)
	return arg_21_0 and not arg_21_0.chatOptOut and arg_21_0.chatMinimizedDisplayState ~= LUI.TextChat.DisplayStates.NONE
end

local function var_0_17()
	local var_22_0 = {
		CoD.GetPauseMenu(),
		"OptionsMenuNewLayout",
		"SocialMenu",
		"TrialResults"
	}

	return not LUI.FlowManager.IsAnyInStack(var_22_0) and not Engine.DDJFBBJAIG() and not LUI.HUD.IsChatAllowedInHUD()
end

local function var_0_18(arg_23_0)
	return arg_23_0 and (arg_23_0.chatMinimizedDisplayState or LUI.TextChat.DefaultMinimizedState) or LUI.TextChat.DisplayStates.NONE
end

local function var_0_19(arg_24_0)
	return LUI.TextChat.ChatChannels[arg_24_0].isStaticId
end

local function var_0_20(arg_25_0, arg_25_1)
	if arg_25_0 == nil or arg_25_1 == nil then
		return false
	end

	return arg_25_0.id == arg_25_1.id and arg_25_0.label == arg_25_1.label and arg_25_0.epoch == arg_25_1.epoch
end

local function var_0_21(arg_26_0)
	local function var_26_0()
		local var_27_0, var_27_1, var_27_2 = Friends.DECIABAAIE(arg_26_0._controllerIndex)

		if var_27_2 <= 0 then
			Social.CEFBABBCGD(arg_26_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_WELCOME_SEASON", SEASON.GetCurrentSeasonDisplayNum()))
		else
			Social.CEFBABBCGD(arg_26_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_WELCOME_FRIEND_SEASON", SEASON.GetCurrentSeasonDisplayNum(), var_27_2))
		end
	end

	if Engine.FIDIEBFAG(Engine.IJEBHJIJF()) and not Dvar.IBEGCHEFE("QOTNQOSRN") then
		Dvar.DHEGHJJJHI("QOTNQOSRN", true)
		Social.CEFBABBCGD(arg_26_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_WARNING"))

		arg_26_0:Wait(LUI.TextChat.CrossplayWarningTimeInMs).onComplete = function()
			var_26_0()
		end
	else
		var_26_0()
	end
end

local function var_0_22(arg_29_0, arg_29_1)
	if var_0_1(arg_29_0) then
		arg_29_0.CollapsedChatLog.Message:setText(Engine.CBBHFCGDIC("MENU/CHAT_DISABLED"))
	elseif LUI.IsLastInputGamepad(arg_29_1) then
		arg_29_0.CollapsedChatLog.Message:setText(Engine.CBBHFCGDIC("MENU/CHAT_NO_MESSAGES_YET_GAMEPAD"))
	else
		arg_29_0.CollapsedChatLog.Message:setText(Engine.CBBHFCGDIC("MENU/CHAT_NO_MESSAGES_YET"))
	end
end

local function var_0_23(arg_30_0, arg_30_1)
	local var_30_0 = LUI.FlowManager.GetVisibleMenu()
	local var_30_1 = arg_30_0._currentState
	local var_30_2 = arg_30_0._currentStyle

	if arg_30_0.userWantsToType then
		arg_30_0._currentState = LUI.TextChat.DisplayStates.ALL_LINES
	elseif arg_30_0.expandedInactive then
		arg_30_0._currentState = LUI.TextChat.DisplayStates.EXPANDED_INACTIVE
	elseif var_30_0 then
		arg_30_0._currentState = var_0_16(var_30_0) and var_0_18(var_30_0) or LUI.TextChat.DisplayStates.NONE
	else
		local var_30_3 = Engine.DBFFAEEFGJ()

		assert(var_30_3)

		local var_30_4 = var_30_3.hudManager

		if var_30_4 then
			arg_30_0._currentState = (LUI.HUD.IsChatAllowedInHUD() and not LUI.IsLastInputGamepad(arg_30_0._controllerIndex) or LUI.HudManager.ShouldBeVisible(var_30_4) and not arg_30_0._hiddenDueToOverlay) and LUI.TextChat.DefaultMinimizedState or LUI.TextChat.DisplayStates.NONE
		end
	end

	local var_30_5 = var_0_17() and LUI.TextChat.Styles.INGAME or LUI.TextChat.Styles.MENU

	if not (var_30_1 ~= arg_30_0._currentState or var_30_5 ~= arg_30_0._currentStyle) then
		return
	end

	if arg_30_0.userWantsToType then
		arg_30_0.PromptContainer:SetAlpha(1)
	else
		arg_30_0.PromptContainer:SetAlpha(0)
		arg_30_0.TextChatButton:UpdateInputType({
			controllerIndex = arg_30_0._controllerIndex
		})
	end

	arg_30_0:updateDarkenerStatus()

	arg_30_0._currentStyle = var_30_5

	if arg_30_0._currentState == LUI.TextChat.DisplayStates.NONE then
		arg_30_0:SetAlpha(0)
		arg_30_0:SetMouseFocusBlocker(true)
	else
		arg_30_0:SetAlpha(1)
		arg_30_0:SetMouseFocusBlocker(false)
	end

	local var_30_6 = LUI.TextChat.DisplayStatesSequences[arg_30_0._currentState][var_30_5].anim

	if type(var_30_6) ~= "table" then
		var_30_6 = {
			var_30_6
		}
	end

	for iter_30_0, iter_30_1 in ipairs(var_30_6) do
		local var_30_7 = iter_30_1

		if arg_30_0._sequences[var_30_7] then
			ACTIONS.AnimateSequence(arg_30_0, var_30_7)
		end

		if arg_30_0.TextChatFooter._sequences[var_30_7] then
			ACTIONS.AnimateSequence(arg_30_0.TextChatFooter, var_30_7)
		end

		if arg_30_0.TextChatBody._sequences[var_30_7] and arg_30_0.TextChatBody.TextChatEntriesList and arg_30_0.TextChatBody.TextChatEntriesList.sequences then
			local var_30_8 = arg_30_0.TextChatBody.TextChatEntriesList.sequences[var_30_7]

			if var_30_8 then
				local var_30_9 = #var_30_8

				if var_30_8[var_30_9] then
					var_30_8[var_30_9].onComplete = function(arg_31_0)
						LUI.UIGrid.UpdateScrolling(arg_31_0.messagesGrid)
					end
				end
			end

			ACTIONS.AnimateSequence(arg_30_0.TextChatBody, var_30_7)
		end
	end

	if arg_30_0.userWantsToType or arg_30_0.expandedInactive then
		arg_30_0.TextChatBody.TextChatEntriesList:redisplayMessages()
	else
		if var_0_11(var_30_1) then
			if arg_30_0._currentStyle ~= LUI.TextChat.Styles.INGAME then
				arg_30_0.TextChatFooter.InputTextButton:ReturnFocusToMenu()
			end

			arg_30_0.TextChatBody.TextChatEntriesList:resetMessagesFadeTimerAndUnlock()
		end

		arg_30_0.TextChatBody.TextChatEntriesList:ScrollListToEnd()
	end

	arg_30_0.TextChatBody.TextChatEntriesList.SetScrollbarWantedVisibility(arg_30_0.userWantsToType)

	local var_30_10 = var_0_5(arg_30_0._currentState)

	arg_30_0.TextChatFooter:SetMouseFocusBlocker(not var_30_10)
	arg_30_0.TextChatBody:SetMouseFocusBlocker(LUI.TextChat.DisplayStatesSequences[arg_30_0._currentState][var_30_5].noMouseInBody)
	arg_30_0.TextChatButton:SetMouseFocusBlocker(not var_30_10 or var_0_1(arg_30_0) or arg_30_0._currentStyle == LUI.TextChat.Styles.INGAME)
	arg_30_0.CollapsedChatLog:SetMouseFocusBlocker(not var_30_10 or arg_30_0._currentStyle == LUI.TextChat.Styles.INGAME)
	arg_30_0.BackgroundHover:SetMouseFocusBlocker(var_30_10 or arg_30_0._currentStyle == LUI.TextChat.Styles.INGAME)
end

local function var_0_24(arg_32_0)
	if arg_32_0._controllerIndex then
		arg_32_0._chatMouseCursorActive = arg_32_0.userWantsToType

		LUI.UIRoot.SetLuiLayerKeycatch(arg_32_0, arg_32_0._controllerIndex, arg_32_0._chatMouseCursorActive)
	end
end

local function var_0_25(arg_33_0, arg_33_1)
	if arg_33_0.userWantsToType ~= arg_33_1 then
		arg_33_0.userWantsToType = arg_33_1

		var_0_23(arg_33_0)

		if arg_33_0._currentStyle == LUI.TextChat.Styles.INGAME and Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() or arg_33_0._chatMouseCursorActive and not arg_33_0.userWantsToType then
			var_0_24(arg_33_0)
		end
	end
end

local function var_0_26(arg_34_0, arg_34_1)
	if arg_34_0.expandedInactive ~= arg_34_1 then
		arg_34_0.expandedInactive = arg_34_1

		var_0_23(arg_34_0)
	end
end

local function var_0_27(arg_35_0, arg_35_1, arg_35_2)
	if var_0_8(arg_35_0) then
		var_0_26(arg_35_0, false)
	end

	arg_35_0._chatInactive = not arg_35_1

	if LUI.TextChat.LastMessageText == nil then
		var_0_22(arg_35_0, arg_35_2)
	end

	if var_0_1(arg_35_0) then
		arg_35_0.CollapsedChatLog._closeOnClick = true
	else
		arg_35_0.CollapsedChatLog._closeOnClick = false
	end

	arg_35_0.TextChatButton:UpdateInputType({
		controllerIndex = arg_35_2
	})
end

function LUI.TextChat.IsChatVisible(arg_36_0)
	return arg_36_0.chat and arg_36_0.chat._currentState ~= LUI.TextChat.DisplayStates.NONE
end

function StartEditing(arg_37_0, arg_37_1)
	if var_0_1(arg_37_0) then
		var_0_26(arg_37_0, not var_0_8(arg_37_0))

		return true
	else
		local var_37_0 = arg_37_0.TextChatFooter.InputTextButton

		return var_37_0.TryStartEditing(var_37_0, {
			controller = arg_37_1
		})
	end
end

function LUI.TextChat.StartEditing(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.chat

	if not var_38_0 then
		return false
	end

	return StartEditing(var_38_0, arg_38_1)
end

function LUI.TextChat.init(arg_39_0, arg_39_1)
	LUI.TextChat.super.init(arg_39_0)

	arg_39_0.id = "TextChat"

	assert(arg_39_1.controllerIndex)

	arg_39_0._controllerIndex = arg_39_1.controllerIndex
end

function LUI.TextChat.InitLayer(arg_40_0)
	local var_40_0 = MenuBuilder.BuildRegisteredType("TextChat", {
		controllerIndex = arg_40_0._controllerIndex
	})

	var_40_0.id = "chat"

	var_40_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_40_0:addElement(var_40_0)

	arg_40_0.chat = var_40_0
	var_40_0._controllerIndex = arg_40_0._controllerIndex
	var_40_0._currentState = -1
	var_40_0._currentStyle = var_0_17() and LUI.TextChat.Styles.INGAME or LUI.TextChat.Styles.MENU

	var_0_25(var_40_0, false)
end

function LUI.TextChat.ClearLayer(arg_41_0)
	if arg_41_0.scoreboardModel then
		arg_41_0:UnsubscribeFromModel(arg_41_0.scoreboardModel)

		arg_41_0.scoreboardModel = nil
	end

	arg_41_0.chat:closeTree()

	arg_41_0.chat = nil
end

function LUI.TextChat.GetLayer()
	return Engine.DBFFAEEFGJ().textChat
end

function LUI.TextChat.ShouldChangeStyle(arg_43_0)
	local var_43_0 = LUI.TextChat.Styles.MENU

	if LUI.HUD then
		var_43_0 = LUI.HUD.IsChatAllowedInHUD() and LUI.TextChat.Styles.MENU or LUI.TextChat.Styles.INGAME
	end

	return arg_43_0._currentStyle ~= var_43_0
end

function LUI.TextChat.Frame(arg_44_0)
	if not arg_44_0.chat then
		return
	end

	local var_44_0 = false
	local var_44_1 = LUI.FlowManager.GetVisibleMenu()

	if not var_44_1 and Engine.DDJFBBJAIG() then
		var_44_0 = true
	elseif var_44_1 then
		var_44_0 = var_44_0 or not var_0_16(var_44_1)
	else
		local var_44_2 = Engine.DBFFAEEFGJ()

		assert(var_44_2)

		local var_44_3 = var_44_2.hudManager

		if var_44_3 then
			if not arg_44_0.scoreboardModel and Engine.EAAHGICFBD() and DataSources.inGame.HUD.isScoreboardOpen then
				arg_44_0.scoreboardModel = arg_44_0:SubscribeToModel(DataSources.inGame.HUD.isScoreboardOpen:GetModel(arg_44_0._controllerIndex), function(arg_45_0)
					if DataModel.JJEHAEBDF(arg_45_0) then
						arg_44_0.chat._hiddenDueToOverlay = true
					else
						arg_44_0.chat._hiddenDueToOverlay = false
					end
				end, true)
			end

			local var_44_4 = LUI.HudManager.ShouldBeVisible(var_44_3)

			var_44_0 = (var_44_0 or not var_44_4) and (not LUI.HUD.IsChatAllowedInHUD() or LUI.IsLastInputGamepad(arg_44_0._controllerIndex))
		end
	end

	if not var_0_7(arg_44_0.chat) or var_0_10(arg_44_0.chat) ~= var_44_0 or LUI.TextChat.ShouldChangeStyle(arg_44_0.chat) then
		var_0_23(arg_44_0.chat)
	end

	arg_44_0.chat.TextChatBody.TextChatEntriesList.frame(arg_44_0.chat.TextChatBody.TextChatEntriesList)

	if Lobby.GFFECBCCF() and not Dvar.IBEGCHEFE("NLKQPLPLQK") then
		Dvar.DHEGHJJJHI("NLKQPLPLQK", true)
		var_0_21(arg_44_0)
	end
end

function LUI.TextChat.ShouldBeVisible(arg_46_0)
	if not Dvar.IBEGCHEFE("LKSKPKTOON") then
		return false
	elseif Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_46_0._controllerIndex) and not Dvar.IBEGCHEFE("NQOMTKMNPT") then
		return false
	elseif Engine.CDFCHEJJE(arg_46_0._controllerIndex) then
		return false
	elseif CODCASTER_CONDITIONS.IsMPCODCaster() or MLG.DBIBHEAEGD() then
		return false
	end

	local var_46_0 = true
	local var_46_1 = Engine.DBFFAEEFGJ()

	if var_46_1 and var_46_1.flowManager then
		var_46_0 = not LUI.FlowManager.AreMainMenuFencedOut(var_46_1.flowManager)
	end

	if Engine.DDJFBBJAIG() then
		local var_46_2 = Engine.IJEBHJIJF()

		if var_46_2 ~= arg_46_0._controllerIndex then
			arg_46_0._controllerIndex = var_46_2
		end
	elseif Engine.IJEBHJIJF() ~= arg_46_0._controllerIndex then
		return false
	end

	return var_46_0
end

function LUI.TextChat.RefreshChatState()
	local var_47_0 = LUI.TextChat.GetLayer()

	if var_47_0 and var_47_0.chat then
		var_0_23(var_47_0.chat)
	end
end

function LUI.TextChat.SetupMenuForNoChat(arg_48_0)
	arg_48_0.chatMinimizedDisplayState = LUI.TextChat.DisplayStates.NONE
end

function LUI.TextChat.SetupMenuForNoLine(arg_49_0)
	LUI.TextChat.SetupMenuForSingleLine(arg_49_0)
end

function LUI.TextChat.SetupMenuForSingleLine(arg_50_0)
	arg_50_0.chatMinimizedDisplayState = LUI.TextChat.DisplayStates.SINGLE_LINE
end

function LUI.TextChat.SetupScreenForMenuChat(arg_51_0)
	LUI.TextChat.SetupMenuForSingleLine(arg_51_0)
	LUI.HUD.AllowChatInHUD()
	arg_51_0:addEventHandler("on_close", function(arg_52_0, arg_52_1)
		LUI.HUD.DisallowChatInHUD()
	end)
end

function LUI.TextChat.TrapsInput(arg_53_0, arg_53_1)
	if not arg_53_0.chat then
		return false
	end

	local var_53_0, var_53_1 = LUI.TextChat.InputsTrappedOrInteresting(arg_53_0, arg_53_1)

	return var_53_0 or var_53_1
end

function LUI.TextChat.InputsTrappedOrInteresting(arg_54_0, arg_54_1)
	if Engine.CAADCDEEIA() then
		return false, false
	end

	local var_54_0 = false
	local var_54_1 = false

	if var_0_7(arg_54_0.chat) then
		var_54_0 = true
	elseif not var_0_10(arg_54_0.chat) then
		if arg_54_0.chat._currentStyle ~= LUI.TextChat.Styles.INGAME then
			var_54_1 = arg_54_1.button == "select"
		end

		if LUI.IsLastInputKeyboardMouse(arg_54_1.controller) then
			var_54_1 = var_54_1 or arg_54_1.button == "open_chat" or arg_54_1.button == "open_match_chat" or arg_54_1.button == "open_team_chat" or arg_54_1.button == "open_party_chat"
		end
	end

	return var_54_0, var_54_1
end

local function var_0_28(arg_55_0)
	if var_0_7(arg_55_0) then
		var_0_26(arg_55_0, false)
		var_0_25(arg_55_0, false)
		Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
		arg_55_0.TextChatFooter.InputTextButton.TextEditOff()

		arg_55_0.m_rightMouseDown = nil
		arg_55_0.m_leftMouseDown = nil
	end

	return true
end

local function var_0_29(arg_56_0, arg_56_1, arg_56_2)
	if var_0_3(arg_56_1) then
		return
	end

	local var_56_0 = SWATCHES.BattleNetChat.whisperChat
	local var_56_1 = ""

	if arg_56_2 then
		var_56_1 = arg_56_2 .. ":"
	elseif arg_56_1 and LUI.TextChat.ChatChannels[arg_56_1] and LUI.TextChat.ChatChannels[arg_56_1].name then
		var_56_1 = LUI.TextChat.ChatChannels[arg_56_1].name
		var_56_0 = LUI.TextChat.ChatChannels[arg_56_1].color
	else
		arg_56_0.TextChatFooter.CurrentChannel:setText("")
	end

	arg_56_0.TextChatFooter.CurrentChannel:setText(var_56_1)
	arg_56_0.TextChatFooter.CurrentChannel:SetRGBFromTable(var_56_0)

	local var_56_2, var_56_3, var_56_4, var_56_5 = GetTextDimensions(var_56_1, FONTS.GetFont(FONTS.BattleNetRegular.File), 20 * _1080p)
	local var_56_6 = var_56_4 - var_56_2 + 3

	arg_56_0.TextChatFooter.CurrentChannel:SetRight(arg_56_0.TextChatFooter._currentChannelInitialLeft + var_56_6)
	arg_56_0.TextChatFooter.InputTextButton:SetLeft(var_56_6 + arg_56_0.TextChatFooter._currentChannelInitialLeft)
end

local function var_0_30(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_1 == OnlineChatType.PRIVATE_CHAT then
		local var_57_0 = LUI.TextChat.PrivateChatChannels[arg_57_2.id]

		if var_57_0 then
			arg_57_0._activeChatID = var_57_0.id
			arg_57_0._activeChatType = OnlineChatType.PRIVATE_CHAT

			if var_57_0.name == "" then
				local var_57_1 = Social.BBFEJIEGJG(var_57_0.id, OnlineChatType.PRIVATE_CHAT)

				for iter_57_0, iter_57_1 in ipairs(var_57_1) do
					if iter_57_1.gamertag and not iter_57_1.localPlayer then
						var_57_0.name = iter_57_1.gamertag

						break
					end
				end
			end

			var_0_29(arg_57_0, arg_57_0._activeChatType, var_57_0.name)
		else
			return false
		end
	else
		arg_57_0._activeChatID = LUI.TextChat.ChatChannels[arg_57_1] and LUI.TextChat.ChatChannels[arg_57_1].id or nil
		arg_57_0._activeChatType = arg_57_1

		var_0_29(arg_57_0, arg_57_0._activeChatType)
	end

	Dvar.BDEHAEGHAF("LQPKMLTOQM", arg_57_0._activeChatID and arg_57_0._activeChatID.id or "")
	Dvar.DFIJDJFIFD("MOOOOTKPTL", arg_57_0._activeChatType)

	return true
end

function LUI.TextChat.GetActiveChannelCount()
	local var_58_0 = 0

	for iter_58_0, iter_58_1 in ipairs(LUI.TextChat.ChatChannels) do
		if iter_58_1.id ~= nil and not iter_58_1.isStaticId then
			var_58_0 = var_58_0 + 1
		end
	end

	for iter_58_2, iter_58_3 in pairs(LUI.TextChat.PrivateChatChannels) do
		if iter_58_3.id ~= nil then
			var_58_0 = var_58_0 + 1
		end
	end

	return var_58_0
end

function LUI.TextChat.InitiateWhisperWithXUID(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	if arg_59_2 ~= "" then
		local var_59_0 = arg_59_2
		local var_59_1 = {
			label = 0,
			epoch = 0,
			id = var_59_0
		}
		local var_59_2 = Friends.CADJIDDGA(arg_59_1)

		if var_59_2 and var_59_2.count > 0 then
			for iter_59_0, iter_59_1 in ipairs(var_59_2.friends) do
				if iter_59_1.xuid == arg_59_2 then
					arg_59_3 = iter_59_1.gamertag

					break
				end
			end
		end

		Social.HGFFAFCDI(arg_59_1, arg_59_2, arg_59_3, true)

		if not arg_59_0 then
			local var_59_3 = Engine.DBFFAEEFGJ()

			arg_59_0 = var_59_3 and var_59_3.textChat.chat
		end

		if arg_59_0.chat then
			arg_59_0 = arg_59_0.chat
		end

		var_0_30(arg_59_0, OnlineChatType.PRIVATE_CHAT, var_59_1)
	end
end

local function var_0_31(arg_60_0, arg_60_1)
	local var_60_0 = var_0_15(arg_60_0)

	if LUI.TextChat.ChatChannels[arg_60_1].id ~= nil and var_60_0 then
		var_0_30(arg_60_0, arg_60_1)

		return true
	else
		return not var_60_0
	end
end

local function var_0_32(arg_61_0)
	local var_61_0 = CLANS.GetClan2Name(arg_61_0)

	if var_61_0 and var_61_0 ~= "" then
		return "/c " .. Engine.CBBHFCGDIC("LUA_MENU/CLAN_CHAT_HINT", Engine.JCBDICCAH(var_61_0))
	else
		return ""
	end
end

local function var_0_33(arg_62_0)
	local var_62_0 = Clans.CFGBBBHFHB(arg_62_0)
	local var_62_1

	if var_62_0 then
		local var_62_2 = Clans.GFFJCJFIJ(arg_62_0, var_62_0)

		if var_62_2 and var_62_2.name then
			return "/g " .. Engine.CBBHFCGDIC("LUA_MENU/GROUP_CHAT_HINT", Engine.JCBDICCAH(var_62_2.name))
		else
			return ""
		end
	end
end

local var_0_34 = {}

local function var_0_35(arg_63_0, arg_63_1)
	local var_63_0 = CONDITIONS.IsClanUIEnabled()
	local var_63_1 = var_0_33(arg_63_1)
	local var_63_2 = var_63_0 and var_0_32(arg_63_1) or ""

	var_0_34 = {
		{
			names = {
				"/t",
				"/team"
			},
			autocompleteListString = "/t " .. Engine.CBBHFCGDIC("LUA_MENU/TEAM_CHAT_HINT"),
			execute = function(arg_64_0, arg_64_1)
				if var_0_31(arg_64_0, OnlineChatType.TEAM_CHAT) then
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
			execute = function(arg_65_0, arg_65_1)
				if var_0_31(arg_65_0, OnlineChatType.GAME_CHAT) then
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
			execute = function(arg_66_0, arg_66_1)
				if var_0_31(arg_66_0, OnlineChatType.PARTY_CHAT) then
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
			execute = function(arg_67_0, arg_67_1, arg_67_2)
				if #arg_67_2 < 2 then
					return true
				end

				local var_67_0 = arg_67_2[2]
				local var_67_1

				if arg_67_0._lastFirstParameterMetadata then
					var_67_1 = arg_67_0._lastFirstParameterMetadata.xuid
				else
					local var_67_2 = Social.CEAACEBEBG(arg_67_1, var_67_0)

					if #var_67_2 > 0 then
						if #var_67_2 == 1 then
							var_67_1 = var_67_2[1].xuid or var_67_2[1].xuidString
						else
							return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_MULTIPLE_PLAYERS")
						end
					end
				end

				if var_67_1 ~= nil then
					LUI.TextChat.InitiateWhisperWithXUID(arg_63_0, arg_67_1, var_67_1, var_67_0)
				else
					return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_PLAYER_NOT_FOUND")
				end

				return true
			end,
			getFirstParamsList = function(arg_68_0, arg_68_1)
				local var_68_0 = {}
				local var_68_1 = Friends.CADJIDDGA(arg_68_0)

				if var_68_1 and var_68_1.count > 0 then
					for iter_68_0, iter_68_1 in ipairs(var_68_1.friends) do
						local var_68_2 = iter_68_1.xuid

						if iter_68_1.platformId ~= "0" then
							var_68_2 = iter_68_1.platformId
						end

						table.insert(var_68_0, {
							name = arg_68_1 .. iter_68_1.gamertag,
							displayName = iter_68_1.gamertag,
							xuid = var_68_2
						})
					end
				end

				return var_68_0
			end
		},
		{
			names = {
				"/r",
				"/reply"
			},
			autocompleteListString = "/r " .. Engine.CBBHFCGDIC("LUA_MENU/REPLY_CHAT_HINT"),
			execute = function(arg_69_0, arg_69_1, arg_69_2)
				if arg_69_0._replyTargetChatId == nil then
					return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NO_REPLY_TARGET")
				end

				if not var_0_30(arg_69_0, OnlineChatType.PRIVATE_CHAT, arg_69_0._replyTargetChatId) then
					return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_REPLY_FAILED")
				end

				return true
			end
		}
	}

	local var_63_3 = false

	if var_63_2 and var_63_2 ~= "" then
		local var_63_4 = {
			names = {
				"/c",
				"/clan"
			},
			autocompleteListString = var_63_2,
			execute = function(arg_70_0, arg_70_1)
				if var_0_31(arg_70_0, OnlineChatType.CLAN_CHAT2) then
					return true
				else
					return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_CLAN")
				end
			end
		}

		var_63_3 = true

		table.insert(var_0_34, 1, var_63_4)
	end

	if var_63_1 and var_63_1 ~= "" then
		local var_63_5 = {
			names = {
				"/g",
				"/group"
			},
			autocompleteListString = var_63_1,
			execute = function(arg_71_0, arg_71_1)
				if var_0_31(arg_71_0, OnlineChatType.CLAN_CHAT) then
					return true
				else
					return false, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_GROUP")
				end
			end
		}
		local var_63_6 = var_63_3 and 2 or 1

		table.insert(var_0_34, var_63_6, var_63_5)
	end
end

local function var_0_36(arg_72_0, arg_72_1, arg_72_2)
	assert(arg_72_0.TextChatFooter)
	assert(arg_72_0.TextChatFooter.InputTextButton)
	assert(arg_72_0.TextChatBody)
	assert(arg_72_0.TextChatBody.TextChatEntriesList)

	if not CONDITIONS.IsClanUIEnabled() then
		for iter_72_0, iter_72_1 in ipairs(LUI.TextChat.ChatChannels) do
			if iter_72_1 == OnlineChatType.CLAN_CHAT2 then
				table.remove(LUI.TextChat.ChatChannels, iter_72_0)
			end
		end
	end

	arg_72_0._lastInputText = ""

	if not Engine.BBHAECABBD(arg_72_1) then
		arg_72_1 = Engine.IJEBHJIJF()
	end

	arg_72_0._controllerIndex = arg_72_1
	arg_72_0._chatInactive = not not Engine.CDFCHEJJE(arg_72_1) or not Engine.BECCFCBIAA("textChatEnabled", arg_72_1)
	arg_72_0._isArabic = IsLanguageArabic()

	if not Engine.CGABICJHAI() then
		LUI.TextChat.DefaultMinimizedState = LUI.TextChat.DisplayStates.SINGLE_LINE
	end

	local var_72_0
	local var_72_1 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_72_1
	})

	var_72_1.id = "ButtonHelperBar"

	var_72_1.Background:SetAlpha(0, 0)
	var_72_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1020, _1080p * 1080)
	arg_72_0:addElement(var_72_1)

	arg_72_0.ButtonHelperBar = var_72_1

	arg_72_0.PromptContainer:SetAlignment(LUI.Alignment.Right)
	arg_72_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		gamepad_only = true,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE"),
		container = arg_72_0.PromptContainer
	})
	arg_72_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		button_ref2 = "button_shoulderr",
		gamepad_only = true,
		button_ref = "button_shoulderl",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CHANNELS"),
		container = arg_72_0.PromptContainer
	})

	function arg_72_0.updateDarkenerStatus(arg_73_0, arg_73_1)
		local var_73_0 = true

		if var_0_7(arg_73_0) and arg_73_0._controllerIndex and LUI.IsLastInputGamepad(arg_73_0._controllerIndex) then
			var_73_0 = (not Engine.DDJFBBJAIG() or false) and var_0_17()
		end

		ACTIONS.AnimateSequence(arg_73_0, var_73_0 and "HideDarkener" or "ShowDarkener")
	end

	arg_72_0:registerAndCallEventHandler("update_input_type", arg_72_0.updateDarkenerStatus)

	local function var_72_2(arg_74_0, arg_74_1)
		local var_74_0 = arg_74_0._activeChatType
		local var_74_1 = var_74_0
		local var_74_2

		if var_74_0 == OnlineChatType.PRIVATE_CHAT then
			local var_74_3 = false

			for iter_74_0, iter_74_1 in pairs(LUI.TextChat.PrivateChatChannels) do
				if var_74_3 then
					var_74_2 = iter_74_1.id

					break
				elseif iter_74_1.id == arg_74_0._activeChatID then
					var_74_3 = true
				end
			end
		end

		local var_74_4 = false

		while not var_74_2 do
			var_74_1 = var_74_1 + 1

			if var_74_1 > LUI.TextChat.LAST_VALID_CHAT_INDEX then
				if var_74_4 then
					return
				end

				var_74_4 = true
				var_74_1 = LUI.TextChat.FIRST_VALID_CHAT_INDEX
			end

			if var_74_1 == var_74_0 then
				var_74_2 = arg_74_0._activeChatID
			elseif var_74_1 == OnlineChatType.PRIVATE_CHAT then
				for iter_74_2, iter_74_3 in pairs(LUI.TextChat.PrivateChatChannels) do
					var_74_2 = iter_74_3.id

					break
				end
			else
				var_74_2 = LUI.TextChat.ChatChannels[var_74_1].id and var_0_13(var_74_1)
			end
		end

		if arg_74_1 then
			LUI.TextChat.LastUserSetChannel = var_74_1
		end

		var_0_30(arg_74_0, var_74_1, var_74_2)
	end

	local function var_72_3(arg_75_0, arg_75_1)
		local var_75_0 = arg_75_0._activeChatType
		local var_75_1 = var_75_0
		local var_75_2
		local var_75_3 = false

		if var_75_0 == OnlineChatType.PRIVATE_CHAT then
			local var_75_4

			for iter_75_0, iter_75_1 in pairs(LUI.TextChat.PrivateChatChannels) do
				if iter_75_1.id == arg_75_0._activeChatID then
					var_75_2 = var_75_4

					break
				else
					var_75_4 = iter_75_1.id
				end
			end
		end

		while not var_75_2 do
			var_75_1 = var_75_1 - 1

			if var_75_1 < LUI.TextChat.FIRST_VALID_CHAT_INDEX then
				if var_75_3 then
					return
				end

				var_75_3 = true
				var_75_1 = LUI.TextChat.LAST_VALID_CHAT_INDEX
			end

			if var_75_1 == var_75_0 then
				var_75_2 = arg_75_0._activeChatID
			elseif var_75_1 == OnlineChatType.PRIVATE_CHAT then
				for iter_75_2, iter_75_3 in pairs(LUI.TextChat.PrivateChatChannels) do
					var_75_2 = iter_75_3.id
				end
			else
				var_75_2 = LUI.TextChat.ChatChannels[var_75_1].id and var_0_13(var_75_1)
			end
		end

		if arg_75_1 then
			LUI.TextChat.LastUserSetChannel = var_75_1
		end

		var_0_30(arg_75_0, var_75_1, var_75_2)
	end

	arg_72_0:addEventHandler("text_chat_updated", function(arg_76_0, arg_76_1)
		var_0_27(arg_76_0, arg_76_1.active and not Engine.CDFCHEJJE(arg_72_1), arg_76_1.controller)

		return true
	end)
	arg_72_0:addEventHandler("text_edit_tab_pressed", function(arg_77_0, arg_77_1)
		if not var_0_10(arg_77_0) then
			var_72_2(arg_77_0, true)
		end
	end)
	arg_72_0:SetHandleMouseButton(true)
	arg_72_0:addEventHandler("minimize_chat", var_0_28)

	local function var_72_4(arg_78_0)
		local var_78_0 = {}

		for iter_78_0, iter_78_1 in pairs(OnlineChatType) do
			if OnlineChatType.COUNT ~= iter_78_1 then
				local var_78_1 = Social.CAHAEIIBJJ(iter_78_1)

				for iter_78_2 = 1, #var_78_1 do
					table.insert(var_78_0, var_78_1[iter_78_2])
				end
			end
		end

		table.sort(var_78_0, function(arg_79_0, arg_79_1)
			if arg_79_0.receivedTimeInt == arg_79_1.receivedTimeInt then
				return arg_79_0.chatType < arg_79_1.chatType
			end

			return arg_79_0.receivedTimeInt < arg_79_1.receivedTimeInt
		end)
		arg_72_0.TextChatBody.TextChatEntriesList:SetChatMessages(var_78_0, arg_78_0)

		local var_78_2 = arg_72_0.TextChatBody.TextChatEntriesList:GetLastReceivedMessage()

		if var_78_2 then
			LUI.TextChat.LastMessageText = var_78_2.message
			LUI.TextChat.LastMessageColor = LUI.TextChat.ChatChannels[var_78_2.chatType].color
		else
			LUI.TextChat.LastMessageText = nil
		end
	end

	local function var_72_5(arg_80_0, arg_80_1)
		if arg_80_1 == "/StartTest" then
			if not arg_80_0.debugTestTimer then
				arg_80_0.debugTestTimer = LUI.UITimer.new({
					interval = 2000,
					event = {
						name = "debugTestTimer"
					}
				})
				arg_80_0.debugTestTimerNb = 1

				arg_80_0:addElement(arg_80_0.debugTestTimer)
				arg_80_0:registerEventHandler("debugTestTimer", function(arg_81_0, arg_81_1)
					if arg_81_0.debugTestTimerNb then
						Social.ECAJABJEHB(arg_81_0._controllerIndex, arg_81_0._activeChatID, arg_81_0._activeChatType, "Test " .. arg_81_0.debugTestTimerNb)

						arg_81_0.debugTestTimerNb = arg_81_0.debugTestTimerNb + 1
					end
				end)
			end
		elseif arg_80_1 == "/StopTest" and arg_80_0.debugTestTimer then
			arg_80_0.debugTestTimer:closeTree()

			arg_80_0.debugTestTimer = nil
		end
	end

	local function var_72_6()
		if arg_72_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer then
			arg_72_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:closeTree()

			arg_72_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer = nil
		end
	end

	local function var_72_7()
		arg_72_0._lastInputText = ""
		arg_72_0._lastAutocompledText = nil

		var_72_6()
	end

	local function var_72_8(arg_84_0)
		local var_84_0 = {
			string.match(arg_84_0, "(.-)%s(.*)")
		}

		if #var_84_0 == 0 then
			table.insert(var_84_0, arg_84_0)
		end

		return var_84_0
	end

	local function var_72_9(arg_85_0, arg_85_1)
		local var_85_0 = true
		local var_85_1 = var_72_8(arg_85_0)
		local var_85_2 = false

		for iter_85_0, iter_85_1 in ipairs(var_0_34) do
			for iter_85_2, iter_85_3 in ipairs(iter_85_1.names) do
				if iter_85_3 == var_85_1[1] then
					if iter_85_1.secondParamListType and #var_85_1 < 2 then
						if not arg_85_1 then
							arg_72_0.TextChatFooter.InputTextButton.textEdit:setTextEditText(iter_85_3 .. " ")
						end

						return
					else
						assert(iter_85_1.execute)

						local var_85_3, var_85_4 = iter_85_1.execute(arg_72_0, arg_72_1, var_85_1)

						if not var_85_3 and var_85_4 then
							Social.BEFGJDEHCF(arg_72_1, var_85_4)
						end
					end

					var_85_2 = true

					break
				end
			end

			if var_85_2 then
				break
			end
		end

		if not var_85_2 then
			Social.BEFGJDEHCF(arg_72_1, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_INVALID_CMD"))
		end

		if var_85_0 then
			var_72_7()
			arg_72_0.TextChatFooter.InputTextButton.textEdit:setTextEditText("")
			arg_72_0.TextChatBody.TextChatEntriesList:ScrollListToEnd()

			return true
		end

		return false
	end

	local function var_72_10(arg_86_0)
		var_72_6()

		if #arg_86_0 == 0 then
			return
		end

		local var_86_0 = #arg_86_0 > LUI.TextChat.MaxAutocompleteOptions and LUI.TextChat.MaxAutocompleteOptions or #arg_86_0
		local var_86_1 = 0
		local var_86_2 = LUI.UIVerticalList.new({
			adjustSizeToContent = true,
			ignoreStretchingChildren = true,
			verticalAlignment = LUI.Alignment.Bottom
		})

		var_86_2:SetSpacing(0)

		for iter_86_0 = 1, var_86_0 do
			local var_86_3 = MenuBuilder.BuildRegisteredType("TextChatAutocompleteListItem", {
				controllerIndex = arg_72_1
			})

			var_86_3:SetLeftAnchor(0)
			var_86_3:SetRightAnchor(0)
			var_86_2:addElement(var_86_3)
			var_86_3:SetHandleMouse(true)
			var_86_3:SetFocusable(true)
			var_86_3:addEventHandler("mouseenter", function()
				arg_72_0:setFocus(true)
			end)
			var_86_3:addEventHandler("mouseleave", function()
				arg_72_0:setFocus(false)
			end)
			var_86_3:addEventHandler("leftmouseup", function(arg_89_0, arg_89_1)
				arg_72_0._lastAutocompledText = arg_86_0[iter_86_0].names and arg_86_0[iter_86_0].names[1] or arg_86_0[iter_86_0].name
				arg_72_0._lastFirstParameterMetadata = arg_86_0[iter_86_0]

				var_72_9(arg_72_0._lastAutocompledText)

				return true
			end)
			var_86_3:addEventHandler("button_over", function(arg_90_0, arg_90_1)
				if arg_90_1.controller or arg_90_1.focusType == 0 then
					arg_72_0._lastAutocompledText = arg_86_0[iter_86_0].names and arg_86_0[iter_86_0].names[1] or arg_86_0[iter_86_0].name
					arg_72_0._lastFirstParameterMetadata = arg_86_0[iter_86_0]

					arg_72_0.TextChatFooter.InputTextButton.textEdit:setTextEditText(arg_72_0._lastAutocompledText, true)
				end
			end)
			var_86_3.name:setText(arg_86_0[iter_86_0].displayName)

			local var_86_4, var_86_5, var_86_6, var_86_7 = GetTextDimensions(arg_86_0[iter_86_0].displayName, FONTS.GetFont(FONTS.BattleNetRegular.File), 20 * _1080p)
			local var_86_8 = var_86_6 - var_86_4

			if var_86_1 < var_86_8 then
				var_86_1 = var_86_8
			end
		end

		local var_86_9 = MenuBuilder.BuildRegisteredType("TextChatAutocompleteList", {
			controllerIndex = arg_72_1
		})

		arg_72_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer = var_86_9

		arg_72_0.TextChatFooter.InputTextButton:addElement(var_86_9)

		arg_72_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer.List = var_86_2

		arg_72_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:addElement(var_86_2)

		local var_86_10 = 5 * _1080p

		var_86_2:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_86_9:SetAnchorsAndPosition(0, 0, 0, 0.9, -var_86_10 * 2, 0, -var_86_10 * 3 - 21.5 * var_86_0 * _1080p, -var_86_10)
		var_86_2:SetDefaultFocus(1)
		var_86_2:processEvent({
			name = "gain_focus",
			controllerIndex = arg_72_1
		})
	end

	local function var_72_11(arg_91_0, arg_91_1)
		local var_91_0
		local var_91_1
		local var_91_2
		local var_91_3 = false
		local var_91_4 = 0
		local var_91_5 = {}
		local var_91_6 = var_72_8(arg_91_0)

		for iter_91_0, iter_91_1 in ipairs(arg_72_0._autoCompleteList) do
			for iter_91_2, iter_91_3 in ipairs(iter_91_1.names) do
				local var_91_7, var_91_8 = string.find(iter_91_3, var_91_6[1], 0, true)

				if var_91_7 == 1 and var_91_7 ~= nil then
					if var_91_0 == nil then
						var_91_0 = iter_91_3
						var_91_3 = var_91_8 == string.len(iter_91_3)
					end

					table.insert(var_91_5, iter_91_1)

					var_91_4 = var_91_4 + 1

					break
				end
			end

			if var_91_4 >= LUI.TextChat.MaxAutocompleteOptions then
				break
			end
		end

		if #var_91_5 > 0 and var_91_3 and var_91_5[1].getFirstParamsList then
			if string.len(arg_91_0) > string.len(var_91_0) then
				local var_91_9 = var_91_5[1].getFirstParamsList(arg_72_1, var_91_0 .. " ")
				local var_91_10 = 0

				var_91_5 = {}

				if var_91_9 then
					local var_91_11 = var_91_6[2] and var_91_6[2] or ""

					for iter_91_4, iter_91_5 in ipairs(var_91_9) do
						local var_91_12, var_91_13 = string.find(iter_91_5.displayName, var_91_11, 0, true)

						if var_91_12 == 1 and var_91_12 ~= nil then
							table.insert(var_91_5, iter_91_5)

							if var_91_1 == nil then
								var_91_1 = iter_91_5.name
								var_91_2 = iter_91_5
							end

							var_91_10 = var_91_10 + 1
						end

						if var_91_10 >= LUI.TextChat.MaxAutocompleteOptions then
							break
						end
					end
				end

				if var_91_1 then
					var_91_0 = var_91_1
				end
			end
		else
			arg_72_0._lastFirstParameterMetadata = nil
		end

		if var_91_0 and arg_91_1 then
			if string.len(var_91_0) > string.len(arg_91_0) then
				arg_72_0.TextChatFooter.InputTextButton.textEdit:setTextEditText(var_91_0, true)
			end

			arg_72_0._lastAutocompledText = var_91_0
			arg_72_0._lastFirstParameterMetadata = var_91_2
		else
			arg_72_0._lastAutocompledText = nil
			arg_72_0._lastFirstParameterMetadata = nil
		end

		var_72_10(var_91_5)
	end

	local function var_72_12()
		if arg_72_0._autoCompleteList == nil or #arg_72_0._autoCompleteList > 0 then
			arg_72_0._autoCompleteList = {}
		end

		var_0_35(arg_72_0, arg_72_0._controllerIndex)

		for iter_92_0, iter_92_1 in ipairs(var_0_34) do
			table.insert(arg_72_0._autoCompleteList, {
				names = iter_92_1.names,
				displayName = iter_92_1.autocompleteListString,
				clickCallback = iter_92_1.execute,
				getFirstParamsList = iter_92_1.getFirstParamsList
			})
		end

		if arg_72_0._lastAutocompledText ~= "" and arg_72_0._lastAutocompledText ~= nil then
			var_72_11(arg_72_0._lastAutocompledText, true)
		end
	end

	function arg_72_0.TextChatFooter.InputTextButton.isTypingCallbackFunc(arg_93_0, arg_93_1)
		if arg_93_1 == nil or arg_72_0._lastInputExecuted then
			arg_93_1 = ""
			arg_72_0._lastInputExecuted = false

			var_72_7()
		else
			var_72_11(arg_93_1, string.len(arg_72_0._lastInputText) < string.len(arg_93_1))
		end

		arg_72_0._lastInputText = arg_93_1

		arg_72_0.TextChatFooter.InputTextButton:UpdateInputHintText({
			controllerIndex = arg_72_1
		})
	end

	arg_72_0:addEventHandler("text_edit_space_bar_pressed", function(arg_94_0, arg_94_1)
		if arg_72_0._lastAutocompledText == arg_72_0._lastInputText then
			local var_94_0 = var_72_9(arg_72_0._lastAutocompledText, true)

			arg_72_0._lastInputExecuted = var_94_0
		end

		return true
	end)

	function arg_72_0.TextChatFooter.InputTextButton.textEditCompleteCallbackFunc(arg_95_0, arg_95_1, arg_95_2)
		if arg_95_0 then
			arg_72_0.TextChatFooter.InputTextButton.textEdit:setTextEditText("")
			var_72_6()
			var_0_28(arg_72_0)

			return
		end

		if Engine.ECAJCAJJGF() then
			local var_95_0, var_95_1, var_95_2, var_95_3, var_95_4 = Social.CJCJIAEGDH(arg_72_0._controllerIndex)

			if var_95_0 then
				Social.CEFBABBCGD(arg_72_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_BANNED", var_95_1, var_95_2, var_95_3, var_95_4))

				return
			end
		end

		if arg_72_0.TextChatFooter.InputTextButton._commandsModeActive then
			var_72_9(arg_95_1)

			if Engine.BHICADFIHA() then
				var_72_5(arg_72_0, arg_95_1)
			end
		else
			if arg_72_0._activeChatID and arg_72_0._activeChatType ~= LUI.TextChat.NO_CHAT then
				if arg_95_1 ~= "" then
					Social.ECAJABJEHB(arg_72_0._controllerIndex, arg_72_0._activeChatID, arg_72_0._activeChatType, arg_95_1)

					if arg_72_0._activeChatType == OnlineChatType.PARTY_CHAT then
						local var_95_5 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")

						if var_95_5 and var_95_5:GetValue() <= 1 then
							Social.BEFGJDEHCF(arg_72_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_SOLO_PARTY"))
						end
					end
				end
			elseif arg_95_1 ~= "" then
				if LUI.IsLastInputGamepad(arg_72_0._controllerIndex) then
					Social.CEFBABBCGD(arg_72_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NO_CHANNEL_GAMEPAD"))
				else
					Social.CEFBABBCGD(arg_72_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NO_CHANNEL"))
				end
			end

			if arg_95_2 then
				arg_72_0.TextChatFooter.InputTextButton.TextEditOff()
			elseif var_0_17() or arg_95_1 == "" then
				arg_72_0.TextChatFooter.InputTextButton.TextEditOff()
				Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
				var_0_25(arg_72_0, false)
			end

			var_72_7()
			arg_72_0.TextChatFooter.InputTextButton.textEdit:setTextEditText("")
			arg_72_0.TextChatBody.TextChatEntriesList:ScrollListToEnd()
		end
	end

	function arg_72_0.TextChatBody.TextChatEntriesList.ShouldSetFadeTimers()
		return not var_0_12(arg_72_0)
	end

	function arg_72_0.TextChatBody.TextChatEntriesList.MessagesShouldFade()
		return arg_72_0._currentStyle == LUI.TextChat.Styles.INGAME and not var_0_12(arg_72_0)
	end

	function arg_72_0.TextChatFooter.InputTextButton.buttonActionCallbackFunc()
		Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailOpen)
		var_0_25(arg_72_0, true)
	end

	local var_72_13 = {
		{
			button_ref = "button_home",
			keyprompt_text = "[{chatmodelastused}]",
			helper_text = Engine.CBBHFCGDIC("MENU/PRESS_TO_CHAT")
		}
	}
	local var_72_14 = {
		promptsData = var_72_13
	}

	arg_72_0.BackgroundHover:AddTooltipData(arg_72_1, var_72_14)

	local function var_72_15(arg_99_0, arg_99_1, arg_99_2)
		local var_99_0 = arg_99_0.CollapsedChatLog

		if arg_99_1 == "" or arg_99_1 == nil then
			var_0_22(arg_99_0, arg_72_1)
			var_99_0.Message:SetRGBFromTable(COLORS.grey128)
			var_99_0.Message:SetAlignment(LUI.Alignment.Center)
		else
			var_99_0.Message:setText(arg_99_1)
			var_99_0.Message:SetRGBFromTable(arg_99_2)

			if LUI.TextChat.LastMessageText == nil then
				var_99_0.Message:SetAlignment(LUI.Alignment.Left)
			end
		end

		LUI.TextChat.LastMessageText = arg_99_1
		LUI.TextChat.LastMessageColor = arg_99_2
	end

	arg_72_0:addEventHandler("lui_social_received_message", function(arg_100_0, arg_100_1)
		if arg_100_1.isTransmitted then
			if arg_100_1.chatId == 0 then
				return true
			end

			local var_100_0 = Engine.CCBGEJDJJ(arg_72_0._controllerIndex)

			local function var_100_1(arg_101_0, arg_101_1)
				return (arg_101_0 == OnlineChatType.PARTY_CHAT or arg_101_0 == OnlineChatType.GAME_CHAT or arg_101_0 == OnlineChatType.TEAM_CHAT or arg_101_0 == OnlineChatType.CLAN_CHAT or arg_101_0 == OnlineChatType.PRIVATE_CHAT) and not arg_101_1
			end

			local function var_100_2(arg_102_0)
				return arg_102_0 == OnlineChatType.SYSTEM_EVENT or arg_102_0 == OnlineChatType.SYSTEM_ERROR
			end

			if var_100_0 == NewMessageSoundAlertType.DISABLED then
				-- block empty
			elseif var_100_0 == NewMessageSoundAlertType.PLAYER_MESSAGES then
				if var_100_1(arg_100_1.chatType, arg_100_1.localPlayer) then
					Engine.BJDBIAGIDA(SOUND_SETS.PartyTextChatAudio.classic)
				end
			elseif var_100_0 == NewMessageSoundAlertType.SYSTEM_MESSAGES then
				if var_100_2(arg_100_1.chatType) then
					Engine.BJDBIAGIDA(SOUND_SETS.PartyTextChatAudio.classic)
				end
			elseif var_100_0 == NewMessageSoundAlertType.BOTH and (var_100_1(arg_100_1.chatType, arg_100_1.localPlayer) or var_100_2(arg_100_1.chatType)) then
				Engine.BJDBIAGIDA(SOUND_SETS.PartyTextChatAudio.classic)
			end

			arg_100_1.chatInUse = var_0_12(arg_100_0)

			local var_100_3, var_100_4 = arg_100_0.TextChatBody.TextChatEntriesList:AddChatMessage(arg_100_1)

			var_72_15(arg_100_0, var_100_3.message, var_100_4)
			arg_100_0.TextChatBody.TextChatEntriesList:resetMessagesFadeTimerOnNewMessage()

			if arg_100_1.chatType == OnlineChatType.PRIVATE_CHAT and not arg_100_1.localPlayer then
				arg_100_0._replyTargetChatId = arg_100_1.chatId
			end

			if arg_100_1.localPlayer and arg_100_1.chatType >= OnlineChatType.PARTY_CHAT then
				METRICS.TextChatUsageSendDLogEvent(arg_72_0._controllerIndex)
			end
		elseif arg_100_1.isThrottled then
			Social.BEFGJDEHCF(arg_100_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/MESSAGE_SENDING_THROTTLED"))
		else
			Social.BEFGJDEHCF(arg_100_0._controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/MESSAGE_SENDING_FAILED"))
		end

		return true
	end)
	arg_72_0:addEventHandler("lui_social_member_added", function(arg_103_0, arg_103_1)
		if not arg_103_1.localPlayer then
			local var_103_0 = LUI.TextChat.PrivateChatChannels[arg_103_1.chatId.id]

			if var_103_0 then
				local var_103_1 = split(arg_103_1.gamertag, "#")

				if var_103_1 and #var_103_1 > 0 then
					arg_103_1.gamertag = var_103_1[1]
				end

				var_103_0.name = arg_103_1.gamertag

				if var_0_20(arg_72_0._activeChatID, arg_103_1.chatId) then
					var_0_30(arg_72_0, arg_72_0._activeChatType, arg_72_0._activeChatID)
				end
			end
		end

		return true
	end)

	local function var_72_16(arg_104_0, arg_104_1)
		local var_104_0 = false

		if arg_104_1.chatType ~= OnlineChatType.PRIVATE_CHAT then
			if not var_0_19(arg_104_1.chatType) then
				if arg_104_1.chatType == OnlineChatType.TEAM_CHAT and Engine.EAIICIFIFA() then
					arg_72_0.TextChatFooter.InputTextButton:UpdateInputHintText({
						controllerIndex = arg_72_1
					})

					return true
				end

				LUI.TextChat.ChatChannels[arg_104_1.chatType].id = arg_104_1.chatId
				var_104_0 = LUI.TextChat.LastUserSetChannel == arg_104_1.chatType or arg_72_0._activeChatType == arg_104_1.chatType
			end
		elseif LUI.TextChat.PrivateChatChannels[arg_104_1.chatId.id] == nil then
			local var_104_1 = {
				id = arg_104_1.chatId,
				name = arg_104_1.chatName or ""
			}

			LUI.TextChat.PrivateChatChannels[arg_104_1.chatId.id] = var_104_1

			if arg_104_1.initiatedChat then
				var_0_30(arg_72_0, OnlineChatType.PRIVATE_CHAT, arg_104_1.chatId)
			end
		end

		if not var_104_0 and (arg_72_0._activeChatType == OnlineChatType.PARTY_CHAT or arg_72_0._alreadyAvoidedEmptyPartyChat) then
			local var_104_2 = arg_72_0._alreadyAvoidedEmptyPartyChat

			if not var_104_2 then
				local var_104_3 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")

				var_104_2 = var_104_3 and var_104_3:GetValue() <= 1
			end

			if var_104_2 then
				arg_72_0._alreadyAvoidedEmptyPartyChat = true

				if arg_104_1.chatType == OnlineChatType.TEAM_CHAT then
					var_104_0 = true
				elseif arg_104_1.chatType == OnlineChatType.GAME_CHAT and arg_72_0._activeChatType ~= OnlineChatType.TEAM_CHAT then
					var_104_0 = true
				end
			end
		end

		if var_104_0 or not var_0_14(arg_72_0) and var_0_13(arg_104_1.chatType) then
			var_0_30(arg_72_0, arg_104_1.chatType, arg_104_1.chatId)
		end

		arg_72_0.TextChatFooter.InputTextButton:UpdateInputHintText({
			controllerIndex = arg_72_1
		})

		return true
	end

	arg_72_0:addEventHandler("lui_social_channel_added", var_72_16)
	arg_72_0:addEventHandler("lui_social_channel_removed", function(arg_105_0, arg_105_1)
		local var_105_0 = -1

		if LUI.TextChat.PrivateChatChannels[arg_105_1.chatId.id] then
			var_105_0 = arg_105_1.chatId
		else
			var_105_0 = LUI.TextChat.ChatChannels[arg_105_1.chatType].id
		end

		if var_105_0 ~= nil and var_0_20(var_105_0, arg_105_1.chatId) then
			LUI.TextChat.ChatChannels[arg_105_1.chatType].id = nil

			Dvar.BDEHAEGHAF("LQPKMLTOQM", "")
			Dvar.DFIJDJFIFD("MOOOOTKPTL", LUI.TextChat.NO_CHAT)

			arg_72_0._activeChatID = nil
			arg_72_0._activeChatType = LUI.TextChat.NO_CHAT

			var_72_2(arg_105_0, false)
			var_72_4(false)

			if arg_72_0._activeChatType == LUI.TextChat.NO_CHAT then
				var_0_30(arg_105_0, LUI.TextChat.NO_CHAT, nil)
			end

			var_72_15(arg_72_0, LUI.TextChat.LastMessageText, LUI.TextChat.LastMessageColor, false)
		end

		arg_72_0.TextChatFooter.InputTextButton:UpdateInputHintText({
			controllerIndex = arg_72_1
		})

		return true
	end)
	arg_72_0:addEventHandler("lui_social_game_changed", function(arg_106_0, arg_106_1)
		local var_106_0 = arg_106_1.clientProgramID
		local var_106_1 = FRIENDS.BattleNetGameInfo[var_106_0] and FRIENDS.BattleNetGameInfo[var_106_0].name

		if var_106_1 and var_106_1 ~= "" then
			local var_106_2 = Engine.CBBHFCGDIC(var_106_1)

			if var_106_2 ~= "" and arg_106_1.controller and arg_106_1.platformId then
				Social.DAFDEJICJJ(arg_106_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_STARTED_PLAYING", var_106_2), arg_106_1.platformId, arg_106_1.friendName)
			end
		end
	end)

	local function var_72_17(arg_107_0, arg_107_1)
		local var_107_0 = LUI.FlowManager.GetVisibleMenu()

		if var_107_0 then
			if arg_107_0.TextChatFooter.InputTextButton.topMenuStates[var_107_0.id] == nil then
				arg_107_0.TextChatFooter.InputTextButton.topMenuStates[var_107_0.id] = var_107_0:saveState()
			end

			if LUI.IsLastInputGamepad(arg_107_1.controller) then
				var_107_0:processEvent({
					name = "lose_focus"
				})
				var_107_0:processEvent({
					dispatchChildren = true,
					name = "popup_active"
				})
			end
		else
			return false
		end

		StartEditing(arg_107_0, arg_107_1.controller)

		return true
	end

	local function var_72_18(arg_108_0, arg_108_1)
		if var_0_10(arg_108_0) or not LUI.IsLastInputGamepad(arg_108_1.controller) then
			return false
		end

		local var_108_0 = var_0_12(arg_108_0)

		if not var_108_0 and arg_108_0._currentStyle == LUI.TextChat.Styles.INGAME then
			return false
		end

		if var_0_1(arg_108_0) and var_108_0 then
			if arg_108_1.button == "secondary" then
				var_0_26(arg_108_0, false)
			else
				return true
			end
		end

		local var_108_1 = var_108_0

		if arg_108_1.button == "select" and not var_108_0 and arg_108_1.down then
			var_108_1 = var_72_17(arg_108_0, arg_108_1)
		elseif var_108_0 and arg_108_1.down then
			if arg_108_1.button == "primary" and not Engine.CGABICJHAI() then
				arg_108_0.TextChatFooter.InputTextButton:openVirtualKeyboard(arg_108_1)
			elseif arg_108_1.button == "secondary" or arg_108_1.button == "select" then
				arg_72_0.TextChatFooter.InputTextButton.TextEditOff()
				var_0_25(arg_108_0, false)
				Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
			elseif arg_108_1.button == "shoulderr" then
				var_72_2(arg_108_0, true)
			elseif arg_108_1.button == "shoulderl" then
				var_72_3(arg_108_0, true)
			elseif arg_108_1.button == "rs_up" then
				arg_108_0.TextChatBody:processEvent(arg_108_1)
			elseif arg_108_1.button == "rs_down" then
				arg_108_0.TextChatBody:processEvent(arg_108_1)
			elseif arg_108_1.button == "up" then
				arg_108_0.TextChatBody:processEvent(arg_108_1)
			elseif arg_108_1.button == "down" then
				arg_108_0.TextChatBody:processEvent(arg_108_1)
			end
		end

		return var_108_1
	end

	local function var_72_19(arg_109_0, arg_109_1)
		if arg_109_1.button == "open_chat" or arg_109_1.button == "kp_enter" then
			var_72_12()

			return StartEditing(arg_109_0, arg_109_1.controller)
		elseif arg_109_1.button == "open_match_chat" then
			if not var_0_31(arg_109_0, OnlineChatType.GAME_CHAT) then
				Social.BEFGJDEHCF(arg_109_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_LOBBY"))
			end

			return StartEditing(arg_109_0, arg_109_1.controller)
		elseif arg_109_1.button == "open_team_chat" then
			if not var_0_31(arg_109_0, OnlineChatType.TEAM_CHAT) then
				Social.BEFGJDEHCF(arg_109_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_TEAM"))
			end

			return StartEditing(arg_109_0, arg_109_1.controller)
		elseif arg_109_1.button == "open_party_chat" then
			if not var_0_31(arg_109_0, OnlineChatType.PARTY_CHAT) then
				Social.BEFGJDEHCF(arg_109_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_PARTY"))
			end

			return StartEditing(arg_109_0, arg_109_1.controller)
		elseif arg_109_1.button == "open_clan_chat" then
			if not var_0_31(arg_109_0, OnlineChatType.CLAN_CHAT) then
				Social.BEFGJDEHCF(arg_109_1.controller, Engine.CBBHFCGDIC("LUA_MENU/CHAT_ERROR_NOT_IN_CLAN"))
			end

			return StartEditing(arg_109_0, arg_109_1.controller)
		elseif arg_109_1.button == "up" or arg_109_1.button == "down" then
			local var_109_0 = var_0_12(arg_109_0)

			if var_109_0 and arg_109_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer and not arg_109_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:processEvent(arg_109_1) then
				arg_109_0.TextChatFooter.InputTextButton.TextChatAutocompleteListContainer:processEvent({
					name = "gain_focus",
					controllerIndex = arg_109_1.controller
				})
			end

			return var_109_0
		elseif arg_109_1.button == "secondary" and var_0_8(arg_109_0) and var_0_1(arg_109_0) then
			var_0_26(arg_109_0, false)

			return true
		elseif not var_0_17() and var_0_8(arg_109_0) and var_0_1(arg_109_0) then
			return true
		end
	end

	function LUI.TextChat.processEvent(arg_110_0, arg_110_1)
		if arg_110_0.chat then
			if arg_110_1.name == "gamepad_button" then
				if arg_110_1.controller == arg_110_0._controllerIndex then
					if arg_110_1.qualifier == "gamepad" or arg_110_1.qualifier == "dpad" then
						return var_72_18(arg_110_0.chat, arg_110_1)
					elseif arg_110_1.down and arg_110_1.qualifier == "keyboard" and not var_0_10(arg_110_0.chat) then
						return var_72_19(arg_110_0.chat, arg_110_1)
					end
				elseif var_0_12(arg_110_0.chat) then
					return true
				end
			elseif arg_110_1.name == "pause" and var_0_8(arg_110_0.chat) then
				var_0_26(arg_110_0.chat, false)

				return true
			else
				return LUI.TextChat.super.processEvent(arg_110_0, arg_110_1)
			end
		else
			return false
		end
	end

	local function var_72_20(arg_111_0, arg_111_1)
		if arg_111_1.inside then
			var_72_12()

			if var_0_1(arg_72_0) then
				var_0_26(arg_72_0, not var_0_8(arg_72_0))
			elseif not var_0_7(arg_72_0) then
				arg_72_0.TextChatFooter.InputTextButton.TryStartEditing(arg_72_0.TextChatFooter.InputTextButton, arg_111_1)
			elseif arg_111_0._closeOnClick then
				arg_72_0.TextChatFooter.InputTextButton.TextEditOff()
				Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
				var_0_25(arg_72_0, false)
			end
		end
	end

	arg_72_0.TextChatButton:SetHandleMouse(true)

	arg_72_0.TextChatButton._closeOnClick = true

	arg_72_0.TextChatButton:SetMouseFocusBlocker(true)
	arg_72_0.TextChatButton:addEventHandler("leftmouseup", var_72_20)
	arg_72_0.CollapsedChatLog:SetHandleMouse(true)
	arg_72_0.CollapsedChatLog:SetMouseFocusBlocker(true)
	arg_72_0.CollapsedChatLog:addEventHandler("leftmouseup", var_72_20)
	arg_72_0.CollapsedChatLog.Message:SetLeft(0)
	arg_72_0.CollapsedChatLog.Message:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	arg_72_0.CollapsedChatLog.Message:SetUseEllipses(ELLIPSES.enabled)

	arg_72_0.userWantsToType = nil
	arg_72_0.expandedInactive = nil
	arg_72_0._currentState = -1
	arg_72_0._currentStyle = var_0_17() and LUI.TextChat.Styles.INGAME or LUI.TextChat.Styles.MENU

	var_0_25(arg_72_0, false)

	local var_72_21 = Dvar.DHEEJCCJBH("LQPKMLTOQM")
	local var_72_22 = Dvar.CFHDGABACF("MOOOOTKPTL") or LUI.TextChat.NO_CHAT

	var_0_30(arg_72_0, var_72_22, var_72_21 ~= "" and {
		id = var_72_21
	} or nil)

	local var_72_23 = Social.CJADDJHDGH()

	for iter_72_2 = 1, #var_72_23 do
		var_72_16(nil, var_72_23[iter_72_2])
	end

	if not var_0_14(arg_72_0) then
		var_72_2(arg_72_0, false)
	end

	var_72_4(Engine.CAADCDEEIA())
	var_72_15(arg_72_0, LUI.TextChat.LastMessageText, LUI.TextChat.LastMessageColor, false)
	arg_72_0.BackgroundHover:SetHandleMouse(true)
	arg_72_0.BackgroundHover:addEventHandler("mouseenter", function(arg_112_0, arg_112_1)
		ACTIONS.AnimateSequence(arg_72_0, "ButtonAndFieldHover")
	end)
	arg_72_0.BackgroundHover:addEventHandler("mouseleave", function(arg_113_0, arg_113_1)
		ACTIONS.AnimateSequence(arg_72_0, "ButtonAndFieldOut")
	end)
	arg_72_0.BackgroundHover:addEventHandler("leftmouseup", var_72_20)

	local function var_72_24(arg_114_0, arg_114_1)
		arg_114_0.TextChatBody.TextChatEntriesList.SetScrollbarWantedVisibility(arg_114_0.userWantsToType)

		if LUI.TextChat.LastMessageText == nil then
			var_0_22(arg_114_0, arg_114_1.controllerIndex)
		end
	end

	var_0_27(arg_72_0, not arg_72_0._chatInactive, arg_72_1)
	arg_72_0:addAndCallEventHandler("update_input_type", var_72_24, {
		controllerIndex = arg_72_1
	})
	var_72_12()

	if CONDITIONS.InGame() then
		ACTIONS.ScaleFullscreen(arg_72_0)
	end

	ACTIONS.ScaleFullscreen(arg_72_0.Darkener)
	ACTIONS.AnimateSequence(arg_72_0, "Setup")
end

function TextChat(arg_115_0, arg_115_1)
	local var_115_0 = LUI.UIElement.new()

	var_115_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_115_0.id = "TextChat"
	var_115_0._animationSets = var_115_0._animationSets or {}
	var_115_0._sequences = var_115_0._sequences or {}

	local var_115_1 = arg_115_1 and arg_115_1.controllerIndex

	if not var_115_1 and not Engine.DDJFBBJAIG() then
		var_115_1 = var_115_0:getRootController()
	end

	assert(var_115_1)

	local var_115_2 = var_115_0
	local var_115_3
	local var_115_4 = LUI.UIImage.new()

	var_115_4.id = "Darkener"

	var_115_4:SetRGBFromInt(0, 0)
	var_115_4:SetAlpha(0, 0)
	var_115_0:addElement(var_115_4)

	var_115_0.Darkener = var_115_4

	local var_115_5
	local var_115_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_115_1
	})

	var_115_6.id = "BackgroundHover"

	var_115_6:SetAlpha(0, 0)
	var_115_6.Text:SetLeft(_1080p * 20, 0)
	var_115_6.Text:setText(ToUpperCase(""), 0)
	var_115_6.Text:SetAlignment(LUI.Alignment.Left)
	var_115_6:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -566, _1080p * -91, _1080p * -52, _1080p * -20)
	var_115_0:addElement(var_115_6)

	var_115_0.BackgroundHover = var_115_6

	local var_115_7
	local var_115_8 = LUI.UIImage.new()

	var_115_8.id = "CollapsedChatLogBacker"

	var_115_8:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_115_8:SetAlpha(0.5, 0)
	var_115_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -566, _1080p * -91, _1080p * -49, _1080p * -25)
	var_115_0:addElement(var_115_8)

	var_115_0.CollapsedChatLogBacker = var_115_8

	local var_115_9
	local var_115_10 = MenuBuilder.BuildRegisteredType("TextChatEntryLine", {
		controllerIndex = var_115_1
	})

	var_115_10.id = "CollapsedChatLog"

	var_115_10:SetAlpha(0, 0)
	var_115_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -531, _1080p * -91, _1080p * -49, _1080p * -25)
	var_115_0:addElement(var_115_10)

	var_115_0.CollapsedChatLog = var_115_10

	local var_115_11
	local var_115_12 = MenuBuilder.BuildRegisteredType("TextChatBody", {
		controllerIndex = var_115_1
	})

	var_115_12.id = "TextChatBody"

	var_115_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -531, _1080p * -91, _1080p * -243, _1080p * -57)
	var_115_0:addElement(var_115_12)

	var_115_0.TextChatBody = var_115_12

	local var_115_13
	local var_115_14 = LUI.UIImage.new()

	var_115_14.id = "TextChatFooterInGameBacker"

	var_115_14:SetRGBFromTable(SWATCHES.genericButton.textFocusAlt, 0)
	var_115_14:SetAlpha(0, 0)
	var_115_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -76, _1080p * -546, _1080p * -731, _1080p * -677)
	var_115_0:addElement(var_115_14)

	var_115_0.TextChatFooterInGameBacker = var_115_14

	local var_115_15
	local var_115_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_115_17 = LUI.UIBorder.new(var_115_16)

	var_115_17.id = "TextChatInGameBorder"

	var_115_17:SetRGBFromTable(SWATCHES.CAC.button, 0)
	var_115_17:SetAlpha(0, 0)
	var_115_17:SetBorderThicknessTop(_1080p * 0, 0)
	var_115_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -566, _1080p * -96, _1080p * 302, _1080p * 356)
	var_115_0:addElement(var_115_17)

	var_115_0.TextChatInGameBorder = var_115_17

	local var_115_18
	local var_115_19 = MenuBuilder.BuildRegisteredType("TextChatFooter", {
		controllerIndex = var_115_1
	})

	var_115_19.id = "TextChatFooter"

	var_115_19:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -531, _1080p * -91, _1080p * -54, _1080p * -21)
	var_115_0:addElement(var_115_19)

	var_115_0.TextChatFooter = var_115_19

	local var_115_20
	local var_115_21 = MenuBuilder.BuildRegisteredType("TextChatButton", {
		controllerIndex = var_115_1
	})

	var_115_21.id = "TextChatButton"

	var_115_21:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -565, _1080p * -535, _1080p * -52, _1080p * -22)
	var_115_0:addElement(var_115_21)

	var_115_0.TextChatButton = var_115_21

	local var_115_22
	local var_115_23 = LUI.UIStyledText.new()

	var_115_23.id = "InactiveChatMessage"

	var_115_23:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_115_23:SetAlpha(0, 0)
	var_115_23:setText(Engine.CBBHFCGDIC("MENU/CHAT_DISABLED"), 0)
	var_115_23:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_115_23:SetAlignment(LUI.Alignment.Center)
	var_115_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_115_23:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -521, _1080p * -101, _1080p * -47, _1080p * -28)
	var_115_0:addElement(var_115_23)

	var_115_0.InactiveChatMessage = var_115_23

	local var_115_24
	local var_115_25 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_115_1
	})

	var_115_25.id = "PromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_115_25.Label:setText("ButtonPrompt", 0)
	end

	var_115_25:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -600, _1080p * -112, _1080p * -298, _1080p * -267)
	var_115_0:addElement(var_115_25)

	var_115_0.PromptContainer = var_115_25

	local var_115_26
	local var_115_27 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "wdg_circle_progressbar_back_rim",
		segmentCount = 2,
		controllerIndex = var_115_1
	}
	local var_115_28 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_115_27)

	var_115_28.id = "RadialProgressBarelement"

	var_115_28:SetProgress(0)
	var_115_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1359, _1080p * 1391, _1080p * 1028, _1080p * 1060)
	var_115_0:addElement(var_115_28)

	var_115_0.RadialProgressBarelement = var_115_28

	local function var_115_29()
		return
	end

	var_115_0._sequences.DefaultSequence = var_115_29

	local var_115_30
	local var_115_31 = {
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
		}
	}

	var_115_6:RegisterAnimationSequence("Expanded", var_115_31)

	local var_115_32 = {
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
		}
	}

	var_115_8:RegisterAnimationSequence("Expanded", var_115_32)

	local var_115_33 = {
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

	var_115_10:RegisterAnimationSequence("Expanded", var_115_33)

	local var_115_34 = {
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

	var_115_12:RegisterAnimationSequence("Expanded", var_115_34)

	local var_115_35 = {
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

	var_115_14:RegisterAnimationSequence("Expanded", var_115_35)

	local var_115_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_17:RegisterAnimationSequence("Expanded", var_115_36)

	local var_115_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_115_19:RegisterAnimationSequence("Expanded", var_115_37)

	local var_115_38 = {
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
		}
	}

	var_115_21:RegisterAnimationSequence("Expanded", var_115_38)

	local var_115_39 = {
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

	var_115_23:RegisterAnimationSequence("Expanded", var_115_39)

	local var_115_40 = {
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

	var_115_25:RegisterAnimationSequence("Expanded", var_115_40)

	local function var_115_41()
		var_115_6:AnimateSequence("Expanded")
		var_115_8:AnimateSequence("Expanded")
		var_115_10:AnimateSequence("Expanded")
		var_115_12:AnimateSequence("Expanded")
		var_115_14:AnimateSequence("Expanded")
		var_115_17:AnimateSequence("Expanded")
		var_115_19:AnimateSequence("Expanded")
		var_115_21:AnimateSequence("Expanded")
		var_115_23:AnimateSequence("Expanded")
		var_115_25:AnimateSequence("Expanded")
	end

	var_115_0._sequences.Expanded = var_115_41

	local var_115_42
	local var_115_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_6:RegisterAnimationSequence("InGameExpanded", var_115_43)

	local var_115_44 = {
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

	var_115_8:RegisterAnimationSequence("InGameExpanded", var_115_44)

	local var_115_45 = {
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

	var_115_10:RegisterAnimationSequence("InGameExpanded", var_115_45)

	local var_115_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
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

	var_115_12:RegisterAnimationSequence("InGameExpanded", var_115_46)

	local var_115_47 = {
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

	var_115_14:RegisterAnimationSequence("InGameExpanded", var_115_47)

	local var_115_48 = {
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

	var_115_17:RegisterAnimationSequence("InGameExpanded", var_115_48)

	local var_115_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
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

	var_115_19:RegisterAnimationSequence("InGameExpanded", var_115_49)

	local var_115_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_21:RegisterAnimationSequence("InGameExpanded", var_115_50)

	local var_115_51 = {
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

	var_115_23:RegisterAnimationSequence("InGameExpanded", var_115_51)

	local var_115_52 = {
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

	var_115_25:RegisterAnimationSequence("InGameExpanded", var_115_52)

	local function var_115_53()
		var_115_6:AnimateSequence("InGameExpanded")
		var_115_8:AnimateSequence("InGameExpanded")
		var_115_10:AnimateSequence("InGameExpanded")
		var_115_12:AnimateSequence("InGameExpanded")
		var_115_14:AnimateSequence("InGameExpanded")
		var_115_17:AnimateSequence("InGameExpanded")
		var_115_19:AnimateSequence("InGameExpanded")
		var_115_21:AnimateSequence("InGameExpanded")
		var_115_23:AnimateSequence("InGameExpanded")
		var_115_25:AnimateSequence("InGameExpanded")
	end

	var_115_0._sequences.InGameExpanded = var_115_53

	local var_115_54
	local var_115_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_6:RegisterAnimationSequence("InGameCollapsed", var_115_55)

	local var_115_56 = {
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

	var_115_8:RegisterAnimationSequence("InGameCollapsed", var_115_56)

	local var_115_57 = {
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

	var_115_10:RegisterAnimationSequence("InGameCollapsed", var_115_57)

	local var_115_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 185
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
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

	var_115_12:RegisterAnimationSequence("InGameCollapsed", var_115_58)

	local var_115_59 = {
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

	var_115_14:RegisterAnimationSequence("InGameCollapsed", var_115_59)

	local var_115_60 = {
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

	var_115_17:RegisterAnimationSequence("InGameCollapsed", var_115_60)

	local var_115_61 = {
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

	var_115_19:RegisterAnimationSequence("InGameCollapsed", var_115_61)

	local var_115_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_21:RegisterAnimationSequence("InGameCollapsed", var_115_62)

	local var_115_63 = {
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

	var_115_23:RegisterAnimationSequence("InGameCollapsed", var_115_63)

	local var_115_64 = {
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

	var_115_25:RegisterAnimationSequence("InGameCollapsed", var_115_64)

	local function var_115_65()
		var_115_6:AnimateSequence("InGameCollapsed")
		var_115_8:AnimateSequence("InGameCollapsed")
		var_115_10:AnimateSequence("InGameCollapsed")
		var_115_12:AnimateSequence("InGameCollapsed")
		var_115_14:AnimateSequence("InGameCollapsed")
		var_115_17:AnimateSequence("InGameCollapsed")
		var_115_19:AnimateSequence("InGameCollapsed")
		var_115_21:AnimateSequence("InGameCollapsed")
		var_115_23:AnimateSequence("InGameCollapsed")
		var_115_25:AnimateSequence("InGameCollapsed")
	end

	var_115_0._sequences.InGameCollapsed = var_115_65

	local var_115_66
	local var_115_67 = {
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
		}
	}

	var_115_6:RegisterAnimationSequence("CollapsedSingle", var_115_67)

	local var_115_68 = {
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
		}
	}

	var_115_8:RegisterAnimationSequence("CollapsedSingle", var_115_68)

	local var_115_69 = {
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

	var_115_10:RegisterAnimationSequence("CollapsedSingle", var_115_69)

	local var_115_70 = {
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
		}
	}

	var_115_12:RegisterAnimationSequence("CollapsedSingle", var_115_70)

	local var_115_71 = {
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

	var_115_14:RegisterAnimationSequence("CollapsedSingle", var_115_71)

	local var_115_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_17:RegisterAnimationSequence("CollapsedSingle", var_115_72)

	local var_115_73 = {
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

	var_115_19:RegisterAnimationSequence("CollapsedSingle", var_115_73)

	local var_115_74 = {
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

	var_115_21:RegisterAnimationSequence("CollapsedSingle", var_115_74)

	local var_115_75 = {
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

	var_115_23:RegisterAnimationSequence("CollapsedSingle", var_115_75)

	local var_115_76 = {
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

	var_115_25:RegisterAnimationSequence("CollapsedSingle", var_115_76)

	local function var_115_77()
		var_115_6:AnimateSequence("CollapsedSingle")
		var_115_8:AnimateSequence("CollapsedSingle")
		var_115_10:AnimateSequence("CollapsedSingle")
		var_115_12:AnimateSequence("CollapsedSingle")
		var_115_14:AnimateSequence("CollapsedSingle")
		var_115_17:AnimateSequence("CollapsedSingle")
		var_115_19:AnimateSequence("CollapsedSingle")
		var_115_21:AnimateSequence("CollapsedSingle")
		var_115_23:AnimateSequence("CollapsedSingle")
		var_115_25:AnimateSequence("CollapsedSingle")
	end

	var_115_0._sequences.CollapsedSingle = var_115_77

	local var_115_78
	local var_115_79 = {
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
		}
	}

	var_115_8:RegisterAnimationSequence("CommonMenu", var_115_79)

	local var_115_80 = {
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

	var_115_10:RegisterAnimationSequence("CommonMenu", var_115_80)

	local var_115_81 = {
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

	var_115_12:RegisterAnimationSequence("CommonMenu", var_115_81)

	local var_115_82 = {
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

	var_115_14:RegisterAnimationSequence("CommonMenu", var_115_82)

	local var_115_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_17:RegisterAnimationSequence("CommonMenu", var_115_83)

	local var_115_84 = {
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

	var_115_19:RegisterAnimationSequence("CommonMenu", var_115_84)

	local var_115_85 = {
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
		}
	}

	var_115_21:RegisterAnimationSequence("CommonMenu", var_115_85)

	local var_115_86 = {
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
		}
	}

	var_115_23:RegisterAnimationSequence("CommonMenu", var_115_86)

	local var_115_87 = {
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

	var_115_25:RegisterAnimationSequence("CommonMenu", var_115_87)

	local function var_115_88()
		var_115_8:AnimateSequence("CommonMenu")
		var_115_10:AnimateSequence("CommonMenu")
		var_115_12:AnimateSequence("CommonMenu")
		var_115_14:AnimateSequence("CommonMenu")
		var_115_17:AnimateSequence("CommonMenu")
		var_115_19:AnimateSequence("CommonMenu")
		var_115_21:AnimateSequence("CommonMenu")
		var_115_23:AnimateSequence("CommonMenu")
		var_115_25:AnimateSequence("CommonMenu")
	end

	var_115_0._sequences.CommonMenu = var_115_88

	local var_115_89
	local var_115_90 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_21:RegisterAnimationSequence("ButtonAndFieldHover", var_115_90)

	local function var_115_91()
		var_115_21:AnimateSequence("ButtonAndFieldHover")
	end

	var_115_0._sequences.ButtonAndFieldHover = var_115_91

	local var_115_92
	local var_115_93 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_115_21:RegisterAnimationSequence("ButtonAndFieldOut", var_115_93)

	local function var_115_94()
		var_115_21:AnimateSequence("ButtonAndFieldOut")
	end

	var_115_0._sequences.ButtonAndFieldOut = var_115_94

	local var_115_95
	local var_115_96 = {
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

	var_115_21:RegisterAnimationSequence("ButtonAndFieldUpDisabled", var_115_96)

	local function var_115_97()
		var_115_21:AnimateSequence("ButtonAndFieldUpDisabled")
	end

	var_115_0._sequences.ButtonAndFieldUpDisabled = var_115_97

	local var_115_98
	local var_115_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_115_21:RegisterAnimationSequence("ButtonAndFieldEnabled", var_115_99)

	local function var_115_100()
		var_115_21:AnimateSequence("ButtonAndFieldEnabled")
	end

	var_115_0._sequences.ButtonAndFieldEnabled = var_115_100

	local var_115_101
	local var_115_102 = {
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

	var_115_21:RegisterAnimationSequence("ButtonAndFieldHoverDisabled", var_115_102)

	local function var_115_103()
		var_115_21:AnimateSequence("ButtonAndFieldHoverDisabled")
	end

	var_115_0._sequences.ButtonAndFieldHoverDisabled = var_115_103

	local var_115_104
	local var_115_105 = {
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

	var_115_21:RegisterAnimationSequence("ButtonAndFieldDisabled", var_115_105)

	local function var_115_106()
		var_115_21:AnimateSequence("ButtonAndFieldDisabled")
	end

	var_115_0._sequences.ButtonAndFieldDisabled = var_115_106

	local var_115_107
	local var_115_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_115_6:RegisterAnimationSequence("ExpandedInactive", var_115_108)

	local var_115_109 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_115_8:RegisterAnimationSequence("ExpandedInactive", var_115_109)

	local var_115_110 = {
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

	var_115_10:RegisterAnimationSequence("ExpandedInactive", var_115_110)

	local var_115_111 = {
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_115_12:RegisterAnimationSequence("ExpandedInactive", var_115_111)

	local var_115_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_115_14:RegisterAnimationSequence("ExpandedInactive", var_115_112)

	local var_115_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_17:RegisterAnimationSequence("ExpandedInactive", var_115_113)

	local var_115_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_115_19:RegisterAnimationSequence("ExpandedInactive", var_115_114)

	local var_115_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_115_21:RegisterAnimationSequence("ExpandedInactive", var_115_115)

	local var_115_116 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_23:RegisterAnimationSequence("ExpandedInactive", var_115_116)

	local var_115_117 = {
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

	var_115_25:RegisterAnimationSequence("ExpandedInactive", var_115_117)

	local function var_115_118()
		var_115_6:AnimateSequence("ExpandedInactive")
		var_115_8:AnimateSequence("ExpandedInactive")
		var_115_10:AnimateSequence("ExpandedInactive")
		var_115_12:AnimateSequence("ExpandedInactive")
		var_115_14:AnimateSequence("ExpandedInactive")
		var_115_17:AnimateSequence("ExpandedInactive")
		var_115_19:AnimateSequence("ExpandedInactive")
		var_115_21:AnimateSequence("ExpandedInactive")
		var_115_23:AnimateSequence("ExpandedInactive")
		var_115_25:AnimateSequence("ExpandedInactive")
	end

	var_115_0._sequences.ExpandedInactive = var_115_118

	local var_115_119
	local var_115_120 = {
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
		}
	}

	var_115_8:RegisterAnimationSequence("InGameExpandedInactive", var_115_120)

	local var_115_121 = {
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

	var_115_10:RegisterAnimationSequence("InGameExpandedInactive", var_115_121)

	local var_115_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
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

	var_115_12:RegisterAnimationSequence("InGameExpandedInactive", var_115_122)

	local var_115_123 = {
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

	var_115_14:RegisterAnimationSequence("InGameExpandedInactive", var_115_123)

	local var_115_124 = {
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

	var_115_17:RegisterAnimationSequence("InGameExpandedInactive", var_115_124)

	local var_115_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
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

	var_115_19:RegisterAnimationSequence("InGameExpandedInactive", var_115_125)

	local var_115_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_21:RegisterAnimationSequence("InGameExpandedInactive", var_115_126)

	local var_115_127 = {
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

	var_115_23:RegisterAnimationSequence("InGameExpandedInactive", var_115_127)

	local var_115_128 = {
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

	var_115_25:RegisterAnimationSequence("InGameExpandedInactive", var_115_128)

	local function var_115_129()
		var_115_8:AnimateSequence("InGameExpandedInactive")
		var_115_10:AnimateSequence("InGameExpandedInactive")
		var_115_12:AnimateSequence("InGameExpandedInactive")
		var_115_14:AnimateSequence("InGameExpandedInactive")
		var_115_17:AnimateSequence("InGameExpandedInactive")
		var_115_19:AnimateSequence("InGameExpandedInactive")
		var_115_21:AnimateSequence("InGameExpandedInactive")
		var_115_23:AnimateSequence("InGameExpandedInactive")
		var_115_25:AnimateSequence("InGameExpandedInactive")
	end

	var_115_0._sequences.InGameExpandedInactive = var_115_129

	local var_115_130
	local var_115_131 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_4:RegisterAnimationSequence("ShowDarkener", var_115_131)

	local function var_115_132()
		var_115_4:AnimateSequence("ShowDarkener")
	end

	var_115_0._sequences.ShowDarkener = var_115_132

	local var_115_133
	local var_115_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_4:RegisterAnimationSequence("HideDarkener", var_115_134)

	local function var_115_135()
		var_115_4:AnimateSequence("HideDarkener")
	end

	var_115_0._sequences.HideDarkener = var_115_135

	local var_115_136
	local var_115_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_115_12:RegisterAnimationSequence("Setup", var_115_137)

	local function var_115_138()
		var_115_12:AnimateSequence("Setup")
	end

	var_115_0._sequences.Setup = var_115_138

	var_115_19:addEventHandler("button_over", function(arg_133_0, arg_133_1)
		if not arg_133_1.controller then
			local var_133_0 = var_115_1
		end

		ACTIONS.AnimateSequenceByElement(var_115_0, {
			elementPath = "self.TextChatFooter",
			sequenceName = "GainFocus",
			elementName = "TextChatFooter"
		})
	end)
	var_0_36(var_115_0, var_115_1, arg_115_1)

	return var_115_0
end

MenuBuilder.registerType("TextChat", TextChat)
LockTable(_M)
