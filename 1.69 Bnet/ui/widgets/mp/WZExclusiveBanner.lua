module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.SnipeTagText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXCLUSIVE")))

	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.SnipeTagText)
	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0.SnipeTagBacker:getLocalRect()
	local var_1_5 = arg_1_1.backerRightPadding or 24 * _1080p

	arg_1_0.SnipeTagBacker:SetRight(var_1_1 + var_1_0 + var_1_5)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetText = var_0_0
end

function WZExclusiveBanner(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 130 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "WZExclusiveBanner"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "SnipeTagBacker"

	var_3_4:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_4:setImage(RegisterMaterial("snipe_tag_backer"), 0)
	var_3_4:Setup3SliceHorizontalImage(_1080p * 30, 0.5)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 130, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.SnipeTagBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "SnipeTagText"

	var_3_6:SetRGBFromTable(SWATCHES.BattlePass.DarkGrey, 0)
	var_3_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXCLUSIVE")), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 125, _1080p * 6, _1080p * 24)
	var_3_0:addElement(var_3_6)

	var_3_0.SnipeTagText = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZExclusiveBanner", WZExclusiveBanner)
LockTable(_M)
