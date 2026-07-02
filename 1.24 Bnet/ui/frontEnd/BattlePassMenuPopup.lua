module(..., package.seeall)

local var_0_0 = 1000
local var_0_1 = 10 * var_0_0

local function var_0_2(arg_1_0, arg_1_1)
	if arg_1_1 then
		arg_1_0.PopupHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 0,
			gamepad_only = true,
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/RADIAL_PREVIEW")
		})
	else
		arg_1_0.PopupHelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_3(arg_2_0)
	LUI.FlowManager.GetScopedData("MainMenu").tabIndexToFocus = TAB.GetIndex(TAB.MP.PLAY)

	LUI.FlowManager.RequestLeaveMenu(arg_2_0, true)
	LUI.FlowManager.RequestLeaveMenuByName("StoreBundlePreview", true)
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdatePrompts = var_0_2
	arg_3_0.isQuickAccessShortcutsDisabled = true
	arg_3_2.isBattlePassPopup = true

	local var_3_0 = MenuBuilder.BuildRegisteredType("BattlePassMenu", arg_3_2)

	var_3_0.id = "BattlePassMenu"

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * -54, _1080p * 1026)

	arg_3_0.BattlePassMenu = var_3_0

	arg_3_0.BattlePassMenu:addElementAfter(arg_3_0.GenericPopupWindow)

	arg_3_0._autoClose = true
	arg_3_0._canStartAutoClose = false

	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREVIEW_TITLE"))
	arg_3_0:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		arg_3_0.BattlePassMenu._currentMenu = arg_4_0:GetCurrentMenu()

		local var_4_0 = LUI.FlowManager.GetScopedData(arg_3_0)

		if arg_3_2.tierSkipID and not var_4_0._tierSkipTriggered then
			var_4_0._tierSkipTriggered = true

			arg_3_0.BattlePassMenu:TriggerAutoTierSkip(arg_3_1)
			arg_3_0:dispatchEventToChildren({
				name = "ClearTooltip"
			})
		elseif arg_3_2.purchaseBattlePassInAAR and not var_4_0._purchaseBattlePassInAAR then
			var_4_0._purchaseBattlePassInAAR = true

			arg_3_0.BattlePassMenu:TriggerPurchaseBattlePassInAAR(arg_3_1)
		elseif arg_3_2.displayBattlePassInAAR and not var_4_0._displayBattlePassInAAR then
			var_4_0._displayBattlePassInAAR = true

			arg_3_0.BattlePassMenu:TriggerDisplayBattlePassInAAR(arg_3_1, arg_3_2.battlePassData)
			ACTIONS.AnimateSequence(arg_3_0, "Fullscreen")
			arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_secondary",
				priority = 0,
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
			AAR.CheckAndShowBattlePassPurchasePopup(arg_3_1)
		elseif arg_3_2.purchaseBattlePassInStore and not var_4_0._purchaseBattlePassInStore then
			var_4_0._purchaseBattlePassInStore = true

			arg_3_0.BattlePassMenu:TriggerPurchaseBattlePassInStore()
		elseif arg_3_2.purchaseBattlePassInVIPGift and not var_4_0._purchaseBattlePassInVIPGift then
			var_4_0._purchaseBattlePassInVIPGift = true

			arg_3_0.BattlePassMenu:TriggerPurchaseBattlePassInVIPGift(arg_3_2.useOnboarding)
		end
	end)
	arg_3_0:addEventHandler("gamepad_button", function(arg_5_0, arg_5_1)
		arg_5_0._autoClose = false
	end)
	arg_3_0:addEventHandler("mousemove", function(arg_6_0, arg_6_1)
		arg_6_0._autoClose = false
	end)
	arg_3_0:addEventHandler("start_auto_close", function(arg_7_0, arg_7_1)
		arg_7_0:Wait(var_0_1).onComplete = function()
			if arg_7_0 and arg_7_0._autoClose then
				if arg_3_2.returnToMainMenu then
					var_0_3(arg_3_0)
				else
					ACTIONS.LeaveMenu(arg_7_0)
				end
			end
		end
	end)

	local var_3_1 = LUI.UIBindButton.new()

	var_3_1.id = "selfBindButton"

	arg_3_0:addElement(var_3_1)

	arg_3_0.bindButton = var_3_1

	arg_3_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if arg_3_2.returnToMainMenu then
			var_0_3(arg_3_0)
		else
			if arg_3_2.displayUpsellPopup then
				STORE.OpenBundleUpsellPopup(arg_3_1)
			end

			ACTIONS.LeaveMenu(arg_3_0)
		end
	end)
	arg_3_0.PopupHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE")
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	ACTIONS.ScaleFullscreen(arg_3_0.Background)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.FrameLeft)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.FrameRight)
end

function BattlePassMenuPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "BattlePassMenuPopup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

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
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.9, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "GenericPopupWindow"

	var_10_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_10_6.PopupBackground:SetAlpha(0.3, 0)
	var_10_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_10_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_10_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_10_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_10_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_10_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -882, _1080p * 882, _1080p * -401, _1080p * 417)
	var_10_0:addElement(var_10_6)

	var_10_0.GenericPopupWindow = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "FrameLeft"

	var_10_8:SetRGBFromInt(0, 0)
	var_10_8:SetAlpha(0.9, 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -164, _1080p * 78, 0, 0)
	var_10_0:addElement(var_10_8)

	var_10_0.FrameLeft = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "FrameRight"

	var_10_10:SetRGBFromInt(0, 0)
	var_10_10:SetAlpha(0.9, 0)
	var_10_10:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -78, _1080p * 164, 0, 0)
	var_10_0:addElement(var_10_10)

	var_10_0.FrameRight = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "FrameTop"

	var_10_12:SetRGBFromInt(0, 0)
	var_10_12:SetAlpha(0.9, 0)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -882, _1080p * 882, 0, _1080p * 139)
	var_10_0:addElement(var_10_12)

	var_10_0.FrameTop = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "FrameBottom"

	var_10_14:SetRGBFromInt(0, 0)
	var_10_14:SetAlpha(0.9, 0)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -882, _1080p * 900, _1080p * -123, 0)
	var_10_0:addElement(var_10_14)

	var_10_0.FrameBottom = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "MenuTitle"

	var_10_16.MenuTitle:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREVIEW_TITLE"), 0)
	var_10_16.Line:SetLeft(0, 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_10_0:addElement(var_10_16)

	var_10_0.MenuTitle = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "PopupHelperBar"

	var_10_18.Background:SetAlpha(0, 0)
	var_10_18:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 78, _1080p * -78, _1080p * 416, _1080p * 486)
	var_10_0:addElement(var_10_18)

	var_10_0.PopupHelperBar = var_10_18

	local function var_10_19()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_19

	local var_10_20
	local var_10_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("Fullscreen", var_10_21)

	local var_10_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("Fullscreen", var_10_22)

	local var_10_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("Fullscreen", var_10_23)

	local var_10_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("Fullscreen", var_10_24)

	local function var_10_25()
		var_10_8:AnimateSequence("Fullscreen")
		var_10_10:AnimateSequence("Fullscreen")
		var_10_12:AnimateSequence("Fullscreen")
		var_10_14:AnimateSequence("Fullscreen")
	end

	var_10_0._sequences.Fullscreen = var_10_25

	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BattlePassMenuPopup", BattlePassMenuPopup)
LockTable(_M)
