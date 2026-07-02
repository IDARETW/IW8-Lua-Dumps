module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(10000).onComplete = var_1_1

		arg_1_0.TimeLabel:setText(var_2_0)
	end

	var_1_1()
end

function WatchCode2(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "WatchCode2"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Face"

	var_3_4:setImage(RegisterMaterial("watch_code_face_2"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -17, _1080p * 24, _1080p * 77, _1080p * 63)
	var_3_0:addElement(var_3_4)

	var_3_0.Face = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "TimeLabel"

	var_3_6:SetRGBFromInt(13487565, 0)
	var_3_6:setText("00:00", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -227, _1080p * 227, _1080p * 5, _1080p * 133)
	var_3_0:addElement(var_3_6)

	var_3_0.TimeLabel = var_3_6

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WatchCode2", WatchCode2)
LockTable(_M)
