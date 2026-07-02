module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = "none"

	if CONDITIONS.InFrontend() then
		local var_1_1 = LOADOUT.GetFavoriteLoadoutWeapons(arg_1_1)

		if var_1_1 and var_1_1.primaryWeaponRef then
			var_1_0 = var_1_1.primaryWeaponRef
		end
	elseif Engine.DBEJJAFIAI(arg_1_1) and CONDITIONS.IsPublicMatch(arg_1_0) then
		var_1_0 = Game.DEJBCHBCIH(arg_1_1)
		var_1_0 = WEAPON.GetBaseRef(var_1_0)
	end

	if not WEAPON.IsWeaponNoneValue(var_1_0) then
		if CONDITIONS.InFrontend() then
			local var_1_2 = WEAPON.GetBWImage(var_1_0)

			arg_1_0.WeaponImage:setImage(RegisterMaterial(var_1_2), 0)
		else
			local var_1_3 = DataSources.inGame.player.currentWeapon.image:GetValue(arg_1_1)

			arg_1_0.WeaponImage:setImage(RegisterMaterial(var_1_3), 0)
		end

		local var_1_4 = PROGRESSION.GetWeaponLevel(arg_1_1, var_1_0)

		arg_1_0.RankNum:setText(var_1_4)

		local var_1_5 = PROGRESSION.GetWeaponXPPercent(arg_1_1, var_1_0)

		arg_1_0.Progress:SetProgressInC(var_1_5, 0, 0)
		ACTIONS.AnimateSequence(arg_1_0, "ShowWeapon")
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideWeapon")
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.RankNum)

	local var_2_0

	local function var_2_1()
		arg_2_0:Wait(var_0_0).onComplete = var_2_1

		var_0_1(arg_2_0, arg_2_1)
	end

	var_2_1()

	if CONDITIONS.InFrontend() then
		arg_2_0.Backer:setImage(RegisterMaterial("ui_prog_radial_whole"))
		arg_2_0.Progress:setImage(RegisterMaterial("ui_prog_radial_segment"))
	else
		arg_2_0.Backer:setImage(RegisterMaterial("hud_field_upgrade_radial_background"))
		arg_2_0.Progress:setImage(RegisterMaterial("hud_field_upgrade_radial_segment"))
		arg_2_0:SubscribeToModel(DataSources.inGame.player.currentWeapon.displayName:GetModel(arg_2_1), function()
			var_0_1(arg_2_0, arg_2_1)
		end, true)
		arg_2_0:addEventHandler("weapon_ranked_up", function(arg_5_0, arg_5_1)
			var_0_1(arg_2_0, arg_2_1)
			ACTIONS.AnimateSequence(arg_2_0, "RankUp")
			Engine.BJDBIAGIDA("watch_rank_up")
		end)
	end
end

function WatchWeaponRankT9(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_6_0.id = "WatchWeaponRankT9"
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

	var_6_4.id = "Backer"

	var_6_4:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_6_4:SetAlpha(0.2, 0)
	var_6_4:setImage(RegisterMaterial("ui_prog_radial_whole"), 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 14, _1080p * -14, _1080p * 14, _1080p * -14)
	var_6_0:addElement(var_6_4)

	var_6_0.Backer = var_6_4

	local var_6_5
	local var_6_6 = {
		segmentMaterial = "ui_prog_radial_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_6_1
	}
	local var_6_7 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_6_6)

	var_6_7.id = "Progress"

	var_6_7:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_6_7:setImage(RegisterMaterial("ui_prog_radial_segment"), 0)
	var_6_7:SetProgress(0.9)
	var_6_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 14, _1080p * -14, _1080p * 14, _1080p * -14)
	var_6_0:addElement(var_6_7)

	var_6_0.Progress = var_6_7

	local var_6_8
	local var_6_9 = LUI.UIText.new()

	var_6_9.id = "RankNum"

	var_6_9:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_9:setText("0", 0)
	var_6_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_9:SetAlignment(LUI.Alignment.Center)
	var_6_9:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_6_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -180, _1080p * 180, _1080p * -109, _1080p * 11)
	var_6_0:addElement(var_6_9)

	var_6_0.RankNum = var_6_9

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "WeaponImage"

	var_6_11:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_6_11:SetColorOp(COLOR_OP.saturation, 0)
	var_6_11:setImage(RegisterMaterial("icon_weapon_ar_kilo433"), 0)
	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 123, _1080p * 389, _1080p * 284, _1080p * 412)
	var_6_0:addElement(var_6_11)

	var_6_0.WeaponImage = var_6_11

	local function var_6_12()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_12

	local var_6_13
	local var_6_14 = {
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

	var_6_4:RegisterAnimationSequence("RankUp", var_6_14)

	local var_6_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
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

	var_6_9:RegisterAnimationSequence("RankUp", var_6_15)

	local function var_6_16()
		var_6_4:AnimateSequence("RankUp")
		var_6_9:AnimateSequence("RankUp")
	end

	var_6_0._sequences.RankUp = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_7:RegisterAnimationSequence("ShowWeapon", var_6_18)

	local var_6_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("ShowWeapon", var_6_19)

	local var_6_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ShowWeapon", var_6_20)

	local function var_6_21()
		var_6_7:AnimateSequence("ShowWeapon")
		var_6_9:AnimateSequence("ShowWeapon")
		var_6_11:AnimateSequence("ShowWeapon")
	end

	var_6_0._sequences.ShowWeapon = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_7:RegisterAnimationSequence("HideWeapon", var_6_23)

	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("HideWeapon", var_6_24)

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("HideWeapon", var_6_25)

	local function var_6_26()
		var_6_7:AnimateSequence("HideWeapon")
		var_6_9:AnimateSequence("HideWeapon")
		var_6_11:AnimateSequence("HideWeapon")
	end

	var_6_0._sequences.HideWeapon = var_6_26

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WatchWeaponRankT9", WatchWeaponRankT9)
LockTable(_M)
