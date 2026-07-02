module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.PS4Layout == nil then
		local var_1_0 = MenuBuilder.BuildRegisteredType("PS4StickLayout", {
			controllerIndex = arg_1_1
		})

		var_1_0.id = "PS4Layout"

		var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
		arg_1_0:addElement(var_1_0)

		arg_1_0.PS4Layout = var_1_0
	end

	arg_1_0.controlLayout = arg_1_0.PS4Layout
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.XB3Layout == nil then
		local var_2_0 = MenuBuilder.BuildRegisteredType("XB3StickLayout", {
			controllerIndex = arg_2_1
		})

		var_2_0.id = "XB3Layout"

		var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
		arg_2_0:addElement(var_2_0)

		arg_2_0.XB3Layout = var_2_0
	end

	arg_2_0.controlLayout = arg_2_0.XB3Layout
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0.PS4VitaLayout == nil then
		local var_3_0 = MenuBuilder.BuildRegisteredType("PS4VitaStickLayout", {
			controllerIndex = arg_3_1
		})

		var_3_0.id = "PS4VitaLayout"

		var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 118, _1080p * 630)
		arg_3_0:addElement(var_3_0)

		arg_3_0.PS4VitaLayout = var_3_0
	end

	arg_3_0.controlLayout = arg_3_0.PS4VitaLayout
end

local function var_0_3()
	WipeGlobalModelsAtPath(menuModelPath)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.CreatePS4Layout = var_0_0
	arg_5_0.CreateXB3Layout = var_0_1
	arg_5_0.CreateVitaLayout = var_0_2

	LUI.AddStickLayoutLogic(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:registerAndCallEventHandler("input_connection", function(arg_6_0, arg_6_1)
		if Engine.CIEGIACHAE() then
			if Engine.BIAEDEEBJI(arg_5_1) then
				if arg_6_0.PS4Layout then
					arg_6_0:RemoveElement(arg_6_0.PS4Layout)
					arg_6_0.PS4Layout:closeTree()

					arg_6_0.PS4Layout = nil
				end

				arg_6_0:CreateVitaLayout(arg_6_1.controllerIndex)
			else
				if arg_6_0.PS4VitaLayout then
					arg_6_0:RemoveElement(arg_6_0.PS4VitaLayout)
					arg_6_0.PS4VitaLayout:closeTree()

					arg_6_0.PS4VitaLayout = nil
				end

				arg_6_0:CreatePS4Layout(arg_6_1.controllerIndex)
			end
		elseif Engine.BAHIIBFDDG() then
			assert(arg_6_0.XB3Layout)

			arg_6_0.controlLayout = arg_6_0.XB3Layout
		elseif not Engine.HDGDBCJFG() then
			if Engine.GGFCHCDDE(arg_5_1) then
				if arg_6_0.XB3Layout then
					arg_6_0:RemoveElement(arg_6_0.XB3Layout)
					arg_6_0.XB3Layout:closeTree()

					arg_6_0.XB3Layout = nil
				end

				arg_6_0:CreatePS4Layout(arg_6_1.controllerIndex)
			else
				if arg_6_0.PS4Layout then
					arg_6_0:RemoveElement(arg_6_0.PS4Layout)
					arg_6_0.PS4Layout:closeTree()

					arg_6_0.PS4Layout = nil
				end

				arg_6_0:CreateXB3Layout(arg_6_1.controllerIndex)
			end
		end

		if arg_6_0.controlLayout then
			arg_6_0.controlLayout:SetDataSourceThroughElement(arg_6_0, nil)
		end
	end, {
		name = "input_connection",
		controllerIndex = arg_5_1
	})
end

function StickLayoutBootOptions(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_7_0.id = "StickLayoutBootOptions"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3

	if Engine.CIEGIACHAE() then
		local var_7_4 = MenuBuilder.BuildRegisteredType("PS4VitaStickLayout", {
			controllerIndex = var_7_1
		})

		var_7_4.id = "PS4VitaLayout"

		var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 118, _1080p * 630)
		var_7_0:addElement(var_7_4)

		var_7_0.PS4VitaLayout = var_7_4
	end

	local var_7_5

	if CONDITIONS.IsPCOrPS4(var_7_0) then
		local var_7_6 = MenuBuilder.BuildRegisteredType("PS4StickLayout", {
			controllerIndex = var_7_1
		})

		var_7_6.id = "PS4Layout"

		var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
		var_7_0:addElement(var_7_6)

		var_7_0.PS4Layout = var_7_6
	end

	local var_7_7

	if CONDITIONS.IsPCOrXB3(var_7_0) then
		local var_7_8 = MenuBuilder.BuildRegisteredType("XB3StickLayout", {
			controllerIndex = var_7_1
		})

		var_7_8.id = "XB3Layout"

		var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
		var_7_0:addElement(var_7_8)

		var_7_0.XB3Layout = var_7_8
	end

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("StickLayoutBootOptions", StickLayoutBootOptions)
LUI.FlowManager.RegisterStackPopBehaviour("StickLayoutBootOptions", var_0_3)
LockTable(_M)
