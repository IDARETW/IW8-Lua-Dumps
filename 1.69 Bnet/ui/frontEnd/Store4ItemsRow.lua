module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.StoreItemButton1:processEvent({
		name = "lose_focus"
	})
	arg_1_0["StoreItemButton" .. arg_1_1]:processEvent({
		name = "gain_focus"
	})
	arg_1_0:saveState()
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._numStoreItemsToShow = #arg_2_2

	if arg_2_0._rowIndex then
		arg_2_0._numStoreItemsToShow = #arg_2_2 - STORE.maxButtonsPerCategoryRow * arg_2_0._rowIndex
		arg_2_0._numStoreItemsToShow = math.min(arg_2_0._numStoreItemsToShow, STORE.maxButtonsPerCategoryRow)
	end

	for iter_2_0 = 1, STORE.maxButtonsPerCategoryRow do
		local var_2_0 = iter_2_0

		if arg_2_0._rowIndex then
			var_2_0 = iter_2_0 + STORE.maxButtonsPerCategoryRow * arg_2_0._rowIndex
		end

		local var_2_1 = false

		if iter_2_0 < arg_2_0._numStoreItemsToShow + 1 then
			arg_2_0["StoreItemButton" .. iter_2_0]:SetButtonData(arg_2_2[var_2_0])
			arg_2_0["StoreItemButton" .. iter_2_0]:addEventHandler("gain_focus", function(arg_3_0, arg_3_1)
				arg_2_0._storeItemDetails:SetItemDetails(arg_2_2[var_2_0])

				arg_2_0._store._selectionColumnIndex = iter_2_0
			end)

			var_2_1 = true
		end

		arg_2_0["StoreItemButton" .. iter_2_0]:SetAlpha(var_2_1 and 1 or 0)
		arg_2_0["StoreItemButton" .. iter_2_0]:SetButtonDisabled(not var_2_1)
		arg_2_0["StoreItemButton" .. iter_2_0]:SetMouseFocusBlocker(not var_2_1)
		arg_2_0["StoreItemButton" .. iter_2_0]:SetFocusable(var_2_1)
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2.store)

	arg_4_0._store = arg_4_2.store
	arg_4_0._storeItemDetails = arg_4_0._store.StoreItemDetails
	arg_4_0._rowIndex = arg_4_2.rowIndex
	arg_4_0.UpdateStoreItemButtons = var_0_1
	arg_4_0.FocusItem = var_0_0

	arg_4_0:SetDefaultFocus(function()
		if arg_4_0._store._selectionColumnIndex then
			if arg_4_0._store._selectionColumnIndex <= arg_4_0._numStoreItemsToShow then
				return arg_4_0._store._selectionColumnIndex
			else
				return arg_4_0._numStoreItemsToShow
			end
		end
	end)
	arg_4_0:SetForceDefaultFocus(true)
end

function Store4ItemsRow(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIHorizontalNavigator.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1340 * _1080p, 0, 200 * _1080p)

	var_6_0.id = "Store4ItemsRow"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "StoreItemButton1"

	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 320, 0, _1080p * 200)
	var_6_0:addElement(var_6_4)

	var_6_0.StoreItemButton1 = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "StoreItemButton2"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 340, _1080p * 660, 0, _1080p * 200)
	var_6_0:addElement(var_6_6)

	var_6_0.StoreItemButton2 = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "StoreItemButton3"

	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 680, _1080p * 1000, 0, _1080p * 200)
	var_6_0:addElement(var_6_8)

	var_6_0.StoreItemButton3 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "StoreItemButton4"

	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1020, _1080p * 1340, 0, _1080p * 200)
	var_6_0:addElement(var_6_10)

	var_6_0.StoreItemButton4 = var_6_10

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("Store4ItemsRow", Store4ItemsRow)
LockTable(_M)
