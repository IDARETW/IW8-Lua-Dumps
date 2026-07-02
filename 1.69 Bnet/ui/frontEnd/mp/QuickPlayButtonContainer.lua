module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = not arg_1_0.QuickPlayButton.disabled

	arg_1_0.QuickPlayButton.navigation = {}
	arg_1_0.QuickPlayFilterButton.navigation = {}

	if var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, "ShowFilter")
		arg_1_0.QuickPlayFilterButton:SetButtonDisabled(false)

		arg_1_0.QuickPlayButton.navigation.right = arg_1_0.QuickPlayFilterButton
		arg_1_0.QuickPlayFilterButton.navigation.left = arg_1_0.QuickPlayButton
	elseif not var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, "HideFilter")
		arg_1_0.QuickPlayFilterButton:SetButtonDisabled(true)

		arg_1_0.QuickPlayButton.navigation.right = nil
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.QuickPlayButton)
	assert(arg_2_0.QuickPlayFilterButton)

	local function var_2_0(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
	end

	local function var_2_1(arg_4_0)
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 100 * _1080p, 150)
	end

	arg_2_0:SetHandleMouse(true)
	arg_2_0:addEventHandler("lose_focus", function(arg_5_0, arg_5_1)
		arg_2_0.QuickPlayButton:IgnoreButtonUp(false)

		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			arg_2_0.QuickPlayButton:ForceButtonOver(arg_2_1)
		end

		ACTIONS.AnimateSequence(arg_2_0.QuickPlayButton, arg_2_0.QuickPlayButton._disabled and "ButtonUpDisabled" or "ButtonUp")
	end)
	arg_2_0:addEventHandler("gain_focus", function(arg_6_0, arg_6_1)
		var_0_0(arg_6_0)
		arg_2_0.QuickPlayButton:IgnoreButtonUp(false)
		arg_2_0.QuickPlayButton:ForceButtonOver(arg_2_1)
		var_2_0(arg_6_0)
		arg_2_0.QuickPlayButton:ExpandButton(arg_6_0.QuickPlayButton)
	end)
	arg_2_0:addEventHandler("mouseleave", function(arg_7_0, arg_7_1)
		var_0_0(arg_7_0)
		arg_2_0.QuickPlayButton:ContractButton(arg_7_0.QuickPlayButton)
	end)
	arg_2_0.QuickPlayButton:addEventHandler("gain_focus", function(arg_8_0, arg_8_1)
		var_0_0(arg_2_0)
		var_2_0(arg_2_0)
	end)
	arg_2_0.QuickPlayFilterButton:addEventHandler("gain_focus", function(arg_9_0, arg_9_1)
		var_0_0(arg_2_0)
		arg_2_0.QuickPlayButton:IgnoreButtonUp(true)

		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			arg_2_0.QuickPlayButton:ForceButtonOver(arg_2_1)
		end

		var_2_0(arg_2_0)
	end)
	arg_2_0.QuickPlayFilterButton:addEventHandler("lose_focus", function(arg_10_0, arg_10_1)
		arg_2_0.QuickPlayButton:IgnoreButtonUp(false)
	end)
	arg_2_0.QuickPlayFilterButton:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		LUI.FlowManager.RequestAddMenu("PlaylistFilterMenu", false, arg_2_1, false, {
			controllerIndex = arg_2_1,
			normalFilteredDataSource = arg_2_0.QuickPlayButton:GetNormalFilteredDataSource(),
			hardcoreFilteredDataSource = arg_2_0.QuickPlayButton:GetHardcoreFilteredDataSource(),
			cdlFilteredDataSource = Dvar.IBEGCHEFE("MMTOPPQOON") and arg_2_0.QuickPlayButton:GetCDLFilteredDataSource() or nil
		})

		if LUI.IsLastInputMouseNavigation(arg_11_1.controller) then
			return true
		end
	end)
	arg_2_0.QuickPlayFilterButton:addEventHandler("play_menu_create", function(arg_12_0, arg_12_1)
		var_2_0(arg_2_0)
		arg_2_0.QuickPlayButton:ForceButtonOver(arg_2_1)
	end)
	var_0_0(arg_2_0)
end

function QuickPlayButtonContainer(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIHorizontalStackedLayout.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_13_0.id = "QuickPlayButtonContainer"
	var_13_0._animationSets = {}
	var_13_0._sequences = {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0

	var_13_0:SetSpacing(20 * _1080p)

	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("QuickPlayButton", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "QuickPlayButton"

	var_13_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/QUICK_PLAY_DESC"), 0)
	var_13_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 430, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.QuickPlayButton = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("QuickPlayFilterButton", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "QuickPlayFilterButton"

	var_13_6:SetAlpha(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 450, _1080p * 550, 0, _1080p * 100)
	var_13_0:addElement(var_13_6)

	var_13_0.QuickPlayFilterButton = var_13_6

	local function var_13_7()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_7

	local var_13_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ShowFilter", var_13_8)

	local function var_13_9()
		var_13_6:AnimateSequence("ShowFilter")
	end

	var_13_0._sequences.ShowFilter = var_13_9

	local var_13_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("HideFilter", var_13_10)

	local function var_13_11()
		var_13_6:AnimateSequence("HideFilter")
	end

	var_13_0._sequences.HideFilter = var_13_11

	var_13_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_13_1
		end

		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "self.QuickPlayFilterButton",
			sequenceName = "ShowButton",
			elementName = "QuickPlayFilterButton"
		})
	end)
	var_13_0:addEventHandler("button_up", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_13_1
		end

		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "self.QuickPlayFilterButton",
			sequenceName = "HideButton",
			elementName = "QuickPlayFilterButton"
		})
	end)
	var_0_1(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("QuickPlayButtonContainer", QuickPlayButtonContainer)
LockTable(_M)
