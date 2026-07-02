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

function LUI.IsLastInputGamepad(arg_3_0)
	return Engine.CBCJDCHCCD(arg_3_0) == LUI.INPUT_TYPE.gamepad
end

function LUI.IsLastInputKeyboardMouse(arg_4_0)
	local var_4_0 = Engine.CBCJDCHCCD(arg_4_0)

	return var_4_0 == LUI.INPUT_TYPE.keyboardMouse or var_4_0 == LUI.INPUT_TYPE.keyboardNavigation
end

function LUI.IsLastInputKeyboardNavigation(arg_5_0)
	return Engine.CBCJDCHCCD(arg_5_0) == LUI.INPUT_TYPE.keyboardNavigation
end

function LUI.IsLastInputMouseNavigation(arg_6_0)
	return Engine.CBCJDCHCCD(arg_6_0) == LUI.INPUT_TYPE.keyboardMouse
end

function LUI.AssertDescriptive(arg_7_0)
	assert(arg_7_0 and type(arg_7_0) == "table", "Error: Invalid options passed ( expected table )")

	local var_7_0 = arg_7_0.element

	assert(var_7_0, "Error: 'element' is nil")

	local var_7_1 = arg_7_0.expectedType

	if var_7_1 then
		assert(type(var_7_0) == var_7_1, "Error: Invalid 'element' type: ( actual type = " .. type(var_7_0) .. " ) ( expected type = " .. var_7_1 .. " )")
	end
end

function LUI.CleanupChildWidget(arg_8_0)
	LUI.AssertDescriptive({
		expectedType = "table",
		element = arg_8_0
	})
	LUI.AssertDescriptive({
		expectedType = "userdata",
		element = arg_8_0.parent
	})
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_8_0.childName
	})

	local var_8_0 = arg_8_0.childName
	local var_8_1 = arg_8_0.parent[var_8_0]

	if var_8_1 then
		LUI.AssertDescriptive({
			expectedType = "userdata",
			element = var_8_1
		})
		arg_8_0.parent[var_8_0]:closeTree()

		arg_8_0.parent[var_8_0] = nil
	end
end

function LUI.GetDataSourceWithAppendPath(arg_9_0, arg_9_1)
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_9_1
	})
	assert(arg_9_1 ~= "", "Datasource 'appendPath', empty string not allowed")

	if not arg_9_0 then
		return nil
	end

	local var_9_0 = LUI.Split(arg_9_1, ".")

	LUI.AssertDescriptive({
		expectedType = "table",
		element = var_9_0
	})

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		LUI.AssertDescriptive({
			expectedType = "string",
			element = iter_9_1
		})

		local var_9_1 = arg_9_0[iter_9_1]

		if not var_9_1 then
			return nil
		end

		arg_9_0 = var_9_1
	end

	return arg_9_0
end

function LUI.SubscribeMemoryManagedWidget(arg_10_0, arg_10_1)
	LUI.AssertDescriptive({
		expectedType = "table",
		element = arg_10_1
	})
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_10_1.datasourceAppendPath
	})
	LUI.AssertDescriptive({
		expectedType = "number",
		element = arg_10_0
	})
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_10_1.creationWidgetName
	})
	LUI.AssertDescriptive({
		expectedType = "number",
		element = arg_10_1.deletionTimeInMS
	})

	local var_10_0 = LUI.GetDataSourceWithAppendPath(DataSources, arg_10_1.datasourceAppendPath)

	if not var_10_0 then
		return
	end

	if not arg_10_1.memoryManagedContainer then
		return
	end

	local var_10_1 = arg_10_1.memoryManagedContainer

	LUI.AssertDescriptive({
		expectedType = "userdata",
		element = var_10_1
	})

	if var_10_1._widget then
		var_10_1 = var_10_1._widget
	end

	var_10_1:SubscribeToModel(var_10_0:GetModel(arg_10_0), function(arg_11_0)
		if DataModel.JJEHAEBDF(arg_11_0) == arg_10_1.shouldCreateWidgetValue then
			var_10_1:AllocateMemoryManagedWidget(arg_10_1.creationWidgetName)

			local var_11_0 = var_10_1:GetAllocatedWidget()

			LUI.AssertDescriptive({
				element = var_11_0,
				customErrorString = "WidgetName " .. tostring(arg_10_1.creationWidgetName) .. " was just created, but value is..." .. tostring(var_11_0)
			})

			if arg_10_1.postCreationFuncName and var_11_0[arg_10_1.postCreationFuncName] then
				var_11_0[arg_10_1.postCreationFuncName](var_11_0)
			end

			var_10_1:SetDeletionTimerLengthInMS(arg_10_1.deletionTimeInMS)
			var_10_1:DeleteMemoryManagedWidget()
		end
	end)
end

function LockTable(arg_12_0)
	local var_12_0 = getmetatable(arg_12_0)

	if not var_12_0 then
		var_12_0 = {}

		setmetatable(arg_12_0, var_12_0)
	end

	function var_12_0.__newindex(arg_13_0, arg_13_1, arg_13_2)
		error("LUI Error: Tried to create module variable " .. arg_13_1, 2)
	end
end

if hpairs ~= nil then
	pairs = hpairs
end

function split(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = "([^" .. arg_14_1 .. "]+)"

	local function var_14_2(arg_15_0)
		var_14_0[#var_14_0 + 1] = arg_15_0
	end

	string.gsub(arg_14_0, var_14_1, var_14_2)

	return var_14_0
end

function LUI.KeyValueSplit(arg_16_0, arg_16_1)
	local var_16_0 = {}
	local var_16_1 = "([^" .. arg_16_1 .. "]+)"

	local function var_16_2(arg_17_0)
		var_16_0[arg_17_0] = true
	end

	string.gsub(arg_16_0, var_16_1, var_16_2)

	return var_16_0
end

function GetSwatchIntColor(arg_18_0, arg_18_1)
	local var_18_0 = _G.SWATCHES
	local var_18_1 = split(arg_18_1, ".")

	for iter_18_0 = 1, #var_18_1 do
		var_18_0 = var_18_0[var_18_1[iter_18_0]]

		if var_18_0 == nil then
			return false
		end
	end

	if var_18_0.r and var_18_0.g and var_18_0.b then
		return GetIntForColor(var_18_0)
	else
		return false
	end
end

function LUI.ShallowCopy(arg_19_0)
	assert(arg_19_0)
	assert(type(arg_19_0) == "table")

	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_0) do
		var_19_0[iter_19_0] = iter_19_1
	end

	return var_19_0
end

function LUI.DeepCopy(arg_20_0)
	assert(arg_20_0)
	assert(type(arg_20_0) == "table")

	local var_20_0 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_0) do
		if type(iter_20_1) == "table" then
			var_20_0[iter_20_0] = LUI.DeepCopy(iter_20_1)
		else
			var_20_0[iter_20_0] = iter_20_1
		end
	end

	return var_20_0
end

function LUI.ConcatenateToTable(arg_21_0, arg_21_1)
	assert(arg_21_0)
	assert(arg_21_1)
	assert(type(arg_21_0) == "table")
	assert(type(arg_21_1) == "table")

	if arg_21_1 == nil then
		return
	end

	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		table.insert(arg_21_0, iter_21_1)
	end
end

function LUI.RemoveSingleItemFromArray(arg_22_0, arg_22_1)
	for iter_22_0 = 1, #arg_22_0 do
		if arg_22_0[iter_22_0] == arg_22_1 then
			table.remove(arg_22_0, iter_22_0)

			break
		end
	end
end

function LUI.IsItemInArray(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in pairs(arg_23_0) do
		if iter_23_1 == arg_23_1 then
			return iter_23_0
		end
	end

	return nil
end

function LUI.ReverseTable(arg_24_0)
	assert(arg_24_0)
	assert(type(arg_24_0) == "table")

	local var_24_0 = #arg_24_0
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
		var_24_1[var_24_0 - iter_24_0 + 1] = iter_24_1
	end

	return var_24_1
end

function LUI.BeginsWith(arg_25_0, arg_25_1)
	return arg_25_0:sub(1, #arg_25_1) == arg_25_1
end

function LUI.clamp(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0 < arg_26_1 then
		return arg_26_1
	elseif arg_26_2 < arg_26_0 then
		return arg_26_2
	else
		return arg_26_0
	end
end

function LUI.Lerp(arg_27_0, arg_27_1, arg_27_2)
	return arg_27_0 + arg_27_2 * (arg_27_1 - arg_27_0)
end

function LUI.Round(arg_28_0, arg_28_1)
	local var_28_0 = 10^(arg_28_1 or 0)

	return math.floor(arg_28_0 * var_28_0 + 0.5) / var_28_0
end

function LUI.Vec3Sub(arg_29_0, arg_29_1, arg_29_2)
	assert(type(arg_29_0) == "table")
	assert(type(arg_29_1) == "table")

	arg_29_2.x = arg_29_1.x - arg_29_0.x
	arg_29_2.y = arg_29_1.y - arg_29_0.y
	arg_29_2.z = arg_29_1.z - arg_29_0.z
end

function LUI.Vec3Assign(arg_30_0, arg_30_1)
	assert(type(arg_30_0) == "table")
	assert(type(arg_30_1) == "table")

	arg_30_1.x = arg_30_0.x
	arg_30_1.y = arg_30_0.y
	arg_30_1.z = arg_30_0.z
end

function LUI.Split(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = string.format("([^%s]+)", arg_31_1)

	arg_31_0:gsub(var_31_1, function(arg_32_0)
		table.insert(var_31_0, arg_32_0)
	end)

	return var_31_0
end

function LUI.FindLast(arg_33_0, arg_33_1)
	local var_33_0
	local var_33_1 = string.find(arg_33_0, arg_33_1, 1)
	local var_33_2 = var_33_1

	while var_33_1 do
		var_33_1 = string.find(arg_33_0, arg_33_1, var_33_1 + 1)

		if var_33_1 then
			var_33_2 = var_33_1
		end
	end

	return var_33_2
end

function LUI.Trim(arg_34_0)
	return arg_34_0:gsub("^%s*(.-)%s*$", "%1")
end

function LUI.FormatAnimStateFinishEvent(arg_35_0)
	return "transition_complete_" .. arg_35_0
end

function LUI.AreTableContentsEqual(arg_36_0, arg_36_1)
	for iter_36_0, iter_36_1 in pairs(arg_36_0) do
		if iter_36_1 ~= arg_36_1[iter_36_0] then
			return false
		end
	end

	for iter_36_2, iter_36_3 in pairs(arg_36_1) do
		if iter_36_3 ~= arg_36_0[iter_36_2] then
			return false
		end
	end

	return true
end

function LUI.CreateQueue()
	return {
		first = 1,
		last = 0,
		Push = function(arg_38_0, arg_38_1)
			arg_38_0.last = arg_38_0.last + 1
			arg_38_0[arg_38_0.last] = arg_38_1
		end,
		Pop = function(arg_39_0)
			if arg_39_0.first > arg_39_0.last then
				return nil
			end

			local var_39_0 = arg_39_0[arg_39_0.first]

			arg_39_0[arg_39_0.first] = nil
			arg_39_0.first = arg_39_0.first + 1

			return var_39_0
		end
	}
end

function LUI.TableToString(arg_40_0, arg_40_1)
	arg_40_1 = arg_40_1 or 0

	local var_40_0 = "{\n"
	local var_40_1 = var_40_0

	for iter_40_0, iter_40_1 in pairs(arg_40_0) do
		for iter_40_2 = 0, arg_40_1 do
			var_40_1 = var_40_1 .. "\t"
		end

		if type(iter_40_0) == "string" then
			var_40_1 = var_40_1 .. "[\"" .. iter_40_0 .. "\"]" .. " = "
		elseif type(iter_40_0) == "number" then
			var_40_1 = var_40_1 .. "[" .. iter_40_0 .. "]" .. " = "
		end

		if type(iter_40_1) == "table" then
			var_40_1 = var_40_1 .. LUI.TableToString(iter_40_1, arg_40_1 + 1)
		elseif type(iter_40_1) == "boolean" then
			var_40_1 = var_40_1 .. tostring(iter_40_1)
		elseif type(iter_40_1) == "number" then
			var_40_1 = var_40_1 .. tostring(iter_40_1)
		else
			var_40_1 = var_40_1 .. "\"" .. iter_40_1 .. "\""
		end

		var_40_1 = var_40_1 .. ",\n"
	end

	local var_40_2 = var_40_1 .. "\n"

	if var_40_2 ~= var_40_0 then
		var_40_2 = var_40_2:sub(1, var_40_2:len() - 1)
	end

	for iter_40_3 = 0, arg_40_1 - 1 do
		var_40_2 = var_40_2 .. "\t"
	end

	return var_40_2 .. "}"
end

function IsMouseEvent(arg_41_0, arg_41_1)
	return arg_41_0 == "mousemove" or arg_41_0 == "mousedown" or arg_41_0 == "mouseup" or arg_41_1 == "mousewheel" and arg_41_0 == "gamepad_button"
end

function IsMouseMoveEvent(arg_42_0)
	return arg_42_0 == "mousemove"
end

function IsMouseInputEvent(arg_43_0, arg_43_1)
	return arg_43_0 == "mousedown" or arg_43_0 == "mouseup" or arg_43_1 == "mousewheel" and arg_43_0 == "gamepad_button"
end

function IsInputEvent(arg_44_0)
	return arg_44_0 == "mousemove" or arg_44_0 == "mousedown" or arg_44_0 == "mouseup" or arg_44_0 == "gamepad_button" or arg_44_0 == "gamepad_sticks"
end

LargestElements = {}
LargestElementsSize = {}
LargestElementsCount = {}

function LUITestFunction()
	DebugPrint("Running LUITestFunction()")
end

function CountTableKeys(arg_46_0)
	assert(arg_46_0)
	assert(type(arg_46_0) == "table")

	local var_46_0 = 0

	for iter_46_0, iter_46_1 in pairs(arg_46_0) do
		var_46_0 = var_46_0 + 1
	end

	return var_46_0
end

function CountFieldsHelper(arg_47_0, arg_47_1)
	assert(arg_47_0)
	assert(type(arg_47_0) == "table")

	if arg_47_1[arg_47_0] then
		return
	end

	arg_47_1[arg_47_0] = true

	local var_47_0 = 0

	for iter_47_0, iter_47_1 in pairs(arg_47_0) do
		if type(iter_47_0) == "table" then
			var_47_0 = var_47_0 + CountFieldsHelper(iter_47_0, arg_47_1)
		end

		var_47_0 = var_47_0 + 1
	end

	return var_47_0
end

function CountFields(arg_48_0)
	local var_48_0 = {}

	return CountFieldsHelper(arg_48_0, var_48_0)
end

function CountReferencesHelper(arg_49_0, arg_49_1)
	if arg_49_1[arg_49_0] then
		return
	end

	arg_49_1[arg_49_0] = true

	if type(arg_49_0) == "userdata" then
		local var_49_0 = getmetatable(arg_49_0)

		if not var_49_0 then
			return
		end

		arg_49_0 = var_49_0.__index

		if not arg_49_0 then
			return
		end

		if type(arg_49_0) == "table" and arg_49_0.id then
			local var_49_1 = CountFields(arg_49_0)

			if not LargestElementsSize[arg_49_0.id] or var_49_1 > LargestElementsSize[arg_49_0.id] then
				LargestElements[arg_49_0.id] = arg_49_0
				LargestElementsSize[arg_49_0.id] = var_49_1
			end

			if not LargestElementsCount[arg_49_0.id] then
				LargestElementsCount[arg_49_0.id] = 0
			end

			LargestElementsCount[arg_49_0.id] = LargestElementsCount[arg_49_0.id] + 1
		end
	end

	if type(arg_49_0) ~= "table" then
		return
	end

	for iter_49_0, iter_49_1 in pairs(arg_49_0) do
		CountReferencesHelper(iter_49_1, arg_49_1)
	end
end

function CountReferences(arg_50_0)
	local var_50_0 = {
		[arg_50_0] = true
	}

	if type(arg_50_0) == "userdata" then
		local var_50_1 = getmetatable(arg_50_0)

		if not var_50_1 then
			return 0
		end

		arg_50_0 = var_50_1.__index

		if not arg_50_0 then
			return 0
		end
	end

	if type(arg_50_0) ~= "table" then
		return 0
	end

	for iter_50_0, iter_50_1 in pairs(arg_50_0) do
		CountReferencesHelper(iter_50_1, var_50_0)
	end

	local var_50_2 = 0

	for iter_50_2, iter_50_3 in pairs(var_50_0) do
		var_50_2 = var_50_2 + 1
	end

	return var_50_2
end

function GetIntForColor(arg_51_0)
	local var_51_0 = BitShiftLeft(math.floor(255 * arg_51_0.r), 16)
	local var_51_1 = BitShiftLeft(math.floor(255 * arg_51_0.g), 8)
	local var_51_2 = math.floor(255 * arg_51_0.b)

	return var_51_0 + var_51_1 + var_51_2
end

function GetColorTableFromIntColor(arg_52_0)
	local var_52_0 = {
		g = 0,
		b = 0,
		r = math.floor(BitShiftRight(arg_52_0, 16))
	}
	local var_52_1 = BitShiftLeft(var_52_0.r, 16)

	var_52_0.g = math.floor(BitShiftRight(arg_52_0 - var_52_1, 8))

	local var_52_2 = BitShiftLeft(var_52_0.g, 8)

	var_52_0.b = arg_52_0 - var_52_1
	var_52_0.b = var_52_0.b - var_52_2
	var_52_0.r = var_52_0.r / 255
	var_52_0.g = var_52_0.g / 255
	var_52_0.b = var_52_0.b / 255

	return var_52_0
end
