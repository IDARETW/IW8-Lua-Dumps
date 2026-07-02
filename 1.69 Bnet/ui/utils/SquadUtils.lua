SQUAD = SQUAD or {}
SQUAD.SquadState = {
	AVAILABLE = 1,
	EMPTY = 0,
	FULL = 2
}
SQUAD.JoinedSquadType = {
	NORMAL = 1,
	RANDOM = 2,
	LEAVE = 3
}
SQUAD.EmptyMember = nil

function SQUAD.GetDebugAllSquadList()
	local var_1_0 = {
		input = "",
		name = "Jim",
		socialPlatForm = "",
		rankIcon = "white",
		displayRank = 20
	}
	local var_1_1 = {}

	for iter_1_0 = 1, 20 do
		local var_1_2 = {
			memberList = {}
		}

		table.insert(var_1_2.memberList, var_1_0)
		table.insert(var_1_2.memberList, var_1_0)
		table.insert(var_1_2.memberList, var_1_0)
		table.insert(var_1_2.memberList, var_1_0)

		var_1_2.squadIndex = iter_1_0
		var_1_2.size = #var_1_2.memberList
		var_1_2.fullSize = 4
		var_1_2.IsSquadFull = var_1_2.size == var_1_2.fullSize

		table.insert(var_1_1, var_1_2)
	end

	return var_1_1
end

function SQUAD.ToastSquadUpdate(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {
		displayTime = 3000,
		icon = "hud_info_alert",
		description = arg_2_2,
		type = LUI.ToastManager.NotificationType.WZSquadUpdated,
		controllerIndex = arg_2_1
	}

	arg_2_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_2_0
	})
end

WarzoneSquadTeam = WarzoneSquadTeam or {}

function WarzoneSquadTeam.new(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}

	setmetatable(var_3_0, arg_3_0)

	arg_3_0._index = arg_3_0
	var_3_0.memberList = {}
	var_3_0.fullSize = arg_3_2
	var_3_0.squadIndex = arg_3_1

	function var_3_0.GetSize(arg_4_0)
		return #arg_4_0.memberList
	end

	function var_3_0.GetAvailableSize(arg_5_0)
		local var_5_0 = 0

		for iter_5_0 = 1, #arg_5_0.memberList do
			if type(arg_5_0.memberList[iter_5_0]) == "table" then
				var_5_0 = var_5_0 + 1
			end
		end

		return var_5_0
	end

	function var_3_0.IsSquadFull(arg_6_0)
		return #arg_6_0.memberList == arg_6_0.fullSize
	end

	function var_3_0.IsSquadEmpty(arg_7_0)
		return #arg_7_0.memberList == 0
	end

	function var_3_0.AddTeamMember(arg_8_0, arg_8_1)
		assert(not arg_8_0:IsSquadFull())

		local var_8_0 = #arg_8_0.memberList + 1

		if arg_8_1 == SQUAD.EmptyMember then
			arg_8_1 = var_8_0
		else
			arg_8_1.index = var_8_0
		end

		arg_8_0.memberList[var_8_0] = arg_8_1
	end

	function var_3_0.GetSquadState(arg_9_0)
		local var_9_0 = arg_9_0:GetAvailableSize()

		if var_9_0 == 0 then
			return SQUAD.SquadState.EMPTY
		elseif var_9_0 == arg_9_0.fullSize then
			return SQUAD.SquadState.FULL
		elseif var_9_0 > 0 and var_9_0 < arg_9_0.fullSize then
			return SQUAD.SquadState.AVAILABLE
		end

		return nil
	end

	function var_3_0.IsPlayerInSquad(arg_10_0)
		for iter_10_0 = 1, #arg_10_0.memberList do
			if type(arg_10_0.memberList[iter_10_0]) == "table" and arg_10_0.memberList[iter_10_0].isMyPlayer then
				return true
			end
		end

		return false
	end

	return var_3_0
end

local function var_0_0(arg_11_0)
	assert(arg_11_0)

	local var_11_0 = arg_11_0:GetSize()
	local var_11_1 = arg_11_0.fullSize

	for iter_11_0 = var_11_0 + 1, var_11_1 do
		arg_11_0:AddTeamMember(SQUAD.EmptyMember)
	end
end

function SQUAD.GetAllSquadCount()
	if MatchRules.EAIEFBHGJ() then
		return (MatchRules.BIJEDCBCBH("commonOption", "teamCount"))
	end

	assert(false, "Trying to access to match rule data when the recipe is not loaded. ")

	return 0
end

function SQUAD.GetSquadSize()
	if MatchRules.EAIEFBHGJ() then
		return (MatchRules.BIJEDCBCBH("commonOption", "squadSize"))
	end

	assert(false, "Trying to access to match rule data when the recipe is not loaded. ")

	return 0
end

function SQUAD.GetAllPlayersList(arg_14_0)
	local var_14_0 = Lobby.BDCAFCJEFC()

	if arg_14_0 then
		local var_14_1 = SQUAD.GetAllSquadCount() * SQUAD.GetSquadSize()

		for iter_14_0 = #var_14_0 + 1, var_14_1 do
			var_14_0[iter_14_0] = iter_14_0
		end
	end

	return var_14_0
end

function SQUAD.GetCurrentSquadCount()
	local var_15_0 = SQUAD.GetAllPlayersList()

	if not var_15_0 then
		return 0
	end

	local var_15_1 = -1

	for iter_15_0 = 1, #var_15_0 do
		if var_15_0[iter_15_0].isMyPlayer then
			var_15_1 = var_15_0[iter_15_0].squadIndex

			break
		end
	end

	if var_15_1 == -1 then
		return 0
	end

	local var_15_2 = 0

	for iter_15_1 = 1, #var_15_0 do
		if var_15_0[iter_15_1].squadIndex == var_15_1 then
			var_15_2 = var_15_2 + 1
		end
	end

	if MatchRules.EAIEFBHGJ() then
		local var_15_3 = MatchRules.BIJEDCBCBH("commonOption", "squadSize")

		assert(var_15_2 <= var_15_3)
	end

	return var_15_2
end

function SQUAD.GetPlayerSquadIndex()
	local var_16_0 = SQUAD.GetAllPlayersList()

	if var_16_0 ~= nil then
		for iter_16_0 = 1, #var_16_0 do
			if var_16_0[iter_16_0].isMyPlayer then
				return var_16_0[iter_16_0].squadIndex
			end
		end
	end

	return -1
end

function SQUAD.GetAllSquadList(arg_17_0)
	local var_17_0 = SQUAD.GetAllPlayersList()
	local var_17_1 = {}

	if arg_17_0 then
		local var_17_2 = SQUAD.GetAllSquadCount()
		local var_17_3 = SQUAD.GetSquadSize()
		local var_17_4 = 0
		local var_17_5 = 0

		for iter_17_0 = 1, #var_17_0 do
			local var_17_6 = var_17_0[iter_17_0]

			if var_17_6.squadIndex ~= -1 then
				local var_17_7 = var_17_1[var_17_6.squadIndex]

				var_17_5 = var_17_5 + 1

				if var_17_7 == nil then
					var_17_7 = WarzoneSquadTeam:new(var_17_6.squadIndex, var_17_3)
				end

				assert(not var_17_7:IsSquadFull())
				var_17_7:AddTeamMember(var_17_6)

				var_17_1[var_17_6.squadIndex] = var_17_7

				if var_17_7:GetSquadState() == SQUAD.SquadState.FULL then
					var_17_4 = var_17_4 + 1
				end
			end
		end

		var_17_1.availableSquadCount = var_17_2 - var_17_4
		var_17_1.playerCount = var_17_5
		var_17_1.totalPlayerCount = var_17_3 * var_17_2

		for iter_17_1 = 1, var_17_2 do
			if var_17_1[iter_17_1] == nil then
				var_17_1[iter_17_1] = WarzoneSquadTeam:new(iter_17_1, var_17_3)
			end

			local var_17_8 = var_17_1[iter_17_1]

			var_0_0(var_17_8)
		end

		return var_17_1
	end

	return nil
end

function SQUAD.ProcessJoinSquadSuccessAction(arg_18_0, arg_18_1, arg_18_2)
	if LUI.FlowManager.IsMenuOnTop("JoinSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("JoinSquadPopup", true, true)
	end

	SQUAD.ToastSquadUpdate(arg_18_0, arg_18_1, arg_18_2)
	ACTIONS.LeaveMenu(arg_18_0)
end

function SQUAD.ProcessJoinSquadFailureAction(arg_19_0, arg_19_1)
	if LUI.FlowManager.IsMenuOnTop("JoinRandomSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("JoinRandomSquadPopup", true, true)
	end

	if LUI.FlowManager.IsMenuOnTop("JoinSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("JoinSquadPopup", true, true)
	end

	LUI.FlowManager.RequestLeaveMenu(arg_19_0)
	LUI.FlowManager.RequestPopupMenu(arg_19_0, "JoinSquadFailurePopup", false, arg_19_1)
end

function SQUAD.ProcessJoinRandomSquadSuccessAction(arg_20_0, arg_20_1, arg_20_2)
	if LUI.FlowManager.IsMenuOnTop("JoinRandomSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("JoinRandomSquadPopup", true, true)
	end

	SQUAD.ToastSquadUpdate(arg_20_0, arg_20_1, arg_20_2)
	ACTIONS.LeaveMenu(arg_20_0)
end

function SQUAD.ProcessJoinRandomSquadFailureAction(arg_21_0, arg_21_1)
	if LUI.FlowManager.IsMenuOnTop("JoinRandomSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("JoinRandomSquadPopup", true, true)
	end

	LUI.FlowManager.RequestLeaveMenu(arg_21_0)
	LUI.FlowManager.RequestPopupMenu(arg_21_0, "JoinSquadFailurePopup", false, arg_21_1)
end

function SQUAD.ProcessLeaveSquadSuccessAction(arg_22_0, arg_22_1, arg_22_2)
	if LUI.FlowManager.IsMenuOnTop("LeaveSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("LeaveSquadPopup", true, true)
	end

	SQUAD.ToastSquadUpdate(arg_22_0, arg_22_1, arg_22_2)
	ACTIONS.LeaveMenu(arg_22_0)
end

function SQUAD.ProcessLeaveSquadFailureAction(arg_23_0, arg_23_1)
	if LUI.FlowManager.IsMenuOnTop("LeaveSquadPopup") then
		LUI.FlowManager.RequestLeaveMenuByName("LeaveSquadPopup", true, true)
	end

	LUI.FlowManager.RequestLeaveMenu(arg_23_0)
	LUI.FlowManager.RequestPopupMenu(arg_23_0, "LeaveSquadFailurePopup", false, arg_23_1)
end

function SQUAD.JoinSquad(arg_24_0, arg_24_1)
	assert(arg_24_1)
	DebugPrint("warzone private match joined squad index: " .. tostring(arg_24_1))

	local var_24_0 = Lobby.CHCHDGJGJG(arg_24_0, arg_24_1)

	return {
		squadIndex = arg_24_1,
		requestSquadSent = var_24_0
	}
end

function SQUAD.JoinRandomSquad(arg_25_0, arg_25_1)
	local var_25_0 = SQUAD.GetAllSquadList(arg_25_1)
	local var_25_1 = {}

	for iter_25_0 = 1, #var_25_0 do
		local var_25_2 = var_25_0[iter_25_0]
		local var_25_3 = var_25_2:GetSquadState()

		if var_25_3 == SQUAD.SquadState.EMPTY or var_25_3 == SQUAD.SquadState.AVAILABLE then
			var_25_1[#var_25_1 + 1] = var_25_2.squadIndex
		end
	end

	if #var_25_1 == 0 then
		DebugPrint("warzone private lobby all squads are full. Please check.")

		return
	end

	local var_25_4 = var_25_1[math.random(1, #var_25_1)]
	local var_25_5 = SQUAD.GetPlayerSquadIndex()

	while var_25_5 == var_25_4 do
		var_25_4 = var_25_1[math.random(1, #var_25_1)]
	end

	DebugPrint("warzone private match auto assign squad index: " .. tostring(var_25_4))

	local var_25_6 = Lobby.CHCHDGJGJG(arg_25_0, var_25_4)

	return {
		squadIndex = var_25_4,
		requestSquadSent = var_25_6
	}
end

function SQUAD.ProcessJoinRandomSquadAction(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1.menu

	assert(var_26_0)

	if not MatchRules.EAIEFBHGJ() then
		LUI.FlowManager.RequestPopupMenu(var_26_0, "JoinSquadFailurePopup", false)

		return
	elseif Lobby.BJFFDBJHDD() then
		if LUI.FlowManager.IsMenuOnTop("WarzonePrivateMatchSquadMenu") then
			LUI.FlowManager.RequestLeaveMenuByName("WarzonePrivateMatchSquadMenu", true, true)
			LUI.FlowManager.RequestPopupMenu(var_26_0, "LeaveSquadMenuPopup", false, arg_26_0, false, {
				autoCloseTime = 3000
			})
		else
			LUI.FlowManager.RequestPopupMenu(var_26_0, "JoinSquadFailurePopup", false)
		end

		return
	end

	local var_26_1 = arg_26_1.matchmakerSettings
	local var_26_2 = SQUAD.JoinRandomSquad(arg_26_0, var_26_1)

	assert(var_26_2)

	if not var_26_2.requestSquadSent then
		var_26_0:processEvent({
			name = "squad_request_failure",
			joinedSquadType = SQUAD.JoinedSquadType.RANDOM
		})
		DebugPrint("request_squad_sent is false \n")

		return
	end

	if var_26_2 then
		var_26_0:processEvent({
			name = "request_squad_sent",
			requestResultReceived = false,
			requestSquadData = var_26_2,
			joinedSquadType = SQUAD.JoinedSquadType.RANDOM
		})
		LUI.FlowManager.RequestPopupMenu(var_26_0, "JoinRandomSquadPopup", false, arg_26_0, false, {
			autoCloseTime = 5000
		})
		Lobby.CFFJAEECFA(arg_26_0)

		var_26_0:Wait(5000).onComplete = function(arg_27_0, arg_27_1)
			local var_27_0 = true

			if var_26_0.GetSquadRequestResult then
				var_27_0 = var_26_0:GetSquadRequestResult()
			end

			if not var_27_0 then
				SQUAD.ProcessJoinSquadFailureAction(arg_27_0, arg_26_0)
			end
		end
	else
		LUI.FlowManager.RequestPopupMenu(var_26_0, "JoinRandomSquadFailurePopup", false)
	end
end

function SQUAD.ProcessJoinSquadAction(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.menu

	if not MatchRules.EAIEFBHGJ() then
		LUI.FlowManager.RequestPopupMenu(var_28_0, "JoinSquadFailurePopup", false)

		return
	elseif Lobby.BJFFDBJHDD() then
		if LUI.FlowManager.IsMenuOnTop("WarzonePrivateMatchSquadMenu") then
			LUI.FlowManager.RequestLeaveMenuByName("WarzonePrivateMatchSquadMenu", true, true)
			LUI.FlowManager.RequestPopupMenu(var_28_0, "LeaveSquadMenuPopup", false, arg_28_0, false, {
				autoCloseTime = 3000
			})
		else
			LUI.FlowManager.RequestPopupMenu(var_28_0, "JoinSquadFailurePopup", false)
		end

		return
	end

	local var_28_1 = arg_28_1.squadTeamData
	local var_28_2 = var_28_1:GetSquadState()

	if not var_28_1:IsPlayerInSquad() and (var_28_2 == SQUAD.SquadState.EMPTY or var_28_2 == SQUAD.SquadState.AVAILABLE) then
		local var_28_3 = SQUAD.JoinSquad(arg_28_0, var_28_1.squadIndex)

		assert(var_28_0)
		assert(var_28_3)

		if not var_28_3.requestSquadSent then
			var_28_0:processEvent({
				name = "squad_request_failure",
				joinedSquadType = SQUAD.JoinedSquadType.NORMAL
			})
			DebugPrint("request_squad_sent is false \n")

			return
		end

		DebugPrint("request_squad_sent event has been sent. \n")
		var_28_0:processEvent({
			name = "request_squad_sent",
			requestResultReceived = false,
			requestSquadData = var_28_3,
			joinedSquadType = SQUAD.JoinedSquadType.NORMAL
		})
		LUI.FlowManager.RequestPopupMenu(var_28_0, "JoinSquadPopup", false, arg_28_0, false, {
			autoCloseTime = 5000
		})
		Lobby.CFFJAEECFA(arg_28_0)

		var_28_0:Wait(5000).onComplete = function(arg_29_0, arg_29_1)
			local var_29_0 = true

			if var_28_0.GetSquadRequestResult then
				var_29_0 = var_28_0:GetSquadRequestResult()
			end

			if not var_29_0 then
				SQUAD.ProcessJoinSquadFailureAction(arg_29_0, arg_28_0)
			end
		end
	end
end

function SQUAD.ProcessLeaveSquadAction(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1.menu

	if not MatchRules.EAIEFBHGJ() then
		LUI.FlowManager.RequestPopupMenu(var_30_0, "JoinSquadFailurePopup", false)

		return
	elseif Lobby.BJFFDBJHDD() then
		if LUI.FlowManager.IsMenuOnTop("WarzonePrivateMatchSquadMenu") then
			LUI.FlowManager.RequestLeaveMenuByName("WarzonePrivateMatchSquadMenu", true, true)
			LUI.FlowManager.RequestPopupMenu(var_30_0, "LeaveSquadMenuPopup", false, arg_30_0, false, {
				autoCloseTime = 3000
			})
		else
			LUI.FlowManager.RequestPopupMenu(var_30_0, "JoinSquadFailurePopup", false)
		end

		return
	end

	local var_30_1 = SQUAD.JoinSquad(arg_30_0, -1)

	assert(var_30_0)
	assert(var_30_1)

	if not var_30_1.requestSquadSent then
		var_30_0:processEvent({
			name = "squad_request_failure",
			joinedSquadType = SQUAD.JoinedSquadType.LEAVE
		})
		DebugPrint("request_squad_sent is false \n")

		return
	end

	DebugPrint("request_squad_sent event has been sent. \n")
	var_30_0:processEvent({
		name = "request_squad_sent",
		requestResultReceived = false,
		requestSquadData = var_30_1,
		joinedSquadType = SQUAD.JoinedSquadType.LEAVE
	})
	LUI.FlowManager.RequestPopupMenu(var_30_0, "LeaveSquadPopup", false, arg_30_0, false, {
		autoCloseTime = 5000
	})

	var_30_0:Wait(5000).onComplete = function(arg_31_0, arg_31_1)
		local var_31_0 = true

		if var_30_0.GetSquadRequestResult then
			var_31_0 = var_30_0:GetSquadRequestResult()
		end

		if not var_31_0 then
			SQUAD.ProcessLeaveSquadFailureAction(arg_31_0, arg_30_0)
		end
	end
end

function SQUAD.RefreshAnimation(arg_32_0, arg_32_1)
	if arg_32_0._lastState ~= arg_32_1 then
		arg_32_0._lastState = arg_32_1

		ACTIONS.AnimateSequence(arg_32_0, arg_32_1)
	end
end
