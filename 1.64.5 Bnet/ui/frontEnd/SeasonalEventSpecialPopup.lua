module(..., package.seeall)

local var_0_0 = {
	"MPMainMenu",
	"BRMainMenu",
	"CPMainMenu"
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.openedFromMenu

	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if not var_1_0 and not SEASONAL_EVENT.AreAllSeasonalEventsCompleted(arg_1_1) then
			for iter_2_0 = 1, #var_0_0 do
				local var_2_0 = var_0_0[iter_2_0]

				if LUI.FlowManager.IsInStack(var_2_0) then
					local var_2_1 = LUI.FlowManager.GetMenuByName(var_2_0).menu

					if var_2_1 and var_2_1.MPTabsMenu and var_2_1.MPTabsMenu.Tabs then
						local var_2_2 = var_2_1.MPTabsMenu
						local var_2_3 = var_2_2:GetTabIndexByWidgetName("SeasonalEventMenu")

						if var_2_3 and var_2_3 > 0 then
							LUI.FlowManager.GetScopedData(var_2_1).isEventMenuShown = true

							var_2_2.Tabs:FocusTab(arg_1_1, var_2_3 - 1)

							break
						end
					end
				end
			end
		end

		SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData().MarkCompleted(arg_1_0, arg_1_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)

	local var_1_1 = var_1_0 and 0 or SEASONAL_EVENT.BUTTON_LOCK_TIME

	arg_1_0.GenericButton:StartTimer(var_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function SeasonalEventSpecialPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "SeasonalEventSpecialPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GenericPopupWindow"

	var_3_6.PopupBackground:SetRGBFromTable(SWATCHES.EventPromos.halloweenLive, 0)
	var_3_6.PopupBackground:SetAlpha(0.2, 0)
	var_3_6.CornerTopLeft:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_6.CornerTopRight:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_6.CornerBotLeft:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_6.CornerBotRight:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_6.TopBorder:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_6.BotBorder:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -432, _1080p * 432)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "BGImage"

	var_3_8:setImage(RegisterMaterial("ui_seasonal_event_halloween_reward_1"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 863, _1080p * -431, _1080p * 431)
	var_3_0:addElement(var_3_8)

	var_3_0.BGImage = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "TitleImage"

	var_3_10:setImage(RegisterMaterial("ui_seasonal_event_halloween_logo"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -422, _1080p * 422, _1080p * 154, _1080p * 484)
	var_3_0:addElement(var_3_10)

	var_3_0.TitleImage = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "EventDescription"

	var_3_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_DESCRIPTION"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -372, _1080p * 372, _1080p * 671, _1080p * 699)
	var_3_0:addElement(var_3_12)

	var_3_0.EventDescription = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "TrickOrTreatImage"

	var_3_14:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_14:setImage(RegisterMaterial("ui_seasonal_event_halloween_trick_or_treat"), 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -372, _1080p * 372, _1080p * 557, _1080p * 651)
	var_3_0:addElement(var_3_14)

	var_3_0.TrickOrTreatImage = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "GenericButton"

	var_3_16.Button.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_3_16.Button.Text:SetAlignment(LUI.Alignment.Center)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 335, _1080p * 372)
	var_3_0:addElement(var_3_16)

	var_3_0.GenericButton = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SeasonalEventSpecialPopup", SeasonalEventSpecialPopup)
LockTable(_M)
