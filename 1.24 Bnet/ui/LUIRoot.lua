LUI.UIRoot = LUI.Class(LUI.UIElement)

local var_0_0 = {
	POST_GAME = 0,
	HOST_MIGRATION = 1
}

GlobalInputEvents = {
	mute_voicechat = true,
	quick_options = true,
	decline_notification = true,
	accept_notification = true,
	quick_social = true,
	mute_sound = true
}

local function var_0_1(arg_1_0, arg_1_1)
	return GlobalInputEvents[arg_1_1.button]
end

function LUI.UIRoot.TryAddMouseCursor(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and arg_2_1 or "base"

	arg_2_0._flagCursor[var_2_0] = true

	if Engine.EABCCIBFIG() and not arg_2_0.cursor then
		arg_2_0.cursor = LUI.UIMouseCursor.new()

		arg_2_0:addElement(arg_2_0.cursor)

		if Engine.ECADDGAFF() then
			local var_2_1 = arg_2_0:GetControllerIndex() or Engine.IJEBHJIJF()

			if LUI.IsLastInputKeyboardMouse(var_2_1) then
				Engine.DDGIGAGHC(true)
			end
		end
	end
end

function LUI.UIRoot.RemoveMouseCursor(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1 and arg_3_1 or "base"

	arg_3_0._flagCursor[var_3_0] = false

	local var_3_1 = true

	for iter_3_0, iter_3_1 in pairs(arg_3_0._flagCursor) do
		if iter_3_1 then
			var_3_1 = false

			break
		end
	end

	if arg_3_0.cursor and var_3_1 then
		arg_3_0.cursor:closeTree()

		arg_3_0.cursor = nil

		if Engine.ECADDGAFF() then
			Engine.DDGIGAGHC(false)
		end

		if arg_3_0.mouseCursorTooltipLayer then
			local var_3_2 = arg_3_0:GetControllerIndex() or Engine.IJEBHJIJF()

			arg_3_0.mouseCursorTooltipLayer:ClearTooltipData(arg_3_0, var_3_2, nil)
		end
	end
end

function LUI.UIRoot.BlockButtonInput(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_1 then
		arg_4_0.m_blockButtonInput = true
	else
		arg_4_0.m_blockButtonInput = false
	end
end

function LUI.UIRoot.IsButtonInputBlocked(arg_5_0)
	return arg_5_0.m_blockButtonInput
end

function LUI.UIRoot.PixelsToUnits(arg_6_0, arg_6_1, arg_6_2)
	return arg_6_0:RootPixelsToUnits(arg_6_1, arg_6_2)
end

local function var_0_2(arg_7_0, arg_7_1)
	local var_7_0 = false
	local var_7_1 = false

	if arg_7_0.flowManager and not arg_7_0.flowManager:IsStackEmpty() then
		var_7_0 = true
	elseif arg_7_0.binkSkipPromptLayer and arg_7_0.binkSkipPromptLayer:ShouldBeVisible() and arg_7_0.binkSkipPromptLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.Snakecam and arg_7_0.Snakecam:ShouldBeVisible() and arg_7_0.Snakecam:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.loadingScreenManager and arg_7_0.loadingScreenManager:ShouldBeVisible() and arg_7_0.loadingScreenManager:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.scoreboardLayer and arg_7_0.scoreboardLayer:ShouldBeVisible() and arg_7_0.scoreboardLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.squadEliminatedLayer and arg_7_0.squadEliminatedLayer:ShouldBeVisible() and arg_7_0.squadEliminatedLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.textChat and arg_7_0.textChat:ShouldBeVisible() and arg_7_0.textChat:TrapsInput(arg_7_1) then
		var_7_0, var_7_1 = arg_7_0.textChat:InputsTrappedOrInteresting(arg_7_1)
	elseif arg_7_0.radialMenuLayer and arg_7_0.radialMenuLayer:ShouldBeVisible() and arg_7_0.radialMenuLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.reportPlayerLayer and arg_7_0.reportPlayerLayer:ShouldBeVisible() and arg_7_0.reportPlayerLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.tacOpsLayer and arg_7_0.tacOpsLayer:ShouldBeVisible() and arg_7_0.tacOpsLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.brQuickInventoryLayer and arg_7_0.brQuickInventoryLayer:ShouldBeVisible() and arg_7_0.brQuickInventoryLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.dpadPopupLayer and arg_7_0.dpadPopupLayer:ShouldBeVisible() and arg_7_0.dpadPopupLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.birdsEyeLayer and arg_7_0.birdsEyeLayer:ShouldBeVisible() and arg_7_0.birdsEyeLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.timedUseMeterLayer and arg_7_0.timedUseMeterLayer:ShouldBeVisible() and arg_7_0.timedUseMeterLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.codcasterLayer and arg_7_0.codcasterLayer:ShouldBeVisible() and arg_7_0.codcasterLayer:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif arg_7_0.gunsmithDebug and arg_7_0.gunsmithDebug:ShouldBeVisible() and arg_7_0.gunsmithDebug:TrapsInput(arg_7_1) then
		var_7_0 = true
	elseif Engine.BHICADFIHA() and arg_7_0.uiDebugLayer:TrapsInput(arg_7_0, arg_7_1) then
		var_7_0 = true
	elseif var_0_1(arg_7_0, arg_7_1) then
		var_7_0 = true
	end

	if var_7_0 or var_7_1 then
		table.insert(arg_7_0.inputQueue, arg_7_1)

		if #arg_7_0.inputQueue > 4 then
			table.remove(arg_7_0.inputQueue, 1)
		end
	end

	return var_7_0
end

function LUI.UIRoot.QueueMouseInput(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5, arg_8_6, arg_8_7)
	local var_8_0 = {
		name = arg_8_3,
		rootName = arg_8_2,
		controller = arg_8_1,
		button = arg_8_4,
		down = arg_8_5,
		x = arg_8_6,
		y = arg_8_7
	}

	return (var_0_2(arg_8_0, var_8_0))
end

function LUI.UIRoot.QueueInput(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6, arg_9_7, arg_9_8)
	local var_9_0 = {
		name = "gamepad_button",
		controller = arg_9_1,
		rootName = arg_9_2,
		button = arg_9_4,
		qualifier = arg_9_5,
		down = arg_9_3,
		x = arg_9_6,
		y = arg_9_7,
		resetInputs = arg_9_8
	}

	return (var_0_2(arg_9_0, var_9_0))
end

local var_0_3 = {}
local var_0_4 = 0

function LUI.UIRoot.ProcessQueue(arg_10_0, arg_10_1)
	local var_10_0 = #arg_10_1

	if var_10_0 > 8 then
		DebugPrint("LUI WARNING: Processing " .. var_10_0 .. " global events in one frame.")

		if Dvar.IBEGCHEFE("lui_debug_events_enabled") then
			DebugPrint("-----Starting event enumeration:")

			for iter_10_0 = 1, var_10_0 do
				if arg_10_1[iter_10_0].name == "omnvar_update" then
					DebugPrint("Event omnvar " .. iter_10_0 .. ": " .. arg_10_1[iter_10_0].omnvar)
				else
					DebugPrint("Event " .. iter_10_0 .. ": " .. arg_10_1[iter_10_0].name)
				end
			end

			DebugPrint("-----Ending event enumeration:")
		end
	end

	local var_10_1

	for iter_10_1 = 1, var_10_0 do
		local var_10_2 = arg_10_1[1]

		table.remove(arg_10_1, 1)
		LUI.UIRoot.ProcessEventNow(arg_10_0, var_10_2)

		if Dvar.IBEGCHEFE("lui_debug_events_enabled") and var_10_2.name ~= "run_frame" then
			local var_10_3 = -1
			local var_10_4 = var_10_2.name

			if var_10_2.name == "omnvar_update" then
				var_10_4 = var_10_2.omnvar
			end

			for iter_10_2 = 1, #var_0_3 do
				if var_0_3[iter_10_2].eventName == var_10_4 then
					var_10_3 = iter_10_2

					break
				end
			end

			if var_10_3 ~= -1 then
				var_0_3[var_10_3].count = var_0_3[var_10_3].count + 1
				var_0_3[var_10_3].added = var_0_4
			elseif #var_0_3 < 50 then
				local var_10_5 = {
					eventName = var_10_4
				}

				var_10_5.count = 1
				var_10_5.added = var_0_4

				table.insert(var_0_3, var_10_5)
			else
				for iter_10_3 = #var_0_3, 1, -1 do
					if var_0_3[iter_10_3].count == 1 and var_0_3[iter_10_3].added + 1800 < var_0_4 then
						table.remove(var_0_3, iter_10_3)
					end
				end
			end
		end
	end

	if Dvar.IBEGCHEFE("lui_debug_events_enabled") then
		table.sort(var_0_3, function(arg_11_0, arg_11_1)
			return arg_11_0.count > arg_11_1.count
		end)

		var_0_4 = var_0_4 + 1

		if var_0_4 % 200 == 0 then
			DebugPrint("-----Starting event enumeration:")

			for iter_10_4, iter_10_5 in ipairs(var_0_3) do
				DebugPrint("Event: " .. iter_10_5.eventName .. ", Count: " .. iter_10_5.count)
			end

			DebugPrint("-----Ending event enumeration:")
		end
	end
end

function LUI.UIRoot.ProcessEvents(arg_12_0)
	Engine.DJAFAHJFED("LUI.UIRoot.ProcessEvents")
	arg_12_0:ProcessQueue(arg_12_0.eventQueue)
	Engine.BJCDJGCFJJ()
end

function LUI.UIRoot.ProcessInputs(arg_13_0)
	Engine.DJAFAHJFED("LUI.UIRoot.ProcessInputs")
	arg_13_0:ProcessQueue(arg_13_0.inputQueue)
	Engine.BJCDJGCFJJ()
end

function LUI.UIRoot.ProcessEvent(arg_14_0, arg_14_1)
	if arg_14_1.immediate == true then
		return (LUI.UIRoot.ProcessEventNow(arg_14_0, arg_14_1))
	else
		table.insert(arg_14_0.eventQueue, arg_14_1)

		return false
	end
end

function LUI.UIRoot.ProcessEventNow(arg_15_0, arg_15_1)
	Engine.DJAFAHJFED("LUI.UIRoot.ProcessEventNow")

	if not arg_15_0.debugPrintIgnoreEvents[arg_15_1.name] and Dvar.IBEGCHEFE("lui_print_events") then
		DebugPrint("Processing event " .. arg_15_1.name)

		if arg_15_1.name == "gamepad_button" then
			DebugPrint("button " .. arg_15_1.button)
		end
	end

	if arg_15_0.m_blockButtonInput and (arg_15_1.name == "gamepad_button" or arg_15_1.name == "mouseup") then
		DebugPrint("Blocking Button input for " .. arg_15_1.button .. "  because m_ignoreButtonInput is true")
		Engine.BJCDJGCFJJ()

		return false
	end

	if IsMouseEvent(arg_15_1.name, arg_15_1.qualifier) then
		local var_15_0 = arg_15_0.flowManager:GetTopMostOpenMenuInfo()

		if var_15_0 and var_15_0.isControllerExclusive and not (not var_15_0.controller or not arg_15_1.controller or var_15_0.controller == arg_15_1.controller) then
			return true
		end

		arg_15_1.root = arg_15_0

		arg_15_0:UpdateInputType(arg_15_1)

		if IsMouseInputEvent(arg_15_1.name, arg_15_1.qualifier) then
			LUI.UIRoot.ProcessMouseButtonEvent(arg_15_0, arg_15_1)
		else
			LUI.UIRoot.ProcessMouseMoveEvent(arg_15_0, arg_15_1)
		end

		if arg_15_0.cursor then
			arg_15_0.cursor:processEvent(arg_15_1)
		end

		Engine.BJCDJGCFJJ()

		return true
	end

	if arg_15_1.target and arg_15_1.target ~= arg_15_0 then
		Engine.BJCDJGCFJJ()

		return arg_15_1.target:processEvent(arg_15_1)
	elseif IsInputEvent(arg_15_1.name) then
		if arg_15_1.name ~= "gamepad_sticks" then
			arg_15_0:ClearFocusStack()
		end

		arg_15_0:UpdateInputType(arg_15_1)

		if not AnyActiveMenusInStack(arg_15_0) and arg_15_0.gunsmithDebug then
			arg_15_0.gunsmithDebug:processEvent(arg_15_1)
		end

		local var_15_1 = false
		local var_15_2 = AnyActiveMenusInStack(arg_15_0)
		local var_15_3 = Engine.EAIICIFIFA()

		if Engine.BHICADFIHA() and LUI.UIDebugLayer and LUI.UIDebugLayer.ProcessEvent(arg_15_0, arg_15_1) then
			var_15_1 = true
		elseif arg_15_0.toastManager and arg_15_0.toastManager:processEvent(arg_15_1) then
			var_15_1 = true
		elseif arg_15_0.mouseCursorContextualMenuLayer and arg_15_0.mouseCursorContextualMenuLayer:ShouldBeVisible() and arg_15_0.mouseCursorContextualMenuLayer:processEvent(arg_15_1) then
			var_15_1 = true
		elseif arg_15_0.textChat and arg_15_0.textChat:ShouldBeVisible() and arg_15_0.textChat:processEvent(arg_15_1) then
			var_15_1 = true
			var_15_2 = true
		elseif AnyActiveMenusInStack(arg_15_0) or var_0_1(arg_15_0, arg_15_1) then
			var_15_1 = var_15_1 or arg_15_0.flowManager:processEvent(arg_15_1)
		elseif arg_15_0.binkSkipPromptLayer and arg_15_0.binkSkipPromptLayer:ShouldBeVisible() then
			var_15_1 = var_15_1 or arg_15_0.binkSkipPromptLayer:processEvent(arg_15_1)
		elseif arg_15_0.Snakecam and arg_15_0.Snakecam:ShouldBeVisible() then
			var_15_1 = var_15_1 or arg_15_0.Snakecam:processEvent(arg_15_1)
		elseif arg_15_0.loadingScreenManager and arg_15_0.loadingScreenManager:ShouldBeVisible() then
			var_15_1 = var_15_1 or arg_15_0.loadingScreenManager:processEvent(arg_15_1)
		elseif arg_15_0.codcasterLayer and arg_15_0.codcasterLayer:ShouldBeVisible() then
			if not arg_15_0.codcasterLayer:processEvent(arg_15_1) and arg_15_0.scoreboardLayer then
				var_15_1 = var_15_1 or arg_15_0.scoreboardLayer:processEvent(arg_15_1)
			end

			var_15_2 = true
		elseif arg_15_0.scoreboardLayer and not var_15_3 and arg_15_0.scoreboardLayer:TrapsInput(arg_15_1) then
			var_15_1 = var_15_1 or arg_15_0.scoreboardLayer:processEvent(arg_15_1)
		elseif arg_15_0.scoreboardLayer and var_15_3 and LUI.ScoreboardLayer.IsShowingScoreboard(arg_15_0.scoreboardLayer) then
			var_15_1 = var_15_1 or arg_15_0.scoreboardLayer:processEvent(arg_15_1)
		elseif arg_15_0.squadEliminatedLayer and arg_15_0.squadEliminatedLayer:ShouldBeVisible() and arg_15_0.squadEliminatedLayer:TrapsInput(arg_15_1) then
			var_15_1 = var_15_1 or arg_15_0.squadEliminatedLayer:processEvent(arg_15_1)
		elseif arg_15_0.dpadPopupLayer and LUI.DpadPopupLayer.IsShowingDpadPopup(arg_15_0.dpadPopupLayer) then
			var_15_1 = var_15_1 or arg_15_0.dpadPopupLayer:processEvent(arg_15_1)
		elseif arg_15_0.birdsEyeLayer and LUI.BirdsEyeLayer.IsShowingBirdsEye(arg_15_0.birdsEyeLayer) then
			var_15_1 = var_15_1 or arg_15_0.birdsEyeLayer:processEvent(arg_15_1)
		elseif arg_15_0.timedUseMeterLayer and LUI.TimedUseMeterLayer.IsShowingTimedUseMeter(arg_15_0.timedUseMeterLayer) then
			var_15_1 = var_15_1 or arg_15_0.timedUseMeterLayer:processEvent(arg_15_1)
		elseif arg_15_0.brQuickInventoryLayer and arg_15_0.brQuickInventoryLayer:TrapsInput(arg_15_1) then
			var_15_1 = var_15_1 or arg_15_0.brQuickInventoryLayer:processEvent(arg_15_1)
		elseif arg_15_0.reportPlayerLayer and arg_15_0.reportPlayerLayer:TrapsInput(arg_15_1) then
			var_15_1 = var_15_1 or arg_15_0.reportPlayerLayer:processEvent(arg_15_1)
		elseif arg_15_0.tacOpsLayer and arg_15_0.tacOpsLayer:TrapsInput(arg_15_1) then
			var_15_1 = var_15_1 or arg_15_0.tacOpsLayer:processEvent(arg_15_1)
		elseif arg_15_0.telemetryLayer and arg_15_0.telemetryLayer:ShouldBeVisible() and arg_15_0.telemetryLayer:TrapsInput() then
			var_15_1 = var_15_1 or arg_15_0.telemetryLayer:processEvent(arg_15_1)
		elseif arg_15_0.achievementsManager and arg_15_0.achievementsManager:ShouldBeVisible() and arg_15_0.achievementsManager:TrapsInput() then
			var_15_1 = var_15_1 or arg_15_0.achievementsManager:processEvent(arg_15_1)
		end

		if not var_15_2 and arg_15_0.radialMenuLayer and arg_15_0.radialMenuLayer:ShouldBeVisible() then
			var_15_1 = var_15_1 or arg_15_0.radialMenuLayer:processEvent(arg_15_1)
		end

		Engine.BJCDJGCFJJ()

		return var_15_1
	else
		if arg_15_1.name == "text_edit_is_typing" then
			arg_15_0:UpdateInputType(arg_15_1)
		end

		arg_15_0:UpdateInputConnected(arg_15_1)

		local var_15_4 = LUI.UIElement.processEvent(arg_15_0, arg_15_1)

		Engine.BJCDJGCFJJ()

		return var_15_4
	end
end

local function var_0_5(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	arg_16_1:applyElementTransform()

	local var_16_0 = false
	local var_16_1, var_16_2 = ProjectRootCoordinate(arg_16_0, arg_16_3, arg_16_4)

	if var_16_1 and var_16_2 then
		local var_16_3 = arg_16_1:getLastChild()

		while var_16_3 do
			if not var_16_3._blockMouseMove then
				local var_16_4 = var_16_3:IsPositionInside(var_16_1, var_16_2)

				if var_16_4 and var_16_3.handleMouseMove then
					table.insert(arg_16_2, var_16_3)

					var_16_0 = true
				end

				var_16_0 = (not var_16_3:getUseStencil() or var_16_4) and var_0_5(arg_16_0, var_16_3, arg_16_2, arg_16_3, arg_16_4) or var_16_0

				if var_16_0 then
					arg_16_1:undoElementTransform()

					return true
				end
			end

			var_16_3 = var_16_3:getPreviousSibling()
		end
	end

	arg_16_1:undoElementTransform()

	return false
end

function LUI.UIRoot.ComputeCurrentMouseFocus(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = {}

	if not arg_17_1._blockMouseMove then
		local var_17_1, var_17_2 = ProjectRootCoordinate(arg_17_0, arg_17_2, arg_17_3)

		if var_17_1 and var_17_2 and arg_17_1.handleMouseMove and arg_17_1:IsPositionInside(var_17_1, var_17_2) then
			table.insert(var_17_0, arg_17_1)
		end
	end

	var_0_5(arg_17_0, arg_17_1, var_17_0, arg_17_2, arg_17_3)

	if arg_17_4 then
		for iter_17_0 = #var_17_0, 1, -1 do
			if not var_17_0[iter_17_0]:isDescendentOf(arg_17_4) then
				table.remove(var_17_0, iter_17_0)
			end
		end
	end

	return var_17_0
end

function LUI.UIRoot.ComputeCurrentMouseFocusFromEvent(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.rootName
	local var_18_1 = Engine.DBFFAEEFGJ()

	var_18_0 = var_18_0 or var_18_1.name

	return LUI.UIRoot.ComputeCurrentMouseFocus(var_18_0, arg_18_0, arg_18_1.x, arg_18_1.y, var_18_1.lockedFocusToChildrenOf)
end

function LUI.UIRoot.LockFocusStackToChildrenOfElement(arg_19_0)
	Engine.DBFFAEEFGJ().lockedFocusToChildrenOf = arg_19_0

	return true
end

function LUI.UIRoot.UnlockFocusStackToChildrenOfElement()
	Engine.DBFFAEEFGJ().lockedFocusToChildrenOf = nil

	return true
end

function LUI.UIRoot.GetActiveLayer(arg_21_0)
	assert(arg_21_0)

	local var_21_0

	if arg_21_0.scoreboardLayer and arg_21_0.scoreboardLayer:ShouldBeVisible() and arg_21_0.scoreboardLayer:IsShowingScoreboard() then
		var_21_0 = arg_21_0.scoreboardLayer
	elseif arg_21_0.brQuickInventoryLayer and arg_21_0.brQuickInventoryLayer:ShouldBeVisible() and arg_21_0.brQuickInventoryLayer:IsShowingQuickInventory() then
		var_21_0 = arg_21_0.brQuickInventoryLayer
	elseif arg_21_0.radialMenuLayer and arg_21_0.radialMenuLayer:ShouldBeVisible() then
		var_21_0 = arg_21_0.radialMenuLayer
	elseif arg_21_0.tacOpsLayer and arg_21_0.tacOpsLayer:ShouldBeVisible() then
		var_21_0 = arg_21_0.tacOpsLayer
	elseif arg_21_0.binkSkipPromptLayer and arg_21_0.binkSkipPromptLayer:ShouldBeVisible() then
		var_21_0 = arg_21_0.binkSkipPromptLayer
	elseif arg_21_0.squadEliminatedLayer and arg_21_0.squadEliminatedLayer:ShouldBeVisible() then
		var_21_0 = arg_21_0.squadEliminatedLayer
	elseif arg_21_0.loadingScreenManager and arg_21_0.loadingScreenManager:ShouldBeVisible() then
		var_21_0 = arg_21_0.loadingScreenManager
	end

	return var_21_0
end

function LUI.UIRoot.ProcessMouseMoveEvent(arg_22_0, arg_22_1)
	local var_22_0 = {}

	if arg_22_0.mouseCursorContextualMenuLayer and arg_22_0.mouseCursorContextualMenuLayer:ShouldBeVisible() and arg_22_0.mouseCursorContextualMenuLayer:IsOpened() then
		table.insert(var_22_0, arg_22_0.mouseCursorContextualMenuLayer)
	else
		if Engine.BHICADFIHA() and arg_22_0.uiDebugLayer then
			table.insert(var_22_0, arg_22_0.uiDebugLayer)
		end

		if arg_22_0.toastManager then
			table.insert(var_22_0, arg_22_0.toastManager)
		end

		if arg_22_0.textChat and arg_22_0.textChat:ShouldBeVisible() then
			table.insert(var_22_0, arg_22_0.textChat)
		end

		if arg_22_0.shaderPreloadLayer and arg_22_0.shaderPreloadLayer:ShouldBeVisible() then
			table.insert(var_22_0, arg_22_0.shaderPreloadLayer)
		end

		if AnyActiveMenusInStack(arg_22_0) then
			table.insert(var_22_0, arg_22_0.flowManager:GetTopMostOpenMenuInfo().menu)
		end

		local var_22_1 = LUI.UIRoot.GetActiveLayer(arg_22_0)

		if var_22_1 and var_22_1.handleMouseMove then
			table.insert(var_22_0, var_22_1)
		end
	end

	if not arg_22_0.lockedFocusStack then
		arg_22_0.focusStack = {}

		for iter_22_0, iter_22_1 in ipairs(var_22_0) do
			arg_22_0.focusStack = LUI.UIRoot.ComputeCurrentMouseFocusFromEvent(iter_22_1, arg_22_1)

			if #arg_22_0.focusStack > 0 then
				break
			end
		end

		arg_22_1.focusStack = arg_22_0.focusStack
	else
		local var_22_2 = {}

		for iter_22_2, iter_22_3 in ipairs(var_22_0) do
			var_22_2 = LUI.UIRoot.ComputeCurrentMouseFocusFromEvent(iter_22_3, arg_22_1)

			if #var_22_2 > 0 then
				break
			end
		end

		arg_22_1.focusStack = {}

		for iter_22_4, iter_22_5 in ipairs(var_22_2) do
			for iter_22_6, iter_22_7 in ipairs(arg_22_0.focusStack) do
				if iter_22_5 == iter_22_7 then
					table.insert(arg_22_1.focusStack, iter_22_5)
				end
			end
		end
	end

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.StartFocusChain(arg_22_0)
	end

	for iter_22_8, iter_22_9 in ipairs(var_22_0) do
		if LUI.FocusDebug ~= nil then
			LUI.FocusDebug.BeginFocusChainLayer(iter_22_9)
		end

		iter_22_9:processEventNoDispatch(arg_22_1)

		if LUI.FocusDebug ~= nil then
			LUI.FocusDebug.EndFocusChainItem()
		end
	end

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.EndFocusChain(arg_22_0)
	end

	LUI.UIMouseCursor.UpdateMouseCursor(arg_22_1.focusStack[#arg_22_1.focusStack], arg_22_1.controller)

	return true
end

function LUI.UIRoot.ProcessMouseButtonEvent(arg_23_0, arg_23_1)
	if not arg_23_0.focusStack then
		return false
	end

	local var_23_0 = LUI.ShallowCopy(arg_23_0.focusStack)
	local var_23_1 = LUI.UIRoot.GetActiveLayer(arg_23_0)

	if var_23_1 and not var_23_1.handleMouseMove and var_23_1.handleMouseButton then
		table.insert(var_23_0, var_23_1)
	end

	local var_23_2 = false
	local var_23_3 = false

	if #var_23_0 > 0 and arg_23_1.name == "mousedown" then
		arg_23_0.lockedFocusStack = true
		var_23_2 = true
	elseif arg_23_1.name == "mouseup" then
		if arg_23_0.lockedFocusStack then
			arg_23_0.lockedFocusStack = false
			var_23_2 = true
			var_23_3 = true
		elseif #arg_23_0.focusStack == 0 then
			Engine.HJJJIGAC(arg_23_1.controller)
		end
	elseif arg_23_1.name == "gamepad_button" and arg_23_1.qualifier == "mousewheel" then
		var_23_2 = true
	end

	if arg_23_0.mouseCursorContextualMenuLayer and arg_23_0.mouseCursorContextualMenuLayer:ShouldBeVisible() and arg_23_0.mouseCursorContextualMenuLayer:processEvent(arg_23_1) then
		var_23_2 = false
	end

	if arg_23_0.textChat and arg_23_0.textChat:ShouldBeVisible() and not LUI.UIElement.isDescendentOf(var_23_0[#var_23_0], arg_23_0.textChat) and arg_23_1.name == "mouseup" then
		local var_23_4 = {
			name = "minimize_chat"
		}

		arg_23_0.textChat:processEvent(var_23_4)
	end

	if var_23_2 then
		local var_23_5 = arg_23_1.dispatchChildren

		arg_23_1.dispatchChildren = false

		local var_23_6 = {}
		local var_23_7 = var_23_0[#var_23_0]

		while var_23_7 and var_23_7 ~= self do
			table.insert(var_23_6, var_23_7)

			var_23_7 = var_23_7:getParent()
		end

		for iter_23_0 = #var_23_6, 1, -1 do
			var_23_6[iter_23_0]:applyElementTransform()
		end

		local var_23_8 = arg_23_1.rootName or Engine.DBFFAEEFGJ().name
		local var_23_9 = 1

		for iter_23_1 = #var_23_0, 1, -1 do
			if var_23_0[iter_23_1].handleMouseButton then
				local var_23_10, var_23_11 = ProjectRootCoordinate(var_23_8, arg_23_1.x, arg_23_1.y)

				arg_23_1.mouseX = var_23_10
				arg_23_1.mouseY = var_23_11
				arg_23_1.inside = var_23_0[iter_23_1]:IsPositionInside(var_23_10, var_23_11)

				if var_23_0[iter_23_1]:processEvent(arg_23_1) then
					break
				end
			end

			var_23_0[iter_23_1]:undoElementTransform()

			var_23_9 = var_23_9 + 1
		end

		for iter_23_2 = var_23_9, #var_23_6 do
			var_23_6[iter_23_2]:undoElementTransform()
		end

		arg_23_1.dispatchChildren = var_23_5
	end

	if var_23_3 then
		Engine.HJJJIGAC(arg_23_1.controller)
	end

	return true
end

function LUI.UIRoot.ClearFocusStack(arg_24_0)
	arg_24_0.lockedFocusStack = false
	arg_24_0.focusStack = {}

	if arg_24_0.cursor and arg_24_0.cursor._controllerIndex then
		LUI.UIMouseCursor.UpdateMouseCursor(nil, arg_24_0.cursor._controllerIndex)
	end

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.StartFocusChain()
		LUI.FocusDebug.EndFocusChain()
	end
end

function LUI.UIRoot.UpdatePublisherVariables(arg_25_0, arg_25_1)
	if arg_25_0.flowManager then
		arg_25_0.flowManager:processEvent({
			name = "update_publisher_variables"
		})
	end

	return true
end

function LUI.UIRoot.AddLayer(arg_26_0, arg_26_1, arg_26_2)
	assert(arg_26_1.id)
	assert(arg_26_1.InitLayer)
	assert(arg_26_1.ShouldBeVisible)
	assert(arg_26_1.ClearLayer)
	table.insert(arg_26_0.layers, arg_26_1)

	arg_26_1.options = arg_26_2 or {}

	if arg_26_1.options.exclusive then
		assert(arg_26_1.options.priority)
	end

	arg_26_1.layerEnabled = false

	local var_26_0 = _720 * 16 / 18

	arg_26_1:SetAnchorsAndPosition(0.5, 0.5, 0, 0, -var_26_0, var_26_0, 0, 0)
	arg_26_0:addElement(arg_26_1)

	return arg_26_1
end

function LUI.UIRoot.UpdateLayers(arg_27_0)
	Engine.DJAFAHJFED("LUI.UIRoot.UpdateLayers")
	Engine.DJAFAHJFED("Calc Exclusive Layer")

	local var_27_0

	for iter_27_0, iter_27_1 in pairs(arg_27_0.layers) do
		if iter_27_1:ShouldBeVisible() and iter_27_1.options.exclusive and (var_27_0 == nil or var_27_0.options.priority < iter_27_1.options.priority) then
			var_27_0 = iter_27_1
		end
	end

	Engine.BJCDJGCFJJ()
	Engine.DJAFAHJFED("Layer Frames")

	for iter_27_2, iter_27_3 in pairs(arg_27_0.layers) do
		local var_27_1 = iter_27_3:ShouldBeVisible() and (var_27_0 == nil or var_27_0 == iter_27_3)

		if iter_27_3.layerEnabled ~= var_27_1 then
			if var_27_1 then
				Engine.DJAFAHJFED("Layer:InitLayer " .. iter_27_3.id)
				iter_27_3:InitLayer()
				Engine.BJCDJGCFJJ()
			else
				Engine.DJAFAHJFED("Layer:ClearLayer " .. iter_27_3.id)
				iter_27_3:ClearLayer()
				Engine.BJCDJGCFJJ()
			end

			iter_27_3.layerEnabled = var_27_1
		end

		if iter_27_3.layerEnabled and iter_27_3.Frame then
			Engine.DJAFAHJFED("Layer:Frame " .. iter_27_3.id)
			iter_27_3:Frame()
			Engine.BJCDJGCFJJ()
		end
	end

	Engine.BJCDJGCFJJ()
	Engine.BJCDJGCFJJ()
end

function LUI.UIRoot.HandleErrors(arg_28_0)
	Engine.DJAFAHJFED("LUI.UIRoot.HandleErrors")

	local var_28_0 = Dvar.DHEEJCCJBH("OMSSQKRMLQ")

	if not var_28_0 or not (#var_28_0 > 0) or Engine.DBFCJBDJEC() and Engine.DBDHEJCHCI() then
		-- block empty
	elseif CONDITIONS.IsTrialLicense() and Dvar.IBEGCHEFE("showUpsellDialog") then
		LUI.FlowManager.RequestPopupMenu(nil, "ShowUpsellDialogPopup", true, arg_28_0._controllerIndex, false, {
			controllerIndex = arg_28_0._controllerIndex
		})
	elseif not LUI.FlowManager.IsInStack("error_popmenu") then
		DebugPrint("Opening error popup for message: " .. tostring(var_28_0) .. ", length: " .. tostring(#var_28_0))
		LUI.FlowManager.RequestPopupMenu(nil, "error_popmenu")
	end

	if Engine.BHICADFIHA() and not Engine.CAADCDEEIA() then
		local var_28_1 = Engine.CHBCJJFDI()

		if var_28_1 and var_28_1 > 0 and not LUI.FlowManager.IsInStack("error_popmenu") and not LUI.FlowManager.IsInStack("LoadErrorPopup") then
			LUI.FlowManager.RequestPopupMenu(nil, "LoadErrorPopup")
		end
	end

	local var_28_2 = 0
	local var_28_3 = false
	local var_28_4 = CONDITIONS.IsGamepadEnabled()
	local var_28_5 = false
	local var_28_6 = LUI.FlowManager.IsInStack("controllerremoved_popmenu")

	if arg_28_0._controllerIndex == nil then
		for iter_28_0 = 0, Engine.DCJGJDDEHE() - 1 do
			if Engine.EACCHAIHIB(iter_28_0) then
				var_28_2 = iter_28_0
				var_28_3 = true

				break
			end
		end

		for iter_28_1 = 0, Engine.DCJGJDDEHE() - 1 do
			if Engine.JDFDCGCIJ(iter_28_1) then
				var_28_5 = true

				break
			end
		end
	else
		local var_28_7 = arg_28_0._controllerIndex

		var_28_3 = Engine.EACCHAIHIB(var_28_7)

		if var_28_3 == true then
			var_28_2 = var_28_7
		end

		var_28_5 = Engine.JDFDCGCIJ(var_28_7)
	end

	if var_28_3 and not var_28_6 and not var_28_5 then
		Engine.BDGDDJGBF(var_28_2)
		LUI.FlowManager.RequestPopupMenu(nil, "controllerremoved_popmenu", false, nil, false, {
			missingControllerIndex = var_28_2
		}, nil, true)
	elseif var_28_6 and (not var_28_3 or var_28_5) and Engine.BAHIIBFDDG() == false then
		if arg_28_0._controllerIndex then
			LUI.FlowManager.RequestLeaveMenuByNameWithController("controllerremoved_popmenu", arg_28_0._controllerIndex, true)
		else
			LUI.FlowManager.RequestLeaveMenuByName("controllerremoved_popmenu", true)
		end
	end

	arg_28_0:ConnectionPopups(arg_28_0)

	local var_28_8 = Engine.BHBHCBJACC()
	local var_28_9 = LUI.FlowManager.IsInStack("WaitingForTransientsPopMenu")

	if var_28_8 and not var_28_9 then
		LUI.FlowManager.RequestPopupMenu(nil, "WaitingForTransientsPopMenu", false, nil, false, {}, nil, true)
	elseif var_28_9 and not var_28_8 then
		LUI.FlowManager.RequestLeaveMenuByName("WaitingForTransientsPopMenu", true)
	end

	Engine.BJCDJGCFJJ()
end

function LUI.UIRoot.Frame(arg_29_0, arg_29_1)
	Engine.DJAFAHJFED("LUI.UIRoot.Frame")

	if not Engine.DDJFBBJAIG() and Game.HJHDJDCBF() then
		InitInGameDataSources()
	end

	arg_29_0:ProcessEvents()
	arg_29_0:UpdateLayers()
	arg_29_0:ProcessInputs()
	arg_29_0:HandleErrors()
	SOUNDS.UpdateLoopingSounds()
	Engine.BJCDJGCFJJ()

	return true
end

function LUI.UIRoot.UpdateGameMode(arg_30_0, arg_30_1)
	CoD.UpdateGameMode(arg_30_1.currentGameMode, arg_30_1.previousGameMode)

	return true
end

function LUI.UIRoot.PlayerDataAvailable(arg_31_0, arg_31_1)
	DebugPrint("PlayerData is now available!  controller=" .. arg_31_1.controllerIndex .. ", statsSource=" .. arg_31_1.statsSource)
	MP_COMMON.ValidatePlayerData(arg_31_1.controllerIndex, arg_31_1.statsSource)

	return true
end

function LUI.UIRoot.UpdateInputType(arg_32_0, arg_32_1)
	arg_32_0:UpdateInputConnected(arg_32_1)

	if not Engine.EABCCIBFIG() then
		return
	end

	assert(arg_32_1.controller)

	local var_32_0 = arg_32_1.inputType and arg_32_1.inputType or Engine.CBCJDCHCCD(arg_32_1.controller)

	if arg_32_0.lastInputType ~= var_32_0 then
		arg_32_0.lastInputType = var_32_0

		arg_32_0:processEvent({
			name = "update_input_type",
			controllerIndex = arg_32_1.controller
		})
	end
end

function LUI.UIRoot.UpdateInputConnected(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0._controllerIndex or Engine.IJEBHJIJF()
	local var_33_1 = OPTIONS.IsGamepadConnected(var_33_0)
	local var_33_2 = Engine.JDFDCGCIJ(var_33_0)

	if arg_33_0.keyboardConnected ~= var_33_2 then
		local var_33_3 = Engine.IEJEJEI()

		if not var_33_3 and not arg_33_0.systemUiOpened then
			arg_33_0.keyboardConnected = var_33_2
			arg_33_0.connectionChanged = true

			arg_33_0:dispatchEventToChildren({
				name = "input_connection",
				controllerIndex = var_33_0
			})
		elseif var_33_3 then
			arg_33_0.systemUiOpened = true
		else
			arg_33_0.systemUiOpened = false
		end
	elseif arg_33_0.gamepadConnected ~= var_33_1 then
		arg_33_0.gamepadConnected = var_33_1
		arg_33_0.connectionChanged = true

		arg_33_0:dispatchEventToChildren({
			name = "input_connection",
			controllerIndex = var_33_0
		})
	end
end

function LUI.UIRoot.ConnectionPopups(arg_34_0)
	local var_34_0 = CONDITIONS.IsGamepadEnabled()

	if arg_34_0.connectionChanged or var_34_0 and not arg_34_0.gamepadConnected or not var_34_0 and not arg_34_0.keyboardConnected then
		local var_34_1 = LUI.FlowManager.IsInStack("keyboardremoved_inputswap_popup")
		local var_34_2 = LUI.FlowManager.IsInStack("controllerremoved_inputswap_popup")
		local var_34_3 = MenuUtils.CanShowConnectionPopups()
		local var_34_4 = not arg_34_0.keyboardConnected and arg_34_0.gamepadConnected
		local var_34_5 = not arg_34_0.gamepadConnected and arg_34_0.keyboardConnected

		if var_34_4 and not var_34_0 then
			if not var_34_1 and var_34_3 then
				LUI.FlowManager.RequestPopupMenu(nil, "keyboardremoved_inputswap_popup")
			end
		elseif var_34_5 and var_34_0 then
			if not var_34_2 and var_34_3 then
				LUI.FlowManager.RequestPopupMenu(nil, "controllerremoved_inputswap_popup")
			end
		else
			arg_34_0.connectionChanged = false
		end

		if var_34_1 and (arg_34_0.keyboardConnected or not var_34_3) then
			LUI.FlowManager.RequestLeaveMenuByName("keyboardremoved_inputswap_popup", true)
		elseif var_34_2 and (arg_34_0.gamepadConnected or not var_34_3) then
			LUI.FlowManager.RequestLeaveMenuByName("controllerremoved_inputswap_popup", true)
		end
	end
end

function LUI.UIRoot.SetLuiLayerKeycatch(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = Engine.DBFFAEEFGJ()

	if not var_35_0 then
		return
	end

	if var_35_0.layerLUIKeycatch[arg_35_1] == nil then
		var_35_0.layerLUIKeycatch[arg_35_1] = {}
	end

	local var_35_1 = var_35_0.layerLUIKeycatch[arg_35_1]

	if arg_35_2 then
		local var_35_2 = false

		for iter_35_0, iter_35_1 in pairs(var_35_1) do
			if iter_35_1 > 0 then
				var_35_2 = true

				break
			end
		end

		var_35_1[arg_35_0.id] = var_35_1[arg_35_0.id] and var_35_1[arg_35_0.id] + 1 or 1

		if not var_35_2 then
			Engine.CECBDGIHED(arg_35_1, arg_35_2)
			var_35_0:TryAddMouseCursor("layerKeyCatch")
		end
	elseif var_35_1[arg_35_0.id] then
		var_35_1[arg_35_0.id] = var_35_1[arg_35_0.id] and var_35_1[arg_35_0.id] - 1

		if var_35_1[arg_35_0.id] > 0 then
			return
		end

		var_35_1[arg_35_0.id] = nil

		local var_35_3 = true

		for iter_35_2, iter_35_3 in pairs(var_35_1) do
			if iter_35_3 > 0 then
				var_35_3 = false

				break
			end
		end

		if var_35_3 then
			Engine.CECBDGIHED(arg_35_1, arg_35_2)
			var_35_0:RemoveMouseCursor("layerKeyCatch")
		end
	end
end

function LUI.UIRoot.init(arg_36_0, arg_36_1, arg_36_2)
	LUI.UIRoot.super.init(arg_36_0)
	arg_36_0:SetAnchors(0.5, 0.5, 0.5, 0.5)

	local var_36_0 = arg_36_1 or Engine.IJEBHJIJF()

	if Dvar.IBEGCHEFE("ui_theme_debugoverride") then
		THEMES.ApplyDebugTheme()
	else
		local var_36_1 = Dvar.DHEEJCCJBH("ui_theme") or ""

		if THEMES[var_36_1] then
			THEMES.ApplyTheme(THEMES[var_36_1])
		end
	end

	arg_36_0._flagCursor = {
		layerKeyCatch = false,
		base = false
	}
	arg_36_0.id = "LUIRoot"
	arg_36_0.isaroot = true
	arg_36_0._controllerIndex = arg_36_1
	arg_36_0.name = arg_36_2
	arg_36_0.layers = {}
	arg_36_0.eventQueue = {}
	arg_36_0.inputQueue = {}
	arg_36_0.lastInputType = Engine.CBCJDCHCCD(var_36_0)
	arg_36_0.layerLUIKeycatch = {}
	arg_36_0.keyboardConnected = Engine.JDFDCGCIJ(var_36_0)
	arg_36_0.gamepadConnected = OPTIONS.IsGamepadConnected(var_36_0)
	arg_36_0.systemUiOpened = false
	arg_36_0.connectionChanged = false
	arg_36_0.focusStack = {}
	arg_36_0.debugPrintIgnoreEvents = {
		mousemove = true,
		gamepad_sticks = true,
		process_events = true
	}

	Engine.BHICHBJEHH(var_36_0, false)
	Dvar.DHEGHJJJHI("NRSSTPLOSQ", false)

	LUI.roots[arg_36_2] = arg_36_0

	if LUI.primaryRoot == nil then
		LUI.primaryRoot = arg_36_0
	end

	arg_36_0.processEvent = LUI.UIRoot.ProcessEvent

	arg_36_0:registerEventHandler("run_frame", LUI.UIRoot.Frame)
	arg_36_0:registerEventHandler("update_game_mode", LUI.UIRoot.UpdateGameMode)
	arg_36_0:registerEventHandler("update_publisher_variables", LUI.UIRoot.UpdatePublisherVariables)
	arg_36_0:addEventHandler("empty_menu_stack", LUI.UIRoot.ClearFocusStack)
	arg_36_0:registerEventHandler("gamer_profile_input_type_updated", LUI.UIRoot.UpdateInputType)
	arg_36_0:registerEventHandler("playerdata_available", LUI.UIRoot.PlayerDataAvailable)

	arg_36_0.eventCatcher = EventCatcher.new()

	arg_36_0.eventCatcher:setupRoot(arg_36_0)

	local var_36_2 = Engine.DDJFBBJAIG()
	local var_36_3 = Engine.EAAHGICFBD()
	local var_36_4 = Engine.EAIICIFIFA()
	local var_36_5 = Engine.CGABICJHAI()
	local var_36_6 = Engine.BHICADFIHA()
	local var_36_7 = Engine.DBFCJBDJEC()
	local var_36_8 = Engine.ECHCFGDDDF()

	if var_36_2 or var_36_3 then
		arg_36_0.fadeManager = arg_36_0:AddLayer(LUI.FadeManager.new(arg_36_0._controllerIndex))
	end

	if not var_36_2 then
		arg_36_0.inWorldManager = arg_36_0:AddLayer(LUI.InWorldManager.new(arg_36_0._controllerIndex))
		arg_36_0.hudManager = arg_36_0:AddLayer(LUI.HudManager.new({
			root = arg_36_0
		}))

		if var_36_3 then
			local var_36_9 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			if var_36_8 then
				arg_36_0.codcasterLayer = arg_36_0:AddLayer(LUI.CodcasterLayer.new(arg_36_0._controllerIndex), {
					exclusive = false
				})
			end

			arg_36_0.reportPlayerLayer = arg_36_0:AddLayer(LUI.ReportPlayerLayer.new(arg_36_0._controllerIndex), {
				exclusive = false
			})
			arg_36_0.loadingScreenManager = arg_36_0:AddLayer(LUI.LoadingScreenManager.new(arg_36_0._controllerIndex), {
				exclusive = false
			})

			if var_36_9 == "arm" then
				arg_36_0.tacOpsLayer = arg_36_0:AddLayer(LUI.TacOpsLayer.new(arg_36_0._controllerIndex), {
					exclusive = false
				})
			end

			arg_36_0.postGameManager = arg_36_0:AddLayer(LUI.PostGameManager.new(arg_36_0._controllerIndex), {
				priority = var_0_0.POST_GAME
			})

			if var_36_9 == "br" then
				arg_36_0.squadEliminatedLayer = arg_36_0:AddLayer(LUI.SquadEliminatedLayer.new(arg_36_0._controllerIndex), {
					exclusive = false
				})

				if not Dvar.IBEGCHEFE("ui_disable_quick_inventory") then
					arg_36_0.brQuickInventoryLayer = arg_36_0:AddLayer(LUI.BRQuickInventoryLayer.new(arg_36_0._controllerIndex), {
						exclusive = false
					})
				end

				if CONDITIONS.IsBRTutorialMap() or CONDITIONS.IsBMTutorialMap() then
					arg_36_0.brTutorialEndGameFlowLayer = arg_36_0:AddLayer(LUI.BRTutorialEndGameFlowLayer.new(arg_36_0._controllerIndex), {
						exclusive = false
					})
				end
			end

			arg_36_0.scoreboardLayer = arg_36_0:AddLayer(LUI.ScoreboardLayer.new(arg_36_0._controllerIndex), {
				exclusive = false
			})
			arg_36_0.hostMigrationManager = arg_36_0:AddLayer(LUI.HostMigrationManager.new(), {
				exclusive = true,
				priority = var_0_0.HOST_MIGRATION
			})

			if var_36_6 then
				arg_36_0.gunsmithDebug = arg_36_0:AddLayer(LUI.GunsmithDebug.new(arg_36_0._controllerIndex))
			end
		end

		if Engine.CAADCDEEIA() then
			arg_36_0.binkSkipPromptLayer = arg_36_0:AddLayer(LUI.BinkSkipPromptLayer.new(arg_36_0._controllerIndex), {
				exclusive = false
			})
			arg_36_0.Snakecam = arg_36_0:AddLayer(LUI.Snakecam.new(arg_36_0._controllerIndex), {
				exclusive = false
			})
		end
	end

	if not var_36_2 and var_36_3 and Dvar.DHEEJCCJBH("MOLPOSLOMO") == "br" then
		arg_36_0.brTransitionManager = arg_36_0:AddLayer(LUI.BrTransitionManager.new(arg_36_0._controllerIndex))
	end

	arg_36_0.flowManager = arg_36_0:AddLayer(LUI.FlowManager.new(arg_36_0, arg_36_1))

	if not var_36_2 and not CONDITIONS.IsThirdGameMode() then
		arg_36_0.subtitlesLayer = arg_36_0:AddLayer(LUI.SubtitlesLayer.new(arg_36_0._controllerIndex), {
			exclusive = false
		})
	end

	if Engine.CIEGIACHAE() and not var_36_2 then
		arg_36_0.ps4LightbarManager = arg_36_0:AddLayer(LUI.PS4LightbarManager.new(arg_36_0._controllerIndex))
	end

	if not var_36_2 and var_36_3 then
		arg_36_0.radialMenuLayer = arg_36_0:AddLayer(LUI.RadialMenuLayer.new(arg_36_0._controllerIndex), {
			exclusive = false
		})
	end

	if var_36_4 and not var_36_2 and not GameX.IsSplitscreen() and Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_town" then
		arg_36_0.townIntro = arg_36_0:AddLayer(LUI.TownIntro.new(arg_36_0._controllerIndex), {
			exclusive = false
		})
	end

	if var_36_4 and not var_36_2 and not CONDITIONS.IsWaveGameType() and not CONDITIONS.IsSpecOpsGameType() then
		arg_36_0.dpadPopupLayer = arg_36_0:AddLayer(LUI.DpadPopupLayer.new(arg_36_0._controllerIndex), {
			exclusive = false
		})
		arg_36_0.birdsEyeLayer = arg_36_0:AddLayer(LUI.BirdsEyeLayer.new(arg_36_0._controllerIndex), {
			exclusive = false
		})

		if Dvar.DHEEJCCJBH("NSQLTTMRMP") == "cp_raid_complex" then
			arg_36_0.timedUseMeterLayer = arg_36_0:AddLayer(LUI.TimedUseMeterLayer.new(arg_36_0._controllerIndex), {
				exclusive = false
			})
		end
	end

	local var_36_10 = (var_36_7 or var_36_2 or var_36_3 or var_36_4) and Dvar.IBEGCHEFE("LKSKPKTOON") and not CONDITIONS.IsSplitscreen()

	var_36_10 = var_36_10 and not CONDITIONS.IsLaunchChunk()

	if var_36_10 then
		arg_36_0.textChat = arg_36_0:AddLayer(LUI.TextChat.new({
			controllerIndex = var_36_0
		}))
	end

	if var_36_5 then
		arg_36_0.fadeFrameLayer = arg_36_0:AddLayer(LUI.AspectRatioFadeFrameLayer.new(arg_36_0._controllerIndex))
	end

	if var_36_2 or var_36_3 then
		arg_36_0.uiFadeManager = arg_36_0:AddLayer(LUI.UIFadeManager.new(arg_36_0._controllerIndex))
	end

	if var_36_2 then
		local var_36_11 = MenuBuilder.BuildRegisteredType("BuildAndServerText")

		arg_36_0:addElement(var_36_11)
	elseif var_36_8 and not IsSystemLink() and not Dvar.IBEGCHEFE("LMKKMPMOSO") and not Dvar.IBEGCHEFE("lui_footage_capture_enabled") then
		arg_36_0:addElement(MenuBuilder.BuildRegisteredType("MatchID"))
	end

	if var_36_5 or var_36_6 then
		local var_36_12 = LUI.UIElement.new()

		var_36_12:SetupFPSCounter()
		var_36_12:SetAlignment(LUI.Alignment.Right)
		var_36_12:SetRGBFromTable(SWATCHES.genericButton.highlight, 0)
		var_36_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -510, _1080p * -10, _1080p * 10, _1080p * 48)
		var_36_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_36_12:SetFontSize(38 * _1080p)
		var_36_12:SetWordWrap(false)

		var_36_12.id = "FPSCounter"

		arg_36_0:addElement(var_36_12)
	end

	if var_36_6 then
		local var_36_13 = MenuBuilder.BuildRegisteredType("DataSourceDebug", {
			controllerIndex = var_36_0
		})

		arg_36_0:addElement(var_36_13)
	end

	if CONDITIONS.IsLaunchChunk() then
		arg_36_0.launchChunk = arg_36_0:AddLayer(LUI.LaunchChunkLayer.new({
			controllerIndex = var_36_0
		}))
	end

	arg_36_0.toastManager = arg_36_0:AddLayer(LUI.ToastManager.new({
		controllerIndex = var_36_0
	}))

	if var_36_5 then
		if var_36_7 or Engine.ECAJCAJJGF() then
			arg_36_0.telemetryLayer = arg_36_0:AddLayer(LUI.TelemetryLayer.new({
				controllerIndex = var_36_0
			}))
			arg_36_0.achievementsManager = arg_36_0:AddLayer(LUI.AchievementsManager.new({
				controllerIndex = var_36_0
			}))
		end

		if var_36_2 and ShaderUpload then
			arg_36_0.shaderPreloadLayer = arg_36_0:AddLayer(LUI.ShaderPreloadLayer.new({
				controllerIndex = var_36_0
			}))
		end
	end

	arg_36_0.mouseCursorTooltipLayer = arg_36_0:AddLayer(LUI.MouseCursorTooltipLayer.new({
		controllerIndex = var_36_0
	}))
	arg_36_0.mouseCursorContextualMenuLayer = arg_36_0:AddLayer(LUI.MouseCursorContextualMenuLayer.new({
		controllerIndex = var_36_0
	}))
	arg_36_0.debugLayer = arg_36_0:AddLayer(LUI.DebugLayer.new({
		controllerIndex = var_36_0
	}))

	if var_36_6 then
		arg_36_0.uiDebugLayer = arg_36_0:AddLayer(LUI.UIDebugLayer.new({
			controllerIndex = var_36_0
		}))
	end
end

function LUI.UIRoot.ReloadChatForDebugOption()
	if not Engine.BHICADFIHA() then
		return
	end

	local var_37_0 = Engine.DBFFAEEFGJ()

	if not var_37_0 then
		return
	end

	if var_37_0.textChat then
		var_37_0:RemoveElement(var_37_0.textChat)

		var_37_0.textChat = nil
	end

	if Dvar.IBEGCHEFE("LKSKPKTOON") then
		var_37_0.textChat = var_37_0:AddLayer(LUI.TextChat.new({
			controllerIndex = var_37_0._controllerIndex or Engine.IJEBHJIJF()
		}))
	end
end

function LUI.UIRoot.GetControllerIndex(arg_38_0)
	return arg_38_0._controllerIndex
end

function LUI.UIRoot.GetRootFromName(arg_39_0)
	local var_39_0 = LUI.roots[arg_39_0]

	assert(var_39_0)

	return var_39_0
end

function LUI.UIRoot.GetRootForControllerIndex(arg_40_0)
	for iter_40_0, iter_40_1 in pairs(LUI.roots) do
		if iter_40_1._controllerIndex == arg_40_0 then
			return iter_40_1
		end
	end

	assert(LUI.primaryRoot)

	return LUI.primaryRoot
end
