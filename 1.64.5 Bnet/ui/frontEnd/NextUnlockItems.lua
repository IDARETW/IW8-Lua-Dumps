module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0 = 1, GUNSMITH.bucketItems do
		local var_1_0 = arg_1_0["NextUnlockItem" .. iter_1_0]

		assert(var_1_0)

		if arg_1_1[iter_1_0] then
			var_1_0:Setup(arg_1_1[iter_1_0], arg_1_2, iter_1_0)
		else
			var_1_0:SetAlpha(0)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function NextUnlockItems(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1300 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "NextUnlockItems"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(180 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("NextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "NextUnlockItem1"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_3_0:addElement(var_3_4)

	var_3_0.NextUnlockItem1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("NextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "NextUnlockItem2"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 436, 0, _1080p * 128)
	var_3_0:addElement(var_3_6)

	var_3_0.NextUnlockItem2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("NextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "NextUnlockItem3"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 616, _1080p * 744, 0, _1080p * 128)
	var_3_0:addElement(var_3_8)

	var_3_0.NextUnlockItem3 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("NextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "NextUnlockItem4"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 924, _1080p * 1052, 0, _1080p * 128)
	var_3_0:addElement(var_3_10)

	var_3_0.NextUnlockItem4 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("NextUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "NextUnlockItem5"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1232, _1080p * 1360, 0, _1080p * 128)
	var_3_0:addElement(var_3_12)

	var_3_0.NextUnlockItem5 = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("NextUnlockItems", NextUnlockItems)
LockTable(_M)
