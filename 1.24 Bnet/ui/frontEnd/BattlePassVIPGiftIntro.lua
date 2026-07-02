module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1

	if BATTLEPASS.IsOwned(arg_1_1) then
		arg_1_0.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS_GIFT"))

		var_1_0 = "mp_battlepass_celebration_purchase"
		var_1_1 = SOUND_SETS.battlePass.bpTierPurchase
	else
		arg_1_0.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/THANK_YOU_GIFT"))

		var_1_0 = "mp_battlepass_celebration_purchase"
		var_1_1 = SOUND_SETS.battlePass.bpTierPurchase
	end

	Engine.DFCGFCGBFD(var_1_0, VideoPlaybackFlags.LOOP)
	Engine.BJDBIAGIDA(var_1_1)
	arg_1_0.ContinueButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if BATTLEPASS.IsOwned(arg_1_1) then
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
end

function BattlePassVIPGiftIntro(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "BattlePassVIPGiftIntro"
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
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Title"

	var_3_8:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_3_8:setText(ToUpperCase(""), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -731, _1080p * 731, _1080p * -384, _1080p * -324)
	var_3_0:addElement(var_3_8)

	var_3_0.Title = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "ContinueButton"

	var_3_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_3_10.Text:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 359, _1080p * 397)
	var_3_0:addElement(var_3_10)

	var_3_0.ContinueButton = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "VignetteRight"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.VignetteRight = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "VignetteLeft"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:SetYRotation(180, 0)
	var_3_14:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_3_0:addElement(var_3_14)

	var_3_0.VignetteLeft = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("WideAspectRatioFrame", var_3_17)

	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("WideAspectRatioFrame", var_3_18)

	local function var_3_19()
		var_3_12:AnimateSequence("WideAspectRatioFrame")
		var_3_14:AnimateSequence("WideAspectRatioFrame")
	end

	var_3_0._sequences.WideAspectRatioFrame = var_3_19

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassVIPGiftIntro", BattlePassVIPGiftIntro)
LockTable(_M)
