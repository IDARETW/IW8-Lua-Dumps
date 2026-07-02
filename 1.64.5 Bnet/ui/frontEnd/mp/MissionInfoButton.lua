module(..., package.seeall)

local var_0_0 = "frontEnd.MP.missionInfoButton"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TabA)
	assert(arg_1_0.TabB)

	local var_1_0 = arg_1_1:GetCountValue(arg_1_2)

	if var_1_0 == 1 then
		ACTIONS.AnimateSequence(arg_1_0.TabA, "Locked")
		ACTIONS.AnimateSequence(arg_1_0.TabB, "Locked")
	elseif var_1_0 == 2 then
		ACTIONS.AnimateSequence(arg_1_0.TabA, "Unlocked")
		ACTIONS.AnimateSequence(arg_1_0.TabB, "Locked")
	elseif var_1_0 == 3 then
		ACTIONS.AnimateSequence(arg_1_0.TabA, "Unlocked")
		ACTIONS.AnimateSequence(arg_1_0.TabB, "Unlocked")
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_0.MissionArrowButton)

	local var_2_0 = arg_2_0.MissionArrowButton
	local var_2_1 = arg_2_2
	local var_2_2 = arg_2_1:GetCountValue(arg_2_3)

	if var_2_2 > 1 then
		if var_2_1 == 1 then
			var_2_0.ArrowLeft:SetAlpha(0)
			var_2_0.ArrowRight:SetAlpha(1)
		elseif var_2_1 == 2 and var_2_2 == 2 then
			var_2_0.ArrowLeft:SetAlpha(1)
			var_2_0.ArrowRight:SetAlpha(0)
		elseif var_2_1 == 2 and var_2_2 == 3 then
			var_2_0.ArrowLeft:SetAlpha(1)
			var_2_0.ArrowRight:SetAlpha(1)
		elseif var_2_1 == 3 then
			var_2_0.ArrowLeft:SetAlpha(1)
			var_2_0.ArrowRight:SetAlpha(0)
		end
	else
		var_2_0.ArrowLeft:SetAlpha(0)
		var_2_0.ArrowRight:SetAlpha(0)
	end

	ACTIONS.AnimateSequence(arg_2_0, "Slot" .. arg_2_2)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	return function(arg_4_0, arg_4_1)
		var_0_2(arg_3_0, arg_3_2, arg_4_0, arg_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	return function(arg_6_0)
		assert(arg_6_0.Text)
		assert(arg_6_0.TextCompletion)
		assert(arg_6_0.MissionsHonours)

		local var_6_0 = arg_5_0:GetDataSourceAtIndex(arg_6_0.currentValue - 1, arg_5_1)

		if arg_6_0.currentInfoButtonSubscription then
			arg_6_0.Text:UnsubscribeFromModel(arg_6_0.currentInfoButtonSubscription)
		end

		arg_6_0.currentInfoButtonSubscription = arg_6_0.Text:SubscribeToModel(var_6_0.name:GetModel(arg_5_1), function()
			local var_7_0 = var_6_0.name:GetValue(arg_5_1)

			if var_7_0 ~= arg_6_0.Text:getText() then
				arg_6_0.Text:setText(var_7_0, 0)
			end

			local var_7_1 = ToUpperCase(tostring(var_6_0.target:GetValue(arg_5_1)))

			if var_7_1 ~= arg_6_0.TextCompletion:getText() then
				arg_6_0.TextCompletion:setText(var_7_1, 0)
			end

			local var_7_2 = tostring(var_6_0.bonus1:GetValue(arg_5_1))
			local var_7_3 = tostring(var_6_0.bonus2:GetValue(arg_5_1))
			local var_7_4 = tostring(var_6_0.bonus3:GetValue(arg_5_1))

			arg_6_0.MissionsHonours:UpdateHonors(var_7_2, var_7_3, var_7_4)
		end)
	end
end

function PostLoadFunc(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.MissionArrowButton)

	local var_8_0 = false

	local function var_8_1()
		local var_9_0 = arg_8_0:GetDataSource().teamID:GetValue(arg_8_1)
		local var_9_1
		local var_9_2
		local var_9_3 = 0

		for iter_9_0 = 0, var_9_1:GetCountValue(arg_8_1) - 1 do
			if var_9_2 == var_9_1:GetDataSourceAtIndex(iter_9_0, arg_8_1).index:GetValue(arg_8_1) then
				var_9_3 = iter_9_0
			end
		end

		local var_9_4 = {
			min = 1,
			action = var_0_3(arg_8_0, var_9_0, var_9_1),
			defaultValue = var_9_3 + 1,
			max = var_9_1:GetCountValue(arg_8_1),
			UpdateContent = var_0_4(var_9_1, arg_8_1)
		}

		LUI.AddUICustomArrowButtonLogic(arg_8_0.MissionArrowButton, arg_8_1, var_9_4)

		if not arg_8_0.MissionArrowButton.bindButton then
			local var_9_5 = LUI.UIBindButton.new()

			var_9_5.id = "selfBindButton"

			arg_8_0.MissionArrowButton:addElement(var_9_5)

			arg_8_0.MissionArrowButton.bindButton = var_9_5
		end

		var_0_2(arg_8_0, var_9_1, var_9_3 + 1)
		var_0_1(arg_8_0, var_9_1, arg_8_1)
	end

	arg_8_0:SubscribeToDataSourceThroughElement(arg_8_0, "teamID", var_8_1).unlinkOnCallback = true
	arg_8_0.modelPath = var_0_0

	arg_8_0:addEventHandler("lose_focus", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_8_0, "ButtonOver")
	end)
	arg_8_0:addEventHandler("gain_focus", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_8_0, "ButtonUp")
	end)
end

function MissionInfoButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 120 * _1080p)

	var_12_0.id = "MissionInfoButton"
	var_12_0._animationSets = {}
	var_12_0._sequences = {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("MissionInfoMiniTab", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "TabA"

	var_12_4.NumText:setText("2", 0)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 440, _1080p * 470, _1080p * 30, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.TabA = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("MissionInfoMiniTab", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "TabB"

	var_12_6.NumText:setText("3", 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 470, _1080p * 500, _1080p * 30, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.TabB = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("MissionArrowButton", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "MissionArrowButton"

	var_12_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_12_8.NumText:setText("1", 0)
	var_12_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -60, _1080p * 30, 0)
	var_12_0:addElement(var_12_8)

	var_12_0.MissionArrowButton = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIBlur.new()

	var_12_10.id = "HeaderBackground"

	var_12_10:SetRGBFromInt(4210752, 0)
	var_12_10:SetBlurStrength(2.5, 0)
	var_12_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_12_0:addElement(var_12_10)

	var_12_0.HeaderBackground = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIStyledText.new()

	var_12_12.id = "HeaderText"

	var_12_12:SetRGBFromTable(SWATCHES.MissionSelectButton.titleText, 0)
	var_12_12:SetAlpha(0.5, 0)
	var_12_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PUBLIC_MATCH_CAPS"), 0)
	var_12_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_12:SetAlignment(LUI.Alignment.Left)
	var_12_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 23, _1080p * -4, _1080p * 5, _1080p * 23)
	var_12_0:addElement(var_12_12)

	var_12_0.HeaderText = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIImage.new()

	var_12_14.id = "HeaderStub"

	var_12_14:SetRGBFromInt(10921638, 0)
	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 13, _1080p * 12, _1080p * 16)
	var_12_0:addElement(var_12_14)

	var_12_0.HeaderStub = var_12_14

	local function var_12_15()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_15

	local var_12_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 440
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = "2",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.TabA.NumText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation,
			child = var_12_0.TabA.Gradient
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Slot1", var_12_16)

	local var_12_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = "3",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.TabB.NumText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation,
			child = var_12_0.TabB.Gradient
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Slot1", var_12_17)

	local var_12_18 = {
		{
			value = "1",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.MissionArrowButton.NumText
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -60
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_8:RegisterAnimationSequence("Slot1", var_12_18)

	local function var_12_19()
		var_12_4:AnimateSequence("Slot1")
		var_12_6:AnimateSequence("Slot1")
		var_12_8:AnimateSequence("Slot1")
	end

	var_12_0._sequences.Slot1 = var_12_19

	local var_12_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = "1",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.TabA.NumText
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation,
			child = var_12_0.TabA.Gradient
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Slot2", var_12_20)

	local var_12_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = "3",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.TabB.NumText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation,
			child = var_12_0.TabB.Gradient
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Slot2", var_12_21)

	local var_12_22 = {
		{
			value = "2",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.MissionArrowButton.NumText
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -30
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_8:RegisterAnimationSequence("Slot2", var_12_22)

	local function var_12_23()
		var_12_4:AnimateSequence("Slot2")
		var_12_6:AnimateSequence("Slot2")
		var_12_8:AnimateSequence("Slot2")
	end

	var_12_0._sequences.Slot2 = var_12_23

	local var_12_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = "1",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.TabA.NumText
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation,
			child = var_12_0.TabA.Gradient
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Slot3", var_12_24)

	local var_12_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = "2",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.TabB.NumText
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation,
			child = var_12_0.TabB.Gradient
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Slot3", var_12_25)

	local var_12_26 = {
		{
			value = "3",
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			child = var_12_0.MissionArrowButton.NumText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_12_8:RegisterAnimationSequence("Slot3", var_12_26)

	local function var_12_27()
		var_12_4:AnimateSequence("Slot3")
		var_12_6:AnimateSequence("Slot3")
		var_12_8:AnimateSequence("Slot3")
	end

	var_12_0._sequences.Slot3 = var_12_27

	local var_12_28 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.titleText
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOver", var_12_28)

	local function var_12_29()
		var_12_12:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_29

	local var_12_30 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.highlight
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUp", var_12_30)

	local function var_12_31()
		var_12_12:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_31

	PostLoadFunc(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("MissionInfoButton", MissionInfoButton)
LockTable(_M)
