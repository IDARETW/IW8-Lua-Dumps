DCR = DCR or {}

function DCR.OpenDCRWindowIfRequired(arg_1_0)
	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() or not Engine.CCGJCIECBJ(arg_1_0) or not Dvar.IBEGCHEFE("MTTTSLOPQR") then
		return
	end

	local var_1_0 = DailyChurnLogin.EDAIABDGI(arg_1_0)
	local var_1_1 = var_1_0.ProductID or 0

	if (var_1_0.IsNew or false) and var_1_1 > 0 or Dvar.IBEGCHEFE("MMNMNOLQTT") == true then
		local var_1_2 = {
			popupTitle = Engine.CBBHFCGDIC(Dvar.DHEEJCCJBH("LTKLKQSKOK")),
			rewardDescription = Engine.CBBHFCGDIC(Dvar.DHEEJCCJBH("MTMTMOLRQK")),
			confirmText = Engine.CBBHFCGDIC(Dvar.DHEEJCCJBH("NTPPOMPLQM"))
		}

		var_1_2.openSound = "ui_iw7_daily_popup"

		local var_1_3 = {
			itemID = var_1_1
		}

		var_1_3.type = LOOT.GetTypeForID(tonumber(var_1_3.itemID)) or "xp"
		var_1_3.ref = LOOT.GetItemRef(var_1_3.type, var_1_3.itemID)
		var_1_3.name = LOOT.GetItemName(var_1_3.type, var_1_3.ref)
		var_1_3.image = LOOT.GetItemImage(var_1_3.type, var_1_3.ref, var_1_3.itemID)
		var_1_3.rarity = LOOT.GetItemQuality(var_1_3.type, var_1_3.ref, var_1_3.itemID)
		var_1_3.rarityImage = LOOT.GetRarityImage(var_1_3.rarity)
		var_1_3.rarityColor = LOOT.GetRarityColor(var_1_3.rarity)
		var_1_3.className = LOOT.GetItemClassName(var_1_3.type, var_1_3.ref)
		var_1_2.lootData = var_1_3

		LUI.FlowManager.RequestPopupMenu(unused, "ChurnPopup", false, arg_1_0, false, var_1_2, nil, true, true)
		DailyChurnLogin.BAIFGFJDFG(arg_1_0)
	end
end
