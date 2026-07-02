module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 > 1 then
		arg_1_0.StoreItemButton1.navigation.right = arg_1_0.StoreItemButton2
		arg_1_0.StoreItemButton1.navigation.left = arg_1_0.StoreItemButton2
		arg_1_0.StoreItemButton2.navigation.left = arg_1_0.StoreItemButton1
		arg_1_0.StoreItemButton2.navigation.right = arg_1_0.StoreItemButton1
	end

	if arg_1_1 > 2 then
		arg_1_0.StoreItemButton2.navigation.right = arg_1_0.StoreItemButton3
		arg_1_0.StoreItemButton3.navigation.left = arg_1_0.StoreItemButton2
		arg_1_0.StoreItemButton3.navigation.right = arg_1_0.StoreItemButton1
		arg_1_0.StoreItemButton1.navigation.left = arg_1_0.StoreItemButton3
	end

	if arg_1_1 > 3 then
		arg_1_0.StoreItemButton4.navigation.left = arg_1_0.StoreItemButton2
		arg_1_0.StoreItemButton4.navigation.up = arg_1_0.StoreItemButton3
		arg_1_0.StoreItemButton4.navigation.right = arg_1_0.StoreItemButton1
		arg_1_0.StoreItemButton3.navigation.down = arg_1_0.StoreItemButton4
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.StoreItemButton1:processEvent({
		name = "lose_focus"
	})
	arg_2_0["StoreItemButton" .. arg_2_1]:processEvent({
		name = "gain_focus"
	})
	arg_2_0:saveState()
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._numStoreItemsToShow = #arg_3_2

	for iter_3_0 = 1, STORE.maxButtonsPerCategoryRow do
		local var_3_0 = false

		if iter_3_0 < arg_3_0._numStoreItemsToShow + 1 then
			arg_3_0["StoreItemButton" .. iter_3_0]:SetButtonData(arg_3_2[iter_3_0])
			arg_3_0["StoreItemButton" .. iter_3_0]:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
				arg_3_0._storeItemDetails:SetItemDetails(arg_3_2[iter_3_0])

				if iter_3_0 == 2 then
					arg_3_0._store._selectionColumnIndex = 3
				elseif iter_3_0 == 3 then
					arg_3_0._store._selectionColumnIndex = 4
				else
					arg_3_0._store._selectionColumnIndex = iter_3_0
				end
			end)

			var_3_0 = true
		end

		arg_3_0["StoreItemButton" .. iter_3_0]:SetAlpha(var_3_0 and 1 or 0)
		arg_3_0["StoreItemButton" .. iter_3_0]:SetButtonDisabled(not var_3_0)
		arg_3_0["StoreItemButton" .. iter_3_0]:SetMouseFocusBlocker(not var_3_0)
		arg_3_0["StoreItemButton" .. iter_3_0]:SetFocusable(var_3_0)

		arg_3_0["StoreItemButton" .. iter_3_0].navigation = {}
	end

	var_0_0(arg_3_0, arg_3_0._numStoreItemsToShow)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_2.store)

	arg_5_0._store = arg_5_2.store
	arg_5_0._storeItemDetails = arg_5_0._store.StoreItemDetails
	arg_5_0.UpdateStoreItemButtons = var_0_2
	arg_5_0.FocusItem = var_0_1

	arg_5_0:addEventHandler("gain_focus", function(arg_6_0, arg_6_1)
		if arg_6_0._store._selectionColumnIndex then
			local var_6_0 = arg_6_0._store._selectionColumnIndex

			if var_6_0 > arg_5_0._numStoreItemsToShow then
				var_6_0 = arg_5_0._numStoreItemsToShow
			end

			if var_6_0 == 2 then
				var_6_0 = 1
			elseif var_6_0 == 3 then
				var_6_0 = 2
			end

			arg_5_0["StoreItemButton" .. var_6_0]:processEvent({
				name = "gain_focus"
			})

			return true
		end
	end)
end

function StoreFeaturedRow(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1340 * _1080p, 0, 420 * _1080p)

	var_7_0.id = "StoreFeaturedRow"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "StoreItemButton1"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 660, 0, _1080p * 420)
	var_7_0:addElement(var_7_4)

	var_7_0.StoreItemButton1 = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "StoreItemButton2"

	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 680, _1080p * 1000, 0, _1080p * 420)
	var_7_0:addElement(var_7_6)

	var_7_0.StoreItemButton2 = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "StoreItemButton3"

	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1020, _1080p * 1340, 0, _1080p * 200)
	var_7_0:addElement(var_7_8)

	var_7_0.StoreItemButton3 = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("StoreBasicItemButton", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "StoreItemButton4"

	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1020, _1080p * 1340, _1080p * 220, _1080p * 420)
	var_7_0:addElement(var_7_10)

	var_7_0.StoreItemButton4 = var_7_10

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("StoreFeaturedRow", StoreFeaturedRow)
LockTable(_M)
