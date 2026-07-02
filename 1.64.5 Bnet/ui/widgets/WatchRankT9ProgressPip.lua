module(..., package.seeall)

function WatchRankT9ProgressPip(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 38 * _1080p, 0, 38 * _1080p)

	var_1_0.id = "WatchRankT9ProgressPip"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "PipShadow"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.PipShadow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Pip"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.2, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 4, _1080p * 4)
	var_1_0:addElement(var_1_6)

	var_1_0.Pip = var_1_6

	return var_1_0
end

MenuBuilder.registerType("WatchRankT9ProgressPip", WatchRankT9ProgressPip)
LockTable(_M)
