module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = 1 + arg_1_0.CinematicsGrid:GetContentIndex(arg_2_1, arg_2_2)
		local var_2_1 = arg_1_0.CinematicsTable[var_2_0]

		arg_2_0:RefreshButton(arg_1_0, var_2_1)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.CinematicsTable = {}

	local var_3_0 = StringTable.BFHCAIIDA(CSV.cpCinematics.file)

	for iter_3_0 = 0, var_3_0 - 1 do
		local var_3_1 = CSV.ReadRow(CSV.cpCinematics, iter_3_0)

		if not (CP.HasSeenCinematic(arg_3_1, var_3_1.ref) ~= 1) then
			table.insert(arg_3_0.CinematicsTable, var_3_1)
		end
	end

	arg_3_0.CinematicsGrid:SetRefreshChild(var_0_0(arg_3_0))
	arg_3_0.CinematicsGrid:SetNumChildren(#arg_3_0.CinematicsTable)
	arg_3_0.CinematicsGrid:RefreshContent()
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.CinematicSelectPreview)
	assert(arg_4_0.MenuTitle)
	arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/CINEMATICS"))

	local var_4_0 = arg_4_2 and arg_4_2.controllerIndex

	if not var_4_0 and not Engine.DDJFBBJAIG() then
		var_4_0 = arg_4_0:getRootController()
	end

	assert(var_4_0)

	arg_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_0
	})
	arg_4_0.HelperBar.id = "HelperBar"

	arg_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	arg_4_0.HelperBar:setPriority(10)
	arg_4_0:addElement(arg_4_0.HelperBar)

	local var_4_1 = arg_4_0

	arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN")
	})
	arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_4_2 = LUI.UIBindButton.new()

	var_4_2.id = "selfBindButton"

	arg_4_0:addElement(var_4_2)

	arg_4_0.bindButton = var_4_2

	arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_4_0
		end

		CP.PlayFrontendMusic()
		ACTIONS.LeaveMenu(arg_4_0)
	end)
	Engine.BEFHEEBHIA()
	var_0_1(arg_4_0, var_4_0)

	arg_4_0.CinematicsGrid._showNumbersAndArrowsKBM = true

	arg_4_0.CinematicsGrid:SetWidgetsAlwaysVisible(true)
	arg_4_0.ArrowLeft:SetupArrow(LUI.BEARING.left)
	arg_4_0.ArrowRight:SetupArrow(LUI.BEARING.right)

	local function var_4_3(arg_6_0, arg_6_1)
		Engine.EBCGADABJ()
	end

	arg_4_0.bindButton:addEventHandler("button_secondary", var_4_3)
	arg_4_0.bindButton:addEventHandler("menu_close", var_4_3)
	arg_4_0.bindButton:addEventHandler("menu_close_all", var_4_3)
	arg_4_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	LAYOUT.AddAspectRatioFadeFrame(arg_4_0, var_4_0)
	ACTIONS.ScaleFullscreen(arg_4_0.CinematicSelectPreview)
	ACTIONS.ScaleFullscreen(arg_4_0.BlackBacking)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.FooterBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.TabBacker)
end

function CPCinematicSelect(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "CPCinematicSelect"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "BlackBacking"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 1920, 0, _1080p * 1176)
	var_7_0:addElement(var_7_4)

	var_7_0.BlackBacking = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("CPCinematicSelectPreview", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "CinematicSelectPreview"

	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.CinematicSelectPreview = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "FooterBacker"

	var_7_8:SetRGBFromInt(0, 0)
	var_7_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -195, 0)
	var_7_0:addElement(var_7_8)

	var_7_0.FooterBacker = var_7_8

	local var_7_9
	local var_7_10 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 6,
		wrapY = false,
		arrowsVerticalOffset = 5,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CPCinematicSelectButton", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 25,
		spacingY = _1080p * 25,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 105,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom
	}
	local var_7_11 = LUI.UIGrid.new(var_7_10)

	var_7_11.id = "CinematicsGrid"

	var_7_11:setUseStencil(true)
	var_7_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 1770, _1080p * -174, _1080p * -70)
	var_7_0:addElement(var_7_11)

	var_7_0.CinematicsGrid = var_7_11

	local var_7_12
	local var_7_13 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_7_1
	})

	var_7_13.id = "TabBacker"

	var_7_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_7_0:addElement(var_7_13)

	var_7_0.TabBacker = var_7_13

	local var_7_14
	local var_7_15 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_7_1
	})

	var_7_15.id = "ArrowRight"

	var_7_15:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_7_15.Arrow:SetZRotation(-90, 0)
	var_7_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -135, _1080p * -103, _1080p * -138, _1080p * -106)
	var_7_0:addElement(var_7_15)

	var_7_0.ArrowRight = var_7_15

	local var_7_16
	local var_7_17 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_7_1
	})

	var_7_17.id = "ArrowLeft"

	var_7_17:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_7_17.Arrow:SetZRotation(90, 0)
	var_7_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 103, _1080p * 135, _1080p * -138, _1080p * -106)
	var_7_0:addElement(var_7_17)

	var_7_0.ArrowLeft = var_7_17

	local var_7_18
	local var_7_19 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_19.id = "MenuTitle"

	var_7_19.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/CINEMATICS"), 0)
	var_7_19.Line:SetLeft(0, 0)
	var_7_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_7_0:addElement(var_7_19)

	var_7_0.MenuTitle = var_7_19

	local var_7_20
	local var_7_21 = LUI.UIStyledText.new()

	var_7_21.id = "CinematicName"

	var_7_21:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_21:setText("", 0)
	var_7_21:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_21:SetAlignment(LUI.Alignment.Left)
	var_7_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 1071, _1080p * -373, _1080p * -313)
	var_7_0:addElement(var_7_21)

	var_7_0.CinematicName = var_7_21

	local var_7_22
	local var_7_23 = LUI.UIStyledText.new()

	var_7_23.id = "CinematicDesc"

	var_7_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_23:setText("", 0)
	var_7_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_23:SetAlignment(LUI.Alignment.Left)
	var_7_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_23:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 765, _1080p * -304, _1080p * -280)
	var_7_0:addElement(var_7_23)

	var_7_0.CinematicDesc = var_7_23

	local function var_7_24()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_24

	local var_7_25
	local var_7_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_21:RegisterAnimationSequence("DetailsFadeIn", var_7_26)

	local var_7_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_23:RegisterAnimationSequence("DetailsFadeIn", var_7_27)

	local function var_7_28()
		var_7_21:AnimateSequence("DetailsFadeIn")
		var_7_23:AnimateSequence("DetailsFadeIn")
	end

	var_7_0._sequences.DetailsFadeIn = var_7_28

	var_7_11:AddArrow(var_7_17)
	var_7_11:AddArrow(var_7_15)
	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("CPCinematicSelect", CPCinematicSelect)
LockTable(_M)
