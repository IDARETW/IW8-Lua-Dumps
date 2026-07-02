module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = SOUND_SETS.storefront.purchaseBundleComplete
	local var_1_1 = "mp_store_bundle_purchase"
	local var_1_2 = false
	local var_1_3 = 3000

	if arg_1_2.isVIP then
		if arg_1_2.isPremium then
			var_1_0 = SOUND_SETS.battlePass.bpVIPPremiumCollect
			var_1_1 = "mp_battlepass_celebration_purchase"

			ACTIONS.AnimateSequence(arg_1_0, "VIPOwned")
		else
			var_1_0 = SOUND_SETS.battlePass.bpVIPNonPremiumCollect
			var_1_1 = "mp_battlepass_celebration_purchase"

			ACTIONS.AnimateSequence(arg_1_0, "VIPNotOwned")
		end
	elseif arg_1_2.isSeasonalEvent then
		if not arg_1_2.completionBink then
			LUI.FlowManager.RequestLeaveMenu(arg_1_0)

			return
		end

		var_1_0 = arg_1_2.completionBink.soundSet
		var_1_1 = arg_1_2.completionBink.video
		var_1_2 = arg_1_2.completionBink.isEncrypted

		ACTIONS.AnimateSequence(arg_1_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())

		var_1_3 = 4000

		if not IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "Kerning")
		end

		if arg_1_2.isComplete then
			arg_1_0.Message:setText(Engine.CBBHFCGDIC("AAR/COMLETE"))
		end
	elseif arg_1_2.isPurchase then
		ACTIONS.AnimateSequence(arg_1_0, "Purchased")
	elseif arg_1_2.isCollect then
		ACTIONS.AnimateSequence(arg_1_0, "Collected")
	else
		assert(false, "Attempt to open in unspecified state")
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)

		return
	end

	if var_1_0 ~= nil and var_1_0 ~= "" then
		Engine.BJDBIAGIDA(var_1_0)
	end

	if var_1_2 then
		Engine.BIFAAAECJJ(var_1_1)
	else
		Engine.DFCGFCGBFD(var_1_1)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.BackingWideAspectRatio)

	if Engine.CGABICJHAI() then
		local var_1_4 = Dvar.CFHDGABACF("QKKMRRLRR")

		if var_1_4 == 5 or var_1_4 == 6 then
			ACTIONS.AnimateSequence(arg_1_0, "WideAspectRatioFrame")
		end
	end

	arg_1_0:Wait(var_1_3).onComplete = function()
		Engine.EBCGADABJ()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
	end
end

function StoreFullScreenCinematic(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "StoreFullScreenCinematic"
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

	var_3_4.id = "BackingWideAspectRatio"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.BackingWideAspectRatio = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Cinematic"

	var_3_0:addElement(var_3_6)

	var_3_0.Cinematic = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "BannerBacking"

	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 400, _1080p * -400, _1080p * -40, _1080p * 40)
	var_3_0:addElement(var_3_8)

	var_3_0.BannerBacking = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "VignetteRight"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_10:SetAlpha(0, 0)
	var_3_10:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.VignetteRight = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "VignetteLeft"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:SetYRotation(180, 0)
	var_3_12:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.VignetteLeft = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Message"

	var_3_14:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PURCHASED")), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -35, _1080p * 35)
	var_3_0:addElement(var_3_14)

	var_3_0.Message = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PURCHASED"))
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Purchased", var_3_17)

	local function var_3_18()
		var_3_14:AnimateSequence("Purchased")
	end

	var_3_0._sequences.Purchased = var_3_18

	local var_3_19
	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/COLLECTED"))
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Collected", var_3_20)

	local function var_3_21()
		var_3_14:AnimateSequence("Collected")
	end

	var_3_0._sequences.Collected = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("WideAspectRatioFrame", var_3_23)

	local var_3_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("WideAspectRatioFrame", var_3_24)

	local function var_3_25()
		var_3_10:AnimateSequence("WideAspectRatioFrame")
		var_3_12:AnimateSequence("WideAspectRatioFrame")
	end

	var_3_0._sequences.WideAspectRatioFrame = var_3_25

	local var_3_26
	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 242
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 322
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.BRVIPGold
		},
		{
			value = 0.2,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("VIPOwned", var_3_27)

	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/COLLECTED"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 248
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.BRVIPGold
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("VIPOwned", var_3_28)

	local function var_3_29()
		var_3_8:AnimateSequence("VIPOwned")
		var_3_14:AnimateSequence("VIPOwned")
	end

	var_3_0._sequences.VIPOwned = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 242
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 322
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("VIPNotOwned", var_3_31)

	local var_3_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/COLLECTED"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 248
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 318
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("VIPNotOwned", var_3_32)

	local function var_3_33()
		var_3_8:AnimateSequence("VIPNotOwned")
		var_3_14:AnimateSequence("VIPNotOwned")
	end

	var_3_0._sequences.VIPNotOwned = var_3_33

	local var_3_34
	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 1 * _1080p
		}
	}

	var_3_14:RegisterAnimationSequence("Kerning", var_3_35)

	local function var_3_36()
		var_3_14:AnimateSequence("Kerning")
	end

	var_3_0._sequences.Kerning = var_3_36

	local var_3_37
	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 304
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisDarkRed
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/COLLECTED"))
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("SetupSeasonalEvent", var_3_38)

	local function var_3_39()
		var_3_14:AnimateSequence("SetupSeasonalEvent")
	end

	var_3_0._sequences.SetupSeasonalEvent = var_3_39

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("StoreFullScreenCinematic", StoreFullScreenCinematic)
LockTable(_M)
