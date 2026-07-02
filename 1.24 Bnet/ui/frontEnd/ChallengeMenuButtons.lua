module(..., package.seeall)

local function var_0_0(arg_1_0)
	if Engine.DBAEJAHFGJ(arg_1_0) then
		LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_1_0, false)

		return true
	end

	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MissionsButton:AddTooltipData(arg_2_1, {
		tooltipDescription = arg_2_0.MissionsButton.Description:getText()
	})
	arg_2_0.MissionsButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not var_0_0(arg_3_1.controller) then
			LUI.FlowManager.RequestAddMenu("ChallengeMenuMissions", true, arg_3_1.controller, false, {}, false)
		end
	end)
	arg_2_0.MissionsButton:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		arg_2_2:ShowMissions()
	end)
	arg_2_0.WeekliesButton:AddTooltipData(arg_2_1, {
		tooltipDescription = arg_2_0.WeekliesButton.Description:getText()
	})
	arg_2_0.WeekliesButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if not var_0_0(arg_5_1.controller) then
			local var_5_0, var_5_1 = Challenge.GetWeeklyChallenges(arg_5_1.controller, Challenge.Type.WEEKLY)
			local var_5_2, var_5_3 = Challenge.GetWeeklyChallenges(arg_5_1.controller, Challenge.Type.BR_WEEKLY)
			local var_5_4 = {
				activeIndex = var_5_1 and var_5_3 and math.min(var_5_1, var_5_3) or 1,
				challenges = var_5_0,
				brChallenges = var_5_2
			}

			LUI.FlowManager.RequestAddMenu("BarracksChallengesWeeklyTabs", true, arg_5_1.controller, false, var_5_4, false)
		end
	end)
	arg_2_0.WeekliesButton:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		arg_2_2:ShowWeeklies()
	end)
	arg_2_0.DailiesButton:AddTooltipData(arg_2_1, {
		tooltipDescription = arg_2_0.DailiesButton.Description:getText()
	})
	arg_2_0.DailiesButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if not var_0_0(arg_7_1.controller) then
			LUI.FlowManager.RequestAddMenu("BarracksChallengesDailyContainer", true, arg_7_1.controller, false, {}, false)
		end
	end)
	arg_2_0.DailiesButton:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		arg_2_2:ShowDailies()
	end)

	if Dvar.IBEGCHEFE("MSSTOMNNMR") then
		arg_2_0.MastersButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			if not var_0_0(arg_9_1.controller) then
				LUI.FlowManager.RequestAddMenu("MasterChallengesMenu", true, arg_9_1.controller, false, {}, false)
			end
		end)
		arg_2_0.MastersButton:SetButtonDisabled(false)
		arg_2_0.MastersButton:AddTooltipData(arg_2_1, {
			tooltipDescription = arg_2_0.MastersButton.Description:getText()
		})
		arg_2_0.MastersButton:addEventHandler("button_over", function(arg_10_0, arg_10_1)
			arg_2_2:ShowMasterChallenges()
		end)
	else
		arg_2_0.MastersButton:closeTree()

		arg_2_0.MastersButton = nil
	end
end

local function var_0_2(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetupButtons = var_0_1
end

function ChallengeMenuButtons(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalList.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 709 * _1080p)

	var_12_0.id = "ChallengeMenuButtons"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0

	var_12_0:SetSpacing(10 * _1080p)

	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "MissionsButton"

	var_12_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/MISSIONS")), 0)
	var_12_4.Description:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSIONS_DESC"), 0)
	var_12_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_12_4.DisabledText:SetAnimMoveTime(2000)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_12_0:addElement(var_12_4)

	var_12_0.MissionsButton = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "WeekliesButton"

	var_12_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/WEEKLY")), 0)
	var_12_6.Description:setText(Engine.CBBHFCGDIC("CHALLENGE/WEEKLY_DESC"), 0)
	var_12_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_12_6.DisabledText:SetAnimMoveTime(2000)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
	var_12_0:addElement(var_12_6)

	var_12_0.WeekliesButton = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "DailiesButton"

	var_12_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/DAILY")), 0)
	var_12_8.Description:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY_DESC"), 0)
	var_12_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_12_8.DisabledText:SetAnimMoveTime(2000)
	var_12_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
	var_12_0:addElement(var_12_8)

	var_12_0.DailiesButton = var_12_8

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "MastersButton"

	var_12_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_TITLE")), 0)
	var_12_10.Description:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_DESC"), 0)
	var_12_10.DisabledText:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_LOCKED"), 0)
	var_12_10.DisabledText:SetAnimMoveTime(2000)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
	var_12_0:addElement(var_12_10)

	var_12_0.MastersButton = var_12_10

	var_0_2(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("ChallengeMenuButtons", ChallengeMenuButtons)
LockTable(_M)
