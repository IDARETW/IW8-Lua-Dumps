module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Static:SetMask(arg_1_0.Mask)

	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4
	}

	if Engine.DDJFBBJAIG() then
		arg_1_0.Mask:SetAlpha(0, 0)
		arg_1_0.Static:SetAlpha(0, 0)
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

	local var_1_1

	local function var_1_2()
		local var_3_0 = math.random(-360, 360)
		local var_3_1 = math.random(10000, 20000)
		local var_3_2 = math.random(0, #LUI.EASING)
		local var_3_3 = arg_1_0:Wait(var_3_1)

		arg_1_0.Mask:SetZRotation(var_3_0, var_3_1, var_3_2)

		var_3_3.onComplete = var_1_2
	end

	var_1_2()

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("glow")
		var_1_0[iter_1_0].Base:SetMask(arg_1_0.Mask)
	end

	local var_1_3

	local function var_1_4()
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

		var_1_0[1]:SetGlowDigit(var_4_1[1], 0)
		var_1_0[2]:SetGlowDigit(var_4_1[2], 2)
		var_1_0[3]:SetGlowDigit(var_4_2[1], 3)
		var_1_0[4]:SetGlowDigit(var_4_2[2], 4)

		arg_1_0:Wait(var_0_0).onComplete = var_1_4
	end

	var_1_4()
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
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Static"

	var_5_4:SetRGBFromTable(SWATCHES.Reticles.BrightGreen, 0)
	var_5_4:SetAlpha(0.3, 0)
	var_5_4:setImage(RegisterMaterial("hud_reticle_static_cross"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -32, _1080p * 562, _1080p * 115, _1080p * 447)
	var_5_0:addElement(var_5_4)

	var_5_0.Static = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Digit1"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -233, _1080p * -83, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_6)

	var_5_0.Digit1 = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Digit2"

	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -141, _1080p * 9, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_8)

	var_5_0.Digit2 = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Digit3"

	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 126, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_10)

	var_5_0.Digit3 = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "Digit4"

	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 70, _1080p * 220, _1080p * -50, _1080p * 100)
	var_5_0:addElement(var_5_12)

	var_5_0.Digit4 = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Colon"

	var_5_14:SetRGBFromTable(SWATCHES.Reticles.BrightGreen, 0)
	var_5_14:SetZRotation(-2, 0)
	var_5_14:setImage(RegisterMaterial("watch_glow_digit_colon"), 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 185, _1080p * 313, _1080p * 206, _1080p * 334)
	var_5_0:addElement(var_5_14)

	var_5_0.Colon = var_5_14

	local var_5_15

	if CONDITIONS.InGame(var_5_0) then
		local var_5_16 = MenuBuilder.BuildRegisteredType("ReticleFrame02", {
			controllerIndex = var_5_1
		})

		var_5_16.id = "ParallaxEnabler"

		var_5_16:SetAlpha(0, 0)
		var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 224, _1080p * 294, _1080p * 520, _1080p * 538)
		var_5_0:addElement(var_5_16)

		var_5_0.ParallaxEnabler = var_5_16
	end

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "Mask"

	var_5_18:SetAlpha(0.9, 0)
	var_5_18:SetScale(0.3, 0)
	var_5_18:setImage(RegisterMaterial("watch_glow_digit_mask"), 0)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -202, _1080p * 226, _1080p * -62, _1080p * 366)
	var_5_0:addElement(var_5_18)

	var_5_0.Mask = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("DefaultSequence", var_5_20)

	local function var_5_21()
		var_5_18:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
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

	var_5_14:RegisterAnimationSequence("Flash", var_5_23)

	local function var_5_24()
		var_5_14:AnimateLoop("Flash")
	end

	var_5_0._sequences.Flash = var_5_24

	local var_5_25
	local var_5_26 = {
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

	var_5_18:RegisterAnimationSequence("Wave", var_5_26)

	local function var_5_27()
		var_5_18:AnimateLoop("Wave")
	end

	var_5_0._sequences.Wave = var_5_27

	local var_5_28
	local var_5_29 = {
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

	var_5_18:RegisterAnimationSequence("Rotate", var_5_29)

	local function var_5_30()
		var_5_18:AnimateLoop("Rotate")
	end

	var_5_0._sequences.Rotate = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Flicker", var_5_32)

	local var_5_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Flicker", var_5_33)

	local var_5_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Flicker", var_5_34)

	local var_5_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Flicker", var_5_35)

	local var_5_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Flicker", var_5_36)

	local function var_5_37()
		var_5_4:AnimateLoop("Flicker")
		var_5_6:AnimateLoop("Flicker")
		var_5_8:AnimateLoop("Flicker")
		var_5_10:AnimateLoop("Flicker")
		var_5_12:AnimateLoop("Flicker")
	end

	var_5_0._sequences.Flicker = var_5_37

	var_0_1(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")
	ACTIONS.AnimateSequence(var_5_0, "Flash")
	ACTIONS.AnimateSequence(var_5_0, "Wave")

	return var_5_0
end

MenuBuilder.registerType("WatchHolo", WatchHolo)
LockTable(_M)
