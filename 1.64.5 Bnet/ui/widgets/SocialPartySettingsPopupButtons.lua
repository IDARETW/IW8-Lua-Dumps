module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function SocialPartySettingsPopupButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 221 * _1080p)

	var_2_0.id = "SocialPartySettingsPopupButtons"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(5 * _1080p)

	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "Privacy"

	var_2_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_4:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY")), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 20)
	var_2_0:addElement(var_2_4)

	var_2_0.Privacy = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Spacer3"

	var_2_6:SetRGBFromInt(0, 0)
	var_2_6:SetAlpha(0, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 25, _1080p * 35)
	var_2_0:addElement(var_2_6)

	var_2_0.Spacer3 = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("SocialPrivacyCheckboxButton", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "PublicButton"

	var_2_8.Mode:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_PUBLIC"), 0)
	var_2_8.ModeDesc:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_PUBLIC_DESC"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 97)
	var_2_0:addElement(var_2_8)

	var_2_0.PublicButton = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("SocialPrivacyCheckboxButton", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "FriendsOnlyButton"

	var_2_10.Mode:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS"), 0)
	var_2_10.ModeDesc:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS_DESC"), 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 102, _1080p * 159)
	var_2_0:addElement(var_2_10)

	var_2_0.FriendsOnlyButton = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("SocialPrivacyCheckboxButton", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "InviteOnlyButton"

	var_2_12.Mode:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_INVITE_ONLY"), 0)
	var_2_12.ModeDesc:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_INVITE_ONLY_DESC"), 0)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 164, _1080p * 221)
	var_2_0:addElement(var_2_12)

	var_2_0.InviteOnlyButton = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("SocialPrivacyCheckboxButton", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "ClosedButton"

	var_2_14.Mode:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_CLOSED"), 0)
	var_2_14.ModeDesc:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_CLOSED_DESC"), 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 226, _1080p * 290)
	var_2_0:addElement(var_2_14)

	var_2_0.ClosedButton = var_2_14

	local function var_2_15()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_15

	local var_2_16
	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 33
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_17)

	local function var_2_18()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_18

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SocialPartySettingsPopupButtons", SocialPartySettingsPopupButtons)
LockTable(_M)
