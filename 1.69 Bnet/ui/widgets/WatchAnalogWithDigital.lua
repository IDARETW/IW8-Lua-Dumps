module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if not Engine.DDJFBBJAIG() then
		arg_1_0:SubscribeToModel(DataSources.inGame.HUD.compassRotation:GetModel(arg_1_1), function(arg_2_0)
			local var_2_0 = math.abs(math.floor(DataModel.JJEHAEBDF(arg_2_0)) - 360)
			local var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH")
			local var_2_2 = var_2_0 % 360

			if var_2_2 < 0 then
				var_2_2 = var_2_2 + 360
			end

			if var_2_2 >= 0 and var_2_2 <= 10 or var_2_2 >= 350 and var_2_2 <= 360 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH")
			elseif var_2_2 >= 11 and var_2_2 <= 79 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH_EAST")
			elseif var_2_2 >= 80 and var_2_2 <= 100 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/EAST")
			elseif var_2_2 >= 101 and var_2_2 <= 169 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/SOUTH_EAST")
			elseif var_2_2 >= 170 and var_2_2 <= 190 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/SOUTH")
			elseif var_2_2 >= 191 and var_2_2 <= 259 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/SOUTH_WEST")
			elseif var_2_2 >= 260 and var_2_2 <= 280 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/WEST")
			elseif var_2_2 >= 281 and var_2_2 <= 359 then
				var_2_1 = Engine.CBBHFCGDIC("HUD/NORTH_WEST")
			end

			arg_1_0.CardinalDirection:setText(var_2_1)
			arg_1_0.Degrees:setText(var_2_2)
		end)
	else
		arg_1_0.CardinalDirection:setText(Engine.CBBHFCGDIC("HUD/NORTH"))
		arg_1_0.Degrees:setText(0)
	end

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
		local var_3_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_3_1 = {}
		local var_3_2 = {}
		local var_3_3 = false

		for iter_3_0 = 1, #var_3_0 do
			local var_3_4 = string.sub(tostring(var_3_0), iter_3_0, iter_3_0)

			if tonumber(var_3_4) then
				if var_3_3 then
					var_3_2[#var_3_2 + 1] = var_3_4
				else
					var_3_1[#var_3_1 + 1] = var_3_4
				end
			else
				var_3_3 = true
			end
		end

		if #var_3_1 < 2 then
			var_3_1[2] = var_3_1[1]
			var_3_1[1] = "0"
		end

		local var_3_5 = tonumber(var_3_1[1] .. var_3_1[2]) < 12 or tonumber(var_3_1[1] .. var_3_1[2]) == 24

		arg_1_0.AM:SetAlpha(var_3_5 and 0.9 or 0)
		arg_1_0.PM:SetAlpha(not var_3_5 and 0.9 or 0)

		local var_3_6 = tonumber(var_3_1[1] .. var_3_1[2])
		local var_3_7 = tonumber(var_3_1[1] .. var_3_1[2]) - (var_3_6 > 12 and 12 or 0)
		local var_3_8 = tostring(var_3_7)
		local var_3_9 = {}

		for iter_3_1 = 1, #var_3_8 do
			local var_3_10 = string.sub(tostring(var_3_8), iter_3_1, iter_3_1)

			if tonumber(var_3_10) then
				var_3_9[#var_3_9 + 1] = var_3_10
			end
		end

		if var_3_7 < 10 then
			var_3_9[2] = var_3_9[1]
			var_3_9[1] = "0"
		end

		var_1_0[1]:SetDigit(var_3_9[1], 1)
		var_1_0[2]:SetDigit(var_3_9[2], 2)
		var_1_0[3]:SetDigit(var_3_2[1], 3)
		var_1_0[4]:SetDigit(var_3_2[2], 4)

		arg_1_0:Wait(var_0_0).onComplete = var_1_2
	end

	var_1_2()
end

function WatchAnalogWithDigital(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_4_0.id = "WatchAnalogWithDigital"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Digit1"

	var_4_6:SetRGBFromInt(13754073, 0)
	var_4_6:SetAlpha(0.9, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -222, _1080p * -122, _1080p * 135, _1080p * 235)
	var_4_0:addElement(var_4_6)

	var_4_0.Digit1 = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Digit2"

	var_4_8:SetRGBFromInt(13754073, 0)
	var_4_8:SetAlpha(0.9, 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -143, _1080p * -43, _1080p * 135, _1080p * 235)
	var_4_0:addElement(var_4_8)

	var_4_0.Digit2 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Digit3"

	var_4_10:SetRGBFromInt(13754073, 0)
	var_4_10:SetAlpha(0.9, 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 62, _1080p * 135, _1080p * 235)
	var_4_0:addElement(var_4_10)

	var_4_0.Digit3 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Digit4"

	var_4_12:SetRGBFromInt(13754073, 0)
	var_4_12:SetAlpha(0.9, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 49, _1080p * 149, _1080p * 135, _1080p * 235)
	var_4_0:addElement(var_4_12)

	var_4_0.Digit4 = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "Colon"

	var_4_14:SetRGBFromInt(13754073, 0)
	var_4_14:SetAlpha(0.9, 0)
	var_4_14:SetZRotation(-2, 0)
	var_4_14:setImage(RegisterMaterial("watch_basic_digit_colon"), 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 202, _1080p * 222, _1080p * 391, _1080p * 491)
	var_4_0:addElement(var_4_14)

	var_4_0.Colon = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIStyledText.new()

	var_4_16.id = "CardinalDirection"

	var_4_16:SetRGBFromInt(13754073, 0)
	var_4_16:SetAlpha(0.9, 0)
	var_4_16:SetScale(-0.3, 0)
	var_4_16:setText(Engine.CBBHFCGDIC("HUD/NORTH"), 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 207, _1080p * 95, _1080p * 223)
	var_4_0:addElement(var_4_16)

	var_4_0.CardinalDirection = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIStyledText.new()

	var_4_18.id = "Degrees"

	var_4_18:SetRGBFromInt(13754073, 0)
	var_4_18:SetAlpha(0.9, 0)
	var_4_18:SetScale(-0.3, 0)
	var_4_18:setText("0", 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_18:SetAlignment(LUI.Alignment.Center)
	var_4_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 389, _1080p * 95, _1080p * 223)
	var_4_0:addElement(var_4_18)

	var_4_0.Degrees = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIStyledText.new()

	var_4_20.id = "AM"

	var_4_20:SetRGBFromInt(13754073, 0)
	var_4_20:SetAlpha(0.9, 0)
	var_4_20:setText(Engine.CBBHFCGDIC("WATCHES/TIME_AM"), 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_20:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 401, _1080p * 481, _1080p * 393, _1080p * 443)
	var_4_0:addElement(var_4_20)

	var_4_0.AM = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIStyledText.new()

	var_4_22.id = "PM"

	var_4_22:SetRGBFromInt(13754073, 0)
	var_4_22:SetAlpha(0, 0)
	var_4_22:setText(Engine.CBBHFCGDIC("WATCHES/TIME_PM"), 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_22:SetAlignment(LUI.Alignment.Left)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 401, _1080p * 481, _1080p * 438, _1080p * 488)
	var_4_0:addElement(var_4_22)

	var_4_0.PM = var_4_22

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WatchAnalogWithDigital", WatchAnalogWithDigital)
LockTable(_M)
