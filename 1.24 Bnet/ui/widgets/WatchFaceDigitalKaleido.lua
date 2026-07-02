module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._currentSceneState = 0

	local var_1_0 = 1
	local var_1_1 = {
		"Screen1",
		"Screen2",
		"Screen3",
		"Screen4",
		"Screen5",
		"Screen6"
	}
	local var_1_2

	local function var_1_3()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0.TimeLabel:Wait(10000).onComplete = var_1_3

		arg_1_0.TimeLabel:setText(var_2_0)
	end

	var_1_3()
	arg_1_0.Piece1.Image:SetMask(arg_1_0.Mask2)
	arg_1_0.Piece3.Image:SetMask(arg_1_0.Mask2)
	arg_1_0.Piece5.Image:SetMask(arg_1_0.Mask2)
	arg_1_0.Piece7.Image:SetMask(arg_1_0.Mask2)
	arg_1_0.Piece2.Image:SetMask(arg_1_0.Mask)
	arg_1_0.Piece4.Image:SetMask(arg_1_0.Mask)
	arg_1_0.Piece6.Image:SetMask(arg_1_0.Mask)
	arg_1_0.Piece8.Image:SetMask(arg_1_0.Mask)

	local var_1_4 = {
		arg_1_0.Piece1,
		arg_1_0.Piece2,
		arg_1_0.Piece3,
		arg_1_0.Piece4
	}
	local var_1_5 = {
		arg_1_0.Piece5,
		arg_1_0.Piece6,
		arg_1_0.Piece7,
		arg_1_0.Piece8
	}

	local function var_1_6()
		local function var_3_0(arg_4_0, arg_4_1)
			local var_4_0

			local function var_4_1()
				local var_5_0 = math.random(0, 16777215)
				local var_5_1 = math.random(1000, 8000)
				local var_5_2 = math.random(LUI.EASING.linear, LUI.EASING.inOutBack)

				if arg_4_0._currentSceneState == 5 or arg_4_0._currentSceneState == 6 then
					var_5_1 = 400

					for iter_5_0 = 1, #arg_4_1 do
						ACTIONS.AnimateSequence(arg_4_1[iter_5_0], "White")
					end
				else
					for iter_5_1 = 1, #arg_4_1 do
						arg_4_1[iter_5_1].Image:SetRGBFromInt(var_5_0, var_5_1, var_5_2)
					end
				end

				if arg_4_0._currentSceneState == 3 or arg_4_0._currentSceneState == 4 then
					for iter_5_2 = 1, #arg_4_1 do
						ACTIONS.AnimateSequence(arg_4_1[iter_5_2], "Alpha")
					end
				else
					for iter_5_3 = 1, #arg_4_1 do
						ACTIONS.AnimateSequence(arg_4_1[iter_5_3], "Blend")
					end
				end

				arg_4_0:Wait(var_5_1).onComplete = var_4_1
			end

			var_4_1()
		end

		var_3_0(arg_1_0, var_1_4)
		var_3_0(arg_1_0, var_1_5)
		;(function()
			local var_6_0

			local function var_6_1()
				local var_7_0 = math.random(0, 16777215)
				local var_7_1 = math.random(3000, 8000)
				local var_7_2 = arg_1_0.Background:Wait(var_7_1)

				if arg_1_0._currentSceneState == 1 or arg_1_0._currentSceneState == 2 then
					arg_1_0.Background:SetRGBFromInt(var_7_0, var_7_1)
				end

				var_7_2.onComplete = var_6_1
			end

			var_6_1()
		end)()

		local function var_3_1(arg_8_0, arg_8_1)
			local var_8_0

			local function var_8_1()
				local var_9_0 = math.random(-360, 360)
				local var_9_1 = math.random(5000, 15000)
				local var_9_2 = math.random(0, #LUI.EASING)
				local var_9_3 = arg_8_0:Wait(var_9_1)

				for iter_9_0 = 1, #arg_8_1 do
					arg_8_1[iter_9_0].Image:SetZRotation(var_9_0, var_9_1, var_9_2)
				end

				var_9_3.onComplete = var_8_1
			end

			var_8_1()
		end

		var_3_1(arg_1_0, var_1_4)
		var_3_1(arg_1_0, var_1_5)

		local function var_3_2(arg_10_0, arg_10_1)
			local var_10_0

			local function var_10_1()
				local var_11_0 = math.random(1, 5)
				local var_11_1 = math.random(3000, 10000)

				for iter_11_0 = 1, #arg_10_1 do
					ACTIONS.AnimateSequence(arg_10_1[iter_11_0], "Movement" .. var_11_0)
				end

				arg_10_0:Wait(var_11_1).onComplete = var_10_1
			end

			var_10_1()
		end

		var_3_2(arg_1_0, var_1_4)
		var_3_2(arg_1_0, var_1_5)

		local function var_3_3(arg_12_0, arg_12_1)
			local var_12_0

			local function var_12_1()
				local var_13_0 = math.random(0.2, 2)
				local var_13_1 = math.random(3000, 10000)
				local var_13_2 = math.random(0, #LUI.EASING)
				local var_13_3 = arg_12_0:Wait(var_13_1)

				for iter_13_0 = 1, #arg_12_1 do
					arg_12_1[iter_13_0]:SetScale(var_13_0, var_13_1, var_13_2)
				end

				var_13_3.onComplete = var_12_1
			end

			var_12_1()
		end

		var_3_3(arg_1_0, var_1_4)
		var_3_3(arg_1_0, var_1_4)
	end

	var_1_6()

	if Engine.DDJFBBJAIG() then
		local var_1_7

		local function var_1_8()
			local var_14_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

			arg_1_0.Background:Wait(6000, true).onComplete = var_1_8

			if arg_1_0._currentSceneState == #var_1_1 then
				var_1_0 = 1
			else
				var_1_0 = arg_1_0._currentSceneState + 1
			end

			ACTIONS.AnimateSequence(arg_1_0, var_1_1[var_1_0])

			arg_1_0._currentSceneState = var_1_0

			var_1_6()
		end

		var_1_8()
	else
		local var_1_9

		ACTIONS.AnimateSequence(arg_1_0, var_1_1[var_1_0])

		local var_1_10 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_10:GetModel(arg_1_1), function(arg_15_0)
			if DataModel.JJEHAEBDF(arg_15_0) ~= nil then
				if arg_1_0._currentSceneState == #var_1_1 then
					var_1_0 = 1
				else
					var_1_0 = arg_1_0._currentSceneState + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_1[var_1_0])

				arg_1_0._currentSceneState = var_1_0

				var_1_6()
			end
		end)
	end
end

function WatchFaceDigitalKaleido(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_16_0.id = "WatchFaceDigitalKaleido"
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
	var_16_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_16_0:addElement(var_16_4)

	var_16_0.Background = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "Piece8"

	var_16_6:SetZRotation(90, 0)
	var_16_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -385, _1080p * -129, _1080p * -128, _1080p * 128)
	var_16_0:addElement(var_16_6)

	var_16_0.Piece8 = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "Piece7"

	var_16_8:SetZRotation(180, 0)
	var_16_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * 128, _1080p * 384)
	var_16_0:addElement(var_16_8)

	var_16_0.Piece7 = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "Piece6"

	var_16_10:SetZRotation(-90, 0)
	var_16_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 127, _1080p * 383, _1080p * -128, _1080p * 128)
	var_16_0:addElement(var_16_10)

	var_16_0.Piece6 = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "Piece5"

	var_16_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -384, _1080p * -128)
	var_16_0:addElement(var_16_12)

	var_16_0.Piece5 = var_16_12

	local var_16_13
	local var_16_14 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_14.id = "Piece4"

	var_16_14:SetXRotation(180, 0)
	var_16_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -257, _1080p * -1, _1080p * 1, _1080p * 257)
	var_16_0:addElement(var_16_14)

	var_16_0.Piece4 = var_16_14

	local var_16_15
	local var_16_16 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_16.id = "Piece3"

	var_16_16:SetXRotation(180, 0)
	var_16_16:SetYRotation(180, 0)
	var_16_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 257, _1080p * 1, _1080p * 257)
	var_16_0:addElement(var_16_16)

	var_16_0.Piece3 = var_16_16

	local var_16_17
	local var_16_18 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_18.id = "Piece2"

	var_16_18:SetYRotation(180, 0)
	var_16_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 257, _1080p * -257, _1080p * -1)
	var_16_0:addElement(var_16_18)

	var_16_0.Piece2 = var_16_18

	local var_16_19
	local var_16_20 = MenuBuilder.BuildRegisteredType("WatchKaleidoPiece", {
		controllerIndex = var_16_1
	})

	var_16_20.id = "Piece1"

	var_16_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -257, _1080p * -1, _1080p * -257, _1080p * -1)
	var_16_0:addElement(var_16_20)

	var_16_0.Piece1 = var_16_20

	local var_16_21
	local var_16_22 = LUI.UIImage.new()

	var_16_22.id = "Mask"

	var_16_22:setImage(RegisterMaterial("icon_watch_kaleido_mask"), 0)
	var_16_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 510)
	var_16_0:addElement(var_16_22)

	var_16_0.Mask = var_16_22

	local var_16_23
	local var_16_24 = LUI.UIImage.new()

	var_16_24.id = "Mask2"

	var_16_24:SetZRotation(-30, 0)
	var_16_24:setImage(RegisterMaterial("icon_watch_kaleido_mask"), 0)
	var_16_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 511)
	var_16_0:addElement(var_16_24)

	var_16_0.Mask2 = var_16_24

	local var_16_25
	local var_16_26 = LUI.UIStyledText.new()

	var_16_26.id = "TimeLabel"

	var_16_26:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_16_26:SetScale(1, 0)
	var_16_26:setText("00:00", 0)
	var_16_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_16_26:SetAlignment(LUI.Alignment.Center)
	var_16_26:SetShadowRGBFromInt(0, 0)
	var_16_26:SetOutlineMinDistance(-0.5, 0)
	var_16_26:SetOutlineRGBFromInt(0, 0)
	var_16_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -35, _1080p * 35)
	var_16_0:addElement(var_16_26)

	var_16_0.TimeLabel = var_16_26

	local function var_16_27()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_27

	local var_16_28
	local var_16_29 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("Screen1", var_16_29)

	local var_16_30 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_16_26:RegisterAnimationSequence("Screen1", var_16_30)

	local function var_16_31()
		var_16_4:AnimateSequence("Screen1")
		var_16_26:AnimateSequence("Screen1")
	end

	var_16_0._sequences.Screen1 = var_16_31

	local var_16_32
	local var_16_33 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("Screen2", var_16_33)

	local var_16_34 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_16_26:RegisterAnimationSequence("Screen2", var_16_34)

	local function var_16_35()
		var_16_4:AnimateSequence("Screen2")
		var_16_26:AnimateSequence("Screen2")
	end

	var_16_0._sequences.Screen2 = var_16_35

	local var_16_36
	local var_16_37 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("Screen3", var_16_37)

	local var_16_38 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_16_26:RegisterAnimationSequence("Screen3", var_16_38)

	local function var_16_39()
		var_16_4:AnimateSequence("Screen3")
		var_16_26:AnimateSequence("Screen3")
	end

	var_16_0._sequences.Screen3 = var_16_39

	local var_16_40
	local var_16_41 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("Screen4", var_16_41)

	local var_16_42 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_16_26:RegisterAnimationSequence("Screen4", var_16_42)

	local function var_16_43()
		var_16_4:AnimateSequence("Screen4")
		var_16_26:AnimateSequence("Screen4")
	end

	var_16_0._sequences.Screen4 = var_16_43

	local var_16_44
	local var_16_45 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("Screen5", var_16_45)

	local var_16_46 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.highlight
		}
	}

	var_16_26:RegisterAnimationSequence("Screen5", var_16_46)

	local function var_16_47()
		var_16_4:AnimateSequence("Screen5")
		var_16_26:AnimateSequence("Screen5")
	end

	var_16_0._sequences.Screen5 = var_16_47

	local var_16_48
	local var_16_49 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("Screen6", var_16_49)

	local var_16_50 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.highlight
		}
	}

	var_16_26:RegisterAnimationSequence("Screen6", var_16_50)

	local function var_16_51()
		var_16_4:AnimateSequence("Screen6")
		var_16_26:AnimateSequence("Screen6")
	end

	var_16_0._sequences.Screen6 = var_16_51

	PostLoadFunc(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("WatchFaceDigitalKaleido", WatchFaceDigitalKaleido)
LockTable(_M)
