module(..., package.seeall)

local var_0_0 = 4000
local var_0_1 = 12000
local var_0_2 = 2200

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 1
	local var_1_1 = 1
	local var_1_2 = {
		"Screen1",
		"Screen2",
		"Screen3"
	}
	local var_1_3 = math.random(60, 80)
	local var_1_4 = false
	local var_1_5 = 1000

	ACTIONS.AnimateSequence(arg_1_0, var_1_2[var_1_0])

	if Engine.DDJFBBJAIG() then
		local var_1_6

		local function var_1_7()
			var_1_3 = math.random(60, 80)

			arg_1_0.Rate:setText(var_1_3)
			arg_1_0.Steps:setText(math.random(100, 10000))
			arg_1_0.WatchEKG:UpdateEKG(var_1_3 > 75)

			arg_1_0:Wait(5000).onComplete = var_1_7
		end

		var_1_7()

		local var_1_8

		local function var_1_9()
			arg_1_0:Wait(6000).onComplete = function()
				local var_4_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

				if var_1_0 >= #var_1_2 or var_1_0 <= 0 then
					var_1_1 = 1
				else
					var_1_1 = var_1_0 + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_2[var_1_1])

				var_1_0 = var_1_1

				var_1_9()
			end
		end

		var_1_9()
	else
		arg_1_0.Rate:setText(var_1_3)

		local var_1_10 = DataSources.inGame.player.isSprinting
		local var_1_11 = DataSources.inGame.player.health

		local function var_1_12()
			local var_5_0 = var_1_11:GetValue(arg_1_1)
			local var_5_1 = var_1_10:GetValue(arg_1_1)

			if var_5_0 ~= nil then
				if var_5_0 < 75 or var_5_1 then
					arg_1_0:Wait(var_0_0).onComplete = function()
						ACTIONS.AnimateSequence(arg_1_0, "BeatFast")

						var_1_3 = math.random(110, 170)

						arg_1_0.Rate:setText(var_1_3)
						arg_1_0.WatchEKG:UpdateEKG(true)

						var_1_5 = 380
					end
				else
					arg_1_0:Wait(var_0_1).onComplete = function()
						ACTIONS.AnimateSequence(arg_1_0, "BeatNormal")

						var_1_3 = math.random(60, 80)

						arg_1_0.Rate:setText(var_1_3)
						arg_1_0.WatchEKG:UpdateEKG(false)

						var_1_5 = 1000
					end
				end
			end
		end

		arg_1_0:SubscribeToModel(var_1_11:GetModel(arg_1_1), var_1_12)
		arg_1_0:SubscribeToModel(var_1_10:GetModel(arg_1_1), var_1_12)

		local var_1_13 = LUI.DataSourceInControllerModel.new("cg.player.footstepCount")

		arg_1_0:SubscribeToModel(var_1_13:GetModel(arg_1_1), function(arg_8_0)
			local var_8_0 = DataModel.JJEHAEBDF(arg_8_0)

			if var_8_0 ~= nil then
				arg_1_0.Steps:setText(var_8_0)
			end
		end)

		local var_1_14 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_14:GetModel(arg_1_1), function(arg_9_0)
			if DataModel.JJEHAEBDF(arg_9_0) ~= nil then
				if var_1_0 == #var_1_2 then
					var_1_1 = 1
				else
					var_1_1 = var_1_0 + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_2[var_1_1])

				var_1_0 = var_1_1
			end
		end)
	end

	local var_1_15

	local function var_1_16()
		if var_1_4 then
			Engine.BJDBIAGIDA("watch_health_tick")

			arg_1_0:Wait(var_1_5).onComplete = function()
				var_1_16()
			end
		else
			return
		end
	end

	local var_1_17 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_check")

	arg_1_0:SubscribeToModel(var_1_17:GetModel(arg_1_1), function(arg_12_0)
		local var_12_0 = DataModel.JJEHAEBDF(arg_12_0)

		if var_1_0 == 1 then
			var_1_4 = true
			arg_1_0:Wait(var_0_2).onComplete = function()
				var_1_4 = false
			end

			var_1_16()
		end
	end)

	local var_1_18

	;(function()
		local var_14_0 = 50

		if not Engine.DDJFBBJAIG() then
			var_14_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state")
		end

		local var_14_1 = var_14_0 + math.random(-10, 10)
		local var_14_2 = Engine.CBBHFCGDIC("WATCHES/DEGREES_CELSIUS", LUI.Round((var_14_1 - 32) * 5 / 9, 1))

		arg_1_0.Temperature:setText(var_14_2)
	end)()

	local var_1_19

	local function var_1_20()
		local var_15_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(var_0_1).onComplete = var_1_20

		arg_1_0.Time:setText(var_15_0)
	end

	var_1_20()
end

function WatchHeartRate(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_16_0.id = "WatchHeartRate"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "Background"

	var_16_4:SetRGBFromInt(0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.Background = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "Heart"

	var_16_6:setImage(RegisterMaterial("icon_watch_heart"), 0)
	var_16_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -136, _1080p * -24, _1080p * -132, _1080p * -26)
	var_16_0:addElement(var_16_6)

	var_16_0.Heart = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIText.new()

	var_16_8.id = "Steps"

	var_16_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_8:setText("", 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_16_8:SetAlignment(LUI.Alignment.Center)
	var_16_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -248, _1080p * 252, _1080p * -9, _1080p * 111)
	var_16_0:addElement(var_16_8)

	var_16_0.Steps = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIText.new()

	var_16_10.id = "Time"

	var_16_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_10:SetAlpha(0, 0)
	var_16_10:SetScale(-0.1, 0)
	var_16_10:setText("10:30", 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_16_10:SetTracking(-1 * _1080p, 0)
	var_16_10:SetAlignment(LUI.Alignment.Center)
	var_16_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 130, _1080p * 258)
	var_16_0:addElement(var_16_10)

	var_16_0.Time = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIText.new()

	var_16_12.id = "Temperature"

	var_16_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_12:SetAlpha(0, 0)
	var_16_12:setText("28C", 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_16_12:SetAlignment(LUI.Alignment.Center)
	var_16_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * -128)
	var_16_0:addElement(var_16_12)

	var_16_0.Temperature = var_16_12

	local var_16_13
	local var_16_14 = LUI.UIImage.new()

	var_16_14.id = "Shoe"

	var_16_14:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_14:SetAlpha(0, 0)
	var_16_14:setImage(RegisterMaterial("icon_watch_shoeprint"), 0)
	var_16_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -40, _1080p * 40, _1080p * 96, _1080p * 256)
	var_16_0:addElement(var_16_14)

	var_16_0.Shoe = var_16_14

	local var_16_15
	local var_16_16 = LUI.UIImage.new()

	var_16_16.id = "Pips"

	var_16_16:SetAlpha(0.2, 0)
	var_16_16:setImage(RegisterMaterial("hud_matchstatus_round_pips"), 0)
	var_16_16:SetUMax(0.3, 0)
	var_16_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -56, _1080p * 56, _1080p * -67, _1080p * -36)
	var_16_0:addElement(var_16_16)

	var_16_0.Pips = var_16_16

	local var_16_17
	local var_16_18 = LUI.UIStyledText.new()

	var_16_18.id = "Rate"

	var_16_18:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_18:setText("", 0)
	var_16_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_16_18:SetWordWrap(false)
	var_16_18:SetAlignment(LUI.Alignment.Left)
	var_16_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_18:SetStartupDelay(1000)
	var_16_18:SetLineHoldTime(400)
	var_16_18:SetAnimMoveTime(500)
	var_16_18:SetAnimMoveSpeed(50)
	var_16_18:SetEndDelay(1000)
	var_16_18:SetCrossfadeTime(400)
	var_16_18:SetFadeInTime(300)
	var_16_18:SetFadeOutTime(300)
	var_16_18:SetMaxVisibleLines(1)
	var_16_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 270, _1080p * -146, _1080p * -26)
	var_16_0:addElement(var_16_18)

	var_16_0.Rate = var_16_18

	local var_16_19
	local var_16_20 = LUI.UIImage.new()

	var_16_20.id = "Pip"

	var_16_20:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_16_20:setImage(RegisterMaterial("hud_matchstatus_round_pips"), 0)
	var_16_20:SetUMax(0.1, 0)
	var_16_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -56, _1080p * -20, _1080p * -67, _1080p * -36)
	var_16_0:addElement(var_16_20)

	var_16_0.Pip = var_16_20

	local var_16_21
	local var_16_22 = MenuBuilder.BuildRegisteredType("WatchEKG", {
		controllerIndex = var_16_1
	})

	var_16_22.id = "WatchEKG"

	var_16_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 514, _1080p * 222, _1080p * 418)
	var_16_0:addElement(var_16_22)

	var_16_0.WatchEKG = var_16_22

	local function var_16_23()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_23

	local var_16_24 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.32,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutBack
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_16_6:RegisterAnimationSequence("BeatNormal", var_16_24)

	local function var_16_25()
		var_16_6:AnimateLoop("BeatNormal")
	end

	var_16_0._sequences.BeatNormal = var_16_25

	local var_16_26 = {
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.52,
			duration = 160,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutBack
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_16_6:RegisterAnimationSequence("BeatFast", var_16_26)

	local function var_16_27()
		var_16_6:AnimateLoop("BeatFast")
	end

	var_16_0._sequences.BeatFast = var_16_27

	local var_16_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -24,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -136,
			easing = LUI.EASING.outBack
		}
	}

	var_16_6:RegisterAnimationSequence("Screen1", var_16_28)

	local var_16_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -813
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -313
		}
	}

	var_16_8:RegisterAnimationSequence("Screen1", var_16_29)

	local var_16_30 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 437,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 721,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("Screen1", var_16_30)

	local var_16_31 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 323,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 835,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("Screen1", var_16_31)

	local var_16_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -605
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -525
		}
	}

	var_16_14:RegisterAnimationSequence("Screen1", var_16_32)

	local var_16_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 270,
			easing = LUI.EASING.outBack
		}
	}

	var_16_18:RegisterAnimationSequence("Screen1", var_16_33)

	local var_16_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		}
	}

	var_16_20:RegisterAnimationSequence("Screen1", var_16_34)

	local var_16_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_22:RegisterAnimationSequence("Screen1", var_16_35)

	local function var_16_36()
		var_16_6:AnimateSequence("Screen1")
		var_16_8:AnimateSequence("Screen1")
		var_16_10:AnimateSequence("Screen1")
		var_16_12:AnimateSequence("Screen1")
		var_16_14:AnimateSequence("Screen1")
		var_16_18:AnimateSequence("Screen1")
		var_16_20:AnimateSequence("Screen1")
		var_16_22:AnimateSequence("Screen1")
	end

	var_16_0._sequences.Screen1 = var_16_36

	local var_16_37 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 352,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 464,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("Screen2", var_16_37)

	local var_16_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -248,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 252,
			easing = LUI.EASING.outBack
		}
	}

	var_16_8:RegisterAnimationSequence("Screen2", var_16_38)

	local var_16_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -789
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -505
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 257
		}
	}

	var_16_10:RegisterAnimationSequence("Screen2", var_16_39)

	local var_16_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -903
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -391
		}
	}

	var_16_12:RegisterAnimationSequence("Screen2", var_16_40)

	local var_16_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -56,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 56,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 64,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 288,
			easing = LUI.EASING.outBack
		}
	}

	var_16_14:RegisterAnimationSequence("Screen2", var_16_41)

	local var_16_42 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 488,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 760,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_18:RegisterAnimationSequence("Screen2", var_16_42)

	local var_16_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18
		}
	}

	var_16_20:RegisterAnimationSequence("Screen2", var_16_43)

	local var_16_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_22:RegisterAnimationSequence("Screen2", var_16_44)

	local function var_16_45()
		var_16_6:AnimateLoop("Screen2")
		var_16_8:AnimateLoop("Screen2")
		var_16_10:AnimateLoop("Screen2")
		var_16_12:AnimateLoop("Screen2")
		var_16_14:AnimateLoop("Screen2")
		var_16_18:AnimateLoop("Screen2")
		var_16_20:AnimateLoop("Screen2")
		var_16_22:AnimateLoop("Screen2")
	end

	var_16_0._sequences.Screen2 = var_16_45

	local var_16_46 = {
		{
			value = 0,
			duration = 333,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.32,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutBack
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_16_6:RegisterAnimationSequence("BeatMed", var_16_46)

	local function var_16_47()
		var_16_6:AnimateLoop("BeatMed")
	end

	var_16_0._sequences.BeatMed = var_16_47

	local function var_16_48()
		return
	end

	var_16_0._sequences.PulseFast = var_16_48

	local function var_16_49()
		return
	end

	var_16_0._sequences.PulseNormal = var_16_49

	local var_16_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -788
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -133
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -676
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27
		}
	}

	var_16_6:RegisterAnimationSequence("Screen3", var_16_50)

	local var_16_51 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 312,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 812,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("Screen3", var_16_51)

	local var_16_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200,
			easing = LUI.EASING.outBack
		}
	}

	var_16_10:RegisterAnimationSequence("Screen3", var_16_52)

	local var_16_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256,
			easing = LUI.EASING.outBack
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256,
			easing = LUI.EASING.outBack
		}
	}

	var_16_12:RegisterAnimationSequence("Screen3", var_16_53)

	local var_16_54 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 520,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("Screen3", var_16_54)

	local var_16_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -652
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -147
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -380
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27
		}
	}

	var_16_18:RegisterAnimationSequence("Screen3", var_16_55)

	local var_16_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 56
		}
	}

	var_16_20:RegisterAnimationSequence("Screen3", var_16_56)

	local var_16_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_22:RegisterAnimationSequence("Screen3", var_16_57)

	local function var_16_58()
		var_16_6:AnimateSequence("Screen3")
		var_16_8:AnimateSequence("Screen3")
		var_16_10:AnimateSequence("Screen3")
		var_16_12:AnimateSequence("Screen3")
		var_16_14:AnimateSequence("Screen3")
		var_16_18:AnimateSequence("Screen3")
		var_16_20:AnimateSequence("Screen3")
		var_16_22:AnimateSequence("Screen3")
	end

	var_16_0._sequences.Screen3 = var_16_58

	local var_16_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("Test", var_16_59)

	local var_16_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("Test", var_16_60)

	local var_16_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("Test", var_16_61)

	local var_16_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("Test", var_16_62)

	local var_16_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_16:RegisterAnimationSequence("Test", var_16_63)

	local var_16_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_18:RegisterAnimationSequence("Test", var_16_64)

	local var_16_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_20:RegisterAnimationSequence("Test", var_16_65)

	local function var_16_66()
		var_16_6:AnimateSequence("Test")
		var_16_8:AnimateSequence("Test")
		var_16_10:AnimateSequence("Test")
		var_16_12:AnimateSequence("Test")
		var_16_16:AnimateSequence("Test")
		var_16_18:AnimateSequence("Test")
		var_16_20:AnimateSequence("Test")
	end

	var_16_0._sequences.Test = var_16_66

	local var_16_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 320
		},
		{
			duration = 360,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 320
		},
		{
			duration = 360,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 320
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 222
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 418
		}
	}

	var_16_22:RegisterAnimationSequence("Boot", var_16_67)

	local function var_16_68()
		var_16_22:AnimateSequence("Boot")
	end

	var_16_0._sequences.Boot = var_16_68

	var_0_3(var_16_0, var_16_1, arg_16_1)
	ACTIONS.AnimateSequence(var_16_0, "BeatNormal")
	ACTIONS.AnimateSequence(var_16_0, "PulseNormal")
	ACTIONS.AnimateSequence(var_16_0, "Boot")

	return var_16_0
end

MenuBuilder.registerType("WatchHeartRate", WatchHeartRate)
LockTable(_M)
