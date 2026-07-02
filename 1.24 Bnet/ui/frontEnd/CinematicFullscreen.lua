module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	Engine.CGDBJBGBHI(0, 0.5)

	arg_1_0._startFlag = false
	arg_1_0.isQuickAccessShortcutsDisabled = arg_1_2.disableQuickAccess or false

	if arg_1_2.headerText then
		arg_1_0.Header:SetAlpha(1)
		arg_1_0.Header.Text:setText(arg_1_2.headerText)
	end

	if arg_1_2.widescreen == true then
		ACTIONS.AnimateSequence(arg_1_0, "Widescreen")
	end

	if arg_1_2.delayTime and arg_1_2.delayTime > 0 then
		arg_1_0:Wait(arg_1_2.delayTime).onComplete = function(arg_2_0)
			if arg_1_2.restartVideo then
				Engine.DFCGFCGBFD(arg_1_2.video)
			else
				Engine.DFCGFCGBFD(arg_1_2.video, VideoPlaybackFlags.UNUSED)
			end

			arg_2_0:AnimateSequence("MaskFadeOut")

			arg_2_0._startFlag = true
		end
	else
		arg_1_0.Mask:SetAlpha(0)
		Engine.DFCGFCGBFD(arg_1_2.video, VideoPlaybackFlags.UNUSED)

		arg_1_0._startFlag = true
	end

	local function var_1_0()
		Engine.EBCGADABJ()
		Engine.CGDBJBGBHI(1, 0.5)

		if arg_1_2.cpIntro then
			CP.SetHasSeenCinematic(arg_1_1, 0)
			LUI.FlowManager.RequestAddMenu("CPMainMenu", false, arg_1_1, false, false)
		else
			ACTIONS.LeaveMenu(arg_1_0)

			if arg_1_2.onVideoFinished then
				arg_1_2.onVideoFinished(arg_1_1)
			end
		end
	end

	local function var_1_1(arg_4_0, arg_4_1)
		Engine.EBCGADABJ()
	end

	if arg_1_2.skipVideoOnPartyJoin then
		arg_1_0:addEventHandler("join_party_complete", function(arg_5_0, arg_5_1)
			var_1_1()
		end)
	end

	arg_1_0:addEventHandler("menu_close", var_1_1)
	arg_1_0:addEventHandler("menu_close_all", var_1_1)

	local var_1_2 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "check_exit_video"
		}
	})

	var_1_2.id = "checkExitTimer"

	arg_1_0:addElement(var_1_2)
	var_1_2:registerEventHandler("check_exit_video", function()
		if arg_1_0._startFlag and Engine.BCJJBCDGAC() then
			var_1_0()
		end
	end)

	if not arg_1_2.unskippable then
		arg_1_0.binkSkipPrompt = MenuBuilder.BuildRegisteredType("BinkSkipPrompt", {
			skipImmediate = arg_1_2.skipImmediate,
			onSkipInput = function()
				var_1_0()
			end
		})
		arg_1_0.binkSkipPrompt.owner = arg_1_0

		arg_1_0:addElement(arg_1_0.binkSkipPrompt)
	end

	local var_1_3 = LUI.UIElement.new()

	var_1_3:setPriority(subtitlePriority)
	var_1_3:SetupCinematicSubtitles()

	var_1_3.id = "subtitles"

	arg_1_0:addElement(var_1_3)
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)
end

function CinematicFullscreen(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0.id = "CinematicFullscreen"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Mask"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1920, 0, _1080p * 1080)
	var_8_0:addElement(var_8_4)

	var_8_0.Mask = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		fullscreen = true,
		controllerIndex = var_8_1
	})

	var_8_6.id = "Cinematic"

	var_8_0:addElement(var_8_6)

	var_8_0.Cinematic = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Header"

	var_8_8:SetAlpha(0, 0)
	var_8_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS")), 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 546, _1080p * -1026, _1080p * -979)
	var_8_0:addElement(var_8_8)

	var_8_0.Header = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10
	local var_8_11 = {
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

	var_8_6:RegisterAnimationSequence("FadeIn", var_8_11)

	local function var_8_12()
		var_8_6:AnimateSequence("FadeIn")
	end

	var_8_0._sequences.FadeIn = var_8_12

	local var_8_13
	local var_8_14 = {
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

	var_8_4:RegisterAnimationSequence("MaskFadeOut", var_8_14)

	local function var_8_15()
		var_8_4:AnimateSequence("MaskFadeOut")
	end

	var_8_0._sequences.MaskFadeOut = var_8_15

	local var_8_16
	local var_8_17 = {
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

	var_8_6:RegisterAnimationSequence("Widescreen", var_8_17)

	local function var_8_18()
		var_8_6:AnimateSequence("Widescreen")
	end

	var_8_0._sequences.Widescreen = var_8_18

	var_0_0(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "FadeIn")

	return var_8_0
end

MenuBuilder.registerType("CinematicFullscreen", CinematicFullscreen)
LockTable(_M)
