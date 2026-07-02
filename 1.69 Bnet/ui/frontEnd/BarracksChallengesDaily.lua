module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = MenuBuilder.BuildRegisteredType("BarracksChallengeItem", {
		controllerIndex = arg_1_1
	})

	var_1_0:Setup(arg_1_0, arg_1_2)

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_2_0
	})

	var_2_0.id = "challengeHeader" .. arg_2_1

	var_2_0.Title:setText(arg_2_1)
	var_2_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)

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
	arg_6_0.Grid:closeChildren()

	if (CONDITIONS.IsWZWipFlowEnabled() or not Dvar.IBEGCHEFE("OKPORRORMM") and not Engine.CFHBIHABCB(arg_6_1)) and not CONDITIONS.IsLazeOrOutrun() then
		var_0_3(arg_6_0, arg_6_1)
		arg_6_0.Grid:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)
	elseif CONDITIONS.IsMagmaGameMode() then
		if not CONDITIONS.IsLazeOrOutrun() then
			var_0_3(arg_6_0, arg_6_1)
		end

		var_0_2(arg_6_0, arg_6_1)
		var_0_4(arg_6_0, arg_6_1)
		arg_6_0.Grid:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)
	elseif CONDITIONS.IsMagmaEnabled() then
		var_0_2(arg_6_0, arg_6_1)

		if not CONDITIONS.IsLazeOrOutrun() then
			var_0_3(arg_6_0, arg_6_1)
		end

		var_0_4(arg_6_0, arg_6_1)
		arg_6_0.Grid:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)
	else
		var_0_2(arg_6_0, arg_6_1)
		var_0_4(arg_6_0, arg_6_1)
		arg_6_0.Grid:SetFocusedPosition({
			x = 0,
			y = 0
		}, true)
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0
	local var_7_1 = {
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
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_2 = LUI.UIGrid.new(var_7_1)

	var_7_2.id = "Grid"

	var_7_2:setUseStencil(true)
	var_7_2:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 896, _1080p * -340, _1080p * 101)
	arg_7_0:addElement(var_7_2)

	arg_7_0.Grid = var_7_2

	arg_7_0:registerEventHandler("challenges_update_status", function(arg_8_0, arg_8_1)
		if arg_8_1.challenge then
			arg_8_0.Status:SetData(arg_8_1.challenge)

			if Dvar.IBEGCHEFE("LLQKSNOSS") then
				arg_8_0.Status:SetDifficulty(arg_8_1.challenge)
			end

			local var_8_0 = not arg_8_1.challenge.unlocked and Dvar.IBEGCHEFE("OKPORRORMM") and CONDITIONS.ShouldDisplayUpsellPopup(arg_7_1)

			arg_7_0.BarracksUpsellPurchaseButton:SetFocusable(var_8_0)
			arg_7_0.BarracksUpsellPurchaseButton:Enable(var_8_0)
			arg_7_0.Status:SetChallengeLocked(not arg_8_1.challenge.unlocked)
		end
	end)

	arg_7_0._BRChallenges = Challenge.GetBRDailyChallenges(arg_7_1)
	arg_7_0._coreChallenges = Challenge.GetDailyChallenges(arg_7_1)
	arg_7_0._CPChallenges = Challenge.GetCPDailyChallenges(arg_7_1)

	if arg_7_0._BRChallenges and #arg_7_0._BRChallenges > 0 or arg_7_0._coreChallenges and #arg_7_0._coreChallenges > 0 then
		arg_7_0.Grid:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_7_0, "ShowChallenges")
		var_0_5(arg_7_0, arg_7_1)
	else
		arg_7_0.Grid:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_7_0, "HideChallenges")
	end

	arg_7_0.ChallengeResetTimer:SetupLeftAlignment()
	Challenge.SetupDailyResetTimer(arg_7_0.ChallengeResetTimer, arg_7_0.ChallengeResetTimer.Text, true)
	arg_7_0.ChallengeResetTimer:SetupAlignment()
	arg_7_0:addEventHandler("new_daily_challenges", function(arg_9_0, arg_9_1)
		arg_7_0._coreChallenges = Challenge.GetDailyChallenges(arg_7_1)

		var_0_5(arg_9_0, arg_7_1)
	end)
	arg_7_0:addEventHandler("new_cp_daily_challenges", function(arg_10_0, arg_10_1)
		arg_7_0._CPChallenges = Challenge.GetCPDailyChallenges(arg_7_1)

		var_0_5(arg_10_0, arg_7_1)
	end)
	arg_7_0:addEventHandler("new_br_daily_challenges", function(arg_11_0, arg_11_1)
		arg_7_0._BRChallenges = Challenge.GetBRDailyChallenges(arg_7_1)

		var_0_5(arg_11_0, arg_7_1)
	end)
end

function BarracksChallengesDaily(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "BarracksChallengesDaily"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("BarracksChallengeStatus", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "Status"

	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 967, _1080p * 1392, _1080p * 216, _1080p * 616)
	var_12_0:addElement(var_12_4)

	var_12_0.Status = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIText.new()

	var_12_6.id = "NoChallengesLabel"

	var_12_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_6:SetAlpha(0, 0)
	var_12_6:setText(Engine.CBBHFCGDIC("CHALLENGE/NONE_AVAILABLE"), 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_6:SetAlignment(LUI.Alignment.Center)
	var_12_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -12, _1080p * 12)
	var_12_0:addElement(var_12_6)

	var_12_0.NoChallengesLabel = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "ChallengeResetTimer"

	var_12_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 174, _1080p * 166, _1080p * 196)
	var_12_0:addElement(var_12_8)

	var_12_0.ChallengeResetTimer = var_12_8

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("BarracksUpsellPurchaseButton", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "BarracksUpsellPurchaseButton"

	var_12_10:SetAlpha(0, 0)
	var_12_10.Desc:setText(Engine.CBBHFCGDIC("INGAMESTORE/UPSELL_DAILY"), 0)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 967, _1080p * 1377, _1080p * 665, _1080p * 995)
	var_12_0:addElement(var_12_10)

	var_12_0.BarracksUpsellPurchaseButton = var_12_10

	local function var_12_11()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_11

	local var_12_12
	local var_12_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("HideChallenges", var_12_13)

	local var_12_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("HideChallenges", var_12_14)

	local function var_12_15()
		var_12_4:AnimateSequence("HideChallenges")
		var_12_6:AnimateSequence("HideChallenges")
	end

	var_12_0._sequences.HideChallenges = var_12_15

	local var_12_16
	local var_12_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ShowChallenges", var_12_17)

	local var_12_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ShowChallenges", var_12_18)

	local function var_12_19()
		var_12_4:AnimateSequence("ShowChallenges")
		var_12_6:AnimateSequence("ShowChallenges")
	end

	var_12_0._sequences.ShowChallenges = var_12_19

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("BarracksChallengesDaily", BarracksChallengesDaily)
LockTable(_M)
