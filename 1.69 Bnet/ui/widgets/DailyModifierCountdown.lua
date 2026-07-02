module(..., package.seeall)

local var_0_0 = 21
local var_0_1 = 3600
local var_0_2 = var_0_1 * 24

local function var_0_3()
	local var_1_0 = Dvar.CFHDGABACF("lui_current_modifier_day")

	if var_1_0 and var_1_0 < var_0_0 and var_1_0 > 0 then
		return var_1_0
	else
		return 1
	end
end

local function var_0_4(arg_2_0)
	local var_2_0 = StringTable.DIFCHIGDFB(CSV.dailyModifiers.file, CSV.dailyModifiers.cols.day, arg_2_0, CSV.dailyModifiers.cols.title)

	if var_2_0 == "" then
		assert(false, "No Title in entry, check daily_modifier.csv")
	end

	return var_2_0
end

local function var_0_5(arg_3_0)
	local var_3_0 = StringTable.DIFCHIGDFB(CSV.dailyModifiers.file, CSV.dailyModifiers.cols.day, arg_3_0, CSV.dailyModifiers.cols.header)

	if var_3_0 == "" then
		assert(false, "No Header in entry, check daily_modifier.csv")
	end

	return var_3_0
end

local function var_0_6(arg_4_0)
	local var_4_0 = StringTable.DIFCHIGDFB(CSV.dailyModifiers.file, CSV.dailyModifiers.cols.day, arg_4_0, CSV.dailyModifiers.cols.body)

	if var_4_0 == "" then
		assert(false, "No Body in entry, check daily_modifier.csv")
	end

	return var_4_0
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = Dvar.BJJCJHDBII("modifier_daily_reset_time")

	if not var_5_0 then
		return
	end

	local var_5_1 = 5000
	local var_5_2 = var_5_0 * var_0_1

	local function var_5_3()
		local var_6_0 = Engine.DEIDGHDBHD() or Engine.DCJHCAFIIA()
		local var_6_1 = var_0_2 - (var_6_0 - var_5_2) % var_0_2
		local var_6_2 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_6_1))

		arg_5_1:setText(Engine.CBBHFCGDIC("CHALLENGE/RESET_TIME", var_6_2))

		local var_6_3 = var_0_3()

		if var_6_3 ~= arg_5_0.currentDay then
			arg_5_0.currentDay = var_6_3

			arg_5_0.Body:setText(Engine.CBBHFCGDIC(var_0_6(arg_5_0.currentDay)))
		end
	end

	local var_5_4 = LUI.UITimer.new({
		event = "update_reset_time",
		interval = var_5_1
	})

	var_5_4.id = "dayResetTimer"

	arg_5_0:addElement(var_5_4)
	arg_5_0:addAndCallEventHandler("update_reset_time", var_5_3)
end

local function var_0_8(arg_7_0)
	arg_7_0.Title:setText(Engine.CBBHFCGDIC(var_0_4(arg_7_0.currentDay)))
	arg_7_0.ModifierHeader:setText(Engine.CBBHFCGDIC(var_0_5(arg_7_0.currentDay)))
	arg_7_0.Body:setText(Engine.CBBHFCGDIC(var_0_6(arg_7_0.currentDay)))
	var_0_7(arg_7_0, arg_7_0.timer, false)
	arg_7_0.Watermark:SetMask(arg_7_0.WatermarkMask)
end

local function var_0_9(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.currentDay = var_0_3()

	var_0_8(arg_8_0)
end

function DailyModifierCountdown(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 115 * _1080p)

	var_9_0.id = "DailyModifierCountdown"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "background"

	var_9_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_9_4:SetAlpha(0.8, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.background = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "Darkener"

	var_9_6:SetRGBFromInt(0, 0)
	var_9_6:SetAlpha(0.5, 0)
	var_9_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 32, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.Darkener = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "Watermark"

	var_9_8:SetAlpha(0.15, 0)
	var_9_8:setImage(RegisterMaterial("v_ui_icon_codmas_krampus_alive"), 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 7, _1080p * 179, _1080p * -104, _1080p * 68)
	var_9_0:addElement(var_9_8)

	var_9_0.Watermark = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "WatermarkMask"

	var_9_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 32, 0)
	var_9_0:addElement(var_9_10)

	var_9_0.WatermarkMask = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "Header"

	var_9_12:SetRGBFromTable(SWATCHES.WZCH3.WZCH3SeasonalEventColor, 0)
	var_9_12:SetAlpha(0.9, 0)
	var_9_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 32)
	var_9_0:addElement(var_9_12)

	var_9_0.Header = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIStyledText.new()

	var_9_14.id = "Title"

	var_9_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_9_14:setText("", 0)
	var_9_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_14:SetWordWrap(false)
	var_9_14:SetAlignment(LUI.Alignment.Left)
	var_9_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_14:SetStartupDelay(1000)
	var_9_14:SetLineHoldTime(400)
	var_9_14:SetAnimMoveTime(150)
	var_9_14:SetAnimMoveSpeed(50)
	var_9_14:SetEndDelay(1000)
	var_9_14:SetCrossfadeTime(400)
	var_9_14:SetFadeInTime(300)
	var_9_14:SetFadeOutTime(300)
	var_9_14:SetMaxVisibleLines(1)
	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 326, _1080p * 1, _1080p * 31)
	var_9_0:addElement(var_9_14)

	var_9_0.Title = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIStyledText.new()

	var_9_16.id = "timer"

	var_9_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_9_16:setText("", 0)
	var_9_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_16:SetWordWrap(false)
	var_9_16:SetAlignment(LUI.Alignment.Right)
	var_9_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_16:SetStartupDelay(1000)
	var_9_16:SetLineHoldTime(400)
	var_9_16:SetAnimMoveTime(150)
	var_9_16:SetAnimMoveSpeed(50)
	var_9_16:SetEndDelay(1000)
	var_9_16:SetCrossfadeTime(400)
	var_9_16:SetFadeInTime(300)
	var_9_16:SetFadeOutTime(300)
	var_9_16:SetMaxVisibleLines(1)
	var_9_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -124, _1080p * -15, _1080p * 7, _1080p * 25)
	var_9_0:addElement(var_9_16)

	var_9_0.timer = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIText.new()

	var_9_18.id = "Body"

	var_9_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_9_18:setText("", 0)
	var_9_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_18:SetAlignment(LUI.Alignment.Left)
	var_9_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 38, _1080p * 62)
	var_9_0:addElement(var_9_18)

	var_9_0.Body = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIText.new()

	var_9_20.id = "ModifierHeader"

	var_9_20:SetAlpha(0, 0)
	var_9_20:setText("", 0)
	var_9_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_20:SetAlignment(LUI.Alignment.Left)
	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 432, _1080p * 32, _1080p * 50)
	var_9_0:addElement(var_9_20)

	var_9_0.ModifierHeader = var_9_20

	local function var_9_21()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		}
	}

	var_9_14:RegisterAnimationSequence("InGame", var_9_23)

	local var_9_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 58
		}
	}

	var_9_18:RegisterAnimationSequence("InGame", var_9_24)

	local function var_9_25()
		var_9_14:AnimateSequence("InGame")
		var_9_18:AnimateSequence("InGame")
	end

	var_9_0._sequences.InGame = var_9_25

	var_0_9(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("DailyModifierCountdown", DailyModifierCountdown)
LockTable(_M)
