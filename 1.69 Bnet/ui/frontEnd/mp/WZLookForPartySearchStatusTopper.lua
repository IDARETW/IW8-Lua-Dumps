module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		displayTime = 2000,
		header = Engine.CBBHFCGDIC("MENU/LOOKING_FOR_PARTY_NO_ELIPSIS"),
		description = arg_1_2 and Engine.CBBHFCGDIC(arg_1_2) or nil,
		type = LUI.ToastManager.NotificationType.LookForParty,
		controllerIndex = arg_1_1
	}

	arg_1_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_1_0
	})
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Lobby.GFFECBCCF()
	local var_2_1 = Lobby.BGIADHIHAG()
	local var_2_2 = Lobby.DGDCDCHFGD()
	local var_2_3 = Lobby.BBDICGHE()
	local var_2_4 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()
	local var_2_5 = var_2_1 == false and Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE ~= nil and Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE or Dvar.CFHDGABACF("MLSNOOMMNO")
	local var_2_6 = var_2_5 - var_2_4
	local var_2_7 = LUI.clamp(var_2_6, 0, var_2_5)
	local var_2_8
	local var_2_9
	local var_2_10
	local var_2_11

	if var_2_2 ~= true then
		if var_2_7 <= 0 and var_2_4 > 1 and not var_2_3 then
			var_2_8 = "MENU/PARTY_FULL"
			var_2_11 = "ShowTextOnly"
		else
			var_2_11 = "HideAll"
		end
	elseif var_2_0 ~= true or var_2_4 <= 1 then
		var_2_8 = "MENU/LOOKING_FOR_PARTY_NO_ELIPSIS"
		var_2_11 = "ShowAll"
	elseif var_2_7 == 0 then
		var_2_8 = "MENU/PARTY_FULL"
		var_2_11 = "ShowTextOnly"
	else
		var_2_8 = "MENU/SEARCHING_FOR_N_MEMBERS"
		var_2_9 = var_2_7
		var_2_11 = "ShowAll"
	end

	ACTIONS.AnimateSequence(arg_2_0, var_2_11)

	if var_2_8 then
		arg_2_0.JoinStatusText:setText(Engine.CBBHFCGDIC(var_2_8, var_2_9))
	end

	if var_2_1 ~= true and Lobby.LOOK_FOR_PARTY_PREV_IS_SEARCHING_FOR_GROUP ~= true and var_2_4 > 1 and var_2_7 > 0 and var_2_2 == true then
		var_0_0(arg_2_0, arg_2_1, "LUA_MENU/SEARCH_HAS_STARTED")
	end

	if var_2_1 ~= true and Lobby.LOOK_FOR_PARTY_PREV_IS_SEARCHING_FOR_GROUP == true and var_2_4 > 1 and var_2_7 > 0 and var_2_2 == false then
		var_0_0(arg_2_0, arg_2_1, "LUA_MENU/SEARCH_HAS_STOPPED")
	end

	if var_2_1 == true and Lobby.LOOK_FOR_PARTY_PREV_IS_SEARCHING_FOR_GROUP == true and var_2_4 > 1 and var_2_7 == 0 and (var_2_4 ~= Lobby.LOOK_FOR_PARTY_PREV_CURRENT_PLAYER_COUNT or var_2_7 ~= Lobby.LOOK_FOR_PARTY_PREV_REQUIRED_PLAYER_COUNT) and Lobby.LOOK_FOR_PARTY_FULL_TOAST_SHOWABLE ~= false then
		var_0_0(arg_2_0, arg_2_1, "LUA_MENU/PARTY_IS_FULL_FIND_A_MATCH")

		Lobby.LOOK_FOR_PARTY_FULL_TOAST_SHOWABLE = false
	else
		Lobby.LOOK_FOR_PARTY_FULL_TOAST_SHOWABLE = true
	end

	local var_2_12 = Lobby.BEGGHJIBDC()

	if var_2_1 ~= true and Lobby.LOOK_FOR_PARTY_PREV_HOST_STRING ~= var_2_12 then
		var_0_0(arg_2_0, arg_2_1, "LUA_MENU/PARTY_SETTINGS_UPDATED")
	end

	Lobby.LOOK_FOR_PARTY_PREV_HOST_STRING = var_2_12
	Lobby.LOOK_FOR_PARTY_PREV_IS_SEARCHING_FOR_GROUP = var_2_2
	Lobby.LOOK_FOR_PARTY_PREV_CURRENT_PLAYER_COUNT = var_2_4
	Lobby.LOOK_FOR_PARTY_PREV_REQUIRED_PLAYER_COUNT = var_2_7

	if Lobby.LOOK_FOR_PARTY_OPTIONS ~= nil then
		if not Lobby.LOOK_FOR_PARTY_OPTIONS._isSearchingForGroup then
			Lobby.CheckAndGeneratePlayerLFPSession(arg_2_1, Lobby.LFPEvents.LEAVE)
		elseif var_2_7 == 0 then
			Lobby.CheckAndGeneratePlayerLFPSession(arg_2_1, Lobby.LFPEvents.SUCCESS)
		end
	end
end

local function var_0_2(arg_3_0)
	if not DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_3_0, METRICS.LFPVariables.PARTY_CREATED) then
		return
	end

	local var_3_0 = tonumber(Engine.DEIDGHDBHD())
	local var_3_1 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_3_0, METRICS.LFPVariables.GAME_START_TIME)

	if var_3_1 ~= 0 then
		local var_3_2 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_3_0, METRICS.LFPVariables.TOTAL_GAME_TIME) + (var_3_0 - var_3_1)

		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_3_0, METRICS.LFPVariables.TOTAL_GAME_TIME, var_3_2)
		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_3_0, METRICS.LFPVariables.GAME_START_TIME, 0)
	end
end

local function var_0_3(arg_4_0)
	if not DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_4_0, METRICS.LFPVariables.PARTY_CREATED) then
		return
	end

	if DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_4_0, METRICS.LFPVariables.FRONT_END_START_TIME) == 0 then
		local var_4_0 = tonumber(Engine.DEIDGHDBHD())

		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_4_0, METRICS.LFPVariables.FRONT_END_START_TIME, var_4_0)
	end
end

local function var_0_4(arg_5_0)
	local var_5_0 = tonumber(Engine.DEIDGHDBHD())
	local var_5_1 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.PARTY_CREATED)
	local var_5_2
	local var_5_3
	local var_5_4
	local var_5_5

	if var_5_1 then
		local var_5_6 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.STARTING_PLAYERS_IN_PARTY)
		local var_5_7 = Lobby.LFPUtils.ConvertLobbyPlayerStringToTable(var_5_6)
		local var_5_8 = Lobby.LFPUtils.GetLobbyPlayersTable(arg_5_0, true, var_5_7)

		var_5_5 = Lobby.LFPUtils.UnknownPlayersChanged(var_5_7, var_5_8, {
			_compareIntialList = true
		})
	end

	if var_5_1 and var_5_5 then
		local var_5_9 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.PARTY_START_TIME)
		local var_5_10 = var_5_0
		local var_5_11 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.PARTY_END_REASON)

		if var_5_11 == nil then
			var_5_11 = Lobby.LFPEvents.LEAVE
		end

		local var_5_12 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.TOTAL_MATCHES_PLAYED)
		local var_5_13 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.TOTAL_GAME_TIME) * 1000
		local var_5_14 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.FRONT_END_START_TIME)

		if var_5_14 ~= 0 then
			local var_5_15 = var_5_0 - var_5_14
			local var_5_16 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME)

			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_5_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME, var_5_16 + var_5_15)
			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_5_0, METRICS.LFPVariables.FRONT_END_START_TIME, 0)
		end

		local var_5_17 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.MATCH_IDS)
		local var_5_18 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.LFP_SESSION_ID)
		local var_5_19 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_5_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME) * 1000

		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_5_0, METRICS.LFPVariables.PARTY_CREATED, false)
		METRICS.LFPPartySessionDLogEvent(arg_5_0, var_5_9, var_5_10, var_5_11, var_5_12, var_5_13, var_5_19, var_5_17, var_5_18)
		Lobby.ResetLFPPartyCreationSuccess(arg_5_0)
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_6_1, METRICS.LFPVariables.PARTY_CREATED)
	local var_6_1, var_6_2 = Lobby.BGIBDIBHH()

	if var_6_2.timeRemaining == nil then
		return
	end

	local var_6_3 = var_6_2.timeRemaining / 1000

	if var_6_1 == Lobby.PartyState.STARTING and var_6_3 <= 1 then
		if not var_6_0 then
			return
		end

		if DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_6_1, METRICS.LFPVariables.GAME_START_TIME) == 0 then
			local var_6_4 = tonumber(Engine.DEIDGHDBHD())

			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_6_1, METRICS.LFPVariables.GAME_START_TIME, var_6_4)

			local var_6_5 = var_6_4 - DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_6_1, METRICS.LFPVariables.FRONT_END_START_TIME)
			local var_6_6 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_6_1, METRICS.LFPVariables.TOTAL_FRONT_END_TIME)

			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_6_1, METRICS.LFPVariables.TOTAL_FRONT_END_TIME, var_6_6 + var_6_5)
			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_6_1, METRICS.LFPVariables.FRONT_END_START_TIME, 0)

			local var_6_7 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_6_1, METRICS.LFPVariables.TOTAL_MATCHES_PLAYED)

			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_6_1, METRICS.LFPVariables.TOTAL_MATCHES_PLAYED, var_6_7 + 1)

			local var_6_8 = Engine.CHFHFAIFFG()
			local var_6_9 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_6_1, METRICS.LFPVariables.MATCH_IDS)

			if var_6_9 == "" then
				var_6_9 = var_6_8
			else
				var_6_9 = var_6_9 .. "," .. var_6_8
			end

			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_6_1, METRICS.LFPVariables.MATCH_IDS, var_6_9)
		end

		arg_6_0._lfpPartyTimer:closeTree()
		arg_6_0._lfpMatchStartTimer:closeTree()

		arg_6_0._lfpPartyTimer = nil
		arg_6_0._lfpMatchStartTimer = nil
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.Update = var_0_1

	local var_7_0 = LUI.UITimer.new({
		interval = 500,
		event = "update_lfg_topper_status"
	})

	var_7_0.id = "lobbyStatusTimer"

	arg_7_0:addElement(var_7_0)
	arg_7_0:registerAndCallEventHandler("update_lfg_topper_status", function(arg_8_0, arg_8_1)
		var_0_1(arg_7_0, arg_7_1)
	end)
	var_0_2(arg_7_1)
	var_0_3(arg_7_1)

	arg_7_0._lfpPartyTimer = LUI.UITimer.new({
		interval = 5000,
		event = "lfp_party_update"
	})
	arg_7_0._lfpPartyTimer.id = "LFPPartyTimer"

	arg_7_0:addElement(arg_7_0._lfpPartyTimer)
	arg_7_0:addAndCallEventHandler("lfp_party_update", function(arg_9_0, arg_9_1)
		var_0_4(arg_7_1)
	end)

	arg_7_0._lfpMatchStartTimer = LUI.UITimer.new({
		interval = 500,
		event = "lfp_match_update"
	})
	arg_7_0._lfpMatchStartTimer.id = "LFPMatchTimer"

	arg_7_0:addElement(arg_7_0._lfpMatchStartTimer)
	arg_7_0:addAndCallEventHandler("lfp_match_update", function(arg_10_0, arg_10_1)
		var_0_5(arg_7_0, arg_7_1)
	end)
end

function WZLookForPartySearchStatusTopper(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 43 * _1080p)

	var_11_0.id = "WZLookForPartySearchStatusTopper"
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

	var_11_4.id = "RightBox"

	var_11_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_11_4:SetAlpha(0, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 254, _1080p * 283, _1080p * 35, _1080p * 41)
	var_11_0:addElement(var_11_4)

	var_11_0.RightBox = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "LeftBox"

	var_11_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_11_6:SetAlpha(0, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 77, _1080p * 106, _1080p * 35, _1080p * 41)
	var_11_0:addElement(var_11_6)

	var_11_0.LeftBox = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Line"

	var_11_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_11_8:setImage(RegisterMaterial("spinner_loading"), 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 61, _1080p * 299, _1080p * 32, _1080p * 42)
	var_11_0:addElement(var_11_8)

	var_11_0.Line = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIText.new()

	var_11_10.id = "JoinStatusText"

	var_11_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_11_10:SetAlpha(0.8, 0)
	var_11_10:setText("", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_10:SetAlignment(LUI.Alignment.Center)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 360, 0, _1080p * 24)
	var_11_0:addElement(var_11_10)

	var_11_0.JoinStatusText = var_11_10

	local function var_11_11()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_11

	local var_11_12
	local var_11_13 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ShowAll", var_11_13)

	local var_11_14 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ShowAll", var_11_14)

	local var_11_15 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ShowAll", var_11_15)

	local var_11_16 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ShowAll", var_11_16)

	local function var_11_17()
		var_11_4:AnimateSequence("ShowAll")
		var_11_6:AnimateSequence("ShowAll")
		var_11_8:AnimateSequence("ShowAll")
		var_11_10:AnimateSequence("ShowAll")
	end

	var_11_0._sequences.ShowAll = var_11_17

	local var_11_18
	local var_11_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("HideAll", var_11_19)

	local var_11_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("HideAll", var_11_20)

	local var_11_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("HideAll", var_11_21)

	local var_11_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("HideAll", var_11_22)

	local function var_11_23()
		var_11_4:AnimateSequence("HideAll")
		var_11_6:AnimateSequence("HideAll")
		var_11_8:AnimateSequence("HideAll")
		var_11_10:AnimateSequence("HideAll")
	end

	var_11_0._sequences.HideAll = var_11_23

	local var_11_24
	local var_11_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ShowTextOnly", var_11_25)

	local var_11_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ShowTextOnly", var_11_26)

	local var_11_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ShowTextOnly", var_11_27)

	local var_11_28 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ShowTextOnly", var_11_28)

	local function var_11_29()
		var_11_4:AnimateSequence("ShowTextOnly")
		var_11_6:AnimateSequence("ShowTextOnly")
		var_11_8:AnimateSequence("ShowTextOnly")
		var_11_10:AnimateSequence("ShowTextOnly")
	end

	var_11_0._sequences.ShowTextOnly = var_11_29

	var_0_6(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WZLookForPartySearchStatusTopper", WZLookForPartySearchStatusTopper)
LockTable(_M)
