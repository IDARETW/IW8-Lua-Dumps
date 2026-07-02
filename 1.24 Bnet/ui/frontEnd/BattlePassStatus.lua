module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Active")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Inactive")
	end

	arg_1_0.ActiveText:setText(Engine.CBBHFCGDIC(arg_1_1 and "BATTLEPASS/PASS_ACTIVATED" or "BATTLEPASS/BATTLE_PASS_INACTIVE"))
	arg_1_0.TierText:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER", BATTLEPASS.GetTier(arg_1_0._controllerIndex)))

	local var_1_0 = 16 * _1080p
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.ActiveText) + var_1_0
	local var_1_2 = 16 * _1080p
	local var_1_3 = LAYOUT.GetTextWidth(arg_1_0.TierText) + var_1_2
	local var_1_4 = LAYOUT.GetElementWidth(arg_1_0.Node)
	local var_1_5 = 16 * _1080p
	local var_1_6 = 40 * _1080p
	local var_1_7 = LAYOUT.GetTextWidth(arg_1_0.EarnRateBuff.EarnRate) + var_1_6

	arg_1_0.Backer:SetLeft(-var_1_1)
	arg_1_0.CurrentTierBacker:SetLeft(-var_1_3)
	arg_1_0.CurrentTierTexture:SetLeft(-var_1_3)
	arg_1_0.ButtonGlowTop:SetLeft(-var_1_1)
	arg_1_0.Node:SetRight(-var_1_1 + var_1_5)
	arg_1_0.Node:SetLeft(-var_1_1 - var_1_4 + var_1_5)
	arg_1_0.EarnRateBacker:SetLeft(-var_1_7)
	arg_1_0.EarnRateTexture:SetLeft(-var_1_7)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateActiveBanner = var_0_0
	arg_2_0._controllerIndex = arg_2_1

	ACTIONS.AnimateSequence(arg_2_0.EarnRateBuff, "OnlyShowXPBoost")
end

function BattlePassStatus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 64 * _1080p)

	var_3_0.id = "BattlePassStatus"
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

	var_3_4.id = "CurrentTierBacker"

	var_3_4:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_4:SetAlpha(0.15, 0)
	var_3_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -206, 0, _1080p * 32, _1080p * 60)
	var_3_0:addElement(var_3_4)

	var_3_0.CurrentTierBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "CurrentTierTexture"

	var_3_6:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_6:SetAlpha(0.3, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.5, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -206, 0, _1080p * 32, _1080p * 60)
	var_3_0:addElement(var_3_6)

	var_3_0.CurrentTierTexture = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ButtonGlowTop"

	var_3_8:SetAlpha(0.5, 0)
	var_3_8.Glow:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -300, 0, _1080p * -8, _1080p * 8)
	var_3_0:addElement(var_3_8)

	var_3_0.ButtonGlowTop = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Backer"

	var_3_10:SetRGBFromTable(SWATCHES.Store.NewItemBackground, 0)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -292, 0, 0, _1080p * 32)
	var_3_0:addElement(var_3_10)

	var_3_0.Backer = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Node"

	var_3_12:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_12:SetZRotation(90, 0)
	var_3_12:setImage(RegisterMaterial("battlepass_progressbar_greyscale"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -312, _1080p * -280, _1080p * 12, _1080p * 20)
	var_3_0:addElement(var_3_12)

	var_3_0.Node = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "TierText"

	var_3_14:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Right)
	var_3_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_14:SetShadowRGBFromTable(SWATCHES.Reticles.White, 0)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -202, _1080p * -5, _1080p * 34, _1080p * 58)
	var_3_0:addElement(var_3_14)

	var_3_0.TierText = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "ActiveText"

	var_3_16:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("BATTLEPASS/PASS_ACTIVATED"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetWordWrap(false)
	var_3_16:SetAlignment(LUI.Alignment.Right)
	var_3_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_16:SetShadowRGBFromTable(SWATCHES.Reticles.White, 0)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -288, _1080p * -5, _1080p * 2, _1080p * 30)
	var_3_0:addElement(var_3_16)

	var_3_0.ActiveText = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "EarnRateBacker"

	var_3_18:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_18:SetAlpha(0.15, 0)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -143, 0, _1080p * 60, _1080p * 88)
	var_3_0:addElement(var_3_18)

	var_3_0.EarnRateBacker = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "EarnRateTexture"

	var_3_20:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_20:SetAlpha(0.15, 0)
	var_3_20:SetPixelGridEnabled(true)
	var_3_20:SetPixelGridContrast(0.5, 0)
	var_3_20:SetPixelGridBlockWidth(2, 0)
	var_3_20:SetPixelGridBlockHeight(2, 0)
	var_3_20:SetPixelGridGutterWidth(1, 0)
	var_3_20:SetPixelGridGutterHeight(1, 0)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -143, 0, _1080p * 60, _1080p * 88)
	var_3_0:addElement(var_3_20)

	var_3_0.EarnRateTexture = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "EarnRateBuff"

	var_3_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -198, _1080p * 2, _1080p * 58, _1080p * 90)
	var_3_0:addElement(var_3_22)

	var_3_0.EarnRateBuff = var_3_22

	local function var_3_23()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_3_6:RegisterAnimationSequence("Active", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased,
			child = var_3_0.ButtonGlowTop.Glow
		}
	}

	var_3_8:RegisterAnimationSequence("Active", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.NewItemBackground
		}
	}

	var_3_10:RegisterAnimationSequence("Active", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_3_12:RegisterAnimationSequence("Active", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_3_14:RegisterAnimationSequence("Active", var_3_29)

	local var_3_30 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Active", var_3_30)

	local var_3_31 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Active", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Active", var_3_32)

	local function var_3_33()
		var_3_6:AnimateSequence("Active")
		var_3_8:AnimateSequence("Active")
		var_3_10:AnimateSequence("Active")
		var_3_12:AnimateSequence("Active")
		var_3_14:AnimateSequence("Active")
		var_3_18:AnimateSequence("Active")
		var_3_20:AnimateSequence("Active")
		var_3_22:AnimateSequence("Active")
	end

	var_3_0._sequences.Active = var_3_33

	local var_3_34
	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Inactive", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Inactive", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free,
			child = var_3_0.ButtonGlowTop.Glow
		}
	}

	var_3_8:RegisterAnimationSequence("Inactive", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_10:RegisterAnimationSequence("Inactive", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_3_12:RegisterAnimationSequence("Inactive", var_3_39)

	local var_3_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_14:RegisterAnimationSequence("Inactive", var_3_40)

	local var_3_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Inactive", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Inactive", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Inactive", var_3_43)

	local function var_3_44()
		var_3_4:AnimateSequence("Inactive")
		var_3_6:AnimateSequence("Inactive")
		var_3_8:AnimateSequence("Inactive")
		var_3_10:AnimateSequence("Inactive")
		var_3_12:AnimateSequence("Inactive")
		var_3_14:AnimateSequence("Inactive")
		var_3_18:AnimateSequence("Inactive")
		var_3_20:AnimateSequence("Inactive")
		var_3_22:AnimateSequence("Inactive")
	end

	var_3_0._sequences.Inactive = var_3_44

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassStatus", BattlePassStatus)
LockTable(_M)
