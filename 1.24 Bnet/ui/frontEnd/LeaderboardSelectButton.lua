module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.controller or arg_1_1

		if arg_1_0:GetDataSource().ref:GetValue(var_2_0) ~= nil then
			local var_2_1 = {
				filterType = "Friends",
				leaderboardType = arg_1_0:GetDataSource().ref:GetValue(var_2_0)
			}

			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, var_2_0, false, var_2_1, true)
		end
	end)

	local function var_1_0()
		local var_3_0 = arg_1_0:GetDataSource().ref:GetValue(arg_1_1)

		if var_3_0 ~= nil then
			if Leaderboards.GetLeaderboardDisabled(var_3_0) == true then
				arg_1_0:SetButtonDisabled(true)
			else
				arg_1_0:SetButtonDisabled(false)
			end
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "ref", var_1_0)
end

function LeaderboardSelectButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "LeaderboardSelectButton"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	local function var_4_3()
		local var_5_0 = var_4_0:GetDataSource().desc:GetValue(var_4_1)

		if var_5_0 ~= nil then
			var_4_0.buttonDescription = var_5_0
		end
	end

	var_4_0:SubscribeToModelThroughElement(var_4_0, "desc", var_4_3)

	local var_4_4
	local var_4_5 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_5.id = "GenericButton"

	var_4_5.Text:SetLeft(_1080p * 20, 0)
	var_4_5.Text:SetAlignment(LUI.Alignment.Left)
	var_4_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_4_6()
		local var_6_0 = var_4_0:GetDataSource().desc:GetValue(var_4_1)

		if var_6_0 ~= nil then
			var_4_5.buttonDescription = var_6_0
		end
	end

	var_4_5:SubscribeToModelThroughElement(var_4_0, "desc", var_4_6)

	local function var_4_7()
		local var_7_0 = var_4_0:GetDataSource().name:GetValue(var_4_1)

		if var_7_0 ~= nil then
			var_4_5.Text:setText(ToUpperCase(var_7_0), 0)
		end
	end

	var_4_5:SubscribeToModelThroughElement(var_4_0, "name", var_4_7)
	var_4_0:addElement(var_4_5)

	var_4_0.GenericButton = var_4_5

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LeaderboardSelectButton", LeaderboardSelectButton)
LockTable(_M)
