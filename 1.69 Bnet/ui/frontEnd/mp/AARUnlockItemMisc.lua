module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = PROGRESSION.GetPlayerProgressionData({
		_combinedRankNum = arg_1_2.unlockRank
	})
	local var_1_1 = Engine.CBBHFCGDIC(arg_1_2.unlocked and "AAR/UNLOCKED" or "AAR/NEXT_UNLOCK")
	local var_1_2 = Engine.CBBHFCGDIC(arg_1_2.unlocked and "AAR/NEXT_UNLOCK" or "AAR/UNLOCKED_AT_LEVEL")

	arg_1_0.Title1.Text:setText(var_1_1)
	arg_1_0.Title2.Text:setText(var_1_2)

	local var_1_3 = arg_1_2.name
	local var_1_4 = arg_1_2.unlocked and arg_1_3.name or Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", var_1_0._rankDisplay)

	arg_1_0.UnlockItem1.Name:setText(var_1_3)
	arg_1_0.UnlockItem2.Name:setText(var_1_4)

	local var_1_5 = arg_1_2.lootTypeName
	local var_1_6 = arg_1_2.unlocked and arg_1_3.lootTypeName or ""

	arg_1_0.UnlockItem1.Type:setText(var_1_5)
	arg_1_0.UnlockItem2.Type:setText(var_1_6)

	local var_1_7 = arg_1_2.icon
	local var_1_8 = arg_1_2.unlocked and arg_1_3.icon or var_1_0._rankIcon

	arg_1_0.UnlockItem1:SetupImage(arg_1_1, var_1_7)
	arg_1_0.UnlockItem2:SetupImage(arg_1_1, var_1_8)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetUpUnlockData = var_0_0
end

function AARUnlockItemMisc(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 750 * _1080p)

	var_3_0.id = "AARUnlockItemMisc"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(40 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Title1"

	var_3_4.Text:setText(ToUpperCase(""), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_3_0:addElement(var_3_4)

	var_3_0.Title1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "UnlockItem1"

	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 87, _1080p * 337)
	var_3_0:addElement(var_3_6)

	var_3_0.UnlockItem1 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Title2"

	var_3_8.Text:setText(ToUpperCase(""), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 377, _1080p * 424)
	var_3_0:addElement(var_3_8)

	var_3_0.Title2 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "UnlockItem2"

	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 464, _1080p * 714)
	var_3_0:addElement(var_3_10)

	var_3_0.UnlockItem2 = var_3_10

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARUnlockItemMisc", AARUnlockItemMisc)
LockTable(_M)
