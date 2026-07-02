module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.Grid.GridCountArrows:closeTree()

	arg_1_0.Grid.GridCountArrows = nil

	arg_1_0.Grid:closeTree()

	arg_1_0.Grid = nil

	arg_1_0.VerticalMinimalScrollbar:closeTree()

	arg_1_0.VerticalMinimalScrollbar = nil
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0()
		local var_3_0 = arg_2_0.Grid:GetFocusPosition()
		local var_3_1 = CONDITIONS.IsMagmaEnabled() and var_3_0 > arg_2_0._challengeCount
		local var_3_2 = CONDITIONS.IsMagmaGameMode() and arg_2_0._brChallengeCount > 0 and var_3_0 > arg_2_0._brChallengeCount

		if var_3_0 and (var_3_1 or var_3_2) then
			var_3_0 = var_3_0 - 1
		end

		local var_3_3 = arg_2_0._challengeCount + arg_2_0._brChallengeCount

		if arg_2_0._hideCompletedChallenges then
			var_3_3 = var_3_3 - arg_2_0._completedChallengeCount
		end

		return var_3_0, var_3_3
	end

	local var_2_1
	local var_2_2 = {
		buildArrowsLabel = true,
		maxRows = 50,
		maxVisibleRows = 11,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		controllerIndex = arg_2_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}

	if CONDITIONS.IsMagmaEnabled() then
		var_2_2.countFunction = var_2_0
	end

	local var_2_3 = LUI.UIGrid.new(var_2_2)

	var_2_3.id = "Grid"

	var_2_3:setUseStencil(true)
	var_2_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 896, _1080p * 170, _1080p * 979)
	arg_2_0:addElement(var_2_3)

	arg_2_0.Grid = var_2_3

	local var_2_4
	local var_2_5 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_2_1
	})

	var_2_5.id = "VerticalMinimalScrollbar"

	var_2_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 902, _1080p * 913, _1080p * 244, _1080p * 973)
	arg_2_0:addElement(var_2_5)

	arg_2_0.VerticalMinimalScrollbar = var_2_5

	local var_2_6 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_2_0.VerticalMinimalScrollbar,
		startCap = arg_2_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_2_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_2_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_2_0.VerticalMinimalScrollbar.sliderArea and arg_2_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_2_0.VerticalMinimalScrollbar.sliderArea and arg_2_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	arg_2_0.Grid:AddScrollbar(var_2_6)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = 0
	local var_4_1 = arg_4_0.Tabs:GetCurrentTabIndex() + 1
	local var_4_2, var_4_3 = Challenge.GetChallengeCompletionStatus(arg_4_2.challenges and arg_4_2.challenges[var_4_1] or nil)
	local var_4_4, var_4_5 = Challenge.GetChallengeCompletionStatus(arg_4_2.brChallenges and arg_4_2.brChallenges[var_4_1] or nil)

	if CONDITIONS.IsMagmaGameMode() then
		if var_4_5 and Engine.CFHBIHABCB(arg_4_1) and not var_4_3 and arg_4_0._hideCompletedChallenges then
			var_4_0 = 2
		else
			var_4_0 = 1
		end
	elseif CONDITIONS.IsMagmaEnabled() then
		var_4_0 = var_4_3 and not var_4_5 and arg_4_0._hideCompletedChallenges and 2 or 1
	end

	return var_4_0
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = MenuBuilder.BuildRegisteredType("BarracksChallengeItem", {
		controllerIndex = arg_5_1
	})

	var_5_0:Setup(arg_5_0, arg_5_2)

	return var_5_0
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_6_0
	})

	var_6_0.id = "challengeHeader" .. arg_6_1

	var_6_0.Title:setText(arg_6_1)
	var_6_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 64)
	var_6_0.ChallengeCount:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_6_2, arg_6_3))

	return var_6_0
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_0.Tabs:GetCurrentTabIndex() + 1
	local var_7_1 = false

	if arg_7_2 and arg_7_2[var_7_0] then
		local var_7_2, var_7_3 = Challenge.GetChallengeCompletionStatus(arg_7_2[var_7_0])

		if not var_7_3 then
			arg_7_0._completedChallengeCount = arg_7_0._completedChallengeCount + var_7_2
		end

		if arg_7_3 == Challenge.Type.WEEKLY then
			arg_7_0.Grid:AddElement(var_0_4(arg_7_1, Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), var_7_2, #arg_7_2[var_7_0]))

			arg_7_0._challengeCount = #arg_7_2[var_7_0]
		elseif arg_7_3 == Challenge.Type.BR_WEEKLY then
			arg_7_0.Grid:AddElement(var_0_4(arg_7_1, Engine.CBBHFCGDIC("LUA_MENU/WARZONE_CAPS"), var_7_2, #arg_7_2[var_7_0]))

			arg_7_0._brChallengeCount = #arg_7_2[var_7_0]
		end

		for iter_7_0, iter_7_1 in ipairs(arg_7_2[var_7_0]) do
			if arg_7_0._hideCompletedChallenges then
				if not iter_7_1.isComplete then
					arg_7_0.Grid:AddElement(var_0_3(arg_7_0, arg_7_1, iter_7_1))
				end
			else
				local var_7_4 = var_0_3(arg_7_0, arg_7_1, iter_7_1)

				if iter_7_1.isComplete then
					table.insert(arg_7_0._completedChallengeElements, var_7_4)
				end

				arg_7_0.Grid:AddElement(var_7_4)
			end
		end
	end
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = var_0_2(arg_8_0, arg_8_1, arg_8_2)

	if CONDITIONS.IsMagmaGameMode() then
		var_0_5(arg_8_0, arg_8_1, arg_8_2.brChallenges, Challenge.Type.BR_WEEKLY)

		if Engine.CFHBIHABCB(arg_8_1) or Dvar.IBEGCHEFE("MMOTQROLKT") then
			var_0_5(arg_8_0, arg_8_1, arg_8_2.challenges, Challenge.Type.WEEKLY)
		end

		arg_8_0.Grid:SetFocusedPosition({
			x = 0,
			y = var_8_0
		}, true)
	elseif CONDITIONS.IsMagmaEnabled() then
		var_0_5(arg_8_0, arg_8_1, arg_8_2.challenges, Challenge.Type.WEEKLY)
		var_0_5(arg_8_0, arg_8_1, arg_8_2.brChallenges, Challenge.Type.BR_WEEKLY)
		arg_8_0.Grid:SetFocusedPosition({
			x = 0,
			y = var_8_0
		}, true)
	else
		var_0_5(arg_8_0, arg_8_1, arg_8_2.challenges, Challenge.Type.WEEKLY)
		arg_8_0.Grid:SetFocusedPosition({
			x = 0,
			y = var_8_0
		}, true)
	end

	arg_8_0:Wait(1).onComplete = function()
		arg_8_0.Grid:UpdateNumbersArrowsAndScrolling()
	end
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._challenges = arg_10_2.challenges
	arg_10_0._brChallenges = arg_10_2.brChallenges

	local var_10_0

	if LUI.FlowManager.IsInStack("BarracksChallenges") then
		var_10_0 = LUI.FlowManager.GetScopedData("BarracksChallenges")
	end

	local var_10_1 = {}

	if arg_10_2.challenges and #arg_10_2.challenges > 0 then
		for iter_10_0 = 1, arg_10_2.challenges.numWeeks do
			local var_10_2 = false

			if CONDITIONS.IsChallengeTabEnabled() then
				var_10_2 = arg_10_2.challenges[iter_10_0].isWeekLocked
			end

			var_10_1[#var_10_1 + 1] = {
				name = Engine.CBBHFCGDIC("CHALLENGE/WEEK_N", iter_10_0),
				disabled = var_10_2
			}
		end
	elseif arg_10_2.brChallenges and #arg_10_2.brChallenges > 0 then
		for iter_10_1 = 1, arg_10_2.brChallenges.numWeeks do
			local var_10_3 = false

			if CONDITIONS.IsChallengeTabEnabled() then
				var_10_3 = arg_10_2.brChallenges[iter_10_1].isWeekLocked
			end

			var_10_1[#var_10_1 + 1] = {
				name = Engine.CBBHFCGDIC("CHALLENGE/WEEK_N", iter_10_1),
				disabled = var_10_3
			}
		end
	end

	if #var_10_1 > 0 then
		local var_10_4 = {}

		for iter_10_2, iter_10_3 in ipairs(var_10_1) do
			table.insert(var_10_4, {
				name = iter_10_3.name,
				disabled = iter_10_3.disabled,
				hasDefaultFocus = iter_10_2 == arg_10_2.activeIndex,
				tabHeight = _1080p * 52,
				focusFunction = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
					if var_10_0 then
						var_10_0.weekTabIndex = arg_11_2
					end

					arg_10_0._completedChallengeElements = {}
					arg_10_0._completedChallengeCount = 0

					var_0_0(arg_10_0)
					var_0_1(arg_10_0, arg_11_1)
					var_0_6(arg_10_0, arg_11_1, arg_10_2)
				end
			})
		end

		arg_10_0.Tabs:SetTabs(var_10_4)
		arg_10_0.Tabs:SetAlignment(LUI.Alignment.Left)
	else
		arg_10_0.Tabs:closeTree()

		arg_10_0.Tabs = nil
	end

	if CONDITIONS.IsChallengeTabEnabled() and arg_10_2.challenges.numWeeks and arg_10_2.challenges.numWeeks > 0 and arg_10_0.Tabs then
		for iter_10_4 = 1, arg_10_2.challenges.numWeeks do
			local var_10_5 = arg_10_0.Tabs:GetTabAtIndex(iter_10_4)

			if var_10_5 and var_10_5.SetupTimer then
				local var_10_6 = arg_10_2.challenges[iter_10_4]

				if var_10_6.isWeekLocked then
					var_10_5:SetupTimer(arg_10_2.challenges[iter_10_4].weekStartTime)

					break
				else
					local var_10_7, var_10_8 = Challenge.GetChallengeCompletionStatus(var_10_6)

					var_10_5.CheckBox:SetValue(var_10_8)
				end
			end
		end
	end
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2)
	for iter_12_0 = 1, #arg_12_0._completedChallengeElements do
		if arg_12_0._completedChallengeElements[iter_12_0] then
			arg_12_0.Grid:RemoveElement(arg_12_0._completedChallengeElements[iter_12_0])

			arg_12_0._completedChallengeElements[iter_12_0] = nil
		end
	end

	arg_12_0._completedChallengeElements = {}

	local var_12_0 = var_0_2(arg_12_0, arg_12_1, arg_12_2)

	arg_12_0.Grid:SetFocusedPosition({
		x = 0,
		y = var_12_0
	}, true)
	arg_12_0.Grid:UpdateNumbersArrowsAndScrolling()
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	if CONDITIONS.IsChallengeTabEnabled() and CONDITIONS.IsBattlePassEnabled() then
		local var_13_0
		local var_13_1 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			isSeasonReset = true,
			controllerIndex = arg_13_1
		})

		var_13_1.id = "BattlePassSeasonResetStatus"

		var_13_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1449, _1080p * 1824, _1080p * 60, _1080p * 140)
		arg_13_0:addElement(var_13_1)

		arg_13_0.BattlePassSeasonResetStatus = var_13_1
	end

	var_0_1(arg_13_0, arg_13_1)

	arg_13_0._completedChallengeElements = {}
	arg_13_0._hideCompletedChallenges = false
	arg_13_0._brChallengeCount = 0
	arg_13_0._challengeCount = 0
	arg_13_0._completedChallengeCount = 0

	assert(arg_13_0.MenuTitle)
	arg_13_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/WEEKLY"))
	arg_13_0:registerEventHandler("challenges_update_status", function(arg_14_0, arg_14_1)
		if arg_14_0._challenges then
			local var_14_0 = arg_14_0.Tabs:GetCurrentTabIndex()

			arg_14_0.Status:SetAlpha(1)
			arg_14_0.Status:SetData(arg_14_1.challenge)

			local var_14_1 = not arg_14_1.challenge.unlocked and CONDITIONS.ShouldDisplayUpsellPopup(arg_13_1)

			arg_13_0.BarracksUpsellPurchaseButton:SetFocusable(var_14_1)
			arg_13_0.BarracksUpsellPurchaseButton:Enable(var_14_1)
			arg_13_0.Status:SetChallengeLocked(not arg_14_1.challenge.unlocked)
		end
	end)
	var_0_7(arg_13_0, arg_13_1, arg_13_2)

	if arg_13_0._challengeCount == 0 and arg_13_0._brChallengeCount == 0 then
		var_0_0(arg_13_0)
		arg_13_0.NoChallengesLabel:SetAlpha(1)
	else
		arg_13_0.NoChallengesLabel:SetAlpha(0)
	end

	if CONDITIONS.IsChallengeTabEnabled() and (arg_13_0._challengeCount > 0 or arg_13_0._brChallengeCount > 0) then
		local var_13_2 = arg_13_0.Tabs:GetCurrentTabIndex() + 1
		local var_13_3 = arg_13_2.challenges[var_13_2]
		local var_13_4 = arg_13_2.brChallenges[var_13_2]
		local var_13_5, var_13_6 = Challenge.GetChallengeCompletionStatus(var_13_3)
		local var_13_7, var_13_8 = Challenge.GetChallengeCompletionStatus(var_13_4)

		if var_13_5 > 0 and not var_13_6 or var_13_7 > 0 and not var_13_8 then
			arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/HIDE_COMPLETED_CHALLENGES")
			})
		end

		arg_13_0.bindButton = LUI.UIBindButton.new()
		arg_13_0.bindButton.id = "selfBindButton"

		arg_13_0:addElement(arg_13_0.bindButton)
		arg_13_0.bindButton:addEventHandler("button_alt1", function(arg_15_0, arg_15_1)
			(function()
				local var_16_0 = arg_13_0.Grid:GetFocusPosition()
				local var_16_1, var_16_2 = Challenge.GetChallengeCompletionStatus(var_13_3)
				local var_16_3, var_16_4 = Challenge.GetChallengeCompletionStatus(var_13_4)

				if completedChallengeCount == 0 and var_16_3 == 0 then
					return
				end

				if var_16_1 > 0 and not var_16_2 or var_16_3 > 0 and not var_16_4 then
					arg_13_0._hideCompletedChallenges = not arg_13_0._hideCompletedChallenges

					Engine.BJDBIAGIDA(SOUND_SETS.default.action)

					if arg_13_0._hideCompletedChallenges then
						var_0_8(arg_13_0, arg_13_1, arg_13_2)
						arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
							side = "left",
							button_ref = "button_alt1",
							helper_text = Engine.CBBHFCGDIC("CHALLENGE/SHOW_COMPLETED_CHALLENGES")
						})
					else
						arg_13_0._completedChallengeCount = 0

						var_0_0(arg_13_0)
						var_0_1(arg_13_0, arg_13_1)
						var_0_6(arg_13_0, arg_13_1, arg_13_2)
						arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
							side = "left",
							button_ref = "button_alt1",
							helper_text = Engine.CBBHFCGDIC("CHALLENGE/HIDE_COMPLETED_CHALLENGES")
						})
					end
				end
			end)()
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_13_0, arg_13_1)
	ACTIONS.ScaleFullscreen(arg_13_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_13_0.TabBacker)
end

function BarracksChallengesWeeklyTabs(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "BarracksChallengesWeeklyTabs"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	var_17_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_1
	})
	var_17_0.HelperBar.id = "HelperBar"

	var_17_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_0.HelperBar:setPriority(10)
	var_17_0:addElement(var_17_0.HelperBar)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = {
		worldBlur = 1,
		controllerIndex = var_17_1
	}
	local var_17_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_17_4)

	var_17_5.id = "WorldBlur"

	var_17_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_17_0:addElement(var_17_5)

	var_17_0.WorldBlur = var_17_5

	local var_17_6
	local var_17_7 = LUI.UIImage.new()

	var_17_7.id = "Darken"

	var_17_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_7:SetAlpha(0.5, 0)
	var_17_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * 1, 0, 0)
	var_17_0:addElement(var_17_7)

	var_17_0.Darken = var_17_7

	local var_17_8
	local var_17_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_17_1
	})

	var_17_9.id = "TabBacker"

	var_17_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_17_0:addElement(var_17_9)

	var_17_0.TabBacker = var_17_9

	local var_17_10
	local var_17_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_11.id = "MenuTitle"

	var_17_11.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/WEEKLY"), 0)
	var_17_11.Line:SetLeft(0, 0)
	var_17_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_11)

	var_17_0.MenuTitle = var_17_11

	local var_17_12
	local var_17_13 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTabWithTimer", {
				controllerIndex = var_17_1
			})
		end,
		controllerIndex = var_17_1
	}
	local var_17_14 = LUI.TabManager.new(var_17_13)

	var_17_14.id = "Tabs"

	var_17_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 996, _1080p * 108, _1080p * 154)
	var_17_0:addElement(var_17_14)

	var_17_0.Tabs = var_17_14

	local var_17_15
	local var_17_16 = MenuBuilder.BuildRegisteredType("BarracksChallengeStatus", {
		controllerIndex = var_17_1
	})

	var_17_16.id = "Status"

	var_17_16:SetAlpha(0, 0)
	var_17_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 952, _1080p * 1377, _1080p * 216, _1080p * 616)
	var_17_0:addElement(var_17_16)

	var_17_0.Status = var_17_16

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("BarracksUpsellPurchaseButton", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "BarracksUpsellPurchaseButton"

	var_17_18:SetAlpha(0, 0)
	var_17_18.Desc:setText(Engine.CBBHFCGDIC("INGAMESTORE/UPSELL_WEEKLY"), 0)
	var_17_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 967, _1080p * 1377, _1080p * 665, _1080p * 995)
	var_17_0:addElement(var_17_18)

	var_17_0.BarracksUpsellPurchaseButton = var_17_18

	local var_17_19
	local var_17_20 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_17_1
	})

	var_17_20.id = "LobbyMembersFooter"

	var_17_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_17_0:addElement(var_17_20)

	var_17_0.LobbyMembersFooter = var_17_20

	local var_17_21
	local var_17_22 = LUI.UIText.new()

	var_17_22.id = "NoChallengesLabel"

	var_17_22:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_22:SetAlpha(0, 0)
	var_17_22:setText(Engine.CBBHFCGDIC("CHALLENGE/NONE_AVAILABLE"), 0)
	var_17_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_22:SetAlignment(LUI.Alignment.Center)
	var_17_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -12, _1080p * 12)
	var_17_0:addElement(var_17_22)

	var_17_0.NoChallengesLabel = var_17_22

	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_17_23 = LUI.UIBindButton.new()

	var_17_23.id = "selfBindButton"

	var_17_0:addElement(var_17_23)

	var_17_0.bindButton = var_17_23

	var_17_0.bindButton:addEventHandler("button_secondary", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_17_1
		end

		ACTIONS.LeaveMenu(var_17_0)
	end)
	var_0_9(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("BarracksChallengesWeeklyTabs", BarracksChallengesWeeklyTabs)
LockTable(_M)
