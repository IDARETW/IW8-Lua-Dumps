module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1 = CP.GetTotalStarsEarned(arg_1_1)
	local var_1_2 = CP.GetStarUnlocksTable()
	local var_1_3 = CP.GetNextReward(var_1_0)
	local var_1_4 = var_1_3 and var_1_3.stars or var_1_0

	arg_1_0.NextRewardStarCount:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS", var_1_0, var_1_4))
	arg_1_0.RewardsGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.RewardsGrid:GetContentIndex(arg_2_1, arg_2_2)
		local var_2_1 = var_1_2[var_2_0 + 1]
		local var_2_2 = var_1_0 - 3 * var_2_0

		arg_2_0:UpdateCard(var_2_1.lootReward, var_2_2)
	end)

	local var_1_5 = math.min(#var_1_2, var_1_1 / 3)

	arg_1_0.RewardsGrid:SetNumChildren(var_1_5)

	local var_1_6 = 150
	local var_1_7 = 80
	local var_1_8 = var_1_6 * var_1_5 + var_1_7 * (var_1_5 - 1)

	arg_1_0.RewardsGrid:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * (-var_1_8 / 2), _1080p * (var_1_8 / 2), _1080p * -100, _1080p * 180)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.Background)
end

function SORewardsPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "SORewardsPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.9, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ButtonHelperBar"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_6.Background:SetAlpha(0, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -818, _1080p * 314, _1080p * 364)
	var_3_0:addElement(var_3_6)

	var_3_0.ButtonHelperBar = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "GenericPopupWindow"

	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -300, _1080p * 299)
	var_3_0:addElement(var_3_8)

	var_3_0.GenericPopupWindow = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_3_0) then
		var_3_10.Label:setText("ButtonPrompts", 0)
	end

	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -785, _1080p * -685, _1080p * 314, _1080p * 345)
	var_3_0:addElement(var_3_10)

	var_3_0.Prompts = var_3_10

	local var_3_11
	local var_3_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 6,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SOStarReward", {
				controllerIndex = var_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			return
		end,
		spacingX = _1080p * 80,
		spacingY = _1080p * 80,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 280,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_13 = LUI.UIGrid.new(var_3_12)

	var_3_13.id = "RewardsGrid"

	var_3_13:setUseStencil(false)
	var_3_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -650, _1080p * 650, _1080p * -100, _1080p * 180)
	var_3_0:addElement(var_3_13)

	var_3_0.RewardsGrid = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIText.new()

	var_3_15.id = "NextRewardStarCount"

	var_3_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_15:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS"), 0)
	var_3_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_15:SetWordWrap(false)
	var_3_15:SetAlignment(LUI.Alignment.Right)
	var_3_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -361, _1080p * -310, _1080p * 286, _1080p * 310)
	var_3_0:addElement(var_3_15)

	var_3_0.NextRewardStarCount = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIStyledText.new()

	var_3_17.id = "NextRewardabel"

	var_3_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_17:setText(Engine.CBBHFCGDIC("LUA_MENU/NEXT_REWARD"), 0)
	var_3_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_17:SetWordWrap(false)
	var_3_17:SetAlignment(LUI.Alignment.Left)
	var_3_17:SetTintFontIcons(true)
	var_3_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -488, _1080p * -361, _1080p * 287, _1080p * 309)
	var_3_0:addElement(var_3_17)

	var_3_0.NextRewardabel = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIImage.new()

	var_3_19.id = "NextRewardIcon"

	var_3_19:setImage(RegisterMaterial("star_on"), 0)
	var_3_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -300, _1080p * -259, _1080p * 277, _1080p * 317)
	var_3_0:addElement(var_3_19)

	var_3_0.NextRewardIcon = var_3_19

	local var_3_20
	local var_3_21 = LUI.UIStyledText.new()

	var_3_21.id = "RewardDescription"

	var_3_21:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_21:setText(Engine.CBBHFCGDIC("LUA_MENU/STAR_REWARDS_DESC"), 0)
	var_3_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_21:SetAlignment(LUI.Alignment.Center)
	var_3_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -305, _1080p * 305, _1080p * -199, _1080p * -171)
	var_3_0:addElement(var_3_21)

	var_3_0.RewardDescription = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIText.new()

	var_3_23.id = "Title"

	var_3_23:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_23:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STAR_REWARDS")), 0)
	var_3_23:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_23:SetAlignment(LUI.Alignment.Center)
	var_3_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -602, _1080p * 602, _1080p * -272, _1080p * -212)
	var_3_0:addElement(var_3_23)

	var_3_0.Title = var_3_23

	function var_3_0.addButtonHelperFunction(arg_6_0, arg_6_1)
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
			container = var_3_10
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_24 = LUI.UIBindButton.new()

	var_3_24.id = "selfBindButton"

	var_3_0:addElement(var_3_24)

	var_3_0.bindButton = var_3_24

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SORewardsPopup", SORewardsPopup)
LockTable(_M)
