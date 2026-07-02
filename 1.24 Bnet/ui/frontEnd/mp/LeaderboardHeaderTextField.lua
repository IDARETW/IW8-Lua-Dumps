module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsThirdGameMode(arg_1_0) then
		arg_1_0.Field:SetAlignment(LUI.Alignment.Center)
	end
end

function LeaderboardHeaderTextField(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "LeaderboardHeaderTextField"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "Field"

	var_2_4:setText("N/A", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_4:SetStartupDelay(1000)
	var_2_4:SetLineHoldTime(400)
	var_2_4:SetAnimMoveTime(1000)
	var_2_4:SetAnimMoveSpeed(150)
	var_2_4:SetEndDelay(1000)
	var_2_4:SetCrossfadeTime(1000)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(1)
	var_2_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * -11, _1080p * 11)
	var_2_0:addElement(var_2_4)

	var_2_0.Field = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LeaderboardHeaderTextField", LeaderboardHeaderTextField)
LockTable(_M)
