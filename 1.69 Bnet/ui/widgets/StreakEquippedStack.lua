module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0._streakInfos) do
		iter_1_1:ShowKills(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = false

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._streakInfos) do
		if arg_2_1[iter_2_0] ~= nil then
			local var_2_1 = arg_2_1[iter_2_0]

			iter_2_1:SetupStreak(var_2_1.ref)
			iter_2_1:SetAlpha(var_2_1.isActive and 1 or 0.25)

			if var_2_1.isActive == false then
				var_2_0 = true
			end
		end
	end

	arg_2_0.DeselectWarning:SetAlpha(var_2_0 and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Coop, CoD.PlayMode.Aliens).coopCareerStats.currency:GetValue(arg_3_2)
	local var_3_1
	local var_3_2
	local var_3_3

	for iter_3_0, iter_3_1 in ipairs(arg_3_0._streakInfos) do
		if arg_3_1[iter_3_0] ~= nil then
			if iter_3_0 == 1 then
				var_3_1 = tonumber(arg_3_1[iter_3_0].scoreCost)

				iter_3_1:SetupStreak("empty1")
				PlayerData.BFFBGAJGD(arg_3_2, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[0].munition:set("empty1")
			elseif iter_3_0 == 2 then
				var_3_2 = tonumber(arg_3_1[iter_3_0].scoreCost)

				iter_3_1:SetupStreak("empty2")
				PlayerData.BFFBGAJGD(arg_3_2, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[1].munition:set("empty2")
			elseif iter_3_0 == 3 then
				var_3_3 = tonumber(arg_3_1[iter_3_0].scoreCost)

				iter_3_1:SetupStreak("empty3")
				PlayerData.BFFBGAJGD(arg_3_2, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[2].munition:set("empty3")
			end
		end
	end

	PlayerData.BFFBGAJGD(arg_3_2, CoD.StatsGroup.Coop).coopCareerStats.currency:set(var_3_0 + var_3_1 + var_3_2 + var_3_3)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.StreakInfoOne)
	assert(arg_4_0.StreakInfoTwo)
	assert(arg_4_0.StreakInfoThree)
	arg_4_0:SetHandleMouse(false)

	arg_4_0.Update = var_0_1
	arg_4_0.ShowKills = var_0_0
	arg_4_0.ClearMunitions = var_0_2
	arg_4_0._streakInfos = {
		arg_4_0.StreakInfoOne,
		arg_4_0.StreakInfoTwo,
		arg_4_0.StreakInfoThree
	}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0._streakInfos) do
		iter_4_1.Text:SetAlignment(LUI.Alignment.Left)

		if CONDITIONS.IsThirdGameMode() then
			ACTIONS.AnimateSequence(iter_4_1, "MoveTextCP")
		else
			ACTIONS.AnimateSequence(iter_4_1, "MoveText")
		end
	end
end

function StreakEquippedStack(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 300 * _1080p)

	var_5_0.id = "StreakEquippedStack"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0.6, 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -104, _1080p * 95, _1080p * -157, _1080p * 143)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("StreakEquippedSlots", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "StreakEquippedSlots"

	var_5_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -68, _1080p * 68, 0, _1080p * 32)
	var_5_0:addElement(var_5_6)

	var_5_0.StreakEquippedSlots = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("StreakInfo", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "StreakInfoThree"

	var_5_8:SetAlpha(0.6, 0)
	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -104, _1080p * -24, _1080p * 36, _1080p * 116)
	var_5_0:addElement(var_5_8)

	var_5_0.StreakInfoThree = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("StreakInfo", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "StreakInfoTwo"

	var_5_10:SetAlpha(0.6, 0)
	var_5_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -104, _1080p * -24, _1080p * 120, _1080p * 200)
	var_5_0:addElement(var_5_10)

	var_5_0.StreakInfoTwo = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("StreakInfo", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "StreakInfoOne"

	var_5_12:SetAlpha(0.6, 0)
	var_5_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -104, _1080p * -24, _1080p * 204, _1080p * 284)
	var_5_0:addElement(var_5_12)

	var_5_0.StreakInfoOne = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "DeselectWarning"

	var_5_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("MENU/UNEQUIPPED_WARNING"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -84, _1080p * 95, _1080p * -32, _1080p * -12)
	var_5_0:addElement(var_5_14)

	var_5_0.DeselectWarning = var_5_14

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("StreakEquippedStack", StreakEquippedStack)
LockTable(_M)
