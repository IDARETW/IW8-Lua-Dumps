QUARTERMASTER = QUARTERMASTER or {}
QUARTERMASTER.storeSession = {}
QUARTERMASTER.itemData = {}
QUARTERMASTER.dlogEnabled = Dvar.IBEGCHEFE("LQTMQOTTTQ")

function QUARTERMASTER.GetMenuSource(arg_1_0)
	if arg_1_0 == "BladeMenu" then
		return arg_1_0
	elseif LUI.FlowManager.IsMenuOnTop("BRMainMenu") then
		return "BRStore"
	else
		return Engine.EAIICIFIFA() and "CPStore" or "MPStore"
	end
end

function QUARTERMASTER.RefreshStoreSession(arg_2_0, arg_2_1)
	if Engine.CFHBIHABCB(arg_2_0) then
		QUARTERMASTER.storeSession.storeName = Dvar.DHEEJCCJBH("MKMMQLLLSN")
	else
		QUARTERMASTER.storeSession.storeName = Dvar.DHEEJCCJBH("LSOQLQTOTK")
	end

	QUARTERMASTER.storeSession.storeRegion = Engine.CEAEFCAGJG()
	QUARTERMASTER.storeSession.storeLayout = arg_2_1.storeLayout
	QUARTERMASTER.storeSession.recommendationsEnabled = arg_2_1.recommendationData and arg_2_1.recommendationData.isEnabled
	QUARTERMASTER.storeSession.recommendedItems = arg_2_1.recommendationData and arg_2_1.recommendationData.items or "none"
end

function QUARTERMASTER.RecordStoreEnterEvent(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local function var_3_0(arg_4_0)
		local var_4_0 = ""

		for iter_4_0 = 1, #arg_4_0 do
			local var_4_1 = arg_4_0[iter_4_0]

			if var_4_1.id ~= nil then
				if string.len(var_4_0) == 0 then
					var_4_0 = var_4_1.id
				else
					var_4_0 = var_4_0 .. "," .. var_4_1.id
				end
			end
		end

		return var_4_0
	end

	if QUARTERMASTER.dlogEnabled and arg_3_2 then
		QUARTERMASTER.storeSession = {}
		QUARTERMASTER.storeSession.id = Engine.BCDHJIHBAA()

		local var_3_1 = QUARTERMASTER.GetMenuSource(arg_3_3)
		local var_3_2 = {
			storeLayout = arg_3_1,
			recommendationData = arg_3_2
		}
		local var_3_3 = var_3_0(arg_3_4)
		local var_3_4 = {}
		local var_3_5 = Engine.CFHBIHABCB(arg_3_0) or false

		QUARTERMASTER.RefreshStoreSession(arg_3_0, var_3_2)

		local var_3_6 = QUARTERMASTER.storeSession

		Engine.CEJJDJJHIJ(arg_3_0, "dlog_event_store_qm_entry", {
			store_name = var_3_6.storeName,
			store_session_id = var_3_6.id,
			source = var_3_1,
			region = var_3_6.storeRegion,
			store_layout = var_3_6.storeLayout,
			recommendations_enabled = var_3_6.recommendationsEnabled,
			recommended_items = var_3_6.recommendedItems,
			categories = var_3_3 or "",
			is_premium = var_3_5
		})

		QUARTERMASTER.storeSession = var_3_6
	end
end

function QUARTERMASTER.BeginItemBrowseEvent(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if QUARTERMASTER.dlogEnabled then
		local var_5_0 = {
			storeLayout = arg_5_2,
			recommendationData = arg_5_3
		}

		QUARTERMASTER.RefreshStoreSession(arg_5_0, var_5_0)

		local var_5_1 = QUARTERMASTER.storeSession

		QUARTERMASTER.itemData = {}
		QUARTERMASTER.itemData.sessionId = var_5_1.id
		QUARTERMASTER.itemData.start_time = os.time()
		QUARTERMASTER.itemData.item_id = arg_5_1.id or 0
		QUARTERMASTER.itemData.item_name = arg_5_1.name
		QUARTERMASTER.itemData.bundle_id = arg_5_1.bundleID
		QUARTERMASTER.itemData.position_in_grid = arg_5_1.positionInGrid or 0
	end
end

function QUARTERMASTER.RecordItemBrowseEvent(arg_6_0, arg_6_1, arg_6_2)
	if QUARTERMASTER.dlogEnabled then
		local var_6_0 = QUARTERMASTER.storeSession

		if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId == var_6_0.id then
			local var_6_1 = QUARTERMASTER.GetMenuSource(arg_6_2)
			local var_6_2 = QUARTERMASTER.itemData
			local var_6_3 = var_6_2.start_time
			local var_6_4 = os.time()
			local var_6_5 = var_6_2.item_id
			local var_6_6 = var_6_2.item_name
			local var_6_7 = var_6_2.bundle_id
			local var_6_8 = var_6_2.position_in_grid

			Engine.CEJJDJJHIJ(arg_6_0, "dlog_event_store_qm_item_browse", {
				store_name = var_6_0.storeName,
				store_session_id = var_6_0.id,
				source = var_6_1,
				region = var_6_0.storeRegion,
				store_layout = var_6_0.storeLayout,
				item_id = var_6_5,
				item_name = var_6_6,
				bundle_id = var_6_7,
				start_time = var_6_3,
				end_time = var_6_4,
				interacted = arg_6_1,
				item_slot_in_category = var_6_8
			})
		end

		QUARTERMASTER.itemData = nil
	end
end

function QUARTERMASTER.BeginMenuBrowseEvent(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if QUARTERMASTER.dlogEnabled then
		local var_7_0 = ""
		local var_7_1 = {}

		if arg_7_1.idPubVar then
			local var_7_2 = Dvar.DHEEJCCJBH(arg_7_1.idPubVar)

			if not string.match(var_7_2, tostring(arg_7_2.id)) then
				if string.len(var_7_2) == 0 then
					var_7_2 = tostring(arg_7_2.id)
				else
					var_7_2 = tostring(arg_7_2.id) .. "," .. var_7_2
				end
			end

			if arg_7_1.commsLocationId then
				local var_7_3 = Store.JGBAJAECG(arg_7_1.commsLocationId)

				var_7_2 = STORE.FormatRecommendationItems(var_7_3 .. "," .. var_7_2)
			end

			local var_7_4 = split(var_7_2, ",")

			for iter_7_0 = 1, #var_7_4 do
				local var_7_5 = var_7_4[iter_7_0]

				if STORE.BundleAvailable(arg_7_0, var_7_5) then
					if string.len(var_7_0) == 0 then
						var_7_0 = var_7_5
					else
						var_7_0 = var_7_0 .. "," .. var_7_5
					end

					if #var_7_1 < arg_7_1.numItemsShown then
						table.insert(var_7_1, var_7_5)
					end
				end
			end
		end

		local var_7_6 = ""

		for iter_7_1 = 1, #var_7_1 do
			if string.len(var_7_6) == 0 then
				var_7_6 = var_7_1[iter_7_1]
			else
				var_7_6 = var_7_6 .. "," .. var_7_1[iter_7_1]
			end
		end

		local var_7_7 = {
			storeLayout = arg_7_3,
			recommendationData = arg_7_4
		}

		QUARTERMASTER.RefreshStoreSession(arg_7_0, var_7_7)

		local var_7_8 = QUARTERMASTER.storeSession

		QUARTERMASTER.itemData = {}
		QUARTERMASTER.itemData.sessionId = var_7_8.id
		QUARTERMASTER.itemData.start_time = os.time()
		QUARTERMASTER.itemData.category_index = arg_7_1.categoryIndex
		QUARTERMASTER.itemData.category_name = arg_7_1.name
		QUARTERMASTER.itemData.category_id = arg_7_1.id or ""
		QUARTERMASTER.itemData.item_id = arg_7_2.id or 0
		QUARTERMASTER.itemData.item_name = arg_7_2.name
		QUARTERMASTER.itemData.position_in_grid = arg_7_2.positionInGrid or 0
		QUARTERMASTER.itemData.visible_items_in_row = var_7_6 or ""
		QUARTERMASTER.itemData.all_items_in_row = var_7_0 or ""
	end
end

function QUARTERMASTER.RecordMenuBrowseEvent(arg_8_0, arg_8_1, arg_8_2)
	if QUARTERMASTER.dlogEnabled then
		local var_8_0 = QUARTERMASTER.storeSession

		if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId == var_8_0.id then
			local var_8_1 = QUARTERMASTER.GetMenuSource(arg_8_2)
			local var_8_2 = QUARTERMASTER.itemData
			local var_8_3 = var_8_2.start_time
			local var_8_4 = os.time()
			local var_8_5 = var_8_2.category_index
			local var_8_6 = var_8_2.category_name
			local var_8_7 = var_8_2.category_id
			local var_8_8 = var_8_2.item_id
			local var_8_9 = var_8_2.item_name
			local var_8_10 = var_8_2.position_in_grid
			local var_8_11 = var_8_2.visible_items_in_row
			local var_8_12 = var_8_2.all_items_in_row

			Engine.CEJJDJJHIJ(arg_8_0, "dlog_event_store_qm_row_revealed", {
				store_name = var_8_0.storeName,
				store_session_id = var_8_0.id,
				source = var_8_1,
				region = var_8_0.storeRegion,
				store_layout = var_8_0.storeLayout,
				category_index = var_8_5,
				category_name = var_8_6,
				category_id = var_8_7,
				item_id = var_8_8,
				item_name = var_8_9,
				start_time = var_8_3,
				end_time = var_8_4,
				interacted = arg_8_1,
				item_slot_in_category = var_8_10,
				visible_items_in_row = var_8_11,
				available_items_in_row = var_8_12
			})
		end

		QUARTERMASTER.itemData = nil
	end
end

function QUARTERMASTER.RecordPurchaseConfirmEvent(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	if QUARTERMASTER.dlogEnabled then
		QUARTERMASTER.RefreshStoreSession(arg_9_0, arg_9_4)

		local var_9_0 = QUARTERMASTER.storeSession
		local var_9_1 = false
		local var_9_2 = QUARTERMASTER.GetMenuSource(arg_9_4.source)
		local var_9_3 = {
			store_name = var_9_0.storeName,
			store_session_id = var_9_0.id,
			source = var_9_2,
			region = var_9_0.storeRegion,
			store_layout = var_9_0.storeLayout,
			category_index = arg_9_4.categoryIndex,
			category_name = arg_9_4.categoryName,
			item_id = arg_9_4.itemID,
			item_name = arg_9_4.itemName,
			current_menu = LUI.FlowManager.GetMenuNameAtIndex(-1),
			previous_menu = arg_9_1,
			purchased = arg_9_2,
			err = var_9_1 or arg_9_3,
			item_slot_in_category = arg_9_4.positionInGrid
		}

		Engine.CEJJDJJHIJ(arg_9_0, "dlog_event_store_qm_item_purchase", var_9_3)
	end
end

function QUARTERMASTER.FlushData(arg_10_0)
	QUARTERMASTER.RecordMenuBrowseEvent(arg_10_0, false)
end
