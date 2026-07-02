WZWIP = WZWIP or {}
WZWIP.Prefix = "WZWip"

function WZWIP.CheckForApplyPrependWZWipPrefix(arg_1_0, arg_1_1)
	if CONDITIONS.IsMagmaGameMode() or arg_1_1 then
		arg_1_0 = WZWIP.Prefix .. arg_1_0
	end

	return arg_1_0
end

function WZWIP.AnimateThemeElement(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = CONDITIONS.IsWZWipDvarEnabled()

	if arg_2_2 and arg_2_2.doSnapToState then
		arg_2_1 = arg_2_1 .. "Snap"
	end

	if arg_2_2 and arg_2_2.conditionOverride then
		var_2_0 = arg_2_2.conditionOverride
	end

	if arg_2_2 then
		if arg_2_2.resizeSmallIfLanguage then
			assert(type(arg_2_2.resizeSmallIfLanguage) == "table" or type(arg_2_2.resizeSmallIfLanguage) == "function", "This option must be a table of functions or single function defined in Languages.lua.")

			local var_2_1 = type(arg_2_2.resizeSmallIfLanguage) == "table" and arg_2_2.resizeSmallIfLanguage or {
				arg_2_2.resizeSmallIfLanguage
			}

			for iter_2_0, iter_2_1 in ipairs(var_2_1) do
				if iter_2_1() then
					arg_2_1 = arg_2_1 .. "Small"

					break
				end
			end
		end

		if arg_2_2.forceSmall then
			arg_2_1 = arg_2_1 .. "Small"
		end
	end

	arg_2_1 = WZWIP.CheckForApplyPrependWZWipPrefix(arg_2_1, var_2_0)

	if arg_2_0._sequences and arg_2_0._sequences[arg_2_1] then
		ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
	end
end
