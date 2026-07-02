TIME = {}
TIME.Format = {
	STOPWATCH = 3,
	READABLE = 1,
	READABLE_MINIMAL = 2
}
TIME.TIMER_TICK = "timer_tick"
TIME.TIMER_COMPLETE = "timer_complete"

local var_0_0 = {
	"millisecond",
	"second",
	"minute",
	"hour",
	"day"
}
local var_0_1 = {
	"day",
	"hour",
	"minute",
	"second",
	"millisecond"
}
local var_0_2 = {
	millisecond = {
		milliseconds = 1,
		smallName = Engine.CBBHFCGDIC("TIME/MILLISECOND_MINIMAL"),
		longName = Engine.CBBHFCGDIC("TIME/MILLISECOND"),
		longNamePlural = Engine.CBBHFCGDIC("TIME/MILLISECOND_PLURAL")
	},
	second = {
		milliseconds = 1000,
		smallName = Engine.CBBHFCGDIC("TIME/SECOND_MINIMAL"),
		longName = Engine.CBBHFCGDIC("TIME/SECOND"),
		longNamePlural = Engine.CBBHFCGDIC("TIME/SECOND_PLURAL")
	},
	minute = {
		milliseconds = 60000,
		smallName = Engine.CBBHFCGDIC("TIME/MINUTE_MINIMAL"),
		longName = Engine.CBBHFCGDIC("TIME/MINUTE"),
		longNamePlural = Engine.CBBHFCGDIC("TIME/MINUTE_PLURAL")
	},
	hour = {
		milliseconds = 3600000,
		smallName = Engine.CBBHFCGDIC("TIME/HOUR_MINIMAL"),
		longName = Engine.CBBHFCGDIC("TIME/HOUR"),
		longNamePlural = Engine.CBBHFCGDIC("TIME/HOUR_PLURAL")
	},
	day = {
		milliseconds = 86400000,
		smallName = Engine.CBBHFCGDIC("TIME/DAY_MINIMAL"),
		longName = Engine.CBBHFCGDIC("TIME/DAY"),
		longNamePlural = Engine.CBBHFCGDIC("TIME/DAY_PLURAL")
	}
}

local function var_0_3(arg_1_0, arg_1_1)
	local var_1_0 = {}

	for iter_1_0 = #var_0_0, 1, -1 do
		local var_1_1 = var_0_0[iter_1_0]
		local var_1_2 = arg_1_1[var_1_1]

		if var_1_2 ~= nil then
			local var_1_3 = var_0_2[var_1_1]
			local var_1_4 = math.floor(arg_1_0 / var_1_3.milliseconds)

			arg_1_0 = arg_1_0 - var_1_4 * var_1_3.milliseconds

			if var_1_4 > 0 or var_1_2 == false then
				var_1_0[var_1_1] = var_1_4
			end
		end
	end

	return var_1_0
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0 = var_0_3(arg_2_0, arg_2_1)
	local var_2_1 = ""
	local var_2_2 = {}
	local var_2_3 = CONDITIONS.IsArabic(self)
	local var_2_4 = var_2_3 and var_0_1 or var_0_0

	for iter_2_0 = #var_2_4, 1, -1 do
		local var_2_5 = var_2_4[iter_2_0]
		local var_2_6 = var_2_0[var_2_5]

		if var_2_6 then
			local var_2_7

			if var_2_3 then
				var_2_7 = string.format("%s %d", var_2_6 > 1 and var_0_2[var_2_5].longNamePlural or var_0_2[var_2_5].longName, var_2_6)
			else
				var_2_7 = string.format("%d %s", var_2_6, var_2_6 > 1 and var_0_2[var_2_5].longNamePlural or var_0_2[var_2_5].longName)
			end

			table.insert(var_2_2, var_2_7)

			var_2_1 = var_2_1 .. "%s "
		end
	end

	return string.format(var_2_1, unpack(var_2_2))
end

function TIME.SetCountDownTimerTextField(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0 and arg_3_0.setText, " You must provide a valid Textfield element.")
	assert(arg_3_1 and type(arg_3_1) == "number" and arg_3_1 > 0, "You must provide a vaild number (in milliseconds greater than 0)")

	local var_3_0 = arg_3_2 and arg_3_2.customFormatString and arg_3_2.customFormatString or "LUA_MENU/DAYS_HOURS_MINUTES_SECONDS"
	local var_3_1 = arg_3_2 and arg_3_2.customInterval and arg_3_2.customInterval or 1000
	local var_3_2 = LUI.UITimer.new({
		interval = var_3_1,
		event = arg_3_0.id .. "_timer_tick"
	})

	local function var_3_3(arg_4_0, arg_4_1)
		local var_4_0 = Engine.CCEJJCCDEG(tostring(arg_3_1))

		if var_4_0 ~= nil and var_4_0 > 0 then
			local var_4_1 = math.floor(var_4_0 / 86400)
			local var_4_2 = math.floor(var_4_0 % 86400 / 3600)
			local var_4_3 = math.floor(var_4_0 % 3600 / 60)
			local var_4_4 = math.floor(var_4_0 % 60)

			if arg_3_2 and arg_3_2.useCustomDisplay then
				arg_4_0:processEvent({
					name = TIME.TIMER_TICK,
					intervals = {
						days = var_4_1,
						hours = var_4_2,
						minutes = var_4_3,
						seconds = var_4_4
					}
				})
			else
				arg_4_0:setText(Engine.CBBHFCGDIC(var_3_0, var_4_1, var_4_2, var_4_3, var_4_4))
			end
		else
			if var_3_2 then
				var_3_2:closeTree()

				var_3_2 = nil
			end

			if arg_3_2 and arg_3_2.broadcastOnComplete then
				arg_3_0:processEvent({
					name = TIME.TIMER_COMPLETE,
					{
						disabledText = arg_3_2.disabledText
					}
				})
			else
				arg_4_0:setText("")
			end
		end
	end

	var_3_2.id = "countDownTimer"

	arg_3_0:addElement(var_3_2)
	arg_3_0:registerEventHandler(arg_3_0.id .. "_timer_tick", var_3_3)
	var_3_3(arg_3_0)
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = var_0_3(arg_5_0, arg_5_1)
	local var_5_1 = ""
	local var_5_2 = {}
	local var_5_3 = CONDITIONS.IsArabic(self)
	local var_5_4 = var_5_3 and var_0_1 or var_0_0

	for iter_5_0 = #var_5_4, 1, -1 do
		local var_5_5 = var_5_4[iter_5_0]
		local var_5_6 = var_5_0[var_5_5]

		if var_5_6 then
			local var_5_7

			if var_5_3 then
				var_5_7 = string.format("%s%d", var_0_2[var_5_5].smallName, var_5_6)
			else
				var_5_7 = string.format("%d%s", var_5_6, var_0_2[var_5_5].smallName)
			end

			table.insert(var_5_2, var_5_7)

			var_5_1 = var_5_1 .. "%s "
		end
	end

	return string.format(var_5_1, unpack(var_5_2))
end

local function var_0_6(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0 / 60000
	local var_6_1 = arg_6_0 / 1000 % 60
	local var_6_2 = arg_6_0 % 1000 / 100

	return string.format("%01d:%02d.%01d", var_6_0, var_6_1, var_6_2)
end

function TIME.FormatSeconds(arg_7_0, arg_7_1, arg_7_2)
	arg_7_2 = arg_7_2 or {
		minute = false,
		second = false
	}

	if arg_7_1 == TIME.Format.READABLE then
		return var_0_4(arg_7_0 * 1000, arg_7_2)
	elseif arg_7_1 == TIME.Format.READABLE_MINIMAL then
		return var_0_5(arg_7_0 * 1000, arg_7_2)
	elseif arg_7_1 == TIME.Format.STOPWATCH then
		return var_0_6(arg_7_0 * 1000)
	else
		assert(false, "Invalid time format provided to TIME.FormatSeconds")
	end
end

function TIME.FormatMilliseconds(arg_8_0, arg_8_1, arg_8_2)
	arg_8_2 = arg_8_2 or {
		minute = false,
		second = false
	}

	if arg_8_1 == TIME.Format.READABLE then
		return var_0_4(arg_8_0, arg_8_2)
	elseif arg_8_1 == TIME.Format.READABLE_MINIMAL then
		return var_0_5(arg_8_0, arg_8_2)
	elseif arg_8_1 == TIME.Format.STOPWATCH then
		return var_0_6(arg_8_0)
	else
		assert(false, "Invalid time format provided to TIME.FormatMilliseconds")
	end
end
