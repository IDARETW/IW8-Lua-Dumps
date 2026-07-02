module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:GetCurrentAnchorsAndPositions().right
	local var_1_1 = 8 * _1080p

	arg_1_0.EquippedWidget:SetRight(var_1_0 - var_1_1)
	arg_1_0.EquippedWidget:SetLeft(var_1_0 - arg_1_0._tagWidth - var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._customClanTag and #arg_2_0._customClanTag > 0 then
		ACTIONS.AnimateSequence(arg_2_0, "CustomClanTagEquipped")

		if ToUpperCase(arg_2_0._customClanTag) == "IW" then
			arg_2_0.ClanTag:setText("[^1" .. arg_2_0._customClanTag .. "^7]")
		else
			arg_2_0.ClanTag:setText("[" .. arg_2_0._customClanTag .. "]")
		end

		if not CONDITIONS.IsSystemLink(arg_2_0) then
			arg_2_0.EquippedWidget:SetAlpha(1)
		end

		var_0_0(arg_2_0, arg_2_0.ClanTagBacker)
	else
		arg_2_0.ClanTag:setText("")
		arg_2_0.EquippedWidget:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1 == ClanTagType.CUSTOM then
		ACTIONS.AnimateSequence(arg_3_0, "CustomClanTagEquipped")

		if arg_3_0._customClanTag == nil or #arg_3_0._customClanTag == 0 then
			arg_3_0.EquippedWidget:SetAlpha(0)
		else
			arg_3_0.EquippedWidget:SetAlpha(1)
		end

		var_0_0(arg_3_0, arg_3_0.ClanTagBacker)
	elseif arg_3_1 == ClanTagType.OFFICIAL then
		ACTIONS.AnimateSequence(arg_3_0, "OfficialClanTagEquipped")

		if arg_3_0._activeClanID == nil or arg_3_0._activeClanID == -1 then
			arg_3_0.EquippedWidget:SetAlpha(0)
		else
			arg_3_0.EquippedWidget:SetAlpha(1)
		end

		var_0_0(arg_3_0, arg_3_0.OfficialClanTagBacker)
	end

	arg_3_0:dispatchEventToParent({
		name = "update_clan_tag_type",
		clanTagType = arg_3_1
	})
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_0.Emblem)
	assert(arg_4_0.EmblemName)
	assert(arg_4_0.CallingCard)
	assert(arg_4_0.CallingCardName)
	assert(arg_4_0.ClanTag)
	assert(arg_4_0.RadialLoadoutGrid)

	local var_4_0 = PlayerData.BFFBGAJGD(arg_4_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_4_1 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
	local var_4_2 = LUI.DataSourceInControllerModel.new(var_4_1 .. ".emblemIndex")
	local var_4_3 = LUI.DataSourceInControllerModel.new(var_4_1 .. ".backgroundIndex")
	local var_4_4 = var_4_2:GetValue(arg_4_1) or 0
	local var_4_5 = var_4_3:GetValue(arg_4_1) or 0

	DebugPrint(string.format("Player card : emblemIndex [%i] backgroundIndex [%i] controllerIndex [%i] emblemID [%i] playerCardID [%i]", var_4_2:GetValue(arg_4_1) or -1, var_4_3:GetValue(arg_4_1) or -1, arg_4_1, var_4_4, var_4_5))

	local var_4_6 = EmblemEditorUtils.GetEmblemImageFromID(var_4_4)
	local var_4_7 = EmblemEditorUtils.GetEmblemNameFromID(var_4_4)
	local var_4_8 = CallingCardUtils.GetCardTexture(var_4_5)
	local var_4_9 = CallingCardUtils.GetCardNameFromID(var_4_5)
	local var_4_10 = var_4_0.radial

	if var_4_6 ~= "" then
		arg_4_0.Emblem:setImage(RegisterMaterial(var_4_6))
	else
		arg_4_0.Emblem:SetAlpha(0)
	end

	arg_4_0.EmblemName:setText(Engine.CBBHFCGDIC(var_4_7))

	if var_4_8 ~= "" then
		arg_4_0.CallingCard:setImage(RegisterMaterial(var_4_8))
	else
		arg_4_0.CallingCard:SetAlpha(0)
	end

	arg_4_0.CallingCardName:setText(Engine.CBBHFCGDIC(var_4_9))

	if Engine.BAHCIEEBFD(arg_4_1) then
		local var_4_11 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Common, CoD.PlayMode.Core)

		if var_4_11 ~= nil then
			local var_4_12 = var_4_11.clanTag

			arg_4_0:SubscribeToModel(var_4_12:GetModel(arg_4_1), function()
				arg_4_0._customClanTag = var_4_12:GetValue(arg_4_1)

				var_0_1(arg_4_0, arg_4_1)
			end)

			local var_4_13 = var_4_11.clanTagType
			local var_4_14 = var_4_13:GetValue(arg_4_1)

			ACTIONS.AnimateSequence(arg_4_0, var_4_14 == ClanTagType.OFFICIAL and "ShowOfficialClanTag" or "ShowCustomClanTag")
			var_0_2(arg_4_0, var_4_14)
			arg_4_0:SubscribeToModel(var_4_13:GetModel(arg_4_1), function()
				local var_6_0 = var_4_13:GetValue(arg_4_1)

				var_0_2(arg_4_0, var_6_0)
			end)
		end
	end

	arg_4_0._activeClanID = Clans.CFGBBBHFHB(arg_4_1)

	if arg_4_0._activeClanID and arg_4_0._activeClanID ~= 1 then
		local var_4_15 = Clans.GFFJCJFIJ(arg_4_1, arg_4_0._activeClanID).clanTag

		if var_4_15 and var_4_15 ~= "" then
			arg_4_0.OfficialClanTag:setText("[^3" .. var_4_15 .. "^7]")
		else
			arg_4_0.OfficialClanTag:setText("")
		end
	end

	local var_4_16 = {}

	for iter_4_0 = 0, #var_4_10 - 1 do
		local var_4_17 = var_4_10[iter_4_0]:get()

		if var_4_17 > LOOT.emptyID then
			local var_4_18 = LOOT.GetTypeForID(var_4_17)
			local var_4_19 = LOOT.GetItemRef(var_4_18, var_4_17)
			local var_4_20 = LOOT.GetItemImage(var_4_18, var_4_19)

			if var_4_20 and var_4_20 ~= "" then
				table.insert(var_4_16, var_4_20)
			end
		end
	end

	arg_4_0.RadialLoadoutGrid:RemoveFocusFromChild()
	arg_4_0.RadialLoadoutGrid:SetNumChildren(#var_4_16)
	arg_4_0.RadialLoadoutGrid:SetRefreshChild(function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_7_1 + arg_7_2 * arg_4_0.RadialLoadoutGrid:GetNumColumns()

		arg_7_0.Image:setImage(RegisterMaterial(var_4_16[var_7_0 + 1]))
	end)
	arg_4_0.RadialLoadoutGrid:RefreshContent()

	if IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_4_0, "CH")
	end
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.SetData = var_0_3
	arg_8_0.UpdateClanTagType = var_0_2
	arg_8_0._tagWidth = arg_8_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	var_0_3(arg_8_0, arg_8_1)
end

function BarracksCustomizeSummary(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 659 * _1080p)

	var_9_0.id = "BarracksCustomizeSummary"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "RadialBacker"

	var_9_4:SetAlpha(0.5, 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1021, _1080p * 431, _1080p * 659)
	var_9_0:addElement(var_9_4)

	var_9_0.RadialBacker = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "ClanTagBacker"

	var_9_6:SetAlpha(0.5, 0)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 413)
	var_9_0:addElement(var_9_6)

	var_9_0.ClanTagBacker = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "CallingCardBacker"

	var_9_8:SetAlpha(0.5, 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, 0, _1080p * 221)
	var_9_0:addElement(var_9_8)

	var_9_0.CallingCardBacker = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "EmblemBacker"

	var_9_10:SetAlpha(0.5, 0)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 447, 0, _1080p * 413)
	var_9_0:addElement(var_9_10)

	var_9_0.EmblemBacker = var_9_10

	local var_9_11
	local var_9_12 = {
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
		controllerIndex = var_9_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RadialCustomizationItemPreview", {
				controllerIndex = var_9_1
			})
		end,
		refreshChild = function(arg_11_0, arg_11_1, arg_11_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 100,
		rowHeight = _1080p * 100,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_9_13 = LUI.UIGrid.new(var_9_12)

	var_9_13.id = "RadialLoadoutGrid"

	var_9_13:setUseStencil(true)
	var_9_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 41, _1080p * 981, _1080p * 511, _1080p * 732)
	var_9_0:addElement(var_9_13)

	var_9_0.RadialLoadoutGrid = var_9_13

	local var_9_14
	local var_9_15 = LUI.UIText.new()

	var_9_15.id = "ClanTag"

	var_9_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_15:setText("", 0)
	var_9_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_15:SetWordWrap(false)
	var_9_15:SetAlignment(LUI.Alignment.Center)
	var_9_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 482, _1080p * 1005, _1080p * 287, _1080p * 407)
	var_9_0:addElement(var_9_15)

	var_9_0.ClanTag = var_9_15

	local var_9_16
	local var_9_17 = LUI.UIStyledText.new()

	var_9_17.id = "CallingCardName"

	var_9_17:SetRGBFromTable(SWATCHES.Scoreboard.grayText, 0)
	var_9_17:setText(ToUpperCase(""), 0)
	var_9_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_17:SetWordWrap(false)
	var_9_17:SetAlignment(LUI.Alignment.Center)
	var_9_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_17:SetStartupDelay(2000)
	var_9_17:SetLineHoldTime(400)
	var_9_17:SetAnimMoveTime(2000)
	var_9_17:SetAnimMoveSpeed(150)
	var_9_17:SetEndDelay(2000)
	var_9_17:SetCrossfadeTime(250)
	var_9_17:SetFadeInTime(300)
	var_9_17:SetFadeOutTime(300)
	var_9_17:SetMaxVisibleLines(1)
	var_9_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 976, _1080p * 180, _1080p * 210)
	var_9_0:addElement(var_9_17)

	var_9_0.CallingCardName = var_9_17

	local var_9_18
	local var_9_19 = LUI.UIImage.new()

	var_9_19.id = "CallingCard"

	var_9_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 511, _1080p * 976, _1080p * 60, _1080p * 178)
	var_9_0:addElement(var_9_19)

	var_9_0.CallingCard = var_9_19

	local var_9_20
	local var_9_21 = LUI.UIStyledText.new()

	var_9_21.id = "EmblemName"

	var_9_21:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_9_21:setText(ToUpperCase(""), 0)
	var_9_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_21:SetAlignment(LUI.Alignment.Center)
	var_9_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_21:SetStartupDelay(1000)
	var_9_21:SetLineHoldTime(400)
	var_9_21:SetAnimMoveTime(150)
	var_9_21:SetAnimMoveSpeed(50)
	var_9_21:SetEndDelay(1000)
	var_9_21:SetCrossfadeTime(400)
	var_9_21:SetFadeInTime(300)
	var_9_21:SetFadeOutTime(300)
	var_9_21:SetMaxVisibleLines(1)
	var_9_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 31, _1080p * 417, _1080p * 368, _1080p * 398)
	var_9_0:addElement(var_9_21)

	var_9_0.EmblemName = var_9_21

	local var_9_22
	local var_9_23 = LUI.UIImage.new()

	var_9_23.id = "Emblem"

	var_9_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 74, _1080p * 374, _1080p * 60, _1080p * 360)
	var_9_0:addElement(var_9_23)

	var_9_0.Emblem = var_9_23

	local var_9_24
	local var_9_25 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_25.id = "EmblemTitle"

	var_9_25.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EMBLEM"), 0)
	var_9_25:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 382, 0, _1080p * 47)
	var_9_0:addElement(var_9_25)

	var_9_0.EmblemTitle = var_9_25

	local var_9_26
	local var_9_27 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_27.id = "CallingCardTitle"

	var_9_27.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CALLING_CARD"), 0)
	var_9_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, 0, _1080p * 47)
	var_9_0:addElement(var_9_27)

	var_9_0.CallingCardTitle = var_9_27

	local var_9_28
	local var_9_29 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_29.id = "ClanTagTitle"

	var_9_29.Text:setText(Engine.CBBHFCGDIC("REGIMENTS/CUSTOM_CLAN_TAG"), 0)
	var_9_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 287)
	var_9_0:addElement(var_9_29)

	var_9_0.ClanTagTitle = var_9_29

	local var_9_30
	local var_9_31 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_31.id = "SpraysAndGesturesTitle"

	var_9_31.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION"), 0)
	var_9_31:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1021, _1080p * 432, _1080p * 479)
	var_9_0:addElement(var_9_31)

	var_9_0.SpraysAndGesturesTitle = var_9_31

	local var_9_32
	local var_9_33 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_33.id = "OfficialClanTagBacker"

	var_9_33:SetAlpha(0, 0)
	var_9_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 413)
	var_9_0:addElement(var_9_33)

	var_9_0.OfficialClanTagBacker = var_9_33

	local var_9_34
	local var_9_35 = LUI.UIText.new()

	var_9_35.id = "OfficialClanTag"

	var_9_35:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_35:SetAlpha(0, 0)
	var_9_35:setText("", 0)
	var_9_35:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_35:SetWordWrap(false)
	var_9_35:SetAlignment(LUI.Alignment.Center)
	var_9_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 482, _1080p * 1021, _1080p * 287, _1080p * 407)
	var_9_0:addElement(var_9_35)

	var_9_0.OfficialClanTag = var_9_35

	local var_9_36
	local var_9_37 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_37.id = "OfficialClanTagTitle"

	var_9_37:SetAlpha(0, 0)
	var_9_37.Text:setText(Engine.CBBHFCGDIC("REGIMENTS/REGIMENT_CLAN_TAG"), 0)
	var_9_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 1021, _1080p * 240, _1080p * 287)
	var_9_0:addElement(var_9_37)

	var_9_0.OfficialClanTagTitle = var_9_37

	local var_9_38
	local var_9_39 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_9_1
	})

	var_9_39.id = "EquippedWidget"

	var_9_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 419, _1080p * 555, _1080p * 8, _1080p * 38)
	var_9_0:addElement(var_9_39)

	var_9_0.EquippedWidget = var_9_39

	local var_9_40
	local var_9_41 = LUI.UIText.new()

	var_9_41.id = "SwitchClanTagPrompt"

	var_9_41:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_41:SetAlpha(0, 0)
	var_9_41:setText(Engine.CBBHFCGDIC("REGIMENTS/USE_REGIMENT_CLAN_TAG"), 0)
	var_9_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_41:SetAlignment(LUI.Alignment.Left)
	var_9_41:SetTintFontIcons(true)
	var_9_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 382, _1080p * 186, _1080p * 206)
	var_9_0:addElement(var_9_41)

	var_9_0.SwitchClanTagPrompt = var_9_41

	local var_9_42
	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_39:RegisterAnimationSequence("DefaultSequence", var_9_43)

	local function var_9_44()
		var_9_39:AnimateSequence("DefaultSequence")
	end

	var_9_0._sequences.DefaultSequence = var_9_44

	local var_9_45
	local var_9_46 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ShowEmblem", var_9_46)

	local var_9_47 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("ShowEmblem", var_9_47)

	local var_9_48 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ShowEmblem", var_9_48)

	local var_9_49 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ShowEmblem", var_9_49)

	local var_9_50 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("ShowEmblem", var_9_50)

	local var_9_51 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("ShowEmblem", var_9_51)

	local var_9_52 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("ShowEmblem", var_9_52)

	local var_9_53 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("ShowEmblem", var_9_53)

	local var_9_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("ShowEmblem", var_9_54)

	local var_9_55 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_23:RegisterAnimationSequence("ShowEmblem", var_9_55)

	local var_9_56 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ShowEmblem", var_9_56)

	local var_9_57 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_27:RegisterAnimationSequence("ShowEmblem", var_9_57)

	local var_9_58 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowEmblem", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_31:RegisterAnimationSequence("ShowEmblem", var_9_59)

	local var_9_60 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("ShowEmblem", var_9_60)

	local var_9_61 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("ShowEmblem", var_9_61)

	local var_9_62 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("ShowEmblem", var_9_62)

	local var_9_63 = {
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

	var_9_39:RegisterAnimationSequence("ShowEmblem", var_9_63)

	local var_9_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_41:RegisterAnimationSequence("ShowEmblem", var_9_64)

	local function var_9_65()
		var_9_4:AnimateSequence("ShowEmblem")
		var_9_6:AnimateSequence("ShowEmblem")
		var_9_8:AnimateSequence("ShowEmblem")
		var_9_10:AnimateSequence("ShowEmblem")
		var_9_13:AnimateSequence("ShowEmblem")
		var_9_15:AnimateSequence("ShowEmblem")
		var_9_17:AnimateSequence("ShowEmblem")
		var_9_19:AnimateSequence("ShowEmblem")
		var_9_21:AnimateSequence("ShowEmblem")
		var_9_23:AnimateSequence("ShowEmblem")
		var_9_25:AnimateSequence("ShowEmblem")
		var_9_27:AnimateSequence("ShowEmblem")
		var_9_29:AnimateSequence("ShowEmblem")
		var_9_31:AnimateSequence("ShowEmblem")
		var_9_33:AnimateSequence("ShowEmblem")
		var_9_35:AnimateSequence("ShowEmblem")
		var_9_37:AnimateSequence("ShowEmblem")
		var_9_39:AnimateSequence("ShowEmblem")
		var_9_41:AnimateSequence("ShowEmblem")
	end

	var_9_0._sequences.ShowEmblem = var_9_65

	local var_9_66
	local var_9_67 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ShowCallingCard", var_9_67)

	local var_9_68 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("ShowCallingCard", var_9_68)

	local var_9_69 = {
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

	var_9_8:RegisterAnimationSequence("ShowCallingCard", var_9_69)

	local var_9_70 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ShowCallingCard", var_9_70)

	local var_9_71 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("ShowCallingCard", var_9_71)

	local var_9_72 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("ShowCallingCard", var_9_72)

	local var_9_73 = {
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

	var_9_17:RegisterAnimationSequence("ShowCallingCard", var_9_73)

	local var_9_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 496
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("ShowCallingCard", var_9_74)

	local var_9_75 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("ShowCallingCard", var_9_75)

	local var_9_76 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_23:RegisterAnimationSequence("ShowCallingCard", var_9_76)

	local var_9_77 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ShowCallingCard", var_9_77)

	local var_9_78 = {
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

	var_9_27:RegisterAnimationSequence("ShowCallingCard", var_9_78)

	local var_9_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowCallingCard", var_9_79)

	local var_9_80 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_31:RegisterAnimationSequence("ShowCallingCard", var_9_80)

	local var_9_81 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("ShowCallingCard", var_9_81)

	local var_9_82 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("ShowCallingCard", var_9_82)

	local var_9_83 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("ShowCallingCard", var_9_83)

	local var_9_84 = {
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

	var_9_39:RegisterAnimationSequence("ShowCallingCard", var_9_84)

	local var_9_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_41:RegisterAnimationSequence("ShowCallingCard", var_9_85)

	local function var_9_86()
		var_9_4:AnimateSequence("ShowCallingCard")
		var_9_6:AnimateSequence("ShowCallingCard")
		var_9_8:AnimateSequence("ShowCallingCard")
		var_9_10:AnimateSequence("ShowCallingCard")
		var_9_13:AnimateSequence("ShowCallingCard")
		var_9_15:AnimateSequence("ShowCallingCard")
		var_9_17:AnimateSequence("ShowCallingCard")
		var_9_19:AnimateSequence("ShowCallingCard")
		var_9_21:AnimateSequence("ShowCallingCard")
		var_9_23:AnimateSequence("ShowCallingCard")
		var_9_25:AnimateSequence("ShowCallingCard")
		var_9_27:AnimateSequence("ShowCallingCard")
		var_9_29:AnimateSequence("ShowCallingCard")
		var_9_31:AnimateSequence("ShowCallingCard")
		var_9_33:AnimateSequence("ShowCallingCard")
		var_9_35:AnimateSequence("ShowCallingCard")
		var_9_37:AnimateSequence("ShowCallingCard")
		var_9_39:AnimateSequence("ShowCallingCard")
		var_9_41:AnimateSequence("ShowCallingCard")
	end

	var_9_0._sequences.ShowCallingCard = var_9_86

	local var_9_87
	local var_9_88 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ShowClanTags", var_9_88)

	local var_9_89 = {
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

	var_9_6:RegisterAnimationSequence("ShowClanTags", var_9_89)

	local var_9_90 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ShowClanTags", var_9_90)

	local var_9_91 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ShowClanTags", var_9_91)

	local var_9_92 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("ShowClanTags", var_9_92)

	local var_9_93 = {
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

	var_9_15:RegisterAnimationSequence("ShowClanTags", var_9_93)

	local var_9_94 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("ShowClanTags", var_9_94)

	local var_9_95 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("ShowClanTags", var_9_95)

	local var_9_96 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("ShowClanTags", var_9_96)

	local var_9_97 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_23:RegisterAnimationSequence("ShowClanTags", var_9_97)

	local var_9_98 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ShowClanTags", var_9_98)

	local var_9_99 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_27:RegisterAnimationSequence("ShowClanTags", var_9_99)

	local var_9_100 = {
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
			child = var_9_0.ClanTagTitle.Text
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowClanTags", var_9_100)

	local var_9_101 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_31:RegisterAnimationSequence("ShowClanTags", var_9_101)

	local var_9_102 = {
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
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("ShowClanTags", var_9_102)

	local var_9_103 = {
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
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("ShowClanTags", var_9_103)

	local var_9_104 = {
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
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("ShowClanTags", var_9_104)

	local function var_9_105()
		var_9_4:AnimateSequence("ShowClanTags")
		var_9_6:AnimateSequence("ShowClanTags")
		var_9_8:AnimateSequence("ShowClanTags")
		var_9_10:AnimateSequence("ShowClanTags")
		var_9_13:AnimateSequence("ShowClanTags")
		var_9_15:AnimateSequence("ShowClanTags")
		var_9_17:AnimateSequence("ShowClanTags")
		var_9_19:AnimateSequence("ShowClanTags")
		var_9_21:AnimateSequence("ShowClanTags")
		var_9_23:AnimateSequence("ShowClanTags")
		var_9_25:AnimateSequence("ShowClanTags")
		var_9_27:AnimateSequence("ShowClanTags")
		var_9_29:AnimateSequence("ShowClanTags")
		var_9_31:AnimateSequence("ShowClanTags")
		var_9_33:AnimateSequence("ShowClanTags")
		var_9_35:AnimateSequence("ShowClanTags")
		var_9_37:AnimateSequence("ShowClanTags")
	end

	var_9_0._sequences.ShowClanTags = var_9_105

	local var_9_106
	local var_9_107 = {
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

	var_9_4:RegisterAnimationSequence("ShowSpraysGestures", var_9_107)

	local var_9_108 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("ShowSpraysGestures", var_9_108)

	local var_9_109 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ShowSpraysGestures", var_9_109)

	local var_9_110 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ShowSpraysGestures", var_9_110)

	local var_9_111 = {
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

	var_9_13:RegisterAnimationSequence("ShowSpraysGestures", var_9_111)

	local var_9_112 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("ShowSpraysGestures", var_9_112)

	local var_9_113 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("ShowSpraysGestures", var_9_113)

	local var_9_114 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("ShowSpraysGestures", var_9_114)

	local var_9_115 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("ShowSpraysGestures", var_9_115)

	local var_9_116 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_23:RegisterAnimationSequence("ShowSpraysGestures", var_9_116)

	local var_9_117 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ShowSpraysGestures", var_9_117)

	local var_9_118 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_27:RegisterAnimationSequence("ShowSpraysGestures", var_9_118)

	local var_9_119 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowSpraysGestures", var_9_119)

	local var_9_120 = {
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

	var_9_31:RegisterAnimationSequence("ShowSpraysGestures", var_9_120)

	local var_9_121 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("ShowSpraysGestures", var_9_121)

	local var_9_122 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("ShowSpraysGestures", var_9_122)

	local var_9_123 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("ShowSpraysGestures", var_9_123)

	local var_9_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_39:RegisterAnimationSequence("ShowSpraysGestures", var_9_124)

	local var_9_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_41:RegisterAnimationSequence("ShowSpraysGestures", var_9_125)

	local function var_9_126()
		var_9_4:AnimateSequence("ShowSpraysGestures")
		var_9_6:AnimateSequence("ShowSpraysGestures")
		var_9_8:AnimateSequence("ShowSpraysGestures")
		var_9_10:AnimateSequence("ShowSpraysGestures")
		var_9_13:AnimateSequence("ShowSpraysGestures")
		var_9_15:AnimateSequence("ShowSpraysGestures")
		var_9_17:AnimateSequence("ShowSpraysGestures")
		var_9_19:AnimateSequence("ShowSpraysGestures")
		var_9_21:AnimateSequence("ShowSpraysGestures")
		var_9_23:AnimateSequence("ShowSpraysGestures")
		var_9_25:AnimateSequence("ShowSpraysGestures")
		var_9_27:AnimateSequence("ShowSpraysGestures")
		var_9_29:AnimateSequence("ShowSpraysGestures")
		var_9_31:AnimateSequence("ShowSpraysGestures")
		var_9_33:AnimateSequence("ShowSpraysGestures")
		var_9_35:AnimateSequence("ShowSpraysGestures")
		var_9_37:AnimateSequence("ShowSpraysGestures")
		var_9_39:AnimateSequence("ShowSpraysGestures")
		var_9_41:AnimateSequence("ShowSpraysGestures")
	end

	var_9_0._sequences.ShowSpraysGestures = var_9_126

	local var_9_127
	local var_9_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("HideAll", var_9_128)

	local var_9_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("HideAll", var_9_129)

	local var_9_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("HideAll", var_9_130)

	local var_9_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("HideAll", var_9_131)

	local var_9_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("HideAll", var_9_132)

	local var_9_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("HideAll", var_9_133)

	local var_9_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("HideAll", var_9_134)

	local var_9_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("HideAll", var_9_135)

	local var_9_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("HideAll", var_9_136)

	local var_9_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_23:RegisterAnimationSequence("HideAll", var_9_137)

	local var_9_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("HideAll", var_9_138)

	local var_9_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_27:RegisterAnimationSequence("HideAll", var_9_139)

	local var_9_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("HideAll", var_9_140)

	local var_9_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_31:RegisterAnimationSequence("HideAll", var_9_141)

	local var_9_142 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("HideAll", var_9_142)

	local var_9_143 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("HideAll", var_9_143)

	local var_9_144 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("HideAll", var_9_144)

	local var_9_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_39:RegisterAnimationSequence("HideAll", var_9_145)

	local var_9_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_41:RegisterAnimationSequence("HideAll", var_9_146)

	local function var_9_147()
		var_9_4:AnimateSequence("HideAll")
		var_9_6:AnimateSequence("HideAll")
		var_9_8:AnimateSequence("HideAll")
		var_9_10:AnimateSequence("HideAll")
		var_9_13:AnimateSequence("HideAll")
		var_9_15:AnimateSequence("HideAll")
		var_9_17:AnimateSequence("HideAll")
		var_9_19:AnimateSequence("HideAll")
		var_9_21:AnimateSequence("HideAll")
		var_9_23:AnimateSequence("HideAll")
		var_9_25:AnimateSequence("HideAll")
		var_9_27:AnimateSequence("HideAll")
		var_9_29:AnimateSequence("HideAll")
		var_9_31:AnimateSequence("HideAll")
		var_9_33:AnimateSequence("HideAll")
		var_9_35:AnimateSequence("HideAll")
		var_9_37:AnimateSequence("HideAll")
		var_9_39:AnimateSequence("HideAll")
		var_9_41:AnimateSequence("HideAll")
	end

	var_9_0._sequences.HideAll = var_9_147

	local var_9_148
	local var_9_149 = {
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

	var_9_15:RegisterAnimationSequence("CH", var_9_149)

	local function var_9_150()
		var_9_15:AnimateSequence("CH")
	end

	var_9_0._sequences.CH = var_9_150

	local var_9_151
	local var_9_152 = {
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

	var_9_39:RegisterAnimationSequence("CustomClanTagEquipped", var_9_152)

	local var_9_153 = {
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

	var_9_41:RegisterAnimationSequence("CustomClanTagEquipped", var_9_153)

	local function var_9_154()
		var_9_39:AnimateSequence("CustomClanTagEquipped")
		var_9_41:AnimateSequence("CustomClanTagEquipped")
	end

	var_9_0._sequences.CustomClanTagEquipped = var_9_154

	local var_9_155
	local var_9_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 497
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 633
		}
	}

	var_9_39:RegisterAnimationSequence("OfficialClanTagEquipped", var_9_156)

	local var_9_157 = {
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

	var_9_41:RegisterAnimationSequence("OfficialClanTagEquipped", var_9_157)

	local function var_9_158()
		var_9_39:AnimateSequence("OfficialClanTagEquipped")
		var_9_41:AnimateSequence("OfficialClanTagEquipped")
	end

	var_9_0._sequences.OfficialClanTagEquipped = var_9_158

	local var_9_159
	local var_9_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("ShowOfficialClanTag", var_9_160)

	local var_9_161 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("ShowOfficialClanTag", var_9_161)

	local var_9_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowOfficialClanTag", var_9_162)

	local var_9_163 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("ShowOfficialClanTag", var_9_163)

	local var_9_164 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("ShowOfficialClanTag", var_9_164)

	local var_9_165 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("ShowOfficialClanTag", var_9_165)

	local function var_9_166()
		var_9_6:AnimateSequence("ShowOfficialClanTag")
		var_9_15:AnimateSequence("ShowOfficialClanTag")
		var_9_29:AnimateSequence("ShowOfficialClanTag")
		var_9_33:AnimateSequence("ShowOfficialClanTag")
		var_9_35:AnimateSequence("ShowOfficialClanTag")
		var_9_37:AnimateSequence("ShowOfficialClanTag")
	end

	var_9_0._sequences.ShowOfficialClanTag = var_9_166

	local var_9_167
	local var_9_168 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("ShowCustomClanTag", var_9_168)

	local var_9_169 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("ShowCustomClanTag", var_9_169)

	local var_9_170 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowCustomClanTag", var_9_170)

	local var_9_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_33:RegisterAnimationSequence("ShowCustomClanTag", var_9_171)

	local var_9_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_35:RegisterAnimationSequence("ShowCustomClanTag", var_9_172)

	local var_9_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_37:RegisterAnimationSequence("ShowCustomClanTag", var_9_173)

	local function var_9_174()
		var_9_6:AnimateSequence("ShowCustomClanTag")
		var_9_15:AnimateSequence("ShowCustomClanTag")
		var_9_29:AnimateSequence("ShowCustomClanTag")
		var_9_33:AnimateSequence("ShowCustomClanTag")
		var_9_35:AnimateSequence("ShowCustomClanTag")
		var_9_37:AnimateSequence("ShowCustomClanTag")
	end

	var_9_0._sequences.ShowCustomClanTag = var_9_174

	local var_9_175
	local var_9_176 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_176)

	local var_9_177 = {
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

	var_9_6:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_177)

	local var_9_178 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_178)

	local var_9_179 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_179)

	local var_9_180 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_180)

	local var_9_181 = {
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

	var_9_15:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_181)

	local var_9_182 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_182)

	local var_9_183 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_183)

	local var_9_184 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_184)

	local var_9_185 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_23:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_185)

	local var_9_186 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_186)

	local var_9_187 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_27:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_187)

	local var_9_188 = {
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
			child = var_9_0.ClanTagTitle.Text
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_29:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_188)

	local var_9_189 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_31:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_189)

	local var_9_190 = {
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

	var_9_33:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_190)

	local var_9_191 = {
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

	var_9_35:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_191)

	local var_9_192 = {
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

	var_9_37:RegisterAnimationSequence("ShowCustomClanTagTopLeft", var_9_192)

	local function var_9_193()
		var_9_4:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_6:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_8:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_10:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_13:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_15:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_17:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_19:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_21:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_23:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_25:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_27:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_29:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_31:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_33:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_35:AnimateSequence("ShowCustomClanTagTopLeft")
		var_9_37:AnimateSequence("ShowCustomClanTagTopLeft")
	end

	var_9_0._sequences.ShowCustomClanTagTopLeft = var_9_193

	var_0_4(var_9_0, var_9_1, arg_9_1)
	ACTIONS.AnimateSequence(var_9_0, "DefaultSequence")

	return var_9_0
end

MenuBuilder.registerType("BarracksCustomizeSummary", BarracksCustomizeSummary)
LockTable(_M)
