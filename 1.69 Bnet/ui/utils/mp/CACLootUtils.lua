Cac = Cac or {}

function Cac.GetLootQualityColorSwatch(arg_1_0)
	local var_1_0 = arg_1_0 or 0

	return LOOT.qualities[var_1_0 + 1].color
end

function Cac.GetLootQualityColor(arg_2_0)
	local var_2_0 = Cac.GetLootQualityColorSwatch(arg_2_0)

	return GetIntForColor(var_2_0)
end
