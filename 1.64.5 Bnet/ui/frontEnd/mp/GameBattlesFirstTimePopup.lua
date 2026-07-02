module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.ProceedButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		Onboarding.GameBattles.MarkCompleted(arg_1_0, arg_1_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.ProceedButton:StartTimer()
	arg_1_0.PrivacyPolicyButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		Engine.BHECIAHGC(arg_1_1, 0, GAMEBATTLES.URL.MLG_PRIVACY_POLICY)

		return true
	end)
	arg_1_0.TermsOfServiceButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		Engine.BHECIAHGC(arg_1_1, 0, GAMEBATTLES.URL.MLG_TERMS_OF_SERVICE)

		return true
	end)

	local var_1_0 = LUI.UIBindButton.new()

	var_1_0.id = "selfBindButton"

	arg_1_0:addElement(var_1_0)

	arg_1_0.bindButton = var_1_0

	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		ACTIONS.LeaveMenu(arg_1_0)
		arg_1_0:dispatchEventToRoot({
			name = "gamebattles_onboarding_popup_canceled",
			immediate = true,
			controller = arg_1_1
		})
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function GameBattlesFirstTimePopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "GameBattlesFirstTimePopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_4:SetAlpha(0.8, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "ButtonHelperBar"

	var_6_6.Background:SetAlpha(0, 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 336, _1080p * 396)
	var_6_0:addElement(var_6_6)

	var_6_0.ButtonHelperBar = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "GenericPopupWindow"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -336, _1080p * 336)
	var_6_0:addElement(var_6_8)

	var_6_0.GenericPopupWindow = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "Title"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_10:setText(Engine.CBBHFCGDIC("LUA_MENU/MLG_GAMEBATTLES_CAPS"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -304, _1080p * -244)
	var_6_0:addElement(var_6_10)

	var_6_0.Title = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Panel1"

	var_6_12.Image:setImage(RegisterMaterial("gamebattles_ftue_onboarding_image_1"), 0)
	var_6_12.Description:setText(Engine.CBBHFCGDIC("ONBOARDING/GAMEBATTLES_1"), 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -804, _1080p * -292, _1080p * -206, _1080p * 150)
	var_6_0:addElement(var_6_12)

	var_6_0.Panel1 = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Panel2"

	var_6_14.Image:setImage(RegisterMaterial("gamebattles_ftue_onboarding_image_2"), 0)
	var_6_14.Description:setText(Engine.CBBHFCGDIC("ONBOARDING/GAMEBATTLES_2"), 0)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -206, _1080p * 150)
	var_6_0:addElement(var_6_14)

	var_6_0.Panel2 = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "Panel3"

	var_6_16.Image:setImage(RegisterMaterial("gamebattles_ftue_onboarding_image_3"), 0)
	var_6_16.Description:setText(Engine.CBBHFCGDIC("ONBOARDING/GAMEBATTLES_3"), 0)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 292, _1080p * 804, _1080p * -206, _1080p * 150)
	var_6_0:addElement(var_6_16)

	var_6_0.Panel3 = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIStyledText.new()

	var_6_18.id = "LegalAgreementCaption"

	var_6_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_18:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEGAL_AGREEMENT_CAPTION"), 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_18:SetAlignment(LUI.Alignment.Center)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -830, _1080p * 830, _1080p * 684, _1080p * 706)
	var_6_0:addElement(var_6_18)

	var_6_0.LegalAgreementCaption = var_6_18

	local var_6_19
	local var_6_20 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_6_1
	})

	var_6_20.id = "ProceedButton"

	var_6_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_6_20.Text:SetAlignment(LUI.Alignment.Center)
	var_6_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 750, _1080p * 1170, _1080p * 192, _1080p * 230)
	var_6_0:addElement(var_6_20)

	var_6_0.ProceedButton = var_6_20

	local var_6_21
	local var_6_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_6_1
	})

	var_6_22.id = "PrivacyPolicyButton"

	var_6_22.Text:SetLeft(_1080p * 20, 0)
	var_6_22.Text:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MLGTOS_BUTTON"), 0)
	var_6_22.Text:SetAlignment(LUI.Alignment.Center)
	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 776, _1080p * 814)
	var_6_0:addElement(var_6_22)

	var_6_0.PrivacyPolicyButton = var_6_22

	local var_6_23
	local var_6_24 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_6_1
	})

	var_6_24.id = "TermsOfServiceButton"

	var_6_24.Text:SetLeft(_1080p * 20, 0)
	var_6_24.Text:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/TERMS_OF_SERVICE"), 0)
	var_6_24.Text:SetAlignment(LUI.Alignment.Center)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 822, _1080p * 860)
	var_6_0:addElement(var_6_24)

	var_6_0.TermsOfServiceButton = var_6_24

	function var_6_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_25 = LUI.UIBindButton.new()

	var_6_25.id = "selfBindButton"

	var_6_0:addElement(var_6_25)

	var_6_0.bindButton = var_6_25

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GameBattlesFirstTimePopup", GameBattlesFirstTimePopup)
LockTable(_M)
