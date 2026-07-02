module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0.PrestigeGrid

	assert(var_1_0)

	local var_1_1 = SEASON.GetCurrentSeasonDisplayNum()
	local var_1_2 = SEASON.GetSeasonDataNumFromDisplayNum(var_1_1)
	local var_1_3 = PROGRESSION.GetPlayerPrestigeMasterLevelForSeason(arg_1_0._controllerIndex, var_1_2)
	local var_1_4 = PROGRESSION.GetMaxPrestigeMasterLevelAtSeason(arg_1_0._controllerIndex, var_1_2)
	local var_1_5 = 2
	local var_1_6 = 6

	var_1_0:SetNumChildren(var_1_6 * var_1_5)
	var_1_0:SetNumColumns(var_1_5)
	var_1_0:SetNumRows(var_1_6)
	var_1_0:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.PrestigeGrid:GetNumRows() * arg_2_1 + arg_2_2 + 1
		local var_2_1

		if var_2_0 <= var_1_3 then
			ACTIONS.AnimateSequence(arg_2_0, "Completed")

			var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_ITEM_TITLE", var_2_0)
		elseif var_2_0 <= var_1_4 then
			ACTIONS.AnimateSequence(arg_2_0, "Unlocked")

			var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_ITEM_TITLE", var_2_0)
		else
			ACTIONS.AnimateSequence(arg_2_0, "Locked")

			local var_2_2 = var_2_0 - var_1_4
			local var_2_3 = var_1_1 + var_2_2

			var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_ITEM_LOCKED_TITLE", var_2_3)
		end

		arg_2_0.Rank:setText(var_2_1)
		arg_2_0.PrestigeMasterRibbon:setImage(RegisterMaterial(PROGRESSION.GetPrestigeMasterRibbon(var_2_0)))
	end)
	var_1_0:RefreshContent()
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = ONBOARDING_DATA.GetOnboardingPrestigeMasterProgressionData()

	local function var_3_1(arg_4_0, arg_4_1)
		ACTIONS.LeaveMenu(arg_4_0)
	end

	var_3_0.confirmButton.action = var_3_1

	LUI.FlowManager.RequestPopupMenu(arg_3_0, "onboardingpopup", true, arg_3_1, false, var_3_0)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	(function(arg_6_0, arg_6_1)
		if not arg_5_2.WasCompleted(arg_6_0, arg_6_1) then
			var_0_1(arg_6_0, arg_6_1)
			arg_5_2.MarkCompleted(arg_6_0, arg_6_1)
		end
	end)(arg_5_0, arg_5_1)
end

local function var_0_3(arg_7_0, arg_7_1)
	var_0_1(arg_7_0, arg_7_1.controller)
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1

	var_0_0(arg_8_0)
	arg_8_0.PrestigeProgress:UpdateContentForNextLevelPrestigeMaster(arg_8_1, SEASON.GetCurrentSeasonDisplayNum())

	if CONDITIONS.IsChallengeTabEnabled() and CONDITIONS.IsBattlePassEnabled() then
		local var_8_0
		local var_8_1 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			isSeasonReset = true,
			controllerIndex = arg_8_1
		})

		var_8_1.id = "BattlePassSeasonResetStatus"

		var_8_1.ResetText:SetLeft(_1080p * 80, 0)
		var_8_1.ResetText:SetRight(_1080p * 372, 0)
		var_8_1.ResetText:SetTop(_1080p * 21, 0)
		var_8_1.ResetText:SetBottom(_1080p * 42, 0)
		var_8_1.ResetText:SetAlignment(LUI.Alignment.Right)
		var_8_1.BattlePass:SetAlpha(0, 0)
		var_8_1:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 123, _1080p * 498, _1080p * 341, _1080p * 421)
		arg_8_0:addElement(var_8_1)

		arg_8_0.BattlePassSeasonResetStatus = var_8_1
	end

	arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_right_stick",
		helper_text = Engine.CBBHFCGDIC("BATTLEPASS/MORE_INFO")
	})
	arg_8_0.bindButton:addEventHandler("button_right_stick", var_0_3)
	var_0_2(arg_8_0, arg_8_1, Onboarding.PrestigeMasterProgression)
end

function PrestigeMasterMenu(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIHorizontalNavigator.new()

	var_9_0.id = "PrestigeMasterMenu"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	var_9_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})
	var_9_0.HelperBar.id = "HelperBar"

	var_9_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_9_0.HelperBar:setPriority(10)
	var_9_0:addElement(var_9_0.HelperBar)

	local var_9_2 = var_9_0
	local var_9_3

	if CONDITIONS.InGame() then
		local var_9_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_9_1
		})

		var_9_4.id = "InGameMenuBackground"

		var_9_4:SetAlpha(0, 0)
		var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * -1, 0, 0)
		var_9_0:addElement(var_9_4)

		var_9_0.InGameMenuBackground = var_9_4
	end

	local var_9_5

	if not Engine.DDJFBBJAIG() then
		local var_9_6 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_9_1
		})

		var_9_6.id = "InGameMenuTimerStatus"

		var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_9_0:addElement(var_9_6)

		var_9_0.InGameMenuTimerStatus = var_9_6
	end

	local var_9_7
	local var_9_8 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = false,
		maxVisibleColumns = 2,
		maxVisibleRows = 6,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_9_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PrestigeMasterProgressItem", {
				controllerIndex = var_9_1
			})
		end,
		refreshChild = function(arg_11_0, arg_11_1, arg_11_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 503,
		rowHeight = _1080p * 78,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_9_9 = LUI.UIGrid.new(var_9_8)

	var_9_9.id = "PrestigeGrid"

	var_9_9:setUseStencil(false)
	var_9_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -504, _1080p * 504, _1080p * 422, _1080p * 900)
	var_9_0:addElement(var_9_9)

	var_9_0.PrestigeGrid = var_9_9

	local var_9_10
	local var_9_11 = LUI.UIImage.new()

	var_9_11.id = "Separator"

	var_9_11:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_9_11:SetAlpha(0.5, 0)
	var_9_11:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 452, _1080p * -452, _1080p * 933, _1080p * 935)
	var_9_0:addElement(var_9_11)

	var_9_0.Separator = var_9_11

	local var_9_12
	local var_9_13 = LUI.UIStyledText.new()

	var_9_13.id = "Description"

	var_9_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_9_13:SetAlpha(0.8, 0)
	var_9_13:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_DESCRIPTION"), 0)
	var_9_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_13:setTextStyle(CoD.TextStyle.Shadowed)
	var_9_13:SetWordWrap(false)
	var_9_13:SetAlignment(LUI.Alignment.Center)
	var_9_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_13:SetStartupDelay(1000)
	var_9_13:SetLineHoldTime(400)
	var_9_13:SetAnimMoveTime(1500)
	var_9_13:SetAnimMoveSpeed(1500)
	var_9_13:SetEndDelay(1000)
	var_9_13:SetCrossfadeTime(400)
	var_9_13:SetFadeInTime(300)
	var_9_13:SetFadeOutTime(300)
	var_9_13:SetMaxVisibleLines(1)
	var_9_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 945, _1080p * 963)
	var_9_0:addElement(var_9_13)

	var_9_0.Description = var_9_13

	local var_9_14
	local var_9_15 = MenuBuilder.BuildRegisteredType("PrestigeProgressBar", {
		controllerIndex = var_9_1
	})

	var_9_15.id = "PrestigeProgress"

	var_9_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -546, _1080p * 545, _1080p * 208, _1080p * 328)
	var_9_0:addElement(var_9_15)

	var_9_0.PrestigeProgress = var_9_15

	local var_9_16
	local var_9_17 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_9_1
	})

	var_9_17.id = "WZContainer"

	var_9_17.TitleBackground:SetLeft(_1080p * 4, 0)
	var_9_17.TitleBackground:SetRight(_1080p * -4, 0)
	var_9_17.TitleBackground:SetTop(_1080p * 19, 0)
	var_9_17.TitleBackground:SetBottom(_1080p * 47, 0)
	var_9_17.TitleBackground:SetAlpha(0, 0)
	var_9_17.Title:SetLeft(_1080p * 14, 0)
	var_9_17.Title:SetRight(_1080p * -14, 0)
	var_9_17.Title:SetTop(_1080p * 8, 0)
	var_9_17.Title:SetBottom(_1080p * 34, 0)
	var_9_17.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_RIBBONS")), 0)
	var_9_17.Title:SetAlignment(LUI.Alignment.Left)
	var_9_17.BorderBacker:SetLeft(0, 0)
	var_9_17.BorderBacker:SetRight(0, 0)
	var_9_17.BorderBacker:SetTop(0, 0)
	var_9_17.BorderBacker:SetBottom(0, 0)
	var_9_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -508, _1080p * 508, _1080p * 352, _1080p * 394)
	var_9_0:addElement(var_9_17)

	var_9_0.WZContainer = var_9_17

	var_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_9_18 = LUI.UIBindButton.new()

	var_9_18.id = "selfBindButton"

	var_9_0:addElement(var_9_18)

	var_9_0.bindButton = var_9_18

	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("PrestigeMasterMenu", PrestigeMasterMenu)
LockTable(_M)
