THEMES = {}
THEMES.themeTest = {}
THEMES.themeTest.text = {
	primaryText = COLORS.coralPink,
	secondaryText = COLORS.coralPink,
	buildNumber = COLORS.coralPink,
	dedicatedServer = COLORS.coralPink,
	overText = COLORS.coralPink,
	offwhite = COLORS.coralPink
}

function THEMES.ResetTheme()
	THEMES.ApplyTheme(THEMES.resetValues)

	THEMES.resetValues = {}
end

function THEMES.ApplyTheme(arg_2_0)
	if not arg_2_0 or type(arg_2_0) ~= "table" then
		return
	end

	THEMES.resetValues = THEMES.resetValues or {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0) do
		THEMES.resetValues[iter_2_0] = THEMES.resetValues[iter_2_0] or {}

		for iter_2_2, iter_2_3 in pairs(iter_2_1) do
			if not THEMES.resetValues[iter_2_0][iter_2_2] then
				THEMES.resetValues[iter_2_0][iter_2_2] = SWATCHES[iter_2_0][iter_2_2]
			end

			SWATCHES[iter_2_0][iter_2_2] = iter_2_3
		end
	end
end

function THEMES.ApplyDebugTheme()
	for iter_3_0, iter_3_1 in pairs(SWATCHES) do
		for iter_3_2, iter_3_3 in pairs(iter_3_1) do
			SWATCHES[iter_3_0][iter_3_2] = COLORS.coralPink
		end
	end
end
