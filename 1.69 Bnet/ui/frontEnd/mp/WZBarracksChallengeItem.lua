module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		arg_1_0.Title:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 600, _1080p * 3, _1080p * 39)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._challenge = arg_2_2
	arg_2_0._menu = arg_2_1
	arg_2_0._numRewards = 0
	arg_2_0._localizedChallengeTitleText = ""

	if arg_2_0._challenge._isEmpty ~= nil then
		if arg_2_0._challenge._isEmpty then
			ACTIONS.AnimateSequence(arg_2_0, "Empty")
			arg_2_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/RESERVE_EMPTY_TITLE")))
			arg_2_0:SetButtonDisabled(true)

			return
		else
			ACTIONS.AnimateSequence(arg_2_0, "NonEmpty")
		end
	end

	if arg_2_0._challenge.desc and arg_2_0._challenge.amount then
		arg_2_0._localizedChallengeTitleText = LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC(arg_2_0._challenge.desc, arg_2_0._challenge.amount))
	end

	arg_2_0.Title:setText(arg_2_0._localizedChallengeTitleText)
	arg_2_0.RewardText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/X_XP", arg_2_0._challenge.XPReward)))

	local var_2_0 = tonumber(arg_2_0._challenge.length)

	assert(var_2_0, "WZBarracksChallengeItem->Setup(): challengeCategoryNum is nil, should be specified a valid number between 1 and 3 in br_daily_challenges.csv")

	local var_2_1 = Challenge.DailyCategoryData[var_2_0]

	assert(var_2_1, "WZBarracksChallengeItem->Setup(): challengeCategoryData is nil, meaning the category num provided ( " .. var_2_0 .. " ) is not filled out in the dailyCategory tables in ChallengesUtils.lua")
	arg_2_0.CategoryIcon:setImage(RegisterMaterial(var_2_1.icon))

	if arg_2_0._challenge.rewards and #arg_2_0._challenge.rewards > 0 then
		arg_2_0._numRewards = math.min(#arg_2_0._challenge.rewards, #arg_2_0._iconWidgets)

		for iter_2_0 = 1, arg_2_0._numRewards do
			local var_2_2 = arg_2_0._challenge.rewards[iter_2_0]
			local var_2_3 = arg_2_0._iconWidgets[iter_2_0]

			if var_2_2.typeIconRendered and #var_2_2.typeIconRendered > 0 then
				var_2_3:SetAlpha(arg_2_0._isOver and 1 or 0.5)
				var_2_3:setImage(RegisterMaterial(var_2_2.typeIconRendered))

				if var_2_2.typeIconRenderedScale then
					var_2_3:SetScale(var_2_2.typeIconRenderedScale)
				else
					var_2_3:SetScale(var_2_3.buildScale)
				end
			else
				var_2_3:SetAlpha(0)
			end
		end

		ACTIONS.AnimateSequence(arg_2_0, "ShowIcon1")
	end

	if arg_2_0._challenge.progress then
		arg_2_0.ProgressBar:SetProgress(arg_2_0._challenge.progress, 0, 0)
		arg_2_0.ProgressBar:SetAlpha(arg_2_0._isOver and 1 or 0.5)

		arg_2_0._useProgressBar = true

		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix(arg_2_0._challenge.progress == 1 and "Complete" or "Incomplete"))
	end

	if arg_2_0._challenge.amountEarned and arg_2_0._challenge.amountNeeded then
		arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_2_0._challenge.amountEarned, arg_2_0._challenge.amountNeeded))
		arg_2_0.ProgressDesc:SetAlpha(arg_2_0._isOver and 1 or 0.5)

		arg_2_0._useProgressDesc = true
	else
		arg_2_0.ProgressDesc:SetAlpha(0)
	end

	arg_2_0:SetButtonDisabled(not arg_2_0._challenge.unlocked)
end

local function var_0_2(arg_3_0)
	if arg_3_0._isSelected then
		return
	end

	local var_3_0 = LUI.IsLastInputGamepad(arg_3_0._controllerIndex) and "LUA_MENU/X_SELECT" or "LUA_MENU/SELECT"

	if arg_3_0._menuHasDoneBtnSelection then
		var_3_0 = LUI.IsLastInputGamepad(arg_3_0._controllerIndex) and "LUA_MENU/X_REPLACE" or "LUA_MENU/REPLACE"
	end

	arg_3_0.SelectionHintTitle:setText(Engine.CBBHFCGDIC(var_3_0))
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._isSelected = arg_4_1

	ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix(arg_4_0._isSelected and "Selected" or "ButtonUp"))
	var_0_2(arg_4_0)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._menuHasDoneBtnSelection = false
	arg_5_0._isSelected = false
	arg_5_0.Setup = var_0_1
	arg_5_0.SetIsSelected = var_0_3

	if IsLanguageArabic() then
		arg_5_0.Title:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 600, 0, _1080p * 32)
		arg_5_0.ProgressDesc:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 625, _1080p * 671, 0, _1080p * 32)
	end

	arg_5_0._iconWidgets = {
		arg_5_0.RewardIcon1
	}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0._iconWidgets) do
		iter_5_1.buildScale = iter_5_1:GetScale()
	end

	var_0_2(arg_5_0)
	arg_5_0:registerEventHandler("challenge_btn_selection_hint_update", function(arg_6_0, arg_6_1)
		arg_6_0._menuHasDoneBtnSelection = arg_6_1.menuHasDoneBtnSelection

		var_0_2(arg_6_0)
	end)
	arg_5_0:addEventHandler("update_input_type", var_0_2)
	arg_5_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_0:getParent()

		if var_7_0 then
			local var_7_1 = var_7_0._isDailyGrid and "daily_challenge_selected" or "bank_challenge_selected"

			arg_5_0:dispatchEventToCurrentMenu({
				dispatchChildren = true,
				name = var_7_1,
				selectedChallengeRow = arg_7_0._gridRow
			})
		end
	end)

	local function var_5_0(arg_8_0)
		if arg_8_0._isSelected then
			return
		end

		arg_8_0._isOver = true

		if arg_8_0._challenge then
			if arg_8_0._menu then
				arg_8_0._menu:processEvent({
					name = "challenges_update_status",
					challenge = arg_8_0._challenge
				})
			end

			if arg_8_0._numRewards > 0 then
				for iter_8_0 = 1, arg_8_0._numRewards do
					arg_8_0._iconWidgets[iter_8_0]:SetAlpha(1)
				end
			end
		end

		if arg_8_0._useProgressBar then
			arg_8_0.ProgressBar:SetAlpha(1)
		end

		if arg_8_0._useProgressDesc then
			arg_8_0.ProgressDesc:SetAlpha(1)
		end

		ACTIONS.AnimateSequence(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix(arg_5_0._challenge.unlocked and "ButtonOver" or "ButtonOverDisabled"))
	end

	arg_5_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		var_5_0(arg_9_0)
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_10_0, arg_10_1)
		var_5_0(arg_10_0)
	end)

	local function var_5_1(arg_11_0)
		if arg_11_0._isSelected then
			return
		end

		arg_11_0._isOver = false

		if arg_11_0._challenge and arg_11_0._numRewards > 0 then
			for iter_11_0 = 1, arg_11_0._numRewards do
				arg_11_0._iconWidgets[iter_11_0]:SetAlpha(0.5)
			end
		end

		if arg_11_0._useProgressBar then
			arg_11_0.ProgressBar:SetAlpha(0.5)
		end

		if arg_11_0._useProgressDesc then
			arg_11_0.ProgressDesc:SetAlpha(0.5)
		end

		ACTIONS.AnimateSequence(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix(arg_5_0._challenge.unlocked and "ButtonUp" or "ButtonUpDisabled"))
	end

	arg_5_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		var_5_1(arg_12_0)
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		var_5_1(arg_13_0)
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
		ACTIONS.AnimateSequence(arg_5_0, "WZWipButtonUp")
	end

	var_0_0(arg_5_0)
end

function WZBarracksChallengeItem(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 64 * _1080p)

	var_14_0.id = "WZBarracksChallengeItem"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "LoadoutItemButtonBackground"

	var_14_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 64)
	var_14_0:addElement(var_14_4)

	var_14_0.LoadoutItemButtonBackground = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIStyledText.new()

	var_14_6.id = "Title"

	var_14_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_14_6:setText("Challenge Name", 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_6:SetWordWrap(false)
	var_14_6:SetAlignment(LUI.Alignment.Left)
	var_14_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_6:SetStartupDelay(1700)
	var_14_6:SetLineHoldTime(400)
	var_14_6:SetAnimMoveTime(2000)
	var_14_6:SetAnimMoveSpeed(50)
	var_14_6:SetEndDelay(1700)
	var_14_6:SetCrossfadeTime(400)
	var_14_6:SetFadeInTime(300)
	var_14_6:SetFadeOutTime(300)
	var_14_6:SetMaxVisibleLines(1)
	var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 609, _1080p * 7, _1080p * 29)
	var_14_0:addElement(var_14_6)

	var_14_0.Title = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "RewardIcon1"

	var_14_8:SetAlpha(0, 0)
	var_14_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -60, _1080p * -28, _1080p * 7, _1080p * 39)
	var_14_0:addElement(var_14_8)

	var_14_0.RewardIcon1 = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIStyledText.new()

	var_14_10.id = "RewardText"

	var_14_10:SetAlpha(0, 0)
	var_14_10:setText("1000XP", 0)
	var_14_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_10:SetAlignment(LUI.Alignment.Center)
	var_14_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -89, 0, _1080p * 39, _1080p * 57)
	var_14_0:addElement(var_14_10)

	var_14_0.RewardText = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIStyledText.new()

	var_14_12.id = "ProgressDesc"

	var_14_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_14_12:SetAlpha(0.5, 0)
	var_14_12:setText("1/10", 0)
	var_14_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_12:SetWordWrap(false)
	var_14_12:SetAlignment(LUI.Alignment.Right)
	var_14_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 701, _1080p * 747, _1080p * 20, _1080p * 42)
	var_14_0:addElement(var_14_12)

	var_14_0.ProgressDesc = var_14_12

	local var_14_13
	local var_14_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_14_1
	})

	var_14_14.id = "ProgressBar"

	var_14_14:SetAlpha(0.5, 0)
	var_14_14.Overlay:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_14.Overlay:SetAlpha(0.5, 0)
	var_14_14.Fill:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_14_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 747, _1080p * 47, _1080p * 56)
	var_14_0:addElement(var_14_14)

	var_14_0.ProgressBar = var_14_14

	local var_14_15
	local var_14_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_14_1
	})

	var_14_16.id = "NewItemSmallIcon"

	var_14_16:SetAlpha(0, 0)
	var_14_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_14_0:addElement(var_14_16)

	var_14_0.NewItemSmallIcon = var_14_16

	local var_14_17
	local var_14_18 = LUI.UIImage.new()

	var_14_18.id = "SelectionHintBG"

	var_14_18:SetRGBFromTable(SWATCHES.CH2.CH2Backer, 0)
	var_14_18:SetAlpha(0, 0)
	var_14_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 16, _1080p * 232, _1080p * 1, _1080p * 63)
	var_14_0:addElement(var_14_18)

	var_14_0.SelectionHintBG = var_14_18

	local var_14_19
	local var_14_20 = LUI.UIImage.new()

	var_14_20.id = "SelectionHintHighlight"

	var_14_20:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_14_20:SetAlpha(0, 0)
	var_14_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 16, _1080p * 19, _1080p * 16, _1080p * 46)
	var_14_0:addElement(var_14_20)

	var_14_0.SelectionHintHighlight = var_14_20

	local var_14_21
	local var_14_22 = LUI.UIStyledText.new()

	var_14_22.id = "SelectionHintTitle"

	var_14_22:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_14_22:SetAlpha(0, 0)
	var_14_22:setText("", 0)
	var_14_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_22:SetWordWrap(false)
	var_14_22:SetAlignment(LUI.Alignment.Left)
	var_14_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_14_22:SetShadowUOffset(0, 0)
	var_14_22:SetShadowVOffset(0.002, 0)
	var_14_22:SetShadowRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_14_22:SetOutlineRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_14_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 24, _1080p * 118, _1080p * 20, _1080p * 44)
	var_14_0:addElement(var_14_22)

	var_14_0.SelectionHintTitle = var_14_22

	local var_14_23
	local var_14_24 = LUI.UIImage.new()

	var_14_24.id = "SelectionHintPointer"

	var_14_24:SetRGBFromTable(SWATCHES.CH2.CH2Backer, 0)
	var_14_24:SetAlpha(0, 0)
	var_14_24:SetZRotation(315, 0)
	var_14_24:setImage(RegisterMaterial("solid_triangle"), 0)
	var_14_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 833, _1080p * 849, _1080p * 26, _1080p * 42)
	var_14_0:addElement(var_14_24)

	var_14_0.SelectionHintPointer = var_14_24

	local var_14_25
	local var_14_26 = LUI.UIImage.new()

	var_14_26.id = "CategoryIcon"

	var_14_26:setImage(RegisterMaterial("ui_t9_shared_icon_logos_challenges_recon"), 0)
	var_14_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 12, _1080p * 59, _1080p * 7, _1080p * 54)
	var_14_0:addElement(var_14_26)

	var_14_0.CategoryIcon = var_14_26

	local var_14_27
	local var_14_28 = LUI.UIImage.new()

	var_14_28.id = "EquippedIcon"

	var_14_28:SetAlpha(0, 0)
	var_14_28:setImage(RegisterMaterial("ui_t9_menu_frontend_selected_checkMark"), 0)
	var_14_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 759, _1080p * 801, _1080p * 11, _1080p * 52)
	var_14_0:addElement(var_14_28)

	var_14_0.EquippedIcon = var_14_28

	local function var_14_29()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_29

	local var_14_30
	local var_14_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_31)

	local var_14_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOver", var_14_32)

	local var_14_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOver", var_14_33)

	local var_14_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonOver", var_14_34)

	local var_14_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonOver", var_14_35)

	local var_14_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 232
		},
		{
			value = 1,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.multiply
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonOver", var_14_36)

	local var_14_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 229
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.active
		},
		{
			value = 1,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 19
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 46
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonOver", var_14_37)

	local var_14_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.CH2.CH2DarkBlue
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.01,
			duration = 10,
			property = TWEEN_PROPERTY.Text_Style_Outline_Min_Distance
		},
		{
			value = 0.01,
			duration = 10,
			property = TWEEN_PROPERTY.Text_Style_Outline_Max_Distance
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Text_Style_Outline_Color,
			value = SWATCHES.CH2.CH2DarkBlue
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOver", var_14_38)

	local var_14_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 834
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 848
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonOver", var_14_39)

	local var_14_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ButtonOver", var_14_40)

	local function var_14_41()
		var_14_6:AnimateSequence("ButtonOver")
		var_14_8:AnimateSequence("ButtonOver")
		var_14_10:AnimateSequence("ButtonOver")
		var_14_12:AnimateSequence("ButtonOver")
		var_14_14:AnimateSequence("ButtonOver")
		var_14_18:AnimateSequence("ButtonOver")
		var_14_20:AnimateSequence("ButtonOver")
		var_14_22:AnimateSequence("ButtonOver")
		var_14_24:AnimateSequence("ButtonOver")
		var_14_28:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_41

	local var_14_42
	local var_14_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_43)

	local var_14_44 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonUp", var_14_44)

	local var_14_45 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUp", var_14_45)

	local var_14_46 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonUp", var_14_46)

	local var_14_47 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonUp", var_14_47)

	local var_14_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonUp", var_14_48)

	local var_14_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonUp", var_14_49)

	local var_14_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonUp", var_14_50)

	local var_14_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonUp", var_14_51)

	local var_14_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ButtonUp", var_14_52)

	local function var_14_53()
		var_14_6:AnimateSequence("ButtonUp")
		var_14_8:AnimateSequence("ButtonUp")
		var_14_10:AnimateSequence("ButtonUp")
		var_14_12:AnimateSequence("ButtonUp")
		var_14_14:AnimateSequence("ButtonUp")
		var_14_18:AnimateSequence("ButtonUp")
		var_14_20:AnimateSequence("ButtonUp")
		var_14_22:AnimateSequence("ButtonUp")
		var_14_24:AnimateSequence("ButtonUp")
		var_14_28:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_53

	local var_14_54
	local var_14_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("HideIcon", var_14_55)

	local var_14_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("HideIcon", var_14_56)

	local function var_14_57()
		var_14_8:AnimateSequence("HideIcon")
		var_14_10:AnimateSequence("HideIcon")
	end

	var_14_0._sequences.HideIcon = var_14_57

	local var_14_58
	local var_14_59 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_14_8:RegisterAnimationSequence("ShowIcon1", var_14_59)

	local var_14_60 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_14_10:RegisterAnimationSequence("ShowIcon1", var_14_60)

	local var_14_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ShowIcon1", var_14_61)

	local function var_14_62()
		var_14_8:AnimateSequence("ShowIcon1")
		var_14_10:AnimateSequence("ShowIcon1")
		var_14_28:AnimateSequence("ShowIcon1")
	end

	var_14_0._sequences.ShowIcon1 = var_14_62

	local var_14_63
	local var_14_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_14_0.ProgressBar.Fill
		}
	}

	var_14_14:RegisterAnimationSequence("Complete", var_14_64)

	local function var_14_65()
		var_14_14:AnimateSequence("Complete")
	end

	var_14_0._sequences.Complete = var_14_65

	local var_14_66
	local var_14_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_14_0.ProgressBar.Fill
		}
	}

	var_14_14:RegisterAnimationSequence("Incomplete", var_14_67)

	local function var_14_68()
		var_14_14:AnimateSequence("Incomplete")
	end

	var_14_0._sequences.Incomplete = var_14_68

	local var_14_69
	local var_14_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textOverDisabled
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabled", var_14_70)

	local function var_14_71()
		var_14_6:AnimateSequence("ButtonOverDisabled")
	end

	var_14_0._sequences.ButtonOverDisabled = var_14_71

	local var_14_72
	local var_14_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpDisabled", var_14_73)

	local function var_14_74()
		var_14_6:AnimateSequence("ButtonUpDisabled")
	end

	var_14_0._sequences.ButtonUpDisabled = var_14_74

	local var_14_75
	local var_14_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("Selected", var_14_76)

	local var_14_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("Selected", var_14_77)

	local var_14_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("Selected", var_14_78)

	local var_14_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("Selected", var_14_79)

	local var_14_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SELECTED")
		}
	}

	var_14_22:RegisterAnimationSequence("Selected", var_14_80)

	local var_14_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("Selected", var_14_81)

	local var_14_82 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 759
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 801
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_t9_menu_frontend_selected_checkMark")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_14_28:RegisterAnimationSequence("Selected", var_14_82)

	local function var_14_83()
		var_14_8:AnimateSequence("Selected")
		var_14_10:AnimateSequence("Selected")
		var_14_18:AnimateSequence("Selected")
		var_14_20:AnimateSequence("Selected")
		var_14_22:AnimateSequence("Selected")
		var_14_24:AnimateSequence("Selected")
		var_14_28:AnimateSequence("Selected")
	end

	var_14_0._sequences.Selected = var_14_83

	local var_14_84
	local var_14_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipSetup", var_14_85)

	local var_14_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine,
			child = var_14_0.ProgressBar.Fill
		}
	}

	var_14_14:RegisterAnimationSequence("WZWipSetup", var_14_86)

	local function var_14_87()
		var_14_6:AnimateSequence("WZWipSetup")
		var_14_14:AnimateSequence("WZWipSetup")
	end

	var_14_0._sequences.WZWipSetup = var_14_87

	local var_14_88
	local var_14_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonOver", var_14_89)

	local var_14_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("WZWipButtonOver", var_14_90)

	local var_14_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("WZWipButtonOver", var_14_91)

	local var_14_92 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("WZWipButtonOver", var_14_92)

	local var_14_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("WZWipButtonOver", var_14_93)

	local var_14_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 235,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_18:RegisterAnimationSequence("WZWipButtonOver", var_14_94)

	local var_14_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 217
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.active
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 232,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 236,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_20:RegisterAnimationSequence("WZWipButtonOver", var_14_95)

	local var_14_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 33,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 221,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_22:RegisterAnimationSequence("WZWipButtonOver", var_14_96)

	local var_14_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 817
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 833
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 836,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 852,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_24:RegisterAnimationSequence("WZWipButtonOver", var_14_97)

	local var_14_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("WZWipButtonOver", var_14_98)

	local function var_14_99()
		var_14_6:AnimateSequence("WZWipButtonOver")
		var_14_8:AnimateSequence("WZWipButtonOver")
		var_14_10:AnimateSequence("WZWipButtonOver")
		var_14_12:AnimateSequence("WZWipButtonOver")
		var_14_14:AnimateSequence("WZWipButtonOver")
		var_14_18:AnimateSequence("WZWipButtonOver")
		var_14_20:AnimateSequence("WZWipButtonOver")
		var_14_22:AnimateSequence("WZWipButtonOver")
		var_14_24:AnimateSequence("WZWipButtonOver")
		var_14_28:AnimateSequence("WZWipButtonOver")
	end

	var_14_0._sequences.WZWipButtonOver = var_14_99

	local var_14_100
	local var_14_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_14_101)

	local function var_14_102()
		var_14_6:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_14_0._sequences.WZWipButtonOverDisabled = var_14_102

	local var_14_103
	local var_14_104 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUp", var_14_104)

	local var_14_105 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("WZWipButtonUp", var_14_105)

	local var_14_106 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("WZWipButtonUp", var_14_106)

	local var_14_107 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("WZWipButtonUp", var_14_107)

	local var_14_108 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("WZWipButtonUp", var_14_108)

	local var_14_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("WZWipButtonUp", var_14_109)

	local var_14_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("WZWipButtonUp", var_14_110)

	local var_14_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("WZWipButtonUp", var_14_111)

	local var_14_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("WZWipButtonUp", var_14_112)

	local var_14_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("WZWipButtonUp", var_14_113)

	local function var_14_114()
		var_14_6:AnimateSequence("WZWipButtonUp")
		var_14_8:AnimateSequence("WZWipButtonUp")
		var_14_10:AnimateSequence("WZWipButtonUp")
		var_14_12:AnimateSequence("WZWipButtonUp")
		var_14_14:AnimateSequence("WZWipButtonUp")
		var_14_18:AnimateSequence("WZWipButtonUp")
		var_14_20:AnimateSequence("WZWipButtonUp")
		var_14_22:AnimateSequence("WZWipButtonUp")
		var_14_24:AnimateSequence("WZWipButtonUp")
		var_14_28:AnimateSequence("WZWipButtonUp")
	end

	var_14_0._sequences.WZWipButtonUp = var_14_114

	local var_14_115
	local var_14_116 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_14_116)

	local function var_14_117()
		var_14_6:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_14_0._sequences.WZWipButtonUpDisabled = var_14_117

	local var_14_118
	local var_14_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_14_0.ProgressBar.Fill
		}
	}

	var_14_14:RegisterAnimationSequence("WZWipComplete", var_14_119)

	local function var_14_120()
		var_14_14:AnimateSequence("WZWipComplete")
	end

	var_14_0._sequences.WZWipComplete = var_14_120

	local var_14_121
	local var_14_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_14_4:RegisterAnimationSequence("WZWipSelected", var_14_122)

	local var_14_123 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipSelected", var_14_123)

	local var_14_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("WZWipSelected", var_14_124)

	local var_14_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("WZWipSelected", var_14_125)

	local var_14_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("WZWipSelected", var_14_126)

	local var_14_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("WZWipSelected", var_14_127)

	local var_14_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SELECTED")
		}
	}

	var_14_22:RegisterAnimationSequence("WZWipSelected", var_14_128)

	local var_14_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("WZWipSelected", var_14_129)

	local var_14_130 = {
		{
			value = 1,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("WZWipSelected", var_14_130)

	local function var_14_131()
		var_14_4:AnimateSequence("WZWipSelected")
		var_14_6:AnimateSequence("WZWipSelected")
		var_14_8:AnimateSequence("WZWipSelected")
		var_14_10:AnimateSequence("WZWipSelected")
		var_14_18:AnimateSequence("WZWipSelected")
		var_14_20:AnimateSequence("WZWipSelected")
		var_14_22:AnimateSequence("WZWipSelected")
		var_14_24:AnimateSequence("WZWipSelected")
		var_14_28:AnimateSequence("WZWipSelected")
	end

	var_14_0._sequences.WZWipSelected = var_14_131

	local var_14_132
	local var_14_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_14_0.ProgressBar.Fill
		}
	}

	var_14_14:RegisterAnimationSequence("WZWipIncomplete", var_14_133)

	local function var_14_134()
		var_14_14:AnimateSequence("WZWipIncomplete")
	end

	var_14_0._sequences.WZWipIncomplete = var_14_134

	local var_14_135
	local var_14_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 574
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_14_6:RegisterAnimationSequence("Empty", var_14_136)

	local var_14_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("Empty", var_14_137)

	local var_14_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("Empty", var_14_138)

	local var_14_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("Empty", var_14_139)

	local var_14_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("Empty", var_14_140)

	local var_14_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("Empty", var_14_141)

	local var_14_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("Empty", var_14_142)

	local var_14_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("Empty", var_14_143)

	local var_14_144 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("Empty", var_14_144)

	local var_14_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("Empty", var_14_145)

	local var_14_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("Empty", var_14_146)

	local function var_14_147()
		var_14_6:AnimateSequence("Empty")
		var_14_8:AnimateSequence("Empty")
		var_14_10:AnimateSequence("Empty")
		var_14_12:AnimateSequence("Empty")
		var_14_14:AnimateSequence("Empty")
		var_14_16:AnimateSequence("Empty")
		var_14_18:AnimateSequence("Empty")
		var_14_20:AnimateSequence("Empty")
		var_14_22:AnimateSequence("Empty")
		var_14_26:AnimateSequence("Empty")
		var_14_28:AnimateSequence("Empty")
	end

	var_14_0._sequences.Empty = var_14_147

	local var_14_148
	local var_14_149 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("NonEmpty", var_14_149)

	local var_14_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 609
		}
	}

	var_14_6:RegisterAnimationSequence("NonEmpty", var_14_150)

	local var_14_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("NonEmpty", var_14_151)

	local var_14_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("NonEmpty", var_14_152)

	local var_14_153 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("NonEmpty", var_14_153)

	local var_14_154 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("NonEmpty", var_14_154)

	local var_14_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("NonEmpty", var_14_155)

	local var_14_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("NonEmpty", var_14_156)

	local var_14_157 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("NonEmpty", var_14_157)

	local var_14_158 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_26:RegisterAnimationSequence("NonEmpty", var_14_158)

	local var_14_159 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("NonEmpty", var_14_159)

	local function var_14_160()
		var_14_4:AnimateSequence("NonEmpty")
		var_14_6:AnimateSequence("NonEmpty")
		var_14_8:AnimateSequence("NonEmpty")
		var_14_10:AnimateSequence("NonEmpty")
		var_14_12:AnimateSequence("NonEmpty")
		var_14_14:AnimateSequence("NonEmpty")
		var_14_16:AnimateSequence("NonEmpty")
		var_14_22:AnimateSequence("NonEmpty")
		var_14_24:AnimateSequence("NonEmpty")
		var_14_26:AnimateSequence("NonEmpty")
		var_14_28:AnimateSequence("NonEmpty")
	end

	var_14_0._sequences.NonEmpty = var_14_160

	var_0_4(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("WZBarracksChallengeItem", WZBarracksChallengeItem)
LockTable(_M)
