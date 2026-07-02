module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().name:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			arg_1_0.Button.Text:setText(var_2_0)
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "name", var_1_0)

	local function var_1_1()
		if arg_1_0:GetDataSource().isUnlocked:GetValue(arg_1_1) then
			arg_1_0.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_USE")

			ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
		else
			arg_1_0.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_PURCHASE_DESC")

			ACTIONS.AnimateSequence(arg_1_0, "Locked")
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "isUnlocked", var_1_1)

	local function var_1_2()
		local var_4_0 = arg_1_0:GetDataSource().isSelected:GetValue(arg_1_1)

		arg_1_0.CheckBox:SetAlpha(var_4_0 and 1 or 0)
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "isSelected", var_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_1_0, "ButtonUp")
	end)
	arg_1_0:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
		if not arg_7_0:GetDataSource().isUnlocked:GetValue(arg_1_1) then
			local function var_7_0()
				STORE.GoToStore(arg_1_1, arg_7_0:GetCurrentMenu().id, arg_7_0.id)
			end

			local var_7_1 = arg_7_0:GetDataSource().name:GetValue(arg_1_1)

			LUI.FlowManager.RequestPopupMenu(arg_7_0, "AnnouncerStoreYesNoPopup", false, arg_1_1, false, {
				controllerIndex = arg_1_1,
				confirmAction = var_7_0,
				name = var_7_1
			})
		else
			local var_7_2 = arg_7_0:GetDataSource().announcerId

			assert(var_7_2)
			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).mp_announcer_type:set(var_7_2)

			local var_7_3 = "frontEnd.MP.AnnouncerVoice"

			WipeGlobalModelsAtPath(var_7_3)
			WipeGlobalModelsAtPath(var_7_3 .. "." .. "voice")
			ACTIONS.LeaveMenu(arg_7_0)
		end
	end)
end

function AnnouncerVoiceSelectButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_9_0.id = "AnnouncerVoiceSelectButton"
	var_9_0._animationSets = {}
	var_9_0._sequences = {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Button"

	var_9_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_9_4.Text:SetAlignment(LUI.Alignment.Left)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 38)
	var_9_0:addElement(var_9_4)

	var_9_0.Button = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericCheckBoxButton", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "CheckBox"

	var_9_6:SetAlpha(0, 0)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 428.81, _1080p * 444.81, _1080p * 7, _1080p * 23)
	var_9_0:addElement(var_9_6)

	var_9_0.CheckBox = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "PurchaseString"

	var_9_8:SetRGBFromInt(14277081, 0)
	var_9_8:SetAlpha(0, 0)
	var_9_8:setText(Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_PURCHASE"), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_8:SetAlignment(LUI.Alignment.Right)
	var_9_8:SetStartupDelay(1000)
	var_9_8:SetLineHoldTime(400)
	var_9_8:SetAnimMoveTime(150)
	var_9_8:SetEndDelay(1000)
	var_9_8:SetCrossfadeTime(400)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 257, _1080p * -82, _1080p * -9, _1080p * 9)
	var_9_0:addElement(var_9_8)

	var_9_0.PurchaseString = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Arrow"

	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("icon_download"), 0)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 423.81, _1080p * 449.81, _1080p * 2, _1080p * 28)
	var_9_0:addElement(var_9_10)

	var_9_0.Arrow = var_9_10

	local function var_9_11()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_11

	local var_9_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_9_0.CheckBox.Frame
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_9_0.CheckBox.Fill
		}
	}

	var_9_6:RegisterAnimationSequence("ButtonOver", var_9_12)

	local var_9_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_13)

	local function var_9_14()
		var_9_6:AnimateSequence("ButtonOver")
		var_9_8:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_14

	local var_9_15 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_9_0.CheckBox.Fill
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_9_0.CheckBox.Frame
		}
	}

	var_9_6:RegisterAnimationSequence("ButtonUp", var_9_15)

	local var_9_16 = {
		{
			value = 14277081,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_16)

	local function var_9_17()
		var_9_6:AnimateSequence("ButtonUp")
		var_9_8:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_17

	local var_9_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Locked", var_9_18)

	local var_9_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Locked", var_9_19)

	local var_9_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Locked", var_9_20)

	local function var_9_21()
		var_9_6:AnimateSequence("Locked")
		var_9_8:AnimateSequence("Locked")
		var_9_10:AnimateSequence("Locked")
	end

	var_9_0._sequences.Locked = var_9_21

	local var_9_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Unlocked", var_9_22)

	local function var_9_23()
		var_9_8:AnimateSequence("Unlocked")
	end

	var_9_0._sequences.Unlocked = var_9_23

	local var_9_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17.81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33.81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
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

	var_9_6:RegisterAnimationSequence("IsArabic", var_9_24)

	local var_9_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43.81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -420.19
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
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

	var_9_8:RegisterAnimationSequence("IsArabic", var_9_25)

	local var_9_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12.81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38.81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
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

	var_9_10:RegisterAnimationSequence("IsArabic", var_9_26)

	local function var_9_27()
		var_9_6:AnimateSequence("IsArabic")
		var_9_8:AnimateSequence("IsArabic")
		var_9_10:AnimateSequence("IsArabic")
	end

	var_9_0._sequences.IsArabic = var_9_27

	var_0_0(var_9_0, var_9_1, arg_9_1)

	if CONDITIONS.IsArabic(var_9_0) then
		ACTIONS.AnimateSequence(var_9_0, "IsArabic")
	end

	return var_9_0
end

MenuBuilder.registerType("AnnouncerVoiceSelectButton", AnnouncerVoiceSelectButton)
LockTable(_M)
