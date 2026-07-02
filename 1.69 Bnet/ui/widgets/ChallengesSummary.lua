module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Challenge.GetDailyChallengeData(arg_1_1, #arg_1_0._dailyChallengeItems)

	if var_1_0 and #var_1_0 > 0 then
		if numDailyChallenges == 1 then
			ACTIONS.AnimateSequence(arg_1_0, "DailyX1")
		elseif numDailyChallenges == 2 then
			ACTIONS.AnimateSequence(arg_1_0, "DailyX2")
		end

		for iter_1_0 = 1, #var_1_0 do
			arg_1_0._dailyChallengeItems[iter_1_0]:SetData(var_1_0[iter_1_0])

			if Dvar.IBEGCHEFE("LLQKSNOSS") then
				arg_1_0._dailyChallengeItems[iter_1_0]:SetDifficulty(var_1_0[iter_1_0])
			end
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideDaily")
	end

	Challenge.SetupDailyResetTimer(arg_1_0.ChallengeResetTimer, arg_1_0.ChallengeResetTimer.Text)
	arg_1_0.ChallengeResetTimer:SetupAlignment()
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Challenge.ActivationCategoryMP

	if CONDITIONS.IsMagmaGameMode() or not Engine.CFHBIHABCB(arg_2_1) then
		var_2_0 = Challenge.ActivationCategoryBR
	elseif CONDITIONS.IsThirdGameMode() then
		var_2_0 = Challenge.ActivationCategoryCP
	end

	local var_2_1 = Challenge.GetActiveMissionData(arg_2_1, var_2_0)

	if var_2_1 then
		arg_2_0.MissionHeader.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSION_N", var_2_1.name))
		arg_2_0.Mission:SetData(var_2_1, true)
	else
		ACTIONS.AnimateSequence(arg_2_0.Mission, "TitleOnly")
		arg_2_0.Mission.Title:setText(Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION_MSG"))

		if IsLanguageArabic() then
			arg_2_0.Mission.Title:SetBottom(20)
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Mission:SetAlpha(arg_3_2 and 1 or 0)
	arg_3_0.MissionBackground:SetAlpha(arg_3_2 and 1 or 0)
	arg_3_0.MissionHeader:SetAlpha(arg_3_2 and 1 or 0)
end

local function var_0_3(arg_4_0)
	return arg_4_0.ViewChallengesPrompt
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.ViewChallengesPrompt)

	arg_5_0.GetPromptContainer = var_0_3
	arg_5_0.SetupMissionChallengeVisibility = var_0_2

	arg_5_0.ChallengeResetTimer:SetupRightAlignment()

	if CONDITIONS.IsWZWipFlowEnabled() then
		assert(arg_5_0.WZWipChallengeGrid, "WZWipChallengeGrid is nil")
		arg_5_0.WZWipChallengeGrid:SetNumChildren(Challenge.numSummaryItems)

		arg_5_0._dailyChallengeItems = arg_5_0.WZWipChallengeGrid:GetBuiltChildren()
	else
		assert(arg_5_0.Daily1, "Daily1 is nil")
		assert(arg_5_0.Daily2, "Daily2 is nil")
		assert(arg_5_0.Daily3, "Daily3 is nil")

		arg_5_0._dailyChallengeItems = {
			arg_5_0.Daily1,
			arg_5_0.Daily2,
			arg_5_0.Daily3
		}
	end

	var_0_0(arg_5_0, arg_5_1)

	if not CONDITIONS.IsMagmaGameMode(arg_5_0) then
		var_0_1(arg_5_0, arg_5_1)
	end

	local function var_5_0(arg_6_0, arg_6_1)
		if CONDITIONS.InFrontend() then
			if LUI.IsLastInputKeyboardMouse(arg_6_1.controllerIndex) then
				ACTIONS.AnimateSequence(arg_6_0, "PC")
			else
				ACTIONS.AnimateSequence(arg_6_0, "Console")
			end
		end
	end

	arg_5_0:addAndCallEventHandler("update_input_type", var_5_0, {
		controllerIndex = arg_5_1
	})

	if not CONDITIONS.InFrontend() then
		ACTIONS.AnimateSequence(arg_5_0, "HidePrompts")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_5_0, "JP")
	end

	arg_5_0:addEventHandler("new_daily_challenges", function(arg_7_0, arg_7_1)
		var_0_0(arg_7_0, arg_5_1)
	end)
	arg_5_0:addEventHandler("new_br_daily_challenges", function(arg_8_0, arg_8_1)
		var_0_0(arg_8_0, arg_5_1)
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_5_0.ChallengeHeader.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES")))
		arg_5_0.ViewChallengesLabel:SetAlignment(LUI.Alignment.Right)
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")

		if CONDITIONS.InGame() then
			arg_5_0.ViewChallengesPrompt:SetMouseFocusBlocker(true)
			ACTIONS.AnimateSequence(arg_5_0, "WZWipModNoPrompts")
		end
	end

	if arg_5_0.DoubleXPNotifications and arg_5_0.DoubleXPNotifications.EarnRateBuff then
		ACTIONS.AnimateSequence(arg_5_0.DoubleXPNotifications.EarnRateBuff, "LabelLeft")
	end
end

function ChallengesSummary(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 454 * _1080p)

	var_9_0.id = "ChallengesSummary"
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

	var_9_4.id = "Background"

	var_9_4:SetAlpha(0.5, 0)
	var_9_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 156, _1080p * 460)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_9_5 = LUI.UIImage.new()
		var_9_5.id = "WZWipPromptBackground"

		var_9_5:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
		var_9_5:SetAlpha(0.45, 0)
		var_9_5:setImage(RegisterMaterial("ui_mp_wz_bkg_challenge"), 0)
		var_9_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 338)
		var_9_0:addElement(var_9_5)

		var_9_0.WZWipPromptBackground = var_9_5
	end

	local var_9_6
	local var_9_7 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_7.id = "MissionBackground"

	var_9_7:SetAlpha(0.5, 0)
	var_9_7.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_9_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 141)
	var_9_0:addElement(var_9_7)

	var_9_0.MissionBackground = var_9_7

	local var_9_8

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_9_8 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
			controllerIndex = var_9_1
		})
		var_9_8.id = "Daily1"

		var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 202, _1080p * 278)
		var_9_0:addElement(var_9_8)

		var_9_0.Daily1 = var_9_8
	end

	local var_9_9

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_9_9 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
			controllerIndex = var_9_1
		})
		var_9_9.id = "Daily2"

		var_9_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 278, _1080p * 354)
		var_9_0:addElement(var_9_9)

		var_9_0.Daily2 = var_9_9
	end

	local var_9_10

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_9_10 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
			controllerIndex = var_9_1
		})
		var_9_10.id = "Daily3"

		var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 354, _1080p * 430)
		var_9_0:addElement(var_9_10)

		var_9_0.Daily3 = var_9_10
	end

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "Mission"

	var_9_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 54, _1080p * 130)
	var_9_0:addElement(var_9_12)

	var_9_0.Mission = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "ChallengeHeader"

	var_9_14.Text:SetLeft(0, 0)
	var_9_14.Text:SetRight(0, 0)
	var_9_14.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES"), 0)
	var_9_14.Text:SetAlignment(LUI.Alignment.Left)
	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 237, _1080p * 156, _1080p * 202)
	var_9_0:addElement(var_9_14)

	var_9_0.ChallengeHeader = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "MissionHeader"

	var_9_16.Text:SetLeft(0, 0)
	var_9_16.Text:SetRight(0, 0)
	var_9_16.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/ACTIVE_MISSION"), 0)
	var_9_16.Text:SetAlignment(LUI.Alignment.Center)
	var_9_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 46)
	var_9_0:addElement(var_9_16)

	var_9_0.MissionHeader = var_9_16

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "ViewChallengesPrompt"

	if CONDITIONS.AlwaysFalse() then
		var_9_18.Label:setText(Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT"), 0)
	end

	var_9_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -430, _1080p * -260, _1080p * 464, _1080p * 495)
	var_9_0:addElement(var_9_18)

	var_9_0.ViewChallengesPrompt = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIStyledText.new()

	var_9_20.id = "ViewChallengesLabel"

	var_9_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_20:setText(Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT_CONTROLLER"), 0)
	var_9_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_20:SetWordWrap(false)
	var_9_20:SetAlignment(LUI.Alignment.Left)
	var_9_20:SetTintFontIcons(true)
	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 302, _1080p * 464, _1080p * 486)
	var_9_0:addElement(var_9_20)

	var_9_0.ViewChallengesLabel = var_9_20

	local var_9_21

	if CONDITIONS.InGame() then
		var_9_21 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
			controllerIndex = var_9_1
		})
		var_9_21.id = "DoubleXPNotifications"

		var_9_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 46, _1080p * 430, _1080p * 465, _1080p * 595)
		var_9_0:addElement(var_9_21)

		var_9_0.DoubleXPNotifications = var_9_21
	end

	local var_9_22
	local var_9_23 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_9_1
	})

	var_9_23.id = "ChallengeResetTimer"

	var_9_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 322, _1080p * 400, _1080p * 167, _1080p * 197)
	var_9_0:addElement(var_9_23)

	var_9_0.ChallengeResetTimer = var_9_23

	local var_9_24

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_9_24 = LUI.UIImage.new()
		var_9_24.id = "WZWipTopDivider"

		var_9_24:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
		var_9_24:SetAlpha(0.65, 0)
		var_9_24:setImage(RegisterMaterial("line_dot_ch2"), 0)
		var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 422, _1080p * 201, _1080p * 203)
		var_9_0:addElement(var_9_24)

		var_9_0.WZWipTopDivider = var_9_24
	end

	local var_9_25

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_26 = {
			scrollingThresholdX = 1,
			maxVisibleRows = 3,
			maxVelocity = 5000,
			adjustSizeToContent = true,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleColumns = 1,
			wrapY = true,
			arrowsVerticalOffset = 0,
			forcePrimaryAxisScrolling = true,
			buildArrowsLabel = false,
			springCoefficient = 400,
			controllerIndex = var_9_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("WZChallengesSummaryItem", {
					controllerIndex = var_9_1
				})
			end,
			refreshChild = function(arg_11_0, arg_11_1, arg_11_2)
				return
			end,
			primaryAxis = LUI.DIRECTION.vertical,
			spacingX = _1080p * 0,
			spacingY = _1080p * 0,
			columnWidth = _1080p * 410,
			rowHeight = _1080p * 94,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_9_25 = LUI.UIGrid.new(var_9_26)
		var_9_25.id = "WZWipChallengeGrid"

		var_9_25:SetAlpha(0, 0)
		var_9_25:setUseStencil(false)
		var_9_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 168, _1080p * 438)
		var_9_0:addElement(var_9_25)

		var_9_0.WZWipChallengeGrid = var_9_25
	end

	local var_9_27

	if CONDITIONS.IsWZWipFrontend() then
		var_9_27 = MenuBuilder.BuildRegisteredType("WZChallengesSummaryRewardsPanel", {
			controllerIndex = var_9_1
		})
		var_9_27.id = "WZWipRewardsPanel"

		var_9_27:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 10, _1080p * 110)
		var_9_0:addElement(var_9_27)

		var_9_0.WZWipRewardsPanel = var_9_27
	end

	local var_9_28

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() and Engine.DDJFBBJAIG() and CONDITIONS.IsBlueprintBlitzEnabled() then
		local var_9_29 = MenuBuilder.BuildRegisteredType("BlueprintBlitzMainMenuItem", {
			controllerIndex = var_9_1
		})

		var_9_29.id = "BlueprintBlitzItem"

		var_9_29:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 382, _1080p * 538)
		var_9_0:addElement(var_9_29)

		var_9_0.BlueprintBlitzItem = var_9_29
	end

	local function var_9_30()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_30

	local var_9_31
	local var_9_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("HideDaily", var_9_32)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_8:RegisterAnimationSequence("HideDaily", var_9_33)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("HideDaily", var_9_34)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_10:RegisterAnimationSequence("HideDaily", var_9_35)
	end

	local var_9_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("HideDaily", var_9_36)

	local var_9_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_9_18:RegisterAnimationSequence("HideDaily", var_9_37)

	local var_9_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 166
		}
	}

	var_9_20:RegisterAnimationSequence("HideDaily", var_9_38)

	if CONDITIONS.InGame() then
		local var_9_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 257
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 377
			}
		}

		var_9_21:RegisterAnimationSequence("HideDaily", var_9_39)
	end

	local function var_9_40()
		var_9_4:AnimateSequence("HideDaily")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_8:AnimateSequence("HideDaily")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_9:AnimateSequence("HideDaily")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_10:AnimateSequence("HideDaily")
		end

		var_9_14:AnimateSequence("HideDaily")
		var_9_18:AnimateSequence("HideDaily")
		var_9_20:AnimateSequence("HideDaily")

		if CONDITIONS.InGame() then
			var_9_21:AnimateSequence("HideDaily")
		end
	end

	var_9_0._sequences.HideDaily = var_9_40

	local var_9_41
	local var_9_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		}
	}

	var_9_4:RegisterAnimationSequence("DailyX1", var_9_42)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_43 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_8:RegisterAnimationSequence("DailyX1", var_9_43)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("DailyX1", var_9_44)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_10:RegisterAnimationSequence("DailyX1", var_9_45)
	end

	local var_9_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 336
		}
	}

	var_9_18:RegisterAnimationSequence("DailyX1", var_9_46)

	local var_9_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		}
	}

	var_9_20:RegisterAnimationSequence("DailyX1", var_9_47)

	if CONDITIONS.InGame() then
		local var_9_48 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 390
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 520
			}
		}

		var_9_21:RegisterAnimationSequence("DailyX1", var_9_48)
	end

	local function var_9_49()
		var_9_4:AnimateSequence("DailyX1")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_8:AnimateSequence("DailyX1")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_9:AnimateSequence("DailyX1")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_10:AnimateSequence("DailyX1")
		end

		var_9_18:AnimateSequence("DailyX1")
		var_9_20:AnimateSequence("DailyX1")

		if CONDITIONS.InGame() then
			var_9_21:AnimateSequence("DailyX1")
		end
	end

	var_9_0._sequences.DailyX1 = var_9_49

	local var_9_50
	local var_9_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		}
	}

	var_9_4:RegisterAnimationSequence("DailyX2", var_9_51)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_52 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_8:RegisterAnimationSequence("DailyX2", var_9_52)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_53 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("DailyX2", var_9_53)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_10:RegisterAnimationSequence("DailyX2", var_9_54)
	end

	local var_9_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 412
		}
	}

	var_9_18:RegisterAnimationSequence("DailyX2", var_9_55)

	local var_9_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 403
		}
	}

	var_9_20:RegisterAnimationSequence("DailyX2", var_9_56)

	if CONDITIONS.InGame() then
		local var_9_57 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 414
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 534
			}
		}

		var_9_21:RegisterAnimationSequence("DailyX2", var_9_57)
	end

	local function var_9_58()
		var_9_4:AnimateSequence("DailyX2")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_8:AnimateSequence("DailyX2")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_9:AnimateSequence("DailyX2")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_10:AnimateSequence("DailyX2")
		end

		var_9_18:AnimateSequence("DailyX2")
		var_9_20:AnimateSequence("DailyX2")

		if CONDITIONS.InGame() then
			var_9_21:AnimateSequence("DailyX2")
		end
	end

	var_9_0._sequences.DailyX2 = var_9_58

	local var_9_59
	local var_9_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("PC", var_9_60)

	local var_9_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("PC", var_9_61)

	local function var_9_62()
		var_9_18:AnimateSequence("PC")
		var_9_20:AnimateSequence("PC")
	end

	var_9_0._sequences.PC = var_9_62

	local var_9_63
	local var_9_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("Console", var_9_64)

	local var_9_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("Console", var_9_65)

	local function var_9_66()
		var_9_18:AnimateSequence("Console")
		var_9_20:AnimateSequence("Console")
	end

	var_9_0._sequences.Console = var_9_66

	local var_9_67
	local var_9_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("HidePrompts", var_9_68)

	local var_9_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("HidePrompts", var_9_69)

	local function var_9_70()
		var_9_18:AnimateSequence("HidePrompts")
		var_9_20:AnimateSequence("HidePrompts")
	end

	var_9_0._sequences.HidePrompts = var_9_70

	local var_9_71
	local var_9_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("HideAll", var_9_72)

	local var_9_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("HideAll", var_9_73)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_8:RegisterAnimationSequence("HideAll", var_9_74)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_75 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("HideAll", var_9_75)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_76 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_10:RegisterAnimationSequence("HideAll", var_9_76)
	end

	local var_9_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("HideAll", var_9_77)

	local var_9_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("HideAll", var_9_78)

	local var_9_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("HideAll", var_9_79)

	if CONDITIONS.InGame() then
		local var_9_80 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 259
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 379
			}
		}

		var_9_21:RegisterAnimationSequence("HideAll", var_9_80)
	end

	local function var_9_81()
		var_9_4:AnimateSequence("HideAll")
		var_9_7:AnimateSequence("HideAll")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_8:AnimateSequence("HideAll")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_9:AnimateSequence("HideAll")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_10:AnimateSequence("HideAll")
		end

		var_9_12:AnimateSequence("HideAll")
		var_9_14:AnimateSequence("HideAll")
		var_9_16:AnimateSequence("HideAll")

		if CONDITIONS.InGame() then
			var_9_21:AnimateSequence("HideAll")
		end
	end

	var_9_0._sequences.HideAll = var_9_81

	local function var_9_82()
		return
	end

	var_9_0._sequences.AR = var_9_82

	local function var_9_83()
		return
	end

	var_9_0._sequences.TimerBlink = var_9_83

	local var_9_84
	local var_9_85 = {
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_9_23:RegisterAnimationSequence("JP", var_9_85)

	local function var_9_86()
		var_9_23:AnimateSequence("JP")
	end

	var_9_0._sequences.JP = var_9_86

	local var_9_87
	local var_9_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipSetup", var_9_88)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_89 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 382
			},
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			}
		}

		var_9_5:RegisterAnimationSequence("WZWipSetup", var_9_89)
	end

	local var_9_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipSetup", var_9_90)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_91 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_8:RegisterAnimationSequence("WZWipSetup", var_9_91)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_92 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_9:RegisterAnimationSequence("WZWipSetup", var_9_92)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_93 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_10:RegisterAnimationSequence("WZWipSetup", var_9_93)
	end

	local var_9_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 99
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("WZWipSetup", var_9_94)

	local var_9_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 274
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.ChallengeHeader.Divider
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_9_0.ChallengeHeader.Divider
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_9_0.ChallengeHeader.Text
		}
	}

	var_9_14:RegisterAnimationSequence("WZWipSetup", var_9_95)

	local var_9_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_9_0.MissionHeader.Divider
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_9_0.MissionHeader.Text
		}
	}

	var_9_16:RegisterAnimationSequence("WZWipSetup", var_9_96)

	local var_9_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 337
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 182
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_9_18:RegisterAnimationSequence("WZWipSetup", var_9_97)

	local var_9_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 343
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 365
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -272
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -18
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_9_20:RegisterAnimationSequence("WZWipSetup", var_9_98)

	if CONDITIONS.InGame() then
		local var_9_99 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 42
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 383
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 426
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 513
			}
		}

		var_9_21:RegisterAnimationSequence("WZWipSetup", var_9_99)
	end

	local var_9_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 341
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 419
		}
	}

	var_9_23:RegisterAnimationSequence("WZWipSetup", var_9_100)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_101 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 40
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 38
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 12
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 428
			},
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

		var_9_24:RegisterAnimationSequence("WZWipSetup", var_9_101)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_102 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 12
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 45
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 412
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 375
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_25:RegisterAnimationSequence("WZWipSetup", var_9_102)
	end

	if CONDITIONS.IsWZWipFrontend() then
		local var_9_103 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -111
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -11
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_27:RegisterAnimationSequence("WZWipSetup", var_9_103)
	end

	local function var_9_104()
		var_9_4:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_9_5:AnimateSequence("WZWipSetup")
		end

		var_9_7:AnimateSequence("WZWipSetup")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_8:AnimateSequence("WZWipSetup")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_9:AnimateSequence("WZWipSetup")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_9_10:AnimateSequence("WZWipSetup")
		end

		var_9_12:AnimateSequence("WZWipSetup")
		var_9_14:AnimateSequence("WZWipSetup")
		var_9_16:AnimateSequence("WZWipSetup")
		var_9_18:AnimateSequence("WZWipSetup")
		var_9_20:AnimateSequence("WZWipSetup")

		if CONDITIONS.InGame() then
			var_9_21:AnimateSequence("WZWipSetup")
		end

		var_9_23:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_9_24:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_9_25:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipFrontend() then
			var_9_27:AnimateSequence("WZWipSetup")
		end
	end

	var_9_0._sequences.WZWipSetup = var_9_104

	local var_9_105
	local var_9_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipModNoPrompts", var_9_106)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_107 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 338
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Right
			}
		}

		var_9_5:RegisterAnimationSequence("WZWipModNoPrompts", var_9_107)
	end

	local var_9_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipModNoPrompts", var_9_108)

	local var_9_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("WZWipModNoPrompts", var_9_109)

	local var_9_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("WZWipModNoPrompts", var_9_110)

	local var_9_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 211
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 440
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 243
		}
	}

	var_9_18:RegisterAnimationSequence("WZWipModNoPrompts", var_9_111)

	local var_9_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 364
		}
	}

	var_9_20:RegisterAnimationSequence("WZWipModNoPrompts", var_9_112)

	if CONDITIONS.InGame() then
		local var_9_113 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 41
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 383
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 425
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 513
			}
		}

		var_9_21:RegisterAnimationSequence("WZWipModNoPrompts", var_9_113)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_114 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 40
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 38
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 416
			}
		}

		var_9_24:RegisterAnimationSequence("WZWipModNoPrompts", var_9_114)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_115 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 7
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 45
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 407
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 346
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_25:RegisterAnimationSequence("WZWipModNoPrompts", var_9_115)
	end

	if CONDITIONS.IsWZWipFrontend() then
		local var_9_116 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -111
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -11
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -12
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 418
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_27:RegisterAnimationSequence("WZWipModNoPrompts", var_9_116)
	end

	local function var_9_117()
		var_9_4:AnimateSequence("WZWipModNoPrompts")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_9_5:AnimateSequence("WZWipModNoPrompts")
		end

		var_9_7:AnimateSequence("WZWipModNoPrompts")
		var_9_12:AnimateSequence("WZWipModNoPrompts")
		var_9_16:AnimateSequence("WZWipModNoPrompts")
		var_9_18:AnimateSequence("WZWipModNoPrompts")
		var_9_20:AnimateSequence("WZWipModNoPrompts")

		if CONDITIONS.InGame() then
			var_9_21:AnimateSequence("WZWipModNoPrompts")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_9_24:AnimateSequence("WZWipModNoPrompts")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_9_25:AnimateSequence("WZWipModNoPrompts")
		end

		if CONDITIONS.IsWZWipFrontend() then
			var_9_27:AnimateSequence("WZWipModNoPrompts")
		end
	end

	var_9_0._sequences.WZWipModNoPrompts = var_9_117

	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("ChallengesSummary", ChallengesSummary)
LockTable(_M)
