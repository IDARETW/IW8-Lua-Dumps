module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(15000).onComplete = var_1_1

		arg_1_0.TimeLabel:setText(var_2_0)
	end

	var_1_1()

	local var_1_2 = Engine.CHCIHAAECA(Engine.DCJHCAFIIA())

	arg_1_0.DateLabel:setText(var_1_2)
end

function WatchFaceDigital02(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "WatchFaceDigital02"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Grad"

	var_3_4:SetRGBFromInt(2458, 0)
	var_3_4:SetAlpha(0.4, 0)
	var_3_4:setImage(RegisterMaterial("hud_buttongradient"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 10, _1080p * 128)
	var_3_0:addElement(var_3_4)

	var_3_0.Grad = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Image2Copy0"

	var_3_6:setImage(RegisterMaterial("icon_watch_tick_ring_02"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 107, _1080p * 21, _1080p * 107)
	var_3_0:addElement(var_3_6)

	var_3_0.Image2Copy0 = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Image1"

	var_3_8:SetRGBFromInt(16763904, 0)
	var_3_8:setImage(RegisterMaterial("icon_watch_tick_ring_01"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 109, _1080p * 19, _1080p * 109)
	var_3_0:addElement(var_3_8)

	var_3_0.Image1 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Image2"

	var_3_10:SetRGBFromTable(SWATCHES.Reticles.Orange, 0)
	var_3_10:setImage(RegisterMaterial("hud_reticle_ring_128"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 114, _1080p * 14, _1080p * 114)
	var_3_0:addElement(var_3_10)

	var_3_0.Image2 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "TimeLabel"

	var_3_12:SetRGBFromInt(16759552, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetLeading(-40 * _1080p, 0)
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 12, _1080p * 116, _1080p * 64, _1080p * 86)
	var_3_0:addElement(var_3_12)

	var_3_0.TimeLabel = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "DateLabel"

	var_3_14:SetRGBFromInt(16759552, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 105, _1080p * 42, _1080p * 64)
	var_3_0:addElement(var_3_14)

	var_3_0.DateLabel = var_3_14

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchFaceDigital02", WatchFaceDigital02)
LockTable(_M)
