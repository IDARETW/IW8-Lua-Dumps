module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	if BATTLEPASS.IsOwned(arg_1_1) then
		var_1_0 = BATTLEPASS.GetEmblemGold()
	else
		var_1_0 = BATTLEPASS.GetEmblemSilver()
	end

	if var_1_0 and var_1_0 ~= "" then
		arg_1_0.BattlePassImage:setImage(RegisterMaterial(var_1_0))
	end

	if Dvar.IBEGCHEFE("NPOLQSQMNO") then
		Challenge.SetupSeasonEndsTimer(arg_1_0, arg_1_0.ResetText, "MENU/PASS_RESET")
	else
		arg_1_0.ResetText:SetAlpha(0)
	end
end

function BattlePassCountDown(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 80 * _1080p)

	var_2_0.id = "BattlePassCountDown"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "BattlePassImage"

	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 70, _1080p * 10, _1080p * 70)
	var_2_0:addElement(var_2_4)

	var_2_0.BattlePassImage = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "ResetText"

	var_2_6:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("MENU/PASS_RESET"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetTintFontIcons(true)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 81, _1080p * 300, _1080p * 29, _1080p * 51)
	var_2_0:addElement(var_2_6)

	var_2_0.ResetText = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassCountDown", BattlePassCountDown)
LockTable(_M)
