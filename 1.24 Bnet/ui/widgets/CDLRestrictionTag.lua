module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if MLG.IsCDLActive(arg_1_1) then
		arg_1_0:SetAlpha(1)
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	var_0_0(arg_2_0, arg_2_1)

	arg_2_0.UpdateVisibility = var_0_0
end

function CDLRestrictionTag(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 66 * _1080p)

	var_3_0.id = "CDLRestrictionTag"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Gradient"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_3_4:SetAlpha(0.65, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.Gradient = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "LeftBar"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, 0, 0, _1080p * 30)
	var_3_0:addElement(var_3_6)

	var_3_0.LeftBar = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "CDLLogo"

	var_3_8:setImage(RegisterMaterial("cdl_logo_small"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 126, _1080p * 3, _1080p * 26)
	var_3_0:addElement(var_3_8)

	var_3_0.CDLLogo = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Label"

	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/CDL_RULES_EFFECT"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 132, _1080p * 419, _1080p * 5, _1080p * 25)
	var_3_0:addElement(var_3_10)

	var_3_0.Label = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "CDLInfo"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CDL_ADD_INFO"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 38, _1080p * 56)
	var_3_0:addElement(var_3_12)

	var_3_0.CDLInfo = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CDLRestrictionTag", CDLRestrictionTag)
LockTable(_M)
