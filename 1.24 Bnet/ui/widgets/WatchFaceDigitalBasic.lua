module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		arg_1_0._alternateFormat = true
	end

	local var_1_0 = {
		arg_1_0.Digit1,
		arg_1_0.Digit2,
		arg_1_0.Digit3,
		arg_1_0.Digit4
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("basic")
	end

	local var_1_1

	local function var_1_2()
		local var_2_0 = Engine.BADEEDFGHB(Engine.DCJHCAFIIA())
		local var_2_1 = {}
		local var_2_2 = {}
		local var_2_3 = false
		local var_2_4 = 0

		for iter_2_0 = 1, #var_2_0 do
			local var_2_5 = string.sub(tostring(var_2_0), iter_2_0, iter_2_0)

			if arg_1_0._alternateFormat then
				if tonumber(var_2_5) then
					if var_2_3 and var_2_4 == 2 then
						var_2_2[#var_2_2 + 1] = var_2_5
					elseif var_2_4 == 1 then
						var_2_1[#var_2_1 + 1] = var_2_5
					end
				else
					var_2_3 = true
					var_2_4 = var_2_4 + 1
				end
			elseif tonumber(var_2_5) then
				if var_2_3 then
					var_2_2[#var_2_2 + 1] = var_2_5
				else
					var_2_1[#var_2_1 + 1] = var_2_5
				end
			elseif var_2_3 then
				break
			else
				var_2_3 = true
			end
		end

		local function var_2_6(arg_3_0)
			local var_3_0 = ""

			for iter_3_0 = 1, #arg_3_0 do
				var_3_0 = var_3_0 .. arg_3_0[iter_3_0]
			end

			return var_3_0
		end

		arg_1_0.Date:setText(Engine.CBBHFCGDIC("WATCHES/MONTH_DAY", var_2_6(var_2_1), var_2_6(var_2_2)))

		local var_2_7 = Engine.CHCIHAAECA(Engine.DCJHCAFIIA())

		arg_1_0.Day:setText(ToUpperCase(var_2_7))

		local var_2_8 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_2_9 = {}
		local var_2_10 = {}
		local var_2_11 = false

		for iter_2_1 = 1, #var_2_8 do
			local var_2_12 = string.sub(tostring(var_2_8), iter_2_1, iter_2_1)

			if tonumber(var_2_12) then
				if var_2_11 then
					var_2_10[#var_2_10 + 1] = var_2_12
				else
					var_2_9[#var_2_9 + 1] = var_2_12
				end
			else
				var_2_11 = true
			end
		end

		if #var_2_9 < 2 then
			var_2_9[2] = var_2_9[1]
			var_2_9[1] = "0"
		end

		local var_2_13 = tonumber(var_2_9[1] .. var_2_9[2]) < 12 or tonumber(var_2_9[1] .. var_2_9[2]) == 24

		arg_1_0.AM:SetAlpha(var_2_13 and 0.9 or 0)
		arg_1_0.PM:SetAlpha(not var_2_13 and 0.9 or 0)

		local var_2_14 = tonumber(var_2_9[1] .. var_2_9[2])
		local var_2_15 = tonumber(var_2_9[1] .. var_2_9[2]) - (var_2_14 > 12 and 12 or 0)
		local var_2_16 = tostring(var_2_15)
		local var_2_17 = {}

		for iter_2_2 = 1, #var_2_16 do
			local var_2_18 = string.sub(tostring(var_2_16), iter_2_2, iter_2_2)

			if tonumber(var_2_18) then
				var_2_17[#var_2_17 + 1] = var_2_18
			end
		end

		if var_2_15 < 10 then
			var_2_17[2] = var_2_17[1]
			var_2_17[1] = "0"
		end

		var_1_0[1]:SetDigit(var_2_17[1], 1)
		var_1_0[2]:SetDigit(var_2_17[2], 2)
		var_1_0[3]:SetDigit(var_2_10[1], 3)
		var_1_0[4]:SetDigit(var_2_10[2], 4)

		arg_1_0:Wait(var_0_0).onComplete = var_1_2
	end

	var_1_2()
end

function WatchFaceDigitalBasic(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_4_0.id = "WatchFaceDigitalBasic"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(10067089, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Frame"

	var_4_6:setImage(RegisterMaterial("watch_digital_frame"), 0)
	var_4_0:addElement(var_4_6)

	var_4_0.Frame = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Digit1"

	var_4_8:SetRGBFromInt(0, 0)
	var_4_8:SetAlpha(0.9, 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -222, _1080p * -102, _1080p * -38, _1080p * 82)
	var_4_0:addElement(var_4_8)

	var_4_0.Digit1 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Digit2"

	var_4_10:SetRGBFromInt(0, 0)
	var_4_10:SetAlpha(0.9, 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -145, _1080p * -25, _1080p * -38, _1080p * 82)
	var_4_0:addElement(var_4_10)

	var_4_0.Digit2 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Digit3"

	var_4_12:SetRGBFromInt(0, 0)
	var_4_12:SetAlpha(0.9, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 83, _1080p * -38, _1080p * 82)
	var_4_0:addElement(var_4_12)

	var_4_0.Digit3 = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "Digit4"

	var_4_14:SetRGBFromInt(0, 0)
	var_4_14:SetAlpha(0.9, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 39, _1080p * 159, _1080p * -38, _1080p * 82)
	var_4_0:addElement(var_4_14)

	var_4_0.Digit4 = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Colon"

	var_4_16:SetRGBFromInt(0, 0)
	var_4_16:SetAlpha(0.9, 0)
	var_4_16:SetZRotation(-2, 0)
	var_4_16:setImage(RegisterMaterial("watch_basic_digit_colon"), 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 211, _1080p * 236, _1080p * 218, _1080p * 338)
	var_4_0:addElement(var_4_16)

	var_4_0.Colon = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIStyledText.new()

	var_4_18.id = "Day"

	var_4_18:SetRGBFromInt(0, 0)
	var_4_18:SetAlpha(0.9, 0)
	var_4_18:setText("Sun", 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_18:SetAlignment(LUI.Alignment.Right)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 205, _1080p * 150, _1080p * 210)
	var_4_0:addElement(var_4_18)

	var_4_0.Day = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIStyledText.new()

	var_4_20.id = "Date"

	var_4_20:SetRGBFromInt(0, 0)
	var_4_20:SetAlpha(0.9, 0)
	var_4_20:setText("10-22", 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_20:SetAlignment(LUI.Alignment.Right)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 230, _1080p * 386, _1080p * 150, _1080p * 210)
	var_4_0:addElement(var_4_20)

	var_4_0.Date = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIStyledText.new()

	var_4_22.id = "AM"

	var_4_22:SetRGBFromInt(0, 0)
	var_4_22:SetAlpha(0.9, 0)
	var_4_22:setText(Engine.CBBHFCGDIC("WATCHES/TIME_AM"), 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_22:SetAlignment(LUI.Alignment.Left)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 399, _1080p * 478, _1080p * 218, _1080p * 268)
	var_4_0:addElement(var_4_22)

	var_4_0.AM = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIStyledText.new()

	var_4_24.id = "PM"

	var_4_24:SetRGBFromInt(0, 0)
	var_4_24:SetAlpha(0, 0)
	var_4_24:setText(Engine.CBBHFCGDIC("WATCHES/TIME_PM"), 0)
	var_4_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_24:SetAlignment(LUI.Alignment.Left)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 399, _1080p * 478, _1080p * 278, _1080p * 328)
	var_4_0:addElement(var_4_24)

	var_4_0.PM = var_4_24

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WatchFaceDigitalBasic", WatchFaceDigitalBasic)
LockTable(_M)
