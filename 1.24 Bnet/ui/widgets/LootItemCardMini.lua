module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._isMini = true
	arg_1_0._setMiniImage = arg_1_1

	ACTIONS.AnimateSequence(arg_1_0, "Mini")
end

local function var_0_1(arg_2_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

local function var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "ConfigDefault")
	arg_3_0.Background:setImage(RegisterMaterial("ui_loot_bg_generic"))
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_1)

	local var_4_0
	local var_4_1

	arg_4_0.Background:SetPixelGridEnabled(false)

	if arg_4_1.type == LOOT.itemTypes.PLAYERCARD then
		var_4_0 = "ConfigPlayercard"
		var_4_1 = arg_4_1.image

		arg_4_0.Background:SetPixelGridEnabled(true)

		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.EMBLEM then
		var_4_0 = "ConfigEmblem"
		var_4_1 = "ui_loot_bg_emblem"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.CHARM then
		var_4_0 = "ConfigCharm"
		var_4_1 = "ui_loot_bg_charm"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.STICKER then
		var_4_0 = "ConfigSticker"
		var_4_1 = "ui_loot_bg_sticker"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.GESTURES then
		var_4_0 = "ConfigGesture"
		var_4_1 = "ui_loot_bg_gesture"
	elseif arg_4_1.type == LOOT.itemTypes.SPRAYS then
		var_4_0 = "ConfigSpray"
		var_4_1 = "ui_loot_bg_spray"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.CONSUMABLE or arg_4_1.type == LOOT.itemTypes.FEATURE and not arg_4_1.isOperatorChallenge then
		var_4_0 = "ConfigConsumable"
		var_4_1 = "ui_loot_bg_generic"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == "xp" then
		var_4_0 = "ConfigXP"
		var_4_1 = "ui_loot_bg_generic"
	elseif arg_4_1.type == "mission" then
		var_4_0 = "ConfigMission"
		var_4_1 = "ui_loot_bg_execution"
	elseif arg_4_1.type == LOOT.itemTypes.OPERATOR_EXECUTION then
		var_4_0 = "ConfigExecution"
		var_4_1 = "ui_loot_bg_execution"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.OPERATOR or arg_4_1.type == LOOT.itemTypes.OPERATOR_SKIN then
		var_4_0 = "ConfigOperator"
		var_4_1 = "ui_loot_bg_operator"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.VEHICLE_CAMO then
		var_4_0 = "ConfigVehicleCamo"
		var_4_1 = "ui_loot_bg_vehicle"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.VEHICLE_HORN then
		var_4_0 = "ConfigVehicleHorn"
		var_4_1 = "ui_loot_bg_vehicle_horn"
		arg_4_0._setMiniImage = false
		arg_4_1.image = "ui_vehicle_horn"
	elseif arg_4_1.type == LOOT.itemTypes.VEHICLE_TRACK then
		var_4_0 = "ConfigVehicleHorn"
		var_4_1 = "ui_loot_bg_vehicle_horn"
		arg_4_0._setMiniImage = false
		arg_4_1.image = "ui_vehicle_battle_track"
	elseif arg_4_1.type == LOOT.itemTypes.QUIP then
		var_4_0 = "ConfigQuip"
		var_4_1 = "ui_loot_bg_operator"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.BATTLE_PASS then
		var_4_0 = "ConfigBattlePass"
		var_4_1 = "ui_loot_bg_battlepass"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.SPECIAL then
		var_4_0 = "ConfigSpecial"
		var_4_1 = "ui_loot_bg_generic"

		arg_4_0.ItemName:SetMaxVisibleLines(3)
	elseif arg_4_1.type == LOOT.itemTypes.ATTACHMENT then
		var_4_0 = "ConfigAttachment"
		var_4_1 = "ui_loot_bg_generic"
	elseif arg_4_1.type == LOOT.itemTypes.MISSION then
		var_4_0 = "ConfigMission"
		var_4_1 = "ui_loot_bg_feature"
		arg_4_0._setMiniImage = false
	elseif arg_4_1.type == LOOT.itemTypes.BUNDLE then
		var_4_0 = "ConfigCollection"
		var_4_1 = "ui_loot_bg_generic"
		arg_4_0._setMiniImage = false
	else
		var_4_0 = "ConfigDefault"
		var_4_1 = "ui_loot_bg_generic"
		arg_4_0._setMiniImage = false
	end

	if not arg_4_0._isMini then
		arg_4_0.ItemName:setText(arg_4_1.name)
	elseif arg_4_1.amount then
		arg_4_0.ItemName:setText(arg_4_1.type ~= "xp" and arg_4_1.amount or arg_4_1.name)
		arg_4_0.ItemName:SetAlpha(1)
	elseif arg_4_1.duration then
		arg_4_0.ItemName:setText(arg_4_1.duration)
		arg_4_0.ItemName:SetAlpha(1)
	else
		arg_4_0.ItemName:SetAlpha(0)
	end

	if arg_4_1.image and #arg_4_1.image > 0 then
		arg_4_0.Foreground:setImage(RegisterMaterial(arg_4_1.image))
	else
		arg_4_0.Foreground:setImage(RegisterMaterial("placeholder_x"))
	end

	if arg_4_1.type ~= "xp" and arg_4_1.type ~= "mission" then
		local var_4_2 = ""

		if arg_4_1.type == LOOT.itemTypes.FEATURE then
			if arg_4_1.isOperatorChallenge then
				var_4_2 = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS")
			else
				var_4_2 = Engine.CBBHFCGDIC("LOOT_MP/CONSUMABLE")
			end
		else
			var_4_2 = LOOT.GetItemClassName(arg_4_1.type, arg_4_1.ref)
		end

		arg_4_0.ItemType:setText(var_4_2)
		arg_4_0.RarityImage:setImage(RegisterMaterial(arg_4_1.rarityImage))
		arg_4_0.RarityImage:SetRGBFromTable(arg_4_1.rarityColor)
		arg_4_0.BlueprintIcon:SetRGBFromTable(arg_4_1.rarityColor)
		arg_4_0.Border:SetRGBFromTable(arg_4_1.rarityColor)

		if arg_4_0._isMini then
			arg_4_0.RarityBG:SetRGBFromTable(arg_4_1.rarityColor)
		else
			arg_4_0.RarityBG:SetRGBFromTable(LOOT.GetDarkRarityColor(arg_4_1.rarity))
		end
	else
		arg_4_0.ItemType:setText("")
		arg_4_0.Border:SetRGBFromTable(SWATCHES.itemRarity.qualityBase)
	end

	if arg_4_1.type == LOOT.itemTypes.WEAPON and arg_4_1.itemID then
		local var_4_3 = WEAPON.IsVariant(arg_4_0._controllerIndex, arg_4_1.itemID)

		if var_4_3 ~= nil and var_4_3 == true then
			arg_4_0.BlueprintIcon:SetAlpha(0.7)
		else
			arg_4_0.BlueprintIcon:SetAlpha(0)
		end
	else
		arg_4_0.BlueprintIcon:SetAlpha(0)
	end

	if var_4_0 then
		ACTIONS.AnimateSequence(arg_4_0, var_4_0)
	end

	local var_4_4 = arg_4_1.type == LOOT.itemTypes.PLAYERCARD

	if arg_4_0._setMiniImage then
		ACTIONS.AnimateSequence(arg_4_0, var_4_4 and "MiniPlayerCardImage" or "MiniSquareImage")

		if arg_4_1.type == "xp" and arg_4_0._isMini then
			ACTIONS.AnimateSequence(arg_4_0, "XpMini")
		end
	end

	if var_4_1 then
		arg_4_0.Background:setImage(RegisterMaterial(var_4_1))
	end
end

local function var_0_4(arg_5_0)
	assert(arg_5_0.Background)
	arg_5_0.Background:SetPixelGridEnabled(false)
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = WEAPON.GetWeaponTracerColor(arg_6_0._controllerIndex, arg_6_2)

	if var_6_0 then
		if var_6_0 == SWATCHES.Tracer.freedom then
			arg_6_0.Tracer:setImage(RegisterMaterial("loot_card_overlay_tracer_freedom"))
		else
			arg_6_0.Tracer:setImage(RegisterMaterial("loot_card_overlay_tracer_white"))
		end

		arg_6_0.Tracer:SetRGBFromTable(var_6_0)
		arg_6_0.Tracer:SetAlpha(1)
	else
		arg_6_0.Tracer:SetAlpha(0)
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.ResetCardConfig = var_0_2
	arg_7_0.UpdateCardConfig = var_0_3
	arg_7_0.ClearCardBackground = var_0_4
	arg_7_0.SetMiniMode = var_0_0
	arg_7_0.SetupTracer = var_0_5
	arg_7_0._isMini = false
	arg_7_0._setMiniImage = false
	arg_7_0._controllerIndex = arg_7_1

	arg_7_0.Background:SetMask(arg_7_0.BackgroundMask)
	arg_7_0.Foreground:SetMask(arg_7_0.BackgroundMask)
	arg_7_0.Background:SetPixelGridContrast(0.2, 0)
	arg_7_0.Background:SetPixelGridBlockWidth(2, 0)
	arg_7_0.Background:SetPixelGridBlockHeight(2, 0)
	arg_7_0.Background:SetPixelGridGutterWidth(1, 0)
	arg_7_0.Background:SetPixelGridGutterHeight(1, 0)
	arg_7_0:registerEventHandler("on_close", function(arg_8_0)
		arg_8_0:ReleaseRenderTarget(arg_7_1)
	end)
	var_0_1(arg_7_0)
end

function LootItemCardMini(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_9_0.id = "LootItemCardMini"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "PlayercardBackground"

	var_9_4:SetRGBFromInt(0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.PlayercardBackground = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "BackgroundMask"

	var_9_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_9_0:addElement(var_9_6)

	var_9_0.BackgroundMask = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "Background"

	var_9_8:SetRGBFromInt(0, 0)
	var_9_0:addElement(var_9_8)

	var_9_0.Background = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "PlayercardOverlay"

	var_9_10:SetRGBFromInt(0, 0)
	var_9_10:SetAlpha(0.5, 0)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -60)
	var_9_0:addElement(var_9_10)

	var_9_0.PlayercardOverlay = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "QuipOverlay"

	var_9_12:SetScale(-0.35, 0)
	var_9_12:setImage(RegisterMaterial("icon_chyron_fx"), 0)
	var_9_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -39, _1080p * 39, _1080p * 31, _1080p * -75)
	var_9_0:addElement(var_9_12)

	var_9_0.QuipOverlay = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIImage.new()

	var_9_14.id = "Foreground"

	var_9_14:setImage(RegisterMaterial("ui_vehicle_horn"), 0)
	var_9_0:addElement(var_9_14)

	var_9_0.Foreground = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIImage.new()

	var_9_16.id = "RarityBG"

	var_9_16:SetRGBFromTable(SWATCHES.itemRarity.qualityAlt3, 0)
	var_9_16:SetAlpha(0.8, 0)
	var_9_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -60, 0)
	var_9_0:addElement(var_9_16)

	var_9_0.RarityBG = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIImage.new()

	var_9_18.id = "BlueprintIcon"

	var_9_18:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_9_18:SetAlpha(0, 0)
	var_9_18:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_9_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -21, _1080p * 21, _1080p * -90, _1080p * -48)
	var_9_0:addElement(var_9_18)

	var_9_0.BlueprintIcon = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIImage.new()

	var_9_20.id = "RarityImage"

	var_9_20:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_9_20:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_9_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -11, _1080p * 11, _1080p * -55, _1080p * -33)
	var_9_0:addElement(var_9_20)

	var_9_0.RarityImage = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIStyledText.new()

	var_9_22.id = "ItemName"

	var_9_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_22:setText("THORNE", 0)
	var_9_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_22:SetWordWrap(false)
	var_9_22:SetAlignment(LUI.Alignment.Center)
	var_9_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_22:SetStartupDelay(750)
	var_9_22:SetLineHoldTime(400)
	var_9_22:SetAnimMoveTime(1000)
	var_9_22:SetAnimMoveSpeed(150)
	var_9_22:SetEndDelay(750)
	var_9_22:SetCrossfadeTime(1000)
	var_9_22:SetFadeInTime(300)
	var_9_22:SetFadeOutTime(300)
	var_9_22:SetMaxVisibleLines(1)
	var_9_22:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 8, _1080p * -8, _1080p * -30, _1080p * -6)
	var_9_0:addElement(var_9_22)

	var_9_0.ItemName = var_9_22

	local var_9_23
	local var_9_24 = LUI.UIStyledText.new()

	var_9_24.id = "ItemType"

	var_9_24:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_9_24:setText("", 0)
	var_9_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_24:SetWordWrap(false)
	var_9_24:SetAlignment(LUI.Alignment.Center)
	var_9_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_24:SetStartupDelay(2000)
	var_9_24:SetLineHoldTime(400)
	var_9_24:SetAnimMoveTime(2000)
	var_9_24:SetAnimMoveSpeed(150)
	var_9_24:SetEndDelay(2000)
	var_9_24:SetCrossfadeTime(1000)
	var_9_24:SetFadeInTime(300)
	var_9_24:SetFadeOutTime(300)
	var_9_24:SetMaxVisibleLines(1)
	var_9_24:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -12, _1080p * 12, _1080p * 3, _1080p * 23)
	var_9_0:addElement(var_9_24)

	var_9_0.ItemType = var_9_24

	local var_9_25
	local var_9_26 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_9_27 = LUI.UIBorder.new(var_9_26)

	var_9_27.id = "Border"

	var_9_27:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_9_27:SetBorderThicknessLeft(_1080p * 2, 0)
	var_9_27:SetBorderThicknessRight(_1080p * 2, 0)
	var_9_27:SetBorderThicknessTop(_1080p * 2, 0)
	var_9_27:SetBorderThicknessBottom(_1080p * 2, 0)
	var_9_0:addElement(var_9_27)

	var_9_0.Border = var_9_27

	local var_9_28
	local var_9_29 = LUI.UIImage.new()

	var_9_29.id = "Tracer"

	var_9_29:SetAlpha(0, 0)
	var_9_29:setImage(RegisterMaterial("loot_card_overlay_tracer_white"), 0)
	var_9_29:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_9_29:SetAnchorsAndPosition(0, 0, 0, 0.25, 0, 0, 0, 0)
	var_9_0:addElement(var_9_29)

	var_9_0.Tracer = var_9_29

	local function var_9_30()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_30

	local var_9_31
	local var_9_32 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_9_14:RegisterAnimationSequence("FocusGained", var_9_32)

	local function var_9_33()
		var_9_14:AnimateSequence("FocusGained")
	end

	var_9_0._sequences.FocusGained = var_9_33

	local var_9_34
	local var_9_35 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("FocusLost", var_9_35)

	local function var_9_36()
		var_9_14:AnimateSequence("FocusLost")
	end

	var_9_0._sequences.FocusLost = var_9_36

	local var_9_37
	local var_9_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigPlayercard", var_9_38)

	local var_9_39 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -347
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 347
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigPlayercard", var_9_39)

	local var_9_40 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigPlayercard", var_9_40)

	local var_9_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigPlayercard", var_9_41)

	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			value = 0.27,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.53,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigPlayercard", var_9_42)

	local var_9_43 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigPlayercard", var_9_43)

	local var_9_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigPlayercard", var_9_44)

	local function var_9_45()
		var_9_4:AnimateSequence("ConfigPlayercard")
		var_9_8:AnimateSequence("ConfigPlayercard")
		var_9_10:AnimateSequence("ConfigPlayercard")
		var_9_12:AnimateSequence("ConfigPlayercard")
		var_9_14:AnimateSequence("ConfigPlayercard")
		var_9_16:AnimateSequence("ConfigPlayercard")
		var_9_20:AnimateSequence("ConfigPlayercard")
	end

	var_9_0._sequences.ConfigPlayercard = var_9_45

	local var_9_46
	local var_9_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigDefault", var_9_47)

	local var_9_48 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigDefault", var_9_48)

	local var_9_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigDefault", var_9_49)

	local var_9_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigDefault", var_9_50)

	local var_9_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigDefault", var_9_51)

	local var_9_52 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigDefault", var_9_52)

	local var_9_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigDefault", var_9_53)

	local var_9_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ConfigDefault", var_9_54)

	local function var_9_55()
		var_9_4:AnimateSequence("ConfigDefault")
		var_9_8:AnimateSequence("ConfigDefault")
		var_9_10:AnimateSequence("ConfigDefault")
		var_9_12:AnimateSequence("ConfigDefault")
		var_9_14:AnimateSequence("ConfigDefault")
		var_9_16:AnimateSequence("ConfigDefault")
		var_9_20:AnimateSequence("ConfigDefault")
		var_9_29:AnimateSequence("ConfigDefault")
	end

	var_9_0._sequences.ConfigDefault = var_9_55

	local var_9_56
	local var_9_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigCharm", var_9_57)

	local var_9_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigCharm", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigCharm", var_9_59)

	local var_9_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigCharm", var_9_60)

	local var_9_61 = {
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
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.42,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigCharm", var_9_61)

	local var_9_62 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigCharm", var_9_62)

	local var_9_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigCharm", var_9_63)

	local function var_9_64()
		var_9_4:AnimateSequence("ConfigCharm")
		var_9_8:AnimateSequence("ConfigCharm")
		var_9_10:AnimateSequence("ConfigCharm")
		var_9_12:AnimateSequence("ConfigCharm")
		var_9_14:AnimateSequence("ConfigCharm")
		var_9_16:AnimateSequence("ConfigCharm")
		var_9_20:AnimateSequence("ConfigCharm")
	end

	var_9_0._sequences.ConfigCharm = var_9_64

	local var_9_65
	local var_9_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigSpray", var_9_66)

	local var_9_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigSpray", var_9_67)

	local var_9_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigSpray", var_9_68)

	local var_9_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigSpray", var_9_69)

	local var_9_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.12,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigSpray", var_9_70)

	local var_9_71 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigSpray", var_9_71)

	local var_9_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigSpray", var_9_72)

	local function var_9_73()
		var_9_4:AnimateSequence("ConfigSpray")
		var_9_8:AnimateSequence("ConfigSpray")
		var_9_10:AnimateSequence("ConfigSpray")
		var_9_12:AnimateSequence("ConfigSpray")
		var_9_14:AnimateSequence("ConfigSpray")
		var_9_16:AnimateSequence("ConfigSpray")
		var_9_20:AnimateSequence("ConfigSpray")
	end

	var_9_0._sequences.ConfigSpray = var_9_73

	local var_9_74
	local var_9_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigEmblem", var_9_75)

	local var_9_76 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigEmblem", var_9_76)

	local var_9_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigEmblem", var_9_77)

	local var_9_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigEmblem", var_9_78)

	local var_9_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.12,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigEmblem", var_9_79)

	local var_9_80 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigEmblem", var_9_80)

	local var_9_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigEmblem", var_9_81)

	local function var_9_82()
		var_9_4:AnimateSequence("ConfigEmblem")
		var_9_8:AnimateSequence("ConfigEmblem")
		var_9_10:AnimateSequence("ConfigEmblem")
		var_9_12:AnimateSequence("ConfigEmblem")
		var_9_14:AnimateSequence("ConfigEmblem")
		var_9_16:AnimateSequence("ConfigEmblem")
		var_9_20:AnimateSequence("ConfigEmblem")
	end

	var_9_0._sequences.ConfigEmblem = var_9_82

	local var_9_83
	local var_9_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigSticker", var_9_84)

	local var_9_85 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigSticker", var_9_85)

	local var_9_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigSticker", var_9_86)

	local var_9_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigSticker", var_9_87)

	local var_9_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.12,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigSticker", var_9_88)

	local var_9_89 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigSticker", var_9_89)

	local var_9_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigSticker", var_9_90)

	local function var_9_91()
		var_9_4:AnimateSequence("ConfigSticker")
		var_9_8:AnimateSequence("ConfigSticker")
		var_9_10:AnimateSequence("ConfigSticker")
		var_9_12:AnimateSequence("ConfigSticker")
		var_9_14:AnimateSequence("ConfigSticker")
		var_9_16:AnimateSequence("ConfigSticker")
		var_9_20:AnimateSequence("ConfigSticker")
	end

	var_9_0._sequences.ConfigSticker = var_9_91

	local var_9_92
	local var_9_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigGesture", var_9_93)

	local var_9_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigGesture", var_9_94)

	local var_9_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigGesture", var_9_95)

	local var_9_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigGesture", var_9_96)

	local var_9_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
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
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigGesture", var_9_97)

	local var_9_98 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigGesture", var_9_98)

	local var_9_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigGesture", var_9_99)

	local function var_9_100()
		var_9_4:AnimateSequence("ConfigGesture")
		var_9_8:AnimateSequence("ConfigGesture")
		var_9_10:AnimateSequence("ConfigGesture")
		var_9_12:AnimateSequence("ConfigGesture")
		var_9_14:AnimateSequence("ConfigGesture")
		var_9_16:AnimateSequence("ConfigGesture")
		var_9_20:AnimateSequence("ConfigGesture")
	end

	var_9_0._sequences.ConfigGesture = var_9_100

	local var_9_101
	local var_9_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigConsumable", var_9_102)

	local var_9_103 = {
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
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 100
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigConsumable", var_9_103)

	local var_9_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigConsumable", var_9_104)

	local var_9_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigConsumable", var_9_105)

	local var_9_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.11,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.41,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigConsumable", var_9_106)

	local var_9_107 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigConsumable", var_9_107)

	local var_9_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigConsumable", var_9_108)

	local function var_9_109()
		var_9_4:AnimateSequence("ConfigConsumable")
		var_9_8:AnimateSequence("ConfigConsumable")
		var_9_10:AnimateSequence("ConfigConsumable")
		var_9_12:AnimateSequence("ConfigConsumable")
		var_9_14:AnimateSequence("ConfigConsumable")
		var_9_16:AnimateSequence("ConfigConsumable")
		var_9_20:AnimateSequence("ConfigConsumable")
	end

	var_9_0._sequences.ConfigConsumable = var_9_109

	local var_9_110
	local var_9_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigOperator", var_9_111)

	local var_9_112 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigOperator", var_9_112)

	local var_9_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigOperator", var_9_113)

	local var_9_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigOperator", var_9_114)

	local var_9_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigOperator", var_9_115)

	local var_9_116 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigOperator", var_9_116)

	local var_9_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigOperator", var_9_117)

	local function var_9_118()
		var_9_4:AnimateSequence("ConfigOperator")
		var_9_8:AnimateSequence("ConfigOperator")
		var_9_10:AnimateSequence("ConfigOperator")
		var_9_12:AnimateSequence("ConfigOperator")
		var_9_14:AnimateSequence("ConfigOperator")
		var_9_16:AnimateSequence("ConfigOperator")
		var_9_20:AnimateSequence("ConfigOperator")
	end

	var_9_0._sequences.ConfigOperator = var_9_118

	local var_9_119
	local var_9_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigXP", var_9_120)

	local var_9_121 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigXP", var_9_121)

	local var_9_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigXP", var_9_122)

	local var_9_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigXP", var_9_123)

	local var_9_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
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
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigXP", var_9_124)

	local var_9_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigXP", var_9_125)

	local var_9_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigXP", var_9_126)

	local function var_9_127()
		var_9_4:AnimateSequence("ConfigXP")
		var_9_8:AnimateSequence("ConfigXP")
		var_9_10:AnimateSequence("ConfigXP")
		var_9_12:AnimateSequence("ConfigXP")
		var_9_14:AnimateSequence("ConfigXP")
		var_9_16:AnimateSequence("ConfigXP")
		var_9_20:AnimateSequence("ConfigXP")
	end

	var_9_0._sequences.ConfigXP = var_9_127

	local var_9_128
	local var_9_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_9_10:RegisterAnimationSequence("Mini", var_9_129)

	local var_9_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_center_in_gradient_small")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("Mini", var_9_130)

	local var_9_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		}
	}

	var_9_18:RegisterAnimationSequence("Mini", var_9_131)

	local var_9_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		}
	}

	var_9_20:RegisterAnimationSequence("Mini", var_9_132)

	local var_9_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -44
		}
	}

	var_9_22:RegisterAnimationSequence("Mini", var_9_133)

	local var_9_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("Mini", var_9_134)

	local function var_9_135()
		var_9_10:AnimateSequence("Mini")
		var_9_16:AnimateSequence("Mini")
		var_9_18:AnimateSequence("Mini")
		var_9_20:AnimateSequence("Mini")
		var_9_22:AnimateSequence("Mini")
		var_9_24:AnimateSequence("Mini")
	end

	var_9_0._sequences.Mini = var_9_135

	local var_9_136
	local var_9_137 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_9_16:RegisterAnimationSequence("MiniButtonOver", var_9_137)

	local var_9_138 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -75
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		}
	}

	var_9_18:RegisterAnimationSequence("MiniButtonOver", var_9_138)

	local var_9_139 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		}
	}

	var_9_20:RegisterAnimationSequence("MiniButtonOver", var_9_139)

	local var_9_140 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -83
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		}
	}

	var_9_22:RegisterAnimationSequence("MiniButtonOver", var_9_140)

	local function var_9_141()
		var_9_16:AnimateSequence("MiniButtonOver")
		var_9_18:AnimateSequence("MiniButtonOver")
		var_9_20:AnimateSequence("MiniButtonOver")
		var_9_22:AnimateSequence("MiniButtonOver")
	end

	var_9_0._sequences.MiniButtonOver = var_9_141

	local var_9_142
	local var_9_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("HideType", var_9_143)

	local function var_9_144()
		var_9_24:AnimateSequence("HideType")
	end

	var_9_0._sequences.HideType = var_9_144

	local var_9_145
	local var_9_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_9_10:RegisterAnimationSequence("XpMini", var_9_146)

	local var_9_147 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 47
		},
		{
			value = -0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("XpMini", var_9_147)

	local var_9_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_center_in_gradient_small")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("XpMini", var_9_148)

	local var_9_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		}
	}

	var_9_20:RegisterAnimationSequence("XpMini", var_9_149)

	local var_9_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("XpMini", var_9_150)

	local var_9_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("XpMini", var_9_151)

	local function var_9_152()
		var_9_10:AnimateSequence("XpMini")
		var_9_14:AnimateSequence("XpMini")
		var_9_16:AnimateSequence("XpMini")
		var_9_20:AnimateSequence("XpMini")
		var_9_22:AnimateSequence("XpMini")
		var_9_24:AnimateSequence("XpMini")
	end

	var_9_0._sequences.XpMini = var_9_152

	local var_9_153
	local var_9_154 = {
		{
			value = -0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		}
	}

	var_9_14:RegisterAnimationSequence("MiniSquareImage", var_9_154)

	local function var_9_155()
		var_9_14:AnimateSequence("MiniSquareImage")
	end

	var_9_0._sequences.MiniSquareImage = var_9_155

	local var_9_156
	local var_9_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = -0.46,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("MiniPlayerCardImage", var_9_157)

	local function var_9_158()
		var_9_14:AnimateSequence("MiniPlayerCardImage")
	end

	var_9_0._sequences.MiniPlayerCardImage = var_9_158

	local var_9_159
	local var_9_160 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		}
	}

	var_9_16:RegisterAnimationSequence("MiniButtonUp", var_9_160)

	local var_9_161 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_9_18:RegisterAnimationSequence("MiniButtonUp", var_9_161)

	local var_9_162 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -11
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 11
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		}
	}

	var_9_20:RegisterAnimationSequence("MiniButtonUp", var_9_162)

	local var_9_163 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -44
		}
	}

	var_9_22:RegisterAnimationSequence("MiniButtonUp", var_9_163)

	local function var_9_164()
		var_9_16:AnimateSequence("MiniButtonUp")
		var_9_18:AnimateSequence("MiniButtonUp")
		var_9_20:AnimateSequence("MiniButtonUp")
		var_9_22:AnimateSequence("MiniButtonUp")
	end

	var_9_0._sequences.MiniButtonUp = var_9_164

	local var_9_165
	local var_9_166 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigMission", var_9_166)

	local var_9_167 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigMission", var_9_167)

	local var_9_168 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigMission", var_9_168)

	local var_9_169 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigMission", var_9_169)

	local var_9_170 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.19,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigMission", var_9_170)

	local var_9_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigMission", var_9_171)

	local var_9_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigMission", var_9_172)

	local function var_9_173()
		var_9_4:AnimateSequence("ConfigMission")
		var_9_8:AnimateSequence("ConfigMission")
		var_9_10:AnimateSequence("ConfigMission")
		var_9_12:AnimateSequence("ConfigMission")
		var_9_14:AnimateSequence("ConfigMission")
		var_9_16:AnimateSequence("ConfigMission")
		var_9_20:AnimateSequence("ConfigMission")
	end

	var_9_0._sequences.ConfigMission = var_9_173

	local var_9_174
	local var_9_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigExecution", var_9_175)

	local var_9_176 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigExecution", var_9_176)

	local var_9_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigExecution", var_9_177)

	local var_9_178 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigExecution", var_9_178)

	local var_9_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.28,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigExecution", var_9_179)

	local var_9_180 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigExecution", var_9_180)

	local var_9_181 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigExecution", var_9_181)

	local function var_9_182()
		var_9_4:AnimateSequence("ConfigExecution")
		var_9_8:AnimateSequence("ConfigExecution")
		var_9_10:AnimateSequence("ConfigExecution")
		var_9_12:AnimateSequence("ConfigExecution")
		var_9_14:AnimateSequence("ConfigExecution")
		var_9_16:AnimateSequence("ConfigExecution")
		var_9_20:AnimateSequence("ConfigExecution")
	end

	var_9_0._sequences.ConfigExecution = var_9_182

	local var_9_183
	local var_9_184 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("FocusLostSnap", var_9_184)

	local function var_9_185()
		var_9_14:AnimateSequence("FocusLostSnap")
	end

	var_9_0._sequences.FocusLostSnap = var_9_185

	local var_9_186
	local var_9_187 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_9_14:RegisterAnimationSequence("FocusGainedSnap", var_9_187)

	local function var_9_188()
		var_9_14:AnimateSequence("FocusGainedSnap")
	end

	var_9_0._sequences.FocusGainedSnap = var_9_188

	local var_9_189
	local var_9_190 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_9_16:RegisterAnimationSequence("MiniButtonOverSnap", var_9_190)

	local var_9_191 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		}
	}

	var_9_18:RegisterAnimationSequence("MiniButtonOverSnap", var_9_191)

	local var_9_192 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		}
	}

	var_9_20:RegisterAnimationSequence("MiniButtonOverSnap", var_9_192)

	local function var_9_193()
		var_9_16:AnimateSequence("MiniButtonOverSnap")
		var_9_18:AnimateSequence("MiniButtonOverSnap")
		var_9_20:AnimateSequence("MiniButtonOverSnap")
	end

	var_9_0._sequences.MiniButtonOverSnap = var_9_193

	local var_9_194
	local var_9_195 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		}
	}

	var_9_16:RegisterAnimationSequence("MiniButtonUpSnap", var_9_195)

	local var_9_196 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_9_18:RegisterAnimationSequence("MiniButtonUpSnap", var_9_196)

	local var_9_197 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		}
	}

	var_9_20:RegisterAnimationSequence("MiniButtonUpSnap", var_9_197)

	local function var_9_198()
		var_9_16:AnimateSequence("MiniButtonUpSnap")
		var_9_18:AnimateSequence("MiniButtonUpSnap")
		var_9_20:AnimateSequence("MiniButtonUpSnap")
	end

	var_9_0._sequences.MiniButtonUpSnap = var_9_198

	local var_9_199
	local var_9_200 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		}
	}

	var_9_24:RegisterAnimationSequence("AR", var_9_200)

	local function var_9_201()
		var_9_24:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_201

	local var_9_202
	local var_9_203 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigVehicleCamo", var_9_203)

	local var_9_204 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigVehicleCamo", var_9_204)

	local var_9_205 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigVehicleCamo", var_9_205)

	local var_9_206 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigVehicleCamo", var_9_206)

	local var_9_207 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.27,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigVehicleCamo", var_9_207)

	local var_9_208 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigVehicleCamo", var_9_208)

	local var_9_209 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigVehicleCamo", var_9_209)

	local function var_9_210()
		var_9_4:AnimateSequence("ConfigVehicleCamo")
		var_9_8:AnimateSequence("ConfigVehicleCamo")
		var_9_10:AnimateSequence("ConfigVehicleCamo")
		var_9_12:AnimateSequence("ConfigVehicleCamo")
		var_9_14:AnimateSequence("ConfigVehicleCamo")
		var_9_16:AnimateSequence("ConfigVehicleCamo")
		var_9_20:AnimateSequence("ConfigVehicleCamo")
	end

	var_9_0._sequences.ConfigVehicleCamo = var_9_210

	local var_9_211
	local var_9_212 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigQuip", var_9_212)

	local var_9_213 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigQuip", var_9_213)

	local var_9_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigQuip", var_9_214)

	local var_9_215 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigQuip", var_9_215)

	local var_9_216 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigQuip", var_9_216)

	local var_9_217 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigQuip", var_9_217)

	local var_9_218 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigQuip", var_9_218)

	local function var_9_219()
		var_9_4:AnimateSequence("ConfigQuip")
		var_9_8:AnimateSequence("ConfigQuip")
		var_9_10:AnimateSequence("ConfigQuip")
		var_9_12:AnimateSequence("ConfigQuip")
		var_9_14:AnimateSequence("ConfigQuip")
		var_9_16:AnimateSequence("ConfigQuip")
		var_9_20:AnimateSequence("ConfigQuip")
	end

	var_9_0._sequences.ConfigQuip = var_9_219

	local var_9_220
	local var_9_221 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigBattlePass", var_9_221)

	local var_9_222 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigBattlePass", var_9_222)

	local var_9_223 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigBattlePass", var_9_223)

	local var_9_224 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigBattlePass", var_9_224)

	local var_9_225 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.33,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigBattlePass", var_9_225)

	local var_9_226 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigBattlePass", var_9_226)

	local var_9_227 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigBattlePass", var_9_227)

	local function var_9_228()
		var_9_4:AnimateSequence("ConfigBattlePass")
		var_9_8:AnimateSequence("ConfigBattlePass")
		var_9_10:AnimateSequence("ConfigBattlePass")
		var_9_12:AnimateSequence("ConfigBattlePass")
		var_9_14:AnimateSequence("ConfigBattlePass")
		var_9_16:AnimateSequence("ConfigBattlePass")
		var_9_20:AnimateSequence("ConfigBattlePass")
	end

	var_9_0._sequences.ConfigBattlePass = var_9_228

	local var_9_229
	local var_9_230 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigSpecial", var_9_230)

	local var_9_231 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigSpecial", var_9_231)

	local var_9_232 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigSpecial", var_9_232)

	local var_9_233 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigSpecial", var_9_233)

	local var_9_234 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
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
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
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
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigSpecial", var_9_234)

	local var_9_235 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigSpecial", var_9_235)

	local var_9_236 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigSpecial", var_9_236)

	local function var_9_237()
		var_9_4:AnimateSequence("ConfigSpecial")
		var_9_8:AnimateSequence("ConfigSpecial")
		var_9_10:AnimateSequence("ConfigSpecial")
		var_9_12:AnimateSequence("ConfigSpecial")
		var_9_14:AnimateSequence("ConfigSpecial")
		var_9_16:AnimateSequence("ConfigSpecial")
		var_9_20:AnimateSequence("ConfigSpecial")
	end

	var_9_0._sequences.ConfigSpecial = var_9_237

	local var_9_238
	local var_9_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigAttachment", var_9_239)

	local var_9_240 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigAttachment", var_9_240)

	local var_9_241 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigAttachment", var_9_241)

	local var_9_242 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigAttachment", var_9_242)

	local var_9_243 = {
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
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.42,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigAttachment", var_9_243)

	local var_9_244 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigAttachment", var_9_244)

	local var_9_245 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigAttachment", var_9_245)

	local function var_9_246()
		var_9_4:AnimateSequence("ConfigAttachment")
		var_9_8:AnimateSequence("ConfigAttachment")
		var_9_10:AnimateSequence("ConfigAttachment")
		var_9_12:AnimateSequence("ConfigAttachment")
		var_9_14:AnimateSequence("ConfigAttachment")
		var_9_16:AnimateSequence("ConfigAttachment")
		var_9_20:AnimateSequence("ConfigAttachment")
	end

	var_9_0._sequences.ConfigAttachment = var_9_246

	local var_9_247
	local var_9_248 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigVehicleHorn", var_9_248)

	local var_9_249 = {
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
			property = TWEEN_PROPERTY.Bottom
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
			property = TWEEN_PROPERTY.Right
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigVehicleHorn", var_9_249)

	local var_9_250 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigVehicleHorn", var_9_250)

	local var_9_251 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigVehicleHorn", var_9_251)

	local var_9_252 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
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
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0.34,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.34,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.26,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_9_14:RegisterAnimationSequence("ConfigVehicleHorn", var_9_252)

	local var_9_253 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigVehicleHorn", var_9_253)

	local var_9_254 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigVehicleHorn", var_9_254)

	local function var_9_255()
		var_9_4:AnimateSequence("ConfigVehicleHorn")
		var_9_8:AnimateSequence("ConfigVehicleHorn")
		var_9_10:AnimateSequence("ConfigVehicleHorn")
		var_9_12:AnimateSequence("ConfigVehicleHorn")
		var_9_14:AnimateSequence("ConfigVehicleHorn")
		var_9_16:AnimateSequence("ConfigVehicleHorn")
		var_9_20:AnimateSequence("ConfigVehicleHorn")
	end

	var_9_0._sequences.ConfigVehicleHorn = var_9_255

	local var_9_256
	local var_9_257 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ConfigCollection", var_9_257)

	local var_9_258 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
		}
	}

	var_9_8:RegisterAnimationSequence("ConfigCollection", var_9_258)

	local var_9_259 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ConfigCollection", var_9_259)

	local var_9_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ConfigCollection", var_9_260)

	local var_9_261 = {
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

	var_9_14:RegisterAnimationSequence("ConfigCollection", var_9_261)

	local var_9_262 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ConfigCollection", var_9_262)

	local var_9_263 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("ConfigCollection", var_9_263)

	local var_9_264 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("ConfigCollection", var_9_264)

	local function var_9_265()
		var_9_4:AnimateSequence("ConfigCollection")
		var_9_8:AnimateSequence("ConfigCollection")
		var_9_10:AnimateSequence("ConfigCollection")
		var_9_12:AnimateSequence("ConfigCollection")
		var_9_14:AnimateSequence("ConfigCollection")
		var_9_16:AnimateSequence("ConfigCollection")
		var_9_20:AnimateSequence("ConfigCollection")
		var_9_22:AnimateSequence("ConfigCollection")
	end

	var_9_0._sequences.ConfigCollection = var_9_265

	var_0_6(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("LootItemCardMini", LootItemCardMini)
LockTable(_M)
