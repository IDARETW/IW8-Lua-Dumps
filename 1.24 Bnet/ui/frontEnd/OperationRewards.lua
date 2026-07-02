module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.EventName)
	arg_1_0.EventName:setText(WORLD_MAP.GetEventName())

	local var_1_0 = 0
	local var_1_1 = WORLD_MAP.GetOperationRewards()

	if var_1_1 and #var_1_1 > 0 then
		for iter_1_0 = 1, #var_1_1 do
			local var_1_2 = var_1_1[iter_1_0]
			local var_1_3 = MenuBuilder.BuildRegisteredType("TerritoryOperationReward", {
				controllerIndex = arg_1_1
			})

			var_1_3:SetRewardData(var_1_2)
			arg_1_0.OperationRewardsContainer:addElement(var_1_3)
		end
	end
end

function OperationRewards(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "OperationRewards"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("ClaimedTerritories", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "ClaimedTerritories"

	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -420, 0, _1080p * 771, _1080p * -239)
	var_2_0:addElement(var_2_4)

	var_2_0.ClaimedTerritories = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "SecondaryObjectiveReward"

	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/SECONDARY_OBJECTIVE_REWARD"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -250, _1080p * 250, _1080p * 676, _1080p * -376)
	var_2_0:addElement(var_2_6)

	var_2_0.SecondaryObjectiveReward = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "RewardText"

	var_2_8:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * 14, _1080p * 243, _1080p * 774, _1080p * -288)
	var_2_0:addElement(var_2_8)

	var_2_0.RewardText = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "Reward"

	var_2_10:setText("", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * 14, _1080p * 436, _1080p * 797, _1080p * -259)
	var_2_0:addElement(var_2_10)

	var_2_0.Reward = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("OperationEventBanner", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "OperationEventBanner"

	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 892, _1080p * 922)
	var_2_0:addElement(var_2_12)

	var_2_0.OperationEventBanner = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "EventName"

	var_2_14:setText("", 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Center)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 724, _1080p * 1224, _1080p * 102, _1080p * 120)
	var_2_0:addElement(var_2_14)

	var_2_0.EventName = var_2_14

	local var_2_15
	local var_2_16 = MenuBuilder.BuildRegisteredType("OperationRewardsContainer", {
		controllerIndex = var_2_1
	})

	var_2_16.id = "OperationRewardsContainer"

	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -224, _1080p * -104)
	var_2_0:addElement(var_2_16)

	var_2_0.OperationRewardsContainer = var_2_16

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OperationRewards", OperationRewards)
LockTable(_M)
