module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = ONBOARDING_DATA.GetGiftingFTUEData2FAEnrolled()

	local function var_1_1(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_2_0)
	end

	var_1_0.confirmButton.action = var_1_1

	LUI.FlowManager.RequestPopupMenu(arg_1_0, "onboardingpopup", true, arg_1_0._controllerIndex, false, var_1_0)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.backButtonOverride = arg_3_2.backButtonOverride
	arg_3_0.closePopupOverride = arg_3_2.backButtonOverride
	arg_3_0.moreInfoAction = var_0_0

	local var_3_0 = arg_3_2.battlePassSKU or arg_3_2.bundleSKU

	assert(var_3_0, "GiftingFriendSelectPopup - PostLoadFunc - Invalid sku is passed in!")
	arg_3_0.FriendSelectGrid:SetNumChildren(0)

	local var_3_1 = Friends.FBFFEFEGB(arg_3_1, 0, 0, 0, false, false)

	if var_3_1 and var_3_1.totalCount <= 0 then
		ACTIONS.AnimateSequence(arg_3_0, "HideSpinner")
		ACTIONS.AnimateSequence(arg_3_0, "ShowNoRecipients")

		return
	end

	arg_3_0._FriendsData = {}

	if not Gifting.BJHAGCGBCE(arg_3_1, var_3_0) then
		ACTIONS.AnimateSequence(arg_3_0, "HideSpinner")
		ACTIONS.AnimateSequence(arg_3_0, "ShowGenericError")

		return
	end

	arg_3_0._FriendsData = {}

	local var_3_2 = Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GIFT_BUNDLE")

	if arg_3_2.battlePassSKU then
		var_3_2 = Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GIFT_BATTLEPASS")
	end

	arg_3_0.MenuTitle:SetTitle(var_3_2)
	ACTIONS.AnimateSequence(arg_3_0.MenuTitle, "GiftingFlyout")

	local function var_3_3(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_1 + arg_4_2 * arg_3_0.FriendSelectGrid:GetNumColumns() + 1
		local var_4_1 = arg_3_0._FriendsData[var_4_0]

		arg_4_0._index = var_4_0

		arg_4_0:RefreshButton(var_4_1)
		arg_4_0:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
			local var_5_0 = arg_3_0._FriendsData[arg_4_0._index]

			if arg_3_0._selectedGifteeCallback then
				arg_3_0._selectedGifteeCallback(var_5_0.xuid)
			end

			Engine.CEJJDJJHIJ(arg_3_1, "dlog_event_gifting_recipient_selection", {
				transaction_id = "no info",
				friends_total = #arg_3_0._FriendsData,
				capped = arg_3_0.availableFriendsCount > 0 and "false" or "true",
				friends_eligible = arg_3_0.availableFriendsCount,
				friends_uno_ids = arg_3_0.friendIds,
				recipient_uno_id = var_5_0.xuid
			})
			ACTIONS.LeaveMenu(arg_3_0)
		end)
	end

	arg_3_0.FriendSelectGrid:SetRefreshChild(var_3_3)

	arg_3_0.friendIds = ""
	arg_3_0.availableFriendsCount = 0

	arg_3_0:registerEventHandler("gift_possible_recipients", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1.recipients

		if var_6_0 then
			for iter_6_0 = 1, #var_6_0 do
				local var_6_1 = var_6_0[iter_6_0]

				if var_6_1 then
					local var_6_2 = Friends.HCAFBJBHC(arg_3_1, var_6_1.xuid)

					if var_6_1.approved then
						arg_3_0.availableFriendsCount = arg_3_0.availableFriendsCount + 1

						if arg_3_0.friendIds == "" then
							arg_3_0.friendIds = tostring(var_6_1.xuid)
						else
							arg_3_0.friendIds = arg_3_0.friendIds .. "," .. var_6_1.xuid
						end
					end

					var_6_2.xuid = var_6_1.xuid
					var_6_2.approved = var_6_1.approved
					var_6_2.reasons = var_6_1.reasons

					table.insert(arg_3_0._FriendsData, var_6_2)
				end
			end

			if arg_6_1.nextPage >= 0 then
				if not Gifting.BJHAGCGBCE(arg_3_1, arg_6_1.sku, arg_6_1.nextPage) then
					ACTIONS.AnimateSequence(arg_3_0, "HideSpinner")
					ACTIONS.AnimateSequence(arg_3_0, "ShowGenericError")
				end

				return
			end

			arg_3_0.FriendSelectGrid:SetNumChildren(#arg_3_0._FriendsData)
			arg_3_0.FriendSelectGrid:FocusFirstItem()
			arg_3_0.AvailableFriendsCounter:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GIFT_AVAILABLE_FRIENDS_X_OF_Y", arg_3_0.availableFriendsCount, #arg_3_0._FriendsData))
		else
			ACTIONS.AnimateSequence(arg_3_0, "ShowGiftLimit")
		end

		ACTIONS.AnimateSequence(arg_3_0, "HideSpinner")
	end)

	arg_3_0._selectedGifteeCallback = arg_3_2.selectedGifteeCallback
end

function GiftingFriendSelectPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_7_0.id = "GiftingFriendSelectPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "MenuTitle"

	var_7_4.MenuTitle:setText(ToUpperCase(""), 0)
	var_7_4.Line:SetLeft(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112, _1080p * 1132, 0, _1080p * 100)
	var_7_0:addElement(var_7_4)

	var_7_0.MenuTitle = var_7_4

	local var_7_5
	local var_7_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 20,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GiftingFriendSelectRowButton", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 480,
		rowHeight = _1080p * 34,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_7 = LUI.UIGrid.new(var_7_6)

	var_7_7.id = "FriendSelectGrid"

	var_7_7:setUseStencil(true)
	var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 188, _1080p * 954)
	var_7_0:addElement(var_7_7)

	var_7_0.FriendSelectGrid = var_7_7

	local var_7_8
	local var_7_9 = LUI.UIImage.new()

	var_7_9.id = "ItemOwnedImage"

	var_7_9:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_7_9:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 201, _1080p * 233, _1080p * 102, _1080p * 134)
	var_7_0:addElement(var_7_9)

	var_7_0.ItemOwnedImage = var_7_9

	local var_7_10
	local var_7_11 = LUI.UIStyledText.new()

	var_7_11.id = "ItemOwnedDesc"

	var_7_11:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_7_11:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GIFT_FRIEND_OWNS_ITEM_DESC"), 0)
	var_7_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_11:SetAlignment(LUI.Alignment.Left)
	var_7_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 735, _1080p * 109, _1080p * 127)
	var_7_0:addElement(var_7_11)

	var_7_0.ItemOwnedDesc = var_7_11

	local var_7_12
	local var_7_13 = LUI.UIImage.new()

	var_7_13.id = "DailyLimitImage"

	var_7_13:setImage(RegisterMaterial("ui_icon_bundle_gift_small"), 0)
	var_7_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 497, _1080p * 516, _1080p * 164, _1080p * 183)
	var_7_0:addElement(var_7_13)

	var_7_0.DailyLimitImage = var_7_13

	local var_7_14
	local var_7_15 = LUI.UIStyledText.new()

	var_7_15.id = "DailyLimitDesc"

	var_7_15:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/DAILY_GIFTS_MAX"), 0)
	var_7_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_15:SetAlignment(LUI.Alignment.Left)
	var_7_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_15:SetStartupDelay(1000)
	var_7_15:SetLineHoldTime(400)
	var_7_15:SetAnimMoveTime(150)
	var_7_15:SetAnimMoveSpeed(50)
	var_7_15:SetEndDelay(1000)
	var_7_15:SetCrossfadeTime(400)
	var_7_15:SetFadeInTime(300)
	var_7_15:SetFadeOutTime(300)
	var_7_15:SetMaxVisibleLines(1)
	var_7_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 520, _1080p * 733, _1080p * 164, _1080p * 182)
	var_7_0:addElement(var_7_15)

	var_7_0.DailyLimitDesc = var_7_15

	local var_7_16
	local var_7_17 = LUI.UIStyledText.new()

	var_7_17.id = "AvailableFriendsCounter"

	var_7_17:setText("", 0)
	var_7_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_17:SetAlignment(LUI.Alignment.Left)
	var_7_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 457, _1080p * 163, _1080p * 183)
	var_7_0:addElement(var_7_17)

	var_7_0.AvailableFriendsCounter = var_7_17

	local var_7_18
	local var_7_19 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_7_1
	})

	var_7_19.id = "LoadingSpinner"

	var_7_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 278, _1080p * 618, _1080p * 494, _1080p * 504)
	var_7_0:addElement(var_7_19)

	var_7_0.LoadingSpinner = var_7_19

	local var_7_20
	local var_7_21 = LUI.UIStyledText.new()

	var_7_21.id = "LoadingListText"

	var_7_21:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOADING_LIST"), 0)
	var_7_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_21:SetAlignment(LUI.Alignment.Center)
	var_7_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 201, _1080p * 682, _1080p * 432, _1080p * 468)
	var_7_0:addElement(var_7_21)

	var_7_0.LoadingListText = var_7_21

	local var_7_22
	local var_7_23 = LUI.UIImage.new()

	var_7_23.id = "GiftImage"

	var_7_23:SetAlpha(0, 0)
	var_7_23:setImage(RegisterMaterial("ui_icon_bundle_gift"), 0)
	var_7_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 372, _1080p * 510, _1080p * 294, _1080p * 432)
	var_7_0:addElement(var_7_23)

	var_7_0.GiftImage = var_7_23

	local var_7_24
	local var_7_25 = LUI.UIStyledText.new()

	var_7_25.id = "GiftLimitReachedTitle"

	var_7_25:SetAlpha(0, 0)
	var_7_25:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_LIMIT_REACHED_TITLE"), 0)
	var_7_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_25:SetAlignment(LUI.Alignment.Center)
	var_7_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 432, _1080p * 468)
	var_7_0:addElement(var_7_25)

	var_7_0.GiftLimitReachedTitle = var_7_25

	local var_7_26
	local var_7_27 = LUI.UIStyledText.new()

	var_7_27.id = "GiftLimitReachedDesc"

	var_7_27:SetAlpha(0, 0)
	var_7_27:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_LIMIT_REACHED_DESC"), 0)
	var_7_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_27:SetAlignment(LUI.Alignment.Center)
	var_7_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 470, _1080p * 488)
	var_7_0:addElement(var_7_27)

	var_7_0.GiftLimitReachedDesc = var_7_27

	local var_7_28
	local var_7_29 = LUI.UIImage.new()

	var_7_29.id = "ErrorImage"

	var_7_29:SetAlpha(0, 0)
	var_7_29:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_7_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 372, _1080p * 510, _1080p * 294, _1080p * 432)
	var_7_0:addElement(var_7_29)

	var_7_0.ErrorImage = var_7_29

	local var_7_30
	local var_7_31 = LUI.UIStyledText.new()

	var_7_31.id = "ErrorTitle"

	var_7_31:SetAlpha(0, 0)
	var_7_31:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR"), 0)
	var_7_31:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_31:SetAlignment(LUI.Alignment.Center)
	var_7_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 432, _1080p * 468)
	var_7_0:addElement(var_7_31)

	var_7_0.ErrorTitle = var_7_31

	local var_7_32
	local var_7_33 = LUI.UIStyledText.new()

	var_7_33.id = "ErrorDesc"

	var_7_33:SetAlpha(0, 0)
	var_7_33:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_GENERIC_ERROR_DESC"), 0)
	var_7_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_33:SetAlignment(LUI.Alignment.Center)
	var_7_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 470, _1080p * 490)
	var_7_0:addElement(var_7_33)

	var_7_0.ErrorDesc = var_7_33

	local var_7_34
	local var_7_35 = LUI.UIImage.new()

	var_7_35.id = "NoRecipientsImage"

	var_7_35:SetAlpha(0, 0)
	var_7_35:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_7_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 372, _1080p * 510, _1080p * 294, _1080p * 432)
	var_7_0:addElement(var_7_35)

	var_7_0.NoRecipientsImage = var_7_35

	local var_7_36
	local var_7_37 = LUI.UIStyledText.new()

	var_7_37.id = "NoRecipientsTitle"

	var_7_37:SetAlpha(0, 0)
	var_7_37:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_NO_RECIPIENTS_AVAILABLE_TITLE"), 0)
	var_7_37:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_37:SetAlignment(LUI.Alignment.Center)
	var_7_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 432, _1080p * 468)
	var_7_0:addElement(var_7_37)

	var_7_0.NoRecipientsTitle = var_7_37

	local var_7_38
	local var_7_39 = LUI.UIStyledText.new()

	var_7_39.id = "NoRecipientsDesc"

	var_7_39:SetAlpha(0, 0)
	var_7_39:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_NO_RECIPIENTS_AVAILABLE_DESC"), 0)
	var_7_39:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_39:SetAlignment(LUI.Alignment.Center)
	var_7_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 200, _1080p * 682, _1080p * 470, _1080p * 488)
	var_7_0:addElement(var_7_39)

	var_7_0.NoRecipientsDesc = var_7_39

	local var_7_40
	local var_7_41 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_7_1
	})

	var_7_41.id = "VerticalScrollbar"

	var_7_41:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -143, _1080p * -121, _1080p * 188, _1080p * 954)
	var_7_0:addElement(var_7_41)

	var_7_0.VerticalScrollbar = var_7_41

	local function var_7_42()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_42

	local var_7_43
	local var_7_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_19:RegisterAnimationSequence("HideSpinner", var_7_44)

	local var_7_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_21:RegisterAnimationSequence("HideSpinner", var_7_45)

	local function var_7_46()
		var_7_19:AnimateSequence("HideSpinner")
		var_7_21:AnimateSequence("HideSpinner")
	end

	var_7_0._sequences.HideSpinner = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingError
		}
	}

	var_7_29:RegisterAnimationSequence("ShowGenericError", var_7_48)

	local var_7_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_GENERIC_ERROR_TITLE")
		}
	}

	var_7_31:RegisterAnimationSequence("ShowGenericError", var_7_49)

	local var_7_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_33:RegisterAnimationSequence("ShowGenericError", var_7_50)

	local function var_7_51()
		var_7_29:AnimateSequence("ShowGenericError")
		var_7_31:AnimateSequence("ShowGenericError")
		var_7_33:AnimateSequence("ShowGenericError")
	end

	var_7_0._sequences.ShowGenericError = var_7_51

	local var_7_52
	local var_7_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("ShowGiftLimit", var_7_53)

	local var_7_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("ShowGiftLimit", var_7_54)

	local var_7_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("ShowGiftLimit", var_7_55)

	local function var_7_56()
		var_7_23:AnimateSequence("ShowGiftLimit")
		var_7_25:AnimateSequence("ShowGiftLimit")
		var_7_27:AnimateSequence("ShowGiftLimit")
	end

	var_7_0._sequences.ShowGiftLimit = var_7_56

	local var_7_57
	local var_7_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_35:RegisterAnimationSequence("ShowNoRecipients", var_7_58)

	local var_7_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_37:RegisterAnimationSequence("ShowNoRecipients", var_7_59)

	local var_7_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_39:RegisterAnimationSequence("ShowNoRecipients", var_7_60)

	local function var_7_61()
		var_7_35:AnimateSequence("ShowNoRecipients")
		var_7_37:AnimateSequence("ShowNoRecipients")
		var_7_39:AnimateSequence("ShowNoRecipients")
	end

	var_7_0._sequences.ShowNoRecipients = var_7_61

	local var_7_62 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_7_41,
		startCap = var_7_41.startCap,
		endCap = var_7_41.endCap,
		sliderArea = var_7_41.sliderArea,
		slider = var_7_41.sliderArea and var_7_41.sliderArea.slider,
		fixedSizeSlider = var_7_41.sliderArea and var_7_41.sliderArea.fixedSizeSlider
	})

	var_7_7:AddScrollbar(var_7_62)
	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GiftingFriendSelectPopup", GiftingFriendSelectPopup)
LockTable(_M)
