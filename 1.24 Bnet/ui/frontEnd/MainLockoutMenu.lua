module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("MainLockoutMenu", {
	"shaderUpload"
})

local function var_0_0(arg_1_0, arg_1_1)
	if Engine.JIFHCDAFB() then
		return
	end

	if DCache.DFCGEDHBEC() then
		local var_1_0 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("LUA_MENU/DCACHE_CLEAR_REQUEST"),
			yesAction = function()
				DCache.CAJICHGHDG(1)
				Engine.BHIJFFCAEB(Engine.CBBHFCGDIC("@LUA_MENU/DCACHE_RESTART"))
			end,
			noAction = function()
				DCache.BJEGJFBIBI()
				Engine.BHIJFFCAEB(Engine.CBBHFCGDIC("@LUA_MENU/DCACHE_RESTART"))
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", false, nil, false, var_1_0, nil, false, true)
	else
		local var_1_1 = arg_1_1.controller

		Engine.CDGCBCBAJ("MainLockout ButtonHandler", var_1_1)
		Engine.DAGFFDGFII("resetViewport")
		Engine.BJDBIAGIDA(SOUND_SETS.mainMenu.start)

		if Dvar.IBEGCHEFE("sp_lockout_start_override") then
			if not Engine.CAADCDEEIA() then
				Engine.CDIHEFEJB()
			end

			LUI.FlowManager.RequestAddMenu("CampaignMenu", true, var_1_1, false, nil, false)
		elseif Dvar.IBEGCHEFE("LSTQOKLTRN") or CONDITIONS.IsLaunchChunk() then
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, var_1_1)
		else
			LUI.FlowManager.RequestAddMenu("MainMenu", false, var_1_1)
		end
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	LUI.ToastManager.GetInstance():CloseToastOfType(LUI.ToastManager.NotificationType.Tournament)

	arg_4_0.chatOptOut = true
	arg_4_0.bindButton = LUI.UIBindButton.new()
	arg_4_0.bindButton.id = "BindButton"

	arg_4_0:addElement(arg_4_0.bindButton)
	arg_4_0.bindButton:addEventHandler("gamepad_button", function(arg_5_0, arg_5_1)
		if not arg_5_1.down then
			return false
		end

		if LUI.IsLastInputGamepad(arg_5_1.controller) then
			if arg_5_1.button ~= "primary" and arg_5_1.button ~= "start" then
				return false
			end
		elseif arg_5_1.qualifier == "mousewheel" then
			return false
		end

		return var_0_0(arg_5_0, arg_5_1)
	end)

	function arg_4_0.AcceptsFocusType(arg_6_0, arg_6_1)
		return arg_6_1 == FocusType.MouseOver
	end

	arg_4_0:SetHandleMouse(true)
	arg_4_0:addEventHandler("leftmouseup", var_0_0)
	arg_4_0:registerEventHandler("not_below_blocking_fence", function(arg_7_0, arg_7_1)
		if arg_7_0._openedForInteraction == nil then
			Engine.BIGIHAGAAA()
			Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
			Engine.CEEHHDEHJB("MainLockout menu opened")
			Dvar.DHEGHJJJHI("splitscreen", false)

			arg_7_0._openedForInteraction = true
		end
	end)
	arg_4_0:addEventHandler("menu_create", function(arg_8_0, arg_8_1)
		if Engine.BAHIIBFDDG() then
			arg_4_0:AddButtonHelperText({
				clickable = true,
				button_ref = "button_select",
				side = "left",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SWITCH_USER")
			})
		end
	end)

	if Engine.BAHIIBFDDG() then
		Engine.CFFFHJHGAA(arg_4_1, LUI.INPUT_TYPE.gamepad)
		arg_4_0.bindButton:addEventHandler("button_select", function(arg_9_0, arg_9_1)
			Engine.BGEFGFACEH(arg_9_1.controller, true)

			return true
		end)
	end

	if not Engine.CGABICJHAI() then
		local var_4_0 = {
			controllerIndex = arg_4_1
		}

		arg_4_0:registerEventHandler("update_input_type", function(arg_10_0, arg_10_1)
			local var_10_0 = "@LUA_MENU/PRESS_START_BUTTON"

			if LUI.IsLastInputKeyboardMouse(arg_10_1.controllerIndex) then
				var_10_0 = "@LUA_MENU/PRESS_ANY_KEY"
			end

			arg_10_0.ActionText:setText(Engine.CBBHFCGDIC(var_10_0), 0)
			LAYOUT.SetTextBoxSize(arg_10_0.ActionText, arg_10_0.ActionTextBG, Engine.CBBHFCGDIC(var_10_0), 55, nil, LUI.Alignment.Center, 0)
		end, var_4_0)

		arg_4_0.ActionText:Wait(2400).onComplete = function()
			ACTIONS.AnimateSequence(arg_4_0, "ActionLoop")
		end
	end

	if Engine.CGABICJHAI() then
		local function var_4_1()
			local var_12_0 = CoD.GetAspectRatioScaleAdjust(0.25)

			arg_4_0.Cinematic:SetScale(var_12_0)
		end

		var_4_1()
		arg_4_0:addEventHandler("onVideoChange", var_4_1)
		LAYOUT.AddAspectRatioFadeFrame(arg_4_0, arg_4_1)
	end

	Engine.DFCGFCGBFD("main_menu", VideoPlaybackFlags.LOOP)
	arg_4_0:addEventHandler("menu_close", function(arg_13_0, arg_13_1)
		Engine.EBCGADABJ()
	end)
	Engine.EAIBAGFDCD(CoD.PresenceContext.NOT_IN_GAME)
	Engine.BHHAAHFCFC()
	Engine.HDHJDCJGH()

	local var_4_2 = "@LUA_MENU/PRESS_START_BUTTON"

	if LUI.IsLastInputKeyboardMouse(arg_4_1) then
		var_4_2 = "@LUA_MENU/PRESS_ANY_KEY"
	end

	if not Engine.CGABICJHAI() then
		LAYOUT.SetTextBoxSize(arg_4_0.ActionText, arg_4_0.ActionTextBG, Engine.CBBHFCGDIC(var_4_2), 55, nil, LUI.Alignment.Center, 0)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_4_0)
end

function MainLockoutMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "MainLockoutMenu"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "Cinematic"

	var_14_0:addElement(var_14_4)

	var_14_0.Cinematic = var_14_4

	local var_14_5

	if CONDITIONS.IsXboxLive(var_14_0) then
		local var_14_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
			controllerIndex = var_14_1
		})

		var_14_6.id = "HelperBar"

		var_14_6.Background:SetAlpha(0.2, 0)
		var_14_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
		var_14_0:addElement(var_14_6)

		var_14_0.HelperBar = var_14_6
	end

	local var_14_7
	local var_14_8 = MenuBuilder.BuildRegisteredType("MainMenuLogo", {
		controllerIndex = var_14_1
	})

	var_14_8.id = "Logo"

	var_14_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -286, _1080p * 226)
	var_14_0:addElement(var_14_8)

	var_14_0.Logo = var_14_8

	local var_14_9

	if not CONDITIONS.IsPC(var_14_0) then
		local var_14_10 = LUI.UIImage.new()

		var_14_10.id = "ActionTextBG"

		var_14_10:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
		var_14_10:SetAlpha(0.75, 0)
		var_14_10:SetPixelGridEnabled(true)
		var_14_10:SetPixelGridContrast(0.5, 0)
		var_14_10:SetPixelGridBlockWidth(2, 0)
		var_14_10:SetPixelGridBlockHeight(2, 0)
		var_14_10:SetPixelGridGutterWidth(1, 0)
		var_14_10:SetPixelGridGutterHeight(1, 0)
		var_14_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -335, _1080p * 335, _1080p * 287, _1080p * 347)
		var_14_0:addElement(var_14_10)

		var_14_0.ActionTextBG = var_14_10
	end

	local var_14_11

	if not CONDITIONS.IsPC(var_14_0) then
		var_14_11 = LUI.UIStyledText.new()
		var_14_11.id = "ActionText"

		var_14_11:SetRGBFromTable(SWATCHES.MainMenu.ButtonMain, 0)
		var_14_11:setText(LocalizeString("@LUA_MENU/PRESS_START_BUTTON"), 0)
		var_14_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_14_11:SetWordWrap(false)
		var_14_11:SetAlignment(LUI.Alignment.Center)
		var_14_11:SetTintFontIcons(true)
		var_14_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -335, _1080p * 335, _1080p * 299, _1080p * 335)
		var_14_0:addElement(var_14_11)

		var_14_0.ActionText = var_14_11
	end

	local var_14_12
	local var_14_13 = LUI.UIStyledText.new()

	var_14_13.id = "Copyright"

	var_14_13:SetAlpha(0, 0)
	var_14_13:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_14_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_13:SetAlignment(LUI.Alignment.Center)
	var_14_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -512, _1080p * 512, _1080p * -73, _1080p * -55)
	var_14_0:addElement(var_14_13)

	var_14_0.Copyright = var_14_13

	local var_14_14

	if CONDITIONS.IsXboxLive(var_14_0) then
		local var_14_15 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_14_1
		})

		var_14_15.id = "Gamertag"

		var_14_15:SetRGBFromTable(SWATCHES.MainMenu.ButtonMain, 0)
		var_14_15.TextLabel:SetAlignment(LUI.Alignment.Left)
		var_14_15:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 54, _1080p * 84)
		var_14_0:addElement(var_14_15)

		var_14_0.Gamertag = var_14_15
	end

	local function var_14_16()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_16

	local var_14_17
	local var_14_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_4:RegisterAnimationSequence("Intro", var_14_18)

	local var_14_19 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_8:RegisterAnimationSequence("Intro", var_14_19)

	if not CONDITIONS.IsPC(var_14_0) then
		local var_14_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 1000,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_14_11:RegisterAnimationSequence("Intro", var_14_20)
	end

	local var_14_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_13:RegisterAnimationSequence("Intro", var_14_21)

	local function var_14_22()
		var_14_4:AnimateSequence("Intro")
		var_14_8:AnimateSequence("Intro")

		if not CONDITIONS.IsPC(var_14_0) then
			var_14_11:AnimateSequence("Intro")
		end

		var_14_13:AnimateSequence("Intro")
	end

	var_14_0._sequences.Intro = var_14_22

	local var_14_23

	if not CONDITIONS.IsPC(var_14_0) then
		local var_14_24 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.6,
				duration = 1500,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 1500,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_11:RegisterAnimationSequence("ActionLoop", var_14_24)
	end

	local function var_14_25()
		if not CONDITIONS.IsPC(var_14_0) then
			var_14_11:AnimateLoop("ActionLoop")
		end
	end

	var_14_0._sequences.ActionLoop = var_14_25

	PostLoadFunc(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("MainLockoutMenu", MainLockoutMenu)
LockTable(_M)
