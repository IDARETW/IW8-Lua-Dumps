module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = WORLD_MAP.GetOperationFactionDetails()

	arg_1_0.LeadFactionDetails:SetupDetails(var_1_0.leadFactionDetails)
	arg_1_0.OperationDetails:SetupDetails(var_1_0.operationDetails)
end

function FactionDetails(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 360 * _1080p)

	var_2_0.id = "FactionDetails"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "FactionDetails"

	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU/FACTION_DETAILS"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 320, 0, _1080p * 22)
	var_2_0:addElement(var_2_4)

	var_2_0.FactionDetails = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("FactionDetailsItem", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "LeadFactionDetails"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 40, _1080p * 180)
	var_2_0:addElement(var_2_6)

	var_2_0.LeadFactionDetails = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("FactionDetailsItem", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "OperationDetails"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 203, _1080p * 343)
	var_2_0:addElement(var_2_8)

	var_2_0.OperationDetails = var_2_8

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("FactionDetails", FactionDetails)
LockTable(_M)
