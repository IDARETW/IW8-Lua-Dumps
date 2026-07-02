module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	if arg_1_2 and #arg_1_2 > 0 then
		for iter_1_0 = #arg_1_0.dailyChallengesRewardsWidgets, 1, -1 do
			if iter_1_0 > #arg_1_2 then
				table.insert(var_1_0, iter_1_0)
			end
		end
	end

	for iter_1_1 = 1, #var_1_0 do
		arg_1_0.dailyChallengesRewardsList:RemoveElement(arg_1_0.dailyChallengesRewardsWidgets[iter_1_1])
		table.remove(arg_1_0.dailyChallengesRewardsWidgets)
	end

	for iter_1_2 = 1, #arg_1_2 do
		local var_1_1 = arg_1_0.dailyChallengesRewardsWidgets[iter_1_2]

		if not var_1_1 then
			var_1_1 = MenuBuilder.BuildRegisteredType("AARLootItemCard", {
				controllerIndex = arg_1_1
			})

			arg_1_0.dailyChallengesRewardsList:addElement(var_1_1)
			table.insert(arg_1_0.dailyChallengesRewardsWidgets, var_1_1)
		end

		arg_1_2[iter_1_2].id = tostring(arg_1_2[iter_1_2].id)

		local var_1_2 = Challenge.GetRewards(arg_1_2[iter_1_2], arg_1_2[iter_1_2].type)[1]

		var_1_1.DailyChallengeGoalLabel:setText(Engine.CBBHFCGDIC(arg_1_2[iter_1_2].desc, arg_1_2[iter_1_2].amount))

		local var_1_3 = var_1_1.LootItemCardWrapper.Card

		var_1_3.Foreground:setImage(RegisterMaterial(var_1_2.image))
		var_1_3.ItemName:setText(var_1_2.name)
		var_1_3.ItemType:setText(var_1_2.typeName)
		var_1_3:UpdateCardConfig(var_1_2.type)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupAARDailyChallengesRewardsList = var_0_0

	local var_2_0 = 50 * _1080p
	local var_2_1 = -656 * _1080p
	local var_2_2 = 656 * _1080p
	local var_2_3 = -205 * _1080p
	local var_2_4 = 110 * _1080p
	local var_2_5 = LUI.UIHorizontalList.new()

	var_2_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_2_1, var_2_2, var_2_3, var_2_4)
	var_2_5:SetAlignment(LUI.Alignment.Center)
	var_2_5:SetSpacing(var_2_0)

	var_2_5.id = "dailyChallengesRewardsList"

	var_2_5:SetNoWrap(true)
	arg_2_0:addElement(var_2_5)

	arg_2_0.dailyChallengesRewardsList = var_2_5
	arg_2_0.dailyChallengesRewardsWidgets = {}
end

function AARDailyChallenges(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "AARDailyChallenges"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARDailyChallenges", AARDailyChallenges)
LockTable(_M)
