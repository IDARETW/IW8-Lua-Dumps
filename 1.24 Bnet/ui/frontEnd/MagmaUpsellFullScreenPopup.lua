module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2)
	assert(arg_1_2.controllerIndex)
	Engine.DFCGFCGBFD("mp_mw_premium_upgrade_loop", VideoPlaybackFlags.LOOP)
	ACTIONS.AnimateSequence(arg_1_0, "PurchaseFadeIn")
	arg_1_0:addEventHandler("transaction_completed", function(arg_2_0, arg_2_1)
		local var_2_0 = LUI.UITimer.new({
			interval = 100,
			event = {
				name = "check_upsell_completed"
			}
		})

		var_2_0.id = "checkExitTimer"

		arg_2_0:addElement(var_2_0)
		Engine.DJADIGFBGI(arg_1_1)
		var_2_0:registerEventHandler("check_upsell_completed", function()
			if Engine.BCJJBCDGAC() and Engine.ECFHDAEIDA(arg_1_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangePopup", false, arg_1_1, false, {
					itemID = arg_2_1.itemID
				})
				arg_2_0:dispatchEventToRoot({
					immediate = true,
					name = "title_purchased"
				})
				Engine.DFJDIFJEGA("isSPNew", 1, arg_1_1)
				Engine.DFJDIFJEGA("isMPNew", 1, arg_1_1)
				Engine.DFJDIFJEGA("isCPNew", 1, arg_1_1)
				Engine.EBIDFIDHIE("updategamerprofile")
				LUI.FlowManager.RequestLeaveMenu(arg_1_0)
			end
		end)
	end)
	arg_1_0:addEventHandler("exchanged_item", function(arg_4_0, arg_4_1)
		if STORE.IsTitleID(arg_4_1.exchangeID) then
			Engine.DFCGFCGBFD("mp_mw_premium_upgrade")
			arg_1_0.PurchasingText:SetAlpha(0)
			ACTIONS.AnimateSequence(arg_1_0, "PremiumUpgrade")
			Dvar.DHEGHJJJHI("OPONKOMKQ", true)
			arg_1_0:processEvent({
				name = "transaction_completed",
				itemID = arg_4_1.exchangeID
			})
		end
	end)
	arg_1_0:addEventHandler("exchanged_item_failed", function(arg_5_0, arg_5_1)
		Fences.CABJICFBDA(CoD.FenceChannel.Default)
		LUI.FlowManager.RequestLeaveMenu(arg_5_0)
	end)
	arg_1_0:addEventHandler("ingamestore_purchased_product", function(arg_6_0, arg_6_1)
		assert(arg_6_1.transactionResult)

		if Engine.DDJFBBJAIG() and arg_6_1.transactionResult ~= STORE.TransactionResult.TRANSACTION_SUCCEEDED then
			Fences.CABJICFBDA(CoD.FenceChannel.Default)
			LUI.FlowManager.RequestLeaveMenu(arg_6_0)
		end
	end)
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)
	ACTIONS.ScaleFullscreen(arg_1_0.BackingWideAspectRatio)

	local var_1_0 = Dvar.CFHDGABACF("QKKMRRLRR")
	local var_1_1 = var_1_0 == 5 or var_1_0 == 6

	if Engine.CGABICJHAI() and var_1_1 == true then
		ACTIONS.AnimateSequence(arg_1_0, "WideAspectRatioFrame")
	elseif Engine.CGABICJHAI() and var_1_0 == 3 then
		ACTIONS.AnimateSequence(arg_1_0, "TierAspectRatio")
	end

	if Engine.CGABICJHAI() then
		ACTIONS.AnimateSequence(arg_1_0, "PurchasePC")
	end
end

function MagmaUpsellFullScreenPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "MagmaUpsellFullScreenPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "BackingWideAspectRatio"

	var_7_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.BackingWideAspectRatio = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "Cinematic"

	var_7_0:addElement(var_7_6)

	var_7_0.Cinematic = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "PurchasingText"

	var_7_8:SetRGBFromTable(SWATCHES.genericMenu.titleCinematicBlue, 0)
	var_7_8:SetAlpha(0, 0)
	var_7_8:setText(MarkLocalized(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE")), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 780, _1080p * 850)
	var_7_0:addElement(var_7_8)

	var_7_0.PurchasingText = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "UpgradeText"

	var_7_10:SetRGBFromTable(SWATCHES.scrapRarity.quality3, 0)
	var_7_10:SetAlpha(0, 0)
	var_7_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREMIUM_UPGRADE")), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetTracking(18 * _1080p, 0)
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetShadowMinDistance(-0.6, 0)
	var_7_10:SetShadowMaxDistance(0.8, 0)
	var_7_10:SetShadowRGBFromTable(SWATCHES.text.dedicatedServer, 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -265, _1080p * -177)
	var_7_0:addElement(var_7_10)

	var_7_0.UpgradeText = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "VignetteRight"

	var_7_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_12:SetAlpha(0, 0)
	var_7_12:setImage(RegisterMaterial("gradient_curve"), 0)
	var_7_12:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_7_0:addElement(var_7_12)

	var_7_0.VignetteRight = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "VignetteLeft"

	var_7_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_14:SetAlpha(0, 0)
	var_7_14:SetYRotation(180, 0)
	var_7_14:setImage(RegisterMaterial("gradient_curve"), 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_7_0:addElement(var_7_14)

	var_7_0.VignetteLeft = var_7_14

	local function var_7_15()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_15

	local var_7_16
	local var_7_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WideAspectRatioFrame", var_7_17)

	local var_7_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WideAspectRatioFrame", var_7_18)

	local function var_7_19()
		var_7_12:AnimateSequence("WideAspectRatioFrame")
		var_7_14:AnimateSequence("WideAspectRatioFrame")
	end

	var_7_0._sequences.WideAspectRatioFrame = var_7_19

	local var_7_20
	local var_7_21 = {
		{
			value = 0,
			duration = 2400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 480,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inBack
		}
	}

	var_7_10:RegisterAnimationSequence("PremiumUpgrade", var_7_21)

	local function var_7_22()
		var_7_10:AnimateSequence("PremiumUpgrade")
	end

	var_7_0._sequences.PremiumUpgrade = var_7_22

	local var_7_23
	local var_7_24 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 280,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("PurchaseFadeIn", var_7_24)

	local function var_7_25()
		var_7_8:AnimateSequence("PurchaseFadeIn")
	end

	var_7_0._sequences.PurchaseFadeIn = var_7_25

	local var_7_26
	local var_7_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 839
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 891
		}
	}

	var_7_8:RegisterAnimationSequence("PurchasePC", var_7_27)

	local function var_7_28()
		var_7_8:AnimateSequence("PurchasePC")
	end

	var_7_0._sequences.PurchasePC = var_7_28

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("MagmaUpsellFullScreenPopup", MagmaUpsellFullScreenPopup)
LockTable(_M)
