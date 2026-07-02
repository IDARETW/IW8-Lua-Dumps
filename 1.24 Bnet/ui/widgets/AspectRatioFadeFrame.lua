module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.ScreenSizeSpacer)

	arg_1_0._fadedIn = true

	local var_1_0 = not arg_1_1 and 0 or arg_1_1

	arg_1_0.ScreenSizeSpacer:SetLeft(arg_1_0._initialLeft * arg_1_0._screenPercent, var_1_0)
	arg_1_0.ScreenSizeSpacer:SetRight(arg_1_0._initialRight * arg_1_0._screenPercent, var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.ScreenSizeSpacer)

	arg_2_0._fadedIn = false

	local var_2_0 = not arg_2_1 and 0 or arg_2_1

	if arg_2_2 then
		arg_2_0._fadeOutScreenPercent = arg_2_2

		arg_2_0.ScreenSizeSpacer:SetLeft(arg_2_0._initialLeft * arg_2_0._fadeOutScreenPercent, var_2_0)
		arg_2_0.ScreenSizeSpacer:SetRight(arg_2_0._initialRight * arg_2_0._fadeOutScreenPercent, var_2_0)
	else
		local var_2_1, var_2_2, var_2_3, var_2_4 = Engine.DBFFAEEFGJ():getCurrentGlobalRect()

		arg_2_0.ScreenSizeSpacer:SetLeft(var_2_1, var_2_0)
		arg_2_0.ScreenSizeSpacer:SetRight(var_2_3, var_2_0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.ScreenSizeSpacer:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 1700, _1080p * 3220, 0, 0)
	arg_3_0:SetAlignment(LUI.Alignment.Center)

	arg_3_0._fadedIn = true

	if arg_3_1 then
		assert(arg_3_0.ScreenSizeSpacer)

		arg_3_0._screenPercent = arg_3_1

		arg_3_0.ScreenSizeSpacer:SetRight(arg_3_0._initialRight * arg_3_0._screenPercent)
	else
		arg_3_0._screenPercent = 1
	end

	arg_3_0:processEvent("onVideoChange")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.setCustomScreenPercent = var_0_2

	local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0.ScreenSizeSpacer:getLocalRect()

	arg_4_0._initialRight = var_4_2
	arg_4_0._initialLeft = var_4_0

	local function var_4_4()
		if not arg_4_0._fadedIn then
			arg_4_0:FadeOut(arg_4_0._fadeOutScreenPercent, true)
		end
	end

	arg_4_0:addEventHandler("onVideoChange", var_4_4)
	arg_4_0:setCustomScreenPercent(arg_4_2.customScreenPercent)

	arg_4_0.FadeIn = var_0_0
	arg_4_0.FadeOut = var_0_1
end

function AspectRatioFadeFrame(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIHorizontalStackedLayout.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "AspectRatioFadeFrame"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "RightFilling"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1430, 0, _1080p * 1080)
	var_6_0:addElement(var_6_4)

	var_6_0.RightFilling = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "LeftGradient"

	var_6_6:SetRGBFromInt(0, 0)
	var_6_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 1430, _1080p * 1700, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.LeftGradient = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "ScreenSizeSpacer"

	var_6_8:SetAlpha(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 1700, _1080p * 3220, 0, 0)
	var_6_0:addElement(var_6_8)

	var_6_0.ScreenSizeSpacer = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "RightGradient"

	var_6_10:SetRGBFromInt(0, 0)
	var_6_10:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 3220, _1080p * 3490, 0, 0)
	var_6_0:addElement(var_6_10)

	var_6_0.RightGradient = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "LeftFilling"

	var_6_12:SetRGBFromInt(0, 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 3490, _1080p * 4920, 0, 0)
	var_6_0:addElement(var_6_12)

	var_6_0.LeftFilling = var_6_12

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("AspectRatioFadeFrame", AspectRatioFadeFrame)
LockTable(_M)
