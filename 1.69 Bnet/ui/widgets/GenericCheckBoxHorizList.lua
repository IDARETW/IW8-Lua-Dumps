module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._currData = arg_1_1

	arg_1_0.Grid:SetNumChildren(arg_1_0._currData._numChallenges)
end

local function var_0_1(arg_2_0, arg_2_1)
	var_0_0(arg_2_0, arg_2_1)
	arg_2_0.Grid:RefreshContent()

	if arg_2_0._hideNumCompleted then
		ACTIONS.AnimateSequence(arg_2_0, "HideCount")
	else
		arg_2_0.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_2_1._numComplete, arg_2_1._numChallenges))
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.Grid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_1 + 1
		local var_4_1 = arg_3_0._currData[var_4_0]
		local var_4_2 = var_4_0 <= arg_3_0._currData._numComplete

		ACTIONS.AnimateSequence(arg_4_0, var_4_2 and "CheckInstant" or "UnCheckInstant")
	end)
	arg_3_0:RefreshContentWithData(arg_3_1)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InitSetupWithData = var_0_2
	arg_5_0.RefreshContentWithData = var_0_1

	arg_5_0.Grid:registerEventHandler("gain_focus", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_5_0.Grid:GetNumColumns()
		local var_6_1 = arg_5_0.Grid:GetNumRows()

		if var_6_0 and var_6_1 then
			arg_5_0.Grid:GainFocus(arg_6_1)
		end
	end)
end

function GenericCheckBoxHorizList(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIHorizontalStackedLayout.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 330 * _1080p, 0, 22 * _1080p)

	var_7_0.id = "GenericCheckBoxHorizList"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(10 * _1080p)

	local var_7_3
	local var_7_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 16,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericCheckBox", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 22,
		rowHeight = _1080p * 22,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_5 = LUI.UIGrid.new(var_7_4)

	var_7_5.id = "Grid"

	var_7_5:setUseStencil(true)
	var_7_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 427, 0, _1080p * 22)
	var_7_0:addElement(var_7_5)

	var_7_0.Grid = var_7_5

	local var_7_6
	local var_7_7 = LUI.UIText.new()

	var_7_7.id = "Label"

	var_7_7:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_7_7:setText("#/#", 0)
	var_7_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_7:SetWordWrap(false)
	var_7_7:SetAlignment(LUI.Alignment.Left)
	var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 437, _1080p * 468, _1080p * 2, _1080p * 20)
	var_7_0:addElement(var_7_7)

	var_7_0.Label = var_7_7

	local function var_7_8()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_8

	local var_7_9
	local var_7_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_7:RegisterAnimationSequence("HideCount", var_7_10)

	local function var_7_11()
		var_7_7:AnimateSequence("HideCount")
	end

	var_7_0._sequences.HideCount = var_7_11

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GenericCheckBoxHorizList", GenericCheckBoxHorizList)
LockTable(_M)
