module(..., package.seeall)

local var_0_0 = 8 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)

	arg_1_0.enabled = arg_1_1
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0.Text:setText(arg_2_1)

	local var_2_0 = LAYOUT.GetTextWidth(arg_2_0.Text) + arg_2_0.Text:GetCurrentAnchorsAndPositions().left + var_0_0

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_2_0.WZWipBacker:SetRight(var_2_0)
	else
		arg_2_0.Backer:SetRight(var_2_0)
	end

	return var_2_0
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateVisibility = var_0_1
	arg_3_0.InitializeText = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	THEMES.ApplyRandomMaskRotation(arg_3_0, {
		elementToMask = arg_3_0.WZWipBacker
	})

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
end

function EquippedWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "EquippedWidget"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_4_3 = LUI.UIImage.new()
		var_4_3.id = "Backer"

		var_4_3:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
		var_4_3:SetAlpha(0.55, 0)
		var_4_3:SetPixelGridEnabled(true)
		var_4_3:SetPixelGridContrast(0.5, 0)
		var_4_3:SetPixelGridBlockWidth(2, 0)
		var_4_3:SetPixelGridBlockHeight(2, 0)
		var_4_3:SetPixelGridGutterWidth(1, 0)
		var_4_3:SetPixelGridGutterHeight(1, 0)
		var_4_3:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 38, _1080p * 136, 0, 0)
		var_4_0:addElement(var_4_3)

		var_4_0.Backer = var_4_3
	end

	local var_4_4

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_4_4 = LUI.UIImage.new()
		var_4_4.id = "WZWipBacker"

		var_4_4:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
		var_4_4:SetAlpha(0.55, 0)
		var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 38, _1080p * 136, 0, 0)
		var_4_0:addElement(var_4_4)

		var_4_0.WZWipBacker = var_4_4
	end

	local var_4_5

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_4_5 = LUI.UIImage.new()
		var_4_5.id = "Cap"

		var_4_5:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
		var_4_5:SetAlpha(0.55, 0)
		var_4_5:SetPixelGridEnabled(true)
		var_4_5:SetPixelGridContrast(0.5, 0)
		var_4_5:SetPixelGridBlockWidth(2, 0)
		var_4_5:SetPixelGridBlockHeight(2, 0)
		var_4_5:SetPixelGridGutterWidth(1, 0)
		var_4_5:SetPixelGridGutterHeight(1, 0)
		var_4_5:setImage(RegisterMaterial("cac_equip_cap"), 0)
		var_4_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 38, 0, _1080p * 30)
		var_4_0:addElement(var_4_5)

		var_4_0.Cap = var_4_5
	end

	local var_4_6

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_4_6 = LUI.UIImage.new()
		var_4_6.id = "WZWipCap"

		var_4_6:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
		var_4_6:SetAlpha(0.55, 0)
		var_4_6:setImage(RegisterMaterial("cac_equip_cap"), 0)
		var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 38, 0, _1080p * 30)
		var_4_0:addElement(var_4_6)

		var_4_0.WZWipCap = var_4_6
	end

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Fill"

	var_4_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, 0, _1080p * 30)
	var_4_0:addElement(var_4_8)

	var_4_0.Fill = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Text"

	var_4_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_4_10:SetAlpha(0.8, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 38, _1080p * 126, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_10)

	var_4_0.Text = var_4_10

	local var_4_11

	if CONDITIONS.IsVanguardRevealed() then
		var_4_11 = LUI.UIImage.new()
		var_4_11.id = "Mask"

		var_4_11:SetAlpha(0, 0)
		var_4_11:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
		var_4_0:addElement(var_4_11)

		var_4_0.Mask = var_4_11
	end

	local function var_4_12()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_12

	local var_4_13

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_14 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 333,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.snap
			},
			{
				value = 0.55,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_4_3:RegisterAnimationSequence("TurnOn", var_4_14)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_15 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 333,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.snap
			},
			{
				value = 0.55,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_4_5:RegisterAnimationSequence("TurnOn", var_4_15)
	end

	local var_4_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_8:RegisterAnimationSequence("TurnOn", var_4_16)

	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.8,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_10:RegisterAnimationSequence("TurnOn", var_4_17)

	local function var_4_18()
		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_3:AnimateSequence("TurnOn")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("TurnOn")
		end

		var_4_8:AnimateSequence("TurnOn")
		var_4_10:AnimateSequence("TurnOn")
	end

	var_4_0._sequences.TurnOn = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_20)

	local function var_4_21()
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_21

	local var_4_22

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_23 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_4:RegisterAnimationSequence("WZWipSetup", var_4_23)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_24 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3VanguardGold
			}
		}

		var_4_5:RegisterAnimationSequence("WZWipSetup", var_4_24)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_25 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipSetup", var_4_25)
	end

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipSetup", var_4_27)

	if CONDITIONS.IsVanguardRevealed() then
		local var_4_28 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipSetup", var_4_28)
	end

	local function var_4_29()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_4_4:AnimateSequence("WZWipSetup")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("WZWipSetup")
		end

		var_4_8:AnimateSequence("WZWipSetup")
		var_4_10:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsVanguardRevealed() then
			var_4_11:AnimateSequence("WZWipSetup")
		end
	end

	var_4_0._sequences.WZWipSetup = var_4_29

	local var_4_30

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.55,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_4:RegisterAnimationSequence("WZWipTurnOn", var_4_31)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_32 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.55,
				duration = 270,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipTurnOn", var_4_32)
	end

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipTurnOn", var_4_33)

	local var_4_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipTurnOn", var_4_34)

	local function var_4_35()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_4_4:AnimateSequence("WZWipTurnOn")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("WZWipTurnOn")
		end

		var_4_8:AnimateSequence("WZWipTurnOn")
		var_4_10:AnimateSequence("WZWipTurnOn")
	end

	var_4_0._sequences.WZWipTurnOn = var_4_35

	local var_4_36

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_37 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("TurnOff", var_4_37)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_38 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_4:RegisterAnimationSequence("TurnOff", var_4_38)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("TurnOff", var_4_39)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("TurnOff", var_4_40)
	end

	local var_4_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("TurnOff", var_4_41)

	local var_4_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("TurnOff", var_4_42)

	local function var_4_43()
		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_3:AnimateSequence("TurnOff")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_4_4:AnimateSequence("TurnOff")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_4_5:AnimateSequence("TurnOff")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_4_6:AnimateSequence("TurnOff")
		end

		var_4_8:AnimateSequence("TurnOff")
		var_4_10:AnimateSequence("TurnOff")
	end

	var_4_0._sequences.TurnOff = var_4_43

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("EquippedWidget", EquippedWidget)
LockTable(_M)
