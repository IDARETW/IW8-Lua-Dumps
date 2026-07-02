module(..., package.seeall)

local var_0_0 = {
	[0] = "PremiumPlayer",
	"NonPremiumNoUpsell",
	"NonPremiumAndWZUpsell",
	"NonPremiumAndUpsell",
	"BattlePassLocked"
}
local var_0_1 = {
	[LOOT.itemTypes.OPERATOR] = "LUA_MENU/UNLOCK_CRITERIA",
	[LOOT.itemTypes.OPERATOR_SKIN] = "LUA_MENU/UNLOCK_CRITERIA_SKIN"
}

local function var_0_2(arg_1_0)
	return CONDITIONS.IsWZWipOperatorFlowEnabled() and "WZ" .. arg_1_0 or arg_1_0
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = OPERATOR.IsMWOperator(arg_2_1)
	local var_2_1 = OPERATOR.IsT9Operator(arg_2_1)
	local var_2_2 = OPERATOR.IsS4Operator(arg_2_1)

	return var_2_0 and Engine.CFHBIHABCB(arg_2_0._controllerIndex) or var_2_1 and CONDITIONS.IsT9PremiumPlayer(arg_2_0._controllerIndex) or var_2_2 and CONDITIONS.IsS4PremiumPlayer(arg_2_0._controllerIndex)
end

local function var_0_4(arg_3_0)
	local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0.DoubleNotchedBacker:getLocalRect()

	arg_3_0:setHeight(var_3_3 - var_3_1)
end

local function var_0_5(arg_4_0)
	ACTIONS.AnimateSequence(arg_4_0, "DisplayFreeToPlayUnlockDetails")

	arg_4_0.canDisplayPopup = true

	local var_4_0 = LUI.IsLastInputKeyboardMouse(arg_4_0._controllerIndex)

	arg_4_0.PurchaseButton:SetAlpha(var_4_0 and 1 or 0)
	arg_4_0.PurchaseButton:SetButtonDisabled(not var_4_0)
	arg_4_0.PurchasePrompt:SetAlpha(var_4_0 and 0 or 1)

	if var_4_0 then
		arg_4_0:processEvent({
			name = "lose_focus"
		})
	end
end

local function var_0_6(arg_5_0, arg_5_1)
	local var_5_0 = (function()
		if arg_5_1 then
			return arg_5_0.isBundleVisible and "WZDisplayDefaultOperatorUnlockBundle" or "WZDisplayDefaultOperatorUnlock"
		end

		return arg_5_0.isBundleVisible and "WZDisplayFreeToPlayUnlockDetailsBundle" or "WZDisplayFreeToPlayUnlockDetails"
	end)()

	ACTIONS.AnimateSequence(arg_5_0, var_5_0)

	arg_5_0.canDisplayPopup = true

	arg_5_0.WZOperatorUpsellPrompt:SetAnimation(arg_5_0._controllerIndex)
end

local function var_0_7(arg_7_0)
	if arg_7_0.PurchaseButton and arg_7_0.PurchasePrompt then
		arg_7_0.PurchaseButton:SetButtonDisabled(true)
		arg_7_0.PurchasePrompt:SetAlpha(0)
		arg_7_0.PurchaseButton:SetAlpha(0)
	end
end

local function var_0_8(arg_8_0)
	ACTIONS.AnimateSequence(arg_8_0.WZOperatorUpsellPrompt, "Hidden")
end

local function var_0_9(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if arg_9_2 == LUI.GAME_SOURCE_ID.VANGUARD and arg_9_3 then
		return "LUA_MENU_FISHER/PURCHASE_OR_PLAY_VANGUARD"
	elseif arg_9_2 == LUI.GAME_SOURCE_ID.VANGUARD and not arg_9_3 then
		return "LUA_MENU_FISHER/OPERATOR_UNLOCKED_WITH_VANGUARD"
	elseif arg_9_2 == LUI.GAME_SOURCE_ID.COLD_WAR and arg_9_3 then
		return "LUA_MENU_TANGO/PURCHASE_OR_PLAY_BLACK_OPS"
	elseif arg_9_2 == LUI.GAME_SOURCE_ID.COLD_WAR and not arg_9_3 then
		return "LUA_MENU/OPERATOR_UNLOCKED_WITH_CW"
	elseif arg_9_2 ~= LUI.GAME_SOURCE_ID.COLD_WAR and arg_9_3 then
		return "LUA_MENU/PURCHASE_MW"
	elseif arg_9_1.operatorRef == OPERATOR.DominoRef then
		return "LUA_MENU/OPERATOR_UNLOCKED_WITH_MW_OR_SKIN"
	elseif arg_9_1.isLaunchOperator ~= nil and arg_9_1.isLaunchOperator == true then
		return "LUA_MENU/OPERATOR_UNLOCKED_WITH_MW"
	elseif arg_9_1.desc then
		return arg_9_1.desc
	end

	return nil
end

local function var_0_10(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2 and arg_10_1 == LUI.GAME_SOURCE_ID.VANGUARD then
		return SWATCHES.WZCH3.WZCH3VanguardGold
	elseif arg_10_2 and arg_10_1 == LUI.GAME_SOURCE_ID.COLD_WAR then
		return SWATCHES.CH2.SnipeOverlayBOColdWar
	elseif arg_10_2 then
		return SWATCHES.CH2.SnipeOverlayModernWarfare
	else
		return SWATCHES.text.primaryText
	end
end

local function var_0_11(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = OPERATOR.GetOperatorGameSourceID(arg_11_1.operatorRef)
	local var_11_1 = LUI.GetSnipeIconByGameSourceID(var_11_0, {
		size = "sm"
	})
	local var_11_2 = {
		isT9Operator = isT9,
		isS4Operator = isS4
	}
	local var_11_3 = var_0_9(arg_11_0, arg_11_1, var_11_0, arg_11_2)
	local var_11_4 = LUI.ConvertColorStringToTable(LUI.SNIPE_ICON_COLOR_BY_GAME_SOURCE[var_11_0])
	local var_11_5 = var_0_10(arg_11_0, var_11_0, arg_11_2)

	arg_11_0.MWLogo:setImage(RegisterMaterial(var_11_1))
	arg_11_0.MWLogo:SetRGBFromTable(var_11_4)
	arg_11_0.PurchaseMWLabel:setText(Engine.CBBHFCGDIC(var_11_3))
	arg_11_0.PurchaseMWLabel:SetRGBFromTable(var_11_5)
end

local function var_0_12(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.ChallengeInfo:SetupChallengeInfo(arg_12_2)
	ACTIONS.AnimateSequence(arg_12_0, var_0_2("DisplayRewardDetails"))
	arg_12_0:UpdateSize()

	arg_12_0.canDisplayPopup = false

	arg_12_0.UnlockHeader.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/TOUR_OF_DUTY"))

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_0_8(arg_12_0)
	else
		var_0_7(arg_12_0)
	end
end

local function var_0_13(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_1)
	assert(arg_13_2)
	arg_13_0.ChallengeInfo:SetupMissionChallengeInfo(OPERATOR.GetOutfitChallengeDetailsFromObjective(arg_13_1.id, arg_13_2), arg_13_1)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_0_8(arg_13_0)
	else
		var_0_7(arg_13_0)
	end
end

local function var_0_14(arg_14_0, arg_14_1)
	local var_14_0 = var_0_3(arg_14_0, arg_14_1.operatorRef)
	local var_14_1 = Dvar.IBEGCHEFE("OMPKROKQPL")
	local var_14_2 = arg_14_1.shouldHideGameUpsell or false
	local var_14_3 = arg_14_1.isUnlockedWithBattlePass or false
	local var_14_4 = var_14_3 and arg_14_1.isUnlockedWithActiveBattlePass or false
	local var_14_5 = CONDITIONS.IsWZWipOperatorFlowEnabled()

	if var_14_0 then
		return var_0_0[0]
	elseif var_14_1 then
		if CONDITIONS.IsWZWipOperatorFlowEnabled() and var_14_2 then
			return var_14_3 and var_14_4 and var_0_0[4] or var_0_0[0]
		elseif CONDITIONS.IsWZWipOperatorFlowEnabled() then
			return var_0_0[2]
		elseif arg_14_0.PurchaseButton and arg_14_0.PurchasePrompt then
			return var_0_0[3]
		end
	end

	return var_0_0[1]
end

local function var_0_15(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.ChallengeInfo:SetupLockedInfo(arg_15_2)

	local var_15_0 = var_0_14(arg_15_0, arg_15_2)

	if var_15_0 == var_0_0[0] then
		ACTIONS.AnimateSequence(arg_15_0, var_0_2("DisplayUnlockDetails"))

		arg_15_0.canDisplayPopup = false
	elseif var_15_0 == var_0_0[1] then
		ACTIONS.AnimateSequence(arg_15_0, var_0_2("DisplayFreeToPlayUnlockDetailsNoUpsell"))
		var_0_11(arg_15_0, arg_15_2, false)
	elseif var_15_0 == var_0_0[2] then
		var_0_6(arg_15_0, arg_15_2.isT9DefaultOperator)
		var_0_11(arg_15_0, arg_15_2, true)
	elseif var_15_0 == var_0_0[3] then
		var_0_5(arg_15_0)
	elseif var_15_0 == var_0_0[4] then
		ACTIONS.AnimateSequence(arg_15_0, "WZDisplayBattlePassUnlockDetails")
	end

	arg_15_0:UpdateSize()

	local var_15_1 = var_0_1[arg_15_1] or ""

	arg_15_0.UnlockHeader.Text:setText(Engine.CBBHFCGDIC(var_15_1))
end

local function var_0_16(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_3 then
		arg_16_0:SetLocked(arg_16_1, arg_16_2)
	else
		arg_16_0:SetChallenge(arg_16_1, arg_16_2)
	end
end

local function var_0_17(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	assert(arg_17_1)

	arg_17_0.isBundleVisible = arg_17_3

	var_0_16(arg_17_0, LOOT.itemTypes.OPERATOR, arg_17_1, arg_17_2)
	arg_17_0.WZOperatorUpsellPrompt:SetUpsellPrompt(arg_17_0._controllerIndex, arg_17_1, arg_17_2)
end

local function var_0_18(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_0.ChallengeInfo)

	arg_18_0._controllerIndex = arg_18_1
	arg_18_0.SetChallenge = var_0_12
	arg_18_0.SetLocked = var_0_15
	arg_18_0.SetupChallenge = var_0_16
	arg_18_0.UpdateSize = var_0_4
	arg_18_0.SetupMissionChallenge = var_0_13
	arg_18_0.Refresh = var_0_17
	arg_18_0.canDisplayPopup = false
	arg_18_0.isBundleUpsellVisible = false

	if not CONDITIONS.IsWZWipOperatorFlowEnabled() and not Engine.CFHBIHABCB(arg_18_1) and arg_18_0.PurchaseButton and arg_18_0.PurchasePrompt then
		arg_18_0.PurchaseButton:AddTooltipData(arg_18_1, {
			tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW_PROMPT")
		})
		arg_18_0:addEventHandler("update_input_type", function(arg_19_0, arg_19_1)
			local var_19_0 = LUI.IsLastInputKeyboardMouse(arg_18_0._controllerIndex) and arg_19_0.canDisplayPopup

			arg_19_0.PurchaseButton:SetAlpha(var_19_0 and 1 or 0)
			arg_19_0.PurchaseButton:SetButtonDisabled(not var_19_0)
			arg_19_0.PurchasePrompt:SetAlpha(var_19_0 and 0 or 1)

			if var_19_0 then
				arg_19_0:processEvent({
					name = "lose_focus"
				})
			end
		end)
		arg_18_0.PurchaseButton:addEventHandler("button_action", function(arg_20_0, arg_20_1)
			local var_20_0 = arg_20_1.controller or arg_18_1

			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, var_20_0, false, nil)
		end)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_0_7(arg_18_0)
		arg_18_0:addEventHandler("update_input_type", function(arg_21_0, arg_21_1)
			if LUI.IsLastInputKeyboardMouse(arg_21_1.controllerIndex) and arg_21_0.canDisplayPopup then
				ACTIONS.AnimateSequence(arg_21_0.WZOperatorUpsellPrompt, "Button")
			else
				arg_21_0:processEvent({
					name = "lose_focus"
				})
				ACTIONS.AnimateSequence(arg_21_0.WZOperatorUpsellPrompt, "Prompt")
			end
		end)
		arg_18_0.WZOperatorUpsellPrompt.UpsellButton:addEventHandler("button_action", function(arg_22_0, arg_22_1)
			local var_22_0 = arg_22_1.controller or arg_18_1

			arg_18_0.WZOperatorUpsellPrompt:OnPerformPromptAction(var_22_0)
		end)
	end
end

function OperatorChallenges(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIElement.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 175 * _1080p)

	var_23_0.id = "OperatorChallenges"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "DoubleNotchedBacker"

	var_23_4:SetAlpha(0.5, 0)
	var_23_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 175)
	var_23_0:addElement(var_23_4)

	var_23_0.DoubleNotchedBacker = var_23_4

	local var_23_5
	local var_23_6 = MenuBuilder.BuildRegisteredType("OperatorChallengeLabel", {
		controllerIndex = var_23_1
	})

	var_23_6.id = "ChallengeInfo"

	var_23_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -29, _1080p * 60, _1080p * 148)
	var_23_0:addElement(var_23_6)

	var_23_0.ChallengeInfo = var_23_6

	local var_23_7
	local var_23_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_23_1
	})

	var_23_8.id = "UnlockHeader"

	var_23_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_CRITERIA"), 0)
	var_23_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 47)
	var_23_0:addElement(var_23_8)

	var_23_0.UnlockHeader = var_23_8

	local var_23_9
	local var_23_10 = LUI.UIImage.new()

	var_23_10.id = "MWLogo"

	var_23_10:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_23_10:SetAlpha(0, 0)
	var_23_10:setImage(RegisterMaterial("logo_mw_glow"), 0)
	var_23_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 157, _1080p * 70, _1080p * 102)
	var_23_0:addElement(var_23_10)

	var_23_0.MWLogo = var_23_10

	local var_23_11
	local var_23_12 = LUI.UIStyledText.new()

	var_23_12.id = "PurchaseMWLabel"

	var_23_12:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_23_12:SetAlpha(0, 0)
	var_23_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"), 0)
	var_23_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_12:SetAlignment(LUI.Alignment.Left)
	var_23_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_23_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_23_12:SetStartupDelay(2000)
	var_23_12:SetLineHoldTime(400)
	var_23_12:SetAnimMoveTime(2000)
	var_23_12:SetAnimMoveSpeed(150)
	var_23_12:SetEndDelay(2000)
	var_23_12:SetCrossfadeTime(400)
	var_23_12:SetFadeInTime(300)
	var_23_12:SetFadeOutTime(300)
	var_23_12:SetMaxVisibleLines(2)
	var_23_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 421, _1080p * 74, _1080p * 98)
	var_23_0:addElement(var_23_12)

	var_23_0.PurchaseMWLabel = var_23_12

	local var_23_13
	local var_23_14 = MenuBuilder.BuildRegisteredType("TextDivider", {
		controllerIndex = var_23_1
	})

	var_23_14.id = "AndDivider"

	var_23_14:SetAlpha(0, 0)
	var_23_14.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/AND"), 0)
	var_23_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 383, _1080p * 119, _1080p * 149)
	var_23_0:addElement(var_23_14)

	var_23_0.AndDivider = var_23_14

	local var_23_15

	if CONDITIONS.IsOperatorUpsellEnabled() then
		var_23_15 = LUI.UIText.new()
		var_23_15.id = "PurchasePrompt"

		var_23_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
		var_23_15:SetAlpha(0, 0)
		var_23_15:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW_PROMPT"), 0)
		var_23_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_23_15:SetAlignment(LUI.Alignment.Center)
		var_23_15:SetVerticalAlignment(LUI.Alignment.Center)
		var_23_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 421, _1080p * 257, _1080p * 281)
		var_23_0:addElement(var_23_15)

		var_23_0.PurchasePrompt = var_23_15
	end

	local var_23_16

	if CONDITIONS.IsOperatorUpsellEnabled() then
		var_23_16 = MenuBuilder.BuildRegisteredType("TimedButton", {
			controllerIndex = var_23_1
		})
		var_23_16.id = "PurchaseButton"

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:SetButtonDisabled(false)
		end

		var_23_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"), 0)
		var_23_16.Text:SetAlignment(LUI.Alignment.Center)
		var_23_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 436, _1080p * 257, _1080p * 295)
		var_23_0:addElement(var_23_16)

		var_23_0.PurchaseButton = var_23_16
	end

	local var_23_17

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_23_17 = MenuBuilder.BuildRegisteredType("WZOperatorUpsellPrompt", {
			controllerIndex = var_23_1
		})
		var_23_17.id = "WZOperatorUpsellPrompt"

		var_23_17:SetAlpha(0, 0)
		var_23_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 436, _1080p * 250, _1080p * 288)
		var_23_0:addElement(var_23_17)

		var_23_0.WZOperatorUpsellPrompt = var_23_17
	end

	local function var_23_18()
		return
	end

	var_23_0._sequences.DefaultSequence = var_23_18

	local function var_23_19()
		return
	end

	var_23_0._sequences.HideFunctionalUnlocks = var_23_19

	local function var_23_20()
		return
	end

	var_23_0._sequences.ShowFunctionalUnlocks = var_23_20

	local var_23_21
	local var_23_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_23_4:RegisterAnimationSequence("DisplayRewardDetails", var_23_22)

	local var_23_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_23_6:RegisterAnimationSequence("DisplayRewardDetails", var_23_23)

	local var_23_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("DisplayRewardDetails", var_23_24)

	local var_23_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("DisplayRewardDetails", var_23_25)

	local var_23_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("DisplayRewardDetails", var_23_26)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("DisplayRewardDetails", var_23_27)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("DisplayRewardDetails", var_23_28)
	end

	local function var_23_29()
		var_23_4:AnimateSequence("DisplayRewardDetails")
		var_23_6:AnimateSequence("DisplayRewardDetails")
		var_23_10:AnimateSequence("DisplayRewardDetails")
		var_23_12:AnimateSequence("DisplayRewardDetails")
		var_23_14:AnimateSequence("DisplayRewardDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("DisplayRewardDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("DisplayRewardDetails")
		end
	end

	var_23_0._sequences.DisplayRewardDetails = var_23_29

	local var_23_30
	local var_23_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("DisplayUnlockDetails", var_23_31)

	local var_23_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_23_6:RegisterAnimationSequence("DisplayUnlockDetails", var_23_32)

	local var_23_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("DisplayUnlockDetails", var_23_33)

	local var_23_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("DisplayUnlockDetails", var_23_34)

	local var_23_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("DisplayUnlockDetails", var_23_35)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("DisplayUnlockDetails", var_23_36)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_37 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Text,
				value = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"),
				child = var_23_0.PurchaseButton.Text
			}
		}

		var_23_16:RegisterAnimationSequence("DisplayUnlockDetails", var_23_37)
	end

	local function var_23_38()
		var_23_4:AnimateSequence("DisplayUnlockDetails")
		var_23_6:AnimateSequence("DisplayUnlockDetails")
		var_23_10:AnimateSequence("DisplayUnlockDetails")
		var_23_12:AnimateSequence("DisplayUnlockDetails")
		var_23_14:AnimateSequence("DisplayUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("DisplayUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("DisplayUnlockDetails")
		end
	end

	var_23_0._sequences.DisplayUnlockDetails = var_23_38

	local var_23_39
	local var_23_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		}
	}

	var_23_4:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_40)

	local var_23_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 243
		}
	}

	var_23_6:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_41)

	local var_23_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_42)

	local var_23_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_43)

	local var_23_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_44)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_45 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_45)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_46 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_23_46)
	end

	local function var_23_47()
		var_23_4:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_23_6:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_23_10:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_23_12:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_23_14:AnimateSequence("DisplayFreeToPlayUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		end
	end

	var_23_0._sequences.DisplayFreeToPlayUnlockDetails = var_23_47

	local var_23_48
	local var_23_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_23_49)

	local var_23_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_23_6:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_23_50)

	local var_23_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_23_51)

	local var_23_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_23_52)

	local var_23_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_23_53)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_23_54)
	end

	local function var_23_55()
		var_23_4:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_23_6:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_23_10:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_23_12:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_23_14:AnimateSequence("DisplayUnlockDetailsWithPrompt")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		end
	end

	var_23_0._sequences.DisplayUnlockDetailsWithPrompt = var_23_55

	local var_23_56
	local var_23_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_23_57)

	local var_23_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_23_58)

	local var_23_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_23_59)

	local var_23_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 121
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 421
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_23_12:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_23_60)

	local function var_23_61()
		var_23_4:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
		var_23_6:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
		var_23_10:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
		var_23_12:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
	end

	var_23_0._sequences.DisplayFreeToPlayUnlockDetailsNoUpsell = var_23_61

	local var_23_62
	local var_23_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_63)

	local var_23_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 239
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_64)

	local var_23_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("bo_sel_snipe_sm")
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_65)

	local var_23_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 404
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_66)

	local var_23_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_67)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_68)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_69 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_69)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_70 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 16
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 436
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 250
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 288
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetails", var_23_70)
	end

	local function var_23_71()
		var_23_4:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		var_23_6:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		var_23_10:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		var_23_12:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		var_23_14:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayFreeToPlayUnlockDetails")
		end
	end

	var_23_0._sequences.WZDisplayFreeToPlayUnlockDetails = var_23_71

	local var_23_72
	local var_23_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell", var_23_73)

	local var_23_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell", var_23_74)

	local var_23_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 273
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell", var_23_75)

	local var_23_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 121
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 421
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell", var_23_76)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell", var_23_77)
	end

	local function var_23_78()
		var_23_4:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell")
		var_23_6:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell")
		var_23_10:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell")
		var_23_12:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsNoUpsell")
		end
	end

	var_23_0._sequences.WZDisplayFreeToPlayUnlockDetailsNoUpsell = var_23_78

	local var_23_79
	local var_23_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_80)

	local var_23_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_81)

	local var_23_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_82)

	local var_23_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_83)

	local var_23_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_84)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_85 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_85)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_86 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_86)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayRewardDetails", var_23_87)
	end

	local function var_23_88()
		var_23_4:AnimateSequence("WZDisplayRewardDetails")
		var_23_6:AnimateSequence("WZDisplayRewardDetails")
		var_23_10:AnimateSequence("WZDisplayRewardDetails")
		var_23_12:AnimateSequence("WZDisplayRewardDetails")
		var_23_14:AnimateSequence("WZDisplayRewardDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayRewardDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayRewardDetails")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayRewardDetails")
		end
	end

	var_23_0._sequences.WZDisplayRewardDetails = var_23_88

	local var_23_89
	local var_23_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_90)

	local var_23_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_91)

	local var_23_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_92)

	local var_23_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_93)

	local var_23_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_94)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_95 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_95)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_96 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Text,
				value = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"),
				child = var_23_0.PurchaseButton.Text
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_96)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_97 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayUnlockDetails", var_23_97)
	end

	local function var_23_98()
		var_23_4:AnimateSequence("WZDisplayUnlockDetails")
		var_23_6:AnimateSequence("WZDisplayUnlockDetails")
		var_23_10:AnimateSequence("WZDisplayUnlockDetails")
		var_23_12:AnimateSequence("WZDisplayUnlockDetails")
		var_23_14:AnimateSequence("WZDisplayUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayUnlockDetails")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayUnlockDetails")
		end
	end

	var_23_0._sequences.WZDisplayUnlockDetails = var_23_98

	local var_23_99
	local var_23_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_100)

	local var_23_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_101)

	local var_23_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_102)

	local var_23_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_103)

	local var_23_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_104)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_105 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_105)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_106 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayUnlockDetailsWithPrompt", var_23_106)
	end

	local function var_23_107()
		var_23_4:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")
		var_23_6:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")
		var_23_10:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")
		var_23_12:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")
		var_23_14:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayUnlockDetailsWithPrompt")
		end
	end

	var_23_0._sequences.WZDisplayUnlockDetailsWithPrompt = var_23_107

	local var_23_108
	local var_23_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 252
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_109)

	local var_23_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 243
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_110)

	local var_23_111 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 61
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_111)

	local var_23_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 404
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_112)

	local var_23_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_113)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_114 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_114)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_115 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_115)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_116 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayFreeToPlayUnlockDetailsBundle", var_23_116)
	end

	local function var_23_117()
		var_23_4:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		var_23_6:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		var_23_10:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		var_23_12:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		var_23_14:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayFreeToPlayUnlockDetailsBundle")
		end
	end

	var_23_0._sequences.WZDisplayFreeToPlayUnlockDetailsBundle = var_23_117

	local var_23_118
	local var_23_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 185
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_119)

	local var_23_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 239
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_120)

	local var_23_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("bo_sel_snipe_sm")
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_121)

	local var_23_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 404
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_122)

	local var_23_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_123)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_124 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_124)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_125 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_125)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_126 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 15
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 130
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 435
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 168
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlock", var_23_126)
	end

	local function var_23_127()
		var_23_4:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		var_23_6:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		var_23_10:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		var_23_12:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		var_23_14:AnimateSequence("WZDisplayDefaultOperatorUnlock")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayDefaultOperatorUnlock")
		end
	end

	var_23_0._sequences.WZDisplayDefaultOperatorUnlock = var_23_127

	local var_23_128
	local var_23_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_129)

	local var_23_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_130)

	local var_23_131 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("bo_sel_snipe_sm")
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_131)

	local var_23_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 337
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_132)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_133 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_133)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_134 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_134)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_135 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 15
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 115
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 435
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 153
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayDefaultOperatorUnlockBundle", var_23_135)
	end

	local function var_23_136()
		var_23_4:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")
		var_23_6:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")
		var_23_10:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")
		var_23_12:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayDefaultOperatorUnlockBundle")
		end
	end

	var_23_0._sequences.WZDisplayDefaultOperatorUnlockBundle = var_23_136

	local var_23_137
	local var_23_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_23_4:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_138)

	local var_23_139 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_23_6:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_139)

	local var_23_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_10:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_140)

	local var_23_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 421
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_23_12:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_141)

	local var_23_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_142)

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_143 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_23_15:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_143)
	end

	if CONDITIONS.IsOperatorUpsellEnabled() then
		local var_23_144 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Text,
				value = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"),
				child = var_23_0.PurchaseButton.Text
			}
		}

		var_23_16:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_144)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_23_145 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 156
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 194
			}
		}

		var_23_17:RegisterAnimationSequence("WZDisplayBattlePassUnlockDetails", var_23_145)
	end

	local function var_23_146()
		var_23_4:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		var_23_6:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		var_23_10:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		var_23_12:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		var_23_14:AnimateSequence("WZDisplayBattlePassUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_15:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled() then
			var_23_16:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_23_17:AnimateSequence("WZDisplayBattlePassUnlockDetails")
		end
	end

	var_23_0._sequences.WZDisplayBattlePassUnlockDetails = var_23_146

	local var_23_147
	local var_23_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine,
			child = var_23_0.UnlockHeader.Divider
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_23_0.UnlockHeader.Text
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipSetup", var_23_148)

	local var_23_149 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_23_10:RegisterAnimationSequence("WZWipSetup", var_23_149)

	local var_23_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_23_12:RegisterAnimationSequence("WZWipSetup", var_23_150)

	local function var_23_151()
		var_23_8:AnimateSequence("WZWipSetup")
		var_23_10:AnimateSequence("WZWipSetup")
		var_23_12:AnimateSequence("WZWipSetup")
	end

	var_23_0._sequences.WZWipSetup = var_23_151

	var_0_18(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("OperatorChallenges", OperatorChallenges)
LockTable(_M)
