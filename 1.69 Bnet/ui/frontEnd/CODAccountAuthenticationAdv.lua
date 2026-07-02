module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.ButtonCancel:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenu(arg_2_0:GetCurrentMenu())
	end)
	arg_1_0.ButtonEnroll:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		Engine.BHECIAHGC(arg_1_1, WebBrowserType.FULLSCREEN, CODACCOUNT.AccountSettingsURL)
		LUI.FlowManager.RequestLeaveMenu(arg_3_0:GetCurrentMenu())
	end)
	arg_1_0:addEventHandler("menu_close", function(arg_4_0, arg_4_1)
		if arg_1_2.state.SetHasSeenSummary ~= nil and arg_1_2.state.SetHasSeenCODAccountOTP ~= nil then
			arg_1_2.state:SetHasSeenSummary()
			arg_1_2.state:SetHasSeenCODAccountOTP(arg_1_1)
		end
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)

	arg_1_0.isQuickAccessShortcutsDisabled = true

	if arg_1_2.tfa_warning then
		arg_1_0.Body:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_AD_SETUP_INFO_1") .. "\n\n" .. Engine.CBBHFCGDIC("CODACCOUNT/TFA_WARNING_MESSAGE"), 0)
		arg_1_0.ButtonCancel.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_NOT_NOW") .. " (" .. Engine.CBBHFCGDIC("CODACCOUNT/REMAINING", arg_1_2.logins_remaining) .. ")"), 0)
		Engine.DFJDIFJEGA("hasEverSeen_CODAccount", 1, arg_1_1)
		Engine.DAGFFDGFII("updategamerprofile " .. arg_1_1)
	end
end

function CODAccountAuthenticationAdv(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIHorizontalNavigator.new()

	var_5_0.id = "CODAccountAuthenticationAdv"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Window"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -610, _1080p * 610, _1080p * -350, _1080p * 350)
	var_5_0:addElement(var_5_6)

	var_5_0.Window = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Header"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_AD_HEADING"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -610, _1080p * 610, _1080p * -326, _1080p * -266)
	var_5_0:addElement(var_5_8)

	var_5_0.Header = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Line"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -269, _1080p * -268)
	var_5_0:addElement(var_5_10)

	var_5_0.Line = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "SubHeader"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_HEADING"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 450, _1080p * -176, _1080p * -140)
	var_5_0:addElement(var_5_12)

	var_5_0.SubHeader = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Instructions"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_AD_SETUP_INFO_2"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -342, _1080p * 342, _1080p * 110, _1080p * 134)
	var_5_0:addElement(var_5_14)

	var_5_0.Instructions = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Body"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_5_16:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_AD_SETUP_INFO_1"), 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 450, _1080p * -126, _1080p * -102)
	var_5_0:addElement(var_5_16)

	var_5_0.Body = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "ButtonEnroll"

	var_5_18.Text:SetLeft(_1080p * 20, 0)
	var_5_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_ENROLL")), 0)
	var_5_18.Text:SetAlignment(LUI.Alignment.Center)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * -10, _1080p * 230, _1080p * 290)
	var_5_0:addElement(var_5_18)

	var_5_0.ButtonEnroll = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "ButtonCancel"

	var_5_20.Text:SetLeft(_1080p * 20, 0)
	var_5_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_NOT_NOW")), 0)
	var_5_20.Text:SetAlignment(LUI.Alignment.Center)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 460, _1080p * 230, _1080p * 290)
	var_5_0:addElement(var_5_20)

	var_5_0.ButtonCancel = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIImage.new()

	var_5_22.id = "Icon"

	var_5_22:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_22:setImage(RegisterMaterial("ui_icon_cod_account_tfa"), 0)
	var_5_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -422, _1080p * -154, _1080p * -242, _1080p * 26)
	var_5_0:addElement(var_5_22)

	var_5_0.Icon = var_5_22

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_5_23 = LUI.UIBindButton.new()

	var_5_23.id = "selfBindButton"

	var_5_0:addElement(var_5_23)

	var_5_0.bindButton = var_5_23

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CODAccountAuthenticationAdv", CODAccountAuthenticationAdv)
LockTable(_M)
