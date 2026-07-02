module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._pips[arg_1_1] then
		if arg_1_0._currentTier == arg_1_0._selectedPip then
			ACTIONS.AnimateSequence(arg_1_0._pips[arg_1_0._selectedPip], "Current")
		elseif arg_1_0._pips[arg_1_0._selectedPip]:GetComplete() then
			ACTIONS.AnimateSequence(arg_1_0._pips[arg_1_0._selectedPip], "Complete")
		elseif arg_1_0._pips[arg_1_0._selectedPip]:GetUnlocked() then
			ACTIONS.AnimateSequence(arg_1_0._pips[arg_1_0._selectedPip], "Unlocked")
		else
			ACTIONS.AnimateSequence(arg_1_0._pips[arg_1_0._selectedPip], "Locked")
		end

		ACTIONS.AnimateSequence(arg_1_0._pips[arg_1_1], "Select")

		arg_1_0._selectedPip = arg_1_1
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._currentTier = arg_2_2

	for iter_2_0 = 1, #arg_2_0._pips do
		arg_2_0._pips[iter_2_0]:closeTree()
	end

	arg_2_0._pips = {}

	local var_2_0 = arg_2_0._pipHeight / 2

	arg_2_0._selectedPip = 1

	for iter_2_1 = 1, arg_2_1 do
		local var_2_1 = MenuBuilder.BuildRegisteredType("MasterChallengePip", {
			controllerIndex = arg_2_0._controllerIndex
		})

		var_2_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, arg_2_0._pipWidth, 0, arg_2_0._pipHeight)
		arg_2_0._pipContainer:addElement(var_2_1)

		local var_2_2 = iter_2_1 < arg_2_2

		var_2_1.Tier:setText(Engine.JCBDICCAH(iter_2_1))

		if iter_2_1 == arg_2_2 or var_2_2 then
			if iter_2_1 == arg_2_2 then
				ACTIONS.AnimateSequence(var_2_1, "Current")
			else
				ACTIONS.AnimateSequence(var_2_1, "Unlocked")
			end

			var_2_1:SetUnlocked(true)
		else
			ACTIONS.AnimateSequence(var_2_1, "Locked")
			var_2_1:SetUnlocked(false)
		end

		if var_2_2 then
			ACTIONS.AnimateSequence(var_2_1, "Complete")
			var_2_1:SetComplete(true)
		end

		table.insert(arg_2_0._pips, var_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_1
	arg_3_0.MoveSelectedPip = var_0_0
	arg_3_0._controllerIndex = arg_3_1

	local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0.Pip:getLocalRect()

	arg_3_0._pipContainer = LUI.UIHorizontalStackedLayout.new()
	arg_3_0._pipContainer.id = "PipContainer"

	arg_3_0._pipContainer:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_3_0._pipContainer:SetSpacing(6 * _1080p)
	arg_3_0:addElement(arg_3_0._pipContainer)

	arg_3_0._pipWidth = var_3_2 - var_3_0
	arg_3_0._pipHeight = var_3_3 - var_3_1
	arg_3_0._spacing = arg_3_0:GetSpacing()
	arg_3_0._pips = {}

	arg_3_0.Pip:closeTree()

	arg_3_0.Pip = nil
end

function CallingCardMasterChallengePips(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_4_0.id = "CallingCardMasterChallengePips"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("MasterChallengePip", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Pip"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 22, 0, _1080p * 22)
	var_4_0:addElement(var_4_4)

	var_4_0.Pip = var_4_4

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CallingCardMasterChallengePips", CallingCardMasterChallengePips)
LockTable(_M)
