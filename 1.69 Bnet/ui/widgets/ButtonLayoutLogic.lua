local var_0_0 = "options.buttonLayout"
local var_0_1 = GetIntForColor(SWATCHES.layouts.oldLayout)
local var_0_2 = GetIntForColor(SWATCHES.layouts.newLayout)
local var_0_3 = {}

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = Engine.CAADCDEEIA()
	local var_1_1 = arg_1_0.name
	local var_1_2 = var_1_0 and arg_1_0.leftTriggerSP or arg_1_0.leftTrigger
	local var_1_3 = var_1_0 and arg_1_0.leftShoulderSP or arg_1_0.leftShoulder
	local var_1_4 = var_1_0 and arg_1_0.rightTriggerSP or arg_1_0.rightTrigger
	local var_1_5 = var_1_0 and arg_1_0.rightShoulderSP or arg_1_0.rightShoulder
	local var_1_6 = arg_1_0.cfg

	if arg_1_1 then
		var_1_3, var_1_2 = var_1_2, var_1_3
		var_1_5, var_1_4 = var_1_4, var_1_5
		var_1_1 = var_1_1 .. "_alt"
		var_1_6 = var_1_6 .. "_alt"
	end

	return {
		cfg = var_1_6,
		layoutName = var_1_1,
		leftTrigger = var_1_2,
		leftShoulder = var_1_3,
		rightTrigger = var_1_4,
		rightShoulder = var_1_5
	}
end

local function var_0_5(arg_2_0, arg_2_1)
	assert(#arg_2_0 > 0)

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		if arg_2_1 == iter_2_1 then
			return iter_2_0
		end
	end

	assert(false, "Entry not found")
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = #var_0_3 - 1
	local var_3_1 = OPTIONS.GetCurrentCSVButtonLayouts(arg_3_0.isBR)

	for iter_3_0 = 0, var_3_0 do
		local var_3_2 = CSV.ReadRow(var_3_1, iter_3_0)
		local var_3_3 = var_0_3[iter_3_0 + 1]
		local var_3_4 = var_0_4(var_3_2, arg_3_2)

		var_3_3.ref:SetValue(arg_3_1, var_3_4.cfg)
		var_3_3.name:SetValue(arg_3_1, Engine.CBBHFCGDIC(var_3_4.layoutName))
		var_3_3.leftTrigger:SetValue(arg_3_1, Engine.CBBHFCGDIC(var_3_4.leftTrigger))
		var_3_3.rightTrigger:SetValue(arg_3_1, Engine.CBBHFCGDIC(var_3_4.rightTrigger))
		var_3_3.leftShoulder:SetValue(arg_3_1, Engine.CBBHFCGDIC(var_3_4.leftShoulder))
		var_3_3.rightShoulder:SetValue(arg_3_1, Engine.CBBHFCGDIC(var_3_4.rightShoulder))
	end
end

function LUI.AddButtonLayoutLogic(arg_4_0, arg_4_1, arg_4_2)
	var_0_3 = {}

	WipeControllerModelsAtPath(var_0_0)

	local var_4_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_4_1)
	local var_4_1 = StringTable.DIFCHIGDFB(CSV.stickLayouts.file, CSV.stickLayouts.cols.cfg, var_4_0, CSV.stickLayouts.cols.swapStickButtons) == "1"
	local var_4_2
	local var_4_3
	local var_4_4
	local var_4_5

	arg_4_0.isBR = arg_4_2.isBR

	if arg_4_0.isBR then
		var_4_2 = Engine.BECCFCBIAA("gpadBRButtonsConfig", arg_4_1)
		var_4_3 = CSV.brButtonLayouts
		var_4_4 = OPTIONS.brButtonLayoutStrings
		var_4_5 = OPTIONS.GetBRButtonLayoutLabels
	else
		var_4_2 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_4_1)
		var_4_3 = CSV.buttonLayouts
		var_4_4 = OPTIONS.buttonLayoutStrings
		var_4_5 = OPTIONS.GetButtonLayoutLabels
	end

	local var_4_6 = string.match(var_4_2, "_alt$") ~= nil

	local function var_4_7(arg_5_0, arg_5_1)
		local var_5_0 = CSV.ReadRow(var_4_3, arg_5_0)
		local var_5_1 = CSV.ReadRow(var_4_3, 0)
		local var_5_2 = var_0_0 .. "." .. arg_5_0
		local var_5_3 = Engine.CAADCDEEIA()
		local var_5_4 = Engine.EAIICIFIFA()
		local var_5_5 = var_5_0.select

		if var_5_3 then
			var_5_5 = var_5_0.selectSP
		elseif var_5_4 then
			var_5_5 = var_5_0.selectCP
		end

		local var_5_6 = var_5_0.leftStick
		local var_5_7 = var_5_0.rightStick

		if var_4_1 then
			var_5_6 = var_5_0.rightStick
			var_5_7 = var_5_0.leftStick
		end

		local var_5_8 = var_0_4(var_5_0, var_4_6)
		local var_5_9 = var_0_1
		local var_5_10 = var_0_2

		local function var_5_11(arg_6_0)
			return function()
				local var_7_0 = LUI.FlowManager.GetVisibleMenu()

				if var_7_0 and (var_7_0.id == "ButtonLayout" or var_7_0.id == "BRButtonLayout") then
					return nil
				end

				local var_7_1 = var_5_3 and arg_6_0 .. "SP" or arg_6_0
				local var_7_2 = var_0_4(var_5_0, var_4_6)

				if var_5_1[var_7_1] == var_7_2[arg_6_0] then
					return var_5_9
				else
					return var_5_10
				end
			end
		end

		local var_5_12 = LUI.DataSourceInControllerModel.new(var_5_2 .. ".leftTrigger", Engine.CBBHFCGDIC(var_5_8.leftTrigger))
		local var_5_13 = LUI.DataSourceInControllerModel.new(var_5_2 .. ".leftShoulder", Engine.CBBHFCGDIC(var_5_8.leftShoulder))
		local var_5_14 = LUI.DataSourceInControllerModel.new(var_5_2 .. ".rightTrigger", Engine.CBBHFCGDIC(var_5_8.rightTrigger))
		local var_5_15 = LUI.DataSourceInControllerModel.new(var_5_2 .. ".rightShoulder", Engine.CBBHFCGDIC(var_5_8.rightShoulder))

		return {
			ref = LUI.DataSourceInControllerModel.new(var_5_2 .. ".ref", var_5_8.cfg),
			name = LUI.DataSourceInControllerModel.new(var_5_2 .. ".name", Engine.CBBHFCGDIC(var_5_8.layoutName)),
			leftStick = LUI.DataSourceInControllerModel.new(var_5_2 .. ".leftStick", Engine.CBBHFCGDIC(var_5_6)),
			leftStickColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".leftStickColor", var_5_1.leftStick == var_5_0.leftStick and var_5_9 or var_5_10),
			rightStick = LUI.DataSourceInControllerModel.new(var_5_2 .. ".rightStick", Engine.CBBHFCGDIC(var_5_7)),
			rightStickColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".rightStickColor", var_5_1.rightStick == var_5_0.rightStick and var_5_9 or var_5_10),
			leftTrigger = var_5_12,
			leftTriggerColor = var_5_12:Filter("leftTriggerColor", var_5_11("leftTrigger")),
			rightTrigger = var_5_14,
			rightTriggerColor = var_5_14:Filter("rightTriggerColor", var_5_11("rightTrigger")),
			leftShoulder = var_5_13,
			leftShoulderColor = var_5_13:Filter("leftShoulderColor", var_5_11("leftShoulder")),
			rightShoulder = var_5_15,
			rightShoulderColor = var_5_15:Filter("rightShoulderColor", var_5_11("rightShoulder")),
			primary = LUI.DataSourceInControllerModel.new(var_5_2 .. ".primary", Engine.CBBHFCGDIC(var_5_0.primary)),
			primaryColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".primaryColor", var_5_1.primary == var_5_0.primary and var_5_9 or var_5_10),
			secondary = LUI.DataSourceInControllerModel.new(var_5_2 .. ".secondary", Engine.CBBHFCGDIC(var_5_0.secondary)),
			secondaryColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".secondaryColor", var_5_1.secondary == var_5_0.secondary and var_5_9 or var_5_10),
			altOne = LUI.DataSourceInControllerModel.new(var_5_2 .. ".altOne", Engine.CBBHFCGDIC(var_5_0.altOne)),
			altOneColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".altOneColor", var_5_1.altOne == var_5_0.altOne and var_5_9 or var_5_10),
			altTwo = LUI.DataSourceInControllerModel.new(var_5_2 .. ".altTwo", Engine.CBBHFCGDIC(var_5_0.altTwo)),
			altTwoColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".altTwoColor", var_5_1.altTwo == var_5_0.altTwo and var_5_9 or var_5_10),
			dPad = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPad", Engine.CBBHFCGDIC(var_5_0.dPad)),
			dPadColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadColor", var_5_1.dPad == var_5_0.dPad and var_5_9 or var_5_10),
			dPadUp = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadUp", Engine.CBBHFCGDIC(var_5_0.dPadUp)),
			dPadUpColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadUpColor", var_5_1.dPadUp == var_5_0.dPadUp and var_5_9 or var_5_10),
			dPadRight = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadRight", Engine.CBBHFCGDIC(var_5_0.dPadRight)),
			dPadRightColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadRightColor", var_5_1.dPadRight == var_5_0.dPadRight and var_5_9 or var_5_10),
			dPadDown = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadDown", Engine.CBBHFCGDIC(var_5_0.dPadDown)),
			dPadDownColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadDownColor", var_5_1.dPadDown == var_5_0.dPadDown and var_5_9 or var_5_10),
			dPadLeft = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadLeft", Engine.CBBHFCGDIC(var_5_0.dPadLeft)),
			dPadLeftColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".dPadLeftColor", var_5_1.dPadLeft == var_5_0.dPadLeft and var_5_9 or var_5_10),
			start = LUI.DataSourceInControllerModel.new(var_5_2 .. ".start", var_5_4 and Engine.CBBHFCGDIC(var_5_0.startCP) or Engine.CBBHFCGDIC(var_5_0.start)),
			startColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".startColor", var_5_1.start == var_5_0.start and var_5_9 or var_5_10),
			select = LUI.DataSourceInControllerModel.new(var_5_2 .. ".select", Engine.CBBHFCGDIC(var_5_5)),
			selectColor = LUI.DataSourceInControllerModel.new(var_5_2 .. ".selectColor", var_5_1.select == var_5_0.select and var_5_9 or var_5_10)
		}
	end

	local function var_4_8(arg_8_0, arg_8_1)
		local var_8_0 = var_0_3[arg_8_0]

		arg_4_0:SetDataSource(var_8_0, arg_8_1)

		local var_8_1 = var_8_0.ref:GetValue(arg_8_1)

		Engine.CBCIHEGADA(var_8_1, arg_8_1, arg_4_0.isBR)
	end

	local function var_4_9(arg_9_0, arg_9_1)
		local var_9_0 = var_0_3[arg_9_0]

		arg_4_0:SetDataSource(var_9_0, arg_9_1)
	end

	local var_4_10
	local var_4_11 = #var_4_5() - 1

	for iter_4_0 = 0, var_4_11 do
		local var_4_12 = var_4_7(iter_4_0, arg_4_1)

		table.insert(var_0_3, var_4_12)
	end

	if string.match(var_4_2, "_alt$") then
		var_4_2 = string.gsub(var_4_2, "_alt", "")
	end

	local var_4_13 = var_4_4[var_4_2]

	if var_4_13 ~= nil and var_4_13 ~= "" then
		local var_4_14 = var_0_5(var_4_5(), Engine.CBBHFCGDIC(var_4_13))

		arg_4_0:SetDataSource(var_0_3[var_4_14], arg_4_1)
	end

	arg_4_0:SetAlpha(0)
	arg_4_0:registerEventHandler("buttonLayout_over", function(arg_10_0, arg_10_1)
		arg_4_0:SetAlpha(1)
	end)
	arg_4_0:registerEventHandler("buttonLayout_up", function(arg_11_0, arg_11_1)
		arg_4_0:SetAlpha(0)
	end)
	arg_4_0:registerEventHandler("buttonLayout_updated", function(arg_12_0, arg_12_1)
		var_4_8(arg_12_1.index, arg_12_1.controller)
	end)
	arg_4_0:registerEventHandler("buttonLayout_updatedVisual", function(arg_13_0, arg_13_1)
		var_4_9(arg_13_1.index, arg_13_1.controller)
	end)
	arg_4_0:registerEventHandler("buttonLayout_triggerUpdate", function(arg_14_0, arg_14_1)
		if var_4_6 then
			var_4_6 = false
		else
			var_4_6 = true
		end

		if arg_14_1.resetFlip then
			var_4_6 = false
		end

		var_0_6(arg_4_0, arg_4_1, var_4_6)
	end)
end
