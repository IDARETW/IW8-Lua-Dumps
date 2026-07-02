module(..., package.seeall)

local function var_0_0()
	local var_1_0 = {}
	local var_1_1 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.COUNT)

	if var_1_1 == nil then
		local var_1_2 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.ERROR_CODE) or -1

		if var_1_2 ~= -1 then
			LUI.FlowManager.RequestPopupMenu(self, "CustomModeDataErrorPopup", false, controllerIndex, false, MP.MatchRulesErrorCodeMessage[var_1_2])
		end

		var_1_1 = 0
	end

	if var_1_1 >= 0 then
		for iter_1_0 = 0, var_1_1 - 1 do
			local var_1_3 = {}
			local var_1_4 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_1_0, MP.MatchRulesSaveHeaderLookup.GAMETYPE_RAW)
			local var_1_5 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_1_4, CSV.gameTypesTable.cols.image)
			local var_1_6 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_1_0, MP.MatchRulesSaveHeaderLookup.GAMETYPE_FULL))
			local var_1_7 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_1_0, MP.MatchRulesSaveHeaderLookup.NAME)
			local var_1_8 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_1_0, MP.MatchRulesSaveHeaderLookup.DESCRIPTION))
			local var_1_9 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_1_0, MP.MatchRulesSaveHeaderLookup.TIMESTAMP))

			var_1_3.name = var_1_7
			var_1_3.desc = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_DESCRIPTION", var_1_8, var_1_6, var_1_9)
			var_1_3.image = RegisterMaterial(var_1_5)

			table.insert(var_1_0, var_1_3)
		end
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Recipes)

	local var_2_0 = var_0_0()

	arg_2_0.Recipes:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		arg_3_0.modeInfo = var_2_0[arg_3_2 + 1]

		arg_3_0.Text:setText(arg_3_0.modeInfo.name)

		if not arg_3_0.registeredHandlers then
			arg_3_0.registeredHandlers = true
			arg_3_0.actionSFX = "ui_select_screen_return"

			arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
				LUI.FlowManager.RequestPopupMenu(nil, "RecipeCreatePopup", true, arg_2_1, false, {
					saveSlot = arg_3_2
				})
			end)
			arg_3_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
				arg_2_0.ModeDetails:SetMode(arg_5_0.modeInfo)
			end)
			arg_3_0:addEventHandler("grid_anim", function(arg_6_0, arg_6_1)
				arg_6_0:SetAlpha(arg_6_1.value)
			end)
		end
	end)
	arg_2_0.Recipes:SetNumChildren(#var_2_0)
	arg_2_0.Recipes:RefreshContent()
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/REPLACE_GAMEMODES"))
	ACTIONS.ScaleFullscreen(arg_2_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
end

function RecipeDeleteMenu(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0.id = "RecipeDeleteMenu"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "Cinematic"

	var_7_0:addElement(var_7_4)

	var_7_0.Cinematic = var_7_4

	local var_7_5
	local var_7_6 = {
		worldBlur = 1,
		controllerIndex = var_7_1
	}
	local var_7_7 = MenuBuilder.BuildRegisteredType("WorldBlur", var_7_6)

	var_7_7.id = "WorldBlur"

	var_7_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_7_0:addElement(var_7_7)

	var_7_0.WorldBlur = var_7_7

	local var_7_8
	local var_7_9 = LUI.UIImage.new()

	var_7_9.id = "Darken"

	var_7_9:SetRGBFromInt(0, 0)
	var_7_9:SetAlpha(0.5, 0)
	var_7_0:addElement(var_7_9)

	var_7_0.Darken = var_7_9

	local var_7_10
	local var_7_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_7_1
	})

	var_7_11.id = "TabBacker"

	var_7_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_7_0:addElement(var_7_11)

	var_7_0.TabBacker = var_7_11

	local var_7_12
	local var_7_13 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 3,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_14 = LUI.UIGrid.new(var_7_13)

	var_7_14.id = "Recipes"

	var_7_14:setUseStencil(false)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 809)
	var_7_0:addElement(var_7_14)

	var_7_0.Recipes = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("ModeDetails", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "ModeDetails"

	var_7_16.GenericItemInfo.BodyText:setText("", 0)
	var_7_16.GenericItemInfo.HeaderText:setText("", 0)
	var_7_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1344, _1080p * -524, _1080p * 216, _1080p * 416)
	var_7_0:addElement(var_7_16)

	var_7_0.ModeDetails = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "MenuTitle"

	var_7_18.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/REPLACE_GAMEMODES")), 0)
	var_7_18.Line:SetLeft(0, 0)
	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_7_0:addElement(var_7_18)

	var_7_0.MenuTitle = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIText.new()

	var_7_20.id = "Desc"

	var_7_20:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_7_20:setText(Engine.CBBHFCGDIC("MENU/REPLACE_GAMEMODE_DESC"), 0)
	var_7_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_20:SetWordWrap(false)
	var_7_20:SetAlignment(LUI.Alignment.Left)
	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 602, _1080p * 175, _1080p * 195)
	var_7_0:addElement(var_7_20)

	var_7_0.Desc = var_7_20

	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_7_21 = LUI.UIBindButton.new()

	var_7_21.id = "selfBindButton"

	var_7_0:addElement(var_7_21)

	var_7_0.bindButton = var_7_21

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("RecipeDeleteMenu", RecipeDeleteMenu)
LockTable(_M)
