module(..., package.seeall)

local var_0_0 = {
	"MPMainMenu",
	"BRMainMenu",
	"CPMainMenu"
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.openedFromMenu

	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
		local var_2_1 = var_2_0 and var_2_0.onboardingData or nil
		local var_2_2 = var_2_0.hasOverlay
		local var_2_3 = SEASONAL_EVENT.AreAllSeasonalEventsCompleted(arg_1_1)

		if not var_1_0 and not var_2_3 then
			if not var_2_2 then
				var_2_1.MarkCompleted(arg_1_0, arg_1_1)
			end

			for iter_2_0 = 1, #var_0_0 do
				local var_2_4 = var_0_0[iter_2_0]

				if LUI.FlowManager.IsInStack(var_2_4) then
					local var_2_5 = LUI.FlowManager.GetMenuByName(var_2_4).menu

					if var_2_5 and var_2_5.MPTabsMenu and var_2_5.MPTabsMenu.Tabs then
						local var_2_6 = var_2_5.MPTabsMenu
						local var_2_7 = var_2_6:GetTabIndexByWidgetName("SeasonalEventMenu")

						if var_2_7 and var_2_7 > 0 then
							LUI.FlowManager.GetScopedData(var_2_5).isEventMenuShown = true

							var_2_6.Tabs:FocusTab(arg_1_1, var_2_7 - 1)

							break
						end
					end
				end
			end

			LUI.DataSourceInControllerModel.new("alwaysLoaded.openedSeasonalFlow"):SetValue(arg_1_1, false)
		elseif SEASONAL_EVENT.AreAllSeasonalEventsCompleted(arg_1_1) and not var_2_1.WasCompleted(arg_1_0, arg_1_1) then
			var_2_1.MarkCompleted(arg_1_0, arg_1_1)
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)

	local var_1_1 = SEASONAL_EVENT.BUTTON_LOCK_TIME

	if var_1_0 then
		var_1_1 = 0
	end

	ACTIONS.AnimateSequence(arg_1_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())
	arg_1_0.GenericButton:StartTimer(var_1_1)
	SEASONAL_EVENT.SetupCountdown(arg_1_0.EventEndTimer)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_1_0.Backdrop)

	if LAYOUT.IsWideScreen() then
		ACTIONS.AnimateSequence(arg_1_0, "WideAspectRatio")
	end
end

function SeasonalEventDetailsPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "SeasonalEventDetailsPopup"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backdrop"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backdrop = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Background"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:setImage(RegisterMaterial("ui_mp_wz_bkg_challenge"), 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Background = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Darkener"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_8:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Darkener = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "GenericPopupWindow"

	var_3_10.PopupBackground:SetRGBFromTable(SWATCHES.EventPromos.halloweenLive, 0)
	var_3_10.PopupBackground:SetAlpha(0.2, 0)
	var_3_10.CornerTopLeft:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_10.CornerTopRight:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_10.CornerBotLeft:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_10.CornerBotRight:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_10.TopBorder:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_3_10.BotBorder:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_3_10.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_3_10.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 77, _1080p * 965)
	var_3_0:addElement(var_3_10)

	var_3_0.GenericPopupWindow = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "BgDecorationRight"

	var_3_12:SetAlpha(0, 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -900, 0, _1080p * -1080, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.BgDecorationRight = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "BgDecorationLeft"

	var_3_14:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 900, _1080p * -1080, 0)
	var_3_0:addElement(var_3_14)

	var_3_0.BgDecorationLeft = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "EventImage3"

	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -710, _1080p * 670, _1080p * 242, _1080p * 775)
	var_3_0:addElement(var_3_16)

	var_3_0.EventImage3 = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "EventHeading1"

	var_3_18:SetRGBFromTable(SWATCHES.BattlePass.HalloweenTitleOrange, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_HEADER_1"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -701, _1080p * -250, _1080p * 783, _1080p * 819)
	var_3_0:addElement(var_3_18)

	var_3_0.EventHeading1 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "EventHeading2"

	var_3_20:SetRGBFromTable(SWATCHES.BattlePass.HalloweenTitleOrange, 0)
	var_3_20:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_HEADER_2"), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -235, _1080p * 216, _1080p * 783, _1080p * 819)
	var_3_0:addElement(var_3_20)

	var_3_0.EventHeading2 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "EventHeading3"

	var_3_22:SetRGBFromTable(SWATCHES.BattlePass.HalloweenTitleOrange, 0)
	var_3_22:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_HEADER_3"), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 228, _1080p * 679, _1080p * 783, _1080p * 819)
	var_3_0:addElement(var_3_22)

	var_3_0.EventHeading3 = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIText.new()

	var_3_24.id = "EventDescription1"

	var_3_24:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_24:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_DESC_1"), 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Left)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -693, _1080p * -259, _1080p * 822, _1080p * 846)
	var_3_0:addElement(var_3_24)

	var_3_0.EventDescription1 = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIText.new()

	var_3_26.id = "EventDescription2"

	var_3_26:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_26:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_DESC_2"), 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_26:SetAlignment(LUI.Alignment.Left)
	var_3_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -226, _1080p * 208, _1080p * 822, _1080p * 846)
	var_3_0:addElement(var_3_26)

	var_3_0.EventDescription2 = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIText.new()

	var_3_28.id = "EventDescription3"

	var_3_28:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_28:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_DESC_3"), 0)
	var_3_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_28:SetAlignment(LUI.Alignment.Left)
	var_3_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 236, _1080p * 670, _1080p * 822, _1080p * 846)
	var_3_0:addElement(var_3_28)

	var_3_0.EventDescription3 = var_3_28

	local var_3_29
	local var_3_30 = LUI.UIText.new()

	var_3_30.id = "EventEndTimer"

	var_3_30:setText("", 0)
	var_3_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_30:SetAlignment(LUI.Alignment.Left)
	var_3_30:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_30:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 497, _1080p * 679, _1080p * 207, _1080p * 235)
	var_3_0:addElement(var_3_30)

	var_3_0.EventEndTimer = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIText.new()

	var_3_32.id = "EventEndLabel"

	var_3_32:SetRGBFromTable(SWATCHES.BattlePass.HalloweenTitleOrange, 0)
	var_3_32:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/ENDS_IN"), 0)
	var_3_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_32:SetAlignment(LUI.Alignment.Right)
	var_3_32:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1255, _1080p * 1454, _1080p * 208, _1080p * 232)
	var_3_0:addElement(var_3_32)

	var_3_0.EventEndLabel = var_3_32

	local var_3_33
	local var_3_34 = LUI.UIImage.new()

	var_3_34.id = "TitleImage"

	var_3_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -185, _1080p * 185, _1080p * 87, _1080p * 231)
	var_3_0:addElement(var_3_34)

	var_3_0.TitleImage = var_3_34

	local var_3_35
	local var_3_36 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
		controllerIndex = var_3_1
	})

	var_3_36.id = "GenericButton"

	var_3_36.Button.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_3_36.Button.Text:SetAlignment(LUI.Alignment.Center)
	var_3_36:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -210, _1080p * 210, _1080p * 958, _1080p * 995)
	var_3_0:addElement(var_3_36)

	var_3_0.GenericButton = var_3_36

	local var_3_37
	local var_3_38 = LUI.UIText.new()

	var_3_38.id = "EventDescription0"

	var_3_38:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_38:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_DESC_3"), 0)
	var_3_38:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_38:SetAlignment(LUI.Alignment.Center)
	var_3_38:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -536, _1080p * 536, _1080p * 242, _1080p * 272)
	var_3_0:addElement(var_3_38)

	var_3_0.EventDescription0 = var_3_38

	local var_3_39
	local var_3_40 = LUI.UIImage.new()

	var_3_40.id = "VignetteRight"

	var_3_40:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_40:SetAlpha(0, 0)
	var_3_40:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_40:SetUMin(1, 0)
	var_3_40:SetUMax(0, 0)
	var_3_40:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -364, _1080p * 104, 0, 0)
	var_3_0:addElement(var_3_40)

	var_3_0.VignetteRight = var_3_40

	local var_3_41
	local var_3_42 = LUI.UIImage.new()

	var_3_42.id = "VignetteLeft"

	var_3_42:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_42:SetAlpha(0, 0)
	var_3_42:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_42:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -104, _1080p * 364, 0, 0)
	var_3_0:addElement(var_3_42)

	var_3_0.VignetteLeft = var_3_42

	local var_3_43
	local var_3_44 = LUI.UIImage.new()

	var_3_44.id = "LeftBlocker"

	var_3_44:SetRGBFromInt(0, 0)
	var_3_44:SetAlpha(0, 0)
	var_3_44:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -307, 0, 0, 0)
	var_3_0:addElement(var_3_44)

	var_3_0.LeftBlocker = var_3_44

	local var_3_45
	local var_3_46 = LUI.UIImage.new()

	var_3_46.id = "RightBlocker"

	var_3_46:SetRGBFromInt(0, 0)
	var_3_46:SetAlpha(0, 0)
	var_3_46:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * 307, 0, 0)
	var_3_0:addElement(var_3_46)

	var_3_0.RightBlocker = var_3_46

	local function var_3_47()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_47

	local function var_3_48()
		return
	end

	var_3_0._sequences.AR = var_3_48

	local function var_3_49()
		return
	end

	var_3_0._sequences.JA = var_3_49

	local var_3_50
	local var_3_51 = {
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
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("onboarding_cdl_background")
		}
	}

	var_3_6:RegisterAnimationSequence("SetupSeasonalEvent", var_3_51)

	local var_3_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("SetupSeasonalEvent", var_3_52)

	local var_3_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.BotBorder
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("SetupSeasonalEvent", var_3_53)

	local var_3_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_bg_decoration_right")
		}
	}

	var_3_12:RegisterAnimationSequence("SetupSeasonalEvent", var_3_54)

	local var_3_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_bg_decoration_left")
		}
	}

	var_3_14:RegisterAnimationSequence("SetupSeasonalEvent", var_3_55)

	local var_3_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("onboarding_cdl_display")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 692
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		}
	}

	var_3_16:RegisterAnimationSequence("SetupSeasonalEvent", var_3_56)

	local var_3_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ330/FTUE_TITLE_1")
		}
	}

	var_3_18:RegisterAnimationSequence("SetupSeasonalEvent", var_3_57)

	local var_3_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ330/FTUE_TITLE_2")
		}
	}

	var_3_20:RegisterAnimationSequence("SetupSeasonalEvent", var_3_58)

	local var_3_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ330/FTUE_TITLE_3")
		}
	}

	var_3_22:RegisterAnimationSequence("SetupSeasonalEvent", var_3_59)

	local var_3_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ330/FTUE_DESC_1")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -303
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("SetupSeasonalEvent", var_3_60)

	local var_3_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ330/FTUE_DESC_2")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("SetupSeasonalEvent", var_3_61)

	local var_3_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ330/FTUE_DESC_3")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 819
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("SetupSeasonalEvent", var_3_62)

	local var_3_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 342
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_3_30:RegisterAnimationSequence("SetupSeasonalEvent", var_3_63)

	local var_3_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 342
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 770
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 960
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_32:RegisterAnimationSequence("SetupSeasonalEvent", var_3_64)

	local var_3_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("onboarding_cdl_logo")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -260
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 333
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_34:RegisterAnimationSequence("SetupSeasonalEvent", var_3_65)

	local var_3_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 785
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 822
		}
	}

	var_3_36:RegisterAnimationSequence("SetupSeasonalEvent", var_3_66)

	local var_3_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 287
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/EVENT_ONBOARDING_DESC_0")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("SetupSeasonalEvent", var_3_67)

	local function var_3_68()
		var_3_6:AnimateSequence("SetupSeasonalEvent")
		var_3_8:AnimateSequence("SetupSeasonalEvent")
		var_3_10:AnimateSequence("SetupSeasonalEvent")
		var_3_12:AnimateSequence("SetupSeasonalEvent")
		var_3_14:AnimateSequence("SetupSeasonalEvent")
		var_3_16:AnimateSequence("SetupSeasonalEvent")
		var_3_18:AnimateSequence("SetupSeasonalEvent")
		var_3_20:AnimateSequence("SetupSeasonalEvent")
		var_3_22:AnimateSequence("SetupSeasonalEvent")
		var_3_24:AnimateSequence("SetupSeasonalEvent")
		var_3_26:AnimateSequence("SetupSeasonalEvent")
		var_3_28:AnimateSequence("SetupSeasonalEvent")
		var_3_30:AnimateSequence("SetupSeasonalEvent")
		var_3_32:AnimateSequence("SetupSeasonalEvent")
		var_3_34:AnimateSequence("SetupSeasonalEvent")
		var_3_36:AnimateSequence("SetupSeasonalEvent")
		var_3_38:AnimateSequence("SetupSeasonalEvent")
	end

	var_3_0._sequences.SetupSeasonalEvent = var_3_68

	local var_3_69
	local var_3_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_3_6:RegisterAnimationSequence("SetupArmoredEvent", var_3_70)

	local var_3_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("SetupArmoredEvent", var_3_71)

	local var_3_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.BotBorder
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("SetupArmoredEvent", var_3_72)

	local var_3_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 755
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 317
		}
	}

	var_3_16:RegisterAnimationSequence("SetupArmoredEvent", var_3_73)

	local var_3_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -777
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -377
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/AMRB_INFO_TITLE_01")
		}
	}

	var_3_18:RegisterAnimationSequence("SetupArmoredEvent", var_3_74)

	local var_3_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/AMRB_INFO_TITLE_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_3_20:RegisterAnimationSequence("SetupArmoredEvent", var_3_75)

	local var_3_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/AMRB_INFO_TITLE_03")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 355
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 754
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_3_22:RegisterAnimationSequence("SetupArmoredEvent", var_3_76)

	local var_3_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/AMRB_INFO_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 763
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 787
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -777
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -337
		}
	}

	var_3_24:RegisterAnimationSequence("SetupArmoredEvent", var_3_77)

	local var_3_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/AMRB_INFO_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 763
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 787
		}
	}

	var_3_26:RegisterAnimationSequence("SetupArmoredEvent", var_3_78)

	local var_3_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/AMRB_INFO_03")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 763
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 787
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 355
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 795
		}
	}

	var_3_28:RegisterAnimationSequence("SetupArmoredEvent", var_3_79)

	local var_3_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 399
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("SetupArmoredEvent", var_3_80)

	local var_3_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 372
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("SetupArmoredEvent", var_3_81)

	local var_3_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.MainMenuLines
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_34:RegisterAnimationSequence("SetupArmoredEvent", var_3_82)

	local var_3_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 909
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 946
		}
	}

	var_3_36:RegisterAnimationSequence("SetupArmoredEvent", var_3_83)

	local var_3_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 287
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/EVENT_ONBOARDING_DESC_0")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("SetupArmoredEvent", var_3_84)

	local function var_3_85()
		var_3_6:AnimateSequence("SetupArmoredEvent")
		var_3_8:AnimateSequence("SetupArmoredEvent")
		var_3_10:AnimateSequence("SetupArmoredEvent")
		var_3_16:AnimateSequence("SetupArmoredEvent")
		var_3_18:AnimateSequence("SetupArmoredEvent")
		var_3_20:AnimateSequence("SetupArmoredEvent")
		var_3_22:AnimateSequence("SetupArmoredEvent")
		var_3_24:AnimateSequence("SetupArmoredEvent")
		var_3_26:AnimateSequence("SetupArmoredEvent")
		var_3_28:AnimateSequence("SetupArmoredEvent")
		var_3_30:AnimateSequence("SetupArmoredEvent")
		var_3_32:AnimateSequence("SetupArmoredEvent")
		var_3_34:AnimateSequence("SetupArmoredEvent")
		var_3_36:AnimateSequence("SetupArmoredEvent")
		var_3_38:AnimateSequence("SetupArmoredEvent")
	end

	var_3_0._sequences.SetupArmoredEvent = var_3_85

	local var_3_86
	local var_3_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("WideAspectRatio", var_3_87)

	local var_3_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("WideAspectRatio", var_3_88)

	local var_3_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("WideAspectRatio", var_3_89)

	local var_3_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("WideAspectRatio", var_3_90)

	local function var_3_91()
		var_3_40:AnimateSequence("WideAspectRatio")
		var_3_42:AnimateSequence("WideAspectRatio")
		var_3_44:AnimateSequence("WideAspectRatio")
		var_3_46:AnimateSequence("WideAspectRatio")
	end

	var_3_0._sequences.WideAspectRatio = var_3_91

	local var_3_92
	local var_3_93 = {
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
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("onboarding_endowment_2022")
		}
	}

	var_3_6:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_93)

	local var_3_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_94)

	local var_3_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.BotBorder
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_95)

	local var_3_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_bg_decoration_right")
		}
	}

	var_3_12:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_96)

	local var_3_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_bg_decoration_left")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1080
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 900
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_3_14:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_97)

	local var_3_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("onboarding_code_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 692
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		}
	}

	var_3_16:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_98)

	local var_3_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ335/FTUE_TITLE_1")
		}
	}

	var_3_18:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_99)

	local var_3_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ335/FTUE_TITLE_2")
		}
	}

	var_3_20:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_100)

	local var_3_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ335/FTUE_TITLE_3")
		}
	}

	var_3_22:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_101)

	local var_3_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ335/FTUE_DESC_1")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -302
		}
	}

	var_3_24:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_102)

	local var_3_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ335/FTUE_DESC_2")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		}
	}

	var_3_26:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_103)

	local var_3_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ335/FTUE_DESC_3")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 819
		}
	}

	var_3_28:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_104)

	local var_3_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 342
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_3_30:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_105)

	local var_3_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 342
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 770
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 960
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_32:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_106)

	local var_3_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("onboarding_code_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -260
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 333
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_34:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_107)

	local var_3_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 875
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 912
		}
	}

	var_3_36:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_108)

	local var_3_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 287
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/EVENT_ONBOARDING_DESC_0")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("ShowMilitaryAppreciation", var_3_109)

	local function var_3_110()
		var_3_6:AnimateSequence("ShowMilitaryAppreciation")
		var_3_8:AnimateSequence("ShowMilitaryAppreciation")
		var_3_10:AnimateSequence("ShowMilitaryAppreciation")
		var_3_12:AnimateSequence("ShowMilitaryAppreciation")
		var_3_14:AnimateSequence("ShowMilitaryAppreciation")
		var_3_16:AnimateSequence("ShowMilitaryAppreciation")
		var_3_18:AnimateSequence("ShowMilitaryAppreciation")
		var_3_20:AnimateSequence("ShowMilitaryAppreciation")
		var_3_22:AnimateSequence("ShowMilitaryAppreciation")
		var_3_24:AnimateSequence("ShowMilitaryAppreciation")
		var_3_26:AnimateSequence("ShowMilitaryAppreciation")
		var_3_28:AnimateSequence("ShowMilitaryAppreciation")
		var_3_30:AnimateSequence("ShowMilitaryAppreciation")
		var_3_32:AnimateSequence("ShowMilitaryAppreciation")
		var_3_34:AnimateSequence("ShowMilitaryAppreciation")
		var_3_36:AnimateSequence("ShowMilitaryAppreciation")
		var_3_38:AnimateSequence("ShowMilitaryAppreciation")
	end

	var_3_0._sequences.ShowMilitaryAppreciation = var_3_110

	local var_3_111
	local var_3_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_hvv_ftue_bg")
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
		}
	}

	var_3_6:RegisterAnimationSequence("SetupHvVEvent", var_3_112)

	local var_3_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("SetupHvVEvent", var_3_113)

	local var_3_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_3_0.GenericPopupWindow.BotBorder
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("SetupHvVEvent", var_3_114)

	local var_3_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_hvv_tutorial")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 692
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 820
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		}
	}

	var_3_16:RegisterAnimationSequence("SetupHvVEvent", var_3_115)

	local var_3_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 641
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 677
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/HVV_INFO_TITLE_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Bottom
		}
	}

	var_3_18:RegisterAnimationSequence("SetupHvVEvent", var_3_116)

	local var_3_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/HVV_INFO_TITLE_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 641
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 677
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Bottom
		}
	}

	var_3_20:RegisterAnimationSequence("SetupHvVEvent", var_3_117)

	local var_3_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/HVV_INFO_TITLE_03")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 641
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 677
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Bottom
		}
	}

	var_3_22:RegisterAnimationSequence("SetupHvVEvent", var_3_118)

	local var_3_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/HVV_INFO_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -302
		}
	}

	var_3_24:RegisterAnimationSequence("SetupHvVEvent", var_3_119)

	local var_3_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/HVV_INFO_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		}
	}

	var_3_26:RegisterAnimationSequence("SetupHvVEvent", var_3_120)

	local var_3_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/HVV_INFO_03")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 707
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 731
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 302
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 819
		}
	}

	var_3_28:RegisterAnimationSequence("SetupHvVEvent", var_3_121)

	local var_3_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 345
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_3_30:RegisterAnimationSequence("SetupHvVEvent", var_3_122)

	local var_3_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1060
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.subPopupText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_3_32:RegisterAnimationSequence("SetupHvVEvent", var_3_123)

	local var_3_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_hvv_title")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.MainMenuLines
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_34:RegisterAnimationSequence("SetupHvVEvent", var_3_124)

	local var_3_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 847
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 884
		}
	}

	var_3_36:RegisterAnimationSequence("SetupHvVEvent", var_3_125)

	local var_3_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 287
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/EVENT_ONBOARDING_DESC_0")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("SetupHvVEvent", var_3_126)

	local function var_3_127()
		var_3_6:AnimateSequence("SetupHvVEvent")
		var_3_8:AnimateSequence("SetupHvVEvent")
		var_3_10:AnimateSequence("SetupHvVEvent")
		var_3_16:AnimateSequence("SetupHvVEvent")
		var_3_18:AnimateSequence("SetupHvVEvent")
		var_3_20:AnimateSequence("SetupHvVEvent")
		var_3_22:AnimateSequence("SetupHvVEvent")
		var_3_24:AnimateSequence("SetupHvVEvent")
		var_3_26:AnimateSequence("SetupHvVEvent")
		var_3_28:AnimateSequence("SetupHvVEvent")
		var_3_30:AnimateSequence("SetupHvVEvent")
		var_3_32:AnimateSequence("SetupHvVEvent")
		var_3_34:AnimateSequence("SetupHvVEvent")
		var_3_36:AnimateSequence("SetupHvVEvent")
		var_3_38:AnimateSequence("SetupHvVEvent")
	end

	var_3_0._sequences.SetupHvVEvent = var_3_127

	var_0_1(var_3_0, var_3_1, arg_3_1)

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(var_3_0, "AR")
	end

	if CONDITIONS.IsJapanese() then
		ACTIONS.AnimateSequence(var_3_0, "JA")
	end

	return var_3_0
end

MenuBuilder.registerType("SeasonalEventDetailsPopup", SeasonalEventDetailsPopup)
LockTable(_M)
