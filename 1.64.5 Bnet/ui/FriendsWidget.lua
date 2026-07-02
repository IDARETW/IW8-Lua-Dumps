module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function OpenFriendsList(arg_1_0)
	if IsOnlineMatch() and Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_1_0) then
		if not Engine.DBAEJAHFGJ(arg_1_0) then
			LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_1_0)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_1_0, false)
		end
	end
end

function online_friends_widget()
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(1, 0, 1, 0, -170, -130, -48, -28)

	var_2_0.id = "online_friends_widget"

	var_2_0:registerEventHandler("menu_create", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:getParent()

		if var_3_0 then
			local var_3_1 = {
				clickable = true,
				side = "right",
				name = "add_button_helper_text",
				priority = -1000,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("@LUA_MENU/FRIENDS")
			}

			var_3_0:processEvent(var_3_1)

			if Engine.BAHIIBFDDG() or Engine.CBFHIIHAGH() then
				Engine.DAGFFDGFII("friends_widget_refresh")
			end
		end
	end)

	local var_2_1 = LUI.UIBindButton.new()

	var_2_1.id = "friends_bind_buttons_id"

	var_2_1:registerEventHandler("button_alt2", function(arg_4_0, arg_4_1)
		OpenFriendsList(arg_4_1.controller)

		return true
	end)
	var_2_0:addElement(var_2_1)

	return var_2_0
end

MenuBuilder.registerType("online_friends_widget", online_friends_widget)
LockTable(_M)
