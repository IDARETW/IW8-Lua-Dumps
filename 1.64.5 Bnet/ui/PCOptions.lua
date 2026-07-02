module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local var_0_0 = 12
local var_0_1 = 1
local var_0_2 = 40
local var_0_3 = 80

function SinglePlayerDisabled(arg_1_0, arg_1_1)
	return not Engine.EAAHGICFBD()
end

function ChatDisableFunc(arg_2_0, arg_2_1)
	return SinglePlayerDisabled(arg_2_0, arg_2_1) or GamepadDisabledFunc(arg_2_0, arg_2_1)
end

function GamepadDisabledFunc(arg_3_0, arg_3_1)
	return Engine.BBDCAFEGDJ() == 1
end

function OptimalVideoDisabledFunc(arg_4_0, arg_4_1)
	return not Engine.DDJFBBJAIG() and Engine.EAAHGICFBD()
end

function OptimalVideoNotice(arg_5_0, arg_5_1)
	local var_5_0 = {
		title = Engine.CBBHFCGDIC("MENU/RESET_SYSTEM_DEFAULTS"),
		message = Engine.CBBHFCGDIC("MENU/RESTORE_DEFAULTS"),
		yesAction = function(arg_6_0, arg_6_1)
			Engine.EJJEHHFCC(true)
			Dvar.IICIFEEDC("NNMSONQSOP", var_0_3)
			Dvar.IICIFEEDC("LKOLMLQRRT", 1)
			Dvar.IICIFEEDC("NLQKNTQSNT", 1)
			Dvar.IICIFEEDC("NMRKMSMTOO", 0)
			Engine.DAGFFDGFII("profile_setFilmGrain " .. tostring(1), arg_6_1)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_6_1)
			Engine.EBIDFIDHIE("wait; wait; r_applyPicmip;")
			arg_6_0:dispatchEventToRoot({
				name = "optimal_video_update"
			})
		end,
		noAction = function()
			return
		end
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_5_0)

	var_5_1.id = "OptimalVideoNotice"

	return var_5_1
end

function MicThreshDisable()
	return Dvar.IBEGCHEFE("MOOMTQSMPS")
end

function ResetControlsYesAction(arg_9_0, arg_9_1)
	Engine.DAGFFDGFII("profile_toggleLean 1", arg_9_1)
	Engine.DAGFFDGFII("profile_toggleholdSprint 0", arg_9_1)

	if Engine.BBDCAFEGDJ() == 1 then
		Engine.BEBBDFEICI("thumbstick_default", arg_9_1)
		Engine.CBCIHEGADA("buttons_default", arg_9_1, CONDITIONS.IsMagmaGameMode())
		Engine.DAGFFDGFII("profile_toggleInvertedPitch 0", arg_9_1)
		Engine.DAGFFDGFII("profile_toggleRumble 1", arg_9_1)
		Engine.DAGFFDGFII("profile_toggleAutoAim 1", arg_9_1)
		Engine.DAGFFDGFII("profile_toggleTargetAssist 1", arg_9_1)
		Engine.DAGFFDGFII("profile_toggleSprintCancelsReload 0", arg_9_1)
		Dvar.IICIFEEDC("MRKPMKMRQL", 4)
		Dvar.IICIFEEDC("NQQNNPQPKR", 4)
	else
		Engine.EBIDFIDHIE("exec default_keys.cfg")
		Dvar.IICIFEEDC("NLQQLQRKSM", var_0_0)
		Dvar.IICIFEEDC("LONMSRNMSK", var_0_1)
		Dvar.IICIFEEDC("MKONQNTMKQ", var_0_2)
		Dvar.IICIFEEDC("MPKPOPRTLQ", var_0_1)
		Dvar.DHEGHJJJHI("LRTLMMOTML", false)
	end

	Engine.DAGFFDGFII("profile_toggleInvertedFlyPitch 0", arg_9_1)
	Engine.DAGFFDGFII("profile_menuDvarsFinish")
end

function ResetControls()
	local var_10_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/SET_DEFAULT_CONTROLS"),
		message = Engine.CBBHFCGDIC("LUA_MENU/RESTORE_EACH_SETTING"),
		yesAction = ResetControlsYesAction,
		noAction = function()
			return
		end
	}
	local var_10_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_10_0)

	var_10_1.id = "ResetControls"

	return var_10_1
end

function CopyKeysFromOtherModeAction(arg_12_0, arg_12_1)
	if CoD.GetCurrentGameMode() == CoD.PlayMode.SP then
		Engine.CCFIBGGCBE(CoD.PlayMode.Core, arg_12_1)
	else
		Engine.CCFIBGGCBE(CoD.PlayMode.SP, arg_12_1)
	end
end

function CopyKeysFromOtherMode()
	local var_13_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_PC/COPY_KEYS_TITLE")
	}

	if Engine.EAAHGICFBD() then
		var_13_0.message = Engine.CBBHFCGDIC("LUA_MENU_PC/COPY_KEYS_FROM_SP")
	elseif Engine.CAADCDEEIA() then
		var_13_0.message = Engine.CBBHFCGDIC("LUA_MENU_PC/COPY_KEYS_FROM_MP")
	end

	var_13_0.yesAction = CopyKeysFromOtherModeAction

	function var_13_0.noAction()
		return
	end

	local var_13_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_13_0)

	var_13_1.id = "CopyKeysFromOtherMode"

	return var_13_1
end

local function var_0_4(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:addEventHandler("menu_create", function()
		local var_16_0 = LUI.FlowManager.GetScopedData(arg_15_0).currentOptionsCategory

		if var_16_0 == nil then
			var_16_0 = "video_options"
		end

		OPTIONS_DATA.UpdateOptionsWindow(arg_15_0, var_16_0, true)
	end)
end

local function var_0_5(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIVerticalList.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 705 * _1080p)
	var_17_0:SetSpacing(10 * _1080p)

	var_17_0.id = "PCOptions"
	var_17_0._animationSets = {}
	var_17_0._sequences = {}

	local var_17_1 = arg_17_1 or {}
	local var_17_2 = var_17_1.controllerIndex

	var_17_0:setUseStencil(false)

	local var_17_3 = OPTIONS.CreateOption(var_17_0, var_17_2, OPTIONS_DATA.optionsDataList.videoOptions)

	var_17_0:addElement(var_17_3)

	var_17_0.VideoOptions = var_17_3

	local var_17_4 = OPTIONS.CreateOption(var_17_0, var_17_2, OPTIONS_DATA.optionsDataList.audioOptions)

	var_17_0:addElement(var_17_4)

	var_17_0.AudioOptions = var_17_4

	local var_17_5 = OPTIONS.CreateOption(var_17_0, var_17_2, OPTIONS_DATA.optionsDataList.networkDiagnosticOptions)

	var_17_0:addElement(var_17_5)

	var_17_0.NetworkDiagnosticOptions = var_17_5

	local var_17_6 = OPTIONS.CreateOption(var_17_0, var_17_2, OPTIONS_DATA.optionsDataList.controlOptions)

	var_17_0:addElement(var_17_6)

	var_17_0.ControlOptions = var_17_6

	if Engine.EAAHGICFBD() then
		local var_17_7 = OPTIONS.CreateOption(var_17_0, var_17_2, OPTIONS_DATA.optionsDataList.voiceOptions)

		var_17_0:addElement(var_17_7)

		var_17_0.VoiceOptions = var_17_7
	end

	if not CONDITIONS.IsWeGameGovBanned() then
		local var_17_8 = OPTIONS.CreateOption(var_17_0, var_17_2, OPTIONS_DATA.optionsDataList.SpamRemoval)

		var_17_0:addElement(var_17_8)

		var_17_0.SpamRemoval = var_17_8
	end

	var_0_4(var_17_0, var_17_2, var_17_1)

	return var_17_0
end

MenuBuilder.registerType("PCOptionsButtons", var_0_5)
MenuBuilder.registerType("OptimalVideoNotice", OptimalVideoNotice)
MenuBuilder.registerType("ResetControls", ResetControls)
MenuBuilder.registerType("CopyKeysFromOtherMode", CopyKeysFromOtherMode)
LockTable(_M)
