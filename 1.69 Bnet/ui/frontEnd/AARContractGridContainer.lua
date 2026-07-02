module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		local var_1_0 = arg_1_0:getFirstChild()

		while var_1_0 do
			if var_1_0.SetupAARContractGridItem then
				local var_1_1 = var_1_0

				var_1_0 = var_1_0:getNextSibling()

				arg_1_0:RemoveElement(var_1_1)
			else
				var_1_0 = var_1_0:getNextSibling()
			end
		end

		for iter_1_0 = 0, AAR.MAX_NUM_AAR_CONTRACT_DATA_CHUNKS - 1 do
			local var_1_2 = arg_1_2["contract" .. iter_1_0 .. "NumCompleted"]

			if var_1_2 and var_1_2 > 0 then
				local var_1_3 = arg_1_2["contract" .. iter_1_0 .. "Id"]
				local var_1_4 = "AAR/CHALLENGES"
				local var_1_5 = "icon_xp_token_large"
				local var_1_6 = var_1_4
				local var_1_7 = var_1_5

				if var_1_3 then
					local var_1_8 = StringTable.BJJBBCJGEJ(CSV.BRMissions.file, CSV.BRMissions.cols.index, var_1_3)
					local var_1_9 = CSV.ReadRow(CSV.BRMissions, var_1_8)

					var_1_6 = not var_1_9.title or var_1_9.title == "" and var_1_4 or var_1_9.title
					var_1_7 = not var_1_9.aarIcon or var_1_9.aarIcon == "" and var_1_5 or var_1_9.aarIcon
				end

				local var_1_10 = MenuBuilder.BuildRegisteredType("AARContractGridItem", {
					controllerIndex = arg_1_1
				})

				var_1_10:SetupAARContractGridItem({
					contractTypeStr = var_1_6,
					contractIcon = var_1_7,
					numCompleted = var_1_2
				})
				arg_1_0:addElement(var_1_10)
			end
		end
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupContractGrid = var_0_0
end

function AARContractGridContainer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1052 * _1080p, 0, 581 * _1080p)

	var_3_0.id = "AARContractGridContainer"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(75 * _1080p)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("AARContractGridItem", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Contract1"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 575)
	var_3_0:addElement(var_3_4)

	var_3_0.Contract1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARContractGridItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Contract2"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 375, _1080p * 675, 0, _1080p * 575)
	var_3_0:addElement(var_3_6)

	var_3_0.Contract2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("AARContractGridItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Contract3"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1050, 0, _1080p * 575)
	var_3_0:addElement(var_3_8)

	var_3_0.Contract3 = var_3_8

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARContractGridContainer", AARContractGridContainer)
LockTable(_M)
