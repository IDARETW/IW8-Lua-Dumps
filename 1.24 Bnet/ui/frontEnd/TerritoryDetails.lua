module(..., package.seeall)

function TerritoryDetails(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "TerritoryDetails"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "OperationName"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_1_4:setText("Operation Sandstorm", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1168, _1080p * 156, _1080p * 216)
	var_1_0:addElement(var_1_4)

	var_1_0.OperationName = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "OperationDetails"

	var_1_6:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATION_DETAILS"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 136, _1080p * 488, _1080p * 315, _1080p * 343)
	var_1_0:addElement(var_1_6)

	var_1_0.OperationDetails = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "ButtonImage"

	var_1_8:setImage(RegisterMaterial("button_alt1"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 126, _1080p * 315, _1080p * 345)
	var_1_0:addElement(var_1_8)

	var_1_0.ButtonImage = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("ClaimedTerritories", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "ClaimedTerritories"

	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 228, _1080p * 298)
	var_1_0:addElement(var_1_10)

	var_1_0.ClaimedTerritories = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("MissionDetails", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "MissionDetails"

	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 97, _1080p * 527, _1080p * 403, _1080p * 893)
	var_1_0:addElement(var_1_12)

	var_1_0.MissionDetails = var_1_12

	return var_1_0
end

MenuBuilder.registerType("TerritoryDetails", TerritoryDetails)
LockTable(_M)
