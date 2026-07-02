module(..., package.seeall)

GAMEMODE = {
	ALL = "ACHIEVEMENTS/ALL_GAME_MODE",
	COOP = "ACHIEVEMENTS/COOPERATIVE",
	SINGLEPLAYER = "ACHIEVEMENTS/SINGLEPLAYER"
}

local function var_0_0(arg_1_0)
	local var_1_0 = 0
	local var_1_1 = 0

	for iter_1_0, iter_1_1 in pairs(arg_1_0._achievements) do
		if iter_1_1.isCompleted then
			var_1_0 = var_1_0 + iter_1_1.score
		end

		var_1_1 = var_1_1 + iter_1_1.score
	end

	return LUI.Round(var_1_0 / var_1_1, 2)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT"))

	local var_2_0 = CSV.pcAchievements
	local var_2_1 = BuiltInAchievements.BCFDGGJGAJ()
	local var_2_2 = {}

	for iter_2_0 = 0, var_2_1 - 1 do
		local var_2_3 = BuiltInAchievements.DCIAAGBJAG(iter_2_0)
		local var_2_4 = StringTable.CBGJCDIHCE(var_2_0.file, var_2_3, var_2_0.cols.id)

		if not BuiltInAchievements.BEEJICIGEG(var_2_4) then
			local var_2_5 = {
				id = var_2_4,
				gameMode = StringTable.CBGJCDIHCE(var_2_0.file, var_2_3, var_2_0.cols.gameMode),
				name = StringTable.CBGJCDIHCE(var_2_0.file, var_2_3, var_2_0.cols.name),
				description = StringTable.CBGJCDIHCE(var_2_0.file, var_2_3, var_2_0.cols.description),
				image = StringTable.CBGJCDIHCE(var_2_0.file, var_2_3, var_2_0.cols.image),
				score = StringTable.CBGJCDIHCE(var_2_0.file, var_2_3, var_2_0.cols.score)
			}

			if BuiltInAchievements.BBEIIEHECB(var_2_5.id) then
				var_2_5.isCompleted = true
			end

			if not CONDITIONS.IsWZWipFrontend() or var_2_5.gameMode ~= GAMEMODE.SINGLEPLAYER and var_2_5.gameMode ~= GAMEMODE.COOP then
				var_2_2[iter_2_0 + 1] = var_2_5
			end
		end
	end

	arg_2_0._achievements = var_2_2

	arg_2_0.AchievementsList:SetNumChildren(#var_2_2)

	local function var_2_6(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_2_0.AchievementsList:GetContentIndex(arg_3_1, arg_3_2)
		local var_3_1 = arg_2_0._achievements[var_3_0 + 1]

		arg_3_0.Name:setText(Engine.CBBHFCGDIC(var_3_1.name))
		arg_3_0.Description:setText(Engine.CBBHFCGDIC(var_3_1.description))
		arg_3_0.GameMode:setText(Engine.CBBHFCGDIC(var_3_1.gameMode))

		if var_3_1.image then
			arg_3_0.Image:setImage(RegisterMaterial(var_3_1.image))
		end

		WZWIP.AnimateThemeElement(arg_3_0, var_3_1.isCompleted and "Completed" or "Idle")
	end

	arg_2_0.AchievementsList:SetRefreshChild(var_2_6)
	arg_2_0.TotalScore:SetScore(var_0_0(arg_2_0))

	if Engine.EAAHGICFBD(arg_2_0) then
		arg_2_0.Background:SetAlpha(0)
	else
		arg_2_0.Background:SetAlpha(1)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Background)
	ACTIONS.ScaleFullscreen(arg_2_0.Darken)
	ACTIONS.ScaleFullscreen(arg_2_0.Vignette)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.TabBacker)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_2_0)
	end
end

function PCAchievementsMenu(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "PCAchievementsMenu"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darken"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darken = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Background"

	var_4_6:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.Background = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Vignette"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_8)

	var_4_0.Vignette = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "TabBacker"

	var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_4_0:addElement(var_4_10)

	var_4_0.TabBacker = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "ButtonHelperBar"

	var_4_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.ButtonHelperBar = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "MenuTitle"

	var_4_14.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT")), 0)
	var_4_14.Line:SetLeft(0, 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_14)

	var_4_0.MenuTitle = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("PCAchievementTotalScore", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "TotalScore"

	var_4_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -735, _1080p * -95, _1080p * 53, _1080p * 93)
	var_4_0:addElement(var_4_16)

	var_4_0.TotalScore = var_4_16

	local var_4_17
	local var_4_18 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PCAchievement", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 560,
		rowHeight = _1080p * 220,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_19 = LUI.UIGrid.new(var_4_18)

	var_4_19.id = "AchievementsList"

	var_4_19:setUseStencil(true)
	var_4_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1796, _1080p * 243, _1080p * 925)
	var_4_0:addElement(var_4_19)

	var_4_0.AchievementsList = var_4_19

	local var_4_20
	local var_4_21 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_4_1
	})

	var_4_21.id = "Scrollbar"

	var_4_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1805, _1080p * 1816, _1080p * 243, _1080p * 925)
	var_4_0:addElement(var_4_21)

	var_4_0.Scrollbar = var_4_21

	local var_4_22

	if CONDITIONS.InFrontendMPOrCP() then
		local var_4_23 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_4_1
		})

		var_4_23.id = "LobbyMembersFooter"

		var_4_23:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_4_0:addElement(var_4_23)

		var_4_0.LobbyMembersFooter = var_4_23
	end

	local var_4_24 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_4_21,
		startCap = var_4_21.startCap,
		endCap = var_4_21.endCap,
		sliderArea = var_4_21.sliderArea,
		slider = var_4_21.sliderArea and var_4_21.sliderArea.slider,
		fixedSizeSlider = var_4_21.sliderArea and var_4_21.sliderArea.fixedSizeSlider
	})

	var_4_19:AddScrollbar(var_4_24)

	function var_4_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_25 = LUI.UIBindButton.new()

	var_4_25.id = "selfBindButton"

	var_4_0:addElement(var_4_25)

	var_4_0.bindButton = var_4_25

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("PCAchievementsMenu", PCAchievementsMenu)
LockTable(_M)
