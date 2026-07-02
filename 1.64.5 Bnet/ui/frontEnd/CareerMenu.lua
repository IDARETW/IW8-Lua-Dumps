module(..., package.seeall)

local var_0_0 = 55

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

local function var_0_2(arg_3_0)
	local var_3_0 = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_3_0,
		_rankTypeOverride = PROGRESSION.RANK_TYPES.MILITARY
	})

	DebugPrint("CareerMenu::GetMilitaryRankData rank=" .. var_3_0._rank .. "/" .. var_3_0._rankMax .. " percentage=" .. var_3_0._rankPercentage .. ".")

	return {
		title = "LUA_MENU/MILITARY",
		isCoreProgression = true,
		controllerIndex = arg_3_0,
		rankDisplay = var_3_0._rankDisplay,
		rankName = var_3_0._rankName,
		image = var_3_0._rankIcon,
		percentage = var_3_0._rankPercentage,
		isComplete = PROGRESSION.GetPlayerIsInSeasonalProgression(arg_3_0),
		action = function(arg_4_0, arg_4_1)
			local var_4_0 = {}

			LUI.FlowManager.RequestAddMenu("UnlocksMenu", true, arg_4_1.controller, nil, var_4_0, true)
		end
	}
end

local function var_0_3(arg_5_0)
	return {
		isPrestigeShop = true,
		prestigeKeyCount = Commerce.CEDDCGHIGA(arg_5_0, LOOT.CurrencyIDs.PRESTIGE_TOKENS),
		action = function(arg_6_0, arg_6_1)
			LUI.FlowManager.RequestPopupMenu(self, "prestigestorepopup", false, arg_5_0, false, BR.GetPrestigeStorePopupData())
		end
	}
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0

	if arg_7_2 == 0 then
		var_7_0 = var_0_2(arg_7_3)
	elseif arg_7_2 == 1 then
		var_7_0 = var_0_3(arg_7_3)
	end

	return var_7_0
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0
	local var_8_1 = arg_8_0.SeasonGrid:GetNumColumns() * arg_8_2 + arg_8_1 + 1
	local var_8_2 = SEASON.GetCurrentSeasonDisplayNum()
	local var_8_3 = var_0_2(arg_8_3)

	if var_8_2 < var_8_1 or var_8_3.isComplete == false then
		var_8_0 = {
			isSeasonalProgression = true,
			isClassified = true
		}
	else
		local var_8_4 = SEASON.GetSeasonDataNumFromDisplayNum(var_8_1)
		local var_8_5 = PROGRESSION.GetPlayerProgressionData({
			_controllerIndex = arg_8_3,
			_seasonNumOverride = var_8_4,
			_rankTypeOverride = PROGRESSION.RANK_TYPES.SEASONAL
		})

		DebugPrint("CareerMenu::GetSeasonalData season " .. var_8_1 .. " rank=" .. var_8_5._rank .. "/" .. var_8_5._rankMax .. " percentage=" .. var_8_5._rankPercentage .. ".")

		var_8_0 = {
			isSeasonalProgression = true,
			isSeasonActive = var_8_1 == var_8_2,
			season = var_8_1,
			prestige = var_8_5._prestige,
			rank = var_8_5._rank,
			rankDisplay = var_8_5._rankDisplay,
			controllerIndex = arg_8_3,
			percentage = var_8_5._rankPercentage,
			image = var_8_5._rankIcon,
			isComplete = var_8_5._isXpProgressionComplete,
			isInSeasonProgression = PROGRESSION.GetPlayerIsInSeasonalProgression(arg_8_3)
		}

		if var_8_0.isInSeasonProgression then
			function var_8_0.action(arg_9_0, arg_9_1)
				local var_9_0 = {
					season = var_8_1 < SEASON.WZ_LEGACY_SEASON_DISPLAY_NUM and var_8_1 or 5
				}

				LUI.FlowManager.RequestAddMenu("SeasonalProgressionMenu", true, arg_9_1.controller, nil, var_9_0, true)
			end
		end
	end

	return var_8_0
end

local function var_0_6(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.localGrid
	local var_10_1 = arg_10_1.otherGrid

	assert(var_10_0)
	assert(var_10_1)

	local var_10_2 = arg_10_1.columns or 1
	local var_10_3 = arg_10_1.rows or 1

	var_10_0:SetNumChildren(var_10_3 * var_10_2)
	var_10_0:SetNumColumns(var_10_2)
	var_10_0:SetNumRows(var_10_3)

	local var_10_4 = arg_10_1.dataFunc

	assert(var_10_4)
	var_10_0:SetRefreshChild(function(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = var_10_4(arg_10_0, arg_11_1, arg_11_2, arg_10_0._controllerIndex)

		if var_11_0 then
			arg_11_0.columnIdx = arg_11_1
			arg_11_0.rowIdx = arg_11_2
			arg_11_0.buttonAction = var_11_0.action

			arg_11_0:UpdateData(var_11_0)
		end

		if not arg_11_0.hasHandlers then
			arg_11_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
				if var_11_0 and var_11_0.isClassified then
					ACTIONS.AnimateSequence(arg_11_0, "ActiveClassified")
				elseif var_11_0 and var_11_0.isSeasonalProgression and not var_11_0.isInSeasonProgression then
					ACTIONS.AnimateSequence(arg_11_0, "ActiveNotInSeasonal")
				else
					ACTIONS.AnimateSequence(arg_11_0, "Active")
				end
			end)
			arg_11_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
				if var_11_0 and var_11_0.isClassified then
					ACTIONS.AnimateSequence(arg_11_0, "Classified")
				else
					ACTIONS.AnimateSequence(arg_11_0, "Inactive")
				end
			end)
			arg_11_0:addEventHandler("button_action", function(arg_14_0, arg_14_1)
				if arg_14_0.buttonAction then
					arg_14_0.buttonAction(elem, arg_14_1)
				end
			end)

			if var_11_0 and var_11_0.isClassified then
				ACTIONS.AnimateSequence(arg_11_0, "Classified")
			elseif var_11_0 and var_11_0.isSeasonalProgression and not var_11_0.isInSeasonProgression then
				ACTIONS.AnimateSequence(arg_11_0, "InactiveNotInSeasonal")
			else
				ACTIONS.AnimateSequence(arg_11_0, "Inactive")
			end

			arg_11_0.hasHandlers = true
		end
	end)
	var_10_0:RefreshContent()
end

local function var_0_7(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local function var_15_0(arg_16_0, arg_16_1)
		local var_16_0 = arg_15_3.WasCompleted(arg_16_0, arg_16_1)
		local var_16_1 = PROGRESSION.GetPlayerRank(arg_16_1) + 1 >= var_0_0

		if not var_16_0 and var_16_1 then
			local var_16_2 = ONBOARDING_DATA.GetOnboardingCH2MWWZCareerSeaonLevelingData()

			function var_16_2.confirmButton.action(arg_17_0, arg_17_1)
				ACTIONS.LeaveMenu(arg_17_0)
			end

			LUI.FlowManager.RequestPopupMenu(arg_16_0, "onboardingpopup", true, arg_16_1, false, var_16_2)
			arg_15_3.MarkCompleted(arg_16_0, arg_16_1)
		end
	end

	;(function(arg_18_0, arg_18_1)
		if not arg_15_2.WasCompleted(arg_18_0, arg_18_1) then
			local var_18_0 = ONBOARDING_DATA.GetOnboardingCH2MWWZCareerData()

			function var_18_0.confirmButton.action(arg_19_0, arg_19_1)
				ACTIONS.LeaveMenu(arg_19_0)
				var_15_0(arg_18_0, arg_19_1)
			end

			LUI.FlowManager.RequestPopupMenu(arg_18_0, "onboardingpopup", true, arg_18_1, false, var_18_0)
			arg_15_2.MarkCompleted(arg_18_0, arg_18_1)
		else
			var_15_0(arg_18_0, arg_18_1)
		end
	end)(arg_15_0, arg_15_1)
end

local function var_0_8(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.CoreGrid:GetElementAtPosition(0, 0)

	ACTIONS.AnimateSequence(var_20_0, "SetCurrentCareerMode")

	local var_20_1 = arg_20_0.SeasonGrid:GetElementAtPosition(0, 0)
	local var_20_2 = arg_20_0.SeasonGrid:GetElementAtPosition(1, 0)
	local var_20_3 = arg_20_0.SeasonGrid:GetElementAtPosition(2, 0)
	local var_20_4 = arg_20_0.SeasonGrid:GetElementAtPosition(0, 1)
	local var_20_5 = arg_20_0.SeasonGrid:GetElementAtPosition(1, 1)
	local var_20_6 = arg_20_0.SeasonGrid:GetElementAtPosition(2, 1)

	arg_20_0.AssignNavigationToButton(var_20_0, var_20_0, var_20_0, var_20_3, var_20_1)
	arg_20_0.AssignNavigationToButton(var_20_1, var_20_4, var_20_4, var_20_0, var_20_2)
	arg_20_0.AssignNavigationToButton(var_20_2, var_20_5, var_20_5, var_20_1, var_20_3)
	arg_20_0.AssignNavigationToButton(var_20_3, var_20_6, var_20_6, var_20_2, var_20_0)
	arg_20_0.AssignNavigationToButton(var_20_4, var_20_1, var_20_1, var_20_0, var_20_5)
	arg_20_0.AssignNavigationToButton(var_20_5, var_20_2, var_20_2, var_20_4, var_20_6)
	arg_20_0.AssignNavigationToButton(var_20_6, var_20_3, var_20_3, var_20_5, var_20_0)
end

local function var_0_9(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	arg_21_0.navigation = {}
	arg_21_0.navigation = {
		up = arg_21_1,
		down = arg_21_2,
		left = arg_21_3,
		right = arg_21_4
	}
end

local function var_0_10(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0._controllerIndex = arg_22_1
	arg_22_0.SetupGrid = var_0_6
	arg_22_0.AssignNavigationToButton = var_0_9
	arg_22_0.SetupNavigation = var_0_8

	arg_22_0:SetupGrid({
		columns = 1,
		rows = 1,
		localGrid = arg_22_0.CoreGrid,
		otherGrid = arg_22_0.SeasonGrid,
		dataFunc = var_0_4
	})
	arg_22_0:SetupGrid({
		columns = 3,
		rows = 2,
		localGrid = arg_22_0.SeasonGrid,
		otherGrid = arg_22_0.CoreGrid,
		dataFunc = var_0_5
	})
	arg_22_0:SetupNavigation(arg_22_0, arg_22_1)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	var_0_1(arg_22_0, arg_22_1, arg_22_2)

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_0_7(arg_22_0, arg_22_1, Onboarding.CareerWZ, Onboarding.CareerWZSeasonLeveling)
	else
		var_0_7(arg_22_0, arg_22_1, Onboarding.CareerMW, Onboarding.CareerMWSeasonLeveling)
	end
end

function CareerMenu(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIHorizontalNavigator.new()

	var_23_0.id = "CareerMenu"

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	var_23_0.soundSet = "mpMainMenu"
	var_23_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_23_1
	})
	var_23_0.HelperBar.id = "HelperBar"

	var_23_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_23_0.HelperBar:setPriority(10)
	var_23_0:addElement(var_23_0.HelperBar)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SeasonProgressionOverviewButton", {
				controllerIndex = var_23_1
			})
		end,
		refreshChild = function(arg_25_0, arg_25_1, arg_25_2)
			return
		end,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 244,
		rowHeight = _1080p * 346,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_23_5 = LUI.UIGrid.new(var_23_4)

	var_23_5.id = "CoreGrid"

	var_23_5:setUseStencil(true)
	var_23_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 449, _1080p * 693, _1080p * 250, _1080p * 958)
	var_23_0:addElement(var_23_5)

	var_23_0.CoreGrid = var_23_5

	local var_23_6
	local var_23_7 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 3,
		maxVisibleRows = 2,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SeasonProgressionOverviewButton", {
				controllerIndex = var_23_1
			})
		end,
		refreshChild = function(arg_27_0, arg_27_1, arg_27_2)
			return
		end,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 244,
		rowHeight = _1080p * 346,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_23_8 = LUI.UIGrid.new(var_23_7)

	var_23_8.id = "SeasonGrid"

	var_23_8:setUseStencil(true)
	var_23_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 724, _1080p * 1486, _1080p * 250, _1080p * 958)
	var_23_0:addElement(var_23_8)

	var_23_0.SeasonGrid = var_23_8

	var_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_23_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_23_9 = LUI.UIBindButton.new()

	var_23_9.id = "selfBindButton"

	var_23_0:addElement(var_23_9)

	var_23_0.bindButton = var_23_9

	var_0_10(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("CareerMenu", CareerMenu)
LockTable(_M)
