module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1:IsUnlocked() then
		ACTIONS.AnimateSequence(arg_1_0.ElderProgressionChallengeDetails, "Unlocked")
		arg_1_0.ElderProgressionChallengeDetails:SetDetails(arg_1_1)
	else
		ACTIONS.AnimateSequence(arg_1_0.ElderProgressionChallengeDetails, "Locked")

		local var_1_0 = arg_1_1:GetRibbonRank() + 1
		local var_1_1

		if var_1_0 > PROGRESSION.GetMaxRank() + PROGRESSION.GetMaxElderRank() + 1 then
			var_1_1 = Engine.CBBHFCGDIC("ELDER_PROGRESSION/CHALLENGE_LOCKED_MAX")
		else
			var_1_1 = Engine.CBBHFCGDIC("ELDER_PROGRESSION/CHALLENGE_LOCKED", var_1_0)
		end

		arg_1_0.ElderProgressionChallengeDetails.ChallengeDescription:setText(var_1_1)
	end

	local var_1_2 = arg_1_1:GetProgressionData().challengeID
	local var_1_3 = PROGRESSION.GetElderChallengeName(var_1_2)

	arg_1_0.ElderProgressionChallengeDetails.ChallengeName:setText(Engine.CBBHFCGDIC(var_1_3))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._seasonProgress = 0

	arg_2_0.RibbonGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_2 + arg_3_1 * arg_2_0.RibbonGrid:GetNumRows()
		local var_3_1 = arg_2_0._elderProgressionData[var_3_0 + 2]

		arg_3_0:Setup(arg_2_1, var_3_1, var_3_0 + 1, arg_2_0._seasonRank, arg_2_0)

		if arg_3_0.challengeComplete then
			arg_2_0._seasonProgress = arg_2_0._seasonProgress + 1 / Challenge.MaxElderChallenges
		end
	end)
	arg_2_0.RibbonGrid:SetNumChildren(Challenge.MaxElderChallenges)
	arg_2_0.RibbonGrid:RefreshContent()

	arg_2_0._gridIsInitialized = true

	arg_2_0.ElderProgressionEmblemPanel:SetSeasonProgress(arg_2_0._seasonProgress)
end

local function var_0_2(arg_4_0, arg_4_1)
	arg_4_0._elderProgressionData = {}

	local var_4_0 = CSV.elderProgressionTable.GetFile(arg_4_1)

	assert(var_4_0)

	local var_4_1 = StringTable.BFHCAIIDA(var_4_0)

	for iter_4_0 = 0, var_4_1 - 1 do
		local var_4_2 = CSV.ReadRowWithFile(CSV.elderProgressionTable, var_4_0, iter_4_0)

		if var_4_2 then
			table.insert(arg_4_0._elderProgressionData, var_4_2)
		end
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	local var_5_0 = {}

	for iter_5_0 = 0, arg_5_0._currentChallengeDisplaySeason do
		table.insert(var_5_0, {
			hasDefaultFocus = iter_5_0 == arg_5_0._currentChallengeDisplaySeason,
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
				arg_5_0.SeasonChallenges:setText(Engine.CBBHFCGDIC("LUA_MENU/SEASON_CHALLENGES", arg_6_2))

				arg_5_0._seasonRank = OnlineProgression.CFEDCBACGI(arg_6_1, arg_6_2) + PROGRESSION.GetMaxRank() + 1

				var_0_2(arg_5_0, arg_6_2)

				if arg_5_0._gridIsInitialized then
					arg_5_0._seasonProgress = 0

					arg_5_0.RibbonGrid:processEvent({
						name = "lose_focus"
					})
					arg_5_0.RibbonGrid:RefreshContent()
					arg_5_0.RibbonGrid:processEvent({
						name = "gain_focus"
					})
					arg_5_0.ElderProgressionEmblemPanel:SetSeasonProgress(arg_5_0._seasonProgress)
					arg_5_0.ElderProgressionEmblemPanel:SetEmblemImages(arg_6_2)
					arg_5_0.ElderProgressionRankPanel:UpdateRankDisplay(arg_6_1, arg_6_2)
				end
			end
		})
	end

	arg_5_0.Tabs:SetTabs(var_5_0)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.OnChildFocused = var_0_0

	local var_7_0
	local var_7_1 = {
		spacing = 5,
		wrap = true,
		setIgnoreInvisibleChildren = true,
		buildArrows = true,
		tabHeight = _1080p * 4,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("Pip", {
				controllerIndex = arg_7_1
			})
		end,
		controllerIndex = arg_7_1
	}
	local var_7_2 = LUI.TabManager.new(var_7_1)

	var_7_2.id = "Tabs"

	var_7_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 562, _1080p * 652, _1080p * 147, _1080p * 151)
	arg_7_0:addElement(var_7_2)

	arg_7_0.Tabs = var_7_2

	local var_7_3 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_shoulderl",
				button_ref = "button_shoulderl",
				helper_text = ""
			}
		}
	}

	arg_7_0.Tabs.LeftArrow:AddTooltipData(arg_7_1, var_7_3)

	local var_7_4 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_shoulderr",
				button_ref = "button_shoulderr",
				helper_text = ""
			}
		}
	}

	arg_7_0.Tabs.RightArrow:AddTooltipData(arg_7_1, var_7_4)
	FrontEndScene.HideAllCharacters()
	arg_7_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OFFICER_PROGRESSION"))

	local var_7_5 = SEASON.GetCurrentSeason()
	local var_7_6 = var_7_5 + 1

	arg_7_0.SeasonChallenges:setText(Engine.CBBHFCGDIC("LUA_MENU/SEASON_CHALLENGES", var_7_5))

	arg_7_0._currentChallengeDisplaySeason = var_7_5
	arg_7_0._seasonRank = PROGRESSION.GetPlayerSeasonRank(arg_7_1, var_7_5) + PROGRESSION.GetMaxRank()

	arg_7_0.ElderProgressionRankPanel.CurRankTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_SEASON", var_7_5))
	var_0_3(arg_7_0, arg_7_1)
	var_0_2(arg_7_0, var_7_5)
	var_0_1(arg_7_0, arg_7_1)

	if Engine.DDJFBBJAIG() and not Onboarding.ElderProgression.WasCompleted(arg_7_0, arg_7_1) then
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "onboardingpopup", true, arg_7_1, false, ONBOARDING_DATA.GetOnboardingElderProgressionData())
		Onboarding.ElderProgression.MarkCompleted(arg_7_0, arg_7_1)
	end

	arg_7_0.RibbonGrid:SetNotifyOnLayoutInit(true)
	arg_7_0.RibbonGrid:registerEventHandler("layout_initialized", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0:GetFirstFocusablePosition()

		if LUI.IsLastInputKeyboardMouse(arg_7_1) and var_9_0 then
			arg_9_0:SetFocusedPosition(var_9_0, true)
		end
	end)

	local function var_7_7()
		return {
			x = 0,
			y = 0
		}
	end

	arg_7_0.RibbonGrid:SetDefaultFocus(var_7_7)
	ACTIONS.ScaleFullscreen(arg_7_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_7_0, arg_7_1)
end

function ElderProgression(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "ElderProgression"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = {
		worldBlur = 1,
		controllerIndex = var_11_1
	}
	local var_11_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_11_4)

	var_11_5.id = "WorldBlur"

	var_11_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_11_0:addElement(var_11_5)

	var_11_0.WorldBlur = var_11_5

	local var_11_6
	local var_11_7 = LUI.UIImage.new()

	var_11_7.id = "Darken"

	var_11_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_7:SetAlpha(0.5, 0)
	var_11_0:addElement(var_11_7)

	var_11_0.Darken = var_11_7

	local var_11_8
	local var_11_9 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 10,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ElderProgressionRibbon", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 125,
		rowHeight = _1080p * 44,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_10 = LUI.UIGrid.new(var_11_9)

	var_11_10.id = "RibbonGrid"

	var_11_10:setUseStencil(true)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 554, _1080p * 1835, _1080p * 380, _1080p * 873)
	var_11_0:addElement(var_11_10)

	var_11_0.RibbonGrid = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "MenuTitle"

	var_11_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/OFFICER_PROGRESSION"), 0)
	var_11_12.Line:SetLeft(0, 0)
	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_11_0:addElement(var_11_12)

	var_11_0.MenuTitle = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("ElderProgressionRankPanel", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "ElderProgressionRankPanel"

	var_11_14.CurRankTitle:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_11_14.CurRankTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_SEASON"), 0)
	var_11_14.DividerTopRight:SetAlpha(0, 0)
	var_11_14.DividerTopLeft:SetAlpha(0, 0)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 167, _1080p * 1006)
	var_11_0:addElement(var_11_14)

	var_11_0.ElderProgressionRankPanel = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("ElderProgressionEmblemPanel", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "ElderProgressionEmblemPanel"

	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 562, _1080p * 1824, _1080p * 873, _1080p * 1006)
	var_11_0:addElement(var_11_16)

	var_11_0.ElderProgressionEmblemPanel = var_11_16

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("ElderProgressionChallengeDetails", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "ElderProgressionChallengeDetails"

	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 562, _1080p * 1824, _1080p * 167, _1080p * 367)
	var_11_0:addElement(var_11_18)

	var_11_0.ElderProgressionChallengeDetails = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIStyledText.new()

	var_11_20.id = "SeasonChallenges"

	var_11_20:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_11_20:setText(Engine.CBBHFCGDIC("LUA_MENU/SEASON_CHALLENGES"), 0)
	var_11_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_20:SetAlignment(LUI.Alignment.Left)
	var_11_20:SetShadowRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 562, _1080p * 890, _1080p * 105, _1080p * 135)
	var_11_0:addElement(var_11_20)

	var_11_0.SeasonChallenges = var_11_20

	local var_11_21
	local var_11_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_11_1
	})

	var_11_22.id = "LobbyMembersFooter"

	var_11_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_11_0:addElement(var_11_22)

	var_11_0.LobbyMembersFooter = var_11_22

	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_11_23 = LUI.UIBindButton.new()

	var_11_23.id = "selfBindButton"

	var_11_0:addElement(var_11_23)

	var_11_0.bindButton = var_11_23

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("ElderProgression", ElderProgression)
LockTable(_M)
