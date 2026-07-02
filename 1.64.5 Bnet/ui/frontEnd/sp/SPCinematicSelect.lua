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

	local var_3_0 = StringTable.BFHCAIIDA(CSV.cinematics.file)

	for iter_3_0 = 0, var_3_0 - 1 do
		local var_3_1 = CSV.ReadRow(CSV.cinematics, iter_3_0)

		if not (SPSharedUtils.GetMissionStateForLevel(var_3_1.unlockLevel, arg_3_1) ~= "complete" and not CONDITIONS.IsDevelopmentBuild(arg_3_0)) then
			table.insert(arg_3_0.CinematicsTable, var_3_1)
		end
	end

	arg_3_0.CinematicsGrid:SetRefreshChild(var_0_0(arg_3_0))
	arg_3_0.CinematicsGrid:SetNumChildren(#arg_3_0.CinematicsTable)
	arg_3_0.CinematicsGrid:RefreshContent()
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.CinematicSelectPreview)
	Engine.BEFHEEBHIA()
	var_0_1(arg_4_0, arg_4_1)

	arg_4_0.CinematicsGrid._showNumbersAndArrowsKBM = true

	arg_4_0.CinematicsGrid:SetWidgetsAlwaysVisible(true)
	arg_4_0.ArrowLeft:SetupArrow(LUI.BEARING.left)
	arg_4_0.ArrowRight:SetupArrow(LUI.BEARING.right)
	arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		Engine.EBCGADABJ()
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_4_0, arg_4_1)
	ACTIONS.ScaleFullscreen(arg_4_0.CinematicSelectPreview)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.FooterBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.TabBacker)
	arg_4_0.CinematicsGrid:processEvent({
		name = "gain_focus"
	})
	arg_4_0.CinematicsGrid:processEvent({
		name = "lose_focus"
	})
end

function SPCinematicSelect(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "SPCinematicSelect"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("CinematicSelectPreview", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "CinematicSelectPreview"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.CinematicSelectPreview = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "FooterBacker"

	var_6_6:SetRGBFromInt(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -195, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.FooterBacker = var_6_6

	local var_6_7
	local var_6_8 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 7,
		wrapY = false,
		arrowsVerticalOffset = 5,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CinematicSelectButton", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
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
	local var_6_9 = LUI.UIGrid.new(var_6_8)

	var_6_9.id = "CinematicsGrid"

	var_6_9:setUseStencil(true)
	var_6_9:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 1770, _1080p * -174, _1080p * -70)
	var_6_0:addElement(var_6_9)

	var_6_0.CinematicsGrid = var_6_9

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "TabBacker"

	var_6_11:SetRGBFromInt(0, 0)
	var_6_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_6_0:addElement(var_6_11)

	var_6_0.TabBacker = var_6_11

	local var_6_12
	local var_6_13 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_6_1
	})

	var_6_13.id = "ArrowRight"

	var_6_13:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_13.Arrow:SetZRotation(-90, 0)
	var_6_13:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -135, _1080p * -103, _1080p * -138, _1080p * -106)
	var_6_0:addElement(var_6_13)

	var_6_0.ArrowRight = var_6_13

	local var_6_14
	local var_6_15 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_6_1
	})

	var_6_15.id = "ArrowLeft"

	var_6_15:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_15.Arrow:SetZRotation(90, 0)
	var_6_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 103, _1080p * 135, _1080p * -138, _1080p * -106)
	var_6_0:addElement(var_6_15)

	var_6_0.ArrowLeft = var_6_15

	local var_6_16
	local var_6_17 = LUI.UIStyledText.new()

	var_6_17.id = "CinematicName"

	var_6_17:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_17:setText("", 0)
	var_6_17:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_17:SetAlignment(LUI.Alignment.Left)
	var_6_17:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 1071, _1080p * -373, _1080p * -313)
	var_6_0:addElement(var_6_17)

	var_6_0.CinematicName = var_6_17

	local var_6_18
	local var_6_19 = LUI.UIStyledText.new()

	var_6_19.id = "CinematicDesc"

	var_6_19:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_19:setText("", 0)
	var_6_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_19:SetAlignment(LUI.Alignment.Left)
	var_6_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 765, _1080p * -304, _1080p * -280)
	var_6_0:addElement(var_6_19)

	var_6_0.CinematicDesc = var_6_19

	local function var_6_20()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_20

	local var_6_21 = {
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

	var_6_17:RegisterAnimationSequence("DetailsFadeIn", var_6_21)

	local var_6_22 = {
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

	var_6_19:RegisterAnimationSequence("DetailsFadeIn", var_6_22)

	local function var_6_23()
		var_6_17:AnimateSequence("DetailsFadeIn")
		var_6_19:AnimateSequence("DetailsFadeIn")
	end

	var_6_0._sequences.DetailsFadeIn = var_6_23

	var_6_9:AddArrow(var_6_15)
	var_6_9:AddArrow(var_6_13)

	function var_6_0.addButtonHelperFunction(arg_11_0, arg_11_1)
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_24 = LUI.UIBindButton.new()

	var_6_24.id = "selfBindButton"

	var_6_0:addElement(var_6_24)

	var_6_0.bindButton = var_6_24

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SPCinematicSelect", SPCinematicSelect)
LockTable(_M)
