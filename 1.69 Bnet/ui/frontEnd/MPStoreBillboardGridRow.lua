module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 == LUI.GAME_SOURCE_ID.MODERN_WARFARE or arg_1_1 == LUI.GAME_SOURCE_ID.COLD_WAR or arg_1_1 == LUI.GAME_SOURCE_ID.VANGUARD then
		ACTIONS.AnimateSequence(arg_1_0, "ShowWZSnipeBar")

		if arg_1_0.SnipeIcon ~= nil then
			arg_1_0.SnipeIcon:UpdateSnipeIcon({
				selected = true,
				gameSourceID = arg_1_1
			})
		end

		ACTIONS.AnimateSequence(arg_1_0, LUI.GetAnimForGameSource(arg_1_1))
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideWZSnipeBar")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.RowGrid:SetNumRows(1)
	arg_2_0.RowGrid:SetNumColumns(0)

	arg_2_0.UpdateWZSnipeBar = var_0_0

	if CONDITIONS.IsLazeOrOutrun() then
		arg_2_0.SnipeIcon:UpdateSnipeIcon({
			selected = false,
			gameSourceID = LUI.GAME_SOURCE_ID.MODERN_WARFARE
		})
	end
end

function MPStoreBillboardGridRow(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1680 * _1080p, 0, 190 * _1080p)

	var_3_0.id = "MPStoreBillboardGridRow"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "SnipeBackgroundColor"

	var_3_4:SetAlpha(0.05, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -40, 0, _1080p * 31)
	var_3_0:addElement(var_3_4)

	var_3_0.SnipeBackgroundColor = var_3_4

	local var_3_5
	local var_3_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MPStoreBillboardButton", {
				controllerIndex = var_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 320,
		rowHeight = _1080p * 120,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_7 = LUI.UIGrid.new(var_3_6)

	var_3_7.id = "RowGrid"

	var_3_7:setUseStencil(true)
	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1680, _1080p * 40, _1080p * 190)
	var_3_0:addElement(var_3_7)

	var_3_0.RowGrid = var_3_7

	local var_3_8

	if not CONDITIONS.IsPostSeasonAndMagma() then
		var_3_8 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
			controllerIndex = var_3_1
		})
		var_3_8.id = "SnipeIcon"

		var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1528, _1080p * 1656, 0, _1080p * 32)
		var_3_0:addElement(var_3_8)

		var_3_0.SnipeIcon = var_3_8
	end

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "SnipeOverlay"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1640, 0, _1080p * 31)
	var_3_0:addElement(var_3_10)

	var_3_0.SnipeOverlay = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "CategoryLine"

	var_3_12:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_3_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -700, _1080p * 31, _1080p * 32)
	var_3_0:addElement(var_3_12)

	var_3_0.CategoryLine = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "CategoryText"

	var_3_14:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_3_14:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CATEGORIES")), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 575, _1080p * 3, _1080p * 31)
	var_3_0:addElement(var_3_14)

	var_3_0.CategoryText = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16

	if not CONDITIONS.IsPostSeasonAndMagma() then
		local var_3_17 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_8:RegisterAnimationSequence("ShowWZSnipeBar", var_3_17)
	end

	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowWZSnipeBar", var_3_18)

	local function var_3_19()
		if not CONDITIONS.IsPostSeasonAndMagma() then
			var_3_8:AnimateSequence("ShowWZSnipeBar")
		end

		var_3_10:AnimateSequence("ShowWZSnipeBar")
	end

	var_3_0._sequences.ShowWZSnipeBar = var_3_19

	local var_3_20

	if not CONDITIONS.IsPostSeasonAndMagma() then
		local var_3_21 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_8:RegisterAnimationSequence("HideWZSnipeBar", var_3_21)
	end

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("HideWZSnipeBar", var_3_22)

	local function var_3_23()
		if not CONDITIONS.IsPostSeasonAndMagma() then
			var_3_8:AnimateSequence("HideWZSnipeBar")
		end

		var_3_10:AnimateSequence("HideWZSnipeBar")
	end

	var_3_0._sequences.HideWZSnipeBar = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_3_4:RegisterAnimationSequence("CW", var_3_25)

	local function var_3_26()
		var_3_4:AnimateSequence("CW")
	end

	var_3_0._sequences.CW = var_3_26

	local var_3_27
	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_3_4:RegisterAnimationSequence("MW", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("MW")
	end

	var_3_0._sequences.MW = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_3_4:RegisterAnimationSequence("VG", var_3_31)

	local function var_3_32()
		var_3_4:AnimateSequence("VG")
	end

	var_3_0._sequences.VG = var_3_32

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MPStoreBillboardGridRow", MPStoreBillboardGridRow)
LockTable(_M)
