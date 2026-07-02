module(..., package.seeall)

local function var_0_0()
	local var_1_0 = LUI.UIText.new()

	var_1_0:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, -16 * _1080p, 0)
	var_1_0:SetAlpha(0)
	var_1_0:SetRGBFromTable(SWATCHES.text.buildNumber)
	var_1_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_0:SetAlignment(LUI.Alignment.Right)

	var_1_0.id = "buildAndServerText"

	local var_1_1 = LUI.DataSourceInGlobalModel.new("cg.debug.buildAndServerNumbers")

	var_1_0:SubscribeToModel(var_1_1:GetModel(0), function(arg_2_0)
		local var_2_0 = DataModel.JJEHAEBDF(arg_2_0)

		if var_2_0 and #var_2_0 > 0 then
			var_1_0:setText(var_2_0)
		end
	end)

	local var_1_2 = LUI.DataSourceInGlobalModel.new("cg.debug.buildAndServerTextVisible")

	var_1_0:SubscribeToModel(var_1_2:GetModel(0), function(arg_3_0)
		if DataModel.JJEHAEBDF(arg_3_0) then
			var_1_0:SetAlpha(1)
		else
			var_1_0:SetAlpha(0)
		end
	end)

	return var_1_0
end

local function var_0_1()
	local var_4_0 = LUI.UIText.new()

	var_4_0:SetAnchorsAndPosition(0, 0, 1, 0, 5, 0, -5 - 16 * _1080p, -5)
	var_4_0:SetRGBFromTable(SWATCHES.text.buildNumber)
	var_4_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_0:SetAlpha(1)

	var_4_0.id = "MatchID"

	local var_4_1 = LUI.DataSourceInGlobalModel.new("cg.matchID")

	var_4_0:SubscribeToModel(var_4_1:GetModel(0), function(arg_5_0)
		local var_5_0 = DataModel.JJEHAEBDF(arg_5_0)

		if not var_5_0 then
			return
		end

		local var_5_1

		if IsPrivateMatch() then
			var_5_1 = {
				"0",
				"2",
				"4",
				"8"
			}
		elseif Dvar.IBEGCHEFE("MMQRPRONNQ") then
			var_5_1 = {
				"1",
				"3",
				"7"
			}
		else
			var_5_1 = {
				"5",
				"9"
			}
		end

		local var_5_2 = var_5_1[math.random(#var_5_1)]

		var_4_0:setText(var_5_0 .. var_5_2)
	end)

	return var_4_0
end

MenuBuilder.registerType("MatchID", var_0_1)
MenuBuilder.registerType("BuildAndServerText", var_0_0)
LockTable(_M)
