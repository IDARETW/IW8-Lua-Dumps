module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = -1
	local var_1_1 = "icon_warning_large"
	local var_1_2 = "INVALID"

	if arg_1_1 then
		local var_1_3 = arg_1_1.contractTypeStr and ToUpperCase(Engine.CBBHFCGDIC(arg_1_1.contractTypeStr)) or var_1_2
		local var_1_4 = arg_1_1.contractIcon and arg_1_1.contractIcon or var_1_1
		local var_1_5 = arg_1_1.numCompleted and tonumber(arg_1_1.numCompleted) or var_1_0
		local var_1_6 = arg_1_1.xpNumPerContractCompleted and Engine.CBBHFCGDIC("AAR/PLUS_XP", tonumber(arg_1_1.xpNumPerContractCompleted)) or var_1_2

		arg_1_0.Type:setText(var_1_3)
		arg_1_0.Icon:setImage(RegisterMaterial(var_1_4))
		arg_1_0.Count:setText(var_1_5)
		arg_1_0.XpNum:setText(var_1_6)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupAARContractGridItem = var_0_0
end

function AARContractGridItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 575 * _1080p)

	var_3_0.id = "AARContractGridItem"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Chevron"

	var_3_4:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_4:SetAlpha(0.45, 0)
	var_3_4:setImage(RegisterMaterial("aar_contracts_chevron"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 262, _1080p * 176, _1080p * 400)
	var_3_0:addElement(var_3_4)

	var_3_0.Chevron = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "XpNum"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setText("+2000", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -150, _1080p * 150, _1080p * -164, _1080p * -134)
	var_3_0:addElement(var_3_6)

	var_3_0.XpNum = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Count"

	var_3_8:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_8:setText("99", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -57, _1080p * 57, _1080p * 308, _1080p * 356)
	var_3_0:addElement(var_3_8)

	var_3_0.Count = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Icon"

	var_3_10:setImage(RegisterMaterial("ui_mp_br_contracts_splash_icon_assassin"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 56, _1080p * 312)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Type"

	var_3_12:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_3_12:SetAlpha(0.8, 0)
	var_3_12:setText("Contract Type", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 41, _1080p * 71)
	var_3_0:addElement(var_3_12)

	var_3_0.Type = var_3_12

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARContractGridItem", AARContractGridItem)
LockTable(_M)
