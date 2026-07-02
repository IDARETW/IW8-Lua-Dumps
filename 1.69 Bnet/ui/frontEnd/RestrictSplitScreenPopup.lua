module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/UNSUPPORTED_GAME_MODES") .. "\n"

	for iter_1_0 = 1, #arg_1_2 do
		var_1_0 = var_1_0 .. "- " .. arg_1_2[iter_1_0].name:GetValue(arg_1_1) .. "\n"
	end

	arg_1_0.GameModesText:setText(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MenuTitle.MenuTitle)
	assert(arg_2_0.Text)
	assert(arg_2_0.GenericPopupFrame)
	assert(arg_2_2.title)
	assert(arg_2_2.message)

	if arg_2_2.darkenerAlpha and arg_2_0.GenericPopupFrame.Darkener then
		arg_2_0.GenericPopupFrame.Darkener:SetAlpha(arg_2_2.darkenerAlpha)
	end

	if arg_2_2.scaleDarkenerToPopup then
		arg_2_0.GenericPopupFrame:ScaleDarkenerToPopupWindow()
	end

	if arg_2_2.gameModes then
		var_0_0(arg_2_0, arg_2_1, arg_2_2.gameModes)
	end

	arg_2_0.chatOptOut = arg_2_2.chatOptOut or true

	arg_2_0.MenuTitle:SetTitle(arg_2_2.title)
	arg_2_0.Text:setText(arg_2_2.message, 0)
	assert(#arg_2_2.buttons >= 1)

	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -188, _1080p * 135, _1080p * 175)

	var_2_0.id = "ButtonContainer"

	arg_2_0:addElement(var_2_0)

	local var_2_1 = LUI.UIVerticalList.new({
		adjustSizeToContent = true,
		ignoreStretchingChildren = true,
		verticalAlignment = LUI.Alignment.Middle
	})

	var_2_1:SetSpacing(4)
	var_2_0:addElement(var_2_1)

	for iter_2_0, iter_2_1 in ipairs(arg_2_2.buttons) do
		local var_2_2 = iter_2_1.type and iter_2_1.type or "GenericButton"
		local var_2_3 = MenuBuilder.BuildRegisteredType(var_2_2, {
			controllerIndex = arg_2_1
		})

		if iter_2_1.checkBoxHandled then
			if iter_2_1.disabled then
				var_2_3:ElementDisable()
			end

			local function var_2_4(arg_3_0, arg_3_1)
				if arg_3_1.enable then
					var_2_3:ElementEnable(arg_3_1)
				else
					var_2_3:ElementDisable()
				end
			end

			var_2_3:addEventHandler("checkbox_disable", var_2_4)
		end

		var_2_3:SetLeftAnchor(0)
		var_2_3:SetRightAnchor(0)
		var_2_3:SetRight(0)
		var_2_3:SetLeft(0)

		if iter_2_1.spacerSize then
			var_2_3:SetTopAnchor(0)
			var_2_3:SetBottomAnchor(1)
			var_2_3:SetBottom(iter_2_1.spacerSize)
		end

		var_2_3.id = "button_" .. iter_2_0

		if iter_2_1.label then
			var_2_3.Text:setText(iter_2_1.label)

			local var_2_5 = LUI.Alignment.Left

			var_2_3.Background:SetupButton(var_2_3.Text, var_2_3.Text:getText(), var_2_5)
			var_2_3.Text:SetAlignment(var_2_5)
		end

		local var_2_6 = iter_2_1.action and iter_2_1.action or function()
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, nil)
		end

		var_2_3:addEventHandler("button_action", var_2_6)
		var_2_1:addElement(var_2_3)
	end

	local var_2_7 = LUI.UIBindButton.new()

	var_2_7.id = "selfBindButton"

	arg_2_0:addElement(var_2_7)

	arg_2_0.bindButton = var_2_7

	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = arg_2_1
		end

		ACTIONS.LeaveMenu(arg_2_0)
	end)
end

function RestrictSplitScreenPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "RestrictSplitScreenPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "GenericPopupFrame"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.GenericPopupFrame = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "Text"

	var_6_6:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * 21, _1080p * -107, _1080p * -83)
	var_6_0:addElement(var_6_6)

	var_6_0.Text = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "MenuTitle"

	var_6_8.MenuTitle:setText("PRIMARY WEAPON SELECT", 0)
	var_6_8.Line:SetLeft(0, 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -705, _1080p * 319, _1080p * 284, _1080p * 389)
	var_6_0:addElement(var_6_8)

	var_6_0.MenuTitle = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "Line"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -705, _1080p * -155, _1080p * -154)
	var_6_0:addElement(var_6_10)

	var_6_0.Line = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "GameModesText"

	var_6_12:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_6_12:setText("", 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Left)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 139, _1080p * 2059, _1080p * -107, _1080p * -83)
	var_6_0:addElement(var_6_12)

	var_6_0.GameModesText = var_6_12

	var_6_4:addEventHandler("menu_create", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_6_1
		end

		ACTIONS.ScaleFullscreen(var_6_0)
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("RestrictSplitScreenPopup", RestrictSplitScreenPopup)
LockTable(_M)
