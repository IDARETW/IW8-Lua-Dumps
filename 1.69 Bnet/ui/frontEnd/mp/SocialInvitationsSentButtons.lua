module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Buttons = {
		[FRIENDS.INVITATIONS.BUTTONS.REVOKE] = arg_1_0.RevokeButton,
		[FRIENDS.INVITATIONS.BUTTONS.INSPECT] = arg_1_0.InspectButton
	}

	for iter_1_0, iter_1_1 in pairs(arg_1_0.Buttons) do
		iter_1_1:setGainFocusSFX(SOUND_SETS.mpMainMenu.move)
		iter_1_1:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown)
	end
end

function SocialInvitationsSentButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 218 * _1080p)

	var_2_0.id = "SocialInvitationsSentButtons"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(6 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "RevokeButton"

	var_2_4.Text:SetLeft(_1080p * 20, 0)
	var_2_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("INBOX/REVOKE_INVITE")), 0)
	var_2_4.Text:SetAlignment(LUI.Alignment.Center)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 445, 0, _1080p * 50)
	var_2_0:addElement(var_2_4)

	var_2_0.RevokeButton = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "InspectButton"

	var_2_6.Text:SetLeft(_1080p * 20, 0)
	var_2_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("INBOX/INSPECT_PLAYER")), 0)
	var_2_6.Text:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 445, _1080p * 56, _1080p * 106)
	var_2_0:addElement(var_2_6)

	var_2_0.InspectButton = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SocialInvitationsSentButtons", SocialInvitationsSentButtons)
LockTable(_M)
