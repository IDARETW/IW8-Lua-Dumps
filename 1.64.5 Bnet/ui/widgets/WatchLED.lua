module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("digital")
	end

	local var_1_1

	local function var_1_2()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_2_1 = {}
		local var_2_2 = {}
		local var_2_3 = false

		for iter_2_0 = 1, #var_2_0 do
			local var_2_4 = string.sub(tostring(var_2_0), iter_2_0, iter_2_0)

			if tonumber(var_2_4) then
				if var_2_3 then
					var_2_2[#var_2_2 + 1] = var_2_4
				else
					var_2_1[#var_2_1 + 1] = var_2_4
				end
			else
				var_2_3 = true
			end
		end

		if #var_2_1 < 2 then
			var_2_1[2] = var_2_1[1]
			var_2_1[1] = "0"
		end

		var_1_0[1]:SetDigit(var_2_1[1], 1)
		var_1_0[2]:SetDigit(var_2_1[2], 2)
		var_1_0[3]:SetDigit(var_2_2[1], 3)
		var_1_0[4]:SetDigit(var_2_2[2], 4)

		arg_1_0:Wait(var_0_0).onComplete = var_1_2
	end

	var_1_2()
end

function WatchLED(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchLED"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "BG"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.BG = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Digit1"

	var_3_6:SetRGBFromInt(15406336, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -274, _1080p * -110, _1080p * -82, _1080p * 82)
	var_3_0:addElement(var_3_6)

	var_3_0.Digit1 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Digit2"

	var_3_8:SetRGBFromInt(15406336, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -162, _1080p * 2, _1080p * -82, _1080p * 82)
	var_3_0:addElement(var_3_8)

	var_3_0.Digit2 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Digit3"

	var_3_10:SetRGBFromInt(15406336, 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 166, _1080p * -82, _1080p * 82)
	var_3_0:addElement(var_3_10)

	var_3_0.Digit3 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Digit4"

	var_3_12:SetRGBFromInt(15406336, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 110, _1080p * 274, _1080p * -82, _1080p * 82)
	var_3_0:addElement(var_3_12)

	var_3_0.Digit4 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "ColonBacker"

	var_3_14:SetRGBFromInt(15406336, 0)
	var_3_14:SetAlpha(0.05, 0)
	var_3_14:setImage(RegisterMaterial("watch_digital_digit_colon"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 243, _1080p * 283, _1080p * 174, _1080p * 338)
	var_3_0:addElement(var_3_14)

	var_3_0.ColonBacker = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Colon"

	var_3_16:SetRGBFromInt(15406336, 0)
	var_3_16:setImage(RegisterMaterial("watch_digital_digit_colon"), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 243, _1080p * 283, _1080p * 174, _1080p * 338)
	var_3_0:addElement(var_3_16)

	var_3_0.Colon = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "Tab2"

	var_3_18:SetRGBFromInt(15406336, 0)
	var_3_18:SetAlpha(0.05, 0)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -84, _1080p * -15, _1080p * 121, _1080p * 142)
	var_3_0:addElement(var_3_18)

	var_3_0.Tab2 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "Tab1"

	var_3_20:SetRGBFromInt(15406336, 0)
	var_3_20:SetAlpha(0.05, 0)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -183, _1080p * -114, _1080p * 121, _1080p * 142)
	var_3_0:addElement(var_3_20)

	var_3_0.Tab1 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "Tab3"

	var_3_22:SetRGBFromInt(15406336, 0)
	var_3_22:SetAlpha(0.05, 0)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 15, _1080p * 84, _1080p * 121, _1080p * 142)
	var_3_0:addElement(var_3_22)

	var_3_0.Tab3 = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIImage.new()

	var_3_24.id = "Tab4"

	var_3_24:SetRGBFromInt(15406336, 0)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 114, _1080p * 183, _1080p * 121, _1080p * 142)
	var_3_0:addElement(var_3_24)

	var_3_0.Tab4 = var_3_24

	local function var_3_25()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_25

	local var_3_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_3_16:RegisterAnimationSequence("Blink", var_3_26)

	local function var_3_27()
		var_3_16:AnimateLoop("Blink")
	end

	var_3_0._sequences.Blink = var_3_27

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "Blink")

	return var_3_0
end

MenuBuilder.registerType("WatchLED", WatchLED)
LockTable(_M)
