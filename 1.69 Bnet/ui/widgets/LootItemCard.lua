module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if Engine.DFEIGFBEH(RegisterMaterial(arg_1_1)) < 1 then
		arg_1_0 = arg_1_0 .. "T9"
	end

	return arg_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 == LOOT.Rarity.OPERATOR_MISSION then
		if not arg_2_0.OperatorMissionBorder then
			local var_2_0
			local var_2_1 = LUI.UIImage.new()

			var_2_1.id = "OperatorMissionBorder"

			var_2_1:setImage(RegisterMaterial("ui_icon_mtx_highlight_flipbook"), 0)
			var_2_1:SetBlendMode(BLEND_MODE.addWithAlpha)
			var_2_1:SetScale(0.35, 0)
			var_2_1:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -15, _1080p * 15, 0, 0)
			arg_2_0:addElement(var_2_1)

			arg_2_0.OperatorMissionBorder = var_2_1
		end
	elseif arg_2_0.OperatorMissionBorder then
		arg_2_0.OperatorMissionBorder:closeTree()

		arg_2_0.OperatorMissionBorder = nil
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2 == LOOT.Rarity.OPERATOR_MISSION then
		if not arg_3_0.LootItemCardOperatorMissionBanner then
			local var_3_0
			local var_3_1 = MenuBuilder.BuildRegisteredType("LootItemCardOperatorMissionBanner", {
				controllerIndex = arg_3_1
			})

			var_3_1.id = "LootItemCardOperatorMissionBanner"

			var_3_1:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * -2, _1080p * 1, _1080p * 41)
			arg_3_0:addElement(var_3_1)

			arg_3_0.LootItemCardOperatorMissionBanner = var_3_1
		end

		local var_3_2 = Challenge.GetTotalCodPointsForMission(arg_3_1, arg_3_3)

		arg_3_0.LootItemCardOperatorMissionBanner:SetAmount(var_3_2)
	elseif arg_3_0.LootItemCardOperatorMissionBanner then
		arg_3_0.LootItemCardOperatorMissionBanner:closeTree()

		arg_3_0.LootItemCardOperatorMissionBanner = nil
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 == LOOT.Rarity.OPERATOR_MISSION and BLEND_MODE.addWithAlpha or BLEND_MODE.blend

	arg_4_0.RarityImage:setImage(RegisterMaterial(LOOT.GetRarityImage(arg_4_1)))
	LOOT.ApplyRarityIconColoring(arg_4_0.RarityImage, arg_4_1)
	arg_4_0.RarityImage:SetBlendMode(var_4_0)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	assert(arg_5_1)

	local var_5_0
	local var_5_1

	ACTIONS.AnimateSequence(arg_5_0, "HidePlayerTitle")

	if arg_5_1 == LOOT.itemTypes.PLAYERCARD then
		var_5_0 = "ConfigPlayercard"
		var_5_1 = arg_5_2

		if not CONDITIONS.IsMagmaGameMode() then
			arg_5_0.Background:SetPixelGridEnabled(true)
			arg_5_0.Background:SetPixelGridContrast(0.8, 0)
			arg_5_0.Background:SetPixelGridBlockWidth(3, 0)
			arg_5_0.Background:SetPixelGridBlockHeight(3, 0)
			arg_5_0.Background:SetPixelGridGutterWidth(1, 0)
			arg_5_0.Background:SetPixelGridGutterHeight(1, 0)
		end
	elseif arg_5_1 == LOOT.itemTypes.EMBLEM then
		var_5_0 = "ConfigEmblem"
		var_5_1 = "ui_loot_bg_emblem"
	elseif arg_5_1 == LOOT.itemTypes.CHARM then
		var_5_0 = "ConfigCharm"
		var_5_1 = "ui_loot_bg_charm"
	elseif arg_5_1 == LOOT.itemTypes.STICKER then
		var_5_0 = "ConfigSticker"
		var_5_1 = "ui_loot_bg_sticker"
	elseif arg_5_1 == LOOT.itemTypes.GESTURES then
		var_5_0 = "ConfigGesture"
		var_5_0 = var_0_0(var_5_0, arg_5_2)
		var_5_1 = "ui_loot_bg_gesture"
	elseif arg_5_1 == LOOT.itemTypes.SPRAYS then
		var_5_0 = "ConfigSpray"
		var_5_1 = "ui_loot_bg_spray"
	elseif arg_5_1 == LOOT.itemTypes.CONSUMABLE then
		var_5_0 = "ConfigConsumable"
		var_5_1 = "ui_loot_bg_generic"
	elseif arg_5_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		var_5_0 = "ConfigExecution"
		var_5_0 = var_0_0(var_5_0, arg_5_2)
		var_5_1 = "ui_loot_bg_execution"
	elseif arg_5_1 == LOOT.itemTypes.OPERATOR or arg_5_1 == LOOT.itemTypes.OPERATOR_SKIN then
		var_5_0 = "ConfigOperator"
		var_5_1 = "ui_loot_bg_operator"
	elseif arg_5_1 == LOOT.itemTypes.QUIP then
		var_5_0 = "ConfigQuip"
		var_5_1 = "ui_loot_bg_operator"
	elseif arg_5_1 == LOOT.itemTypes.VEHICLE_HORN then
		var_5_0 = "ConfigVehicleHorn"
		var_5_1 = "ui_loot_bg_vehicle_horn"

		arg_5_0.Foreground:setImage(RegisterMaterial("ui_vehicle_horn"))
	elseif arg_5_1 == LOOT.itemTypes.VEHICLE_TRACK then
		var_5_0 = "ConfigVehicleHorn"
		var_5_1 = "ui_loot_bg_vehicle_horn"

		arg_5_0.Foreground:setImage(RegisterMaterial("ui_vehicle_battle_track"))
	elseif arg_5_1 == LOOT.itemTypes.BATTLE_PASS then
		var_5_0 = "ConfigBattlePass"
		var_5_1 = "ui_loot_bg_battlepass"
	elseif arg_5_1 == LOOT.itemTypes.VEHICLE_CAMO then
		var_5_0 = "ConfigVehicleCamo"
		var_5_0 = var_0_0(var_5_0, arg_5_2)
		var_5_1 = "ui_loot_bg_vehicle"
	elseif arg_5_1 == LOOT.itemTypes.MISSION then
		var_5_0 = (arg_5_2 == nil or arg_5_2 == "icon_mission_operator_token") and "ConfigMission" or "ConfigDefault"
		var_5_1 = "ui_loot_bg_feature"
	elseif arg_5_1 == LOOT.itemTypes.BUNDLE then
		var_5_0 = "ConfigCollection"
		var_5_1 = "ui_loot_bg_generic"
	elseif arg_5_1 == LOOT.itemTypes.RETICLE then
		local var_5_2 = RegisterMaterial(arg_5_2)

		var_5_0 = Engine.DFEIGFBEH(var_5_2) < 1 and "ConfigReticle3x4" or "ConfigReticle1x1"
		var_5_1 = "ui_loot_bg_generic"
	elseif arg_5_1 == LOOT.itemTypes.S4_MISC then
		var_5_0 = arg_5_3 and arg_5_3.miscType == LOOT.miscItemTypes.KILLCAM_VANITY and "ConfigS4MiscWide" or "ConfigS4Misc"
		var_5_1 = "ui_loot_bg_generic"
	elseif arg_5_1 == LOOT.itemTypes.TITLE then
		var_5_0 = "ConfigPlayerTitle"
		var_5_1 = "ui_loot_bg_generic"

		local var_5_3 = arg_5_0.ItemName:getText()

		arg_5_0.PlayerTitleName:setText(ToUpperCase(var_5_3))
	elseif arg_5_1 == LOOT.itemTypes.SPECIAL then
		var_5_0 = "ConfigSpecial"
		var_5_1 = "ui_loot_bg_generic"

		if IsLanguageArabic() then
			arg_5_0.ItemName:SetMaxVisibleLines(2)
		else
			arg_5_0.ItemName:SetMaxVisibleLines(3)
		end
	elseif arg_5_1 == LOOT.itemTypes.WATCH then
		var_5_0 = "ConfigWatch"
		var_5_1 = "ui_loot_bg_generic"
	elseif arg_5_1 == "xp" then
		var_5_0 = "ConfigXP"
		var_5_1 = "ui_loot_bg_generic"
	else
		var_5_0 = "ConfigDefault"
		var_5_1 = "ui_loot_bg_generic"
	end

	if var_5_0 then
		ACTIONS.AnimateSequence(arg_5_0, var_5_0)
	end

	if var_5_1 then
		arg_5_0.Background:setImage(RegisterMaterial(var_5_1))
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0._isMWExclusiveItem = false
	arg_6_0._isBOExclusiveItem = false
	arg_6_0._isVGExclusiveItem = false

	local var_6_0
	local var_6_1 = LOOT.IsItemIDEquippableByIW8MP(arg_6_1)
	local var_6_2 = LOOT.IsItemIDEquippableByWZ(arg_6_1)
	local var_6_3 = LOOT.IsItemIDEquippableByT9(arg_6_1)
	local var_6_4 = LOOT.IsItemIDEquippableByS4(arg_6_1)

	if var_6_1 and not var_6_2 and not var_6_3 and not var_6_4 then
		arg_6_0._isMWExclusiveItem = true
		var_6_0 = "ConfigMWExclusive"
	elseif not var_6_1 and not var_6_2 and var_6_3 and not var_6_4 then
		arg_6_0._isBOExclusiveItem = true
		var_6_0 = "ConfigBOExclusive"
	elseif not var_6_1 and not var_6_2 and not var_6_3 and var_6_4 then
		arg_6_0._isVGExclusiveItem = true
		var_6_0 = "ConfigVGExclusive"
	end

	if var_6_0 then
		local var_6_5 = LOOT.GetGameSourceIDFromItemID(arg_6_1)

		arg_6_0.ExclusiveSnipeIcon:UpdateExclusiveSnipeIcon({
			selected = true,
			isExclusive = true,
			gameSourceID = var_6_5
		})
		ACTIONS.AnimateSequence(arg_6_0, var_6_0)
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = WEAPON.GetTracerType(arg_7_2)

	if var_7_0 then
		local var_7_1 = WEAPON.GetSpecialAttributeColor(var_7_0)
		local var_7_2 = WEAPON.GetSpecialAttributeAtlas(var_7_0)
		local var_7_3 = WEAPON.GetSpecialAttributeBlendMode(var_7_0)

		arg_7_0.Tracer:setImage(RegisterMaterial(var_7_2))
		arg_7_0.Tracer:SetRGBFromTable(var_7_1)
		arg_7_0.Tracer:SetBlendMode(var_7_3)
		arg_7_0.Tracer:SetAlpha(1)
	else
		arg_7_0.Tracer:SetAlpha(0)
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	local var_8_0 = WEAPON.GetDismembermentType(arg_8_1)

	if var_8_0 then
		local var_8_1 = WEAPON.GetSpecialAttributeIcon(var_8_0)

		arg_8_0.Dismemberment:setImage(RegisterMaterial(var_8_1))
		arg_8_0.Dismemberment:SetAlpha(1)
	else
		arg_8_0.Dismemberment:SetAlpha(0)
	end
end

local function var_0_8(arg_9_0)
	assert(arg_9_0.Background)
	arg_9_0.Background:SetPixelGridEnabled(false)
end

local function var_0_9(arg_10_0, arg_10_1)
	arg_10_0._previewsEnabled = arg_10_1
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.UpdateCardConfig = var_0_4
	arg_11_0.ClearCardBackground = var_0_8
	arg_11_0.SetupTracer = var_0_6
	arg_11_0.SetupDismemberment = var_0_7
	arg_11_0.SetPreview = var_0_9
	arg_11_0.UpdateOperatorMissionBorder = var_0_1
	arg_11_0.UpdateOperatorMissionBanner = var_0_2
	arg_11_0.UpdateRarityImage = var_0_3
	arg_11_0.UpdateWZCardConfig = var_0_5
	arg_11_0._previewsEnabled = true

	arg_11_0.Background:SetMask(arg_11_0.Mask)
	arg_11_0.Foreground:SetMask(arg_11_0.Mask)
	arg_11_0.Glint:SetMask(arg_11_0.Mask)

	if IsLanguageArabic() then
		arg_11_0.ItemName:SetFontSize(30 * _1080p)
		ACTIONS.AnimateSequence(arg_11_0, "AR")
	end

	local var_11_0 = IsLanguageArabic() and 30 * _1080p or 24 * _1080p
	local var_11_1 = IsLanguageArabic() and 32 * _1080p or 26 * _1080p
	local var_11_2 = 20 * _1080p
	local var_11_3 = 22 * _1080p

	arg_11_0:addEventHandler("gain_focus", function(arg_12_0, arg_12_1)
		if arg_11_0._previewsEnabled then
			arg_11_0.ItemName:SetFontSize(var_11_1)
			arg_11_0.AlreadyOwned:SetFontSize(var_11_3)
			arg_11_0.ItemType:SetFontSize(var_11_3)

			local var_12_0 = 0.1
			local var_12_1 = 150

			arg_11_0:SetScale(var_12_0, var_12_1, LUI.EASING.outQuadratic)

			if arg_11_0.LootItemCardOperatorMissionBanner then
				arg_11_0.LootItemCardOperatorMissionBanner:SetTextScale(-var_12_0, var_12_1, LUI.EASING.outQuadratic)
			end

			if arg_11_0._isMWExclusiveItem then
				ACTIONS.AnimateSequence(arg_11_0, "MWExclusiveFocusGained")
			elseif arg_11_0._isBOExclusiveItem then
				ACTIONS.AnimateSequence(arg_11_0, "BOExclusiveFocusGained")
			elseif arg_11_0._isVGExclusiveItem then
				ACTIONS.AnimateSequence(arg_11_0, "VGExclusiveFocusGained")
			else
				ACTIONS.AnimateSequence(arg_11_0, CONDITIONS.IsMagmaGameMode() and "WZFocusGained" or "FocusGained")
			end
		end
	end)
	arg_11_0:addEventHandler("lose_focus", function(arg_13_0, arg_13_1)
		if arg_11_0._previewsEnabled then
			arg_11_0.ItemName:SetFontSize(var_11_0)
			arg_11_0.AlreadyOwned:SetFontSize(var_11_2)
			arg_11_0.ItemType:SetFontSize(var_11_2)

			local var_13_0 = 0
			local var_13_1 = 100

			arg_11_0:SetScale(var_13_0, var_13_1)

			if arg_11_0.LootItemCardOperatorMissionBanner then
				arg_11_0.LootItemCardOperatorMissionBanner:SetTextScale(var_13_0, var_13_1)
			end

			if arg_11_0._isMWExclusiveItem then
				ACTIONS.AnimateSequence(arg_11_0, "MWExclusiveFocusLost")
			elseif arg_11_0._isBOExclusiveItem then
				ACTIONS.AnimateSequence(arg_11_0, "BOExclusiveFocusLost")
			elseif arg_11_0._isVGExclusiveItem then
				ACTIONS.AnimateSequence(arg_11_0, "VGExclusiveFocusLost")
			else
				ACTIONS.AnimateSequence(arg_11_0, CONDITIONS.IsMagmaGameMode() and "WZFocusLost" or "FocusLost")
			end
		end
	end)

	local var_11_4 = 8

	if IsLanguageSpanish() or IsLanguageRussian() then
		var_11_4 = 10
	elseif IsLanguageItalian() then
		var_11_4 = 12
	end

	arg_11_0.ItemName:SetLeft(_1080p * var_11_4)
	arg_11_0.ItemName:SetRight(_1080p * -var_11_4)
end

function LootItemCard(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 280 * _1080p)

	var_14_0.id = "LootItemCard"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "PlayercardBackground"

	var_14_4:SetRGBFromInt(0, 0)
	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -30)
	var_14_0:addElement(var_14_4)

	var_14_0.PlayercardBackground = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "Background"

	var_14_6:SetRGBFromInt(0, 0)
	var_14_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -140, _1080p * 140)
	var_14_0:addElement(var_14_6)

	var_14_0.Background = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "PlayercardOverlay"

	var_14_8:SetRGBFromInt(0, 0)
	var_14_8:SetAlpha(0.5, 0)
	var_14_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -82)
	var_14_0:addElement(var_14_8)

	var_14_0.PlayercardOverlay = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIImage.new()

	var_14_10.id = "QuipOverlay"

	var_14_10:SetAlpha(0, 0)
	var_14_10:SetScale(-0.35, 0)
	var_14_10:setImage(RegisterMaterial("icon_chyron_fx"), 0)
	var_14_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -156, _1080p * 156, _1080p * -86, _1080p * 42)
	var_14_0:addElement(var_14_10)

	var_14_0.QuipOverlay = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "Foreground"

	var_14_12:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_14_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -140, _1080p * 140)
	var_14_0:addElement(var_14_12)

	var_14_0.Foreground = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIImage.new()

	var_14_14.id = "Dismemberment"

	var_14_14:SetAlpha(0, 0)
	var_14_14:setImage(RegisterMaterial("loot_card_overlay_tracer_white"), 0)
	var_14_14:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_14_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -57, _1080p * -5, _1080p * 6, _1080p * 32)
	var_14_0:addElement(var_14_14)

	var_14_0.Dismemberment = var_14_14

	local var_14_15
	local var_14_16 = LUI.UIImage.new()

	var_14_16.id = "Tracer"

	var_14_16:SetAlpha(0, 0)
	var_14_16:setImage(RegisterMaterial("loot_card_overlay_tracer_white"), 0)
	var_14_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_14_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -103, _1080p * 103, _1080p * -138, _1080p * 68)
	var_14_0:addElement(var_14_16)

	var_14_0.Tracer = var_14_16

	local var_14_17
	local var_14_18 = LUI.UIImage.new()

	var_14_18.id = "ItemTypeBackground"

	var_14_18:SetAlpha(0.15, 0)
	var_14_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 30)
	var_14_0:addElement(var_14_18)

	var_14_0.ItemTypeBackground = var_14_18

	local var_14_19
	local var_14_20 = LUI.UIImage.new()

	var_14_20.id = "HighlightGradientBottom"

	var_14_20:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_14_20:SetAlpha(0, 0)
	var_14_20:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_14_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 30)
	var_14_0:addElement(var_14_20)

	var_14_0.HighlightGradientBottom = var_14_20

	local var_14_21
	local var_14_22 = LUI.UIImage.new()

	var_14_22.id = "HighlightGradientTop"

	var_14_22:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_14_22:SetAlpha(0, 0)
	var_14_22:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_14_22:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -1, _1080p * -1, 0, _1080p * 65)
	var_14_0:addElement(var_14_22)

	var_14_0.HighlightGradientTop = var_14_22

	local var_14_23
	local var_14_24 = LUI.UIImage.new()

	var_14_24.id = "RarityBG"

	var_14_24:SetRGBFromTable(SWATCHES.itemRarity.qualityAlt3, 0)
	var_14_24:SetAlpha(0.8, 0)
	var_14_24:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * -82, _1080p * -2)
	var_14_0:addElement(var_14_24)

	var_14_0.RarityBG = var_14_24

	local var_14_25
	local var_14_26 = LUI.UIImage.new()

	var_14_26.id = "RarityImage"

	var_14_26:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_14_26:SetScale(-0.25, 0)
	var_14_26:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_14_26:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -16, _1080p * 16, _1080p * -80, _1080p * -48)
	var_14_0:addElement(var_14_26)

	var_14_0.RarityImage = var_14_26

	local var_14_27
	local var_14_28 = LUI.UIStyledText.new()

	var_14_28.id = "ItemName"

	var_14_28:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_28:setText("THORNE", 0)
	var_14_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_28:SetAlignment(LUI.Alignment.Center)
	var_14_28:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_14_28:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_14_28:SetStartupDelay(2000)
	var_14_28:SetLineHoldTime(400)
	var_14_28:SetAnimMoveTime(2000)
	var_14_28:SetAnimMoveSpeed(150)
	var_14_28:SetEndDelay(2000)
	var_14_28:SetCrossfadeTime(250)
	var_14_28:SetFadeInTime(300)
	var_14_28:SetFadeOutTime(300)
	var_14_28:SetMaxVisibleLines(2)
	var_14_28:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 5, _1080p * -5, _1080p * -30, _1080p * -6)
	var_14_0:addElement(var_14_28)

	var_14_0.ItemName = var_14_28

	local var_14_29
	local var_14_30 = LUI.UIStyledText.new()

	var_14_30.id = "ItemType"

	var_14_30:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_14_30:SetAlpha(0.75, 0)
	var_14_30:setText("", 0)
	var_14_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_30:SetWordWrap(false)
	var_14_30:SetAlignment(LUI.Alignment.Center)
	var_14_30:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_30:SetStartupDelay(2000)
	var_14_30:SetLineHoldTime(400)
	var_14_30:SetAnimMoveTime(2000)
	var_14_30:SetAnimMoveSpeed(150)
	var_14_30:SetEndDelay(2000)
	var_14_30:SetCrossfadeTime(1000)
	var_14_30:SetFadeInTime(300)
	var_14_30:SetFadeOutTime(300)
	var_14_30:SetMaxVisibleLines(1)
	var_14_30:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 5, _1080p * -5, _1080p * 5, _1080p * 25)
	var_14_0:addElement(var_14_30)

	var_14_0.ItemType = var_14_30

	local var_14_31
	local var_14_32 = MenuBuilder.BuildRegisteredType("WZExclusiveSnipeIcon", {
		controllerIndex = var_14_1
	})

	var_14_32.id = "ExclusiveSnipeIcon"

	var_14_32:SetAlpha(0, 0)
	var_14_32:SetScale(-0.3, 0)
	var_14_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -25, _1080p * 375, _1080p * 4, _1080p * 36)
	var_14_0:addElement(var_14_32)

	var_14_0.ExclusiveSnipeIcon = var_14_32

	local var_14_33
	local var_14_34 = LUI.UIImage.new()

	var_14_34.id = "Glint"

	var_14_34:SetAlpha(0, 0)
	var_14_34:SetZRotation(-40, 0)
	var_14_34:SetScale(0.1, 0)
	var_14_34:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_14_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -745, _1080p * -245, _1080p * -359, _1080p * 141)
	var_14_0:addElement(var_14_34)

	var_14_0.Glint = var_14_34

	local var_14_35
	local var_14_36 = LUI.UIImage.new()

	var_14_36.id = "Mask"

	var_14_36:setImage(RegisterMaterial("stencil_mask"), 0)
	var_14_36:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, 0, 0)
	var_14_0:addElement(var_14_36)

	var_14_0.Mask = var_14_36

	local var_14_37
	local var_14_38 = LUI.UIImage.new()

	var_14_38.id = "AlreadyOwnedBG"

	var_14_38:SetRGBFromTable(SWATCHES.BattlePass.PopupBacker, 0)
	var_14_38:SetAlpha(0, 0)
	var_14_38:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 184, 0, _1080p * 26)
	var_14_0:addElement(var_14_38)

	var_14_0.AlreadyOwnedBG = var_14_38

	local var_14_39
	local var_14_40 = LUI.UIImage.new()

	var_14_40.id = "Border"

	var_14_40:setImage(RegisterMaterial("loot_card_border_4"), 0)
	var_14_0:addElement(var_14_40)

	var_14_0.Border = var_14_40

	local var_14_41
	local var_14_42 = LUI.UIImage.new()

	var_14_42.id = "BlueprintIcon"

	var_14_42:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_14_42:SetAlpha(0, 0)
	var_14_42:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_14_42:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * 13, _1080p * 77)
	var_14_0:addElement(var_14_42)

	var_14_0.BlueprintIcon = var_14_42

	local var_14_43
	local var_14_44 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_14_45 = LUI.UIBorder.new(var_14_44)

	var_14_45.id = "CheckboxFrame"

	var_14_45:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_14_45:SetAlpha(0, 0)
	var_14_45:SetBorderThicknessRight(_1080p * 0, 0)
	var_14_45:SetBorderThicknessTop(_1080p * 0, 0)
	var_14_45:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -26, _1080p * -2, _1080p * 2, _1080p * 26)
	var_14_0:addElement(var_14_45)

	var_14_0.CheckboxFrame = var_14_45

	local var_14_46
	local var_14_47 = LUI.UIImage.new()

	var_14_47.id = "Checkbox"

	var_14_47:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_14_47:SetAlpha(0, 0)
	var_14_47:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_14_47:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -1, _1080p * 1, _1080p * 25)
	var_14_0:addElement(var_14_47)

	var_14_0.Checkbox = var_14_47

	local var_14_48
	local var_14_49 = LUI.UIImage.new()

	var_14_49.id = "Frame"

	var_14_49:SetAlpha(0, 0)
	var_14_49:setImage(RegisterMaterial("battlepass_lootcard_trim_gold_9slice"), 0)
	var_14_49:Setup9SliceImage(_1080p * 70, _1080p * 70, 0.5, 0.5)
	var_14_0:addElement(var_14_49)

	var_14_0.Frame = var_14_49

	local var_14_50
	local var_14_51 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_14_52 = LUI.UIBorder.new(var_14_51)

	var_14_52.id = "HighlightBorder"

	var_14_52:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_14_52:SetAlpha(0, 0)
	var_14_52:SetBorderThicknessLeft(_1080p * 2, 0)
	var_14_52:SetBorderThicknessRight(_1080p * 2, 0)
	var_14_52:SetBorderThicknessTop(_1080p * 2, 0)
	var_14_52:SetBorderThicknessBottom(_1080p * 2, 0)
	var_14_52:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * 30)
	var_14_0:addElement(var_14_52)

	var_14_0.HighlightBorder = var_14_52

	local var_14_53
	local var_14_54 = LUI.UIImage.new()

	var_14_54.id = "HighlightGlow"

	var_14_54:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_14_54:SetAlpha(0, 0)
	var_14_54:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_14_54:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -44, _1080p * 44, _1080p * -25, _1080p * 25)
	var_14_0:addElement(var_14_54)

	var_14_0.HighlightGlow = var_14_54

	local var_14_55
	local var_14_56 = LUI.UIStyledText.new()

	var_14_56.id = "AlreadyOwned"

	var_14_56:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_14_56:SetAlpha(0, 0)
	var_14_56:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/ALREADY_OWNED")), 0)
	var_14_56:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_56:SetAlignment(LUI.Alignment.Center)
	var_14_56:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_14_56:SetStartupDelay(2000)
	var_14_56:SetLineHoldTime(400)
	var_14_56:SetAnimMoveTime(2000)
	var_14_56:SetAnimMoveSpeed(150)
	var_14_56:SetEndDelay(2000)
	var_14_56:SetCrossfadeTime(250)
	var_14_56:SetFadeInTime(300)
	var_14_56:SetFadeOutTime(300)
	var_14_56:SetMaxVisibleLines(1)
	var_14_56:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 4, _1080p * 24)
	var_14_0:addElement(var_14_56)

	var_14_0.AlreadyOwned = var_14_56

	local var_14_57
	local var_14_58 = LUI.UIStyledText.new()

	var_14_58.id = "PlayerTitleName"

	var_14_58:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_14_58:SetAlpha(0, 0)
	var_14_58:SetXRotation(45, 0)
	var_14_58:SetYRotation(-20, 0)
	var_14_58:SetZRotation(9.5, 0)
	var_14_58:setText(ToUpperCase(""), 0)
	var_14_58:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_58:SetTracking(-1 * _1080p, 0)
	var_14_58:SetLeading(-5 * _1080p, 0)
	var_14_58:SetAlignment(LUI.Alignment.Center)
	var_14_58:SetVerticalAlignment(LUI.Alignment.Center)
	var_14_58:SetShadowMinDistance(1, 0)
	var_14_58:SetShadowMaxDistance(1, 0)
	var_14_58:SetShadowUOffset(0.5, 0)
	var_14_58:SetShadowVOffset(0.5, 0)
	var_14_58:SetShadowRGBFromInt(0, 0)
	var_14_58:SetAnchorsAndPosition(0.02, 0.02, 0.33, 0.5700001, 0, 0, 0, 0)
	var_14_0:addElement(var_14_58)

	var_14_0.PlayerTitleName = var_14_58

	local function var_14_59()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_59

	local var_14_60
	local var_14_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_12:RegisterAnimationSequence("FocusGained", var_14_61)

	local var_14_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("FocusGained", var_14_62)

	local var_14_63 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("FocusGained", var_14_63)

	local var_14_64 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("FocusGained", var_14_64)

	local var_14_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.Highlight
		}
	}

	var_14_30:RegisterAnimationSequence("FocusGained", var_14_65)

	local var_14_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("FocusGained", var_14_66)

	local var_14_67 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("FocusGained", var_14_67)

	local function var_14_68()
		var_14_12:AnimateSequence("FocusGained")
		var_14_18:AnimateSequence("FocusGained")
		var_14_20:AnimateSequence("FocusGained")
		var_14_22:AnimateSequence("FocusGained")
		var_14_30:AnimateSequence("FocusGained")
		var_14_52:AnimateSequence("FocusGained")
		var_14_54:AnimateSequence("FocusGained")
	end

	var_14_0._sequences.FocusGained = var_14_68

	local var_14_69
	local var_14_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_12:RegisterAnimationSequence("FocusLost", var_14_70)

	local var_14_71 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_14_18:RegisterAnimationSequence("FocusLost", var_14_71)

	local var_14_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("FocusLost", var_14_72)

	local var_14_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("FocusLost", var_14_73)

	local var_14_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("FocusLost", var_14_74)

	local var_14_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("FocusLost", var_14_75)

	local var_14_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("FocusLost", var_14_76)

	local function var_14_77()
		var_14_12:AnimateSequence("FocusLost")
		var_14_18:AnimateSequence("FocusLost")
		var_14_20:AnimateSequence("FocusLost")
		var_14_22:AnimateSequence("FocusLost")
		var_14_30:AnimateSequence("FocusLost")
		var_14_52:AnimateSequence("FocusLost")
		var_14_54:AnimateSequence("FocusLost")
	end

	var_14_0._sequences.FocusLost = var_14_77

	local var_14_78
	local var_14_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigPlayercard", var_14_79)

	local var_14_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1.18,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
		}
	}

	var_14_6:RegisterAnimationSequence("ConfigPlayercard", var_14_80)

	local var_14_81 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigPlayercard", var_14_81)

	local var_14_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigPlayercard", var_14_82)

	local var_14_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigPlayercard", var_14_83)

	local var_14_84 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigPlayercard", var_14_84)

	local var_14_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigPlayercard", var_14_85)

	local function var_14_86()
		var_14_4:AnimateSequence("ConfigPlayercard")
		var_14_6:AnimateSequence("ConfigPlayercard")
		var_14_8:AnimateSequence("ConfigPlayercard")
		var_14_10:AnimateSequence("ConfigPlayercard")
		var_14_12:AnimateSequence("ConfigPlayercard")
		var_14_18:AnimateSequence("ConfigPlayercard")
		var_14_30:AnimateSequence("ConfigPlayercard")
	end

	var_14_0._sequences.ConfigPlayercard = var_14_86

	local var_14_87
	local var_14_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigDefault", var_14_88)

	local var_14_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigDefault", var_14_89)

	local var_14_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigDefault", var_14_90)

	local var_14_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigDefault", var_14_91)

	local var_14_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigDefault", var_14_92)

	local var_14_93 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigDefault", var_14_93)

	local var_14_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigDefault", var_14_94)

	local var_14_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_58:RegisterAnimationSequence("ConfigDefault", var_14_95)

	local function var_14_96()
		var_14_4:AnimateSequence("ConfigDefault")
		var_14_6:AnimateSequence("ConfigDefault")
		var_14_8:AnimateSequence("ConfigDefault")
		var_14_10:AnimateSequence("ConfigDefault")
		var_14_12:AnimateSequence("ConfigDefault")
		var_14_18:AnimateSequence("ConfigDefault")
		var_14_30:AnimateSequence("ConfigDefault")
		var_14_58:AnimateSequence("ConfigDefault")
	end

	var_14_0._sequences.ConfigDefault = var_14_96

	local var_14_97
	local var_14_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigCharm", var_14_98)

	local var_14_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigCharm", var_14_99)

	local var_14_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigCharm", var_14_100)

	local var_14_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigCharm", var_14_101)

	local var_14_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigCharm", var_14_102)

	local var_14_103 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigCharm", var_14_103)

	local var_14_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigCharm", var_14_104)

	local function var_14_105()
		var_14_4:AnimateSequence("ConfigCharm")
		var_14_6:AnimateSequence("ConfigCharm")
		var_14_8:AnimateSequence("ConfigCharm")
		var_14_10:AnimateSequence("ConfigCharm")
		var_14_12:AnimateSequence("ConfigCharm")
		var_14_18:AnimateSequence("ConfigCharm")
		var_14_30:AnimateSequence("ConfigCharm")
	end

	var_14_0._sequences.ConfigCharm = var_14_105

	local var_14_106
	local var_14_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigSpray", var_14_107)

	local var_14_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigSpray", var_14_108)

	local var_14_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigSpray", var_14_109)

	local var_14_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigSpray", var_14_110)

	local var_14_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigSpray", var_14_111)

	local var_14_112 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigSpray", var_14_112)

	local var_14_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigSpray", var_14_113)

	local function var_14_114()
		var_14_4:AnimateSequence("ConfigSpray")
		var_14_6:AnimateSequence("ConfigSpray")
		var_14_8:AnimateSequence("ConfigSpray")
		var_14_10:AnimateSequence("ConfigSpray")
		var_14_12:AnimateSequence("ConfigSpray")
		var_14_18:AnimateSequence("ConfigSpray")
		var_14_30:AnimateSequence("ConfigSpray")
	end

	var_14_0._sequences.ConfigSpray = var_14_114

	local var_14_115
	local var_14_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigEmblem", var_14_116)

	local var_14_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigEmblem", var_14_117)

	local var_14_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigEmblem", var_14_118)

	local var_14_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigEmblem", var_14_119)

	local var_14_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigEmblem", var_14_120)

	local var_14_121 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigEmblem", var_14_121)

	local var_14_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigEmblem", var_14_122)

	local function var_14_123()
		var_14_4:AnimateSequence("ConfigEmblem")
		var_14_6:AnimateSequence("ConfigEmblem")
		var_14_8:AnimateSequence("ConfigEmblem")
		var_14_10:AnimateSequence("ConfigEmblem")
		var_14_12:AnimateSequence("ConfigEmblem")
		var_14_18:AnimateSequence("ConfigEmblem")
		var_14_30:AnimateSequence("ConfigEmblem")
	end

	var_14_0._sequences.ConfigEmblem = var_14_123

	local var_14_124
	local var_14_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigSticker", var_14_125)

	local var_14_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigSticker", var_14_126)

	local var_14_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigSticker", var_14_127)

	local var_14_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigSticker", var_14_128)

	local var_14_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigSticker", var_14_129)

	local var_14_130 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigSticker", var_14_130)

	local var_14_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigSticker", var_14_131)

	local function var_14_132()
		var_14_4:AnimateSequence("ConfigSticker")
		var_14_6:AnimateSequence("ConfigSticker")
		var_14_8:AnimateSequence("ConfigSticker")
		var_14_10:AnimateSequence("ConfigSticker")
		var_14_12:AnimateSequence("ConfigSticker")
		var_14_18:AnimateSequence("ConfigSticker")
		var_14_30:AnimateSequence("ConfigSticker")
	end

	var_14_0._sequences.ConfigSticker = var_14_132

	local var_14_133
	local var_14_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigGesture", var_14_134)

	local var_14_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigGesture", var_14_135)

	local var_14_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigGesture", var_14_136)

	local var_14_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigGesture", var_14_137)

	local var_14_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -122
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 58
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigGesture", var_14_138)

	local var_14_139 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigGesture", var_14_139)

	local var_14_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigGesture", var_14_140)

	local function var_14_141()
		var_14_4:AnimateSequence("ConfigGesture")
		var_14_6:AnimateSequence("ConfigGesture")
		var_14_8:AnimateSequence("ConfigGesture")
		var_14_10:AnimateSequence("ConfigGesture")
		var_14_12:AnimateSequence("ConfigGesture")
		var_14_18:AnimateSequence("ConfigGesture")
		var_14_30:AnimateSequence("ConfigGesture")
	end

	var_14_0._sequences.ConfigGesture = var_14_141

	local var_14_142
	local var_14_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigConsumable", var_14_143)

	local var_14_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigConsumable", var_14_144)

	local var_14_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigConsumable", var_14_145)

	local var_14_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigConsumable", var_14_146)

	local var_14_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigConsumable", var_14_147)

	local var_14_148 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigConsumable", var_14_148)

	local var_14_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigConsumable", var_14_149)

	local var_14_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_58:RegisterAnimationSequence("ConfigConsumable", var_14_150)

	local function var_14_151()
		var_14_4:AnimateSequence("ConfigConsumable")
		var_14_6:AnimateSequence("ConfigConsumable")
		var_14_8:AnimateSequence("ConfigConsumable")
		var_14_10:AnimateSequence("ConfigConsumable")
		var_14_12:AnimateSequence("ConfigConsumable")
		var_14_18:AnimateSequence("ConfigConsumable")
		var_14_30:AnimateSequence("ConfigConsumable")
		var_14_58:AnimateSequence("ConfigConsumable")
	end

	var_14_0._sequences.ConfigConsumable = var_14_151

	local var_14_152
	local var_14_153 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigOperator", var_14_153)

	local var_14_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigOperator", var_14_154)

	local var_14_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigOperator", var_14_155)

	local var_14_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigOperator", var_14_156)

	local var_14_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigOperator", var_14_157)

	local var_14_158 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigOperator", var_14_158)

	local var_14_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigOperator", var_14_159)

	local function var_14_160()
		var_14_4:AnimateSequence("ConfigOperator")
		var_14_6:AnimateSequence("ConfigOperator")
		var_14_8:AnimateSequence("ConfigOperator")
		var_14_10:AnimateSequence("ConfigOperator")
		var_14_12:AnimateSequence("ConfigOperator")
		var_14_18:AnimateSequence("ConfigOperator")
		var_14_30:AnimateSequence("ConfigOperator")
	end

	var_14_0._sequences.ConfigOperator = var_14_160

	local var_14_161
	local var_14_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigQuip", var_14_162)

	local var_14_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigQuip", var_14_163)

	local var_14_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigQuip", var_14_164)

	local var_14_165 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigQuip", var_14_165)

	local var_14_166 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigQuip", var_14_166)

	local var_14_167 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigQuip", var_14_167)

	local var_14_168 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigQuip", var_14_168)

	local function var_14_169()
		var_14_4:AnimateSequence("ConfigQuip")
		var_14_6:AnimateSequence("ConfigQuip")
		var_14_8:AnimateSequence("ConfigQuip")
		var_14_10:AnimateSequence("ConfigQuip")
		var_14_12:AnimateSequence("ConfigQuip")
		var_14_18:AnimateSequence("ConfigQuip")
		var_14_30:AnimateSequence("ConfigQuip")
	end

	var_14_0._sequences.ConfigQuip = var_14_169

	local var_14_170
	local var_14_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -745
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -245
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -745
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -245
		},
		{
			value = 0.25,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -267,
			easing = LUI.EASING.outQuartic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 233,
			easing = LUI.EASING.outQuartic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 2400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -745,
			easing = LUI.EASING.snap
		},
		{
			duration = 2400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -245,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_14_34:RegisterAnimationSequence("GlintAnime", var_14_171)

	local function var_14_172()
		var_14_34:AnimateLoop("GlintAnime")
	end

	var_14_0._sequences.GlintAnime = var_14_172

	local var_14_173
	local var_14_174 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigExecution", var_14_174)

	local var_14_175 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigExecution", var_14_175)

	local var_14_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigExecution", var_14_176)

	local var_14_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigExecution", var_14_177)

	local var_14_178 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigExecution", var_14_178)

	local var_14_179 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigExecution", var_14_179)

	local var_14_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigExecution", var_14_180)

	local function var_14_181()
		var_14_4:AnimateSequence("ConfigExecution")
		var_14_6:AnimateSequence("ConfigExecution")
		var_14_8:AnimateSequence("ConfigExecution")
		var_14_10:AnimateSequence("ConfigExecution")
		var_14_12:AnimateSequence("ConfigExecution")
		var_14_18:AnimateSequence("ConfigExecution")
		var_14_30:AnimateSequence("ConfigExecution")
	end

	var_14_0._sequences.ConfigExecution = var_14_181

	local var_14_182
	local var_14_183 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigBattlePass", var_14_183)

	local var_14_184 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigBattlePass", var_14_184)

	local var_14_185 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigBattlePass", var_14_185)

	local var_14_186 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigBattlePass", var_14_186)

	local var_14_187 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigBattlePass", var_14_187)

	local var_14_188 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigBattlePass", var_14_188)

	local var_14_189 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigBattlePass", var_14_189)

	local function var_14_190()
		var_14_4:AnimateSequence("ConfigBattlePass")
		var_14_6:AnimateSequence("ConfigBattlePass")
		var_14_8:AnimateSequence("ConfigBattlePass")
		var_14_10:AnimateSequence("ConfigBattlePass")
		var_14_12:AnimateSequence("ConfigBattlePass")
		var_14_18:AnimateSequence("ConfigBattlePass")
		var_14_30:AnimateSequence("ConfigBattlePass")
	end

	var_14_0._sequences.ConfigBattlePass = var_14_190

	local var_14_191
	local var_14_192 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_45:RegisterAnimationSequence("ShowPurchasedFrame", var_14_192)

	local var_14_193 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_47:RegisterAnimationSequence("ShowPurchasedFrame", var_14_193)

	local var_14_194 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_49:RegisterAnimationSequence("ShowPurchasedFrame", var_14_194)

	local function var_14_195()
		var_14_45:AnimateSequence("ShowPurchasedFrame")
		var_14_47:AnimateSequence("ShowPurchasedFrame")
		var_14_49:AnimateSequence("ShowPurchasedFrame")
	end

	var_14_0._sequences.ShowPurchasedFrame = var_14_195

	local var_14_196
	local var_14_197 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigSpecial", var_14_197)

	local var_14_198 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigSpecial", var_14_198)

	local var_14_199 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigSpecial", var_14_199)

	local var_14_200 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigSpecial", var_14_200)

	local var_14_201 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigSpecial", var_14_201)

	local var_14_202 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigSpecial", var_14_202)

	local var_14_203 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("ConfigSpecial", var_14_203)

	local var_14_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigSpecial", var_14_204)

	local function var_14_205()
		var_14_4:AnimateSequence("ConfigSpecial")
		var_14_6:AnimateSequence("ConfigSpecial")
		var_14_8:AnimateSequence("ConfigSpecial")
		var_14_10:AnimateSequence("ConfigSpecial")
		var_14_12:AnimateSequence("ConfigSpecial")
		var_14_18:AnimateSequence("ConfigSpecial")
		var_14_26:AnimateSequence("ConfigSpecial")
		var_14_30:AnimateSequence("ConfigSpecial")
	end

	var_14_0._sequences.ConfigSpecial = var_14_205

	local var_14_206
	local var_14_207 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -34
		}
	}

	var_14_28:RegisterAnimationSequence("AR", var_14_207)

	local var_14_208 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		}
	}

	var_14_56:RegisterAnimationSequence("AR", var_14_208)

	local function var_14_209()
		var_14_28:AnimateSequence("AR")
		var_14_56:AnimateSequence("AR")
	end

	var_14_0._sequences.AR = var_14_209

	local var_14_210
	local var_14_211 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigVehicleCamo", var_14_211)

	local var_14_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigVehicleCamo", var_14_212)

	local var_14_213 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigVehicleCamo", var_14_213)

	local var_14_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigVehicleCamo", var_14_214)

	local var_14_215 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigVehicleCamo", var_14_215)

	local var_14_216 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigVehicleCamo", var_14_216)

	local var_14_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigVehicleCamo", var_14_217)

	local function var_14_218()
		var_14_4:AnimateSequence("ConfigVehicleCamo")
		var_14_6:AnimateSequence("ConfigVehicleCamo")
		var_14_8:AnimateSequence("ConfigVehicleCamo")
		var_14_10:AnimateSequence("ConfigVehicleCamo")
		var_14_12:AnimateSequence("ConfigVehicleCamo")
		var_14_18:AnimateSequence("ConfigVehicleCamo")
		var_14_30:AnimateSequence("ConfigVehicleCamo")
	end

	var_14_0._sequences.ConfigVehicleCamo = var_14_218

	local var_14_219
	local var_14_220 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigMission", var_14_220)

	local var_14_221 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigMission", var_14_221)

	local var_14_222 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigMission", var_14_222)

	local var_14_223 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigMission", var_14_223)

	local var_14_224 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigMission", var_14_224)

	local var_14_225 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigMission", var_14_225)

	local var_14_226 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("ConfigMission", var_14_226)

	local var_14_227 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigMission", var_14_227)

	local function var_14_228()
		var_14_4:AnimateSequence("ConfigMission")
		var_14_6:AnimateSequence("ConfigMission")
		var_14_8:AnimateSequence("ConfigMission")
		var_14_10:AnimateSequence("ConfigMission")
		var_14_12:AnimateSequence("ConfigMission")
		var_14_18:AnimateSequence("ConfigMission")
		var_14_26:AnimateSequence("ConfigMission")
		var_14_30:AnimateSequence("ConfigMission")
	end

	var_14_0._sequences.ConfigMission = var_14_228

	local var_14_229
	local var_14_230 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigCollection", var_14_230)

	local var_14_231 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigCollection", var_14_231)

	local var_14_232 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigCollection", var_14_232)

	local var_14_233 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigCollection", var_14_233)

	local var_14_234 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigCollection", var_14_234)

	local var_14_235 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigCollection", var_14_235)

	local var_14_236 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ConfigCollection", var_14_236)

	local var_14_237 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("ConfigCollection", var_14_237)

	local var_14_238 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ConfigCollection", var_14_238)

	local var_14_239 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigCollection", var_14_239)

	local function var_14_240()
		var_14_4:AnimateSequence("ConfigCollection")
		var_14_6:AnimateSequence("ConfigCollection")
		var_14_8:AnimateSequence("ConfigCollection")
		var_14_10:AnimateSequence("ConfigCollection")
		var_14_12:AnimateSequence("ConfigCollection")
		var_14_18:AnimateSequence("ConfigCollection")
		var_14_24:AnimateSequence("ConfigCollection")
		var_14_26:AnimateSequence("ConfigCollection")
		var_14_28:AnimateSequence("ConfigCollection")
		var_14_30:AnimateSequence("ConfigCollection")
	end

	var_14_0._sequences.ConfigCollection = var_14_240

	local var_14_241
	local var_14_242 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_38:RegisterAnimationSequence("ShowAlreadyOwned", var_14_242)

	local var_14_243 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_56:RegisterAnimationSequence("ShowAlreadyOwned", var_14_243)

	local function var_14_244()
		var_14_38:AnimateSequence("ShowAlreadyOwned")
		var_14_56:AnimateSequence("ShowAlreadyOwned")
	end

	var_14_0._sequences.ShowAlreadyOwned = var_14_244

	local var_14_245
	local var_14_246 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_38:RegisterAnimationSequence("HideAlreadyOwned", var_14_246)

	local var_14_247 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_56:RegisterAnimationSequence("HideAlreadyOwned", var_14_247)

	local function var_14_248()
		var_14_38:AnimateSequence("HideAlreadyOwned")
		var_14_56:AnimateSequence("HideAlreadyOwned")
	end

	var_14_0._sequences.HideAlreadyOwned = var_14_248

	local var_14_249
	local var_14_250 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_49:RegisterAnimationSequence("ShowGoldFrame", var_14_250)

	local function var_14_251()
		var_14_49:AnimateSequence("ShowGoldFrame")
	end

	var_14_0._sequences.ShowGoldFrame = var_14_251

	local var_14_252
	local var_14_253 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigBOExclusive", var_14_253)

	local var_14_254 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigBOExclusive", var_14_254)

	local var_14_255 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_32:RegisterAnimationSequence("ConfigBOExclusive", var_14_255)

	local function var_14_256()
		var_14_18:AnimateSequence("ConfigBOExclusive")
		var_14_30:AnimateSequence("ConfigBOExclusive")
		var_14_32:AnimateSequence("ConfigBOExclusive")
	end

	var_14_0._sequences.ConfigBOExclusive = var_14_256

	local var_14_257
	local var_14_258 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigMWExclusive", var_14_258)

	local var_14_259 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigMWExclusive", var_14_259)

	local var_14_260 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_32:RegisterAnimationSequence("ConfigMWExclusive", var_14_260)

	local function var_14_261()
		var_14_18:AnimateSequence("ConfigMWExclusive")
		var_14_30:AnimateSequence("ConfigMWExclusive")
		var_14_32:AnimateSequence("ConfigMWExclusive")
	end

	var_14_0._sequences.ConfigMWExclusive = var_14_261

	local var_14_262
	local var_14_263 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_12:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_263)

	local var_14_264 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_264)

	local var_14_265 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_265)

	local var_14_266 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_266)

	local var_14_267 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_267)

	local var_14_268 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_268)

	local var_14_269 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("BOExclusiveFocusGained", var_14_269)

	local function var_14_270()
		var_14_12:AnimateSequence("BOExclusiveFocusGained")
		var_14_18:AnimateSequence("BOExclusiveFocusGained")
		var_14_20:AnimateSequence("BOExclusiveFocusGained")
		var_14_22:AnimateSequence("BOExclusiveFocusGained")
		var_14_30:AnimateSequence("BOExclusiveFocusGained")
		var_14_52:AnimateSequence("BOExclusiveFocusGained")
		var_14_54:AnimateSequence("BOExclusiveFocusGained")
	end

	var_14_0._sequences.BOExclusiveFocusGained = var_14_270

	local var_14_271
	local var_14_272 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_12:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_272)

	local var_14_273 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_273)

	local var_14_274 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_274)

	local var_14_275 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_275)

	local var_14_276 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_276)

	local var_14_277 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_277)

	local var_14_278 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("MWExclusiveFocusGained", var_14_278)

	local function var_14_279()
		var_14_12:AnimateSequence("MWExclusiveFocusGained")
		var_14_18:AnimateSequence("MWExclusiveFocusGained")
		var_14_20:AnimateSequence("MWExclusiveFocusGained")
		var_14_22:AnimateSequence("MWExclusiveFocusGained")
		var_14_30:AnimateSequence("MWExclusiveFocusGained")
		var_14_52:AnimateSequence("MWExclusiveFocusGained")
		var_14_54:AnimateSequence("MWExclusiveFocusGained")
	end

	var_14_0._sequences.MWExclusiveFocusGained = var_14_279

	local var_14_280
	local var_14_281 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_12:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_281)

	local var_14_282 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_14_18:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_282)

	local var_14_283 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_283)

	local var_14_284 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_284)

	local var_14_285 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_285)

	local var_14_286 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_286)

	local var_14_287 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("BOExclusiveFocusLost", var_14_287)

	local function var_14_288()
		var_14_12:AnimateSequence("BOExclusiveFocusLost")
		var_14_18:AnimateSequence("BOExclusiveFocusLost")
		var_14_20:AnimateSequence("BOExclusiveFocusLost")
		var_14_22:AnimateSequence("BOExclusiveFocusLost")
		var_14_30:AnimateSequence("BOExclusiveFocusLost")
		var_14_52:AnimateSequence("BOExclusiveFocusLost")
		var_14_54:AnimateSequence("BOExclusiveFocusLost")
	end

	var_14_0._sequences.BOExclusiveFocusLost = var_14_288

	local var_14_289
	local var_14_290 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_12:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_290)

	local var_14_291 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_14_18:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_291)

	local var_14_292 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_292)

	local var_14_293 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_293)

	local var_14_294 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_294)

	local var_14_295 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_295)

	local var_14_296 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("MWExclusiveFocusLost", var_14_296)

	local function var_14_297()
		var_14_12:AnimateSequence("MWExclusiveFocusLost")
		var_14_18:AnimateSequence("MWExclusiveFocusLost")
		var_14_20:AnimateSequence("MWExclusiveFocusLost")
		var_14_22:AnimateSequence("MWExclusiveFocusLost")
		var_14_30:AnimateSequence("MWExclusiveFocusLost")
		var_14_52:AnimateSequence("MWExclusiveFocusLost")
		var_14_54:AnimateSequence("MWExclusiveFocusLost")
	end

	var_14_0._sequences.MWExclusiveFocusLost = var_14_297

	local var_14_298
	local var_14_299 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigExecutionT9", var_14_299)

	local var_14_300 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigExecutionT9", var_14_300)

	local var_14_301 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigExecutionT9", var_14_301)

	local var_14_302 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigExecutionT9", var_14_302)

	local var_14_303 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigExecutionT9", var_14_303)

	local var_14_304 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigExecutionT9", var_14_304)

	local var_14_305 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigExecutionT9", var_14_305)

	local function var_14_306()
		var_14_4:AnimateSequence("ConfigExecutionT9")
		var_14_6:AnimateSequence("ConfigExecutionT9")
		var_14_8:AnimateSequence("ConfigExecutionT9")
		var_14_10:AnimateSequence("ConfigExecutionT9")
		var_14_12:AnimateSequence("ConfigExecutionT9")
		var_14_18:AnimateSequence("ConfigExecutionT9")
		var_14_30:AnimateSequence("ConfigExecutionT9")
	end

	var_14_0._sequences.ConfigExecutionT9 = var_14_306

	local var_14_307
	local var_14_308 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_308)

	local var_14_309 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_309)

	local var_14_310 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_310)

	local var_14_311 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_311)

	local var_14_312 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_312)

	local var_14_313 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_313)

	local var_14_314 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigVehicleCamoT9", var_14_314)

	local function var_14_315()
		var_14_4:AnimateSequence("ConfigVehicleCamoT9")
		var_14_6:AnimateSequence("ConfigVehicleCamoT9")
		var_14_8:AnimateSequence("ConfigVehicleCamoT9")
		var_14_10:AnimateSequence("ConfigVehicleCamoT9")
		var_14_12:AnimateSequence("ConfigVehicleCamoT9")
		var_14_18:AnimateSequence("ConfigVehicleCamoT9")
		var_14_30:AnimateSequence("ConfigVehicleCamoT9")
	end

	var_14_0._sequences.ConfigVehicleCamoT9 = var_14_315

	local var_14_316
	local var_14_317 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigVehicleHorn", var_14_317)

	local var_14_318 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigVehicleHorn", var_14_318)

	local var_14_319 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigVehicleHorn", var_14_319)

	local var_14_320 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -133
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_chyron_fx_t9")
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigVehicleHorn", var_14_320)

	local var_14_321 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigVehicleHorn", var_14_321)

	local var_14_322 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigVehicleHorn", var_14_322)

	local var_14_323 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigVehicleHorn", var_14_323)

	local function var_14_324()
		var_14_4:AnimateSequence("ConfigVehicleHorn")
		var_14_6:AnimateSequence("ConfigVehicleHorn")
		var_14_8:AnimateSequence("ConfigVehicleHorn")
		var_14_10:AnimateSequence("ConfigVehicleHorn")
		var_14_12:AnimateSequence("ConfigVehicleHorn")
		var_14_18:AnimateSequence("ConfigVehicleHorn")
		var_14_30:AnimateSequence("ConfigVehicleHorn")
	end

	var_14_0._sequences.ConfigVehicleHorn = var_14_324

	local var_14_325
	local var_14_326 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigXP", var_14_326)

	local var_14_327 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
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

	var_14_6:RegisterAnimationSequence("ConfigXP", var_14_327)

	local var_14_328 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigXP", var_14_328)

	local var_14_329 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigXP", var_14_329)

	local var_14_330 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.normal
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 231
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigXP", var_14_330)

	local var_14_331 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.normal
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigXP", var_14_331)

	local var_14_332 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ConfigXP", var_14_332)

	local var_14_333 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("ConfigXP", var_14_333)

	local var_14_334 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_14_28:RegisterAnimationSequence("ConfigXP", var_14_334)

	local var_14_335 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigXP", var_14_335)

	local var_14_336 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_40:RegisterAnimationSequence("ConfigXP", var_14_336)

	local var_14_337 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		}
	}

	var_14_52:RegisterAnimationSequence("ConfigXP", var_14_337)

	local function var_14_338()
		var_14_4:AnimateSequence("ConfigXP")
		var_14_6:AnimateSequence("ConfigXP")
		var_14_8:AnimateSequence("ConfigXP")
		var_14_10:AnimateSequence("ConfigXP")
		var_14_12:AnimateSequence("ConfigXP")
		var_14_18:AnimateSequence("ConfigXP")
		var_14_24:AnimateSequence("ConfigXP")
		var_14_26:AnimateSequence("ConfigXP")
		var_14_28:AnimateSequence("ConfigXP")
		var_14_30:AnimateSequence("ConfigXP")
		var_14_40:AnimateSequence("ConfigXP")
		var_14_52:AnimateSequence("ConfigXP")
	end

	var_14_0._sequences.ConfigXP = var_14_338

	local var_14_339
	local var_14_340 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigGestureT9", var_14_340)

	local var_14_341 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigGestureT9", var_14_341)

	local var_14_342 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigGestureT9", var_14_342)

	local var_14_343 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigGestureT9", var_14_343)

	local var_14_344 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigGestureT9", var_14_344)

	local var_14_345 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigGestureT9", var_14_345)

	local var_14_346 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigGestureT9", var_14_346)

	local function var_14_347()
		var_14_4:AnimateSequence("ConfigGestureT9")
		var_14_6:AnimateSequence("ConfigGestureT9")
		var_14_8:AnimateSequence("ConfigGestureT9")
		var_14_10:AnimateSequence("ConfigGestureT9")
		var_14_12:AnimateSequence("ConfigGestureT9")
		var_14_18:AnimateSequence("ConfigGestureT9")
		var_14_30:AnimateSequence("ConfigGestureT9")
	end

	var_14_0._sequences.ConfigGestureT9 = var_14_347

	local var_14_348
	local var_14_349 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigVGExclusive", var_14_349)

	local var_14_350 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigVGExclusive", var_14_350)

	local var_14_351 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_32:RegisterAnimationSequence("ConfigVGExclusive", var_14_351)

	local function var_14_352()
		var_14_18:AnimateSequence("ConfigVGExclusive")
		var_14_30:AnimateSequence("ConfigVGExclusive")
		var_14_32:AnimateSequence("ConfigVGExclusive")
	end

	var_14_0._sequences.ConfigVGExclusive = var_14_352

	local var_14_353
	local var_14_354 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_12:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_354)

	local var_14_355 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_355)

	local var_14_356 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_356)

	local var_14_357 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_357)

	local var_14_358 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_358)

	local var_14_359 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_359)

	local var_14_360 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("VGExclusiveFocusGained", var_14_360)

	local function var_14_361()
		var_14_12:AnimateSequence("VGExclusiveFocusGained")
		var_14_18:AnimateSequence("VGExclusiveFocusGained")
		var_14_20:AnimateSequence("VGExclusiveFocusGained")
		var_14_22:AnimateSequence("VGExclusiveFocusGained")
		var_14_30:AnimateSequence("VGExclusiveFocusGained")
		var_14_52:AnimateSequence("VGExclusiveFocusGained")
		var_14_54:AnimateSequence("VGExclusiveFocusGained")
	end

	var_14_0._sequences.VGExclusiveFocusGained = var_14_361

	local var_14_362
	local var_14_363 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_12:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_363)

	local var_14_364 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_14_18:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_364)

	local var_14_365 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_365)

	local var_14_366 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_366)

	local var_14_367 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_367)

	local var_14_368 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_368)

	local var_14_369 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("VGExclusiveFocusLost", var_14_369)

	local function var_14_370()
		var_14_12:AnimateSequence("VGExclusiveFocusLost")
		var_14_18:AnimateSequence("VGExclusiveFocusLost")
		var_14_20:AnimateSequence("VGExclusiveFocusLost")
		var_14_22:AnimateSequence("VGExclusiveFocusLost")
		var_14_30:AnimateSequence("VGExclusiveFocusLost")
		var_14_52:AnimateSequence("VGExclusiveFocusLost")
		var_14_54:AnimateSequence("VGExclusiveFocusLost")
	end

	var_14_0._sequences.VGExclusiveFocusLost = var_14_370

	local var_14_371
	local var_14_372 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigPlayerTitle", var_14_372)

	local var_14_373 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ConfigPlayerTitle", var_14_373)

	local var_14_374 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -0.4
		}
	}

	var_14_58:RegisterAnimationSequence("ConfigPlayerTitle", var_14_374)

	local function var_14_375()
		var_14_12:AnimateSequence("ConfigPlayerTitle")
		var_14_28:AnimateSequence("ConfigPlayerTitle")
		var_14_58:AnimateSequence("ConfigPlayerTitle")
	end

	var_14_0._sequences.ConfigPlayerTitle = var_14_375

	local var_14_376
	local var_14_377 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigReticle1x1", var_14_377)

	local var_14_378 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigReticle1x1", var_14_378)

	local var_14_379 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigReticle1x1", var_14_379)

	local var_14_380 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigReticle1x1", var_14_380)

	local var_14_381 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigReticle1x1", var_14_381)

	local var_14_382 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigReticle1x1", var_14_382)

	local var_14_383 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigReticle1x1", var_14_383)

	local function var_14_384()
		var_14_4:AnimateSequence("ConfigReticle1x1")
		var_14_6:AnimateSequence("ConfigReticle1x1")
		var_14_8:AnimateSequence("ConfigReticle1x1")
		var_14_10:AnimateSequence("ConfigReticle1x1")
		var_14_12:AnimateSequence("ConfigReticle1x1")
		var_14_18:AnimateSequence("ConfigReticle1x1")
		var_14_30:AnimateSequence("ConfigReticle1x1")
	end

	var_14_0._sequences.ConfigReticle1x1 = var_14_384

	local var_14_385
	local var_14_386 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigS4Misc", var_14_386)

	local var_14_387 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigS4Misc", var_14_387)

	local var_14_388 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigS4Misc", var_14_388)

	local var_14_389 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigS4Misc", var_14_389)

	local var_14_390 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 27
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -83
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigS4Misc", var_14_390)

	local var_14_391 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigS4Misc", var_14_391)

	local var_14_392 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigS4Misc", var_14_392)

	local var_14_393 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_58:RegisterAnimationSequence("ConfigS4Misc", var_14_393)

	local function var_14_394()
		var_14_4:AnimateSequence("ConfigS4Misc")
		var_14_6:AnimateSequence("ConfigS4Misc")
		var_14_8:AnimateSequence("ConfigS4Misc")
		var_14_10:AnimateSequence("ConfigS4Misc")
		var_14_12:AnimateSequence("ConfigS4Misc")
		var_14_18:AnimateSequence("ConfigS4Misc")
		var_14_30:AnimateSequence("ConfigS4Misc")
		var_14_58:AnimateSequence("ConfigS4Misc")
	end

	var_14_0._sequences.ConfigS4Misc = var_14_394

	local var_14_395
	local var_14_396 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_58:RegisterAnimationSequence("HidePlayerTitle", var_14_396)

	local function var_14_397()
		var_14_58:AnimateSequence("HidePlayerTitle")
	end

	var_14_0._sequences.HidePlayerTitle = var_14_397

	local var_14_398
	local var_14_399 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigS4MiscWide", var_14_399)

	local var_14_400 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1.18,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 138
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
		}
	}

	var_14_6:RegisterAnimationSequence("ConfigS4MiscWide", var_14_400)

	local var_14_401 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigS4MiscWide", var_14_401)

	local var_14_402 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigS4MiscWide", var_14_402)

	local var_14_403 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigS4MiscWide", var_14_403)

	local var_14_404 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigS4MiscWide", var_14_404)

	local var_14_405 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigS4MiscWide", var_14_405)

	local function var_14_406()
		var_14_4:AnimateSequence("ConfigS4MiscWide")
		var_14_6:AnimateSequence("ConfigS4MiscWide")
		var_14_8:AnimateSequence("ConfigS4MiscWide")
		var_14_10:AnimateSequence("ConfigS4MiscWide")
		var_14_12:AnimateSequence("ConfigS4MiscWide")
		var_14_18:AnimateSequence("ConfigS4MiscWide")
		var_14_30:AnimateSequence("ConfigS4MiscWide")
	end

	var_14_0._sequences.ConfigS4MiscWide = var_14_406

	local var_14_407
	local var_14_408 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_12:RegisterAnimationSequence("WZFocusGained", var_14_408)

	local var_14_409 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_14_18:RegisterAnimationSequence("WZFocusGained", var_14_409)

	local var_14_410 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_14_20:RegisterAnimationSequence("WZFocusGained", var_14_410)

	local var_14_411 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_14_22:RegisterAnimationSequence("WZFocusGained", var_14_411)

	local var_14_412 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_14_28:RegisterAnimationSequence("WZFocusGained", var_14_412)

	local var_14_413 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_14_30:RegisterAnimationSequence("WZFocusGained", var_14_413)

	local var_14_414 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_14_52:RegisterAnimationSequence("WZFocusGained", var_14_414)

	local var_14_415 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_14_54:RegisterAnimationSequence("WZFocusGained", var_14_415)

	local function var_14_416()
		var_14_12:AnimateSequence("WZFocusGained")
		var_14_18:AnimateSequence("WZFocusGained")
		var_14_20:AnimateSequence("WZFocusGained")
		var_14_22:AnimateSequence("WZFocusGained")
		var_14_28:AnimateSequence("WZFocusGained")
		var_14_30:AnimateSequence("WZFocusGained")
		var_14_52:AnimateSequence("WZFocusGained")
		var_14_54:AnimateSequence("WZFocusGained")
	end

	var_14_0._sequences.WZFocusGained = var_14_416

	local var_14_417
	local var_14_418 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_14_12:RegisterAnimationSequence("WZFocusLost", var_14_418)

	local var_14_419 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_14_18:RegisterAnimationSequence("WZFocusLost", var_14_419)

	local var_14_420 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("WZFocusLost", var_14_420)

	local var_14_421 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("WZFocusLost", var_14_421)

	local var_14_422 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_14_30:RegisterAnimationSequence("WZFocusLost", var_14_422)

	local var_14_423 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_52:RegisterAnimationSequence("WZFocusLost", var_14_423)

	local var_14_424 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_54:RegisterAnimationSequence("WZFocusLost", var_14_424)

	local function var_14_425()
		var_14_12:AnimateSequence("WZFocusLost")
		var_14_18:AnimateSequence("WZFocusLost")
		var_14_20:AnimateSequence("WZFocusLost")
		var_14_22:AnimateSequence("WZFocusLost")
		var_14_30:AnimateSequence("WZFocusLost")
		var_14_52:AnimateSequence("WZFocusLost")
		var_14_54:AnimateSequence("WZFocusLost")
	end

	var_14_0._sequences.WZFocusLost = var_14_425

	local var_14_426
	local var_14_427 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigWatch", var_14_427)

	local var_14_428 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigWatch", var_14_428)

	local var_14_429 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigWatch", var_14_429)

	local var_14_430 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigWatch", var_14_430)

	local var_14_431 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -138
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigWatch", var_14_431)

	local var_14_432 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigWatch", var_14_432)

	local var_14_433 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigWatch", var_14_433)

	local var_14_434 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_58:RegisterAnimationSequence("ConfigWatch", var_14_434)

	local function var_14_435()
		var_14_4:AnimateSequence("ConfigWatch")
		var_14_6:AnimateSequence("ConfigWatch")
		var_14_8:AnimateSequence("ConfigWatch")
		var_14_10:AnimateSequence("ConfigWatch")
		var_14_12:AnimateSequence("ConfigWatch")
		var_14_18:AnimateSequence("ConfigWatch")
		var_14_30:AnimateSequence("ConfigWatch")
		var_14_58:AnimateSequence("ConfigWatch")
	end

	var_14_0._sequences.ConfigWatch = var_14_435

	local var_14_436
	local var_14_437 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ConfigReticle3x4", var_14_437)

	local var_14_438 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_14_6:RegisterAnimationSequence("ConfigReticle3x4", var_14_438)

	local var_14_439 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ConfigReticle3x4", var_14_439)

	local var_14_440 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ConfigReticle3x4", var_14_440)

	local var_14_441 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ConfigReticle3x4", var_14_441)

	local var_14_442 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ConfigReticle3x4", var_14_442)

	local var_14_443 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_14_30:RegisterAnimationSequence("ConfigReticle3x4", var_14_443)

	local function var_14_444()
		var_14_4:AnimateSequence("ConfigReticle3x4")
		var_14_6:AnimateSequence("ConfigReticle3x4")
		var_14_8:AnimateSequence("ConfigReticle3x4")
		var_14_10:AnimateSequence("ConfigReticle3x4")
		var_14_12:AnimateSequence("ConfigReticle3x4")
		var_14_18:AnimateSequence("ConfigReticle3x4")
		var_14_30:AnimateSequence("ConfigReticle3x4")
	end

	var_14_0._sequences.ConfigReticle3x4 = var_14_444

	var_0_10(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("LootItemCard", LootItemCard)
LockTable(_M)
