module(..., package.seeall)

local var_0_0 = 64 * _1080p
local var_0_1 = 10 * _1080p
local var_0_2 = 280 * _1080p
local var_0_3 = 330 * _1080p

local function var_0_4(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1 = arg_1_2 or WEAPON.GenerateWeaponTableFromID(arg_1_0._controllerIndex, arg_1_1)
	local var_1_2 = WEAPON.GetDismembermentType(var_1_1)
	local var_1_3 = WEAPON.GetTracerType(arg_1_1)

	if var_1_2 and Loot.DEBEIFJEEG(arg_1_0._controllerIndex, arg_1_1) > 0 or var_1_2 and arg_1_1 == 0 then
		var_1_0 = var_1_2
	elseif var_1_3 then
		var_1_0 = var_1_3
	end

	if var_1_0 then
		local var_1_4 = WEAPON.GetSpecialAttributeName(var_1_0)
		local var_1_5 = WEAPON.GetSpecialAttributeIcon(var_1_0)
		local var_1_6 = WEAPON.GetSpecialAttributeIconColor(var_1_0)

		arg_1_0.Title:setText(Engine.CBBHFCGDIC(var_1_4))

		local var_1_7 = arg_1_0.Title:GetCurrentAnchorsAndPositions().left
		local var_1_8 = LAYOUT.GetTextWidth(arg_1_0.Title)
		local var_1_9 = 20 * _1080p

		if not Engine.DDJFBBJAIG() and var_0_0 + var_0_1 + var_1_8 > var_0_2 then
			arg_1_0.Title:SetRight(var_0_2 - var_0_1)
			arg_1_0.Backer:SetRight(var_0_2)
		else
			arg_1_0.Backer:SetRight(var_1_7 + var_1_8 + var_1_9)
		end

		if var_1_0 == WEAPON.SpecialAttribute.freedom.ref then
			ACTIONS.AnimateSequence(arg_1_0, "FreedomTracer")
		elseif var_1_0 == WEAPON.SpecialAttribute.shadow.ref then
			ACTIONS.AnimateSequence(arg_1_0, "ShadowTracer")
		elseif var_1_0 == WEAPON.SpecialAttribute.morte.ref then
			ACTIONS.AnimateSequence(arg_1_0, "MorteTracer")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Standard")
			arg_1_0.Backer:SetRGBFromTable(var_1_6)
		end

		arg_1_0.Icon:SetRGBFromTable(var_1_0 == var_1_3 and var_1_6 or COLORS.white)
		arg_1_0.Icon:setImage(RegisterMaterial(var_1_5))
		arg_1_0:SetAlpha(1)

		return true
	end

	return false
end

local function var_0_5(arg_2_0, arg_2_1)
	local var_2_0 = VEHICLE.GetAttributeType(arg_2_1)
	local var_2_1 = VEHICLE.GetSpecialAttributeName(var_2_0)
	local var_2_2 = VEHICLE.GetSpecialAttributeColor(var_2_0)

	arg_2_0.Icon:setImage(RegisterMaterial("icon_attribute_vehicle"))
	arg_2_0.Title:setText(Engine.CBBHFCGDIC(var_2_1))
	arg_2_0:SetAlpha(1)

	local var_2_3 = arg_2_0.Title:GetCurrentAnchorsAndPositions().left
	local var_2_4 = LAYOUT.GetTextWidth(arg_2_0.Title)
	local var_2_5 = 20 * _1080p

	if var_0_0 + var_0_1 + var_2_4 > var_0_3 then
		arg_2_0.Title:SetRight(var_0_3 - var_0_1)
		arg_2_0.Backer:SetRight(var_0_3)
	else
		arg_2_0.Backer:SetRight(var_2_3 + var_2_4 + var_2_5)
	end

	if var_2_0 == VEHICLE.SpecialAttribute.flightTrailShadow.ref then
		ACTIONS.AnimateSequence(arg_2_0, "ShadowTracer")
	else
		ACTIONS.AnimateSequence(arg_2_0, "Standard")
		arg_2_0.Backer:SetRGBFromTable(var_2_2)
	end

	return true
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.SetupWeaponAttribute = var_0_4
	arg_3_0.SetupVehicleAttribute = var_0_5
end

function SpecialWeaponAttributeWithText(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "SpecialWeaponAttributeWithText"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Icon"

	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_4)

	var_4_0.Icon = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Backer"

	var_4_6:SetAlpha(0.5, 0)
	var_4_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 68, _1080p * 400, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_6)

	var_4_0.Backer = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_8:SetStartupDelay(2000)
	var_4_8:SetLineHoldTime(400)
	var_4_8:SetAnimMoveTime(2000)
	var_4_8:SetAnimMoveSpeed(150)
	var_4_8:SetEndDelay(2000)
	var_4_8:SetCrossfadeTime(250)
	var_4_8:SetFadeInTime(300)
	var_4_8:SetFadeOutTime(300)
	var_4_8:SetMaxVisibleLines(1)
	var_4_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 74, _1080p * 394, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_11)

	local function var_4_12()
		var_4_8:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_12

	local var_4_13
	local var_4_14 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.objectiveComplete
		}
	}

	var_4_6:RegisterAnimationSequence("ShadowTracer", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("ShadowTracer")
	end

	var_4_0._sequences.ShadowTracer = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.red
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.red
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.shadow,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.shadow
		},
		{
			duration = 990,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.blue,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 1010,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.blue
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.red,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_4_6:RegisterAnimationSequence("FreedomTracerFancy", var_4_17)

	local function var_4_18()
		var_4_6:AnimateLoop("FreedomTracerFancy")
	end

	var_4_0._sequences.FreedomTracerFancy = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Standard", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("Standard")
	end

	var_4_0._sequences.Standard = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.blue
		}
	}

	var_4_6:RegisterAnimationSequence("FreedomTracer", var_4_23)

	local function var_4_24()
		var_4_6:AnimateSequence("FreedomTracer")
	end

	var_4_0._sequences.FreedomTracer = var_4_24

	local var_4_25
	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.green
		}
	}

	var_4_6:RegisterAnimationSequence("MorteTracer", var_4_26)

	local function var_4_27()
		var_4_6:AnimateSequence("MorteTracer")
	end

	var_4_0._sequences.MorteTracer = var_4_27

	var_0_6(var_4_0, var_4_1, arg_4_1)

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(var_4_0, "AR")
	end

	return var_4_0
end

MenuBuilder.registerType("SpecialWeaponAttributeWithText", SpecialWeaponAttributeWithText)
LockTable(_M)
