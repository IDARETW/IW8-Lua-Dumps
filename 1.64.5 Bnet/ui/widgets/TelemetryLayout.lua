module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = arg_1_0:getLastChild()

	while var_1_1 do
		table.insert(var_1_0, var_1_1)

		var_1_1 = var_1_1:getPreviousSibling(), arg_1_0:RemoveElement(var_1_1)
	end

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		arg_1_0:addElement(iter_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if IsLanguageArabic() then
		var_0_0(arg_2_0)
	end
end

function TelemetryLayout(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 190 * _1080p, 0, 25 * _1080p)

	var_3_0.id = "TelemetryLayout"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Spacer1"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_4.SpacerImage:SetAlpha(1, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, 0, _1080p * 25)
	var_3_0:addElement(var_3_4)

	var_3_0.Spacer1 = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Name"

	var_3_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_6:SetAlpha(0.65, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 91, _1080p * -8.5, _1080p * 9.5)
	var_3_0:addElement(var_3_6)

	var_3_0.Name = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Spacer2"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8.SpacerImage:SetAlpha(1, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 97, 0, _1080p * 25)
	var_3_0:addElement(var_3_8)

	var_3_0.Spacer2 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Info"

	var_3_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_10:SetAlpha(0.65, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 97, _1080p * 192, _1080p * -8.5, _1080p * 9.5)
	var_3_0:addElement(var_3_10)

	var_3_0.Info = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Spacer3"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12.SpacerImage:SetAlpha(1, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 198, 0, _1080p * 25)
	var_3_0:addElement(var_3_12)

	var_3_0.Spacer3 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Unit"

	var_3_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_14:SetAlpha(0.65, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 198, _1080p * 293, _1080p * -8.5, _1080p * 9.5)
	var_3_0:addElement(var_3_14)

	var_3_0.Unit = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Spacer4"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_3_16:SetAlpha(0, 0)
	var_3_16.SpacerImage:SetAlpha(1, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 293, _1080p * 299, 0, _1080p * 25)
	var_3_0:addElement(var_3_16)

	var_3_0.Spacer4 = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TelemetryLayout", TelemetryLayout)
LockTable(_M)
