module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1 = arg_1_2._currentOperators[arg_1_0._operatorIndex]
	local var_1_2 = OPERATOR.IsUnlocked(arg_1_1, var_1_1.ref)

	arg_1_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(var_1_1.name)
	})

	local var_1_3 = {
		id = "operatorFavorite",
		actionName = Engine.CBBHFCGDIC(var_1_1.favorited and "LUA_MENU/SET_UNFAVORITE" or "LUA_MENU/SET_FAVORITE"),
		actionNameFunction = function()
			return Engine.CBBHFCGDIC(var_1_1.favorited and "LUA_MENU/SET_UNFAVORITE" or "LUA_MENU/SET_FAVORITE")
		end,
		conditionFunction = function()
			return not OPERATOR.IsRandomOperator(arg_1_0._operatorRef) and not OPERATOR.IsRandomFavOperator(arg_1_0._operatorRef)
		end,
		actionFunction = function()
			arg_1_2:SetFavorite({
				controller = arg_1_1
			})
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_3)

	local var_1_4 = {
		id = "operatorBio",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO"),
		conditionFunction = function()
			return OPERATOR.IsOperatorBioAvailable(arg_1_2, arg_1_1)
		end,
		actionFunction = function()
			if Dvar.IBEGCHEFE("TMRRKNKQ") and CONDITIONS.IsWZWipFlowEnabled() then
				OPERATOR.OpenOperatorInformationMenu(arg_1_2, arg_1_1)

				return
			end

			OPERATOR.OpenOperatorBio(arg_1_2, arg_1_1, {
				associates = arg_1_2:GetOperatorAssociates(arg_1_1)
			})
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_4)

	if var_1_2 then
		local var_1_5 = {
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

		arg_1_0:AddContextualMenuAction(var_1_5)
	else
		local var_1_6 = {
			id = "operatorPreview",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_PREVIEW"),
			conditionFunction = function()
				return OPERATOR.IsOperatorSubMenuAvailable(arg_1_2, arg_1_1, "OperatorShowcase")
			end,
			actionFunction = function()
				OPERATOR.OpenOperatorSubMenu(arg_1_2, arg_1_1, {
					subMenuName = "OperatorShowcase"
				})
			end
		}

		arg_1_0:AddContextualMenuAction(var_1_6)
	end

	local var_1_7 = {
		id = "operatorPreview",
		actionName = Engine.CBBHFCGDIC("MENU/VIEW_OPERATOR_BUNDLE"),
		conditionFunction = function()
			local var_11_0 = arg_1_2._isFocusedOperatorUnlocked
			local var_11_1 = CONDITIONS.ShouldShowBundleButton()
			local var_11_2 = arg_1_2.WZOperatorSelectChallengesLayout.BundleUpsellButton._bundleData

			return not var_11_0 and var_11_1 and var_11_2
		end,
		actionFunction = function()
			arg_1_2.WZOperatorSelectChallengesLayout.BundleUpsellButton:processEvent({
				name = "view_bundle"
			})
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_7)

	local var_1_8 = {
		id = "allMissions",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/VIEW_MISSIONS_PROMPT"),
		conditionFunction = function()
			local var_13_0 = arg_1_2._isFocusedOperatorUnlocked
			local var_13_1 = OPERATOR.IsOperatorMissionsAvailable(arg_1_2, arg_1_1)
			local var_13_2 = Engine.CJJAFGIFAC(arg_1_1)

			return var_13_0 and var_13_1 and var_13_2
		end,
		actionFunction = function()
			if Dvar.IBEGCHEFE("TMRRKNKQ") and CONDITIONS.IsWZWipFlowEnabled() then
				OPERATOR.OpenOperatorInformationMenu(arg_1_2, arg_1_1, {
					startTabIndex = OPERATOR.OPERATOR_INFO_TAB_DATA.MISSION.index
				})

				return
			end

			OPERATOR.OpenOperatorMissions(arg_1_2, arg_1_1, arg_1_2._currentEquippedOperator)
		end
	}

	arg_1_0:AddContextualMenuAction(var_1_8)
end

local function var_0_1(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_1)

	local var_15_0 = arg_15_1.ref
	local var_15_1 = OPERATOR.IsRandomOperator(var_15_0)
	local var_15_2 = OPERATOR.IsRandomFavOperator(var_15_0)

	if var_15_1 or var_15_2 then
		arg_15_0.OperatorIcon:setImage(RegisterMaterial(arg_15_1.lootImage))
	else
		local var_15_3 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_15_0, CSV.operators.cols.icon)

		assert(var_15_3)
		arg_15_0.OperatorIcon:setImage(RegisterMaterial(var_15_3))
	end

	arg_15_0:SetSelected(OPERATOR.SetIsOperatorSelected(arg_15_2, {
		operatorInfo = arg_15_1
	}))

	local var_15_4 = false

	if var_15_2 then
		var_15_4 = arg_15_1.isRandomFavoriteAvailable
	else
		var_15_4 = OPERATOR.IsUnlocked(arg_15_2, var_15_0)
	end

	arg_15_0:SetButtonDisabled(not var_15_4)

	if var_15_4 then
		ACTIONS.AnimateSequence(arg_15_0, isSelected and "ButtonUpSelected" or "ButtonUp")
	else
		ACTIONS.AnimateSequence(arg_15_0, isSelected and "ButtonUpSelectedDisabled" or "ButtonUpDisabled")
	end
end

local function var_0_2(arg_16_0, arg_16_1)
	arg_16_0._operatorInfo = arg_16_1
	arg_16_0._factionRef = arg_16_1.factionRef
	arg_16_0._category = arg_16_1.category
	arg_16_0._operatorIndex = arg_16_1.operatorIndex
	arg_16_0._operatorRef = arg_16_1.operatorRef
end

local function var_0_3(arg_17_0, arg_17_1)
	if OPERATOR.IsUnlocked(arg_17_1, arg_17_0._operatorRef) then
		local var_17_0 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_17_0._operatorRef)

		arg_17_0._isOperatorNew = Loot.HDJCADADF(arg_17_1, var_17_0)
		arg_17_0._hasNewLoots = OPERATOR.OperatorHasNewLoots(arg_17_1, arg_17_0._operatorRef)

		local var_17_1 = arg_17_0._isOperatorNew or arg_17_0._hasNewLoots

		arg_17_0.NewItemSmallIcon:UpdateAlpha(var_17_1 and 1 or 0, 0, true)
	else
		arg_17_0.NewItemSmallIcon:UpdateAlpha(0, 0, true)
	end
end

local function var_0_4(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0._operatorInfo = arg_18_2

	local function var_18_0(arg_19_0, arg_19_1)
		ACTIONS.AnimateSequence(arg_19_0, "ButtonOver")
		arg_18_1:OnChildFocused(arg_19_0, arg_18_3)

		local var_19_0 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_18_0._operatorRef)

		arg_18_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_18_3, var_19_0, true)
	end

	local function var_18_1(arg_20_0, arg_20_1)
		ACTIONS.AnimateSequence(arg_20_0, "ButtonOverDisabled")
		arg_18_1:OnChildFocused(arg_20_0, arg_18_3)
	end

	local function var_18_2(arg_21_0, arg_21_1)
		ACTIONS.AnimateSequence(arg_21_0, arg_21_0.isSelected and "ButtonUpSelectedDisabled" or "ButtonUpDisabled")
	end

	local function var_18_3(arg_22_0, arg_22_1)
		ACTIONS.AnimateSequence(arg_22_0, arg_22_0.isSelected and "ButtonUpSelected" or "ButtonUp")
	end

	local function var_18_4(arg_23_0, arg_23_1)
		arg_18_0.NewItemSmallIcon:UpdateAlpha(0, 0, true)
	end

	var_0_1(arg_18_0, arg_18_2, arg_18_3)
	arg_18_0:registerEventHandler("button_over_disable", var_18_1)
	arg_18_0:registerEventHandler("button_disable", var_18_2)
	arg_18_0:registerEventHandler("button_over", var_18_0)
	arg_18_0:registerEventHandler("button_up", var_18_3)
	arg_18_0:registerEventHandler("clear_new", var_18_4)
end

local function var_0_5(arg_24_0, arg_24_1)
	assert(arg_24_0.Selected)

	arg_24_0.isSelected = arg_24_1
	arg_24_0._operatorInfo.isSelected = arg_24_1

	ACTIONS.AnimateSequence(arg_24_0.Selected, arg_24_1 and "On" or "Off")
	ACTIONS.AnimateSequence(arg_24_0, arg_24_1 and "EquippedAndNew" or "NotEquippedAndNew")

	if not arg_24_1 then
		ACTIONS.AnimateSequence(arg_24_0, "ButtonUp")
	end
end

local function var_0_6(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
	local var_25_0 = {
		factionRef = arg_25_4.factionRef,
		category = arg_25_2,
		operatorIndex = arg_25_3,
		operatorRef = arg_25_4.ref
	}
	local var_25_1 = OPERATOR.GetOperatorGameSourceID(arg_25_4.ref)
	local var_25_2 = LUI.GetAnimForGameSource(var_25_1)

	var_0_2(arg_25_0, var_25_0)
	var_0_3(arg_25_0, arg_25_1)
	var_0_4(arg_25_0, arg_25_5, arg_25_4, arg_25_1)
	var_0_0(arg_25_0, arg_25_1, arg_25_5)
	ACTIONS.AnimateSequence(arg_25_0.Favorited, arg_25_4.favorited and "On" or "Off")
	ACTIONS.AnimateSequence(arg_25_0.Favorited, var_25_2)
end

local function var_0_7(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.SetupButton = var_0_6
	arg_26_0.SetupIfNewItem = var_0_3
	arg_26_0.SetupHandlers = var_0_4
	arg_26_0.SetButtonData = var_0_2
	arg_26_0.SetSelected = var_0_5

	ACTIONS.AnimateSequence(arg_26_0.Favorited, "Off")

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_26_0, "WZWipSetup")
	end
end

function WZOperatorSelectButton(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIButton.new()

	var_27_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 110 * _1080p, 0, 134 * _1080p)

	var_27_0.id = "WZOperatorSelectButton"
	var_27_0._animationSets = var_27_0._animationSets or {}
	var_27_0._sequences = var_27_0._sequences or {}

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)

	local var_27_2 = var_27_0

	var_27_0:setUseStencil(true)

	local var_27_3
	local var_27_4 = LUI.UIBlur.new()

	var_27_4.id = "BlurBG"

	var_27_4:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_27_4:SetBlurStrength(2, 0)
	var_27_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_27_0:addElement(var_27_4)

	var_27_0.BlurBG = var_27_4

	local var_27_5
	local var_27_6 = LUI.UIImage.new()

	var_27_6.id = "OperatorIcon"

	var_27_6:SetColorOp(COLOR_OP.saturation, 0)
	var_27_6:SetColorOpParam(1, 0)
	var_27_6:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_27_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -67, _1080p * 67, _1080p * -67, _1080p * 67)
	var_27_0:addElement(var_27_6)

	var_27_0.OperatorIcon = var_27_6

	local var_27_7
	local var_27_8 = LUI.UIImage.new()

	var_27_8.id = "Vignette"

	var_27_8:SetRGBFromInt(0, 0)
	var_27_8:SetAlpha(0, 0)
	var_27_8:SetColorOpParam(1, 0)
	var_27_8:setImage(RegisterMaterial("bkgd_vignette"), 0)
	var_27_8:SetBlendMode(BLEND_MODE.multiply)
	var_27_0:addElement(var_27_8)

	var_27_0.Vignette = var_27_8

	local var_27_9
	local var_27_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_27_1
	})

	var_27_10.id = "Selected"

	var_27_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -29, _1080p * -5, _1080p * 5, _1080p * 29)
	var_27_0:addElement(var_27_10)

	var_27_0.Selected = var_27_10

	local var_27_11
	local var_27_12 = LUI.UIImage.new()

	var_27_12.id = "Lock"

	var_27_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_27_12:SetAlpha(0, 0)
	var_27_12:SetColorOp(COLOR_OP.saturation, 0)
	var_27_12:SetColorOpParam(1, 0)
	var_27_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_27_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -10, _1080p * -30, _1080p * 10, _1080p * 30)
	var_27_0:addElement(var_27_12)

	var_27_0.Lock = var_27_12

	local var_27_13
	local var_27_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_27_1
	})

	var_27_14.id = "NewItemSmallIcon"

	var_27_14:SetAlpha(0, 0)
	var_27_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_27_0:addElement(var_27_14)

	var_27_0.NewItemSmallIcon = var_27_14

	local var_27_15
	local var_27_16 = {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	}
	local var_27_17 = LUI.UIBorder.new(var_27_16)

	var_27_17.id = "Border"

	var_27_17:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_27_17:SetBorderThicknessLeft(_1080p * 3, 0)
	var_27_17:SetBorderThicknessRight(_1080p * 3, 0)
	var_27_17:SetBorderThicknessTop(_1080p * 3, 0)
	var_27_17:SetBorderThicknessBottom(_1080p * 3, 0)
	var_27_17:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, 0)
	var_27_0:addElement(var_27_17)

	var_27_0.Border = var_27_17

	local var_27_18
	local var_27_19 = {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	}
	local var_27_20 = LUI.UIBorder.new(var_27_19)

	var_27_20.id = "BorderInner"

	var_27_20:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_27_20:SetAlpha(0.6, 0)
	var_27_20:SetBorderThicknessLeft(_1080p * 3, 0)
	var_27_20:SetBorderThicknessRight(_1080p * 3, 0)
	var_27_20:SetBorderThicknessTop(_1080p * 3, 0)
	var_27_20:SetBorderThicknessBottom(_1080p * 3, 0)
	var_27_20:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -5)
	var_27_0:addElement(var_27_20)

	var_27_0.BorderInner = var_27_20

	local var_27_21
	local var_27_22 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_27_1
	})

	var_27_22.id = "Favorited"

	var_27_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -1, _1080p * 47, 0, _1080p * 48)
	var_27_0:addElement(var_27_22)

	var_27_0.Favorited = var_27_22

	local var_27_23
	local var_27_24 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_27_25 = LUI.UIBorder.new(var_27_24)

	var_27_25.id = "BorderOff"

	var_27_25:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_27_25:SetAlpha(0.2, 0)
	var_27_0:addElement(var_27_25)

	var_27_0.BorderOff = var_27_25

	local function var_27_26()
		return
	end

	var_27_0._sequences.DefaultSequence = var_27_26

	local var_27_27
	local var_27_28 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonUp", var_27_28)

	local var_27_29 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -67
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 67
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonUp", var_27_29)

	local var_27_30 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonUp", var_27_30)

	local var_27_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_12:RegisterAnimationSequence("ButtonUp", var_27_31)

	local var_27_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_17:RegisterAnimationSequence("ButtonUp", var_27_32)

	local var_27_33 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonUp", var_27_33)

	local var_27_34 = {
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_25:RegisterAnimationSequence("ButtonUp", var_27_34)

	local function var_27_35()
		var_27_4:AnimateSequence("ButtonUp")
		var_27_6:AnimateSequence("ButtonUp")
		var_27_8:AnimateSequence("ButtonUp")
		var_27_12:AnimateSequence("ButtonUp")
		var_27_17:AnimateSequence("ButtonUp")
		var_27_20:AnimateSequence("ButtonUp")
		var_27_25:AnimateSequence("ButtonUp")
	end

	var_27_0._sequences.ButtonUp = var_27_35

	local var_27_36
	local var_27_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_27_14:RegisterAnimationSequence("EquippedAndNew", var_27_37)

	local function var_27_38()
		var_27_14:AnimateSequence("EquippedAndNew")
	end

	var_27_0._sequences.EquippedAndNew = var_27_38

	local var_27_39
	local var_27_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -11
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_27_14:RegisterAnimationSequence("NotEquippedAndNew", var_27_40)

	local function var_27_41()
		var_27_14:AnimateSequence("NotEquippedAndNew")
	end

	var_27_0._sequences.NotEquippedAndNew = var_27_41

	local var_27_42
	local var_27_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_4:RegisterAnimationSequence("WZWipSetup", var_27_43)

	local var_27_44 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		}
	}

	var_27_6:RegisterAnimationSequence("WZWipSetup", var_27_44)

	local var_27_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("WZWipSetup", var_27_45)

	local var_27_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_27_12:RegisterAnimationSequence("WZWipSetup", var_27_46)

	local var_27_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_17:RegisterAnimationSequence("WZWipSetup", var_27_47)

	local var_27_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_20:RegisterAnimationSequence("WZWipSetup", var_27_48)

	local function var_27_49()
		var_27_4:AnimateSequence("WZWipSetup")
		var_27_6:AnimateSequence("WZWipSetup")
		var_27_8:AnimateSequence("WZWipSetup")
		var_27_12:AnimateSequence("WZWipSetup")
		var_27_17:AnimateSequence("WZWipSetup")
		var_27_20:AnimateSequence("WZWipSetup")
	end

	var_27_0._sequences.WZWipSetup = var_27_49

	local var_27_50
	local var_27_51 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonOver", var_27_51)

	local var_27_52 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonOver", var_27_52)

	local var_27_53 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOver", var_27_53)

	local var_27_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_12:RegisterAnimationSequence("ButtonOver", var_27_54)

	local var_27_55 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_17:RegisterAnimationSequence("ButtonOver", var_27_55)

	local var_27_56 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonOver", var_27_56)

	local var_27_57 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_25:RegisterAnimationSequence("ButtonOver", var_27_57)

	local function var_27_58()
		var_27_4:AnimateSequence("ButtonOver")
		var_27_6:AnimateSequence("ButtonOver")
		var_27_8:AnimateSequence("ButtonOver")
		var_27_12:AnimateSequence("ButtonOver")
		var_27_17:AnimateSequence("ButtonOver")
		var_27_20:AnimateSequence("ButtonOver")
		var_27_25:AnimateSequence("ButtonOver")
	end

	var_27_0._sequences.ButtonOver = var_27_58

	local var_27_59
	local var_27_60 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonOverDisabled", var_27_60)

	local var_27_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericPopupFrame
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 9672857,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonOverDisabled", var_27_61)

	local var_27_62 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonOverDisabled", var_27_62)

	local var_27_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 260,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_12:RegisterAnimationSequence("ButtonOverDisabled", var_27_63)

	local var_27_64 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_17:RegisterAnimationSequence("ButtonOverDisabled", var_27_64)

	local var_27_65 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonOverDisabled", var_27_65)

	local var_27_66 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_25:RegisterAnimationSequence("ButtonOverDisabled", var_27_66)

	local function var_27_67()
		var_27_4:AnimateSequence("ButtonOverDisabled")
		var_27_6:AnimateSequence("ButtonOverDisabled")
		var_27_8:AnimateSequence("ButtonOverDisabled")
		var_27_12:AnimateSequence("ButtonOverDisabled")
		var_27_17:AnimateSequence("ButtonOverDisabled")
		var_27_20:AnimateSequence("ButtonOverDisabled")
		var_27_25:AnimateSequence("ButtonOverDisabled")
	end

	var_27_0._sequences.ButtonOverDisabled = var_27_67

	local var_27_68
	local var_27_69 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonUpDisabled", var_27_69)

	local var_27_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericPopupFrame
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonUpDisabled", var_27_70)

	local var_27_71 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonUpDisabled", var_27_71)

	local var_27_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_12:RegisterAnimationSequence("ButtonUpDisabled", var_27_72)

	local var_27_73 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_17:RegisterAnimationSequence("ButtonUpDisabled", var_27_73)

	local var_27_74 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonUpDisabled", var_27_74)

	local var_27_75 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_25:RegisterAnimationSequence("ButtonUpDisabled", var_27_75)

	local function var_27_76()
		var_27_4:AnimateSequence("ButtonUpDisabled")
		var_27_6:AnimateSequence("ButtonUpDisabled")
		var_27_8:AnimateSequence("ButtonUpDisabled")
		var_27_12:AnimateSequence("ButtonUpDisabled")
		var_27_17:AnimateSequence("ButtonUpDisabled")
		var_27_20:AnimateSequence("ButtonUpDisabled")
		var_27_25:AnimateSequence("ButtonUpDisabled")
	end

	var_27_0._sequences.ButtonUpDisabled = var_27_76

	local var_27_77
	local var_27_78 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonUpSelected", var_27_78)

	local var_27_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonUpSelected", var_27_79)

	local var_27_80 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonUpSelected", var_27_80)

	local var_27_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_12:RegisterAnimationSequence("ButtonUpSelected", var_27_81)

	local var_27_82 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_27_17:RegisterAnimationSequence("ButtonUpSelected", var_27_82)

	local var_27_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonUpSelected", var_27_83)

	local var_27_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_25:RegisterAnimationSequence("ButtonUpSelected", var_27_84)

	local function var_27_85()
		var_27_4:AnimateSequence("ButtonUpSelected")
		var_27_6:AnimateSequence("ButtonUpSelected")
		var_27_8:AnimateSequence("ButtonUpSelected")
		var_27_12:AnimateSequence("ButtonUpSelected")
		var_27_17:AnimateSequence("ButtonUpSelected")
		var_27_20:AnimateSequence("ButtonUpSelected")
		var_27_25:AnimateSequence("ButtonUpSelected")
	end

	var_27_0._sequences.ButtonUpSelected = var_27_85

	local var_27_86
	local var_27_87 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_27_4:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_87)

	local var_27_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericPopupFrame
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_27_6:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_88)

	local var_27_89 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_89)

	local var_27_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_12:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_90)

	local var_27_91 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_17:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_91)

	local var_27_92 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		}
	}

	var_27_20:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_92)

	local var_27_93 = {
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_25:RegisterAnimationSequence("ButtonUpSelectedDisabled", var_27_93)

	local function var_27_94()
		var_27_4:AnimateSequence("ButtonUpSelectedDisabled")
		var_27_6:AnimateSequence("ButtonUpSelectedDisabled")
		var_27_8:AnimateSequence("ButtonUpSelectedDisabled")
		var_27_12:AnimateSequence("ButtonUpSelectedDisabled")
		var_27_17:AnimateSequence("ButtonUpSelectedDisabled")
		var_27_20:AnimateSequence("ButtonUpSelectedDisabled")
		var_27_25:AnimateSequence("ButtonUpSelectedDisabled")
	end

	var_27_0._sequences.ButtonUpSelectedDisabled = var_27_94

	var_0_7(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("WZOperatorSelectButton", WZOperatorSelectButton)
LockTable(_M)
