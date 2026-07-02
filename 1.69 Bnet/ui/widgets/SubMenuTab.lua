module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._isRestricted or arg_1_0:IsRestricted(arg_1_0._controllerIndex)

	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and not var_1_0 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	if not arg_2_0.Banner then
		local var_2_0
		local var_2_1 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
			controllerIndex = arg_2_0._controllerIndex
		})

		var_2_1.id = "Banner"

		var_2_1:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 23)
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
	if arg_5_0._isBundleTopperActive then
		return
	end

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
	var_0_1(arg_8_0, Engine.CBBHFCGDIC("MENU/VANGUARD_BANNER"))
	ACTIONS.AnimateSequence(arg_8_0.Banner, "Vanguard")
end

local function var_0_6(arg_9_0, arg_9_1)
	var_0_1(arg_9_0, Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_BANNER"))
	ACTIONS.AnimateSequence(arg_9_0.Banner, "Cortez")
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	var_0_1(arg_10_0, "")

	local var_10_0

	local function var_10_1()
		local var_11_0, var_11_1, var_11_2 = STORE.GetCategoryTimeLeft(nil, arg_10_1)

		if var_11_0 > 0 then
			arg_10_0.Banner:SetText(var_11_1, true)
			arg_10_0.Banner:SetAlpha(1)

			arg_10_0.Banner:Wait(1000, true).onComplete = var_10_1

			if var_11_0 < STORE.LimitedTimeWarningThreshold then
				ACTIONS.AnimateSequence(arg_10_0.Banner, "LimitedTimeWarningVariant")
			elseif arg_10_2 and arg_10_2._overrideBannerAnim then
				ACTIONS.AnimateSequence(arg_10_0.Banner, arg_10_2._overrideBannerAnim)
			else
				ACTIONS.AnimateSequence(arg_10_0.Banner, "LimitedTimeVariant")
			end
		else
			arg_10_0.Banner:SetText("")
			arg_10_0.Banner:SetAlpha(0)
		end
	end

	var_10_1()
end

local function var_0_8(arg_12_0, arg_12_1)
	var_0_1(arg_12_0, "")

	local var_12_0 = 3600
	local var_12_1 = var_12_0 * 24
	local var_12_2 = 5000
	local var_12_3 = Dvar.BJJCJHDBII("ui_store_daily_reset_time")

	if not var_12_3 then
		return
	end

	local var_12_4 = var_12_3 * var_12_0

	local function var_12_5()
		local var_13_0 = Engine.DEIDGHDBHD() or Engine.DCJHCAFIIA()
		local var_13_1 = var_12_1 - (var_13_0 - var_12_4) % var_12_1
		local var_13_2 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_13_1))

		arg_12_0.Banner:SetText(Engine.CBBHFCGDIC("CHALLENGE/RESET_TIME", var_13_2), true)
	end

	local var_12_6 = LUI.UITimer.new({
		event = "update_reset_time",
		interval = var_12_2
	})

	var_12_6.id = "dayResetTimer"

	arg_12_0:addElement(var_12_6)
	arg_12_0:addAndCallEventHandler("update_reset_time", var_12_5)
	ACTIONS.AnimateSequence(arg_12_0.Banner, "RefreshTimerVariant")
end

local function var_0_9(arg_14_0)
	var_0_1(arg_14_0, SEASON.GetLocalizedSimpleName({
		isForBattlePass = true
	}))
	ACTIONS.AnimateSequence(arg_14_0.Banner, "SeasonVariant")
end

local function var_0_10(arg_15_0)
	var_0_1(arg_15_0, Engine.CBBHFCGDIC("MENU/ZEUS_BANNER"))
	ACTIONS.AnimateSequence(arg_15_0.Banner, "Zeus")
end

local function var_0_11(arg_16_0)
	var_0_1(arg_16_0, Engine.CBBHFCGDIC("LUA_MENU/SALE_WITH_CLOCK"))

	arg_16_0._saleTimer = STORE.GetSaleTimer(arg_16_0._controllerIndex)

	local var_16_0

	local function var_16_1()
		local var_17_0 = 86400
		local var_17_1 = Engine.DEIDGHDBHD()
		local var_17_2 = tonumber(arg_16_0._saleTimer) - var_17_1

		if var_17_0 < var_17_2 then
			ACTIONS.AnimateSequence(arg_16_0.Banner, "StoreSale")
		elseif var_17_2 > 0 then
			ACTIONS.AnimateSequence(arg_16_0.Banner, "StoreSaleEnd")
		else
			arg_16_0.Banner:SetAlpha(0)

			return
		end

		arg_16_0:Wait(1000, true).onComplete = function()
			var_16_1()
		end
	end

	var_16_1()
end

local function var_0_12(arg_19_0, arg_19_1, arg_19_2)
	assert(arg_19_1)

	if not arg_19_1 then
		return
	end

	local var_19_0 = Engine.DEIDGHDBHD()
	local var_19_1 = arg_19_1 - var_19_0
	local var_19_2 = 86400
	local var_19_3 = "promo_tab_timer"

	if var_19_1 <= 0 then
		return
	end

	var_0_1(arg_19_0, "")

	arg_19_0._promoTimer = LUI.UITimer.new({
		interval = 1000,
		event = var_19_3
	})
	arg_19_0._promoTimer.id = "PromoTabTimer"

	arg_19_0:addElement(arg_19_0._promoTimer)
	arg_19_0.Banner.Shine:SetAlpha(0.5)
	ACTIONS.AnimateSequence(arg_19_0.Banner, "GlintSlow")

	local function var_19_4()
		if arg_19_2 then
			return not CONDITIONS.IsTierSaleEnabled() or not BATTLEPASS.IsOwned(arg_19_0._controllerIndex)
		else
			return not BATTLEPASS.IsTierSkipGiftActive(arg_19_0._controllerIndex) or BATTLEPASS.IsOwned(arg_19_0._controllerIndex)
		end
	end

	arg_19_0:addAndCallEventHandler(var_19_3, function(arg_21_0, arg_21_1)
		var_19_0 = Engine.DEIDGHDBHD()
		var_19_1 = arg_19_1 - var_19_0

		if var_19_1 <= 0 or var_19_4() then
			if arg_19_0._promoTimer then
				arg_19_0._promoTimer:closeTree()

				arg_19_0._promoTimer = nil
			end

			if arg_19_0._isBattlePassTab then
				ACTIONS.AnimateSequence(arg_19_0.Banner, "StopGlint")
				arg_19_0:SetSeasonBanner()
			else
				arg_19_0.Banner:SetAlpha(0)
			end
		else
			arg_19_0.Banner:SetText(Engine.CBBHFCGDIC(arg_19_2 and "BATTLEPASS/TIER_SALE" or "MENU/PROMO"))
			ACTIONS.AnimateSequence(arg_19_0.Banner, "TabSizeSetup")

			if var_19_1 > var_19_2 then
				ACTIONS.AnimateSequence(arg_19_0.Banner, "TierSaleVariant")
			else
				ACTIONS.AnimateSequence(arg_19_0.Banner, "TierSaleVariantEndSoon")
			end
		end
	end)
end

local function var_0_13(arg_22_0)
	WZWIP.AnimateThemeElement(arg_22_0, "SeasonalEventTabUp")

	local var_22_0 = Dvar.CFHDGABACF("NKRNRKQPSQ")

	if var_22_0 and var_22_0 > 0 then
		local var_22_1
		local var_22_2 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

		if var_22_2.menuSubTab then
			var_22_1 = var_22_2.menuSubTab.layoutAnim
		end

		arg_22_0:SetLimitedTimeBanner(tostring(var_22_0), {
			_overrideBannerAnim = var_22_1
		})
	end
end

local function var_0_14(arg_23_0)
	var_0_1(arg_23_0, Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS_BONUS"))
	ACTIONS.AnimateSequence(arg_23_0.Banner, "BattlePassBundleTopperBanner")
end

local function var_0_15(arg_24_0, arg_24_1)
	return Restrictions.AreAnyRestrictionInUse(arg_24_1)
end

local function var_0_16(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.IsRestricted = var_0_15
	arg_25_0._isBattlePassTab = false
	arg_25_0._controllerIndex = arg_25_1
	arg_25_0.SetTabState = SetTabState
	arg_25_0._isBundleTopperActive = false

	function arg_25_0.Setup(arg_26_0, arg_26_1)
		arg_26_0.TabText:setText(ToUpperCase(arg_26_1.name))

		arg_26_0._tabData = arg_26_1

		if arg_26_1.hasRestrictionIcon then
			arg_26_0:addEventHandler("menu_create", function(arg_27_0, arg_27_1)
				arg_26_0._isRestricted = arg_26_0:IsRestricted(arg_25_1)

				if arg_26_0._isRestricted then
					ACTIONS.AnimateSequence(arg_27_0, "RestrictionOn")
				else
					ACTIONS.AnimateSequence(arg_27_0, "RestrictionOff")
				end

				if arg_26_1.hasNewItem then
					arg_26_0.NewItemSmallIcon:UpdateAlpha(arg_26_1.hasNewItem and not arg_26_0._isRestricted and 1 or 0)
				end
			end)
			arg_26_0:registerEventHandler("matchrules_updated", function(arg_28_0, arg_28_1)
				if MLG.IsCDLActive(arg_25_1) then
					ACTIONS.AnimateSequence(arg_28_0, "RestrictionOn")
				else
					ACTIONS.AnimateSequence(arg_28_0, "RestrictionOff")
				end
			end)
		end

		if arg_26_1.isBattlePassTab then
			arg_26_0._isBattlePassTab = true

			WZWIP.AnimateThemeElement(arg_26_0, "BattlePassTabUp")
		end

		if arg_26_1.isEventTab then
			arg_26_0._isEventTab = true

			var_0_13(arg_26_0)
		end
	end

	arg_25_0.SetBreadcrumb = var_0_0
	arg_25_0.SetFreeBanner = var_0_4
	arg_25_0.SetLimitedTimeBanner = var_0_7
	arg_25_0.SetSeasonBanner = var_0_9
	arg_25_0.SetPromoBanner = var_0_12
	arg_25_0.SetSeasonalEvent = var_0_13
	arg_25_0.SetZeusBanner = var_0_10
	arg_25_0.SetSaleBanner = var_0_11
	arg_25_0.SetVGBanner = var_0_5
	arg_25_0.SetCortezBanner = var_0_6
	arg_25_0.SetStoreTabRefreshTimer = var_0_8
	arg_25_0.SetBundleTopperBanner = var_0_14

	TAB.SetUp(arg_25_0)
end

function SubMenuTab(arg_29_0, arg_29_1)
	local var_29_0 = LUI.UIElement.new()

	var_29_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 52 * _1080p)

	var_29_0.id = "SubMenuTab"
	var_29_0._animationSets = var_29_0._animationSets or {}
	var_29_0._sequences = var_29_0._sequences or {}

	local var_29_1 = arg_29_1 and arg_29_1.controllerIndex

	if not var_29_1 and not Engine.DDJFBBJAIG() then
		var_29_1 = var_29_0:getRootController()
	end

	assert(var_29_1)

	local var_29_2 = var_29_0
	local var_29_3
	local var_29_4 = LUI.UIImage.new()

	var_29_4.id = "Backer"

	var_29_4:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_29_4:SetAlpha(0, 0)
	var_29_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_29_0:addElement(var_29_4)

	var_29_0.Backer = var_29_4

	local var_29_5

	if CONDITIONS.IsWZWipFrontend() then
		var_29_5 = LUI.UIImage.new()
		var_29_5.id = "WZWipBacker"

		var_29_5:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
		var_29_5:SetAlpha(0, 0)
		var_29_5:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
		var_29_5:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -5, _1080p * 3)
		var_29_0:addElement(var_29_5)

		var_29_0.WZWipBacker = var_29_5
	end

	local var_29_6
	local var_29_7 = LUI.UIStyledText.new()

	var_29_7.id = "TabText"

	var_29_7:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_29_7:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_29_7:SetLeading(-4 * _1080p, 0)
	var_29_7:SetAlignment(LUI.Alignment.Center)
	var_29_7:SetVerticalAlignment(LUI.Alignment.Center)
	var_29_7:SetShadowMinDistance(-0.4, 0)
	var_29_7:SetShadowMaxDistance(0.6, 0)
	var_29_7:SetShadowRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_29_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -10, _1080p * 10)

	local function var_29_8()
		local var_30_0 = var_29_0:GetDataSource().name:GetValue(var_29_1)

		if var_30_0 ~= nil then
			var_29_7:setText(var_30_0, 0)
		end
	end

	var_29_7:SubscribeToModelThroughElement(var_29_0, "name", var_29_8)
	var_29_0:addElement(var_29_7)

	var_29_0.TabText = var_29_7

	local var_29_9
	local var_29_10 = LUI.UIImage.new()

	var_29_10.id = "ChangeIndicator"

	var_29_10:SetAlpha(0, 0)
	var_29_10:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_29_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_29_0:addElement(var_29_10)

	var_29_0.ChangeIndicator = var_29_10

	local var_29_11
	local var_29_12 = LUI.UIImage.new()

	var_29_12.id = "Highlight"

	var_29_12:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_29_12:SetAlpha(0, 0)
	var_29_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_29_0:addElement(var_29_12)

	var_29_0.Highlight = var_29_12

	local var_29_13
	local var_29_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_29_1
	})

	var_29_14.id = "NewItemSmallIcon"

	var_29_14:SetAlpha(0, 0)
	var_29_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_29_0:addElement(var_29_14)

	var_29_0.NewItemSmallIcon = var_29_14

	local var_29_15
	local var_29_16 = LUI.UIImage.new()

	var_29_16.id = "RestrictionWarning"

	var_29_16:SetAlpha(0, 0)
	var_29_16:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_29_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -29, 0, _1080p * -7, _1080p * 22)
	var_29_0:addElement(var_29_16)

	var_29_0.RestrictionWarning = var_29_16

	local var_29_17

	if CONDITIONS.IsSeasonalEventUsingTabLogo() then
		var_29_17 = LUI.UIImage.new()
		var_29_17.id = "SeasonalEventLogo"

		var_29_17:SetAlpha(0, 0)
		var_29_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24)
		var_29_0:addElement(var_29_17)

		var_29_0.SeasonalEventLogo = var_29_17
	end

	local function var_29_18()
		return
	end

	var_29_0._sequences.DefaultSequence = var_29_18

	local var_29_19
	local var_29_20 = {
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

	var_29_4:RegisterAnimationSequence("Focused", var_29_20)

	local var_29_21 = {
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
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("Focused", var_29_21)

	local var_29_22 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("Focused", var_29_22)

	local var_29_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("Focused", var_29_23)

	local function var_29_24()
		var_29_4:AnimateSequence("Focused")
		var_29_7:AnimateSequence("Focused")
		var_29_10:AnimateSequence("Focused")
		var_29_12:AnimateSequence("Focused")
	end

	var_29_0._sequences.Focused = var_29_24

	local var_29_25
	local var_29_26 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("UnFocused", var_29_26)

	local var_29_27 = {
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

	var_29_7:RegisterAnimationSequence("UnFocused", var_29_27)

	local var_29_28 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_29_10:RegisterAnimationSequence("UnFocused", var_29_28)

	local var_29_29 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("UnFocused", var_29_29)

	local function var_29_30()
		var_29_4:AnimateSequence("UnFocused")
		var_29_7:AnimateSequence("UnFocused")
		var_29_10:AnimateSequence("UnFocused")
		var_29_12:AnimateSequence("UnFocused")
	end

	var_29_0._sequences.UnFocused = var_29_30

	local var_29_31
	local var_29_32 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("FocusedNoSound", var_29_32)

	local var_29_33 = {
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

	var_29_7:RegisterAnimationSequence("FocusedNoSound", var_29_33)

	local var_29_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("FocusedNoSound", var_29_34)

	local var_29_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("FocusedNoSound", var_29_35)

	local function var_29_36()
		var_29_4:AnimateSequence("FocusedNoSound")
		var_29_7:AnimateSequence("FocusedNoSound")
		var_29_10:AnimateSequence("FocusedNoSound")
		var_29_12:AnimateSequence("FocusedNoSound")
	end

	var_29_0._sequences.FocusedNoSound = var_29_36

	local var_29_37
	local var_29_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Season2BattlePassHilite
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("BattlePassTabUp", var_29_38)

	local var_29_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_29_7:RegisterAnimationSequence("BattlePassTabUp", var_29_39)

	local function var_29_40()
		var_29_4:AnimateSequence("BattlePassTabUp")
		var_29_7:AnimateSequence("BattlePassTabUp")
	end

	var_29_0._sequences.BattlePassTabUp = var_29_40

	local var_29_41
	local var_29_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Season2BattlePassHilite
		}
	}

	var_29_4:RegisterAnimationSequence("BattlePassTabOver", var_29_42)

	local var_29_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.BattlePass.HighlightGlow
		}
	}

	var_29_7:RegisterAnimationSequence("BattlePassTabOver", var_29_43)

	local function var_29_44()
		var_29_4:AnimateSequence("BattlePassTabOver")
		var_29_7:AnimateSequence("BattlePassTabOver")
	end

	var_29_0._sequences.BattlePassTabOver = var_29_44

	local var_29_45
	local var_29_46 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("Highlighted", var_29_46)

	local var_29_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("Highlighted", var_29_47)

	local function var_29_48()
		var_29_4:AnimateSequence("Highlighted")
		var_29_7:AnimateSequence("Highlighted")
	end

	var_29_0._sequences.Highlighted = var_29_48

	local var_29_49
	local var_29_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_29_4:RegisterAnimationSequence("FreeBundleTabOver", var_29_50)

	local var_29_51 = {
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

	var_29_7:RegisterAnimationSequence("FreeBundleTabOver", var_29_51)

	local function var_29_52()
		var_29_4:AnimateSequence("FreeBundleTabOver")
		var_29_7:AnimateSequence("FreeBundleTabOver")
	end

	var_29_0._sequences.FreeBundleTabOver = var_29_52

	local var_29_53
	local var_29_54 = {
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

	var_29_4:RegisterAnimationSequence("FreeBundleTabUp", var_29_54)

	local var_29_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagSecondary
		}
	}

	var_29_7:RegisterAnimationSequence("FreeBundleTabUp", var_29_55)

	local function var_29_56()
		var_29_4:AnimateSequence("FreeBundleTabUp")
		var_29_7:AnimateSequence("FreeBundleTabUp")
	end

	var_29_0._sequences.FreeBundleTabUp = var_29_56

	local function var_29_57()
		return
	end

	var_29_0._sequences.SeasonalEventTabOver = var_29_57

	local function var_29_58()
		return
	end

	var_29_0._sequences.SeasonalEventTabUp = var_29_58

	local function var_29_59()
		return
	end

	var_29_0._sequences.Locked = var_29_59

	local var_29_60
	local var_29_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("Disabled", var_29_61)

	local var_29_62 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("Disabled", var_29_62)

	local function var_29_63()
		var_29_4:AnimateSequence("Disabled")
		var_29_7:AnimateSequence("Disabled")
	end

	var_29_0._sequences.Disabled = var_29_63

	local var_29_64
	local var_29_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_10:RegisterAnimationSequence("Changed", var_29_65)

	local function var_29_66()
		var_29_10:AnimateSequence("Changed")
	end

	var_29_0._sequences.Changed = var_29_66

	local var_29_67
	local var_29_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_10:RegisterAnimationSequence("NotChanged", var_29_68)

	local function var_29_69()
		var_29_10:AnimateSequence("NotChanged")
	end

	var_29_0._sequences.NotChanged = var_29_69

	local var_29_70
	local var_29_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_16:RegisterAnimationSequence("RestrictionOn", var_29_71)

	local function var_29_72()
		var_29_16:AnimateSequence("RestrictionOn")
	end

	var_29_0._sequences.RestrictionOn = var_29_72

	local var_29_73
	local var_29_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_16:RegisterAnimationSequence("RestrictionOff", var_29_74)

	local function var_29_75()
		var_29_16:AnimateSequence("RestrictionOff")
	end

	var_29_0._sequences.RestrictionOff = var_29_75

	local var_29_76
	local var_29_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetup", var_29_77)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_78 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_mp_wz_sep_menu_title")
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetup", var_29_78)
	end

	local var_29_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTab
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
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

	var_29_7:RegisterAnimationSequence("WZWipSetup", var_29_79)

	local var_29_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		}
	}

	var_29_12:RegisterAnimationSequence("WZWipSetup", var_29_80)

	local function var_29_81()
		var_29_4:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetup")
		end

		var_29_7:AnimateSequence("WZWipSetup")
		var_29_12:AnimateSequence("WZWipSetup")
	end

	var_29_0._sequences.WZWipSetup = var_29_81

	local var_29_82

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_83 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipUnFocused", var_29_83)
	end

	local var_29_84 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTab
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipUnFocused", var_29_84)

	local var_29_85 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipUnFocused", var_29_85)

	local var_29_86 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("WZWipUnFocused", var_29_86)

	local function var_29_87()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipUnFocused")
		end

		var_29_7:AnimateSequence("WZWipUnFocused")
		var_29_10:AnimateSequence("WZWipUnFocused")
		var_29_12:AnimateSequence("WZWipUnFocused")
	end

	var_29_0._sequences.WZWipUnFocused = var_29_87

	local var_29_88

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_89 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipHighlighted", var_29_89)
	end

	local var_29_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
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
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipHighlighted", var_29_90)

	local var_29_91 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipHighlighted", var_29_91)

	local function var_29_92()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipHighlighted")
		end

		var_29_7:AnimateSequence("WZWipHighlighted")
		var_29_10:AnimateSequence("WZWipHighlighted")
	end

	var_29_0._sequences.WZWipHighlighted = var_29_92

	local var_29_93

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_94 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipFocusedNoSound", var_29_94)
	end

	local var_29_95 = {
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
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
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

	var_29_7:RegisterAnimationSequence("WZWipFocusedNoSound", var_29_95)

	local var_29_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipFocusedNoSound", var_29_96)

	local function var_29_97()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipFocusedNoSound")
		end

		var_29_7:AnimateSequence("WZWipFocusedNoSound")
		var_29_10:AnimateSequence("WZWipFocusedNoSound")
	end

	var_29_0._sequences.WZWipFocusedNoSound = var_29_97

	local var_29_98

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_99 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipFreeBundleTabOver", var_29_99)
	end

	local var_29_100 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.splashNotifications.GreenLight
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipFreeBundleTabOver", var_29_100)

	local function var_29_101()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipFreeBundleTabOver")
		end

		var_29_7:AnimateSequence("WZWipFreeBundleTabOver")
	end

	var_29_0._sequences.WZWipFreeBundleTabOver = var_29_101

	local var_29_102

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_103 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipFreeBundleTabUp", var_29_103)
	end

	local var_29_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTab
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipFreeBundleTabUp", var_29_104)

	local function var_29_105()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipFreeBundleTabUp")
		end

		var_29_7:AnimateSequence("WZWipFreeBundleTabUp")
	end

	var_29_0._sequences.WZWipFreeBundleTabUp = var_29_105

	local var_29_106
	local var_29_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSeasonalEventTabOver", var_29_107)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_108 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSeasonalEventTabOver", var_29_108)
	end

	local var_29_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSeasonalEventTabOver", var_29_109)

	if CONDITIONS.IsSeasonalEventUsingTabLogo() then
		local var_29_110 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("br_wz_s4_event_tab_logo")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Reticles.White
			}
		}

		var_29_17:RegisterAnimationSequence("WZWipSeasonalEventTabOver", var_29_110)
	end

	local function var_29_111()
		var_29_4:AnimateSequence("WZWipSeasonalEventTabOver")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSeasonalEventTabOver")
		end

		var_29_7:AnimateSequence("WZWipSeasonalEventTabOver")

		if CONDITIONS.IsSeasonalEventUsingTabLogo() then
			var_29_17:AnimateSequence("WZWipSeasonalEventTabOver")
		end
	end

	var_29_0._sequences.WZWipSeasonalEventTabOver = var_29_111

	local var_29_112
	local var_29_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSeasonalEventTabUp", var_29_113)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_114 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSeasonalEventTabUp", var_29_114)
	end

	local var_29_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSeasonalEventTabUp", var_29_115)

	if CONDITIONS.IsSeasonalEventUsingTabLogo() then
		local var_29_116 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("br_wz_s4_event_tab_logo")
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_29_17:RegisterAnimationSequence("WZWipSeasonalEventTabUp", var_29_116)
	end

	local function var_29_117()
		var_29_4:AnimateSequence("WZWipSeasonalEventTabUp")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSeasonalEventTabUp")
		end

		var_29_7:AnimateSequence("WZWipSeasonalEventTabUp")

		if CONDITIONS.IsSeasonalEventUsingTabLogo() then
			var_29_17:AnimateSequence("WZWipSeasonalEventTabUp")
		end
	end

	var_29_0._sequences.WZWipSeasonalEventTabUp = var_29_117

	local var_29_118

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_119 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipBattlePassTabUp", var_29_119)
	end

	local var_29_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipBattlePassTabUp", var_29_120)

	local function var_29_121()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipBattlePassTabUp")
		end

		var_29_7:AnimateSequence("WZWipBattlePassTabUp")
	end

	var_29_0._sequences.WZWipBattlePassTabUp = var_29_121

	local var_29_122
	local var_29_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipBattlePassTabOver", var_29_123)

	local var_29_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipBattlePassTabOver", var_29_124)

	local function var_29_125()
		var_29_4:AnimateSequence("WZWipBattlePassTabOver")
		var_29_7:AnimateSequence("WZWipBattlePassTabOver")
	end

	var_29_0._sequences.WZWipBattlePassTabOver = var_29_125

	local var_29_126
	local var_29_127 = {
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

	var_29_7:RegisterAnimationSequence("AR", var_29_127)

	local function var_29_128()
		var_29_7:AnimateSequence("AR")
	end

	var_29_0._sequences.AR = var_29_128

	local var_29_129
	local var_29_130 = {
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

	var_29_7:RegisterAnimationSequence("KORZH", var_29_130)

	local function var_29_131()
		var_29_7:AnimateSequence("KORZH")
	end

	var_29_0._sequences.KORZH = var_29_131

	local var_29_132
	local var_29_133 = {
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

	var_29_7:RegisterAnimationSequence("DE", var_29_133)

	local function var_29_134()
		var_29_7:AnimateSequence("DE")
	end

	var_29_0._sequences.DE = var_29_134

	local var_29_135
	local var_29_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_29_7:RegisterAnimationSequence("JP", var_29_136)

	local function var_29_137()
		var_29_7:AnimateSequence("JP")
	end

	var_29_0._sequences.JP = var_29_137

	local var_29_138
	local var_29_139 = {
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

	var_29_7:RegisterAnimationSequence("RU", var_29_139)

	local function var_29_140()
		var_29_7:AnimateSequence("RU")
	end

	var_29_0._sequences.RU = var_29_140

	local var_29_141
	local var_29_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipDisabled", var_29_142)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_143 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipDisabled", var_29_143)
	end

	local var_29_144 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
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

	var_29_7:RegisterAnimationSequence("WZWipDisabled", var_29_144)

	local var_29_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipDisabled", var_29_145)

	local var_29_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("WZWipDisabled", var_29_146)

	local function var_29_147()
		var_29_4:AnimateSequence("WZWipDisabled")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipDisabled")
		end

		var_29_7:AnimateSequence("WZWipDisabled")
		var_29_10:AnimateSequence("WZWipDisabled")
		var_29_12:AnimateSequence("WZWipDisabled")
	end

	var_29_0._sequences.WZWipDisabled = var_29_147

	local var_29_148
	local var_29_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupLEPEventTabOver", var_29_149)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_150 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupLEPEventTabOver", var_29_150)
	end

	local var_29_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.EventPromos.AtlantisLight
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupLEPEventTabOver", var_29_151)

	local function var_29_152()
		var_29_4:AnimateSequence("WZWipSetupLEPEventTabOver")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupLEPEventTabOver")
		end

		var_29_7:AnimateSequence("WZWipSetupLEPEventTabOver")
	end

	var_29_0._sequences.WZWipSetupLEPEventTabOver = var_29_152

	local var_29_153
	local var_29_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupLEPEventTabUp", var_29_154)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_155 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.BattlePass.BRVIPTextGray
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupLEPEventTabUp", var_29_155)
	end

	local function var_29_156()
		var_29_4:AnimateSequence("WZWipSetupLEPEventTabUp")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupLEPEventTabUp")
		end
	end

	var_29_0._sequences.WZWipSetupLEPEventTabUp = var_29_156

	local var_29_157

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_158 = {
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipFocused", var_29_158)
	end

	local var_29_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
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
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipFocused", var_29_159)

	local var_29_160 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipFocused", var_29_160)

	local function var_29_161()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipFocused")
		end

		var_29_7:AnimateSequence("WZWipFocused")
		var_29_10:AnimateSequence("WZWipFocused")
	end

	var_29_0._sequences.WZWipFocused = var_29_161

	local var_29_162
	local var_29_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisRed
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupArmoredEventTabOver", var_29_163)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_164 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.EventPromos.ArmoredEvent
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupArmoredEventTabOver", var_29_164)
	end

	local var_29_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.EventPromos.OutbreakRed
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupArmoredEventTabOver", var_29_165)

	local function var_29_166()
		var_29_4:AnimateSequence("WZWipSetupArmoredEventTabOver")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupArmoredEventTabOver")
		end

		var_29_7:AnimateSequence("WZWipSetupArmoredEventTabOver")
	end

	var_29_0._sequences.WZWipSetupArmoredEventTabOver = var_29_166

	local var_29_167
	local var_29_168 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupArmoredEventTabUp", var_29_168)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_169 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.BattlePass.BRVIPTextGray
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupArmoredEventTabUp", var_29_169)
	end

	local var_29_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupArmoredEventTabUp", var_29_170)

	local function var_29_171()
		var_29_4:AnimateSequence("WZWipSetupArmoredEventTabUp")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupArmoredEventTabUp")
		end

		var_29_7:AnimateSequence("WZWipSetupArmoredEventTabUp")
	end

	var_29_0._sequences.WZWipSetupArmoredEventTabUp = var_29_171

	local var_29_172
	local var_29_173 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupFestiveFervorEventTabOver", var_29_173)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_174 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupFestiveFervorEventTabOver", var_29_174)
	end

	local var_29_175 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupFestiveFervorEventTabOver", var_29_175)

	local function var_29_176()
		var_29_4:AnimateSequence("WZWipSetupFestiveFervorEventTabOver")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupFestiveFervorEventTabOver")
		end

		var_29_7:AnimateSequence("WZWipSetupFestiveFervorEventTabOver")
	end

	var_29_0._sequences.WZWipSetupFestiveFervorEventTabOver = var_29_176

	local var_29_177
	local var_29_178 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupFestiveFervorEventTabUp", var_29_178)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_179 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupFestiveFervorEventTabUp", var_29_179)
	end

	local var_29_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTab
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupFestiveFervorEventTabUp", var_29_180)

	local function var_29_181()
		var_29_4:AnimateSequence("WZWipSetupFestiveFervorEventTabUp")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupFestiveFervorEventTabUp")
		end

		var_29_7:AnimateSequence("WZWipSetupFestiveFervorEventTabUp")
	end

	var_29_0._sequences.WZWipSetupFestiveFervorEventTabUp = var_29_181

	local var_29_182

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_183 = {
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipFocusedAR", var_29_183)
	end

	local var_29_184 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
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
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipFocusedAR", var_29_184)

	local var_29_185 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipFocusedAR", var_29_185)

	local function var_29_186()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipFocusedAR")
		end

		var_29_7:AnimateSequence("WZWipFocusedAR")
		var_29_10:AnimateSequence("WZWipFocusedAR")
	end

	var_29_0._sequences.WZWipFocusedAR = var_29_186

	local var_29_187

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_188 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipUnFocusedAR", var_29_188)
	end

	local var_29_189 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTab
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipUnFocusedAR", var_29_189)

	local var_29_190 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipUnFocusedAR", var_29_190)

	local var_29_191 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("WZWipUnFocusedAR", var_29_191)

	local function var_29_192()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipUnFocusedAR")
		end

		var_29_7:AnimateSequence("WZWipUnFocusedAR")
		var_29_10:AnimateSequence("WZWipUnFocusedAR")
		var_29_12:AnimateSequence("WZWipUnFocusedAR")
	end

	var_29_0._sequences.WZWipUnFocusedAR = var_29_192

	local var_29_193

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_194 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipFocusedNoSoundAR", var_29_194)
	end

	local var_29_195 = {
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
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipFocusedNoSoundAR", var_29_195)

	local var_29_196 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipFocusedNoSoundAR", var_29_196)

	local function var_29_197()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipFocusedNoSoundAR")
		end

		var_29_7:AnimateSequence("WZWipFocusedNoSoundAR")
		var_29_10:AnimateSequence("WZWipFocusedNoSoundAR")
	end

	var_29_0._sequences.WZWipFocusedNoSoundAR = var_29_197

	local var_29_198

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_199 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipHighlightedAR", var_29_199)
	end

	local var_29_200 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
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
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipHighlightedAR", var_29_200)

	local var_29_201 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipHighlightedAR", var_29_201)

	local function var_29_202()
		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipHighlightedAR")
		end

		var_29_7:AnimateSequence("WZWipHighlightedAR")
		var_29_10:AnimateSequence("WZWipHighlightedAR")
	end

	var_29_0._sequences.WZWipHighlightedAR = var_29_202

	local var_29_203
	local var_29_204 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipDisabledAR", var_29_204)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_205 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipDisabledAR", var_29_205)
	end

	local var_29_206 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipDisabledAR", var_29_206)

	local var_29_207 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_29_10:RegisterAnimationSequence("WZWipDisabledAR", var_29_207)

	local var_29_208 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_12:RegisterAnimationSequence("WZWipDisabledAR", var_29_208)

	local function var_29_209()
		var_29_4:AnimateSequence("WZWipDisabledAR")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipDisabledAR")
		end

		var_29_7:AnimateSequence("WZWipDisabledAR")
		var_29_10:AnimateSequence("WZWipDisabledAR")
		var_29_12:AnimateSequence("WZWipDisabledAR")
	end

	var_29_0._sequences.WZWipDisabledAR = var_29_209

	local var_29_210
	local var_29_211 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupHvVEventTabUp", var_29_211)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_212 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupHvVEventTabUp", var_29_212)
	end

	local var_29_213 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupHvVEventTabUp", var_29_213)

	if CONDITIONS.IsSeasonalEventUsingTabLogo() then
		local var_29_214 = {
			{
				value = 0.35,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_hvv_tab")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -75
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 75
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -25
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 25
			}
		}

		var_29_17:RegisterAnimationSequence("WZWipSetupHvVEventTabUp", var_29_214)
	end

	local function var_29_215()
		var_29_4:AnimateSequence("WZWipSetupHvVEventTabUp")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupHvVEventTabUp")
		end

		var_29_7:AnimateSequence("WZWipSetupHvVEventTabUp")

		if CONDITIONS.IsSeasonalEventUsingTabLogo() then
			var_29_17:AnimateSequence("WZWipSetupHvVEventTabUp")
		end
	end

	var_29_0._sequences.WZWipSetupHvVEventTabUp = var_29_215

	local var_29_216
	local var_29_217 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_4:RegisterAnimationSequence("WZWipSetupHvVEventTabOver", var_29_217)

	if CONDITIONS.IsWZWipFrontend() then
		local var_29_218 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.text.offwhite
			}
		}

		var_29_5:RegisterAnimationSequence("WZWipSetupHvVEventTabOver", var_29_218)
	end

	local var_29_219 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.White
		}
	}

	var_29_7:RegisterAnimationSequence("WZWipSetupHvVEventTabOver", var_29_219)

	if CONDITIONS.IsSeasonalEventUsingTabLogo() then
		local var_29_220 = {
			{
				value = 0.35,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -75
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 75
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_seasonal_event_hvv_tab")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -25
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 25
			}
		}

		var_29_17:RegisterAnimationSequence("WZWipSetupHvVEventTabOver", var_29_220)
	end

	local function var_29_221()
		var_29_4:AnimateSequence("WZWipSetupHvVEventTabOver")

		if CONDITIONS.IsWZWipFrontend() then
			var_29_5:AnimateSequence("WZWipSetupHvVEventTabOver")
		end

		var_29_7:AnimateSequence("WZWipSetupHvVEventTabOver")

		if CONDITIONS.IsSeasonalEventUsingTabLogo() then
			var_29_17:AnimateSequence("WZWipSetupHvVEventTabOver")
		end
	end

	var_29_0._sequences.WZWipSetupHvVEventTabOver = var_29_221

	var_0_16(var_29_0, var_29_1, arg_29_1)

	return var_29_0
end

MenuBuilder.registerType("SubMenuTab", SubMenuTab)
LockTable(_M)
