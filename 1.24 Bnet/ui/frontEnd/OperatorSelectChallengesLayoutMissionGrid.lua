module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = 0

	for iter_1_0 = 1, #arg_1_1 do
		if arg_1_1[iter_1_0].complete then
			var_1_0 = var_1_0 + 1
		end
	end

	local var_1_1 = #arg_1_1
	local var_1_2 = math.min(var_1_1, arg_1_0.Grid:GetMaxVisibleRows())
	local var_1_3 = arg_1_0.Grid:GetRowHeight() * (var_1_2 + 1) + arg_1_0.Grid:GetSpacingY() * (var_1_2 - 1)

	arg_1_0.Background:setHeight(var_1_3)

	local var_1_4 = 10 * _1080p
	local var_1_5, var_1_6, var_1_7, var_1_8 = arg_1_0.PromptPreview:getLocalRect()
	local var_1_9 = math.abs(var_1_6 - var_1_8)

	arg_1_0.PromptPreview:SetTop(var_1_3 + var_1_4)
	arg_1_0.PromptPreview:SetBottom(var_1_3 + var_1_4 + var_1_9)
	arg_1_0.Complete:setText(Engine.CBBHFCGDIC("LUA_MENU/COMPLETED_OBJECTIVES", var_1_0, var_1_2))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateDetails = var_0_0
end

function OperatorSelectChallengesLayoutMissionGrid(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 170 * _1080p)

	var_3_0.id = "OperatorSelectChallengesLayoutMissionGrid"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_3_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -100, 0, 0, _1080p * 402)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MissionStatus", {
				controllerIndex = var_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 68,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_7 = LUI.UIGrid.new(var_3_6)

	var_3_7.id = "Grid"

	var_3_7:setUseStencil(true)
	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -84, _1080p * 366, _1080p * 53, _1080p * 402)
	var_3_0:addElement(var_3_7)

	var_3_0.Grid = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIText.new()

	var_3_9.id = "PromptPreview"

	var_3_9:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_9:setText(Engine.CBBHFCGDIC("LUA_MENU/ALL_MISSIONS"), 0)
	var_3_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_9:SetAlignment(LUI.Alignment.Left)
	var_3_9:SetTintFontIcons(true)
	var_3_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -90, _1080p * 178, _1080p * 409, _1080p * 433)
	var_3_0:addElement(var_3_9)

	var_3_0.PromptPreview = var_3_9

	local var_3_10
	local var_3_11 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_11.id = "MissionHeader"

	var_3_11.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"), 0)
	var_3_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -100, _1080p * 251, 0, _1080p * 46)
	var_3_0:addElement(var_3_11)

	var_3_0.MissionHeader = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIStyledText.new()

	var_3_13.id = "Complete"

	var_3_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_13:setText(Engine.CBBHFCGDIC("LUA_MENU/COMPLETED_OBJECTIVES"), 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_13:SetAlignment(LUI.Alignment.Right)
	var_3_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_13:SetStartupDelay(2000)
	var_3_13:SetLineHoldTime(400)
	var_3_13:SetAnimMoveTime(2000)
	var_3_13:SetAnimMoveSpeed(150)
	var_3_13:SetEndDelay(2000)
	var_3_13:SetCrossfadeTime(250)
	var_3_13:SetFadeInTime(300)
	var_3_13:SetFadeOutTime(300)
	var_3_13:SetMaxVisibleLines(1)
	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 255, _1080p * 393, _1080p * 15, _1080p * 33)
	var_3_0:addElement(var_3_13)

	var_3_0.Complete = var_3_13

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OperatorSelectChallengesLayoutMissionGrid", OperatorSelectChallengesLayoutMissionGrid)
LockTable(_M)
