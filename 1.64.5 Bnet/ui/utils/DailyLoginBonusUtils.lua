DLB = DLB or {}

function DLB.OpenDLBWindowIfRequired(arg_1_0)
	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() or not Engine.CCGJCIECBJ(arg_1_0) or not Dvar.IBEGCHEFE("SKOOSRKKK") then
		return
	end

	local var_1_0 = DailyLogin.EDAIABDGI(arg_1_0)
	local var_1_1 = var_1_0.IsNew
	local var_1_2 = var_1_0.LootID

	if var_1_1 or Dvar.IBEGCHEFE("RKRMTLOLQ") == true then
		local var_1_3 = {
			popupTitle = Engine.CBBHFCGDIC("LUA_MENU_MP/DAILY_LOGIN_TITLE"),
			rewardDescription = Engine.CBBHFCGDIC("LUA_MENU_MP/DAILY_LOGIN_MESSAGE")
		}
		local var_1_4 = LOOT.GetTypeForID(var_1_2)
		local var_1_5 = LOOT.GetItemRef(var_1_4, var_1_2)

		var_1_3.itemName = LOOT.GetItemName(var_1_4, var_1_5)
		var_1_3.itemImage = LOOT.GetItemImage(var_1_4, var_1_5)
		var_1_3.itemCount = 1
		var_1_3.openSound = "ui_iw7_daily_popup"

		if var_1_3.itemCount > 0 then
			LUI.FlowManager.RequestPopupMenu(unused, "RewardPopup", false, arg_1_0, false, var_1_3, nil, true, true)
		end

		DailyLogin.BAIFGFJDFG(arg_1_0)
	end
end
