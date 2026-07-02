module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.EventBanner:SetupEventBanner(Engine.CBBHFCGDIC("LUA_MENU/OPERATION_ENDS"))
end

function OperationEventBanner(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "OperationEventBanner"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "EventBanner"

	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 30)
	var_2_0:addElement(var_2_4)

	var_2_0.EventBanner = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "DateTime"

	var_2_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_6:setText("2 days 4 hours 2 mins", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 209, _1080p * 500, _1080p * 6, _1080p * 24)
	var_2_0:addElement(var_2_6)

	var_2_0.DateTime = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OperationEventBanner", OperationEventBanner)
LockTable(_M)
