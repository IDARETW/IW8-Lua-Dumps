module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0:AddButtonHelperText({
			side = "left",
			priority = 1,
			gamepad_only = true,
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	arg_1_0:addEventHandler("menu_create", var_1_0)

	if arg_1_2.isPulsed then
		arg_1_0.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAGMA_UPSELL_HEADER_PULSED")))
		arg_1_0.SecondaryText:SetAlpha(1)
		arg_1_0.TaglineText:SetAlpha(0)
	else
		arg_1_0.SecondaryText:SetAlpha(0)
		arg_1_0.TaglineText:SetAlpha(1)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Background)
end

function MagmaUpsellPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0.id = "MagmaUpsellPopup"
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

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.9, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ButtonHelperBar"

	var_3_6.Background:SetAlpha(0, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * 465, _1080p * 525)
	var_3_0:addElement(var_3_6)

	var_3_0.ButtonHelperBar = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "GenericPopupWindow"

	var_3_8.PopupBackground:SetAlpha(1, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -865, _1080p * 865, _1080p * -368, _1080p * 438)
	var_3_0:addElement(var_3_8)

	var_3_0.GenericPopupWindow = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "PreviewImage"

	var_3_10:setImage(RegisterMaterial("mw_upsell_popup_background"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -363, _1080p * 437)
	var_3_0:addElement(var_3_10)

	var_3_0.PreviewImage = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "AccoladesImage"

	var_3_12:setImage(RegisterMaterial("mw_upsell_popup_logo_accolades"), 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -363, _1080p * -107)
	var_3_0:addElement(var_3_12)

	var_3_0.AccoladesImage = var_3_12

	local var_3_13

	if CONDITIONS.IsUserSignedInDemonware(var_3_1) then
		local var_3_14 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_3_1
		})

		var_3_14.id = "PlayerDetails"

		var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_3_0:addElement(var_3_14)

		var_3_0.PlayerDetails = var_3_14
	end

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "SparksLeft"

	var_3_16:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_3_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 200, _1080p * 390, _1080p * -318, _1080p * -130)
	var_3_0:addElement(var_3_16)

	var_3_0.SparksLeft = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "SparksRight"

	var_3_18:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_3_18:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -200, _1080p * -388, _1080p * -318, _1080p * -130)
	var_3_0:addElement(var_3_18)

	var_3_0.SparksRight = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "HeaderText"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_20:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAGMA_UPSELL_HEADER")), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_20:SetWordWrap(false)
	var_3_20:SetTracking(2 * _1080p, 0)
	var_3_20:SetAlignment(LUI.Alignment.Center)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -117, _1080p * -81)
	var_3_0:addElement(var_3_20)

	var_3_0.HeaderText = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIStyledText.new()

	var_3_22.id = "TaglineText"

	var_3_22:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_22:setText(Engine.CBBHFCGDIC("LUA_MENU/MAGMA_UPSELL_TAGLINE"), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_22:SetWordWrap(false)
	var_3_22:SetTracking(1 * _1080p, 0)
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -34, _1080p * -4)
	var_3_0:addElement(var_3_22)

	var_3_0.TaglineText = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("MagmaUpsellPurchaseButton", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "PurchaseButton"

	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * 310, _1080p * 410)
	var_3_0:addElement(var_3_24)

	var_3_0.PurchaseButton = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIText.new()

	var_3_26.id = "SecondaryText"

	var_3_26:SetAlpha(0, 0)
	var_3_26:setText(ToUpperCase(LocalizeString("LUA_MENU/MAGMA_UPSELL_SECONDARY")), 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_26:SetAlignment(LUI.Alignment.Center)
	var_3_26:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 460, _1080p * 1460, _1080p * 799, _1080p * 829)
	var_3_0:addElement(var_3_26)

	var_3_0.SecondaryText = var_3_26

	local function var_3_27()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -356
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -316
		}
	}

	var_3_20:RegisterAnimationSequence("AR", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -113
		}
	}

	var_3_22:RegisterAnimationSequence("AR", var_3_30)

	local function var_3_31()
		var_3_20:AnimateSequence("AR")
		var_3_22:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_31

	var_3_24:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1.controller or var_3_1

		ACTIONS.OpenPopupMenu(var_3_0, "StoreGameUpsellPopup", true, var_6_0)
		ACTIONS.LeaveMenu(var_3_0)
	end)

	function var_3_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_32 = LUI.UIBindButton.new()

	var_3_32.id = "selfBindButton"

	var_3_0:addElement(var_3_32)

	var_3_0.bindButton = var_3_32

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MagmaUpsellPopup", MagmaUpsellPopup)
LockTable(_M)
