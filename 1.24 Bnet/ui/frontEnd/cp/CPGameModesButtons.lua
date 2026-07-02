module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 and #arg_1_1 > 0 then
		MatchRules.CIGFFEAEFD("gametype", arg_1_1)
		MatchRules.BCECADEHDA()

		local var_1_0 = Lobby.GetDefaultMapForGameType(arg_1_1)

		Dvar.BDEHAEGHAF("NSQLTTMRMP", var_1_0)
		Engine.DAGFFDGFII("enable_pvpe 0")
	end

	ACTIONS.LeaveMenu(arg_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.ClassicButton then
		arg_2_0.ClassicButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			var_0_0(arg_2_0, CP.CLASSIC_MISSIONS)
		end)
	end

	arg_2_0._hasCrossplayPlayer = Engine.BEAJHICIEF()

	if arg_2_0.SurvivalButton then
		arg_2_0.SurvivalButton:SetButtonDisabled(arg_2_0._hasCrossplayPlayer)
		arg_2_0.SurvivalButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			arg_2_0.SurvivalButton:SetButtonDisabled(arg_2_0._hasCrossplayPlayer)

			if Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_3_INDEX) == false then
				local var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP3")

				local function var_4_1(arg_5_0, arg_5_1)
					if Engine.CFHBIHABCB(arg_5_1) then
						LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_5_1, false)
					end
				end

				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					message = var_4_0,
					action = var_4_1
				})
			else
				var_0_0(arg_2_0, CP.WAVE_SURVIVAL)
			end
		end)

		arg_2_0.checkCrossPlayPlayerTimer = LUI.UITimer.new({
			interval = 500,
			event = "check_crossplay_players"
		})
		arg_2_0.checkCrossPlayPlayerTimer.id = "lobbyTimer"

		arg_2_0:addElement(arg_2_0.checkCrossPlayPlayerTimer)
		arg_2_0:addEventHandler("check_crossplay_players", function()
			arg_2_0._hasCrossplayPlayer = Engine.BEAJHICIEF()

			arg_2_0.SurvivalButton:SetButtonDisabled(arg_2_0._hasCrossplayPlayer)
		end)
	end

	if arg_2_0.SpecOpsButton then
		arg_2_0.SpecOpsButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			var_0_0(arg_2_0, CP.SPEC_OPS)
		end)
	end

	local var_2_0 = Lobby.GetCurrentGameType()

	if var_2_0 == CP.CLASSIC_MISSIONS and arg_2_0.ClassicButton then
		local var_2_1 = arg_2_0:GetIndexForElement(arg_2_0.ClassicButton)

		arg_2_0:SetDefaultFocus(var_2_1)
	elseif var_2_0 == CP.WAVE_SURVIVAL and arg_2_0.SurvivalButton then
		local var_2_2 = arg_2_0:GetIndexForElement(arg_2_0.SurvivalButton)

		arg_2_0:SetDefaultFocus(var_2_2)
	elseif var_2_0 == CP.SPEC_OPS and arg_2_0.SpecOpsButton then
		local var_2_3 = arg_2_0:GetIndexForElement(arg_2_0.SpecOpsButton)

		arg_2_0:SetDefaultFocus(var_2_3)
	end
end

function CPGameModesButtons(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalList.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 400 * _1080p)

	var_8_0.id = "CPGameModesButtons"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:SetSpacing(10 * _1080p)

	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "ClassicButton"

	var_8_4.Text:SetLeft(_1080p * 20, 0)
	var_8_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/CLASSIC_MISSIONS")), 0)
	var_8_4.Text:SetAlignment(LUI.Alignment.Left)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 40)
	var_8_0:addElement(var_8_4)

	var_8_0.ClassicButton = var_8_4

	local var_8_5

	if CONDITIONS.IsSurvivalModeAllowed(var_8_0) then
		local var_8_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_8_1
		})

		var_8_6.id = "SurvivalButton"

		if CONDITIONS.IsSurvivalModeAllowed(var_8_0) then
			-- block empty
		end

		var_8_6.Text:SetLeft(_1080p * 20, 0)
		var_8_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/WAVE_SURVIVAL")), 0)
		var_8_6.Text:SetAlignment(LUI.Alignment.Left)
		var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 50, _1080p * 90)
		var_8_0:addElement(var_8_6)

		var_8_0.SurvivalButton = var_8_6
	end

	local var_8_7

	if CONDITIONS.AreDevFeaturesEnabled(var_8_0) then
		local var_8_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_8_1
		})

		var_8_8.id = "SpecOpsButton"

		if CONDITIONS.AreDevFeaturesEnabled(var_8_0) then
			-- block empty
		end

		var_8_8.Text:SetLeft(_1080p * 20, 0)
		var_8_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/SURVIVAL")), 0)
		var_8_8.Text:SetAlignment(LUI.Alignment.Left)
		var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 100, _1080p * 140)
		var_8_0:addElement(var_8_8)

		var_8_0.SpecOpsButton = var_8_8
	end

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("CPGameModesButtons", CPGameModesButtons)
LockTable(_M)
