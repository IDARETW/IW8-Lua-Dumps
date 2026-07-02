module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 1200
	local var_1_1 = BATTLEPASS.GetNextFreeTier(arg_1_1)

	BATTLEPASS.SetLastFreeTierSeen(arg_1_1, var_1_1)

	local var_1_2 = BATTLEPASS.GetAllTiersData(var_1_1 - 1, var_1_1 + 1)
	local var_1_3 = {}
	local var_1_4 = var_1_1 - 1

	for iter_1_0 = 1, #var_1_2 do
		if tonumber(var_1_2[iter_1_0].level) == var_1_4 then
			var_1_3[#var_1_3 + 1] = var_1_2[iter_1_0]
			var_1_4 = var_1_4 + 1
		end
	end

	local var_1_5 = BATTLEPASS.GetXP(arg_1_1)
	local var_1_6 = BATTLEPASS.GetTierByXP(arg_1_1, var_1_5)
	local var_1_7 = BATTLEPASS.GetTierMinXP(var_1_6)
	local var_1_8 = BATTLEPASS.GetTierMaxXP(var_1_6)
	local var_1_9 = (var_1_5 - var_1_7) / (var_1_8 - var_1_7)

	local function var_1_10(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + 1

		arg_2_0.index = var_2_0
		arg_2_0._column = arg_2_1

		arg_2_0:SetFocusable(false)

		arg_2_0.itemData = var_1_3[var_2_0]

		arg_2_0:SetupLootData(arg_2_0.itemData)
		arg_2_0:SetBattlePassOwned(BATTLEPASS.IsOwned(arg_1_1))

		local var_2_1 = tonumber(arg_2_0.itemData.level)
		local var_2_2 = arg_2_0.itemData.showProgress

		arg_2_0:SetLevel(var_2_1 > 0 and var_2_1 or nil, var_2_2)

		local var_2_3 = arg_2_0.itemData.challengeID and #arg_2_0.itemData.challengeID > 0

		arg_2_0:ShowMission(var_2_3)

		local var_2_4 = arg_2_0.itemData.isFree == "1"

		arg_2_0:SetLocked(true)
		arg_2_0:SetTopBanner(var_2_4, false)

		if var_2_0 == 1 then
			local var_2_5 = arg_2_0.itemData.level ~= "0"

			arg_2_0:SetProgress(var_2_5 and 1 or 0, 0)
			arg_2_0:processEvent({
				name = "lose_active"
			})
		elseif var_2_0 == 2 then
			arg_2_0:SetProgress(var_1_9, var_1_0)
			arg_2_0:processEvent({
				name = "button_over"
			})
		else
			arg_2_0:SetProgress(0, 0)
			arg_2_0:processEvent({
				name = "lose_active"
			})
		end
	end

	arg_1_0.Grid:SetRefreshChild(var_1_10)
	arg_1_0.Grid:SetNumChildren(#var_1_3)
	arg_1_0.Grid:SetMeasureColumnFunction(LUI.ExpanderUtils.GenerateMeasureColumnFunction(150 * _1080p))
	arg_1_0.Grid:RefreshContent()
	assert(arg_1_2.sourceMenu)

	local var_1_11 = arg_1_2.sourceMenu

	if var_1_11 and var_1_11.MPTabsMenu then
		var_1_11:saveState()
		arg_1_0.BattlePassButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			var_1_11.MPTabsMenu:SetupOnRestoreFocusOverride({
				tabToFocus = "BattlePassMenu"
			})
			ACTIONS.LeaveMenu(arg_1_0)
		end)
	else
		arg_1_0.BattlePassButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			ACTIONS.LeaveMenu(arg_1_0)
		end)
	end

	arg_1_0.BattlePassButton:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_1_0.BattlePassButton, "ButtonOverGlint")
		ACTIONS.AnimateSequence(arg_1_0.BattlePassButton, "AnimateGlow")
	end)
	arg_1_0.BattlePassButton:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_1_0.BattlePassButton, "ButtonUpGlint")
		ACTIONS.AnimateSequence(arg_1_0.BattlePassButton, "StopGlow")
	end)
	ACTIONS.AnimateSequence(arg_1_0.BattlePassButton, "Glint")
	ACTIONS.AnimateSequence(arg_1_0.BattlePassButton, "LargerText")
	arg_1_0.LeaveButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Background)
end

function BattlePassFreeTierUpsell(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "BattlePassFreeTierUpsell"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.9, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_8_6.PopupBackground:SetAlpha(0.3, 0)
	var_8_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_8_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_8_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_8_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_8_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_8_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -856, _1080p * 856, _1080p * -278, _1080p * 310)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "LowerGlow"

	var_8_8:SetAlpha(0.5, 0)
	var_8_8.Glow:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1481, _1080p * 1816, _1080p * 224, _1080p * 240)
	var_8_0:addElement(var_8_8)

	var_8_0.LowerGlow = var_8_8

	local var_8_9
	local var_8_10 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_11 = LUI.UIBorder.new(var_8_10)

	var_8_11.id = "LowerLine"

	var_8_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_11:SetBorderThicknessLeft(_1080p * 0, 0)
	var_8_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_8_11:SetBorderThicknessTop(_1080p * 0, 0)
	var_8_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1481, _1080p * 1816, _1080p * 224, _1080p * 232)
	var_8_0:addElement(var_8_11)

	var_8_0.LowerLine = var_8_11

	local var_8_12
	local var_8_13 = LUI.UIImage.new()

	var_8_13.id = "TimerBacker"

	var_8_13:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_8_13:SetAlpha(0.55, 0)
	var_8_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1481, _1080p * 1816, _1080p * 232, _1080p * 170)
	var_8_0:addElement(var_8_13)

	var_8_0.TimerBacker = var_8_13

	local var_8_14
	local var_8_15 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
		controllerIndex = var_8_1
	})

	var_8_15.id = "SeasonResetTimer"

	var_8_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1441, _1080p * 1816, _1080p * 163, _1080p * 243)
	var_8_0:addElement(var_8_15)

	var_8_0.SeasonResetTimer = var_8_15

	local var_8_16
	local var_8_17 = {
		scrollingThresholdX = 4,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BattlePassItem", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 160,
		rowHeight = _1080p * 238,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_18 = LUI.UIGrid.new(var_8_17)

	var_8_18.id = "Grid"

	var_8_18:SetScale(0.5, 0)
	var_8_18:setUseStencil(false)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 154, _1080p * 634, _1080p * -12, _1080p * 226)
	var_8_0:addElement(var_8_18)

	var_8_0.Grid = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "BattlePassButton"

	var_8_20.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIEW_BATTLEPASS"), 0)
	var_8_20.Text:SetAlignment(LUI.Alignment.Center)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -767, _1080p * -281, _1080p * 32, _1080p * 172)
	var_8_0:addElement(var_8_20)

	var_8_0.BattlePassButton = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "LeaveButton"

	var_8_22.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/NO_THANKS"), 0)
	var_8_22.Text:SetAlignment(LUI.Alignment.Center)
	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -767, _1080p * -281, _1080p * 186, _1080p * 226)
	var_8_0:addElement(var_8_22)

	var_8_0.LeaveButton = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIStyledText.new()

	var_8_24.id = "CheckItOut"

	var_8_24:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_8_24:setText(Engine.CBBHFCGDIC("BATTLEPASS/CHECK_IT_OUT"), 0)
	var_8_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_24:SetAlignment(LUI.Alignment.Left)
	var_8_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -304, _1080p * -84, _1080p * -48)
	var_8_0:addElement(var_8_24)

	var_8_0.CheckItOut = var_8_24

	local var_8_25
	local var_8_26 = LUI.UIStyledText.new()

	var_8_26.id = "Message"

	var_8_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_FREE_TIER_UPSELL_MESSAGE"), 0)
	var_8_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_26:SetAlignment(LUI.Alignment.Left)
	var_8_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * 166, _1080p * -137, _1080p * -109)
	var_8_0:addElement(var_8_26)

	var_8_0.Message = var_8_26

	local var_8_27
	local var_8_28 = LUI.UIText.new()

	var_8_28.id = "Title"

	var_8_28:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_8_28:SetAlpha(0.9, 0)
	var_8_28:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_UPDATE")), 0)
	var_8_28:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_8_28:SetWordWrap(false)
	var_8_28:SetAlignment(LUI.Alignment.Left)
	var_8_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -767, _1080p * -395, _1080p * -232, _1080p * -172)
	var_8_0:addElement(var_8_28)

	var_8_0.Title = var_8_28

	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_8_29 = LUI.UIBindButton.new()

	var_8_29.id = "selfBindButton"

	var_8_0:addElement(var_8_29)

	var_8_0.bindButton = var_8_29

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("BattlePassFreeTierUpsell", BattlePassFreeTierUpsell)
LockTable(_M)
