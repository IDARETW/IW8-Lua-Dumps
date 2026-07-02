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
		arg_19_0 = CONDITIONS.IsBRGameType()
	end

	return arg_19_0 and "gpadBRButtonsConfig" or "gpadButtonsConfig"
end

function OPTIONS.GetCurrentCSVButtonLayouts(arg_20_0)
	if arg_20_0 == nil then
		arg_20_0 = CONDITIONS.IsBRGameType()
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

function OPTIONS.CalculateViewportDimensions(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
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
		var_23_0 = LUI.Split(arg_23_2[1], "x")
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

function OPTIONS.GetBrightnessToggle(arg_31_0)
	return function(arg_32_0, arg_32_1)
		Dvar.IICIFEEDC("NMRKMSMTOO", arg_32_0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_32_1)
		arg_31_0:dispatchEventToCurrentMenu({
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

function OPTIONS.GeographicalRegionToggle(arg_34_0)
	return function(arg_35_0, arg_35_1)
		local var_35_0 = Dvar.IBEGCHEFE("MKMOPQKMPO")

		Dvar.DHEGHJJJHI("MKMOPQKMPO", not var_35_0)

		local var_35_1 = not var_35_0 and "LUA_MENU/HIDDEN" or NetworkInfo.BGJIBGHBAG()

		arg_34_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION_CAPS", var_35_1)), 0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_35_1)
	end
end

function OPTIONS.ExternalIPToggle(arg_36_0)
	return function(arg_37_0, arg_37_1)
		local var_37_0 = Dvar.IBEGCHEFE("MTSPMPOSTO")

		Dvar.DHEGHJJJHI("MTSPMPOSTO", not Dvar.IBEGCHEFE("MTSPMPOSTO"))

		local var_37_1 = not var_37_0 and "LUA_MENU/HIDDEN" or NetworkInfo.BBJBJGDIGD()

		arg_36_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS_CAPS", var_37_1)), 0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_37_1)
	end
end

function OPTIONS.InternalIPToggle(arg_38_0)
	return function(arg_39_0, arg_39_1)
		local var_39_0 = Dvar.IBEGCHEFE("SQMORMQQS")

		Dvar.DHEGHJJJHI("SQMORMQQS", not Dvar.IBEGCHEFE("SQMORMQQS"))

		local var_39_1 = not var_39_0 and "LUA_MENU/HIDDEN" or NetworkInfo.DBDIHEIEGB()

		arg_38_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS_CAPS", var_39_1)), 0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_39_1)
	end
end

function OPTIONS.ConnectionMeterToggle(arg_40_0)
	return function(arg_41_0, arg_41_1)
		Dvar.DHEGHJJJHI("OMOTRTTLNP", not Dvar.IBEGCHEFE("OMOTRTTLNP"))
		arg_40_0:processEvent({
			name = "connection_meter_toggle"
		})
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_41_1)
	end
end

function OPTIONS.ConfigureNetworkDiagnosticHiderArrowButton(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = Dvar.IBEGCHEFE(arg_42_2)
	local var_42_1 = {
		wrapAround = true,
		labels = {
			Engine.CBBHFCGDIC("LUA_MENU/HIDDEN"),
			Engine.CBBHFCGDIC("LUA_MENU/SHOWN")
		},
		action = arg_42_3(arg_42_1),
		defaultValue = var_42_0 and OPTIONS.disableButtonOptions.DISABLED or OPTIONS.disableButtonOptions.ENABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_42_1, arg_42_0, var_42_1)
end

function OPTIONS.BuildNetworkDiagnosticHiderArrowButton(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
	local var_43_0 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_43_0
	})

	var_43_0.id = "GeographicalRegion"

	var_43_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_43_2, 0)

	var_43_0.buttonDescription = arg_43_3

	var_43_0.Title:setText(arg_43_4, 0)

	return var_43_0
end

function OPTIONS.BuildNetworkDiagnosticLabelButton(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_44_0
	})

	var_44_0.id = arg_44_1

	var_44_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_44_2, 0)

	var_44_0.buttonDescription = arg_44_3

	var_44_0.Text:setText(arg_44_4, 0)
	var_44_0.DynamicText:setText("", 0)

	return var_44_0
end

local function var_0_13(arg_45_0, arg_45_1)
	local var_45_0 = Engine.BECCFCBIAA("matchEndShouldRecordDLogInt", arg_45_0)
	local var_45_1 = BitwiseOperators.bor(var_45_0, arg_45_1)

	Engine.DFJDIFJEGA("matchEndShouldRecordDLogInt", var_45_1)
end

local function var_0_14(arg_46_0, arg_46_1)
	if type(arg_46_0) == "function" then
		return arg_46_0(arg_46_1)
	else
		return arg_46_0
	end
end

local function var_0_15(arg_47_0)
	return arg_47_0 - 1
end

local function var_0_16(arg_48_0)
	return arg_48_0 - 1
end

local function var_0_17(arg_49_0)
	return arg_49_0 - 1
end

local function var_0_18(arg_50_0)
	return arg_50_0 == 2
end

local function var_0_19(arg_51_0)
	return arg_51_0 + 1
end

local function var_0_20(arg_52_0)
	return arg_52_0 + 1
end

local function var_0_21(arg_53_0)
	return math.floor(arg_53_0 + 0.5) + 1
end

local function var_0_22(arg_54_0)
	return arg_54_0 and 2 or 1
end

local function var_0_23(arg_55_0)
	local var_55_0 = type(arg_55_0)

	if var_55_0 == "number" then
		if math.floor(arg_55_0) == arg_55_0 then
			return var_0_19(arg_55_0)
		else
			return var_0_21(arg_55_0)
		end
	elseif var_55_0 == "boolean" then
		return var_0_22(arg_55_0)
	end
end

local function var_0_24(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = Dvar.EBBAIAEICC(arg_56_0)

	if arg_56_2 == true then
		if var_56_0 == DvarTypeTable.DvarInt then
			Dvar.DFIJDJFIFD(arg_56_0, var_0_15(arg_56_1))
		elseif var_56_0 == DvarTypeTable.DvarEnum then
			Dvar.DFIJDJFIFD(arg_56_0, var_0_16(arg_56_1))
		elseif var_56_0 == DvarTypeTable.DvarBool then
			Dvar.DHEGHJJJHI(arg_56_0, var_0_18(arg_56_1))
		elseif var_56_0 == DvarTypeTable.DvarFloat then
			Dvar.IICIFEEDC(arg_56_0, var_0_17(arg_56_1))
		end
	elseif var_56_0 == DvarTypeTable.DvarInt then
		Dvar.DFIJDJFIFD(arg_56_0, arg_56_1)
	elseif var_56_0 == DvarTypeTable.DvarFloat then
		Dvar.IICIFEEDC(arg_56_0, arg_56_1)
	end
end

local function var_0_25(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = Dvar.EBBAIAEICC(arg_57_0)
	local var_57_1

	if not arg_57_2 then
		if arg_57_1 == true then
			if var_57_0 == DvarTypeTable.DvarInt then
				var_57_1 = var_0_19(Dvar.CFHDGABACF(arg_57_0))
			elseif var_57_0 == DvarTypeTable.DvarEnum then
				var_57_1 = var_0_20(Dvar.CFHDGABACF(arg_57_0))
			elseif var_57_0 == DvarTypeTable.DvarBool then
				var_57_1 = var_0_22(Dvar.IBEGCHEFE(arg_57_0))
			elseif var_57_0 == DvarTypeTable.DvarFloat then
				var_57_1 = var_0_21(Dvar.BJJCJHDBII(arg_57_0))
			end
		elseif var_57_0 == DvarTypeTable.DvarInt then
			var_57_1 = Dvar.CFHDGABACF(arg_57_0)
		elseif var_57_0 == DvarTypeTable.DvarFloat then
			var_57_1 = Dvar.BJJCJHDBII(arg_57_0)
		end
	elseif var_57_0 == DvarTypeTable.DvarInt then
		var_57_1 = Dvar.CFHDGABACF(arg_57_0)
	elseif var_57_0 == DvarTypeTable.DvarBool then
		var_57_1 = Dvar.IBEGCHEFE(arg_57_0)
	elseif var_57_0 == DvarTypeTable.DvarFloat then
		var_57_1 = Dvar.BJJCJHDBII(arg_57_0)
	elseif var_57_0 == DvarTypeTable.DvarString or var_57_0 == DvarTypeTable.DvarEnum then
		var_57_1 = Dvar.DHEEJCCJBH(arg_57_0)
	end

	return var_57_1
end

local function var_0_26(arg_58_0, arg_58_1)
	local var_58_0 = Dvar.EBBAIAEICC(arg_58_0)

	if arg_58_1 == true then
		if var_58_0 == DvarTypeTable.DvarInt then
			return var_0_19(Dvar.DBGFIDHBFC(arg_58_0))
		elseif var_58_0 == DvarTypeTable.DvarEnum then
			return var_0_20(Dvar.DBGFIDHBFC(arg_58_0))
		elseif var_58_0 == DvarTypeTable.DvarBool then
			return var_0_22(Dvar.DBGFIDHBFC(arg_58_0))
		elseif var_58_0 == DvarTypeTable.DvarFloat then
			return var_0_21(Dvar.DBGFIDHBFC(arg_58_0))
		end
	elseif var_58_0 == DvarTypeTable.DvarInt then
		return Dvar.DBGFIDHBFC(arg_58_0)
	elseif var_58_0 == DvarTypeTable.DvarFloat then
		return Dvar.DBGFIDHBFC(arg_58_0)
	end
end

function OPTIONS.SetSetting(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	arg_59_3 = arg_59_3 or true

	if Dvar.DEHABCCECE(arg_59_0) then
		var_0_24(arg_59_0, arg_59_1, arg_59_3)

		return true
	elseif Engine.BECCFCBIAA(arg_59_0, arg_59_2) then
		if arg_59_3 == true then
			Engine.DFJDIFJEGA(arg_59_0, arg_59_1 - 1, arg_59_2)
		else
			Engine.DFJDIFJEGA(arg_59_0, arg_59_1, arg_59_2)
		end

		return true
	else
		return nil
	end
end

function OPTIONS.GetSetting(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	arg_60_2 = arg_60_2 == nil and true or arg_60_2

	if Dvar.DEHABCCECE(arg_60_0) then
		return var_0_25(arg_60_0, arg_60_2, arg_60_3)
	elseif Engine.BECCFCBIAA(arg_60_0, arg_60_1) ~= nil then
		local var_60_0 = Engine.BECCFCBIAA(arg_60_0, arg_60_1)

		if arg_60_2 == true then
			return var_0_23(var_60_0)
		else
			return var_60_0
		end
	else
		return nil
	end
end

function OPTIONS.GetSettingDefaultValue(arg_61_0, arg_61_1, arg_61_2)
	arg_61_2 = arg_61_2 or true

	if Dvar.DEHABCCECE(arg_61_0) then
		return var_0_26(arg_61_0, arg_61_2)
	elseif Engine.BECCFCBIAA(arg_61_0, arg_61_1) ~= nil then
		local var_61_0 = Engine.IEBBJFBE(arg_61_0)

		if arg_61_2 == true then
			return var_0_23(var_61_0)
		else
			return var_61_0
		end
	else
		return nil
	end
end

local function var_0_27(arg_62_0, arg_62_1)
	local var_62_0 = var_0_14(arg_62_0.labels, arg_62_1)

	if var_62_0 == nil then
		var_62_0 = {
			"Unavailable"
		}
	end

	return var_62_0
end

local function var_0_28(arg_63_0, arg_63_1)
	return arg_63_0.applyable == true
end

local function var_0_29(arg_64_0, arg_64_1)
	local var_64_0 = var_0_14(arg_64_0.name)

	if var_64_0 == nil then
		var_64_0 = "Unavailable"
	end

	return var_64_0
end

local function var_0_30(arg_65_0, arg_65_1)
	local var_65_0 = var_0_14(arg_65_0.description)

	if var_65_0 == nil then
		var_65_0 = "Unavailable"
	end

	return var_65_0
end

local function var_0_31(arg_66_0, arg_66_1)
	if arg_66_0.onDependencyParentRefresh then
		return arg_66_0.onDependencyParentRefresh
	else
		return function()
			return
		end
	end
end

local function var_0_32(arg_68_0, arg_68_1)
	local var_68_0

	if arg_68_0.onRefresh then
		var_68_0 = arg_68_0.onRefresh
	else
		function var_68_0()
			return
		end
	end

	return function(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
		local var_70_0 = arg_70_0:GetCurrentMenu()

		if var_70_0 then
			if arg_68_0.applyable and arg_70_3 then
				var_70_0:processEvent({
					name = "add_modified_option",
					target = arg_70_0
				})
			end

			if var_70_0.OptionsGraphicsSliderBar then
				var_70_0.OptionsGraphicsSliderBar:processEvent({
					name = "update_vram",
					changedSetting = arg_68_0.id,
					changedSettingValue = arg_70_2
				})
			end

			if var_70_0.MicLevelSliderBar then
				var_70_0.MicLevelSliderBar:processEvent({
					name = "update_config",
					changedSetting = arg_68_0.id,
					changedSettingValue = arg_70_2
				})
			end

			if arg_68_0.dependencies then
				for iter_70_0, iter_70_1 in ipairs(arg_68_0.dependencies) do
					local var_70_1 = false

					if arg_68_0.isDependencyDisabled then
						var_70_1 = arg_68_0.isDependencyDisabled(arg_70_0, arg_70_1, arg_70_2, iter_70_1)
					end

					if var_70_0.RefreshDependency then
						var_70_0:RefreshDependency(iter_70_1, var_70_1, arg_68_0.id, arg_70_2)
					end
				end
			end
		end

		var_68_0(arg_70_0, arg_70_1, arg_70_2)
	end
end

local function var_0_33(arg_71_0, arg_71_1)
	local var_71_0

	if arg_71_0.onReset then
		var_71_0 = arg_71_0.onReset
	else
		function var_71_0()
			return
		end
	end

	return function(arg_73_0, arg_73_1)
		var_71_0(arg_73_0, arg_73_1)
	end
end

local function var_0_34(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0

	if arg_74_0.action ~= nil and type(arg_74_0.action) == "function" then
		var_74_0 = arg_74_0.action
	elseif arg_74_0.dvar then
		function var_74_0(arg_75_0, arg_75_1, arg_75_2)
			var_0_24(arg_74_0.dvar, arg_75_2, arg_74_2 == true)
		end
	elseif arg_74_0.profileOption then
		if LUI.BeginsWith(arg_74_0.id, "CoDCaster_") then
			function var_74_0(arg_76_0, arg_76_1, arg_76_2)
				local var_76_0 = arg_74_2 == true and arg_76_2 - 1 or arg_76_2
				local var_76_1 = arg_74_0.profileOption

				MLG.SetShoutcasterProfileVarValue(arg_76_1, var_76_1, var_76_0)

				if not Engine.DDJFBBJAIG() then
					local var_76_2 = LUI.CodcasterLayer.GetInstance()

					if var_76_2._codCasterHUD then
						var_76_2:notifyCodcasterSettingChange(arg_74_0.profileOption, arg_76_2 - 1)
					end
				end
			end
		else
			function var_74_0(arg_77_0, arg_77_1, arg_77_2)
				local var_77_0 = arg_74_2 == true and arg_77_2 - 1 or arg_77_2

				Engine.DFJDIFJEGA(arg_74_0.profileOption, var_77_0, arg_77_1)
			end
		end
	else
		arg_74_0.disabled = true

		function var_74_0(arg_78_0, arg_78_1, arg_78_2)
			return
		end
	end

	return function(arg_79_0, arg_79_1, arg_79_2)
		var_74_0(arg_79_0, arg_79_1, arg_79_2)

		if not arg_74_0.applyable then
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_79_1)
		end

		if arg_74_0.matchEndDLogRecording then
			var_0_13(arg_79_1, arg_74_0.matchEndDLogRecording)
		end
	end
end

local function var_0_35(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0

	if type(arg_80_0.value) == "function" then
		var_80_0 = arg_80_0.value
	elseif arg_80_0.dvar then
		function var_80_0(arg_81_0)
			return var_0_25(arg_80_0.dvar, arg_80_2)
		end
	elseif arg_80_0.profileOption then
		if arg_80_2 == true then
			if LUI.BeginsWith(arg_80_0.id, "CoDCaster_") then
				function var_80_0(arg_82_0)
					local var_82_0 = arg_80_0.profileOption

					return MLG.ShoutcasterProfileVarValue(arg_82_0, arg_80_0.profileOption) + 1
				end
			else
				function var_80_0(arg_83_0)
					local var_83_0 = Engine.BECCFCBIAA(arg_80_0.profileOption, arg_83_0)

					return var_0_23(var_83_0)
				end
			end
		elseif LUI.BeginsWith(arg_80_0.id, "CoDCaster_") then
			function var_80_0(arg_84_0)
				local var_84_0 = arg_80_0.profileOption

				return MLG.ShoutcasterProfileVarValue(arg_84_0, arg_80_0.profileOption)
			end
		else
			function var_80_0(arg_85_0)
				return (Engine.BECCFCBIAA(arg_80_0.profileOption, arg_85_0))
			end
		end
	elseif arg_80_0.value ~= nil then
		if arg_80_2 == true then
			function var_80_0(arg_86_0)
				return var_0_23(arg_80_0.value)
			end
		else
			function var_80_0(arg_87_0)
				return arg_80_0.value
			end
		end
	end

	if var_80_0 == nil then
		arg_80_0.disabled = true

		function var_80_0()
			return 1
		end
	end

	return var_80_0
end

local function var_0_36(arg_89_0, arg_89_1, arg_89_2)
	local var_89_0

	if type(arg_89_0.defaultOptionValue) == "function" then
		var_89_0 = arg_89_0.defaultOptionValue
	elseif arg_89_0.dvar then
		function var_89_0(arg_90_0)
			return var_0_26(arg_89_0.dvar, arg_89_2)
		end
	elseif arg_89_0.profileOption then
		if LUI.BeginsWith(arg_89_0.id, "CoDCaster_") then
			function var_89_0(arg_91_0)
				local var_91_0 = arg_89_0.profileOption
				local var_91_1 = MLG.ShoutcasterProfileVarDefaultValue(arg_91_0, arg_89_0.profileOption)

				if var_91_1 == nil then
					var_91_1 = MLG.ShoutcasterProfileVarValue(arg_91_0, arg_89_0.profileOption)
				end

				return arg_89_2 == true and var_91_1 + 1 or var_91_1
			end
		else
			function var_89_0(arg_92_0)
				local var_92_0 = Engine.IEBBJFBE(arg_89_0.profileOption)

				return arg_89_2 == true and var_0_23(var_92_0) or var_92_0
			end
		end
	elseif arg_89_0.defaultOptionValue ~= nil then
		if arg_89_2 == true then
			function var_89_0(arg_93_0)
				return var_0_23(arg_89_0.defaultOptionValue)
			end
		else
			function var_89_0(arg_94_0)
				return arg_89_0.defaultOptionValue
			end
		end
	end

	if var_89_0 == nil then
		arg_89_0.disabled = true

		function var_89_0()
			return 1
		end
	end

	return var_89_0
end

local function var_0_37(arg_96_0, arg_96_1)
	local var_96_0 = SliderBounds[arg_96_0.sliderDataName]
	local var_96_1 = SliderBounds.DefaultSliderBounds

	if var_96_0 == nil then
		var_96_0 = var_96_1
	end

	local var_96_2 = 0

	if arg_96_0.minimumSliderBound then
		var_96_2 = arg_96_0.minimumSliderBound()
	else
		var_96_2 = var_96_0.Min or var_96_1.Min
	end

	return {
		min = var_96_2,
		max = var_96_0.Max and var_96_0.Max or var_96_1.Max,
		step = var_96_0.Step and var_96_0.Step or var_96_1.Step,
		decimalPlacesToRound = var_96_0.DecimalsToRound and var_96_0.DecimalsToRound or var_96_1.DecimalsToRound,
		pcstep = var_96_0.PCStep and var_96_0.PCStep
	}
end

local function var_0_38(arg_97_0, arg_97_1)
	if type(arg_97_0.disabled) ~= "function" then
		return arg_97_0.disabled
	else
		return arg_97_0.disabled(arg_97_1)
	end
end

function OPTIONS.GetUniformOptionData(arg_98_0, arg_98_1, arg_98_2)
	return {
		id = arg_98_0.id,
		buttonHeight = arg_98_0.buttonHeight,
		hover = arg_98_0.hover,
		customPreviewButtonAction = arg_98_0.customPreviewButtonAction,
		applyable = var_0_28(arg_98_0, arg_98_1),
		name = var_0_29(arg_98_0, arg_98_1),
		description = var_0_30(arg_98_0, arg_98_1),
		defaultValueGetter = var_0_36(arg_98_0, arg_98_1, arg_98_2),
		valueGetter = var_0_35(arg_98_0, arg_98_1, arg_98_2),
		valueSetter = var_0_34(arg_98_0, arg_98_1, arg_98_2),
		onRefresh = var_0_32(arg_98_0, arg_98_1),
		onReset = var_0_33(arg_98_0, arg_98_1),
		onDependencyParentRefresh = var_0_31(arg_98_0, arg_98_1),
		optionsList = var_0_27(arg_98_0, arg_98_1),
		bounds = var_0_37(arg_98_0, arg_98_1),
		disabled = var_0_38(arg_98_0, arg_98_1)
	}
end

function OPTIONS.BuildGenericButton(arg_99_0, arg_99_1, arg_99_2, arg_99_3)
	local var_99_0 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = arg_99_3
	})

	var_99_0.id = arg_99_0

	var_99_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0)

	var_99_0.buttonDescription = Engine.CBBHFCGDIC(arg_99_2)

	var_99_0.Text:setText(Engine.CBBHFCGDIC(arg_99_1), 0)
	var_99_0.Text:SetAlignment(LUI.Alignment.Left)

	return var_99_0
end

function OPTIONS.BuildGenericDualLabelButton(arg_100_0, arg_100_1, arg_100_2, arg_100_3, arg_100_4)
	local var_100_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_100_4
	})

	var_100_0.id = arg_100_0

	var_100_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0)

	var_100_0.buttonDescription = Engine.CBBHFCGDIC(arg_100_3)

	var_100_0.Text:setText(Engine.CBBHFCGDIC(arg_100_1), 0)
	var_100_0.Text:SetAlignment(LUI.Alignment.Left)
	var_100_0.DynamicText:setText(Engine.CBBHFCGDIC(arg_100_2), 0)

	return var_100_0
end

function OPTIONS.BuildGenericCyclingList(arg_101_0, arg_101_1)
	local var_101_0 = MenuBuilder.BuildRegisteredType("GenericCycleList", {
		controllerIndex = arg_101_0,
		needMoreInfoInnerButton = arg_101_1.customPreviewButtonAction
	})
	local var_101_1 = arg_101_1.valueGetter(arg_101_0)
	local var_101_2 = arg_101_1.optionsList[var_101_1]
	local var_101_3 = 50

	var_101_0.id = arg_101_1.id

	if arg_101_1.buttonHeight then
		var_101_3 = arg_101_1.buttonHeight
	end

	var_101_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * var_101_3, 0)

	var_101_0.buttonDescription = arg_101_1.description

	var_101_0.GenericOptionButtonBase.Title:setText(arg_101_1.name, 0)
	var_101_0.Text:setText(var_101_2)
	var_101_0:UpdatePip(var_101_1, #arg_101_1.optionsList)

	local var_101_4 = {
		wrapAround = true,
		clickRepeatDisabled = true,
		labels = arg_101_1.optionsList,
		defaultValueGetter = arg_101_1.defaultValueGetter,
		valueGetter = arg_101_1.valueGetter,
		onRefresh = arg_101_1.onRefresh,
		onReset = arg_101_1.onReset,
		applyable = arg_101_1.applyable,
		onDependencyParentRefresh = arg_101_1.onDependencyParentRefresh,
		action = function(arg_102_0, arg_102_1, arg_102_2)
			arg_101_1.valueSetter(var_101_0, arg_102_1, arg_102_0)
		end
	}

	LUI.AddUIArrowTextButtonLogic(var_101_0, arg_101_0, var_101_4)
	var_101_0:addEventHandler("button_action", function(arg_103_0, arg_103_1)
		if not var_101_0.ArrowLeft:isInFocus() and not var_101_0.ArrowRight:isInFocus() and (arg_103_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST")) and arg_103_1.keyboard then
			if arg_103_0.currentValue == arg_103_0.max then
				arg_103_0:SetCurrentValue(arg_103_0.min)
			else
				arg_103_0:SetCurrentValue(arg_103_0.currentValue + 1)
			end
		end
	end)

	return var_101_0
end

function OPTIONS.BuildGenericDropdown(arg_104_0, arg_104_1)
	local var_104_0 = MenuBuilder.BuildRegisteredType("GenericDropdownButton", {
		controllerIndex = arg_104_0,
		needMoreInfoInnerButton = arg_104_1.customPreviewButtonAction
	})
	local var_104_1 = arg_104_1.valueGetter(arg_104_0)
	local var_104_2 = {
		buttonType = "GenericInnerButton",
		selectedValueAnimation = "Selected",
		buttonListType = "GenericDropdownListButton",
		parent = arg_104_1.parent,
		labels = arg_104_1.optionsList,
		action = function(arg_105_0, arg_105_1, arg_105_2)
			arg_104_1.valueSetter(arg_105_0, arg_105_2, arg_105_1.index)
		end,
		applyable = arg_104_1.applyable,
		defaultValue = var_104_1,
		defaultValueGetter = arg_104_1.defaultValueGetter,
		valueGetter = arg_104_1.valueGetter,
		onRefresh = arg_104_1.onRefresh,
		onReset = arg_104_1.onReset,
		onDependencyParentRefresh = arg_104_1.onDependencyParentRefresh,
		alwaysShowDefault = arg_104_1.alwaysShowDefault
	}

	var_104_0.Dropdown:SetupButtonData(arg_104_0, var_104_2)

	if var_104_0.GenericOptionButtonBase.Title then
		var_104_0.GenericOptionButtonBase.Title:setText(arg_104_1.name)
	end

	return var_104_0
end

function OPTIONS.BuildGenericSliderBarWithEditBox(arg_106_0, arg_106_1)
	local var_106_0 = MenuBuilder.BuildRegisteredType("GenericSliderWithEditBox", {
		controllerIndex = arg_106_0,
		needMoreInfoInnerButton = arg_106_1.customPreviewButtonAction
	})
	local var_106_1 = {
		name = arg_106_1.name,
		action = function(arg_107_0, arg_107_1, arg_107_2)
			arg_106_1.valueSetter(var_106_0, arg_107_2, arg_107_0)

			if var_106_0:isInFocus() and not var_106_0:IsActive() then
				var_106_0:dispatchEventToParent({
					name = "request_active",
					target = var_106_0
				})
			end
		end,
		applyable = arg_106_1.applyable,
		defaultValue = arg_106_1.valueGetter(arg_106_0),
		valueGetter = arg_106_1.valueGetter,
		defaultValueGetter = arg_106_1.defaultValueGetter,
		onRefresh = arg_106_1.onRefresh,
		onReset = arg_106_1.onReset,
		onDependencyParentRefresh = arg_106_1.onDependencyParentRefresh,
		max = arg_106_1.bounds.max,
		min = arg_106_1.bounds.min,
		step = arg_106_1.bounds.step,
		pcstep = arg_106_1.bounds.pcstep,
		decimalPlacesToRound = arg_106_1.bounds.decimalPlacesToRound,
		fillElement = var_106_0.GenericFillBar.Fill,
		textSelectionColor = {
			g = 100,
			a = 255,
			b = 100,
			r = 96
		}
	}

	LUI.AddSliderWithEditBoxLogic(var_106_0, arg_106_0, var_106_1)
	var_106_0:addEventHandler("button_action", function(arg_108_0, arg_108_1)
		if not arg_108_0:IsActive() then
			arg_108_0:dispatchEventToParent({
				name = "request_active",
				target = arg_108_0,
				controller = arg_106_0
			})

			if arg_108_0:IsActive() then
				return true
			end
		end
	end)

	if arg_106_1.focusAction then
		var_106_0:addEventHandler("button_over", function(arg_109_0, arg_109_1)
			arg_106_1.focusAction(self, arg_109_0)
		end)
	end

	return var_106_0
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
	local var_112_0 = OPTIONS.GetMixPresets()
	local var_112_1 = Dvar.CFHDGABACF("PTKLRRLLQ")

	for iter_112_0 = 1, #var_112_0 do
		if var_112_0[iter_112_0].value == var_112_1 then
			return var_112_1, iter_112_0
		end
	end

	return 0, 3
end

function OPTIONS.GetCurrentHitMarkerPreset(arg_113_0)
	local var_113_0 = OPTIONS.GetHitMarkerPresets()
	local var_113_1 = Engine.BECCFCBIAA("sndHitMarkerAlias", arg_113_0)

	for iter_113_0 = 1, #var_113_0 do
		if var_113_0[iter_113_0].value == var_113_1 then
			return var_113_1, iter_113_0
		end
	end

	return var_113_0[3], 3
end

function OPTIONS.GetGunsmithDebugButton(arg_114_0, arg_114_1)
	local function var_114_0(arg_115_0)
		local var_115_0 = arg_115_0 == 2 and "1" or "0"

		Engine.DAGFFDGFII("set display_gunsmith_debug " .. var_115_0)
	end

	local var_114_1 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_114_1
	})

	var_114_1.id = "GunsmithDebug"

	var_114_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_114_0, 0)

	var_114_1.buttonDescription = "If enabled Dpad left will expand the Gunsmith Debug menu."

	var_114_1.Title:setText("GUNSMITH DEBUG", 0)

	local var_114_2 = Dvar.IBEGCHEFE("display_gunsmith_debug")
	local var_114_3 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_114_0,
		defaultValue = var_114_2 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(var_114_1, arg_114_1, var_114_3)

	return var_114_1
end

local function var_0_39(arg_116_0)
	return not not string.find(arg_116_0, " ") or not string.find(arg_116_0, "/")
end

function OPTIONS.InitOptionsList(arg_117_0, arg_117_1)
	local var_117_0 = CSV.options
	local var_117_1 = StringTable.BFHCAIIDA(var_117_0.file)
	local var_117_2 = {}
	local var_117_3 = not Engine.CAADCDEEIA() and not Engine.EAAHGICFBD() and not Engine.EAIICIFIFA()
	local var_117_4 = Engine.DBFFAEEFGJ()

	if var_117_4 and var_117_4.flowManager and var_117_4.flowManager:AreMainMenuFencedOut() then
		var_117_3 = true
	end

	for iter_117_0 = 0, var_117_1 - 1 do
		local var_117_5 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.identifier)
		local var_117_6 = {
			id = var_117_5,
			type = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.type),
			name = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.name),
			description = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.description),
			sliderDataName = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.sliderDataName),
			image = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.image),
			isPCOnly = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.isPCOnly) == "Y",
			isConsoleOnly = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.isConsoleOnly) == "Y"
		}
		local var_117_7 = Engine.CGABICJHAI()

		if (var_117_7 or not var_117_6.isPCOnly) and (not var_117_7 or not var_117_6.isConsoleOnly) then
			if var_117_6.type ~= "Expander" and not var_0_39(var_117_6.name) then
				var_117_6.name = Engine.CBBHFCGDIC(var_117_6.name)
			end

			if var_117_6.description ~= "" and not var_0_39(var_117_6.description) then
				var_117_6.description = Engine.CBBHFCGDIC(var_117_6.description)
			end

			local var_117_8 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.detailedPreviewImage)

			if var_117_8 ~= "" then
				var_117_6.detailedPreviewImage = var_117_8
			end

			local var_117_9 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showForSP) == "Y"
			local var_117_10 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showForMP) == "Y"
			local var_117_11 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showForCP) == "Y"
			local var_117_12 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showForBR) == "Y"
			local var_117_13 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showForCoDCaster) == "Y"
			local var_117_14

			var_117_14 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.isPCOnly) == "Y"

			local var_117_15

			var_117_15 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.isConsoleOnly) == "Y"

			local var_117_16 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.isCDLOnly) == "Y"
			local var_117_17 = true

			if var_117_0.cols.showPCApp ~= nil then
				var_117_17 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showPCApp) == "Y"
			end

			local var_117_18 = true

			if var_117_0.cols.showInGame ~= nil then
				var_117_18 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.showInGame) == "Y"
			end

			if var_117_0.cols.profileOption ~= nil then
				local var_117_19 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.profileOption)

				if var_117_19 ~= "" then
					var_117_6.profileOption = var_117_19
				end
			end

			if var_117_0.cols.dvar ~= nil then
				local var_117_20 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.dvar)

				if var_117_20 ~= "" then
					var_117_6.dvar = var_117_20
				end
			end

			if var_117_0.cols.refreshOption ~= nil then
				local var_117_21 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.refreshOption)

				if var_117_21 ~= "" then
					var_117_6.refreshOption = var_117_21
				end
			end

			if var_117_0.cols.matchEndDLogRecording ~= nil then
				local var_117_22 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.matchEndDLogRecording)

				if var_117_22 ~= "" then
					var_117_6.matchEndDLogRecording = METRICS.EndMatchDLog[var_117_22]
				end
			end

			if var_117_0.cols.labels ~= nil then
				local var_117_23 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.labels)

				if var_117_23 ~= "" then
					var_117_6.labels = {}

					local var_117_24 = LUI.Split(var_117_23, ";")

					for iter_117_1 = 1, #var_117_24 do
						var_117_6.labels[iter_117_1] = Engine.CBBHFCGDIC(var_117_24[iter_117_1])
					end
				end
			end

			if var_117_0.cols.dependencies ~= nil then
				local var_117_25 = StringTable.CBGJCDIHCE(var_117_0.file, iter_117_0, var_117_0.cols.dependencies)

				if var_117_25 ~= "" then
					var_117_6.dependencies = LUI.Split(var_117_25, ";")
				end
			end

			if OPTIONS_DATA.optionsDataList[var_117_5] then
				local var_117_26 = OPTIONS_DATA.optionsDataList[var_117_5]

				for iter_117_2, iter_117_3 in pairs(var_117_26) do
					var_117_6[iter_117_2] = iter_117_3
				end
			end

			var_117_6.optionsList = var_117_2

			local var_117_27 = not var_117_6.buildCondition or var_117_6.buildCondition(arg_117_1)
			local var_117_28 = Engine.CAADCDEEIA() and var_117_9
			local var_117_29 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and not MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_117_10
			local var_117_30 = Engine.EAIICIFIFA() and var_117_11
			local var_117_31 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_117_12
			local var_117_32 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_117_1)
			local var_117_33 = var_117_32 and var_117_13
			local var_117_34 = var_117_16 and MLG.DBIBHEAEGD()

			if (var_117_28 or var_117_29 or var_117_30 or var_117_31 or var_117_3) and (not Engine.BEFACAIFDD() or var_117_17) and (Engine.DDJFBBJAIG() or var_117_18) and (var_117_7 or not var_117_6.isPCOnly) and (not var_117_7 or not var_117_6.isConsoleOnly) and (not var_117_32 or var_117_33) and (not var_117_16 or var_117_34) and var_117_27 then
				var_117_2[var_117_6.id] = var_117_6
			end
		end
	end

	return var_117_2
end

local function var_0_40(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	assert(arg_118_1.Text)
	assert(arg_118_1.actionName)

	local var_118_0 = Engine.DCCFJEGGGE(arg_118_0, arg_118_1.inputContext, arg_118_1.actionName, arg_118_2 and 0 or 1)
	local var_118_1 = Engine.DEGABDJDH(arg_118_0, arg_118_1.inputContext, arg_118_1.actionName, arg_118_2 and 0 or 1)

	arg_118_1:SetChanged(var_118_0 ~= var_118_1 and not arg_118_3)

	if arg_118_3 and var_118_0 == "" then
		var_118_0 = "..."

		ACTIONS.AnimateSequence(arg_118_1, "Empty")
	else
		ACTIONS.AnimateSequence(arg_118_1, "ResetText")
	end

	arg_118_1.Text:setText(Engine.JCBDICCAH(var_118_0))
end

function OPTIONS.SetActiveOptionCallbackEvents(arg_119_0, arg_119_1, arg_119_2)
	local var_119_0 = arg_119_1.SetActive

	function arg_119_1.SetActive(arg_120_0, arg_120_1)
		local var_120_0 = var_119_0(arg_120_0, arg_120_1)

		arg_119_0:processEvent({
			name = arg_119_2.name .. "_over",
			showLayout = arg_119_2.showLayout,
			isBR = arg_119_2.isBR,
			showSwap = arg_119_2.showSwap
		})

		return var_120_0
	end

	local var_119_1 = arg_119_1.RemoveActive

	function arg_119_1.RemoveActive(arg_121_0, arg_121_1)
		local var_121_0 = var_119_1(arg_121_0, arg_121_1)

		arg_119_0:processEvent({
			name = arg_119_2.name .. "_up",
			showLayout = arg_119_2.showLayout
		})

		return var_121_0
	end
end

function OPTIONS.SetFocusEventHandlerForActiveState(arg_122_0, arg_122_1, arg_122_2)
	arg_122_0:addEventHandler("button_over", function(arg_123_0, arg_123_1)
		if arg_122_2.focusAction then
			arg_122_2.focusAction(arg_123_0)
		end

		arg_123_0.isDisplayed = true

		arg_123_0:dispatchEventToParent({
			name = "request_active",
			target = arg_123_0
		})
	end)
	arg_122_0:addEventHandler("button_over_disable", function(arg_124_0, arg_124_1)
		arg_124_0.isDisplayed = true

		arg_124_0:dispatchEventToParent({
			name = "request_active",
			target = arg_124_0
		})
	end)
	arg_122_0:addEventHandler("button_up", function(arg_125_0, arg_125_1)
		arg_125_0.isDisplayed = false
	end)
end

function OPTIONS.SetActiveEventHandler(arg_126_0, arg_126_1)
	local var_126_0 = {
		"button_over_active",
		"button_over_disable_active",
		"button_active",
		"button_disable_active"
	}

	for iter_126_0, iter_126_1 in ipairs(var_126_0) do
		arg_126_0:addEventHandler(iter_126_1, function(arg_127_0, arg_127_1)
			if arg_127_0.GetSpecificImage then
				arg_127_0.buttonImage = arg_127_0.GetSpecificImage(arg_127_0.buttonImage)
			end

			arg_127_0:dispatchEventToParent({
				name = "update_button_selected",
				buttonName = arg_127_0.buttonName,
				image = arg_127_0.buttonImage,
				description = arg_127_0.buttonDescription,
				disabled = arg_127_0:IsDisabled(),
				customPreviewButtonAction = arg_127_0.customPreviewButtonAction,
				detailedPreviewImage = arg_127_0.detailedPreviewImage,
				resettable = arg_126_1 and not arg_126_1.applyable or nil,
				type = arg_126_1 and arg_126_1.type or nil,
				previewOption = arg_127_0
			})
		end)
	end
end

local function var_0_41(arg_128_0, arg_128_1, arg_128_2)
	if arg_128_0.AddTooltipData then
		local function var_128_0()
			return not arg_128_0.MoreInfoButton or not arg_128_0.MoreInfoButton:isInFocus() or arg_128_0.IsDisabled and arg_128_0:IsDisabled()
		end

		local function var_128_1()
			if arg_128_0.MoreInfoButton and arg_128_0.MoreInfoButton:isInFocus() or arg_128_0.IsDisabled and arg_128_0:IsDisabled() then
				return true
			end

			if arg_128_1 and arg_128_2 then
				local var_130_0 = arg_128_1.valueGetter(arg_128_2)
				local var_130_1 = arg_128_1.defaultValueGetter(arg_128_2)

				if type(var_130_0) == "number" then
					return math.abs(var_130_0 - var_130_1) < 0.001
				end

				return var_130_0 == var_130_1
			else
				return true
			end
		end

		local var_128_2 = {
			{
				button_ref = "button_r3",
				keyprompt_text = "[{ui_r3}]",
				helper_text = Engine.CBBHFCGDIC("MENU/MORE_INFO"),
				disabledFunction = var_128_0
			},
			{
				button_ref = "button_keybind_reset",
				keyprompt_text = "[{menu_action2}]",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
				disabledFunction = var_128_1
			}
		}
		local var_128_3 = {
			promptsData = var_128_2
		}

		arg_128_0:AddTooltipData(arg_128_2, var_128_3)
	end
end

local function var_0_42(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	arg_131_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/OPTION_ACTIONS")
	})

	local function var_131_0()
		OPTIONS.BuildDetailPreview(arg_131_0, arg_131_3)
	end

	local function var_131_1()
		if (arg_131_2.detailedPreviewImage or arg_131_2.customPreviewButtonAction) and (not arg_131_0.IsDisabled or not arg_131_0:IsDisabled()) then
			return true
		end

		return false
	end

	local var_131_2 = {
		id = "moreInfoOption",
		actionName = Engine.CBBHFCGDIC("MENU/MORE_INFO"),
		actionFunction = var_131_0,
		conditionFunction = var_131_1
	}

	arg_131_0:AddContextualMenuAction(var_131_2)

	local function var_131_3()
		if arg_131_0.IsDisabled and arg_131_0:IsDisabled() then
			return false
		elseif arg_131_1 and arg_131_3 then
			local var_134_0 = arg_131_1.valueGetter(arg_131_3)
			local var_134_1 = arg_131_1.defaultValueGetter(arg_131_3)

			if var_134_1 then
				if type(var_134_1) == "number" then
					return math.abs(var_134_0 - var_134_1) > 0.001
				end

				return var_134_0 ~= var_134_1
			else
				return false
			end
		else
			return false
		end
	end

	local function var_131_4()
		OPTIONS.ResetOptionElement(arg_131_0:GetCurrentMenu(), arg_131_3, arg_131_0, arg_131_2)
	end

	local var_131_5 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = var_131_4,
		conditionFunction = var_131_3
	}

	arg_131_0:AddContextualMenuAction(var_131_5)
end

local function var_0_43(arg_136_0, arg_136_1, arg_136_2)
	local var_136_0, var_136_1, var_136_2, var_136_3 = arg_136_0.GenericInnerButtonBackground.Background:getCurrentGlobalRect()
	local var_136_4, var_136_5, var_136_6, var_136_7 = arg_136_1:getCurrentGlobalRect()
	local var_136_8, var_136_9, var_136_10, var_136_11 = arg_136_1.OptionWindow:getCurrentGlobalRect()
	local var_136_12 = LAYOUT.GetElementHeight(arg_136_2)

	if var_136_9 > var_136_1 - var_136_12 then
		var_136_1 = var_136_3
		var_136_3 = var_136_3 + var_136_12
	else
		var_136_3 = var_136_1
		var_136_1 = var_136_1 - var_136_12
	end

	return var_136_0 - var_136_4, var_136_2 - var_136_4, var_136_1 - var_136_5, var_136_3 - var_136_5
end

local function var_0_44(arg_137_0, arg_137_1, arg_137_2)
	local var_137_0
	local var_137_1 = MenuBuilder.BuildRegisteredType("BindingLabel", {
		controllerIndex = arg_137_2
	})

	var_137_1.id = "BindingLabel"

	local var_137_2, var_137_3, var_137_4, var_137_5 = var_0_43(arg_137_0, arg_137_1, var_137_1)

	var_137_1:SetAnchorsAndPosition(0, 1, 0, 1, var_137_2, var_137_3, var_137_4, var_137_5)
	arg_137_1:addElement(var_137_1)

	arg_137_1.BindingLabel = var_137_1
end

local function var_0_45(arg_138_0, arg_138_1, arg_138_2)
	local var_138_0 = arg_138_0:GetCurrentMenu()
	local var_138_1 = arg_138_0:getParent()

	if var_138_1 then
		Engine.EAHBBDJHID(arg_138_1, arg_138_0.inputContext, arg_138_0.actionName, arg_138_2 and 0 or 1)
		var_0_40(arg_138_1, arg_138_0, arg_138_2, true)

		var_138_1._isBindingPrimary = arg_138_2

		var_0_44(arg_138_0, var_138_0, arg_138_1)
		var_138_1:dispatchEventToParent({
			name = "request_active",
			target = var_138_1
		})
		ACTIONS.AnimateSequence(var_138_1, "Binding")
		ACTIONS.AnimateSequence(arg_138_0, "Binding")
		ACTIONS.AnimateSequence(arg_138_0, "BindingLoop")
		var_138_1:processEvent({
			name = "binding"
		})
		ACTIONS.AnimateSequence(var_138_0.BindingLabel, "Binding")
		arg_138_0:dispatchEventToCurrentMenu({
			name = "binding_key"
		})

		local var_138_2 = LUI.UIRoot.GetRootForControllerIndex(arg_138_1)

		var_138_2:RemoveMouseCursor()

		var_138_2.lockedFocusStack = true
	end
end

local function var_0_46(arg_139_0, arg_139_1, arg_139_2)
	local function var_139_0(arg_140_0, arg_140_1)
		if not arg_140_1.down then
			return false
		end

		if arg_140_1.button == "unbind" or arg_140_1.qualifier == "gamepad" and arg_140_1.button == "alt1" then
			local var_140_0 = arg_140_0:getParent()

			if arg_140_0:isInFocus() then
				Engine.DABIGBHJDG(arg_139_1, arg_140_0.inputContext, arg_140_0.actionName, arg_139_2 and 0 or 1)
				arg_140_0.Text:setText("")
				var_0_40(arg_139_1, arg_140_0, arg_139_2)
				LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_139_1)

				if arg_140_0:getParent() and arg_140_0:getParent().LinkButton then
					ACTIONS.AnimateSequence(arg_140_0:getParent().LinkButton, "UnlinkKeybind")
				end
			end
		end

		return false
	end

	arg_139_0:addEventHandler("gamepad_button", var_139_0)
end

local function var_0_47(arg_141_0, arg_141_1, arg_141_2)
	Engine.CGGHDFIDAF(arg_141_1, arg_141_0.inputContext, arg_141_0.actionName, arg_141_2 and 0 or 1)

	local var_141_0 = Engine.DCCFJEGGGE(arg_141_1, arg_141_0.inputContext, arg_141_0.actionName, arg_141_2 and 0 or 1)

	arg_141_0.Text:setText(Engine.JCBDICCAH(var_141_0))
	var_0_40(arg_141_1, arg_141_0, arg_141_2)

	if arg_141_0:getParent() and arg_141_0:getParent().LinkButton then
		ACTIONS.AnimateSequence(arg_141_0:getParent().LinkButton, "LinkKeybind")
	end
end

local function var_0_48(arg_142_0, arg_142_1)
	var_0_47(arg_142_0.PrimaryKey, arg_142_1.controllerIndex, true)
	var_0_47(arg_142_0.SecondaryKey, arg_142_1.controllerIndex, false)
end

local function var_0_49(arg_143_0, arg_143_1)
	local function var_143_0()
		if arg_143_0.PrimaryKey:isInFocus() then
			return Engine.DCCFJEGGGE(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, 0) == ""
		elseif arg_143_0.SecondaryKey:isInFocus() then
			return Engine.DCCFJEGGGE(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, 1) == ""
		else
			return true
		end
	end

	local function var_143_1()
		if arg_143_0.LinkButton and arg_143_0.LinkButton:isInFocus() then
			return true
		end

		local var_145_0 = Engine.DCCFJEGGGE(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, 0)
		local var_145_1 = Engine.DEGABDJDH(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, 0)
		local var_145_2 = Engine.DCCFJEGGGE(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, 1)
		local var_145_3 = Engine.DEGABDJDH(arg_143_1, arg_143_0.inputContext, arg_143_0.actionName, 1)

		return var_145_0 == var_145_1 and var_145_2 == var_145_3
	end

	local function var_143_2()
		return not arg_143_0.LinkButton or not arg_143_0.LinkButton:isInFocus()
	end

	local var_143_3 = {
		{
			button_ref = "button_keybind_reset",
			keyprompt_text = "[{menu_action2}]",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
			disabledFunction = var_143_1
		},
		{
			kbmTooltipPromptOverload = "button_keybind_unbind",
			button_ref = "button_keybind_unbind",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNBIND"),
			disabledFunction = var_143_0
		},
		{
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/LINKER_OPTION_TOOLTIP"),
			disabledFunction = var_143_2
		}
	}
	local var_143_4 = {
		focusableChildrenRefresh = true,
		promptsData = var_143_3
	}

	arg_143_0:AddTooltipData(arg_143_1, var_143_4)
end

local function var_0_50(arg_147_0, arg_147_1)
	local function var_147_0(arg_148_0)
		local var_148_0 = Engine.DCCFJEGGGE(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, 0)
		local var_148_1 = Engine.DEGABDJDH(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, 0)
		local var_148_2 = Engine.DCCFJEGGGE(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, 1)
		local var_148_3 = Engine.DEGABDJDH(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, 1)

		return var_148_0 ~= var_148_1 or var_148_2 ~= var_148_3
	end

	arg_147_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/KEYBIND_ACTIONS")
	})

	local var_147_1 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = function()
			var_0_48(arg_147_0, {
				controllerIndex = arg_147_1
			})
		end,
		conditionFunction = function()
			return var_147_0(true)
		end
	}

	arg_147_0:AddContextualMenuAction(var_147_1)

	local function var_147_2(arg_151_0)
		return Engine.DCCFJEGGGE(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, arg_151_0 and 0 or 1) ~= ""
	end

	local function var_147_3(arg_152_0)
		Engine.DABIGBHJDG(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, arg_152_0 and 0 or 1)

		if arg_152_0 then
			arg_147_0.PrimaryKey.Text:setText("")
			var_0_40(arg_147_1, arg_147_0.PrimaryKey, true)
		else
			arg_147_0.SecondaryKey.Text:setText("")
			var_0_40(arg_147_1, arg_147_0.SecondaryKey, false)
		end

		LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_147_1)

		if arg_147_0.LinkButton then
			ACTIONS.AnimateSequence(arg_147_0.LinkButton, "UnlinkKeybind")
		end
	end

	local function var_147_4(arg_153_0)
		return Engine.DCCFJEGGGE(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, arg_153_0 and 0 or 1) ~= Engine.DEGABDJDH(arg_147_1, arg_147_0.inputContext, arg_147_0.actionName, arg_153_0 and 0 or 1)
	end

	arg_147_0.PrimaryKey:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/PRIMARY_KEY_ACTIONS")
	})

	local var_147_5 = {
		id = "unbind",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/UNBIND"),
		actionFunction = function()
			var_147_3(true)
		end,
		conditionFunction = function()
			return var_147_2(true)
		end
	}

	arg_147_0.PrimaryKey:AddContextualMenuAction(var_147_5)

	local var_147_6 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = function()
			var_0_47(arg_147_0.PrimaryKey, arg_147_1, true)
		end,
		conditionFunction = function()
			return var_147_4(true)
		end
	}

	arg_147_0.PrimaryKey:AddContextualMenuAction(var_147_6)
	arg_147_0.SecondaryKey:SetupContextualMenu({
		title = Engine.CBBHFCGDIC("LUA_MENU/SECONDARY_KEY_ACTIONS")
	})

	local var_147_7 = {
		id = "unbind",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/UNBIND"),
		actionFunction = function()
			var_147_3(false)
		end,
		conditionFunction = function()
			return var_147_2(false)
		end
	}

	arg_147_0.SecondaryKey:AddContextualMenuAction(var_147_7)

	local var_147_8 = {
		id = "resetOption",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/RESET"),
		actionFunction = function()
			var_0_47(arg_147_0.SecondaryKey, arg_147_1, false)
		end,
		conditionFunction = function()
			return var_147_4(false)
		end
	}

	arg_147_0.SecondaryKey:AddContextualMenuAction(var_147_8)
end

local function var_0_51(arg_162_0, arg_162_1)
	arg_162_1.LinkButton:addEventHandler("button_action", function(arg_163_0, arg_163_1)
		local var_163_0 = arg_163_0:getParent()

		if var_163_0 then
			if Engine.CIBAHEBCFJ(arg_162_0, var_163_0.inputContext, var_163_0.actionName) then
				Engine.EBHBCGHBJ(arg_162_0, var_163_0.inputContext, var_163_0.actionName)
				ACTIONS.AnimateSequence(arg_163_0, "UnlinkKeybind")
			else
				Engine.BJDGHFDHC(arg_162_0, var_163_0.inputContext, var_163_0.actionName)
				ACTIONS.AnimateSequence(arg_163_0, "LinkKeybind")

				local var_163_1 = Engine.DCCFJEGGGE(arg_162_0, var_163_0.inputContext, var_163_0.actionName, 0)
				local var_163_2 = Engine.DCCFJEGGGE(arg_162_0, var_163_0.inputContext, var_163_0.actionName, 1)

				var_163_0.PrimaryKey.Text:setText(Engine.JCBDICCAH(var_163_1))
				var_163_0.SecondaryKey.Text:setText(Engine.JCBDICCAH(var_163_2))
			end

			arg_163_0:dispatchEventToRoot({
				name = "options_window_refresh",
				controller = arg_162_0
			})
		end

		return true
	end)

	if Engine.CIBAHEBCFJ(arg_162_0, arg_162_1.inputContext, arg_162_1.actionName) then
		ACTIONS.AnimateSequence(arg_162_1.LinkButton, "LinkKeybind")
	else
		ACTIONS.AnimateSequence(arg_162_1.LinkButton, "UnlinkKeybind")
	end
end

local function var_0_52(arg_164_0, arg_164_1)
	local var_164_0 = hashset({
		"VEHICLE_GROUND",
		"VEHICLE_FLYING",
		"COMMON_BR",
		"ONFOOT_BR"
	})[arg_164_1.inputContext]
	local var_164_1 = MenuBuilder.BuildRegisteredType("GenericKeybindOption", {
		controllerIndex = arg_164_0,
		needKeybindLinkButton = var_164_0
	})
	local var_164_2 = Engine.CBBHFCGDIC(arg_164_1.stringID)

	var_164_1.id = arg_164_1.id

	var_164_1.GenericButtonBackground.Title:setText(var_164_2)

	var_164_1.buttonName = var_164_2

	if type(arg_164_1.description) == "function" then
		var_164_1.buttonDescription = arg_164_1.description()
	else
		var_164_1.buttonDescription = Engine.CBBHFCGDIC(arg_164_1.description)
	end

	var_164_1.actionName = arg_164_1.action
	var_164_1.PrimaryKey.actionName = arg_164_1.action
	var_164_1.SecondaryKey.actionName = arg_164_1.action
	var_164_1.inputContext = arg_164_1.inputContext
	var_164_1.PrimaryKey.inputContext = arg_164_1.inputContext
	var_164_1.SecondaryKey.inputContext = arg_164_1.inputContext

	local var_164_3 = Engine.DCCFJEGGGE(arg_164_0, arg_164_1.inputContext, var_164_1.actionName, 0)
	local var_164_4 = Engine.DCCFJEGGGE(arg_164_0, arg_164_1.inputContext, var_164_1.actionName, 1)

	var_164_1.PrimaryKey.Text:setText(Engine.JCBDICCAH(var_164_3))
	var_164_1.SecondaryKey.Text:setText(Engine.JCBDICCAH(var_164_4))

	if Dvar.IBEGCHEFE("LSQNRLMKST") then
		var_164_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	else
		var_164_1:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 776, 0, _1080p * 30)
	end

	var_164_1:addEventHandler("button_action", function(arg_165_0, arg_165_1)
		if arg_165_1.keyboard then
			var_0_45(var_164_1.PrimaryKey, arg_164_0, true)
		end

		return true
	end)
	var_164_1:addEventHandler("button_over", function(arg_166_0, arg_166_1)
		arg_166_0:dispatchEventToParent({
			name = "request_active",
			target = arg_166_0
		})
	end)
	var_164_1:addEventHandler("key_bound", function(arg_167_0, arg_167_1)
		if arg_167_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			local var_167_0 = arg_167_0._isBindingPrimary and arg_167_0.PrimaryKey or arg_167_0.SecondaryKey
			local var_167_1 = "BindingSuccess"
			local var_167_2 = arg_167_0:GetCurrentMenu()

			arg_167_0:dispatchEventToRoot({
				name = "options_window_refresh",
				controller = arg_164_0
			})

			if arg_167_1.invalidBinding then
				arg_167_0:dispatchEventToCurrentMenu({
					name = "key_bound_banner",
					optionName = arg_167_0.buttonName,
					binding = arg_167_1.buttonName,
					unboundCommands = arg_167_1.unboundCommands,
					inputContext = arg_167_0.inputContext,
					currentCmd = arg_167_0.actionName,
					invalidBinding = arg_167_1.invalidBinding
				})

				return
			elseif not arg_167_1.cancelBinding then
				local var_167_3 = Engine.DCCFJEGGGE(arg_164_0, arg_167_0.inputContext, arg_167_0.actionName, arg_167_0._isBindingPrimary and 0 or 1)

				var_0_40(arg_164_0, var_167_0, arg_167_0._isBindingPrimary, true)
				arg_167_0:dispatchEventToCurrentMenu({
					name = "key_bound_banner",
					optionName = arg_167_0.buttonName,
					binding = var_167_3,
					unboundCommands = arg_167_1.unboundCommands,
					inputContext = arg_167_0.inputContext,
					currentCmd = arg_167_0.actionName
				})

				if arg_167_0.LinkButton and not Engine.CIBAHEBCFJ(arg_164_0, arg_167_0.inputContext, arg_167_0.actionName) then
					ACTIONS.AnimateSequence(arg_167_0.LinkButton, "UnlinkKeybind")
				end
			else
				var_167_1 = "GainFocus"

				ACTIONS.AnimateSequence(var_167_0, "ResetText")
				arg_167_0:dispatchEventToCurrentMenu({
					name = "hide_banner"
				})
			end

			ACTIONS.AnimateSequence(var_167_0, var_167_1)

			if var_167_2.BindingLabel then
				var_167_2.BindingLabel:AnimateSequence(var_167_1)
				var_167_2.BindingLabel:closeTree()

				var_167_2.BindingLabel = nil
			end

			arg_167_0:processEvent({
				name = "button_over_active"
			})
			Engine.BJDBIAGIDA(CoD.SFX.OtherAdjust)
			var_0_13(arg_164_0, METRICS.EndMatchDLog.KEYBINDS_GAMEPLAY)

			local var_167_4 = LUI.UIRoot.GetRootForControllerIndex(arg_167_1.controller)

			var_167_4:TryAddMouseCursor()

			var_167_4.lockedFocusStack = false

			Engine.HJJJIGAC(arg_167_1.controller)
		end
	end)

	if var_164_0 then
		var_0_51(arg_164_0, var_164_1)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(var_164_1, "ShorterTitleAR")
		else
			ACTIONS.AnimateSequence(var_164_1, "ShorterTitle")
		end
	end

	var_164_1.PrimaryKey:addEventHandler("button_action", function(arg_168_0, arg_168_1)
		var_0_45(arg_168_0, arg_164_0, true)

		return true
	end)
	var_164_1.SecondaryKey:addEventHandler("button_action", function(arg_169_0, arg_169_1)
		var_0_45(arg_169_0, arg_164_0, false)

		return true
	end)
	var_164_1.PrimaryKey:addEventHandler("refresh", function(arg_170_0, arg_170_1)
		var_0_40(arg_164_0, arg_170_0, true, false)

		if arg_164_1.disabled then
			var_164_1:SetButtonDisabled(arg_164_1.disabled())
		end
	end)
	var_164_1.SecondaryKey:addEventHandler("refresh", function(arg_171_0, arg_171_1)
		var_0_40(arg_164_0, arg_171_0, false, false)

		if arg_164_1.disabled then
			var_164_1:SetButtonDisabled(arg_164_1.disabled())
		end
	end)
	var_164_1:addEventHandler("refresh", function(arg_172_0, arg_172_1)
		if arg_172_0.LinkButton then
			if Engine.CIBAHEBCFJ(arg_164_0, arg_172_0.inputContext, arg_172_0.actionName) then
				ACTIONS.AnimateSequence(arg_172_0.LinkButton, "LinkKeybind")
			else
				ACTIONS.AnimateSequence(arg_172_0.LinkButton, "UnlinkKeybind")
			end
		end
	end)
	var_164_1:registerEventHandler("reset_value", var_0_48)

	var_164_1.disableSources = {}

	var_164_1:addEventHandler("request_disable", function(arg_173_0, arg_173_1)
		local var_173_0 = arg_173_1.disableSource

		if not arg_173_1.disableSource then
			arg_173_1.disableSource = "PERMANENT"
		end

		local var_173_1 = false

		for iter_173_0, iter_173_1 in ipairs(arg_173_0.disableSources) do
			if iter_173_1 == arg_173_1.disableSource then
				if arg_173_1.disable == false then
					table.remove(arg_173_0.disableSources, iter_173_0)
				end

				var_173_1 = true

				break
			end
		end

		if not var_173_1 and arg_173_1.disable then
			table.insert(arg_173_0.disableSources, arg_173_1.disableSource)
		end

		arg_173_0:SetButtonDisabled(#arg_173_0.disableSources > 0)
	end)
	OPTIONS.SetActiveEventHandler(var_164_1, arg_164_1)
	var_0_46(var_164_1.PrimaryKey, arg_164_0, true)
	var_0_40(arg_164_0, var_164_1.PrimaryKey, true)
	var_0_46(var_164_1.SecondaryKey, arg_164_0, false)
	var_0_40(arg_164_0, var_164_1.SecondaryKey, false)
	var_0_49(var_164_1, arg_164_0)
	var_0_50(var_164_1, arg_164_0)

	if disabledFunc then
		var_164_1:SetButtonDisabled(disabledFunc())
	end

	return var_164_1
end

function OPTIONS.InitKeybindOptionsList(arg_174_0, arg_174_1, arg_174_2, arg_174_3)
	local var_174_0 = StringTable.BFHCAIIDA(arg_174_3.file)

	arg_174_0._keybindActionList = arg_174_0._keybindActionList and arg_174_0._keybindActionList or {}

	for iter_174_0 = 0, var_174_0 - 1 do
		local var_174_1 = CSV.ReadRow(arg_174_3, iter_174_0)
		local var_174_2 = OPTIONS_DATA.optionsDataList[var_174_1.identifier]
		local var_174_3 = var_174_1.showForSP == "Y"
		local var_174_4 = var_174_1.showForMP == "Y"
		local var_174_5 = var_174_1.showForCP == "Y"
		local var_174_6 = var_174_1.showForBR == "Y"
		local var_174_7 = var_174_1.showForCoDCaster == "Y"
		local var_174_8 = var_174_1.isPCOnly == "Y"
		local var_174_9 = var_174_1.isConsoleOnly == "Y"
		local var_174_10 = var_174_1.isCDLOnly == "Y"
		local var_174_11 = var_174_1.disabled == "Y"
		local var_174_12 = true

		if var_174_2 and var_174_2.buildCondition then
			var_174_12 = var_174_2.buildCondition(arg_174_1)
		end

		local var_174_13 = Engine.CGABICJHAI()
		local var_174_14 = Engine.HDGDBCJFG()
		local var_174_15 = Engine.CAADCDEEIA() and var_174_3
		local var_174_16 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and not MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_174_4
		local var_174_17 = Engine.EAIICIFIFA() and var_174_5
		local var_174_18 = Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and MP.IsBRGameType(Lobby.GetCurrentGameType()) and var_174_6
		local var_174_19 = not Engine.CAADCDEEIA() and not Engine.EAAHGICFBD() and not Engine.EAIICIFIFA()
		local var_174_20 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_174_1)
		local var_174_21 = var_174_20 and var_174_7
		local var_174_22 = var_174_10 and MLG.DBIBHEAEGD()

		if OPTIONS_DATA.optionsDataList[var_174_1.identifier] then
			local var_174_23 = OPTIONS_DATA.optionsDataList[var_174_1.identifier]

			for iter_174_1, iter_174_2 in pairs(var_174_23) do
				var_174_1[iter_174_1] = iter_174_2
			end
		end

		if var_174_12 and (var_174_15 or var_174_16 or var_174_17 or var_174_18 or var_174_19) and (not var_174_20 or var_174_21) and (not var_174_13 or not var_174_9) and (not var_174_14 or not var_174_8) and (not var_174_10 or var_174_22) then
			arg_174_2[var_174_1.identifier] = {
				type = "keyBinding",
				controllerIndex = arg_174_1,
				id = var_174_1.identifier,
				stringID = var_174_1.stringID,
				description = var_174_1.description,
				action = var_174_1.action,
				inputContext = var_174_1.inputContext,
				disabled = function()
					return var_174_11
				end
			}
			arg_174_0._keybindActionList[var_174_1.action .. var_174_1.inputContext] = var_174_1.stringID
		end
	end
end

function OPTIONS.GetOptionsDataByIdentifier(arg_176_0, arg_176_1, arg_176_2, arg_176_3, arg_176_4)
	local var_176_0 = StringTable.BFHCAIIDA(arg_176_4.file)
	local var_176_1 = {}
	local var_176_2 = type(arg_176_3) == "table"

	for iter_176_0 = 0, var_176_0 - 1 do
		local var_176_3 = StringTable.CBGJCDIHCE(arg_176_4.file, iter_176_0, arg_176_4.cols.identifier)
		local var_176_4 = arg_176_2[var_176_3]

		if var_176_2 then
			if arg_176_3[var_176_3] then
				table.insert(var_176_1, var_176_4)
			end
		elseif var_176_3 == arg_176_3 then
			return var_176_4
		end
	end

	return var_176_1
end

function OPTIONS.AddOptions(arg_177_0, arg_177_1, arg_177_2, arg_177_3, arg_177_4)
	local var_177_0 = StringTable.BFHCAIIDA(arg_177_4.file)

	for iter_177_0 = 0, var_177_0 - 1 do
		local var_177_1 = arg_177_3[StringTable.CBGJCDIHCE(arg_177_4.file, iter_177_0, arg_177_4.cols.identifier)]

		if var_177_1 then
			if var_177_1.type == "keyBinding" then
				arg_177_2[#arg_177_2 + 1] = var_0_52(arg_177_1, var_177_1)
			else
				local var_177_2 = OPTIONS.CreateOption(arg_177_0, arg_177_1, var_177_1)

				arg_177_2[#arg_177_2 + 1] = var_177_2
			end
		end
	end
end

function OPTIONS.AddOptionsToTable(arg_178_0, arg_178_1, arg_178_2, arg_178_3)
	local var_178_0 = StringTable.BFHCAIIDA(arg_178_3.file)
	local var_178_1 = {}

	for iter_178_0 = 0, var_178_0 - 1 do
		local var_178_2 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.identifier)
		local var_178_3 = {
			id = var_178_2,
			type = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.type),
			buttonHeight = tonumber(StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.buttonHeight)),
			dvar = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.dvar),
			name = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.name),
			description = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.description),
			sliderDataName = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.sliderDataName)
		}

		if var_178_3.type ~= "Expander" and not var_0_39(var_178_3.name) then
			var_178_3.name = Engine.CBBHFCGDIC(var_178_3.name)
		end

		if var_178_3.description ~= "" and not var_0_39(var_178_3.description) then
			var_178_3.description = Engine.CBBHFCGDIC(var_178_3.description)
		end

		local var_178_4 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.showForSP) == "Y"
		local var_178_5 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.showForMP) == "Y"
		local var_178_6 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.showForCP) == "Y"
		local var_178_7 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.showForCoDCaster) == "Y"
		local var_178_8 = true

		if arg_178_3.cols.showPCApp ~= nil then
			var_178_8 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.showPCApp) == "Y"
		end

		local var_178_9 = true

		if arg_178_3.cols.showInGame ~= nil then
			var_178_9 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.showInGame) == "Y"
		end

		if arg_178_3.cols.profileOption ~= nil then
			local var_178_10 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.profileOption)

			if var_178_10 ~= "" then
				var_178_3.profileOption = var_178_10
			end
		end

		if arg_178_3.cols.refreshOption ~= nil then
			local var_178_11 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.refreshOption)

			if var_178_11 ~= "" then
				var_178_3.refreshOption = var_178_11
			end
		end

		if arg_178_3.cols.labels ~= nil then
			local var_178_12 = StringTable.CBGJCDIHCE(arg_178_3.file, iter_178_0, arg_178_3.cols.labels)

			if var_178_12 ~= "" then
				var_178_3.labels = {}

				local var_178_13 = LUI.Split(var_178_12, ";")

				for iter_178_1 = 1, #var_178_13 do
					var_178_3.labels[iter_178_1] = Engine.CBBHFCGDIC(var_178_13[iter_178_1])
				end
			end
		end

		if OPTIONS_DATA.optionsDataList[var_178_2] then
			local var_178_14 = OPTIONS_DATA.optionsDataList[var_178_2]

			for iter_178_2, iter_178_3 in pairs(var_178_14) do
				var_178_3[iter_178_2] = iter_178_3
			end
		end

		var_178_3.optionsList = var_178_1

		local var_178_15 = Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and Lobby.BFFCJFHJJB(arg_178_1)
		local var_178_16 = var_178_15 and var_178_7

		if (Engine.CAADCDEEIA() and var_178_4 or Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() and var_178_5 or Engine.EAIICIFIFA() and var_178_6) and (not Engine.BEFACAIFDD() or var_178_8) and (not Engine.DDJFBBJAIG() or var_178_9) and (Engine.CGABICJHAI() or not isPCOnly) and (not Engine.CGABICJHAI() or not isConsoleOnly) and (not var_178_15 or var_178_16) then
			local var_178_17 = OPTIONS.CreateOption(arg_178_0, arg_178_1, var_178_3)

			arg_178_2[#arg_178_2 + 1] = var_178_17
			var_178_1[var_178_3.id] = var_178_17
		end
	end
end

local function var_0_53(arg_179_0)
	if type(arg_179_0) == "function" then
		return arg_179_0()
	else
		return arg_179_0
	end
end

local function var_0_54(arg_180_0, arg_180_1, arg_180_2)
	local var_180_0 = MenuBuilder.BuildRegisteredType("GenericOpenFullscreenButton", {
		controllerIndex = arg_180_1
	})

	if type(arg_180_2.name) == "function" then
		var_180_0.GenericOptionButtonBase.Title:setText(ToUpperCase(arg_180_2.name()))
	else
		var_180_0.GenericOptionButtonBase.Title:setText(ToUpperCase(arg_180_2.name))
	end

	var_180_0:addEventHandler("button_action", function(arg_181_0, arg_181_1)
		if arg_180_2.action then
			arg_180_2.action(arg_180_0, arg_180_1, arg_181_0, arg_181_1)
		end
	end)

	if arg_180_2.focusAction then
		var_180_0:addEventHandler("button_over", function(arg_182_0, arg_182_1)
			arg_180_2.focusAction(arg_180_0)
		end)
	end

	return var_180_0
end

local function var_0_55(arg_183_0, arg_183_1, arg_183_2)
	local var_183_0 = MenuBuilder.BuildRegisteredType("SecondaryTab", {
		controllerIndex = arg_183_1
	})

	if type(arg_183_2.name) == "function" then
		var_183_0.Text:setText(ToUpperCase(arg_183_2.name()))
	else
		var_183_0.Text:setText(ToUpperCase(arg_183_2.name))
	end

	var_183_0:addEventHandler("button_action", function(arg_184_0, arg_184_1)
		if arg_183_2.action then
			arg_183_2.action(arg_183_0, arg_183_1, arg_184_0, arg_184_1)
		end

		arg_184_0:dispatchEventToParent({
			name = "request_active",
			target = arg_184_0
		})
	end)
	var_183_0:addEventHandler("button_action_disable", function(arg_185_0, arg_185_1)
		arg_185_0:dispatchEventToParent({
			name = "request_active",
			target = arg_185_0
		})
	end)

	if arg_183_2.focusAction then
		var_183_0:addEventHandler("button_over", function(arg_186_0, arg_186_1)
			arg_183_2.focusAction(arg_183_0)
		end)
	end

	return var_183_0
end

local function var_0_56(arg_187_0, arg_187_1, arg_187_2)
	local var_187_0 = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
		controllerIndex = arg_187_1
	})
	local var_187_1 = SliderBounds[arg_187_2.sliderDataName]
	local var_187_2 = 0
	local var_187_3 = 1
	local var_187_4 = 0.1
	local var_187_5 = 0.1

	if var_187_1 == nil then
		var_187_2 = Engine.GBEDAEBIH(arg_187_2.sliderDataName, arg_187_1)
		var_187_3 = Engine.ECCHEFFDFD(arg_187_2.sliderDataName, arg_187_1)
	else
		var_187_2 = var_187_1.Min
		var_187_3 = var_187_1.Max
		var_187_4 = var_187_1.Step
		var_187_5 = var_187_1.PCStep
	end

	local var_187_6 = Dvar.BJJCJHDBII(arg_187_2.dvar)

	if arg_187_2.value then
		var_187_6 = arg_187_2.value(arg_187_1)
	end

	if arg_187_2.focusAction then
		var_187_0:addEventHandler("button_over", function(arg_188_0, arg_188_1)
			arg_187_2.focusAction(arg_187_0, arg_188_0)
		end)
	end

	local var_187_7 = 2

	if arg_187_2.decimalPlacesToRound then
		var_187_7 = arg_187_2.decimalPlacesToRound
	end

	local var_187_8

	if arg_187_2.action == nil then
		function var_187_8(arg_189_0)
			Dvar.IICIFEEDC(arg_187_2.dvar, arg_189_0)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_187_1)
		end
	else
		var_187_8 = arg_187_2.action(arg_187_0, arg_187_1)
	end

	local var_187_9 = {
		wrapAround = false,
		decimalPlacesToRound = var_187_7,
		action = var_187_8,
		defaultValue = var_187_6,
		max = var_187_3,
		min = var_187_2,
		step = var_187_4,
		pcstep = var_187_5,
		fillElement = var_187_0.GenericFillBar.Fill
	}

	if arg_187_2.UpdateContent then
		var_187_9.UpdateContent = arg_187_2.UpdateContent
	end

	LUI.AddUIArrowFillBarButtonLogic(var_187_0, arg_187_1, var_187_9)

	return var_187_0
end

local function var_0_57(arg_190_0, arg_190_1, arg_190_2)
	local var_190_0 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_190_1
	})
	local var_190_1 = arg_190_2.value

	if type(arg_190_2.value) == "function" then
		var_190_1 = arg_190_2.value(arg_190_1)
	end

	if arg_190_2.focusAction then
		var_190_0:addEventHandler("button_over", function(arg_191_0, arg_191_1)
			arg_190_2.focusAction(arg_191_0)
		end)
	end

	local var_190_2 = {
		wrapAround = true,
		labels = var_0_53(arg_190_2.labels),
		action = arg_190_2.action,
		defaultValue = var_190_1
	}

	LUI.AddUIArrowTextButtonLogic(var_190_0, arg_190_1, var_190_2)

	return var_190_0
end

local function var_0_58(arg_192_0, arg_192_1, arg_192_2)
	local var_192_0
	local var_192_1 = MenuBuilder.BuildRegisteredType("GenericToggleButton", {
		controllerIndex = arg_192_1
	})

	if arg_192_2.value then
		if type(arg_192_2.value) == "function" then
			var_192_0 = arg_192_2.value(arg_192_1)
		else
			var_192_0 = arg_192_2.value
		end
	else
		local var_192_2 = arg_192_2.dvar

		if Dvar.EBBAIAEICC(var_192_2) == DvarTypeTable.DvarBool then
			var_192_0 = Dvar.IBEGCHEFE(var_192_2) and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		else
			var_192_0 = Dvar.CFHDGABACF(var_192_2) == 1 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		end
	end

	if arg_192_2.focusAction then
		var_192_1:addEventHandler("button_over", function(arg_193_0, arg_193_1)
			arg_192_2.focusAction(arg_193_0)
		end)
	end

	if arg_192_2.action == nil then
		function arg_192_2.action(arg_194_0, arg_194_1, arg_194_2)
			local var_194_0 = arg_192_2.dvar

			if Dvar.EBBAIAEICC(var_194_0) == DvarTypeTable.DvarBool then
				Dvar.DHEGHJJJHI(var_194_0, not Dvar.IBEGCHEFE(var_194_0))
			else
				Dvar.DFIJDJFIFD(var_194_0, arg_194_2 and 1 or 0)
			end

			if arg_192_2.execCommand then
				Engine.EBIDFIDHIE(arg_192_2.execCommand)
			end
		end
	end

	local var_192_3

	if arg_192_2.dvar then
		function var_192_3(arg_195_0, arg_195_1)
			return Dvar.DBGFIDHBFC(arg_192_2.dvar)
		end
	end

	if arg_192_2.defaultOptionValue then
		var_192_3 = arg_192_2.defaultOptionValue
	end

	local var_192_4 = {
		wrapAround = true,
		labels = var_0_53(arg_192_2.labels),
		action = function(...)
			if arg_192_2.matchEndDLogRecording then
				var_0_13(arg_192_1, arg_192_2.matchEndDLogRecording)
			end

			return arg_192_2.action(...)
		end,
		defaultOptionValue = var_192_3,
		defaultValue = var_192_0
	}

	LUI.AddUIToggleButtonLogic(var_192_1, arg_192_1, var_192_4)

	return var_192_1
end

local function var_0_59(arg_197_0, arg_197_1, arg_197_2)
	local var_197_0 = OPTIONS.GetUniformOptionData(arg_197_2, arg_197_1, true)

	return OPTIONS.BuildGenericCyclingList(arg_197_1, var_197_0), false, var_197_0
end

local function var_0_60(arg_198_0, arg_198_1, arg_198_2)
	local var_198_0 = OPTIONS.GetUniformOptionData(arg_198_2, arg_198_1, true)

	if arg_198_2.alwaysShowDefault then
		var_198_0.alwaysShowDefault = arg_198_2.alwaysShowDefault
	end

	if arg_198_2.parent == nil then
		var_198_0.parent = arg_198_0:getParent()
	elseif type(arg_198_2.parent) == "function" then
		var_198_0.parent = arg_198_2.parent(arg_198_0)
	end

	return OPTIONS.BuildGenericDropdown(arg_198_1, var_198_0), false, var_198_0
end

local function var_0_61(arg_199_0, arg_199_1, arg_199_2)
	local var_199_0 = OPTIONS.GetUniformOptionData(arg_199_2, arg_199_1, false)

	return OPTIONS.BuildGenericSliderBarWithEditBox(arg_199_1, var_199_0), false, var_199_0
end

local function var_0_62(arg_200_0, arg_200_1, arg_200_2)
	local var_200_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_200_1
	})
	local var_200_1 = arg_200_2.name

	if type(arg_200_2.name) == "function" then
		var_200_1 = arg_200_2.name()
	end

	var_200_0.Text:setText(var_200_1)
	var_200_0.DynamicText:setText("")
	var_200_0:addEventHandler("button_action", function(arg_201_0, arg_201_1)
		arg_201_0:dispatchEventToParent({
			name = "request_active",
			target = arg_201_0
		})
	end)
	var_200_0:addEventHandler("button_action_disable", function(arg_202_0, arg_202_1)
		arg_202_0:dispatchEventToParent({
			name = "request_active",
			target = arg_202_0
		})
	end)

	return var_200_0
end

function OPTIONS.ResetOption(arg_203_0, arg_203_1, arg_203_2, arg_203_3)
	if arg_203_2.type == "keyBinding" then
		Engine.CGGHDFIDAF(arg_203_1, arg_203_2.inputContext, arg_203_2.action, 0)
		Engine.DCCFJEGGGE(arg_203_1, arg_203_2.inputContext, arg_203_2.action, 0)
		Engine.CGGHDFIDAF(arg_203_1, arg_203_2.inputContext, arg_203_2.action, 1)
		Engine.DCCFJEGGGE(arg_203_1, arg_203_2.inputContext, arg_203_2.action, 1)
	elseif arg_203_2.profileOption then
		if LUI.BeginsWith(arg_203_2.id, "CoDCaster_") then
			-- block empty
		else
			Engine.CJHGJHCGCD(arg_203_2.profileOption, arg_203_1)
		end
	elseif arg_203_2.dvar and arg_203_2.dvar ~= "" then
		if arg_203_2.defaultOptionValue then
			local var_203_0 = arg_203_2.defaultOptionValue(arg_203_0, arg_203_1)
			local var_203_1 = Dvar.EBBAIAEICC(arg_203_2.dvar)

			if var_203_1 == DvarTypeTable.DvarString or var_203_1 == DvarTypeTable.DvarEnum then
				Dvar.BDEHAEGHAF(arg_203_2.dvar, var_203_0)
			elseif var_203_1 == DvarTypeTable.DvarInt then
				Dvar.DFIJDJFIFD(arg_203_2.dvar, var_203_0)
			elseif var_203_1 == DvarTypeTable.DvarBool then
				if type(var_203_0 == "number") and (var_203_0 ~= OPTIONS.disableButtonOptions or true) then
					var_203_0 = true
				end

				Dvar.DHEGHJJJHI(arg_203_2.dvar, var_203_0)
			elseif var_203_1 == DvarTypeTable.DvarFloat then
				Dvar.IICIFEEDC(arg_203_2.dvar, var_203_0)
			end

			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_203_1)
		else
			Dvar.BBAICIAGH(arg_203_2.dvar)
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_203_1)
		end
	elseif arg_203_2.id == "CoDCaster_TeamInfo" then
		CODCASTER.ResetTeamSettings(arg_203_1)
	end
end

function OPTIONS.GetOptionValue(arg_204_0, arg_204_1)
	if arg_204_1.type == "keyBinding" then
		return nil
	end

	if arg_204_1.value then
		return arg_204_1.value(arg_204_0, arg_204_1.profileOption or arg_204_1.dvar)
	end

	if arg_204_1.profileOption then
		if LUI.BeginsWith(rawOptionData.id, "CoDCaster_") then
			return MLG.ShoutcasterProfileVarValue(arg_204_0, arg_204_1.profileOption)
		else
			return Engine.BECCFCBIAA(arg_204_1.profileOption, arg_204_0)
		end
	end

	if arg_204_1.dvar and arg_204_1.dvar ~= "" and Dvar.DEHABCCECE(arg_204_1.dvar) then
		local var_204_0 = Dvar.EBBAIAEICC(arg_204_1.dvar)
		local var_204_1

		if var_204_0 == DvarTypeTable.DvarString or var_204_0 == DvarTypeTable.DvarEnum then
			var_204_1 = Dvar.DHEEJCCJBH(arg_204_1.dvar)
		elseif var_204_0 == DvarTypeTable.DvarInt then
			var_204_1 = Dvar.CFHDGABACF(arg_204_1.dvar)
		elseif var_204_0 == DvarTypeTable.DvarBool then
			var_204_1 = Dvar.IBEGCHEFE(arg_204_1.dvar)
		elseif var_204_0 == DvarTypeTable.DvarFloat then
			var_204_1 = Dvar.BJJCJHDBII(arg_204_1.dvar)
		end

		return var_204_1
	end
end

function OPTIONS.ResetOptionElement(arg_205_0, arg_205_1, arg_205_2, arg_205_3)
	if arg_205_3.type == "CyclingList" or arg_205_3.type == "Dropdown" or arg_205_3.type == "SliderBarWithEditBox" or arg_205_3.type == "keyBinding" then
		arg_205_2:processEvent({
			name = "reset_value",
			controllerIndex = arg_205_1
		})
	else
		OPTIONS.ResetOption(arg_205_0, arg_205_1, arg_205_3, arg_205_2)

		local var_205_0 = OPTIONS.GetOptionValue(arg_205_1, arg_205_3)

		if arg_205_3.type == "ToggleButton" then
			var_205_0 = var_205_0 == OPTIONS.disableButtonOptions.ENABLED and true or false
		end

		if var_205_0 == nil and arg_205_3.type ~= "keyBinding" then
			DebugPrint("The option " .. tostring(arg_205_3.id) .. " has an invalid default value.")

			return
		end

		if arg_205_3.type == "ToggleButton" then
			arg_205_2:SetCurrentValue(arg_205_1, var_205_0)
		elseif arg_205_3.type == "ArrowButton" then
			arg_205_2:SetCurrentValue(var_205_0)
		end
	end

	LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_205_1)
end

function OPTIONS.BuildDetailPreview(arg_206_0, arg_206_1)
	local var_206_0 = arg_206_0:GetCurrentMenu()

	if var_206_0._customPreviewButtonAction then
		LUI.FlowManager.GetScopedData(arg_206_0).alreadyLoaded = nil

		var_206_0._customPreviewButtonAction(arg_206_0, arg_206_1)
	elseif var_206_0._detailedPreviewImage then
		local var_206_1 = var_206_0.OptionName:getText()
		local var_206_2 = var_206_0.ButtonDescriptionText.Description:getText()
		local var_206_3 = var_206_0._detailedPreviewImage

		if not var_206_0.optionDetailPreview then
			local var_206_4 = MenuBuilder.BuildRegisteredType("OptionDetailPreview", {
				controllerIndex = arg_206_1,
				name = var_206_1,
				description = var_206_2,
				image = var_206_3
			})

			var_206_4.id = "optionDetailPreview"

			var_206_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
			var_206_0:addElement(var_206_4)

			var_206_0.optionDetailPreview = var_206_4
		end
	end
end

function OPTIONS.CreateOptionList(arg_207_0, arg_207_1, arg_207_2, arg_207_3)
	return function(arg_208_0, arg_208_1, arg_208_2)
		local var_208_0 = {}

		for iter_208_0, iter_208_1 in ipairs(arg_207_2) do
			local var_208_1 = arg_208_2[iter_208_1]

			if var_208_1 then
				if var_208_1.type == "keyBinding" then
					var_208_0[#var_208_0 + 1] = var_0_52(arg_208_1, var_208_1)
				elseif var_208_1.type == "SubCategory" then
					local var_208_2 = arg_207_2[iter_208_0 + 1] and arg_208_2[arg_207_2[iter_208_0 + 1]]

					if var_208_2 and var_208_2.type ~= "SubCategory" then
						if iter_208_0 == 1 then
							var_208_1.buttonHeight = 24
						end

						var_208_0[#var_208_0 + 1] = OPTIONS.CreateOption(arg_208_0, arg_208_1, var_208_1, arg_207_3)
					end
				else
					local var_208_3 = OPTIONS.CreateOption(arg_208_0, arg_208_1, var_208_1, arg_207_3)

					var_208_0[#var_208_0 + 1] = var_208_3
				end
			end
		end

		return var_208_0
	end
end

function OPTIONS.CreateOptionCategory(arg_209_0, arg_209_1, arg_209_2, arg_209_3)
	if arg_209_2.id == "TelemetryCategory" and Engine.HDGDBCJFG() then
		return nil
	end

	local var_209_0 = {
		name = Engine.CBBHFCGDIC(arg_209_2.name)
	}
	local var_209_1 = var_0_55(arg_209_0, arg_209_1, var_209_0)

	var_209_1:addEventHandler("button_over", function(arg_210_0, arg_210_1)
		if not LUI.IsLastInputMouseNavigation(arg_209_1) then
			LUI.FlowManager.GetScopedData(arg_209_0).currentOptionsCategory = currentOptionsCategory

			local var_210_0 = OPTIONS.CreateOptionList(arg_209_0, arg_209_1, arg_209_2.optionsList)

			arg_210_0:dispatchEventToParent({
				name = "request_active",
				target = arg_210_0
			})
			arg_209_0:processEvent({
				noFocus = true,
				name = "category_changed",
				mouse = false,
				createOptions = var_210_0,
				index = arg_209_3
			})
			assert(arg_209_0.buttonList)

			local var_210_1 = arg_209_0.buttonList:GetIndexForElement(arg_210_0) or 0

			arg_209_0.buttonList:SetDefaultFocus(var_210_1)

			if not arg_209_0.buttonList:isInFocus() then
				ACTIONS.GainFocus(arg_209_0, "buttonList", arg_209_1)
			end
		end

		if var_209_0.focusAction then
			var_209_0.focusAction(arg_209_0)
		end
	end)
	var_209_1:addEventHandler("button_action", function(arg_211_0, arg_211_1)
		LUI.FlowManager.GetScopedData(arg_209_0).currentOptionsCategory = currentOptionsCategory

		local var_211_0 = OPTIONS.CreateOptionList(arg_209_0, arg_209_1, arg_209_2.optionsList)

		arg_211_0:dispatchEventToParent({
			name = "request_active",
			target = arg_211_0
		})
		arg_209_0:processEvent({
			noFocus = false,
			name = "category_changed",
			createOptions = var_211_0,
			mouse = arg_211_1.mouse,
			index = arg_209_3
		})
	end)

	if arg_209_2.disabled then
		var_209_1:SetButtonDisabled(true)
	end

	local var_209_2, var_209_3, var_209_4, var_209_5 = var_209_1.Text:getLocalRect()
	local var_209_6 = var_209_1.Text:getText()
	local var_209_7 = var_209_1.Text:GetCurrentFont()
	local var_209_8, var_209_9, var_209_10, var_209_11 = GetTextDimensions(var_209_6, var_209_7, var_209_5 - var_209_3, nil, 1 * _1080p)
	local var_209_12 = var_209_10 - var_209_8
	local var_209_13 = 28 * _1080p
	local var_209_14 = var_209_12 * 0.15

	var_209_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_209_12 + var_209_13 - var_209_14, 0, 45 * _1080p)

	var_209_1.id = optionsCategoryName

	return var_209_1
end

local function var_0_63(arg_212_0, arg_212_1, arg_212_2)
	local var_212_0 = MenuBuilder.BuildRegisteredType("GenericExpander", {
		controllerIndex = arg_212_1
	})
	local var_212_1 = {
		expandButton = var_212_0.ExpandButton,
		replaceDummyInnerWidget = var_212_0.DummyInnerWidget,
		replaceDummyChildrenContainer = var_212_0.DummyChildrenContainer,
		childrenList = {}
	}

	for iter_212_0 in string.gmatch(arg_212_2.name, "[^;]+") do
		local var_212_2
		local var_212_3 = arg_212_2.optionsList[iter_212_0]

		if var_212_3 then
			if var_212_3.type == "keyBinding" then
				var_212_2 = var_0_52(arg_212_1, var_212_3)
			else
				var_212_2 = OPTIONS.CreateOption(arg_212_0, arg_212_1, var_212_3, arg_212_2.applyable)
			end
		end

		if var_212_2 then
			table.insert(var_212_1.childrenList, {
				element = var_212_2
			})
		end
	end

	if #var_212_1.childrenList == 1 then
		return var_212_1.childrenList[1].element, true
	end

	LUI.AddUIExpanderLogic(var_212_0, arg_212_1, var_212_1)

	return var_212_0
end

local function var_0_64(arg_213_0, arg_213_1, arg_213_2)
	local var_213_0 = MenuBuilder.BuildRegisteredType("GenericOptionSubcategoryTitle", {
		controllerIndex = arg_213_1
	})

	var_213_0.OptionSubcategory:setText(arg_213_2.name)

	return var_213_0
end

local var_0_65 = hashset({
	"Dropdown",
	"GenericButton"
})

local function var_0_66(arg_214_0, arg_214_1, arg_214_2, arg_214_3)
	if var_0_65[arg_214_3] and not arg_214_1.disabled then
		arg_214_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_214_0:RemoveButtonHelperText("button_primary", "left")
	end
end

function OPTIONS.CreateOption(arg_215_0, arg_215_1, arg_215_2, arg_215_3)
	local var_215_0

	assert(arg_215_2.type)

	local var_215_1 = {
		GenericButton = var_0_54,
		Dropdown = var_0_60,
		SliderBarWithEditBox = var_0_61,
		CyclingList = var_0_59,
		ArrowButton = var_0_57,
		SliderBar = var_0_56,
		ToggleButton = var_0_58,
		DualLabelButton = var_0_62,
		Expander = var_0_63,
		SubCategory = var_0_64,
		Custom = function()
			if arg_215_2.action then
				local var_216_0 = arg_215_2.action(arg_215_0, arg_215_1)

				OPTIONS.SetFocusEventHandlerForActiveState(var_216_0, arg_215_1, arg_215_2)

				return var_216_0
			end
		end
	}

	if arg_215_2.hideOption then
		local var_215_2 = arg_215_2.hideOption

		if type(arg_215_2.hideOption) == "function" then
			var_215_2 = arg_215_2.hideOption(arg_215_1)
		end

		if var_215_2 then
			return nil
		end
	end

	if arg_215_2.dvar and not Dvar.DEHABCCECE(arg_215_2.dvar) then
		return nil
	end

	if arg_215_2.profileOption then
		if LUI.BeginsWith(arg_215_2.id, "CoDCaster_") then
			if MLG.ShoutcasterProfileVarValue(arg_215_1, arg_215_2.profileOption) == nil then
				return nil
			end
		elseif Engine.BECCFCBIAA(arg_215_2.profileOption, arg_215_1) == nil then
			return nil
		end
	end

	arg_215_2.applyable = arg_215_3 == true or arg_215_2.applyable

	local var_215_3 = var_215_1[arg_215_2.type]

	assert(var_215_3, "No createFunction found for option data type: " .. arg_215_2.type)

	local var_215_4, var_215_5, var_215_6 = var_215_3(arg_215_0, arg_215_1, arg_215_2)

	if var_215_5 then
		return var_215_4
	end

	local var_215_7 = 50

	if arg_215_2.type == "Expander" then
		var_215_7 = 86
	elseif arg_215_2.type == "SubCategory" then
		var_215_7 = 40
	end

	if arg_215_2.buttonHeight then
		var_215_7 = arg_215_2.buttonHeight
	end

	var_215_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * var_215_7)

	var_215_4.id = arg_215_2.id

	local var_215_8

	if var_215_4.Title then
		var_215_8 = var_215_4.Title
	elseif var_215_4.GenericOptionButtonBase then
		var_215_8 = var_215_4.GenericOptionButtonBase.Title
	end

	if var_215_8 then
		local var_215_9 = arg_215_2.name

		if type(arg_215_2.name) == "function" then
			var_215_9 = arg_215_2.name()
		end

		var_215_8:setText(var_215_9)

		var_215_4.buttonName = var_215_9
	end

	local function var_215_10(arg_217_0, arg_217_1)
		if type(arg_217_1) == "function" then
			arg_217_1 = arg_217_1(var_215_4, arg_215_1)
		end

		arg_217_0.buttonDescription = arg_217_1
	end

	if arg_215_2.image then
		var_215_4.buttonImage = arg_215_2.image
	end

	if arg_215_2.updateDescriptionOnAction then
		assert(var_215_4.action, arg_215_2.type .. " doesn't handle updateDescriptionOnAction.")

		local var_215_11 = var_215_4.action
		local var_215_12 = arg_215_2.description

		function var_215_4.action(...)
			var_215_11(...)

			if var_215_4.isDisplayed then
				var_215_10(var_215_4, var_215_12)
				var_215_4:dispatchEventToCurrentMenu({
					name = "update_button_description",
					onlyText = true,
					updateOnAction = true,
					text = var_215_4.buttonDescription
				})
			end
		end
	end

	var_215_4.dvar = arg_215_2.dvar
	var_215_4.profileOption = arg_215_2.profileOption

	if arg_215_2.customPreviewButtonAction then
		var_215_4.customPreviewButtonAction = arg_215_2.customPreviewButtonAction
	end

	if arg_215_2.detailedPreviewImage then
		var_215_4.detailedPreviewImage = arg_215_2.detailedPreviewImage
	end

	OPTIONS.SetFocusEventHandlerForActiveState(var_215_4, arg_215_1, arg_215_2)
	OPTIONS.SetActiveEventHandler(var_215_4, arg_215_2)
	var_215_10(var_215_4, arg_215_2.description)

	if arg_215_2.type ~= "GenericButton" and not arg_215_3 then
		var_0_41(var_215_4, var_215_6, arg_215_1)
		var_0_42(var_215_4, var_215_6, arg_215_2, arg_215_1)
	end

	var_215_4.disableSources = {}

	var_215_4:addEventHandler("request_disable", function(arg_219_0, arg_219_1)
		local var_219_0 = arg_219_1.disableSource

		if not arg_219_1.disableSource then
			arg_219_1.disableSource = "PERMANENT"
		end

		local var_219_1 = false

		for iter_219_0, iter_219_1 in ipairs(arg_219_0.disableSources) do
			if iter_219_1 == arg_219_1.disableSource then
				if arg_219_1.disable == false then
					table.remove(arg_219_0.disableSources, iter_219_0)
				end

				var_219_1 = true

				break
			end
		end

		if not var_219_1 and arg_219_1.disable then
			table.insert(arg_219_0.disableSources, arg_219_1.disableSource)
		end

		var_215_4:SetButtonDisabled(#arg_219_0.disableSources > 0)
	end)

	if arg_215_2.disabled then
		local function var_215_13()
			if type(arg_215_2.disabled) == "function" then
				var_215_4:processEvent({
					name = "request_disable",
					disable = arg_215_2.disabled(arg_215_1)
				})
			else
				var_215_4:processEvent({
					name = "request_disable",
					disable = arg_215_2.disabled
				})
			end
		end

		var_215_13()
		var_215_4:addEventHandler("refresh", var_215_13)
	end

	if arg_215_2.specificAction then
		arg_215_2.specificAction(arg_215_0, var_215_4, arg_215_1)
	end

	var_215_4:addEventHandler("gain_focus", function(arg_221_0)
		if LUI.IsLastInputGamepad(arg_215_1) then
			var_0_66(arg_215_0, arg_221_0, arg_215_1, arg_215_2.type)
		end
	end)

	return var_215_4
end
