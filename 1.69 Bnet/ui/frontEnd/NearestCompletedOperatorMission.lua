module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not arg_1_1 or arg_1_1.complete or not arg_1_1.unlocked or arg_1_1.isBattlePassLocked then
		arg_1_0:SetAlpha(0)

		return
	end

	if arg_1_1.name and #arg_1_1.name > 0 then
		arg_1_0.MissionName:setText(Engine.CBBHFCGDIC(arg_1_1.name))
	else
		arg_1_0.MissionName:setText("")
	end

	local var_1_0 = 1

	if arg_1_1.numObjectivesComplete then
		var_1_0 = math.min(arg_1_1.numObjectivesComplete + 1, #arg_1_1.objectives)
	end

	local var_1_1

	if arg_1_1.objectives and #arg_1_1.objectives > 1 then
		var_1_1 = arg_1_1.objectives[var_1_0]

		arg_1_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", var_1_0, #arg_1_1.objectives))
	else
		var_1_1 = arg_1_1

		arg_1_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", 1, 1))
	end

	arg_1_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_1_1.desc, var_1_1.amount))

	local var_1_2 = var_1_1.amountEarned / var_1_1.amountNeeded

	arg_1_0.ObjectivesProgressBar:SetProgress(var_1_2)
	arg_1_0.ObjectivesProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_1.amountEarned, var_1_1.amountNeeded))
	arg_1_0:SetAlpha(1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetMission = var_0_0
end

function NearestCompletedOperatorMission(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 200 * _1080p)

	var_3_0.id = "NearestCompletedOperatorMission"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_3_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "MissionHeader"

	var_3_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/NEAREST_COMPLETE_MISSION"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 6, _1080p * -10, 0, _1080p * 46)
	var_3_0:addElement(var_3_6)

	var_3_0.MissionHeader = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "MissionName"

	var_3_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(2000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(2000)
	var_3_8:SetAnimMoveSpeed(150)
	var_3_8:SetEndDelay(2000)
	var_3_8:SetCrossfadeTime(250)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -7, _1080p * 56, _1080p * 74)
	var_3_0:addElement(var_3_8)

	var_3_0.MissionName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "ObjectivesTitle"

	var_3_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -14, _1080p * 74, _1080p * 96)
	var_3_0:addElement(var_3_10)

	var_3_0.ObjectivesTitle = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "ObjectivesDescription"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_12:setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -14, _1080p * 139, _1080p * 161)
	var_3_0:addElement(var_3_12)

	var_3_0.ObjectivesDescription = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "ObjectivesProgressBar"

	var_3_14.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_14.Overlay:SetAlpha(0.2, 0)
	var_3_14.Fill:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -10, _1080p * 170, _1080p * -13)
	var_3_0:addElement(var_3_14)

	var_3_0.ObjectivesProgressBar = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "ObjectivesProgressDesc"

	var_3_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_16:setText("99/99", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, _1080p * -14, _1080p * 170, _1080p * 188)
	var_3_0:addElement(var_3_16)

	var_3_0.ObjectivesProgressDesc = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("NearestCompletedOperatorMission", NearestCompletedOperatorMission)
LockTable(_M)
