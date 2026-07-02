module(..., package.seeall)

local var_0_0 = 100

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.TimeHourOnes,
		arg_1_0.TimeHourTens,
		arg_1_0.TimeMinutesOnes,
		arg_1_0.TimeMinutesTens,
		arg_1_0.TimeSecondsOnes,
		arg_1_0.TimeSecondsTens
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("retroT9")
	end

	local var_1_1

	local function var_1_2()
		local var_2_0 = Engine.DCJHCAFIIA()
		local var_2_1 = Engine.CIIGICAIFC(var_2_0)
		local var_2_2 = tostring(var_2_0 % 60)
		local var_2_3 = {}
		local var_2_4 = {}
		local var_2_5 = {}
		local var_2_6 = false

		for iter_2_0 = 1, #var_2_1 do
			local var_2_7 = string.sub(tostring(var_2_1), iter_2_0, iter_2_0)

			if tonumber(var_2_7) then
				if var_2_6 then
					table.insert(var_2_4, var_2_7)
				else
					table.insert(var_2_3, var_2_7)
				end
			else
				var_2_6 = true
			end
		end

		if #var_2_3 < 2 then
			var_2_3[2] = var_2_3[1]
			var_2_3[1] = "0"
		end

		if #var_2_4 < 2 then
			var_2_4[2] = var_2_4[1]
			var_2_4[1] = "0"
		end

		for iter_2_1 = 1, #var_2_2 do
			local var_2_8 = string.sub(tostring(var_2_2), iter_2_1, iter_2_1)

			if tonumber(var_2_8) then
				table.insert(var_2_5, var_2_8)
			end
		end

		if #var_2_5 < 2 then
			var_2_5[2] = var_2_5[1]
			var_2_5[1] = "0"
		end

		for iter_2_2 = 1, #var_2_1 do
			local var_2_9 = string.sub(tostring(var_2_1), iter_2_2, iter_2_2)

			if tonumber(var_2_9) then
				if var_2_6 then
					table.insert(var_2_4, var_2_9)
				else
					table.insert(var_2_3, var_2_9)
				end
			else
				var_2_6 = true
			end
		end

		arg_1_0.TimeSecondsTens:SetCounterDigit(var_2_5[1])
		arg_1_0.TimeSecondsOnes:SetCounterDigit(var_2_5[2])
		arg_1_0.TimeMinutesTens:SetCounterDigit(var_2_4[1])
		arg_1_0.TimeMinutesOnes:SetCounterDigit(var_2_4[2])
		arg_1_0.TimeHourTens:SetCounterDigit(var_2_3[1])
		arg_1_0.TimeHourOnes:SetCounterDigit(var_2_3[2])

		arg_1_0:Wait(var_0_0).onComplete = var_1_2
	end

	var_1_2()
end

function WatchRadiationClock(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchRadiationClock"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "TimeHourTens"

	var_3_4:SetRGBFromInt(1669895, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 133, _1080p * 215, _1080p * 303)
	var_3_0:addElement(var_3_4)

	var_3_0.TimeHourTens = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "TimeHourOnes"

	var_3_6:SetRGBFromInt(1669895, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 133, _1080p * 201, _1080p * 215, _1080p * 303)
	var_3_0:addElement(var_3_6)

	var_3_0.TimeHourOnes = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "TimeMinutesTens"

	var_3_8:SetRGBFromInt(1669895, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 299, _1080p * 215, _1080p * 303)
	var_3_0:addElement(var_3_8)

	var_3_0.TimeMinutesTens = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "TimeMinutesOnes"

	var_3_10:SetRGBFromInt(1669895, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 299, _1080p * 367, _1080p * 215, _1080p * 303)
	var_3_0:addElement(var_3_10)

	var_3_0.TimeMinutesOnes = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "TimeSecondsTens"

	var_3_12:SetRGBFromInt(1669895, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 376, _1080p * 414, _1080p * 246, _1080p * 296)
	var_3_0:addElement(var_3_12)

	var_3_0.TimeSecondsTens = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "TimeSecondsOnes"

	var_3_14:SetRGBFromInt(1669895, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 416, _1080p * 454, _1080p * 246, _1080p * 296)
	var_3_0:addElement(var_3_14)

	var_3_0.TimeSecondsOnes = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Colon2"

	var_3_16:SetRGBFromInt(1669895, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 209, _1080p * 223, _1080p * 271, _1080p * 285)
	var_3_0:addElement(var_3_16)

	var_3_0.Colon2 = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "Colon1"

	var_3_18:SetRGBFromInt(1669895, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 209, _1080p * 223, _1080p * 233, _1080p * 247)
	var_3_0:addElement(var_3_18)

	var_3_0.Colon1 = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("WatchKillstreakLights", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "WatchKillstreakLights"

	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 506, 0, _1080p * 150)
	var_3_0:addElement(var_3_20)

	var_3_0.WatchKillstreakLights = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchRadiationClock", WatchRadiationClock)
LockTable(_M)
