module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1

	if BATTLEPASS.IsOwned(arg_1_1, nil, true) then
		arg_1_0.GiftText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS_GIFT")))
		arg_1_0.OwnerText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS_OWNER")))

		var_1_0 = "mp_battlepass_onboarding"
		var_1_1 = SOUND_SETS.battlePass.bpVIPPremiumIntro

		ACTIONS.AnimateSequence(arg_1_0, "Owner")
	else
		arg_1_0.GiftText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/FREE_GIFT")))
		arg_1_0.OwnerText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS")))

		var_1_0 = "mp_battlepass_onboarding"
		var_1_1 = SOUND_SETS.battlePass.bpVIPNonPremiumIntro

		ACTIONS.AnimateSequence(arg_1_0, "NonOwner")
	end

	ACTIONS.AnimateSequence(arg_1_0, "VIP")
	Engine.DFCGFCGBFD(var_1_0, VideoPlaybackFlags.LOOP)
	Engine.BJDBIAGIDA(var_1_1)
	arg_1_0.ContinueButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if BATTLEPASS.IsOwned(arg_1_1, nil, true) then
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_2_1.controller, true, {
				isBPVIPGift = true
			}, nil, false, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassVIPGiftUpsell", true, arg_2_1.controller, true, {}, nil, false, true)
		end
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.BackingWideAspectRatio)

	local var_1_2 = Dvar.CFHDGABACF("QKKMRRLRR")
	local var_1_3 = var_1_2 == 5 or var_1_2 == 6

	if Engine.CGABICJHAI() and var_1_3 then
		ACTIONS.AnimateSequence(arg_1_0, "WideAspectRatioFrame")
	end

	local var_1_4 = {
		RegisterMaterial("bp_vip_wreath")
	}
	local var_1_5 = LUI.UIElement.new()

	var_1_5.id = "VIPWreath"

	var_1_5:SetupImageTableStreamer(var_1_4)
	arg_1_0:addElement(LOOT.GetLootFlareMaterialStreamer())
	arg_1_0:addElement(var_1_5)
	ACTIONS.AnimateSequence(arg_1_0.ContinueButton, "Glint")
	ACTIONS.AnimateSequence(arg_1_0.ContinueButton, "ButtonUpGlint")
	ACTIONS.AnimateSequence(arg_1_0.ContinueButton, "LowGlow")
	arg_1_0.ContinueButton:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0.ContinueButton, "ButtonUpGlint")
	end)
	arg_1_0.ContinueButton:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_1_0.ContinueButton, "ButtonOverGlint")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function BattlePassVIPGiftIntro(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "BattlePassVIPGiftIntro"
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
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "OwnerText"

	var_5_8:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_8:SetAlpha(0.5, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetTracking(5 * _1080p, 0)
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * 262, _1080p * 292)
	var_5_0:addElement(var_5_8)

	var_5_0.OwnerText = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "GiftText"

	var_5_10:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_10:SetTracking(5 * _1080p, 0)
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -731, _1080p * 731, _1080p * 289, _1080p * 359)
	var_5_0:addElement(var_5_10)

	var_5_0.GiftText = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "ContinueButton"

	var_5_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_5_12.Text:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 374, _1080p * 412)
	var_5_0:addElement(var_5_12)

	var_5_0.ContinueButton = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "VignetteRight"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setImage(RegisterMaterial("gradient_curve"), 0)
	var_5_14:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_5_0:addElement(var_5_14)

	var_5_0.VignetteRight = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "VignetteLeft"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_16:SetAlpha(0, 0)
	var_5_16:SetYRotation(180, 0)
	var_5_16:setImage(RegisterMaterial("gradient_curve"), 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_5_0:addElement(var_5_16)

	var_5_0.VignetteLeft = var_5_16

	local function var_5_17()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_17

	local var_5_18
	local var_5_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WideAspectRatioFrame", var_5_19)

	local var_5_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WideAspectRatioFrame", var_5_20)

	local function var_5_21()
		var_5_14:AnimateSequence("WideAspectRatioFrame")
		var_5_16:AnimateSequence("WideAspectRatioFrame")
	end

	var_5_0._sequences.WideAspectRatioFrame = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 8080,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 1080,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("VIP", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 8080,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 840,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("VIP", var_5_24)

	local function var_5_25()
		var_5_8:AnimateLoop("VIP")
		var_5_10:AnimateLoop("VIP")
	end

	var_5_0._sequences.VIP = var_5_25

	local var_5_26
	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_5_8:RegisterAnimationSequence("NonOwner", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_5_10:RegisterAnimationSequence("NonOwner", var_5_28)

	local function var_5_29()
		var_5_8:AnimateSequence("NonOwner")
		var_5_10:AnimateSequence("NonOwner")
	end

	var_5_0._sequences.NonOwner = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.BRVIPGold
		}
	}

	var_5_8:RegisterAnimationSequence("Owner", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.BRVIPGold
		}
	}

	var_5_10:RegisterAnimationSequence("Owner", var_5_32)

	local function var_5_33()
		var_5_8:AnimateSequence("Owner")
		var_5_10:AnimateSequence("Owner")
	end

	var_5_0._sequences.Owner = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_36)

	local function var_5_37()
		var_5_8:AnimateSequence("AR")
		var_5_10:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_37

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassVIPGiftIntro", BattlePassVIPGiftIntro)
LockTable(_M)
