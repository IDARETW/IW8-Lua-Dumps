module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_2 = tonumber(arg_1_2)

	local var_1_0 = LOOT.GetTypeForID(arg_1_2)

	if var_1_0 and var_1_0 ~= LOOT.itemTypes.INVALID then
		local var_1_1 = LOOT.GetLootProperties(var_1_0, arg_1_2)

		arg_1_1.TournamentRewardItem:SetRewardData(var_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2.XP
	local var_2_1 = arg_2_2.CP
	local var_2_2 = arg_2_2.lootItems
	local var_2_3 = {
		arg_2_1.AdditionalReward1,
		arg_2_1.AdditionalReward2,
		arg_2_1.AdditionalReward3
	}

	assert(#var_2_3 == TOURNAMENT.maxRewards - 1)

	local var_2_4 = 1

	if var_2_0 then
		var_2_3[var_2_4]:setText(Engine.CBBHFCGDIC("TOURNAMENT/REWARD_XP", var_2_0))

		var_2_4 = var_2_4 + 1
	end

	if var_2_1 then
		var_2_3[var_2_4]:setText(Engine.CBBHFCGDIC("TOURNAMENT/REWARD_CP", var_2_1))

		var_2_4 = var_2_4 + 1
	end

	local var_2_5 = 1

	while var_2_4 <= #var_2_3 do
		if var_2_5 <= #var_2_2 then
			local var_2_6 = tonumber(var_2_2[var_2_5])
			local var_2_7 = LOOT.GetTypeForID(var_2_6)

			if var_2_7 and var_2_7 ~= LOOT.itemTypes.INVALID then
				local var_2_8 = LOOT.GetItemRef(var_2_7, var_2_6)
				local var_2_9 = LOOT.GetItemName(var_2_7, var_2_8)

				var_2_3[var_2_4]:setText(var_2_9)

				var_2_4 = var_2_4 + 1
			end
		else
			break
		end

		var_2_5 = var_2_5 + 1
	end

	while var_2_4 <= #var_2_3 do
		var_2_3[var_2_4]:SetAlpha(0)

		var_2_4 = var_2_4 + 1
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {
		arg_3_0.TournamentRewardFirstPlace,
		arg_3_0.TournamentRewardSecondPlace,
		arg_3_0.TournamentRewardThirdPlace
	}
	local var_3_1 = Tournament.BGDHBAIDHJ()

	if var_3_1 and var_3_1.Rewards then
		local var_3_2 = math.min(#var_3_1.Rewards, #var_3_0)

		for iter_3_0 = 1, var_3_2 do
			local var_3_3 = var_3_1.Rewards[iter_3_0]

			if var_3_3 then
				local var_3_4 = var_3_3.lootID

				if var_3_4 then
					var_0_0(arg_3_0, var_3_0[iter_3_0], var_3_4)
				end

				local var_3_5 = var_3_3.AdditionalRewards

				if var_3_5 then
					var_0_1(arg_3_0, var_3_0[iter_3_0], var_3_5)
				end
			end
		end
	end
end

function TournamentRewardsList(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalStackedLayout.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 664 * _1080p, 0, 516 * _1080p)

	var_4_0.id = "TournamentRewardsList"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(20 * _1080p)

	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("TournamentReward", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "TournamentRewardFirstPlace"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 662, 0, _1080p * 158)
	var_4_0:addElement(var_4_4)

	var_4_0.TournamentRewardFirstPlace = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("TournamentReward", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "TournamentRewardSecondPlace"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 662, _1080p * 178, _1080p * 336)
	var_4_0:addElement(var_4_6)

	var_4_0.TournamentRewardSecondPlace = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("TournamentReward", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "TournamentRewardThirdPlace"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 662, _1080p * 356, _1080p * 514)
	var_4_0:addElement(var_4_8)

	var_4_0.TournamentRewardThirdPlace = var_4_8

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TournamentRewardsList", TournamentRewardsList)
LockTable(_M)
