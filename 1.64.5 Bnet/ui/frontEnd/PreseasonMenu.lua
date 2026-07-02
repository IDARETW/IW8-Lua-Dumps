module(..., package.seeall)

local var_0_0 = {
	{
		itemImage = "s4_ui_upsell_tab_preseason_01",
		itemTitle = "LUA_MENU/PRESEASON_FEATURE_1"
	},
	{
		itemImage = "s4_ui_upsell_tab_preseason_02",
		itemTitle = "LUA_MENU/PRESEASON_FEATURE_2"
	},
	{
		itemImage = "s4_ui_upsell_tab_preseason_03",
		itemTitle = "LUA_MENU/PRESEASON_FEATURE_3"
	}
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1 + 1

	return var_0_0[var_1_0]
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.NewFeatureItemsGrid

	assert(var_2_0)

	local var_2_1 = arg_2_1.columns or 1
	local var_2_2 = arg_2_1.rows or 1

	var_2_0:SetNumChildren(var_2_2 * var_2_1)
	var_2_0:SetNumColumns(var_2_1)
	var_2_0:SetNumRows(var_2_2)
	var_2_0:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = var_0_1(arg_2_0, arg_3_1, arg_3_2)

		if var_3_0 then
			arg_3_0.columnIdx = arg_3_1
			arg_3_0.rowIdx = arg_3_2

			arg_3_0:UpdateData(var_3_0)
		end
	end)
	var_2_0:RefreshContent()
end

local function var_0_3(arg_4_0, arg_4_1)
	LUI.FlowManager.RequestPopupMenu(arg_4_0, "VGPreOrderPopup", true, controllerIndex, false, {})
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1

	var_0_2(arg_5_0, {
		rows = 1,
		columns = 3
	})
	arg_5_0.BuyNowButton:addEventHandler("button_action", var_0_3)

	local var_5_0 = LUI.UIBindButton.new()

	var_5_0.id = "buyNowBindButton"

	arg_5_0:addElement(var_5_0)

	arg_5_0._buyNowBindButton = var_5_0

	arg_5_0._buyNowBindButton:addEventHandler("button_alt1", var_0_3)
end

function PreseasonMenu(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIHorizontalNavigator.new()

	var_6_0.id = "PreseasonMenu"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.soundSet = "mpMainMenu"
	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Separator"

	var_6_4:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 473, _1080p * 1495, _1080p * 813, _1080p * 815)
	var_6_0:addElement(var_6_4)

	var_6_0.Separator = var_6_4

	local var_6_5
	local var_6_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PreseasonNewFeatureItem", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		spacingX = _1080p * 25,
		spacingY = _1080p * 25,
		columnWidth = _1080p * 324,
		rowHeight = _1080p * 465,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_7 = LUI.UIGrid.new(var_6_6)

	var_6_7.id = "NewFeatureItemsGrid"

	var_6_7:setUseStencil(true)
	var_6_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 472, _1080p * 1494, _1080p * 244, _1080p * 711)
	var_6_0:addElement(var_6_7)

	var_6_0.NewFeatureItemsGrid = var_6_7

	local var_6_8
	local var_6_9 = LUI.UIStyledText.new()

	var_6_9.id = "NextSeasonTitle"

	var_6_9:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_9:SetAlpha(0.9, 0)
	var_6_9:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESEASON_ANNOUNCE"), 0)
	var_6_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_9:setTextStyle(CoD.TextStyle.Shadowed)
	var_6_9:SetWordWrap(false)
	var_6_9:SetAlignment(LUI.Alignment.Left)
	var_6_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_9:SetStartupDelay(1000)
	var_6_9:SetLineHoldTime(400)
	var_6_9:SetAnimMoveTime(1500)
	var_6_9:SetAnimMoveSpeed(1500)
	var_6_9:SetEndDelay(1000)
	var_6_9:SetCrossfadeTime(400)
	var_6_9:SetFadeInTime(300)
	var_6_9:SetFadeOutTime(300)
	var_6_9:SetMaxVisibleLines(1)
	var_6_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 473, _1080p * 1494, _1080p * 202, _1080p * 252)
	var_6_0:addElement(var_6_9)

	var_6_0.NextSeasonTitle = var_6_9

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "SnipeLogo"

	var_6_11:setImage(RegisterMaterial("s4_ui_upsell_pv_neg_vgbranding"), 0)
	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 465, _1080p * 640, _1080p * 839, _1080p * 927)
	var_6_0:addElement(var_6_11)

	var_6_0.SnipeLogo = var_6_11

	local var_6_12
	local var_6_13 = LUI.UIStyledText.new()

	var_6_13.id = "PreseasonTitle"

	var_6_13:SetRGBFromTable(SWATCHES.splashNotifications.highlight, 0)
	var_6_13:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESEASON_BUY_TITLE")), 0)
	var_6_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_13:setTextStyle(CoD.TextStyle.Shadowed)
	var_6_13:SetWordWrap(false)
	var_6_13:SetAlignment(LUI.Alignment.Left)
	var_6_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_13:SetStartupDelay(1000)
	var_6_13:SetLineHoldTime(400)
	var_6_13:SetAnimMoveTime(1500)
	var_6_13:SetAnimMoveSpeed(1500)
	var_6_13:SetEndDelay(1000)
	var_6_13:SetCrossfadeTime(400)
	var_6_13:SetFadeInTime(300)
	var_6_13:SetFadeOutTime(300)
	var_6_13:SetMaxVisibleLines(1)
	var_6_13:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 657, _1080p * 1152, _1080p * 319, _1080p * 343)
	var_6_0:addElement(var_6_13)

	var_6_0.PreseasonTitle = var_6_13

	local var_6_14
	local var_6_15 = LUI.UIStyledText.new()

	var_6_15.id = "PreseasonDesc"

	var_6_15:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_15:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESEASON_BUY_DESC"), 0)
	var_6_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_15:setTextStyle(CoD.TextStyle.Shadowed)
	var_6_15:SetAlignment(LUI.Alignment.Left)
	var_6_15:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_6_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_15:SetStartupDelay(1000)
	var_6_15:SetLineHoldTime(400)
	var_6_15:SetAnimMoveTime(1500)
	var_6_15:SetAnimMoveSpeed(1500)
	var_6_15:SetEndDelay(1000)
	var_6_15:SetCrossfadeTime(400)
	var_6_15:SetFadeInTime(300)
	var_6_15:SetFadeOutTime(300)
	var_6_15:SetMaxVisibleLines(1)
	var_6_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 657, _1080p * 1152, _1080p * 348, _1080p * 368)
	var_6_0:addElement(var_6_15)

	var_6_0.PreseasonDesc = var_6_15

	local var_6_16
	local var_6_17 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_6_1
	})

	var_6_17.id = "BuyNowButton"

	var_6_17.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"), 0)
	var_6_17.Text:SetAlignment(LUI.Alignment.Center)
	var_6_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1172, _1080p * 1495, _1080p * 866, _1080p * 910)
	var_6_0:addElement(var_6_17)

	var_6_0.BuyNowButton = var_6_17

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_6_18 = LUI.UIBindButton.new()

	var_6_18.id = "selfBindButton"

	var_6_0:addElement(var_6_18)

	var_6_0.bindButton = var_6_18

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PreseasonMenu", PreseasonMenu)
LockTable(_M)
