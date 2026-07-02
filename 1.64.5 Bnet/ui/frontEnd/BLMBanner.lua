module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if Dvar.IBEGCHEFE("blm_banner") then
		arg_1_0:SetAlpha(1)
	else
		arg_1_0:SetAlpha(0)
	end
end

function BLMBanner(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 650 * _1080p, 0, 56 * _1080p)

	var_2_0.id = "BLMBanner"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Backer"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Backer = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "BLMText"

	var_2_6:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_2_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM")), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -201, _1080p * 229, _1080p * -15, _1080p * 15)
	var_2_0:addElement(var_2_6)

	var_2_0.BLMText = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BLMBanner", BLMBanner)
LockTable(_M)
