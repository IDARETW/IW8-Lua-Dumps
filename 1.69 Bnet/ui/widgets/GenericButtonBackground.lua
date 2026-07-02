module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		WZWIP.AnimateThemeElement(arg_1_0, arg_1_1, {
			doSnapToState = arg_1_2
		})
	end
end

local function var_0_0(arg_2_0, arg_2_1)
	if not arg_2_0._textureLayerSet and arg_2_0.TextureLayer then
		if arg_2_1 == LUI.Alignment.Left or arg_2_1 == LUI.Alignment.Right then
			arg_2_0._gradientMaterial = "button_gradient"
		else
			arg_2_0._gradientMaterial = "widg_gradient_center_out"
		end

		arg_2_0.TextureLayer:setImage(RegisterMaterial(arg_2_0._gradientMaterial))

		arg_2_0._textureLayerSet = true
	end
end

function SetupButton(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not arg_3_0.TextGlow then
		return
	end

	local var_3_0 = 80

	if arg_3_3 == LUI.Alignment.Left then
		arg_3_0.TextGlow:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -20, _1080p * 250, _1080p * -18, _1080p * 18)
	elseif arg_3_3 == LUI.Alignment.Right then
		arg_3_0.TextGlow:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -250, _1080p * 20, _1080p * -18, _1080p * 18)
	else
		arg_3_0.TextGlow:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -64, _1080p * 64, _1080p * -18, _1080p * 18)
	end

	var_0_0(arg_3_0, arg_3_3)

	if not arg_3_1.GetAutoScrollStyle or arg_3_1:GetAutoScrollStyle() ~= LUI.UIStyledText.AutoScrollStyle.ScrollH then
		LAYOUT.SetTextBoxSize(arg_3_1, arg_3_0.TextGlow, arg_3_2, var_3_0, nil, arg_3_3, 0, LUI.EASING.outQuadratic)
	end
end

local function var_0_1(arg_4_0)
	if arg_4_0.WZWipBacker then
		arg_4_0.WZWipBacker:Setup9SliceImage(_1080p * 25, _1080p * 12, 0.625, 0.25)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetupButton = SetupButton
	arg_5_0.Setup9SliceImageForSmallUse = var_0_1
	arg_5_0._textureLayerSet = false
	arg_5_0._controllerIndex = arg_5_1

	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not CONDITIONS.IsWZWipDvarEnabled() then
			ACTIONS.AnimateSequence(arg_5_0, "GlowAnim")
		end

		RefreshAnimation(arg_6_0, "ButtonOver")
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if not CONDITIONS.IsWZWipDvarEnabled() then
			ACTIONS.AnimateSequence(arg_5_0, "GlowStop")
		end

		RefreshAnimation(arg_7_0, "ButtonUp", arg_7_1.snap)
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		if not CONDITIONS.IsWZWipDvarEnabled() then
			ACTIONS.AnimateSequence(arg_5_0, "GlowStop")
		end

		RefreshAnimation(arg_8_0, "ButtonUpDisabled", arg_8_1.snap)
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		if not CONDITIONS.IsWZWipDvarEnabled() then
			ACTIONS.AnimateSequence(arg_5_0, "GlowStop")
		end

		RefreshAnimation(arg_9_0, "ButtonOverDisabled")
	end)
	arg_5_0:addEventHandler("button_active", function(arg_10_0, arg_10_1)
		RefreshAnimation(arg_10_0, "ButtonUpActive")
	end)
	arg_5_0:addEventHandler("active", function(arg_11_0, arg_11_1)
		RefreshAnimation(arg_11_0, "Active")
	end)
	arg_5_0:addEventHandler("button_over_active", function(arg_12_0, arg_12_1)
		RefreshAnimation(arg_12_0, LUI.IsLastInputMouseNavigation(arg_12_0._controllerIndex) and "ButtonOverActive" or "ButtonOver")
	end)
	arg_5_0:addEventHandler("disable_active", function(arg_13_0, arg_13_1)
		RefreshAnimation(arg_13_0, "DisabledActive")
	end)
	arg_5_0:addEventHandler("button_disable_active", function(arg_14_0, arg_14_1)
		RefreshAnimation(arg_14_0, "ButtonUpDisabledActive")
	end)
	arg_5_0:addEventHandler("button_over_disable_active", function(arg_15_0, arg_15_1)
		RefreshAnimation(arg_15_0, LUI.IsLastInputMouseNavigation(arg_15_0._controllerIndex) and "ButtonOverDisabledActive" or "ButtonOverDisabled")
	end)
	arg_5_0:addEventHandler("binding", function(arg_16_0, arg_16_1)
		RefreshAnimation(arg_16_0, "Binding")
	end)

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		arg_5_0:SetZRotation(180)
	end

	THEMES.ApplyRandomMaskRotation(arg_5_0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end
end

function GenericButtonBackground(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 46 * _1080p)

	var_17_0.id = "GenericButtonBackground"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3

	if CONDITIONS.IsVanguardRevealed() then
		local var_17_4 = LUI.UIImage.new()

		var_17_4.id = "BackgroundDarkener"

		var_17_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
		var_17_4:SetAlpha(0.5, 0)
		var_17_0:addElement(var_17_4)

		var_17_0.BackgroundDarkener = var_17_4
	end

	local var_17_5

	if CONDITIONS.NotUsingWZSimpleUI() then
		var_17_5 = LUI.UIImage.new()
		var_17_5.id = "TextGlow"

		var_17_5:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
		var_17_5:SetAlpha(0, 0)
		var_17_5:SetPixelGridEnabled(true)
		var_17_5:SetPixelGridContrast(0.5, 0)
		var_17_5:SetPixelGridBlockWidth(2, 0)
		var_17_5:SetPixelGridBlockHeight(2, 0)
		var_17_5:SetPixelGridGutterWidth(1, 0)
		var_17_5:SetPixelGridGutterHeight(1, 0)
		var_17_5:setImage(RegisterMaterial("button_glow_circle"), 0)
		var_17_5:Setup3SliceHorizontalImage(_1080p * 12, 0.1)
		var_17_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 97, _1080p * -2, _1080p * -16, _1080p * 16)
		var_17_0:addElement(var_17_5)

		var_17_0.TextGlow = var_17_5
	end

	local var_17_6

	if CONDITIONS.NotUsingWZSimpleUI() then
		var_17_6 = LUI.UIImage.new()
		var_17_6.id = "Backer"

		var_17_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
		var_17_6:SetAlpha(0.3, 0)
		var_17_0:addElement(var_17_6)

		var_17_0.Backer = var_17_6
	end

	local var_17_7

	if CONDITIONS.NotUsingWZSimpleUI() then
		var_17_7 = LUI.UIImage.new()
		var_17_7.id = "TextureLayer"

		var_17_7:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
		var_17_7:SetAlpha(0.1, 0)
		var_17_7:SetPixelGridEnabled(true)
		var_17_7:SetPixelGridContrast(0.8, 0)
		var_17_7:SetPixelGridBlockWidth(2, 0)
		var_17_7:SetPixelGridBlockHeight(2, 0)
		var_17_7:SetPixelGridGutterWidth(1, 0)
		var_17_7:SetPixelGridGutterHeight(1, 0)
		var_17_7:setImage(RegisterMaterial("button_gradient"), 0)
		var_17_0:addElement(var_17_7)

		var_17_0.TextureLayer = var_17_7
	end

	local var_17_8

	if CONDITIONS.NotUsingWZSimpleUI() then
		var_17_8 = LUI.UIImage.new()
		var_17_8.id = "Glow"

		var_17_8:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
		var_17_8:SetAlpha(0, 0)
		var_17_8:SetPixelGridEnabled(true)
		var_17_8:SetPixelGridContrast(0.5, 0)
		var_17_8:SetPixelGridBlockWidth(2, 0)
		var_17_8:SetPixelGridBlockHeight(2, 0)
		var_17_8:SetPixelGridGutterWidth(1, 0)
		var_17_8:SetPixelGridGutterHeight(1, 0)
		var_17_8:setImage(RegisterMaterial("button_glow"), 0)
		var_17_8:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
		var_17_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
		var_17_0:addElement(var_17_8)

		var_17_0.Glow = var_17_8
	end

	local var_17_9

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_10 = {
			borderThicknessLeft = _1080p * 0,
			borderThicknessRight = _1080p * 0,
			borderThicknessTop = _1080p * 0,
			borderThicknessBottom = _1080p * 0
		}

		var_17_9 = LUI.UIBorder.new(var_17_10)
		var_17_9.id = "Border"

		var_17_9:SetBorderThicknessLeft(_1080p * 0, 0)
		var_17_9:SetBorderThicknessRight(_1080p * 0, 0)
		var_17_9:SetBorderThicknessTop(_1080p * 0, 0)
		var_17_9:SetBorderThicknessBottom(_1080p * 0, 0)
		var_17_0:addElement(var_17_9)

		var_17_0.Border = var_17_9
	end

	local var_17_11

	if CONDITIONS.IsVanguardRevealed() then
		var_17_11 = LUI.UIImage.new()
		var_17_11.id = "Mask"

		var_17_11:SetAlpha(0, 0)
		var_17_11:SetZRotation(180, 0)
		var_17_11:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
		var_17_11:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
		var_17_0:addElement(var_17_11)

		var_17_0.Mask = var_17_11
	end

	local function var_17_12()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_12

	local var_17_13

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_14 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonOver", var_17_14)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_15 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonOver", var_17_15)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_16 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MainMenu.ButtonText
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			},
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonOver", var_17_16)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonOver", var_17_17)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_18 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonOver", var_17_18)
	end

	local function var_17_19()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonOver")
		end
	end

	var_17_0._sequences.ButtonOver = var_17_19

	local var_17_20

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_21 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.glow
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonUp", var_17_21)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_22 = {
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonUp", var_17_22)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_23 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MainMenu.ButtonText
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonUp", var_17_23)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_24 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonUp", var_17_24)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_25 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonUp", var_17_25)
	end

	local function var_17_26()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonUp")
		end
	end

	var_17_0._sequences.ButtonUp = var_17_26

	local function var_17_27()
		return
	end

	var_17_0._sequences.Locked = var_17_27

	local var_17_28

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_29 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonOverDisabled", var_17_29)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_30 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundDisabled
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonOverDisabled", var_17_30)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_31 = {
			{
				value = 8421504,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonOverDisabled", var_17_31)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			},
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonOverDisabled", var_17_32)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_33 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonOverDisabled", var_17_33)
	end

	local function var_17_34()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_17_0._sequences.ButtonOverDisabled = var_17_34

	local var_17_35

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_36 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonUpDisabled", var_17_36)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_37 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundDisabled
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonUpDisabled", var_17_37)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_38 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			},
			{
				value = 0.1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonUpDisabled", var_17_38)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_39 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonUpDisabled", var_17_39)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_40 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonUpDisabled", var_17_40)
	end

	local function var_17_41()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_17_0._sequences.ButtonUpDisabled = var_17_41

	local var_17_42

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_43 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundDisabled
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_17_43)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_44 = {
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonUpDisabledSnap", var_17_44)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_17_45)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_46 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonUpDisabledSnap", var_17_46)
	end

	local function var_17_47()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonUpDisabledSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonUpDisabledSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonUpDisabledSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonUpDisabledSnap")
		end
	end

	var_17_0._sequences.ButtonUpDisabledSnap = var_17_47

	local var_17_48

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_49 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.98,
				duration = 230,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 0.85,
				duration = 850,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inOutQuintic
			},
			{
				value = 0.78,
				duration = 1200,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inOutQuartic
			},
			{
				value = 0.8,
				duration = 610,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.inOutQuartic
			}
		}

		var_17_5:RegisterAnimationSequence("GlowAnim", var_17_49)
	end

	local function var_17_50()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateLoop("GlowAnim")
		end
	end

	var_17_0._sequences.GlowAnim = var_17_50

	local var_17_51

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_5:RegisterAnimationSequence("GlowStop", var_17_52)
	end

	local function var_17_53()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("GlowStop")
		end
	end

	var_17_0._sequences.GlowStop = var_17_53

	local var_17_54

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_55 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			}
		}

		var_17_5:RegisterAnimationSequence("Active", var_17_55)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_56 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			}
		}

		var_17_6:RegisterAnimationSequence("Active", var_17_56)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_57 = {
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_17_7:RegisterAnimationSequence("Active", var_17_57)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_58 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("Active", var_17_58)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_59 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_17_9:RegisterAnimationSequence("Active", var_17_59)
	end

	local function var_17_60()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("Active")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("Active")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("Active")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("Active")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("Active")
		end
	end

	var_17_0._sequences.Active = var_17_60

	local var_17_61

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_62 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			},
			{
				value = 0.6,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonOverActive", var_17_62)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_63 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonOverActive", var_17_63)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_64 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.4,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonOverActive", var_17_64)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_65 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.8,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonOverActive", var_17_65)
	end

	local function var_17_66()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonOverActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonOverActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonOverActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonOverActive")
		end
	end

	var_17_0._sequences.ButtonOverActive = var_17_66

	local var_17_67

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("DisabledActive", var_17_68)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_69 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("DisabledActive", var_17_69)
	end

	local function var_17_70()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("DisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("DisabledActive")
		end
	end

	var_17_0._sequences.DisabledActive = var_17_70

	local var_17_71

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_72 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonOverDisabledActive", var_17_72)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_73 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundDisabled
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_17_73)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_74 = {
			{
				value = 8421504,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.2,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonOverDisabledActive", var_17_74)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_75 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			},
			{
				value = 0.75,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonOverDisabledActive", var_17_75)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_76 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonOverDisabledActive", var_17_76)
	end

	local function var_17_77()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonOverDisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonOverDisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonOverDisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonOverDisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonOverDisabledActive")
		end
	end

	var_17_0._sequences.ButtonOverDisabledActive = var_17_77

	local var_17_78

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_79 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonUpDisabledActive", var_17_79)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_80 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_17_80)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_81 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.locked
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonUpDisabledActive", var_17_81)
	end

	local function var_17_82()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonUpDisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonUpDisabledActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonUpDisabledActive")
		end
	end

	var_17_0._sequences.ButtonUpDisabledActive = var_17_82

	local var_17_83

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_84 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.KeyBinding.binding
			}
		}

		var_17_5:RegisterAnimationSequence("Binding", var_17_84)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_85 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.KeyBinding.binding
			}
		}

		var_17_7:RegisterAnimationSequence("Binding", var_17_85)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_86 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.KeyBinding.binding
			}
		}

		var_17_8:RegisterAnimationSequence("Binding", var_17_86)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_87 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.KeyBinding.binding
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("Binding", var_17_87)
	end

	local function var_17_88()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("Binding")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("Binding")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("Binding")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("Binding")
		end
	end

	var_17_0._sequences.Binding = var_17_88

	local var_17_89

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_90 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonUpSnap", var_17_90)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_91 = {
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonUpSnap", var_17_91)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_92 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MainMenu.ButtonText
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonUpSnap", var_17_92)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_93 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonUpSnap", var_17_93)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_94 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 0
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonUpSnap", var_17_94)
	end

	local function var_17_95()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonUpSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonUpSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonUpSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonUpSnap")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonUpSnap")
		end
	end

	var_17_0._sequences.ButtonUpSnap = var_17_95

	local var_17_96

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_97 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			}
		}

		var_17_5:RegisterAnimationSequence("ButtonUpActive", var_17_97)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_98 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			}
		}

		var_17_6:RegisterAnimationSequence("ButtonUpActive", var_17_98)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_99 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("button_gradient")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_17_7:RegisterAnimationSequence("ButtonUpActive", var_17_99)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_100 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("ButtonUpActive", var_17_100)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_101 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_17_9:RegisterAnimationSequence("ButtonUpActive", var_17_101)
	end

	local function var_17_102()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("ButtonUpActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("ButtonUpActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("ButtonUpActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("ButtonUpActive")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("ButtonUpActive")
		end
	end

	var_17_0._sequences.ButtonUpActive = var_17_102

	local var_17_103

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_104 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonOver", var_17_104)
	end

	local function var_17_105()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonOver")
		end
	end

	var_17_0._sequences.WZWipButtonOver = var_17_105

	local var_17_106

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_107 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_17_107)
	end

	local function var_17_108()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_17_0._sequences.WZWipButtonOverDisabled = var_17_108

	local var_17_109

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_110 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_17_110)
	end

	local function var_17_111()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonOverDisabledActive")
		end
	end

	var_17_0._sequences.WZWipButtonOverDisabledActive = var_17_111

	local var_17_112

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_113 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonUp", var_17_113)
	end

	local function var_17_114()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonUp")
		end
	end

	var_17_0._sequences.WZWipButtonUp = var_17_114

	local var_17_115

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_116 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonOverActive", var_17_116)
	end

	local function var_17_117()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonOverActive")
		end
	end

	var_17_0._sequences.WZWipButtonOverActive = var_17_117

	local var_17_118

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_119 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_5:RegisterAnimationSequence("WZWipSetup", var_17_119)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_120 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipSetup", var_17_120)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_121 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_7:RegisterAnimationSequence("WZWipSetup", var_17_121)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_122 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_8:RegisterAnimationSequence("WZWipSetup", var_17_122)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_123 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_17_9:RegisterAnimationSequence("WZWipSetup", var_17_123)
	end

	if CONDITIONS.IsVanguardRevealed() then
		local var_17_124 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_11:RegisterAnimationSequence("WZWipSetup", var_17_124)
	end

	local function var_17_125()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_5:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_7:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_8:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsVanguardRevealed() then
			var_17_11:AnimateSequence("WZWipSetup")
		end
	end

	var_17_0._sequences.WZWipSetup = var_17_125

	local var_17_126

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_127 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonUpSnap", var_17_127)
	end

	local function var_17_128()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonUpSnap")
		end
	end

	var_17_0._sequences.WZWipButtonUpSnap = var_17_128

	local var_17_129

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_130 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			},
			{
				value = 0.8,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_6:RegisterAnimationSequence("WZButtonOver", var_17_130)
	end

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_131 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.warzoneGlow2
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.warzoneBackground
			}
		}

		var_17_9:RegisterAnimationSequence("WZButtonOver", var_17_131)
	end

	local function var_17_132()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZButtonOver")
		end

		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_9:AnimateSequence("WZButtonOver")
		end
	end

	var_17_0._sequences.WZButtonOver = var_17_132

	local var_17_133

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_134 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			},
			{
				value = 0.8,
				duration = 140,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_6:RegisterAnimationSequence("WZButtonOverActive", var_17_134)
	end

	local function var_17_135()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZButtonOverActive")
		end
	end

	var_17_0._sequences.WZButtonOverActive = var_17_135

	local var_17_136

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_137 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.background
			},
			{
				value = 0.45,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_6:RegisterAnimationSequence("WZButtonUp", var_17_137)
	end

	local function var_17_138()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZButtonUp")
		end
	end

	var_17_0._sequences.WZButtonUp = var_17_138

	local var_17_139

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_140 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_17_140)
	end

	local function var_17_141()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonUpDisabledSnap")
		end
	end

	var_17_0._sequences.WZWipButtonUpDisabledSnap = var_17_141

	local var_17_142

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_143 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonUpActive", var_17_143)
	end

	local function var_17_144()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonUpActive")
		end
	end

	var_17_0._sequences.WZWipButtonUpActive = var_17_144

	local var_17_145

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_146 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_17_146)
	end

	local function var_17_147()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_17_0._sequences.WZWipButtonUpDisabled = var_17_147

	local var_17_148

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_149 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_17_149)
	end

	local function var_17_150()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipButtonUpDisabledActive")
		end
	end

	var_17_0._sequences.WZWipButtonUpDisabledActive = var_17_150

	local var_17_151

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_152 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipActive", var_17_152)
	end

	local function var_17_153()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipActive")
		end
	end

	var_17_0._sequences.WZWipActive = var_17_153

	local var_17_154

	if CONDITIONS.NotUsingWZSimpleUI() then
		local var_17_155 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			}
		}

		var_17_6:RegisterAnimationSequence("WZWipBinding", var_17_155)
	end

	local function var_17_156()
		if CONDITIONS.NotUsingWZSimpleUI() then
			var_17_6:AnimateSequence("WZWipBinding")
		end
	end

	var_17_0._sequences.WZWipBinding = var_17_156

	var_0_2(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("GenericButtonBackground", GenericButtonBackground)
LockTable(_M)
