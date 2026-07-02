module(..., package.seeall)

function OperationProgress(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "OperationProgress"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "ProgressBar"

	var_1_4.Fill:SetRGBFromTable(SWATCHES.splashNotifications.secondaryText, 0)
	var_1_4.Frame:SetRGBFromTable(SWATCHES.scorestreakButton.amplify, 0)
	var_1_4.Frame:SetAlpha(0.5, 0)
	var_1_4.Cap:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 40, _1080p * 381, _1080p * -5, _1080p * 5)
	var_1_0:addElement(var_1_4)

	var_1_0.ProgressBar = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "ProgessValue"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_1_6:setText("95/100", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -100, _1080p * -19, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_6)

	var_1_0.ProgessValue = var_1_6

	return var_1_0
end

MenuBuilder.registerType("OperationProgress", OperationProgress)
LockTable(_M)
