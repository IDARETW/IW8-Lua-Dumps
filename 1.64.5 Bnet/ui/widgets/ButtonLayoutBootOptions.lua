module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.PS4Layout == nil then
		local var_1_0 = MenuBuilder.BuildRegisteredType("PS4Layout", {
			controllerIndex = arg_1_1
		})

		var_1_0.id = "PS4Layout"

		var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * -25, _1080p * 487)
		arg_1_0:addElement(var_1_0)

		arg_1_0.PS4Layout = var_1_0
	end

	arg_1_0.controlLayout = arg_1_0.PS4Layout
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.XB3Layout == nil then
		local var_2_0 = MenuBuilder.BuildRegisteredType("XB3Layout", {
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
		local var_3_0 = MenuBuilder.BuildRegisteredType("PS4VitaLayout", {
			controllerIndex = arg_3_1
		})

		var_3_0.id = "PS4VitaLayout"

		if Engine.CIEGIACHAE() then
			var_3_0.ControllerImage:SetLeft(0, 0)
			var_3_0.ControllerImage:SetRight(_1080p * 512, 0)
			var_3_0.ControllerImage:SetTop(_1080p * 1, 0)
			var_3_0.ControllerImage:SetBottom(_1080p * 513, 0)
		end

		var_3_0.Primary:SetLeft(_1080p * 538, 0)
		var_3_0.Primary:SetRight(_1080p * 742, 0)
		var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 25, _1080p * 537)
		arg_3_0:addElement(var_3_0)

		arg_3_0.PS4VitaLayout = var_3_0
	end

	arg_3_0.controlLayout = arg_3_0.PS4VitaLayout
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.CreatePS4Layout = var_0_0
	arg_4_0.CreateXB3Layout = var_0_1
	arg_4_0.CreateVitaLayout = var_0_2

	LUI.AddButtonLayoutLogic(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:registerAndCallEventHandler("input_connection", function(arg_5_0, arg_5_1)
		if Engine.CIEGIACHAE() then
			if Engine.BIAEDEEBJI(arg_4_1) then
				if arg_5_0.PS4Layout then
					arg_5_0:RemoveElement(arg_5_0.PS4Layout)
					arg_5_0.PS4Layout:closeTree()

					arg_5_0.PS4Layout = nil
				end

				arg_5_0:CreateVitaLayout(arg_5_1.controllerIndex)
			else
				if arg_5_0.PS4VitaLayout then
					arg_5_0:RemoveElement(arg_5_0.PS4VitaLayout)
					arg_5_0.PS4VitaLayout:closeTree()

					arg_5_0.PS4VitaLayout = nil
				end

				arg_5_0:CreatePS4Layout(arg_5_1.controllerIndex)
			end
		elseif Engine.BAHIIBFDDG() then
			assert(arg_5_0.XB3Layout)

			arg_5_0.controlLayout = arg_5_0.XB3Layout
		elseif not Engine.HDGDBCJFG() then
			if Engine.GGFCHCDDE(arg_5_1.controllerIndex) then
				if arg_5_0.XB3Layout then
					arg_5_0:RemoveElement(arg_5_0.XB3Layout)
					arg_5_0.XB3Layout:closeTree()

					arg_5_0.XB3Layout = nil
				end

				arg_5_0:CreatePS4Layout(arg_5_1.controllerIndex)
			else
				if arg_5_0.PS4Layout then
					arg_5_0:RemoveElement(arg_5_0.PS4Layout)
					arg_5_0.PS4Layout:closeTree()

					arg_5_0.PS4Layout = nil
				end

				arg_5_0:CreateXB3Layout(arg_5_1.controllerIndex)
			end
		end

		if arg_5_0.controlLayout then
			arg_5_0.controlLayout:SetDataSourceThroughElement(arg_5_0, nil)
		end
	end, {
		name = "input_connection",
		controllerIndex = arg_4_1
	})
end

function ButtonLayoutBootOptions(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_6_0.id = "ButtonLayoutBootOptions"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3

	if Engine.CIEGIACHAE() then
		local var_6_4 = MenuBuilder.BuildRegisteredType("PS4VitaLayout", {
			controllerIndex = var_6_1
		})

		var_6_4.id = "PS4VitaLayout"

		if Engine.CIEGIACHAE() then
			var_6_4.ControllerImage:SetLeft(0, 0)
		end

		if Engine.CIEGIACHAE() then
			var_6_4.ControllerImage:SetRight(_1080p * 512, 0)
		end

		if Engine.CIEGIACHAE() then
			var_6_4.ControllerImage:SetTop(_1080p * 1, 0)
		end

		if Engine.CIEGIACHAE() then
			var_6_4.ControllerImage:SetBottom(_1080p * 513, 0)
		end

		var_6_4.Primary:SetLeft(_1080p * 538, 0)
		var_6_4.Primary:SetRight(_1080p * 742, 0)
		var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 25, _1080p * 537)
		var_6_0:addElement(var_6_4)

		var_6_0.PS4VitaLayout = var_6_4
	end

	local var_6_5

	if CONDITIONS.IsPCOrPS4(var_6_0) then
		local var_6_6 = MenuBuilder.BuildRegisteredType("PS4Layout", {
			controllerIndex = var_6_1
		})

		var_6_6.id = "PS4Layout"

		var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * -25, _1080p * 487)
		var_6_0:addElement(var_6_6)

		var_6_0.PS4Layout = var_6_6
	end

	local var_6_7

	if CONDITIONS.IsPCOrXB3(var_6_0) then
		local var_6_8 = MenuBuilder.BuildRegisteredType("XB3Layout", {
			controllerIndex = var_6_1
		})

		var_6_8.id = "XB3Layout"

		var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
		var_6_0:addElement(var_6_8)

		var_6_0.XB3Layout = var_6_8
	end

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ButtonLayoutBootOptions", ButtonLayoutBootOptions)
LockTable(_M)
