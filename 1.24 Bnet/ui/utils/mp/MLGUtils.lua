MLG = MLG or {}

function MLG.GetRulesVersionNumber()
	local var_1_0 = MatchRules.BIJEDCBCBH("mlgVersion")

	if var_1_0 == nil or var_1_0 == "" then
		var_1_0 = "0.0.0"
	end

	return Engine.JCBDICCAH(var_1_0)
end

function MLG.IsFeatureAvailable()
	local var_2_0 = Dvar.IBEGCHEFE("LPSPMQSNPQ") or IsPrivateMatch and IsPrivateMatch()

	var_2_0 = var_2_0 or Dvar.IBEGCHEFE("MTMMPLSRNL")
	var_2_0 = var_2_0 and not Engine.EAIICIFIFA()
	var_2_0 = var_2_0 and Dvar.IBEGCHEFE("LTSMQMMQRK")

	return var_2_0
end

function MLG.CanIAdjustMLGSettings()
	if not MLG.IsFeatureAvailable() then
		return false
	end

	return Dvar.IBEGCHEFE("LPSPMQSNPQ") or Lobby.DFFFFJHCEH()
end

function MLG.AreMLGRulesEnabled()
	if not MLG.IsFeatureAvailable() then
		return false
	end

	local var_4_0 = Dvar.IBEGCHEFE("LPSPMQSNPQ")

	if Dvar.IBEGCHEFE("LOMTKQTRTM") == nil then
		Engine.EBIDFIDHIE("set LOMTKQTRTM 0")
	end

	return Lobby.DFHGBJJAGC()
end

function MLG.SetUsingMLGRules(arg_5_0)
	Dvar.DHEGHJJJHI("LOMTKQTRTM", arg_5_0)
	Lobby.CIIBDIGFFC(arg_5_0)

	local var_5_0 = Engine.JEDFGECDJ() > 1
	local var_5_1 = CoD.IsUsingAspectRatio(1.3333333333333333)

	if var_5_0 or var_5_1 then
		for iter_5_0 = 0, Engine.DCJGJDDEHE() - 1 do
			LobbyMember.BABJJDBHCH(false, iter_5_0)
		end
	end
end

function MLG.ToggleMLGRules(arg_6_0)
	if MLG.CanIAdjustMLGSettings() then
		if not MLG.AreMLGRulesEnabled() then
			local var_6_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			if StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_6_0, CSV.gameTypesTable.cols.MLG) == "1" and MatchRules.DHIADABBII() then
				MLG.SetUsingMLGRules(true)
				MatchRules.BIHEJBBCDH()
			elseif not Engine.CBBGBGBFJF(arg_6_0) then
				LUI.FlowManager.RequestPopupMenu(self, "mlg_error_no_rules_available_offline", false, arg_6_0, false)
			else
				LUI.FlowManager.RequestPopupMenu(self, "mlg_error_no_rules_available", false, arg_6_0, false)
			end
		else
			MLG.SetUsingMLGRules(false)
			MatchRules.BCECADEHDA()
		end
	end
end

function MLG.Refresh(arg_7_0)
	local var_7_0 = MLG.AreMLGRulesEnabled()

	arg_7_0.properties = arg_7_0.properties or {}

	if arg_7_0.properties.cacheMLGenabled ~= var_7_0 then
		local var_7_1 = "mlg_" .. (var_7_0 and "enabled" or "disabled")

		arg_7_0:dispatchEventToRoot({
			immediate = true,
			name = var_7_1
		})
		MLG.SetButtonHelper(arg_7_0, var_7_0)

		arg_7_0.properties.cacheMLGenabled = var_7_0
	end
end

function MLG.SetButtonHelper(arg_8_0, arg_8_1)
	local var_8_0 = ""

	if MLG.CanIAdjustMLGSettings() then
		if arg_8_1 then
			var_8_0 = Engine.CBBHFCGDIC("PATCH_MENU/DISABLE_MLG_RULES")
		else
			var_8_0 = Engine.CBBHFCGDIC("PATCH_MENU/ENABLE_MLG_RULES")
		end
	end

	arg_8_0:processEvent({
		clickable = true,
		side = "right",
		name = "add_button_helper_text",
		button_ref = "button_start",
		helper_text = var_8_0
	})
end

function MLG.Toggle(arg_9_0, arg_9_1)
	if MLG.CanIAdjustMLGSettings() then
		MLG.ToggleMLGRules(arg_9_1.controller)
	end

	MLG.Refresh(arg_9_0)
end

function MLG.Hide(arg_10_0)
	arg_10_0:processEvent({
		name = "mlg_disabled"
	})
	arg_10_0:processEvent({
		button_ref = "button_start",
		name = "add_button_helper_text",
		helper_text = "",
		side = "right"
	})
end

function MLG.ShoutcasterProfileVarValue(arg_11_0, arg_11_1)
	local var_11_0 = MLG.DCCIBJGEAG(arg_11_0)

	if var_11_0 ~= nil and var_11_0[arg_11_1] ~= nil then
		return var_11_0[arg_11_1]:get()
	end

	return nil
end

function MLG.ShoutcasterProfileVarBool(arg_12_0, arg_12_1)
	return MLG.ShoutcasterProfileVarValue(arg_12_0, arg_12_1) == 1 and true or false
end

function MLG.SetShoutcasterProfileVarValue(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = MLG.DCCIBJGEAG(arg_13_0)

	if var_13_0 ~= nil and var_13_0[arg_13_1] ~= nil then
		var_13_0[arg_13_1]:set(arg_13_2)
	end

	Engine.EBIDFIDHIE("updategamerprofile")
end

function MLG.ShoutcasterProfileVarDefaultValue(arg_14_0, arg_14_1)
	local var_14_0 = MLG.DCJHAJAHAH()

	if var_14_0 ~= nil and var_14_0[arg_14_1] ~= nil then
		return var_14_0[arg_14_1].defaultValue
	end

	return nil
end

Outlines = {
	friendly = 1,
	all = 0,
	enemy = 2,
	none = 3
}

function MLG.GetXrayModeByShoutcasterValue(arg_15_0)
	local var_15_0 = Outlines.none

	if arg_15_0 == 0 then
		var_15_0 = Outlines.friendly
	elseif arg_15_0 == 1 then
		var_15_0 = Outlines.enemy
	elseif arg_15_0 == 2 then
		var_15_0 = Outlines.all
	end

	return var_15_0
end

function MLG.IsCDLActive(arg_16_0)
	if not Dvar.IBEGCHEFE("MMTOPPQOON") then
		return false
	end

	if CONDITIONS.IsMagmaGameMode() then
		return false
	end

	if not Engine.DDJFBBJAIG() and Dvar.IBEGCHEFE("NTLNTTNNLQ") then
		return false
	end

	if CONDITIONS.IsInGameBattlesMatch() then
		return MLG.AreMLGRulesEnabled()
	end

	if MatchRules.EAIEFBHGJ() then
		return MatchRules.BIJEDCBCBH("cwlRulesEnabled")
	end
end

function MLG.IsHost()
	local var_17_0 = Lobby.BBDICGHE()

	return var_17_0 and Lobby.DFFFFJHCEH() or not var_17_0 and Lobby.BGIADHIHAG()
end

function MLG.ArbitrarilySetCDLRuleset(arg_18_0, arg_18_1)
	if MLG.IsHost() then
		if MP.GetLastQuickplayFilter(arg_18_0) == MP.PLAYLIST_FILTER_MODE.CDLRules and (not Lobby.GFFECBCCF() or Lobby.BGIADHIHAG()) then
			MatchRules.DJEIAJCAD()
			MLG.SetUsingMLGRules(true)
		else
			MLG.ResetMatchRulesData()
		end
	elseif not arg_18_1 then
		if Lobby.DFHGBJJAGC() then
			MatchRules.DJEIAJCAD()
		else
			MLG.ResetMatchRulesData()
		end
	end
end

function MLG.ResetMatchRulesData()
	if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH("cwlRulesEnabled") then
		MatchRules.BCECADEHDA()
		MLG.SetUsingMLGRules(false)
	end
end
