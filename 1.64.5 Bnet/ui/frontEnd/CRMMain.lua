module(..., package.seeall)

local var_0_0 = 4

local function var_0_1(arg_1_0)
	local var_1_0 = arg_1_0._currentMessageIndexDatasource:GetValue(arg_1_0._controllerIndex) or 0

	return arg_1_0._menuMessageData[var_1_0 + 1], var_1_0
end

local function var_0_2(arg_2_0)
	return not CONDITIONS.IsCRMEnabled() or #arg_2_0._menuMessageData == 0
end

local function var_0_3(arg_3_0)
	if arg_3_0.timer then
		arg_3_0.timer:closeTree()

		arg_3_0.timer = nil
	end

	if #arg_3_0._patchNoteData > 0 then
		arg_3_0:SetMinimized(true)
		arg_3_0.MessageText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/VIEW_PATCH_NOTES"))
	else
		arg_3_0:SetAlpha(0)
	end

	arg_3_0.CRMListGrid:SetNumChildren(0)
	arg_3_0.CRMListGrid:RefreshContent()
end

local function var_0_4(arg_4_0)
	if arg_4_0:ShouldHideCRM() then
		arg_4_0:HideCRM()
	else
		if not arg_4_0.timer then
			arg_4_0.timer = LUI.UITimer.new({
				interval = CRM.viewTime,
				event = {
					name = "scroll_crm",
					controllerIndex = arg_4_0._controllerIndex
				}
			})

			arg_4_0:addElement(arg_4_0.timer)
		end

		arg_4_0:SetMinimized(false)
		arg_4_0:SetAlpha(1)
		arg_4_0.CRMListGrid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
			local var_5_0 = arg_4_0._menuMessageData[arg_5_1 + 1]

			ACTIONS.AnimateSequence(arg_5_0, "DefaultSequence")
			arg_5_0:SetLayoutType(var_5_0[CRM.keys.LAYOUT_TYPE])

			if var_5_0[CRM.keys.LAYOUT_TYPE] == 1 then
				arg_5_0.Title:SetAlpha(0)
				arg_5_0.Vignette:SetAlpha(0)
			elseif var_5_0[CRM.keys.LAYOUT_TYPE] == 3 then
				ACTIONS.AnimateSequence(arg_5_0, "BLM")
				arg_5_0.Title:SetAlpha(1)
				arg_5_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM_VERTICAL")))
			else
				arg_5_0.Title:SetAlpha(1)
				arg_5_0.Vignette:SetAlpha(0.75)
				arg_5_0.Title:setText(var_5_0[CRM.keys.TITLE])

				if var_5_0[CRM.keys.LAYOUT_TYPE] == 2 then
					ACTIONS.AnimateSequence(arg_5_0, "BundleVer")
				end
			end

			local function var_5_1()
				local var_6_0 = var_5_0[CRM.keys.IMAGE]

				if var_6_0 and #var_6_0 > 0 then
					arg_5_0.Background:setImage(RegisterMaterial(var_6_0))
					arg_5_0.Background:SetAlpha(1)
				else
					arg_5_0.Background:SetAlpha(0)
				end
			end

			if var_5_0[CRM.keys.LAYOUT_TYPE] == 2 then
				local var_5_2 = var_5_0[CRM.keys.STORE_ITEM]

				if var_5_2 then
					local var_5_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_5_2, CSV.bundleIDs.cols.image)

					if var_5_3 and #var_5_3 > 0 then
						arg_5_0.Background:setImage(RegisterMaterial(var_5_3))
						arg_5_0.Background:SetAlpha(1)
					else
						var_5_1()
					end

					if arg_4_0._promotedItems[tostring(var_5_2)] then
						ACTIONS.AnimateSequence(arg_5_0, "ShowHotItem")
					end
				else
					var_5_1()
				end
			else
				var_5_1()
			end

			if var_5_0[CRM.keys.LAYOUT_TYPE] ~= 3 then
				ACTIONS.AnimateSequence(arg_5_0, "ButtonIdle")
			end
		end)
		arg_4_0.CRMListGrid:SetNumChildren(#arg_4_0._menuMessageData)
		arg_4_0.CRMListGrid:RefreshContent()

		local var_4_0 = arg_4_0.CRMListGrid:GetBuiltChildren()

		for iter_4_0, iter_4_1 in ipairs(var_4_0) do
			iter_4_1:SetFocusable(false)

			iter_4_1.m_requireFocusType = FocusType.MouseOver
		end

		local var_4_1 = arg_4_0._currentMessageIndexDatasource:GetValue(arg_4_0._controllerIndex) or 0

		if var_4_1 > arg_4_0.CRMListGrid:GetNumChildren() then
			var_4_1 = 0

			arg_4_0._currentMessageIndexDatasource:SetValue(arg_4_0._controllerIndex, 0)
		end

		arg_4_0.Pips:Resize(#arg_4_0._menuMessageData)
		arg_4_0.Pips:UpdateChildren(var_4_1, 0)
		arg_4_0.CRMListGrid:SetPosition({
			y = 0,
			x = var_4_1
		}, true)
		arg_4_0.CRMListGrid:SetTargetColumn(var_4_1, false, true)
		arg_4_0.MinimizedCount:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_4_1 + 1, #arg_4_0._menuMessageData))

		local var_4_2 = arg_4_0:GetCurrentMessageData()

		arg_4_0:UpdateActionPrompt(var_4_2)
	end
end

local function var_0_5(arg_7_0, arg_7_1)
	if arg_7_1 == nil then
		ACTIONS.AnimateSequence(arg_7_0, "HideButton")

		return
	elseif (not arg_7_1[CRM.keys.ACTION_TITLE] or arg_7_1[CRM.keys.ACTION_TITLE] == "") and (not arg_7_1[CRM.keys.CONTENT_LONG] or arg_7_1[CRM.keys.CONTENT_LONG] == "") then
		ACTIONS.AnimateSequence(arg_7_0, "HideButton")
	end

	if arg_7_0._isMinimized then
		arg_7_0.MessageText:setText(arg_7_1[CRM.keys.TITLE])
	else
		arg_7_0.MessageText:setText(arg_7_1[CRM.keys.CONTENT_SHORT])
	end
end

local function var_0_6(arg_8_0, arg_8_1)
	local var_8_0 = 16 * _1080p + (LUI.IsLastInputKeyboardMouse(arg_8_0._controllerIndex) and 10 * _1080p or 0)
	local var_8_1 = arg_8_0.CRMListGrid:GetNumChildren()
	local var_8_2 = not arg_8_1 or var_8_1 <= var_0_0

	arg_8_0.Pips:SetAlpha(var_8_2 and 1 or 0)
	arg_8_0.MinimizedCount:SetAlpha(not var_8_2 and 1 or 0)

	local var_8_3 = 0
	local var_8_4 = 430 * _1080p
	local var_8_5 = LUI.IsLastInputKeyboardMouse(arg_8_0._controllerIndex) and 10 * _1080p or -10 * _1080p
	local var_8_6 = LAYOUT.GetTextWidth(arg_8_0.ActionPrompt)

	if arg_8_1 then
		arg_8_0.Pips:SetAlignment(LUI.Alignment.Right)
		arg_8_0.Pips:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 105, _1080p * -42, _1080p * -38)

		if var_8_2 then
			var_8_3 = var_8_1 * (LAYOUT.GetElementHeight(arg_8_0.Pips) + var_8_0 / 2)

			local var_8_7 = arg_8_0.Pips:GetCurrentAnchorsAndPositions()

			arg_8_0.Pips:SetRight(var_8_4 - var_8_6 - var_8_5)
		else
			var_8_3 = LAYOUT.GetTextWidth(arg_8_0.MinimizedCount) + var_8_0

			local var_8_8 = arg_8_0.MinimizedCount:GetCurrentAnchorsAndPositions()

			arg_8_0.MinimizedCount:SetRight(-(var_8_6 + var_8_5))
		end
	else
		arg_8_0.Pips:SetAlignment(LUI.Alignment.Left)
		arg_8_0.Pips:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 105, _1080p * -71, _1080p * -67)

		var_8_3 = var_8_3 + var_8_0 / 2
	end

	arg_8_0.MessageText:SetRight(var_8_4 - var_8_6 - var_8_3, 100)
end

local function var_0_7(arg_9_0, arg_9_1)
	if arg_9_0._isMinimized ~= arg_9_1 then
		arg_9_0._isMinimized = arg_9_1

		local var_9_0 = arg_9_1 and "Minimize" or "Maximize"

		ACTIONS.AnimateSequence(arg_9_0, var_9_0)
		arg_9_0:UpdateMinimizedPips(arg_9_1)

		if arg_9_0.CRMListGrid:GetNumChildren() > 0 then
			local var_9_1 = arg_9_0:GetCurrentMessageData()
			local var_9_2 = var_9_1 and (arg_9_1 and var_9_1[CRM.keys.TITLE] or var_9_1[CRM.keys.CONTENT_SHORT]) or ""

			arg_9_0.MessageText:setText(var_9_2)
		end
	end
end

local function var_0_8(arg_10_0, arg_10_1)
	if arg_10_1.controller ~= Engine.IJEBHJIJF() then
		ACTIONS.AnimateSequence(arg_10_0, "SplitScreenWarningFlash")

		return
	end

	if #arg_10_0._menuMessageData > 0 or #arg_10_0._patchNoteData > 0 then
		local var_10_0 = LUI.FlowManager.GetCurrentMenu(arg_10_0)

		CRM.OpenCRMWindow(var_10_0, false)
	end
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_0.CRMListGrid)
	assert(arg_11_0.Pips)

	arg_11_1 = Engine.IJEBHJIJF()
	arg_11_0._controllerIndex = arg_11_1
	arg_11_0._currentMessageIndexDatasource = LUI.DataSourceInGlobalModel.new("frontEnd.CRM.currentMessageIndex")

	arg_11_0:setPriority(10)
	arg_11_0.CRMListGrid:SetMask(arg_11_0.Mask)

	arg_11_0.GetCurrentMessageData = var_0_1
	arg_11_0.UpdateActionPrompt = var_0_5
	arg_11_0.HideCRM = var_0_3
	arg_11_0.ShouldHideCRM = var_0_2
	arg_11_0.SetMinimized = var_0_7
	arg_11_0.CRMInteraction = var_0_8
	arg_11_0.UpdateMinimizedPips = var_0_6
	arg_11_0._menuMessageData = CRM.GetMenuMessageData()
	arg_11_0._patchNoteData = CRM.GetPatchNoteMessageData()
	arg_11_0._promotedItems = STORE.ParsePromotedItems(arg_11_1)

	local function var_11_0(arg_12_0, arg_12_1)
		if LUI.IsLastInputKeyboardMouse(arg_12_1.controllerIndex) then
			arg_12_0.ActionPrompt:setText("")
		else
			arg_12_0.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/OPEN_CRM_POPUP"))
			ACTIONS.AnimateSequence(arg_12_0, "MouseUnfocused")
		end

		arg_12_0:UpdateMinimizedPips(arg_12_0._isMinimized)
	end

	arg_11_0:addAndCallEventHandler("update_input_type", var_11_0, {
		controllerIndex = arg_11_1
	})

	local function var_11_1()
		if Engine.JEDFGECDJ() > 1 then
			arg_11_0.SplitScreenWarning:SetAlpha(1)
		else
			arg_11_0.SplitScreenWarning:SetAlpha(0)
		end
	end

	local var_11_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_11_0:SubscribeToModel(var_11_2:GetModel(arg_11_1), var_11_1, true)
	var_0_4(arg_11_0)
	arg_11_0:addEventHandler("update_crm_data", function(arg_14_0, arg_14_1)
		var_0_4(arg_14_0)

		return true
	end)
	arg_11_0:addEventHandler("scroll_crm", function(arg_15_0, arg_15_1)
		local var_15_0 = LUI.FlowManager.GetVisibleMenu().id
		local var_15_1 = arg_11_0.CRMListGrid:GetNumChildren()

		if var_15_0 ~= "CRMContainer" and var_15_0 ~= "CRMPatchNoteInfo" and var_15_1 > 1 then
			local var_15_2 = arg_11_0._currentMessageIndexDatasource:GetValue(arg_11_0._controllerIndex) or 0
			local var_15_3 = var_15_2 + 1 > var_15_1 - 1 and 0 or var_15_2 + 1

			arg_11_0._currentMessageIndexDatasource:SetValue(arg_11_1, var_15_3)

			local var_15_4 = var_0_1(arg_15_0)

			if var_15_4 == nil then
				return
			end

			arg_15_0.CRMListGrid:SetPosition({
				y = 0,
				x = var_15_3
			}, true)
			arg_15_0.CRMListGrid:SetTargetColumn(var_15_3, false, false)
			arg_15_0.Pips:UpdateChildren(var_15_3, 0)
			arg_15_0.MinimizedCount:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_15_3 + 1, var_15_1))
			arg_15_0:UpdateActionPrompt(var_15_4)
		end
	end)

	arg_11_0.messageTimer = LUI.UITimer.new({
		interval = Dvar.CFHDGABACF("LPRTSKKKLL") * 1000,
		event = {
			name = "send_queued_CRM_message",
			controllerIndex = arg_11_1
		}
	})

	arg_11_0:addElement(arg_11_0.messageTimer)
	arg_11_0.messageTimer:addEventHandler("send_queued_CRM_message", function(arg_16_0, arg_16_1)
		CRM.SendQueuedMessages()
	end)

	local var_11_3 = LUI.UIBindButton.new()

	var_11_3.id = "selfBindButton"

	arg_11_0:addElement(var_11_3)
	var_11_3:addEventHandler("button_right_trigger", function(arg_17_0, arg_17_1)
		if arg_17_1.qualifier == "gamepad" then
			var_0_8(arg_11_0, arg_17_1)
		end
	end)
	arg_11_0.MouseTrigger:SetHandleMouse(true)
	arg_11_0.MouseTrigger:registerEventHandler("mouseenter", function(arg_18_0, arg_18_1)
		if not arg_11_0._isMinimized then
			ACTIONS.AnimateSequence(arg_11_0, "MouseFocusedMaximized")
			Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		elseif #arg_11_0._patchNoteData > 0 then
			ACTIONS.AnimateSequence(arg_11_0, "MouseFocusedMinimized")
			Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		end
	end)
	arg_11_0.MouseTrigger:registerEventHandler("mouseleave", function(arg_19_0, arg_19_1)
		ACTIONS.AnimateSequence(arg_11_0, "MouseUnfocused")
	end)
	arg_11_0.MouseTrigger:registerEventHandler("leftmousedown", function(arg_20_0, arg_20_1)
		return
	end)
	arg_11_0.MouseTrigger:registerEventHandler("leftmouseup", function(arg_21_0, arg_21_1)
		if arg_21_1.inside then
			var_0_8(arg_11_0, arg_21_1)
		end
	end)
end

function CRMMain(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIElement.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 432 * _1080p, 0, 275 * _1080p)

	var_22_0.id = "CRMMain"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = LUI.UIImage.new()

	var_22_4.id = "MessageBG"

	var_22_4:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_22_4:SetAlpha(0.5, 0)
	var_22_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -55, _1080p * -27)
	var_22_0:addElement(var_22_4)

	var_22_0.MessageBG = var_22_4

	local var_22_5
	local var_22_6 = LUI.UIText.new()

	var_22_6.id = "ActionPrompt"

	var_22_6:setText(Engine.CBBHFCGDIC("LUA_MENU/OPEN_CRM_POPUP"), 0)
	var_22_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_6:SetWordWrap(false)
	var_22_6:SetAlignment(LUI.Alignment.Right)
	var_22_6:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -134, _1080p * -7, _1080p * -50, _1080p * -30)
	var_22_0:addElement(var_22_6)

	var_22_0.ActionPrompt = var_22_6

	local var_22_7
	local var_22_8 = LUI.UIStyledText.new()

	var_22_8.id = "MessageText"

	var_22_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_22_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_22_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_8:SetWordWrap(false)
	var_22_8:SetAlignment(LUI.Alignment.Left)
	var_22_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_22_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_22_8:SetStartupDelay(2000)
	var_22_8:SetLineHoldTime(400)
	var_22_8:SetAnimMoveTime(2000)
	var_22_8:SetAnimMoveSpeed(150)
	var_22_8:SetEndDelay(2000)
	var_22_8:SetCrossfadeTime(1000)
	var_22_8:SetFadeInTime(300)
	var_22_8:SetFadeOutTime(300)
	var_22_8:SetMaxVisibleLines(1)
	var_22_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 9, _1080p * 224, _1080p * -52, _1080p * -30)
	var_22_0:addElement(var_22_8)

	var_22_0.MessageText = var_22_8

	local var_22_9
	local var_22_10 = LUI.UIText.new()

	var_22_10.id = "MinimizedCount"

	var_22_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_22_10:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_22_10:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_22_10:SetWordWrap(false)
	var_22_10:SetAlignment(LUI.Alignment.Right)
	var_22_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -185, _1080p * -143, _1080p * -49, _1080p * -31)
	var_22_0:addElement(var_22_10)

	var_22_0.MinimizedCount = var_22_10

	local var_22_11
	local var_22_12 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_22_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CRMListItem", {
				controllerIndex = var_22_1
			})
		end,
		refreshChild = function(arg_24_0, arg_24_1, arg_24_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 432,
		rowHeight = _1080p * 240,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_22_13 = LUI.UIGrid.new(var_22_12)

	var_22_13.id = "CRMListGrid"

	var_22_13:setUseStencil(false)
	var_22_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -216, _1080p * 216, _1080p * -285, _1080p * -45)
	var_22_0:addElement(var_22_13)

	var_22_0.CRMListGrid = var_22_13

	local var_22_14
	local var_22_15 = LUI.UIImage.new()

	var_22_15.id = "Backer"

	var_22_15:SetRGBFromInt(0, 0)
	var_22_15:SetAlpha(0.3, 0)
	var_22_15:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -83, _1080p * -54)
	var_22_0:addElement(var_22_15)

	var_22_0.Backer = var_22_15

	local var_22_16
	local var_22_17 = {
		spacing = _1080p * 8,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Left,
		buildPip = function()
			return MenuBuilder.BuildRegisteredType("Pip", {
				controllerIndex = var_22_1
			})
		end,
		controllerIndex = var_22_1
	}
	local var_22_18 = LUI.Pips.new(var_22_17)

	var_22_18.id = "Pips"

	var_22_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 105, _1080p * -71, _1080p * -67)
	var_22_0:addElement(var_22_18)

	var_22_0.Pips = var_22_18

	local var_22_19
	local var_22_20 = LUI.UIText.new()

	var_22_20.id = "SplitScreenWarning"

	var_22_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_22_20:SetAlpha(0, 0)
	var_22_20:setText(Engine.CBBHFCGDIC("LUA_MENU/CRM_SPLITSCREEN_WARNING"), 0)
	var_22_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_20:SetWordWrap(false)
	var_22_20:SetAlignment(LUI.Alignment.Right)
	var_22_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -134, _1080p * -7, _1080p * -299, _1080p * -279)
	var_22_0:addElement(var_22_20)

	var_22_0.SplitScreenWarning = var_22_20

	local var_22_21
	local var_22_22 = LUI.UIImage.new()

	var_22_22.id = "Mask"

	var_22_22:setImage(RegisterMaterial("wdg_large_mask"), 0)
	var_22_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 215, _1080p * -215, _1080p * -274, _1080p * -39)
	var_22_0:addElement(var_22_22)

	var_22_0.Mask = var_22_22

	local var_22_23
	local var_22_24 = LUI.UIImage.new()

	var_22_24.id = "MouseTrigger"

	var_22_24:SetAlpha(0, 0)
	var_22_24:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -215, _1080p * 215, 0, _1080p * -27)
	var_22_0:addElement(var_22_24)

	var_22_0.MouseTrigger = var_22_24

	local var_22_25
	local var_22_26 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_22_1
	})

	var_22_26.id = "HighlightBottom"

	var_22_26:SetAlpha(0, 0)
	var_22_26:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -54, _1080p * -52)
	var_22_0:addElement(var_22_26)

	var_22_0.HighlightBottom = var_22_26

	local var_22_27
	local var_22_28 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_22_1
	})

	var_22_28.id = "HighlightTop"

	var_22_28:SetAlpha(0, 0)
	var_22_28:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -275, _1080p * -273)
	var_22_0:addElement(var_22_28)

	var_22_0.HighlightTop = var_22_28

	local var_22_29
	local var_22_30 = LUI.UIImage.new()

	var_22_30.id = "ButtonGlow"

	var_22_30:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_22_30:SetAlpha(0, 0)
	var_22_30:setImage(RegisterMaterial("button_glow"), 0)
	var_22_30:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_22_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -8, _1080p * 440, _1080p * 214, _1080p * 255)
	var_22_0:addElement(var_22_30)

	var_22_0.ButtonGlow = var_22_30

	local var_22_31
	local var_22_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_10:RegisterAnimationSequence("DefaultSequence", var_22_32)

	local function var_22_33()
		var_22_10:AnimateSequence("DefaultSequence")
	end

	var_22_0._sequences.DefaultSequence = var_22_33

	local var_22_34
	local var_22_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -426
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -30
		}
	}

	var_22_10:RegisterAnimationSequence("Minimize", var_22_35)

	local var_22_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_15:RegisterAnimationSequence("Minimize", var_22_36)

	local var_22_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("Minimize", var_22_37)

	local var_22_38 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -79
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -59
		}
	}

	var_22_20:RegisterAnimationSequence("Minimize", var_22_38)

	local var_22_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		}
	}

	var_22_22:RegisterAnimationSequence("Minimize", var_22_39)

	local var_22_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 253
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 220
		}
	}

	var_22_24:RegisterAnimationSequence("Minimize", var_22_40)

	local function var_22_41()
		var_22_10:AnimateSequence("Minimize")
		var_22_15:AnimateSequence("Minimize")
		var_22_18:AnimateSequence("Minimize")
		var_22_20:AnimateSequence("Minimize")
		var_22_22:AnimateSequence("Minimize")
		var_22_24:AnimateSequence("Minimize")
	end

	var_22_0._sequences.Minimize = var_22_41

	local var_22_42
	local var_22_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("Opening", var_22_43)

	local var_22_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("Opening", var_22_44)

	local var_22_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("Opening", var_22_45)

	local var_22_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -275
		}
	}

	var_22_22:RegisterAnimationSequence("Opening", var_22_46)

	local function var_22_47()
		var_22_6:AnimateSequence("Opening")
		var_22_8:AnimateSequence("Opening")
		var_22_18:AnimateSequence("Opening")
		var_22_22:AnimateSequence("Opening")
	end

	var_22_0._sequences.Opening = var_22_47

	local var_22_48
	local var_22_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_22_6:RegisterAnimationSequence("MouseFocusedMaximized", var_22_49)

	local var_22_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_22_8:RegisterAnimationSequence("MouseFocusedMaximized", var_22_50)

	local var_22_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("MouseFocusedMaximized", var_22_51)

	local var_22_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_28:RegisterAnimationSequence("MouseFocusedMaximized", var_22_52)

	local function var_22_53()
		var_22_6:AnimateSequence("MouseFocusedMaximized")
		var_22_8:AnimateSequence("MouseFocusedMaximized")
		var_22_26:AnimateSequence("MouseFocusedMaximized")
		var_22_28:AnimateSequence("MouseFocusedMaximized")
	end

	var_22_0._sequences.MouseFocusedMaximized = var_22_53

	local var_22_54
	local var_22_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_22_6:RegisterAnimationSequence("MouseUnfocused", var_22_55)

	local var_22_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_22_8:RegisterAnimationSequence("MouseUnfocused", var_22_56)

	local var_22_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("MouseUnfocused", var_22_57)

	local var_22_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_28:RegisterAnimationSequence("MouseUnfocused", var_22_58)

	local var_22_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_30:RegisterAnimationSequence("MouseUnfocused", var_22_59)

	local function var_22_60()
		var_22_6:AnimateSequence("MouseUnfocused")
		var_22_8:AnimateSequence("MouseUnfocused")
		var_22_26:AnimateSequence("MouseUnfocused")
		var_22_28:AnimateSequence("MouseUnfocused")
		var_22_30:AnimateSequence("MouseUnfocused")
	end

	var_22_0._sequences.MouseUnfocused = var_22_60

	local var_22_61
	local var_22_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("HideButton", var_22_62)

	local function var_22_63()
		var_22_6:AnimateSequence("HideButton")
	end

	var_22_0._sequences.HideButton = var_22_63

	local var_22_64
	local var_22_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ShowButton", var_22_65)

	local function var_22_66()
		var_22_6:AnimateSequence("ShowButton")
	end

	var_22_0._sequences.ShowButton = var_22_66

	local var_22_67
	local var_22_68 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_15:RegisterAnimationSequence("Maximize", var_22_68)

	local var_22_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("Maximize", var_22_69)

	local var_22_70 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -299
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -279
		}
	}

	var_22_20:RegisterAnimationSequence("Maximize", var_22_70)

	local var_22_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -274
		}
	}

	var_22_22:RegisterAnimationSequence("Maximize", var_22_71)

	local var_22_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_22_24:RegisterAnimationSequence("Maximize", var_22_72)

	local function var_22_73()
		var_22_15:AnimateSequence("Maximize")
		var_22_18:AnimateSequence("Maximize")
		var_22_20:AnimateSequence("Maximize")
		var_22_22:AnimateSequence("Maximize")
		var_22_24:AnimateSequence("Maximize")
	end

	var_22_0._sequences.Maximize = var_22_73

	local var_22_74
	local var_22_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_20:RegisterAnimationSequence("SplitScreenWarningFlash", var_22_75)

	local function var_22_76()
		var_22_20:AnimateSequence("SplitScreenWarningFlash")
	end

	var_22_0._sequences.SplitScreenWarningFlash = var_22_76

	local var_22_77
	local var_22_78 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_4:RegisterAnimationSequence("MouseFocusedMinimized", var_22_78)

	local var_22_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("MouseFocusedMinimized", var_22_79)

	local var_22_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 212
		}
	}

	var_22_30:RegisterAnimationSequence("MouseFocusedMinimized", var_22_80)

	local function var_22_81()
		var_22_4:AnimateSequence("MouseFocusedMinimized")
		var_22_8:AnimateSequence("MouseFocusedMinimized")
		var_22_30:AnimateSequence("MouseFocusedMinimized")
	end

	var_22_0._sequences.MouseFocusedMinimized = var_22_81

	var_22_13:AddScrollbar(var_22_18)
	var_0_9(var_22_0, var_22_1, arg_22_1)
	ACTIONS.AnimateSequence(var_22_0, "DefaultSequence")
	ACTIONS.AnimateSequence(var_22_0, "Opening")

	return var_22_0
end

MenuBuilder.registerType("CRMMain", CRMMain)
LockTable(_M)
