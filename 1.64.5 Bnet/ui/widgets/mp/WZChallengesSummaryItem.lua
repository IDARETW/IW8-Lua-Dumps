module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0._rewardIcons) do
		iter_1_1:SetAlpha(0)
	end

	if arg_1_1 and #arg_1_1 > 0 then
		local var_1_0 = math.min(#arg_1_1, #arg_1_0._rewardIcons)

		for iter_1_2 = 1, var_1_0 do
			local var_1_1 = arg_1_1[iter_1_2]
			local var_1_2 = arg_1_0._rewardIcons[iter_1_2]

			if var_1_1.type == "xp" and var_1_2 and var_1_1 and var_1_1.typeIconRendered and #var_1_1.typeIconRendered > 0 then
				if var_1_1.typeIconRenderedScale then
					var_1_2:SetScale(var_1_1.typeIconRenderedScale)
				end

				var_1_2:setImage(RegisterMaterial(var_1_1.typeIconRendered))
				var_1_2:SetAlpha(1)
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1, "WZChallengesSummaryItem->SetData(): 'data' is invalid/nil and shouldn't be")
	var_0_0(arg_2_0, arg_2_1.rewards)

	local var_2_0 = tonumber(arg_2_1.length)

	assert(var_2_0, "WZChallengesSummaryItem->SetData(): challengeCategoryNum is nil, should be specified a valid number between 1 and 3 in br_daily_challenges.csv")

	local var_2_1 = Challenge.DailyCategoryData[var_2_0]

	assert(var_2_1, "WZChallengesSummaryItem->SetData(): challengeCategoryData is nil, meaning the category num provided ( " .. var_2_0 .. " ) is not filled out in the dailyCategory tables in ChallengesUtils.lua")
	arg_2_0.CategoryIcon:setImage(RegisterMaterial(var_2_1.icon))

	if arg_2_1.progress then
		arg_2_0.ProgressBar:SetProgress(math.min(arg_2_1.progress, 1), 0, 0)
	else
		arg_2_0.ProgressBar:SetAlpha(0)
	end

	if arg_2_1.amountEarned and arg_2_1.amountNeeded then
		arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", math.min(arg_2_1.amountEarned, arg_2_1.amountNeeded), arg_2_1.amountNeeded))
	else
		arg_2_0.ProgressDesc:SetAlpha(0)
	end

	local var_2_2 = ""

	if arg_2_1.desc and #arg_2_1.desc > 0 and arg_2_1.amount and #arg_2_1.amount > 0 then
		var_2_2 = Engine.CBBHFCGDIC(arg_2_1.desc, arg_2_1.amount)
		var_2_2 = string.gsub(var_2_2, "%^5", "^$")
	end

	if arg_2_2 then
		local var_2_3, var_2_4 = Challenge.GetQuestStageByRef(arg_2_1.ref)
		local var_2_5 = Engine.CBBHFCGDIC("CHALLENGE/MISSION_PROGRESS_DESC", var_2_4, arg_2_1.totalStageValue, var_2_2)

		arg_2_0.Description:setText(var_2_5)
	else
		arg_2_0.Description:setText(var_2_2)
	end

	if arg_2_1.name and arg_2_1.name ~= "" then
		arg_2_0.Title:setText(Engine.CBBHFCGDIC(arg_2_1.name))
	end

	if arg_2_1.progress == 1 then
		ACTIONS.AnimateSequence(arg_2_0, "Complete")
	else
		ACTIONS.AnimateSequence(arg_2_0, "Incomplete")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if not arg_2_1.unlocked then
		arg_2_0.Lock:SetAlpha(1)
	else
		arg_2_0.Lock:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	return
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.RewardIcon)
	assert(arg_4_0.Lock)

	arg_4_0._rewardIcons = {
		arg_4_0.RewardIcon
	}

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end

	arg_4_0.SetData = var_0_1
	arg_4_0.SetDifficulty = var_0_2
end

function WZChallengesSummaryItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 410 * _1080p, 0, 94 * _1080p)

	var_5_0.id = "WZChallengesSummaryItem"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "RewardIcon"

	var_5_4:setImage(RegisterMaterial("icon_double_buff_xp_mini"), 0)
	var_5_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -42, _1080p * -6, _1080p * 15, _1080p * 51)
	var_5_0:addElement(var_5_4)

	var_5_0.RewardIcon = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ProgressBar"

	var_5_6.Overlay:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6.Overlay:SetAlpha(0.2, 0)
	var_5_6.Fill:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6.Fill:SetAlpha(0.65, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 63, _1080p * -6, _1080p * 72, _1080p * 84)
	var_5_0:addElement(var_5_6)

	var_5_0.ProgressBar = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "ProgressDesc"

	var_5_8:setText("99/99", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 57, _1080p * 68, _1080p * 86)
	var_5_0:addElement(var_5_8)

	var_5_0.ProgressDesc = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Lock"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_5_10:SetAlpha(0, 0)
	var_5_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -40, _1080p * -8, _1080p * 12, _1080p * 44)
	var_5_0:addElement(var_5_10)

	var_5_0.Lock = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "CategoryIcon"

	var_5_12:setImage(RegisterMaterial("ui_t9_shared_icon_logos_challenges_combat"), 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 57, _1080p * 10, _1080p * 60)
	var_5_0:addElement(var_5_12)

	var_5_0.CategoryIcon = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Description"

	var_5_14:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_14:SetWordWrap(false)
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_14:SetStartupDelay(1500)
	var_5_14:SetLineHoldTime(400)
	var_5_14:SetAnimMoveTime(300)
	var_5_14:SetAnimMoveSpeed(50)
	var_5_14:SetEndDelay(1000)
	var_5_14:SetCrossfadeTime(500)
	var_5_14:SetFadeInTime(300)
	var_5_14:SetFadeOutTime(300)
	var_5_14:SetMaxVisibleLines(1)
	var_5_14:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 69, _1080p * 355, _1080p * 35, _1080p * 59)
	var_5_0:addElement(var_5_14)

	var_5_0.Description = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Title"

	var_5_16:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_16:SetWordWrap(false)
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_16:SetStartupDelay(1000)
	var_5_16:SetLineHoldTime(400)
	var_5_16:SetAnimMoveTime(1500)
	var_5_16:SetAnimMoveSpeed(1500)
	var_5_16:SetEndDelay(1000)
	var_5_16:SetCrossfadeTime(400)
	var_5_16:SetFadeInTime(300)
	var_5_16:SetFadeOutTime(300)
	var_5_16:SetMaxVisibleLines(1)
	var_5_16:SetShadowMinDistance(-0.2, 0)
	var_5_16:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 69, _1080p * 355, _1080p * 11, _1080p * 35)
	var_5_0:addElement(var_5_16)

	var_5_0.Title = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "TopBorderLine"

	var_5_18:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_5_18:setImage(RegisterMaterial("line_dot_ch2"), 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 416, _1080p * 92, _1080p * 94)
	var_5_0:addElement(var_5_18)

	var_5_0.TopBorderLine = var_5_18

	local function var_5_19()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		}
	}

	var_5_14:RegisterAnimationSequence("AR", var_5_22)

	local function var_5_23()
		var_5_8:AnimateSequence("AR")
		var_5_14:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_5_0.ProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_6:RegisterAnimationSequence("Complete", var_5_25)

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocusAlt
		}
	}

	var_5_8:RegisterAnimationSequence("Complete", var_5_26)

	local function var_5_27()
		var_5_6:AnimateSequence("Complete")
		var_5_8:AnimateSequence("Complete")
	end

	var_5_0._sequences.Complete = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle,
			child = var_5_0.ProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_6:RegisterAnimationSequence("Incomplete", var_5_29)

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_8:RegisterAnimationSequence("Incomplete", var_5_30)

	local function var_5_31()
		var_5_6:AnimateSequence("Incomplete")
		var_5_8:AnimateSequence("Incomplete")
	end

	var_5_0._sequences.Incomplete = var_5_31

	local var_5_32
	local var_5_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.ProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipComplete", var_5_33)

	local function var_5_34()
		var_5_6:AnimateSequence("WZWipComplete")
	end

	var_5_0._sequences.WZWipComplete = var_5_34

	local var_5_35
	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_36)

	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipSetup", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipSetup", var_5_38)

	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipSetup", var_5_39)

	local var_5_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipSetup", var_5_40)

	local function var_5_41()
		var_5_6:AnimateSequence("WZWipSetup")
		var_5_8:AnimateSequence("WZWipSetup")
		var_5_14:AnimateSequence("WZWipSetup")
		var_5_16:AnimateSequence("WZWipSetup")
		var_5_18:AnimateSequence("WZWipSetup")
	end

	var_5_0._sequences.WZWipSetup = var_5_41

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WZChallengesSummaryItem", WZChallengesSummaryItem)
LockTable(_M)
