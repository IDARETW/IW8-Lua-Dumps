module(..., package.seeall)

local var_0_0 = 10000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1

	if arg_1_2.isEarlyAccess then
		var_1_0, var_1_1 = SEASONAL_EVENT.GetEarlyAccessGiftDetails()
	else
		var_1_0, var_1_1 = SEASONAL_EVENT.GetIntroGiftDetails()
	end

	local var_1_2 = LOOT.GetLootCardData(arg_1_1, var_1_0)

	arg_1_0.LootItemCardMini:UpdateCardConfig(var_1_2)
	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		arg_1_0.spinner:SetAlpha(1)
		arg_1_0.CollectingTreat:SetAlpha(1)
		arg_1_0.GenericButton:SetButtonDisabled(true)

		local var_2_0 = StringTable.DIFCHIGDFB(CSV.seasonalEvent.file, CSV.seasonalEvent.cols.challengeRef, var_1_1, CSV.seasonalEvent.cols.backendChallengeRef)

		Challenges.DFGEFGFCFC(arg_1_1, "collect_item", var_2_0)

		arg_1_0._isChallengeCompleted = false
		arg_1_0:Wait(var_0_0).onComplete = function()
			if not arg_1_0._isChallengeCompleted then
				local var_3_0 = {
					title = Engine.CBBHFCGDIC("MENU/ERROR"),
					message = Engine.CBBHFCGDIC("SEASONAL_EVENT/ERROR_COLLECTING_TREAT"),
					action = ACTIONS.LeaveMenu(arg_1_0)
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_1_1, false, var_3_0, nil, false, true)
				ACTIONS.LeaveMenu(arg_1_0)
			end
		end

		arg_1_0:addEventHandler("completed_misc_challenge", function(arg_4_0, arg_4_1)
			arg_1_0._isChallengeCompleted = true

			ACTIONS.LeaveMenu(arg_1_0)
			LUI.FlowManager.RequestAddMenu("StoreFullScreenCinematic", true, arg_1_1, false, {
				isSeasonalEvent = true,
				isCollect = true
			}, true)
		end)
	end)
	ACTIONS.AnimateSequence(arg_1_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	arg_1_0.GenericButton:StartTimer(0)
end

function SeasonalIntroGiftPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "SeasonalIntroGiftPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_4:SetAlpha(0.8, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6.PopupBackground:SetRGBFromTable(SWATCHES.EventPromos.halloweenLive, 0)
	var_5_6.PopupBackground:SetAlpha(0.3, 0)
	var_5_6.CornerTopLeft:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_6.CornerTopRight:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_6.CornerBotLeft:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_6.CornerBotRight:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_6.TopBorder:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_6.BotBorder:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -432, _1080p * 432)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "BackgroundImage"

	var_5_8:setImage(RegisterMaterial("ui_seasonal_event_halloween_reward_2"), 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -863, _1080p * 863, _1080p * -431, _1080p * 431)
	var_5_0:addElement(var_5_8)

	var_5_0.BackgroundImage = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "EventDetails"

	var_5_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/STARTING_TREAT"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -148, _1080p * -118)
	var_5_0:addElement(var_5_10)

	var_5_0.EventDetails = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "LootItemCardMini"

	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -17, _1080p * 183)
	var_5_0:addElement(var_5_12)

	var_5_0.LootItemCardMini = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "spinner"

	var_5_14:SetAlpha(0, 0)
	var_5_14:setImage(RegisterMaterial("spinner_loading"), 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * 315, _1080p * 325)
	var_5_0:addElement(var_5_14)

	var_5_0.spinner = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIText.new()

	var_5_16.id = "CollectingTreat"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_5_16:SetAlpha(0, 0)
	var_5_16:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/COLLECTING_TREAT"), 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Center)
	var_5_16:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * 295, _1080p * 315)
	var_5_0:addElement(var_5_16)

	var_5_0.CollectingTreat = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "HappyHalloweenImage"

	var_5_18:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_5_18:setImage(RegisterMaterial("ui_seasonal_event_halloween_happy_halloween"), 0)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -330, _1080p * -202)
	var_5_0:addElement(var_5_18)

	var_5_0.HappyHalloweenImage = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "GenericButton"

	var_5_20.Button.Text:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/COLLECT_TREAT"), 0)
	var_5_20.Button.Text:SetAlignment(LUI.Alignment.Center)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 335, _1080p * 372)
	var_5_0:addElement(var_5_20)

	var_5_0.GenericButton = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed,
			child = var_5_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.BotBorder
		}
	}

	var_5_6:RegisterAnimationSequence("AtlantisEvent", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_atlantis_reward")
		}
	}

	var_5_8:RegisterAnimationSequence("AtlantisEvent", var_5_24)

	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/ATLANTIS_STARTING_TREAT")
		}
	}

	var_5_10:RegisterAnimationSequence("AtlantisEvent", var_5_25)

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/COLLECTING_GIFT")
		}
	}

	var_5_16:RegisterAnimationSequence("AtlantisEvent", var_5_26)

	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_atlantis_welcome")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -202
		}
	}

	var_5_18:RegisterAnimationSequence("AtlantisEvent", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 335
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 372
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/COLLECT_GIFT"),
			child = var_5_0.GenericButton.Button.Text
		}
	}

	var_5_20:RegisterAnimationSequence("AtlantisEvent", var_5_28)

	local function var_5_29()
		var_5_6:AnimateSequence("AtlantisEvent")
		var_5_8:AnimateSequence("AtlantisEvent")
		var_5_10:AnimateSequence("AtlantisEvent")
		var_5_16:AnimateSequence("AtlantisEvent")
		var_5_18:AnimateSequence("AtlantisEvent")
		var_5_20:AnimateSequence("AtlantisEvent")
	end

	var_5_0._sequences.AtlantisEvent = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed,
			child = var_5_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerTopLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerTopRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerBotLeft
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.CornerBotRight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.TopBorder
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_5_0.GenericPopupWindow.BotBorder
		}
	}

	var_5_6:RegisterAnimationSequence("SetupZombiesEvent", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_outbreak_reward")
		}
	}

	var_5_8:RegisterAnimationSequence("SetupZombiesEvent", var_5_32)

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/ATLANTIS_STARTING_TREAT")
		}
	}

	var_5_10:RegisterAnimationSequence("SetupZombiesEvent", var_5_33)

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/COLLECTING_GIFT")
		}
	}

	var_5_16:RegisterAnimationSequence("SetupZombiesEvent", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_outbreak_welcome")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -187
		}
	}

	var_5_18:RegisterAnimationSequence("SetupZombiesEvent", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 295
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/COLLECT_GIFT"),
			child = var_5_0.GenericButton.Button.Text
		}
	}

	var_5_20:RegisterAnimationSequence("SetupZombiesEvent", var_5_36)

	local function var_5_37()
		var_5_6:AnimateSequence("SetupZombiesEvent")
		var_5_8:AnimateSequence("SetupZombiesEvent")
		var_5_10:AnimateSequence("SetupZombiesEvent")
		var_5_16:AnimateSequence("SetupZombiesEvent")
		var_5_18:AnimateSequence("SetupZombiesEvent")
		var_5_20:AnimateSequence("SetupZombiesEvent")
	end

	var_5_0._sequences.SetupZombiesEvent = var_5_37

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SeasonalIntroGiftPopup", SeasonalIntroGiftPopup)
LockTable(_M)
