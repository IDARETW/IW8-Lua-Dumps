module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.UnlockDesc:setText(Engine.CBBHFCGDIC("CAS/LOCK_MSG", arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetText = var_0_0

	assert(arg_2_0.UnlockDesc)

	if IsLanguageOversizedFont() then
		arg_2_0.UnlockDesc:SetTop(_1080p * -8, 0)
		arg_2_0.UnlockDesc:SetBottom(_1080p * 8, 0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function UnlockCriteria(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 343 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "UnlockCriteria"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "UnlockDesc"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_4:setText("LOCKED", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 32, _1080p * 343, _1080p * -11, _1080p * 11)
	var_3_0:addElement(var_3_4)

	var_3_0.UnlockDesc = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Lock"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:setImage(RegisterMaterial("icon_lock"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_3_0:addElement(var_3_6)

	var_3_0.Lock = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hidden", var_3_9)

	local function var_3_10()
		var_3_4:AnimateSequence("Hidden")
	end

	var_3_0._sequences.Hidden = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Visible", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("Visible")
	end

	var_3_0._sequences.Visible = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_16

	local var_3_17
	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		}
	}

	var_3_4:RegisterAnimationSequence("Overkill", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_perk_slot_munitions_ui")
		}
	}

	var_3_6:RegisterAnimationSequence("Overkill", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("Overkill")
		var_3_6:AnimateSequence("Overkill")
	end

	var_3_0._sequences.Overkill = var_3_20

	local var_3_21
	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		}
	}

	var_3_4:RegisterAnimationSequence("LockState", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_lock")
		}
	}

	var_3_6:RegisterAnimationSequence("LockState", var_3_23)

	local function var_3_24()
		var_3_4:AnimateSequence("LockState")
		var_3_6:AnimateSequence("LockState")
	end

	var_3_0._sequences.LockState = var_3_24

	local function var_3_25()
		if var_3_0:GetDataSource().isUnlocked:GetValue(var_3_1) ~= nil and var_3_0:GetDataSource().isUnlocked:GetValue(var_3_1) == true then
			ACTIONS.AnimateSequence(var_3_0, "Hidden")
		end

		if var_3_0:GetDataSource().isUnlocked:GetValue(var_3_1) ~= nil and var_3_0:GetDataSource().isUnlocked:GetValue(var_3_1) == false then
			ACTIONS.AnimateSequence(var_3_0, "Visible")
		end
	end

	var_3_0:SubscribeToModelThroughElement(var_3_0, "isUnlocked", var_3_25)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("UnlockCriteria", UnlockCriteria)
LockTable(_M)
