module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = (1 - arg_1_0) / 2
	local var_1_1 = LUI.UIElement.new()

	var_1_1:SetAnchors(var_1_0, var_1_0, var_1_0, var_1_0)

	local var_1_2 = 0.6
	local var_1_3 = 1
	local var_1_4 = 4
	local var_1_5 = {}

	for iter_1_0 = 1, var_1_4 do
		local var_1_6 = LUI.UILine.new()

		var_1_6:SetThickness(2 * _1080p)
		var_1_6:SetAlpha(var_1_2)
		var_1_1:addElement(var_1_6)

		local var_1_7 = 2 * math.pi / var_1_4 * (iter_1_0 - 1)
		local var_1_8 = 0.5 * (1 + math.cos(var_1_7))
		local var_1_9 = 0.5 * (1 + math.sin(var_1_7))

		var_1_6:SetVertexPosition(0, var_1_8, var_1_9, 0, 0)

		local var_1_10 = 2 * math.pi / var_1_4 * iter_1_0
		local var_1_11 = 0.5 * (1 + math.cos(var_1_10))
		local var_1_12 = 0.5 * (1 + math.sin(var_1_10))

		var_1_6:SetVertexPosition(1, var_1_11, var_1_12, 0, 0)
		table.insert(var_1_5, var_1_6)
	end

	local var_1_13
	local var_1_14 = 1

	local function var_1_15()
		var_1_14 = var_1_14 + arg_1_1

		if var_1_14 > #var_1_5 then
			var_1_14 = 1
		end

		if var_1_14 == 0 then
			var_1_14 = #var_1_5
		end

		local var_2_0 = var_1_14 + arg_1_1

		if var_2_0 > #var_1_5 then
			var_2_0 = 1
		end

		if var_2_0 == 0 then
			var_2_0 = #var_1_5
		end

		local var_2_1 = 0
		local var_2_2 = 1

		if arg_1_1 < 0 then
			var_2_1, var_2_2 = 1, 0
		end

		var_1_5[var_1_14]:SetVertexPadding(var_2_1, 0)
		var_1_5[var_1_14]:SetVertexPadding(var_2_2, 1)
		var_1_5[var_1_14]:SetVertexPadding(var_2_2, 0, 350, LUI.EASING.linear)
		var_1_5[var_1_14]:SetAlpha(var_1_3)
		var_1_5[var_1_14]:SetAlpha(var_1_2, 350 * (var_1_4 - 1), LUI.EASING.inOutQuadratic)
		var_1_5[var_2_0]:SetVertexPadding(var_2_1, 0)
		var_1_5[var_2_0]:SetVertexPadding(var_2_1, 1, 350, LUI.EASING.linear)

		var_1_1:Wait(350).onComplete = var_1_15
	end

	var_1_15()

	var_1_1:Wait(400 + 200 * arg_1_1).onComplete = function()
		local var_3_0
		local var_3_1 = 0

		local function var_3_2()
			var_3_1 = var_3_1 - arg_1_1 * 360 * (var_1_4 - 1) / var_1_4

			var_1_1:SetZRotation(var_3_1, 1000, LUI.EASING.outCubic)

			var_1_1:Wait(1400).onComplete = var_3_2
		end

		var_3_2()
	end

	return var_1_1
end

local function var_0_1()
	return MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = 0
	})
end

MenuBuilder.registerType("Spinner", var_0_1)
LockTable(_M)
