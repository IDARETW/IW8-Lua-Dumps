module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.WorldMapButton.navigation = {}
	arg_1_0.WorldMapButton.navigation.left = arg_1_1[arg_1_0.navTable.left]
	arg_1_0.WorldMapButton.navigation.right = arg_1_1[arg_1_0.navTable.right]
	arg_1_0.WorldMapButton.navigation.up = arg_1_1[arg_1_0.navTable.up]
	arg_1_0.WorldMapButton.navigation.down = arg_1_1[arg_1_0.navTable.down]
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.MapID)

	arg_2_0.SetupNavigation = var_0_0
	arg_2_0.navTable = {
		left = arg_2_2.Left,
		right = arg_2_2.Right,
		up = arg_2_2.Up,
		down = arg_2_2.Down
	}
end

function WorldMapElement(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "WorldMapElement"
	var_3_0.WorldMapButton = MenuBuilder.BuildRegisteredType("WorldMapButton", {
		controllerIndex = arg_3_1.controllerIndex
	})
	var_3_0.WorldMapButton.id = "WorldMapButton"

	var_3_0:addElement(var_3_0.WorldMapButton)
	var_0_1(var_3_0, controllerIndex, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WorldMapElement", WorldMapElement)
LockTable(_M)
