module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.EventName)
	arg_1_0.EventName:setText(WORLD_MAP.GetEventName())
end

function OperationBriefing(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "OperationBriefing"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "OperationDetails"

	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 330, _1080p * 348)
	var_2_0:addElement(var_2_4)

	var_2_0.OperationDetails = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("OperationEventBanner", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "OperationEventBanner"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 892, _1080p * 922)
	var_2_0:addElement(var_2_6)

	var_2_0.OperationEventBanner = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "EventName"

	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 724, _1080p * 1224, _1080p * 102, _1080p * 120)
	var_2_0:addElement(var_2_8)

	var_2_0.EventName = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("OperationObjectives", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "OperationObjectives"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 499, _1080p * 859)
	var_2_0:addElement(var_2_10)

	var_2_0.OperationObjectives = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("FactionDetails", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "FactionDetails"

	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1210, _1080p * 1810, _1080p * 499, _1080p * 859)
	var_2_0:addElement(var_2_12)

	var_2_0.FactionDetails = var_2_12

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OperationBriefing", OperationBriefing)
LockTable(_M)
