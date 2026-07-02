module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.WeaponStats)
	assert(arg_1_0.GameStats)
	assert(arg_1_0.VictoryStats)
	assert(arg_1_0.ScoreStats)
	arg_1_0.WeaponStats:SetData(arg_1_1)
	arg_1_0.GameStats:SetData(arg_1_1)
	arg_1_0.VictoryStats:SetData(arg_1_1)
	arg_1_0.ScoreStats:SetData(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetData = var_0_0

	var_0_0(arg_2_0, arg_2_1)
end

function BarracksStatsSummary(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1220 * _1080p, 0, 685 * _1080p)

	var_3_0.id = "BarracksStatsSummary"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("BarracksWeaponStatsPreview", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "WeaponStats"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 450)
	var_3_0:addElement(var_3_4)

	var_3_0.WeaponStats = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("BarracksGameStatsPreview", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GameStats"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 410, _1080p * 810, 0, _1080p * 450)
	var_3_0:addElement(var_3_6)

	var_3_0.GameStats = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BarracksVictoryStatsPreview", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "VictoryStats"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, 0, _1080p * 450)
	var_3_0:addElement(var_3_8)

	var_3_0.VictoryStats = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BarracksScoreStatsPreview", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "ScoreStats"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1220, _1080p * 460, _1080p * 685)
	var_3_0:addElement(var_3_10)

	var_3_0.ScoreStats = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BarracksStatsSummary", BarracksStatsSummary)
LockTable(_M)
