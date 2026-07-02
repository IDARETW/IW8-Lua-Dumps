module(..., package.seeall)

local var_0_0 = 10000

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
	local var_1_1 = {
		arg_1_0.CDigit1,
		arg_1_0.CDigit2,
		arg_1_0.CDigit3,
		arg_1_0.CDigit4,
		arg_1_0.CDigit5,
		arg_1_0.CDigit6,
		arg_1_0.CDigit7
	}

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:Setup("digital")
	end

	for iter_1_1 = 1, #var_1_1 do
		var_1_1[iter_1_1]:Setup("digital")
	end

	local function var_1_2()
		local var_2_0 = {}
		local var_2_1 = math.random(0, 999999)
		local var_2_2 = math.random(0, 9999)
		local var_2_3 = math.random(0, 99)
		local var_2_4 = {
			var_2_3,
			var_2_3,
			var_2_3,
			var_2_3,
			var_2_2,
			var_2_2,
			var_2_2,
			var_2_2,
			var_2_1,
			var_2_1,
			var_2_1,
			var_2_1,
			8008,
			80085,
			43110,
			7053,
			8008135,
			833,
			8335,
			836,
			8377,
			83773,
			83775,
			816,
			8173,
			8177,
			87355,
			87155,
			8708,
			808,
			806673,
			8017,
			800613,
			800235,
			8055,
			336,
			3365,
			337,
			3753,
			63353,
			637,
			6160705,
			6733,
			616673,
			6177,
			61775,
			67083,
			67055,
			608873,
			606673,
			60053,
			6054,
			43375,
			4377,
			4377154,
			41775,
			4164,
			4088135,
			408873,
			40805,
			403,
			4035,
			4065,
			4073,
			4053,
			167005,
			177,
			15735,
			7365,
			7355,
			7361873,
			713,
			7135,
			7088135,
			70053,
			7055,
			533,
			53123,
			5377,
			543775,
			5403,
			54035,
			5164,
			5155135,
			5123,
			512273,
			573164,
			5708,
			57054,
			5017,
			505,
			2005,
			203
		}
		local var_2_5 = math.random(1, #var_2_4)
		local var_2_6 = tostring(var_2_4[var_2_5])

		for iter_2_0 = 1, #var_2_6 do
			local var_2_7 = string.sub(var_2_6, iter_2_0, iter_2_0)

			if tonumber(var_2_7) then
				var_2_0[#var_2_0 + 1] = var_2_7
			end

			if var_2_6 == "43110" then
				ACTIONS.AnimateSequence(arg_1_0, "HelloAnim")
			else
				ACTIONS.AnimateSequence(arg_1_0, "NormalDec")
			end
		end

		var_1_1[1]:SetCalculatorDigit(var_2_0[1], 7)
		var_1_1[2]:SetCalculatorDigit(var_2_0[2], 6)
		var_1_1[3]:SetCalculatorDigit(var_2_0[3], 5)
		var_1_1[4]:SetCalculatorDigit(var_2_0[4], 4)
		var_1_1[5]:SetCalculatorDigit(var_2_0[5], 3)
		var_1_1[6]:SetCalculatorDigit(var_2_0[6], 2)
		var_1_1[7]:SetCalculatorDigit(var_2_0[7], 1)

		if var_2_5 ~= 1 and var_2_5 ~= 2 and var_2_5 ~= 3 then
			ACTIONS.AnimateSequence(arg_1_0, "LongAnim")
		end
	end

	if Engine.DDJFBBJAIG() then
		local var_1_3

		local function var_1_4()
			var_1_2()

			arg_1_0:Wait(8000).onComplete = var_1_4
		end

		var_1_4()
	else
		local var_1_5 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_5:GetModel(arg_1_1), function(arg_4_0)
			if DataModel.JJEHAEBDF(arg_4_0) ~= nil then
				var_1_2()
			end
		end)
	end

	local var_1_6

	local function var_1_7()
		local var_5_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_5_1 = {}
		local var_5_2 = {}
		local var_5_3 = false

		for iter_5_0 = 1, #var_5_0 do
			local var_5_4 = string.sub(tostring(var_5_0), iter_5_0, iter_5_0)

			if tonumber(var_5_4) then
				if var_5_3 then
					var_5_2[#var_5_2 + 1] = var_5_4
				else
					var_5_1[#var_5_1 + 1] = var_5_4
				end
			else
				var_5_3 = true
			end
		end

		if #var_5_1 < 2 then
			var_5_1[2] = var_5_1[1]
			var_5_1[1] = "0"
		end

		if tonumber(var_5_1[1] .. var_5_1[2]) < 12 or tonumber(var_5_1[1] .. var_5_1[2]) == 24 then
			arg_1_0.AMPM:setText(Engine.CBBHFCGDIC("WATCHES/TIME_AM"), 0)
		else
			arg_1_0.AMPM:setText(Engine.CBBHFCGDIC("WATCHES/TIME_PM"), 0)
		end

		local var_5_5 = tonumber(var_5_1[1] .. var_5_1[2])
		local var_5_6 = tonumber(var_5_1[1] .. var_5_1[2]) - (var_5_5 > 12 and 12 or 0)
		local var_5_7 = tostring(var_5_6)
		local var_5_8 = {}

		for iter_5_1 = 1, #var_5_7 do
			local var_5_9 = string.sub(tostring(var_5_7), iter_5_1, iter_5_1)

			if tonumber(var_5_9) then
				var_5_8[#var_5_8 + 1] = var_5_9
			end
		end

		if var_5_6 < 10 then
			var_5_8[2] = var_5_8[1]
			var_5_8[1] = "0"
		end

		var_1_0[1]:SetDigit(var_5_8[1], 1)
		var_1_0[2]:SetDigit(var_5_8[2], 2)
		var_1_0[3]:SetDigit(var_5_2[1], 3)
		var_1_0[4]:SetDigit(var_5_2[2], 4)

		arg_1_0:Wait(var_0_0).onComplete = var_1_7
	end

	var_1_7()
end

function WatchCalculator(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_6_0.id = "WatchCalculator"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Background"

	var_6_4:SetRGBFromInt(10067089, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Digit1"

	var_6_6:SetRGBFromInt(0, 0)
	var_6_6:SetAlpha(0.9, 0)
	var_6_6:SetScale(-0.2, 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -221, _1080p * -165, _1080p * -87, _1080p * -31)
	var_6_0:addElement(var_6_6)

	var_6_0.Digit1 = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Digit2"

	var_6_8:SetRGBFromInt(0, 0)
	var_6_8:SetAlpha(0.9, 0)
	var_6_8:SetScale(-0.2, 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -191, _1080p * -135, _1080p * -87, _1080p * -31)
	var_6_0:addElement(var_6_8)

	var_6_0.Digit2 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Digit3"

	var_6_10:SetRGBFromInt(0, 0)
	var_6_10:SetAlpha(0.9, 0)
	var_6_10:SetScale(-0.2, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -147, _1080p * -91, _1080p * -87, _1080p * -31)
	var_6_0:addElement(var_6_10)

	var_6_0.Digit3 = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Digit4"

	var_6_12:SetRGBFromInt(0, 0)
	var_6_12:SetAlpha(0.9, 0)
	var_6_12:SetScale(-0.2, 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -116, _1080p * -60, _1080p * -87, _1080p * -31)
	var_6_0:addElement(var_6_12)

	var_6_0.Digit4 = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "Colon"

	var_6_14:SetRGBFromInt(0, 0)
	var_6_14:SetAlpha(0.9, 0)
	var_6_14:SetZRotation(-2, 0)
	var_6_14:SetScale(-0.2, 0)
	var_6_14:setImage(RegisterMaterial("watch_basic_digit_colon"), 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107, _1080p * 125, _1080p * 158, _1080p * 236)
	var_6_0:addElement(var_6_14)

	var_6_0.Colon = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "AMPM"

	var_6_16:SetRGBFromInt(0, 0)
	var_6_16:SetAlpha(0.9, 0)
	var_6_16:setText(Engine.CBBHFCGDIC("WATCHES/TIME_AM"), 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_16:SetAlignment(LUI.Alignment.Left)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 188, _1080p * 230, _1080p * 194, _1080p * 221)
	var_6_0:addElement(var_6_16)

	var_6_0.AMPM = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "Decimal"

	var_6_18:SetRGBFromInt(0, 0)
	var_6_18:SetAlpha(0.9, 0)
	var_6_18:SetZRotation(-2, 0)
	var_6_18:SetScale(-0.2, 0)
	var_6_18:setImage(RegisterMaterial("watch_basic_digit_colon"), 0)
	var_6_18:SetVMin(0.57, 0)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 211, _1080p * 258, _1080p * 276)
	var_6_0:addElement(var_6_18)

	var_6_0.Decimal = var_6_18

	local var_6_19
	local var_6_20 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_20.id = "CDigit1"

	var_6_20:SetRGBFromInt(0, 0)
	var_6_20:SetAlpha(0.9, 0)
	var_6_20:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 173, _1080p * -305, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_20)

	var_6_0.CDigit1 = var_6_20

	local var_6_21
	local var_6_22 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_22.id = "CDigit2"

	var_6_22:SetRGBFromInt(0, 0)
	var_6_22:SetAlpha(0.9, 0)
	var_6_22:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 151, _1080p * -329, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_22)

	var_6_0.CDigit2 = var_6_22

	local var_6_23
	local var_6_24 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_24.id = "CDigit3"

	var_6_24:SetRGBFromInt(0, 0)
	var_6_24:SetAlpha(0.9, 0)
	var_6_24:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 127, _1080p * -351, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_24)

	var_6_0.CDigit3 = var_6_24

	local var_6_25
	local var_6_26 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_26.id = "CDigit4"

	var_6_26:SetRGBFromInt(0, 0)
	var_6_26:SetAlpha(0.9, 0)
	var_6_26:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 104, _1080p * -376, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_26)

	var_6_0.CDigit4 = var_6_26

	local var_6_27
	local var_6_28 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_28.id = "CDigit5"

	var_6_28:SetRGBFromInt(0, 0)
	var_6_28:SetAlpha(0.9, 0)
	var_6_28:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 82, _1080p * -398, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_28)

	var_6_0.CDigit5 = var_6_28

	local var_6_29
	local var_6_30 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_30.id = "CDigit6"

	var_6_30:SetRGBFromInt(0, 0)
	var_6_30:SetAlpha(0.9, 0)
	var_6_30:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 57, _1080p * -421, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_30)

	var_6_0.CDigit6 = var_6_30

	local var_6_31
	local var_6_32 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_6_1
	})

	var_6_32.id = "CDigit7"

	var_6_32:SetRGBFromInt(0, 0)
	var_6_32:SetAlpha(0.9, 0)
	var_6_32:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 36, _1080p * -444, _1080p * 235, _1080p * -245)
	var_6_0:addElement(var_6_32)

	var_6_0.CDigit7 = var_6_32

	local function var_6_33()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Time", var_6_35)

	local var_6_36 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Time", var_6_36)

	local var_6_37 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Time", var_6_37)

	local var_6_38 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Time", var_6_38)

	local function var_6_39()
		var_6_6:AnimateSequence("Time")
		var_6_8:AnimateSequence("Time")
		var_6_10:AnimateSequence("Time")
		var_6_12:AnimateSequence("Time")
	end

	var_6_0._sequences.Time = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 0.9,
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
			value = 0.9,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_14:RegisterAnimationSequence("LoopColon", var_6_41)

	local function var_6_42()
		var_6_14:AnimateLoop("LoopColon")
	end

	var_6_0._sequences.LoopColon = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 274
		}
	}

	var_6_18:RegisterAnimationSequence("HelloAnim", var_6_44)

	local function var_6_45()
		var_6_18:AnimateSequence("HelloAnim")
	end

	var_6_0._sequences.HelloAnim = var_6_45

	local var_6_46
	local var_6_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 211
		}
	}

	var_6_18:RegisterAnimationSequence("NormalDec", var_6_47)

	local function var_6_48()
		var_6_18:AnimateSequence("NormalDec")
	end

	var_6_0._sequences.NormalDec = var_6_48

	local var_6_49
	local var_6_50 = {
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.9,
			duration = 2050,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 3330,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.9,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("LongAnim", var_6_50)

	local var_6_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -305
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 56,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -422,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1940,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 3030,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 173,
			easing = LUI.EASING.snap
		},
		{
			duration = 3030,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -305,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_20:RegisterAnimationSequence("LongAnim", var_6_51)

	local var_6_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -329
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 80,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1900,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 151,
			easing = LUI.EASING.snap
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -329,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_22:RegisterAnimationSequence("LongAnim", var_6_52)

	local var_6_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -351
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 102,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -378,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1860,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 127,
			easing = LUI.EASING.snap
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -351,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_24:RegisterAnimationSequence("LongAnim", var_6_53)

	local var_6_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -376
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -356,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1820,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104,
			easing = LUI.EASING.snap
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -376,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_26:RegisterAnimationSequence("LongAnim", var_6_54)

	local var_6_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -398
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 146,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -334,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1780,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 82,
			easing = LUI.EASING.snap
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -398,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_28:RegisterAnimationSequence("LongAnim", var_6_55)

	local var_6_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -421
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 168,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -310,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1740,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 57,
			easing = LUI.EASING.snap
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -421,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_30:RegisterAnimationSequence("LongAnim", var_6_56)

	local var_6_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -444
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -288,
			easing = LUI.EASING.snap
		},
		{
			duration = 2350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 192,
			easing = LUI.EASING.snap
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1700,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0,
			duration = 1700,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36,
			easing = LUI.EASING.snap
		},
		{
			duration = 2970,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -444,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 40,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 180,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 2940,
			property = TWEEN_PROPERTY.Y_Rotation,
			easing = LUI.EASING.snap
		},
		{
			value = 180,
			duration = 2480,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 90,
			duration = 360,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_6_32:RegisterAnimationSequence("LongAnim", var_6_57)

	local function var_6_58()
		var_6_18:AnimateSequence("LongAnim")
		var_6_20:AnimateSequence("LongAnim")
		var_6_22:AnimateSequence("LongAnim")
		var_6_24:AnimateSequence("LongAnim")
		var_6_26:AnimateSequence("LongAnim")
		var_6_28:AnimateSequence("LongAnim")
		var_6_30:AnimateSequence("LongAnim")
		var_6_32:AnimateSequence("LongAnim")
	end

	var_6_0._sequences.LongAnim = var_6_58

	local var_6_59
	local var_6_60 = {
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("ShortAnim", var_6_60)

	local var_6_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 410
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("ShortAnim", var_6_61)

	local var_6_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 352
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_22:RegisterAnimationSequence("ShortAnim", var_6_62)

	local var_6_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 294
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -136
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("ShortAnim", var_6_63)

	local var_6_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("ShortAnim", var_6_64)

	local var_6_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 180
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -250
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_28:RegisterAnimationSequence("ShortAnim", var_6_65)

	local var_6_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 121
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -309
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_30:RegisterAnimationSequence("ShortAnim", var_6_66)

	local var_6_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.X_Rotation
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Y_Rotation
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 64
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -366
		},
		{
			value = 0.9,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_32:RegisterAnimationSequence("ShortAnim", var_6_67)

	local function var_6_68()
		var_6_18:AnimateSequence("ShortAnim")
		var_6_20:AnimateSequence("ShortAnim")
		var_6_22:AnimateSequence("ShortAnim")
		var_6_24:AnimateSequence("ShortAnim")
		var_6_26:AnimateSequence("ShortAnim")
		var_6_28:AnimateSequence("ShortAnim")
		var_6_30:AnimateSequence("ShortAnim")
		var_6_32:AnimateSequence("ShortAnim")
	end

	var_6_0._sequences.ShortAnim = var_6_68

	var_0_1(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "LoopColon")

	return var_6_0
end

MenuBuilder.registerType("WatchCalculator", WatchCalculator)
LockTable(_M)
