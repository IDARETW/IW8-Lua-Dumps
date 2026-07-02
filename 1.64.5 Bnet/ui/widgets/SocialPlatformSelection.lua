module(..., package.seeall)

function SocialPlatformSelection(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 25 * _1080p)

	var_1_0.id = "SocialPlatformSelection"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(10 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("SocialPlatformCheckbox", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "ActivisionCheckbox"

	var_1_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FRIENDS_ACTIVISION"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 25)
	var_1_0:addElement(var_1_4)

	var_1_0.ActivisionCheckbox = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("SocialPlatformCheckbox", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "BattlenetCheckbox"

	var_1_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FRIENDS_BATTLENET"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 410, 0, _1080p * 25)
	var_1_0:addElement(var_1_6)

	var_1_0.BattlenetCheckbox = var_1_6

	return var_1_0
end

MenuBuilder.registerType("SocialPlatformSelection", SocialPlatformSelection)
LockTable(_M)
