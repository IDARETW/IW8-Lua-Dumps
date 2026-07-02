module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.OptionName:setText(arg_1_2.name)
	arg_1_0.OptionDescription:setText(arg_1_2.description)
	arg_1_0.ImagePreview:setImage(arg_1_2.image)
	arg_1_0.CloseButton:processEvent({
		name = "gain_focus",
		controller = arg_1_1
	})
	arg_1_0.CloseButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		arg_2_0:getParent():SetAlpha(0)
		arg_2_0:dispatchEventToParent({
			name = "detail_view_close",
			target = arg_2_0
		})
	end)
end

function OptionDetailPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "OptionDetailPreview"

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
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "ImagePreview"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 583, _1080p * 1337, _1080p * 278, _1080p * 700)
	var_3_0:addElement(var_3_6)

	var_3_0.ImagePreview = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "OptionName"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 200, _1080p * 244)
	var_3_0:addElement(var_3_8)

	var_3_0.OptionName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "OptionDescription"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 762, _1080p * 792)
	var_3_0:addElement(var_3_10)

	var_3_0.OptionDescription = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "CloseButton"

	var_3_12.Text:SetLeft(_1080p * 20, 0)
	var_3_12.Text:setText(ToUpperCase("X"), 0)
	var_3_12.Text:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1283, _1080p * 1337, _1080p * 108, _1080p * 154)
	var_3_0:addElement(var_3_12)

	var_3_0.CloseButton = var_3_12

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OptionDetailPreview", OptionDetailPreview)
LockTable(_M)
