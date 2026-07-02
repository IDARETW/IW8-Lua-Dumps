module(..., package.seeall)

local var_0_0 = "frontEnd.mp.TeamLogo"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODCASTER/TEAM1_LOGO"))

	if arg_1_2.isTeamOne ~= nil then
		arg_1_0.isTeamOne = arg_1_2.isTeamOne
	end

	arg_1_0:addEventHandler("logo_selected", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.index
		local var_2_1 = arg_2_0.TeamLogos:GetMaxVisibleColumns()
		local var_2_2 = var_2_0 % var_2_1
		local var_2_3 = math.floor(var_2_0 / var_2_1)
		local var_2_4 = arg_2_1.logoColorMaterial
		local var_2_5 = ToUpperCase(arg_2_1.logoName)
		local var_2_6 = arg_2_0.lockedLogoIndex % var_2_1
		local var_2_7 = math.floor(arg_2_0.lockedLogoIndex / var_2_1)

		arg_2_0.lockedLogo = arg_2_0.TeamLogos:GetElementAtPosition(var_2_6, var_2_7)
		arg_2_0.selectedLogoIndex = arg_2_1.index

		arg_2_0.TeamLogoPreview:setImage(RegisterMaterial(var_2_4), 0)
		arg_2_0.TeamLogoNamePreview:setText(var_2_5, 0)

		if arg_2_0.selectedLogo ~= nil then
			ACTIONS.AnimateSequence(arg_2_0.selectedLogo, "DefaultSequence")
		end

		if lockedLogo ~= nil then
			ACTIONS.AnimateSequence(lockedLogo, "Locked")
		end

		arg_2_0.selectedLogo = arg_2_0.TeamLogos:GetElementAtPosition(var_2_2, var_2_3)

		if arg_2_0.selectedLogo ~= nil then
			if arg_2_0.isTeamOne then
				MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_icon", var_2_0)
			else
				MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_icon", var_2_0)
			end

			ACTIONS.AnimateSequence(arg_2_0.selectedLogo, "Selected")
		end
	end)

	local var_1_0 = {}
	local var_1_1 = StringTable.BFHCAIIDA(CSV.teamLogoTable.file)
	local var_1_2 = LUI.DataSourceFromList.new(var_1_1)

	var_1_2:SetCachingEnabled(true)

	function var_1_2.MakeDataSourceAtIndex(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = ToUpperCase(Engine.CBBHFCGDIC(StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_3_1, CSV.teamLogoTable.cols.teamName)))
		local var_3_1 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_3_1, CSV.teamLogoTable.cols.logoWhiteMaterial)
		local var_3_2 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_3_1, CSV.teamLogoTable.cols.logoColorMaterial)

		if var_3_2 == "" then
			var_3_2 = var_3_1
		end

		local var_3_3 = var_0_0 .. ".item." .. arg_3_1

		return {
			index = LUI.DataSourceInGlobalModel.new(var_3_3 .. ".index", arg_3_1),
			teamName = LUI.DataSourceInGlobalModel.new(var_3_3 .. ".teamName", var_3_0),
			logoWhiteMaterial = LUI.DataSourceInGlobalModel.new(var_3_3 .. ".logoWhiteMaterial", var_3_1),
			logoColorMaterial = LUI.DataSourceInGlobalModel.new(var_3_3 .. ".logoColorMaterial", var_3_2)
		}
	end

	arg_1_0.TeamLogos:SetGridDataSource(var_1_2, arg_1_1)

	local var_1_3 = MLG.ShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_icon")
	local var_1_4 = MLG.ShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_icon")
	local var_1_5

	if arg_1_0.isTeamOne then
		local var_1_6 = ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM1_LOGO"))

		arg_1_0.selectedLogoIndex = var_1_3
		arg_1_0.lockedLogoIndex = var_1_4
	else
		local var_1_7 = ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM2_LOGO"))

		arg_1_0.selectedLogoIndex = var_1_4
		arg_1_0.lockedLogoIndex = var_1_3
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Background)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

function CodcasterTeamLogoSettings(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "CodcasterTeamLogoSettings"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "TeamLogoNamePreview"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetStartupDelay(1000)
	var_4_6:SetLineHoldTime(500)
	var_4_6:SetAnimMoveTime(500)
	var_4_6:SetEndDelay(1000)
	var_4_6:SetCrossfadeTime(500)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1074, _1080p * 1790, _1080p * 240, _1080p * 310)
	var_4_0:addElement(var_4_6)

	var_4_0.TeamLogoNamePreview = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "TeamLogoPreview"

	var_4_8:setImage(RegisterMaterial("icon_faction_unsa_color"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1173, _1080p * 1527, _1080p * 360, _1080p * 714)
	var_4_0:addElement(var_4_8)

	var_4_0.TeamLogoPreview = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "MenuTitle"

	var_4_10.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM1_LOGO")), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_10)

	var_4_0.MenuTitle = var_4_10

	local var_4_11
	local var_4_12 = {
		buildArrowsLabel = false,
		maxVisibleRows = 2,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 6,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CodCasterTeamLogo", {
				controllerIndex = var_4_1
			})
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 140,
		rowHeight = _1080p * 140,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_13 = LUI.UIDataSourceGrid.new(var_4_12)

	var_4_13.id = "TeamLogos"

	var_4_13:setUseStencil(true)
	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1033, _1080p * 240, _1080p * 564)
	var_4_0:addElement(var_4_13)

	var_4_0.TeamLogos = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIText.new()

	var_4_15.id = "UnlockedGesturesCopy0"

	var_4_15:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_4_15:setText(Engine.CBBHFCGDIC("CODCASTER/SELECTED_LOGO"), 0)
	var_4_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_15:SetAlignment(LUI.Alignment.Left)
	var_4_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -846, _1080p * -648, _1080p * 222, _1080p * 244)
	var_4_0:addElement(var_4_15)

	var_4_0.UnlockedGesturesCopy0 = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIImage.new()

	var_4_17.id = "GridDivider"

	var_4_17:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_17:SetAlpha(0.6, 0)
	var_4_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1019, _1080p * 227, _1080p * 228)
	var_4_0:addElement(var_4_17)

	var_4_0.GridDivider = var_4_17

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_4_18 = LUI.UIBindButton.new()

	var_4_18.id = "selfBindButton"

	var_4_0:addElement(var_4_18)

	var_4_0.bindButton = var_4_18

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CodcasterTeamLogoSettings", CodcasterTeamLogoSettings)
LockTable(_M)
