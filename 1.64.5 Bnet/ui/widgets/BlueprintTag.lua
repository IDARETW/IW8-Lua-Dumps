module(..., package.seeall)

local var_0_0 = 14 * _1080p
local var_0_1 = 3 * _1080p

local function var_0_2(arg_1_0)
	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.BlueprintText) + arg_1_0.BlueprintText:GetCurrentAnchorsAndPositions().left + var_0_0

	arg_1_0.Backer:SetRight(var_1_0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_1_0.WZWipBacker:SetRight(var_1_0 + var_0_1)
	end

	return var_1_0
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = "Bundle"

	if arg_2_2 then
		arg_2_0.BlueprintText:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT"))
	elseif arg_2_1 then
		var_2_0 = "Blueprint"

		arg_2_0.BlueprintText:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT"))
	else
		var_2_0 = "Mod"

		arg_2_0.BlueprintText:setText(Engine.CBBHFCGDIC("CAS/MODIFICATION"))
	end

	WZWIP.AnimateThemeElement(arg_2_0, var_2_0)

	return arg_2_0:UpdateTag()
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0.BlueprintText:setText(arg_3_1)

	return arg_3_0:UpdateTag()
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetBlueprint = var_0_3
	arg_4_0.UpdateTag = var_0_2
	arg_4_0.SetBlueprintText = var_0_4

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end

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

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_5_3 = LUI.UIImage.new()
		var_5_3.id = "WZWipBacker"

		var_5_3:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
		var_5_3:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 136, 0, 0)
		var_5_0:addElement(var_5_3)

		var_5_0.WZWipBacker = var_5_3
	end

	local var_5_4
	local var_5_5 = LUI.UIImage.new()

	var_5_5.id = "Backer"

	var_5_5:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_5_5:SetPixelGridEnabled(true)
	var_5_5:SetPixelGridContrast(0.5, 0)
	var_5_5:SetPixelGridBlockWidth(2, 0)
	var_5_5:SetPixelGridBlockHeight(2, 0)
	var_5_5:SetPixelGridGutterWidth(1, 0)
	var_5_5:SetPixelGridGutterHeight(1, 0)
	var_5_5:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 136, 0, 0)
	var_5_0:addElement(var_5_5)

	var_5_0.Backer = var_5_5

	local var_5_6
	local var_5_7 = LUI.UIStyledText.new()

	var_5_7.id = "BlueprintText"

	var_5_7:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_7:SetAlpha(0.8, 0)
	var_5_7:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT"), 0)
	var_5_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_7:SetWordWrap(false)
	var_5_7:SetAlignment(LUI.Alignment.Left)
	var_5_7:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 37, _1080p * 136, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_7)

	var_5_0.BlueprintText = var_5_7

	local var_5_8
	local var_5_9 = LUI.UIImage.new()

	var_5_9.id = "BlueprintIcon"

	var_5_9:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_9:SetAlpha(0.8, 0)
	var_5_9:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_5_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 29, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_9)

	var_5_0.BlueprintIcon = var_5_9

	local function var_5_10()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_10

	local var_5_11
	local var_5_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorMid
		}
	}

	var_5_5:RegisterAnimationSequence("Blueprint", var_5_12)

	local var_5_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_7:RegisterAnimationSequence("Blueprint", var_5_13)

	local var_5_14 = {
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

	var_5_9:RegisterAnimationSequence("Blueprint", var_5_14)

	local function var_5_15()
		var_5_5:AnimateSequence("Blueprint")
		var_5_7:AnimateSequence("Blueprint")
		var_5_9:AnimateSequence("Blueprint")
	end

	var_5_0._sequences.Blueprint = var_5_15

	local var_5_16
	local var_5_17 = {
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

	var_5_5:RegisterAnimationSequence("Mod", var_5_17)

	local var_5_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_7:RegisterAnimationSequence("Mod", var_5_18)

	local var_5_19 = {
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

	var_5_9:RegisterAnimationSequence("Mod", var_5_19)

	local function var_5_20()
		var_5_5:AnimateSequence("Mod")
		var_5_7:AnimateSequence("Mod")
		var_5_9:AnimateSequence("Mod")
	end

	var_5_0._sequences.Mod = var_5_20

	local var_5_21
	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1
		}
	}

	var_5_5:RegisterAnimationSequence("Bundle", var_5_22)

	local var_5_23 = {
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

	var_5_7:RegisterAnimationSequence("Bundle", var_5_23)

	local var_5_24 = {
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

	var_5_9:RegisterAnimationSequence("Bundle", var_5_24)

	local function var_5_25()
		var_5_5:AnimateSequence("Bundle")
		var_5_7:AnimateSequence("Bundle")
		var_5_9:AnimateSequence("Bundle")
	end

	var_5_0._sequences.Bundle = var_5_25

	local var_5_26

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_5_27 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MPArmory.bundleGlow1
			}
		}

		var_5_3:RegisterAnimationSequence("WZWipBundle", var_5_27)
	end

	local var_5_28 = {
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

	var_5_7:RegisterAnimationSequence("WZWipBundle", var_5_28)

	local var_5_29 = {
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

	var_5_9:RegisterAnimationSequence("WZWipBundle", var_5_29)

	local function var_5_30()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_5_3:AnimateSequence("WZWipBundle")
		end

		var_5_7:AnimateSequence("WZWipBundle")
		var_5_9:AnimateSequence("WZWipBundle")
	end

	var_5_0._sequences.WZWipBundle = var_5_30

	local var_5_31

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_5_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColorMid
			}
		}

		var_5_3:RegisterAnimationSequence("WZWipBlueprint", var_5_32)
	end

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_7:RegisterAnimationSequence("WZWipBlueprint", var_5_33)

	local var_5_34 = {
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

	var_5_9:RegisterAnimationSequence("WZWipBlueprint", var_5_34)

	local function var_5_35()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_5_3:AnimateSequence("WZWipBlueprint")
		end

		var_5_7:AnimateSequence("WZWipBlueprint")
		var_5_9:AnimateSequence("WZWipBlueprint")
	end

	var_5_0._sequences.WZWipBlueprint = var_5_35

	local var_5_36

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_5_37 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.AAR.AARdescription
			}
		}

		var_5_3:RegisterAnimationSequence("WZWipMod", var_5_37)
	end

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_7:RegisterAnimationSequence("WZWipMod", var_5_38)

	local var_5_39 = {
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

	var_5_9:RegisterAnimationSequence("WZWipMod", var_5_39)

	local function var_5_40()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_5_3:AnimateSequence("WZWipMod")
		end

		var_5_7:AnimateSequence("WZWipMod")
		var_5_9:AnimateSequence("WZWipMod")
	end

	var_5_0._sequences.WZWipMod = var_5_40

	local var_5_41
	local var_5_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_5:RegisterAnimationSequence("WZWipSetup", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_7:RegisterAnimationSequence("WZWipSetup", var_5_43)

	local function var_5_44()
		var_5_5:AnimateSequence("WZWipSetup")
		var_5_7:AnimateSequence("WZWipSetup")
	end

	var_5_0._sequences.WZWipSetup = var_5_44

	var_0_5(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BlueprintTag", BlueprintTag)
LockTable(_M)
