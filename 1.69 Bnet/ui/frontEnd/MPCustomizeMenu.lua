module(..., package.seeall)

local function var_0_0(arg_1_0)
	return Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_1_0) and Engine.CJJAFGIFAC(arg_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._switchClanTagEnabled = false
end

local function var_0_2(arg_3_0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTagEquippedIcon:SetAlpha(0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTag:SetAlpha(0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTagBacker:SetAlpha(0)
	arg_3_0.BarracksCustomizeSummary.ActiveClanTagTitle:SetAlpha(0)
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = CONDITIONS.IsNewBarracksIdentityEnabled() and not LOOT.HideLootBreadcrumbsCondition()

	if CONDITIONS.IsInGameBattlesMatch() or var_4_0 then
		local var_4_1 = LOOT.IsCategoryNew(arg_4_1, LOOT.itemTypes.PLAYERCARD)
		local var_4_2 = LOOT.IsCategoryNew(arg_4_1, LOOT.itemTypes.EMBLEM)
		local var_4_3 = LOOT.IsCategoryNew(arg_4_1, LOOT.itemTypes.SPRAYS)
		local var_4_4 = LOOT.IsCategoryNew(arg_4_1, LOOT.itemTypes.GESTURES)

		arg_4_0.MPCustomizeMenuButtons.EmblemsButton:UpdateNewItemNotification(var_4_2 and 1 or 0)
		arg_4_0.MPCustomizeMenuButtons.CallingCardsButton:UpdateNewItemNotification(var_4_1 and 1 or 0)

		local var_4_5 = var_4_3 or var_4_4

		arg_4_0.MPCustomizeMenuButtons.RadialButton:UpdateNewItemNotification(var_4_5 and 1 or 0)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MPCustomizeMenuButtons.EmblemsButton)
	assert(arg_5_0.MPCustomizeMenuButtons.CallingCardsButton)
	assert(arg_5_0.MPCustomizeMenuButtons.RadialButton)
	assert(arg_5_0.MPCustomizeMenuButtons.ClanTagButton)
	assert(arg_5_0.Darken)
	ACTIONS.ScaleFullscreen(arg_5_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	arg_5_0:setPriority(-1)
	arg_5_0:addEventHandler("text_input_complete", function(arg_6_0, arg_6_1)
		if arg_6_1.text then
			Engine.IIEFBGGGA(arg_5_1, arg_6_1.text)
		end
	end)

	arg_5_0._currentClanTagType = FRIENDS.GetCurrentClanTagType(arg_5_1)

	arg_5_0:addEventHandler("update_clan_tag_type", function(arg_7_0, arg_7_1)
		arg_5_0._currentClanTagType = arg_7_1.clanTagType

		var_0_1(arg_5_0, arg_5_1)
	end)
	ACTIONS.AnimateSequence(arg_5_0.BarracksCustomizeSummary, "HideAll")

	local function var_5_0(arg_8_0)
		if var_0_0(arg_5_1) then
			ACTIONS.AnimateSequence(arg_5_0.BarracksCustomizeSummary, arg_8_0)
			ACTIONS.AnimateSequence(arg_5_0, "ShowSummary")
		else
			ACTIONS.AnimateSequence(arg_5_0, "ShowGesturesAndSprays")
		end
	end

	arg_5_0._switchClanTagEnabled = false

	var_0_3(arg_5_0, arg_5_1)
	arg_5_0.MPCustomizeMenuButtons.ClanTagButton:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if CONDITIONS.IsSystemLink(arg_5_0) then
			var_5_0("ShowCustomClanTagTopLeft")
		else
			var_5_0("ShowClanTags")

			if not CONDITIONS.IsClanUIEnabled() then
				var_0_2(arg_5_0)
			end

			arg_5_0.BarracksCustomizeSummary:UpdateClanTagType(arg_5_0._currentClanTagType)
			var_0_1(arg_5_0, arg_5_1)
		end
	end)
	arg_5_0.MPCustomizeMenuButtons.ClanTagButton:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if LUI.IsLastInputGamepad(arg_5_1) then
			arg_5_0.BarracksCustomizeSummary.SwitchClanTagPrompt:SetAlpha(0)

			arg_5_0._switchClanTagEnabled = false
		end
	end)
	arg_5_0.MPCustomizeMenuButtons.CallingCardsButton:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		var_5_0("ShowCallingCard")
	end)
	arg_5_0.MPCustomizeMenuButtons.EmblemsButton:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		var_5_0("ShowEmblem")
	end)
	arg_5_0.MPCustomizeMenuButtons.RadialButton:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		ACTIONS.AnimateSequence(arg_5_0, "ShowGesturesAndSprays")
	end)

	local var_5_1 = LUI.UIBindButton.new()

	var_5_1.id = "bindButton"

	arg_5_0:addElement(var_5_1)

	arg_5_0.bindButton = var_5_1

	arg_5_0.bindButton:addEventHandler("button_alt1", function(arg_14_0, arg_14_1)
		if arg_5_0._switchClanTagEnabled then
			local var_14_0 = arg_5_0._currentClanTagType == ClanTagType.CUSTOM and ClanTagType.OFFICIAL or ClanTagType.CUSTOM

			Engine.GGIHFEAGD(arg_5_1, var_14_0)

			arg_5_0._currentClanTagType = var_14_0

			Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		end
	end)
	arg_5_0.bindButton:addEventHandler("button_left_stick", function(arg_15_0, arg_15_1)
		if Dvar.IBEGCHEFE("MOSNKSLTKM") and not LOOT.HideLootBreadcrumbsCondition() then
			local var_15_0 = arg_15_0:getParent()

			if var_15_0 then
				LOOT.ClearBarracksBreadcrumbs(var_15_0, var_15_0.MPCustomizeMenuButtons, arg_15_1.controller)
			end

			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		end
	end)

	local var_5_2 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_5_3()
		local var_16_0 = var_5_2:GetValue(arg_5_1) or Engine.IJEBHJIJF()

		if Engine.JEDFGECDJ() > 1 then
			arg_5_0.BarracksCustomizeSummary:SetData(var_16_0)
		end
	end

	arg_5_0:SubscribeToModel(var_5_2:GetModel(arg_5_1), var_5_3)
end

function MPCustomizeMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "MPCustomizeMenu"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = {
		worldBlur = 1,
		controllerIndex = var_17_1
	}
	local var_17_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_17_4)

	var_17_5.id = "WorldBlur"

	var_17_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_17_0:addElement(var_17_5)

	var_17_0.WorldBlur = var_17_5

	local var_17_6
	local var_17_7 = LUI.UIImage.new()

	var_17_7.id = "Darken"

	var_17_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_7:SetAlpha(0.5, 0)
	var_17_0:addElement(var_17_7)

	var_17_0.Darken = var_17_7

	local var_17_8
	local var_17_9 = MenuBuilder.BuildRegisteredType("MPCustomizeMenuButtons", {
		controllerIndex = var_17_1
	})

	var_17_9.id = "MPCustomizeMenuButtons"

	var_17_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 200, _1080p * 519)
	var_17_0:addElement(var_17_9)

	var_17_0.MPCustomizeMenuButtons = var_17_9

	local var_17_10
	local var_17_11 = MenuBuilder.BuildRegisteredType("BarracksCustomizeSummary", {
		controllerIndex = var_17_1
	})

	var_17_11.id = "BarracksCustomizeSummary"

	var_17_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1625, _1080p * 200, _1080p * 859)
	var_17_0:addElement(var_17_11)

	var_17_0.BarracksCustomizeSummary = var_17_11

	local var_17_12

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_17_0) then
		var_17_12 = MenuBuilder.BuildRegisteredType("GestureAndSprayPanel", {
			controllerIndex = var_17_1
		})
		var_17_12.id = "GestureAndSprayPanel"

		var_17_12:SetAlpha(0, 0)
		var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1604, _1080p * 200, _1080p * 755)
		var_17_0:addElement(var_17_12)

		var_17_0.GestureAndSprayPanel = var_17_12
	end

	local function var_17_13()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_13

	local var_17_14
	local var_17_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_11:RegisterAnimationSequence("ShowGesturesAndSprays", var_17_15)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_17_0) then
		local var_17_16 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_12:RegisterAnimationSequence("ShowGesturesAndSprays", var_17_16)
	end

	local function var_17_17()
		var_17_11:AnimateSequence("ShowGesturesAndSprays")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_17_0) then
			var_17_12:AnimateSequence("ShowGesturesAndSprays")
		end
	end

	var_17_0._sequences.ShowGesturesAndSprays = var_17_17

	local var_17_18
	local var_17_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_11:RegisterAnimationSequence("ShowSummary", var_17_19)

	if CONDITIONS.IsNewBarracksIdentityEnabled(var_17_0) then
		local var_17_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_12:RegisterAnimationSequence("ShowSummary", var_17_20)
	end

	local function var_17_21()
		var_17_11:AnimateSequence("ShowSummary")

		if CONDITIONS.IsNewBarracksIdentityEnabled(var_17_0) then
			var_17_12:AnimateSequence("ShowSummary")
		end
	end

	var_17_0._sequences.ShowSummary = var_17_21

	var_0_4(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("MPCustomizeMenu", MPCustomizeMenu)
LockTable(_M)
