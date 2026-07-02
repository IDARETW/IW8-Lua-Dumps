module(..., package.seeall)

local var_0_0 = 14 * _1080p

local function var_0_1(arg_1_0)
	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.BlueprintText) + arg_1_0.BlueprintText:GetCurrentAnchorsAndPositions().left + var_0_0

	arg_1_0.Backer:SetRight(var_1_0)

	return var_1_0
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 then
		ACTIONS.AnimateSequence(arg_2_0, "Bundle")
		arg_2_0.BlueprintText:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT"))
	elseif arg_2_1 then
		ACTIONS.AnimateSequence(arg_2_0, "Blueprint")
		arg_2_0.BlueprintText:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT"))
	else
		ACTIONS.AnimateSequence(arg_2_0, "Mod")
		arg_2_0.BlueprintText:setText(Engine.CBBHFCGDIC("CAS/MODIFICATION"))
	end

	return arg_2_0:UpdateTag()
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0.BlueprintText:setText(arg_3_1)

	return arg_3_0:UpdateTag()
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetBlueprint = var_0_2
	arg_4_0.UpdateTag = var_0_1
	arg_4_0.SetBlueprintText = var_0_3

	arg_4_0:UpdateTag()
end

function BlueprintTag(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 30 * _1080p)

	var_5_0.id = "BlueprintTag"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Backer"

	var_5_4:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_5_4:SetPixelGridEnabled(true)
	var_5_4:SetPixelGridContrast(0.5, 0)
	var_5_4:SetPixelGridBlockWidth(2, 0)
	var_5_4:SetPixelGridBlockHeight(2, 0)
	var_5_4:SetPixelGridGutterWidth(1, 0)
	var_5_4:SetPixelGridGutterHeight(1, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 136, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Backer = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "BlueprintText"

	var_5_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_6:SetAlpha(0.8, 0)
	var_5_6:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT"), 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetWordWrap(false)
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 37, _1080p * 136, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_6)

	var_5_0.BlueprintText = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "BlueprintIcon"

	var_5_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_8:SetAlpha(0.8, 0)
	var_5_8:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 29, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_8)

	var_5_0.BlueprintIcon = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10
	local var_5_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorMid
		}
	}

	var_5_4:RegisterAnimationSequence("Blueprint", var_5_11)

	local var_5_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_6:RegisterAnimationSequence("Blueprint", var_5_12)

	local var_5_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_blueprint")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_8:RegisterAnimationSequence("Blueprint", var_5_13)

	local function var_5_14()
		var_5_4:AnimateSequence("Blueprint")
		var_5_6:AnimateSequence("Blueprint")
		var_5_8:AnimateSequence("Blueprint")
	end

	var_5_0._sequences.Blueprint = var_5_14

	local var_5_15
	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Mod", var_5_16)

	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_6:RegisterAnimationSequence("Mod", var_5_17)

	local var_5_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_mod")
		}
	}

	var_5_8:RegisterAnimationSequence("Mod", var_5_18)

	local function var_5_19()
		var_5_4:AnimateSequence("Mod")
		var_5_6:AnimateSequence("Mod")
		var_5_8:AnimateSequence("Mod")
	end

	var_5_0._sequences.Mod = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1
		}
	}

	var_5_4:RegisterAnimationSequence("Bundle", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Bundle", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_blueprint_bundle")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_8:RegisterAnimationSequence("Bundle", var_5_23)

	local function var_5_24()
		var_5_4:AnimateSequence("Bundle")
		var_5_6:AnimateSequence("Bundle")
		var_5_8:AnimateSequence("Bundle")
	end

	var_5_0._sequences.Bundle = var_5_24

	var_0_4(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BlueprintTag", BlueprintTag)
LockTable(_M)
