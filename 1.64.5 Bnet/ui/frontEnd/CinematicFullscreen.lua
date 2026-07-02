module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	Engine.EBCGADABJ()
	Engine.CGDBJBGBHI(1, 0.5)

	if arg_1_2.cpIntro then
		CP.SetHasSeenCinematic(arg_1_1, 0)
		LUI.FlowManager.RequestAddMenu("CPMainMenu", false, arg_1_1, false, false)
	else
		ACTIONS.LeaveMenu(arg_1_0)

		if arg_1_2 and arg_1_2.onVideoFinished then
			arg_1_2.onVideoFinished(arg_1_1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "check_exit_video"
		}
	})

	var_2_0.id = "checkExitTimer"

	arg_2_0:addElement(var_2_0)
	var_2_0:registerEventHandler("check_exit_video", function()
		if arg_2_0._startFlag and Engine.BCJJBCDGAC() then
			var_0_0(arg_2_0, arg_2_1, arg_2_2)
		end
	end)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	Engine.CGDBJBGBHI(0, 0.5)

	local function var_4_0(arg_5_0)
		LUI.UIMouseCursor.ForceCursorVisibility(false)

		if arg_4_2.isEncrypted then
			Engine.BIFAAAECJJ(arg_4_2.video, arg_5_0)
		else
			Engine.DFCGFCGBFD(arg_4_2.video, arg_5_0)
		end
	end

	arg_4_0._startFlag = false
	arg_4_0.isQuickAccessShortcutsDisabled = arg_4_2.disableQuickAccess or false

	if arg_4_2.headerText then
		arg_4_0.Header:SetAlpha(1)
		arg_4_0.Header.Text:setText(arg_4_2.headerText)
	end

	if arg_4_2.widescreen == true then
		ACTIONS.AnimateSequence(arg_4_0, "Widescreen")
	end

	local var_4_1 = false

	if arg_4_2.delayTime and arg_4_2.delayTime > 0 then
		if arg_4_2.hackForceMatchingTimerStartWithDelay then
			var_4_1 = true
		end

		arg_4_0:Wait(arg_4_2.delayTime).onComplete = function(arg_6_0)
			if arg_4_2.restartVideo then
				var_4_0()
			else
				var_4_0(VideoPlaybackFlags.UNUSED)
			end

			arg_6_0:AnimateSequence("MaskFadeOut")

			arg_6_0._startFlag = true

			if var_4_1 then
				var_0_1(arg_6_0, arg_4_1, arg_4_2)
			end
		end
	else
		arg_4_0.Mask:SetAlpha(0)
		var_4_0(VideoPlaybackFlags.UNUSED)

		arg_4_0._startFlag = true
	end

	local function var_4_2(arg_7_0, arg_7_1)
		Engine.EBCGADABJ()
	end

	if arg_4_2.skipVideoOnPartyJoin then
		arg_4_0:addEventHandler("join_party_complete", function(arg_8_0, arg_8_1)
			var_4_2()
		end)
	end

	arg_4_0:addEventHandler("menu_close", var_4_2)
	arg_4_0:addEventHandler("menu_close_all", var_4_2)

	if not var_4_1 then
		var_0_1(arg_4_0, arg_4_1, arg_4_2)
	end

	if not arg_4_2.unskippable then
		arg_4_0.binkSkipPrompt = MenuBuilder.BuildRegisteredType("BinkSkipPrompt", {
			skipImmediate = arg_4_2.skipImmediate,
			onSkipInput = function()
				var_0_0(arg_4_0, arg_4_1, arg_4_2)
			end
		})
		arg_4_0.binkSkipPrompt.owner = arg_4_0

		arg_4_0:addElement(arg_4_0.binkSkipPrompt)
	end

	local var_4_3 = LUI.UIElement.new()

	var_4_3:setPriority(subtitlePriority)
	var_4_3:SetupCinematicSubtitles()

	var_4_3.id = "subtitles"

	arg_4_0:addElement(var_4_3)
	LUI.TextChat.SetupMenuForNoChat(arg_4_0)
end

function CinematicFullscreen(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "CinematicFullscreen"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Mask"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1920, 0, _1080p * 1080)
	var_10_0:addElement(var_10_4)

	var_10_0.Mask = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		fullscreen = true,
		controllerIndex = var_10_1
	})

	var_10_6.id = "Cinematic"

	var_10_0:addElement(var_10_6)

	var_10_0.Cinematic = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "Header"

	var_10_8:SetAlpha(0, 0)
	var_10_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS")), 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 546, _1080p * -1026, _1080p * -979)
	var_10_0:addElement(var_10_8)

	var_10_0.Header = var_10_8

	local function var_10_9()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_9

	local var_10_10
	local var_10_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 210,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("FadeIn", var_10_11)

	local function var_10_12()
		var_10_6:AnimateSequence("FadeIn")
	end

	var_10_0._sequences.FadeIn = var_10_12

	local var_10_13
	local var_10_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("MaskFadeOut", var_10_14)

	local function var_10_15()
		var_10_4:AnimateSequence("MaskFadeOut")
	end

	var_10_0._sequences.MaskFadeOut = var_10_15

	local var_10_16
	local var_10_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -960
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 960
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 400
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_6:RegisterAnimationSequence("Widescreen", var_10_17)

	local function var_10_18()
		var_10_6:AnimateSequence("Widescreen")
	end

	var_10_0._sequences.Widescreen = var_10_18

	var_0_2(var_10_0, var_10_1, arg_10_1)
	ACTIONS.AnimateSequence(var_10_0, "FadeIn")

	return var_10_0
end

MenuBuilder.registerType("CinematicFullscreen", CinematicFullscreen)
LockTable(_M)
