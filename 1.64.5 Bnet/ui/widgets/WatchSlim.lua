module(..., package.seeall)

local var_0_0 = 12000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(var_0_0).onComplete = var_1_1

		arg_1_0.Time:setText(var_2_0)
	end

	var_1_1()

	local var_1_2 = Engine.EBCIHGAFBB(Engine.DCJHCAFIIA())

	arg_1_0.Date:setText(ToUpperCase(var_1_2))
end

function WatchSlim(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchSlim"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "Time"

	var_3_4:SetRGBFromInt(15404545, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.6, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_4:SetTracking(8 * _1080p, 0)
	var_3_4:SetAlignment(LUI.Alignment.Center)
	var_3_4:SetOutlineMinDistance(0, 0)
	var_3_4:SetOutlineMaxDistance(0.2, 0)
	var_3_4:SetOutlineRGBFromInt(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -288, _1080p * -218)
	var_3_0:addElement(var_3_4)

	var_3_0.Time = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Date"

	var_3_6:SetRGBFromInt(15404545, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.6, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetOutlineRGBFromInt(0, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -217, _1080p * -181)
	var_3_0:addElement(var_3_6)

	var_3_0.Date = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchSlim", WatchSlim)
LockTable(_M)
