module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		if arg_1_2 then
			assert(arg_1_0._sequences and arg_1_0._sequences[arg_1_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
		end
	end
end

function SetupLootButton(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = 80

	if arg_2_3 == LUI.Alignment.Left then
		arg_2_0.TextureLayer:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -60, _1080p * -20, 0, 0)
		arg_2_0.TextGlow:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -20, _1080p * 250, _1080p * -18, _1080p * 18)
	elseif arg_2_3 == LUI.Alignment.Right then
		arg_2_0.TextureLayer:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, _1080p * 30, 0, 0)
		arg_2_0.TextGlow:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -250, _1080p * 20, _1080p * -18, _1080p * 18)
	else
		arg_2_0.TextureLayer:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, _1080p * -20, 0, 0)
		arg_2_0.TextGlow:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -64, _1080p * 64, _1080p * -18, _1080p * 18)
	end

	LAYOUT.SetTextBoxSize(arg_2_1, arg_2_0.TextGlow, arg_2_2, var_2_0, nil, arg_2_3, 0, LUI.EASING.outQuadratic)
end

function SetupLootRarity(arg_3_0, arg_3_1)
	if arg_3_1 == 0 then
		arg_3_0._rarityColor = SWATCHES.genericButton.textFocus
	else
		arg_3_0._rarityColor = LOOT.GetRarityColor(arg_3_1)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupLootButton = SetupLootButton
	arg_4_0.SetupLootRarity = SetupLootRarity

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, "ButtonOver")
		arg_4_0.Line:SetRGBFromTable(arg_4_0._rarityColor, 200)
		arg_4_0.TextureLayer:SetRGBFromTable(arg_4_0._rarityColor, 200)
		arg_4_0.TextGlow:SetRGBFromTable(arg_4_0._rarityColor, 200)
		arg_4_0.Glow:SetRGBFromTable(arg_4_0._rarityColor, 200)
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonUp", arg_6_1.snap)
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonUpDisabled", arg_7_1.snap)
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, "ButtonOverDisabled")
		arg_4_0.Line:SetRGBFromTable(arg_4_0._rarityColor, 200)
		arg_4_0.TextGlow:SetRGBFromTable(arg_4_0._rarityColor, 200)
		arg_4_0.Glow:SetRGBFromTable(arg_4_0._rarityColor, 200)
	end)

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		arg_4_0:SetZRotation(180)
	end

	arg_4_0._rarityColor = SWATCHES.genericButton.textFocus

	local var_4_0 = {
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

	arg_4_0.Backer:RegisterAnimationSequence("ButtonOver", var_4_0)

	local var_4_1 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.TextureLayer:RegisterAnimationSequence("ButtonOver", var_4_1)

	local var_4_2 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.Line:RegisterAnimationSequence("ButtonOver", var_4_2)

	local var_4_3 = {
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.Glow:RegisterAnimationSequence("ButtonOver", var_4_3)

	local function var_4_4()
		arg_4_0.Backer:AnimateSequence("ButtonOver")
		arg_4_0.TextureLayer:AnimateSequence("ButtonOver")
		arg_4_0.Line:AnimateSequence("ButtonOver")
		arg_4_0.Glow:AnimateSequence("ButtonOver")
	end

	arg_4_0._sequences.ButtonOver = var_4_4

	local var_4_5 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	arg_4_0.Backer:RegisterAnimationSequence("ButtonOverDisabled", var_4_5)

	local var_4_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.TextureLayer:RegisterAnimationSequence("ButtonOverDisabled", var_4_6)

	local var_4_7 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.Line:RegisterAnimationSequence("ButtonOverDisabled", var_4_7)

	local var_4_8 = {
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.Glow:RegisterAnimationSequence("ButtonOverDisabled", var_4_8)

	local function var_4_9()
		arg_4_0.Backer:AnimateSequence("ButtonOverDisabled")
		arg_4_0.TextureLayer:AnimateSequence("ButtonOverDisabled")
		arg_4_0.Line:AnimateSequence("ButtonOverDisabled")
		arg_4_0.Glow:AnimateSequence("ButtonOverDisabled")
	end

	arg_4_0._sequences.ButtonOverDisabled = var_4_9
end

function LootButtonBackground(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 46 * _1080p)

	var_11_0.id = "LootButtonBackground"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "TextGlow"

	var_11_4:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_11_4:SetAlpha(0, 0)
	var_11_4:SetPixelGridEnabled(true)
	var_11_4:SetPixelGridContrast(0.5, 0)
	var_11_4:SetPixelGridBlockWidth(2, 0)
	var_11_4:SetPixelGridBlockHeight(2, 0)
	var_11_4:SetPixelGridGutterWidth(1, 0)
	var_11_4:SetPixelGridGutterHeight(1, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 121, _1080p * 22, _1080p * -16, _1080p * 16)
	var_11_0:addElement(var_11_4)

	var_11_0.TextGlow = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Backer"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_11_6:SetAlpha(0.8, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.Backer = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "TextureLayer"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_11_8:SetAlpha(0.1, 0)
	var_11_8:SetPixelGridEnabled(true)
	var_11_8:SetPixelGridContrast(0.8, 0)
	var_11_8:SetPixelGridBlockWidth(2, 0)
	var_11_8:SetPixelGridBlockHeight(2, 0)
	var_11_8:SetPixelGridGutterWidth(1, 0)
	var_11_8:SetPixelGridGutterHeight(1, 0)
	var_11_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_11_0:addElement(var_11_8)

	var_11_0.TextureLayer = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "Line"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_10:SetAlpha(0, 0)
	var_11_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_11_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_11_0:addElement(var_11_10)

	var_11_0.Line = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "Glow"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_11_12:SetAlpha(0, 0)
	var_11_12:SetPixelGridEnabled(true)
	var_11_12:SetPixelGridContrast(0.5, 0)
	var_11_12:SetPixelGridBlockWidth(2, 0)
	var_11_12:SetPixelGridBlockHeight(2, 0)
	var_11_12:SetPixelGridGutterWidth(1, 0)
	var_11_12:SetPixelGridGutterHeight(1, 0)
	var_11_12:setImage(RegisterMaterial("button_glow"), 0)
	var_11_12:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_11_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_11_0:addElement(var_11_12)

	var_11_0.Glow = var_11_12

	local function var_11_13()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_13

	local var_11_14 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUp", var_11_14)

	local var_11_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_15)

	local var_11_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUp", var_11_16)

	local var_11_17 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUp", var_11_17)

	local function var_11_18()
		var_11_6:AnimateSequence("ButtonUp")
		var_11_8:AnimateSequence("ButtonUp")
		var_11_10:AnimateSequence("ButtonUp")
		var_11_12:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_18

	local function var_11_19()
		return
	end

	var_11_0._sequences.Locked = var_11_19

	local var_11_20 = {
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

	var_11_6:RegisterAnimationSequence("ButtonUpDisabled", var_11_20)

	local var_11_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabled", var_11_21)

	local var_11_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpDisabled", var_11_22)

	local var_11_23 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpDisabled", var_11_23)

	local function var_11_24()
		var_11_6:AnimateSequence("ButtonUpDisabled")
		var_11_8:AnimateSequence("ButtonUpDisabled")
		var_11_10:AnimateSequence("ButtonUpDisabled")
		var_11_12:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_24

	local var_11_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUpSnap", var_11_25)

	local var_11_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpSnap", var_11_26)

	local var_11_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpSnap", var_11_27)

	local var_11_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpSnap", var_11_28)

	local function var_11_29()
		var_11_6:AnimateSequence("ButtonUpSnap")
		var_11_8:AnimateSequence("ButtonUpSnap")
		var_11_10:AnimateSequence("ButtonUpSnap")
		var_11_12:AnimateSequence("ButtonUpSnap")
	end

	var_11_0._sequences.ButtonUpSnap = var_11_29

	local var_11_30 = {
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

	var_11_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_11_30)

	local var_11_31 = {
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_11_31)

	local var_11_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_11_32)

	local var_11_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpDisabledSnap", var_11_33)

	local function var_11_34()
		var_11_6:AnimateSequence("ButtonUpDisabledSnap")
		var_11_8:AnimateSequence("ButtonUpDisabledSnap")
		var_11_10:AnimateSequence("ButtonUpDisabledSnap")
		var_11_12:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_11_0._sequences.ButtonUpDisabledSnap = var_11_34

	local var_11_35 = {
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

	var_11_4:RegisterAnimationSequence("GlowAnim", var_11_35)

	local function var_11_36()
		var_11_4:AnimateLoop("GlowAnim")
	end

	var_11_0._sequences.GlowAnim = var_11_36

	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("GlowStop", var_11_37)

	local function var_11_38()
		var_11_4:AnimateSequence("GlowStop")
	end

	var_11_0._sequences.GlowStop = var_11_38

	local var_11_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_11_6:RegisterAnimationSequence("StandardButtonColor", var_11_39)

	local var_11_40 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_8:RegisterAnimationSequence("StandardButtonColor", var_11_40)

	local var_11_41 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_10:RegisterAnimationSequence("StandardButtonColor", var_11_41)

	local function var_11_42()
		var_11_6:AnimateSequence("StandardButtonColor")
		var_11_8:AnimateSequence("StandardButtonColor")
		var_11_10:AnimateSequence("StandardButtonColor")
	end

	var_11_0._sequences.StandardButtonColor = var_11_42

	var_11_0:addEventHandler("button_over", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "GlowAnim")
	end)
	var_11_0:addEventHandler("button_up", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "GlowStop")
	end)
	var_11_0:addEventHandler("button_over_disable", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "GlowAnim")
	end)
	var_11_0:addEventHandler("button_disable", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "GlowStop")
	end)
	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("LootButtonBackground", LootButtonBackground)
LockTable(_M)
