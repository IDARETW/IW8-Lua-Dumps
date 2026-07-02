module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Row)

	arg_1_0._helperText = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")

	local var_1_0 = CoD.GetPlatformPresence()

	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = arg_1_1
		end

		local var_2_1 = arg_1_0.Row._data
		local var_2_2 = ""

		if var_2_1 then
			local var_2_3 = var_2_1.Platform

			if var_2_3 and #var_2_3 > 0 and not Engine.CGABICJHAI() then
				local var_2_4 = Leaderboards.ConvertToClientPlatform(tonumber(var_2_3))

				if var_1_0 == var_2_4 then
					var_2_2 = arg_1_0._helperText
				end
			end
		end

		local var_2_5 = arg_2_0:GetCurrentMenu()

		if var_2_5 then
			assert(var_2_5.ButtonHelperBar)
			arg_1_0:AddButtonHelperTextToElement(var_2_5.ButtonHelperBar, {
				side = "left",
				button_ref = "button_primary",
				priority = 1,
				helper_text = var_2_2
			})
		end
	end)

	if Engine.HDGDBCJFG() then
		arg_1_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			local var_3_0 = arg_1_0.Row._data
			local var_3_1 = var_3_0.Platform

			if var_3_0 and var_3_0.xuid and var_3_1 and #var_3_1 > 0 then
				local var_3_2 = Leaderboards.ConvertToClientPlatform(tonumber(var_3_1))

				if var_1_0 == var_3_2 and not Social.BFEBABDDDE(arg_1_1, var_3_0.xuid, "PlatformIdForViewProfile") then
					local var_3_3 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

					LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_1_1, false, {
						message = var_3_3
					})
				end
			end
		end)
	end
end

function LeaderboardRowButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "LeaderboardRowButton"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LeaderboardRow", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Row"

	var_4_4:SetDataSourceThroughElement(var_4_0, nil)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_4_0:addElement(var_4_4)

	var_4_0.Row = var_4_4

	var_4_4:SetDataSourceThroughElement(var_4_0, nil)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LeaderboardRowButton", LeaderboardRowButton)
LockTable(_M)
