module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	LUI.FlowManager.GetScopedData(arg_1_0).showingSubCategory = false

	ACTIONS.AnimateSequence(arg_1_0, "HideSubmenu")
	arg_1_0.PCOptionWindowSubmenu:ClearCurrentOptions()

	if arg_1_1 and not arg_1_1.noFocus then
		ACTIONS.LoseFocus(arg_1_0, "OptionsAdvancedVideo", controllerIndex)
		ACTIONS.LoseFocus(arg_1_0, "PCOptionWindowSubmenu", controllerIndex)
		ACTIONS.GainFocus(arg_1_0, "PCOptionWindow", controllerIndex)
	end

	arg_1_0.PCOptionWindow:SetMouseFocusBlocker(false)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.OptionsAdvancedVideo)
	assert(arg_2_0.PCOptionWindow)
	assert(arg_2_0.bindButton)
	arg_2_0.OptionsAdvancedVideo:registerEventHandler("category_button_over", function(arg_3_0, arg_3_1)
		arg_2_0.ButtonDescriptionText:SetAlpha(1, 0)
		arg_2_0.PCOptionWindow:processEvent({
			name = "hide_description_text"
		})
	end)
	arg_2_0.PCOptionWindow:registerEventHandler("optionwindow_button_over", function(arg_4_0, arg_4_1)
		arg_2_0.ButtonDescriptionText:SetAlpha(0, 0)
		arg_2_0.PCOptionWindow:processEvent({
			name = "show_description_text"
		})
	end)

	arg_2_0.LeaveSubCategoryMenu = var_0_0

	arg_2_0:addEventHandler("subcategory_option_selected", function(arg_5_0, arg_5_1)
		arg_2_0.PCOptionWindow:RefreshCurrentOptions()
	end)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1.controller or arg_2_1

		if LUI.FlowManager.GetScopedData(arg_2_0).showingSubCategory then
			arg_2_0:LeaveSubCategoryMenu(arg_6_1)
			Engine.BJDBIAGIDA(CoD.SFX.SelectBack)
		elseif arg_2_0.PCOptionWindow:getFirstInFocus() ~= nil then
			ACTIONS.LoseFocus(arg_2_0, "PCOptionWindow", var_6_0)
			ACTIONS.GainFocus(arg_2_0, "OptionsAdvancedVideo", var_6_0)
		else
			ACTIONS.LeaveMenu(arg_2_0)
		end

		return true
	end)
	arg_2_0:addEventHandler("gain_focus", function(arg_7_0, arg_7_1)
		if LUI.FlowManager.GetScopedData(arg_2_0).showingSubCategory then
			ACTIONS.GainFocus(arg_2_0, "PCOptionWindowSubmenu", arg_2_1)

			return true
		end
	end)
	arg_2_0.OptionsAdvancedVideo:registerEventHandler("category_changed", function(arg_8_0, arg_8_1)
		arg_2_0.PCOptionWindow:UpdateOptions(arg_2_1, arg_8_1.title, arg_8_1.createOptions, arg_8_1.category)

		if not arg_8_1.noFocus then
			ACTIONS.LoseFocus(arg_2_0, "OptionsAdvancedVideo", arg_2_1)
			ACTIONS.GainFocus(arg_2_0, "PCOptionWindow", arg_2_1)
		end
	end)
	arg_2_0.PCOptionWindow:registerEventHandler("subcategory_changed", function(arg_9_0, arg_9_1)
		arg_2_0.PCOptionWindowSubmenu:UpdateOptions(arg_2_1, arg_9_1.title, arg_9_1.createOptions)
		ACTIONS.AnimateSequence(arg_2_0, "ShowSubmenu")

		LUI.FlowManager.GetScopedData(arg_2_0).showingSubCategory = true

		if not arg_9_1.noFocus then
			ACTIONS.LoseFocus(arg_2_0, "OptionsAdvancedVideo", arg_2_1)
			ACTIONS.LoseFocus(arg_2_0, "PCOptionWindow", arg_2_1)
			ACTIONS.GainFocus(arg_2_0, "PCOptionWindowSubmenu", arg_2_1)

			if arg_9_1.blockMouseInSubcategory then
				arg_2_0.PCOptionWindow:SetMouseFocusBlocker(true)
			end
		end
	end)

	if not Engine.DDJFBBJAIG() then
		ACTIONS.ScaleFullscreen(arg_2_0.Background)
	end

	arg_2_0.PCOptionWindowSubmenu:processEvent({
		name = "hide_description_text"
	})
end

function AdvancedVideoOptions(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "AdvancedVideoOptions"
	var_10_0._animationSets = {}
	var_10_0._sequences = {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3

	if not Engine.DDJFBBJAIG() then
		local var_10_4 = LUI.UIImage.new()

		var_10_4.id = "Background"

		var_10_4:SetRGBFromInt(0, 0)
		var_10_4:SetAlpha(0.5, 0)
		var_10_0:addElement(var_10_4)

		var_10_0.Background = var_10_4
	end

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "MenuTitle"

	var_10_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/ADVANCED_VIDEO"), 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_10_0:addElement(var_10_6)

	var_10_0.MenuTitle = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "ButtonDescriptionText"

	var_10_8.Description:SetRight(_1080p * 415, 0)
	var_10_8.Description:SetRGBFromInt(16777215, 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 140, _1080p * 560, _1080p * 875, _1080p * 907)
	var_10_0:addElement(var_10_8)

	var_10_0.ButtonDescriptionText = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("OptionsVideoAdvanced", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "OptionsAdvancedVideo"

	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 196, _1080p * 897)
	var_10_0:addElement(var_10_10)

	var_10_0.OptionsAdvancedVideo = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("PCOptionWindow", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "PCOptionWindow"

	var_10_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1790, _1080p * 196, _1080p * 996)
	var_10_0:addElement(var_10_12)

	var_10_0.PCOptionWindow = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("PCOptionWindow", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "PCOptionWindowSubmenu"

	var_10_14:SetAlpha(0, 0)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1946, _1080p * 2582, _1080p * 196, _1080p * 996)
	var_10_0:addElement(var_10_14)

	var_10_0.PCOptionWindowSubmenu = var_10_14

	local function var_10_15()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_15

	local var_10_16 = {
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -600
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 196
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 897
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSubmenu", var_10_16)

	local var_10_17 = {
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1096
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 196
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 996
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSubmenu", var_10_17)

	local var_10_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1154
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1790
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 196
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 996
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_14:RegisterAnimationSequence("ShowSubmenu", var_10_18)

	local function var_10_19()
		var_10_10:AnimateSequence("ShowSubmenu")
		var_10_12:AnimateSequence("ShowSubmenu")
		var_10_14:AnimateSequence("ShowSubmenu")
	end

	var_10_0._sequences.ShowSubmenu = var_10_19

	local var_10_20 = {
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 730
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 196
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 897
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_10:RegisterAnimationSequence("HideSubmenu", var_10_20)

	local var_10_21 = {
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 790
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1790
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 196
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 996
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_12:RegisterAnimationSequence("HideSubmenu", var_10_21)

	local var_10_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1946
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2582
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 196
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 996
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_14:RegisterAnimationSequence("HideSubmenu", var_10_22)

	local function var_10_23()
		var_10_10:AnimateSequence("HideSubmenu")
		var_10_12:AnimateSequence("HideSubmenu")
		var_10_14:AnimateSequence("HideSubmenu")
	end

	var_10_0._sequences.HideSubmenu = var_10_23

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_10_24 = LUI.UIBindButton.new()

	var_10_24.id = "selfBindButton"

	var_10_0:addElement(var_10_24)

	var_10_0.bindButton = var_10_24

	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("AdvancedVideoOptions", AdvancedVideoOptions)
LockTable(_M)
