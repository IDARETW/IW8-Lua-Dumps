module(..., package.seeall)

function HeaderOnlyExpander(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 38 * _1080p)

	var_1_0.id = "HeaderOnlyExpander"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "DummyChildrenContainer"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 38, 0, _1080p * 43, _1080p * 43)
	var_1_0:addElement(var_1_4)

	var_1_0.DummyChildrenContainer = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("HeaderOnlyExpanderHeader", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Header"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 38)
	var_1_0:addElement(var_1_6)

	var_1_0.Header = var_1_6

	return var_1_0
end

MenuBuilder.registerType("HeaderOnlyExpander", HeaderOnlyExpander)
LockTable(_M)
