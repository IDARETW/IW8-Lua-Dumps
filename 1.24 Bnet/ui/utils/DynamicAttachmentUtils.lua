DYN_ATTACHMENT = DYN_ATTACHMENT or {}
DYN_ATTACHMENT.DynamicWidgetType = {
	LASER = 2,
	SCOPE = 6,
	BARREL = 9,
	STOCK = 7,
	MUZZLE = 0,
	RECEIVER = 5,
	MAGAZINE = 4,
	OTHER = 10,
	GUARD = 3,
	UNDERBARREL = 1,
	FIRETYPE = 8
}
DYN_ATTACHMENT.DynamicAnimationType = {
	SINGLE_ELEMENT = 0,
	MULTIPLE_ELEMENT = 1
}
DYN_ATTACHMENT.DynamicUnderBarrelType = {
	BIPOD = 2,
	LAUNCHER = 1,
	GRIP = 0,
	BAYONET = 3
}
DYN_ATTACHMENT.StreamedImageAction = {
	REMOVE = 2,
	ADD = 1,
	NONE = 0
}
DYN_ATTACHMENT.TypeCSVFile = {
	[DYN_ATTACHMENT.DynamicWidgetType.RECEIVER] = CSV.DynamicWeaponReceiverTable,
	[DYN_ATTACHMENT.DynamicWidgetType.MUZZLE] = CSV.DynamicWeaponMuzzleTable,
	[DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL] = CSV.DynamicWeaponUnderBarrelTable,
	[DYN_ATTACHMENT.DynamicWidgetType.LASER] = CSV.DynamicWeaponLaserTable,
	[DYN_ATTACHMENT.DynamicWidgetType.BARREL] = CSV.DynamicWeaponBarrelTable,
	[DYN_ATTACHMENT.DynamicWidgetType.GUARD] = CSV.DynamicWeaponGuardTable,
	[DYN_ATTACHMENT.DynamicWidgetType.MAGAZINE] = CSV.DynamicWeaponMagazineTable,
	[DYN_ATTACHMENT.DynamicWidgetType.SCOPE] = CSV.DynamicWeaponScopeTable,
	[DYN_ATTACHMENT.DynamicWidgetType.STOCK] = CSV.DynamicWeaponStockTable
}
DYN_ATTACHMENT.AnimationCache = {
	size = 0
}
DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE = 200
UNDERBARREL_LAUNCHER_SUFFIX = "GL"
UNDERBARREL_BIPOD_SUFFIX = "BI"
UNDERBARREL_BAYONET_SUFFIX = "BA"
DYN_ATTACHMENT.PISTOL_REF = "pi"
DYN_ATTACHMENT.MAX_VISIBLE_ATTACHMENTS = 8
DYN_ATTACHMENT.STREAMER_NAME = "DYN_Streamer"

function DYN_ATTACHMENT.ClearCache(arg_1_0)
	if not arg_1_0 then
		for iter_1_0, iter_1_1 in pairs(DYN_ATTACHMENT.AnimationCache) do
			if iter_1_0 ~= "size" then
				DYN_ATTACHMENT.AnimationCache[iter_1_0] = nil
				DYN_ATTACHMENT.AnimationCache.size = DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE - 1

				DebugPrint("\n ------ Dynamic Attachment Animation Cache Is Full.")

				break
			end
		end
	else
		DYN_ATTACHMENT.AnimationCache = {
			size = 0
		}
	end
end

function DYN_ATTACHMENT.GetUnderBarrelType(arg_2_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.DynamicWeaponUnderBarrelSpecialTable.file, CSV.DynamicWeaponUnderBarrelSpecialTable.cols.ref, arg_2_0, CSV.DynamicWeaponUnderBarrelSpecialTable.cols.type))
end

local function var_0_0(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = false

	if arg_3_1 and arg_3_2 then
		local var_3_1 = arg_3_0[arg_3_1].ref
		local var_3_2 = arg_3_0[arg_3_2].ref

		if (var_3_1 == "barshort_charlie725" or var_3_1 == "barcust_charlie725") and (var_3_2 == "guardcust_charlie725" or var_3_2 == "guard_charlie725") then
			var_3_0 = true
		end
	end

	if var_3_0 then
		arg_3_0[arg_3_2].icon = "icon_dyn_attachment_sh_charlie725_guard"
		arg_3_0[arg_3_2].ref = "guard_charlie725"
		arg_3_0[arg_3_2].variantID = 0
	end
end

local function var_0_1(arg_4_0)
	local var_4_0

	for iter_4_0 = 1, #arg_4_0 do
		if arg_4_0[iter_4_0].type == DYN_ATTACHMENT.DynamicWidgetType.MAGAZINE then
			var_4_0 = iter_4_0
		end
	end

	if var_4_0 then
		arg_4_0[var_4_0].variantID = 2
	end
end

DYN_ATTACHMENT.SpecialWeaponUpdateFuncList = {
	{
		weaponName = "Regal Retribution",
		updateFunction = var_0_1
	}
}

function DYN_ATTACHMENT.UpdateAttachmentTable(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = DYN_ATTACHMENT.DynamicUnderBarrelType.GRIP
	local var_5_1
	local var_5_2

	for iter_5_0 = 1, #arg_5_1 do
		local var_5_3 = arg_5_1[iter_5_0]
		local var_5_4 = var_5_3.type

		if var_5_4 == DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL then
			var_5_0 = DYN_ATTACHMENT.GetUnderBarrelType(var_5_3.ref)
		elseif var_5_4 == DYN_ATTACHMENT.DynamicWidgetType.BARREL then
			var_5_1 = iter_5_0
		elseif var_5_4 == DYN_ATTACHMENT.DynamicWidgetType.GUARD then
			var_5_2 = iter_5_0
		end

		if not var_5_4 or var_5_4 == DYN_ATTACHMENT.DynamicWidgetType.OTHER then
			local var_5_5 = var_5_3.ref

			if var_5_5 and StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, var_5_5, CSV.MPAttachments.cols.category) == "gunperk" then
				if not var_5_4 then
					var_5_3.type = DYN_ATTACHMENT.DynamicWidgetType.OTHER
				end

				var_5_3.isGunPerk = true
			end
		end
	end

	if var_5_1 then
		local var_5_6 = arg_5_1[var_5_1].animateSeq

		if var_5_0 == DYN_ATTACHMENT.DynamicUnderBarrelType.LAUNCHER then
			var_5_6 = var_5_6 .. UNDERBARREL_LAUNCHER_SUFFIX
		elseif var_5_0 == DYN_ATTACHMENT.DynamicUnderBarrelType.BIPOD then
			var_5_6 = var_5_6 .. UNDERBARREL_BIPOD_SUFFIX
		elseif var_5_0 == DYN_ATTACHMENT.DynamicUnderBarrelType.BAYONET then
			var_5_6 = var_5_6 .. UNDERBARREL_BAYONET_SUFFIX
		end

		arg_5_1[var_5_1].animateSeq = var_5_6
	end

	var_0_0(arg_5_1, var_5_1, var_5_2)

	if not CONDITIONS.InFrontend() then
		local var_5_7 = ""

		if arg_5_2 then
			var_5_7 = DataSources.inGame.HUD.hints.interactiveObject.popup.string:GetValue(arg_5_0)
		else
			var_5_7 = DataSources.inGame.player.currentWeapon.displayName:GetValue(arg_5_0)
		end

		for iter_5_1 = 1, #DYN_ATTACHMENT.SpecialWeaponUpdateFuncList do
			local var_5_8 = DYN_ATTACHMENT.SpecialWeaponUpdateFuncList[iter_5_1]

			if var_5_7 == var_5_8.weaponName and var_5_8.updateFunction then
				var_5_8.updateFunction(arg_5_1)

				break
			end
		end
	end
end

function DYN_ATTACHMENT.IsDynamicAttachmentIconsEnabled()
	return Dvar.IBEGCHEFE("NKTNRLTOSO")
end

function DYN_ATTACHMENT.ShouldShowInteractiveWeaponIcon(arg_7_0)
	if CONDITIONS.InGame() then
		local var_7_0 = DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShow:GetValue(arg_7_0)
		local var_7_1 = DataSources.inGame.HUD.hints.interactiveObject.weapon.baseName:GetValue(arg_7_0)

		return var_7_0 and var_7_1 and #var_7_1 > 0 and var_7_1 ~= "none"
	end

	return false
end

function DYN_ATTACHMENT.GetFireTypeIcon(arg_8_0)
	return ATTACHMENT.FireTypeIcon[arg_8_0]
end

function DYN_ATTACHMENT.GetAltModeFireTypeStringRef(arg_9_0)
	return ATTACHMENT.AltModeFireTypeStringRef[arg_9_0]
end

function DYN_ATTACHMENT.FormatDynamicAttachmentIcon(arg_10_0)
	if arg_10_0 == nil or #arg_10_0 == 0 then
		return ""
	end

	local var_10_0 = "/"
	local var_10_1 = LUI.Split(arg_10_0, var_10_0)

	arg_10_0 = var_10_1[#var_10_1]

	local var_10_2 = LUI.Split(arg_10_0, "\\")

	arg_10_0 = var_10_2[#var_10_2]

	return string.gsub(arg_10_0, ".png", "")
end

function DYN_ATTACHMENT.IsAttachmentVariantIconEnable()
	if CONDITIONS.IsCoreMultiplayer() then
		return true
	elseif CONDITIONS.IsThirdGameMode() then
		return Dvar.IBEGCHEFE("LMKLPKTQOO")
	end
end

function DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = DYN_ATTACHMENT.FormatDynamicAttachmentIcon(arg_12_1)

	if DYN_ATTACHMENT.IsAttachmentVariantIconEnable() and arg_12_0 and arg_12_2 and arg_12_2 > 0 then
		local var_12_1 = StringTable.DIFCHIGDFB(CSV.DynamicWeaponVariantIconMapTable.file, CSV.DynamicWeaponVariantIconMapTable.cols.ref, arg_12_0, arg_12_2 + CSV.DynamicWeaponVariantIconMapTable.cols.base)

		if var_12_1 and #var_12_1 > 0 then
			return var_12_1
		end
	end

	return var_12_0
end

function DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_13_0, arg_13_1, arg_13_2)
	if DYN_ATTACHMENT.IsAttachmentVariantIconEnable() and arg_13_0 and arg_13_2 and arg_13_2 > 0 then
		local var_13_0 = StringTable.DIFCHIGDFB(CSV.DynamicWeaponVariantIconMapTable.file, CSV.DynamicWeaponVariantIconMapTable.cols.ref, arg_13_0, arg_13_2 + CSV.DynamicWeaponVariantIconMapTable.cols.baseAnimation)

		if var_13_0 and #var_13_0 > 0 then
			return var_13_0
		end
	end

	return arg_13_1
end

function DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(arg_14_0)
	return arg_14_0 and #arg_14_0 > 0
end

function DYN_ATTACHMENT.GetDynamicAttachmentType(arg_15_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponAttachmentTable.file, CSV.DynamicWeaponAttachmentTable.cols.ref, arg_15_0, CSV.DynamicWeaponAttachmentTable.cols.type)
end

function DYN_ATTACHMENT.GetDynamicAttachmentIcon(arg_16_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponAttachmentTable.file, CSV.DynamicWeaponAttachmentTable.cols.ref, arg_16_0, CSV.DynamicWeaponAttachmentTable.cols.icon)
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationSeq(arg_17_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponAttachmentTable.file, CSV.DynamicWeaponAttachmentTable.cols.ref, arg_17_0, CSV.DynamicWeaponAttachmentTable.cols.animateSeq)
end

function DYN_ATTACHMENT.GetDynamicAttachmentDataByRef(arg_18_0)
	local var_18_0, var_18_1 = ATTACHMENT.GetRefAndVariantID(arg_18_0)
	local var_18_2 = DYN_ATTACHMENT.GetDynamicAttachmentIcon(var_18_0)
	local var_18_3 = tonumber(DYN_ATTACHMENT.GetDynamicAttachmentType(var_18_0))
	local var_18_4 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationSeq(var_18_0)

	return {
		ref = var_18_0,
		icon = var_18_2,
		type = var_18_3,
		animateSeq = var_18_4,
		variantID = tonumber(var_18_1 and var_18_1 or 0)
	}
end

function DYN_ATTACHMENT.GetDynamicAttachmentsTable(arg_19_0)
	local var_19_0 = split(arg_19_0, "+")
	local var_19_1 = {}

	for iter_19_0 = 2, #var_19_0 do
		local var_19_2 = var_19_0[iter_19_0]
		local var_19_3 = DYN_ATTACHMENT.GetDynamicAttachmentDataByRef(var_19_2)

		table.insert(var_19_1, var_19_3)
	end

	table.insert(var_19_1, {
		fireType = 0,
		type = DYN_ATTACHMENT.DynamicWidgetType.OTHER
	})

	return var_19_1
end

function DYN_ATTACHMENT.GetDynamicAttachmentsTableByRef(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if arg_20_0 then
		for iter_20_0 = 1, #arg_20_0 do
			local var_20_1

			if arg_20_1 then
				var_20_1 = arg_20_0[iter_20_0][arg_20_1]
			else
				var_20_1 = arg_20_0[iter_20_0]
			end

			local var_20_2 = DYN_ATTACHMENT.GetDynamicAttachmentDataByRef(var_20_1)

			table.insert(var_20_0, var_20_2)
		end
	end

	table.insert(var_20_0, {
		fireType = 0,
		type = DYN_ATTACHMENT.DynamicWidgetType.OTHER
	})

	return var_20_0
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationTable(arg_21_0)
	assert(arg_21_0)

	return DYN_ATTACHMENT.TypeCSVFile[arg_21_0]
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationType(arg_22_0)
	if arg_22_0 == DYN_ATTACHMENT.DynamicWidgetType.RECEIVER then
		return DYN_ATTACHMENT.DynamicAnimationType.MULTIPLE_ELEMENT
	elseif arg_22_0 == DYN_ATTACHMENT.DynamicWidgetType.BARREL then
		return DYN_ATTACHMENT.DynamicAnimationType.MULTIPLE_ELEMENT
	end

	return DYN_ATTACHMENT.DynamicAnimationType.SINGLE_ELEMENT
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationData(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0

	if arg_23_3 then
		var_23_0 = CSV.DynamicWeaponAnimationTable
	else
		var_23_0 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationTable(arg_23_0)
	end

	if var_23_0 then
		local var_23_1 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationType(arg_23_0)

		if arg_23_3 or var_23_1 == DYN_ATTACHMENT.DynamicAnimationType.SINGLE_ELEMENT then
			local var_23_2 = (arg_23_0 and arg_23_0 or "") .. arg_23_1

			if DYN_ATTACHMENT.AnimationCache[var_23_2] == nil then
				local var_23_3 = StringTable.BJJBBCJGEJ(var_23_0.file, var_23_0.cols.animateSeq, arg_23_1)

				if var_23_3 == -1 then
					return nil
				end

				local var_23_4 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.elementName)

				if var_23_4 == nil or #var_23_4 == 0 then
					return nil
				end

				local var_23_5 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.left)
				local var_23_6 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.right)
				local var_23_7 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.top)
				local var_23_8 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.bottom)
				local var_23_9 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.scale)
				local var_23_10 = StringTable.CBGJCDIHCE(var_23_0.file, var_23_3, var_23_0.cols.material)
				local var_23_11 = {
					elementName = var_23_4,
					left = tonumber(var_23_5),
					right = tonumber(var_23_6),
					top = tonumber(var_23_7),
					bottom = tonumber(var_23_8),
					scale = tonumber(var_23_9) - 1,
					image = var_23_10
				}

				if DYN_ATTACHMENT.AnimationCache.size == DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE then
					DYN_ATTACHMENT.ClearCache(false)
				end

				DYN_ATTACHMENT.AnimationCache.size = DYN_ATTACHMENT.AnimationCache.size + 1
				DYN_ATTACHMENT.AnimationCache[var_23_2] = var_23_11

				return var_23_11
			else
				return DYN_ATTACHMENT.AnimationCache[var_23_2]
			end
		else
			local var_23_12 = (arg_23_0 and arg_23_0 or "") .. arg_23_1 .. arg_23_2

			if DYN_ATTACHMENT.AnimationCache[var_23_12] == nil then
				local var_23_13 = {
					{
						col = var_23_0.cols.animateSeq,
						key = arg_23_1
					},
					{
						col = var_23_0.cols.elementName,
						key = arg_23_2
					}
				}
				local var_23_14 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.elementName)

				if var_23_14 == nil or #var_23_14 == 0 then
					return nil
				end

				local var_23_15 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.left)
				local var_23_16 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.right)
				local var_23_17 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.top)
				local var_23_18 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.bottom)
				local var_23_19 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.scale)
				local var_23_20 = StringTable.CEBAGDAEJJ(var_23_0.file, var_23_13, var_23_0.cols.material)
				local var_23_21 = {
					elementName = var_23_14,
					left = tonumber(var_23_15),
					right = tonumber(var_23_16),
					top = tonumber(var_23_17),
					bottom = tonumber(var_23_18),
					scale = tonumber(var_23_19) - 1,
					image = var_23_20
				}

				if DYN_ATTACHMENT.AnimationCache.size == DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE then
					DYN_ATTACHMENT.ClearCache(false)
				end

				DYN_ATTACHMENT.AnimationCache.size = DYN_ATTACHMENT.AnimationCache.size + 1
				DYN_ATTACHMENT.AnimationCache[var_23_12] = var_23_21

				return var_23_21
			else
				return DYN_ATTACHMENT.AnimationCache[var_23_12]
			end
		end
	end
end

function DYN_ATTACHMENT.SetupWidgetStreamer(arg_24_0, arg_24_1, arg_24_2)
	if not arg_24_0.streamer then
		arg_24_0.streamer = LUI.UIElement.new()
		arg_24_0.streamer.id = DYN_ATTACHMENT.STREAMER_NAME

		arg_24_0:addElement(arg_24_0.streamer)
	end

	arg_24_0.streamer:SetupImageTableStreamer(arg_24_1, arg_24_2 and true or false)
end

function DYN_ATTACHMENT.SetupWeaponAttachmentStreamer(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = {}

	for iter_25_0 = 1, #arg_25_1 do
		local var_25_1 = arg_25_1[iter_25_0]

		if var_25_1.type then
			local var_25_2 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(var_25_1.ref, var_25_1.icon)

			if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_25_2) then
				table.insert(var_25_0, RegisterMaterial(var_25_2))
			end
		end
	end

	DYN_ATTACHMENT.SetupWidgetStreamer(arg_25_0, var_25_0, arg_25_2)
end

function DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = {}

	for iter_26_0 = 1, #arg_26_1 do
		if arg_26_1[iter_26_0][arg_26_2] and #arg_26_1[iter_26_0][arg_26_2] > 0 then
			table.insert(var_26_0, RegisterMaterial(arg_26_1[iter_26_0][arg_26_2]))
		end
	end

	DYN_ATTACHMENT.SetupWidgetStreamer(arg_26_0, var_26_0, arg_26_3)
end

function DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}
	local var_27_1 = PlayerData.BFFBGAJGD(arg_27_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	for iter_27_0 = 0, #var_27_1 - 1 do
		local var_27_2 = var_27_1[iter_27_0]

		for iter_27_1 = 0, #var_27_2.weaponSetups - 1 do
			local var_27_3 = var_27_2.weaponSetups[iter_27_1]
			local var_27_4 = WEAPON.GenerateWeaponTable(var_27_3)
			local var_27_5 = WEAPON.GetWeaponModelName(var_27_4.weapon, var_27_4, {
				keepAkimbo = true,
				includeStickers = true,
				includeAttachments = true,
				includeCamos = true,
				useGuntableOverride = false
			})
			local var_27_6 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_27_5)

			for iter_27_2 = 1, #var_27_6 do
				local var_27_7 = var_27_6[iter_27_2]

				if var_27_7.type then
					local var_27_8 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(var_27_7.ref, var_27_7.icon)

					if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_27_8) then
						table.insert(var_27_0, RegisterMaterial(var_27_8))
					end
				end
			end
		end
	end

	local var_27_9 = LOADOUT.GetDefaultLoadouts(arg_27_1)

	for iter_27_3 = 1, #var_27_9 do
		local var_27_10 = var_27_9[iter_27_3]

		for iter_27_4 = 1, #var_27_10.weapons do
			local var_27_11 = var_27_10.weapons[iter_27_4]
			local var_27_12 = WEAPON.GetWeaponModelName(var_27_11.ref, var_27_11, {
				keepAkimbo = true,
				includeStickers = true,
				includeAttachments = true,
				isDefault = true,
				includeCamos = true,
				useGuntableOverride = false
			})
			local var_27_13 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_27_12)

			for iter_27_5 = 1, #var_27_13 do
				local var_27_14 = var_27_13[iter_27_5]

				if var_27_14.type then
					local var_27_15 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(var_27_14.ref, var_27_14.icon)

					if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_27_15) then
						table.insert(var_27_0, RegisterMaterial(var_27_15))
					end
				end
			end
		end
	end

	if arg_27_2 == DYN_ATTACHMENT.StreamedImageAction.ADD then
		Streaming.BJEHADFHFD(var_27_0)
	elseif arg_27_2 == DYN_ATTACHMENT.StreamedImageAction.REMOVE then
		Streaming.DDDBGJJEDE(var_27_0)
	end
end

function DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_2 == DYN_ATTACHMENT.StreamedImageAction.ADD then
		if Engine.EEGHCCDG(arg_28_1) then
			if arg_28_0.clientConnectionTimer then
				arg_28_0:RemoveElement(arg_28_0.clientConnectionTimer)
				arg_28_0.clientConnectionTimer:closeTree()

				arg_28_0.clientConnectionTimer = nil
				arg_28_0.clientConnectionTime = nil
			end

			DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(arg_28_0, arg_28_1, arg_28_2)
		elseif arg_28_0.clientConnectionTimer == nil then
			local var_28_0 = 100

			arg_28_0.clientConnectionTimer = LUI.UITimer.new({
				event = "checkClientConnection",
				interval = var_28_0
			})
			arg_28_0.clientConnectionTimer.id = "clientConnectionTimer"

			arg_28_0:addElement(arg_28_0.clientConnectionTimer)

			arg_28_0.clientConnectionTime = 0

			arg_28_0:registerEventHandler("checkClientConnection", function(arg_29_0, arg_29_1)
				local var_29_0 = arg_29_1.controller or arg_28_1
				local var_29_1 = Engine.EEGHCCDG(var_29_0)

				arg_28_0.clientConnectionTime = arg_28_0.clientConnectionTime + 100

				if var_29_1 or arg_28_0.clientConnectionTime > 2000 then
					arg_28_0:RemoveElement(arg_28_0.clientConnectionTimer)
					arg_28_0.clientConnectionTimer:closeTree()

					arg_28_0.clientConnectionTimer = nil
					arg_28_0.clientConnectionTime = nil

					DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(arg_29_0, var_29_0, arg_28_2)
				end
			end)
		end
	else
		DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(element, arg_28_1, arg_28_2)
	end
end

function DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_30_0, arg_30_1)
	DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_30_0, arg_30_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)
	DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_30_0, arg_30_1, DYN_ATTACHMENT.StreamedImageAction.ADD)
end

function DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4)
	local var_31_0 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationData(arg_31_1, arg_31_2, arg_31_3, arg_31_4)

	if var_31_0 then
		local var_31_1 = false
		local var_31_2 = arg_31_3 and arg_31_3 or var_31_0.elementName
		local var_31_3 = var_31_0.left
		local var_31_4 = var_31_0.right
		local var_31_5 = var_31_0.top
		local var_31_6 = var_31_0.bottom
		local var_31_7 = var_31_0.scale
		local var_31_8 = var_31_0.image

		if arg_31_0[var_31_2] then
			arg_31_0[var_31_2]:SetScale(var_31_7)

			if var_31_3 and var_31_4 and var_31_5 and var_31_6 then
				var_31_1 = true

				arg_31_0[var_31_2]:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * var_31_3, _1080p * var_31_4, _1080p * var_31_5, _1080p * var_31_6)
			end

			if var_31_8 and #var_31_8 > 0 then
				var_31_1 = true

				arg_31_0[var_31_2]:setImage(RegisterMaterial(var_31_8))
			end
		end

		return var_31_1
	end
end

function DYN_ATTACHMENT.ApplyDynamicAttachmentData(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	assert(arg_32_1)
	assert(arg_32_2)

	local var_32_0 = false
	local var_32_1 = arg_32_3.animateSeq

	if var_32_1 and #var_32_1 > 0 then
		local var_32_2 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_32_3.ref, var_32_1, arg_32_3.variantID)

		var_32_0 = DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_32_1, arg_32_3.type, var_32_2)
	end

	local var_32_3 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_32_3.ref, arg_32_3.icon, arg_32_3.variantID)

	if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_32_3) then
		var_32_0 = true

		arg_32_2:setImage(RegisterMaterial(var_32_3))
	end

	arg_32_1:SetAlpha(var_32_0 and 1 or 0)
	arg_32_2:SetAlpha(var_32_0 and 1 or 0)
end

function DYN_ATTACHMENT.KillCamMergeAttachmentsByWeaponModel(arg_33_0, arg_33_1)
	if CONDITIONS.InGame() then
		local var_33_0 = {}

		for iter_33_0 = 1, #arg_33_1 do
			local var_33_1 = tonumber(DYN_ATTACHMENT.GetDynamicAttachmentType(arg_33_1[iter_33_0]))

			if var_33_1 then
				var_33_0[var_33_1] = iter_33_0
			end
		end

		local var_33_2 = LUI.Split(arg_33_0, "+")

		for iter_33_1 = 2, #var_33_2 do
			local var_33_3 = var_33_2[iter_33_1]
			local var_33_4 = LUI.Split(var_33_3, "|")[1]

			if not var_33_0[tonumber(DYN_ATTACHMENT.GetDynamicAttachmentType(var_33_4))] then
				table.insert(arg_33_1, var_33_2[iter_33_1])
			end
		end

		return arg_33_1
	end
end

function DYN_ATTACHMENT.KillCamGetDynamicAttachmentRefTable(arg_34_0, arg_34_1)
	if CONDITIONS.InGame() then
		local var_34_0 = Game.BFEEGCHICA(arg_34_1, "ui_killcam_killedby_attachments_str")

		return (LUI.Split(var_34_0, "+"))
	end
end
