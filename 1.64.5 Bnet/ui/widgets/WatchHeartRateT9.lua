module(..., package.seeall)

local var_0_0 = 4000
local var_0_1 = 12000

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = math.random(60, 80)
	local var_1_1 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3
	}

	for iter_1_0 = 1, #var_1_1 do
		var_1_1[iter_1_0]:Setup("retroT9")
	end

	local function var_1_2(arg_2_0)
		local var_2_0 = tostring(arg_2_0)
		local var_2_1 = {}

		for iter_2_0 = 1, #var_1_1 do
			local var_2_2 = tonumber(string.sub(var_2_0, iter_2_0, iter_2_0))

			if var_2_2 then
				table.insert(var_2_1, var_2_2)
			else
				table.insert(var_2_1, 1, 0)
			end
		end

		for iter_2_1 = 1, #var_1_1 do
			var_1_1[iter_2_1]:SetCounterDigit(var_2_1[iter_2_1], iter_2_1, #var_2_1)
		end
	end

	if Engine.DDJFBBJAIG() then
		local var_1_3

		local function var_1_4()
			var_1_0 = math.random(60, 80)

			var_1_2(var_1_0)
			arg_1_0.WatchEKG:UpdateEKG(var_1_0 > 75)

			arg_1_0:Wait(5000).onComplete = var_1_4
		end

		var_1_4()
	else
		var_1_2(var_1_0)

		local var_1_5 = DataSources.inGame.player.isSprinting
		local var_1_6 = DataSources.inGame.player.health

		local function var_1_7()
			local var_4_0 = var_1_6:GetValue(arg_1_1)
			local var_4_1 = var_1_5:GetValue(arg_1_1)

			if var_4_0 ~= nil then
				if var_4_0 < 75 or var_4_1 then
					arg_1_0:Wait(var_0_0).onComplete = function()
						ACTIONS.AnimateSequence(arg_1_0, "BeatFast")

						var_1_0 = math.random(110, 170)

						var_1_2(var_1_0)
						arg_1_0.WatchEKG:UpdateEKG(true)
					end
				else
					arg_1_0:Wait(var_0_1).onComplete = function()
						ACTIONS.AnimateSequence(arg_1_0, "BeatNormal")

						var_1_0 = math.random(60, 80)

						var_1_2(var_1_0)
						arg_1_0.WatchEKG:UpdateEKG(false)
					end
				end
			end
		end

		arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), var_1_7)
		arg_1_0:SubscribeToModel(var_1_5:GetModel(arg_1_1), var_1_7)
	end
end

function WatchHeartRateT9(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_7_0.id = "WatchHeartRateT9"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("WatchEKGT9", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "WatchEKG"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 55, _1080p * 251)
	var_7_0:addElement(var_7_4)

	var_7_0.WatchEKG = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "RateBackground"

	var_7_6:SetRGBFromInt(1513239, 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 386, _1080p * 256, _1080p * 512)
	var_7_0:addElement(var_7_6)

	var_7_0.RateBackground = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "Digit3"

	var_7_8:SetRGBFromInt(13950693, 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 244, _1080p * 346, _1080p * 296, _1080p * 472)
	var_7_0:addElement(var_7_8)

	var_7_0.Digit3 = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "Digit2"

	var_7_10:SetRGBFromInt(13950693, 0)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 244, _1080p * 296, _1080p * 472)
	var_7_0:addElement(var_7_10)

	var_7_0.Digit2 = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "Digit1"

	var_7_12:SetRGBFromInt(13950693, 0)
	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 142, _1080p * 296, _1080p * 472)
	var_7_0:addElement(var_7_12)

	var_7_0.Digit1 = var_7_12

	local function var_7_13()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_13

	local function var_7_14()
		return
	end

	var_7_0._sequences.BeatNormal = var_7_14

	local function var_7_15()
		return
	end

	var_7_0._sequences.BeatFast = var_7_15

	local var_7_16
	local var_7_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Screen1", var_7_17)

	local function var_7_18()
		var_7_4:AnimateSequence("Screen1")
	end

	var_7_0._sequences.Screen1 = var_7_18

	local var_7_19
	local var_7_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Screen2", var_7_20)

	local function var_7_21()
		var_7_4:AnimateSequence("Screen2")
	end

	var_7_0._sequences.Screen2 = var_7_21

	local function var_7_22()
		return
	end

	var_7_0._sequences.BeatMed = var_7_22

	local function var_7_23()
		return
	end

	var_7_0._sequences.PulseFast = var_7_23

	local function var_7_24()
		return
	end

	var_7_0._sequences.PulseNormal = var_7_24

	local var_7_25
	local var_7_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Screen3", var_7_26)

	local function var_7_27()
		var_7_4:AnimateSequence("Screen3")
	end

	var_7_0._sequences.Screen3 = var_7_27

	local function var_7_28()
		return
	end

	var_7_0._sequences.Test = var_7_28

	local var_7_29
	local var_7_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		},
		{
			duration = 360,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 360,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 65
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 261
		}
	}

	var_7_4:RegisterAnimationSequence("Boot", var_7_30)

	local function var_7_31()
		var_7_4:AnimateSequence("Boot")
	end

	var_7_0._sequences.Boot = var_7_31

	var_0_2(var_7_0, var_7_1, arg_7_1)
	ACTIONS.AnimateSequence(var_7_0, "BeatNormal")
	ACTIONS.AnimateSequence(var_7_0, "PulseNormal")
	ACTIONS.AnimateSequence(var_7_0, "Boot")

	return var_7_0
end

MenuBuilder.registerType("WatchHeartRateT9", WatchHeartRateT9)
LockTable(_M)
