module(..., package.seeall)

function GenericBackgroundGlow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 24 * _1080p, 0, 24 * _1080p)

	var_1_0.id = "GenericBackgroundGlow"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "FrameMidLeft"

	var_1_4:setImage(RegisterMaterial("widg_glow_lt"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 8, _1080p * 8, _1080p * -8)
	var_1_0:addElement(var_1_4)

	var_1_0.FrameMidLeft = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "FrameMidRight"

	var_1_6:setImage(RegisterMaterial("widg_glow_rt"), 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -8, 0, _1080p * 8, _1080p * -8)
	var_1_0:addElement(var_1_6)

	var_1_0.FrameMidRight = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "FrameLowerRight"

	var_1_8:setImage(RegisterMaterial("widg_glow_bottom_rt"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -8, 0, _1080p * -8, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.FrameLowerRight = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "FrameLowerLeft"

	var_1_10:setImage(RegisterMaterial("widg_glow_bottom_lt"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 8, _1080p * -8, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.FrameLowerLeft = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "FrameUpperRight"

	var_1_12:setImage(RegisterMaterial("widg_glow_top_rt"), 0)
	var_1_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -8, 0, 0, _1080p * 8)
	var_1_0:addElement(var_1_12)

	var_1_0.FrameUpperRight = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "FrameUpperLeft"

	var_1_14:setImage(RegisterMaterial("widg_glow_top_lt"), 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 8, 0, _1080p * 8)
	var_1_0:addElement(var_1_14)

	var_1_0.FrameUpperLeft = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "FrameCenter"

	var_1_16:setImage(RegisterMaterial("widg_glow_center"), 0)
	var_1_16:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * -8)
	var_1_0:addElement(var_1_16)

	var_1_0.FrameCenter = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIImage.new()

	var_1_18.id = "Image0"

	var_1_18:setImage(RegisterMaterial("widg_glow_tp"), 0)
	var_1_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 8, _1080p * -8, 0, _1080p * 8)
	var_1_0:addElement(var_1_18)

	var_1_0.Image0 = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIImage.new()

	var_1_20.id = "Image1"

	var_1_20:setImage(RegisterMaterial("widg_glow_btm"), 0)
	var_1_20:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 8, _1080p * -8, _1080p * -8, 0)
	var_1_0:addElement(var_1_20)

	var_1_0.Image1 = var_1_20

	return var_1_0
end

MenuBuilder.registerType("GenericBackgroundGlow", GenericBackgroundGlow)
LockTable(_M)
