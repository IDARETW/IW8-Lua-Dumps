module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)

	arg_1_0._enabled = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0, arg_3_1)
		if arg_2_0._enabled then
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_3_1.controllerIndex, false, nil)
		end
	end

	if LUI.IsLastInputGamepad(arg_2_1.controllerIndex) then
		arg_2_0:LoseFocus({})
		arg_2_0.PurchaseText:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW_PROMPT_ALT1"))
		arg_2_0:registerEventHandler("button_action", nil)
		arg_2_0.bindButton:registerEventHandler("button_alt1", var_2_0)
	else
		arg_2_0.PurchaseText:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"))
		arg_2_0:registerEventHandler("button_action", var_2_0)
		arg_2_0.bindButton:registerEventHandler("button_alt1", nil)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateForInputType = var_0_1
	arg_4_0.Enable = var_0_0

	arg_4_0.Mask:SetAlpha(1)
	arg_4_0.Glint:SetMask(arg_4_0.Mask)
	ACTIONS.AnimateSequence(arg_4_0, "Shine")

	local var_4_0 = LUI.UIBindButton.new()

	var_4_0.id = "selfBindButton"

	arg_4_0:addElement(var_4_0)

	arg_4_0.bindButton = var_4_0

	arg_4_0:addAndCallEventHandler("update_input_type", arg_4_0.UpdateForInputType, {
		controllerIndex = arg_4_1
	})

	arg_4_0.m_requireFocusType = FocusType.MouseOver
end

function BarracksUpsellPurchaseButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 410 * _1080p, 0, 330 * _1080p)

	var_5_0.id = "BarracksUpsellPurchaseButton"
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

	var_5_4.id = "BGImage"

	var_5_4:setImage(RegisterMaterial("magma_upsell_button_small"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -52, _1080p * 460, _1080p * -94, _1080p * 418)
	var_5_0:addElement(var_5_4)

	var_5_0.BGImage = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ButtonGlowBottom"

	var_5_6:SetAlpha(0, 0)
	var_5_6.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 391, _1080p * 322, _1080p * 338)
	var_5_0:addElement(var_5_6)

	var_5_0.ButtonGlowBottom = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "HighlightBottom"

	var_5_8:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed, 0)
	var_5_8:SetAlpha(0.4, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 410, _1080p * -150, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.HighlightBottom = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "TextureHighlight"

	var_5_10:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_5_10:SetAlpha(0.4, 0)
	var_5_10:SetPixelGridEnabled(true)
	var_5_10:SetPixelGridContrast(0.5, 0)
	var_5_10:SetPixelGridBlockWidth(2, 0)
	var_5_10:SetPixelGridBlockHeight(2, 0)
	var_5_10:SetPixelGridGutterWidth(1, 0)
	var_5_10:SetPixelGridGutterHeight(1, 0)
	var_5_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 410, _1080p * -150, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.TextureHighlight = var_5_10

	local var_5_11
	local var_5_12 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_13 = LUI.UIBorder.new(var_5_12)

	var_5_13.id = "Line"

	var_5_13:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_5_13:SetBorderThicknessLeft(_1080p * 0, 0)
	var_5_13:SetBorderThicknessRight(_1080p * 0, 0)
	var_5_13:SetBorderThicknessTop(_1080p * 0, 0)
	var_5_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 410, 0, _1080p * 330)
	var_5_0:addElement(var_5_13)

	var_5_0.Line = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIStyledText.new()

	var_5_15.id = "PurchaseText"

	var_5_15:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_15:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW")), 0)
	var_5_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_15:SetWordWrap(false)
	var_5_15:SetAlignment(LUI.Alignment.Center)
	var_5_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 422, _1080p * 284, _1080p * 312)
	var_5_0:addElement(var_5_15)

	var_5_0.PurchaseText = var_5_15

	local var_5_16
	local var_5_17 = LUI.UIImage.new()

	var_5_17.id = "Glint"

	var_5_17:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_17:SetAlpha(0, 0)
	var_5_17:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_17:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -36, 0, 0, _1080p * 330)
	var_5_0:addElement(var_5_17)

	var_5_0.Glint = var_5_17

	local var_5_18
	local var_5_19 = LUI.UIImage.new()

	var_5_19.id = "Mask"

	var_5_19:SetAlpha(0, 0)
	var_5_19:setImage(RegisterMaterial("stencil_mask"), 0)
	var_5_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 410, 0, _1080p * 330)
	var_5_0:addElement(var_5_19)

	var_5_0.Mask = var_5_19

	local var_5_20
	local var_5_21 = LUI.UIText.new()

	var_5_21.id = "Desc"

	var_5_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_21:setText(Engine.CBBHFCGDIC("INGAMESTORE/UPSELL_DAILY"), 0)
	var_5_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_21:SetAlignment(LUI.Alignment.Center)
	var_5_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 410, _1080p * 243, _1080p * 263)
	var_5_0:addElement(var_5_21)

	var_5_0.Desc = var_5_21

	local var_5_22
	local var_5_23 = LUI.UIImage.new()

	var_5_23.id = "LogoMW"

	var_5_23:SetAlpha(0.25, 0)
	var_5_23:setImage(RegisterMaterial("gamma_logo_cod_iw8"), 0)
	var_5_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 401, _1080p * -4, _1080p * 378)
	var_5_0:addElement(var_5_23)

	var_5_0.LogoMW = var_5_23

	local function var_5_24()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_24

	local var_5_25
	local var_5_26 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 908,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 500,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 4200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_17:RegisterAnimationSequence("Shine", var_5_26)

	local function var_5_27()
		var_5_17:AnimateLoop("Shine")
	end

	var_5_0._sequences.Shine = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_29)

	local var_5_30 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -300,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_30)

	local var_5_31 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -214,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_31)

	local var_5_32 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 330
		}
	}

	var_5_17:RegisterAnimationSequence("ButtonOver", var_5_32)

	local var_5_33 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 330
		}
	}

	var_5_19:RegisterAnimationSequence("ButtonOver", var_5_33)

	local var_5_34 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equippedPerkTic,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_23:RegisterAnimationSequence("ButtonOver", var_5_34)

	local function var_5_35()
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
		var_5_17:AnimateSequence("ButtonOver")
		var_5_19:AnimateSequence("ButtonOver")
		var_5_23:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_35

	local var_5_36
	local var_5_37 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_37)

	local var_5_38 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -150,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_38)

	local var_5_39 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -150,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_39)

	local var_5_40 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonUp", var_5_40)

	local var_5_41 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_23:RegisterAnimationSequence("ButtonUp", var_5_41)

	local function var_5_42()
		var_5_6:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
		var_5_13:AnimateSequence("ButtonUp")
		var_5_23:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_42

	var_5_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	PostLoadFunc(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "ButtonUp")

	return var_5_0
end

MenuBuilder.registerType("BarracksUpsellPurchaseButton", BarracksUpsellPurchaseButton)
LockTable(_M)
