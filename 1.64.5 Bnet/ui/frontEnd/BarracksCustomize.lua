module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._switchClanTagEnabled = false
end

local function var_0_1(arg_2_0)
	arg_2_0.BarracksCustomizeSummary.ActiveClanTagEquippedIcon:SetAlpha(0)
	arg_2_0.BarracksCustomizeSummary.ActiveClanTag:SetAlpha(0)
	arg_2_0.BarracksCustomizeSummary.ActiveClanTagBacker:SetAlpha(0)
	arg_2_0.BarracksCustomizeSummary.ActiveClanTagTitle:SetAlpha(0)
end

local function var_0_2(arg_3_0, arg_3_1)
	if EmblemEditorUtils.IsClanEmblemEnabled(arg_3_1) then
		arg_3_0.BarracksCustomizeSummary.ClanEmblem:SetAlpha(1)
		arg_3_0.BarracksCustomizeSummary.Emblem:SetAlpha(0)
	else
		arg_3_0.BarracksCustomizeSummary.ClanEmblem:SetAlpha(0)
		arg_3_0.BarracksCustomizeSummary.Emblem:SetAlpha(1)
	end
end

local function var_0_3(arg_4_0)
	arg_4_0.HelperBar:PopButtonPrompt({
		button_ref = "button_alt1"
	})

	if arg_4_0._bindButton then
		arg_4_0._bindButton:registerEventHandler("button_alt1", nil)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	var_0_3(arg_5_0)

	if arg_5_0._bindButton == nil then
		local var_5_0 = LUI.UIBindButton.new()

		var_5_0.id = "selfBindButton"

		arg_5_0:addElement(var_5_0)

		arg_5_0._bindButton = var_5_0
	end

	if CONDITIONS.IsClanUIEnabled() then
		if arg_5_1 then
			arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CLANS/USE_CLAN_TAG")
			})
			arg_5_0._bindButton:registerEventHandler("button_alt1", function(arg_6_0, arg_6_1)
				local var_6_0 = arg_5_0._controllerIndex

				if Clans2.CFGBBBHFHB(var_6_0) then
					Engine.GGIHFEAGD(var_6_0, ClanTagType.OFFICIAL)
					arg_5_0.BarracksCustomizeSummary.ActiveClanTag:setText("[" .. Engine.BBFCBBIECH(var_6_0) .. "]")
					arg_5_0.UpdateClanTagButtonHelper(arg_5_0, false)
					arg_5_0.UpdateClanTagTypeEquippedRender(arg_5_0, false)
				else
					LUI.FlowManager.RequestPopupMenu(arg_5_0, "PopupOK", true, arg_6_1.controller, false, {
						message = Engine.CBBHFCGDIC("CLANS/USE_CLAN_TAG_INFO")
					})
				end
			end)
		else
			arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CLANS/USE_CUSTOM_TAG")
			})
			arg_5_0._bindButton:registerEventHandler("button_alt1", function(arg_7_0, arg_7_1)
				arg_5_0.WZCustomizeMenuButtons.ClanTagButton:processEvent({
					name = "button_action"
				})
				arg_5_0.UpdateClanTagButtonHelper(arg_5_0, true)
				arg_5_0.UpdateClanTagTypeEquippedRender(arg_5_0, true)
			end)
		end
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	arg_8_0.BarracksCustomizeSummary.ActiveClanTagEquippedIcon:SetAlpha(arg_8_1 and 0 or 1)
	arg_8_0.BarracksCustomizeSummary.CustomClanTagEquippedIcon:SetAlpha(arg_8_1 and 1 or 0)
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	ACTIONS.AnimateSequence(arg_9_0.BarracksCustomizeSummary, arg_9_1)
	var_0_3(arg_9_0)

	arg_9_0._switchClanTagEnabled = arg_9_2
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MenuTitle)

	arg_10_0._controllerIndex = arg_10_1
	arg_10_0.UpdateClanTagTypeEquippedRender = var_0_5
	arg_10_0.UpdateClanTagButtonHelper = var_0_4

	arg_10_0.BarracksCustomizeSummary.ActiveClanTag:setText("[" .. Engine.BBFCBBIECH(arg_10_1) .. "]")
	ACTIONS.AnimateSequence(arg_10_0.BarracksCustomizeSummary, "HideAll")

	if arg_10_0.MPCustomizeMenuButtons then
		arg_10_0._buttonScheme = arg_10_0.MPCustomizeMenuButtons
	else
		arg_10_0._buttonScheme = arg_10_0.WZCustomizeMenuButtons
	end

	arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZATION"))

	arg_10_0._switchClanTagEnabled = false

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	local var_10_0 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.PLAYERCARD)
	local var_10_1 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.EMBLEM)
	local var_10_2 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.SPRAYS)
	local var_10_3 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.GESTURES)
	local var_10_4 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.TITLE)
	local var_10_5 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.FRAME)
	local var_10_6 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.VEHICLE_CAMO) or LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.VEHICLE_HORN) or LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.VEHICLE_TRACK)
	local var_10_7 = LOOT.IsCategoryNew(arg_10_1, LOOT.itemTypes.WATCH)

	arg_10_0._buttonScheme.EmblemsButton:UpdateNewItemNotification(var_10_1 and 1 or 0)
	arg_10_0._buttonScheme.CallingCardsButton:UpdateNewItemNotification(var_10_0 and 1 or 0)

	local var_10_8 = var_10_2 or var_10_3

	arg_10_0._buttonScheme.RadialButton:UpdateNewItemNotification(var_10_8 and 1 or 0)
	arg_10_0._buttonScheme.EmblemsButton:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		var_0_6(arg_10_0, "ShowEmblem", false)
		var_0_2(arg_10_0, arg_10_1)
	end)
	arg_10_0._buttonScheme.CallingCardsButton:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		var_0_6(arg_10_0, "ShowCallingCard", false)
	end)
	arg_10_0._buttonScheme.RadialButton:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		var_0_6(arg_10_0, "ShowSpraysGestures", false)
	end)

	if arg_10_0.WZCustomizeMenuButtons and not CONDITIONS.IsCoreMultiplayerNotBr() then
		arg_10_0._buttonScheme.CallingCardFrame:UpdateNewItemNotification(var_10_5 and 1 or 0)
		arg_10_0._buttonScheme.CallingCardFrame:addEventHandler("button_over", function(arg_14_0, arg_14_1)
			var_0_6(arg_10_0, "ShowFrame", false)
		end)
		arg_10_0._buttonScheme.PlayerTitle:UpdateNewItemNotification(var_10_4 and 1 or 0)
		arg_10_0._buttonScheme.PlayerTitle:addEventHandler("button_over", function(arg_15_0, arg_15_1)
			var_0_6(arg_10_0, "ShowPlayerTitle", false)
		end)

		if arg_10_0._buttonScheme.VehicleCustomizationButton then
			arg_10_0._buttonScheme.VehicleCustomizationButton:UpdateNewItemNotification(var_10_6 and 1 or 0)
			arg_10_0._buttonScheme.VehicleCustomizationButton:addEventHandler("button_over", function(arg_16_0, arg_16_1)
				var_0_6(arg_10_0, "ShowVehicles", false)
			end)
		end

		if arg_10_0._buttonScheme.WatchSelectButton then
			arg_10_0._buttonScheme.WatchSelectButton.PlayMenuButton:UpdateNewItemNotification(var_10_7 and 1 or 0)
			arg_10_0._buttonScheme.WatchSelectButton:addEventHandler("button_over", function(arg_17_0, arg_17_1)
				var_0_6(arg_10_0, "ShowWatches", false)
			end)
		end
	end

	if Dvar.IBEGCHEFE("NOPQSROMKK") then
		arg_10_0._buttonScheme.ClanTagButton:addEventHandler("button_over", function(arg_18_0, arg_18_1)
			ACTIONS.AnimateSequence(arg_10_0.BarracksCustomizeSummary, "ShowClanTags")

			if not CONDITIONS.IsClanUIEnabled() then
				var_0_1(arg_10_0)
			end

			arg_10_0.BarracksCustomizeSummary:UpdateClanTagType(arg_10_0._currentClanTagType)
			var_0_0(arg_10_0, arg_10_1)

			local var_18_0 = Engine.DIHDIGEBJF(arg_10_1) == ClanTagType.CUSTOM

			arg_10_0.UpdateClanTagButtonHelper(arg_10_0, var_18_0)
			arg_10_0.UpdateClanTagTypeEquippedRender(arg_10_0, var_18_0)
		end)
		arg_10_0._buttonScheme.ClanTagButton:addEventHandler("button_up", function(arg_19_0, arg_19_1)
			if LUI.IsLastInputGamepad(arg_10_1) then
				arg_10_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(0)

				arg_10_0._switchClanTagEnabled = false
			end
		end)
		arg_10_0:addEventHandler("update_clan_tag_type", function(arg_20_0, arg_20_1)
			arg_10_0._currentClanTagType = arg_20_1.clanTagType

			var_0_0(arg_10_0, arg_10_1)
		end)

		arg_10_0._currentClanTagType = FRIENDS.GetCurrentClanTagType(arg_10_1)

		arg_10_0.bindButton:addEventHandler("button_alt1", function(arg_21_0, arg_21_1)
			if arg_10_0._switchClanTagEnabled then
				local var_21_0 = arg_10_0._currentClanTagType == ClanTagType.CUSTOM and ClanTagType.OFFICIAL or ClanTagType.CUSTOM

				Engine.GGIHFEAGD(arg_10_1, var_21_0)

				arg_10_0._currentClanTagType = var_21_0

				Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
			end
		end)
		arg_10_0:registerEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_22_0, arg_22_1)
			if arg_22_1.options.genEventName == CLANS.CLAN_EVENTS.TAG_UPDATED then
				arg_10_0.BarracksCustomizeSummary.ActiveClanTag:setText("[" .. Engine.BBFCBBIECH(arg_10_1) .. "]")
			end
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_10_0, arg_10_1)
	ACTIONS.ScaleFullscreen(arg_10_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_10_0.TabBacker)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_10_0)
	end
end

function BarracksCustomize(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIVerticalNavigator.new()

	var_23_0.id = "BarracksCustomize"

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	var_23_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_23_1
	})
	var_23_0.HelperBar.id = "HelperBar"

	var_23_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_23_0.HelperBar:setPriority(10)
	var_23_0:addElement(var_23_0.HelperBar)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = {
		worldBlur = 1,
		controllerIndex = var_23_1
	}
	local var_23_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_23_4)

	var_23_5.id = "WorldBlur"

	var_23_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_23_0:addElement(var_23_5)

	var_23_0.WorldBlur = var_23_5

	local var_23_6
	local var_23_7 = LUI.UIImage.new()

	var_23_7.id = "Darken"

	var_23_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_23_7:SetAlpha(0.5, 0)
	var_23_0:addElement(var_23_7)

	var_23_0.Darken = var_23_7

	local var_23_8
	local var_23_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_23_1
	})

	var_23_9.id = "Vignette"

	var_23_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_23_0:addElement(var_23_9)

	var_23_0.Vignette = var_23_9

	local var_23_10
	local var_23_11 = MenuBuilder.BuildRegisteredType("BarracksCustomizeSummary", {
		controllerIndex = var_23_1
	})

	var_23_11.id = "BarracksCustomizeSummary"

	var_23_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1626, _1080p * 200, _1080p * 859)
	var_23_0:addElement(var_23_11)

	var_23_0.BarracksCustomizeSummary = var_23_11

	local var_23_12

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_23_13 = MenuBuilder.BuildRegisteredType("MPCustomizeMenuButtons", {
			controllerIndex = var_23_1
		})

		var_23_13.id = "MPCustomizeMenuButtons"

		var_23_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 200, _1080p * 519)
		var_23_0:addElement(var_23_13)

		var_23_0.MPCustomizeMenuButtons = var_23_13
	end

	local var_23_14

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_23_15 = MenuBuilder.BuildRegisteredType("WZCustomizeMenuButtons", {
			controllerIndex = var_23_1
		})

		var_23_15.id = "WZCustomizeMenuButtons"

		var_23_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 185, _1080p * 504)
		var_23_0:addElement(var_23_15)

		var_23_0.WZCustomizeMenuButtons = var_23_15
	end

	local var_23_16
	local var_23_17 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_23_1
	})

	var_23_17.id = "TabBacker"

	var_23_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_23_0:addElement(var_23_17)

	var_23_0.TabBacker = var_23_17

	local var_23_18
	local var_23_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_23_1
	})

	var_23_19.id = "LobbyMembersFooter"

	var_23_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_23_0:addElement(var_23_19)

	var_23_0.LobbyMembersFooter = var_23_19

	local var_23_20
	local var_23_21 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_23_1
	})

	var_23_21.id = "MenuTitle"

	var_23_21.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZATION"), 0)
	var_23_21.Line:SetLeft(0, 0)
	var_23_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_23_0:addElement(var_23_21)

	var_23_0.MenuTitle = var_23_21

	var_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_23_22 = LUI.UIBindButton.new()

	var_23_22.id = "selfBindButton"

	var_23_0:addElement(var_23_22)

	var_23_0.bindButton = var_23_22

	var_23_0.bindButton:addEventHandler("button_secondary", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_23_1
		end

		ACTIONS.LeaveMenu(var_23_0)
	end)
	var_0_7(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("BarracksCustomize", BarracksCustomize)
LockTable(_M)
