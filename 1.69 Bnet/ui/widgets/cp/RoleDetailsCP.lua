module(..., package.seeall)

function RoleDetailsCP(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 464 * _1080p, 0, 320 * _1080p)

	var_1_0.id = "RoleDetailsCP"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "DoubleNotchedBacker"

	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.DoubleNotchedBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "FieldOrdersDesc"

	var_1_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 424, _1080p * 245, _1080p * 267)
	var_1_0:addElement(var_1_6)

	var_1_0.FieldOrdersDesc = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "FieldOrdersTitle"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_8:SetAlpha(0, 0)
	var_1_8:setText("Field Orders", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 524, _1080p * 214, _1080p * 243)
	var_1_0:addElement(var_1_8)

	var_1_0.FieldOrdersTitle = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "MunitionsDesc"

	var_1_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 424, _1080p * 149, _1080p * 171)
	var_1_0:addElement(var_1_10)

	var_1_0.MunitionsDesc = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "MunitionsTitle"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_12:SetAlpha(0, 0)
	var_1_12:setText("Unique Munition", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 524, _1080p * 117, _1080p * 146)
	var_1_0:addElement(var_1_12)

	var_1_0.MunitionsTitle = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "PerkDesc"

	var_1_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_14:setText("", 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 424, _1080p * 56, _1080p * 78)
	var_1_0:addElement(var_1_14)

	var_1_0.PerkDesc = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIText.new()

	var_1_16.id = "PerkTitle"

	var_1_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_16:SetAlpha(0.7, 0)
	var_1_16:setText(Engine.CBBHFCGDIC("ATTACHMENTS/PERK_SLOT"), 0)
	var_1_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_16:SetAlignment(LUI.Alignment.Left)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 524, _1080p * 24, _1080p * 54)
	var_1_0:addElement(var_1_16)

	var_1_0.PerkTitle = var_1_16

	return var_1_0
end

MenuBuilder.registerType("RoleDetailsCP", RoleDetailsCP)
LockTable(_M)
