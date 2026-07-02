module(..., package.seeall)

local var_0_0 = 100
local var_0_1

local function var_0_2(arg_1_0, arg_1_1)
	if not arg_1_0._quipAudioID then
		if not arg_1_1 or #arg_1_1 <= 0 or not Engine.DHGBFGBAIG(arg_1_1) then
			return
		end

		arg_1_0._quipAudioID = Engine.BJDBIAGIDA(arg_1_1)

		arg_1_0.AudioVFX:setImage(RegisterMaterial("ui_waveform_active"))
		arg_1_0.AudioVFX:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -173, _1080p * 83)

		if arg_1_0.PreviewButton then
			arg_1_0.PreviewButton:SetButtonDisabled(true)
		end
	end

	arg_1_0.AudioVFX:Wait(var_0_0, true).onComplete = function()
		if arg_1_0._quipAudioID and Engine.CHFEJIG(arg_1_0._quipAudioID) then
			var_0_2(arg_1_0)
		else
			arg_1_0._quipAudioID = nil

			arg_1_0.AudioVFX:setImage(RegisterMaterial("ui_waveform_idle"))
			arg_1_0.AudioVFX:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -109, _1080p * 19)

			if arg_1_0.PreviewButton then
				arg_1_0.PreviewButton:SetButtonDisabled(false)
			end
		end
	end
end

local function var_0_3(arg_3_0)
	if arg_3_0.PreviewButton then
		arg_3_0:RemoveElement(arg_3_0.PreviewButton)

		arg_3_0.PreviewButton = nil
	end

	ACTIONS.AnimateSequence(arg_3_0, "ConfigError")
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.PreviewButton then
		if arg_4_1 and arg_4_2 and (arg_4_2 == LOOT.itemTypes.QUIP or arg_4_2 == LOOT.itemTypes.VEHICLE_HORN) then
			if arg_4_2 == LOOT.itemTypes.QUIP then
				local var_4_0 = LOOT.GetItemRef(arg_4_2, arg_4_1)

				if not var_4_0 or #var_4_0 <= 0 then
					return var_0_3(arg_4_0)
				end

				local var_4_1 = OPERATOR.GetQuipAlias(var_4_0)

				if not var_4_1 or #var_4_1 <= 0 then
					return var_0_3(arg_4_0)
				end

				if not Engine.DHGBFGBAIG(var_4_1) then
					return var_0_3(arg_4_0)
				end

				arg_4_0.PreviewButton.quipAlias = var_4_1

				arg_4_0.PreviewButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
					var_0_2(arg_4_0, arg_5_0.quipAlias)
				end)
				arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					button_ref = "button_primary",
					priority = 2,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
					container = arg_4_0.Prompts
				})
			elseif arg_4_2 == LOOT.itemTypes.VEHICLE_HORN then
				local var_4_2 = LOOT.GetItemRef(arg_4_2, arg_4_1)

				if not var_4_2 or #var_4_2 <= 0 then
					return var_0_3(arg_4_0)
				end

				local var_4_3 = VEHICLE.GetHornPreviewAlias(var_4_2)

				if not var_4_3 or #var_4_3 <= 0 then
					return var_0_3(arg_4_0)
				end

				if not Engine.DHGBFGBAIG(var_4_3) then
					return var_0_3(arg_4_0)
				end

				arg_4_0.PreviewButton.hornAlias = var_4_3

				arg_4_0.PreviewButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
					var_0_2(arg_4_0, arg_6_0.hornAlias)
				end)
				arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					button_ref = "button_primary",
					priority = 2,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
					container = arg_4_0.Prompts
				})
			end
		else
			arg_4_0:RemoveElement(arg_4_0.PreviewButton)

			arg_4_0.PreviewButton = nil
		end
	end

	arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_4_0.Prompts
	})
end

local function var_0_5(arg_7_0)
	return function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = {
			ref = arg_7_0._tracks[arg_8_2 + 1]
		}

		var_8_0.alias = VEHICLE.GetTrackPreviewAlias(var_8_0.ref)
		var_8_0.packName = VEHICLE.GetTrackBattlePassPreviewName(var_8_0.ref)
		var_8_0.name = VEHICLE.GetTrackName(var_8_0.ref)
		var_8_0.index = arg_8_2 + 1

		arg_8_0:UpdateData(var_8_0, arg_7_0.AudioVFX)
	end
end

local function var_0_6(arg_9_0, arg_9_1)
	local var_9_0 = LOOT.GetItemRef(LOOT.itemTypes.VEHICLE_TRACK, arg_9_1)

	if not var_9_0 or #var_9_0 <= 0 then
		return var_0_3(arg_9_0)
	end

	local var_9_1 = VEHICLE.GetTrackPack(var_9_0)

	if not var_9_1 or #var_9_1 <= 0 then
		return var_0_3(arg_9_0)
	end

	arg_9_0._tracks = VEHICLE.GetAllTracksInPack(var_9_1)

	local var_9_2 = arg_9_0._tracks and #arg_9_0._tracks or 0

	arg_9_0.WarTrackGrid:SetNumChildren(var_9_2)
	arg_9_0.WarTrackGrid:SetRefreshChild(var_0_5(arg_9_0))
	arg_9_0.WarTrackGrid:RefreshContent()
	arg_9_0:addEventHandler("track_button_over", function(arg_10_0, arg_10_1)
		arg_9_0.EquipHint:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRACK_NUMBER", arg_10_1.trackIndex, #arg_9_0._tracks)))
		arg_9_0.EquipHint:SetAlpha(1)
	end)

	if arg_9_0._isVehicleTrackMenu and LOOT.IsUnlockedWithID(arg_9_0._controllerIndex, arg_9_1) then
		arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			button_ref = "button_alt1",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP_AND_CLOSE"),
			container = arg_9_0.Prompts
		})
		arg_9_0.bindButton:addEventHandler("button_alt1", function(arg_11_0, arg_11_1)
			if arg_9_0._menu and arg_9_0._isVehicleTrackMenu then
				arg_9_0._menu:EquipFocusedPack()
				Engine.BJDBIAGIDA(SOUND_SETS.default.action)
				LUI.FlowManager.RequestLeaveMenu(arg_9_0, true, true)
			end
		end)
	end

	arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"),
		container = arg_9_0.Prompts
	})
end

local function var_0_7(arg_12_0, arg_12_1, arg_12_2)
	if not arg_12_1 or not arg_12_2 then
		return
	end

	local var_12_0 = LOOT.GetItemRef(arg_12_2, arg_12_1)

	if not var_12_0 or #var_12_0 <= 0 then
		return
	end

	local var_12_1 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_12_1, CSV.bundleIDs.cols.isCollection)) == 1
	local var_12_2 = LOOT.GetItemImage(arg_12_2, var_12_0, arg_12_1)

	if var_12_2 and #var_12_2 > 0 then
		if arg_12_2 == LOOT.itemTypes.GESTURES then
			local var_12_3 = LOOT.GetItemImage(arg_12_2, var_12_0)

			arg_12_0.ForegroundImage:setImage(RegisterMaterial(var_12_3))
		elseif arg_12_2 == LOOT.itemTypes.BUNDLE then
			var_12_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_12_1, CSV.bundleIDs.cols.collectionPreviewImage)

			arg_12_0.ForegroundImage:setImage(RegisterMaterial(var_12_2))
		else
			arg_12_0.ForegroundImage:setImage(RegisterMaterial(var_12_2))
		end

		if arg_12_2 == LOOT.itemTypes.QUIP or arg_12_2 == LOOT.itemTypes.VEHICLE_HORN or arg_12_2 == LOOT.itemTypes.VEHICLE_TRACK then
			arg_12_0.BackgroundImage:SetMask(arg_12_0.QuipMask)
		end

		arg_12_0.BackgroundImage:setImage(RegisterMaterial(var_12_2))
	else
		return var_0_3(arg_12_0)
	end

	local var_12_4

	if var_12_0 == "battlepass" or var_12_0 == "t9_battlepass_purchase_s1" then
		var_12_4 = Engine.CBBHFCGDIC("BATTLEPASS/SEASON_X_BATTLEPASS", SEASON.GetLocalizedName())
	elseif var_12_1 then
		var_12_4 = LOOT.GetItemName(arg_12_2, var_12_0, arg_12_1)
	else
		var_12_4 = LOOT.GetItemName(arg_12_2, var_12_0)
	end

	if var_12_4 and #var_12_4 > 0 then
		arg_12_0.ItemName:setText(ToUpperCase(var_12_4))
	end

	local var_12_5

	if var_12_1 then
		if arg_12_1 == STORE.TomogunchiCharmCollection then
			ACTIONS.AnimateSequence(arg_12_0, "CharmCollection")

			var_12_5 = Engine.CBBHFCGDIC("STORE/COLLECTIONS_CHARMS_TOMOGUNCHI_TURBO_DESC")
		else
			var_12_5 = LOOT.GetItemClassName(arg_12_2, var_12_0, arg_12_1)
		end
	else
		var_12_5 = LOOT.GetItemClassName(arg_12_2, var_12_0)
	end

	if var_12_5 and #var_12_5 > 0 then
		arg_12_0.ItemType:setText(var_12_5)
	end

	local var_12_6

	if var_12_1 then
		var_12_6 = LOOT.GetItemQuality(arg_12_2, var_12_0, arg_12_1)
	else
		var_12_6 = LOOT.GetItemQuality(arg_12_2, var_12_0)
	end

	if not var_12_6 then
		return
	end

	local var_12_7 = LOOT.GetRarityImage(var_12_6)

	if var_12_7 and #var_12_7 > 0 then
		arg_12_0.RarityImage:setImage(RegisterMaterial(var_12_7))
	else
		arg_12_0.RarityImage:SetAlpha(0)
	end

	local var_12_8 = LOOT.GetRarityColor(var_12_6) or LOOT.GetDarkRarityColor(var_12_6)

	if var_12_8 then
		arg_12_0.ItemName:SetRGBFromTable(var_12_8)
		LOOT.ApplyRarityIconColoring(arg_12_0.RarityImage, var_12_6)
		arg_12_0.Gradient:SetRGBFromTable(var_12_8)
	end

	if Loot.DEBEIFJEEG(arg_12_0._controllerIndex, arg_12_1) > 0 then
		local var_12_9 = LAYOUT.GetTextWidth(arg_12_0.ItemName)
		local var_12_10 = LAYOUT.GetElementWidth(arg_12_0.CheckboxFrame)
		local var_12_11 = 16 * _1080p
		local var_12_12 = {
			arg_12_0.Checkbox,
			arg_12_0.CheckboxFrame
		}

		for iter_12_0 = 1, #var_12_12 do
			var_12_12[iter_12_0]:SetLeft(var_12_9 / 2 + var_12_11)
			var_12_12[iter_12_0]:SetRight(var_12_9 / 2 + var_12_11 + var_12_10)
			var_12_12[iter_12_0]:SetAlpha(1)
		end
	end
end

local function var_0_8(arg_13_0, arg_13_1, arg_13_2)
	arg_13_1 = tonumber(arg_13_1)

	if not arg_13_1 or arg_13_1 <= 0 then
		return var_0_3(arg_13_0)
	end

	if not arg_13_2 then
		return var_0_3(arg_13_0)
	end

	arg_13_0.WarTrackGrid:SetNumChildren(0)

	if arg_13_2 == LOOT.itemTypes.PLAYERCARD then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigPlayercard")
	elseif arg_13_2 == LOOT.itemTypes.EMBLEM then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigEmblem")
	elseif arg_13_2 == LOOT.itemTypes.SPRAYS then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigSpray")
	elseif arg_13_2 == LOOT.itemTypes.GESTURES then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigGesture")
	elseif arg_13_2 == LOOT.itemTypes.BATTLE_PASS then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigBPTierSkip")
		ACTIONS.AnimateSequence(arg_13_0, "BattlePassVersion")
	elseif arg_13_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigExecution")

		local var_13_0 = LOOT.GetItemRef(arg_13_2, arg_13_1)

		if OPERATOR.IsExecutionMWExclusive(var_13_0) then
			arg_13_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/MW_EXCLUSIVE_FINISHING_EQUIP_HINT"))
		elseif OPERATOR.IsExecutionT9Exclusive(var_13_0) then
			arg_13_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/T9_EXCLUSIVE_FINISHING_EQUIP_HINT"))
		elseif OPERATOR.IsExecutionS4Exclusive(var_13_0) then
			arg_13_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/S4_EXCLUSIVE_FINISHING_EQUIP_HINT"))
		end

		local var_13_1 = OPERATOR.GetExecutionVideo(var_13_0)

		Engine.DFCGFCGBFD(var_13_1, VideoPlaybackFlags.LOOP)
		arg_13_0:registerEventHandler("menu_close", function(arg_14_0, arg_14_1)
			if var_13_1 then
				Engine.EBCGADABJ()
			end
		end)
	elseif arg_13_2 == LOOT.itemTypes.QUIP or arg_13_2 == LOOT.itemTypes.VEHICLE_HORN then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigQuip")

		if arg_13_2 == LOOT.itemTypes.VEHICLE_HORN then
			arg_13_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/HORN_EQUIP_HINT"))
		elseif arg_13_2 == LOOT.itemTypes.VEHICLE_TRACK then
			arg_13_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/BATTLE_TRACK_EQUIP_HINT"))
		end

		arg_13_0:registerEventHandler("menu_close", function(arg_15_0, arg_15_1)
			if arg_15_0._quipAudioID then
				Engine.EAGBECEBGA(arg_15_0._quipAudioID)
			end
		end)
	elseif arg_13_2 == LOOT.itemTypes.BUNDLE then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigCollection")
	elseif arg_13_2 == LOOT.itemTypes.VEHICLE_TRACK then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigTrack")
		arg_13_0.EquipHint:SetAlpha(0)
		var_0_6(arg_13_0, arg_13_1)
	elseif arg_13_2 == LOOT.itemTypes.CAMO then
		ACTIONS.AnimateSequence(arg_13_0, "ConfigCamo")
	else
		return var_0_3(arg_13_0)
	end

	var_0_7(arg_13_0, arg_13_1, arg_13_2)
	var_0_4(arg_13_0, arg_13_1, arg_13_2)
end

local function var_0_9(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_2.lootID)
	assert(arg_16_2.lootType)

	arg_16_0._controllerIndex = arg_16_1
	arg_16_0._menu = arg_16_2.menu
	arg_16_0._isVehicleTrackMenu = arg_16_2.isVehicleTrackMenu

	arg_16_0.BackgroundImage:SetMask(arg_16_0.Mask)
	var_0_8(arg_16_0, arg_16_2.lootID, arg_16_2.lootType)

	if arg_16_2.isBattlePass then
		ACTIONS.AnimateSequence(arg_16_0, "BattlePassVersion")
		BATTLEPASS.AddPurchasePrompt(arg_16_0, arg_16_1, arg_16_0.Prompts, 10)
	end

	local var_16_0 = arg_16_2.bundleData

	if arg_16_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_16_0.isBundlePurchased then
		arg_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			button_ref = "button_alt1",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE"),
			container = arg_16_0.Prompts
		})
		arg_16_0.bindButton:addEventHandler("button_alt1", function(arg_17_0, arg_17_1)
			STORE.OpenQuickPurchasePopupInPreview(var_16_0)
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_16_0, arg_16_1)
	ACTIONS.ScaleFullscreen(arg_16_0.Darkener)
end

function StorePreviewItemPopup(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "StorePreviewItemPopup"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Darkener"

	var_18_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_18_4:SetAlpha(0.97, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Darkener = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "Prompts"

	if CONDITIONS.AlwaysFalse() then
		var_18_6.Label:setText("Select/Back", 0)
	end

	var_18_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -730, _1080p * 350, _1080p * 381)
	var_18_0:addElement(var_18_6)

	var_18_0.Prompts = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "GenericPopupWindow"

	var_18_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * 860, _1080p * -340, _1080p * 340)
	var_18_0:addElement(var_18_8)

	var_18_0.GenericPopupWindow = var_18_8

	local var_18_9
	local var_18_10 = LUI.UIImage.new()

	var_18_10.id = "BackgroundImage"

	var_18_10:SetAlpha(0.1, 0)
	var_18_10:SetScale(1, 0)
	var_18_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_18_0:addElement(var_18_10)

	var_18_0.BackgroundImage = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIImage.new()

	var_18_12.id = "Gradient"

	var_18_12:SetAlpha(0.25, 0)
	var_18_12:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_18_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 130, _1080p * -130, _1080p * -96, _1080p * 96)
	var_18_0:addElement(var_18_12)

	var_18_0.Gradient = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIImage.new()

	var_18_14.id = "AudioVFX"

	var_18_14:SetAlpha(0, 0)
	var_18_14:SetScale(0.5, 0)
	var_18_14:setImage(RegisterMaterial("ui_waveform_idle"), 0)
	var_18_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -64, _1080p * 64)
	var_18_0:addElement(var_18_14)

	var_18_0.AudioVFX = var_18_14

	local var_18_15
	local var_18_16 = LUI.UIImage.new()

	var_18_16.id = "ForegroundImage"

	var_18_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_18_0:addElement(var_18_16)

	var_18_0.ForegroundImage = var_18_16

	local var_18_17
	local var_18_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_18_1
	})

	var_18_18.id = "PreviewButton"

	var_18_18.Text:SetLeft(_1080p * 20, 0)
	var_18_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"), 0)
	var_18_18.Text:SetAlignment(LUI.Alignment.Center)
	var_18_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * 272, _1080p * 310)
	var_18_0:addElement(var_18_18)

	var_18_0.PreviewButton = var_18_18

	local var_18_19
	local var_18_20 = LUI.UIImage.new()

	var_18_20.id = "RarityImage"

	var_18_20:SetRGBFromTable(SWATCHES.itemRarity.qualityBase, 0)
	var_18_20:setImage(RegisterMaterial("icon_rarity_1"), 0)
	var_18_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * 153, _1080p * 217)
	var_18_0:addElement(var_18_20)

	var_18_0.RarityImage = var_18_20

	local var_18_21
	local var_18_22 = LUI.UIStyledText.new()

	var_18_22.id = "ItemName"

	var_18_22:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_18_22:setText("", 0)
	var_18_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_22:SetWordWrap(false)
	var_18_22:SetAlignment(LUI.Alignment.Center)
	var_18_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_22:SetStartupDelay(2000)
	var_18_22:SetLineHoldTime(400)
	var_18_22:SetAnimMoveTime(2000)
	var_18_22:SetAnimMoveSpeed(150)
	var_18_22:SetEndDelay(2000)
	var_18_22:SetCrossfadeTime(250)
	var_18_22:SetFadeInTime(300)
	var_18_22:SetFadeOutTime(300)
	var_18_22:SetMaxVisibleLines(1)
	var_18_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * 227, _1080p * 277)
	var_18_0:addElement(var_18_22)

	var_18_0.ItemName = var_18_22

	local var_18_23
	local var_18_24 = LUI.UIStyledText.new()

	var_18_24.id = "ItemType"

	var_18_24:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_18_24:SetAlpha(0.75, 0)
	var_18_24:setText("", 0)
	var_18_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_24:SetWordWrap(false)
	var_18_24:SetTracking(1 * _1080p, 0)
	var_18_24:SetAlignment(LUI.Alignment.Center)
	var_18_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_24:SetStartupDelay(2000)
	var_18_24:SetLineHoldTime(400)
	var_18_24:SetAnimMoveTime(2000)
	var_18_24:SetAnimMoveSpeed(150)
	var_18_24:SetEndDelay(2000)
	var_18_24:SetCrossfadeTime(1000)
	var_18_24:SetFadeInTime(300)
	var_18_24:SetFadeOutTime(300)
	var_18_24:SetMaxVisibleLines(1)
	var_18_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * 277, _1080p * 305)
	var_18_0:addElement(var_18_24)

	var_18_0.ItemType = var_18_24

	local var_18_25
	local var_18_26 = LUI.UIText.new()

	var_18_26.id = "Title"

	var_18_26:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_18_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")), 0)
	var_18_26:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_18_26:SetAlignment(LUI.Alignment.Center)
	var_18_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -280, _1080p * -220)
	var_18_0:addElement(var_18_26)

	var_18_0.Title = var_18_26

	local var_18_27
	local var_18_28 = LUI.UIText.new()

	var_18_28.id = "ErrorMessage"

	var_18_28:SetRGBFromInt(16711680, 0)
	var_18_28:SetAlpha(0, 0)
	var_18_28:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CONFIG_ERROR"), 0)
	var_18_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_28:SetWordWrap(false)
	var_18_28:SetAlignment(LUI.Alignment.Center)
	var_18_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -18, _1080p * 18)
	var_18_0:addElement(var_18_28)

	var_18_0.ErrorMessage = var_18_28

	local var_18_29
	local var_18_30 = LUI.UIImage.new()

	var_18_30.id = "Mask"

	var_18_30:setImage(RegisterMaterial("stencil_mask"), 0)
	var_18_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -341, _1080p * 341)
	var_18_0:addElement(var_18_30)

	var_18_0.Mask = var_18_30

	local var_18_31
	local var_18_32 = LUI.UIImage.new()

	var_18_32.id = "QuipMask"

	var_18_32:SetAlpha(0, 0)
	var_18_32:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_18_32:SetUMin(-3, 0)
	var_18_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * -350, _1080p * -350, _1080p * 350)
	var_18_0:addElement(var_18_32)

	var_18_0.QuipMask = var_18_32

	local var_18_33
	local var_18_34 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_18_1
	})

	var_18_34.id = "Cinematic"

	var_18_34:SetAlpha(0, 0)
	var_18_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -264, _1080p * 264, _1080p * -184, _1080p * 112)
	var_18_0:addElement(var_18_34)

	var_18_0.Cinematic = var_18_34

	local var_18_35
	local var_18_36 = LUI.UIText.new()

	var_18_36.id = "EquipHint"

	var_18_36:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_18_36:SetAlpha(0, 0)
	var_18_36:setText("", 0)
	var_18_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_36:SetWordWrap(false)
	var_18_36:SetAlignment(LUI.Alignment.Center)
	var_18_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -264, _1080p * 264, _1080p * 314, _1080p * 332)
	var_18_0:addElement(var_18_36)

	var_18_0.EquipHint = var_18_36

	local var_18_37
	local var_18_38 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_18_39 = LUI.UIBorder.new(var_18_38)

	var_18_39.id = "CheckboxFrame"

	var_18_39:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_18_39:SetAlpha(0, 0)
	var_18_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 300, _1080p * 324, _1080p * 240, _1080p * 264)
	var_18_0:addElement(var_18_39)

	var_18_0.CheckboxFrame = var_18_39

	local var_18_40
	local var_18_41 = LUI.UIImage.new()

	var_18_41.id = "Checkbox"

	var_18_41:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_18_41:SetAlpha(0, 0)
	var_18_41:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_18_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 300, _1080p * 324, _1080p * 240, _1080p * 264)
	var_18_0:addElement(var_18_41)

	var_18_0.Checkbox = var_18_41

	local var_18_42
	local var_18_43 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("VehicleTrack", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 400,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_18_44 = LUI.UIGrid.new(var_18_43)

	var_18_44.id = "WarTrackGrid"

	var_18_44:SetAlpha(0, 0)
	var_18_44:setUseStencil(true)
	var_18_44:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -253, _1080p * 253, _1080p * -220, _1080p * 128)
	var_18_0:addElement(var_18_44)

	var_18_0.WarTrackGrid = var_18_44

	local function var_18_45()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_45

	local var_18_46
	local var_18_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigError", var_18_47)

	local var_18_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ConfigError", var_18_48)

	local var_18_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigError", var_18_49)

	local var_18_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_18:RegisterAnimationSequence("ConfigError", var_18_50)

	local var_18_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("ConfigError", var_18_51)

	local var_18_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_22:RegisterAnimationSequence("ConfigError", var_18_52)

	local var_18_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("ConfigError", var_18_53)

	local var_18_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_28:RegisterAnimationSequence("ConfigError", var_18_54)

	local function var_18_55()
		var_18_10:AnimateSequence("ConfigError")
		var_18_12:AnimateSequence("ConfigError")
		var_18_16:AnimateSequence("ConfigError")
		var_18_18:AnimateSequence("ConfigError")
		var_18_20:AnimateSequence("ConfigError")
		var_18_22:AnimateSequence("ConfigError")
		var_18_24:AnimateSequence("ConfigError")
		var_18_28:AnimateSequence("ConfigError")
	end

	var_18_0._sequences.ConfigError = var_18_55

	local var_18_56
	local var_18_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			value = 4.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigPlayercard", var_18_57)

	local var_18_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigPlayercard", var_18_58)

	local function var_18_59()
		var_18_10:AnimateSequence("ConfigPlayercard")
		var_18_16:AnimateSequence("ConfigPlayercard")
	end

	var_18_0._sequences.ConfigPlayercard = var_18_59

	local var_18_60
	local var_18_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigEmblem", var_18_61)

	local var_18_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigEmblem", var_18_62)

	local function var_18_63()
		var_18_10:AnimateSequence("ConfigEmblem")
		var_18_16:AnimateSequence("ConfigEmblem")
	end

	var_18_0._sequences.ConfigEmblem = var_18_63

	local var_18_64
	local var_18_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigSpray", var_18_65)

	local var_18_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigSpray", var_18_66)

	local function var_18_67()
		var_18_10:AnimateSequence("ConfigSpray")
		var_18_16:AnimateSequence("ConfigSpray")
	end

	var_18_0._sequences.ConfigSpray = var_18_67

	local var_18_68
	local var_18_69 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -904
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 400
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigQuip", var_18_69)

	local var_18_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -141
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		}
	}

	var_18_12:RegisterAnimationSequence("ConfigQuip", var_18_70)

	local var_18_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("ConfigQuip", var_18_71)

	local var_18_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigQuip", var_18_72)

	local var_18_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_18_18:RegisterAnimationSequence("ConfigQuip", var_18_73)

	local var_18_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		}
	}

	var_18_20:RegisterAnimationSequence("ConfigQuip", var_18_74)

	local var_18_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 204
		}
	}

	var_18_22:RegisterAnimationSequence("ConfigQuip", var_18_75)

	local var_18_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 232
		}
	}

	var_18_24:RegisterAnimationSequence("ConfigQuip", var_18_76)

	local var_18_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -350
		}
	}

	var_18_32:RegisterAnimationSequence("ConfigQuip", var_18_77)

	local var_18_78 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/QUIP_EQUIP_HINT")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 245
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 263
		}
	}

	var_18_36:RegisterAnimationSequence("ConfigQuip", var_18_78)

	local var_18_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 191
		}
	}

	var_18_39:RegisterAnimationSequence("ConfigQuip", var_18_79)

	local var_18_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 191
		}
	}

	var_18_41:RegisterAnimationSequence("ConfigQuip", var_18_80)

	local function var_18_81()
		var_18_10:AnimateSequence("ConfigQuip")
		var_18_12:AnimateSequence("ConfigQuip")
		var_18_14:AnimateSequence("ConfigQuip")
		var_18_16:AnimateSequence("ConfigQuip")
		var_18_18:AnimateSequence("ConfigQuip")
		var_18_20:AnimateSequence("ConfigQuip")
		var_18_22:AnimateSequence("ConfigQuip")
		var_18_24:AnimateSequence("ConfigQuip")
		var_18_32:AnimateSequence("ConfigQuip")
		var_18_36:AnimateSequence("ConfigQuip")
		var_18_39:AnimateSequence("ConfigQuip")
		var_18_41:AnimateSequence("ConfigQuip")
	end

	var_18_0._sequences.ConfigQuip = var_18_81

	local var_18_82
	local var_18_83 = {
		{
			value = 1.65,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigExecution", var_18_83)

	local var_18_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128
		}
	}

	var_18_12:RegisterAnimationSequence("ConfigExecution", var_18_84)

	local var_18_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigExecution", var_18_85)

	local var_18_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 263
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 301
		}
	}

	var_18_18:RegisterAnimationSequence("ConfigExecution", var_18_86)

	local var_18_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 208
		}
	}

	var_18_20:RegisterAnimationSequence("ConfigExecution", var_18_87)

	local var_18_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 268
		}
	}

	var_18_22:RegisterAnimationSequence("ConfigExecution", var_18_88)

	local var_18_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 296
		}
	}

	var_18_24:RegisterAnimationSequence("ConfigExecution", var_18_89)

	local var_18_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_34:RegisterAnimationSequence("ConfigExecution", var_18_90)

	local var_18_91 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/FINISHING_EQUIP_HINT")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 314
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 332
		}
	}

	var_18_36:RegisterAnimationSequence("ConfigExecution", var_18_91)

	local var_18_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 255
		}
	}

	var_18_39:RegisterAnimationSequence("ConfigExecution", var_18_92)

	local var_18_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 255
		}
	}

	var_18_41:RegisterAnimationSequence("ConfigExecution", var_18_93)

	local function var_18_94()
		var_18_10:AnimateSequence("ConfigExecution")
		var_18_12:AnimateSequence("ConfigExecution")
		var_18_16:AnimateSequence("ConfigExecution")
		var_18_18:AnimateSequence("ConfigExecution")
		var_18_20:AnimateSequence("ConfigExecution")
		var_18_22:AnimateSequence("ConfigExecution")
		var_18_24:AnimateSequence("ConfigExecution")
		var_18_34:AnimateSequence("ConfigExecution")
		var_18_36:AnimateSequence("ConfigExecution")
		var_18_39:AnimateSequence("ConfigExecution")
		var_18_41:AnimateSequence("ConfigExecution")
	end

	var_18_0._sequences.ConfigExecution = var_18_94

	local var_18_95
	local var_18_96 = {
		{
			value = 2.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigGesture", var_18_96)

	local var_18_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigGesture", var_18_97)

	local function var_18_98()
		var_18_10:AnimateSequence("ConfigGesture")
		var_18_16:AnimateSequence("ConfigGesture")
	end

	var_18_0._sequences.ConfigGesture = var_18_98

	local var_18_99
	local var_18_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped,
			child = var_18_0.GenericPopupWindow.PopupBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_18_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_18_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_18_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_18_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_18_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_18_0.GenericPopupWindow.BotBorder
		}
	}

	var_18_8:RegisterAnimationSequence("BattlePassVersion", var_18_100)

	local var_18_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		}
	}

	var_18_26:RegisterAnimationSequence("BattlePassVersion", var_18_101)

	local function var_18_102()
		var_18_8:AnimateSequence("BattlePassVersion")
		var_18_26:AnimateSequence("BattlePassVersion")
	end

	var_18_0._sequences.BattlePassVersion = var_18_102

	local var_18_103
	local var_18_104 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigBPTierSkip", var_18_104)

	local var_18_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigBPTierSkip", var_18_105)

	local function var_18_106()
		var_18_10:AnimateSequence("ConfigBPTierSkip")
		var_18_16:AnimateSequence("ConfigBPTierSkip")
	end

	var_18_0._sequences.ConfigBPTierSkip = var_18_106

	local var_18_107
	local var_18_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigCollection", var_18_108)

	local var_18_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigCollection", var_18_109)

	local var_18_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_22:RegisterAnimationSequence("ConfigCollection", var_18_110)

	local var_18_111 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("ConfigCollection", var_18_111)

	local function var_18_112()
		var_18_10:AnimateSequence("ConfigCollection")
		var_18_16:AnimateSequence("ConfigCollection")
		var_18_22:AnimateSequence("ConfigCollection")
		var_18_24:AnimateSequence("ConfigCollection")
	end

	var_18_0._sequences.ConfigCollection = var_18_112

	local var_18_113
	local var_18_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("CharmCollection", var_18_114)

	local var_18_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("CharmCollection", var_18_115)

	local var_18_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 740
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("CharmCollection", var_18_116)

	local var_18_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_22:RegisterAnimationSequence("CharmCollection", var_18_117)

	local var_18_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("CharmCollection", var_18_118)

	local function var_18_119()
		var_18_10:AnimateSequence("CharmCollection")
		var_18_12:AnimateSequence("CharmCollection")
		var_18_16:AnimateSequence("CharmCollection")
		var_18_22:AnimateSequence("CharmCollection")
		var_18_24:AnimateSequence("CharmCollection")
	end

	var_18_0._sequences.CharmCollection = var_18_119

	local var_18_120
	local var_18_121 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -904
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 400
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigTrack", var_18_121)

	local var_18_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -239
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 159
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ConfigTrack", var_18_122)

	local var_18_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 168
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_14:RegisterAnimationSequence("ConfigTrack", var_18_123)

	local var_18_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigTrack", var_18_124)

	local var_18_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_18_18:RegisterAnimationSequence("ConfigTrack", var_18_125)

	local var_18_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 241
		}
	}

	var_18_20:RegisterAnimationSequence("ConfigTrack", var_18_126)

	local var_18_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 301
		}
	}

	var_18_22:RegisterAnimationSequence("ConfigTrack", var_18_127)

	local var_18_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		}
	}

	var_18_24:RegisterAnimationSequence("ConfigTrack", var_18_128)

	local var_18_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -255
		}
	}

	var_18_26:RegisterAnimationSequence("ConfigTrack", var_18_129)

	local var_18_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -350
		}
	}

	var_18_32:RegisterAnimationSequence("ConfigTrack", var_18_130)

	local var_18_131 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/QUIP_EQUIP_HINT")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -264
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 264
		}
	}

	var_18_36:RegisterAnimationSequence("ConfigTrack", var_18_131)

	local var_18_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 191
		}
	}

	var_18_39:RegisterAnimationSequence("ConfigTrack", var_18_132)

	local var_18_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 191
		}
	}

	var_18_41:RegisterAnimationSequence("ConfigTrack", var_18_133)

	local var_18_134 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 125
		}
	}

	var_18_44:RegisterAnimationSequence("ConfigTrack", var_18_134)

	local function var_18_135()
		var_18_10:AnimateSequence("ConfigTrack")
		var_18_12:AnimateSequence("ConfigTrack")
		var_18_14:AnimateSequence("ConfigTrack")
		var_18_16:AnimateSequence("ConfigTrack")
		var_18_18:AnimateSequence("ConfigTrack")
		var_18_20:AnimateSequence("ConfigTrack")
		var_18_22:AnimateSequence("ConfigTrack")
		var_18_24:AnimateSequence("ConfigTrack")
		var_18_26:AnimateSequence("ConfigTrack")
		var_18_32:AnimateSequence("ConfigTrack")
		var_18_36:AnimateSequence("ConfigTrack")
		var_18_39:AnimateSequence("ConfigTrack")
		var_18_41:AnimateSequence("ConfigTrack")
		var_18_44:AnimateSequence("ConfigTrack")
	end

	var_18_0._sequences.ConfigTrack = var_18_135

	local var_18_136
	local var_18_137 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ConfigCamo", var_18_137)

	local var_18_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_18_16:RegisterAnimationSequence("ConfigCamo", var_18_138)

	local function var_18_139()
		var_18_10:AnimateSequence("ConfigCamo")
		var_18_16:AnimateSequence("ConfigCamo")
	end

	var_18_0._sequences.ConfigCamo = var_18_139

	local var_18_140 = LUI.UIBindButton.new()

	var_18_140.id = "selfBindButton"

	var_18_0:addElement(var_18_140)

	var_18_0.bindButton = var_18_140

	var_18_0.bindButton:addEventHandler("button_secondary", function(arg_35_0, arg_35_1)
		if not arg_35_1.controller then
			local var_35_0 = var_18_1
		end

		ACTIONS.LeaveMenu(var_18_0)
	end)
	var_0_9(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("StorePreviewItemPopup", StorePreviewItemPopup)
LockTable(_M)
