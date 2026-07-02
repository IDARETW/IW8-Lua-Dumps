module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.valid then
		local var_1_0 = tonumber(arg_1_1.prestige) or 0
		local var_1_1 = PROGRESSION.ValidatePrestigeLevel(var_1_0)
		local var_1_2 = tonumber(arg_1_1.rank) or 0
		local var_1_3 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = var_1_2,
			_prestigeLevel = var_1_1
		})

		if var_1_3 then
			arg_1_0.RankDisplay:setText(var_1_3._rankDisplay)
			arg_1_0.RankIcon:SetAlpha(1)
			arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_3._rankIcon))
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Name:setText("")
	arg_2_0.RankDisplay:setText("")
	arg_2_0.RankIcon:SetAlpha(0)

	arg_2_0.xuid = arg_2_1.xuid

	var_0_0(arg_2_0, arg_2_1)

	local var_2_0 = arg_2_1.gamertag and arg_2_1.gamertag or ""

	arg_2_0.Name:setText(var_2_0)
	arg_2_0:SetButtonDisabled(not arg_2_1.approved)

	local var_2_1 = arg_2_1.reasons and arg_2_1.reasons[1]
	local var_2_2 = "HideItemOwned"

	if var_2_1 and (var_2_1 == GIFT.GIFT_NOT_APPROVED_REASONS.ITEM_ALREADY_PERMANENTLY_OWNED or var_2_1 == GIFT.GIFT_NOT_APPROVED_REASONS.WEEKLY_GIFT_LIMIT_REACHED) then
		var_2_2 = "ShowItemOwned"
	end

	ACTIONS.AnimateSequence(arg_2_0, var_2_2)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.RefreshButton = var_0_1

	arg_3_0:registerEventHandler("playercard_cache_update", function(arg_4_0, arg_4_1)
		if arg_3_0.xuid ~= nil then
			local var_4_0 = Friends.HCAFBJBHC(arg_4_1.controller, arg_3_0.xuid)

			var_0_0(arg_3_0, var_4_0)
		end
	end)
end

function GiftingFriendSelectRowButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 34 * _1080p)

	var_5_0.id = "GiftingFriendSelectRowButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "WZWipBackground"

	var_5_4:SetAlpha(0.5, 0)
	var_5_4:setImage(RegisterMaterial("ui_mp_br_shared_button_loadout_background_ch2"), 0)
	var_5_4:Setup3SliceHorizontalImage(_1080p * 6, 0.3)
	var_5_0:addElement(var_5_4)

	var_5_0.WZWipBackground = var_5_4

	local var_5_5

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		var_5_5 = LUI.UIImage.new()
		var_5_5.id = "WZWipGradient"

		var_5_5:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_5_5:SetAlpha(0, 0)
		var_5_5:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_5_0:addElement(var_5_5)

		var_5_0.WZWipGradient = var_5_5
	end

	local var_5_6

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_5_7 = LUI.UIImage.new()

		var_5_7.id = "BotBorderWZ"

		var_5_7:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
		var_5_7:SetAlpha(0.5, 0)
		var_5_7:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 1, _1080p * -2, _1080p * -1, 0)
		var_5_0:addElement(var_5_7)

		var_5_0.BotBorderWZ = var_5_7
	end

	local var_5_8

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_5_9 = LUI.UIImage.new()

		var_5_9.id = "TopBorderWZ"

		var_5_9:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
		var_5_9:SetAlpha(0.5, 0)
		var_5_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * -2, 0, _1080p * 1)
		var_5_0:addElement(var_5_9)

		var_5_0.TopBorderWZ = var_5_9
	end

	local var_5_10
	local var_5_11 = LUI.UIImage.new()

	var_5_11.id = "RankIcon"

	var_5_11:SetAlpha(0.75, 0)
	var_5_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 11, _1080p * 47, _1080p * -18, _1080p * 18)
	var_5_0:addElement(var_5_11)

	var_5_0.RankIcon = var_5_11

	local var_5_12
	local var_5_13 = LUI.UIStyledText.new()

	var_5_13.id = "Name"

	var_5_13:SetRGBFromTable(SWATCHES.CH2.OperatorFilterEnabled, 0)
	var_5_13:setText("Name", 0)
	var_5_13:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_13:SetAlignment(LUI.Alignment.Left)
	var_5_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 284, _1080p * 5, _1080p * 27)
	var_5_0:addElement(var_5_13)

	var_5_0.Name = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIStyledText.new()

	var_5_15.id = "RankDisplay"

	var_5_15:SetRGBFromTable(SWATCHES.CH2.OperatorFilterEnabled, 0)
	var_5_15:setText("99", 0)
	var_5_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_15:SetAlignment(LUI.Alignment.Left)
	var_5_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 80, _1080p * 5, _1080p * 27)
	var_5_0:addElement(var_5_15)

	var_5_0.RankDisplay = var_5_15

	local var_5_16
	local var_5_17 = LUI.UIImage.new()

	var_5_17.id = "ItemOwnedImage"

	var_5_17:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_5_17:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_5_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -34, _1080p * -2, _1080p * -16, _1080p * 16)
	var_5_0:addElement(var_5_17)

	var_5_0.ItemOwnedImage = var_5_17

	local var_5_18
	local var_5_19 = LUI.UIImage.new()

	var_5_19.id = "Lock"

	var_5_19:SetRGBFromTable(SWATCHES.CH2.OperatorFilterEnabled, 0)
	var_5_19:SetAlpha(0, 0)
	var_5_19:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_19:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -58, _1080p * -34, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_19)

	var_5_0.Lock = var_5_19

	local var_5_20
	local var_5_21 = LUI.UIImage.new()

	var_5_21.id = "BackgroundDarkener"

	var_5_21:SetRGBFromInt(0, 0)
	var_5_21:SetAlpha(0, 0)
	var_5_21:Setup3SliceVerticalImage(_1080p * 50, 0.5)
	var_5_0:addElement(var_5_21)

	var_5_0.BackgroundDarkener = var_5_21

	local function var_5_22()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_22

	local var_5_23
	local var_5_24 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_24)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_5_25 = {
			{
				value = 0.15,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_5:RegisterAnimationSequence("ButtonOver", var_5_25)
	end

	local var_5_26 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonOver", var_5_26)

	local var_5_27 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_15:RegisterAnimationSequence("ButtonOver", var_5_27)

	local var_5_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_19:RegisterAnimationSequence("ButtonOver", var_5_28)

	local function var_5_29()
		var_5_4:AnimateSequence("ButtonOver")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_5_5:AnimateSequence("ButtonOver")
		end

		var_5_13:AnimateSequence("ButtonOver")
		var_5_15:AnimateSequence("ButtonOver")
		var_5_19:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_31)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_5_32 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_5:RegisterAnimationSequence("ButtonUp", var_5_32)
	end

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.OperatorFilterEnabled
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonUp", var_5_33)

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.OperatorFilterEnabled
		}
	}

	var_5_15:RegisterAnimationSequence("ButtonUp", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.OperatorFilterEnabled
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_19:RegisterAnimationSequence("ButtonUp", var_5_35)

	local function var_5_36()
		var_5_4:AnimateSequence("ButtonUp")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_5_5:AnimateSequence("ButtonUp")
		end

		var_5_13:AnimateSequence("ButtonUp")
		var_5_15:AnimateSequence("ButtonUp")
		var_5_19:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_36

	local var_5_37
	local var_5_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_17:RegisterAnimationSequence("ShowItemOwned", var_5_38)

	local function var_5_39()
		var_5_17:AnimateSequence("ShowItemOwned")
	end

	var_5_0._sequences.ShowItemOwned = var_5_39

	local var_5_40
	local var_5_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_17:RegisterAnimationSequence("HideItemOwned", var_5_41)

	local function var_5_42()
		var_5_17:AnimateSequence("HideItemOwned")
	end

	var_5_0._sequences.HideItemOwned = var_5_42

	local var_5_43
	local var_5_44 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOverDisabled", var_5_44)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_5_45 = {
			{
				value = 0.15,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_5:RegisterAnimationSequence("ButtonOverDisabled", var_5_45)
	end

	local var_5_46 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonOverDisabled", var_5_46)

	local var_5_47 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_15:RegisterAnimationSequence("ButtonOverDisabled", var_5_47)

	local var_5_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_5_19:RegisterAnimationSequence("ButtonOverDisabled", var_5_48)

	local function var_5_49()
		var_5_4:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_5_5:AnimateSequence("ButtonOverDisabled")
		end

		var_5_13:AnimateSequence("ButtonOverDisabled")
		var_5_15:AnimateSequence("ButtonOverDisabled")
		var_5_19:AnimateSequence("ButtonOverDisabled")
	end

	var_5_0._sequences.ButtonOverDisabled = var_5_49

	local var_5_50
	local var_5_51 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUpDisabled", var_5_51)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_5_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_5:RegisterAnimationSequence("ButtonUpDisabled", var_5_52)
	end

	local var_5_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.OperatorFilterEnabled
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonUpDisabled", var_5_53)

	local var_5_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.OperatorFilterEnabled
		}
	}

	var_5_15:RegisterAnimationSequence("ButtonUpDisabled", var_5_54)

	local var_5_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.OperatorFilterEnabled
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_19:RegisterAnimationSequence("ButtonUpDisabled", var_5_55)

	local function var_5_56()
		var_5_4:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_5_5:AnimateSequence("ButtonUpDisabled")
		end

		var_5_13:AnimateSequence("ButtonUpDisabled")
		var_5_15:AnimateSequence("ButtonUpDisabled")
		var_5_19:AnimateSequence("ButtonUpDisabled")
	end

	var_5_0._sequences.ButtonUpDisabled = var_5_56

	var_5_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUpDisabled")
	end)
	var_5_0:addEventHandler("button_over_disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOverDisabled")
	end)
	var_5_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_5_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("GiftingFriendSelectRowButton", GiftingFriendSelectRowButton)
LockTable(_M)
