module(..., package.seeall)

function SocialChallengeCard(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -300 * _1080p, 300 * _1080p, -100 * _1080p, 100 * _1080p)

	var_1_0.id = "SocialChallengeCard"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "ToggleActiveButton"

	var_1_4.Text:setText(ToUpperCase("Toggle Active"), 0)
	var_1_4.Text:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 268, _1080p * 143, _1080p * 183)
	var_1_0:addElement(var_1_4)

	var_1_0.ToggleActiveButton = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "IncrementValueButton"

	var_1_6.Text:setText(ToUpperCase("Increment Value"), 0)
	var_1_6.Text:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 281, _1080p * 590, _1080p * 143, _1080p * 183)
	var_1_0:addElement(var_1_6)

	var_1_0.IncrementValueButton = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Name"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 281, 0, _1080p * 18)
	var_1_0:addElement(var_1_8)

	var_1_0.Name = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "Desc"

	var_1_10:setText("Description", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 281, _1080p * 36, _1080p * 54)
	var_1_0:addElement(var_1_10)

	var_1_0.Desc = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "State"

	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 456, _1080p * 600, 0, _1080p * 18)
	var_1_0:addElement(var_1_12)

	var_1_0.State = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "Progress"

	var_1_14:setText("", 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 268, _1080p * 105, _1080p * 123)
	var_1_0:addElement(var_1_14)

	var_1_0.Progress = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("Spinner", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "SyncSpinner"

	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 280, _1080p * 317, _1080p * 64, _1080p * 114)
	var_1_0:addElement(var_1_16)

	var_1_0.SyncSpinner = var_1_16

	return var_1_0
end

MenuBuilder.registerType("SocialChallengeCard", SocialChallengeCard)
LockTable(_M)
