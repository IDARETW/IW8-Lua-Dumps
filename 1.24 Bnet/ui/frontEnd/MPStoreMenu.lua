module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Store.EHGIGBJJC()
	local var_1_1 = Engine.EHGIGBJJC(var_1_0).layoutType
	local var_1_2 = ""

	if var_1_1 == StoreItemLayout.BILLBOARD_LIST then
		var_1_2 = "MPStoreBillboardList"
	elseif var_1_1 == StoreItemLayout.BILLBOARD_GRID then
		var_1_2 = "MPStoreBillboardGrid"
	else
		assert(false, "Unsupported Store Layout!")
	end

	local var_1_3 = MenuBuilder.BuildRegisteredType(var_1_2, {
		controllerIndex = arg_1_1
	})

	var_1_3.id = var_1_2

	arg_1_0:addElement(var_1_3)

	arg_1_0.FocusBundleByID = var_1_3.FocusBundleByID
	arg_1_0.FocusButtonByName = var_1_3.FocusButtonByName
	arg_1_0.BackButtonOverride = var_1_3.BackButtonOverride

	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end

	arg_1_0:addEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_2_0, arg_2_1)
		QUARTERMASTER.FlushData(arg_2_1.controller)

		return true
	end)
end

function MPStoreMenu(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "MPStoreMenu"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MPStoreMenu", MPStoreMenu)
LockTable(_M)
