module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	return
end

function NewOperatorIconList(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIHorizontalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 182 * _1080p)

	var_2_0.id = "NewOperatorIconList"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(15 * _1080p)

	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "OperatorIcon1"

	var_2_4:SetColorOp(COLOR_OP.saturation, 0)
	var_2_4:SetColorOpParam(1, 0)
	var_2_4:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 128, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.OperatorIcon1 = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "OperatorIcon2"

	var_2_6:SetColorOp(COLOR_OP.saturation, 0)
	var_2_6:SetColorOpParam(1, 0)
	var_2_6:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 143, _1080p * 271, 0, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.OperatorIcon2 = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "OperatorIcon3"

	var_2_8:SetColorOp(COLOR_OP.saturation, 0)
	var_2_8:SetColorOpParam(1, 0)
	var_2_8:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 286, _1080p * 414, 0, 0)
	var_2_0:addElement(var_2_8)

	var_2_0.OperatorIcon3 = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "OperatorIcon4"

	var_2_10:SetColorOp(COLOR_OP.saturation, 0)
	var_2_10:SetColorOpParam(1, 0)
	var_2_10:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 429, _1080p * 557, 0, 0)
	var_2_0:addElement(var_2_10)

	var_2_0.OperatorIcon4 = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "OperatorIcon5"

	var_2_12:SetColorOp(COLOR_OP.saturation, 0)
	var_2_12:SetColorOpParam(1, 0)
	var_2_12:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 572, _1080p * 700, 0, 0)
	var_2_0:addElement(var_2_12)

	var_2_0.OperatorIcon5 = var_2_12

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NewOperatorIconList", NewOperatorIconList)
LockTable(_M)
