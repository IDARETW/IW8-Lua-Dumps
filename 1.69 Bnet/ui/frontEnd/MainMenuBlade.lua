module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1, var_1_2, var_1_3 = MAIN_MENU.GetCortezProductOwned(arg_1_1, true)

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
		arg_1_0.CalloutLabel:SetAlpha(1)

		if MAIN_MENU.IsCortezReleaseCountdown() then
			if CONDITIONS.IsPC() then
				arg_1_0.CalloutLabel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CAMPAIGN_EARLY_ACCESS_PC")))
			else
				arg_1_0.CalloutLabel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CAMPAIGN_EARLY_ACCESS_CONSOLE")))
			end
		else
			arg_1_0.CalloutLabel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_WZ350/MULTIPLAYER_BETA")))
		end
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0._baseCinematicLayout then
		local var_2_0 = LUI.ShallowCopy(arg_2_0._baseCinematicLayout)

		if arg_2_0._videoVerticalOffset then
			var_2_0[7] = var_2_0[7] + arg_2_0._videoVerticalOffset
			var_2_0[8] = var_2_0[8] + arg_2_0._videoVerticalOffset
		end

		arg_2_0.Cinematic:SetAnchorsAndPosition(unpack(var_2_0))
	end
end

local var_0_2 = {
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
		CalculateBladeWidth = function(arg_3_0, arg_3_1)
			return arg_3_1._layoutWidth / arg_3_1._bladeCount
		end,
		CalculateButtonWidth = function(arg_4_0, arg_4_1)
			return arg_4_0:CalculateBladeWidth(arg_4_1) * arg_4_0.ButtonWidthMultiplier
		end,
		CalculateCenterOffset = function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_0:CalculateBladeWidth(arg_5_1)
			local var_5_1 = arg_5_1._bladeCount % 2 == 0
			local var_5_2 = math.ceil(arg_5_1._bladeCount / 2)
			local var_5_3 = arg_5_1._index * var_5_0 - var_5_2 * var_5_0

			if var_5_1 then
				var_5_3 = var_5_3 - var_5_0 / 2
			end

			return var_5_3
		end,
		HandleButtonState = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
			local var_6_0 = arg_6_2 and 0 or arg_6_0.ButtonDodgeDuration
			local var_6_1 = arg_6_3 / 2
			local var_6_2 = arg_6_0:CalculateButtonWidth(arg_6_1) / 2
			local var_6_3 = arg_6_0:CalculateBladeWidth(arg_6_1) / 2
			local var_6_4 = var_6_1 - var_6_3 - (var_6_3 - var_6_2)
			local var_6_5 = LUI.clamp(var_6_4 + arg_6_0.MinimalButtonDodgeMargin, 0, arg_6_1._layoutWidth)
			local var_6_6
			local var_6_7

			if arg_6_4 + 1 == arg_6_1._index then
				var_6_6 = _1080p * (-var_6_2 + var_6_5)
				var_6_7 = _1080p * (var_6_2 + var_6_5)
			elseif arg_6_4 - 1 == arg_6_1._index then
				var_6_6 = _1080p * (-var_6_2 - var_6_5)
				var_6_7 = _1080p * (var_6_2 - var_6_5)
			else
				var_6_6 = _1080p * -var_6_2
				var_6_7 = _1080p * var_6_2
			end

			arg_6_1.Button:SetLeft(var_6_6, var_6_0, arg_6_0.ButtonDodgeEasing)
			arg_6_1.Button:SetRight(var_6_7, var_6_0, arg_6_0.ButtonDodgeEasing)

			local var_6_8 = arg_6_0.ButtonHeight / 2
			local var_6_9 = _1080p * (-var_6_8 + arg_6_1._verticalButtonOffset)
			local var_6_10 = _1080p * (var_6_8 + arg_6_1._verticalButtonOffset)

			arg_6_1.Button:SetTop(var_6_9)
			arg_6_1.Button:SetBottom(var_6_10)
		end,
		UpdateSelectionState = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
			arg_7_3 = arg_7_3 or arg_7_0.DefaultExpandedBladeRatio

			local var_7_0 = arg_7_1._layoutHeight * arg_7_3
			local var_7_1 = arg_7_2 and 0 or arg_7_0.AnimationInDuration
			local var_7_2 = arg_7_2 and 0 or arg_7_0.AnimationOutDuration
			local var_7_3 = var_7_0 / 2
			local var_7_4 = arg_7_0:CalculateCenterOffset(arg_7_1)
			local var_7_5 = arg_7_0:CalculateBladeWidth(arg_7_1) / 2

			if arg_7_4 == arg_7_1._index then
				local var_7_6 = _1080p * (-var_7_3 + var_7_4)
				local var_7_7 = _1080p * (var_7_3 + var_7_4)

				arg_7_1:SetLeft(var_7_6, var_7_1, arg_7_0.AnimationEasing)
				arg_7_1:SetRight(var_7_7, var_7_1, arg_7_0.AnimationEasing)
				arg_7_1.Mask:SetLeftAnchor(0, var_7_1, arg_7_0.AnimationEasing)
				arg_7_1.Mask:SetRightAnchor(0, var_7_1, arg_7_0.AnimationEasing)
				arg_7_1.Overlay:SetLeftAnchor(0, var_7_1, arg_7_0.AnimationEasing)
				arg_7_1.Overlay:SetRightAnchor(0, var_7_1, arg_7_0.AnimationEasing)

				local var_7_8 = _1080p * -var_7_3
				local var_7_9 = _1080p * var_7_3

				arg_7_1.DisableOverlay:SetLeft(var_7_8)
				arg_7_1.DisableOverlay:SetRight(var_7_9)

				if arg_7_1._buttonOverAnimation == "ButtonOver" then
					local var_7_10 = 175 * _1080p
					local var_7_11 = LAYOUT.GetElementHeight(arg_7_1.ButtonDescription)

					arg_7_1.ButtonDescription:SetTop(var_7_10)
					arg_7_1.ButtonDescription:SetBottom(var_7_10 + var_7_11)

					if CONDITIONS.IsInKoreanIGRPaidSession() then
						ACTIONS.AnimateSequence(arg_7_1, "IGRAlt")
					end
				end

				ACTIONS.AnimateSequence(arg_7_1, arg_7_1._buttonOverAnimation)
			else
				local var_7_12 = _1080p * (-var_7_5 + var_7_4)
				local var_7_13 = _1080p * (var_7_5 + var_7_4)

				arg_7_1:SetLeft(var_7_12, var_7_2, arg_7_0.AnimationEasing)
				arg_7_1:SetRight(var_7_13, var_7_2, arg_7_0.AnimationEasing)
				arg_7_1.Mask:SetLeftAnchor(0.5, var_7_2, arg_7_0.AnimationEasing)
				arg_7_1.Mask:SetRightAnchor(0.5, var_7_2, arg_7_0.AnimationEasing)
				arg_7_1.Overlay:SetLeftAnchor(0.5, var_7_2, arg_7_0.AnimationEasing)
				arg_7_1.Overlay:SetRightAnchor(0.5, var_7_2, arg_7_0.AnimationEasing)
				ACTIONS.AnimateSequence(arg_7_1, "ButtonUp")
			end

			arg_7_0:HandleButtonState(arg_7_1, arg_7_2, var_7_0, arg_7_4)
		end,
		UpdateStaticState = function(arg_8_0, arg_8_1)
			ACTIONS.AnimateSequence(arg_8_1, "Shutter")
			arg_8_1.Text:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
			arg_8_1.Text:SetStartupDelay(500)
			arg_8_1.Text:SetLineHoldTime(400)
			arg_8_1.Text:SetAnimMoveTime(1000)
			arg_8_1.Text:SetAnimMoveSpeed(300)
			arg_8_1.Text:SetEndDelay(800)
			arg_8_1.Text:SetCrossfadeTime(250)
			arg_8_1.Text:SetFadeInTime(300)
			arg_8_1.Text:SetFadeOutTime(300)
			arg_8_1.Text:SetMaxVisibleLines(1)

			if arg_8_1._titleLogo then
				arg_8_1.TitleLogo:setImage(RegisterMaterial(arg_8_1._titleLogo), 0)
			else
				arg_8_1.TitleLogo:SetAlpha(0, 0)
				arg_8_1.TitleLogo:RegisterAnimationSequence("ButtonUp", {})
				arg_8_1.TitleLogo:RegisterAnimationSequence("ButtonOver", {})
				arg_8_1.Text:RegisterAnimationSequence("ButtonOver", {})
				arg_8_1.TextBackground:RegisterAnimationSequence("ButtonOver", {})
				arg_8_1.TitleLogo:RegisterAnimationSequence("ButtonOverEnglish", {})
				arg_8_1.Text:RegisterAnimationSequence("ButtonOverEnglish", {})
				arg_8_1.TextBackground:RegisterAnimationSequence("ButtonOverEnglish", {})
			end
		end
	},
	[MAIN_MENU.BladeType.Accordion] = {
		AspectRatioAnchorAdjust = 0.02,
		DefaultExpandedBladeRatio = 1,
		AnimationDuration = 285,
		ImageFadeDuration = 285,
		AnimationEasing = LUI.EASING.outQuartic,
		FadeEasing = LUI.EASING.outQuadratic,
		CalculateNeutralBladeWidth = function(arg_9_0, arg_9_1)
			return arg_9_1._layoutWidth / arg_9_1._bladeCount
		end,
		CalculateContractedBladeWidth = function(arg_10_0, arg_10_1, arg_10_2)
			return (arg_10_1._layoutWidth - arg_10_2) / (arg_10_1._bladeCount - 1)
		end,
		CalculateAccordionWidths = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
			local var_11_0 = {}

			for iter_11_0 = 1, arg_11_1._bladeCount do
				if not arg_11_3 or not arg_11_2 then
					table.insert(var_11_0, arg_11_0:CalculateNeutralBladeWidth(arg_11_1))
				elseif iter_11_0 == arg_11_3 then
					table.insert(var_11_0, arg_11_2)
				else
					table.insert(var_11_0, arg_11_0:CalculateContractedBladeWidth(arg_11_1, arg_11_2))
				end
			end

			return var_11_0
		end,
		UpdateSelectionState = function(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
			arg_12_3 = arg_12_3 or arg_12_0.DefaultExpandedBladeRatio

			local var_12_0 = arg_12_1._layoutHeight * arg_12_3
			local var_12_1 = CoD.IsUsingAspectRatio(1.6) and arg_12_0.AspectRatioAnchorAdjust or 0
			local var_12_2 = arg_12_2 and 0 or arg_12_0.AnimationDuration
			local var_12_3 = arg_12_2 and 0 or arg_12_0.ImageFadeDuration

			arg_12_1._isSelectedIndex = arg_12_4 == arg_12_1._index

			if arg_12_1.UpsellOverlay then
				arg_12_1.UpsellOverlay:SetTopAnchor(0 + var_12_1)
				arg_12_1.UpsellOverlay:SetBottomAnchor(0 + var_12_1)
			end

			if arg_12_1._isSelectedIndex then
				arg_12_1.Image:SetAlpha(0, var_12_3, arg_12_0.FadeEasing)

				if arg_12_1._description then
					arg_12_1.ButtonDescription:SetAlpha(1, var_12_2, arg_12_0.AnimationEasing)
					arg_12_1.ButtonDescriptionBG:SetAlpha(0.5, var_12_2, arg_12_0.AnimationEasing)
					arg_12_1.ButtonDescription:SetBottomAnchor(1 - var_12_1, var_12_2, arg_12_0.AnimationEasing)
					arg_12_1.ButtonDescription:SetTopAnchor(var_12_1, var_12_2, arg_12_0.AnimationEasing)
					arg_12_1.ButtonDescriptionBG:SetBottomAnchor(1 - var_12_1, var_12_2, arg_12_0.AnimationEasing)
					arg_12_1.ButtonDescriptionBG:SetTopAnchor(var_12_1, var_12_2, arg_12_0.AnimationEasing)
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_12_1, "ShowBLMMagma")
				end

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_12_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_12_1, "VanguardRevealOver")
				end

				if CONDITIONS.IsInKoreanIGRPaidSession() then
					ACTIONS.AnimateSequence(arg_12_1, "IGRAlt")
				end
			else
				arg_12_1.Image:SetAlpha(1, 0)
				arg_12_1.ButtonDescription:SetAlpha(0)
				arg_12_1.ButtonDescriptionBG:SetAlpha(0)
				arg_12_1.ButtonDescription:SetBottomAnchor(1)
				arg_12_1.ButtonDescription:SetTopAnchor(0)
				arg_12_1.ButtonDescriptionBG:SetBottomAnchor(1)
				arg_12_1.ButtonDescriptionBG:SetTopAnchor(0)

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_12_1, "HideBLMMagma")
				end

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_12_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_12_1, "VanguardRevealUp")
				end
			end

			local var_12_4 = arg_12_0:CalculateAccordionWidths(arg_12_1, var_12_0, arg_12_4)
			local var_12_5 = -arg_12_1._layoutWidth / 2

			for iter_12_0, iter_12_1 in ipairs(var_12_4) do
				if iter_12_0 < arg_12_1._index then
					var_12_5 = var_12_5 + iter_12_1
				else
					break
				end
			end

			local var_12_6 = _1080p * var_12_5
			local var_12_7 = _1080p * (var_12_5 + var_12_4[arg_12_1._index])

			arg_12_1:SetLeft(var_12_6, var_12_2, arg_12_0.AnimationEasing)
			arg_12_1:SetRight(var_12_7, var_12_2, arg_12_0.AnimationEasing)
		end,
		UpdateStaticState = function(arg_13_0, arg_13_1)
			ACTIONS.AnimateSequence(arg_13_1, "Accordion")

			if arg_13_1._imageName then
				arg_13_1.Image:setImage(RegisterMaterial(arg_13_1._imageName), 0)
			end
		end
	},
	[MAIN_MENU.BladeType.AccordionRefresh] = {
		AspectRatioAnchorAdjust = 0.02,
		AnimationDuration = 285,
		ImageFadeDuration = 285,
		AnimationEasing = LUI.EASING.outQuartic,
		FadeEasing = LUI.EASING.outQuadratic,
		DefaultExpandedBladeRatio = function(arg_14_0)
			if arg_14_0._bladeCount == 4 then
				return 0.59259
			else
				return 0.75185
			end
		end,
		CalculateNeutralBladeWidth = function(arg_15_0, arg_15_1)
			return arg_15_1._layoutWidth / arg_15_1._bladeCount
		end,
		CalculateContractedBladeWidth = function(arg_16_0, arg_16_1, arg_16_2)
			return (arg_16_1._layoutWidth - arg_16_2) / (arg_16_1._bladeCount - 1)
		end,
		CalculateAccordionWidths = function(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
			local var_17_0 = {}

			for iter_17_0 = 1, arg_17_1._bladeCount do
				if not arg_17_3 or not arg_17_2 then
					table.insert(var_17_0, arg_17_0:CalculateNeutralBladeWidth(arg_17_1))
				elseif iter_17_0 == arg_17_3 then
					table.insert(var_17_0, arg_17_2)
				else
					table.insert(var_17_0, arg_17_0:CalculateContractedBladeWidth(arg_17_1, arg_17_2))
				end
			end

			return var_17_0
		end,
		UpdateSelectionState = function(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
			arg_18_3 = arg_18_3 or arg_18_0.DefaultExpandedBladeRatio(arg_18_1)

			local var_18_0 = arg_18_1._layoutHeight * arg_18_3
			local var_18_1 = CoD.IsUsingAspectRatio(1.6) and arg_18_0.AspectRatioAnchorAdjust or 0
			local var_18_2 = arg_18_2 and 0 or arg_18_0.AnimationDuration
			local var_18_3 = arg_18_2 and 0 or arg_18_0.ImageFadeDuration

			arg_18_1._isSelectedIndex = arg_18_4 == arg_18_1._index

			local var_18_4 = arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyMW or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyVG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyCW

			if arg_18_1.UpsellOverlay then
				arg_18_1.UpsellOverlay:SetTopAnchor(0 + var_18_1)
				arg_18_1.UpsellOverlay:SetBottomAnchor(0 + var_18_1)
			end

			if arg_18_1._isSelectedIndex then
				arg_18_1.Image:SetAlpha(0, var_18_3, arg_18_0.FadeEasing)

				if arg_18_1._keepAspect then
					local var_18_5 = _1080p * (arg_18_1._baseVideoWidth and arg_18_1._baseVideoWidth or 1280)
					local var_18_6 = _1080p * (arg_18_1._baseVideoHeight and arg_18_1._baseVideoHeight or 2160)
					local var_18_7 = _1080p * 50
					local var_18_8 = var_18_0 / var_18_5

					arg_18_1._baseCinematicLayout = {
						0,
						1,
						0,
						1,
						0,
						_1080p * var_18_0,
						-var_18_7,
						_1080p * (var_18_6 * var_18_8 - var_18_7)
					}

					var_0_1(arg_18_1)
				else
					arg_18_1._baseCinematicLayout = nil
				end

				if arg_18_1._description then
					arg_18_1.ButtonDescription:SetAlpha(1, var_18_2, arg_18_0.AnimationEasing)
					arg_18_1.ButtonDescriptionBG:SetAlpha(0.5, var_18_2, arg_18_0.AnimationEasing)
					arg_18_1.ButtonDescription:SetBottomAnchor(1 - var_18_1, var_18_2, arg_18_0.AnimationEasing)
					arg_18_1.ButtonDescription:SetTopAnchor(var_18_1, var_18_2, arg_18_0.AnimationEasing)
					arg_18_1.ButtonDescriptionBG:SetBottomAnchor(1 - var_18_1, var_18_2, arg_18_0.AnimationEasing)
					arg_18_1.ButtonDescriptionBG:SetTopAnchor(var_18_1, var_18_2, arg_18_0.AnimationEasing)
				end

				if not arg_18_1.list then
					arg_18_1:dispatchEventToParent({
						name = "main_menu_background_image_update",
						imageName = arg_18_1._backgroundImageName
					})
				end

				if arg_18_1._isNGBlade then
					ACTIONS.AnimateSequence(arg_18_1, "NewARBladeOver")
				end

				local var_18_9 = arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.VG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.VG and CONDITIONS.IsVanguardDeeplinkEnabled()

				if arg_18_1._buttonListData and var_18_9 then
					ACTIONS.AnimateSequence(arg_18_1, "ARBladeOverNoWZOptionButton")
				else
					if arg_18_1._bladeKey == MAIN_MENU.BladeKeys.NG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG then
						ACTIONS.AnimateSequence(arg_18_1, "NGBladeOver")
					elseif arg_18_1._bladeKey == MAIN_MENU.BladeKeys.VG then
						ACTIONS.AnimateSequence(arg_18_1, "VGBladeOver")
					else
						ACTIONS.AnimateSequence(arg_18_1, "ARBladeOver")
					end

					if var_18_4 then
						WZWIP.AnimateThemeElement(arg_18_1, "UpsellARBladeOver")
					end
				end

				ACTIONS.AnimateSequence(arg_18_1.WZFriendCount, WZWIP.CheckForApplyPrependWZWipPrefix("ARBladeOver", CONDITIONS.IsWZWipDvarEnabled()))

				if arg_18_1._bladeKey == MAIN_MENU.BladeKeys.HQ or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyHQ then
					ACTIONS.AnimateSequence(arg_18_1, "ShowNewGameNowAvailableMessage")
					arg_18_1.Stripe:SetAlpha(0)

					if MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
						ACTIONS.AnimateSequence(arg_18_1, "FormatCombinedMWIILogoOver")
					end
				end

				if arg_18_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_18_1, "WZLogoBladeOver")
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_18_1, "ShowBLMMagma")
				end

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_18_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_18_1, "VanguardRevealOver")
				end

				if arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.MW and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyMW and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.CW and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyCW and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.VG and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyVG and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.BR and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyNG and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.NG and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.BuyHQ and arg_18_1._bladeKey ~= MAIN_MENU.BladeKeys.HQ then
					arg_18_1.WZWipNGSeasonCount:SetAlpha(1, 1)
				end

				if CONDITIONS.IsLaze() then
					ACTIONS.AnimateSequence(arg_18_1, "HideWarzoneMaintenanceMessage")
				elseif MAIN_MENU.IsStyxNowAvailable() and arg_18_1._bladeKey == MAIN_MENU.BladeKeys.MW then
					ACTIONS.AnimateSequence(arg_18_1, "ShowWarzoneMaintenanceMessage")
				elseif MAIN_MENU.IsStyxNowAvailable() and arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BR then
					ACTIONS.AnimateSequence(arg_18_1, "ShowWarzoneMaintenanceMessageF2P")
				end

				if CONDITIONS.IsInKoreanIGRPaidSession() then
					ACTIONS.AnimateSequence(arg_18_1, "IGRAlt")
				end

				if arg_18_1.list then
					arg_18_1.list:processEvent({
						name = "gain_focus"
					})
				end

				if CONDITIONS.IsWZWipDvarEnabled() then
					arg_18_1.SepRight:SetAlpha(0)
				end

				arg_18_1._isSelected = true
			else
				arg_18_1.Image:SetAlpha(1, 0)

				if CONDITIONS.IsWZWipDvarEnabled() then
					arg_18_1.SepRight:SetAlpha(0.2)
				end

				arg_18_1.WZWipNGSeasonCount:SetAlpha(0, 1)
				arg_18_1.ButtonDescription:SetAlpha(0)
				arg_18_1.ButtonDescriptionBG:SetAlpha(0)
				arg_18_1.ButtonDescription:SetBottomAnchor(1)
				arg_18_1.ButtonDescription:SetTopAnchor(0)
				arg_18_1.ButtonDescriptionBG:SetBottomAnchor(1)
				arg_18_1.ButtonDescriptionBG:SetTopAnchor(0)

				if CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_18_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_18_1, "VanguardRevealUp")
				end

				if arg_18_1._isNGBlade then
					ACTIONS.AnimateSequence(arg_18_1, "NewARBladeUp")
				end

				ACTIONS.AnimateSequence(arg_18_1, "ARBladeUp")
				ACTIONS.AnimateSequence(arg_18_1.WZFriendCount, WZWIP.CheckForApplyPrependWZWipPrefix("ARBladeUp", CONDITIONS.IsWZWipDvarEnabled()))

				if arg_18_1._isWZBlade then
					ACTIONS.AnimateSequence(arg_18_1, "WZLogoBladeUp")
				elseif arg_18_1._bladeKey == MAIN_MENU.BladeKeys.NG or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG then
					ACTIONS.AnimateSequence(arg_18_1, "NGBladeUp")
				end

				if var_18_4 then
					WZWIP.AnimateThemeElement(arg_18_1, "UpsellARBladeUp")
				end

				if arg_18_1._bladeKey == MAIN_MENU.BladeKeys.HQ or arg_18_1._bladeKey == MAIN_MENU.BladeKeys.BuyHQ then
					ACTIONS.AnimateSequence(arg_18_1, "ShowNewGameNowAvailableMessage")
					arg_18_1.TitleLogo:SetAlpha(1)

					if MAIN_MENU.GetNGBladeState() >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
						ACTIONS.AnimateSequence(arg_18_1, "FormatCombinedMWIILogoUp")
					end
				end

				if Dvar.IBEGCHEFE("blm_messaging") then
					ACTIONS.AnimateSequence(arg_18_1, "HideBLMMagma")
				end

				if MAIN_MENU.IsStyxNowAvailable() then
					ACTIONS.AnimateSequence(arg_18_1, "HideWarzoneMaintenanceMessage")
				end

				arg_18_1._isSelected = false
			end

			if arg_18_1._friendsCountUpdate and arg_18_1._friendsCountUpdate ~= -1 then
				arg_18_1.WZFriendCount:SetAlpha(1)

				local var_18_10 = arg_18_1._isSelectedIndex and "MENU/FRIENDS_PLAYING" or "MENU/NUMBER"

				arg_18_1.WZFriendCount:SetFriendLabel(var_18_10)

				local var_18_11 = tostring(arg_18_1._friendsCountUpdate)

				arg_18_1.WZFriendCount:SetFriendCount(var_18_11)
			else
				arg_18_1.WZFriendCount:SetAlpha(0)
			end

			local var_18_12 = arg_18_0:CalculateAccordionWidths(arg_18_1, var_18_0, arg_18_4)
			local var_18_13 = -arg_18_1._layoutWidth / 2

			for iter_18_0, iter_18_1 in ipairs(var_18_12) do
				if iter_18_0 < arg_18_1._index then
					var_18_13 = var_18_13 + iter_18_1
				else
					break
				end
			end

			local var_18_14 = _1080p * var_18_13
			local var_18_15 = _1080p * (var_18_13 + var_18_12[arg_18_1._index])

			arg_18_1:SetLeft(var_18_14, var_18_2, arg_18_0.AnimationEasing)
			arg_18_1:SetRight(var_18_15, var_18_2, arg_18_0.AnimationEasing)
		end,
		UpdateStaticState = function(arg_19_0, arg_19_1, arg_19_2)
			local var_19_0 = arg_19_1._bladeKey ~= MAIN_MENU.BladeKeys.VG or arg_19_1._bladeKey == MAIN_MENU.BladeKeys.VG and CONDITIONS.IsVanguardDeeplinkEnabled()

			if arg_19_1._buttonListData and var_19_0 then
				ACTIONS.AnimateSequence(arg_19_1, "AccordionRefreshNoWZOptionButton")
			else
				ACTIONS.AnimateSequence(arg_19_1, "AccordionRefresh")
			end

			if arg_19_1._imageName then
				arg_19_1.Image:setImage(RegisterMaterial(arg_19_1._imageName))
			end

			if arg_19_1._titleLogo then
				arg_19_1.TitleLogo:setImage(RegisterMaterial(arg_19_1._titleLogo))
			end

			if arg_19_1.LiveEventInfo and arg_19_1._liveEventLocation and arg_19_2 then
				arg_19_1.LiveEventInfo:GetMessage(arg_19_2, {
					locationIndex = arg_19_1._liveEventLocation
				})
			end

			if arg_19_1._actionName then
				arg_19_1.WZOptionButton.Text:setText(arg_19_1._actionName)
			end

			if arg_19_1._bladeKey == MAIN_MENU.BladeKeys.BuyNG or arg_19_1._bladeKey == MAIN_MENU.BladeKeys.NG then
				var_0_0(arg_19_1, arg_19_2, arg_19_1._bladeKey)
			elseif arg_19_1._bladeKey == MAIN_MENU.BladeKeys.BuyVG and CONDITIONS.IsVaguardTrialEnabled() then
				arg_19_1.WZOptionButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FREE_TRIAL"))
			end
		end
	}
}
local var_0_3 = 500
local var_0_4 = "button_r3"
local var_0_5 = "button_right_stick"
local var_0_6 = "button_l3"
local var_0_7 = "button_left_stick"

local function var_0_8(arg_20_0, arg_20_1)
	if type(arg_20_0) == "table" then
		return arg_20_0
	else
		return {
			[arg_20_1] = arg_20_0
		}
	end
end

local function var_0_9(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0 ~= nil then
		if type(arg_21_0) == "function" then
			return arg_21_0(arg_21_2)
		else
			return arg_21_0
		end
	else
		return arg_21_1
	end
end

local function var_0_10(arg_22_0)
	if arg_22_0 ~= nil then
		if type(arg_22_0) == "function" then
			return arg_22_0
		else
			return function()
				return arg_22_0
			end
		end
	else
		return function()
			return nil
		end
	end
end

local function var_0_11(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0:getParent()

	if var_25_0.HoverBladeByIndex then
		var_25_0:HoverBladeByIndex(arg_25_0._index, arg_25_1)
	end
end

local function var_0_12(arg_26_0)
	local var_26_0 = arg_26_0:getParent()

	if var_26_0.PushBladeToTopByIndex then
		var_26_0:PushBladeToTopByIndex(arg_26_0._index)
	end
end

local function var_0_13(arg_27_0)
	TIME.SetCountDownTimerTextField(arg_27_0.AlphaBetaCountdown, Dvar.CFHDGABACF("QQKNMNOON"), {
		useCustomDisplay = true,
		broadcastOnComplete = true,
		customFormatString = "SEASONS/EVENT_COUNTDOWN_DAYS_HOURS"
	})
	arg_27_0.AlphaBetaCountdown:addEventHandler(TIME.TIMER_TICK, function(arg_28_0, arg_28_1)
		if arg_28_1.intervals.days == 0 then
			if arg_28_1.intervals.hours == 0 then
				arg_28_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_MINUTES_SECONDS", arg_28_1.intervals.minutes, arg_28_1.intervals.seconds))

				if not arg_28_0._inMinutesAndSeconds then
					arg_28_0._inMinutesAndSeconds = true
				end
			else
				arg_28_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_HOURS_MINUTES", arg_28_1.intervals.hours, arg_28_1.intervals.minutes))

				if not arg_28_0._inHoursAndMinutes then
					arg_28_0._inHoursAndMinutes = true
				end
			end
		else
			arg_28_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_DAYS_HOURS", arg_28_1.intervals.days, arg_28_1.intervals.hours))

			if not arg_28_0._inDaysAndHours then
				arg_28_0._inDaysAndHours = true
			end
		end
	end)
end

local function var_0_14(arg_29_0)
	local var_29_0 = arg_29_0:GetCurrentMenu()

	if var_29_0 and var_29_0.AddButtonHelperText and var_29_0.RemoveButtonHelperText then
		var_29_0:RemoveButtonHelperText("button_primary", "left")
		var_29_0:RemoveButtonHelperText(var_0_4, "left")
		var_29_0:RemoveButtonHelperText(var_0_6, "left")

		if arg_29_0._currentState == MAIN_MENU.BladeStates.Installing then
			if arg_29_0._installingPrompt then
				var_29_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					priority = 2,
					helper_text = arg_29_0._installingPrompt
				})
			end
		elseif arg_29_0._currentState == MAIN_MENU.BladeStates.Blocked then
			if arg_29_0._blockedPrompt then
				var_29_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_primary",
					priority = 2,
					helper_text = arg_29_0._blockedPrompt
				})
			end
		elseif arg_29_0._prompt then
			var_29_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = arg_29_0._prompt
			})
		else
			var_29_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 2,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		end

		local var_29_1 = LUI.FlowManager.GetScopedData(var_29_0)

		if CONDITIONS.IsConsoleGame() and CONDITIONS.IsPS4() then
			local var_29_2 = arg_29_0._bladeKey == MAIN_MENU.BladeKeys.SP or arg_29_0._bladeKey == MAIN_MENU.BladeKeys.CP or arg_29_0._bladeKey == MAIN_MENU.BladeKeys.MP

			if arg_29_0._currentState ~= MAIN_MENU.BladeStates.Installing and var_29_2 and not CONDITIONS.IsLaunchChunk() then
				var_29_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL")
				})

				if var_29_1 then
					var_29_1.currentSelectedMenuType = arg_29_0._bladeKey
				end
			else
				var_29_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_l3",
					helper_text = "",
					priority = 3
				})

				if var_29_1 then
					var_29_1.currentSelectedMenuType = nil
				end
			end
		end

		if arg_29_0._secondaryPrompt then
			var_29_0:AddButtonHelperText({
				side = "left",
				priority = 3,
				helper_text = arg_29_0._secondaryPrompt,
				button_ref = var_0_4
			})
		end

		if arg_29_0._tertiaryPrompt then
			var_29_0:AddButtonHelperText({
				side = "left",
				priority = 4,
				helper_text = arg_29_0._tertiaryPrompt,
				button_ref = var_0_6
			})
		end
	end
end

local function var_0_15(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetCurrentMenu()

	if var_30_0 then
		if arg_30_0._currentState == MAIN_MENU.BladeStates.Installing then
			if arg_30_0._installingAction and arg_30_0._installingAction(var_30_0, arg_30_1) then
				Engine.BJDBIAGIDA(arg_30_0._actionSFX)
			end
		elseif arg_30_0._currentState == MAIN_MENU.BladeStates.Blocked then
			if arg_30_0._blockedAction and arg_30_0._blockedAction(var_30_0, arg_30_1) then
				Engine.BJDBIAGIDA(arg_30_0._actionSFX)
			end
		else
			arg_30_0._action(var_30_0, arg_30_1)
			Engine.BJDBIAGIDA(arg_30_0._actionSFX)
		end
	else
		DebugPrint("MainMenuBlade: id=" .. arg_30_0.id .. " type=" .. tostring(arg_30_0._bladeType) .. " isn't part of a menu")
	end
end

local function var_0_16(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:GetCurrentMenu()

	if arg_31_0._selected then
		arg_31_0._secondaryAction(var_31_0, arg_31_1)
	end
end

local function var_0_17(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:GetCurrentMenu()

	if arg_32_0._selected then
		arg_32_0._tertiaryAction(var_32_0, arg_32_1)
	end
end

local function var_0_18(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_1 < arg_33_0._currentState then
		arg_33_0._currentState = arg_33_1
		arg_33_0._stateParameters = arg_33_2
	end
end

local function var_0_19(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0._newUpdate(arg_34_1)

	if var_34_0 then
		local var_34_1 = var_0_8(var_34_0, "label")

		var_0_18(arg_34_0, MAIN_MENU.BladeStates.New, var_34_1)
	end
end

local function var_0_20(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0._isBlockedUpdate(arg_35_1)

	if var_35_0 then
		local var_35_1 = var_0_8(var_35_0, "label")

		var_0_18(arg_35_0, MAIN_MENU.BladeStates.Blocked, var_35_1)
	end
end

local function var_0_21(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0._isInstallingUpdate(arg_36_1)

	if var_36_0 then
		local var_36_1 = var_0_8(var_36_0, "label")

		var_0_18(arg_36_0, MAIN_MENU.BladeStates.Installing, var_36_1)
	end
end

local function var_0_22(arg_37_0, arg_37_1)
	if arg_37_1._buttonKey == arg_37_0.list.selectedIndex then
		arg_37_0.BlockedLabel:setText(arg_37_1._blockedText)
	end

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() then
		arg_37_0.BlockedLabel:SetAlpha(arg_37_1._isBlocked and 1 or 0)
	else
		arg_37_0.BlockedLabel:SetAlpha(0)
	end
end

local function var_0_23(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_1._isBlocked and arg_38_1._isBlocked(arg_38_2) or {
		isBlocked = false
	}

	arg_38_1:SetIsDisabled(var_38_0.isBlocked)
	arg_38_1:SetBlockedText(var_38_0.text)
	var_0_22(arg_38_0, arg_38_1)
end

local function var_0_24(arg_39_0)
	if arg_39_0.list and arg_39_0.list.buttons then
		for iter_39_0, iter_39_1 in ipairs(arg_39_0.list.buttons) do
			var_0_23(arg_39_0, iter_39_1, arg_39_0._partyCount)
		end
	end
end

local function var_0_25(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_1._installData then
		arg_40_0.InstallStatus:Refresh(arg_40_1._installData(), arg_40_2)
	end
end

local function var_0_26(arg_41_0)
	if arg_41_0.list and arg_41_0.list.buttons then
		for iter_41_0, iter_41_1 in ipairs(arg_41_0.list.buttons) do
			var_0_25(arg_41_0, iter_41_1, false)
		end
	end
end

local function var_0_27(arg_42_0, arg_42_1)
	arg_42_0._prompt = arg_42_0._promptUpdate(arg_42_1)
	arg_42_0._secondaryPrompt = arg_42_0._secondaryPromptUpdate(arg_42_1)
	arg_42_0._tertiaryPrompt = arg_42_0._tertiaryPromptUpdate(arg_42_1)
	arg_42_0._blockedPrompt = arg_42_0._blockedPromptUpdate(arg_42_1)
	arg_42_0._installingPrompt = arg_42_0._installingPromptUpdate(arg_42_1)
end

local function var_0_28(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0._currentState == MAIN_MENU.BladeStates.Blocked

	if arg_43_0.list and arg_43_0.list.buttons then
		for iter_43_0, iter_43_1 in ipairs(arg_43_0.list.buttons) do
			iter_43_1:SetIsDisabled(var_43_0)
		end
	end
end

local function var_0_29(arg_44_0, arg_44_1)
	arg_44_0._currentState = MAIN_MENU.BladeStates.Neutral

	var_0_21(arg_44_0, arg_44_1)
	var_0_20(arg_44_0, arg_44_1)
	var_0_19(arg_44_0, arg_44_1)
	var_0_27(arg_44_0, arg_44_1)

	if not arg_44_0._disableBlockedStateRefresh then
		var_0_28(arg_44_0, arg_44_1)
		arg_44_0.DisableOverlay:RefreshState(arg_44_0._currentState, arg_44_0._stateParameters)
	end

	arg_44_0.Button:RefreshState(arg_44_0._currentState, arg_44_0._stateParameters)
end

local function var_0_30(arg_45_0)
	if arg_45_0._transitionSwatch then
		arg_45_0.Overlay:SetRGBFromTable(arg_45_0._transitionSwatch)
		arg_45_0.Underlay:SetRGBFromTable(arg_45_0._transitionSwatch)
	end
end

local function var_0_31(arg_46_0, arg_46_1)
	if not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_46_1) or not Dvar.IBEGCHEFE("blm_messaging") then
		if arg_46_0._name and arg_46_0._name ~= "" then
			arg_46_0.Text:setText(arg_46_0._name)
			arg_46_0.Button.Text:setText(arg_46_0._name)
		else
			arg_46_0.Text:SetAlpha(0)
			arg_46_0.TextBackground:SetAlpha(0)
		end

		if arg_46_0._description and arg_46_0._description ~= "" then
			arg_46_0.ButtonDescription:setText(arg_46_0._description)
		else
			arg_46_0.ButtonDescription:SetAlpha(0)
			arg_46_0.ButtonDescriptionBG:SetAlpha(0)
		end
	else
		arg_46_0.BLMTitle:setText(ToUpperCase(arg_46_0._name))
		arg_46_0.BLMDesc:setText(arg_46_0._description)
		arg_46_0.Text:SetAlpha(0)
		arg_46_0.TextBackground:SetAlpha(0)
		arg_46_0.ButtonDescription:SetAlpha(0)
		arg_46_0.ButtonDescriptionBG:SetAlpha(0)
	end
end

local function var_0_32(arg_47_0)
	arg_47_0.Image:SetMask(arg_47_0.Mask)
	arg_47_0.Text:SetMask(arg_47_0.Mask)
	arg_47_0.TextBackground:SetMask(arg_47_0.Mask)
	arg_47_0.Cinematic:SetMask(arg_47_0.Mask)
	arg_47_0.ButtonDescription:SetMask(arg_47_0.Mask)
	arg_47_0.ButtonDescriptionBG:SetMask(arg_47_0.Mask)
	arg_47_0.DisableOverlay:SetMask(arg_47_0.Mask)
	arg_47_0.Overlay:SetMask(arg_47_0.Mask)
	arg_47_0.Underlay:SetMask(arg_47_0.Mask)
	arg_47_0.BlackoutImage:SetMask(arg_47_0.Mask)

	if arg_47_0.UpsellOverlay then
		arg_47_0.UpsellOverlay:SetMask(arg_47_0.Mask)
	end

	if arg_47_0.StoreOverlay then
		arg_47_0.StoreOverlay:SetMask(arg_47_0.Mask)
	end

	if arg_47_0.ClassifiedCountdownTimer then
		arg_47_0.ClassifiedCountdownTimer:SetMask(arg_47_0.Mask)
	end
end

local function var_0_33(arg_48_0, arg_48_1)
	if arg_48_0._secondaryAction or arg_48_0._tertiaryAction then
		local var_48_0 = LUI.UIBindButton.new()

		var_48_0.id = "selfBindButton"

		arg_48_0:addElement(var_48_0)

		arg_48_0.bindButton = var_48_0

		if arg_48_0._secondaryAction then
			arg_48_0.bindButton:addEventHandler(var_0_5, function(arg_49_0, arg_49_1)
				var_0_16(arg_48_0, arg_48_1)
			end)
		end

		if arg_48_0._tertiaryAction then
			arg_48_0.bindButton:addEventHandler(var_0_7, function(arg_50_0, arg_50_1)
				var_0_17(arg_48_0, arg_48_1)
			end)
		end
	end
end

local function var_0_34(arg_51_0, arg_51_1)
	if not arg_51_0._showUpsellOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_51_0.UpsellOverlay:closeTree()

		arg_51_0.UpsellOverlay = nil
	elseif arg_51_0._isOnSale then
		arg_51_0.UpsellOverlay:FlagOnSale()
	end
end

local function var_0_35(arg_52_0, arg_52_1)
	if not arg_52_0._showNGOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_52_0.NGOverlay:closeTree()

		arg_52_0.NGOverlay = nil
	end
end

local function var_0_36(arg_53_0, arg_53_1)
	if not arg_53_0._showStoreOverlay or Dvar.IBEGCHEFE("blm_messaging") then
		arg_53_0.StoreOverlay:closeTree()

		arg_53_0.StoreOverlay = nil
	end
end

local function var_0_37(arg_54_0, arg_54_1)
	if arg_54_0._classified then
		local var_54_0 = tonumber(Engine.DCJHCAFIIA())
		local var_54_1 = Dvar.CFHDGABACF("MNNTMPMOLK")
		local var_54_2 = MenuBuilder.BuildRegisteredType("ClassifiedCountdownTimer", {
			controllerIndex = arg_54_1
		})

		var_54_2.id = "ClassifiedCountdownTimer"

		var_54_2:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -175, _1080p * 175, _1080p * -40, _1080p * 40)
		arg_54_0:addElement(var_54_2)

		arg_54_0.ClassifiedCountdownTimer = var_54_2

		if var_54_0 and var_54_0 > 0 and var_54_1 and var_54_1 > 0 then
			arg_54_0.ClassifiedCountdownTimer:SetAlpha(0.8)
		end

		arg_54_0.Text:SetGlitchAmount(1)
		arg_54_0.Button:SetGlitchAmount(var_54_1 == 0 and 0.8 or 0)
		arg_54_0.ButtonDescriptionBG:SetAlpha(0)
		arg_54_0.Text:SetAlpha(0)
		arg_54_0.TextBackground:SetAlpha(0)
	end
end

local function var_0_38(arg_55_0)
	if CONDITIONS.IsInKoreanIGRPaidSession(arg_55_0) then
		assert(arg_55_0.ButtonDescriptionIGR)
		assert(arg_55_0.IGRBoostIcon)
		arg_55_0.ButtonDescriptionIGR:SetMask(arg_55_0.Mask)

		local var_55_0 = Engine.DDAEJCJEA()

		arg_55_0.ButtonDescriptionIGR:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BONUS_TIP", tostring(var_55_0 * 100)))
		arg_55_0.IGRBoostIcon:SetMask(arg_55_0.Mask)
	end
end

local function var_0_39(arg_56_0)
	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_56_0, "JP")
	elseif IsLanguageSafeChinese() or IsLanguageSimplifiedChinese() then
		ACTIONS.AnimateSequence(arg_56_0, "CHSF")
	elseif IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_56_0, "CHTR")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_56_0, "AR")
	elseif IsLanguageSpanish() or IsLanguagePortuguese() then
		ACTIONS.AnimateSequence(arg_56_0, "ESandPT")
	end
end

local function var_0_40(arg_57_0, arg_57_1)
	var_0_37(arg_57_0, arg_57_1)
	var_0_34(arg_57_0, arg_57_1)
	var_0_35(arg_57_0, arg_57_1)
	var_0_36(arg_57_0, arg_57_1)
	var_0_33(arg_57_0, arg_57_1)
	var_0_39(arg_57_0)
	var_0_38(arg_57_0)
	var_0_30(arg_57_0)
	var_0_32(arg_57_0)
	var_0_31(arg_57_0, arg_57_1)
	var_0_2[arg_57_0._bladeType]:UpdateStaticState(arg_57_0, arg_57_1)
end

local function var_0_41(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_0 then
		if arg_58_1 then
			arg_58_0:FlagExpanded()
			arg_58_0:SetLeft(-6, 0)
			arg_58_0:SetRight(6, 0)
		else
			arg_58_0:FlagContracted(arg_58_2)
			arg_58_0:SetLeft(0, 0)
			arg_58_0:SetRight(0, 0)
		end
	end
end

local function var_0_42(arg_59_0, arg_59_1, arg_59_2)
	if arg_59_0._playByDefault then
		arg_59_0.Cinematic:SetAlpha(1, 0)
	else
		arg_59_0.Cinematic:SetAlpha(0, 0)
	end

	if arg_59_0._index == arg_59_1 then
		var_0_14(arg_59_0)
		var_0_12(arg_59_0)
		var_0_41(arg_59_0.UpsellOverlay, true, false)
		var_0_41(arg_59_0.NGOverlay, true, false)
		var_0_41(arg_59_0.StoreOverlay, true, false)
		arg_59_0.DisableOverlay:FlagExpanded()
		arg_59_0.Trigger:processEvent({
			name = "gain_focus"
		})

		arg_59_0._selected = true

		if arg_59_0.list then
			arg_59_0._selectedIndex = arg_59_1

			arg_59_0.list:processEvent({
				name = "gain_focus"
			})
			arg_59_0.InlineList:SetAlpha(1)
		else
			arg_59_0.Cinematic:SetAlpha(1, 0)
			arg_59_0:PlayBladeVideo(arg_59_0._videoName)
			arg_59_0.WZOptionButton:processEvent({
				name = "gain_focus"
			})
		end

		if arg_59_0._gainFocusRightSFX and arg_59_0._gainFocusLeftSFX then
			if not arg_59_0._lastSelectedIndex then
				Engine.BJDBIAGIDA(arg_59_0._gainFocusRightSFX)
			elseif arg_59_0._index > arg_59_0._lastSelectedIndex then
				if arg_59_2 then
					Engine.BJDBIAGIDA(arg_59_0._gainFocusLeftSFX)
				else
					Engine.BJDBIAGIDA(arg_59_0._gainFocusRightSFX)
				end
			elseif arg_59_0._index < arg_59_0._lastSelectedIndex then
				if arg_59_2 then
					Engine.BJDBIAGIDA(arg_59_0._gainFocusRightSFX)
				else
					Engine.BJDBIAGIDA(arg_59_0._gainFocusLeftSFX)
				end
			end
		end
	else
		var_0_41(arg_59_0.UpsellOverlay, false, arg_59_0._useSmallerBlades)
		var_0_41(arg_59_0.NGOverlay, false, arg_59_0._useSmallerBlades)
		var_0_41(arg_59_0.StoreOverlay, false, arg_59_0._useSmallerBlades)
		arg_59_0.DisableOverlay:FlagContracted()
		arg_59_0.Trigger:processEvent({
			name = "lose_focus"
		})
		arg_59_0.InstallStatus:processEvent({
			name = "lose_focus"
		})

		if arg_59_0.list then
			arg_59_0.list:processEvent({
				name = "lose_focus"
			})
			arg_59_0.InlineList:SetAlpha(0)
		else
			arg_59_0.WZOptionButton:processEvent({
				name = "lose_focus"
			})
		end

		arg_59_0._selected = false
	end

	arg_59_0._lastSelectedIndex = arg_59_1
end

local function var_0_43(arg_60_0, arg_60_1)
	var_0_42(arg_60_0, arg_60_1.selectedIndex, arg_60_1.wrapped)
	var_0_2[arg_60_0._bladeType]:UpdateSelectionState(arg_60_0, arg_60_1.snap, arg_60_1.expandedRatio, arg_60_1.selectedIndex)
end

local function var_0_44(arg_61_0, arg_61_1)
	var_0_1(arg_61_0)

	local var_61_0 = arg_61_0:getParent()

	if var_61_0 and var_61_0.CurrentVideoName ~= arg_61_1 then
		var_61_0.CurrentVideoName = arg_61_1

		if Dvar.IBEGCHEFE("lui_br_blade_video_is_encrypted") and arg_61_1 == Dvar.DHEEJCCJBH("NKNPQRNMST") or arg_61_0._isVideoEncrypted then
			Engine.BIFAAAECJJ(arg_61_1)
		else
			Engine.DFCGFCGBFD(arg_61_1)
		end

		arg_61_0:Wait(10).onComplete = function()
			arg_61_0.Cinematic:SetAlpha(1, 0)
		end
	end
end

local function var_0_45(arg_63_0, arg_63_1, arg_63_2)
	assert(arg_63_2.index)
	assert(arg_63_2.action and type(arg_63_2.action) == "function")
	assert(arg_63_2.videoName)
	assert(var_0_2[arg_63_2.bladeType])

	arg_63_0.PlayBladeVideo = var_0_44
	arg_63_0._index = arg_63_2.index
	arg_63_0._bladeCount = arg_63_2.bladeCount
	arg_63_0._layoutWidth = arg_63_2.layoutWidth
	arg_63_0._layoutHeight = arg_63_2.layoutHeight
	arg_63_0._bladeType = arg_63_2.bladeType
	arg_63_0._bladeKey = arg_63_2.bladeKey
	arg_63_0._name = var_0_9(arg_63_2.name, nil, arg_63_1)
	arg_63_0._description = var_0_9(arg_63_2.description, nil, arg_63_1)
	arg_63_0._videoName = var_0_9(arg_63_2.videoName, nil, arg_63_1)
	arg_63_0._isVideoEncrypted = var_0_9(arg_63_2.isVideoEncrypted, nil, arg_63_1)
	arg_63_0._keepAspect = var_0_9(arg_63_2.keepAspect, nil, arg_63_1)
	arg_63_0._playByDefault = var_0_9(arg_63_2.playByDefault, nil, arg_63_1)
	arg_63_0._imageName = var_0_9(arg_63_2.imageName, nil, arg_63_1)
	arg_63_0._backgroundImageName = var_0_9(arg_63_2.backgroundImageName, nil, arg_63_1)
	arg_63_0._titleLogo = var_0_9(arg_63_2.titleLogo, nil, arg_63_1)
	arg_63_0._liveEventLocation = var_0_9(arg_63_2.liveEventLocation, nil, arg_63_1)
	arg_63_0._verticalButtonOffset = var_0_9(arg_63_2.verticalButtonOffset, nil, arg_63_1)
	arg_63_0._transitionSwatch = var_0_9(arg_63_2.transitionSwatch, COLORS.black, arg_63_1)
	arg_63_0._bladeThemeAnim = var_0_9(arg_63_2.bladeThemeAnim, nil, arg_63_1)
	arg_63_0._friendsCountUpdate = var_0_9(arg_63_2.friendsCountUpdate, -1, arg_63_1)
	arg_63_0._friendsCountUpdateFunc = arg_63_2.friendsCountUpdate
	arg_63_0._action = arg_63_2.action
	arg_63_0._actionName = var_0_9(arg_63_2.actionName, "", arg_63_1)
	arg_63_0._preOrderLabelText = var_0_9(arg_63_2.preOrderLabelText, "", arg_63_1)
	arg_63_0._promptUpdate = var_0_10(arg_63_2.prompt)
	arg_63_0._secondaryAction = arg_63_2.secondaryAction
	arg_63_0._secondaryPromptUpdate = var_0_10(arg_63_2.secondaryPrompt)
	arg_63_0._tertiaryAction = arg_63_2.tertiaryAction
	arg_63_0._tertiaryPromptUpdate = var_0_10(arg_63_2.tertiaryPrompt)
	arg_63_0._blockedAction = arg_63_2.blockedAction
	arg_63_0._isBlockedUpdate = var_0_10(arg_63_2.isBlocked)
	arg_63_0._blockedPromptUpdate = var_0_10(arg_63_2.blockedPrompt)
	arg_63_0._installingAction = arg_63_2.installingAction
	arg_63_0._isInstallingUpdate = var_0_10(arg_63_2.isInstalling)
	arg_63_0._installingPromptUpdate = var_0_10(arg_63_2.installingPrompt)
	arg_63_0._newUpdate = var_0_10(arg_63_2.isNew)
	arg_63_0._timerLabel = arg_63_2.timerLabel
	arg_63_0._timerEnd = arg_63_2.timerEnd
	arg_63_0._actionSFX = arg_63_0.Trigger.actionSFX
	arg_63_0._gainFocusLeftSFX = var_0_9(arg_63_2.gainFocusLeftSFX, nil, arg_63_1)
	arg_63_0._gainFocusRightSFX = var_0_9(arg_63_2.gainFocusRightSFX, nil, arg_63_1)
	arg_63_0._classified = var_0_9(arg_63_2.classified, nil, arg_63_1)
	arg_63_0._showUpsellOverlay = var_0_9(arg_63_2.showUpsellOverlay, nil, arg_63_1)
	arg_63_0._showNGOverlay = var_0_9(arg_63_2.showNGOverlay, nil, arg_63_1)
	arg_63_0._showStoreOverlay = var_0_9(arg_63_2.showStoreOverlay, nil, arg_63_1)
	arg_63_0._isOnSale = var_0_9(arg_63_2.isOnSale, nil, arg_63_1)
	arg_63_0._useSmallerBlades = var_0_9(arg_63_2.useSmallerBlades, nil, arg_63_1)
	arg_63_0._buttonOverAnimation = var_0_9(arg_63_2.getButtonOverAnimation, "ButtonOver", arg_63_1)
	arg_63_0._smallButtonAnimation = var_0_9(arg_63_2.smallButtonAnimation, nil, arg_63_1)
	arg_63_0._isNGBlade = var_0_9(arg_63_2.isNGBlade, false, arg_63_1)
	arg_63_0._isWZBlade = var_0_9(arg_63_2.isWZBlade, false, arg_63_1)
	arg_63_0._baseVideoWidth = var_0_9(arg_63_2.baseVideoWidth, nil, arg_63_1)
	arg_63_0._baseVideoHeight = var_0_9(arg_63_2.baseVideoHeight, nil, arg_63_1)
	arg_63_0._buttonListData = var_0_9(arg_63_2.buttonListData, false, arg_63_1)

	local var_63_0 = arg_63_0._bladeKey ~= MAIN_MENU.BladeKeys.VG or arg_63_0._bladeKey == MAIN_MENU.BladeKeys.VG and CONDITIONS.IsVanguardDeeplinkEnabled()

	if arg_63_0._buttonListData and var_63_0 then
		local var_63_1 = LUI.UIVerticalList.new()
		local var_63_2 = arg_63_0:getWidth()

		var_63_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 30 * _1080p, 98 * _1080p)

		var_63_1.id = "list"
		var_63_1.selectedIndex = 1
		var_63_1.buttons = {}

		var_63_1:SetSpacing(1 * _1080p)
		arg_63_0.InlineList:addElement(var_63_1)

		arg_63_0.list = var_63_1

		for iter_63_0, iter_63_1 in ipairs(arg_63_0._buttonListData) do
			local var_63_3 = MenuBuilder.BuildRegisteredType("WZBladeButton", {
				controllerIndex = arg_63_1
			})

			var_63_3.id = "Button" .. tostring(iter_63_0)
			var_63_3._buttonKey = iter_63_0
			var_63_3._videoName = var_0_9(iter_63_1.videoName, nil, arg_63_1)
			var_63_3._backgroundImageName = var_0_9(iter_63_1.backgroundImageName, nil, arg_63_1)
			var_63_3._installData = iter_63_1.installData
			var_63_3._buttonAction = iter_63_1.buttonAction
			var_63_3._isBlocked = iter_63_1.isBlocked
			var_63_3._shouldInstall = iter_63_1.shouldInstall
			var_63_3._isButtonBlocked = iter_63_1.isButtonBlocked
			var_63_3._videoVerticalOffset = var_0_9(iter_63_1.videoVerticalOffset, 0, arg_63_1)
			var_63_3._bladeIndex = arg_63_0._index
			var_63_3._name = var_0_9(iter_63_1.name, "", arg_63_1)

			var_63_3:SetText(var_63_3._name)
			var_63_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 38 * _1080p)
			var_63_3:SetIsDisabled(var_63_3._shouldInstall and var_63_3._shouldInstall())

			if var_63_3._installData then
				var_63_3:SetDownloadIconVisibility(var_63_3._installData().state ~= ContentProgressState.INSTALLED)
			end

			arg_63_0.list.buttons[iter_63_0] = var_63_3

			if not CONDITIONS.IsVanguardArenaDisabled() then
				arg_63_0.list:addElement(var_63_3)
			elseif CONDITIONS.IsVanguardArenaDisabled() and iter_63_1.name ~= Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ARENA_VG") then
				arg_63_0.list:addElement(var_63_3)
			end

			if var_0_9(iter_63_1.isDefaultButton, false, arg_63_1) then
				var_63_1:SetDefaultFocus(var_63_3._buttonKey)
			end

			if arg_63_0._bladeThemeAnim ~= nil then
				ACTIONS.AnimateSequence(var_63_3, arg_63_0._bladeThemeAnim)
			end

			var_63_3:addEventHandler("button_over", function(arg_64_0, arg_64_1)
				local var_64_0 = arg_64_1.controller or arg_63_1
				local var_64_1 = arg_64_0._isButtonBlocked and arg_64_0._isButtonBlocked(var_64_0)

				if var_64_1 then
					local var_64_2 = var_0_8(var_64_1, "label")

					var_0_18(arg_63_0, MAIN_MENU.BladeStates.Blocked, var_64_2)

					arg_63_0._disableBlockedStateRefresh = true

					arg_64_0:SetIsDisabled(true)
				else
					arg_63_0._currentState = MAIN_MENU.BladeStates.Neutral
					arg_63_0._disableBlockedStateRefresh = false

					arg_64_0:SetIsDisabled(false)

					if arg_63_0._selectedIndex == arg_64_0._bladeIndex then
						if arg_63_0._selected == false then
							var_0_11(arg_63_0, var_64_0)
						end

						local var_64_3 = arg_64_0._videoName

						if var_64_3 then
							arg_63_0._videoVerticalOffset = arg_64_0._videoVerticalOffset

							arg_63_0:PlayBladeVideo(var_64_3)
						end

						arg_63_0:dispatchEventToParent({
							name = "main_menu_background_image_update",
							imageName = arg_64_0._backgroundImageName
						})
					end

					arg_63_0.list.selectedIndex = arg_64_0._buttonKey

					var_0_22(arg_63_0, arg_64_0)
					arg_64_0:RefreshDisabledAnimation()
					arg_63_0.InstallStatus:Disable()

					if arg_64_0._shouldInstall and arg_64_0._shouldInstall() then
						arg_63_0.InstallStatus:Refresh(arg_64_0._installData(), true)
						arg_64_0:SetIsDisabled(true)
					end
				end

				arg_63_0.DisableOverlay:RefreshState(arg_63_0._currentState, arg_63_0._stateParameters)

				for iter_64_0, iter_64_1 in ipairs(arg_63_0.list.buttons) do
					if iter_64_1 ~= arg_64_0 then
						iter_64_1._lastState = "ButtonUp"

						WZWIP.AnimateThemeElement(iter_64_1, "ButtonUp")
					end
				end
			end)
			var_63_3:addEventHandler("button_up", function(arg_65_0, arg_65_1)
				arg_65_0:RefreshDisabledAnimation()
			end)
			var_63_3:addEventHandler("button_action", function(arg_66_0, arg_66_1)
				local var_66_0 = arg_63_0:GetCurrentMenu()

				if not arg_66_0._isDisabled then
					arg_66_0._buttonAction(var_66_0, arg_66_1.controller)
				end
			end)
		end

		local var_63_4 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

		arg_63_0:SubscribeToModel(var_63_4:GetModel(arg_63_1), function()
			arg_63_0._partyCount = var_63_4:GetValue(arg_63_1)

			var_0_24(arg_63_0)
		end)
	end

	arg_63_0._stateParameters = {}

	if arg_63_0._smallButtonAnimation then
		ACTIONS.AnimateSequence(arg_63_0.Button, arg_63_0._smallButtonAnimation)
	end

	if Dvar.IBEGCHEFE("blm_messaging") and (not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_63_1)) then
		ACTIONS.AnimateSequence(arg_63_0, "BLM")
	end

	if arg_63_0._bladeThemeAnim ~= nil then
		ACTIONS.AnimateSequence(arg_63_0, arg_63_0._bladeThemeAnim)
	end

	arg_63_0.Trigger:setGainFocusAllSFX(nil)

	arg_63_0.Trigger.actionSFX = nil

	if not arg_63_0._buttonListData or arg_63_0._bladeKey == MAIN_MENU.BladeKeys.VG and not CONDITIONS.IsVanguardDeeplinkEnabled() then
		arg_63_0.Trigger:addEventHandler("button_action", function(arg_68_0, arg_68_1)
			var_0_15(arg_63_0, arg_68_1.controller)

			return false
		end)
		arg_63_0.WZOptionButton:addEventHandler("button_action", function(arg_69_0, arg_69_1)
			var_0_15(arg_63_0, arg_69_1.controller)

			return false
		end)
	end

	arg_63_0.Trigger:addEventHandler("button_over", function(arg_70_0, arg_70_1)
		local var_70_0 = arg_70_1.controller or arg_63_1

		if arg_70_1.focusType ~= FocusType.MenuFlow then
			var_0_11(arg_63_0, var_70_0)
		end
	end)
	arg_63_0:addEventHandler("selection_state_updated", var_0_43)

	arg_63_0.refreshTimer = LUI.UITimer.new({
		event = "perpetually_refreshed_state_tick",
		interval = var_0_3
	})

	arg_63_0:addElement(arg_63_0.refreshTimer)
	arg_63_0:addEventHandler("perpetually_refreshed_state_tick", function()
		var_0_29(arg_63_0, arg_63_1)

		return true
	end)
	var_0_29(arg_63_0, arg_63_1)
	var_0_40(arg_63_0, arg_63_1)
	arg_63_0:registerEventHandler("refresh_friends_counts", function(arg_72_0, arg_72_1)
		if arg_72_0._friendsCountUpdateFunc then
			local var_72_0 = arg_72_1.controller
			local var_72_1 = arg_72_1.friendsData

			arg_72_0._friendsCountUpdate = arg_72_0._friendsCountUpdateFunc(var_72_0, var_72_1)

			if arg_72_0._friendsCountUpdate then
				if arg_72_0._friendsCountUpdate == -1 then
					arg_72_0.WZFriendCount:SetAlpha(0)
				else
					arg_72_0.WZFriendCount:SetAlpha(1)

					local var_72_2 = tostring(arg_72_0._friendsCountUpdate)

					arg_72_0.WZFriendCount:SetFriendCount(var_72_2)
				end
			end
		end
	end)
	arg_63_0.WZWipNGSeasonCount:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", SEASON.GetCurrentSeasonDisplayNum())))

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_63_0, "WZWipSetup")

		local var_63_5

		if CONDITIONS.IsT9ZombieFreeTrialEnabled() then
			var_63_5 = "LUA_MENU/WZ_EVENT_PLAYLIST_CH2_ZM_NAME"
		end

		if arg_63_0._bladeKey == MAIN_MENU.BladeKeys.BuyVG then
			var_63_5 = "LUA_MENU/PURCHASE_ACTION"

			if CONDITIONS.IsVaguardTrialEnabled() then
				var_63_5 = "LUA_MENU/FREE_TRIAL"
			end
		elseif arg_63_0._bladeKey == MAIN_MENU.BladeKeys.BuyMW then
			var_63_5 = "LUA_MENU/PURCHASE_ACTION"
		elseif arg_63_0._bladeKey == MAIN_MENU.BladeKeys.BuyNG then
			arg_63_0:addEventHandler("update_cortez_blade_anim", function(arg_73_0, arg_73_1)
				var_0_0(arg_73_0, arg_63_1, arg_63_0._bladeKey)
			end)
			var_0_0(arg_63_0, arg_63_1, arg_63_0._bladeKey)
		end

		if var_63_5 ~= nil then
			arg_63_0.WZWipPurchaseMsgBladeUp:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_63_5)))
		end
	end

	if LUI.FlowManager.IsInStack("MainMenu") and not LUI.FlowManager.GetScopedData("MainMenu").streamerCreated then
		local var_63_6
		local var_63_7 = LUI.UIImage.new()

		var_63_7.id = "Spinner"

		var_63_7:setImage(RegisterMaterial("spinner_loading"), 0)
		var_63_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 522, _1080p * 532)
		arg_63_0:addElement(var_63_7)

		arg_63_0.Spinner = var_63_7
		arg_63_0:Wait(3500).onComplete = function()
			arg_63_0.Spinner:SetAlpha(0)
		end
	end

	arg_63_0:registerEventHandler("gamepad_button", function(arg_75_0, arg_75_1)
		if not arg_75_1.down and (arg_75_1.button == "up" or arg_75_1.button == "down") and arg_63_0.list and arg_63_0._selected and not arg_63_0.list:isInFocus() then
			arg_63_0.list:processEvent({
				name = "gain_focus"
			})
		end
	end)
	arg_63_0:registerEventHandler("vg_reveal_event_live", function(arg_76_0, arg_76_1)
		if arg_76_0._isWZBlade and CONDITIONS.IsVanguardRevealEventActive() and CONDITIONS.IsVanguardRevealEventLive() and arg_76_0._isSelectedIndex then
			arg_76_0.VanguardRevealLiveEvent:SetAlpha(1)
		end
	end)
	var_0_13(arg_63_0)
end

function MainMenuBlade(arg_77_0, arg_77_1)
	local var_77_0 = LUI.UIElement.new()

	var_77_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 1080 * _1080p)

	var_77_0.id = "MainMenuBlade"
	var_77_0._animationSets = var_77_0._animationSets or {}
	var_77_0._sequences = var_77_0._sequences or {}

	local var_77_1 = arg_77_1 and arg_77_1.controllerIndex

	if not var_77_1 and not Engine.DDJFBBJAIG() then
		var_77_1 = var_77_0:getRootController()
	end

	assert(var_77_1)

	local var_77_2 = var_77_0
	local var_77_3
	local var_77_4 = MenuBuilder.BuildRegisteredType("MainMenuButton", {
		controllerIndex = var_77_1
	})

	var_77_4.id = "Button"

	var_77_4.Text:setText("", 0)
	var_77_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -25, _1080p * 25)
	var_77_0:addElement(var_77_4)

	var_77_0.Button = var_77_4

	local var_77_5
	local var_77_6 = LUI.UIImage.new()

	var_77_6.id = "Underlay"

	var_77_6:SetRGBFromInt(0, 0)
	var_77_0:addElement(var_77_6)

	var_77_0.Underlay = var_77_6

	local var_77_7
	local var_77_8 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_77_1
	})

	var_77_8.id = "Cinematic"

	var_77_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, 0, 0)
	var_77_0:addElement(var_77_8)

	var_77_0.Cinematic = var_77_8

	local var_77_9
	local var_77_10 = LUI.UIImage.new()

	var_77_10.id = "Image"

	var_77_10:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -600, _1080p * 600, 0, 0)
	var_77_0:addElement(var_77_10)

	var_77_0.Image = var_77_10

	local var_77_11
	local var_77_12 = LUI.UIImage.new()

	var_77_12.id = "Overlay"

	var_77_12:SetRGBFromInt(0, 0)
	var_77_0:addElement(var_77_12)

	var_77_0.Overlay = var_77_12

	local var_77_13
	local var_77_14 = LUI.UIImage.new()

	var_77_14.id = "BlackoutImage"

	var_77_14:SetRGBFromInt(0, 0)
	var_77_14:SetAlpha(0, 0)
	var_77_0:addElement(var_77_14)

	var_77_0.BlackoutImage = var_77_14

	local var_77_15
	local var_77_16 = MenuBuilder.BuildRegisteredType("CRMLiveEventBladeInfo", {
		controllerIndex = var_77_1
	})

	var_77_16.id = "LiveEventInfo"

	var_77_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -156, _1080p * 156, _1080p * -171, _1080p * -95)
	var_77_0:addElement(var_77_16)

	var_77_0.LiveEventInfo = var_77_16

	local var_77_17
	local var_77_18 = LUI.UIImage.new()

	var_77_18.id = "TextBackground"

	var_77_18:SetRGBFromTable(SWATCHES.MainMenu.ButtonTextBG, 0)
	var_77_18:SetAlpha(0.75, 0)
	var_77_18:SetPixelGridEnabled(true)
	var_77_18:SetPixelGridContrast(0.5, 0)
	var_77_18:SetPixelGridBlockWidth(2, 0)
	var_77_18:SetPixelGridBlockHeight(2, 0)
	var_77_18:SetPixelGridGutterWidth(1, 0)
	var_77_18:SetPixelGridGutterHeight(1, 0)
	var_77_18:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -43, _1080p * -62, _1080p * 18)
	var_77_0:addElement(var_77_18)

	var_77_0.TextBackground = var_77_18

	local var_77_19
	local var_77_20 = LUI.UIStyledText.new()

	var_77_20.id = "Text"

	var_77_20:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_77_20:setText("", 0)
	var_77_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_20:SetAlignment(LUI.Alignment.Left)
	var_77_20:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_77_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 16, _1080p * -66, _1080p * -40, _1080p * -4)
	var_77_0:addElement(var_77_20)

	var_77_0.Text = var_77_20

	local var_77_21
	local var_77_22 = LUI.UIImage.new()

	var_77_22.id = "WZOptionButtonFUI"

	var_77_22:SetAlpha(0, 0)
	var_77_22:setImage(RegisterMaterial("ui_mp_br_frontend_button_fui_ch2"), 0)
	var_77_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -268, _1080p * -138, _1080p * 70, _1080p * 222)
	var_77_0:addElement(var_77_22)

	var_77_0.WZOptionButtonFUI = var_77_22

	local var_77_23
	local var_77_24 = MenuBuilder.BuildRegisteredType("WZBladesFriendCount", {
		controllerIndex = var_77_1
	})

	var_77_24.id = "WZFriendCount"

	var_77_24:SetAlpha(0, 0)
	var_77_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -156, _1080p * 156, _1080p * -208, _1080p * -176)
	var_77_0:addElement(var_77_24)

	var_77_0.WZFriendCount = var_77_24

	local var_77_25
	local var_77_26 = LUI.UIImage.new()

	var_77_26.id = "Stripe"

	var_77_26:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_77_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -12, _1080p * 12, _1080p * 472, _1080p * 476)
	var_77_0:addElement(var_77_26)

	var_77_0.Stripe = var_77_26

	local var_77_27
	local var_77_28 = LUI.UIImage.new()

	var_77_28.id = "TitleLogo"

	var_77_28:SetScale(-0.2, 0)
	var_77_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 257, _1080p * 453)
	var_77_0:addElement(var_77_28)

	var_77_0.TitleLogo = var_77_28

	local var_77_29
	local var_77_30 = LUI.UIImage.new()

	var_77_30.id = "ButtonDescriptionBG"

	var_77_30:SetRGBFromInt(0, 0)
	var_77_30:SetAlpha(0.4, 0)
	var_77_30:SetPixelGridEnabled(true)
	var_77_30:SetPixelGridContrast(0.5, 0)
	var_77_30:SetPixelGridBlockWidth(2, 0)
	var_77_30:SetPixelGridBlockHeight(2, 0)
	var_77_30:SetPixelGridGutterWidth(1, 0)
	var_77_30:SetPixelGridGutterHeight(1, 0)
	var_77_30:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_77_30:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -43, _1080p * 18, _1080p * 174)
	var_77_0:addElement(var_77_30)

	var_77_0.ButtonDescriptionBG = var_77_30

	local var_77_31
	local var_77_32 = LUI.UIStyledText.new()

	var_77_32.id = "ButtonDescription"

	var_77_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_77_32:setText("", 0)
	var_77_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_77_32:SetAlignment(LUI.Alignment.Left)
	var_77_32:SetDecodeUpdatesPerLetter(4)
	var_77_32:SetDecodeUseSystemTime(false)
	var_77_32:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 45, _1080p * -95, _1080p * 26, _1080p * 44)
	var_77_0:addElement(var_77_32)

	var_77_0.ButtonDescription = var_77_32

	local var_77_33
	local var_77_34 = LUI.UIImage.new()

	var_77_34.id = "Mask"

	var_77_34:setImage(RegisterMaterial("stencil_mask"), 0)
	var_77_34:SetAnchorsAndPosition(0.5, 0.5, 0, 0, 0, 0, _1080p * -4, _1080p * 4)
	var_77_0:addElement(var_77_34)

	var_77_0.Mask = var_77_34

	local var_77_35

	if CONDITIONS.AlwaysFalse() then
		local var_77_36 = {
			borderThicknessLeft = _1080p * 2,
			borderThicknessRight = _1080p * 2,
			borderThicknessTop = _1080p * 2,
			borderThicknessBottom = _1080p * 2
		}
		local var_77_37 = LUI.UIBorder.new(var_77_36)

		var_77_37.id = "Border"

		var_77_37:SetRGBFromTable(SWATCHES.BRMapItemColor.mapItemColor_5, 0)
		var_77_37:SetBorderThicknessLeft(_1080p * 2, 0)
		var_77_37:SetBorderThicknessRight(_1080p * 2, 0)
		var_77_37:SetBorderThicknessTop(_1080p * 2, 0)
		var_77_37:SetBorderThicknessBottom(_1080p * 2, 0)
		var_77_0:addElement(var_77_37)

		var_77_0.Border = var_77_37
	end

	local var_77_38

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		var_77_38 = LUI.UIStyledText.new()
		var_77_38.id = "ButtonDescriptionIGR"

		var_77_38:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
		var_77_38:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BONUS_TIP"), 0)
		var_77_38:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_77_38:SetAlignment(LUI.Alignment.Left)
		var_77_38:SetDecodeUpdatesPerLetter(4)
		var_77_38:SetDecodeUseSystemTime(false)
		var_77_38:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 108, _1080p * 425, _1080p * 95, _1080p * 119)
		var_77_0:addElement(var_77_38)

		var_77_0.ButtonDescriptionIGR = var_77_38
	end

	local var_77_39

	if CONDITIONS.IsNewGameAvailableNowMessageActive() then
		var_77_39 = LUI.UIStyledText.new()
		var_77_39.id = "NewGameNowAvailableMessage"

		var_77_39:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		var_77_39:SetAlpha(0, 0)
		var_77_39:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CORTEZ_AVAILABLE_NOW"), 0)
		var_77_39:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_77_39:SetAlignment(LUI.Alignment.Center)
		var_77_39:SetDecodeUpdatesPerLetter(4)
		var_77_39:SetDecodeUseSystemTime(false)
		var_77_39:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -400, _1080p * 400, _1080p * 694, _1080p * 730)
		var_77_0:addElement(var_77_39)

		var_77_0.NewGameNowAvailableMessage = var_77_39
	end

	local var_77_40

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		var_77_40 = LUI.UIImage.new()
		var_77_40.id = "IGRBoostIcon"

		var_77_40:setImage(RegisterMaterial("icon_xp"), 0)
		var_77_40:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 41, _1080p * 99, _1080p * 96, _1080p * 154)
		var_77_0:addElement(var_77_40)

		var_77_0.IGRBoostIcon = var_77_40
	end

	local var_77_41
	local var_77_42 = MenuBuilder.BuildRegisteredType("MainMenuBladeUpsellOverlay", {
		controllerIndex = var_77_1
	})

	var_77_42.id = "UpsellOverlay"

	var_77_42:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_77_0:addElement(var_77_42)

	var_77_0.UpsellOverlay = var_77_42

	local var_77_43
	local var_77_44 = MenuBuilder.BuildRegisteredType("MainMenuBladeStoreOverlay", {
		controllerIndex = var_77_1
	})

	var_77_44.id = "StoreOverlay"

	var_77_44:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_77_0:addElement(var_77_44)

	var_77_0.StoreOverlay = var_77_44

	local var_77_45
	local var_77_46 = MenuBuilder.BuildRegisteredType("MainMenuBladeNGOverlay", {
		controllerIndex = var_77_1
	})

	var_77_46.id = "NGOverlay"

	var_77_46.ButtonDescription:setText(Engine.CBBHFCGDIC("LUA_MENU/NG_DESC"), 0)
	var_77_46:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, 0, 0)
	var_77_0:addElement(var_77_46)

	var_77_0.NGOverlay = var_77_46

	local var_77_47
	local var_77_48 = MenuBuilder.BuildRegisteredType("MainMenuBladeDisableOverlay", {
		controllerIndex = var_77_1
	})

	var_77_48.id = "DisableOverlay"

	var_77_48:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -252, _1080p * 252, 0, 0)
	var_77_0:addElement(var_77_48)

	var_77_0.DisableOverlay = var_77_48

	local var_77_49
	local var_77_50 = MenuBuilder.BuildRegisteredType("MainMenuButton", {
		controllerIndex = var_77_1
	})

	var_77_50.id = "Trigger"

	var_77_50:SetAlpha(0, 0)
	var_77_50.Text:setText("", 0)
	var_77_50:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_77_0:addElement(var_77_50)

	var_77_0.Trigger = var_77_50

	local var_77_51
	local var_77_52 = MenuBuilder.BuildRegisteredType("WZBladeButton", {
		controllerIndex = var_77_1
	})

	var_77_52.id = "WZOptionButton"

	var_77_52:SetAlpha(0, 0)
	var_77_52.Text:SetLeft(_1080p * 20, 0)
	var_77_52.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE_ACTION")), 0)
	var_77_52.Text:SetAlignment(LUI.Alignment.Center)
	var_77_52:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 85, _1080p * 129)
	var_77_0:addElement(var_77_52)

	var_77_0.WZOptionButton = var_77_52

	local var_77_53
	local var_77_54 = LUI.UIText.new()

	var_77_54.id = "BLMTitle"

	var_77_54:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_77_54:SetAlpha(0, 0)
	var_77_54:setText("", 0)
	var_77_54:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_54:SetAlignment(LUI.Alignment.Center)
	var_77_54:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 116, _1080p * 186)
	var_77_0:addElement(var_77_54)

	var_77_0.BLMTitle = var_77_54

	local var_77_55
	local var_77_56 = LUI.UIText.new()

	var_77_56.id = "BLMDesc"

	var_77_56:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_77_56:SetAlpha(0, 0)
	var_77_56:setText("", 0)
	var_77_56:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_56:SetAlignment(LUI.Alignment.Center)
	var_77_56:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 194, _1080p * 224)
	var_77_0:addElement(var_77_56)

	var_77_0.BLMDesc = var_77_56

	local var_77_57
	local var_77_58 = MenuBuilder.BuildRegisteredType("MainMenuBladeList", {
		controllerIndex = var_77_1
	})

	var_77_58.id = "InlineList"

	var_77_58:SetAlpha(0, 0)
	var_77_58:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -233, _1080p * 233, _1080p * 54, _1080p * 244)
	var_77_0:addElement(var_77_58)

	var_77_0.InlineList = var_77_58

	local var_77_59
	local var_77_60 = MenuBuilder.BuildRegisteredType("WZBladesNewNotif", {
		controllerIndex = var_77_1
	})

	var_77_60.id = "WZBladesNewNotif"

	var_77_60:SetScale(-0.25, 0)
	var_77_60.WZWipButtonOver:SetAlpha(0, 0)
	var_77_60.Text:SetLeft(_1080p * 20, 0)
	var_77_60.Text:SetAlpha(0, 0)
	var_77_60.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW_CAPS")), 0)
	var_77_60.Text:SetAlignment(LUI.Alignment.Center)
	var_77_60:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -205, _1080p * -77, _1080p * 225, _1080p * 257)
	var_77_0:addElement(var_77_60)

	var_77_0.WZBladesNewNotif = var_77_60

	local var_77_61
	local var_77_62 = MenuBuilder.BuildRegisteredType("InstallStatus", {
		controllerIndex = var_77_1
	})

	var_77_62.id = "InstallStatus"

	var_77_62:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -350, _1080p * 350, _1080p * 478, _1080p * 603)
	var_77_0:addElement(var_77_62)

	var_77_0.InstallStatus = var_77_62

	local var_77_63
	local var_77_64 = LUI.UIStyledText.new()

	var_77_64.id = "BlockedLabel"

	var_77_64:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_77_64:SetAlpha(0, 0)
	var_77_64:setText("", 0)
	var_77_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_77_64:SetWordWrap(false)
	var_77_64:SetAlignment(LUI.Alignment.Left)
	var_77_64:SetVerticalAlignment(LUI.Alignment.Center)
	var_77_64:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_77_64:SetUseEllipses(ELLIPSES.enabled)
	var_77_64:SetStartupDelay(1000)
	var_77_64:SetLineHoldTime(400)
	var_77_64:SetAnimMoveTime(150)
	var_77_64:SetAnimMoveSpeed(50)
	var_77_64:SetEndDelay(1000)
	var_77_64:SetCrossfadeTime(400)
	var_77_64:SetFadeInTime(300)
	var_77_64:SetFadeOutTime(300)
	var_77_64:SetMaxVisibleLines(1)
	var_77_64:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 156, _1080p * 837, _1080p * 855)
	var_77_0:addElement(var_77_64)

	var_77_0.BlockedLabel = var_77_64

	local var_77_65

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_77_65 = LUI.UIImage.new()
		var_77_65.id = "WZWipColdWarFUI"

		var_77_65:SetAlpha(0, 0)
		var_77_65:setImage(RegisterMaterial("ui_mp_br_blade_logo_FUI"), 0)
		var_77_65:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -72, _1080p * 204, _1080p * 181, _1080p * 225)
		var_77_0:addElement(var_77_65)

		var_77_0.WZWipColdWarFUI = var_77_65
	end

	local var_77_66
	local var_77_67 = LUI.UIStyledText.new()

	var_77_67.id = "WZWipNGSeasonCount"

	var_77_67:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_77_67:SetAlpha(0, 0)
	var_77_67:setText("", 0)
	var_77_67:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_67:SetTracking(8 * _1080p, 0)
	var_77_67:SetAlignment(LUI.Alignment.Center)
	var_77_67:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 446, _1080p * 464)
	var_77_0:addElement(var_77_67)

	var_77_0.WZWipNGSeasonCount = var_77_67

	local var_77_68

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_77_68 = LUI.UIImage.new()
		var_77_68.id = "Lock"

		var_77_68:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_77_68:SetAlpha(0, 0)
		var_77_68:SetScale(-0.25, 0)
		var_77_68:setImage(RegisterMaterial("icon_lock"), 0)
		var_77_68:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -18, _1080p * 32, _1080p * 455, _1080p * 505)
		var_77_0:addElement(var_77_68)

		var_77_0.Lock = var_77_68
	end

	local var_77_69
	local var_77_70 = LUI.UIStyledText.new()

	var_77_70.id = "WZWipPurchaseMsgBladeUp"

	var_77_70:SetRGBFromInt(15855855, 0)
	var_77_70:setText("", 0)
	var_77_70:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_77_70:SetWordWrap(false)
	var_77_70:SetAlignment(LUI.Alignment.Center)
	var_77_70:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 90, _1080p * 126)
	var_77_0:addElement(var_77_70)

	var_77_0.WZWipPurchaseMsgBladeUp = var_77_70

	local var_77_71

	if CONDITIONS.IsVanguardRevealEventActive() then
		var_77_71 = MenuBuilder.BuildRegisteredType("VanguardRevealLiveEvent", {
			controllerIndex = var_77_1
		})
		var_77_71.id = "VanguardRevealLiveEvent"

		var_77_71:SetAlpha(0, 0)
		var_77_71.Background:SetRGBFromInt(16777215, 0)
		var_77_71.TitleGlow:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/VG_REVEAL_BOV"), 0)
		var_77_71.Title:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/VG_REVEAL_BOV"), 0)
		var_77_71:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -370, _1080p * 370, _1080p * 529, _1080p * 593)
		var_77_0:addElement(var_77_71)

		var_77_0.VanguardRevealLiveEvent = var_77_71
	end

	local var_77_72
	local var_77_73 = LUI.UIStyledText.new()

	var_77_73.id = "AlphaBetaCountdown"

	var_77_73:SetRGBFromInt(15279599, 0)
	var_77_73:SetAlpha(0, 0)
	var_77_73:setText("", 0)
	var_77_73:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_73:SetAlignment(LUI.Alignment.Center)
	var_77_73:SetVerticalAlignment(LUI.Alignment.Center)
	var_77_73:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 512, _1080p * 534)
	var_77_0:addElement(var_77_73)

	var_77_0.AlphaBetaCountdown = var_77_73

	local var_77_74

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_75 = LUI.UIImage.new()

		var_77_75.id = "SepRight"

		var_77_75:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_77_75:SetAlpha(0.2, 0)
		var_77_75:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 1, _1080p * 2, _1080p * -285, _1080p * 15)
		var_77_0:addElement(var_77_75)

		var_77_0.SepRight = var_77_75
	end

	local var_77_76
	local var_77_77 = LUI.UIStyledText.new()

	var_77_77.id = "LiveTag"

	var_77_77:SetRGBFromInt(16711680, 0)
	var_77_77:SetAlpha(0, 0)
	var_77_77:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CANTEEN/LIVE_TAG_ALPHA_BETA")), 0)
	var_77_77:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_77:SetWordWrap(false)
	var_77_77:SetAlignment(LUI.Alignment.Center)
	var_77_77:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -10, _1080p * 26)
	var_77_0:addElement(var_77_77)

	var_77_0.LiveTag = var_77_77

	local var_77_78
	local var_77_79 = LUI.UIImage.new()

	var_77_79.id = "newiconpulse"

	var_77_79:SetAlpha(0, 0)
	var_77_79:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
	var_77_79:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -135, _1080p * -105, _1080p * 285, _1080p * 315)
	var_77_0:addElement(var_77_79)

	var_77_0.newiconpulse = var_77_79

	local var_77_80

	if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		var_77_80 = MenuBuilder.BuildRegisteredType("PreOrderBanner", {
			controllerIndex = var_77_1
		})
		var_77_80.id = "UpgradeLabel"

		var_77_80:SetAlpha(0, 0)
		var_77_80.UpgradeLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_ULTIMATE"), 0)
		var_77_80:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -203, _1080p * 210, _1080p * -337, _1080p * -307)
		var_77_0:addElement(var_77_80)

		var_77_0.UpgradeLabel = var_77_80
	end

	local var_77_81

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		var_77_81 = MenuBuilder.BuildRegisteredType("PreOrderBanner", {
			controllerIndex = var_77_1
		})
		var_77_81.id = "PreOrderLabel"

		var_77_81:SetAlpha(0, 0)
		var_77_81.Background:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		var_77_81.UpgradeLabel:setText(ToUpperCase(Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER")), 0)
		var_77_81:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -203, _1080p * 210, _1080p * -387, _1080p * -357)
		var_77_0:addElement(var_77_81)

		var_77_0.PreOrderLabel = var_77_81
	end

	local var_77_82
	local var_77_83 = LUI.UIStyledText.new()

	var_77_83.id = "WarzoneMaintenanceLabel"

	var_77_83:SetAlpha(0, 0)
	var_77_83:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ360/MAINTENANCE_MESSAGE"), 0)
	var_77_83:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_83:SetAlignment(LUI.Alignment.Center)
	var_77_83:SetVerticalAlignment(LUI.Alignment.Center)
	var_77_83:SetShadowMinDistance(-1, 0)
	var_77_83:SetShadowMaxDistance(1, 0)
	var_77_83:SetShadowRGBFromInt(0, 0)
	var_77_83:SetOutlineRGBFromInt(0, 0)
	var_77_83:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 787, _1080p * 811)
	var_77_0:addElement(var_77_83)

	var_77_0.WarzoneMaintenanceLabel = var_77_83

	local var_77_84
	local var_77_85 = LUI.UIStyledText.new()

	var_77_85.id = "CalloutLabel"

	var_77_85:SetAlpha(0, 0)
	var_77_85:setText("", 0)
	var_77_85:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_77_85:SetAlignment(LUI.Alignment.Center)
	var_77_85:SetVerticalAlignment(LUI.Alignment.Center)
	var_77_85:SetShadowMinDistance(-1, 0)
	var_77_85:SetShadowMaxDistance(1, 0)
	var_77_85:SetShadowRGBFromInt(0, 0)
	var_77_85:SetOutlineRGBFromInt(3223857, 0)
	var_77_85:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -252, _1080p * 248, _1080p * 528, _1080p * 568)
	var_77_0:addElement(var_77_85)

	var_77_0.CalloutLabel = var_77_85

	local function var_77_86()
		return
	end

	var_77_0._sequences.DefaultSequence = var_77_86

	local var_77_87
	local var_77_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_8:RegisterAnimationSequence("ButtonUp", var_77_88)

	local var_77_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_12:RegisterAnimationSequence("ButtonUp", var_77_89)

	local var_77_90 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("ButtonUp", var_77_90)

	local var_77_91 = {
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

	var_77_28:RegisterAnimationSequence("ButtonUp", var_77_91)

	local var_77_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_44:RegisterAnimationSequence("ButtonUp", var_77_92)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_93 = {
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

		var_77_65:RegisterAnimationSequence("ButtonUp", var_77_93)
	end

	local function var_77_94()
		var_77_8:AnimateSequence("ButtonUp")
		var_77_12:AnimateSequence("ButtonUp")
		var_77_26:AnimateSequence("ButtonUp")
		var_77_28:AnimateSequence("ButtonUp")
		var_77_44:AnimateSequence("ButtonUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("ButtonUp")
		end
	end

	var_77_0._sequences.ButtonUp = var_77_94

	local var_77_95
	local var_77_96 = {
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

	var_77_20:RegisterAnimationSequence("JP", var_77_96)

	local var_77_97 = {
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

	var_77_32:RegisterAnimationSequence("JP", var_77_97)

	local function var_77_98()
		var_77_20:AnimateSequence("JP")
		var_77_32:AnimateSequence("JP")
	end

	var_77_0._sequences.JP = var_77_98

	local var_77_99
	local var_77_100 = {
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

	var_77_67:RegisterAnimationSequence("AR", var_77_100)

	local function var_77_101()
		var_77_67:AnimateSequence("AR")
	end

	var_77_0._sequences.AR = var_77_101

	local var_77_102
	local var_77_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonTextBG
		}
	}

	var_77_18:RegisterAnimationSequence("Installed", var_77_103)

	local var_77_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		}
	}

	var_77_20:RegisterAnimationSequence("Installed", var_77_104)

	local function var_77_105()
		var_77_18:AnimateSequence("Installed")
		var_77_20:AnimateSequence("Installed")
	end

	var_77_0._sequences.Installed = var_77_105

	local var_77_106
	local var_77_107 = {
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

	var_77_32:RegisterAnimationSequence("CHSF", var_77_107)

	local function var_77_108()
		var_77_32:AnimateSequence("CHSF")
	end

	var_77_0._sequences.CHSF = var_77_108

	local var_77_109
	local var_77_110 = {
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

	var_77_20:RegisterAnimationSequence("ESandPT", var_77_110)

	local function var_77_111()
		var_77_20:AnimateSequence("ESandPT")
	end

	var_77_0._sequences.ESandPT = var_77_111

	local var_77_112
	local var_77_113 = {
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

	var_77_32:RegisterAnimationSequence("CHTR", var_77_113)

	local function var_77_114()
		var_77_32:AnimateSequence("CHTR")
	end

	var_77_0._sequences.CHTR = var_77_114

	local var_77_115
	local var_77_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_4:RegisterAnimationSequence("Accordion", var_77_116)

	local var_77_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_6:RegisterAnimationSequence("Accordion", var_77_117)

	local var_77_118 = {
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

	var_77_12:RegisterAnimationSequence("Accordion", var_77_118)

	local var_77_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("Accordion", var_77_119)

	local var_77_120 = {
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

	var_77_18:RegisterAnimationSequence("Accordion", var_77_120)

	local var_77_121 = {
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

	var_77_20:RegisterAnimationSequence("Accordion", var_77_121)

	local var_77_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_28:RegisterAnimationSequence("Accordion", var_77_122)

	local var_77_123 = {
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

	var_77_30:RegisterAnimationSequence("Accordion", var_77_123)

	local var_77_124 = {
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

	var_77_32:RegisterAnimationSequence("Accordion", var_77_124)

	local var_77_125 = {
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

	var_77_34:RegisterAnimationSequence("Accordion", var_77_125)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_126 = {
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

		var_77_38:RegisterAnimationSequence("Accordion", var_77_126)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_127 = {
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

		var_77_40:RegisterAnimationSequence("Accordion", var_77_127)
	end

	local var_77_128 = {
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

	var_77_48:RegisterAnimationSequence("Accordion", var_77_128)

	local function var_77_129()
		var_77_4:AnimateSequence("Accordion")
		var_77_6:AnimateSequence("Accordion")
		var_77_12:AnimateSequence("Accordion")
		var_77_16:AnimateSequence("Accordion")
		var_77_18:AnimateSequence("Accordion")
		var_77_20:AnimateSequence("Accordion")
		var_77_28:AnimateSequence("Accordion")
		var_77_30:AnimateSequence("Accordion")
		var_77_32:AnimateSequence("Accordion")
		var_77_34:AnimateSequence("Accordion")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_38:AnimateSequence("Accordion")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_40:AnimateSequence("Accordion")
		end

		var_77_48:AnimateSequence("Accordion")
	end

	var_77_0._sequences.Accordion = var_77_129

	local var_77_130
	local var_77_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_6:RegisterAnimationSequence("Shutter", var_77_131)

	local var_77_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_10:RegisterAnimationSequence("Shutter", var_77_132)

	local var_77_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("Shutter", var_77_133)

	local var_77_134 = {
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

	var_77_20:RegisterAnimationSequence("Shutter", var_77_134)

	local var_77_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_28:RegisterAnimationSequence("Shutter", var_77_135)

	local function var_77_136()
		var_77_6:AnimateSequence("Shutter")
		var_77_10:AnimateSequence("Shutter")
		var_77_16:AnimateSequence("Shutter")
		var_77_20:AnimateSequence("Shutter")
		var_77_28:AnimateSequence("Shutter")
	end

	var_77_0._sequences.Shutter = var_77_136

	local var_77_137
	local var_77_138 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_14:RegisterAnimationSequence("BLM", var_77_138)

	local var_77_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_18:RegisterAnimationSequence("BLM", var_77_139)

	local var_77_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_77_20:RegisterAnimationSequence("BLM", var_77_140)

	local var_77_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_30:RegisterAnimationSequence("BLM", var_77_141)

	local var_77_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_77_32:RegisterAnimationSequence("BLM", var_77_142)

	local function var_77_143()
		var_77_14:AnimateSequence("BLM")
		var_77_18:AnimateSequence("BLM")
		var_77_20:AnimateSequence("BLM")
		var_77_30:AnimateSequence("BLM")
		var_77_32:AnimateSequence("BLM")
	end

	var_77_0._sequences.BLM = var_77_143

	local var_77_144
	local var_77_145 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_14:RegisterAnimationSequence("ShowBLMMagma", var_77_145)

	local var_77_146 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_54:RegisterAnimationSequence("ShowBLMMagma", var_77_146)

	local var_77_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_56:RegisterAnimationSequence("ShowBLMMagma", var_77_147)

	local function var_77_148()
		var_77_14:AnimateSequence("ShowBLMMagma")
		var_77_54:AnimateSequence("ShowBLMMagma")
		var_77_56:AnimateSequence("ShowBLMMagma")
	end

	var_77_0._sequences.ShowBLMMagma = var_77_148

	local var_77_149
	local var_77_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_14:RegisterAnimationSequence("HideBLMMagma", var_77_150)

	local var_77_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_54:RegisterAnimationSequence("HideBLMMagma", var_77_151)

	local var_77_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_56:RegisterAnimationSequence("HideBLMMagma", var_77_152)

	local function var_77_153()
		var_77_14:AnimateSequence("HideBLMMagma")
		var_77_54:AnimateSequence("HideBLMMagma")
		var_77_56:AnimateSequence("HideBLMMagma")
	end

	var_77_0._sequences.HideBLMMagma = var_77_153

	local var_77_154

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_155 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 374
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 398
			}
		}

		var_77_38:RegisterAnimationSequence("IGRAlt", var_77_155)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_156 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 375
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 433
			}
		}

		var_77_40:RegisterAnimationSequence("IGRAlt", var_77_156)
	end

	local function var_77_157()
		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_38:AnimateSequence("IGRAlt")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_40:AnimateSequence("IGRAlt")
		end
	end

	var_77_0._sequences.IGRAlt = var_77_157

	local var_77_158
	local var_77_159 = {
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

	var_77_8:RegisterAnimationSequence("ButtonOver", var_77_159)

	local var_77_160 = {
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

	var_77_12:RegisterAnimationSequence("ButtonOver", var_77_160)

	local var_77_161 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_18:RegisterAnimationSequence("ButtonOver", var_77_161)

	local var_77_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_20:RegisterAnimationSequence("ButtonOver", var_77_162)

	local var_77_163 = {
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

	var_77_28:RegisterAnimationSequence("ButtonOver", var_77_163)

	local var_77_164 = {
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

	var_77_30:RegisterAnimationSequence("ButtonOver", var_77_164)

	local var_77_165 = {
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

	var_77_32:RegisterAnimationSequence("ButtonOver", var_77_165)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_166 = {
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

		var_77_65:RegisterAnimationSequence("ButtonOver", var_77_166)
	end

	local function var_77_167()
		var_77_8:AnimateSequence("ButtonOver")
		var_77_12:AnimateSequence("ButtonOver")
		var_77_18:AnimateSequence("ButtonOver")
		var_77_20:AnimateSequence("ButtonOver")
		var_77_28:AnimateSequence("ButtonOver")
		var_77_30:AnimateSequence("ButtonOver")
		var_77_32:AnimateSequence("ButtonOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("ButtonOver")
		end
	end

	var_77_0._sequences.ButtonOver = var_77_167

	local var_77_168
	local var_77_169 = {
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

	var_77_8:RegisterAnimationSequence("ButtonOverEnglish", var_77_169)

	local var_77_170 = {
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

	var_77_12:RegisterAnimationSequence("ButtonOverEnglish", var_77_170)

	local var_77_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_18:RegisterAnimationSequence("ButtonOverEnglish", var_77_171)

	local var_77_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_20:RegisterAnimationSequence("ButtonOverEnglish", var_77_172)

	local var_77_173 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("ButtonOverEnglish", var_77_173)

	local var_77_174 = {
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

	var_77_28:RegisterAnimationSequence("ButtonOverEnglish", var_77_174)

	local var_77_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_30:RegisterAnimationSequence("ButtonOverEnglish", var_77_175)

	local var_77_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_32:RegisterAnimationSequence("ButtonOverEnglish", var_77_176)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_177 = {
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

		var_77_65:RegisterAnimationSequence("ButtonOverEnglish", var_77_177)
	end

	local function var_77_178()
		var_77_8:AnimateSequence("ButtonOverEnglish")
		var_77_12:AnimateSequence("ButtonOverEnglish")
		var_77_18:AnimateSequence("ButtonOverEnglish")
		var_77_20:AnimateSequence("ButtonOverEnglish")
		var_77_26:AnimateSequence("ButtonOverEnglish")
		var_77_28:AnimateSequence("ButtonOverEnglish")
		var_77_30:AnimateSequence("ButtonOverEnglish")
		var_77_32:AnimateSequence("ButtonOverEnglish")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("ButtonOverEnglish")
		end
	end

	var_77_0._sequences.ButtonOverEnglish = var_77_178

	local var_77_179
	local var_77_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_4:RegisterAnimationSequence("AccordionRefresh", var_77_180)

	local var_77_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_6:RegisterAnimationSequence("AccordionRefresh", var_77_181)

	local var_77_182 = {
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

	var_77_12:RegisterAnimationSequence("AccordionRefresh", var_77_182)

	local var_77_183 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("AccordionRefresh", var_77_183)

	local var_77_184 = {
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

	var_77_18:RegisterAnimationSequence("AccordionRefresh", var_77_184)

	local var_77_185 = {
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

	var_77_20:RegisterAnimationSequence("AccordionRefresh", var_77_185)

	local var_77_186 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_24:RegisterAnimationSequence("AccordionRefresh", var_77_186)

	local var_77_187 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("AccordionRefresh", var_77_187)

	local var_77_188 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_28:RegisterAnimationSequence("AccordionRefresh", var_77_188)

	local var_77_189 = {
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

	var_77_30:RegisterAnimationSequence("AccordionRefresh", var_77_189)

	local var_77_190 = {
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

	var_77_32:RegisterAnimationSequence("AccordionRefresh", var_77_190)

	local var_77_191 = {
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

	var_77_34:RegisterAnimationSequence("AccordionRefresh", var_77_191)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_192 = {
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

		var_77_38:RegisterAnimationSequence("AccordionRefresh", var_77_192)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_193 = {
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

		var_77_40:RegisterAnimationSequence("AccordionRefresh", var_77_193)
	end

	local var_77_194 = {
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

	var_77_42:RegisterAnimationSequence("AccordionRefresh", var_77_194)

	local var_77_195 = {
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

	var_77_44:RegisterAnimationSequence("AccordionRefresh", var_77_195)

	local var_77_196 = {
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

	var_77_48:RegisterAnimationSequence("AccordionRefresh", var_77_196)

	local var_77_197 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("AccordionRefresh", var_77_197)

	local function var_77_198()
		var_77_4:AnimateSequence("AccordionRefresh")
		var_77_6:AnimateSequence("AccordionRefresh")
		var_77_12:AnimateSequence("AccordionRefresh")
		var_77_16:AnimateSequence("AccordionRefresh")
		var_77_18:AnimateSequence("AccordionRefresh")
		var_77_20:AnimateSequence("AccordionRefresh")
		var_77_24:AnimateSequence("AccordionRefresh")
		var_77_26:AnimateSequence("AccordionRefresh")
		var_77_28:AnimateSequence("AccordionRefresh")
		var_77_30:AnimateSequence("AccordionRefresh")
		var_77_32:AnimateSequence("AccordionRefresh")
		var_77_34:AnimateSequence("AccordionRefresh")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_38:AnimateSequence("AccordionRefresh")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_40:AnimateSequence("AccordionRefresh")
		end

		var_77_42:AnimateSequence("AccordionRefresh")
		var_77_44:AnimateSequence("AccordionRefresh")
		var_77_48:AnimateSequence("AccordionRefresh")
		var_77_52:AnimateSequence("AccordionRefresh")
	end

	var_77_0._sequences.AccordionRefresh = var_77_198

	local var_77_199
	local var_77_200 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("ARBladeOver", var_77_200)

	local var_77_201 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_22:RegisterAnimationSequence("ARBladeOver", var_77_201)

	local var_77_202 = {
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

	var_77_26:RegisterAnimationSequence("ARBladeOver", var_77_202)

	local var_77_203 = {
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

	var_77_28:RegisterAnimationSequence("ARBladeOver", var_77_203)

	local var_77_204 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("ARBladeOver", var_77_204)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_205 = {
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

		var_77_65:RegisterAnimationSequence("ARBladeOver", var_77_205)
	end

	local function var_77_206()
		var_77_16:AnimateSequence("ARBladeOver")
		var_77_22:AnimateSequence("ARBladeOver")
		var_77_26:AnimateSequence("ARBladeOver")
		var_77_28:AnimateSequence("ARBladeOver")
		var_77_52:AnimateSequence("ARBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("ARBladeOver")
		end
	end

	var_77_0._sequences.ARBladeOver = var_77_206

	local var_77_207
	local var_77_208 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("ARBladeUp", var_77_208)

	local var_77_209 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_22:RegisterAnimationSequence("ARBladeUp", var_77_209)

	local var_77_210 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_24:RegisterAnimationSequence("ARBladeUp", var_77_210)

	local var_77_211 = {
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

	var_77_26:RegisterAnimationSequence("ARBladeUp", var_77_211)

	local var_77_212 = {
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

	var_77_28:RegisterAnimationSequence("ARBladeUp", var_77_212)

	local var_77_213 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("ARBladeUp", var_77_213)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_214 = {
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

		var_77_65:RegisterAnimationSequence("ARBladeUp", var_77_214)
	end

	local function var_77_215()
		var_77_16:AnimateSequence("ARBladeUp")
		var_77_22:AnimateSequence("ARBladeUp")
		var_77_24:AnimateSequence("ARBladeUp")
		var_77_26:AnimateSequence("ARBladeUp")
		var_77_28:AnimateSequence("ARBladeUp")
		var_77_52:AnimateSequence("ARBladeUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("ARBladeUp")
		end
	end

	var_77_0._sequences.ARBladeUp = var_77_215

	local var_77_216
	local var_77_217 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("NewARBladeUp", var_77_217)

	local var_77_218 = {
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
			child = var_77_0.WZBladesNewNotif.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_77_0.WZBladesNewNotif.WZWipButtonOver
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			child = var_77_0.WZBladesNewNotif.Text
		}
	}

	var_77_60:RegisterAnimationSequence("NewARBladeUp", var_77_218)

	local var_77_219 = {
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

	var_77_79:RegisterAnimationSequence("NewARBladeUp", var_77_219)

	local function var_77_220()
		var_77_26:AnimateSequence("NewARBladeUp")
		var_77_60:AnimateSequence("NewARBladeUp")
		var_77_79:AnimateSequence("NewARBladeUp")
	end

	var_77_0._sequences.NewARBladeUp = var_77_220

	local var_77_221
	local var_77_222 = {
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
			child = var_77_0.WZBladesNewNotif.WZWipButtonOver
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_77_0.WZBladesNewNotif.Text
		}
	}

	var_77_60:RegisterAnimationSequence("NewARBladeOver", var_77_222)

	local var_77_223 = {
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

	var_77_79:RegisterAnimationSequence("NewARBladeOver", var_77_223)

	local function var_77_224()
		var_77_60:AnimateSequence("NewARBladeOver")
		var_77_79:AnimateSequence("NewARBladeOver")
	end

	var_77_0._sequences.NewARBladeOver = var_77_224

	local var_77_225
	local var_77_226 = {
		{
			value = 15327545,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_77_52:RegisterAnimationSequence("UpsellARBladeOver", var_77_226)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_227 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_68:RegisterAnimationSequence("UpsellARBladeOver", var_77_227)
	end

	local function var_77_228()
		var_77_52:AnimateSequence("UpsellARBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_68:AnimateSequence("UpsellARBladeOver")
		end
	end

	var_77_0._sequences.UpsellARBladeOver = var_77_228

	local function var_77_229()
		return
	end

	var_77_0._sequences.UpsellARBladeUp = var_77_229

	local var_77_230
	local var_77_231 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_77_231)

	local var_77_232 = {
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

	var_77_26:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_77_232)

	local var_77_233 = {
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

	var_77_28:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_77_233)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_234 = {
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

		var_77_65:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_77_234)
	end

	local var_77_235 = {
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

	var_77_67:RegisterAnimationSequence("ARBladeOverNoWZOptionButton", var_77_235)

	local function var_77_236()
		var_77_16:AnimateSequence("ARBladeOverNoWZOptionButton")
		var_77_26:AnimateSequence("ARBladeOverNoWZOptionButton")
		var_77_28:AnimateSequence("ARBladeOverNoWZOptionButton")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("ARBladeOverNoWZOptionButton")
		end

		var_77_67:AnimateSequence("ARBladeOverNoWZOptionButton")
	end

	var_77_0._sequences.ARBladeOverNoWZOptionButton = var_77_236

	local var_77_237
	local var_77_238 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_4:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_238)

	local var_77_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_6:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_239)

	local var_77_240 = {
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

	var_77_12:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_240)

	local var_77_241 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_241)

	local var_77_242 = {
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

	var_77_18:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_242)

	local var_77_243 = {
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

	var_77_20:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_243)

	local var_77_244 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_24:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_244)

	local var_77_245 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_245)

	local var_77_246 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_28:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_246)

	local var_77_247 = {
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

	var_77_30:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_247)

	local var_77_248 = {
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

	var_77_32:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_248)

	local var_77_249 = {
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

	var_77_34:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_249)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_250 = {
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

		var_77_38:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_250)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_251 = {
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

		var_77_40:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_251)
	end

	local var_77_252 = {
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

	var_77_42:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_252)

	local var_77_253 = {
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

	var_77_44:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_253)

	local var_77_254 = {
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

	var_77_48:RegisterAnimationSequence("AccordionRefreshNoWZOptionButton", var_77_254)

	local function var_77_255()
		var_77_4:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_6:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_12:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_16:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_18:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_20:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_24:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_26:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_28:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_30:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_32:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_34:AnimateSequence("AccordionRefreshNoWZOptionButton")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_38:AnimateSequence("AccordionRefreshNoWZOptionButton")
		end

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_40:AnimateSequence("AccordionRefreshNoWZOptionButton")
		end

		var_77_42:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_44:AnimateSequence("AccordionRefreshNoWZOptionButton")
		var_77_48:AnimateSequence("AccordionRefreshNoWZOptionButton")
	end

	var_77_0._sequences.AccordionRefreshNoWZOptionButton = var_77_255

	local function var_77_256()
		return
	end

	var_77_0._sequences.SetThemeColdWar = var_77_256

	local var_77_257
	local var_77_258 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_77_26:RegisterAnimationSequence("SetThemeMW", var_77_258)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_259 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_65:RegisterAnimationSequence("SetThemeMW", var_77_259)
	end

	local var_77_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_67:RegisterAnimationSequence("SetThemeMW", var_77_260)

	local function var_77_261()
		var_77_26:AnimateSequence("SetThemeMW")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("SetThemeMW")
		end

		var_77_67:AnimateSequence("SetThemeMW")
	end

	var_77_0._sequences.SetThemeMW = var_77_261

	local var_77_262
	local var_77_263 = {
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

	var_77_16:RegisterAnimationSequence("WZWipSetup", var_77_263)

	local var_77_264 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_77_20:RegisterAnimationSequence("WZWipSetup", var_77_264)

	local var_77_265 = {
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

	var_77_24:RegisterAnimationSequence("WZWipSetup", var_77_265)

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_77_266 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			}
		}

		var_77_38:RegisterAnimationSequence("WZWipSetup", var_77_266)
	end

	local var_77_267 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("WZWipSetup", var_77_267)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_268 = {
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

		var_77_65:RegisterAnimationSequence("WZWipSetup", var_77_268)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_269 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_68:RegisterAnimationSequence("WZWipSetup", var_77_269)
	end

	local var_77_270 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_70:RegisterAnimationSequence("WZWipSetup", var_77_270)

	local function var_77_271()
		var_77_16:AnimateSequence("WZWipSetup")
		var_77_20:AnimateSequence("WZWipSetup")
		var_77_24:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsInKoreanIGRPaidSession() then
			var_77_38:AnimateSequence("WZWipSetup")
		end

		var_77_52:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_68:AnimateSequence("WZWipSetup")
		end

		var_77_70:AnimateSequence("WZWipSetup")
	end

	var_77_0._sequences.WZWipSetup = var_77_271

	local var_77_272
	local var_77_273 = {
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

	var_77_22:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_77_273)

	local var_77_274 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_77_274)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_275 = {
			{
				value = 0.4,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_68:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_77_275)
	end

	local var_77_276 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_70:RegisterAnimationSequence("WZWipUpsellARBladeUp", var_77_276)

	local function var_77_277()
		var_77_22:AnimateSequence("WZWipUpsellARBladeUp")
		var_77_26:AnimateSequence("WZWipUpsellARBladeUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_68:AnimateSequence("WZWipUpsellARBladeUp")
		end

		var_77_70:AnimateSequence("WZWipUpsellARBladeUp")
	end

	var_77_0._sequences.WZWipUpsellARBladeUp = var_77_277

	local var_77_278
	local var_77_279 = {
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

	var_77_22:RegisterAnimationSequence("WZWipUpsellARBladeOver", var_77_279)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_280 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_68:RegisterAnimationSequence("WZWipUpsellARBladeOver", var_77_280)
	end

	local var_77_281 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_70:RegisterAnimationSequence("WZWipUpsellARBladeOver", var_77_281)

	local function var_77_282()
		var_77_22:AnimateSequence("WZWipUpsellARBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_68:AnimateSequence("WZWipUpsellARBladeOver")
		end

		var_77_70:AnimateSequence("WZWipUpsellARBladeOver")
	end

	var_77_0._sequences.WZWipUpsellARBladeOver = var_77_282

	local var_77_283
	local var_77_284 = {
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

	var_77_28:RegisterAnimationSequence("SetThemeVanguard", var_77_284)

	local function var_77_285()
		var_77_28:AnimateSequence("SetThemeVanguard")
	end

	var_77_0._sequences.SetThemeVanguard = var_77_285

	local var_77_286

	if CONDITIONS.IsVanguardRevealEventActive() then
		local var_77_287 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_71:RegisterAnimationSequence("VanguardRevealOver", var_77_287)
	end

	local function var_77_288()
		if CONDITIONS.IsVanguardRevealEventActive() then
			var_77_71:AnimateSequence("VanguardRevealOver")
		end
	end

	var_77_0._sequences.VanguardRevealOver = var_77_288

	local var_77_289

	if CONDITIONS.IsVanguardRevealEventActive() then
		local var_77_290 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_71:RegisterAnimationSequence("VanguardRevealUp", var_77_290)
	end

	local function var_77_291()
		if CONDITIONS.IsVanguardRevealEventActive() then
			var_77_71:AnimateSequence("VanguardRevealUp")
		end
	end

	var_77_0._sequences.VanguardRevealUp = var_77_291

	local var_77_292
	local var_77_293 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("VGBladeOver", var_77_293)

	local var_77_294 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_22:RegisterAnimationSequence("VGBladeOver", var_77_294)

	local var_77_295 = {
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

	var_77_28:RegisterAnimationSequence("VGBladeOver", var_77_295)

	local var_77_296 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("VGBladeOver", var_77_296)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_297 = {
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

		var_77_65:RegisterAnimationSequence("VGBladeOver", var_77_297)
	end

	local function var_77_298()
		var_77_16:AnimateSequence("VGBladeOver")
		var_77_22:AnimateSequence("VGBladeOver")
		var_77_28:AnimateSequence("VGBladeOver")
		var_77_52:AnimateSequence("VGBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("VGBladeOver")
		end
	end

	var_77_0._sequences.VGBladeOver = var_77_298

	local var_77_299
	local var_77_300 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("WZLogoBladeOver", var_77_300)

	local var_77_301 = {
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

	var_77_28:RegisterAnimationSequence("WZLogoBladeOver", var_77_301)

	local function var_77_302()
		var_77_26:AnimateSequence("WZLogoBladeOver")
		var_77_28:AnimateSequence("WZLogoBladeOver")
	end

	var_77_0._sequences.WZLogoBladeOver = var_77_302

	local var_77_303
	local var_77_304 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("WZLogoBladeUp", var_77_304)

	local var_77_305 = {
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

	var_77_28:RegisterAnimationSequence("WZLogoBladeUp", var_77_305)

	local function var_77_306()
		var_77_26:AnimateSequence("WZLogoBladeUp")
		var_77_28:AnimateSequence("WZLogoBladeUp")
	end

	var_77_0._sequences.WZLogoBladeUp = var_77_306

	local var_77_307
	local var_77_308 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_4:RegisterAnimationSequence("PreOrderStandard", var_77_308)

	local var_77_309 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_58:RegisterAnimationSequence("PreOrderStandard", var_77_309)

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_77_310 = {
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

		var_77_81:RegisterAnimationSequence("PreOrderStandard", var_77_310)
	end

	local function var_77_311()
		var_77_4:AnimateSequence("PreOrderStandard")
		var_77_58:AnimateSequence("PreOrderStandard")

		if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_77_81:AnimateSequence("PreOrderStandard")
		end
	end

	var_77_0._sequences.PreOrderStandard = var_77_311

	local var_77_312
	local var_77_313 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_4:RegisterAnimationSequence("PreOrderUltimate", var_77_313)

	local var_77_314 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_58:RegisterAnimationSequence("PreOrderUltimate", var_77_314)

	local function var_77_315()
		var_77_4:AnimateSequence("PreOrderUltimate")
		var_77_58:AnimateSequence("PreOrderUltimate")
	end

	var_77_0._sequences.PreOrderUltimate = var_77_315

	local var_77_316

	if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_77_317 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_80:RegisterAnimationSequence("PreOrderUp", var_77_317)
	end

	local function var_77_318()
		if CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_77_80:AnimateSequence("PreOrderUp")
		end
	end

	var_77_0._sequences.PreOrderUp = var_77_318

	local var_77_319

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_77_320 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_81:RegisterAnimationSequence("PreOrderBannerShow", var_77_320)
	end

	local function var_77_321()
		if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_77_81:AnimateSequence("PreOrderBannerShow")
		end
	end

	var_77_0._sequences.PreOrderBannerShow = var_77_321

	local var_77_322

	if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
		local var_77_323 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_81:RegisterAnimationSequence("PreOrderBannerHide", var_77_323)
	end

	local function var_77_324()
		if Engine.DDJFBBJAIG() and CONDITIONS.IsCortezShowingPreOrderBannerOnItsBlade() then
			var_77_81:AnimateSequence("PreOrderBannerHide")
		end
	end

	var_77_0._sequences.PreOrderBannerHide = var_77_324

	local var_77_325
	local var_77_326 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("SetThemeCortez", var_77_326)

	local function var_77_327()
		var_77_26:AnimateSequence("SetThemeCortez")
	end

	var_77_0._sequences.SetThemeCortez = var_77_327

	local var_77_328
	local var_77_329 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("NGBladeOver", var_77_329)

	local var_77_330 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_22:RegisterAnimationSequence("NGBladeOver", var_77_330)

	local var_77_331 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_26:RegisterAnimationSequence("NGBladeOver", var_77_331)

	local var_77_332 = {
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

	var_77_28:RegisterAnimationSequence("NGBladeOver", var_77_332)

	local var_77_333 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("NGBladeOver", var_77_333)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_334 = {
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

		var_77_65:RegisterAnimationSequence("NGBladeOver", var_77_334)
	end

	local function var_77_335()
		var_77_16:AnimateSequence("NGBladeOver")
		var_77_22:AnimateSequence("NGBladeOver")
		var_77_26:AnimateSequence("NGBladeOver")
		var_77_28:AnimateSequence("NGBladeOver")
		var_77_52:AnimateSequence("NGBladeOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("NGBladeOver")
		end
	end

	var_77_0._sequences.NGBladeOver = var_77_335

	local var_77_336
	local var_77_337 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_16:RegisterAnimationSequence("NGBladeUp", var_77_337)

	local var_77_338 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_22:RegisterAnimationSequence("NGBladeUp", var_77_338)

	local var_77_339 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_24:RegisterAnimationSequence("NGBladeUp", var_77_339)

	local var_77_340 = {
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

	var_77_26:RegisterAnimationSequence("NGBladeUp", var_77_340)

	local var_77_341 = {
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

	var_77_28:RegisterAnimationSequence("NGBladeUp", var_77_341)

	local var_77_342 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_52:RegisterAnimationSequence("NGBladeUp", var_77_342)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_77_343 = {
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

		var_77_65:RegisterAnimationSequence("NGBladeUp", var_77_343)
	end

	local function var_77_344()
		var_77_16:AnimateSequence("NGBladeUp")
		var_77_22:AnimateSequence("NGBladeUp")
		var_77_24:AnimateSequence("NGBladeUp")
		var_77_26:AnimateSequence("NGBladeUp")
		var_77_28:AnimateSequence("NGBladeUp")
		var_77_52:AnimateSequence("NGBladeUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_77_65:AnimateSequence("NGBladeUp")
		end
	end

	var_77_0._sequences.NGBladeUp = var_77_344

	local var_77_345

	if CONDITIONS.IsNewGameAvailableNowMessageActive() then
		local var_77_346 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_77_39:RegisterAnimationSequence("ShowNewGameNowAvailableMessage", var_77_346)
	end

	local function var_77_347()
		if CONDITIONS.IsNewGameAvailableNowMessageActive() then
			var_77_39:AnimateSequence("ShowNewGameNowAvailableMessage")
		end
	end

	var_77_0._sequences.ShowNewGameNowAvailableMessage = var_77_347

	local var_77_348
	local var_77_349 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 483
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_77_28:RegisterAnimationSequence("FormatCombinedMWIILogoOver", var_77_349)

	local function var_77_350()
		var_77_28:AnimateSequence("FormatCombinedMWIILogoOver")
	end

	var_77_0._sequences.FormatCombinedMWIILogoOver = var_77_350

	local var_77_351
	local var_77_352 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 483
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_77_28:RegisterAnimationSequence("FormatCombinedMWIILogoUp", var_77_352)

	local function var_77_353()
		var_77_28:AnimateSequence("FormatCombinedMWIILogoUp")
	end

	var_77_0._sequences.FormatCombinedMWIILogoUp = var_77_353

	local var_77_354
	local var_77_355 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_83:RegisterAnimationSequence("ShowWarzoneMaintenanceMessage", var_77_355)

	local function var_77_356()
		var_77_83:AnimateSequence("ShowWarzoneMaintenanceMessage")
	end

	var_77_0._sequences.ShowWarzoneMaintenanceMessage = var_77_356

	local var_77_357
	local var_77_358 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_77_83:RegisterAnimationSequence("HideWarzoneMaintenanceMessage", var_77_358)

	local function var_77_359()
		var_77_83:AnimateSequence("HideWarzoneMaintenanceMessage")
	end

	var_77_0._sequences.HideWarzoneMaintenanceMessage = var_77_359

	local var_77_360
	local var_77_361 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 699
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 675
		}
	}

	var_77_83:RegisterAnimationSequence("ShowWarzoneMaintenanceMessageF2P", var_77_361)

	local function var_77_362()
		var_77_83:AnimateSequence("ShowWarzoneMaintenanceMessageF2P")
	end

	var_77_0._sequences.ShowWarzoneMaintenanceMessageF2P = var_77_362

	var_0_45(var_77_0, var_77_1, arg_77_1)

	return var_77_0
end

MenuBuilder.registerType("MainMenuBlade", MainMenuBlade)
LockTable(_M)
