module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._currentPage == #arg_1_1.panelData and arg_1_2 then
		arg_1_1.confirmButton.action(arg_1_0, controllerIndex)
	elseif arg_1_0._currentPage == 1 and not arg_1_2 then
		ACTIONS.LeaveMenu(arg_1_0)
	else
		arg_1_0._currentPage = arg_1_0._currentPage + (arg_1_2 and 1 or -1)

		arg_1_0.TutorialDetailPanel:UpdateDetails(arg_1_1.panelData[arg_1_0._currentPage])
	end

	if arg_1_2 and arg_1_0._pagesRead < #arg_1_1.panelData and arg_1_0._currentPage > arg_1_0._pagesRead then
		arg_1_0._pagesRead = arg_1_0._pagesRead + 1

		arg_1_0.GenericButton:StartTimer(arg_1_1.waitTime, true)

		arg_1_0._buttonsActive = false
	end

	if arg_1_0._pagePips then
		for iter_1_0 = 1, #arg_1_0._pagePips do
			arg_1_0._pagePips[iter_1_0]:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
		end

		arg_1_0._pagePips[arg_1_0._currentPage]:SetRGBFromTable(SWATCHES.Popups.buttonTxt, 0)
	end

	if arg_1_0._currentPage == 1 then
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = -1,
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/EXIT")
		})
	else
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = -1,
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.panelData)

	local var_2_0 = {
		arg_2_0.Panel1,
		arg_2_0.Panel2,
		arg_2_0.Panel3
	}

	arg_2_0._currentPage = 1
	arg_2_0._pagesRead = 1
	arg_2_0._buttonsActive = false

	if arg_2_2.title then
		arg_2_0.Title:SetAlpha(1)
		arg_2_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_2_2.title)))
	else
		arg_2_0.Title:SetAlpha(0)
	end

	if arg_2_2.modeIcon then
		arg_2_0.ModeIcon:SetAlpha(1)
		arg_2_0.ModeIcon:setImage(RegisterMaterial(arg_2_2.modeIcon))
	else
		arg_2_0.ModeIcon:SetAlpha(0)
	end

	arg_2_0.TutorialDetailPanel:UpdateDetails(arg_2_2.panelData[arg_2_0._currentPage])
	arg_2_0.GenericButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		var_0_0(arg_2_0, arg_2_2, true)
	end)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if arg_2_0._buttonsActive then
			var_0_0(arg_2_0, arg_2_2, false)
		end
	end)
	arg_2_0:addEventHandler("timer_complete", function(arg_5_0, arg_5_1)
		arg_2_0._buttonsActive = true
	end)
	arg_2_0.GenericButton:StartTimer(arg_2_2.waitTime, true)

	if #arg_2_2.panelData > 1 then
		local var_2_1 = LUI.UIHorizontalList.new()

		var_2_1:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * 366, _1080p * 382)
		var_2_1:SetAlignment(LUI.Alignment.Center)
		var_2_1:SetSpacing(_1080p * 8)

		var_2_1.id = "PageList"

		var_2_1:SetNoWrap(true)
		arg_2_0:addElement(var_2_1)

		arg_2_0.pageList = var_2_1
		arg_2_0._pagePips = {}

		for iter_2_0 = 1, #arg_2_2.panelData do
			local var_2_2 = LUI.UIImage.new()

			var_2_2.id = "PagePip" .. iter_2_0

			var_2_2:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
			var_2_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 16, _1080p * 0, _1080p * 16)
			table.insert(arg_2_0._pagePips, var_2_2)
			arg_2_0.pageList:addElement(var_2_2)
		end

		arg_2_0._pagePips[1]:SetRGBFromTable(SWATCHES.Popups.buttonTxt, 0)
	end

	arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		clickable = true,
		priority = -1,
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/EXIT")
	})
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
end

function TutorialPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "TutorialPopup"

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
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "GenericPopupWindow"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -400, _1080p * 400)
	var_6_0:addElement(var_6_6)

	var_6_0.GenericPopupWindow = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("TutorialDetailPanel", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "TutorialDetailPanel"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 863, _1080p * -399, _1080p * 399)
	var_6_0:addElement(var_6_8)

	var_6_0.TutorialDetailPanel = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "ButtonHelperBar"

	var_6_10.Background:SetAlpha(0, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 879, _1080p * 400, _1080p * 460)
	var_6_0:addElement(var_6_10)

	var_6_0.ButtonHelperBar = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "Title"

	var_6_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_12:setText("TITLE", 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -369, _1080p * -309)
	var_6_0:addElement(var_6_12)

	var_6_0.Title = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "GenericButton"

	var_6_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_6_14.Text:SetAlignment(LUI.Alignment.Center)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 307, _1080p * 345)
	var_6_0:addElement(var_6_14)

	var_6_0.GenericButton = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "ModeIcon"

	var_6_16:setImage(RegisterMaterial("icon_mp_mode_war"), 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 108, _1080p * 209, _1080p * 154, _1080p * 254)
	var_6_0:addElement(var_6_16)

	var_6_0.ModeIcon = var_6_16

	function var_6_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_17 = LUI.UIBindButton.new()

	var_6_17.id = "selfBindButton"

	var_6_0:addElement(var_6_17)

	var_6_0.bindButton = var_6_17

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TutorialPopup", TutorialPopup)
LockTable(_M)
