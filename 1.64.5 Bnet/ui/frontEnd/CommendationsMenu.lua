module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0.CommendationGrid)

	arg_1_0.CommendationGrid.default = false

	local var_1_0 = #arg_1_0._dataPackage

	arg_1_0.CommendationGrid:SetNumChildren(var_1_0)

	if CONDITIONS.IsShowingUnachievedAccolades() or var_1_0 > 0 then
		arg_1_0.CommendationGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
			local var_2_0 = arg_1_0.CommendationGrid:GetContentIndex(arg_2_1, arg_2_2, {
				relativePosition = false
			})
			local var_2_1 = arg_1_0._dataPackage[var_2_0 + 1]

			if var_2_1 then
				arg_2_0:SetupAccoladeData(var_2_1, {
					isBarrack = true
				})
				arg_2_0:addEventHandler("gain_focus", function()
					arg_1_0.Details:SetupAccoladeDetails(var_2_1)
				end)
			end
		end)
		arg_1_0.CommendationGrid:RefreshContent()
	else
		ACTIONS.AnimateSequence(arg_1_0, "NoCommendation")
	end
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.MenuTitle)
	arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/COMMENDATIONS"))

	arg_4_0._dataPackage = AAR.GetAccoladesPackage(arg_4_1, true)

	var_0_0(arg_4_0)
end

function CommendationsMenu(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0.id = "CommendationsMenu"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "MenuTitle"

	var_5_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/COMMENDATIONS"), 0)
	var_5_4.Line:SetLeft(0, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.MenuTitle = var_5_4

	local var_5_5
	local var_5_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AARCommendationUnit", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 225,
		rowHeight = _1080p * 225,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_7 = LUI.UIGrid.new(var_5_6)

	var_5_7.id = "CommendationGrid"

	var_5_7:setUseStencil(true)
	var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1295, _1080p * 200, _1080p * 905)
	var_5_0:addElement(var_5_7)

	var_5_0.CommendationGrid = var_5_7

	local var_5_8
	local var_5_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_5_1
	})

	var_5_9.id = "VerticalMinimalScrollbar"

	var_5_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1295, _1080p * 1311, _1080p * 200, _1080p * 895)
	var_5_0:addElement(var_5_9)

	var_5_0.VerticalMinimalScrollbar = var_5_9

	local var_5_10
	local var_5_11 = MenuBuilder.BuildRegisteredType("AARCommendationsDetails", {
		controllerIndex = var_5_1
	})

	var_5_11.id = "Details"

	var_5_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 200, _1080p * 768)
	var_5_0:addElement(var_5_11)

	var_5_0.Details = var_5_11

	local var_5_12
	local var_5_13 = LUI.UIText.new()

	var_5_13.id = "NoCommendationLabel"

	var_5_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_5_13:SetAlpha(0, 0)
	var_5_13:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_COMMENDATION"), 0)
	var_5_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_13:SetAlignment(LUI.Alignment.Center)
	var_5_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * 460, _1080p * -16, _1080p * 16)
	var_5_0:addElement(var_5_13)

	var_5_0.NoCommendationLabel = var_5_13

	local function var_5_14()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_14

	local var_5_15
	local var_5_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_7:RegisterAnimationSequence("NoCommendation", var_5_16)

	local var_5_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_9:RegisterAnimationSequence("NoCommendation", var_5_17)

	local var_5_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_11:RegisterAnimationSequence("NoCommendation", var_5_18)

	local var_5_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_13:RegisterAnimationSequence("NoCommendation", var_5_19)

	local function var_5_20()
		var_5_7:AnimateSequence("NoCommendation")
		var_5_9:AnimateSequence("NoCommendation")
		var_5_11:AnimateSequence("NoCommendation")
		var_5_13:AnimateSequence("NoCommendation")
	end

	var_5_0._sequences.NoCommendation = var_5_20

	local var_5_21 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_5_9,
		startCap = var_5_9.startCap,
		endCap = var_5_9.endCap,
		sliderArea = var_5_9.sliderArea,
		slider = var_5_9.sliderArea and var_5_9.sliderArea.slider,
		fixedSizeSlider = var_5_9.sliderArea and var_5_9.sliderArea.fixedSizeSlider
	})

	var_5_7:AddScrollbar(var_5_21)
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_5_22 = LUI.UIBindButton.new()

	var_5_22.id = "selfBindButton"

	var_5_0:addElement(var_5_22)

	var_5_0.bindButton = var_5_22

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CommendationsMenu", CommendationsMenu)
LockTable(_M)
