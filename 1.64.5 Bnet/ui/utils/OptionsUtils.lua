OPTIONS = {}
OPTIONS.stickLayoutStrings = {
	thumbstick_southpaw_ns = "MENU/SOUTHPAW_NS",
	thumbstick_southpaw = "MENU/SOUTHPAW",
	thumbstick_legacysouthpaw_ns = "MENU/LEGACY_SOUTHPAW_NS",
	thumbstick_legacysouthpaw = "MENU/LEGACY_SOUTHPAW",
	thumbstick_legacy = "MENU/LEGACY",
	thumbstick_default = "MENU/DEFAULT"
}
OPTIONS.buttonLayoutStrings = {
	buttons_brawler = "MENU/BRAWLER",
	buttons_default_alt = "MENU/DEFAULT_ALT",
	buttons_nomad_tactical = "MENU/NOMAD_TACTICAL",
	buttons_nomad_lefty = "MENU/NOMAD_LEFTY",
	buttons_nomad = "MENU/NOMAD",
	buttons_bumper_jumper_tac = "MENU/BUMPER_JUMPER_TACTICAL",
	buttons_stick_move_alt = "MENU/STICK_MOVE_ALT",
	buttons_bumper_jumper = "MENU/BUMPER_JUMPER",
	buttons_one_hand_gun = "MENU/ONE_HAND_GUN",
	buttons_lefty = "MENU/LEFTY",
	buttons_bumper_jumper_tac_alt = "MENU/BUMPER_JUMPER_TACTICAL_ALT",
	buttons_beast = "MENU/BEAST",
	buttons_one_hand_gun_alt = "MENU/ONE_HAND_GUN_ALT",
	buttons_stick_move = "MENU/STICK_MOVE",
	buttons_lefty_alt = "MENU/LEFTY_ALT",
	buttons_brawler_alt = "MENU/BRAWLER_ALT",
	buttons_nomad_alt = "MENU/NOMAD_ALT",
	buttons_tactical = "MENU/TACTICAL",
	buttons_nomad_tactical_alt = "MENU/NOMAD_TACTICAL_ALT",
	buttons_tactical_alt = "MENU/TACTICAL_ALT",
	buttons_beast_alt = "MENU/BEAST_ALT",
	buttons_bumper_jumper_alt = "MENU/BUMPER_JUMPER_ALT",
	buttons_nomad_lefty_alt = "MENU/NOMAD_LEFTY_ALT",
	buttons_default = "MENU/DEFAULT"
}
OPTIONS.brButtonLayoutStrings = {
	buttons_brawler = "MENU/BRAWLER",
	buttons_br_ping_lb_tactical = "MENU/BR_PING_LB_TACTICAL",
	buttons_nomad_tactical = "MENU/NOMAD_TACTICAL",
	buttons_nomad_lefty = "MENU/NOMAD_LEFTY",
	buttons_beast = "MENU/BEAST",
	buttons_nomad = "MENU/NOMAD",
	buttons_stick_move_alt = "MENU/STICK_MOVE_ALT",
	buttons_br_ping_lb = "MENU/DEFAULT_BR",
	buttons_bumper_jumper = "MENU/BUMPER_JUMPER",
	buttons_lefty = "MENU/LEFTY",
	buttons_lefty_alt = "MENU/LEFTY_ALT",
	buttons_default_alt = "MENU/DEFAULT_ALT",
	buttons_nomad_alt = "MENU/NOMAD_ALT",
	buttons_stick_move = "MENU/STICK_MOVE",
	buttons_bumper_jumper_tac_alt = "MENU/BUMPER_JUMPER_TACTICAL_ALT",
	buttons_one_hand_gun_alt = "MENU/ONE_HAND_GUN_ALT",
	buttons_one_hand_gun = "MENU/ONE_HAND_GUN",
	buttons_tactical = "MENU/TACTICAL",
	buttons_bumper_jumper_tac = "MENU/BUMPER_JUMPER_TACTICAL",
	buttons_brawler_alt = "MENU/BRAWLER_ALT",
	buttons_br_ping_lb_alt = "MENU/DEFAULT_BR_ALT",
	buttons_br_ping_lb_tactical_alt = "MENU/BR_PING_LB_TACTICAL_ALT",
	buttons_nomad_tactical_alt = "MENU/NOMAD_TACTICAL_ALT",
	buttons_tactical_alt = "MENU/TACTICAL_ALT",
	buttons_beast_alt = "MENU/BEAST_ALT",
	buttons_bumper_jumper_alt = "MENU/BUMPER_JUMPER_ALT",
	buttons_nomad_lefty_alt = "MENU/NOMAD_LEFTY_ALT",
	buttons_default = "MENU/DEFAULT"
}
OPTIONS.disableButtonOptions = {
	ENABLED = 2,
	DISABLED = 1
}
OPTIONS.disableButtonLabels = {
	Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
	Engine.CBBHFCGDIC("LUA_MENU/ENABLED")
}
OPTIONS.sensitivityPrefixes = {
	"MENU/LOW",
	nil,
	"MENU/MEDIUM",
	nil,
	nil,
	nil,
	"MENU/HIGH",
	[13] = "MENU/VERY_HIGH",
	[20] = "MENU/INSANE"
}
OPTIONS.lootCardDetailLabels = {
	Engine.CBBHFCGDIC("MENU/LOW"),
	Engine.CBBHFCGDIC("MENU/MEDIUM"),
	Engine.CBBHFCGDIC("MENU/HIGH")
}
OPTIONS.colorBlindLabels = {
	Engine.CBBHFCGDIC("OPTIONS/NONE"),
	Engine.CBBHFCGDIC("OPTIONS/PROTANOPE"),
	Engine.CBBHFCGDIC("OPTIONS/DEUTERANOPE"),
	Engine.CBBHFCGDIC("OPTIONS/TRITANOPE")
}
OPTIONS.colorBlindDescription = {
	Engine.CBBHFCGDIC("OPTIONS/NONE_DESC"),
	Engine.CBBHFCGDIC("OPTIONS/PROTANOPE_DESC"),
	Engine.CBBHFCGDIC("OPTIONS/DEUTERANOPE_DESC"),
	Engine.CBBHFCGDIC("OPTIONS/TRITANOPE_DESC")
}
OPTIONS.colorBlindTargetLabels = {
	Engine.CBBHFCGDIC("OPTIONS/WORLD"),
	Engine.CBBHFCGDIC("OPTIONS/INTERFACE"),
	Engine.CBBHFCGDIC("OPTIONS/BOTH")
}
OPTIONS.hitMarkerSoundAliases = {
	"hit_marker_none",
	"hit_marker_classic",
	"hit_marker_3d"
}
OPTIONS.voiceChatEffectValues = {
	"mw_default",
	"mw",
	"mw_classic"
}
OPTIONS.CCPA_REQUEST_MAX_COUNT = 50
OPTIONS.CCPA_REQUEST_INTERVAL = 50
OPTIONS.regulationType = {
	CCPA = 0,
	COUNT = 1
}
OPTIONS.regulationEnforcement = {
	NOT_ENFORCED = 3,
	ENFORCED = 2,
	ENFORCEMENT_ERROR = 1,
	UNKNOWN = 0
}
OPTIONS.regulationPreference = {
	PREFERENCE_ERROR = 1,
	OPT_IN = 2,
	OPT_OUT = 3,
	UNKNOWN = 0
}

local var_0_0
local var_0_1
local var_0_2
local var_0_3
local var_0_4
local var_0_5
local var_0_6
local var_0_7

local function var_0_8()
	var_0_0 = {}
	var_0_1 = {}

	for iter_1_0 = 1, 20 do
		local var_1_0 = OPTIONS.sensitivityPrefixes[iter_1_0]
		local var_1_1 = var_1_0 and Engine.CBBHFCGDIC(var_1_0) .. " " .. iter_1_0 or tostring(iter_1_0)

		table.insert(var_0_0, var_1_1)
		table.insert(var_0_1, iter_1_0)
	end
end

local function var_0_9()
	var_0_2 = {}

	local var_2_0 = 0

	for iter_2_0, iter_2_1 in pairs(OPTIONS.stickLayoutStrings) do
		local var_2_1 = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.stickLayouts.file, CSV.stickLayouts.cols.index, var_2_0, CSV.stickLayouts.cols.name))

		table.insert(var_0_2, var_2_1)

		var_2_0 = var_2_0 + 1
	end
end

local function var_0_10()
	var_0_4 = {}
	var_0_5 = {}

	local var_3_0 = 0

	for iter_3_0, iter_3_1 in pairs(OPTIONS.buttonLayoutStrings) do
		local var_3_1 = StringTable.DIFCHIGDFB(CSV.buttonLayouts.file, CSV.buttonLayouts.cols.index, var_3_0, CSV.buttonLayouts.cols.name)

		if not string.find(iter_3_1, "_ALT") then
			table.insert(var_0_4, Engine.CBBHFCGDIC(var_3_1))
			table.insert(var_0_5, Engine.CBBHFCGDIC(var_3_1 .. "_ALT"))

			var_3_0 = var_3_0 + 1
		end
	end
end

OPTIONS.BRButtonLayoutLabels = {}
OPTIONS.BRButtonLayoutAltLabels = {}

local function var_0_11()
	assert(next(OPTIONS.BRButtonLayoutLabels) == nil, "We're not expecting InitBRButtonLayout to be called twice for now.")

	local var_4_0 = 0

	for iter_4_0, iter_4_1 in pairs(OPTIONS.brButtonLayoutStrings) do
		local var_4_1 = StringTable.DIFCHIGDFB(CSV.brButtonLayouts.file, CSV.brButtonLayouts.cols.index, var_4_0, CSV.brButtonLayouts.cols.name)

		if not string.find(iter_4_1, "_ALT") then
			table.insert(OPTIONS.BRButtonLayoutLabels, Engine.CBBHFCGDIC(var_4_1))
			table.insert(OPTIONS.BRButtonLayoutAltLabels, Engine.CBBHFCGDIC(var_4_1 .. "_ALT"))

			var_4_0 = var_4_0 + 1
		end
	end
end

local function var_0_12()
	var_0_6 = {}

	for iter_5_0 = 0, #Languages - 1 do
		if Engine.CGFGDJCJHI(iter_5_0) then
			local var_5_0 = GetLanguageDisplayName(iter_5_0)

			table.insert(var_0_6, var_5_0)
		end
	end
end

function OPTIONS.GetSensitivityLabels()
	if not var_0_0 then
		var_0_8()
	end

	return var_0_0
end

function OPTIONS.GetSensitivityValues()
	if not var_0_1 then
		var_0_8()
	end

	return var_0_1
end

function OPTIONS.GetStickLayoutLabels()
	if not var_0_2 or #var_0_2 == 0 then
		var_0_9()
	end

	return var_0_2
end

function OPTIONS.GetButtonLayoutLabels()
	if not var_0_4 or #var_0_4 == 0 then
		var_0_10()
	end

	return var_0_4
end

function OPTIONS.GetButtonLayoutAltLabels()
	if not var_0_5 or #var_0_5 == 0 then
		var_0_10()
	end

	return var_0_5
end

function OPTIONS.GetBRButtonLayoutLabels()
	if not next(OPTIONS.BRButtonLayoutLabels) then
		var_0_11()
	end

	return OPTIONS.BRButtonLayoutLabels
end

function OPTIONS.GetBRButtonLayoutAltLabels()
	if not next(OPTIONS.BRButtonLayoutAltLabels) then
		var_0_11()
	end

	return OPTIONS.BRButtonLayoutAltLabels
end

function OPTIONS.GetLanguageLabels()
	if not var_0_6 then
		var_0_12()
	end

	return var_0_6
end

function OPTIONS.GetLanguageIndices()
	local var_14_0 = {}

	for iter_14_0 = 0, #Languages - 1 do
		if Engine.CGFGDJCJHI(iter_14_0) then
			table.insert(var_14_0, iter_14_0)
		end
	end

	return var_14_0
end

function OPTIONS.GetMountConfigLabels()
	return {
		Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
		Engine.CBBHFCGDIC("LUA_MENU/DOUBLE_TAP_ADS"),
		Engine.CBBHFCGDIC("LUA_MENU/ADS_PLUS_MELEE"),
		Engine.CBBHFCGDIC("LUA_MENU/ADS")
	}
end

function OPTIONS.GetMountConfigValues()
	return {
		1,
		2,
		3,
		7
	}
end

function OPTIONS.GetMountConfigKBMLabels()
	return {
		Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
		Engine.CBBHFCGDIC("LUA_MENU/DOUBLE_TAP_ADS"),
		Engine.CBBHFCGDIC("LUA_MENU/ADS_PLUS_MELEE"),
		Engine.CBBHFCGDIC("LUA_MENU/ADS"),
		Engine.CBBHFCGDIC("LUA_MENU/AUTO_MOUNT_TOGGLE"),
		Engine.CBBHFCGDIC("LUA_MENU/AUTO_MOUNT_HOLD"),
		Engine.CBBHFCGDIC("LUA_MENU/ADS_PLUS_INTERACT")
	}
end

function OPTIONS.GetMountConfigKBMValues()
	return {
		1,
		2,
		3,
		7,
		8,
		9,
		10
	}
end

function OPTIONS.GetCurrentGpadButtonsConfigName(arg_19_0)
	if arg_19_0 == nil then
		arg_19_0 = CONDITIONS.IsMagmaGameMode()
	end

	return arg_19_0 and "gpadBRButtonsConfig" or "gpadButtonsConfig"
end

function OPTIONS.GetCurrentCSVButtonLayouts(arg_20_0)
	if arg_20_0 == nil then
		arg_20_0 = CONDITIONS.IsMagmaGameMode()
	end

	return arg_20_0 and CSV.brButtonLayouts or CSV.buttonLayouts
end

function OPTIONS.GetCurrentButtonLayoutLabels(arg_21_0)
	if arg_21_0 then
		local var_21_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_21_0)

		if string.match(var_21_0, "_alt$") then
			return OPTIONS.GetButtonLayoutAltLabels()
		else
			return OPTIONS.GetButtonLayoutLabels()
		end
	end
end

function OPTIONS.GetCurrentBRButtonLayoutLabels(arg_22_0)
	if arg_22_0 then
		local var_22_0 = Engine.BECCFCBIAA("gpadBRButtonsConfig", arg_22_0)

		if string.match(var_22_0, "_alt$") then
			return OPTIONS.GetBRButtonLayoutAltLabels()
		else
			return OPTIONS.GetBRButtonLayoutLabels()
		end
	end
end

function OPTIONS.CalculateViewportDimensions(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	local var_23_0

	if arg_23_1 == 1 then
		if Dvar.CFHDGABACF("NNSQSMTQPP") == 0 then
			var_23_0 = {
				Engine.CGDHIAECED(),
				Engine.BAAGFJBAAE()
			}
		else
			var_23_0 = {
				Dvar.CFHDGABACF("NSRPORKNPT"),
				Dvar.CFHDGABACF("OMQTQNOSRO")
			}
		end
	elseif arg_23_1 == 2 then
		var_23_0 = LUI.Split(arg_23_2[arg_23_3], "x")
	elseif arg_23_1 == 3 or arg_23_1 == 4 then
		var_23_0 = LUI.Split(arg_23_4, "x")
	end

	local var_23_1 = arg_23_0 / 100

	return {
		var_23_0[1] * var_23_1,
		var_23_0[2] * var_23_1
	}
end

function OPTIONS.IsInputSwapEnabled()
	return Dvar.IBEGCHEFE("NNPMRQSQN") and (not CONDITIONS.InGame() or not not MatchRules.BFBFBEHJ())
end

function OPTIONS.DualInputConnected(arg_25_0)
	return OPTIONS.IsGamepadConnected(arg_25_0) and Engine.JDFDCGCIJ(arg_25_0)
end

function OPTIONS.IsGamepadConnected(arg_26_0)
	if Engine.CGABICJHAI() then
		return Engine.GCCHFDJAF()
	else
		return not Engine.EACCHAIHIB(arg_26_0)
	end
end

function OPTIONS.ColorBlindSelect(arg_27_0)
	Engine.DAGFFDGFII("profile_setColorBlindMode " .. arg_27_0 - 1)
end

function OPTIONS.ColorBlindTargetsSelect(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0 == 1 and 0 or 1
	local var_28_1 = arg_28_0 == 2 and 0 or 1

	Engine.DCFJBGICFF(arg_28_1, var_28_1, var_28_0)
end

function OPTIONS.GetColorBlindConfig(arg_29_0)
	local var_29_0 = Engine.BECCFCBIAA("colorBlindMode", arg_29_0)

	return {
		wrapAround = true,
		labels = OPTIONS.colorBlindLabels,
		description = OPTIONS.colorBlindDescription,
		action = OPTIONS.ColorBlindSelect,
		defaultValue = var_29_0 + 1
	}
end

function OPTIONS.CreateColorBlindFilterLogic(arg_30_0, arg_30_1)
	local var_30_0 = OPTIONS.GetColorBlindConfig(arg_30_1)

	LUI.AddUIArrowTextButtonLogic(arg_30_0, arg_30_1, var_30_0)
end

function OPTIONS.GetColorBlindSpecificImage(arg_31_0)
	local var_31_0, var_31_1 = Engine.CBCJIDDIED(arg_31_0)
	local var_31_2 = {
		[COLOR_BLIND.modes.none] = "image_options_colorblindtype",
		[COLOR_BLIND.modes.protanope] = "image_options_colorblindtype_protanopia",
		[COLOR_BLIND.modes.deuteranope] = "image_options_colorblindtype_deutanopia",
		[COLOR_BLIND.modes.tritanope] = "image_options_colorblindtype_tritanopia"
	}

	if var_31_0 and not var_31_1 then
		return var_31_2[Engine.BECCFCBIAA("colorBlindMode", arg_31_0) + 1]
	end

	return var_31_2[COLOR_BLIND.modes.none]
end

function OPTIONS.GetBrightnessToggle(arg_32_0)
	return function(arg_33_0, arg_33_1)
		Dvar.IICIFEEDC("NMRKMSMTOO", arg_33_0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_33_1)
		arg_32_0:dispatchEventToCurrentMenu({
			name = "brightness_updated"
		})
	end
end

OPTIONS.natTypeUILabels = {
	[0] = "LUA_MENU/UNCATEGORIZED",
	"LUA_MENU/OPEN",
	"LUA_MENU/MODERATE",
	"LUA_MENU/STRICT",
	unknown = "LUA_MENU/UNKNOWN_NETWORK"
}
OPTIONS.natTypeDescUILabels = {
	[0] = "LUA_MENU/UNCATEGORIZED",
	"LUA_MENU/OPEN",
	"LUA_MENU/MODERATEPARTYWARNING",
	"LUA_MENU/STRICTPARTYWARNING",
	unknown = "LUA_MENU/UNKNOWN_NETWORK"
}

function OPTIONS.FirstPartyServersLabel()
	if Engine.CIEGIACHAE() then
		return "LUA_MENU/FIRSTPARTY_SERVERS_PS4"
	elseif Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() then
		return "LUA_MENU/FIRSTPARTY_SERVERS_XBONE"
	elseif not Engine.HDGDBCJFG() then
		return "LUA_MENU/FIRSTPARTY_SERVERS_PC"
	end

	return "LUA_MENU/FIRSTPARTY_SERVERS_UNKNOWN"
end

function OPTIONS.GeographicalRegionToggle(arg_35_0)
	return function(arg_36_0, arg_36_1)
		local var_36_0 = Dvar.IBEGCHEFE("MKMOPQKMPO")

		Dvar.DHEGHJJJHI("MKMOPQKMPO", not var_36_0)

		local var_36_1 = not var_36_0 and "LUA_MENU/HIDDEN" or NetworkInfo.BGJIBGHBAG()

		arg_35_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION_CAPS", var_36_1)), 0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_36_1)
	end
end

function OPTIONS.ExternalIPToggle(arg_37_0)
	return function(arg_38_0, arg_38_1)
		local var_38_0 = Dvar.IBEGCHEFE("MTSPMPOSTO")

		Dvar.DHEGHJJJHI("MTSPMPOSTO", not Dvar.IBEGCHEFE("MTSPMPOSTO"))

		local var_38_1 = not var_38_0 and "LUA_MENU/HIDDEN" or NetworkInfo.BBJBJGDIGD()

		arg_37_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS_CAPS", var_38_1)), 0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_38_1)
	end
end

function OPTIONS.InternalIPToggle(arg_39_0)
	return function(arg_40_0, arg_40_1)
		local var_40_0 = Dvar.IBEGCHEFE("SQMORMQQS")

		Dvar.DHEGHJJJHI("SQMORMQQS", not Dvar.IBEGCHEFE("SQMORMQQS"))

		local var_40_1 = not var_40_0 and "LUA_MENU/HIDDEN" or NetworkInfo.DBDIHEIEGB()

		arg_39_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS_CAPS", var_40_1)), 0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_40_1)
	end
end

function OPTIONS.ConnectionMeterToggle(arg_41_0)
	return function(arg_42_0, arg_42_1)
		Dvar.DHEGHJJJHI("OMOTRTTLNP", not Dvar.IBEGCHEFE("OMOTRTTLNP"))
		arg_41_0:processEvent({
			name = "connection_meter_toggle"
		})
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_42_1)
	end
end

function OPTIONS.ConfigureNetworkDiagnosticHiderArrowButton(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = Dvar.IBEGCHEFE(arg_43_2)
	local var_43_1 = {
		wrapAround = true,
		labels = {
			Engine.CBBHFCGDIC("LUA_MENU/HIDDEN"),
			Engine.CBBHFCGDIC("LUA_MENU/SHOWN")
		},
		action = arg_43_3(arg_43_1),
		defaultValue = var_43_0 and OPTIONS.disableButtonOptions.DISABLED or OPTIONS.disableButtonOptions.ENABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_43_1, arg_43_0, var_43_1)
end

function OPTIONS.BuildNetworkDiagnosticHiderArrowButton(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_44_0
	})

	var_44_0.id = "GeographicalRegion"

	var_44_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_44_2, 0)

	var_44_0.buttonDescription = arg_44_3

	var_44_0.Title:setText(arg_44_4, 0)

	return var_44_0
end

function OPTIONS.BuildNetworkDiagnosticLabelButton(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4)
	local var_45_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_45_0
	})

	var_45_0.id = arg_45_1

	var_45_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_45_2, 0)

	var_45_0.buttonDescription = arg_45_3

	var_45_0.Text:setText(arg_45_4, 0)
	var_45_0.DynamicText:setText("", 0)

	return var_45_0
end

local function var_0_13(arg_46_0, arg_46_1)
	local var_46_0 = Engine.BECCFCBIAA("matchEndShouldRecordDLogInt", arg_46_0)
	local var_46_1 = BitwiseOperators.bor(var_46_0, arg_46_1)

	Engine.DFJDIFJEGA("matchEndShouldRecordDLogInt", var_46_1)
end

local function var_0_14(arg_47_0, arg_47_1)
	if type(arg_47_0) == "function" then
		return arg_47_0(arg_47_1)
	else
		return arg_47_0
	end
end

local function var_0_15(arg_48_0)
	return arg_48_0 - 1
end

local function var_0_16(arg_49_0)
	return arg_49_0 - 1
end

local function var_0_17(arg_50_0)
	return arg_50_0 - 1
end

local function var_0_18(arg_51_0)
	return arg_51_0 == 2
end

local function var_0_19(arg_52_0)
	return arg_52_0 + 1
end

local function var_0_20(arg_53_0)
	return arg_53_0 + 1
end

local function var_0_21(arg_54_0)
	return math.floor(arg_54_0 + 0.5) + 1
end

local function var_0_22(arg_55_0)
	return arg_55_0 and 2 or 1
end

local function var_0_23(arg_56_0)
	local var_56_0 = type(arg_56_0)

	if var_56_0 == "number" then
		if math.floor(arg_56_0) == arg_56_0 then
			return var_0_19(arg_56_0)
		else
			return var_0_21(arg_56_0)
		end
	elseif var_56_0 == "boolean" then
		return var_0_22(arg_56_0)
	end
end

local function var_0_24(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = Dvar.EBBAIAEICC(arg_57_0)

	if arg_57_2 == true then
		if var_57_0 == DvarTypeTable.DvarInt then
			Dvar.DFIJDJFIFD(arg_57_0, var_0_15(arg_57_1))
		elseif var_57_0 == DvarTypeTable.DvarEnum then
			Dvar.DFIJDJFIFD(arg_57_0, var_0_16(arg_57_1))
		elseif var_57_0 == DvarTypeTable.DvarBool then
			Dvar.DHEGHJJJHI(arg_57_0, var_0_18(arg_57_1))
		elseif var_57_0 == DvarTypeTable.DvarFloat then
			Dvar.IICIFEEDC(arg_57_0, var_0_17(arg_57_1))
		end
	elseif var_57_0 == DvarTypeTable.DvarInt then
		Dvar.DFIJDJFIFD(arg_57_0, arg_57_1)
	elseif var_57_0 == DvarTypeTable.DvarFloat then
		Dvar.IICIFEEDC(arg_57_0, arg_57_1)
	end
end

local function var_0_25(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = Dvar.EBBAIAEICC(arg_58_0)
	local var_58_1

	if not arg_58_2 then
		if arg_58_1 == true then
			if var_58_0 == DvarTypeTable.DvarInt then
				var_58_1 = var_0_19(Dvar.CFHDGABACF(arg_58_0))
			elseif var_58_0 == DvarTypeTable.DvarEnum then
				var_58_1 = var_0_20(Dvar.CFHDGABACF(arg_58_0))
			elseif var_58_0 == DvarTypeTable.DvarBool then
				var_58_1 = var_0_22(Dvar.IBEGCHEFE(arg_58_0))
			elseif var_58_0 == DvarTypeTable.DvarFloat then
				var_58_1 = var_0_21(Dvar.BJJCJHDBII(arg_58_0))
			end
		elseif var_58_0 == DvarTypeTable.DvarInt then
			var_58_1 = Dvar.CFHDGABACF(arg_58_0)
		elseif var_58_0 == DvarTypeTable.DvarFloat then
			var_58_1 = Dvar.BJJCJHDBII(arg_58_0)
		end
	elseif var_58_0 == DvarTypeTable.DvarInt then
		var_58_1 = Dvar.CFHDGABACF(arg_58_0)
	elseif var_58_0 == DvarTypeTable.DvarBool then
		var_58_1 = Dvar.IBEGCHEFE(arg_58_0)
	elseif var_58_0 == DvarTypeTable.DvarFloat then
		var_58_1 = Dvar.BJJCJHDBII(arg_58_0)
	elseif var_58_0 == DvarTypeTable.DvarString or var_58_0 == DvarTypeTable.DvarEnum then
		var_58_1 = Dvar.DHEEJCCJBH(arg_58_0)
	end

	return var_58_1
end

local function var_0_26(arg_59_0, arg_59_1)
	local var_59_0 = Dvar.EBBAIAEICC(arg_59_0)

	if arg_59_1 == true then
		if var_59_0 == DvarTypeTable.DvarInt then
			return var_0_19(Dvar.DBGFIDHBFC(arg_59_0))
		elseif var_59_0 == DvarTypeTable.DvarEnum then
			return var_0_20(Dvar.DBGFIDHBFC(arg_59_0))
		elseif var_59_0 == DvarTypeTable.DvarBool then
			return var_0_22(Dvar.DBGFIDHBFC(arg_59_0))
		elseif var_59_0 == DvarTypeTable.DvarFloat then
			return var_0_21(Dvar.DBGFIDHBFC(arg_59_0))
		end
	elseif var_59_0 == DvarTypeTable.DvarInt then
		return Dvar.DBGFIDHBFC(arg_59_0)
	elseif var_59_0 == DvarTypeTable.DvarFloat then
		return Dvar.DBGFIDHBFC(arg_59_0)
	end
end

function OPTIONS.SetSetting(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	arg_60_3 = arg_60_3 or true

	if Dvar.DEHABCCECE(arg_60_0) then
		var_0_24(arg_60_0, arg_60_1, arg_60_3)

		return true
	elseif Engine.BECCFCBIAA(arg_60_0, arg_60_2) then
		if arg_60_3 == true then
			Engine.DFJDIFJEGA(arg_60_0, arg_60_1 - 1, arg_60_2)
		else
			Engine.DFJDIFJEGA(arg_60_0, arg_60_1, arg_60_2)
		end

		return true
	else
		return nil
	end
end

function OPTIONS.GetSetting(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	arg_61_2 = arg_61_2 == nil and true or arg_61_2

	if Dvar.DEHABCCECE(arg_61_0) then
		return var_0_25(arg_61_0, arg_61_2, arg_61_3)
	elseif Engine.BECCFCBIAA(arg_61_0, arg_61_1) ~= nil then
		local var_61_0 = Engine.BECCFCBIAA(arg_61_0, arg_61_1)

		if arg_61_2 == true then
			return var_0_23(var_61_0)
		else
			return var_61_0
		end
	else
		return nil
	end
end

function OPTIONS.GetSettingDefaultValue(arg_62_0, arg_62_1, arg_62_2)
	arg_62_2 = arg_62_2 or true

	if Dvar.DEHABCCECE(arg_62_0) then
		return var_0_26(arg_62_0, arg_62_2)
	elseif Engine.BECCFCBIAA(arg_62_0, arg_62_1) ~= nil then
		local var_62_0 = Engine.IEBBJFBE(arg_62_0)

		if arg_62_2 == true then
			return var_0_23(var_62_0)
		else
			return var_62_0
		end
	else
		return nil
	end
end

local function var_0_27(arg_63_0, arg_63_1)
	local var_63_0 = var_0_14(arg_63_0.labels, arg_63_1)

	if var_63_0 == nil then
		var_63_0 = {
			"Unavailable"
		}
	end

	return var_63_0
end

local function var_0_28(arg_64_0, arg_64_1)
	return arg_64_0.applyable == true
end

local function var_0_29(arg_65_0, arg_65_1)
	return arg_65_0.resetOverride == true
end

local function var_0_30(arg_66_0, arg_66_1)
	local var_66_0 = var_0_14(arg_66_0.name)

	if var_66_0 == nil then
		var_66_0 = "Unavailable"
	end

	return var_66_0
end

local function var_0_31(arg_67_0, arg_67_1)
	local var_67_0 = var_0_14(arg_67_0.description)

	if var_67_0 == nil then
		var_67_0 = "Unavailable"
	end

	return var_67_0
end

local function var_0_32(arg_68_0, arg_68_1)
	if arg_68_0.onDependencyParentRefresh then
		return arg_68_0.onDependencyParentRefresh
	else
		return function()
			return
		end
	end
end

local function var_0_33(arg_70_0, arg_70_1)
	local var_70_0

	if arg_70_0.onRefresh then
		var_70_0 = arg_70_0.onRefresh
	else
		function var_70_0()
			return
		end
	end

	return function(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
		local var_72_0 = arg_72_0:GetCurrentMenu()

		if var_72_0 then
			if arg_70_0.applyable and arg_72_3 then
				var_72_0:processEvent({
					name = "add_modified_option",
					target = arg_72_0
				})
			end

			if var_72_0.OptionsGraphicsSliderBar then
				var_72_0.OptionsGraphicsSliderBar:processEvent({
					name = "update_vram",
					changedSetting = arg_70_0.id,
					changedSettingValue = arg_72_2
				})
			end

			if var_72_0.MicLevelSliderBar then
				var_72_0.MicLevelSliderBar:processEvent({
					name = "update_config",
					changedSetting = arg_70_0.id,
					changedSettingValue = arg_72_2
				})
			end

			if arg_70_0.dependencies then
				for iter_72_0, iter_72_1 in ipairs(arg_70_0.dependencies) do
					local var_72_1 = false

					if arg_70_0.isDependencyDisabled then
						var_72_1 = arg_70_0.isDependencyDisabled(arg_72_0, arg_72_1, arg_72_2, iter_72_1)
					end

					if var_72_0.RefreshDependency then
						var_72_0:RefreshDependency(iter_72_1, var_72_1, arg_70_0.id, arg_72_2)
					end
				end
			end
		end

		var_70_0(arg_72_0, arg_72_1, arg_72_2)
	end
end

local function var_0_34(arg_73_0, arg_73_1)
	local var_73_0

	if arg_73_0.onReset then
		var_73_0 = arg_73_0.onReset
	else
		function var_73_0()
			return
		end
	end

	return function(arg_75_0, arg_75_1)
		var_73_0(arg_75_0, arg_75_1)
	end
end

local function var_0_35(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0

	if arg_76_0.action ~= nil and type(arg_76_0.action) == "function" then
		var_76_0 = arg_76_0.action
	elseif arg_76_0.dvar then
		function var_76_0(arg_77_0, arg_77_1, arg_77_2)
			var_0_24(arg_76_0.dvar, arg_77_2, arg_76_2 == true)
		end
	elseif arg_76_0.profileOption then
		if LUI.BeginsWith(arg_76_0.id, "CoDCaster_") then
			function var_76_0(arg_78_0, arg_78_1, arg_78_2)
				local var_78_0 = arg_76_2 == true and arg_78_2 - 1 or arg_78_2
				local var_78_1 = arg_76_0.profileOption

				MLG.SetShoutcasterProfileVarValue(arg_78_1, var_78_1, var_78_0)

				if not Engine.DDJFBBJAIG() then
					local var_78_2 = LUI.CodcasterLayer.GetInstance()

					if var_78_2._codCasterHUD then
						var_78_2:notifyCodcasterSettingChange(arg_76_0.profileOption, arg_78_2 - 1)
					end
				end
			end
		else
			function var_76_0(arg_79_0, arg_79_1, arg_79_2)
				local var_79_0 = arg_76_2 == true and arg_79_2 - 1 or arg_79_2

				Engine.DFJDIFJEGA(arg_76_0.profileOption, var_79_0, arg_79_1)
			end
		end
	else
		arg_76_0.disabled = true

		function var_76_0(arg_80_0, arg_80_1, arg_80_2)
			return
		end
	end

	return function(arg_81_0, arg_81_1, arg_81_2)
		var_76_0(arg_81_0, arg_81_1, arg_81_2)

		if not arg_76_0.applyable then
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_81_1)
		end

		if arg_76_0.matchEndDLogRecording then
			var_0_13(arg_81_1, arg_76_0.matchEndDLogRecording)
		end
	end
end

local function var_0_36(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0

	if type(arg_82_0.value) == "function" then
		var_82_0 = arg_82_0.value
	elseif arg_82_0.dvar then
		function var_82_0(arg_83_0)
			return var_0_25(arg_82_0.dvar, arg_82_2)
		end
	elseif arg_82_0.profileOption then
		if arg_82_2 == true then
			if LUI.BeginsWith(arg_82_0.id, "CoDCaster_") then
				function var_82_0(arg_84_0)
					local var_84_0 = arg_82_0.profileOption

					return MLG.ShoutcasterProfileVarValue(arg_84_0, arg_82_0.profileOption) + 1
				end
			else
				function var_82_0(arg_85_0)
					local var_85_0 = Engine.BECCFCBIAA(arg_82_0.profileOption, arg_85_0)

					return var_0_23(var_85_0)
				end
			end
		elseif LUI.BeginsWith(arg_82_0.id, "CoDCaster_") then
			function var_82_0(arg_86_0)
				local var_86_0 = arg_82_0.profileOption

				return MLG.ShoutcasterProfileVarValue(arg_86_0, arg_82_0.profileOption)
			end
		else
			function var_82_0(arg_87_0)
				return (Engine.BECCFCBIAA(arg_82_0.profileOption, arg_87_0))
			end
		end
	elseif arg_82_0.value ~= nil then
		if arg_82_2 == true then
			function var_82_0(arg_88_0)
				return var_0_23(arg_82_0.value)
			end
		else
			function var_82_0(arg_89_0)
				return arg_82_0.value
			end
		end
	end

	if var_82_0 == nil then
		arg_82_0.disabled = true

		function var_82_0()
			return 1
		end
	end

	return var_82_0
end

local function var_0_37(arg_91_0, arg_91_1)
	if arg_91_1 and arg_91_0 == "httpStreamLimitMBytes" then
		arg_91_1 = arg_91_1 / 1024
	end

	return arg_91_1
end

local function var_0_38(arg_92_0, arg_92_1, arg_92_2)
	local var_92_0

	if type(arg_92_0.defaultOptionValue) == "function" then
		var_92_0 = arg_92_0.defaultOptionValue
	elseif arg_92_0.dvar then
		function var_92_0(arg_93_0)
			return var_0_26(arg_92_0.dvar, arg_92_2)
		end
	elseif arg_92_0.profileOption then
		if LUI.BeginsWith(arg_92_0.id, "CoDCaster_") then
			function var_92_0(arg_94_0)
				local var_94_0 = arg_92_0.profileOption
				local var_94_1 = MLG.ShoutcasterProfileVarDefaultValue(arg_94_0, arg_92_0.profileOption)

				if var_94_1 == nil then
					var_94_1 = MLG.ShoutcasterProfileVarValue(arg_94_0, arg_92_0.profileOption)
				end

				return arg_92_2 == true and var_94_1 + 1 or var_94_1
			end
		else
			function var_92_0(arg_95_0)
				local var_95_0 = Engine.IEBBJFBE(arg_92_0.profileOption)
				local var_95_1 = var_0_37(arg_92_0.profileOption, var_95_0)

				return arg_92_2 == true and var_0_23(var_95_1) or var_95_1
			end
		end
	elseif arg_92_0.defaultOptionValue ~= nil then
		if arg_92_2 == true then
			function var_92_0(arg_96_0)
				return var_0_23(arg_92_0.defaultOptionValue)
			end
		else
			function var_92_0(arg_97_0)
				return arg_92_0.defaultOptionValue
			end
		end
	end

	if var_92_0 == nil then
		arg_92_0.disabled = true

		function var_92_0()
			return 1
		end
	end

	return var_92_0
end

local function var_0_39(arg_99_0, arg_99_1)
	local var_99_0 = SliderBounds[arg_99_0.sliderDataName]
	local var_99_1 = SliderBounds.DefaultSliderBounds

	if var_99_0 == nil then
		var_99_0 = var_99_1
	end

	local var_99_2 = 0

	if arg_99_0.minimumSliderBound then
		var_99_2 = arg_99_0.minimumSliderBound()
	else
		var_99_2 = var_99_0.Min or var_99_1.Min
	end

	return {
		min = var_99_2,
		max = var_99_0.Max and var_99_0.Max or var_99_1.Max,
		step = var_99_0.Step and var_99_0.Step or var_99_1.Step,
		decimalPlacesToRound = var_99_0.DecimalsToRound and var_99_0.DecimalsToRound or var_99_1.DecimalsToRound,
		pcstep = var_99_0.PCStep and var_99_0.PCStep
	}
end

local function var_0_40(arg_100_0, arg_100_1)
	if type(arg_100_0.disabled) ~= "function" then
		return arg_100_0.disabled
	else
		return arg_100_0.disabled(arg_100_1)
	end
end

function OPTIONS.GetOptionValueFromValueGetter(arg_101_0, arg_101_1)
	local var_101_0 = false

	if arg_101_1.type == "CyclingList" or arg_101_1.type == "Dropdown" then
		var_101_0 = true
	end

	local var_101_1 = var_0_36(arg_101_1, arg_101_0, var_101_0)
	local var_101_2

	if type(var_101_1) == "function" then
		var_101_2 = var_101_1()
	end

	return var_101_2
end

function OPTIONS.GetUniformOptionData(arg_102_0, arg_102_1, arg_102_2)
	return {
		id = arg_102_0.id,
		buttonHeight = arg_102_0.buttonHeight,
		hover = arg_102_0.hover,
		customPreviewButtonAction = arg_102_0.customPreviewButtonAction,
		applyable = var_0_28(arg_102_0, arg_102_1),
		name = var_0_30(arg_102_0, arg_102_1),
		description = var_0_31(arg_102_0, arg_102_1),
		defaultValueGetter = var_0_38(arg_102_0, arg_102_1, arg_102_2),
		valueGetter = var_0_36(arg_102_0, arg_102_1, arg_102_2),
		valueSetter = var_0_35(arg_102_0, arg_102_1, arg_102_2),
		onRefresh = var_0_33(arg_102_0, arg_102_1),
		onReset = var_0_34(arg_102_0, arg_102_1),
		onDependencyParentRefresh = var_0_32(arg_102_0, arg_102_1),
		optionsList = var_0_27(arg_102_0, arg_102_1),
		bounds = var_0_39(arg_102_0, arg_102_1),
		disabled = var_0_40(arg_102_0, arg_102_1),
		resettable = var_0_29(arg_102_0, arg_102_1)
	}
end

function OPTIONS.BuildGenericButton(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	local var_103_0 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = arg_103_3
	})

	var_103_0.id = arg_103_0

	var_103_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0)

	var_103_0.buttonDescription = Engine.CBBHFCGDIC(arg_103_2)

	var_103_0.Text:setText(Engine.CBBHFCGDIC(arg_103_1), 0)
	var_103_0.Text:SetAlignment(LUI.Alignment.Left)

	return var_103_0
end

function OPTIONS.BuildGenericDualLabelButton(arg_104_0, arg_104_1, arg_104_2, arg_104_3, arg_104_4)
	local var_104_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_104_4
	})

	var_104_0.id = arg_104_0

	var_104_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)

	var_104_0.buttonDescription = Engine.CBBHFCGDIC(arg_104_3)

	var_104_0.Text:setText(Engine.CBBHFCGDIC(arg_104_1), 0)
	var_104_0.Text:SetAlignment(LUI.Alignment.Left)
	var_104_0.DynamicText:setText(Engine.CBBHFCGDIC(arg_104_2), 0)

	return var_104_0
end

function OPTIONS.BuildGenericCyclingList(arg_105_0, arg_105_1)
	local var_105_0 = MenuBuilder.BuildRegisteredType("GenericCycleList", {
		controllerIndex = arg_105_0,
		needMoreInfoInnerButton = arg_105_1.customPreviewButtonAction
	})
	local var_105_1 = arg_105_1.valueGetter(arg_105_0)
	local var_105_2 = arg_105_1.optionsList[var_105_1]
	local var_105_3 = 50

	var_105_0.id = arg_105_1.id

	if arg_105_1.buttonHeight then
		var_105_3 = arg_105_1.buttonHeight
	end

	local var_105_4 = "\n --- cycleListID: " .. tostring(var_105_0.id) .. "\n ---- name :" .. tostring(arg_105_1.name) .. "\n ---- desc :" .. tostring(arg_105_1.desc) .. "\n ---- currentValue :" .. tostring(var_105_1) .. "\n ---- currentValueLabel :" .. tostring(var_105_2)

	if not arg_105_1.name then
		DebugPrint("ERROR: OptionsUtils.lua -> BuildGenericCyclingList: uniformOptionData.name is nil...Printing Debug Data:")
		DebugPrint(var_105_4)
	end

	if not var_105_2 then
		DebugPrint("ERROR: OptionsUtils.lua -> BuildGenericCyclingList: currentValueLabel is nil...Printing Debug Data:")
		DebugPrint("Valid labels are expected, so please check options.csv and verify that the 'labels' column is populated with desired data")
		DebugPrint(var_105_4)
	end

	var_105_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * var_105_3, 0)

	var_105_0.buttonDescription = arg_105_1.description

	var_105_0.GenericOptionButtonBase.Title:setText(arg_105_1.name, 0)
	var_105_0.Text:setText(var_105_2)
	var_105_0:UpdatePip(var_105_1, #arg_105_1.optionsList)

	local var_105_5 = {
		clickRepeatDisabled = true,
		labels = arg_105_1.optionsList,
		defaultValueGetter = arg_105_1.defaultValueGetter,
		valueGetter = arg_105_1.valueGetter,
		onRefresh = arg_105_1.onRefresh,
		onReset = arg_105_1.onReset,
		applyable = arg_105_1.applyable,
		onDependencyParentRefresh = arg_105_1.onDependencyParentRefresh,
		action = function(arg_106_0, arg_106_1, arg_106_2)
			arg_105_1.valueSetter(var_105_0, arg_106_1, arg_106_0)
		end,
		wrapAround = arg_105_1.wrapAround,
		resettable = arg_105_1.resettable
	}

	LUI.AddUIArrowTextButtonLogic(var_105_0, arg_105_0, var_105_5)
	var_105_0:addEventHandler("button_action", function(arg_107_0, arg_107_1)
		if not var_105_0.ArrowLeft:isInFocus() and not var_105_0.ArrowRight:isInFocus() and (arg_107_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST")) and arg_107_1.keyboard then
			if arg_107_0.currentValue == arg_107_0.max then
				arg_107_0:SetCurrentValue(arg_107_0.min)
			else
				arg_107_0:SetCurrentValue(arg_107_0.currentValue + 1)
			end
		end
	end)

	return var_105_0
end

function OPTIONS.BuildGenericDropdown(arg_108_0, arg_108_1)
	local var_108_0 = MenuBuilder.BuildRegisteredType("GenericDropdownButton", {
		controllerIndex = arg_108_0,
		needMoreInfoInnerButton = arg_108_1.customPreviewButtonAction
	})
	local var_108_1 = arg_108_1.valueGetter(arg_108_0)
	local var_108_2 = {
		buttonType = "GenericInnerButton",
		selectedValueAnimation = "Selected",
		buttonListType = "GenericDropdownListButton",
		parent = arg_108_1.parent,
		labels = arg_108_1.optionsList,
		action = function(arg_109_0, arg_109_1, arg_109_2)
			arg_108_1.valueSetter(arg_109_0, arg_109_2, arg_109_1.index)
		end,
		applyable = arg_108_1.applyable,
		defaultValue = var_108_1,
		defaultValueGetter = arg_108_1.defaultValueGetter,
		valueGetter = arg_108_1.valueGetter,
		onRefresh = arg_108_1.onRefresh,
		onReset = arg_108_1.onReset,
		onDependencyParentRefresh = arg_108_1.onDependencyParentRefresh,
		alwaysShowDefault = arg_108_1.alwaysShowDefault
	}

	var_108_0.Dropdown:SetupButtonData(arg_108_0, var_108_2)

	if var_108_0.GenericOptionButtonBase.Title then
		var_108_0.GenericOptionButtonBase.Title:setText(arg_108_1.name)
	end

	return var_108_0
end

function OPTIONS.BuildGenericSliderBarWithEditBox(arg_110_0, arg_110_1)
	local var_110_0 = MenuBuilder.BuildRegisteredType("GenericSliderWithEditBox", {
		controllerIndex = arg_110_0,
		needMoreInfoInnerButton = arg_110_1.customPreviewButtonAction
	})
	local var_110_1 = {
		name = arg_110_1.name,
		action = function(arg_111_0, arg_111_1, arg_111_2)
			arg_110_1.valueSetter(var_110_0, arg_111_2, arg_111_0)

			if var_110_0:isInFocus() and not var_110_0:IsActive() then
				var_110_0:dispatchEventToParent({
					name = "request_active",
					target = var_110_0
				})
			end
		end,
		applyable = arg_110_1.applyable,
		defaultValue = arg_110_1.valueGetter(arg_110_0),
		valueGetter = arg_110_1.valueGetter,
		defaultValueGetter = arg_110_1.defaultValueGetter,
		onRefresh = arg_110_1.onRefresh,
		onReset = arg_110_1.onReset,
		onDependencyParentRefresh = arg_110_1.onDependencyParentRefresh,
		max = arg_110_1.bounds.max,
		min = arg_110_1.bounds.min,
		step = arg_110_1.bounds.step,
		pcstep = arg_110_1.bounds.pcstep,
		decimalPlacesToRound = arg_110_1.bounds.decimalPlacesToRound,
		fillElement = var_110_0.GenericFillBar.Fill,
		textSelectionColor = {
			g = 100,
			a = 255,
			b = 100,
			r = 96
		}
	}

	LUI.AddSliderWithEditBoxLogic(var_110_0, arg_110_0, var_110_1)
	var_110_0:addEventHandler("button_action", function(arg_112_0, arg_112_1)
		if not arg_112_0:IsActive() then
			arg_112_0:dispatchEventToParent({
				name = "request_active",
				target = arg_112_0,
				controller = arg_110_0
			})

			if arg_112_0:IsActive() then
				return true
			end
		end
	end)

	if arg_110_1.focusAction then
		var_110_0:addEventHandler("button_over", function(arg_113_0, arg_113_1)
			arg_110_1.focusAction(self, arg_113_0)
		end)
	end

	return var_110_0
end

function OPTIONS.GetMixPresets()
	return {
		{
			value = 1,
			label = "LUA_MENU/FLAT",
			image = "image_options_audio_nocompression",
			description = "LUA_MENU/FLAT_DESCRIPTION"
		},
		{
			value = 6,
			label = "LUA_MENU/THEATRICAL",
			image = "image_options_audio_theatrical",
			description = "LUA_MENU/THEATRICAL_DESCRIPTION"
		},
		{
			value = 0,
			label = "LUA_MENU/IW_MIX",
			image = "image_options_audio_iwmix",
			description = "LUA_MENU/IW_MIX_DESCRIPTION"
		},
		{
			value = 5,
			label = "LUA_MENU/MIDNIGHT_MODE",
			image = "image_options_audio_midnightmode",
			description = "LUA_MENU/MIDNIGHT_MODE_DESCRIPTION"
		},
		{
			value = 2,
			label = "LUA_MENU/HEADPHONES_1",
			image = "image_options_audio_headphones1",
			description = "LUA_MENU/HEADPHONES_1_DESCRIPTION"
		},
		{
			value = 3,
			label = "LUA_MENU/HEADPHONES_2",
			image = "image_options_audio_headphones2",
			description = "LUA_MENU/HEADPHONES_2_DESCRIPTION"
		},
		{
			value = 4,
			label = "LUA_MENU/HEADPHONES_3",
			image = "image_options_audio_headphones3",
			description = "LUA_MENU/HEADPHONES_3_DESCRIPTION"
		}
	}
end

function OPTIONS.GetHitMarkerPresets()
	return {
		{
			value = "hit_marker_none",
			label = "MENU/NONE",
			image = "image_options_audio_nocompression",
			description = "MENU/HIT_MARKER_NONE_DESC"
		},
		{
			description = "MENU/HIT_MARKER_CLASSIC_DESC",
			label = "MENU/CLASSIC",
			soundTest = "ui_hitmarker_classic",
			value = "hit_marker_classic",
			image = "image_options_audio_theatrical"
		},
		{
			description = "MENU/HIT_MARKER_MW_DESC",
			label = "MENU/MW",
			soundTest = "ui_hitmarker_mw",
			value = "hit_marker_3d",
			image = "image_options_audio_iwmix"
		}
	}
end

function OPTIONS.GetCurrentAudioMixPreset()
	local var_116_0 = OPTIONS.GetMixPresets()
	local var_116_1 = Dvar.CFHDGABACF("PTKLRRLLQ")

	for iter_116_0 = 1, #var_116_0 do
		if var_116_0[iter_116_0].value == var_116_1 then
			return var_116_1, iter_116_0
		end
	end

	return 0, 3
end

function OPTIONS.GetCurrentHitMarkerPreset(arg_117_0)
	local var_117_0 = OPTIONS.GetHitMarkerPresets()
	local var_117_1 = Engine.BECCFCBIAA("sndHitMarkerAlias", arg_117_0)

	for iter_117_0 = 1, #var_117_0 do
		if var_117_0[iter_117_0].value == var_117_1 then
			return var_117_1, iter_117_0
		end
	end

	return var_117_0[3], 3
end

function OPTIONS.GetGunsmithDebugButton(arg_118_0, arg_118_1)
	local function var_118_0(arg_119_0)
		local var_119_0 = arg_119_0 == 2 and "1" or "0"

		Engine.DAGFFDGFII("set display_gunsmith_debug " .. var_119_0)
	end

	local var_118_1 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_118_1
	})

	var_118_1.id = "GunsmithDebug"

	var_118_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_118_0, 0)

	var_118_1.buttonDescription = "If enabled Dpad left will expand the Gunsmith Debug menu."

	var_118_1.Title:setText("GUNSMITH DEBUG", 0)

	local var_118_2 = Dvar.IBEGCHEFE("display_gunsmith_debug")
	local var_118_3 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_118_0,
		defaultValue = var_118_2 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(var_118_1, arg_118_1, var_118_3)

	return var_118_1
end

local function var_0_41(arg_120_0)
	return not not string.find(arg_120_0, " ") or not string.find(arg_120_0, "/")
end

function OPTIONS.InitOptionsList(arg_121_0, arg_121_1)
	local var_121_0 = CSV.options
	local var_121_1 = StringTable.BFHCAIIDA(var_121_0.file)
	local var_121_2 = {}
	local var_121_3 = not Engine.CAADCDEEIA() and not Engine.EAAHGICFBD() and not Engine.EAIICIFIFA()
	local var_121_4 = Engine.DBFFAEEFGJ()

	if var_121_4 and var_121_4.flowManager and var_121_4.flowManager:AreMainMenuFencedOut() then
		var_121_3 = true
	end

	for iter_121_0 = 0, var_121_1 - 1 do
		local var_121_5 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.identifier)
		local var_121_6 = {
			id = var_121_5,
			type = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.type),
			name = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.name),
			description = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.description),
			sliderDataName = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.sliderDataName),
			image = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.image),
			isPCOnly = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.isPCOnly) == "Y",
			isConsoleOnly = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.isConsoleOnly) == "Y"
		}
		local var_121_7 = Engine.CGABICJHAI()

		if (var_121_7 or not var_121_6.isPCOnly) and (not var_121_7 or not var_121_6.isConsoleOnly) then
			if var_121_6.type ~= "Expander" and not var_0_41(var_121_6.name) then
				var_121_6.name = Engine.CBBHFCGDIC(var_121_6.name)
			end

			if var_121_6.description ~= "" and not var_0_41(var_121_6.description) then
				var_121_6.description = Engine.CBBHFCGDIC(var_121_6.description)
			end

			local var_121_8 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.detailedPreviewImage)

			if var_121_8 ~= "" then
				var_121_6.detailedPreviewImage = var_121_8
			end

			local var_121_9 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showForSP) == "Y"
			local var_121_10 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showForMP) == "Y"
			local var_121_11 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showForCP) == "Y"
			local var_121_12 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showForBR) == "Y"
			local var_121_13 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showForCoDCaster) == "Y"
			local var_121_14

			var_121_14 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.isPCOnly) == "Y"

			local var_121_15

			var_121_15 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.isConsoleOnly) == "Y"

			local var_121_16 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.isCDLOnly) == "Y"
			local var_121_17 = true

			if var_121_0.cols.showPCApp ~= nil then
				var_121_17 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showPCApp) == "Y"
			end

			local var_121_18 = true

			if var_121_0.cols.showInGame ~= nil then
				var_121_18 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.showInGame) == "Y"
			end

			if var_121_0.cols.profileOption ~= nil then
				local var_121_19 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.profileOption)

				if var_121_19 ~= "" then
					var_121_6.profileOption = var_121_19
				end
			end

			if var_121_0.cols.dvar ~= nil then
				local var_121_20 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.dvar)

				if var_121_20 ~= "" then
					var_121_6.dvar = var_121_20
				end
			end

			if var_121_0.cols.refreshOption ~= nil then
				local var_121_21 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.refreshOption)

				if var_121_21 ~= "" then
					var_121_6.refreshOption = var_121_21
				end
			end

			if var_121_0.cols.matchEndDLogRecording ~= nil then
				local var_121_22 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.matchEndDLogRecording)

				if var_121_22 ~= "" then
					var_121_6.matchEndDLogRecording = METRICS.EndMatchDLog[var_121_22]
				end
			end

			if var_121_0.cols.labels ~= nil then
				local var_121_23 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.labels)

				if var_121_23 ~= "" then
					var_121_6.labels = {}

					local var_121_24 = LUI.Split(var_121_23, ";")

					for iter_121_1 = 1, #var_121_24 do
						var_121_6.labels[iter_121_1] = Engine.CBBHFCGDIC(var_121_24[iter_121_1])
					end
				end
			end

			if var_121_0.cols.dependencies ~= nil then
				local var_121_25 = StringTable.CBGJCDIHCE(var_121_0.file, iter_121_0, var_121_0.cols.dependencies)

				if var_121_25 ~= "" then
					var_121_6.dependencies = LUI.Split(var_121_25, ";")
				end
			end

			if OPTIONS_DATA.optionsDataList[var_121_5] then
				local var_121_26 = OPTIONS_DATA.optionsDataList[var_121_5]

				for iter_121_2, iter_121_3 in pairs(var_121_26) do
					var_121_6[iter_121_2] = iter_121_3
				end
			end

			var_121_6.optionsList = var_121_2

			local var_121_27 = not var_121_6.buildCondition or var_121_6.buildCondition(arg_121_1)
			local var_121_28 = Engine.CAADCDEEIA() and var_121_9
			local var_121_29 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and not MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_121_10
			local var_121_30 = Engine.EAIICIFIFA() and var_121_11
			local var_121_31 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_121_12
			local var_121_32 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_121_1)
			local var_121_33 = var_121_32 and var_121_13
			local var_121_34 = var_121_16 and MLG.DBIBHEAEGD()

			if (var_121_28 or var_121_29 or var_121_30 or var_121_31 or var_121_3) and (not Engine.BEFACAIFDD() or var_121_17) and (Engine.DDJFBBJAIG() or var_121_18) and (var_121_7 or not var_121_6.isPCOnly) and (not var_121_7 or not var_121_6.isConsoleOnly) and (not var_121_32 or var_121_33) and (not var_121_16 or var_121_34) and var_121_27 then
				var_121_2[var_121_6.id] = var_121_6
			end
		end
	end

	return var_121_2
end

local function var_0_42(arg_122_0, arg_122_1, arg_122_2, arg_122_3)
	assert(arg_122_1.Text)
	assert(arg_122_1.actionName)

	local var_122_0 = Engine.DCCFJEGGGE(arg_122_0, arg_122_1.inputContext, arg_122_1.actionName, arg_122_2 and 0 or 1)
	local var_122_1 = Engine.DEGABDJDH(arg_122_0, arg_122_1.inputContext, arg_122_1.actionName, arg_122_2 and 0 or 1)

	arg_122_1:SetChanged(var_122_0 ~= var_122_1 and not arg_122_3)

	if arg_122_3 and var_122_0 == "" then
		var_122_0 = "..."

		ACTIONS.AnimateSequence(arg_122_1, "Empty")
	else
		ACTIONS.AnimateSequence(arg_122_1, "ResetText")
	end

	arg_122_1.Text:setText(Engine.JCBDICCAH(var_122_0))
end

function OPTIONS.SetActiveOptionCallbackEvents(arg_123_0, arg_123_1, arg_123_2)
	local var_123_0 = arg_123_1.SetActive

	function arg_123_1.SetActive(arg_124_0, arg_124_1)
		local var_124_0 = var_123_0(arg_124_0, arg_124_1)

		arg_123_0:processEvent({
			name = arg_123_2.name .. "_over",
			showLayout = arg_123_2.showLayout,
			isBR = arg_123_2.isBR,
			showSwap = arg_123_2.showSwap
		})

		return var_124_0
	end

	local var_123_1 = arg_123_1.RemoveActive

	function arg_123_1.RemoveActive(arg_125_0, arg_125_1)
		local var_125_0 = var_123_1(arg_125_0, arg_125_1)

		arg_123_0:processEvent({
			name = arg_123_2.name .. "_up",
			showLayout = arg_123_2.showLayout
		})

		return var_125_0
	end
end

function OPTIONS.SetFocusEventHandlerForActiveState(arg_126_0, arg_126_1, arg_126_2)
	arg_126_0:addEventHandler("button_over", function(arg_127_0, arg_127_1)
		if arg_126_2.focusAction then
			arg_126_2.focusAction(arg_127_0)
		end

		arg_127_0.isDisplayed = true

		arg_127_0:dispatchEventToParent({
			name = "request_active",
			target = arg_127_0
		})
	end)
	arg_126_0:addEventHandler("button_over_disable", function(arg_128_0, arg_128_1)
		arg_128_0.isDisplayed = true

		arg_128_0:dispatchEventToParent({
			name = "request_active",
			target = arg_128_0
		})
	end)
	arg_126_0:addEventHandler("button_up", function(arg_129_0, arg_129_1)
		arg_129_0.isDisplayed = false
	end)
end

function OPTIONS.SetUpdateButtonSelectedEventHandler(arg_130_0, arg_130_1)
	local var_130_0 = {
		"button_over_active",
		"button_over_disable_active",
		"button_active",
		"button_disable_active",
		"button_update_colorBlind"
	}

	for iter_130_0, iter_130_1 in ipairs(var_130_0) do
		arg_130_0:addEventHandler(iter_130_1, function(arg_131_0, arg_131_1)
			if arg_130_1 and arg_130_1.getSpecificImage then
				arg_131_0.buttonImage = arg_130_1.getSpecificImage(arg_131_0.buttonImage, arg_131_1.controllerIndex or Engine.IJEBHJIJF())
			end

			arg_131_0:dispatchEventToParent({
				name = "update_button_selected",
				buttonName = arg_131_0.buttonName,
				image = arg_131_0.buttonImage,
				description = arg_131_0.buttonDescription,
				disabled = arg_131_0:IsDisabled(),
				customPreviewButtonAction = arg_131_0.customPreviewButtonAction,
				detailedPreviewImage = arg_131_0.detailedPreviewImage,
				resettable = arg_130_1 and not arg_130_1.applyable or nil,
				type = arg_130_1 and arg_130_1.type or nil,
				previewOption = arg_131_0
			})
		end)
	end
end

function OPTIONS.IsCurrentTabGraphics(arg_132_0)
	local var_132_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_132_0)
	local var_132_1 = 2

	return CONDITIONS.IsPC() and var_132_0.activeTabIndex == var_132_1
end

local function var_0_43(arg_133_0, arg_133_1, arg_133_2)
	if arg_133_0.AddTooltipData then
		local function var_133_0()
			return not arg_133_0.MoreInfoButton or not arg_133_0.MoreInfoButton:isInFocus() or arg_133_0.IsDisabled and arg_133_0:IsDisabled()
		end

		local function var_133_1()
			if arg_133_0.MoreInfoButton and arg_133_0.MoreInfoButton:isInFocus() or arg_133_0.IsDisabled and arg_133_0:IsDisabled() or OPTIONS.IsCurrentTabGraphics(arg_133_2) then
				return true
			end

			if arg_133_1 and arg_133_2 then
				local var_135_0 = arg_133_1.valueGetter(arg_133_2)
				local var_135_1 = arg_133_1.defaultValueGetter(arg_133_2)

				if type(var_135_0) == "number" then
					return math.abs(var_135_0 - var_135_1) < 0.001
				end

				return var_135_0 == var_135_1
			else
				return true
			end
		end

		local var_133_2 = {
			{
				button_ref = "button_r3",
				keyprompt_text = "[{ui_r3}]",
				helper_text = Engine.CBBHFCGDIC("MENU/MORE_INFO"),
				disabledFunction = var_133_0
			},
			{
				button_ref = "button_keybind_reset",
				keyprompt_text = "[{menu_action2}]",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
				disabledFunction = var_133_1
			}
		}
		local var_133_3 = {
			promptsData = var_133_2
		}

		arg_133_0:AddTooltipData(arg_133_2, var_133_3)
	end
end

local function var_0_44(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
	arg_136_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/OPTION_ACTIONS")
	})

	local function var_136_0()
		OPTIONS.BuildDetailPreview(arg_136_0, arg_136_3)
	end

	local function var_136_1()
		if (arg_136_2.detailedPreviewImage or arg_136_2.customPreviewButtonAction) and (not arg_136_0.IsDisabled or not arg_136_0:IsDisabled()) then
			return true
		end

		return false
	end

	local var_136_2 = {
		id = "moreInfoOption",
		actionName = Engine.CBBHFCGDIC("MENU/MORE_INFO"),
		actionFunction = var_136_0,
		conditionFunction = var_136_1
	}

	arg_136_0:AddContextualMenuAction(var_136_2)

	local function var_136_3()
		if arg_136_0.IsDisabled and arg_136_0:IsDisabled() or OPTIONS.IsCurrentTabGraphics(arg_136_3) then
			return false
		elseif arg_136_1 and arg_136_3 then
			local var_139_0 = arg_136_1.valueGetter(arg_136_3)
			local var_139_1 = arg_136_1.defaultValueGetter(arg_136_3)

			if var_139_1 then
				if type(var_139_1) == "number" then
					return math.abs(var_139_0 - var_139_1) > 0.001
				end

				return var_139_0 ~= var_139_1
			else
				return false
			end
		else
			return false
		end
	end

	local function var_136_4()
		OPTIONS.ResetOptionElement(arg_136_0:GetCurrentMenu(), arg_136_3, arg_136_0, arg_136_2)
	end

	local var_136_5 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = var_136_4,
		conditionFunction = var_136_3
	}

	arg_136_0:AddContextualMenuAction(var_136_5)
end

local function var_0_45(arg_141_0, arg_141_1, arg_141_2)
	local var_141_0, var_141_1, var_141_2, var_141_3 = arg_141_0.GenericInnerButtonBackground.Background:getCurrentGlobalRect()
	local var_141_4, var_141_5, var_141_6, var_141_7 = arg_141_1:getCurrentGlobalRect()
	local var_141_8, var_141_9, var_141_10, var_141_11 = arg_141_1.OptionWindow:getCurrentGlobalRect()
	local var_141_12 = LAYOUT.GetElementHeight(arg_141_2)

	if var_141_9 > var_141_1 - var_141_12 then
		var_141_1 = var_141_3
		var_141_3 = var_141_3 + var_141_12
	else
		var_141_3 = var_141_1
		var_141_1 = var_141_1 - var_141_12
	end

	return var_141_0 - var_141_4, var_141_2 - var_141_4, var_141_1 - var_141_5, var_141_3 - var_141_5
end

local function var_0_46(arg_142_0, arg_142_1, arg_142_2)
	local var_142_0
	local var_142_1 = MenuBuilder.BuildRegisteredType("BindingLabel", {
		controllerIndex = arg_142_2
	})

	var_142_1.id = "BindingLabel"

	local var_142_2, var_142_3, var_142_4, var_142_5 = var_0_45(arg_142_0, arg_142_1, var_142_1)

	var_142_1:SetAnchorsAndPosition(0, 1, 0, 1, var_142_2, var_142_3, var_142_4, var_142_5)
	arg_142_1:addElement(var_142_1)

	arg_142_1.BindingLabel = var_142_1
end

local function var_0_47(arg_143_0, arg_143_1, arg_143_2)
	local var_143_0 = arg_143_0:GetCurrentMenu()
	local var_143_1 = arg_143_0:getParent()

	if var_143_1 then
		Engine.EAHBBDJHID(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, arg_143_2 and 0 or 1)
		var_0_42(arg_143_1, arg_143_0, arg_143_2, true)

		var_143_1._isBindingPrimary = arg_143_2

		var_0_46(arg_143_0, var_143_0, arg_143_1)
		var_143_1:dispatchEventToParent({
			name = "request_active",
			target = var_143_1
		})
		ACTIONS.AnimateSequence(var_143_1, "Binding")
		ACTIONS.AnimateSequence(arg_143_0, "Binding")
		ACTIONS.AnimateSequence(arg_143_0, "BindingLoop")
		var_143_1:processEvent({
			name = "binding"
		})
		ACTIONS.AnimateSequence(var_143_0.BindingLabel, "Binding")
		arg_143_0:dispatchEventToCurrentMenu({
			name = "binding_key"
		})

		local var_143_2 = LUI.UIRoot.GetRootForControllerIndex(arg_143_1)

		var_143_2:RemoveMouseCursor()

		var_143_2.lockedFocusStack = true
	end
end

local function var_0_48(arg_144_0, arg_144_1, arg_144_2)
	local function var_144_0(arg_145_0, arg_145_1)
		if not arg_145_1.down then
			return false
		end

		if arg_145_1.button == "unbind" or arg_145_1.qualifier == "gamepad" and arg_145_1.button == "alt1" then
			local var_145_0 = arg_145_0:getParent()

			if arg_145_0:isInFocus() then
				Engine.DABIGBHJDG(arg_144_1, arg_145_0.inputContext, arg_145_0.actionName, arg_144_2 and 0 or 1)
				arg_145_0.Text:setText("")
				var_0_42(arg_144_1, arg_145_0, arg_144_2)
				LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_144_1)

				if arg_145_0:getParent() and arg_145_0:getParent().LinkButton then
					ACTIONS.AnimateSequence(arg_145_0:getParent().LinkButton, "UnlinkKeybind")
				end
			end
		end

		return false
	end

	arg_144_0:addEventHandler("gamepad_button", var_144_0)
end

local function var_0_49(arg_146_0, arg_146_1, arg_146_2)
	Engine.CGGHDFIDAF(arg_146_1, arg_146_0.inputContext, arg_146_0.actionName, arg_146_2 and 0 or 1)

	local var_146_0 = Engine.DCCFJEGGGE(arg_146_1, arg_146_0.inputContext, arg_146_0.actionName, arg_146_2 and 0 or 1)

	arg_146_0.Text:setText(Engine.JCBDICCAH(var_146_0))
	var_0_42(arg_146_1, arg_146_0, arg_146_2)

	if arg_146_0:getParent() and arg_146_0:getParent().LinkButton then
		ACTIONS.AnimateSequence(arg_146_0:getParent().LinkButton, "LinkKeybind")
	end
end

local function var_0_50(arg_147_0, arg_147_1)
	var_0_49(arg_147_0.PrimaryKey, arg_147_1.controllerIndex, true)
	var_0_49(arg_147_0.SecondaryKey, arg_147_1.controllerIndex, false)
end

local function var_0_51(arg_148_0, arg_148_1)
	local function var_148_0()
		if arg_148_0.PrimaryKey:isInFocus() then
			return Engine.DCCFJEGGGE(arg_148_1, arg_148_0.inputContext, arg_148_0.actionName, 0) == ""
		elseif arg_148_0.SecondaryKey:isInFocus() then
			return Engine.DCCFJEGGGE(arg_148_1, arg_148_0.inputContext, arg_148_0.actionName, 1) == ""
		else
			return true
		end
	end

	local function var_148_1()
		if arg_148_0.LinkButton and arg_148_0.LinkButton:isInFocus() then
			return true
		end

		local var_150_0 = Engine.DCCFJEGGGE(arg_148_1, arg_148_0.inputContext, arg_148_0.actionName, 0)
		local var_150_1 = Engine.DEGABDJDH(arg_148_1, arg_148_0.inputContext, arg_148_0.actionName, 0)
		local var_150_2 = Engine.DCCFJEGGGE(arg_148_1, arg_148_0.inputContext, arg_148_0.actionName, 1)
		local var_150_3 = Engine.DEGABDJDH(arg_148_1, arg_148_0.inputContext, arg_148_0.actionName, 1)

		return var_150_0 == var_150_1 and var_150_2 == var_150_3
	end

	local function var_148_2()
		return not arg_148_0.LinkButton or not arg_148_0.LinkButton:isInFocus()
	end

	local var_148_3 = {
		{
			button_ref = "button_keybind_reset",
			keyprompt_text = "[{menu_action2}]",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
			disabledFunction = var_148_1
		},
		{
			kbmTooltipPromptOverload = "button_keybind_unbind",
			button_ref = "button_keybind_unbind",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNBIND"),
			disabledFunction = var_148_0
		},
		{
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/LINKER_OPTION_TOOLTIP"),
			disabledFunction = var_148_2
		}
	}
	local var_148_4 = {
		focusableChildrenRefresh = true,
		promptsData = var_148_3
	}

	arg_148_0:AddTooltipData(arg_148_1, var_148_4)
end

local function var_0_52(arg_152_0, arg_152_1)
	local function var_152_0(arg_153_0)
		local var_153_0 = Engine.DCCFJEGGGE(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, 0)
		local var_153_1 = Engine.DEGABDJDH(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, 0)
		local var_153_2 = Engine.DCCFJEGGGE(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, 1)
		local var_153_3 = Engine.DEGABDJDH(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, 1)

		return var_153_0 ~= var_153_1 or var_153_2 ~= var_153_3
	end

	arg_152_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/KEYBIND_ACTIONS")
	})

	local var_152_1 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = function()
			var_0_50(arg_152_0, {
				controllerIndex = arg_152_1
			})
		end,
		conditionFunction = function()
			return var_152_0(true)
		end
	}

	arg_152_0:AddContextualMenuAction(var_152_1)

	local function var_152_2(arg_156_0)
		return Engine.DCCFJEGGGE(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, arg_156_0 and 0 or 1) ~= ""
	end

	local function var_152_3(arg_157_0)
		Engine.DABIGBHJDG(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, arg_157_0 and 0 or 1)

		if arg_157_0 then
			arg_152_0.PrimaryKey.Text:setText("")
			var_0_42(arg_152_1, arg_152_0.PrimaryKey, true)
		else
			arg_152_0.SecondaryKey.Text:setText("")
			var_0_42(arg_152_1, arg_152_0.SecondaryKey, false)
		end

		LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_152_1)

		if arg_152_0.LinkButton then
			ACTIONS.AnimateSequence(arg_152_0.LinkButton, "UnlinkKeybind")
		end
	end

	local function var_152_4(arg_158_0)
		return Engine.DCCFJEGGGE(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, arg_158_0 and 0 or 1) ~= Engine.DEGABDJDH(arg_152_1, arg_152_0.inputContext, arg_152_0.actionName, arg_158_0 and 0 or 1)
	end

	arg_152_0.PrimaryKey:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/PRIMARY_KEY_ACTIONS")
	})

	local var_152_5 = {
		id = "unbind",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/UNBIND"),
		actionFunction = function()
			var_152_3(true)
		end,
		conditionFunction = function()
			return var_152_2(true)
		end
	}

	arg_152_0.PrimaryKey:AddContextualMenuAction(var_152_5)

	local var_152_6 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = function()
			var_0_49(arg_152_0.PrimaryKey, arg_152_1, true)
		end,
		conditionFunction = function()
			return var_152_4(true)
		end
	}

	arg_152_0.PrimaryKey:AddContextualMenuAction(var_152_6)
	arg_152_0.SecondaryKey:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/SECONDARY_KEY_ACTIONS")
	})

	local var_152_7 = {
		id = "unbind",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/UNBIND"),
		actionFunction = function()
			var_152_3(false)
		end,
		conditionFunction = function()
			return var_152_2(false)
		end
	}

	arg_152_0.SecondaryKey:AddContextualMenuAction(var_152_7)

	local var_152_8 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = function()
			var_0_49(arg_152_0.SecondaryKey, arg_152_1, false)
		end,
		conditionFunction = function()
			return var_152_4(false)
		end
	}

	arg_152_0.SecondaryKey:AddContextualMenuAction(var_152_8)
end

local function var_0_53(arg_167_0, arg_167_1)
	arg_167_1.LinkButton:addEventHandler("button_action", function(arg_168_0, arg_168_1)
		local var_168_0 = arg_168_0:getParent()

		if var_168_0 then
			if Engine.CIBAHEBCFJ(arg_167_0, var_168_0.inputContext, var_168_0.actionName) then
				Engine.EBHBCGHBJ(arg_167_0, var_168_0.inputContext, var_168_0.actionName)
				ACTIONS.AnimateSequence(arg_168_0, "UnlinkKeybind")
			else
				Engine.BJDGHFDHC(arg_167_0, var_168_0.inputContext, var_168_0.actionName)
				ACTIONS.AnimateSequence(arg_168_0, "LinkKeybind")

				local var_168_1 = Engine.DCCFJEGGGE(arg_167_0, var_168_0.inputContext, var_168_0.actionName, 0)
				local var_168_2 = Engine.DCCFJEGGGE(arg_167_0, var_168_0.inputContext, var_168_0.actionName, 1)

				var_168_0.PrimaryKey.Text:setText(Engine.JCBDICCAH(var_168_1))
				var_168_0.SecondaryKey.Text:setText(Engine.JCBDICCAH(var_168_2))
			end

			arg_168_0:dispatchEventToRoot({
				name = "options_window_refresh",
				controller = arg_167_0
			})
		end

		return true
	end)

	if Engine.CIBAHEBCFJ(arg_167_0, arg_167_1.inputContext, arg_167_1.actionName) then
		ACTIONS.AnimateSequence(arg_167_1.LinkButton, "LinkKeybind")
	else
		ACTIONS.AnimateSequence(arg_167_1.LinkButton, "UnlinkKeybind")
	end
end

local function var_0_54(arg_169_0, arg_169_1)
	local var_169_0 = hashset({
		"VEHICLE_GROUND",
		"VEHICLE_FLYING",
		"VEHICLE_AIRPLANE",
		"COMMON_BR",
		"ONFOOT_BR"
	})[arg_169_1.inputContext]
	local var_169_1 = MenuBuilder.BuildRegisteredType("GenericKeybindOption", {
		controllerIndex = arg_169_0,
		needKeybindLinkButton = var_169_0
	})
	local var_169_2 = Engine.CBBHFCGDIC(arg_169_1.stringID)

	var_169_1.id = arg_169_1.id

	var_169_1.GenericButtonBackground.Title:setText(var_169_2)

	var_169_1.buttonName = var_169_2

	if type(arg_169_1.description) == "function" then
		var_169_1.buttonDescription = arg_169_1.description()
	else
		var_169_1.buttonDescription = Engine.CBBHFCGDIC(arg_169_1.description)
	end

	var_169_1.actionName = arg_169_1.action
	var_169_1.PrimaryKey.actionName = arg_169_1.action
	var_169_1.SecondaryKey.actionName = arg_169_1.action
	var_169_1.inputContext = arg_169_1.inputContext
	var_169_1.PrimaryKey.inputContext = arg_169_1.inputContext
	var_169_1.SecondaryKey.inputContext = arg_169_1.inputContext

	local var_169_3 = Engine.DCCFJEGGGE(arg_169_0, arg_169_1.inputContext, var_169_1.actionName, 0)
	local var_169_4 = Engine.DCCFJEGGGE(arg_169_0, arg_169_1.inputContext, var_169_1.actionName, 1)

	var_169_1.PrimaryKey.Text:setText(Engine.JCBDICCAH(var_169_3))
	var_169_1.SecondaryKey.Text:setText(Engine.JCBDICCAH(var_169_4))

	if Dvar.IBEGCHEFE("LSQNRLMKST") then
		var_169_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	else
		var_169_1:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 776, 0, _1080p * 30)
	end

	var_169_1:addEventHandler("button_action", function(arg_170_0, arg_170_1)
		if arg_170_1.keyboard then
			var_0_47(var_169_1.PrimaryKey, arg_169_0, true)
		end

		return true
	end)
	var_169_1:addEventHandler("button_over", function(arg_171_0, arg_171_1)
		arg_171_0:dispatchEventToParent({
			name = "request_active",
			target = arg_171_0
		})
	end)
	var_169_1:addEventHandler("key_bound", function(arg_172_0, arg_172_1)
		if arg_172_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			local var_172_0 = arg_172_0._isBindingPrimary and arg_172_0.PrimaryKey or arg_172_0.SecondaryKey
			local var_172_1 = "BindingSuccess"
			local var_172_2 = arg_172_0:GetCurrentMenu()

			arg_172_0:dispatchEventToRoot({
				name = "options_window_refresh",
				controller = arg_169_0
			})

			if arg_172_1.invalidBinding then
				arg_172_0:dispatchEventToCurrentMenu({
					name = "key_bound_banner",
					optionName = arg_172_0.buttonName,
					binding = arg_172_1.buttonName,
					unboundCommands = arg_172_1.unboundCommands,
					inputContext = arg_172_0.inputContext,
					currentCmd = arg_172_0.actionName,
					invalidBinding = arg_172_1.invalidBinding
				})

				return
			elseif not arg_172_1.cancelBinding then
				local var_172_3 = Engine.DCCFJEGGGE(arg_169_0, arg_172_0.inputContext, arg_172_0.actionName, arg_172_0._isBindingPrimary and 0 or 1)

				var_0_42(arg_169_0, var_172_0, arg_172_0._isBindingPrimary, true)
				arg_172_0:dispatchEventToCurrentMenu({
					name = "key_bound_banner",
					optionName = arg_172_0.buttonName,
					binding = var_172_3,
					unboundCommands = arg_172_1.unboundCommands,
					inputContext = arg_172_0.inputContext,
					currentCmd = arg_172_0.actionName
				})

				if arg_172_0.LinkButton and not Engine.CIBAHEBCFJ(arg_169_0, arg_172_0.inputContext, arg_172_0.actionName) then
					ACTIONS.AnimateSequence(arg_172_0.LinkButton, "UnlinkKeybind")
				end
			else
				var_172_1 = "GainFocus"

				ACTIONS.AnimateSequence(var_172_0, "ResetText")
				arg_172_0:dispatchEventToCurrentMenu({
					name = "hide_banner"
				})
			end

			ACTIONS.AnimateSequence(var_172_0, var_172_1)

			if var_172_2.BindingLabel then
				var_172_2.BindingLabel:AnimateSequence(var_172_1)
				var_172_2.BindingLabel:closeTree()

				var_172_2.BindingLabel = nil
			end

			arg_172_0:processEvent({
				name = "button_over_active"
			})
			Engine.BJDBIAGIDA(CoD.SFX.OtherAdjust)
			var_0_13(arg_169_0, METRICS.EndMatchDLog.KEYBINDS_GAMEPLAY)

			local var_172_4 = LUI.UIRoot.GetRootForControllerIndex(arg_172_1.controller)

			var_172_4:TryAddMouseCursor()

			var_172_4.lockedFocusStack = false

			Engine.HJJJIGAC(arg_172_1.controller)
		end
	end)

	if var_169_0 then
		var_0_53(arg_169_0, var_169_1)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(var_169_1, "ShorterTitleAR")
		else
			ACTIONS.AnimateSequence(var_169_1, "ShorterTitle")
		end
	end

	var_169_1.PrimaryKey:addEventHandler("button_action", function(arg_173_0, arg_173_1)
		var_0_47(arg_173_0, arg_169_0, true)

		return true
	end)
	var_169_1.SecondaryKey:addEventHandler("button_action", function(arg_174_0, arg_174_1)
		var_0_47(arg_174_0, arg_169_0, false)

		return true
	end)
	var_169_1.PrimaryKey:addEventHandler("refresh", function(arg_175_0, arg_175_1)
		var_0_42(arg_169_0, arg_175_0, true, false)

		if arg_169_1.disabled then
			var_169_1:SetButtonDisabled(arg_169_1.disabled())
		end
	end)
	var_169_1.SecondaryKey:addEventHandler("refresh", function(arg_176_0, arg_176_1)
		var_0_42(arg_169_0, arg_176_0, false, false)

		if arg_169_1.disabled then
			var_169_1:SetButtonDisabled(arg_169_1.disabled())
		end
	end)
	var_169_1:addEventHandler("refresh", function(arg_177_0, arg_177_1)
		if arg_177_0.LinkButton then
			if Engine.CIBAHEBCFJ(arg_169_0, arg_177_0.inputContext, arg_177_0.actionName) then
				ACTIONS.AnimateSequence(arg_177_0.LinkButton, "LinkKeybind")
			else
				ACTIONS.AnimateSequence(arg_177_0.LinkButton, "UnlinkKeybind")
			end
		end
	end)
	var_169_1:registerEventHandler("reset_value", var_0_50)

	var_169_1.disableSources = {}

	var_169_1:addEventHandler("request_disable", function(arg_178_0, arg_178_1)
		local var_178_0 = arg_178_1.disableSource

		if not arg_178_1.disableSource then
			arg_178_1.disableSource = "PERMANENT"
		end

		local var_178_1 = false

		for iter_178_0, iter_178_1 in ipairs(arg_178_0.disableSources) do
			if iter_178_1 == arg_178_1.disableSource then
				if arg_178_1.disable == false then
					table.remove(arg_178_0.disableSources, iter_178_0)
				end

				var_178_1 = true

				break
			end
		end

		if not var_178_1 and arg_178_1.disable then
			table.insert(arg_178_0.disableSources, arg_178_1.disableSource)
		end

		arg_178_0:SetButtonDisabled(#arg_178_0.disableSources > 0)
	end)
	OPTIONS.SetUpdateButtonSelectedEventHandler(var_169_1, arg_169_1)
	var_0_48(var_169_1.PrimaryKey, arg_169_0, true)
	var_0_42(arg_169_0, var_169_1.PrimaryKey, true)
	var_0_48(var_169_1.SecondaryKey, arg_169_0, false)
	var_0_42(arg_169_0, var_169_1.SecondaryKey, false)
	var_0_51(var_169_1, arg_169_0)
	var_0_52(var_169_1, arg_169_0)

	if disabledFunc then
		var_169_1:SetButtonDisabled(disabledFunc())
	end

	return var_169_1
end

function OPTIONS.InitKeybindOptionsList(arg_179_0, arg_179_1, arg_179_2, arg_179_3)
	local var_179_0 = StringTable.BFHCAIIDA(arg_179_3.file)

	arg_179_0._keybindActionList = arg_179_0._keybindActionList and arg_179_0._keybindActionList or {}

	for iter_179_0 = 0, var_179_0 - 1 do
		local var_179_1 = CSV.ReadRow(arg_179_3, iter_179_0)
		local var_179_2 = OPTIONS_DATA.optionsDataList[var_179_1.identifier]
		local var_179_3 = var_179_1.showForSP == "Y"
		local var_179_4 = var_179_1.showForMP == "Y"
		local var_179_5 = var_179_1.showForCP == "Y"
		local var_179_6 = var_179_1.showForBR == "Y"
		local var_179_7 = var_179_1.showForCoDCaster == "Y"
		local var_179_8 = var_179_1.isPCOnly == "Y"
		local var_179_9 = var_179_1.isConsoleOnly == "Y"
		local var_179_10 = var_179_1.isCDLOnly == "Y"
		local var_179_11 = var_179_1.disabled == "Y"
		local var_179_12 = true

		if var_179_2 and var_179_2.buildCondition then
			var_179_12 = var_179_2.buildCondition(arg_179_1)
		end

		local var_179_13 = Engine.CGABICJHAI()
		local var_179_14 = Engine.HDGDBCJFG()
		local var_179_15 = Engine.CAADCDEEIA() and var_179_3
		local var_179_16 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and not MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_179_4
		local var_179_17 = Engine.EAIICIFIFA() and var_179_5
		local var_179_18 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_179_6
		local var_179_19 = not Engine.CAADCDEEIA() and not Engine.EAAHGICFBD() and not Engine.EAIICIFIFA()
		local var_179_20 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_179_1)
		local var_179_21 = var_179_20 and var_179_7
		local var_179_22 = var_179_10 and MLG.DBIBHEAEGD()

		if OPTIONS_DATA.optionsDataList[var_179_1.identifier] then
			local var_179_23 = OPTIONS_DATA.optionsDataList[var_179_1.identifier]

			for iter_179_1, iter_179_2 in pairs(var_179_23) do
				var_179_1[iter_179_1] = iter_179_2
			end
		end

		if var_179_12 and (var_179_15 or var_179_16 or var_179_17 or var_179_18 or var_179_19) and (not var_179_20 or var_179_21) and (not var_179_13 or not var_179_9) and (not var_179_14 or not var_179_8) and (not var_179_10 or var_179_22) then
			arg_179_2[var_179_1.identifier] = {
				type = "keyBinding",
				controllerIndex = arg_179_1,
				id = var_179_1.identifier,
				stringID = var_179_1.stringID,
				description = var_179_1.description,
				action = var_179_1.action,
				inputContext = var_179_1.inputContext,
				disabled = function()
					return var_179_11
				end
			}
			arg_179_0._keybindActionList[var_179_1.action .. var_179_1.inputContext] = var_179_1.stringID
		end
	end
end

function OPTIONS.GetOptionsDataByIdentifier(arg_181_0, arg_181_1, arg_181_2, arg_181_3, arg_181_4)
	local var_181_0 = StringTable.BFHCAIIDA(arg_181_4.file)
	local var_181_1 = {}
	local var_181_2 = type(arg_181_3) == "table"

	for iter_181_0 = 0, var_181_0 - 1 do
		local var_181_3 = StringTable.CBGJCDIHCE(arg_181_4.file, iter_181_0, arg_181_4.cols.identifier)
		local var_181_4 = arg_181_2[var_181_3]

		if var_181_2 then
			if arg_181_3[var_181_3] then
				table.insert(var_181_1, var_181_4)
			end
		elseif var_181_3 == arg_181_3 then
			return var_181_4
		end
	end

	return var_181_1
end

function OPTIONS.AddOptions(arg_182_0, arg_182_1, arg_182_2, arg_182_3, arg_182_4)
	local var_182_0 = StringTable.BFHCAIIDA(arg_182_4.file)

	for iter_182_0 = 0, var_182_0 - 1 do
		local var_182_1 = arg_182_3[StringTable.CBGJCDIHCE(arg_182_4.file, iter_182_0, arg_182_4.cols.identifier)]

		if var_182_1 then
			if var_182_1.type == "keyBinding" then
				arg_182_2[#arg_182_2 + 1] = var_0_54(arg_182_1, var_182_1)
			else
				local var_182_2 = OPTIONS.CreateOption(arg_182_0, arg_182_1, var_182_1)

				arg_182_2[#arg_182_2 + 1] = var_182_2
			end
		end
	end
end

function OPTIONS.AddOptionsToTable(arg_183_0, arg_183_1, arg_183_2, arg_183_3)
	local var_183_0 = StringTable.BFHCAIIDA(arg_183_3.file)
	local var_183_1 = {}

	for iter_183_0 = 0, var_183_0 - 1 do
		local var_183_2 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.identifier)
		local var_183_3 = {
			id = var_183_2,
			type = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.type),
			buttonHeight = tonumber(StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.buttonHeight)),
			dvar = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.dvar),
			name = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.name),
			description = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.description),
			sliderDataName = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.sliderDataName)
		}

		if var_183_3.type ~= "Expander" and not var_0_41(var_183_3.name) then
			var_183_3.name = Engine.CBBHFCGDIC(var_183_3.name)
		end

		if var_183_3.description ~= "" and not var_0_41(var_183_3.description) then
			var_183_3.description = Engine.CBBHFCGDIC(var_183_3.description)
		end

		local var_183_4 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.showForSP) == "Y"
		local var_183_5 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.showForMP) == "Y"
		local var_183_6 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.showForCP) == "Y"
		local var_183_7 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.showForCoDCaster) == "Y"
		local var_183_8 = true

		if arg_183_3.cols.showPCApp ~= nil then
			var_183_8 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.showPCApp) == "Y"
		end

		local var_183_9 = true

		if arg_183_3.cols.showInGame ~= nil then
			var_183_9 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.showInGame) == "Y"
		end

		if arg_183_3.cols.profileOption ~= nil then
			local var_183_10 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.profileOption)

			if var_183_10 ~= "" then
				var_183_3.profileOption = var_183_10
			end
		end

		if arg_183_3.cols.refreshOption ~= nil then
			local var_183_11 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.refreshOption)

			if var_183_11 ~= "" then
				var_183_3.refreshOption = var_183_11
			end
		end

		if arg_183_3.cols.labels ~= nil then
			local var_183_12 = StringTable.CBGJCDIHCE(arg_183_3.file, iter_183_0, arg_183_3.cols.labels)

			if var_183_12 ~= "" then
				var_183_3.labels = {}

				local var_183_13 = LUI.Split(var_183_12, ";")

				for iter_183_1 = 1, #var_183_13 do
					var_183_3.labels[iter_183_1] = Engine.CBBHFCGDIC(var_183_13[iter_183_1])
				end
			end
		end

		if OPTIONS_DATA.optionsDataList[var_183_2] then
			local var_183_14 = OPTIONS_DATA.optionsDataList[var_183_2]

			for iter_183_2, iter_183_3 in pairs(var_183_14) do
				var_183_3[iter_183_2] = iter_183_3
			end
		end

		var_183_3.optionsList = var_183_1

		local var_183_15 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_183_1)
		local var_183_16 = var_183_15 and var_183_7

		if (Engine.CAADCDEEIA() and var_183_4 or Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and var_183_5 or Engine.EAIICIFIFA() and var_183_6) and (not Engine.BEFACAIFDD() or var_183_8) and (not Engine.DDJFBBJAIG() or var_183_9) and (Engine.CGABICJHAI() or not isPCOnly) and (not Engine.CGABICJHAI() or not isConsoleOnly) and (not var_183_15 or var_183_16) then
			local var_183_17 = OPTIONS.CreateOption(arg_183_0, arg_183_1, var_183_3)

			arg_183_2[#arg_183_2 + 1] = var_183_17
			var_183_1[var_183_3.id] = var_183_17
		end
	end
end

local function var_0_55(arg_184_0)
	if type(arg_184_0) == "function" then
		return arg_184_0()
	else
		return arg_184_0
	end
end

local function var_0_56(arg_185_0, arg_185_1, arg_185_2)
	local var_185_0 = MenuBuilder.BuildRegisteredType("GenericOpenFullscreenButton", {
		controllerIndex = arg_185_1
	})

	if type(arg_185_2.name) == "function" then
		var_185_0.GenericOptionButtonBase.Title:setText(ToUpperCase(arg_185_2.name()))
	else
		var_185_0.GenericOptionButtonBase.Title:setText(ToUpperCase(arg_185_2.name))
	end

	var_185_0:addEventHandler("button_action", function(arg_186_0, arg_186_1)
		if arg_185_2.action then
			arg_185_2.action(arg_185_0, arg_185_1, arg_186_0, arg_186_1)
		end
	end)

	if arg_185_2.focusAction then
		var_185_0:addEventHandler("button_over", function(arg_187_0, arg_187_1)
			arg_185_2.focusAction(arg_185_0)
		end)
	end

	return var_185_0
end

local function var_0_57(arg_188_0, arg_188_1, arg_188_2)
	local var_188_0 = MenuBuilder.BuildRegisteredType("SecondaryTab", {
		controllerIndex = arg_188_1
	})

	if type(arg_188_2.name) == "function" then
		var_188_0.Text:setText(ToUpperCase(arg_188_2.name()))
	else
		var_188_0.Text:setText(ToUpperCase(arg_188_2.name))
	end

	var_188_0:addEventHandler("button_action", function(arg_189_0, arg_189_1)
		if arg_188_2.action then
			arg_188_2.action(arg_188_0, arg_188_1, arg_189_0, arg_189_1)
		end
	end)
	var_188_0:addEventHandler("button_action_disable", function(arg_190_0, arg_190_1)
		arg_190_0:dispatchEventToParent({
			name = "request_active",
			target = arg_190_0
		})
	end)

	if arg_188_2.focusAction then
		var_188_0:addEventHandler("button_over", function(arg_191_0, arg_191_1)
			arg_188_2.focusAction(arg_188_0)
		end)
	end

	return var_188_0
end

local function var_0_58(arg_192_0, arg_192_1, arg_192_2)
	local var_192_0 = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
		controllerIndex = arg_192_1
	})
	local var_192_1 = SliderBounds[arg_192_2.sliderDataName]
	local var_192_2 = 0
	local var_192_3 = 1
	local var_192_4 = 0.1
	local var_192_5 = 0.1

	if var_192_1 == nil then
		var_192_2 = Engine.GBEDAEBIH(arg_192_2.sliderDataName, arg_192_1)
		var_192_3 = Engine.ECCHEFFDFD(arg_192_2.sliderDataName, arg_192_1)
	else
		var_192_2 = var_192_1.Min
		var_192_3 = var_192_1.Max
		var_192_4 = var_192_1.Step
		var_192_5 = var_192_1.PCStep
	end

	local var_192_6 = Dvar.BJJCJHDBII(arg_192_2.dvar)

	if arg_192_2.value then
		var_192_6 = arg_192_2.value(arg_192_1)
	end

	if arg_192_2.focusAction then
		var_192_0:addEventHandler("button_over", function(arg_193_0, arg_193_1)
			arg_192_2.focusAction(arg_192_0, arg_193_0)
		end)
	end

	local var_192_7 = 2

	if arg_192_2.decimalPlacesToRound then
		var_192_7 = arg_192_2.decimalPlacesToRound
	end

	local var_192_8

	if arg_192_2.action == nil then
		function var_192_8(arg_194_0)
			Dvar.IICIFEEDC(arg_192_2.dvar, arg_194_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_192_1)
		end
	else
		var_192_8 = arg_192_2.action(arg_192_0, arg_192_1)
	end

	local var_192_9 = {
		wrapAround = false,
		decimalPlacesToRound = var_192_7,
		action = var_192_8,
		defaultValue = var_192_6,
		max = var_192_3,
		min = var_192_2,
		step = var_192_4,
		pcstep = var_192_5,
		fillElement = var_192_0.GenericFillBar.Fill
	}

	if arg_192_2.UpdateContent then
		var_192_9.UpdateContent = arg_192_2.UpdateContent
	end

	LUI.AddUIArrowFillBarButtonLogic(var_192_0, arg_192_1, var_192_9)

	return var_192_0
end

local function var_0_59(arg_195_0, arg_195_1, arg_195_2)
	local var_195_0 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_195_1
	})
	local var_195_1 = arg_195_2.value

	if type(arg_195_2.value) == "function" then
		var_195_1 = arg_195_2.value(arg_195_1)
	end

	if arg_195_2.focusAction then
		var_195_0:addEventHandler("button_over", function(arg_196_0, arg_196_1)
			arg_195_2.focusAction(arg_196_0)
		end)
	end

	local var_195_2 = {
		wrapAround = true,
		labels = var_0_55(arg_195_2.labels),
		action = arg_195_2.action,
		defaultValue = var_195_1
	}

	LUI.AddUIArrowTextButtonLogic(var_195_0, arg_195_1, var_195_2)

	return var_195_0
end

local function var_0_60(arg_197_0, arg_197_1, arg_197_2)
	local var_197_0
	local var_197_1 = MenuBuilder.BuildRegisteredType("GenericToggleButton", {
		controllerIndex = arg_197_1
	})

	if arg_197_2.value then
		if type(arg_197_2.value) == "function" then
			var_197_0 = arg_197_2.value(arg_197_1)
		else
			var_197_0 = arg_197_2.value
		end
	else
		local var_197_2 = arg_197_2.dvar

		if Dvar.EBBAIAEICC(var_197_2) == DvarTypeTable.DvarBool then
			var_197_0 = Dvar.IBEGCHEFE(var_197_2) and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		else
			var_197_0 = Dvar.CFHDGABACF(var_197_2) == 1 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end
	end

	if arg_197_2.focusAction then
		var_197_1:addEventHandler("button_over", function(arg_198_0, arg_198_1)
			arg_197_2.focusAction(arg_198_0)
		end)
	end

	if arg_197_2.action == nil then
		function arg_197_2.action(arg_199_0, arg_199_1, arg_199_2)
			local var_199_0 = arg_197_2.dvar

			if Dvar.EBBAIAEICC(var_199_0) == DvarTypeTable.DvarBool then
				Dvar.DHEGHJJJHI(var_199_0, not Dvar.IBEGCHEFE(var_199_0))
			else
				Dvar.DFIJDJFIFD(var_199_0, arg_199_2 and 1 or 0)
			end

			if arg_197_2.execCommand then
				Engine.EBIDFIDHIE(arg_197_2.execCommand)
			end
		end
	end

	local var_197_3

	if arg_197_2.dvar then
		function var_197_3(arg_200_0, arg_200_1)
			return Dvar.DBGFIDHBFC(arg_197_2.dvar)
		end
	end

	if arg_197_2.defaultOptionValue then
		var_197_3 = arg_197_2.defaultOptionValue
	end

	local var_197_4 = {
		wrapAround = true,
		labels = var_0_55(arg_197_2.labels),
		action = function(...)
			if arg_197_2.matchEndDLogRecording then
				var_0_13(arg_197_1, arg_197_2.matchEndDLogRecording)
			end

			return arg_197_2.action(...)
		end,
		defaultOptionValue = var_197_3,
		defaultValue = var_197_0
	}

	LUI.AddUIToggleButtonLogic(var_197_1, arg_197_1, var_197_4)

	return var_197_1
end

local function var_0_61(arg_202_0, arg_202_1, arg_202_2)
	local var_202_0 = OPTIONS.GetUniformOptionData(arg_202_2, arg_202_1, true)

	if arg_202_2.wrapAround ~= nil then
		var_202_0.wrapAround = arg_202_2.wrapAround
	else
		var_202_0.wrapAround = true
	end

	return OPTIONS.BuildGenericCyclingList(arg_202_1, var_202_0), false, var_202_0
end

local function var_0_62(arg_203_0, arg_203_1, arg_203_2)
	local var_203_0 = OPTIONS.GetUniformOptionData(arg_203_2, arg_203_1, true)

	if arg_203_2.alwaysShowDefault then
		var_203_0.alwaysShowDefault = arg_203_2.alwaysShowDefault
	end

	if arg_203_2.parent == nil then
		var_203_0.parent = arg_203_0:getParent()
	elseif type(arg_203_2.parent) == "function" then
		var_203_0.parent = arg_203_2.parent(arg_203_0)
	end

	return OPTIONS.BuildGenericDropdown(arg_203_1, var_203_0), false, var_203_0
end

local function var_0_63(arg_204_0, arg_204_1, arg_204_2)
	local var_204_0 = OPTIONS.GetUniformOptionData(arg_204_2, arg_204_1, false)

	return OPTIONS.BuildGenericSliderBarWithEditBox(arg_204_1, var_204_0), false, var_204_0
end

local function var_0_64(arg_205_0, arg_205_1, arg_205_2)
	local var_205_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_205_1
	})
	local var_205_1 = arg_205_2.name

	if type(arg_205_2.name) == "function" then
		var_205_1 = arg_205_2.name()
	end

	var_205_0.Text:setText(var_205_1)
	var_205_0.DynamicText:setText("")
	var_205_0:addEventHandler("button_action", function(arg_206_0, arg_206_1)
		arg_206_0:dispatchEventToParent({
			name = "request_active",
			target = arg_206_0
		})
	end)
	var_205_0:addEventHandler("button_action_disable", function(arg_207_0, arg_207_1)
		arg_207_0:dispatchEventToParent({
			name = "request_active",
			target = arg_207_0
		})
	end)

	return var_205_0
end

function OPTIONS.ResetOption(arg_208_0, arg_208_1, arg_208_2, arg_208_3)
	if arg_208_2.type == "keyBinding" then
		Engine.CGGHDFIDAF(arg_208_1, arg_208_2.inputContext, arg_208_2.action, 0)
		Engine.DCCFJEGGGE(arg_208_1, arg_208_2.inputContext, arg_208_2.action, 0)
		Engine.CGGHDFIDAF(arg_208_1, arg_208_2.inputContext, arg_208_2.action, 1)
		Engine.DCCFJEGGGE(arg_208_1, arg_208_2.inputContext, arg_208_2.action, 1)
	elseif arg_208_2.profileOption then
		if LUI.BeginsWith(arg_208_2.id, "CoDCaster_") then
			-- block empty
		else
			Engine.CJHGJHCGCD(arg_208_2.profileOption, arg_208_1)
		end
	elseif arg_208_2.dvar and arg_208_2.dvar ~= "" then
		if arg_208_2.defaultOptionValue then
			local var_208_0 = arg_208_2.defaultOptionValue(arg_208_0, arg_208_1)
			local var_208_1 = Dvar.EBBAIAEICC(arg_208_2.dvar)

			if var_208_1 == DvarTypeTable.DvarString or var_208_1 == DvarTypeTable.DvarEnum then
				Dvar.BDEHAEGHAF(arg_208_2.dvar, var_208_0)
			elseif var_208_1 == DvarTypeTable.DvarInt then
				Dvar.DFIJDJFIFD(arg_208_2.dvar, var_208_0)
			elseif var_208_1 == DvarTypeTable.DvarBool then
				if type(var_208_0 == "number") and (var_208_0 ~= OPTIONS.disableButtonOptions or true) then
					var_208_0 = true
				end

				Dvar.DHEGHJJJHI(arg_208_2.dvar, var_208_0)
			elseif var_208_1 == DvarTypeTable.DvarFloat then
				Dvar.IICIFEEDC(arg_208_2.dvar, var_208_0)
			end

			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_208_1)
		else
			Dvar.BBAICIAGH(arg_208_2.dvar)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_208_1)
		end
	elseif arg_208_2.id == "CoDCaster_TeamInfo" then
		CODCASTER.ResetTeamSettings(arg_208_1)
	end
end

function OPTIONS.GetOptionValue(arg_209_0, arg_209_1)
	if arg_209_1.type == "keyBinding" then
		return nil
	end

	if arg_209_1.value then
		return arg_209_1.value(arg_209_0, arg_209_1.profileOption or arg_209_1.dvar)
	end

	if arg_209_1.profileOption then
		if LUI.BeginsWith(rawOptionData.id, "CoDCaster_") then
			return MLG.ShoutcasterProfileVarValue(arg_209_0, arg_209_1.profileOption)
		else
			return Engine.BECCFCBIAA(arg_209_1.profileOption, arg_209_0)
		end
	end

	if arg_209_1.dvar and arg_209_1.dvar ~= "" and Dvar.DEHABCCECE(arg_209_1.dvar) then
		local var_209_0 = Dvar.EBBAIAEICC(arg_209_1.dvar)
		local var_209_1

		if var_209_0 == DvarTypeTable.DvarString or var_209_0 == DvarTypeTable.DvarEnum then
			var_209_1 = Dvar.DHEEJCCJBH(arg_209_1.dvar)
		elseif var_209_0 == DvarTypeTable.DvarInt then
			var_209_1 = Dvar.CFHDGABACF(arg_209_1.dvar)
		elseif var_209_0 == DvarTypeTable.DvarBool then
			var_209_1 = Dvar.IBEGCHEFE(arg_209_1.dvar)
		elseif var_209_0 == DvarTypeTable.DvarFloat then
			var_209_1 = Dvar.BJJCJHDBII(arg_209_1.dvar)
		end

		return var_209_1
	end
end

function OPTIONS.ResetOptionElement(arg_210_0, arg_210_1, arg_210_2, arg_210_3)
	if arg_210_3.type == "CyclingList" or arg_210_3.type == "Dropdown" or arg_210_3.type == "SliderBarWithEditBox" or arg_210_3.type == "keyBinding" then
		arg_210_2:processEvent({
			name = "reset_value",
			controllerIndex = arg_210_1
		})
	else
		OPTIONS.ResetOption(arg_210_0, arg_210_1, arg_210_3, arg_210_2)

		local var_210_0 = OPTIONS.GetOptionValue(arg_210_1, arg_210_3)

		if arg_210_3.type == "ToggleButton" then
			var_210_0 = var_210_0 == OPTIONS.disableButtonOptions.ENABLED and true or false
		end

		if var_210_0 == nil and arg_210_3.type ~= "keyBinding" then
			DebugPrint("The option " .. tostring(arg_210_3.id) .. " has an invalid default value.")

			return
		end

		if arg_210_3.type == "ToggleButton" then
			arg_210_2:SetCurrentValue(arg_210_1, var_210_0)
		elseif arg_210_3.type == "ArrowButton" then
			arg_210_2:SetCurrentValue(var_210_0)
		end
	end

	LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_210_1)
end

function OPTIONS.BuildDetailPreview(arg_211_0, arg_211_1)
	local var_211_0 = arg_211_0:GetCurrentMenu()

	if var_211_0._customPreviewButtonAction then
		LUI.FlowManager.GetScopedData(arg_211_0).alreadyLoaded = nil

		var_211_0._customPreviewButtonAction(arg_211_0, arg_211_1)
	elseif var_211_0._detailedPreviewImage then
		local var_211_1 = var_211_0.OptionName:getText()
		local var_211_2 = var_211_0.ButtonDescriptionText.Description:getText()
		local var_211_3 = var_211_0._detailedPreviewImage

		if not var_211_0.optionDetailPreview then
			local var_211_4 = MenuBuilder.BuildRegisteredType("OptionDetailPreview", {
				controllerIndex = arg_211_1,
				name = var_211_1,
				description = var_211_2,
				image = var_211_3
			})

			var_211_4.id = "optionDetailPreview"

			var_211_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
			var_211_0:addElement(var_211_4)

			var_211_0.optionDetailPreview = var_211_4
		end
	end
end

function OPTIONS.CreateOptionList(arg_212_0, arg_212_1, arg_212_2, arg_212_3)
	return function(arg_213_0, arg_213_1, arg_213_2)
		local var_213_0 = {}

		for iter_213_0, iter_213_1 in ipairs(arg_212_2) do
			local var_213_1 = arg_213_2[iter_213_1]

			if var_213_1 then
				if var_213_1.type == "keyBinding" then
					var_213_0[#var_213_0 + 1] = var_0_54(arg_213_1, var_213_1)
				elseif var_213_1.type == "SubCategory" then
					local var_213_2 = arg_212_2[iter_213_0 + 1] and arg_213_2[arg_212_2[iter_213_0 + 1]]

					if var_213_2 and var_213_2.type ~= "SubCategory" or not var_213_2 and iter_213_0 + 1 < #arg_212_2 then
						if iter_213_0 == 1 then
							var_213_1.buttonHeight = 24
						end

						var_213_0[#var_213_0 + 1] = OPTIONS.CreateOption(arg_213_0, arg_213_1, var_213_1, arg_212_3)
					end
				else
					local var_213_3 = OPTIONS.CreateOption(arg_213_0, arg_213_1, var_213_1, arg_212_3)

					if var_213_3 then
						var_213_0[#var_213_0 + 1] = var_213_3
					end
				end
			end
		end

		return var_213_0
	end
end

function OPTIONS.CreateOptionCategory(arg_214_0, arg_214_1, arg_214_2, arg_214_3, arg_214_4)
	if arg_214_2.id == "TelemetryCategory" and Engine.HDGDBCJFG() then
		return nil
	end

	local var_214_0 = {
		name = Engine.CBBHFCGDIC(arg_214_2.name)
	}
	local var_214_1 = var_0_57(arg_214_0, arg_214_1, var_214_0)

	var_214_1:addEventHandler("button_action", function(arg_215_0, arg_215_1)
		LUI.FlowManager.GetScopedData(arg_214_0).currentOptionsCategory = currentOptionsCategory

		local var_215_0 = OPTIONS.CreateOptionList(arg_214_0, arg_214_1, arg_214_2.optionsList, arg_214_4)

		arg_215_0:dispatchEventToParent({
			name = "request_active",
			target = arg_215_0
		})
		arg_214_0:processEvent({
			noFocus = false,
			name = "category_changed",
			createOptions = var_215_0,
			mouse = arg_215_1.mouse,
			index = arg_214_3
		})
	end)

	if arg_214_2.disabled then
		var_214_1:SetButtonDisabled(true)
	end

	local var_214_2, var_214_3, var_214_4, var_214_5 = var_214_1.Text:getLocalRect()
	local var_214_6 = var_214_1.Text:getText()
	local var_214_7 = var_214_1.Text:GetCurrentFont()
	local var_214_8, var_214_9, var_214_10, var_214_11 = GetTextDimensions(var_214_6, var_214_7, var_214_5 - var_214_3, nil, 1 * _1080p)
	local var_214_12 = var_214_10 - var_214_8
	local var_214_13 = 28 * _1080p
	local var_214_14 = var_214_12 * 0.15

	var_214_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_214_12 + var_214_13 - var_214_14, 0, 45 * _1080p)

	var_214_1.id = optionsCategoryName

	return var_214_1
end

local function var_0_65(arg_216_0, arg_216_1, arg_216_2)
	local var_216_0 = MenuBuilder.BuildRegisteredType("GenericExpander", {
		controllerIndex = arg_216_1
	})
	local var_216_1 = {
		expandButton = var_216_0.ExpandButton,
		replaceDummyInnerWidget = var_216_0.DummyInnerWidget,
		replaceDummyChildrenContainer = var_216_0.DummyChildrenContainer,
		childrenList = {}
	}

	for iter_216_0 in string.gmatch(arg_216_2.name, "[^;]+") do
		local var_216_2
		local var_216_3 = arg_216_2.optionsList[iter_216_0]

		if var_216_3 then
			if var_216_3.type == "keyBinding" then
				var_216_2 = var_0_54(arg_216_1, var_216_3)
			else
				var_216_2 = OPTIONS.CreateOption(arg_216_0, arg_216_1, var_216_3, arg_216_2.applyable)
			end
		end

		if var_216_2 then
			table.insert(var_216_1.childrenList, {
				element = var_216_2
			})
		end
	end

	if #var_216_1.childrenList == 1 then
		return var_216_1.childrenList[1].element, true
	end

	LUI.AddUIExpanderLogic(var_216_0, arg_216_1, var_216_1)

	return var_216_0
end

local function var_0_66(arg_217_0, arg_217_1, arg_217_2)
	local var_217_0 = MenuBuilder.BuildRegisteredType("GenericOptionSubcategoryTitle", {
		controllerIndex = arg_217_1
	})

	var_217_0.OptionSubcategory:setText(arg_217_2.name)

	return var_217_0
end

local var_0_67 = hashset({
	"Dropdown",
	"GenericButton"
})

local function var_0_68(arg_218_0, arg_218_1, arg_218_2, arg_218_3)
	if var_0_67[arg_218_3] and not arg_218_1.disabled then
		arg_218_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_218_0:RemoveButtonHelperText("button_primary", "left")
	end
end

function OPTIONS.CreateOption(arg_219_0, arg_219_1, arg_219_2, arg_219_3)
	local var_219_0

	assert(arg_219_2.type)

	arg_219_3 = arg_219_2.applyableOverride == nil and arg_219_3 or arg_219_2.applyableOverride

	local var_219_1 = {
		GenericButton = var_0_56,
		Dropdown = var_0_62,
		SliderBarWithEditBox = var_0_63,
		CyclingList = var_0_61,
		ArrowButton = var_0_59,
		SliderBar = var_0_58,
		ToggleButton = var_0_60,
		DualLabelButton = var_0_64,
		Expander = var_0_65,
		SubCategory = var_0_66,
		Custom = function()
			if arg_219_2.action then
				local var_220_0 = arg_219_2.action(arg_219_0, arg_219_1)

				OPTIONS.SetFocusEventHandlerForActiveState(var_220_0, arg_219_1, arg_219_2)

				return var_220_0
			end
		end
	}

	if arg_219_2.hideOption then
		local var_219_2 = arg_219_2.hideOption

		if type(arg_219_2.hideOption) == "function" then
			var_219_2 = arg_219_2.hideOption(arg_219_1)
		end

		if var_219_2 then
			return nil
		end
	end

	if arg_219_2.dvar and not Dvar.DEHABCCECE(arg_219_2.dvar) then
		return nil
	end

	if arg_219_2.profileOption then
		if LUI.BeginsWith(arg_219_2.id, "CoDCaster_") then
			if MLG.ShoutcasterProfileVarValue(arg_219_1, arg_219_2.profileOption) == nil then
				return nil
			end
		elseif Engine.BECCFCBIAA(arg_219_2.profileOption, arg_219_1) == nil then
			return nil
		end
	end

	arg_219_2.applyable = arg_219_3 == true or arg_219_2.applyable

	local var_219_3 = var_219_1[arg_219_2.type]

	assert(var_219_3, "No createFunction found for option data type: " .. arg_219_2.type)

	local var_219_4, var_219_5, var_219_6 = var_219_3(arg_219_0, arg_219_1, arg_219_2)

	if var_219_5 then
		return var_219_4
	end

	local var_219_7 = 50

	if arg_219_2.type == "Expander" then
		var_219_7 = 86
	elseif arg_219_2.type == "SubCategory" then
		var_219_7 = 40
	end

	if arg_219_2.buttonHeight then
		var_219_7 = arg_219_2.buttonHeight
	end

	var_219_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * var_219_7)

	var_219_4.id = arg_219_2.id

	local var_219_8

	if var_219_4.Title then
		var_219_8 = var_219_4.Title
	elseif var_219_4.GenericOptionButtonBase then
		var_219_8 = var_219_4.GenericOptionButtonBase.Title
	end

	if var_219_8 then
		local var_219_9 = arg_219_2.name

		if type(arg_219_2.name) == "function" then
			var_219_9 = arg_219_2.name()
		end

		var_219_8:setText(var_219_9)

		var_219_4.buttonName = var_219_9
	end

	local function var_219_10(arg_221_0, arg_221_1)
		if type(arg_221_1) == "function" then
			arg_221_1 = arg_221_1(var_219_4, arg_219_1)
		end

		arg_221_0.buttonDescription = arg_221_1
	end

	if arg_219_2.image then
		var_219_4.buttonImage = arg_219_2.image
	end

	if arg_219_2.updateDescriptionOnAction then
		assert(var_219_4.action, arg_219_2.type .. " doesn't handle updateDescriptionOnAction.")

		local var_219_11 = var_219_4.action
		local var_219_12 = arg_219_2.description

		function var_219_4.action(...)
			var_219_11(...)

			if var_219_4.isDisplayed then
				var_219_10(var_219_4, var_219_12)
				var_219_4:dispatchEventToCurrentMenu({
					name = "update_button_description",
					onlyText = true,
					updateOnAction = true,
					text = var_219_4.buttonDescription
				})
			end
		end
	end

	var_219_4.dvar = arg_219_2.dvar
	var_219_4.profileOption = arg_219_2.profileOption

	if arg_219_2.customPreviewButtonAction then
		var_219_4.customPreviewButtonAction = arg_219_2.customPreviewButtonAction
	end

	if arg_219_2.detailedPreviewImage then
		var_219_4.detailedPreviewImage = arg_219_2.detailedPreviewImage
	end

	OPTIONS.SetFocusEventHandlerForActiveState(var_219_4, arg_219_1, arg_219_2)
	OPTIONS.SetUpdateButtonSelectedEventHandler(var_219_4, arg_219_2)
	var_219_10(var_219_4, arg_219_2.description)

	if arg_219_2.type ~= "GenericButton" and not arg_219_3 then
		var_0_43(var_219_4, var_219_6, arg_219_1)
		var_0_44(var_219_4, var_219_6, arg_219_2, arg_219_1)
	end

	var_219_4.disableSources = {}

	var_219_4:addEventHandler("request_disable", function(arg_223_0, arg_223_1)
		local var_223_0 = arg_223_1.disableSource

		if not arg_223_1.disableSource then
			arg_223_1.disableSource = "PERMANENT"
		end

		local var_223_1 = false

		for iter_223_0, iter_223_1 in ipairs(arg_223_0.disableSources) do
			if iter_223_1 == arg_223_1.disableSource then
				if arg_223_1.disable == false then
					table.remove(arg_223_0.disableSources, iter_223_0)
				end

				var_223_1 = true

				break
			end
		end

		if not var_223_1 and arg_223_1.disable then
			table.insert(arg_223_0.disableSources, arg_223_1.disableSource)
		end

		var_219_4:SetButtonDisabled(#arg_223_0.disableSources > 0)
	end)

	if arg_219_2.disabled then
		local function var_219_13()
			if type(arg_219_2.disabled) == "function" then
				var_219_4:processEvent({
					name = "request_disable",
					disable = arg_219_2.disabled(arg_219_1)
				})
			else
				var_219_4:processEvent({
					name = "request_disable",
					disable = arg_219_2.disabled
				})
			end
		end

		var_219_13()
		var_219_4:addEventHandler("refresh", var_219_13)
	end

	if arg_219_2.specificAction then
		arg_219_2.specificAction(arg_219_0, var_219_4, arg_219_1)
	end

	var_219_4:addEventHandler("gain_focus", function(arg_225_0)
		if LUI.IsLastInputGamepad(arg_219_1) then
			var_0_68(arg_219_0, arg_225_0, arg_219_1, arg_219_2.type)
		end
	end)

	return var_219_4
end

function OPTIONS.ValueToListIndex(arg_226_0, arg_226_1)
	assert(#arg_226_0 > 0)

	for iter_226_0, iter_226_1 in ipairs(arg_226_0) do
		if arg_226_1 == iter_226_1 then
			return iter_226_0
		end
	end
end
