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
	arg_1_0:addEventHandler("gift_queued_in", function(arg_3_0, arg_3_1)
		GIFT.ProcessQueuedBundleGifts(arg_1_1)

		return true
	end)
	GIFT.ProcessQueuedBundleGifts(arg_1_1)
end

function MPStoreMenu(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "MPStoreMenu"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MPStoreMenu", MPStoreMenu)
LockTable(_M)
