module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_1.UIRoot = PartyUIRoot.PAYBACK_ONBOARDING_LOBBY
	arg_1_1.type = Onboarding.Plunder
	arg_1_1.data = ONBOARDING_DATA.GetPlunderTutorialData()
	arg_1_1.video = "mp_plunder_tutorial"

	local var_1_0 = MenuBuilder.BuildRegisteredType("OnBoardingLobby", arg_1_1)

	var_1_0.id = "PayBackOnBoardingLobby"

	return var_1_0
end

MenuBuilder.registerType("PayBackOnBoardingLobby", var_0_0)
LUI.FlowManager.RequestSetStack("PayBackOnBoardingLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "BRMainMenu"
	}
})

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._areWeHost = Lobby.AreWePrivatePartyHost()

	local var_2_0 = Engine.HEEFCICJE() and "BRPublicLobby" or "MPPublicLobby"

	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		LUI.FlowManager.RequestPopupMenu(nil, "LeaveOnboardingLobby", true, arg_3_1.controller, false, {
			onBoardingLobby = arg_2_0
		})

		return true
	end)

	local var_2_1 = {
		disableQuickAccess = true,
		headerText = not arg_2_0._areWeHost and Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS") or nil,
		video = arg_2_2.video,
		onVideoFinished = function()
			if Lobby.AreWePrivatePartyHost() then
				if arg_2_2.categoryIndex and arg_2_2.playlistIndex then
					Playlist.CDBBECIGIG(arg_2_2.categoryIndex, arg_2_2.playlistIndex)
				else
					LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
				end
			elseif not Lobby.IsOurPrivatePartyHostInLobby() then
				LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
			end

			local var_4_0

			local function var_4_1()
				if Engine.DAFGFCFHJI() then
					LUI.FlowManager.RequestAddMenu(var_2_0, false, arg_2_1, false, {
						openFromPlaylist = true,
						onBoarding = {
							type = arg_2_2.type,
							data = arg_2_2.data
						}
					})
				else
					arg_2_0:Wait(10).onComplete = function()
						var_4_1()
					end
				end
			end

			var_4_1()
		end,
		unskippable = not CONDITIONS.IsDevelopmentBuild()
	}

	Lobby.EAHFJBBBBD(arg_2_2.UIRoot)
	LUI.FlowManager.RequestPopupMenu(arg_2_0, "CinematicFullscreen", true, arg_2_1, false, var_2_1)
end

local function var_0_2(arg_7_0, arg_7_1)
	assert(arg_7_1.onBoardingLobby)

	local var_7_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBY"),
		yesAction = function(arg_8_0, arg_8_1)
			LUI.FlowManager.RequestLeaveMenu(arg_7_1.onBoardingLobby, true, true)
		end,
		actionSFX = SOUND_SETS.popups.lobbyConfirm,
		popupSFX = SOUND_SETS.popups.lobbyAlert
	}
	local var_7_1

	function var_7_0.noAction()
		return
	end

	if Engine.BAHIIBFDDG() then
		var_7_0.rateLimitIntervalMS = 5000
		var_7_0.rateLimitAttempts = 3
		var_7_1 = MenuBuilder.BuildRegisteredType("RateLimitedPopupYesNo", var_7_0)
	else
		var_7_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_7_0)
	end

	var_7_1.id = "LeaveOnboardingLobby"

	return var_7_1
end

MenuBuilder.registerType("LeaveOnboardingLobby", var_0_2)

function OnBoardingLobby(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "OnBoardingLobby"

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

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_10_3 = LUI.UIBindButton.new()

	var_10_3.id = "selfBindButton"

	var_10_0:addElement(var_10_3)

	var_10_0.bindButton = var_10_3

	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("OnBoardingLobby", OnBoardingLobby)
LockTable(_M)
