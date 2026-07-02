EmblemEditorUtils = {}
EmblemEditorUtils.TabIDs = {
	CUSTOM = 0,
	MISSIONTEAM = 5,
	ARMOURY = 3,
	DEFAULT = 1,
	EXTRA = 4,
	COMMUNITY = 2
}
EmblemEditorUtils.EmblemTypes = {
	EMBLEM_TYPE_IMAGE = 1,
	EMBLEM_TYPE_LAYERED = 0
}
EmblemEditorUtils.EMBLEMS_INVALID_ICON_ID = -1
EmblemEditorUtils.SelectedEmblem = -1
EmblemEditorUtils.EmblemLayerBeingEdited = -1
EmblemEditorUtils.ToolPanelOpen = false
EmblemEditorUtils.EmblemCategory = -1
EmblemEditorUtils.EmblemEditorCategories = {}
EmblemEditorUtils.MinPosition = -1
EmblemEditorUtils.MaxPosition = 1
EmblemEditorUtils.MinScale = -6
EmblemEditorUtils.MaxScale = 6
EmblemEditorUtils.DefaultEmblemIndex = 0
EmblemEditorUtils.ClanEmblemID = 350022

function EmblemEditorUtils.IsEditingLayer()
	return EmblemEditorUtils.EmblemLayerBeingEdited ~= -1
end

function EmblemEditorUtils.IsToolPanelOpen()
	return EmblemEditorUtils.ToolPanelOpen
end

function EmblemEditorUtils.SetVisibleAndEnabled(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1 and 1 or 0

	arg_3_0:SetAlpha(var_3_0, 0)
	arg_3_0:SetMouseFocusBlocker(not arg_3_1)
end

function EmblemEditorUtils.GetEmblemDataSources(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2.releaseKillswitch ~= "1" then
		return {
			type = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".type", arg_4_2.type),
			id = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".id", arg_4_2.id),
			sortkey = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".sortkey", arg_4_2.sortkey),
			texture = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".texture", arg_4_2.image),
			description = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".description", arg_4_2.description),
			cost = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".cost", arg_4_2.cost),
			unlockLvl = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".unlockLvl", arg_4_2.unlockLvl),
			unlockPLvl = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".unlockPLvl", arg_4_2.unlockPLvl),
			unclassifyAt = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".unclassifyAt", arg_4_2.unclassifyAt),
			category = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".category", arg_4_2.categoryA),
			icontype = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".icontype", arg_4_2.icontype),
			outlineSize = LUI.DataSourceInGlobalModel.new(arg_4_1 .. ".outlineSize", arg_4_2.outlineSize)
		}
	else
		return nil
	end
end

function EmblemEditorUtils.SetupEmblemRendering(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1.emblemType:GetValue(arg_5_2)

	if var_5_0 == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_LAYERED then
		arg_5_0:SetupEmblemThumbnail(arg_5_1.emblemIndex:GetValue(arg_5_2))
	elseif var_5_0 == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_IMAGE then
		local var_5_1 = arg_5_1.emblemImage:GetValue(arg_5_2)

		arg_5_0:setImage(RegisterMaterial(var_5_1), 0)
		arg_5_0:setupUIImage()
	end
end

function EmblemEditorUtils.GetEmblemRef(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_6_0, CSV.emblems.cols.ref)
end

function EmblemEditorUtils.GetEmblemName(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, arg_7_0, CSV.emblems.cols.name)
end

function EmblemEditorUtils.GetEmblemNameFromID(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_8_0, CSV.emblems.cols.name)
end

function EmblemEditorUtils.GetEmblemImage(arg_9_0)
	local var_9_0 = "white"

	if arg_9_0 ~= nil and #arg_9_0 > 0 then
		var_9_0 = StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, arg_9_0, CSV.emblems.cols.image)

		if var_9_0 == nil or #var_9_0 == 0 then
			var_9_0 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
		end
	end

	return var_9_0
end

function EmblemEditorUtils.GetEmblemIDFromRef(arg_10_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, arg_10_0, CSV.emblems.cols.index)
end

function EmblemEditorUtils.GetEmblemImageFromID(arg_11_0)
	local var_11_0 = "white"

	if arg_11_0 ~= nil then
		var_11_0 = StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_11_0, CSV.emblems.cols.image)

		if var_11_0 == nil or #var_11_0 == 0 then
			var_11_0 = StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, EmblemEditorUtils.DefaultEmblemIndex, CSV.emblems.cols.image)
		end
	end

	return var_11_0
end

function EmblemEditorUtils.GetEmblemCategory(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, arg_12_0, CSV.emblems.cols.category)
end

function EmblemEditorUtils.GetEmblemCategoryFromID(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_13_0, CSV.emblems.cols.category)
end

function EmblemEditorUtils.GetEmblemSeason(arg_14_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, arg_14_0, CSV.emblems.cols.season)
end

function EmblemEditorUtils.GetEmblemSeasonFromID(arg_15_0)
	return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_15_0, CSV.emblems.cols.season)
end

function EmblemEditorUtils.GetAllEmblems(arg_16_0, arg_16_1)
	local var_16_0 = {}
	local var_16_1 = arg_16_1 and arg_16_1.category
	local var_16_2 = StringTable.BFHCAIIDA(CSV.emblems.file)

	for iter_16_0 = 0, var_16_2 - 1 do
		local var_16_3 = CSV.ReadRow(CSV.emblems, iter_16_0)

		if var_16_3 and var_16_3.hideInUI ~= "1" then
			var_16_3.isUnlocked = LOOT.IsUnlocked(arg_16_0, LOOT.itemTypes.EMBLEM, var_16_3.ref)
			var_16_3.rarity = LOOT.GetItemQuality(LOOT.itemTypes.EMBLEM, var_16_3.ref)
			var_16_3.season, var_16_3.event, var_16_3.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.EMBLEM, var_16_3.ref)
			var_16_3.lootID = LOOT.GetItemID(LOOT.itemTypes.EMBLEM, var_16_3.ref)
			var_16_3.lootType = LOOT.itemTypes.EMBLEM
			var_16_3.gameSourceID = LOOT.GetGameSourceIDFromItemID(var_16_3.lootID)
			var_16_3.isOfficerEmblem = var_16_3.officerSeason and #var_16_3.officerSeason > 0

			local var_16_4 = var_16_1 == nil or var_16_3.category == var_16_1

			if arg_16_1 and arg_16_1._shouldGetUnlockedOnly and not var_16_3.isUnlocked then
				var_16_4 = false
			end

			if var_16_3.lootID == 1 then
				var_16_4 = false
			end

			if var_16_4 then
				table.insert(var_16_0, var_16_3)
			end
		end
	end

	return var_16_0
end

function EmblemEditorUtils.GetClanEmblemData(arg_17_0, arg_17_1)
	local var_17_0 = Clans2.CFGBBBHFHB(arg_17_0)
	local var_17_1 = Clans2.CJBHDGCJFJ(arg_17_0, var_17_0)
	local var_17_2 = StringTable.BJJBBCJGEJ(CSV.featureIDs.file, CSV.featureIDs.cols.index, EmblemEditorUtils.ClanEmblemID)
	local var_17_3 = CSV.ReadRow(CSV.featureIDs, var_17_2)

	var_17_3.lootID = EmblemEditorUtils.ClanEmblemID
	var_17_3.rarity = -1
	var_17_3.season, var_17_3.event, var_17_3.isPremium = LOOT.GetItemSeasonByID(LOOT.itemTypes.FEATURE, var_17_3.lootID)
	var_17_3.lootType = arg_17_1.itemType
	var_17_3.isUnlocked = true
	var_17_3.clanEmblemData = var_17_1
	var_17_3.isClanEmblem = true

	return var_17_3
end

function EmblemEditorUtils.IsClanEmblem(arg_18_0)
	return EmblemEditorUtils.ClanEmblemID == arg_18_0
end

function EmblemEditorUtils.GetClanEmblemImages(arg_19_0)
	local var_19_0 = Clans2.CFGBBBHFHB(arg_19_0)

	return Clans2.CJBHDGCJFJ(arg_19_0, var_19_0)
end

function EmblemEditorUtils.IsClanEmblemEnabled(arg_20_0)
	if not CLANS.IsInClan(arg_20_0) then
		return false
	end

	return RANDOM.GetPlayerData(arg_20_0, LOOT.itemTypes.EMBLEM, {
		isClanEmblem = true
	}):get() == 1
end

function EmblemEditorUtils.EquipClanEmblem(arg_21_0)
	local var_21_0 = "emblemIndex"
	local var_21_1 = LUI.DataSourceInControllerModel.new("frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard." .. var_21_0)

	PlayerCard.SetEmblem(arg_21_0, EmblemEditorUtils.ClanEmblemID)
	var_21_1:SetValue(arg_21_0, EmblemEditorUtils.ClanEmblemID)
	Playercard.FCBJJBFBJ(arg_21_0)
end

function EmblemEditorUtils.SetClanEmblemEnabled(arg_22_0, arg_22_1)
	RANDOM.GetPlayerData(arg_22_0, LOOT.itemTypes.EMBLEM, {
		isClanEmblem = true
	}):set(arg_22_1 and 1 or 0)
end

function EmblemEditorUtils.ToggleClanEmblem(arg_23_0)
	local var_23_0 = EmblemEditorUtils.IsClanEmblemEnabled(arg_23_0)

	EmblemEditorUtils.SetClanEmblemEnabled(arg_23_0, not var_23_0)
end
