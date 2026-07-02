module(..., package.seeall)

local var_0_0 = 38 * _1080p

local function var_0_1(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_0._focusedAnim)

	if arg_1_0.list then
		arg_1_0.list:SetAlpha(1)
	end
end

local function var_0_2(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._unFocusedAnim)

	if arg_2_0.list then
		arg_2_0.list:SetAlpha(0)
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0._data = arg_3_1
	arg_3_0._bladeKey = arg_3_1.bladeKey
	arg_3_0._name = arg_3_1.name
	arg_3_0._imageName = arg_3_1.imageName
	arg_3_0._focusedAnim = arg_3_1.focusedAnim
	arg_3_0._unFocusedAnim = arg_3_1.unFocusedAnim
	arg_3_0._liveEventLocation = arg_3_1.liveEventLocation

	arg_3_0.Text:setText(arg_3_0._name)
	arg_3_0.Logo:setImage(RegisterMaterial(arg_3_0._imageName))
	arg_3_0.LiveEventInfo:GetMessage(arg_3_0._controllerIndex, {
		locationIndex = arg_3_0._liveEventLocation
	})

	local var_3_0 = arg_3_1.buttonsData

	for iter_3_0 = 1, #var_3_0 do
		local var_3_1 = MenuBuilder.BuildRegisteredType("WZBladeButton", {
			controllerIndex = arg_3_0._controllerIndex
		})

		var_3_1.id = "Button" .. tostring(iter_3_0)
		var_3_1.buttonKey = iter_3_0

		var_3_1.Text:setText(var_3_0[iter_3_0].name)
		var_3_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_0_0)
		arg_3_0.list:addElement(var_3_1)
		var_3_1:addEventHandler("button_over", function(arg_4_0, arg_4_1)
			var_0_1(arg_3_0)

			local var_4_0 = arg_3_0._data.buttonsData[var_3_1.buttonKey].videoName

			if var_4_0 then
				Engine.DFCGFCGBFD(var_4_0, VideoPlaybackFlags.LOOP)
			end

			local var_4_1 = arg_3_0._data.buttonsData[var_3_1.buttonKey].buttonOverAnimOverride

			if var_4_1 then
				ACTIONS.AnimateSequence(arg_4_0, var_4_1)
			end
		end)
		var_3_1:addEventHandler("button_up", function(arg_5_0, arg_5_1)
			var_0_2(arg_3_0)
			Engine.EBCGADABJ()
		end)
		var_3_1:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			arg_3_0._data.buttonsData[var_3_1.buttonKey].action(var_3_1, arg_3_0._controllerIndex)
		end)
	end

	local var_3_2 = tostring(arg_3_1.getFriendsCount(button, arg_3_0._controllerIndex))

	arg_3_0.FriendLabel:setText(Engine.CBBHFCGDIC("MENU/FRIENDS_PLAYING", var_3_2))
	arg_3_0.FriendCount:setText(var_3_2)
	var_0_2(arg_3_0)
end

local function var_0_4(arg_7_0)
	return arg_7_0._data
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1

	local var_8_0 = arg_8_0:getWidth()
	local var_8_1 = LUI.UIVerticalList.new()

	var_8_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 566 * _1080p, 1080 * _1080p)

	var_8_1.id = "list"

	var_8_1:SetSpacing(1 * _1080p)
	arg_8_0:addElement(var_8_1)

	arg_8_0.list = var_8_1

	arg_8_0.FriendLabel:setText("")
	arg_8_0.FriendCount:setText("")
	arg_8_0.FriendImage:setImage(RegisterMaterial("icon_playlist_players"))
	var_0_2(arg_8_0)

	arg_8_0.SetData = var_0_3
	arg_8_0.GetData = var_0_4
end

function WZMainMenuBlade(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalNavigator.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 640 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "WZMainMenuBlade"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Background"

	var_9_4:SetRGBFromInt(9999508, 0)
	var_9_4:SetAlpha(0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "Cinematic"

	var_9_6:SetAlpha(0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.Cinematic = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "Text"

	var_9_8:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_9_8:SetAlpha(0, 0)
	var_9_8:setText(ToUpperCase(""), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_9_8:SetAlignment(LUI.Alignment.Center)
	var_9_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_9_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 41, _1080p * -41, _1080p * 35, _1080p * 75)
	var_9_0:addElement(var_9_8)

	var_9_0.Text = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Foreground"

	var_9_10:SetRGBFromInt(10263708, 0)
	var_9_10:SetAlpha(0, 0)
	var_9_0:addElement(var_9_10)

	var_9_0.Foreground = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "Logo"

	var_9_12:SetScale(-0.25, 0)
	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 218, _1080p * 414)
	var_9_0:addElement(var_9_12)

	var_9_0.Logo = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIImage.new()

	var_9_14.id = "FriendBacker"

	var_9_14:SetRGBFromTable(SWATCHES.CH2.Ch2Brown, 0)
	var_9_14:SetAlpha(0.5, 0)
	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 164, _1080p * 476, _1080p * 902, _1080p * 924)
	var_9_0:addElement(var_9_14)

	var_9_0.FriendBacker = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIImage.new()

	var_9_16.id = "FriendImage"

	var_9_16:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_9_16:SetScale(-0.35, 0)
	var_9_16:setImage(RegisterMaterial("blade_friend"), 0)
	var_9_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 224, _1080p * 256, _1080p * -183, _1080p * -151)
	var_9_0:addElement(var_9_16)

	var_9_0.FriendImage = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIStyledText.new()

	var_9_18.id = "FriendLabel"

	var_9_18:setText(Engine.CBBHFCGDIC("MENU/FRIENDS_PLAYING"), 0)
	var_9_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_18:SetAlignment(LUI.Alignment.Left)
	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 261, _1080p * 435, _1080p * 904, _1080p * 922)
	var_9_0:addElement(var_9_18)

	var_9_0.FriendLabel = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIStyledText.new()

	var_9_20.id = "FriendCount"

	var_9_20:setText("", 0)
	var_9_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_20:SetAlignment(LUI.Alignment.Left)
	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 261, _1080p * 435, _1080p * 904, _1080p * 922)
	var_9_0:addElement(var_9_20)

	var_9_0.FriendCount = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIImage.new()

	var_9_22.id = "Stripe"

	var_9_22:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_9_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 123, _1080p * 517, _1080p * 419, _1080p * 423)
	var_9_0:addElement(var_9_22)

	var_9_0.Stripe = var_9_22

	local var_9_23
	local var_9_24 = LUI.UIImage.new()

	var_9_24.id = "BladeLock"

	var_9_24:SetAlpha(0, 0)
	var_9_24:setImage(RegisterMaterial("blade_lock"), 0)
	var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 304, _1080p * 336, _1080p * 404, _1080p * 436)
	var_9_0:addElement(var_9_24)

	var_9_0.BladeLock = var_9_24

	local var_9_25
	local var_9_26 = LUI.UIImage.new()

	var_9_26.id = "MenuBackerTop"

	var_9_26:SetAlpha(0, 0)
	var_9_26:setImage(RegisterMaterial("menu_backer"), 0)
	var_9_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112, _1080p * 626, _1080p * 570, _1080p * 710)
	var_9_0:addElement(var_9_26)

	var_9_0.MenuBackerTop = var_9_26

	local var_9_27
	local var_9_28 = LUI.UIImage.new()

	var_9_28.id = "MenuBackerBottom"

	var_9_28:SetAlpha(0, 0)
	var_9_28:setImage(RegisterMaterial("menu_backer"), 0)
	var_9_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 138, _1080p * 576, _1080p * 613, _1080p * 753)
	var_9_0:addElement(var_9_28)

	var_9_0.MenuBackerBottom = var_9_28

	local var_9_29
	local var_9_30 = MenuBuilder.BuildRegisteredType("CRMLiveEventBladeInfo", {
		controllerIndex = var_9_1
	})

	var_9_30.id = "LiveEventInfo"

	var_9_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -156, _1080p * 156, _1080p * 929, _1080p * 1005)
	var_9_0:addElement(var_9_30)

	var_9_0.LiveEventInfo = var_9_30

	local function var_9_31()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_31

	local var_9_32
	local var_9_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Focused", var_9_33)

	local var_9_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Focused", var_9_34)

	local var_9_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Focused", var_9_35)

	local var_9_36 = {
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

	var_9_12:RegisterAnimationSequence("Focused", var_9_36)

	local var_9_37 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476
		}
	}

	var_9_14:RegisterAnimationSequence("Focused", var_9_37)

	local var_9_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		}
	}

	var_9_16:RegisterAnimationSequence("Focused", var_9_38)

	local var_9_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("Focused", var_9_39)

	local var_9_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("Focused", var_9_40)

	local var_9_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 428
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 537
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("Focused", var_9_41)

	local var_9_42 = {
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 544
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 660
		}
	}

	var_9_26:RegisterAnimationSequence("Focused", var_9_42)

	local var_9_43 = {
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 584
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 494
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 703
		}
	}

	var_9_28:RegisterAnimationSequence("Focused", var_9_43)

	local function var_9_44()
		var_9_6:AnimateSequence("Focused")
		var_9_8:AnimateSequence("Focused")
		var_9_10:AnimateSequence("Focused")
		var_9_12:AnimateSequence("Focused")
		var_9_14:AnimateSequence("Focused")
		var_9_16:AnimateSequence("Focused")
		var_9_18:AnimateSequence("Focused")
		var_9_20:AnimateSequence("Focused")
		var_9_22:AnimateSequence("Focused")
		var_9_26:AnimateSequence("Focused")
		var_9_28:AnimateSequence("Focused")
	end

	var_9_0._sequences.Focused = var_9_44

	local var_9_45
	local var_9_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("UnFocused", var_9_46)

	local var_9_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("UnFocused", var_9_47)

	local var_9_48 = {
		{
			value = -0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("UnFocused", var_9_48)

	local var_9_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 348
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("UnFocused", var_9_49)

	local var_9_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 320
		}
	}

	var_9_16:RegisterAnimationSequence("UnFocused", var_9_50)

	local var_9_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("UnFocused", var_9_51)

	local var_9_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 494
		}
	}

	var_9_20:RegisterAnimationSequence("UnFocused", var_9_52)

	local var_9_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 419
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 423
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 304
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 336
		}
	}

	var_9_22:RegisterAnimationSequence("UnFocused", var_9_53)

	local var_9_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("UnFocused", var_9_54)

	local function var_9_55()
		var_9_6:AnimateSequence("UnFocused")
		var_9_8:AnimateSequence("UnFocused")
		var_9_12:AnimateSequence("UnFocused")
		var_9_14:AnimateSequence("UnFocused")
		var_9_16:AnimateSequence("UnFocused")
		var_9_18:AnimateSequence("UnFocused")
		var_9_20:AnimateSequence("UnFocused")
		var_9_22:AnimateSequence("UnFocused")
		var_9_24:AnimateSequence("UnFocused")
	end

	var_9_0._sequences.UnFocused = var_9_55

	local var_9_56
	local var_9_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("FocusedUnowned", var_9_57)

	local var_9_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase("")
		}
	}

	var_9_8:RegisterAnimationSequence("FocusedUnowned", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("FocusedUnowned", var_9_59)

	local var_9_60 = {
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

	var_9_12:RegisterAnimationSequence("FocusedUnowned", var_9_60)

	local var_9_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476
		}
	}

	var_9_14:RegisterAnimationSequence("FocusedUnowned", var_9_61)

	local var_9_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		}
	}

	var_9_16:RegisterAnimationSequence("FocusedUnowned", var_9_62)

	local var_9_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("FocusedUnowned", var_9_63)

	local var_9_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("FocusedUnowned", var_9_64)

	local var_9_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 428
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 537
		}
	}

	var_9_22:RegisterAnimationSequence("FocusedUnowned", var_9_65)

	local function var_9_66()
		var_9_6:AnimateSequence("FocusedUnowned")
		var_9_8:AnimateSequence("FocusedUnowned")
		var_9_10:AnimateSequence("FocusedUnowned")
		var_9_12:AnimateSequence("FocusedUnowned")
		var_9_14:AnimateSequence("FocusedUnowned")
		var_9_16:AnimateSequence("FocusedUnowned")
		var_9_18:AnimateSequence("FocusedUnowned")
		var_9_20:AnimateSequence("FocusedUnowned")
		var_9_22:AnimateSequence("FocusedUnowned")
	end

	var_9_0._sequences.FocusedUnowned = var_9_66

	local var_9_67
	local var_9_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("UnFocusedUnowned", var_9_68)

	local var_9_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/COMMERCE_PURCHASE"))
		}
	}

	var_9_8:RegisterAnimationSequence("UnFocusedUnowned", var_9_69)

	local var_9_70 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("UnFocusedUnowned", var_9_70)

	local var_9_71 = {
		{
			value = -0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("UnFocusedUnowned", var_9_71)

	local var_9_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 348
		}
	}

	var_9_14:RegisterAnimationSequence("UnFocusedUnowned", var_9_72)

	local var_9_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 320
		}
	}

	var_9_16:RegisterAnimationSequence("UnFocusedUnowned", var_9_73)

	local var_9_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("UnFocusedUnowned", var_9_74)

	local var_9_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 494
		}
	}

	var_9_20:RegisterAnimationSequence("UnFocusedUnowned", var_9_75)

	local var_9_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 389
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 393
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 304
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 336
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("UnFocusedUnowned", var_9_76)

	local var_9_77 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("UnFocusedUnowned", var_9_77)

	local function var_9_78()
		var_9_6:AnimateSequence("UnFocusedUnowned")
		var_9_8:AnimateSequence("UnFocusedUnowned")
		var_9_10:AnimateSequence("UnFocusedUnowned")
		var_9_12:AnimateSequence("UnFocusedUnowned")
		var_9_14:AnimateSequence("UnFocusedUnowned")
		var_9_16:AnimateSequence("UnFocusedUnowned")
		var_9_18:AnimateSequence("UnFocusedUnowned")
		var_9_20:AnimateSequence("UnFocusedUnowned")
		var_9_22:AnimateSequence("UnFocusedUnowned")
		var_9_24:AnimateSequence("UnFocusedUnowned")
	end

	var_9_0._sequences.UnFocusedUnowned = var_9_78

	var_0_5(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("WZMainMenuBlade", WZMainMenuBlade)
LockTable(_M)
