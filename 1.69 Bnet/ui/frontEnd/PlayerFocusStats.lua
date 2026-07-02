module(..., package.seeall)

function PlayerFocusStats(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 150 * _1080p)

	var_1_0.id = "PlayerFocusStats"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "StatsImage"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 42, _1080p * 136, 0, _1080p * 94)
	var_1_0:addElement(var_1_4)

	var_1_0.StatsImage = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "StatsName"

	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 31, _1080p * 147, _1080p * 101, _1080p * 121)
	var_1_0:addElement(var_1_6)

	var_1_0.StatsName = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Value"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 159, _1080p * 125, _1080p * 145)
	var_1_0:addElement(var_1_8)

	var_1_0.Value = var_1_8

	return var_1_0
end

MenuBuilder.registerType("PlayerFocusStats", PlayerFocusStats)
LockTable(_M)
