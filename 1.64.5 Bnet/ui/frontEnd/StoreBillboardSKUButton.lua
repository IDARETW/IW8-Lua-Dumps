module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.NewItemNotification:SetAlpha(arg_1_1)

	if arg_1_1 == 0 then
		arg_1_0.FreeText:SetRight(0)
	else
		arg_1_0.FreeText:SetRight(_1080p * -28)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_1.titleImage and #arg_2_1.titleImage > 0 then
		arg_2_0.ItemTitle:SetAlpha(1)
		arg_2_0.ItemTitle:setImage(RegisterMaterial(arg_2_1.titleImage))
	else
		arg_2_0.ItemTitle:SetAlpha(0)
	end

	local var_2_0 = Engine.DGAIDIEIAC()
	local var_2_1 = var_2_0 == 0 or var_2_0 == 1

	if arg_2_1.fetchingDataFailed then
		arg_2_0.ItemName:SetAlpha(1)
		arg_2_0.ItemName:setText(Engine.CBBHFCGDIC("MENU/FETCHING_STORE_DATA_FAILED"))
	elseif arg_2_1.name and not var_2_1 then
		if arg_2_1.emptyCategory then
			arg_2_0.ItemName:SetAlpha(0)
		else
			arg_2_0.ItemName:SetAlpha(1)
			arg_2_0.ItemName:setText(Engine.CBBHFCGDIC(arg_2_1.name))
		end
	else
		arg_2_0.ItemName:SetAlpha(0)
	end

	if arg_2_1.emptyCategory then
		arg_2_0.SoldOutMessage:SetAlpha(1)
	else
		arg_2_0.SoldOutMessage:SetAlpha(0)
	end

	if arg_2_1.asset and #arg_2_1.asset > 0 then
		arg_2_0.ItemImage:SetAlpha(1)
		arg_2_0.ItemImage:setImage(RegisterMaterial(arg_2_1.asset))
	else
		assert(false, "Missing Image Asset for item ID " .. arg_2_1.id)
		arg_2_0.ItemImage:SetAlpha(0)
	end

	if arg_2_2[tostring(arg_2_1.id)] and not arg_2_3 then
		arg_2_0.HotItemNotification:SetAlpha(1)
	else
		arg_2_0.HotItemNotification:SetAlpha(0)
	end

	if arg_2_1.purchaseEnd then
		arg_2_0.TimerClock:SetAlpha(1)
	else
		arg_2_0.TimerClock:SetAlpha(0)
	end

	ACTIONS.AnimateSequence(arg_2_0, "NotFree")

	if arg_2_1.id then
		local var_2_2, var_2_3 = STORE.GetBundleCost(arg_2_0._controllerIndex, arg_2_1.id)
		local var_2_4 = var_2_2

		if var_2_3 and var_2_3 < var_2_2 then
			var_2_4 = var_2_3
		end

		if var_2_4 <= 0 then
			ACTIONS.AnimateSequence(arg_2_0, "Free")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NotFree")
		end
	else
		ACTIONS.AnimateSequence(arg_2_0, "NotFree")
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._buttonData = arg_3_1

	arg_3_0.ItemImage:setImage(RegisterMaterial(arg_3_1.image))
	arg_3_0.ItemTitle:setImage(RegisterMaterial(arg_3_1.titleImage))
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateButton = var_0_1
	arg_4_0.UpdateNewIndicator = var_0_0
	arg_4_0.SetButtonData = var_0_2
	arg_4_0._controllerIndex = arg_4_1

	arg_4_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		arg_4_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 145, 200, LUI.EASING.outQuadratic)
		arg_4_0.ItemTitle:SetScale(-0.73, 200, LUI.EASING.outQuadratic)
		arg_4_0.ItemImage:SetScale(-0.75, 200, LUI.EASING.outQuadratic)
	end)
	arg_4_0:addEventHandler("lose_focus", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
		arg_4_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 120, 100, LUI.EASING.outQuadratic)
		arg_4_0.ItemTitle:SetScale(-0.75, 100)
		arg_4_0.ItemImage:SetScale(-0.78, 100)
	end)
	arg_4_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if not arg_7_0._buttonData or arg_7_0._buttonData.owned then
			return true
		end

		if Engine.DBFCJBDJEC() and STORE.IsZeusTrialProduct(arg_7_0._buttonData.productId) and Dvar.IBEGCHEFE("OLTPNRMRPP") then
			STORE.GoToZeusInBattleNet(arg_4_1)
		elseif Engine.DBFCJBDJEC() and arg_7_0._buttonData.productId == STORE.VanguardTrialID then
			STORE.GoToX2InBattleNet(arg_4_1)
		elseif arg_7_0._buttonData.uri ~= nil then
			Engine.CBEBCGFAIE(arg_4_1, arg_7_0._buttonData.uri)
		else
			InGameStore.SelectProduct(arg_4_1, arg_7_0._buttonData.productId, InGameStorePurchaseType.BROWSE)
		end

		if arg_7_0._buttonData.leavePartyAndLobbyOnPurchase and Lobby.BBDICGHE() then
			Lobby.LeavePublicLobby()

			if LUI.FlowManager.IsInStack("BRPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("BRPublicLobby", true, true)
			elseif LUI.FlowManager.IsInStack("MPPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("MPPublicLobby", true, true)
			end
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function StoreBillboardSKUButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 120 * _1080p)

	var_8_0.id = "StoreBillboardSKUButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:setUseStencil(true)

	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "ItemImage"

	var_8_4:SetRGBFromInt(5066061, 0)
	var_8_4:SetScale(-0.78, 0)
	var_8_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -290, _1080p * 290)
	var_8_0:addElement(var_8_4)

	var_8_0.ItemImage = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "FreeBanner"

	var_8_6:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_8_6:SetAlpha(0, 0)
	var_8_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top_opaque_dark"), 0)
	var_8_6:SetVMin(0.25, 0)
	var_8_6:SetVMax(0.75, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 195, _1080p * -5, 0, _1080p * 28)
	var_8_0:addElement(var_8_6)

	var_8_0.FreeBanner = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "FreeText"

	var_8_8:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COST_FREE")), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetTracking(2 * _1080p, 0)
	var_8_8:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetStartupDelay(2000)
	var_8_8:SetLineHoldTime(400)
	var_8_8:SetAnimMoveTime(2000)
	var_8_8:SetAnimMoveSpeed(150)
	var_8_8:SetEndDelay(2000)
	var_8_8:SetCrossfadeTime(250)
	var_8_8:SetFadeInTime(300)
	var_8_8:SetFadeOutTime(300)
	var_8_8:SetMaxVisibleLines(1)
	var_8_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 195, _1080p * -35, _1080p * 5, _1080p * 23)
	var_8_0:addElement(var_8_8)

	var_8_0.FreeText = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "ItemTitle"

	var_8_10:SetScale(-0.75, 0)
	var_8_10:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -177, _1080p * 335, _1080p * -87, _1080p * 169)
	var_8_0:addElement(var_8_10)

	var_8_0.ItemTitle = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Gradient"

	var_8_12:SetRGBFromInt(0, 0)
	var_8_12:SetAlpha(0.4, 0)
	var_8_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -75, 0)
	var_8_0:addElement(var_8_12)

	var_8_0.Gradient = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIStyledText.new()

	var_8_14.id = "ItemName"

	var_8_14:SetRGBFromTable(SWATCHES.Store.TextIdle, 0)
	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetWordWrap(false)
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_8_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_14:SetStartupDelay(2000)
	var_8_14:SetLineHoldTime(400)
	var_8_14:SetAnimMoveTime(2000)
	var_8_14:SetAnimMoveSpeed(150)
	var_8_14:SetEndDelay(2000)
	var_8_14:SetCrossfadeTime(250)
	var_8_14:SetFadeInTime(300)
	var_8_14:SetFadeOutTime(300)
	var_8_14:SetMaxVisibleLines(2)
	var_8_14:SetShadowRGBFromInt(0, 0)
	var_8_14:SetOutlineRGBFromInt(0, 0)
	var_8_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -34, _1080p * -10)
	var_8_0:addElement(var_8_14)

	var_8_0.ItemName = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "HighlightBarBottom"

	var_8_16:SetAlpha(0, 0)
	var_8_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_8_0:addElement(var_8_16)

	var_8_0.HighlightBarBottom = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIImage.new()

	var_8_18.id = "NewItemNotification"

	var_8_18:SetAlpha(0, 0)
	var_8_18:SetPixelGridEnabled(true)
	var_8_18:SetPixelGridContrast(0.2, 0)
	var_8_18:SetPixelGridBlockWidth(1, 0)
	var_8_18:SetPixelGridBlockHeight(1, 0)
	var_8_18:SetPixelGridGutterWidth(1, 0)
	var_8_18:SetPixelGridGutterHeight(1, 0)
	var_8_18:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
	var_8_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, _1080p * -4, 0, _1080p * 28)
	var_8_0:addElement(var_8_18)

	var_8_0.NewItemNotification = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "HotItemNotification"

	var_8_20:SetAlpha(0, 0)
	var_8_20:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_8_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -57, _1080p * -7, _1080p * -113, _1080p * -63)
	var_8_0:addElement(var_8_20)

	var_8_0.HotItemNotification = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIStyledText.new()

	var_8_22.id = "SoldOutMessage"

	var_8_22:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_8_22:SetAlpha(0, 0)
	var_8_22:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_COMING_SOON"), 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_22:SetWordWrap(false)
	var_8_22:SetAlignment(LUI.Alignment.Left)
	var_8_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_22:SetStartupDelay(2000)
	var_8_22:SetLineHoldTime(400)
	var_8_22:SetAnimMoveTime(2000)
	var_8_22:SetAnimMoveSpeed(150)
	var_8_22:SetEndDelay(2000)
	var_8_22:SetCrossfadeTime(250)
	var_8_22:SetFadeInTime(300)
	var_8_22:SetFadeOutTime(300)
	var_8_22:SetMaxVisibleLines(1)
	var_8_22:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -38, _1080p * -10)
	var_8_0:addElement(var_8_22)

	var_8_0.SoldOutMessage = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIImage.new()

	var_8_24.id = "TimerClock"

	var_8_24:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_8_24:SetAlpha(0, 0)
	var_8_24:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_8_24:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -21, _1080p * -5, _1080p * -21, _1080p * -5)
	var_8_0:addElement(var_8_24)

	var_8_0.TimerClock = var_8_24

	local function var_8_25()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_25

	local var_8_26
	local var_8_27 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_27)

	local var_8_28 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOver", var_8_28)

	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonOver", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonOver", var_8_30)

	local function var_8_31()
		var_8_4:AnimateSequence("ButtonOver")
		var_8_12:AnimateSequence("ButtonOver")
		var_8_14:AnimateSequence("ButtonOver")
		var_8_16:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			value = 5000268,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUp", var_8_33)

	local var_8_34 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUp", var_8_34)

	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextIdle
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonUp", var_8_35)

	local var_8_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonUp", var_8_36)

	local function var_8_37()
		var_8_4:AnimateSequence("ButtonUp")
		var_8_12:AnimateSequence("ButtonUp")
		var_8_14:AnimateSequence("ButtonUp")
		var_8_16:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_37

	local function var_8_38()
		return
	end

	var_8_0._sequences.Locked = var_8_38

	local var_8_39
	local var_8_40 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOverDisabled", var_8_40)

	local function var_8_41()
		var_8_12:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_41

	local var_8_42
	local var_8_43 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUpDisabled", var_8_43)

	local function var_8_44()
		var_8_12:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_44

	local var_8_45
	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_8_14:RegisterAnimationSequence("AR", var_8_46)

	local function var_8_47()
		var_8_14:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_47

	local var_8_48
	local var_8_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_8_4:RegisterAnimationSequence("CategoryEmpty", var_8_49)

	local function var_8_50()
		var_8_4:AnimateSequence("CategoryEmpty")
	end

	var_8_0._sequences.CategoryEmpty = var_8_50

	local var_8_51
	local var_8_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_8_4:RegisterAnimationSequence("CategoryNotEmpty", var_8_52)

	local function var_8_53()
		var_8_4:AnimateSequence("CategoryNotEmpty")
	end

	var_8_0._sequences.CategoryNotEmpty = var_8_53

	local var_8_54
	local var_8_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Free", var_8_55)

	local var_8_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Free", var_8_56)

	local function var_8_57()
		var_8_6:AnimateSequence("Free")
		var_8_8:AnimateSequence("Free")
	end

	var_8_0._sequences.Free = var_8_57

	local var_8_58
	local var_8_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("NotFree", var_8_59)

	local var_8_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("NotFree", var_8_60)

	local function var_8_61()
		var_8_6:AnimateSequence("NotFree")
		var_8_8:AnimateSequence("NotFree")
	end

	var_8_0._sequences.NotFree = var_8_61

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("StoreBillboardSKUButton", StoreBillboardSKUButton)
LockTable(_M)
