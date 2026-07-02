module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and not arg_1_0._IsRestricted and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	if not arg_2_0.Banner then
		local var_2_0
		local var_2_1 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
			controllerIndex = arg_2_0._controllerIndex
		})

		var_2_1.id = "Banner"

		var_2_1:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 24)
		var_2_1:setPriority(-1)
		var_2_1:SetAlpha(1)
		arg_2_0:addElement(var_2_1)

		arg_2_0.Banner = var_2_1
	end

	arg_2_0.Banner:SetText(arg_2_1)
end

local var_0_2

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	if not arg_3_1 or #arg_3_1 <= 0 then
		return
	end

	arg_3_0.Banner:Wait(250, true).onComplete = function()
		if LUI.FlowManager.IsMenuOnTop(arg_3_1) then
			arg_3_2()
		else
			var_0_3(arg_3_0, arg_3_1, arg_3_2)
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	var_0_1(arg_5_0, Engine.CBBHFCGDIC("MENU/FREE_BUNDLE"))
	arg_5_0.Banner.FreeText:SetTracking(0 * _1080p, 0)

	if arg_5_1 then
		arg_5_0.Banner:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_5_0.Banner, "FreeBundleVariant")

		if Dvar.IBEGCHEFE("LSOLLKOPQT") then
			local var_5_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.storeTabFreeBundleVisibilitySeen")

			if not var_5_0:GetValue(arg_5_0._controllerIndex) then
				arg_5_0.Banner:SetAlpha(0)
				arg_5_0:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
					local var_6_0 = arg_6_0:GetCurrentMenu() and arg_6_0:GetCurrentMenu().id or ""

					var_0_3(arg_5_0, var_6_0, function()
						arg_5_0.Banner:SetAlpha(1)
						Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.freeBannerSplash)
						ACTIONS.AnimateSequence(arg_5_0.Banner, "Splash")
						var_5_0:SetValue(arg_5_0._controllerIndex, true)
					end)
				end)
			end

			if not arg_5_0._isFreeItem then
				ACTIONS.AnimateSequence(arg_5_0, "FreeBundleTabUp")
			end

			arg_5_0._isFreeItem = true
		end
	else
		arg_5_0.Banner:SetAlpha(0)
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	var_0_1(arg_8_0, "")

	local var_8_0

	local function var_8_1()
		local var_9_0, var_9_1, var_9_2 = STORE.GetCategoryTimeLeft(nil, arg_8_1)

		if var_9_0 > 0 then
			arg_8_0.Banner:SetText(var_9_1, true)
			arg_8_0.Banner:SetAlpha(1)

			arg_8_0.Banner:Wait(1000, true).onComplete = var_8_1

			if var_9_0 < STORE.LimitedTimeWarningThreshold then
				ACTIONS.AnimateSequence(arg_8_0.Banner, "LimitedTimeWarningVariant")
			else
				ACTIONS.AnimateSequence(arg_8_0.Banner, "LimitedTimeVariant")
			end
		else
			arg_8_0.Banner:SetText("")
			arg_8_0.Banner:SetAlpha(0)
		end
	end

	var_8_1()
end

local function var_0_6(arg_10_0)
	local var_10_0 = SEASON.GetCurrentSeason()

	var_0_1(arg_10_0, Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", var_10_0))
	ACTIONS.AnimateSequence(arg_10_0.Banner, "SeasonVariant")
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_1)

	if not arg_11_1 then
		return
	end

	local var_11_0 = Engine.DEIDGHDBHD()
	local var_11_1 = arg_11_1 - var_11_0
	local var_11_2 = 86400
	local var_11_3 = "promo_tab_timer"

	if var_11_1 <= 0 then
		return
	end

	var_0_1(arg_11_0, "")

	arg_11_0._promoTimer = LUI.UITimer.new({
		interval = 1000,
		event = var_11_3
	})
	arg_11_0._promoTimer.id = "PromoTabTimer"

	arg_11_0:addElement(arg_11_0._promoTimer)
	arg_11_0.Banner.Shine:SetAlpha(0.5)
	ACTIONS.AnimateSequence(arg_11_0.Banner, "GlintSlow")

	local function var_11_4()
		if arg_11_2 then
			return not CONDITIONS.IsTierSaleEnabled() or not BATTLEPASS.IsOwned(arg_11_0._controllerIndex)
		else
			return not BATTLEPASS.IsTierSkipGiftActive(arg_11_0._controllerIndex) or BATTLEPASS.IsOwned(arg_11_0._controllerIndex)
		end
	end

	arg_11_0:addAndCallEventHandler(var_11_3, function(arg_13_0, arg_13_1)
		var_11_0 = Engine.DEIDGHDBHD()
		var_11_1 = arg_11_1 - var_11_0

		if var_11_1 <= 0 or var_11_4() then
			if arg_11_0._promoTimer then
				arg_11_0._promoTimer:closeTree()

				arg_11_0._promoTimer = nil
			end

			if arg_11_0._isBattlePassTab then
				ACTIONS.AnimateSequence(arg_11_0.Banner, "StopGlint")
				arg_11_0:SetSeasonBanner()
			else
				arg_11_0.Banner:SetAlpha(0)
			end
		else
			arg_11_0.Banner:SetText(Engine.CBBHFCGDIC(arg_11_2 and "BATTLEPASS/TIER_SALE" or "MENU/PROMO"))
			ACTIONS.AnimateSequence(arg_11_0.Banner, "TabSizeSetup")

			if var_11_1 > var_11_2 then
				ACTIONS.AnimateSequence(arg_11_0.Banner, "TierSaleVariant")
			else
				ACTIONS.AnimateSequence(arg_11_0.Banner, "TierSaleVariantEndSoon")
			end
		end
	end)
end

local function var_0_8(arg_14_0, arg_14_1)
	return LOADOUT.MATCHRULES.IsThereARestrictedKillstreak(arg_14_1) or LOADOUT.MATCHRULES.IsThereARestrictedFieldUpgrade(arg_14_1) or LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_14_1)
end

local function var_0_9(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.IsRestricted = var_0_8
	arg_15_0._isBattlePassTab = false
	arg_15_0._controllerIndex = arg_15_1

	function arg_15_0.Setup(arg_16_0, arg_16_1)
		arg_16_0.TabText:setText(ToUpperCase(arg_16_1.name))

		if arg_16_1.hasRestrictionIcon then
			arg_16_0._IsRestricted = arg_16_0:IsRestricted(arg_15_1)

			arg_16_0:addEventHandler("menu_create", function(arg_17_0, arg_17_1)
				if arg_16_0._IsRestricted then
					ACTIONS.AnimateSequence(arg_17_0, "RestrictionOn")
				end
			end)
			arg_16_0:registerEventHandler("matchrules_updated", function(arg_18_0, arg_18_1)
				if MLG.IsCDLActive(arg_15_1) then
					ACTIONS.AnimateSequence(arg_18_0, "RestrictionOn")
				else
					ACTIONS.AnimateSequence(arg_18_0, "RestrictionOff")
				end
			end)
		end

		if arg_16_1.hasNewItem then
			arg_16_0.NewItemSmallIcon:UpdateAlpha(arg_16_1.hasNewItem and not arg_16_0._IsRestricted and 1 or 0)
		end

		if arg_16_1.isStoreTab then
			ACTIONS.AnimateSequence(arg_16_0.NewItemSmallIcon, "Store")
		end

		if arg_16_1.isBattlePassTab then
			arg_16_0._isBattlePassTab = true

			ACTIONS.AnimateSequence(arg_16_0, "BattlePassTabUp")
		end

		if arg_16_1.hasFreeItem then
			arg_16_0._isFreeItem = true

			var_0_4(arg_16_0, arg_16_1.hasFreeItem)
		end
	end

	function arg_15_0.Enable(arg_19_0)
		arg_19_0._disabled = false

		ACTIONS.AnimateSequence(arg_19_0, "UnFocused")
	end

	function arg_15_0.Disable(arg_20_0)
		arg_20_0._disabled = true

		ACTIONS.AnimateSequence(arg_20_0, "Disabled")
	end

	function arg_15_0.IsEnabled(arg_21_0)
		return not arg_21_0._disabled
	end

	arg_15_0.SetBreadcrumb = var_0_0
	arg_15_0.SetFreeBanner = var_0_4
	arg_15_0.SetLimitedTimeBanner = var_0_5
	arg_15_0.SetSeasonBanner = var_0_6
	arg_15_0.SetPromoBanner = var_0_7

	arg_15_0:registerEventHandler("focus_tab", function(arg_22_0, arg_22_1)
		if arg_22_1.index == arg_22_0.index then
			if arg_22_1.playSound then
				if CONDITIONS.IsMagmaGameMode() then
					arg_22_0._sequences.WZFocused()
				else
					arg_22_0._sequences.Focused()
				end
			elseif CONDITIONS.IsMagmaGameMode() then
				arg_22_0._sequences.WZFocusedNoSound()
			else
				arg_22_0._sequences.FocusedNoSound()
			end

			arg_22_0.focused = true
		elseif arg_22_0.focused then
			arg_22_0._sequences.UnFocused()

			arg_22_0.focused = false
		end

		if arg_22_0._isBattlePassTab then
			if arg_22_0.focused then
				ACTIONS.AnimateSequence(arg_22_0, "BattlePassTabOver")
			else
				ACTIONS.AnimateSequence(arg_22_0, "BattlePassTabUp")
			end
		end

		if arg_22_0._isFreeItem then
			if arg_22_0.focused then
				ACTIONS.AnimateSequence(arg_22_0, "FreeBundleTabOver")
			else
				ACTIONS.AnimateSequence(arg_22_0, "FreeBundleTabUp")
			end
		end

		arg_22_0.TabText:SetParentHasFocus(not not arg_22_0.focused)
	end)
	arg_15_0:registerEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_23_0, arg_23_1)
		if arg_23_1.index == arg_15_0.index then
			arg_15_0:dispatchEventToCurrentMenu({
				name = LUI.TabManager.TAB_SWITCH_EVENT,
				controller = arg_23_1.controller,
				index = arg_23_1.index
			})
		end

		return true
	end)
	arg_15_0:SetHandleMouse(true)
	arg_15_0:registerEventHandler("mouseenter", function(arg_24_0, arg_24_1)
		Engine.BJDBIAGIDA(CoD.SFX.MouseOver)

		if not arg_24_0.focused then
			if not arg_24_0._disabled then
				if CONDITIONS.IsMagmaGameMode() then
					arg_24_0._sequences.WZHighlighted()
				else
					arg_24_0._sequences.Highlighted()
				end
			elseif CONDITIONS.IsMagmaGameMode() then
				arg_24_0._sequences.WZFocused()
			else
				arg_24_0._sequences.Focused()
			end
		elseif CONDITIONS.IsMagmaGameMode() then
			arg_24_0._sequences.WZHighlighted()
		else
			arg_24_0._sequences.Highlighted()
		end

		if arg_24_0._isBattlePassTab then
			ACTIONS.AnimateSequence(arg_24_0, "BattlePassTabOver")
		end

		if arg_24_0._isFreeItem then
			ACTIONS.AnimateSequence(arg_24_0, "FreeBundleTabOver")
		end
	end)
	arg_15_0:registerEventHandler("mouseleave", function(arg_25_0, arg_25_1)
		if arg_25_0.focused and not arg_25_0._disabled then
			if CONDITIONS.IsMagmaGameMode() then
				arg_25_0._sequences.WZFocusedNoSound()
			else
				arg_25_0._sequences.FocusedNoSound()
			end
		else
			arg_25_0._sequences.UnFocused()

			if arg_25_0._disabled then
				arg_25_0._sequences.Disabled()
			end
		end

		if arg_25_0._isBattlePassTab then
			if arg_25_0.focused then
				ACTIONS.AnimateSequence(arg_25_0, "BattlePassTabOver")
			else
				ACTIONS.AnimateSequence(arg_25_0, "BattlePassTabUp")
			end
		end

		if arg_25_0._isFreeItem then
			if arg_25_0.focused then
				ACTIONS.AnimateSequence(arg_25_0, "FreeBundleTabOver")
			else
				ACTIONS.AnimateSequence(arg_25_0, "FreeBundleTabUp")
			end
		end

		arg_25_0:setFocus(false)
	end)
	arg_15_0:registerEventHandler("leftmousedown", function(arg_26_0, arg_26_1)
		return
	end)
	arg_15_0:registerEventHandler("leftmouseup", function(arg_27_0, arg_27_1)
		if arg_27_1.inside and not arg_27_0._disabled then
			arg_27_0:playSound("menu_open")
			arg_27_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_27_0.index
			})

			if CONDITIONS.IsMagmaGameMode() then
				arg_27_0._sequences.WZHighlighted()
			else
				arg_27_0._sequences.Highlighted()
			end

			if arg_27_0._isBattlePassTab then
				ACTIONS.AnimateSequence(arg_27_0, "BattlePassTabOver")
			end

			if arg_27_0._isFreeItem then
				ACTIONS.AnimateSequence(arg_27_0, "FreeBundleTabOver")
			end
		end
	end)
	arg_15_0:registerEventHandler("tab_disable_blur", function(arg_28_0, arg_28_1)
		ACTIONS.AnimateSequence(arg_28_0, "NoBlur")
	end)
	arg_15_0:SubscribeToModelThroughElement(arg_15_0, "disabled", function(arg_29_0)
		if DataModel.JJEHAEBDF(arg_29_0) then
			arg_15_0:Disable()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_15_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_15_0, "KORZH")
	elseif IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_15_0, "DE")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_15_0, "RU")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_15_0, "JP")
		arg_15_0.TabText:SetMaxVisibleLines(1)
	end
end

function SubMenuTab(arg_30_0, arg_30_1)
	local var_30_0 = LUI.UIElement.new()

	var_30_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 52 * _1080p)

	var_30_0.id = "SubMenuTab"
	var_30_0._animationSets = var_30_0._animationSets or {}
	var_30_0._sequences = var_30_0._sequences or {}

	local var_30_1 = arg_30_1 and arg_30_1.controllerIndex

	if not var_30_1 and not Engine.DDJFBBJAIG() then
		var_30_1 = var_30_0:getRootController()
	end

	assert(var_30_1)

	local var_30_2 = var_30_0
	local var_30_3
	local var_30_4 = LUI.UIImage.new()

	var_30_4.id = "Backer"

	var_30_4:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_30_4:SetAlpha(0, 0)
	var_30_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_30_0:addElement(var_30_4)

	var_30_0.Backer = var_30_4

	local var_30_5
	local var_30_6 = LUI.UIStyledText.new()

	var_30_6.id = "TabText"

	var_30_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_30_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_30_6:SetAlignment(LUI.Alignment.Center)
	var_30_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_30_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_30_6:SetStartupDelay(5000)
	var_30_6:SetLineHoldTime(4000)
	var_30_6:SetAnimMoveTime(2000)
	var_30_6:SetAnimMoveSpeed(300)
	var_30_6:SetEndDelay(1000)
	var_30_6:SetCrossfadeTime(400)
	var_30_6:SetFadeInTime(300)
	var_30_6:SetFadeOutTime(300)
	var_30_6:SetMaxVisibleLines(2)
	var_30_6:SetShadowRGBFromTable(SWATCHES.tabManager.wzBackground, 0)
	var_30_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 9)

	local function var_30_7()
		local var_31_0 = var_30_0:GetDataSource().name:GetValue(var_30_1)

		if var_31_0 ~= nil then
			var_30_6:setText(var_31_0, 0)
		end
	end

	var_30_6:SubscribeToModelThroughElement(var_30_0, "name", var_30_7)
	var_30_0:addElement(var_30_6)

	var_30_0.TabText = var_30_6

	local var_30_8
	local var_30_9 = LUI.UIImage.new()

	var_30_9.id = "DisabledIcon"

	var_30_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_30_9:SetAlpha(0, 0)
	var_30_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_30_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -19, _1080p * 17)
	var_30_0:addElement(var_30_9)

	var_30_0.DisabledIcon = var_30_9

	local var_30_10
	local var_30_11 = LUI.UIImage.new()

	var_30_11.id = "ChangeIndicator"

	var_30_11:SetAlpha(0, 0)
	var_30_11:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_30_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_30_0:addElement(var_30_11)

	var_30_0.ChangeIndicator = var_30_11

	local var_30_12
	local var_30_13 = LUI.UIImage.new()

	var_30_13.id = "Highlight"

	var_30_13:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_30_13:SetAlpha(0, 0)
	var_30_13:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_30_0:addElement(var_30_13)

	var_30_0.Highlight = var_30_13

	local var_30_14
	local var_30_15 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_30_1
	})

	var_30_15.id = "NewItemSmallIcon"

	var_30_15:SetAlpha(0, 0)
	var_30_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_30_0:addElement(var_30_15)

	var_30_0.NewItemSmallIcon = var_30_15

	local var_30_16
	local var_30_17 = LUI.UIImage.new()

	var_30_17.id = "RestrictionWarning"

	var_30_17:SetAlpha(0, 0)
	var_30_17:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_30_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 46, _1080p * 75, _1080p * -33, _1080p * -4)
	var_30_0:addElement(var_30_17)

	var_30_0.RestrictionWarning = var_30_17

	local function var_30_18()
		return
	end

	var_30_0._sequences.DefaultSequence = var_30_18

	local var_30_19
	local var_30_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 38
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 17
		},
		{
			value = 0.3,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_30_4:RegisterAnimationSequence("Focused", var_30_20)

	local var_30_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.tabGlow
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_30_6:RegisterAnimationSequence("Focused", var_30_21)

	local var_30_22 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_30_11:RegisterAnimationSequence("Focused", var_30_22)

	local var_30_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("Focused", var_30_23)

	local function var_30_24()
		var_30_4:AnimateSequence("Focused")
		var_30_6:AnimateSequence("Focused")
		var_30_11:AnimateSequence("Focused")
		var_30_13:AnimateSequence("Focused")
	end

	var_30_0._sequences.Focused = var_30_24

	local var_30_25
	local var_30_26 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("UnFocused", var_30_26)

	local var_30_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_6:RegisterAnimationSequence("UnFocused", var_30_27)

	local var_30_28 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_9:RegisterAnimationSequence("UnFocused", var_30_28)

	local var_30_29 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_30_11:RegisterAnimationSequence("UnFocused", var_30_29)

	local var_30_30 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("UnFocused", var_30_30)

	local function var_30_31()
		var_30_4:AnimateSequence("UnFocused")
		var_30_6:AnimateSequence("UnFocused")
		var_30_9:AnimateSequence("UnFocused")
		var_30_11:AnimateSequence("UnFocused")
		var_30_13:AnimateSequence("UnFocused")
	end

	var_30_0._sequences.UnFocused = var_30_31

	local function var_30_32()
		return
	end

	var_30_0._sequences.Locked = var_30_32

	local var_30_33
	local var_30_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("Disabled", var_30_34)

	local var_30_35 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_6:RegisterAnimationSequence("Disabled", var_30_35)

	local var_30_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_9:RegisterAnimationSequence("Disabled", var_30_36)

	local function var_30_37()
		var_30_4:AnimateSequence("Disabled")
		var_30_6:AnimateSequence("Disabled")
		var_30_9:AnimateSequence("Disabled")
	end

	var_30_0._sequences.Disabled = var_30_37

	local var_30_38
	local var_30_39 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("Highlighted", var_30_39)

	local var_30_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_30_6:RegisterAnimationSequence("Highlighted", var_30_40)

	local function var_30_41()
		var_30_4:AnimateSequence("Highlighted")
		var_30_6:AnimateSequence("Highlighted")
	end

	var_30_0._sequences.Highlighted = var_30_41

	local var_30_42
	local var_30_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_11:RegisterAnimationSequence("Changed", var_30_43)

	local function var_30_44()
		var_30_11:AnimateSequence("Changed")
	end

	var_30_0._sequences.Changed = var_30_44

	local var_30_45
	local var_30_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_11:RegisterAnimationSequence("NotChanged", var_30_46)

	local function var_30_47()
		var_30_11:AnimateSequence("NotChanged")
	end

	var_30_0._sequences.NotChanged = var_30_47

	local var_30_48
	local var_30_49 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("FocusedNoSound", var_30_49)

	local var_30_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.tabGlow
		}
	}

	var_30_6:RegisterAnimationSequence("FocusedNoSound", var_30_50)

	local var_30_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_30_11:RegisterAnimationSequence("FocusedNoSound", var_30_51)

	local var_30_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("FocusedNoSound", var_30_52)

	local function var_30_53()
		var_30_4:AnimateSequence("FocusedNoSound")
		var_30_6:AnimateSequence("FocusedNoSound")
		var_30_11:AnimateSequence("FocusedNoSound")
		var_30_13:AnimateSequence("FocusedNoSound")
	end

	var_30_0._sequences.FocusedNoSound = var_30_53

	local var_30_54
	local var_30_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		}
	}

	var_30_6:RegisterAnimationSequence("AR", var_30_55)

	local function var_30_56()
		var_30_6:AnimateSequence("AR")
	end

	var_30_0._sequences.AR = var_30_56

	local var_30_57
	local var_30_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		}
	}

	var_30_6:RegisterAnimationSequence("KORZH", var_30_58)

	local function var_30_59()
		var_30_6:AnimateSequence("KORZH")
	end

	var_30_0._sequences.KORZH = var_30_59

	local var_30_60
	local var_30_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_30_6:RegisterAnimationSequence("DE", var_30_61)

	local function var_30_62()
		var_30_6:AnimateSequence("DE")
	end

	var_30_0._sequences.DE = var_30_62

	local var_30_63
	local var_30_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		}
	}

	var_30_6:RegisterAnimationSequence("RU", var_30_64)

	local function var_30_65()
		var_30_6:AnimateSequence("RU")
	end

	var_30_0._sequences.RU = var_30_65

	local var_30_66
	local var_30_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("BattlePassTabUp", var_30_67)

	local var_30_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		}
	}

	var_30_6:RegisterAnimationSequence("BattlePassTabUp", var_30_68)

	local function var_30_69()
		var_30_4:AnimateSequence("BattlePassTabUp")
		var_30_6:AnimateSequence("BattlePassTabUp")
	end

	var_30_0._sequences.BattlePassTabUp = var_30_69

	local var_30_70
	local var_30_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_30_4:RegisterAnimationSequence("BattlePassTabOver", var_30_71)

	local var_30_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.BattlePass.HighlightGlow
		}
	}

	var_30_6:RegisterAnimationSequence("BattlePassTabOver", var_30_72)

	local function var_30_73()
		var_30_4:AnimateSequence("BattlePassTabOver")
		var_30_6:AnimateSequence("BattlePassTabOver")
	end

	var_30_0._sequences.BattlePassTabOver = var_30_73

	local var_30_74
	local var_30_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("RestrictionOn", var_30_75)

	local function var_30_76()
		var_30_17:AnimateSequence("RestrictionOn")
	end

	var_30_0._sequences.RestrictionOn = var_30_76

	local var_30_77
	local var_30_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("RestrictionOff", var_30_78)

	local function var_30_79()
		var_30_17:AnimateSequence("RestrictionOff")
	end

	var_30_0._sequences.RestrictionOff = var_30_79

	local var_30_80
	local var_30_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_30_6:RegisterAnimationSequence("JP", var_30_81)

	local function var_30_82()
		var_30_6:AnimateSequence("JP")
	end

	var_30_0._sequences.JP = var_30_82

	local var_30_83
	local var_30_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 17
		},
		{
			value = 0.3,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_30_4:RegisterAnimationSequence("WZFocused", var_30_84)

	local var_30_85 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_30_6:RegisterAnimationSequence("WZFocused", var_30_85)

	local var_30_86 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_30_11:RegisterAnimationSequence("WZFocused", var_30_86)

	local var_30_87 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("WZFocused", var_30_87)

	local function var_30_88()
		var_30_4:AnimateSequence("WZFocused")
		var_30_6:AnimateSequence("WZFocused")
		var_30_11:AnimateSequence("WZFocused")
		var_30_13:AnimateSequence("WZFocused")
	end

	var_30_0._sequences.WZFocused = var_30_88

	local var_30_89
	local var_30_90 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_30_4:RegisterAnimationSequence("WZFocusedNoSound", var_30_90)

	local var_30_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused
		},
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_30_6:RegisterAnimationSequence("WZFocusedNoSound", var_30_91)

	local var_30_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_30_11:RegisterAnimationSequence("WZFocusedNoSound", var_30_92)

	local var_30_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("WZFocusedNoSound", var_30_93)

	local function var_30_94()
		var_30_4:AnimateSequence("WZFocusedNoSound")
		var_30_6:AnimateSequence("WZFocusedNoSound")
		var_30_11:AnimateSequence("WZFocusedNoSound")
		var_30_13:AnimateSequence("WZFocusedNoSound")
	end

	var_30_0._sequences.WZFocusedNoSound = var_30_94

	local var_30_95
	local var_30_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("WZHighlighted", var_30_96)

	local var_30_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_30_6:RegisterAnimationSequence("WZHighlighted", var_30_97)

	local function var_30_98()
		var_30_4:AnimateSequence("WZHighlighted")
		var_30_6:AnimateSequence("WZHighlighted")
	end

	var_30_0._sequences.WZHighlighted = var_30_98

	local var_30_99
	local var_30_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_30_4:RegisterAnimationSequence("FreeBundleTabOver", var_30_100)

	local var_30_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.splashNotifications.GreenLight
		}
	}

	var_30_6:RegisterAnimationSequence("FreeBundleTabOver", var_30_101)

	local function var_30_102()
		var_30_4:AnimateSequence("FreeBundleTabOver")
		var_30_6:AnimateSequence("FreeBundleTabOver")
	end

	var_30_0._sequences.FreeBundleTabOver = var_30_102

	local var_30_103
	local var_30_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_4:RegisterAnimationSequence("FreeBundleTabUp", var_30_104)

	local var_30_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagSecondary
		}
	}

	var_30_6:RegisterAnimationSequence("FreeBundleTabUp", var_30_105)

	local function var_30_106()
		var_30_4:AnimateSequence("FreeBundleTabUp")
		var_30_6:AnimateSequence("FreeBundleTabUp")
	end

	var_30_0._sequences.FreeBundleTabUp = var_30_106

	var_0_9(var_30_0, var_30_1, arg_30_1)

	return var_30_0
end

MenuBuilder.registerType("SubMenuTab", SubMenuTab)
LockTable(_M)
