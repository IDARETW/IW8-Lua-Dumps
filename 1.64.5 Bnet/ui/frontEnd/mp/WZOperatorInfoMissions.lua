module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_2 or not arg_1_2.missionData then
		assert(false, "An options table with a property/value of 'missionData' is required.")
	end

	local var_1_0 = arg_1_2.missionData
	local var_1_1 = Challenge.GetInitialMissionID(var_1_0.id)
	local var_1_2 = Challenge.GetMissionRarity(var_1_1)

	if not arg_1_2.hideBundleUpsellButton and not var_1_0.isOwned and var_1_2 == LOOT.Rarity.OPERATOR_MISSION then
		local var_1_3 = Challenge.GetMissionItemID(var_1_1)

		arg_1_0.BundleUpsellButton:SetupUpsellButtonWithLootID(arg_1_1, var_1_3)
	else
		arg_1_0.BundleUpsellButton:HideButton()
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if not arg_2_2 or not arg_2_2.operatorRef then
		assert(false, "An options table containing the challegeID must be provided to view this screen.")
	end

	local var_2_0 = arg_2_2.challengID
	local var_2_1 = arg_2_2.missionQuests

	if not var_2_1 or #var_2_1 == 0 then
		local var_2_2

		if arg_2_2.singleMissionOverride then
			var_2_2 = arg_2_2.challengeID
		end

		var_2_1 = OPERATOR.GetOutfitMissionQuestsForOperator(arg_2_2.operatorRef, arg_2_1, var_2_2)
	end

	assert(var_2_1, "Could not find mission quests for the operator ref " .. arg_2_2.operatorRef .. ". ")
	arg_2_0.ChallengeGrid:SetNumChildren(#var_2_1)
	arg_2_0.ChallengeGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_2 + 1
		local var_3_1 = var_2_1[var_3_0]

		arg_3_0:Setup(arg_2_0, var_3_1, var_3_0, arg_2_2.hideBattlePassTierReq)

		if var_3_1 == arg_2_0.ChallengeGrid.lastMissionFocused then
			arg_3_0:processEvent({
				name = "gain_focus"
			})
		end
	end)

	local var_2_3 = 0
	local var_2_4

	if var_2_0 then
		local var_2_5 = OPERATOR.GetOutfitChallengeDetailsFromObjective(var_2_0, var_2_1)

		var_2_3 = var_2_5.missionIndex - 1
		var_2_4 = var_2_5.objectiveIndex
	end

	arg_2_0:registerEventHandler("challenges_update_mission_details", function(arg_4_0, arg_4_1)
		local var_4_0 = LUI.FlowManager.GetScopedData(arg_2_2.menuRef)

		if var_4_0 then
			var_2_4 = var_4_0.focussedMissionIndex
		end

		if arg_4_1.index and var_2_1[arg_4_1.index] then
			arg_4_0._buttonOverIndex = arg_4_1.index
			var_2_1[arg_4_1.index].isActive = arg_2_0._isActive

			arg_4_0.MissionDetail:SetData(arg_2_1, {
				mission = var_2_1[arg_4_1.index],
				objectiveIndex = var_2_4,
				hideBattlePassTier = arg_2_2._hideBattlePassTierReq
			})
			var_0_0(arg_2_0, arg_2_1, {
				missionData = var_2_1[arg_4_1.index],
				hideBundleUpsellButton = arg_2_2.hideBundleUpsellButton
			})
		end
	end)
	arg_2_0.ChallengeGrid:addEventHandler("new_mission_focused", function(arg_5_0, arg_5_1)
		if arg_5_0.lastMissionElementFocused and arg_5_0.lastMissionElementFocused ~= arg_5_1.newFocusedElement then
			arg_5_0.lastMissionElementFocused:CustomLoseFocus()
		end

		arg_5_0.lastMissionElementFocused = arg_5_1.newFocusedElement
		arg_5_0.lastMissionFocused = arg_5_1.newFocusedElement._challenge
	end)
	arg_2_0.ChallengeGrid:SetDefaultFocus({
		x = 0,
		y = var_2_3
	})
	arg_2_0.ChallengeGrid:SetPosition({
		x = 0,
		y = var_2_3
	}, true)

	var_2_1[var_2_3 + 1].isActive = arg_2_0._isActive

	arg_2_0.MissionDetail:SetData(arg_2_1, {
		mission = var_2_1[var_2_3 + 1],
		objectiveIndex = var_2_4,
		hideBattlePassTier = arg_2_2._hideBattlePassTierReq
	})
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_2.scopedData.operatorData.operatorInfo
	local var_6_1 = var_6_0.ref

	arg_6_0._isActive = var_6_0.isActive

	local var_6_2 = var_6_0.outfitMissionQuests

	if not var_6_2 or #var_6_2 < 1 then
		var_6_2 = var_6_0.challenges
	end

	var_0_1(arg_6_0, arg_6_1, {
		menuRef = arg_6_2.scopedData.menuRef,
		operatorRef = var_6_1,
		challengeID = var_6_0.challengeID,
		missionQuests = var_6_2,
		hideBundleUpsellButton = var_6_0.hideBundleUpsellButton or false,
		hideBattlePassTierReq = var_6_0.hideBattlePassTierReq or true
	})

	local var_6_3 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, var_6_1)

	arg_6_0.WZWipSnipeProgressableMessage:UpdateMessage({
		gameSourceID = LOOT.GetGameSourceIDFromItemID(var_6_3)
	})
	ACTIONS.AnimateSequence(arg_6_0.WZWipSnipeProgressableMessage, "Show")
end

local function var_0_3(arg_7_0)
	local var_7_0
	local var_7_1 = {
		worldBlur = 1,
		controllerIndex = controllerIndex
	}
	local var_7_2 = MenuBuilder.BuildRegisteredType("WorldBlur", var_7_1)

	var_7_2.id = "WorldBlur"

	var_7_2:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	arg_7_0:addElement(var_7_2)

	arg_7_0.WorldBlur = var_7_2
end

local function var_0_4(arg_8_0)
	if arg_8_0.WorldBlur then
		arg_8_0.WorldBlur:closeTree()
	end
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0:GetCurrentMenu()

	arg_9_0.OnInit = var_0_3
	arg_9_0.OnClose = var_0_4

	if Engine.DBAEJAHFGJ(arg_9_1) then
		ACTIONS.LeaveMenu(arg_9_0:getParent())
		LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_9_1, false)
	end

	var_0_2(arg_9_0, arg_9_1, {
		scopedData = arg_9_2.scopedData
	})
end

function WZOperatorInfoMissions(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "WZOperatorInfoMissions"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorMissionItemCondensed", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 68,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_5 = LUI.UIGrid.new(var_10_4)

	var_10_5.id = "ChallengeGrid"

	var_10_5:setUseStencil(true)
	var_10_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 713, _1080p * 236, _1080p * 963)
	var_10_0:addElement(var_10_5)

	var_10_0.ChallengeGrid = var_10_5

	local var_10_6
	local var_10_7 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_10_1
	})

	var_10_7.id = "VerticalMinimalScrollbar"

	var_10_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 713, _1080p * 236, _1080p * 916)
	var_10_0:addElement(var_10_7)

	var_10_0.VerticalMinimalScrollbar = var_10_7

	local var_10_8

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_9 = MenuBuilder.BuildRegisteredType("WZSnipeProgressableMessage", {
			controllerIndex = var_10_1
		})

		var_10_9.id = "WZWipSnipeProgressableMessage"

		var_10_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 279, _1080p * 170, _1080p * 199)
		var_10_0:addElement(var_10_9)

		var_10_0.WZWipSnipeProgressableMessage = var_10_9
	end

	local var_10_10
	local var_10_11 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_10_1
	})

	var_10_11.id = "BundleUpsellButton"

	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 842, _1080p * 1046)
	var_10_0:addElement(var_10_11)

	var_10_0.BundleUpsellButton = var_10_11

	local var_10_12
	local var_10_13 = MenuBuilder.BuildRegisteredType("WZOperatorInfoMissionChallenges", {
		controllerIndex = var_10_1
	})

	var_10_13.id = "MissionDetail"

	var_10_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 654, _1080p * 236, _1080p * 796)
	var_10_0:addElement(var_10_13)

	var_10_0.MissionDetail = var_10_13

	local var_10_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_10_7,
		startCap = var_10_7.startCap,
		endCap = var_10_7.endCap,
		sliderArea = var_10_7.sliderArea,
		slider = var_10_7.sliderArea and var_10_7.sliderArea.slider,
		fixedSizeSlider = var_10_7.sliderArea and var_10_7.sliderArea.fixedSizeSlider
	})

	var_10_5:AddScrollbar(var_10_14)
	var_0_5(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("WZOperatorInfoMissions", WZOperatorInfoMissions)
LockTable(_M)
