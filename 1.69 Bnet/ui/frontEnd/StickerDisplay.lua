module(..., package.seeall)

local var_0_0 = SWATCHES.CAC.attachmentEmpty

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = WEAPON.GetMaxStickerSlotsForWeapon(arg_1_1.weapon)

	for iter_1_0 = 1, var_1_0 do
		local var_1_1 = arg_1_1.stickers[iter_1_0]
		local var_1_2 = var_1_1 == WEAPON.StickerNoneValue and "menu_default_slot" or WEAPON.GetStickerImage(var_1_1)

		if var_1_2 == "menu_default_slot" then
			arg_1_0._stickers[iter_1_0]:SetRGBFromTable(var_0_0)
			arg_1_0._stickers[iter_1_0]:SetAlpha(0.5)
		end

		arg_1_0._stickers[iter_1_0]:setImage(RegisterMaterial(var_1_2))
	end

	for iter_1_1 = var_1_0 + 1, #arg_1_0._stickers do
		arg_1_0._stickers[iter_1_1]:SetAlpha(0)
	end
end

local function var_0_2(arg_2_0)
	return arg_2_0._imageWidth
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Sticker1)
	assert(arg_3_0.Sticker2)
	assert(arg_3_0.Sticker3)
	assert(arg_3_0.Sticker4)

	arg_3_0.Setup = var_0_1
	arg_3_0.GetImageWidth = var_0_2
	arg_3_0._stickers = {
		arg_3_0.Sticker1,
		arg_3_0.Sticker2,
		arg_3_0.Sticker3,
		arg_3_0.Sticker4
	}
	arg_3_0._imageWidth = 0

	local var_3_0 = 5 * _1080p

	for iter_3_0 = 1, #arg_3_0._stickers do
		arg_3_0._imageWidth = arg_3_0._imageWidth + LAYOUT.GetElementWidth(arg_3_0._stickers[iter_3_0]) + var_3_0
	end
end

function StickerDisplay(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 56 * _1080p)

	var_4_0.id = "StickerDisplay"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "Category"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_4:setText(Engine.CBBHFCGDIC("CAS/STICKERS"), 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_4:SetWordWrap(false)
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 13, _1080p * -250, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_4)

	var_4_0.Category = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Sticker1"

	var_4_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -239, _1080p * -183, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.Sticker1 = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Sticker2"

	var_4_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -178, _1080p * -122, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Sticker2 = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Sticker3"

	var_4_10:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -117, _1080p * -61, 0, 0)
	var_4_0:addElement(var_4_10)

	var_4_0.Sticker3 = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Sticker4"

	var_4_12:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -56, 0, 0, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.Sticker4 = var_4_12

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("StickerDisplay", StickerDisplay)
LockTable(_M)
