module(..., package.seeall)

CDN_POPUP_IMAGE = "icon_warning_texture"
POPUP_WITH_UNINSTALL = 1
POPUP_WITH_UNINSTALL_AND_ENABLE = 2
POPUP_WITH_ENABLE = 3
FOCUSED_OPTION_NAME = "TextureDownloadExpander"
FOCUSED_TAB_NAME = "general"
CAMPAIGN_UNINSTALL_IMAGE = "icon_campaign_uninstall"
CAMPAIGN_PACKS_TO_UNINSTALL = ""
CAMPAIGN_UNINSTALL_MENU_COUNT = 3
CAMPAIGN_UNINSTALL_REMIND_TIME = 604800

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
	"contracts",
	"catalog"
})

if Engine.HDGDBCJFG() then
	LUI.FlowManager.RequestSetStack("MainMenu", {
		{
			name = "MainLockoutMenu"
		}
	})
end

local function var_0_0(arg_1_0, arg_1_1)
	THEMES.UpdateTheme({
		isMainMenu = true
	})
	arg_1_0.bindButton:addEventHandler("button_start", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.controller or controllerIndex

		ACTIONS.OpenOptionsMenu(var_2_0)
	end)
	arg_1_0:AddButtonPrompt({
		clickable = true,
		priority = 4,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	if Engine.HDGDBCJFG() then
		arg_1_0:AddButtonPrompt({
			clickable = true,
			priority = 1,
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_1_0.bindButton:addEventHandler("button_r3", function(arg_3_0, arg_3_1)
			local var_3_0 = arg_3_1.controller or controllerIndex

			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, var_3_0, false)
		end)

		local var_1_0 = {
			side = "left",
			priority = 3,
			kbmTooltipPromptOverload = "button_r3",
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")
		}

		arg_1_0:AddButtonPrompt(var_1_0, promptOptions)
	else
		assert(arg_1_0.HelperBar)

		local var_1_1 = arg_1_0._overrideMenu ~= "" and "LUA_MENU/BACK" or "LUA_MENU/QUIT_DESKTOP"

		arg_1_0:AddButtonPrompt({
			clickable = true,
			priority = 1,
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC(var_1_1)
		})

		if CONDITIONS.IsBattleNetModifyInstallEnabled() then
			arg_1_0:AddButtonPrompt({
				clickable = true,
				priority = 3,
				side = "left",
				kbmTooltipPromptOverload = "button_r3",
				button_ref = "button_r3",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODIFY_INSTALL")
			})
		end

		arg_1_0.HelperBar:processEvent({
			name = "ignore_game_mode_layout",
			controller = controllerIndex
		})
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1.controller)
	end

	arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.controller or controllerIndex

		ACTIONS.OpenAccessibilityOptionsMenu(var_4_0)
	end)
	arg_1_0:AddButtonPrompt({
		clickable = true,
		priority = 5,
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/ACCESSIBILITY")
	})
	Dvar.DHEGHJJJHI("ui_skipMainLockout", false)
	Dvar.DHEGHJJJHI("NNPMRQSQN", true)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		if not Lobby.GFFECBCCF() then
			Engine.DAGFFDGFII("xstartprivateparty", arg_1_1.controller)
		end

		Lobby.EAHFJBBBBD(PartyUIRoot.MAIN_MENU)
	end

	LUI.WebViewManager.Instance():ResetContext()
end

local function var_0_1()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
end

local function var_0_2()
	if not CONDITIONS.ArePartiesEnabledInMainMenu() then
		Dvar.DHEGHJJJHI("splitscreen", false)
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	end

	var_0_1()
end

local function var_0_3()
	Dvar.DHEGHJJJHI("splitscreen", false)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	var_0_1()
end

local function var_0_4(arg_8_0)
	assert(arg_8_0)
	Engine.CDGCBCBAJ("Pressed a Main Menu button", arg_8_0)
end

function ConfirmOpenCampaignMenu()
	local var_9_0 = Engine.IJEBHJIJF()

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.JEDFGECDJ() > 1 then
		var_9_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(var_9_0, true)
	end

	local var_9_1 = ONBOARDING_DATA.GetOnboardingMatureContentData()

	function var_9_1.confirmButton.action(arg_10_0, arg_10_1)
		ACTIONS.LeaveMenu(arg_10_0)
		LUI.FlowManager.RequestAddMenu("CampaignMenu", true, arg_10_1, false, nil, false)
	end

	LUI.FlowManager.RequestPopupMenu(self, "OnboardingFeaturePopup", true, var_9_0, false, var_9_1)
end

function ConfirmOpenCoopMenu()
	local var_11_0 = Engine.IJEBHJIJF()

	var_0_2()

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		var_0_4(var_11_0)
	end

	Engine.EBCGADABJ()

	if CP.HasSeenIntro(var_11_0, 0) == 0 then
		local var_11_1 = "cp_opening_cine_intro"
		local var_11_2 = {
			disableQuickAccess = true,
			cpIntro = true,
			video = var_11_1
		}

		LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, var_11_0, false, var_11_2)
	else
		LUI.FlowManager.RequestAddMenu("CPMainMenu", false, var_11_0, false, nil, true)
	end
end

function OpenMPMainMenu(arg_12_0, arg_12_1, arg_12_2)
	if CONDITIONS.ShouldCheckDLC() then
		local function var_12_0(arg_13_0, arg_13_1)
			if Engine.CFHBIHABCB(arg_13_1) then
				if CONDITIONS.IsBattleNetModifyInstallEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_13_1, false)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_13_1, false)
				end
			end
		end

		local var_12_1 = CoD.CheckForMissingMPDataPacks()

		if var_12_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "PopupOK", true, arg_12_1, false, {
				message = var_12_1,
				action = var_12_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("NPNQOLKSLP") == true then
		local var_12_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_12_2, nil, false, true)

		return
	end

	local var_12_3 = false
	local var_12_4 = Engine.CGEFDFCIJA()

	if var_12_4 > 1 then
		for iter_12_0 = 0, var_12_4 - 1 do
			local var_12_5 = CoD.PartyMemberHasAllMapPacksForMode(iter_12_0, CoD.MP_PACKS)
			local var_12_6 = Engine.CBBGEEFIFI(iter_12_0)

			if not var_12_5 and var_12_6 then
				var_12_3 = true

				break
			end
		end
	end

	if var_12_3 then
		LUI.FlowManager.RequestPopupMenu(arg_12_0, "Disband_Party_Enter_DLC_Mode_Popup", true, arg_12_1, false, {
			mpMainMenuOptions = arg_12_2
		})
	else
		AttemptOpenMPMenuAfterDLCModePopup(arg_12_0, arg_12_1, arg_12_2)
	end
end

function AttemptOpenMPMenuAfterDLCModePopup(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = Engine.CGEFDFCIJA()
	local var_14_1 = Engine.CBCEBADAJ(CoD.PlayMode.Core)

	if var_14_1 < var_14_0 then
		LUI.FlowManager.RequestPopupMenu(arg_14_0, "OpeningMenuWithHighPrivatePartyMemberCountWarning", true, arg_14_1, false, {
			currentCount = var_14_0,
			maxCount = var_14_1
		})
	else
		var_0_2()

		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			var_0_4(arg_14_1)
		end

		local var_14_2 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestAddMenu("MPMainMenu", false, var_14_2, false, arg_14_2)
	end
end

function OpenLocalPlayOptionsPopup(arg_15_0)
	local var_15_0 = Engine.IJEBHJIJF()

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.JEDFGECDJ() > 1 then
		var_15_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(var_15_0, true)
	end

	LUI.FlowManager.RequestPopupMenu(arg_15_0, "ChooseLocalPlay", false, var_15_0, false, {
		dvarResetFunction = var_0_3
	})
end

function AttemptOpenCampaignMenu(arg_16_0, arg_16_1)
	if Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) or Engine.FABABBDBA() then
		return
	end

	if CONDITIONS.ShouldCheckDLC() then
		local function var_16_0(arg_17_0, arg_17_1)
			if Engine.CFHBIHABCB(arg_17_1) then
				if CONDITIONS.IsBattleNetModifyInstallEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_17_1, false)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_17_1, false)
				end
			end
		end

		local var_16_1 = CoD.CheckForMissingSPDataPacks()

		if var_16_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_16_0, "PopupOK", true, arg_16_1, false, {
				message = var_16_1,
				action = var_16_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MSRRMTLOQP") == true then
		local var_16_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_16_2, nil, false, true)

		return
	end

	local var_16_3 = true

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		if Lobby.IsNotAloneInPrivateParty() then
			LUI.FlowManager.RequestPopupMenu(arg_16_0, "ConfirmShouldBreakupPrivateParty", true, arg_16_1, false, {
				yesAction = ConfirmOpenCampaignMenu
			})

			var_16_3 = false
		elseif Engine.JEDFGECDJ() > 1 then
			LUI.FlowManager.RequestPopupMenu(arg_16_0, "OpeningMenuWithSplitscreenWarning", true, arg_16_1, false, {
				yesAction = ConfirmOpenCampaignMenu
			})

			var_16_3 = false
		elseif Engine.BJIBIJHDFJ() then
			LUI.FlowManager.RequestPopupMenu(arg_16_0, "OpeningMenuWithSplitscreenPartyMemberWarning", true, arg_16_1, false)

			var_16_3 = false
		end
	end

	if var_16_3 then
		ConfirmOpenCampaignMenu(nil, arg_16_1)
	end
end

function AttemptOpenCoopMenu(arg_18_0, arg_18_1)
	if CONDITIONS.ShouldCheckDLC() then
		local function var_18_0(arg_19_0, arg_19_1)
			if Engine.CFHBIHABCB(arg_19_1) then
				if CONDITIONS.IsBattleNetModifyInstallEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_19_1, false)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_19_1, false)
				end
			end
		end

		Engine.EBCBBHIJHJ()

		local var_18_1 = CoD.CheckForMissingCPDataPacks()

		if var_18_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_18_0, "PopupOK", true, arg_18_1, false, {
				message = var_18_1,
				action = var_18_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MQNSRRKQOT") == true then
		local var_18_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_18_2, nil, false, true)

		return
	end

	local var_18_3 = false
	local var_18_4 = Engine.CGEFDFCIJA()

	if var_18_4 > 1 then
		for iter_18_0 = 0, var_18_4 - 1 do
			local var_18_5 = CoD.PartyMemberHasAllMapPacksForMode(iter_18_0, CoD.CP_PACKS)
			local var_18_6 = Engine.CBBGEEFIFI(iter_18_0)

			if not var_18_5 and var_18_6 then
				var_18_3 = true

				break
			end
		end
	end

	if var_18_3 then
		LUI.FlowManager.RequestPopupMenu(arg_18_0, "Disband_Party_Enter_DLC_Mode_Popup", true, arg_18_1, false, nil)
	else
		AttemptOpenCPMenuAfterDLCModePopup(arg_18_0, arg_18_1)
	end
end

function AttemptOpenCPMenuAfterDLCModePopup(arg_20_0, arg_20_1)
	local var_20_0 = Engine.CGEFDFCIJA()
	local var_20_1 = Engine.CBCEBADAJ(CoD.PlayMode.Aliens)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		if var_20_1 < var_20_0 then
			LUI.FlowManager.RequestPopupMenu(arg_20_0, "OpeningMenuWithHighPrivatePartyMemberCountWarning", true, arg_20_1, false, {
				currentCount = var_20_0,
				maxCount = var_20_1
			})
		elseif Engine.BJIBIJHDFJ() then
			local function var_20_2()
				ConfirmOpenCoopMenu()
			end

			if Lobby.SplitScreenChecksPassed(arg_20_0, arg_20_1, var_20_2) then
				ConfirmOpenCoopMenu()
			end
		else
			ConfirmOpenCoopMenu()
		end
	end
end

function DisbandPartyEnterDLCModePopup(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.controllerIndex

	assert(var_22_0)

	local var_22_1 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("MENU/DISBANDPARTYENTERDLCMODEPARTYHOST"),
		yesAction = function(arg_23_0, arg_23_1)
			if arg_22_1.mpMainMenuOptions then
				AttemptOpenMPMenuAfterDLCModePopup(arg_23_0, arg_22_1.controllerIndex, arg_22_1.mpMainMenuOptions)
			else
				AttemptOpenCPMenuAfterDLCModePopup(arg_23_0, arg_22_1.controllerIndex)
			end
		end
	}
	local var_22_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_22_1)

	var_22_2.id = "Disband_Party_Enter_DLC_Mode_Popup"

	return var_22_2
end

MenuBuilder.registerType("Disband_Party_Enter_DLC_Mode_Popup", DisbandPartyEnterDLCModePopup)

local function var_0_5()
	local var_24_0 = {
		cancel_will_close = false,
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/TITLE_UPDATE_AVAILABLE"),
		button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		confirmation_action = function()
			Engine.DJEDDFJEIG()
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "generic_confirmation_popup", false, nil, false, var_24_0)

	return "TitleUpdateAvailablePopup"
end

local function var_0_6(arg_26_0)
	local var_26_0 = "NMKTMRRMKN"
	local var_26_1 = "hasSeenDLCRemasterInfoPopup"

	return {
		name = "DLCRemasterInfoPopup",
		shouldShowFct = function()
			local var_27_0 = Engine.CIEGIACHAE() or Engine.DGGIJADHJI() or Engine.DHHIJGFHF() or Engine.CJEHADCJDB() or Engine.BJBBFFIFAC()

			return Dvar.IBEGCHEFE(var_26_0) and Engine.BECCFCBIAA(var_26_1, arg_26_0) ~= 1 and var_27_0 and Engine.CFHBIHABCB(arg_26_0)
		end,
		tryShow = function()
			DebugPrint("DEBUG Main Menu popups: Opening DLC Remaster Info popup")
			Engine.DFJDIFJEGA(var_26_1, 1, arg_26_0)

			local var_28_0 = {
				title = Engine.CBBHFCGDIC("LUA_MENU/DLC_REMASTER_INFO_TITLE"),
				message = Engine.CBBHFCGDIC("PLATFORM/DLC_REMASTER_INFO_DESC"),
				buttons = {
					{
						label = Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"),
						action = function()
							return
						end
					}
				}
			}

			LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, arg_26_0, false, var_28_0, nil, true, true)

			return "GenericConfirmPopup"
		end,
		postShow = function()
			return
		end
	}
end

local function var_0_7(arg_31_0, arg_31_1)
	return {
		name = "XB3CDNPopup",
		shouldShowFct = function()
			local var_32_0 = Engine.BECCFCBIAA("hasSeenCDNPopup", arg_31_1) == 1
			local var_32_1 = Dvar.IBEGCHEFE("NKNLTNNMMS")
			local var_32_2 = StreamHTTP.DECHFDIAFC() >= 22
			local var_32_3 = StreamHTTP.DDGGFAEGID()
			local var_32_4 = CONDITIONS.UserHasATexturePack() ~= 0
			local var_32_5 = Engine.IDICJHGG()

			arg_31_0.popupVersion = 0

			if var_32_2 or var_32_3 then
				if var_32_4 then
					arg_31_0.popupVersion = POPUP_WITH_UNINSTALL
				else
					return false
				end
			elseif var_32_4 then
				arg_31_0.popupVersion = var_32_5 and POPUP_WITH_UNINSTALL or POPUP_WITH_UNINSTALL_AND_ENABLE
			elseif var_32_5 then
				return false
			else
				arg_31_0.popupVersion = POPUP_WITH_ENABLE
			end

			return var_32_1 and not var_32_0
		end,
		tryShow = function()
			Engine.DFJDIFJEGA("hasSeenCDNPopup", 1, arg_31_1)

			local var_33_0 = {
				label = Engine.CBBHFCGDIC("MENU/ENABLE_ON_DEMAND_TEXTURE_STREAMING"),
				action = function()
					ACTIONS.OpenOptionsMenu(arg_31_1, FOCUSED_TAB_NAME, "", FOCUSED_OPTION_NAME)
				end
			}
			local var_33_1 = {
				label = Engine.CBBHFCGDIC("MENU/OPEN_TEXTURE_PACKS_UNINSTALL_INSTRUCTIONS"),
				action = function()
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_31_1, false)
				end
			}
			local var_33_2 = {
				label = Engine.CBBHFCGDIC("MENU/DISMISS"),
				action = function()
					return
				end
			}
			local var_33_3 = {
				itemImage = CDN_POPUP_IMAGE
			}

			if arg_31_0.popupVersion == POPUP_WITH_UNINSTALL then
				var_33_3.title = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_TITLE_TEXTUREPACKSONLY")
				var_33_3.message = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_BODY_TEXTUREPACKSONLY")
				var_33_3.buttons = {
					var_33_1,
					var_33_2
				}
			elseif arg_31_0.popupVersion == POPUP_WITH_UNINSTALL_AND_ENABLE then
				var_33_3.title = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_TITLE")
				var_33_3.message = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_BODY_WITHTEXTUREPACKS")
				var_33_3.buttons = {
					var_33_1,
					var_33_0,
					var_33_2
				}
			elseif arg_31_0.popupVersion == POPUP_WITH_ENABLE then
				var_33_3.title = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_TITLE")
				var_33_3.message = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_BODY_NOTEXTUREPACKS")
				var_33_3.buttons = {
					var_33_0,
					var_33_2
				}
			else
				DebugPrint("CDN Popup showed but shouldn't")
			end

			LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, arg_31_1, false, var_33_3, nil, true, true)

			return "GenericConfirmPopup"
		end,
		postShow = function()
			return
		end
	}
end

local function var_0_8(arg_38_0, arg_38_1)
	return {
		name = "PS4CDNPopup",
		shouldShowFct = function()
			local var_39_0 = Engine.BECCFCBIAA("hasSeenCDNPopup", arg_38_1) == 1
			local var_39_1 = Dvar.IBEGCHEFE("NKNLTNNMMS")
			local var_39_2 = StreamHTTP.DECHFDIAFC() >= 22
			local var_39_3 = StreamHTTP.DDGGFAEGID()
			local var_39_4 = Engine.BDFBGADHAH()

			return var_39_1 and not var_39_0 and not var_39_2 and not var_39_3 and not var_39_4
		end,
		tryShow = function()
			Engine.DFJDIFJEGA("hasSeenCDNPopup", 1, arg_38_1)

			local var_40_0 = {
				label = Engine.CBBHFCGDIC("MENU/ENABLE_ON_DEMAND_TEXTURE_STREAMING"),
				action = function()
					ACTIONS.OpenOptionsMenu(arg_38_1, FOCUSED_TAB_NAME, "", FOCUSED_OPTION_NAME)
				end
			}
			local var_40_1 = {
				label = Engine.CBBHFCGDIC("MENU/DISMISS"),
				action = function()
					return
				end
			}
			local var_40_2 = {
				title = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_TITLE"),
				message = Engine.CBBHFCGDIC("MENU/CDN_STREAMING_BOOTPOPUP_BODY_NOTEXTUREPACKS"),
				itemImage = CDN_POPUP_IMAGE,
				buttons = {
					var_40_0,
					var_40_1
				}
			}

			LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, arg_38_1, false, var_40_2, nil, true, true)

			return "GenericConfirmPopup"
		end,
		postShow = function()
			return
		end
	}
end

local function var_0_9(arg_44_0, arg_44_1)
	return {
		name = "UninstallCampaignPopup",
		shouldShowFct = function()
			if Engine.BECCFCBIAA("neverShowCampaignUninstallPopup", arg_44_1) == 1 then
				return false
			end

			local var_45_0 = SPSharedUtils.HasCompletedCampaign(arg_44_1)
			local var_45_1 = false

			CAMPAIGN_PACKS_TO_UNINSTALL = ""

			for iter_45_0, iter_45_1 in ipairs(CoD.CAMPAIGN_UNINSTALL_PACKS) do
				if Engine.BAJHDFAJJF(iter_45_1.index) then
					var_45_1 = true

					if CAMPAIGN_PACKS_TO_UNINSTALL ~= "" then
						CAMPAIGN_PACKS_TO_UNINSTALL = CAMPAIGN_PACKS_TO_UNINSTALL .. ","
					end

					CAMPAIGN_PACKS_TO_UNINSTALL = CAMPAIGN_PACKS_TO_UNINSTALL .. iter_45_1.packProductId
				end
			end

			if Dvar.IBEGCHEFE("MKQKQLSOKS") then
				return true
			end

			local var_45_2 = false
			local var_45_3 = Engine.BECCFCBIAA("hasSeenCampaignUninstallPopup", arg_44_1) == 1

			if var_45_1 and var_45_0 then
				if var_45_3 then
					local var_45_4 = Engine.DEIDGHDBHD()
					local var_45_5 = Engine.BECCFCBIAA("lastCampaignUninstallPromptTime", arg_44_1)
					local var_45_6 = Dvar.CFHDGABACF("NORTQPSRSM")

					if var_45_6 then
						CAMPAIGN_UNINSTALL_REMIND_TIME = var_45_6
					end

					if var_45_4 > var_45_5 + CAMPAIGN_UNINSTALL_REMIND_TIME then
						var_45_2 = true
					end
				else
					local var_45_7 = Engine.BECCFCBIAA("lastCampaignUninstallPromptTime", arg_44_1)
					local var_45_8 = Dvar.CFHDGABACF("MKNLOTLKLO")

					if var_45_8 then
						CAMPAIGN_UNINSTALL_MENU_COUNT = var_45_8
					end

					if var_45_7 >= CAMPAIGN_UNINSTALL_MENU_COUNT then
						var_45_2 = true
					else
						local var_45_9 = var_45_7 + 1

						Engine.DFJDIFJEGA("lastCampaignUninstallPromptTime", var_45_9, arg_44_1)
					end
				end
			end

			return var_45_2
		end,
		tryShow = function()
			Engine.DFJDIFJEGA("hasSeenCampaignUninstallPopup", 1, arg_44_1)

			local var_46_0 = Engine.DEIDGHDBHD()

			Engine.DFJDIFJEGA("lastCampaignUninstallPromptTime", var_46_0, arg_44_1)

			local var_46_1

			if Engine.CIEGIACHAE() then
				var_46_1 = {
					label = Engine.CBBHFCGDIC("MENU/UNINSTALL_CAMPAIGN_PACKS"),
					action = function()
						local function var_47_0()
							Dvar.BDEHAEGHAF("LRTQKNLLMO", CAMPAIGN_PACKS_TO_UNINSTALL)
							Dvar.DHEGHJJJHI("MKKNSMLKPR", true)
							Dvar.BDEHAEGHAF("LQSPQSNQSN", "LUA_MENU/UNINSTALL_COMPLETED")
							Engine.EBCGADABJ()
						end

						local var_47_1 = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL_PACK_DESC", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_PACKS")))

						for iter_47_0, iter_47_1 in ipairs(CoD.CAMPAIGN_UNINSTALL_PACKS) do
							if Engine.BAJHDFAJJF(iter_47_1.index) then
								var_47_1 = var_47_1 .. "\n"
								var_47_1 = var_47_1 .. iter_47_1.uninstallStringId
							end
						end

						local var_47_2 = {
							header = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL_PACK", Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_PACKS")),
							message = var_47_1,
							YesAction = var_47_0
						}

						LUI.FlowManager.RequestPopupMenu(nil, "GameUninstallPopup", true, arg_44_1, false, var_47_2)
					end
				}
			elseif Engine.BAHIIBFDDG() then
				var_46_1 = {
					label = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/FILE_MANAGEMENT")),
					action = function()
						LUI.FlowManager.RequestLeaveMenu(element, false, false)
						LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_44_1, false)
					end
				}
			end

			local var_46_2 = {
				label = Engine.CBBHFCGDIC("MENU/STILL_PLAYING_CAMPAIGN"),
				action = function()
					Engine.DFJDIFJEGA("neverShowCampaignUninstallPopup", 1, arg_44_1)
				end
			}
			local var_46_3 = {
				label = Engine.CBBHFCGDIC("MENU/REMIND_ME_LATER"),
				action = function()
					return
				end
			}
			local var_46_4 = 27.61
			local var_46_5 = {
				title = Engine.CBBHFCGDIC("MENU/CAMPAIGN_UNINSTALL_PROMPT_TITLE"),
				message = Engine.CBBHFCGDIC("MENU/CAMPAIGN_UNINSTALL_PROMPT_BODY", var_46_4),
				itemImage = CAMPAIGN_UNINSTALL_IMAGE,
				imageTitle = Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_GIGABYTE", var_46_4)
			}

			var_46_5.clearImageTint = true
			var_46_5.resizeForOverflow = true
			var_46_5.buttons = {
				var_46_1,
				var_46_2,
				var_46_3
			}

			LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, arg_44_1, false, var_46_5, nil, true, true)

			return "GenericConfirmPopup"
		end,
		postShow = function()
			return
		end
	}
end

local function var_0_10(arg_53_0, arg_53_1)
	local var_53_0 = Dvar.IBEGCHEFE("PTQMQOKQ")

	if Engine.CGABICJHAI() and var_53_0 and Engine.BECCFCBIAA("hasUpdatedForSQCDN", arg_53_1) == 0 then
		local var_53_1 = Engine.BECCFCBIAA("httpDownloadTexturesEnable", arg_53_1) ~= 0
		local var_53_2 = Engine.BECCFCBIAA("httpDownloadTexturesQuality", arg_53_1) ~= 0

		if not var_53_1 then
			Engine.DFJDIFJEGA("httpDownloadTexturesEnable", 1, arg_53_1)
			Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 0, arg_53_1)
			Dvar.DHEGHJJJHI("MSRSNMNKQP", true)
		end

		if var_53_1 and not var_53_2 then
			Engine.DFJDIFJEGA("httpDownloadTexturesQuality", 1, arg_53_1)
			Dvar.DHEGHJJJHI("MSRSNMNKQP", true)
		end

		Engine.DFJDIFJEGA("hasUpdatedForSQCDN", 1, arg_53_1)
	end
end

local function var_0_11(arg_54_0, arg_54_1)
	local var_54_0 = false

	if Dvar.IBEGCHEFE("LNTLOLLNQN") then
		local var_54_1 = Engine.DBFFAEEFGJ()

		assert(var_54_1 and var_54_1.flowManager)

		local var_54_2 = var_54_1.flowManager:GetStackTop(false)
		local var_54_3 = var_54_1.flowManager:GetStackTop(true)

		if var_54_3 and var_54_3.name == "MainMenu" then
			local var_54_4 = Dvar.DHEEJCCJBH("auto_mode")
			local var_54_5

			if var_54_4 and var_54_4 ~= "" then
				if var_54_4 == "mp" then
					var_54_5 = MAIN_MENU.GameModeEnumValues.MP
				elseif var_54_4 == "wz" then
					var_54_5 = MAIN_MENU.GameModeEnumValues.BR
				elseif var_54_4 == "cp" then
					var_54_5 = MAIN_MENU.GameModeEnumValues.CP
				elseif var_54_4 == "sp" then
					var_54_5 = MAIN_MENU.GameModeEnumValues.SP
				end
			end

			if var_54_5 then
				local var_54_6 = var_54_5 == MAIN_MENU.GameModeEnumValues.BR

				var_54_6 = var_54_6 or Engine.ECHHDAIBD(var_54_5) == ContentProgressState.INSTALLED

				if var_54_6 then
					if var_54_5 == MAIN_MENU.GameModeEnumValues.MP then
						arg_54_0:OpenMPMainMenu(arg_54_1, {
							activeTabIndex = 0
						})

						var_54_0 = true
					elseif var_54_5 == MAIN_MENU.GameModeEnumValues.BR then
						Lobby.AttemptOpenBRMenu(arg_54_1, {})

						var_54_0 = true
					elseif var_54_5 == MAIN_MENU.GameModeEnumValues.CP then
						arg_54_0:AttemptOpenCoopMenu(arg_54_1)

						var_54_0 = true
					elseif var_54_5 == MAIN_MENU.GameModeEnumValues.SP then
						arg_54_0:AttemptOpenCampaignMenu(arg_54_1)

						var_54_0 = true
					end
				else
					MAIN_MENU.InstallAction(arg_54_0, arg_54_1, var_54_5)
				end
			end

			Dvar.BDEHAEGHAF("auto_mode", "")
		end
	else
		Dvar.BDEHAEGHAF("auto_mode", "")
	end

	return var_54_0
end

local function var_0_12(arg_55_0, arg_55_1)
	arg_55_0:_doAutoNav(arg_55_1)
end

local function var_0_13(arg_56_0, arg_56_1)
	if arg_56_0._overrideMenu and arg_56_0._overrideMenu == "CW" then
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.Shutter, MAIN_MENU.LayoutWidths.Kronos, MAIN_MENU.BladeDataCW)
		ACTIONS.AnimateSequence(arg_56_0, "KronosLayout")
	elseif arg_56_0._overrideMenu and arg_56_0._overrideMenu == "MW" then
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.Shutter, MAIN_MENU.LayoutWidths.Kronos, MAIN_MENU.BladeDataMWCore)
		ACTIONS.AnimateSequence(arg_56_0, "KronosLayout")
	elseif Dvar.IBEGCHEFE("OLMTRQORKQ") then
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.AccordionRefresh, MAIN_MENU.LayoutWidths.Magma, MAIN_MENU.BladeDataEmbedButtonsForCortez, MAIN_MENU.BladeKeysOrderOverrideCortez)
		ACTIONS.AnimateSequence(arg_56_0, "WZRefreshLayout")
	elseif Dvar.IBEGCHEFE("MTLSRSQQRK") then
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.AccordionRefresh, MAIN_MENU.LayoutWidths.Magma, MAIN_MENU.BladeDataEmbedButtonsForHQ)
		ACTIONS.AnimateSequence(arg_56_0, "WZRefreshLayout")
	elseif Dvar.IBEGCHEFE("wz_enable_blades_refresh") then
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.AccordionRefresh, MAIN_MENU.LayoutWidths.Magma, MAIN_MENU.BladeDataEmbedButtons)
		ACTIONS.AnimateSequence(arg_56_0, "WZRefreshLayout")
	elseif not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_56_1) then
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.Shutter, MAIN_MENU.LayoutWidths.Kronos, MAIN_MENU.BladeData)
		ACTIONS.AnimateSequence(arg_56_0, "KronosLayout")
	else
		MAIN_MENU.CleanMagmaBladeNames()
		arg_56_0.MainMenuBladeLayout:SetupBlades(arg_56_1, MAIN_MENU.BladeType.Accordion, MAIN_MENU.LayoutWidths.Magma, MAIN_MENU.BladeDataMagma)
		ACTIONS.AnimateSequence(arg_56_0, "MagmaLayout")
	end
end

local function var_0_14(arg_57_0)
	if Engine.DDJFBBJAIG() and CONDITIONS.IsBladeBannerActive() then
		if MAIN_MENU.IsCortezReleaseCountdown() then
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "CortezTheme")
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "EventCountdown")
			arg_57_0.NewGameRevealBanner.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_CAPS")))
		elseif MAIN_MENU.IsCortezNowAvailable() then
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "CortezTheme")
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "EventLive")
			arg_57_0.NewGameRevealBanner.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_CAPS")))
		elseif MAIN_MENU.IsStyxReleaseCountdown() then
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "StyxTheme")
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "EventCountdown")
			arg_57_0.NewGameRevealBanner.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/STYX_CAPS")))
		elseif MAIN_MENU.IsStyxNowAvailable() then
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "StyxTheme")
			ACTIONS.AnimateSequence(arg_57_0.NewGameRevealBanner, "EventLive")
			arg_57_0.NewGameRevealBanner.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/STYX_CAPS")))
		end
	end
end

local function var_0_15(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.AttemptOpenCampaignMenu = AttemptOpenCampaignMenu
	arg_58_0.AttemptOpenCoopMenu = AttemptOpenCoopMenu
	arg_58_0.OpenMPMainMenu = OpenMPMainMenu
	arg_58_0.OpenLocalPlayOptionsPopup = OpenLocalPlayOptionsPopup
	arg_58_0.SetupMenuBlades = var_0_13
	arg_58_0.SetupBladesBanner = var_0_14
	arg_58_0._isDailyChallengesPopupOpened = false
	arg_58_0._isPopupFlowComplete = false
	arg_58_0._magmaUpsellPopupOpened = false
	arg_58_0._canOpenMagmaUpsell = false
	arg_58_0._overrideMenu = arg_58_2.overrideMenu or ""
	arg_58_0._doAutoNav = var_0_11
	arg_58_0.MovedToStackTop = var_0_12

	CoD.CheckAndApplyResetSeasonalPlayerData(arg_58_1)
	CoD.CheckAndApplySeasonalEventPlayerData(arg_58_0, arg_58_1)

	if arg_58_0.MPPlayerDetails and arg_58_0.MPPlayerDetails.HideRankAndProgress then
		arg_58_0.MPPlayerDetails:HideRankAndProgress()
	end

	if CONDITIONS.IsLaunchChunk(arg_58_0) then
		ACTIONS.AnimateSequence(arg_58_0, "LaunchChunk")
	end

	arg_58_0:registerEventHandler("not_below_blocking_fence", function(arg_59_0, arg_59_1)
		Engine.BIGIHAGAAA()

		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			Engine.CDGCBCBAJ("MainMenu menu opened")
		end

		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
		Engine.CDEBADHJJF()
	end)
	assert(arg_58_0.bindButton)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		arg_58_0.isSignInMenu = true
	end

	arg_58_0.bindButton:addEventHandler("button_secondary", function(arg_60_0, arg_60_1)
		if arg_58_0._overrideMenu ~= "" then
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_58_1, true, {
				bypassDuplicateMenuCheck = true
			})
		elseif Engine.HDGDBCJFG() then
			if CONDITIONS.ArePartiesEnabledInMainMenu() then
				Engine.DAGFFDGFII("xstopprivateparty 0", arg_58_1)
				Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
			end

			LUI.FlowManager.RequestLeaveMenu(arg_60_0, true, true)
		else
			LUI.FlowManager.RequestPopupMenu(arg_58_0, "quit_popmenu", false, arg_60_1.controller)
		end

		return true
	end)
	arg_58_0:addEventHandler("menu_create", var_0_0)
	arg_58_0.bindButton:addEventHandler("button_right_stick", function(arg_61_0, arg_61_1)
		if CONDITIONS.IsBattleNetModifyInstallEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_58_1, false)
		elseif not CONDITIONS.IsLaunchChunk() then
			local var_61_0 = LUI.FlowManager.GetScopedData(arg_58_0)

			if var_61_0 and var_61_0.currentSelectedMenuType then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_58_1, false, {
					gameMode = var_61_0.currentSelectedMenuType
				})
			end
		end
	end)
	Engine.DGGGEGCC()

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		local var_58_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if not var_58_0 or #var_58_0 == 0 then
			local var_58_1 = Dvar.DHEEJCCJBH("ORMSMKOKL")

			Dvar.BDEHAEGHAF("MOLPOSLOMO", var_58_1)
		end
	end

	Engine.EAIBAGFDCD(CoD.PresenceContext.NOT_IN_GAME)

	if not Engine.HDGDBCJFG() then
		Engine.BHHAAHFCFC()
		Engine.DDEJECEIBB()
	end

	Engine.CGIHIFHGAF()
	arg_58_0:addEventHandler("menu_close", function(arg_62_0, arg_62_1)
		Engine.EBCGADABJ()
	end)

	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.CBHCHAFFBG()
	end

	arg_58_0:addEventHandler("title_purchased", function(arg_63_0, arg_63_1)
		var_0_13(arg_58_0, arg_58_1)
	end)
	arg_58_0:addEventHandler("ingamestore_purchased_product", function(arg_64_0, arg_64_1)
		if arg_64_1.transactionResult == STORE.TransactionResult.TRANSACTION_SUCCEEDED then
			var_0_13(arg_58_0, arg_58_1)
		end
	end)

	local var_58_2 = LUI.DataSourceInControllerModel.new("alwaysLoaded.hasPlayerSeenSeasonVideo")
	local var_58_3 = {
		{
			name = "BLM",
			shouldShowFct = function()
				local var_65_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.BLMFullScreenSeen"):GetValue() or false

				return CONDITIONS.IsPC(arg_58_0) and Dvar.IBEGCHEFE("blm_messaging") and Dvar.IBEGCHEFE("blm_messaging_on_pc_blades") and not var_65_0
			end,
			tryShow = function()
				LUI.FlowManager.RequestPopupMenu(arg_58_0, "BLMFullScreen", true, arg_58_1, false, nil)

				return "BLMFullScreen"
			end,
			postShow = function()
				return
			end
		},
		{
			name = "CinematicFullscreen",
			shouldShowFct = function()
				local var_68_0 = SEASON.GetCurrentSeasonDataNum()

				if not var_68_0 then
					DebugPrint("DEBUG SEASON VIDEO: Season value is nil")

					return false
				end

				local var_68_1 = Dvar.IBEGCHEFE("lui_force_season_intro_video")
				local var_68_2 = Dvar.IBEGCHEFE("lui_force_season_mid_video")

				if var_68_1 or var_68_2 then
					return true
				end

				if var_58_2:GetValue(arg_58_1) then
					DebugPrint("DEBUG SEASON VIDEO: hasSeenSeasonVideoDataSource value is true.")

					return false
				end

				local var_68_3 = Onboarding.SeasonVideo.WasCompleted(arg_58_0, arg_58_1, var_68_0)
				local var_68_4 = Onboarding.MidSeasonVideo.WasCompleted(arg_58_0, arg_58_1, var_68_0)
				local var_68_5 = var_68_3 and var_68_4
				local var_68_6 = Dvar.IBEGCHEFE("LRSRKSSTTK")
				local var_68_7 = Dvar.IBEGCHEFE("MQMRPPKMK")
				local var_68_8 = Dvar.IBEGCHEFE("NKMQMOKNRP")

				if var_68_5 and var_68_8 then
					return false
				end

				if not var_68_3 and not var_68_6 then
					return false
				end

				if var_68_3 and not var_68_7 then
					return false
				end

				return true
			end,
			tryShow = function()
				if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() and not Dvar.IBEGCHEFE("showSeasonVideoInDev") then
					DebugPrint(" DEBUG SEASON VIDEO: Skipping season video because of dev build. Turn on showSeasonVideoInDev dvar to see the video in dev or demo builds")

					return false
				end

				if Dvar.IBEGCHEFE("NPPQOLPPO") then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because lui_skip_season_intro_video is turned on")

					return false
				end

				local var_69_0 = SEASON.GetCurrentSeasonDataNum()

				if var_69_0 == SEASON.KR15Season and Engine.FABABBDBA() then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because KR15+")

					return false
				end

				if var_69_0 <= SEASON.DefaultSeason then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because the current season is invalid. Current Season = " .. tostring(var_69_0))

					return false
				end

				local var_69_1 = Dvar.IBEGCHEFE("NRSSTQQSKK")

				local function var_69_2(arg_70_0, arg_70_1)
					return function()
						DebugPrint("In PostVideoFunc")

						if Dvar.IBEGCHEFE("NPLRKNKKOP") then
							DebugPrint("DEBUG SEASON VIDEO: Setting lui_skip_season_video because of autoskipsplashscreen")
							Dvar.DHEGHJJJHI("NKMQMOKNRP", true)
						end

						LUI.DataSourceInControllerModel.new("alwaysLoaded.hasPlayerSeenSeasonVideo"):SetValue(arg_70_0, true)

						local var_71_0 = SEASON.GetCurrentSeasonDataNum()
						local var_71_1 = false

						if arg_70_1 then
							var_71_1 = Onboarding.MidSeasonVideo:WasCompleted(arg_70_0, var_71_0)
						else
							var_71_1 = Onboarding.SeasonVideo:WasCompleted(arg_70_0, var_71_0)
						end

						if var_71_1 ~= nil and not var_71_1 then
							if arg_70_1 then
								DebugPrint("DEBUG SEASON VIDEO: marking the mid-season video as seen")
								Onboarding.MidSeasonVideo:MarkCompleted(arg_70_0)
							else
								DebugPrint("DEBUG SEASON VIDEO: marking the season intro video as seen")
								Onboarding.SeasonVideo:MarkCompleted(arg_70_0)
							end
						end

						if var_69_1 ~= nil then
							Dvar.DHEGHJJJHI("NRSSTQQSKK", var_69_1)
						end
					end
				end

				local var_69_3 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, var_69_0, CSV.seasons.cols.introVideoName)
				local var_69_4 = Dvar.IBEGCHEFE("lui_force_season_intro_video")
				local var_69_5 = Dvar.IBEGCHEFE("lui_force_season_mid_video")
				local var_69_6 = false
				local var_69_7 = false
				local var_69_8 = Dvar.IBEGCHEFE("NONPSKRPRR")

				if var_69_4 then
					-- block empty
				elseif var_69_5 then
					var_69_7 = true
					var_69_8 = Dvar.IBEGCHEFE("TNOQPMNNT")
					var_69_3 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, var_69_0, CSV.seasons.cols.midSeasonVideoName)
				else
					var_69_6 = Onboarding.SeasonVideo.WasCompleted(arg_58_0, arg_58_1, var_69_0)

					if var_69_6 then
						var_69_3 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, var_69_0, CSV.seasons.cols.midSeasonVideoName)
						var_69_6 = Onboarding.MidSeasonVideo.WasCompleted(arg_58_0, arg_58_1, var_69_0)

						if not var_69_6 then
							var_69_7 = true
							var_69_8 = Dvar.IBEGCHEFE("TNOQPMNNT")
						end
					end
				end

				local var_69_9 = Dvar.IBEGCHEFE("NKMQMOKNRP")

				if var_69_6 and var_69_9 then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because video is already seen and dvar lui_skip_season_video is set. Current Season = " .. tostring(var_69_0))

					return false
				end

				if var_69_6 then
					DebugPrint("DEBUG SEASON VIDEO: Showing season video even if player already seen it, since dvar lui_skip_season_video is false")
				end

				if var_69_3 == nil or var_69_3 == "" then
					DebugPrint("DEBUG SEASON VIDEO: Skipping season video because intro video name is not available")

					return false
				end

				DebugPrint("DEBUG SEASON VIDEO: Opening season video")

				local var_69_10 = {
					unskippable = false,
					disableQuickAccess = true,
					skipImmediate = false,
					skipVideoOnPartyJoin = true,
					video = var_69_3,
					onVideoFinished = var_69_2(arg_58_1, var_69_7),
					isEncrypted = var_69_8
				}

				LUI.FlowManager.RequestPopupMenu(arg_58_0, "CinematicFullscreen", true, arg_58_1, false, var_69_10)
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)

				return "CinematicFullscreen"
			end,
			postShow = function()
				var_0_13(arg_58_0, arg_58_1)
			end
		},
		{
			name = "MagmaUpsellPopup",
			shouldShowFct = function()
				var_0_13(arg_58_0, arg_58_1)

				if not Dvar.IBEGCHEFE("LRONQNKRKM") then
					return false
				end

				local var_73_0 = Engine.CFHBIHABCB(arg_58_1)
				local var_73_1 = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_58_0, arg_58_1)
				local var_73_2 = SEASON.GetCurrentSeasonDataNum()
				local var_73_3 = PlayerData.BFFBGAJGD(arg_58_1, CoD.StatsGroup.Ranked)
				local var_73_4 = 0

				if var_73_3 and var_73_3.brUpsellLastSeenSeason then
					var_73_4 = var_73_3.brUpsellLastSeenSeason:get()
				end

				local var_73_5 = var_73_4 < var_73_2
				local var_73_6 = LUI.FlowManager.IsInStack("BRMainMenu")
				local var_73_7 = PlayerData.BFFBGAJGD(arg_58_1, CoD.StatsGroup.Ranked)

				if var_73_7 and var_73_7.brUpsellLastSeenSeason then
					var_73_7.brUpsellLastSeenSeason:set(SEASON.GetCurrentSeasonDataNum())
				end

				return not var_73_0 and var_73_1 and var_73_5 and not var_73_6
			end,
			tryShow = function()
				LUI.FlowManager.RequestPopupMenu(element, "MagmaUpsellPopup", true, arg_58_1, false, {
					isPulsed = false
				})

				arg_58_0._magmaUpsellPopupOpened = true

				return "MagmaUpsellPopup"
			end,
			postShow = function()
				return
			end
		}
	}

	table.insert(var_58_3, var_0_6(arg_58_1))

	if Dvar.IBEGCHEFE("TMMMQMMT") then
		Engine.DFJDIFJEGA("hasSeenCDNPopup", 0, arg_58_1)
		Engine.DFJDIFJEGA("hasUpdatedForSQCDN", 0, arg_58_1)
		Dvar.DHEGHJJJHI("TMMMQMMT", false)
	end

	if Dvar.IBEGCHEFE("MLQSNKLOSO") then
		Engine.DFJDIFJEGA("hasSeenCampaignUninstallPopup", 0, arg_58_1)
		Engine.DFJDIFJEGA("neverShowCampaignUninstallPopup", 0, arg_58_1)
		Engine.DFJDIFJEGA("lastCampaignUninstallPromptTime", 0, arg_58_1)
		Dvar.DHEGHJJJHI("MLQSNKLOSO", false)
	end

	if Dvar.IBEGCHEFE("NQROPRPPSO") and (Engine.CIEGIACHAE() or Engine.BAHIIBFDDG()) then
		table.insert(var_58_3, var_0_9(arg_58_0, arg_58_1))
	end

	if Engine.BAHIIBFDDG() then
		table.insert(var_58_3, var_0_7(arg_58_0, arg_58_1))
	elseif Engine.CIEGIACHAE() then
		table.insert(var_58_3, var_0_8(arg_58_0, arg_58_1))
	elseif Engine.CGABICJHAI() then
		var_0_10(arg_58_0, arg_58_1)
	end

	local var_58_4 = Engine.DBFFAEEFGJ()

	assert(var_58_4 and var_58_4.flowManager)

	function arg_58_0.showNextPopup()
		local var_76_0 = false

		while not var_76_0 do
			arg_58_0._currentElementIdx = next(var_58_3, arg_58_0._currentElementIdx)

			if arg_58_0._currentElementIdx == nil then
				arg_58_0._isPopupFlowComplete = true

				Dvar.DHEGHJJJHI("RMMMKOSTS", true)

				return
			end

			var_76_0 = arg_58_0.showCurrentPopup()
		end
	end

	function arg_58_0.showCurrentPopup()
		local var_77_0 = var_58_3[arg_58_0._currentElementIdx]

		if var_77_0.shouldShowFct() then
			local var_77_1 = var_77_0.tryShow()
			local var_77_2 = var_58_4.flowManager:GetStackTop(false)

			if var_77_1 and var_77_2 and var_77_2.name == var_77_1 and var_77_2.menu then
				var_77_2.menu:addEventHandler("on_close", function()
					local var_78_0 = var_58_3[arg_58_0._currentElementIdx]

					if var_78_0.postShow then
						var_78_0.postShow()
					end

					arg_58_0.showNextPopup()
				end)

				return true
			elseif var_77_0.postShow then
				var_77_0.postShow()
				Dvar.DHEGHJJJHI("RMMMKOSTS", true)
			end
		end

		return false
	end

	Dvar.DHEGHJJJHI("RMMMKOSTS", true)

	local var_58_5 = true

	if MAIN_MENU.TryShowTitleUpdateAvailablePopup() then
		var_58_5 = false
	else
		Dvar.DHEGHJJJHI("RMMMKOSTS", false)
	end

	if var_58_5 and Dvar.IBEGCHEFE("LNTLOLLNQN") and Dvar.IBEGCHEFE("SNORKNQNP") then
		local var_58_6 = Dvar.DHEEJCCJBH("auto_mode")

		if not var_58_6 and var_58_6 ~= "" and var_58_6 ~= "sp" then
			var_58_5 = false
		end
	end

	if var_58_5 then
		arg_58_0.showNextPopup()
	end

	arg_58_0.openDailyChallengeTimer = LUI.UITimer.new({
		interval = 1000,
		event = "check_and_open_async_popups"
	})
	arg_58_0.openDailyChallengeTimer.id = "openDailyChallengeTimer"

	arg_58_0:addElement(arg_58_0.openDailyChallengeTimer)

	local function var_58_7()
		if not arg_58_0._magmaUpsellPopupOpened and arg_58_0._canOpenMagmaUpsell then
			LUI.FlowManager.RequestPopupMenu(element, "MagmaUpsellPopup", true, arg_58_1, false, {
				isPulsed = true
			})

			arg_58_0._magmaUpsellPopupOpened = true
			arg_58_0._isAnyAsyncPopupOpened = true
		end
	end

	arg_58_0:addEventHandler("check_and_open_async_popups", function(arg_80_0, arg_80_1)
		local var_80_0 = Engine.CFHBIHABCB(arg_58_1)
		local var_80_1 = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_58_0, arg_58_1)
		local var_80_2 = var_58_4.flowManager:GetVisibleMenu()

		if var_80_2 and var_80_2.id ~= "MainMenu" then
			return
		end

		if not var_80_0 and var_80_1 and Dvar.IBEGCHEFE("OMMSLPNSTR") then
			var_58_7()
		end
	end)
	arg_58_0:addEventHandler("gain_focus", function(arg_81_0, arg_81_1)
		arg_81_0:_doAutoNav(arg_81_1.controller)
	end)
	arg_58_0:addEventHandler("restore_focus", function(arg_82_0, arg_82_1)
		return arg_82_0:_doAutoNav(arg_82_1.controller)
	end)
	arg_58_0:addEventHandler("open_magma_upsell_pulsed", function(arg_83_0, arg_83_1)
		arg_58_0._canOpenMagmaUpsell = true
	end)
	arg_58_0:addEventHandler("main_menu_background_image_update", function(arg_84_0, arg_84_1)
		if arg_84_1 and arg_84_1.imageName and arg_84_1.imageName ~= "" then
			arg_58_0.Background:setImage(RegisterMaterial(arg_84_1.imageName))
		end
	end)

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_58_1, false, {}, nil, true, true)
	end

	arg_58_0:addEventHandler("OverwolfDetectedEvent", function(arg_85_0, arg_85_1)
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_58_1, false, {}, nil, true, true)
	end)

	LUI.FlowManager.GetScopedData(arg_58_0).streamerCreated = true

	arg_58_0.HelperBar.Background:SetHandleMouseMove(true)

	function arg_58_0.HelperBar.Background.AcceptsFocusType(arg_86_0, arg_86_1)
		return arg_86_1 == FocusType.MouseOver
	end

	var_0_14(arg_58_0)
end

local function var_0_16()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", true)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
end

local function var_0_17(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0 = {
		RegisterMaterial("main_background_cw"),
		RegisterMaterial("main_background_cw_campaign"),
		RegisterMaterial("main_background_cw_multiplayer"),
		RegisterMaterial("main_background_cw_upsell"),
		RegisterMaterial("main_background_cw_zombies"),
		RegisterMaterial("main_background_mw"),
		RegisterMaterial("main_background_mw_campaign"),
		RegisterMaterial("main_background_mw_multiplayer"),
		RegisterMaterial("main_background_mw_specops"),
		RegisterMaterial("main_background_mw_upsell"),
		RegisterMaterial("main_background_wz")
	}

	Dvar.DHEGHJJJHI("MLQNQTRRTK", true)

	if CONDITIONS.IsVanguardRevealed() then
		table.insert(var_88_0, RegisterMaterial("mw_store_vanguard_upsell_01_preorder"))
		table.insert(var_88_0, RegisterMaterial("mw_store_vanguard_upsell_02_preorder"))
		table.insert(var_88_0, RegisterMaterial("mw_store_vanguard_upsell_03_preorder"))
	end

	local var_88_1 = LUI.UIElement.new()

	var_88_1.id = "background_image_streamer"

	arg_88_0:addElement(var_88_1)

	arg_88_0.streamer = var_88_1

	arg_88_0.streamer:SetupImageTableStreamer(var_88_0, true)

	local var_88_2 = LUI.FlowManager.GetScopedData(arg_88_0)

	if var_88_2 then
		var_88_2.hideRank = true
	end
end

function MainMenu(arg_89_0, arg_89_1)
	local var_89_0 = LUI.UIElement.new()

	var_89_0.id = "MainMenu"
	var_89_0._animationSets = var_89_0._animationSets or {}
	var_89_0._sequences = var_89_0._sequences or {}

	local var_89_1 = arg_89_1 and arg_89_1.controllerIndex

	if not var_89_1 and not Engine.DDJFBBJAIG() then
		var_89_1 = var_89_0:getRootController()
	end

	assert(var_89_1)
	var_0_17(var_89_0, var_89_1, arg_89_1)

	local var_89_2 = var_89_0
	local var_89_3
	local var_89_4 = LUI.UIImage.new()

	var_89_4.id = "Background"

	var_89_4:setImage(RegisterMaterial("frontend_main_menu"), 0)
	var_89_0:addElement(var_89_4)

	var_89_0.Background = var_89_4

	local var_89_5
	local var_89_6 = MenuBuilder.BuildRegisteredType("MainMenuBladeLayout", {
		controllerIndex = var_89_1
	})

	var_89_6.id = "MainMenuBladeLayout"

	var_89_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_89_0:addElement(var_89_6)

	var_89_0.MainMenuBladeLayout = var_89_6

	local var_89_7
	local var_89_8 = LUI.UIText.new()

	var_89_8.id = "Copyright"

	var_89_8:SetRGBFromInt(14277081, 0)
	var_89_8:SetAlpha(0, 0)
	var_89_8:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_89_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_89_8:SetAlignment(LUI.Alignment.Center)
	var_89_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -79, _1080p * -55)
	var_89_0:addElement(var_89_8)

	var_89_0.Copyright = var_89_8

	local var_89_9

	if CONDITIONS.IsXboxLive() then
		local var_89_10 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_89_1
		})

		var_89_10.id = "Gamertag"

		var_89_10:SetRGBFromTable(SWATCHES.MainMenu.ButtonMain, 0)
		var_89_10.TextLabel:SetAlignment(LUI.Alignment.Left)
		var_89_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 86, _1080p * 116)
		var_89_0:addElement(var_89_10)

		var_89_0.Gamertag = var_89_10
	end

	local var_89_11
	local var_89_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_89_1
	})

	var_89_12.id = "HelperBar"

	var_89_12.Background:SetAlpha(0.2, 0)
	var_89_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_89_0:addElement(var_89_12)

	var_89_0.HelperBar = var_89_12

	local var_89_13

	if CONDITIONS.IsUserSignedInDemonware(var_89_1) then
		var_89_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_89_1
		})
		var_89_13.id = "MPPlayerDetails"

		var_89_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_89_0:addElement(var_89_13)

		var_89_0.MPPlayerDetails = var_89_13
	end

	local var_89_14

	if CONDITIONS.IsSocialEnabledInMainMenu() then
		var_89_14 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
			controllerIndex = var_89_1
		})
		var_89_14.id = "PartyWidget"

		var_89_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
		var_89_0:addElement(var_89_14)

		var_89_0.PartyWidget = var_89_14
	end

	local var_89_15

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_89_16 = LUI.UIImage.new()

		var_89_16.id = "WZWipAccentFUIL"

		var_89_16:SetYRotation(180, 0)
		var_89_16:SetZRotation(180, 0)
		var_89_16:setImage(RegisterMaterial("ui_mp_br_frontend_fui_left_ch2"), 0)
		var_89_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 40, _1080p * -512, _1080p * 512)
		var_89_0:addElement(var_89_16)

		var_89_0.WZWipAccentFUIL = var_89_16
	end

	local var_89_17

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_89_18 = LUI.UIImage.new()

		var_89_18.id = "WZWipAccentFUIR"

		var_89_18:setImage(RegisterMaterial("ui_mp_br_frontend_fui_right_ch2"), 0)
		var_89_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -20, 0, _1080p * -512, _1080p * 512)
		var_89_0:addElement(var_89_18)

		var_89_0.WZWipAccentFUIR = var_89_18
	end

	local var_89_19

	if Engine.DDJFBBJAIG() and CONDITIONS.IsBladeBannerActive() then
		local var_89_20 = MenuBuilder.BuildRegisteredType("NewGameRevealBanner", {
			controllerIndex = var_89_1
		})

		var_89_20.id = "NewGameRevealBanner"

		var_89_20.SubTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_PREORDER_BANNER_COMING_SOON_SUBTEXT")), 0)
		var_89_20.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_PREORDER_BANNER_COMING_SOON_TEXT")), 0)
		var_89_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 150)
		var_89_0:addElement(var_89_20)

		var_89_0.NewGameRevealBanner = var_89_20
	end

	local function var_89_21()
		return
	end

	var_89_0._sequences.DefaultSequence = var_89_21

	local var_89_22
	local var_89_23 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_89_8:RegisterAnimationSequence("ShowCopyright", var_89_23)

	local function var_89_24()
		var_89_8:AnimateSequence("ShowCopyright")
	end

	var_89_0._sequences.ShowCopyright = var_89_24

	local var_89_25

	if CONDITIONS.IsUserSignedInDemonware(var_89_1) then
		local var_89_26 = {
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

		var_89_13:RegisterAnimationSequence("LaunchChunk", var_89_26)
	end

	if CONDITIONS.IsSocialEnabledInMainMenu() then
		local var_89_27 = {
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

		var_89_14:RegisterAnimationSequence("LaunchChunk", var_89_27)
	end

	local function var_89_28()
		if CONDITIONS.IsUserSignedInDemonware(var_89_1) then
			var_89_13:AnimateSequence("LaunchChunk")
		end

		if CONDITIONS.IsSocialEnabledInMainMenu() then
			var_89_14:AnimateSequence("LaunchChunk")
		end
	end

	var_89_0._sequences.LaunchChunk = var_89_28

	local var_89_29
	local var_89_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.MagmaLayout
		}
	}

	var_89_4:RegisterAnimationSequence("MagmaLayout", var_89_30)

	local function var_89_31()
		var_89_4:AnimateSequence("MagmaLayout")
	end

	var_89_0._sequences.MagmaLayout = var_89_31

	local var_89_32
	local var_89_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.KronosLayout
		}
	}

	var_89_4:RegisterAnimationSequence("KronosLayout", var_89_33)

	local function var_89_34()
		var_89_4:AnimateSequence("KronosLayout")
	end

	var_89_0._sequences.KronosLayout = var_89_34

	local var_89_35
	local var_89_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.KronosLayout
		}
	}

	var_89_4:RegisterAnimationSequence("WZRefreshLayout", var_89_36)

	local function var_89_37()
		var_89_4:AnimateSequence("WZRefreshLayout")
	end

	var_89_0._sequences.WZRefreshLayout = var_89_37

	function var_89_0.addButtonHelperFunction(arg_96_0, arg_96_1)
		arg_96_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_89_0:addEventHandler("menu_create", var_89_0.addButtonHelperFunction)

	local var_89_38 = LUI.UIBindButton.new()

	var_89_38.id = "selfBindButton"

	var_89_0:addElement(var_89_38)

	var_89_0.bindButton = var_89_38

	var_0_15(var_89_0, var_89_1, arg_89_1)

	return var_89_0
end

MenuBuilder.registerType("MainMenu", MainMenu)
LUI.FlowManager.RegisterStackPushBehaviour("MainMenu", var_0_16)
LockTable(_M)
