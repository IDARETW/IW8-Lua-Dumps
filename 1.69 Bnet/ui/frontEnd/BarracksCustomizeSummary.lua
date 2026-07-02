module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.CustomClanTagEquippedIcon:SetAlpha(arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.ActiveClanTagEquippedIcon:SetAlpha(arg_2_1 and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0._customClanTag and #arg_3_0._customClanTag > 0 then
		ACTIONS.AnimateSequence(arg_3_0, "CustomClanTagEquipped")

		if ToUpperCase(arg_3_0._customClanTag) == "IW" then
			arg_3_0.ClanTag:setText("[^1" .. arg_3_0._customClanTag .. "^7]")
		else
			arg_3_0.ClanTag:setText("[" .. arg_3_0._customClanTag .. "]")
		end

		if not CONDITIONS.IsSystemLink(arg_3_0) then
			var_0_0(arg_3_0, true)
			var_0_1(arg_3_0, false)
		end
	else
		arg_3_0.ClanTag:setText("")
		var_0_0(arg_3_0, false)
		var_0_1(arg_3_0, false)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1 == ClanTagType.CUSTOM then
		ACTIONS.AnimateSequence(arg_4_0, "CustomClanTagEquipped")

		if arg_4_0._customClanTag == nil or #arg_4_0._customClanTag == 0 then
			var_0_0(arg_4_0, false)
			var_0_1(arg_4_0, false)
		else
			var_0_0(arg_4_0, true)
			var_0_1(arg_4_0, false)
		end
	elseif arg_4_1 == ClanTagType.OFFICIAL then
		ACTIONS.AnimateSequence(arg_4_0, "OfficialClanTagEquipped")

		if arg_4_0._activeClanID == nil or arg_4_0._activeClanID == -1 then
			var_0_0(arg_4_0, false)
			var_0_1(arg_4_0, false)
		else
			var_0_0(arg_4_0, false)
			var_0_1(arg_4_0, true)
		end
	end

	arg_4_0:dispatchEventToParent({
		name = "update_clan_tag_type",
		clanTagType = arg_4_1
	})
end

local function var_0_4(arg_5_0, arg_5_1)
	assert(arg_5_0.Emblem)
	assert(arg_5_0.EmblemName)
	assert(arg_5_0.CallingCard)
	assert(arg_5_0.CallingCardName)
	assert(arg_5_0.ClanTag)
	assert(arg_5_0.RadialLoadoutGrid)
	ACTIONS.AnimateSequence(arg_5_0, "HideAll")

	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_5_1 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
	local var_5_2 = LUI.DataSourceInControllerModel.new(var_5_1 .. ".emblemIndex")
	local var_5_3 = LUI.DataSourceInControllerModel.new(var_5_1 .. ".backgroundIndex")
	local var_5_4 = LUI.DataSourceInControllerModel.new(var_5_1 .. ".frameIndex")
	local var_5_5 = LUI.DataSourceInControllerModel.new(var_5_1 .. ".titleIndex")
	local var_5_6 = var_5_2:GetValue(arg_5_1) or 0
	local var_5_7 = var_5_3:GetValue(arg_5_1) or 0
	local var_5_8 = var_5_4:GetValue(arg_5_1) or 0
	local var_5_9 = var_5_5:GetValue(arg_5_1) or 0

	DebugPrint(string.format("Player card : emblemIndex [%i] backgroundIndex [%i] frameIndex [%i] controllerIndex [%i] emblemID [%i] playerCardID [%i] frameID [%i]", var_5_2:GetValue(arg_5_1) or -1, var_5_3:GetValue(arg_5_1) or -1, var_5_4:GetValue(arg_5_1) or -1, arg_5_1, var_5_6, var_5_7, var_5_8))

	local var_5_10 = EmblemEditorUtils.GetEmblemImageFromID(var_5_6)
	local var_5_11 = EmblemEditorUtils.GetEmblemNameFromID(var_5_6)
	local var_5_12 = CallingCardUtils.GetCardTexture(var_5_7)
	local var_5_13 = CallingCardUtils.GetCardNameFromID(var_5_7)
	local var_5_14 = CallingCardFramesUtils.GetFrameTexture(var_5_8)
	local var_5_15 = CallingCardFramesUtils.GetFrameNameFromID(var_5_8)
	local var_5_16 = PlayerTitleUtils.GetTitleNameFromID(var_5_9)
	local var_5_17
	local var_5_18
	local var_5_19 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.PLAYERCARD)
	local var_5_20 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.PLAYERCARD, {
		isFav = true
	})

	if var_5_19 then
		local var_5_21 = RANDOM.GetItemData(arg_5_1, {
			itemType = LOOT.itemTypes.PLAYERCARD
		})

		var_5_12 = var_5_21.image
		var_5_13 = var_5_21.name
	elseif var_5_20 then
		local var_5_22 = RANDOM.GetItemData(arg_5_1, {
			isFav = true,
			itemType = LOOT.itemTypes.PLAYERCARD
		})

		var_5_12 = var_5_22.image
		var_5_13 = var_5_22.name
	end

	local var_5_23 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.EMBLEM)
	local var_5_24 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.EMBLEM, {
		isFav = true
	})

	if var_5_23 then
		local var_5_25 = RANDOM.GetItemData(arg_5_1, {
			itemType = LOOT.itemTypes.EMBLEM
		})

		var_5_10 = var_5_25.image
		var_5_11 = var_5_25.name
	elseif var_5_24 then
		local var_5_26 = RANDOM.GetItemData(arg_5_1, {
			isFav = true,
			itemType = LOOT.itemTypes.EMBLEM
		})

		var_5_10 = var_5_26.image
		var_5_11 = var_5_26.name
	end

	local var_5_27 = EmblemEditorUtils.IsClanEmblemEnabled(arg_5_1)

	if var_5_27 then
		local var_5_28 = EmblemEditorUtils.GetClanEmblemData(arg_5_1, {
			itemType = LOOT.itemTypes.EMBLEM
		})

		var_5_17 = var_5_28.clanEmblemData
		var_5_18 = var_5_28.name
	end

	local var_5_29 = ""
	local var_5_30 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.FRAME)
	local var_5_31 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.FRAME, {
		isFav = true
	})

	if var_5_30 then
		local var_5_32 = RANDOM.GetItemData(arg_5_1, {
			itemType = LOOT.itemTypes.FRAME
		})

		var_5_29 = var_5_32.image
		var_5_15 = var_5_32.name
	elseif var_5_31 then
		local var_5_33 = RANDOM.GetItemData(arg_5_1, {
			isFav = true,
			itemType = LOOT.itemTypes.FRAME
		})

		var_5_29 = var_5_33.image
		var_5_15 = var_5_33.name
	end

	local var_5_34 = ""
	local var_5_35 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.TITLE)
	local var_5_36 = RANDOM.IsEnabled(arg_5_1, LOOT.itemTypes.TITLE, {
		isFav = true
	})

	if var_5_35 then
		var_5_34 = RANDOM.GetItemData(arg_5_1, {
			itemType = LOOT.itemTypes.TITLE
		}).name
	elseif var_5_36 then
		var_5_34 = RANDOM.GetItemData(arg_5_1, {
			isFav = true,
			itemType = LOOT.itemTypes.TITLE
		}).name
	end

	local var_5_37 = var_5_0.radial

	if var_5_27 then
		arg_5_0.ClanEmblem:SetAlpha(1)
		arg_5_0.Emblem:SetAlpha(0)
		arg_5_0.ClanEmblem:SetEmblem(var_5_17)
		arg_5_0.EmblemName:setText(Engine.CBBHFCGDIC(var_5_18))
	else
		if var_5_10 ~= "" then
			arg_5_0.Emblem:setImage(RegisterMaterial(var_5_10))
		else
			arg_5_0.Emblem:SetAlpha(0)
		end

		arg_5_0.EmblemName:setText(Engine.CBBHFCGDIC(var_5_11))
	end

	if var_5_12 ~= "" then
		arg_5_0.CallingCard:setImage(RegisterMaterial(var_5_12))
	else
		arg_5_0.CallingCard:SetAlpha(0)
	end

	arg_5_0.CallingCardName:setText(Engine.CBBHFCGDIC(var_5_13))

	if var_5_14 ~= "" then
		if var_5_30 or var_5_31 then
			arg_5_0.Frame:setImage(RegisterMaterial(var_5_29))
		else
			arg_5_0.Frame:setImage(RegisterMaterial(var_5_14))
		end

		arg_5_0.FrameSelected:setImage(RegisterMaterial(var_5_14))
	else
		arg_5_0.Frame:SetAlpha(0)
	end

	arg_5_0.FrameName:setText(Engine.CBBHFCGDIC(var_5_15))

	if var_5_16 == PlayerTitleUtils.GetTitleNameFromID(PlayerTitleUtils.DefaultTitleID) then
		arg_5_0.PlayerTitle:SetAlpha(0)
		arg_5_0.TitleBacker:SetAlpha(0)
	else
		arg_5_0.PlayerTitle:SetAlpha(1)
		arg_5_0.TitleBacker:SetAlpha(0.5)

		if var_5_35 or var_5_36 then
			arg_5_0.PlayerTitle:setText(Engine.CBBHFCGDIC(Engine.CBEAHDFCFC(var_5_34)))
		else
			arg_5_0.PlayerTitle:setText(Engine.CBBHFCGDIC(Engine.CBEAHDFCFC(var_5_16)))
		end

		arg_5_0.PlayerTitleName:setText(Engine.CBBHFCGDIC(Engine.CBEAHDFCFC(var_5_16)))
	end

	if Engine.BAHCIEEBFD(arg_5_1) and CONDITIONS.IsOnlineAndSignedIn(arg_5_1) then
		local var_5_38 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Common, CoD.PlayMode.Core)

		if var_5_38 ~= nil then
			local var_5_39 = var_5_38.clanTag

			arg_5_0:SubscribeToModel(var_5_39:GetModel(arg_5_1), function()
				arg_5_0._customClanTag = var_5_39:GetValue(arg_5_1)

				var_0_2(arg_5_0, arg_5_1)
			end)

			local var_5_40 = var_5_38.clanTagType
			local var_5_41 = var_5_40:GetValue(arg_5_1)

			ACTIONS.AnimateSequence(arg_5_0, var_5_41 == ClanTagType.OFFICIAL and "ShowCustomClanTag")
			var_0_3(arg_5_0, var_5_41)
			arg_5_0:SubscribeToModel(var_5_40:GetModel(arg_5_1), function()
				local var_7_0 = var_5_40:GetValue(arg_5_1)

				var_0_3(arg_5_0, var_7_0)
			end)
		end
	end

	if CONDITIONS.IsClanUIEnabled() then
		arg_5_0._activeClanID = Clans2.CFGBBBHFHB(arg_5_1)

		if arg_5_0._activeClanID and arg_5_0._activeClanID ~= 1 then
			local var_5_42 = Clans2.GFFJCJFIJ(arg_5_1, arg_5_0._activeClanID).clanTag

			if var_5_42 and var_5_42 ~= "" then
				arg_5_0.ActiveClanTag:setText("[^3" .. var_5_42 .. "^7]")
			else
				arg_5_0.ActiveClanTag:setText("")
			end
		end
	end

	local var_5_43 = {}

	for iter_5_0 = 0, #var_5_37 - 1 do
		local var_5_44 = var_5_37[iter_5_0]:get()

		if var_5_44 > LOOT.emptyID then
			local var_5_45 = LOOT.GetTypeForID(var_5_44)
			local var_5_46 = LOOT.GetItemRef(var_5_45, var_5_44)
			local var_5_47 = LOOT.GetItemImage(var_5_45, var_5_46)

			if var_5_47 and var_5_47 ~= "" then
				table.insert(var_5_43, var_5_47)
			end
		end
	end

	local var_5_48 = PlayercardUtils.GetFrontendDataSources(var_5_1, arg_5_1)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		arg_5_0.SmallPlayerCard:SetDataSource(var_5_48, arg_5_1)
		arg_5_0.SmallPlayerCard.Name:setText(Engine.BAGAFBABEE(arg_5_1))
		ACTIONS.AnimateSequence(arg_5_0.SmallPlayerCard, "NoRank")
	elseif arg_5_0.WZSmallPlayerCard ~= nil then
		arg_5_0.WZSmallPlayerCard:SetDataSource(var_5_48, arg_5_1)
		arg_5_0.WZSmallPlayerCard.Name:setText(Engine.BAGAFBABEE(arg_5_1))
		ACTIONS.AnimateSequence(arg_5_0.WZSmallPlayerCard, "NoRank")
	end

	arg_5_0.RadialLoadoutGrid:RemoveFocusFromChild()
	arg_5_0.RadialLoadoutGrid:SetNumChildren(#var_5_43)
	arg_5_0.RadialLoadoutGrid:SetRefreshChild(function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_8_1 + arg_8_2 * arg_5_0.RadialLoadoutGrid:GetNumColumns()

		arg_8_0.Image:setImage(RegisterMaterial(var_5_43[var_8_0 + 1]))
	end)
	arg_5_0.RadialLoadoutGrid:RefreshContent()

	if IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_5_0, "CH")
	end
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.SetData = var_0_4
	arg_9_0.UpdateClanTagType = var_0_3
	arg_9_0._tagWidth = arg_9_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	ACTIONS.AnimateSequence(arg_9_0, "HideAll")

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_9_0, "WZWipSetup")
	end

	var_0_4(arg_9_0, arg_9_1)
end

function BarracksCustomizeSummary(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 659 * _1080p)

	var_10_0.id = "BarracksCustomizeSummary"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "RadialBacker"

	var_10_4:SetAlpha(0.5, 0)
	var_10_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1021, _1080p * 431, _1080p * 659)
	var_10_0:addElement(var_10_4)

	var_10_0.RadialBacker = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "ClanTagBacker"

	var_10_6:SetAlpha(0.5, 0)
	var_10_6.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 413)
	var_10_0:addElement(var_10_6)

	var_10_0.ClanTagBacker = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "PlayerTitleBacker"

	var_10_8:SetAlpha(0.5, 0)
	var_10_8.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 555, 0, _1080p * 221)
	var_10_0:addElement(var_10_8)

	var_10_0.PlayerTitleBacker = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "FrameBacker"

	var_10_10:SetAlpha(0, 0)
	var_10_10.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, 0, _1080p * 221)
	var_10_0:addElement(var_10_10)

	var_10_0.FrameBacker = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "CallingCardBacker"

	var_10_12:SetAlpha(0.5, 0)
	var_10_12.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, 0, _1080p * 221)
	var_10_0:addElement(var_10_12)

	var_10_0.CallingCardBacker = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "EmblemBacker"

	var_10_14:SetAlpha(0.5, 0)
	var_10_14.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 447, 0, _1080p * 413)
	var_10_0:addElement(var_10_14)

	var_10_0.EmblemBacker = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "VehicleBacker"

	var_10_16:SetAlpha(0, 0)
	var_10_16.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1100, 0, _1080p * 659)
	var_10_0:addElement(var_10_16)

	var_10_0.VehicleBacker = var_10_16

	local var_10_17
	local var_10_18 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 8,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RadialCustomizationItemPreview", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 100,
		rowHeight = _1080p * 100,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_19 = LUI.UIGrid.new(var_10_18)

	var_10_19.id = "RadialLoadoutGrid"

	var_10_19:setUseStencil(true)
	var_10_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 41, _1080p * 981, _1080p * 511, _1080p * 732)
	var_10_0:addElement(var_10_19)

	var_10_0.RadialLoadoutGrid = var_10_19

	local var_10_20
	local var_10_21 = LUI.UIText.new()

	var_10_21.id = "ClanTag"

	var_10_21:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_21:setText("", 0)
	var_10_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_21:SetWordWrap(false)
	var_10_21:SetAlignment(LUI.Alignment.Center)
	var_10_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 482, _1080p * 1005, _1080p * 287, _1080p * 407)
	var_10_0:addElement(var_10_21)

	var_10_0.ClanTag = var_10_21

	local var_10_22
	local var_10_23 = LUI.UIStyledText.new()

	var_10_23.id = "CallingCardName"

	var_10_23:SetRGBFromTable(SWATCHES.Scoreboard.grayText, 0)
	var_10_23:setText(ToUpperCase(""), 0)
	var_10_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_23:SetWordWrap(false)
	var_10_23:SetAlignment(LUI.Alignment.Center)
	var_10_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_23:SetStartupDelay(2000)
	var_10_23:SetLineHoldTime(400)
	var_10_23:SetAnimMoveTime(2000)
	var_10_23:SetAnimMoveSpeed(150)
	var_10_23:SetEndDelay(2000)
	var_10_23:SetCrossfadeTime(250)
	var_10_23:SetFadeInTime(300)
	var_10_23:SetFadeOutTime(300)
	var_10_23:SetMaxVisibleLines(1)
	var_10_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 976, _1080p * 180, _1080p * 210)
	var_10_0:addElement(var_10_23)

	var_10_0.CallingCardName = var_10_23

	local var_10_24
	local var_10_25 = LUI.UIImage.new()

	var_10_25.id = "CallingCard"

	var_10_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 976, _1080p * 60, _1080p * 178)
	var_10_0:addElement(var_10_25)

	var_10_0.CallingCard = var_10_25

	local var_10_26
	local var_10_27 = LUI.UIImage.new()

	var_10_27.id = "FrameSelected"

	var_10_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 976, _1080p * 60, _1080p * 178)
	var_10_0:addElement(var_10_27)

	var_10_0.FrameSelected = var_10_27

	local var_10_28
	local var_10_29 = LUI.UIImage.new()

	var_10_29.id = "VehiclePreview"

	var_10_29:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_10_0:addElement(var_10_29)

	var_10_0.VehiclePreview = var_10_29

	local var_10_30
	local var_10_31 = LUI.UIImage.new()

	var_10_31.id = "Frame"

	var_10_31:SetAlpha(0, 0)
	var_10_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 976, _1080p * 60, _1080p * 178)
	var_10_0:addElement(var_10_31)

	var_10_0.Frame = var_10_31

	local var_10_32
	local var_10_33 = LUI.UIStyledText.new()

	var_10_33.id = "FrameName"

	var_10_33:SetRGBFromTable(SWATCHES.Scoreboard.grayText, 0)
	var_10_33:SetAlpha(0, 0)
	var_10_33:setText("", 0)
	var_10_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_33:SetWordWrap(false)
	var_10_33:SetAlignment(LUI.Alignment.Center)
	var_10_33:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_33:SetStartupDelay(2000)
	var_10_33:SetLineHoldTime(400)
	var_10_33:SetAnimMoveTime(2000)
	var_10_33:SetAnimMoveSpeed(150)
	var_10_33:SetEndDelay(2000)
	var_10_33:SetCrossfadeTime(250)
	var_10_33:SetFadeInTime(300)
	var_10_33:SetFadeOutTime(300)
	var_10_33:SetMaxVisibleLines(1)
	var_10_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 1611, _1080p * 180, _1080p * 210)
	var_10_0:addElement(var_10_33)

	var_10_0.FrameName = var_10_33

	local var_10_34
	local var_10_35 = LUI.UIStyledText.new()

	var_10_35.id = "EmblemName"

	var_10_35:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_10_35:setText(ToUpperCase(""), 0)
	var_10_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_35:SetAlignment(LUI.Alignment.Center)
	var_10_35:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_10_35:SetStartupDelay(1000)
	var_10_35:SetLineHoldTime(400)
	var_10_35:SetAnimMoveTime(150)
	var_10_35:SetAnimMoveSpeed(50)
	var_10_35:SetEndDelay(1000)
	var_10_35:SetCrossfadeTime(400)
	var_10_35:SetFadeInTime(300)
	var_10_35:SetFadeOutTime(300)
	var_10_35:SetMaxVisibleLines(1)
	var_10_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 31, _1080p * 417, _1080p * 368, _1080p * 398)
	var_10_0:addElement(var_10_35)

	var_10_0.EmblemName = var_10_35

	local var_10_36
	local var_10_37 = LUI.UIImage.new()

	var_10_37.id = "Emblem"

	var_10_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 74, _1080p * 374, _1080p * 60, _1080p * 360)
	var_10_0:addElement(var_10_37)

	var_10_0.Emblem = var_10_37

	local var_10_38
	local var_10_39 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_10_1
	})

	var_10_39.id = "ClanEmblem"

	var_10_39:SetAlpha(0, 0)
	var_10_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 74, _1080p * 374, _1080p * 60, _1080p * 360)
	var_10_0:addElement(var_10_39)

	var_10_0.ClanEmblem = var_10_39

	local var_10_40
	local var_10_41 = LUI.UIImage.new()

	var_10_41.id = "TitleBacker"

	var_10_41:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_41:SetAlpha(0, 0)
	var_10_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 510, _1080p * 914, _1080p * 156, _1080p * 178)
	var_10_0:addElement(var_10_41)

	var_10_0.TitleBacker = var_10_41

	local var_10_42
	local var_10_43 = LUI.UIStyledText.new()

	var_10_43.id = "PlayerTitle"

	var_10_43:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_10_43:SetAlpha(0, 0)
	var_10_43:setText("", 0)
	var_10_43:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_43:SetWordWrap(false)
	var_10_43:SetAlignment(LUI.Alignment.Left)
	var_10_43:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_43:SetStartupDelay(2000)
	var_10_43:SetLineHoldTime(400)
	var_10_43:SetAnimMoveTime(2000)
	var_10_43:SetAnimMoveSpeed(150)
	var_10_43:SetEndDelay(2000)
	var_10_43:SetCrossfadeTime(250)
	var_10_43:SetFadeInTime(300)
	var_10_43:SetFadeOutTime(300)
	var_10_43:SetMaxVisibleLines(1)
	var_10_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 520, _1080p * 914, _1080p * 150, _1080p * 180)
	var_10_0:addElement(var_10_43)

	var_10_0.PlayerTitle = var_10_43

	local var_10_44
	local var_10_45 = LUI.UIStyledText.new()

	var_10_45.id = "PlayerTitleName"

	var_10_45:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_10_45:SetAlpha(0, 0)
	var_10_45:setText("", 0)
	var_10_45:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_45:SetWordWrap(false)
	var_10_45:SetAlignment(LUI.Alignment.Left)
	var_10_45:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_45:SetStartupDelay(2000)
	var_10_45:SetLineHoldTime(400)
	var_10_45:SetAnimMoveTime(2000)
	var_10_45:SetAnimMoveSpeed(150)
	var_10_45:SetEndDelay(2000)
	var_10_45:SetCrossfadeTime(250)
	var_10_45:SetFadeInTime(300)
	var_10_45:SetFadeOutTime(300)
	var_10_45:SetMaxVisibleLines(1)
	var_10_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 515, _1080p * 1615, _1080p * 148, _1080p * 178)
	var_10_0:addElement(var_10_45)

	var_10_0.PlayerTitleName = var_10_45

	local var_10_46
	local var_10_47 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_47.id = "EmblemTitle"

	var_10_47.Text:SetLeft(0, 0)
	var_10_47.Text:SetRight(0, 0)
	var_10_47.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EMBLEM"), 0)
	var_10_47.Text:SetAlignment(LUI.Alignment.Center)
	var_10_47:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 447, 0, _1080p * 47)
	var_10_0:addElement(var_10_47)

	var_10_0.EmblemTitle = var_10_47

	local var_10_48
	local var_10_49 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_49.id = "PlayerTitleTitle"

	var_10_49.Text:SetLeft(0, 0)
	var_10_49.Text:SetRight(0, 0)
	var_10_49.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CALLINGCARDFRAME"), 0)
	var_10_49.Text:SetAlignment(LUI.Alignment.Center)
	var_10_49:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 555, 0, _1080p * 47)
	var_10_0:addElement(var_10_49)

	var_10_0.PlayerTitleTitle = var_10_49

	local var_10_50
	local var_10_51 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_51.id = "VehicleTitle"

	var_10_51:SetAlpha(0, 0)
	var_10_51.Text:SetLeft(0, 0)
	var_10_51.Text:SetRight(0, 0)
	var_10_51.Text:setText(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION"), 0)
	var_10_51.Text:SetAlignment(LUI.Alignment.Center)
	var_10_51:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1100, 0, _1080p * 47)
	var_10_0:addElement(var_10_51)

	var_10_0.VehicleTitle = var_10_51

	local var_10_52
	local var_10_53 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_53.id = "FrameTitle"

	var_10_53:SetAlpha(0, 0)
	var_10_53.Text:SetLeft(0, 0)
	var_10_53.Text:SetRight(0, 0)
	var_10_53.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CALLING_CARD"), 0)
	var_10_53.Text:SetAlignment(LUI.Alignment.Center)
	var_10_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, 0, _1080p * 47)
	var_10_0:addElement(var_10_53)

	var_10_0.FrameTitle = var_10_53

	local var_10_54
	local var_10_55 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_55.id = "CallingCardTitle"

	var_10_55.Text:SetLeft(0, 0)
	var_10_55.Text:SetRight(0, 0)
	var_10_55.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CALLING_CARD"), 0)
	var_10_55.Text:SetAlignment(LUI.Alignment.Center)
	var_10_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, 0, _1080p * 47)
	var_10_0:addElement(var_10_55)

	var_10_0.CallingCardTitle = var_10_55

	local var_10_56
	local var_10_57 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_57.id = "ClanTagTitle"

	var_10_57.Text:SetLeft(0, 0)
	var_10_57.Text:SetRight(0, 0)
	var_10_57.Text:setText(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG"), 0)
	var_10_57.Text:SetAlignment(LUI.Alignment.Center)
	var_10_57:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 287)
	var_10_0:addElement(var_10_57)

	var_10_0.ClanTagTitle = var_10_57

	local var_10_58
	local var_10_59 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_59.id = "SpraysAndGesturesTitle"

	var_10_59.Text:SetLeft(0, 0)
	var_10_59.Text:SetRight(0, 0)
	var_10_59.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION"), 0)
	var_10_59.Text:SetAlignment(LUI.Alignment.Center)
	var_10_59:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1021, _1080p * 432, _1080p * 479)
	var_10_0:addElement(var_10_59)

	var_10_0.SpraysAndGesturesTitle = var_10_59

	local var_10_60
	local var_10_61 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_61.id = "OfficialClanTagBacker"

	var_10_61:SetAlpha(0, 0)
	var_10_61.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_61:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 413)
	var_10_0:addElement(var_10_61)

	var_10_0.OfficialClanTagBacker = var_10_61

	local var_10_62
	local var_10_63 = LUI.UIText.new()

	var_10_63.id = "OfficialClanTag"

	var_10_63:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_63:SetAlpha(0, 0)
	var_10_63:setText("", 0)
	var_10_63:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_63:SetWordWrap(false)
	var_10_63:SetAlignment(LUI.Alignment.Center)
	var_10_63:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 482, _1080p * 1021, _1080p * 287, _1080p * 407)
	var_10_0:addElement(var_10_63)

	var_10_0.OfficialClanTag = var_10_63

	local var_10_64
	local var_10_65 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_65.id = "OfficialClanTagTitle"

	var_10_65:SetAlpha(0, 0)
	var_10_65.Text:SetLeft(0, 0)
	var_10_65.Text:SetRight(0, 0)
	var_10_65.Text:setText(Engine.CBBHFCGDIC("REGIMENTS/REGIMENT_CLAN_TAG"), 0)
	var_10_65.Text:SetAlignment(LUI.Alignment.Center)
	var_10_65:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 287)
	var_10_0:addElement(var_10_65)

	var_10_0.OfficialClanTagTitle = var_10_65

	local var_10_66
	local var_10_67 = LUI.UIText.new()

	var_10_67.id = "SwitchClanTagPrompt"

	var_10_67:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_67:SetAlpha(0, 0)
	var_10_67:setText(Engine.CBBHFCGDIC("REGIMENTS/USE_REGIMENT_CLAN_TAG"), 0)
	var_10_67:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_67:SetAlignment(LUI.Alignment.Left)
	var_10_67:SetTintFontIcons(true)
	var_10_67:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 382, _1080p * 186, _1080p * 206)
	var_10_0:addElement(var_10_67)

	var_10_0.SwitchClanTagPrompt = var_10_67

	local var_10_68
	local var_10_69 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_69.id = "PlayerDetailsBacker"

	var_10_69:SetScale(0.1, 0)
	var_10_69.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_69:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -324, _1080p * 175, _1080p * 9, _1080p * 195)
	var_10_0:addElement(var_10_69)

	var_10_0.PlayerDetailsBacker = var_10_69

	local var_10_70
	local var_10_71 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_71.id = "PlayerDetailsHeader"

	var_10_71:SetScale(0.1, 0)
	var_10_71.Text:SetLeft(0, 0)
	var_10_71.Text:SetRight(0, 0)
	var_10_71.Text:setText(Engine.CBBHFCGDIC("MENU/PLAYER_DETAILS"), 0)
	var_10_71.Text:SetAlignment(LUI.Alignment.Center)
	var_10_71:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -324, _1080p * 175, _1080p * 3, _1080p * 49)
	var_10_0:addElement(var_10_71)

	var_10_0.PlayerDetailsHeader = var_10_71

	local var_10_72

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		var_10_72 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
			controllerIndex = var_10_1
		})
		var_10_72.id = "SmallPlayerCard"

		var_10_72:SetScale(0.1, 0)
		var_10_72.GradientBacker:SetAlpha(0, 0)
		var_10_72:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -304, _1080p * 216, _1080p * 57, _1080p * 181)
		var_10_0:addElement(var_10_72)

		var_10_0.SmallPlayerCard = var_10_72
	end

	local var_10_73

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		var_10_73 = MenuBuilder.BuildRegisteredType("WZSmallPlayerCard", {
			controllerIndex = var_10_1
		})
		var_10_73.id = "WZSmallPlayerCard"

		var_10_73:SetScale(0.1, 0)
		var_10_73.GradientBacker:SetAlpha(0, 0)
		var_10_73:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -304, _1080p * 216, _1080p * 57, _1080p * 181)
		var_10_0:addElement(var_10_73)

		var_10_0.WZSmallPlayerCard = var_10_73
	end

	local var_10_74
	local var_10_75 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_10_1
	})

	var_10_75.id = "EquippedWidget"

	var_10_75:SetAlpha(0, 0)
	var_10_75:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 419, _1080p * 555, _1080p * 8, _1080p * 38)
	var_10_0:addElement(var_10_75)

	var_10_0.EquippedWidget = var_10_75

	local var_10_76
	local var_10_77 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_77.id = "ActiveClanTagTitle"

	var_10_77:SetAlpha(0, 0)
	var_10_77.Text:SetLeft(0, 0)
	var_10_77.Text:SetRight(0, 0)
	var_10_77.Text:setText(Engine.CBBHFCGDIC("CLANS/ACTIVE_CLAN_TAG"), 0)
	var_10_77.Text:SetAlignment(LUI.Alignment.Center)
	var_10_77:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 287)
	var_10_0:addElement(var_10_77)

	var_10_0.ActiveClanTagTitle = var_10_77

	local var_10_78
	local var_10_79 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_79.id = "ActiveClanTagBacker"

	var_10_79:SetAlpha(0, 0)
	var_10_79.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_10_79:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 413)
	var_10_0:addElement(var_10_79)

	var_10_0.ActiveClanTagBacker = var_10_79

	local var_10_80
	local var_10_81 = LUI.UIText.new()

	var_10_81.id = "ActiveClanTag"

	var_10_81:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_81:SetAlpha(0, 0)
	var_10_81:setText("", 0)
	var_10_81:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_81:SetWordWrap(false)
	var_10_81:SetAlignment(LUI.Alignment.Center)
	var_10_81:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 194, _1080p * 1294, _1080p * 287, _1080p * 407)
	var_10_0:addElement(var_10_81)

	var_10_0.ActiveClanTag = var_10_81

	local var_10_82
	local var_10_83 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_10_1
	})

	var_10_83.id = "CustomClanTagEquippedIcon"

	var_10_83:SetAlpha(0, 0)
	var_10_83:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 419, _1080p * 555, _1080p * 8, _1080p * 38)
	var_10_0:addElement(var_10_83)

	var_10_0.CustomClanTagEquippedIcon = var_10_83

	local var_10_84
	local var_10_85 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_10_1
	})

	var_10_85.id = "ActiveClanTagEquippedIcon"

	var_10_85:SetAlpha(0, 0)
	var_10_85:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 419, _1080p * 555, _1080p * 8, _1080p * 38)
	var_10_0:addElement(var_10_85)

	var_10_0.ActiveClanTagEquippedIcon = var_10_85

	local var_10_86
	local var_10_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("DefaultSequence", var_10_87)

	local function var_10_88()
		var_10_75:AnimateSequence("DefaultSequence")
	end

	var_10_0._sequences.DefaultSequence = var_10_88

	local var_10_89
	local var_10_90 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowEmblem", var_10_90)

	local var_10_91 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowEmblem", var_10_91)

	local var_10_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowEmblem", var_10_92)

	local var_10_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowEmblem", var_10_93)

	local var_10_94 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowEmblem", var_10_94)

	local var_10_95 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowEmblem", var_10_95)

	local var_10_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowEmblem", var_10_96)

	local var_10_97 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowEmblem", var_10_97)

	local var_10_98 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowEmblem", var_10_98)

	local var_10_99 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowEmblem", var_10_99)

	local var_10_100 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowEmblem", var_10_100)

	local var_10_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowEmblem", var_10_101)

	local var_10_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowEmblem", var_10_102)

	local var_10_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowEmblem", var_10_103)

	local var_10_104 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowEmblem", var_10_104)

	local var_10_105 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowEmblem", var_10_105)

	local var_10_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowEmblem", var_10_106)

	local var_10_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowEmblem", var_10_107)

	local var_10_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowEmblem", var_10_108)

	local var_10_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 447
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowEmblem", var_10_109)

	local var_10_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowEmblem", var_10_110)

	local var_10_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowEmblem", var_10_111)

	local var_10_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowEmblem", var_10_112)

	local var_10_113 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowEmblem", var_10_113)

	local var_10_114 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowEmblem", var_10_114)

	local var_10_115 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowEmblem", var_10_115)

	local var_10_116 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowEmblem", var_10_116)

	local var_10_117 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowEmblem", var_10_117)

	local var_10_118 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowEmblem", var_10_118)

	local var_10_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowEmblem", var_10_119)

	local var_10_120 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowEmblem", var_10_120)

	local var_10_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowEmblem", var_10_121)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_122 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowEmblem", var_10_122)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_123 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -304
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 216
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_10_73:RegisterAnimationSequence("ShowEmblem", var_10_123)
	end

	local var_10_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 438
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowEmblem", var_10_124)

	local var_10_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowEmblem", var_10_125)

	local var_10_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowEmblem", var_10_126)

	local var_10_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowEmblem", var_10_127)

	local var_10_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowEmblem", var_10_128)

	local var_10_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowEmblem", var_10_129)

	local function var_10_130()
		var_10_4:AnimateSequence("ShowEmblem")
		var_10_6:AnimateSequence("ShowEmblem")
		var_10_8:AnimateSequence("ShowEmblem")
		var_10_10:AnimateSequence("ShowEmblem")
		var_10_12:AnimateSequence("ShowEmblem")
		var_10_14:AnimateSequence("ShowEmblem")
		var_10_16:AnimateSequence("ShowEmblem")
		var_10_19:AnimateSequence("ShowEmblem")
		var_10_21:AnimateSequence("ShowEmblem")
		var_10_23:AnimateSequence("ShowEmblem")
		var_10_25:AnimateSequence("ShowEmblem")
		var_10_29:AnimateSequence("ShowEmblem")
		var_10_31:AnimateSequence("ShowEmblem")
		var_10_33:AnimateSequence("ShowEmblem")
		var_10_35:AnimateSequence("ShowEmblem")
		var_10_37:AnimateSequence("ShowEmblem")
		var_10_41:AnimateSequence("ShowEmblem")
		var_10_43:AnimateSequence("ShowEmblem")
		var_10_45:AnimateSequence("ShowEmblem")
		var_10_47:AnimateSequence("ShowEmblem")
		var_10_49:AnimateSequence("ShowEmblem")
		var_10_51:AnimateSequence("ShowEmblem")
		var_10_53:AnimateSequence("ShowEmblem")
		var_10_55:AnimateSequence("ShowEmblem")
		var_10_57:AnimateSequence("ShowEmblem")
		var_10_59:AnimateSequence("ShowEmblem")
		var_10_61:AnimateSequence("ShowEmblem")
		var_10_63:AnimateSequence("ShowEmblem")
		var_10_65:AnimateSequence("ShowEmblem")
		var_10_67:AnimateSequence("ShowEmblem")
		var_10_69:AnimateSequence("ShowEmblem")
		var_10_71:AnimateSequence("ShowEmblem")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowEmblem")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowEmblem")
		end

		var_10_75:AnimateSequence("ShowEmblem")
		var_10_77:AnimateSequence("ShowEmblem")
		var_10_79:AnimateSequence("ShowEmblem")
		var_10_81:AnimateSequence("ShowEmblem")
		var_10_83:AnimateSequence("ShowEmblem")
		var_10_85:AnimateSequence("ShowEmblem")
	end

	var_10_0._sequences.ShowEmblem = var_10_130

	local var_10_131
	local var_10_132 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowCallingCard", var_10_132)

	local var_10_133 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowCallingCard", var_10_133)

	local var_10_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowCallingCard", var_10_134)

	local var_10_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowCallingCard", var_10_135)

	local var_10_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 221
		},
		{
			value = 0.5,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowCallingCard", var_10_136)

	local var_10_137 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowCallingCard", var_10_137)

	local var_10_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowCallingCard", var_10_138)

	local var_10_139 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowCallingCard", var_10_139)

	local var_10_140 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowCallingCard", var_10_140)

	local var_10_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 180
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 210
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowCallingCard", var_10_141)

	local var_10_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowCallingCard", var_10_142)

	local var_10_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowCallingCard", var_10_143)

	local var_10_144 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowCallingCard", var_10_144)

	local var_10_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowCallingCard", var_10_145)

	local var_10_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowCallingCard", var_10_146)

	local var_10_147 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowCallingCard", var_10_147)

	local var_10_148 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowCallingCard", var_10_148)

	local var_10_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowCallingCard", var_10_149)

	local var_10_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowCallingCard", var_10_150)

	local var_10_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowCallingCard", var_10_151)

	local var_10_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowCallingCard", var_10_152)

	local var_10_153 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowCallingCard", var_10_153)

	local var_10_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowCallingCard", var_10_154)

	local var_10_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowCallingCard", var_10_155)

	local var_10_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowCallingCard", var_10_156)

	local var_10_157 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowCallingCard", var_10_157)

	local var_10_158 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowCallingCard", var_10_158)

	local var_10_159 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowCallingCard", var_10_159)

	local var_10_160 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowCallingCard", var_10_160)

	local var_10_161 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowCallingCard", var_10_161)

	local var_10_162 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowCallingCard", var_10_162)

	local var_10_163 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowCallingCard", var_10_163)

	local var_10_164 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowCallingCard", var_10_164)

	local var_10_165 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowCallingCard", var_10_165)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_166 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowCallingCard", var_10_166)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_167 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -304
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 216
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_10_73:RegisterAnimationSequence("ShowCallingCard", var_10_167)
	end

	local var_10_168 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		}
	}

	var_10_75:RegisterAnimationSequence("ShowCallingCard", var_10_168)

	local var_10_169 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowCallingCard", var_10_169)

	local var_10_170 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowCallingCard", var_10_170)

	local var_10_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowCallingCard", var_10_171)

	local var_10_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowCallingCard", var_10_172)

	local var_10_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowCallingCard", var_10_173)

	local function var_10_174()
		var_10_4:AnimateSequence("ShowCallingCard")
		var_10_6:AnimateSequence("ShowCallingCard")
		var_10_8:AnimateSequence("ShowCallingCard")
		var_10_10:AnimateSequence("ShowCallingCard")
		var_10_12:AnimateSequence("ShowCallingCard")
		var_10_14:AnimateSequence("ShowCallingCard")
		var_10_16:AnimateSequence("ShowCallingCard")
		var_10_19:AnimateSequence("ShowCallingCard")
		var_10_21:AnimateSequence("ShowCallingCard")
		var_10_23:AnimateSequence("ShowCallingCard")
		var_10_25:AnimateSequence("ShowCallingCard")
		var_10_27:AnimateSequence("ShowCallingCard")
		var_10_29:AnimateSequence("ShowCallingCard")
		var_10_31:AnimateSequence("ShowCallingCard")
		var_10_33:AnimateSequence("ShowCallingCard")
		var_10_35:AnimateSequence("ShowCallingCard")
		var_10_37:AnimateSequence("ShowCallingCard")
		var_10_39:AnimateSequence("ShowCallingCard")
		var_10_41:AnimateSequence("ShowCallingCard")
		var_10_43:AnimateSequence("ShowCallingCard")
		var_10_45:AnimateSequence("ShowCallingCard")
		var_10_47:AnimateSequence("ShowCallingCard")
		var_10_49:AnimateSequence("ShowCallingCard")
		var_10_51:AnimateSequence("ShowCallingCard")
		var_10_53:AnimateSequence("ShowCallingCard")
		var_10_55:AnimateSequence("ShowCallingCard")
		var_10_57:AnimateSequence("ShowCallingCard")
		var_10_59:AnimateSequence("ShowCallingCard")
		var_10_61:AnimateSequence("ShowCallingCard")
		var_10_63:AnimateSequence("ShowCallingCard")
		var_10_65:AnimateSequence("ShowCallingCard")
		var_10_67:AnimateSequence("ShowCallingCard")
		var_10_69:AnimateSequence("ShowCallingCard")
		var_10_71:AnimateSequence("ShowCallingCard")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowCallingCard")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowCallingCard")
		end

		var_10_75:AnimateSequence("ShowCallingCard")
		var_10_77:AnimateSequence("ShowCallingCard")
		var_10_79:AnimateSequence("ShowCallingCard")
		var_10_81:AnimateSequence("ShowCallingCard")
		var_10_83:AnimateSequence("ShowCallingCard")
		var_10_85:AnimateSequence("ShowCallingCard")
	end

	var_10_0._sequences.ShowCallingCard = var_10_174

	local var_10_175
	local var_10_176 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowClanTags", var_10_176)

	local var_10_177 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowClanTags", var_10_177)

	local var_10_178 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowClanTags", var_10_178)

	local var_10_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowClanTags", var_10_179)

	local var_10_180 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowClanTags", var_10_180)

	local var_10_181 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowClanTags", var_10_181)

	local var_10_182 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowClanTags", var_10_182)

	local var_10_183 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowClanTags", var_10_183)

	local var_10_184 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 539
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 167
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowClanTags", var_10_184)

	local var_10_185 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowClanTags", var_10_185)

	local var_10_186 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowClanTags", var_10_186)

	local var_10_187 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowClanTags", var_10_187)

	local var_10_188 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowClanTags", var_10_188)

	local var_10_189 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowClanTags", var_10_189)

	local var_10_190 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowClanTags", var_10_190)

	local var_10_191 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowClanTags", var_10_191)

	local var_10_192 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowClanTags", var_10_192)

	local var_10_193 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowClanTags", var_10_193)

	local var_10_194 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowClanTags", var_10_194)

	local var_10_195 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowClanTags", var_10_195)

	local var_10_196 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowClanTags", var_10_196)

	local var_10_197 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowClanTags", var_10_197)

	local var_10_198 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowClanTags", var_10_198)

	local var_10_199 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowClanTags", var_10_199)

	local var_10_200 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowClanTags", var_10_200)

	local var_10_201 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowClanTags", var_10_201)

	local var_10_202 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG"),
			child = var_10_0.ClanTagTitle.Text
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowClanTags", var_10_202)

	local var_10_203 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowClanTags", var_10_203)

	local var_10_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 602
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowClanTags", var_10_204)

	local var_10_205 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 618
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 167
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowClanTags", var_10_205)

	local var_10_206 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 602
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowClanTags", var_10_206)

	local var_10_207 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowClanTags", var_10_207)

	local var_10_208 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowClanTags", var_10_208)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_209 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowClanTags", var_10_209)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_210 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowClanTags", var_10_210)
	end

	local var_10_211 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowClanTags", var_10_211)

	local var_10_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 618
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowClanTags", var_10_212)

	local var_10_213 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 618
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 176
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowClanTags", var_10_213)

	local var_10_214 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1446
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
		}
	}

	var_10_81:RegisterAnimationSequence("ShowClanTags", var_10_214)

	local var_10_215 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowClanTags", var_10_215)

	local var_10_216 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1032
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowClanTags", var_10_216)

	local function var_10_217()
		var_10_4:AnimateSequence("ShowClanTags")
		var_10_6:AnimateSequence("ShowClanTags")
		var_10_8:AnimateSequence("ShowClanTags")
		var_10_10:AnimateSequence("ShowClanTags")
		var_10_12:AnimateSequence("ShowClanTags")
		var_10_14:AnimateSequence("ShowClanTags")
		var_10_16:AnimateSequence("ShowClanTags")
		var_10_19:AnimateSequence("ShowClanTags")
		var_10_21:AnimateSequence("ShowClanTags")
		var_10_23:AnimateSequence("ShowClanTags")
		var_10_25:AnimateSequence("ShowClanTags")
		var_10_27:AnimateSequence("ShowClanTags")
		var_10_29:AnimateSequence("ShowClanTags")
		var_10_31:AnimateSequence("ShowClanTags")
		var_10_33:AnimateSequence("ShowClanTags")
		var_10_35:AnimateSequence("ShowClanTags")
		var_10_37:AnimateSequence("ShowClanTags")
		var_10_39:AnimateSequence("ShowClanTags")
		var_10_41:AnimateSequence("ShowClanTags")
		var_10_43:AnimateSequence("ShowClanTags")
		var_10_45:AnimateSequence("ShowClanTags")
		var_10_47:AnimateSequence("ShowClanTags")
		var_10_49:AnimateSequence("ShowClanTags")
		var_10_51:AnimateSequence("ShowClanTags")
		var_10_53:AnimateSequence("ShowClanTags")
		var_10_55:AnimateSequence("ShowClanTags")
		var_10_57:AnimateSequence("ShowClanTags")
		var_10_59:AnimateSequence("ShowClanTags")
		var_10_61:AnimateSequence("ShowClanTags")
		var_10_63:AnimateSequence("ShowClanTags")
		var_10_65:AnimateSequence("ShowClanTags")
		var_10_69:AnimateSequence("ShowClanTags")
		var_10_71:AnimateSequence("ShowClanTags")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowClanTags")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowClanTags")
		end

		var_10_75:AnimateSequence("ShowClanTags")
		var_10_77:AnimateSequence("ShowClanTags")
		var_10_79:AnimateSequence("ShowClanTags")
		var_10_81:AnimateSequence("ShowClanTags")
		var_10_83:AnimateSequence("ShowClanTags")
		var_10_85:AnimateSequence("ShowClanTags")
	end

	var_10_0._sequences.ShowClanTags = var_10_217

	local var_10_218
	local var_10_219 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1021
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1021
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowSpraysGestures", var_10_219)

	local var_10_220 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowSpraysGestures", var_10_220)

	local var_10_221 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowSpraysGestures", var_10_221)

	local var_10_222 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSpraysGestures", var_10_222)

	local var_10_223 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSpraysGestures", var_10_223)

	local var_10_224 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowSpraysGestures", var_10_224)

	local var_10_225 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowSpraysGestures", var_10_225)

	local var_10_226 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 981
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 981
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		}
	}

	var_10_19:RegisterAnimationSequence("ShowSpraysGestures", var_10_226)

	local var_10_227 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowSpraysGestures", var_10_227)

	local var_10_228 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowSpraysGestures", var_10_228)

	local var_10_229 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowSpraysGestures", var_10_229)

	local var_10_230 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowSpraysGestures", var_10_230)

	local var_10_231 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowSpraysGestures", var_10_231)

	local var_10_232 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowSpraysGestures", var_10_232)

	local var_10_233 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowSpraysGestures", var_10_233)

	local var_10_234 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowSpraysGestures", var_10_234)

	local var_10_235 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowSpraysGestures", var_10_235)

	local var_10_236 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowSpraysGestures", var_10_236)

	local var_10_237 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowSpraysGestures", var_10_237)

	local var_10_238 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowSpraysGestures", var_10_238)

	local var_10_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowSpraysGestures", var_10_239)

	local var_10_240 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowSpraysGestures", var_10_240)

	local var_10_241 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowSpraysGestures", var_10_241)

	local var_10_242 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowSpraysGestures", var_10_242)

	local var_10_243 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowSpraysGestures", var_10_243)

	local var_10_244 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowSpraysGestures", var_10_244)

	local var_10_245 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowSpraysGestures", var_10_245)

	local var_10_246 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1021
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowSpraysGestures", var_10_246)

	local var_10_247 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowSpraysGestures", var_10_247)

	local var_10_248 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowSpraysGestures", var_10_248)

	local var_10_249 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowSpraysGestures", var_10_249)

	local var_10_250 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowSpraysGestures", var_10_250)

	local var_10_251 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowSpraysGestures", var_10_251)

	local var_10_252 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowSpraysGestures", var_10_252)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_253 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowSpraysGestures", var_10_253)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_254 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowSpraysGestures", var_10_254)
	end

	local var_10_255 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowSpraysGestures", var_10_255)

	local var_10_256 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowSpraysGestures", var_10_256)

	local var_10_257 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowSpraysGestures", var_10_257)

	local var_10_258 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowSpraysGestures", var_10_258)

	local var_10_259 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowSpraysGestures", var_10_259)

	local var_10_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowSpraysGestures", var_10_260)

	local function var_10_261()
		var_10_4:AnimateSequence("ShowSpraysGestures")
		var_10_6:AnimateSequence("ShowSpraysGestures")
		var_10_8:AnimateSequence("ShowSpraysGestures")
		var_10_10:AnimateSequence("ShowSpraysGestures")
		var_10_12:AnimateSequence("ShowSpraysGestures")
		var_10_14:AnimateSequence("ShowSpraysGestures")
		var_10_16:AnimateSequence("ShowSpraysGestures")
		var_10_19:AnimateSequence("ShowSpraysGestures")
		var_10_21:AnimateSequence("ShowSpraysGestures")
		var_10_23:AnimateSequence("ShowSpraysGestures")
		var_10_25:AnimateSequence("ShowSpraysGestures")
		var_10_27:AnimateSequence("ShowSpraysGestures")
		var_10_29:AnimateSequence("ShowSpraysGestures")
		var_10_31:AnimateSequence("ShowSpraysGestures")
		var_10_33:AnimateSequence("ShowSpraysGestures")
		var_10_35:AnimateSequence("ShowSpraysGestures")
		var_10_37:AnimateSequence("ShowSpraysGestures")
		var_10_39:AnimateSequence("ShowSpraysGestures")
		var_10_41:AnimateSequence("ShowSpraysGestures")
		var_10_43:AnimateSequence("ShowSpraysGestures")
		var_10_45:AnimateSequence("ShowSpraysGestures")
		var_10_47:AnimateSequence("ShowSpraysGestures")
		var_10_49:AnimateSequence("ShowSpraysGestures")
		var_10_51:AnimateSequence("ShowSpraysGestures")
		var_10_53:AnimateSequence("ShowSpraysGestures")
		var_10_55:AnimateSequence("ShowSpraysGestures")
		var_10_57:AnimateSequence("ShowSpraysGestures")
		var_10_59:AnimateSequence("ShowSpraysGestures")
		var_10_61:AnimateSequence("ShowSpraysGestures")
		var_10_63:AnimateSequence("ShowSpraysGestures")
		var_10_65:AnimateSequence("ShowSpraysGestures")
		var_10_67:AnimateSequence("ShowSpraysGestures")
		var_10_69:AnimateSequence("ShowSpraysGestures")
		var_10_71:AnimateSequence("ShowSpraysGestures")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowSpraysGestures")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowSpraysGestures")
		end

		var_10_75:AnimateSequence("ShowSpraysGestures")
		var_10_77:AnimateSequence("ShowSpraysGestures")
		var_10_79:AnimateSequence("ShowSpraysGestures")
		var_10_81:AnimateSequence("ShowSpraysGestures")
		var_10_83:AnimateSequence("ShowSpraysGestures")
		var_10_85:AnimateSequence("ShowSpraysGestures")
	end

	var_10_0._sequences.ShowSpraysGestures = var_10_261

	local var_10_262
	local var_10_263 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("HideAll", var_10_263)

	local var_10_264 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("HideAll", var_10_264)

	local var_10_265 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("HideAll", var_10_265)

	local var_10_266 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("HideAll", var_10_266)

	local var_10_267 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("HideAll", var_10_267)

	local var_10_268 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("HideAll", var_10_268)

	local var_10_269 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("HideAll", var_10_269)

	local var_10_270 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("HideAll", var_10_270)

	local var_10_271 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("HideAll", var_10_271)

	local var_10_272 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("HideAll", var_10_272)

	local var_10_273 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("HideAll", var_10_273)

	local var_10_274 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("HideAll", var_10_274)

	local var_10_275 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("HideAll", var_10_275)

	local var_10_276 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("HideAll", var_10_276)

	local var_10_277 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("HideAll", var_10_277)

	local var_10_278 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("HideAll", var_10_278)

	local var_10_279 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("HideAll", var_10_279)

	local var_10_280 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("HideAll", var_10_280)

	local var_10_281 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("HideAll", var_10_281)

	local var_10_282 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("HideAll", var_10_282)

	local var_10_283 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("HideAll", var_10_283)

	local var_10_284 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("HideAll", var_10_284)

	local var_10_285 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("HideAll", var_10_285)

	local var_10_286 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("HideAll", var_10_286)

	local var_10_287 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("HideAll", var_10_287)

	local var_10_288 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("HideAll", var_10_288)

	local var_10_289 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("HideAll", var_10_289)

	local var_10_290 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("HideAll", var_10_290)

	local var_10_291 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("HideAll", var_10_291)

	local var_10_292 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("HideAll", var_10_292)

	local var_10_293 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("HideAll", var_10_293)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_294 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("HideAll", var_10_294)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_295 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("HideAll", var_10_295)
	end

	local var_10_296 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("HideAll", var_10_296)

	local var_10_297 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("HideAll", var_10_297)

	local var_10_298 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("HideAll", var_10_298)

	local var_10_299 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("HideAll", var_10_299)

	local var_10_300 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("HideAll", var_10_300)

	local var_10_301 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("HideAll", var_10_301)

	local function var_10_302()
		var_10_4:AnimateSequence("HideAll")
		var_10_6:AnimateSequence("HideAll")
		var_10_8:AnimateSequence("HideAll")
		var_10_12:AnimateSequence("HideAll")
		var_10_14:AnimateSequence("HideAll")
		var_10_16:AnimateSequence("HideAll")
		var_10_19:AnimateSequence("HideAll")
		var_10_21:AnimateSequence("HideAll")
		var_10_23:AnimateSequence("HideAll")
		var_10_25:AnimateSequence("HideAll")
		var_10_27:AnimateSequence("HideAll")
		var_10_29:AnimateSequence("HideAll")
		var_10_31:AnimateSequence("HideAll")
		var_10_35:AnimateSequence("HideAll")
		var_10_37:AnimateSequence("HideAll")
		var_10_39:AnimateSequence("HideAll")
		var_10_41:AnimateSequence("HideAll")
		var_10_43:AnimateSequence("HideAll")
		var_10_45:AnimateSequence("HideAll")
		var_10_47:AnimateSequence("HideAll")
		var_10_49:AnimateSequence("HideAll")
		var_10_51:AnimateSequence("HideAll")
		var_10_55:AnimateSequence("HideAll")
		var_10_57:AnimateSequence("HideAll")
		var_10_59:AnimateSequence("HideAll")
		var_10_61:AnimateSequence("HideAll")
		var_10_63:AnimateSequence("HideAll")
		var_10_65:AnimateSequence("HideAll")
		var_10_67:AnimateSequence("HideAll")
		var_10_69:AnimateSequence("HideAll")
		var_10_71:AnimateSequence("HideAll")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("HideAll")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("HideAll")
		end

		var_10_75:AnimateSequence("HideAll")
		var_10_77:AnimateSequence("HideAll")
		var_10_79:AnimateSequence("HideAll")
		var_10_81:AnimateSequence("HideAll")
		var_10_83:AnimateSequence("HideAll")
		var_10_85:AnimateSequence("HideAll")
	end

	var_10_0._sequences.HideAll = var_10_302

	local var_10_303
	local var_10_304 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 300
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 394
		}
	}

	var_10_21:RegisterAnimationSequence("CH", var_10_304)

	local function var_10_305()
		var_10_21:AnimateSequence("CH")
	end

	var_10_0._sequences.CH = var_10_305

	local var_10_306
	local var_10_307 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("REGIMENTS/USE_REGIMENT_CLAN_TAG")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 602
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 967
		}
	}

	var_10_67:RegisterAnimationSequence("CustomClanTagEquipped", var_10_307)

	local var_10_308 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		}
	}

	var_10_75:RegisterAnimationSequence("CustomClanTagEquipped", var_10_308)

	local function var_10_309()
		var_10_67:AnimateSequence("CustomClanTagEquipped")
		var_10_75:AnimateSequence("CustomClanTagEquipped")
	end

	var_10_0._sequences.CustomClanTagEquipped = var_10_309

	local var_10_310
	local var_10_311 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_311)

	local var_10_312 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_312)

	local var_10_313 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_313)

	local var_10_314 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_314)

	local var_10_315 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_315)

	local var_10_316 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_316)

	local var_10_317 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_317)

	local var_10_318 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_318)

	local var_10_319 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_319)

	local var_10_320 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("REGIMENTS/USE_CUSTOM_CLAN_TAG")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 365
		}
	}

	var_10_67:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_320)

	local var_10_321 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 497
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 633
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("OfficialClanTagEquipped", var_10_321)

	local function var_10_322()
		var_10_8:AnimateSequence("OfficialClanTagEquipped")
		var_10_16:AnimateSequence("OfficialClanTagEquipped")
		var_10_27:AnimateSequence("OfficialClanTagEquipped")
		var_10_39:AnimateSequence("OfficialClanTagEquipped")
		var_10_41:AnimateSequence("OfficialClanTagEquipped")
		var_10_43:AnimateSequence("OfficialClanTagEquipped")
		var_10_45:AnimateSequence("OfficialClanTagEquipped")
		var_10_49:AnimateSequence("OfficialClanTagEquipped")
		var_10_51:AnimateSequence("OfficialClanTagEquipped")
		var_10_67:AnimateSequence("OfficialClanTagEquipped")
		var_10_75:AnimateSequence("OfficialClanTagEquipped")
	end

	var_10_0._sequences.OfficialClanTagEquipped = var_10_322

	local var_10_323
	local var_10_324 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowOfficialClanTag", var_10_324)

	local var_10_325 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowOfficialClanTag", var_10_325)

	local var_10_326 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowOfficialClanTag", var_10_326)

	local var_10_327 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowOfficialClanTag", var_10_327)

	local var_10_328 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowOfficialClanTag", var_10_328)

	local var_10_329 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowOfficialClanTag", var_10_329)

	local var_10_330 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowOfficialClanTag", var_10_330)

	local var_10_331 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowOfficialClanTag", var_10_331)

	local var_10_332 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowOfficialClanTag", var_10_332)

	local var_10_333 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowOfficialClanTag", var_10_333)

	local var_10_334 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowOfficialClanTag", var_10_334)

	local var_10_335 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowOfficialClanTag", var_10_335)

	local var_10_336 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowOfficialClanTag", var_10_336)

	local var_10_337 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowOfficialClanTag", var_10_337)

	local var_10_338 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowOfficialClanTag", var_10_338)

	local var_10_339 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowOfficialClanTag", var_10_339)

	local var_10_340 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowOfficialClanTag", var_10_340)

	local var_10_341 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowOfficialClanTag", var_10_341)

	local var_10_342 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowOfficialClanTag", var_10_342)

	local var_10_343 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowOfficialClanTag", var_10_343)

	local var_10_344 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowOfficialClanTag", var_10_344)

	local var_10_345 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowOfficialClanTag", var_10_345)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_346 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowOfficialClanTag", var_10_346)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_347 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowOfficialClanTag", var_10_347)
	end

	local var_10_348 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowOfficialClanTag", var_10_348)

	local function var_10_349()
		var_10_6:AnimateSequence("ShowOfficialClanTag")
		var_10_8:AnimateSequence("ShowOfficialClanTag")
		var_10_10:AnimateSequence("ShowOfficialClanTag")
		var_10_16:AnimateSequence("ShowOfficialClanTag")
		var_10_21:AnimateSequence("ShowOfficialClanTag")
		var_10_27:AnimateSequence("ShowOfficialClanTag")
		var_10_29:AnimateSequence("ShowOfficialClanTag")
		var_10_31:AnimateSequence("ShowOfficialClanTag")
		var_10_33:AnimateSequence("ShowOfficialClanTag")
		var_10_39:AnimateSequence("ShowOfficialClanTag")
		var_10_41:AnimateSequence("ShowOfficialClanTag")
		var_10_43:AnimateSequence("ShowOfficialClanTag")
		var_10_45:AnimateSequence("ShowOfficialClanTag")
		var_10_49:AnimateSequence("ShowOfficialClanTag")
		var_10_51:AnimateSequence("ShowOfficialClanTag")
		var_10_53:AnimateSequence("ShowOfficialClanTag")
		var_10_57:AnimateSequence("ShowOfficialClanTag")
		var_10_61:AnimateSequence("ShowOfficialClanTag")
		var_10_63:AnimateSequence("ShowOfficialClanTag")
		var_10_65:AnimateSequence("ShowOfficialClanTag")
		var_10_69:AnimateSequence("ShowOfficialClanTag")
		var_10_71:AnimateSequence("ShowOfficialClanTag")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowOfficialClanTag")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowOfficialClanTag")
		end

		var_10_75:AnimateSequence("ShowOfficialClanTag")
	end

	var_10_0._sequences.ShowOfficialClanTag = var_10_349

	local var_10_350
	local var_10_351 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowCustomClanTag", var_10_351)

	local var_10_352 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowCustomClanTag", var_10_352)

	local var_10_353 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowCustomClanTag", var_10_353)

	local var_10_354 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowCustomClanTag", var_10_354)

	local var_10_355 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowCustomClanTag", var_10_355)

	local var_10_356 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowCustomClanTag", var_10_356)

	local var_10_357 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowCustomClanTag", var_10_357)

	local var_10_358 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowCustomClanTag", var_10_358)

	local var_10_359 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowCustomClanTag", var_10_359)

	local var_10_360 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowCustomClanTag", var_10_360)

	local var_10_361 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowCustomClanTag", var_10_361)

	local var_10_362 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowCustomClanTag", var_10_362)

	local var_10_363 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowCustomClanTag", var_10_363)

	local var_10_364 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowCustomClanTag", var_10_364)

	local var_10_365 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowCustomClanTag", var_10_365)

	local var_10_366 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowCustomClanTag", var_10_366)

	local var_10_367 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowCustomClanTag", var_10_367)

	local var_10_368 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowCustomClanTag", var_10_368)

	local var_10_369 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowCustomClanTag", var_10_369)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_370 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowCustomClanTag", var_10_370)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_371 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowCustomClanTag", var_10_371)
	end

	local function var_10_372()
		var_10_6:AnimateSequence("ShowCustomClanTag")
		var_10_8:AnimateSequence("ShowCustomClanTag")
		var_10_16:AnimateSequence("ShowCustomClanTag")
		var_10_21:AnimateSequence("ShowCustomClanTag")
		var_10_27:AnimateSequence("ShowCustomClanTag")
		var_10_29:AnimateSequence("ShowCustomClanTag")
		var_10_39:AnimateSequence("ShowCustomClanTag")
		var_10_41:AnimateSequence("ShowCustomClanTag")
		var_10_43:AnimateSequence("ShowCustomClanTag")
		var_10_45:AnimateSequence("ShowCustomClanTag")
		var_10_49:AnimateSequence("ShowCustomClanTag")
		var_10_51:AnimateSequence("ShowCustomClanTag")
		var_10_53:AnimateSequence("ShowCustomClanTag")
		var_10_57:AnimateSequence("ShowCustomClanTag")
		var_10_61:AnimateSequence("ShowCustomClanTag")
		var_10_63:AnimateSequence("ShowCustomClanTag")
		var_10_65:AnimateSequence("ShowCustomClanTag")
		var_10_69:AnimateSequence("ShowCustomClanTag")
		var_10_71:AnimateSequence("ShowCustomClanTag")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowCustomClanTag")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowCustomClanTag")
		end
	end

	var_10_0._sequences.ShowCustomClanTag = var_10_372

	local var_10_373
	local var_10_374 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_374)

	local var_10_375 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_375)

	local var_10_376 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_376)

	local var_10_377 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_377)

	local var_10_378 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_378)

	local var_10_379 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_379)

	local var_10_380 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_380)

	local var_10_381 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_381)

	local var_10_382 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 539
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 167
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_382)

	local var_10_383 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_383)

	local var_10_384 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_384)

	local var_10_385 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_385)

	local var_10_386 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_386)

	local var_10_387 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_387)

	local var_10_388 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_388)

	local var_10_389 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_389)

	local var_10_390 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_390)

	local var_10_391 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_391)

	local var_10_392 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_392)

	local var_10_393 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_393)

	local var_10_394 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_394)

	local var_10_395 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_395)

	local var_10_396 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_396)

	local var_10_397 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_397)

	local var_10_398 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_398)

	local var_10_399 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_399)

	local var_10_400 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG"),
			child = var_10_0.ClanTagTitle.Text
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_400)

	local var_10_401 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_401)

	local var_10_402 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 602
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_402)

	local var_10_403 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 618
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 167
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_403)

	local var_10_404 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 602
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_404)

	local var_10_405 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_405)

	local var_10_406 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_406)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_407 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_407)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_408 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_408)
	end

	local var_10_409 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_10_409)

	local function var_10_410()
		var_10_4:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_6:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_8:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_10:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_12:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_14:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_16:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_19:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_21:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_23:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_25:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_27:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_29:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_31:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_33:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_35:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_37:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_39:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_41:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_43:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_45:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_47:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_49:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_51:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_53:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_55:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_57:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_59:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_61:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_63:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_65:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_69:AnimateSequence("ShowCustomClanTagTopLeft")
		var_10_71:AnimateSequence("ShowCustomClanTagTopLeft")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowCustomClanTagTopLeft")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowCustomClanTagTopLeft")
		end

		var_10_75:AnimateSequence("ShowCustomClanTagTopLeft")
	end

	var_10_0._sequences.ShowCustomClanTagTopLeft = var_10_410

	local var_10_411
	local var_10_412 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowAll", var_10_412)

	local var_10_413 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowAll", var_10_413)

	local var_10_414 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowAll", var_10_414)

	local var_10_415 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowAll", var_10_415)

	local var_10_416 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowAll", var_10_416)

	local var_10_417 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowAll", var_10_417)

	local var_10_418 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowAll", var_10_418)

	local var_10_419 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowAll", var_10_419)

	local var_10_420 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowAll", var_10_420)

	local var_10_421 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowAll", var_10_421)

	local var_10_422 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowAll", var_10_422)

	local var_10_423 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowAll", var_10_423)

	local var_10_424 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowAll", var_10_424)

	local var_10_425 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowAll", var_10_425)

	local var_10_426 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowAll", var_10_426)

	local var_10_427 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 976
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 178
		}
	}

	var_10_41:RegisterAnimationSequence("ShowAll", var_10_427)

	local var_10_428 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 515
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 976
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowAll", var_10_428)

	local var_10_429 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowAll", var_10_429)

	local var_10_430 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 447
		}
	}

	var_10_47:RegisterAnimationSequence("ShowAll", var_10_430)

	local var_10_431 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowAll", var_10_431)

	local var_10_432 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowAll", var_10_432)

	local var_10_433 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowAll", var_10_433)

	local var_10_434 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowAll", var_10_434)

	local var_10_435 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowAll", var_10_435)

	local var_10_436 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowAll", var_10_436)

	local var_10_437 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowAll", var_10_437)

	local var_10_438 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowAll", var_10_438)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_439 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowAll", var_10_439)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_440 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowAll", var_10_440)
	end

	local var_10_441 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowAll", var_10_441)

	local var_10_442 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowAll", var_10_442)

	local var_10_443 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1294
		}
	}

	var_10_81:RegisterAnimationSequence("ShowAll", var_10_443)

	local var_10_444 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowAll", var_10_444)

	local var_10_445 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowAll", var_10_445)

	local function var_10_446()
		var_10_4:AnimateSequence("ShowAll")
		var_10_6:AnimateSequence("ShowAll")
		var_10_8:AnimateSequence("ShowAll")
		var_10_12:AnimateSequence("ShowAll")
		var_10_14:AnimateSequence("ShowAll")
		var_10_16:AnimateSequence("ShowAll")
		var_10_19:AnimateSequence("ShowAll")
		var_10_21:AnimateSequence("ShowAll")
		var_10_23:AnimateSequence("ShowAll")
		var_10_25:AnimateSequence("ShowAll")
		var_10_27:AnimateSequence("ShowAll")
		var_10_29:AnimateSequence("ShowAll")
		var_10_31:AnimateSequence("ShowAll")
		var_10_35:AnimateSequence("ShowAll")
		var_10_37:AnimateSequence("ShowAll")
		var_10_41:AnimateSequence("ShowAll")
		var_10_43:AnimateSequence("ShowAll")
		var_10_45:AnimateSequence("ShowAll")
		var_10_47:AnimateSequence("ShowAll")
		var_10_49:AnimateSequence("ShowAll")
		var_10_51:AnimateSequence("ShowAll")
		var_10_55:AnimateSequence("ShowAll")
		var_10_57:AnimateSequence("ShowAll")
		var_10_59:AnimateSequence("ShowAll")
		var_10_61:AnimateSequence("ShowAll")
		var_10_69:AnimateSequence("ShowAll")
		var_10_71:AnimateSequence("ShowAll")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowAll")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowAll")
		end

		var_10_77:AnimateSequence("ShowAll")
		var_10_79:AnimateSequence("ShowAll")
		var_10_81:AnimateSequence("ShowAll")
		var_10_83:AnimateSequence("ShowAll")
		var_10_85:AnimateSequence("ShowAll")
	end

	var_10_0._sequences.ShowAll = var_10_446

	local var_10_447
	local var_10_448 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowFrame", var_10_448)

	local var_10_449 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowFrame", var_10_449)

	local var_10_450 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowFrame", var_10_450)

	local var_10_451 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_10_10:RegisterAnimationSequence("ShowFrame", var_10_451)

	local var_10_452 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 221
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowFrame", var_10_452)

	local var_10_453 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowFrame", var_10_453)

	local var_10_454 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowFrame", var_10_454)

	local var_10_455 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowFrame", var_10_455)

	local var_10_456 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowFrame", var_10_456)

	local var_10_457 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 180
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 210
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowFrame", var_10_457)

	local var_10_458 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowFrame", var_10_458)

	local var_10_459 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowFrame", var_10_459)

	local var_10_460 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowFrame", var_10_460)

	local var_10_461 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		}
	}

	var_10_31:RegisterAnimationSequence("ShowFrame", var_10_461)

	local var_10_462 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 205
		}
	}

	var_10_33:RegisterAnimationSequence("ShowFrame", var_10_462)

	local var_10_463 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowFrame", var_10_463)

	local var_10_464 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowFrame", var_10_464)

	local var_10_465 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowFrame", var_10_465)

	local var_10_466 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowFrame", var_10_466)

	local var_10_467 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowFrame", var_10_467)

	local var_10_468 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowFrame", var_10_468)

	local var_10_469 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowFrame", var_10_469)

	local var_10_470 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/PLAYERTITLE"),
			child = var_10_0.PlayerTitleTitle.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowFrame", var_10_470)

	local var_10_471 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowFrame", var_10_471)

	local var_10_472 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/CALLINGCARDFRAME"),
			child = var_10_0.FrameTitle.Text
		}
	}

	var_10_53:RegisterAnimationSequence("ShowFrame", var_10_472)

	local var_10_473 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowFrame", var_10_473)

	local var_10_474 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowFrame", var_10_474)

	local var_10_475 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowFrame", var_10_475)

	local var_10_476 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowFrame", var_10_476)

	local var_10_477 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowFrame", var_10_477)

	local var_10_478 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowFrame", var_10_478)

	local var_10_479 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowFrame", var_10_479)

	local var_10_480 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowFrame", var_10_480)

	local var_10_481 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowFrame", var_10_481)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_482 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowFrame", var_10_482)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_483 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -304
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 216
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_10_73:RegisterAnimationSequence("ShowFrame", var_10_483)
	end

	local var_10_484 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 408
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 544
		}
	}

	var_10_75:RegisterAnimationSequence("ShowFrame", var_10_484)

	local var_10_485 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowFrame", var_10_485)

	local var_10_486 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowFrame", var_10_486)

	local var_10_487 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowFrame", var_10_487)

	local var_10_488 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowFrame", var_10_488)

	local var_10_489 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowFrame", var_10_489)

	local function var_10_490()
		var_10_4:AnimateSequence("ShowFrame")
		var_10_6:AnimateSequence("ShowFrame")
		var_10_8:AnimateSequence("ShowFrame")
		var_10_10:AnimateSequence("ShowFrame")
		var_10_12:AnimateSequence("ShowFrame")
		var_10_14:AnimateSequence("ShowFrame")
		var_10_16:AnimateSequence("ShowFrame")
		var_10_19:AnimateSequence("ShowFrame")
		var_10_21:AnimateSequence("ShowFrame")
		var_10_23:AnimateSequence("ShowFrame")
		var_10_25:AnimateSequence("ShowFrame")
		var_10_27:AnimateSequence("ShowFrame")
		var_10_29:AnimateSequence("ShowFrame")
		var_10_31:AnimateSequence("ShowFrame")
		var_10_33:AnimateSequence("ShowFrame")
		var_10_35:AnimateSequence("ShowFrame")
		var_10_37:AnimateSequence("ShowFrame")
		var_10_39:AnimateSequence("ShowFrame")
		var_10_41:AnimateSequence("ShowFrame")
		var_10_43:AnimateSequence("ShowFrame")
		var_10_45:AnimateSequence("ShowFrame")
		var_10_47:AnimateSequence("ShowFrame")
		var_10_49:AnimateSequence("ShowFrame")
		var_10_51:AnimateSequence("ShowFrame")
		var_10_53:AnimateSequence("ShowFrame")
		var_10_55:AnimateSequence("ShowFrame")
		var_10_57:AnimateSequence("ShowFrame")
		var_10_59:AnimateSequence("ShowFrame")
		var_10_61:AnimateSequence("ShowFrame")
		var_10_63:AnimateSequence("ShowFrame")
		var_10_65:AnimateSequence("ShowFrame")
		var_10_67:AnimateSequence("ShowFrame")
		var_10_69:AnimateSequence("ShowFrame")
		var_10_71:AnimateSequence("ShowFrame")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowFrame")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowFrame")
		end

		var_10_75:AnimateSequence("ShowFrame")
		var_10_77:AnimateSequence("ShowFrame")
		var_10_79:AnimateSequence("ShowFrame")
		var_10_81:AnimateSequence("ShowFrame")
		var_10_83:AnimateSequence("ShowFrame")
		var_10_85:AnimateSequence("ShowFrame")
	end

	var_10_0._sequences.ShowFrame = var_10_490

	local var_10_491
	local var_10_492 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowPlayerTitle", var_10_492)

	local var_10_493 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowPlayerTitle", var_10_493)

	local var_10_494 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowPlayerTitle", var_10_494)

	local var_10_495 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_10_10:RegisterAnimationSequence("ShowPlayerTitle", var_10_495)

	local var_10_496 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 221
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowPlayerTitle", var_10_496)

	local var_10_497 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowPlayerTitle", var_10_497)

	local var_10_498 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowPlayerTitle", var_10_498)

	local var_10_499 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowPlayerTitle", var_10_499)

	local var_10_500 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowPlayerTitle", var_10_500)

	local var_10_501 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 180
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 210
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowPlayerTitle", var_10_501)

	local var_10_502 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowPlayerTitle", var_10_502)

	local var_10_503 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowPlayerTitle", var_10_503)

	local var_10_504 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowPlayerTitle", var_10_504)

	local var_10_505 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		}
	}

	var_10_31:RegisterAnimationSequence("ShowPlayerTitle", var_10_505)

	local var_10_506 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 506
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 149
		}
	}

	var_10_33:RegisterAnimationSequence("ShowPlayerTitle", var_10_506)

	local var_10_507 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowPlayerTitle", var_10_507)

	local var_10_508 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowPlayerTitle", var_10_508)

	local var_10_509 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowPlayerTitle", var_10_509)

	local var_10_510 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 520
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		}
	}

	var_10_41:RegisterAnimationSequence("ShowPlayerTitle", var_10_510)

	local var_10_511 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_10_43:RegisterAnimationSequence("ShowPlayerTitle", var_10_511)

	local var_10_512 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowPlayerTitle", var_10_512)

	local var_10_513 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowPlayerTitle", var_10_513)

	local var_10_514 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/PLAYERTITLE"),
			child = var_10_0.PlayerTitleTitle.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowPlayerTitle", var_10_514)

	local var_10_515 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_51:RegisterAnimationSequence("ShowPlayerTitle", var_10_515)

	local var_10_516 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/CALLINGCARDFRAME"),
			child = var_10_0.FrameTitle.Text
		}
	}

	var_10_53:RegisterAnimationSequence("ShowPlayerTitle", var_10_516)

	local var_10_517 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 555
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowPlayerTitle", var_10_517)

	local var_10_518 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowPlayerTitle", var_10_518)

	local var_10_519 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowPlayerTitle", var_10_519)

	local var_10_520 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowPlayerTitle", var_10_520)

	local var_10_521 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowPlayerTitle", var_10_521)

	local var_10_522 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowPlayerTitle", var_10_522)

	local var_10_523 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowPlayerTitle", var_10_523)

	local var_10_524 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowPlayerTitle", var_10_524)

	local var_10_525 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowPlayerTitle", var_10_525)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_526 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowPlayerTitle", var_10_526)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_527 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -304
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 216
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_10_73:RegisterAnimationSequence("ShowPlayerTitle", var_10_527)
	end

	local var_10_528 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 408
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 544
		}
	}

	var_10_75:RegisterAnimationSequence("ShowPlayerTitle", var_10_528)

	local var_10_529 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowPlayerTitle", var_10_529)

	local var_10_530 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowPlayerTitle", var_10_530)

	local var_10_531 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowPlayerTitle", var_10_531)

	local var_10_532 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowPlayerTitle", var_10_532)

	local var_10_533 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowPlayerTitle", var_10_533)

	local function var_10_534()
		var_10_4:AnimateSequence("ShowPlayerTitle")
		var_10_6:AnimateSequence("ShowPlayerTitle")
		var_10_8:AnimateSequence("ShowPlayerTitle")
		var_10_10:AnimateSequence("ShowPlayerTitle")
		var_10_12:AnimateSequence("ShowPlayerTitle")
		var_10_14:AnimateSequence("ShowPlayerTitle")
		var_10_16:AnimateSequence("ShowPlayerTitle")
		var_10_19:AnimateSequence("ShowPlayerTitle")
		var_10_21:AnimateSequence("ShowPlayerTitle")
		var_10_23:AnimateSequence("ShowPlayerTitle")
		var_10_25:AnimateSequence("ShowPlayerTitle")
		var_10_27:AnimateSequence("ShowPlayerTitle")
		var_10_29:AnimateSequence("ShowPlayerTitle")
		var_10_31:AnimateSequence("ShowPlayerTitle")
		var_10_33:AnimateSequence("ShowPlayerTitle")
		var_10_35:AnimateSequence("ShowPlayerTitle")
		var_10_37:AnimateSequence("ShowPlayerTitle")
		var_10_39:AnimateSequence("ShowPlayerTitle")
		var_10_41:AnimateSequence("ShowPlayerTitle")
		var_10_43:AnimateSequence("ShowPlayerTitle")
		var_10_45:AnimateSequence("ShowPlayerTitle")
		var_10_47:AnimateSequence("ShowPlayerTitle")
		var_10_49:AnimateSequence("ShowPlayerTitle")
		var_10_51:AnimateSequence("ShowPlayerTitle")
		var_10_53:AnimateSequence("ShowPlayerTitle")
		var_10_55:AnimateSequence("ShowPlayerTitle")
		var_10_57:AnimateSequence("ShowPlayerTitle")
		var_10_59:AnimateSequence("ShowPlayerTitle")
		var_10_61:AnimateSequence("ShowPlayerTitle")
		var_10_63:AnimateSequence("ShowPlayerTitle")
		var_10_65:AnimateSequence("ShowPlayerTitle")
		var_10_67:AnimateSequence("ShowPlayerTitle")
		var_10_69:AnimateSequence("ShowPlayerTitle")
		var_10_71:AnimateSequence("ShowPlayerTitle")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowPlayerTitle")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowPlayerTitle")
		end

		var_10_75:AnimateSequence("ShowPlayerTitle")
		var_10_77:AnimateSequence("ShowPlayerTitle")
		var_10_79:AnimateSequence("ShowPlayerTitle")
		var_10_81:AnimateSequence("ShowPlayerTitle")
		var_10_83:AnimateSequence("ShowPlayerTitle")
		var_10_85:AnimateSequence("ShowPlayerTitle")
	end

	var_10_0._sequences.ShowPlayerTitle = var_10_534

	local var_10_535
	local var_10_536 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_challenge"),
			child = var_10_0.EmblemBacker.WZWipPromptBackground
		}
	}

	var_10_14:RegisterAnimationSequence("WZWipSetup", var_10_536)

	local function var_10_537()
		var_10_14:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_537

	local var_10_538
	local var_10_539 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1021
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowVehicles", var_10_539)

	local var_10_540 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowVehicles", var_10_540)

	local var_10_541 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowVehicles", var_10_541)

	local var_10_542 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowVehicles", var_10_542)

	local var_10_543 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowVehicles", var_10_543)

	local var_10_544 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowVehicles", var_10_544)

	local var_10_545 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowVehicles", var_10_545)

	local var_10_546 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 981
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowVehicles", var_10_546)

	local var_10_547 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowVehicles", var_10_547)

	local var_10_548 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowVehicles", var_10_548)

	local var_10_549 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowVehicles", var_10_549)

	local var_10_550 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowVehicles", var_10_550)

	local var_10_551 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1072
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 630
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("s4_barracks_preview_veh")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowVehicles", var_10_551)

	local var_10_552 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowVehicles", var_10_552)

	local var_10_553 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowVehicles", var_10_553)

	local var_10_554 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowVehicles", var_10_554)

	local var_10_555 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowVehicles", var_10_555)

	local var_10_556 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowVehicles", var_10_556)

	local var_10_557 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowVehicles", var_10_557)

	local var_10_558 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowVehicles", var_10_558)

	local var_10_559 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowVehicles", var_10_559)

	local var_10_560 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowVehicles", var_10_560)

	local var_10_561 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowVehicles", var_10_561)

	local var_10_562 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION"),
			child = var_10_0.VehicleTitle.Text
		}
	}

	var_10_51:RegisterAnimationSequence("ShowVehicles", var_10_562)

	local var_10_563 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowVehicles", var_10_563)

	local var_10_564 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowVehicles", var_10_564)

	local var_10_565 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowVehicles", var_10_565)

	local var_10_566 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowVehicles", var_10_566)

	local var_10_567 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowVehicles", var_10_567)

	local var_10_568 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowVehicles", var_10_568)

	local var_10_569 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowVehicles", var_10_569)

	local var_10_570 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowVehicles", var_10_570)

	local var_10_571 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowVehicles", var_10_571)

	local var_10_572 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowVehicles", var_10_572)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_573 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowVehicles", var_10_573)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_574 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowVehicles", var_10_574)
	end

	local var_10_575 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowVehicles", var_10_575)

	local var_10_576 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowVehicles", var_10_576)

	local var_10_577 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowVehicles", var_10_577)

	local var_10_578 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowVehicles", var_10_578)

	local var_10_579 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowVehicles", var_10_579)

	local var_10_580 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowVehicles", var_10_580)

	local function var_10_581()
		var_10_4:AnimateSequence("ShowVehicles")
		var_10_6:AnimateSequence("ShowVehicles")
		var_10_8:AnimateSequence("ShowVehicles")
		var_10_10:AnimateSequence("ShowVehicles")
		var_10_12:AnimateSequence("ShowVehicles")
		var_10_14:AnimateSequence("ShowVehicles")
		var_10_16:AnimateSequence("ShowVehicles")
		var_10_19:AnimateSequence("ShowVehicles")
		var_10_21:AnimateSequence("ShowVehicles")
		var_10_23:AnimateSequence("ShowVehicles")
		var_10_25:AnimateSequence("ShowVehicles")
		var_10_27:AnimateSequence("ShowVehicles")
		var_10_29:AnimateSequence("ShowVehicles")
		var_10_31:AnimateSequence("ShowVehicles")
		var_10_33:AnimateSequence("ShowVehicles")
		var_10_35:AnimateSequence("ShowVehicles")
		var_10_37:AnimateSequence("ShowVehicles")
		var_10_39:AnimateSequence("ShowVehicles")
		var_10_41:AnimateSequence("ShowVehicles")
		var_10_43:AnimateSequence("ShowVehicles")
		var_10_45:AnimateSequence("ShowVehicles")
		var_10_47:AnimateSequence("ShowVehicles")
		var_10_49:AnimateSequence("ShowVehicles")
		var_10_51:AnimateSequence("ShowVehicles")
		var_10_53:AnimateSequence("ShowVehicles")
		var_10_55:AnimateSequence("ShowVehicles")
		var_10_57:AnimateSequence("ShowVehicles")
		var_10_59:AnimateSequence("ShowVehicles")
		var_10_61:AnimateSequence("ShowVehicles")
		var_10_63:AnimateSequence("ShowVehicles")
		var_10_65:AnimateSequence("ShowVehicles")
		var_10_67:AnimateSequence("ShowVehicles")
		var_10_69:AnimateSequence("ShowVehicles")
		var_10_71:AnimateSequence("ShowVehicles")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowVehicles")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowVehicles")
		end

		var_10_75:AnimateSequence("ShowVehicles")
		var_10_77:AnimateSequence("ShowVehicles")
		var_10_79:AnimateSequence("ShowVehicles")
		var_10_81:AnimateSequence("ShowVehicles")
		var_10_83:AnimateSequence("ShowVehicles")
		var_10_85:AnimateSequence("ShowVehicles")
	end

	var_10_0._sequences.ShowVehicles = var_10_581

	local var_10_582
	local var_10_583 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1021
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 228
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ShowWatches", var_10_583)

	local var_10_584 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowWatches", var_10_584)

	local var_10_585 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowWatches", var_10_585)

	local var_10_586 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowWatches", var_10_586)

	local var_10_587 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowWatches", var_10_587)

	local var_10_588 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ShowWatches", var_10_588)

	local var_10_589 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ShowWatches", var_10_589)

	local var_10_590 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 981
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowWatches", var_10_590)

	local var_10_591 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ShowWatches", var_10_591)

	local var_10_592 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ShowWatches", var_10_592)

	local var_10_593 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ShowWatches", var_10_593)

	local var_10_594 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_27:RegisterAnimationSequence("ShowWatches", var_10_594)

	local var_10_595 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1072
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 630
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("s4_barracks_preview_watch")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("ShowWatches", var_10_595)

	local var_10_596 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_31:RegisterAnimationSequence("ShowWatches", var_10_596)

	local var_10_597 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("ShowWatches", var_10_597)

	local var_10_598 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_35:RegisterAnimationSequence("ShowWatches", var_10_598)

	local var_10_599 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_37:RegisterAnimationSequence("ShowWatches", var_10_599)

	local var_10_600 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_39:RegisterAnimationSequence("ShowWatches", var_10_600)

	local var_10_601 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_41:RegisterAnimationSequence("ShowWatches", var_10_601)

	local var_10_602 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_43:RegisterAnimationSequence("ShowWatches", var_10_602)

	local var_10_603 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_45:RegisterAnimationSequence("ShowWatches", var_10_603)

	local var_10_604 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_47:RegisterAnimationSequence("ShowWatches", var_10_604)

	local var_10_605 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_49:RegisterAnimationSequence("ShowWatches", var_10_605)

	local var_10_606 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT"),
			child = var_10_0.VehicleTitle.Text
		}
	}

	var_10_51:RegisterAnimationSequence("ShowWatches", var_10_606)

	local var_10_607 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_53:RegisterAnimationSequence("ShowWatches", var_10_607)

	local var_10_608 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_55:RegisterAnimationSequence("ShowWatches", var_10_608)

	local var_10_609 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_57:RegisterAnimationSequence("ShowWatches", var_10_609)

	local var_10_610 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_59:RegisterAnimationSequence("ShowWatches", var_10_610)

	local var_10_611 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_61:RegisterAnimationSequence("ShowWatches", var_10_611)

	local var_10_612 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_63:RegisterAnimationSequence("ShowWatches", var_10_612)

	local var_10_613 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_65:RegisterAnimationSequence("ShowWatches", var_10_613)

	local var_10_614 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_67:RegisterAnimationSequence("ShowWatches", var_10_614)

	local var_10_615 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_69:RegisterAnimationSequence("ShowWatches", var_10_615)

	local var_10_616 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_71:RegisterAnimationSequence("ShowWatches", var_10_616)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_617 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_72:RegisterAnimationSequence("ShowWatches", var_10_617)
	end

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_10_618 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_73:RegisterAnimationSequence("ShowWatches", var_10_618)
	end

	local var_10_619 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_75:RegisterAnimationSequence("ShowWatches", var_10_619)

	local var_10_620 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_77:RegisterAnimationSequence("ShowWatches", var_10_620)

	local var_10_621 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_79:RegisterAnimationSequence("ShowWatches", var_10_621)

	local var_10_622 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_81:RegisterAnimationSequence("ShowWatches", var_10_622)

	local var_10_623 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_83:RegisterAnimationSequence("ShowWatches", var_10_623)

	local var_10_624 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_85:RegisterAnimationSequence("ShowWatches", var_10_624)

	local function var_10_625()
		var_10_4:AnimateSequence("ShowWatches")
		var_10_6:AnimateSequence("ShowWatches")
		var_10_8:AnimateSequence("ShowWatches")
		var_10_10:AnimateSequence("ShowWatches")
		var_10_12:AnimateSequence("ShowWatches")
		var_10_14:AnimateSequence("ShowWatches")
		var_10_16:AnimateSequence("ShowWatches")
		var_10_19:AnimateSequence("ShowWatches")
		var_10_21:AnimateSequence("ShowWatches")
		var_10_23:AnimateSequence("ShowWatches")
		var_10_25:AnimateSequence("ShowWatches")
		var_10_27:AnimateSequence("ShowWatches")
		var_10_29:AnimateSequence("ShowWatches")
		var_10_31:AnimateSequence("ShowWatches")
		var_10_33:AnimateSequence("ShowWatches")
		var_10_35:AnimateSequence("ShowWatches")
		var_10_37:AnimateSequence("ShowWatches")
		var_10_39:AnimateSequence("ShowWatches")
		var_10_41:AnimateSequence("ShowWatches")
		var_10_43:AnimateSequence("ShowWatches")
		var_10_45:AnimateSequence("ShowWatches")
		var_10_47:AnimateSequence("ShowWatches")
		var_10_49:AnimateSequence("ShowWatches")
		var_10_51:AnimateSequence("ShowWatches")
		var_10_53:AnimateSequence("ShowWatches")
		var_10_55:AnimateSequence("ShowWatches")
		var_10_57:AnimateSequence("ShowWatches")
		var_10_59:AnimateSequence("ShowWatches")
		var_10_61:AnimateSequence("ShowWatches")
		var_10_63:AnimateSequence("ShowWatches")
		var_10_65:AnimateSequence("ShowWatches")
		var_10_67:AnimateSequence("ShowWatches")
		var_10_69:AnimateSequence("ShowWatches")
		var_10_71:AnimateSequence("ShowWatches")

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_72:AnimateSequence("ShowWatches")
		end

		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_10_73:AnimateSequence("ShowWatches")
		end

		var_10_75:AnimateSequence("ShowWatches")
		var_10_77:AnimateSequence("ShowWatches")
		var_10_79:AnimateSequence("ShowWatches")
		var_10_81:AnimateSequence("ShowWatches")
		var_10_83:AnimateSequence("ShowWatches")
		var_10_85:AnimateSequence("ShowWatches")
	end

	var_10_0._sequences.ShowWatches = var_10_625

	var_0_5(var_10_0, var_10_1, arg_10_1)
	ACTIONS.AnimateSequence(var_10_0, "DefaultSequence")

	return var_10_0
end

MenuBuilder.registerType("BarracksCustomizeSummary", BarracksCustomizeSummary)
LockTable(_M)
