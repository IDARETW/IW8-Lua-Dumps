local var_0_0 = "options.stickLayout"
local var_0_1 = {}

local function var_0_2(arg_1_0, arg_1_1)
	assert(#arg_1_0 > 0)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		if arg_1_1 == iter_1_1 then
			return iter_1_0
		end
	end

	assert(false, "Entry not found")
end

function LUI.AddStickLayoutLogic(arg_2_0, arg_2_1, arg_2_2)
	var_0_1 = {}

	local var_2_0 = StringTable.BFHCAIIDA(CSV.stickLayouts.file)
	local var_2_1 = CSV.ReadRow(CSV.stickLayouts, 0)
	local var_2_2 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".oldColor", GetIntForColor(SWATCHES.layouts.oldLayout))
	local var_2_3 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".newColor", GetIntForColor(SWATCHES.layouts.newLayout))

	local function var_2_4(arg_3_0, arg_3_1)
		return arg_3_0[arg_3_1] == var_2_1[arg_3_1] and var_2_2 or var_2_3
	end

	local function var_2_5(arg_4_0, arg_4_1)
		local var_4_0 = CSV.ReadRow(CSV.stickLayouts, arg_4_0)
		local var_4_1 = var_0_0 .. "." .. arg_4_0

		return {
			ref = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".ref", var_4_0.cfg),
			name = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".name", Engine.CBBHFCGDIC(var_4_0.name)),
			left = {
				up = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".left.up", Engine.CBBHFCGDIC(var_4_0.leftUp)),
				upColor = var_2_4(var_4_0, "leftUp"),
				down = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".left.down", Engine.CBBHFCGDIC(var_4_0.leftDown)),
				downColor = var_2_4(var_4_0, "leftDown"),
				left = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".left.left", Engine.CBBHFCGDIC(var_4_0.leftLeft)),
				leftColor = var_2_4(var_4_0, "leftLeft"),
				right = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".left.right", Engine.CBBHFCGDIC(var_4_0.leftRight)),
				rightColor = var_2_4(var_4_0, "leftRight"),
				button = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".left.button", Engine.CBBHFCGDIC(var_4_0.leftButton)),
				buttonColor = var_2_4(var_4_0, "leftButton")
			},
			right = {
				up = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".right.up", Engine.CBBHFCGDIC(var_4_0.rightUp)),
				upColor = var_2_4(var_4_0, "rightUp"),
				down = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".right.down", Engine.CBBHFCGDIC(var_4_0.rightDown)),
				downColor = var_2_4(var_4_0, "rightDown"),
				left = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".right.left", Engine.CBBHFCGDIC(var_4_0.rightLeft)),
				leftColor = var_2_4(var_4_0, "rightLeft"),
				right = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".right.right", Engine.CBBHFCGDIC(var_4_0.rightRight)),
				rightColor = var_2_4(var_4_0, "rightRight"),
				button = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".right.button", Engine.CBBHFCGDIC(var_4_0.rightButton)),
				buttonColor = var_2_4(var_4_0, "rightButton")
			}
		}
	end

	local function var_2_6(arg_5_0, arg_5_1)
		local var_5_0 = var_0_1[arg_5_0]

		arg_2_0:SetDataSource(var_5_0, arg_5_1)
		Engine.BEBBDFEICI(arg_2_0._dataSource.ref:GetValue(arg_5_1), arg_5_1)
	end

	local function var_2_7(arg_6_0, arg_6_1)
		local var_6_0 = var_0_1[arg_6_0]

		arg_2_0:SetDataSource(var_6_0, arg_6_1)
	end

	local var_2_8
	local var_2_9 = #OPTIONS.GetStickLayoutLabels() - 1

	for iter_2_0 = 0, var_2_9 do
		local var_2_10 = var_2_5(iter_2_0, arg_2_1)

		table.insert(var_0_1, var_2_10)
	end

	local var_2_11 = Engine.BECCFCBIAA("gpadSticksConfig", arg_2_1)
	local var_2_12 = OPTIONS.stickLayoutStrings[var_2_11]
	local var_2_13 = var_0_2(OPTIONS.GetStickLayoutLabels(), Engine.CBBHFCGDIC(var_2_12))

	arg_2_0:SetDataSource(var_0_1[var_2_13], arg_2_1)
	arg_2_0:SetAlpha(0)
	arg_2_0:addEventHandler("stickLayout_over", function(arg_7_0, arg_7_1)
		arg_2_0:SetAlpha(1)
	end)
	arg_2_0:addEventHandler("stickLayout_up", function(arg_8_0, arg_8_1)
		arg_2_0:SetAlpha(0)
	end)
	arg_2_0:addEventHandler("stickLayout_updated", function(arg_9_0, arg_9_1)
		var_2_6(arg_9_1.index, arg_9_1.controller)
	end)
	arg_2_0:addEventHandler("stickLayout_updatedVisual", function(arg_10_0, arg_10_1)
		var_2_7(arg_10_1.index, arg_10_1.controller)
	end)
end
