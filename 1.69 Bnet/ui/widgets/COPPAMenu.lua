module(..., package.seeall)

COPPA_PARENTAL_CONSENT_REQUIRED = 1
COPPA_ACCOUNT_DEACTIVATED = 2
COPPA_SUNSET_ERROR = 3
COPPA_DATE_OF_BIRTH = 4

local function var_0_0(arg_1_0)
	if Engine.CHBDHJJDGE() then
		arg_1_0.ButtonAction:SetButtonDisabled(true)
	end
end

local function var_0_1(arg_2_0)
	arg_2_0.LabelTop:SetAlpha(0)
	arg_2_0.LabelDays:SetAlpha(0)
	arg_2_0.LabelBottom:SetAlpha(0)
	arg_2_0.LabelDescBold:SetAlpha(0)
	arg_2_0.LabelDescExt:SetAlpha(0)

	if arg_2_0.requiredUserAction.name ~= nil then
		arg_2_0.LabelTitle:setText(arg_2_0.requiredUserAction.name)
	else
		arg_2_0.LabelTitle:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DOB_NAME"))
	end

	if arg_2_0.requiredUserAction.description ~= nil then
		arg_2_0.LabelDesc:setText(arg_2_0.requiredUserAction.description)
	else
		arg_2_0.LabelDesc:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DOB_DESC", Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DEFAULT_URL")))
	end

	arg_2_0.LabelURL:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DEFAULT_URL"))
	arg_2_0.ButtonAction.Text:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DOB_BTN_VERIFY_MY_ACCOUNT"))
	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0)
	arg_3_0.LabelDesc:SetAlpha(0)
	arg_3_0.LabelDescBold:SetAlpha(0)
	arg_3_0.LabelDescExt:SetAlpha(0)

	if arg_3_0.requiredUserAction.name ~= nil then
		arg_3_0.LabelTitle:setText(arg_3_0.requiredUserAction.name)
	else
		arg_3_0.LabelTitle:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_PARENTAL_CONSENT_REQUIRED_NAME"))
	end

	if arg_3_0.requiredUserAction.description ~= nil then
		arg_3_0.LabelTop:setText(arg_3_0.requiredUserAction.description)
	else
		arg_3_0.LabelTop:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_PARENTAL_CONSENT_REQUIRED_DESC"))
	end

	arg_3_0.LabelURL:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DEFAULT_URL"))

	local var_3_0 = "?"
	local var_3_1 = "?"

	if arg_3_0.requiredUserAction.countdown ~= nil then
		var_3_0 = arg_3_0.requiredUserAction.countdown

		local var_3_2 = os.time() + var_3_0 * 24 * 60 * 60

		var_3_1 = os.date("%B %d, %Y", var_3_2)
	end

	arg_3_0.LabelDays:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_PARENTAL_CONSENT_REQUIRED_DAYS", Engine.JCBDICCAH(var_3_0)))
	arg_3_0.LabelBottom:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_PARENTAL_CONSENT_REQUIRED_BOTTOM_TEXT", Engine.JCBDICCAH(var_3_1)))
	arg_3_0.ButtonAction.Text:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_PARENTAL_CONSENT_REQUIRED_BTN_REQUEST_CONSENT"))
	var_0_0(arg_3_0)
end

local function var_0_3(arg_4_0)
	arg_4_0.LabelTop:SetAlpha(0)
	arg_4_0.LabelDays:SetAlpha(0)
	arg_4_0.LabelBottom:SetAlpha(0)
	arg_4_0.LabelDesc:SetAlpha(0)

	if arg_4_0.requiredUserAction.name ~= nil then
		arg_4_0.LabelTitle:setText(arg_4_0.requiredUserAction.name)
	else
		arg_4_0.LabelTitle:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ACCOUNT_DEACTIVATED_NAME"))
	end

	local var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_UNKNOWN")

	if Engine.CBFHIIHAGH() then
		var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_STEAM")
	elseif Engine.CHBHFFFIGH() then
		if Engine.CHBDHJJDGE() then
			var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_UBICONNECT_STREAMING_FROM_CLOUD")
		else
			var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_UBICONNECT")
		end
	elseif Engine.EAABDHIDFJ() then
		var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_PCMSSTORE")
	elseif Engine.DBFCJBDJEC() then
		var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_BATTLENET")
	elseif Engine.FJCIBEDII() then
		var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_XBOX")
	elseif Engine.FHHBECDJA() then
		var_4_0 = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_FIRSTPARTY_NETWORK_SONY")
	end

	if arg_4_0.requiredUserAction.description ~= nil then
		arg_4_0.LabelDescExt:setText(arg_4_0.requiredUserAction.description)
	else
		arg_4_0.LabelDescExt:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ACCOUNT_DEACTIVATED_DESC", Engine.JCBDICCAH(var_4_0), Engine.JCBDICCAH(var_4_0)))
	end

	arg_4_0.LabelURL:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DEFAULT_URL"))
	arg_4_0.ButtonAction.Text:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ACCOUNT_DEACTIVATED_BTN_VISIT_SUPPORT"))
	var_0_0(arg_4_0)
end

local function var_0_4(arg_5_0)
	arg_5_0.LabelTop:SetAlpha(0)
	arg_5_0.LabelDays:SetAlpha(0)
	arg_5_0.LabelBottom:SetAlpha(0)
	arg_5_0.LabelDescBold:SetAlpha(0)
	arg_5_0.LabelDescExt:SetAlpha(0)

	if arg_5_0.requiredUserAction.name ~= nil then
		arg_5_0.LabelTitle:setText(arg_5_0.requiredUserAction.name)
	else
		arg_5_0.LabelTitle:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ERRORSTATE_NAME"))
	end

	if arg_5_0.requiredUserAction.description ~= nil then
		arg_5_0.LabelDesc:setText(arg_5_0.requiredUserAction.description)
	else
		arg_5_0.LabelDesc:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ERRORSTATE_DESC", Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DEFAULT_URL")))
	end

	arg_5_0.LabelURL:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_DEFAULT_URL"))
	arg_5_0.ButtonAction.Text:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ERRORSTATE_BTN_OPEN_WEBSITE"))
	var_0_0(arg_5_0)
end

local function var_0_5(arg_6_0, arg_6_1)
	if not arg_6_1.controller then
		local var_6_0 = controllerIndex
	end

	if arg_6_0.errorCode == LUI.FENCE_ONLINE_SERVICES_ERROR_CODES.COPPADateOfBirthRequired then
		var_0_1(arg_6_0)
	elseif arg_6_0.errorCode == LUI.FENCE_ONLINE_SERVICES_ERROR_CODES.COPPAUserActionRequired then
		if arg_6_0.requiredUserAction.type == COPPA_PARENTAL_CONSENT_REQUIRED then
			var_0_1(arg_6_0)
		elseif arg_6_0.requiredUserAction.type == COPPA_ACCOUNT_DEACTIVATED then
			var_0_3(arg_6_0)
		elseif arg_6_0.requiredUserAction.type == COPPA_DATE_OF_BIRTH then
			var_0_1(arg_6_0)
		elseif arg_6_0.requiredUserAction.type == COPPA_SUNSET_ERROR then
			var_0_4(arg_6_0)
		else
			var_0_4(arg_6_0)
		end
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	ACTIONS.ScaleFullscreen(arg_7_0.Darkener)
	arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if Engine.HDGDBCJFG() and arg_7_0.ButtonRestart ~= nil then
			LUI.FlowManager.RequestPopupMenu(nil, "coppa_restart_popmenu", false, arg_8_1.controller, false, {}, nil, true, true)
		end

		if Engine.CGABICJHAI() and arg_7_0.ButtonQuit ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "quit_popmenu", false, arg_8_1.controller)
		end

		return true
	end)
	arg_7_0:addEventHandler("menu_create", var_0_5)

	arg_7_0.errorCode = arg_7_2.errorCode
	arg_7_0.requiredUserAction = arg_7_2.requiredUserAction

	if Engine.HDGDBCJFG() or Engine.CHBDHJJDGE() then
		arg_7_0.ButtonList:RemoveElement(arg_7_0.ButtonQuit)

		arg_7_0.ButtonQuit = nil
	end

	if arg_7_0.requiredUserAction.type == COPPA_SUNSET_ERROR and Engine.CGABICJHAI() then
		arg_7_0.ButtonList:RemoveElement(arg_7_0.ButtonRestart)

		arg_7_0.ButtonRestart = nil
	end

	if arg_7_0.ButtonAction ~= nil then
		arg_7_0.ButtonAction:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			Engine.BHECIAHGC(arg_7_1, WebBrowserType.FULLSCREEN, arg_7_0.requiredUserAction.url)
		end)
	end

	if arg_7_0.ButtonRestart ~= nil then
		arg_7_0.ButtonRestart:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			LUI.FlowManager.RequestPopupMenu(nil, "coppa_restart_popmenu", false, arg_10_1.controller, false, {}, nil, true, true)
		end)
	end

	if arg_7_0.ButtonQuit ~= nil then
		arg_7_0.ButtonQuit:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			LUI.FlowManager.RequestPopupMenu(nil, "quit_popmenu", false, arg_11_1.controller, false, {}, nil, true, true)
		end)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_7_0)
end

function COPPAMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0.id = "COPPAMenu"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Darkener"

	var_12_4:SetRGBFromInt(0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Darkener = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIStyledText.new()

	var_12_6.id = "LabelTitle"

	var_12_6:SetRGBFromInt(5863813, 0)
	var_12_6:setText("MENU/COPPA_TITLE_VERIFICATION_REQUIRED", 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_12_6:SetAlignment(LUI.Alignment.Center)
	var_12_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -864, _1080p * 864, _1080p * 77, _1080p * 137)
	var_12_0:addElement(var_12_6)

	var_12_0.LabelTitle = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "ImageQRCode"

	var_12_8:setImage(RegisterMaterial("coppa_qr_atvi_signup"), 0)
	var_12_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -841, _1080p * -544, _1080p * 702, _1080p * 988)
	var_12_0:addElement(var_12_8)

	var_12_0.ImageQRCode = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIStyledText.new()

	var_12_10.id = "LabelVisitOrScan"

	var_12_10:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_VISIT_OR_SCAN"), 0)
	var_12_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_10:SetAlignment(LUI.Alignment.Center)
	var_12_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -518, _1080p * 518, _1080p * 92, _1080p * 116)
	var_12_0:addElement(var_12_10)

	var_12_0.LabelVisitOrScan = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIStyledText.new()

	var_12_12.id = "LabelDesc"

	var_12_12:SetRGBFromInt(11117984, 0)
	var_12_12:setText("COPPA_ERROR_STATE", 0)
	var_12_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_12:SetAlignment(LUI.Alignment.Center)
	var_12_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -518, _1080p * 518, _1080p * 234, _1080p * 258)
	var_12_0:addElement(var_12_12)

	var_12_0.LabelDesc = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIStyledText.new()

	var_12_14.id = "LabelTop"

	var_12_14:SetRGBFromInt(11117984, 0)
	var_12_14:setText("COPPA_ERROR_STATE", 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_14:SetAlignment(LUI.Alignment.Center)
	var_12_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -518, _1080p * 518, _1080p * 356, _1080p * 380)
	var_12_0:addElement(var_12_14)

	var_12_0.LabelTop = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIStyledText.new()

	var_12_16.id = "LabelDays"

	var_12_16:setText("120 Days", 0)
	var_12_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_16:SetAlignment(LUI.Alignment.Center)
	var_12_16:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -518, _1080p * 518, _1080p * 398, _1080p * 434)
	var_12_0:addElement(var_12_16)

	var_12_0.LabelDays = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIStyledText.new()

	var_12_18.id = "LabelBottom"

	var_12_18:SetRGBFromInt(11117984, 0)
	var_12_18:setText("COPPA_ERROR_STATE", 0)
	var_12_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_18:SetAlignment(LUI.Alignment.Center)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -518, _1080p * 518, _1080p * 455, _1080p * 479)
	var_12_0:addElement(var_12_18)

	var_12_0.LabelBottom = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIImage.new()

	var_12_20.id = "LineSeparator"

	var_12_20:SetRGBFromInt(6118749, 0)
	var_12_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 4, _1080p * 6, _1080p * 702, _1080p * 1019)
	var_12_0:addElement(var_12_20)

	var_12_0.LineSeparator = var_12_20

	local var_12_21
	local var_12_22 = LUI.UIStyledText.new()

	var_12_22.id = "LabelURL"

	var_12_22:SetRGBFromInt(11117984, 0)
	var_12_22:setText("COPPA_URL", 0)
	var_12_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_22:SetAlignment(LUI.Alignment.Center)
	var_12_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 15, _1080p * 520, _1080p * 995, _1080p * 1019)
	var_12_0:addElement(var_12_22)

	var_12_0.LabelURL = var_12_22

	local var_12_23
	local var_12_24 = LUI.UIStyledText.new()

	var_12_24.id = "LabelDescBold"

	var_12_24:SetRGBFromInt(11117984, 0)
	var_12_24:setText(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ACCOUNT_DEACTIVATED_SHORT_DESC"), 0)
	var_12_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_24:SetAlignment(LUI.Alignment.Center)
	var_12_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -518, _1080p * 518, _1080p * 234, _1080p * 258)
	var_12_0:addElement(var_12_24)

	var_12_0.LabelDescBold = var_12_24

	local var_12_25
	local var_12_26 = LUI.UIStyledText.new()

	var_12_26.id = "LabelDescExt"

	var_12_26:SetRGBFromInt(11117984, 0)
	var_12_26:setText("COPPA_ERROR_STATE", 0)
	var_12_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_26:SetAlignment(LUI.Alignment.Center)
	var_12_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -518, _1080p * 518, _1080p * 313, _1080p * 337)
	var_12_0:addElement(var_12_26)

	var_12_0.LabelDescExt = var_12_26

	local var_12_27 = LUI.UIVerticalList.new({
		adjustSizeToContent = true,
		ignoreStretchingChildren = true,
		verticalAlignment = LUI.Alignment.Middle,
		horizontalAlignment = LUI.Alignment.Center
	})

	var_12_27:SetAnchorsAndPosition(0, 1, 0, 1, 0 * _1080p, 850 * _1080p, 706 * _1080p, 984 * _1080p)
	var_12_27:SetSpacing(16)
	var_12_0:addElement(var_12_27)

	var_12_0.ButtonList = var_12_27

	local var_12_28
	local var_12_29 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_12_1
	})

	var_12_29.id = "ButtonAction"

	var_12_29.Text:SetLeft(_1080p * 20, 0)
	var_12_29.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_ERRORSTATE_BTN_OPEN_WEBSITE")), 0)
	var_12_29.Text:SetAlignment(LUI.Alignment.Left)
	var_12_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 850, _1080p * 724, _1080p * 776)
	var_12_27:addElement(var_12_29)

	var_12_0.ButtonAction = var_12_29

	local var_12_30
	local var_12_31 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_12_1
	})

	var_12_31.id = "ButtonRestart"

	var_12_31.Text:SetLeft(_1080p * 20, 0)
	var_12_31.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_BTN_RESTART")), 0)
	var_12_31.Text:SetAlignment(LUI.Alignment.Left)
	var_12_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 850, _1080p * 819, _1080p * 871)
	var_12_27:addElement(var_12_31)

	var_12_0.ButtonRestart = var_12_31

	local var_12_32
	local var_12_33 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_12_1
	})

	var_12_33.id = "ButtonQuit"

	var_12_33.Text:SetLeft(_1080p * 20, 0)
	var_12_33.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_COPPA/COPPA_BTN_QUIT_TO_DESKTOP")), 0)
	var_12_33.Text:SetAlignment(LUI.Alignment.Left)
	var_12_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 850, _1080p * 910, _1080p * 962)
	var_12_27:addElement(var_12_33)

	var_12_0.ButtonQuit = var_12_33

	local var_12_34 = LUI.UIBindButton.new()

	var_12_34.id = "selfBindButton"

	var_12_0:addElement(var_12_34)

	var_12_0.bindButton = var_12_34

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("COPPAMenu", COPPAMenu)
LockTable(_M)
