module(..., package.seeall)

function ButtonLayoutPrompts(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 219 * _1080p)

	var_1_0.id = "ButtonLayoutPrompts"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "ButtonSelectPrompt"

	var_1_4.Image:SetRight(_1080p * 28, 0)
	var_1_4.Image:setImage(RegisterMaterial("button_select"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 234, _1080p * 262)

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().selectColor:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4.Text:SetRGBFromInt(var_2_0, 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "selectColor", var_1_5)

	local function var_1_6()
		local var_3_0 = var_1_0:GetDataSource().select:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_4.Text:setText(var_3_0, 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "select", var_1_6)
	var_1_0:addElement(var_1_4)

	var_1_0.ButtonSelectPrompt = var_1_4

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "ButtonRightStickPrompt"

	var_1_8.Image:SetRight(_1080p * 28, 0)
	var_1_8.Image:setImage(RegisterMaterial("button_stick_right_anim"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 234, _1080p * 262)

	local function var_1_9()
		local var_4_0 = var_1_0:GetDataSource().rightStickColor:GetValue(var_1_1)

		if var_4_0 ~= nil then
			var_1_8.Text:SetRGBFromInt(var_4_0, 0)
		end
	end

	var_1_8:SubscribeToModelThroughElement(var_1_0, "rightStickColor", var_1_9)

	local function var_1_10()
		local var_5_0 = var_1_0:GetDataSource().rightStick:GetValue(var_1_1)

		if var_5_0 ~= nil then
			var_1_8.Text:setText(var_5_0, 0)
		end
	end

	var_1_8:SubscribeToModelThroughElement(var_1_0, "rightStick", var_1_10)
	var_1_0:addElement(var_1_8)

	var_1_0.ButtonRightStickPrompt = var_1_8

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "ButtonLeftStickPrompt"

	var_1_12.Image:SetRight(_1080p * 28, 0)
	var_1_12.Image:setImage(RegisterMaterial("button_stick_left_anim"), 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 188, _1080p * 216)

	local function var_1_13()
		local var_6_0 = var_1_0:GetDataSource().leftStickColor:GetValue(var_1_1)

		if var_6_0 ~= nil then
			var_1_12.Text:SetRGBFromInt(var_6_0, 0)
		end
	end

	var_1_12:SubscribeToModelThroughElement(var_1_0, "leftStickColor", var_1_13)

	local function var_1_14()
		local var_7_0 = var_1_0:GetDataSource().leftStick:GetValue(var_1_1)

		if var_7_0 ~= nil then
			var_1_12.Text:setText(var_7_0, 0)
		end
	end

	var_1_12:SubscribeToModelThroughElement(var_1_0, "leftStick", var_1_14)
	var_1_0:addElement(var_1_12)

	var_1_0.ButtonLeftStickPrompt = var_1_12

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "ButtonAlt2Prompt"

	var_1_16.Image:SetRight(_1080p * 28, 0)
	var_1_16.Image:setImage(RegisterMaterial("button_alt2"), 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 141, _1080p * 169)

	local function var_1_17()
		local var_8_0 = var_1_0:GetDataSource().altTwoColor:GetValue(var_1_1)

		if var_8_0 ~= nil then
			var_1_16.Text:SetRGBFromInt(var_8_0, 0)
		end
	end

	var_1_16:SubscribeToModelThroughElement(var_1_0, "altTwoColor", var_1_17)

	local function var_1_18()
		local var_9_0 = var_1_0:GetDataSource().altTwo:GetValue(var_1_1)

		if var_9_0 ~= nil then
			var_1_16.Text:setText(var_9_0, 0)
		end
	end

	var_1_16:SubscribeToModelThroughElement(var_1_0, "altTwo", var_1_18)
	var_1_0:addElement(var_1_16)

	var_1_0.ButtonAlt2Prompt = var_1_16

	local var_1_19
	local var_1_20 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_20.id = "ButtonAlt1Prompt"

	var_1_20.Image:SetRight(_1080p * 28, 0)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 94, _1080p * 122)

	local function var_1_21()
		local var_10_0 = var_1_0:GetDataSource().altOneColor:GetValue(var_1_1)

		if var_10_0 ~= nil then
			var_1_20.Text:SetRGBFromInt(var_10_0, 0)
		end
	end

	var_1_20:SubscribeToModelThroughElement(var_1_0, "altOneColor", var_1_21)

	local function var_1_22()
		local var_11_0 = var_1_0:GetDataSource().altOne:GetValue(var_1_1)

		if var_11_0 ~= nil then
			var_1_20.Text:setText(var_11_0, 0)
		end
	end

	var_1_20:SubscribeToModelThroughElement(var_1_0, "altOne", var_1_22)
	var_1_0:addElement(var_1_20)

	var_1_0.ButtonAlt1Prompt = var_1_20

	local var_1_23
	local var_1_24 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_24.id = "ButtonSecondaryPrompt"

	var_1_24.Image:SetRight(_1080p * 28, 0)
	var_1_24.Image:setImage(RegisterMaterial("button_secondary"), 0)
	var_1_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 347, _1080p * 47, _1080p * 75)

	local function var_1_25()
		local var_12_0 = var_1_0:GetDataSource().secondaryColor:GetValue(var_1_1)

		if var_12_0 ~= nil then
			var_1_24.Text:SetRGBFromInt(var_12_0, 0)
		end
	end

	var_1_24:SubscribeToModelThroughElement(var_1_0, "secondaryColor", var_1_25)

	local function var_1_26()
		local var_13_0 = var_1_0:GetDataSource().secondary:GetValue(var_1_1)

		if var_13_0 ~= nil then
			var_1_24.Text:setText(var_13_0, 0)
		end
	end

	var_1_24:SubscribeToModelThroughElement(var_1_0, "secondary", var_1_26)
	var_1_0:addElement(var_1_24)

	var_1_0.ButtonSecondaryPrompt = var_1_24

	local var_1_27
	local var_1_28 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_28.id = "ButtonPrimaryPrompt"

	var_1_28.Image:SetRight(_1080p * 28, 0)
	var_1_28.Image:setImage(RegisterMaterial("button_primary"), 0)
	var_1_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 347, 0, _1080p * 28)

	local function var_1_29()
		local var_14_0 = var_1_0:GetDataSource().primaryColor:GetValue(var_1_1)

		if var_14_0 ~= nil then
			var_1_28.Text:SetRGBFromInt(var_14_0, 0)
		end
	end

	var_1_28:SubscribeToModelThroughElement(var_1_0, "primaryColor", var_1_29)

	local function var_1_30()
		local var_15_0 = var_1_0:GetDataSource().primary:GetValue(var_1_1)

		if var_15_0 ~= nil then
			var_1_28.Text:setText(var_15_0, 0)
		end
	end

	var_1_28:SubscribeToModelThroughElement(var_1_0, "primary", var_1_30)
	var_1_0:addElement(var_1_28)

	var_1_0.ButtonPrimaryPrompt = var_1_28

	local var_1_31
	local var_1_32 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_32.id = "ButtonOptionPrompt"

	var_1_32.Image:SetRight(_1080p * 28, 0)
	var_1_32.Image:setImage(RegisterMaterial("button_start"), 0)
	var_1_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 281, _1080p * 309)

	local function var_1_33()
		local var_16_0 = var_1_0:GetDataSource().startColor:GetValue(var_1_1)

		if var_16_0 ~= nil then
			var_1_32.Text:SetRGBFromInt(var_16_0, 0)
		end
	end

	var_1_32:SubscribeToModelThroughElement(var_1_0, "startColor", var_1_33)

	local function var_1_34()
		local var_17_0 = var_1_0:GetDataSource().start:GetValue(var_1_1)

		if var_17_0 ~= nil then
			var_1_32.Text:setText(var_17_0, 0)
		end
	end

	var_1_32:SubscribeToModelThroughElement(var_1_0, "start", var_1_34)
	var_1_0:addElement(var_1_32)

	var_1_0.ButtonOptionPrompt = var_1_32

	local var_1_35
	local var_1_36 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_36.id = "ButtonDPADPrompt"

	var_1_36.Image:SetRight(_1080p * 28, 0)
	var_1_36.Image:setImage(RegisterMaterial("button_dpad"), 0)
	var_1_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 188, _1080p * 216)

	local function var_1_37()
		local var_18_0 = var_1_0:GetDataSource().dPadColor:GetValue(var_1_1)

		if var_18_0 ~= nil then
			var_1_36.Text:SetRGBFromInt(var_18_0, 0)
		end
	end

	var_1_36:SubscribeToModelThroughElement(var_1_0, "dPadColor", var_1_37)

	local function var_1_38()
		local var_19_0 = var_1_0:GetDataSource().dPad:GetValue(var_1_1)

		if var_19_0 ~= nil then
			var_1_36.Text:setText(var_19_0, 0)
		end
	end

	var_1_36:SubscribeToModelThroughElement(var_1_0, "dPad", var_1_38)
	var_1_0:addElement(var_1_36)

	var_1_0.ButtonDPADPrompt = var_1_36

	local var_1_39
	local var_1_40 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_40.id = "ButtonTriggerRightPrompt"

	var_1_40.Image:SetRight(_1080p * 28, 0)
	var_1_40.Image:setImage(RegisterMaterial("button_trigger_right"), 0)
	var_1_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 319, _1080p * 141, _1080p * 169)

	local function var_1_41()
		local var_20_0 = var_1_0:GetDataSource().rightTriggerColor:GetValue(var_1_1)

		if var_20_0 ~= nil then
			var_1_40.Text:SetRGBFromInt(var_20_0, 0)
		end
	end

	var_1_40:SubscribeToModelThroughElement(var_1_0, "rightTriggerColor", var_1_41)

	local function var_1_42()
		local var_21_0 = var_1_0:GetDataSource().rightTrigger:GetValue(var_1_1)

		if var_21_0 ~= nil then
			var_1_40.Text:setText(var_21_0, 0)
		end
	end

	var_1_40:SubscribeToModelThroughElement(var_1_0, "rightTrigger", var_1_42)
	var_1_0:addElement(var_1_40)

	var_1_0.ButtonTriggerRightPrompt = var_1_40

	local var_1_43
	local var_1_44 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_44.id = "ButtonShoulderRightPrompt"

	var_1_44.Image:SetRight(_1080p * 28, 0)
	var_1_44.Image:setImage(RegisterMaterial("button_shoulder_right"), 0)
	var_1_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 47, _1080p * 75)

	local function var_1_45()
		local var_22_0 = var_1_0:GetDataSource().rightShoulderColor:GetValue(var_1_1)

		if var_22_0 ~= nil then
			var_1_44.Text:SetRGBFromInt(var_22_0, 0)
		end
	end

	var_1_44:SubscribeToModelThroughElement(var_1_0, "rightShoulderColor", var_1_45)

	local function var_1_46()
		local var_23_0 = var_1_0:GetDataSource().rightShoulder:GetValue(var_1_1)

		if var_23_0 ~= nil then
			var_1_44.Text:setText(var_23_0, 0)
		end
	end

	var_1_44:SubscribeToModelThroughElement(var_1_0, "rightShoulder", var_1_46)
	var_1_0:addElement(var_1_44)

	var_1_0.ButtonShoulderRightPrompt = var_1_44

	local var_1_47
	local var_1_48 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_48.id = "ButtonTriggerLeftPrompt"

	var_1_48.Image:SetRight(_1080p * 28, 0)
	var_1_48.Image:setImage(RegisterMaterial("button_trigger_left"), 0)
	var_1_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, _1080p * 94, _1080p * 122)

	local function var_1_49()
		local var_24_0 = var_1_0:GetDataSource().leftTriggerColor:GetValue(var_1_1)

		if var_24_0 ~= nil then
			var_1_48.Text:SetRGBFromInt(var_24_0, 0)
		end
	end

	var_1_48:SubscribeToModelThroughElement(var_1_0, "leftTriggerColor", var_1_49)

	local function var_1_50()
		local var_25_0 = var_1_0:GetDataSource().leftTrigger:GetValue(var_1_1)

		if var_25_0 ~= nil then
			var_1_48.Text:setText(var_25_0, 0)
		end
	end

	var_1_48:SubscribeToModelThroughElement(var_1_0, "leftTrigger", var_1_50)
	var_1_0:addElement(var_1_48)

	var_1_0.ButtonTriggerLeftPrompt = var_1_48

	local var_1_51
	local var_1_52 = MenuBuilder.BuildRegisteredType("ButtonLayoutPrompt", {
		controllerIndex = var_1_1
	})

	var_1_52.id = "ButtonShoulderLeftPrompt"

	var_1_52.Image:SetRight(_1080p * 28, 0)
	var_1_52.Image:setImage(RegisterMaterial("button_shoulder_left"), 0)
	var_1_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 320, 0, _1080p * 28)

	local function var_1_53()
		local var_26_0 = var_1_0:GetDataSource().leftShoulderColor:GetValue(var_1_1)

		if var_26_0 ~= nil then
			var_1_52.Text:SetRGBFromInt(var_26_0, 0)
		end
	end

	var_1_52:SubscribeToModelThroughElement(var_1_0, "leftShoulderColor", var_1_53)

	local function var_1_54()
		local var_27_0 = var_1_0:GetDataSource().leftShoulder:GetValue(var_1_1)

		if var_27_0 ~= nil then
			var_1_52.Text:setText(var_27_0, 0)
		end
	end

	var_1_52:SubscribeToModelThroughElement(var_1_0, "leftShoulder", var_1_54)
	var_1_0:addElement(var_1_52)

	var_1_0.ButtonShoulderLeftPrompt = var_1_52

	local function var_1_55()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_55

	local var_1_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonLeftPrompts", var_1_56)

	local var_1_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonLeftPrompts", var_1_57)

	local var_1_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonLeftPrompts", var_1_58)

	local var_1_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("ButtonLeftPrompts", var_1_59)

	local var_1_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("ButtonLeftPrompts", var_1_60)

	local var_1_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_24:RegisterAnimationSequence("ButtonLeftPrompts", var_1_61)

	local var_1_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_28:RegisterAnimationSequence("ButtonLeftPrompts", var_1_62)

	local var_1_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_32:RegisterAnimationSequence("ButtonLeftPrompts", var_1_63)

	local var_1_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_36:RegisterAnimationSequence("ButtonLeftPrompts", var_1_64)

	local var_1_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_40:RegisterAnimationSequence("ButtonLeftPrompts", var_1_65)

	local var_1_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_44:RegisterAnimationSequence("ButtonLeftPrompts", var_1_66)

	local var_1_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_48:RegisterAnimationSequence("ButtonLeftPrompts", var_1_67)

	local var_1_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_52:RegisterAnimationSequence("ButtonLeftPrompts", var_1_68)

	local function var_1_69()
		var_1_4:AnimateSequence("ButtonLeftPrompts")
		var_1_8:AnimateSequence("ButtonLeftPrompts")
		var_1_12:AnimateSequence("ButtonLeftPrompts")
		var_1_16:AnimateSequence("ButtonLeftPrompts")
		var_1_20:AnimateSequence("ButtonLeftPrompts")
		var_1_24:AnimateSequence("ButtonLeftPrompts")
		var_1_28:AnimateSequence("ButtonLeftPrompts")
		var_1_32:AnimateSequence("ButtonLeftPrompts")
		var_1_36:AnimateSequence("ButtonLeftPrompts")
		var_1_40:AnimateSequence("ButtonLeftPrompts")
		var_1_44:AnimateSequence("ButtonLeftPrompts")
		var_1_48:AnimateSequence("ButtonLeftPrompts")
		var_1_52:AnimateSequence("ButtonLeftPrompts")
	end

	var_1_0._sequences.ButtonLeftPrompts = var_1_69

	local var_1_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonRightPrompts", var_1_70)

	local var_1_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonRightPrompts", var_1_71)

	local var_1_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonRightPrompts", var_1_72)

	local var_1_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("ButtonRightPrompts", var_1_73)

	local var_1_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("ButtonRightPrompts", var_1_74)

	local var_1_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_24:RegisterAnimationSequence("ButtonRightPrompts", var_1_75)

	local var_1_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_28:RegisterAnimationSequence("ButtonRightPrompts", var_1_76)

	local var_1_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_32:RegisterAnimationSequence("ButtonRightPrompts", var_1_77)

	local var_1_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_36:RegisterAnimationSequence("ButtonRightPrompts", var_1_78)

	local function var_1_79()
		var_1_4:AnimateSequence("ButtonRightPrompts")
		var_1_8:AnimateSequence("ButtonRightPrompts")
		var_1_12:AnimateSequence("ButtonRightPrompts")
		var_1_16:AnimateSequence("ButtonRightPrompts")
		var_1_20:AnimateSequence("ButtonRightPrompts")
		var_1_24:AnimateSequence("ButtonRightPrompts")
		var_1_28:AnimateSequence("ButtonRightPrompts")
		var_1_32:AnimateSequence("ButtonRightPrompts")
		var_1_36:AnimateSequence("ButtonRightPrompts")
	end

	var_1_0._sequences.ButtonRightPrompts = var_1_79

	return var_1_0
end

MenuBuilder.registerType("ButtonLayoutPrompts", ButtonLayoutPrompts)
LockTable(_M)
