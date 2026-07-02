module(..., package.seeall)

local var_0_0 = 6000
local var_0_1 = 12000
local var_0_2 = 2200

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Meter:SetMask(arg_1_0.Mask.Fill)

	local var_1_0 = 30
	local var_1_1 = 0
	local var_1_2 = false
	local var_1_3 = false

	arg_1_0.Mask.Fill:SetRightAnchor(1, 0)

	local var_1_4

	local function var_1_5()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(var_0_1).onComplete = var_1_5

		arg_1_0.Time:setText(var_2_0)
	end

	var_1_5()

	local var_1_6

	local function var_1_7(arg_3_0)
		if var_1_2 and var_1_3 then
			Engine.BJDBIAGIDA("watch_geiger_nuke_pulse")

			arg_1_0:Wait(1000).onComplete = function()
				var_1_7()
			end
		else
			return
		end
	end

	local var_1_8 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_check")

	local function var_1_9(arg_5_0)
		var_1_2 = true
		arg_1_0:Wait(var_0_2).onComplete = function()
			var_1_2 = false
		end

		var_1_7()
	end

	local function var_1_10(arg_7_0)
		arg_1_0.KillCount:setText(arg_7_0 .. " / 30", 0)

		if var_1_2 and arg_7_0 ~= 0 then
			Engine.BJDBIAGIDA("watch_geiger_tick")
		end

		local var_7_0 = 1 - arg_7_0 / var_1_0

		arg_1_0.Mask.Fill:SetRightAnchor(var_7_0, 500)

		if arg_7_0 >= 30 then
			ACTIONS.AnimateSequence(arg_1_0, "GoalReached")
			arg_1_0.Mask.Fill:setImage(RegisterMaterial("stencil_mask"), 0)

			var_1_3 = true

			if var_1_2 then
				Engine.BJDBIAGIDA("watch_geiger_nuke_activate")
			end
		else
			ACTIONS.AnimateSequence(arg_1_0, "Normal")
			arg_1_0.Mask.Fill:setImage(RegisterMaterial("hud_weapon_info_mask"), 0)

			var_1_3 = false
		end
	end

	if Engine.DDJFBBJAIG() then
		ACTIONS.AnimateSequence(arg_1_0, "Normal")

		local var_1_11

		local function var_1_12()
			local var_8_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

			arg_1_0:Wait(var_0_0).onComplete = var_1_12

			local var_8_1 = math.random(0, 30)

			var_1_10(var_8_1)
		end

		var_1_12()
	elseif Engine.EAIICIFIFA() then
		ACTIONS.AnimateSequence(arg_1_0, "ScreenOffline")
	else
		local var_1_13 = LUI.DataSourceFromOmnvar.new("ui_life_kill_count")
		local var_1_14 = DataSources.inGame.MP.scorestreakHuds.nukeCountdownActive

		local function var_1_15()
			local var_9_0 = var_1_13:GetValue(arg_1_1)
			local var_9_1 = var_1_14:GetValue(arg_1_1)

			if var_9_0 then
				var_1_10(var_9_0)
			end

			if var_9_1 then
				ACTIONS.AnimateSequence(arg_1_0, "Deployed")

				if var_1_2 then
					Engine.BJDBIAGIDA("watch_geiger_nuke_activate")
				end
			end
		end

		arg_1_0:SubscribeToModel(var_1_13:GetModel(arg_1_1), var_1_15)
		arg_1_0:SubscribeToModel(var_1_14:GetModel(arg_1_1), var_1_15)
		arg_1_0:SubscribeToModel(var_1_8:GetModel(arg_1_1), var_1_9)

		local var_1_16 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id")
		local var_1_17 = DataSources.inGame.currentPlayerStateClientNum
		local var_1_18 = DataSources.inGame.player.spawnNotify

		local function var_1_19()
			if CONDITIONS.IsSpectating(arg_1_1) or CONDITIONS.InKillCam(arg_1_1) then
				ACTIONS.AnimateSequence(arg_1_0, "ScreenOffline")
			else
				ACTIONS.AnimateSequence(arg_1_0, "Normal")
				var_1_15()
			end
		end

		arg_1_0:SubscribeToModel(var_1_17:GetModel(arg_1_1), var_1_19)
		arg_1_0:SubscribeToModel(var_1_16:GetModel(arg_1_1), var_1_19)
		arg_1_0:SubscribeToModel(var_1_18:GetModel(arg_1_1), var_1_19)
	end
end

function WatchGeiger(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_11_0.id = "WatchGeiger"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "BG"

	var_11_4:SetRGBFromInt(0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.BG = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "WatchBacker"

	var_11_6:setImage(RegisterMaterial("icon_watch_geiger_bg"), 0)
	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -140, _1080p * 256)
	var_11_0:addElement(var_11_6)

	var_11_0.WatchBacker = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIStyledText.new()

	var_11_8.id = "Time"

	var_11_8:SetRGBFromInt(16711680, 0)
	var_11_8:setText("12:00:00", 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_8:SetTracking(1 * _1080p, 0)
	var_11_8:SetAlignment(LUI.Alignment.Center)
	var_11_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * 174, _1080p * 244)
	var_11_0:addElement(var_11_8)

	var_11_0.Time = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "Meter"

	var_11_10:SetAlpha(0.5, 0)
	var_11_10:setImage(RegisterMaterial("icon_watch_geiger_meter"), 0)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 255, _1080p * -24, _1080p * 143)
	var_11_0:addElement(var_11_10)

	var_11_0.Meter = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("WatchGeigerMeter", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "Mask"

	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 255, _1080p * -24, _1080p * 143)
	var_11_0:addElement(var_11_12)

	var_11_0.Mask = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "Fade"

	var_11_14:SetRGBFromInt(4718592, 0)
	var_11_14:SetAlpha(0, 0)
	var_11_14:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 81, _1080p * -89)
	var_11_0:addElement(var_11_14)

	var_11_0.Fade = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIStyledText.new()

	var_11_16.id = "KillCount"

	var_11_16:SetRGBFromInt(15231489, 0)
	var_11_16:setText("00", 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_16:SetWordWrap(false)
	var_11_16:SetAlignment(LUI.Alignment.Center)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -223, _1080p * 66, _1080p * -124, _1080p * -24)
	var_11_0:addElement(var_11_16)

	var_11_0.KillCount = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIImage.new()

	var_11_18.id = "Radiation"

	var_11_18:SetRGBFromInt(15231489, 0)
	var_11_18:setImage(RegisterMaterial("icon_watch_radiation"), 0)
	var_11_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 153, _1080p * 225, _1080p * -110, _1080p * -38)
	var_11_0:addElement(var_11_18)

	var_11_0.Radiation = var_11_18

	local function var_11_19()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_19

	local var_11_20
	local var_11_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_12:RegisterAnimationSequence("GoalReached", var_11_21)

	local function var_11_22()
		var_11_12:AnimateLoop("GoalReached")
	end

	var_11_0._sequences.GoalReached = var_11_22

	local var_11_23
	local var_11_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		}
	}

	var_11_12:RegisterAnimationSequence("Normal", var_11_24)

	local var_11_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Normal", var_11_25)

	local var_11_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 66
		}
	}

	var_11_16:RegisterAnimationSequence("Normal", var_11_26)

	local var_11_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 153
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 225
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_11_18:RegisterAnimationSequence("Normal", var_11_27)

	local function var_11_28()
		var_11_12:AnimateSequence("Normal")
		var_11_14:AnimateSequence("Normal")
		var_11_16:AnimateSequence("Normal")
		var_11_18:AnimateSequence("Normal")
	end

	var_11_0._sequences.Normal = var_11_28

	local var_11_29
	local var_11_30 = {
		{
			value = 0.8,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Deployed", var_11_30)

	local var_11_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("Deployed", var_11_31)

	local var_11_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -121,
			duration = 500,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_11_18:RegisterAnimationSequence("Deployed", var_11_32)

	local function var_11_33()
		var_11_14:AnimateLoop("Deployed")
		var_11_16:AnimateLoop("Deployed")
		var_11_18:AnimateLoop("Deployed")
	end

	var_11_0._sequences.Deployed = var_11_33

	local var_11_34
	local var_11_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE")
		},
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 338
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_11_16:RegisterAnimationSequence("ScreenOffline", var_11_35)

	local function var_11_36()
		var_11_16:AnimateSequence("ScreenOffline")
	end

	var_11_0._sequences.ScreenOffline = var_11_36

	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WatchGeiger", WatchGeiger)
LockTable(_M)
