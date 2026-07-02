module(..., package.seeall)

function CreatorCodeSearch(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "CreatorCodeSearch"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("SocialFriendSearchButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "NameTextBox"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -71, _1080p * 36, _1080p * 72)
	var_1_0:addElement(var_1_4)

	var_1_0.NameTextBox = var_1_4

	return var_1_0
end

MenuBuilder.registerType("CreatorCodeSearch", CreatorCodeSearch)
LockTable(_M)
