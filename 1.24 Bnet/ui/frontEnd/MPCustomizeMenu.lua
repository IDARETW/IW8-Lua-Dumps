module(..., package.seeall)

local function var_0_0(arg_1_0)
	return Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_1_0) and Engine.CJJAFGIFAC(arg_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Clans.CEACCICGB(arg_2_1) or {}

	arg_2_0._switchClanTagEnabled = arg_2_0._currentClanTagType == ClanTagType.OFFICIAL or #var_2_0 > 0

	arg_2_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(arg_2_0._switchClanTagEnabled and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.MPCustomizeMenuButtons.EmblemsButton)
	assert(arg_3_0.MPCustomizeMenuButtons.CallingCardsButton)
	assert(arg_3_0.MPCustomizeMenuButtons.RadialButton)
	assert(arg_3_0.MPCustomizeMenuButtons.ClanTagButton)
	assert(arg_3_0.Darken)
	ACTIONS.ScaleFullscreen(arg_3_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	arg_3_0:setPriority(-1)
	arg_3_0:addEventHandler("text_input_complete", function(arg_4_0, arg_4_1)
		if arg_4_1.text then
			Engine.IIEFBGGGA(arg_3_1, arg_4_1.text)
		end
	end)

	arg_3_0._currentClanTagType = FRIENDS.GetCurrentClanTagType(arg_3_1)

	arg_3_0:addEventHandler("update_clan_tag_type", function(arg_5_0, arg_5_1)
		arg_3_0._currentClanTagType = arg_5_1.clanTagType

		var_0_1(arg_3_0, arg_3_1)
	end)
	ACTIONS.AnimateSequence(arg_3_0.BarracksCustomizeSummary, "HideAll")

	local function var_3_0(arg_6_0)
		if var_0_0(arg_3_1) then
			ACTIONS.AnimateSequence(arg_3_0.BarracksCustomizeSummary, arg_6_0)
		else
			ACTIONS.AnimateSequence(arg_3_0.BarracksCustomizeSummary, "ShowSpraysGestures")
		end
	end

	arg_3_0._switchClanTagEnabled = false

	if CONDITIONS.IsInGameBattlesMatch() then
		local var_3_1 = LOOT.IsCategoryNew(arg_3_1, LOOT.itemTypes.PLAYERCARD)
		local var_3_2 = LOOT.IsCategoryNew(arg_3_1, LOOT.itemTypes.EMBLEM)
		local var_3_3 = LOOT.IsCategoryNew(arg_3_1, LOOT.itemTypes.SPRAYS)
		local var_3_4 = LOOT.IsCategoryNew(arg_3_1, LOOT.itemTypes.GESTURES)

		arg_3_0.MPCustomizeMenuButtons.EmblemsButton:UpdateNewItemNotification(var_3_2 and 1 or 0)
		arg_3_0.MPCustomizeMenuButtons.CallingCardsButton:UpdateNewItemNotification(var_3_1 and 1 or 0)

		local var_3_5 = var_3_3 or var_3_4

		arg_3_0.MPCustomizeMenuButtons.RadialButton:UpdateNewItemNotification(var_3_5 and 1 or 0)
	end

	arg_3_0.MPCustomizeMenuButtons.ClanTagButton:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if CONDITIONS.IsSystemLink(arg_3_0) then
			var_3_0("ShowCustomClanTagTopLeft")
		else
			var_3_0("ShowClanTags")
			arg_3_0.BarracksCustomizeSummary:UpdateClanTagType(arg_3_0._currentClanTagType)
			var_0_1(arg_3_0, arg_3_1)
		end
	end)
	arg_3_0.MPCustomizeMenuButtons.ClanTagButton:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if LUI.IsLastInputGamepad(arg_3_1) then
			arg_3_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(0)

			arg_3_0._switchClanTagEnabled = false
		end
	end)
	arg_3_0.MPCustomizeMenuButtons.CallingCardsButton:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		var_3_0("ShowCallingCard")
	end)
	arg_3_0.MPCustomizeMenuButtons.EmblemsButton:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		var_3_0("ShowEmblem")
	end)
	arg_3_0.MPCustomizeMenuButtons.RadialButton:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_3_0.BarracksCustomizeSummary, "ShowSpraysGestures")
	end)

	local var_3_6 = LUI.UIBindButton.new()

	var_3_6.id = "bindButton"

	arg_3_0:addElement(var_3_6)

	arg_3_0.bindButton = var_3_6

	arg_3_0.bindButton:addEventHandler("button_alt1", function(arg_12_0, arg_12_1)
		if arg_3_0._switchClanTagEnabled then
			local var_12_0 = arg_3_0._currentClanTagType == ClanTagType.CUSTOM and ClanTagType.OFFICIAL or ClanTagType.CUSTOM

			Engine.GGIHFEAGD(arg_3_1, var_12_0)

			arg_3_0._currentClanTagType = var_12_0

			Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		end
	end)

	local var_3_7 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_3_8()
		local var_13_0 = var_3_7:GetValue(arg_3_1) or Engine.IJEBHJIJF()

		if Engine.JEDFGECDJ() > 1 then
			arg_3_0.BarracksCustomizeSummary:SetData(var_13_0)
		end
	end

	arg_3_0:SubscribeToModel(var_3_7:GetModel(arg_3_1), var_3_8)
end

function MPCustomizeMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_14_0.id = "MPCustomizeMenu"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = {
		worldBlur = 1,
		controllerIndex = var_14_1
	}
	local var_14_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_14_4)

	var_14_5.id = "WorldBlur"

	var_14_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_14_0:addElement(var_14_5)

	var_14_0.WorldBlur = var_14_5

	local var_14_6
	local var_14_7 = LUI.UIImage.new()

	var_14_7.id = "Darken"

	var_14_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_7:SetAlpha(0.5, 0)
	var_14_0:addElement(var_14_7)

	var_14_0.Darken = var_14_7

	local var_14_8
	local var_14_9 = MenuBuilder.BuildRegisteredType("MPCustomizeMenuButtons", {
		controllerIndex = var_14_1
	})

	var_14_9.id = "MPCustomizeMenuButtons"

	var_14_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 200, _1080p * 519)
	var_14_0:addElement(var_14_9)

	var_14_0.MPCustomizeMenuButtons = var_14_9

	local var_14_10
	local var_14_11 = MenuBuilder.BuildRegisteredType("BarracksCustomizeSummary", {
		controllerIndex = var_14_1
	})

	var_14_11.id = "BarracksCustomizeSummary"

	var_14_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1625, _1080p * 200, _1080p * 859)
	var_14_0:addElement(var_14_11)

	var_14_0.BarracksCustomizeSummary = var_14_11

	var_0_2(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("MPCustomizeMenu", MPCustomizeMenu)
LockTable(_M)
