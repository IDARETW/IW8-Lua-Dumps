module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1, var_1_2 = MAIN_MENU.GetCortezProductOwned(arg_1_1, true)

	if arg_1_2 == MAIN_MENU.BladeKeys.BuyNG then
		if var_1_1 and var_1_1.owned then
			arg_1_0.WZOptionButton.Text:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/VIEW_EDITION")))
			arg_1_0.WZWipPurchaseMsgBladeUp:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/VIEW_EDITION")))
			ACTIONS.AnimateSequence(arg_1_0, "PreOrderUltimate")
		elseif var_1_0 and var_1_0.owned then
			arg_1_0.WZOptionButton.Text:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_ULTIMATE")))
			arg_1_0.WZWipPurchaseMsgBladeUp:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_ULTIMATE")))
			ACTIONS.AnimateSequence(arg_1_0, "PreOrderStandard")
		else
			ACTIONS.AnimateSequence(arg_1_0, "PreOrderUp")
		end
	end

	if arg_1_0._preOrderLabelText ~= nil and #arg_1_0._preOrderLabelText ~= 0 then
		arg_1_0.PreOrderLabel.UpgradeLabel:setText(arg_1_0._preOrderLabelText)
		ACTIONS.AnimateSequence(arg_1_0, "PreOrderBannerShow")
	end

	if Dvar.IBEGCHEFE("MNTNTPMKMN") then
		arg_1_0.MultiplayerBetaLabel:SetAlpha(1)

		if MAIN_MENU.IsCortezReleaseCountdown() then
			arg_1_0.MultiplayerBetaLabel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CAMPAIGN_EARLY_ACCESS")))
		else
			arg_1_0.MultiplayerBetaLabel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ350/MULTIPLAYER_BETA")))
		end
	end
end

local var_0_1 = {
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
		CalculateBladeWidth = function(arg_2_0, arg_2_1)
			return arg_2_1._layoutWidth / arg_2_1._bladeCount
		end,
		CalculateButtonWidth = function(arg_3_0, arg_3_1)
			return arg_3_0:CalculateBladeWidth(arg_3_1) * arg_3_0.ButtonWidthMultiplier
		end,
		CalculateCenterOffset = function(arg_4_0, arg_4_1)
			local var_4_0 = arg_4_0:CalculateBladeWidth(arg_4_1)
			local var_4_1 = arg_4_1._bladeCount % 2 == 0
			local var_4_2 = math.ceil(arg_4_1._bladeCount / 2)
			local var_4_3 = arg_4_1._index * var_4_0 - var_4_2 * var_4_0

			if var_4_1 then
				var_4_3 = var_4_3 - var_4_0 / 2
			end

			return var_4_3
		end,
		HandleButtonState = function(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
			local var_5_0 = arg_5_2 and 0 or arg_5_0.ButtonDodgeDuration
			local var_5_1 = arg_5_3 / 2
			local var_5_2 = arg_5_0:CalculateButtonWidth(arg_5_1) / 2
			local var_5_3 = arg_5_0:CalculateBladeWidth(arg_5_1) / 2
			local var_5_4 = var_5_1 - var_5_3 - (var_5_3 - var_5_2)
			local var_5_5 = LUI.clamp(var_5_4 + arg_5_0.MinimalButtonDodgeMargin, 0, arg_5_1._layoutWidth)
			local var_5_6
			local var_5_7

			if arg_5_4 + 1 == arg_5_1._index then
				var_5_6 = _1080p * (-var_5_2 + var_5_5)
				var_5_7 = _1080p * (var_5_2 + var_5_5)
			elseif arg_5_4 - 1 == arg_5_1._index then
				var_5_6 = _1080p * (-var_5_2 - var_5_5)
				var_5_7 = _1080p * (var_5_2 - var_5_5)
			else
				var_5_6 = _1080p * -var_5_2
				var_5_7 = _1080p * var_5_2
			end

			arg_5_1.Button:SetLeft(var_5_6, var_5_0, arg_5_0.ButtonDodgeEasing)
			arg_5_1.Button:SetRight(var_5_7, var_5_0, arg_5_0.ButtonDodgeEasing)

			local var_5_8 = arg_5_0.ButtonHeight / 2
			local var_5_9 = _1080p * (-var_5_8 + arg_5_1._verticalButtonOffset)
			local var_5_10 = _1080p * (var_5_8 + arg_5_1._verticalButtonOffset)

			arg_5_1.Button:SetTop(var_5_9)
			arg_5_1.Button:SetBottom(var_5_10)
		end,
		UpdateSelectionState = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
			arg_6_3 = arg_6_3 or arg_6_0.DefaultExpandedBladeRatio

			local var_6_0 = arg_6_1._layoutHeight * arg_6_3
			local var_6_1 = arg_6_2 and 0 or arg_6_0.AnimationInDuration
			local var_6_2 = arg_6_2 and 0 or arg_6_0.AnimationOutDuration
			local var_6_3 = var_6_0 / 2
			local var_6_4 = arg_6_0:CalculateCenterOffset(arg_6_1)
			local var_6_5 = arg_6_0:CalculateBladeWidth(arg_6_1) / 2

			if arg_6_4 == arg_6_1._index then
				local var_6_6 = _1080p * (-var_6_3 + var_6_4)
				local var_6_7 = _1080p * (var_6_3 + var_6_4)

				arg_6_1:SetLeft(var_6_6, var_6_1, arg_6_0.AnimationEasing)
				arg_6_1:SetRight(var_6_7, var_6_1, arg_6_0.AnimationEasing)
				arg_6_1.Mask:SetLeftAnchor(0, var_6_1, arg_6_0.AnimationEasing)
				arg_6_1.Mask:SetRightAnchor(0, var_6_1, arg_6_0.AnimationEasing)
				arg_6_1.Overlay:SetLeftAnchor(0, var_6_1, arg_6_0.AnimationEasing)
				arg_6_1.Overlay:SetRightAnchor(0, var_6_1, arg_6_0.AnimationEasing)

				local var_6_8 = _1080p * -var_6_3
				local var_6_9 = _1080p * var_6_3

				arg_6_1.DisableOverlay:SetLeft(var_6_8)
				arg_6_1.DisableOverlay:SetRight(var_6_9)

				if arg_6_1._buttonOverAnimation == "ButtonOver" then
					local var_6_10 = 175 * _1080p
					local var_6_11 = LAYOUT.GetElementHeight(arg_6_1.ButtonDescription)

					arg_6_1.ButtonDescription:SetTop(var_6_10)
					arg_6_1.ButtonDescription:SetBottom(var_6_10 + var_6_11)

					if CONDITIONS.IsInKoreanIGRPaidSession then
						ACTIONS.AnimateSequence(arg_6_1, "IGRAlt")
					end
				end

				ACTIONS.AnimateSequence(arg_6_1, arg_6_1._buttonOverAnimation)
			else
				local var_6_12 = _1080p * (-var_6_5 + var_6_4)
				local var_6_13 = _1080p * (var_6_5 + var_6_4)

				arg_6_1:SetLeft(var_6_12, var_6_2, arg_6_0.AnimationEasing)
				arg_6_1:SetRight(var_6_13, var_6_2, arg_6_0.AnimationEasing)
				arg_6_1.Mask:SetLeftAnchor(0.5, var_6_2, arg_6_0.AnimationEasing)
				arg_6_1.Mask:SetRightAnchor(0.5, var_6_2, arg_6_0.AnimationEasing)
				arg_6_1.Overlay:SetLeftAnchor(0.5, var_6_2, arg_6_0.AnimationEasing)
				arg_6_1.Overlay:SetRightAnchor(0.5, var_6_2, arg_6_0.AnimationEasing)
				ACTIONS.AnimateSequence(arg_6_1, "ButtonUp")
			end

			arg_6_0:HandleButtonState(arg_6_1, arg_6_2, var_6_0, arg_6_4)
		end,
		UpdateStaticState = function(arg_7_0, arg_7_1)
			ACTIONS.AnimateSequence(arg_7_1, "Shutter")
			arg_7_1.Text:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
			arg_7_1.Text:SetStartupDelay(500)
			arg_7_1.Text:SetLineHoldTime(400)
			arg_7_1.Text:SetAnimMoveTime(1000)
			arg_7_1.Text:SetAnimMoveSpeed(300)
			arg_7_1.Text:SetEndDelay(800)
			arg_7_1.Text:SetCrossfadeTime(250)
			arg_7_1.Text:SetFadeInTime(300)
			arg_7_1.Text:SetFadeOutTime(300)
			arg_7_1.Text:SetMaxVisibleLines(1)
		end
	},
	[MAIN_MENU.BladeType.Accordion] = {
		AspectRatioAnchorAdjust = 0.02,
		DefaultExpandedBladeRatio = 1,
		AnimationDuration = 285,
		ImageFadeDuration = 285,
		AnimationEasing = LUI.EASING.outQuartic,
		FadeEasing = LUI.EASING.outQuadratic,
		CalculateNeutralBladeWidth = function(arg_8_0, arg_8_1)
			return arg_8_1._layoutWidth / arg_8_1._bladeCount
		end,
		CalculateContractedBladeWidth = function(arg_9_0, arg_9_1, arg_9_2)
			return (arg_9_1._layoutWidth - arg_9_2) / (arg_9_1._bladeCount - 1)
		end,
		CalculateAccordionWidths = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
			local var_10_0 = {}

			for iter_10_0 = 1, arg_10_1._bladeCount do
				if not arg_10_3 or not arg_10_2 then
					table.insert(var_10_0, arg_10_0:CalculateNeutralBladeWidth(arg_10_1))
				elseif iter_10_0 == arg_10_3 then
					table.insert(var_10_0, arg_10_2)
				else
					table.insert(var_10_0, arg_10_0:CalculateContractedBladeWidth(arg_10_1, arg_10_2))
				end
			end

			return var_10_0
		end,
		UpdateSelectionState = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
			arg_11_3 = arg_11_3 or arg_11_0.DefaultExpandedBladeRatio

			local var_11_0 = arg_11_1._layoutHeight * arg_11_3
			local var_11_1 = CoD.IsUsingAspectRatio(1.6) and arg_11_0.AspectRatioAnchorAdjust or 0
			local var_11_2 = arg_11_2 and 0 or arg_11_0.AnimationDuration
			local var_11_3 = arg_11_2 and 0 or arg_11_0.ImageFadeDuration

			arg_11_1._isSelectedIndex = arg_11_4 == arg_11_1._index

			if arg_11_1.UpsellOverlay then
				arg_11_1.UpsellOverlay:SetTopAnchor(0 + var_11_1)
				arg_11_1.UpsellOverlay:SetBottomAnchor(0 + var_11_1)
			end

			if arg_11_1._isSelectedIndex then
				arg_11_1.Image:SetAlpha(0, var_11_3, arg_11_0.FadeEasing)

				if arg_11_1._description then
					arg_11_1.ButtonDescription:SetAlpha(1, var_11_2, arg_11_0.AnimationEasing)
					arg_11_1.ButtonDescriptionBG:SetAlpha(0.5, var_11_2, arg_11_0.AnimationEasing)
					arg_11_1.ButtonDescription:SetBottomAnchor(1 - var_11_1, var_11_2, arg_11_0.AnimationEasing)
					arg_11_1.ButtonDescription:SetTopAnchor(var_11_1, var_11_2, arg_11_0.AnimationEasing)
					arg_11_1.ButtonDescriptionBG:SetBottomAnchor(1 - var_11_1, var_11_2, arg_11_0.AnimationEasing)
					arg_11_1.ButtonDescriptionBG:SetTopAnchor(var_11_1, var_11_2, arg_11_0.AnimationEasing)
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_11_1, "ShowBLMMagma")
				end

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_11_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_11_1, "VanguardRevealOver")
				end
			else
				arg_11_1.Image:SetAlpha(1, 0)
				arg_11_1.ButtonDescription:SetAlpha(0)
				arg_11_1.ButtonDescriptionBG:SetAlpha(0)
				arg_11_1.ButtonDescription:SetBottomAnchor(1)
				arg_11_1.ButtonDescription:SetTopAnchor(0)
				arg_11_1.ButtonDescriptionBG:SetBottomAnchor(1)
				arg_11_1.ButtonDescriptionBG:SetTopAnchor(0)

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_11_1, "HideBLMMagma")
				end

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_11_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_11_1, "VanguardRevealUp")
				end
			end

			local var_11_4 = arg_11_0:CalculateAccordionWidths(arg_11_1, var_11_0, arg_11_4)
			local var_11_5 = -arg_11_1._layoutWidth / 2

			for iter_11_0, iter_11_1 in ipairs(var_11_4) do
				if iter_11_0 < arg_11_1._index then
					var_11_5 = var_11_5 + iter_11_1
				else
					break
				end
			end

			local var_11_6 = _1080p * var_11_5
			local var_11_7 = _1080p * (var_11_5 + var_11_4[arg_11_1._index])

			arg_11_1:SetLeft(var_11_6, var_11_2, arg_11_0.AnimationEasing)
			arg_11_1:SetRight(var_11_7, var_11_2, arg_11_0.AnimationEasing)
		end,
		UpdateStaticState = function(arg_12_0, arg_12_1)
			ACTIONS.AnimateSequence(arg_12_1, "Accordion")

			if arg_12_1._imageName then
				arg_12_1.Image:setImage(RegisterMaterial(arg_12_1._imageName), 0)
			end
		end
	},
	[MAIN_MENU.BladeType.AccordionRefresh] = {
		AspectRatioAnchorAdjust = 0.02,
		AnimationDuration = 285,
		ImageFadeDuration = 285,
		AnimationEasing = LUI.EASING.outQuartic,
		FadeEasing = LUI.EASING.outQuadratic,
		DefaultExpandedBladeRatio = function(arg_13_0)
			if arg_13_0._bladeCount == 4 then
				return 0.59259
			else
				return 0.75185
			end
		end,
		CalculateNeutralBladeWidth = function(arg_14_0, arg_14_1)
			return arg_14_1._layoutWidth / arg_14_1._bladeCount
		end,
		CalculateContractedBladeWidth = function(arg_15_0, arg_15_1, arg_15_2)
			return (arg_15_1._layoutWidth - arg_15_2) / (arg_15_1._bladeCount - 1)
		end,
		CalculateAccordionWidths = function(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
			local var_16_0 = {}

			for iter_16_0 = 1, arg_16_1._bladeCount do
				if not arg_16_3 or not arg_16_2 then
					table.insert(var_16_0, arg_16_0:CalculateNeutralBladeWidth(arg_16_1))
				elseif iter_16_0 == arg_16_3 then
					table.insert(var_16_0, arg_16_2)
				else
					table.insert(var_16_0, arg_16_0:CalculateContractedBladeWidth(arg_16_1, arg_16_2))
				end
			end

			return var_16_0
		end,
		UpdateSelectionState = function(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
			arg_17_3 = arg_17_3 or arg_17_0.DefaultExpandedBladeRatio(arg_17_1)

			local var_17_0 = arg_17_1._layoutHeight * arg_17_3
			local var_17_1 = CoD.IsUsingAspectRatio(1.6) and arg_17_0.AspectRatioAnchorAdjust or 0
			local var_17_2 = arg_17_2 and 0 or arg_17_0.AnimationDuration
			local var_17_3 = arg_17_2 and 0 or arg_17_0.ImageFadeDuration

			arg_17_1._isSelectedIndex = arg_17_4 == arg_17_1._index

			local var_17_4 = arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyMW or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyVG or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyCW

			if arg_17_1.UpsellOverlay then
				arg_17_1.UpsellOverlay:SetTopAnchor(0 + var_17_1)
				arg_17_1.UpsellOverlay:SetBottomAnchor(0 + var_17_1)
			end

			if arg_17_1._isSelectedIndex then
				arg_17_1.Image:SetAlpha(0, var_17_3, arg_17_0.FadeEasing)

				if arg_17_1._keepAspect then
					local var_17_5 = _1080p * 1280
					local var_17_6 = _1080p * 2160
					local var_17_7 = _1080p * 50
					local var_17_8 = var_17_0 / var_17_5

					arg_17_1.Cinematic:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * var_17_0, -var_17_7, _1080p * (var_17_6 * var_17_8 - var_17_7))
				end

				if arg_17_1._description then
					arg_17_1.ButtonDescription:SetAlpha(1, var_17_2, arg_17_0.AnimationEasing)
					arg_17_1.ButtonDescriptionBG:SetAlpha(0.5, var_17_2, arg_17_0.AnimationEasing)
					arg_17_1.ButtonDescription:SetBottomAnchor(1 - var_17_1, var_17_2, arg_17_0.AnimationEasing)
					arg_17_1.ButtonDescription:SetTopAnchor(var_17_1, var_17_2, arg_17_0.AnimationEasing)
					arg_17_1.ButtonDescriptionBG:SetBottomAnchor(1 - var_17_1, var_17_2, arg_17_0.AnimationEasing)
					arg_17_1.ButtonDescriptionBG:SetTopAnchor(var_17_1, var_17_2, arg_17_0.AnimationEasing)
				end

				if not arg_17_1.list then
					arg_17_1:dispatchEventToParent({
						name = "main_menu_background_image_update",
						imageName = arg_17_1._backgroundImageName
					})
				end

				if arg_17_1._isNGBlade then
					ACTIONS.AnimateSequence(arg_17_1, "NewARBladeOver")
				end

				local var_17_9 = arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.VG or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.VG and CONDITIONS.IsVanguardDeeplinkEnabled()

				if arg_17_1._buttonListData and var_17_9 then
					ACTIONS.AnimateSequence(arg_17_1, "ARBladeOverNoWZOptionButton")
				else
					if arg_17_1._bladeKey == MAIN_MENU.BladeKeys.NG or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG then
						ACTIONS.AnimateSequence(arg_17_1, "NGBladeOver")
					elseif arg_17_1._bladeKey == MAIN_MENU.BladeKeys.VG then
						ACTIONS.AnimateSequence(arg_17_1, "VGBladeOver")
					else
						ACTIONS.AnimateSequence(arg_17_1, "ARBladeOver")
					end

					if var_17_4 then
						WZWIP.AnimateThemeElement(arg_17_1, "UpsellARBladeOver")
					end
				end

				ACTIONS.AnimateSequence(arg_17_1.WZFriendCount, WZWIP.CheckForApplyPrependWZWipPrefix("ARBladeOver", CONDITIONS.IsWZWipDvarEnabled()))

				if arg_17_1._bladeKey == MAIN_MENU.BladeKeys.HQ or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyHQ then
					ACTIONS.AnimateSequence(arg_17_1, "ShowNewGameNowAvailableMessage")
				end

				if arg_17_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_17_1, "WZLogoBladeOver")
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_17_1, "ShowBLMMagma")
				end

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_17_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_17_1, "VanguardRevealOver")
				end

				if arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.MW and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyMW and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.CW and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyCW and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.VG and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyVG and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.BR and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyNG and arg_17_1._bladeKey ~= MAIN_MENU.BladeKeys.NG then
					arg_17_1.WZWipNGSeasonCount:SetAlpha(1, 1)
				end

				if arg_17_1.list then
					arg_17_1.list:processEvent({
						name = "gain_focus"
					})
				end

				arg_17_1.SepRight:SetAlpha(0)

				arg_17_1._isSelected = true
			else
				arg_17_1.Image:SetAlpha(1, 0)
				arg_17_1.SepRight:SetAlpha(0.2)
				arg_17_1.WZWipNGSeasonCount:SetAlpha(0, 1)
				arg_17_1.ButtonDescription:SetAlpha(0)
				arg_17_1.ButtonDescriptionBG:SetAlpha(0)
				arg_17_1.ButtonDescription:SetBottomAnchor(1)
				arg_17_1.ButtonDescription:SetTopAnchor(0)
				arg_17_1.ButtonDescriptionBG:SetBottomAnchor(1)
				arg_17_1.ButtonDescriptionBG:SetTopAnchor(0)

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_17_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_17_1, "VanguardRevealUp")
				end

				if arg_17_1._isNGBlade then
					ACTIONS.AnimateSequence(arg_17_1, "NewARBladeUp")
				end

				ACTIONS.AnimateSequence(arg_17_1, "ARBladeUp")
				ACTIONS.AnimateSequence(arg_17_1.WZFriendCount, WZWIP.CheckForApplyPrependWZWipPrefix("ARBladeUp", CONDITIONS.IsWZWipDvarEnabled()))

				if arg_17_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_17_1, "WZLogoBladeUp")
				elseif arg_17_1._bladeKey == MAIN_MENU.BladeKeys.NG or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG then
					ACTIONS.AnimateSequence(arg_17_1, "NGBladeUp")
				end

				if var_17_4 then
					WZWIP.AnimateThemeElement(arg_17_1, "UpsellARBladeUp")
				end

				if arg_17_1._bladeKey == MAIN_MENU.BladeKeys.HQ or arg_17_1._bladeKey == MAIN_MENU.BladeKeys.BuyHQ then
					ACTIONS.AnimateSequence(arg_17_1, "ShowNewGameNowAvailableMessage")
					arg_17_1.TitleLogo:SetAlpha(1)
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_17_1, "HideBLMMagma")
				end

				arg_17_1._isSelected = false
			end

			if arg_17_1._friendsCountUpdate and arg_17_1._friendsCountUpdate ~= -1 then
				arg_17_1.WZFriendCount:SetAlpha(1)

				local var_17_10 = arg_17_1._isSelectedIndex and "MENU/FRIENDS_PLAYING" or "MENU/NUMBER"

				arg_17_1.WZFriendCount:SetFriendLabel(var_17_10)

				local var_17_11 = tostring(arg_17_1._friendsCountUpdate)

				arg_17_1.WZFriendCount:SetFriendCount(var_17_11)
			else
				arg_17_1.WZFriendCount:SetAlpha(0)
			end

			local var_17_12 = arg_17_0:CalculateAccordionWidths(arg_17_1, var_17_0, arg_17_4)
			local var_17_13 = -arg_17_1._layoutWidth / 2

			for iter_17_0, iter_17_1 in ipairs(var_17_12) do
				if iter_17_0 < arg_17_1._index then
					var_17_13 = var_17_13 + iter_17_1
				else
					break
				end
			end

			local var_17_14 = _1080p * var_17_13
			local var_17_15 = _1080p * (var_17_13 + var_17_12[arg_17_1._index])

			arg_17_1:SetLeft(var_17_14, var_17_2, arg_17_0.AnimationEasing)
			arg_17_1:SetRight(var_17_15, var_17_2, arg_17_0.AnimationEasing)
		end,
		UpdateStaticState = function(arg_18_0, arg_18_1, arg_18_2)
			local var_18_0 = arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.VG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.VG and CONDITIONS.IsVanguardDeeplinkEnabled()

			if arg_18_1._buttonListData and var_18_0 then
				ACTIONS.AnimateSequence(arg_18_1, "AccordionRefreshNoWZOptionButton")
			else
				ACTIONS.AnimateSequence(arg_18_1, "AccordionRefresh")
			end

			if arg_18_1._imageName then
				arg_18_1.Image:setImage(RegisterMaterial(arg_18_1._imageName))
			end

			if arg_18_1._titleLogo then
				arg_18_1.TitleLogo:setImage(RegisterMaterial(arg_18_1._titleLogo))
			end

			if arg_18_1.LiveEventInfo and arg_18_1._liveEventLocation and arg_18_2 then
				arg_18_1.LiveEventInfo:GetMessage(arg_18_2, {
					locationIndex = arg_18_1._liveEventLocation
				})
			end

			if arg_18_1._actionName then
				arg_18_1.WZOptionButton.Text:setText(arg_18_1._actionName)
			end

			if arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.NG then
				var_0_0(arg_18_1, arg_18_2, arg_18_1._bladeKey)
			elseif arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyVG and CONDITIONS.IsVaguardTrialEnabled() then
				arg_18_1.WZOptionButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FREE_TRIAL"))
			end
		end
	}
}
local var_0_2 = 500
local var_0_3 = "button_r3"
local var_0_4 = "button_right_stick"
local var_0_5 = "button_l3"
local var_0_6 = "button_left_stick"

local function var_0_7(arg_19_0, arg_19_1)
	if type(arg_19_0) == "table" then
		return arg_19_0
	else
		return {
			[arg_19_1] = arg_19_0
		}
	end
end

local function var_0_8(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0 ~= nil then
		if type(arg_20_0) == "function" then
			return arg_20_0(arg_20_2)
		else
			return arg_20_0
		end
	else
		return arg_20_1
	end
end

local function var_0_9(arg_21_0)
	if arg_21_0 ~= nil then
		if type(arg_21_0) == "function" then
			return arg_21_0
		else
			return function()
				return arg_21_0
			end
		end
	else
		return function()
			return nil
		end
	end
end

local function var_0_10(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:getParent()

	if var_24_0.HoverBladeByIndex then
		var_24_0:HoverBladeByIndex(arg_24_0._index, arg_24_1)
	end
end

local function var_0_11(arg_25_0)
	local var_25_0 = arg_25_0:getParent()

	if var_25_0.PushBladeToTopByIndex then
		var_25_0:PushBladeToTopByIndex(arg_25_0._index)
	end
end

local function var_0_12(arg_26_0)
	TIME.SetCountDownTimerTextField(arg_26_0.AlphaBetaCountdown, Dvar.CFHDGABACF("QQKNMNOON"), {
		useCustomDisplay = true,
		broadcastOnComplete = true,
		customFormatString = "SEASONS/EVENT_COUNTDOWN_DAYS_HOURS"
	})
	arg_26_0.AlphaBetaCountdown:addEventHandler(TIME.TIMER_TICK, function(arg_27_0, arg_27_1)
		if arg_27_1.intervals.days == 0 then
			if arg_27_1.intervals.hours == 0 then
				arg_27_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_MINUTES_SECONDS", arg_27_1.intervals.minutes, arg_27_1.intervals.seconds))

				if not arg_27_0._inMinutesAndSeconds then
					arg_27_0._inMinutesAndSeconds = true
				end
			else
				arg_27_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_HOURS_MINUTES", arg_27_1.intervals.hours, arg_27_1.intervals.minutes))

				if not arg_27_0._inHoursAndMinutes then
					arg_27_0._inHoursAndMinutes = true
				end
			end
		else
			arg_27_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_DAYS_HOURS", arg_27_1.intervals.days, arg_27_1.intervals.hours))

			if not arg_27_0._inDaysAndHours then
				arg_27_0._inDaysAndHours = true
			end
		end
	end)
end

local function var_0_13(arg_28_0)
	local var_28_0 = arg_28_0:GetCurrentMenu()

	if var_28_0 and var_28_0.AddButtonHelperText and var_28_0.RemoveButtonHelperText then
		var_28_0:RemoveButtonHelperText("button_primary", "left")
		var_28_0:RemoveButtonHelperText(var_0_3, "left")
		var_28_0:RemoveButtonHelperText(var_0_5, "left")

		if arg_28_0._currentState == MAIN_MENU.BladeStates.Installing then
			if arg_28_0._installingPrompt then
				var_28_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					priority = 2,
					helper_text = arg_28_0._installingPrompt
				})
			end
		elseif arg_28_0._currentState == MAIN_MENU.BladeStates.Blocked then
			if arg_28_0._blockedPrompt then
				var_28_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					priority = 2,
					helper_text = arg_28_0._blockedPrompt
				})
			end
		elseif arg_28_0._prompt then
			var_28_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = arg_28_0._prompt
			})
		else
			var_28_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		end

		local var_28_1 = LUI.FlowManager.GetScopedData(var_28_0)

		if CONDITIONS.IsConsoleGame() and CONDITIONS.IsPS4() then
			local var_28_2 = arg_28_0._bladeKey == MAIN_MENU.BladeKeys.SP or arg_28_0._bladeKey == MAIN_MENU.BladeKeys.CP or arg_28_0._bladeKey == MAIN_MENU.BladeKeys.MP

			if arg_28_0._currentState ~= MAIN_MENU.BladeStates.Installing and var_28_2 and not CONDITIONS.IsLaunchChunk() then
				var_28_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL")
				})

				if var_28_1 then
					var_28_1.currentSelectedMenuType = arg_28_0._bladeKey
				end
			else
				var_28_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = "",
					priority = 3
				})

				if var_28_1 then
					var_28_1.currentSelectedMenuType = nil
				end
			end
		end

		if arg_28_0._secondaryPrompt then
			var_28_0:AddButtonHelperText({
				side = "left",
				priority = 3,
				helper_text = arg_28_0._secondaryPrompt,
				button_ref = var_0_3
			})
		end

		if arg_28_0._tertiaryPrompt then
			var_28_0:AddButtonHelperText({
				side = "left",
				priority = 4,
				helper_text = arg_28_0._tertiaryPrompt,
				button_ref = var_0_5
			})
		end
	end
end

local function var_0_14(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:GetCurrentMenu()

	if var_29_0 then
		if arg_29_0._currentState == MAIN_MENU.BladeStates.Installing then
			if arg_29_0._installingAction and arg_29_0._installingAction(var_29_0, arg_29_1) then
				Engine.BJDBIAGIDA(arg_29_0._actionSFX)
			end
		elseif arg_29_0._currentState == MAIN_MENU.BladeStates.Blocked then
			if arg_29_0._blockedAction and arg_29_0._blockedAction(var_29_0, arg_29_1) then
				Engine.BJDBIAGIDA(arg_29_0._actionSFX)
			end
		else
			arg_29_0._action(var_29_0, arg_29_1)
			Engine.BJDBIAGIDA(arg_29_0._actionSFX)
		end
	else
		DebugPrint("MainMenuBlade: id=" .. arg_29_0.id .. " type=" .. tostring(arg_29_0._bladeType) .. " isn't part of a menu")
	end
end

local function var_0_15(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetCurrentMenu()

	if arg_30_0._selected then
		arg_30_0._secondaryAction(var_30_0, arg_30_1)
	end
end

local function var_0_16(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:GetCurrentMenu()

	if arg_31_0._selected then
		arg_31_0._tertiaryAction(var_31_0, arg_31_1)
	end
end

local function var_0_17(arg_32_0, arg_32_1, arg_32_2)
	if arg_32_1 < arg_32_0._currentState then
		arg_32_0._currentState = arg_32_1
		arg_32_0._stateParameters = arg_32_2
	end
end

local function var_0_18(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0._newUpdate(arg_33_1)

	if var_33_0 then
		local var_33_1 = var_0_7(var_33_0, "label")

		var_0_17(arg_33_0, MAIN_MENU.BladeStates.New, var_33_1)
	end
end

local function var_0_19(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0._isBlockedUpdate(arg_34_1)

	if var_34_0 then
		local var_34_1 = var_0_7(var_34_0, "label")

		var_0_17(arg_34_0, MAIN_MENU.BladeStates.Blocked, var_34_1)
	end
end

local function var_0_20(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0._isInstallingUpdate(arg_35_1)

	if var_35_0 then
		local var_35_1 = var_0_7(var_35_0, "label")

		var_0_17(arg_35_0, MAIN_MENU.BladeStates.Installing, var_35_1)
	end
end

local function var_0_21(arg_36_0, arg_36_1)
	if arg_36_1._buttonKey == arg_36_0.list.selectedIndex then
		arg_36_0.BlockedLabel:setText(arg_36_1._blockedText)
	end

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() then
		arg_36_0.BlockedLabel:SetAlpha(arg_36_1._isBlocked and 1 or 0)
	else
		arg_36_0.BlockedLabel:SetAlpha(0)
	end
end

local function var_0_22(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_1._isBlocked and arg_37_1._isBlocked(arg_37_2) or {
		isBlocked = false
	}

	arg_37_1:SetIsDisabled(var_37_0.isBlocked)
	arg_37_1:SetBlockedText(var_37_0.text)
	var_0_21(arg_37_0, arg_37_1)
end

local function var_0_23(arg_38_0)
	if arg_38_0.list and arg_38_0.list.buttons then
		for iter_38_0, iter_38_1 in ipairs(arg_38_0.list.buttons) do
			var_0_22(arg_38_0, iter_38_1, arg_38_0._partyCount)
		end
	end
end

local function var_0_24(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_1._installData then
		arg_39_0.InstallStatus:Refresh(arg_39_1._installData(), arg_39_2)
	end
end

local function var_0_25(arg_40_0)
	if arg_40_0.list and arg_40_0.list.buttons then
		for iter_40_0, iter_40_1 in ipairs(arg_40_0.list.buttons) do
			var_0_24(arg_40_0, iter_40_1, false)
		end
	end
end

local function var_0_26(arg_41_0, arg_41_1)
	arg_41_0._prompt = arg_41_0._promptUpdate(arg_41_1)
	arg_41_0._secondaryPrompt = arg_41_0._secondaryPromptUpdate(arg_41_1)
	arg_41_0._tertiaryPrompt = arg_41_0._tertiaryPromptUpdate(arg_41_1)
	arg_41_0._blockedPrompt = arg_41_0._blockedPromptUpdate(arg_41_1)
	arg_41_0._installingPrompt = arg_41_0._installingPromptUpdate(arg_41_1)
end

local function var_0_27(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0._currentState == MAIN_MENU.BladeStates.Blocked

	if arg_42_0.list and arg_42_0.list.buttons then
		for iter_42_0, iter_42_1 in ipairs(arg_42_0.list.buttons) do
			iter_42_1:SetIsDisabled(var_42_0)
		end
	end
end

local function var_0_28(arg_43_0, arg_43_1)
	arg_43_0._currentState = MAIN_MENU.BladeStates.Neutral

	var_0_20(arg_43_0, arg_43_1)
	var_0_19(arg_43_0, arg_43_1)
	var_0_18(arg_43_0, arg_43_1)
	var_0_26(arg_43_0, arg_43_1)

	if not arg_43_0._disableBlockedStateRefresh then
		var_0_27(arg_43_0, arg_43_1)
		arg_43_0.DisableOverlay:RefreshState(arg_43_0._currentState, arg_43_0._stateParameters)
	end

	arg_43_0.Button:RefreshState(arg_43_0._currentState, arg_43_0._stateParameters)
end

local function var_0_29(arg_44_0)
	if arg_44_0._transitionSwatch then
		arg_44_0.Overlay:SetRGBFromTable(arg_44_0._transitionSwatch)
		arg_44_0.Underlay:SetRGBFromTable(arg_44_0._transitionSwatch)
	end
end

local function var_0_30(arg_45_0, arg_45_1)
	if not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_45_1) or not Dvar.IBEGCHEFE("blm_messaging") then
		if arg_45_0._name and arg_45_0._name ~= "" then
			arg_45_0.Text:setText(arg_45_0._name)
			arg_45_0.Button.Text:setText(arg_45_0._name)
		else
			arg_45_0.Text:SetAlpha(0)
			arg_45_0.TextBackground:SetAlpha(0)
		end

		if arg_45_0._description and arg_45_0._description ~= "" then
			arg_45_0.ButtonDescription:setText(arg_45_0._description)
		else
			arg_45_0.ButtonDescription:SetAlpha(0)
			arg_45_0.ButtonDescriptionBG:SetAlpha(0)
		end
	else
		arg_45_0.BLMTitle:setText(ToUpperCase(arg_45_0._name))
		arg_45_0.BLMDesc:setText(arg_45_0._description)
		arg_45_0.Text:SetAlpha(0)
		arg_45_0.TextBackground:SetAlpha(0)
		arg_45_0.ButtonDescription:SetAlpha(0)
		arg_45_0.ButtonDescriptionBG:SetAlpha(0)
	end
end

local function var_0_31(arg_46_0)
	arg_46_0.Image:SetMask(arg_46_0.Mask)
	arg_46_0.Text:SetMask(arg_46_0.Mask)
	arg_46_0.TextBackground:SetMask(arg_46_0.Mask)
	arg_46_0.Cinematic:SetMask(arg_46_0.Mask)
	arg_46_0.ButtonDescription:SetMask(arg_46_0.Mask)
	arg_46_0.ButtonDescriptionBG:SetMask(arg_46_0.Mask)
	arg_46_0.DisableOverlay:SetMask(arg_46_0.Mask)
	arg_46_0.Overlay:SetMask(arg_46_0.Mask)
	arg_46_0.Underlay:SetMask(arg_46_0.Mask)
	arg_46_0.BlackoutImage:SetMask(arg_46_0.Mask)

	if arg_46_0.UpsellOverlay then
		arg_46_0.UpsellOverlay:SetMask(arg_46_0.Mask)
	end

	if arg_46_0.StoreOverlay then
		arg_46_0.StoreOverlay:SetMask(arg_46_0.Mask)
	end

	if arg_46_0.ClassifiedCountdownTimer then
		arg_46_0.ClassifiedCountdownTimer:SetMask(arg_46_0.Mask)
	end
end

local function var_0_32(arg_47_0, arg_47_1)
	if arg_47_0._secondaryAction or arg_47_0._tertiaryAction then
		local var_47_0 = LUI.UIBindButton.new()

		var_47_0.id = "selfBindButton"

		arg_47_0:addElement(var_47_0)

		arg_47_0.bindButton = var_47_0

		if arg_47_0._secondaryAction then
			arg_47_0.bindButton:addEventHandler(var_0_4, function(arg_48_0, arg_48_1)
				var_0_15(arg_47_0, arg_47_1)
			end)
		end

		if arg_47_0._tertiaryAction then
			arg_47_0.bindButton:addEventHandler(var_0_6, function(arg_49_0, arg_49_1)
				var_0_16(arg_47_0, arg_47_1)
			end)
		end
	end
end

local function var_0_33(arg_50_0, arg_50_1)
	if not arg_50_0._showUpsellOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_50_0.UpsellOverlay:closeTree()

		arg_50_0.UpsellOverlay = nil
	elseif arg_50_0._isOnSale then
		arg_50_0.UpsellOverlay:FlagOnSale()
	end
end

local function var_0_34(arg_51_0, arg_51_1)
	if not arg_51_0._showNGOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_51_0.NGOverlay:closeTree()

		arg_51_0.NGOverlay = nil
	end
end

local function var_0_35(arg_52_0, arg_52_1)
	if not arg_52_0._showStoreOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_52_0.StoreOverlay:closeTree()

		arg_52_0.StoreOverlay = nil
	end
end

local function var_0_36(arg_53_0, arg_53_1)
	if arg_53_0._classified then
		local var_53_0 = tonumber(Engine.DCJHCAFIIA())
		local var_53_1 = Dvar.CFHDGABACF("MNNTMPMOLK")
		local var_53_2 = MenuBuilder.BuildRegisteredType("ClassifiedCountdownTimer", {
			controllerIndex = arg_53_1
		})

		var_53_2.id = "ClassifiedCountdownTimer"

		var_53_2:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -175, _1080p * 175, _1080p * -40, _1080p * 40)
		arg_53_0:addElement(var_53_2)

		arg_53_0.ClassifiedCountdownTimer = var_53_2

		if var_53_0 and var_53_0 > 0 and var_53_1 and var_53_1 > 0 then
			arg_53_0.ClassifiedCountdownTimer:SetAlpha(0.8)
		end

		arg_53_0.Text:SetGlitchAmount(1)
		arg_53_0.Button:SetGlitchAmount(var_53_1 == 0 and 0.8 or 0)
		arg_53_0.ButtonDescriptionBG:SetAlpha(0)
		arg_53_0.Text:SetAlpha(0)
		arg_53_0.TextBackground:SetAlpha(0)
	end
end

local function var_0_37(arg_54_0)
	if CONDITIONS.IsInKoreanIGRPaidSession(arg_54_0) then
		assert(arg_54_0.ButtonDescriptionIGR)
		assert(arg_54_0.IGRBoostIcon)
		arg_54_0.ButtonDescriptionIGR:SetMask(arg_54_0.Mask)

		local var_54_0 = Engine.DDAEJCJEA()

		arg_54_0.ButtonDescriptionIGR:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BONUS_TIP", tostring(var_54_0 * 100)))
		arg_54_0.IGRBoostIcon:SetMask(arg_54_0.Mask)
	end
end

local function var_0_38(arg_55_0)
	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_55_0, "JP")
	elseif IsLanguageSafeChinese() or IsLanguageSimplifiedChinese() then
		ACTIONS.AnimateSequence(arg_55_0, "CHSF")
	elseif IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_55_0, "CHTR")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_55_0, "AR")
	elseif IsLanguageSpanish() or IsLanguagePortuguese() then
		ACTIONS.AnimateSequence(arg_55_0, "ESandPT")
	end
end

local function var_0_39(arg_56_0, arg_56_1)
	var_0_36(arg_56_0, arg_56_1)
	var_0_33(arg_56_0, arg_56_1)
	var_0_34(arg_56_0, arg_56_1)
	var_0_35(arg_56_0, arg_56_1)
	var_0_32(arg_56_0, arg_56_1)
	var_0_38(arg_56_0)
	var_0_37(arg_56_0)
	var_0_29(arg_56_0)
	var_0_31(arg_56_0)
	var_0_30(arg_56_0, arg_56_1)
	var_0_1[arg_56_0._bladeType]:UpdateStaticState(arg_56_0, arg_56_1)
end

local function var_0_40(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_0 then
		if arg_57_1 then
			arg_57_0:FlagExpanded()
			arg_57_0:SetLeft(-6, 0)
			arg_57_0:SetRight(6, 0)
		else
			arg_57_0:FlagContracted(arg_57_2)
			arg_57_0:SetLeft(0, 0)
			arg_57_0:SetRight(0, 0)
		end
	end
end

local function var_0_41(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.Cinematic:SetAlpha(0, 0)

	if arg_58_0._index == arg_58_1 then
		var_0_13(arg_58_0)
		var_0_11(arg_58_0)
		var_0_40(arg_58_0.UpsellOverlay, true, false)
		var_0_40(arg_58_0.NGOverlay, true, false)
		var_0_40(arg_58_0.StoreOverlay, true, false)
		arg_58_0.DisableOverlay:FlagExpanded()
		arg_58_0.Trigger:processEvent({
			name = "gain_focus"
		})

		arg_58_0._selected = true

		if arg_58_0.list then
			arg_58_0._selectedIndex = arg_58_1

			arg_58_0.list:processEvent({
				name = "gain_focus"
			})
			arg_58_0.InlineList:SetAlpha(1)
		else
			arg_58_0:PlayBladeVideo(arg_58_0._videoName)
			arg_58_0.WZOptionButton:processEvent({
				name = "gain_focus"
			})
		end

		if arg_58_0._gainFocusRightSFX and arg_58_0._gainFocusLeftSFX then
			if not arg_58_0._lastSelectedIndex then
				Engine.BJDBIAGIDA(arg_58_0._gainFocusRightSFX)
			elseif arg_58_0._index > arg_58_0._lastSelectedIndex then
				if arg_58_2 then
					Engine.BJDBIAGIDA(arg_58_0._gainFocusLeftSFX)
				else
					Engine.BJDBIAGIDA(arg_58_0._gainFocusRightSFX)
				end
			elseif arg_58_0._index < arg_58_0._lastSelectedIndex then
				if arg_58_2 then
					Engine.BJDBIAGIDA(arg_58_0._gainFocusRightSFX)
				else
					Engine.BJDBIAGIDA(arg_58_0._gainFocusLeftSFX)
				end
			end
		end
	else
		var_0_40(arg_58_0.UpsellOverlay, false, arg_58_0._useSmallerBlades)
		var_0_40(arg_58_0.NGOverlay, false, arg_58_0._useSmallerBlades)
		var_0_40(arg_58_0.StoreOverlay, false, arg_58_0._useSmallerBlades)
		arg_58_0.DisableOverlay:FlagContracted()
		arg_58_0.Trigger:processEvent({
			name = "lose_focus"
		})
		arg_58_0.InstallStatus:processEvent({
			name = "lose_focus"
		})

		if arg_58_0.list then
			arg_58_0.list:processEvent({
				name = "lose_focus"
			})
			arg_58_0.InlineList:SetAlpha(0)
		else
			arg_58_0.WZOptionButton:processEvent({
				name = "lose_focus"
			})
		end

		arg_58_0._selected = false
	end

	arg_58_0._lastSelectedIndex = arg_58_1
end

local function var_0_42(arg_59_0, arg_59_1)
	var_0_41(arg_59_0, arg_59_1.selectedIndex, arg_59_1.wrapped)
	var_0_1[arg_59_0._bladeType]:UpdateSelectionState(arg_59_0, arg_59_1.snap, arg_59_1.expandedRatio, arg_59_1.selectedIndex)
end

local function var_0_43(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0:getParent()

	if var_60_0 and var_60_0.CurrentVideoName ~= arg_60_1 then
		var_60_0.CurrentVideoName = arg_60_1

		if Dvar.IBEGCHEFE("lui_br_blade_video_is_encrypted") and arg_60_1 == Dvar.DHEEJCCJBH("NKNPQRNMST") or arg_60_0._isVideoEncrypted then
			Engine.BIFAAAECJJ(arg_60_1)
		else
			Engine.DFCGFCGBFD(arg_60_1)
		end

		arg_60_0:Wait(10).onComplete = function()
			arg_60_0.Cinematic:SetAlpha(1, 0)
		end
	end
end

local function var_0_44(arg_62_0, arg_62_1, arg_62_2)
	assert(arg_62_2.index)
	assert(arg_62_2.action and type(arg_62_2.action) == "function")
	assert(arg_62_2.videoName)
	assert(var_0_1[arg_62_2.bladeType])

	arg_62_0.PlayBladeVideo = var_0_43
	arg_62_0._index = arg_62_2.index
	arg_62_0._bladeCount = arg_62_2.bladeCount
	arg_62_0._layoutWidth = arg_62_2.layoutWidth
	arg_62_0._layoutHeight = arg_62_2.layoutHeight
	arg_62_0._bladeType = arg_62_2.bladeType
	arg_62_0._bladeKey = arg_62_2.bladeKey
	arg_62_0._name = var_0_8(arg_62_2.name, nil, arg_62_1)
	arg_62_0._description = var_0_8(arg_62_2.description, nil, arg_62_1)
	arg_62_0._videoName = var_0_8(arg_62_2.videoName, nil, arg_62_1)
	arg_62_0._isVideoEncrypted = var_0_8(arg_62_2.isVideoEncrypted, nil, arg_62_1)
	arg_62_0._keepAspect = var_0_8(arg_62_2.keepAspect, nil, arg_62_1)
	arg_62_0._imageName = var_0_8(arg_62_2.imageName, nil, arg_62_1)
	arg_62_0._backgroundImageName = var_0_8(arg_62_2.backgroundImageName, nil, arg_62_1)
	arg_62_0._titleLogo = var_0_8(arg_62_2.titleLogo, nil, arg_62_1)
	arg_62_0._liveEventLocation = var_0_8(arg_62_2.liveEventLocation, nil, arg_62_1)
	arg_62_0._verticalButtonOffset = var_0_8(arg_62_2.verticalButtonOffset, nil, arg_62_1)
	arg_62_0._transitionSwatch = var_0_8(arg_62_2.transitionSwatch, COLORS.black, arg_62_1)
	arg_62_0._bladeThemeAnim = var_0_8(arg_62_2.bladeThemeAnim, nil, arg_62_1)
	arg_62_0._friendsCountUpdate = var_0_8(arg_62_2.friendsCountUpdate, -1, arg_62_1)
	arg_62_0._friendsCountUpdateFunc = arg_62_2.friendsCountUpdate
	arg_62_0._action = arg_62_2.action
	arg_62_0._actionName = var_0_8(arg_62_2.actionName, "", arg_62_1)
	arg_62_0._preOrderLabelText = var_0_8(arg_62_2.preOrderLabelText, "", arg_62_1)
	arg_62_0._promptUpdate = var_0_9(arg_62_2.prompt)
	arg_62_0._secondaryAction = arg_62_2.secondaryAction
	arg_62_0._secondaryPromptUpdate = var_0_9(arg_62_2.secondaryPrompt)
	arg_62_0._tertiaryAction = arg_62_2.tertiaryAction
	arg_62_0._tertiaryPromptUpdate = var_0_9(arg_62_2.tertiaryPrompt)
	arg_62_0._blockedAction = arg_62_2.blockedAction
	arg_62_0._isBlockedUpdate = var_0_9(arg_62_2.isBlocked)
	arg_62_0._blockedPromptUpdate = var_0_9(arg_62_2.blockedPrompt)
	arg_62_0._installingAction = arg_62_2.installingAction
	arg_62_0._isInstallingUpdate = var_0_9(arg_62_2.isInstalling)
	arg_62_0._installingPromptUpdate = var_0_9(arg_62_2.installingPrompt)
	arg_62_0._newUpdate = var_0_9(arg_62_2.isNew)
	arg_62_0._timerLabel = arg_62_2.timerLabel
	arg_62_0._timerEnd = arg_62_2.timerEnd
	arg_62_0._actionSFX = arg_62_0.Trigger.actionSFX
	arg_62_0._gainFocusLeftSFX = var_0_8(arg_62_2.gainFocusLeftSFX, nil, arg_62_1)
	arg_62_0._gainFocusRightSFX = var_0_8(arg_62_2.gainFocusRightSFX, nil, arg_62_1)
	arg_62_0._classified = var_0_8(arg_62_2.classified, nil, arg_62_1)
	arg_62_0._showUpsellOverlay = var_0_8(arg_62_2.showUpsellOverlay, nil, arg_62_1)
	arg_62_0._showNGOverlay = var_0_8(arg_62_2.showNGOverlay, nil, arg_62_1)
	arg_62_0._showStoreOverlay = var_0_8(arg_62_2.showStoreOverlay, nil, arg_62_1)
	arg_62_0._isOnSale = var_0_8(arg_62_2.isOnSale, nil, arg_62_1)
	arg_62_0._useSmallerBlades = var_0_8(arg_62_2.useSmallerBlades, nil, arg_62_1)
	arg_62_0._buttonOverAnimation = var_0_8(arg_62_2.getButtonOverAnimation, "ButtonOver", arg_62_1)
	arg_62_0._smallButtonAnimation = var_0_8(arg_62_2.smallButtonAnimation, nil, arg_62_1)
	arg_62_0._isNGBlade = var_0_8(arg_62_2.isNGBlade, false, arg_62_1)
	arg_62_0._isWZBlade = var_0_8(arg_62_2.isWZBlade, false, arg_62_1)
	arg_62_0._buttonListData = var_0_8(arg_62_2.buttonListData, false, arg_62_1)

	local var_62_0 = arg_62_0._bladeKey ~= MAIN_MENU.BladeKeys.VG or arg_62_0._bladeKey == MAIN_MENU.BladeKeys.VG and CONDITIONS.IsVanguardDeeplinkEnabled()

	if arg_62_0._buttonListData and var_62_0 then
		local var_62_1 = LUI.UIVerticalList.new()
		local var_62_2 = arg_62_0:getWidth()

		var_62_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 30 * _1080p, 98 * _1080p)

		var_62_1.id = "list"
		var_62_1.selectedIndex = 1
		var_62_1.buttons = {}

		var_62_1:SetSpacing(1 * _1080p)
		arg_62_0.InlineList:addElement(var_62_1)

		arg_62_0.list = var_62_1

		for iter_62_0, iter_62_1 in ipairs(arg_62_0._buttonListData) do
			local var_62_3 = MenuBuilder.BuildRegisteredType("WZBladeButton", {
				controllerIndex = arg_62_1
			})

			var_62_3.id = "Button" .. tostring(iter_62_0)
			var_62_3._buttonKey = iter_62_0
			var_62_3._videoName = var_0_8(iter_62_1.videoName, nil, arg_62_1)
			var_62_3._backgroundImageName = var_0_8(iter_62_1.backgroundImageName, nil, arg_62_1)
			var_62_3._installData = iter_62_1.installData
			var_62_3._buttonAction = iter_62_1.buttonAction
			var_62_3._isBlocked = iter_62_1.isBlocked
			var_62_3._shouldInstall = iter_62_1.shouldInstall
			var_62_3._isButtonBlocked = iter_62_1.isButtonBlocked
			var_62_3._bladeIndex = arg_62_0._index
			var_62_3._name = var_0_8(iter_62_1.name, "", arg_62_1)

			var_62_3:SetText(var_62_3._name)
			var_62_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 38 * _1080p)
			var_62_3:SetIsDisabled(var_62_3._shouldInstall and var_62_3._shouldInstall())

			if var_62_3._installData then
				var_62_3:SetDownloadIconVisibility(var_62_3._installData().state ~= ContentProgressState.INSTALLED)
			end

			arg_62_0.list.buttons[iter_62_0] = var_62_3

			if not CONDITIONS.IsVanguardArenaDisabled() then
				arg_62_0.list:addElement(var_62_3)
			elseif CONDITIONS.IsVanguardArenaDisabled() and iter_62_1.name ~= Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA_VG") then
				arg_62_0.list:addElement(var_62_3)
			end

			if iter_62_1.isDefaultButton then
				var_62_1:SetDefaultFocus(var_62_3._buttonKey)
			end

			if arg_62_0._bladeThemeAnim ~= nil then
				ACTIONS.AnimateSequence(var_62_3, arg_62_0._bladeThemeAnim)
			end

			var_62_3:addEventHandler("button_over", function(arg_63_0, arg_63_1)
				local var_63_0 = arg_63_1.controller or arg_62_1
				local var_63_1 = arg_63_0._isButtonBlocked and arg_63_0._isButtonBlocked(var_63_0)

				if var_63_1 then
					local var_63_2 = var_0_7(var_63_1, "label")

					var_0_17(arg_62_0, MAIN_MENU.BladeStates.Blocked, var_63_2)

					arg_62_0._disableBlockedStateRefresh = true

					arg_63_0:SetIsDisabled(true)
				else
					arg_62_0._currentState = MAIN_MENU.BladeStates.Neutral
					arg_62_0._disableBlockedStateRefresh = false

					arg_63_0:SetIsDisabled(false)

					if arg_62_0._selectedIndex == arg_63_0._bladeIndex then
						if arg_62_0._selected == false then
							var_0_10(arg_62_0, var_63_0)
						end

						local var_63_3 = arg_63_0._videoName

						if var_63_3 then
							arg_62_0:PlayBladeVideo(var_63_3)
						end

						arg_62_0:dispatchEventToParent({
							name = "main_menu_background_image_update",
							imageName = arg_63_0._backgroundImageName
						})
					end

					arg_62_0.list.selectedIndex = arg_63_0._buttonKey

					var_0_21(arg_62_0, arg_63_0)
					arg_63_0:RefreshDisabledAnimation()
					arg_62_0.InstallStatus:Disable()

					if arg_63_0._shouldInstall and arg_63_0._shouldInstall() then
						arg_62_0.InstallStatus:Refresh(arg_63_0._installData(), true)
						arg_63_0:SetIsDisabled(true)
					end
				end

				arg_62_0.DisableOverlay:RefreshState(arg_62_0._currentState, arg_62_0._stateParameters)

				for iter_63_0, iter_63_1 in ipairs(arg_62_0.list.buttons) do
					if iter_63_1 ~= arg_63_0 then
						iter_63_1._lastState = "ButtonUp"

						WZWIP.AnimateThemeElement(iter_63_1, "ButtonUp")
					end
				end
			end)
			var_62_3:addEventHandler("button_up", function(arg_64_0, arg_64_1)
				arg_64_0:RefreshDisabledAnimation()
			end)
			var_62_3:addEventHandler("button_action", function(arg_65_0, arg_65_1)
				local var_65_0 = arg_62_0:GetCurrentMenu()

				if not arg_65_0._isDisabled then
					arg_65_0._buttonAction(var_65_0, arg_65_1.controller)
				end
			end)
		end

		local var_62_4 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

		arg_62_0:SubscribeToModel(var_62_4:GetModel(arg_62_1), function()
			arg_62_0._partyCount = var_62_4:GetValue(arg_62_1)

			var_0_23(arg_62_0)
		end)
	end

	arg_62_0._stateParameters = {}

	if arg_62_0._smallButtonAnimation then
		ACTIONS.AnimateSequence(arg_62_0.Button, arg_62_0._smallButtonAnimation)
	end

	if Dvar.IBEGCHEFE("blm_messaging") and (not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_62_1)) then
		ACTIONS.AnimateSequence(arg_62_0, "BLM")
	end

	if arg_62_0._bladeThemeAnim ~= nil then
		ACTIONS.AnimateSequence(arg_62_0, arg_62_0._bladeThemeAnim)
	end

	arg_62_0.Trigger:setGainFocusAllSFX(nil)

	arg_62_0.Trigger.actionSFX = nil

	if not arg_62_0._buttonListData or arg_62_0._bladeKey == MAIN_MENU.BladeKeys.VG and not CONDITIONS.IsVanguardDeeplinkEnabled() then
		arg_62_0.Trigger:addEventHandler("button_action", function(arg_67_0, arg_67_1)
			var_0_14(arg_62_0, arg_67_1.controller)

			return false
		end)
		arg_62_0.WZOptionButton:addEventHandler("button_action", function(arg_68_0, arg_68_1)
			var_0_14(arg_62_0, arg_68_1.controller)

			return false
		end)
	end

	arg_62_0.Trigger:addEventHandler("button_over", function(arg_69_0, arg_69_1)
		local var_69_0 = arg_69_1.controller or arg_62_1

		if arg_69_1.focusType ~= FocusType.MenuFlow then
			var_0_10(arg_62_0, var_69_0)
		end
	end)
	arg_62_0:addEventHandler("selection_state_updated", var_0_42)

	arg_62_0.refreshTimer = LUI.UITimer.new({
		event = "perpetually_refreshed_state_tick",
		interval = var_0_2
	})

	arg_62_0:addElement(arg_62_0.refreshTimer)
	arg_62_0:addEventHandler("perpetually_refreshed_state_tick", function()
		var_0_28(arg_62_0, arg_62_1)

		return true
	end)
	var_0_28(arg_62_0, arg_62_1)
	var_0_39(arg_62_0, arg_62_1)
	arg_62_0:registerEventHandler("refresh_friends_counts", function(arg_71_0, arg_71_1)
		if arg_71_0._friendsCountUpdateFunc then
			local var_71_0 = arg_71_1.controller
			local var_71_1 = arg_71_1.friendsData

			arg_71_0._friendsCountUpdate = arg_71_0._friendsCountUpdateFunc(var_71_0, var_71_1)

			if arg_71_0._friendsCountUpdate then
				if arg_71_0._friendsCountUpdate == -1 then
					arg_71_0.WZFriendCount:SetAlpha(0)
				else
					arg_71_0.WZFriendCount:SetAlpha(1)

					local var_71_2 = tostring(arg_71_0._friendsCountUpdate)

					arg_71_0.WZFriendCount:SetFriendCount(var_71_2)
				end
			end
		end
	end)
	arg_62_0.WZWipNGSeasonCount:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", SEASON.GetCurrentSeasonDisplayNum())))

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_62_0, "WZWipSetup")

		local var_62_5

		if CONDITIONS.IsT9ZombieFreeTrialEnabled() then
			var_62_5 = "LUA_MENU/WZ_EVENT_PLAYLIST_CH2_ZM_NAME"
		end

		if arg_62_0._bladeKey == MAIN_MENU.BladeKeys.BuyVG then
			var_62_5 = "LUA_MENU/PURCHASE_ACTION"

			if CONDITIONS.IsVaguardTrialEnabled() then
				var_62_5 = "LUA_MENU/FREE_TRIAL"
			end
		elseif arg_62_0._bladeKey == MAIN_MENU.BladeKeys.BuyMW then
			var_62_5 = "LUA_MENU/PURCHASE_ACTION"
		elseif arg_62_0._bladeKey == MAIN_MENU.BladeKeys.BuyNG then
			arg_62_0:addEventHandler("update_cortez_blade_anim", function(arg_72_0, arg_72_1)
				var_0_0(arg_72_0, arg_62_1, arg_62_0._bladeKey)
			end)
			var_0_0(arg_62_0, arg_62_1, arg_62_0._bladeKey)
		end

		if var_62_5 ~= nil then
			arg_62_0.WZWipPurchaseMsgBladeUp:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_62_5)))
		end
	end

	if LUI.FlowManager.IsInStack("MainMenu") and not LUI.FlowManager.GetScopedData("MainMenu").streamerCreated then
		local var_62_6
		local var_62_7 = LUI.UIImage.new()

		var_62_7.id = "Spinner"

		var_62_7:setImage(RegisterMaterial("spinner_loading"), 0)
		var_62_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 522, _1080p * 532)
		arg_62_0:addElement(var_62_7)

		arg_62_0.Spinner = var_62_7
		arg_62_0:Wait(3500).onComplete = function()
			arg_62_0.Spinner:SetAlpha(0)
		end
	end

	arg_62_0:registerEventHandler("gamepad_button", function(arg_74_0, arg_74_1)
		if not arg_74_1.down and (arg_74_1.button == "up" or arg_74_1.button == "down") and arg_62_0.list and arg_62_0._selected and not arg_62_0.list:isInFocus() then
			arg_62_0.list:processEvent({
				name = "gain_focus"
			})
		end
	end)
	arg_62_0:registerEventHandler("vg_reveal_event_live", function(arg_75_0, arg_75_1)
		if arg_75_0._isWZBlade and CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_75_0._isSelectedIndex then
			arg_75_0.VanguardRevealLiveEvent:SetAlpha(1)
		end
	end)
	var_0_12(arg_62_0)
end

function MainMenuBlade(arg_76_0, arg_76_1)
	local var_76_0 = LUI.UIElement.new()

	var_76_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 1080 * _1080p)

	var_76_0.id = "MainMenuBlade"
	var_76_0._animationSets = var_76_0._animationSets or {}
	var_76_0._sequences = var_76_0._sequences or {}

	local var_76_1 = arg_76_1 and arg_76_1.controllerIndex

	if not var_76_1 and not Engine.DDJFBBJAIG() then
		var_76_1 = var_76_0:getRootController()
	end

	assert(var_76_1)

	local var_76_2 = var_76_0
	local var_76_3
	local var_76_4 = MenuBuilder.BuildRegisteredType("MainMenuButton", {
		controllerIndex = var_76_1
	})

	var_76_4.id = "Button"

	var_76_4.Text:setText("", 0)
	var_76_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -25, _1080p * 25)
	var_76_0:addElement(var_76_4)

	var_76_0.Button = var_76_4

	local var_76_5
	local var_76_6 = LUI.UIImage.new()

	var_76_6.id = "Underlay"

	var_76_6:SetRGBFromInt(0, 0)
	var_76_0:addElement(var_76_6)

	var_76_0.Underlay = var_76_6

	local var_76_7
	local var_76_8 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_76_1
	})

	var_76_8.id = "Cinematic"

	var_76_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, 0, 0)
	var_76_0:addElement(var_76_8)

	var_76_0.Cinematic = var_76_8

	local var_76_9
	local var_76_10 = LUI.UIImage.new()

	var_76_10.id = "Image"

	var_76_10:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -600, _1080p * 600, 0, 0)
	var_76_0:addElement(var_76_10)

	var_76_0.Image = var_76_10

	local var_76_11
	local var_76_12 = LUI.UIImage.new()

	var_76_12.id = "Overlay"

	var_76_12:SetRGBFromInt(0, 0)
	var_76_0:addElement(var_76_12)

	var_76_0.Overlay = var_76_12

	local var_76_13
	local var_76_14 = LUI.UIImage.new()

	var_76_14.id = "BlackoutImage"

	var_76_14:SetRGBFromInt(0, 0)
	var_76_14:SetAlpha(0, 0)
	var_76_0:addElement(var_76_14)

	var_76_0.BlackoutImage = var_76_14

	local var_76_15
	local var_76_16 = MenuBuilder.BuildRegisteredType("CRMLiveEventBladeInfo", {
		controllerIndex = var_76_1
	})

	var_76_16.id = "LiveEventInfo"

	var_76_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -156, _1080p * 156, _1080p * -171, _1080p * -95)
	var_76_0:addElement(var_76_16)

	var_76_0.LiveEventInfo = var_76_16

	local var_76_17
	local var_76_18 = LUI.UIImage.new()

	var_76_18.id = "TextBackground"

	var_76_18:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
	var_76_18:SetAlpha(0.75, 0)
	var_76_18:SetPixelGridEnabled(true)
	var_76_18:SetPixelGridContrast(0.5, 0)
	var_76_18:SetPixelGridBlockWidth(2, 0)
	var_76_18:SetPixelGridBlockHeight(2, 0)
	var_76_18:SetPixelGridGutterWidth(1, 0)
	var_76_18:SetPixelGridGutterHeight(1, 0)
	var_76_18:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -43, _1080p * -62, _1080p * 18)
	var_76_0:addElement(var_76_18)

	var_76_0.TextBackground = var_76_18

	local var_76_19
	local var_76_20 = LUI.UIStyledText.new()

	var_76_20.id = "Text"

	var_76_20:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_76_20:setText("", 0)
	var_76_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_20:SetAlignment(LUI.Alignment.Left)
	var_76_20:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_76_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 16, _1080p * -66, _1080p * -40, _1080p * -4)
	var_76_0:addElement(var_76_20)

	var_76_0.Text = var_76_20

	local var_76_21
	local var_76_22 = LUI.UIImage.new()

	var_76_22.id = "WZOptionButtonFUI"

	var_76_22:SetAlpha(0, 0)
	var_76_22:setImage(RegisterMaterial("ui_mp_br_frontend_button_fui_ch2"), 0)
	var_76_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -268, _1080p * -138, _1080p * 70, _1080p * 222)
	var_76_0:addElement(var_76_22)

	var_76_0.WZOptionButtonFUI = var_76_22

	local var_76_23
	local var_76_24 = MenuBuilder.BuildRegisteredType("WZBladesFriendCount", {
		controllerIndex = var_76_1
	})

	var_76_24.id = "WZFriendCount"

	var_76_24:SetAlpha(0, 0)
	var_76_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -156, _1080p * 156, _1080p * -208, _1080p * -176)
	var_76_0:addElement(var_76_24)

	var_76_0.WZFriendCount = var_76_24

	local var_76_25
	local var_76_26 = LUI.UIImage.new()

	var_76_26.id = "Stripe"

	var_76_26:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_76_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -12, _1080p * 12, _1080p * 472, _1080p * 476)
	var_76_0:addElement(var_76_26)

	var_76_0.Stripe = var_76_26

	local var_76_27
	local var_76_28 = LUI.UIImage.new()

	var_76_28.id = "TitleLogo"

	var_76_28:SetScale(-0.2, 0)
	var_76_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 257, _1080p * 453)
	var_76_0:addElement(var_76_28)

	var_76_0.TitleLogo = var_76_28

	local var_76_29
	local var_76_30 = LUI.UIImage.new()

	var_76_30.id = "ButtonDescriptionBG"

	var_76_30:SetRGBFromInt(0, 0)
	var_76_30:SetAlpha(0.4, 0)
	var_76_30:SetPixelGridEnabled(true)
	var_76_30:SetPixelGridContrast(0.5, 0)
	var_76_30:SetPixelGridBlockWidth(2, 0)
	var_76_30:SetPixelGridBlockHeight(2, 0)
	var_76_30:SetPixelGridGutterWidth(1, 0)
	var_76_30:SetPixelGridGutterHeight(1, 0)
	var_76_30:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_76_30:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -43, _1080p * 18, _1080p * 174)
	var_76_0:addElement(var_76_30)

	var_76_0.ButtonDescriptionBG = var_76_30

	local var_76_31
	local var_76_32 = LUI.UIStyledText.new()

	var_76_32.id = "ButtonDescription"

	var_76_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_76_32:setText("", 0)
	var_76_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_76_32:SetAlignment(LUI.Alignment.Left)
	var_76_32:SetDecodeUpdatesPerLetter(4)
	var_76_32:SetDecodeUseSystemTime(false)
	var_76_32:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 45, _1080p * -95, _1080p * 26, _1080p * 44)
	var_76_0:addElement(var_76_32)

	var_76_0.ButtonDescription = var_76_32

	local var_76_33
	local var_76_34 = LUI.UIImage.new()

	var_76_34.id = "Mask"

	var_76_34:setImage(RegisterMaterial("stencil_mask"), 0)
	var_76_34:SetAnchorsAndPosition(0.5, 0.5, 0, 0, 0, 0, _1080p * -4, _1080p * 4)
	var_76_0:addElement(var_76_34)

	var_76_0.Mask = var_76_34

	local var_76_35

	if CONDITIONS.AlwaysFalse() then
		local var_76_36 = {
			borderThicknessLeft = _1080p * 2,
			borderThicknessRight = _1080p * 2,
			borderThicknessTop = _1080p * 2,
			borderThicknessBottom = _1080p * 2
		}
		local var_76_37 = LUI.UIBorder.new(var_76_36)

		var_76_37.id = "Border"

		var_76_37:SetRGBFromTable(SWATCHES.BRMapItemColor.mapItemColor_5, 0)
		var_76_37:SetBorderThicknessLeft(_1080p * 2, 0)
		var_76_37:SetBorderThicknessRight(_1080p * 2, 0)
		var_76_37:SetBorderThicknessTop(_1080p * 2, 0)
		var_76_37:SetBorderThicknessBottom(_1080p * 2, 0)
		var_76_0:addElement(var_76_37)

		var_76_0.Border = var_76_37
	end

	local var_76_38

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		var_76_38 = LUI.UIStyledText.new()
		var_76_38.id = "ButtonDescriptionIGR"

		var_76_38:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
		var_76_38:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BONUS_TIP"), 0)
		var_76_38:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_76_38:SetAlignment(LUI.Alignment.Left)
		var_76_38:SetDecodeUpdatesPerLetter(4)
		var_76_38:SetDecodeUseSystemTime(false)
		var_76_38:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 108, _1080p * 425, _1080p * 95, _1080p * 119)
		var_76_0:addElement(var_76_38)

		var_76_0.ButtonDescriptionIGR = var_76_38
	end

	local var_76_39

	if CONDITIONS.IsNewGameAvailableNowMessageActive() then
		var_76_39 = LUI.UIStyledText.new()
		var_76_39.id = "NewGameNowAvailableMessage"

		var_76_39:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		var_76_39:SetAlpha(0, 0)
		var_76_39:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CORTEZ_AVAILABLE_NOW"), 0)
		var_76_39:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_76_39:SetAlignment(LUI.Alignment.Center)
		var_76_39:SetDecodeUpdatesPerLetter(4)
		var_76_39:SetDecodeUseSystemTime(false)
		var_76_39:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -220, _1080p * 220, _1080p * 694, _1080p * 730)
		var_76_0:addElement(var_76_39)

		var_76_0.NewGameNowAvailableMessage = var_76_39
	end

	local var_76_40

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		var_76_40 = LUI.UIImage.new()
		var_76_40.id = "IGRBoostIcon"

		var_76_40:setImage(RegisterMaterial("icon_xp"), 0)
		var_76_40:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 41, _1080p * 99, _1080p * 96, _1080p * 154)
		var_76_0:addElement(var_76_40)

		var_76_0.IGRBoostIcon = var_76_40
	end

	local var_76_41
	local var_76_42 = MenuBuilder.BuildRegisteredType("MainMenuBladeUpsellOverlay", {
		controllerIndex = var_76_1
	})

	var_76_42.id = "UpsellOverlay"

	var_76_42:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_76_0:addElement(var_76_42)

	var_76_0.UpsellOverlay = var_76_42

	local var_76_43
	local var_76_44 = MenuBuilder.BuildRegisteredType("MainMenuBladeStoreOverlay", {
		controllerIndex = var_76_1
	})

	var_76_44.id = "StoreOverlay"

	var_76_44:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_76_0:addElement(var_76_44)

	var_76_0.StoreOverlay = var_76_44

	local var_76_45
	local var_76_46 = MenuBuilder.BuildRegisteredType("MainMenuBladeNGOverlay", {
		controllerIndex = var_76_1
	})

	var_76_46.id = "NGOverlay"

	var_76_46.ButtonDescription:setText(Engine.CBBHFCGDIC("LUA_MENU/NG_DESC"), 0)
	var_76_46:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_76_0:addElement(var_76_46)

	var_76_0.NGOverlay = var_76_46

	local var_76_47
	local var_76_48 = MenuBuilder.BuildRegisteredType("MainMenuBladeDisableOverlay", {
		controllerIndex = var_76_1
	})

	var_76_48.id = "DisableOverlay"

	var_76_48:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -252, _1080p * 252, 0, 0)
	var_76_0:addElement(var_76_48)

	var_76_0.DisableOverlay = var_76_48

	local var_76_49
	local var_76_50 = MenuBuilder.BuildRegisteredType("MainMenuButton", {
		controllerIndex = var_76_1
	})

	var_76_50.id = "Trigger"

	var_76_50:SetAlpha(0, 0)
	var_76_50.Text:setText("", 0)
	var_76_50:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_76_0:addElement(var_76_50)

	var_76_0.Trigger = var_76_50

	local var_76_51
	local var_76_52 = MenuBuilder.BuildRegisteredType("WZBladeButton", {
		controllerIndex = var_76_1
	})

	var_76_52.id = "WZOptionButton"

	var_76_52:SetAlpha(0, 0)
	var_76_52.Text:SetLeft(_1080p * 20, 0)
	var_76_52.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE_ACTION")), 0)
	var_76_52.Text:SetAlignment(LUI.Alignment.Center)
	var_76_52:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 85, _1080p * 129)
	var_76_0:addElement(var_76_52)

	var_76_0.WZOptionButton = var_76_52

	local var_76_53
	local var_76_54 = LUI.UIText.new()

	var_76_54.id = "BLMTitle"

	var_76_54:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_76_54:SetAlpha(0, 0)
	var_76_54:setText("", 0)
	var_76_54:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_54:SetAlignment(LUI.Alignment.Center)
	var_76_54:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 116, _1080p * 186)
	var_76_0:addElement(var_76_54)

	var_76_0.BLMTitle = var_76_54

	local var_76_55
	local var_76_56 = LUI.UIText.new()

	var_76_56.id = "BLMDesc"

	var_76_56:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_76_56:SetAlpha(0, 0)
	var_76_56:setText("", 0)
	var_76_56:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_56:SetAlignment(LUI.Alignment.Center)
	var_76_56:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 194, _1080p * 224)
	var_76_0:addElement(var_76_56)

	var_76_0.BLMDesc = var_76_56

	local var_76_57
	local var_76_58 = MenuBuilder.BuildRegisteredType("MainMenuBladeList", {
		controllerIndex = var_76_1
	})

	var_76_58.id = "InlineList"

	var_76_58:SetAlpha(0, 0)
	var_76_58:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -233, _1080p * 233, _1080p * 54, _1080p * 244)
	var_76_0:addElement(var_76_58)

	var_76_0.InlineList = var_76_58

	local var_76_59
	local var_76_60 = MenuBuilder.BuildRegisteredType("WZBladesNewNotif", {
		controllerIndex = var_76_1
	})

	var_76_60.id = "WZBladesNewNotif"

	var_76_60:SetScale(-0.25, 0)
	var_76_60.WZWipButtonOver:SetAlpha(0, 0)
	var_76_60.Text:SetLeft(_1080p * 20, 0)
	var_76_60.Text:SetAlpha(0, 0)
	var_76_60.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW_CAPS")), 0)
	var_76_60.Text:SetAlignment(LUI.Alignment.Center)
	var_76_60:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -205, _1080p * -77, _1080p * 225, _1080p * 257)
	var_76_0:addElement(var_76_60)

	var_76_0.WZBladesNewNotif = var_76_60

	local var_76_61
	local var_76_62 = MenuBuilder.BuildRegisteredType("InstallStatus", {
		controllerIndex = var_76_1
	})

	var_76_62.id = "InstallStatus"

	var_76_62:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -350, _1080p * 350, _1080p * 478, _1080p * 603)
	var_76_0:addElement(var_76_62)

	var_76_0.InstallStatus = var_76_62

	local var_76_63
	local var_76_64 = LUI.UIStyledText.new()

	var_76_64.id = "BlockedLabel"

	var_76_64:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_76_64:SetAlpha(0, 0)
	var_76_64:setText("", 0)
	var_76_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_76_64:SetWordWrap(false)
	var_76_64:SetAlignment(LUI.Alignment.Left)
	var_76_64:SetVerticalAlignment(LUI.Alignment.Center)
	var_76_64:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_76_64:SetUseEllipses(ELLIPSES.enabled)
	var_76_64:SetStartupDelay(1000)
	var_76_64:SetLineHoldTime(400)
	var_76_64:SetAnimMoveTime(150)
	var_76_64:SetAnimMoveSpeed(50)
	var_76_64:SetEndDelay(1000)
	var_76_64:SetCrossfadeTime(400)
	var_76_64:SetFadeInTime(300)
	var_76_64:SetFadeOutTime(300)
	var_76_64:SetMaxVisibleLines(1)
	var_76_64:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 156, _1080p * 837, _1080p * 855)
	var_76_0:addElement(var_76_64)

	var_76_0.BlockedLabel = var_76_64

	local var_76_65

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_76_65 = LUI.UIImage.new()
		var_76_65.id = "WZWipColdWarFUI"

		var_76_65:SetAlpha(0, 0)
		var_76_65:setImage(RegisterMaterial("ui_mp_br_blade_logo_FUI"), 0)
		var_76_65:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -72, _1080p * 204, _1080p * 181, _1080p * 225)
		var_76_0:addElement(var_76_65)

		var_76_0.WZWipColdWarFUI = var_76_65
	end

	local var_76_66
	local var_76_67 = LUI.UIStyledText.new()

	var_76_67.id = "WZWipNGSeasonCount"

	var_76_67:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_76_67:SetAlpha(0, 0)
	var_76_67:setText("", 0)
	var_76_67:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_67:SetTracking(8 * _1080p, 0)
	var_76_67:SetAlignment(LUI.Alignment.Center)
	var_76_67:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 446, _1080p * 464)
	var_76_0:addElement(var_76_67)

	var_76_0.WZWipNGSeasonCount = var_76_67

	local var_76_68

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_76_68 = LUI.UIImage.new()
		var_76_68.id = "Lock"

		var_76_68:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_76_68:SetAlpha(0, 0)
		var_76_68:SetScale(-0.25, 0)
		var_76_68:setImage(RegisterMaterial("icon_lock"), 0)
		var_76_68:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -18, _1080p * 32, _1080p * 455, _1080p * 505)
		var_76_0:addElement(var_76_68)

		var_76_0.Lock = var_76_68
	end

	local var_76_69
	local var_76_70 = LUI.UIStyledText.new()

	var_76_70.id = "WZWipPurchaseMsgBladeUp"

	var_76_70:SetRGBFromInt(15855855, 0)
	var_76_70:setText("", 0)
	var_76_70:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_76_70:SetWordWrap(false)
	var_76_70:SetAlignment(LUI.Alignment.Center)
	var_76_70:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 90, _1080p * 126)
	var_76_0:addElement(var_76_70)

	var_76_0.WZWipPurchaseMsgBladeUp = var_76_70

	local var_76_71

	if CONDITIONS.IsVanguardRevealEventActive() then
		var_76_71 = MenuBuilder.BuildRegisteredType("VanguardRevealLiveEvent", {
			controllerIndex = var_76_1
		})
		var_76_71.id = "VanguardRevealLiveEvent"

		var_76_71:SetAlpha(0, 0)
		var_76_71.Background:SetRGBFromInt(16777215, 0)
		var_76_71.TitleGlow:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/VG_REVEAL_BOV"), 0)
		var_76_71.Title:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/VG_REVEAL_BOV"), 0)
		var_76_71:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -370, _1080p * 370, _1080p * 529, _1080p * 593)
		var_76_0:addElement(var_76_71)

		var_76_0.VanguardRevealLiveEvent = var_76_71
	end

	local var_76_72
	local var_76_73 = LUI.UIStyledText.new()

	var_76_73.id = "AlphaBetaCountdown"

	var_76_73:SetRGBFromInt(15279599, 0)
	var_76_73:SetAlpha(0, 0)
	var_76_73:setText("", 0)
	var_76_73:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_73:SetAlignment(LUI.Alignment.Center)
	var_76_73:SetVerticalAlignment(LUI.Alignment.Center)
	var_76_73:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 512, _1080p * 534)
	var_76_0:addElement(var_76_73)

	var_76_0.AlphaBetaCountdown = var_76_73

	local var_76_74

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_75 = LUI.UIImage.new()

		var_76_75.id = "SepRight"

		var_76_75:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_76_75:SetAlpha(0.2, 0)
		var_76_75:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 1, _1080p * 2, _1080p * -285, _1080p * 15)
		var_76_0:addElement(var_76_75)

		var_76_0.SepRight = var_76_75
	end

	local var_76_76
	local var_76_77 = LUI.UIStyledText.new()

	var_76_77.id = "LiveTag"

	var_76_77:SetRGBFromInt(16711680, 0)
	var_76_77:SetAlpha(0, 0)
	var_76_77:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CANTEEN/LIVE_TAG_ALPHA_BETA")), 0)
	var_76_77:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_77:SetWordWrap(false)
	var_76_77:SetAlignment(LUI.Alignment.Center)
	var_76_77:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -10, _1080p * 26)
	var_76_0:addElement(var_76_77)

	var_76_0.LiveTag = var_76_77

	local var_76_78
	local var_76_79 = LUI.UIImage.new()

	var_76_79.id = "newiconpulse"

	var_76_79:SetAlpha(0, 0)
	var_76_79:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
	var_76_79:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -135, _1080p * -105, _1080p * 285, _1080p * 315)
	var_76_0:addElement(var_76_79)

	var_76_0.newiconpulse = var_76_79

	local var_76_80

	if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		var_76_80 = MenuBuilder.BuildRegisteredType("PreOrderBanner", {
			controllerIndex = var_76_1
		})
		var_76_80.id = "UpgradeLabel"

		var_76_80:SetAlpha(0, 0)
		var_76_80.UpgradeLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_ULTIMATE"), 0)
		var_76_80:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -203, _1080p * 210, _1080p * -337, _1080p * -307)
		var_76_0:addElement(var_76_80)

		var_76_0.UpgradeLabel = var_76_80
	end

	local var_76_81

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		var_76_81 = MenuBuilder.BuildRegisteredType("PreOrderBanner", {
			controllerIndex = var_76_1
		})
		var_76_81.id = "PreOrderLabel"

		var_76_81:SetAlpha(0, 0)
		var_76_81.Background:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		var_76_81.UpgradeLabel:setText(ToUpperCase(Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER")), 0)
		var_76_81:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -203, _1080p * 210, _1080p * -387, _1080p * -357)
		var_76_0:addElement(var_76_81)

		var_76_0.PreOrderLabel = var_76_81
	end

	local var_76_82
	local var_76_83 = LUI.UIImage.new()

	var_76_83.id = "MultiplayerBetaLabelBackground"

	var_76_83:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
	var_76_83:SetAlpha(0, 0)
	var_76_83:SetPixelGridEnabled(true)
	var_76_83:SetPixelGridContrast(0.5, 0)
	var_76_83:SetPixelGridBlockWidth(2, 0)
	var_76_83:SetPixelGridBlockHeight(2, 0)
	var_76_83:SetPixelGridGutterWidth(1, 0)
	var_76_83:SetPixelGridGutterHeight(1, 0)
	var_76_83:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -190, _1080p * 189, _1080p * 525, _1080p * 567)
	var_76_0:addElement(var_76_83)

	var_76_0.MultiplayerBetaLabelBackground = var_76_83

	local var_76_84
	local var_76_85 = LUI.UIText.new()

	var_76_85.id = "MultiplayerBetaLabel"

	var_76_85:SetRGBFromInt(12829635, 0)
	var_76_85:SetAlpha(0, 0)
	var_76_85:setText("", 0)
	var_76_85:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_76_85:SetAlignment(LUI.Alignment.Center)
	var_76_85:SetVerticalAlignment(LUI.Alignment.Center)
	var_76_85:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -203, _1080p * 198, _1080p * 528, _1080p * 564)
	var_76_0:addElement(var_76_85)

	var_76_0.MultiplayerBetaLabel = var_76_85

	local function var_76_86()
		return
	end

	var_76_0._sequences.DefaultSequence = var_76_86

	local var_76_87
	local var_76_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_8:RegisterAnimationSequence("ButtonUp", var_76_88)

	local var_76_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_12:RegisterAnimationSequence("ButtonUp", var_76_89)

	local var_76_90 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("ButtonUp", var_76_90)

	local var_76_91 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 453
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 257
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = -0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("ButtonUp", var_76_91)

	local var_76_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_44:RegisterAnimationSequence("ButtonUp", var_76_92)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_93 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 206
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 250
			}
		}

		var_76_65:RegisterAnimationSequence("ButtonUp", var_76_93)
	end

	local function var_76_94()
		var_76_8:AnimateSequence("ButtonUp")
		var_76_12:AnimateSequence("ButtonUp")
		var_76_26:AnimateSequence("ButtonUp")
		var_76_28:AnimateSequence("ButtonUp")
		var_76_44:AnimateSequence("ButtonUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("ButtonUp")
		end
	end

	var_76_0._sequences.ButtonUp = var_76_94

	local var_76_95
	local var_76_96 = {
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

	var_76_20:RegisterAnimationSequence("JP", var_76_96)

	local var_76_97 = {
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

	var_76_32:RegisterAnimationSequence("JP", var_76_97)

	local function var_76_98()
		var_76_20:AnimateSequence("JP")
		var_76_32:AnimateSequence("JP")
	end

	var_76_0._sequences.JP = var_76_98

	local var_76_99
	local var_76_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 434
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 479
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_67:RegisterAnimationSequence("AR", var_76_100)

	local function var_76_101()
		var_76_67:AnimateSequence("AR")
	end

	var_76_0._sequences.AR = var_76_101

	local var_76_102
	local var_76_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonTextBG
		}
	}

	var_76_18:RegisterAnimationSequence("Installed", var_76_103)

	local var_76_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		}
	}

	var_76_20:RegisterAnimationSequence("Installed", var_76_104)

	local function var_76_105()
		var_76_18:AnimateSequence("Installed")
		var_76_20:AnimateSequence("Installed")
	end

	var_76_0._sequences.Installed = var_76_105

	local var_76_106
	local var_76_107 = {
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

	var_76_32:RegisterAnimationSequence("CHSF", var_76_107)

	local function var_76_108()
		var_76_32:AnimateSequence("CHSF")
	end

	var_76_0._sequences.CHSF = var_76_108

	local var_76_109
	local var_76_110 = {
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

	var_76_20:RegisterAnimationSequence("ESandPT", var_76_110)

	local function var_76_111()
		var_76_20:AnimateSequence("ESandPT")
	end

	var_76_0._sequences.ESandPT = var_76_111

	local var_76_112
	local var_76_113 = {
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

	var_76_32:RegisterAnimationSequence("CHTR", var_76_113)

	local function var_76_114()
		var_76_32:AnimateSequence("CHTR")
	end

	var_76_0._sequences.CHTR = var_76_114

	local var_76_115
	local var_76_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_4:RegisterAnimationSequence("Accordion", var_76_116)

	local var_76_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_6:RegisterAnimationSequence("Accordion", var_76_117)

	local var_76_118 = {
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

	var_76_12:RegisterAnimationSequence("Accordion", var_76_118)

	local var_76_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("Accordion", var_76_119)

	local var_76_120 = {
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

	var_76_18:RegisterAnimationSequence("Accordion", var_76_120)

	local var_76_121 = {
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

	var_76_20:RegisterAnimationSequence("Accordion", var_76_121)

	local var_76_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("Accordion", var_76_122)

	local var_76_123 = {
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

	var_76_30:RegisterAnimationSequence("Accordion", var_76_123)

	local var_76_124 = {
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

	var_76_32:RegisterAnimationSequence("Accordion", var_76_124)

	local var_76_125 = {
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

	var_76_34:RegisterAnimationSequence("Accordion", var_76_125)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_126 = {
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

		var_76_38:RegisterAnimationSequence("Accordion", var_76_126)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_127 = {
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

		var_76_40:RegisterAnimationSequence("Accordion", var_76_127)
	end

	local var_76_128 = {
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

	var_76_48:RegisterAnimationSequence("Accordion", var_76_128)

	local function var_76_129()
		var_76_4:AnimateSequence("Accordion")
		var_76_6:AnimateSequence("Accordion")
		var_76_12:AnimateSequence("Accordion")
		var_76_16:AnimateSequence("Accordion")
		var_76_18:AnimateSequence("Accordion")
		var_76_20:AnimateSequence("Accordion")
		var_76_28:AnimateSequence("Accordion")
		var_76_30:AnimateSequence("Accordion")
		var_76_32:AnimateSequence("Accordion")
		var_76_34:AnimateSequence("Accordion")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_38:AnimateSequence("Accordion")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_40:AnimateSequence("Accordion")
		end

		var_76_48:AnimateSequence("Accordion")
	end

	var_76_0._sequences.Accordion = var_76_129

	local var_76_130
	local var_76_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_6:RegisterAnimationSequence("Shutter", var_76_131)

	local var_76_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_10:RegisterAnimationSequence("Shutter", var_76_132)

	local var_76_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("Shutter", var_76_133)

	local var_76_134 = {
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

	var_76_20:RegisterAnimationSequence("Shutter", var_76_134)

	local var_76_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("Shutter", var_76_135)

	local function var_76_136()
		var_76_6:AnimateSequence("Shutter")
		var_76_10:AnimateSequence("Shutter")
		var_76_16:AnimateSequence("Shutter")
		var_76_20:AnimateSequence("Shutter")
		var_76_28:AnimateSequence("Shutter")
	end

	var_76_0._sequences.Shutter = var_76_136

	local var_76_137
	local var_76_138 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_14:RegisterAnimationSequence("BLM", var_76_138)

	local var_76_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_18:RegisterAnimationSequence("BLM", var_76_139)

	local var_76_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_76_20:RegisterAnimationSequence("BLM", var_76_140)

	local var_76_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_30:RegisterAnimationSequence("BLM", var_76_141)

	local var_76_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_76_32:RegisterAnimationSequence("BLM", var_76_142)

	local function var_76_143()
		var_76_14:AnimateSequence("BLM")
		var_76_18:AnimateSequence("BLM")
		var_76_20:AnimateSequence("BLM")
		var_76_30:AnimateSequence("BLM")
		var_76_32:AnimateSequence("BLM")
	end

	var_76_0._sequences.BLM = var_76_143

	local var_76_144
	local var_76_145 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_14:RegisterAnimationSequence("ShowBLMMagma", var_76_145)

	local var_76_146 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_54:RegisterAnimationSequence("ShowBLMMagma", var_76_146)

	local var_76_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_56:RegisterAnimationSequence("ShowBLMMagma", var_76_147)

	local function var_76_148()
		var_76_14:AnimateSequence("ShowBLMMagma")
		var_76_54:AnimateSequence("ShowBLMMagma")
		var_76_56:AnimateSequence("ShowBLMMagma")
	end

	var_76_0._sequences.ShowBLMMagma = var_76_148

	local var_76_149
	local var_76_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_14:RegisterAnimationSequence("HideBLMMagma", var_76_150)

	local var_76_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_54:RegisterAnimationSequence("HideBLMMagma", var_76_151)

	local var_76_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_56:RegisterAnimationSequence("HideBLMMagma", var_76_152)

	local function var_76_153()
		var_76_14:AnimateSequence("HideBLMMagma")
		var_76_54:AnimateSequence("HideBLMMagma")
		var_76_56:AnimateSequence("HideBLMMagma")
	end

	var_76_0._sequences.HideBLMMagma = var_76_153

	local var_76_154

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_155 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 374
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 398
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 146
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 463
			}
		}

		var_76_38:RegisterAnimationSequence("IGRAlt", var_76_155)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_156 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 375
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 433
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 79
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 137
			}
		}

		var_76_40:RegisterAnimationSequence("IGRAlt", var_76_156)
	end

	local function var_76_157()
		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_38:AnimateSequence("IGRAlt")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_40:AnimateSequence("IGRAlt")
		end
	end

	var_76_0._sequences.IGRAlt = var_76_157

	local var_76_158
	local var_76_159 = {
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

	var_76_8:RegisterAnimationSequence("ButtonOver", var_76_159)

	local var_76_160 = {
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

	var_76_12:RegisterAnimationSequence("ButtonOver", var_76_160)

	local var_76_161 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_18:RegisterAnimationSequence("ButtonOver", var_76_161)

	local var_76_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_20:RegisterAnimationSequence("ButtonOver", var_76_162)

	local var_76_163 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 414
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("ButtonOver", var_76_163)

	local var_76_164 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 323
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_30:RegisterAnimationSequence("ButtonOver", var_76_164)

	local var_76_165 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 48
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_32:RegisterAnimationSequence("ButtonOver", var_76_165)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_166 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 137
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			}
		}

		var_76_65:RegisterAnimationSequence("ButtonOver", var_76_166)
	end

	local function var_76_167()
		var_76_8:AnimateSequence("ButtonOver")
		var_76_12:AnimateSequence("ButtonOver")
		var_76_18:AnimateSequence("ButtonOver")
		var_76_20:AnimateSequence("ButtonOver")
		var_76_28:AnimateSequence("ButtonOver")
		var_76_30:AnimateSequence("ButtonOver")
		var_76_32:AnimateSequence("ButtonOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("ButtonOver")
		end
	end

	var_76_0._sequences.ButtonOver = var_76_167

	local var_76_168
	local var_76_169 = {
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

	var_76_8:RegisterAnimationSequence("ButtonOverEnglish", var_76_169)

	local var_76_170 = {
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

	var_76_12:RegisterAnimationSequence("ButtonOverEnglish", var_76_170)

	local var_76_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_18:RegisterAnimationSequence("ButtonOverEnglish", var_76_171)

	local var_76_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_20:RegisterAnimationSequence("ButtonOverEnglish", var_76_172)

	local var_76_173 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("ButtonOverEnglish", var_76_173)

	local var_76_174 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 414
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("ButtonOverEnglish", var_76_174)

	local var_76_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_30:RegisterAnimationSequence("ButtonOverEnglish", var_76_175)

	local var_76_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_32:RegisterAnimationSequence("ButtonOverEnglish", var_76_176)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_177 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 137
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			}
		}

		var_76_65:RegisterAnimationSequence("ButtonOverEnglish", var_76_177)
	end

	local function var_76_178()
		var_76_8:AnimateSequence("ButtonOverEnglish")
		var_76_12:AnimateSequence("ButtonOverEnglish")
		var_76_18:AnimateSequence("ButtonOverEnglish")
		var_76_20:AnimateSequence("ButtonOverEnglish")
		var_76_26:AnimateSequence("ButtonOverEnglish")
		var_76_28:AnimateSequence("ButtonOverEnglish")
		var_76_30:AnimateSequence("ButtonOverEnglish")
		var_76_32:AnimateSequence("ButtonOverEnglish")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("ButtonOverEnglish")
		end
	end

	var_76_0._sequences.ButtonOverEnglish = var_76_178

	local var_76_179
	local var_76_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_4:RegisterAnimationSequence("AccordionRefresh", var_76_180)

	local var_76_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_6:RegisterAnimationSequence("AccordionRefresh", var_76_181)

	local var_76_182 = {
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

	var_76_12:RegisterAnimationSequence("AccordionRefresh", var_76_182)

	local var_76_183 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("AccordionRefresh", var_76_183)

	local var_76_184 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_18:RegisterAnimationSequence("AccordionRefresh", var_76_184)

	local var_76_185 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_20:RegisterAnimationSequence("AccordionRefresh", var_76_185)

	local var_76_186 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_24:RegisterAnimationSequence("AccordionRefresh", var_76_186)

	local var_76_187 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("AccordionRefresh", var_76_187)

	local var_76_188 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("AccordionRefresh", var_76_188)

	local var_76_189 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_30:RegisterAnimationSequence("AccordionRefresh", var_76_189)

	local var_76_190 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_32:RegisterAnimationSequence("AccordionRefresh", var_76_190)

	local var_76_191 = {
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

	var_76_34:RegisterAnimationSequence("AccordionRefresh", var_76_191)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_192 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -146
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 206
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 170
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 230
			}
		}

		var_76_38:RegisterAnimationSequence("AccordionRefresh", var_76_192)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_193 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 203
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 257
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -209
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -151
			}
		}

		var_76_40:RegisterAnimationSequence("AccordionRefresh", var_76_193)
	end

	local var_76_194 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		}
	}

	var_76_42:RegisterAnimationSequence("AccordionRefresh", var_76_194)

	local var_76_195 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		}
	}

	var_76_44:RegisterAnimationSequence("AccordionRefresh", var_76_195)

	local var_76_196 = {
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

	var_76_48:RegisterAnimationSequence("AccordionRefresh", var_76_196)

	local var_76_197 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("AccordionRefresh", var_76_197)

	local function var_76_198()
		var_76_4:AnimateSequence("AccordionRefresh")
		var_76_6:AnimateSequence("AccordionRefresh")
		var_76_12:AnimateSequence("AccordionRefresh")
		var_76_16:AnimateSequence("AccordionRefresh")
		var_76_18:AnimateSequence("AccordionRefresh")
		var_76_20:AnimateSequence("AccordionRefresh")
		var_76_24:AnimateSequence("AccordionRefresh")
		var_76_26:AnimateSequence("AccordionRefresh")
		var_76_28:AnimateSequence("AccordionRefresh")
		var_76_30:AnimateSequence("AccordionRefresh")
		var_76_32:AnimateSequence("AccordionRefresh")
		var_76_34:AnimateSequence("AccordionRefresh")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_38:AnimateSequence("AccordionRefresh")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_40:AnimateSequence("AccordionRefresh")
		end

		var_76_42:AnimateSequence("AccordionRefresh")
		var_76_44:AnimateSequence("AccordionRefresh")
		var_76_48:AnimateSequence("AccordionRefresh")
		var_76_52:AnimateSequence("AccordionRefresh")
	end

	var_76_0._sequences.AccordionRefresh = var_76_198

	local var_76_199
	local var_76_200 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("ARBladeOver", var_76_200)

	local var_76_201 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_22:RegisterAnimationSequence("ARBladeOver", var_76_201)

	local var_76_202 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 438
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 434
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 192
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("ARBladeOver", var_76_202)

	local var_76_203 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("ARBladeOver", var_76_203)

	local var_76_204 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("ARBladeOver", var_76_204)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_205 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 137
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -84
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 192
			}
		}

		var_76_65:RegisterAnimationSequence("ARBladeOver", var_76_205)
	end

	local function var_76_206()
		var_76_16:AnimateSequence("ARBladeOver")
		var_76_22:AnimateSequence("ARBladeOver")
		var_76_26:AnimateSequence("ARBladeOver")
		var_76_28:AnimateSequence("ARBladeOver")
		var_76_52:AnimateSequence("ARBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("ARBladeOver")
		end
	end

	var_76_0._sequences.ARBladeOver = var_76_206

	local var_76_207
	local var_76_208 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("ARBladeUp", var_76_208)

	local var_76_209 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_22:RegisterAnimationSequence("ARBladeUp", var_76_209)

	local var_76_210 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_24:RegisterAnimationSequence("ARBladeUp", var_76_210)

	local var_76_211 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 476
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 472
		}
	}

	var_76_26:RegisterAnimationSequence("ARBladeUp", var_76_211)

	local var_76_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 453
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 257
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("ARBladeUp", var_76_212)

	local var_76_213 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("ARBladeUp", var_76_213)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_214 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 206
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 250
			}
		}

		var_76_65:RegisterAnimationSequence("ARBladeUp", var_76_214)
	end

	local function var_76_215()
		var_76_16:AnimateSequence("ARBladeUp")
		var_76_22:AnimateSequence("ARBladeUp")
		var_76_24:AnimateSequence("ARBladeUp")
		var_76_26:AnimateSequence("ARBladeUp")
		var_76_28:AnimateSequence("ARBladeUp")
		var_76_52:AnimateSequence("ARBladeUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("ARBladeUp")
		end
	end

	var_76_0._sequences.ARBladeUp = var_76_215

	local var_76_216
	local var_76_217 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("NewARBladeUp", var_76_217)

	local var_76_218 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 283
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 315
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_76_0.WZBladesNewNotif.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_76_0.WZBladesNewNotif.WZWipButtonOver
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			child = var_76_0.WZBladesNewNotif.Text
		}
	}

	var_76_60:RegisterAnimationSequence("NewARBladeUp", var_76_218)

	local var_76_219 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -135
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 285
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 315
		}
	}

	var_76_79:RegisterAnimationSequence("NewARBladeUp", var_76_219)

	local function var_76_220()
		var_76_26:AnimateSequence("NewARBladeUp")
		var_76_60:AnimateSequence("NewARBladeUp")
		var_76_79:AnimateSequence("NewARBladeUp")
	end

	var_76_0._sequences.NewARBladeUp = var_76_220

	local var_76_221
	local var_76_222 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 203
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 235
		},
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_76_0.WZBladesNewNotif.WZWipButtonOver
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_76_0.WZBladesNewNotif.Text
		}
	}

	var_76_60:RegisterAnimationSequence("NewARBladeOver", var_76_222)

	local var_76_223 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -238
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 206
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 236
		}
	}

	var_76_79:RegisterAnimationSequence("NewARBladeOver", var_76_223)

	local function var_76_224()
		var_76_60:AnimateSequence("NewARBladeOver")
		var_76_79:AnimateSequence("NewARBladeOver")
	end

	var_76_0._sequences.NewARBladeOver = var_76_224

	local var_76_225
	local var_76_226 = {
		{
			value = 15327545,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_76_52:RegisterAnimationSequence("UpsellARBladeOver", var_76_226)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_227 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_68:RegisterAnimationSequence("UpsellARBladeOver", var_76_227)
	end

	local function var_76_228()
		var_76_52:AnimateSequence("UpsellARBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_68:AnimateSequence("UpsellARBladeOver")
		end
	end

	var_76_0._sequences.UpsellARBladeOver = var_76_228

	local function var_76_229()
		return
	end

	var_76_0._sequences.UpsellARBladeUp = var_76_229

	local var_76_230
	local var_76_231 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_76_231)

	local var_76_232 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 438
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 434
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 192
		}
	}

	var_76_26:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_76_232)

	local var_76_233 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_76_233)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_234 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 137
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			}
		}

		var_76_65:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_76_234)
	end

	local var_76_235 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 454
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 472
		}
	}

	var_76_67:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_76_235)

	local function var_76_236()
		var_76_16:AnimateSequence("ARBladeOverNoWZOptionButton")
		var_76_26:AnimateSequence("ARBladeOverNoWZOptionButton")
		var_76_28:AnimateSequence("ARBladeOverNoWZOptionButton")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("ARBladeOverNoWZOptionButton")
		end

		var_76_67:AnimateSequence("ARBladeOverNoWZOptionButton")
	end

	var_76_0._sequences.ARBladeOverNoWZOptionButton = var_76_236

	local var_76_237
	local var_76_238 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_4:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_238)

	local var_76_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_6:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_239)

	local var_76_240 = {
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

	var_76_12:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_240)

	local var_76_241 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_241)

	local var_76_242 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_18:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_242)

	local var_76_243 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_20:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_243)

	local var_76_244 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_24:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_244)

	local var_76_245 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_245)

	local var_76_246 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_246)

	local var_76_247 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_30:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_247)

	local var_76_248 = {
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
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_32:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_248)

	local var_76_249 = {
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

	var_76_34:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_249)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_250 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -146
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 206
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 170
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 230
			}
		}

		var_76_38:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_250)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_251 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 203
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 257
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -209
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -151
			}
		}

		var_76_40:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_251)
	end

	local var_76_252 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		}
	}

	var_76_42:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_252)

	local var_76_253 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		}
	}

	var_76_44:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_253)

	local var_76_254 = {
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

	var_76_48:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_76_254)

	local function var_76_255()
		var_76_4:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_6:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_12:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_16:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_18:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_20:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_24:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_26:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_28:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_30:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_32:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_34:AnimateSequence("AccordionRefreshNoWZOptionButton")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_38:AnimateSequence("AccordionRefreshNoWZOptionButton")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_40:AnimateSequence("AccordionRefreshNoWZOptionButton")
		end

		var_76_42:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_44:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_76_48:AnimateSequence("AccordionRefreshNoWZOptionButton")
	end

	var_76_0._sequences.AccordionRefreshNoWZOptionButton = var_76_255

	local function var_76_256()
		return
	end

	var_76_0._sequences.SetThemeColdWar = var_76_256

	local var_76_257
	local var_76_258 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_76_26:RegisterAnimationSequence("SetThemeMW", var_76_258)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_259 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_65:RegisterAnimationSequence("SetThemeMW", var_76_259)
	end

	local var_76_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_67:RegisterAnimationSequence("SetThemeMW", var_76_260)

	local function var_76_261()
		var_76_26:AnimateSequence("SetThemeMW")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("SetThemeMW")
		end

		var_76_67:AnimateSequence("SetThemeMW")
	end

	var_76_0._sequences.SetThemeMW = var_76_261

	local var_76_262
	local var_76_263 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -155
		}
	}

	var_76_16:RegisterAnimationSequence("WZWipSetup", var_76_263)

	local var_76_264 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_76_20:RegisterAnimationSequence("WZWipSetup", var_76_264)

	local var_76_265 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -236
		}
	}

	var_76_24:RegisterAnimationSequence("WZWipSetup", var_76_265)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_76_266 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			}
		}

		var_76_38:RegisterAnimationSequence("WZWipSetup", var_76_266)
	end

	local var_76_267 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("WZWipSetup", var_76_267)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_268 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 206
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 250
			}
		}

		var_76_65:RegisterAnimationSequence("WZWipSetup", var_76_268)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_269 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_68:RegisterAnimationSequence("WZWipSetup", var_76_269)
	end

	local var_76_270 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_70:RegisterAnimationSequence("WZWipSetup", var_76_270)

	local function var_76_271()
		var_76_16:AnimateSequence("WZWipSetup")
		var_76_20:AnimateSequence("WZWipSetup")
		var_76_24:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_76_38:AnimateSequence("WZWipSetup")
		end

		var_76_52:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_68:AnimateSequence("WZWipSetup")
		end

		var_76_70:AnimateSequence("WZWipSetup")
	end

	var_76_0._sequences.WZWipSetup = var_76_271

	local var_76_272
	local var_76_273 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -133
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		}
	}

	var_76_22:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_76_273)

	local var_76_274 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_76_274)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_275 = {
			{
				value = 0.4,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_68:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_76_275)
	end

	local var_76_276 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_70:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_76_276)

	local function var_76_277()
		var_76_22:AnimateSequence("WZWipUpsellARBladeUp")
		var_76_26:AnimateSequence("WZWipUpsellARBladeUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_68:AnimateSequence("WZWipUpsellARBladeUp")
		end

		var_76_70:AnimateSequence("WZWipUpsellARBladeUp")
	end

	var_76_0._sequences.WZWipUpsellARBladeUp = var_76_277

	local var_76_278
	local var_76_279 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -268
		}
	}

	var_76_22:RegisterAnimationSequence("WZWipUpsellARBladeOver", var_76_279)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_280 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_68:RegisterAnimationSequence("WZWipUpsellARBladeOver", var_76_280)
	end

	local var_76_281 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_70:RegisterAnimationSequence("WZWipUpsellARBladeOver", var_76_281)

	local function var_76_282()
		var_76_22:AnimateSequence("WZWipUpsellARBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_68:AnimateSequence("WZWipUpsellARBladeOver")
		end

		var_76_70:AnimateSequence("WZWipUpsellARBladeOver")
	end

	var_76_0._sequences.WZWipUpsellARBladeOver = var_76_282

	local var_76_283
	local var_76_284 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 449
		}
	}

	var_76_28:RegisterAnimationSequence("SetThemeVanguard", var_76_284)

	local function var_76_285()
		var_76_28:AnimateSequence("SetThemeVanguard")
	end

	var_76_0._sequences.SetThemeVanguard = var_76_285

	local var_76_286

	if CONDITIONS.IsVanguardRevealEventActive() then
		local var_76_287 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_71:RegisterAnimationSequence("VanguardRevealOver", var_76_287)
	end

	local function var_76_288()
		if CONDITIONS.IsVanguardRevealEventActive() then
			var_76_71:AnimateSequence("VanguardRevealOver")
		end
	end

	var_76_0._sequences.VanguardRevealOver = var_76_288

	local var_76_289

	if CONDITIONS.IsVanguardRevealEventActive() then
		local var_76_290 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_71:RegisterAnimationSequence("VanguardRevealUp", var_76_290)
	end

	local function var_76_291()
		if CONDITIONS.IsVanguardRevealEventActive() then
			var_76_71:AnimateSequence("VanguardRevealUp")
		end
	end

	var_76_0._sequences.VanguardRevealUp = var_76_291

	local var_76_292
	local var_76_293 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("VGBladeOver", var_76_293)

	local var_76_294 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_22:RegisterAnimationSequence("VGBladeOver", var_76_294)

	local var_76_295 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 449
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("VGBladeOver", var_76_295)

	local var_76_296 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("VGBladeOver", var_76_296)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_297 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 137
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -84
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 192
			}
		}

		var_76_65:RegisterAnimationSequence("VGBladeOver", var_76_297)
	end

	local function var_76_298()
		var_76_16:AnimateSequence("VGBladeOver")
		var_76_22:AnimateSequence("VGBladeOver")
		var_76_28:AnimateSequence("VGBladeOver")
		var_76_52:AnimateSequence("VGBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("VGBladeOver")
		end
	end

	var_76_0._sequences.VGBladeOver = var_76_298

	local var_76_299
	local var_76_300 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("WZLogoBladeOver", var_76_300)

	local var_76_301 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 438
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 227
		}
	}

	var_76_28:RegisterAnimationSequence("WZLogoBladeOver", var_76_301)

	local function var_76_302()
		var_76_26:AnimateSequence("WZLogoBladeOver")
		var_76_28:AnimateSequence("WZLogoBladeOver")
	end

	var_76_0._sequences.WZLogoBladeOver = var_76_302

	local var_76_303
	local var_76_304 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("WZLogoBladeUp", var_76_304)

	local var_76_305 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 490
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -284
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 284
		}
	}

	var_76_28:RegisterAnimationSequence("WZLogoBladeUp", var_76_305)

	local function var_76_306()
		var_76_26:AnimateSequence("WZLogoBladeUp")
		var_76_28:AnimateSequence("WZLogoBladeUp")
	end

	var_76_0._sequences.WZLogoBladeUp = var_76_306

	local var_76_307
	local var_76_308 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_4:RegisterAnimationSequence("PreOrderStandard", var_76_308)

	local var_76_309 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_58:RegisterAnimationSequence("PreOrderStandard", var_76_309)

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_76_310 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -387
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -357
			}
		}

		var_76_81:RegisterAnimationSequence("PreOrderStandard", var_76_310)
	end

	local function var_76_311()
		var_76_4:AnimateSequence("PreOrderStandard")
		var_76_58:AnimateSequence("PreOrderStandard")

		if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_76_81:AnimateSequence("PreOrderStandard")
		end
	end

	var_76_0._sequences.PreOrderStandard = var_76_311

	local var_76_312
	local var_76_313 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_4:RegisterAnimationSequence("PreOrderUltimate", var_76_313)

	local var_76_314 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_58:RegisterAnimationSequence("PreOrderUltimate", var_76_314)

	local function var_76_315()
		var_76_4:AnimateSequence("PreOrderUltimate")
		var_76_58:AnimateSequence("PreOrderUltimate")
	end

	var_76_0._sequences.PreOrderUltimate = var_76_315

	local var_76_316

	if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_76_317 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_80:RegisterAnimationSequence("PreOrderUp", var_76_317)
	end

	local function var_76_318()
		if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_76_80:AnimateSequence("PreOrderUp")
		end
	end

	var_76_0._sequences.PreOrderUp = var_76_318

	local var_76_319

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_76_320 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_81:RegisterAnimationSequence("PreOrderBannerShow", var_76_320)
	end

	local function var_76_321()
		if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_76_81:AnimateSequence("PreOrderBannerShow")
		end
	end

	var_76_0._sequences.PreOrderBannerShow = var_76_321

	local var_76_322

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_76_323 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_81:RegisterAnimationSequence("PreOrderBannerHide", var_76_323)
	end

	local function var_76_324()
		if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_76_81:AnimateSequence("PreOrderBannerHide")
		end
	end

	var_76_0._sequences.PreOrderBannerHide = var_76_324

	local var_76_325
	local var_76_326 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("SetThemeCortez", var_76_326)

	local function var_76_327()
		var_76_26:AnimateSequence("SetThemeCortez")
	end

	var_76_0._sequences.SetThemeCortez = var_76_327

	local var_76_328
	local var_76_329 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("NGBladeOver", var_76_329)

	local var_76_330 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_22:RegisterAnimationSequence("NGBladeOver", var_76_330)

	local var_76_331 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_26:RegisterAnimationSequence("NGBladeOver", var_76_331)

	local var_76_332 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 473
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 217
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("NGBladeOver", var_76_332)

	local var_76_333 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("NGBladeOver", var_76_333)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_334 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 137
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 181
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -84
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 192
			}
		}

		var_76_65:RegisterAnimationSequence("NGBladeOver", var_76_334)
	end

	local function var_76_335()
		var_76_16:AnimateSequence("NGBladeOver")
		var_76_22:AnimateSequence("NGBladeOver")
		var_76_26:AnimateSequence("NGBladeOver")
		var_76_28:AnimateSequence("NGBladeOver")
		var_76_52:AnimateSequence("NGBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("NGBladeOver")
		end
	end

	var_76_0._sequences.NGBladeOver = var_76_335

	local var_76_336
	local var_76_337 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_16:RegisterAnimationSequence("NGBladeUp", var_76_337)

	local var_76_338 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_22:RegisterAnimationSequence("NGBladeUp", var_76_338)

	local var_76_339 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_24:RegisterAnimationSequence("NGBladeUp", var_76_339)

	local var_76_340 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 476
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 472
		}
	}

	var_76_26:RegisterAnimationSequence("NGBladeUp", var_76_340)

	local var_76_341 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 483
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_28:RegisterAnimationSequence("NGBladeUp", var_76_341)

	local var_76_342 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_52:RegisterAnimationSequence("NGBladeUp", var_76_342)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_76_343 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 206
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 250
			}
		}

		var_76_65:RegisterAnimationSequence("NGBladeUp", var_76_343)
	end

	local function var_76_344()
		var_76_16:AnimateSequence("NGBladeUp")
		var_76_22:AnimateSequence("NGBladeUp")
		var_76_24:AnimateSequence("NGBladeUp")
		var_76_26:AnimateSequence("NGBladeUp")
		var_76_28:AnimateSequence("NGBladeUp")
		var_76_52:AnimateSequence("NGBladeUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_76_65:AnimateSequence("NGBladeUp")
		end
	end

	var_76_0._sequences.NGBladeUp = var_76_344

	local var_76_345

	if CONDITIONS.IsNewGameAvailableNowMessageActive() then
		local var_76_346 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_76_39:RegisterAnimationSequence("ShowNewGameNowAvailableMessage", var_76_346)
	end

	local function var_76_347()
		if CONDITIONS.IsNewGameAvailableNowMessageActive() then
			var_76_39:AnimateSequence("ShowNewGameNowAvailableMessage")
		end
	end

	var_76_0._sequences.ShowNewGameNowAvailableMessage = var_76_347

	var_0_44(var_76_0, var_76_1, arg_76_1)

	return var_76_0
end

MenuBuilder.registerType("MainMenuBlade", MainMenuBlade)
LockTable(_M)
