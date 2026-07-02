local var_0_0
local var_0_1 = "ColdWar"

THEMES.RANDOMIZE_MASK_ROTATION = {
	{
		yRot = 0,
		zRot = 0,
		xRot = 0
	},
	{
		yRot = 0,
		zRot = 0,
		xRot = 180
	},
	{
		yRot = 180,
		zRot = 0,
		xRot = 0
	},
	{
		yRot = 0,
		zRot = 180,
		xRot = 0
	}
}
THEMES.VANGUARD_MASK_SEED = #THEMES.RANDOMIZE_MASK_ROTATION

local function var_0_2(arg_1_0)
	local var_1_0 = Dvar.IBEGCHEFE("MLQNQTRRTK")
	local var_1_1 = arg_1_0.isMainMenu or false
	local var_1_2 = Engine.HEEFCICJE() and not var_1_1

	return var_1_0 and var_1_2
end

local function var_0_3(arg_2_0, arg_2_1)
	if var_0_2(arg_2_1) then
		arg_2_0 = var_0_1
	else
		arg_2_0 = nil
	end

	return arg_2_0
end

local function var_0_4(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1 == nil and var_0_0 ~= nil

	if not var_3_0 and arg_3_1 ~= var_0_0 and THEMES[arg_3_1] then
		var_0_0 = arg_3_1

		THEMES.ApplyTheme(THEMES[arg_3_1], false)
	elseif var_3_0 then
		THEMES.ResetTheme()

		var_0_0 = nil
	end
end

function THEMES.ApplyRandomMaskRotation(arg_4_0, arg_4_1)
	if CONDITIONS.IsVanguardRevealed() or arg_4_1 and arg_4_1.forceApplication then
		local var_4_0 = arg_4_1 and arg_4_1.elementToMask and arg_4_1.elementToMask or arg_4_0
		local var_4_1 = arg_4_1 and arg_4_1.masker and arg_4_1.masker or arg_4_0.Mask

		assert(var_4_1, "A masking element must be specified in the options table or the widget speficed in the element params must have a Mask layer defined in the UI Editor.")

		if CONDITIONS.IsWZWipDvarEnabled() then
			local var_4_2 = THEMES.RANDOMIZE_MASK_ROTATION

			if arg_4_1 and arg_4_1.states and type(arg_4_1.states) ~= "table" then
				assert(false, "If you specify the states option value, it must be of type 'table.'")

				var_4_2 = option.states
			end

			local var_4_3 = arg_4_1 and arg_4_1.randomseed or #var_4_2
			local var_4_4 = math.random(1, var_4_3)

			if not arg_4_1 or not arg_4_1.byPassSetMask then
				var_4_0:SetMask(var_4_1)
			end

			local var_4_5 = var_4_2[var_4_4]

			var_4_1:SetXRotation(var_4_5.xRot, 0)
			var_4_1:SetYRotation(var_4_5.yRot, 0)
			var_4_1:SetZRotation(var_4_5.zRot, 0)
		else
			var_4_1:closeTree()
		end
	end
end

function THEMES.UpdateTheme(arg_5_0)
	local var_5_0
	local var_5_1 = false
	local var_5_2 = false

	arg_5_0 = arg_5_0 or {}

	if Dvar.IBEGCHEFE("ui_theme_debugoverride") then
		THEMES.ApplyDebugTheme()

		return
	end

	local var_5_3 = Dvar.DHEEJCCJBH("ui_theme") or nil
	local var_5_4 = var_5_3 ~= nil

	if not var_5_4 then
		var_5_3 = var_0_3(var_5_3, arg_5_0)
	end

	var_0_4(var_5_4, var_5_3)

	if Dvar.IBEGCHEFE("NQROMTQPMT") then
		COLOR_BLIND.UpdateSwatches()
	end
end

function THEMES.ResetTheme()
	THEMES.ApplyTheme(THEMES.resetValues)

	THEMES.resetValues = {}
end

function THEMES.ApplyTheme(arg_7_0, arg_7_1)
	if not arg_7_0 or type(arg_7_0) ~= "table" then
		return
	end

	THEMES.resetValues = THEMES.resetValues or {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0) do
		THEMES.resetValues[iter_7_0] = THEMES.resetValues[iter_7_0] or {}

		for iter_7_2, iter_7_3 in pairs(iter_7_1) do
			if not arg_7_1 and THEMES.resetValues[iter_7_0][iter_7_2] then
				SWATCHES[iter_7_0][iter_7_2] = THEMES.resetValues[iter_7_0][iter_7_2]
				THEMES.resetValues[iter_7_0][iter_7_2] = nil
			elseif not THEMES.resetValues[iter_7_0][iter_7_2] then
				THEMES.resetValues[iter_7_0][iter_7_2] = SWATCHES[iter_7_0][iter_7_2]
			end

			SWATCHES[iter_7_0][iter_7_2] = iter_7_3
		end
	end
end

function THEMES.ApplyDebugTheme()
	for iter_8_0, iter_8_1 in pairs(SWATCHES) do
		for iter_8_2, iter_8_3 in pairs(iter_8_1) do
			SWATCHES[iter_8_0][iter_8_2] = COLORS.coralPink
		end
	end
end

function THEMES.GetCurrentTheme()
	return var_0_0
end
