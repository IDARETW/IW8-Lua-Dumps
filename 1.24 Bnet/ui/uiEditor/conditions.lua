CONDITIONS = {
	AlwaysFalse = function(arg_1_0)
		return false
	end,
	AlwaysTrue = function(arg_2_0)
		return true
	end,
	InFrontend = function(arg_3_0)
		return Engine.DDJFBBJAIG()
	end,
	InFrontendPublic = function(arg_4_0)
		return Engine.DDJFBBJAIG() and not IsPrivateMatch() and not IsSystemLink()
	end,
	InFrontendPublicMP = function(arg_5_0)
		return Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() and not IsPrivateMatch() and not IsSystemLink() and not Engine.EAIICIFIFA()
	end,
	InFrontendMPOrCP = function(arg_6_0)
		return Engine.DDJFBBJAIG() and not Engine.CAADCDEEIA()
	end,
	InGame = function(arg_7_0)
		return not Engine.DDJFBBJAIG()
	end,
	InGameMP = function(arg_8_0)
		return not Engine.DDJFBBJAIG() and Engine.EAAHGICFBD()
	end,
	InGameSPOrFrontendMP = function(arg_9_0)
		return not Engine.DDJFBBJAIG() and Engine.CAADCDEEIA() or Engine.DDJFBBJAIG() and Engine.EAAHGICFBD()
	end,
	IsMenuInStack = function(arg_10_0)
		return LUI.FlowManager.IsInStack(arg_10_0)
	end,
	InGameOrCP = function(arg_11_0)
		return not Engine.DDJFBBJAIG() or Engine.EAIICIFIFA()
	end,
	IsGamepadEnabled = function(arg_12_0)
		return Engine.BBDCAFEGDJ() == 1
	end,
	IsDevelopmentBuild = function(arg_13_0)
		return Engine.BHICADFIHA()
	end,
	IsDevelopmentBuildOnConsole = function(arg_14_0)
		return Engine.BHICADFIHA() and Engine.HDGDBCJFG()
	end,
	IsDevelopmentBuildLocalPlayAllowed = function(arg_15_0)
		return Engine.BHICADFIHA() and Engine.BHCBGBFEJI()
	end,
	IsCapturingFootage = function(arg_16_0)
		return Dvar.IBEGCHEFE("lui_footage_capture_enabled") == true
	end,
	IsMatchSimToolEnabled = function(arg_17_0)
		return Dvar.CFHDGABACF("MKOTKLQOLM") == 1
	end,
	AreDevFeaturesEnabled = function(arg_18_0)
		return Dvar.IBEGCHEFE("LSSRRSMNMR")
	end,
	IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled = function(arg_19_0)
		return Engine.BGAAHHAGAC() or Engine.BHICADFIHA() or Dvar.IBEGCHEFE("LSSRRSMNMR")
	end,
	IsInFocus = function(arg_20_0)
		return arg_20_0:isInFocus()
	end,
	IsDisabled = function(arg_21_0)
		return arg_21_0:IsDisabled()
	end,
	IsCoreMultiplayer = function(arg_22_0)
		return Engine.ECHCFGDDDF()
	end,
	IsCoreMultiplayerNotBr = function(arg_23_0)
		local var_23_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"

		return Engine.ECHCFGDDDF() and not var_23_0
	end,
	IsMultiplayer = function(arg_24_0)
		return Engine.EAAHGICFBD()
	end,
	IsSingleplayer = function(arg_25_0)
		return not Engine.EAAHGICFBD()
	end,
	IsSingleplayerOrCoreMultiplayer = function(arg_26_0)
		return Engine.CAADCDEEIA() or Engine.ECHCFGDDDF()
	end,
	IsThirdGameMode = function(arg_27_0)
		return Engine.EAIICIFIFA()
	end,
	IsTDMGameType = function(arg_28_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "war"
	end,
	IsStrategicInfilGameType = function(arg_29_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsLimitedHealthGameType = function(arg_30_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	ShouldAllowChoosingClassBR = function(arg_31_0)
		local var_31_0 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_31_1 = Dvar.CFHDGABACF("scr_br_allowLoadout") == 1

		return var_31_0 == "dmz" or var_31_0 == "risk" or var_31_1
	end,
	IsBRLoadoutGameType = function(arg_32_0)
		local var_32_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
		local var_32_1 = Dvar.DHEEJCCJBH("scr_br_gametype")

		return var_32_0 == "br" and not CONDITIONS.ShouldAllowChoosingClassBR()
	end,
	IsBRGameType = function(arg_33_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsBloodMoney = function(arg_34_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dmz"
	end,
	IsBRTDMGameType = function(arg_35_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "brtdm"
	end,
	IsRiskGametype = function(arg_36_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "risk"
	end,
	IsBloodMoneyOrIsRiskGametype = function(arg_37_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "dmz" or Dvar.DHEEJCCJBH("scr_br_gametype") == "risk"
	end,
	IsNotBloodMoneyAndIsNotRiskGametype = function(arg_38_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") ~= "dmz" and Dvar.DHEEJCCJBH("scr_br_gametype") ~= "risk"
	end,
	IsBRJugg = function(arg_39_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "jugg"
	end,
	IsBRMini = function(arg_40_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "mini"
	end,
	IsBRKingSlayer = function(arg_41_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "kingslayer"
	end,
	IsBRTruckWar = function(arg_42_0)
		return Dvar.DHEEJCCJBH("scr_br_gametype") == "truckwar"
	end,
	IsBRInflation = function(arg_43_0)
		local var_43_0 = Dvar.DHEEJCCJBH("scr_br_alt_mode_inflation")

		if CONDITIONS.IsMagmaGameMode() and var_43_0 then
			local var_43_1 = tonumber(var_43_0)

			return var_43_1 and var_43_1 == 1
		end

		return false
	end,
	IsBRX1Variant = function(arg_44_0)
		local var_44_0 = Dvar.DHEEJCCJBH("MTQQTNNTMM") or ""

		return CONDITIONS.IsMagmaGameMode() and var_44_0 == "x1"
	end,
	IsSDGameType = function(arg_45_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "sd"
	end,
	InGameAndBR = function(arg_46_0)
		local var_46_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return not Engine.DDJFBBJAIG() and var_46_0 == "br"
	end,
	InGameAndBRTDM = function(arg_47_0)
		local var_47_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return not Engine.DDJFBBJAIG() and var_47_0 == "brtdm"
	end,
	IsNotBrAndNotTrial = function(arg_48_0)
		local var_48_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_48_0 ~= "br" and var_48_0 ~= "trial"
	end,
	InGameAndNotBR = function(arg_49_0)
		local var_49_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return not Engine.DDJFBBJAIG() and var_49_0 ~= "br"
	end,
	InGameAndBRLoadoutSelect = function(arg_50_0)
		local var_50_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
		local var_50_1 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_50_2 = var_50_0 == "br" and not CONDITIONS.ShouldAllowChoosingClassBR()

		return not Engine.DDJFBBJAIG() and var_50_2
	end,
	InGameAndMPLoadoutSelect = function(arg_51_0)
		local var_51_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
		local var_51_1 = Dvar.DHEEJCCJBH("scr_br_gametype")
		local var_51_2 = var_51_0 == "br" and not CONDITIONS.ShouldAllowChoosingClassBR()

		return not Engine.DDJFBBJAIG() and not var_51_2
	end,
	IsCyberGameType = function(arg_52_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cyber"
	end,
	IsParachuteGameType = function(arg_53_0)
		local var_53_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_53_0 == "br" or var_53_0 == "arm" or var_53_0 == "war" or var_53_0 == "cp_survival" or var_53_0 == "trial"
	end,
	IsArenaOrBRGameType = function(arg_54_0)
		local var_54_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_54_0 == "br" or var_54_0 == "arena"
	end,
	IsUsingOvertimeGameplayTimer = function(arg_55_0)
		local var_55_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_55_0 == "br" or var_55_0 == "arena" or var_55_0 == "rush"
	end,
	IsUsingPublicEvents = function()
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsUsingTeamHealthbars = function(arg_57_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsArmsRaceGameType = function(arg_58_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arm"
	end,
	IsGWSquadGameType = function(arg_59_0)
		local var_59_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_59_0 == "arm" or var_59_0 == "brtdm" or var_59_0 == "arena"
	end,
	IsDefconGameType = function(arg_60_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "defcon"
	end,
	IsCMDGameType = function(arg_61_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cmd"
	end,
	IsGrindGameType = function(arg_62_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "grind"
	end,
	IsDogTagGameType = function(arg_63_0)
		local var_63_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_63_0 == "conf" or var_63_0 == "grind"
	end,
	IsPillageGameType = function(arg_64_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "pill"
	end,
	IsArenaGameType = function(arg_65_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arena"
	end,
	IsOICGameType = function(arg_66_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "oic"
	end,
	IsTDEFGameType = function(arg_67_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "tdef"
	end,
	IsReinforceGameType = function(arg_68_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "siege"
	end,
	IsFlagOrTdefGameType = function(arg_69_0)
		local var_69_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_69_0 == "ctf" or var_69_0 == "blitz" or var_69_0 == "tdef"
	end,
	IsFlagGameType = function(arg_70_0)
		local var_70_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_70_0 == "ctf" or var_70_0 == "blitz"
	end,
	IsCoopStrikeGameType = function(arg_71_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_strike"
	end,
	IsCoopTrialsGameType = function(arg_72_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_trials"
	end,
	IsWaveGameType = function(arg_73_0)
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_wave_sv" and not Engine.DDJFBBJAIG() then
			return true
		else
			return false
		end
	end,
	InFrontendOrWaveMode = function(arg_74_0)
		local var_74_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if Engine.DDJFBBJAIG() or var_74_0 == "cp_wave_sv" then
			return true
		else
			return false
		end
	end,
	IsOperationGameType = function(arg_75_0)
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_survival" and not Engine.DDJFBBJAIG() then
			return true
		else
			return false
		end
	end,
	IsSpecOpsGameType = function(arg_76_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_specops"
	end,
	IsCoopPvpeType = function(arg_77_0)
		return Dvar.CFHDGABACF("enable_pvpe") == 1
	end,
	IsDominationGameType = function(arg_78_0)
		local var_78_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_78_0 == "dom" or var_78_0 == "siege"
	end,
	IsDominationOrArmsRaceGameType = function(arg_79_0)
		local var_79_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_79_0 == "dom" or var_79_0 == "arm" or var_79_0 == "siege"
	end,
	IsRugbyGameType = function(arg_80_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "rugby"
	end,
	IsBTMGameType = function(arg_81_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "btm"
	end,
	IsTrialGameType = function(arg_82_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "trial"
	end,
	IsTrialGameTypeORLaunchChunk = function(arg_83_0)
		local var_83_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return Dvar.IBEGCHEFE("MPNRKLKOKR") and CONDITIONS.IsConsoleGame() or var_83_0 == "trial"
	end,
	IsTrialGameTypeORSplitscreen = function(arg_84_0)
		local var_84_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return CONDITIONS.IsSplitscreen() or var_84_0 == "trial"
	end,
	IsInTrialEvent = function(arg_85_0)
		return Dvar.IBEGCHEFE("LOQKLRKQMO") and CONDITIONS.IsTrialEventAvailable()
	end,
	IsBRHudWZGameMode = function()
		return not CONDITIONS.IsRealismMode() and (CONDITIONS.IsMagmaGameMode() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsBRJugg())
	end,
	IsTeamBasedGameType = function(arg_87_0)
		local var_87_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_87_0, CSV.gameTypesTable.cols.teamBased) == "1"
	end,
	IsMultiplayerDesired = function(arg_88_0)
		return Engine.BAGCCCCIEF() == CoD.PlayMode.Core
	end,
	IsSingleplayerDesired = function(arg_89_0)
		return Engine.BAGCCCCIEF() == CoD.PlayMode.SP
	end,
	IsThirdGameModeDesired = function(arg_90_0)
		return Engine.BAGCCCCIEF() == CoD.PlayMode.Aliens
	end,
	IsMatchMakingGame = function(arg_91_0)
		return Dvar.IBEGCHEFE("isMatchMakingGame")
	end,
	IsPublicMatch = function(arg_92_0)
		return IsPublicMatch()
	end,
	IsCorePublicMatch = function(arg_93_0)
		return Engine.ECHCFGDDDF() and IsPublicMatch()
	end,
	IsWeaponLevelShown = function(arg_94_0)
		return IsPublicMatch() and Engine.DDJFBBJAIG()
	end,
	IsCoreFrontendPC = function(arg_95_0)
		return Engine.CGABICJHAI() and Engine.ECHCFGDDDF() and Engine.DDJFBBJAIG()
	end,
	IsLocalServerPaused = function(arg_96_0)
		return Engine.EACHICHBCD()
	end,
	IsCWLDraftLobby = function(arg_97_0)
		return (IsPrivateMatch() or IsSystemLink()) and Engine.ECHCFGDDDF() and MLG.AreMLGRulesEnabled() and not Dvar.IBEGCHEFE("MLNSOPOTNQ")
	end,
	IsMLGRulesEnabled = function(arg_98_0)
		return (IsPrivateMatch() or IsSystemLink()) and Engine.ECHCFGDDDF() and MLG.AreMLGRulesEnabled()
	end,
	IsBombGametype = function(arg_99_0)
		local var_99_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_99_0 == "sd" or var_99_0 == "sr" or var_99_0 == "dd" or var_99_0 == "cmd" or var_99_0 == "cyber"
	end,
	isLifeLimitedBombGametype = function(arg_100_0)
		local var_100_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_100_0 == "sd" or var_100_0 == "sr" or var_100_0 == "cyber" or var_100_0 == "siege"
	end,
	IsCaptureGameType = function(arg_101_0)
		local var_101_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_101_0 == "dom" or var_101_0 == "grind" or var_101_0 == "koth" or var_101_0 == "grnd" or var_101_0 == "siege" or var_101_0 == "cmd" or var_101_0 == "br" or var_101_0 == "cyber" or var_101_0 == "hq" or var_101_0 == "pill"
	end,
	IsCrankedGameType = function(arg_102_0)
		return Dvar.DHEEJCCJBH("scr_" .. Dvar.DHEEJCCJBH("MOLPOSLOMO") .. "_crankedBombTimer") ~= "0"
	end,
	IsInfectedGameType = function(arg_103_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "infect"
	end,
	IsUplinkGameType = function(arg_104_0)
		local var_104_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_104_0 == "ball" or var_104_0 == "tdef"
	end,
	IsDropZoneGameType = function(arg_105_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "grnd"
	end,
	DoesGameTypeSupportBallIcon = function(arg_106_0)
		local var_106_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_106_0 == "ball" or var_106_0 == "tdef" or var_106_0 == "cyber"
	end,
	DoesGameTypeSupportEMPIcon = function(arg_107_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cyber"
	end,
	DoesGameTypeSupportBombIcon = function(arg_108_0)
		local var_108_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_108_0 == "sd" or var_108_0 == "sr" or var_108_0 == "cmd"
	end,
	IsFrontlineGameType = function(arg_109_0)
		local var_109_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_109_0 == "front" or var_109_0 == "ball" or var_109_0 == "tdef"
	end,
	DoesGameTypeSupportCommandBar = function(arg_110_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "front"
	end,
	DoesGameTypeSupportObjectiveProgress = function(arg_111_0)
		local var_111_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_111_0 == "sd" or var_111_0 == "sr" or var_111_0 == "dd" or var_111_0 == "cmd" or var_111_0 == "cyber" or var_111_0 == "dom" or var_111_0 == "grind" or var_111_0 == "koth" or var_111_0 == "grnd" or var_111_0 == "siege" or var_111_0 == "br" or var_111_0 == "hq" or var_111_0 == "pill"
	end,
	IsHardpointGameType = function(arg_112_0)
		if Engine.ECHCFGDDDF() then
			local var_112_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return var_112_0 == "koth" or var_112_0 == "grnd" or var_112_0 == "rush" or var_112_0 == "hq"
		else
			return false
		end
	end,
	IsDemolitionGameType = function(arg_113_0)
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "dd"
		else
			return false
		end
	end,
	IsHPHQDZGameType = function(arg_114_0)
		if Engine.ECHCFGDDDF() then
			local var_114_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return var_114_0 == "koth" or var_114_0 == "hq" or var_114_0 == "grnd"
		else
			return false
		end
	end,
	IsHQGameType = function(arg_115_0)
		if Engine.ECHCFGDDDF() then
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "hq"
		else
			return false
		end
	end,
	IsHQOrArenaGameType = function(arg_116_0)
		if Engine.ECHCFGDDDF() then
			local var_116_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return var_116_0 == "hq" or var_116_0 == "arena"
		else
			return false
		end
	end,
	IsTeamLiveGameType = function(arg_117_0)
		local var_117_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_117_0 == "sd" or var_117_0 == "sr" or var_117_0 == "siege" or var_117_0 == "arena" or var_117_0 == "br" or var_117_0 == "cyber"
	end,
	IsLimitedLifeGameType = function(arg_118_0)
		if Engine.ECHCFGDDDF() then
			local var_118_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			return Dvar.DHEEJCCJBH("scr_" .. var_118_0 .. "_numlives") ~= "0"
		else
			return false
		end
	end,
	IsBRDropBagEnabled = function(arg_119_0)
		local var_119_0 = Dvar.DHEEJCCJBH("scr_br_dropbagspawn")

		return not var_119_0 or var_119_0 == "" or var_119_0 == "1"
	end,
	IsBRArmoryKioskEnabled = function(arg_120_0)
		local var_120_0 = Dvar.DHEEJCCJBH("scr_br_armory_kiosk")

		return not var_120_0 or var_120_0 == "" or var_120_0 == "1"
	end,
	IsBRSquadmateBuyBackEnabled = function()
		return CONDITIONS.IsBRPlunderEnabled()
	end,
	IsBRPlunderEnabled = function(arg_122_0)
		local var_122_0 = Dvar.DHEEJCCJBH("scr_br_plunder")

		return not var_122_0 or var_122_0 == "" or var_122_0 == "1"
	end,
	AreBRPlunderSitesEnabled = function(arg_123_0)
		local var_123_0 = Dvar.DHEEJCCJBH("scr_br_plunder_sites")

		return not (not var_123_0 or var_123_0 == "") and var_123_0 == "1"
	end,
	IsBrQuickInventoryEnabled = function(arg_124_0)
		return not Dvar.IBEGCHEFE("ui_disable_quick_inventory")
	end,
	IsBRTutorialRestartEnabled = function(arg_125_0)
		return Dvar.IBEGCHEFE("NRTOORMRKR")
	end,
	IsInGameAAREnabled = function(arg_126_0)
		return Dvar.IBEGCHEFE("TPTKKSNQ")
	end,
	IsPlayAgainAllowed = function(arg_127_0)
		return Engine.BFFJDBBHIF()
	end,
	IsPlayAgainEnabled = function(arg_128_0)
		return Dvar.IBEGCHEFE("LPRKRTSPQT") and CONDITIONS.IsBRGameType() and not IsSystemLink()
	end,
	IsInGameAARScoreboardEnabled = function(arg_129_0)
		return Dvar.IBEGCHEFE("MTNKKKTTRR")
	end,
	IsInGameNewAARScoreboardEnabled = function(arg_130_0)
		return Dvar.IBEGCHEFE("NTKSMOLO")
	end,
	IsPlayAgainEnabledForPartyHost = function(arg_131_0)
		return CONDITIONS.IsPlayAgainEnabled() and Lobby.BGIADHIHAG()
	end,
	IsInGameAARProgressbarEnabled = function(arg_132_0)
		return Dvar.IBEGCHEFE("NPSQPOMPLP")
	end,
	ShouldUseAlternateCreditSpacing = function()
		return CONDITIONS.IsBRSoloMode()
	end,
	ShouldAllowInventoryRequest = function()
		return not CONDITIONS.IsBRSoloMode() or CONDITIONS.IsBRTutorial()
	end,
	IsBRSoloMode = function()
		return (Dvar.CFHDGABACF("scr_br_teamsize") or 0) == 1
	end,
	ShouldDisableSquadUI = function(arg_136_0)
		return CONDITIONS.IsBloodMoney() or CONDITIONS.IsBRSoloMode() or CONDITIONS.IsRiskGametype()
	end,
	ShowEscapeCapZone = function(arg_137_0)
		return Dvar.DHEEJCCJBH("scr_esc_capzone") == "1"
	end,
	IsKillstreaksAllowed = function(arg_138_0)
		local var_138_0 = {
			enabled = 1,
			disabled = 0
		}
		local var_138_1 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if CONDITIONS.IsArenaGameType(arg_138_0) then
			return false
		end

		if CONDITIONS.IsDropZoneGameType(arg_138_0) or var_138_1 == "infect" then
			return true
		end

		if Engine.ECHCFGDDDF() then
			local var_138_2 = Engine.IJEBHJIJF()

			if Game.BFEEGCHICA(var_138_2, "ui_disable_killstreaks") then
				return false
			end
		end

		local var_138_3 = Dvar.CFHDGABACF("scr_game_allowKillstreaks")
		local var_138_4 = Dvar.CFHDGABACF("scr_" .. var_138_1 .. "_allowKillstreaks")

		if var_138_4 ~= nil and var_138_4 ~= var_138_3 then
			var_138_3 = var_138_4
		end

		return var_138_3 ~= nil and var_138_3 ~= var_138_0.disabled
	end,
	IsUsingMatchStatus = function(arg_139_0)
		local var_139_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_139_0 ~= "cmd" and var_139_0 ~= "br" and var_139_0 ~= "defcon" and var_139_0 ~= "dm" and var_139_0 ~= "trial" and var_139_0 ~= "gun" and var_139_0 ~= "oic"
	end,
	IsUsingMatchRounds = function(arg_140_0)
		if CONDITIONS.IsLaunchChunk(arg_140_0) then
			return false
		end

		local var_140_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_140_0 == "cyber" or var_140_0 == "sd" or var_140_0 == "siege" or var_140_0 == "arena" or var_140_0 == "dd"
	end,
	IsUsingMatchProgress = function(arg_141_0)
		if CONDITIONS.IsLaunchChunk(arg_141_0) then
			return true
		end

		local var_141_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_141_0 == "war" or var_141_0 == "dom" or var_141_0 == "hq" or var_141_0 == "koth" or var_141_0 == "grnd" or var_141_0 == "conf" or var_141_0 == "grind" or var_141_0 == "arm" or var_141_0 == "tdef" or var_141_0 == "brtdm"
	end,
	IsUsingMatchStatusNonTDM = function(arg_142_0)
		local var_142_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_142_0 ~= "cmd" and var_142_0 ~= "br" and var_142_0 ~= "arm" and var_142_0 ~= "defcon" and var_142_0 ~= "war"
	end,
	IsUsingDefconMatchStatus = function(arg_143_0)
		local var_143_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_143_0 == "arm" or var_143_0 == "defcon"
	end,
	IsUsingBrStyleMatchStatus = function(arg_144_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
	end,
	IsUsingFFAMatchStatus = function(arg_145_0)
		local var_145_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return var_145_0 == "dm" or var_145_0 == "gun" or var_145_0 == "oic"
	end,
	IsUsingCompass = function(arg_146_0)
		if Dvar.CFHDGABACF("scr_game_navBarHide") == 1 then
			return false
		end

		return Dvar.DHEEJCCJBH("MOLPOSLOMO") ~= "arena"
	end,
	IsUsingFieldUpgrade = function(arg_147_0)
		local var_147_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		if var_147_0 == "br" or var_147_0 == "brm" or var_147_0 == "arena" or var_147_0 == "trial" or var_147_0 == "cp_wave_sv" or var_147_0 == "cp_specops" then
			return false
		end

		if Engine.ECHCFGDDDF() then
			local var_147_1 = Engine.IJEBHJIJF()

			if Game.BFEEGCHICA(var_147_1, "ui_disable_fieldupgrades") then
				return false
			end
		end

		local var_147_2 = Dvar.CFHDGABACF("scr_game_allowSupers")
		local var_147_3 = GameX.GetGameMode()
		local var_147_4 = Dvar.CFHDGABACF("scr_" .. var_147_3 .. "_allowSupers")

		if var_147_4 ~= nil and var_147_4 ~= var_147_2 then
			var_147_2 = var_147_4
		end

		return var_147_2 ~= nil and var_147_2 ~= 0
	end,
	IsTournamentFullSize = function(arg_148_0)
		return Tournament.DEAFAIEJGI() == 4
	end,
	IsNukeEndState = function(arg_149_0, arg_149_1)
		local var_149_0

		if Engine.ECHCFGDDDF() then
			var_149_0 = Game.BFEEGCHICA(arg_149_1, "ui_nuke_end_milliseconds")
		end

		return var_149_0 and var_149_0 > 0
	end,
	ButtonPrimary = function(arg_150_0, arg_150_1)
		return arg_150_1.button == "primary"
	end,
	ButtonSecondary = function(arg_151_0, arg_151_1)
		return arg_151_1.button == "secondary"
	end,
	ButtonAltOne = function(arg_152_0, arg_152_1)
		return arg_152_1.button == "alt1"
	end,
	ButtonAltTwo = function(arg_153_0, arg_153_1)
		return arg_153_1.button == "alt2"
	end,
	ButtonRightTrigger = function(arg_154_0, arg_154_1)
		return arg_154_1.button == "right_trigger"
	end,
	ButtonLeftTrigger = function(arg_155_0, arg_155_1)
		return arg_155_1.button == "left_trigger"
	end,
	ButtonRightShoulder = function(arg_156_0, arg_156_1)
		return arg_156_1.button == "shoulderr"
	end,
	ButtonLeftShoulder = function(arg_157_0, arg_157_1)
		return arg_157_1.button == "shoulderl"
	end,
	ButtonRightStick = function(arg_158_0, arg_158_1)
		return arg_158_1.button == "right_stick"
	end,
	ButtonLeftStick = function(arg_159_0, arg_159_1)
		return arg_159_1.button == "left_stick"
	end,
	ButtonLeft = function(arg_160_0, arg_160_1)
		return arg_160_1.button == "left"
	end,
	ButtonRight = function(arg_161_0, arg_161_1)
		return arg_161_1.button == "right"
	end,
	ButtonUp = function(arg_162_0, arg_162_1)
		return arg_162_1.button == "up"
	end,
	ButtonDown = function(arg_163_0, arg_163_1)
		return arg_163_1.button == "down"
	end,
	ButtonStart = function(arg_164_0, arg_164_1)
		return arg_164_1.button == "start"
	end,
	ButtonSelect = function(arg_165_0, arg_165_1)
		return arg_165_1.button == "select"
	end,
	ButtonOptions = function(arg_166_0, arg_166_1)
		return arg_166_1.button == "options"
	end,
	ButtonGoStand = function(arg_167_0)
		return arg_167_0.button == "gostand"
	end,
	ButtonEscape = function(arg_168_0)
		return arg_168_0.button == "escape"
	end,
	InKillCam = function(arg_169_0)
		return Engine.EAAHGICFBD() and Game.BJIIBIABBF()
	end,
	IsCinematicCameraActive = function(arg_170_0)
		return Engine.EAAHGICFBD() and Game.ECFDEFHGBD()
	end,
	IsGameMode = function(arg_171_0)
		return GameX.GetGameMode() == arg_171_0
	end,
	IsHardcoreMode = function(arg_172_0)
		return GameX.IsHardcoreMode()
	end,
	isHardcoreModeWithKillstreaksAllowed = function(arg_173_0)
		return CONDITIONS.IsHardcoreMode() and CONDITIONS.IsKillstreaksAllowed()
	end,
	IsNotHardcoreMode = function(arg_174_0)
		return not GameX.IsHardcoreMode()
	end,
	IsRealismMode = function(arg_175_0, arg_175_1)
		return GameX.IsRealismMode()
	end,
	IsRealismBR = function(arg_176_0)
		return CONDITIONS.IsMagmaGameMode() and CONDITIONS.IsRealismMode()
	end,
	IsBRSandbox = function()
		local var_177_0 = Dvar.CFHDGABACF("scr_br_sandbox_standard") == 0
		local var_177_1 = Dvar.DHEEJCCJBH("scr_br_gametype") == "sandbox"

		return CONDITIONS.IsMagmaGameMode() and var_177_1 and not var_177_0
	end,
	IsFultonEnabled = function()
		return CONDITIONS.IsBloodMoneyOrIsRiskGametype()
	end,
	IsTacMapGulagInfoEnabled = function()
		return not (CONDITIONS.IsBRTutorial() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsBRInflation() or not Dvar.IBEGCHEFE("scr_br_gulag"))
	end,
	IsTacMapInfoHeaderEnabled = function()
		return not (CONDITIONS.IsBRTutorial() or CONDITIONS.IsBRTutorialMap() or CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype())
	end,
	IsOnlineMatch = function(arg_181_0)
		return GameX.IsOnlineMatch()
	end,
	IsOnlineMatchNonSplitscreen = function(arg_182_0)
		return GameX.IsOnlineMatch() and (not not Engine.DDJFBBJAIG() or not GameX.IsSplitscreen())
	end,
	IsRankedMatch = function(arg_183_0)
		return GameX.IsRankedMatch()
	end,
	IsAllowedToSpectate = function(arg_184_0, arg_184_1)
		local var_184_0 = 0

		if MatchRules.EAIEFBHGJ() then
			local var_184_1 = DataSources.inGame.MP.match.team:GetValue(arg_184_1)

			var_184_0 = MatchRules.BIJEDCBCBH("commonOption", "spectateModeAllowed")
		end

		return var_184_0 ~= 0 and not CONDITIONS.IsLaunchChunk()
	end,
	IsDead = function(arg_185_0)
		return Game.BFEEGCHICA(arg_185_0, "ui_session_state") == "dead"
	end,
	IsSpectating = function(arg_186_0)
		if not Engine.EAAHGICFBD() then
			return false
		end

		local var_186_0 = Game.BFEEGCHICA(arg_186_0, "ui_session_state")

		return Game.EDJIEDJ() or var_186_0 == "spectator"
	end,
	IsInSpectatorTeam = function(arg_187_0)
		return Game.DHEDEIHGF() == Teams.spectator
	end,
	IsSpectatingNotCODCaster = function(arg_188_0)
		return CONDITIONS.IsSpectating(arg_188_0) and not CODCASTER_CONDITIONS.IsCODCaster()
	end,
	IsSplitscreen = function(arg_189_0)
		return not Engine.DDJFBBJAIG() and GameX.IsSplitscreen()
	end,
	IsFriendsButtonAccessible = function(arg_190_0, arg_190_1)
		local var_190_0 = Engine.DBAEJAHFGJ(arg_190_1)

		return IsOnlineMatch() and not var_190_0 and not Engine.CAADCDEEIA()
	end,
	IsNVGActionable = function(arg_191_0, arg_191_1)
		return DataSources.inGame.player.nvgActionable:GetValue(arg_191_1)
	end,
	WeaponHasAltMode = function(arg_192_0, arg_192_1)
		return DataSources.inGame.player.currentWeapon.hasAltMode:GetValue(arg_192_0)
	end,
	NeedsDialogue = function(arg_193_0)
		return CONDITIONS.IsCaptive or CONDITIONS.IsStpetersburg
	end,
	UseCACBreadCrumbs = function(arg_194_0)
		return Engine.DDJFBBJAIG() and Engine.EAAHGICFBD() and not IsPrivateMatch() and not IsSystemLink()
	end,
	IsDraftEnabled = function(arg_195_0)
		return (IsPrivateMatch() or IsSystemLink()) and LoadoutDrafting.BADICCBICG() and Engine.ECHCFGDDDF() and MLG.AreMLGRulesEnabled() and not Dvar.IBEGCHEFE("MLNSOPOTNQ")
	end,
	AreLootStreaksEnabled = function(arg_196_0)
		return not Dvar.IBEGCHEFE("LNSMNRRQN")
	end,
	IsTeamChoiceAllowed = function(arg_197_0)
		if CONDITIONS.IsLaunchChunk(arg_197_0) then
			return false
		end

		local var_197_0 = DataSources.inGame.MP.match.gameType:GetValue(0)

		return StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_197_0, CSV.gameTypesTable.cols.teamChoice) == "1" and not GameX.IsRankedMatch() and not MLG.JIHGCIJCG()
	end,
	IsTeamOrCodcasterChoiceAllowed = function(arg_198_0)
		return (CONDITIONS.IsTeamChoiceAllowed(arg_198_0) or CODCASTER_CONDITIONS.IsCODCastingAllowed(arg_198_0)) and not CODCASTER_CONDITIONS.IsCODCaster()
	end,
	IsClassChoiceAllowed = function(arg_199_0, arg_199_1)
		local var_199_0 = DataSources.inGame.MP.match.gameType:GetValue(arg_199_1)
		local var_199_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_199_0, CSV.gameTypesTable.cols.classChoice) == "1" and not GameX.UsesFakeLoadout()
		local var_199_2 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_199_0, CSV.gameTypesTable.cols.teamChoice) == "1" and not GameX.IsRankedMatch()
		local var_199_3 = Game.DHEDEIHGF()
		local var_199_4 = var_199_2 and (var_199_3 == Teams.allies or var_199_3 == Teams.axis) or not var_199_2

		if var_199_0 == MP.GameMode.ArenaGameType then
			if DataSources.inGame.HUD.arenaLoadoutType:GetValue(arg_199_1) == 1 then
				var_199_1 = true
			else
				var_199_1 = false
			end
		elseif var_199_0 == MP.GameMode.FFAGameType then
			var_199_1 = (not Game.BFEEGCHICA(arg_199_1, "ui_skip_loadout") or false) and true
		end

		if CONDITIONS.ShouldAllowChoosingClassBR() and not CONDITIONS.IsBMTutorialMap() then
			var_199_1 = true
		end

		return var_199_1 and var_199_4
	end,
	IsRetryButtonAllowed = function(arg_200_0, arg_200_1)
		if CONDITIONS.IsTrialGameType(arg_200_0) then
			return DataSources.inGame.MP.trialRetryDisabled:GetValue(arg_200_1) == false
		else
			return false
		end
	end,
	IsAliensNotSolo = function(arg_201_0)
		local var_201_0 = Engine.EAIICIFIFA()
		local var_201_1 = Dvar.IBEGCHEFE("LSTLQTSSRM")
		local var_201_2 = Dvar.IBEGCHEFE("LNQLRSNMQS")

		return not var_201_0 or not var_201_1 or not var_201_2
	end,
	IsAliensSolo = function(arg_202_0)
		local var_202_0 = Engine.EAIICIFIFA()
		local var_202_1 = Dvar.IBEGCHEFE("LNQLRSNMQS")

		return var_202_0 and var_202_1
	end,
	IsAliensOnline = function(arg_203_0)
		return Engine.EAIICIFIFA() and not IsSystemLink()
	end,
	IsSystemLink = function(arg_204_0)
		return IsSystemLink()
	end,
	IsAliensSoloOrSystemLink = function(arg_205_0)
		local var_205_0 = CONDITIONS.IsAliensSolo()
		local var_205_1 = CONDITIONS.IsSystemLink()

		return var_205_0 or var_205_1
	end,
	IsLocalPlayAllowed = function(arg_206_0)
		return Engine.BHCBGBFEJI()
	end,
	IsPrivateMatchTournament = function(arg_207_0)
		local var_207_0 = LUI.FlowManager.GetScopedData(arg_207_0)

		return Dvar.IBEGCHEFE("LTPLSOTTSR") and var_207_0 and var_207_0.isTournament
	end,
	IsSpecificIntegerOmnvarEqualTo = function(arg_208_0, arg_208_1, arg_208_2)
		return Game.BFEEGCHICA(arg_208_0, arg_208_1) == arg_208_2
	end,
	IsSpecificIntegerOmnvarGreaterThan = function(arg_209_0, arg_209_1, arg_209_2)
		return arg_209_2 < Game.BFEEGCHICA(arg_209_0, arg_209_1)
	end,
	IsSpecificIntegerOmnvarGreaterThanOrEqualTo = function(arg_210_0, arg_210_1, arg_210_2)
		return arg_210_2 <= Game.BFEEGCHICA(arg_210_0, arg_210_1)
	end,
	IsSpecificIntegerOmnvarLessThan = function(arg_211_0, arg_211_1, arg_211_2)
		return arg_211_2 > Game.BFEEGCHICA(arg_211_0, arg_211_1)
	end,
	IsSpecificIntegerOmnvarLessThanOrEqualTo = function(arg_212_0, arg_212_1, arg_212_2)
		return arg_212_2 >= Game.BFEEGCHICA(arg_212_0, arg_212_1)
	end,
	IsSpecificOmnvarTrue = function(arg_213_0, arg_213_1)
		return Game.BFEEGCHICA(arg_213_0, arg_213_1)
	end,
	IsConsoleGame = function(arg_214_0)
		return Engine.HDGDBCJFG()
	end,
	IsPS4 = function(arg_215_0)
		return Engine.CIEGIACHAE()
	end,
	IsPC = function(arg_216_0)
		return not Engine.HDGDBCJFG()
	end,
	IsPCOrPS4 = function(arg_217_0)
		return not Engine.HDGDBCJFG() or Engine.CIEGIACHAE()
	end,
	IsPCOrXB3 = function(arg_218_0)
		return not Engine.HDGDBCJFG() or Engine.BAHIIBFDDG()
	end,
	IsPcAndNotSingleplayer = function(arg_219_0)
		return Engine.CGABICJHAI() and not Engine.CAADCDEEIA()
	end,
	IsBattleNet = function(arg_220_0)
		return Engine.DBFCJBDJEC()
	end,
	IsXboxOne = function(arg_221_0)
		return Engine.BAHIIBFDDG()
	end,
	IsXboxLive = function(arg_222_0)
		return Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()
	end,
	IsPCApp = function(arg_223_0)
		return Engine.BEFACAIFDD()
	end,
	IsPCDesktop = function(arg_224_0)
		return Engine.CGABICJHAI() and not Engine.BEFACAIFDD()
	end,
	IsWeGame = function(arg_225_0)
		return Engine.ECAJCAJJGF()
	end,
	IsWeGameGovBanned = function(arg_226_0)
		return Engine.ECAJCAJJGF() and Dvar.IBEGCHEFE("LTNRRMQNSQ")
	end,
	InFrontEndAndNotWeGameGovBanned = function(arg_227_0)
		return CONDITIONS.InFrontend(arg_227_0) and not CONDITIONS.IsWeGameGovBanned(arg_227_0)
	end,
	IsCrossplay = function(arg_228_0)
		return Dvar.IBEGCHEFE("SMKRLSNRT")
	end,
	IsBattleNetOrCrossplay = function(arg_229_0)
		return Engine.DBFCJBDJEC() or Dvar.IBEGCHEFE("SMKRLSNRT")
	end,
	IsLaunchChunk = function(arg_230_0)
		return Dvar.IBEGCHEFE("MPNRKLKOKR") and CONDITIONS.IsConsoleGame()
	end,
	IsKoreanAccount = function(arg_231_0)
		return Engine.DDHFCGHJEA()
	end,
	IsKoreanOrKorean15Account = function(arg_232_0)
		return Engine.DDHFCGHJEA() or Engine.FABABBDBA()
	end,
	IsBattleNetLanOnly = function(arg_233_0)
		return Engine.BJGAADIDFH()
	end,
	IsKoreanIGR = function(arg_234_0)
		return Engine.DIEEIEFCFF()
	end,
	IsInKoreanIGRPaidSession = function(arg_235_0)
		return Engine.GEHBEDCEC()
	end,
	IsUserAGuest = function(arg_236_0)
		return Engine.DBAEJAHFGJ(arg_236_0)
	end,
	IsUserSignedIn = function(arg_237_0)
		return Engine.CDCCDDJAJJ(arg_237_0)
	end,
	IsUserSignedInBnet = function(arg_238_0)
		return Engine.CDCCDDJAJJ(arg_238_0) and Engine.DBFCJBDJEC()
	end,
	IsUserSignedInBnetFrontend = function(arg_239_0)
		return Engine.CDCCDDJAJJ(arg_239_0) and Engine.DBFCJBDJEC() and Engine.DDJFBBJAIG()
	end,
	IsUserSignedInDemonware = function(arg_240_0)
		return Engine.BACCCIHGDG() and Engine.CJJAFGIFAC(arg_240_0)
	end,
	IsCplab = function(arg_241_0)
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_lab"
	end,
	IsCpSoSafehouse = function(arg_242_0)
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_so_safehouse"
	end,
	IsCpRaidMode = function(arg_243_0)
		local var_243_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		if Engine.EAIICIFIFA() and (var_243_0 == "cp_raid_complex" or var_243_0 == "cp_dntsk_raid") then
			return true
		else
			return false
		end
	end,
	IsCpRaidComplex = function(arg_244_0)
		if Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_raid_complex" then
			return true
		else
			return false
		end
	end,
	IsCpDntskRaid = function(arg_245_0)
		if Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_dntsk_raid" then
			return true
		else
			return false
		end
	end,
	IsEuropa = function(arg_246_0)
		return Game.ECIFCJJJIA() == "europa"
	end,
	IsPearlHarbor = function(arg_247_0)
		local var_247_0 = Game.ECIFCJJJIA()

		return var_247_0 == "phparade" or var_247_0 == "phstreets" or var_247_0 == "phspace"
	end,
	IsMoon = function(arg_248_0)
		local var_248_0 = Game.ECIFCJJJIA()

		return var_248_0 == "moon_port" or var_248_0 == "moonjackal"
	end,
	IsTitan = function(arg_249_0)
		local var_249_0 = Game.ECIFCJJJIA()

		return var_249_0 == "titan" or var_249_0 == "titanjackal"
	end,
	IsRogue = function(arg_250_0)
		return Game.ECIFCJJJIA() == "rogue"
	end,
	IsPrisoner = function(arg_251_0)
		return Game.ECIFCJJJIA() == "prisoner"
	end,
	IsHeist = function(arg_252_0)
		local var_252_0 = Game.ECIFCJJJIA()

		return var_252_0 == "heist" or var_252_0 == "heistspace"
	end,
	IsMars = function(arg_253_0)
		return Game.ECIFCJJJIA() == "marsbase"
	end,
	IsYard = function(arg_254_0)
		return Game.ECIFCJJJIA() == "yard"
	end,
	IsCaptive = function(arg_255_0)
		return Game.ECIFCJJJIA() == "captive"
	end,
	IsStpetersburg = function(arg_256_0)
		return Game.ECIFCJJJIA() == "stpetersburg"
	end,
	IsSafehouseFinale = function(arg_257_0)
		return Game.ECIFCJJJIA() == "safehouse_finale"
	end,
	IsProxyWar = function(arg_258_0)
		return Game.ECIFCJJJIA() == "proxywar"
	end,
	IsInCredits = function(arg_259_0)
		return Dvar.IBEGCHEFE("credits_active") or Dvar.CFHDGABACF("ROQSKRSPL") == 1
	end,
	IsSPDummyTabletMap = function(arg_260_0)
		local var_260_0 = Game.ECIFCJJJIA()

		return var_260_0 == "marines" or var_260_0 == "safehouse_finale"
	end,
	IsBRTutorial = function(arg_261_0)
		local var_261_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		return var_261_0 == "mp_br_tut" or var_261_0 == "mp_br_quarry"
	end,
	IsBRTutorialMap = function(arg_262_0)
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_br_tut"
	end,
	IsBRTDMMap = function(arg_263_0)
		return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "brtdm"
	end,
	IsBMTutorialMap = function()
		return Dvar.DHEEJCCJBH("NSQLTTMRMP") == "mp_bm_tut"
	end,
	IsBRQuarryTutorialMap = function(arg_265_0)
		local var_265_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		if Game.GEAJDFCDC() then
			var_265_0 = Game.ECIFCJJJIA()
		end

		return var_265_0 == "mp_br_quarry"
	end,
	IsBMTutorialMapAvailable = function(arg_266_0)
		return Dvar.IBEGCHEFE("NNTRQOMLSQ")
	end,
	IsBRTutorialRetryEnabled = function(arg_267_0)
		if CONDITIONS.IsBRTutorial(arg_267_0) then
			return Dvar.IBEGCHEFE("NQTKKMTSKL")
		end

		return false
	end,
	IsBRSpectateEnabled = function(arg_268_0, arg_268_1)
		local var_268_0 = LUI.PostGameManager.IsBRExfilStarted(arg_268_1)

		return CONDITIONS.IsBRGameType(arg_268_0) and not CONDITIONS.IsBloodMoney(arg_268_0) and not CONDITIONS.IsRiskGametype() and not CONDITIONS.IsBRTutorial() and not var_268_0 and not CONDITIONS.IsBRX1Variant()
	end,
	CanSkipWZTutorial = function(arg_269_0)
		return Dvar.IBEGCHEFE("LSPSKLPNQT")
	end,
	AreLoadingHintsEnabled = function(arg_270_0)
		return CONDITIONS.IsBRTDMMap(arg_270_0) or CONDITIONS.IsMagmaGameMode(arg_270_0) and not CONDITIONS.IsBRTutorial(arg_270_0) and not CONDITIONS.IsBMTutorialMap(arg_270_0)
	end,
	IsTrialLicense = function(arg_271_0)
		return Engine.BDGIEFCCJE()
	end,
	ArePartiesEnabledInMainMenu = function(arg_272_0)
		return Dvar.IBEGCHEFE("MPNKQNOKKS") and not CONDITIONS.IsWeGameGovBanned(arg_272_0)
	end,
	IsSocialEnabledInMainMenu = function(arg_273_0)
		local var_273_0 = Engine.FABABBDBA() and not Engine.GEHBEDCEC()

		return Dvar.IBEGCHEFE("MPNKQNOKKS") and not CONDITIONS.IsWeGameGovBanned(arg_273_0) and not var_273_0
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
	HideBuyMWPromptMagmaBlades = function()
		if Dvar.IBEGCHEFE("MNTMKQRSTQ") then
			return LUI.FlowManager.IsInStack("MainMenuOffline")
		else
			return false
		end
	end,
	IsOnlineAndSignedIn = function(arg_278_0)
		return Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_278_0) and Engine.CJJAFGIFAC(arg_278_0)
	end,
	ShouldHideButtonPrompts = function(arg_279_0)
		return Dvar.IBEGCHEFE("hide_button_prompts") == true
	end,
	ShouldHideButtonPromptSP = function(arg_280_0)
		return Dvar.IBEGCHEFE("hide_button_prompts") or not Engine.EAAHGICFBD()
	end,
	KillswitchMPWeaponIcon = function(arg_281_0)
		return Dvar.IBEGCHEFE("ui_killswitch_mp_weapon_icon") == true
	end,
	AreWeaponVariantsEnabled = function(arg_282_0)
		return Dvar.IBEGCHEFE("OLMOTLRSPK") == true and CONDITIONS.IsUserSignedInDemonware(arg_282_0)
	end,
	ForceOnlineMenus = function(arg_283_0)
		return Dvar.IBEGCHEFE("LMMRONPQMO")
	end,
	IsGameBattlesAllowed = function(arg_284_0)
		if Engine.BDGIEFCCJE() then
			return false
		elseif not Engine.ECHCFGDDDF() then
			return false
		elseif Dvar.IBEGCHEFE("LPRROTMQNK") then
			return true
		elseif Engine.DBFCJBDJEC() then
			return Dvar.IBEGCHEFE("NMKLTMPKRM")
		elseif Engine.CIEGIACHAE() then
			return Dvar.IBEGCHEFE("LPKLTLRSNQ")
		elseif Engine.BAHIIBFDDG() then
			return Dvar.IBEGCHEFE("MQOKLRKKNQ")
		end

		return false
	end,
	IsInGameBattlesMatch = function(arg_285_0)
		return Dvar.IBEGCHEFE("MTMMPLSRNL")
	end,
	IsGameBattlesXPEnabled = function(arg_286_0)
		return not CONDITIONS.IsInGameBattlesMatch() or Dvar.IBEGCHEFE("OLLOKOKKSM")
	end,
	IsSurvivalModeAllowed = function(arg_287_0)
		return Dvar.IBEGCHEFE("NRRNOTRMOP")
	end,
	IsTournamentModeAllowed = function(arg_288_0)
		return Dvar.IBEGCHEFE("NLPONNQNRS") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned(arg_288_0)
	end,
	IsPrivateTournamentAllowed = function(arg_289_0)
		return Dvar.IBEGCHEFE("NLPONNQNRS") and Engine.ECHCFGDDDF() and Dvar.IBEGCHEFE("LTPLSOTTSR") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned(arg_289_0)
	end,
	IsOGPlaylistAllowed = function(arg_290_0)
		return not Dvar.IBEGCHEFE("LPTSRPTOQQ") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned(arg_290_0)
	end,
	IsMagmaEnabled = function(arg_291_0)
		return Dvar.IBEGCHEFE("NMNPSRKPPP") and not CONDITIONS.IsWeGameGovBanned(arg_291_0)
	end,
	ShouldDisplayUpsellPopup = function(arg_292_0)
		return Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_292_0) and not Engine.FABABBDBA() and Engine.BACCCIHGDG()
	end,
	ShouldDisplayAARUpsellPrompt = function(arg_293_0)
		return Dvar.IBEGCHEFE("MOMKSMKTOQ") and not Engine.CFHBIHABCB(arg_293_0) and not Engine.FABABBDBA()
	end,
	IsCampaignAllowed = function(arg_294_0)
		return Engine.CEGDBDIIIE(CoD.PlayMode.SP, arg_294_0)
	end,
	IsMultiplayerAllowed = function(arg_295_0)
		return Engine.CEGDBDIIIE(CoD.PlayMode.Core, arg_295_0)
	end,
	IsCoopAllowed = function(arg_296_0)
		return Engine.CEGDBDIIIE(CoD.PlayMode.Aliens, arg_296_0)
	end,
	IsMagmaGameMode = function(arg_297_0)
		if Engine.DDJFBBJAIG() then
			return Dvar.IBEGCHEFE("QTQRQPLNK")
		else
			return Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br"
		end
	end,
	IsMPLeaderboardsAllowed = function(arg_298_0)
		return not Dvar.IBEGCHEFE("MMLPKNNRMM")
	end,
	IsCPLeaderboardsAllowed = function(arg_299_0)
		return not Dvar.IBEGCHEFE("LKMRLPORSK")
	end,
	IsLeaderboardsKillswitched = function(arg_300_0)
		return Engine.ECHCFGDDDF() and Dvar.IBEGCHEFE("MMLPKNNRMM") or Engine.EAIICIFIFA() and Dvar.IBEGCHEFE("LKMRLPORSK")
	end,
	IsCombatRecordEnabled = function(arg_301_0)
		return Dvar.IBEGCHEFE("MQNLOSMSQR")
	end,
	AreTabletsFilteredOut = function()
		local var_302_0 = Dvar.DHEEJCCJBH("MSLKNNLLMN")

		for iter_302_0 in string.gmatch(var_302_0, "([^%s]+)") do
			if iter_302_0 == "tablet" then
				return true
			end
		end

		return false
	end,
	IsNetStatsDevFeatureAvailable = function(arg_303_0)
		return Dvar.IBEGCHEFE("SMLKTKNRO") ~= true
	end,
	PrivateDsAllowed = function(arg_304_0)
		local var_304_0 = LUI.FlowManager.GetScopedData(arg_304_0)

		return Dvar.IBEGCHEFE("LMKKTLPSRN") == true and CONDITIONS.IsCoreMultiplayer() and not var_304_0.isTournament
	end,
	IsPlayerRoleAllowed = function(arg_305_0)
		if CONDITIONS.IsThirdGameMode() and CONDITIONS.IsCoopPvpeType() and (IsPrivateMatch() or IsSystemLink()) then
			return true
		else
			return not Engine.HEEFCICJE() and Engine.ECHCFGDDDF() and (IsPrivateMatch() or IsSystemLink())
		end
	end,
	AreCPChallengesActive = function(arg_306_0)
		local var_306_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

		return IsPublicMatch() and var_306_0 == "cp_survival" or var_306_0 == "cp_wave_sv" and not IsSystemLink() or var_306_0 == "cp_specops" and not IsSystemLink()
	end,
	IsSplitScreenEnabled = function(arg_307_0)
		return Dvar.IBEGCHEFE("MRNSTPNLPS")
	end,
	AreTrialsEnabled = function(arg_308_0)
		return Dvar.IBEGCHEFE("LOMSTMNPRR")
	end,
	IsWZTrialsAccessEnabled = function(arg_309_0)
		return Dvar.IBEGCHEFE("LOMSTMNPRR") and Dvar.IBEGCHEFE("NORMPNKNKQ")
	end,
	IsArmoryEnabled = function(arg_310_0, arg_310_1)
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_wave_sv" and not Engine.DDJFBBJAIG() then
			return false
		else
			return Dvar.IBEGCHEFE("MRRPNNKKPO") and CONDITIONS.IsUserSignedInDemonware(arg_310_1)
		end
	end,
	IsMPPrivateMatchEnabled = function(arg_311_0)
		return Dvar.IBEGCHEFE("LQKTNLONLP")
	end,
	IsWZPrivateMatchEnabled = function(arg_312_0)
		return Dvar.IBEGCHEFE("LOQQOSNQKN")
	end,
	IsTrialEventAvailable = function(arg_313_0)
		return Dvar.IBEGCHEFE("NOPLKRPKQL")
	end,
	IsTrialEventAvailableInWZ = function(arg_314_0)
		return CONDITIONS.IsTrialEventAvailable(arg_314_0) and Dvar.IBEGCHEFE("NMTRNKQNOP")
	end,
	IsStoreAllowed = function(arg_315_0)
		return Dvar.IBEGCHEFE("LNLPTMKPT") and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsStoreBundlePreviewListEnabled = function(arg_316_0)
		return Dvar.IBEGCHEFE("LSSPPSTLQ")
	end,
	IsBattlePassEnabled = function(arg_317_0)
		return Dvar.IBEGCHEFE("NRTSOTKTOS") and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsDisplayingBattlePassAAR = function(arg_318_0)
		return arg_318_0 and arg_318_0._displayBattlePassInAAR
	end,
	IsChallengeTabEnabled = function()
		return Dvar.IBEGCHEFE("NLSTMSNRKN") and not CONDITIONS.IsWeGameGovBanned()
	end,
	IsChallengesSummaryEnabled = function(arg_320_0)
		return IsPublicMatch() and CONDITIONS.IsGameBattlesXPEnabled()
	end,
	IsTierSaleEnabled = function()
		return Dvar.CFHDGABACF("MOKSKKQRLK") > 0
	end,
	AreKeysEnabled = function(arg_322_0)
		return Dvar.IBEGCHEFE("LPOOMOLLRQ") and CONDITIONS.IsStoreAllowed() and not CONDITIONS.IsWeGameGovBanned(arg_322_0) and not Engine.BDGIEFCCJE()
	end,
	AreCODPointsEnabled = function(arg_323_0)
		return Dvar.IBEGCHEFE("LNTOKPTKS") and CONDITIONS.IsStoreAllowed() and not CONDITIONS.IsWeGameGovBanned(arg_323_0) and not Engine.BDGIEFCCJE()
	end,
	ShouldShowAnnouncersMenu = function(arg_324_0)
		return Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() and not Dvar.IBEGCHEFE("LTLNQLSSK")
	end,
	AreBribeCratesEnabled = function(arg_325_0)
		return Dvar.IBEGCHEFE("NTKOQLQNMS")
	end,
	IsEventCrateAllowed = function()
		return false
	end,
	ShowScorestreakValues = function(arg_327_0)
		return Dvar.IBEGCHEFE("LMKMRSPR")
	end,
	FieldUpgradeFrontEndEnabled = function(arg_328_0)
		return Dvar.CFHDGABACF("ui_killswitch_field_upgrade_mp_frontend") ~= 1
	end,
	IsCRMEnabled = function(arg_329_0)
		return Dvar.IBEGCHEFE("MNLNLSTSNT")
	end,
	IsGameSetupEnabled = function(arg_330_0)
		return Dvar.IBEGCHEFE("LKQKPMMRLK")
	end,
	IsGameModeSelectEnabled = function(arg_331_0)
		return Dvar.IBEGCHEFE("NKSTOOTSMO")
	end,
	IsMapSelectEnabled = function(arg_332_0)
		return Dvar.IBEGCHEFE("MSROMLONNT")
	end,
	IsIntelEnabled = function(arg_333_0)
		return Dvar.IBEGCHEFE("LROKLTPMOM") and not CONDITIONS.IsMPIntelMenuEnabled(arg_333_0)
	end,
	AreCustomGameRulesEnabled = function(arg_334_0)
		return Dvar.IBEGCHEFE("TORMQRSOS")
	end,
	IsBotSetupEnabled = function(arg_335_0)
		return Dvar.IBEGCHEFE("LNORNRSRLR")
	end,
	IsGameSetupEnabledAndCPDevMode = function(arg_336_0)
		return CONDITIONS.IsGameSetupEnabled() and (not CONDITIONS.IsThirdGameMode() or Dvar.IBEGCHEFE("LSSRRSMNMR"))
	end,
	AreSpecOpsStarsEnabled = function(arg_337_0)
		return Dvar.IBEGCHEFE("SNTTNKSRO")
	end,
	AreSpecOpsRewardsEnabled = function(arg_338_0)
		return Dvar.IBEGCHEFE("OLLPNSOSNN")
	end,
	AreSpecOpsStarsEnabledAndIsSpecOpsGameType = function(arg_339_0)
		return CONDITIONS.AreSpecOpsStarsEnabled() and CONDITIONS.IsSpecOpsGameType()
	end,
	IsVehicleCustomizeEnabled = function(arg_340_0)
		return Dvar.IBEGCHEFE("NKNMQRQMM")
	end,
	IsVehicleHornsEnabled = function(arg_341_0)
		return Dvar.IBEGCHEFE("NRPOLLOOLL")
	end,
	IsBattleTracksEnabled = function(arg_342_0)
		return Dvar.IBEGCHEFE("NKORSMKORK")
	end,
	IsNewBarracksIdentityEnabled = function(arg_343_0)
		return Dvar.IBEGCHEFE("NNPPKLQOSN")
	end,
	IsBlueprintStoreEnabled = function(arg_344_0)
		return Dvar.IBEGCHEFE("MRKSTPMLT")
	end,
	IsLateGrindersEnabled = function(arg_345_0)
		return Dvar.IBEGCHEFE("NPKTRSPLNN")
	end,
	SupersEnabled = function(arg_346_0)
		return Dvar.CFHDGABACF("scr_supers_killswitch") ~= 1
	end,
	AreCompassEnemyElementsHidden = function(arg_347_0, arg_347_1)
		return Game.BFEEGCHICA(arg_347_1, "ui_compass_hide_enemy")
	end,
	IsUsingPerBulletHitMarkers = function(arg_348_0)
		return Dvar.IBEGCHEFE("OMRLPMMPRL") == true
	end,
	KillswitchFieldUpgrades = function(arg_349_0)
		return Dvar.IBEGCHEFE("ui_killswitch_field_upgrade_hud") == true
	end,
	IsJapanese = function(arg_350_0)
		return IsLanguageJapanese()
	end,
	IsArabic = function(arg_351_0)
		return IsLanguageArabic()
	end,
	IsArabicSKU = function(arg_352_0)
		return IsArabicSKU()
	end,
	IsDoubleXPActive = function()
		return LOOT.IsDoubleXPActive()
	end,
	IsDoubleWeaponXPActive = function()
		return LOOT.IsDoubleWeaponXPActive()
	end,
	HasDoubleXPTokens = function(arg_355_0)
		return LOOT.HasDoubleXPToken(arg_355_0)
	end,
	IsDoubleXPPossible = function(arg_356_0)
		return CONDITIONS.IsDoubleXPActive(arg_356_0) or CONDITIONS.IsDoubleWeaponXPActive(arg_356_0)
	end,
	WeaponIndexIsPrimary = function(arg_357_0)
		return LUI.FlowManager.GetScopedData(arg_357_0).weaponSlot == WEAPON.PrimarySlot
	end,
	GunsmithCanMakeModification = function(arg_358_0, arg_358_1)
		if Engine.DDJFBBJAIG() and IsPublicMatch() and not MLG.IsCDLActive(arg_358_1) and not CONDITIONS.IsInGameBattlesMatch() then
			local var_358_0 = LUI.FlowManager.GetScopedData(arg_358_0)
			local var_358_1 = PlayerData.BFFBGAJGD(arg_358_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_358_0.loadoutIndex].weaponSetups[var_358_0.weaponSlot]

			return GUNSMITH.CanMakeModification(arg_358_1, var_358_1.weapon:get())
		end

		return false
	end,
	AreInGameLoadoutTabsEnabled = function(arg_359_0, arg_359_1)
		return not Game.BFEEGCHICA(arg_359_1, "ui_only_default_loadouts") and Dvar.IBEGCHEFE("NTMRRKSKPQ") and PROGRESSION.IsUnlocked(arg_359_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef)
	end,
	IsPCAchievementsMenuAvailable = function(arg_360_0)
		return Engine.CGABICJHAI() and Dvar.IBEGCHEFE("SPOPPKOTP")
	end,
	IsMPIntelMenuEnabled = function(arg_361_0)
		return Dvar.IBEGCHEFE("MTRLRMPONT")
	end,
	IsOperatorUpsellEnabled = function(arg_362_0)
		return Dvar.IBEGCHEFE("OMPKROKQPL")
	end,
	ShouldCreateKeybindLinkButton = function(arg_363_0)
		return arg_363_0._needKeybindLinkButton
	end,
	ShouldCreateMoreInfoInnerButton = function(arg_364_0)
		return arg_364_0._needMoreInfoInnerButton
	end,
	IsBrButtonLayoutActive = function(arg_365_0)
		return Engine.CAGFEHGHGH(arg_365_0)
	end,
	AreCDLRulesActive = function(arg_366_0)
		return MLG.IsCDLActive(arg_366_0)
	end,
	IsCODTvEnabled = function(arg_367_0)
		return Dvar.IBEGCHEFE("LOOTSOTKLS")
	end,
	AreRestrictionsActive = function(arg_368_0)
		return CONDITIONS.AreCDLRulesActive(arg_368_0)
	end,
	IsThirdGameModeAndSurvivalModeAllowed = function(arg_369_0)
		return CONDITIONS.IsThirdGameMode(arg_369_0) and CONDITIONS.IsSurvivalModeAllowed(arg_369_0)
	end
}
