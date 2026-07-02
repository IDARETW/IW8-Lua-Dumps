module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = 2 * _1080p
	local var_1_1 = 600 * _1080p
	local var_1_2 = 0

	if arg_1_0.ChangeTeamPrompt then
		var_1_2 = LAYOUT.GetTextWidth(arg_1_0.ChangeTeamPrompt)
	end

	local var_1_3 = LAYOUT.GetTextWidth(arg_1_0.PlayerCount)
	local var_1_4 = 0 - var_1_2 - var_1_0
	local var_1_5 = 0 - var_1_1 + var_1_3 + var_1_0
	local var_1_6 = arg_1_0.SplitscreenPrompt:GetCurrentAnchorsAndPositions()

	arg_1_0.SplitscreenPrompt:SetAnchorsAndPosition(1, 0, 0.5, 0.5, var_1_5, var_1_4, var_1_6.top, var_1_6.bottom)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.AdjustSplitScreenPromptSize = var_0_0
end

function LobbyMembersHeader(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "LobbyMembersHeader"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_5 = LUI.UIBorder.new(var_3_4)

	var_3_5.id = "Border"

	var_3_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_5:SetAlpha(0.4, 0)
	var_3_5:SetBorderThicknessLeft(_1080p * 0, 0)
	var_3_5:SetBorderThicknessRight(_1080p * 0, 0)
	var_3_5:SetBorderThicknessTop(_1080p * 0, 0)
	var_3_0:addElement(var_3_5)

	var_3_0.Border = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIStyledText.new()

	var_3_7.id = "PlayerCount"

	var_3_7:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_7:setText("", 0)
	var_3_7:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_7:SetAlignment(LUI.Alignment.Left)
	var_3_7:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_7:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 290, _1080p * -14, _1080p * 8)
	var_3_0:addElement(var_3_7)

	var_3_0.PlayerCount = var_3_7

	local var_3_8
	local var_3_9 = MenuBuilder.BuildRegisteredType("SplitscreenPrompt", {
		controllerIndex = var_3_1
	})

	var_3_9.id = "SplitscreenPrompt"

	var_3_9:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_9.PromptText:SetAlignment(LUI.Alignment.Center)
	var_3_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 35, _1080p * 535, _1080p * -12, _1080p * 6)
	var_3_0:addElement(var_3_9)

	var_3_0.SplitscreenPrompt = var_3_9

	local var_3_10

	if CONDITIONS.IsPlayerRoleAllowed(var_3_0) then
		local var_3_11 = LUI.UIStyledText.new()

		var_3_11.id = "ChangeTeamPrompt"

		var_3_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_3_11:setText(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_TEAM_WITH_PROMPT"), 0)
		var_3_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
		var_3_11:SetAlignment(LUI.Alignment.Right)
		var_3_11:SetTintFontIcons(true)
		var_3_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -290, 0, _1080p * -14, _1080p * 8)
		var_3_0:addElement(var_3_11)

		var_3_0.ChangeTeamPrompt = var_3_11
	end

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyMembersHeader", LobbyMembersHeader)
LockTable(_M)
