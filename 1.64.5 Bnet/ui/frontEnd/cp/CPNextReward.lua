module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_0.Reward)
	assert(arg_1_2)
	assert(arg_1_3)
	arg_1_0.Reward.ItemName:SetAlpha(1, 0)
	arg_1_0.Reward.ItemType:SetAlpha(1, 0)

	local var_1_0 = CP.GetPlaylistReward(arg_1_2, arg_1_3)

	if var_1_0 ~= nil then
		arg_1_0:SetAlpha(1)

		if var_1_0.lootItemID < 170000 then
			ACTIONS.AnimateSequence(arg_1_0.Reward, "ConfigOperator")
		else
			ACTIONS.AnimateSequence(arg_1_0.Reward, "ConfigPlayercard")
		end

		arg_1_0.Reward:UpdateCardConfig(var_1_0)
		arg_1_0.Reward.ItemName:SetAlpha(1, 0)
		arg_1_0.Reward.ItemType:SetAlpha(1, 0)
		arg_1_0.Reward.ItemType:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -12, _1080p * 12, _1080p * -1, _1080p * 23)
		arg_1_0.Reward.Border:SetAlpha(0.3, 0)

		local var_1_1 = LOOT.IsUnlockedWithID(arg_1_1, var_1_0.lootItemID)
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetAlpha(0)
	arg_2_0:SubscribeToDataSourceThroughElement(arg_2_0, nil, function()
		local var_3_0 = arg_2_0:GetDataSource()

		if var_3_0 then
			local var_3_1 = var_3_0.scoreLimit:GetValue(arg_2_1)

			if var_3_1 ~= nil then
				local var_3_2 = 0

				if arg_2_0.id == "CPNextReward" then
					var_3_2 = 0
				elseif arg_2_0.id == "CPNextReward2" then
					var_3_2 = 1
				end

				var_0_0(arg_2_0, arg_2_1, var_3_1, var_3_2)
			end
		end
	end)

	if not IsSystemLink() then
		arg_2_0.bindButton = LUI.UIBindButton.new()
		arg_2_0.bindButton.id = "selfBindButton"

		arg_2_0:addElement(arg_2_0.bindButton)
	end
end

function CPNextReward(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 192 * _1080p, 0, 252 * _1080p)

	var_4_0.id = "CPNextReward"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Reward"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -100, _1080p * 100)
	var_4_0:addElement(var_4_4)

	var_4_0.Reward = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "CheckBox"

	var_4_6:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_4_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -48, _1080p * -30, _1080p * 62, _1080p * 80)
	var_4_0:addElement(var_4_6)

	var_4_0.CheckBox = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("LongLOC", var_4_9)

	local function var_4_10()
		var_4_4:AnimateSequence("LongLOC")
	end

	var_4_0._sequences.LongLOC = var_4_10

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CPNextReward", CPNextReward)
LockTable(_M)
