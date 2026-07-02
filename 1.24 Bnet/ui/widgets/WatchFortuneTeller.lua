module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		"LUA_MENU/FORTUNE_01",
		"LUA_MENU/FORTUNE_02",
		"LUA_MENU/FORTUNE_03",
		"LUA_MENU/FORTUNE_04",
		"LUA_MENU/FORTUNE_05",
		"LUA_MENU/FORTUNE_06",
		"LUA_MENU/FORTUNE_07",
		"LUA_MENU/FORTUNE_08",
		"LUA_MENU/FORTUNE_09",
		"LUA_MENU/FORTUNE_10",
		"LUA_MENU/FORTUNE_11",
		"LUA_MENU/FORTUNE_12"
	}

	if Engine.DDJFBBJAIG() then
		local var_1_1

		local function var_1_2()
			arg_1_0:Wait(10000).onComplete = var_1_2
			arg_1_0:Wait(6000).onComplete = function()
				local var_3_0 = math.random(1, #var_1_0)

				ACTIONS.AnimateSequence(arg_1_0, "Shook")
				arg_1_0.Fortune:setText(Engine.CBBHFCGDIC(var_1_0[var_3_0]))
			end
		end

		var_1_2()
	else
		local var_1_3 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_3:GetModel(arg_1_1), function(arg_4_0)
			if DataModel.JJEHAEBDF(arg_4_0) ~= nil then
				local var_4_0 = math.random(1, #var_1_0)

				ACTIONS.AnimateSequence(arg_1_0, "Shook")
				arg_1_0.Fortune:setText(Engine.CBBHFCGDIC(var_1_0[var_4_0]))
			end
		end)

		if not CONDITIONS.IsThirdGameMode() then
			local var_1_4 = DataSources.inGame.player.spawnNotify:GetModel(arg_1_1)

			arg_1_0:SubscribeToModel(var_1_4, function()
				ACTIONS.AnimateSequence(arg_1_0, "Reset")
				arg_1_0.Fortune:setText(Engine.CBBHFCGDIC("LUA_MENU/FORTUNE_SHAKE"))
			end)
		end
	end
end

function WatchFortuneTeller(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_6_0.id = "WatchFortuneTeller"
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

	var_6_6.id = "Radi"

	var_6_6:SetRGBFromInt(10158335, 0)
	var_6_6:SetAlpha(0.25, 0)
	var_6_6:SetPixelGridEnabled(true)
	var_6_6:SetPixelGridContrast(0.95, 0)
	var_6_6:SetPixelGridBlockWidth(8, 0)
	var_6_6:SetPixelGridBlockHeight(8, 0)
	var_6_6:SetPixelGridGutterWidth(2, 0)
	var_6_6:SetPixelGridGutterHeight(2, 0)
	var_6_6:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Radi = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Radi2"

	var_6_8:SetRGBFromInt(0, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:SetPixelGridEnabled(true)
	var_6_8:SetPixelGridContrast(0.95, 0)
	var_6_8:SetPixelGridBlockWidth(8, 0)
	var_6_8:SetPixelGridBlockHeight(8, 0)
	var_6_8:SetPixelGridGutterWidth(2, 0)
	var_6_8:SetPixelGridGutterHeight(2, 0)
	var_6_8:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 221, _1080p * -221, _1080p * 221, _1080p * -221)
	var_6_0:addElement(var_6_8)

	var_6_0.Radi2 = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "Fortune"

	var_6_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_10:setText(Engine.CBBHFCGDIC("LUA_MENU/FORTUNE_SHAKE"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_10:SetStartupDelay(2000)
	var_6_10:SetLineHoldTime(0)
	var_6_10:SetAnimMoveTime(2000)
	var_6_10:SetAnimMoveSpeed(50)
	var_6_10:SetEndDelay(2000)
	var_6_10:SetCrossfadeTime(400)
	var_6_10:SetFadeInTime(300)
	var_6_10:SetFadeOutTime(300)
	var_6_10:SetMaxVisibleLines(5)
	var_6_10:SetShadowMinDistance(0, 0)
	var_6_10:SetShadowMaxDistance(0, 0)
	var_6_10:SetShadowUOffset(0.02, 0)
	var_6_10:SetShadowVOffset(0.02, 0)
	var_6_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 448, _1080p * 221, _1080p * 291)
	var_6_0:addElement(var_6_10)

	var_6_0.Fortune = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "FX"

	var_6_12:SetAlpha(0, 0)
	var_6_12:setImage(RegisterMaterial("icon_chyron_fx"), 0)
	var_6_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256)
	var_6_0:addElement(var_6_12)

	var_6_0.FX = var_6_12

	local function var_6_13()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_13

	local var_6_14
	local var_6_15 = {
		{
			value = 10158335,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 1200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.VibrantTeal,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.2,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_6_6:RegisterAnimationSequence("Shook", var_6_15)

	local var_6_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 1100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6,
			duration = 700,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		}
	}

	var_6_8:RegisterAnimationSequence("Shook", var_6_16)

	local var_6_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Shook", var_6_17)

	local var_6_18 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Shook", var_6_18)

	local function var_6_19()
		var_6_6:AnimateSequence("Shook")
		var_6_8:AnimateSequence("Shook")
		var_6_10:AnimateSequence("Shook")
		var_6_12:AnimateSequence("Shook")
	end

	var_6_0._sequences.Shook = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			value = 10158335,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_6:RegisterAnimationSequence("Reset", var_6_21)

	local var_6_22 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Reset", var_6_22)

	local var_6_23 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Reset", var_6_23)

	local function var_6_24()
		var_6_6:AnimateSequence("Reset")
		var_6_10:AnimateSequence("Reset")
		var_6_12:AnimateSequence("Reset")
	end

	var_6_0._sequences.Reset = var_6_24

	var_0_0(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "Rotate")

	return var_6_0
end

MenuBuilder.registerType("WatchFortuneTeller", WatchFortuneTeller)
LockTable(_M)
