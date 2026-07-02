module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().achieved:GetValue(arg_1_1)
		local var_2_1 = arg_1_0:GetDataSource().count:GetValue(arg_1_1)

		if var_2_0 then
			if var_2_1 <= 0 then
				ACTIONS.AnimateSequence(arg_1_0, "UnlockedNoCount")
			else
				ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
			end

			arg_1_0:SetButtonDisabled(false)
		else
			ACTIONS.AnimateSequence(arg_1_0, "Locked")
			arg_1_0:SetButtonDisabled(true)
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "achieved", var_1_0)
end

function MedalButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 155 * _1080p, 0, 155 * _1080p)

	var_3_0.id = "MedalButton"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3

	if Engine.DDJFBBJAIG() then
		local var_3_4 = LUI.UIImage.new()

		var_3_4.id = "DropShadow"

		var_3_4:SetRGBFromInt(0, 0)
		var_3_4:SetAlpha(0.3, 0)
		var_3_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
		var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
		var_3_0:addElement(var_3_4)

		var_3_0.DropShadow = var_3_4
	end

	local var_3_5
	local var_3_6 = LUI.UIBlur.new()

	var_3_6.id = "Blur"

	var_3_6:SetBlurStrength(2.75, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Blur = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericItemBackground", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Background"

	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Background = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Icon"

	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 26, _1080p * 154)

	local function var_3_11()
		local var_4_0 = var_3_0:GetDataSource().icon:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_10:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	var_3_10:SubscribeToModelThroughElement(var_3_0, "icon", var_3_11)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local var_3_12
	local var_3_13 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_3_1
	})

	var_3_13.id = "Selection"

	var_3_13:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_3_0:addElement(var_3_13)

	var_3_0.Selection = var_3_13

	local var_3_14

	if Engine.DDJFBBJAIG() then
		local var_3_15 = MenuBuilder.BuildRegisteredType("GenericListButtonBackground", {
			controllerIndex = var_3_1
		})

		var_3_15.id = "TitleBG"

		var_3_15.DropShadow:SetAlpha(0, 0)
		var_3_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
		var_3_0:addElement(var_3_15)

		var_3_0.TitleBG = var_3_15
	end

	local var_3_16
	local var_3_17 = LUI.UIStyledText.new()

	var_3_17.id = "TitleLabel"

	var_3_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_17:SetAlignment(LUI.Alignment.Left)
	var_3_17:SetStartupDelay(1000)
	var_3_17:SetLineHoldTime(500)
	var_3_17:SetAnimMoveTime(500)
	var_3_17:SetEndDelay(1000)
	var_3_17:SetCrossfadeTime(500)
	var_3_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_17:SetMaxVisibleLines(1)
	var_3_17:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 13, 0, _1080p * 2.5, _1080p * 21.5)

	local function var_3_18()
		local var_5_0 = var_3_0:GetDataSource().text:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_17:setText(LocalizeString(var_5_0), 0)
		end
	end

	var_3_17:SubscribeToModelThroughElement(var_3_0, "text", var_3_18)
	var_3_0:addElement(var_3_17)

	var_3_0.TitleLabel = var_3_17

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "Count"

	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Right)
	var_3_20:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 5, _1080p * -5, _1080p * -22, 0)

	local function var_3_21()
		local var_6_0 = var_3_0:GetDataSource().count:GetValue(var_3_1)

		if var_6_0 ~= nil then
			var_3_20:setText(LocalizeIntoString(var_6_0, "LUA_MENU_MP/RULES_MULTIPLIER"), 0)
		end
	end

	var_3_20:SubscribeToModelThroughElement(var_3_0, "count", var_3_21)
	var_3_0:addElement(var_3_20)

	var_3_0.Count = var_3_20

	local var_3_22
	local var_3_23 = LUI.UIImage.new()

	var_3_23.id = "Lock"

	var_3_23:SetAlpha(0, 0)
	var_3_23:setImage(RegisterMaterial("icon_slot_locked"), 0)
	var_3_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -4, _1080p * 28)
	var_3_0:addElement(var_3_23)

	var_3_0.Lock = var_3_23

	local var_3_24 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_17:RegisterAnimationSequence("DefaultSequence", var_3_24)

	local function var_3_25()
		var_3_17:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_25

	local var_3_26 = {
		{
			value = 0.05,
			duration = 50,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOver", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_17:RegisterAnimationSequence("ButtonOver", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_3_20:RegisterAnimationSequence("ButtonOver", var_3_28)

	local function var_3_29()
		var_3_10:AnimateSequence("ButtonOver")
		var_3_17:AnimateSequence("ButtonOver")
		var_3_20:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_29

	local var_3_30 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonUp", var_3_30)

	local var_3_31 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_17:RegisterAnimationSequence("ButtonUp", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_3_20:RegisterAnimationSequence("ButtonUp", var_3_32)

	local function var_3_33()
		var_3_10:AnimateSequence("ButtonUp")
		var_3_17:AnimateSequence("ButtonUp")
		var_3_20:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_33

	local var_3_34 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("Locked", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Locked", var_3_35)

	local var_3_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("Locked", var_3_36)

	local function var_3_37()
		var_3_10:AnimateSequence("Locked")
		var_3_20:AnimateSequence("Locked")
		var_3_23:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_37

	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("Unlocked", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Unlocked", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("Unlocked", var_3_40)

	local function var_3_41()
		var_3_10:AnimateSequence("Unlocked")
		var_3_20:AnimateSequence("Unlocked")
		var_3_23:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_41

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("UnlockedNoCount", var_3_42)

	local function var_3_43()
		var_3_20:AnimateSequence("UnlockedNoCount")
	end

	var_3_0._sequences.UnlockedNoCount = var_3_43

	var_3_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("MedalButton", MedalButton)
LockTable(_M)
