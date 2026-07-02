module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ButtonSignUp:SetButtonDisabled(arg_1_1)
	arg_1_0.ButtonLogin:SetButtonDisabled(arg_1_1)

	if arg_1_0.ButtonNoThanks then
		arg_1_0.ButtonNoThanks:SetButtonDisabled(arg_1_1)
	end

	arg_1_0._buttonsDisabled = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0, arg_3_1)
		var_0_0(arg_2_0, false)

		local var_3_0 = {
			title = Engine.CBBHFCGDIC("CODACCOUNT/REGISTER_ERROR_TITLE"),
			message = Engine.CBBHFCGDIC(CODACCOUNT.GetErrorString(arg_3_1.options.errorCode), arg_3_1.options.detailErrorCode),
			controllerIndex = arg_3_1.options.controllerIndex
		}

		LUI.FlowManager.RequestPopupMenu(unused, "CODAccountErrorPopup", true, arg_3_1.options.controllerIndex, false, var_3_0, nil, true, true)
	end

	arg_2_0:registerEventHandler("AccountRegistrationFailure", arg_2_1 and var_2_0 or nil)
end

local function var_0_2(arg_4_0, arg_4_1)
	arg_4_0.ButtonNoThanks:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if arg_4_1.isAnonymousAccount then
			LUI.FlowManager.RequestLeaveMenu(arg_5_0:GetCurrentMenu())

			if arg_4_1.onSuccess then
				arg_4_1.onSuccess()
			end
		else
			var_0_0(arg_4_0, true)
			var_0_1(arg_4_0, true)
			AccountRegistration.BAIIEEHFHA(arg_5_1.controller)
		end
	end)
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.ButtonSignUp)
	assert(arg_6_0.ButtonLogin)

	if Engine.BHICADFIHA() then
		var_0_2(arg_6_0, arg_6_2)
	end

	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/GREETING"))
	arg_6_0.ButtonSignUp:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountRegisterPopup", true, arg_7_1.controller, false, arg_6_2, nil, true, true)
		var_0_1(arg_6_0, false)
	end)
	arg_6_0.ButtonLogin:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountLogin", true, arg_8_1.controller, false, arg_6_2, nil, true, true)
		var_0_1(arg_6_0, false)
	end)
	arg_6_0:registerEventHandler("AccountRegistrationSuccess", function(arg_9_0, arg_9_1)
		assert(arg_6_1 == arg_9_1.options.controllerIndex)
		LUI.FlowManager.RequestLeaveMenu(arg_9_0:GetCurrentMenu())
	end)
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = arg_6_0.Prompts
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		container = arg_6_0.Prompts
	})

	arg_6_0.BindButton = LUI.UIBindButton.new()
	arg_6_0.BindButton.id = "BindButton"

	arg_6_0:addElement(arg_6_0.BindButton)
	arg_6_0.BindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if arg_6_0._buttonsDisabled then
			return
		end

		if arg_6_2.onCancelFence then
			arg_6_2.onCancelFence()
		end

		LUI.FlowManager.RequestLeaveMenu(arg_10_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end

	if Engine.DDHFCGHJEA() then
		arg_6_0.CrossplayMessage:setText(Engine.CBBHFCGDIC("CODACCOUNT/GREETING_CROSSPLAY_KOREA"), 0)
	end

	arg_6_0.isQuickAccessShortcutsDisabled = true
end

function CODAccountGreeting(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0.id = "CODAccountGreeting"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Darkener"

	var_11_4:SetRGBFromInt(0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Darkener = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "GenericPopupFrame"

	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.GenericPopupFrame = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Image"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_8:SetAlpha(0.25, 0)
	var_11_8:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 377, _1080p * 658, _1080p * -170, _1080p * 158)
	var_11_0:addElement(var_11_8)

	var_11_0.Image = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "MenuTitle"

	var_11_10.MenuTitle:setText(Engine.CBBHFCGDIC("CODACCOUNT/GREETING"), 0)
	var_11_10.Line:SetLeft(0, 0)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_11_0:addElement(var_11_10)

	var_11_0.MenuTitle = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "Line"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_11_0:addElement(var_11_12)

	var_11_0.Line = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "ButtonSignUp"

	var_11_14.BackgroundDarkener:SetAlpha(0.5, 0)
	var_11_14.Text:SetLeft(_1080p * 20, 0)
	var_11_14.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/SIGN_UP"), 0)
	var_11_14.Text:SetAlignment(LUI.Alignment.Left)
	var_11_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -758, _1080p * -338, 0, _1080p * 38)
	var_11_0:addElement(var_11_14)

	var_11_0.ButtonSignUp = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "ButtonLogin"

	var_11_16.BackgroundDarkener:SetAlpha(0.5, 0)
	var_11_16.Text:SetLeft(_1080p * 20, 0)
	var_11_16.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/LOGIN"), 0)
	var_11_16.Text:SetAlignment(LUI.Alignment.Left)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -758, _1080p * -338, _1080p * 53, _1080p * 91)
	var_11_0:addElement(var_11_16)

	var_11_0.ButtonLogin = var_11_16

	local var_11_17

	if CONDITIONS.IsDevelopmentBuild(var_11_0) then
		local var_11_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_11_1
		})

		var_11_18.id = "ButtonNoThanks"

		if CONDITIONS.IsDevelopmentBuild(var_11_0) then
			-- block empty
		end

		var_11_18.BackgroundDarkener:SetAlpha(0.5, 0)
		var_11_18.Text:SetLeft(_1080p * 20, 0)
		var_11_18.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/NO_THANKS"), 0)
		var_11_18.Text:SetAlignment(LUI.Alignment.Left)
		var_11_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -758, _1080p * -338, _1080p * 106, _1080p * 144)
		var_11_0:addElement(var_11_18)

		var_11_0.ButtonNoThanks = var_11_18
	end

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_11_0) then
		var_11_20.Label:setText("ButtonPrompts", 0)
	end

	var_11_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -750, _1080p * -650, _1080p * 246, _1080p * 277)
	var_11_0:addElement(var_11_20)

	var_11_0.Prompts = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIText.new()

	var_11_22.id = "CrossplayMessage"

	var_11_22:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_22:setText(Engine.CBBHFCGDIC("CODACCOUNT/GREETING_CROSSPLAY"), 0)
	var_11_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_22:SetAlignment(LUI.Alignment.Left)
	var_11_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -758, _1080p * 169, _1080p * -100, _1080p * -76)
	var_11_0:addElement(var_11_22)

	var_11_0.CrossplayMessage = var_11_22

	local function var_11_23()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_23

	local var_11_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_22:RegisterAnimationSequence("AR", var_11_24)

	local function var_11_25()
		var_11_22:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_25

	var_11_6:addEventHandler("menu_create", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		ACTIONS.ScaleFullscreen(var_11_0)
	end)
	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("CODAccountGreeting", CODAccountGreeting)
LockTable(_M)
