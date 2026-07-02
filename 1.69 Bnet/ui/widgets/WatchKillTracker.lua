module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._currentSceneState = 0

	local var_1_0 = 1
	local var_1_1 = "0"
	local var_1_2 = "0"
	local var_1_3 = {
		"Screen1",
		"ScreenOffline"
	}

	if CONDITIONS.IsSplitscreen(arg_1_0) then
		var_1_3 = {
			"ScreenOffline",
			"ScreenOffline"
		}
	elseif Engine.DBEJJAFIAI(arg_1_1) then
		var_1_3 = {
			"Screen1",
			"Screen2"
		}
	end

	local function var_1_4(arg_2_0)
		local var_2_0 = tonumber(arg_2_0)

		if var_2_0 >= 1000000000000 then
			return Engine.CBBHFCGDIC("WATCHES/TRILLION_ABBREVIATION", LUI.Round(arg_2_0 / 1000000000000, 4))
		elseif var_2_0 >= 1000000000 then
			return Engine.CBBHFCGDIC("WATCHES/BILLION_ABBREVIATION", LUI.Round(arg_2_0 / 1000000000, 1))
		elseif var_2_0 >= 1000000 then
			return Engine.CBBHFCGDIC("WATCHES/MILLION_ABBREVIATION", LUI.Round(arg_2_0 / 1000000, 1))
		elseif var_2_0 >= 1000 then
			return Engine.CBBHFCGDIC("WATCHES/THOUSAND_ABBREVIATION", LUI.Round(arg_2_0 / 1000, 1))
		else
			return var_2_0
		end
	end

	local function var_1_5()
		arg_1_0.KillsNumber:setText(Engine.CBBHFCGDIC("WATCHES/KILLS", var_1_4(var_1_1)))
		arg_1_0.DeathsNumber:setText(Engine.CBBHFCGDIC("WATCHES/DEATHS", var_1_4(var_1_2)))
	end

	var_1_5()

	if Engine.DDJFBBJAIG() then
		local var_1_6

		local function var_1_7()
			local var_4_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

			arg_1_0:Wait(6000).onComplete = var_1_7

			if arg_1_0._currentSceneState == #var_1_3 then
				var_1_0 = 1
			else
				var_1_0 = arg_1_0._currentSceneState + 1
			end

			if arg_1_0._currentSceneState == 1 and Engine.DBEJJAFIAI(arg_1_1) then
				local var_4_1 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked)

				var_1_1 = var_4_1.playerStats.combatStats.kills:get()
				var_1_2 = var_4_1.playerStats.combatStats.deaths:get()
			else
				var_1_1 = "0"
				var_1_2 = "0"
			end

			var_1_5()
			ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

			arg_1_0._currentSceneState = var_1_0
		end

		var_1_7()
	elseif Engine.EAIICIFIFA() then
		local var_1_8

		var_1_3 = {
			"ScreenOffline",
			"ScreenOffline"
		}

		ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

		local var_1_9 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_9:GetModel(arg_1_1), function(arg_5_0)
			if DataModel.JJEHAEBDF(arg_5_0) ~= nil then
				if arg_1_0._currentSceneState == #var_1_3 then
					var_1_0 = 1
				else
					var_1_0 = arg_1_0._currentSceneState + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

				arg_1_0._currentSceneState = var_1_0
			end
		end)
	else
		local var_1_10 = LUI.DataSourceFromOmnvar.new("ui_life_kill_count")
		local var_1_11
		local var_1_12 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id")
		local var_1_13 = DataSources.inGame.currentPlayerStateClientNum
		local var_1_14 = DataSources.inGame.player.spawnNotify

		local function var_1_15()
			if CONDITIONS.IsSpectating(arg_1_1) or CONDITIONS.InKillCam(arg_1_1) then
				var_1_3 = {
					"ScreenOffline",
					"ScreenOffline"
				}

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])
			elseif Engine.DBEJJAFIAI(arg_1_1) and not CONDITIONS.IsSplitscreen(arg_1_0) then
				var_1_3 = {
					"Screen1",
					"Screen2"
				}

				if var_1_11 ~= arg_1_0._currentSceneState then
					ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

					var_1_11 = arg_1_0._currentSceneState
				end
			elseif not CONDITIONS.IsSplitscreen(arg_1_0) then
				var_1_3 = {
					"Screen1",
					"ScreenOffline"
				}

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])
			else
				var_1_3 = {
					"ScreenOffline",
					"ScreenOffline"
				}

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])
			end
		end

		arg_1_0:SubscribeToModel(var_1_13:GetModel(arg_1_1), var_1_15)
		arg_1_0:SubscribeToModel(var_1_14:GetModel(arg_1_1), var_1_15)
		arg_1_0:SubscribeToModel(var_1_12:GetModel(arg_1_1), var_1_15)

		local function var_1_16()
			if arg_1_0._currentSceneState == 2 and Engine.DBEJJAFIAI(arg_1_1) then
				local var_7_0 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked)

				var_1_1 = var_7_0.playerStats.combatStats.kills:get()
				var_1_2 = var_7_0.playerStats.combatStats.deaths:get()
			else
				var_1_2 = Game.BCGGJBIEEH()
				var_1_1 = Game.CJGJICCGAJ()
			end
		end

		local var_1_17

		local function var_1_18()
			var_1_16()

			if var_1_2 and var_1_1 then
				var_1_5()
			elseif not arg_1_0.wait then
				arg_1_0.wait = arg_1_0:Wait(500)

				function arg_1_0.wait.onComplete()
					var_1_18()
				end
			end
		end

		local var_1_19 = DataSources.inGame.MP.match.teamScoreFriendly

		arg_1_0:SubscribeToModel(var_1_19:GetModel(arg_1_1), var_1_18)

		local var_1_20 = DataSources.inGame.MP.match.teamScoreEnemy

		arg_1_0:SubscribeToModel(var_1_20:GetModel(arg_1_1), var_1_18)
		arg_1_0:SubscribeToModel(var_1_10:GetModel(arg_1_1), var_1_18)
		arg_1_0:SubscribeToModel(DataSources.inGame.HUD.pointsPopupNotify:GetModel(arg_1_1), var_1_18)

		local var_1_21 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_21:GetModel(arg_1_1), function(arg_10_0)
			if DataModel.JJEHAEBDF(arg_10_0) ~= nil then
				if arg_1_0._currentSceneState == #var_1_3 then
					var_1_0 = 1
				else
					var_1_0 = arg_1_0._currentSceneState + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

				arg_1_0._currentSceneState = var_1_0

				var_1_18()
			end
		end)
	end
end

function WatchKillTracker(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_11_0.id = "WatchKillTracker"
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
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 146, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.BG = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Radi"

	var_11_6:SetRGBFromInt(16711692, 0)
	var_11_6:SetAlpha(0.25, 0)
	var_11_6:SetPixelGridEnabled(true)
	var_11_6:SetPixelGridContrast(0.95, 0)
	var_11_6:SetPixelGridBlockWidth(16, 0)
	var_11_6:SetPixelGridBlockHeight(16, 0)
	var_11_6:SetPixelGridGutterWidth(2, 0)
	var_11_6:SetPixelGridGutterHeight(2, 0)
	var_11_6:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -87, _1080p * 87, _1080p * 84, _1080p * 62)
	var_11_0:addElement(var_11_6)

	var_11_0.Radi = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "LineTop"

	var_11_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_11_8:SetAlpha(0.6, 0)
	var_11_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 60, _1080p * -60, _1080p * 70, _1080p * 74)
	var_11_0:addElement(var_11_8)

	var_11_0.LineTop = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIStyledText.new()

	var_11_10.id = "KillsNumber"

	var_11_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_11_10:setText("1000", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_10:SetAlignment(LUI.Alignment.Center)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 493, _1080p * 180, _1080p * 300)
	var_11_0:addElement(var_11_10)

	var_11_0.KillsNumber = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIStyledText.new()

	var_11_12.id = "DeathsNumber"

	var_11_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_11_12:setText("1000", 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_12:SetAlignment(LUI.Alignment.Center)
	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 493, _1080p * 356, _1080p * 476)
	var_11_0:addElement(var_11_12)

	var_11_0.DeathsNumber = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "Ping"

	var_11_14:SetAlpha(0, 0)
	var_11_14:setImage(RegisterMaterial("icon_scoreboard_ping_1"), 0)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 172, _1080p * 340, _1080p * 260, _1080p * 316)
	var_11_0:addElement(var_11_14)

	var_11_0.Ping = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIStyledText.new()

	var_11_16.id = "Noconnection"

	var_11_16:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_11_16:SetAlpha(0, 0)
	var_11_16:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE"), 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_16:SetAlignment(LUI.Alignment.Center)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 472, _1080p * 341, _1080p * 411)
	var_11_0:addElement(var_11_16)

	var_11_0.Noconnection = var_11_16

	local function var_11_17()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_17

	local var_11_18 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.AzureBlue,
			easing = LUI.EASING.outBack
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Screen2", var_11_18)

	local var_11_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -256
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -60,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 60,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.8,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("Screen2", var_11_19)

	local var_11_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("Screen2", var_11_20)

	local var_11_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_12:RegisterAnimationSequence("Screen2", var_11_21)

	local var_11_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Screen2", var_11_22)

	local var_11_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("Screen2", var_11_23)

	local function var_11_24()
		var_11_6:AnimateSequence("Screen2")
		var_11_8:AnimateSequence("Screen2")
		var_11_10:AnimateSequence("Screen2")
		var_11_12:AnimateSequence("Screen2")
		var_11_14:AnimateSequence("Screen2")
		var_11_16:AnimateSequence("Screen2")
	end

	var_11_0._sequences.Screen2 = var_11_24

	local var_11_25 = {
		{
			value = 16711692,
			duration = 400,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outBack
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Screen1", var_11_25)

	local var_11_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -256
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 60,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -60,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.8,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_8:RegisterAnimationSequence("Screen1", var_11_26)

	local var_11_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_10:RegisterAnimationSequence("Screen1", var_11_27)

	local var_11_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_12:RegisterAnimationSequence("Screen1", var_11_28)

	local var_11_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Screen1", var_11_29)

	local var_11_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("Screen1", var_11_30)

	local function var_11_31()
		var_11_6:AnimateSequence("Screen1")
		var_11_8:AnimateSequence("Screen1")
		var_11_10:AnimateSequence("Screen1")
		var_11_12:AnimateSequence("Screen1")
		var_11_14:AnimateSequence("Screen1")
		var_11_16:AnimateSequence("Screen1")
	end

	var_11_0._sequences.Screen1 = var_11_31

	local var_11_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.AzureBlue
		}
	}

	var_11_6:RegisterAnimationSequence("ScreenOffline", var_11_32)

	local var_11_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ScreenOffline", var_11_33)

	local var_11_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ScreenOffline", var_11_34)

	local var_11_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ScreenOffline", var_11_35)

	local var_11_36 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ScreenOffline", var_11_36)

	local var_11_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_16:RegisterAnimationSequence("ScreenOffline", var_11_37)

	local function var_11_38()
		var_11_6:AnimateLoop("ScreenOffline")
		var_11_8:AnimateLoop("ScreenOffline")
		var_11_10:AnimateLoop("ScreenOffline")
		var_11_12:AnimateLoop("ScreenOffline")
		var_11_14:AnimateLoop("ScreenOffline")
		var_11_16:AnimateLoop("ScreenOffline")
	end

	var_11_0._sequences.ScreenOffline = var_11_38

	local function var_11_39()
		return
	end

	var_11_0._sequences.Rotate = var_11_39

	var_0_0(var_11_0, var_11_1, arg_11_1)
	ACTIONS.AnimateSequence(var_11_0, "Rotate")

	return var_11_0
end

MenuBuilder.registerType("WatchKillTracker", WatchKillTracker)
LockTable(_M)
