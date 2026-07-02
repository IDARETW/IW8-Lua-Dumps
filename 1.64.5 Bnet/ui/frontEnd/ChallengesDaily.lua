module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = MenuBuilder.BuildRegisteredType("BarracksChallengeItem", {
		controllerIndex = arg_1_1
	})

	var_1_0:Setup(arg_1_0, arg_1_2)
	var_1_0:SetFocusable(false)

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_2_0
	})

	var_2_0.id = "challengeHeader" .. arg_2_1

	var_2_0.Title:setText(arg_2_1)
	var_2_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 35)

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1)
	if not arg_3_0._coreChallenges or #arg_3_0._coreChallenges == 0 then
		return
	end

	if CONDITIONS.IsMagmaEnabled() then
		arg_3_0.Grid:AddElement(var_0_1(arg_3_1, Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")))
	end

	for iter_3_0, iter_3_1 in ipairs(arg_3_0._coreChallenges) do
		arg_3_0.Grid:AddElement(var_0_0(arg_3_0, arg_3_1, iter_3_1))
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if not arg_4_0._BRChallenges or #arg_4_0._BRChallenges == 0 then
		return
	end

	if Dvar.IBEGCHEFE("OKPORRORMM") or Engine.CFHBIHABCB(arg_4_1) then
		arg_4_0.Grid:AddElement(var_0_1(arg_4_1, Engine.CBBHFCGDIC("LUA_MENU/WARZONE_CAPS")))
	end

	if arg_4_0._BRChallenges and #arg_4_0._BRChallenges > 0 then
		for iter_4_0, iter_4_1 in ipairs(arg_4_0._BRChallenges) do
			arg_4_0.Grid:AddElement(var_0_0(arg_4_0, arg_4_1, iter_4_1))
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	if not arg_5_0._CPChallenges or #arg_5_0._CPChallenges == 0 then
		return
	end

	if CONDITIONS.IsMagmaEnabled() then
		arg_5_0.Grid:AddElement(var_0_1(arg_5_1, Engine.CBBHFCGDIC("LUA_MENU/COOP_OPERATIONS_CAPS")))
	end

	if arg_5_0._CPChallenges and #arg_5_0._CPChallenges > 0 then
		for iter_5_0, iter_5_1 in ipairs(arg_5_0._CPChallenges) do
			arg_5_0.Grid:AddElement(var_0_0(arg_5_0, arg_5_1, iter_5_1))
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	if not Dvar.IBEGCHEFE("OKPORRORMM") and not Engine.CFHBIHABCB(arg_6_1) then
		var_0_3(arg_6_0, arg_6_1)
	elseif CONDITIONS.IsMagmaGameMode() then
		var_0_3(arg_6_0, arg_6_1)
		var_0_2(arg_6_0, arg_6_1)
		var_0_4(arg_6_0, arg_6_1)
	elseif CONDITIONS.IsMagmaEnabled() then
		var_0_2(arg_6_0, arg_6_1)
		var_0_3(arg_6_0, arg_6_1)
		var_0_4(arg_6_0, arg_6_1)
	else
		var_0_2(arg_6_0, arg_6_1)
		var_0_4(arg_6_0, arg_6_1)
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	arg_7_0._BRChallenges = arg_7_2
	arg_7_0._coreChallenges = arg_7_3
	arg_7_0._CPChallenges = arg_7_4
	arg_7_0._gridInitialized = true

	local var_7_0 = {
		buildArrowsLabel = true,
		maxRows = 12,
		maxVisibleRows = 12,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		controllerIndex = arg_7_1,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}

	arg_7_0.Grid = LUI.UIGrid.new(var_7_0)
	arg_7_0.Grid.id = "Grid"

	arg_7_0.Grid:setUseStencil(true)
	arg_7_0.Grid:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 10, _1080p * -15)
	arg_7_0.Grid:SetMouseFocusBlocker(true)
	arg_7_0:addElement(arg_7_0.Grid)

	if arg_7_0._BRChallenges and #arg_7_0._BRChallenges > 0 or arg_7_0._coreChallenges and #arg_7_0._coreChallenges > 0 then
		var_0_5(arg_7_0, arg_7_1)
	end
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.Setup = var_0_6

	arg_8_0.ChallengeResetTimer:SetupRightAlignment()
	Challenge.SetupDailyResetTimer(arg_8_0.ChallengeResetTimer, arg_8_0.ChallengeResetTimer.Text, true)
	arg_8_0.ChallengeResetTimer:SetupAlignment()

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_8_0, "AR")
	end

	arg_8_0:addEventHandler("new_daily_challenges", function(arg_9_0, arg_9_1)
		arg_8_0._coreChallenges = Challenge.GetDailyChallenges(arg_8_1)

		if arg_8_0._gridInitialized then
			var_0_5(arg_9_0, arg_8_1)
		end
	end)
	arg_8_0:addEventHandler("new_br_daily_challenges", function(arg_10_0, arg_10_1)
		arg_8_0._BRChallenges = Challenge.GetBRDailyChallenges(arg_8_1)

		if arg_8_0._gridInitialized then
			var_0_5(arg_10_0, arg_8_1)
		end
	end)
end

function ChallengesDaily(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 840 * _1080p, 0, 830 * _1080p)

	var_11_0.id = "ChallengesDaily"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "Background"

	var_11_4:SetAlpha(0.5, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "ChallengeResetTimer"

	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 322, _1080p * 400, _1080p * 8, _1080p * 38)
	var_11_0:addElement(var_11_6)

	var_11_0.ChallengeResetTimer = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "ChallengeHeader"

	var_11_8:SetAlpha(0, 0)
	var_11_8.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES"), 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -420, _1080p * -157, 0, _1080p * 46)
	var_11_0:addElement(var_11_8)

	var_11_0.ChallengeHeader = var_11_8

	local function var_11_9()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_9

	local var_11_10
	local var_11_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -442
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -324
		}
	}

	var_11_6:RegisterAnimationSequence("AR", var_11_11)

	local function var_11_12()
		var_11_6:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_12

	var_0_7(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("ChallengesDaily", ChallengesDaily)
LockTable(_M)
