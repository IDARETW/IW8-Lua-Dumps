module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = Engine.CBBHFCGDIC(arg_1_2.unlocked and "AAR/UNLOCKED" or "AAR/NEXT_UNLOCK")
	local var_1_1 = Engine.CBBHFCGDIC(arg_1_2.unlocked and "AAR/NEXT_UNLOCK" or "AAR/UNLOCKED_AT_LEVEL")

	arg_1_0.Title1.Text:setText(var_1_0)
	arg_1_0.Title2.Text:setText(var_1_1)

	local var_1_2 = arg_1_2.name
	local var_1_3 = arg_1_2.unlocked and arg_1_3.name or Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", PROGRESSION.GetRankDisplay(arg_1_2.unlockRank))

	arg_1_0.UnlockItem1.Name:setText(var_1_2)
	arg_1_0.UnlockItem2.Name:setText(var_1_3)

	local var_1_4 = arg_1_2.lootTypeName
	local var_1_5 = arg_1_2.unlocked and arg_1_3.lootTypeName or ""

	arg_1_0.UnlockItem1.Type:setText(var_1_4)
	arg_1_0.UnlockItem2.Type:setText(var_1_5)

	local var_1_6 = arg_1_2.icon
	local var_1_7 = arg_1_2.unlocked and arg_1_3.icon or PROGRESSION.GetRankBigIcon(arg_1_2.unlockRank, 0)

	arg_1_0.UnlockItem1:SetupImage(arg_1_1, var_1_6)
	arg_1_0.UnlockItem2:SetupImage(arg_1_1, var_1_7)
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0.Title1, "ButtonOver")
	ACTIONS.AnimateSequence(arg_2_0.UnlockItem1, "ButtonOver")
	ACTIONS.AnimateSequence(arg_2_0.Title2, "ButtonOver")
	ACTIONS.AnimateSequence(arg_2_0.UnlockItem2, "ButtonOver")
end

local function var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0.Title1, "ButtonUp")
	ACTIONS.AnimateSequence(arg_3_0.UnlockItem1, "ButtonUp")
	ACTIONS.AnimateSequence(arg_3_0.Title2, "ButtonUp")
	ACTIONS.AnimateSequence(arg_3_0.UnlockItem2, "ButtonUp")
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetUpUnlockData = var_0_0
	arg_4_0.ButtonOver = var_0_1
	arg_4_0.ButtonUp = var_0_2

	var_0_2(arg_4_0)
end

function AARUnlockItemLoadout(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalStackedLayout.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 750 * _1080p)

	var_5_0.id = "AARUnlockItemLoadout"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetSpacing(35 * _1080p)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Title1"

	var_5_4.Text:setText(ToUpperCase(""), 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_5_0:addElement(var_5_4)

	var_5_0.Title1 = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "UnlockItem1"

	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 82, _1080p * 328)
	var_5_0:addElement(var_5_6)

	var_5_0.UnlockItem1 = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Title2"

	var_5_8.Text:setText(ToUpperCase(""), 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 363, _1080p * 410)
	var_5_0:addElement(var_5_8)

	var_5_0.Title2 = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "UnlockItem2"

	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 445, _1080p * 711)
	var_5_0:addElement(var_5_10)

	var_5_0.UnlockItem2 = var_5_10

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("AARUnlockItemLoadout", AARUnlockItemLoadout)
LockTable(_M)
