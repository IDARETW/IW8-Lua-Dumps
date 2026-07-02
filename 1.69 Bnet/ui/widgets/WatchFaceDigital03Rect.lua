module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(15000).onComplete = var_1_1

		arg_1_0.TimeLabel:setText(var_2_0)
	end

	var_1_1()

	local var_1_2 = Engine.BADEEDFGHB(Engine.DCJHCAFIIA())

	arg_1_0.DateLabel:setText(var_1_2)

	local var_1_3

	;(function()
		local var_3_0 = 50

		if not Engine.DDJFBBJAIG() then
			var_3_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state")
		end

		local var_3_1 = var_3_0 + math.random(-10, 10)
		local var_3_2 = Engine.CBBHFCGDIC("WATCHES/DEGREES_CELSIUS", LUI.Round((var_3_1 - 32) * 5 / 9, 1))

		arg_1_0.Temperature:setText(var_3_2)
	end)()

	local var_1_4 = math.random(80, 100)
	local var_1_5

	local function var_1_6()
		local var_4_0 = math.random(30000, 180000)
		local var_4_1 = arg_1_0:Wait(var_4_0)

		var_1_4 = var_1_4 - 1

		local var_4_2 = 1 - var_1_4 / 100

		arg_1_0.Mask.Fill:SetRightAnchor(var_4_2, 500)

		if var_1_4 >= 51 then
			ACTIONS.AnimateSequence(arg_1_0, "BatteryFull")

			var_4_1.onComplete = var_1_6
		elseif var_1_4 < 51 and var_1_4 > 20 then
			ACTIONS.AnimateSequence(arg_1_0, "BatteryMed")

			var_4_1.onComplete = var_1_6
		elseif var_1_4 < 21 and var_1_4 > 0 then
			ACTIONS.AnimateSequence(arg_1_0, "BatteryLow")

			var_4_1.onComplete = var_1_6
		else
			ACTIONS.AnimateSequence(arg_1_0, "DeadBattery")

			return
		end

		arg_1_0.BatteryLabel:setText(var_1_4)
	end

	var_1_6()

	if not Engine.DDJFBBJAIG() then
		local var_1_7 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_7:GetModel(arg_1_1), function(arg_5_0)
			if DataModel.JJEHAEBDF(arg_5_0) ~= nil and var_1_4 < 10 then
				var_1_4 = var_1_4 + 15

				ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
				var_1_6()
			end
		end)
	end
end

function WatchFaceDigital03Rect(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_6_0.id = "WatchFaceDigital03Rect"
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

	var_6_4.id = "BG"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.BG = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Frame"

	var_6_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_6:SetAlpha(0.6, 0)
	var_6_6:setImage(RegisterMaterial("icon_watch_rect_bg_01"), 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 12, _1080p * -12)
	var_6_0:addElement(var_6_6)

	var_6_0.Frame = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "TimeLabel"

	var_6_8:SetRGBFromInt(14335029, 0)
	var_6_8:SetScale(-0.2, 0)
	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetShadowMinDistance(-0.4, 0)
	var_6_8:SetShadowRGBFromInt(5260300, 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -283, _1080p * 283, 0, _1080p * 157)
	var_6_0:addElement(var_6_8)

	var_6_0.TimeLabel = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "DateLabel"

	var_6_10:SetRGBFromInt(14335029, 0)
	var_6_10:SetScale(-0.4, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_10:SetLeading(60 * _1080p, 0)
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetShadowMinDistance(-0.4, 0)
	var_6_10:SetShadowRGBFromInt(5260300, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -377, _1080p * 377, _1080p * -59, _1080p * 21)
	var_6_0:addElement(var_6_10)

	var_6_0.DateLabel = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIStyledText.new()

	var_6_12.id = "Temperature"

	var_6_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_12:setText("", 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetLeading(60 * _1080p, 0)
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetShadowMinDistance(-0.6, 0)
	var_6_12:SetShadowRGBFromInt(5329233, 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * -99, _1080p * -51)
	var_6_0:addElement(var_6_12)

	var_6_0.Temperature = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIText.new()

	var_6_14.id = "BatteryLabel"

	var_6_14:SetRGBFromInt(7184682, 0)
	var_6_14:SetScale(-0.2, 0)
	var_6_14:setText("100", 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetLeading(60 * _1080p, 0)
	var_6_14:SetAlignment(LUI.Alignment.Center)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 107, _1080p * 219, _1080p * 149, _1080p * 209)
	var_6_0:addElement(var_6_14)

	var_6_0.BatteryLabel = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "Battery"

	var_6_16:SetRGBFromInt(7184682, 0)
	var_6_16:SetZRotation(-90, 0)
	var_6_16:setImage(RegisterMaterial("icon_watch_battery"), 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 319, _1080p * 355, _1080p * 397, _1080p * 477)
	var_6_0:addElement(var_6_16)

	var_6_0.Battery = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "Cron"

	var_6_18:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_18:SetAlpha(0.6, 0)
	var_6_18:setImage(RegisterMaterial("icon_watch_logo_01"), 0)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 59, _1080p * 187, _1080p * 401, _1080p * 465)
	var_6_0:addElement(var_6_18)

	var_6_0.Cron = var_6_18

	local var_6_19
	local var_6_20 = MenuBuilder.BuildRegisteredType("WatchGeigerMeter", {
		controllerIndex = var_6_1
	})

	var_6_20.id = "Mask"

	var_6_20:SetRGBFromInt(7184682, 0)
	var_6_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 49, _1080p * 107, _1080p * 170, _1080p * 192)
	var_6_0:addElement(var_6_20)

	var_6_0.Mask = var_6_20

	local var_6_21 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("DefaultSequence", var_6_21)

	local var_6_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DefaultSequence", var_6_22)

	local var_6_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("DefaultSequence", var_6_23)

	local var_6_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("DefaultSequence", var_6_24)

	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("DefaultSequence", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("DefaultSequence", var_6_26)

	local var_6_27 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("DefaultSequence", var_6_27)

	local var_6_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("DefaultSequence", var_6_28)

	local function var_6_29()
		var_6_6:AnimateSequence("DefaultSequence")
		var_6_8:AnimateSequence("DefaultSequence")
		var_6_10:AnimateSequence("DefaultSequence")
		var_6_12:AnimateSequence("DefaultSequence")
		var_6_14:AnimateSequence("DefaultSequence")
		var_6_16:AnimateSequence("DefaultSequence")
		var_6_18:AnimateSequence("DefaultSequence")
		var_6_20:AnimateSequence("DefaultSequence")
	end

	var_6_0._sequences.DefaultSequence = var_6_29

	local var_6_30 = {
		{
			value = 7184682,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_14:RegisterAnimationSequence("BatteryFull", var_6_30)

	local var_6_31 = {
		{
			value = 7184682,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_16:RegisterAnimationSequence("BatteryFull", var_6_31)

	local var_6_32 = {
		{
			value = 7184682,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_20:RegisterAnimationSequence("BatteryFull", var_6_32)

	local function var_6_33()
		var_6_14:AnimateSequence("BatteryFull")
		var_6_16:AnimateSequence("BatteryFull")
		var_6_20:AnimateSequence("BatteryFull")
	end

	var_6_0._sequences.BatteryFull = var_6_33

	local var_6_34 = {
		{
			value = 14335029,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_14:RegisterAnimationSequence("BatteryMed", var_6_34)

	local var_6_35 = {
		{
			value = 14335029,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_16:RegisterAnimationSequence("BatteryMed", var_6_35)

	local var_6_36 = {
		{
			value = 14335029,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_20:RegisterAnimationSequence("BatteryMed", var_6_36)

	local function var_6_37()
		var_6_14:AnimateSequence("BatteryMed")
		var_6_16:AnimateSequence("BatteryMed")
		var_6_20:AnimateSequence("BatteryMed")
	end

	var_6_0._sequences.BatteryMed = var_6_37

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeamHighlight
		}
	}

	var_6_14:RegisterAnimationSequence("BatteryLow", var_6_38)

	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeamHighlight
		}
	}

	var_6_16:RegisterAnimationSequence("BatteryLow", var_6_39)

	local var_6_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeamHighlight
		}
	}

	var_6_20:RegisterAnimationSequence("BatteryLow", var_6_40)

	local function var_6_41()
		var_6_14:AnimateSequence("BatteryLow")
		var_6_16:AnimateSequence("BatteryLow")
		var_6_20:AnimateSequence("BatteryLow")
	end

	var_6_0._sequences.BatteryLow = var_6_41

	local var_6_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("DeadBattery", var_6_42)

	local var_6_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DeadBattery", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("DeadBattery", var_6_44)

	local var_6_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("DeadBattery", var_6_45)

	local var_6_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("DeadBattery", var_6_46)

	local var_6_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_16:RegisterAnimationSequence("DeadBattery", var_6_47)

	local var_6_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("DeadBattery", var_6_48)

	local var_6_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("DeadBattery", var_6_49)

	local function var_6_50()
		var_6_6:AnimateLoop("DeadBattery")
		var_6_8:AnimateLoop("DeadBattery")
		var_6_10:AnimateLoop("DeadBattery")
		var_6_12:AnimateLoop("DeadBattery")
		var_6_14:AnimateLoop("DeadBattery")
		var_6_16:AnimateLoop("DeadBattery")
		var_6_18:AnimateLoop("DeadBattery")
		var_6_20:AnimateLoop("DeadBattery")
	end

	var_6_0._sequences.DeadBattery = var_6_50

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "DefaultSequence")
	ACTIONS.AnimateSequenceByElement(var_6_0, {
		elementPath = "self.Mask",
		sequenceName = "StencilMask",
		elementName = "Mask"
	})

	return var_6_0
end

MenuBuilder.registerType("WatchFaceDigital03Rect", WatchFaceDigital03Rect)
LockTable(_M)
