module(..., package.seeall)

local var_0_0 = 6

local function var_0_1(arg_1_0)
	arg_1_0.TierText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION", BATTLEPASS.GetTier(arg_1_0._controllerIndex))))

	local var_1_0 = BATTLEPASS.GetBaseEmblem()

	if var_1_0 and var_1_0 ~= "" then
		arg_1_0.Emblem:setImage(RegisterMaterial(var_1_0))
	end

	if not arg_1_0._hideBattlePassInfo then
		if arg_1_0._currentSeason and arg_1_0._currentSeason == var_0_0 then
			ACTIONS.AnimateSequence(arg_1_0, "PulseS6")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Spinning")
		end
	end
end

local function var_0_2(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "DoubleXP")
	arg_2_0.TierText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION", BATTLEPASS.GetTier(arg_2_0._controllerIndex))))

	if not arg_2_0._hideBattlePassInfo then
		if arg_2_0._currentSeason and arg_2_0._currentSeason == var_0_0 then
			ACTIONS.AnimateSequence(arg_2_0, "PulseS6")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Spinning")
		end
	end
end

local function var_0_3(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "HideBattlePassInfo")

	arg_3_0._hideBattlePassInfo = true
end

local function var_0_4(arg_4_0)
	ACTIONS.AnimateSequence(arg_4_0, "ShowVanguardRevealInfo")

	arg_4_0._hideBattlePassInfo = true
end

local function var_0_5(arg_5_0)
	ACTIONS.AnimateSequence(arg_5_0, "HideVanguardRevealInfo")

	arg_5_0._hideBattlePassInfo = false
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.StartAnimation = var_0_1
	arg_6_0.ShowDoubleXPIcon = var_0_2
	arg_6_0.HideBattlePassInfo = var_0_3
	arg_6_0.ShowVanguardRevealInfo = var_0_4
	arg_6_0.HideVanguardRevealInfo = var_0_5
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_6_0._currentSeason and arg_6_0._currentSeason == var_0_0 then
		ACTIONS.AnimateSequence(arg_6_0, "ColorAlt")
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_6_0.Darkener)

	local function var_6_0()
		local var_7_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_6_0.TierPurchaseBG:SetScale(var_7_0)
	end

	arg_6_0:addAndCallEventHandler("onVideoChange", var_6_0)
end

function BattlePassPurchaseBackground(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "BattlePassPurchaseBackground"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "TierPurchaseBG"

	var_8_4:setImage(RegisterMaterial("battlepass_background_tierpurchase"), 0)
	var_8_0:addElement(var_8_4)

	var_8_0.TierPurchaseBG = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Darkener"

	var_8_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_6:SetAlpha(0.5, 0)
	var_8_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 423, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.Darkener = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Emblem"

	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -133, _1080p * 133, _1080p * -208, _1080p * 58)
	var_8_0:addElement(var_8_8)

	var_8_0.Emblem = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Circle"

	var_8_10:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_8_10:setImage(RegisterMaterial("battlepass_celebration_tier_circle"), 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -331, _1080p * 181)
	var_8_0:addElement(var_8_10)

	var_8_0.Circle = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Reticle"

	var_8_12:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_8_12:SetAlpha(0, 0)
	var_8_12:setImage(RegisterMaterial("battlepass_celebration_tier_reticle"), 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -331, _1080p * 181)
	var_8_0:addElement(var_8_12)

	var_8_0.Reticle = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIStyledText.new()

	var_8_14.id = "TierText"

	var_8_14:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_8_14:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION"), 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -142, _1080p * 142, _1080p * -268, _1080p * -232)
	var_8_0:addElement(var_8_14)

	var_8_0.TierText = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "BattlePassTokenText"

	var_8_16:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_8_16:SetAlpha(0, 0)
	var_8_16:setText(Engine.CBBHFCGDIC("BATTLEPASS/TOKEN_BONUS"), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_16:SetAlignment(LUI.Alignment.Center)
	var_8_16:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -232, _1080p * -210)
	var_8_0:addElement(var_8_16)

	var_8_0.BattlePassTokenText = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIStyledText.new()

	var_8_18.id = "VanguardRevealText"

	var_8_18:SetRGBFromTable(SWATCHES.BattlePass.White, 0)
	var_8_18:SetAlpha(0, 0)
	var_8_18:setText(Engine.CBBHFCGDIC("BATTLEPASS/VANGUARD_TIER_REVEAL"), 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_18:SetAlignment(LUI.Alignment.Center)
	var_8_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * 23, _1080p * 59)
	var_8_0:addElement(var_8_18)

	var_8_0.VanguardRevealText = var_8_18

	local function var_8_19()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 360,
			duration = 60000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_8_10:RegisterAnimationSequence("Spinning", var_8_21)

	local function var_8_22()
		var_8_10:AnimateLoop("Spinning")
	end

	var_8_0._sequences.Spinning = var_8_22

	local var_8_23
	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("HideBattlePassInfo", var_8_24)

	local var_8_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("HideBattlePassInfo", var_8_25)

	local var_8_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("HideBattlePassInfo", var_8_26)

	local function var_8_27()
		var_8_8:AnimateSequence("HideBattlePassInfo")
		var_8_10:AnimateSequence("HideBattlePassInfo")
		var_8_14:AnimateSequence("HideBattlePassInfo")
	end

	var_8_0._sequences.HideBattlePassInfo = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_double_battle_xp")
		}
	}

	var_8_8:RegisterAnimationSequence("DoubleXP", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("DoubleXP", var_8_30)

	local function var_8_31()
		var_8_8:AnimateSequence("DoubleXP")
		var_8_16:AnimateSequence("DoubleXP")
	end

	var_8_0._sequences.DoubleXP = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_8_16:RegisterAnimationSequence("AR", var_8_33)

	local function var_8_34()
		var_8_16:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_34

	local var_8_35
	local var_8_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.35,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_8_10:RegisterAnimationSequence("PulseS5", var_8_36)

	local function var_8_37()
		var_8_10:AnimateLoop("PulseS5")
	end

	var_8_0._sequences.PulseS5 = var_8_37

	local var_8_38
	local var_8_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenMain
		},
		{
			value = -0.11,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_8_10:RegisterAnimationSequence("ColorAlt", var_8_39)

	local var_8_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenMain
		},
		{
			value = 0.07,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_8_12:RegisterAnimationSequence("ColorAlt", var_8_40)

	local var_8_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.HalloweenMain
		}
	}

	var_8_14:RegisterAnimationSequence("ColorAlt", var_8_41)

	local function var_8_42()
		var_8_10:AnimateSequence("ColorAlt")
		var_8_12:AnimateSequence("ColorAlt")
		var_8_14:AnimateSequence("ColorAlt")
	end

	var_8_0._sequences.ColorAlt = var_8_42

	local var_8_43
	local var_8_44 = {
		{
			value = 360,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 40000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_8_10:RegisterAnimationSequence("PulseS6", var_8_44)

	local var_8_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.35,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_8_12:RegisterAnimationSequence("PulseS6", var_8_45)

	local function var_8_46()
		var_8_10:AnimateLoop("PulseS6")
		var_8_12:AnimateLoop("PulseS6")
	end

	var_8_0._sequences.PulseS6 = var_8_46

	local var_8_47
	local var_8_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_vanguard")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_8_8:RegisterAnimationSequence("ShowVanguardRevealInfo", var_8_48)

	local var_8_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ShowVanguardRevealInfo", var_8_49)

	local var_8_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ShowVanguardRevealInfo", var_8_50)

	local var_8_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ShowVanguardRevealInfo", var_8_51)

	local function var_8_52()
		var_8_8:AnimateSequence("ShowVanguardRevealInfo")
		var_8_10:AnimateSequence("ShowVanguardRevealInfo")
		var_8_14:AnimateSequence("ShowVanguardRevealInfo")
		var_8_18:AnimateSequence("ShowVanguardRevealInfo")
	end

	var_8_0._sequences.ShowVanguardRevealInfo = var_8_52

	local var_8_53
	local var_8_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.White,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 58,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -208,
			easing = LUI.EASING.snap
		}
	}

	var_8_8:RegisterAnimationSequence("HideVanguardRevealInfo", var_8_54)

	local var_8_55 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_8_10:RegisterAnimationSequence("HideVanguardRevealInfo", var_8_55)

	local var_8_56 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_8_14:RegisterAnimationSequence("HideVanguardRevealInfo", var_8_56)

	local var_8_57 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_8_18:RegisterAnimationSequence("HideVanguardRevealInfo", var_8_57)

	local function var_8_58()
		var_8_8:AnimateSequence("HideVanguardRevealInfo")
		var_8_10:AnimateSequence("HideVanguardRevealInfo")
		var_8_14:AnimateSequence("HideVanguardRevealInfo")
		var_8_18:AnimateSequence("HideVanguardRevealInfo")
	end

	var_8_0._sequences.HideVanguardRevealInfo = var_8_58

	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("BattlePassPurchaseBackground", BattlePassPurchaseBackground)
LockTable(_M)
