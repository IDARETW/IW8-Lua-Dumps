UPGRADING_REWARD = UPGRADING_REWARD or {}

function UPGRADING_REWARD.IsValidID(arg_1_0)
	return StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_1_0, CSV.upgradingRewards.cols.id)
end

function UPGRADING_REWARD.GetTitle(arg_2_0)
	local var_2_0 = StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_2_0, CSV.upgradingRewards.cols.title)

	if var_2_0 == "" then
		assert(false, "No Title in entry, check upgrading_rewards.csv")
	end

	return var_2_0
end

function UPGRADING_REWARD.GetDescription(arg_3_0)
	local var_3_0 = StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_3_0, CSV.upgradingRewards.cols.desc)

	if var_3_0 == "" then
		assert(false, "No Description in entry, check upgrading_rewards.csv")
	end

	return var_3_0
end

function UPGRADING_REWARD.GetCurrentIconRef(arg_4_0, arg_4_1)
	local var_4_0 = UPGRADING_REWARD.GetMaxRewardLevel(arg_4_0)

	if var_4_0 < arg_4_1 then
		arg_4_1 = var_4_0
	end

	local var_4_1 = CSV.upgradingRewards.cols.itemRefFirst + (arg_4_1 - 1)
	local var_4_2 = StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_4_0, var_4_1)

	if var_4_2 == "" then
		assert(false, "Invalid Icon Reference, check entry in upgrading_rewards.csv")
	else
		return var_4_2
	end
end

function UPGRADING_REWARD.GetRewardTiers(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = UPGRADING_REWARD.GetMaxRewardLevel(arg_5_0)

	if var_5_1 and var_5_1 > 0 then
		for iter_5_0 = 1, var_5_1 do
			table.insert(var_5_0, UPGRADING_REWARD.GetRewardTierAmount(arg_5_0, iter_5_0))
		end

		return var_5_0
	end

	assert(false, "No reward tier data found, check entry in upgrading_rewards.csv")
end

function UPGRADING_REWARD.GetRewardTierAmount(arg_6_0, arg_6_1)
	local var_6_0 = CSV.upgradingRewards.cols.rewardTierFirst + (arg_6_1 - 1)
	local var_6_1 = tonumber(StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_6_0, var_6_0))

	if var_6_1 then
		return var_6_1
	else
		assert(false, "Missing Reward Tier data, check entry in upgrading_rewards.csv")
	end
end

function UPGRADING_REWARD.GetMaxRewardLevel(arg_7_0)
	local var_7_0 = tonumber(StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_7_0, CSV.upgradingRewards.cols.maxRewardLevel))

	if var_7_0 == 0 then
		assert(false, "No MaxRewardLevel defined for entry in upgrading_rewards.csv")
	else
		return var_7_0
	end
end

function UPGRADING_REWARD.GetCurrentValue(arg_8_0, arg_8_1)
	local var_8_0 = StringTable.DIFCHIGDFB(CSV.upgradingRewards.file, CSV.upgradingRewards.cols.id, arg_8_1, CSV.upgradingRewards.cols.challengeRef)
	local var_8_1 = MiscChallenges.CJJHIEDGGG(arg_8_0, var_8_0)
	local var_8_2

	if var_8_1 then
		var_8_2 = var_8_1.Challenges.Progress
	end

	if Dvar.CFHDGABACF("current_reward_value") then
		return Dvar.CFHDGABACF("current_reward_value")
	elseif var_8_2 then
		return var_8_2
	else
		return 0
	end
end

function UPGRADING_REWARD.GetValueForRewardTier(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = UPGRADING_REWARD.GetCurrentRewardLevel(arg_9_0, arg_9_1)
	local var_9_1 = UPGRADING_REWARD.GetCurrentValue(arg_9_0, arg_9_1)
	local var_9_2 = UPGRADING_REWARD.GetMaxRewardLevel(arg_9_1)
	local var_9_3 = UPGRADING_REWARD.GetRewardTiers(arg_9_1)

	if arg_9_2 then
		return var_9_3[var_9_0] - var_9_3[var_9_0 - 1]
	else
		return var_9_1 - var_9_3[var_9_0 - 1]
	end
end

function UPGRADING_REWARD.GetCurrentRewardLevel(arg_10_0, arg_10_1)
	local var_10_0 = UPGRADING_REWARD.GetCurrentValue(arg_10_0, arg_10_1)
	local var_10_1 = UPGRADING_REWARD.GetMaxRewardLevel(arg_10_1)
	local var_10_2 = UPGRADING_REWARD.GetRewardTiers(arg_10_1)

	for iter_10_0, iter_10_1 in ipairs(var_10_2) do
		if var_10_0 < var_10_2[iter_10_0] then
			return iter_10_0
		end

		if var_10_0 >= var_10_2[var_10_1] then
			return var_10_1 + 1
		end
	end
end
