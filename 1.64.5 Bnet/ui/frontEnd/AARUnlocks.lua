module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = {
		name = "",
		type = ""
	}

	if arg_1_4 then
		arg_1_0.UnlocksGrid:SetNumChildren(0)

		return
	end

	arg_1_0._unlockIDs = arg_1_2

	if arg_1_3 then
		arg_1_0.Title.Text:setText(Engine.CBBHFCGDIC("AAR/UNLOCKED"))

		local var_1_1 = 4
		local var_1_2 = math.min(#arg_1_2, var_1_1)
		local var_1_3 = 0
		local var_1_4 = 1

		while var_1_3 < var_1_2 and var_1_4 <= #arg_1_0._unlockIDs do
			var_1_0.name = ""
			var_1_0.type = ""
			var_1_0.icon = nil

			local var_1_5 = arg_1_0._unlockIDs[var_1_4] and arg_1_0._unlockIDs[var_1_4].ID or nil

			if var_1_5 then
				local var_1_6 = AAR.GetUnlockData(arg_1_1, var_1_5)

				if var_1_6 then
					var_1_0.name = var_1_6.name
					var_1_0.type = var_1_6.lootTypeName
					var_1_0.icon = var_1_6.icon
				end

				if var_1_0.name == nil or #var_1_0.name == 0 or var_1_0.icon == nil or #var_1_0.icon == 0 or var_1_0.type == nil or #var_1_0.type == 0 then
					table.remove(arg_1_0._unlockIDs, var_1_4)
				else
					var_1_3 = var_1_3 + 1
					var_1_4 = var_1_4 + 1
				end
			end
		end

		arg_1_0.UnlocksGrid:SetNumChildren(var_1_3)
		arg_1_0.UnlocksGrid:RefreshContent()
	else
		local var_1_7 = arg_1_2[1] and arg_1_2[1].ID or nil

		if var_1_7 then
			local var_1_8 = AAR.GetUnlockData(arg_1_1, var_1_7)

			if var_1_8 then
				arg_1_0.Title.Text:setText(Engine.CBBHFCGDIC("AAR/RECENT_UNLOCKS"))

				var_1_0.name = var_1_8.name
				var_1_0.type = var_1_8.lootTypeName
				var_1_0.icon = var_1_8.icon
			end

			if not (var_1_0.name == nil or #var_1_0.name == 0 or var_1_0.icon == nil or #var_1_0.icon == 0 or var_1_0.type == nil or #var_1_0.type == 0) then
				arg_1_0.UnlocksGrid:SetNumChildren(1)
				arg_1_0.UnlocksGrid:RefreshContent()
			else
				arg_1_0.UnlocksGrid:SetNumChildren(0)
			end
		end
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitUnlock = var_0_0
	arg_2_0._unlockIDs = {}

	arg_2_0.UnlocksGrid:SetNumChildren(0)
	arg_2_0.UnlocksGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_1 + 1

		arg_3_0:UpdateUnlockData(arg_2_1, arg_2_0._unlockIDs[var_3_0].ID)
		ACTIONS.AnimateSequence(arg_3_0, "ScaleCard")
	end)

	if arg_2_0.ViewAllUnlocks and arg_2_0.ViewAllUnlocksButton then
		arg_2_0:registerAndCallEventHandler("update_input_type", function(arg_4_0, arg_4_1)
			local var_4_0 = LUI.IsLastInputKeyboardMouse(arg_4_1.controllerIndex) and "ShowPromptKBM" or "ShowPromptGamepad"

			ACTIONS.AnimateSequence(arg_4_0, var_4_0)
		end, {
			element = arg_2_0,
			controllerIndex = arg_2_1
		})
	end

	local var_2_0 = LUI.UIBindButton.new()

	var_2_0.id = "bindButton"

	arg_2_0:addElement(var_2_0)

	arg_2_0.bindButton = var_2_0

	arg_2_0.bindButton:registerEventHandler("button_alt2", function(arg_5_0, arg_5_1)
		ACTIONS.OpenMenu("UnlocksMenu", true, arg_5_1.controller)
	end)
	arg_2_0.ViewAllUnlocksButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		ACTIONS.OpenMenu("UnlocksMenu", true, arg_6_1.controller)
	end)

	local var_2_1 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_alt2",
				button_ref = "button_alt2",
				helper_text = ""
			}
		}
	}

	arg_2_0.ViewAllUnlocksButton:AddTooltipData(arg_2_1, var_2_1)
	ACTIONS.AnimateSequence(arg_2_0.Title, IsLanguageArabic() and "ARLeftAligned" or "LeftAligned")
end

function AARUnlocks(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 360 * _1080p)

	var_7_0.id = "AARUnlocks"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:setUseStencil(true)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "Background"

	var_7_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_7_4:SetAlpha(0.5, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "Title"

	var_7_6.Text:setText(Engine.CBBHFCGDIC("AAR/UNLOCKED"), 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_7_0:addElement(var_7_6)

	var_7_0.Title = var_7_6

	local var_7_7
	local var_7_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZUnlocksLootItem", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 230,
		rowHeight = _1080p * 309,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_9 = LUI.UIGrid.new(var_7_8)

	var_7_9.id = "UnlocksGrid"

	var_7_9:setUseStencil(false)
	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 1414, _1080p * 53, _1080p * 453)
	var_7_0:addElement(var_7_9)

	var_7_0.UnlocksGrid = var_7_9

	local var_7_10
	local var_7_11 = LUI.UIStyledText.new()

	var_7_11.id = "ViewAllUnlocks"

	var_7_11:setText(Engine.CBBHFCGDIC("AAR/VIEW_ALL_UNLOCKS"), 0)
	var_7_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_11:SetWordWrap(false)
	var_7_11:SetAlignment(LUI.Alignment.Left)
	var_7_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_11:SetStartupDelay(1000)
	var_7_11:SetLineHoldTime(400)
	var_7_11:SetAnimMoveTime(1500)
	var_7_11:SetAnimMoveSpeed(1500)
	var_7_11:SetEndDelay(1000)
	var_7_11:SetCrossfadeTime(400)
	var_7_11:SetFadeInTime(300)
	var_7_11:SetFadeOutTime(300)
	var_7_11:SetMaxVisibleLines(1)
	var_7_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -205, _1080p * -8, _1080p * 17, _1080p * 37)
	var_7_0:addElement(var_7_11)

	var_7_0.ViewAllUnlocks = var_7_11

	local var_7_12
	local var_7_13 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_13.id = "ViewAllUnlocksButton"

	var_7_13.Text:SetLeft(_1080p * 20, 0)
	var_7_13.Text:setText(Engine.CBBHFCGDIC("AAR/VIEW_ALL_UNLOCKS_KBM"), 0)
	var_7_13.Text:SetAlignment(LUI.Alignment.Center)
	var_7_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -223, _1080p * -8, _1080p * 8, _1080p * 39)
	var_7_0:addElement(var_7_13)

	var_7_0.ViewAllUnlocksButton = var_7_13

	local function var_7_14()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_14

	local var_7_15
	local var_7_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		}
	}

	var_7_9:RegisterAnimationSequence("UnlockedNewItems", var_7_16)

	local function var_7_17()
		var_7_9:AnimateSequence("UnlockedNewItems")
	end

	var_7_0._sequences.UnlockedNewItems = var_7_17

	local var_7_18
	local var_7_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_11:RegisterAnimationSequence("ShowPromptKBM", var_7_19)

	local var_7_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("ShowPromptKBM", var_7_20)

	local function var_7_21()
		var_7_11:AnimateSequence("ShowPromptKBM")
		var_7_13:AnimateSequence("ShowPromptKBM")
	end

	var_7_0._sequences.ShowPromptKBM = var_7_21

	local var_7_22
	local var_7_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_11:RegisterAnimationSequence("ShowPromptGamepad", var_7_23)

	local var_7_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("ShowPromptGamepad", var_7_24)

	local function var_7_25()
		var_7_11:AnimateSequence("ShowPromptGamepad")
		var_7_13:AnimateSequence("ShowPromptGamepad")
	end

	var_7_0._sequences.ShowPromptGamepad = var_7_25

	PostLoadFunc(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("AARUnlocks", AARUnlocks)
LockTable(_M)
