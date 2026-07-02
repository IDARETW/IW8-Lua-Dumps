Rank = {}

function Rank.IsMasterPrestige(arg_1_0)
	if not Engine.ECHCFGDDDF() then
		return false
	end

	assert(arg_1_0)

	return tonumber(arg_1_0) >= 11
end

function Rank.MakeRankIconAggregateFunction(arg_2_0, arg_2_1)
	assert(arg_2_0)
	assert(arg_2_1)

	return function(arg_3_0)
		local var_3_0 = arg_2_0:GetValue(arg_3_0)
		local var_3_1 = PROGRESSION.ValidatePrestigeLevel(arg_2_1:GetValue(arg_3_0), {
			_isBackendPrestigeLevel = true
		})

		if var_3_0 and var_3_1 then
			local var_3_2 = var_3_0
			local var_3_3 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_3_2,
				_prestigeLevel = var_3_1
			})._rankIcon

			assert(var_3_3)

			return var_3_3
		end
	end
end

function Rank.MakeRankDisplayAggregateFunction(arg_4_0, arg_4_1)
	assert(arg_4_0, "MakeRankDisplayAggregateFunction() -> rankDataSource expected to be non-nil")
	assert(arg_4_1, "MakeRankDisplayAggregateFunction() -> prestigeDataSource expected to be non-nil")

	return function(arg_5_0)
		local var_5_0 = arg_4_0:GetValue(arg_5_0)
		local var_5_1 = PROGRESSION.ValidatePrestigeLevel(arg_4_1:GetValue(arg_5_0), {
			_isBackendPrestigeLevel = true
		})

		if var_5_0 and var_5_1 then
			local var_5_2 = var_5_0

			return PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_5_2,
				_prestigeLevel = var_5_1
			})._rankDisplay
		end
	end
end
