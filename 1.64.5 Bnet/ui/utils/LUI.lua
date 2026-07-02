LUI = {
	roots = {},
	DIRECTION = {
		horizontal = 0,
		vertical = 1
	},
	ORIENTATION = {
		down = 3,
		up = 2,
		left = 0,
		right = 1
	},
	Alignment = {
		Bottom = 2,
		Right = 2,
		Top = 0,
		Middle = 1,
		Left = 0,
		Center = 1
	},
	EASING = {
		inSine = 13,
		inCubic = 4,
		inOutCubic = 6,
		snap = 19,
		inQuartic = 7,
		inBack = 16,
		inOutQuadratic = 3,
		outCubic = 5,
		outBack = 17,
		inOutBack = 18,
		inQuintic = 10,
		inOutSine = 15,
		outQuintic = 11,
		inQuadratic = 1,
		outSine = 14,
		inOutQuintic = 12,
		outQuartic = 8,
		inOutQuartic = 9,
		outQuadratic = 2,
		linear = 0
	},
	BEARING = {
		down = 1,
		up = 0,
		left = 3,
		right = 4
	},
	COMPARE = {
		higher = 1,
		lower = -1,
		equal = 0
	}
}
_720 = 720
_1080 = 1080
_1280 = 1280
_1080p = _720 / _1080

if not Engine.BHICADFIHA() then
	function print(...)
		return
	end

	function printf(...)
		return
	end
end

LUI.CachedEvents = {
	run_frame = {
		immediate = true,
		name = "run_frame"
	},
	transition_complete = {
		lateness = 0,
		name = "transistion_complete_default"
	},
	gamepad_button = {
		name = "gamepad_button",
		down = true,
		button = "primary",
		immediate = true,
		controller = 0
	}
}
LUI.INPUT_TYPE = {
	keyboardNavigation = 2,
	gamepad = 0,
	keyboardMouse = 1
}
LUI.FENCE_ONLINE_SERVICES_ERROR_CODES = {
	MPNotAllowed = 3,
	AccountIsInMaintenance = 15,
	onlineServices = 7,
	LoginQueueClosed = 12,
	PlatformXboxLivePrivilegeDenied = 17,
	max = 19,
	BattlenetConnected = 10,
	PlatformXboxLivePrivilegeCheckFailed = 18,
	fetchingNPData = 8,
	signedOutOfLive = 1,
	PSPlusRequired = 9,
	networkConnection = 5,
	AccountIsBanned = 13,
	guestWithoutSponsor = 2,
	AccountIsTempBanned = 14,
	none = 0,
	TURequired = 6,
	AccountIsMPOrCPBanned = 16,
	WeGameOffline = 11,
	signedOutOfSteamOnline = 4
}
LUI.XBOX_PRIVILEGES = {
	Clubs188 = 1,
	CloudSavedGames209 = 9,
	CloudManageSession207 = 7,
	GameDvr198 = 5,
	Sessions189 = 2,
	MultiplayerParties203 = 6,
	UserGeneratedContent247 = 11,
	ProfilePrivacy196 = 4,
	Multiplayer254 = 13,
	Communications252 = 12,
	AddFriends255 = 14,
	Broadcast190 = 3,
	CloudJoinSession208 = 8,
	CrossPlay185 = 0,
	SocialNetworkSharing220 = 10
}
LUI.GAME_SOURCE_ID = {
	WARZONE = "wz",
	COLD_WAR = "t9",
	VANGUARD = "s4",
	MODERN_WARFARE = "iw8"
}
LUI.GAME_SOURCE_ID_DATA = {
	[LUI.GAME_SOURCE_ID.MODERN_WARFARE] = {
		name = "LUA_MENU/TEXTCHAT_GAMENAME_MW"
	},
	[LUI.GAME_SOURCE_ID.COLD_WAR] = {
		name = "LUA_MENU/TEXTCHAT_GAMENAME_BO5"
	},
	[LUI.GAME_SOURCE_ID.VANGUARD] = {
		name = "LUA_MENU/TEXTCHAT_GAMENAME_VANGUARD"
	},
	[LUI.GAME_SOURCE_ID.WARZONE] = {
		name = "LUA_MENU/TEXTCHAT_GAMENAME_WARZONE"
	}
}
LUI.SNIPE_ICON_BY_GAME_SOURCE = {
	t9 = "bo_sel_snipe_",
	s4 = "ui_icon_snipe_vanguard",
	iw8 = "mw_snipe_"
}
LUI.SNIPE_ICON_COLOR_BY_GAME_SOURCE = {
	t9 = "SWATCHES.CH2.White",
	s4 = "SWATCHES.CH2.White",
	iw8 = "SWATCHES.CH2.SnipeOverlayModernWarfare"
}
LUI.ANIM_BY_GAME_SOURCE = {
	t9 = "CW",
	s4 = "VG",
	iw8 = "MW"
}
LUI.DEEP_LINK_GAME = {
	VANGUARD = "vg",
	COLD_WAR = "cw",
	HQ = "hq"
}
LUI.DEEP_LINK_GAME_MODE = {
	SP = "sp",
	MP = "mp",
	CP = "cp",
	ARENA = "arena",
	ZM = "zm",
	NONE = ""
}
LUI.PLATFORM_TYPE = {
	PC = "pc",
	SONY = "sy",
	XBOX = "ms"
}
LUI.PROGRESS_TYPE = {
	CAPTURING_CRATE = 1,
	CUTTING = 11,
	EXFIL_AVAILABLE = 17,
	EXFIL_ENEMY = 19,
	EXFIL_FRIENDLY = 18,
	DEFUSING_EXPLOSIVE = 9,
	BUILDING = 21,
	BREACHING = 7,
	BEING_SELF_REVIVED = 16,
	PLANTING_EXPLOSIVE = 24,
	SECURING_DOOMSTATION = 25,
	REVIVING = 5,
	HACKING_EXPLOSIVE = 13,
	ACQUIRING_INTEL = 2,
	BEING_REVIVED = 6,
	MARKING_EQUIPMENT = 14,
	USING = 8,
	REPAIRING = 12,
	DESTROYING = 22,
	AMMO_TAKING = 4,
	SHUTDOWN_DOOMSTATION = 27,
	CAPTURING = 15,
	TRADING_WEAPON = 23,
	PROGRESS_DOOMSTATION = 26,
	SEARCHING_BODY = 10,
	GETTING_SUPPLIES = 3,
	EXFIL_CONTESTED = 20
}

function LUI.ConvertColorStringToTable(arg_3_0)
	local var_3_0 = 0
	local var_3_1 = split(arg_3_0, ".")
	local var_3_2 = var_3_1[1]
	local var_3_3 = var_3_1[2]
	local var_3_4 = var_3_1[3]

	if var_3_2 == "SWATCHES" then
		return SWATCHES[var_3_3][var_3_4]
	elseif var_3_2 == "COLORS" then
		return COLORS[var_3_3]
	end
end

function LUI.GetPlatformType()
	if Engine.CGABICJHAI() then
		return LUI.PLATFORM_TYPE.PC
	elseif Engine.CIEGIACHAE() then
		return LUI.PLATFORM_TYPE.SONY
	elseif Engine.BAHIIBFDDG() then
		return LUI.PLATFORM_TYPE.XBOX
	end
end

function LUI.GetSnipeIconByGameSourceID(arg_5_0, arg_5_1)
	assert(arg_5_0)

	local var_5_0 = arg_5_1 and arg_5_1.size and arg_5_1.size or "large"

	if arg_5_0 == LUI.GAME_SOURCE_ID.VANGUARD then
		return LUI.SNIPE_ICON_BY_GAME_SOURCE[arg_5_0]
	else
		return LUI.SNIPE_ICON_BY_GAME_SOURCE[arg_5_0] .. var_5_0
	end
end

function LUI.GetGameSourceLocalizedNameByGameSourceID(arg_6_0)
	if not arg_6_0 or arg_6_0 == "" then
		return nil
	end

	local var_6_0 = LUI.GAME_SOURCE_ID_DATA[arg_6_0]

	if var_6_0 and var_6_0.name ~= "" then
		return Engine.CBBHFCGDIC(var_6_0.name)
	else
		return nil
	end
end

function LUI.GetAnimForGameSource(arg_7_0)
	return LUI.ANIM_BY_GAME_SOURCE[arg_7_0]
end

function LUI.IsValidPlatformExclusiveType(arg_8_0)
	assert(arg_8_0, "InsertPlatformValidatedDataIntoTable():sourceData is nil.")
	assert(type(arg_8_0) ~= "table" or arg_8_0.platformExclusiveType, "InsertPlatformValidatedDataIntoTable():sourceData.platformExclusiveType is nil.")

	local var_8_0 = type(arg_8_0) == "table" and arg_8_0.platformExclusiveType or arg_8_0
	local var_8_1 = LUI.GetPlatformType()

	return #var_8_0 == 0 or var_8_0 == var_8_1 or Dvar.IBEGCHEFE("disable_platform_exclusive_filtering")
end

function LUI.InsertPlatformValidatedDataIntoTable(arg_9_0, arg_9_1)
	assert(type(arg_9_0) == "table", "InsertPlatformValidatedDataIntoTable():inputTable is not a table.")

	if LUI.IsValidPlatformExclusiveType(arg_9_1) then
		table.insert(arg_9_0, arg_9_1)
	end
end

function LUI.IsLastInputGamepad(arg_10_0)
	return Engine.CBCJDCHCCD(arg_10_0) == LUI.INPUT_TYPE.gamepad
end

function LUI.IsLastInputKeyboardMouse(arg_11_0)
	local var_11_0 = Engine.CBCJDCHCCD(arg_11_0)

	return var_11_0 == LUI.INPUT_TYPE.keyboardMouse or var_11_0 == LUI.INPUT_TYPE.keyboardNavigation
end

function LUI.IsLastInputKeyboardNavigation(arg_12_0)
	return Engine.CBCJDCHCCD(arg_12_0) == LUI.INPUT_TYPE.keyboardNavigation
end

function LUI.IsLastInputMouseNavigation(arg_13_0)
	return Engine.CBCJDCHCCD(arg_13_0) == LUI.INPUT_TYPE.keyboardMouse
end

function LUI.GetDefaultController(arg_14_0)
	if not Engine.DDJFBBJAIG() then
		return arg_14_0:getRootController()
	else
		return Engine.IJEBHJIJF()
	end
end

function LUI.ValidateControllerIndex(arg_15_0, arg_15_1)
	if not arg_15_1 then
		LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("LUA_MENU/NO_CONTROLLER_INDEX_TITLE"), Engine.CBBHFCGDIC("LUA_MENU/NO_CONTROLLER_INDEX_BODY", arg_15_0.id))

		arg_15_1 = LUI.GetDefaultController(arg_15_0)
	end

	return arg_15_1
end

function LUI.AssertDescriptive(arg_16_0)
	assert(arg_16_0 and type(arg_16_0) == "table", "AssertDescriptiveError: Invalid 'options' passed ( expected table )")

	local var_16_0 = arg_16_0.element

	assert(var_16_0 ~= nil, arg_16_0.customErrorString or "AssertDescriptiveError: 'element' is nil")

	local var_16_1 = arg_16_0.expectedNotValue

	if var_16_1 then
		assert(var_16_0 ~= var_16_1, arg_16_0.customErrorString or "AssertDescriptiveError: 'element' is equivalent to " .. tostring(var_16_1) .. " value that it's expected not to be")
	end

	local var_16_2 = arg_16_0.expectedType

	if var_16_2 then
		assert(type(var_16_0) == var_16_2, arg_16_0.customErrorString or "AssertDescriptiveError: Invalid 'element' type: ( actual type = " .. type(var_16_0) .. " ) ( expected type = " .. var_16_2 .. " )")
	end
end

function LUI.CleanupChildWidget(arg_17_0)
	LUI.AssertDescriptive({
		expectedType = "table",
		element = arg_17_0
	})
	LUI.AssertDescriptive({
		expectedType = "userdata",
		element = arg_17_0.parent
	})
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_17_0.childName
	})

	local var_17_0 = arg_17_0.childName
	local var_17_1 = arg_17_0.parent[var_17_0]

	if var_17_1 then
		LUI.AssertDescriptive({
			expectedType = "userdata",
			element = var_17_1
		})
		arg_17_0.parent[var_17_0]:closeTree()

		arg_17_0.parent[var_17_0] = nil
	end
end

function LUI.SubscribeMemoryManagedWidget(arg_18_0, arg_18_1)
	LUI.AssertDescriptive({
		expectedType = "table",
		element = arg_18_1
	})
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_18_1.datasourceAppendPath
	})
	LUI.AssertDescriptive({
		expectedType = "number",
		element = arg_18_0
	})
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_18_1.creationWidgetName
	})

	local var_18_0 = LUI.GetDataSourceWithAppendPath(DataSources, arg_18_1.datasourceAppendPath)

	if not var_18_0 then
		return
	end

	if not arg_18_1.memoryManagedContainer then
		return
	end

	local var_18_1 = arg_18_1.memoryManagedContainer

	LUI.AssertDescriptive({
		expectedType = "userdata",
		element = var_18_1
	})

	if var_18_1._widget then
		var_18_1 = var_18_1._widget
	end

	local var_18_2 = arg_18_1.deletionDataSourceAppendPath

	var_18_1:SubscribeToModel(var_18_0:GetModel(arg_18_0), function(arg_19_0)
		local var_19_0 = DataModel.JJEHAEBDF(arg_19_0)
		local var_19_1 = var_19_0

		if arg_18_1.shouldCreateWidgetValue then
			var_19_1 = var_19_0 == arg_18_1.shouldCreateWidgetValue
		end

		if var_19_1 then
			local var_19_2 = var_18_1:AllocateMemoryManagedWidget({
				widgetName = arg_18_1.creationWidgetName,
				deletionTimeInMS = arg_18_1.deletionTimeInMS
			})

			LUI.AssertDescriptive({
				element = var_19_2,
				customErrorString = "WidgetName " .. tostring(arg_18_1.creationWidgetName) .. " was just created, but value is..." .. tostring(var_19_2)
			})

			if arg_18_1.postCreationFuncName and var_19_2[arg_18_1.postCreationFuncName] then
				var_19_2[arg_18_1.postCreationFuncName](var_19_2)
			end

			if not var_18_2 then
				var_18_1:DeleteMemoryManagedWidget()
			end
		end
	end)

	if var_18_2 then
		assert(type(arg_18_1.deletionDataSourceAppendPath) == "string", "deletionDataSourceAppendPath is invalid type = " .. tostring(type(arg_18_1.deletionDataSourceAppendPath)) .. " ( expecting string )")

		local var_18_3 = LUI.GetDataSourceWithAppendPath(DataSources, arg_18_1.deletionDataSourceAppendPath)

		assert(var_18_3, "deletionDataSource is nil")
		var_18_1:SubscribeToModel(var_18_3:GetModel(arg_18_0), function(arg_20_0)
			if DataModel.JJEHAEBDF(arg_20_0) == arg_18_1.shouldDeleteWidgetValue then
				var_18_1:DeleteMemoryManagedWidget()
			end
		end)
	end
end

function LockTable(arg_21_0)
	local var_21_0 = getmetatable(arg_21_0)

	if not var_21_0 then
		var_21_0 = {}

		setmetatable(arg_21_0, var_21_0)
	end

	function var_21_0.__newindex(arg_22_0, arg_22_1, arg_22_2)
		error("LUI Error: Tried to create module variable " .. arg_22_1, 2)
	end
end

if hpairs ~= nil then
	pairs = hpairs
end

function split(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = "([^" .. arg_23_1 .. "]+)"

	local function var_23_2(arg_24_0)
		var_23_0[#var_23_0 + 1] = arg_24_0
	end

	string.gsub(arg_23_0, var_23_1, var_23_2)

	return var_23_0
end

function LUI.KeyValueSplit(arg_25_0, arg_25_1)
	local var_25_0 = {}
	local var_25_1 = "([^" .. arg_25_1 .. "]+)"

	local function var_25_2(arg_26_0)
		var_25_0[arg_26_0] = true
	end

	string.gsub(arg_25_0, var_25_1, var_25_2)

	return var_25_0
end

function LUI.ApplySwatchToWidgets(arg_27_0)
	assert(arg_27_0 and arg_27_0.widgetsToApplySwatch, "You must provide params including the widget or table of widgets for applying the swatch color.")
	assert(type(arg_27_0.widgetsToApplySwatch) == "table", "The widgetsToApplySwatch param must be a table listing a widget(s).")
	assert(arg_27_0.swatchInt or arg_27_0.swatchTable, "You must provide a color hex (int) or a color table in Swatches.lua.")

	for iter_27_0, iter_27_1 in pairs(arg_27_0.widgetsToApplySwatch) do
		assert(iter_27_1 and type(iter_27_1) == "userdata", "You must provide a valid widget.")

		if arg_27_0.swatchInt then
			assert(type(arg_27_0.swatchInt) == "number", "You must provide a hex integer for the swatchInt parameter.")
			iter_27_1:SetRGBFromInt(arg_27_0.swatchInt)
		else
			assert(type(arg_27_0.swatchTable) == "table", "You must provide swatch referenced in the Swatches.lua using a valid color table (Colors.lua).")
			iter_27_1:SetRGBFromTable(arg_27_0.swatchTable)
		end
	end
end

function GetSwatchIntColor(arg_28_0, arg_28_1)
	local var_28_0 = _G.SWATCHES
	local var_28_1 = split(arg_28_1, ".")

	for iter_28_0 = 1, #var_28_1 do
		var_28_0 = var_28_0[var_28_1[iter_28_0]]

		if var_28_0 == nil then
			return false
		end
	end

	if var_28_0.r and var_28_0.g and var_28_0.b then
		return GetIntForColor(var_28_0)
	else
		return false
	end
end

function LUI.ShallowCopy(arg_29_0)
	assert(arg_29_0)
	assert(type(arg_29_0) == "table")

	local var_29_0 = {}

	for iter_29_0, iter_29_1 in pairs(arg_29_0) do
		var_29_0[iter_29_0] = iter_29_1
	end

	return var_29_0
end

function LUI.DeepCopy(arg_30_0)
	assert(arg_30_0)
	assert(type(arg_30_0) == "table")

	local var_30_0 = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0) do
		if type(iter_30_1) == "table" then
			var_30_0[iter_30_0] = LUI.DeepCopy(iter_30_1)
		else
			var_30_0[iter_30_0] = iter_30_1
		end
	end

	return var_30_0
end

function LUI.ConcatenateToTable(arg_31_0, arg_31_1)
	assert(arg_31_0)
	assert(arg_31_1)
	assert(type(arg_31_0) == "table")
	assert(type(arg_31_1) == "table")

	if arg_31_1 == nil then
		return
	end

	for iter_31_0, iter_31_1 in ipairs(arg_31_1) do
		table.insert(arg_31_0, iter_31_1)
	end
end

function LUI.RemoveSingleItemFromArray(arg_32_0, arg_32_1)
	assert(type(arg_32_0) == "table", "Cannot remove item, table invalid")

	for iter_32_0, iter_32_1 in pairs(arg_32_0) do
		if iter_32_1 == arg_32_1 then
			return table.remove(arg_32_0, iter_32_0)
		end
	end

	return nil
end

function LUI.IsItemInArray(arg_33_0, arg_33_1)
	for iter_33_0, iter_33_1 in pairs(arg_33_0) do
		if iter_33_1 == arg_33_1 then
			return iter_33_0
		end
	end

	return nil
end

function LUI.ReverseTable(arg_34_0)
	assert(arg_34_0)
	assert(type(arg_34_0) == "table")

	local var_34_0 = #arg_34_0
	local var_34_1 = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_0) do
		var_34_1[var_34_0 - iter_34_0 + 1] = iter_34_1
	end

	return var_34_1
end

function LUI.ArrayShuffle(arg_35_0)
	assert(arg_35_0, "Cannot shuffle nil or empty array")
	assert(type(arg_35_0) == "table", "Cannot shuffle, not a valid table")

	for iter_35_0 = #arg_35_0, 2, -1 do
		local var_35_0 = math.random(iter_35_0)

		arg_35_0[iter_35_0], arg_35_0[var_35_0] = arg_35_0[var_35_0], arg_35_0[iter_35_0]
	end
end

function LUI.BeginsWith(arg_36_0, arg_36_1)
	return arg_36_0:sub(1, #arg_36_1) == arg_36_1
end

function LUI.clamp(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_0 < arg_37_1 then
		return arg_37_1
	elseif arg_37_2 < arg_37_0 then
		return arg_37_2
	else
		return arg_37_0
	end
end

function LUI.Lerp(arg_38_0, arg_38_1, arg_38_2)
	return arg_38_0 + arg_38_2 * (arg_38_1 - arg_38_0)
end

function LUI.Round(arg_39_0, arg_39_1)
	local var_39_0 = 10^(arg_39_1 or 0)

	return math.floor(arg_39_0 * var_39_0 + 0.5) / var_39_0
end

function LUI.Vec3Sub(arg_40_0, arg_40_1, arg_40_2)
	assert(type(arg_40_0) == "table")
	assert(type(arg_40_1) == "table")

	arg_40_2.x = arg_40_1.x - arg_40_0.x
	arg_40_2.y = arg_40_1.y - arg_40_0.y
	arg_40_2.z = arg_40_1.z - arg_40_0.z
end

function LUI.Vec3Assign(arg_41_0, arg_41_1)
	assert(type(arg_41_0) == "table")
	assert(type(arg_41_1) == "table")

	arg_41_1.x = arg_41_0.x
	arg_41_1.y = arg_41_0.y
	arg_41_1.z = arg_41_0.z
end

function LUI.Split(arg_42_0, arg_42_1)
	local var_42_0 = {}
	local var_42_1 = string.format("([^%s]+)", arg_42_1)

	arg_42_0:gsub(var_42_1, function(arg_43_0)
		table.insert(var_42_0, arg_43_0)
	end)

	return var_42_0
end

function LUI.SplitIncludingEmpty(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = {}

	for iter_44_0 in string.gmatch(arg_44_0 .. arg_44_1, "([^" .. arg_44_1 .. "]*)" .. arg_44_1) do
		if arg_44_2 then
			iter_44_0 = LUI.Trim(iter_44_0)
		end

		if arg_44_3 then
			iter_44_0 = tonumber(iter_44_0)
		end

		table.insert(var_44_0, iter_44_0)
	end

	return var_44_0
end

function LUI.TableToArray(arg_45_0)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in pairs(arg_45_0) do
		table.insert(var_45_0, iter_45_1)
	end

	return var_45_0
end

function LUI.FindLast(arg_46_0, arg_46_1)
	local var_46_0
	local var_46_1 = string.find(arg_46_0, arg_46_1, 1)
	local var_46_2 = var_46_1

	while var_46_1 do
		var_46_1 = string.find(arg_46_0, arg_46_1, var_46_1 + 1)

		if var_46_1 then
			var_46_2 = var_46_1
		end
	end

	return var_46_2
end

function LUI.Trim(arg_47_0)
	return arg_47_0:gsub("^%s*(.-)%s*$", "%1")
end

function LUI.FormatAnimStateFinishEvent(arg_48_0)
	return "transition_complete_" .. arg_48_0
end

function LUI.AreTableContentsEqual(arg_49_0, arg_49_1)
	for iter_49_0, iter_49_1 in pairs(arg_49_0) do
		if iter_49_1 ~= arg_49_1[iter_49_0] then
			return false
		end
	end

	for iter_49_2, iter_49_3 in pairs(arg_49_1) do
		if iter_49_3 ~= arg_49_0[iter_49_2] then
			return false
		end
	end

	return true
end

function LUI.CreateQueue()
	return {
		first = 1,
		last = 0,
		Push = function(arg_51_0, arg_51_1)
			arg_51_0.last = arg_51_0.last + 1
			arg_51_0[arg_51_0.last] = arg_51_1
		end,
		Pop = function(arg_52_0)
			if arg_52_0.first > arg_52_0.last then
				return nil
			end

			local var_52_0 = arg_52_0[arg_52_0.first]

			arg_52_0[arg_52_0.first] = nil
			arg_52_0.first = arg_52_0.first + 1

			return var_52_0
		end,
		Peek = function(arg_53_0)
			if arg_53_0.first > arg_53_0.last then
				return nil
			end

			return arg_53_0[arg_53_0.first]
		end
	}
end

function LUI.TableToString(arg_54_0, arg_54_1)
	arg_54_1 = arg_54_1 or 0

	local var_54_0 = "{\n"
	local var_54_1 = var_54_0

	for iter_54_0, iter_54_1 in pairs(arg_54_0) do
		for iter_54_2 = 0, arg_54_1 do
			var_54_1 = var_54_1 .. "\t"
		end

		if type(iter_54_0) == "string" then
			var_54_1 = var_54_1 .. "[\"" .. iter_54_0 .. "\"]" .. " = "
		elseif type(iter_54_0) == "number" then
			var_54_1 = var_54_1 .. "[" .. iter_54_0 .. "]" .. " = "
		end

		if type(iter_54_1) == "table" then
			var_54_1 = var_54_1 .. LUI.TableToString(iter_54_1, arg_54_1 + 1)
		elseif type(iter_54_1) == "boolean" then
			var_54_1 = var_54_1 .. tostring(iter_54_1)
		elseif type(iter_54_1) == "number" then
			var_54_1 = var_54_1 .. tostring(iter_54_1)
		else
			var_54_1 = var_54_1 .. "\"" .. iter_54_1 .. "\""
		end

		var_54_1 = var_54_1 .. ",\n"
	end

	local var_54_2 = var_54_1 .. "\n"

	if var_54_2 ~= var_54_0 then
		var_54_2 = var_54_2:sub(1, var_54_2:len() - 1)
	end

	for iter_54_3 = 0, arg_54_1 - 1 do
		var_54_2 = var_54_2 .. "\t"
	end

	return var_54_2 .. "}"
end

function LUI.FormatLargeNumber(arg_55_0)
	assert(tonumber(arg_55_0), "The formatted value must be a number. " .. type(arg_55_0) .. " received")

	local var_55_0 = " "
	local var_55_1 = "."
	local var_55_2, var_55_3, var_55_4 = string.match(tostring(arg_55_0):gsub("%.", var_55_1), "^([^%d]*%d)(%d*)(.-)$")

	return var_55_2 .. var_55_3:reverse():gsub("(%d%d%d)", "%1" .. var_55_0):reverse() .. var_55_4
end

function IsMouseEvent(arg_56_0, arg_56_1)
	return arg_56_0 == "mousemove" or arg_56_0 == "mousedown" or arg_56_0 == "mouseup" or arg_56_1 == "mousewheel" and arg_56_0 == "gamepad_button"
end

function IsMouseMoveEvent(arg_57_0)
	return arg_57_0 == "mousemove"
end

function IsMouseInputEvent(arg_58_0, arg_58_1)
	return arg_58_0 == "mousedown" or arg_58_0 == "mouseup" or arg_58_1 == "mousewheel" and arg_58_0 == "gamepad_button"
end

function IsInputEvent(arg_59_0)
	return arg_59_0 == "mousemove" or arg_59_0 == "mousedown" or arg_59_0 == "mouseup" or arg_59_0 == "gamepad_button" or arg_59_0 == "gamepad_sticks"
end

LargestElements = {}
LargestElementsSize = {}
LargestElementsCount = {}

function LUITestFunction()
	DebugPrint("Running LUITestFunction()")
end

function CountTableKeys(arg_61_0)
	assert(arg_61_0)
	assert(type(arg_61_0) == "table")

	local var_61_0 = 0

	for iter_61_0, iter_61_1 in pairs(arg_61_0) do
		var_61_0 = var_61_0 + 1
	end

	return var_61_0
end

function CountFieldsHelper(arg_62_0, arg_62_1)
	assert(arg_62_0)
	assert(type(arg_62_0) == "table")

	if arg_62_1[arg_62_0] then
		return
	end

	arg_62_1[arg_62_0] = true

	local var_62_0 = 0

	for iter_62_0, iter_62_1 in pairs(arg_62_0) do
		if type(iter_62_0) == "table" then
			var_62_0 = var_62_0 + CountFieldsHelper(iter_62_0, arg_62_1)
		end

		var_62_0 = var_62_0 + 1
	end

	return var_62_0
end

function CountFields(arg_63_0)
	local var_63_0 = {}

	return CountFieldsHelper(arg_63_0, var_63_0)
end

function CountReferencesHelper(arg_64_0, arg_64_1)
	if arg_64_1[arg_64_0] then
		return
	end

	arg_64_1[arg_64_0] = true

	if type(arg_64_0) == "userdata" then
		local var_64_0 = getmetatable(arg_64_0)

		if not var_64_0 then
			return
		end

		arg_64_0 = var_64_0.__index

		if not arg_64_0 then
			return
		end

		if type(arg_64_0) == "table" and arg_64_0.id then
			local var_64_1 = CountFields(arg_64_0)

			if not LargestElementsSize[arg_64_0.id] or var_64_1 > LargestElementsSize[arg_64_0.id] then
				LargestElements[arg_64_0.id] = arg_64_0
				LargestElementsSize[arg_64_0.id] = var_64_1
			end

			if not LargestElementsCount[arg_64_0.id] then
				LargestElementsCount[arg_64_0.id] = 0
			end

			LargestElementsCount[arg_64_0.id] = LargestElementsCount[arg_64_0.id] + 1
		end
	end

	if type(arg_64_0) ~= "table" then
		return
	end

	for iter_64_0, iter_64_1 in pairs(arg_64_0) do
		CountReferencesHelper(iter_64_1, arg_64_1)
	end
end

function CountReferences(arg_65_0)
	local var_65_0 = {
		[arg_65_0] = true
	}

	if type(arg_65_0) == "userdata" then
		local var_65_1 = getmetatable(arg_65_0)

		if not var_65_1 then
			return 0
		end

		arg_65_0 = var_65_1.__index

		if not arg_65_0 then
			return 0
		end
	end

	if type(arg_65_0) ~= "table" then
		return 0
	end

	for iter_65_0, iter_65_1 in pairs(arg_65_0) do
		CountReferencesHelper(iter_65_1, var_65_0)
	end

	local var_65_2 = 0

	for iter_65_2, iter_65_3 in pairs(var_65_0) do
		var_65_2 = var_65_2 + 1
	end

	return var_65_2
end

function GetIntForColor(arg_66_0)
	local var_66_0 = BitShiftLeft(math.floor(255 * arg_66_0.r), 16)
	local var_66_1 = BitShiftLeft(math.floor(255 * arg_66_0.g), 8)
	local var_66_2 = math.floor(255 * arg_66_0.b)

	return var_66_0 + var_66_1 + var_66_2
end

function GetColorTableFromIntColor(arg_67_0)
	local var_67_0 = {
		g = 0,
		b = 0,
		r = math.floor(BitShiftRight(arg_67_0, 16))
	}
	local var_67_1 = BitShiftLeft(var_67_0.r, 16)

	var_67_0.g = math.floor(BitShiftRight(arg_67_0 - var_67_1, 8))

	local var_67_2 = BitShiftLeft(var_67_0.g, 8)

	var_67_0.b = arg_67_0 - var_67_1
	var_67_0.b = var_67_0.b - var_67_2
	var_67_0.r = var_67_0.r / 255
	var_67_0.g = var_67_0.g / 255
	var_67_0.b = var_67_0.b / 255

	return var_67_0
end
