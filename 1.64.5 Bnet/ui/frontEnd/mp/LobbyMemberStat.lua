module(..., package.seeall)

function LobbyMemberStat(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 418 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "LobbyMemberStat"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Title"

	var_1_6:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 260, _1080p * 3, _1080p * 25)
	var_1_0:addElement(var_1_6)

	var_1_0.Title = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Value"

	var_1_8:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Right)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -162, _1080p * -10, _1080p * 3, _1080p * 25)
	var_1_0:addElement(var_1_8)

	var_1_0.Value = var_1_8

	return var_1_0
end

MenuBuilder.registerType("LobbyMemberStat", LobbyMemberStat)
LockTable(_M)
