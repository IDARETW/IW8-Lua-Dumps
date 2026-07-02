module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._state = arg_1_1

	if arg_1_0._state == BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_UNLOCKED then
		Engine.DFCGFCGBFD("mp_battlepass_celebration_purchase")
		Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpTierPurchase)

		if not IsLanguageEnglish() then
			ACTIONS.AnimateSequence(arg_1_0, "ShowBattlePass")
		end

		if arg_1_0._currentSeason and arg_1_0._currentSeason == 5 then
			ACTIONS.AnimateSequence(arg_1_0, "ShowHeaderS5")
		end
	elseif arg_1_0._state == BATTLEPASS.FullScreenPopupStates.TIERS_UNLOCKED then
		Engine.DFCGFCGBFD("mp_battlepass_celebration_tier")
		Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpTierPurchase)
		ACTIONS.AnimateSequence(arg_1_0, "ShowTier")
		arg_1_0.TierStatus:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION", BATTLEPASS.GetTier(arg_1_0._controllerIndex))))
		arg_1_0.UnlockText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_TIER_CELEBRATION")))

		if arg_1_0._currentSeason and arg_1_0._currentSeason == 5 then
			ACTIONS.AnimateSequence(arg_1_0, "ShowHeaderS5")
			ACTIONS.AnimateSequence(arg_1_0, "ShowTierS5")
		end
	elseif arg_1_0._state == BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_TIER_BUNDLE_UNLOCKED then
		Engine.DFCGFCGBFD("mp_battlepass_celebration_purchase")
		Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpTierPurchase)
		arg_1_0.UnlockText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIERS_UNLOCKED_CELEBRATION")))

		if not IsLanguageEnglish() then
			ACTIONS.AnimateSequence(arg_1_0, "ShowBattlePass")
		end

		if arg_1_0._currentSeason and arg_1_0._currentSeason == 5 then
			ACTIONS.AnimateSequence(arg_1_0, "ShowHeaderS5")
		end
	elseif arg_1_0._state == BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_COMPLETE then
		Engine.DFCGFCGBFD("mp_battlepass_celebration_complete")
		Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpComplete)
		ACTIONS.AnimateSequence(arg_1_0, "CompleteBattlePass")
		arg_1_0.TierStatus:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE_BATTLEPASS")))

		if not IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "CompleteKerning")
		end
	else
		assert(false, "Unsupported state: " .. arg_1_0._state)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.state)

	arg_2_0.isQuickAccessShortcutsDisabled = true
	arg_2_0._displayTime = arg_2_2.state == BATTLEPASS.FullScreenPopupStates.BATTLE_PASS_COMPLETE and 3500 or 5500
	arg_2_0._fadeTime = 200
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0._currentSeason = SEASON.GetCurrentSeason()

	if arg_2_0._currentSeason and arg_2_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_2_0, "S5")
	end

	var_0_0(arg_2_0, arg_2_2.state)

	arg_2_0:Wait(arg_2_0._displayTime).onComplete = function()
		ACTIONS.AnimateSequence(arg_2_0, "FadeOut")

		arg_2_0:Wait(arg_2_0._fadeTime).onComplete = function()
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
			Engine.EBCGADABJ()
		end
	end

	LUI.TextChat.SetupMenuForNoChat(arg_2_0)
	ACTIONS.ScaleFullscreen(arg_2_0.BackingWideAspectRatio)

	local var_2_0 = Dvar.CFHDGABACF("QKKMRRLRR")
	local var_2_1 = var_2_0 == 5 or var_2_0 == 6

	if Engine.CGABICJHAI() and var_2_1 == true then
		ACTIONS.AnimateSequence(arg_2_0, "WideAspectRatioFrame")
	elseif Engine.CGABICJHAI() and var_2_0 == 3 then
		ACTIONS.AnimateSequence(arg_2_0, "TierAspectRatio")
	end
end

function BattlePassFullScreenPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "BattlePassFullScreenPopup"
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

	var_5_4.id = "BackingWideAspectRatio"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.BackingWideAspectRatio = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Cinematic"

	var_5_0:addElement(var_5_6)

	var_5_0.Cinematic = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "TierStatus"

	var_5_8:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_8:setText(MarkLocalized(""), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 780, _1080p * 850)
	var_5_0:addElement(var_5_8)

	var_5_0.TierStatus = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "BattlePass"

	var_5_10:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_10:setText(ToUpperCase(MarkLocalized(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS"))), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 112, _1080p * 148)
	var_5_0:addElement(var_5_10)

	var_5_0.BattlePass = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "UnlockText"

	var_5_12:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("BATTLEPASS/UPGRADE_UNLOCKED"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 148, _1080p * 188)
	var_5_0:addElement(var_5_12)

	var_5_0.UnlockText = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "BattlePassText"

	var_5_14:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS")), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 883, _1080p * 917)
	var_5_0:addElement(var_5_14)

	var_5_0.BattlePassText = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "VignetteRight"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_16:SetAlpha(0, 0)
	var_5_16:setImage(RegisterMaterial("gradient_curve"), 0)
	var_5_16:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_5_0:addElement(var_5_16)

	var_5_0.VignetteRight = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "VignetteLeft"

	var_5_18:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_18:SetAlpha(0, 0)
	var_5_18:SetYRotation(180, 0)
	var_5_18:setImage(RegisterMaterial("gradient_curve"), 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_5_0:addElement(var_5_18)

	var_5_0.VignetteLeft = var_5_18

	local function var_5_19()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("FadeOut", var_5_21)

	local var_5_22 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("FadeOut", var_5_22)

	local var_5_23 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("FadeOut", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("FadeOut", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("FadeOut", var_5_25)

	local function var_5_26()
		var_5_6:AnimateSequence("FadeOut")
		var_5_8:AnimateSequence("FadeOut")
		var_5_10:AnimateSequence("FadeOut")
		var_5_12:AnimateSequence("FadeOut")
		var_5_14:AnimateSequence("FadeOut")
	end

	var_5_0._sequences.FadeOut = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 3150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ShowTier", var_5_28)

	local function var_5_29()
		var_5_8:AnimateSequence("ShowTier")
	end

	var_5_0._sequences.ShowTier = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 828
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainLight.File
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("CompleteBattlePass", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("CompleteBattlePass", var_5_32)

	local var_5_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("CompleteBattlePass", var_5_33)

	local function var_5_34()
		var_5_8:AnimateSequence("CompleteBattlePass")
		var_5_10:AnimateSequence("CompleteBattlePass")
		var_5_12:AnimateSequence("CompleteBattlePass")
	end

	var_5_0._sequences.CompleteBattlePass = var_5_34

	local var_5_35
	local var_5_36 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ShowBattlePass", var_5_36)

	local function var_5_37()
		var_5_14:AnimateSequence("ShowBattlePass")
	end

	var_5_0._sequences.ShowBattlePass = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WideAspectRatioFrame", var_5_39)

	local var_5_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WideAspectRatioFrame", var_5_40)

	local function var_5_41()
		var_5_16:AnimateSequence("WideAspectRatioFrame")
		var_5_18:AnimateSequence("WideAspectRatioFrame")
	end

	var_5_0._sequences.WideAspectRatioFrame = var_5_41

	local var_5_42
	local var_5_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -265
		}
	}

	var_5_8:RegisterAnimationSequence("TierAspectRatio", var_5_43)

	local function var_5_44()
		var_5_8:AnimateSequence("TierAspectRatio")
	end

	var_5_0._sequences.TierAspectRatio = var_5_44

	local var_5_45
	local var_5_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 828
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("CompleteBattlePassS5", var_5_46)

	local var_5_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("CompleteBattlePassS5", var_5_47)

	local var_5_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("CompleteBattlePassS5", var_5_48)

	local function var_5_49()
		var_5_8:AnimateSequence("CompleteBattlePassS5")
		var_5_10:AnimateSequence("CompleteBattlePassS5")
		var_5_12:AnimateSequence("CompleteBattlePassS5")
	end

	var_5_0._sequences.CompleteBattlePassS5 = var_5_49

	local var_5_50
	local var_5_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowDark
		}
	}

	var_5_8:RegisterAnimationSequence("S5", var_5_51)

	local var_5_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowLight
		}
	}

	var_5_10:RegisterAnimationSequence("S5", var_5_52)

	local var_5_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowLight
		}
	}

	var_5_12:RegisterAnimationSequence("S5", var_5_53)

	local function var_5_54()
		var_5_8:AnimateSequence("S5")
		var_5_10:AnimateSequence("S5")
		var_5_12:AnimateSequence("S5")
	end

	var_5_0._sequences.S5 = var_5_54

	local var_5_55
	local var_5_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ShowHeaderS5", var_5_56)

	local var_5_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ShowHeaderS5", var_5_57)

	local function var_5_58()
		var_5_10:AnimateSequence("ShowHeaderS5")
		var_5_12:AnimateSequence("ShowHeaderS5")
	end

	var_5_0._sequences.ShowHeaderS5 = var_5_58

	local var_5_59
	local var_5_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 5 * _1080p
		}
	}

	var_5_8:RegisterAnimationSequence("CompleteKerning", var_5_60)

	local function var_5_61()
		var_5_8:AnimateSequence("CompleteKerning")
	end

	var_5_0._sequences.CompleteKerning = var_5_61

	local var_5_62
	local var_5_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 785
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 855
		}
	}

	var_5_8:RegisterAnimationSequence("ShowTierS5", var_5_63)

	local function var_5_64()
		var_5_8:AnimateSequence("ShowTierS5")
	end

	var_5_0._sequences.ShowTierS5 = var_5_64

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassFullScreenPopup", BattlePassFullScreenPopup)
LockTable(_M)
