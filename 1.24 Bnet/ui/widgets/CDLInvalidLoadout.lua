module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
	end

	arg_1_0.ButtonConfirm:addEventHandler("button_action", function()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
		Dvar.DHEGHJJJHI("RQKRQLQPK", true)
		arg_1_2.confirmAction()
	end)
	arg_1_0.ButtonCancel:addEventHandler("button_action", var_1_0)

	if Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and not Lobby.CECBCJDIAG() then
		ACTIONS.AnimateSequence(arg_1_0, "Host")
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.Darkener)
end

function CDLInvalidLoadout(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "CDLInvalidLoadout"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -292, _1080p * 292)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ButtonHelperBar"

	var_4_8.Background:SetAlpha(0, 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 292, _1080p * 352)
	var_4_0:addElement(var_4_8)

	var_4_0.ButtonHelperBar = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Title"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("MPUI/CDL_INVALID_LOADOUTS"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -261, _1080p * -201)
	var_4_0:addElement(var_4_10)

	var_4_0.Title = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Image"

	var_4_12:setImage(RegisterMaterial("cdl_logo_large"), 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -726, _1080p * -98, _1080p * -66, _1080p * 66)
	var_4_0:addElement(var_4_12)

	var_4_0.Image = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ButtonConfirm"

	var_4_14.BackgroundDarkener:SetAlpha(0.5, 0)
	var_4_14.Text:SetLeft(_1080p * 20, 0)
	var_4_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/YES")), 0)
	var_4_14.Text:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 420, _1080p * 101, _1080p * 139)
	var_4_0:addElement(var_4_14)

	var_4_0.ButtonConfirm = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "ButtonCancel"

	var_4_16.BackgroundDarkener:SetAlpha(0.5, 0)
	var_4_16.Text:SetLeft(_1080p * 20, 0)
	var_4_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NO")), 0)
	var_4_16.Text:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 420, _1080p * 151, _1080p * 189)
	var_4_0:addElement(var_4_16)

	var_4_0.ButtonCancel = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIText.new()

	var_4_18.id = "Text"

	var_4_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_18:setText(Engine.CBBHFCGDIC("MPUI/CDL_INVALID_TEXT"), 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_18:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 602, _1080p * -124, _1080p * -100)
	var_4_0:addElement(var_4_18)

	var_4_0.Text = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIText.new()

	var_4_20.id = "TextHost"

	var_4_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_20:SetAlpha(0, 0)
	var_4_20:setText(Engine.CBBHFCGDIC("MPUI/CDL_INVALID_HOST_TEXT"), 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_20:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 602, _1080p * -124, _1080p * -100)
	var_4_0:addElement(var_4_20)

	var_4_0.TextHost = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Host", var_4_22)

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("Host", var_4_23)

	local function var_4_24()
		var_4_18:AnimateSequence("Host")
		var_4_20:AnimateSequence("Host")
	end

	var_4_0._sequences.Host = var_4_24

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CDLInvalidLoadout", CDLInvalidLoadout)
LockTable(_M)
