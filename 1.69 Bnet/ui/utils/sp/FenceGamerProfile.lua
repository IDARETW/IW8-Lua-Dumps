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
	Engine.DCIDFCJAEI()
end

function FenceGamerProfile.OnPass(arg_5_0)
	if Dvar.IBEGCHEFE("NQROMTQPMT") then
		for iter_5_0 = 0, Engine.DCJGJDDEHE() - 1 do
			if Engine.BBHAECABBD(iter_5_0) and Engine.BFDACIJIAD(iter_5_0) then
				COLOR_BLIND.UpdateAllSwatches(iter_5_0)
			end
		end
	end
end

function FenceGamerProfile.UpdateState(arg_6_0)
	assert(arg_6_0._state ~= LUI.Fence.STATE.fail)

	arg_6_0._state = LUI.Fence.STATE.pass

	local var_6_0

	for iter_6_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_6_0) then
			if Engine.BFDACIJIAD(iter_6_0) then
				var_6_0 = iter_6_0
			end

			if Engine.CIEGIACHAE() and Engine.CBGJIDFIDE(iter_6_0) then
				if not LUI.FlowManager.IsInStack("popup_corrupt_data") then
					LUI.FlowManager.RequestPopupMenu(nil, "popup_corrupt_data", true, iter_6_0, false, {}, nil, false, true)
				end

				arg_6_0._state = LUI.Fence.STATE.block

				return
			end

			if Engine.BGGFCBBEC(iter_6_0) == #Languages then
				local var_6_1 = Engine.DGAIDIEIAC()

				Engine.CEHDAACIJA(iter_6_0, var_6_1)

				if not Engine.CGABICJHAI() then
					Engine.DAGFFDGFII("updategamerprofile")
				end
			end
		end
	end

	if Engine.DBFCJBDJEC() and not Engine.JBIHDJBH() then
		return
	end

	if (Engine.CHBHFFFIGH() or Engine.EAABDHIDFJ()) and not Engine.DFHAHCAEJG() then
		return
	end

	if var_6_0 and Engine.CDCCDDJAJJ(var_6_0) and not Engine.CIFGGDIGBE(var_6_0) then
		local var_6_2 = Engine.BGGFCBBEC(var_6_0)
		local var_6_3 = Engine.DGAIDIEIAC()

		if Dvar.IBEGCHEFE("LKSQOLNKLP") and Engine.BECCFCBIAA("acceptedEULA_Version", var_6_0) < Dvar.CFHDGABACF("QOMKPKKTP") then
			Engine.DAGFFDGFII("profile_SetAcceptedEULA")
			Engine.DAGFFDGFII("profile_SetHasEverPlayed_MainMenu")
			Engine.DAGFFDGFII("updategamerprofile")
		end

		local var_6_4 = false
		local var_6_5 = BOOT.GetCurrentLegalBootPopupName()

		if var_6_5 then
			var_6_4 = LUI.FlowManager.IsInStack(var_6_5)
		end

		if Dvar.IBEGCHEFE("unattended") then
			return
		elseif Dvar.IBEGCHEFE("NNPRNQMTQO") == true then
			local var_6_6 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_6_6, nil, false, true)
		elseif not Engine.CGABICJHAI() and var_6_2 < #Languages and var_6_3 ~= var_6_2 then
			if Engine.CGFGDJCJHI(var_6_2) then
				local var_6_7 = {
					currentLanguage = var_6_3,
					preferredLanguage = var_6_2
				}

				LUI.FlowManager.RequestPopupMenu(unused, "PopupLanguageRestart", true, var_6_0, false, var_6_7, nil, true, true)
			end
		elseif Engine.BECCFCBIAA("acceptedEULA_Version", var_6_0) < Dvar.CFHDGABACF("QOMKPKKTP") then
			arg_6_0._state = LUI.Fence.STATE.block

			if not arg_6_0._openedEULA then
				arg_6_0._openedEULA = true

				BOOT.InitializeLegalBootPopupsSequence()

				local var_6_8 = BOOT.GetCurrentLegalBootPopupName()

				if var_6_8 then
					LUI.FlowManager.RequestPopupMenu(unused, var_6_8, false, var_6_0, false, {}, nil, true, true)

					var_6_4 = true
				else
					arg_6_0._state = LUI.Fence.STATE.fail
				end
			end

			if not var_6_4 then
				arg_6_0._state = LUI.Fence.STATE.fail
			end
		elseif not Engine.BECCFCBIAA("hasEverPlayed_MainMenu", var_6_0) then
			if Engine.GEHBEDCEC() then
				Engine.DAGFFDGFII("profile_SetHasEverPlayed_MainMenu")

				return
			end

			arg_6_0._state = LUI.Fence.STATE.block

			local var_6_9 = LUI.FlowManager.IsInStack("BootBrightness") or LUI.FlowManager.IsInStack("BootHDRBlackPoint") or LUI.FlowManager.IsInStack("BootHDRWhitePoint")
			local var_6_10 = LUI.FlowManager.IsInStack("ScreenMargins")
			local var_6_11 = LUI.FlowManager.IsInStack("BootOptions")
			local var_6_12 = LUI.FlowManager.IsInStack("BootAudioMixPreset")

			if not arg_6_0._openedBrightnessMenu and not Engine.CGABICJHAI() then
				if Engine.DJDAJEJDE() then
					if not Engine.EBFEGIICEF() then
						Engine.DAGFFDGFII("profile_UpdateProfileMenuOptionsHDRLumDvars")
						LUI.FlowManager.RequestPopupMenu(unused, "BootHDRBlackPoint", false, var_6_0, false, {
							isBootOption = true
						}, nil, true, true)
					end
				else
					LUI.FlowManager.RequestPopupMenu(unused, "BootBrightness", false, var_6_0, false, {
						isBootOption = true
					}, nil, true, true)
				end

				arg_6_0._openedBrightnessMenu = true

				return
			elseif not arg_6_0._setScreenBounds and not Engine.CGABICJHAI() and not var_6_9 then
				LUI.FlowManager.RequestPopupMenu(unused, "ScreenMargins", false, var_6_0, false, {
					isBootOption = true
				}, nil, true, true)

				arg_6_0._setScreenBounds = true

				return
			elseif not arg_6_0._openedAudioMixPreset and not var_6_9 and not var_6_10 then
				LUI.FlowManager.RequestPopupMenu(unused, "BootAudioMixPreset", false, var_6_0, false, {}, nil, true, true)

				arg_6_0._openedAudioMixPreset = true

				return
			elseif not arg_6_0._openedBootOptions and not var_6_12 and not var_6_9 and not var_6_10 then
				LUI.FlowManager.RequestPopupMenu(unused, "BootOptions", false, var_6_0, false, {}, nil, true, true)

				arg_6_0._openedBootOptions = true

				return
			elseif not var_6_12 and not var_6_11 and not var_6_9 and not var_6_10 then
				arg_6_0._state = LUI.Fence.STATE.pass

				Engine.DAGFFDGFII("profile_SetHasEverPlayed_MainMenu")

				if not Engine.CGABICJHAI() then
					Engine.DAGFFDGFII("updategamerprofile")
				end

				if IsLanguageSubtitleOnByDefault() then
					Engine.BGDAJBJBFF(var_6_0, true)
				end
			end
		elseif var_6_4 and Engine.CGABICJHAI() then
			arg_6_0._state = LUI.Fence.STATE.block
		end
	end
end

function PopupCorruptData(arg_7_0, arg_7_1)
	local var_7_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_MESSAGE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK"),
		confirmation_action = function(arg_8_0, arg_8_1)
			Engine.EBHEBCCBFD(arg_8_1.controller)
			LUI.FlowManager.RequestLeaveMenuByName("popup_corrupt_data", true)
		end
	}
	local var_7_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_7_0)

	var_7_1.id = "popup_corrupt_data"

	return var_7_1
end

local function var_0_0(arg_9_0, arg_9_1)
	assert(arg_9_1.controllerIndex)
	assert(arg_9_1.currentLanguage)
	assert(arg_9_1.preferredLanguage)

	local var_9_0 = GetLanguageDisplayName(arg_9_1.currentLanguage)
	local var_9_1 = GetLanguageDisplayName(arg_9_1.preferredLanguage)
	local var_9_2 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LANGUAGE_SELECT/MISMATCH", var_9_0, var_9_1),
		yesAction = function(arg_10_0, arg_10_1)
			DCache.EAEHIJBBCD(arg_9_1.preferredLanguage)
			Engine.BHIJFFCAEB("")
		end,
		noAction = function(arg_11_0, arg_11_1)
			Engine.CEHDAACIJA(arg_9_1.controllerIndex, arg_9_1.currentLanguage)
			Engine.DAGFFDGFII("updategamerprofile")
		end
	}
	local var_9_3 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_9_2)

	var_9_3.id = "PopupLanguageRestart"

	return var_9_3
end

MenuBuilder.registerType("PopupLanguageRestart", var_0_0)
MenuBuilder.registerType("popup_corrupt_data", PopupCorruptData)
LUI.Fence.Register("gamerProfile", FenceGamerProfile)
LockTable(_M)
