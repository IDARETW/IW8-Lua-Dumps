module(..., package.seeall)

function MedalInfo(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 950 * _1080p, 0, 716 * _1080p)

	var_1_0.id = "MedalInfo"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "MedalIconLarge"

	var_1_4:SetAlpha(0.1, 0)
	var_1_4:SetScale(0.75, 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 100, _1080p * 400)

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().icon:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4:setImage(RegisterMaterial(var_2_0), 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "icon", var_1_5)
	var_1_0:addElement(var_1_4)

	var_1_0.MedalIconLarge = var_1_4

	local var_1_6
	local var_1_7 = LUI.UIImage.new()

	var_1_7.id = "MedalIconSmall"

	var_1_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 100, _1080p * 400)

	local function var_1_8()
		local var_3_0 = var_1_0:GetDataSource().icon:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_7:setImage(RegisterMaterial(var_3_0), 0)
		end
	end

	var_1_7:SubscribeToModelThroughElement(var_1_0, "icon", var_1_8)
	var_1_0:addElement(var_1_7)

	var_1_0.MedalIconSmall = var_1_7

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("icon_showcase_locked"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, 0, _1080p * 512)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("GenericItemInfoBG", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "Background"

	var_1_12.WhiteOverlay:SetAlpha(0.1, 0)
	var_1_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -140, 0)
	var_1_0:addElement(var_1_12)

	var_1_0.Background = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIStyledText.new()

	var_1_14.id = "Description"

	var_1_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_14:SetStartupDelay(1250)
	var_1_14:SetLineHoldTime(1250)
	var_1_14:SetAnimMoveTime(3000)
	var_1_14:SetEndDelay(1000)
	var_1_14:SetCrossfadeTime(500)
	var_1_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_1_14:SetMaxVisibleLines(3)
	var_1_14:SetDecodeLetterLength(5)
	var_1_14:SetDecodeMaxRandChars(3)
	var_1_14:SetDecodeUpdatesPerLetter(4)
	var_1_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 18, 0, _1080p * -71, _1080p * -49)

	local function var_1_15()
		local var_4_0 = var_1_0:GetDataSource().desc:GetValue(var_1_1)

		if var_4_0 ~= nil then
			var_1_14:setText(LocalizeString(var_4_0), 0)
		end
	end

	var_1_14:SubscribeToModelThroughElement(var_1_0, "desc", var_1_15)
	var_1_0:addElement(var_1_14)

	var_1_0.Description = var_1_14

	local var_1_16

	if not CONDITIONS.IsThirdGameMode(var_1_0) then
		var_1_16 = LUI.UIStyledText.new()
		var_1_16.id = "ItemName"

		var_1_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_1_16:SetAlignment(LUI.Alignment.Left)
		var_1_16:SetOptOutRightToLeftAlignmentFlip(true)
		var_1_16:SetDecodeLetterLength(30)
		var_1_16:SetDecodeMaxRandChars(6)
		var_1_16:SetDecodeUpdatesPerLetter(4)
		var_1_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 18, _1080p * 502, _1080p * -126, _1080p * -88)

		local function var_1_17()
			local var_5_0 = var_1_0:GetDataSource().text:GetValue(var_1_1)

			if var_5_0 ~= nil then
				var_1_16:setText(LocalizeString(var_5_0), 0)
			end
		end

		var_1_16:SubscribeToModelThroughElement(var_1_0, "text", var_1_17)
		var_1_0:addElement(var_1_16)

		var_1_0.ItemName = var_1_16
	end

	local var_1_18
	local var_1_19 = LUI.UIStyledText.new()

	var_1_19.id = "Total"

	var_1_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_19:SetAlignment(LUI.Alignment.Center)
	var_1_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_19:SetShadowMinDistance(-0.2, 0)
	var_1_19:SetShadowMaxDistance(0.2, 0)
	var_1_19:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -510, _1080p * -260, _1080p * -116, _1080p * -96)

	local function var_1_20()
		local var_6_0 = var_1_0:GetDataSource().count:GetValue(var_1_1)

		if var_6_0 ~= nil then
			var_1_19:setText(LocalizeIntoString(var_6_0, "LUA_MENU_MP/MEDAL_TIMES_USED"), 0)
		end
	end

	var_1_19:SubscribeToModelThroughElement(var_1_0, "count", var_1_20)
	var_1_0:addElement(var_1_19)

	var_1_0.Total = var_1_19

	local function var_1_21()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_21

	local var_1_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Locked", var_1_22)

	local var_1_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("Locked", var_1_23)

	local var_1_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_1_10:RegisterAnimationSequence("Locked", var_1_24)

	local var_1_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_19:RegisterAnimationSequence("Locked", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("Locked")
		var_1_7:AnimateSequence("Locked")
		var_1_10:AnimateSequence("Locked")
		var_1_19:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_26

	local var_1_27 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.75,
			duration = 400,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_1_4:RegisterAnimationSequence("Unlocked", var_1_27)

	local var_1_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_1_7:RegisterAnimationSequence("Unlocked", var_1_28)

	local var_1_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Unlocked", var_1_29)

	local var_1_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_19:RegisterAnimationSequence("Unlocked", var_1_30)

	local function var_1_31()
		var_1_4:AnimateSequence("Unlocked")
		var_1_7:AnimateSequence("Unlocked")
		var_1_10:AnimateSequence("Unlocked")
		var_1_19:AnimateSequence("Unlocked")
	end

	var_1_0._sequences.Unlocked = var_1_31

	local var_1_32 = {
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 400,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_1_4:RegisterAnimationSequence("UnlockedNoCount", var_1_32)

	local var_1_33 = {
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_1_7:RegisterAnimationSequence("UnlockedNoCount", var_1_33)

	local var_1_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_19:RegisterAnimationSequence("UnlockedNoCount", var_1_34)

	local function var_1_35()
		var_1_4:AnimateSequence("UnlockedNoCount")
		var_1_7:AnimateSequence("UnlockedNoCount")
		var_1_19:AnimateSequence("UnlockedNoCount")
	end

	var_1_0._sequences.UnlockedNoCount = var_1_35

	local function var_1_36()
		if var_1_0:GetDataSource().achieved:GetValue(var_1_1) ~= nil and var_1_0:GetDataSource().achieved:GetValue(var_1_1) == true and var_1_0:GetDataSource().count:GetValue(var_1_1) ~= nil and var_1_0:GetDataSource().count:GetValue(var_1_1) > 0 then
			ACTIONS.AnimateSequence(var_1_0, "Unlocked")
		end

		if var_1_0:GetDataSource().achieved:GetValue(var_1_1) ~= nil and var_1_0:GetDataSource().achieved:GetValue(var_1_1) == false then
			ACTIONS.AnimateSequence(var_1_0, "Locked")
		end

		if var_1_0:GetDataSource().achieved:GetValue(var_1_1) ~= nil and var_1_0:GetDataSource().achieved:GetValue(var_1_1) == true and var_1_0:GetDataSource().count:GetValue(var_1_1) ~= nil and var_1_0:GetDataSource().count:GetValue(var_1_1) <= 0 then
			ACTIONS.AnimateSequence(var_1_0, "UnlockedNoCount")
		end
	end

	var_1_0:SubscribeToModelThroughElement(var_1_0, "achieved", var_1_36)
	var_1_0:SubscribeToModelThroughElement(var_1_0, "count", var_1_36)

	return var_1_0
end

MenuBuilder.registerType("MedalInfo", MedalInfo)
LockTable(_M)
