module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._controllerIndex = arg_1_1

	local var_1_0 = arg_1_2.items

	assert(#var_1_0 > 0, "This popup is not made to work with no items in it.")

	local function var_1_1(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.Grid:GetContentIndex(arg_2_1, arg_2_2)

		arg_2_0:SetupButtonData(var_1_0[var_2_0 + 1])
	end

	arg_1_0.Grid:SetRefreshChild(var_1_1)
	arg_1_0.Grid:SetNumChildren(#var_1_0)
	arg_1_0.Grid:RefreshContent()
	arg_1_0.GoToStore:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		Lobby.AttemptOpenBRMenu(arg_1_1, {
			useStandaloneStore = true,
			activeTabIndex = TAB.GetIndex(TAB.MP.STORE)
		})
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true)
	end)
	arg_1_0.ContinueButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true)
	end)
	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_1_0.ContinueButton:StartTimer()
	ACTIONS.ScaleFullscreen(arg_1_0, Background)
end

function BundlePurchaseUpsellPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "BundlePurchaseUpsellPopup"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.9, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -810, _1080p * 810, _1080p * -287, _1080p * 323)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BundleButton", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 540,
		rowHeight = _1080p * 350,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_5_9 = LUI.UIGrid.new(var_5_8)

	var_5_9.id = "Grid"

	var_5_9:setUseStencil(true)
	var_5_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -810, _1080p * 810, _1080p * -175, _1080p * 175)
	var_5_0:addElement(var_5_9)

	var_5_0.Grid = var_5_9

	local var_5_10
	local var_5_11 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_5_1
	})

	var_5_11.id = "ContinueButton"

	var_5_11.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_5_11.Text:SetAlignment(LUI.Alignment.Center)
	var_5_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 211, _1080p * 249)
	var_5_0:addElement(var_5_11)

	var_5_0.ContinueButton = var_5_11

	local var_5_12
	local var_5_13 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_5_1
	})

	var_5_13.id = "GoToStore"

	var_5_13.GenericProgressBar.DialogueBackground:SetAlpha(0, 0)
	var_5_13.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE"), 0)
	var_5_13.Text:SetAlignment(LUI.Alignment.Center)
	var_5_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 256, _1080p * 294)
	var_5_0:addElement(var_5_13)

	var_5_0.GoToStore = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIStyledText.new()

	var_5_15.id = "Title"

	var_5_15:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_15:setText(Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_PURCHASE_UPSELL_TITLE"), 0)
	var_5_15:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_15:SetWordWrap(false)
	var_5_15:SetAlignment(LUI.Alignment.Center)
	var_5_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_15:SetStartupDelay(1000)
	var_5_15:SetLineHoldTime(400)
	var_5_15:SetAnimMoveTime(1000)
	var_5_15:SetAnimMoveSpeed(150)
	var_5_15:SetEndDelay(1000)
	var_5_15:SetCrossfadeTime(1000)
	var_5_15:SetFadeInTime(300)
	var_5_15:SetFadeOutTime(300)
	var_5_15:SetMaxVisibleLines(1)
	var_5_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -810, _1080p * 810, _1080p * -260, _1080p * -200)
	var_5_0:addElement(var_5_15)

	var_5_0.Title = var_5_15

	local var_5_16
	local var_5_17 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_17.id = "ButtonHelperBar"

	var_5_17.Background:SetAlpha(0, 0)
	var_5_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 863, _1080p * 923)
	var_5_0:addElement(var_5_17)

	var_5_0.ButtonHelperBar = var_5_17

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BundlePurchaseUpsellPopup", BundlePurchaseUpsellPopup)
LockTable(_M)
