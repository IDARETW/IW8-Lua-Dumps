module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ClanBadgeWidget:SetClanData(arg_1_1)
	arg_1_0.ClanMembersOnlineWidget:SetClanData(arg_1_1)
	arg_1_0.ClanProgressionWidget:SetClanProgression(arg_1_0._controllerIndex)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.RefreshClanData = var_0_0
end

function ClanDashboardDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "ClanDashboardDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3

	if CONDITIONS.AlwaysFalse() then
		local var_3_4 = LUI.UIImage.new()

		var_3_4.id = "DebugBackground"

		var_3_4:SetRGBFromInt(16711896, 0)
		var_3_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1364, _1080p * -96, _1080p * 160, _1080p * -69)
		var_3_0:addElement(var_3_4)

		var_3_0.DebugBackground = var_3_4
	end

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ClanMembersOnlineWidget", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ClanMembersOnlineWidget"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 584, _1080p * 1004, _1080p * 879, _1080p * 959)
	var_3_0:addElement(var_3_6)

	var_3_0.ClanMembersOnlineWidget = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Divider"

	var_3_8:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 584, _1080p * -96, _1080p * 855, _1080p * 859)
	var_3_0:addElement(var_3_8)

	var_3_0.Divider = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("ClanDashboardOnboardingLayout", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "ClanDashboardOnboardingLayout"

	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 584, _1080p * -96, _1080p * 360, _1080p * 835)
	var_3_0:addElement(var_3_10)

	var_3_0.ClanDashboardOnboardingLayout = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("ClanBadgeWidget", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ClanBadgeWidget"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 584, _1080p * 1144, _1080p * 200, _1080p * 340)
	var_3_0:addElement(var_3_12)

	var_3_0.ClanBadgeWidget = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("ClanProgressionWidget", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "ClanProgressionWidget"

	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -616, _1080p * -96, _1080p * 170, _1080p * 270)
	var_3_0:addElement(var_3_14)

	var_3_0.ClanProgressionWidget = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClanDashboardDetails", ClanDashboardDetails)
LockTable(_M)
