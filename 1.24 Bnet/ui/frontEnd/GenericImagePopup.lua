module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	LUI.AddUIHoldButtonLogic(arg_1_0, arg_1_2, {
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_1_0.GenericProgressBar,
		onFill = arg_1_1
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = math.min(arg_2_0 / arg_2_1, arg_2_2 / arg_2_3)

	return arg_2_1 * var_2_0, arg_2_3 * var_2_0
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = GetMaterialDimensions(arg_3_1)

	assert(var_3_0)

	var_3_0.width = _1080p * var_3_0.width
	var_3_0.height = _1080p * var_3_0.height

	local var_3_1 = arg_3_0.Image:GetCurrentAnchorsAndPositions()

	var_3_1.width = var_3_1.right - var_3_1.left
	var_3_1.height = var_3_1.bottom - var_3_1.top
	var_3_1.centerX = var_3_1.left + var_3_1.width / 2
	var_3_1.centerY = var_3_1.top + var_3_1.height / 2
	var_3_0.width, var_3_0.height = var_0_1(var_3_1.width, var_3_0.width, var_3_1.height, var_3_0.height)

	local var_3_2 = var_3_0.width / 2
	local var_3_3 = var_3_0.height / 2

	var_3_1.left = var_3_1.centerX - var_3_2
	var_3_1.right = var_3_1.centerX + var_3_2
	var_3_1.top = var_3_1.centerY - var_3_3
	var_3_1.bottom = var_3_1.centerY + var_3_3

	return var_3_1
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = var_0_2(arg_4_0, arg_4_1)

	arg_4_0.Image:setImage(RegisterMaterial(arg_4_1), 0)
	arg_4_0.Image:SetAnchorsAndPosition(var_4_0.leftAnchor, var_4_0.rightAnchor, var_4_0.topAnchor, var_4_0.bottomAnchor, var_4_0.left, var_4_0.right, var_4_0.top, var_4_0.bottom)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Image)
	assert(arg_5_0.MenuTitle.MenuTitle)
	assert(arg_5_0.Text)
	assert(arg_5_0.GenericPopupFrame)
	assert(arg_5_2.title)
	assert(arg_5_2.message)

	if arg_5_2.darkenerAlpha and arg_5_0.GenericPopupFrame.Darkener then
		arg_5_0.GenericPopupFrame.Darkener:SetAlpha(arg_5_2.darkenerAlpha)
	end

	arg_5_0.chatOptOut = arg_5_2.chatOptOut or true

	arg_5_0.MenuTitle:SetTitle(arg_5_2.title)
	arg_5_0.Text:setText(arg_5_2.message, 0)

	if not Engine.CFHBIHABCB(arg_5_1) and not arg_5_2.imageOverride then
		arg_5_2.imageOverride = "logo_wz"
	end

	if arg_5_2.imageOverride then
		var_0_3(arg_5_0, arg_5_2.imageOverride)
	end

	assert(#arg_5_2.buttons >= 1)

	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -188, _1080p * 135, _1080p * 175)

	var_5_0.id = "ButtonContainer"

	arg_5_0:addElement(var_5_0)

	local var_5_1 = LUI.UIVerticalList.new({
		adjustSizeToContent = true,
		ignoreStretchingChildren = true,
		verticalAlignment = LUI.Alignment.Middle
	})

	var_5_1:SetSpacing(4)
	var_5_0:addElement(var_5_1)

	for iter_5_0, iter_5_1 in ipairs(arg_5_2.buttons) do
		local var_5_2 = iter_5_1.type and iter_5_1.type or "GenericButton"
		local var_5_3 = MenuBuilder.BuildRegisteredType(var_5_2, {
			controllerIndex = arg_5_1
		})

		if iter_5_1.checkBoxHandled then
			if iter_5_1.disabled then
				var_5_3:ElementDisable()
			end

			local function var_5_4(arg_6_0, arg_6_1)
				if arg_6_1.enable then
					var_5_3:ElementEnable()
				else
					var_5_3:ElementDisable()
				end
			end

			var_5_3:addEventHandler("checkbox_disable", var_5_4)
		end

		var_5_3:SetLeftAnchor(0)
		var_5_3:SetRightAnchor(0)
		var_5_3:SetRight(0)
		var_5_3:SetLeft(0)

		if iter_5_1.spacerSize then
			var_5_3:SetTopAnchor(0)
			var_5_3:SetBottomAnchor(1)
			var_5_3:SetBottom(iter_5_1.spacerSize)
		end

		var_5_3.id = "button_" .. iter_5_0

		if iter_5_1.label then
			var_5_3.Text:setText(iter_5_1.label)

			local var_5_5 = LUI.Alignment.Left

			var_5_3.Background:SetupButton(var_5_3.Text, var_5_3.Text:getText(), var_5_5)
			var_5_3.Text:SetAlignment(var_5_5)
		end

		local var_5_6 = iter_5_1.action and iter_5_1.action or function()
			LUI.FlowManager.RequestLeaveMenu(arg_5_0, true, nil)
		end

		if var_5_2 == "GenericHoldButton" then
			var_0_0(var_5_3, var_5_6, arg_5_1)
		else
			var_5_3:addEventHandler("button_action", var_5_6)
		end

		var_5_1:addElement(var_5_3)
	end

	ACTIONS.ScaleFullscreen(arg_5_0.Darkener)
end

function GenericImagePopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "GenericImagePopup"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupFrame"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -230, _1080p * 230)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupFrame = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Image"

	var_8_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_8:SetAlpha(0.6, 0)
	var_8_8:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 77, _1080p * 841, _1080p * -218, _1080p * 218)
	var_8_0:addElement(var_8_8)

	var_8_0.Image = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Text"

	var_8_10:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * 21, _1080p * -107, _1080p * -83)
	var_8_0:addElement(var_8_10)

	var_8_0.Text = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "MenuTitle"

	var_8_12.MenuTitle:setText("PRIMARY WEAPON SELECT", 0)
	var_8_12.Line:SetLeft(_1080p * -152, 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -703, _1080p * 321, _1080p * -254, _1080p * -149)
	var_8_0:addElement(var_8_12)

	var_8_0.MenuTitle = var_8_12

	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("GenericImagePopup", GenericImagePopup)
LockTable(_M)
