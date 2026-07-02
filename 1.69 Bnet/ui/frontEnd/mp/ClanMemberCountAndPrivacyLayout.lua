module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ClanMemberCountWidget:SetMemberCountFromClanData(arg_1_1, {
		isUpperCase = true
	})
	arg_1_0.ClanPrivacyWidget:SetClanPrivacyFromClanData(arg_1_1, {
		isUpperCase = true
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetClanData = var_0_0
end

function ClanMemberCountAndPrivacyLayout(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 826 * _1080p, 0, 28 * _1080p)

	var_3_0.id = "ClanMemberCountAndPrivacyLayout"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(32 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("ClanMemberCountWidget", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "ClanMemberCountWidget"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 397, 0, _1080p * 28)
	var_3_0:addElement(var_3_4)

	var_3_0.ClanMemberCountWidget = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ClanPrivacyWidget", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ClanPrivacyWidget"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 429, _1080p * 826, 0, _1080p * 28)
	var_3_0:addElement(var_3_6)

	var_3_0.ClanPrivacyWidget = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClanMemberCountAndPrivacyLayout", ClanMemberCountAndPrivacyLayout)
LockTable(_M)
