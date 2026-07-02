module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0
	local var_1_1 = arg_1_0.SeasonGrid:GetNumColumns() * arg_1_2 + arg_1_1 + 1
	local var_1_2 = arg_1_3 + var_1_1
	local var_1_3 = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_1_4,
		_seasonNumOverride = var_1_2,
		_rankTypeOverride = PROGRESSION.RANK_TYPES.SEASONAL
	})

	DebugPrint("MemorialMenu::GetSeasonalData season " .. var_1_1 .. " rank=" .. var_1_3._rank .. "/" .. var_1_3._rankMax .. " percentage=" .. var_1_3._rankPercentage .. ".")

	return {
		isSeasonalProgression = true,
		isSeasonActive = false,
		season = var_1_1,
		seasonDataNum = var_1_2,
		prestige = var_1_3._prestige,
		rank = var_1_3._rank,
		rankDisplay = var_1_3._rankDisplay,
		controllerIndex = arg_1_4,
		percentage = var_1_3._rankPercentage,
		image = var_1_3._rankIcon,
		isComplete = var_1_3._isXpProgressionComplete,
		isInSeasonProgression = PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_1_0._controllerIndex, var_1_2, true) > 0
	}
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.SeasonGrid

	assert(var_2_0)

	local var_2_1 = arg_2_1.columns or 1
	local var_2_2 = arg_2_1.rows or 1
	local var_2_3 = SEASON.GetStartingSeasonDataNumForChapter(arg_2_1.chapter) - 1

	var_2_0:SetNumChildren(var_2_2 * var_2_1)
	var_2_0:SetNumColumns(var_2_1)
	var_2_0:SetNumRows(var_2_2)
	var_2_0:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = var_0_0(arg_2_0, arg_3_1, arg_3_2, var_2_3, arg_2_0._controllerIndex)

		if var_3_0 then
			arg_3_0.columnIdx = arg_3_1
			arg_3_0.rowIdx = arg_3_2

			arg_3_0:UpdateData(var_3_0)
			ACTIONS.AnimateSequence(arg_3_0, "Memorial")
		end
	end)
	var_2_0:RefreshContent()
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._controllerIndex = arg_4_1

	local var_4_0 = SEASON.GetCurrentChapterNum() - 1

	var_0_1(arg_4_0, {
		rows = 2,
		columns = 3,
		chapter = var_4_0
	})
end

function MemorialMenu(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIHorizontalNavigator.new()

	var_5_0.id = "MemorialMenu"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.soundSet = "mpMainMenu"
	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "Description"

	var_5_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_4:SetAlpha(0.8, 0)
	var_5_4:setText(Engine.CBBHFCGDIC("LUA_MENU/MEMORIAL_INFO"), 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetWordWrap(false)
	var_5_4:SetAlignment(LUI.Alignment.Center)
	var_5_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_4:SetStartupDelay(1000)
	var_5_4:SetLineHoldTime(400)
	var_5_4:SetAnimMoveTime(1500)
	var_5_4:SetAnimMoveSpeed(1500)
	var_5_4:SetEndDelay(1000)
	var_5_4:SetCrossfadeTime(400)
	var_5_4:SetFadeInTime(300)
	var_5_4:SetFadeOutTime(300)
	var_5_4:SetMaxVisibleLines(1)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 591, _1080p * 1329, _1080p * 980, _1080p * 998)
	var_5_0:addElement(var_5_4)

	var_5_0.Description = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Separator"

	var_5_6:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 591, _1080p * 1329, _1080p * 969, _1080p * 971)
	var_5_0:addElement(var_5_6)

	var_5_0.Separator = var_5_6

	local var_5_7
	local var_5_8 = {
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
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SeasonProgressionOverviewButton", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 244,
		rowHeight = _1080p * 346,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_9 = LUI.UIGrid.new(var_5_8)

	var_5_9.id = "SeasonGrid"

	var_5_9:setUseStencil(true)
	var_5_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 579, _1080p * 1350, _1080p * 250, _1080p * 969)
	var_5_0:addElement(var_5_9)

	var_5_0.SeasonGrid = var_5_9

	local var_5_10
	local var_5_11 = LUI.UIStyledText.new()

	var_5_11.id = "LegacyHeaderStyledLabel"

	var_5_11:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_11:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MEMORIAL_TITLE")), 0)
	var_5_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_11:SetAlignment(LUI.Alignment.Left)
	var_5_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 579, _1080p * 1341, _1080p * 213, _1080p * 242)
	var_5_0:addElement(var_5_11)

	var_5_0.LegacyHeaderStyledLabel = var_5_11

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_5_12 = LUI.UIBindButton.new()

	var_5_12.id = "selfBindButton"

	var_5_0:addElement(var_5_12)

	var_5_0.bindButton = var_5_12

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MemorialMenu", MemorialMenu)
LockTable(_M)
