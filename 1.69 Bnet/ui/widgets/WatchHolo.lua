module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		digit = SWATCHES.splashNotifications.Green,
		base = SWATCHES.Reticles.BrightGreen
	}
	local var_1_1 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4
	}

	if Engine.DDJFBBJAIG() then
		arg_1_0.Mask:SetAlpha(0.3)
	end

	arg_1_0:registerOmnvarHandler("ui_pet_watch_state", function(arg_2_0)
		if Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state") ~= 0 then
			arg_2_0.Digit1:SetRGBFromInt(3684408, 0)
			arg_2_0.Digit2:SetRGBFromInt(3684408, 0)
			arg_2_0.Digit3:SetRGBFromInt(3684408, 0)
			arg_2_0.Digit4:SetRGBFromInt(3684408, 0)
			arg_2_0.Colon:SetRGBFromInt(19456, 0)
		end
	end)

	local var_1_2

	local function var_1_3()
		local var_3_0 = math.random(-360, 360)
		local var_3_1 = math.random(10000, 20000)
		local var_3_2 = math.random(0, #LUI.EASING)
		local var_3_3 = arg_1_0:Wait(var_3_1)

		arg_1_0.Mask:SetZRotation(var_3_0, var_3_1, var_3_2)

		var_3_3.onComplete = var_1_3
	end

	var_1_3()

	for iter_1_0 = 1, #var_1_1 do
		var_1_1[iter_1_0]:Setup("glow")
		var_1_1[iter_1_0].Base:SetMask(arg_1_0.Mask)
	end

	local var_1_4

	local function var_1_5()
		local var_4_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_4_1 = {}
		local var_4_2 = {}
		local var_4_3 = false

		for iter_4_0 = 1, #var_4_0 do
			local var_4_4 = string.sub(tostring(var_4_0), iter_4_0, iter_4_0)

			if tonumber(var_4_4) then
				if var_4_3 then
					var_4_2[#var_4_2 + 1] = var_4_4
				else
					var_4_1[#var_4_1 + 1] = var_4_4
				end
			else
				var_4_3 = true
			end
		end

		if #var_4_1 < 2 then
			var_4_1[2] = var_4_1[1]
			var_4_1[1] = "0"
		end

		var_1_1[1]:SetGlowDigit(var_4_1[1], 0, var_1_0)
		var_1_1[2]:SetGlowDigit(var_4_1[2], 2, var_1_0)
		var_1_1[3]:SetGlowDigit(var_4_2[1], 3, var_1_0)
		var_1_1[4]:SetGlowDigit(var_4_2[2], 4, var_1_0)

		arg_1_0:Wait(var_0_0).onComplete = var_1_5
	end

	var_1_5()
end

function WatchHolo(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_5_0.id = "WatchHolo"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Digit1"

	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -233, _1080p * -83, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.Digit1 = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Digit2"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -141, _1080p * 9, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_6)

	var_5_0.Digit2 = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Digit3"

	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 126, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_8)

	var_5_0.Digit3 = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Digit4"

	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 70, _1080p * 220, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_10)

	var_5_0.Digit4 = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Colon"

	var_5_12:SetRGBFromTable(SWATCHES.Reticles.BrightGreen, 0)
	var_5_12:SetZRotation(-2, 0)
	var_5_12:setImage(RegisterMaterial("watch_glow_digit_colon"), 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 185, _1080p * 313, _1080p * 206, _1080p * 334)
	var_5_0:addElement(var_5_12)

	var_5_0.Colon = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Mask"

	var_5_14:SetAlpha(0.8, 0)
	var_5_14:SetScale(0.3, 0)
	var_5_14:setImage(RegisterMaterial("watch_glow_digit_mask"), 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -202, _1080p * 226, _1080p * -62, _1080p * 366)
	var_5_0:addElement(var_5_14)

	var_5_0.Mask = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_5_12:RegisterAnimationSequence("Flash", var_5_17)

	local function var_5_18()
		var_5_12:AnimateLoop("Flash")
	end

	var_5_0._sequences.Flash = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 326
		},
		{
			duration = 40000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -264,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 40000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 164,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 40000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -102,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 40000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 326,
			easing = LUI.EASING.inOutBack
		}
	}

	var_5_14:RegisterAnimationSequence("Wave", var_5_20)

	local function var_5_21()
		var_5_14:AnimateLoop("Wave")
	end

	var_5_0._sequences.Wave = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 360,
			duration = 20000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_5_14:RegisterAnimationSequence("Rotate", var_5_23)

	local function var_5_24()
		var_5_14:AnimateLoop("Rotate")
	end

	var_5_0._sequences.Rotate = var_5_24

	var_0_1(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "Flash")
	ACTIONS.AnimateSequence(var_5_0, "Wave")

	return var_5_0
end

MenuBuilder.registerType("WatchHolo", WatchHolo)
LockTable(_M)
