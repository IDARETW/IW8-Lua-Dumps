module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = SOUND_SETS.storefront.purchaseBundleComplete
	local var_1_1 = "mp_store_bundle_purchase"
	local var_1_2 = 3000

	if arg_1_2.isPurchase then
		ACTIONS.AnimateSequence(arg_1_0, "Purchased")
	elseif arg_1_2.isCollect then
		ACTIONS.AnimateSequence(arg_1_0, "Collected")
	else
		assert(false, "Attempt to open in unspecified state")
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)

		return
	end

	Engine.BJDBIAGIDA(var_1_0)
	Engine.DFCGFCGBFD(var_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.BackingWideAspectRatio)

	if Engine.CGABICJHAI() then
		local var_1_3 = Dvar.CFHDGABACF("QKKMRRLRR")

		if var_1_3 == 5 or var_1_3 == 6 then
			ACTIONS.AnimateSequence(arg_1_0, "WideAspectRatioFrame")
		end
	end

	arg_1_0:Wait(var_1_2).onComplete = function()
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

	var_3_8.id = "VignetteRight"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.VignetteRight = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "VignetteLeft"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_10:SetAlpha(0, 0)
	var_3_10:SetYRotation(180, 0)
	var_3_10:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.VignetteLeft = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Message"

	var_3_12:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PURCHASED")), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -35, _1080p * 35)
	var_3_0:addElement(var_3_12)

	var_3_0.Message = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14
	local var_3_15 = {
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

	var_3_12:RegisterAnimationSequence("Purchased", var_3_15)

	local function var_3_16()
		var_3_12:AnimateSequence("Purchased")
	end

	var_3_0._sequences.Purchased = var_3_16

	local var_3_17
	local var_3_18 = {
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

	var_3_12:RegisterAnimationSequence("Collected", var_3_18)

	local function var_3_19()
		var_3_12:AnimateSequence("Collected")
	end

	var_3_0._sequences.Collected = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("WideAspectRatioFrame", var_3_21)

	local var_3_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("WideAspectRatioFrame", var_3_22)

	local function var_3_23()
		var_3_8:AnimateSequence("WideAspectRatioFrame")
		var_3_10:AnimateSequence("WideAspectRatioFrame")
	end

	var_3_0._sequences.WideAspectRatioFrame = var_3_23

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("StoreFullScreenCinematic", StoreFullScreenCinematic)
LockTable(_M)
