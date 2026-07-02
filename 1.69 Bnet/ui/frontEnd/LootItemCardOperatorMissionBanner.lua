module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_3 then
		arg_1_0.Text:SetScale(arg_1_1, arg_1_2, arg_1_3)
	else
		arg_1_0.Text:SetScale(arg_1_1, arg_1_2)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1)
	arg_2_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LOOT_ITEM_CARD_OPERATOR_MISSION_BANNER", arg_2_1))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetTextScale = var_0_0
	arg_3_0.SetAmount = var_0_1
end

function LootItemCardOperatorMissionBanner(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "LootItemCardOperatorMissionBanner"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Text"

	var_4_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/LOOT_ITEM_CARD_OPERATOR_MISSION_BANNER"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_6:SetLeading(-2 * _1080p, 0)
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_6:SetStartupDelay(5000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(150)
	var_4_6:SetAnimMoveSpeed(50)
	var_4_6:SetEndDelay(1000)
	var_4_6:SetCrossfadeTime(400)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(2)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 2, _1080p * -2, _1080p * -9, _1080p * 9)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LootItemCardOperatorMissionBanner", LootItemCardOperatorMissionBanner)
LockTable(_M)
