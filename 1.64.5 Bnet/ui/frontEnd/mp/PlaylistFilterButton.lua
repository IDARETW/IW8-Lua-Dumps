module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0:GetDataSource()

	if var_1_0 then
		local var_1_1 = var_1_0.categoryIndex:GetValue(controllerIndex)
		local var_1_2 = var_1_0.playlistIndex:GetValue(controllerIndex)

		return var_1_1, var_1_2
	end

	return nil, nil
end

local function var_0_1(arg_2_0)
	if arg_2_0.filtered then
		ACTIONS.AnimateSequence(arg_2_0, "Check")
	else
		ACTIONS.AnimateSequence(arg_2_0, "UnCheck")
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0, var_3_1 = var_0_0(arg_3_0)

	if var_3_0 and var_3_1 then
		Playlist.CBHGDIGEI(var_3_0, var_3_1)

		arg_3_0.filtered = not arg_3_0.filtered

		var_0_1(arg_3_0)

		if arg_3_0.filtered == true then
			local var_3_2 = {
				displayTime = 3000,
				icon = arg_3_0:GetDataSource().image:GetValue(arg_3_1),
				description = Engine.CBBHFCGDIC("LUA_MENU/FILTER_EQUIPPED", Engine.JCBDICCAH(arg_3_0:GetDataSource().name:GetValue(arg_3_1))),
				type = LUI.ToastManager.NotificationType.QuickPlayFilterEquipped,
				controllerIndex = arg_3_1
			}

			arg_3_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_3_2
			})
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.TogglePlaylistSelection = var_0_2

	local var_4_0 = arg_4_2.menu

	local function var_4_1(arg_5_0)
		if arg_5_0.filtered then
			var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
			})
		else
			var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		end

		var_4_0.PlaylistDetails:UpdatePanel(arg_5_0.filtered, arg_4_0._isCrossPlayRequired, arg_4_0.showWarning, false, arg_4_0._showXPModifier)
	end

	local function var_4_2()
		local var_6_0, var_6_1 = var_0_0(arg_4_0)

		arg_4_0:SetButtonDisabled(false)

		if var_6_0 and var_6_1 then
			local var_6_2, var_6_3 = Playlist.CGJBAEBBG(var_6_0, var_6_1)

			arg_4_0.filtered = var_6_3

			var_0_1(arg_4_0)

			local var_6_4 = arg_4_0:GetDataSource()
			local var_6_5 = var_6_4.isNew:GetValue(arg_4_1)

			arg_4_0.NewItemNotification:SetAlpha(var_6_5)

			local var_6_6 = PlaylistUtils.GetPlaylistConditions(arg_4_1, var_6_4)

			if var_6_6.showSplitScreenWarning then
				var_4_0.PlaylistDetails.WarningMessage:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE", Engine.JCBDICCAH(var_6_4.name:GetValue(arg_4_1))))
			elseif var_6_6.showTooManyPeopleInPartyWarning then
				var_4_0.PlaylistDetails.WarningMessage:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GAME_MODE_HIGH_PARTY_MEMBER_COUNT_WARNING", var_6_6.activePartyMemberCount, maxPartySize))
			end

			arg_4_0.showWarning = var_6_6.showSplitScreenWarning or var_6_6.showTooManyPeopleInPartyWarning

			var_4_1(arg_4_0)
		end
	end

	arg_4_0:SubscribeToDataSourceThroughElement(arg_4_0, nil, var_4_2)

	local function var_4_3(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		var_4_0.PlaylistDetails:SetDataSource(arg_4_0:GetDataSource(), arg_4_1)
		var_4_1(arg_7_0)
		var_4_2(arg_7_0)
	end

	local function var_4_4(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
	end

	local function var_4_5(arg_9_0, arg_9_1)
		arg_4_0:TogglePlaylistSelection(arg_9_1.controller)
		var_4_1(arg_9_0)
	end

	arg_4_0:registerEventHandler("button_over", var_4_3)
	arg_4_0:registerEventHandler("button_action", var_4_5)
	arg_4_0:registerEventHandler("button_up", var_4_4)

	local var_4_6 = {
		clearChildrenSFX = true
	}

	arg_4_0:setGainFocusAllSFX(SOUND_SETS.mpMainMenu.quickPlayMove, var_4_6)

	local function var_4_7()
		local var_10_0 = arg_4_0:GetDataSource().xpScale:GetValue(arg_4_1)

		if var_10_0 ~= nil then
			arg_4_0._showXPModifier = var_10_0 > 1 and true or false

			arg_4_0.XPModifierIcon:SetAlpha(var_10_0 > 1 and 1 or 0)
		end
	end

	arg_4_0:SubscribeToModelThroughElement(arg_4_0, "xpScale", var_4_7)
end

function PlaylistFilterButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p)

	var_11_0.id = "PlaylistFilterButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "GenericButtonBackground"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.GenericButtonBackground = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIStyledText.new()

	var_11_6.id = "GamemodeText"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_6:SetWordWrap(false)
	var_11_6:SetAlignment(LUI.Alignment.Left)
	var_11_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_11_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 375, _1080p * -14, _1080p * 14)

	local function var_11_7()
		local var_12_0 = var_11_0:GetDataSource().name:GetValue(var_11_1)

		if var_12_0 ~= nil then
			var_11_6:setText(MarkLocalized(ToUpperCase(var_12_0)), 0)
		end
	end

	var_11_6:SubscribeToModelThroughElement(var_11_0, "name", var_11_7)
	var_11_0:addElement(var_11_6)

	var_11_0.GamemodeText = var_11_6

	local var_11_8
	local var_11_9 = LUI.UIImage.new()

	var_11_9.id = "Fill"

	var_11_9:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_11_9:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_11_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -46, _1080p * -24, _1080p * -11, _1080p * 11)
	var_11_0:addElement(var_11_9)

	var_11_0.Fill = var_11_9

	local var_11_10
	local var_11_11 = LUI.UIImage.new()

	var_11_11.id = "EventBanner"

	var_11_11:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_11_11:SetAlpha(0, 0)
	var_11_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, 0, _1080p * 50)
	var_11_0:addElement(var_11_11)

	var_11_0.EventBanner = var_11_11

	local var_11_12
	local var_11_13 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_13.id = "NewItemNotification"

	var_11_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -116, _1080p * -108, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_13)

	var_11_0.NewItemNotification = var_11_13

	local var_11_14
	local var_11_15 = LUI.UIImage.new()

	var_11_15.id = "Lock"

	var_11_15:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_11_15:SetAlpha(0, 0)
	var_11_15:SetColorOp(COLOR_OP.saturation, 0)
	var_11_15:SetColorOpParam(1, 0)
	var_11_15:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -50, _1080p * -20, _1080p * 9, _1080p * 39)
	var_11_0:addElement(var_11_15)

	var_11_0.Lock = var_11_15

	local var_11_16
	local var_11_17 = LUI.UIImage.new()

	var_11_17.id = "XPModifierIcon"

	var_11_17:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_17:setImage(RegisterMaterial("icon_double_xp_mini"), 0)
	var_11_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 395, _1080p * 455, _1080p * 10, _1080p * 40)
	var_11_0:addElement(var_11_17)

	var_11_0.XPModifierIcon = var_11_17

	local function var_11_18()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_18

	local var_11_19
	local var_11_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOver", var_11_20)

	local function var_11_21()
		var_11_6:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_21

	local var_11_22
	local var_11_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUp", var_11_23)

	local function var_11_24()
		var_11_6:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_24

	local var_11_25
	local var_11_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_11_9:RegisterAnimationSequence("Check", var_11_26)

	local function var_11_27()
		var_11_9:AnimateSequence("Check")
	end

	var_11_0._sequences.Check = var_11_27

	local var_11_28
	local var_11_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_11_9:RegisterAnimationSequence("UnCheck", var_11_29)

	local function var_11_30()
		var_11_9:AnimateSequence("UnCheck")
	end

	var_11_0._sequences.UnCheck = var_11_30

	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("PlaylistFilterButton", PlaylistFilterButton)
LockTable(_M)
