module(..., package.seeall)

local var_0_0 = {
	[LOOT.itemTypes.OPERATOR] = "LUA_MENU/UNLOCK_CRITERIA",
	[LOOT.itemTypes.OPERATOR_SKIN] = "LUA_MENU/UNLOCK_CRITERIA_SKIN"
}

local function var_0_1(arg_1_0)
	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.DoubleNotchedBacker:getLocalRect()

	arg_1_0:setHeight(var_1_3 - var_1_1)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ChallengeInfo:SetupChallengeInfo(arg_2_2)
	ACTIONS.AnimateSequence(arg_2_0, "DisplayRewardDetails")
	arg_2_0:UpdateSize()

	arg_2_0.canDisplayPopup = false

	arg_2_0.UnlockHeader.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/TOUR_OF_DUTY"))

	if arg_2_0.PurchaseButton and arg_2_0.PurchasePrompt then
		arg_2_0.PurchaseButton:SetButtonDisabled(true)
		arg_2_0.PurchasePrompt:SetAlpha(0)
		arg_2_0.PurchaseButton:SetAlpha(0)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_1)
	assert(arg_3_2)
	arg_3_0.ChallengeInfo:SetupMissionChallengeInfo(OPERATOR.GetOutfitChallengeDetailsFromObjective(arg_3_1.id, arg_3_2), arg_3_1)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.ChallengeInfo:SetupLockedInfo(arg_4_2)

	if Engine.CFHBIHABCB(arg_4_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_4_0, "DisplayUnlockDetails")

		arg_4_0.canDisplayPopup = false
	elseif Dvar.IBEGCHEFE("OMPKROKQPL") and arg_4_0.PurchaseButton and arg_4_0.PurchasePrompt then
		ACTIONS.AnimateSequence(arg_4_0, "DisplayFreeToPlayUnlockDetails")

		arg_4_0.canDisplayPopup = true

		if LUI.IsLastInputKeyboardMouse(arg_4_0._controllerIndex) then
			arg_4_0.PurchaseButton:SetAlpha(1)
			arg_4_0.PurchaseButton:SetButtonDisabled(false)
			arg_4_0.PurchasePrompt:SetAlpha(0)
		else
			arg_4_0.PurchaseButton:SetAlpha(0)
			arg_4_0.PurchaseButton:SetButtonDisabled(true)
			arg_4_0.PurchasePrompt:SetAlpha(1)
			arg_4_0:processEvent({
				name = "lose_focus"
			})
		end
	else
		ACTIONS.AnimateSequence(arg_4_0, "DisplayFreeToPlayUnlockDetailsNoUpsell")

		if arg_4_2.operatorRef == "domino_western" then
			arg_4_0.PurchaseMWLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_UNLOCKED_WITH_MW_OR_SKIN"))
		elseif arg_4_2.isLaunchOperator ~= nil and arg_4_2.isLaunchOperator == true then
			arg_4_0.PurchaseMWLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_UNLOCKED_WITH_MW"))
		elseif arg_4_2.desc then
			arg_4_0.PurchaseMWLabel:setText(Engine.CBBHFCGDIC(arg_4_2.desc))
		end
	end

	arg_4_0:UpdateSize()

	local var_4_0 = var_0_0[arg_4_1] or ""

	arg_4_0.UnlockHeader.Text:setText(Engine.CBBHFCGDIC(var_4_0))
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_3 then
		arg_5_0:SetLocked(arg_5_1, arg_5_2)
	else
		arg_5_0:SetChallenge(arg_5_1, arg_5_2)
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1

	assert(arg_6_0.ChallengeInfo)

	arg_6_0.SetChallenge = var_0_2
	arg_6_0.SetLocked = var_0_4
	arg_6_0.SetupChallenge = var_0_5
	arg_6_0.UpdateSize = var_0_1
	arg_6_0.SetupMissionChallenge = var_0_3
	arg_6_0.canDisplayPopup = false

	if not Engine.CFHBIHABCB(arg_6_1) and arg_6_0.PurchaseButton and arg_6_0.PurchasePrompt then
		arg_6_0.PurchaseButton:AddTooltipData(arg_6_1, {
			tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW_PROMPT")
		})
		arg_6_0:addEventHandler("update_input_type", function(arg_7_0, arg_7_1)
			if LUI.IsLastInputKeyboardMouse(arg_7_1.controllerIndex) and arg_7_0.canDisplayPopup then
				arg_7_0.PurchaseButton:SetAlpha(1)
				arg_7_0.PurchaseButton:SetButtonDisabled(false)
				arg_7_0.PurchasePrompt:SetAlpha(0)
			else
				arg_7_0:processEvent({
					name = "lose_focus"
				})
				arg_7_0.PurchaseButton:SetAlpha(0)
				arg_7_0.PurchaseButton:SetButtonDisabled(true)
				arg_7_0.PurchasePrompt:SetAlpha(1)
			end
		end)
		arg_6_0.PurchaseButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_1.controller or arg_6_1

			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, var_8_0, false, nil)
		end)
	end
end

function OperatorChallenges(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 175 * _1080p)

	var_9_0.id = "OperatorChallenges"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "DoubleNotchedBacker"

	var_9_4:SetAlpha(0.5, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 175)
	var_9_0:addElement(var_9_4)

	var_9_0.DoubleNotchedBacker = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("OperatorChallengeLabel", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "ChallengeInfo"

	var_9_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -29, _1080p * 60, _1080p * 148)
	var_9_0:addElement(var_9_6)

	var_9_0.ChallengeInfo = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "UnlockHeader"

	var_9_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_CRITERIA"), 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 47)
	var_9_0:addElement(var_9_8)

	var_9_0.UnlockHeader = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "MWLogo"

	var_9_10:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("logo_mw_glow"), 0)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 157, _1080p * 70, _1080p * 102)
	var_9_0:addElement(var_9_10)

	var_9_0.MWLogo = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIStyledText.new()

	var_9_12.id = "PurchaseMWLabel"

	var_9_12:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_9_12:SetAlpha(0, 0)
	var_9_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"), 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetAlignment(LUI.Alignment.Left)
	var_9_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_9_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_9_12:SetStartupDelay(2000)
	var_9_12:SetLineHoldTime(400)
	var_9_12:SetAnimMoveTime(2000)
	var_9_12:SetAnimMoveSpeed(150)
	var_9_12:SetEndDelay(2000)
	var_9_12:SetCrossfadeTime(400)
	var_9_12:SetFadeInTime(300)
	var_9_12:SetFadeOutTime(300)
	var_9_12:SetMaxVisibleLines(2)
	var_9_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 421, _1080p * 74, _1080p * 98)
	var_9_0:addElement(var_9_12)

	var_9_0.PurchaseMWLabel = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("TextDivider", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "AndDivider"

	var_9_14:SetAlpha(0, 0)
	var_9_14.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/AND"), 0)
	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 383, _1080p * 119, _1080p * 149)
	var_9_0:addElement(var_9_14)

	var_9_0.AndDivider = var_9_14

	local var_9_15

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		var_9_15 = LUI.UIText.new()
		var_9_15.id = "PurchasePrompt"

		var_9_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
		var_9_15:SetAlpha(0, 0)
		var_9_15:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW_PROMPT"), 0)
		var_9_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_9_15:SetAlignment(LUI.Alignment.Center)
		var_9_15:SetVerticalAlignment(LUI.Alignment.Center)
		var_9_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 421, _1080p * 252, _1080p * 276)
		var_9_0:addElement(var_9_15)

		var_9_0.PurchasePrompt = var_9_15
	end

	local var_9_16

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		var_9_16 = MenuBuilder.BuildRegisteredType("TimedButton", {
			controllerIndex = var_9_1
		})
		var_9_16.id = "PurchaseButton"

		var_9_16:SetAlpha(0, 0)

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_16:SetButtonDisabled(false)
		end

		var_9_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"), 0)
		var_9_16.Text:SetAlignment(LUI.Alignment.Center)
		var_9_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 436, _1080p * 252, _1080p * 290)
		var_9_0:addElement(var_9_16)

		var_9_0.PurchaseButton = var_9_16
	end

	local function var_9_17()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_17

	local function var_9_18()
		return
	end

	var_9_0._sequences.HideFunctionalUnlocks = var_9_18

	local function var_9_19()
		return
	end

	var_9_0._sequences.ShowFunctionalUnlocks = var_9_19

	local var_9_20
	local var_9_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_9_4:RegisterAnimationSequence("DisplayRewardDetails", var_9_21)

	local var_9_22 = {
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

	var_9_6:RegisterAnimationSequence("DisplayRewardDetails", var_9_22)

	local var_9_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DisplayRewardDetails", var_9_23)

	local var_9_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("DisplayRewardDetails", var_9_24)

	local var_9_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("DisplayRewardDetails", var_9_25)

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_26 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_15:RegisterAnimationSequence("DisplayRewardDetails", var_9_26)
	end

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_16:RegisterAnimationSequence("DisplayRewardDetails", var_9_27)
	end

	local function var_9_28()
		var_9_4:AnimateSequence("DisplayRewardDetails")
		var_9_6:AnimateSequence("DisplayRewardDetails")
		var_9_10:AnimateSequence("DisplayRewardDetails")
		var_9_12:AnimateSequence("DisplayRewardDetails")
		var_9_14:AnimateSequence("DisplayRewardDetails")

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_15:AnimateSequence("DisplayRewardDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_16:AnimateSequence("DisplayRewardDetails")
		end
	end

	var_9_0._sequences.DisplayRewardDetails = var_9_28

	local var_9_29
	local var_9_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_9_4:RegisterAnimationSequence("DisplayUnlockDetails", var_9_30)

	local var_9_31 = {
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

	var_9_6:RegisterAnimationSequence("DisplayUnlockDetails", var_9_31)

	local var_9_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DisplayUnlockDetails", var_9_32)

	local var_9_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("DisplayUnlockDetails", var_9_33)

	local var_9_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("DisplayUnlockDetails", var_9_34)

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_15:RegisterAnimationSequence("DisplayUnlockDetails", var_9_35)
	end

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Text,
				value = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"),
				child = var_9_0.PurchaseButton.Text
			}
		}

		var_9_16:RegisterAnimationSequence("DisplayUnlockDetails", var_9_36)
	end

	local function var_9_37()
		var_9_4:AnimateSequence("DisplayUnlockDetails")
		var_9_6:AnimateSequence("DisplayUnlockDetails")
		var_9_10:AnimateSequence("DisplayUnlockDetails")
		var_9_12:AnimateSequence("DisplayUnlockDetails")
		var_9_14:AnimateSequence("DisplayUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_15:AnimateSequence("DisplayUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_16:AnimateSequence("DisplayUnlockDetails")
		end
	end

	var_9_0._sequences.DisplayUnlockDetails = var_9_37

	local var_9_38
	local var_9_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 300
		}
	}

	var_9_4:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_39)

	local var_9_40 = {
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

	var_9_6:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_40)

	local var_9_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_41)

	local var_9_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_42)

	local var_9_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_43)

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_44 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_15:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_44)
	end

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_45 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_16:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetails", var_9_45)
	end

	local function var_9_46()
		var_9_4:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_9_6:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_9_10:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_9_12:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		var_9_14:AnimateSequence("DisplayFreeToPlayUnlockDetails")

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_15:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		end

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_16:AnimateSequence("DisplayFreeToPlayUnlockDetails")
		end
	end

	var_9_0._sequences.DisplayFreeToPlayUnlockDetails = var_9_46

	local var_9_47
	local var_9_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_9_4:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_9_48)

	local var_9_49 = {
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

	var_9_6:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_9_49)

	local var_9_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_9_50)

	local var_9_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_9_51)

	local var_9_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_9_52)

	if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
		local var_9_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_15:RegisterAnimationSequence("DisplayUnlockDetailsWithPrompt", var_9_53)
	end

	local function var_9_54()
		var_9_4:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_9_6:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_9_10:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_9_12:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		var_9_14:AnimateSequence("DisplayUnlockDetailsWithPrompt")

		if CONDITIONS.IsOperatorUpsellEnabled(var_9_0) then
			var_9_15:AnimateSequence("DisplayUnlockDetailsWithPrompt")
		end
	end

	var_9_0._sequences.DisplayUnlockDetailsWithPrompt = var_9_54

	local var_9_55
	local var_9_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_9_4:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_9_56)

	local var_9_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_9_57)

	local var_9_58 = {
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

	var_9_10:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_9_58)

	local var_9_59 = {
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

	var_9_12:RegisterAnimationSequence("DisplayFreeToPlayUnlockDetailsNoUpsell", var_9_59)

	local function var_9_60()
		var_9_4:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
		var_9_6:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
		var_9_10:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
		var_9_12:AnimateSequence("DisplayFreeToPlayUnlockDetailsNoUpsell")
	end

	var_9_0._sequences.DisplayFreeToPlayUnlockDetailsNoUpsell = var_9_60

	var_0_6(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("OperatorChallenges", OperatorChallenges)
LockTable(_M)
