module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.UnlockDesc:setText(Engine.CBBHFCGDIC("CAS/LOCK_MSG", arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.UnlockDesc:setText(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetText = var_0_0
	arg_3_0.SetUnlockText = var_0_1

	assert(arg_3_0.UnlockDesc)

	if IsLanguageOversizedFont() then
		arg_3_0.UnlockDesc:SetTop(_1080p * -8, 0)
		arg_3_0.UnlockDesc:SetBottom(_1080p * 8, 0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function UnlockCriteria(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 343 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "UnlockCriteria"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "UnlockDesc"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_4:setText("LOCKED", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 32, _1080p * 343, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_4)

	var_4_0.UnlockDesc = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Lock"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_6:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_6)

	var_4_0.Lock = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Hidden", var_4_9)

	local function var_4_10()
		var_4_4:AnimateSequence("Hidden")
	end

	var_4_0._sequences.Hidden = var_4_10

	local var_4_11
	local var_4_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Visible", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("Visible")
	end

	var_4_0._sequences.Visible = var_4_13

	local var_4_14
	local var_4_15 = {
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

	var_4_4:RegisterAnimationSequence("AR", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_16

	local var_4_17
	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		}
	}

	var_4_4:RegisterAnimationSequence("Overkill", var_4_18)

	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_perk_slot_munitions_ui")
		}
	}

	var_4_6:RegisterAnimationSequence("Overkill", var_4_19)

	local function var_4_20()
		var_4_4:AnimateSequence("Overkill")
		var_4_6:AnimateSequence("Overkill")
	end

	var_4_0._sequences.Overkill = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		}
	}

	var_4_4:RegisterAnimationSequence("LockState", var_4_22)

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_lock")
		}
	}

	var_4_6:RegisterAnimationSequence("LockState", var_4_23)

	local function var_4_24()
		var_4_4:AnimateSequence("LockState")
		var_4_6:AnimateSequence("LockState")
	end

	var_4_0._sequences.LockState = var_4_24

	local function var_4_25()
		if var_4_0:GetDataSource().isUnlocked:GetValue(var_4_1) ~= nil and var_4_0:GetDataSource().isUnlocked:GetValue(var_4_1) == true then
			ACTIONS.AnimateSequence(var_4_0, "Hidden")
		end

		if var_4_0:GetDataSource().isUnlocked:GetValue(var_4_1) ~= nil and var_4_0:GetDataSource().isUnlocked:GetValue(var_4_1) == false then
			ACTIONS.AnimateSequence(var_4_0, "Visible")
		end
	end

	var_4_0:SubscribeToModelThroughElement(var_4_0, "isUnlocked", var_4_25)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("UnlockCriteria", UnlockCriteria)
LockTable(_M)
