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
		var_1_0[iter_1_0]:Setup("vacuum")
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

function WatchVacuum(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchVacuum"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(7728127, 0)
	var_3_4:SetAlpha(0.08, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.6, 0)
	var_3_4:SetPixelGridBlockWidth(1, 0)
	var_3_4:SetPixelGridBlockHeight(1, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_4:setImage(RegisterMaterial("watch_vacuum_bg"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -200, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Digit1"

	var_3_6:SetRGBFromInt(10352382, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -258, _1080p * -130, _1080p * 92, _1080p * 220)
	var_3_0:addElement(var_3_6)

	var_3_0.Digit1 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Digit2"

	var_3_8:SetRGBFromInt(10352382, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -142, _1080p * -14, _1080p * 92, _1080p * 220)
	var_3_0:addElement(var_3_8)

	var_3_0.Digit2 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Digit3"

	var_3_10:SetRGBFromInt(10352382, 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 142, _1080p * 92, _1080p * 220)
	var_3_0:addElement(var_3_10)

	var_3_0.Digit3 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Digit4"

	var_3_12:SetRGBFromInt(10352382, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 130, _1080p * 258, _1080p * 92, _1080p * 220)
	var_3_0:addElement(var_3_12)

	var_3_0.Digit4 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Colon"

	var_3_14:SetRGBFromInt(10352382, 0)
	var_3_14:setImage(RegisterMaterial("watch_vacuum_digit_colon"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 240, _1080p * 272, _1080p * 348, _1080p * 476)
	var_3_0:addElement(var_3_14)

	var_3_0.Colon = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "EdgeBleed"

	var_3_16:SetRGBFromInt(7728127, 0)
	var_3_16:SetAlpha(0.7, 0)
	var_3_16:setImage(RegisterMaterial("watch_vacuum_edge"), 0)
	var_3_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -200, 0)
	var_3_0:addElement(var_3_16)

	var_3_0.EdgeBleed = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchVacuum", WatchVacuum)
LockTable(_M)
