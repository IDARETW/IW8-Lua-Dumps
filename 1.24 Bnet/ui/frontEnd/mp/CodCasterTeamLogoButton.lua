module(..., package.seeall)

function CodCasterTeamLogoButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 290 * _1080p, 0, 290 * _1080p)

	var_1_0.id = "CodCasterTeamLogoButton"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "LoadoutItemButtonBackground"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.LoadoutItemButtonBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TeamLogo"

	var_1_6:setImage(RegisterMaterial("icon_faction_west_gray_large"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 290, 0, _1080p * 290)
	var_1_0:addElement(var_1_6)

	var_1_0.TeamLogo = var_1_6

	return var_1_0
end

MenuBuilder.registerType("CodCasterTeamLogoButton", CodCasterTeamLogoButton)
LockTable(_M)
