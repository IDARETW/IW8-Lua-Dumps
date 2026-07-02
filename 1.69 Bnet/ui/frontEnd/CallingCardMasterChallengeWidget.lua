module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = not LUI.IsLastInputKeyboardMouse(arg_1_0._controllerIndex) or arg_1_0._forceHideProgress

	arg_1_0.Tier:SetAlpha(var_1_0 and 0 or arg_1_1)
	arg_1_0.ProgressBar:SetAlpha(var_1_0 and 0 or arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.ArrowButtonRight:SetAlpha(arg_2_1)
	arg_2_0.ArrowButtonLeft:SetAlpha(arg_2_1)
end

local function var_0_2(arg_3_0)
	if arg_3_0._challengeData then
		local var_3_0 = arg_3_0._challengeData
		local var_3_1 = arg_3_0.currentTier == var_3_0.currentTier

		if var_3_0.progress then
			local var_3_2 = var_3_0.progress

			if var_3_1 then
				if var_3_0.numTiers > 1 then
					local var_3_3 = split(var_3_0.amounts, "|")

					if var_3_3 and #var_3_3 > 0 then
						local var_3_4 = var_3_3[var_3_0.currentTier]

						var_3_2 = LUI.clamp(var_3_0.actualProgress / var_3_4, 0, 1)
					end
				end
			else
				var_3_2 = arg_3_0.currentTier < var_3_0.currentTier and 1 or 0
			end

			arg_3_0.ProgressBar:SetProgress(var_3_2)
		end

		if var_3_0.numTiers > 1 then
			arg_3_0.Tier:setText(Engine.CBBHFCGDIC(var_3_1 and "CHALLENGE/CURRENT_TIER" or "CHALLENGE/TIER", arg_3_0.currentTier, var_3_0.numTiers))
		else
			arg_3_0.Tier:setText("")
		end

		local var_3_5 = split(var_3_0.loot, "|")[arg_3_0.currentTier]

		if var_3_5 then
			local var_3_6 = LOOT.GetItemRef(LOOT.itemTypes.PLAYERCARD, var_3_5)

			arg_3_0.ChallengeImage:setImage(RegisterMaterial(CallingCardUtils.GetCardImage(var_3_6)))
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2)

	arg_4_0._challengeData = arg_4_2

	if not arg_4_0._menu then
		arg_4_0._menu = arg_4_1
	end

	local var_4_0 = LUI.IsLastInputKeyboardMouse(arg_4_0._controllerIndex)

	arg_4_0.currentTier = arg_4_2.currentTier <= arg_4_2.numTiers and arg_4_2.currentTier or arg_4_2.numTiers

	arg_4_0:SetProgressAlpha(0)

	if arg_4_2.shouldShowCategory then
		if var_4_0 then
			arg_4_0._showArrows = true

			arg_4_0.ChallengeTier:SetAlpha(1)
			arg_4_0:SetProgressAlpha(1)
		end

		local var_4_1 = arg_4_2.categoryName and Engine.CBBHFCGDIC(arg_4_2.categoryName) or ""

		arg_4_0.CategoryName:setText(var_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "CategoryOn")
	else
		if var_4_0 then
			arg_4_0._showArrows = true

			arg_4_0.ChallengeTier:SetAlpha(0)
			arg_4_0:SetProgressAlpha(1)
		else
			arg_4_0._showArrows = false

			arg_4_0.ChallengeTier:SetAlpha(1)
		end

		ACTIONS.AnimateSequence(arg_4_0, "CategoryOff")
	end

	if arg_4_2.challengeImage and #arg_4_2.challengeImage > 0 then
		arg_4_0.ChallengeImage:setImage(RegisterMaterial(arg_4_2.challengeImage))
	end

	if arg_4_2.challengeName and #arg_4_2.challengeName > 0 then
		arg_4_0.ChallengeName:setText(Engine.CBBHFCGDIC(arg_4_2.challengeName))
	else
		arg_4_0.ChallengeName:SetAlpha(0)
	end

	if arg_4_2.currentTier then
		arg_4_0.ChallengeTier:setText(Engine.CBBHFCGDIC(arg_4_2.currentTier))
	end

	if arg_4_2.numTiers <= 1 then
		arg_4_0._showArrows = false
	end

	local var_4_2 = false

	if arg_4_2.isChallengeActive ~= nil then
		arg_4_0._challengeActive = arg_4_2.isChallengeActive

		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")

		if arg_4_2.isChallengeActive == false then
			var_4_2 = true
		end
	end

	if arg_4_2.shouldShowCategory then
		if var_4_2 then
			WZWIP.AnimateThemeElement(arg_4_0, "Complete")
			arg_4_0.ChallengeTier:SetAlpha(0)
		else
			arg_4_0.ChallengeTier:SetAlpha(1)
		end
	elseif var_4_2 then
		if var_4_0 and arg_4_2.numTiers > 1 then
			ACTIONS.AnimateSequence(arg_4_0, "KBMCheckMark")
		else
			ACTIONS.AnimateSequence(arg_4_0, "GamepadCheckMark")
		end

		WZWIP.AnimateThemeElement(arg_4_0, "Complete")
		arg_4_0.ChallengeTier:SetAlpha(0)

		arg_4_0._showArrows = false
	else
		ACTIONS.AnimateSequence(arg_4_0, "Incomplete")
	end

	arg_4_0._lootTable = split(arg_4_2.loot, "|")

	local var_4_3 = arg_4_2.challengeName and #arg_4_2.challengeName > 0 and arg_4_2.challengeName or "LUA_MENU/MASTER_CHALLENGE"

	arg_4_0:SetupContextualMenu({
		title = ToUpperCase(Engine.CBBHFCGDIC(var_4_3))
	})

	local var_4_4 = {
		id = "previewCallingCardMasterChallenge",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"),
		actionFunction = function()
			local var_5_0 = arg_4_0._lootTable[arg_4_0.currentTier]
			local var_5_1 = {
				isBattlePass = false,
				quickPurchaseEnabled = false,
				timerValue = 0,
				bundleData = 0,
				lootID = var_5_0,
				lootType = LOOT.itemTypes.PLAYERCARD
			}

			LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, arg_4_0._controllerIndex, replaceTop, var_5_1, nil, false, false)
		end
	}

	arg_4_0:AddContextualMenuAction(var_4_4)
	arg_4_0:UpdateProgressBar()
end

local function var_0_4(arg_6_0, arg_6_1)
	if arg_6_0._beingPreviewed then
		return
	end

	if LUI.IsLastInputKeyboardMouse(arg_6_1) then
		arg_6_0.ChallengeTier:SetAlpha(0)
		arg_6_0.ArrowButtonLeft:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
			if arg_6_0.currentTier > 1 then
				arg_6_0.currentTier = arg_6_0.currentTier - 1
			else
				arg_6_0.currentTier = arg_6_0._challengeData.numTiers
			end

			arg_6_0._menu:UpdateDetailsForKeyboard(LUI.BEARING.left, arg_6_0)
			arg_6_0:UpdateProgressBar()

			return true
		end)
		arg_6_0.ArrowButtonRight:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
			if arg_6_0.currentTier < arg_6_0._challengeData.numTiers then
				arg_6_0.currentTier = arg_6_0.currentTier + 1
			else
				arg_6_0.currentTier = 1
			end

			arg_6_0._menu:UpdateDetailsForKeyboard(LUI.BEARING.right, arg_6_0)
			arg_6_0:UpdateProgressBar()

			return true
		end)

		if arg_6_0._challengeData and arg_6_0._challengeData.numTiers and arg_6_0._challengeData.numTiers > 1 then
			arg_6_0._showArrows = true

			arg_6_0:SetProgressAlpha(1)
		else
			arg_6_0._showArrows = false

			arg_6_0:SetProgressAlpha(0)
		end
	else
		arg_6_0._showArrows = false

		arg_6_0:SetProgressAlpha(0)
	end

	if arg_6_0._challengeData then
		var_0_3(arg_6_0, arg_6_0._menu, arg_6_0._challengeData)
	end
end

local function var_0_5(arg_9_0)
	arg_9_0._beingPreviewed = true

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_9_0, "ModePreviewAR")
	else
		ACTIONS.AnimateSequence(arg_9_0, "ModePreview")
	end
end

local function var_0_6(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.SetChallengeData = var_0_3
	arg_10_0.PreviewChallenge = var_0_5
	arg_10_0.UpdateProgressBar = var_0_2
	arg_10_0.SetProgressAlpha = var_0_0
	arg_10_0.currentTier = 1
	arg_10_0._controllerIndex = arg_10_1
	arg_10_0._showArrows = false

	var_0_4(arg_10_0, arg_10_1)
	arg_10_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if arg_11_0._challengeActive ~= nil then
			WZWIP.AnimateThemeElement(arg_11_0, "ButtonOver")
		end

		if arg_11_0._menu and arg_11_0._menu.PreviewChallenge then
			arg_11_0._menu:PreviewChallenge()
		end

		var_0_1(arg_11_0, arg_11_0._showArrows and 1 or 0)

		return true
	end)
	arg_10_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		WZWIP.AnimateThemeElement(arg_12_0, "ButtonUp")
		var_0_1(arg_12_0, 0)

		return true
	end)
	arg_10_0:addEventHandler("update_input_type", function(arg_13_0, arg_13_1)
		var_0_4(arg_13_0, arg_13_1.controllerIndex)
	end)
	arg_10_0:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if (arg_14_1.keyboard or LUI.IsLastInputGamepad(arg_14_1.controller)) and arg_14_0._menu and arg_14_0._menu.EquipCurrentCallingCard then
			arg_14_0._menu:EquipCurrentCallingCard(arg_14_1.controller)
		end

		if LUI.IsLastInputKeyboardMouse(arg_14_1.controller) then
			return true
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_10_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_10_0, "WZWipSetup")
	end
end

function CallingCardMasterChallengeWidget(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIButton.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 130 * _1080p)

	var_15_0.id = "CallingCardMasterChallengeWidget"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "ChallengeImage"

	var_15_4:SetRGBFromInt(8421504, 0)
	var_15_4:SetAlpha(0.5, 0)
	var_15_4:setImage(RegisterMaterial("ui_playercard_307"), 0)
	var_15_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 90)
	var_15_0:addElement(var_15_4)

	var_15_0.ChallengeImage = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "Backer"

	var_15_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_6:SetAlpha(0.5, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 30, 0, _1080p * -40, 0)
	var_15_0:addElement(var_15_6)

	var_15_0.Backer = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "TierBacker"

	var_15_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_8:SetAlpha(0.5, 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 30, _1080p * -40, 0)
	var_15_0:addElement(var_15_8)

	var_15_0.TierBacker = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIStyledText.new()

	var_15_10.id = "ChallengeName"

	var_15_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_15_10:setText("", 0)
	var_15_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_10:SetWordWrap(false)
	var_15_10:SetAlignment(LUI.Alignment.Left)
	var_15_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_10:SetStartupDelay(2000)
	var_15_10:SetLineHoldTime(400)
	var_15_10:SetAnimMoveTime(2000)
	var_15_10:SetAnimMoveSpeed(150)
	var_15_10:SetEndDelay(2000)
	var_15_10:SetCrossfadeTime(250)
	var_15_10:SetFadeInTime(300)
	var_15_10:SetFadeOutTime(300)
	var_15_10:SetMaxVisibleLines(1)
	var_15_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 30, _1080p * -75, _1080p * -35, _1080p * -15)
	var_15_0:addElement(var_15_10)

	var_15_0.ChallengeName = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIText.new()

	var_15_12.id = "ChallengeTier"

	var_15_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_15_12:SetAlpha(0, 0)
	var_15_12:setText("1", 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Center)
	var_15_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 329, _1080p * 359, _1080p * -35, _1080p * -15)
	var_15_0:addElement(var_15_12)

	var_15_0.ChallengeTier = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIText.new()

	var_15_14.id = "CategoryName"

	var_15_14:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_15_14:setText("", 0)
	var_15_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_14:setTextStyle(CoD.TextStyle.Shadowed)
	var_15_14:SetWordWrap(false)
	var_15_14:SetAlignment(LUI.Alignment.Right)
	var_15_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -70, _1080p * -10, _1080p * -34, _1080p * -16)
	var_15_0:addElement(var_15_14)

	var_15_0.CategoryName = var_15_14

	local var_15_15
	local var_15_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_15_1
	})

	var_15_16.id = "ButtonHighlightBarTop"

	var_15_16:SetAlpha(0, 0)
	var_15_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_15_0:addElement(var_15_16)

	var_15_0.ButtonHighlightBarTop = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "ButtonHighlightBarBottom"

	var_15_18:SetAlpha(0, 0)
	var_15_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_15_0:addElement(var_15_18)

	var_15_0.ButtonHighlightBarBottom = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIImage.new()

	var_15_20.id = "CheckMark"

	var_15_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_15_20:SetAlpha(0, 0)
	var_15_20:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_15_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 328, _1080p * 360, _1080p * -41, _1080p * -9)
	var_15_0:addElement(var_15_20)

	var_15_0.CheckMark = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("MasterChallengesArrow", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "ArrowButtonRight"

	var_15_22:SetAlpha(0, 0)
	var_15_22.Arrow:SetLeft(_1080p * 44, 0)
	var_15_22.Arrow:SetRight(_1080p * -6, 0)
	var_15_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 322, _1080p * 360, 0, _1080p * 90)
	var_15_0:addElement(var_15_22)

	var_15_0.ArrowButtonRight = var_15_22

	local var_15_23
	local var_15_24 = MenuBuilder.BuildRegisteredType("MasterChallengesArrow", {
		controllerIndex = var_15_1
	})

	var_15_24.id = "ArrowButtonLeft"

	var_15_24:SetAlpha(0, 0)
	var_15_24.Arrow:SetLeft(_1080p * -6, 0)
	var_15_24.Arrow:SetRight(_1080p * 44, 0)
	var_15_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 38, 0, _1080p * 90)
	var_15_0:addElement(var_15_24)

	var_15_0.ArrowButtonLeft = var_15_24

	local var_15_25
	local var_15_26 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_15_1
	})

	var_15_26.id = "ProgressBar"

	var_15_26:SetAlpha(0, 0)
	var_15_26.Overlay:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_15_26.Fill:SetRGBFromTable(SWATCHES.masterChallenges.progressFill, 0)
	var_15_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 359, _1080p * 120, _1080p * 130)
	var_15_0:addElement(var_15_26)

	var_15_0.ProgressBar = var_15_26

	local var_15_27
	local var_15_28 = LUI.UIText.new()

	var_15_28.id = "Tier"

	var_15_28:SetAlpha(0, 0)
	var_15_28:setText("", 0)
	var_15_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_28:SetAlignment(LUI.Alignment.Left)
	var_15_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 299, _1080p * 359, _1080p * 93, _1080p * 115)
	var_15_0:addElement(var_15_28)

	var_15_0.Tier = var_15_28

	local function var_15_29()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_29

	local var_15_30
	local var_15_31 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOver", var_15_31)

	local var_15_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOver", var_15_32)

	local var_15_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonOver", var_15_33)

	local var_15_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonOver", var_15_34)

	local var_15_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonOver", var_15_35)

	local function var_15_36()
		var_15_4:AnimateSequence("ButtonOver")
		var_15_10:AnimateSequence("ButtonOver")
		var_15_12:AnimateSequence("ButtonOver")
		var_15_16:AnimateSequence("ButtonOver")
		var_15_18:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_36

	local var_15_37
	local var_15_38 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUp", var_15_38)

	local var_15_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUp", var_15_39)

	local var_15_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonUp", var_15_40)

	local var_15_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonUp", var_15_41)

	local var_15_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonUp", var_15_42)

	local function var_15_43()
		var_15_4:AnimateSequence("ButtonUp")
		var_15_10:AnimateSequence("ButtonUp")
		var_15_12:AnimateSequence("ButtonUp")
		var_15_16:AnimateSequence("ButtonUp")
		var_15_18:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_43

	local var_15_44
	local var_15_45 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ModePreview", var_15_45)

	local var_15_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.lightBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ModePreview", var_15_46)

	local var_15_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.darkBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_8:RegisterAnimationSequence("ModePreview", var_15_47)

	local var_15_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -60
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ModePreview", var_15_48)

	local var_15_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.name
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ModePreview", var_15_49)

	local var_15_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style,
			value = CoD.TextStyle.Shadowed
		}
	}

	var_15_14:RegisterAnimationSequence("ModePreview", var_15_50)

	local var_15_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ModePreview", var_15_51)

	local var_15_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ModePreview", var_15_52)

	local var_15_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_20:RegisterAnimationSequence("ModePreview", var_15_53)

	local function var_15_54()
		var_15_4:AnimateSequence("ModePreview")
		var_15_6:AnimateSequence("ModePreview")
		var_15_8:AnimateSequence("ModePreview")
		var_15_10:AnimateSequence("ModePreview")
		var_15_12:AnimateSequence("ModePreview")
		var_15_14:AnimateSequence("ModePreview")
		var_15_16:AnimateSequence("ModePreview")
		var_15_18:AnimateSequence("ModePreview")
		var_15_20:AnimateSequence("ModePreview")
	end

	var_15_0._sequences.ModePreview = var_15_54

	local var_15_55
	local var_15_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_10:RegisterAnimationSequence("Complete", var_15_56)

	local var_15_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("Complete", var_15_57)

	local var_15_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("Complete", var_15_58)

	local function var_15_59()
		var_15_10:AnimateSequence("Complete")
		var_15_12:AnimateSequence("Complete")
		var_15_20:AnimateSequence("Complete")
	end

	var_15_0._sequences.Complete = var_15_59

	local var_15_60
	local var_15_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -80
		}
	}

	var_15_10:RegisterAnimationSequence("CategoryOn", var_15_61)

	local var_15_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("CategoryOn", var_15_62)

	local function var_15_63()
		var_15_10:AnimateSequence("CategoryOn")
		var_15_14:AnimateSequence("CategoryOn")
	end

	var_15_0._sequences.CategoryOn = var_15_63

	local var_15_64
	local var_15_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_15_10:RegisterAnimationSequence("CategoryOff", var_15_65)

	local var_15_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("CategoryOff", var_15_66)

	local function var_15_67()
		var_15_10:AnimateSequence("CategoryOff")
		var_15_14:AnimateSequence("CategoryOff")
	end

	var_15_0._sequences.CategoryOff = var_15_67

	local var_15_68
	local var_15_69 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("Incomplete", var_15_69)

	local var_15_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("Incomplete", var_15_70)

	local function var_15_71()
		var_15_10:AnimateSequence("Incomplete")
		var_15_20:AnimateSequence("Incomplete")
	end

	var_15_0._sequences.Incomplete = var_15_71

	local var_15_72
	local var_15_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("NotComplete", var_15_73)

	local function var_15_74()
		var_15_20:AnimateSequence("NotComplete")
	end

	var_15_0._sequences.NotComplete = var_15_74

	local var_15_75
	local var_15_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		}
	}

	var_15_20:RegisterAnimationSequence("KBMCheckMark", var_15_76)

	local function var_15_77()
		var_15_20:AnimateSequence("KBMCheckMark")
	end

	var_15_0._sequences.KBMCheckMark = var_15_77

	local var_15_78
	local var_15_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 328
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 360
		}
	}

	var_15_20:RegisterAnimationSequence("GamepadCheckMark", var_15_79)

	local function var_15_80()
		var_15_20:AnimateSequence("GamepadCheckMark")
	end

	var_15_0._sequences.GamepadCheckMark = var_15_80

	local var_15_81
	local var_15_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		}
	}

	var_15_10:RegisterAnimationSequence("AR", var_15_82)

	local var_15_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		}
	}

	var_15_14:RegisterAnimationSequence("AR", var_15_83)

	local function var_15_84()
		var_15_10:AnimateSequence("AR")
		var_15_14:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_84

	local var_15_85
	local var_15_86 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("ModePreviewAR", var_15_86)

	local var_15_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.lightBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ModePreviewAR", var_15_87)

	local var_15_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.darkBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_8:RegisterAnimationSequence("ModePreviewAR", var_15_88)

	local var_15_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50
		}
	}

	var_15_10:RegisterAnimationSequence("ModePreviewAR", var_15_89)

	local var_15_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.name
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ModePreviewAR", var_15_90)

	local var_15_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style,
			value = CoD.TextStyle.Shadowed
		}
	}

	var_15_14:RegisterAnimationSequence("ModePreviewAR", var_15_91)

	local var_15_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ModePreviewAR", var_15_92)

	local var_15_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ModePreviewAR", var_15_93)

	local var_15_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_20:RegisterAnimationSequence("ModePreviewAR", var_15_94)

	local function var_15_95()
		var_15_4:AnimateSequence("ModePreviewAR")
		var_15_6:AnimateSequence("ModePreviewAR")
		var_15_8:AnimateSequence("ModePreviewAR")
		var_15_10:AnimateSequence("ModePreviewAR")
		var_15_12:AnimateSequence("ModePreviewAR")
		var_15_14:AnimateSequence("ModePreviewAR")
		var_15_16:AnimateSequence("ModePreviewAR")
		var_15_18:AnimateSequence("ModePreviewAR")
		var_15_20:AnimateSequence("ModePreviewAR")
	end

	var_15_0._sequences.ModePreviewAR = var_15_95

	local var_15_96
	local var_15_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -95
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipSetup", var_15_97)

	local var_15_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_12:RegisterAnimationSequence("WZWipSetup", var_15_98)

	local var_15_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipSetup", var_15_99)

	local function var_15_100()
		var_15_10:AnimateSequence("WZWipSetup")
		var_15_12:AnimateSequence("WZWipSetup")
		var_15_14:AnimateSequence("WZWipSetup")
	end

	var_15_0._sequences.WZWipSetup = var_15_100

	local var_15_101
	local var_15_102 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipButtonOver", var_15_102)

	local var_15_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonOver", var_15_103)

	local var_15_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_12:RegisterAnimationSequence("WZWipButtonOver", var_15_104)

	local var_15_105 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipButtonOver", var_15_105)

	local var_15_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("WZWipButtonOver", var_15_106)

	local var_15_107 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("WZWipButtonOver", var_15_107)

	local function var_15_108()
		var_15_4:AnimateSequence("WZWipButtonOver")
		var_15_10:AnimateSequence("WZWipButtonOver")
		var_15_12:AnimateSequence("WZWipButtonOver")
		var_15_14:AnimateSequence("WZWipButtonOver")
		var_15_16:AnimateSequence("WZWipButtonOver")
		var_15_18:AnimateSequence("WZWipButtonOver")
	end

	var_15_0._sequences.WZWipButtonOver = var_15_108

	local var_15_109
	local var_15_110 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipButtonUp", var_15_110)

	local var_15_111 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonUp", var_15_111)

	local var_15_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_12:RegisterAnimationSequence("WZWipButtonUp", var_15_112)

	local var_15_113 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipButtonUp", var_15_113)

	local var_15_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("WZWipButtonUp", var_15_114)

	local var_15_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("WZWipButtonUp", var_15_115)

	local function var_15_116()
		var_15_4:AnimateSequence("WZWipButtonUp")
		var_15_10:AnimateSequence("WZWipButtonUp")
		var_15_12:AnimateSequence("WZWipButtonUp")
		var_15_14:AnimateSequence("WZWipButtonUp")
		var_15_16:AnimateSequence("WZWipButtonUp")
		var_15_18:AnimateSequence("WZWipButtonUp")
	end

	var_15_0._sequences.WZWipButtonUp = var_15_116

	local var_15_117
	local var_15_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipComplete", var_15_118)

	local var_15_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("WZWipComplete", var_15_119)

	local var_15_120 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_15_20:RegisterAnimationSequence("WZWipComplete", var_15_120)

	local function var_15_121()
		var_15_10:AnimateSequence("WZWipComplete")
		var_15_12:AnimateSequence("WZWipComplete")
		var_15_20:AnimateSequence("WZWipComplete")
	end

	var_15_0._sequences.WZWipComplete = var_15_121

	var_0_6(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("CallingCardMasterChallengeWidget", CallingCardMasterChallengeWidget)
LockTable(_M)
