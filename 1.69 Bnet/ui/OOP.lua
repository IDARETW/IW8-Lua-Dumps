function LUI.Class(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = {
		__index = arg_1_0
	}

	var_1_0.super = arg_1_0

	if not arg_1_0 or not arg_1_0.allocate then
		function var_1_0.allocate()
			return {}
		end
	end

	function var_1_0.new(...)
		local var_3_0 = var_1_0.allocate()
		local var_3_1 = getmetatable(var_3_0)

		if not var_3_1 then
			var_3_1 = {}

			setmetatable(var_3_0, var_3_1)
		end

		if type(var_3_0) == "userdata" then
			local var_3_2 = {}

			var_3_1.__index = var_3_2

			local var_3_3 = {
				__index = var_1_0
			}

			setmetatable(var_3_2, var_3_3)

			var_3_1.__newindex = var_3_2
		else
			var_3_1.__index = var_1_0
		end

		var_3_0:init(...)

		return var_3_0
	end

	setmetatable(var_1_0, var_1_1)

	return var_1_0
end
