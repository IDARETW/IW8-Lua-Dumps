module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not arg_1_1.image or arg_1_1.image == "" then
		if arg_1_1.title ~= "" then
			arg_1_0.Title:setText(arg_1_1.title)
		else
			arg_1_0.Title:SetAlpha(0)
		end

		return
	end

	arg_1_0.Icon:setImage(RegisterMaterial(arg_1_1.image), 0)
	arg_1_0.Title:setText(arg_1_1.title)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetIconAndDesc = var_0_0
end

function PrestigeRewardItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 68 * _1080p, 0, 90 * _1080p)

	var_3_0.id = "PrestigeRewardItem"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Icon"

	var_3_4:setImage(RegisterMaterial("icon_xp_token"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 68, 0, _1080p * 68)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Title"

	var_3_6:SetScale(-0.2, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/TITLE"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -27, _1080p * 95, _1080p * 68, _1080p * 86)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PrestigeRewardItem", PrestigeRewardItem)
LockTable(_M)
