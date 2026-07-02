module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("MainLockoutMenu", {
	"shaderUpload"
})

local function var_0_0(arg_1_0, arg_1_1)
	Engine.CDGCBCBAJ("MainLockout ButtonHandler", arg_1_1)
	Engine.DAGFFDGFII("resetViewport")
	Engine.BJDBIAGIDA(SOUND_SETS.mainMenu.start)

	if Dvar.IBEGCHEFE("sp_lockout_start_override") then
		if not Engine.CAADCDEEIA() then
			Engine.CDIHEFEJB()
		end

		LUI.FlowManager.RequestAddMenu("CampaignMenu", true, arg_1_1, false, nil, false)
	else
		DebugPrint("[DEVICE] Moving to Mainmenu for controller " .. arg_1_1)

		if Dvar.IBEGCHEFE("LSTQOKLTRN") or CONDITIONS.IsLaunchChunk() then
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_1_1)
		else
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_1_1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	Engine.CDGCBCBAJ("Going Offline", arg_2_1)
	LUI.FlowManager.RequestLeaveMenu(arg_2_0:GetCurrentMenu(), true)
	LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	if CONDITIONS.IsShowingAccountPicker() or arg_3_0.xboxLoginTimer ~= nil then
		return
	end

	if DCache.DFCGEDHBEC() then
		local var_3_0 = {
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

		LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", false, nil, false, var_3_0, nil, false, true)
	elseif CONDITIONS.IsXbox() and not CONDITIONS.IsUserSignedIn(arg_3_1.controller) then
		Engine.BGEFGFACEH(arg_3_1.controller, false)
		DebugPrint("[DEVICE] Checking last picked account.")

		arg_3_0.xboxLoginTimer = LUI.UITimer.new({
			interval = 1000,
			event = "xbox_login_tick"
		})

		arg_3_0:addElement(arg_3_0.xboxLoginTimer)
		arg_3_0:registerEventHandler("xbox_login_tick", function(arg_6_0, arg_6_1)
			if CONDITIONS.IsShowingAccountPicker() then
				return
			end

			arg_6_0.xboxLoginTimer:closeTree()

			arg_6_0.xboxLoginTimer = nil

			local var_6_0 = Engine.EDDJCDFFC()

			if var_6_0 ~= nil and var_6_0 ~= -1 then
				var_0_0(arg_3_0, var_6_0)
			end
		end)
	else
		var_0_0(arg_3_0, arg_3_1.controller)
	end
end

local function var_0_3(arg_7_0, arg_7_1)
	if CONDITIONS.IsShowingAccountPicker() or arg_7_0.xboxOfflineLoginTimer ~= nil then
		return
	end

	if CONDITIONS.IsXbox() and not CONDITIONS.IsUserSignedIn(arg_7_1.controller) then
		Engine.BGEFGFACEH(arg_7_1.controller, false)
		DebugPrint("[DEVICE] Checking last picked account (offline).")

		arg_7_0.xboxOfflineLoginTimer = LUI.UITimer.new({
			interval = 1000,
			event = "xbox_login_tick_offline"
		})

		arg_7_0:addElement(arg_7_0.xboxOfflineLoginTimer)
		arg_7_0:registerEventHandler("xbox_login_tick_offline", function(arg_8_0, arg_8_1)
			if CONDITIONS.IsShowingAccountPicker() then
				return
			end

			arg_8_0.xboxOfflineLoginTimer:closeTree()

			arg_8_0.xboxOfflineLoginTimer = nil

			local var_8_0 = Engine.EDDJCDFFC()

			if var_8_0 ~= nil and var_8_0 ~= -1 then
				var_0_1(arg_7_0, var_8_0)
			end
		end)
	else
		var_0_1(arg_7_0, arg_7_1.controller)
	end
end

function PostLoadFunc(arg_9_0, arg_9_1, arg_9_2)
	LUI.ToastManager.GetInstance():CloseToastOfType(LUI.ToastManager.NotificationType.Tournament)

	arg_9_0.chatOptOut = true
	arg_9_0.bindButton = LUI.UIBindButton.new()
	arg_9_0.bindButton.id = "BindButton"

	arg_9_0:addElement(arg_9_0.bindButton)
	arg_9_0.bindButton:addEventHandler("gamepad_button", function(arg_10_0, arg_10_1)
		if not arg_10_1.down then
			return false
		end

		if LUI.IsLastInputGamepad(arg_10_1.controller) then
			if arg_10_1.button ~= "primary" and arg_10_1.button ~= "start" then
				return false
			end
		elseif arg_10_1.qualifier == "mousewheel" then
			return false
		end

		return var_0_2(arg_10_0, arg_10_1)
	end)

	function arg_9_0.AcceptsFocusType(arg_11_0, arg_11_1)
		return arg_11_1 == FocusType.MouseOver
	end

	arg_9_0:SetHandleMouse(true)
	arg_9_0:addEventHandler("leftmouseup", var_0_2)
	arg_9_0:registerEventHandler("not_below_blocking_fence", function(arg_12_0, arg_12_1)
		if arg_12_0._openedForInteraction == nil then
			Engine.BIGIHAGAAA()
			Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
			Engine.CEEHHDEHJB("MainLockout menu opened")
			Dvar.DHEGHJJJHI("splitscreen", false)

			arg_12_0._openedForInteraction = true
		end
	end)
	arg_9_0:addEventHandler("menu_create", function(arg_13_0, arg_13_1)
		if Engine.BAHIIBFDDG() then
			arg_9_0:AddButtonHelperText({
				clickable = true,
				button_ref = "button_alt1",
				side = "left",
				helper_text = Engine.CBBHFCGDIC("MENU/GO_OFFLINE")
			})
		end
	end)

	if Engine.BAHIIBFDDG() then
		Engine.CFFFHJHGAA(arg_9_1, LUI.INPUT_TYPE.gamepad)
		arg_9_0.bindButton:addEventHandler("button_alt1", var_0_3)
	end

	if not CONDITIONS.IsPC() then
		local var_9_0 = {
			controllerIndex = arg_9_1
		}

		arg_9_0:registerEventHandler("update_input_type", function(arg_14_0, arg_14_1)
			local var_14_0 = CONDITIONS.IsWZWipDvarEnabled() and arg_14_0.WZInfoBacking or arg_14_0.ActionTextBG
			local var_14_1 = "@LUA_MENU/PRESS_START_BUTTON"

			if LUI.IsLastInputKeyboardMouse(arg_14_1.controllerIndex) then
				var_14_1 = "@LUA_MENU/PRESS_ANY_KEY"
			end

			arg_14_0.ActionText:setText(Engine.CBBHFCGDIC(var_14_1), 0)
			LAYOUT.SetTextBoxSize(arg_14_0.ActionText, var_14_0, Engine.CBBHFCGDIC(var_14_1), 55, nil, LUI.Alignment.Center, 0)
		end, var_9_0)

		arg_9_0.ActionText:Wait(2400).onComplete = function()
			WZWIP.AnimateThemeElement(arg_9_0, "ActionLoop", {
				conditionOverride = CONDITIONS.IsWZWipFrontend()
			})
		end
	end

	if CONDITIONS.IsPC() then
		local function var_9_1()
			local var_16_0 = CoD.GetAspectRatioScaleAdjust(0.25)

			arg_9_0.Cinematic:SetScale(var_16_0)
		end

		var_9_1()
		arg_9_0:addEventHandler("onVideoChange", var_9_1)
		LAYOUT.AddAspectRatioFadeFrame(arg_9_0, arg_9_1)
	end

	Engine.DFCGFCGBFD("main_menu", VideoPlaybackFlags.LOOP)
	arg_9_0:addEventHandler("menu_close", function(arg_17_0, arg_17_1)
		Engine.EBCGADABJ()
	end)
	Engine.EAIBAGFDCD(CoD.PresenceContext.NOT_IN_GAME)
	Engine.BHHAAHFCFC()
	Engine.HDHJDCJGH()
	Engine.DDEJECEIBB()

	local var_9_2 = "@LUA_MENU/PRESS_START_BUTTON"

	if LUI.IsLastInputKeyboardMouse(arg_9_1) then
		var_9_2 = "@LUA_MENU/PRESS_ANY_KEY"
	end

	if not CONDITIONS.IsPC() then
		local var_9_3 = CONDITIONS.IsWZWipDvarEnabled() and arg_9_0.WZInfoBacking or arg_9_0.ActionTextBG

		LAYOUT.SetTextBoxSize(arg_9_0.ActionText, var_9_3, Engine.CBBHFCGDIC(var_9_2), 55, nil, LUI.Alignment.Center, 0)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_9_0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_9_0, "WZWipSetup")

		if not CONDITIONS.IsPC() then
			ACTIONS.AnimateSequence(arg_9_0, "WZWipIntro")
		end
	end
end

function MainLockoutMenu(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "MainLockoutMenu"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "Cinematic"

	var_18_0:addElement(var_18_4)

	var_18_0.Cinematic = var_18_4

	local var_18_5

	if CONDITIONS.IsXboxLive() then
		local var_18_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
			controllerIndex = var_18_1
		})

		var_18_6.id = "HelperBar"

		var_18_6.Background:SetAlpha(0.2, 0)
		var_18_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
		var_18_0:addElement(var_18_6)

		var_18_0.HelperBar = var_18_6
	end

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("MainMenuLogo", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "Logo"

	var_18_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -286, _1080p * 226)
	var_18_0:addElement(var_18_8)

	var_18_0.Logo = var_18_8

	local var_18_9

	if not CONDITIONS.IsPC() then
		var_18_9 = LUI.UIImage.new()
		var_18_9.id = "ActionTextBG"

		var_18_9:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
		var_18_9:SetAlpha(0, 0)
		var_18_9:SetPixelGridEnabled(true)
		var_18_9:SetPixelGridContrast(0.5, 0)
		var_18_9:SetPixelGridBlockWidth(2, 0)
		var_18_9:SetPixelGridBlockHeight(2, 0)
		var_18_9:SetPixelGridGutterWidth(1, 0)
		var_18_9:SetPixelGridGutterHeight(1, 0)
		var_18_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -335, _1080p * 335, _1080p * 287, _1080p * 347)
		var_18_0:addElement(var_18_9)

		var_18_0.ActionTextBG = var_18_9
	end

	local var_18_10

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_18_10 = MenuBuilder.BuildRegisteredType("WZInfoBacking", {
			controllerIndex = var_18_1
		})
		var_18_10.id = "WZInfoBacking"

		var_18_10:SetAlpha(0, 0)
		var_18_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -335, _1080p * 335, _1080p * 279, _1080p * 355)
		var_18_0:addElement(var_18_10)

		var_18_0.WZInfoBacking = var_18_10
	end

	local var_18_11

	if not CONDITIONS.IsPC() then
		var_18_11 = LUI.UIStyledText.new()
		var_18_11.id = "ActionText"

		var_18_11:SetRGBFromTable(SWATCHES.MainMenu.ButtonMain, 0)
		var_18_11:setText(LocalizeString("@LUA_MENU/PRESS_START_BUTTON"), 0)
		var_18_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_18_11:SetWordWrap(false)
		var_18_11:SetAlignment(LUI.Alignment.Center)
		var_18_11:SetTintFontIcons(true)
		var_18_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -335, _1080p * 335, _1080p * 299, _1080p * 335)
		var_18_0:addElement(var_18_11)

		var_18_0.ActionText = var_18_11
	end

	local var_18_12
	local var_18_13 = LUI.UIStyledText.new()

	var_18_13.id = "Copyright"

	var_18_13:SetAlpha(0, 0)
	var_18_13:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_18_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_13:SetAlignment(LUI.Alignment.Center)
	var_18_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -512, _1080p * 512, _1080p * -73, _1080p * -55)
	var_18_0:addElement(var_18_13)

	var_18_0.Copyright = var_18_13

	local function var_18_14()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_14

	local var_18_15
	local var_18_16 = {
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

	var_18_4:RegisterAnimationSequence("Intro", var_18_16)

	local var_18_17 = {
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

	var_18_8:RegisterAnimationSequence("Intro", var_18_17)

	if not CONDITIONS.IsPC() then
		local var_18_18 = {
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

		var_18_11:RegisterAnimationSequence("Intro", var_18_18)
	end

	local var_18_19 = {
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

	var_18_13:RegisterAnimationSequence("Intro", var_18_19)

	local function var_18_20()
		var_18_4:AnimateSequence("Intro")
		var_18_8:AnimateSequence("Intro")

		if not CONDITIONS.IsPC() then
			var_18_11:AnimateSequence("Intro")
		end

		var_18_13:AnimateSequence("Intro")
	end

	var_18_0._sequences.Intro = var_18_20

	local var_18_21

	if not CONDITIONS.IsPC() then
		local var_18_22 = {
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

		var_18_11:RegisterAnimationSequence("ActionLoop", var_18_22)
	end

	local function var_18_23()
		if not CONDITIONS.IsPC() then
			var_18_11:AnimateLoop("ActionLoop")
		end
	end

	var_18_0._sequences.ActionLoop = var_18_23

	local var_18_24

	if not CONDITIONS.IsPC() then
		local var_18_25 = {
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

		var_18_11:RegisterAnimationSequence("WZWipActionLoop", var_18_25)
	end

	local function var_18_26()
		if not CONDITIONS.IsPC() then
			var_18_11:AnimateLoop("WZWipActionLoop")
		end
	end

	var_18_0._sequences.WZWipActionLoop = var_18_26

	local var_18_27

	if not CONDITIONS.IsPC() then
		local var_18_28 = {
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

		var_18_11:RegisterAnimationSequence("WZWipIntro", var_18_28)
	end

	local var_18_29 = {
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

	var_18_13:RegisterAnimationSequence("WZWipIntro", var_18_29)

	local function var_18_30()
		if not CONDITIONS.IsPC() then
			var_18_11:AnimateSequence("WZWipIntro")
		end

		var_18_13:AnimateSequence("WZWipIntro")
	end

	var_18_0._sequences.WZWipIntro = var_18_30

	local var_18_31
	local var_18_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -296
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 216
		}
	}

	var_18_8:RegisterAnimationSequence("WZWipSetup", var_18_32)

	if not CONDITIONS.IsPC() then
		local var_18_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_18_9:RegisterAnimationSequence("WZWipSetup", var_18_33)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_18_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_18_10:RegisterAnimationSequence("WZWipSetup", var_18_34)
	end

	if not CONDITIONS.IsPC() then
		local var_18_35 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			}
		}

		var_18_11:RegisterAnimationSequence("WZWipSetup", var_18_35)
	end

	local function var_18_36()
		var_18_8:AnimateSequence("WZWipSetup")

		if not CONDITIONS.IsPC() then
			var_18_9:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_18_10:AnimateSequence("WZWipSetup")
		end

		if not CONDITIONS.IsPC() then
			var_18_11:AnimateSequence("WZWipSetup")
		end
	end

	var_18_0._sequences.WZWipSetup = var_18_36

	PostLoadFunc(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("MainLockoutMenu", MainLockoutMenu)
LockTable(_M)
