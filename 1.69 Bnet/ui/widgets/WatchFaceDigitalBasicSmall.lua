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

	local var_1_1 = 1
	local var_1_2 = 1
	local var_1_3 = {
		"BigDate",
		"BigTime"
	}

	ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_1])

	if Engine.DDJFBBJAIG() then
		local var_1_4

		local function var_1_5()
			arg_1_0:Wait(6000).onComplete = function()
				local var_3_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

				if var_1_1 >= #var_1_3 or var_1_1 <= 0 then
					var_1_2 = 1
				else
					var_1_2 = var_1_1 + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_2])

				var_1_1 = var_1_2

				var_1_5()
			end
		end

		var_1_5()
	else
		local var_1_6 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), function(arg_4_0)
			if DataModel.JJEHAEBDF(arg_4_0) ~= nil then
				if var_1_1 == #var_1_3 then
					var_1_2 = 1
				else
					var_1_2 = var_1_1 + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_2])

				var_1_1 = var_1_2
			end
		end)
	end

	local var_1_7

	local function var_1_8()
		local var_5_0 = Engine.BADEEDFGHB(Engine.DCJHCAFIIA())
		local var_5_1 = {}
		local var_5_2 = {}
		local var_5_3 = false
		local var_5_4 = 0

		for iter_5_0 = 1, #var_5_0 do
			local var_5_5 = string.sub(tostring(var_5_0), iter_5_0, iter_5_0)

			if arg_1_0._alternateFormat then
				if tonumber(var_5_5) then
					if var_5_3 and var_5_4 == 2 then
						var_5_2[#var_5_2 + 1] = var_5_5
					elseif var_5_4 == 1 then
						var_5_1[#var_5_1 + 1] = var_5_5
					end
				else
					var_5_3 = true
					var_5_4 = var_5_4 + 1
				end
			elseif tonumber(var_5_5) then
				if var_5_3 then
					var_5_2[#var_5_2 + 1] = var_5_5
				else
					var_5_1[#var_5_1 + 1] = var_5_5
				end
			elseif var_5_3 then
				break
			else
				var_5_3 = true
			end
		end

		local function var_5_6(arg_6_0)
			local var_6_0 = ""

			for iter_6_0 = 1, #arg_6_0 do
				var_6_0 = var_6_0 .. arg_6_0[iter_6_0]
			end

			return var_6_0
		end

		arg_1_0.Date:setText(Engine.CBBHFCGDIC("WATCHES/MONTH_DAY", var_5_6(var_5_1), var_5_6(var_5_2)))

		local var_5_7 = Engine.CHCIHAAECA(Engine.DCJHCAFIIA())

		arg_1_0.Day:setText(ToUpperCase(var_5_7))

		local var_5_8 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_5_9 = {}
		local var_5_10 = {}
		local var_5_11 = false

		for iter_5_1 = 1, #var_5_8 do
			local var_5_12 = string.sub(tostring(var_5_8), iter_5_1, iter_5_1)

			if tonumber(var_5_12) then
				if var_5_11 then
					var_5_10[#var_5_10 + 1] = var_5_12
				else
					var_5_9[#var_5_9 + 1] = var_5_12
				end
			else
				var_5_11 = true
			end
		end

		if #var_5_9 < 2 then
			var_5_9[2] = var_5_9[1]
			var_5_9[1] = "0"
		end

		local var_5_13 = tonumber(var_5_9[1] .. var_5_9[2]) < 12 or tonumber(var_5_9[1] .. var_5_9[2]) == 24

		arg_1_0.AM:SetAlpha(var_5_13 and 0.9 or 0)
		arg_1_0.PM:SetAlpha(not var_5_13 and 0.9 or 0)

		local var_5_14 = tonumber(var_5_9[1] .. var_5_9[2])
		local var_5_15 = tonumber(var_5_9[1] .. var_5_9[2]) - (var_5_14 > 12 and 12 or 0)
		local var_5_16 = tostring(var_5_15)
		local var_5_17 = {}

		for iter_5_2 = 1, #var_5_16 do
			local var_5_18 = string.sub(tostring(var_5_16), iter_5_2, iter_5_2)

			if tonumber(var_5_18) then
				var_5_17[#var_5_17 + 1] = var_5_18
			end
		end

		if var_5_15 < 10 then
			var_5_17[2] = var_5_17[1]
			var_5_17[1] = "0"
		end

		var_1_0[1]:SetDigit(var_5_17[1], 1)
		var_1_0[2]:SetDigit(var_5_17[2], 2)
		var_1_0[3]:SetDigit(var_5_10[1], 3)
		var_1_0[4]:SetDigit(var_5_10[2], 4)

		arg_1_0:Wait(var_0_0).onComplete = var_1_8
	end

	var_1_8()
end

function WatchFaceDigitalBasicSmall(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_7_0.id = "WatchFaceDigitalBasicSmall"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromInt(1902336, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "Digit1"

	var_7_6:SetRGBFromInt(14118144, 0)
	var_7_6:SetAlpha(0.9, 0)
	var_7_6:SetScale(-0.7, 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 128, _1080p * 6, _1080p * 126)
	var_7_0:addElement(var_7_6)

	var_7_0.Digit1 = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "Digit2"

	var_7_8:SetRGBFromInt(14118144, 0)
	var_7_8:SetAlpha(0.9, 0)
	var_7_8:SetScale(-0.7, 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 32, _1080p * 152, _1080p * 6, _1080p * 126)
	var_7_0:addElement(var_7_8)

	var_7_0.Digit2 = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "Digit3"

	var_7_10:SetRGBFromInt(14118144, 0)
	var_7_10:SetAlpha(0.9, 0)
	var_7_10:SetScale(-0.7, 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 66, _1080p * 186, _1080p * 6, _1080p * 126)
	var_7_0:addElement(var_7_10)

	var_7_0.Digit3 = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("WatchDigit", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "Digit4"

	var_7_12:SetRGBFromInt(14118144, 0)
	var_7_12:SetAlpha(0.9, 0)
	var_7_12:SetScale(-0.7, 0)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 92, _1080p * 212, _1080p * 6, _1080p * 126)
	var_7_0:addElement(var_7_12)

	var_7_0.Digit4 = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "Colon"

	var_7_14:SetRGBFromInt(14118144, 0)
	var_7_14:SetAlpha(0.9, 0)
	var_7_14:SetZRotation(-2, 0)
	var_7_14:SetScale(-0.7, 0)
	var_7_14:setImage(RegisterMaterial("watch_basic_digit_colon"), 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 354, _1080p * 378, _1080p * 262, _1080p * 382)
	var_7_0:addElement(var_7_14)

	var_7_0.Colon = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIStyledText.new()

	var_7_16.id = "Day"

	var_7_16:SetRGBFromInt(14118144, 0)
	var_7_16:SetAlpha(0.9, 0)
	var_7_16:SetScale(0.5, 0)
	var_7_16:setText("Sun", 0)
	var_7_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_16:SetAlignment(LUI.Alignment.Right)
	var_7_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 47, _1080p * 185, _1080p * 403, _1080p * 463)
	var_7_0:addElement(var_7_16)

	var_7_0.Day = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIStyledText.new()

	var_7_18.id = "Date"

	var_7_18:SetRGBFromInt(14118144, 0)
	var_7_18:SetAlpha(0.9, 0)
	var_7_18:SetScale(0.5, 0)
	var_7_18:setText("10-22", 0)
	var_7_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_18:SetAlignment(LUI.Alignment.Left)
	var_7_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 295, _1080p * 451, _1080p * 403, _1080p * 463)
	var_7_0:addElement(var_7_18)

	var_7_0.Date = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIStyledText.new()

	var_7_20.id = "AM"

	var_7_20:SetRGBFromInt(14118144, 0)
	var_7_20:SetAlpha(0.9, 0)
	var_7_20:SetScale(-0.7, 0)
	var_7_20:setText(Engine.CBBHFCGDIC("WATCHES/TIME_AM"), 0)
	var_7_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_20:SetAlignment(LUI.Alignment.Left)
	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 400, _1080p * 480, _1080p * 289, _1080p * 339)
	var_7_0:addElement(var_7_20)

	var_7_0.AM = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIStyledText.new()

	var_7_22.id = "PM"

	var_7_22:SetRGBFromInt(14118144, 0)
	var_7_22:SetAlpha(0, 0)
	var_7_22:SetScale(-0.7, 0)
	var_7_22:setText(Engine.CBBHFCGDIC("WATCHES/TIME_PM"), 0)
	var_7_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_22:SetAlignment(LUI.Alignment.Left)
	var_7_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 400, _1080p * 480, _1080p * 308, _1080p * 358)
	var_7_0:addElement(var_7_22)

	var_7_0.PM = var_7_22

	local function var_7_23()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_23

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		}
	}

	var_7_6:RegisterAnimationSequence("BigDate", var_7_24)

	local var_7_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 152
		}
	}

	var_7_8:RegisterAnimationSequence("BigDate", var_7_25)

	local var_7_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 186
		}
	}

	var_7_10:RegisterAnimationSequence("BigDate", var_7_26)

	local var_7_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 212
		}
	}

	var_7_12:RegisterAnimationSequence("BigDate", var_7_27)

	local var_7_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 262
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 382
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 354
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 378
		}
	}

	var_7_14:RegisterAnimationSequence("BigDate", var_7_28)

	local var_7_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 463
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 171
		}
	}

	var_7_16:RegisterAnimationSequence("BigDate", var_7_29)

	local var_7_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 463
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 295
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 451
		}
	}

	var_7_18:RegisterAnimationSequence("BigDate", var_7_30)

	local var_7_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 339
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 480
		}
	}

	var_7_20:RegisterAnimationSequence("BigDate", var_7_31)

	local var_7_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 358
		},
		{
			value = -0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 480
		}
	}

	var_7_22:RegisterAnimationSequence("BigDate", var_7_32)

	local function var_7_33()
		var_7_6:AnimateSequence("BigDate")
		var_7_8:AnimateSequence("BigDate")
		var_7_10:AnimateSequence("BigDate")
		var_7_12:AnimateSequence("BigDate")
		var_7_14:AnimateSequence("BigDate")
		var_7_16:AnimateSequence("BigDate")
		var_7_18:AnimateSequence("BigDate")
		var_7_20:AnimateSequence("BigDate")
		var_7_22:AnimateSequence("BigDate")
	end

	var_7_0._sequences.BigDate = var_7_33

	local var_7_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		}
	}

	var_7_6:RegisterAnimationSequence("BigTime", var_7_34)

	local var_7_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		}
	}

	var_7_8:RegisterAnimationSequence("BigTime", var_7_35)

	local var_7_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		}
	}

	var_7_10:RegisterAnimationSequence("BigTime", var_7_36)

	local var_7_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		}
	}

	var_7_12:RegisterAnimationSequence("BigTime", var_7_37)

	local var_7_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 233
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 491
		}
	}

	var_7_14:RegisterAnimationSequence("BigTime", var_7_38)

	local var_7_39 = {
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 263
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 353
		}
	}

	var_7_16:RegisterAnimationSequence("BigTime", var_7_39)

	local var_7_40 = {
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 368
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 524
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 353
		}
	}

	var_7_18:RegisterAnimationSequence("BigTime", var_7_40)

	local var_7_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 428
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 508
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 424
		}
	}

	var_7_20:RegisterAnimationSequence("BigTime", var_7_41)

	local var_7_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 428
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 431
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 508
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 481
		}
	}

	var_7_22:RegisterAnimationSequence("BigTime", var_7_42)

	local function var_7_43()
		var_7_6:AnimateSequence("BigTime")
		var_7_8:AnimateSequence("BigTime")
		var_7_10:AnimateSequence("BigTime")
		var_7_12:AnimateSequence("BigTime")
		var_7_14:AnimateSequence("BigTime")
		var_7_16:AnimateSequence("BigTime")
		var_7_18:AnimateSequence("BigTime")
		var_7_20:AnimateSequence("BigTime")
		var_7_22:AnimateSequence("BigTime")
	end

	var_7_0._sequences.BigTime = var_7_43

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("WatchFaceDigitalBasicSmall", WatchFaceDigitalBasicSmall)
LockTable(_M)
