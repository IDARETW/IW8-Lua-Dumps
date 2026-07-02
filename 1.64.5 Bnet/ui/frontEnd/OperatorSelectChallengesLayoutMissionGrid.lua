module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = CONDITIONS.IsWZWipOperatorFlowEnabled() and "LUA_MENU/WZ_VIEW_MISSIONS" or "LUA_MENU/VIEW_MISSIONS"

	arg_1_0.PromptPreview:setText(Engine.CBBHFCGDIC(var_1_0))
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = 0

	for iter_2_0 = 1, #arg_2_1 do
		if arg_2_1[iter_2_0].complete then
			var_2_0 = var_2_0 + 1
		end
	end

	local var_2_1 = #arg_2_1
	local var_2_2 = math.min(var_2_1, arg_2_0.Grid:GetMaxVisibleRows())
	local var_2_3, var_2_4, var_2_5, var_2_6 = arg_2_0.Complete:getLocalRect()
	local var_2_7 = var_2_6 + arg_2_0.Grid:GetRowHeight() * var_2_2 + arg_2_0.Grid:GetSpacingY() * var_2_2

	arg_2_0.Background:setHeight(var_2_7)

	local var_2_8 = -10 * _1080p
	local var_2_9, var_2_10, var_2_11, var_2_12 = arg_2_0.PromptPreview:getLocalRect()
	local var_2_13 = math.abs(var_2_10 - var_2_12)

	arg_2_0.PromptPreview:SetTop(var_2_7 + var_2_8)
	arg_2_0.PromptPreview:SetBottom(var_2_7 + var_2_8 + var_2_13)
	arg_2_0.Complete:setText(Engine.CBBHFCGDIC("LUA_MENU/COMPLETED_OBJECTIVES", var_2_0, var_2_2))
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_1)

	arg_3_0._missions = arg_3_1

	local var_3_0 = #arg_3_1
	local var_3_1 = math.min(var_3_0, arg_3_0.Grid:GetMaxVisibleRows())

	arg_3_0.Grid:SetNumChildren(var_3_1)
	var_0_1(arg_3_0, arg_3_1)
	arg_3_0.Grid:RefreshContent()
end

local function var_0_3(arg_4_0)
	arg_4_0.Grid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_4_0._missions then
			local var_5_0 = arg_5_2 + 1
			local var_5_1 = arg_4_0._missions[var_5_0]

			arg_5_0:Setup(var_5_1, var_5_0)
		end
	end)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.UpdateDetails = var_0_1
	arg_6_0.UpdateGrid = var_0_2

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_0_3(arg_6_0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_6_0.MissionsDivider, "JP")
	end

	var_0_0(arg_6_0)
end

function OperatorSelectChallengesLayoutMissionGrid(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 240 * _1080p)

	var_7_0.id = "OperatorSelectChallengesLayoutMissionGrid"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_7_4:SetAlpha(0.5, 0)
	var_7_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_7_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 253)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_7_5 = LUI.UIImage.new()
		var_7_5.id = "WZWipPromptBackground"

		var_7_5:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
		var_7_5:SetAlpha(0, 0)
		var_7_5:setImage(RegisterMaterial("ui_mp_wz_bkg_challenge"), 0)
		var_7_0:addElement(var_7_5)

		var_7_0.WZWipPromptBackground = var_7_5
	end

	local var_7_6
	local var_7_7 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MissionStatus", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 68,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_8 = LUI.UIGrid.new(var_7_7)

	var_7_8.id = "Grid"

	var_7_8:setUseStencil(true)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 453, _1080p * 60, _1080p * 260)
	var_7_0:addElement(var_7_8)

	var_7_0.Grid = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIText.new()

	var_7_10.id = "PromptPreview"

	var_7_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_7_10:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_MISSIONS"), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetTintFontIcons(true)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 279, _1080p * 241, _1080p * 265)
	var_7_0:addElement(var_7_10)

	var_7_0.PromptPreview = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "MissionHeader"

	var_7_12.Text:SetLeft(0, 0)
	var_7_12.Text:SetRight(0, 0)
	var_7_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"), 0)
	var_7_12.Text:SetAlignment(LUI.Alignment.Center)
	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 46)
	var_7_0:addElement(var_7_12)

	var_7_0.MissionHeader = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIStyledText.new()

	var_7_14.id = "Complete"

	var_7_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_14:setText(Engine.CBBHFCGDIC("LUA_MENU/COMPLETED_OBJECTIVES"), 0)
	var_7_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_14:SetAlignment(LUI.Alignment.Right)
	var_7_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_14:SetStartupDelay(2000)
	var_7_14:SetLineHoldTime(400)
	var_7_14:SetAnimMoveTime(2000)
	var_7_14:SetAnimMoveSpeed(150)
	var_7_14:SetEndDelay(2000)
	var_7_14:SetCrossfadeTime(250)
	var_7_14:SetFadeInTime(300)
	var_7_14:SetFadeOutTime(300)
	var_7_14:SetMaxVisibleLines(1)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 301, _1080p * 439, _1080p * 51, _1080p * 69)
	var_7_0:addElement(var_7_14)

	var_7_0.Complete = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("TextDivider", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "MissionsDivider"

	var_7_16.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"), 0)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 386, _1080p * 130, _1080p * 160)
	var_7_0:addElement(var_7_16)

	var_7_0.MissionsDivider = var_7_16

	local var_7_17

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_7_17 = MenuBuilder.BuildRegisteredType("WZSelectOperatorProgress", {
			controllerIndex = var_7_1
		})
		var_7_17.id = "WZWipSelectOperatorProgress"

		var_7_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 453, _1080p * 60, _1080p * 120)
		var_7_0:addElement(var_7_17)

		var_7_0.WZWipSelectOperatorProgress = var_7_17
	end

	local function var_7_18()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_18

	local var_7_19
	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 253
		}
	}

	var_7_4:RegisterAnimationSequence("OnOperatorUnlocked", var_7_20)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_21 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom
			}
		}

		var_7_5:RegisterAnimationSequence("OnOperatorUnlocked", var_7_21)
	end

	local var_7_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 260
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("OnOperatorUnlocked", var_7_22)

	local var_7_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 241
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 265
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("OnOperatorUnlocked", var_7_23)

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS"),
			child = var_7_0.MissionHeader.Text
		}
	}

	var_7_12:RegisterAnimationSequence("OnOperatorUnlocked", var_7_24)

	local var_7_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 69
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("OnOperatorUnlocked", var_7_25)

	local var_7_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("OnOperatorUnlocked", var_7_26)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_7_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_17:RegisterAnimationSequence("OnOperatorUnlocked", var_7_27)
	end

	local function var_7_28()
		var_7_4:AnimateSequence("OnOperatorUnlocked")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_5:AnimateSequence("OnOperatorUnlocked")
		end

		var_7_8:AnimateSequence("OnOperatorUnlocked")
		var_7_10:AnimateSequence("OnOperatorUnlocked")
		var_7_12:AnimateSequence("OnOperatorUnlocked")
		var_7_14:AnimateSequence("OnOperatorUnlocked")
		var_7_16:AnimateSequence("OnOperatorUnlocked")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_7_17:AnimateSequence("OnOperatorUnlocked")
		end
	end

	var_7_0._sequences.OnOperatorUnlocked = var_7_28

	local function var_7_29()
		return
	end

	var_7_0._sequences.OnOperatorLocked = var_7_29

	local function var_7_30()
		return
	end

	var_7_0._sequences.OnFreeToPlay = var_7_30

	local var_7_31
	local var_7_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipSetup", var_7_32)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_33 = {
			{
				value = 0.45,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_5:RegisterAnimationSequence("WZWipSetup", var_7_33)
	end

	local var_7_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_7_0.MissionHeader.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator,
			child = var_7_0.MissionHeader.Divider
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipSetup", var_7_34)

	local var_7_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator,
			child = var_7_0.MissionsDivider.LeftDivider
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText,
			child = var_7_0.MissionsDivider.Label
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator,
			child = var_7_0.MissionsDivider.RightDivider
		}
	}

	var_7_16:RegisterAnimationSequence("WZWipSetup", var_7_35)

	local function var_7_36()
		var_7_4:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_5:AnimateSequence("WZWipSetup")
		end

		var_7_12:AnimateSequence("WZWipSetup")
		var_7_16:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_7_4:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_38)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 99
			}
		}

		var_7_5:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_39)
	end

	local var_7_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 363
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_40)

	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 344
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 368
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_41)

	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_PROGRESSION"),
			child = var_7_0.MissionHeader.Text
		}
	}

	var_7_12:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_42)

	local var_7_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 183
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_43)

	local var_7_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_44)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_7_45 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_17:RegisterAnimationSequence("OnOperatorUnlockedVGWithMissions", var_7_45)
	end

	local function var_7_46()
		var_7_4:AnimateSequence("OnOperatorUnlockedVGWithMissions")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_5:AnimateSequence("OnOperatorUnlockedVGWithMissions")
		end

		var_7_8:AnimateSequence("OnOperatorUnlockedVGWithMissions")
		var_7_10:AnimateSequence("OnOperatorUnlockedVGWithMissions")
		var_7_12:AnimateSequence("OnOperatorUnlockedVGWithMissions")
		var_7_14:AnimateSequence("OnOperatorUnlockedVGWithMissions")
		var_7_16:AnimateSequence("OnOperatorUnlockedVGWithMissions")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_7_17:AnimateSequence("OnOperatorUnlockedVGWithMissions")
		end
	end

	var_7_0._sequences.OnOperatorUnlockedVGWithMissions = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 253
		}
	}

	var_7_4:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_48)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_49 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom
			}
		}

		var_7_5:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_49)
	end

	local var_7_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_50)

	local var_7_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_51)

	local var_7_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_PROGRESSION"),
			child = var_7_0.MissionHeader.Text
		}
	}

	var_7_12:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_52)

	local var_7_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_53)

	local var_7_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_54)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_7_55 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_17:RegisterAnimationSequence("OnOperatorUnlockedVG", var_7_55)
	end

	local function var_7_56()
		var_7_4:AnimateSequence("OnOperatorUnlockedVG")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_5:AnimateSequence("OnOperatorUnlockedVG")
		end

		var_7_8:AnimateSequence("OnOperatorUnlockedVG")
		var_7_10:AnimateSequence("OnOperatorUnlockedVG")
		var_7_12:AnimateSequence("OnOperatorUnlockedVG")
		var_7_14:AnimateSequence("OnOperatorUnlockedVG")
		var_7_16:AnimateSequence("OnOperatorUnlockedVG")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_7_17:AnimateSequence("OnOperatorUnlockedVG")
		end
	end

	var_7_0._sequences.OnOperatorUnlockedVG = var_7_56

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("OperatorSelectChallengesLayoutMissionGrid", OperatorSelectChallengesLayoutMissionGrid)
LockTable(_M)
