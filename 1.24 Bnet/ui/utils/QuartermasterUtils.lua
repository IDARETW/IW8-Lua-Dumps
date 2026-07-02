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

function QUARTERMASTER.RecordStoreEnterEvent(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if QUARTERMASTER.dlogEnabled and arg_3_2 then
		QUARTERMASTER.storeSession = {}
		QUARTERMASTER.storeSession.id = Engine.BCDHJIHBAA()

		local var_3_0 = QUARTERMASTER.GetMenuSource(arg_3_3)
		local var_3_1 = {
			storeLayout = arg_3_1,
			recommendationData = arg_3_2
		}
		local var_3_2 = Dvar.DHEEJCCJBH("LOKOLPNMNP")
		local var_3_3 = Dvar.DHEEJCCJBH("QTNMNLKMM")
		local var_3_4 = Dvar.DHEEJCCJBH("MMOOTLNTNR")
		local var_3_5 = Dvar.DHEEJCCJBH("LQQSPONNOK")
		local var_3_6 = Dvar.DHEEJCCJBH("OTPQONQQT")
		local var_3_7 = Dvar.DHEEJCCJBH("LRQOORNNQS")
		local var_3_8 = Engine.CFHBIHABCB(arg_3_0) or false

		QUARTERMASTER.RefreshStoreSession(arg_3_0, var_3_1)

		local var_3_9 = QUARTERMASTER.storeSession

		Engine.CEJJDJJHIJ(arg_3_0, "dlog_event_store_qm_entry", {
			store_name = var_3_9.storeName,
			store_session_id = var_3_9.id,
			source = var_3_0,
			region = var_3_9.storeRegion,
			store_layout = var_3_9.storeLayout,
			recommendations_enabled = var_3_9.recommendationsEnabled,
			recommended_items = var_3_9.recommendedItems,
			weapon_items = var_3_2,
			weapon_items_f2p = var_3_3,
			featured_items = var_3_4,
			featured_items_f2p = var_3_5,
			operator_items = var_3_6,
			operator_items_f2p = var_3_7,
			is_premium = var_3_8
		})

		QUARTERMASTER.storeSession = var_3_9
	end
end

function QUARTERMASTER.BeginItemBrowseEvent(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if QUARTERMASTER.dlogEnabled then
		local var_4_0 = {
			storeLayout = arg_4_2,
			recommendationData = arg_4_3
		}

		QUARTERMASTER.RefreshStoreSession(arg_4_0, var_4_0)

		local var_4_1 = QUARTERMASTER.storeSession

		QUARTERMASTER.itemData = {}
		QUARTERMASTER.itemData.sessionId = var_4_1.id
		QUARTERMASTER.itemData.start_time = os.time()
		QUARTERMASTER.itemData.item_id = arg_4_1.id or 0
		QUARTERMASTER.itemData.item_name = arg_4_1.name
		QUARTERMASTER.itemData.bundle_id = arg_4_1.bundleID
		QUARTERMASTER.itemData.position_in_grid = arg_4_1.positionInGrid or 0
	end
end

function QUARTERMASTER.RecordItemBrowseEvent(arg_5_0, arg_5_1, arg_5_2)
	if QUARTERMASTER.dlogEnabled then
		local var_5_0 = QUARTERMASTER.storeSession

		if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId == var_5_0.id then
			local var_5_1 = QUARTERMASTER.GetMenuSource(arg_5_2)
			local var_5_2 = QUARTERMASTER.itemData
			local var_5_3 = var_5_2.start_time
			local var_5_4 = os.time()
			local var_5_5 = var_5_2.item_id
			local var_5_6 = var_5_2.item_name
			local var_5_7 = var_5_2.bundle_id
			local var_5_8 = var_5_2.position_in_grid

			Engine.CEJJDJJHIJ(arg_5_0, "dlog_event_store_qm_item_browse", {
				store_name = var_5_0.storeName,
				store_session_id = var_5_0.id,
				source = var_5_1,
				region = var_5_0.storeRegion,
				store_layout = var_5_0.storeLayout,
				item_id = var_5_5,
				item_name = var_5_6,
				bundle_id = var_5_7,
				start_time = var_5_3,
				end_time = var_5_4,
				interacted = arg_5_1,
				item_slot_in_category = var_5_8
			})
		end

		QUARTERMASTER.itemData = nil
	end
end

function QUARTERMASTER.BeginMenuBrowseEvent(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	if QUARTERMASTER.dlogEnabled then
		local var_6_0 = {
			storeLayout = arg_6_3,
			recommendationData = arg_6_4
		}

		QUARTERMASTER.RefreshStoreSession(arg_6_0, var_6_0)

		local var_6_1 = QUARTERMASTER.storeSession

		QUARTERMASTER.itemData = {}
		QUARTERMASTER.itemData.sessionId = var_6_1.id
		QUARTERMASTER.itemData.start_time = os.time()
		QUARTERMASTER.itemData.category_index = arg_6_1.categoryIndex
		QUARTERMASTER.itemData.category_name = arg_6_1.name
		QUARTERMASTER.itemData.item_id = arg_6_2.id or 0
		QUARTERMASTER.itemData.item_name = arg_6_2.name
		QUARTERMASTER.itemData.position_in_grid = arg_6_2.positionInGrid or 0
	end
end

function QUARTERMASTER.RecordMenuBrowseEvent(arg_7_0, arg_7_1, arg_7_2)
	if QUARTERMASTER.dlogEnabled then
		local var_7_0 = QUARTERMASTER.storeSession

		if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId == var_7_0.id then
			local var_7_1 = QUARTERMASTER.GetMenuSource(arg_7_2)
			local var_7_2 = QUARTERMASTER.itemData
			local var_7_3 = var_7_2.start_time
			local var_7_4 = os.time()
			local var_7_5 = var_7_2.category_index
			local var_7_6 = var_7_2.category_name
			local var_7_7 = var_7_2.item_id
			local var_7_8 = var_7_2.item_name
			local var_7_9 = var_7_2.position_in_grid

			Engine.CEJJDJJHIJ(arg_7_0, "dlog_event_store_qm_menu_browse", {
				store_name = var_7_0.storeName,
				store_session_id = var_7_0.id,
				source = var_7_1,
				region = var_7_0.storeRegion,
				store_layout = var_7_0.storeLayout,
				category_index = var_7_5,
				category_name = var_7_6,
				item_id = var_7_7,
				item_name = var_7_8,
				start_time = var_7_3,
				end_time = var_7_4,
				interacted = arg_7_1,
				item_slot_in_category = var_7_9
			})
		end

		QUARTERMASTER.itemData = nil
	end
end

function QUARTERMASTER.RecordPurchaseConfirmEvent(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	if QUARTERMASTER.dlogEnabled then
		QUARTERMASTER.RefreshStoreSession(arg_8_0, arg_8_4)

		local var_8_0 = QUARTERMASTER.storeSession
		local var_8_1 = false
		local var_8_2 = QUARTERMASTER.GetMenuSource(arg_8_4.source)
		local var_8_3 = {
			store_name = var_8_0.storeName,
			store_session_id = var_8_0.id,
			source = var_8_2,
			region = var_8_0.storeRegion,
			store_layout = var_8_0.storeLayout,
			category_index = arg_8_4.categoryIndex,
			category_name = arg_8_4.categoryName,
			item_id = arg_8_4.itemID,
			item_name = arg_8_4.itemName,
			current_menu = LUI.FlowManager.GetMenuNameAtIndex(-1),
			previous_menu = arg_8_1,
			purchased = arg_8_2,
			err = var_8_1 or arg_8_3,
			item_slot_in_category = arg_8_4.positionInGrid
		}

		Engine.CEJJDJJHIJ(arg_8_0, "dlog_event_store_qm_item_purchase", var_8_3)
	end
end

function QUARTERMASTER.FlushData(arg_9_0)
	QUARTERMASTER.RecordMenuBrowseEvent(arg_9_0, false)
end
