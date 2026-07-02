module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "FadeIn")

	local function var_1_0()
		local var_2_0 = CoD.GetAspectRatioScaleAdjust(0.25)

		arg_1_0.Cinematic:SetScale(var_2_0)
		arg_1_0.Mask:SetScale(var_2_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)

	local var_1_1 = Dvar.DHEEJCCJBH("MROKTKQTKP")

	Engine.DFCGFCGBFD(var_1_1, VideoPlaybackFlags.LOOP)
	arg_1_0:addEventHandler("menu_close", function(arg_3_0, arg_3_1)
		local var_3_0 = Dvar.CFHDGABACF("NLPPPROSSP")

		Engine.DFJDIFJEGA("hasSeenWZSeasonalOpeningScreenPC_Version", var_3_0, arg_1_1)
		Engine.EBCGADABJ()
		LUI.FlowManager.GetMenuByName("BRMainMenu").menu:processEvent({
			name = "open_next_popup"
		})

		if LUI.FlowManager.IsInStack("LobbyWarzoneIntroPopup") then
			Lobby.ActivateBRTutorialInit(Lobby.BRTutorialLobbyType.TUTORIAL)
		end
	end)
	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		LUI.FlowManager.RequestLeaveMenu(arg_4_0)
	end)
	arg_1_0.GenericButton:StartTimer(SEASONAL_EVENT.BUTTON_LOCK_TIME)

	arg_1_0.isQuickAccessShortcutsDisabled = true

	LUI.TextChat.SetupMenuForNoChat(arg_1_0)
end

function WZSeasonalOpeningScreenPC(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "WZSeasonalOpeningScreenPC"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Cinematic"

	var_5_0:addElement(var_5_4)

	var_5_0.Cinematic = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MainMenuLogo", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Logo"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -286, _1080p * 226)
	var_5_0:addElement(var_5_6)

	var_5_0.Logo = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("BattlePassTimedButton", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "GenericButton"

	var_5_8.Button.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_5_8.Button.Text:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 327, _1080p * 364)
	var_5_0:addElement(var_5_8)

	var_5_0.GenericButton = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Mask"

	var_5_10:SetRGBFromInt(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_10)

	var_5_0.Mask = var_5_10

	local function var_5_11()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_11

	local var_5_12
	local var_5_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("FadeIn", var_5_13)

	local function var_5_14()
		var_5_10:AnimateSequence("FadeIn")
	end

	var_5_0._sequences.FadeIn = var_5_14

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WZSeasonalOpeningScreenPC", WZSeasonalOpeningScreenPC)
LockTable(_M)
