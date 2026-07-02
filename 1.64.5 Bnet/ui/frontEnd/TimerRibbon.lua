module(..., package.seeall)

local var_0_0 = 1000

local function var_0_1(arg_1_0)
	local var_1_0 = tonumber(Engine.DCJHCAFIIA())
	local var_1_1 = arg_1_0._endEpoch - var_1_0

	if var_1_1 < 0 then
		var_1_1 = 0
	end

	local var_1_2 = TIME.FormatSeconds(var_1_1, TIME.Format.READABLE_MINIMAL, {
		hour = true,
		second = false,
		minute = false,
		day = true
	})

	if arg_1_0._label then
		arg_1_0.Label:setText(string.format("%s: %s", arg_1_0._label, var_1_2))
	else
		arg_1_0.Label:setText(string.format("%s", var_1_2))
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0._label = arg_2_1
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0._endEpoch = arg_3_1

	if arg_3_0._endEpoch then
		arg_3_0._epochTimer = LUI.UITimer.new({
			event = "timer_tick",
			interval = var_0_0
		})

		arg_3_0:addElement(arg_3_0._epochTimer)
		var_0_1(arg_3_0)
	elseif arg_3_0._epochTimer then
		arg_3_0._epochTimer:closeTree()

		arg_3_0._epochTimer = nil
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._label = nil
	arg_4_0._endEpoch = nil
	arg_4_0.SetLabel = var_0_2
	arg_4_0.SetEndEpoch = var_0_3

	arg_4_0:registerEventHandler("timer_tick", function(arg_5_0, arg_5_1)
		var_0_1(arg_5_0)
	end)
end

function TimerRibbon(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p)

	var_6_0.id = "TimerRibbon"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Background"

	var_6_4:SetRGBFromTable(SWATCHES.Arena.NewSecondary, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, 0, 0, _1080p * 1)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Line"

	var_6_6:SetRGBFromTable(SWATCHES.Arena.NewPrimary, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 6, _1080p * -30, _1080p * 1)
	var_6_0:addElement(var_6_6)

	var_6_0.Line = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "Label"

	var_6_8:SetRGBFromTable(SWATCHES.HUD.primary, 0)
	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Right)
	var_6_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -366, _1080p * -12, _1080p * -26, _1080p * -2)
	var_6_0:addElement(var_6_8)

	var_6_0.Label = var_6_8

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TimerRibbon", TimerRibbon)
LockTable(_M)
