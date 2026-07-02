module(..., package.seeall)

function GenericBoxWithBorders(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "GenericBoxWithBorders"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Fill"

	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Stroke"

	var_1_6.Left:SetRight(_1080p * 1, 0)
	var_1_6.Right:SetLeft(_1080p * -1, 0)
	var_1_6.Top:SetBottom(_1080p * 1, 0)
	var_1_6.Bottom:SetTop(_1080p * -1, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Stroke = var_1_6

	return var_1_0
end

MenuBuilder.registerType("GenericBoxWithBorders", GenericBoxWithBorders)
LockTable(_M)
