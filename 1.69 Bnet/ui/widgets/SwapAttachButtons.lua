module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.SwapAttachButton1,
		arg_1_0.SwapAttachButton2,
		arg_1_0.SwapAttachButton3
	}

	for iter_1_0 = 1, #var_1_0 do
		assert(arg_1_1[iter_1_0])
		var_1_0[iter_1_0]:Setup(arg_1_1[iter_1_0], arg_1_2)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.SwapAttachButton1)
	assert(arg_2_0.SwapAttachButton2)
	assert(arg_2_0.SwapAttachButton3)

	arg_2_0.Setup = var_0_0
end

function SwapAttachButtons(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalList.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 440 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "SwapAttachButtons"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(70 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("SwapAttachButton", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "SwapAttachButton1"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 100, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.SwapAttachButton1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("SwapAttachButton", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "SwapAttachButton2"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 170, _1080p * 270, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.SwapAttachButton2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("SwapAttachButton", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "SwapAttachButton3"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 340, _1080p * 440, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.SwapAttachButton3 = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SwapAttachButtons", SwapAttachButtons)
LockTable(_M)
