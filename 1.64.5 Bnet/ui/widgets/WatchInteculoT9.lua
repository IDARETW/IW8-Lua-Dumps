module(..., package.seeall)

local var_0_0 = 100

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.TimeHourOnes,
		arg_1_0.TimeHourTens,
		arg_1_0.TimeMinutesOnes,
		arg_1_0.TimeMinutesTens,
		arg_1_0.TimeSecondsOnes,
		arg_1_0.TimeSecondsTens,
		arg_1_0.DateMonthOnes,
		arg_1_0.DateMonthTens,
		arg_1_0.DateDayOnes,
		arg_1_0.DateDayTens
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

		local var_2_10 = Engine.BADEEDFGHB(Engine.DCJHCAFIIA())
		local var_2_11 = {}
		local var_2_12 = {}
		local var_2_13 = false
		local var_2_14 = 0

		for iter_2_3 = 1, #var_2_10 do
			local var_2_15 = string.sub(tostring(var_2_10), iter_2_3, iter_2_3)

			if CONDITIONS.IsLanguageAsian() then
				if tonumber(var_2_15) then
					if var_2_13 and var_2_14 == 2 then
						table.insert(var_2_12, var_2_15)
					elseif var_2_14 == 1 then
						table.insert(var_2_11, var_2_15)
					end
				else
					var_2_13 = true
					var_2_14 = var_2_14 + 1
				end
			elseif tonumber(var_2_15) then
				if var_2_13 then
					table.insert(var_2_12, var_2_15)
				else
					table.insert(var_2_11, var_2_15)
				end
			elseif var_2_13 then
				break
			else
				var_2_13 = true
			end
		end

		if #var_2_11 < 2 then
			var_2_11[2] = var_2_11[1]
			var_2_11[1] = "0"
		end

		arg_1_0.DateDayTens:SetCounterDigit(var_2_12[1])
		arg_1_0.DateDayOnes:SetCounterDigit(var_2_12[2])
		arg_1_0.DateMonthTens:SetCounterDigit(var_2_11[1])
		arg_1_0.DateMonthOnes:SetCounterDigit(var_2_11[2])

		arg_1_0:Wait(var_0_0).onComplete = var_1_2
	end

	var_1_2()
end

function WatchInteculoT9(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchInteculoT9"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

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

	var_3_4:SetRGBFromInt(2565399, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 61, _1080p * 129, _1080p * 286, _1080p * 374)
	var_3_0:addElement(var_3_4)

	var_3_0.TimeHourTens = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "TimeHourOnes"

	var_3_6:SetRGBFromInt(2565399, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 129, _1080p * 197, _1080p * 286, _1080p * 374)
	var_3_0:addElement(var_3_6)

	var_3_0.TimeHourOnes = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "TimeMinutesTens"

	var_3_8:SetRGBFromInt(2565399, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 227, _1080p * 295, _1080p * 286, _1080p * 374)
	var_3_0:addElement(var_3_8)

	var_3_0.TimeMinutesTens = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "TimeMinutesOnes"

	var_3_10:SetRGBFromInt(2565399, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 295, _1080p * 363, _1080p * 286, _1080p * 374)
	var_3_0:addElement(var_3_10)

	var_3_0.TimeMinutesOnes = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "TimeSecondsTens"

	var_3_12:SetRGBFromInt(2565399, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 373, _1080p * 411, _1080p * 286, _1080p * 335)
	var_3_0:addElement(var_3_12)

	var_3_0.TimeSecondsTens = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "TimeSecondsOnes"

	var_3_14:SetRGBFromInt(2565399, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 413, _1080p * 451, _1080p * 286, _1080p * 335)
	var_3_0:addElement(var_3_14)

	var_3_0.TimeSecondsOnes = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Line"

	var_3_16:SetRGBFromInt(2565399, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 373, _1080p * 451, _1080p * 352, _1080p * 356)
	var_3_0:addElement(var_3_16)

	var_3_0.Line = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "ModeDigit2"

	var_3_18:SetRGBFromInt(2565399, 0)
	var_3_18:setImage(RegisterMaterial("watch_retro_t9_digit_4"), 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 412, _1080p * 450, _1080p * 128, _1080p * 177)
	var_3_0:addElement(var_3_18)

	var_3_0.ModeDigit2 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "ModeDigit1"

	var_3_20:SetRGBFromInt(2565399, 0)
	var_3_20:setImage(RegisterMaterial("watch_retro_t9_digit_2"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 372, _1080p * 410, _1080p * 128, _1080p * 177)
	var_3_0:addElement(var_3_20)

	var_3_0.ModeDigit1 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "Dot"

	var_3_22:SetRGBFromInt(2565399, 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 346, _1080p * 363, _1080p * 134, _1080p * 150)
	var_3_0:addElement(var_3_22)

	var_3_0.Dot = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "DateMonthTens"

	var_3_24:SetRGBFromInt(2565399, 0)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 61, _1080p * 99, _1080p * 128, _1080p * 177)
	var_3_0:addElement(var_3_24)

	var_3_0.DateMonthTens = var_3_24

	local var_3_25
	local var_3_26 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_26.id = "DateMonthOnes"

	var_3_26:SetRGBFromInt(2565399, 0)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 138, _1080p * 128, _1080p * 177)
	var_3_0:addElement(var_3_26)

	var_3_0.DateMonthOnes = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIImage.new()

	var_3_28.id = "Dot2"

	var_3_28:SetRGBFromInt(2565399, 0)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 143, _1080p * 151, _1080p * 169, _1080p * 177)
	var_3_0:addElement(var_3_28)

	var_3_0.Dot2 = var_3_28

	local var_3_29
	local var_3_30 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_30.id = "DateDayTens"

	var_3_30:SetRGBFromInt(2565399, 0)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 195, _1080p * 128, _1080p * 177)
	var_3_0:addElement(var_3_30)

	var_3_0.DateDayTens = var_3_30

	local var_3_31
	local var_3_32 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_3_1
	})

	var_3_32.id = "DateDayOnes"

	var_3_32:SetRGBFromInt(2565399, 0)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 196, _1080p * 234, _1080p * 128, _1080p * 177)
	var_3_0:addElement(var_3_32)

	var_3_0.DateDayOnes = var_3_32

	local var_3_33
	local var_3_34 = LUI.UIImage.new()

	var_3_34.id = "Colon2"

	var_3_34:SetRGBFromInt(2565399, 0)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 205, _1080p * 219, _1080p * 342, _1080p * 356)
	var_3_0:addElement(var_3_34)

	var_3_0.Colon2 = var_3_34

	local var_3_35
	local var_3_36 = LUI.UIImage.new()

	var_3_36.id = "Colon1"

	var_3_36:SetRGBFromInt(2565399, 0)
	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 205, _1080p * 219, _1080p * 304, _1080p * 318)
	var_3_0:addElement(var_3_36)

	var_3_0.Colon1 = var_3_36

	local var_3_37
	local var_3_38 = LUI.UIText.new()

	var_3_38.id = "Label0"

	var_3_38:SetRGBFromInt(2565399, 0)
	var_3_38:setText(ToUpperCase(Engine.CBBHFCGDIC("WATCHES/INTECULO_MODES")), 0)
	var_3_38:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_3_38:SetWordWrap(false)
	var_3_38:SetAlignment(LUI.Alignment.Right)
	var_3_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 329, _1080p * 451, _1080p * 236, _1080p * 260)
	var_3_0:addElement(var_3_38)

	var_3_0.Label0 = var_3_38

	local var_3_39
	local var_3_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("DefaultSequence", var_3_40)

	local function var_3_41()
		var_3_22:AnimateLoop("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_41

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")
	ACTIONS.AnimateSequence(var_3_0, "Rotate")

	return var_3_0
end

MenuBuilder.registerType("WatchInteculoT9", WatchInteculoT9)
LockTable(_M)
