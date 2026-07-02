module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = BATTLEPASS.GetEmblemGold()

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0.SeasonImg:setImage(RegisterMaterial(var_1_0))
	end
end

function BattlePassPopupWindow(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1710 * _1080p, 0, 802 * _1080p)

	var_2_0.id = "BattlePassPopupWindow"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "SeasonImg"

	var_2_4:SetAlpha(0.15, 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 441, _1080p * 1081, _1080p * -341, _1080p * 299)
	var_2_0:addElement(var_2_4)

	var_2_0.SeasonImg = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "GenericPopupWindow"

	var_2_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_6.PopupBackground:SetAlpha(0.3, 0)
	var_2_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.GenericPopupWindow = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassPopupWindow", BattlePassPopupWindow)
LockTable(_M)
