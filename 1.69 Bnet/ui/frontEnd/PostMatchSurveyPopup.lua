module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Button1)
	assert(arg_1_0.Button2)
	assert(arg_1_0.Button3)

	arg_1_0.buttonOrder = arg_1_2.buttonOrder
	arg_1_0.isQuitter = arg_1_2.isQuitter

	arg_1_0.Button1.Text:setText(arg_1_2.label1)
	arg_1_0.Button1:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.controller

		arg_1_2.action1(var_2_0, arg_1_2.buttonOrder, arg_1_2.isQuitter)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.Button2.Text:setText(arg_1_2.label2)
	arg_1_0.Button2:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller

		arg_1_2.action2(var_3_0, arg_1_2.buttonOrder, arg_1_2.isQuitter)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.Button3.Text:setText(arg_1_2.label3)
	arg_1_0.Button3:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.controller

		arg_1_2.action3(var_4_0, arg_1_2.buttonOrder, arg_1_2.isQuitter)
		ACTIONS.LeaveMenu(arg_1_0)
	end)

	local var_1_0 = LUI.UIBindButton.new()

	var_1_0.id = "selfBindButton"

	arg_1_0:addElement(var_1_0)

	arg_1_0.bindButton = var_1_0

	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.controller or arg_1_1

		SURVEY.PostGameSurveyBackButtonPressed(var_5_0, arg_1_0.buttonOrder, arg_1_0.isQuitter)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

function PostMatchSurveyPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0.id = "PostMatchSurveyPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.95, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "ButtonPrompts"

	var_6_6.Background:SetAlpha(0, 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -499, _1080p * 815, _1080p * 230, _1080p * 290)
	var_6_0:addElement(var_6_6)

	var_6_0.ButtonPrompts = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "GenericPopupWindow"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -230, _1080p * 230)
	var_6_0:addElement(var_6_8)

	var_6_0.GenericPopupWindow = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "Message"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_6_10:setText(Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_MESSAGE"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * -103, _1080p * -79)
	var_6_0:addElement(var_6_10)

	var_6_0.Message = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Button1"

	var_6_12.Text:setText("", 0)
	var_6_12.Description:setText("", 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1360, _1080p * 558, _1080p * 598)
	var_6_0:addElement(var_6_12)

	var_6_0.Button1 = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Button2"

	var_6_14.Text:setText("", 0)
	var_6_14.Description:setText("", 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1360, _1080p * 616, _1080p * 656)
	var_6_0:addElement(var_6_14)

	var_6_0.Button2 = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "Button3"

	var_6_16.Text:setText("", 0)
	var_6_16.Description:setText("", 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 560, _1080p * 1360, _1080p * 674, _1080p * 714)
	var_6_0:addElement(var_6_16)

	var_6_0.Button3 = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIText.new()

	var_6_18.id = "Title"

	var_6_18:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_18:setText(Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_TITLE"), 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_18:SetAlignment(LUI.Alignment.Center)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -199, _1080p * -139)
	var_6_0:addElement(var_6_18)

	var_6_0.Title = var_6_18

	function var_6_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_19 = LUI.UIBindButton.new()

	var_6_19.id = "selfBindButton"

	var_6_0:addElement(var_6_19)

	var_6_0.bindButton = var_6_19

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PostMatchSurveyPopup", PostMatchSurveyPopup)
LockTable(_M)
