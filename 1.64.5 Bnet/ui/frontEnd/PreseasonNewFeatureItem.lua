module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ItemTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(arg_1_1.itemTitle)))
	arg_1_0.ItemImage:setImage(RegisterMaterial(arg_1_1.itemImage))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateData = var_0_0
end

function PreseasonNewFeatureItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 324 * _1080p, 0, 465 * _1080p)

	var_3_0.id = "PreseasonNewFeatureItem"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "ItemImage"

	var_3_4:SetAlpha(0.9, 0)
	var_3_4:setImage(RegisterMaterial("s4_ui_upsell_tab_preseason_01"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 49, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.ItemImage = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "ItemTitle"

	var_3_6:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_6:SetAlpha(0.8, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESEASON_FEATURE_1"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:setTextStyle(CoD.TextStyle.Shadowed)
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_6:SetStartupDelay(1000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(150)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(1000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -162, _1080p * 162, _1080p * -232.5, _1080p * -199.5)
	var_3_0:addElement(var_3_6)

	var_3_0.ItemTitle = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PreseasonNewFeatureItem", PreseasonNewFeatureItem)
LockTable(_M)
