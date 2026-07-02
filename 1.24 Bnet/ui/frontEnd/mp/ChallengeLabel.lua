module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.ID
	local var_1_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.id, var_1_0, CSV.allChallengesTable.cols.desc)

	if var_1_1 and #var_1_1 > 0 then
		arg_1_0.ChallengeName:setText(Engine.CBBHFCGDIC(var_1_1))
	end

	if arg_1_1.progressPercentage then
		arg_1_0.ProgressBar.Fill:SetRightAnchor(1 - arg_1_1.progressPercentage, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.ChallengeName)
	assert(arg_2_0.ProgressBar)

	arg_2_0.SetupChallengeInfo = var_0_0
end

function ChallengeLabel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 410 * _1080p, 0, 40 * _1080p)

	var_3_0.id = "ChallengeLabel"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "ChallengeName"

	var_3_4:SetRGBFromTable(SWATCHES.Lobby.Accent, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetStartupDelay(1000)
	var_3_4:SetLineHoldTime(400)
	var_3_4:SetAnimMoveTime(150)
	var_3_4:SetEndDelay(1000)
	var_3_4:SetCrossfadeTime(400)
	var_3_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_4:SetMaxVisibleLines(1)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 346, 0, _1080p * 18)
	var_3_0:addElement(var_3_4)

	var_3_0.ChallengeName = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ProgressBar"

	var_3_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -10, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.ProgressBar = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("OperationStatus", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ChallengeStatus"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -44, _1080p * -4, 0, _1080p * 40)
	var_3_0:addElement(var_3_8)

	var_3_0.ChallengeStatus = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ChallengeLabel", ChallengeLabel)
LockTable(_M)
