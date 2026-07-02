module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Clans.CEACCICGB(arg_1_1) or {}

	arg_1_0._switchClanTagEnabled = arg_1_0._currentClanTagType == ClanTagType.OFFICIAL or #var_1_0 > 0

	arg_1_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(arg_1_0._switchClanTagEnabled and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MenuTitle)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY"))

	arg_2_0._switchClanTagEnabled = false

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	ACTIONS.AnimateSequence(arg_2_0.BarracksCustomizeSummary, "HideAll")

	local var_2_0 = LOOT.IsCategoryNew(arg_2_1, LOOT.itemTypes.PLAYERCARD)
	local var_2_1 = LOOT.IsCategoryNew(arg_2_1, LOOT.itemTypes.EMBLEM)
	local var_2_2 = LOOT.IsCategoryNew(arg_2_1, LOOT.itemTypes.SPRAYS)
	local var_2_3 = LOOT.IsCategoryNew(arg_2_1, LOOT.itemTypes.GESTURES)

	arg_2_0.MPCustomizeMenuButtons.EmblemsButton:UpdateNewItemNotification(var_2_1 and 1 or 0)
	arg_2_0.MPCustomizeMenuButtons.CallingCardsButton:UpdateNewItemNotification(var_2_0 and 1 or 0)

	local var_2_4 = var_2_2 or var_2_3

	arg_2_0.MPCustomizeMenuButtons.RadialButton:UpdateNewItemNotification(var_2_4 and 1 or 0)
	arg_2_0.MPCustomizeMenuButtons.EmblemsButton:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_2_0.BarracksCustomizeSummary, "ShowEmblem")

		arg_2_0._switchClanTagEnabled = false
	end)
	arg_2_0.MPCustomizeMenuButtons.CallingCardsButton:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_2_0.BarracksCustomizeSummary, "ShowCallingCard")

		arg_2_0._switchClanTagEnabled = false
	end)
	arg_2_0.MPCustomizeMenuButtons.RadialButton:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_2_0.BarracksCustomizeSummary, "ShowSpraysGestures")

		arg_2_0._switchClanTagEnabled = false
	end)

	if Dvar.IBEGCHEFE("NOPQSROMKK") then
		arg_2_0.MPCustomizeMenuButtons.ClanTagButton:addEventHandler("button_over", function(arg_6_0, arg_6_1)
			ACTIONS.AnimateSequence(arg_2_0.BarracksCustomizeSummary, "ShowClanTags")
			arg_2_0.BarracksCustomizeSummary:UpdateClanTagType(arg_2_0._currentClanTagType)
			var_0_0(arg_2_0, arg_2_1)
		end)
		arg_2_0.MPCustomizeMenuButtons.ClanTagButton:addEventHandler("button_up", function(arg_7_0, arg_7_1)
			if LUI.IsLastInputGamepad(arg_2_1) then
				arg_2_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(0)

				arg_2_0._switchClanTagEnabled = false
			end
		end)
		arg_2_0:addEventHandler("update_clan_tag_type", function(arg_8_0, arg_8_1)
			arg_2_0._currentClanTagType = arg_8_1.clanTagType

			var_0_0(arg_2_0, arg_2_1)
		end)

		arg_2_0._currentClanTagType = FRIENDS.GetCurrentClanTagType(arg_2_1)

		arg_2_0.bindButton:addEventHandler("button_alt1", function(arg_9_0, arg_9_1)
			if arg_2_0._switchClanTagEnabled then
				local var_9_0 = arg_2_0._currentClanTagType == ClanTagType.CUSTOM and ClanTagType.OFFICIAL or ClanTagType.CUSTOM

				Engine.GGIHFEAGD(arg_2_1, var_9_0)

				arg_2_0._currentClanTagType = var_9_0

				Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
			end
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.TabBacker)
end

function BarracksCustomize(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalNavigator.new()

	var_10_0.id = "BarracksCustomize"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = {
		worldBlur = 1,
		controllerIndex = var_10_1
	}
	local var_10_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_10_4)

	var_10_5.id = "WorldBlur"

	var_10_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_10_0:addElement(var_10_5)

	var_10_0.WorldBlur = var_10_5

	local var_10_6
	local var_10_7 = LUI.UIImage.new()

	var_10_7.id = "Darken"

	var_10_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_7:SetAlpha(0.5, 0)
	var_10_0:addElement(var_10_7)

	var_10_0.Darken = var_10_7

	local var_10_8
	local var_10_9 = MenuBuilder.BuildRegisteredType("BarracksCustomizeSummary", {
		controllerIndex = var_10_1
	})

	var_10_9.id = "BarracksCustomizeSummary"

	var_10_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1626, _1080p * 200, _1080p * 859)
	var_10_0:addElement(var_10_9)

	var_10_0.BarracksCustomizeSummary = var_10_9

	local var_10_10
	local var_10_11 = MenuBuilder.BuildRegisteredType("MPCustomizeMenuButtons", {
		controllerIndex = var_10_1
	})

	var_10_11.id = "MPCustomizeMenuButtons"

	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 200, _1080p * 519)
	var_10_0:addElement(var_10_11)

	var_10_0.MPCustomizeMenuButtons = var_10_11

	local var_10_12
	local var_10_13 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_10_1
	})

	var_10_13.id = "TabBacker"

	var_10_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_10_0:addElement(var_10_13)

	var_10_0.TabBacker = var_10_13

	local var_10_14
	local var_10_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_10_1
	})

	var_10_15.id = "LobbyMembersFooter"

	var_10_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_10_0:addElement(var_10_15)

	var_10_0.LobbyMembersFooter = var_10_15

	local var_10_16
	local var_10_17 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_17.id = "MenuTitle"

	var_10_17.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY"), 0)
	var_10_17.Line:SetLeft(0, 0)
	var_10_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_10_0:addElement(var_10_17)

	var_10_0.MenuTitle = var_10_17

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_10_18 = LUI.UIBindButton.new()

	var_10_18.id = "selfBindButton"

	var_10_0:addElement(var_10_18)

	var_10_0.bindButton = var_10_18

	var_10_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_10_1
		end

		ACTIONS.LeaveMenu(var_10_0)
	end)
	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BarracksCustomize", BarracksCustomize)
LockTable(_M)
