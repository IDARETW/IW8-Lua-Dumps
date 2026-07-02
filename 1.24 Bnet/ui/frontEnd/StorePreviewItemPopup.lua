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
		if arg_4_1 and arg_4_2 and (arg_4_2 == LOOT.itemTypes.QUIP or arg_4_2 == LOOT.itemTypes.VEHICLE_HORN or arg_4_2 == LOOT.itemTypes.VEHICLE_TRACK) then
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
			elseif arg_4_2 == LOOT.itemTypes.VEHICLE_TRACK then
				local var_4_4 = LOOT.GetItemRef(arg_4_2, arg_4_1)

				if not var_4_4 or #var_4_4 <= 0 then
					return var_0_3(arg_4_0)
				end

				local var_4_5 = VEHICLE.GetTrackBattlePassPreviewAlias(var_4_4)

				if not var_4_5 or #var_4_5 <= 0 then
					return var_0_3(arg_4_0)
				end

				if not Engine.DHGBFGBAIG(var_4_5) then
					return var_0_3(arg_4_0)
				end

				arg_4_0.PreviewButton.trackAlias = var_4_5

				arg_4_0.PreviewButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
					var_0_2(arg_4_0, arg_7_0.trackAlias)
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

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	if not arg_8_1 or not arg_8_2 then
		return
	end

	local var_8_0 = LOOT.GetItemRef(arg_8_2, arg_8_1)

	if not var_8_0 or #var_8_0 <= 0 then
		return
	end

	local var_8_1 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_8_1, CSV.bundleIDs.cols.isCollection)) == 1
	local var_8_2 = LOOT.GetItemImage(arg_8_2, var_8_0, arg_8_1)

	if var_8_2 and #var_8_2 > 0 then
		if arg_8_2 == LOOT.itemTypes.GESTURES then
			local var_8_3 = LOOT.GetItemImage(arg_8_2, var_8_0)

			arg_8_0.ForegroundImage:setImage(RegisterMaterial(var_8_3))
		elseif arg_8_2 == LOOT.itemTypes.BUNDLE then
			var_8_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_8_1, CSV.bundleIDs.cols.collectionPreviewImage)

			arg_8_0.ForegroundImage:setImage(RegisterMaterial(var_8_2))
		else
			arg_8_0.ForegroundImage:setImage(RegisterMaterial(var_8_2))
		end

		if arg_8_2 == LOOT.itemTypes.QUIP or arg_8_2 == LOOT.itemTypes.VEHICLE_HORN or arg_8_2 == LOOT.itemTypes.VEHICLE_TRACK then
			arg_8_0.BackgroundImage:SetMask(arg_8_0.QuipMask)
		end

		arg_8_0.BackgroundImage:setImage(RegisterMaterial(var_8_2))
	else
		return var_0_3(arg_8_0)
	end

	local var_8_4

	if var_8_0 == "battlepass" then
		local var_8_5 = SEASON.GetCurrentSeason()

		var_8_4 = Engine.CBBHFCGDIC("BATTLEPASS/SEASON_X_BATTLEPASS", var_8_5)
	elseif var_8_1 then
		var_8_4 = LOOT.GetItemName(arg_8_2, var_8_0, arg_8_1)
	else
		var_8_4 = LOOT.GetItemName(arg_8_2, var_8_0)
	end

	if var_8_4 and #var_8_4 > 0 then
		arg_8_0.ItemName:setText(ToUpperCase(var_8_4))
	end

	local var_8_6

	if var_8_1 then
		if arg_8_1 == STORE.TomogunchiCharmCollection then
			ACTIONS.AnimateSequence(arg_8_0, "CharmCollection")

			var_8_6 = Engine.CBBHFCGDIC("STORE/COLLECTIONS_CHARMS_TOMOGUNCHI_TURBO_DESC")
		else
			var_8_6 = LOOT.GetItemClassName(arg_8_2, var_8_0, arg_8_1)
		end
	else
		var_8_6 = LOOT.GetItemClassName(arg_8_2, var_8_0)
	end

	if var_8_6 and #var_8_6 > 0 then
		arg_8_0.ItemType:setText(var_8_6)
	end

	local var_8_7

	if var_8_1 then
		var_8_7 = LOOT.GetItemQuality(arg_8_2, var_8_0, arg_8_1)
	else
		var_8_7 = LOOT.GetItemQuality(arg_8_2, var_8_0)
	end

	if not var_8_7 then
		return
	end

	local var_8_8 = LOOT.GetRarityImage(var_8_7)

	if var_8_8 and #var_8_8 > 0 then
		arg_8_0.RarityImage:setImage(RegisterMaterial(var_8_8))
	else
		arg_8_0.RarityImage:SetAlpha(0)
	end

	local var_8_9 = LOOT.GetRarityColor(var_8_7) or LOOT.GetDarkRarityColor(var_8_7)

	if var_8_9 then
		arg_8_0.ItemName:SetRGBFromTable(var_8_9)
		arg_8_0.RarityImage:SetRGBFromTable(var_8_9)
		arg_8_0.Gradient:SetRGBFromTable(var_8_9)
	end

	if Loot.DEBEIFJEEG(arg_8_0._controllerIndex, arg_8_1) > 0 then
		local var_8_10 = LAYOUT.GetTextWidth(arg_8_0.ItemName)
		local var_8_11 = LAYOUT.GetElementWidth(arg_8_0.CheckboxFrame)
		local var_8_12 = 16 * _1080p
		local var_8_13 = {
			arg_8_0.Checkbox,
			arg_8_0.CheckboxFrame
		}

		for iter_8_0 = 1, #var_8_13 do
			var_8_13[iter_8_0]:SetLeft(var_8_10 / 2 + var_8_12)
			var_8_13[iter_8_0]:SetRight(var_8_10 / 2 + var_8_12 + var_8_11)
			var_8_13[iter_8_0]:SetAlpha(1)
		end
	end
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	arg_9_1 = tonumber(arg_9_1)

	if not arg_9_1 or arg_9_1 <= 0 then
		return var_0_3(arg_9_0)
	end

	if not arg_9_2 then
		return var_0_3(arg_9_0)
	end

	if arg_9_2 == LOOT.itemTypes.PLAYERCARD then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigPlayercard")
	elseif arg_9_2 == LOOT.itemTypes.EMBLEM then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigEmblem")
	elseif arg_9_2 == LOOT.itemTypes.SPRAYS then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigSpray")
	elseif arg_9_2 == LOOT.itemTypes.GESTURES then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigGesture")
	elseif arg_9_2 == LOOT.itemTypes.BATTLE_PASS then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigBPTierSkip")
		ACTIONS.AnimateSequence(arg_9_0, "BattlePassVersion")
	elseif arg_9_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigExecution")

		local var_9_0 = LOOT.GetItemRef(arg_9_2, arg_9_1)

		if OPERATOR.IsExecutionGlobal(var_9_0) then
			arg_9_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/UNIVERSAL_FINISHING_EQUIP_HINT"))
		end

		local var_9_1 = OPERATOR.GetExecutionVideo(var_9_0)

		Engine.DFCGFCGBFD(var_9_1, VideoPlaybackFlags.LOOP)
		arg_9_0:registerEventHandler("menu_close", function(arg_10_0, arg_10_1)
			if var_9_1 then
				Engine.EBCGADABJ()
			end
		end)
	elseif arg_9_2 == LOOT.itemTypes.QUIP or arg_9_2 == LOOT.itemTypes.VEHICLE_HORN or arg_9_2 == LOOT.itemTypes.VEHICLE_TRACK then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigQuip")

		if arg_9_2 == LOOT.itemTypes.VEHICLE_HORN then
			arg_9_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/HORN_EQUIP_HINT"))
		elseif arg_9_2 == LOOT.itemTypes.VEHICLE_TRACK then
			arg_9_0.EquipHint:setText(Engine.CBBHFCGDIC("LUA_MENU/BATTLE_TRACK_EQUIP_HINT"))
		end

		arg_9_0:registerEventHandler("menu_close", function(arg_11_0, arg_11_1)
			if arg_11_0._quipAudioID then
				Engine.EAGBECEBGA(arg_11_0._quipAudioID)
			end
		end)
	elseif arg_9_2 == LOOT.itemTypes.BUNDLE then
		ACTIONS.AnimateSequence(arg_9_0, "ConfigCollection")
	else
		return var_0_3(arg_9_0)
	end

	var_0_5(arg_9_0, arg_9_1, arg_9_2)
	var_0_4(arg_9_0, arg_9_1, arg_9_2)
end

local function var_0_7(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_2.lootID)
	assert(arg_12_2.lootType)

	arg_12_0._controllerIndex = arg_12_1

	arg_12_0.BackgroundImage:SetMask(arg_12_0.Mask)
	var_0_6(arg_12_0, arg_12_2.lootID, arg_12_2.lootType)

	if arg_12_2.isBattlePass then
		ACTIONS.AnimateSequence(arg_12_0, "BattlePassVersion")
	end

	if arg_12_2.isBattlePass then
		BATTLEPASS.AddPurchasePrompt(arg_12_0, arg_12_1, arg_12_0.Prompts, 10)
	end

	local var_12_0 = arg_12_2.bundleData

	if arg_12_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_12_0.isBundlePurchased then
		arg_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			button_ref = "button_alt1",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE"),
			container = arg_12_0.Prompts
		})
		arg_12_0.bindButton:addEventHandler("button_alt1", function(arg_13_0, arg_13_1)
			STORE.OpenQuickPurchasePopupInPreview(var_12_0)
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_12_0, arg_12_1)
	ACTIONS.ScaleFullscreen(arg_12_0.Darkener)
end

function StorePreviewItemPopup(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "StorePreviewItemPopup"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	var_14_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})
	var_14_0.HelperBar.id = "HelperBar"

	var_14_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_14_0.HelperBar:setPriority(10)
	var_14_0:addElement(var_14_0.HelperBar)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "Darkener"

	var_14_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_4:SetAlpha(0.97, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.Darkener = var_14_4

	local var_14_5
	local var_14_6 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_14_1
	})

	var_14_6.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_14_0) then
		var_14_6.Label:setText("Select/Back", 0)
	end

	var_14_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -730, _1080p * 350, _1080p * 381)
	var_14_0:addElement(var_14_6)

	var_14_0.Prompts = var_14_6

	local var_14_7
	local var_14_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_14_1
	})

	var_14_8.id = "GenericPopupWindow"

	var_14_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * 860, _1080p * -340, _1080p * 340)
	var_14_0:addElement(var_14_8)

	var_14_0.GenericPopupWindow = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIImage.new()

	var_14_10.id = "BackgroundImage"

	var_14_10:SetAlpha(0.1, 0)
	var_14_10:SetScale(1, 0)
	var_14_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_14_0:addElement(var_14_10)

	var_14_0.BackgroundImage = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "Gradient"

	var_14_12:SetAlpha(0.25, 0)
	var_14_12:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_14_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 130, _1080p * -130, _1080p * -96, _1080p * 96)
	var_14_0:addElement(var_14_12)

	var_14_0.Gradient = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIImage.new()

	var_14_14.id = "AudioVFX"

	var_14_14:SetAlpha(0, 0)
	var_14_14:SetScale(0.5, 0)
	var_14_14:setImage(RegisterMaterial("ui_waveform_idle"), 0)
	var_14_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -64, _1080p * 64)
	var_14_0:addElement(var_14_14)

	var_14_0.AudioVFX = var_14_14

	local var_14_15
	local var_14_16 = LUI.UIImage.new()

	var_14_16.id = "ForegroundImage"

	var_14_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_14_0:addElement(var_14_16)

	var_14_0.ForegroundImage = var_14_16

	local var_14_17
	local var_14_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_14_1
	})

	var_14_18.id = "PreviewButton"

	var_14_18.Text:SetLeft(_1080p * 20, 0)
	var_14_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"), 0)
	var_14_18.Text:SetAlignment(LUI.Alignment.Center)
	var_14_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * 272, _1080p * 310)
	var_14_0:addElement(var_14_18)

	var_14_0.PreviewButton = var_14_18

	local var_14_19
	local var_14_20 = LUI.UIImage.new()

	var_14_20.id = "RarityImage"

	var_14_20:SetRGBFromTable(SWATCHES.itemRarity.qualityBase, 0)
	var_14_20:setImage(RegisterMaterial("icon_rarity_1"), 0)
	var_14_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * 153, _1080p * 217)
	var_14_0:addElement(var_14_20)

	var_14_0.RarityImage = var_14_20

	local var_14_21
	local var_14_22 = LUI.UIStyledText.new()

	var_14_22.id = "ItemName"

	var_14_22:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_22:setText("", 0)
	var_14_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_22:SetWordWrap(false)
	var_14_22:SetAlignment(LUI.Alignment.Center)
	var_14_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_22:SetStartupDelay(2000)
	var_14_22:SetLineHoldTime(400)
	var_14_22:SetAnimMoveTime(2000)
	var_14_22:SetAnimMoveSpeed(150)
	var_14_22:SetEndDelay(2000)
	var_14_22:SetCrossfadeTime(250)
	var_14_22:SetFadeInTime(300)
	var_14_22:SetFadeOutTime(300)
	var_14_22:SetMaxVisibleLines(1)
	var_14_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * 227, _1080p * 277)
	var_14_0:addElement(var_14_22)

	var_14_0.ItemName = var_14_22

	local var_14_23
	local var_14_24 = LUI.UIStyledText.new()

	var_14_24.id = "ItemType"

	var_14_24:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_14_24:SetAlpha(0.75, 0)
	var_14_24:setText("", 0)
	var_14_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_24:SetWordWrap(false)
	var_14_24:SetTracking(1 * _1080p, 0)
	var_14_24:SetAlignment(LUI.Alignment.Center)
	var_14_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_24:SetStartupDelay(2000)
	var_14_24:SetLineHoldTime(400)
	var_14_24:SetAnimMoveTime(2000)
	var_14_24:SetAnimMoveSpeed(150)
	var_14_24:SetEndDelay(2000)
	var_14_24:SetCrossfadeTime(1000)
	var_14_24:SetFadeInTime(300)
	var_14_24:SetFadeOutTime(300)
	var_14_24:SetMaxVisibleLines(1)
	var_14_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * 277, _1080p * 305)
	var_14_0:addElement(var_14_24)

	var_14_0.ItemType = var_14_24

	local var_14_25
	local var_14_26 = LUI.UIText.new()

	var_14_26.id = "Title"

	var_14_26:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_14_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")), 0)
	var_14_26:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_14_26:SetAlignment(LUI.Alignment.Center)
	var_14_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -280, _1080p * -220)
	var_14_0:addElement(var_14_26)

	var_14_0.Title = var_14_26

	local var_14_27
	local var_14_28 = LUI.UIText.new()

	var_14_28.id = "ErrorMessage"

	var_14_28:SetRGBFromInt(16711680, 0)
	var_14_28:SetAlpha(0, 0)
	var_14_28:setText("Configuration error, item not supported", 0)
	var_14_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_28:SetWordWrap(false)
	var_14_28:SetAlignment(LUI.Alignment.Center)
	var_14_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -18, _1080p * 18)
	var_14_0:addElement(var_14_28)

	var_14_0.ErrorMessage = var_14_28

	local var_14_29
	local var_14_30 = LUI.UIImage.new()

	var_14_30.id = "Mask"

	var_14_30:setImage(RegisterMaterial("stencil_mask"), 0)
	var_14_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -341, _1080p * 341)
	var_14_0:addElement(var_14_30)

	var_14_0.Mask = var_14_30

	local var_14_31
	local var_14_32 = LUI.UIImage.new()

	var_14_32.id = "QuipMask"

	var_14_32:SetAlpha(0, 0)
	var_14_32:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_14_32:SetUMin(-3, 0)
	var_14_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * -350, _1080p * -350, _1080p * 350)
	var_14_0:addElement(var_14_32)

	var_14_0.QuipMask = var_14_32

	local var_14_33
	local var_14_34 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_14_1
	})

	var_14_34.id = "Cinematic"

	var_14_34:SetAlpha(0, 0)
	var_14_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -264, _1080p * 264, _1080p * -184, _1080p * 112)
	var_14_0:addElement(var_14_34)

	var_14_0.Cinematic = var_14_34

	local var_14_35
	local var_14_36 = LUI.UIText.new()

	var_14_36.id = "EquipHint"

	var_14_36:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_14_36:SetAlpha(0, 0)
	var_14_36:setText("", 0)
	var_14_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_36:SetWordWrap(false)
	var_14_36:SetAlignment(LUI.Alignment.Center)
	var_14_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -264, _1080p * 264, _1080p * 314, _1080p * 332)
	var_14_0:addElement(var_14_36)

	var_14_0.EquipHint = var_14_36

	local var_14_37
	local var_14_38 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_14_39 = LUI.UIBorder.new(var_14_38)

	var_14_39.id = "CheckboxFrame"

	var_14_39:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_14_39:SetAlpha(0, 0)
	var_14_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 300, _1080p * 324, _1080p * 240, _1080p * 264)
	var_14_0:addElement(var_14_39)

	var_14_0.CheckboxFrame = var_14_39

	local var_14_40
	local var_14_41 = LUI.UIImage.new()

	var_14_41.id = "Checkbox"

	var_14_41:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_14_41:SetAlpha(0, 0)
	var_14_41:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_14_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 300, _1080p * 324, _1080p * 240, _1080p * 264)
	var_14_0:addElement(var_14_41)

	var_14_0.Checkbox = var_14_41

	local function var_14_42()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_42

	local var_14_43
	local var_14_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigError", var_14_44)

	local var_14_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigError", var_14_45)

	local var_14_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigError", var_14_46)

	local var_14_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigError", var_14_47)

	local var_14_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ConfigError", var_14_48)

	local var_14_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ConfigError", var_14_49)

	local var_14_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ConfigError", var_14_50)

	local var_14_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ConfigError", var_14_51)

	local function var_14_52()
		var_14_10:AnimateSequence("ConfigError")
		var_14_12:AnimateSequence("ConfigError")
		var_14_16:AnimateSequence("ConfigError")
		var_14_18:AnimateSequence("ConfigError")
		var_14_20:AnimateSequence("ConfigError")
		var_14_22:AnimateSequence("ConfigError")
		var_14_24:AnimateSequence("ConfigError")
		var_14_28:AnimateSequence("ConfigError")
	end

	var_14_0._sequences.ConfigError = var_14_52

	local var_14_53
	local var_14_54 = {
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

	var_14_10:RegisterAnimationSequence("ConfigPlayercard", var_14_54)

	local var_14_55 = {
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

	var_14_16:RegisterAnimationSequence("ConfigPlayercard", var_14_55)

	local function var_14_56()
		var_14_10:AnimateSequence("ConfigPlayercard")
		var_14_16:AnimateSequence("ConfigPlayercard")
	end

	var_14_0._sequences.ConfigPlayercard = var_14_56

	local var_14_57
	local var_14_58 = {
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

	var_14_10:RegisterAnimationSequence("ConfigEmblem", var_14_58)

	local var_14_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigEmblem", var_14_59)

	local function var_14_60()
		var_14_10:AnimateSequence("ConfigEmblem")
		var_14_16:AnimateSequence("ConfigEmblem")
	end

	var_14_0._sequences.ConfigEmblem = var_14_60

	local var_14_61
	local var_14_62 = {
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

	var_14_10:RegisterAnimationSequence("ConfigSpray", var_14_62)

	local var_14_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigSpray", var_14_63)

	local function var_14_64()
		var_14_10:AnimateSequence("ConfigSpray")
		var_14_16:AnimateSequence("ConfigSpray")
	end

	var_14_0._sequences.ConfigSpray = var_14_64

	local var_14_65
	local var_14_66 = {
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

	var_14_10:RegisterAnimationSequence("ConfigQuip", var_14_66)

	local var_14_67 = {
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

	var_14_12:RegisterAnimationSequence("ConfigQuip", var_14_67)

	local var_14_68 = {
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

	var_14_14:RegisterAnimationSequence("ConfigQuip", var_14_68)

	local var_14_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigQuip", var_14_69)

	local var_14_70 = {
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

	var_14_18:RegisterAnimationSequence("ConfigQuip", var_14_70)

	local var_14_71 = {
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

	var_14_20:RegisterAnimationSequence("ConfigQuip", var_14_71)

	local var_14_72 = {
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

	var_14_22:RegisterAnimationSequence("ConfigQuip", var_14_72)

	local var_14_73 = {
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

	var_14_24:RegisterAnimationSequence("ConfigQuip", var_14_73)

	local var_14_74 = {
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

	var_14_32:RegisterAnimationSequence("ConfigQuip", var_14_74)

	local var_14_75 = {
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

	var_14_36:RegisterAnimationSequence("ConfigQuip", var_14_75)

	local var_14_76 = {
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

	var_14_39:RegisterAnimationSequence("ConfigQuip", var_14_76)

	local var_14_77 = {
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

	var_14_41:RegisterAnimationSequence("ConfigQuip", var_14_77)

	local function var_14_78()
		var_14_10:AnimateSequence("ConfigQuip")
		var_14_12:AnimateSequence("ConfigQuip")
		var_14_14:AnimateSequence("ConfigQuip")
		var_14_16:AnimateSequence("ConfigQuip")
		var_14_18:AnimateSequence("ConfigQuip")
		var_14_20:AnimateSequence("ConfigQuip")
		var_14_22:AnimateSequence("ConfigQuip")
		var_14_24:AnimateSequence("ConfigQuip")
		var_14_32:AnimateSequence("ConfigQuip")
		var_14_36:AnimateSequence("ConfigQuip")
		var_14_39:AnimateSequence("ConfigQuip")
		var_14_41:AnimateSequence("ConfigQuip")
	end

	var_14_0._sequences.ConfigQuip = var_14_78

	local var_14_79
	local var_14_80 = {
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

	var_14_10:RegisterAnimationSequence("ConfigExecution", var_14_80)

	local var_14_81 = {
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

	var_14_12:RegisterAnimationSequence("ConfigExecution", var_14_81)

	local var_14_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigExecution", var_14_82)

	local var_14_83 = {
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

	var_14_18:RegisterAnimationSequence("ConfigExecution", var_14_83)

	local var_14_84 = {
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

	var_14_20:RegisterAnimationSequence("ConfigExecution", var_14_84)

	local var_14_85 = {
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

	var_14_22:RegisterAnimationSequence("ConfigExecution", var_14_85)

	local var_14_86 = {
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

	var_14_24:RegisterAnimationSequence("ConfigExecution", var_14_86)

	local var_14_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_34:RegisterAnimationSequence("ConfigExecution", var_14_87)

	local var_14_88 = {
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

	var_14_36:RegisterAnimationSequence("ConfigExecution", var_14_88)

	local var_14_89 = {
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

	var_14_39:RegisterAnimationSequence("ConfigExecution", var_14_89)

	local var_14_90 = {
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

	var_14_41:RegisterAnimationSequence("ConfigExecution", var_14_90)

	local function var_14_91()
		var_14_10:AnimateSequence("ConfigExecution")
		var_14_12:AnimateSequence("ConfigExecution")
		var_14_16:AnimateSequence("ConfigExecution")
		var_14_18:AnimateSequence("ConfigExecution")
		var_14_20:AnimateSequence("ConfigExecution")
		var_14_22:AnimateSequence("ConfigExecution")
		var_14_24:AnimateSequence("ConfigExecution")
		var_14_34:AnimateSequence("ConfigExecution")
		var_14_36:AnimateSequence("ConfigExecution")
		var_14_39:AnimateSequence("ConfigExecution")
		var_14_41:AnimateSequence("ConfigExecution")
	end

	var_14_0._sequences.ConfigExecution = var_14_91

	local var_14_92
	local var_14_93 = {
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

	var_14_10:RegisterAnimationSequence("ConfigGesture", var_14_93)

	local var_14_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigGesture", var_14_94)

	local function var_14_95()
		var_14_10:AnimateSequence("ConfigGesture")
		var_14_16:AnimateSequence("ConfigGesture")
	end

	var_14_0._sequences.ConfigGesture = var_14_95

	local var_14_96
	local var_14_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped,
			child = var_14_0.GenericPopupWindow.PopupBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_14_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_14_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_14_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_14_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_14_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_14_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture,
			child = var_14_0.GenericPopupWindow.BotBorder
		}
	}

	var_14_8:RegisterAnimationSequence("BattlePassVersion", var_14_97)

	local var_14_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		}
	}

	var_14_26:RegisterAnimationSequence("BattlePassVersion", var_14_98)

	local function var_14_99()
		var_14_8:AnimateSequence("BattlePassVersion")
		var_14_26:AnimateSequence("BattlePassVersion")
	end

	var_14_0._sequences.BattlePassVersion = var_14_99

	local var_14_100
	local var_14_101 = {
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

	var_14_10:RegisterAnimationSequence("ConfigBPTierSkip", var_14_101)

	local var_14_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_16:RegisterAnimationSequence("ConfigBPTierSkip", var_14_102)

	local function var_14_103()
		var_14_10:AnimateSequence("ConfigBPTierSkip")
		var_14_16:AnimateSequence("ConfigBPTierSkip")
	end

	var_14_0._sequences.ConfigBPTierSkip = var_14_103

	local var_14_104
	local var_14_105 = {
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

	var_14_10:RegisterAnimationSequence("ConfigCollection", var_14_105)

	local var_14_106 = {
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

	var_14_16:RegisterAnimationSequence("ConfigCollection", var_14_106)

	local var_14_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ConfigCollection", var_14_107)

	local var_14_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ConfigCollection", var_14_108)

	local function var_14_109()
		var_14_10:AnimateSequence("ConfigCollection")
		var_14_16:AnimateSequence("ConfigCollection")
		var_14_22:AnimateSequence("ConfigCollection")
		var_14_24:AnimateSequence("ConfigCollection")
	end

	var_14_0._sequences.ConfigCollection = var_14_109

	local var_14_110
	local var_14_111 = {
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

	var_14_10:RegisterAnimationSequence("CharmCollection", var_14_111)

	local var_14_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("CharmCollection", var_14_112)

	local var_14_113 = {
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

	var_14_16:RegisterAnimationSequence("CharmCollection", var_14_113)

	local var_14_114 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("CharmCollection", var_14_114)

	local var_14_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("CharmCollection", var_14_115)

	local function var_14_116()
		var_14_10:AnimateSequence("CharmCollection")
		var_14_12:AnimateSequence("CharmCollection")
		var_14_16:AnimateSequence("CharmCollection")
		var_14_22:AnimateSequence("CharmCollection")
		var_14_24:AnimateSequence("CharmCollection")
	end

	var_14_0._sequences.CharmCollection = var_14_116

	local var_14_117 = LUI.UIBindButton.new()

	var_14_117.id = "selfBindButton"

	var_14_0:addElement(var_14_117)

	var_14_0.bindButton = var_14_117

	var_14_0.bindButton:addEventHandler("button_secondary", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_14_1
		end

		ACTIONS.LeaveMenu(var_14_0)
	end)
	var_0_7(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("StorePreviewItemPopup", StorePreviewItemPopup)
LockTable(_M)
