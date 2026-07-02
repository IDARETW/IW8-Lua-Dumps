CLIENT_MODEL = CLIENT_MODEL or {}

local var_0_0 = "military_carepackage_01"
local var_0_1 = "military_frontend_gunrange_01_paper_1"
local var_0_2 = "military_frontend_gunrange_01_paper_2"
local var_0_3 = "military_frontend_gunrange_01_paper_3"

CLIENT_MODEL.quartermasterModels = {
	CRATE = {
		name = "quartermaster_crate_1"
	},
	TARGET1 = {
		name = "quartermaster_target_1"
	},
	TARGET2 = {
		name = "quartermaster_target_2"
	},
	TARGET3 = {
		name = "quartermaster_target_3"
	}
}
CLIENT_MODEL.defaultPatchTags = {
	PATCH_TAG_2 = 1,
	PATCH_TAG_1 = 0
}

local var_0_4 = "accessory_ui_perk_pouch_01_rig"
local var_0_5 = "accessory_ui_perk_pouch_02_rig"
local var_0_6 = "accessory_ui_perk_pouch_03_rig"
local var_0_7 = "accessory_ui_perk_patch_01"
local var_0_8 = "accessory_ui_perk_patch_01_hunter"
local var_0_9 = "accessory_ui_perk_patch_01_battle_hardened"

CLIENT_MODEL.coreMPModels = {
	LETHAL = {
		name = "loadout_lethal"
	},
	TACTICAL = {
		name = "loadout_tactical"
	},
	PERK = {
		name = "loadout_perk_1"
	},
	PERK_ACTIVE = {
		name = "loadout_perk_2"
	},
	PERK_PASSIVE = {
		name = "loadout_perk_3"
	},
	PERK_PATCH = {
		name = "loadout_perk_patch_1",
		patchTag = CLIENT_MODEL.defaultPatchTags.PATCH_TAG_1
	},
	PERK_ACTIVE_PATCH = {
		name = "loadout_perk_patch_2",
		patchTag = CLIENT_MODEL.defaultPatchTags.PATCH_TAG_1
	},
	PERK_PASSIVE_PATCH = {
		name = "loadout_perk_patch_3",
		patchTag = CLIENT_MODEL.defaultPatchTags.PATCH_TAG_1
	},
	PERK_PATCH_SPECIALIST = {
		name = "loadout_specialist_patch_1"
	},
	PERK_ACTIVE_PATCH_SPECIALIST = {
		name = "loadout_specialist_patch_2"
	},
	PERK_PASSIVE_PATCH_SPECIALIST = {
		name = "loadout_specialist_patch_3"
	}
}

function CLIENT_MODEL.InitQuartermasterClientModels()
	CLIENT_MODEL.SetModel(CLIENT_MODEL.quartermasterModels.CRATE, var_0_0)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.quartermasterModels.TARGET1, var_0_1)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.quartermasterModels.TARGET2, var_0_2)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.quartermasterModels.TARGET3, var_0_3)
end

local function var_0_10(arg_2_0)
	assert(arg_2_0)
	assert(arg_2_0.name)

	if not arg_2_0.index then
		arg_2_0.index = ClientModel.GIDCAADHB(arg_2_0.name)
	end

	return arg_2_0.index
end

function CLIENT_MODEL.UpdateModifiablesByMode()
	if Engine.EAAHGICFBD() then
		CLIENT_MODEL.SetModelsModifiable(CLIENT_MODEL.coreMPModels, true)
	end
end

function CLIENT_MODEL.SetModelsModifiable(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in pairs(arg_4_0) do
		local var_4_0 = var_0_10(iter_4_1)

		if var_4_0 then
			ClientModel.CBCGDIGGHB(var_4_0, arg_4_1)
		end
	end
end

function CLIENT_MODEL.SetAllModelsModifiable(arg_5_0)
	local var_5_0 = {
		CLIENT_MODEL.coreMPModels.LETHAL,
		CLIENT_MODEL.coreMPModels.TACTICAL,
		CLIENT_MODEL.coreMPModels.PERK,
		CLIENT_MODEL.coreMPModels.PERK_ACTIVE,
		CLIENT_MODEL.coreMPModels.PERK_PASSIVE,
		CLIENT_MODEL.coreMPModels.PERK_PATCH,
		CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH,
		CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH
	}

	if PROGRESSION.IsSpecialistPerkUnlocked(arg_5_0) then
		table.insert(var_5_0, CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST)
		table.insert(var_5_0, CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST)
		table.insert(var_5_0, CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST)
	end

	CLIENT_MODEL.SetRequiredModifiables(var_5_0)
end

function CLIENT_MODEL.SetModel(arg_6_0, arg_6_1)
	if arg_6_1 and #arg_6_1 > 0 then
		local var_6_0 = var_0_10(arg_6_0)

		if var_6_0 then
			ClientModel.JBAEHFHCA(var_6_0, arg_6_1)
		end
	end
end

function CLIENT_MODEL.SetModelPatchOrigin(arg_7_0, arg_7_1)
	local var_7_0 = var_0_10(arg_7_0)
	local var_7_1 = var_0_10(arg_7_1)
	local var_7_2 = arg_7_1.patchTag

	if var_7_1 and var_7_0 then
		ClientModel.DEEGIBCDJG(var_7_0, var_7_1, var_7_2)
	end
end

function CLIENT_MODEL.SetAnimation(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = var_0_10(arg_8_0)

	if var_8_0 then
		ClientModel.BEICGBEEHD(var_8_0, arg_8_1, arg_8_2)
	end
end

function CLIENT_MODEL.SetRequiredModifiables(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		local var_9_1 = var_0_10(iter_9_1)

		if var_9_1 then
			table.insert(var_9_0, var_9_1)
		end
	end

	ClientModel.DAFFBECEBF(var_9_0)
end

function CLIENT_MODEL.UpdateModelsForLoadout(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_10_2]

	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.LETHAL, EQUIPMENT.GetModel(var_10_0.equipmentSetups[0].equipment:get()))
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.TACTICAL, EQUIPMENT.GetModel(var_10_0.equipmentSetups[1].equipment:get()))
	CLIENT_MODEL.UpdatePatchClientModels(arg_10_0, var_10_0)

	local var_10_1 = LOADOUT.GetLoadoutUsingSpecialist(arg_10_1, arg_10_2) > 0

	if PROGRESSION.IsSpecialistPerkUnlocked(arg_10_1) and var_10_1 and not CONDITIONS.IsThirdGameMode() then
		CLIENT_MODEL.UpdatePatchSpecialistClientModels(var_10_0)
	else
		CLIENT_MODEL.HidePatchSpecialistClientModels()
	end
end

function CLIENT_MODEL.UpdatePatchClientModels(arg_11_0, arg_11_1)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PATCH, PERK.GetModel(arg_11_1.loadoutPerks[0]:get()))
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH, PERK.GetModel(arg_11_1.loadoutPerks[1]:get()))
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH, PERK.GetModel(arg_11_1.loadoutPerks[2]:get()))
end

function CLIENT_MODEL.UpdatePatchSpecialistClientModels(arg_12_0)
	if arg_12_0.extraPerks then
		local var_12_0 = PERK.GetSpecialistModel(arg_12_0.extraPerks[0]:get())
		local var_12_1 = PERK.GetSpecialistModel(arg_12_0.extraPerks[1]:get())
		local var_12_2 = PERK.GetSpecialistModel(arg_12_0.extraPerks[2]:get())

		if var_12_0 == nil or #var_12_0 == 0 then
			var_12_0 = PERK.GetModel(arg_12_0.extraPerks[0]:get())
		end

		if var_12_1 == nil or #var_12_1 == 0 then
			var_12_2 = PERK.GetModel(arg_12_0.extraPerks[1]:get())
		end

		if var_12_2 == nil or #var_12_2 == 0 then
			var_12_2 = PERK.GetModel(arg_12_0.extraPerks[3]:get())
		end

		CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_12_0)
		CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_12_1)
		CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_12_2)
	end
end

function CLIENT_MODEL.HidePatchSpecialistClientModels()
	local var_13_0 = "tag_origin"

	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_13_0)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_13_0)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_13_0)
end

function CLIENT_MODEL.InitPatchClientModels(arg_14_0, arg_14_1)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK, var_0_4)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_ACTIVE, var_0_5)
	CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PASSIVE, var_0_6)

	if PROGRESSION.IsSpecialistPerkUnlocked(arg_14_1) then
		CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_0_7)
		CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_0_8)
		CLIENT_MODEL.SetModel(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_0_9)
	else
		CLIENT_MODEL.HidePatchSpecialistClientModels()
	end

	arg_14_0:Wait(5).onComplete = function()
		CLIENT_MODEL.SetModelPatchOrigin(CLIENT_MODEL.coreMPModels.PERK, CLIENT_MODEL.coreMPModels.PERK_PATCH)
		CLIENT_MODEL.SetModelPatchOrigin(CLIENT_MODEL.coreMPModels.PERK_ACTIVE, CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH)
		CLIENT_MODEL.SetModelPatchOrigin(CLIENT_MODEL.coreMPModels.PERK_PASSIVE, CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH)
	end
end
