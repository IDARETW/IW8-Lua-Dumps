LUI.DataSourceFromModel = LUI.Class()

function LUI.DataSourceFromModel.init(arg_1_0, arg_1_1)
	arg_1_0._defaultValue = arg_1_1
end

function LUI.DataSourceFromModel.GetModel(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0:FindModel(arg_2_1)

	if not var_2_0 then
		var_2_0 = arg_2_0:CreateModel(arg_2_1)

		if arg_2_0._defaultValue ~= nil then
			DataModel.DBEBGEAJHJ(var_2_0, arg_2_0._defaultValue)
		end
	end

	assert(var_2_0)

	return var_2_0
end

function LUI.DataSourceFromModel.GetValue(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:GetModel(arg_3_1)

	return DataModel.JJEHAEBDF(var_3_0)
end

function LUI.DataSourceFromModel.SetValue(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0:GetModel(arg_4_1)

	return DataModel.DBEBGEAJHJ(var_4_0, arg_4_2)
end

function LUI.DataSourceFromModel.GetDataSourceForSubmodel(arg_5_0, arg_5_1, arg_5_2)
	return LUI.DataSourceForSubmodel.new(arg_5_0, arg_5_1, arg_5_2)
end

function LUI.DataSourceFromModel.Filter(arg_6_0, arg_6_1, arg_6_2)
	return LUI.FilteredDataSource.new(arg_6_0, arg_6_1, arg_6_2)
end

function LUI.DataSourceFromModel.FilterTo(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	return LUI.FilterToDataSource.new(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
end

function LUI.DataSourceFromModel.IsPerController(arg_8_0)
	assert(false)
end

LUI.DataSourceInGlobalModel = LUI.Class(LUI.DataSourceFromModel)

function LUI.DataSourceInGlobalModel.init(arg_9_0, arg_9_1, arg_9_2)
	LUI.DataSourceInGlobalModel.super.init(arg_9_0, arg_9_2)

	arg_9_0._modelPath = arg_9_1
end

function LUI.DataSourceInGlobalModel.FindModel(arg_10_0, arg_10_1)
	local var_10_0 = DataModel.CICAGFJFEH()

	return DataModel.DGADFJACCI(var_10_0, arg_10_0._modelPath)
end

function LUI.DataSourceInGlobalModel.CreateModel(arg_11_0, arg_11_1)
	local var_11_0 = DataModel.CICAGFJFEH()

	return DataModel.EAABFJFCAG(var_11_0, arg_11_0._modelPath)
end

function LUI.DataSourceInGlobalModel.IsPerController(arg_12_0)
	return false
end

LUI.DataSourceInControllerModel = LUI.Class(LUI.DataSourceFromModel)

function LUI.DataSourceInControllerModel.init(arg_13_0, arg_13_1, arg_13_2)
	LUI.DataSourceInControllerModel.super.init(arg_13_0, arg_13_2)

	arg_13_0._modelPath = arg_13_1
end

function LUI.DataSourceInControllerModel.FindModel(arg_14_0, arg_14_1)
	local var_14_0 = DataModel.DJJHBDCEAB(arg_14_1)

	return DataModel.DGADFJACCI(var_14_0, arg_14_0._modelPath)
end

function LUI.DataSourceInControllerModel.CreateModel(arg_15_0, arg_15_1)
	local var_15_0 = DataModel.DJJHBDCEAB(arg_15_1)

	return DataModel.EAABFJFCAG(var_15_0, arg_15_0._modelPath)
end

function LUI.DataSourceInControllerModel.IsPerController(arg_16_0)
	return true
end

LUI.DataSourceFromOmnvar = LUI.Class(LUI.DataSourceFromModel)

function LUI.DataSourceFromOmnvar.init(arg_17_0, arg_17_1)
	LUI.DataSourceFromOmnvar.super.init(arg_17_0)
	assert(type(arg_17_1) == "string" and #arg_17_1 > 0)

	arg_17_0._omnvarName = arg_17_1
end

function LUI.DataSourceFromOmnvar.FindModel(arg_18_0, arg_18_1)
	local var_18_0 = DataModel.DEDCDIFJHG(arg_18_0._omnvarName, arg_18_1)

	if not var_18_0 then
		assert(false, "Could not find a model for omnvar '" .. tostring(arg_18_0._omnvarName) .. "'. It is most likely missing from omnvars.csv.")
	end

	return var_18_0
end

function LUI.DataSourceFromOmnvar.CreateModel(arg_19_0, arg_19_1)
	assert(false)
end

function LUI.DataSourceFromOmnvar.IsPerController(arg_20_0)
	return Game.BEEEEDBDGG(arg_20_0._omnvarName)
end

LUI.DataSourceForSubmodel = LUI.Class(LUI.DataSourceFromModel)

function LUI.DataSourceForSubmodel.init(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	LUI.DataSourceForSubmodel.super.init(arg_21_0, arg_21_3)

	arg_21_0._baseDataSource = arg_21_1
	arg_21_0._modelPath = arg_21_2
end

function LUI.DataSourceForSubmodel.FindModel(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0._baseDataSource:GetModel(arg_22_1)

	if var_22_0 then
		return DataModel.DGADFJACCI(var_22_0, arg_22_0._modelPath)
	end
end

function LUI.DataSourceForSubmodel.CreateModel(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0._baseDataSource:GetModel(arg_23_1)

	return DataModel.EAABFJFCAG(var_23_0, arg_23_0._modelPath)
end

function LUI.DataSourceForSubmodel.IsPerController(arg_24_0)
	return arg_24_0._baseDataSource:IsPerController()
end

LUI.DataSourceFromList = LUI.Class()

function LUI.DataSourceFromList.init(arg_25_0, arg_25_1)
	if type(arg_25_1) == "table" then
		assert(arg_25_1.GetModel)

		arg_25_0._countDataSource = arg_25_1
	else
		assert(arg_25_1 >= 0)

		arg_25_0._countValue = arg_25_1
	end

	local var_25_0 = getmetatable(arg_25_0)
	local var_25_1 = var_25_0.__index

	assert(type(var_25_1) == "table")

	function var_25_0.__index(arg_26_0, arg_26_1)
		arg_26_1 = tonumber(arg_26_1) or arg_26_1

		if type(arg_26_1) == "number" then
			return arg_26_0:GetDataSourceAtIndex(arg_26_1)
		else
			return var_25_1[arg_26_1]
		end
	end
end

function LUI.DataSourceFromList.GetDataSourceAtIndex(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0

	if arg_27_0._cache then
		var_27_0 = LUI.DataSourceFromList.FetchDataSourceAtIndexFromCache(arg_27_0, arg_27_1, arg_27_2)

		if not var_27_0 then
			var_27_0 = arg_27_0.MakeDataSourceAtIndex(arg_27_0, arg_27_1, arg_27_2)

			LUI.DataSourceFromList.CacheDataSourceAtIndex(arg_27_0, var_27_0, arg_27_1, arg_27_2)
		end
	else
		var_27_0 = arg_27_0.MakeDataSourceAtIndex(arg_27_0, arg_27_1, arg_27_2)
	end

	return var_27_0
end

function LUI.DataSourceFromList.FetchDataSourceAtIndexFromCache(arg_28_0, arg_28_1, arg_28_2)
	assert(arg_28_0._cache)

	arg_28_2 = arg_28_2 or -1

	if not arg_28_0._cache[arg_28_2] then
		arg_28_0._cache[arg_28_2] = {}

		setmetatable(arg_28_0._cache[arg_28_2], {
			__mode = "v"
		})
	end

	return arg_28_0._cache[arg_28_2][arg_28_1]
end

function LUI.DataSourceFromList.CacheDataSourceAtIndex(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	assert(arg_29_0._cache)

	arg_29_3 = arg_29_3 or -1
	arg_29_0._cache[arg_29_3][arg_29_2] = arg_29_1
end

function LUI.DataSourceFromList.GetCountModel(arg_30_0, arg_30_1)
	if arg_30_0._countDataSource then
		return (arg_30_0._countDataSource:GetModel(arg_30_1))
	else
		return nil
	end
end

function LUI.DataSourceFromList.GetCountValue(arg_31_0, arg_31_1)
	if arg_31_0._countValue then
		return arg_31_0._countValue
	end

	local var_31_0 = arg_31_0:GetCountModel(arg_31_1)

	return DataModel.JJEHAEBDF(var_31_0)
end

function LUI.DataSourceFromList.GetDefaultFocusIndex(arg_32_0, arg_32_1)
	return nil
end

function LUI.DataSourceFromList.Decorate(arg_33_0, arg_33_1)
	assert(type(arg_33_1) == "function")

	local var_33_0 = arg_33_0._countDataSource or arg_33_0._countValue
	local var_33_1 = LUI.DataSourceFromList.new(var_33_0)

	function var_33_1.GetDataSourceAtIndex(arg_34_0, arg_34_1, arg_34_2)
		local var_34_0

		local function var_34_1()
			local var_35_0 = arg_33_0:GetDataSourceAtIndex(arg_34_1, arg_34_2)

			assert(var_35_0)

			var_34_0 = arg_33_1(arg_34_1, var_35_0, arg_34_2)

			setmetatable(var_34_0, {
				__index = var_35_0
			})
		end

		if var_33_1._cache then
			var_34_0 = LUI.DataSourceFromList.FetchDataSourceAtIndexFromCache(var_33_1, arg_34_1, arg_34_2)

			if not var_34_0 then
				var_34_1()
				LUI.DataSourceFromList.CacheDataSourceAtIndex(var_33_1, var_34_0, arg_34_1, arg_34_2)
			end
		else
			var_34_1()
		end

		return var_34_0
	end

	return var_33_1
end

function LUI.DataSourceFromList.SetCachingEnabled(arg_36_0, arg_36_1)
	if arg_36_1 then
		arg_36_0._cache = arg_36_0._cache or {}
	else
		arg_36_0._cache = nil
	end
end

function LUI.DataSourceFromList.ClearCache(arg_37_0)
	if arg_37_0._cache then
		arg_37_0._cache = {}
	end
end

LUI.FeedDataSource = LUI.Class(LUI.DataSourceFromList)

function LUI.FeedDataSource.init(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	assert(arg_38_2 > 0)
	assert(type(arg_38_3) == "table")
	LUI.FeedDataSource.super.init(arg_38_0, arg_38_2)

	arg_38_0._bufferSize = arg_38_2
	arg_38_0._defaults = {}
	arg_38_0._dataSources = {}
	arg_38_0._baseDataSource = arg_38_1
	arg_38_0._lifetime = LUI.SubscriptionsHolder.new()

	if arg_38_1:IsPerController() then
		for iter_38_0 = 0, Engine.DCJGJDDEHE() - 1 do
			if Engine.BBHAECABBD(iter_38_0) then
				arg_38_0:InitModels(iter_38_0, arg_38_3)

				local var_38_0 = arg_38_0:GetPushModel(iter_38_0)

				arg_38_0._lifetime:SubscribeToModel(var_38_0, function(arg_39_0)
					if DataModel.JJEHAEBDF(arg_39_0) == true then
						arg_38_0:PushData(iter_38_0)
					end
				end)
			end
		end
	else
		arg_38_0:InitModels(0, arg_38_3)
		arg_38_0._lifetime:SubscribeToModel(dataSource:GetModel(0), function(arg_40_0)
			if DataModel.JJEHAEBDF(arg_40_0) == true then
				arg_38_0:PushData(0)
			end
		end)
	end

	arg_38_0:InitBufferDataSources()
end

function LUI.FeedDataSource.GetDataSourceAtIndex(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_1 % arg_41_0._bufferSize

	assert(type(arg_41_0._dataSources[var_41_0]) == "table")

	return arg_41_0._dataSources[var_41_0]
end

function LUI.FeedDataSource.GetPushModel(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0._baseDataSource:GetModel(arg_42_1)

	return (DataModel.EAABFJFCAG(var_42_0, "push"))
end

function LUI.FeedDataSource.GetTTLModel(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0:GetPushModel(arg_43_1)

	return (DataModel.EAABFJFCAG(var_43_0, "TTL"))
end

function LUI.FeedDataSource.ClearContent(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0:GetNextWriteBufferIndexModel(arg_44_1)

	DataModel.DBEBGEAJHJ(var_44_0, 0)
end

function LUI.FeedDataSource.InitModels(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_0._baseDataSource:GetModel(arg_45_1)
	local var_45_1 = DataModel.EAABFJFCAG(var_45_0, "push")
	local var_45_2 = DataModel.EAABFJFCAG(var_45_0, "buffer")
	local var_45_3 = DataModel.EAABFJFCAG(var_45_2, "next")

	DataModel.DBEBGEAJHJ(var_45_3, 0)

	for iter_45_0 = 0, arg_45_0._bufferSize - 1 do
		DataModel.EAABFJFCAG(var_45_2, tostring(iter_45_0))
	end

	arg_45_0:InitBufferModels(arg_45_1, arg_45_2, "")
end

function LUI.FeedDataSource.InitBufferModels(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = arg_46_0._baseDataSource:GetModel(arg_46_1)
	local var_46_1 = DataModel.EAABFJFCAG(var_46_0, "push")

	for iter_46_0, iter_46_1 in pairs(arg_46_2) do
		local var_46_2 = arg_46_3 .. iter_46_0

		assert(type(iter_46_0) == "string")

		if type(iter_46_1) == "table" then
			arg_46_0:InitBufferModels(arg_46_1, iter_46_1, var_46_2 .. ".")
		else
			DataModel.EAABFJFCAG(var_46_1, var_46_2)

			arg_46_0._defaults[var_46_2] = iter_46_1

			for iter_46_2 = 0, arg_46_0._bufferSize - 1 do
				local var_46_3 = arg_46_0:GetBufferModel(iter_46_2, arg_46_1)
				local var_46_4 = DataModel.EAABFJFCAG(var_46_3, var_46_2)

				DataModel.DBEBGEAJHJ(var_46_4, iter_46_1)
			end
		end
	end
end

function LUI.FeedDataSource.InitBufferDataSources(arg_47_0)
	for iter_47_0 = 0, arg_47_0._bufferSize - 1 do
		arg_47_0._dataSources[iter_47_0] = {}

		for iter_47_1, iter_47_2 in pairs(arg_47_0._defaults) do
			local var_47_0 = LUI.Split(iter_47_1, "\\.")
			local var_47_1 = arg_47_0._dataSources[iter_47_0]

			for iter_47_3, iter_47_4 in ipairs(var_47_0) do
				if iter_47_3 < #var_47_0 then
					var_47_1[iter_47_4] = var_47_1[iter_47_4] or {}
					var_47_1 = var_47_1[iter_47_4]
				else
					var_47_1[iter_47_4] = arg_47_0._baseDataSource:GetDataSourceForSubmodel("buffer." .. tostring(iter_47_0) .. "." .. iter_47_1)
				end
			end
		end
	end
end

function LUI.FeedDataSource.PushData(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0:GetPushModel(arg_48_1)

	assert(DataModel.JJEHAEBDF(var_48_0) == true)

	local var_48_1 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0._defaults) do
		assert(type(iter_48_0) == "string")

		var_48_1[iter_48_0] = iter_48_1

		local var_48_2 = DataModel.JJEHAEBDF(DataModel.DGADFJACCI(var_48_0, iter_48_0))

		if var_48_2 ~= nil then
			var_48_1[iter_48_0] = var_48_2
		end
	end

	local var_48_3 = arg_48_0:GetNextWriteBufferIndex(arg_48_1)
	local var_48_4 = arg_48_0:GetBufferModel(var_48_3, arg_48_1)

	for iter_48_2, iter_48_3 in pairs(var_48_1) do
		assert(type(iter_48_2) == "string")

		local var_48_5 = DataModel.DGADFJACCI(var_48_4, iter_48_2)

		DataModel.DBEBGEAJHJ(var_48_5, iter_48_3)
	end

	arg_48_0:IncrementNextWriteBufferIndex(arg_48_1)
	DataModel.DBEBGEAJHJ(var_48_0, false)
end

function LUI.FeedDataSource.GetNextWriteBufferIndexModel(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0._baseDataSource:GetModel(arg_49_1)

	return DataModel.DGADFJACCI(var_49_0, "buffer.next")
end

function LUI.FeedDataSource.GetNextWriteBufferIndex(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0:GetNextWriteBufferIndexModel(arg_50_1)

	return (DataModel.JJEHAEBDF(var_50_0))
end

function LUI.FeedDataSource.IncrementNextWriteBufferIndex(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_0:GetNextWriteBufferIndexModel(arg_51_1)
	local var_51_1 = (arg_51_0:GetNextWriteBufferIndex(arg_51_1) + 1) % arg_51_0._bufferSize

	DataModel.DBEBGEAJHJ(var_51_0, var_51_1)
end

function LUI.FeedDataSource.GetBufferModel(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0._baseDataSource:GetModel(arg_52_2)
	local var_52_1 = DataModel.DGADFJACCI(var_52_0, "buffer." .. tostring(arg_52_1))

	assert(type(var_52_1) == "userdata")

	return var_52_1
end

LUI.BaseAggregateDataSource = LUI.Class(LUI.DataSourceForSubmodel)

function LUI.BaseAggregateDataSource.init(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	assert(type(arg_53_3) == "table")
	assert(type(arg_53_4) == "function")
	assert(#arg_53_3 > 0)

	arg_53_0._inControllerModel = arg_53_1:IsPerController()
	arg_53_0._lifetime = LUI.SubscriptionsHolder.new()
	arg_53_0._aggregateFunction = arg_53_4
	arg_53_0._controllersSubscribed = {}
	arg_53_0._inputDataSources = arg_53_3

	LUI.BaseAggregateDataSource.super.init(arg_53_0, arg_53_1, arg_53_2)
end

function LUI.BaseAggregateDataSource.UpdateAggregateValue(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0._aggregateFunction(arg_54_1)

	if var_54_0 ~= nil then
		local var_54_1 = arg_54_0:GetModel(arg_54_1)

		DataModel.DBEBGEAJHJ(var_54_1, var_54_0)
	end
end

function LUI.BaseAggregateDataSource.SubscribeForController(arg_55_0, arg_55_1)
	if not arg_55_0._controllersSubscribed[arg_55_1] then
		arg_55_0._controllersSubscribed[arg_55_1] = true

		for iter_55_0, iter_55_1 in ipairs(arg_55_0._inputDataSources) do
			arg_55_0._lifetime:SubscribeToModel(iter_55_1:GetModel(arg_55_1), function(arg_56_0)
				arg_55_0:UpdateAggregateValue(arg_55_1)
			end, true)
		end

		arg_55_0:UpdateAggregateValue(arg_55_1)
	end
end

function LUI.BaseAggregateDataSource.IsPerController(arg_57_0)
	return arg_57_0._inControllerModel
end

function LUI.BaseAggregateDataSource.FindModel(arg_58_0, arg_58_1)
	arg_58_0:SubscribeForController(arg_58_1)

	return LUI.BaseAggregateDataSource.super.FindModel(arg_58_0, arg_58_1)
end

LUI.AggregateDataSource = LUI.Class(LUI.BaseAggregateDataSource)

function LUI.AggregateDataSource.init(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	assert(type(arg_59_1) == "table")
	assert(type(arg_59_2) == "table")
	assert(type(arg_59_3) == "string")
	assert(type(arg_59_4) == "function")
	LUI.AggregateDataSource.super.init(arg_59_0, arg_59_1, arg_59_3, arg_59_2, arg_59_4)
end

LUI.FilteredDataSource = LUI.Class(LUI.BaseAggregateDataSource)

function LUI.FilteredDataSource.init(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	assert(type(arg_60_1) == "table")
	assert(type(arg_60_2) == "string")
	assert(type(arg_60_3) == "function")

	local function var_60_0(arg_61_0)
		local var_61_0 = arg_60_1:GetValue(arg_61_0)

		if var_61_0 ~= nil then
			return (arg_60_3(var_61_0, arg_61_0))
		end
	end

	LUI.FilteredDataSource.super.init(arg_60_0, arg_60_1, arg_60_2, {
		arg_60_1
	}, var_60_0)
end

LUI.FilterToDataSource = LUI.Class(LUI.BaseAggregateDataSource)

function LUI.FilterToDataSource.init(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4)
	assert(type(arg_62_1) == "table")
	assert(type(arg_62_2) == "table")
	assert(type(arg_62_3) == "string")
	assert(type(arg_62_4) == "function")

	local function var_62_0(arg_63_0)
		local var_63_0 = arg_62_1:GetValue(arg_63_0)

		if var_63_0 ~= nil then
			return (arg_62_4(var_63_0, arg_63_0))
		end
	end

	LUI.FilterToDataSource.super.init(arg_62_0, arg_62_2, arg_62_3, {
		arg_62_1
	}, var_62_0)
end

local var_0_0 = {
	GetDataSourceForField = function(arg_64_0, arg_64_1)
		assert(arg_64_0._statsGroup)
		assert(arg_64_0._gameMode)
		assert(arg_64_0._DDLState)
		assert(arg_64_0._cachedSubDataSources)

		if not arg_64_0._cachedSubDataSources[arg_64_1] then
			local var_64_0 = arg_64_0._DDLState[arg_64_1]

			if not var_64_0 then
				assert(false, "Error navigating playerdata, from field " .. tostring(arg_64_0._DDLState) .. " with key " .. tostring(arg_64_1))
			end

			local var_64_1

			if PlayerData.BBGDDCBFHA(var_64_0) then
				var_64_1 = LUI.ListDataSourceFromPlayerDataArray.new(arg_64_0._statsGroup, arg_64_0._gameMode, var_64_0)
			else
				var_64_1 = LUI.DataSourceFromPlayerData.new(arg_64_0._statsGroup, arg_64_0._gameMode, var_64_0)
			end

			arg_64_0._cachedSubDataSources[arg_64_1] = var_64_1
		end

		return arg_64_0._cachedSubDataSources[arg_64_1]
	end
}

LUI.DataSourceFromPlayerData = LUI.Class(LUI.DataSourceInControllerModel)
LUI.DataSourceFromPlayerData.GetDataSourceForField = var_0_0.GetDataSourceForField

function LUI.DataSourceFromPlayerData.init(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	arg_65_0._statsGroup = arg_65_1
	arg_65_0._gameMode = arg_65_2

	if not arg_65_3 then
		arg_65_0._DDLState = PlayerData.EBFGJFIAJI(arg_65_1, arg_65_2)
	else
		arg_65_0._DDLState = arg_65_3
	end

	assert(arg_65_0._statsGroup)
	assert(arg_65_0._gameMode)
	assert(arg_65_0._DDLState)
	LUI.DataSourceFromPlayerData.super.init(arg_65_0, modelPath)

	arg_65_0._cachedSubDataSources = {}

	setmetatable(arg_65_0._cachedSubDataSources, {
		__mode = "v"
	})

	local var_65_0 = getmetatable(arg_65_0)
	local var_65_1 = var_65_0.__index

	assert(type(var_65_1) == "table")

	function var_65_0.__index(arg_66_0, arg_66_1)
		if var_65_1[arg_66_1] ~= nil then
			return var_65_1[arg_66_1]
		else
			return arg_66_0:GetDataSourceForField(arg_66_1)
		end
	end
end

function LUI.DataSourceFromPlayerData.FindModel(arg_67_0, arg_67_1)
	local var_67_0 = PlayerData.EDEJFEBFF(arg_67_0._statsGroup, arg_67_0._gameMode, arg_67_0._DDLState, arg_67_1)

	assert(var_67_0)

	return var_67_0
end

function LUI.DataSourceFromPlayerData.CreateModel(arg_68_0, arg_68_1)
	assert(false)
end

function LUI.DataSourceFromPlayerData.SetValue(arg_69_0, arg_69_1, arg_69_2)
	assert(arg_69_1)
	assert(arg_69_2 ~= nil)
	PlayerData.IIGEGHFJC(arg_69_0._statsGroup, arg_69_0._gameMode, arg_69_0._DDLState, arg_69_1, arg_69_2)
end

LUI.ListDataSourceFromPlayerDataArray = LUI.Class(LUI.DataSourceFromList)
LUI.ListDataSourceFromPlayerDataArray.GetDataSourceForField = var_0_0.GetDataSourceForField

function LUI.ListDataSourceFromPlayerDataArray.init(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	assert(arg_70_1)
	assert(arg_70_3)

	arg_70_0._statsGroup = arg_70_1
	arg_70_0._gameMode = arg_70_2
	arg_70_0._DDLState = arg_70_3
	arg_70_0._cachedSubDataSources = {}

	setmetatable(arg_70_0._cachedSubDataSources, {
		__mode = "v"
	})
	LUI.ListDataSourceFromPlayerDataArray.super.init(arg_70_0, arg_70_0:length())
end

function LUI.ListDataSourceFromPlayerDataArray.GetDataSourceAtIndex(arg_71_0, arg_71_1, arg_71_2)
	return arg_71_0:GetDataSourceForField(arg_71_1)
end

function LUI.ListDataSourceFromPlayerDataArray.length(arg_72_0)
	return #arg_72_0._DDLState
end

LUI.LazyDataSource = LUI.Class(LUI.DataSourceFromModel)

function LUI.LazyDataSource.init(arg_73_0, arg_73_1)
	LUI.LazyDataSource.super.init(arg_73_0)

	arg_73_0._lazyFunction = arg_73_1
	arg_73_0._lazyDataSource = false

	local var_73_0 = getmetatable(arg_73_0)
	local var_73_1 = var_73_0.__index

	assert(type(var_73_1) == "table")

	function var_73_0.__index(arg_74_0, arg_74_1)
		if var_73_1[arg_74_1] ~= nil then
			return var_73_1[arg_74_1]
		else
			arg_73_0:SetupLazyDataSource()

			return arg_73_0._lazyDataSource[arg_74_1]
		end
	end
end

function LUI.LazyDataSource.FindModel(arg_75_0, arg_75_1)
	arg_75_0:SetupLazyDataSource()

	return arg_75_0._lazyDataSource:GetModel(arg_75_1)
end

function LUI.LazyDataSource.CreateModel(arg_76_0, arg_76_1)
	assert(false, "Cannot create the model of a lazy data source.")
end

function LUI.LazyDataSource.IsPerController(arg_77_0)
	arg_77_0:SetupLazyDataSource()

	return arg_77_0._lazyDataSource:IsPerController()
end

function LUI.LazyDataSource.SetupLazyDataSource(arg_78_0)
	if not arg_78_0._lazyDataSource then
		arg_78_0._lazyDataSource = arg_78_0._lazyFunction()
	end
end

function LUI.LazyDataSource.SetValue(arg_79_0, arg_79_1, arg_79_2)
	arg_79_0:SetupLazyDataSource()

	return arg_79_0._lazyDataSource:SetValue(arg_79_1, arg_79_2)
end

function LUI.LazyDataSource.Filter(arg_80_0, arg_80_1, arg_80_2)
	return LUI.LazyDataSource.new(function()
		arg_80_0:SetupLazyDataSource()

		return arg_80_0._lazyDataSource:Filter(arg_80_1, arg_80_2)
	end)
end

function LUI.LazyDataSource.FilterTo(arg_82_0, arg_82_1, arg_82_2, arg_82_3)
	return LUI.LazyDataSource.new(function()
		arg_82_0:SetupLazyDataSource()

		return arg_82_0._lazyDataSource:FilterTo(arg_82_1, arg_82_2, arg_82_3)
	end)
end

function LUI.LazyDataSource.ClearLazyDataSource(arg_84_0)
	arg_84_0._lazyDataSource = false
end

function LUI.GetDataSourceWithAppendPath(arg_85_0, arg_85_1)
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_85_1
	})
	assert(arg_85_1 ~= "", "Datasource 'appendPath', empty string not allowed")

	if not arg_85_0 then
		return nil
	end

	local var_85_0 = LUI.Split(arg_85_1, ".")

	LUI.AssertDescriptive({
		expectedType = "table",
		element = var_85_0
	})

	for iter_85_0, iter_85_1 in ipairs(var_85_0) do
		LUI.AssertDescriptive({
			expectedType = "string",
			element = iter_85_1
		})

		local var_85_1 = arg_85_0[iter_85_1]

		if not var_85_1 then
			return nil
		end

		arg_85_0 = var_85_1
	end

	return arg_85_0
end

function WipeGlobalModelsAtPath(arg_86_0)
	local var_86_0 = DataModel.DGADFJACCI(DataModel.CICAGFJFEH(), arg_86_0)

	if var_86_0 then
		DataModel.ECHJFCGHJI(var_86_0)
	end
end

function WipeControllerModelsAtPath(arg_87_0)
	for iter_87_0 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_87_0 = DataModel.DGADFJACCI(DataModel.DJJHBDCEAB(iter_87_0), arg_87_0)

		if var_87_0 then
			DataModel.ECHJFCGHJI(var_87_0)
		end
	end
end

function WipeAllModelsAtPath(arg_88_0)
	WipeGlobalModelsAtPath(arg_88_0)
	WipeControllerModelsAtPath(arg_88_0)
end

function UpdateDataSourcesByMode(arg_89_0, arg_89_1)
	if arg_89_0 == arg_89_1 then
		return
	end

	local var_89_0 = {
		[CoD.PlayMode.SP] = {
			modelPath = "frontEnd.SP",
			initFunction = InitSPFrontEndDataSources
		},
		[CoD.PlayMode.Core] = {
			modelPath = "frontEnd.MP",
			initFunction = InitCoreMPFrontEndDataSources
		},
		[CoD.PlayMode.Aliens] = {
			modelPath = "frontEnd.CP",
			initFunction = InitCPFrontEndDataSources
		}
	}

	if Engine.DDJFBBJAIG() then
		for iter_89_0, iter_89_1 in ipairs(var_89_0) do
			if iter_89_0 == arg_89_0 then
				assert(iter_89_1.initFunction)
				iter_89_1.initFunction()
			else
				assert(iter_89_1.modelPath)
				WipeAllModelsAtPath(iter_89_1.modelPath)
			end
		end
	end
end
