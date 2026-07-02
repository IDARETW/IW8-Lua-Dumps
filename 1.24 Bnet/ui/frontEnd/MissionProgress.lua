module(..., package.seeall)

function MissionProgress(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "MissionProgress"

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

	var_1_4.Fill:SetRGBFromInt(12369600, 0)
	var_1_4.Frame:SetRGBFromInt(44783, 0)
	var_1_4.Frame:SetAlpha(0.5, 0)
	var_1_4.Cap:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 265, _1080p * 11, _1080p * 21)
	var_1_0:addElement(var_1_4)

	var_1_0.ProgressBar = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "ProgressValue"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_1_6:setText("1/2", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 346, _1080p * 5, _1080p * 27)
	var_1_0:addElement(var_1_6)

	var_1_0.ProgressValue = var_1_6

	return var_1_0
end

MenuBuilder.registerType("MissionProgress", MissionProgress)
LockTable(_M)
