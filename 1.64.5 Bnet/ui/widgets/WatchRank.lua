module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.RankNum)
	assert(arg_1_0.RankIcon)

	local var_1_0 = 1
	local var_1_1 = 1
	local var_1_2 = {
		"Screen1",
		"Offline"
	}

	if Engine.DDJFBBJAIG() and Engine.DBEJJAFIAI(arg_1_1) or not Engine.DDJFBBJAIG() and Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0) then
		var_1_2 = {
			"Screen1",
			"Screen2"
		}
	end

	local var_1_3

	local function var_1_4()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(var_0_0).onComplete = var_1_4

		arg_1_0.Time:setText(var_2_0)
	end

	var_1_4()

	local var_1_5

	local function var_1_6()
		arg_1_0:Wait(var_0_0).onComplete = var_1_6

		if Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0) then
			local var_3_0
			local var_3_1 = PROGRESSION.GetPlayerRank(arg_1_1)
			local var_3_2

			if not Engine.DDJFBBJAIG() and CONDITIONS.InKillCam(arg_1_1) then
				local var_3_3 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id"):GetValue(arg_1_1)

				var_3_0 = Game.BAJEAFFCGG(var_3_3)
				var_3_1 = RegisterMaterial(Game.HGEFIIJID(var_3_3))
				var_3_2 = 0
			else
				if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_1_1) then
					var_3_2 = PROGRESSION.GetPlayerSeasonRankPercentage(arg_1_1)

					ACTIONS.AnimateSequence(arg_1_0, "ElderProgression")
				else
					var_3_2 = PROGRESSION.GetPlayerMilitaryRankPercentage(arg_1_1)

					ACTIONS.AnimateSequence(arg_1_0, "StandardProgression")
				end

				var_3_0 = PROGRESSION.GetPlayerRank(arg_1_1) + 1
				var_3_1 = RegisterMaterial(PROGRESSION.GetPlayerRankIcon(arg_1_1))
			end

			arg_1_0.RankNum:setText(var_3_0)
			arg_1_0.RankIcon:setImage(var_3_1)
			ACTIONS.AnimateSequence(arg_1_0, "Radial")
			arg_1_0.Progress:SetProgressInC(var_3_2, 0, 0)
		else
			arg_1_0.RankIcon:setImage(RegisterMaterial("icon_scoreboard_ping_1"))
			arg_1_0.RankNum:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE"))

			var_1_2 = {
				"Screen1",
				"Offline"
			}
		end
	end

	var_1_6()

	if Engine.DDJFBBJAIG() then
		arg_1_0.Backer:setImage(RegisterMaterial("ui_prog_radial_whole"))
		arg_1_0.Progress:setImage(RegisterMaterial("ui_prog_radial_segment"))

		local var_1_7

		local function var_1_8()
			local var_4_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

			arg_1_0:Wait(6000).onComplete = var_1_8

			if var_1_0 == #var_1_2 then
				var_1_1 = 1
			else
				var_1_1 = var_1_0 + 1
			end

			ACTIONS.AnimateSequence(arg_1_0, var_1_2[var_1_1])

			var_1_0 = var_1_1
		end

		var_1_8()
	else
		arg_1_0.Backer:setImage(RegisterMaterial("hud_field_upgrade_radial_background"))
		arg_1_0.Progress:setImage(RegisterMaterial("hud_field_upgrade_radial_segment"))

		local var_1_9 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_9:GetModel(arg_1_1), function(arg_5_0)
			if DataModel.JJEHAEBDF(arg_5_0) ~= nil then
				if var_1_0 == #var_1_2 then
					var_1_1 = 1
				else
					var_1_1 = var_1_0 + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_2[var_1_1])

				var_1_0 = var_1_1
			end
		end)

		local var_1_10 = DataSources.inGame.player.inKillCam
		local var_1_11 = LUI.DataSourceInControllerModel.new("cg.spectating.isSpectating")

		local function var_1_12()
			var_1_6()

			if CONDITIONS.IsSpectating(arg_1_1) and not CONDITIONS.InKillCam(arg_1_1) then
				ACTIONS.AnimateSequence(arg_1_0, "Screen1")
			else
				ACTIONS.AnimateSequence(arg_1_0, var_1_2[var_1_1])
			end
		end

		arg_1_0:SubscribeToModel(var_1_10:GetModel(arg_1_1), var_1_12)
		arg_1_0:SubscribeToModel(var_1_11:GetModel(arg_1_1), var_1_12)
	end

	arg_1_0:addEventHandler("player_ranked_up", function(arg_7_0, arg_7_1)
		var_1_6()
		ACTIONS.AnimateSequence(arg_1_0, "RankUp")
		Engine.BJDBIAGIDA("watch_rank_up")
	end)
end

function WatchRank(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_8_0.id = "WatchRank"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromInt(1973582, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Radi"

	var_8_6:SetRGBFromInt(0, 0)
	var_8_6:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 67, _1080p * -67, _1080p * 67, _1080p * -67)
	var_8_0:addElement(var_8_6)

	var_8_0.Radi = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Backer"

	var_8_8:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_8_8:SetAlpha(0.2, 0)
	var_8_8:setImage(RegisterMaterial("ui_prog_radial_whole"), 0)
	var_8_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 14, _1080p * -14, _1080p * 14, _1080p * -14)
	var_8_0:addElement(var_8_8)

	var_8_0.Backer = var_8_8

	local var_8_9
	local var_8_10 = {
		segmentMaterial = "ui_prog_radial_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_8_1
	}
	local var_8_11 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_8_10)

	var_8_11.id = "Progress"

	var_8_11:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_8_11:SetAlpha(0, 0)
	var_8_11:setImage(RegisterMaterial("ui_prog_radial_segment"), 0)
	var_8_11:SetProgress(0.9)
	var_8_11:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 14, _1080p * -14, _1080p * 14, _1080p * -14)
	var_8_0:addElement(var_8_11)

	var_8_0.Progress = var_8_11

	local var_8_12
	local var_8_13 = LUI.UIText.new()

	var_8_13.id = "RankNum"

	var_8_13:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_13:setText("0", 0)
	var_8_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_13:SetAlignment(LUI.Alignment.Center)
	var_8_13:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_8_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -179, _1080p * 179, _1080p * 79, _1080p * 199)
	var_8_0:addElement(var_8_13)

	var_8_0.RankNum = var_8_13

	local var_8_14
	local var_8_15 = LUI.UIImage.new()

	var_8_15.id = "RankIcon"

	var_8_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -123, _1080p * 123, _1080p * -167, _1080p * 79)
	var_8_0:addElement(var_8_15)

	var_8_0.RankIcon = var_8_15

	local var_8_16
	local var_8_17 = LUI.UIStyledText.new()

	var_8_17.id = "Time"

	var_8_17:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_17:setText("", 0)
	var_8_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_17:SetAlignment(LUI.Alignment.Center)
	var_8_17:SetOutlineMinDistance(-0.2, 0)
	var_8_17:SetOutlineMaxDistance(0.2, 0)
	var_8_17:SetOutlineRGBFromTable(SWATCHES.Global.keyColorDark, 0)
	var_8_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -489, _1080p * -369)
	var_8_0:addElement(var_8_17)

	var_8_0.Time = var_8_17

	local function var_8_18()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_18

	local var_8_19
	local var_8_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		}
	}

	var_8_6:RegisterAnimationSequence("Offline", var_8_20)

	local var_8_21 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Offline", var_8_21)

	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("Offline", var_8_22)

	local var_8_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -221
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 221
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("Offline", var_8_23)

	local var_8_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 163
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 108
		}
	}

	var_8_15:RegisterAnimationSequence("Offline", var_8_24)

	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -71
		}
	}

	var_8_17:RegisterAnimationSequence("Offline", var_8_25)

	local function var_8_26()
		var_8_6:AnimateSequence("Offline")
		var_8_8:AnimateSequence("Offline")
		var_8_11:AnimateSequence("Offline")
		var_8_13:AnimateSequence("Offline")
		var_8_15:AnimateSequence("Offline")
		var_8_17:AnimateSequence("Offline")
	end

	var_8_0._sequences.Offline = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Radial", var_8_28)

	local var_8_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("Radial", var_8_29)

	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199
		}
	}

	var_8_13:RegisterAnimationSequence("Radial", var_8_30)

	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 123
		}
	}

	var_8_15:RegisterAnimationSequence("Radial", var_8_31)

	local function var_8_32()
		var_8_8:AnimateSequence("Radial")
		var_8_11:AnimateSequence("Radial")
		var_8_13:AnimateSequence("Radial")
		var_8_15:AnimateSequence("Radial")
	end

	var_8_0._sequences.Radial = var_8_32

	local var_8_33
	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankCareer
		}
	}

	var_8_11:RegisterAnimationSequence("StandardProgression", var_8_34)

	local function var_8_35()
		var_8_11:AnimateSequence("StandardProgression")
	end

	var_8_0._sequences.StandardProgression = var_8_35

	local var_8_36
	local var_8_37 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.8,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 220,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_8_8:RegisterAnimationSequence("RankUp", var_8_37)

	local var_8_38 = {
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
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 220,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("RankUp", var_8_38)

	local var_8_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 123
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -123
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -123
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 220,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 220,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			duration = 220,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -167
		}
	}

	var_8_15:RegisterAnimationSequence("RankUp", var_8_39)

	local function var_8_40()
		var_8_8:AnimateSequence("RankUp")
		var_8_13:AnimateSequence("RankUp")
		var_8_15:AnimateSequence("RankUp")
	end

	var_8_0._sequences.RankUp = var_8_40

	local var_8_41
	local var_8_42 = {
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 536,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 656,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_13:RegisterAnimationSequence("Screen1", var_8_42)

	local var_8_43 = {
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 290,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 536,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_15:RegisterAnimationSequence("Screen1", var_8_43)

	local var_8_44 = {
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60,
			easing = LUI.EASING.outBack
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60,
			easing = LUI.EASING.outBack
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_17:RegisterAnimationSequence("Screen1", var_8_44)

	local function var_8_45()
		var_8_13:AnimateSequence("Screen1")
		var_8_15:AnimateSequence("Screen1")
		var_8_17:AnimateSequence("Screen1")
	end

	var_8_0._sequences.Screen1 = var_8_45

	local var_8_46
	local var_8_47 = {
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79,
			easing = LUI.EASING.outBack
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199,
			easing = LUI.EASING.outBack
		}
	}

	var_8_13:RegisterAnimationSequence("Screen2", var_8_47)

	local var_8_48 = {
		{
			duration = 490,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -123
		},
		{
			duration = 490,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 123
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -167,
			easing = LUI.EASING.outBack
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79,
			easing = LUI.EASING.outBack
		}
	}

	var_8_15:RegisterAnimationSequence("Screen2", var_8_48)

	local var_8_49 = {
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -556,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -436,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_17:RegisterAnimationSequence("Screen2", var_8_49)

	local function var_8_50()
		var_8_13:AnimateSequence("Screen2")
		var_8_15:AnimateSequence("Screen2")
		var_8_17:AnimateSequence("Screen2")
	end

	var_8_0._sequences.Screen2 = var_8_50

	local var_8_51
	local var_8_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankSeason
		}
	}

	var_8_11:RegisterAnimationSequence("ElderProgression", var_8_52)

	local function var_8_53()
		var_8_11:AnimateSequence("ElderProgression")
	end

	var_8_0._sequences.ElderProgression = var_8_53

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WatchRank", WatchRank)
LockTable(_M)
