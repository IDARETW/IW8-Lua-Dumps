WATCH = WATCH or {}
WATCH.WatchNoneValue = "none"
WATCH.WatchStyle = {
	big = CSV.watches.cols.large,
	fem = CSV.watches.cols.fem
}

function WATCH.GetAllWatches(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = StringTable.BFHCAIIDA(CSV.watches.file)

	for iter_1_0 = 0, var_1_1 - 1 do
		local var_1_2 = CSV.ReadRow(CSV.watches, iter_1_0)

		if var_1_2 and var_1_2.hideInUI ~= "1" then
			var_1_2.isUnlocked = LOOT.IsUnlocked(arg_1_0, LOOT.itemTypes.WATCH, var_1_2.ref) or ref == WATCH.WatchNoneValue
			var_1_2.rarity = LOOT.GetItemQuality(LOOT.itemTypes.WATCH, var_1_2.ref)
			var_1_2.season, var_1_2.event, var_1_2.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.WATCH, var_1_2.ref)
			var_1_2.lootID = LOOT.GetItemID(LOOT.itemTypes.WATCH, var_1_2.ref)

			table.insert(var_1_0, var_1_2)
		end
	end

	return var_1_0
end

function WATCH.PlayerOwnsWatches(arg_2_0)
	local var_2_0 = StringTable.BFHCAIIDA(CSV.watches.file)

	for iter_2_0 = 0, var_2_0 - 1 do
		local var_2_1 = StringTable.CBGJCDIHCE(CSV.watches.file, iter_2_0, CSV.watches.cols.ref)

		if LOOT.IsUnlocked(arg_2_0, LOOT.itemTypes.WATCH, var_2_1) and var_2_1 ~= WATCH.WatchNoneValue then
			return true
		end
	end

	return false
end

function WATCH.GetEquippedWatch(arg_3_0)
	local var_3_0 = PlayerData.BFFBGAJGD(arg_3_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	return WATCH.GetRefForIndex(var_3_0.operatorWatch:get())
end

function WATCH.SetEquippedWatch(arg_4_0, arg_4_1, arg_4_2)
	PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorWatch:set(WATCH.GetIndexForRef(arg_4_1))
	WATCH.SetGimmeGesture(arg_4_0, arg_4_1, arg_4_2)
	WATCH.ToastEquipped(arg_4_0, "cac_equip_fill", WATCH.GetWatchName(arg_4_1))
end

function WATCH.SetGimmeGesture(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_5_1, CSV.watches.cols.gimmeGesture)
	local var_5_1 = WATCH.HasTwoGimmeSlots(arg_5_0, arg_5_1)
	local var_5_2 = WATCH.HasTwoGimmeSlots(arg_5_0, arg_5_2)

	if var_5_0 and #var_5_0 > 0 then
		if var_5_1 then
			local var_5_3 = LUI.Split(var_5_0, "|")
			local var_5_4 = var_5_3[1]
			local var_5_5 = var_5_3[2]

			if var_5_4 and #var_5_4 > 0 then
				GESTURES.SetEquippedByRef(arg_5_0, GESTURES.gimmeSlot, var_5_4)
			else
				GESTURES.SetEquippedByID(arg_5_0, GESTURES.gimmeSlot, LOOT.emptyID)
			end

			if var_5_5 and #var_5_5 > 0 then
				GESTURES.SetEquippedByRef(arg_5_0, GESTURES.gimmeSlotSecondary, var_5_5)
			else
				GESTURES.SetEquippedByID(arg_5_0, GESTURES.gimmeSlotSecondary, LOOT.emptyID)
			end
		else
			GESTURES.SetEquippedByRef(arg_5_0, GESTURES.gimmeSlot, var_5_0)
		end
	else
		GESTURES.SetEquippedByID(arg_5_0, GESTURES.gimmeSlot, LOOT.emptyID)
	end

	if var_5_2 and not var_5_1 then
		GESTURES.SetEquippedByID(arg_5_0, GESTURES.gimmeSlotSecondary, LOOT.emptyID)
	end
end

function WATCH.HasTwoGimmeSlots(arg_6_0, arg_6_1)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_6_1, CSV.watches.cols.gimmeGesture):find("|") ~= nil
end

function WATCH.IsAnyEquipped(arg_7_0)
	return WATCH.GetEquippedWatch(arg_7_0) ~= WATCH.WatchNoneValue
end

function WATCH.IsPetWatch(arg_8_0)
	local var_8_0 = StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_8_0, CSV.watches.cols.gscLogic)

	return var_8_0 == "pet" or var_8_0 == "pet_black"
end

function WATCH.IsTurboPetWatch(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_9_0, CSV.watches.cols.gscLogic) == "pet_turbo"
end

function WATCH.GetPetWatchType(arg_10_0)
	return (StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_10_0, CSV.watches.cols.gscLogic))
end

function WATCH.IsPreviewEnabled(arg_11_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_11_0, CSV.watches.cols.disablePreview) ~= "1"
end

function WATCH.GetWatchName(arg_12_0)
	assert(arg_12_0)

	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_12_0, CSV.watches.cols.name)
end

function WATCH.GetWatchDesc(arg_13_0)
	assert(arg_13_0)

	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_13_0, CSV.watches.cols.description)
end

function WATCH.GetWatchIcon(arg_14_0)
	assert(arg_14_0)

	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_14_0, CSV.watches.cols.image)
end

function WATCH.GetWatchLootIcon(arg_15_0)
	assert(arg_15_0)

	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_15_0, CSV.watches.cols.lootImage)
end

function WATCH.GetWatchSeason(arg_16_0)
	assert(arg_16_0)

	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_16_0, CSV.watches.cols.season)
end

function WATCH.GetOverride(arg_17_0, arg_17_1)
	local var_17_0 = LUI.Split(arg_17_0, "+")
	local var_17_1 = var_17_0[2] or arg_17_0
	local var_17_2 = StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.face, var_17_1, WATCH.WatchStyle[arg_17_1])

	if #var_17_0 > 0 then
		return var_17_0[1] .. "+" .. var_17_2
	end

	return var_17_2
end

function WATCH.GetRefForIndex(arg_18_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.index, arg_18_0, CSV.watches.cols.ref)
end

function WATCH.GetIndexForRef(arg_19_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_19_0, CSV.watches.cols.index))
end

function WATCH.IsWeaponWatch(arg_20_0)
	local var_20_0 = StringTable.BFHCAIIDA(CSV.watches.file)

	for iter_20_0 = 0, var_20_0 - 1 do
		if arg_20_0 == StringTable.CBGJCDIHCE(CSV.watches.file, iter_20_0, CSV.watches.cols.weaponRef) then
			return true
		end
	end

	return false
end

function WATCH.SetWatchModelIfLoaded(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Watch, false)
	ClientWeapon.CFJGGIAEJF(FrontEndScene.ClientWeapons.Watch, false)

	local var_21_0 = 0

	if arg_21_3 == "accessory098" then
		var_21_0 = 1
	end

	Engine.EBHIFJCGBH("holo_watch_frontend", var_21_0)

	if arg_21_3 ~= WATCH.WatchNoneValue then
		local var_21_1 = WATCH.GetFullModelName(arg_21_3)

		if var_21_1 and #var_21_1 > 0 then
			WATCH.CreateWidgetForWatch(arg_21_0, arg_21_1, arg_21_3)

			arg_21_2._nextWeaponModel = var_21_1

			if Streaming.DACIGAEDAE({
				arg_21_2._nextWeaponModel
			}, arg_21_1) then
				arg_21_2:SetWeaponModel(arg_21_2._nextWeaponModel)

				arg_21_2._nextWeaponModel = nil

				ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Watch, true)
				ClientWeapon.CFJGGIAEJF(FrontEndScene.ClientWeapons.Watch, true)
			else
				local var_21_2

				local function var_21_3()
					if arg_21_2._nextWeaponModel then
						if Streaming.DACIGAEDAE({
							arg_21_2._nextWeaponModel
						}, arg_21_1) then
							arg_21_2:SetWeaponModel(arg_21_2._nextWeaponModel)

							arg_21_2._nextWeaponModel = nil

							ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Watch, true)
							ClientWeapon.CFJGGIAEJF(FrontEndScene.ClientWeapons.Watch, true)
						else
							arg_21_2:Wait(100, true).onComplete = var_21_3
						end
					end
				end

				var_21_3()
			end
		end
	end
end

function WATCH.GetFullModelName(arg_23_0, arg_23_1)
	local var_23_0 = WATCH.GetWeaponName(arg_23_0)
	local var_23_1 = WATCH.GetAttachmentName(arg_23_0)
	local var_23_2 = WATCH.GetFaceName(arg_23_0)

	if var_23_0 and #var_23_0 > 0 and var_23_2 and #var_23_2 > 0 then
		if var_23_1 and #var_23_1 > 0 then
			if arg_23_1 then
				return var_23_0 .. "+" .. var_23_2 .. "+" .. var_23_1
			else
				return var_23_0 .. "+iw8_acc_attach_watch_gunbench+" .. var_23_2 .. "+" .. var_23_1
			end
		end

		if arg_23_1 then
			return var_23_0 .. "+" .. var_23_2
		else
			return var_23_0 .. "+iw8_acc_attach_watch_gunbench+" .. var_23_2
		end
	end

	return ""
end

function WATCH.GetWeaponName(arg_24_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_24_0, CSV.watches.cols.weaponRef)
end

function WATCH.GetAttachmentName(arg_25_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_25_0, CSV.watches.cols.attachmentRef)
end

function WATCH.GetWatchAsset(arg_26_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_26_0, CSV.watches.cols.asset)
end

function WATCH.GetFaceName(arg_27_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_27_0, CSV.watches.cols.face)
end

function WATCH.GetRTTDirtyCheck(arg_28_0)
	return StringTable.DIFCHIGDFB(CSV.watches.file, CSV.watches.cols.ref, arg_28_0, CSV.watches.cols.rttDirtyCheck)
end

function WATCH.CreateWidgetForWatch(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_0.accessoryUI then
		arg_29_0.accessoryUI:closeTree()

		arg_29_0.accessoryUI = nil
	end

	local var_29_0 = WATCH.GetWatchAsset(arg_29_2)

	if var_29_0 and #var_29_0 > 0 then
		local var_29_1 = Engine.DECICJIHF(arg_29_1, var_29_0)

		if var_29_1 and var_29_1 >= 0 then
			local var_29_2 = Engine.BBFJAICIBC(arg_29_1, var_29_1)
			local var_29_3 = Engine.ECDIACHEID(arg_29_1, var_29_1)
			local var_29_4 = Engine.DCCFDBGGEE(arg_29_1, var_29_1)
			local var_29_5 = Engine.CBGDIBDFHI(arg_29_1, var_29_1)

			if var_29_2 and #var_29_2 > 0 then
				if not MenuBuilder.IsTypeRegistered(var_29_2) then
					DebugPrint("ERROR: Attempting to use unknown accessory UI widget " .. var_29_2 .. ". Ensure this widget is properly included for your game mode!")

					return nil
				end

				local var_29_6 = MenuBuilder.BuildRegisteredType(var_29_2, {
					controllerIndex = arg_29_1,
					watchRef = arg_29_2
				})

				var_29_6.id = "Accessory"

				var_29_6:SetupRenderTarget("$rtt_watchlcd", var_29_3, var_29_4, var_29_5, 0, 0, 0, 0, arg_29_1)
				var_29_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_29_3 * _1080p, 0, var_29_4 * _1080p)

				local var_29_7 = WATCH.GetRTTDirtyCheck(arg_29_2) == "1"

				var_29_6:ActivateDirtyCheck(var_29_7)
				arg_29_0:addElement(var_29_6)

				arg_29_0.accessoryUI = var_29_6

				return true
			end
		end
	end

	return false
end

function WATCH.ToastEquipped(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = {
		displayTime = 2000,
		iconScale = -0.3,
		icon = #arg_30_1 > 0 and arg_30_1 or "hud_cmd_active_backer",
		description = Engine.CBBHFCGDIC(arg_30_2),
		controllerIndex = arg_30_0,
		header = Engine.CBBHFCGDIC("LUA_MENU/WATCH_EQUIPPED"),
		type = LUI.ToastManager.NotificationType.WatchEquipped,
		iconColor = SWATCHES.genericMenu.notificationHighlight
	}
	local var_30_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.ProcessEvent(var_30_1, {
		name = "send_toast_notification",
		immediate = true,
		options = var_30_0
	})
end
