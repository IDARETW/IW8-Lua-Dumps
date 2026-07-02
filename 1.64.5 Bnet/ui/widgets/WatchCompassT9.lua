module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Arrow)

	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3
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

	if not Engine.DDJFBBJAIG() then
		arg_1_0:SubscribeToModel(DataSources.inGame.HUD.compassRotation:GetModel(arg_1_1), function(arg_3_0)
			local var_3_0 = DataModel.JJEHAEBDF(arg_3_0)
			local var_3_1 = math.abs(math.floor(var_3_0) - 360) % 360

			if var_3_1 < 0 then
				var_3_1 = var_3_1 + 360
			end

			var_1_1(var_3_1)
			arg_1_0.Arrow:SetZRotation(-var_3_1)
		end)
	else
		var_1_1(0)
	end
end

function WatchCompassT9(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_4_0.id = "WatchCompassT9"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Arrow"

	var_4_4:SetRGBFromInt(1974304, 0)
	var_4_4:setImage(RegisterMaterial("watch_waypoint_arrow"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -164, _1080p * 164, _1080p * -156, _1080p * 156)
	var_4_0:addElement(var_4_4)

	var_4_0.Arrow = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "DegreeBG"

	var_4_6:SetRGBFromInt(5204342, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * 92, _1080p * 154)
	var_4_0:addElement(var_4_6)

	var_4_0.DegreeBG = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Digit3"

	var_4_8:SetRGBFromInt(1974304, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 275, _1080p * 309, _1080p * 357, _1080p * 400)
	var_4_0:addElement(var_4_8)

	var_4_0.Digit3 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Digit2"

	var_4_10:SetRGBFromInt(1974304, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 239, _1080p * 273, _1080p * 357, _1080p * 400)
	var_4_0:addElement(var_4_10)

	var_4_0.Digit2 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Digit1"

	var_4_12:SetRGBFromInt(1974304, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 203, _1080p * 237, _1080p * 357, _1080p * 400)
	var_4_0:addElement(var_4_12)

	var_4_0.Digit1 = var_4_12

	local function var_4_13()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -40,
			duration = 1000,
			property = TWEEN_PROPERTY.Z_Rotation,
			easing = LUI.EASING.outQuartic
		},
		{
			value = -120,
			duration = 500,
			property = TWEEN_PROPERTY.Z_Rotation,
			easing = LUI.EASING.outQuartic
		},
		{
			value = -120,
			duration = 1000,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 55,
			duration = 750,
			property = TWEEN_PROPERTY.Z_Rotation,
			easing = LUI.EASING.outQuartic
		},
		{
			value = 0,
			duration = 750,
			property = TWEEN_PROPERTY.Z_Rotation,
			easing = LUI.EASING.inQuartic
		}
	}

	var_4_4:RegisterAnimationSequence("Preview", var_4_15)

	local function var_4_16()
		var_4_4:AnimateLoop("Preview")
	end

	var_4_0._sequences.Preview = var_4_16

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WatchCompassT9", WatchCompassT9)
LockTable(_M)
