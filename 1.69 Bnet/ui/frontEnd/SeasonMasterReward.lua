module(..., package.seeall)

function SeasonMasterReward(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 70 * _1080p, 0, 86 * _1080p)

	var_1_0.id = "SeasonMasterReward"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 70, 0, _1080p * 86)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Icon"

	var_1_6:setImage(RegisterMaterial("icon_xp_token"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 60, _1080p * 9, _1080p * 59)
	var_1_0:addElement(var_1_6)

	var_1_0.Icon = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Title"

	var_1_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_8:SetScale(-0.2, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU/TITLE"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -7, _1080p * 77, _1080p * 68, _1080p * 86)
	var_1_0:addElement(var_1_8)

	var_1_0.Title = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "DivDottedLine"

	var_1_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_1_10:SetZRotation(90, 0)
	var_1_10:setImage(RegisterMaterial("line_dot_ch2"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 44, _1080p * -45, _1080p * 42, _1080p * 44)
	var_1_0:addElement(var_1_10)

	var_1_0.DivDottedLine = var_1_10

	return var_1_0
end

MenuBuilder.registerType("SeasonMasterReward", SeasonMasterReward)
LockTable(_M)
