module(..., package.seeall)

local var_0_0 = "clan_data_fetcher_timer_refresh"
local var_0_1 = 5000
local var_0_2 = 5
local var_0_3 = {
	PROFILE = 1,
	LABELS = 3,
	DATA = 2
}

local function var_0_4(arg_1_0)
	arg_1_0._isLocked = true
	arg_1_0._labelsCache = nil
	arg_1_0._ignoreTimerForOneCycle = false
	arg_1_0._remainingRetries = var_0_2

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._clanData.fetchedData) do
		arg_1_0._clanData.fetchedData[iter_1_0] = false
	end
end

local function var_0_5(arg_2_0)
	arg_2_0._isTimerStarted = true
	arg_2_0.ClanDataFetcherTimer = LUI.UITimer.new({
		interval = arg_2_0._refreshTime,
		event = var_0_0
	})
	arg_2_0.ClanDataFetcherTimer.id = "ClanDataFetcherTimer"

	arg_2_0:addElement(arg_2_0.ClanDataFetcherTimer)
	arg_2_0:addAndCallEventHandler(var_0_0, function(arg_3_0, arg_3_1)
		arg_2_0.HandleTimerRefresh(arg_2_0)
	end)
end

local function var_0_6(arg_4_0)
	if arg_4_0.ClanDataFetcherTimer ~= nil then
		arg_4_0.ClanDataFetcherTimer:closeTree()

		arg_4_0.ClanDataFetcherTimer = nil
	end

	arg_4_0._isTimerStarted = false
	arg_4_0._ignoreTimerForOneCycle = false
end

local function var_0_7(arg_5_0)
	local var_5_0 = arg_5_0._remainingRetries - 1

	if var_5_0 > 0 then
		arg_5_0._remainingRetries = var_5_0
	else
		var_0_6(arg_5_0)
		var_0_4(arg_5_0)
	end
end

local function var_0_8(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_1)
	assert(arg_6_2)

	if arg_6_0._clanId ~= arg_6_1 then
		if arg_6_0._isTimerStarted then
			arg_6_0._ignoreTimerForOneCycle = true
		end

		var_0_4(arg_6_0)
	end

	arg_6_0._clanId = arg_6_1
	arg_6_0._memberXUID = arg_6_2

	local var_6_0 = Clans2.BJAACDECGE(arg_6_0._controllerIndex, arg_6_1) and Clans2.IBJFIGED(arg_6_0._controllerIndex, arg_6_2)

	if var_6_0 and arg_6_0._labelsCache == nil then
		var_6_0 = Clans2.BJFEDEICAC(arg_6_0._controllerIndex, arg_6_1)
	end

	if var_6_0 then
		arg_6_0._isLocked = false
	end

	if not arg_6_0._isTimerStarted and arg_6_0._useTimer then
		var_0_5(arg_6_0)
	end

	var_0_7(arg_6_0)

	return var_6_0
end

local function var_0_9(arg_7_0)
	if arg_7_0._clanData == nil then
		arg_7_0._clanData = {
			fetchedData = {
				[var_0_3.PROFILE] = false,
				[var_0_3.DATA] = false,
				[var_0_3.LABELS] = false
			}
		}
	end
end

local function var_0_10(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0._clanData.fetchedData) do
		if not iter_8_1 then
			return false
		end
	end

	return true
end

local function var_0_11(arg_9_0)
	if var_0_10(arg_9_0) then
		var_0_4(arg_9_0)
		var_0_6(arg_9_0)
		arg_9_0:dispatchEventToParent({
			name = CLANS.CLAN_EVENTS.CLAN_EXTERNAL_DATA_RESOLVED,
			controllerIndex = arg_9_0._controllerIndex,
			clanData = arg_9_0._clanData
		})
	end
end

local function var_0_12(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.clanProfiles[1]

	if var_10_0 then
		arg_10_0._clanData.emblemData = var_10_0.emblem
		arg_10_0._clanData.clanDescription = var_10_0.profileDescription
		arg_10_0._clanData.clanAnnouncement = var_10_0.profileAnnouncement
		arg_10_0._clanData.fetchedData[var_0_3.PROFILE] = true
	end
end

local function var_0_13(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.clanDetails[1]

	if var_11_0 then
		arg_11_0._clanData.clanId = var_11_0.clanId
		arg_11_0._clanData.clanName = var_11_0.clanName
		arg_11_0._clanData.clanTag = var_11_0.clanTag
		arg_11_0._clanData.clanPrivacyLevel = var_11_0.clanPrivacyLevel
		arg_11_0._clanData.clanOwner = var_11_0.clanOwner
		arg_11_0._clanData.numClanMembers = var_11_0.numClanMembers
		arg_11_0._clanData.clanStatus = var_11_0.numClanMembers > 1 and 1 or 0
		arg_11_0._clanData.fetchedData[var_0_3.DATA] = true
	end
end

local function var_0_14(arg_12_0, arg_12_1)
	local var_12_0 = CLANS.GetLabelsFromEvent(arg_12_1)

	if arg_12_0._labelsCache == nil then
		arg_12_0._labelsCache = var_12_0
	end

	arg_12_0._clanData.labels = arg_12_0._labelsCache
	arg_12_0._clanData.fetchedData[var_0_3.LABELS] = true
end

local function var_0_15(arg_13_0, arg_13_1, arg_13_2)
	var_0_9(arg_13_0)

	if not arg_13_0._clanData.fetchedData[arg_13_2] and not arg_13_0._isLocked then
		if arg_13_2 == var_0_3.DATA then
			var_0_13(arg_13_0, arg_13_1)
		elseif arg_13_2 == var_0_3.PROFILE then
			var_0_12(arg_13_0, arg_13_1)
		elseif arg_13_2 == var_0_3.LABELS then
			var_0_14(arg_13_0, arg_13_1)
		end

		var_0_11(arg_13_0)
	end
end

local function var_0_16(arg_14_0)
	if not arg_14_0._ignoreTimerForOneCycle then
		if CLANS.IsValidId(arg_14_0._clanId) then
			var_0_8(arg_14_0, arg_14_0._clanId, arg_14_0._memberXUID)
		end
	else
		arg_14_0._ignoreTimerForOneCycle = false
	end
end

local function var_0_17(arg_15_0, arg_15_1)
	arg_15_0._isTimerStarted = false
	arg_15_0._useTimer = arg_15_1 and arg_15_1.useTimer or false
	arg_15_0._remainingRetries = var_0_2

	if arg_15_0._useTimer then
		arg_15_0._refreshTime = arg_15_1 and arg_15_1.refreshTime or var_0_1
	end
end

local function var_0_18(arg_16_0)
	arg_16_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_PROFILE_RESOLVED, function(arg_17_0, arg_17_1)
		var_0_15(arg_16_0, arg_17_1, var_0_3.PROFILE)
	end)
	arg_16_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_DATA_RESOLVED, function(arg_18_0, arg_18_1)
		var_0_15(arg_16_0, arg_18_1, var_0_3.DATA)
	end)
	arg_16_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_SEARCH_TAGS, function(arg_19_0, arg_19_1)
		var_0_15(arg_16_0, arg_19_1, var_0_3.LABELS)
	end)
end

local function var_0_19(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0._clanId = CLANS.INVALID_CLAN_ID_STRING
	arg_20_0._memberXUID = nil
	arg_20_0._clanData = nil
	arg_20_0._labelsCache = nil
	arg_20_0._isLocked = true
	arg_20_0._ignoreTimerForOneCycle = false
	arg_20_0.HandleTimerRefresh = var_0_16
	arg_20_0.FetchExternalClanData = var_0_8
	arg_20_0.StopRefreshTimer = var_0_6

	var_0_9(arg_20_0)
	var_0_17(arg_20_0, arg_20_2)
	var_0_18(arg_20_0)
end

function ClanDataFetcher(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_21_0.id = "ClanDataFetcher"

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0

	var_0_19(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("ClanDataFetcher", ClanDataFetcher)
LockTable(_M)
