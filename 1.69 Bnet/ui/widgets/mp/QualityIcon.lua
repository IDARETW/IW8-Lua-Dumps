module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	function arg_1_0.SetDisplayQuality(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_1 ~= nil and (arg_2_2 or arg_2_1 > Cac.LowestQuality) then
			local var_2_0 = Cac.GetLootQualityColor(arg_2_1)

			arg_2_0:SetRGBFromInt(var_2_0, 0)
			arg_2_0:SetAlpha(1, 0)
		else
			arg_2_0:SetAlpha(0, 0)
		end
	end
end

function QualityIcon(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "QualityIcon"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Main"

	var_3_4:SetZRotation(45, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 9, _1080p * -9, _1080p * 9, _1080p * -9)
	var_3_0:addElement(var_3_4)

	var_3_0.Main = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Darken"

	var_3_6:SetRGBFromTable(SWATCHES.itemRarity.qualityBase, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_6:SetZRotation(45, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 21, _1080p * -21, _1080p * 21, _1080p * -21)
	var_3_0:addElement(var_3_6)

	var_3_0.Darken = var_3_6

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("QualityIcon", QualityIcon)
LockTable(_M)
