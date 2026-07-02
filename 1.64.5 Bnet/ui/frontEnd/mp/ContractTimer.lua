module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TimeRemaining)
	arg_1_0.TimeRemaining:setEndTime(0)
	arg_1_0.TimeRemaining:useLocalizedFormat()
	arg_1_0.TimeRemaining:setLocalizedFormatString("LUA_MENU_MP/CONTRACT_TIMER")
	arg_1_0:addEventHandler("update_contracts", function(arg_2_0, arg_2_1)
		arg_1_0.TimeRemaining:setEndTime(0)
	end)
end

function ContractTimer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 40 * _1080p)

	var_3_0.id = "ContractTimer"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("UILongCountdown", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "TimeRemaining"

	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:setEndTime(0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 41.15, _1080p * 691, _1080p * 4, _1080p * 36)
	var_3_0:addElement(var_3_4)

	var_3_0.TimeRemaining = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Clock"

	var_3_6:setImage(RegisterMaterial("icon_clock_ring"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 32, _1080p * 4, _1080p * -4)
	var_3_0:addElement(var_3_6)

	var_3_0.Clock = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "ClockHandHour"

	var_3_8:SetZRotation(-78, 0)
	var_3_8:setImage(RegisterMaterial("icon_clock_hand"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 4, _1080p * 28, _1080p * 8, _1080p * -8)
	var_3_0:addElement(var_3_8)

	var_3_0.ClockHandHour = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "ClockHandMinute"

	var_3_10:SetZRotation(-3, 0)
	var_3_10:setImage(RegisterMaterial("icon_clock_hand"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 4, _1080p * 28, _1080p * 8, _1080p * -8)
	var_3_0:addElement(var_3_10)

	var_3_0.ClockHandMinute = var_3_10

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ContractTimer", ContractTimer)
LockTable(_M)
