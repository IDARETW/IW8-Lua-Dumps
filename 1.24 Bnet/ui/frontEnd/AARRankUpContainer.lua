module(..., package.seeall)

local var_0_0 = 2200
local var_0_1 = 2000
local var_0_2 = 300

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0 = 1, #arg_1_0._unlockWidgets do
		local var_1_0 = arg_1_2 and 0 or var_0_2

		arg_1_0._unlockWidgets[iter_1_0]:SetAlpha(0)
		arg_1_0._unlockWidgets[iter_1_0]:SetAlpha(arg_1_2 and 1 or 0, var_1_0)
	end
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0

	local function var_2_1()
		if arg_2_0._unlockAnimationCounter <= AAR.MAX_UNLOCK_DISPLAY_NUM then
			local var_3_0 = arg_2_0._unlockWidgets[arg_2_0._unlockAnimationCounter]

			if var_3_0 then
				var_3_0:PlayIntro()
				var_3_0:SetAlpha(0)
				var_3_0:SetAlpha(1, var_0_2)

				arg_2_0._unlockAnimationCounter = arg_2_0._unlockAnimationCounter + 1
				arg_2_0:Wait(var_0_2 / 2).onComplete = function()
					return var_2_1()
				end
			end
		end
	end

	var_2_1()
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._unlocks = arg_5_2

	if arg_5_0._unlocks and #arg_5_0._unlocks > 0 then
		for iter_5_0 = 1, AAR.MAX_UNLOCK_DISPLAY_NUM do
			local var_5_0 = arg_5_0._unlocks[iter_5_0]
			local var_5_1 = arg_5_0._unlockWidgets[iter_5_0]

			if var_5_0 then
				var_5_1.Type:setText(AAR.GetUnlockTypeName(var_5_0.lootType))
				var_5_1.Title.Text:setText(var_5_0.name)
				var_5_1:SetUpLayout(arg_5_1, var_5_0.icon)

				var_5_1._unlockTypeSound = SOUND_SETS.aarrewards.unlocks

				if var_5_1.Type == LOOT.itemTypes.WEAPON then
					var_5_1._unlockTypeSound = SOUND_SETS.aarrewards.weaponUnlocks
				elseif var_5_1.Type == LOOT.itemTypes.PERK then
					var_5_1._unlockTypeSound = SOUND_SETS.aarrewards.perkRankUp
				elseif var_5_1.Type == LOOT.itemTypes.STREAK then
					var_5_1._unlockTypeSound = SOUND_SETS.aarrewards.killstreakUnlock
				elseif var_5_1.Type == LOOT.itemTypes.EQUIPMENT then
					var_5_1._unlockTypeSound = SOUND_SETS.aarrewards.equipmentRankUp
				end
			else
				var_5_1.Title.Text:setText("")
				var_5_1.Icon:SetAlpha(0)
			end
		end

		ACTIONS.AnimateSequence(arg_5_0, "UnlocksLayout" .. math.min(#arg_5_0._unlocks, AAR.MAX_UNLOCK_DISPLAY_NUM))
	end
end

local function var_0_6(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0._unlocks and #arg_6_0._unlocks > 0
	local var_6_1 = var_0_0

	if var_6_0 then
		local var_6_2 = math.min(#arg_6_0._unlocks, AAR.MAX_UNLOCK_DISPLAY_NUM)

		var_6_1 = 1000 + var_0_0 + var_6_2 * var_0_2
	end

	ACTIONS.AnimateSequence(arg_6_0.RankUpItem, "Intro")
	arg_6_0.Cinematic:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_6_0, "RankUp")
	Engine.DFCGFCGBFD("mp_aar_rankup")

	arg_6_0:Wait(450).onComplete = function()
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.playerRankUp)
	end
	arg_6_0:Wait(var_0_0).onComplete = function()
		arg_6_0.Cinematic:SetAlpha(0)
		Engine.EBCGADABJ()

		if var_6_0 then
			var_0_4(arg_6_0, arg_6_1)
		end
	end

	return var_6_1
end

local function var_0_7(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = 120
	local var_9_1, var_9_2, var_9_3, var_9_4 = arg_9_0.RankUpItem.RankValue:getLocalRect()

	arg_9_0.RankUpItem.RankValue:SetAnchorsAndPosition(0.5, 0.5, 1, 0, var_9_1, var_9_3, -var_9_0 * _1080p, 0)
	arg_9_0.RankUpItem.RankValue:SetFontSize(var_9_0 * _1080p)
	arg_9_0.RankUpItem.RankValue:setText(arg_9_2.rankDisplay)

	if arg_9_2.rankIcon and #arg_9_2.rankIcon > 0 then
		arg_9_0.RankUpItem.RankIcon:setImage(RegisterMaterial(arg_9_2.rankIcon))
	end

	if arg_9_3 then
		local var_9_5 = var_0_6(arg_9_0, arg_9_1)

		arg_9_0:Wait(var_9_5).onComplete = function()
			arg_9_0._unlockAnimationCounter = 1

			var_0_3(arg_9_0, arg_9_1, false)
			arg_9_0:dispatchEventToCurrentMenu({
				name = AAR.PARADE_PROGRESS_DONE
			})
		end
	end
end

local function var_0_8(arg_11_0, arg_11_1)
	local var_11_0 = var_0_1

	ACTIONS.AnimateSequence(arg_11_0.RankUpItem, "Intro")
	arg_11_0.Cinematic:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_11_0, "RankUp")
	Engine.DFCGFCGBFD("mp_aar_rankup")
	Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.playerRankUp)

	arg_11_0:Wait(var_11_0).onComplete = function()
		arg_11_0.Cinematic:SetAlpha(0)
		Engine.EBCGADABJ()
	end

	return var_11_0
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = 50
	local var_13_1, var_13_2, var_13_3, var_13_4 = arg_13_0.RankUpItem.RankValue:getLocalRect()

	arg_13_0.RankUpItem.RankValue:SetAnchorsAndPosition(0.5, 0.5, 1, 0, var_13_1, var_13_3, -var_13_0 * _1080p, 0)
	arg_13_0.RankUpItem.RankValue:SetFontSize(var_13_0 * _1080p)
	arg_13_0.RankUpItem.RankValue:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/OFFICER_RANK_UNLOCKED")))
	arg_13_0.RankUpItem.RankIcon:setImage(RegisterMaterial("icon_rank_officer_00"))

	local var_13_5 = var_0_8(arg_13_0, arg_13_1)

	arg_13_0:Wait(var_13_5).onComplete = function()
		arg_13_0._unlockAnimationCounter = 1

		var_0_3(arg_13_0, arg_13_1, false)
		arg_13_0:dispatchEventToCurrentMenu({
			name = AAR.PARADE_ELDER_RANK_INTRO_DONE
		})
	end
end

function PostLoadFunc(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._unlockAnimationCounter = 1
	arg_15_0.PlayAARRankUpSequence = var_0_7
	arg_15_0.PlayAARElderRankIntroSequence = var_0_9
	arg_15_0.SetupAARUnlocksData = var_0_5
	arg_15_0._unlockWidgets = {
		arg_15_0.Unlock1,
		arg_15_0.Unlock2,
		arg_15_0.Unlock3
	}
end

function AARRankUpContainer(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_16_0.id = "AARRankUpContainer"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "Cinematic"

	var_16_4:SetAlpha(0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.Cinematic = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("AARParadeUnlockItem", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "Unlock3"

	var_16_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 250, _1080p * 650, _1080p * -735, _1080p * -511)
	var_16_0:addElement(var_16_6)

	var_16_0.Unlock3 = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("AARParadeUnlockItem", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "Unlock2"

	var_16_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -200, _1080p * 200, _1080p * -735, _1080p * -511)
	var_16_0:addElement(var_16_8)

	var_16_0.Unlock2 = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("AARParadeUnlockItem", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "Unlock1"

	var_16_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -650, _1080p * -250, _1080p * -735, _1080p * -511)
	var_16_0:addElement(var_16_10)

	var_16_0.Unlock1 = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("AARRankUpItem", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "RankUpItem"

	var_16_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -180, _1080p * 180, _1080p * -355, _1080p * 159)
	var_16_0:addElement(var_16_12)

	var_16_0.RankUpItem = var_16_12

	local var_16_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("DefaultSequence", var_16_13)

	local var_16_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("DefaultSequence", var_16_14)

	local var_16_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("DefaultSequence", var_16_15)

	local function var_16_16()
		var_16_6:AnimateSequence("DefaultSequence")
		var_16_8:AnimateSequence("DefaultSequence")
		var_16_10:AnimateSequence("DefaultSequence")
	end

	var_16_0._sequences.DefaultSequence = var_16_16

	local var_16_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("RankUp", var_16_17)

	local var_16_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("RankUp", var_16_18)

	local var_16_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("RankUp", var_16_19)

	local function var_16_20()
		var_16_6:AnimateSequence("RankUp")
		var_16_8:AnimateSequence("RankUp")
		var_16_10:AnimateSequence("RankUp")
	end

	var_16_0._sequences.RankUp = var_16_20

	local var_16_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 650
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -735
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -511
		}
	}

	var_16_6:RegisterAnimationSequence("UnlocksLayout3", var_16_21)

	local var_16_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -735
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -511
		}
	}

	var_16_8:RegisterAnimationSequence("UnlocksLayout3", var_16_22)

	local var_16_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -650
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -250
		}
	}

	var_16_10:RegisterAnimationSequence("UnlocksLayout3", var_16_23)

	local function var_16_24()
		var_16_6:AnimateSequence("UnlocksLayout3")
		var_16_8:AnimateSequence("UnlocksLayout3")
		var_16_10:AnimateSequence("UnlocksLayout3")
	end

	var_16_0._sequences.UnlocksLayout3 = var_16_24

	local var_16_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 245
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 324
		}
	}

	var_16_6:RegisterAnimationSequence("UnlocksLayout2", var_16_25)

	local var_16_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -511
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -735
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 445
		}
	}

	var_16_8:RegisterAnimationSequence("UnlocksLayout2", var_16_26)

	local var_16_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		}
	}

	var_16_10:RegisterAnimationSequence("UnlocksLayout2", var_16_27)

	local function var_16_28()
		var_16_6:AnimateSequence("UnlocksLayout2")
		var_16_8:AnimateSequence("UnlocksLayout2")
		var_16_10:AnimateSequence("UnlocksLayout2")
	end

	var_16_0._sequences.UnlocksLayout2 = var_16_28

	local var_16_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 324
		}
	}

	var_16_6:RegisterAnimationSequence("UnlocksLayout1", var_16_29)

	local var_16_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 324
		}
	}

	var_16_8:RegisterAnimationSequence("UnlocksLayout1", var_16_30)

	local var_16_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		}
	}

	var_16_10:RegisterAnimationSequence("UnlocksLayout1", var_16_31)

	local function var_16_32()
		var_16_6:AnimateSequence("UnlocksLayout1")
		var_16_8:AnimateSequence("UnlocksLayout1")
		var_16_10:AnimateSequence("UnlocksLayout1")
	end

	var_16_0._sequences.UnlocksLayout1 = var_16_32

	PostLoadFunc(var_16_0, var_16_1, arg_16_1)
	ACTIONS.AnimateSequence(var_16_0, "DefaultSequence")

	return var_16_0
end

MenuBuilder.registerType("AARRankUpContainer", AARRankUpContainer)
LockTable(_M)
