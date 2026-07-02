module(..., package.seeall)

function AverageIndicatorLeft(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 75 * _1080p, 0, 36 * _1080p)

	var_1_0.id = "AverageIndicatorLeft"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "PointGapFiller"

	var_1_4:SetRGBFromTable(SWATCHES.AAR.StatsHeader, 0)
	var_1_4:SetZRotation(180, 0)
	var_1_4:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 20, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.PointGapFiller = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Point"

	var_1_6:SetRGBFromTable(SWATCHES.AAR.StatsHeader, 0)
	var_1_6:SetZRotation(180, 0)
	var_1_6:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 20, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Point = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Backer"

	var_1_8:SetRGBFromTable(SWATCHES.AAR.StatsHeader, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, 0, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Backer = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "AvgText"

	var_1_10:SetRGBFromTable(SWATCHES.AAR.KillsColor, 0)
	var_1_10:setText("0.0", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_10:SetStartupDelay(1000)
	var_1_10:SetLineHoldTime(400)
	var_1_10:SetAnimMoveTime(150)
	var_1_10:SetAnimMoveSpeed(50)
	var_1_10:SetEndDelay(1000)
	var_1_10:SetCrossfadeTime(400)
	var_1_10:SetFadeInTime(300)
	var_1_10:SetFadeOutTime(300)
	var_1_10:SetMaxVisibleLines(1)
	var_1_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_10)

	var_1_0.AvgText = var_1_10

	return var_1_0
end

MenuBuilder.registerType("AverageIndicatorLeft", AverageIndicatorLeft)
LockTable(_M)
