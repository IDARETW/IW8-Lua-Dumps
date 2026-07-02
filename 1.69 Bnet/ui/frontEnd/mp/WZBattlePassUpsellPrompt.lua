module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0.Header, "WideTextAdjustment")
end

function WZBattlePassUpsellPrompt(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 200 * _1080p)

	var_2_0.id = "WZBattlePassUpsellPrompt"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_2_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_2_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "InputPrompt"

	var_2_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("BATTLEPASS/X_PROMPT_MORE_INFORMATION"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 14, _1080p * 38)
	var_2_0:addElement(var_2_6)

	var_2_0.InputPrompt = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Snipe"

	var_2_8:setImage(RegisterMaterial("logo_cod_store"), 0)
	var_2_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 13, _1080p * -13, _1080p * 70, _1080p * -24)
	var_2_0:addElement(var_2_8)

	var_2_0.Snipe = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "Header"

	var_2_10.Divider:SetRGBFromTable(SWATCHES.BattlePass.BRVIPTextGray, 0)
	var_2_10.Text:SetRGBFromTable(SWATCHES.BattlePass.BRVIPTextGray, 0)
	var_2_10.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXCLUSIVELY_USABLE_IN"), 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_2_0:addElement(var_2_10)

	var_2_0.Header = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WZBattlePassUpsellPrompt", WZBattlePassUpsellPrompt)
LockTable(_M)
