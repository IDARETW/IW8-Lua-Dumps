module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	return
end

function ClanDashboardOnboardingLayout(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIHorizontalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1240 * _1080p, 0, 475 * _1080p)

	var_2_0.id = "ClanDashboardOnboardingLayout"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(20 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("ClanOnboardingWidget", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "ClanOnboarding1"

	var_2_4.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_ONBOARDING_01"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 475)
	var_2_0:addElement(var_2_4)

	var_2_0.ClanOnboarding1 = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("ClanOnboardingWidget", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "ClanOnboarding2"

	var_2_6.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_ONBOARDING_02"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 420, _1080p * 820, 0, _1080p * 475)
	var_2_0:addElement(var_2_6)

	var_2_0.ClanOnboarding2 = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("ClanOnboardingWidget", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "ClanOnboarding3"

	var_2_8.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_ONBOARDING_03"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 840, _1080p * 1240, 0, _1080p * 475)
	var_2_0:addElement(var_2_8)

	var_2_0.ClanOnboarding3 = var_2_8

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ClanDashboardOnboardingLayout", ClanDashboardOnboardingLayout)
LockTable(_M)
