module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_2 == nil or arg_1_2.name == nil or #arg_1_2.name == 0 or arg_1_2.image == nil or #arg_1_2.image == 0 or arg_1_2.type == nil then
		arg_1_3:SetAlpha(0)
	else
		arg_1_3:SetAlpha(1)
		arg_1_3:SetupLootReward(arg_1_1, arg_1_2)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 <= 3 and arg_2_1 or 3

	ACTIONS.AnimateSequence(arg_2_0, "Intro" .. var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2.name == nil or #arg_3_2.name == 0 or arg_3_2.icon == nil or #arg_3_2.icon == 0 or arg_3_2.type == nil or #arg_3_2.type == 0 then
		arg_3_3:SetAlpha(0)
	else
		arg_3_3:SetAlpha(1)
		arg_3_3.Name:setText(arg_3_2.name)
		arg_3_3.Type:setText(arg_3_2.type)
		arg_3_3:SetupImage(arg_3_1, arg_3_2.icon)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local var_4_0 = {
		name = "",
		type = ""
	}

	if arg_4_4 then
		var_4_0.icon = "icon_empty_circle"

		var_0_2(arg_4_0, arg_4_1, var_4_0, arg_4_0.unlockItems[1])

		return
	end

	if arg_4_3 then
		arg_4_0.Title.Text:setText(Engine.CBBHFCGDIC("AAR/UNLOCKED"))

		for iter_4_0 = 1, #arg_4_0.unlockItems do
			var_4_0.name = ""
			var_4_0.type = ""
			var_4_0.icon = nil

			local var_4_1 = arg_4_2[iter_4_0] and arg_4_2[iter_4_0].ID or nil

			if var_4_1 then
				if AAR.IsRankupUnlock(var_4_1) then
					local var_4_2 = AAR.GetUnlockData(arg_4_1, var_4_1)

					if var_4_2 then
						var_4_0.name = var_4_2.name
						var_4_0.type = var_4_2.lootTypeName
						var_4_0.icon = var_4_2.icon
					end

					var_0_2(arg_4_0, arg_4_1, var_4_0, arg_4_0.unlockItems[iter_4_0])
				else
					local var_4_3 = LOOT.GetLootCardData(arg_4_1, var_4_1)

					var_0_0(arg_4_0, arg_4_1, var_4_3, arg_4_0.unlockItems[iter_4_0])
				end
			end
		end
	else
		local var_4_4 = arg_4_2[1] and arg_4_2[1].ID or nil

		if var_4_4 then
			if AAR.IsRankupUnlock(var_4_4) then
				local var_4_5 = AAR.GetUnlockData(arg_4_1, var_4_4)

				if var_4_5 then
					arg_4_0.Title.Text:setText(Engine.CBBHFCGDIC("AAR/RECENT_UNLOCKS"))

					var_4_0.name = var_4_5.name
					var_4_0.type = var_4_5.lootTypeName
					var_4_0.icon = var_4_5.icon
				end

				var_0_2(arg_4_0, arg_4_1, var_4_0, arg_4_0.unlockItems[1])
			else
				local var_4_6 = LOOT.GetLootCardData(arg_4_1, var_4_4)

				var_0_0(arg_4_0, arg_4_1, var_4_6, arg_4_0.unlockItems[1])
			end
		end
	end
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InitUnlock = var_0_3
	arg_5_0.SetUpUnlockData = var_0_2
	arg_5_0.PlayIntro = var_0_1
	arg_5_0.unlockItems = {
		arg_5_0.UnlockItem1,
		arg_5_0.UnlockItem2,
		arg_5_0.UnlockItem3
	}
end

function AARUnlocks(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 360 * _1080p)

	var_6_0.id = "AARUnlocks"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:setUseStencil(true)

	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Background"

	var_6_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "UnlockItem3"

	var_6_6:SetAlpha(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 588, _1080p * 1138, _1080p * 47, _1080p * 317)
	var_6_0:addElement(var_6_6)

	var_6_0.UnlockItem3 = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "UnlockItem2"

	var_6_8:SetAlpha(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 588, _1080p * 1138, _1080p * 47, _1080p * 317)
	var_6_0:addElement(var_6_8)

	var_6_0.UnlockItem2 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "UnlockItem1"

	var_6_10:SetAlpha(0, 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 550, _1080p * 47, _1080p * 317)
	var_6_0:addElement(var_6_10)

	var_6_0.UnlockItem1 = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Title"

	var_6_12.Text:setText(Engine.CBBHFCGDIC("AAR/UNLOCKED"), 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_6_0:addElement(var_6_12)

	var_6_0.Title = var_6_12

	local function var_6_13()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_13

	local var_6_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1688
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1138
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1688
		}
	}

	var_6_6:RegisterAnimationSequence("Intro1", var_6_14)

	local var_6_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 588
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1138
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 588
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1138
		}
	}

	var_6_8:RegisterAnimationSequence("Intro1", var_6_15)

	local var_6_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		}
	}

	var_6_10:RegisterAnimationSequence("Intro1", var_6_16)

	local function var_6_17()
		var_6_6:AnimateSequence("Intro1")
		var_6_8:AnimateSequence("Intro1")
		var_6_10:AnimateSequence("Intro1")
	end

	var_6_0._sequences.Intro1 = var_6_17

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 757
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1127
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Intro3", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 385
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 755
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Intro3", var_6_19)

	local var_6_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 385
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Intro3", var_6_20)

	local function var_6_21()
		var_6_6:AnimateSequence("Intro3")
		var_6_8:AnimateSequence("Intro3")
		var_6_10:AnimateSequence("Intro3")
	end

	var_6_0._sequences.Intro3 = var_6_21

	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1688
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1138
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1688
		}
	}

	var_6_6:RegisterAnimationSequence("Intro2", var_6_22)

	local var_6_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 588
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1138
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 588
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1138
		}
	}

	var_6_8:RegisterAnimationSequence("Intro2", var_6_23)

	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		}
	}

	var_6_10:RegisterAnimationSequence("Intro2", var_6_24)

	local function var_6_25()
		var_6_6:AnimateSequence("Intro2")
		var_6_8:AnimateSequence("Intro2")
		var_6_10:AnimateSequence("Intro2")
	end

	var_6_0._sequences.Intro2 = var_6_25

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("AARUnlocks", AARUnlocks)
LockTable(_M)
