module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Selected)
	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_1 and "On" or "Off")
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "Equipped" or "UnEquipped")

	if not arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "ButtonUp")
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0.Grid:GetNumRows() then
		local var_2_0 = math.min(arg_2_0.Grid:GetMaxVisibleRows(), arg_2_0.Grid:GetNumRows())
		local var_2_1 = arg_2_0.Grid:GetBuiltChildren()[1]
		local var_2_2, var_2_3, var_2_4, var_2_5 = arg_2_0.Grid:getLocalRect()
		local var_2_6, var_2_7, var_2_8, var_2_9 = var_2_1:getLocalRect()
		local var_2_10, var_2_11, var_2_12, var_2_13 = arg_2_0.PromptFavorite:getLocalRect()
		local var_2_14 = 1 + arg_2_0.Grid:GetScale()
		local var_2_15 = (var_2_9 - var_2_7 + arg_2_0.Grid:GetSpacingX()) * var_2_14
		local var_2_16 = _1080p * 70
		local var_2_17 = var_2_13 - var_2_11
		local var_2_18 = var_2_0 * var_2_15 + var_2_3 + var_2_16

		arg_2_0.PromptFavorite:SetTop(var_2_18)
		arg_2_0.PromptFavorite:SetBottom(var_2_18 + var_2_17)
		arg_2_0.PromptEquip:SetTop(var_2_18)
		arg_2_0.PromptEquip:SetBottom(var_2_18 + var_2_17)

		local var_2_19, var_2_20, var_2_21, var_2_22 = arg_2_0.MouseClickIcon:getLocalRect()
		local var_2_23 = var_2_22 - var_2_20
		local var_2_24 = 4
		local var_2_25 = var_2_18 - (var_2_23 - var_2_17 + var_2_24) * 0.5

		arg_2_0.MouseClickIcon:SetTop(var_2_25)
		arg_2_0.MouseClickIcon:SetBottom(var_2_25 + var_2_23)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_1)

	local var_3_0 = arg_3_0._currentOperators

	table.sort(var_3_0, function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_0.ref == arg_3_1.ref
		local var_4_1 = arg_4_1.ref == arg_3_1.ref

		if var_4_0 ~= var_4_1 then
			return var_4_0 and not var_4_1
		end

		local var_4_2 = arg_4_0.isSelected
		local var_4_3 = arg_4_1.isSelected

		if var_4_2 ~= var_4_3 then
			return var_4_2 and not var_4_3
		end

		local var_4_4 = arg_4_0.favorited
		local var_4_5 = arg_4_1.favorited

		if var_4_4 ~= var_4_5 then
			return var_4_4 and not var_4_5
		end

		local var_4_6 = Engine.CBBHFCGDIC(arg_4_0.name)
		local var_4_7 = Engine.CBBHFCGDIC(arg_4_1.name)

		if var_4_6 ~= var_4_7 then
			return var_4_6 < var_4_7
		end
	end)
	arg_3_0.Grid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_3_0.Grid:GetContentIndex(arg_5_1, arg_5_2)

		if var_5_0 == nil then
			return
		end

		if not var_3_0 then
			return
		end

		local var_5_1 = PlayerData.BFFBGAJGD(arg_3_0._controllerIndex, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[OPERATOR.WZ_OPERATOR_INDEX]:get()
		local var_5_2 = var_3_0[var_5_0 + 1]

		var_5_2.isUnlocked = LOOT.IsUnlocked(arg_3_0._controllerIndex, LOOT.itemTypes.OPERATOR, var_5_2.ref)
		arg_5_0._operatorIndex = var_5_0 + 1

		if not arg_3_0._viewedOperatorInfo and var_5_0 == 0 then
			var_5_2.isCurrentViewed = true
			arg_3_0._viewedOperatorInfo = var_5_2
		end

		if not arg_3_0._equippedOperatorInfo and var_5_2.isSelected then
			arg_3_0._equippedOperatorInfo = var_5_2
		end

		arg_5_0:Setup(arg_3_0._controllerIndex, var_5_2, arg_3_0)
		arg_5_0:SetSelected(var_5_2.ref == var_5_1)
		arg_5_0:SetViewedOperator(var_5_2.isCurrentViewed)
	end)
	arg_3_0.Grid:SetNumChildren(#var_3_0)
	arg_3_0.Grid:RefreshContent()

	local function var_3_1()
		local var_6_0 = 0

		for iter_6_0 = 1, #var_3_0 do
			if arg_3_0._initialSelectedOperatorRef == var_3_0[iter_6_0].ref then
				var_6_0 = iter_6_0 - 1

				break
			end
		end

		return arg_3_0.Grid:GetPositionForIndex(var_6_0)
	end

	arg_3_0.Grid:SetDefaultFocus(var_3_1)
	arg_3_0.Grid:GainFocus()
	var_0_1(arg_3_0)
end

local function var_0_3(arg_7_0, arg_7_1)
	local var_7_0 = OPERATOR.GetFactionName(arg_7_1.ref)

	arg_7_0._initialSelectedOperatorRef = arg_7_1.ref

	arg_7_0.Name:setText(Engine.CBBHFCGDIC(arg_7_1.name))
	arg_7_0.FullName:setText(Engine.CBBHFCGDIC(arg_7_1.fullName))
	arg_7_0.FactionIcon:setImage(RegisterMaterial(arg_7_1.factionIcon))
	arg_7_0.FactionName:setText(ToUpperCase(Engine.CBBHFCGDIC(var_7_0)))

	local var_7_1 = OPERATOR.GetOperatorGameSourceID(arg_7_1.ref)

	ACTIONS.AnimateSequence(arg_7_0, LUI.GetAnimForGameSource(var_7_1))

	if OPERATOR.SetIsOperatorSelected(arg_7_0._controllerIndex, {
		operatorInfo = arg_7_1
	}) then
		WZWIP.AnimateThemeElement(arg_7_0.EquippedWidget, "TurnOn")
		ACTIONS.AnimateSequence(arg_7_0, "Equipped")
	else
		ACTIONS.AnimateSequence(arg_7_0.EquippedWidget, "TurnOff")
		ACTIONS.AnimateSequence(arg_7_0, "UnEquipped")
	end

	arg_7_0.Details:SetBioDetails({
		background = Engine.CBBHFCGDIC(arg_7_1.background),
		firstLanguage = Engine.CBBHFCGDIC(arg_7_1.firstLanguage),
		citizenShip = Engine.CBBHFCGDIC(arg_7_1.citizenship),
		favoriteWeaponRef = arg_7_1.favoriteWeaponRef
	})

	local var_7_2, var_7_3, var_7_4, var_7_5 = arg_7_0.FullName:getLocalRect()
	local var_7_6, var_7_7, var_7_8, var_7_9 = arg_7_0.Dot:getLocalRect()
	local var_7_10, var_7_11, var_7_12, var_7_13 = arg_7_0.SnipeIcon:getLocalRect()
	local var_7_14 = LAYOUT.GetTextWidth(arg_7_0.FullName)
	local var_7_15 = var_7_8 - var_7_6
	local var_7_16 = var_7_12 - var_7_10
	local var_7_17 = 10 * _1080p
	local var_7_18 = var_7_2 + var_7_14 + var_7_17 * 2

	arg_7_0.Dot:SetLeft(var_7_18)
	arg_7_0.Dot:SetRight(var_7_18 + var_7_15)

	local var_7_19 = var_7_18 + var_7_15 + var_7_17 * 2

	arg_7_0.SnipeIcon:SetLeft(var_7_19)
	arg_7_0.SnipeIcon:SetRight(var_7_19 + var_7_16)
end

local var_0_4 = {
	SHOW_EQUIP_OPTION = 2,
	ON_FOCUS = 1,
	HIDE = 0
}

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1 and arg_8_1.state or var_0_4.ON_FOCUS
	local var_8_1 = arg_8_0._isKBMInput and "OPERATIONS/OPERATOR_VIEW_KBM" or "OPERATIONS/OPERATOR_VIEW"

	ACTIONS.AnimateSequence(arg_8_0, arg_8_0._isKBMInput and "DisplayKBM" or "DisplayGamepad")

	if not arg_8_0._activeButton then
		return
	end

	local var_8_2 = arg_8_0._activeButton:GetIsFavorited() and "OPERATIONS/OPERATOR_UNFAVORITE_WITH_NUM" or "OPERATIONS/OPERATOR_FAVORITE_WITH_NUM"
	local var_8_3 = arg_8_0._activeButton:GetIsCurrentlyViewedOperator()
	local var_8_4 = arg_8_0._activeButton:GetIsSelected()
	local var_8_5 = arg_8_0._activeButton:GetIsUnlocked()
	local var_8_6 = var_8_3 and not var_8_5
	local var_8_7 = var_8_4 and var_8_3

	arg_8_0.PromptFavorite:setText(Engine.CBBHFCGDIC(var_8_2, arg_8_0._currentFavoriteCount, LOOT.MAX_FAVORITE_OPERATORS))

	if var_8_0 == var_0_4.HIDE or var_8_7 or var_8_6 then
		ACTIONS.AnimateSequence(arg_8_0, "HideEquipPrompt")

		if arg_8_0._isKBMInput then
			ACTIONS.AnimateSequence(arg_8_0, "HideMouseIcon")
		end

		return
	elseif var_8_0 == var_0_4.SHOW_EQUIP_OPTION or not var_8_4 and var_8_3 and var_8_5 then
		var_8_1 = arg_8_0._isKBMInput and "OPERATIONS/OPERATOR_EQUIP_KBM" or "OPERATIONS/OPERATOR_EQUIP"
	end

	if arg_8_0._isKBMInput then
		ACTIONS.AnimateSequence(arg_8_0, "ShowMouseIcon")
	end

	ACTIONS.AnimateSequence(arg_8_0, "ShowEquipPrompt")
	arg_8_0.PromptEquip:setText(Engine.CBBHFCGDIC(var_8_1))
end

local function var_0_6(arg_9_0, arg_9_1)
	if arg_9_1 then
		arg_9_0._favoriteOperators = arg_9_1.updatedFavorites
		arg_9_0._currentFavoriteCount = arg_9_1.favoriteCount

		ACTIONS.AnimateSequence(arg_9_0, "ShowFavoriteSuccess")
	end

	var_0_5(arg_9_0)
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	if not arg_10_0._activeButton or arg_10_0._activeButton ~= arg_10_1 then
		if arg_10_0._activeButton then
			arg_10_0._activeButton:LoseButtonFocus()
		end

		arg_10_0._activeButton = arg_10_1

		arg_10_0.FactionOperatorName:setText(Engine.CBBHFCGDIC(arg_10_1._operatorInfo.name))
		var_0_5(arg_10_0)
	end
end

local function var_0_8(arg_11_0, arg_11_1, arg_11_2)
	arg_11_2._isCurrentViewedOperator = true

	arg_11_0:SetBioDetails(arg_11_2._operatorInfo)
	OPERATOR.SetSceneCharacterModel(arg_11_0, arg_11_1, {
		showARandomSkin = true,
		element = arg_11_0,
		operatorInfo = arg_11_2._operatorInfo,
		menuRef = arg_11_0._menuRef
	})
end

local function var_0_9(arg_12_0, arg_12_1)
	local var_12_0 = OPERATOR.IsT9Operator(arg_12_0._operatorInfo.ref)
	local var_12_1 = arg_12_0:GetIsUnlocked()
	local var_12_2 = Dvar.IBEGCHEFE("RONTRKPRP") == true

	if var_12_0 and not var_12_1 and not var_12_2 then
		-- block empty
	end
end

local function var_0_10(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_2 and arg_13_2.focusedOperator)

	local var_13_0 = arg_13_2.focusedOperator

	if arg_13_2.disableCallback then
		-- block empty
	end

	local function var_13_1(arg_14_0, arg_14_1, arg_14_2)
		var_0_8(arg_14_0, arg_14_1, var_13_0)
		OPERATOR.OnEquippedOperatorFocused(arg_14_0, arg_14_1, {
			child = var_13_0
		})

		if arg_14_0._equippedOperatorInfo then
			arg_14_0._equippedOperatorInfo.isSelected = false
		end

		var_13_0:SetSelected(true)

		arg_14_0._operatorInfo = var_13_0._operatorInfo

		var_0_5(arg_14_0, {
			state = var_0_4.HIDE
		})

		if arg_14_0._operatorSelectedCallback then
			arg_14_0._operatorSelectedCallback(arg_14_0, arg_14_1, {
				operatorInfo = arg_14_0._operatorInfo
			})
		end
	end

	local var_13_2 = LUI.FlowManager.GetScopedData(arg_13_0._menuRef)

	var_13_2.operatorData.operatorInfo = var_13_0._operatorInfo
	var_13_2.operatorData.useEquippedOperatorFocusIndex = true
	var_13_2.operatorData.useSelectedOperatorIndexForFocus = false

	LUI.FlowManager.ClearSavedMenuStatesByControllerIndex(arg_13_1, "BRMainMenu")
	OPERATOR.EquipOperator(arg_13_0, arg_13_1, {
		operatorInfo = var_13_0._operatorInfo,
		updateCallbackFunction = var_13_1
	})
end

local function var_0_11(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.element
	local var_15_1 = var_15_0._operatorInfo
	local var_15_2 = var_15_0:GetIsSelected()
	local var_15_3 = var_15_0:GetIsCurrentlyViewedOperator()

	local function var_15_4()
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)
	end

	if not var_15_0:GetIsUnlocked() then
		if not var_15_3 then
			var_0_8(arg_15_0, arg_15_1.controller, var_15_0)
			var_15_0:SetViewedOperator(true)
			var_0_5(arg_15_0, {
				state = var_0_4.SHOW_EQUIP_OPTION
			})

			if arg_15_0._viewedOperatorInfo.ref ~= var_15_1.ref then
				arg_15_0._viewedOperatorInfo.isCurrentViewed = false
			end

			arg_15_0._viewedOperatorInfo = var_15_1

			arg_15_0.Grid:RefreshContent()
			OPERATOR.RequestStreamingModels(arg_15_0, arg_15_1.controller, {
				singleRequest = true,
				child = var_15_0
			})
		else
			var_0_9(var_15_0, arg_15_1.controller)
			var_15_4()
		end

		if arg_15_0._operatorSelectedCallback then
			arg_15_0._operatorSelectedCallback(arg_15_0, arg_15_1.controller, {
				operatorInfo = var_15_0._operatorInfo
			})
		end

		return
	end

	if var_15_3 and var_15_2 then
		var_15_4()

		return
	end

	if var_15_3 and not var_15_2 then
		var_0_10(arg_15_0, arg_15_1.controller, {
			focusedOperator = var_15_0
		})
	else
		var_0_8(arg_15_0, arg_15_1.controller, var_15_0)
		var_15_0:SetViewedOperator(true)
		var_0_5(arg_15_0, {
			state = var_0_4.SHOW_EQUIP_OPTION
		})

		if arg_15_0._operatorSelectedCallback then
			arg_15_0._operatorSelectedCallback(arg_15_0, arg_15_1.controller, {
				operatorInfo = var_15_0._operatorInfo
			})
		end
	end

	if arg_15_0._viewedOperatorInfo.ref ~= var_15_1.ref then
		arg_15_0._viewedOperatorInfo.isCurrentViewed = false
	end

	arg_15_0._viewedOperatorInfo = var_15_1

	arg_15_0.Grid:RefreshContent()
	OPERATOR.RequestStreamingModels(arg_15_0, arg_15_1.controller, {
		singleRequest = true,
		child = var_15_0
	})
end

local function var_0_12(arg_17_0, arg_17_1)
	if not arg_17_1 or not arg_17_1.menuRef then
		assert(false, "Missing a reference to the main Operator Select Menu. The scoped menu data is accessed ensure consistency between menu features such as Equipping and Favoriting.")
	end

	local var_17_0 = arg_17_1.operatorData

	assert(var_17_0.menuData)
	assert(var_17_0.operatorInfo)

	local var_17_1 = var_17_0.operatorInfo

	if var_17_0.menuData.operatorList then
		arg_17_0._currentOperators = var_17_0.menuData.operatorList

		var_0_2(arg_17_0, var_17_1)
	end

	arg_17_0._favoriteOperators = var_17_0.menuData.favoriteOperators
	arg_17_0._currentFavoriteCount = var_17_0.menuData.currentFavoriteCount
	arg_17_0._menuRef = arg_17_1.menuRef
	arg_17_0._operatorInfo = var_17_1

	var_0_3(arg_17_0, var_17_1)
	var_0_6(arg_17_0)
end

local function var_0_13(arg_18_0)
	if arg_18_0._viewedOperatorInfo then
		arg_18_0._viewedOperatorInfo.isCurrentViewed = false
		arg_18_0._viewedOperatorInfo = nil
	end
end

local function var_0_14(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.EquipOperator = var_0_10
	arg_19_0.OnChildFocused = var_0_7
	arg_19_0.SetBioDetails = var_0_3
	arg_19_0.OnClose = var_0_13
	arg_19_0._idleAnimationsTable, arg_19_0._equipAnimationsTable = OPERATOR.GetSceneCharacterModelAnimations()

	arg_19_0.Grid:SetGridItemClickHandler({
		processDisabledClick = true,
		scope = arg_19_0
	})
	arg_19_0:addEventHandler("grid_item_clicked", var_0_11)

	arg_19_0._controllerIndex = arg_19_1
	arg_19_0._operatorSelectedCallback = arg_19_2.callback

	var_0_12(arg_19_0, arg_19_2.scopedData)

	local var_19_0 = LUI.UIBindButton.new()

	var_19_0.id = "bindButton"

	arg_19_0:addElement(var_19_0)
	var_19_0:addEventHandler("button_right_stick", function(arg_20_0, arg_20_1)
		OPERATOR.SetFavorite(arg_19_0, arg_20_1.controller, {
			operator = arg_19_0._activeButton,
			currentFavorites = arg_19_0._favoriteOperators,
			currentCount = arg_19_0._currentFavoriteCount,
			onUnsuccessful = function(arg_21_0)
				ACTIONS.AnimateSequence(arg_21_0, "ShowFavoriteWarning")
			end,
			onSuccessfulRemoval = var_0_6,
			onSuccessfulAdd = var_0_6
		})
	end)

	local function var_19_1(arg_22_0, arg_22_1)
		arg_22_0._isKBMInput = LUI.IsLastInputKeyboardMouse(arg_22_1.controllerIndex)

		var_0_5(arg_22_0, {
			state = PROMPT_STATE_ON_FOCUS
		})
		ACTIONS.AnimateSequence(arg_22_0, arg_22_0._isKBMInput and "DisplayKBM" or "DisplayGamepad")
	end

	arg_19_0:registerAndCallEventHandler("update_input_type", var_19_1, {
		controllerIndex = arg_19_1
	})
end

function WZOperatorInfoBio(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIElement.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_23_0.id = "WZOperatorInfoBio"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = LUI.UIImage.new()

	var_23_4.id = "FactionIcon"

	var_23_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_4:SetAlpha(0.3, 0)
	var_23_4:SetColorOpParam(0.03, 0)
	var_23_4:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_23_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -645, _1080p * -355, _1080p * 313, _1080p * 603)
	var_23_0:addElement(var_23_4)

	var_23_0.FactionIcon = var_23_4

	local var_23_5
	local var_23_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorBioButton", {
				controllerIndex = var_23_1
			})
		end,
		refreshChild = function(arg_25_0, arg_25_1, arg_25_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 144,
		rowHeight = _1080p * 146,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_23_7 = LUI.UIGrid.new(var_23_6)

	var_23_7.id = "Grid"

	var_23_7:SetScale(-0.25, 0)
	var_23_7:setUseStencil(true)
	var_23_7:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -519, _1080p * -54, _1080p * 436, _1080p * 912)
	var_23_0:addElement(var_23_7)

	var_23_0.Grid = var_23_7

	local var_23_8
	local var_23_9 = LUI.UIStyledText.new()

	var_23_9.id = "FactionName"

	var_23_9:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_9:setText("SHADOW COMPANY", 0)
	var_23_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_23_9:SetWordWrap(false)
	var_23_9:SetAlignment(LUI.Alignment.Left)
	var_23_9:SetVerticalAlignment(LUI.Alignment.Center)
	var_23_9:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -461, _1080p * -96, _1080p * 425, _1080p * 463)
	var_23_0:addElement(var_23_9)

	var_23_0.FactionName = var_23_9

	local var_23_10
	local var_23_11 = LUI.UIStyledText.new()

	var_23_11.id = "FactionOperatorName"

	var_23_11:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_23_11:setText("", 0)
	var_23_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_11:SetWordWrap(false)
	var_23_11:SetAlignment(LUI.Alignment.Left)
	var_23_11:SetVerticalAlignment(LUI.Alignment.Center)
	var_23_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -461, _1080p * -96, _1080p * 461, _1080p * 484)
	var_23_0:addElement(var_23_11)

	var_23_0.FactionOperatorName = var_23_11

	local var_23_12
	local var_23_13 = LUI.UIStyledText.new()

	var_23_13.id = "Name"

	var_23_13:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_13:setText(ToUpperCase("GRAVES"), 0)
	var_23_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_23_13:SetWordWrap(false)
	var_23_13:SetLeading(-15 * _1080p, 0)
	var_23_13:SetAlignment(LUI.Alignment.Left)
	var_23_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_13:SetDecodeUseSystemTime(false)
	var_23_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 777, _1080p * 200, _1080p * 270)
	var_23_0:addElement(var_23_13)

	var_23_0.Name = var_23_13

	local var_23_14
	local var_23_15 = LUI.UIStyledText.new()

	var_23_15.id = "FullName"

	var_23_15:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_15:SetAlpha(0.8, 0)
	var_23_15:setText(ToUpperCase("GRAVES"), 0)
	var_23_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_15:SetWordWrap(false)
	var_23_15:SetLeading(-15 * _1080p, 0)
	var_23_15:SetAlignment(LUI.Alignment.Left)
	var_23_15:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_15:SetDecodeUseSystemTime(false)
	var_23_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 777, _1080p * 269, _1080p * 297)
	var_23_0:addElement(var_23_15)

	var_23_0.FullName = var_23_15

	local var_23_16
	local var_23_17 = LUI.UIImage.new()

	var_23_17.id = "SnipeIcon"

	var_23_17:setImage(RegisterMaterial("ui_icon_snipe_mw_truncated"), 0)
	var_23_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 294, _1080p * 371, _1080p * 262, _1080p * 302)
	var_23_0:addElement(var_23_17)

	var_23_0.SnipeIcon = var_23_17

	local var_23_18
	local var_23_19 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_23_1
	})

	var_23_19.id = "EquippedWidget"

	var_23_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 232, _1080p * 305, _1080p * 335)
	var_23_0:addElement(var_23_19)

	var_23_0.EquippedWidget = var_23_19

	local var_23_20
	local var_23_21 = LUI.UIImage.new()

	var_23_21.id = "Dot"

	var_23_21:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_21:setImage(RegisterMaterial("cac_mini_attachment_dot"), 0)
	var_23_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 274, _1080p * 282, _1080p * 288)
	var_23_0:addElement(var_23_21)

	var_23_0.Dot = var_23_21

	local var_23_22
	local var_23_23 = MenuBuilder.BuildRegisteredType("WZOperatorInfoBioDetails", {
		controllerIndex = var_23_1
	})

	var_23_23.id = "Details"

	var_23_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 646, _1080p * 354, _1080p * 792)
	var_23_0:addElement(var_23_23)

	var_23_0.Details = var_23_23

	local var_23_24
	local var_23_25 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_23_1
	})

	var_23_25.id = "OperatorGridScrollbar"

	var_23_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -106, _1080p * -96, _1080p * 495, _1080p * 844)
	var_23_0:addElement(var_23_25)

	var_23_0.OperatorGridScrollbar = var_23_25

	local var_23_26
	local var_23_27 = LUI.UIText.new()

	var_23_27.id = "PromptEquip"

	var_23_27:setText(Engine.CBBHFCGDIC("OPERATIONS/OPERATOR_EQUIP"), 0)
	var_23_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_27:SetWordWrap(false)
	var_23_27:SetAlignment(LUI.Alignment.Left)
	var_23_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1459, _1080p * 1806, _1080p * 864, _1080p * 884)
	var_23_0:addElement(var_23_27)

	var_23_0.PromptEquip = var_23_27

	local var_23_28
	local var_23_29 = LUI.UIText.new()

	var_23_29.id = "PromptFavorite"

	var_23_29:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_29:setText(Engine.CBBHFCGDIC("OPERATIONS/OPERATOR_FAVORITE_WITH_NUM"), 0)
	var_23_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_29:SetWordWrap(false)
	var_23_29:SetAlignment(LUI.Alignment.Right)
	var_23_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -461, _1080p * -114, _1080p * 864, _1080p * 884)
	var_23_0:addElement(var_23_29)

	var_23_0.PromptFavorite = var_23_29

	local var_23_30
	local var_23_31 = LUI.UIImage.new()

	var_23_31.id = "MouseClickIcon"

	var_23_31:SetAlpha(0, 0)
	var_23_31:setImage(RegisterMaterial("ui_button_kbm_mouseleftclick"), 0)
	var_23_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1456, _1080p * 1480, _1080p * 857, _1080p * 891)
	var_23_0:addElement(var_23_31)

	var_23_0.MouseClickIcon = var_23_31

	local function var_23_32()
		return
	end

	var_23_0._sequences.DefaultSequence = var_23_32

	local var_23_33
	local var_23_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 786
		}
	}

	var_23_23:RegisterAnimationSequence("Equipped", var_23_34)

	local function var_23_35()
		var_23_23:AnimateSequence("Equipped")
	end

	var_23_0._sequences.Equipped = var_23_35

	local var_23_36
	local var_23_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 749
		}
	}

	var_23_23:RegisterAnimationSequence("UnEquipped", var_23_37)

	local function var_23_38()
		var_23_23:AnimateSequence("UnEquipped")
	end

	var_23_0._sequences.UnEquipped = var_23_38

	local var_23_39
	local var_23_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.splashNotifications.warning
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1400,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_29:RegisterAnimationSequence("ShowFavoriteWarning", var_23_40)

	local function var_23_41()
		var_23_29:AnimateSequence("ShowFavoriteWarning")
	end

	var_23_0._sequences.ShowFavoriteWarning = var_23_41

	local var_23_42
	local var_23_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingSuccess
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1333,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_29:RegisterAnimationSequence("ShowFavoriteSuccess", var_23_43)

	local function var_23_44()
		var_23_29:AnimateSequence("ShowFavoriteSuccess")
	end

	var_23_0._sequences.ShowFavoriteSuccess = var_23_44

	local var_23_45
	local var_23_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_27:RegisterAnimationSequence("HideEquipPrompt", var_23_46)

	local var_23_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_31:RegisterAnimationSequence("HideEquipPrompt", var_23_47)

	local function var_23_48()
		var_23_27:AnimateSequence("HideEquipPrompt")
		var_23_31:AnimateSequence("HideEquipPrompt")
	end

	var_23_0._sequences.HideEquipPrompt = var_23_48

	local var_23_49
	local var_23_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_27:RegisterAnimationSequence("ShowEquipPrompt", var_23_50)

	local function var_23_51()
		var_23_27:AnimateSequence("ShowEquipPrompt")
	end

	var_23_0._sequences.ShowEquipPrompt = var_23_51

	local var_23_52
	local var_23_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1481
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1828
		}
	}

	var_23_27:RegisterAnimationSequence("DisplayKBM", var_23_53)

	local function var_23_54()
		var_23_27:AnimateSequence("DisplayKBM")
	end

	var_23_0._sequences.DisplayKBM = var_23_54

	local var_23_55
	local var_23_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1459
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1806
		}
	}

	var_23_27:RegisterAnimationSequence("DisplayGamepad", var_23_56)

	local var_23_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_31:RegisterAnimationSequence("DisplayGamepad", var_23_57)

	local function var_23_58()
		var_23_27:AnimateSequence("DisplayGamepad")
		var_23_31:AnimateSequence("DisplayGamepad")
	end

	var_23_0._sequences.DisplayGamepad = var_23_58

	local var_23_59
	local var_23_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_31:RegisterAnimationSequence("ShowMouseIcon", var_23_60)

	local function var_23_61()
		var_23_31:AnimateSequence("ShowMouseIcon")
	end

	var_23_0._sequences.ShowMouseIcon = var_23_61

	local var_23_62
	local var_23_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_31:RegisterAnimationSequence("HideMouseIcon", var_23_63)

	local function var_23_64()
		var_23_31:AnimateSequence("HideMouseIcon")
	end

	var_23_0._sequences.HideMouseIcon = var_23_64

	local var_23_65
	local var_23_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_small")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 422
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 247
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 317
		}
	}

	var_23_17:RegisterAnimationSequence("VG", var_23_66)

	local function var_23_67()
		var_23_17:AnimateSequence("VG")
	end

	var_23_0._sequences.VG = var_23_67

	local var_23_68
	local var_23_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 263
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 303
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_snipe_mw_truncated")
		}
	}

	var_23_17:RegisterAnimationSequence("MW", var_23_69)

	local function var_23_70()
		var_23_17:AnimateSequence("MW")
	end

	var_23_0._sequences.MW = var_23_70

	local var_23_71
	local var_23_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_snipe_blackops_truncated")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 263
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 303
		}
	}

	var_23_17:RegisterAnimationSequence("CW", var_23_72)

	local function var_23_73()
		var_23_17:AnimateSequence("CW")
	end

	var_23_0._sequences.CW = var_23_73

	local var_23_74 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_23_25,
		startCap = var_23_25.startCap,
		endCap = var_23_25.endCap,
		sliderArea = var_23_25.sliderArea,
		slider = var_23_25.sliderArea and var_23_25.sliderArea.slider,
		fixedSizeSlider = var_23_25.sliderArea and var_23_25.sliderArea.fixedSizeSlider
	})

	var_23_7:AddScrollbar(var_23_74)
	var_0_14(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("WZOperatorInfoBio", WZOperatorInfoBio)
LockTable(_M)
