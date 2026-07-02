module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	for iter_1_0 = 1, GUNSMITH.bucketItems do
		local var_1_0 = arg_1_0["MiniNextUnlockItem" .. iter_1_0]

		assert(var_1_0)

		if arg_1_1[iter_1_0] then
			var_1_0:Setup(arg_1_1[iter_1_0], arg_1_2, iter_1_0, arg_1_3)
		else
			var_1_0:SetAlpha(0)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function MiniNextUnlockItems(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 80 * _1080p)

	var_3_0.id = "MiniNextUnlockItems"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(25 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "MiniNextUnlockItem1"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 50, 0, _1080p * 50)
	var_3_0:addElement(var_3_4)

	var_3_0.MiniNextUnlockItem1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "MiniNextUnlockItem2"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 125, 0, _1080p * 50)
	var_3_0:addElement(var_3_6)

	var_3_0.MiniNextUnlockItem2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "MiniNextUnlockItem3"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 200, 0, _1080p * 50)
	var_3_0:addElement(var_3_8)

	var_3_0.MiniNextUnlockItem3 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "MiniNextUnlockItem4"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 225, _1080p * 275, 0, _1080p * 50)
	var_3_0:addElement(var_3_10)

	var_3_0.MiniNextUnlockItem4 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "MiniNextUnlockItem5"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 350, 0, _1080p * 50)
	var_3_0:addElement(var_3_12)

	var_3_0.MiniNextUnlockItem5 = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MiniNextUnlockItems", MiniNextUnlockItems)
LockTable(_M)
