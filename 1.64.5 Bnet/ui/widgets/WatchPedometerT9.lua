module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4,
		arg_1_0.Digit5,
		arg_1_0.Digit6
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("retroT9")
	end

	local function var_1_1(arg_2_0)
		local var_2_0 = tostring(arg_2_0)
		local var_2_1 = {}

		for iter_2_0 = 1, #var_1_0 do
			local var_2_2 = tonumber(string.sub(var_2_0, iter_2_0, iter_2_0))

			if var_2_2 then
				table.insert(var_2_1, var_2_2)
			else
				table.insert(var_2_1, 1, 0)
			end
		end

		for iter_2_1 = 1, #var_1_0 do
			var_1_0[iter_2_1]:SetCounterDigit(var_2_1[iter_2_1], iter_2_1, #var_2_1)
		end
	end

	if Engine.DDJFBBJAIG() then
		var_1_1(math.random(100, 10000))
	else
		local var_1_2 = LUI.DataSourceInControllerModel.new("cg.player.footstepCount")

		arg_1_0:SubscribeToModel(var_1_2:GetModel(arg_1_1), function(arg_3_0)
			local var_3_0 = DataModel.JJEHAEBDF(arg_3_0)

			if var_3_0 ~= nil then
				var_1_1(var_3_0)
			end
		end)
	end
end

function WatchPedometerT9(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_4_0.id = "WatchPedometerT9"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Digit6"

	var_4_4:SetRGBFromInt(2895923, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 384, _1080p * 448, _1080p * 148, _1080p * 230)
	var_4_0:addElement(var_4_4)

	var_4_0.Digit6 = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Digit5"

	var_4_6:SetRGBFromInt(2895923, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 384, _1080p * 148, _1080p * 230)
	var_4_0:addElement(var_4_6)

	var_4_0.Digit5 = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Digit4"

	var_4_8:SetRGBFromInt(2895923, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 256, _1080p * 320, _1080p * 148, _1080p * 230)
	var_4_0:addElement(var_4_8)

	var_4_0.Digit4 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Digit3"

	var_4_10:SetRGBFromInt(2895923, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 256, _1080p * 148, _1080p * 230)
	var_4_0:addElement(var_4_10)

	var_4_0.Digit3 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Digit2"

	var_4_12:SetRGBFromInt(2895923, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 192, _1080p * 148, _1080p * 230)
	var_4_0:addElement(var_4_12)

	var_4_0.Digit2 = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "Digit1"

	var_4_14:SetRGBFromInt(2895923, 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 128, _1080p * 148, _1080p * 230)
	var_4_0:addElement(var_4_14)

	var_4_0.Digit1 = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("WatchPedometerT9StepAnim", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "StepAnim"

	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 422, _1080p * 249, _1080p * 424)
	var_4_0:addElement(var_4_16)

	var_4_0.StepAnim = var_4_16

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WatchPedometerT9", WatchPedometerT9)
LockTable(_M)
