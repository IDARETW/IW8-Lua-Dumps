module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0

	if BATTLEPASS.IsOwned(arg_1_1) then
		var_1_0 = BATTLEPASS.GetEmblemGold()
	else
		var_1_0 = BATTLEPASS.GetEmblemSilver()
	end

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0.BattlePass:setImage(RegisterMaterial(var_1_0))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if not Engine.CJJAFGIFAC(arg_2_1) then
		arg_2_0:SetAlpha(0)
	else
		var_0_0(arg_2_0, arg_2_1)

		local var_2_0 = arg_2_2.isSeasonReset and "MENU/SEASON_RESET" or "MENU/PASS_RESET"

		Challenge.SetupSeasonEndsTimer(arg_2_0, arg_2_0.ResetText, var_2_0)
	end
end

function BattlePassSeasonResetStatus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 375 * _1080p, 0, 80 * _1080p)

	var_3_0.id = "BattlePassSeasonResetStatus"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "ResetText"

	var_3_4:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("MENU/PASS_RESET"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetTintFontIcons(true)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 83, _1080p * 375, _1080p * 24, _1080p * 52)
	var_3_0:addElement(var_3_4)

	var_3_0.ResetText = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "BattlePass"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 79, 0, _1080p * 80)
	var_3_0:addElement(var_3_6)

	var_3_0.BattlePass = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassSeasonResetStatus", BattlePassSeasonResetStatus)
LockTable(_M)
