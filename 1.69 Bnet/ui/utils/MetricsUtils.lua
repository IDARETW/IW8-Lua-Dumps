METRICS = METRICS or {}
METRICS.VOID_STRING = "VOID"
METRICS.VOID_NUM = -1
METRICS.ContextualActionIndexDLog = {
	reportPlayer = 9,
	favoriteFaction = 18,
	friendRequest = 7,
	kickPlayer = 3,
	removeFriend = 8,
	mutePlayer = 5,
	copyLoadout = 14,
	operatorPreview = 17,
	none = 0,
	viewTutorial = 21,
	MOTD = 22,
	viewProfile = 6,
	resetOption = 23,
	unbind = 24,
	whisper = 4,
	blockPlayer = 10,
	equipLoot = 25,
	equipAndGunsmith = 11,
	attachmentDeselect = 19,
	operatorBio = 15,
	operatorEditSkin = 16,
	sendInvite = 2,
	renameLoadout = 13,
	joinGame = 1,
	previewWeapon = 12,
	chooseAppearance = 20
}
METRICS.CustomGraphicDvarNamesToDLog = {
	"RNTPKOPSS",
	"MPLORMMQPT",
	"LLLRTQOTKS",
	"QLQPPSRK",
	"NPPRSOTNLR",
	"OMQTQNOSRO",
	"NSRPORKNPT",
	"NNMSONQSOP",
	"OMKRNTLOQO",
	"SNMKKNPTQ",
	"MLKRKRSQQM",
	"MRMRQNPPOT",
	"MTONTNKOKR",
	"NNNSPLTKLL",
	"QMSKSNLNK",
	"MTPOKSNNRL",
	"OQSPSSNRT",
	"LSNOMRTLRR",
	"NRSSTQQSKK",
	"STLRTMLSP",
	"PSTSNKNPR",
	"SRKPNTSRM",
	"OKKTMLKNNR",
	"cl_transient_mp_yield_for_streamer",
	"NMRKPSTNQO",
	"NMLTRQRNTM",
	"OPOTTRRNQ",
	"NNQMQOLKQL",
	"MKQRLOOLKS",
	"MORLLPSLTT",
	"MQOSMOKPMT",
	"MPSKPRQSRS",
	"OMTOTLTNRP",
	"MMOOTNSSP",
	"OPPPMPTPL",
	"NOOLPRQMTR"
}
METRICS.CacExitReasons = {
	PLAYER_EXIT = 0,
	GAME_START_INTERRUPT = 2,
	PLAYER_SELECTED_LOADOUT = 1,
	UNEXPECTED_CLOSE = 3
}
METRICS.EndMatchDLog = {
	NONE = 0,
	KEYBINDS_GAMEPLAY = BitwiseOperators.lshift(1, 0),
	GRAPHICS = BitwiseOperators.lshift(1, 1),
	GENERAL = BitwiseOperators.lshift(1, 2),
	AUDIO = BitwiseOperators.lshift(1, 3),
	CONTROLLER = BitwiseOperators.lshift(1, 4),
	ACCOUNT = BitwiseOperators.lshift(1, 5)
}

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = StringTable.BFHCAIIDA(arg_1_3.file)
	local var_1_1 = {}

	for iter_1_0 = 0, var_1_0 - 1 do
		local var_1_2 = arg_1_2[StringTable.CBGJCDIHCE(arg_1_3.file, iter_1_0, arg_1_3.cols.identifier)]

		var_1_1[#var_1_1 + 1] = var_1_2
	end

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_1) do
		if iter_2_1.type == "Expander" then
			local var_2_1 = LUI.Split(iter_2_1.name, ";")

			for iter_2_2, iter_2_3 in pairs(var_2_1) do
				local var_2_2 = arg_2_2[iter_2_3]

				table.insert(var_2_0, var_2_2)
			end
		end
	end

	return var_2_0
end

function METRICS.RecordControllerOptionsDLog(arg_3_0)
	local var_3_0 = OPTIONS.InitOptionsList(nil, arg_3_0)
	local var_3_1 = var_0_0(nil, arg_3_0, var_3_0, CSV.gamepadOptions)
	local var_3_2 = {}

	if var_3_1 then
		local var_3_3 = var_0_1(arg_3_0, var_3_1, var_3_0)

		LUI.ConcatenateToTable(var_3_1, var_3_3)

		for iter_3_0, iter_3_1 in pairs(var_3_1) do
			local var_3_4 = iter_3_1.dvar or iter_3_1.profileOption

			if var_3_4 then
				local var_3_5 = OPTIONS.GetSetting(var_3_4, arg_3_0, false, true)

				if var_3_5 ~= nil then
					var_3_2[iter_3_1.id] = var_3_5
				end
			end
		end

		Engine.CEJJDJJHIJ(0, "dlog_event_player_game_options_controller", {
			button_layout = var_3_2.ButtonLayout or METRICS.VOID_STRING,
			button_wz_layout = var_3_2.BRButtonLayout or METRICS.VOID_STRING,
			stick_layout = var_3_2.StickLayout or METRICS.VOID_STRING,
			look_horz_sens = var_3_2.LookHorzSens or METRICS.VOID_NUM,
			look_vert_sens = var_3_2.LookVertSens or METRICS.VOID_NUM,
			ads_low_zoom_stick_sensitivity_multiplier = var_3_2.AdsLowZoomStickSensitivityMultiplier or METRICS.VOID_NUM,
			ads_high_zoom_stick_sensitivity_multiplier = var_3_2.AdsHighZoomStickSensitivityMultiplier or METRICS.VOID_NUM,
			aim_response_curve_type = var_3_2.AimResponseCurveType or METRICS.VOID_NUM,
			rumble = var_3_2.Rumble or false,
			mount_config = var_3_2.MountConfig or METRICS.VOID_NUM,
			weapon_mounting_movement_exit_controller = var_3_2.WeaponMountingMovementExitController or false,
			ads_hold_gamepad = var_3_2.ADSHoldGamepad or false,
			gamepad_reload_behaviors = var_3_2.GamepadReloadBehaviors or METRICS.VOID_NUM,
			automatic_weapon_switch_gamepad = var_3_2.AutomaticWeaponSwitchGamepad or false,
			slide_enabled_gamepad = var_3_2.SlideEnabledGamepad or false,
			auto_forward_enabled_gamepad = var_3_2.AutoForwardEnabledGamepad or false,
			invert_pitch_gamepad = OPTIONS.GetOptionValue(arg_3_0, OPTIONS_DATA.optionsDataList.InvertPitchGamepad) or METRICS.VOID_NUM,
			aim_assist = OPTIONS.GetOptionValue(arg_3_0, OPTIONS_DATA.optionsDataList.AimAssist) or METRICS.VOID_NUM,
			equipment_behavior = OPTIONS.GetOptionValue(arg_3_0, OPTIONS_DATA.optionsDataList.EquipmentBehavior) or METRICS.VOID_NUM,
			aim_assist_fov_scale = var_3_2.AimAssistFOVScale or false
		})
	end
end

function METRICS.RecordAccountOptionsDLog(arg_4_0)
	local var_4_0 = OPTIONS.InitOptionsList(nil, arg_4_0)
	local var_4_1 = var_0_0(nil, arg_4_0, var_4_0, CSV.accountOptions)
	local var_4_2 = {}

	if var_4_1 then
		local var_4_3 = var_0_1(arg_4_0, var_4_1, var_4_0)

		LUI.ConcatenateToTable(var_4_1, var_4_3)

		for iter_4_0, iter_4_1 in pairs(var_4_1) do
			local var_4_4 = iter_4_1.dvar or iter_4_1.profileOption

			if var_4_4 then
				local var_4_5 = OPTIONS.GetSetting(var_4_4, arg_4_0, false, true)

				if var_4_5 ~= nil then
					var_4_2[iter_4_1.id] = var_4_5
				end
			end
		end

		Engine.CEJJDJJHIJ(0, "dlog_event_player_game_options_account", {
			display_real_id = var_4_2.DisplayRealID or false,
			display_name_tags = var_4_2.DisplayNameTags or false,
			geographical_region = var_4_2.GeographicalRegion or false,
			external_ip_address = var_4_2.ExternalIPAddress or false,
			internal_ip_address = var_4_2.InternalIPAddress or false,
			online_debug = var_4_2.OnlineDebug or false,
			crossplay_communications = var_4_2.PlatformConstrainedChat or false,
			cross_play = OPTIONS.GetOptionValue(arg_4_0, OPTIONS_DATA.optionsDataList.CrossPlay) or METRICS.VOID_NUM
		})
	end
end

function METRICS.RecordGeneralOptionsDLog(arg_5_0)
	local var_5_0 = OPTIONS.InitOptionsList(nil, arg_5_0)
	local var_5_1 = var_0_0(nil, arg_5_0, var_5_0, CSV.generalOptions)
	local var_5_2 = {}

	if var_5_1 then
		local var_5_3 = var_0_1(arg_5_0, var_5_1, var_5_0)

		LUI.ConcatenateToTable(var_5_1, var_5_3)

		for iter_5_0, iter_5_1 in pairs(var_5_1) do
			local var_5_4 = iter_5_1.dvar or iter_5_1.profileOption

			if var_5_4 then
				local var_5_5 = OPTIONS.GetSetting(var_5_4, arg_5_0, false, true)

				if var_5_5 ~= nil then
					var_5_2[iter_5_1.id] = var_5_5
				end
			end
		end

		Engine.CEJJDJJHIJ(0, "dlog_event_player_game_options_general", {
			input_method = var_5_2.InputMethod or false,
			fov = var_5_2.FOV or METRICS.VOID_NUM,
			ads_fov = var_5_2.ADSFOV or false,
			brightness = var_5_2.Brightness or METRICS.VOID_NUM,
			hud_bounds_h = var_5_2.HudBoundsH or METRICS.VOID_NUM,
			hud_bounds_v = var_5_2.HudBoundsV or METRICS.VOID_NUM,
			skip_intro = var_5_2.SkipIntro or false,
			toggle_tooltip_enable = var_5_2.ToggleTooltipEnable or false,
			subtitles = var_5_2.Subtitles or false,
			colorblind = var_5_2.Colorblind or METRICS.VOID_NUM,
			colorblind_filter = var_5_2.ColorblindFilter or METRICS.VOID_NUM,
			text_chat_enabled = var_5_2.TextChatEnabled or false,
			laze_profanity_filter = var_5_2.LazeProfanityFilter or false,
			profanity_filter_enabled = var_5_2.ProfanityFilterEnabled or false,
			dismemberment_option = var_5_2.DismembermentOption or false,
			hdr = var_5_2.HDR or false,
			telemetry_fps_counter = var_5_2.TelemetryFPSCounter or false,
			telemetry_server_latency = var_5_2.TelemetryServerLatency or false,
			telemetry_gpu_temp = var_5_2.TelemetryGPUTemp or false,
			telemetry_gpu_time = var_5_2.TelemetryGPUTime or false,
			telemetry_cpu_time = var_5_2.TelemetryCPUTime or false,
			telemetry_mute_sound = var_5_2.TelemetryMuteSound or false,
			telemetry_mute_voice_chat = var_5_2.TelemetryMuteVoiceChat or false,
			stream_http_cache_size_console = Dvar.CFHDGABACF("NOOLPRQMTR") or METRICS.VOID_NUM,
			stream_http_req_size_user_set_console = Dvar.IBEGCHEFE("LTNRTMMPKQ") and StreamHTTP.DDGGFAEGID() or false,
			stream_http_req_size_console = Dvar.IBEGCHEFE("LTNRTMMPKQ") and StreamHTTP.DECHFDIAFC() or METRICS.VOID_NUM
		})
	end
end

function METRICS.RecordGraphicOptionsDLog(arg_6_0)
	local var_6_0 = OPTIONS.InitOptionsList(nil, arg_6_0)
	local var_6_1 = var_0_0(nil, arg_6_0, var_6_0, CSV.videoOptions)
	local var_6_2 = {}
	local var_6_3 = {}

	if var_6_1 then
		local var_6_4 = var_0_1(arg_6_0, var_6_1, var_6_0)

		LUI.ConcatenateToTable(var_6_1, var_6_4)

		for iter_6_0, iter_6_1 in pairs(var_6_1) do
			local var_6_5 = iter_6_1.dvar or iter_6_1.profileOption

			if var_6_5 then
				local var_6_6 = OPTIONS.GetSetting(var_6_5, arg_6_0, false, true)

				if var_6_6 ~= nil then
					var_6_2[iter_6_1.id] = var_6_6
				end
			end
		end

		for iter_6_2, iter_6_3 in pairs(METRICS.CustomGraphicDvarNamesToDLog) do
			local var_6_7 = OPTIONS.GetSetting(iter_6_3, arg_6_0, false, true)

			if var_6_7 ~= nil then
				var_6_3[iter_6_3] = var_6_7
			end
		end

		Engine.CEJJDJJHIJ(0, "dlog_event_graphics_options", {
			display_mode = var_6_2.DisplayMode or METRICS.VOID_STRING,
			refresh_rate = var_6_2.RefreshRate or METRICS.VOID_STRING,
			resolution = var_6_2.Resolution or METRICS.VOID_NUM,
			image_quality = var_6_2.ImageQuality or METRICS.VOID_STRING,
			aspect_ratio = var_6_2.AspectRatio or METRICS.VOID_STRING,
			v_sync = var_6_2.VSync or METRICS.VOID_NUM,
			framerate_limit = var_6_2.FramerateLimit or false,
			custom_framerate_limit = var_6_2.CustomFramerateLimit or METRICS.VOID_NUM,
			menu_framerate_limit = var_6_2.MenuCustomFramerateLimit or METRICS.VOID_NUM,
			nvidia_highlights = var_6_2.NvidiaHighlights or false,
			texture_res = var_6_2.TextureRes or METRICS.VOID_NUM,
			tex_filter_aniso = var_6_2.TexFilterAniso or METRICS.VOID_STRING,
			lod_ramp = var_6_2.LODRamp or METRICS.VOID_NUM,
			particle_quality = var_6_2.ParticleQuality or false,
			bullet_impact = var_6_2.BulletImpact or false,
			tessellation = var_6_2.Tessellation or METRICS.VOID_STRING,
			shadow_map_resolution = var_6_2.ShadowMapResolution or METRICS.VOID_STRING,
			cached_sun_shadows = var_6_2.CachedSunShadows or false,
			ambient_occlusion = var_6_2.AmbientOcclusion or METRICS.VOID_STRING,
			particle_lighting = var_6_2.ParticleLighting or METRICS.VOID_NUM,
			dxr = var_6_2.DXR or false,
			smaa_filmic_strength = var_6_2.SMAAFilmicStrength or METRICS.VOID_NUM,
			film_grain_atten = var_6_2.FilmGrainAttenPC or METRICS.VOID_NUM,
			anti_aliasing = var_6_2.AntiAliasing or METRICS.VOID_STRING,
			motion_blur_pc = var_6_2.MotionBlurPC or false,
			motion_blur_console = var_6_2.MotionBlurConsole or false,
			weapon_blur_pc = var_6_2.WeaponBlurPC or false,
			weapon_blur_console = var_6_2.WeaponBlurConsole or false,
			video_memory_scale = var_6_3.RNTPKOPSS or METRICS.VOID_NUM,
			lod_scale = var_6_3.MPLORMMQPT or METRICS.VOID_NUM,
			fullscreen_preference = var_6_3.LLLRTQOTKS or METRICS.VOID_NUM,
			lod_bias = var_6_3.QLQPPSRK or METRICS.VOID_NUM,
			auto_priority = var_6_3.NPPRSOTNLR or false,
			vid_height = var_6_3.OMQTQNOSRO or METRICS.VOID_NUM,
			vid_width = var_6_3.NSRPORKNPT or METRICS.VOID_NUM,
			horz_fov = var_6_3.NNMSONQSOP or METRICS.VOID_NUM,
			adapter_vendor_id = Dvar.CFHDGABACF("NRQOKTRTMQ") or METRICS.VOID_NUM,
			adapter_device_id = Dvar.CFHDGABACF("NOOSMRSQLK") or METRICS.VOID_NUM,
			adapter_subsystem_id = Dvar.CFHDGABACF("LTNOTRKOON") or METRICS.VOID_NUM,
			elevated_priority = var_6_3.OMKRNTLOQO or false,
			use_prebuilt_spot_shadow = var_6_3.SNMKKNPTQ or METRICS.VOID_STRING,
			subdiv_limit = var_6_3.MLKRKRSQQM or METRICS.VOID_NUM,
			subdomain_limit = var_6_3.MRMRQNPPOT or METRICS.VOID_NUM,
			allow_hdr = var_6_3.MTONTNKOKR or false,
			smp_compute = var_6_3.NNNSPLTKLL or false,
			adaptive_subdiv_patch_factor = var_6_3.QMSKSNLNK or METRICS.VOID_NUM,
			async_compute = var_6_3.MTPOKSNNRL or false,
			dof_enable = var_6_3.OQSPSSNRT or false,
			black_level = var_6_3.LSNOMRTLRR or METRICS.VOID_NUM,
			preload_shaders_frontend_allow = var_6_3.NRSSTQQSKK or false,
			skinned_cache_size = var_6_3.STLRTMLSP or METRICS.VOID_NUM,
			lightmap_pixels_per_texel = var_6_3.PSTSNKNPR or METRICS.VOID_NUM,
			spot_update_limit_max = var_6_3.SRKPNTSRM or METRICS.VOID_NUM,
			round_robin_priority_spot_shadows_max = var_6_3.OKKTMLKNNR or METRICS.VOID_NUM,
			transient_mp_yield_for_streamer = var_6_3.cl_transient_mp_yield_for_streamer or false,
			transient_mp_yield_priority_timeout = var_6_3.NMRKPSTNQO or METRICS.VOID_NUM,
			out_of_focus_framerate_limit = var_6_3.NMLTRQRNTM or METRICS.VOID_NUM,
			using_nvidia_highlights = var_6_3.MMSMTNRMKL or false,
			blood = var_6_3.OPOTTRRNQ or false,
			blood_limit = var_6_3.NNQMQOLKQL or false,
			marks_ents_player_only = var_6_3.MKQRLOOLKS or false,
			velocity_based_blur_enable = var_6_3.MORLLPSLTT or false,
			sys_mb = var_6_3.MQOSMOKPMT or METRICS.VOID_NUM,
			corpse_limit = var_6_3.OMTOTLTNRP or METRICS.VOID_NUM,
			mouse_uses_raw_input = var_6_3.MMOOTNSSP or false,
			stream_http_download_enabled = var_6_3.OPPPMPTPL or false,
			stream_http_daily_download_limit_mb = var_6_2.TextureDownloadLimitPC or METRICS.VOID_NUM,
			stream_http_cache_size = var_6_3.NOOLPRQMTR or false
		})
	end
end

function METRICS.RecordAudioOptionsDLog(arg_7_0)
	local var_7_0 = OPTIONS.InitOptionsList(nil, arg_7_0)
	local var_7_1 = var_0_0(nil, arg_7_0, var_7_0, CSV.audioOptions)
	local var_7_2 = {}

	if var_7_1 then
		local var_7_3 = var_0_1(arg_7_0, var_7_1, var_7_0)

		LUI.ConcatenateToTable(var_7_1, var_7_3)

		for iter_7_0, iter_7_1 in pairs(var_7_1) do
			local var_7_4 = iter_7_1.dvar or iter_7_1.profileOption

			if var_7_4 then
				local var_7_5 = OPTIONS.GetSetting(var_7_4, arg_7_0, false, true)

				if var_7_5 ~= nil then
					var_7_2[iter_7_1.id] = var_7_5
				end
			end
		end

		Engine.CEJJDJJHIJ(0, "dlog_event_audio_options", {
			audio_mix = var_7_2.MixPreset or METRICS.VOID_NUM,
			master_volume = var_7_2.Volume or METRICS.VOID_NUM,
			music_volume = var_7_2.MusicVolume or METRICS.VOID_NUM,
			dialogue_volume = var_7_2.VoiceVolume or METRICS.VOID_NUM,
			pc_english_vo = var_7_2.EnglishVoiceOvers or false,
			effects_volume = var_7_2.EffectsVolume or METRICS.VOID_NUM,
			juggernault_music = var_7_2.JuggernautDefaultMusic or false,
			hit_marker_sfx = var_7_2.HitMarkerPresets or METRICS.VOID_STRING,
			voice_chat_enabled = var_7_2.UseVoiceCom or false,
			voice_chat_volume = var_7_2.VoiceChatVolume or METRICS.VOID_NUM,
			war_tracks_volume = var_7_2.WarTracksVolume or METRICS.VOID_NUM,
			microphone_volume = var_7_2.MicrophoneVolume or METRICS.VOID_NUM,
			pc_push_to_talk = var_7_2.VoiceChatRecordingMode or false,
			pc_open_mic_threshold = var_7_2.OpenMicRecordingSensitivity or METRICS.VOID_NUM,
			voice_futz = OPTIONS.GetOptionValue(arg_7_0, OPTIONS_DATA.optionsDataList.VoiceFutz) or METRICS.VOID_NUM,
			voice_chat = OPTIONS.GetOptionValue(arg_7_0, OPTIONS_DATA.optionsDataList.VoiceChatMuteAllStrategy) or METRICS.VOID_NUM
		})
	end
end

METRICS.FastLoadoutUsageCount = 0

function METRICS.IncrementFastLoadoutUsageCount()
	METRICS.FastLoadoutUsageCount = METRICS.FastLoadoutUsageCount + 1
end

function METRICS.RecordFastLoadoutUsage(arg_9_0)
	Engine.CEJJDJJHIJ(arg_9_0, "dlog_event_fastloadout_usage", {
		usage_count = METRICS.FastLoadoutUsageCount
	})

	METRICS.FastLoadoutUsageCount = 0
end

function METRICS.RecordOptionsMenuOpeningFlow(arg_10_0, arg_10_1)
	if arg_10_1 == nil then
		arg_10_1 = false
	end

	Engine.CEJJDJJHIJ(arg_10_0, "dlog_event_optionsmenu_opening", {
		has_used_shortcut = arg_10_1,
		triggered_on_gamepad = LUI.IsLastInputGamepad(arg_10_0),
		triggered_in_frontend = Engine.DDJFBBJAIG()
	})
end

function METRICS.RecordCortezMenuOpeningFlow(arg_11_0, arg_11_1)
	Engine.CEJJDJJHIJ(arg_11_0, "cortez_preorder_menu_opening", {
		entry_point_menu = arg_11_1
	})
end

function METRICS.RecordCortezBuyNowClicked(arg_12_0, arg_12_1)
	Engine.CEJJDJJHIJ(arg_12_0, "cortez_preorder_buy_now_clicked", {
		product_id = arg_12_1
	})
end

function METRICS.RecordSocialMenuOpeningFlow(arg_13_0, arg_13_1)
	Engine.CEJJDJJHIJ(arg_13_0, "dlog_event_socialmenu_opening", {
		has_used_shortcut = arg_13_1,
		triggered_on_gamepad = LUI.IsLastInputGamepad(arg_13_0),
		triggered_in_frontend = Engine.DDJFBBJAIG()
	})
end

function METRICS.RecordInGameDismissMenuUsage(arg_14_0, arg_14_1, arg_14_2)
	Engine.CEJJDJJHIJ(arg_14_0, "dlog_event_ingame_dismiss_menu_usage", {
		dismissed_menu_name = arg_14_1,
		has_used_shortcut = arg_14_2,
		triggered_on_gamepad = LUI.IsLastInputGamepad(arg_14_0)
	})
end

function METRICS.MatchEndDLogRecording(arg_15_0)
	local var_15_0 = Engine.BECCFCBIAA("matchEndShouldRecordDLogInt", arg_15_0)

	if var_15_0 and var_15_0 > 0 then
		if BitwiseOperators.band(var_15_0, METRICS.EndMatchDLog.KEYBINDS_GAMEPLAY) > 0 then
			Engine.CEIHBEDEDE(arg_15_0)
		end

		if Engine.CGABICJHAI() and BitwiseOperators.band(var_15_0, METRICS.EndMatchDLog.GRAPHICS) > 0 then
			METRICS.RecordGraphicOptionsDLog(arg_15_0)
		end

		if BitwiseOperators.band(var_15_0, METRICS.EndMatchDLog.GENERAL) > 0 then
			METRICS.RecordGeneralOptionsDLog(arg_15_0)
		end

		if BitwiseOperators.band(var_15_0, METRICS.EndMatchDLog.AUDIO) > 0 then
			METRICS.RecordAudioOptionsDLog(arg_15_0)
		end

		if BitwiseOperators.band(var_15_0, METRICS.EndMatchDLog.ACCOUNT) > 0 then
			METRICS.RecordAccountOptionsDLog(arg_15_0)
		end

		if BitwiseOperators.band(var_15_0, METRICS.EndMatchDLog.CONTROLLER) > 0 then
			METRICS.RecordControllerOptionsDLog(arg_15_0)
		end

		Engine.DFJDIFJEGA("matchEndShouldRecordDLogInt", 0)
	end

	if Engine.ECHCFGDDDF() and METRICS.FastLoadoutUsageCount > 0 then
		METRICS.RecordFastLoadoutUsage(arg_15_0)
	end
end

function METRICS.ContextualMenuDLogRecording(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1 or "none"
	local var_16_1 = METRICS.VOID_STRING
	local var_16_2 = Engine.DBFFAEEFGJ()
	local var_16_3 = var_16_2.flowManager
	local var_16_4 = LUI.UIRoot.GetActiveLayer(var_16_2)

	if var_16_4 then
		var_16_1 = var_16_4.id
	elseif var_16_3 and not var_16_3:IsStackEmpty() then
		local var_16_5 = var_16_3:GetTopMostOpenMenuInfo()

		var_16_1 = not var_16_5.isPopup and var_16_5.name or LUI.FlowManager.GetMenuNameAtIndex(-1)
	end

	Engine.CEJJDJJHIJ(0, "dlog_event_contextual_menu", {
		action_id = METRICS.ContextualActionIndexDLog[var_16_0],
		menu_name = var_16_1
	})
end

function METRICS.CacSessionStartSendDLogEvent(arg_17_0, arg_17_1)
	local var_17_0 = not Engine.DDJFBBJAIG()
	local var_17_1 = Lobby.BBDICGHE() or IsPrivateMatch()

	Engine.CEJJDJJHIJ(arg_17_0, "dlog_event_cac_session_start", {
		cac_session_id = arg_17_1,
		previous_screen_id = LUI.FlowManager.GetMenuNameAtIndex(-1),
		lobby_flag = var_17_1,
		in_match = var_17_0
	})
end

function METRICS.CacSessionEndSendDLogEvent(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = not Engine.DDJFBBJAIG()
	local var_18_1 = Lobby.BBDICGHE() or IsPrivateMatch()
	local var_18_2 = Engine.BAHGDJFBEF(Engine.DCJHCAFIIA(), "-" .. arg_18_2)

	Engine.CEJJDJJHIJ(arg_18_0, "dlog_event_cac_session_end", {
		cac_session_id = arg_18_1,
		previous_screen_id = LUI.FlowManager.GetMenuNameAtIndex(-1),
		time_spent_ms = tonumber(var_18_2) * 1000,
		exit_reason = arg_18_3,
		lobby_flag = var_18_1,
		in_match = var_18_0
	})
end

function METRICS.LoadoutSessionSendDLogEvent(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = Engine.BAHGDJFBEF(Engine.DCJHCAFIIA(), "-" .. arg_19_2)

	Engine.CEJJDJJHIJ(arg_19_0, "dlog_event_cac_edit_loadout", {
		cac_session_id = arg_19_1,
		previous_screen_id = LUI.FlowManager.GetMenuNameAtIndex(-1),
		time_spent_ms = tonumber(var_19_0) * 1000,
		loadout_id = arg_19_3
	})
end

function METRICS.CRMSendDlogEvent(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = {}

	for iter_20_0 = 1, #arg_20_2 do
		local var_20_1 = arg_20_2[iter_20_0]
		local var_20_2 = {
			message_id = var_20_1[CRM.keys.MESSAGE_ID],
			grid_position_num = iter_20_0,
			channel_id = var_20_1[CRM.keys.LOCATION_ID],
			layout_id = var_20_1[CRM.keys.LAYOUT_TYPE],
			total_time_spent_ms = (var_20_1.timeSpent or 0) * 1000,
			more_details_time_spent_ms = (var_20_1.timeSpent or 0) * 1000
		}

		table.insert(var_20_0, var_20_2)
	end

	local var_20_3 = LUI.FlowManager.GetVisibleMenu()
	local var_20_4 = var_20_3 and var_20_3.id or ""
	local var_20_5 = LUI.FlowManager.GetMenuNameAtIndex(-1) or ""
	local var_20_6 = arg_20_2[arg_20_3 + 1][CRM.keys.MESSAGE_ID]
	local var_20_7 = #arg_20_2
	local var_20_8 = ""
	local var_20_9 = GetCurrentLanguage()

	arg_20_4 = arg_20_4 or ""

	Engine.CJIAHJHHDJ(arg_20_1, var_20_0, var_20_4, var_20_5, var_20_6, var_20_7, arg_20_4, var_20_8, var_20_9)
end

function METRICS.LootUsageSendDLogEvent(arg_21_0, arg_21_1)
	if arg_21_1.previousItemIDs ~= arg_21_1.newItemIDs then
		arg_21_1.previousItemIDs = tostring(arg_21_1.previousItemIDs)
		arg_21_1.newItemIDs = tostring(arg_21_1.newItemIDs)

		local var_21_0 = arg_21_0:GetCurrentMenu()

		if var_21_0 and var_21_0.id and var_21_0.id ~= "" then
			local var_21_1 = Engine.BAHGDJFBEF(Engine.DCJHCAFIIA(), "-" .. arg_21_1.startTime)

			Engine.CEJJDJJHIJ(arg_21_1.controllerIndex, "dlog_event_loot_equip", {
				cac_session_id = arg_21_1.startTime,
				previous_screen_id = var_21_0.id,
				time_spent_ms = tonumber(var_21_1) * 1000,
				alt_data = arg_21_1.previousItemIDs,
				new_item_ids = arg_21_1.newItemIDs,
				modified = arg_21_1.gunsmithFlag == true
			})
		end
	end
end

function METRICS.TrialDownloadInitiatedDLogEvent(arg_22_0, arg_22_1)
	local var_22_0 = Engine.DCJHCAFIIA()

	Engine.CEJJDJJHIJ(arg_22_1.controllerIndex, "dlog_event_trial_download_initiated", {
		trial_download_initiate_id = var_22_0,
		download_action = arg_22_1.downloadAction
	})
end

function METRICS.TrialDownloadResultDLogEvent(arg_23_0, arg_23_1)
	local var_23_0 = Engine.DCJHCAFIIA()

	Engine.CEJJDJJHIJ(arg_23_1.controllerIndex, "dlog_event_trial_download_result", {
		trial_download_result_id = var_23_0,
		download_result = arg_23_1.downloadResult
	})
end

function METRICS.TextChatUsageSendDLogEvent(arg_24_0)
	local var_24_0 = LUI.IsLastInputGamepad(arg_24_0)

	Engine.CEJJDJJHIJ(arg_24_0, "dlog_event_textchat_usage", {
		chat_input_gamepad = var_24_0
	})
end

function METRICS.BundleUpsellClickDLogEvent(arg_25_0)
	local var_25_0 = LUI.IsLastInputGamepad(arg_25_0)

	Engine.CEJJDJJHIJ(arg_25_0, "dlog_event_store_upsell_button_clicked", {
		using_gamepad = var_25_0
	})
end

function METRICS.PlaylistFilterSendDLogEvent(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = tostring(arg_26_2) .. " " .. "( " .. Engine.CBBHFCGDIC(arg_26_3) .. ") "
	local var_26_1 = Dvar.CFHDGABACF("NLTOPSKPQM") or -1
	local var_26_2, var_26_3 = PlaylistUtils.GetCurrentFilterDetails(arg_26_1, arg_26_0)

	Engine.CEJJDJJHIJ(arg_26_0, "dlog_event_playlist_filter_selection", {
		selected_filter = arg_26_2,
		previous_match_playlist_id = var_26_1,
		selected_playlist_ids = var_26_2,
		unselected_playlist_ids = var_26_3
	})
end

function METRICS.PlayAgainWSquadSendDLogEvent(arg_27_0, arg_27_1, arg_27_2)
	Engine.CEJJDJJHIJ(arg_27_0, "dlog_event_play_again_usage", {
		private_party_size = tonumber(arg_27_1),
		squad_size = tonumber(arg_27_2)
	})
end

METRICS.LFP_DATASOURCE_PATH = "alwaysLoaded.lfpPartyInstrumentation"
METRICS.LFPVariables = {
	FRONT_END_START_TIME = "frontEndStartTime",
	PARTY_END_REASON = "partyEndReason",
	PREVIOUS_PARTY_ID = "previousPartyId",
	TOTAL_GAME_TIME = "totalGameTime",
	TOTAL_FRONT_END_TIME = "totalFrontEndTime",
	STARTING_PLAYERS_IN_PARTY = "startingPlayersInParty",
	MATCH_IDS = "matchIds",
	LFP_SESSION_ID = "lfpSessionID",
	IS_IN_PARIVATE_PARTY = "isInPrivateParty",
	PARTY_CREATED = "partyCreated",
	SEARCH_START_TIME = "searchStartTime",
	TOTAL_MATCHES_PLAYED = "totalMatchesPlayed",
	PARTY_START_TIME = "partyStartTime",
	SEARCH_STARTED = "searchStarted",
	GAME_START_TIME = "gameStartTime"
}

function METRICS.LFPPlayerSessionDLogEvent(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5, arg_28_6)
	local var_28_0 = {
		in_private_party_flag = arg_28_1,
		previous_party_id = arg_28_2,
		lfp_filter_preferences = arg_28_3,
		search_result = arg_28_4,
		search_time = arg_28_5,
		lfp_player_session_id = arg_28_6
	}

	Engine.CEJJDJJHIJ(arg_28_0, "dlog_event_player_lfp_session", var_28_0)
end

function METRICS.LFPPartySessionDLogEvent(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5, arg_29_6, arg_29_7, arg_29_8)
	local var_29_0 = {
		party_start_timestamp = arg_29_1,
		party_end_timestamp = arg_29_2,
		party_end_reason = arg_29_3,
		total_matches = arg_29_4,
		total_time_spent_in_match = arg_29_5,
		total_time_spent_in_front_end = arg_29_6,
		matches = arg_29_7,
		lfp_session_id = arg_29_8
	}

	Engine.CEJJDJJHIJ(arg_29_0, "dlog_event_party_lfp_session", var_29_0)
end
