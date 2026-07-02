module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)

	arg_1_0._enabled = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Enable = var_0_0

	local var_2_0 = LUI.UIBindButton.new()

	var_2_0:registerEventHandler("button_alt1", function(arg_3_0, arg_3_1)
		if arg_2_0._enabled then
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_2_1, false, nil)
		end
	end)
	arg_2_0:addElement(var_2_0)
end

function FullGameUpsell(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 200 * _1080p)

	var_4_0.id = "FullGameUpsell"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "UpsellImage"

	var_4_4:setImage(RegisterMaterial("mw_battlepass_billboard_060"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 141)
	var_4_0:addElement(var_4_4)

	var_4_0.UpsellImage = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "UpsellText"

	var_4_6:setText(Engine.CBBHFCGDIC("INGAMESTORE/UPSELL_DAILY"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 141, _1080p * 159)
	var_4_0:addElement(var_4_6)

	var_4_0.UpsellText = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "PurchaseText"

	var_4_8:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("INGAMESTORE/UPSELL_HINT"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 176, _1080p * 194)
	var_4_0:addElement(var_4_8)

	var_4_0.PurchaseText = var_4_8

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("FullGameUpsell", FullGameUpsell)
LockTable(_M)
