CoD = CoD or {}

local var_0_0 = false
local var_0_1 = false

Memory = {
	InGame = {
		lowFreeBytes = 307200
	},
	Frontend = {
		lowFreeBytes = 1048576
	}
}
GameScriptConstants = {
	EntityNumNone = Engine.ECFHCCHDGF()
}
GrenadeReticleType = {
	primable = 1,
	generic = 0,
	cookable = 2,
	none = 3
}
VideoPlaybackFlags = {
	LOOP = 2,
	INTRO_THEN_LOOP = 64,
	MUTE = 4096,
	UNUSED = 1,
	PRELOADED = 32
}
KillstreakConnectionState = {
	INACTIVE = 0,
	CONNECTED = 3,
	DISCONNECTING = 4,
	CONNECTING = 2,
	READY = 1
}
HintRange = {
	SHORT_RANGE = 1,
	LONG_RANGE = 2,
	USE_RANGE = 0
}
ServerGameIndex = {
	SORT_GAME = 3,
	SORT_LOBBY = 5,
	SORT_CLIENTS = 2,
	SORT_HOST = 0,
	SORT_PING = 4,
	SORT_MAP = 1
}
PauseReason = {
	SP_INIT = BitwiseOperators.lshift(1, 3),
	KEY_INPUT = BitwiseOperators.lshift(1, 5),
	ZOMBIE_TUTORIAL = BitwiseOperators.lshift(1, 8),
	SAVE_DATA_ERROR = BitwiseOperators.lshift(1, 9)
}
AssetRegion = {
	SaudiArabia = 2,
	Unknown = -1,
	China = 4,
	Korea15Plus = 3,
	Worldwide = 0,
	Japan = 1,
	End = 5
}

function Memory.CheckLow()
	local var_1_0 = Engine.CFCAICIAJC()
	local var_1_1 = Memory.InGame.lowFreeBytes

	if Engine.DDJFBBJAIG() then
		var_1_1 = Memory.Frontend.lowFreeBytes
	end

	if var_1_0 < var_1_1 then
		DebugPrint("LUI: Low on memory, running GC now.  BytesFree = " .. Engine.CFCAICIAJC())
		collectgarbage("collect")
	end
end

MaxLocalClients = 2
CoD.ENTITYNUM_NONE = 2047
CoD.SP_MAP_PACK_1_INDEX = 1
CoD.MP_MAP_PACK_1_INDEX = 2
CoD.CP_MAP_PACK_1_INDEX = 3
CoD.SP_MAP_PACK_2_INDEX = 4
CoD.CP_MAP_PACK_2_INDEX = 5
CoD.CP_MAP_PACK_3_INDEX = 6
CoD.MP_MAP_PACK_2_INDEX = 7
CoD.MP_MAP_PACK_3_INDEX = 8
CoD.MP_MAP_PACK_4_INDEX = 9
CoD.SP_PACKS = {
	{
		index = CoD.SP_MAP_PACK_1_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_SP1")
	},
	{
		index = CoD.SP_MAP_PACK_2_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_SP2")
	},
	{
		index = CoD.MP_MAP_PACK_3_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP3")
	}
}
CoD.MP_PACKS = {
	{
		index = CoD.MP_MAP_PACK_1_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP1")
	},
	{
		index = CoD.MP_MAP_PACK_2_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP2")
	},
	{
		index = CoD.MP_MAP_PACK_3_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP3")
	},
	{
		index = CoD.MP_MAP_PACK_4_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP4")
	}
}
CoD.CP_PACKS = {
	{
		index = CoD.CP_MAP_PACK_1_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP1")
	},
	{
		index = CoD.CP_MAP_PACK_2_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP2")
	},
	{
		index = CoD.MP_MAP_PACK_3_INDEX,
		missingMessage = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP3")
	}
}
AmmoWarningState = {
	RELOAD_DISABLED = 3,
	LOW_AMMO = 1,
	NO_AMMO = 0,
	OK = 4,
	RELOAD = 2
}
PartyType = {
	PRIVATE_PARTY_ID = 1,
	GAME_LOBBY_ID = 0,
	ANY_PARTY_ID = 2
}
OnlineChatType = {
	CLAN_CHAT = 6,
	TEAM_CHAT = 5,
	PRIVATE_CHAT = 7,
	SYSTEM_EVENT = 0,
	PLAYER_EVENT = 2,
	GAME_CHAT = 4,
	COUNT = 8,
	SYSTEM_ERROR = 1,
	PARTY_CHAT = 3
}
MuteStrategy = {
	MuteStrategySize = 4,
	MuteStrategyMuteAll = 1,
	MuteStrategyMuteAllButFriends = 3,
	MuteStrategyMuteAllButParty = 2,
	MuteStrategyUnmute = 0
}
BattleNetOnlineStatus = {
	ONLINE = 2,
	APPEAR_OFFLINE = 4,
	INVALID = 0,
	BUSY = 3,
	AWAY = 1
}
BattleNetAuthState = {
	ERROR = 3,
	SIGNED_IN = 2,
	IDLE = 0,
	SIGNING_IN = 1
}
ClanFailureReason = {
	MAX_CLAN_OWNERSHIPS = 7,
	NAME_TOO_SHORT = 2,
	USER_BANNED = 14,
	CLAN_FULL = 12,
	PERMISSION_DENIED = 11,
	TAG_VULGAR = 6,
	CLAN_DOESNT_EXIST = 10,
	GENERIC_CLAN_ERROR = 0,
	TAG_TOO_SHORT = 5,
	NAME_TAKEN = 1,
	NO_EXISTING_INVITE = 9,
	MAX_CLANS_MEMBERSHIPS = 8,
	NAME_VULGAR = 3,
	TAG_TAKEN = 4,
	MAX_INVITES_REACHED = 13
}
OnlineClanRole = {
	OWNER = 3,
	MEMBER = 1,
	OFFICER = 2
}
nVidiaHighlights = {
	BR_DOUBLE = 17,
	MEGA_KILL = 2,
	FURY_KILL = 9,
	STICK = 13,
	MERCILESS = 4,
	JUGGERNAUT = 6,
	MULTIPLAYER_HIGHLIGHTS = 16,
	ULTRA_KILL = 3,
	BR_DOWN = 24,
	BR_REVENGE = 20,
	BR_LONGSHOT = 19,
	BR_ELIM = 25,
	BR_THROWINGKNIFE_KILL = 22,
	BONK = 8,
	KILL_CHAIN = 11,
	BR_TRIPLE = 18,
	BR_WIN = 23,
	BR_BACKSTAB = 21,
	BR_DEATH = 26,
	FRENZY_KILL = 1,
	REGICIDE = 14,
	COLLATERAL = 7,
	POPCORN = 12,
	RELENTLESS = 5,
	NUKE = 15,
	SUPER_KILL = 10,
	NONE = 0
}
PresenceFieldType = {
	ACCOUNT_CUSTOM_MESSAGE = 1,
	ACCOUNT_DND = 7,
	ACCOUNT_FULL_NAME = 0,
	ACCOUNT_APPEAR_OFFLINE = 8,
	CLIENT_RICH_PRESENCE = 14,
	UNKNOWN_PRESENCE = -1,
	CLIENT_ONLINE = 15,
	CLIENT_IN_GAME = 16,
	CLIENT_PROGRAM_ID = 17,
	ACCOUNT_LAST_ONLINE = 4,
	ACCOUNT_AWAY = 5,
	ONLINE_STATUS = -2,
	ACCOUNT_AWAY_TIME = 6,
	ACCOUNT_BATTLETAG = 3
}
ContentProgressState = {
	INSTALLED = 3,
	HAS_PROGRESS = 2,
	SUSPENDED = 1,
	NOT_INSTALLED = 0
}
InGameStoreCatalogStatus = {
	COUNT = 3,
	READY = 2,
	FETCHING = 1,
	ERROR = 0
}
InGameStoreProductStatus = {
	SUSPENDED = 3,
	COUNT = 5,
	DOWNLOADING = 2,
	NOT_INSTALLED = 1,
	INSTALLED = 4,
	NOT_OWNED = 0
}
InGameStoreProductSkuType = {
	DEMONWARE = 2,
	FIRST_PARTY = 1,
	COUNT = 3,
	NONE = 0
}
InGameStorePurchaseType = {
	BROWSE = 1,
	COUNT = 2,
	CHECKOUT = 0
}
InGameStoreStoreIconPosition = {
	RIGHT = 2,
	CENTER = 0,
	LEFT = 1
}
RadialMenuSelectionStyle = {
	PLAIN = 0,
	GLOW = 1
}
StoreItemLayout = {
	BILLBOARD_LIST = 3,
	TALL = 2,
	SQUARES = 1,
	OPERATOR = 5,
	COMPACT = 0,
	CUSTOM = 6,
	CUSTOMXL = 7,
	BILLBOARD_GRID = 4
}
font_normalFont = FONTS.MainRegular.File
font_hudIW6SmallFont = FONTS.MainBold.File
font_hudEuroNormalFont = FONTS.MainRegular.File
font_bodyFont = FONTS.BodyRegular.File
CoD.variableScopeMaxFOVs = 3
CoD.TextSettings = {
	ButtonHelperFont = {
		Height = IsLanguageArabic() and 26 or 22,
		Font = RegisterFont(font_bodyFont, 22)
	},
	ChatInputFont = {
		Height = 20,
		Font = RegisterFont(FONTS.BattleNetRegular.File, 20)
	},
	SmallFont = {
		Height = 21,
		Font = RegisterFont(font_normalFont, 21)
	},
	HudIW6SmallFont = {
		Height = 20,
		Font = RegisterFont(font_hudIW6SmallFont, 20)
	},
	HudEuroMedSmallFont = {
		Height = 20,
		Font = RegisterFont(font_hudEuroNormalFont, 20)
	},
	HudMainNormalFont = {
		Height = 26,
		Font = RegisterFont(font_normalFont, 26)
	}
}
CoD.TextStyle = {
	ShadowedMore = 6,
	Shadowed = 3,
	Outlined = 7,
	None = 0
}
CoD.PlayMode = {
	Aliens = 3,
	Count = 4,
	SP = 1,
	Core = 2,
	None = 0
}
CoD.Ownerdraw = {
	CGHoldBreathHint = 71,
	CGInvalidCmdHint = 113,
	CGToggleHybridHint = 77,
	CGToggleThermalHint = 76,
	CGMountHint = 81,
	CGVehicleReticle = 200,
	CGHudTargetsVehicle = 201,
	UIRecordLevel = 365,
	CGChangeZoomHint = 70,
	UILoadProfiling = 364,
	CGMissionObjectiveHeader = 99,
	CGMissionObjectiveList = 100
}
MouseCursorType = {
	CURSOR_TYPE_ROTATION_NORMAL = 5,
	CURSOR_TYPE_ROTATION_ACTIVE = 6,
	CURSOR_TYPE_ARROW_CONTEXTUAL = 4,
	CURSOR_TYPE_ARROW_INACTIVE = 3,
	CURSOR_TYPE_IBEAM = 9,
	CURSOR_TYPE_WIN_HAND = 11,
	CURSOR_TYPE_ARROW_UNAVAILABLE = 2,
	CURSOR_TYPE_ROTATION_UNAVAILABLE = 7,
	CURSOR_TYPE_WIN_IBEAM = 12,
	CURSOR_TYPE_WIN_ARROW = 10,
	CURSOR_TYPE_ARROW_PANFOURWAYS = 8,
	CURSOR_TYPE_ARROW_NORMAL = 0,
	CURSOR_TYPE_ARROW_ACTIVE = 1
}
CoD.OwnerdrawAlignment = {
	TextTopCenter = 5
}

if Engine.DDJFBBJAIG() then
	CoD.Music = {
		MainCPMusic = "music_mainmenu_mp",
		MainSPMusic = "music_mainmenu",
		MainMPMusic = "music_mainmenu_mp"
	}
end

CoD.SFX = {
	ChangeScreen = "ui_screen_change",
	DenyAdjustSafeArea = "ui_screen_edge_deny",
	CacSelectStrikePackage = "ui_mp_package_select",
	MouseClick = "ui_select_confirm",
	FocusGamepad = "ui_hilite",
	AdjustSafeArea = "ui_screen_adjust",
	CacSpendPoints = "ui_points_spent",
	CacSetAILoadout = "ui_mp_ability_select",
	MissionTeamMouseOver = "ui_iw7_mission_team_hilite",
	CacDeselectStrikePackage = "ui_mp_package_deselect",
	XPTick = "mp_experience_tick",
	LobbyTextCoalition = "ui_lobby_text_coalition",
	MPLobbyPlayerExit = "ui_mp_player_leave_lobby",
	AdjustSlider = "ui_slide_adjust",
	LobbyTextAllegiance = "ui_lobby_text_allegiance",
	CharacterSlide = "ui_character_slide",
	MPLobbyPlayerJoin = "ui_mp_player_join_lobby",
	RestrictClass = "ui_select_confirm",
	SPMinimap = "ui_sp_minimap",
	DenySelect = "ui_select_deny",
	CacSelectAbility = "ui_mp_ability_select",
	OtherAdjust = "ui_other_adjust",
	CacDeselectAbility = "ui_mp_ability_deselect",
	MouseOver = "ui_mouse_over_hilite",
	SelectBack = "ui_select_back",
	SubMenuMouseOver = "ui_hilite_submenu"
}
CoD.KeyboardInputTypes = {
	Number = 3,
	Password = 2,
	NumberEmpty = 4,
	Email = 1,
	Normal = 0
}
CoD.KeyboardResult = {
	UI_KEYBOARD_RESULT_ERROR = 4,
	UI_KEYBOARD_RESULT_CANCELLED = 3,
	UI_KEYBOARD_RESULT_INVALID_STRING = 2,
	UI_KEYBOARD_RESULT_PROFANITY = 1,
	UI_KEYBOARD_RESULT_OK = 0
}

if Engine.DDJFBBJAIG() then
	CoD.AntiCheat = {
		Ban = {
			FEATURE_BAN_GLOBAL_CLAN_TAG = 16,
			FEATURE_BAN_MP_PRESTIGE = 4,
			FEATURE_BAN_UGC_PAINTJOBS = 10,
			FEATURE_BAN_CP_LIVE = 6,
			FEATURE_BAN_MP_CUSTOM = 2,
			FEATURE_BAN_GLOBAL_LIVESTREAMING = 18,
			FEATURE_BAN_MP_LEADERBOARDS = 3,
			FEATURE_BAN_GLOBAL_ALLOCATE_DEDI = 14,
			FEATURE_BAN_UGC_EMBLEMS = 9,
			FEATURE_BAN_GLOBAL_VOICE_CHAT = 17,
			FEATURE_BAN_GLOBAL_FIND_DEDI = 13,
			FEATURE_BAN_MP_PRESTIGE_EXTRAS = 5,
			FEATURE_BAN_UGC_HELMETS = 11,
			FEATURE_BAN_GLOBAL_HOSTING = 12,
			FEATURE_BAN_GLOBAL_SPLITSCREEN = 15,
			FEATURE_BAN_CP_LEADERBOARDS = 8,
			FEATURE_BAN_CP_CUSTOM = 7,
			FEATURE_BAN_MP_LIVE = 1
		}
	}
end

CoD.RequiredDLCError = {
	COMPATIBILITY_ERROR_NONE = 0,
	COMPATIBILITY_ERROR_CANCELED = 3,
	COMPATIBILITY_ERROR_UNKNOWN = 4,
	COMPATIBILITY_ERROR_DISK_FULL = 1,
	COMPATIBILITY_ERROR_CORRUPTED = 2
}
CoD.CompassType = {
	TacMap = 2,
	Full = 1,
	Partial = 0
}
CoD.MinimapStyle = {
	Circle = 0,
	Square = 1
}
ButtonMap = {
	button_primary = {
		raw_button = "primary",
		string = "LUA_MENU/PAD_PRIMARY_BUTTON",
		ui_button = "ui_primary"
	},
	button_secondary = {
		raw_button = "secondary",
		string = "LUA_MENU/PAD_SECONDARY_BUTTON",
		ui_button = "ui_secondary"
	},
	button_alt1 = {
		raw_button = "alt1",
		string = "LUA_MENU/PAD_ALT1_BUTTON",
		ui_button = "ui_alt1"
	},
	button_alt2 = {
		raw_button = "alt2",
		string = "LUA_MENU/PAD_ALT2_BUTTON",
		ui_button = "ui_alt2"
	},
	button_right_trigger = {
		raw_button = "right_trigger",
		string = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		ui_button = "ui_trigger_right"
	},
	button_left_trigger = {
		raw_button = "left_trigger",
		string = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		ui_button = "ui_trigger_left"
	},
	button_shoulderr = {
		raw_button = "shoulderr",
		string = "LUA_MENU/PAD_RIGHT_SHOULDER_BUTTON",
		ui_button = "ui_shoulder_right"
	},
	button_shoulderl = {
		raw_button = "shoulderl",
		string = "LUA_MENU/PAD_LEFT_SHOULDER_BUTTON",
		ui_button = "ui_shoulder_left"
	},
	button_select = {
		raw_button = "select",
		string = "LUA_MENU/PAD_BACK_BUTTON",
		ui_button = "ui_select"
	},
	button_start = {
		raw_button = "start",
		string = "LUA_MENU/PAD_START_BUTTON",
		ui_button = "ui_start"
	},
	button_dpad_up = {
		raw_button = "dpad_up",
		string = "LUA_MENU/PAD_DPAD_UP_BUTTON",
		ui_button = "ui_dpad_up"
	},
	button_dpad_down = {
		raw_button = "dpad_down",
		string = "LUA_MENU/PAD_DPAD_DOWN_BUTTON",
		ui_button = "ui_dpad_down"
	},
	button_dpad_left = {
		raw_button = "dpad_left",
		string = "LUA_MENU/PAD_DPAD_LEFT_BUTTON",
		ui_button = "ui_dpad_left"
	},
	button_dpad_right = {
		raw_button = "dpad_right",
		string = "LUA_MENU/PAD_DPAD_RIGHT_BUTTON",
		ui_button = "ui_dpad_right"
	},
	button_l3 = {
		raw_button = "left_stick",
		string = "LUA_MENU/PAD_L3_BUTTON",
		ui_button = "ui_l3"
	},
	button_r3 = {
		raw_button = "right_stick",
		string = "LUA_MENU/PAD_R3_BUTTON",
		ui_button = "ui_r3"
	},
	button_quick_options = {
		string = "LUA_MENU/QUICK_OPTIONS",
		raw_button = "quick_options"
	},
	button_quick_social = {
		string = "LUA_MENU/QUICK_SOCIAL",
		raw_button = "quick_social"
	},
	button_dismiss_pause_menu = {
		string = "LUA_MENU/DISMISS_PAUSE_MENU",
		raw_button = "menu_dismiss_pause"
	},
	button_keybind_reset = {
		string = "LUA_MENU/KEYBIND_RESET",
		raw_button = "menu_action2"
	},
	button_keybind_unbind = {
		string = "LUA_MENU/KEYBIND_UNBIND",
		raw_button = "menu_unbind"
	},
	button_page_up = {
		string = "INPUT/KB_PAGE_UP_BUTTON",
		raw_button = "page_up"
	},
	button_page_down = {
		string = "INPUT/KB_PAGE_DOWN_BUTTON",
		raw_button = "page_down"
	},
	button_home = {
		string = "INPUT/KB_HOME_BUTTON",
		raw_button = "home"
	},
	button_ins = {
		string = "INPUT/KB_INS_BUTTON",
		raw_button = "ins"
	},
	button_del = {
		string = "INPUT/KB_DEL_BUTTON",
		raw_button = "del"
	},
	button_stickr_updown = {
		raw_button = "stickr",
		string = "PLATFORM/RIGHT_STICK",
		ui_button = "ui_right_stick"
	},
	button_stickl_updown = {
		raw_button = "stickl",
		string = "PLATFORM/LEFT_STICK",
		ui_button = "ui_left_stick"
	},
	button_stickr_updown_noswap = {
		raw_button = "stickr",
		string = "PLATFORM/RIGHT_STICK_NOSWAP",
		ui_button = "ui_right_stick"
	},
	button_stickl_updown_noswap = {
		raw_button = "stickl",
		string = "PLATFORM/LEFT_STICK_NOSWAP",
		ui_button = "ui_left_stick"
	},
	button_left_stick = {
		raw_button = "left_stick",
		string = "LUA_MENU/PAD_L3_BUTTON",
		ui_button = "ui_left_stick_up"
	},
	button_right_stick = {
		raw_button = "right_stick",
		string = "LUA_MENU/PAD_R3_BUTTON",
		ui_button = "ui_right_stick_up"
	},
	button_menu_back = {
		string = "LUA_MENU/BUTTON_MENU_BACK",
		raw_button = "menu_back"
	}
}
ButtonQualifiers = {
	Mousewheel = "mousewheel",
	Keyboard = "keyboard",
	DPad = "dpad",
	Gamepad = "gamepad"
}
MPConfig = {
	default_dvars = "exec dvar_defaults.cfg",
	default_splitscreen = "exec default_splitscreen_mp.cfg",
	default_online_cdl = "exec default_online_mp_cdl.cfg",
	default_online = "exec default_online_mp.cfg",
	default_systemlink_cdl = "exec default_systemlink_mp_cdl.cfg",
	default_systemlink = "exec default_systemlink_mp.cfg"
}

function CoD.GetMPOnlineCfg()
	if Dvar.IBEGCHEFE("LRQNOKNRRN") then
		return MPConfig.default_online_cdl
	else
		return MPConfig.default_online
	end
end

function CoD.GetMPSystemLinkCfg()
	if Dvar.IBEGCHEFE("LRQNOKNRRN") then
		return MPConfig.default_systemlink_cdl
	else
		return MPConfig.default_systemlink
	end
end

CPConfig = {
	default_dvars = "exec dvar_defaults.cfg",
	default_systemlink = "exec default_systemlink_cp.cfg",
	default_aliens = "exec default_aliens.cfg",
	default_splitscreen = "exec default_splitscreen_cp.cfg"
}
FocusType = {
	ListSelection = 2,
	MenuFlow = 0,
	Gamepad = 3,
	MouseOver = 1
}
DvarTypeTable = {
	DvarString = 9,
	DvarBool = 0,
	DvarFloat = 1,
	DvarInt = 5,
	DvarEnum = 8
}
SliderBounds = {
	DefaultSliderBounds = {
		PCStep = 0.01,
		Min = 0,
		Step = 0.01,
		DecimalsToRound = 2,
		Max = 1
	},
	ADSSensitivityMultiplier = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.01,
		Max = 2
	},
	ControllerMinDeadzone = {
		Step = 0.01,
		Min = 0,
		Max = 0.4
	},
	Brightness = {
		PCStep = 1,
		Min = 0,
		Step = 1,
		DvarMin = -0.5,
		DecimalsToRound = 2,
		DvarMax = 0.5,
		Max = 100
	},
	HDRMinLum = {
		PCStep = 0.02,
		Min = 0,
		Step = 0.01,
		DecimalsToRound = 2,
		Max = 0.15
	},
	HDRMaxLum = {
		PCStep = 0.02,
		Min = 0.6,
		Step = 0.015,
		DecimalsToRound = 2,
		Max = 1
	},
	HDRGamma = {
		PCStep = 0.0075,
		Min = 0.875,
		Step = 0.0125,
		DecimalsToRound = 3,
		Max = 1.125
	},
	HorzMargin = {
		Step = 0.00375,
		Min = 0.9,
		Max = 1
	},
	MouseFilter = {
		DecimalsToRound = 2,
		Min = 0,
		Step = 1,
		Max = 100
	},
	mouseMonitorDistanceCoef = {
		DividedRangeStep = 0.02,
		Min = 0,
		Step = 0.02,
		DividedRangeValue = 20,
		DecimalsToRound = 2,
		DividedRangeFraction = 0.3,
		Max = 5
	},
	MouseSensitivity = {
		DividedRangeStep = 0.05,
		Min = 0.01,
		Step = 0.05,
		DividedRangeValue = 20,
		DecimalsToRound = 2,
		DividedRangeFraction = 0.3,
		Max = 100
	},
	MouseSensitivityMultiplier = {
		DecimalsToRound = 2,
		Min = 0.01,
		Step = 0.01,
		Max = 2
	},
	mouseSmoothing = {
		DecimalsToRound = 2,
		Min = 0,
		Step = 1,
		Max = 10
	},
	StickSensitivity = {
		DecimalsToRound = 0,
		Min = 1,
		Step = 1,
		Max = 20
	},
	VertMargin = {
		Step = 0.00375,
		Min = 0.9,
		Max = 1
	},
	Volume = {
		PCStep = 1,
		Min = 0,
		Step = 1,
		Max = 100
	},
	VoiceChatVolume = {
		PCStep = 2,
		Min = 0,
		Step = 2,
		Max = 400
	},
	VoiceThreshold = {
		PCStep = 1,
		Min = 0,
		Step = 1,
		Max = 100
	},
	FOVUserScale = {
		Step = 0.00625,
		Min = 0.8,
		Max = 1.5
	},
	HorizontalFOV = {
		Step = 1,
		Min = 60,
		Max = 120
	},
	FilmGrainAttenSlider = {
		Step = 0.05,
		Min = 0,
		Max = 1
	},
	SMAAFilmicStrength = {
		Step = 0.05,
		Min = 0,
		Max = 1
	},
	Resolution = {
		DecimalsToRound = 0,
		Min = 50,
		Step = 1,
		Max = 200
	},
	MouseAcceleration = {
		DecimalsToRound = 2,
		Min = 0,
		Step = 0.05,
		Max = 100
	},
	adsHighZoomMouseSensitivityMultiplier = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.01,
		Max = 2
	},
	adsLowZoomMouseSensitivityMultiplier = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.01,
		Max = 2
	},
	LocationSelectorCursorMouseSpeedMultiplier = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.01,
		Max = 2
	},
	CustomFramerateLimit = {
		Step = 10,
		Min = 30,
		Max = 300
	},
	MenuCustomFramerateLimit = {
		Step = 10,
		Min = 30,
		Max = 300
	},
	OutOfFocusCustomFraterateLimit = {
		Step = 10,
		Min = 5,
		Max = 300
	},
	FlyingVehicleMouseSensitivity = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.01,
		Max = 2
	},
	GroundVehicleMouseSensitivity = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.01,
		Max = 2
	},
	CinematicsVolume = {
		PCStep = 1,
		Min = 0,
		Step = 1,
		Max = 100
	},
	WeaponMountingExitDelay = {
		DecimalsToRound = 2,
		Min = 0,
		Step = 10,
		Max = 500
	},
	WeaponSwitchCancelDelaySliderData = {
		PCStep = 10,
		Min = 0,
		Step = 10,
		Max = 500
	},
	DefaultSensitivityMultiplier = {
		DecimalsToRound = 2,
		Min = 0,
		Step = 0.01,
		Max = 2
	},
	MenuCursorSensitivityMultiplier = {
		DecimalsToRound = 2,
		Min = 0.5,
		Step = 0.1,
		Max = 5
	},
	HudBoundsH = {
		Step = 1,
		Min = 0,
		Max = 100
	},
	HudBoundsV = {
		Step = 1,
		Min = 0,
		Max = 100
	},
	TickerSpace = {
		DecimalsToRound = 0,
		Min = 0,
		Step = 1,
		Max = 300
	},
	CamSmoothing = {
		DecimalsToRound = 0,
		Min = 0,
		Step = 1,
		Max = 30
	},
	CamSpeed = {
		DecimalsToRound = 0,
		Min = 10,
		Step = 1,
		Max = 200
	},
	FreeCamSlowFactor = {
		DecimalsToRound = 2,
		Min = 0.1,
		Step = 0.05,
		Max = 0.9
	},
	FreeCamFastFactor = {
		DecimalsToRound = 2,
		Min = 1.1,
		Step = 0.05,
		Max = 1.9
	}
}
MousePitchTable = {
	PitchFloat = 0.022
}
ScreenCenterFadeRadius = {
	ON = 100,
	OFF = 0
}
ObjectiveState = {
	EMPTY = 0,
	INVISIBLE = 2,
	FAILED = 5,
	CURRENT = 4,
	DONE = 3,
	ACTIVE = 1
}
SocialFriendsPlatform = {
	wegame = 2,
	battlenet = 1,
	crossplay = 0
}
PresencePlatform = {
	XBOX_ONE = 1,
	PS4 = 2,
	WEGAME = 5,
	STEAM = 4,
	BNET = 3,
	NONE = 0
}
ClientPlatform = {
	XBOX_ONE = 3,
	PS4 = 4,
	WEGAME = 5,
	STEAM = 1,
	BNET = 2,
	NONE = 0
}
ClientPlatformToPresencePlatform = {
	[ClientPlatform.NONE] = PresencePlatform.NONE,
	[ClientPlatform.STEAM] = PresencePlatform.STEAM,
	[ClientPlatform.BNET] = PresencePlatform.BNET,
	[ClientPlatform.XBOX_ONE] = PresencePlatform.XBOX_ONE,
	[ClientPlatform.PS4] = PresencePlatform.PS4,
	[ClientPlatform.WEGAME] = PresencePlatform.WEGAME
}
ClanTagType = {
	CUSTOM = 0,
	OFFICIAL = 2,
	DEFAULT = 1,
	RED = 3
}

function CoD.GetPlatformPresence()
	if CONDITIONS.IsWeGame() then
		return ClientPlatform.WEGAME
	elseif CONDITIONS.IsPS4() then
		return ClientPlatform.PS4
	elseif CONDITIONS.IsXboxOne() then
		return ClientPlatform.XBOX_ONE
	else
		return ClientPlatform.BNET
	end
end

function CoD.GetActiveSocialFriendsPlatform()
	if Engine.HDGDBCJFG() then
		return SocialFriendsPlatform.crossplay
	elseif Engine.ECAJCAJJGF() then
		return SocialFriendsPlatform.wegame
	else
		return SocialFriendsPlatform.battlenet
	end
end

function CoD.GetIconForButton(arg_6_0)
	if ButtonMap[arg_6_0].ui_button then
		local var_6_0 = StringTable.DIFCHIGDFB(CSV.fontIcons.file, CSV.fontIcons.cols.ref, ButtonMap[arg_6_0].ui_button, CSV.fontIcons.cols.unicodeCodePoint)

		return string.char(var_6_0)
	else
		return Engine.CBBHFCGDIC(ButtonMap[arg_6_0].string)
	end
end

function CoD.GetTextForButton(arg_7_0)
	if ButtonMap[arg_7_0].ui_button then
		local var_7_0 = StringTable.DIFCHIGDFB(CSV.fontIcons.file, CSV.fontIcons.cols.ref, ButtonMap[arg_7_0].ui_button, CSV.fontIcons.cols.keyName)

		return Engine.CBBHFCGDIC(var_7_0)
	else
		return Engine.CBBHFCGDIC(ButtonMap[arg_7_0].string)
	end
end

function CoD.GetButtonForCurrentInput(arg_8_0, arg_8_1)
	if LUI.IsLastInputGamepad(arg_8_0) then
		return CoD.GetIconForButton(arg_8_1)
	else
		return CoD.GetTextForButton(arg_8_1)
	end
end

CoD.currentGameMode = nil

function CoD.UpdateGameMode(arg_9_0, arg_9_1)
	CSV.UpdateCSVsByGameMode(arg_9_0)

	if Engine.DDJFBBJAIG() then
		UpdateDataSourcesByMode(arg_9_0, arg_9_1)
		CLIENT_MODEL.UpdateModifiablesByMode()
	end

	Cac.NumAttachments = Engine.CAADCDEEIA() and 3 or 6
	CoD.currentGameMode = arg_9_0
end

function CoD.GetCurrentGameMode()
	return CoD.currentGameMode
end

function CoD.GetWorldBlur()
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetBlurStrength(5)
	var_11_0:setupWorldBlur()

	var_11_0.id = "blur"

	return var_11_0
end

function CoD.PrintModuleLoad(arg_12_0)
	return
end

CoD.ProgressionBlob = {
	Gold = 0
}
CoD.FenceChannel = {
	Default = 0
}
CoD.FenceErrorCodes = {
	Installation = 1,
	Ownership_CP_2 = 6,
	Ownership_CP = 4,
	Ownership_MP = 3,
	Ownership = 0,
	Ownership_SP = 2,
	Ownership_MP3_DLC = 8,
	Installation_PS4 = 7,
	Ownership_CP_1 = 5
}
CoD.PresenceContext = {
	NOT_PLAYING = 5,
	PLAYING_MP = 1,
	PLAYING_SP = 2,
	WATCHING_THEATRE = 9,
	WATCHING_CREDITS = 10,
	LOBBY = 3,
	NOT_IN_GAME = 0,
	PARTY = 4
}
CoD.PartyPrivacySetting = {
	INVITE_ONLY = 2,
	CLOSED = 3,
	JOINABLE_BY_FRIENDS = 1,
	PUBLIC = 0
}
profile = {}

function profile.beginuserevent()
	return
end

function profile.enduserevent()
	return
end

function profile.createuserevent()
	return
end

function profile.lookupusereventid()
	return
end

if var_0_1 then
	function run_gc(arg_17_0)
		local var_17_0 = arg_17_0 and " (" .. arg_17_0 .. ")" or ""
		local var_17_1 = collectgarbage("count")

		collectgarbage("collect")

		local var_17_2 = collectgarbage("count")
		local var_17_3 = var_17_1 - var_17_2

		DebugPrint("LUI - Ran GC cycle, cleared " .. var_17_3 .. "kb. " .. var_17_2 .. "kb remaining." .. var_17_0)
	end
else
	function run_gc()
		collectgarbage("collect")
	end
end

function hashset(arg_19_0)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_0) do
		var_19_0[iter_19_1] = true
	end

	return var_19_0
end

function IsCurrentSticksLayoutSouthpaw()
	return Engine.BECCFCBIAA("gpadSticksConfig") == "thumbstick_southpaw"
end

function IsCurrentSticksLayoutLegacy()
	return Engine.BECCFCBIAA("gpadSticksConfig") == "thumbstick_legacy"
end

function IsCurrentSticksLayoutLegacySouthpaw()
	return Engine.BECCFCBIAA("gpadSticksConfig") == "thumbstick_legacysouthpaw"
end

function CoD.FormatInfectedTime(arg_23_0, arg_23_1)
	local var_23_0 = Engine.CBBHFCGDIC("@LUA_MENU/S_FOR_SECONDS")
	local var_23_1 = Engine.CBBHFCGDIC("@LUA_MENU/M_FOR_MINUTES")
	local var_23_2 = math.floor(arg_23_0 / 60)
	local var_23_3 = ""

	if not arg_23_1 then
		if var_23_2 < 1 then
			var_23_3 = arg_23_0 .. var_23_0
		else
			var_23_3 = var_23_2 .. var_23_1

			if var_23_2 >= 16 then
				var_23_3 = max_text
			end
		end
	else
		arg_23_0 = arg_23_0 - var_23_2 * 60

		if arg_23_0 >= 10 then
			var_23_3 = var_23_2 .. ":" .. arg_23_0
		else
			var_23_3 = var_23_2 .. ":0" .. arg_23_0
		end
	end

	return var_23_3
end

function IsLocalPlay()
	return Dvar.IBEGCHEFE("splitscreen") == true and not IsOnlineMatch()
end

function IsOnlineMatch()
	return Dvar.IBEGCHEFE("LTSNLQNRKO") == true
end

function IsPrivateMatch()
	local var_26_0 = Dvar.IBEGCHEFE("LTSNLQNRKO")
	local var_26_1 = Dvar.IBEGCHEFE("LSTLQTSSRM")

	if var_26_0 == true and var_26_1 == true then
		return true
	end

	return false
end

function IsPublicMatch()
	local var_27_0 = Dvar.IBEGCHEFE("LTSNLQNRKO")
	local var_27_1 = Dvar.IBEGCHEFE("LSTLQTSSRM")

	if var_27_0 == true and var_27_1 == false then
		return true
	end

	return false
end

function IsMlgGameBattlesMatch()
	return Dvar.IBEGCHEFE("MTMMPLSRNL") == true
end

function IsMlgGameBattlesInputLock()
	return Dvar.IBEGCHEFE("MQMQRMLRQP") == true
end

function IsSystemLink()
	return Dvar.IBEGCHEFE("LPSPMQSNPQ") == true
end

function isAliensSolo()
	local var_31_0 = Engine.EAIICIFIFA()
	local var_31_1 = Dvar.IBEGCHEFE("LSTLQTSSRM")
	local var_31_2 = Dvar.IBEGCHEFE("LNQLRSNMQS")

	return var_31_0 and var_31_1 and var_31_2
end

function CoD.AspectRatioCompare(arg_32_0)
	arg_32_0 = arg_32_0 or 1.7777777777777777

	local var_32_0 = 0.01
	local var_32_1 = Engine.CEGEEHGGBA()

	if var_32_0 > math.abs(arg_32_0 - var_32_1) then
		return LUI.COMPARE.equal
	elseif math.abs(var_32_1) < math.abs(arg_32_0) then
		return LUI.COMPARE.lower
	elseif math.abs(var_32_1) > math.abs(arg_32_0) then
		return LUI.COMPARE.higher
	end

	assert(false, "Tried to compare invalid aspect ratio")
end

function CoD.IsUsingAspectRatio(arg_33_0)
	arg_33_0 = arg_33_0 or 1.7777777777777777

	local var_33_0 = 0.01
	local var_33_1 = Engine.CEGEEHGGBA()

	return var_33_0 > math.abs(arg_33_0 - var_33_1)
end

function CoD.GetAspectRatioScaleAdjust(arg_34_0, arg_34_1)
	return CoD.IsUsingAspectRatio(arg_34_1) and 0 or arg_34_0
end

function CoD.GetAdjustedCurrency(arg_35_0)
	return math.floor(arg_35_0 / 100)
end

function CoD.GetPercentToNextCurrency(arg_36_0)
	local var_36_0 = arg_36_0 / 100
	local var_36_1 = 10

	return var_36_0 % var_36_1 / var_36_1
end

function CoD.GetBreadcrumbCreateAClass()
	local var_37_0 = ""

	if IsSystemLink() then
		var_37_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", "EXE/LOCAL_PLAY", "MENU/MULTIPLAYER"))
	elseif not IsPrivateMatch() then
		var_37_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", "MENU/MULTIPLAYER", "LUA_MENU/PUBLIC_MATCH_CAPS"))
	elseif IsMlgGameBattlesMatch() then
		var_37_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", "MENU/MULTIPLAYER", "LUA_MENU/MLG_GAMEBATTLES_CAPS"))
	else
		var_37_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", "MENU/MULTIPLAYER", "LUA_MENU/CUSTOM_GAME_CAPS"))
	end

	return var_37_0
end

function CoD.GetBreadcrumb()
	local var_38_0 = ""

	if IsPrivateMatch() then
		var_38_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", "MENU/MULTIPLAYER", "LUA_MENU/CUSTOM_GAME_CAPS"))
	else
		var_38_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", "EXE/LOCAL_PLAY", "MENU/MULTIPLAYER"))
	end

	return var_38_0
end

CoD.GameDVREnableCount = 0

function CoD.GameDVREnable()
	CoD.GameDVREnableCount = CoD.GameDVREnableCount - 1

	if CoD.GameDVREnableCount == 0 then
		Engine.DEGBFBAHCD(false)
		Engine.BDGJFCCCJ(false)
	end
end

function CoD.GetPauseMenu()
	if Engine.EAIICIFIFA() then
		return "CPPauseMenu"
	elseif Engine.EAAHGICFBD() then
		if CONDITIONS.IsMagmaGameMode() then
			return "BrPauseMenu"
		else
			return "MPPauseMenu"
		end
	else
		return "SPPauseMenu"
	end
end

function CoD.GameDVRDisable()
	Engine.DEGBFBAHCD(true)
	Engine.BDGJFCCCJ(true)

	CoD.GameDVREnableCount = CoD.GameDVREnableCount + 1
end

function CoD.SpamRemovalAction()
	Engine.EBIDFIDHIE("set OOTOSQQPN 0")
	Engine.EBIDFIDHIE("set MOSSSSTTNL 0")
	Engine.EBIDFIDHIE("set LKQNQLPSNQ 0")
	Engine.EBIDFIDHIE("set MQPMQQQNL 0")
	Engine.EBIDFIDHIE("set LONTLKTNS 0")
	Engine.EBIDFIDHIE("set LRPLTTOPPL 0")
	Engine.EBIDFIDHIE("set cg_drawStreamPos 0")
	Engine.EBIDFIDHIE("set MLQKLNNLRO 0")
	Engine.EBIDFIDHIE("set OLNTNRTPPL 0")
	Engine.EBIDFIDHIE("set LLKMNLRLQP 0")
	Engine.EBIDFIDHIE("set TNSRKQRLN 0")
	Engine.EBIDFIDHIE("set cg_drawStreamerWantedImageLoads 0")
	Engine.EBIDFIDHIE("set cg_drawTransientCommonLoadCounts 0")
	Engine.EBIDFIDHIE("set cg_drawWorldTileLoadCounts 0")
	Engine.EBIDFIDHIE("set NNKRRSTKSP 0")
	Engine.EBIDFIDHIE("set cg_drawClientStreamManualView 0")
	Engine.EBIDFIDHIE("set PRORQNSRR 0")
	Engine.EBIDFIDHIE("set MQNPLPTNTS 0")
	Engine.EBIDFIDHIE("set NQKOQPQOLN 0")
	Engine.EBIDFIDHIE("set OLMKKORSTM 0")
	Engine.EBIDFIDHIE("set stream_drawCameraVelocity 0")
end

function CoD.StreamingDebugAction()
	CoD.SpamRemovalAction()
	Engine.EBIDFIDHIE("set OLNTNRTPPL 1")
	Engine.EBIDFIDHIE("set LONTLKTNS 1")
	Engine.EBIDFIDHIE("set MQPMQQQNL 1")
	Engine.EBIDFIDHIE("set MOSSSSTTNL 1")
	Engine.EBIDFIDHIE("set LRPLTTOPPL 1")
	Engine.EBIDFIDHIE("set cg_drawStreamPos 1")
	Engine.EBIDFIDHIE("set TNSRKQRLN 1")
	Engine.EBIDFIDHIE("set cg_drawStreamerWantedImageLoads 1")
	Engine.EBIDFIDHIE("set cg_drawTransientCommonLoadCounts 1")
	Engine.EBIDFIDHIE("set cg_drawWorldTileLoadCounts 1")
	Engine.EBIDFIDHIE("set NNKRRSTKSP 1")
	Engine.EBIDFIDHIE("set cl_transientWorldOverlayLodCount 2")
	Engine.EBIDFIDHIE("set cg_drawImageStreamQuality 1")
	Engine.EBIDFIDHIE("set LLKMNLRLQP 1")
	Engine.EBIDFIDHIE("set cg_drawClientStreamManualView 0")
	Engine.EBIDFIDHIE("set PRORQNSRR 0")
	Engine.EBIDFIDHIE("set MQNPLPTNTS 0")
	Engine.EBIDFIDHIE("set stream_drawCameraVelocity 1")
end

function CoD.StreamImageSortListsAction()
	CoD.SpamRemovalAction()
	Engine.EBIDFIDHIE("set OLNTNRTPPL 1")
	Engine.EBIDFIDHIE("set LONTLKTNS 1")
	Engine.EBIDFIDHIE("set MQPMQQQNL 1")
	Engine.EBIDFIDHIE("set MOSSSSTTNL 1")
	Engine.EBIDFIDHIE("set LRPLTTOPPL 1")
	Engine.EBIDFIDHIE("set cg_drawStreamPos 1")
	Engine.EBIDFIDHIE("set cg_drawImageStreamQuality 1")
	Engine.EBIDFIDHIE("set LLKMNLRLQP 1")
	Engine.EBIDFIDHIE("set cg_drawClientStreamManualView 1")
	Engine.EBIDFIDHIE("set TNSRKQRLN 1")
	Engine.EBIDFIDHIE("set cg_drawStreamerWantedImageLoads 1")
	Engine.EBIDFIDHIE("set cg_drawTransientCommonLoadCounts 1")
	Engine.EBIDFIDHIE("set cg_drawWorldTileLoadCounts 1")
	Engine.EBIDFIDHIE("set PRORQNSRR 2")
	Engine.EBIDFIDHIE("set MQNPLPTNTS 1")
	Engine.EBIDFIDHIE("set TMKRNPTON 0.18")
	Engine.EBIDFIDHIE("set NKTMPOTKLS 16")
end

function CoD.IsClientConnectionActive(arg_45_0)
	return Engine.EEGHCCDG(arg_45_0) > 0
end

PreGameState = {
	DuckedAudio = false
}
PreGame = {}

function PreGame.BeginDuckAudio()
	Engine.BBAEDJDDBA(true)

	PreGameState.DuckedAudio = true
end

function PreGame.RemoveDuckAudioTemporarily()
	if PreGameState.DuckedAudio then
		Engine.BBAEDJDDBA(false)
	end
end

function PreGame.RestoreDuckAudio()
	if PreGameState.DuckedAudio then
		Engine.BBAEDJDDBA(true)
	end
end

function PreGame.EndDuckAudio()
	if PreGameState.DuckedAudio then
		Engine.BBAEDJDDBA(false)

		PreGameState.DuckedAudio = false
	end
end
