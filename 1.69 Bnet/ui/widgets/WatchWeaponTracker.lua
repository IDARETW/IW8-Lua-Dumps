module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._currentSceneState = 0

	local var_1_0 = 1
	local var_1_1 = 0
	local var_1_2 = 0
	local var_1_3 = {
		"NoConnection",
		"NoConnection"
	}

	if Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0) or Engine.DDJFBBJAIG() then
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
		arg_1_0.KillCounter:setText(Engine.CBBHFCGDIC("WATCHES/KILLS", var_1_4(var_1_1)))
		arg_1_0.HeadshotCounter:setText(Engine.CBBHFCGDIC("WATCHES/HEADSHOTS", var_1_4(var_1_2)))
	end

	var_1_5()

	if Engine.DDJFBBJAIG() then
		arg_1_0.WeaponImage:setImage(RegisterMaterial("icon_weapon_ar_kilo433"), 0)

		local var_1_6

		local function var_1_7()
			arg_1_0:Wait(6000).onComplete = var_1_7

			if arg_1_0._currentSceneState == #var_1_3 then
				var_1_0 = 1
			else
				var_1_0 = arg_1_0._currentSceneState + 1
			end

			if Engine.DBEJJAFIAI(arg_1_1) then
				local var_4_0 = "iw8_ar_kilo433"

				var_1_1 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked).playerStats.weaponStats[var_4_0].kills:get()
				var_1_2 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked).playerStats.weaponStats[var_4_0].headShots:get()
			end

			var_1_5()
			ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

			arg_1_0._currentSceneState = var_1_0
		end

		var_1_7()
	elseif Engine.EAIICIFIFA() then
		var_1_3 = {
			"NoConnection",
			"NoConnection"
		}

		ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])
	else
		local var_1_8 = LUI.DataSourceFromOmnvar.new("ui_life_kill_count")
		local var_1_9 = DataSources.inGame.player.currentWeapon.displayName
		local var_1_10 = DataSources.inGame.player.currentWeapon.image
		local var_1_11
		local var_1_12 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id")
		local var_1_13 = DataSources.inGame.currentPlayerStateClientNum

		local function var_1_14()
			if CONDITIONS.IsSpectating(arg_1_1) or CONDITIONS.InKillCam(arg_1_1) then
				ACTIONS.AnimateSequence(arg_1_0, "NoConnection")
			elseif Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0) then
				var_1_3 = {
					"Screen1",
					"Screen2"
				}

				if var_1_11 ~= arg_1_0._currentSceneState then
					ACTIONS.AnimateSequence(arg_1_0, var_1_3[1])

					var_1_11 = arg_1_0._currentSceneState
				end
			end
		end

		arg_1_0:SubscribeToModel(var_1_13:GetModel(arg_1_1), var_1_14)
		arg_1_0:SubscribeToModel(var_1_12:GetModel(arg_1_1), var_1_14)

		local var_1_15

		local function var_1_16()
			local var_6_0 = var_1_10:GetValue(arg_1_1)

			if Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0) then
				var_1_3 = {
					"Screen1",
					"Screen2"
				}

				local var_6_1 = Game.DEJBCHBCIH(arg_1_1)
				local var_6_2 = WEAPON.GetBaseRef(var_6_1)

				var_1_1 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked).playerStats.weaponStats[var_6_2].kills:get()
				var_1_2 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked).playerStats.weaponStats[var_6_2].headShots:get()

				var_1_5()
			else
				var_1_3 = {
					"NoConnection",
					"NoConnection"
				}
			end

			arg_1_0.WeaponImage:setImage(RegisterMaterial(var_6_0), 0)

			arg_1_0:Wait(5000).onComplete = var_1_16
		end

		var_1_16()
		arg_1_0:SubscribeToModel(var_1_9:GetModel(arg_1_1), var_1_16)
		arg_1_0:SubscribeToModel(var_1_8:GetModel(arg_1_1), var_1_16)

		local var_1_17 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_17:GetModel(arg_1_1), function(arg_7_0)
			if DataModel.JJEHAEBDF(arg_7_0) ~= nil then
				if arg_1_0._currentSceneState == #var_1_3 then
					var_1_0 = 1
				else
					var_1_0 = arg_1_0._currentSceneState + 1
				end

				ACTIONS.AnimateSequence(arg_1_0, var_1_3[var_1_0])

				arg_1_0._currentSceneState = var_1_0

				var_1_16()
			end
		end)
	end
end

function WatchWeaponTracker(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_8_0.id = "WatchWeaponTracker"
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

	var_8_4.id = "BG"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.BG = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Radi"

	var_8_6:SetRGBFromInt(65291, 0)
	var_8_6:SetAlpha(0.25, 0)
	var_8_6:SetPixelGridEnabled(true)
	var_8_6:SetPixelGridContrast(0.4, 0)
	var_8_6:SetPixelGridBlockWidth(20, 0)
	var_8_6:SetPixelGridBlockHeight(20, 0)
	var_8_6:SetPixelGridGutterWidth(2, 0)
	var_8_6:SetPixelGridGutterHeight(2, 0)
	var_8_6:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_8_0:addElement(var_8_6)

	var_8_0.Radi = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "WeaponImage"

	var_8_8:setImage(RegisterMaterial("icon_weapon_ar_kilo433"), 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -206, _1080p * 206, _1080p * -156, _1080p * 50)
	var_8_0:addElement(var_8_8)

	var_8_0.WeaponImage = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIStyledText.new()

	var_8_10.id = "HeadshotCounter"

	var_8_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_10:SetAlpha(0, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetWordWrap(false)
	var_8_10:SetAlignment(LUI.Alignment.Center)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -206, _1080p * 206, _1080p * 306, _1080p * 426)
	var_8_0:addElement(var_8_10)

	var_8_0.HeadshotCounter = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "KillCounter"

	var_8_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetWordWrap(false)
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -206, _1080p * 206, _1080p * 306, _1080p * 426)
	var_8_0:addElement(var_8_12)

	var_8_0.KillCounter = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "Ping"

	var_8_14:SetAlpha(0, 0)
	var_8_14:setImage(RegisterMaterial("icon_scoreboard_ping_1"), 0)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -84, _1080p * 84, _1080p * -81, _1080p * -25)
	var_8_0:addElement(var_8_14)

	var_8_0.Ping = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIStyledText.new()

	var_8_16.id = "Noconnection"

	var_8_16:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_16:SetAlpha(0, 0)
	var_8_16:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_OFFLINE"), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_16:SetAlignment(LUI.Alignment.Center)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -216, _1080p * 216, _1080p * -256, _1080p * -186)
	var_8_0:addElement(var_8_16)

	var_8_0.Noconnection = var_8_16

	local function var_8_17()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_17

	local var_8_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		}
	}

	var_8_6:RegisterAnimationSequence("NoConnection", var_8_18)

	local var_8_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("NoConnection", var_8_19)

	local var_8_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("NoConnection", var_8_20)

	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("NoConnection", var_8_21)

	local var_8_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("NoConnection", var_8_22)

	local var_8_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("NoConnection", var_8_23)

	local function var_8_24()
		var_8_6:AnimateSequence("NoConnection")
		var_8_8:AnimateSequence("NoConnection")
		var_8_10:AnimateSequence("NoConnection")
		var_8_12:AnimateSequence("NoConnection")
		var_8_14:AnimateSequence("NoConnection")
		var_8_16:AnimateSequence("NoConnection")
	end

	var_8_0._sequences.NoConnection = var_8_24

	local var_8_25 = {
		{
			value = 65291,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Screen1", var_8_25)

	local var_8_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Screen1", var_8_26)

	local var_8_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Screen1", var_8_27)

	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Screen1", var_8_28)

	local var_8_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Screen1", var_8_29)

	local var_8_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Screen1", var_8_30)

	local function var_8_31()
		var_8_6:AnimateSequence("Screen1")
		var_8_8:AnimateSequence("Screen1")
		var_8_10:AnimateSequence("Screen1")
		var_8_12:AnimateSequence("Screen1")
		var_8_14:AnimateSequence("Screen1")
		var_8_16:AnimateSequence("Screen1")
	end

	var_8_0._sequences.Screen1 = var_8_31

	local var_8_32 = {
		{
			value = 16775680,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.25,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Screen2", var_8_32)

	local var_8_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Screen2", var_8_33)

	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Screen2", var_8_34)

	local var_8_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Screen2", var_8_35)

	local var_8_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Screen2", var_8_36)

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Screen2", var_8_37)

	local function var_8_38()
		var_8_6:AnimateSequence("Screen2")
		var_8_8:AnimateSequence("Screen2")
		var_8_10:AnimateSequence("Screen2")
		var_8_12:AnimateSequence("Screen2")
		var_8_14:AnimateSequence("Screen2")
		var_8_16:AnimateSequence("Screen2")
	end

	var_8_0._sequences.Screen2 = var_8_38

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WatchWeaponTracker", WatchWeaponTracker)
LockTable(_M)
