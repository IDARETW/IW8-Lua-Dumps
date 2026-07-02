module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		0,
		0,
		0
	}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		if iter_1_1 > 0 then
			var_1_0[1] = var_1_0[1] + 1
		end

		if iter_1_1 > 1 then
			var_1_0[2] = var_1_0[2] + 1
		end

		if iter_1_1 > 2 then
			var_1_0[3] = var_1_0[3] + 1
		end
	end

	arg_1_0.Gold:RefreshData(3, arg_1_1, var_1_0[3])
	arg_1_0.Silver:RefreshData(2, arg_1_1, var_1_0[2])
	arg_1_0.Bronze:RefreshData(1, arg_1_1, var_1_0[1])
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.RefreshData = var_0_0
end

function TrialEventEarnedMedalsContainer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "TrialEventEarnedMedalsContainer"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(16 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TrialEventEarnedMedalsContainerType", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Gold"

	var_3_4.Type:SetRGBFromTable(SWATCHES.trialEvent.trialGold, 0)
	var_3_4.Type:setText(Engine.CBBHFCGDIC("TRIALEVENT/GOLD"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.Gold = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("TrialEventEarnedMedalsContainerType", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Silver"

	var_3_6.Type:SetRGBFromTable(SWATCHES.trialEvent.trialSilver, 0)
	var_3_6.Type:setText(Engine.CBBHFCGDIC("TRIALEVENT/SILVER"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 48, _1080p * 80)
	var_3_0:addElement(var_3_6)

	var_3_0.Silver = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("TrialEventEarnedMedalsContainerType", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Bronze"

	var_3_8.Type:SetRGBFromTable(SWATCHES.trialEvent.trialBronze, 0)
	var_3_8.Type:setText(Engine.CBBHFCGDIC("TRIALEVENT/BRONZE"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 96, _1080p * 128)
	var_3_0:addElement(var_3_8)

	var_3_0.Bronze = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialEventEarnedMedalsContainer", TrialEventEarnedMedalsContainer)
LockTable(_M)
