module(..., package.seeall)

local function var_0_0()
	local var_1_0 = false

	if not CONDITIONS.IsPC(self) then
		var_1_0 = Dvar.IBEGCHEFE("LKSTRMKTML")
	end

	return var_1_0
end

LUI.FlowManager.RegisterFenceGroup("MainMenu", {
	"koreanRating",
	"bootCheck",
	"signIn",
	"gamerProfile",
	"shaderUpload",
	"multiLogin",
	"onlineServices",
	"patch",
	"mpBanned",
	"mainOnlineData",
	"onlineStatsReset",
	"crossPlayEnable",
	"platformServices",
	"exchange",
	"dailyReward",
	"churnReward",
	"contracts"
})

if Engine.HDGDBCJFG() then
	LUI.FlowManager.RequestSetStack("MainMenu", {
		{
			name = "MainLockoutMenu"
		}
	})
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.bindButton:addEventHandler("button_start", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller or controllerIndex

		ACTIONS.OpenOptionsMenu(var_3_0)
	end)
	arg_2_0:AddButtonHelperText({
		clickable = true,
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	if Engine.HDGDBCJFG() then
		arg_2_0:AddButtonHelperText({
			clickable = true,
			priority = 0,
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	else
		assert(arg_2_0.HelperBar)
		arg_2_0:AddButtonHelperText({
			clickable = true,
			priority = 0,
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")
		})
		arg_2_0.HelperBar:processEvent({
			name = "ignore_game_mode_layout",
			controller = controllerIndex
		})
		LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1.controller)
	end

	Dvar.DHEGHJJJHI("ui_skipMainLockout", false)
	Dvar.DHEGHJJJHI("NNPMRQSQN", true)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		if not Lobby.GFFECBCCF() then
			Engine.DAGFFDGFII("xstartprivateparty", arg_2_1.controller)
		end

		Lobby.EAHFJBBBBD(PartyUIRoot.MAIN_MENU)
	end
end

local function var_0_2()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
end

local function var_0_3()
	if not CONDITIONS.ArePartiesEnabledInMainMenu() then
		Dvar.DHEGHJJJHI("splitscreen", false)
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	end

	var_0_2()
end

local function var_0_4()
	Dvar.DHEGHJJJHI("splitscreen", false)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	var_0_2()
end

local function var_0_5(arg_7_0)
	assert(arg_7_0)
	Engine.CDGCBCBAJ("Pressed a Main Menu button", arg_7_0)
end

function ConfirmOpenCampaignMenu()
	local var_8_0 = Engine.IJEBHJIJF()

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.JEDFGECDJ() > 1 then
		var_8_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(var_8_0, true)
	end

	local var_8_1 = ONBOARDING_DATA.GetOnboardingMatureContentData()

	function var_8_1.confirmButton.action(arg_9_0, arg_9_1)
		ACTIONS.LeaveMenu(arg_9_0)
		LUI.FlowManager.RequestAddMenu("CampaignMenu", true, arg_9_1, false, nil, false)
	end

	LUI.FlowManager.RequestPopupMenu(self, "OnboardingFeaturePopup", true, var_8_0, false, var_8_1)
end

function ConfirmOpenCoopMenu()
	local var_10_0 = Engine.IJEBHJIJF()

	var_0_3()

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		var_0_5(var_10_0)
	end

	Engine.EBCGADABJ()

	if CP.HasSeenIntro(var_10_0, 0) == 0 then
		local var_10_1 = "cp_opening_cine_intro"
		local var_10_2 = {
			disableQuickAccess = true,
			cpIntro = true,
			video = var_10_1
		}

		LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, var_10_0, false, var_10_2)
	else
		LUI.FlowManager.RequestAddMenu("CPMainMenu", false, var_10_0, false, nil, true)
	end
end

function OpenMPMainMenu(arg_11_0, arg_11_1, arg_11_2)
	if var_0_0() then
		local function var_11_0(arg_12_0, arg_12_1)
			if Engine.CFHBIHABCB(arg_12_1) then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_12_1, false)
			end
		end

		local var_11_1 = MAIN_MENU.CheckForMissingMPDataPacks()

		if var_11_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_11_0, "PopupOK", true, arg_11_1, false, {
				message = var_11_1,
				action = var_11_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("NPNQOLKSLP") == true then
		local var_11_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_11_2, nil, false, true)

		return
	end

	local var_11_3 = false
	local var_11_4 = Engine.CGEFDFCIJA()

	if var_11_4 > 1 then
		for iter_11_0 = 0, var_11_4 - 1 do
			local var_11_5 = not Engine.FHEGBGHEC(iter_11_0, CoD.MP_MAP_PACK_1_INDEX) or not Engine.FHEGBGHEC(iter_11_0, CoD.MP_MAP_PACK_2_INDEX) or not Engine.FHEGBGHEC(iter_11_0, CoD.MP_MAP_PACK_3_INDEX) or not Engine.FHEGBGHEC(iter_11_0, CoD.MP_MAP_PACK_4_INDEX)
			local var_11_6 = Engine.CBBGEEFIFI(iter_11_0)

			if var_11_5 and var_11_6 then
				var_11_3 = true

				break
			end
		end
	end

	if var_11_3 then
		LUI.FlowManager.RequestPopupMenu(arg_11_0, "Disband_Party_Enter_DLC_Mode_Popup", true, arg_11_1, false, {
			mpMainMenuOptions = arg_11_2
		})
	else
		AttemptOpenMPMenuAfterDLCModePopup(arg_11_0, arg_11_1, arg_11_2)
	end
end

function AttemptOpenMPMenuAfterDLCModePopup(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = Engine.CGEFDFCIJA()
	local var_13_1 = Engine.CBCEBADAJ(CoD.PlayMode.Core)

	if var_13_1 < var_13_0 then
		LUI.FlowManager.RequestPopupMenu(arg_13_0, "OpeningMenuWithHighPrivatePartyMemberCountWarning", true, arg_13_1, false, {
			currentCount = var_13_0,
			maxCount = var_13_1
		})
	else
		var_0_3()

		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			var_0_5(arg_13_1)
		end

		LUI.FlowManager.RequestAddMenu("MPMainMenu", false, arg_13_1, false, arg_13_2)
	end
end

function OpenLocalPlayOptionsPopup(arg_14_0)
	local var_14_0 = Engine.IJEBHJIJF()

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.JEDFGECDJ() > 1 then
		var_14_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(var_14_0, true)
	end

	LUI.FlowManager.RequestPopupMenu(arg_14_0, "ChooseLocalPlay", false, var_14_0, false, {
		dvarResetFunction = var_0_4
	})
end

function AttemptOpenCampaignMenu(arg_15_0, arg_15_1)
	if Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) or Engine.FABABBDBA() then
		return
	end

	if var_0_0() then
		local function var_15_0(arg_16_0, arg_16_1)
			if Engine.CFHBIHABCB(arg_16_1) then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_16_1, false)
			end
		end

		local var_15_1 = MAIN_MENU.CheckForMissingSPDataPacks()

		if var_15_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_15_0, "PopupOK", true, arg_15_1, false, {
				message = var_15_1,
				action = var_15_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MSRRMTLOQP") == true then
		local var_15_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_15_2, nil, false, true)

		return
	end

	local var_15_3 = true

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		if Lobby.IsNotAloneInPrivateParty() then
			LUI.FlowManager.RequestPopupMenu(arg_15_0, "ConfirmShouldBreakupPrivateParty", true, arg_15_1, false, {
				yesAction = ConfirmOpenCampaignMenu
			})

			var_15_3 = false
		elseif Engine.JEDFGECDJ() > 1 then
			LUI.FlowManager.RequestPopupMenu(arg_15_0, "OpeningMenuWithSplitscreenWarning", true, arg_15_1, false, {
				yesAction = ConfirmOpenCampaignMenu
			})

			var_15_3 = false
		elseif Engine.BJIBIJHDFJ() then
			LUI.FlowManager.RequestPopupMenu(arg_15_0, "OpeningMenuWithSplitscreenPartyMemberWarning", true, arg_15_1, false)

			var_15_3 = false
		end
	end

	if var_15_3 then
		ConfirmOpenCampaignMenu(nil, arg_15_1)
	end
end

function AttemptOpenCoopMenu(arg_17_0, arg_17_1)
	if var_0_0() then
		local function var_17_0(arg_18_0, arg_18_1)
			if Engine.CFHBIHABCB(arg_18_1) then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_18_1, false)
			end
		end

		local var_17_1 = MAIN_MENU.CheckForMissingCPDataPacks()

		if var_17_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupOK", true, arg_17_1, false, {
				message = var_17_1,
				action = var_17_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MQNSRRKQOT") == true then
		local var_17_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_17_2, nil, false, true)

		return
	end

	local var_17_3 = false
	local var_17_4 = Engine.CGEFDFCIJA()

	if var_17_4 > 1 then
		for iter_17_0 = 0, var_17_4 - 1 do
			if not (Engine.FHEGBGHEC(iter_17_0, CoD.CP_MAP_PACK_1_INDEX) and Engine.FHEGBGHEC(iter_17_0, CoD.CP_MAP_PACK_2_INDEX) and Engine.FHEGBGHEC(iter_17_0, CoD.MP_MAP_PACK_3_INDEX)) then
				var_17_3 = true

				break
			end
		end
	end

	if var_17_3 then
		LUI.FlowManager.RequestPopupMenu(arg_17_0, "Disband_Party_Enter_DLC_Mode_Popup", true, arg_17_1, false, nil)
	else
		AttemptOpenCPMenuAfterDLCModePopup(arg_17_0, arg_17_1)
	end
end

function AttemptOpenCPMenuAfterDLCModePopup(arg_19_0, arg_19_1)
	local var_19_0 = Engine.CGEFDFCIJA()
	local var_19_1 = Engine.CBCEBADAJ(CoD.PlayMode.Aliens)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		if var_19_1 < var_19_0 then
			LUI.FlowManager.RequestPopupMenu(arg_19_0, "OpeningMenuWithHighPrivatePartyMemberCountWarning", true, arg_19_1, false, {
				currentCount = var_19_0,
				maxCount = var_19_1
			})
		elseif Engine.BJIBIJHDFJ() then
			local function var_19_2()
				ConfirmOpenCoopMenu()
			end

			if Lobby.SplitScreenChecksPassed(arg_19_0, arg_19_1, var_19_2) then
				ConfirmOpenCoopMenu()
			end
		else
			ConfirmOpenCoopMenu()
		end
	end
end

function DisbandPartyEnterDLCModePopup(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.controllerIndex

	assert(var_21_0)

	local var_21_1 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("MENU/DISBANDPARTYENTERDLCMODEPARTYHOST"),
		yesAction = function(arg_22_0, arg_22_1)
			if arg_21_1.mpMainMenuOptions then
				AttemptOpenMPMenuAfterDLCModePopup(arg_22_0, arg_21_1.controllerIndex, arg_21_1.mpMainMenuOptions)
			else
				AttemptOpenCPMenuAfterDLCModePopup(arg_22_0, arg_21_1.controllerIndex)
			end
		end
	}
	local var_21_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_21_1)

	var_21_2.id = "Disband_Party_Enter_DLC_Mode_Popup"

	return var_21_2
end

MenuBuilder.registerType("Disband_Party_Enter_DLC_Mode_Popup", DisbandPartyEnterDLCModePopup)

local function var_0_6()
	local var_23_0 = {
		cancel_will_close = false,
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/TITLE_UPDATE_AVAILABLE"),
		button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		confirmation_action = function()
			Engine.DJEDDFJEIG()
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "generic_confirmation_popup", false, nil, false, var_23_0)

	return "TitleUpdateAvailablePopup"
end

local function var_0_7(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.AttemptOpenCampaignMenu = AttemptOpenCampaignMenu
	arg_25_0.AttemptOpenCoopMenu = AttemptOpenCoopMenu
	arg_25_0.OpenMPMainMenu = OpenMPMainMenu
	arg_25_0.OpenLocalPlayOptionsPopup = OpenLocalPlayOptionsPopup
	arg_25_0._seasonVideoDisplayed = false
	arg_25_0._isDailyChallengesPopupOpened = false
	arg_25_0._isPopupFlowComplete = false
	arg_25_0._magmaUpsellPopupOpened = false
	arg_25_0._canOpenMagmaUpsell = false

	if arg_25_0.MPPlayerDetails and arg_25_0.MPPlayerDetails.HideRankAndProgress then
		arg_25_0.MPPlayerDetails:HideRankAndProgress()
	end

	if CONDITIONS.IsLaunchChunk(arg_25_0) then
		ACTIONS.AnimateSequence(arg_25_0, "LaunchChunk")
	end

	arg_25_0:registerEventHandler("not_below_blocking_fence", function(arg_26_0, arg_26_1)
		Engine.BIGIHAGAAA()

		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			Engine.CDGCBCBAJ("MainMenu menu opened")
		end

		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
		Engine.CDEBADHJJF()
	end)
	assert(arg_25_0.bindButton)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		arg_25_0.isSignInMenu = true
	end

	arg_25_0.bindButton:addEventHandler("button_secondary", function(arg_27_0, arg_27_1)
		if Engine.HDGDBCJFG() then
			if CONDITIONS.ArePartiesEnabledInMainMenu() then
				Engine.DAGFFDGFII("xstopprivateparty 0", arg_25_1)
				Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
			end

			LUI.FlowManager.RequestLeaveMenu(arg_27_0, true, true)
		else
			LUI.FlowManager.RequestPopupMenu(arg_25_0, "quit_popmenu", false, arg_27_1.controller)
		end

		return true
	end)
	arg_25_0:addEventHandler("menu_create", var_0_1)
	arg_25_0.bindButton:addEventHandler("button_alt1", function(arg_28_0, arg_28_1)
		if not CONDITIONS.IsLaunchChunk(arg_25_0) then
			local var_28_0 = LUI.FlowManager.GetScopedData(arg_25_0)

			if var_28_0 and var_28_0.currentSelectedMenuType then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_25_1, false, {
					gameMode = var_28_0.currentSelectedMenuType
				})
			end
		end
	end)
	Engine.DGGGEGCC()

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)

		local var_25_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if not var_25_0 or #var_25_0 == 0 then
			local var_25_1 = Dvar.DHEEJCCJBH("ORMSMKOKL")

			Dvar.BDEHAEGHAF("MOLPOSLOMO", var_25_1)
		end
	else
		Engine.EAIBAGFDCD(CoD.PresenceContext.NOT_IN_GAME)
	end

	if not Engine.HDGDBCJFG() then
		Engine.BHHAAHFCFC()
	end

	Engine.CGIHIFHGAF()
	arg_25_0:addEventHandler("menu_close", function(arg_29_0, arg_29_1)
		Engine.EBCGADABJ()
	end)

	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.CBHCHAFFBG()
	end

	local function var_25_2()
		local var_30_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_25_0.Background:SetScale(var_30_0)
	end

	arg_25_0:addAndCallEventHandler("onVideoChange", var_25_2)

	local function var_25_3(arg_31_0)
		if not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_31_0) then
			arg_25_0.MainMenuBladeLayout:SetupBlades(arg_31_0, MAIN_MENU.BladeType.Shutter, MAIN_MENU.LayoutWidths.Kronos, MAIN_MENU.BladeData)
			ACTIONS.AnimateSequence(arg_25_0, "KronosLayout")
		else
			MAIN_MENU.CleanMagmaBladeNames()
			arg_25_0.MainMenuBladeLayout:SetupBlades(arg_31_0, MAIN_MENU.BladeType.Accordion, MAIN_MENU.LayoutWidths.Magma, MAIN_MENU.BladeDataMagma)
			ACTIONS.AnimateSequence(arg_25_0, "MagmaLayout")
		end
	end

	arg_25_0:addEventHandler("title_purchased", function(arg_32_0, arg_32_1)
		var_25_3(arg_25_1)
	end)

	local var_25_4 = SEASON.GetSeasonPopupIsResetType(arg_25_1)
	local var_25_5 = {
		{
			name = "BLM",
			shouldShowFct = function()
				local var_33_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.BLMFullScreenSeen"):GetValue() or false

				return CONDITIONS.IsPC(arg_25_0) and Dvar.IBEGCHEFE("blm_messaging") and Dvar.IBEGCHEFE("blm_messaging_on_pc_blades") and not var_33_0
			end,
			tryShow = function()
				LUI.FlowManager.RequestPopupMenu(arg_25_0, "BLMFullScreen", true, arg_25_1, false, nil)

				return "BLMFullScreen"
			end,
			postShow = function()
				return
			end
		},
		{
			name = "CinematicFullscreen",
			shouldShowFct = function()
				local var_36_0 = SEASON.GetCurrentSeason()

				if var_36_0 then
					local var_36_1 = Onboarding.SeasonVideo.WasCompleted(arg_25_0, arg_25_1, var_36_0)

					if var_36_1 ~= nil then
						DebugPrint("DEBUG SEASON VIDEO:" .. (var_36_1 and "Season Video is seen" or "Season video is not seen") .. " for season " .. tostring(var_36_0))

						return not var_36_1
					else
						DebugPrint("DEBUG SEASON VIDEO: isVideoSeen is nil")

						return false
					end
				else
					DebugPrint("DEBUG SEASON VIDEO: Season value is nil")

					return false
				end
			end,
			tryShow = function()
				if CONDITIONS.IsDevelopmentBuild() and not Dvar.IBEGCHEFE("showSeasonVideoInDev") then
					DebugPrint(" DEBUG SEASON VIDEO: Skipping season video because of dev build. Turn on showSeasonVideoInDev dvar to see the video in dev builds")

					return false
				end

				if Dvar.IBEGCHEFE("NPPQOLPPO") then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because lui_skip_season_intro_video is turned on")

					return false
				end

				local var_37_0 = SEASON.GetCurrentSeason()

				if var_37_0 == SEASON.KR15Season and Engine.FABABBDBA() then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because KR15+")

					return false
				end

				local var_37_1 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, var_37_0, CSV.seasons.cols.videoName)
				local var_37_2 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				local function var_37_3(arg_38_0)
					return function()
						DebugPrint("In PostVideoFunc")

						if Dvar.IBEGCHEFE("NPLRKNKKOP") then
							DebugPrint("DEBUG SEASON VIDEO: Setting lui_skip_season_video because of autoskipsplashscreen")
							Dvar.DHEGHJJJHI("NKMQMOKNRP", true)
						end

						local var_39_0 = SEASON.GetCurrentSeason()
						local var_39_1 = Onboarding.SeasonVideo:WasCompleted(arg_38_0, var_39_0)

						if var_39_1 ~= nil and not var_39_1 then
							DebugPrint("DEBUG SEASON VIDEO: marking the video as seen")
							Onboarding.SeasonVideo:MarkCompleted(arg_38_0, var_39_0)
						end

						if var_37_2 ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", var_37_2)
						end
					end
				end

				local var_37_4 = Onboarding.SeasonVideo.WasCompleted(arg_25_0, arg_25_1, var_37_0)

				if var_37_4 or var_37_0 <= SEASON.DefaultSeason then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because video is already seen. Current Season = " .. tostring(var_37_0))

					return false
				end

				if var_37_1 == nil or var_37_1 == "" then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because intro video name is not available")

					return false
				end

				DebugPrint("DEBUG SEASON VIDEO: Opening season video")

				arg_25_0._seasonVideoDisplayed = true

				local var_37_5 = {
					disableQuickAccess = true,
					skipImmediate = true,
					skipVideoOnPartyJoin = true,
					video = var_37_1,
					onVideoFinished = var_37_3(arg_25_1),
					unskippable = not var_37_4 and not CONDITIONS.IsDevelopmentBuild()
				}

				LUI.FlowManager.RequestPopupMenu(arg_25_0, "CinematicFullscreen", true, arg_25_1, false, var_37_5)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)

				return "CinematicFullscreen"
			end,
			postShow = function()
				var_25_3(arg_25_1)
			end
		},
		{
			name = "SeasonResetPopup",
			shouldShowFct = function()
				return arg_25_0._seasonVideoDisplayed and var_25_4 and (Engine.CFHBIHABCB(arg_25_1) or Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_25_0, arg_25_1))
			end,
			tryShow = function()
				return SEASON.OpenSeasonResetPopup(arg_25_1)
			end,
			postShow = function()
				return
			end
		},
		{
			name = "SeasonUnlocksPopup",
			shouldShowFct = function()
				return arg_25_0._seasonVideoDisplayed and not var_25_4 and (Engine.CFHBIHABCB(arg_25_1) or Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_25_0, arg_25_1))
			end,
			tryShow = function()
				return SEASON.OpenSeasonUnlockPopup(arg_25_1)
			end,
			postShow = function()
				return
			end
		},
		{
			name = "MagmaUpsellPopup",
			shouldShowFct = function()
				var_25_3(arg_25_1)

				if not Dvar.IBEGCHEFE("LRONQNKRKM") then
					return false
				end

				local var_47_0 = Engine.CFHBIHABCB(arg_25_1)
				local var_47_1 = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_25_0, arg_25_1)
				local var_47_2 = SEASON.GetCurrentSeason()
				local var_47_3 = PlayerData.BFFBGAJGD(arg_25_1, CoD.StatsGroup.Ranked)
				local var_47_4 = 0

				if var_47_3 and var_47_3.brUpsellLastSeenSeason then
					var_47_4 = var_47_3.brUpsellLastSeenSeason:get()
				end

				local var_47_5 = var_47_4 < var_47_2
				local var_47_6 = LUI.FlowManager.IsInStack("BRMainMenu")
				local var_47_7 = PlayerData.BFFBGAJGD(arg_25_1, CoD.StatsGroup.Ranked)

				if var_47_7 and var_47_7.brUpsellLastSeenSeason then
					var_47_7.brUpsellLastSeenSeason:set(SEASON.GetCurrentSeason())
				end

				return not var_47_0 and var_47_1 and var_47_5 and not var_47_6
			end,
			tryShow = function()
				LUI.FlowManager.RequestPopupMenu(element, "MagmaUpsellPopup", true, arg_25_1, false, {
					isPulsed = false
				})

				arg_25_0._magmaUpsellPopupOpened = true

				return "MagmaUpsellPopup"
			end,
			postShow = function()
				return
			end
		}
	}
	local var_25_6 = Engine.DBFFAEEFGJ()

	assert(var_25_6 and var_25_6.flowManager)

	function arg_25_0.showNextPopup()
		local var_50_0 = false

		while not var_50_0 do
			arg_25_0._currentElementIdx = next(var_25_5, arg_25_0._currentElementIdx)

			if arg_25_0._currentElementIdx == nil then
				arg_25_0._isPopupFlowComplete = true

				Dvar.DHEGHJJJHI("RMMMKOSTS", true)

				return
			end

			var_50_0 = arg_25_0.showCurrentPopup()
		end
	end

	function arg_25_0.showCurrentPopup()
		local var_51_0 = var_25_5[arg_25_0._currentElementIdx]

		if var_51_0.shouldShowFct() then
			local var_51_1 = var_51_0.tryShow()
			local var_51_2 = var_25_6.flowManager:GetStackTop(false)

			if var_51_1 and var_51_2 and var_51_2.name == var_51_1 and var_51_2.menu then
				var_51_2.menu:addEventHandler("on_close", function()
					local var_52_0 = var_25_5[arg_25_0._currentElementIdx]

					if var_52_0.postShow then
						var_52_0.postShow()
					end

					arg_25_0.showNextPopup()
				end)

				return true
			elseif var_51_0.postShow then
				var_51_0.postShow()
				Dvar.DHEGHJJJHI("RMMMKOSTS", true)
			end
		end

		return false
	end

	Dvar.DHEGHJJJHI("RMMMKOSTS", true)

	if not MAIN_MENU.TryShowTitleUpdateAvailablePopup() then
		Dvar.DHEGHJJJHI("RMMMKOSTS", false)
		arg_25_0.showNextPopup()
	end

	arg_25_0.openDailyChallengeTimer = LUI.UITimer.new({
		interval = 1000,
		event = "check_and_open_async_popups"
	})
	arg_25_0.openDailyChallengeTimer.id = "openDailyChallengeTimer"

	arg_25_0:addElement(arg_25_0.openDailyChallengeTimer)

	local function var_25_7()
		if not arg_25_0._magmaUpsellPopupOpened and arg_25_0._canOpenMagmaUpsell then
			LUI.FlowManager.RequestPopupMenu(element, "MagmaUpsellPopup", true, arg_25_1, false, {
				isPulsed = true
			})

			arg_25_0._magmaUpsellPopupOpened = true
			arg_25_0._isAnyAsyncPopupOpened = true
		end
	end

	arg_25_0:addEventHandler("check_and_open_async_popups", function(arg_54_0, arg_54_1)
		local var_54_0 = Challenge.GetDailyChallenges(arg_25_1)

		if arg_25_0._isPopupFlowComplete and not arg_25_0._isAnyAsyncPopupOpened then
			local var_54_1 = Engine.CFHBIHABCB(arg_25_1)
			local var_54_2 = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_25_0, arg_25_1)
			local var_54_3 = var_25_6.flowManager:GetVisibleMenu()

			if var_54_3 and var_54_3.id ~= "MainMenu" then
				return
			end

			if (var_54_1 or var_54_2) and var_54_0 and #var_54_0 > 0 then
				local var_54_4 = Challenge.TryOpenDailyPopup(arg_25_1)
				local var_54_5 = var_25_6.flowManager:GetStackTop(false)

				if var_54_4 and var_54_5.name == var_54_4 then
					var_54_5.menu:addEventHandler("on_close", function(arg_55_0, arg_55_1)
						arg_25_0._isAnyAsyncPopupOpened = true

						if not var_54_1 and Dvar.IBEGCHEFE("OMMSLPNSTR") then
							var_25_7()
						end
					end)
				elseif not var_54_1 and var_54_2 and Dvar.IBEGCHEFE("OMMSLPNSTR") then
					var_25_7()
				end
			end
		end
	end)
	arg_25_0:addEventHandler("open_magma_upsell_pulsed", function(arg_56_0, arg_56_1)
		arg_25_0._canOpenMagmaUpsell = true
	end)
end

local function var_0_8()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", true)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
end

function MainMenu(arg_58_0, arg_58_1)
	local var_58_0 = LUI.UIElement.new()

	var_58_0.id = "MainMenu"
	var_58_0._animationSets = var_58_0._animationSets or {}
	var_58_0._sequences = var_58_0._sequences or {}

	local var_58_1 = arg_58_1 and arg_58_1.controllerIndex

	if not var_58_1 and not Engine.DDJFBBJAIG() then
		var_58_1 = var_58_0:getRootController()
	end

	assert(var_58_1)

	local var_58_2 = var_58_0
	local var_58_3
	local var_58_4 = LUI.UIImage.new()

	var_58_4.id = "Background"

	var_58_4:setImage(RegisterMaterial("frontend_main_menu"), 0)
	var_58_0:addElement(var_58_4)

	var_58_0.Background = var_58_4

	local var_58_5
	local var_58_6 = MenuBuilder.BuildRegisteredType("MainMenuBladeLayout", {
		controllerIndex = var_58_1
	})

	var_58_6.id = "MainMenuBladeLayout"

	var_58_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_58_0:addElement(var_58_6)

	var_58_0.MainMenuBladeLayout = var_58_6

	local var_58_7
	local var_58_8 = LUI.UIText.new()

	var_58_8.id = "Copyright"

	var_58_8:SetRGBFromInt(14277081, 0)
	var_58_8:SetAlpha(0, 0)
	var_58_8:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_58_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_58_8:SetAlignment(LUI.Alignment.Center)
	var_58_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -79, _1080p * -55)
	var_58_0:addElement(var_58_8)

	var_58_0.Copyright = var_58_8

	local var_58_9

	if CONDITIONS.IsXboxLive(var_58_0) then
		local var_58_10 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_58_1
		})

		var_58_10.id = "Gamertag"

		var_58_10:SetRGBFromTable(SWATCHES.MainMenu.ButtonMain, 0)
		var_58_10.TextLabel:SetAlignment(LUI.Alignment.Left)
		var_58_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 86, _1080p * 116)
		var_58_0:addElement(var_58_10)

		var_58_0.Gamertag = var_58_10
	end

	local var_58_11
	local var_58_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_58_1
	})

	var_58_12.id = "HelperBar"

	var_58_12.Background:SetAlpha(0.2, 0)
	var_58_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_58_0:addElement(var_58_12)

	var_58_0.HelperBar = var_58_12

	local var_58_13

	if CONDITIONS.IsUserSignedInDemonware(var_58_1) then
		var_58_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_58_1
		})
		var_58_13.id = "MPPlayerDetails"

		var_58_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_58_0:addElement(var_58_13)

		var_58_0.MPPlayerDetails = var_58_13
	end

	local var_58_14

	if CONDITIONS.IsSocialEnabledInMainMenu(var_58_0) then
		var_58_14 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
			controllerIndex = var_58_1
		})
		var_58_14.id = "PartyWidget"

		var_58_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
		var_58_0:addElement(var_58_14)

		var_58_0.PartyWidget = var_58_14
	end

	local function var_58_15()
		return
	end

	var_58_0._sequences.DefaultSequence = var_58_15

	local var_58_16
	local var_58_17 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_58_8:RegisterAnimationSequence("ShowCopyright", var_58_17)

	local function var_58_18()
		var_58_8:AnimateSequence("ShowCopyright")
	end

	var_58_0._sequences.ShowCopyright = var_58_18

	local var_58_19

	if CONDITIONS.IsUserSignedInDemonware(var_58_1) then
		local var_58_20 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 100
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 160
			}
		}

		var_58_13:RegisterAnimationSequence("LaunchChunk", var_58_20)
	end

	if CONDITIONS.IsSocialEnabledInMainMenu(var_58_0) then
		local var_58_21 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 140
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 310
			}
		}

		var_58_14:RegisterAnimationSequence("LaunchChunk", var_58_21)
	end

	local function var_58_22()
		if CONDITIONS.IsUserSignedInDemonware(var_58_1) then
			var_58_13:AnimateSequence("LaunchChunk")
		end

		if CONDITIONS.IsSocialEnabledInMainMenu(var_58_0) then
			var_58_14:AnimateSequence("LaunchChunk")
		end
	end

	var_58_0._sequences.LaunchChunk = var_58_22

	local var_58_23
	local var_58_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.MagmaLayout
		}
	}

	var_58_4:RegisterAnimationSequence("MagmaLayout", var_58_24)

	local function var_58_25()
		var_58_4:AnimateSequence("MagmaLayout")
	end

	var_58_0._sequences.MagmaLayout = var_58_25

	local var_58_26
	local var_58_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.KronosLayout
		}
	}

	var_58_4:RegisterAnimationSequence("KronosLayout", var_58_27)

	local function var_58_28()
		var_58_4:AnimateSequence("KronosLayout")
	end

	var_58_0._sequences.KronosLayout = var_58_28

	function var_58_0.addButtonHelperFunction(arg_64_0, arg_64_1)
		arg_64_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_58_0:addEventHandler("menu_create", var_58_0.addButtonHelperFunction)

	local var_58_29 = LUI.UIBindButton.new()

	var_58_29.id = "selfBindButton"

	var_58_0:addElement(var_58_29)

	var_58_0.bindButton = var_58_29

	var_0_7(var_58_0, var_58_1, arg_58_1)

	return var_58_0
end

MenuBuilder.registerType("MainMenu", MainMenu)
LUI.FlowManager.RegisterStackPushBehaviour("MainMenu", var_0_8)
LockTable(_M)
