module(..., package.seeall)

local var_0_0 = 3
local var_0_1 = 74
local var_0_2 = 146

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2._currentOperators[arg_1_0._factionRef][arg_1_0._operatorIndex]
	local var_1_1 = OPERATOR.IsUnlocked(arg_1_1, var_1_0.ref)

	arg_1_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(var_1_0.name)
	})

	local var_1_2 = {
		id = "operatorBio",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO"),
		conditionFunction = function()
			return OPERATOR.IsOperatorBioAvailable(arg_1_2, arg_1_1)
		end,
		actionFunction = function()
			OPERATOR.OpenOperatorBio(arg_1_2, arg_1_1)
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_2)

	if var_1_1 then
		local var_1_3 = {
			id = "operatorEditSkin",
			actionName = Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN_KBM"),
			conditionFunction = function()
				return OPERATOR.IsOperatorSubMenuAvailable(arg_1_2, arg_1_1, "OperatorCustomization")
			end,
			actionFunction = function()
				OPERATOR.OpenOperatorSubMenu(arg_1_2, arg_1_1, {
					subMenuName = "OperatorCustomization"
				})
			end
		}

		arg_1_0:AddContextualMenuAction(var_1_3)
	else
		local var_1_4 = {
			id = "operatorPreview",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_PREVIEW"),
			conditionFunction = function()
				return OPERATOR.IsOperatorPreviewAvailable(arg_1_2, arg_1_1, "OperatorShowcase")
			end,
			actionFunction = function()
				OPERATOR.OpenOperatorSubMenu(arg_1_2, arg_1_1, {
					subMenuName = "OperatorShowcase"
				})
			end
		}

		arg_1_0:AddContextualMenuAction(var_1_4)
	end

	local var_1_5 = {
		id = "operatorPreview",
		actionName = Engine.CBBHFCGDIC("MENU/VIEW_OPERATOR_BUNDLE"),
		conditionFunction = function()
			local var_8_0 = arg_1_2._isFocusedOperatorUnlocked
			local var_8_1 = Dvar.IBEGCHEFE("NLTNQNSMQK")
			local var_8_2 = arg_1_2.OperatorSelectChallengesLayout.BundleUpsellButton._bundleData

			return not var_8_0 and var_8_1 and var_8_2
		end,
		actionFunction = function()
			arg_1_2.OperatorSelectChallengesLayout.BundleUpsellButton:processEvent({
				name = "view_bundle"
			})
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_5)

	local var_1_6 = {
		id = "allMissions",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/VIEW_MISSIONS_PROMPT"),
		conditionFunction = function()
			local var_10_0 = arg_1_2._isFocusedOperatorUnlocked
			local var_10_1 = OPERATOR.IsOperatorMissionsAvailable(arg_1_2, arg_1_1)
			local var_10_2 = Engine.CJJAFGIFAC(arg_1_1)

			return var_10_0 and var_10_1 and var_10_2
		end,
		actionFunction = function()
			OPERATOR.OpenOperatorMissions(arg_1_2, arg_1_1, arg_1_2._currentEquippedOperator)
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_6)
end

local function var_0_4(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5)
	if arg_12_2 == OPERATOR.RANDOM_FACTION then
		arg_12_0.FactionName:setText(Engine.CBBHFCGDIC("LUA_MENU/RANDOM"))
	else
		local var_12_0 = StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, arg_12_2, CSV.FactionTable.cols.name)

		arg_12_0.FactionName:setText(Engine.CBBHFCGDIC(var_12_0))
	end

	arg_12_0._menu = arg_12_5
	arg_12_0._factionIndex = arg_12_3

	arg_12_0.OperatorSelectButtonList:RemoveAllButtonsFromList()

	local var_12_1 = 0

	for iter_12_0 = 1, #arg_12_4 do
		local var_12_2 = arg_12_0.OperatorSelectButtonList:AddButtonToList(arg_12_1)

		var_12_2:SetButtonData({
			factionRef = arg_12_2,
			factionIndex = arg_12_3,
			operatorIndex = iter_12_0,
			operatorRef = arg_12_4[iter_12_0].ref
		})
		var_12_2:SetupIfNewItem(arg_12_1)
		var_12_2:SetupHandlers(arg_12_5, arg_12_4[iter_12_0], arg_12_1)
		var_0_3(var_12_2, arg_12_1, arg_12_5)

		if OPERATOR.IsUnlocked(arg_12_1, arg_12_4[iter_12_0].ref) then
			var_12_1 = var_12_1 + 1
		end
	end

	local var_12_3 = var_0_1 * _1080p
	local var_12_4 = (#arg_12_4 - 1) * (var_0_0 * _1080p)
	local var_12_5 = #arg_12_4 * var_12_3 + var_12_4

	arg_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_12_5, 0, var_0_2 * _1080p)

	if #arg_12_4 > 1 then
		arg_12_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_12_1, #arg_12_4))
		arg_12_0.ItemsCollected:SetAlpha(1)
	else
		arg_12_0.ItemsCollected:SetAlpha(0)
	end
end

local function var_0_5(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_0.OperatorSelectButtonList)
	assert(arg_13_0.FactionName)

	arg_13_0.SetupButtonContainer = var_0_4

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_13_0, "AR")
	end

	local function var_13_0(arg_14_0, arg_14_1)
		local var_14_0 = arg_13_0._menu

		if not var_14_0 then
			return
		end

		local var_14_1 = LUI.FlowManager.GetScopedData(arg_13_0)

		if var_14_1.operatorData.useEquippedOperatorFocusIndex then
			var_14_1.operatorData.useEquippedOperatorFocusIndex = false

			local var_14_2, var_14_3 = var_14_0:GetEquippedOperatorFocusIndex(arg_13_1)

			return var_14_3
		end

		local var_14_4 = var_14_0:GetFocusedFactionListPosition()
		local var_14_5 = var_14_0:GetFactionPositionFromIndex(arg_13_0._factionIndex - 1)
		local var_14_6 = var_14_0:GetFocusedOperatorIndex()

		if var_14_1.operatorData.useSelectedOperatorIndexForFocus then
			var_14_1.operatorData.useSelectedOperatorIndexForFocus = false

			return var_14_6
		end

		if var_14_4.y > var_14_5.y then
			return var_14_6
		elseif var_14_4.y < var_14_5.y then
			return var_14_6
		elseif var_14_4.x == var_14_0:GetNumFactionColumns() - 1 and var_14_5.x == 0 then
			return 1
		elseif var_14_4.x == 0 and var_14_5.x == var_14_0:GetNumFactionColumns() - 1 then
			return #arg_13_0.OperatorSelectButtonList:GetOperatorButtons()
		elseif var_14_4.x < var_14_5.x then
			return 1
		elseif var_14_4.x > var_14_5.x then
			return #arg_13_0.OperatorSelectButtonList:GetOperatorButtons()
		end
	end

	arg_13_0.OperatorSelectButtonList:SetForceDefaultFocus(true)
	arg_13_0.OperatorSelectButtonList:SetDefaultFocus(var_13_0)
	arg_13_0:SetGridChildDynamicSize(true, LUI.DIRECTION.horizontal)
end

function OperatorSelectButtonContainer(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 234 * _1080p, 0, 146 * _1080p)

	var_15_0.id = "OperatorSelectButtonContainer"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("OperatorSelectButtonList", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "OperatorSelectButtonList"

	var_15_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 234, 0, _1080p * 146)
	var_15_0:addElement(var_15_4)

	var_15_0.OperatorSelectButtonList = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "Line"

	var_15_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_6:SetAlpha(0.6, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -9, _1080p * -8)
	var_15_0:addElement(var_15_6)

	var_15_0.Line = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIStyledText.new()

	var_15_8.id = "FactionName"

	var_15_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_8:setText("", 0)
	var_15_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_15_8:SetWordWrap(false)
	var_15_8:SetAlignment(LUI.Alignment.Left)
	var_15_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_8:SetStartupDelay(2000)
	var_15_8:SetLineHoldTime(400)
	var_15_8:SetAnimMoveTime(1000)
	var_15_8:SetAnimMoveSpeed(150)
	var_15_8:SetEndDelay(2000)
	var_15_8:SetCrossfadeTime(1000)
	var_15_8:SetFadeInTime(300)
	var_15_8:SetFadeOutTime(300)
	var_15_8:SetMaxVisibleLines(1)
	var_15_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -33, _1080p * -11)
	var_15_0:addElement(var_15_8)

	var_15_0.FactionName = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIStyledText.new()

	var_15_10.id = "ItemsCollected"

	var_15_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_10:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_15_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_15_10:SetAlignment(LUI.Alignment.Right)
	var_15_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -54, 0, _1080p * -33, _1080p * -11)
	var_15_0:addElement(var_15_10)

	var_15_0.ItemsCollected = var_15_10

	local function var_15_11()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_11

	local var_15_12
	local var_15_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		}
	}

	var_15_8:RegisterAnimationSequence("AR", var_15_13)

	local var_15_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -203
		}
	}

	var_15_10:RegisterAnimationSequence("AR", var_15_14)

	local function var_15_15()
		var_15_8:AnimateSequence("AR")
		var_15_10:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_15

	var_0_5(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("OperatorSelectButtonContainer", OperatorSelectButtonContainer)
LockTable(_M)
