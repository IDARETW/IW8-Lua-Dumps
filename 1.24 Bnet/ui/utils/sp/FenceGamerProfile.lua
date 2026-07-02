module(..., package.seeall)

FenceGamerProfile = LUI.Class(LUI.Fence)

function FenceGamerProfile.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceGamerProfile.Start(arg_2_0)
	DebugPrint("FenceGamerProfile.Start")

	arg_2_0._openedBrightnessMenu = false
	arg_2_0._setScreenBounds = false
	arg_2_0._openedEULA = false
end

function FenceGamerProfile.Stop(arg_3_0)
	DebugPrint("FenceGamerProfile.Stop")
end

function FenceGamerProfile.OnBackOut(arg_4_0)
	Engine.BJBBFIGDGI()
end

function FenceGamerProfile.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.pass

	local var_5_0

	for iter_5_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_5_0) then
			if Engine.BFDACIJIAD(iter_5_0) then
				var_5_0 = iter_5_0
			end

			if Engine.CIEGIACHAE() and Engine.CBGJIDFIDE(iter_5_0) then
				if not LUI.FlowManager.IsInStack("popup_corrupt_data") then
					LUI.FlowManager.RequestPopupMenu(nil, "popup_corrupt_data", true, iter_5_0, false, {}, nil, false, true)
				end

				arg_5_0._state = LUI.Fence.STATE.block

				return
			end

			if Engine.BGGFCBBEC(iter_5_0) == #Languages then
				local var_5_1 = Engine.DGAIDIEIAC()

				Engine.CEHDAACIJA(iter_5_0, var_5_1)

				if not Engine.CGABICJHAI() then
					Engine.DAGFFDGFII("updategamerprofile")
				end
			end
		end
	end

	if Engine.DBFCJBDJEC() and not Engine.JBIHDJBH() then
		return
	end

	if var_5_0 and Engine.CDCCDDJAJJ(var_5_0) and not Engine.CIFGGDIGBE(var_5_0) then
		local var_5_2 = Engine.BGGFCBBEC(var_5_0)
		local var_5_3 = Engine.DGAIDIEIAC()

		if Dvar.IBEGCHEFE("LKSQOLNKLP") and not Engine.BECCFCBIAA("acceptedEULA", var_5_0) then
			Engine.DAGFFDGFII("profile_SetAcceptedEULA")
			Engine.DAGFFDGFII("profile_SetHasEverPlayed_MainMenu")
			Engine.DAGFFDGFII("updategamerprofile")
		end

		if Dvar.IBEGCHEFE("unattended") then
			return
		elseif Dvar.IBEGCHEFE("NNPRNQMTQO") == true then
			local var_5_4 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_5_4, nil, false, true)
		elseif not Engine.CGABICJHAI() and var_5_2 < #Languages and var_5_3 ~= var_5_2 then
			if Engine.CGFGDJCJHI(var_5_2) then
				local var_5_5 = {
					currentLanguage = var_5_3,
					preferredLanguage = var_5_2
				}

				LUI.FlowManager.RequestPopupMenu(unused, "PopupLanguageRestart", true, var_5_0, false, var_5_5, nil, true, true)
			end
		elseif not Engine.BECCFCBIAA("acceptedEULA", var_5_0) then
			arg_5_0._state = LUI.Fence.STATE.block

			if not arg_5_0._openedEULA then
				arg_5_0._openedEULA = true

				BOOT.InitializeLegalBootPopupsSequence()

				local var_5_6 = BOOT.GetCurrentLegalBootPopupName()

				if var_5_6 then
					LUI.FlowManager.RequestPopupMenu(unused, var_5_6, false, var_5_0, false, {}, nil, true, true)
				else
					arg_5_0._state = LUI.Fence.STATE.fail
				end
			end

			local var_5_7 = BOOT.GetCurrentLegalBootPopupName()

			if var_5_7 and not LUI.FlowManager.IsInStack(var_5_7) then
				arg_5_0._state = LUI.Fence.STATE.fail
			end
		elseif not Engine.BECCFCBIAA("hasEverPlayed_MainMenu", var_5_0) then
			if Engine.GEHBEDCEC() then
				Engine.DAGFFDGFII("profile_SetHasEverPlayed_MainMenu")

				return
			end

			arg_5_0._state = LUI.Fence.STATE.block

			local var_5_8 = LUI.FlowManager.IsInStack("BootBrightness") or LUI.FlowManager.IsInStack("BootHDRBlackPoint") or LUI.FlowManager.IsInStack("BootHDRWhitePoint")
			local var_5_9 = LUI.FlowManager.IsInStack("ScreenMargins")
			local var_5_10 = LUI.FlowManager.IsInStack("BootOptions")
			local var_5_11 = LUI.FlowManager.IsInStack("BootAudioMixPreset")

			if not arg_5_0._openedBrightnessMenu and not Engine.CGABICJHAI() then
				if Engine.DJDAJEJDE() then
					if not Engine.EBFEGIICEF() then
						Engine.DAGFFDGFII("profile_UpdateProfileMenuOptionsHDRLumDvars")
						LUI.FlowManager.RequestPopupMenu(unused, "BootHDRBlackPoint", false, var_5_0, false, {
							isBootOption = true
						}, nil, true, true)
					end
				else
					LUI.FlowManager.RequestPopupMenu(unused, "BootBrightness", false, var_5_0, false, {
						isBootOption = true
					}, nil, true, true)
				end

				arg_5_0._openedBrightnessMenu = true

				return
			elseif not arg_5_0._setScreenBounds and not Engine.CGABICJHAI() and not var_5_8 then
				LUI.FlowManager.RequestPopupMenu(unused, "ScreenMargins", false, var_5_0, false, {
					isBootOption = true
				}, nil, true, true)

				arg_5_0._setScreenBounds = true

				return
			elseif not arg_5_0._openedAudioMixPreset and not var_5_8 and not var_5_9 then
				LUI.FlowManager.RequestPopupMenu(unused, "BootAudioMixPreset", false, var_5_0, false, {}, nil, true, true)

				arg_5_0._openedAudioMixPreset = true

				return
			elseif not arg_5_0._openedBootOptions and not var_5_11 and not var_5_8 and not var_5_9 then
				LUI.FlowManager.RequestPopupMenu(unused, "BootOptions", false, var_5_0, false, {}, nil, true, true)

				arg_5_0._openedBootOptions = true

				return
			elseif not var_5_11 and not var_5_10 and not var_5_8 and not var_5_9 then
				arg_5_0._state = LUI.Fence.STATE.pass

				Engine.DAGFFDGFII("profile_SetHasEverPlayed_MainMenu")

				if not Engine.CGABICJHAI() then
					Engine.DAGFFDGFII("updategamerprofile")
				end

				if IsLanguageSubtitleOnByDefault() then
					Engine.BGDAJBJBFF(var_5_0, true)
				end
			end
		end
	end
end

function PopupCorruptData(arg_6_0, arg_6_1)
	local var_6_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_MESSAGE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK"),
		confirmation_action = function(arg_7_0, arg_7_1)
			Engine.EBHEBCCBFD(arg_7_1.controller)
			LUI.FlowManager.RequestLeaveMenuByName("popup_corrupt_data", true)
		end
	}
	local var_6_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_6_0)

	var_6_1.id = "popup_corrupt_data"

	return var_6_1
end

local function var_0_0(arg_8_0, arg_8_1)
	assert(arg_8_1.controllerIndex)
	assert(arg_8_1.currentLanguage)
	assert(arg_8_1.preferredLanguage)

	local var_8_0 = GetLanguageDisplayName(arg_8_1.currentLanguage)
	local var_8_1 = GetLanguageDisplayName(arg_8_1.preferredLanguage)
	local var_8_2 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LANGUAGE_SELECT/MISMATCH", var_8_0, var_8_1),
		yesAction = function(arg_9_0, arg_9_1)
			DCache.EAEHIJBBCD(arg_8_1.preferredLanguage)
			Engine.BHIJFFCAEB("")
		end,
		noAction = function(arg_10_0, arg_10_1)
			Engine.CEHDAACIJA(arg_8_1.controllerIndex, arg_8_1.currentLanguage)
			Engine.DAGFFDGFII("updategamerprofile")
		end
	}
	local var_8_3 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_8_2)

	var_8_3.id = "PopupLanguageRestart"

	return var_8_3
end

MenuBuilder.registerType("PopupLanguageRestart", var_0_0)
MenuBuilder.registerType("popup_corrupt_data", PopupCorruptData)
LUI.Fence.Register("gamerProfile", FenceGamerProfile)
LockTable(_M)
