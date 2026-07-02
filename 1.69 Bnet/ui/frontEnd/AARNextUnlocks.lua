module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {
		name = "",
		title = "",
		type = ""
	}
	local var_1_1 = AAR.GetUnlockData(arg_1_1, arg_1_3)

	if var_1_1 then
		var_1_0.title = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"))
		var_1_0.name = var_1_1.name
		var_1_0.type = var_1_1.lootTypeName
		var_1_0.icon = var_1_1.icon
	end

	if not (var_1_0.name == nil or #var_1_0.name == 0 or var_1_0.icon == nil or #var_1_0.icon == 0 or var_1_0.type == nil or #var_1_0.type == 0) then
		arg_1_0.NextUnlock:UpdateUnlockData(arg_1_1, arg_1_3)
		arg_1_0.NextUnlock:SetAlpha(1)
	else
		arg_1_0.NextUnlock:SetAlpha(0)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitUnlock = var_0_0
	arg_2_0.SetUpUnlockData = SetUpUnlockData

	ACTIONS.AnimateSequence(arg_2_0.NextUnlock, "ScaleCard")
end

function AARNextUnlocks(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "AARNextUnlocks"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Title"

	var_3_6.Text:setText(Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("WZUnlocksLootItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "NextUnlock"

	var_3_8:SetAlpha(0, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 380, _1080p * 53, _1080p * 362)
	var_3_0:addElement(var_3_8)

	var_3_0.NextUnlock = var_3_8

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARNextUnlocks", AARNextUnlocks)
LockTable(_M)
