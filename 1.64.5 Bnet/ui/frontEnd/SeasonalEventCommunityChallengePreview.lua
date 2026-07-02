module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ImgPreview:setImage(RegisterMaterial(arg_1_1.nextUnlockImage))

	local var_1_0 = arg_1_1.isComplete or Dvar.IBEGCHEFE("lui_test_force_cm_ch_complete_" .. arg_1_1.id)
	local var_1_1 = not arg_1_1.isAvailable
	local var_1_2 = arg_1_1.challengeInfo.challengeFound and not Dvar.IBEGCHEFE("lui_test_force_cm_ch_locked_" .. arg_1_1.id)

	if var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, "Completed")
	elseif var_1_2 and not var_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Active")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Locked")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.ImgPreview)
	arg_2_0.ImgPreview:SetMask(arg_2_0.Mask)

	arg_2_0.SetupData = var_0_0
end

function SeasonalEventCommunityChallengePreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p)

	var_3_0.id = "SeasonalEventCommunityChallengePreview"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "ImgPreview"

	var_3_4:setImage(RegisterMaterial("logo_cod_wz_s4_event"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -71, _1080p * 78, 0, _1080p * 64)
	var_3_0:addElement(var_3_4)

	var_3_0.ImgPreview = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Mask"

	var_3_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64)
	var_3_0:addElement(var_3_6)

	var_3_0.Mask = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Darkener"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_8:SetAlpha(0.5, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64)
	var_3_0:addElement(var_3_8)

	var_3_0.Darkener = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Status"

	var_3_10:setImage(RegisterMaterial("hud_lock"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 39, _1080p * 60, _1080p * 6, _1080p * 27)
	var_3_0:addElement(var_3_10)

	var_3_0.Status = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_13)

	local var_3_14 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_14)

	local var_3_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_lock")
		}
	}

	var_3_10:RegisterAnimationSequence("Locked", var_3_15)

	local function var_3_16()
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_10:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_16

	local var_3_17
	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Completed", var_3_18)

	local var_3_19 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Completed", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_checkbox_checked")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_3_10:RegisterAnimationSequence("Completed", var_3_20)

	local function var_3_21()
		var_3_6:AnimateSequence("Completed")
		var_3_8:AnimateSequence("Completed")
		var_3_10:AnimateSequence("Completed")
	end

	var_3_0._sequences.Completed = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Active", var_3_23)

	local var_3_24 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Active", var_3_24)

	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_lock")
		}
	}

	var_3_10:RegisterAnimationSequence("Active", var_3_25)

	local function var_3_26()
		var_3_6:AnimateSequence("Active")
		var_3_8:AnimateSequence("Active")
		var_3_10:AnimateSequence("Active")
	end

	var_3_0._sequences.Active = var_3_26

	local var_3_27
	local var_3_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Standby", var_3_28)

	local var_3_29 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Standby", var_3_29)

	local var_3_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_playlist_match_time")
		}
	}

	var_3_10:RegisterAnimationSequence("Standby", var_3_30)

	local function var_3_31()
		var_3_6:AnimateSequence("Standby")
		var_3_8:AnimateSequence("Standby")
		var_3_10:AnimateSequence("Standby")
	end

	var_3_0._sequences.Standby = var_3_31

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SeasonalEventCommunityChallengePreview", SeasonalEventCommunityChallengePreview)
LockTable(_M)
