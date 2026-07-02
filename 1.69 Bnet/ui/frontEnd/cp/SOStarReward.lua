module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.Star1,
		arg_1_0.Star2,
		arg_1_0.Star3
	}

	arg_1_2 = LUI.clamp(arg_1_2, 0, #var_1_0)

	local var_1_1 = arg_1_2 == #var_1_0 and "On" or "Neutral"

	for iter_1_0 = 1, arg_1_2 do
		ACTIONS.AnimateSequence(var_1_0[iter_1_0], var_1_1)
	end

	arg_1_0.LootCard:UpdateCardConfig(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateCard = var_0_0
end

function SOStarReward(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 280 * _1080p)

	var_3_0.id = "SOStarReward"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "LootCard"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 200)
	var_3_0:addElement(var_3_4)

	var_3_0.LootCard = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("SORewardStar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Star3"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107, _1080p * 147, _1080p * 240, _1080p * 280)
	var_3_0:addElement(var_3_6)

	var_3_0.Star3 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("SORewardStar", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Star2"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 55, _1080p * 95, _1080p * 240, _1080p * 280)
	var_3_0:addElement(var_3_8)

	var_3_0.Star2 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("SORewardStar", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Star1"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 43, _1080p * 240, _1080p * 280)
	var_3_0:addElement(var_3_10)

	var_3_0.Star1 = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SOStarReward", SOStarReward)
LockTable(_M)
