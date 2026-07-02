PlayercardUtils = PlayercardUtils or {}

function PlayercardUtils.GetFrontendDataSources(arg_1_0, arg_1_1)
	assert(arg_1_0)
	assert(arg_1_1)

	local var_1_0 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".fullName")
	local var_1_1 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".prestige")
	local var_1_2 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".rank")
	local var_1_3 = Rank.MakeRankIconAggregateFunction(var_1_2, var_1_1)
	local var_1_4 = LUI.AggregateDataSource.new(var_1_2, {
		var_1_2,
		var_1_1
	}, "rankIcon", var_1_3)
	local var_1_5 = Rank.MakeRankDisplayAggregateFunction(var_1_2, var_1_1, true)
	local var_1_6 = LUI.AggregateDataSource.new(var_1_2, {
		var_1_2,
		var_1_1
	}, "display", var_1_5)
	local var_1_7 = var_1_1:Filter("isMasterPrestige", Rank.IsMasterPrestige)
	local var_1_8 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".customEmblemEquipped")
	local var_1_9 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".emblemIndex")
	local var_1_10 = LUI.FilteredDataSource.new(var_1_9, "emblem", function(arg_2_0, arg_2_1)
		return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_2_0, CSV.emblems.cols.image)
	end)
	local var_1_11 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".backgroundIndex"):Filter("background", CallingCardUtils.GetCardTexture)
	local var_1_12 = Engine.EAGGAEGHHA(arg_1_1)
	local var_1_13 = LUI.DataSourceInControllerModel.new(arg_1_0 .. ".xuid", var_1_12)

	var_1_13:SetValue(arg_1_1, var_1_12)

	return {
		xuid = var_1_13,
		fullName = var_1_0,
		displayRank = var_1_6,
		rankIcon = var_1_4,
		rank = var_1_2,
		isMasterPrestige = var_1_7,
		emblem = var_1_10,
		customEmblemEquipped = var_1_8,
		prestige = var_1_1,
		background = var_1_11
	}
end
