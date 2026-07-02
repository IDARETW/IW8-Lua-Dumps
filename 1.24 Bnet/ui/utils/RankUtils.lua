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
		local var_3_1 = arg_2_1:GetValue(arg_3_0)

		if var_3_0 and var_3_1 then
			local var_3_2 = PROGRESSION.GetRankIcon(tostring(var_3_0), var_3_1)

			assert(var_3_2)

			return var_3_2
		end
	end
end

function Rank.MakeRankDisplayAggregateFunction(arg_4_0, arg_4_1)
	return function(arg_5_0)
		local var_5_0 = arg_4_0:GetValue(arg_5_0)

		if var_5_0 then
			return PROGRESSION.GetRankDisplay(tostring(var_5_0))
		end
	end
end
