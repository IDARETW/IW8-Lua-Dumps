module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1) or 0

	if var_1_0 > 0 then
		arg_1_0.Image:SetRGBFromTable(LOOT.GetRarityColor(var_1_0))
		arg_1_0.Image:SetAlpha(1)
	else
		arg_1_0.Image:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Image)

	arg_2_0.SetRarityColor = var_0_0
end

function QualityMarker(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 5 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "QualityMarker"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Image"

	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Image = var_3_4

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("QualityMarker", QualityMarker)
LockTable(_M)
