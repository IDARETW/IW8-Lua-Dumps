module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		for iter_1_0, iter_1_1 in ipairs(arg_1_0._stats) do
			if iter_1_0 <= #arg_1_1 then
				iter_1_1:Setup(arg_1_1[iter_1_0])
			else
				iter_1_1:SetAlpha(0)
			end
		end
	else
		for iter_1_2, iter_1_3 in ipairs(arg_1_0._stats) do
			iter_1_3:SetAlpha(0)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
	arg_2_0._stats = {}

	table.insert(arg_2_0._stats, arg_2_0.Stat1)
	table.insert(arg_2_0._stats, arg_2_0.Stat2)
	table.insert(arg_2_0._stats, arg_2_0.Stat3)
	table.insert(arg_2_0._stats, arg_2_0.Stat4)
	table.insert(arg_2_0._stats, arg_2_0.Stat5)
	table.insert(arg_2_0._stats, arg_2_0.Stat6)
end

function CombatRecordStatsGroup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 580 * _1080p, 0, 520 * _1080p)

	var_3_0.id = "CombatRecordStatsGroup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Stat1"

	var_3_4.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 280, 0, _1080p * 160)
	var_3_0:addElement(var_3_4)

	var_3_0.Stat1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Stat2"

	var_3_6.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 280, _1080p * 180, _1080p * 340)
	var_3_0:addElement(var_3_6)

	var_3_0.Stat2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Stat3"

	var_3_8.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 280, _1080p * 360, _1080p * 520)
	var_3_0:addElement(var_3_8)

	var_3_0.Stat3 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Stat4"

	var_3_10.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 580, 0, _1080p * 160)
	var_3_0:addElement(var_3_10)

	var_3_0.Stat4 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Stat5"

	var_3_12.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 580, _1080p * 180, _1080p * 340)
	var_3_0:addElement(var_3_12)

	var_3_0.Stat5 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Stat6"

	var_3_14.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 580, _1080p * 360, _1080p * 520)
	var_3_0:addElement(var_3_14)

	var_3_0.Stat6 = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CombatRecordStatsGroup", CombatRecordStatsGroup)
LockTable(_M)
