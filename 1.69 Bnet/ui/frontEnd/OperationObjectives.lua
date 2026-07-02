module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = WORLD_MAP.GetPrimaryObjective()
	local var_1_1 = WORLD_MAP.GetOptionalObjective()

	assert(var_1_0)
	assert(var_1_1)
	arg_1_0.PrimaryObjective:SetDetails(var_1_0)
	arg_1_0.OptionalObjective:SetDetails(var_1_1)
end

function OperationObjectives(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1050 * _1080p, 0, 360 * _1080p)

	var_2_0.id = "OperationObjectives"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Map"

	var_2_4:setImage(RegisterMaterial("mm_map_background_plate"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 547, _1080p * 1024, _1080p * 50, _1080p * 346)
	var_2_0:addElement(var_2_4)

	var_2_0.Map = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Objectives"

	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/OBJECTIVES_OPERATION_MENU"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 320, 0, _1080p * 22)
	var_2_0:addElement(var_2_6)

	var_2_0.Objectives = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("OperationObjective", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "PrimaryObjective"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 50, _1080p * 170)
	var_2_0:addElement(var_2_8)

	var_2_0.PrimaryObjective = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("OperationObjective", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "OptionalObjective"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 226, _1080p * 346)
	var_2_0:addElement(var_2_10)

	var_2_0.OptionalObjective = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OperationObjectives", OperationObjectives)
LockTable(_M)
