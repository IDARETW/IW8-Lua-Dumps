module(..., package.seeall)

function SocialFriendSearch(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "SocialFriendSearch"

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

	local var_1_5

	if CONDITIONS.IsPC(var_1_0) then
		local var_1_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_1_1
		})

		var_1_6.id = "SendFriendRequestButton"

		if CONDITIONS.IsPC(var_1_0) then
			-- block empty
		end

		var_1_6.Text:SetLeft(_1080p * 20, 0)
		var_1_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/SEND_INVITE"), 0)
		var_1_6.Text:SetAlignment(LUI.Alignment.Left)
		var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -71, _1080p * 81, _1080p * 119)
		var_1_0:addElement(var_1_6)

		var_1_0.SendFriendRequestButton = var_1_6
	end

	return var_1_0
end

MenuBuilder.registerType("SocialFriendSearch", SocialFriendSearch)
LockTable(_M)
