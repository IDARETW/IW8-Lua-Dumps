module(..., package.seeall)

function SocialPartyDetails(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "SocialPartyDetails"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "PartyInfo"

	var_1_4:setText("", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 31, _1080p * 190, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_4)

	var_1_0.PartyInfo = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "PartyIcon"

	var_1_6:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 26, _1080p * -13, _1080p * 13)
	var_1_0:addElement(var_1_6)

	var_1_0.PartyIcon = var_1_6

	return var_1_0
end

MenuBuilder.registerType("SocialPartyDetails", SocialPartyDetails)
LockTable(_M)
