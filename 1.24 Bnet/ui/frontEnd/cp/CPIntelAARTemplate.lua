module(..., package.seeall)

function CPIntelAARTemplate(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "CPIntelAARTemplate"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backing"

	var_1_4:SetRGBFromInt(1447446, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 617, _1080p * 1684, _1080p * 105, _1080p * 979)
	var_1_0:addElement(var_1_4)

	var_1_0.Backing = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TimelineBacking"

	var_1_6:SetRGBFromInt(13487565, 0)
	var_1_6:SetAlpha(0.04, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1320, _1080p * 1667, _1080p * 143, _1080p * 925)
	var_1_0:addElement(var_1_6)

	var_1_0.TimelineBacking = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "mapImage"

	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1303, _1080p * 165, _1080p * 547)
	var_1_0:addElement(var_1_8)

	var_1_0.mapImage = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "BorderTimeline"

	var_1_11:SetRGBFromInt(14934750, 0)
	var_1_11:SetAlpha(0.2, 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1320, _1080p * 1667, _1080p * 127, _1080p * 925)
	var_1_0:addElement(var_1_11)

	var_1_0.BorderTimeline = var_1_11

	local var_1_12
	local var_1_13 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_14 = LUI.UIBorder.new(var_1_13)

	var_1_14.id = "Border"

	var_1_14:SetRGBFromTable(SWATCHES.genericMenu.border, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 617, _1080p * 1684, _1080p * 82, _1080p * 979)
	var_1_0:addElement(var_1_14)

	var_1_0.Border = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "BarTop"

	var_1_16:SetAlpha(0.35, 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 617, _1080p * 1684, _1080p * 82, _1080p * 105)
	var_1_0:addElement(var_1_16)

	var_1_0.BarTop = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIImage.new()

	var_1_18.id = "BarMission"

	var_1_18:SetRGBFromInt(13487565, 0)
	var_1_18:SetAlpha(0.08, 0)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1303, _1080p * 569, _1080p * 585)
	var_1_0:addElement(var_1_18)

	var_1_0.BarMission = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIImage.new()

	var_1_20.id = "BarBottomLine"

	var_1_20:SetRGBFromInt(14934750, 0)
	var_1_20:SetAlpha(0, 0)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1674, _1080p * 937, _1080p * 938)
	var_1_0:addElement(var_1_20)

	var_1_0.BarBottomLine = var_1_20

	local var_1_21
	local var_1_22 = LUI.UIImage.new()

	var_1_22.id = "BarAssessment"

	var_1_22:SetRGBFromInt(13487565, 0)
	var_1_22:SetAlpha(0.08, 0)
	var_1_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1303, _1080p * 746, _1080p * 762)
	var_1_0:addElement(var_1_22)

	var_1_0.BarAssessment = var_1_22

	local var_1_23
	local var_1_24 = LUI.UIImage.new()

	var_1_24.id = "BarAfterAction"

	var_1_24:SetRGBFromInt(4013373, 0)
	var_1_24:SetAlpha(0.35, 0)
	var_1_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 629, _1080p * 1303, _1080p * 127, _1080p * 143)
	var_1_0:addElement(var_1_24)

	var_1_0.BarAfterAction = var_1_24

	local var_1_25
	local var_1_26 = LUI.UIImage.new()

	var_1_26.id = "BarTimeline"

	var_1_26:SetAlpha(0.08, 0)
	var_1_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1320, _1080p * 1667, _1080p * 127, _1080p * 143)
	var_1_0:addElement(var_1_26)

	var_1_0.BarTimeline = var_1_26

	return var_1_0
end

MenuBuilder.registerType("CPIntelAARTemplate", CPIntelAARTemplate)
LockTable(_M)
