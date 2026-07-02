module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_1)

	local var_1_0
	local var_1_1

	if arg_1_1 == LOOT.itemTypes.PLAYERCARD then
		var_1_0 = "ConfigPlayercard"
		var_1_1 = arg_1_2

		arg_1_0.Background:SetPixelGridEnabled(true)
		arg_1_0.Background:SetPixelGridContrast(0.8, 0)
		arg_1_0.Background:SetPixelGridBlockWidth(3, 0)
		arg_1_0.Background:SetPixelGridBlockHeight(3, 0)
		arg_1_0.Background:SetPixelGridGutterWidth(1, 0)
		arg_1_0.Background:SetPixelGridGutterHeight(1, 0)
	elseif arg_1_1 == LOOT.itemTypes.EMBLEM then
		var_1_0 = "ConfigEmblem"
		var_1_1 = "ui_loot_bg_emblem"
	elseif arg_1_1 == LOOT.itemTypes.CHARM then
		var_1_0 = "ConfigCharm"
		var_1_1 = "ui_loot_bg_charm"
	elseif arg_1_1 == LOOT.itemTypes.STICKER then
		var_1_0 = "ConfigSticker"
		var_1_1 = "ui_loot_bg_sticker"
	elseif arg_1_1 == LOOT.itemTypes.GESTURES then
		var_1_0 = "ConfigGesture"
		var_1_1 = "ui_loot_bg_gesture"
	elseif arg_1_1 == LOOT.itemTypes.SPRAYS then
		var_1_0 = "ConfigSpray"
		var_1_1 = "ui_loot_bg_spray"
	elseif arg_1_1 == LOOT.itemTypes.CONSUMABLE then
		var_1_0 = "ConfigConsumable"
		var_1_1 = "ui_loot_bg_generic"
	elseif arg_1_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		var_1_0 = "ConfigExecution"
		var_1_1 = "ui_loot_bg_execution"
	elseif arg_1_1 == LOOT.itemTypes.OPERATOR or arg_1_1 == LOOT.itemTypes.OPERATOR_SKIN then
		var_1_0 = "ConfigOperator"
		var_1_1 = "ui_loot_bg_operator"
	elseif arg_1_1 == LOOT.itemTypes.QUIP then
		var_1_0 = "ConfigQuip"
		var_1_1 = "ui_loot_bg_operator"
	elseif arg_1_1 == LOOT.itemTypes.VEHICLE_HORN then
		var_1_0 = "ConfigVehicleHorn"
		var_1_1 = "ui_loot_bg_vehicle_horn"

		arg_1_0.Foreground:setImage(RegisterMaterial("ui_vehicle_horn"))
	elseif arg_1_1 == LOOT.itemTypes.VEHICLE_TRACK then
		var_1_0 = "ConfigVehicleHorn"
		var_1_1 = "ui_loot_bg_vehicle_horn"

		arg_1_0.Foreground:setImage(RegisterMaterial("ui_vehicle_battle_track"))
	elseif arg_1_1 == LOOT.itemTypes.BATTLE_PASS then
		var_1_0 = "ConfigBattlePass"
		var_1_1 = "ui_loot_bg_battlepass"
	elseif arg_1_1 == LOOT.itemTypes.VEHICLE_CAMO then
		var_1_0 = "ConfigVehicleCamo"
		var_1_1 = "ui_loot_bg_vehicle"
	elseif arg_1_1 == LOOT.itemTypes.MISSION then
		var_1_0 = "ConfigMission"
		var_1_1 = "ui_loot_bg_feature"
	elseif arg_1_1 == LOOT.itemTypes.BUNDLE then
		var_1_0 = "ConfigCollection"
		var_1_1 = "ui_loot_bg_generic"
	elseif arg_1_1 == LOOT.itemTypes.SPECIAL then
		var_1_0 = "ConfigSpecial"
		var_1_1 = "ui_loot_bg_generic"

		if IsLanguageArabic() then
			arg_1_0.ItemName:SetMaxVisibleLines(2)
		else
			arg_1_0.ItemName:SetMaxVisibleLines(3)
		end
	else
		var_1_0 = "ConfigDefault"
		var_1_1 = "ui_loot_bg_generic"
	end

	if var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, var_1_0)
	end

	if var_1_1 then
		arg_1_0.Background:setImage(RegisterMaterial(var_1_1))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = WEAPON.GetWeaponTracerColor(arg_2_0._controllerIndex, arg_2_2)

	if var_2_0 then
		if var_2_0 == SWATCHES.Tracer.freedom then
			arg_2_0.Tracer:setImage(RegisterMaterial("loot_card_overlay_tracer_freedom"))
		else
			arg_2_0.Tracer:setImage(RegisterMaterial("loot_card_overlay_tracer_white"))
		end

		arg_2_0.Tracer:SetRGBFromTable(var_2_0)
		arg_2_0.Tracer:SetAlpha(1)
	else
		arg_2_0.Tracer:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0)
	assert(arg_3_0.Background)
	arg_3_0.Background:SetPixelGridEnabled(false)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateCardConfig = var_0_0
	arg_4_0.ClearCardBackground = var_0_2
	arg_4_0.SetupTracer = var_0_1
	arg_4_0._previewsEnabled = true

	arg_4_0.Background:SetMask(arg_4_0.Mask)
	arg_4_0.Foreground:SetMask(arg_4_0.Mask)
	arg_4_0.Glint:SetMask(arg_4_0.Mask)

	if IsLanguageArabic() then
		arg_4_0.ItemName:SetFontSize(30 * _1080p)
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	local var_4_0 = IsLanguageArabic() and 30 * _1080p or 24 * _1080p
	local var_4_1 = IsLanguageArabic() and 32 * _1080p or 26 * _1080p
	local var_4_2 = 20 * _1080p
	local var_4_3 = 22 * _1080p

	arg_4_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
		if arg_4_0._previewsEnabled then
			arg_4_0.ItemName:SetFontSize(var_4_1)
			arg_4_0.AlreadyOwned:SetFontSize(var_4_3)
			arg_4_0.ItemType:SetFontSize(var_4_3)
			arg_4_0:SetScale(0.1, 150, LUI.EASING.outQuadratic)
			ACTIONS.AnimateSequence(arg_4_0, "FocusGained")
		end
	end)
	arg_4_0:addEventHandler("lose_focus", function(arg_6_0, arg_6_1)
		if arg_4_0._previewsEnabled then
			arg_4_0.ItemName:SetFontSize(var_4_0)
			arg_4_0.AlreadyOwned:SetFontSize(var_4_2)
			arg_4_0.ItemType:SetFontSize(var_4_2)
			arg_4_0:SetScale(0, 100)
			ACTIONS.AnimateSequence(arg_4_0, "FocusLost")
		end
	end)

	local var_4_4 = 8

	if IsLanguageSpanish() or IsLanguageRussian() then
		var_4_4 = 10
	elseif IsLanguageItalian() then
		var_4_4 = 12
	end

	arg_4_0.ItemName:SetLeft(_1080p * var_4_4)
	arg_4_0.ItemName:SetRight(_1080p * -var_4_4)
end

function LootItemCard(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 280 * _1080p)

	var_7_0.id = "LootItemCard"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "PlayercardBackground"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -30)
	var_7_0:addElement(var_7_4)

	var_7_0.PlayercardBackground = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Background"

	var_7_6:SetRGBFromInt(0, 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -140, _1080p * 140)
	var_7_0:addElement(var_7_6)

	var_7_0.Background = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "PlayercardOverlay"

	var_7_8:SetRGBFromInt(0, 0)
	var_7_8:SetAlpha(0.5, 0)
	var_7_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -82)
	var_7_0:addElement(var_7_8)

	var_7_0.PlayercardOverlay = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "QuipOverlay"

	var_7_10:SetAlpha(0, 0)
	var_7_10:SetScale(-0.35, 0)
	var_7_10:setImage(RegisterMaterial("icon_chyron_fx"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -156, _1080p * 156, _1080p * -86, _1080p * 42)
	var_7_0:addElement(var_7_10)

	var_7_0.QuipOverlay = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "Foreground"

	var_7_12:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -140, _1080p * 140)
	var_7_0:addElement(var_7_12)

	var_7_0.Foreground = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "Tracer"

	var_7_14:SetAlpha(0, 0)
	var_7_14:setImage(RegisterMaterial("loot_card_overlay_tracer_white"), 0)
	var_7_14:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -103, _1080p * 103, _1080p * -138, _1080p * 68)
	var_7_0:addElement(var_7_14)

	var_7_0.Tracer = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "ItemTypeBackground"

	var_7_16:SetAlpha(0.15, 0)
	var_7_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 30)
	var_7_0:addElement(var_7_16)

	var_7_0.ItemTypeBackground = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "HighlightGradientBottom"

	var_7_18:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_7_18:SetAlpha(0, 0)
	var_7_18:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 30)
	var_7_0:addElement(var_7_18)

	var_7_0.HighlightGradientBottom = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIImage.new()

	var_7_20.id = "HighlightGradientTop"

	var_7_20:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_7_20:SetAlpha(0, 0)
	var_7_20:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_7_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 65)
	var_7_0:addElement(var_7_20)

	var_7_0.HighlightGradientTop = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIImage.new()

	var_7_22.id = "RarityBG"

	var_7_22:SetRGBFromTable(SWATCHES.itemRarity.qualityAlt3, 0)
	var_7_22:SetAlpha(0.8, 0)
	var_7_22:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * -82, _1080p * -2)
	var_7_0:addElement(var_7_22)

	var_7_0.RarityBG = var_7_22

	local var_7_23
	local var_7_24 = LUI.UIImage.new()

	var_7_24.id = "RarityImage"

	var_7_24:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_7_24:SetScale(-0.25, 0)
	var_7_24:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_7_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -16, _1080p * 16, _1080p * -80, _1080p * -48)
	var_7_0:addElement(var_7_24)

	var_7_0.RarityImage = var_7_24

	local var_7_25
	local var_7_26 = LUI.UIStyledText.new()

	var_7_26.id = "ItemName"

	var_7_26:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_7_26:setText("THORNE", 0)
	var_7_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_26:SetAlignment(LUI.Alignment.Center)
	var_7_26:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_7_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_7_26:SetStartupDelay(2000)
	var_7_26:SetLineHoldTime(400)
	var_7_26:SetAnimMoveTime(2000)
	var_7_26:SetAnimMoveSpeed(150)
	var_7_26:SetEndDelay(2000)
	var_7_26:SetCrossfadeTime(250)
	var_7_26:SetFadeInTime(300)
	var_7_26:SetFadeOutTime(300)
	var_7_26:SetMaxVisibleLines(2)
	var_7_26:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 5, _1080p * -5, _1080p * -30, _1080p * -6)
	var_7_0:addElement(var_7_26)

	var_7_0.ItemName = var_7_26

	local var_7_27
	local var_7_28 = LUI.UIStyledText.new()

	var_7_28.id = "ItemType"

	var_7_28:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_7_28:SetAlpha(0.75, 0)
	var_7_28:setText("", 0)
	var_7_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_28:SetWordWrap(false)
	var_7_28:SetAlignment(LUI.Alignment.Center)
	var_7_28:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_28:SetStartupDelay(2000)
	var_7_28:SetLineHoldTime(400)
	var_7_28:SetAnimMoveTime(2000)
	var_7_28:SetAnimMoveSpeed(150)
	var_7_28:SetEndDelay(2000)
	var_7_28:SetCrossfadeTime(1000)
	var_7_28:SetFadeInTime(300)
	var_7_28:SetFadeOutTime(300)
	var_7_28:SetMaxVisibleLines(1)
	var_7_28:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * 5, _1080p * 25)
	var_7_0:addElement(var_7_28)

	var_7_0.ItemType = var_7_28

	local var_7_29
	local var_7_30 = LUI.UIImage.new()

	var_7_30.id = "Glint"

	var_7_30:SetAlpha(0, 0)
	var_7_30:SetZRotation(-40, 0)
	var_7_30:SetScale(0.1, 0)
	var_7_30:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -745, _1080p * -245, _1080p * -359, _1080p * 141)
	var_7_0:addElement(var_7_30)

	var_7_0.Glint = var_7_30

	local var_7_31
	local var_7_32 = LUI.UIImage.new()

	var_7_32.id = "Mask"

	var_7_32:setImage(RegisterMaterial("stencil_mask"), 0)
	var_7_32:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, 0, 0)
	var_7_0:addElement(var_7_32)

	var_7_0.Mask = var_7_32

	local var_7_33
	local var_7_34 = LUI.UIImage.new()

	var_7_34.id = "AlreadyOwnedBG"

	var_7_34:SetRGBFromTable(SWATCHES.BattlePass.PopupBacker, 0)
	var_7_34:SetAlpha(0, 0)
	var_7_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 184, 0, _1080p * 26)
	var_7_0:addElement(var_7_34)

	var_7_0.AlreadyOwnedBG = var_7_34

	local var_7_35
	local var_7_36 = LUI.UIImage.new()

	var_7_36.id = "Border"

	var_7_36:setImage(RegisterMaterial("loot_card_border_4"), 0)
	var_7_0:addElement(var_7_36)

	var_7_0.Border = var_7_36

	local var_7_37
	local var_7_38 = LUI.UIImage.new()

	var_7_38.id = "BlueprintIcon"

	var_7_38:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_7_38:SetAlpha(0, 0)
	var_7_38:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_7_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * 13, _1080p * 77)
	var_7_0:addElement(var_7_38)

	var_7_0.BlueprintIcon = var_7_38

	local var_7_39
	local var_7_40 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_7_41 = LUI.UIBorder.new(var_7_40)

	var_7_41.id = "CheckboxFrame"

	var_7_41:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_7_41:SetAlpha(0, 0)
	var_7_41:SetBorderThicknessRight(_1080p * 0, 0)
	var_7_41:SetBorderThicknessTop(_1080p * 0, 0)
	var_7_41:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -26, _1080p * -2, _1080p * 2, _1080p * 26)
	var_7_0:addElement(var_7_41)

	var_7_0.CheckboxFrame = var_7_41

	local var_7_42
	local var_7_43 = LUI.UIImage.new()

	var_7_43.id = "Checkbox"

	var_7_43:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_7_43:SetAlpha(0, 0)
	var_7_43:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_7_43:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -1, _1080p * 1, _1080p * 25)
	var_7_0:addElement(var_7_43)

	var_7_0.Checkbox = var_7_43

	local var_7_44
	local var_7_45 = LUI.UIImage.new()

	var_7_45.id = "Frame"

	var_7_45:SetAlpha(0, 0)
	var_7_45:setImage(RegisterMaterial("battlepass_lootcard_trim_gold_9slice"), 0)
	var_7_45:Setup9SliceImage(_1080p * 70, _1080p * 70, 0.5, 0.5)
	var_7_0:addElement(var_7_45)

	var_7_0.Frame = var_7_45

	local var_7_46
	local var_7_47 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_7_48 = LUI.UIBorder.new(var_7_47)

	var_7_48.id = "HighlightBorder"

	var_7_48:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_7_48:SetAlpha(0, 0)
	var_7_48:SetBorderThicknessLeft(_1080p * 2, 0)
	var_7_48:SetBorderThicknessRight(_1080p * 2, 0)
	var_7_48:SetBorderThicknessTop(_1080p * 2, 0)
	var_7_48:SetBorderThicknessBottom(_1080p * 2, 0)
	var_7_48:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * 30)
	var_7_0:addElement(var_7_48)

	var_7_0.HighlightBorder = var_7_48

	local var_7_49
	local var_7_50 = LUI.UIImage.new()

	var_7_50.id = "HighlightGlow"

	var_7_50:SetRGBFromTable(SWATCHES.Store.Highlight, 0)
	var_7_50:SetAlpha(0, 0)
	var_7_50:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_7_50:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -44, _1080p * 44, _1080p * -25, _1080p * 25)
	var_7_0:addElement(var_7_50)

	var_7_0.HighlightGlow = var_7_50

	local var_7_51
	local var_7_52 = LUI.UIStyledText.new()

	var_7_52.id = "AlreadyOwned"

	var_7_52:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_7_52:SetAlpha(0, 0)
	var_7_52:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/ALREADY_OWNED")), 0)
	var_7_52:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_52:SetAlignment(LUI.Alignment.Center)
	var_7_52:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_7_52:SetStartupDelay(2000)
	var_7_52:SetLineHoldTime(400)
	var_7_52:SetAnimMoveTime(2000)
	var_7_52:SetAnimMoveSpeed(150)
	var_7_52:SetEndDelay(2000)
	var_7_52:SetCrossfadeTime(250)
	var_7_52:SetFadeInTime(300)
	var_7_52:SetFadeOutTime(300)
	var_7_52:SetMaxVisibleLines(1)
	var_7_52:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 4, _1080p * 24)
	var_7_0:addElement(var_7_52)

	var_7_0.AlreadyOwned = var_7_52

	local function var_7_53()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_53

	local var_7_54
	local var_7_55 = {
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

	var_7_12:RegisterAnimationSequence("FocusGained", var_7_55)

	local var_7_56 = {
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

	var_7_16:RegisterAnimationSequence("FocusGained", var_7_56)

	local var_7_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("FocusGained", var_7_57)

	local var_7_58 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("FocusGained", var_7_58)

	local var_7_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.Highlight
		}
	}

	var_7_28:RegisterAnimationSequence("FocusGained", var_7_59)

	local var_7_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_48:RegisterAnimationSequence("FocusGained", var_7_60)

	local var_7_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_50:RegisterAnimationSequence("FocusGained", var_7_61)

	local function var_7_62()
		var_7_12:AnimateSequence("FocusGained")
		var_7_16:AnimateSequence("FocusGained")
		var_7_18:AnimateSequence("FocusGained")
		var_7_20:AnimateSequence("FocusGained")
		var_7_28:AnimateSequence("FocusGained")
		var_7_48:AnimateSequence("FocusGained")
		var_7_50:AnimateSequence("FocusGained")
	end

	var_7_0._sequences.FocusGained = var_7_62

	local var_7_63
	local var_7_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_12:RegisterAnimationSequence("FocusLost", var_7_64)

	local var_7_65 = {
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

	var_7_16:RegisterAnimationSequence("FocusLost", var_7_65)

	local var_7_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("FocusLost", var_7_66)

	local var_7_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("FocusLost", var_7_67)

	local var_7_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.DupeFillUnavailable
		}
	}

	var_7_28:RegisterAnimationSequence("FocusLost", var_7_68)

	local var_7_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_48:RegisterAnimationSequence("FocusLost", var_7_69)

	local var_7_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_50:RegisterAnimationSequence("FocusLost", var_7_70)

	local function var_7_71()
		var_7_12:AnimateSequence("FocusLost")
		var_7_16:AnimateSequence("FocusLost")
		var_7_18:AnimateSequence("FocusLost")
		var_7_20:AnimateSequence("FocusLost")
		var_7_28:AnimateSequence("FocusLost")
		var_7_48:AnimateSequence("FocusLost")
		var_7_50:AnimateSequence("FocusLost")
	end

	var_7_0._sequences.FocusLost = var_7_71

	local var_7_72
	local var_7_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigPlayercard", var_7_73)

	local var_7_74 = {
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

	var_7_6:RegisterAnimationSequence("ConfigPlayercard", var_7_74)

	local var_7_75 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigPlayercard", var_7_75)

	local var_7_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigPlayercard", var_7_76)

	local var_7_77 = {
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

	var_7_12:RegisterAnimationSequence("ConfigPlayercard", var_7_77)

	local function var_7_78()
		var_7_4:AnimateSequence("ConfigPlayercard")
		var_7_6:AnimateSequence("ConfigPlayercard")
		var_7_8:AnimateSequence("ConfigPlayercard")
		var_7_10:AnimateSequence("ConfigPlayercard")
		var_7_12:AnimateSequence("ConfigPlayercard")
	end

	var_7_0._sequences.ConfigPlayercard = var_7_78

	local var_7_79
	local var_7_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigDefault", var_7_80)

	local var_7_81 = {
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

	var_7_6:RegisterAnimationSequence("ConfigDefault", var_7_81)

	local var_7_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigDefault", var_7_82)

	local var_7_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigDefault", var_7_83)

	local var_7_84 = {
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

	var_7_12:RegisterAnimationSequence("ConfigDefault", var_7_84)

	local function var_7_85()
		var_7_4:AnimateSequence("ConfigDefault")
		var_7_6:AnimateSequence("ConfigDefault")
		var_7_8:AnimateSequence("ConfigDefault")
		var_7_10:AnimateSequence("ConfigDefault")
		var_7_12:AnimateSequence("ConfigDefault")
	end

	var_7_0._sequences.ConfigDefault = var_7_85

	local var_7_86
	local var_7_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigCharm", var_7_87)

	local var_7_88 = {
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

	var_7_6:RegisterAnimationSequence("ConfigCharm", var_7_88)

	local var_7_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigCharm", var_7_89)

	local var_7_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigCharm", var_7_90)

	local var_7_91 = {
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

	var_7_12:RegisterAnimationSequence("ConfigCharm", var_7_91)

	local function var_7_92()
		var_7_4:AnimateSequence("ConfigCharm")
		var_7_6:AnimateSequence("ConfigCharm")
		var_7_8:AnimateSequence("ConfigCharm")
		var_7_10:AnimateSequence("ConfigCharm")
		var_7_12:AnimateSequence("ConfigCharm")
	end

	var_7_0._sequences.ConfigCharm = var_7_92

	local var_7_93
	local var_7_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigSpray", var_7_94)

	local var_7_95 = {
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

	var_7_6:RegisterAnimationSequence("ConfigSpray", var_7_95)

	local var_7_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigSpray", var_7_96)

	local var_7_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigSpray", var_7_97)

	local var_7_98 = {
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

	var_7_12:RegisterAnimationSequence("ConfigSpray", var_7_98)

	local function var_7_99()
		var_7_4:AnimateSequence("ConfigSpray")
		var_7_6:AnimateSequence("ConfigSpray")
		var_7_8:AnimateSequence("ConfigSpray")
		var_7_10:AnimateSequence("ConfigSpray")
		var_7_12:AnimateSequence("ConfigSpray")
	end

	var_7_0._sequences.ConfigSpray = var_7_99

	local var_7_100
	local var_7_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigEmblem", var_7_101)

	local var_7_102 = {
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

	var_7_6:RegisterAnimationSequence("ConfigEmblem", var_7_102)

	local var_7_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigEmblem", var_7_103)

	local var_7_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigEmblem", var_7_104)

	local var_7_105 = {
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

	var_7_12:RegisterAnimationSequence("ConfigEmblem", var_7_105)

	local function var_7_106()
		var_7_4:AnimateSequence("ConfigEmblem")
		var_7_6:AnimateSequence("ConfigEmblem")
		var_7_8:AnimateSequence("ConfigEmblem")
		var_7_10:AnimateSequence("ConfigEmblem")
		var_7_12:AnimateSequence("ConfigEmblem")
	end

	var_7_0._sequences.ConfigEmblem = var_7_106

	local var_7_107
	local var_7_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigSticker", var_7_108)

	local var_7_109 = {
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

	var_7_6:RegisterAnimationSequence("ConfigSticker", var_7_109)

	local var_7_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigSticker", var_7_110)

	local var_7_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigSticker", var_7_111)

	local var_7_112 = {
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

	var_7_12:RegisterAnimationSequence("ConfigSticker", var_7_112)

	local function var_7_113()
		var_7_4:AnimateSequence("ConfigSticker")
		var_7_6:AnimateSequence("ConfigSticker")
		var_7_8:AnimateSequence("ConfigSticker")
		var_7_10:AnimateSequence("ConfigSticker")
		var_7_12:AnimateSequence("ConfigSticker")
	end

	var_7_0._sequences.ConfigSticker = var_7_113

	local var_7_114
	local var_7_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigGesture", var_7_115)

	local var_7_116 = {
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

	var_7_6:RegisterAnimationSequence("ConfigGesture", var_7_116)

	local var_7_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigGesture", var_7_117)

	local var_7_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigGesture", var_7_118)

	local var_7_119 = {
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

	var_7_12:RegisterAnimationSequence("ConfigGesture", var_7_119)

	local function var_7_120()
		var_7_4:AnimateSequence("ConfigGesture")
		var_7_6:AnimateSequence("ConfigGesture")
		var_7_8:AnimateSequence("ConfigGesture")
		var_7_10:AnimateSequence("ConfigGesture")
		var_7_12:AnimateSequence("ConfigGesture")
	end

	var_7_0._sequences.ConfigGesture = var_7_120

	local var_7_121
	local var_7_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigConsumable", var_7_122)

	local var_7_123 = {
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

	var_7_6:RegisterAnimationSequence("ConfigConsumable", var_7_123)

	local var_7_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigConsumable", var_7_124)

	local var_7_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigConsumable", var_7_125)

	local var_7_126 = {
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

	var_7_12:RegisterAnimationSequence("ConfigConsumable", var_7_126)

	local function var_7_127()
		var_7_4:AnimateSequence("ConfigConsumable")
		var_7_6:AnimateSequence("ConfigConsumable")
		var_7_8:AnimateSequence("ConfigConsumable")
		var_7_10:AnimateSequence("ConfigConsumable")
		var_7_12:AnimateSequence("ConfigConsumable")
	end

	var_7_0._sequences.ConfigConsumable = var_7_127

	local var_7_128
	local var_7_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigOperator", var_7_129)

	local var_7_130 = {
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

	var_7_6:RegisterAnimationSequence("ConfigOperator", var_7_130)

	local var_7_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigOperator", var_7_131)

	local var_7_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigOperator", var_7_132)

	local var_7_133 = {
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

	var_7_12:RegisterAnimationSequence("ConfigOperator", var_7_133)

	local function var_7_134()
		var_7_4:AnimateSequence("ConfigOperator")
		var_7_6:AnimateSequence("ConfigOperator")
		var_7_8:AnimateSequence("ConfigOperator")
		var_7_10:AnimateSequence("ConfigOperator")
		var_7_12:AnimateSequence("ConfigOperator")
	end

	var_7_0._sequences.ConfigOperator = var_7_134

	local var_7_135
	local var_7_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigQuip", var_7_136)

	local var_7_137 = {
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

	var_7_6:RegisterAnimationSequence("ConfigQuip", var_7_137)

	local var_7_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigQuip", var_7_138)

	local var_7_139 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigQuip", var_7_139)

	local var_7_140 = {
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

	var_7_12:RegisterAnimationSequence("ConfigQuip", var_7_140)

	local function var_7_141()
		var_7_4:AnimateSequence("ConfigQuip")
		var_7_6:AnimateSequence("ConfigQuip")
		var_7_8:AnimateSequence("ConfigQuip")
		var_7_10:AnimateSequence("ConfigQuip")
		var_7_12:AnimateSequence("ConfigQuip")
	end

	var_7_0._sequences.ConfigQuip = var_7_141

	local var_7_142
	local var_7_143 = {
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

	var_7_30:RegisterAnimationSequence("GlintAnime", var_7_143)

	local function var_7_144()
		var_7_30:AnimateLoop("GlintAnime")
	end

	var_7_0._sequences.GlintAnime = var_7_144

	local var_7_145
	local var_7_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigExecution", var_7_146)

	local var_7_147 = {
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

	var_7_6:RegisterAnimationSequence("ConfigExecution", var_7_147)

	local var_7_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigExecution", var_7_148)

	local var_7_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigExecution", var_7_149)

	local var_7_150 = {
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

	var_7_12:RegisterAnimationSequence("ConfigExecution", var_7_150)

	local function var_7_151()
		var_7_4:AnimateSequence("ConfigExecution")
		var_7_6:AnimateSequence("ConfigExecution")
		var_7_8:AnimateSequence("ConfigExecution")
		var_7_10:AnimateSequence("ConfigExecution")
		var_7_12:AnimateSequence("ConfigExecution")
	end

	var_7_0._sequences.ConfigExecution = var_7_151

	local var_7_152
	local var_7_153 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigBattlePass", var_7_153)

	local var_7_154 = {
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

	var_7_6:RegisterAnimationSequence("ConfigBattlePass", var_7_154)

	local var_7_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigBattlePass", var_7_155)

	local var_7_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigBattlePass", var_7_156)

	local var_7_157 = {
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

	var_7_12:RegisterAnimationSequence("ConfigBattlePass", var_7_157)

	local function var_7_158()
		var_7_4:AnimateSequence("ConfigBattlePass")
		var_7_6:AnimateSequence("ConfigBattlePass")
		var_7_8:AnimateSequence("ConfigBattlePass")
		var_7_10:AnimateSequence("ConfigBattlePass")
		var_7_12:AnimateSequence("ConfigBattlePass")
	end

	var_7_0._sequences.ConfigBattlePass = var_7_158

	local var_7_159
	local var_7_160 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_41:RegisterAnimationSequence("ShowPurchasedFrame", var_7_160)

	local var_7_161 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_43:RegisterAnimationSequence("ShowPurchasedFrame", var_7_161)

	local var_7_162 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_45:RegisterAnimationSequence("ShowPurchasedFrame", var_7_162)

	local function var_7_163()
		var_7_41:AnimateSequence("ShowPurchasedFrame")
		var_7_43:AnimateSequence("ShowPurchasedFrame")
		var_7_45:AnimateSequence("ShowPurchasedFrame")
	end

	var_7_0._sequences.ShowPurchasedFrame = var_7_163

	local var_7_164
	local var_7_165 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigSpecial", var_7_165)

	local var_7_166 = {
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

	var_7_6:RegisterAnimationSequence("ConfigSpecial", var_7_166)

	local var_7_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigSpecial", var_7_167)

	local var_7_168 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigSpecial", var_7_168)

	local var_7_169 = {
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

	var_7_12:RegisterAnimationSequence("ConfigSpecial", var_7_169)

	local var_7_170 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("ConfigSpecial", var_7_170)

	local function var_7_171()
		var_7_4:AnimateSequence("ConfigSpecial")
		var_7_6:AnimateSequence("ConfigSpecial")
		var_7_8:AnimateSequence("ConfigSpecial")
		var_7_10:AnimateSequence("ConfigSpecial")
		var_7_12:AnimateSequence("ConfigSpecial")
		var_7_24:AnimateSequence("ConfigSpecial")
	end

	var_7_0._sequences.ConfigSpecial = var_7_171

	local var_7_172
	local var_7_173 = {
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

	var_7_26:RegisterAnimationSequence("AR", var_7_173)

	local var_7_174 = {
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

	var_7_52:RegisterAnimationSequence("AR", var_7_174)

	local function var_7_175()
		var_7_26:AnimateSequence("AR")
		var_7_52:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_175

	local var_7_176
	local var_7_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigVehicleCamo", var_7_177)

	local var_7_178 = {
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

	var_7_6:RegisterAnimationSequence("ConfigVehicleCamo", var_7_178)

	local var_7_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigVehicleCamo", var_7_179)

	local var_7_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigVehicleCamo", var_7_180)

	local var_7_181 = {
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

	var_7_12:RegisterAnimationSequence("ConfigVehicleCamo", var_7_181)

	local function var_7_182()
		var_7_4:AnimateSequence("ConfigVehicleCamo")
		var_7_6:AnimateSequence("ConfigVehicleCamo")
		var_7_8:AnimateSequence("ConfigVehicleCamo")
		var_7_10:AnimateSequence("ConfigVehicleCamo")
		var_7_12:AnimateSequence("ConfigVehicleCamo")
	end

	var_7_0._sequences.ConfigVehicleCamo = var_7_182

	local var_7_183
	local var_7_184 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigMission", var_7_184)

	local var_7_185 = {
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

	var_7_6:RegisterAnimationSequence("ConfigMission", var_7_185)

	local var_7_186 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigMission", var_7_186)

	local var_7_187 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigMission", var_7_187)

	local var_7_188 = {
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

	var_7_12:RegisterAnimationSequence("ConfigMission", var_7_188)

	local var_7_189 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("ConfigMission", var_7_189)

	local function var_7_190()
		var_7_4:AnimateSequence("ConfigMission")
		var_7_6:AnimateSequence("ConfigMission")
		var_7_8:AnimateSequence("ConfigMission")
		var_7_10:AnimateSequence("ConfigMission")
		var_7_12:AnimateSequence("ConfigMission")
		var_7_24:AnimateSequence("ConfigMission")
	end

	var_7_0._sequences.ConfigMission = var_7_190

	local var_7_191
	local var_7_192 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigVehicleHorn", var_7_192)

	local var_7_193 = {
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

	var_7_6:RegisterAnimationSequence("ConfigVehicleHorn", var_7_193)

	local var_7_194 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigVehicleHorn", var_7_194)

	local var_7_195 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigVehicleHorn", var_7_195)

	local var_7_196 = {
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

	var_7_12:RegisterAnimationSequence("ConfigVehicleHorn", var_7_196)

	local function var_7_197()
		var_7_4:AnimateSequence("ConfigVehicleHorn")
		var_7_6:AnimateSequence("ConfigVehicleHorn")
		var_7_8:AnimateSequence("ConfigVehicleHorn")
		var_7_10:AnimateSequence("ConfigVehicleHorn")
		var_7_12:AnimateSequence("ConfigVehicleHorn")
	end

	var_7_0._sequences.ConfigVehicleHorn = var_7_197

	local var_7_198
	local var_7_199 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ConfigCollection", var_7_199)

	local var_7_200 = {
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

	var_7_6:RegisterAnimationSequence("ConfigCollection", var_7_200)

	local var_7_201 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ConfigCollection", var_7_201)

	local var_7_202 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigCollection", var_7_202)

	local var_7_203 = {
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

	var_7_12:RegisterAnimationSequence("ConfigCollection", var_7_203)

	local var_7_204 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("ConfigCollection", var_7_204)

	local var_7_205 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("ConfigCollection", var_7_205)

	local var_7_206 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("ConfigCollection", var_7_206)

	local function var_7_207()
		var_7_4:AnimateSequence("ConfigCollection")
		var_7_6:AnimateSequence("ConfigCollection")
		var_7_8:AnimateSequence("ConfigCollection")
		var_7_10:AnimateSequence("ConfigCollection")
		var_7_12:AnimateSequence("ConfigCollection")
		var_7_22:AnimateSequence("ConfigCollection")
		var_7_24:AnimateSequence("ConfigCollection")
		var_7_26:AnimateSequence("ConfigCollection")
	end

	var_7_0._sequences.ConfigCollection = var_7_207

	local var_7_208
	local var_7_209 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("ShowAlreadyOwned", var_7_209)

	local var_7_210 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_52:RegisterAnimationSequence("ShowAlreadyOwned", var_7_210)

	local function var_7_211()
		var_7_34:AnimateSequence("ShowAlreadyOwned")
		var_7_52:AnimateSequence("ShowAlreadyOwned")
	end

	var_7_0._sequences.ShowAlreadyOwned = var_7_211

	local var_7_212
	local var_7_213 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("HideAlreadyOwned", var_7_213)

	local var_7_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_52:RegisterAnimationSequence("HideAlreadyOwned", var_7_214)

	local function var_7_215()
		var_7_34:AnimateSequence("HideAlreadyOwned")
		var_7_52:AnimateSequence("HideAlreadyOwned")
	end

	var_7_0._sequences.HideAlreadyOwned = var_7_215

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LootItemCard", LootItemCard)
LockTable(_M)
