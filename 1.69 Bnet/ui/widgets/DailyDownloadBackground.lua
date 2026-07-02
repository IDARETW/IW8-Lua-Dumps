module(..., package.seeall)

function DailyDownloadBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 640 * _1080p, 0, 145 * _1080p)

	var_1_0.id = "DailyDownloadBackground"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Line1"

	var_1_4:SetAlpha(0.1, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 64, _1080p * 128, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Line1 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Line2"

	var_1_6:SetAlpha(0.1, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 192, _1080p * 256, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Line2 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Line3"

	var_1_8:SetAlpha(0.1, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 320, _1080p * 384, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Line3 = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Line4"

	var_1_10:SetAlpha(0.1, 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 448, _1080p * 512, 0, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.Line4 = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Line5"

	var_1_12:SetAlpha(0.1, 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 576, _1080p * 640, 0, 0)
	var_1_0:addElement(var_1_12)

	var_1_0.Line5 = var_1_12

	return var_1_0
end

MenuBuilder.registerType("DailyDownloadBackground", DailyDownloadBackground)
LockTable(_M)
