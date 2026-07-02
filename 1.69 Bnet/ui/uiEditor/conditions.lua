CONDITIONS = {
	AlwaysFalse = function()
		return false
	end,
	AlwaysTrue = function()
		return true
	end,
	InFrontend = function()
		return Engine.DDJFBBJAIG()
	end,
	InFrontendPublic = function()
		return Engine.DDJFBBJAIG() and not IsPrivateMatch() and not IsSystemLink()
	end,
	InFrontendPublicMP = function()
		return Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() and not IsPrivateMatch() and not IsSystemLink() and not Engine.EAIICIFIFA()
	end,
	InFrontendMPOrCP = function()
		return Engine.DDJFBBJAIG() and not Engine.CAADCDEEIA()
	end,
	InGame = function()
		return not Engine.DDJFBBJAIG()
	end,
	InGameMP = function()
		return not Engine.DDJFBBJAIG() and Engine.EAAHGICFBD()
	end,
	InGameSPOrFrontendMP = function()
		return not Engine.DDJFBBJAIG() and Engine.CAADCDEEIA() or Engine.DDJFBBJAIG() and Engine.EAAHGICFBD()
	end,
	IsMenuInStack = function(arg_10_0)
		return LUI.FlowManager.IsInStack(arg_10_0)
	end,
	InGameOrCP = function()
		return not Engine.DDJFBBJAIG() or Engine.EAIICIFIFA()
	end,
	IsGamepadEnabled = function()
		return Engine.BBDCAFEGDJ() == 1
	end,
	IsDevelopmentBuild = function()
		return Engine.BHICADFIHA()
	end,
	IsDevelopmentBuildOnConsole = function()
		return Engine.BHICADFIHA() and Engine.HDGDBCJFG()
	end,
	IsDevelopmentBuildLocalPlayAllowed = function()
		return Engine.BHICADFIHA() and Engine.BHCBGBFEJI()
	end,
	IsCapturingFootage = function()
		return Dvar.IBEGCHEFE("lui_footage_capture_enabled") == true
	end,
	IsMatchSimToolEnabled = function()
		return Dvar.CFHDGABACF("MKOTKLQOLM") == 1
	end,
	AreDevFeaturesEnabled = function()
		return Dvar.IBEGCHEFE("LSSRRSMNMR")
	end,
	IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled = function()
		return Engine.BGAAHHAGAC() or Engine.BHICADFIHA() or Dvar.IBEGCHEFE("LSSRRSMNMR")
	end,
	IsInFocus = function(arg_20_0)
		return arg_20_0:isInFocus()
	end,
	IsDisabled = function(arg_21_0)
		return arg_21_0:IsDisabled()
	end,
	IsCoreMultiplayer = function()
		return Engine.ECHCFGDDDF()
	end,
	IsCoreMultiplayerNotBr = function()
		local var_23_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"

		return Engine.ECHCFGDDDF() and not var_23_0
	end,
	IsMultiplayer = function()
		return Engine.EAAHGICFBD()
	end,
	IsSingleplayer = function()
		return not Engine.EAAHGICFBD()
	end,
	IsSingleplayerOrCoreMultiplayer = function()
		return Engine.CAADCDEEIA() or Engine.ECHCFGDDDF()
	end,
	IsThirdGameMode = function()
		return Engine.EAIICIFIFA()
	end,
	IsTDMGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "war"
	end,
	IsStrategicInfilGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsLimitedHealthGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	ShouldAllowChoosingClassBR = function(arg_31_0)
		local var_31_0 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_31_1 = Dvar.CFHDGABACF("scr_br_allowLoadout") == 1

		if Dvar.CFHDGABACF("scr_br_allowLoadoutOnlyInPreLobby") == 1 and var_31_1 and arg_31_0 ~= nil and CONDITIONS.InGame() then
			var_31_1 = Game.BFEEGCHICA(arg_31_0, "ui_prematch_period") == 1 and true or false
		end

		return var_31_0 == "dmz" or var_31_0 == "rat_race" or var_31_0 == "risk" or var_31_0 == "gold_war" or var_31_1
	end,
	IsBRLoadoutGameType = function(arg_32_0)
		local var_32_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
		local var_32_1 = Dvar.DHEEJCCJBH("scr_br_gametype")

		return var_32_0 == "br" and not CONDITIONS.ShouldAllowChoosingClassBR(arg_32_0)
	end,
	IsBRGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsBaseBRGametype = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br" and Dvar.DHEEJCCJBH("scr_br_gametype") == ""
	end,
	IsBloodMoney = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dmz" or Dvar.DHEEJCCJBH("scr_br_gametype") == "gold_war"
	end,
	IsBRTDMGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "brtdm"
	end,
	IsRiskGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "risk"
	end,
	IsRespectGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "respect"
	end,
	IsBloodMoneyOrIsRiskGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dmz" or Dvar.DHEEJCCJBH("scr_br_gametype") == "risk" or Dvar.DHEEJCCJBH("scr_br_gametype") == "gold_war"
	end,
	IsBloodMoneyOrIsRatRaceGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dmz" or Dvar.DHEEJCCJBH("scr_br_gametype") == "rat_race" or Dvar.DHEEJCCJBH("scr_br_gametype") == "gold_war"
	end,
	IsBRTeamCashGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dmz" or Dvar.DHEEJCCJBH("scr_br_gametype") == "risk" or Dvar.DHEEJCCJBH("scr_br_gametype") == "truckwar" or Dvar.DHEEJCCJBH("scr_br_gametype") == "gold_war"
	end,
	IsNotBloodMoneyAndIsNotRiskGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") ~= "dmz" and Dvar.DHEEJCCJBH("scr_br_gametype") ~= "rat_race" and Dvar.DHEEJCCJBH("scr_br_gametype") ~= "risk" and Dvar.DHEEJCCJBH("scr_br_gametype") ~= "gold_war"
	end,
	IsNotBloodMoneyAndIsNotRiskGametypeAndIsNotPayload = function()
		return CONDITIONS.IsNotBloodMoneyAndIsNotRiskGametype() and Dvar.DHEEJCCJBH("scr_br_gametype") ~= "payload"
	end,
	IsBRJugg = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "jugg"
	end,
	IsBRMini = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "mini"
	end,
	IsBRKingSlayer = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "kingslayer"
	end,
	IsBRTruckWar = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "truckwar"
	end,
	ShowBRTruckWarKiosk = function()
		return Dvar.CFHDGABACF("scr_br_show_truckwar_kiosk") == 1
	end,
	IsBRZombies = function()
		return Dvar.CFHDGABACF("scr_br_alt_mode_zxp") == 1
	end,
	IsBRGhosts = function()
		return Dvar.CFHDGABACF("scr_br_alt_mode_gxp") == 1
	end,
	IsBRZ = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "brz"
	end,
	IsHolidayHuntActive = function()
		return Dvar.CFHDGABACF("scr_br_alt_mode_hh") == 1
	end,
	IsTramwayEnabled = function()
		return Dvar.CFHDGABACF("scr_wz_tram_enable") == 1
	end,
	IsKrampusActive = function()
		return Dvar.CFHDGABACF("scr_br_alt_mode_fiend") == 1
	end,
	IsWZPayload = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "payload"
	end,
	IsWZPayloadMini = function()
		return CONDITIONS.IsWZPayload() and Dvar.IBEGCHEFE("scr_br_alt_mode_mini")
	end,
	IsWZRumble = function()
		local var_57_0 = Dvar.DHEEJCCJBH("scr_br_gametype")

		return var_57_0 == "rumble" or var_57_0 == "rumble_invasion" or var_57_0 == "mxp"
	end,
	IsWZRatRace = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "rat_race"
	end,
	IsWZRumbleOrRatRaceMode = function()
		return CONDITIONS.IsWZRumble() or CONDITIONS.IsWZRatRace()
	end,
	IsWZRumbleOrVoVMode = function()
		return CONDITIONS.IsWZRumble() or CONDITIONS.IsVOVMode() or CONDITIONS.IsWZRatRace()
	end,
	IsWZIncursion = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "rumble_invasion"
	end,
	IsFastTravelAvailable = function()
		return Dvar.IBEGCHEFE("scr_ftv_enable")
	end,
	IsSquadAsTeamEnabled = function()
		return Dvar.IBEGCHEFE("LNKKRLTPNS")
	end,
	IsWZPayloadSpawnChoiceShowing = function(arg_64_0)
		if not CONDITIONS.IsWZPayload() then
			return false
		end

		return MP.GetUnpackedPayloadClientData(arg_64_0).currentPlayerRespawn == 1
	end,
	IsTutorialTacmapLocked = function(arg_65_0)
		if not CONDITIONS.IsFTUI() or arg_65_0 == nil then
			return false
		end

		local var_65_0 = Game.BFEEGCHICA(arg_65_0, "ui_br_tutorial_state")

		if var_65_0 ~= nil then
			return var_65_0 == 1
		else
			return false
		end
	end,
	IsPlayerAZombie = function(arg_66_0)
		local var_66_0 = false
		local var_66_1 = LUI.GetDataSourceWithAppendPath(DataSources.inGame, "player.BRData.PlayerStatusIsZombie")

		if var_66_1 then
			var_66_0 = var_66_1:GetValue(arg_66_0)
		end

		return var_66_0
	end,
	IsBRInflation = function()
		local var_67_0 = Dvar.DHEEJCCJBH("scr_br_alt_mode_inflation")

		if CONDITIONS.IsMagmaGameMode() and var_67_0 then
			local var_67_1 = tonumber(var_67_0)

			return var_67_1 and var_67_1 == 1
		end

		return false
	end,
	IsBRInflationOrWZRumble = function()
		return CONDITIONS.IsBRInflation() or CONDITIONS.IsWZRumble() or CONDITIONS.IsWZRatRace()
	end,
	HasBRInflationRedeployCloseHUD = function()
		return Dvar.CFHDGABACF("scr_br_resurgence_hide_close_ui") ~= 1 and (CONDITIONS.IsBRInflation() or CONDITIONS.IsBRExfiltrationMode() or CONDITIONS.IsResurgenceRespawn())
	end,
	IsBRX1Variant = function()
		local var_70_0 = Dvar.DHEEJCCJBH("MTQQTNNTMM") or ""

		return CONDITIONS.IsMagmaGameMode() and var_70_0 == "x1"
	end,
	IsDBDGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dbd"
	end,
	IsBRX2Gametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "x2"
	end,
	IsBRX1OrBRX2 = function()
		return CONDITIONS.IsBRX1Variant() or CONDITIONS.IsBRX2Gametype()
	end,
	IsResurgenceRespawn = function()
		return Dvar.CFHDGABACF("scr_br_resurgence_respawn_enable") == 1
	end,
	IsNeedingPowerups = function()
		return Dvar.IBEGCHEFE("powerup_ui_enabled")
	end,
	IsResurgenceDisabledSoon = function(arg_76_0)
		if not CONDITIONS.IsResurgenceRespawn() then
			return false
		end

		local var_76_0 = Game.BFEEGCHICA(arg_76_0, "ui_br_plunder_extract_end_time")

		if var_76_0 > 0 then
			local var_76_1 = var_76_0 - Game.CAIAFFIDE()

			if (Dvar.CFHDGABACF("scr_br_rebirth_show_respawn_closed_timer_max_time") or 90000) >= var_76_1 - 2000 then
				return true
			else
				return false
			end
		end

		return true
	end,
	IsResurgenceRespawnOrVoV = function()
		return CONDITIONS.IsResurgenceRespawn() or CONDITIONS.IsVOVMode()
	end,
	IsTreasureHuntGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "treasure_hunt"
	end,
	IsRebirthGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "rebirth"
	end,
	IsRebirthSoloGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "rebirth_reverse"
	end,
	IsMapAtlantis = function(arg_81_0)
		if not arg_81_0 or arg_81_0 == "" then
			arg_81_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
		end

		return arg_81_0 == "mp_escape2" or arg_81_0 == "mp_escape2_pm" or arg_81_0 == "mp_escape3" or arg_81_0 == "mp_escape4" or arg_81_0 == "mp_escape4_s5"
	end,
	IsMapPacificIsland = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_wz_island"
	end,
	IsMapDragonsDen = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_sm_island_1"
	end,
	IsGoldWarGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "gold_war"
	end,
	IsMapAtlantisNight = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_escape2_pm" or Dvar.CFHDGABACF("scr_br_atlantisNight") == 1
	end,
	IsBRLepChallengeActive = function()
		return Dvar.CFHDGABACF("scr_br_lep_challenge_enable") == 1
	end,
	IsBRLEPGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "lep"
	end,
	IsBRIronTrialsGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dbd"
	end,
	IsBRResurgenceTrialsGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "rebirth_dbd"
	end,
	IsBRResurgenceTrialsSoloGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "rebirth_dbd_reverse"
	end,
	IsBRResurgenceSoloOrResurgenceTrialSoloGametype = function()
		return CONDITIONS.IsRebirthSoloGametype() or CONDITIONS.IsBRResurgenceTrialsSoloGametype()
	end,
	IsBRExfilRadioMode = function()
		return CONDITIONS.IsMagmaGameMode() and Dvar.IBEGCHEFE("scr_br_using_exfil_radio")
	end,
	IsBRExfiltrationMode = function()
		return CONDITIONS.IsMagmaGameMode() and (Dvar.IBEGCHEFE("scr_br_alt_mode_escape") or CONDITIONS.IsBRExfilRadioMode())
	end,
	IsExfiltrationAlternativeSpawnSystem = function()
		return CONDITIONS.IsBRExfiltrationMode() and Dvar.IBEGCHEFE("scr_br_escape_alt_respawn_system_enable")
	end,
	CreateElementForDOVLoadingScreen = function()
		return CONDITIONS.ShowAfterDOVLoadingScreen() or CONDITIONS.IsBRRevealMode()
	end,
	CreateElementForLEPCountdownScreen = function()
		return Dvar.CFHDGABACF("scr_br_show_lep_countdown_screen") == 1 and Dvar.CFHDGABACF("lui_lep_start_time") > 0
	end,
	ShowAfterDOVLoadingScreen = function()
		return Dvar.CFHDGABACF("scr_br_show_dov_loading_screen") == 1
	end,
	IsBRExfiltrationOrRevealType2Mode = function()
		return CONDITIONS.IsBRExfiltrationMode() or CONDITIONS.IsBRRevealTwoMode()
	end,
	IsBRRevealMode = function()
		return Dvar.CFHDGABACF("scr_br_reveal_event_type") == 1
	end,
	IsBRRevealTwoMode = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "reveal_2"
	end,
	IsBRBaseOrPlunder = function()
		return CONDITIONS.IsBaseBRGametype() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsWZRatRace()
	end,
	IsVOVMode = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "vov"
	end,
	IsWW2Verse = function()
		return Dvar.DHEEJCCJBH("scr_br_verse") == "ww2"
	end,
	IsMetaVerse = function()
		return Dvar.DHEEJCCJBH("scr_br_verse") == "modern"
	end,
	IsFrontEndSceneBlackoutForceDisabled = function()
		return Dvar.IBEGCHEFE("frontEndScene_force_disable_blackout")
	end,
	ShouldBlackOutFrontEndScene = function()
		if CONDITIONS.IsFrontEndSceneBlackoutForceDisabled() then
			return false
		end

		return Dvar.IBEGCHEFE("MTOPOKPPLN")
	end,
	IsBRDoV2RevealDon4Stage = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "brdov"
	end,
	ShouldShowZombieVaccine = function()
		return CONDITIONS.IsBRZombies() and not CONDITIONS.IsBRZ()
	end,
	IsSDGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "sd"
	end,
	InGameAndBR = function()
		local var_110_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return not Engine.DDJFBBJAIG() and var_110_0 == "br"
	end,
	InGameAndBRTDM = function()
		local var_111_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return not Engine.DDJFBBJAIG() and var_111_0 == "brtdm"
	end,
	IsNotBrAndNotTrial = function()
		local var_112_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_112_0 ~= "br" and var_112_0 ~= "trial"
	end,
	InGameAndNotBR = function()
		local var_113_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return not Engine.DDJFBBJAIG() and var_113_0 ~= "br"
	end,
	InGameAndBRLoadoutSelect = function(arg_114_0)
		local var_114_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
		local var_114_1 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_114_2 = var_114_0 == "br" and not CONDITIONS.ShouldAllowChoosingClassBR(arg_114_0)

		return not Engine.DDJFBBJAIG() and var_114_2
	end,
	InGameAndMPLoadoutSelect = function(arg_115_0)
		local var_115_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
		local var_115_1 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_115_2 = var_115_0 == "br" and not CONDITIONS.ShouldAllowChoosingClassBR(arg_115_0)

		return not Engine.DDJFBBJAIG() and not var_115_2
	end,
	IsOlarideGameType = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "olaride"
	end,
	IsUsingDoomstation = function()
		return Dvar.IBEGCHEFE("scr_br_doomstation_enabled")
	end,
	IsCyberGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cyber"
	end,
	IsParachuteGameType = function()
		local var_119_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_119_0 == "br" or var_119_0 == "arm" or var_119_0 == "war" or var_119_0 == "cp_survival" or var_119_0 == "trial"
	end,
	IsArenaOrBRGameType = function()
		local var_120_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_120_0 == "br" or var_120_0 == "arena"
	end,
	IsUsingOvertimeGameplayTimer = function()
		local var_121_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_121_0 == "br" or var_121_0 == "arena" or var_121_0 == "rush" or var_121_0 == "rugby"
	end,
	IsUsingPublicEvents = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsPublicEventAUAVScanEnabled = function(arg_123_0)
		return (Dvar.CFHDGABACF("scr_br_pe_auavscan_enabled") or 1) == 1
	end,
	IsUsingTeamHealthbars = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsArmsRaceGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arm"
	end,
	IsGWSquadGameType = function()
		local var_126_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_126_0 == "arm" or var_126_0 == "brtdm" or var_126_0 == "arena"
	end,
	IsDefconGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "defcon"
	end,
	IsCMDGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cmd"
	end,
	IsGrindGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "grind"
	end,
	IsDogTagGameType = function()
		local var_130_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_130_0 == "conf" or var_130_0 == "grind"
	end,
	IsPillageGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "pill"
	end,
	IsArenaGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arena"
	end,
	IsOICGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "oic"
	end,
	IsTDEFGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "tdef"
	end,
	IsReinforceGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "siege"
	end,
	IsFlagOrTdefGameType = function()
		local var_136_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_136_0 == "ctf" or var_136_0 == "blitz" or var_136_0 == "tdef"
	end,
	IsFlagGameType = function()
		local var_137_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_137_0 == "ctf" or var_137_0 == "blitz"
	end,
	IsCoopStrikeGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_strike"
	end,
	IsCoopTrialsGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_trials"
	end,
	IsWaveGameType = function()
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_wave_sv" and not Engine.DDJFBBJAIG() then
			return true
		else
			return false
		end
	end,
	InFrontendOrWaveMode = function()
		local var_141_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if Engine.DDJFBBJAIG() or var_141_0 == "cp_wave_sv" then
			return true
		else
			return false
		end
	end,
	IsOperationGameType = function()
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_survival" and not Engine.DDJFBBJAIG() then
			return true
		else
			return false
		end
	end,
	IsSpecOpsGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_specops"
	end,
	IsCoopPvpeType = function(arg_144_0)
		return Dvar.CFHDGABACF("enable_pvpe") == 1
	end,
	IsDominationGameType = function()
		local var_145_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_145_0 == "dom" or var_145_0 == "siege"
	end,
	IsDominationOrArmsRaceGameType = function()
		local var_146_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_146_0 == "dom" or var_146_0 == "arm" or var_146_0 == "siege"
	end,
	IsRugbyGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "rugby"
	end,
	IsBTMGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "btm"
	end,
	IsTrialGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "trial"
	end,
	IsTrialGameTypeORLaunchChunk = function()
		local var_150_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return Dvar.IBEGCHEFE("MPNRKLKOKR") and CONDITIONS.IsConsoleGame() or var_150_0 == "trial"
	end,
	IsTrialGameTypeORSplitscreen = function()
		local var_151_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return CONDITIONS.IsSplitscreen() or var_151_0 == "trial"
	end,
	IsInTrialEvent = function()
		return Dvar.IBEGCHEFE("LOQKLRKQMO") and CONDITIONS.IsTrialEventAvailable()
	end,
	IsBRHudWZGameMode = function()
		return not CONDITIONS.IsRealismMode() and (CONDITIONS.IsMagmaGameMode() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsBRJugg() or CONDITIONS.IsWZRatRace())
	end,
	IsHillMapNameplateOverride = function()
		if Engine.ECHCFGDDDF() and CONDITIONS.IsMatchMakingGame() and Dvar.CFHDGABACF("ui_nameplate_map_override") == 1 then
			return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_m_hill"
		end
	end,
	IsBRBodycountGameType = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "bodycount"
	end,
	IsBRMendotaGameType = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "mendota"
	end,
	IsBRTitaniumTrialsEnduranceGameType = function()
		local var_157_0 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_157_1 = Dvar.IBEGCHEFE("scr_tdbd_is_resurgence")

		return var_157_0 == "tdbd" and not var_157_1
	end,
	IsBRTitaniumTrialsResurrectionGameType = function()
		local var_158_0 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_158_1 = Dvar.IBEGCHEFE("scr_tdbd_is_resurgence")

		return var_158_0 == "tdbd" and var_158_1
	end,
	IsVanguardRoyale = function()
		return Dvar.IBEGCHEFE("scr_vanguard_royale")
	end,
	IsMeleeMayhemGametype = function()
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "mmp"
	end,
	IsTeamBasedGameType = function()
		local var_161_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_161_0, CSV.gameTypesTable.cols.teamBased) == "1"
	end,
	IsMultiplayerDesired = function()
		return Engine.BAGCCCCIEF() == CoD.PlayMode.Core
	end,
	IsSingleplayerDesired = function()
		return Engine.BAGCCCCIEF() == CoD.PlayMode.SP
	end,
	IsThirdGameModeDesired = function()
		return Engine.BAGCCCCIEF() == CoD.PlayMode.Aliens
	end,
	IsMatchMakingGame = function()
		return Dvar.IBEGCHEFE("isMatchMakingGame")
	end,
	IsPublicMatch = function()
		return IsPublicMatch()
	end,
	IsCorePublicMatch = function()
		return Engine.ECHCFGDDDF() and IsPublicMatch()
	end,
	IsWeaponLevelShown = function()
		return IsPublicMatch() and Engine.DDJFBBJAIG()
	end,
	IsCoreFrontendPC = function()
		return Engine.CGABICJHAI() and Engine.ECHCFGDDDF() and Engine.DDJFBBJAIG()
	end,
	IsLocalServerPaused = function()
		return Engine.EACHICHBCD()
	end,
	IsCWLDraftLobby = function()
		return (IsPrivateMatch() or IsSystemLink()) and Engine.ECHCFGDDDF() and MLG.AreMLGRulesEnabled() and not Dvar.IBEGCHEFE("MLNSOPOTNQ")
	end,
	IsMLGRulesEnabled = function()
		return (IsPrivateMatch() or IsSystemLink()) and Engine.ECHCFGDDDF() and MLG.AreMLGRulesEnabled()
	end,
	IsBombGametype = function()
		local var_173_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_173_0 == "sd" or var_173_0 == "sr" or var_173_0 == "dd" or var_173_0 == "cmd" or var_173_0 == "cyber"
	end,
	isLifeLimitedBombGametype = function()
		local var_174_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_174_0 == "sd" or var_174_0 == "sr" or var_174_0 == "cyber" or var_174_0 == "siege"
	end,
	IsCaptureGameType = function()
		local var_175_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_175_0 == "dom" or var_175_0 == "grind" or var_175_0 == "koth" or var_175_0 == "grnd" or var_175_0 == "siege" or var_175_0 == "cmd" or var_175_0 == "br" or var_175_0 == "cyber" or var_175_0 == "hq" or var_175_0 == "pill"
	end,
	IsCrankedGameType = function()
		return Dvar.DHEEJCCJBH("scr_" .. Dvar.DHEEJCCJBH("MOLPOSLOMO") .. "_crankedBombTimer") ~= "0"
	end,
	IsInfectedGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "infect"
	end,
	IsUplinkGameType = function()
		local var_178_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_178_0 == "ball" or var_178_0 == "tdef"
	end,
	IsDropZoneGameType = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "grnd"
	end,
	IsAONGameType = function()
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "dm" and (MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.DmData, Lobby.MatchRulesMembers.AONRules) > 0 or not MatchRules.EAIEFBHGJ() and Dvar.CFHDGABACF("scr_dm_aonrules") > 0)
		end
	end,
	IsKillstreakConfirmedGameType = function()
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "conf" and (MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ConfData, Lobby.MatchRulesMembers.KillstreakConfirmed) == true or not MatchRules.EAIEFBHGJ() and Dvar.CFHDGABACF("scr_conf_killstreakConfirmed") == 1)
		end
	end,
	IsGunGameTDMGameType = function()
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "war" and (MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.GunGameWeapons) > 0 or not MatchRules.EAIEFBHGJ() and Dvar.CFHDGABACF("scr_game_gunGameWeapons") > 0)
		end
	end,
	DoesGameTypeSupportBallIcon = function()
		local var_183_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_183_0 == "ball" or var_183_0 == "tdef" or var_183_0 == "cyber"
	end,
	DoesGameTypeSupportEMPIcon = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cyber"
	end,
	DoesGameTypeSupportBombIcon = function()
		local var_185_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_185_0 == "sd" or var_185_0 == "sr" or var_185_0 == "cmd"
	end,
	IsFrontlineGameType = function()
		local var_186_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_186_0 == "front" or var_186_0 == "ball" or var_186_0 == "tdef"
	end,
	IsClassTableOverrideEnabled = function()
		if not Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
			local var_187_0 = Engine.IJEBHJIJF()

			return Game.BFEEGCHICA(var_187_0, "ui_classtable_override") > 0
		else
			return false
		end
	end,
	IsSnipersOnlyClasses = function()
		if not Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
			local var_188_0 = Engine.IJEBHJIJF()

			return Game.BFEEGCHICA(var_188_0, "ui_classtable_override") == 1
		else
			return false
		end
	end,
	IsGunGameClasses = function()
		if not Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
			local var_189_0 = Engine.IJEBHJIJF()

			return Game.BFEEGCHICA(var_189_0, "ui_gamemode_override") == 1
		else
			return false
		end
	end,
	DoesGameTypeSupportCommandBar = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "front"
	end,
	DoesGameTypeSupportObjectiveProgress = function()
		local var_191_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_191_0 == "sd" or var_191_0 == "sr" or var_191_0 == "dd" or var_191_0 == "cmd" or var_191_0 == "cyber" or var_191_0 == "dom" or var_191_0 == "grind" or var_191_0 == "koth" or var_191_0 == "grnd" or var_191_0 == "siege" or var_191_0 == "br" or var_191_0 == "hq" or var_191_0 == "pill"
	end,
	IsHardpointGameType = function()
		if Engine.ECHCFGDDDF() then
			local var_192_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return var_192_0 == "koth" or var_192_0 == "grnd" or var_192_0 == "rush" or var_192_0 == "hq"
		else
			return false
		end
	end,
	IsDemolitionGameType = function()
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "dd"
		else
			return false
		end
	end,
	IsHPHQDZGameType = function()
		if Engine.ECHCFGDDDF() then
			local var_194_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return var_194_0 == "koth" or var_194_0 == "hq" or var_194_0 == "grnd"
		else
			return false
		end
	end,
	IsHQGameType = function()
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "hq"
		else
			return false
		end
	end,
	IsHQOrArenaGameType = function()
		if Engine.ECHCFGDDDF() then
			local var_196_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return var_196_0 == "hq" or var_196_0 == "arena"
		else
			return false
		end
	end,
	IsTeamLiveGameType = function()
		local var_197_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_197_0 == "sd" or var_197_0 == "sr" or var_197_0 == "siege" or var_197_0 == "arena" or var_197_0 == "br" or var_197_0 == "cyber"
	end,
	IsLimitedLifeGameType = function()
		if Engine.ECHCFGDDDF() then
			local var_198_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return Dvar.DHEEJCCJBH("scr_" .. var_198_0 .. "_numlives") ~= "0"
		else
			return false
		end
	end,
	IsBRDropBagEnabled = function()
		local var_199_0 = Dvar.DHEEJCCJBH("scr_br_dropbagspawn")

		return not var_199_0 or var_199_0 == "" or var_199_0 == "1"
	end,
	IsBRArmoryKioskEnabled = function()
		local var_200_0 = Dvar.DHEEJCCJBH("scr_br_armory_kiosk")

		return not var_200_0 or var_200_0 == "" or var_200_0 == "1"
	end,
	SkipBuystationPurchaseConfirmDialogue = function()
		return Dvar.IBEGCHEFE("MLLTOSMTLS")
	end,
	IsBRArmoryTraderEnabled = function()
		return (function(arg_203_0)
			local var_203_0 = Dvar.DHEEJCCJBH(arg_203_0)

			return not (not var_203_0 or var_203_0 == "") and var_203_0 == "1"
		end)("scr_br_armory_trader")
	end,
	IsBRSquadmateBuyBackEnabled = function()
		return CONDITIONS.IsBRPlunderEnabled()
	end,
	IsBRPlunderEnabled = function()
		local var_205_0 = Dvar.DHEEJCCJBH("scr_br_plunder")

		return not var_205_0 or var_205_0 == "" or var_205_0 == "1"
	end,
	AreBRPlunderSitesEnabled = function()
		local var_206_0 = Dvar.DHEEJCCJBH("scr_br_plunder_sites")

		return not (not var_206_0 or var_206_0 == "") and var_206_0 == "1"
	end,
	IsBrQuickInventoryEnabled = function()
		return not Dvar.IBEGCHEFE("ui_disable_quick_inventory")
	end,
	IsGasMaskInInventoryDisabled = function()
		return Dvar.IBEGCHEFE("NTOMMOQMNL") == true
	end,
	IsBRTutorialRestartEnabled = function()
		return Dvar.IBEGCHEFE("NRTOORMRKR")
	end,
	IsInGameAAREnabled = function()
		return Dvar.IBEGCHEFE("TPTKKSNQ")
	end,
	IsPlayAgainAllowed = function()
		return Engine.BFFJDBBHIF()
	end,
	IsPlayAgainEnabled = function()
		return Dvar.IBEGCHEFE("LPRKRTSPQT") and CONDITIONS.IsMagmaGameMode() and not IsSystemLink() and not IsPrivateMatch()
	end,
	IsPlayAgainWithSquadEnabled = function()
		return CONDITIONS.IsPlayAgainEnabled() and Dvar.IBEGCHEFE("OKLLMNRTP")
	end,
	IsInGameAARScoreboardEnabled = function()
		return Dvar.IBEGCHEFE("MTNKKKTTRR")
	end,
	IsInGameNewAARScoreboardEnabled = function()
		return Dvar.IBEGCHEFE("NTKSMOLO")
	end,
	IsPlayAgainEnabledForPartyHost = function()
		return CONDITIONS.IsPlayAgainEnabled() and Lobby.BGIADHIHAG()
	end,
	IsInGameAARProgressbarEnabled = function()
		return Dvar.IBEGCHEFE("NPSQPOMPLP")
	end,
	ShouldUseAlternateCreditSpacing = function()
		return CONDITIONS.IsBRSoloMode()
	end,
	ShouldAllowInventoryRequest = function()
		return not CONDITIONS.IsBRSoloMode() or CONDITIONS.IsBRTutorial()
	end,
	ShouldAllowInventoryRequestWZWIP = function()
		return CONDITIONS.IsWZWipFlowEnabled() and CONDITIONS.ShouldAllowInventoryRequest()
	end,
	ShouldAllowInventoryRequestMW = function()
		return CONDITIONS.IsWZWipDvarDisabled() and CONDITIONS.ShouldAllowInventoryRequest()
	end,
	IsQABotSkipActive = function()
		return Dvar.IBEGCHEFE("MNPOQRNMTO") or false
	end,
	IsBRSoloMode = function()
		return (Dvar.CFHDGABACF("scr_br_teamsize") or 0) == 1
	end,
	ShouldDisableSquadUI = function()
		return CONDITIONS.IsBloodMoney() or CONDITIONS.IsBRSoloMode() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsWZPayload() or CONDITIONS.IsWZRatRace()
	end,
	ShowEscapeCapZone = function()
		return Dvar.DHEEJCCJBH("scr_esc_capzone") == "1"
	end,
	IsKillstreaksAllowed = function()
		local var_226_0 = {
			enabled = 1,
			disabled = 0
		}
		local var_226_1 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if CONDITIONS.IsArenaGameType() then
			return false
		end

		if CONDITIONS.IsDropZoneGameType() or var_226_1 == "infect" then
			return true
		end

		if Engine.ECHCFGDDDF() then
			local var_226_2 = Engine.IJEBHJIJF()

			if Game.BFEEGCHICA(var_226_2, "ui_disable_killstreaks") then
				return false
			end
		end

		local var_226_3 = Dvar.CFHDGABACF("scr_game_allowKillstreaks")
		local var_226_4 = Dvar.CFHDGABACF("scr_" .. var_226_1 .. "_allowKillstreaks")

		if var_226_4 ~= nil and var_226_4 ~= var_226_3 then
			var_226_3 = var_226_4
		end

		return var_226_3 ~= nil and var_226_3 ~= var_226_0.disabled
	end,
	IsUsingMatchStatus = function()
		local var_227_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_227_0 ~= "cmd" and var_227_0 ~= "br" and var_227_0 ~= "defcon" and var_227_0 ~= "dm" and var_227_0 ~= "trial" and var_227_0 ~= "gun" and var_227_0 ~= "oic"
	end,
	IsUsingMatchRounds = function()
		if CONDITIONS.IsLaunchChunk() then
			return false
		end

		local var_228_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_228_0 == "cyber" or var_228_0 == "sd" or var_228_0 == "siege" or var_228_0 == "arena" or var_228_0 == "dd" or var_228_0 == "rugby"
	end,
	IsUsingMatchProgress = function()
		if CONDITIONS.IsLaunchChunk() then
			return true
		end

		local var_229_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_229_0 == "war" or var_229_0 == "dom" or var_229_0 == "hq" or var_229_0 == "koth" or var_229_0 == "grnd" or var_229_0 == "conf" or var_229_0 == "grind" or var_229_0 == "arm" or var_229_0 == "tdef" or var_229_0 == "brtdm"
	end,
	IsUsingMatchStatusNonTDM = function()
		local var_230_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_230_0 ~= "cmd" and var_230_0 ~= "br" and var_230_0 ~= "arm" and var_230_0 ~= "defcon" and var_230_0 ~= "war"
	end,
	IsUsingDefconMatchStatus = function()
		local var_231_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_231_0 == "arm" or var_231_0 == "defcon"
	end,
	IsUsingBrStyleMatchStatus = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsUsingFFAMatchStatus = function()
		local var_233_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_233_0 == "dm" or var_233_0 == "gun" or var_233_0 == "oic"
	end,
	IsUsingCompass = function()
		if Dvar.CFHDGABACF("scr_game_navBarHide") == 1 then
			return false
		end

		return Dvar.DHEEJCCJBH("MOLPOSLOMO") ~= "arena"
	end,
	IsUsingFieldUpgrade = function()
		local var_235_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if var_235_0 == "br" or var_235_0 == "brm" or var_235_0 == "trial" or var_235_0 == "cp_wave_sv" or var_235_0 == "cp_specops" then
			return false
		end

		if Engine.ECHCFGDDDF() then
			local var_235_1 = Engine.IJEBHJIJF()

			if Game.BFEEGCHICA(var_235_1, "ui_disable_fieldupgrades") then
				return false
			end
		end

		local var_235_2 = Dvar.CFHDGABACF("scr_game_allowSupers")
		local var_235_3 = GameX.GetGameMode()
		local var_235_4 = Dvar.CFHDGABACF("scr_" .. var_235_3 .. "_allowSupers")

		if var_235_4 ~= nil and var_235_4 ~= var_235_2 then
			var_235_2 = var_235_4
		end

		return var_235_2 ~= nil and var_235_2 ~= 0
	end,
	IsTournamentFullSize = function()
		return Tournament.DEAFAIEJGI() == 4
	end,
	IsNukeEndState = function(arg_237_0, arg_237_1)
		local var_237_0

		if Engine.ECHCFGDDDF() then
			var_237_0 = Game.BFEEGCHICA(arg_237_1, "ui_nuke_end_milliseconds")
		end

		return var_237_0 and var_237_0 > 0
	end,
	ButtonPrimary = function(arg_238_0, arg_238_1)
		return arg_238_1.button == "primary"
	end,
	ButtonSecondary = function(arg_239_0, arg_239_1)
		return arg_239_1.button == "secondary"
	end,
	ButtonAltOne = function(arg_240_0, arg_240_1)
		return arg_240_1.button == "alt1"
	end,
	ButtonAltTwo = function(arg_241_0, arg_241_1)
		return arg_241_1.button == "alt2"
	end,
	ButtonRightTrigger = function(arg_242_0, arg_242_1)
		return arg_242_1.button == "right_trigger"
	end,
	ButtonLeftTrigger = function(arg_243_0, arg_243_1)
		return arg_243_1.button == "left_trigger"
	end,
	ButtonRightShoulder = function(arg_244_0, arg_244_1)
		return arg_244_1.button == "shoulderr"
	end,
	ButtonLeftShoulder = function(arg_245_0, arg_245_1)
		return arg_245_1.button == "shoulderl"
	end,
	ButtonRightStick = function(arg_246_0, arg_246_1)
		return arg_246_1.button == "right_stick"
	end,
	ButtonLeftStick = function(arg_247_0, arg_247_1)
		return arg_247_1.button == "left_stick"
	end,
	ButtonLeft = function(arg_248_0, arg_248_1)
		return arg_248_1.button == "left"
	end,
	ButtonRight = function(arg_249_0, arg_249_1)
		return arg_249_1.button == "right"
	end,
	ButtonUp = function(arg_250_0, arg_250_1)
		return arg_250_1.button == "up"
	end,
	ButtonDown = function(arg_251_0, arg_251_1)
		return arg_251_1.button == "down"
	end,
	ButtonStart = function(arg_252_0, arg_252_1)
		return arg_252_1.button == "start"
	end,
	ButtonSelect = function(arg_253_0, arg_253_1)
		return arg_253_1.button == "select"
	end,
	ButtonOptions = function(arg_254_0, arg_254_1)
		return arg_254_1.button == "options"
	end,
	ButtonGoStand = function(arg_255_0)
		return arg_255_0.button == "gostand"
	end,
	ButtonEscape = function(arg_256_0)
		return arg_256_0.button == "escape"
	end,
	InKillCam = function()
		return Engine.EAAHGICFBD() and Game.BJIIBIABBF()
	end,
	IsCinematicCameraActive = function()
		return Engine.EAAHGICFBD() and Game.ECFDEFHGBD()
	end,
	IsGameMode = function(arg_259_0)
		return GameX.GetGameMode() == arg_259_0
	end,
	IsHardcoreMode = function()
		return GameX.IsHardcoreMode()
	end,
	isHardcoreModeWithKillstreaksAllowed = function()
		return CONDITIONS.IsHardcoreMode() and CONDITIONS.IsKillstreaksAllowed()
	end,
	IsNotHardcoreMode = function()
		return not GameX.IsHardcoreMode()
	end,
	IsRealismMode = function()
		return GameX.IsRealismMode()
	end,
	IsRealismBR = function()
		return CONDITIONS.IsMagmaGameMode() and CONDITIONS.IsRealismMode()
	end,
	IsBRSandbox = function()
		local var_265_0 = Dvar.CFHDGABACF("scr_br_sandbox_standard") == 0
		local var_265_1 = Dvar.DHEEJCCJBH("scr_br_gametype") == "sandbox"

		return CONDITIONS.IsMagmaGameMode() and var_265_1 and not var_265_0
	end,
	IsFultonEnabled = function()
		return CONDITIONS.IsBloodMoneyOrIsRiskGametype()
	end,
	IsTacMapGulagInfoEnabled = function()
		return not (CONDITIONS.IsBRTutorial() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsBRInflation() or not Dvar.IBEGCHEFE("scr_br_gulag") or CONDITIONS.IsResurgenceRespawn() or CONDITIONS.IsBRZombies() or CONDITIONS.IsBRExfiltrationMode() or CONDITIONS.IsBRX2Gametype() or CONDITIONS.IsWZRumble() or CONDITIONS.IsWZRatRace())
	end,
	IsTacMapInfoHeaderEnabled = function()
		return not (CONDITIONS.IsBRTutorial() or CONDITIONS.IsBRTutorialMap() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsBRX2Gametype() or CONDITIONS.IsWZRumble() or CONDITIONS.IsWZRatRace())
	end,
	IsOnlineMatch = function()
		return GameX.IsOnlineMatch()
	end,
	IsOnlineMatchNonSplitscreen = function()
		return GameX.IsOnlineMatch() and (not not Engine.DDJFBBJAIG() or not GameX.IsSplitscreen())
	end,
	IsRankedMatch = function()
		return GameX.IsRankedMatch()
	end,
	IsAllowedToSpectate = function(arg_272_0, arg_272_1)
		local var_272_0 = 0

		if MatchRules.EAIEFBHGJ() then
			local var_272_1 = DataSources.inGame.MP.match.team:GetValue(arg_272_1)

			var_272_0 = MatchRules.BIJEDCBCBH("commonOption", "spectateModeAllowed")
		end

		return var_272_0 ~= 0 and not CONDITIONS.IsLaunchChunk()
	end,
	IsDead = function(arg_273_0)
		return Game.BFEEGCHICA(arg_273_0, "ui_session_state") == "dead"
	end,
	IsSpectating = function(arg_274_0)
		if not Engine.EAAHGICFBD() then
			return false
		end

		local var_274_0 = Game.BFEEGCHICA(arg_274_0, "ui_session_state")

		return Game.EDJIEDJ() or var_274_0 == "spectator"
	end,
	IsInSpectatorTeam = function(arg_275_0)
		return Game.DHEDEIHGF() == Teams.spectator
	end,
	IsSpectatingNotCODCaster = function(arg_276_0)
		return CONDITIONS.IsSpectating(arg_276_0) and not CODCASTER_CONDITIONS.IsCODCaster()
	end,
	IsSplitscreen = function()
		return not Engine.DDJFBBJAIG() and GameX.IsSplitscreen()
	end,
	IsFriendsButtonAccessible = function(arg_278_0, arg_278_1)
		local var_278_0 = Engine.DBAEJAHFGJ(arg_278_1)

		return IsOnlineMatch() and not var_278_0 and not Engine.CAADCDEEIA()
	end,
	IsNVGActionable = function(arg_279_0, arg_279_1)
		return DataSources.inGame.player.nvgActionable:GetValue(arg_279_1)
	end,
	WeaponHasAltMode = function(arg_280_0)
		return DataSources.inGame.player.currentWeapon.hasAltMode:GetValue(arg_280_0)
	end,
	NeedsDialogue = function()
		return CONDITIONS.IsCaptive or CONDITIONS.IsStpetersburg
	end,
	IsBRHalloweenPublicMatch = function()
		return not Engine.DDJFBBJAIG() and CONDITIONS.IsPublicMatch() and CONDITIONS.IsMagmaGameMode() and not CONDITIONS.IsRebirthGametype() and not CONDITIONS.IsBRResurgenceTrialsGametype() and Dvar.CFHDGABACF("scr_enable_server_halloween_content") == 1
	end,
	IsBRHalloweenMatch = function()
		return not Engine.DDJFBBJAIG() and CONDITIONS.IsMagmaGameMode() and Dvar.CFHDGABACF("scr_enable_server_halloween_content") == 1
	end,
	UseJumpscares = function()
		return CONDITIONS.IsBRHalloweenMatch() or CONDITIONS.IsBRGhosts()
	end,
	ShouldShowTacMapChallenges = function()
		if Dvar.IBEGCHEFE("challenge_summary_test") then
			return true
		end

		return not CONDITIONS.IsBRHalloweenPublicMatch() and not CONDITIONS.IsSeasonalEventTacMapChecklistActive() and CONDITIONS.IsPublicMatch()
	end,
	ShouldShowTacMapOnboardingChallenges = function()
		if Dvar.IBEGCHEFE("challenge_summary_test") then
			return false
		end

		return not CONDITIONS.IsBRHalloweenPublicMatch() and not CONDITIONS.IsSeasonalEventTacMapChecklistActive() and CONDITIONS.IsPublicMatch()
	end,
	IsUsingPublicEventsMeter = function()
		return Dvar.IBEGCHEFE("br_pe_meter_enabled")
	end,
	UseCACBreadCrumbs = function()
		return Engine.DDJFBBJAIG() and Engine.EAAHGICFBD() and not IsPrivateMatch() and not IsSystemLink()
	end,
	IsDraftEnabled = function()
		return (IsPrivateMatch() or IsSystemLink()) and LoadoutDrafting.BADICCBICG() and Engine.ECHCFGDDDF() and MLG.AreMLGRulesEnabled() and not Dvar.IBEGCHEFE("MLNSOPOTNQ")
	end,
	AreLootStreaksEnabled = function()
		return not Dvar.IBEGCHEFE("LNSMNRRQN")
	end,
	IsTeamChoiceAllowed = function()
		if CONDITIONS.IsLaunchChunk() then
			return false
		end

		local var_291_0 = DataSources.inGame.MP.match.gameType:GetValue(0)

		return StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_291_0, CSV.gameTypesTable.cols.teamChoice) == "1" and not GameX.IsRankedMatch() and not MLG.JIHGCIJCG()
	end,
	IsTeamOrCodcasterChoiceAllowed = function()
		return (CONDITIONS.IsTeamChoiceAllowed() or CODCASTER_CONDITIONS.IsCODCastingAllowed()) and not CODCASTER_CONDITIONS.IsCODCaster()
	end,
	IsClassChoiceAllowed = function(arg_293_0, arg_293_1)
		local var_293_0 = DataSources.inGame.MP.match.gameType:GetValue(arg_293_1)
		local var_293_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_293_0, CSV.gameTypesTable.cols.classChoice) == "1" and not GameX.UsesFakeLoadout()
		local var_293_2 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_293_0, CSV.gameTypesTable.cols.teamChoice) == "1" and not GameX.IsRankedMatch()
		local var_293_3 = Game.DHEDEIHGF()
		local var_293_4 = var_293_2 and (var_293_3 == Teams.allies or var_293_3 == Teams.axis) or not var_293_2

		if var_293_0 == MP.GameMode.ArenaGameType then
			if DataSources.inGame.HUD.arenaLoadoutType:GetValue(arg_293_1) == 1 then
				var_293_1 = true
			else
				var_293_1 = false
			end
		elseif var_293_0 == MP.GameMode.FFAGameType then
			var_293_1 = (not Game.BFEEGCHICA(arg_293_1, "ui_skip_loadout") or false) and true
		end

		if CONDITIONS.ShouldAllowChoosingClassBR(arg_293_1) and not CONDITIONS.IsBMTutorialMap() then
			var_293_1 = true
		end

		return var_293_1 and var_293_4
	end,
	IsRetryButtonAllowed = function(arg_294_0, arg_294_1)
		if CONDITIONS.IsTrialGameType() then
			return DataSources.inGame.MP.trialRetryDisabled:GetValue(arg_294_1) == false
		else
			return false
		end
	end,
	IsAliensNotSolo = function()
		local var_295_0 = Engine.EAIICIFIFA()
		local var_295_1 = Dvar.IBEGCHEFE("LSTLQTSSRM")
		local var_295_2 = Dvar.IBEGCHEFE("LNQLRSNMQS")

		return not var_295_0 or not var_295_1 or not var_295_2
	end,
	IsAliensSolo = function()
		local var_296_0 = Engine.EAIICIFIFA()
		local var_296_1 = Dvar.IBEGCHEFE("LNQLRSNMQS")

		return var_296_0 and var_296_1
	end,
	IsAliensOnline = function()
		return Engine.EAIICIFIFA() and not IsSystemLink()
	end,
	IsSystemLink = function()
		return IsSystemLink()
	end,
	IsAliensSoloOrSystemLink = function()
		local var_299_0 = CONDITIONS.IsAliensSolo()
		local var_299_1 = CONDITIONS.IsSystemLink()

		return var_299_0 or var_299_1
	end,
	IsLocalPlayAllowed = function()
		return Engine.BHCBGBFEJI()
	end,
	IsPrivateMatchTournament = function(arg_301_0)
		local var_301_0 = LUI.FlowManager.GetScopedData(arg_301_0)

		return Dvar.IBEGCHEFE("LTPLSOTTSR") and var_301_0 and var_301_0.isTournament
	end,
	CanAccessOfflineMenu = function(arg_302_0)
		return not Engine.CGABICJHAI() and not CONDITIONS.ForceOnlineMenus()
	end,
	CanDisplayNGBlade = function()
		return Dvar.IBEGCHEFE("NQPKQNMQSR")
	end,
	ShowWZSeasonalOpeningScreenPC = function(arg_304_0)
		local var_304_0 = Engine.BECCFCBIAA("hasSeenWZSeasonalOpeningScreenPC_Version", arg_304_0)
		local var_304_1 = Dvar.CFHDGABACF("NLPPPROSSP")

		return Dvar.IBEGCHEFE("MSQRKTTKSS") and var_304_0 < var_304_1 and not Dvar.IBEGCHEFE("MNPOQRNMTO")
	end,
	IsSpecificIntegerOmnvarEqualTo = function(arg_305_0, arg_305_1, arg_305_2)
		return Game.BFEEGCHICA(arg_305_0, arg_305_1) == arg_305_2
	end,
	IsSpecificIntegerOmnvarGreaterThan = function(arg_306_0, arg_306_1, arg_306_2)
		return arg_306_2 < Game.BFEEGCHICA(arg_306_0, arg_306_1)
	end,
	IsSpecificIntegerOmnvarGreaterThanOrEqualTo = function(arg_307_0, arg_307_1, arg_307_2)
		return arg_307_2 <= Game.BFEEGCHICA(arg_307_0, arg_307_1)
	end,
	IsSpecificIntegerOmnvarLessThan = function(arg_308_0, arg_308_1, arg_308_2)
		return arg_308_2 > Game.BFEEGCHICA(arg_308_0, arg_308_1)
	end,
	IsSpecificIntegerOmnvarLessThanOrEqualTo = function(arg_309_0, arg_309_1, arg_309_2)
		return arg_309_2 >= Game.BFEEGCHICA(arg_309_0, arg_309_1)
	end,
	IsSpecificOmnvarTrue = function(arg_310_0, arg_310_1)
		return Game.BFEEGCHICA(arg_310_0, arg_310_1)
	end,
	IsConsoleGame = function()
		return Engine.HDGDBCJFG()
	end,
	IsPS4 = function()
		return Engine.CIEGIACHAE()
	end,
	IsBackCompatPS5 = function()
		return Engine.CFHHBHFCCA()
	end,
	IsSony = function()
		return Engine.FHHBECDJA()
	end,
	IsPC = function()
		return not Engine.HDGDBCJFG()
	end,
	IsPCOrPS4 = function()
		return not Engine.HDGDBCJFG() or Engine.CIEGIACHAE()
	end,
	IsPCOrXB3 = function()
		return not Engine.HDGDBCJFG() or Engine.BAHIIBFDDG()
	end,
	IsPcAndNotSingleplayer = function()
		return Engine.CGABICJHAI() and not Engine.CAADCDEEIA()
	end,
	IsBattleNet = function()
		return Engine.DBFCJBDJEC()
	end,
	IsXboxOne = function()
		return Engine.BAHIIBFDDG()
	end,
	IsXboxLive = function()
		return Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()
	end,
	IsXbox = function()
		return Engine.FJCIBEDII()
	end,
	IsLaze = function()
		return Engine.CHDGBEFDHB()
	end,
	IsPCApp = function()
		return Engine.BEFACAIFDD()
	end,
	IsPCDesktop = function()
		return Engine.CGABICJHAI() and not Engine.BEFACAIFDD()
	end,
	IsWeGame = function()
		return Engine.ECAJCAJJGF()
	end,
	IsWeGameGovBanned = function()
		return Engine.ECAJCAJJGF() and Dvar.IBEGCHEFE("LTNRRMQNSQ")
	end,
	InFrontEndAndNotWeGameGovBanned = function()
		return CONDITIONS.InFrontend() and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsUbiConnect = function()
		return Engine.CHBHFFFIGH()
	end,
	IsPCMSStore = function()
		return Engine.EAABDHIDFJ()
	end,
	IsLazeOrOutrun = function()
		return Engine.CHDGBEFDHB() or Engine.CHBHFFFIGH() or Engine.EAABDHIDFJ()
	end,
	IsStreamingFromCloud = function()
		return Engine.CHBDHJJDGE()
	end,
	IsCrossplay = function()
		return Dvar.IBEGCHEFE("SMKRLSNRT")
	end,
	IsBattleNetOrCrossplay = function()
		return Engine.DBFCJBDJEC() or Dvar.IBEGCHEFE("SMKRLSNRT")
	end,
	IsLaunchChunk = function()
		return Dvar.IBEGCHEFE("MPNRKLKOKR") and CONDITIONS.IsConsoleGame()
	end,
	IsKoreanAccount = function()
		return Engine.DDHFCGHJEA()
	end,
	IsKoreanOrKorean15Account = function()
		return Engine.DDHFCGHJEA() or Engine.FABABBDBA()
	end,
	IsBattleNetLanOnly = function()
		return Engine.BJGAADIDFH()
	end,
	IsKoreanIGR = function()
		return Engine.DIEEIEFCFF()
	end,
	IsInKoreanIGRPaidSession = function()
		return Engine.GEHBEDCEC()
	end,
	IsUserAGuest = function(arg_341_0)
		return Engine.DBAEJAHFGJ(arg_341_0)
	end,
	IsUserSignedIn = function(arg_342_0)
		return Engine.CDCCDDJAJJ(arg_342_0)
	end,
	IsUserSignedInBnet = function(arg_343_0)
		return Engine.CDCCDDJAJJ(arg_343_0) and Engine.DBFCJBDJEC()
	end,
	IsUserSignedInBnetFrontend = function(arg_344_0)
		return Engine.CDCCDDJAJJ(arg_344_0) and Engine.DBFCJBDJEC() and Engine.DDJFBBJAIG()
	end,
	IsUserSignedInDemonware = function(arg_345_0)
		return Engine.BACCCIHGDG() and Engine.CJJAFGIFAC(arg_345_0)
	end,
	IsCplab = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_lab"
	end,
	IsCpSoSafehouse = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_so_safehouse"
	end,
	IsCpRaidMode = function()
		local var_348_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		if Engine.EAIICIFIFA() and (var_348_0 == "cp_raid_complex" or var_348_0 == "cp_dntsk_raid") then
			return true
		else
			return false
		end
	end,
	IsCpRaidComplex = function()
		if Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_raid_complex" then
			return true
		else
			return false
		end
	end,
	IsCpDntskRaid = function()
		if Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_dntsk_raid" then
			return true
		else
			return false
		end
	end,
	IsEuropa = function()
		return Game.ECIFCJJJIA() == "europa"
	end,
	IsPearlHarbor = function()
		local var_352_0 = Game.ECIFCJJJIA()

		return var_352_0 == "phparade" or var_352_0 == "phstreets" or var_352_0 == "phspace"
	end,
	IsMoon = function()
		local var_353_0 = Game.ECIFCJJJIA()

		return var_353_0 == "moon_port" or var_353_0 == "moonjackal"
	end,
	IsTitan = function()
		local var_354_0 = Game.ECIFCJJJIA()

		return var_354_0 == "titan" or var_354_0 == "titanjackal"
	end,
	IsRogue = function()
		return Game.ECIFCJJJIA() == "rogue"
	end,
	IsPrisoner = function()
		return Game.ECIFCJJJIA() == "prisoner"
	end,
	IsHeist = function()
		local var_357_0 = Game.ECIFCJJJIA()

		return var_357_0 == "heist" or var_357_0 == "heistspace"
	end,
	IsMars = function()
		return Game.ECIFCJJJIA() == "marsbase"
	end,
	IsYard = function()
		return Game.ECIFCJJJIA() == "yard"
	end,
	IsCaptive = function()
		return Game.ECIFCJJJIA() == "captive"
	end,
	IsStpetersburg = function()
		return Game.ECIFCJJJIA() == "stpetersburg"
	end,
	IsSafehouseFinale = function()
		return Game.ECIFCJJJIA() == "safehouse_finale"
	end,
	IsProxyWar = function()
		return Game.ECIFCJJJIA() == "proxywar"
	end,
	IsInCredits = function()
		return Dvar.IBEGCHEFE("credits_active") or Dvar.CFHDGABACF("ROQSKRSPL") == 1
	end,
	IsSPDummyTabletMap = function()
		local var_365_0 = Game.ECIFCJJJIA()

		return var_365_0 == "marines" or var_365_0 == "safehouse_finale"
	end,
	IsBRTutorial = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == (Dvar.DHEEJCCJBH("wz_tutorial_map") or "mp_br_tut2")
	end,
	IsFTUI = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_br_tut2"
	end,
	IsBRTutorialMap = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == (Dvar.DHEEJCCJBH("wz_tutorial_map") or "mp_br_tut2")
	end,
	IsBRTDMMap = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "brtdm"
	end,
	IsBMTutorialMap = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_bm_tut"
	end,
	IsBRQuarryTutorialMap = function()
		local var_371_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		if Game.GEAJDFCDC() then
			var_371_0 = Game.ECIFCJJJIA()
		end

		return var_371_0 == "mp_br_quarry"
	end,
	IsBMTutorialMapAvailable = function()
		return Dvar.IBEGCHEFE("NNTRQOMLSQ")
	end,
	IsBRPracticeModeAvailable = function()
		return Dvar.IBEGCHEFE("MNRTKTQMLS")
	end,
	IsBRTutorialRetryEnabled = function()
		if CONDITIONS.IsBRTutorial() then
			return Dvar.IBEGCHEFE("NQTKKMTSKL")
		end

		return false
	end,
	IsBRSpectateEnabled = function(arg_375_0, arg_375_1)
		local var_375_0 = LUI.PostGameManager.IsBRExfilStarted(arg_375_1)

		return CONDITIONS.IsMagmaGameMode() and CONDITIONS.IsNotBloodMoneyAndIsNotRiskGametypeAndIsNotPayload() and not CONDITIONS.IsWZRumble() and not CONDITIONS.IsBRTutorial() and not var_375_0 and not CONDITIONS.IsBRX1Variant() and not CONDITIONS.IsBRRevealMode() and not CONDITIONS.IsBRRevealTwoMode()
	end,
	CanSkipWZTutorial = function()
		return Dvar.IBEGCHEFE("LSPSKLPNQT")
	end,
	CanShowRoundCountTimer = function()
		return not CONDITIONS.IsBRTutorialMap()
	end,
	AreLoadingHintsEnabled = function()
		return CONDITIONS.IsBRTDMMap() or CONDITIONS.IsMagmaGameMode() and not CONDITIONS.IsBRTutorial() and not CONDITIONS.IsBMTutorialMap()
	end,
	IsTrialLicense = function()
		return Engine.BDGIEFCCJE()
	end,
	ArePartiesEnabledInMainMenu = function()
		return Dvar.IBEGCHEFE("MPNKQNOKKS") and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsSocialEnabledInMainMenu = function()
		local var_381_0 = Engine.FABABBDBA() and not Engine.GEHBEDCEC()

		return Dvar.IBEGCHEFE("MPNKQNOKKS") and not CONDITIONS.IsWeGameGovBanned() and not var_381_0
	end,
	InPrivatePartyAndNotHost = function()
		return Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()
	end,
	IsPrivatePartyHost = function()
		return Lobby.BGIADHIHAG()
	end,
	IsPrivatePartyHostInNonSystemLink = function()
		return Lobby.BGIADHIHAG() and not IsSystemLink()
	end,
	IsFifthWheelActive = function()
		return Dvar.IBEGCHEFE("LONRNSRQMQ")
	end,
	HideBuyMWPromptMagmaBlades = function()
		if Dvar.IBEGCHEFE("MNTMKQRSTQ") then
			return LUI.FlowManager.IsInStack("MainMenuOffline")
		else
			return false
		end
	end,
	IsOnlineAndSignedIn = function(arg_387_0)
		return Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_387_0) and Engine.CJJAFGIFAC(arg_387_0)
	end,
	ShouldHideButtonPrompts = function()
		return Dvar.IBEGCHEFE("hide_button_prompts") == true
	end,
	ShouldHideButtonPromptSP = function()
		return Dvar.IBEGCHEFE("hide_button_prompts") or not Engine.EAAHGICFBD()
	end,
	KillswitchMPWeaponIcon = function()
		return Dvar.IBEGCHEFE("ui_killswitch_mp_weapon_icon") == true
	end,
	AreWeaponVariantsEnabled = function(arg_391_0)
		return Dvar.IBEGCHEFE("OLMOTLRSPK") == true and CONDITIONS.IsUserSignedInDemonware(arg_391_0)
	end,
	ForceOnlineMenus = function()
		return Dvar.IBEGCHEFE("LMMRONPQMO")
	end,
	IsGameBattlesAllowed = function()
		if Engine.BDGIEFCCJE() then
			return false
		elseif not Engine.ECHCFGDDDF() then
			return false
		elseif Engine.CBGGCEBHDI() then
			if Dvar.IBEGCHEFE("LPRROTMQNK") then
				return true
			elseif Engine.DBFCJBDJEC() then
				return Dvar.IBEGCHEFE("NMKLTMPKRM")
			elseif Engine.CIEGIACHAE() then
				return Dvar.IBEGCHEFE("LPKLTLRSNQ")
			elseif Engine.BAHIIBFDDG() then
				return Dvar.IBEGCHEFE("MQOKLRKKNQ")
			end
		end

		return false
	end,
	IsInGameBattlesMatch = function()
		return Dvar.IBEGCHEFE("MTMMPLSRNL")
	end,
	IsGameBattlesXPEnabled = function()
		return not CONDITIONS.IsInGameBattlesMatch() or Dvar.IBEGCHEFE("OLLOKOKKSM")
	end,
	IsSurvivalModeAllowed = function()
		return Dvar.IBEGCHEFE("NRRNOTRMOP")
	end,
	IsTournamentModeAllowed = function()
		return Dvar.IBEGCHEFE("NLPONNQNRS") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsPrivateTournamentAllowed = function()
		return Dvar.IBEGCHEFE("NLPONNQNRS") and Engine.ECHCFGDDDF() and Dvar.IBEGCHEFE("LTPLSOTTSR") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsOGPlaylistAllowed = function()
		return not Dvar.IBEGCHEFE("LPTSRPTOQQ") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsMagmaEnabled = function()
		return Dvar.IBEGCHEFE("NMNPSRKPPP") and not CONDITIONS.IsWeGameGovBanned()
	end,
	ShouldDisplayUpsellPopup = function(arg_401_0)
		return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_401_0) and not Engine.FABABBDBA() and Engine.BACCCIHGDG()
	end,
	ShouldDisplayAARUpsellPrompt = function(arg_402_0)
		return Dvar.IBEGCHEFE("MOMKSMKTOQ") and not Engine.CFHBIHABCB(arg_402_0) and not Engine.FABABBDBA()
	end,
	IsCampaignAllowed = function(arg_403_0)
		return Engine.CEGDBDIIIE(CoD.PlayMode.SP, arg_403_0)
	end,
	IsMultiplayerAllowed = function(arg_404_0)
		return Engine.CEGDBDIIIE(CoD.PlayMode.Core, arg_404_0)
	end,
	IsCoopAllowed = function(arg_405_0)
		return Engine.CEGDBDIIIE(CoD.PlayMode.Aliens, arg_405_0)
	end,
	IsMagmaGameMode = function()
		if Engine.DDJFBBJAIG() then
			return Dvar.IBEGCHEFE("QTQRQPLNK") or CONDITIONS.IsWZWipDvarEnabled()
		else
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
		end
	end,
	IsBattleRoyaleGameMode = function()
		return CONDITIONS.IsMagmaGameMode() and not CONDITIONS.IsBloodMoney() and not CONDITIONS.IsRiskGametype() and not CONDITIONS.IsBRKingSlayer() and not CONDITIONS.IsWZRatRace() and not IsSystemLink()
	end,
	IsCoreWZGameMode = function()
		return Dvar.IBEGCHEFE("MPTLNOMMNS") and CONDITIONS.IsMagmaGameMode()
	end,
	AreWZLoadoutsEnabled = function()
		return Dvar.IBEGCHEFE("LNLMORMPTS")
	end,
	UsingWZLoadouts = function()
		if CONDITIONS.AreWZLoadoutsEnabled() then
			if Engine.DDJFBBJAIG() then
				return Dvar.IBEGCHEFE("QTQRQPLNK")
			else
				local var_410_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

				return var_410_0 == "br" or var_410_0 == "brtdm"
			end
		end

		return false
	end,
	UsingWZSquadWidgetV2 = function()
		return not Dvar.IBEGCHEFE("hud_squad_widget_V2_disabled")
	end,
	UsingWZSimpleUI = function()
		return CONDITIONS.InGame() and (CONDITIONS.IsMagmaGameMode() or CONDITIONS.IsBRTDMGameType())
	end,
	NotUsingWZSimpleUI = function()
		return not CONDITIONS.UsingWZSimpleUI()
	end,
	IsWZWipDvarEnabled = function()
		return Dvar.IBEGCHEFE("MLQNQTRRTK")
	end,
	IsWZWipDvarDisabled = function()
		return not Dvar.IBEGCHEFE("MLQNQTRRTK")
	end,
	IsWZWipDvarAndNotUsingWZSimpleUI = function()
		return CONDITIONS.IsWZWipDvarEnabled() and CONDITIONS.NotUsingWZSimpleUI()
	end,
	IsNotWZWipDvarAndNotUsingWZSimpleUI = function()
		return not CONDITIONS.IsWZWipDvarEnabled() and CONDITIONS.NotUsingWZSimpleUI()
	end,
	IsWZWipFlowEnabled = function()
		return CONDITIONS.IsMagmaGameMode() and Dvar.IBEGCHEFE("MLQNQTRRTK")
	end,
	IsWZWipOperatorFlowEnabled = function()
		return CONDITIONS.IsMagmaGameMode() and Dvar.IBEGCHEFE("LNNNKNLPKP")
	end,
	IsWZWipFrontend = function()
		return Engine.DDJFBBJAIG() and CONDITIONS.IsWZWipFlowEnabled()
	end,
	ShouldUseCrossTitleIds = function()
		return Dvar.CFHDGABACF("PMLLKSRLT") ~= 0
	end,
	IsBattlePassBundleTopperActive = function(arg_422_0)
		local var_422_0 = tonumber(Engine.DEIDGHDBHD())
		local var_422_1 = Dvar.CFHDGABACF("LKOKTLQSPT")

		return var_422_1 and var_422_0 < var_422_1 and not BATTLEPASS.IsOwned(arg_422_0)
	end,
	IsBRFirstMatchTierSkipRewardEnabled = function()
		return not CONDITIONS.IsWZWipDvarEnabled()
	end,
	AllT9WeaponsAreHidden = function()
		return CONDITIONS.IsWZWipFlowEnabled() and Dvar.IBEGCHEFE("ui_hide_all_t9_weapons")
	end,
	AreT9MasterChallengesEnabled = function()
		return Dvar.IBEGCHEFE("ui_t9_master_challenges_enabled")
	end,
	IsMPLeaderboardsAllowed = function()
		return not Dvar.IBEGCHEFE("MMLPKNNRMM")
	end,
	IsCPLeaderboardsAllowed = function()
		return not Dvar.IBEGCHEFE("LKMRLPORSK")
	end,
	IsLeaderboardsKillswitched = function()
		return Engine.ECHCFGDDDF() and Dvar.IBEGCHEFE("MMLPKNNRMM") or Engine.EAIICIFIFA() and Dvar.IBEGCHEFE("LKMRLPORSK")
	end,
	IsCombatRecordEnabled = function()
		return Dvar.IBEGCHEFE("MQNLOSMSQR")
	end,
	AreTabletsFilteredOut = function()
		local var_430_0 = Dvar.DHEEJCCJBH("MSLKNNLLMN")

		for iter_430_0 in string.gmatch(var_430_0, "([^%s]+)") do
			if iter_430_0 == "tablet" then
				return true
			end
		end

		return false
	end,
	IsNetStatsDevFeatureAvailable = function()
		return Dvar.IBEGCHEFE("SMLKTKNRO") ~= true
	end,
	IsClanUIEnabled = function()
		return CONDITIONS.IsMagmaGameMode() and Dvar.IBEGCHEFE("LTQTMMNNPM") ~= true
	end,
	IsClanInboxUIEnabled = function()
		return CONDITIONS.IsClanUIEnabled() and Dvar.IBEGCHEFE("NRTMLTSQMT") ~= true
	end,
	IsClanSearchDisabled = function()
		return CONDITIONS.IsClanUIEnabled() and Dvar.IBEGCHEFE("PLNSNPOT") == true
	end,
	IsClanRewardPreviewDisabled = function()
		return CONDITIONS.IsClanUIEnabled() and Dvar.IBEGCHEFE("OKNPOQOOKL") == true
	end,
	AreClanDescriptionsDisabled = function()
		return CONDITIONS.IsClanUIEnabled() and Dvar.IBEGCHEFE("NPTNPQTMOL") == true
	end,
	IsPauseLTMWidgetEnabled = function()
		return Dvar.IBEGCHEFE("MORLKNTQPR") == true
	end,
	PrivateListenAllowed = function(arg_438_0)
		local var_438_0 = LUI.FlowManager.GetScopedData(arg_438_0)
		local var_438_1 = Engine.EAIICIFIFA and not Dvar.IBEGCHEFE("MKQRLRTRNR")
		local var_438_2 = not Engine.CGABICJHAI() or Dvar.IBEGCHEFE("NRLPPKQTMN")

		return var_438_1 or var_438_2 or var_438_0.isTournament or Engine.BHICADFIHA()
	end,
	PrivateDsAllowed = function(arg_439_0)
		local var_439_0 = LUI.FlowManager.GetScopedData(arg_439_0)
		local var_439_1 = not Engine.EAIICIFIFA() or Dvar.IBEGCHEFE("MKQRLRTRNR")

		return Dvar.IBEGCHEFE("LMKKTLPSRN") == true and not var_439_0.isTournament and var_439_1
	end,
	IsPlayerRoleAllowed = function()
		if CONDITIONS.IsThirdGameMode() and CONDITIONS.IsCoopPvpeType() and (IsPrivateMatch() or IsSystemLink()) then
			return true
		else
			return not Engine.HEEFCICJE() and Engine.ECHCFGDDDF() and (IsPrivateMatch() or IsSystemLink())
		end
	end,
	AreCPChallengesActive = function()
		local var_441_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return IsPublicMatch() and var_441_0 == "cp_survival" or var_441_0 == "cp_wave_sv" and not IsSystemLink() or var_441_0 == "cp_specops" and not IsSystemLink()
	end,
	IsSplitScreenEnabled = function()
		return Dvar.IBEGCHEFE("MRNSTPNLPS")
	end,
	AreTrialsEnabled = function()
		return Dvar.IBEGCHEFE("LOMSTMNPRR")
	end,
	IsWZTrialsAccessEnabled = function()
		return Dvar.IBEGCHEFE("LOMSTMNPRR") and Dvar.IBEGCHEFE("NORMPNKNKQ")
	end,
	IsArmoryEnabled = function(arg_445_0, arg_445_1)
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_wave_sv" and not Engine.DDJFBBJAIG() then
			return false
		else
			return Dvar.IBEGCHEFE("MRRPNNKKPO") and CONDITIONS.IsUserSignedInDemonware(arg_445_1)
		end
	end,
	IsMPPrivateMatchEnabled = function()
		return Dvar.IBEGCHEFE("LQKTNLONLP")
	end,
	IsWZPrivateMatchEnabled = function()
		return Dvar.IBEGCHEFE("LOQQOSNQKN")
	end,
	IsWZPrivateMatch = function()
		return Dvar.IBEGCHEFE("LOQQOSNQKN") and IsPrivateMatch() and CONDITIONS.IsMagmaGameMode()
	end,
	IsWZPrivateMatchSoloMode = function()
		return Dvar.IBEGCHEFE("LOQQOSNQKN") and SQUAD.GetSquadSize() == 1
	end,
	IsTrialEventAvailable = function()
		return Dvar.IBEGCHEFE("NOPLKRPKQL")
	end,
	IsTrialEventAvailableInWZ = function()
		return CONDITIONS.IsTrialEventAvailable() and Dvar.IBEGCHEFE("NMTRNKQNOP")
	end,
	IsStoreAllowed = function()
		return Dvar.IBEGCHEFE("LNLPTMKPT") and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsWZStoreDisabled = function()
		return Dvar.IBEGCHEFE("NRNNNLSLLM") or CONDITIONS.IsWeGameGovBanned()
	end,
	IsNotWZStoreDisabledOrIsNotMagmaGameMode = function()
		return CONDITIONS.IsWZStoreDisabled() ~= true or CONDITIONS.IsMagmaGameMode() ~= true
	end,
	IsStoreBundlePreviewListEnabled = function()
		return Dvar.IBEGCHEFE("LSSPPSTLQ")
	end,
	IsBattlePassEnabled = function()
		return Dvar.IBEGCHEFE("NRTSOTKTOS") and not CONDITIONS.IsWeGameGovBanned() and not CONDITIONS.IsPostSeason()
	end,
	IsGiftingEnabled = function()
		if Dvar.IBEGCHEFE("MKTRNLMQQN") == false then
			return false
		end

		if Dvar.IBEGCHEFE("LTLLKPNNKT") == false then
			return false
		end

		return true
	end,
	ShouldShowTFACodePopup = function(arg_458_0)
		local var_458_0 = Dvar.IBEGCHEFE("NMQSOPLONQ")

		if TwoFactorAuth.CCGEHFAJD(arg_458_0) then
			return false
		end

		return var_458_0
	end,
	IsDisplayingBattlePassAAR = function(arg_459_0)
		return arg_459_0 and arg_459_0._displayBattlePassInAAR
	end,
	IsChallengeTabEnabled = function()
		return Dvar.IBEGCHEFE("NLSTMSNRKN") and not CONDITIONS.IsWeGameGovBanned()
	end,
	AreOnboardingChallengesEnabled = function()
		if Dvar.DEHABCCECE("MOTNRLNTRP") and Dvar.IBEGCHEFE("MOTNRLNTRP") and (CONDITIONS.IsWZWipFrontend() or CONDITIONS.IsWZWipFlowEnabled()) then
			return true
		end

		return false
	end,
	IsChallengesSummaryEnabled = function()
		return IsPublicMatch() and CONDITIONS.IsGameBattlesXPEnabled()
	end,
	IsTierSaleEnabled = function()
		local var_463_0 = Dvar.DHEEJCCJBH("MQTOPKPMRS")

		if var_463_0 and var_463_0 ~= "" then
			local var_463_1 = Engine.CCEJJCCDEG(var_463_0)
			local var_463_2 = Dvar.CFHDGABACF("MOKSKKQRLK")

			return var_463_2 and var_463_2 > 0 and var_463_1 and var_463_1 > 0
		end
	end,
	AreKeysEnabled = function()
		return Dvar.IBEGCHEFE("LPOOMOLLRQ") and CONDITIONS.IsStoreAllowed() and not CONDITIONS.IsWeGameGovBanned() and not Engine.BDGIEFCCJE()
	end,
	AreCODPointsEnabled = function()
		return Dvar.IBEGCHEFE("LNTOKPTKS") and CONDITIONS.IsStoreAllowed() and not CONDITIONS.IsWeGameGovBanned() and not Engine.BDGIEFCCJE()
	end,
	ShouldShowAnnouncersMenu = function()
		return Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() and not Dvar.IBEGCHEFE("LTLNQLSSK")
	end,
	AreBribeCratesEnabled = function()
		return Dvar.IBEGCHEFE("NTKOQLQNMS")
	end,
	IsEventCrateAllowed = function()
		return false
	end,
	ShowScorestreakValues = function()
		return Dvar.IBEGCHEFE("LMKMRSPR")
	end,
	FieldUpgradeFrontEndEnabled = function()
		return Dvar.CFHDGABACF("ui_killswitch_field_upgrade_mp_frontend") ~= 1
	end,
	IsCRMEnabled = function()
		return Dvar.IBEGCHEFE("MNLNLSTSNT")
	end,
	IsGameSetupEnabled = function()
		return Dvar.IBEGCHEFE("LKQKPMMRLK")
	end,
	IsGameModeSelectEnabled = function()
		return Dvar.IBEGCHEFE("NKSTOOTSMO")
	end,
	IsMapSelectEnabled = function()
		return Dvar.IBEGCHEFE("MSROMLONNT")
	end,
	IsIntelEnabled = function()
		return Dvar.IBEGCHEFE("LROKLTPMOM") and not CONDITIONS.IsMPIntelMenuEnabled()
	end,
	AreCustomGameRulesEnabled = function()
		return Dvar.IBEGCHEFE("TORMQRSOS")
	end,
	IsBotSetupEnabled = function()
		return Dvar.IBEGCHEFE("LNORNRSRLR")
	end,
	IsGameSetupEnabledAndCPDevMode = function()
		return CONDITIONS.IsGameSetupEnabled() and (not CONDITIONS.IsThirdGameMode() or Dvar.IBEGCHEFE("LSSRRSMNMR"))
	end,
	AreSpecOpsStarsEnabled = function()
		return Dvar.IBEGCHEFE("SNTTNKSRO")
	end,
	AreSpecOpsRewardsEnabled = function()
		return Dvar.IBEGCHEFE("OLLPNSOSNN")
	end,
	AreSpecOpsStarsEnabledAndIsSpecOpsGameType = function()
		return CONDITIONS.AreSpecOpsStarsEnabled() and CONDITIONS.IsSpecOpsGameType()
	end,
	IsVehicleCustomizeEnabled = function()
		return Dvar.IBEGCHEFE("NKNMQRQMM")
	end,
	IsVehicleHornsEnabled = function()
		return Dvar.IBEGCHEFE("NRPOLLOOLL")
	end,
	IsBattleTracksEnabled = function()
		return Dvar.IBEGCHEFE("NKORSMKORK")
	end,
	IsNewBarracksIdentityEnabled = function()
		return Dvar.IBEGCHEFE("NNPPKLQOSN")
	end,
	IsBlueprintStoreEnabled = function()
		return Dvar.IBEGCHEFE("MRKSTPMLT")
	end,
	IsLateGrindersEnabled = function()
		return Dvar.IBEGCHEFE("NPKTRSPLNN")
	end,
	SupersEnabled = function()
		return Dvar.CFHDGABACF("scr_supers_killswitch") ~= 1
	end,
	AreCompassEnemyElementsHidden = function(arg_489_0, arg_489_1)
		return Game.BFEEGCHICA(arg_489_1, "ui_compass_hide_enemy")
	end,
	IsUsingPerBulletHitMarkers = function()
		return Dvar.IBEGCHEFE("OMRLPMMPRL") == true
	end,
	KillswitchFieldUpgrades = function()
		return Dvar.IBEGCHEFE("ui_killswitch_field_upgrade_hud") == true
	end,
	IsPlayerStatusIconGulagTokenEnabled = function()
		return Dvar.CFHDGABACF("ui_killswitch_player_status_icon_gulag_token") ~= 1
	end,
	IsDisplayNameTag = function()
		return true
	end,
	IsJapanese = function()
		return IsLanguageJapanese()
	end,
	IsArabic = function()
		return IsLanguageArabic()
	end,
	IsArabicKBM = function()
		return Engine.BBDCAFEGDJ() == 0 and IsLanguageArabic()
	end,
	IsArabicSKU = function()
		return IsArabicSKU()
	end,
	IsLanguageAsian = function()
		return IsLanguageKorean() or IsLanguageChinese() or IsLanguageJapanese()
	end,
	IsDoubleXPActive = function()
		return LOOT.IsDoubleXPActive()
	end,
	IsPSDoubleXPActive = function()
		return LOOT.IsPSDoubleXPActive()
	end,
	IsDoubleWeaponXPActive = function()
		return LOOT.IsDoubleWeaponXPActive()
	end,
	HasDoubleXPTokens = function(arg_502_0)
		return LOOT.HasDoubleXPToken(arg_502_0)
	end,
	IsDoubleXPPossible = function()
		return CONDITIONS.IsDoubleXPActive() or CONDITIONS.ISPSDoubleXPActive() or CONDITIONS.IsDoubleWeaponXPActive()
	end,
	WeaponIndexIsPrimary = function(arg_504_0)
		return LUI.FlowManager.GetScopedData(arg_504_0).weaponSlot == WEAPON.PrimarySlot
	end,
	GunsmithCanMakeModification = function(arg_505_0, arg_505_1)
		if Engine.DDJFBBJAIG() and IsPublicMatch() and not MLG.IsCDLActive(arg_505_1) and not CONDITIONS.IsInGameBattlesMatch() then
			local var_505_0 = LUI.FlowManager.GetScopedData(arg_505_0)
			local var_505_1 = PlayerData.BFFBGAJGD(arg_505_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_505_0.loadoutIndex].weaponSetups[var_505_0.weaponSlot]

			return GUNSMITH.CanMakeModification(arg_505_1, var_505_1.weapon:get())
		end

		return false
	end,
	AreInGameLoadoutTabsEnabled = function(arg_506_0, arg_506_1)
		return not Game.BFEEGCHICA(arg_506_1, "ui_only_default_loadouts") and Dvar.IBEGCHEFE("NTMRRKSKPQ") and PROGRESSION.AreCustomLoadoutsUnlocked(arg_506_1)
	end,
	IsPCAchievementsMenuAvailable = function()
		return Engine.CGABICJHAI() and Dvar.IBEGCHEFE("SPOPPKOTP")
	end,
	IsMPIntelMenuEnabled = function()
		return Dvar.IBEGCHEFE("MTRLRMPONT")
	end,
	IsOperatorUpsellEnabled = function()
		return Dvar.IBEGCHEFE("OMPKROKQPL")
	end,
	ShouldCreateKeybindLinkButton = function(arg_510_0)
		return arg_510_0._needKeybindLinkButton
	end,
	ShouldCreateMoreInfoInnerButton = function(arg_511_0)
		return arg_511_0._needMoreInfoInnerButton
	end,
	IsBrButtonLayoutActive = function(arg_512_0)
		return Engine.CAGFEHGHGH(arg_512_0)
	end,
	AreCDLRulesActive = function(arg_513_0)
		return MLG.IsCDLActive(arg_513_0)
	end,
	IsCODTvEnabled = function()
		return Dvar.IBEGCHEFE("LOOTSOTKLS")
	end,
	AreRestrictionsActive = function(arg_515_0)
		return CONDITIONS.AreCDLRulesActive(arg_515_0)
	end,
	IsThirdGameModeAndSurvivalModeAllowed = function()
		return CONDITIONS.IsThirdGameMode() and CONDITIONS.IsSurvivalModeAllowed()
	end,
	IsHyperburstIconEnabled = function()
		return Dvar.IBEGCHEFE("LNMNLSOMQS")
	end,
	IsTurretOverheatEnabled = function()
		return Dvar.IBEGCHEFE("TPKMQLMPP")
	end,
	AllowBlueprintsWithRestriction = function()
		return Dvar.IBEGCHEFE("NNQSMOKTKM")
	end,
	IsCursedChestEventEnabled = function()
		return Dvar.CFHDGABACF("scr_enable_cursed_chest") == 1
	end,
	AreRestrictionsActiveAndBlueprintsAllowed = function(arg_521_0, arg_521_1)
		return CONDITIONS.AreRestrictionsActive(arg_521_1) and CONDITIONS.AllowBlueprintsWithRestriction()
	end,
	AreRestrictionsActiveAndBlueprintsBlocked = function(arg_522_0, arg_522_1)
		return CONDITIONS.AreRestrictionsActive(arg_522_1) and not CONDITIONS.AllowBlueprintsWithRestriction()
	end,
	EnableBlueprintsButton = function(arg_523_0, arg_523_1)
		return CONDITIONS.IsArmoryEnabled(arg_523_0, arg_523_1) and not CONDITIONS.AreRestrictionsActiveAndBlueprintsBlocked(arg_523_0, arg_523_1)
	end,
	EnableStoreBlueprintsButton = function(arg_524_0, arg_524_1)
		return CONDITIONS.IsBlueprintStoreEnabled() and not CONDITIONS.AreRestrictionsActiveAndBlueprintsBlocked(arg_524_0, arg_524_1)
	end,
	DynamicIconDebugEnabled = function()
		return Engine.BHICADFIHA() and Dvar.IBEGCHEFE("ui_debug_dynicons")
	end,
	IsEventPromoActive = function()
		local var_526_0 = Dvar.CFHDGABACF("RNNNLLQMN")

		return var_526_0 and var_526_0 ~= 0 or Dvar.IBEGCHEFE("lui_event_promo_banner_forced")
	end,
	IsSeasonalEventActive = function()
		return CONDITIONS.IsMagmaGameMode() and Dvar.IBEGCHEFE("MONKPPPQR")
	end,
	IsSeasonalEventTabActive = function()
		return CONDITIONS.IsSeasonalEventActive() and Dvar.IBEGCHEFE("MTLLROMMPO")
	end,
	IsStoreBundleUpsellActive = function()
		return CONDITIONS.IsSeasonalEventActive() and Dvar.IBEGCHEFE("MQTQMQRMPP")
	end,
	IsStoreSalesBannerEnabled = function()
		return Dvar.IBEGCHEFE("SMSKOQKSK")
	end,
	IsEventTabMoreInfoEnabled = function()
		return CONDITIONS.IsSeasonalEventActive() and Dvar.IBEGCHEFE("MNPLQOOQQR")
	end,
	IsCurMenuSeasonalEventMenu = function()
		return CONDITIONS.IsMenuInStack("SeasonalEventMenu")
	end,
	IsPostSeason = function()
		return SEASON.GetCurrentSeasonDataNum() >= SEASON.WZ_LEGACY_SEASON_NUM
	end,
	IsPostSeasonAndMagma = function()
		return CONDITIONS.IsPostSeason() and CONDITIONS.IsMagmaGameMode()
	end,
	IsRegularSeasonAndMagma = function()
		return CONDITIONS.IsPostSeason() ~= true and CONDITIONS.IsMagmaGameMode()
	end,
	IsSeasonRightBeforePostSeason = function()
		return SEASON.GetCurrentSeasonDataNum() == SEASON.WZ_LEGACY_SEASON_NUM - 1
	end,
	CheckDlcCP3 = function()
		return CONDITIONS.IsBattleNetModifyInstallEnabled() or Engine.HDGDBCJFG()
	end,
	HideFinishingMovePreview = function()
		return Dvar.IBEGCHEFE("LNTTQPOKMP")
	end,
	IsCrossLaunchDeepLinkEnabled = function()
		return Dvar.IBEGCHEFE("wz_blade_cross_launching_deep_link_enabled")
	end,
	IsT9PremiumPlayer = function(arg_540_0)
		return OnlineProgression.CFEEHFADBE(arg_540_0, PROGRESSION.Title.T9)
	end,
	IsS4PremiumPlayer = function(arg_541_0)
		return OnlineProgression.CFEEHFADBE(arg_541_0, PROGRESSION.Title.S4)
	end,
	IsCortezPremiumPlayer = function(arg_542_0)
		return OnlineProgression.CFEEHFADBE(arg_542_0, PROGRESSION.Title.CORTEZ)
	end,
	IsOwnerOfCurrentUpsellTitle = function(arg_543_0)
		return OnlineProgression.CFEEHFADBE(arg_543_0, PROGRESSION.GetCurrentUpsellTitleIDNum())
	end,
	SeasonalEventUseTugOfWarView = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventData().useTugOfWarView or false
	end,
	SeasonalEventUseHorizontalLootGrid = function()
		local var_545_0 = SEASONAL_EVENT.GetCurrentSeasonalEventLootGridType()

		return var_545_0 == SEASONAL_EVENT.LOOT_GRID_TYPE.SCROLLING_LIST or var_545_0 == SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS
	end,
	SeasonalEventHasParticipationChallenges = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventLootGridType() == SEASONAL_EVENT.LOOT_GRID_TYPE.PARTICIPATION_CHALLENGES
	end,
	IsCommunityChallengeEvent = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventData().hasCommunityChallenges
	end,
	SeasonalEventHasCommunityChallengePanel = function()
		return CONDITIONS.IsCommunityChallengeEvent() and not CONDITIONS.SeasonalEventUseTugOfWarView()
	end,
	SeasonalEventDisplaysCurrentSpan = function()
		local var_549_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData().displaySpanType

		return var_549_0 ~= nil and var_549_0 ~= SEASONAL_EVENT.SPAN_DISPLAY_TYPE.NONE
	end,
	IsVGPremiumPlayer = function(arg_550_0)
		if Engine.GEHBEDCEC() == true then
			return true
		end

		local var_550_0 = 33925432
		local var_550_1 = 33924432
		local var_550_2 = 33926432
		local var_550_3 = 33926434
		local var_550_4 = 33926433
		local var_550_5 = 33926435
		local var_550_6 = false

		if CONDITIONS.IsXboxLive() then
			var_550_6 = Loot.DEBEIFJEEG(arg_550_0, var_550_0) > 0 or Loot.DEBEIFJEEG(arg_550_0, var_550_3) > 0
		elseif CONDITIONS.IsSony() then
			var_550_6 = Loot.DEBEIFJEEG(arg_550_0, var_550_1) > 0 or Loot.DEBEIFJEEG(arg_550_0, var_550_4) > 0
		elseif CONDITIONS.IsBattleNet() then
			var_550_6 = Loot.DEBEIFJEEG(arg_550_0, var_550_2) > 0 or Loot.DEBEIFJEEG(arg_550_0, var_550_5) > 0
		end

		return var_550_6
	end,
	IsCZStandardOrCrossGenOwned = function(arg_551_0)
		local var_551_0 = 33926453
		local var_551_1 = 33926452
		local var_551_2 = 33926451
		local var_551_3

		if CONDITIONS.IsXbox() then
			var_551_3 = Loot.DEBEIFJEEG(arg_551_0, var_551_0) > 0
		elseif CONDITIONS.IsSony() then
			var_551_3 = Loot.DEBEIFJEEG(arg_551_0, var_551_1) > 0
		elseif CONDITIONS.IsPC() then
			var_551_3 = Loot.DEBEIFJEEG(arg_551_0, var_551_2) > 0
		end

		return var_551_3
	end,
	IsCZVaultOwned = function(arg_552_0)
		local var_552_0 = 371038
		local var_552_1 = 370038
		local var_552_2 = 33926454
		local var_552_3 = 341080
		local var_552_4 = 340080
		local var_552_5 = 342079
		local var_552_6

		if CONDITIONS.IsXbox() then
			var_552_6 = Loot.DEBEIFJEEG(arg_552_0, var_552_0) > 0 or Loot.DEBEIFJEEG(arg_552_0, var_552_3) > 0
		elseif CONDITIONS.IsSony() then
			var_552_6 = Loot.DEBEIFJEEG(arg_552_0, var_552_1) > 0 or Loot.DEBEIFJEEG(arg_552_0, var_552_4) > 0
		elseif CONDITIONS.IsPC() then
			var_552_6 = Loot.DEBEIFJEEG(arg_552_0, var_552_2) > 0 or Loot.DEBEIFJEEG(arg_552_0, var_552_5) > 0
		end

		return var_552_6
	end,
	SeasonalEventHasMapOrCommunityChallenge = function()
		return CONDITIONS.SeasonalEventHasMap() or CONDITIONS.IsCommunityChallengeEvent()
	end,
	SeasonalEventHasMap = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsMap()
	end,
	SeasonalEventIntroPopupIsAutoClosing = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsIntroPopupAutoClosing()
	end,
	SeasonalEventShowsStoreBundle = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventShowStoreBundle()
	end,
	SeasonalEventDisablesFTUE = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventFTUEDisabled()
	end,
	SeasonalEventIsWidgetIncludedInEvent = function(arg_558_0, arg_558_1)
		local var_558_0 = arg_558_0._typeName

		if var_558_0 == nil then
			var_558_0 = arg_558_0.id
		end

		return SEASONAL_EVENT.IsWidgetInCurrentEventIncludeList(var_558_0, arg_558_1)
	end,
	SeasonalEventIsWidgetNotExcludedFromEvent = function(arg_559_0, arg_559_1)
		local var_559_0 = arg_559_0._typeName

		if var_559_0 == nil then
			var_559_0 = arg_559_0.id
		end

		return not SEASONAL_EVENT.IsWidgetInCurrentEventExcludeList(var_559_0, arg_559_1)
	end,
	IsSeasonalEventUsingTabLogo = function()
		if Engine.CAADCDEEIA() then
			return false
		else
			return SEASONAL_EVENT.IsSeasonalEventUsingTabLogo()
		end
	end,
	IsSeasonalEventTacMapChecklistActive = function()
		if not Engine.DDJFBBJAIG() and (CONDITIONS.IsPublicMatch() or CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled()) and CONDITIONS.IsMagmaGameMode() and CONDITIONS.IsSeasonalEventActive() then
			local var_561_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

			if var_561_0 then
				if type(var_561_0.useTacMapChallengeTracker) == "function" then
					return var_561_0.useTacMapChallengeTracker()
				else
					return var_561_0.useTacMapChallengeTracker
				end
			end
		end

		return false
	end,
	ShowFactionPoints = function()
		return Dvar.IBEGCHEFE("scr_br_enable_hvv_points")
	end,
	SeasonalEventIsHVV = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsHVV()
	end,
	SeasonalEventIsMendota = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsMendota()
	end,
	SeasonalEventIsNumbers = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsNumbers()
	end,
	SeasonalEventIsLEP = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsLEP()
	end,
	SeasonalEventIsFestiveFervor = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsFestiveFervor()
	end,
	SeasonalEventIsSatellite = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsSatellite()
	end,
	SeasonalEventIsSummerOfAction = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsSummerOfAction()
	end,
	SeasonalEventIsAdler = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsAdler()
	end,
	SeasonalEventIsHaunt = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsHaunt()
	end,
	SeasonalEventIsZombies = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsZombies()
	end,
	SeasonalEventIsMilitaryAppreciation = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsMilitaryAppreciation()
	end,
	SeasonalEventIsAtlantis = function()
		return SEASONAL_EVENT.GetCurrentSeasonalEventIsAtlantis()
	end,
	IsBattleNetModifyInstallEnabled = function()
		return Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("LQQNTKTLQK")
	end,
	AreDailyChallengesDisabled = function()
		return Dvar.IBEGCHEFE("lui_killswitch_daily_challenges")
	end,
	ShouldCheckDLC = function()
		local var_577_0 = Dvar.IBEGCHEFE("LKSTRMKTML")

		if CONDITIONS.IsBattleNetLanOnly() then
			var_577_0 = false
		end

		return var_577_0
	end,
	UserHasATexturePack = function()
		local var_578_0 = {
			CoD.OPTIONAL_PACK_1_INDEX,
			CoD.OPTIONAL_PACK_2_INDEX,
			CoD.OPTIONAL_PACK_3_INDEX,
			CoD.OPTIONAL_PACK_4_INDEX,
			CoD.OPTIONAL_PACK_5_INDEX
		}

		for iter_578_0, iter_578_1 in ipairs(var_578_0) do
			if Engine.BAJHDFAJJF(iter_578_1) then
				return iter_578_0
			end
		end

		return 0
	end,
	ShouldUsePauseMenuChallenges = function()
		return CONDITIONS.IsPublicMatch() and not CONDITIONS.IsMagmaGameMode()
	end,
	IsT9ZombieFreeTrialEnabled = function()
		return Dvar.IBEGCHEFE("ui_t9_zombie_free_trial_enabled")
	end,
	PlayerHasZombieContainmentBombardmentKeycard = function(arg_581_0)
		local var_581_0 = false
		local var_581_1 = 7

		if CONDITIONS.IsMagmaGameMode() then
			var_581_0 = DataSources.inGame.player.BRData.PlayerStatusBunkerKeycardType:GetValue(arg_581_0) == var_581_1
		end

		return var_581_0
	end,
	ShouldAlwaysShowPrestigeKeyProgressionReward = function()
		local var_582_0 = Dvar.IBEGCHEFE("ui_t9_always_show_prestige_key_reward")

		if var_582_0 ~= nil then
			return var_582_0
		end

		return true
	end,
	IsCdlEnabled = function(arg_583_0)
		return LUI.WebViewManager.CdlEnabled() and CONDITIONS.IsUserSignedInDemonware(arg_583_0)
	end,
	IsWebMotdEnabled = function()
		return LUI.WebViewManager.MotdEnabled()
	end,
	IsBlueprintBlitzEnabled = function()
		local var_585_0 = Dvar.DHEEJCCJBH("scr_br_bblitz_event_period_utc")
		local var_585_1 = true

		if var_585_0 and type(var_585_0) == "string" then
			var_585_1 = Engine.CCEJJCCDEG(var_585_0) <= 0
		end

		return not var_585_1 and CONDITIONS.IsMagmaGameMode()
	end,
	IsVanguardRevealEventActive = function()
		return Dvar.IBEGCHEFE("OKSLQQOOOK")
	end,
	IsNewGameRevealEventActive = function()
		return Dvar.IBEGCHEFE("NKKORKKMMM")
	end,
	IsVanguardRevealEventLive = function()
		local var_588_0 = Dvar.DHEEJCCJBH("PTOSLOTSN")
		local var_588_1 = false

		if var_588_0 and type(var_588_0) == "string" then
			local var_588_2 = Engine.CCEJJCCDEG(var_588_0)

			if var_588_2 == nil then
				var_588_2 = 0
			end

			var_588_1 = var_588_2 <= 0
		end

		return var_588_1
	end,
	IsNewGameRevealEventLive = function()
		local var_589_0 = Dvar.DHEEJCCJBH("ui_br_event_newgame_reveal_period_utc")
		local var_589_1 = false

		if var_589_0 and type(var_589_0) == "string" then
			local var_589_2 = Engine.CCEJJCCDEG(var_589_0)

			if var_589_2 == nil then
				var_589_2 = 0
			end

			var_589_1 = var_589_2 <= 0
		end

		return var_589_1
	end,
	IsVanguardPreOrderBannerActive = function()
		return Dvar.IBEGCHEFE("ui_br_store_vanguard_preorder")
	end,
	IsVanguardBetaEnded = function()
		return Dvar.IBEGCHEFE("ui_vanguard_beta_ended")
	end,
	IsVanguardRevealed = function()
		return Dvar.CFHDGABACF("LOMTQPONKO") ~= 0
	end,
	IsBladeBannerActive = function()
		return Dvar.IBEGCHEFE("LTMKROSSLR") and Dvar.CFHDGABACF(MAIN_MENU.NGBladeStateDvar) > MAIN_MENU.NGBladeStates.Inactive
	end,
	IsCortezShowingPreOrderBannerOnItsBlade = function()
		return MAIN_MENU.IsPreOrderAvailable() and Dvar.IBEGCHEFE("LNPKKSQLPM")
	end,
	IsCortezRevealEventUsingDate = function()
		return Dvar.IBEGCHEFE("ui_br_event_cortez_reveal_using_date")
	end,
	IsCortezRevealEventLive = function()
		local var_596_0 = Dvar.DHEEJCCJBH("MMOPQOLLMQ")
		local var_596_1 = false

		if var_596_0 and #var_596_0 > 0 then
			local var_596_2 = Engine.CCEJJCCDEG(var_596_0)

			if var_596_2 == nil then
				var_596_2 = 0
			end

			var_596_1 = var_596_2 <= 0
		end

		return var_596_1
	end,
	IsCortezPreOrderBannerActive = function()
		return Dvar.IBEGCHEFE("MQKQMMRKLO")
	end,
	IsNewGameAvailableNowMessageActive = function()
		return false
	end,
	IsCortezBetaEnded = function()
		return Dvar.IBEGCHEFE("ui_cortez_beta_ended")
	end,
	IsCortezRevealed = function()
		return Dvar.CFHDGABACF("lui_cortez_reveal_state") ~= 0
	end,
	GetX2UpsellVariant = function()
		return Dvar.CFHDGABACF("ui_x2_preorder_upsell_variant")
	end,
	AreWZPlaylistRestrictionsEnabled = function()
		local var_602_0 = Dvar.CFHDGABACF("NMOQRNSLTM") ~= PlaylistUtils.RestrictionTypes.OFF
		local var_602_1 = PlaylistUtils.GetRestrictedPlaylistIds()

		return CONDITIONS.IsMagmaGameMode() and var_602_0 and var_602_1
	end,
	ShouldShowVanguardBPSplitTiersEvent = function(arg_603_0, arg_603_1)
		local var_603_0 = Dvar.IBEGCHEFE("lui_force_vg_bp_split_tier")
		local var_603_1 = Dvar.IBEGCHEFE("NKPPMRTRRK")
		local var_603_2 = Onboarding.VanguardBattlePassSplitTiers.WasCompleted(arg_603_0, arg_603_1)

		return var_603_0 or var_603_1 and not var_603_2
	end,
	IsBattlePassTopperActive = function()
		local var_604_0 = Dvar.CFHDGABACF("LKOKTLQSPT")

		if var_604_0 then
			local var_604_1 = Engine.DEIDGHDBHD()
			local var_604_2 = var_604_1 < var_604_0 and var_604_0 - var_604_1 or 0

			if var_604_2 and var_604_2 > 0 then
				return true
			end
		end

		return false
	end,
	LockS4Blueprints = function()
		return not Dvar.IBEGCHEFE("ui_s4_blueprint_unlock")
	end,
	IsCrosslaunchFollowHostAllowed = function()
		return Dvar.IBEGCHEFE("NMQMPNQKRN")
	end,
	IsVanguardDeeplinkEnabled = function()
		return Dvar.IBEGCHEFE("MROTTSMSRM")
	end,
	IsWZPlaylistEventButtonActive = function()
		return Dvar.IBEGCHEFE("NSNLRONNTR") and Dvar.CFHDGABACF("MRKOMSNLRK")
	end,
	IsMPPlaylistEventButtonActive = function()
		return Dvar.IBEGCHEFE("MPNKRKSONP") and Dvar.CFHDGABACF("LLKTPRPTMO")
	end,
	IsVaguardTrialEnabled = function()
		local var_610_0 = Dvar.CFHDGABACF("NRMNMOOLSM")
		local var_610_1 = false

		if var_610_0 then
			var_610_1 = Engine.CCEJJCCDEG(tostring(var_610_0)) <= 0
		end

		return not var_610_1 and CONDITIONS.IsWZPlaylistEventButtonActive() and CONDITIONS.IsMPPlaylistEventButtonActive()
	end,
	IsVanguardOwnershipDisplayEnabled = function()
		return Dvar.IBEGCHEFE("ui_vanguard_ownership_display_enabled")
	end,
	IsVanguardArenaDisabled = function()
		return Dvar.IBEGCHEFE("LSSSOLQLNL")
	end,
	IsSkyhookEnabled = function()
		return Dvar.IBEGCHEFE("scr_skyhooks_enabled")
	end,
	IsBrokenATMDisabled = function()
		return Dvar.IBEGCHEFE("scr_broken_atm_disabled")
	end,
	IsShowingAccountPicker = function()
		return Engine.JIFHCDAFB()
	end,
	IsShowingUnachievedAccolades = function()
		return Dvar.IBEGCHEFE("show_unachieved_accolades")
	end,
	IsStreamerModeEnabled = function()
		return Dvar.IBEGCHEFE("SKLKPMSRT")
	end,
	IsStreamerModePlusEnabled = function()
		return Dvar.IBEGCHEFE("MLOKOLORMO")
	end,
	IsUIReadyForOnlinePlayer = function(arg_619_0)
		return CONDITIONS.IsUserSignedInDemonware(arg_619_0) and Engine.JBAACDFEJ()
	end,
	ShouldShow2XP = function()
		return Dvar.IBEGCHEFE("NQLNSLPOMS") and (IsPublicMatch() or IsPrivateMatch()) and CONDITIONS.IsPostSeasonAndMagma() ~= true
	end,
	IsPrematch = function(arg_621_0)
		return Game.BFEEGCHICA(arg_621_0, "ui_prematch_period") > 0
	end,
	IsFlashpointFeatureEnabled = function()
		return Dvar.IBEGCHEFE("LKTMLPRTO")
	end,
	IsFlashpointCompatibleGameMode = function()
		return CONDITIONS.IsFlashpointFeatureEnabled() and Dvar.DHEEJCCJBH("LMSRRONSLK") ~= ""
	end,
	IsMotocycleEnabled = function()
		return Dvar.IBEGCHEFE("scr_allow_vehicle_motorcycle")
	end,
	IsVehicleSpeedBoostEnabled = function()
		return Dvar.IBEGCHEFE("LKSKLOQPTT")
	end,
	ShouldBuystationCloseMenuOnPurchase = function(arg_626_0)
		return Engine.BECCFCBIAA("buystationCloseMenuOnPurchase", arg_626_0)
	end,
	IsStoreRefreshTimerEnabled = function()
		local var_627_0 = Dvar.BJJCJHDBII("ui_store_daily_reset_time")

		return var_627_0 ~= nil and var_627_0 ~= -1
	end,
	AreHvvKioskItemsEnabled = function()
		return Dvar.CFHDGABACF("scr_br_enable_hvv_kiosk_items") == 1
	end,
	AreHvvDiscountsEnabled = function()
		return Dvar.CFHDGABACF("scr_br_enable_hvv_discounts") == 1
	end,
	ShouldFocusFirstItemInLoadoutDrop = function(arg_630_0)
		return Engine.BECCFCBIAA("defaultToFirstLoadoutItemInDrop", arg_630_0)
	end,
	ShouldShowBundleButton = function()
		if CONDITIONS.IsMagmaGameMode() then
			return Dvar.IBEGCHEFE("lui_disableBundleUpsellWidgetMagma") ~= true
		else
			return Dvar.IBEGCHEFE("NLTNQNSMQK")
		end
	end,
	ShouldShowSeasonalProgression = function()
		return not Engine.CHDGBEFDHB() and not Engine.CHBHFFFIGH() and not Engine.EAABDHIDFJ()
	end
}
