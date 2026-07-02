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
	arg_2_1 = tonumber(arg_2_1)

	if arg_2_1 == nil then
		arg_2_1 = 0
	end

	local var_2_0 = arg_2_0._digits[arg_2_1 + 1]

	arg_2_0.Digit:SetAlpha(1)
	arg_2_0.Digit:setImage(RegisterMaterial(var_2_0))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 == nil then
		arg_3_0.Digit:SetAlpha(0.1)
		arg_3_0.Digit:setImage(RegisterMaterial("watch_digital_digit_base"))
	else
		local var_3_0 = arg_3_0._digits[tonumber(arg_3_1) + 1]

		arg_3_0.Digit:setImage(RegisterMaterial(var_3_0))
		arg_3_0.Digit:SetAlpha(0.9)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0.Digit:SetRGBFromTable(arg_4_3.digit)
	arg_4_0.Base:SetRGBFromTable(arg_4_3.base)

	if not Engine.DDJFBBJAIG() then
		arg_4_0.Base:SetParallaxMotionAmount(4)
	end

	if arg_4_1 == nil then
		arg_4_0.Base:setImage(RegisterMaterial("watch_glow_digit_mask"))
		arg_4_0.Digit:setImage(RegisterMaterial("watch_glow_digit_mask"))
		arg_4_0.Digit:SetAlpha(0)
		arg_4_0.Base:SetAlpha(0)
	else
		local var_4_0 = arg_4_0._digits[tonumber(arg_4_1) + 1]

		arg_4_0.Base:setImage(RegisterMaterial(var_4_0))
		arg_4_0.Digit:setImage(RegisterMaterial(var_4_0 .. "_h"))
		arg_4_0.Digit:SetAlpha(1)
		arg_4_0.Base:SetAlpha(1)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0._digits = ({
		digital = arg_5_0._digitalDigits,
		vacuum = arg_5_0._vacuumDigits,
		basic = arg_5_0._basicDigits,
		nixie = arg_5_0._nixieDigits,
		glow = arg_5_0._glowDigits,
		retroT9 = arg_5_0._retroT9Digits
	})[arg_5_1]

	arg_5_0.Base:SetAlpha(arg_5_1 == "digital" and 0.05 or 0)
	arg_5_0.Base:setImage(RegisterMaterial(arg_5_0._digits[#arg_5_0._digits]))
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Setup = var_0_4
	arg_6_0.SetDigit = var_0_0
	arg_6_0.SetCalculatorDigit = var_0_2
	arg_6_0.SetGlowDigit = var_0_3
	arg_6_0.SetCounterDigit = var_0_1
	arg_6_0._digitalDigits = {
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
	arg_6_0._vacuumDigits = {
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
	arg_6_0._basicDigits = {
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
	arg_6_0._nixieDigits = {
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
	arg_6_0._glowDigits = {
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
	arg_6_0._retroT9Digits = {
		"watch_retro_t9_digit_0",
		"watch_retro_t9_digit_1",
		"watch_retro_t9_digit_2",
		"watch_retro_t9_digit_3",
		"watch_retro_t9_digit_4",
		"watch_retro_t9_digit_5",
		"watch_retro_t9_digit_6",
		"watch_retro_t9_digit_7",
		"watch_retro_t9_digit_8",
		"watch_retro_t9_digit_9"
	}
end

function WatchDigit(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_7_0.id = "WatchDigit"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Base"

	var_7_4:SetAlpha(0.05, 0)
	var_7_4:setImage(RegisterMaterial("watch_vacuum_digit_base"), 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Base = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Digit"

	var_7_6:setImage(RegisterMaterial("watch_vacuum_digit_1"), 0)
	var_7_0:addElement(var_7_6)

	var_7_0.Digit = var_7_6

	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("WatchDigit", WatchDigit)
LockTable(_M)
