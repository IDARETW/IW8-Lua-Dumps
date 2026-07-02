Cac = {}

local var_0_0 = 200

function Cac.ValidateAllPlayersPublicSquadMembers()
	return
end

function Cac.GetUnlockText(arg_2_0, arg_2_1)
	if arg_2_0.cols.ui_text == nil or arg_2_0.cols.ui_text_var1 == nil or arg_2_0.cols.ui_text_var2 == nil or arg_2_0.file == nil or arg_2_0.cols.ref == nil then
		DebugPrint("WARNING: Attempting to get unlock text with an invalid unlockTable or ref.")

		return ""
	end

	local var_2_0 = arg_2_0.file

	if CONDITIONS.IsDraftEnabled() and arg_2_0.esportsRef and not Unlocks.BFCEGDJIEI(Engine.IJEBHJIJF(), arg_2_0.esportsRef, arg_2_1, true) then
		return Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/NOT_AVAILABLE_IN_CWL")
	end

	local var_2_1 = StringTable.DIFCHIGDFB(var_2_0, arg_2_0.cols.ref, arg_2_1, arg_2_0.cols.ui_text)
	local var_2_2 = StringTable.DIFCHIGDFB(var_2_0, arg_2_0.cols.ref, arg_2_1, arg_2_0.cols.ui_text_var1)
	local var_2_3 = StringTable.DIFCHIGDFB(var_2_0, arg_2_0.cols.ref, arg_2_1, arg_2_0.cols.ui_text_var2)

	if var_2_1 ~= "" then
		return Engine.CBBHFCGDIC(var_2_1, var_2_2, var_2_3)
	else
		return ""
	end
end

function ComputeMatchRulesDefaultClassesSlot(arg_3_0, arg_3_1)
	if arg_3_0 == "axis" then
		return arg_3_1 + 6
	end

	return arg_3_1
end

function ComputeScoreboardSlot(arg_4_0, arg_4_1)
	if arg_4_0 == "none" then
		return 0 * var_0_0 + arg_4_1
	end

	if arg_4_0 == "neutral" then
		return 1 * var_0_0 + arg_4_1
	end

	if arg_4_0 == "allies" then
		return 2 * var_0_0 + arg_4_1
	end

	if arg_4_0 == "axis" then
		return 3 * var_0_0 + arg_4_1
	end

	if arg_4_0 == "multiteam" then
		return 4 * var_0_0 + arg_4_1
	end

	return 0
end

function Cac.GetCosmeticAttachmentName(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, arg_5_0, CSV.cosmeticAttachmentTable.cols.name)
end

function Cac.GetCosmeticAttachmentUnlockType(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, arg_6_0, CSV.cosmeticAttachmentTable.cols.unlockType)
end

function Cac.GetCosmeticAttachmentIcon(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, arg_7_0, CSV.cosmeticAttachmentTable.cols.icon)
end

function Cac.GetCosmeticAttachmentCategory(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, arg_8_0, CSV.cosmeticAttachmentTable.cols.category)
end
