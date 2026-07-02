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
	local var_4_0 = 0

	if arg_4_1 and #arg_4_1 > 0 then
		var_4_0 = Engine.DFEIGFBEH(RegisterMaterial(arg_4_1))
	else
		DebugPrint("SetupBattlePassT9Image -> Bad source data, invalid rewardImage passed in")
	end

	if var_4_0 < 1 then
		arg_4_0 = arg_4_0 .. "T9"
	end

	return arg_4_0
end

local function var_0_4(arg_5_0, arg_5_1)
	if arg_5_1 == LOOT.Rarity.OPERATOR_MISSION then
		if not arg_5_0.OperatorMissionBorder then
			local var_5_0
			local var_5_1 = LUI.UIImage.new()

			var_5_1.id = "OperatorMissionBorder"

			var_5_1:setImage(RegisterMaterial("ui_icon_mtx_highlight_flipbook"), 0)
			var_5_1:SetBlendMode(BLEND_MODE.addWithAlpha)
			var_5_1:SetScale(0.32, 0)
			var_5_1:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -8, _1080p * 8, 0, 0)
			arg_5_0:addElement(var_5_1)

			arg_5_0.OperatorMissionBorder = var_5_1
		end
	elseif arg_5_0.OperatorMissionBorder then
		arg_5_0.OperatorMissionBorder:closeTree()

		arg_5_0.OperatorMissionBorder = nil
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.rarity == LOOT.Rarity.OPERATOR_MISSION and BLEND_MODE.addWithAlpha or BLEND_MODE.blend

	arg_6_0.RarityImage:setImage(RegisterMaterial(arg_6_1.rarityImage))
	LOOT.ApplyRarityIconColoring(arg_6_0.RarityImage, arg_6_1.rarity)
	arg_6_0.RarityImage:SetBlendMode(var_6_0)
end

local function var_0_6(arg_7_0, arg_7_1)
	if not (arg_7_1 and next(arg_7_1) ~= nil) then
		return
	end

	local var_7_0
	local var_7_1

	arg_7_0.Background:SetPixelGridEnabled(false)

	if not arg_7_1.rarity and type(arg_7_1.type) == "number" then
		arg_7_1.rarity = LOOT.GetItemQuality(arg_7_1.type, arg_7_1.ref)
	end

	ACTIONS.AnimateSequence(arg_7_0, "HidePlayerTitle")

	if arg_7_1.type == LOOT.itemTypes.PLAYERCARD then
		var_7_0 = "ConfigPlayercard"
		var_7_1 = arg_7_1.image

		arg_7_0.Background:SetPixelGridEnabled(true)

		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.EMBLEM then
		var_7_0 = "ConfigEmblem"
		var_7_1 = "ui_loot_bg_emblem"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.CHARM then
		var_7_0 = "ConfigCharm"
		var_7_1 = "ui_loot_bg_charm"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.STICKER then
		var_7_0 = "ConfigSticker"
		var_7_1 = "ui_loot_bg_sticker"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.GESTURES then
		var_7_0 = "ConfigGesture"
		var_7_0 = var_0_3(var_7_0, arg_7_1.image)
		var_7_1 = "ui_loot_bg_gesture"
	elseif arg_7_1.type == LOOT.itemTypes.SPRAYS then
		var_7_0 = "ConfigSpray"
		var_7_1 = "ui_loot_bg_spray"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.CONSUMABLE or arg_7_1.type == LOOT.itemTypes.FEATURE and not arg_7_1.isOperatorChallenge then
		var_7_0 = "ConfigConsumable"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == "xp" then
		var_7_0 = "ConfigXP"
		var_7_1 = "ui_loot_bg_generic"
	elseif arg_7_1.type == "weapon_xp" then
		var_7_0 = "ConfigWeaponXP"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == "mission" then
		var_7_0 = "ConfigMission"
		var_7_1 = "ui_loot_bg_execution"
	elseif arg_7_1.type == LOOT.itemTypes.OPERATOR_EXECUTION then
		var_7_0 = "ConfigExecution"
		var_7_0 = var_0_3(var_7_0, arg_7_1.image)
		var_7_1 = "ui_loot_bg_execution"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.OPERATOR or arg_7_1.type == LOOT.itemTypes.OPERATOR_SKIN then
		var_7_0 = "ConfigOperator"
		var_7_1 = "ui_loot_bg_operator"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.VEHICLE_CAMO then
		var_7_0 = "ConfigVehicleCamo"
		var_7_0 = var_0_3(var_7_0, arg_7_1.image)
		var_7_1 = "ui_loot_bg_vehicle"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.VEHICLE_HORN then
		var_7_0 = "ConfigVehicleHorn"
		var_7_1 = "ui_loot_bg_vehicle_horn"
		arg_7_0._setMiniImage = false
		arg_7_1.image = "ui_vehicle_horn"
	elseif arg_7_1.type == LOOT.itemTypes.VEHICLE_TRACK then
		var_7_0 = "ConfigVehicleHorn"
		var_7_1 = arg_7_1.image
		arg_7_0._setMiniImage = false

		if arg_7_1.vehicleTrackCount == 4 then
			arg_7_1.image = "ui_vehicle_battle_track_x4"
		else
			arg_7_1.image = "ui_vehicle_battle_track"
		end
	elseif arg_7_1.type == LOOT.itemTypes.QUIP then
		var_7_0 = "ConfigQuip"
		var_7_1 = "ui_loot_bg_operator"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.BATTLE_PASS then
		var_7_0 = "ConfigBattlePass"
		var_7_1 = "ui_loot_bg_battlepass"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.SPECIAL then
		var_7_0 = "ConfigSpecial"
		var_7_1 = "ui_loot_bg_generic"

		arg_7_0.ItemName:SetMaxVisibleLines(3)
	elseif arg_7_1.type == LOOT.itemTypes.ATTACHMENT then
		var_7_0 = "ConfigAttachment"
		var_7_1 = "ui_loot_bg_generic"
	elseif arg_7_1.type == LOOT.itemTypes.MISSION then
		var_7_0 = (arg_7_1.image == nil or arg_7_1.image == "icon_mission_operator_token") and "ConfigMission" or "ConfigDefault"
		var_7_1 = "ui_loot_bg_feature"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.BUNDLE then
		var_7_0 = "ConfigCollection"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.RETICLE then
		local var_7_2 = RegisterMaterial(arg_7_1.image)

		var_7_0 = Engine.DFEIGFBEH(var_7_2) < 1 and "ConfigReticle3x4" or "ConfigReticle1x1"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.S4_MISC then
		var_7_0 = arg_7_1.miscType == LOOT.miscItemTypes.KILLCAM_VANITY and "ConfigS4MiscWide" or "ConfigS4Misc"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.TITLE then
		var_7_0 = "ConfigPlayerTitle"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_1.image = "bp_playertitle_bg"

		if arg_7_1.name ~= nil then
			arg_7_0.PlayerTitleName:setText(ToUpperCase(arg_7_1.name))
		end

		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.WATCH then
		var_7_0 = "ConfigWatch"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	elseif arg_7_1.type == LOOT.itemTypes.CAMO then
		var_7_0 = "ConfigCamo"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	else
		var_7_0 = "ConfigDefault"
		var_7_1 = "ui_loot_bg_generic"
		arg_7_0._setMiniImage = false
	end

	local var_7_3 = ""

	if not arg_7_0._isMini then
		var_7_3 = arg_7_1.name

		if arg_7_1.ID then
			local var_7_4 = LOOT.GetGameSourceExclusivityByItemID(arg_7_1.ID)
			local var_7_5 = var_7_4 == LOOT.itemSourceExclusivity.CW_EXCLUSIVE
			local var_7_6 = var_7_4 == LOOT.itemSourceExclusivity.VG_EXCLUSIVE

			if arg_7_1.isPartOfSplitTier and (var_7_5 or var_7_6) then
				arg_7_0.SnipeBanner:SetAlpha(1)

				local var_7_7 = LOOT.GetGameSourceIDFromItemID(arg_7_1.ID)

				arg_7_0.SnipeBanner:SetGameSource({
					gameSourceID = var_7_7,
					itemID = arg_7_1.ID
				})
			else
				arg_7_0.SnipeBanner:SetAlpha(0)
			end
		end
	elseif arg_7_1.amount then
		var_7_3 = arg_7_1.type ~= "xp" and arg_7_1.amount or arg_7_1.name

		if arg_7_1.type == "weapon_xp" then
			var_7_3 = arg_7_1.name
		end

		arg_7_0.ItemName:SetAlpha(1)
	elseif arg_7_1.duration then
		var_7_3 = arg_7_1.duration

		arg_7_0.ItemName:SetAlpha(1)
	else
		arg_7_0.ItemName:SetAlpha(0)
	end

	if arg_7_1.image and #arg_7_1.image > 0 then
		arg_7_0.Foreground:setImage(RegisterMaterial(arg_7_1.image))
	else
		arg_7_0.Foreground:setImage(RegisterMaterial("placeholder_x"))
	end

	if arg_7_1.type ~= "xp" and arg_7_1.type ~= "mission" and arg_7_1.type ~= "weapon_xp" then
		local var_7_8 = ""

		if arg_7_1.type == LOOT.itemTypes.FEATURE then
			if arg_7_1.isOperatorChallenge then
				var_7_8 = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS")
			else
				var_7_8 = Engine.CBBHFCGDIC("LOOT_MP/CONSUMABLE")
			end
		else
			var_7_8 = LOOT.GetItemClassName(arg_7_1.type, arg_7_1.ref)
		end

		arg_7_0.ItemType:setText(var_7_8)
		var_0_5(arg_7_0, arg_7_1)
		arg_7_0.BlueprintIcon:SetRGBFromTable(arg_7_1.rarityColor)
		arg_7_0.Border:SetRGBFromTable(arg_7_1.rarityColor)

		if arg_7_0._isMini then
			arg_7_0.RarityBG:SetRGBFromTable(arg_7_1.rarityColor)
		else
			arg_7_0.RarityBG:SetRGBFromTable(LOOT.GetDarkRarityColor(arg_7_1.rarity))
		end
	else
		arg_7_0.Border:SetRGBFromTable(SWATCHES.itemRarity.qualityBase)
	end

	arg_7_0.ItemName:setText(LAYOUT.SetWarzoneStringHighlightOverride(var_7_3))

	if arg_7_1.type == LOOT.itemTypes.WEAPON and arg_7_1.itemID then
		local var_7_9 = WEAPON.IsVariant(arg_7_0._controllerIndex, arg_7_1.itemID)

		if var_7_9 ~= nil and var_7_9 == true then
			arg_7_0.BlueprintIcon:SetAlpha(0.7)
		else
			arg_7_0.BlueprintIcon:SetAlpha(0)
		end
	else
		arg_7_0.BlueprintIcon:SetAlpha(0)
	end

	if var_7_0 then
		ACTIONS.AnimateSequence(arg_7_0, var_7_0)
	end

	local var_7_10 = arg_7_1.type == LOOT.itemTypes.PLAYERCARD

	if arg_7_0._setMiniImage then
		ACTIONS.AnimateSequence(arg_7_0, var_7_10 and "MiniPlayerCardImage" or "MiniSquareImage")

		if arg_7_1.type == "xp" and arg_7_0._isMini then
			ACTIONS.AnimateSequence(arg_7_0, arg_7_1.setDisplayForOperatorXP and "SetOperatorXPReward" or "XpMini")
		end
	end

	if var_7_1 and var_7_1 ~= "" then
		arg_7_0.Background:setImage(RegisterMaterial(var_7_1))
	end

	var_0_4(arg_7_0, arg_7_1.rarity)
end

local function var_0_7(arg_8_0)
	assert(arg_8_0.Background)
	arg_8_0.Background:SetPixelGridEnabled(false)
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = WEAPON.GetTracerType(arg_9_2)

	if var_9_0 then
		local var_9_1 = WEAPON.GetSpecialAttributeColor(var_9_0)
		local var_9_2 = WEAPON.GetSpecialAttributeAtlas(var_9_0)
		local var_9_3 = WEAPON.GetSpecialAttributeBlendMode(var_9_0)

		arg_9_0.Tracer:setImage(RegisterMaterial(var_9_2))
		arg_9_0.Tracer:SetRGBFromTable(var_9_1)
		arg_9_0.Tracer:SetBlendMode(var_9_3)
		arg_9_0.Tracer:SetAlpha(1)
	else
		arg_9_0.Tracer:SetAlpha(0)
	end
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.ResetCardConfig = var_0_2
	arg_10_0.UpdateCardConfig = var_0_6
	arg_10_0.ClearCardBackground = var_0_7
	arg_10_0.SetMiniMode = var_0_0
	arg_10_0.SetupTracer = var_0_8
	arg_10_0._isMini = false
	arg_10_0._setMiniImage = false
	arg_10_0._controllerIndex = arg_10_1

	arg_10_0.Background:SetMask(arg_10_0.BackgroundMask)
	arg_10_0.Foreground:SetMask(arg_10_0.BackgroundMask)
	arg_10_0.Background:SetPixelGridContrast(0.2, 0)
	arg_10_0.Background:SetPixelGridBlockWidth(2, 0)
	arg_10_0.Background:SetPixelGridBlockHeight(2, 0)
	arg_10_0.Background:SetPixelGridGutterWidth(1, 0)
	arg_10_0.Background:SetPixelGridGutterHeight(1, 0)
	arg_10_0:registerEventHandler("on_close", function(arg_11_0)
		arg_11_0:ReleaseRenderTarget(arg_10_1)
	end)
	var_0_1(arg_10_0)
end

function LootItemCardMini(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_12_0.id = "LootItemCardMini"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "PlayercardBackground"

	var_12_4:SetRGBFromInt(0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.PlayercardBackground = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "BackgroundMask"

	var_12_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_12_0:addElement(var_12_6)

	var_12_0.BackgroundMask = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "Background"

	var_12_8:SetRGBFromInt(0, 0)
	var_12_0:addElement(var_12_8)

	var_12_0.Background = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "PlayercardOverlay"

	var_12_10:SetRGBFromInt(0, 0)
	var_12_10:SetAlpha(0.5, 0)
	var_12_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -60)
	var_12_0:addElement(var_12_10)

	var_12_0.PlayercardOverlay = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "QuipOverlay"

	var_12_12:SetScale(-0.35, 0)
	var_12_12:setImage(RegisterMaterial("icon_chyron_fx"), 0)
	var_12_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -39, _1080p * 39, _1080p * 31, _1080p * -75)
	var_12_0:addElement(var_12_12)

	var_12_0.QuipOverlay = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIImage.new()

	var_12_14.id = "Foreground"

	var_12_14:setImage(RegisterMaterial("ui_vehicle_horn"), 0)
	var_12_0:addElement(var_12_14)

	var_12_0.Foreground = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIImage.new()

	var_12_16.id = "RarityBG"

	var_12_16:SetRGBFromTable(SWATCHES.itemRarity.qualityAlt3, 0)
	var_12_16:SetAlpha(0.8, 0)
	var_12_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -60, 0)
	var_12_0:addElement(var_12_16)

	var_12_0.RarityBG = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIImage.new()

	var_12_18.id = "BlueprintIcon"

	var_12_18:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_12_18:SetAlpha(0, 0)
	var_12_18:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -21, _1080p * 21, _1080p * -90, _1080p * -48)
	var_12_0:addElement(var_12_18)

	var_12_0.BlueprintIcon = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIImage.new()

	var_12_20.id = "RarityImage"

	var_12_20:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_12_20:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_12_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -11, _1080p * 11, _1080p * -55, _1080p * -33)
	var_12_0:addElement(var_12_20)

	var_12_0.RarityImage = var_12_20

	local var_12_21

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		var_12_21 = LUI.UIStyledText.new()
		var_12_21.id = "ItemName"

		var_12_21:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
		var_12_21:setText("THORNE", 0)
		var_12_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_12_21:SetWordWrap(false)
		var_12_21:SetAlignment(LUI.Alignment.Center)
		var_12_21:SetOptOutRightToLeftAlignmentFlip(true)
		var_12_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_12_21:SetStartupDelay(750)
		var_12_21:SetLineHoldTime(400)
		var_12_21:SetAnimMoveTime(1000)
		var_12_21:SetAnimMoveSpeed(150)
		var_12_21:SetEndDelay(750)
		var_12_21:SetCrossfadeTime(1000)
		var_12_21:SetFadeInTime(300)
		var_12_21:SetFadeOutTime(300)
		var_12_21:SetMaxVisibleLines(1)
		var_12_21:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 8, _1080p * -8, _1080p * -30, _1080p * -6)
		var_12_0:addElement(var_12_21)

		var_12_0.ItemName = var_12_21
	end

	local var_12_22

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		var_12_22 = LUI.UIStyledText.new()
		var_12_22.id = "ItemType"

		var_12_22:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
		var_12_22:setText("", 0)
		var_12_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_12_22:SetWordWrap(false)
		var_12_22:SetAlignment(LUI.Alignment.Center)
		var_12_22:SetOptOutRightToLeftAlignmentFlip(true)
		var_12_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_12_22:SetStartupDelay(2000)
		var_12_22:SetLineHoldTime(400)
		var_12_22:SetAnimMoveTime(2000)
		var_12_22:SetAnimMoveSpeed(150)
		var_12_22:SetEndDelay(2000)
		var_12_22:SetCrossfadeTime(1000)
		var_12_22:SetFadeInTime(300)
		var_12_22:SetFadeOutTime(300)
		var_12_22:SetMaxVisibleLines(1)
		var_12_22:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -12, _1080p * 12, _1080p * 3, _1080p * 23)
		var_12_0:addElement(var_12_22)

		var_12_0.ItemType = var_12_22
	end

	local var_12_23
	local var_12_24 = LUI.UIStyledText.new()

	var_12_24.id = "PlayerTitleName"

	var_12_24:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_12_24:SetAlpha(0, 0)
	var_12_24:SetXRotation(40, 0)
	var_12_24:SetYRotation(-20, 0)
	var_12_24:SetZRotation(9, 0)
	var_12_24:setText(ToUpperCase(""), 0)
	var_12_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_24:SetTracking(-1 * _1080p, 0)
	var_12_24:SetLeading(-5 * _1080p, 0)
	var_12_24:SetAlignment(LUI.Alignment.Center)
	var_12_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_24:SetShadowMinDistance(1, 0)
	var_12_24:SetShadowMaxDistance(1, 0)
	var_12_24:SetShadowUOffset(0.5, 0)
	var_12_24:SetShadowVOffset(0.5, 0)
	var_12_24:SetShadowRGBFromInt(0, 0)
	var_12_24:SetAnchorsAndPosition(0.02, 0.02, 0.33, 0.5700001, _1080p * -288, _1080p * 288, _1080p * -10, _1080p * 10)
	var_12_0:addElement(var_12_24)

	var_12_0.PlayerTitleName = var_12_24

	local var_12_25
	local var_12_26 = MenuBuilder.BuildRegisteredType("WZBattlePassItemSnipeBanner", {
		controllerIndex = var_12_1
	})

	var_12_26.id = "SnipeBanner"

	var_12_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 26)
	var_12_0:addElement(var_12_26)

	var_12_0.SnipeBanner = var_12_26

	local var_12_27
	local var_12_28 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_12_29 = LUI.UIBorder.new(var_12_28)

	var_12_29.id = "Border"

	var_12_29:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_12_29:SetBorderThicknessLeft(_1080p * 2, 0)
	var_12_29:SetBorderThicknessRight(_1080p * 2, 0)
	var_12_29:SetBorderThicknessTop(_1080p * 2, 0)
	var_12_29:SetBorderThicknessBottom(_1080p * 2, 0)
	var_12_0:addElement(var_12_29)

	var_12_0.Border = var_12_29

	local var_12_30
	local var_12_31 = LUI.UIImage.new()

	var_12_31.id = "Tracer"

	var_12_31:SetAlpha(0, 0)
	var_12_31:setImage(RegisterMaterial("loot_card_overlay_tracer_white"), 0)
	var_12_31:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_12_31:SetAnchorsAndPosition(0, 0, 0, 0.25, 0, 0, 0, 0)
	var_12_0:addElement(var_12_31)

	var_12_0.Tracer = var_12_31

	local var_12_32

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_33 = {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 1,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		}

		var_12_32 = LUI.UIBorder.new(var_12_33)
		var_12_32.id = "CheckboxFrame"

		var_12_32:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
		var_12_32:SetAlpha(0, 0)
		var_12_32:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -20, _1080p * -2, _1080p * 2, _1080p * 20)
		var_12_0:addElement(var_12_32)

		var_12_0.CheckboxFrame = var_12_32
	end

	local var_12_34

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		var_12_34 = LUI.UIImage.new()
		var_12_34.id = "Checkbox"

		var_12_34:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
		var_12_34:SetAlpha(0, 0)
		var_12_34:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
		var_12_34:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -20, _1080p * -2, _1080p * 2, _1080p * 20)
		var_12_0:addElement(var_12_34)

		var_12_0.Checkbox = var_12_34
	end

	local var_12_35

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		var_12_35 = LUI.UIImage.new()
		var_12_35.id = "LockedIcon"

		var_12_35:SetAlpha(0, 0)
		var_12_35:setImage(RegisterMaterial("battlepass_lock"), 0)
		var_12_35:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, 0, _1080p * 4, _1080p * 29)
		var_12_0:addElement(var_12_35)

		var_12_0.LockedIcon = var_12_35
	end

	local function var_12_36()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_36

	local var_12_37
	local var_12_38 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_14:RegisterAnimationSequence("FocusGained", var_12_38)

	local function var_12_39()
		var_12_14:AnimateSequence("FocusGained")
	end

	var_12_0._sequences.FocusGained = var_12_39

	local var_12_40
	local var_12_41 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_14:RegisterAnimationSequence("FocusLost", var_12_41)

	local function var_12_42()
		var_12_14:AnimateSequence("FocusLost")
	end

	var_12_0._sequences.FocusLost = var_12_42

	local var_12_43
	local var_12_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigPlayercard", var_12_44)

	local var_12_45 = {
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

	var_12_8:RegisterAnimationSequence("ConfigPlayercard", var_12_45)

	local var_12_46 = {
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

	var_12_10:RegisterAnimationSequence("ConfigPlayercard", var_12_46)

	local var_12_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigPlayercard", var_12_47)

	local var_12_48 = {
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

	var_12_14:RegisterAnimationSequence("ConfigPlayercard", var_12_48)

	local var_12_49 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigPlayercard", var_12_49)

	local var_12_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigPlayercard", var_12_50)

	local function var_12_51()
		var_12_4:AnimateSequence("ConfigPlayercard")
		var_12_8:AnimateSequence("ConfigPlayercard")
		var_12_10:AnimateSequence("ConfigPlayercard")
		var_12_12:AnimateSequence("ConfigPlayercard")
		var_12_14:AnimateSequence("ConfigPlayercard")
		var_12_16:AnimateSequence("ConfigPlayercard")
		var_12_20:AnimateSequence("ConfigPlayercard")
	end

	var_12_0._sequences.ConfigPlayercard = var_12_51

	local var_12_52
	local var_12_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigDefault", var_12_53)

	local var_12_54 = {
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

	var_12_8:RegisterAnimationSequence("ConfigDefault", var_12_54)

	local var_12_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigDefault", var_12_55)

	local var_12_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigDefault", var_12_56)

	local var_12_57 = {
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

	var_12_14:RegisterAnimationSequence("ConfigDefault", var_12_57)

	local var_12_58 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigDefault", var_12_58)

	local var_12_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigDefault", var_12_59)

	local var_12_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("ConfigDefault", var_12_60)

	local var_12_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_31:RegisterAnimationSequence("ConfigDefault", var_12_61)

	local function var_12_62()
		var_12_4:AnimateSequence("ConfigDefault")
		var_12_8:AnimateSequence("ConfigDefault")
		var_12_10:AnimateSequence("ConfigDefault")
		var_12_12:AnimateSequence("ConfigDefault")
		var_12_14:AnimateSequence("ConfigDefault")
		var_12_16:AnimateSequence("ConfigDefault")
		var_12_20:AnimateSequence("ConfigDefault")
		var_12_24:AnimateSequence("ConfigDefault")
		var_12_31:AnimateSequence("ConfigDefault")
	end

	var_12_0._sequences.ConfigDefault = var_12_62

	local var_12_63
	local var_12_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigCharm", var_12_64)

	local var_12_65 = {
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

	var_12_8:RegisterAnimationSequence("ConfigCharm", var_12_65)

	local var_12_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigCharm", var_12_66)

	local var_12_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigCharm", var_12_67)

	local var_12_68 = {
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

	var_12_14:RegisterAnimationSequence("ConfigCharm", var_12_68)

	local var_12_69 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigCharm", var_12_69)

	local var_12_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigCharm", var_12_70)

	local function var_12_71()
		var_12_4:AnimateSequence("ConfigCharm")
		var_12_8:AnimateSequence("ConfigCharm")
		var_12_10:AnimateSequence("ConfigCharm")
		var_12_12:AnimateSequence("ConfigCharm")
		var_12_14:AnimateSequence("ConfigCharm")
		var_12_16:AnimateSequence("ConfigCharm")
		var_12_20:AnimateSequence("ConfigCharm")
	end

	var_12_0._sequences.ConfigCharm = var_12_71

	local var_12_72
	local var_12_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigSpray", var_12_73)

	local var_12_74 = {
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

	var_12_8:RegisterAnimationSequence("ConfigSpray", var_12_74)

	local var_12_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigSpray", var_12_75)

	local var_12_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigSpray", var_12_76)

	local var_12_77 = {
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

	var_12_14:RegisterAnimationSequence("ConfigSpray", var_12_77)

	local var_12_78 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigSpray", var_12_78)

	local var_12_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigSpray", var_12_79)

	local function var_12_80()
		var_12_4:AnimateSequence("ConfigSpray")
		var_12_8:AnimateSequence("ConfigSpray")
		var_12_10:AnimateSequence("ConfigSpray")
		var_12_12:AnimateSequence("ConfigSpray")
		var_12_14:AnimateSequence("ConfigSpray")
		var_12_16:AnimateSequence("ConfigSpray")
		var_12_20:AnimateSequence("ConfigSpray")
	end

	var_12_0._sequences.ConfigSpray = var_12_80

	local var_12_81
	local var_12_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigEmblem", var_12_82)

	local var_12_83 = {
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

	var_12_8:RegisterAnimationSequence("ConfigEmblem", var_12_83)

	local var_12_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigEmblem", var_12_84)

	local var_12_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigEmblem", var_12_85)

	local var_12_86 = {
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

	var_12_14:RegisterAnimationSequence("ConfigEmblem", var_12_86)

	local var_12_87 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigEmblem", var_12_87)

	local var_12_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigEmblem", var_12_88)

	local function var_12_89()
		var_12_4:AnimateSequence("ConfigEmblem")
		var_12_8:AnimateSequence("ConfigEmblem")
		var_12_10:AnimateSequence("ConfigEmblem")
		var_12_12:AnimateSequence("ConfigEmblem")
		var_12_14:AnimateSequence("ConfigEmblem")
		var_12_16:AnimateSequence("ConfigEmblem")
		var_12_20:AnimateSequence("ConfigEmblem")
	end

	var_12_0._sequences.ConfigEmblem = var_12_89

	local var_12_90
	local var_12_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigSticker", var_12_91)

	local var_12_92 = {
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

	var_12_8:RegisterAnimationSequence("ConfigSticker", var_12_92)

	local var_12_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigSticker", var_12_93)

	local var_12_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigSticker", var_12_94)

	local var_12_95 = {
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

	var_12_14:RegisterAnimationSequence("ConfigSticker", var_12_95)

	local var_12_96 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigSticker", var_12_96)

	local var_12_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigSticker", var_12_97)

	local function var_12_98()
		var_12_4:AnimateSequence("ConfigSticker")
		var_12_8:AnimateSequence("ConfigSticker")
		var_12_10:AnimateSequence("ConfigSticker")
		var_12_12:AnimateSequence("ConfigSticker")
		var_12_14:AnimateSequence("ConfigSticker")
		var_12_16:AnimateSequence("ConfigSticker")
		var_12_20:AnimateSequence("ConfigSticker")
	end

	var_12_0._sequences.ConfigSticker = var_12_98

	local var_12_99
	local var_12_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigGesture", var_12_100)

	local var_12_101 = {
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

	var_12_8:RegisterAnimationSequence("ConfigGesture", var_12_101)

	local var_12_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigGesture", var_12_102)

	local var_12_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigGesture", var_12_103)

	local var_12_104 = {
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

	var_12_14:RegisterAnimationSequence("ConfigGesture", var_12_104)

	local var_12_105 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigGesture", var_12_105)

	local var_12_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigGesture", var_12_106)

	local function var_12_107()
		var_12_4:AnimateSequence("ConfigGesture")
		var_12_8:AnimateSequence("ConfigGesture")
		var_12_10:AnimateSequence("ConfigGesture")
		var_12_12:AnimateSequence("ConfigGesture")
		var_12_14:AnimateSequence("ConfigGesture")
		var_12_16:AnimateSequence("ConfigGesture")
		var_12_20:AnimateSequence("ConfigGesture")
	end

	var_12_0._sequences.ConfigGesture = var_12_107

	local var_12_108
	local var_12_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigConsumable", var_12_109)

	local var_12_110 = {
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

	var_12_8:RegisterAnimationSequence("ConfigConsumable", var_12_110)

	local var_12_111 = {
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

	var_12_10:RegisterAnimationSequence("ConfigConsumable", var_12_111)

	local var_12_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigConsumable", var_12_112)

	local var_12_113 = {
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

	var_12_14:RegisterAnimationSequence("ConfigConsumable", var_12_113)

	local var_12_114 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigConsumable", var_12_114)

	local var_12_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigConsumable", var_12_115)

	local var_12_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("ConfigConsumable", var_12_116)

	local function var_12_117()
		var_12_4:AnimateSequence("ConfigConsumable")
		var_12_8:AnimateSequence("ConfigConsumable")
		var_12_10:AnimateSequence("ConfigConsumable")
		var_12_12:AnimateSequence("ConfigConsumable")
		var_12_14:AnimateSequence("ConfigConsumable")
		var_12_16:AnimateSequence("ConfigConsumable")
		var_12_20:AnimateSequence("ConfigConsumable")
		var_12_24:AnimateSequence("ConfigConsumable")
	end

	var_12_0._sequences.ConfigConsumable = var_12_117

	local var_12_118
	local var_12_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigOperator", var_12_119)

	local var_12_120 = {
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

	var_12_8:RegisterAnimationSequence("ConfigOperator", var_12_120)

	local var_12_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigOperator", var_12_121)

	local var_12_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigOperator", var_12_122)

	local var_12_123 = {
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

	var_12_14:RegisterAnimationSequence("ConfigOperator", var_12_123)

	local var_12_124 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigOperator", var_12_124)

	local var_12_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigOperator", var_12_125)

	local function var_12_126()
		var_12_4:AnimateSequence("ConfigOperator")
		var_12_8:AnimateSequence("ConfigOperator")
		var_12_10:AnimateSequence("ConfigOperator")
		var_12_12:AnimateSequence("ConfigOperator")
		var_12_14:AnimateSequence("ConfigOperator")
		var_12_16:AnimateSequence("ConfigOperator")
		var_12_20:AnimateSequence("ConfigOperator")
	end

	var_12_0._sequences.ConfigOperator = var_12_126

	local var_12_127
	local var_12_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigXP", var_12_128)

	local var_12_129 = {
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

	var_12_8:RegisterAnimationSequence("ConfigXP", var_12_129)

	local var_12_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigXP", var_12_130)

	local var_12_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigXP", var_12_131)

	local var_12_132 = {
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

	var_12_14:RegisterAnimationSequence("ConfigXP", var_12_132)

	local var_12_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigXP", var_12_133)

	local var_12_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigXP", var_12_134)

	local function var_12_135()
		var_12_4:AnimateSequence("ConfigXP")
		var_12_8:AnimateSequence("ConfigXP")
		var_12_10:AnimateSequence("ConfigXP")
		var_12_12:AnimateSequence("ConfigXP")
		var_12_14:AnimateSequence("ConfigXP")
		var_12_16:AnimateSequence("ConfigXP")
		var_12_20:AnimateSequence("ConfigXP")
	end

	var_12_0._sequences.ConfigXP = var_12_135

	local var_12_136
	local var_12_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_12_10:RegisterAnimationSequence("Mini", var_12_137)

	local var_12_138 = {
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

	var_12_16:RegisterAnimationSequence("Mini", var_12_138)

	local var_12_139 = {
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

	var_12_18:RegisterAnimationSequence("Mini", var_12_139)

	local var_12_140 = {
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

	var_12_20:RegisterAnimationSequence("Mini", var_12_140)

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_141 = {
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

		var_12_21:RegisterAnimationSequence("Mini", var_12_141)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_142 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_22:RegisterAnimationSequence("Mini", var_12_142)
	end

	local var_12_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("Mini", var_12_143)

	local function var_12_144()
		var_12_10:AnimateSequence("Mini")
		var_12_16:AnimateSequence("Mini")
		var_12_18:AnimateSequence("Mini")
		var_12_20:AnimateSequence("Mini")

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_21:AnimateSequence("Mini")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_22:AnimateSequence("Mini")
		end

		var_12_24:AnimateSequence("Mini")
	end

	var_12_0._sequences.Mini = var_12_144

	local var_12_145
	local var_12_146 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_12_16:RegisterAnimationSequence("MiniButtonOver", var_12_146)

	local var_12_147 = {
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

	var_12_18:RegisterAnimationSequence("MiniButtonOver", var_12_147)

	local var_12_148 = {
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

	var_12_20:RegisterAnimationSequence("MiniButtonOver", var_12_148)

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_149 = {
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

		var_12_21:RegisterAnimationSequence("MiniButtonOver", var_12_149)
	end

	local function var_12_150()
		var_12_16:AnimateSequence("MiniButtonOver")
		var_12_18:AnimateSequence("MiniButtonOver")
		var_12_20:AnimateSequence("MiniButtonOver")

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_21:AnimateSequence("MiniButtonOver")
		end
	end

	var_12_0._sequences.MiniButtonOver = var_12_150

	local var_12_151

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_152 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_22:RegisterAnimationSequence("HideType", var_12_152)
	end

	local function var_12_153()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_22:AnimateSequence("HideType")
		end
	end

	var_12_0._sequences.HideType = var_12_153

	local var_12_154
	local var_12_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_12_10:RegisterAnimationSequence("XpMini", var_12_155)

	local var_12_156 = {
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

	var_12_14:RegisterAnimationSequence("XpMini", var_12_156)

	local var_12_157 = {
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

	var_12_16:RegisterAnimationSequence("XpMini", var_12_157)

	local var_12_158 = {
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

	var_12_20:RegisterAnimationSequence("XpMini", var_12_158)

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_159 = {
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

		var_12_21:RegisterAnimationSequence("XpMini", var_12_159)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_160 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_22:RegisterAnimationSequence("XpMini", var_12_160)
	end

	local function var_12_161()
		var_12_10:AnimateSequence("XpMini")
		var_12_14:AnimateSequence("XpMini")
		var_12_16:AnimateSequence("XpMini")
		var_12_20:AnimateSequence("XpMini")

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_21:AnimateSequence("XpMini")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_22:AnimateSequence("XpMini")
		end
	end

	var_12_0._sequences.XpMini = var_12_161

	local var_12_162
	local var_12_163 = {
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

	var_12_14:RegisterAnimationSequence("MiniSquareImage", var_12_163)

	local function var_12_164()
		var_12_14:AnimateSequence("MiniSquareImage")
	end

	var_12_0._sequences.MiniSquareImage = var_12_164

	local var_12_165
	local var_12_166 = {
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

	var_12_14:RegisterAnimationSequence("MiniPlayerCardImage", var_12_166)

	local function var_12_167()
		var_12_14:AnimateSequence("MiniPlayerCardImage")
	end

	var_12_0._sequences.MiniPlayerCardImage = var_12_167

	local var_12_168
	local var_12_169 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		}
	}

	var_12_16:RegisterAnimationSequence("MiniButtonUp", var_12_169)

	local var_12_170 = {
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

	var_12_18:RegisterAnimationSequence("MiniButtonUp", var_12_170)

	local var_12_171 = {
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

	var_12_20:RegisterAnimationSequence("MiniButtonUp", var_12_171)

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_172 = {
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

		var_12_21:RegisterAnimationSequence("MiniButtonUp", var_12_172)
	end

	local function var_12_173()
		var_12_16:AnimateSequence("MiniButtonUp")
		var_12_18:AnimateSequence("MiniButtonUp")
		var_12_20:AnimateSequence("MiniButtonUp")

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_21:AnimateSequence("MiniButtonUp")
		end
	end

	var_12_0._sequences.MiniButtonUp = var_12_173

	local var_12_174
	local var_12_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigMission", var_12_175)

	local var_12_176 = {
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

	var_12_8:RegisterAnimationSequence("ConfigMission", var_12_176)

	local var_12_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigMission", var_12_177)

	local var_12_178 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigMission", var_12_178)

	local var_12_179 = {
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

	var_12_14:RegisterAnimationSequence("ConfigMission", var_12_179)

	local var_12_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigMission", var_12_180)

	local var_12_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigMission", var_12_181)

	local function var_12_182()
		var_12_4:AnimateSequence("ConfigMission")
		var_12_8:AnimateSequence("ConfigMission")
		var_12_10:AnimateSequence("ConfigMission")
		var_12_12:AnimateSequence("ConfigMission")
		var_12_14:AnimateSequence("ConfigMission")
		var_12_16:AnimateSequence("ConfigMission")
		var_12_20:AnimateSequence("ConfigMission")
	end

	var_12_0._sequences.ConfigMission = var_12_182

	local var_12_183
	local var_12_184 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigExecution", var_12_184)

	local var_12_185 = {
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

	var_12_8:RegisterAnimationSequence("ConfigExecution", var_12_185)

	local var_12_186 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigExecution", var_12_186)

	local var_12_187 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigExecution", var_12_187)

	local var_12_188 = {
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

	var_12_14:RegisterAnimationSequence("ConfigExecution", var_12_188)

	local var_12_189 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigExecution", var_12_189)

	local var_12_190 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigExecution", var_12_190)

	local function var_12_191()
		var_12_4:AnimateSequence("ConfigExecution")
		var_12_8:AnimateSequence("ConfigExecution")
		var_12_10:AnimateSequence("ConfigExecution")
		var_12_12:AnimateSequence("ConfigExecution")
		var_12_14:AnimateSequence("ConfigExecution")
		var_12_16:AnimateSequence("ConfigExecution")
		var_12_20:AnimateSequence("ConfigExecution")
	end

	var_12_0._sequences.ConfigExecution = var_12_191

	local var_12_192
	local var_12_193 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_14:RegisterAnimationSequence("FocusLostSnap", var_12_193)

	local function var_12_194()
		var_12_14:AnimateSequence("FocusLostSnap")
	end

	var_12_0._sequences.FocusLostSnap = var_12_194

	local var_12_195
	local var_12_196 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_14:RegisterAnimationSequence("FocusGainedSnap", var_12_196)

	local function var_12_197()
		var_12_14:AnimateSequence("FocusGainedSnap")
	end

	var_12_0._sequences.FocusGainedSnap = var_12_197

	local var_12_198
	local var_12_199 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_12_16:RegisterAnimationSequence("MiniButtonOverSnap", var_12_199)

	local var_12_200 = {
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

	var_12_18:RegisterAnimationSequence("MiniButtonOverSnap", var_12_200)

	local var_12_201 = {
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

	var_12_20:RegisterAnimationSequence("MiniButtonOverSnap", var_12_201)

	local function var_12_202()
		var_12_16:AnimateSequence("MiniButtonOverSnap")
		var_12_18:AnimateSequence("MiniButtonOverSnap")
		var_12_20:AnimateSequence("MiniButtonOverSnap")
	end

	var_12_0._sequences.MiniButtonOverSnap = var_12_202

	local var_12_203
	local var_12_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		}
	}

	var_12_16:RegisterAnimationSequence("MiniButtonUpSnap", var_12_204)

	local var_12_205 = {
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

	var_12_18:RegisterAnimationSequence("MiniButtonUpSnap", var_12_205)

	local var_12_206 = {
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

	var_12_20:RegisterAnimationSequence("MiniButtonUpSnap", var_12_206)

	local function var_12_207()
		var_12_16:AnimateSequence("MiniButtonUpSnap")
		var_12_18:AnimateSequence("MiniButtonUpSnap")
		var_12_20:AnimateSequence("MiniButtonUpSnap")
	end

	var_12_0._sequences.MiniButtonUpSnap = var_12_207

	local var_12_208

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_209 = {
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

		var_12_22:RegisterAnimationSequence("AR", var_12_209)
	end

	local function var_12_210()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_22:AnimateSequence("AR")
		end
	end

	var_12_0._sequences.AR = var_12_210

	local var_12_211
	local var_12_212 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigVehicleCamo", var_12_212)

	local var_12_213 = {
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

	var_12_8:RegisterAnimationSequence("ConfigVehicleCamo", var_12_213)

	local var_12_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigVehicleCamo", var_12_214)

	local var_12_215 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigVehicleCamo", var_12_215)

	local var_12_216 = {
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

	var_12_14:RegisterAnimationSequence("ConfigVehicleCamo", var_12_216)

	local var_12_217 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigVehicleCamo", var_12_217)

	local var_12_218 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigVehicleCamo", var_12_218)

	local function var_12_219()
		var_12_4:AnimateSequence("ConfigVehicleCamo")
		var_12_8:AnimateSequence("ConfigVehicleCamo")
		var_12_10:AnimateSequence("ConfigVehicleCamo")
		var_12_12:AnimateSequence("ConfigVehicleCamo")
		var_12_14:AnimateSequence("ConfigVehicleCamo")
		var_12_16:AnimateSequence("ConfigVehicleCamo")
		var_12_20:AnimateSequence("ConfigVehicleCamo")
	end

	var_12_0._sequences.ConfigVehicleCamo = var_12_219

	local var_12_220
	local var_12_221 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigQuip", var_12_221)

	local var_12_222 = {
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

	var_12_8:RegisterAnimationSequence("ConfigQuip", var_12_222)

	local var_12_223 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigQuip", var_12_223)

	local var_12_224 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigQuip", var_12_224)

	local var_12_225 = {
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

	var_12_14:RegisterAnimationSequence("ConfigQuip", var_12_225)

	local var_12_226 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigQuip", var_12_226)

	local var_12_227 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigQuip", var_12_227)

	local function var_12_228()
		var_12_4:AnimateSequence("ConfigQuip")
		var_12_8:AnimateSequence("ConfigQuip")
		var_12_10:AnimateSequence("ConfigQuip")
		var_12_12:AnimateSequence("ConfigQuip")
		var_12_14:AnimateSequence("ConfigQuip")
		var_12_16:AnimateSequence("ConfigQuip")
		var_12_20:AnimateSequence("ConfigQuip")
	end

	var_12_0._sequences.ConfigQuip = var_12_228

	local var_12_229
	local var_12_230 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigBattlePass", var_12_230)

	local var_12_231 = {
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

	var_12_8:RegisterAnimationSequence("ConfigBattlePass", var_12_231)

	local var_12_232 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigBattlePass", var_12_232)

	local var_12_233 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigBattlePass", var_12_233)

	local var_12_234 = {
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

	var_12_14:RegisterAnimationSequence("ConfigBattlePass", var_12_234)

	local var_12_235 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigBattlePass", var_12_235)

	local var_12_236 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigBattlePass", var_12_236)

	local function var_12_237()
		var_12_4:AnimateSequence("ConfigBattlePass")
		var_12_8:AnimateSequence("ConfigBattlePass")
		var_12_10:AnimateSequence("ConfigBattlePass")
		var_12_12:AnimateSequence("ConfigBattlePass")
		var_12_14:AnimateSequence("ConfigBattlePass")
		var_12_16:AnimateSequence("ConfigBattlePass")
		var_12_20:AnimateSequence("ConfigBattlePass")
	end

	var_12_0._sequences.ConfigBattlePass = var_12_237

	local var_12_238
	local var_12_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigSpecial", var_12_239)

	local var_12_240 = {
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

	var_12_8:RegisterAnimationSequence("ConfigSpecial", var_12_240)

	local var_12_241 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigSpecial", var_12_241)

	local var_12_242 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigSpecial", var_12_242)

	local var_12_243 = {
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

	var_12_14:RegisterAnimationSequence("ConfigSpecial", var_12_243)

	local var_12_244 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigSpecial", var_12_244)

	local var_12_245 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigSpecial", var_12_245)

	local function var_12_246()
		var_12_4:AnimateSequence("ConfigSpecial")
		var_12_8:AnimateSequence("ConfigSpecial")
		var_12_10:AnimateSequence("ConfigSpecial")
		var_12_12:AnimateSequence("ConfigSpecial")
		var_12_14:AnimateSequence("ConfigSpecial")
		var_12_16:AnimateSequence("ConfigSpecial")
		var_12_20:AnimateSequence("ConfigSpecial")
	end

	var_12_0._sequences.ConfigSpecial = var_12_246

	local var_12_247
	local var_12_248 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigAttachment", var_12_248)

	local var_12_249 = {
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

	var_12_8:RegisterAnimationSequence("ConfigAttachment", var_12_249)

	local var_12_250 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigAttachment", var_12_250)

	local var_12_251 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigAttachment", var_12_251)

	local var_12_252 = {
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

	var_12_14:RegisterAnimationSequence("ConfigAttachment", var_12_252)

	local var_12_253 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigAttachment", var_12_253)

	local var_12_254 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigAttachment", var_12_254)

	local function var_12_255()
		var_12_4:AnimateSequence("ConfigAttachment")
		var_12_8:AnimateSequence("ConfigAttachment")
		var_12_10:AnimateSequence("ConfigAttachment")
		var_12_12:AnimateSequence("ConfigAttachment")
		var_12_14:AnimateSequence("ConfigAttachment")
		var_12_16:AnimateSequence("ConfigAttachment")
		var_12_20:AnimateSequence("ConfigAttachment")
	end

	var_12_0._sequences.ConfigAttachment = var_12_255

	local var_12_256
	local var_12_257 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigVehicleHorn", var_12_257)

	local var_12_258 = {
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

	var_12_8:RegisterAnimationSequence("ConfigVehicleHorn", var_12_258)

	local var_12_259 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigVehicleHorn", var_12_259)

	local var_12_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -45
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_chyron_fx_t9")
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigVehicleHorn", var_12_260)

	local var_12_261 = {
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

	var_12_14:RegisterAnimationSequence("ConfigVehicleHorn", var_12_261)

	local var_12_262 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigVehicleHorn", var_12_262)

	local var_12_263 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigVehicleHorn", var_12_263)

	local function var_12_264()
		var_12_4:AnimateSequence("ConfigVehicleHorn")
		var_12_8:AnimateSequence("ConfigVehicleHorn")
		var_12_10:AnimateSequence("ConfigVehicleHorn")
		var_12_12:AnimateSequence("ConfigVehicleHorn")
		var_12_14:AnimateSequence("ConfigVehicleHorn")
		var_12_16:AnimateSequence("ConfigVehicleHorn")
		var_12_20:AnimateSequence("ConfigVehicleHorn")
	end

	var_12_0._sequences.ConfigVehicleHorn = var_12_264

	local var_12_265
	local var_12_266 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigCollection", var_12_266)

	local var_12_267 = {
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

	var_12_8:RegisterAnimationSequence("ConfigCollection", var_12_267)

	local var_12_268 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigCollection", var_12_268)

	local var_12_269 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigCollection", var_12_269)

	local var_12_270 = {
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

	var_12_14:RegisterAnimationSequence("ConfigCollection", var_12_270)

	local var_12_271 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigCollection", var_12_271)

	local var_12_272 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigCollection", var_12_272)

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_273 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_21:RegisterAnimationSequence("ConfigCollection", var_12_273)
	end

	local function var_12_274()
		var_12_4:AnimateSequence("ConfigCollection")
		var_12_8:AnimateSequence("ConfigCollection")
		var_12_10:AnimateSequence("ConfigCollection")
		var_12_12:AnimateSequence("ConfigCollection")
		var_12_14:AnimateSequence("ConfigCollection")
		var_12_16:AnimateSequence("ConfigCollection")
		var_12_20:AnimateSequence("ConfigCollection")

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_21:AnimateSequence("ConfigCollection")
		end
	end

	var_12_0._sequences.ConfigCollection = var_12_274

	local var_12_275

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_276 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_35:RegisterAnimationSequence("HideLock", var_12_276)
	end

	local function var_12_277()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_35:AnimateSequence("HideLock")
		end
	end

	var_12_0._sequences.HideLock = var_12_277

	local var_12_278

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_279 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_32:RegisterAnimationSequence("HideCheckbox", var_12_279)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_280 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_34:RegisterAnimationSequence("HideCheckbox", var_12_280)
	end

	local function var_12_281()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_32:AnimateSequence("HideCheckbox")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_34:AnimateSequence("HideCheckbox")
		end
	end

	var_12_0._sequences.HideCheckbox = var_12_281

	local var_12_282

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_283 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_32:RegisterAnimationSequence("ShowLock", var_12_283)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_284 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_34:RegisterAnimationSequence("ShowLock", var_12_284)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_285 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_35:RegisterAnimationSequence("ShowLock", var_12_285)
	end

	local function var_12_286()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_32:AnimateSequence("ShowLock")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_34:AnimateSequence("ShowLock")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_35:AnimateSequence("ShowLock")
		end
	end

	var_12_0._sequences.ShowLock = var_12_286

	local var_12_287

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_288 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.BattlePass.Purchased
			}
		}

		var_12_32:RegisterAnimationSequence("ShowCheckboxCompletePurchased", var_12_288)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_289 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.BattlePass.Purchased
			}
		}

		var_12_34:RegisterAnimationSequence("ShowCheckboxCompletePurchased", var_12_289)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_290 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_35:RegisterAnimationSequence("ShowCheckboxCompletePurchased", var_12_290)
	end

	local function var_12_291()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_32:AnimateSequence("ShowCheckboxCompletePurchased")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_34:AnimateSequence("ShowCheckboxCompletePurchased")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_35:AnimateSequence("ShowCheckboxCompletePurchased")
		end
	end

	var_12_0._sequences.ShowCheckboxCompletePurchased = var_12_291

	local var_12_292

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_293 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.BattlePass.Free
			}
		}

		var_12_32:RegisterAnimationSequence("ShowCheckboxCompleteFree", var_12_293)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_294 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.BattlePass.Free
			}
		}

		var_12_34:RegisterAnimationSequence("ShowCheckboxCompleteFree", var_12_294)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_295 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_35:RegisterAnimationSequence("ShowCheckboxCompleteFree", var_12_295)
	end

	local function var_12_296()
		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_32:AnimateSequence("ShowCheckboxCompleteFree")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_34:AnimateSequence("ShowCheckboxCompleteFree")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_35:AnimateSequence("ShowCheckboxCompleteFree")
		end
	end

	var_12_0._sequences.ShowCheckboxCompleteFree = var_12_296

	local var_12_297
	local var_12_298 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_298)

	local var_12_299 = {
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

	var_12_8:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_299)

	local var_12_300 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_300)

	local var_12_301 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_301)

	local var_12_302 = {
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

	var_12_14:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_302)

	local var_12_303 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_303)

	local var_12_304 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigVehicleCamoT9", var_12_304)

	local function var_12_305()
		var_12_4:AnimateSequence("ConfigVehicleCamoT9")
		var_12_8:AnimateSequence("ConfigVehicleCamoT9")
		var_12_10:AnimateSequence("ConfigVehicleCamoT9")
		var_12_12:AnimateSequence("ConfigVehicleCamoT9")
		var_12_14:AnimateSequence("ConfigVehicleCamoT9")
		var_12_16:AnimateSequence("ConfigVehicleCamoT9")
		var_12_20:AnimateSequence("ConfigVehicleCamoT9")
	end

	var_12_0._sequences.ConfigVehicleCamoT9 = var_12_305

	local var_12_306
	local var_12_307 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigExecutionT9", var_12_307)

	local var_12_308 = {
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

	var_12_8:RegisterAnimationSequence("ConfigExecutionT9", var_12_308)

	local var_12_309 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigExecutionT9", var_12_309)

	local var_12_310 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigExecutionT9", var_12_310)

	local var_12_311 = {
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

	var_12_14:RegisterAnimationSequence("ConfigExecutionT9", var_12_311)

	local var_12_312 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigExecutionT9", var_12_312)

	local var_12_313 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigExecutionT9", var_12_313)

	local function var_12_314()
		var_12_4:AnimateSequence("ConfigExecutionT9")
		var_12_8:AnimateSequence("ConfigExecutionT9")
		var_12_10:AnimateSequence("ConfigExecutionT9")
		var_12_12:AnimateSequence("ConfigExecutionT9")
		var_12_14:AnimateSequence("ConfigExecutionT9")
		var_12_16:AnimateSequence("ConfigExecutionT9")
		var_12_20:AnimateSequence("ConfigExecutionT9")
	end

	var_12_0._sequences.ConfigExecutionT9 = var_12_314

	local var_12_315
	local var_12_316 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigGestureT9", var_12_316)

	local var_12_317 = {
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

	var_12_8:RegisterAnimationSequence("ConfigGestureT9", var_12_317)

	local var_12_318 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigGestureT9", var_12_318)

	local var_12_319 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigGestureT9", var_12_319)

	local var_12_320 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
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

	var_12_14:RegisterAnimationSequence("ConfigGestureT9", var_12_320)

	local var_12_321 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigGestureT9", var_12_321)

	local var_12_322 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigGestureT9", var_12_322)

	local function var_12_323()
		var_12_4:AnimateSequence("ConfigGestureT9")
		var_12_8:AnimateSequence("ConfigGestureT9")
		var_12_10:AnimateSequence("ConfigGestureT9")
		var_12_12:AnimateSequence("ConfigGestureT9")
		var_12_14:AnimateSequence("ConfigGestureT9")
		var_12_16:AnimateSequence("ConfigGestureT9")
		var_12_20:AnimateSequence("ConfigGestureT9")
	end

	var_12_0._sequences.ConfigGestureT9 = var_12_323

	local var_12_324
	local var_12_325 = {
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

	var_12_14:RegisterAnimationSequence("ConfigPlayerTitle", var_12_325)

	local var_12_326 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_24:RegisterAnimationSequence("ConfigPlayerTitle", var_12_326)

	local function var_12_327()
		var_12_14:AnimateSequence("ConfigPlayerTitle")
		var_12_24:AnimateSequence("ConfigPlayerTitle")
	end

	var_12_0._sequences.ConfigPlayerTitle = var_12_327

	local var_12_328
	local var_12_329 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigReticle1x1", var_12_329)

	local var_12_330 = {
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

	var_12_8:RegisterAnimationSequence("ConfigReticle1x1", var_12_330)

	local var_12_331 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigReticle1x1", var_12_331)

	local var_12_332 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigReticle1x1", var_12_332)

	local var_12_333 = {
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

	var_12_14:RegisterAnimationSequence("ConfigReticle1x1", var_12_333)

	local var_12_334 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigReticle1x1", var_12_334)

	local var_12_335 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigReticle1x1", var_12_335)

	local function var_12_336()
		var_12_4:AnimateSequence("ConfigReticle1x1")
		var_12_8:AnimateSequence("ConfigReticle1x1")
		var_12_10:AnimateSequence("ConfigReticle1x1")
		var_12_12:AnimateSequence("ConfigReticle1x1")
		var_12_14:AnimateSequence("ConfigReticle1x1")
		var_12_16:AnimateSequence("ConfigReticle1x1")
		var_12_20:AnimateSequence("ConfigReticle1x1")
	end

	var_12_0._sequences.ConfigReticle1x1 = var_12_336

	local var_12_337
	local var_12_338 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigS4Misc", var_12_338)

	local var_12_339 = {
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

	var_12_8:RegisterAnimationSequence("ConfigS4Misc", var_12_339)

	local var_12_340 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigS4Misc", var_12_340)

	local var_12_341 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigS4Misc", var_12_341)

	local var_12_342 = {
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
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.11,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.17,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_14:RegisterAnimationSequence("ConfigS4Misc", var_12_342)

	local var_12_343 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigS4Misc", var_12_343)

	local var_12_344 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigS4Misc", var_12_344)

	local var_12_345 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("ConfigS4Misc", var_12_345)

	local function var_12_346()
		var_12_4:AnimateSequence("ConfigS4Misc")
		var_12_8:AnimateSequence("ConfigS4Misc")
		var_12_10:AnimateSequence("ConfigS4Misc")
		var_12_12:AnimateSequence("ConfigS4Misc")
		var_12_14:AnimateSequence("ConfigS4Misc")
		var_12_16:AnimateSequence("ConfigS4Misc")
		var_12_20:AnimateSequence("ConfigS4Misc")
		var_12_24:AnimateSequence("ConfigS4Misc")
	end

	var_12_0._sequences.ConfigS4Misc = var_12_346

	local var_12_347
	local var_12_348 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("HidePlayerTitle", var_12_348)

	local function var_12_349()
		var_12_24:AnimateSequence("HidePlayerTitle")
	end

	var_12_0._sequences.HidePlayerTitle = var_12_349

	local var_12_350
	local var_12_351 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigS4MiscWide", var_12_351)

	local var_12_352 = {
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
			value = _1080p * -140
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
			value = _1080p * 140
		}
	}

	var_12_8:RegisterAnimationSequence("ConfigS4MiscWide", var_12_352)

	local var_12_353 = {
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

	var_12_10:RegisterAnimationSequence("ConfigS4MiscWide", var_12_353)

	local var_12_354 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigS4MiscWide", var_12_354)

	local var_12_355 = {
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
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_14:RegisterAnimationSequence("ConfigS4MiscWide", var_12_355)

	local var_12_356 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigS4MiscWide", var_12_356)

	local var_12_357 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigS4MiscWide", var_12_357)

	local function var_12_358()
		var_12_4:AnimateSequence("ConfigS4MiscWide")
		var_12_8:AnimateSequence("ConfigS4MiscWide")
		var_12_10:AnimateSequence("ConfigS4MiscWide")
		var_12_12:AnimateSequence("ConfigS4MiscWide")
		var_12_14:AnimateSequence("ConfigS4MiscWide")
		var_12_16:AnimateSequence("ConfigS4MiscWide")
		var_12_20:AnimateSequence("ConfigS4MiscWide")
	end

	var_12_0._sequences.ConfigS4MiscWide = var_12_358

	local var_12_359
	local var_12_360 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_12_10:RegisterAnimationSequence("SetOperatorXPReward", var_12_360)

	local var_12_361 = {
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

	var_12_14:RegisterAnimationSequence("SetOperatorXPReward", var_12_361)

	local var_12_362 = {
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.itemRarity.qualityAlt3
		}
	}

	var_12_16:RegisterAnimationSequence("SetOperatorXPReward", var_12_362)

	local var_12_363 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("SetOperatorXPReward", var_12_363)

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_364 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -31
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -7
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 10
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -10
			}
		}

		var_12_21:RegisterAnimationSequence("SetOperatorXPReward", var_12_364)
	end

	if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
		local var_12_365 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_22:RegisterAnimationSequence("SetOperatorXPReward", var_12_365)
	end

	local function var_12_366()
		var_12_10:AnimateSequence("SetOperatorXPReward")
		var_12_14:AnimateSequence("SetOperatorXPReward")
		var_12_16:AnimateSequence("SetOperatorXPReward")
		var_12_20:AnimateSequence("SetOperatorXPReward")

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_21:AnimateSequence("SetOperatorXPReward")
		end

		if not CONDITIONS.IsCurMenuSeasonalEventMenu() then
			var_12_22:AnimateSequence("SetOperatorXPReward")
		end
	end

	var_12_0._sequences.SetOperatorXPReward = var_12_366

	local var_12_367
	local var_12_368 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigWatch", var_12_368)

	local var_12_369 = {
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

	var_12_8:RegisterAnimationSequence("ConfigWatch", var_12_369)

	local var_12_370 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigWatch", var_12_370)

	local var_12_371 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigWatch", var_12_371)

	local var_12_372 = {
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
			value = 0.07,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.07,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.14,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_14:RegisterAnimationSequence("ConfigWatch", var_12_372)

	local var_12_373 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigWatch", var_12_373)

	local var_12_374 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigWatch", var_12_374)

	local var_12_375 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("ConfigWatch", var_12_375)

	local var_12_376 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_31:RegisterAnimationSequence("ConfigWatch", var_12_376)

	local function var_12_377()
		var_12_4:AnimateSequence("ConfigWatch")
		var_12_8:AnimateSequence("ConfigWatch")
		var_12_10:AnimateSequence("ConfigWatch")
		var_12_12:AnimateSequence("ConfigWatch")
		var_12_14:AnimateSequence("ConfigWatch")
		var_12_16:AnimateSequence("ConfigWatch")
		var_12_20:AnimateSequence("ConfigWatch")
		var_12_24:AnimateSequence("ConfigWatch")
		var_12_31:AnimateSequence("ConfigWatch")
	end

	var_12_0._sequences.ConfigWatch = var_12_377

	local var_12_378
	local var_12_379 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigReticle3x4", var_12_379)

	local var_12_380 = {
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

	var_12_8:RegisterAnimationSequence("ConfigReticle3x4", var_12_380)

	local var_12_381 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigReticle3x4", var_12_381)

	local var_12_382 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigReticle3x4", var_12_382)

	local var_12_383 = {
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
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_14:RegisterAnimationSequence("ConfigReticle3x4", var_12_383)

	local var_12_384 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigReticle3x4", var_12_384)

	local var_12_385 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigReticle3x4", var_12_385)

	local function var_12_386()
		var_12_4:AnimateSequence("ConfigReticle3x4")
		var_12_8:AnimateSequence("ConfigReticle3x4")
		var_12_10:AnimateSequence("ConfigReticle3x4")
		var_12_12:AnimateSequence("ConfigReticle3x4")
		var_12_14:AnimateSequence("ConfigReticle3x4")
		var_12_16:AnimateSequence("ConfigReticle3x4")
		var_12_20:AnimateSequence("ConfigReticle3x4")
	end

	var_12_0._sequences.ConfigReticle3x4 = var_12_386

	local var_12_387
	local var_12_388 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ConfigCamo", var_12_388)

	local var_12_389 = {
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

	var_12_8:RegisterAnimationSequence("ConfigCamo", var_12_389)

	local var_12_390 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ConfigCamo", var_12_390)

	local var_12_391 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ConfigCamo", var_12_391)

	local var_12_392 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
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

	var_12_14:RegisterAnimationSequence("ConfigCamo", var_12_392)

	local var_12_393 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ConfigCamo", var_12_393)

	local var_12_394 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ConfigCamo", var_12_394)

	local var_12_395 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_12_24:RegisterAnimationSequence("ConfigCamo", var_12_395)

	local function var_12_396()
		var_12_4:AnimateSequence("ConfigCamo")
		var_12_8:AnimateSequence("ConfigCamo")
		var_12_10:AnimateSequence("ConfigCamo")
		var_12_12:AnimateSequence("ConfigCamo")
		var_12_14:AnimateSequence("ConfigCamo")
		var_12_16:AnimateSequence("ConfigCamo")
		var_12_20:AnimateSequence("ConfigCamo")
		var_12_24:AnimateSequence("ConfigCamo")
	end

	var_12_0._sequences.ConfigCamo = var_12_396

	var_0_9(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("LootItemCardMini", LootItemCardMini)
LockTable(_M)
