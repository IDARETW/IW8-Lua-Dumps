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
DYN_ATTACHMENT.DynamicWidgetTypeName = {
	[DYN_ATTACHMENT.DynamicWidgetType.MUZZLE] = "Muzzle",
	[DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL] = "UnderBarrel",
	[DYN_ATTACHMENT.DynamicWidgetType.LASER] = "Laser",
	[DYN_ATTACHMENT.DynamicWidgetType.GUARD] = "Guard",
	[DYN_ATTACHMENT.DynamicWidgetType.MAGAZINE] = "Magazine",
	[DYN_ATTACHMENT.DynamicWidgetType.RECEIVER] = "Receiver",
	[DYN_ATTACHMENT.DynamicWidgetType.SCOPE] = "Scope",
	[DYN_ATTACHMENT.DynamicWidgetType.STOCK] = "Stock",
	[DYN_ATTACHMENT.DynamicWidgetType.FIRETYPE] = "Firetype",
	[DYN_ATTACHMENT.DynamicWidgetType.BARREL] = "Barrel",
	[DYN_ATTACHMENT.DynamicWidgetType.OTHER] = "Other"
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
DYN_ATTACHMENT.DebugOverrides = {
	{
		editActive = false,
		attachment = "",
		color = COLORS.lightCyan,
		left = {
			default = 0,
			current = 0
		},
		right = {
			default = 0,
			current = 0
		},
		top = {
			default = 0,
			current = 0
		},
		bottom = {
			default = 0,
			current = 0
		},
		scale = {
			default = 1,
			current = 1
		}
	},
	{
		editActive = false,
		attachment = "",
		color = COLORS.arenaGreenLight,
		left = {
			default = 0,
			current = 0
		},
		right = {
			default = 0,
			current = 0
		},
		top = {
			default = 0,
			current = 0
		},
		bottom = {
			default = 0,
			current = 0
		},
		scale = {
			default = 1,
			current = 1
		}
	},
	{
		editActive = false,
		attachment = "",
		color = COLORS.lightRed,
		left = {
			default = 0,
			current = 0
		},
		right = {
			default = 0,
			current = 0
		},
		top = {
			default = 0,
			current = 0
		},
		bottom = {
			default = 0,
			current = 0
		},
		scale = {
			default = 1,
			current = 1
		}
	}
}
DYN_ATTACHMENT.AnimationCache = {
	size = 0
}
DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE = 200
UNDERBARREL_LAUNCHER_SUFFIX = "GL"
UNDERBARREL_BIPOD_SUFFIX = "BI"
UNDERBARREL_BAYONET_SUFFIX = "BA"
DYN_ATTACHMENT.PISTOL_REF = "pi"
DYN_ATTACHMENT.MANDATORY_UPDATE_WEAPON_NAME = ""
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

local function var_0_0(arg_2_0, arg_2_1)
	if arg_2_0 then
		local var_2_0 = split(arg_2_0, ",")

		for iter_2_0 = 1, #var_2_0 do
			if var_2_0[iter_2_0] == arg_2_1 then
				return true
			end
		end
	end

	return false
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.variantData
	local var_3_1 = arg_3_1.attachmentList
	local var_3_2 = arg_3_1.attachmentRef

	if var_3_0 then
		local var_3_3 = split(var_3_0, "_")

		if #var_3_3 > 0 then
			local var_3_4 = Game.BAEHBDJCHI(arg_3_0)

			for iter_3_0 = 1, #var_3_3 do
				if tonumber(var_3_3[iter_3_0]) == var_3_4 then
					return var_0_0(var_3_1, var_3_2)
				end
			end
		else
			return var_0_0(var_3_1, var_3_2)
		end
	end

	return false
end

function DYN_ATTACHMENT.ShouldShowLaserAttachment(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.weaponRef
	local var_4_1 = WEAPON.GetBaseRef(var_4_0, false)
	local var_4_2 = arg_4_1.attachmentRef
	local var_4_3
	local var_4_4 = StringTable.BJJBBCJGEJ(CSV.laserHideList.file, CSV.laserHideList.cols.baseWeaponRef, var_4_1)

	if var_4_4 and var_4_4 > 0 then
		local var_4_5 = CSV.ReadRow(CSV.laserHideList, var_4_4)

		if var_4_5 then
			if var_4_5.specialWeaponRefs and #var_4_5.specialWeaponRefs > 0 then
				local var_4_6 = split(var_4_5.specialWeaponRefs, ",")

				for iter_4_0 = 1, #var_4_6 do
					local var_4_7 = var_4_6[iter_4_0]
					local var_4_8 = split(var_4_7, "|")

					if var_4_8[1] == var_4_0 then
						var_4_3 = {
							variantData = var_4_8[2],
							attachmentList = var_4_5.excludedAttachments,
							attachmentRef = var_4_2
						}

						break
					end
				end
			else
				var_4_3 = {
					variantData = var_4_5.variantID,
					attachmentList = var_4_5.excludedAttachments,
					attachmentRef = var_4_2
				}
			end
		end
	end

	if var_4_3 then
		return not var_0_1(arg_4_0, var_4_3)
	end

	return true
end

local function var_0_2(arg_5_0)
	local var_5_0 = arg_5_0.barrelIndex
	local var_5_1 = arg_5_0.guardIndex
	local var_5_2 = false

	if var_5_0 and var_5_1 then
		local var_5_3 = arg_5_0[var_5_0].ref
		local var_5_4 = arg_5_0[var_5_1].ref

		if (var_5_3 == "barshort_charlie725" or var_5_3 == "barcust_charlie725") and (var_5_4 == "guardcust_charlie725" or var_5_4 == "guard_charlie725") then
			var_5_2 = true
		end
	end

	if var_5_2 then
		arg_5_0[var_5_1].icon = "icon_dyn_attachment_sh_charlie725_guard"
		arg_5_0[var_5_1].ref = "guard_charlie725"
		arg_5_0[var_5_1].variantID = 0
	end
end

local function var_0_3(arg_6_0)
	if not CONDITIONS.InFrontend() then
		local var_6_0

		for iter_6_0 = 1, #arg_6_0 do
			if arg_6_0[iter_6_0].type == DYN_ATTACHMENT.DynamicWidgetType.MAGAZINE then
				var_6_0 = iter_6_0
			end
		end

		if var_6_0 then
			arg_6_0[var_6_0].variantID = 2
		end
	end
end

local function var_0_4(arg_7_0)
	if not CONDITIONS.InFrontend() and not Engine.CIEGIACHAE() and CONDITIONS.InKillCam() then
		for iter_7_0 = 1, #arg_7_0 do
			if arg_7_0[iter_7_0].type == DYN_ATTACHMENT.DynamicWidgetType.RECEIVER then
				arg_7_0[iter_7_0].animateSeq = "meKnife"
				arg_7_0[iter_7_0].ref = "me_knife"
			end
		end
	end
end

function ReorderAttachmentTableForWeapons(arg_8_0, arg_8_1)
	if arg_8_0 and arg_8_1 then
		local var_8_0
		local var_8_1

		for iter_8_0 = 1, #arg_8_0 do
			local var_8_2 = arg_8_0[iter_8_0]

			if var_8_2 then
				if var_8_2.ref == "triggrip_sierrax" then
					var_8_0 = iter_8_0
				elseif var_8_2.ref == "rec_sierrax" then
					var_8_1 = iter_8_0
				end
			end
		end

		if var_8_0 ~= nil and var_8_1 ~= nil and var_8_1 < var_8_0 then
			arg_8_0[var_8_1], arg_8_0[var_8_0] = arg_8_0[var_8_0], arg_8_0[var_8_1]
		end
	end
end

DYN_ATTACHMENT.SpecialWeaponUpdateFuncList = {
	{
		weaponRef == "",
		weaponName = "iw8_ar_kilo433_mp+back_kilo433|2+barlong_kilo433|1+drums_kilo433|1+griphip|3+hybrid_west01_kilo433|2+rec_kilo433|2+selectsemi+loot2",
		updateFunction = var_0_3
	},
	{
		weaponDisplayName = DYN_ATTACHMENT.MANDATORY_UPDATE_WEAPON_NAME,
		weaponRef == "",
		weaponName = "",
		updateFunction = var_0_2
	},
	{
		weaponRef == "",
		weaponName = "iw8_knife_mpc+me_knifec+loot48",
		updateFunction = var_0_4
	},
	{
		weaponName = "",
		weaponRef = "iw8_lm_sierrax",
		updateFunction = ReorderAttachmentTableForWeapons
	}
}

function DYN_ATTACHMENT.GetUnderBarrelType(arg_9_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.DynamicWeaponUnderBarrelSpecialTable.file, CSV.DynamicWeaponUnderBarrelSpecialTable.cols.ref, arg_9_0, CSV.DynamicWeaponUnderBarrelSpecialTable.cols.type))
end

function DYN_ATTACHMENT.GetUnderBarrelSubTypeAnimationSeq(arg_10_0, arg_10_1)
	if arg_10_0 == DYN_ATTACHMENT.DynamicUnderBarrelType.LAUNCHER then
		arg_10_1 = arg_10_1 .. UNDERBARREL_LAUNCHER_SUFFIX
	elseif arg_10_0 == DYN_ATTACHMENT.DynamicUnderBarrelType.BIPOD then
		arg_10_1 = arg_10_1 .. UNDERBARREL_BIPOD_SUFFIX
	elseif arg_10_0 == DYN_ATTACHMENT.DynamicUnderBarrelType.BAYONET then
		arg_10_1 = arg_10_1 .. UNDERBARREL_BAYONET_SUFFIX
	end

	return arg_10_1
end

function DYN_ATTACHMENT.UpdateAttachmentTable(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = DYN_ATTACHMENT.DynamicUnderBarrelType.GRIP
	local var_11_1
	local var_11_2

	for iter_11_0 = 1, #arg_11_1 do
		local var_11_3 = arg_11_1[iter_11_0]
		local var_11_4 = var_11_3.type

		if var_11_4 == DYN_ATTACHMENT.DynamicWidgetType.UNDERBARREL then
			var_11_0 = DYN_ATTACHMENT.GetUnderBarrelType(var_11_3.ref)
		elseif var_11_4 == DYN_ATTACHMENT.DynamicWidgetType.BARREL then
			var_11_1 = iter_11_0
			arg_11_1.barrelIndex = var_11_1
		elseif var_11_4 == DYN_ATTACHMENT.DynamicWidgetType.GUARD then
			arg_11_1.guardIndex = iter_11_0
		end

		if not var_11_4 or var_11_4 == DYN_ATTACHMENT.DynamicWidgetType.OTHER then
			local var_11_5 = var_11_3.ref

			if var_11_5 and StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, var_11_5, CSV.MPAttachments.cols.category) == "gunperk" then
				if not var_11_4 then
					var_11_3.type = DYN_ATTACHMENT.DynamicWidgetType.OTHER
				end

				var_11_3.isGunPerk = true
			end
		end
	end

	if var_11_1 then
		local var_11_6 = arg_11_1[var_11_1].animateSeq
		local var_11_7 = DYN_ATTACHMENT.GetUnderBarrelSubTypeAnimationSeq(var_11_0, var_11_6)

		arg_11_1[var_11_1].animateSeq = var_11_7
	end

	local var_11_8 = ""
	local var_11_9 = ""

	if not CONDITIONS.InFrontend() then
		if arg_11_2 then
			local var_11_10 = DataSources.inGame.HUD.hints.interactiveObject.popup.string:GetValue(arg_11_0)
		else
			local var_11_11 = DataSources.inGame.player.currentWeapon.displayName:GetValue(arg_11_0)

			var_11_9 = DataSources.inGame.player.currentWeapon.name:GetValue(arg_11_0)
		end
	end

	for iter_11_1 = 1, #DYN_ATTACHMENT.SpecialWeaponUpdateFuncList do
		local var_11_12 = DYN_ATTACHMENT.SpecialWeaponUpdateFuncList[iter_11_1]
		local var_11_13 = var_11_9 == var_11_12.weaponName or var_11_12.weaponDisplayName == DYN_ATTACHMENT.MANDATORY_UPDATE_WEAPON_NAME or arg_11_3 == var_11_12.weaponRef

		if var_11_12.updateFunction and var_11_13 then
			var_11_12.updateFunction(arg_11_1, arg_11_3)
		end
	end
end

function DYN_ATTACHMENT.IsDynamicAttachmentIconsEnabled()
	return Dvar.IBEGCHEFE("NKTNRLTOSO")
end

function DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(arg_13_0)
	return arg_13_0 and #arg_13_0 > 0
end

function DYN_ATTACHMENT.IsAttachmentVariantIconEnable()
	if CONDITIONS.IsCoreMultiplayer() then
		return true
	elseif CONDITIONS.IsThirdGameMode() then
		return Dvar.IBEGCHEFE("LMKLPKTQOO")
	end
end

function DYN_ATTACHMENT.ShouldShowInteractiveWeaponIcon(arg_15_0)
	if CONDITIONS.InGame() then
		local var_15_0 = DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShow:GetValue(arg_15_0)
		local var_15_1 = DataSources.inGame.HUD.hints.interactiveObject.weapon.baseName:GetValue(arg_15_0)

		return var_15_0 and var_15_1 and #var_15_1 > 0 and var_15_1 ~= "none"
	end

	return false
end

function DYN_ATTACHMENT.FormatDynamicAttachmentIcon(arg_16_0)
	if arg_16_0 == nil or #arg_16_0 == 0 then
		return ""
	end

	local var_16_0 = "/"
	local var_16_1 = LUI.Split(arg_16_0, var_16_0)

	arg_16_0 = var_16_1[#var_16_1]

	local var_16_2 = LUI.Split(arg_16_0, "\\")

	arg_16_0 = var_16_2[#var_16_2]

	return string.gsub(arg_16_0, ".png", "")
end

function DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = DYN_ATTACHMENT.FormatDynamicAttachmentIcon(arg_17_1)

	if DYN_ATTACHMENT.IsAttachmentVariantIconEnable() and arg_17_0 and arg_17_2 and arg_17_2 > 0 then
		local var_17_1 = arg_17_2 + CSV.DynamicWeaponVariantIconMapTable.cols.base

		if var_17_1 > CSV.DynamicWeaponVariantIconMapTable.cols.imageVariantMaxCol then
			var_17_1 = var_17_1 - CSV.DynamicWeaponVariantIconMapTable.cols.imageVariantMaxCol + CSV.DynamicWeaponVariantIconMapTable2.cols.base

			local var_17_2 = StringTable.DIFCHIGDFB(CSV.DynamicWeaponVariantIconMapTable2.file, CSV.DynamicWeaponVariantIconMapTable2.cols.ref, arg_17_0, var_17_1)

			if var_17_2 and #var_17_2 > 0 then
				return var_17_2
			end
		else
			local var_17_3 = StringTable.DIFCHIGDFB(CSV.DynamicWeaponVariantIconMapTable.file, CSV.DynamicWeaponVariantIconMapTable.cols.ref, arg_17_0, var_17_1)

			if var_17_3 and #var_17_3 > 0 then
				return var_17_3
			end
		end
	end

	return var_17_0
end

function DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_18_0, arg_18_1, arg_18_2)
	if DYN_ATTACHMENT.IsAttachmentVariantIconEnable() and arg_18_0 and arg_18_2 and arg_18_2 > 0 then
		local var_18_0 = arg_18_2 + CSV.DynamicWeaponVariantIconMapTableAnim.cols.baseAnimation

		if var_18_0 > CSV.DynamicWeaponVariantIconMapTableAnim.cols.animationVariantMaxCol then
			var_18_0 = var_18_0 - CSV.DynamicWeaponVariantIconMapTableAnim.cols.animationVariantMaxCol + CSV.DynamicWeaponVariantIconMapTableAnim2.cols.baseAnimation

			local var_18_1 = StringTable.DIFCHIGDFB(CSV.DynamicWeaponVariantIconMapTableAnim2.file, CSV.DynamicWeaponVariantIconMapTableAnim2.cols.ref, arg_18_0, var_18_0)

			if var_18_1 and #var_18_1 > 0 then
				return var_18_1
			end
		else
			local var_18_2 = StringTable.DIFCHIGDFB(CSV.DynamicWeaponVariantIconMapTableAnim.file, CSV.DynamicWeaponVariantIconMapTableAnim.cols.ref, arg_18_0, var_18_0)

			if var_18_2 and #var_18_2 > 0 then
				return var_18_2
			end
		end
	end

	return arg_18_1
end

function DYN_ATTACHMENT.GetFireTypeIcon(arg_19_0)
	return ATTACHMENT.FireTypeIcon[arg_19_0]
end

function DYN_ATTACHMENT.GetAltModeFireTypeStringRef(arg_20_0)
	return ATTACHMENT.AltModeFireTypeStringRef[arg_20_0]
end

function DYN_ATTACHMENT.GetDynamicAttachmentType(arg_21_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponAttachmentTable.file, CSV.DynamicWeaponAttachmentTable.cols.ref, arg_21_0, CSV.DynamicWeaponAttachmentTable.cols.type)
end

function DYN_ATTACHMENT.GetDynamicAttachmentIcon(arg_22_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponAttachmentTable.file, CSV.DynamicWeaponAttachmentTable.cols.ref, arg_22_0, CSV.DynamicWeaponAttachmentTable.cols.icon)
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationSeq(arg_23_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponAttachmentTable.file, CSV.DynamicWeaponAttachmentTable.cols.ref, arg_23_0, CSV.DynamicWeaponAttachmentTable.cols.animateSeq)
end

function DYN_ATTACHMENT.GetDynamicAttachmentDataByRef(arg_24_0)
	local var_24_0, var_24_1 = ATTACHMENT.GetRefAndVariantID(arg_24_0)
	local var_24_2 = DYN_ATTACHMENT.GetDynamicAttachmentIcon(var_24_0)
	local var_24_3 = tonumber(DYN_ATTACHMENT.GetDynamicAttachmentType(var_24_0))
	local var_24_4 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationSeq(var_24_0)

	return {
		ref = var_24_0,
		icon = var_24_2,
		type = var_24_3,
		animateSeq = var_24_4,
		variantID = tonumber(var_24_1 and var_24_1 or 0)
	}
end

function DYN_ATTACHMENT.GetDynamicAttachmentsTable(arg_25_0)
	local var_25_0 = split(arg_25_0, "+")
	local var_25_1 = {}

	for iter_25_0 = 2, #var_25_0 do
		local var_25_2 = var_25_0[iter_25_0]
		local var_25_3 = DYN_ATTACHMENT.GetDynamicAttachmentDataByRef(var_25_2)

		table.insert(var_25_1, var_25_3)
	end

	table.insert(var_25_1, {
		fireType = 0,
		type = DYN_ATTACHMENT.DynamicWidgetType.OTHER
	})

	return var_25_1
end

function DYN_ATTACHMENT.GetDynamicAttachmentsTableByRef(arg_26_0, arg_26_1)
	local var_26_0 = {}

	if arg_26_0 then
		for iter_26_0 = 1, #arg_26_0 do
			local var_26_1

			if arg_26_1 then
				var_26_1 = arg_26_0[iter_26_0][arg_26_1]
			else
				var_26_1 = arg_26_0[iter_26_0]
			end

			local var_26_2 = DYN_ATTACHMENT.GetDynamicAttachmentDataByRef(var_26_1)

			table.insert(var_26_0, var_26_2)
		end
	end

	table.insert(var_26_0, {
		fireType = 0,
		type = DYN_ATTACHMENT.DynamicWidgetType.OTHER
	})

	return var_26_0
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationTable(arg_27_0)
	assert(arg_27_0)

	return DYN_ATTACHMENT.TypeCSVFile[arg_27_0]
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationType(arg_28_0)
	if arg_28_0 == DYN_ATTACHMENT.DynamicWidgetType.RECEIVER then
		return DYN_ATTACHMENT.DynamicAnimationType.MULTIPLE_ELEMENT
	elseif arg_28_0 == DYN_ATTACHMENT.DynamicWidgetType.BARREL then
		return DYN_ATTACHMENT.DynamicAnimationType.MULTIPLE_ELEMENT
	end

	return DYN_ATTACHMENT.DynamicAnimationType.SINGLE_ELEMENT
end

function DYN_ATTACHMENT.GetDynamicAttachmentAnimationData(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0

	if arg_29_3 then
		var_29_0 = CSV.DynamicWeaponAnimationTable
	else
		var_29_0 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationTable(arg_29_0)
	end

	if var_29_0 then
		local var_29_1 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationType(arg_29_0)

		if arg_29_3 or var_29_1 == DYN_ATTACHMENT.DynamicAnimationType.SINGLE_ELEMENT then
			local var_29_2 = (arg_29_0 and arg_29_0 or "") .. arg_29_1

			if DYN_ATTACHMENT.AnimationCache[var_29_2] == nil then
				local var_29_3 = StringTable.BJJBBCJGEJ(var_29_0.file, var_29_0.cols.animateSeq, arg_29_1)

				if var_29_3 == -1 then
					return nil
				end

				local var_29_4 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.elementName)

				if var_29_4 == nil or #var_29_4 == 0 then
					return nil
				end

				local var_29_5 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.left)
				local var_29_6 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.right)
				local var_29_7 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.top)
				local var_29_8 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.bottom)
				local var_29_9 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.scale)
				local var_29_10 = StringTable.CBGJCDIHCE(var_29_0.file, var_29_3, var_29_0.cols.material)
				local var_29_11 = {
					elementName = var_29_4,
					left = tonumber(var_29_5),
					right = tonumber(var_29_6),
					top = tonumber(var_29_7),
					bottom = tonumber(var_29_8),
					scale = tonumber(var_29_9) - 1,
					image = var_29_10
				}

				if DYN_ATTACHMENT.AnimationCache.size == DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE then
					DYN_ATTACHMENT.ClearCache(false)
				end

				DYN_ATTACHMENT.AnimationCache.size = DYN_ATTACHMENT.AnimationCache.size + 1
				DYN_ATTACHMENT.AnimationCache[var_29_2] = var_29_11

				return var_29_11
			else
				return DYN_ATTACHMENT.AnimationCache[var_29_2]
			end
		else
			local var_29_12 = (arg_29_0 and arg_29_0 or "") .. arg_29_1 .. arg_29_2

			if DYN_ATTACHMENT.AnimationCache[var_29_12] == nil then
				local var_29_13 = {
					{
						col = var_29_0.cols.animateSeq,
						key = arg_29_1
					},
					{
						col = var_29_0.cols.elementName,
						key = arg_29_2
					}
				}
				local var_29_14 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.elementName)

				if var_29_14 == nil or #var_29_14 == 0 then
					return nil
				end

				local var_29_15 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.left)
				local var_29_16 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.right)
				local var_29_17 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.top)
				local var_29_18 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.bottom)
				local var_29_19 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.scale)
				local var_29_20 = StringTable.CEBAGDAEJJ(var_29_0.file, var_29_13, var_29_0.cols.material)
				local var_29_21 = {
					elementName = var_29_14,
					left = tonumber(var_29_15),
					right = tonumber(var_29_16),
					top = tonumber(var_29_17),
					bottom = tonumber(var_29_18),
					scale = tonumber(var_29_19) - 1,
					image = var_29_20
				}

				if DYN_ATTACHMENT.AnimationCache.size == DYN_ATTACHMENT.MAX_ANIMATION_CACHE_SIZE then
					DYN_ATTACHMENT.ClearCache(false)
				end

				DYN_ATTACHMENT.AnimationCache.size = DYN_ATTACHMENT.AnimationCache.size + 1
				DYN_ATTACHMENT.AnimationCache[var_29_12] = var_29_21

				return var_29_21
			else
				return DYN_ATTACHMENT.AnimationCache[var_29_12]
			end
		end
	end
end

function DYN_ATTACHMENT.GetDisplayedAttachmentRefTable(arg_30_0)
	local var_30_0 = {}

	for iter_30_0 = 1, #arg_30_0 do
		local var_30_1 = arg_30_0[iter_30_0]

		if var_30_1 and #var_30_1 > 0 and ATTACHMENT.IsDisplayNameAvailable(var_30_1) then
			table.insert(var_30_0, var_30_1)
		end
	end

	return var_30_0
end

function DYN_ATTACHMENT.SetupWidgetStreamer(arg_31_0, arg_31_1, arg_31_2)
	if not arg_31_0.streamer then
		arg_31_0.streamer = LUI.UIElement.new()
		arg_31_0.streamer.id = DYN_ATTACHMENT.STREAMER_NAME

		arg_31_0:addElement(arg_31_0.streamer)
	end

	arg_31_0.streamer:SetupImageTableStreamer(arg_31_1, arg_31_2 and true or false)
end

function DYN_ATTACHMENT.SetupWeaponAttachmentStreamer(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = {}

	for iter_32_0 = 1, #arg_32_1 do
		local var_32_1 = arg_32_1[iter_32_0]

		if var_32_1.type then
			local var_32_2 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(var_32_1.ref, var_32_1.icon)

			if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_32_2) then
				table.insert(var_32_0, RegisterMaterial(var_32_2))
			end
		end
	end

	DYN_ATTACHMENT.SetupWidgetStreamer(arg_32_0, var_32_0, arg_32_2)
end

function DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = {}

	for iter_33_0 = 1, #arg_33_1 do
		if arg_33_1[iter_33_0][arg_33_2] and #arg_33_1[iter_33_0][arg_33_2] > 0 then
			table.insert(var_33_0, RegisterMaterial(arg_33_1[iter_33_0][arg_33_2]))
		end
	end

	DYN_ATTACHMENT.SetupWidgetStreamer(arg_33_0, var_33_0, arg_33_3)
end

function DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = {}
	local var_34_1 = PlayerData.BFFBGAJGD(arg_34_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	for iter_34_0 = 0, #var_34_1 - 1 do
		local var_34_2 = var_34_1[iter_34_0]

		for iter_34_1 = 0, #var_34_2.weaponSetups - 1 do
			local var_34_3 = var_34_2.weaponSetups[iter_34_1]
			local var_34_4 = WEAPON.GenerateWeaponTable(var_34_3)
			local var_34_5 = WEAPON.GetWeaponModelName(var_34_4.weapon, var_34_4, {
				keepAkimbo = true,
				includeStickers = true,
				includeAttachments = true,
				includeCamos = true,
				useGuntableOverride = false
			})
			local var_34_6 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_34_5)

			for iter_34_2 = 1, #var_34_6 do
				local var_34_7 = var_34_6[iter_34_2]

				if var_34_7.type then
					local var_34_8 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(var_34_7.ref, var_34_7.icon)

					if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_34_8) then
						table.insert(var_34_0, RegisterMaterial(var_34_8))
					end
				end
			end
		end
	end

	local var_34_9 = LOADOUT.GetDefaultLoadouts(arg_34_1)

	for iter_34_3 = 1, #var_34_9 do
		local var_34_10 = var_34_9[iter_34_3]

		for iter_34_4 = 1, #var_34_10.weapons do
			local var_34_11 = var_34_10.weapons[iter_34_4]
			local var_34_12 = WEAPON.GetWeaponModelName(var_34_11.ref, var_34_11, {
				keepAkimbo = true,
				includeStickers = true,
				includeAttachments = true,
				isDefault = true,
				includeCamos = true,
				useGuntableOverride = false
			})
			local var_34_13 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_34_12)

			for iter_34_5 = 1, #var_34_13 do
				local var_34_14 = var_34_13[iter_34_5]

				if var_34_14.type then
					local var_34_15 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(var_34_14.ref, var_34_14.icon)

					if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_34_15) then
						table.insert(var_34_0, RegisterMaterial(var_34_15))
					end
				end
			end
		end
	end

	if arg_34_2 == DYN_ATTACHMENT.StreamedImageAction.ADD then
		Streaming.BJEHADFHFD(var_34_0)
	elseif arg_34_2 == DYN_ATTACHMENT.StreamedImageAction.REMOVE then
		Streaming.DDDBGJJEDE(var_34_0)
	end
end

function DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_35_0, arg_35_1, arg_35_2)
	if arg_35_2 == DYN_ATTACHMENT.StreamedImageAction.ADD then
		if Engine.EEGHCCDG(arg_35_1) then
			if arg_35_0.clientConnectionTimer then
				arg_35_0:RemoveElement(arg_35_0.clientConnectionTimer)
				arg_35_0.clientConnectionTimer:closeTree()

				arg_35_0.clientConnectionTimer = nil
				arg_35_0.clientConnectionTime = nil
			end

			DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(arg_35_0, arg_35_1, arg_35_2)
		elseif arg_35_0.clientConnectionTimer == nil then
			local var_35_0 = 100

			arg_35_0.clientConnectionTimer = LUI.UITimer.new({
				event = "checkClientConnection",
				interval = var_35_0
			})
			arg_35_0.clientConnectionTimer.id = "clientConnectionTimer"

			arg_35_0:addElement(arg_35_0.clientConnectionTimer)

			arg_35_0.clientConnectionTime = 0

			arg_35_0:registerEventHandler("checkClientConnection", function(arg_36_0, arg_36_1)
				local var_36_0 = arg_36_1.controller or arg_35_1
				local var_36_1 = Engine.EEGHCCDG(var_36_0)

				arg_35_0.clientConnectionTime = arg_35_0.clientConnectionTime + 100

				if var_36_1 or arg_35_0.clientConnectionTime > 2000 then
					arg_35_0:RemoveElement(arg_35_0.clientConnectionTimer)
					arg_35_0.clientConnectionTimer:closeTree()

					arg_35_0.clientConnectionTimer = nil
					arg_35_0.clientConnectionTime = nil

					DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(arg_36_0, var_36_0, arg_35_2)
				end
			end)
		end
	else
		DYN_ATTACHMENT.ProcessLoadoutWeaponStreamedImages(element, arg_35_1, arg_35_2)
	end
end

function DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_37_0, arg_37_1)
	DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_37_0, arg_37_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)
	DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_37_0, arg_37_1, DYN_ATTACHMENT.StreamedImageAction.ADD)
end

function DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	local var_38_0 = DYN_ATTACHMENT.GetDynamicAttachmentAnimationData(arg_38_1, arg_38_2, arg_38_3, arg_38_4)

	if var_38_0 then
		local var_38_1 = false
		local var_38_2 = arg_38_3 and arg_38_3 or var_38_0.elementName
		local var_38_3 = var_38_0.left
		local var_38_4 = var_38_0.right
		local var_38_5 = var_38_0.top
		local var_38_6 = var_38_0.bottom
		local var_38_7 = var_38_0.scale
		local var_38_8 = var_38_0.image

		if arg_38_0[var_38_2] then
			if CONDITIONS.DynamicIconDebugEnabled() then
				local var_38_9 = COLORS.white

				for iter_38_0, iter_38_1 in ipairs(DYN_ATTACHMENT.DebugOverrides) do
					if var_38_2 == (iter_38_1.attachment or "") then
						iter_38_1.left.default = var_38_3
						iter_38_1.right.default = var_38_4
						iter_38_1.top.default = var_38_5
						iter_38_1.bottom.default = var_38_6
						iter_38_1.scale.default = var_38_7 + 1

						if iter_38_1.editActive then
							var_38_3 = iter_38_1.left.current
							var_38_4 = iter_38_1.right.current
							var_38_5 = iter_38_1.top.current
							var_38_6 = iter_38_1.bottom.current
							var_38_7 = iter_38_1.scale.current - 1
						end

						var_38_9 = iter_38_1.color

						break
					end
				end

				arg_38_0[var_38_2]:SetRGBFromTable(var_38_9)
			end

			arg_38_0[var_38_2]:SetScale(var_38_7)

			if var_38_3 and var_38_4 and var_38_5 and var_38_6 then
				var_38_1 = true

				arg_38_0[var_38_2]:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * var_38_3, _1080p * var_38_4, _1080p * var_38_5, _1080p * var_38_6)
			end

			if var_38_8 and #var_38_8 > 0 then
				var_38_1 = true

				arg_38_0[var_38_2]:setImage(RegisterMaterial(var_38_8))
			end
		end

		return var_38_1
	end
end

function DYN_ATTACHMENT.ApplyDynamicAttachmentData(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	assert(arg_39_1)
	assert(arg_39_2)

	local var_39_0 = false
	local var_39_1 = arg_39_3.animateSeq

	if var_39_1 and #var_39_1 > 0 then
		local var_39_2 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantAnimation(arg_39_3.ref, var_39_1, arg_39_3.variantID)

		var_39_0 = DYN_ATTACHMENT.PlayDynamicAttachmentAnimation(arg_39_1, arg_39_3.type, var_39_2)
	end

	local var_39_3 = DYN_ATTACHMENT.FormatDynamicAttachmentVariantIcon(arg_39_3.ref, arg_39_3.icon, arg_39_3.variantID)

	if DYN_ATTACHMENT.IsDynamicAttachmentIconOverriden(var_39_3) then
		var_39_0 = true

		arg_39_2:setImage(RegisterMaterial(var_39_3))
	end

	arg_39_1:SetAlpha(var_39_0 and 1 or 0)
	arg_39_2:SetAlpha(var_39_0 and 1 or 0)
end

function DYN_ATTACHMENT.KillCamMergeAttachmentsByWeaponModel(arg_40_0, arg_40_1)
	if CONDITIONS.InGame() then
		local var_40_0 = {}

		for iter_40_0 = 1, #arg_40_1 do
			local var_40_1 = tonumber(DYN_ATTACHMENT.GetDynamicAttachmentType(arg_40_1[iter_40_0]))

			if var_40_1 then
				var_40_0[var_40_1] = iter_40_0
			end
		end

		local var_40_2 = LUI.Split(arg_40_0, "+")

		for iter_40_1 = 2, #var_40_2 do
			local var_40_3 = var_40_2[iter_40_1]
			local var_40_4 = LUI.Split(var_40_3, "|")[1]

			if not var_40_0[tonumber(DYN_ATTACHMENT.GetDynamicAttachmentType(var_40_4))] then
				table.insert(arg_40_1, var_40_2[iter_40_1])
			end
		end

		return arg_40_1
	end
end

function DYN_ATTACHMENT.KillCamGetDynamicAttachmentRefTable(arg_41_0, arg_41_1)
	if CONDITIONS.InGame() then
		local var_41_0 = Game.BFEEGCHICA(arg_41_1, "ui_killcam_killedby_attachments_str")

		return (LUI.Split(var_41_0, "+"))
	end
end
