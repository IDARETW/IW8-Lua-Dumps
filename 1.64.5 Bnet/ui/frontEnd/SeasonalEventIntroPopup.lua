module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	local var_1_1 = var_1_0.onboardingBink.video
	local var_1_2 = var_1_0.onboardingBink.isEncrypted
	local var_1_3 = var_1_0.onboardingBink.soundSet
	local var_1_4 = var_1_0.onboardingBink.dates
	local var_1_5 = var_1_0.onboardingBink.autoClosePopup and VideoPlaybackFlags.UNUSED or VideoPlaybackFlags.LOOP
	local var_1_6 = var_1_0.onboardingBink.fullscreen

	ACTIONS.AnimateSequence(arg_1_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())
	LUI.DataSourceInControllerModel.new("alwaysLoaded.openedSeasonalFlow"):SetValue(arg_1_1, true)

	if var_1_2 then
		Engine.BIFAAAECJJ(var_1_1, var_1_5)
	else
		Engine.DFCGFCGBFD(var_1_1, var_1_5)
	end

	if var_1_3 ~= nil and var_1_3 ~= "" then
		Engine.BJDBIAGIDA(var_1_3)
	end

	if var_1_4 then
		arg_1_0.EventDuration:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_4)), 0)
	end

	local function var_1_7()
		if not SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData().WasCompleted(arg_1_0, arg_1_1) then
			LUI.FlowManager.RequestPopupMenu(arg_1_0, "SeasonalEventDetailsPopup", true, arg_1_1, false, {})
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end

	if arg_1_0.GenericButton then
		arg_1_0.GenericButton:addEventHandler("button_action", var_1_7)
		arg_1_0.GenericButton:StartTimer(SEASONAL_EVENT.BUTTON_LOCK_TIME)
	else
		local var_1_8 = LUI.UITimer.new({
			interval = 100,
			event = {
				name = "check_video_finished_timer"
			}
		})

		var_1_8.id = "checkVideoFinishedTimer"

		arg_1_0:addElement(var_1_8)
		var_1_8:registerEventHandler("check_video_finished_timer", function()
			if Engine.BCJJBCDGAC() then
				var_1_7()
			end
		end)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)

	if var_1_6 then
		ACTIONS.ScaleFullscreen(arg_1_0.Cinematic)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

local function var_0_1()
	Engine.EBCGADABJ()
end

LUI.FlowManager.RegisterStackPopBehaviour("SeasonalEventIntroPopup", var_0_1)

function SeasonalEventIntroPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "SeasonalEventIntroPopup"
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
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Cinematic"

	var_5_0:addElement(var_5_6)

	var_5_0.Cinematic = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "EventDuration"

	var_5_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_8:setText(ToUpperCase(Engine.CBBHFCGDIC("EVENT_PROMO/HALLOWEEN_DATES")), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetTracking(1 * _1080p, 0)
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -572, _1080p * 572, _1080p * 241, _1080p * 277)
	var_5_0:addElement(var_5_8)

	var_5_0.EventDuration = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "ButtonHelperBar"

	var_5_10.Background:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.ButtonHelperBar = var_5_10

	local var_5_11

	if not CONDITIONS.SeasonalEventIntroPopupIsAutoClosing() then
		var_5_11 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
			controllerIndex = var_5_1
		})
		var_5_11.id = "GenericButton"

		var_5_11.Button.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
		var_5_11.Button.Text:SetAlignment(LUI.Alignment.Center)
		var_5_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 327, _1080p * 364)
		var_5_0:addElement(var_5_11)

		var_5_0.GenericButton = var_5_11
	end

	local function var_5_12()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_12

	local var_5_13
	local var_5_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1770,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 380,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 7560,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("FadeLoop", var_5_14)

	local function var_5_15()
		var_5_8:AnimateLoop("FadeLoop")
	end

	var_5_0._sequences.FadeLoop = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_17)

	local function var_5_18()
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("EVENT_PROMO/EVENT_DATES"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 306
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
		}
	}

	var_5_8:RegisterAnimationSequence("SetupSeasonalEvent", var_5_20)

	if not CONDITIONS.SeasonalEventIntroPopupIsAutoClosing() then
		local var_5_21 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 362
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 399
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_11:RegisterAnimationSequence("SetupSeasonalEvent", var_5_21)
	end

	local function var_5_22()
		var_5_8:AnimateSequence("SetupSeasonalEvent")

		if not CONDITIONS.SeasonalEventIntroPopupIsAutoClosing() then
			var_5_11:AnimateSequence("SetupSeasonalEvent")
		end
	end

	var_5_0._sequences.SetupSeasonalEvent = var_5_22

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SeasonalEventIntroPopup", SeasonalEventIntroPopup)
LockTable(_M)
