module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0._controllerIndex

	if Engine.DFBHGABBCH(var_1_0) and #(Clans.CEACCICGB(var_1_0) or {}) > 0 then
		local var_1_1 = Clans.CFGBBBHFHB(var_1_0)

		assert(var_1_1, "clanId is nil even though we've joined a clan.")

		local var_1_2 = var_1_1 and Clans.CBJDIGCAED(var_1_0, var_1_1) or nil

		if var_1_2 and var_1_2.secondsInHappyHour and var_1_2.secondsInHappyHour > 0 then
			arg_1_0.HappyHourNotificationElement:SetAlpha(1)
			arg_1_0.HappyHourNotificationElement:SetupTimer(var_1_2.secondsInHappyHour, 0, 0)

			return
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1

	arg_2_0.HappyHourNotificationElement.Image:setImage(RegisterMaterial("icon_regiments_happyhour"))

	local var_2_0 = LUI.UITimer.new({
		interval = 1000,
		event = "update_widget"
	})

	var_2_0.id = "happyHourTimer"

	arg_2_0:addElement(var_2_0)
	arg_2_0.HappyHourNotificationElement:SetAlpha(0)
end

function HappyHourNotificationWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 90 * _1080p)

	var_3_0.id = "HappyHourNotificationWidget"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleXPNotificationElement", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "HappyHourNotificationElement"

	var_3_4:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 90)
	var_3_0:addElement(var_3_4)

	var_3_0.HappyHourNotificationElement = var_3_4

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("HappyHourNotificationWidget", HappyHourNotificationWidget)
LockTable(_M)
