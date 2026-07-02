module(..., package.seeall)

local var_0_0 = {
	[MAIN_MENU.BladeType.Shutter] = {
		MinimalButtonDodgeMargin = 50,
		DefaultExpandedBladeRatio = 0.5,
		ButtonHeight = 50,
		ButtonWidthMultiplier = 0.85,
		ButtonDodgeDuration = 200,
		AnimationOutDuration = 75,
		AnimationInDuration = 150,
		ButtonDodgeEasing = LUI.EASING.outQuadratic,
		AnimationEasing = LUI.EASING.outQuadratic,
		CalculateBladeWidth = function(arg_1_0, arg_1_1)
			return arg_1_1._layoutWidth / arg_1_1._bladeCount
		end,
		CalculateButtonWidth = function(arg_2_0, arg_2_1)
			return arg_2_0:CalculateBladeWidth(arg_2_1) * arg_2_0.ButtonWidthMultiplier
		end,
		CalculateCenterOffset = function(arg_3_0, arg_3_1)
			local var_3_0 = arg_3_0:CalculateBladeWidth(arg_3_1)
			local var_3_1 = arg_3_1._bladeCount % 2 == 0
			local var_3_2 = math.ceil(arg_3_1._bladeCount / 2)
			local var_3_3 = arg_3_1._index * var_3_0 - var_3_2 * var_3_0

			if var_3_1 then
				var_3_3 = var_3_3 - var_3_0 / 2
			end

			return var_3_3
		end,
		HandleButtonState = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
			local var_4_0 = arg_4_2 and 0 or arg_4_0.ButtonDodgeDuration
			local var_4_1 = arg_4_3 / 2
			local var_4_2 = arg_4_0:CalculateButtonWidth(arg_4_1) / 2
			local var_4_3 = arg_4_0:CalculateBladeWidth(arg_4_1) / 2
			local var_4_4 = var_4_1 - var_4_3 - (var_4_3 - var_4_2)
			local var_4_5 = LUI.clamp(var_4_4 + arg_4_0.MinimalButtonDodgeMargin, 0, arg_4_1._layoutWidth)
			local var_4_6
			local var_4_7

			if arg_4_4 + 1 == arg_4_1._index then
				var_4_6 = _1080p * (-var_4_2 + var_4_5)
				var_4_7 = _1080p * (var_4_2 + var_4_5)
			elseif arg_4_4 - 1 == arg_4_1._index then
				var_4_6 = _1080p * (-var_4_2 - var_4_5)
				var_4_7 = _1080p * (var_4_2 - var_4_5)
			else
				var_4_6 = _1080p * -var_4_2
				var_4_7 = _1080p * var_4_2
			end

			arg_4_1.Button:SetLeft(var_4_6, var_4_0, arg_4_0.ButtonDodgeEasing)
			arg_4_1.Button:SetRight(var_4_7, var_4_0, arg_4_0.ButtonDodgeEasing)

			local var_4_8 = arg_4_0.ButtonHeight / 2
			local var_4_9 = _1080p * (-var_4_8 + arg_4_1._verticalButtonOffset)
			local var_4_10 = _1080p * (var_4_8 + arg_4_1._verticalButtonOffset)

			arg_4_1.Button:SetTop(var_4_9)
			arg_4_1.Button:SetBottom(var_4_10)
		end,
		UpdateSelectionState = function(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
			arg_5_3 = arg_5_3 or arg_5_0.DefaultExpandedBladeRatio

			local var_5_0 = arg_5_1._layoutHeight * arg_5_3
			local var_5_1 = arg_5_2 and 0 or arg_5_0.AnimationInDuration
			local var_5_2 = arg_5_2 and 0 or arg_5_0.AnimationOutDuration
			local var_5_3 = var_5_0 / 2
			local var_5_4 = arg_5_0:CalculateCenterOffset(arg_5_1)
			local var_5_5 = arg_5_0:CalculateBladeWidth(arg_5_1) / 2

			if arg_5_4 == arg_5_1._index then
				local var_5_6 = _1080p * (-var_5_3 + var_5_4)
				local var_5_7 = _1080p * (var_5_3 + var_5_4)

				arg_5_1:SetLeft(var_5_6, var_5_1, arg_5_0.AnimationEasing)
				arg_5_1:SetRight(var_5_7, var_5_1, arg_5_0.AnimationEasing)
				arg_5_1.Mask:SetLeftAnchor(0, var_5_1, arg_5_0.AnimationEasing)
				arg_5_1.Mask:SetRightAnchor(0, var_5_1, arg_5_0.AnimationEasing)
				arg_5_1.Overlay:SetLeftAnchor(0, var_5_1, arg_5_0.AnimationEasing)
				arg_5_1.Overlay:SetRightAnchor(0, var_5_1, arg_5_0.AnimationEasing)

				local var_5_8 = _1080p * -var_5_3
				local var_5_9 = _1080p * var_5_3

				arg_5_1.DisableOverlay:SetLeft(var_5_8)
				arg_5_1.DisableOverlay:SetRight(var_5_9)
				ACTIONS.AnimateSequence(arg_5_1, "ButtonOver")
			else
				local var_5_10 = _1080p * (-var_5_5 + var_5_4)
				local var_5_11 = _1080p * (var_5_5 + var_5_4)

				arg_5_1:SetLeft(var_5_10, var_5_2, arg_5_0.AnimationEasing)
				arg_5_1:SetRight(var_5_11, var_5_2, arg_5_0.AnimationEasing)
				arg_5_1.Mask:SetLeftAnchor(0.5, var_5_2, arg_5_0.AnimationEasing)
				arg_5_1.Mask:SetRightAnchor(0.5, var_5_2, arg_5_0.AnimationEasing)
				arg_5_1.Overlay:SetLeftAnchor(0.5, var_5_2, arg_5_0.AnimationEasing)
				arg_5_1.Overlay:SetRightAnchor(0.5, var_5_2, arg_5_0.AnimationEasing)
				ACTIONS.AnimateSequence(arg_5_1, "ButtonUp")
			end

			arg_5_0:HandleButtonState(arg_5_1, arg_5_2, var_5_0, arg_5_4)
		end,
		UpdateStaticState = function(arg_6_0, arg_6_1)
			ACTIONS.AnimateSequence(arg_6_1, "Shutter")
			arg_6_1.Text:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
			arg_6_1.Text:SetStartupDelay(500)
			arg_6_1.Text:SetLineHoldTime(400)
			arg_6_1.Text:SetAnimMoveTime(1000)
			arg_6_1.Text:SetAnimMoveSpeed(300)
			arg_6_1.Text:SetEndDelay(800)
			arg_6_1.Text:SetCrossfadeTime(250)
			arg_6_1.Text:SetFadeInTime(300)
			arg_6_1.Text:SetFadeOutTime(300)
			arg_6_1.Text:SetMaxVisibleLines(1)
		end
	},
	[MAIN_MENU.BladeType.Accordion] = {
		AspectRatioAnchorAdjust = 0.02,
		DefaultExpandedBladeRatio = 1,
		AnimationDuration = 285,
		ImageFadeDuration = 285,
		AnimationEasing = LUI.EASING.outQuartic,
		FadeEasing = LUI.EASING.outQuadratic,
		CalculateNeutralBladeWidth = function(arg_7_0, arg_7_1)
			return arg_7_1._layoutWidth / arg_7_1._bladeCount
		end,
		CalculateContractedBladeWidth = function(arg_8_0, arg_8_1, arg_8_2)
			return (arg_8_1._layoutWidth - arg_8_2) / (arg_8_1._bladeCount - 1)
		end,
		CalculateAccordionWidths = function(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
			local var_9_0 = {}

			for iter_9_0 = 1, arg_9_1._bladeCount do
				if not arg_9_3 or not arg_9_2 then
					table.insert(var_9_0, arg_9_0:CalculateNeutralBladeWidth(arg_9_1))
				elseif iter_9_0 == arg_9_3 then
					table.insert(var_9_0, arg_9_2)
				else
					table.insert(var_9_0, arg_9_0:CalculateContractedBladeWidth(arg_9_1, arg_9_2))
				end
			end

			return var_9_0
		end,
		UpdateSelectionState = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
			arg_10_3 = arg_10_3 or arg_10_0.DefaultExpandedBladeRatio

			local var_10_0 = arg_10_1._layoutHeight * arg_10_3
			local var_10_1 = CoD.IsUsingAspectRatio(1.6) and arg_10_0.AspectRatioAnchorAdjust or 0
			local var_10_2 = arg_10_2 and 0 or arg_10_0.AnimationDuration
			local var_10_3 = arg_10_2 and 0 or arg_10_0.ImageFadeDuration

			if arg_10_1.UpsellOverlay then
				arg_10_1.UpsellOverlay:SetTopAnchor(0 + var_10_1)
				arg_10_1.UpsellOverlay:SetBottomAnchor(0 + var_10_1)
			end

			if arg_10_4 == arg_10_1._index then
				arg_10_1.Image:SetAlpha(0, var_10_3, arg_10_0.FadeEasing)

				if arg_10_1._description then
					arg_10_1.ButtonDescription:SetAlpha(1, var_10_2, arg_10_0.AnimationEasing)
					arg_10_1.ButtonDescriptionBG:SetAlpha(0.5, var_10_2, arg_10_0.AnimationEasing)
					arg_10_1.ButtonDescription:SetBottomAnchor(1 - var_10_1, var_10_2, arg_10_0.AnimationEasing)
					arg_10_1.ButtonDescription:SetTopAnchor(var_10_1, var_10_2, arg_10_0.AnimationEasing)
					arg_10_1.ButtonDescriptionBG:SetBottomAnchor(1 - var_10_1, var_10_2, arg_10_0.AnimationEasing)
					arg_10_1.ButtonDescriptionBG:SetTopAnchor(var_10_1, var_10_2, arg_10_0.AnimationEasing)
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_10_1, "ShowBLMMagma")
				end
			else
				arg_10_1.Image:SetAlpha(1, 0)
				arg_10_1.ButtonDescription:SetAlpha(0)
				arg_10_1.ButtonDescriptionBG:SetAlpha(0)
				arg_10_1.ButtonDescription:SetBottomAnchor(1)
				arg_10_1.ButtonDescription:SetTopAnchor(0)
				arg_10_1.ButtonDescriptionBG:SetBottomAnchor(1)
				arg_10_1.ButtonDescriptionBG:SetTopAnchor(0)

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_10_1, "HideBLMMagma")
				end
			end

			local var_10_4 = arg_10_0:CalculateAccordionWidths(arg_10_1, var_10_0, arg_10_4)
			local var_10_5 = -arg_10_1._layoutWidth / 2

			for iter_10_0, iter_10_1 in ipairs(var_10_4) do
				if iter_10_0 < arg_10_1._index then
					var_10_5 = var_10_5 + iter_10_1
				else
					break
				end
			end

			local var_10_6 = _1080p * var_10_5
			local var_10_7 = _1080p * (var_10_5 + var_10_4[arg_10_1._index])

			arg_10_1:SetLeft(var_10_6, var_10_2, arg_10_0.AnimationEasing)
			arg_10_1:SetRight(var_10_7, var_10_2, arg_10_0.AnimationEasing)
		end,
		UpdateStaticState = function(arg_11_0, arg_11_1)
			ACTIONS.AnimateSequence(arg_11_1, "Accordion")

			if arg_11_1._imageName then
				arg_11_1.Image:setImage(RegisterMaterial(arg_11_1._imageName), 0)
			end
		end
	}
}
local var_0_1 = 500
local var_0_2 = "button_r3"
local var_0_3 = "button_right_stick"
local var_0_4 = "button_l3"
local var_0_5 = "button_left_stick"

local function var_0_6(arg_12_0, arg_12_1)
	if type(arg_12_0) == "table" then
		return arg_12_0
	else
		return {
			[arg_12_1] = arg_12_0
		}
	end
end

local function var_0_7(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0 ~= nil then
		if type(arg_13_0) == "function" then
			return arg_13_0(arg_13_2)
		else
			return arg_13_0
		end
	else
		return arg_13_1
	end
end

local function var_0_8(arg_14_0)
	if arg_14_0 ~= nil then
		if type(arg_14_0) == "function" then
			return arg_14_0
		else
			return function()
				return arg_14_0
			end
		end
	else
		return function()
			return nil
		end
	end
end

local function var_0_9(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:getParent()

	if var_17_0.HoverBladeByIndex then
		var_17_0:HoverBladeByIndex(arg_17_0._index, arg_17_1)
	end
end

local function var_0_10(arg_18_0)
	local var_18_0 = arg_18_0:getParent()

	if var_18_0.PushBladeToTopByIndex then
		var_18_0:PushBladeToTopByIndex(arg_18_0._index)
	end
end

local function var_0_11(arg_19_0)
	local var_19_0 = arg_19_0:GetCurrentMenu()

	if var_19_0 and var_19_0.AddButtonHelperText and var_19_0.RemoveButtonHelperText then
		var_19_0:RemoveButtonHelperText("button_primary", "left")
		var_19_0:RemoveButtonHelperText(var_0_2, "left")
		var_19_0:RemoveButtonHelperText(var_0_4, "left")

		if arg_19_0._currentState == MAIN_MENU.BladeStates.Installing then
			if arg_19_0._installingPrompt then
				var_19_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					priority = 2,
					helper_text = arg_19_0._installingPrompt
				})
			end
		elseif arg_19_0._currentState == MAIN_MENU.BladeStates.Blocked then
			if arg_19_0._blockedPrompt then
				var_19_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					priority = 2,
					helper_text = arg_19_0._blockedPrompt
				})
			end
		elseif arg_19_0._prompt then
			var_19_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = arg_19_0._prompt
			})
		else
			var_19_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		end

		local var_19_1 = LUI.FlowManager.GetScopedData(var_19_0)

		if Engine.HDGDBCJFG() then
			local var_19_2 = arg_19_0._bladeKey == MAIN_MENU.BladeKeys.SP or arg_19_0._bladeKey == MAIN_MENU.BladeKeys.CP or arg_19_0._bladeKey == MAIN_MENU.BladeKeys.MP

			if arg_19_0._currentState ~= MAIN_MENU.BladeStates.Installing and var_19_2 and not CONDITIONS.IsLaunchChunk() then
				var_19_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_alt1",
					priority = 2,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL")
				})

				if var_19_1 then
					var_19_1.currentSelectedMenuType = arg_19_0._bladeKey
				end
			else
				var_19_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_alt1",
					helper_text = "",
					priority = 2
				})

				if var_19_1 then
					var_19_1.currentSelectedMenuType = nil
				end
			end
		end

		if arg_19_0._secondaryPrompt then
			var_19_0:AddButtonHelperText({
				side = "left",
				priority = 3,
				helper_text = arg_19_0._secondaryPrompt,
				button_ref = var_0_2
			})
		end

		if arg_19_0._tertiaryPrompt then
			var_19_0:AddButtonHelperText({
				side = "left",
				priority = 4,
				helper_text = arg_19_0._tertiaryPrompt,
				button_ref = var_0_4
			})
		end
	end
end

local function var_0_12(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0:GetCurrentMenu()

	if arg_20_0._currentState == MAIN_MENU.BladeStates.Installing then
		if arg_20_0._installingAction and arg_20_0._installingAction(var_20_0, arg_20_1) then
			Engine.BJDBIAGIDA(arg_20_0._actionSFX)
		end
	elseif arg_20_0._currentState == MAIN_MENU.BladeStates.Blocked then
		if arg_20_0._blockedAction and arg_20_0._blockedAction(var_20_0, arg_20_1) then
			Engine.BJDBIAGIDA(arg_20_0._actionSFX)
		end
	else
		arg_20_0._action(var_20_0, arg_20_1)
		Engine.BJDBIAGIDA(arg_20_0._actionSFX)
	end
end

local function var_0_13(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetCurrentMenu()

	if arg_21_0._selected then
		arg_21_0._secondaryAction(var_21_0, arg_21_1)
	end
end

local function var_0_14(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetCurrentMenu()

	if arg_22_0._selected then
		arg_22_0._tertiaryAction(var_22_0, arg_22_1)
	end
end

local function var_0_15(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_1 < arg_23_0._currentState then
		arg_23_0._currentState = arg_23_1
		arg_23_0._stateParameters = arg_23_2
	end
end

local function var_0_16(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0._newUpdate(arg_24_1)

	if var_24_0 then
		local var_24_1 = var_0_6(var_24_0, "label")

		var_0_15(arg_24_0, MAIN_MENU.BladeStates.New, var_24_1)
	end
end

local function var_0_17(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0._isBlockedUpdate(arg_25_1)

	if var_25_0 then
		local var_25_1 = var_0_6(var_25_0, "label")

		var_0_15(arg_25_0, MAIN_MENU.BladeStates.Blocked, var_25_1)
	end
end

local function var_0_18(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0._isInstallingUpdate(arg_26_1)

	if var_26_0 then
		local var_26_1 = var_0_6(var_26_0, "label")

		var_0_15(arg_26_0, MAIN_MENU.BladeStates.Installing, var_26_1)
	end
end

local function var_0_19(arg_27_0, arg_27_1)
	arg_27_0._prompt = arg_27_0._promptUpdate(arg_27_1)
	arg_27_0._secondaryPrompt = arg_27_0._secondaryPromptUpdate(arg_27_1)
	arg_27_0._tertiaryPrompt = arg_27_0._tertiaryPromptUpdate(arg_27_1)
	arg_27_0._blockedPrompt = arg_27_0._blockedPromptUpdate(arg_27_1)
	arg_27_0._installingPrompt = arg_27_0._installingPromptUpdate(arg_27_1)
end

local function var_0_20(arg_28_0, arg_28_1)
	arg_28_0._currentState = MAIN_MENU.BladeStates.Neutral

	var_0_18(arg_28_0, arg_28_1)
	var_0_17(arg_28_0, arg_28_1)
	var_0_16(arg_28_0, arg_28_1)
	var_0_19(arg_28_0, arg_28_1)
	arg_28_0.DisableOverlay:RefreshState(arg_28_0._currentState, arg_28_0._stateParameters)
	arg_28_0.Button:RefreshState(arg_28_0._currentState, arg_28_0._stateParameters)
end

local function var_0_21(arg_29_0)
	if arg_29_0._transitionSwatch then
		arg_29_0.Overlay:SetRGBFromTable(arg_29_0._transitionSwatch)
		arg_29_0.Underlay:SetRGBFromTable(arg_29_0._transitionSwatch)
	end
end

local function var_0_22(arg_30_0, arg_30_1)
	if not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_30_1) or not Dvar.IBEGCHEFE("blm_messaging") then
		if arg_30_0._name and arg_30_0._name ~= "" then
			arg_30_0.Text:setText(arg_30_0._name)
			arg_30_0.Button.Text:setText(arg_30_0._name)
		else
			arg_30_0.Text:SetAlpha(0)
			arg_30_0.TextBackground:SetAlpha(0)
		end

		if arg_30_0._description and arg_30_0._description ~= "" then
			arg_30_0.ButtonDescription:setText(arg_30_0._description)
		else
			arg_30_0.ButtonDescription:SetAlpha(0)
			arg_30_0.ButtonDescriptionBG:SetAlpha(0)
		end
	else
		arg_30_0.BLMTitle:setText(ToUpperCase(arg_30_0._name))
		arg_30_0.BLMDesc:setText(arg_30_0._description)
		arg_30_0.Text:SetAlpha(0)
		arg_30_0.TextBackground:SetAlpha(0)
		arg_30_0.ButtonDescription:SetAlpha(0)
		arg_30_0.ButtonDescriptionBG:SetAlpha(0)
	end
end

local function var_0_23(arg_31_0)
	arg_31_0.Image:SetMask(arg_31_0.Mask)
	arg_31_0.Text:SetMask(arg_31_0.Mask)
	arg_31_0.TextBackground:SetMask(arg_31_0.Mask)
	arg_31_0.Cinematic:SetMask(arg_31_0.Mask)
	arg_31_0.ButtonDescription:SetMask(arg_31_0.Mask)
	arg_31_0.ButtonDescriptionBG:SetMask(arg_31_0.Mask)
	arg_31_0.DisableOverlay:SetMask(arg_31_0.Mask)
	arg_31_0.Overlay:SetMask(arg_31_0.Mask)
	arg_31_0.Underlay:SetMask(arg_31_0.Mask)
	arg_31_0.BlackoutImage:SetMask(arg_31_0.Mask)

	if arg_31_0.UpsellOverlay then
		arg_31_0.UpsellOverlay:SetMask(arg_31_0.Mask)
	end

	if arg_31_0.ClassifiedCountdownTimer then
		arg_31_0.ClassifiedCountdownTimer:SetMask(arg_31_0.Mask)
	end
end

local function var_0_24(arg_32_0, arg_32_1)
	if arg_32_0._secondaryAction or arg_32_0._tertiaryAction then
		local var_32_0 = LUI.UIBindButton.new()

		var_32_0.id = "selfBindButton"

		arg_32_0:addElement(var_32_0)

		arg_32_0.bindButton = var_32_0

		if arg_32_0._secondaryAction then
			arg_32_0.bindButton:addEventHandler(var_0_3, function(arg_33_0, arg_33_1)
				var_0_13(arg_32_0, arg_32_1)
			end)
		end

		if arg_32_0._tertiaryAction then
			arg_32_0.bindButton:addEventHandler(var_0_5, function(arg_34_0, arg_34_1)
				var_0_14(arg_32_0, arg_32_1)
			end)
		end
	end
end

local function var_0_25(arg_35_0, arg_35_1)
	if not arg_35_0._showUpsellOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_35_0.UpsellOverlay:closeTree()

		arg_35_0.UpsellOverlay = nil
	elseif arg_35_0._isOnSale then
		arg_35_0.UpsellOverlay:FlagOnSale()
	end
end

local function var_0_26(arg_36_0, arg_36_1)
	if arg_36_0._classified then
		local var_36_0 = tonumber(Engine.DCJHCAFIIA())
		local var_36_1 = Dvar.CFHDGABACF("MNNTMPMOLK")
		local var_36_2 = MenuBuilder.BuildRegisteredType("ClassifiedCountdownTimer", {
			controllerIndex = arg_36_1
		})

		var_36_2.id = "ClassifiedCountdownTimer"

		var_36_2:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -175, _1080p * 175, _1080p * -40, _1080p * 40)
		arg_36_0:addElement(var_36_2)

		arg_36_0.ClassifiedCountdownTimer = var_36_2

		if var_36_0 and var_36_0 > 0 and var_36_1 and var_36_1 > 0 then
			arg_36_0.ClassifiedCountdownTimer:SetAlpha(0.8)
		end

		arg_36_0.Text:SetGlitchAmount(1)
		arg_36_0.Button:SetGlitchAmount(var_36_1 == 0 and 0.8 or 0)
		arg_36_0.ButtonDescriptionBG:SetAlpha(0)
		arg_36_0.Text:SetAlpha(0)
		arg_36_0.TextBackground:SetAlpha(0)
	end
end

local function var_0_27(arg_37_0)
	if CONDITIONS.IsInKoreanIGRPaidSession(arg_37_0) then
		assert(arg_37_0.ButtonDescriptionIGR)
		assert(arg_37_0.IGRBoostIcon)
		arg_37_0.ButtonDescriptionIGR:SetMask(arg_37_0.Mask)

		local var_37_0 = Engine.DDAEJCJEA()

		arg_37_0.ButtonDescriptionIGR:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BONUS_TIP", tostring(var_37_0 * 100)))
		arg_37_0.IGRBoostIcon:SetMask(arg_37_0.Mask)
	end
end

local function var_0_28(arg_38_0)
	if IsLanguageJapanese() or IsLanguageRussian() or IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_38_0, "JP")
	elseif IsLanguageSafeChinese() or IsLanguageSimplifiedChinese() then
		ACTIONS.AnimateSequence(arg_38_0, "CHSF")
	elseif IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_38_0, "CHTR")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_38_0, "AR")
	elseif IsLanguageSpanish() or IsLanguagePortuguese() then
		ACTIONS.AnimateSequence(arg_38_0, "ESandPT")
	end
end

local function var_0_29(arg_39_0, arg_39_1)
	var_0_26(arg_39_0, arg_39_1)
	var_0_25(arg_39_0, arg_39_1)
	var_0_24(arg_39_0, arg_39_1)
	var_0_28(arg_39_0)
	var_0_27(arg_39_0)
	var_0_21(arg_39_0)
	var_0_23(arg_39_0)
	var_0_22(arg_39_0, arg_39_1)
	var_0_0[arg_39_0._bladeType]:UpdateStaticState(arg_39_0)
end

local function var_0_30(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_0._index == arg_40_1 then
		var_0_11(arg_40_0)
		var_0_10(arg_40_0)
		Engine.DFCGFCGBFD(arg_40_0._videoName, VideoPlaybackFlags.LOOP)
		arg_40_0.Cinematic:SetAlpha(1, 0)

		if arg_40_0.UpsellOverlay then
			arg_40_0.UpsellOverlay:FlagExpanded()
		end

		arg_40_0.DisableOverlay:FlagExpanded()
		arg_40_0.Trigger:processEvent({
			name = "gain_focus"
		})

		if arg_40_0._gainFocusRightSFX and arg_40_0._gainFocusLeftSFX then
			if not arg_40_0._lastSelectedIndex then
				Engine.BJDBIAGIDA(arg_40_0._gainFocusRightSFX)
			elseif arg_40_0._index > arg_40_0._lastSelectedIndex then
				if arg_40_2 then
					Engine.BJDBIAGIDA(arg_40_0._gainFocusLeftSFX)
				else
					Engine.BJDBIAGIDA(arg_40_0._gainFocusRightSFX)
				end
			elseif arg_40_0._index < arg_40_0._lastSelectedIndex then
				if arg_40_2 then
					Engine.BJDBIAGIDA(arg_40_0._gainFocusRightSFX)
				else
					Engine.BJDBIAGIDA(arg_40_0._gainFocusLeftSFX)
				end
			end
		end

		arg_40_0._selected = true
	else
		arg_40_0.Cinematic:SetAlpha(0, 0)

		if arg_40_0.UpsellOverlay then
			arg_40_0.UpsellOverlay:FlagContracted()
		end

		arg_40_0.DisableOverlay:FlagContracted()
		arg_40_0.Trigger:processEvent({
			name = "lose_focus"
		})

		arg_40_0._selected = false
	end

	arg_40_0._lastSelectedIndex = arg_40_1
end

local function var_0_31(arg_41_0, arg_41_1)
	var_0_30(arg_41_0, arg_41_1.selectedIndex, arg_41_1.wrapped)
	var_0_0[arg_41_0._bladeType]:UpdateSelectionState(arg_41_0, arg_41_1.snap, arg_41_1.expandedRatio, arg_41_1.selectedIndex)
end

local function var_0_32(arg_42_0, arg_42_1, arg_42_2)
	assert(arg_42_2.index)
	assert(arg_42_2.action and type(arg_42_2.action) == "function")
	assert(arg_42_2.videoName)
	assert(var_0_0[arg_42_2.bladeType])

	arg_42_0._index = arg_42_2.index
	arg_42_0._bladeCount = arg_42_2.bladeCount
	arg_42_0._layoutWidth = arg_42_2.layoutWidth
	arg_42_0._layoutHeight = arg_42_2.layoutHeight
	arg_42_0._bladeType = arg_42_2.bladeType
	arg_42_0._bladeKey = arg_42_2.bladeKey
	arg_42_0._name = var_0_7(arg_42_2.name, nil, arg_42_1)
	arg_42_0._description = var_0_7(arg_42_2.description, nil, arg_42_1)
	arg_42_0._videoName = var_0_7(arg_42_2.videoName, nil, arg_42_1)
	arg_42_0._imageName = var_0_7(arg_42_2.imageName, nil, arg_42_1)
	arg_42_0._verticalButtonOffset = var_0_7(arg_42_2.verticalButtonOffset, nil, arg_42_1)
	arg_42_0._transitionSwatch = var_0_7(arg_42_2.transitionSwatch, COLORS.black, arg_42_1)
	arg_42_0._action = arg_42_2.action
	arg_42_0._promptUpdate = var_0_8(arg_42_2.prompt)
	arg_42_0._secondaryAction = arg_42_2.secondaryAction
	arg_42_0._secondaryPromptUpdate = var_0_8(arg_42_2.secondaryPrompt)
	arg_42_0._tertiaryAction = arg_42_2.tertiaryAction
	arg_42_0._tertiaryPromptUpdate = var_0_8(arg_42_2.tertiaryPrompt)
	arg_42_0._blockedAction = arg_42_2.blockedAction
	arg_42_0._isBlockedUpdate = var_0_8(arg_42_2.isBlocked)
	arg_42_0._blockedPromptUpdate = var_0_8(arg_42_2.blockedPrompt)
	arg_42_0._installingAction = arg_42_2.installingAction
	arg_42_0._isInstallingUpdate = var_0_8(arg_42_2.isInstalling)
	arg_42_0._installingPromptUpdate = var_0_8(arg_42_2.installingPrompt)
	arg_42_0._newUpdate = var_0_8(arg_42_2.isNew)
	arg_42_0._timerLabel = arg_42_2.timerLabel
	arg_42_0._timerEnd = arg_42_2.timerEnd
	arg_42_0._actionSFX = arg_42_0.Trigger.actionSFX
	arg_42_0._gainFocusLeftSFX = var_0_7(arg_42_2.gainFocusLeftSFX, nil, arg_42_1)
	arg_42_0._gainFocusRightSFX = var_0_7(arg_42_2.gainFocusRightSFX, nil, arg_42_1)
	arg_42_0._classified = var_0_7(arg_42_2.classified, nil, arg_42_1)
	arg_42_0._showUpsellOverlay = var_0_7(arg_42_2.showUpsellOverlay, nil, arg_42_1)
	arg_42_0._isOnSale = var_0_7(arg_42_2.isOnSale, nil, arg_42_1)
	arg_42_0._stateParameters = {}

	if Dvar.IBEGCHEFE("blm_messaging") and (not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_42_1)) then
		ACTIONS.AnimateSequence(arg_42_0, "BLM")
	end

	arg_42_0.Trigger:setGainFocusAllSFX(nil)

	arg_42_0.Trigger.actionSFX = nil

	arg_42_0.Trigger:addEventHandler("button_action", function(arg_43_0, arg_43_1)
		var_0_12(arg_42_0, arg_43_1.controller)

		return false
	end)
	arg_42_0.Trigger:addEventHandler("button_over", function(arg_44_0, arg_44_1)
		local var_44_0 = arg_44_1.controller or arg_42_1

		if arg_44_1.focusType ~= FocusType.MenuFlow then
			var_0_9(arg_42_0, var_44_0)
		end
	end)
	arg_42_0:addEventHandler("selection_state_updated", var_0_31)

	arg_42_0.refreshTimer = LUI.UITimer.new({
		event = "perpetually_refreshed_state_tick",
		interval = var_0_1
	})

	arg_42_0:addElement(arg_42_0.refreshTimer)
	arg_42_0:addEventHandler("perpetually_refreshed_state_tick", function()
		var_0_20(arg_42_0, arg_42_1)

		return true
	end)
	var_0_20(arg_42_0, arg_42_1)
	var_0_29(arg_42_0, arg_42_1)
end

function MainMenuBlade(arg_46_0, arg_46_1)
	local var_46_0 = LUI.UIElement.new()

	var_46_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 1080 * _1080p)

	var_46_0.id = "MainMenuBlade"
	var_46_0._animationSets = var_46_0._animationSets or {}
	var_46_0._sequences = var_46_0._sequences or {}

	local var_46_1 = arg_46_1 and arg_46_1.controllerIndex

	if not var_46_1 and not Engine.DDJFBBJAIG() then
		var_46_1 = var_46_0:getRootController()
	end

	assert(var_46_1)

	local var_46_2 = var_46_0
	local var_46_3
	local var_46_4 = MenuBuilder.BuildRegisteredType("MainMenuButton", {
		controllerIndex = var_46_1
	})

	var_46_4.id = "Button"

	var_46_4.Text:setText("", 0)
	var_46_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -25, _1080p * 25)
	var_46_0:addElement(var_46_4)

	var_46_0.Button = var_46_4

	local var_46_5
	local var_46_6 = LUI.UIImage.new()

	var_46_6.id = "Underlay"

	var_46_6:SetRGBFromInt(0, 0)
	var_46_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 1, 0, 0)
	var_46_0:addElement(var_46_6)

	var_46_0.Underlay = var_46_6

	local var_46_7
	local var_46_8 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_46_1
	})

	var_46_8.id = "Cinematic"

	var_46_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, 0, 0)
	var_46_0:addElement(var_46_8)

	var_46_0.Cinematic = var_46_8

	local var_46_9
	local var_46_10 = LUI.UIImage.new()

	var_46_10.id = "Image"

	var_46_10:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -600, _1080p * 600, 0, 0)
	var_46_0:addElement(var_46_10)

	var_46_0.Image = var_46_10

	local var_46_11
	local var_46_12 = LUI.UIImage.new()

	var_46_12.id = "Overlay"

	var_46_12:SetRGBFromInt(0, 0)
	var_46_0:addElement(var_46_12)

	var_46_0.Overlay = var_46_12

	local var_46_13
	local var_46_14 = LUI.UIImage.new()

	var_46_14.id = "BlackoutImage"

	var_46_14:SetRGBFromInt(0, 0)
	var_46_14:SetAlpha(0, 0)
	var_46_0:addElement(var_46_14)

	var_46_0.BlackoutImage = var_46_14

	local var_46_15
	local var_46_16 = LUI.UIImage.new()

	var_46_16.id = "TextBackground"

	var_46_16:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
	var_46_16:SetAlpha(0.75, 0)
	var_46_16:SetPixelGridEnabled(true)
	var_46_16:SetPixelGridContrast(0.5, 0)
	var_46_16:SetPixelGridBlockWidth(2, 0)
	var_46_16:SetPixelGridBlockHeight(2, 0)
	var_46_16:SetPixelGridGutterWidth(1, 0)
	var_46_16:SetPixelGridGutterHeight(1, 0)
	var_46_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -43, _1080p * -62, _1080p * 18)
	var_46_0:addElement(var_46_16)

	var_46_0.TextBackground = var_46_16

	local var_46_17
	local var_46_18 = LUI.UIStyledText.new()

	var_46_18.id = "Text"

	var_46_18:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_46_18:setText("", 0)
	var_46_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_46_18:SetAlignment(LUI.Alignment.Left)
	var_46_18:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_46_18:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 16, _1080p * -66, _1080p * -40, _1080p * -4)
	var_46_0:addElement(var_46_18)

	var_46_0.Text = var_46_18

	local var_46_19
	local var_46_20 = LUI.UIImage.new()

	var_46_20.id = "ButtonDescriptionBG"

	var_46_20:SetRGBFromInt(0, 0)
	var_46_20:SetAlpha(0.4, 0)
	var_46_20:SetPixelGridEnabled(true)
	var_46_20:SetPixelGridContrast(0.5, 0)
	var_46_20:SetPixelGridBlockWidth(2, 0)
	var_46_20:SetPixelGridBlockHeight(2, 0)
	var_46_20:SetPixelGridGutterWidth(1, 0)
	var_46_20:SetPixelGridGutterHeight(1, 0)
	var_46_20:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_46_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -43, _1080p * 18, _1080p * 174)
	var_46_0:addElement(var_46_20)

	var_46_0.ButtonDescriptionBG = var_46_20

	local var_46_21
	local var_46_22 = LUI.UIStyledText.new()

	var_46_22.id = "ButtonDescription"

	var_46_22:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_46_22:setText("", 0)
	var_46_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_46_22:SetAlignment(LUI.Alignment.Left)
	var_46_22:SetDecodeUpdatesPerLetter(4)
	var_46_22:SetDecodeUseSystemTime(false)
	var_46_22:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 45, _1080p * -95, _1080p * 26, _1080p * 44)
	var_46_0:addElement(var_46_22)

	var_46_0.ButtonDescription = var_46_22

	local var_46_23
	local var_46_24 = LUI.UIImage.new()

	var_46_24.id = "Mask"

	var_46_24:setImage(RegisterMaterial("stencil_mask"), 0)
	var_46_24:SetAnchorsAndPosition(0.5, 0.5, 0, 0, 0, 0, _1080p * -4, _1080p * 4)
	var_46_0:addElement(var_46_24)

	var_46_0.Mask = var_46_24

	local var_46_25

	if CONDITIONS.AlwaysFalse(var_46_0) then
		local var_46_26 = {
			borderThicknessLeft = _1080p * 2,
			borderThicknessRight = _1080p * 2,
			borderThicknessTop = _1080p * 2,
			borderThicknessBottom = _1080p * 2
		}
		local var_46_27 = LUI.UIBorder.new(var_46_26)

		var_46_27.id = "Border"

		var_46_27:SetRGBFromInt(16711899, 0)
		var_46_27:SetBorderThicknessLeft(_1080p * 2, 0)
		var_46_27:SetBorderThicknessRight(_1080p * 2, 0)
		var_46_27:SetBorderThicknessTop(_1080p * 2, 0)
		var_46_27:SetBorderThicknessBottom(_1080p * 2, 0)
		var_46_0:addElement(var_46_27)

		var_46_0.Border = var_46_27
	end

	local var_46_28

	if CONDITIONS.IsInKoreanIGRPaidSession(var_46_0) then
		var_46_28 = LUI.UIStyledText.new()
		var_46_28.id = "ButtonDescriptionIGR"

		var_46_28:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
		var_46_28:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BONUS_TIP"), 0)
		var_46_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_46_28:SetAlignment(LUI.Alignment.Left)
		var_46_28:SetDecodeUpdatesPerLetter(4)
		var_46_28:SetDecodeUseSystemTime(false)
		var_46_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 108, _1080p * 425, _1080p * 95, _1080p * 119)
		var_46_0:addElement(var_46_28)

		var_46_0.ButtonDescriptionIGR = var_46_28
	end

	local var_46_29

	if CONDITIONS.IsInKoreanIGRPaidSession(var_46_0) then
		var_46_29 = LUI.UIImage.new()
		var_46_29.id = "IGRBoostIcon"

		var_46_29:setImage(RegisterMaterial("icon_xp"), 0)
		var_46_29:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 41, _1080p * 99, _1080p * 96, _1080p * 154)
		var_46_0:addElement(var_46_29)

		var_46_0.IGRBoostIcon = var_46_29
	end

	local var_46_30
	local var_46_31 = MenuBuilder.BuildRegisteredType("MainMenuBladeUpsellOverlay", {
		controllerIndex = var_46_1
	})

	var_46_31.id = "UpsellOverlay"

	var_46_31:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_46_0:addElement(var_46_31)

	var_46_0.UpsellOverlay = var_46_31

	local var_46_32
	local var_46_33 = MenuBuilder.BuildRegisteredType("MainMenuBladeDisableOverlay", {
		controllerIndex = var_46_1
	})

	var_46_33.id = "DisableOverlay"

	var_46_33:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -252, _1080p * 252, 0, 0)
	var_46_0:addElement(var_46_33)

	var_46_0.DisableOverlay = var_46_33

	local var_46_34
	local var_46_35 = MenuBuilder.BuildRegisteredType("MainMenuButton", {
		controllerIndex = var_46_1
	})

	var_46_35.id = "Trigger"

	var_46_35:SetAlpha(0, 0)
	var_46_35.Text:setText("", 0)
	var_46_35:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_46_0:addElement(var_46_35)

	var_46_0.Trigger = var_46_35

	local var_46_36
	local var_46_37 = LUI.UIText.new()

	var_46_37.id = "BLMTitle"

	var_46_37:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_46_37:SetAlpha(0, 0)
	var_46_37:setText("", 0)
	var_46_37:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_46_37:SetAlignment(LUI.Alignment.Center)
	var_46_37:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 116, _1080p * 186)
	var_46_0:addElement(var_46_37)

	var_46_0.BLMTitle = var_46_37

	local var_46_38
	local var_46_39 = LUI.UIText.new()

	var_46_39.id = "BLMDesc"

	var_46_39:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_46_39:SetAlpha(0, 0)
	var_46_39:setText("", 0)
	var_46_39:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_46_39:SetAlignment(LUI.Alignment.Center)
	var_46_39:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 194, _1080p * 224)
	var_46_0:addElement(var_46_39)

	var_46_0.BLMDesc = var_46_39

	local function var_46_40()
		return
	end

	var_46_0._sequences.DefaultSequence = var_46_40

	local var_46_41
	local var_46_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_46_8:RegisterAnimationSequence("ButtonOver", var_46_42)

	local var_46_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_12:RegisterAnimationSequence("ButtonOver", var_46_43)

	local var_46_44 = {
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

	var_46_22:RegisterAnimationSequence("ButtonOver", var_46_44)

	local function var_46_45()
		var_46_8:AnimateSequence("ButtonOver")
		var_46_12:AnimateSequence("ButtonOver")
		var_46_22:AnimateSequence("ButtonOver")
	end

	var_46_0._sequences.ButtonOver = var_46_45

	local var_46_46
	local var_46_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_8:RegisterAnimationSequence("ButtonUp", var_46_47)

	local var_46_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_12:RegisterAnimationSequence("ButtonUp", var_46_48)

	local function var_46_49()
		var_46_8:AnimateSequence("ButtonUp")
		var_46_12:AnimateSequence("ButtonUp")
	end

	var_46_0._sequences.ButtonUp = var_46_49

	local var_46_50
	local var_46_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -60
		}
	}

	var_46_18:RegisterAnimationSequence("JP", var_46_51)

	local var_46_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -67
		}
	}

	var_46_22:RegisterAnimationSequence("JP", var_46_52)

	local function var_46_53()
		var_46_18:AnimateSequence("JP")
		var_46_22:AnimateSequence("JP")
	end

	var_46_0._sequences.JP = var_46_53

	local var_46_54
	local var_46_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		}
	}

	var_46_22:RegisterAnimationSequence("AR", var_46_55)

	local function var_46_56()
		var_46_22:AnimateSequence("AR")
	end

	var_46_0._sequences.AR = var_46_56

	local var_46_57
	local var_46_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonTextBG
		}
	}

	var_46_16:RegisterAnimationSequence("Installed", var_46_58)

	local var_46_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		}
	}

	var_46_18:RegisterAnimationSequence("Installed", var_46_59)

	local function var_46_60()
		var_46_16:AnimateSequence("Installed")
		var_46_18:AnimateSequence("Installed")
	end

	var_46_0._sequences.Installed = var_46_60

	local var_46_61
	local var_46_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 49
		}
	}

	var_46_22:RegisterAnimationSequence("CHSF", var_46_62)

	local function var_46_63()
		var_46_22:AnimateSequence("CHSF")
	end

	var_46_0._sequences.CHSF = var_46_63

	local var_46_64
	local var_46_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_46_18:RegisterAnimationSequence("ESandPT", var_46_65)

	local function var_46_66()
		var_46_18:AnimateSequence("ESandPT")
	end

	var_46_0._sequences.ESandPT = var_46_66

	local var_46_67
	local var_46_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_46_22:RegisterAnimationSequence("CHTR", var_46_68)

	local function var_46_69()
		var_46_22:AnimateSequence("CHTR")
	end

	var_46_0._sequences.CHTR = var_46_69

	local var_46_70
	local var_46_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_4:RegisterAnimationSequence("Accordion", var_46_71)

	local var_46_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_6:RegisterAnimationSequence("Accordion", var_46_72)

	local var_46_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_46_12:RegisterAnimationSequence("Accordion", var_46_73)

	local var_46_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_46_16:RegisterAnimationSequence("Accordion", var_46_74)

	local var_46_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainLight.File
		}
	}

	var_46_18:RegisterAnimationSequence("Accordion", var_46_75)

	local var_46_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 266
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 296
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_46_20:RegisterAnimationSequence("Accordion", var_46_76)

	local var_46_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_46_22:RegisterAnimationSequence("Accordion", var_46_77)

	local var_46_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_46_24:RegisterAnimationSequence("Accordion", var_46_78)

	if CONDITIONS.IsInKoreanIGRPaidSession(var_46_0) then
		local var_46_79 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 145
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 169
			}
		}

		var_46_28:RegisterAnimationSequence("Accordion", var_46_79)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession(var_46_0) then
		local var_46_80 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 146
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 204
			}
		}

		var_46_29:RegisterAnimationSequence("Accordion", var_46_80)
	end

	local var_46_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_46_33:RegisterAnimationSequence("Accordion", var_46_81)

	local function var_46_82()
		var_46_4:AnimateSequence("Accordion")
		var_46_6:AnimateSequence("Accordion")
		var_46_12:AnimateSequence("Accordion")
		var_46_16:AnimateSequence("Accordion")
		var_46_18:AnimateSequence("Accordion")
		var_46_20:AnimateSequence("Accordion")
		var_46_22:AnimateSequence("Accordion")
		var_46_24:AnimateSequence("Accordion")

		if CONDITIONS.IsInKoreanIGRPaidSession(var_46_0) then
			var_46_28:AnimateSequence("Accordion")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession(var_46_0) then
			var_46_29:AnimateSequence("Accordion")
		end

		var_46_33:AnimateSequence("Accordion")
	end

	var_46_0._sequences.Accordion = var_46_82

	local var_46_83
	local var_46_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_6:RegisterAnimationSequence("Shutter", var_46_84)

	local var_46_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_10:RegisterAnimationSequence("Shutter", var_46_85)

	local var_46_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		}
	}

	var_46_18:RegisterAnimationSequence("Shutter", var_46_86)

	local function var_46_87()
		var_46_6:AnimateSequence("Shutter")
		var_46_10:AnimateSequence("Shutter")
		var_46_18:AnimateSequence("Shutter")
	end

	var_46_0._sequences.Shutter = var_46_87

	local var_46_88
	local var_46_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_14:RegisterAnimationSequence("BLM", var_46_89)

	local var_46_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_16:RegisterAnimationSequence("BLM", var_46_90)

	local var_46_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_46_18:RegisterAnimationSequence("BLM", var_46_91)

	local var_46_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_20:RegisterAnimationSequence("BLM", var_46_92)

	local var_46_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_46_22:RegisterAnimationSequence("BLM", var_46_93)

	local function var_46_94()
		var_46_14:AnimateSequence("BLM")
		var_46_16:AnimateSequence("BLM")
		var_46_18:AnimateSequence("BLM")
		var_46_20:AnimateSequence("BLM")
		var_46_22:AnimateSequence("BLM")
	end

	var_46_0._sequences.BLM = var_46_94

	local var_46_95
	local var_46_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_14:RegisterAnimationSequence("ShowBLMMagma", var_46_96)

	local var_46_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_37:RegisterAnimationSequence("ShowBLMMagma", var_46_97)

	local var_46_98 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_39:RegisterAnimationSequence("ShowBLMMagma", var_46_98)

	local function var_46_99()
		var_46_14:AnimateSequence("ShowBLMMagma")
		var_46_37:AnimateSequence("ShowBLMMagma")
		var_46_39:AnimateSequence("ShowBLMMagma")
	end

	var_46_0._sequences.ShowBLMMagma = var_46_99

	local var_46_100
	local var_46_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_14:RegisterAnimationSequence("HideBLMMagma", var_46_101)

	local var_46_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_37:RegisterAnimationSequence("HideBLMMagma", var_46_102)

	local var_46_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_39:RegisterAnimationSequence("HideBLMMagma", var_46_103)

	local function var_46_104()
		var_46_14:AnimateSequence("HideBLMMagma")
		var_46_37:AnimateSequence("HideBLMMagma")
		var_46_39:AnimateSequence("HideBLMMagma")
	end

	var_46_0._sequences.HideBLMMagma = var_46_104

	var_0_32(var_46_0, var_46_1, arg_46_1)

	return var_46_0
end

MenuBuilder.registerType("MainMenuBlade", MainMenuBlade)
LockTable(_M)
