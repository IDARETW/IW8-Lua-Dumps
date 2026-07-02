module(..., package.seeall)

function NetworkInfos(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 170 * _1080p)

	var_1_0.id = "NetworkInfos"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.15, 0)
	var_1_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_1_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("NetworkInfosList", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "NetworkInfosList"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 25, _1080p * -25, _1080p * 20, _1080p * 38)
	var_1_0:addElement(var_1_6)

	var_1_0.NetworkInfosList = var_1_6

	return var_1_0
end

MenuBuilder.registerType("NetworkInfos", NetworkInfos)
LockTable(_M)
