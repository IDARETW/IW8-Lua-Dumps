module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0._digits[tonumber(arg_1_1) + 1]

	if tonumber(arg_1_1) == 0 and arg_1_2 == 1 then
		arg_1_0.Digit:SetAlpha(0)
	else
		arg_1_0.Digit:SetAlpha(1)
		arg_1_0.Digit:setImage(RegisterMaterial(var_1_0))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 == nil then
		arg_2_0.Digit:SetAlpha(0.1)
		arg_2_0.Digit:setImage(RegisterMaterial("watch_digital_digit_base"))
	else
		local var_2_0 = arg_2_0._digits[tonumber(arg_2_1) + 1]

		arg_2_0.Digit:setImage(RegisterMaterial(var_2_0))
		arg_2_0.Digit:SetAlpha(0.9)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Digit:SetRGBFromTable(SWATCHES.splashNotifications.Green, 0)
	arg_3_0.Base:SetRGBFromTable(SWATCHES.Reticles.BrightGreen, 0)
	arg_3_0.Base:SetParallaxMotionAmount(4)

	if arg_3_1 == nil then
		arg_3_0.Base:setImage(RegisterMaterial("watch_glow_digit_mask"))
		arg_3_0.Digit:setImage(RegisterMaterial("watch_glow_digit_mask"))
		arg_3_0.Digit:SetAlpha(0)
		arg_3_0.Base:SetAlpha(0)
	else
		local var_3_0 = arg_3_0._digits[tonumber(arg_3_1) + 1]

		arg_3_0.Base:setImage(RegisterMaterial(var_3_0))
		arg_3_0.Digit:setImage(RegisterMaterial(var_3_0 .. "_h"))
		arg_3_0.Digit:SetAlpha(1)
		arg_3_0.Base:SetAlpha(1)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._digits = ({
		digital = arg_4_0._digitalDigits,
		vacuum = arg_4_0._vacuumDigits,
		basic = arg_4_0._basicDigits,
		nixie = arg_4_0._nixieDigits,
		glow = arg_4_0._glowDigits
	})[arg_4_1]

	arg_4_0.Base:SetAlpha(arg_4_1 == "digital" and 0.05 or 0)
	arg_4_0.Base:setImage(RegisterMaterial(arg_4_0._digits[#arg_4_0._digits]))
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.Setup = var_0_3
	arg_5_0.SetDigit = var_0_0
	arg_5_0.SetCalculatorDigit = var_0_1
	arg_5_0.SetGlowDigit = var_0_2
	arg_5_0._digitalDigits = {
		"watch_digital_digit_0",
		"watch_digital_digit_1",
		"watch_digital_digit_2",
		"watch_digital_digit_3",
		"watch_digital_digit_4",
		"watch_digital_digit_5",
		"watch_digital_digit_6",
		"watch_digital_digit_7",
		"watch_digital_digit_8",
		"watch_digital_digit_9",
		"watch_digital_digit_base"
	}
	arg_5_0._vacuumDigits = {
		"watch_vacuum_digit_0",
		"watch_vacuum_digit_1",
		"watch_vacuum_digit_2",
		"watch_vacuum_digit_3",
		"watch_vacuum_digit_4",
		"watch_vacuum_digit_5",
		"watch_vacuum_digit_6",
		"watch_vacuum_digit_7",
		"watch_vacuum_digit_8",
		"watch_vacuum_digit_9",
		"watch_vacuum_digit_base"
	}
	arg_5_0._basicDigits = {
		"watch_basic_digit_0",
		"watch_basic_digit_1",
		"watch_basic_digit_2",
		"watch_basic_digit_3",
		"watch_basic_digit_4",
		"watch_basic_digit_5",
		"watch_basic_digit_6",
		"watch_basic_digit_7",
		"watch_basic_digit_8",
		"watch_basic_digit_9"
	}
	arg_5_0._nixieDigits = {
		"watch_nixie_digit_0",
		"watch_nixie_digit_1",
		"watch_nixie_digit_2",
		"watch_nixie_digit_3",
		"watch_nixie_digit_4",
		"watch_nixie_digit_5",
		"watch_nixie_digit_6",
		"watch_nixie_digit_7",
		"watch_nixie_digit_8",
		"watch_nixie_digit_9",
		"watch_nixie_digit_base"
	}
	arg_5_0._glowDigits = {
		"watch_glow_digit_0",
		"watch_glow_digit_1",
		"watch_glow_digit_2",
		"watch_glow_digit_3",
		"watch_glow_digit_4",
		"watch_glow_digit_5",
		"watch_glow_digit_6",
		"watch_glow_digit_7",
		"watch_glow_digit_8",
		"watch_glow_digit_9"
	}
end

function WatchDigit(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_6_0.id = "WatchDigit"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Base"

	var_6_4:SetAlpha(0.05, 0)
	var_6_4:setImage(RegisterMaterial("watch_vacuum_digit_base"), 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Base = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Digit"

	var_6_6:setImage(RegisterMaterial("watch_vacuum_digit_1"), 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Digit = var_6_6

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WatchDigit", WatchDigit)
LockTable(_M)
